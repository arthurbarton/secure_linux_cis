# @api private
#
# @summary Ensure no duplicate group names exist 
#
class secure_linux_cis::rules::ensure_no_duplicate_group_names_exist {
  file { '/usr/share/cis_scripts/dup_group.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/dup_group.sh'),
  }
  unless $facts['duplicate_group'].empty {
    notify { 'dgrp':
      message  => 'Not in compliance with CIS 9 (Scored). There is a duplicate group name(s) in /etc/group. Check the duplicate_group fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
