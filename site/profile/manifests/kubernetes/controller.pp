class profile::kubernetes::controller {

#  file { '/etc/kubernetes/cloud.conf':
#    ensure => file,
#    mode   => '0644',
#    source => 'puppet:///modules/profile/etc/kubernetes/cloud.conf',
#  }

#  class { 'kubernetes':
#    controller                 => true,
#    docker_package_name        => 'docker-ce',
#    docker_version             => '5:19.03.4~3-0~ubuntu-bionic',
#    docker_apt_location        => 'https://download.docker.com/linux/ubuntu',
#    docker_apt_release         => "${::lsbdistcodename}",
#    docker_apt_repos           => 'stable',
#    docker_key_id              => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
#    docker_key_source          => 'https://download.docker.com/linux/ubuntu/gpg',
#    kubernetes_apt_release     => 'kubernetes-xenial',
#    kubernetes_version         => '1.16.2',
#    kubernetes_package_version => '1.16.2-00',
#  }

}
