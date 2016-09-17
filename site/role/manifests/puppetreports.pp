# == Class: role:puppetreports
# Include profiles for a puppetreports role
#

class role::puppetreports {
  include ::profile::base
  include ::profile::puppetagent
  include ::profile::puppetreports
}
