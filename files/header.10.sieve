# BEGIN MiniG sieve filter header template

require [ "fileinto", "imapflags", "vacation" ];

if header :contains "X-DSPAM-Result" "Spam" {
	fileinto "${minig:spam}";
	stop;
}

if header :contains "X-Spam-Flag" "YES" {
	fileinto "${minig:spam}";
	stop;
}

# END MiniG sieve filter header template
