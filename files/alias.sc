/al upTime {uptime;/al upAct /nop;/al upAct %0;/act {已经运行}{/unact {已经运行};upAct} }
/al chklag {upTime upTime upTime upTime upTime upTime upTime upTime upTime upTime uptime}

/nop here are some alias for tasks
/al xiang {/var xiang %0;/if {%%0>0} {/al esc3rd f2};/if {%%0=0} {/al esc3rd /nop}}
/al ftx {/if {[%%0=0]}{/math enforce $forcea/2;/math tizi {$force/10-2+$tizia}} else {/var enforce %%0}}
/al ecc chk {/if {$enchant<($Fa/20+1)}{/math enchant $Fa/20+1;enchant $enchant}}
/math cc 0
/al cc {/var cc %0}
/al dd {/if {[%%0=0]}{enable dodge none;enable parry none} else {enable dodge $klDodge;enable parry $klParry}}
/var yao jinchuang
/al F2 {/math dhwl $dhwl;/if {$que=1 && $dhwl!=1}{showg (F2 in que -- do nothing!!)} else {/if {2*$nei<$Nei}{cs2;exert recover} else {/if {[$menpai=putuo] && [$inext=0]}{ext};exert recover}}}
/al altask0 {/al 2ht2fly {/5 eat $yao;f2;FLY};/nop al cst2 showg WRONG cast??!;/math ef $enforce;/var guest 1;/al Hurt {/if {%%0<=0}{/math Hurt (100+%%0)/3+1;/if {$Hurt>30}{/var Hurt 30};Ht;/$Hurt eat $yao;F2;/if {$xiang<2}{ft yao guai}} else {/var Hurt %%0;/if {$Hurt<=40 || ($Hurt<80 && $xiang>0)}{F2}}};/al nxAct {escfly};/al 3axeAct {l $name};/al breakWp knockWp;/al knockWp {unwield $plow;wld};/var bag golden armor;/al ff {/if {$xiang<2}{time;Ht};/10 eat $yao;F2};/al gg {tick- tickft;tick- F2;Escfly};/al bb {time;ht;/5 exert heal;F2;fight yao guai;enforce $ef};xiang $xiang}
/al altask altask0

/al chkprice /nop
/al chkPrice {/if {[%%0=0]}{/unact {($merchandise)%0：%1两银子};/unact {($merchandise)%0：%1两黄金}} else {/var merchandise %%0;/math price 10000;list;/act {($merchandise)%0：%1两银子}{/ctoi price $1}{6};/act {($merchandise)%0：%1两黄金}{/ctoi price $1;/math price $price*100}{5};upTime {chkPrice 0;chkprice}} }

/al ftRefill0 {lsh 3;/al chkprice {/if {$price<9}{buy dan from hou;eat dan;upTime {/sleep 3;w;s;s;RefillAct1;RefillAct}} else {/math priceold $price;w;qfg;/al chkprice {/if {$priceold<$price}{s;lsh 3;buy dan from hou;eat dan;upTime {/sleep 3;w;s;s;RefillAct1;RefillAct}} else {buy wan from guafu;eat wan;upTime {s;e;e;RefillAct1;RefillAct}}};chkPrice wan}};chkPrice dan}
/al ftRefill1 {fly changan;fill skin;/4 drink skin;w;s;withdraw 2 gold;upTime {/sleep 4;n;e;s;s;e;/6 buy taogan from boss;/2 eat taogan;w;RefillAct1;RefillAct}}
/al ftRefill {/if {$taogan=1}{ftRefill1} else {ftRefill0}}
/al RefillAct0 /nop
/al RefillAct1 /nop
/al chkRefill {/al RefillAct /nop;/al RefillAct %0;/if {$fd<100 || $dk<100}{RefillAct0;ftRefill} else {RefillAct}}

