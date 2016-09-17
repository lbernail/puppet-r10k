# == Class: common::roles::master
# Include profiles for a master role (base and puppetmaster)
#

class role::master-standalone {
  include ::profile::base
  include ::profile::puppetmaster-standalone
  include ::profile::puppetagent
}
