class profile::kubernetes::coordinator {

#  class { 'kubernetes':
#    controller => true,
#    docker_package_name        => 'docker-ce',
#    docker_version             => '18.06.1~ce~3-0~ubuntu',
#    docker_apt_location        => 'https://download.docker.com/linux/ubuntu',
#    docker_apt_release         => "${::lsbdistcodename}",
#    docker_apt_repos           => 'stable',
#    docker_key_id              => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
#    docker_key_source          => 'https://download.docker.com/linux/ubuntu/gpg',
#    kubernetes_apt_release     => 'kubernetes-xenial',
#    kubernetes_version         => '1.10.9',
#    kubernetes_package_version => '1.10.9-00',
#  }

}
