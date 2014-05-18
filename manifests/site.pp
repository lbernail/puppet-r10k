filebucket { 'puppetmaster':
    server => puppet
}

File {
    # All file resources will be backed up
    backup  => 'puppetmaster',
}

node 'default' {
      notify { 'Default class for unknown node': }
}

node 'puppetmaster' {
  include common::roles::master
}
