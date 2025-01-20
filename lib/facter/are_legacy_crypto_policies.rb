Facter.add('are_legacy_crypto_policies') do
  confine osfamily: 'RedHat'
  confine operatingsystemmajrelease: ['8', '9']

  setcode do
    ret = false
    File.open('/etc/crypto-policies/config').each do |i|
      if i.match('^LEGACY')
        ret = true
      end
    end

    ret

  end
end
