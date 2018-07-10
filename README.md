# dns-masscan

dns-masscan is a tiny script that automates the process of resolving IP addresses from multiple host names.

**The dns-masscan project is sponsored by [CGI](https://www.cgi.com/en).**

Installation
----

You can download dns-masscan by cloning the [Git](https://github.com/p33kab00/dns-masscan) repository:

    git clone https://github.com/p33kab00/dns-masscan.git

dns-masscan works out of the box with any system shell.

Usage
----

Lookup IP addresses from a list of host names:

    $ cat hosts.lst 
    google.com
    yahoo.com
    cgi.com

    $ ./dns-masscan.sh hosts.lst 
    [*] dns-masscan 0.1
    [*] by p33kab00 (mudnorb@gmail.com)
    [*] # of hosts: 3
    
    [+] Right, we ended up with 8 unique IP addresses
    64.254.17.200
    72.30.35.9
    72.30.35.10
    98.137.246.7
    98.137.246.8
    98.138.219.231
    98.138.219.232
    172.217.20.110
