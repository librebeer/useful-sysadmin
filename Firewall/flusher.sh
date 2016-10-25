#!/bin/sh
#hfjimenez@utp.edu.co 
#Just in case that you need to reset your iptables settings. 
#Use under your responsability.This will clean all the Chains.
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
