/nop 这个文件需要 /read ansi.sc
/act {你$_RED受伤} {Hurt -5} {1}
/act {你$_RED已经} {Hurt 1} {1}
/act {你$_RED伤重} {Hurt -10} {1}
/act {你$_RED摇头} {Hurt 10} {1}
/act {你$_HIR受} {Hurt -20} {1}
/act {你$_HIR看} {Hurt 20} {1}
/act {你$_HIR已经伤} {Hurt -30} {1}
/act {你$_HIR已经一} {Hurt 30} {1}
/act {你$_HIR气息} {Hurt -40} {1}

/act {你$_HIR两眼} {Hurt 0} {1};/nop 40-60 shen
/act {你$_HIR迷迷} {Hurt 0} {1};/nop 20-40 shen
/act {你$_RED神智} {Hurt 0} {1};/nop 10-20 shen
/act {你$_RED心智} {Hurt 0} {1};/nop  0-10 shen

/act {你$_HIR似乎} {Hurt 40} {1}
/act {你$_HIY受伤}{Hurt -60} {1}
/act {你$_HIY气}  {Hurt 60} {1}
/act {你$_HIY受了}{Hurt -80} {1}
/act {你$_HIY动作}{Hurt 80} {1}
/act {你$_HIY看起来可能受}{Hurt -90} {1}
/act {你$_HIY看起来可能有}{Hurt 90} {1}
/act {你$_HIG似乎受}{Hurt -95} {1}
/act {你$_HIG似乎有}{Hurt 95} {1}

/act {$_RED受伤过重，已经有} {eHurt0 -1} {3}
/act {$_RED受伤过重，已经奄} {eHurt0 -5} {3}
/act {$_RED已经} {eHurt0 1} {3}
/act {$_RED伤重} {eHurt0 -10} {3}
/act {$_RED摇头} {eHurt0 10} {3}
/act {$_HIR受} {eHurt0 -20} {3}
/act {$_HIR看起来已} {eHurt0 20} {3}
/act {$_HIR已经伤} {eHurt0 -30} {3}
/act {$_HIR已经一} {eHurt0 30} {3}

/act {$_HIR两眼} {eHurt0 -40} {3};/nop 40-60 shen
/act {$_HIR迷迷} {eHurt0 -20} {3};/nop 20-40 shen
/act {$_RED神智} {eHurt0 -10} {3};/nop 10-20 shen
/act {$_RED心智} {eHurt0 1} {3};/nop  0-10 shen

/act {$_HIR气息} {eHurt0 -40} {3}
/act {$_HIR似乎} {eHurt0 40} {3}
/act {$_HIY受伤}{eHurt0 -60} {3}
/act {$_HIY气}  {eHurt0 60} {3}
/act {$_HIY受了}{eHurt0 -80} {3}
/act {$_HIY动作}{eHurt0 80} {3}
/act {$_HIY看起来可能受}{eHurt0 -90} {3}
/act {$_HIY看起来可能有}{eHurt0 90} {3}
/act {$_HIG似乎受}{eHurt0 -95} {3}
/act {$_HIG似乎有}{eHurt0 95} {3}

/act {$frd$_RED受伤过重，已经有} {fHurt0 -1} {2}
/act {$frd$_RED受伤过重，已经奄} {fHurt0 -5} {2}
/act {$frd$_RED已经} {fHurt0 1} {2}
/act {$frd$_RED伤重} {fHurt0 -10} {2}
/act {$frd$_RED摇头} {fHurt0 10} {2}
/act {$frd$_HIR受} {fHurt0 -20} {2}
/act {$frd$_HIR看起来已} {fHurt0 20} {2}
/act {$frd$_HIR已经伤} {fHurt0 -30} {2}
/act {$frd$_HIR已经一} {fHurt0 30} {2}

/act {$frd$_HIR两眼} {fHurt0 -40} {2};/nop 40-60 shen
/act {$frd$_HIR迷迷} {fHurt0 -20} {2};/nop 20-40 shen
/act {$frd$_RED神智} {fHurt0 -10} {2};/nop 10-20 shen
/act {$frd$_RED心智} {fHurt0 1} {2};/nop  0-10 shen

/act {$frd$_HIR气息} {fHurt0 -40} {2}
/act {$frd$_HIR似乎} {fHurt0 40} {2}
/act {$frd$_HIY受伤}{fHurt0 -60} {2}
/act {$frd$_HIY气}  {fHurt0 60} {2}
/act {$frd$_HIY受了}{fHurt0 -80} {2}
/act {$frd$_HIY动作}{fHurt0 80} {2}
/act {$frd$_HIY看起来可能受}{fHurt0 -90} {2}
/act {$frd$_HIY看起来可能有}{fHurt0 90} {2}
/act {$frd$_HIG似乎受}{fHurt0 -95} {2}
/act {$frd$_HIG似乎有}{fHurt0 95} {2}

/al Hurt {/var Hurt %0;/if {($Hurt<1 && $Hurt>-40) || ($Hurt>0 && $Hurt<40)}{/if {$yaren=0}{/pauseoff;/purge;quit;/if {$guest=0}{/ox quit;/sys echo $_clock $name Hurt$Hurt >> log/quit.log}}};/if {$Hurt<-39 && $Hurt>-90}{ht2nd};/if {$Hurt>39 && $Hurt<60}{esc2nd};/if {$Hurt>59 && $Hurt<80}{esc3rd}}
/al esc2nd /nop
/al ht2nd /nop
/al ht15 /nop
/al esc3rd /nop

/al eHurt /nop
/al fHurt /nop
/al eHurt0 {/if {$rescue=3 && ((%%0<1 && %%0>40) || (%%0>0 && %%0<11))}{Rescue};eHurt %0}
/al fHurt0 {/if {%%0<0}{/math fHurt0 0-%%0} else {/math fHurt0 %%0};/if {$fHurt0=90}{showg (fHurt0=90-100)};/if {$fHurt0=80}{showg (fHurt0=80-90)};/if {$fHurt0=60}{showg (fHurt0=60-80)};/if {$fHurt0=40}{showg (fHurt0=40-60)};/if {$fHurt0=30}{showg (fHurt0=30-40)};/if {$fHurt0=20}{showg (fHurt0=20-30)};/if {$fHurt0=10}{showg (fHurt0=10-20)};/if {$fHurt0=5}{showg (fHurt0=5-10)};/if {%%0=1}{showg (fHurt0=0-10)};/if {%%0=-1}{showg (fHurt0=0-5)};/if {$rescue=3 && ((%%0<1 && %%0>40) || (%%0>0 && %%0<11))}{Rescue};fHurt %0}
/var rescue 0
/act {脚下一个} {/if {$rescue=1} {Rescue2;/var rescue 0};/if {$rescue=2}{Rescue2};/if {$rescue=3}{Rescue} } {6}
/act {$frd脚下一个} {svFrd};/al svFrd /nop
/al res1 {/alias Rescue2 %0;/var rescue 1;/nop action on faint only--once}
/al res2 {/alias Rescue2 %0;/var rescue 2;/nop action on faint only--always}
/al res3 {/alias Rescue %0;/var rescue 3;/nop action on both deep-red and faint}
