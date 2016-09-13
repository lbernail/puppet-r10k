node 'default' {
  include role::agent

  notify { 'Default class for unknown node': }
  -> notify { "Hello": }
}

node 'puppetmaster' {
  include role::master
}
