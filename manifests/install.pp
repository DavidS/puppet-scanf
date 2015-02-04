# == Class scanf::install
#
# This class is called from scanf for install.
#
class scanf::install {

  package { $::scanf::package_name:
    ensure => present,
  }
}
