node 'default' {
  $message=hiera('common::message::gpg','No such key')

  notify { 'Default class for unknown node': }
  -> notify { "GPG test message: ${message}": }
}

node 'puppetmaster' {
  include role::master
}
