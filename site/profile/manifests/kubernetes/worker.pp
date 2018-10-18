class profile::kubernetes::worker {

#  class { 'kubernetes': 
#    worker => true,
#    docker_package_name => 'docker-ce',
#    docker_version      => '18.06.1~ce~3-0~ubuntu',
#    docker_apt_location => 'https://download.docker.com/linux/ubuntu',
#    docker_apt_release  => "${::lsbdistcodename}",
#    docker_apt_repos    => 'stable',
#    docker_key_id       => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
#    docker_key_source   => 'https://download.docker.com/linux/ubuntu/gpg',
#    kubernetes_apt_release => "kubernetes-xenial",
#    kubernetes_version     => '1.12.1',
#    kubernetes_package_version     => '1.12.1-00',
#    etcd_version           => '3.2.24',
#    etcd_archive           => 'etcd-v3.2.24-linux-amd64.tar.gz',
#    etcd_source            => 'https://github.com/coreos/etcd/releases/download/v3.2.24/etcd-v3.2.24-linux-amd64.tar.gz',
#  }

}
