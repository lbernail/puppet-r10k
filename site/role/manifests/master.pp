# == Class: common::roles::master
# Include profiles for a master role (base and puppetmaster)
#

class common::roles::master {
  include ::profiles::base
  include ::profiles::puppetmaster
}
