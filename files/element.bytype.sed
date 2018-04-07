/^.*<${tagname}[^>]\+type=[^>]\+${indexfield}=.*$/{
	b processinputs
}

/^.*<${tagname}[^>]\+${indexfield}=[^>]\+type=.*$/{
	b processinputs
}

b end

:processinputs


# *** 1. Get rid of anything preceeding any inputs ...

s/<${tagname}/<startofusefuldata>/

s/^.*<startofusefuldata>\(.*\)$/<${tagname}\1/g

# 2. Make sure there are no broken input tags ...

# See whether there are any broken inputs ...

:check_broken_tag
/<${tagname}[^>]\+$/{

	N

	s/\n//g

	b check_broken_tag
}

:processtag

# *** Make "${indexfield}" come before "type" ...
s/\(<${tagname}[^>]\+\)\(type=\"[^\"]\+\"\)\([^>]\+\)\(${indexfield}=\"[^\"]\+\"\)\([^>]*>\)/\1\4\3\2\5/g

# Trim inputs ...
s/^\(.*<${tagname}[^>]\+>\).*$/\1/g

s/\(<${tagname}[^>]\+>\)[^<]*\(<${tagname}[^>]\+>\)/\1\2/g

# Remove hidden inputs ...
s/<${tagname}[^>]\+type=\"hidden\"[^>]\+>//g

# make a copy of ID, so that we can prepare 1. creating the 'name' element and camel casing it ...
s/\(<${tagname}[^>]\+${indexfield}=\)\"\([^\"]\+\)\"\([^>]*>\)/\1\"\2\" ELEMENTNAME=\"\2\" \3/g

# Camelcase first character ...

s/ELEMENTNAME=\"a/ELEMENTNAME=\"A/g
s/ELEMENTNAME=\"b/ELEMENTNAME=\"B/g
s/ELEMENTNAME=\"c/ELEMENTNAME=\"C/g
s/ELEMENTNAME=\"d/ELEMENTNAME=\"D/g
s/ELEMENTNAME=\"e/ELEMENTNAME=\"E/g
s/ELEMENTNAME=\"f/ELEMENTNAME=\"F/g
s/ELEMENTNAME=\"g/ELEMENTNAME=\"G/g
s/ELEMENTNAME=\"h/ELEMENTNAME=\"H/g
s/ELEMENTNAME=\"i/ELEMENTNAME=\"I/g
s/ELEMENTNAME=\"j/ELEMENTNAME=\"J/g
s/ELEMENTNAME=\"k/ELEMENTNAME=\"K/g
s/ELEMENTNAME=\"l/ELEMENTNAME=\"L/g
s/ELEMENTNAME=\"m/ELEMENTNAME=\"M/g
s/ELEMENTNAME=\"n/ELEMENTNAME=\"N/g
s/ELEMENTNAME=\"o/ELEMENTNAME=\"O/g
s/ELEMENTNAME=\"p/ELEMENTNAME=\"P/g
s/ELEMENTNAME=\"q/ELEMENTNAME=\"Q/g
s/ELEMENTNAME=\"r/ELEMENTNAME=\"R/g
s/ELEMENTNAME=\"s/ELEMENTNAME=\"S/g
s/ELEMENTNAME=\"t/ELEMENTNAME=\"T/g
s/ELEMENTNAME=\"u/ELEMENTNAME=\"U/g
s/ELEMENTNAME=\"v/ELEMENTNAME=\"V/g
s/ELEMENTNAME=\"w/ELEMENTNAME=\"W/g
s/ELEMENTNAME=\"x/ELEMENTNAME=\"X/g
s/ELEMENTNAME=\"y/ELEMENTNAME=\"Y/g
s/ELEMENTNAME=\"z/ELEMENTNAME=\"Z/g

# Camelcase the rest ...

:docamel

s/\(ELEMENTNAME=\"[^\-]\+\)\-a/\1 A/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-b/\1 B/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-c/\1 C/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-d/\1 D/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-e/\1 E/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-f/\1 F/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-g/\1 G/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-h/\1 H/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-i/\1 I/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-j/\1 J/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-k/\1 K/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-l/\1 L/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-m/\1 M/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-n/\1 N/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-o/\1 O/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-p/\1 P/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-q/\1 Q/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-r/\1 R/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-s/\1 S/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-t/\1 T/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-u/\1 U/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-v/\1 V/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-w/\1 W/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-x/\1 X/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-y/\1 Y/g
s/\(ELEMENTNAME=\"[^\-]\+\)\-z/\1 Z/g

/ELEMENTNAME=\"[^\-]\+\-[a-z]/{
	b docamel
}

# At this stage we should have a list of 'tidy' elements
# ready to be used for generating PageElement pages ...

# generate page element(s) ...
s/<${tagname}.*${indexfield}=\"\([^\"]\+\)\".*ELEMENTNAME=\"\([^\"]\+\)\".*type=\"\([^\"]\+\)[^>]\+>/\t{\n\t\t\"name\" : \"\2\",\n\t\t\"byExpr\" : \"\1\",\n\t\t\"byType\" : \"${indexfield}\",\n\t\t\"htmlType\" : \"\3\"\n\t}/g

/^.*byExpr.*$/{

	G

	# If a previous line was
	# processed then suffix JSON
	# object with a comma ...

	/^.*<lineprocessed>.*$/{
		s/^\(.*\)\n<lineprocessed>\(.*\)$/\1\2/g

		s/^\(.*\)$/\1\n\t,/g

	}

	p

	s/\(.*\)/<lineprocessed>/g

	h
}

:end
