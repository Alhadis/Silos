#!/bin/sh

for i in ./files/*; do
	hash=`sha256sum "$i" | gsed -E 's/  /\t/' | cut -f1`
	from=`xattr -p user.xdg.origin.url "$i"`
	printf '%s\t%s\t%s\n' "$hash" "$i" "$from" >> file-ids.log
done
