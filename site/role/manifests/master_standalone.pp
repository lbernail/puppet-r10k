# == Class: role::master_standalone
# Include profiles for a standalone master role (base, puppetserver, puppetdb, puppetboard)
#

class role::master_standalone {
  include ::profile::base
  include ::profile::puppetmaster_standalone
  include ::profile::puppetagent
}
