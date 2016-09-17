# == Class: profiles::puppetmaster
#
#  Install and configure puppetmaster with remote puppetdb
#
# === Parameters
#
# [*use_puppetdb*]
#
# Install puppetdb on the master node?
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
    $use_puppetdb=hiera('profiles::puppetmaster::use_puppetdb',false)
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

  class { '::puppetserver::hiera::eyaml':
    require => Class['puppetserver::install'],
  }

  if $use_puppetdb {

    class { 'puppetdb::master::config':
      puppetdb_server         => hiera('puppetdb_host'),
      manage_routes           => true,
      manage_storeconfigs     => true,
      manage_report_processor => true,
      enable_reports          => true,
      strict_validation       => false
    }

  }
}
