# == Class: role:puppetdb
# Include profiles for a puppetdb role
#

class role::puppetdb {
  include ::profile::base
  include ::profile::puppetagent
  include ::profile::puppetdb
}
