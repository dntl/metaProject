#!/bin/sh

commit=$(git log --pretty=format:'%H' -n 1)

build_tags=( $(git tag | grep "build_\.*") )

from=$commit
to=$(git rev-list --max-parents=0 HEAD)

if [ ${#build_tags[@]} -gt 0 ]; then
	from=$(git log ${build_tags[0]})
fi

if [ ${#build_tags[@]} -gt 1 ]; then
	to=$(git log ${build_tags[1]})
fi	

if [ $from = $to ]; then
	notices[0]=$from
else
	notices=( $(git log $from...$to --format=%H) )
	
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

echo $xml_head'<dict><key>CommitHash</key><string>'$commit'</string>'$notices_array'</dict></plist>'  | xmllint --format -  >debugInfo.plist

cp debugInfo.plist ${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/debugInfo.plist