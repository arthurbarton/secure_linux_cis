# @api private
#
# @summary Ensure default user umask is configured 
#
class secure_linux_cis::rules::ensure_default_user_umask_is_configured {
  $bashrc = $facts['osfamily'] ? {
    'Suse'   => '/etc/bash.bashrc',
    'RedHat' => '/etc/bashrc',
    'Debian' => '/etc/bash.bashrc',
  }

  file_line { 'bashrc':
    path     => $bashrc,
    line     => '      umask 077',
    match    => '^\s*umask\s+\d+',
    multiple => true,
  }

  file_line { 'profile':
    path     => '/etc/profile',
    line     => '    umask 077',
    match    => '^\s*umask\s+\d+',
    multiple => true,
  }

  file_line { 'login.defs':
    path  => '/etc/login.defs',
    line  => 'UMASK           077',
    match => '^\s*umask\s+\d+',
  }

  if $facts['osfamily'] == 'RedHat' {
    file_line { 'csh.cshrc':
      path     => '/etc/csh.cshrc',
      line     => '    umask 077',
      match    => '^\s*umask\s+\d+',
      multiple => true,
    }
  }
}
