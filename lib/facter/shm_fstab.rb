# frozen_string_literal: true

# Is /dev/shm is mounted from fstab
# 
Facter.add('shm_fstab') do
  config kernel: 'Linux'
  setcode do
    fstab = Facter::Core::Execution.exec('grep /dev/shm /etc/fstab')
    if fstab.include?('/dev/shm')
      true
    else
      false
    end
  end
end
