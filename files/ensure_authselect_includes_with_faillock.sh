authselect_status=$(/usr/bin/authselect current --raw)
if [[ ! $authselect_status =~ "with-faillock" ]]; then
        /usr/bin/authselect enable-feature with-faillock && /usr/bin/authselect apply-changes
fi
