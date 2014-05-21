# == Class: common::roles::master
# Include profiles for a master role (base and puppetmaster)
#

class common::roles::master {
  include ::common::profiles::base
  include ::common::profiles::puppetmaster
}
