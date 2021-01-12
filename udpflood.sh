#/bin/bash
#DROP UDP Flood
list=`grep nameserver /etc/resolv.conf |awk '{print $NF}'`
for i in $list
do
  firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 1 -p udp -d $i --dport 53 -j ACCEPT
done
firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 2 -p udp -j DROP
firewall-cmd --reload

