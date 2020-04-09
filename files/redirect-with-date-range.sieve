require "date";
require "relational";

if allof (currentdate :value "ge" "date" "2015-04-05",
          currentdate :value "le" "date" "2015-04-09")
{
  redirect "suzuki@example.co.jp";
}

keep;
