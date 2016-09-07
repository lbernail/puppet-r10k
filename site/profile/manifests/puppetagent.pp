# == Class: profiles::puppetagent
#
#  Install and configure puppetagent
#
# === Authors
#
# Laurent Bernaille
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#

class profile::puppetagent(
    $puppetmaster=hiera('puppet_server','puppet'),
    $environment=hiera('node_environment','production')
) {

  filebucket { 'puppetmaster':
    path  => false
  }

  File {
  # All file resources will be backed up
    backup  => 'puppetmaster',
  }

  ini_setting { "Puppet server":
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'agent',
    setting => 'server',
    value   => "$puppet_server"
  }

  ini_setting { "Node environement":
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'agent',
    setting => 'server',
    value   => "$environment"
  }

}
