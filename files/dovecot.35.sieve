# vim: set ft=sieve :

require ["date", "variables", "fileinto", "mailbox"];

if date :matches "date" "day" "*" { set "day" "${1}"; } else { set "day" "-"; }
if date :matches "date" "month" "*" { set "month" "${1}"; } else { set "month" "-"; }
if date :matches "date" "year"  "*" { set "year"  "${1}"; } else { set "year" "-"; }

if anyof ( string :is "${year}" "-", string :is "${month}" "-", string :is "${year}" "-" ) {
	if currentdate :matches "day" "*" { set "day" "${1}"; }
	if currentdate :matches "month" "*" { set "month" "${1}"; }
	if currentdate :matches "year"  "*" { set "year"  "${1}"; }
}

fileinto :create "${year}/${month}/${day}";
