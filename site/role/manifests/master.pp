# == Class: role::master
# Include profiles for a master role (base, puppetserver)
#

class role::master{
  contain ::profile::base
  contain ::profile::puppetmaster
  contain ::profile::puppetagent
}
