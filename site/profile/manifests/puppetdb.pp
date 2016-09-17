# == Class: profile::puppetdb
#
#  Install and configure puppetdb with local postgresql
#
# === Parameters
#
# === Authors
#
# Laurent Bernaille
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#

class profile::puppetdb(
) {
  class { 'puppetdb': }
}
