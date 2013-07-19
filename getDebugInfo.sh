#!/bin/sh

m_files=( $(find ./${PRODUCT_NAME} -name '*.m') )

lines=0
ifs=0
unsign=0
for i in ${m_files[@]}; do
lines=$(( $lines + $(wc -l < $i) ))
ifs=$(( $ifs + $(sed -n -e '/^[ \t]*if[ \t]*(/p' $i | wc -l) ))
unsign=$(( $unsign + $(sed -n -e '/^[ \t]*\/\//p' $i | wc -l) ))
unsign=$(( $unsign + $(grep -c ^$ $i) ))
done

if_coef='<key>IfCoef</key><string>'$(bc <<<"scale=4;$ifs/($lines-$unsign)")'</string>'

commit=$(git log --pretty=format:'%H' -n 1)
commit_date='<key>CommitDate</key><string>'$(git log -n 1 --format='%cd')'</string>'

build_tags=( $(git tag | grep "build_\.*") )

from=$commit
to=$(git rev-list --max-parents=0 HEAD)

if [ ${#build_tags[@]} -gt 0 ]; then
	from=$(git log ${build_tags[0]} -n 1 --format='%H')
fi

if [ ${#build_tags[@]} -gt 1 ]; then
	to=$(git log ${build_tags[1]} -n 1 --format='%H')
fi	

if [ $from = $to ]; then
	notices[0]=$from
else
	notices=( $(git log $from...$to --format='%H') )
	
	if [ $to = $(git rev-list --max-parents=0 HEAD) ]; then
		notices=(${notices[@]} $to)
	fi
fi

notices_array='<key>Notices</key><array>'

for var in "${notices[@]}"
do
current_notice=$(git log --format=%B -n 1 ${var})
notices_array=$notices_array'<string>'$current_notice'</string>'
done

notices_array=$notices_array'</array>'

xml_head='<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0">'

committer_name='<key>GitUserName</key><string>'$(git config user.name)'</string>'
committer_email='<key>GitUserEmail</key><string>'$(git config user.email)'</string>'
build_time='<key>BuildTime</key><string>'$(date +"%Y-%m-%d %H:%M:%S")'</string>'

diff=$(git status --porcelain)
if [ ${#diff} -gt 0 ]; then
	isClean='<key>BranchStatus</key><string>Not clean</string>'
else
	isClean='<key>BranchStatus</key><string>Clean</string>'
fi

configuration='<key>BuildConfiguration</key><string>'${CONFIGURATION}'</string>'

echo $xml_head'<dict><key>CommitHash</key><string>'$commit'</string>'$commit_date$committer_name$committer_email$build_time$isClean$configuration$if_coef$notices_array'</dict></plist>'  | xmllint --format -  >debugInfo.plist

cp debugInfo.plist ${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/debugInfo.plist