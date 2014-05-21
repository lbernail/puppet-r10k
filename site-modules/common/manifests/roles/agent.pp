# == Class: common::roles::agent
# Include profiles for a basic agent role (base and agent)
#

class common::roles::agent {
  include ::common::profiles::base
  include ::common::profiles::puppetagent
}
