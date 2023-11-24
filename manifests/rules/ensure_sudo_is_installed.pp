# @api private
#
# @summary Ensure sudo is installed 
#
class secure_linux_cis::rules::ensure_sudo_is_installed {
  # We want CIS to ensure sudo, but its often installed elsewhere
  if !defined(Package['sudo']) {
    package { 'sudo':
      ensure   => installed,
    }
  }
}
