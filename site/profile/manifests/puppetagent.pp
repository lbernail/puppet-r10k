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
) {

  filebucket { 'puppetmaster':
    path  => false
  }

  File {
  # All file resources will be backed up
    backup  => 'puppetmaster',
  }

  class { 'puppet':
      server                      => false,
      runmode                     => hiera('profiles::puppetmaster::runmode','cron'),
      version                     => 'present',
  }

}
