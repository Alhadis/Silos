/al bell {/bell;showg (BELL,TOTAL=$TOTAL)}
/if {$first=0}{/math difflvl $difflvl;/var fHurt1 100;/var fHurt2 -100;/var fHurt0 100;dd;arm 1;ftx 0;/var okquan 0;/var win 0;/var clockhuti 0;/var forcel0 0;/var mihun 0;/var ldlh 0;/var loc2 0;/var mywpbroken 0;/var dhwl 0;/var ssj 0;/var proWp 0}
/if {$_clockTask=0}{/var _clockTask $_clock}

/math doall 1
/var autotask 1
/act {${_CYN}如来佛点了点头说道：“看来你真的}{/if {$autotask>0}{/var _clockTask $_clock;/2 ctask;upTime cctask}} {3}

/act {如来已经出手}{/var task 0}
/act {你现在要完成的任务是去%0降%1。} {/var difflvl 5;/var loc %0;/var frd %1;/var type xiang;/var task 1}
/act {你现在要完成的任务是去%0杀%1。} {/var difflvl 5;/var loc %0;/var frd %1;/var type kill;/var task 1}
/act {你现在要完成的任务是去%0劝%1。} {/var difflvl 5;/var loc %0;/var frd %1;/var type quan;/var task 1}
/act {你现在要完成的任务是去%0擒%1。} {/var difflvl 5;/var loc %0;/var frd %1;/var type get;/var task 1}
/act {你现在要完成的任务是去%0降%1。难度：%2} {/ctoi difflvl %2;/var loc %0;/var frd %1;/var type xiang;/var task 1}
/act {你现在要完成的任务是去%0杀%1。难度：%2} {/ctoi difflvl %2;/var loc %0;/var frd %1;/var type kill;/var task 1}
/act {你现在要完成的任务是去%0劝%1。难度：%2} {/ctoi difflvl %2;/var loc %0;/var frd %1;/var type quan;/var task 1}
/act {你现在要完成的任务是去%0擒%1。难度：%2} {/ctoi difflvl %2;/var loc %0;/var frd %1;/var type get;/var task 1}
/act {你今天已经要了%0个任务。} {/ctoi TOTAL %0}
/act {现在已经天下太平} {/var task -1;/if {$autotask}{tick+ bell 5}}
/al cctask {/if {$task=1}{/if {[$menpai=lg]}{/var menpai lg0};/if {[$menpai!=putuo] && [$menpai!=hell] && [$menpai!=lg0] && $proWp=0}{remove shield;unwield $wpa;wld;wear all};/var xiang 2;/var doSeq 1;autoTask} else {/if {$task>-1}{cancel;zchan 1}}}
/al autotask {/var doSeq 1;/al fdead fdead0;/al noppl /nop;cc 1;/var ehuti 0;/var done 0;/var cancel 0;/var doDuo 0;/if {$first=0}{/var loc2 0;/var fHurt1 100;/var fHurt2 -100;/var fHurt0 100;dd;arm 1;ftx 0;/var okquan 0;/var win 0;/var mihun 0;/var ldlh 0;/var dhwl 0;/var ssj 0;/var proWp 0} else {huti;/if {[$type!=xiang] && [$menpai!=wdd] && [$menpai!=moon]}{ext}};/math first $first+1;/if {[$loc2!=0]}{/var loc $loc2};/sys perl tscan.pl $name $loc;nn 4;/if {[$menpai=moon]}{ef 0;perform wuxue};/read tscan.$name.sc}
/act {(Yao guai)}{/math nYaoguai $nYaoguai+$doSeq}{6}
/act {$frd(Yao guai)}{/if {$doSeq}{/var doSeq 0;fl yao guai $nYaoguai;l yao guai $nYaoguai}}
/act {(Yao guai)%0。} {/var WP 0} {4}
/act {$_HIC  □$_NOR金环锁子甲(Golden armor)} {hdGuai$menpai}
/act {$_HIC	□$_NOR金环锁子甲(Golden armor)} {hdGuai$menpai}
/al hdGuaiputuo {/if {$autotask>1}{/if {($doall=0 || [$WP=ice blade]) && ([$WP=ice blade] || ([$WP=00] && $difflvl>2) || ($difflvl>2 && [$WP!=qinghong sword] && [$WP!=xuanhua fu] && [$WP!=dragon mace] && [$WP!=gang zhang] && [$WP!=wuchang bang] && [$WP!=golden spear] && [$WP!=dragon whip] && [$WP!=0]))}{escfly endSeq} else {/if {((([$type=xiang] || [$type=kill]) && [$WP!=yanyun blade] && [$WP!=wuchang bang]) || ($first<2 && [ehuti!=wx])) && $difflvl=1 && [$WP!=gang zhang]}{eff +} else {eff 0};huti;ext;/if {[$WP=dragon mace] && $difflvl>1}{arm 0};ft yao guai $nYaoguai;aa;tick+ tickft 4;/if {$difflvl>1 && [$WP!=gang_zhang] && [$WP!=wuchang_bang]}{/if {[$type=xiang] && $difflvl>2}{tick+ F2 0.5} else {/if {$difflvl>2 || ([$type=xiang] && $difflvl=2)}{tick+ F2 1} else {/if {$difflvl=2}{tick+ F2 2}}}}}}}

