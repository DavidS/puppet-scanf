# == Class scanf::service
#
# This class is meant to be called from scanf.
# It ensure the service is running.
#
class scanf::service {

  service { $::scanf::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
