# == Class: scanf
#
# Full description of class scanf here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class scanf (
  $package_name = $::scanf::params::package_name,
  $service_name = $::scanf::params::service_name,
) inherits ::scanf::params {

  # validate parameters here

  class { '::scanf::install': } ->
  class { '::scanf::config': } ~>
  class { '::scanf::service': } ->
  Class['::scanf']
}
