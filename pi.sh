#!/usr/bin/env bash

COLOR=='\033[1;35m'

#Check if valid
if [ ! -e *.xcodeproj ]
then
    echo "Not an iOS project dir"
    exit
fi

#Get Project Name
dir=$(basename $(pwd))
cd $dir
if [ -f ../.pods ] ; then
    rm ../.pods
fi

#read all .swift Files
for i in `find . -name "*.swift" -type f`; do
    grep "^import" $i | awk '{print $2 >> "../.pods"}'
done

#come out and process
cd ..

#remove imports which are not pods
grep -vf ~/.conf/.notpods .pods > .podinstall
rm -rf .pods

awk '!x[$0]++' .podinstall > .podinstall2
mv .podinstall2 .podinstall

#start podding
pod init
sed -i'' -e "s/ProjectName/${dir}/g" ~/.conf/.defpodfile
rm Podfile
cp ~/.defpodfile Podfile
sed -i'' -e "s/${dir}/ProjectName/g" ~/.conf/.defpodfile

#create new Podfile
while read -r line
do
    echo "pod $line added"
    sed -i.bak "9i\\
    pod \'${line}\'\\
    " Podfile
done < .podinstall
echo "Podfile done"
rm -rf Podfile.bak

#install
pod install

echo "${COLOR}Thank you for using autopod!"
