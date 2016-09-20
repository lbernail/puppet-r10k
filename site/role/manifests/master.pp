# == Class: role::master
# Include profiles for a master role (base, puppetserver)
#

class role::master{
  class { '::profile::base': } ->
  class { '::profile::puppetmaster': } ->
  class { '::profile::puppetagent': }
}
