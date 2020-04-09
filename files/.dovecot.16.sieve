require ["fileinto", "regex"];

if header :is ["X-Spam-Flag"] "YES" {
  fileinto "Junk";
}

if header :contains ["Subject"] "[Fail2Ban]" {
  fileinto "Logs";
}

# File emails from any social networking sites into a folder called 
# "@Social". Note the use of a regular expression to match Facebook's 
# emails to addresses of a form like:
# notification+odfojhrw@facebookmail.com
# 
if anyof (
     header :contains ["From"] "notify@twitter.com",
     header :contains ["From"] "invitations-noreply@linkedin.com",
     header :contains ["Reply-To"] "noreply@facebookmail.com",
     header :regex ["From"] "notification\+.+@facebookmail.com",
     header :contains ["Sender"] "messages-noreply@bounce.linkedin.com",
     header :contains ["Sender"] "jobs-listings@linkedin.com",
     header :contains ["Sender"] "member@linkedin.com",
     header :contains ["Sender"] "jobs-listings@linkedin.com"
)
 {
    fileinto "Social";
    stop;
}

if header :is ["To"] "spam@viktorstanchev.com" {
    fileinto "Junk";
    stop;
}  

if header :contains ["List-Id"] "secu-share.lists.secushare.org" {
    fileinto "Lists/SecuShare";
    stop;
}

if header :contains ["List-Id"] "secu-dev.lists.secushare.org" {
    fileinto "Lists/SecuShare";
    stop;
}

if header :contains ["List-Id"] "securesocial.googlegroups.com" {
    fileinto "Lists/SecureSocial";
    stop;
}

if header :contains ["List-Id"] "OpenPGP.js Mailing List" {
    fileinto "Lists/OpenPGPJS";
    stop;
}

if header :contains ["List-Id"] "opendata.lists.uwaterloo.ca" {
    fileinto "Lists/OpenDataUW";
    stop;
}

if header :contains ["List-Id"] "play-framework.googlegroups.com" {
    fileinto "Lists/PlayFramework";
    stop;
}

if header :contains ["List-Id"] "otr-users.lists.cypherpunks.ca" {
    fileinto "Lists/OTR";
    stop;
}

if header :contains ["List-Id"] "gnunet-developers.gnu.org" {
    fileinto "Lists/GNUNet";
    stop;
}

if header :contains ["List-Id"] "public-fedsocweb.w3.org" {
    fileinto "Lists/FedSocWeb";
    stop;
}

if header :contains ["List-Id"] "liberationtech.lists.stanford.edu" {
    fileinto "Lists/LiberationTech";
    stop;
}

if header :contains ["List-Id"] "fulldisclosure.seclists.org" {
    fileinto "Lists/FullDisclosure";
    stop;
}

if header :contains ["List-Id"] "fulldisclosure.nmap.org" {
    fileinto "Lists/FullDisclosure";
    stop;
}

if header :contains ["List-Id"] "nix-dev.lists.science.uu.nl" {
    fileinto "Lists/Nix";
    stop;
}

if header :contains ["List-Id"] "aur-general.archlinux.org" {
    fileinto "Lists/AURGeneral";
    stop;
}
