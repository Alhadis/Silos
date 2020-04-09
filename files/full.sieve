require "date";
require "relational";
require "vacation";

if allof (currentdate :value "ge" "date" "2015-04-05",
          currentdate :value "le" "date" "2015-04-09") {
  redirect "suzuki@example.co.jp";
}

if allof(currentdate :value "ge" "date" "2015-04-05",
	 currentdate :value "le" "date" "2015-04-09") {
  if anyof(address :domain ["from"] ["example.com"],
           address :domain ["from"] ["example.co.jp"],
           address :domain ["from"] ["example.net"],
	   address :is ["from"] ["taro@example.org"],
	   address :is ["from"] ["hanako@example.org"]) {
    vacation
      :days 1
      :subject "休暇中"
      :addresses ["suzuki@example.com"]
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\"休暇中\"です。
帰ってきたら返信します。
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- 
Ichiro Suzuki";
  }
}

keep;
