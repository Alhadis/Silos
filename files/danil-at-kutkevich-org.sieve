# Danil <danil@kutkevich.org>.
# <https://www.fastmail.com/help/technical/sieve-examples.html>.

if header :contains ["x-resolved-to"] "+personalitysentitem-20160237@" {
  setflag "\\Seen";
  fileinto "INBOX.Sent Items";
  stop;
}

if not header :contains ["X-Spam-known-sender"] "yes" {
  if allof(header :contains ["X-Backscatter"] "yes",
           not header :matches ["X-LinkName"] "*") {
      fileinto "INBOX.Junk Mail";
      stop;
  }
  if header :value "ge" :comparator "i;ascii-numeric" ["X-Spam-score"] ["5"]  {
      fileinto "INBOX.Junk Mail";
      stop;
  }
}

if header :is ["list-id", "list-post"] ["ror2ru.googlegroups.com", "<ror2ru.googlegroups.com>"] {
  fileinto "INBOX.ror2ru_list";
} elsif address :all :is "from" "noreply@youtube.com" {
  fileinto "INBOX.youtube_feeds";
} elsif address :all :is "from" "notifications@disqus.net" {
  fileinto "INBOX.disqus_feeds";
} elsif header :is ["list-id", "list-post"] ["spb-archlinux.googlegroups.com", "<spb-archlinux.googlegroups.com>"] {
  fileinto "INBOX.lists";
} elsif header :is ["list-id", "list-post"] ["ru_bzr.googlegroups.com", "<ru_bzr.googlegroups.com>"] {
  fileinto "INBOX.lists";
} elsif header :is ["list-id", "list-post"] ["django-russian.googlegroups.com", "<django-russian.googlegroups.com>"] {
  fileinto "INBOX.django_russian_list";
} elsif header :is ["list-id", "list-post"] ["erlang-russian.googlegroups.com", "<erlang-russian.googlegroups.com>"] {
  fileinto "INBOX.erlang_russian_list";
} elsif address :all :is "from" "support@diamondcard.us" {
  fileinto "INBOX.lists";
} elsif header :is ["list-id", "list-post"] ["instiki-users.rubyforge.org", "<instiki-users.rubyforge.org>"] {
  fileinto "INBOX.lists";
} elsif header :regex "from" "(^|,)[[:space:]]*\"?Jolla[[:space:]]+Users[[:space:]]+Blog\"?[[:space:]]*<" {
  fileinto "INBOX.sailfishos_feeds";
} elsif header :contains "list-id" "devel.lists.sailfishos.org" {
  fileinto "INBOX.sailfishos_list";
} elsif header :is ["list-id", "list-post"] ["info-member.gnu.org", "<info-member.gnu.org>"] {
  fileinto "INBOX.fsf_lists";
} elsif address :all :is "from" "info@defectivebydesign.org" {
  fileinto "INBOX.fsf_lists";
} elsif address :all :is "from" "rms-assist@gnu.org" {
  fileinto "INBOX.fsf_lists";
} elsif address :all :is "from" "sales@fsf.org" {
  fileinto "INBOX.fsf_lists";
} elsif header :contains "list-id" "exim-users.mailground.net" {
  fileinto "INBOX.exim_lists";
} elsif header :is ["list-id", "list-post"] ["spbhug.googlegroups.com", "<spbhug.googlegroups.com>"] {
  fileinto "INBOX.lists";
} elsif header :is ["list-id", "list-post"] ["emacs-on-rails.googlegroups.com", "<emacs-on-rails.googlegroups.com>"] {
  fileinto "INBOX.emacs_community";
} elsif header :is ["list-id", "list-post"] ["spblinux.googlegroups.com", "<spblinux.googlegroups.com>"] {
  fileinto "INBOX.spblinux_list";
} elsif header :is ["list-id", "list-post"] ["pgsql-ru-general.postgresql.org", "<pgsql-ru-general.postgresql.org>"] {
  fileinto "INBOX.lists";
} elsif header :is ["list-id", "list-post"] ["thinking-sphinx.googlegroups.com", "<thinking-sphinx.googlegroups.com>"] {
  fileinto "INBOX.lists";
} elsif address :all :is ["to", "cc", "resent-to", "x-delivered-to"] "news@lists.molinos.ru" {
  fileinto "INBOX.molinos";
} elsif address :all :is "from" "contact@humblebundle.com" {
  fileinto "INBOX.humblebundle_list";
} elsif allof (header :is ["list-id", "list-post"] ["medappsupport.hospital-systems.com", "<medappsupport.hospital-systems.com>"],
               anyof (header :is "X-Redmine-Sender" "danil",
                      header :contains "Subject" "(Ready for Deploy)",
                      header :contains "Subject" "(Done)")) {
  fileinto "INBOX.sieve_trash";
} elsif allof (address :all :is "from" "no-reply@jolla.com",
               header :contains "Subject" "together.jolla.com") {
  fileinto "INBOX.jolla_community";
} elsif header :is ["list-id", "list-post"] ["<stumpwm-devel.nongnu.org>", "<mailto:stumpwm-devel@nongnu.org>"] {
  fileinto "INBOX.stumpwm_list";
} elsif header :contains "list-id" "awesome.naquadah.org" {
  fileinto "INBOX.awesome_list";
} elsif header :contains "list-id" "awesome-devel.naquadah.org" {
  fileinto "INBOX.awesome_devel_list";
} elsif header :contains "list-id" "golang-ru.googlegroups.com" {
  fileinto "INBOX.golang-ru_list";
} elsif header :contains "list-id" "forum.rustycrate.ru" {
  fileinto "INBOX.rustycrate-ru-list";
} elsif header :contains "list-id" "rust-russian.googlegroups.com" {
  fileinto "INBOX.rust-russian-list";
} elsif header :contains "list-id" "dev.suckless.org" {
  fileinto "INBOX.suckless_dev";
} elsif header :contains "Subject" "[Fail2Ban]" {
  fileinto "INBOX.fail2ban";
} elsif allof (address :all :is "from" "contact@luadns.com",
               header :contains "Subject" "[LuaDNS]: Build completed") {
  fileinto "INBOX.luadns";
} elsif allof (address :all :is "from" "cloud@fruux.com",
               header :contains "Subject" "No events") {
  fileinto "INBOX.sieve_trash";
} elsif address :all :is "from" "journal@tinkoff.ru" {
  fileinto "INBOX.tinkoff-list";
} elsif address :all :is "from" "newsletter@ink361.com" {
  fileinto "INBOX.ink361-feed";
} elsif header :contains "list-id" "fhirbase.googlegroups.com" {
  fileinto "INBOX.fhirbase-list";
} elsif address :all :is "from" "chat-noreply@fhir.org" {
  fileinto "INBOX.fhir-zulip";
} elsif header :contains "List-Subscribe" "http://www.healthintersections.com.au" {
  fileinto "INBOX.fhir-planet";
} elsif allof (address :all :is "from" "notifier@mail.rollbar.com",
               header :contains "Subject" ["holiadvice", "[hl7rus]"]) {
  fileinto "INBOX.waveaccess";
} elsif allof (address :all :is "from" "builds@travis-ci.org",
               header :contains "Subject" ["Passed: ", "Fixed: "]) {
  fileinto "INBOX.sieve_trash";
} elsif allof (address :all :is "from" "builds@drone.io",
               header :contains "Subject" "[SUCCESS]") {
  fileinto "INBOX.sieve_trash";
} elsif allof (address :all :is "from" "no-reply@webzilla.com",
               header :contains "Subject" ["Webzilla - Invoice", "is paid"],
               body :text :contains "Total due: EUR 0.00") {
  fileinto "INBOX.sieve_trash";
} elsif allof (address :all :is "from" "noreply@auto.ru",
               header :contains "Subject" "Найдены новые объявления") {
  fileinto "INBOX.auto_ru_feed";
} elsif allof (header :contains "list-id" "salemed.HealthSamurai.github.com",
               header :contains "from" "HealthSamurai TeamCity Server",
               anyof (body :text :contains "is now running",
                      body :text :contains "outcome was **SUCCESS**")) {
  fileinto "INBOX.sieve_trash";
} elsif allof (address :all :is "from" "info@velodrive.ru",
               header :contains "Content-Type" "multipart/alternative",
               header :contains "list-id" "3c63feb6") {
  fileinto "INBOX.adv";
} elsif allof (address :all :is "from" "promo@em.ivi.ru",
               header :contains "Content-Type" "multipart/alternative") {
  fileinto "INBOX.Junk Mail";
# } elsif allof (address :all :is "to" "postmaster@sazhi.net",
#                anyof (header :matches "X-Attached" ["*.docm", "*.xls", "*.zip"]
#                       body :raw :contains ["Content-Type: application/zip",
#                                            "Content-Type: application/vnd.ms-word.document.macroEnabled.12")) {
#   fileinto "INBOX.Junk Mail";
} elsif header :contains ["x-resolved-to"] "+chatlogs@" {
  addflag "$ChatLog";
  addflag "\\Seen";
  fileinto "INBOX.Chats";
  removeflag "$ChatLog";
  removeflag "\\Seen";
}

