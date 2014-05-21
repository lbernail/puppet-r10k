node 'default' {
      notify { 'Default class for unknown node': }
}

node 'puppetmaster' {
  include common::roles::master
}
