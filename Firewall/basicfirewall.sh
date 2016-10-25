#!/bin/sh
#by default eth0 is the interface that is in front of internet
EXTIF="eth0"

EXTIP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' |head -n 1) # first public interface, this can be changed by your result given by ifconfig.

OPENINPUTTCPPORTS="22,80,443"	#Default ports to be able
OPENINPUTUDPPORTS="time,53"; 	#UDP open ports.

# Set the default policies:

iptables -P INPUT DROP      #Block Every input,output and forward
iptables -P OUTPUT DROP     
iptables -P FORWARD DROP

# Flush chains:

iptables -F                 #flush to clean all the tables and chains. 
iptables -t nat -F  
iptables -X             

# Create a new chain to use for both the input and the forward chains:
iptables -N block           #create new chain for block. 

# Accept all packages for existing connections
iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A block -i lo -j ACCEPT #we accept all the loopback interfacez.

# Allow new connections for a few "safe" ports
# Para quitar entrada desde afuera comantar las dos siguientes lineas
iptables -A block -m multiport -p tcp --dports $OPENINPUTTCPPORTS -j ACCEPT 
iptables -A block -m multiport -p udp --dports $OPENINPUTUDPPORTS -j ACCEPT


# Allow external ping
#iptables -A block -p icmp --icmp-type 0 -j ACCEPT
#iptables -A block -p icmp --icmp-type 8 -j ACCEPT

# Log unwanted packages.  Since this can generate quite a lot of
# output, it is disabled by default.

iptables -A block -j LOG

# Reject everything else
iptables -A block -j REJECT

# Add the block chain to both the INPUT and OUTPUT chains:
iptables -A INPUT   -j block
iptables -A FORWARD -j block

# Permitir toda la salida
iptables -A OUTPUT -o $EXTIF --source $EXTIP -j ACCEPT 

# Allow output of any packets on the loopback interface:
iptables -A OUTPUT -o lo -j ACCEPT

