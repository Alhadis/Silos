
HOSTS = (miriad@odin.ncsa.uiuc.edu)

FILES = (~/farch ~/sdeini ~/sdeini.csh ~/doc ~/inf ~/source ~/bin/unix ~/var ~/pvm)

${FILES} -> ${HOSTS}
	except ~/source/SCCS;
	except ~/bin/unix/SCCS;
	except ~/source/task/SCCS;
	except_pat .*~\$;
	except_pat .*\.o\$;
	except_pat .*\.cur\$;
	install -i -y -w /u/ncsa/miriad/sdeproj/sdedir;
	notify tcornwel@nrao.edu;
	notify mstupar@ncsa.uiuc.edu;

