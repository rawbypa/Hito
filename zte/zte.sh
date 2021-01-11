#!/bin/bash
#!Created By halfdark
#!motherfker enjoy)
clear
echo -e "\e[1;32mNow Auto-Scanning GPON"
zmap -p 443 -o zte -w zte2.lst
ulimit -n 999999
python zte.py zte
rm -rf zte
clear
zmap -p 443 -o zte -w zte.lst
ulimit -n 999999
python zte.py zte
rm -rf zte
clear
zmap -p 443 -o zte -w zte2.lst
ulimit -n 999999
python zte.py zte
rm -rf zte
clear
zmap -p 443 -o zte -w zte.lst
ulimit -n 999999
python zte.py zte
rm -rf zte
clear
sh zte.sh
