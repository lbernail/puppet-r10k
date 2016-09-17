# == Class: common::roles::master
# Include profiles for a master role (base and puppetmaster)
#

class role::master_standalone {
  include ::profile::base
  include ::profile::puppetmaster_standalone
  include ::profile::puppetagent
}
