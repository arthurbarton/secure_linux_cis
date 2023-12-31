# @api private
#
# @summary Ensure nodev option set on removable media partitions 
#
class secure_linux_cis::rules::ensure_nodev_option_set_on_removable_media_partitions {
  # Let's look at the name of each one and try to guess if it's removable
  $facts['mountpoints'].each | Tuple $mnt | {
    if($mnt[0] =~ /cdrom/ or $mnt[0] =~ /floppy/) {
      if member($facts['mountpoints'][$mnt[0]]['options'], 'nodev') == false {
        notify { "1_1_18 nodev ${mnt[0]}":
          message  => "POTENTIAL Not in compliance with CIS 8 (Not Scored). Ensure nodev option set on removable media partitions - ${mnt[0]}",  #lint:ignore:140chars
          loglevel => 'warning',
        }
      }
    }
  }
}
