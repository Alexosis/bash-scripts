#!/bin/bash
apt-get update
apt-get install -y wireshark
groupadd wireshark
usermod -a -G wireshark $USER
chgrp wireshark /usr/bin/dumpcap
chmod o-rx /usr/bin/dumpcap
setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap
getcap /usr/bin/dumpcap

apt-get install tftp-server tftpd ftp vsftpd filezilla putty
sed -e 's/disable = yes/disable = no/g' -i /etc/xinetd.d/tftp
sed -e 's/disable = yes/disable = no/g' -i /etc/xinetd.d/vsftpd
echo 'tftp  dgram udp wait nobody /usr/sbin/tcpd /usr/sbin/in.tftpd /var/lib/tftpboot'|tee -a /etc/xinetd.conf
echo 'local_enable=YES' |tee -a /etc/vsftpd.conf
systemctl restart xinetd.service && systemctl enable xinetd.service
cp /usr/share/applications/putty.desktop /home/user/Рабочий\ стол/
cp /usr/share/applications/filezilla.desktop /home/user/Рабочий\ стол/
chmod 777 /home/user/Рабочий\ стол/putty.desktop && chmod 777 /home/user/Рабочий\ стол/filezilla.desktop

#cd cisco/
#tar xvf control.tar.xz -C /
#tar xvf data.tar.xz -C /
cp /usr/share/applications/cisco-pt.desktop /home/user/Рабочий\ стол/
chmod 777 /home/user/Рабочий\ стол/cisco-pt.desktop

apt-get install screen