/act {她身上} {/var female 1}
/act {他身上} {/var female 0}
/act {$_HIC  □$_NOR%0(%1)} {/tolower WP %1} {6}
/act {$_HIC	□$_NOR%0(%1)} {/tolower WP %1} {6}
/act {$_HIC  □$_NOR%0(%1piece)} {/nop} {5}
/act {$_HIC	□$_NOR%0(%1piece)} {/nop} {5}
/act {[%0]} {/var nYaoguai 1;/var doSeq 1} {6}

/al fHurt fHurt$menpai
/al fHurtputuo {/var fHurt %0;/if {%%0>-40 && %%0<0}{/var okquan 1};/if {[$type=quan]}{/if {%%%0>-40 && %%%0<0}{/sleep 1;quan yao;/if {%%%%0>-20}{cc 0;eff 0}}};/if {[$type=xiang]}{/if {%%%0>-40 && %%%0<40}{surrender}};/if {[$type=get]}{/if {((%%%0>-20 && $difflvl=1)|| %%%0>-10) && %%%0<=0}{/math tmp $forcea/3-20;ftx $tmp}};/if {[$type!=kill] && %%0>-10 && %%0<=0}{eff 0}}

/al showtask {/math timeClock $_clock-$_clockTask;/math minClock $timeClock/60;/math secClock $timeClock//60;showg ($loc, $type, $frd, $difflvl, TOTAL:$TOTAL, ${minClock}分${secClock}秒)}

/al tickft tickft$menpai
/al tickftputuo {showtask;/if {!$que}{chk {/if {($fa<2500 || ($difflvl>2 && ($okquan || $first<4) && $nei-500<$Nei)) && $done=0}{escRecover} else {/if {[$inext=0]}{ext} else {/if {$perQix<100}{/5 eat $yao};/if {$qix*100<85*$Qix && $nei*2>$Nei}{F2} else {/math clockyy $clockyy;/if {$_clock-$clockyy>16 && $cc && $nei>$Nei-1500}{aa} else {/if {$nei+400<$Nei}{cs2} else {/if {[$type=quan] && $okquan && [$ehuti!=nx]}{Quan}}}}}}}}}

/al Quan {/if {[$inext=0]}{showg inext=0, DON'T quan yao guai!} else {/if {([$inext=huti] || [$inext=poweup]) && ($_clock-$clockhuti>$forcel0*2-10)}{showg WAITING $inext to expire then quan...} else {quan yao guai}}}

/al FLY fly kaifeng
/al FLYAct kfAct
/al escRec0 {lsh 1;att3 1;Finisht chkshaqi chkJinchuang {/if {[$type!=xiang] && [$menpai!=wdd] && [$menpai!=moon]}{ext};ctask;ctask;upTime cctask}}
/al escRecover {tick- tickft;Que Escfly {/sleep 5;/if {$ldlh=1 || ($perShen<100)}{fly changan;cureall;/sleep 5;escRec0} else {escRec0}}}
/al cancelTask {/var cancel 1;xiang 0;Que Escfly {/sleep 5;/if {$ldlh=1 || ($perShen<100)}{fly changan;cureall;/sleep 5;endSeq} else {endSeq}}}
/al escfly {/al escFly /nop;/al escFly %0;/math tmp $nSeq-1;/if {${outdoor$tmp}}{f2;f3;FLY;FLYAct {escFly}} else {Escfly %%0}}
/al Escfly {/var loc20 $loc2;/al escFly /nop;/al escFly %0;time;/if {$OUTDOOR && $nSeq>1}{/var nrSeq $nSeq;seq$nSeq;rSeq} else {/al l {f2;f3;FLY;FLYAct escFly;/al l FLY};/math tmp $NSeq-1;/loop {$nSeq,$tmp}{seq%0};/var loc2 $loc20;/unal l}}
/al rSeq {rseq$nrSeq;/math nrSeq $nrSeq-1;/if {${outdoor$nrSeq}}{f2;f3;FLY;FLYAct escFly} else {rSeq}}
