# @api private
#
# @summary Ensure nodev option set on /tmp partition 
#
class secure_linux_cis::rules::ensure_nodev_option_set_on_tmp_partition {
  if $facts['mountpoints']['/tmp'] {
    augeas { '/etc/fstab - nodev on /tmp':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/tmp']/opt[last()]",
        "set *[file = '/tmp']/opt[last()] nodev",
      ],
      onlyif  => "match *[file = '/tmp']/opt[. = 'nodev'] size == 0",
    }
  }
}
