/nop 这个文件需要 /read ansi.sc
/act {$_CYN审判官说道：%1除以%2馀} {/ctoi tmpx {%%1};/ctoi tmpy {%%2};/math answer {$tmpx%%%%$tmpy};Answer} {3}
/act {$_CYN审判官说道：%1减去%2等} {/ctoi tmpx {%%1};/ctoi tmpy {%%2};/math answer {$tmpx-$tmpy};Answer} {3}
/act {$_CYN审判官说道：%1加上%2等} {/ctoi tmpx {%%1};/ctoi tmpy {%%2};/math answer {$tmpx+$tmpy};Answer} {3}
/act {$_CYN审判官说道：%1和%2的最大公} {/ctoi tmpx {%%1};/ctoi tmpy {%%2};/if {$tmpx<$tmpy} {/math tmpz $tmpx;/math tmpx $tmpy;/math tmpy $tmpz};gongyinshu} {3}
/act {$_CYN审判官说道：%1乘上%2，个位数等} {/ctoi tmpx {%%1};/ctoi tmpy {%%2};/math answer {$tmpx*$tmpy%%%%10};Answer} {3}
/act {$_CYN审判官说道：%1乘上%2等} {/ctoi tmpx {%%1};/ctoi tmpy {%%2};/math answer {$tmpx*$tmpy};Answer} {3}
/act {$_CYN审判官说道：很好} {judgeout} {2}
/al judgeout /bell
/nop {$_CYN审判官说道：这麽简单都不会？答案等於%1。}
/var autoanswer 1
/al Answer {/if {$autoanswer=1} {answer $answer}}
/al gongyinshu {/if {$tmpy=0}{/math answer $tmpx;Answer} else {/math tmpz $tmpx;/math tmpx $tmpy;/math tmpy {$tmpz//$tmpx};gongyinshu}}
