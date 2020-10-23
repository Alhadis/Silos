//<continuation number="40">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_140_梨深のハンカチ";
		$GameContiune = 1;
		Reset();
	}

		ch07_140_梨深のハンカチ();
}


function ch07_140_梨深のハンカチ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();



//※拓巳視点に戻る

//ＢＧ//黒
	CreateColor("背景１", 500, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 1000, null, true);

	CreateColor("背景２", 1000, 0, 0, 1280, 720, "Black");
	Fade("背景２", 0, 300, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
幻聴はあれきり聞こえなくなったけど、それ以上教室にいることに耐えきれなくて、午後の授業が終わるまでほぼ半日、トイレの個室に籠もっていた。

すぐにベースに帰らなかったのは、まだ未練たらしく、梨深と会えないかなって期待してたから。

だから放課後になってみんなが帰った後、僕はこっそりと無人の教室に戻った。

そこに梨深がひとりで待っていて、僕を見て微笑んで、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常ビシッ！","angry", 600, @0);
	FadeStand("st梨深_制服_通常ビシッ！_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//ＶＦ//妄想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14000010ri">
「ビシィッ！　どこ行ってたの？　待ってたんだよ」

{	Stand("st梨深_制服_通常","smile", 600, @0);
	FadeStand("st梨深_制服_通常_smile", 500, false);
	DeleteStand("st梨深_制服_通常ビシッ！_angry", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14000020ri">
「一緒に帰ろっか、タク」

{	DeleteStand("st梨深_制服_通常_smile", 500, true);
	Fade("背景２", 0, 0, null, true);
	Delete("背景２");}
そう言ってくれるんじゃないかって。
ちょっとだけ、そんな展開を望んでた。

でも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//教室//夕方
	CreateTexture360("背景２", 400, 0, 0, "cg/bg/bg017_02_2_教室_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	DrawTransition("背景１", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);

	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
教室には、誰もいなかった。
僕を待ってる人なんて、いるわけがなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//中庭//夕方
	CreateTexture360("背景３", 300, 0, 0, "cg/bg/bg043_01_2_学校中庭_a.jpg");
	Fade("背景３", 0, 1000, null, true);
	DrawTransition("背景２", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);

	Delete("背景２");
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
中庭にも行ってみた。

ここで、梨深は僕に“一緒にいてあげる”と言ってくれたんだ。

でも今は、誰もいなかった。

//◆コスモス
花壇に咲く紫色の花だけが、秋の風に吹かれて寂しく揺れていた。

カバンの中から、朱色のハンカチを取り出してみる。
それは以前に梨深からもらったものだ。

試しに匂いを嗅いでみたけど、一度洗ったせいか、フローラルな香りはしなかった。

ハンカチはあるのに、香りはしない。
記憶はあるのに、梨深はいない。

脳内女子に会いたいと願って、

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14000030ta">
「なんて――」

放課後の校内を徘徊し、

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14000040ta">
「なんて、救いようがないんだ、僕って……」

女物のハンカチを口許に添えている、僕。

キモすぎて、反吐が出そうだよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(1000);
	
	Wait(3000);
	
}