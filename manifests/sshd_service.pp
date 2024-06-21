# @api private
# Helper class for reloading various services when needed
#
# @example
#   include secure_linux_cis::redhat9
class secure_linux_cis::sshd_service() {

  if defined(Class['ssh::server']) {
        notify { 'eggs': }
  } else {
    service { 'sshd':
      ensure => running,
      enable => true,
    }
  }
}
