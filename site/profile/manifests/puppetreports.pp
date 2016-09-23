# == Class: profile::puppetreports
#
#  Install and configure puppetboard
#
# === Parameters
#
# === Authors
#
# Laurent Bernaille
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#

class profile::puppetreports(
) {

  class { 'apache': }
  class { 'apache::mod::wsgi':
    wsgi_socket_prefix => "/var/run/wsgi",
  }
  class { 'puppetboard::apache::vhost':
    vhost_name => hiera('profiles::puppetboard::puppetboard_vhost',$::fqdn)
  }

  $ssl_dir = $::settings::ssldir
  $puppetboard_certname = $clientcert

  class { 'puppetboard':
    groups              => 'puppet',
    manage_virtualenv   => true,
    puppetdb_host       => hiera('puppetdb_host'),
    puppetdb_port       => '8081',
    puppetdb_key        => "${ssl_dir}/private_keys/${puppetboard_certname}.pem",
    puppetdb_ssl_verify => false,
    puppetdb_cert       => "${ssl_dir}/certs/${puppetboard_certname}.pem",
  }

}
