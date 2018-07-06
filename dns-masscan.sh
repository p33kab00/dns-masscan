#!/bin/bash
if [[ $# -ne 1 ]] ; then
    printf "Usage:\n./dns-masscan.sh hosts.lst"
    exit 1
fi

function throttle {
  while [ `jobs -r | wc -l` -ge 30 ]
  do
    sleep 1
  done
}

L=`wc -l < $1`
echo "[*] dns-masscan 0.1"
echo "[*] by p33kab00 (mudnorb@gmail.com)"
printf "[*] # of hosts: $L\n\n"

while read p; do
  throttle; host $p | grep "has address" | cut -d" " -f4 >> tmp-ips.lst &
done <$1

# pretty naive but works - most of the time...
while [ `jobs -r | wc -l` -ge 1 ]
do
  sleep 1
done

cat tmp-ips.lst | sort -u | sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 > ips.lst
L=`wc -l < ips.lst`
echo "[+] Right, we ended up with $L unique IP addresses"
cat ips.lst
rm tmp-ips.lst
rm ips.lst
