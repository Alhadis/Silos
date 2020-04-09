require ["fileinto", "envelope", "imap4flags"];
if address :is "from" "nimrod@shore.co.il" { setflag "\\seen"; }

if address :is :domain "from" [ "drushim.co.il", "indeed.com", "picaro.co.il",
"jobnet.co.il", "cps.co.il", "seev.co.il", "yad2jobs.co.il", "mindu.co.il",
"korentec.co.il", "ethosia.com", "ethosia.co.il", "nisha.co.il", "alljob.co.il",
"alljobs.co.il", "propel.co.il", "simplyfind.co.il", "jobby.co.il",
"niloosoft.com", "qhr.co.il", "dialog.co.il", "taldor.co.il", "linkedin.com",
"*.linkedin.com", "hire.withgoogle.com" , "hunterhrms.com", "triplebyte.com",
"gun.io", "lever.co", "*.lever.co", "logica-it.co.il", "lever.co", "*.lever.co",
"woo.io" ]
{
	fileinto "Wanted";
}
elsif anyof (
    address :is :domain "from" [ "puppetlabs.com", "drivehq.com", "bsdmag.org", "macecraft.com", "rol.co.il", "pointmail.co.za", "agora.co.il", "bsdmag.com", "check.me", "dvorak.org", "perlmaven.com", "itnewsletter.co.il", "aerofs.com", "lastpass.com", "openstack-israel.org", "sdjournal.org", "htisrael.co.il", "github.com", "marriott-email.com", "meetup.com", "8662244.co.il", "software.com.pl", "heroku.com", "eg-innovations.net", "email-marriott.com", "info.docker.com", "docker.com", "docker.io", "onedrive.microsoft.com", "aerofs.com", "m.aerofs.com", "airbnb.com", "circleci.com", "bugs.debian.org", "getcloudify.com", "mqg.org.il", "samerica.co.il", "gigaspaces.com", "getcloudify.org", "email.aol.com", "maccabi-news.co.il", "microfocus.com", "*.microfocus.com", "statscraft.org.il", "novell.com" ],
    address :is "from" [ "ecomeshek@gmail.com", "ironethaifa@haifa.muni.il" ],
    address :is :domain "to" [ "openbsd.org", "meetup.com" ])
{
	fileinto "Mailing lists";
}
elsif address :is :domain "from" [ "paypal.co.il", "paypal.com", "*.paypal.co.il", "*.paypal.com" ]
{
	fileinto "PayPal";
}
elsif address :is :domain "from" [ "amazon.com", "*.amazon.com" ]
{
	fileinto "Amazon";
}
elsif anyof (address :is :domain "from" [ "travelbird.be", "nitzan-hr.com", "ispc.co.il", "meckano.co.il", "kustonline.be", "freefax.co.il", "summary.com", "twoomail.com", "thephonehouse.es", "*.thephonehouse.es" ],
	address :is "from" [ "rsnc.office@gmail.com", "zelba100@gmail.com" ])
{
	fileinto "Junk";
}
elsif address :is :domain "from" [ "migdal.co.il", "*.migdal.co.il", "bezeqint.co.il", "youphone.co.il", "bezeq.co.il", "bezeqint.net", "kali.co.il", "ari-ins.co.il", "altshul.co.il", "*.migdal.co.il", "moran-fin.com", "migdigital.co.il", "*.migdigital.co.il" ]
{
	fileinto "Saved";
}
elsif address :is :domain "from" [ "unilink.co.il", "malam.com" ]
{
	fileinto "Unilink";
}
elsif anyof (address :is "from" [ "or.siniminis@gmail.com", "hastudio.theater@gmail.com", "hastudiotheatre@gmail.com" ],
	address :is :domain "from" "ayalagroup.co.il")
{
	setflag "\\seen";
	fileinto "Cinematheque";
}
elsif address :is :domain "from" [ "startcom.org", "davidcpa.co.il", "icount.co.il" ]
{
	fileinto "Shore";
}
elsif address :is :domain "from" "bigpanda.io"
{
	fileinto "bigpanda";
}
elsif address :is :domain "from" [ "wiser.com", "wisepricer.com" ]
{
	fileinto "Wiser";
}
elsif address :is :domain "from" [ "scaleway.com", "*.scaleway.com", "online.net", "*.online.net" ]
{
    fileinto "scaleway";
}
elsif address :is :domain "from" [ "spot.im" ]
{
	fileinto "spot.im";
}
elsif address :is :domain "from" [ "ebay.com", "*.ebay.com", "ebay.co.il", "*.ebay.co.il" ]
{
	fileinto "ebay";
}
elsif anyof (address :is :domain "from" [ "endlessm.com", "*.endlessm.com" ], address :is "to" "nimrod@endlessm.com")
{
	fileinto "Endless";
}
elsif address :is "to" [ "abuse@shore.co.il", "clamav@shore.co.il", "ftp@shore.co.il", "hostmaster@shore.co.il", "mailer-daemon@shore.co.il", "news@shore.co.il", "nobody@shore.co.il", "noc@shore.co.il", "postmaster@shore.co.il", "root@shore.co.il", "security@shore.co.il", "usenet@shore.co.il", "webmaster@shore.co.il", "www@shore.co.il" ]
{
	fileinto "Root";
}
elsif address :is :domain "from" [ "studentsvillage.org" ]
{
	fileinto "StudentVillage";
}
elsif address :is :domain "from" [ "google.com", "*.google.com" ]
{
	fileinto "Google";
}
elsif address :is :domain "from" [ "leumi.co.il", "*.leumi.co.il",
"leumi-card.co.il", "*.leumi-card.co.il", "leumicard.co.il",
"*.leumicard.co.il", "icc.co.il" ]
{
    fileinto "Leumi";
}
elsif address :is :domain "from" [ "mizrahi-tefahot.co.il",
"*.mizrahi-tefahot.co.il", "umtb.co.il", "*.umtb.co.il" ]
{
	fileinto "Mizrahi";
}
