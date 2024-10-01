# @api private
#
# @summary Ensure journald service is enabled 
#
class secure_linux_cis::rules::ensure_journald_service_is_enabled {
  if !defined(Service['systemd-journald']) {
    service { 'systemd-journald':
      ensure => running,
      enable => true,
    }
  }
}
