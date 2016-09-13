# == Class: profiles::base
#
#  Install packages
#
class profile::base {
    include common::packages::install

    notify { 'Message':
        name     => hiera(message,"No message found")
    }
}

