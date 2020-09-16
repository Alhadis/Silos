/var force 1
/var forcea 1
/var spell 1
/var spella 1
/var tizia 10
/var spia 10

/read data/$name.data

/if {$force<30} {/math tizi $tizia} else {/math tizi {$force/10-2+$tizia}}
/nop if {$tizi>40} {/math tizi 40}
/math enforce {$forcea/2}
/var ef 1

/if {$spell<30} {/math spi $spia} else {/math spi {$spell/10-2+$spia}}
/nop if {$spi>40} {/math spi 40}

/al updata {/al updataAct /nop;/al updataAct %0;score;skills;enable;\
/act { (force)%0[2;37;0m%1[2;37;0m%2/} {/math force %2;/unact { (force)%0[2;37;0m%1[2;37;0m%2/} } {2};\
/act { (spell)%0[2;37;0m%1[2;37;0m%2/} {/math spell %2;/unact { (spell)%0[2;37;0m%1[2;37;0m%2/} } {2};\
/act {ÄÚ¹¦ (force)%0ÓÐÐ§µÈ¼¶£º%1} {/math forcea %1;/unact {ÄÚ¹¦ (force)%0ÓÐÐ§µÈ¼¶£º%1} } {1};\
/act {·¨Êõ (spell)%0ÓÐÐ§µÈ¼¶£º%1} {/math spella %1;/unact {·¨Êõ (spell)%0ÓÐÐ§µÈ¼¶£º%1} } {1};\
upTime {/read ../updata.sc;updataAct};/nop}
