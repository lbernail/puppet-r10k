# == Class: common::roles::agent
# Include profiles for a basic agent role (base and agent)
#

class common::roles::agent {
  include ::profiles::base
  include ::profiles::puppetagent
}