# h2.kutkevich.org.
if address :domain :is "from" "h2.kutkevich.org" {
  # netdata.
  if header :contains "Subject" "h2 recovered" {
    fileinto "INBOX.sieve_trash";
    stop;
  }

  # cron.
  if allof (header :contains "Subject" "Cron",
            body :text :contains [
                                  "remote: Create pull request for",
                                  "remote: To create a merge request for"
                                  ]) {
    fileinto "INBOX.sieve_trash";
    stop;
  }
}

# Twitter.
if allof (address :all :is "from" "noreply@kutkevich.org",
          header :contains "Subject" "[twitter]") {
  if header :contains "Subject" " @rubynoname " {
    fileinto "INBOX.twitter2";
    stop;
  }

  if header :contains "Subject" [" @emacs ", " @emacs_knight "] {
    if body :text :contains [
                             "cider",
                             "clojure",
                             "company",
                             "emacs news"
                             ] {
      fileinto "INBOX.sieve_trash";
      stop;
    }

    fileinto "INBOX.twitter2";
    stop;
  }

  if header :contains "Subject" " @somebody32 " {
    if body :text :contains [
                             "javascript",
                             "react"
                             ] {
      fileinto "INBOX.sieve_trash";
      stop;
    }

    fileinto "INBOX.twitter2";
    stop;
  }

  if allof (header :contains "Subject" [" @golang ", " @rob_pike "],
            body :text :contains "RT @") {
    fileinto "INBOX.sieve_trash";
    stop;
  }

  if header :contains "Subject" " @andreysitnik " {
    if anyof (body :text :contains "RT @",
              body :text :contains [
                                    "autoprefixer",
                                    "baikonur",
                                    "batman",
                                    "communist",
                                    "css",
                                    "cyberpunk",
                                    "eslint",
                                    "food",
                                    "front",
                                    "game",
                                    "iran",
                                    "javascript",
                                    "js",
                                    "logux",
                                    "muslim",
                                    "nasa",
                                    "nkvd",
                                    "npm",
                                    "postcss",
                                    "posthtml",
                                    "redux",
                                    "restaurant",
                                    "rule",
                                    "science",
                                    "ship",
                                    "sikh",
                                    "smartwatch",
                                    "societ",
                                    "soviet",
                                    "space",
                                    "station",
                                    "style",
                                    "superman",
                                    "ussr",
                                    "vladisvostok",
                                    "webpack"
                                    ]) {
      fileinto "INBOX.sieve_trash";
      stop;
    }

    fileinto "INBOX.twitter2";
    stop;
  }

  if header :contains "Subject" " @lostinwiki " {
    fileinto "INBOX.twitter2";
    stop;
  }

  fileinto "INBOX.twitter";
  stop;
}