/nop below are some walking alias
/al btou {fly baotou;nu;/3 nw;se;ed;ed;nw;/if {[%%0=1]}{nu;nu;bian;bian diaozuan guguai;sd;sd;wu;wu;nw;ask guguai diaozuan about 虎口洞;bian}}
/al yhua {fly baotou;sd;sd;se;ed;ed;/3 se;sd;se;se;/if {[%%0=]}{ss 3};/if {[%%0=1]}{ss 8}}
/al jping {yhua 0;ww 3;/3 nw;n;/if {[%%0=]}{n;/3 nw};/if {[%%0=1]}{n;/3 nw;ww 3}}
/al fxian {fly yinwu;sw;ww 4;/2 sw;s;w;/if {[%%0=1]}{ww 3};/if {[%%0=2]}{ww 6}}
/al chc {/if {%%0=0}{fly wuji;ee 5;sw;w;sw;nw;n;nw;w;/nop east gate};/if {%%0=1}{chc 0;nn 4;ww 3;su;eu;sw;su;se;ee 3;nu};/if {%%0=2} {sd;ww 4;nw;nd;ne;wd;nd;ww 3;ss 4;e};/if {%%0=3}{chc 0;ss 3;ww 3;/5 nu;n}}
/al zchan {/if {%%0=1}{abdAct;e;/if {[$menpai=hella] || [$menpai=hell]}{s} else {n};save;cs2;zuochan};/if {%%0=2}{/if {[$menpai=hella] || [$menpai=hell]}{n} else {s};w}}
/al lsh {/if {[%%0=0]} {fly lingshan;w;w;s;wu;sw;nu;wu;nw;n;nw;wu};/if {[%%0=1]} {tick- tickft;tick- F2;huti 0;/al kill showg kill at rulai's place?;/var frd frd;lsh 0;ss 5;/if {[$menpai=hella] || [$menpai=hell]}{wl 0;ef 0}};/if {[%%0=3] || [%%0=hou]}{fly lingshan;ww 3;ee 4;n;n;Mnt 0;e};/if {[%%0=shi]}{fly lingshan;ww 3;ee 4;nn 4;ee 5;n};/if {[%%0=+]}{fly lingshan;ww 3;ee 7};/if {[%%0=2]}{lsh +;ss 3};/if {[%%0=bjin]}{fly lingshan;ee 11;se;s;se;se;s;sw;sw};/if {[%%0=fo]}{lsh 1;/if {[$type=get]}{get yao from yao guai;get fen from yao guai;/if {$autotask<2}{get all from yao guai};dp yao guai};zchan 1}}
/al maoy {/if {[%%0=0]} {/nop sw;sw;su;se;se;e;e;e;nd;ne}}
/al psi {/nop 1 to daoshi, 3,5 to shuizhi jing;/if {%%0=1} {fly pansi;sw;w;wu;e;nw;ne;ne;e;sw;se;eu;/5 se};/if {%%0=3}{fly pansi;sw;w;wu;ne;ne;e;se;eu;/5 nw;ne;ed;/nop ed};/if {%%0=5}{fly zhuzi;n;n;n;n;n;n;n;n;w;w;nw;nw;sw;w;wu;nw;nw;ne;ed;/nop ed}}
/al wuj {fly wuji;ee 5;eu;se;eu}
/al zhj {fly zhujie;ne;nu;nw;ne;nu;e;e;se;ne;nu;ne;nw;ww 3;sw;sw;se;e;ne}
/al zhz {fly zhuzi;nn 9;ss 6}
/al bqiu {fly wudidong;nu;ed;se;ee 2;/if {[%%0!=0]}{e};/if {[%%0=1] || [%%0=2]}{n;ne;ee 2};/if {[%%0=2]}{se;s;sw}}
/al wdd {/if {[%%0=0]}{fly wudidong;wu;sd;sw;w}}
/al pding {fly pingding;n;ne;ne;se}
/al ylong {/if {[%%0=0]} {fly yalong;wu;su;sw;se;s;sw};/if {[%%0=2]}{ne;n;nw;ne};/if {[%%0=1]}{ylong 0;sw};/if {[%%0=food]}{ylong 0;e;e;/3 get food;w;w;ylong 2}}
/al jlei {fly jilei;s;se;sw;se;sw;se;se}
/al qfg {/if {[%%0=0]}{wdd 0;ww 7} else {qfg 0;ww 5;Mnt 0;n}}
/al qlin {/if {%%0=0}{fly zhuzi;nn 8;ss 6;ee 4;ne;eu;eu;se;climb;right;right;climb;right;climb;nw;wu;ne};/if {%%0=1}{fly qilin;right;climb;right;climb;nw;wu}}
/al scan {/sys perl scan.pl %0;/read scan.sc}
