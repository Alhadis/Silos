#!/bin/sh
set -e

cd "`dirname "$0"`"/..

printf "" > urls.log
printf "" > unique-repos.log
printf "" > unique-users.log

cd files
max_length=0
for i in *; do
	url=`xattr -p user.xdg.origin.url "$i" | ../scripts/cook.sed` || break
	printf '%s\t%s\n' "$i" "$url" >> ../urls.log
	if [ ${#i} -gt $max_length ]; then max_length=${#i}; fi
done
max_length=`printf "%s + 4\n" $max_length | bc`
printf '# vim: ts=%s\n' "$max_length" >> ../urls.log
cd ..

sort urls.log \
| grep -Eo 'https://github.com/[^/]+/[^/]+' \
| sort | uniq \
| tee unique-repos.log \
| sed -e 's/[^/]*$//' \
| sort | uniq > unique-users.log