if allof (address :all :is "from" "noreply@kutkevich.org",
          header :contains "Subject" "[twitter2]") {
  fileinto "INBOX.twitter_test";
  stop;
}

if address :domain :is "from" ["ah9.armor5games.com", "bh1.armor5games.com"] {
  if header :contains "Subject" "recovered" {
    fileinto "INBOX.sieve_trash";
    stop;
  }

  # if header :contains "X-Forwarded-For" "armor5games@gmail.com" {
  #   fileinto "INBOX.sieve_trash";
  #   stop;
  # }
}

# Gentoo.
if header :contains "list-id" "gentoo-user.gentoo.org" {
  fileinto "INBOX.gentoo_users";
  stop;
}
if  header :is "list-id" "gentoo-user-ru.gentoo.org" {
  fileinto "INBOX.gentoo_community";
  stop;
}

if address :all :is ["to", "cc", "bcc"] ["armor5games@gmail.com", "admin@armor5games.com"] {
  if address :all :is "from" "notifications@bugsnag.com" {
    keep;
    stop;
  }

  if address :domain :is "from" [
                                 "ah3.armor5games.com",
                                 "ah5.armor5games.com",
                                 "ah7.armor5games.com",
                                 "ah9.armor5games.com",
                                 "ah10.armor5games.com",
                                 "bh1.armor5games.com"
                                 ] {
    keep;
    stop;
  }

  if allof(anyof (header :regex "Subject" ["[а-яА-Я]"],
                  body :text :regex "[а-яА-Я]"),
           not header :contains "Subject" "IPS Community Suite") {
      fileinto "INBOX.sieve_trash";
    stop;
  }

  if address :is :domain "from" "unity3d.com" {
    fileinto "INBOX.sieve_trash";
    stop;
  }

  if address :all :is "from" "noreply@gameanalytics.com" {
    fileinto "INBOX.sieve_trash";
    stop;
  }

  fileinto "INBOX.armor5games";
  stop;
}

if address :all :is "from" "do-not-reply@trello.com" {
  if header :contains "Subject" "on Rise of Pirates" {
    fileinto "INBOX.armor5games";
    stop;
  }
}

if allof(address :all :is "from" [
                                  "root@armor5games.com",
                                  "danil@armor5games.com"
                                  ],
         header :contains "Subject" "armor5testserver") {
  fileinto "INBOX.foobar";
  stop;
}

if address :all :is "from" "NoteBookReview@lists.techtarget.com" {
  discard;
  stop;
}

if address :all :is "from" "newsletter@bongacams.com" {
  discard;
  stop;
}
