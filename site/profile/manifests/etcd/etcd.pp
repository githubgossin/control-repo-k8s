class profile::etcd::etcd {

  file { '/etc/etcd':
    ensure => 'directory',
  }

  class { 'etcd':
    listen_client_urls          => 'http://0.0.0.0:2379',
    advertise_client_urls       => "http://${::fqdn}:2379,http://127.0.0.1:2379",
    listen_peer_urls            => 'http://0.0.0.0:2380',
    initial_advertise_peer_urls => "http://${::fqdn}:2380,http://127.0.0.1:2379",
    initial_cluster             => [
      'coord-0=http://coord-0.borg.trek:2380',
      'coord-1=http://coord-1.borg.trek:2380',
      'coord-2=http://coord-2.borg.trek:2380'
      ],
    require                     => File['/etc/etcd'],
  }

}
