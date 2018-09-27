#!/usr/bin/env bash

#Get Project Name
dir=$(basename $(pwd))
cd $dir
if [ -f ../.pods ] ; then
    rm ../.pods
fi

#read all .swift Files
for i in `find . -name "*.swift" -type f`; do
    grep "^import" $i | awk '{print $2 >> "../.pods" }'
done

#come out and process
cd ..

#remove imports which are not pods
grep -vf ~/.notpods .pods > .podinstall
rm -rf .pods

#start podding
pod init
sed -i'' -e "s/ProjectName/${dir}/g" ~/.defpodfile
rm Podfile
cp ~/.defpodfile Podfile
sed -i'' -e "s/${dir}/ProjectName/g" ~/.defpodfile

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

