class profile::etcd::etcd {

  file { '/etc/etcd':
    ensure => 'directory',
  }

  class { 'etcd':
    ensure                  => 'latest',
    etcd_listen_client_urls => 'http://0.0.0.0:2379',
    require                 => File['/etc/etcd'],
  }

}
