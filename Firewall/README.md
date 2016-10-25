# Firewall
## A basic firewall that opens and close ports in default virtual machines

Temporarily allow access to certain ports in your virtual machine , and automatically closes reset all the previous iptables rules. This is Convenient for SSH-ing into a vm. You should change and allow ports that only are **needed**


### Usage
Remember to open another ssh session and check your connection to your vm.
`$chmod +x basicfirewall.sh`
`$ sudo ./basicfirewall.sh`


### Reset
If you have any inconvenience I've added a flusher script that cleans all the iptables chains remember you should use this settings under your own responsability. 

`$ chmod +x flusher.sh`
`$ sudo ./flusher`


