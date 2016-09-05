# == Class: common::roles::master
# Include profiles for a master role (base and puppetmaster)
#

class role::master {
  include ::profile::base
  include ::profile::puppetmaster
}
