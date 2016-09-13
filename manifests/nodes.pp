node 'default' {
  include role::agent

  notify { 'Default class for unknown node': }
}

node 'puppetmaster' {
  include role::master
}
