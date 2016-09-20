# == Class: role::master
# Include profiles for a master role (base, puppetserver)
#

class role::master{
  include profile::base
  include profile::puppetmaster
  include profile::puppetagent

  Class['profile::base']->Class['profile::puppetmaster']->Class['profile::puppetagent']
}
