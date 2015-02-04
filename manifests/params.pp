# == Class scanf::params
#
# This class is meant to be called from scanf.
# It sets variables according to platform.
#
class scanf::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'scanf'
      $service_name = 'scanf'
    }
    'RedHat', 'Amazon': {
      $package_name = 'scanf'
      $service_name = 'scanf'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
