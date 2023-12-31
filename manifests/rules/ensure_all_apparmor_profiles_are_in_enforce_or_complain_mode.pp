# @api private
#
# @summary Ensure all AppArmor Profiles are in enforce or complain mode 
#
class secure_linux_cis::rules::ensure_all_apparmor_profiles_are_in_enforce_or_complain_mode {
  unless $facts['apparmorcomplain'].empty {
    notify { 'apparmor':
      message  => 'Not in compliance with CIS 1.6.2.2 (Scored). See the output of apparmor_status. Make sure all profiles are enforced."',
    }
  }
}
