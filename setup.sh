#!/usr/bin/env bash

#copy to dir
cp pi.sh ~/pi.sh
cp .notpods ~/.notpods
cp .defpodfile ~/.defpodfile
cp .maintain ~/.maintain

#make alias
echo "alias autopod='sh ~/pi.sh'" >> ~/.bash_profile
source ~/.maintain
source ~/.bash_profile
