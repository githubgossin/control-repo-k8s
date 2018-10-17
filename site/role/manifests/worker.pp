class role::worker {

  include profile::base_linux
  include profile::kubernetes::worker
}
