#!/usr/bin/env bash

#copy to dir
cp pi.sh ~/pi.sh
cp .conf/.notpods ~/.conf/.notpods
cp .conf/.defpodfile ~/.conf/.defpodfile
cp .conf/.maintain ~/.conf/.maintain

#make alias
echo "alias autopod='sh ~/pi.sh'" >> ~/.bash_profile
echo "alias podsync='f(){ cp ~/pi.sh pi.sh; cp .conf/.notpods ~/.conf/.notpods; cp .conf/.defpodfile ~/.conf/.defpodfile; cp .conf/.maintain ~/.conf/.maintain;}; f'"
source ~/.conf/.maintain
source ~/.bash_profile

