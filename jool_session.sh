#!/bin/sh

# variables
YOUR_ZABBIX_IPADDR=''
YOUR_JOOL_HOSTNAME_ON_ZABBIX=''
YOUR_KEY_OF_TCP_ON_ZABBIX='jool.tcp.session'
YOUR_KEY_OF_UDP_ON_ZABBIX='jool.udp.session'
YOUR_KEY_OF_ICMP_ON_ZABBIX='jool.icmp.session'

# substituting TCP/UDP/ICMP session to variable
TCP=`/usr/local/bin/jool -c --session --tcp`
UDP=`/usr/local/bin/jool -c --session --udp`
ICMP=`/usr/local/bin/jool -c --session --icmp`

# run zabbix_sender
/usr/bin/zabbix_sender -z ${YOUR_ZABBIX_IPADDR} -s ${YOUR_JOOL_HOSTNAME_ON_ZABBIX} -k ${YOUR_KEY_OF_TCP_ON_ZABBIX} -o ${TCP}
/usr/bin/zabbix_sender -z ${YOUR_ZABBIX_IPADDR} -s ${YOUR_JOOL_HOSTNAME_ON_ZABBIX} -k ${YOUR_KEY_OF_UDP_ON_ZABBIX} -o ${UDP}
/usr/bin/zabbix_sender -z ${YOUR_ZABBIX_IPADDR} -s ${YOUR_JOOL_HOSTNAME_ON_ZABBIX} -k ${YOUR_KEY_OF_ICMP_ON_ZABBIX} -o ${ICMP}
