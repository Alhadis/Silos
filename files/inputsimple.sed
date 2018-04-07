/^.*<input[^>]\+type=[^>]\+${indexfield}=.*$/{
	b processinputs
}

/^.*<input[^>]\+${indexfield}=[^>]\+type=.*$/{
	b processinputs
}

b end

:processinputs


# *** 1. Get rid of anything preceeding any inputs ...

s/<input/<startofusefuldata>/

s/^.*<startofusefuldata>\(.*\)$/<input\1/g

# 2. Make sure there are no broken input tags ...

# See whether there are any broken inputs ...

:check_broken_tag
/<input[^>]\+$/{

	N

	s/\n//g

	b check_broken_tag
}

:processtag

# *** Make "${indexfield}" come before "type" ...
s/\(<input[^>]\+\)\(type=\"[^\"]\+\"\)\([^>]\+\)\(${indexfield}=\"[^\"]\+\"\)\([^>]*>\)/\1\4\3\2\5/g

# Trim inputs ...
s/^\(.*<input[^>]\+>\).*$/\1/g

s/\(<input[^>]\+>\)[^<]*\(<input[^>]\+>\)/\1\2/g

# Remove hidden inputs ...
s/<input[^>]\+type=\"hidden\"[^>]\+>//g

# make a copy of ID, so that we can prepare 1. creating the 'name' element and camel casing it ...
s/\(<input[^>]\+${indexfield}=\)\"\([^\"]\+\)\"\([^>]*>\)/\1\"\2\" CAMELCASE=\"\2\" \3/g

# Camelcase first character ...

s/CAMELCASE=\"a/CAMELCASE=\"A/g
s/CAMELCASE=\"b/CAMELCASE=\"B/g
s/CAMELCASE=\"c/CAMELCASE=\"C/g
s/CAMELCASE=\"d/CAMELCASE=\"D/g
s/CAMELCASE=\"e/CAMELCASE=\"E/g
s/CAMELCASE=\"f/CAMELCASE=\"F/g
s/CAMELCASE=\"g/CAMELCASE=\"G/g
s/CAMELCASE=\"h/CAMELCASE=\"H/g
s/CAMELCASE=\"i/CAMELCASE=\"I/g
s/CAMELCASE=\"j/CAMELCASE=\"J/g
s/CAMELCASE=\"k/CAMELCASE=\"K/g
s/CAMELCASE=\"l/CAMELCASE=\"L/g
s/CAMELCASE=\"m/CAMELCASE=\"M/g
s/CAMELCASE=\"n/CAMELCASE=\"N/g
s/CAMELCASE=\"o/CAMELCASE=\"O/g
s/CAMELCASE=\"p/CAMELCASE=\"P/g
s/CAMELCASE=\"q/CAMELCASE=\"Q/g
s/CAMELCASE=\"r/CAMELCASE=\"R/g
s/CAMELCASE=\"s/CAMELCASE=\"S/g
s/CAMELCASE=\"t/CAMELCASE=\"T/g
s/CAMELCASE=\"u/CAMELCASE=\"U/g
s/CAMELCASE=\"v/CAMELCASE=\"V/g
s/CAMELCASE=\"w/CAMELCASE=\"W/g
s/CAMELCASE=\"x/CAMELCASE=\"X/g
s/CAMELCASE=\"y/CAMELCASE=\"Y/g
s/CAMELCASE=\"z/CAMELCASE=\"Z/g

# Camelcase the rest ...

:docamel

s/\(CAMELCASE=\"[^\-]\+\)\-a/\1A/g
s/\(CAMELCASE=\"[^\-]\+\)\-b/\1B/g
s/\(CAMELCASE=\"[^\-]\+\)\-c/\1C/g
s/\(CAMELCASE=\"[^\-]\+\)\-d/\1D/g
s/\(CAMELCASE=\"[^\-]\+\)\-e/\1E/g
s/\(CAMELCASE=\"[^\-]\+\)\-f/\1F/g
s/\(CAMELCASE=\"[^\-]\+\)\-g/\1G/g
s/\(CAMELCASE=\"[^\-]\+\)\-h/\1H/g
s/\(CAMELCASE=\"[^\-]\+\)\-i/\1I/g
s/\(CAMELCASE=\"[^\-]\+\)\-j/\1J/g
s/\(CAMELCASE=\"[^\-]\+\)\-k/\1K/g
s/\(CAMELCASE=\"[^\-]\+\)\-l/\1L/g
s/\(CAMELCASE=\"[^\-]\+\)\-m/\1M/g
s/\(CAMELCASE=\"[^\-]\+\)\-n/\1N/g
s/\(CAMELCASE=\"[^\-]\+\)\-o/\1O/g
s/\(CAMELCASE=\"[^\-]\+\)\-p/\1P/g
s/\(CAMELCASE=\"[^\-]\+\)\-q/\1Q/g
s/\(CAMELCASE=\"[^\-]\+\)\-r/\1R/g
s/\(CAMELCASE=\"[^\-]\+\)\-s/\1S/g
s/\(CAMELCASE=\"[^\-]\+\)\-t/\1T/g
s/\(CAMELCASE=\"[^\-]\+\)\-u/\1U/g
s/\(CAMELCASE=\"[^\-]\+\)\-v/\1V/g
s/\(CAMELCASE=\"[^\-]\+\)\-w/\1W/g
s/\(CAMELCASE=\"[^\-]\+\)\-x/\1X/g
s/\(CAMELCASE=\"[^\-]\+\)\-y/\1Y/g
s/\(CAMELCASE=\"[^\-]\+\)\-z/\1Z/g

/CAMELCASE=\"[^\-]\+\-[a-z]/{
	b docamel
}

# generate page element string ...
s/<input.*${indexfield}=\"\([^\"]\+\)\".*CAMELCASE=\"\([^\"]\+\)\".*type=\"\([^\"]\+\)[^>]\+>/\t{\n\t\t\"name\" : \"\2\",\n\t\t\"byExpr\" : \"\1\",\n\t\t\"byType\" : \"${indexfield}\",\n\t\t\"htmlType\" : \"\3\"\n\t}/g

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
