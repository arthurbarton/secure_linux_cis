df --local -P  --exclude-type=overlay | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -not -path '*docker/overlay*' -xdev -type f -perm -0002
