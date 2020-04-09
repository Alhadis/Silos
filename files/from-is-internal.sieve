require "regex";
require "vacation";

if address :regex ["from"] ["^.+@example\.(co\.jp|com|net)$"] {
  vacation
    :days 1
    :subject "休暇中"
    :addresses ["suzuki@example.com"]
"休暇中です。
帰ってきたら返信します。
-- 
Ichiro Suzuki";
}

keep;
