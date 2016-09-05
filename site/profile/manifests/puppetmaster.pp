# == Class: profiles::puppetmaster
#
#  Install and configure puppetmaster (using theforeman/puppet forge module
#
# === Parameters
#
# [*use_puppetdb*]
#
# Install puppetdb on the master node?
# Default value is looked up in hiera and set as "false" if nothing is found
#
# [*use_puppetboard*]
#
# Install puppetboard on the master node?
# Default value is looked up in hiera and set as "false" if nothing is found
#
# === Examples
#
#  class { 'profiles::puppetmaster':
#    user_puppetdb  => true
#  }
#
# === Authors
#
# Laurent Bernaille
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#

class profile::puppetmaster(
    $use_puppetdb=hiera('profiles::puppetmaster::use_puppetdb',false),
    $use_puppetboard=hiera('profiles::puppetmaster::use_puppetboard',false)
) {

  apt::source { 'puppetlabs':
    location   => 'http://apt.puppetlabs.com',
    repos      => 'main',
    key        => {
      id=> '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30',
      server => 'pgp.mit.edu'
    }
  }->
  class { 'puppetserver':
    config => {
      'java_args'     => {
        'xms'   => '512m',
        'xmx'   => '512m'
      }
    }
  }
  notice($use_puppetdb)

  if $use_puppetdb {
    class { 'puppetdb':
        database          => 'embedded',
    }

    # No anchor in puppetdb module
    # We need ssl certificates to start jetty
    # puppdb ssl-setup is performed at package installaion and requires ssl certificates for the node
    Class['puppet::server']->Package['puppetdb']


    class { 'puppetdb::master::config':
    # Managed by puppet module
      manage_storeconfigs     => false,
      manage_report_processor => false,
      strict_validation       => false
    }

    if $use_puppetboard {

      Python::Virtualenv {
        path => ['/bin', '/usr/bin', '/usr/sbin', '/usr/local/bin' ],
      }

      include apache
      include apache::mod::wsgi
      include puppetboard

      # No anchor in puppetboard module, first resource is group
      Package['virtualenv']->Group['puppetboard']

      # Access Puppetboard vhost
      class { 'puppetboard::apache::vhost':
            vhost_name => hiera('profiles::puppetmaster::puppetboard_vhost',$::fqdn)
      }
    }
  }
}
