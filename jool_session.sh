#!/bin/sh

# variables
# $YOUR_ZABBIX_IPADDR=
# $YOUR_JOOL_HOSTNAME_ON_ZABBIX=
# $YOUR_KEY_OF_TCP_ON_ZABBIX=jool.tcp.session
# $YOUR_KEY_OF_UDP_ON_ZABBIX=jool.udp.session
# $YOUR_KEY_OF_ICMP_ON_ZABBIX=jool.icmp.session

# substituting TCP/UDP/ICMP session to variable
TCP=`jool -c --session --tcp | awk '{print $NF}'`
UDP=`jool -c --session --udp | awk '{print $NF}'`
ICMP=`jool -c --session --icmp | awk '{print $NF}'`

# run zabbix_sender
/usr/bin/zabbix_sender -z $YOUR_ZABBIX_IPADDR -p 10051 -s $YOUR_JOOL_HOSTNAME_ON_ZABBIX -k $YOUR_KEY_OF_TCP_ON_ZABBIX -o ${TCP} 
/usr/bin/zabbix_sender -z $YOUR_ZABBIX_IPADDR -p 10051 -s $YOUR_JOOL_HOSTNAME_ON_ZABBIX -k $YOUR_KEY_OF_UDP_ON_ZABBIX -o ${UDP} 
/usr/bin/zabbix_sender -z $YOUR_ZABBIX_IPADDR -p 10051 -s $YOUR_JOOL_HOSTNAME_ON_ZABBIX -k $YOUR_KEY_OF_ICMP_ON_ZABBIX -o ${ICMP} 
