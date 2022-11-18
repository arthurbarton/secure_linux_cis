# @param enforced Should this rule be enforced
# @api private
#  Ensure the SELinux state is enforcing (Scored)
#
#
# Description:
# Set SELinux to enable when the system is booted.
#
# @summary  Ensure the SELinux state is enforcing (Scored)
#
# @example
#   include secure_linux_cis::ensure_the_selinux_state_is_enforcing
class secure_linux_cis::rules::ensure_the_selinux_state_is_enforcing {
  include secure_linux_cis::rules::ensure_the_selinux_mode_is_enforcing
}
