# jool_session_monitor
jool(NAT64 component) TCP/UDP/ICMP session monitor on Zabbix

## 1. Overview
This tool can draw graph of jool's TCP/UDP/ICMP session amount on Zabbix.  
it's better to use in combination with cron.  
jool is Linux kernel module as NAT64 component.
![jool_tcp_session](https://github.com/onifinger/images/blob/master/tcp_session.png)

## 2. Description
I was programmed this tool for NAT64 Wi-Fi network on iOS developer's conference that have over 400 visitors.  
This tool send session amounts to zabbix server by using jool commands and zabbix_sender.  
I was monitored session amount even 1 minutes in this conference by cron and this tool.

## 3. Requirement
+ zabbix_agent
  - zabbix_sender contains zabbix_agent, so you need to install zabbix_agent to your jool server.

  ```
  $ yum install zabbix_agent
  ```

+ jool userspace application
  - one jool command can pick up current session amount. may you have installed jool userspace application when you set up jool.
  - will you check the URL below when you want to install.
  - https://jool.mx/en/install-usr.html

## 4. Installation
only cloning this repo to your local folder.

```:bash
$ git clone https://github.com/onifinger/jool_session_monitor.git
```

## 5. Usage
1. edit variables
  uncomment and edit these variables to suit your environment.

  ```
  # $YOUR_ZABBIX_IPADDR=
  # $YOUR_JOOL_HOSTNAME_ON_ZABBIX=
  # $YOUR_KEY_OF_TCP_ON_ZABBIX=jool.tcp.session
  # $YOUR_KEY_OF_UDP_ON_ZABBIX=jool.udp.session
  # $YOUR_KEY_OF_ICMP_ON_ZABBIX=jool.icmp.session
  ```

  Write your zabbix server's IPv4 addr to $YOUR_ZABBIX_IPADDR.
  Write jool hostname to $YOUR_JOOL_HOSTNAME_ON_ZABBIX.  
  **[!] jool hostname == hostname on zabbix configuration**  

  Anything is enough for $YOUR_KEY_OF_xxx_ON_ZABBIX if you meet the set point of the item on zabbix side.

1. run by your hand  
  you can send current session amount to zabbix server by line below.

  ```
  $ sh jool_session.sh
  ```

1. use in combination with cron  
  it is an example of crontab.

  ```
  $ crontab -l
  :
  :
  */1 * * * * /bin/sh /home/YOURNAME/jool_session.sh >>/home/YOURNAME/cron.log 2>> /home/YOURNAME/cronerr.log
  :
  :
  ```

## 6. Licence
MIT
