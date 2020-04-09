# Emacs' sieve-manage is a delight.
# Alternatively, use sieve-connect:
# sieve-connect --upload --localsieve filters.sieve -s m***r.i***a.i****s.ru -u <user> [--notlsverify]
# Don't forget to activate your sieve script.

require ["copy","fileinto"];

if header :contains "Delivered-To" "gcc-patches@gcc.gnu.org" {
  fileinto "gcc-patches";
}

if header :contains "Delivered-To" "gcc@gcc.gnu.org" {
  fileinto "gcc-ml";
}

if header :contains "From"
["gcc-bugzilla@gcc.gnu.org",
 "sourceware-bugzilla@sourceware.org"] {
  fileinto "gcc-bugzilla";
}


if header :contains "List-Id"
["prac-sp-18.compilers.ispras.ru",
 "doc.compilers.ispras.ru",
 "dom.compilers.ispras.ru",
 "jvm.compilers.ispras.ru",
 "licm.compilers.ispras.ru",
 "plug.compilers.ispras.ru",
 "region.compilers.ispras.ru",
 "ssa.compilers.ispras.ru"] {
  fileinto "prac";
}

if header :contains "To"
["prac-sp-18.compilers.ispras.ru",
 "doc.compilers.ispras.ru",
 "dom.compilers.ispras.ru",
 "jvm.compilers.ispras.ru",
 "licm.compilers.ispras.ru",
 "plug.compilers.ispras.ru",
 "region.compilers.ispras.ru",
 "ssa.compilers.ispras.ru"] {
  fileinto "prac";
}

if header :matches "X-KLMS-AntiSpam-Status" "spam" {
  fileinto "Junk";
}

# rule:[fwd-compilers]
if header :contains "from" "moodle.cloud.unihub"
{
	redirect :copy "bmk-compilers@ispras.ru";
}
