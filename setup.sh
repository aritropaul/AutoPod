#!/usr/bin/env bash

#copy to dir
#mkdir ~/.conf
cp pi.sh ~/pi.sh
cp .conf/.notpods ~/.conf/.notpods
cp .conf/.defpodfile ~/.conf/.defpodfile
cp .conf/.maintain ~/.conf/.maintain

echo "source ~/.autopodfile" >> ~/.bash_profile

#make alias
echo "alias autopod='sh ~/pi.sh'" >> ~/.autopodfile
echo "alias podsync='f(){ cp ~/pi.sh pi.sh; cp .conf/.notpods ~/.conf/.notpods; cp .conf/.defpodfile ~/.conf/.defpodfile; cp .conf/.maintain ~/.conf/.maintain; unset -f f; }; f'" >> ~/.autopodfile
echo "alias notapod='f(){echo "$1" >> ~/.notpods; unset -f f; }; f'" >> ~/.autopodfile
echo "alias unpod='f(){ rm ~/pi.sh; rm ~/.conf/.notpods; rm ~/.conf/.defpodfile; rm ~/.conf/.maintain; rm ~/.autopodfile; awk '!/autopodfile/' ~/.bash_profile > temp && mv temp ~/.bash_profile ;unset -f f; }; f'" >> ~/.autopodfile

source ~/.conf/.maintain
source ~/.bash_profile

