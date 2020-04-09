require ["fileinto", "imap4flags"];

# rule:[SPAM]
if anyof (header :contains "X-Spam-Flag" "YES")
{
	fileinto "Junk";
	setflag "\\Seen";
}
# rule:[StugA Cafete]
elsif anyof (address :contains ["To", "Cc"] "cafete@fb3.stugen.de")
{
	fileinto "StugA.Cafete";
}
# rule:[StugA ESO]
elsif anyof (address :contains ["To", "Cc"] "eso@informatik.uni-bremen.de")
{
	fileinto "StugA.ESO";
}
# rule:[StugA Masterauswahlkommission]
elsif anyof (address :contains ["To", "Cc"] "master-auswahl@informatik.uni-bremen.de")
{
	fileinto "StugA.Masterauswahlkommission";
}
# rule:[StugA]
elsif anyof (header :contains "List-Id" "stugainf.mailman.zfn.uni-bremen.de")
{
	fileinto "StugA";
}
# rule:[PI1]
elsif anyof (address :contains ["To", "Cc"] ["schuerholz+pi1@uni-bremen.de", "deschuer+pi1@uni-bremen.de", "schuerholz+pi1@informatik.uni-bremen.de", "deschuer+pi1@informatik.uni-bremen.de"],
        address :contains ["To", "Cc"] ["schuerholz+pi@uni-bremen.de", "deschuer+pi@uni-bremen.de", "schuerholz+pi@informatik.uni-bremen.de", "deschuer+pi@informatik.uni-bremen.de"],
        header :contains "Subject" ["[PI1]", "[Pi1]", "[pi1]", "[PI-1]", "[Pi-1]", "[pi-1]"],
	header :contains "Subject" ["[PI]", "[Pi]", "[pi]"])
{
	fileinto "Tutorien.PI1 WiSe16.Studentenmails";
}
# rule:[PI2]
elsif anyof (address :contains ["To", "Cc"] ["schuerholz+pi2@uni-bremen.de", "deschuer+pi2@uni-bremen.de", "schuerholz+pi2@informatik.uni-bremen.de", "deschuer+pi2@informatik.uni-bremen.de"],
        address :contains ["To", "Cc"] ["schuerholz+pi@uni-bremen.de", "deschuer+pi@uni-bremen.de", "schuerholz+pi@informatik.uni-bremen.de", "deschuer+pi@informatik.uni-bremen.de"],
        header :contains "Subject" ["[PI2]", "[Pi2]", "[pi2]", "[PI-2]", "[Pi-2]", "[pi-2]"],
	header :contains "Subject" ["[PI]", "[Pi]", "[pi]"])
{
	fileinto "Tutorien.PI2 SoSe17.Studentenmails";
}
# rule:[Gitlab - ONOC]
elsif allof (address :contains "From" "gitlab@informatik.uni-bremen.de",
	header :is "X-GitLab-Project-Path" ["stuga-informatik/onoc", "stuga-informatik/onoc-eu"])
{
	fileinto "StugA.ONOC.Gitlab";
}
# rule:[ONOC]
elsif anyof (header :contains "List-Id" "onoc.mailman.zfn.uni-bremen.de")
{
	fileinto "StugA.ONOC";
}
# rule:[StugA - LaTeX-Kurse]
elsif anyof (header :contains "List-Id" "latex-kurse.mailman.zfn.uni-bremen.de")
{
	fileinto "StugA.LaTeX-Kurse";
}
# rule:[StugA - LAN (WC3)]
elsif anyof (header :contains "List-Id" "fb3-wc3.mailman.zfn.uni-bremen.de")
{
	fileinto "StugA.LAN";
}
# rule:[StugA - Minecraft]
elsif anyof (header :contains "List-Id" "minecraft_stuga_inf.mailman.zfn.uni-bremen.de")
{
	fileinto "StugA.Minecraft";
}
# rule:[StugA - KIF435]
elsif anyof (header :contains "List-Id" "kif435.events.fachschaften.org")
{
	fileinto "StugA.KIF.KIF435";
}
# rule:[StugA - KIF440]
elsif anyof (header :contains "List-Id" "kif440.events.fachschaften.org")
{
	fileinto "StugA.KIF.KIF440";
}
# rule:[StugA - KIF445]
elsif anyof (header :contains "List-Id" "kif445.events.fachschaften.org")
{
	fileinto "StugA.KIF.KIF445";
}
# rule:[StugA - KIF450]
elsif anyof (header :contains "List-Id" "kif450.events.fachschaften.org")
{
	fileinto "StugA.KIF.KIF450";
}
# rule:[StugA - KIF455]
elsif anyof (header :contains "List-Id" "kif455.events.fachschaften.org")
{
	fileinto "StugA.KIF.KIF455";
}
# rule:[StugA - KIF460 Orga]
elsif anyof (header :contains "List-Id" ["kif460-orga.mailman.zfn.uni-bremen.de", "kif460-helfer.mailman.zfn.uni-bremen.de"])
{
	fileinto "StugA.KIF.KIF460.Orga";
}
# rule:[StugA - KIF460]
elsif anyof (header :contains "List-Id" "kif460.events.fachschaften.org")
{
	fileinto "StugA.KIF.KIF460";
}
# rule:[StugAdmin - Nagios]
elsif anyof (address :contains "From" ["nagios@inf.stugen.de", "nagios@q.inf.stugen.de", "nagios@admin.stugen.de"])
{
	fileinto "StugA.Admin.Nagios";
}
elsif anyof (header :contains "From" "Cron Daemon")
{
	fileinto "StugA.Admin.Cron";
}


elsif anyof (header :contains "List-Id" "chubaka.mailman.zfn.uni-bremen.de")
{
	fileinto "Chubaka";
}

