//<continuation number="300">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_165_三住くん空気嫁";
		$GameContiune = 1;
		Reset();
	}

		ch08_165_三住くん空気嫁();
}


function ch08_165_三住くん空気嫁()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg099_01_2_AH廊下_a.jpg");
	Fade("背景２", 2000, 1000, null, true);

	Wait(1000);

	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	MusicStart("SE01", 5000, 400, 0, 1000, null, true);


//ＢＧ//ＡＨ東京総合病院・ロビー//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
三住くんと僕は、互いにぐったりと肩を落としながら、病棟の１階まで降りた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","worry", 250, @100);
	FadeStand("bu大輔_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500010mi">
「俺、もう岸本のことはどうでもよくなった……」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500020mi">
「これまでの俺のポリシーはな、タク。
可愛ければなんでも許してやる、だった」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500030mi">
「けどそりゃ間違ってたよ。
あんな強烈なデンパ、俺には受け止めらんねえよ……」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500040mi">
「素直に梢ちゃんだけ狙うことにするぜ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16500050ta">
「…………」

それはそれで、どうかと思うけど。
三住くんにはちゃんと、付き合っているカノジョがいるんだから。

{	Stand("bu大輔_制服_通常","sigh", 250, @100);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500060mi">
「お前、マジですごいな」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500070mi">
「岸本のあの脳みそお花畑な話、
よく３０分近くも聞いてられるよ。俺、尊敬したぜ」

{	Stand("bu大輔_制服_通常","worry", 250, @100);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500080mi">
「俺は３分ももたなかった……。この俺がだぞ！？」

{	DeleteStand("bu大輔_制服_通常_worry", 500, true);}
し、知らんがな……(´・ω・`)

三住くんの話は適当に聞き流し、周囲を気にしながら歩く。

と、外来棟のロビーの手前に、ぼんやりと立っている梨深の姿を見つけた。

冷たい風に吹かれ髪を揺らしているその横顔には、いつもの元気さはない。どこか思い詰めたような様子で、夕焼け空を見上げている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","normal", 250, @100);
	FadeStand("bu大輔_制服_通常_normal", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500090mi">
「おーい、梨深」

{	DeleteStand("bu大輔_制服_通常_normal", 500, true);}
三住くんが声をかけると、こっちを見た梨深がすぐさまパッと表情を輝かせ、大きく手を振った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg098_02_2_AHロビー_a.jpg");
	Fade("背景１", 500, 1000, null, true);
	Stand("st梨深_制服_正面","smile", 200, @-100);
	FadeStand("st梨深_制服_正面_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500100ri">
「やっと見つかったぁ」

{	DeleteStand("st梨深_制服_正面_smile", 500, true);}
その笑顔を見て、僕はホッとした。
衝動的に、梨深に駆け寄ってしまう。

まあ、その後抱き寄せるみたいなことはさすがにできないから、ホントに駆け寄っただけなんだけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","normal", 250, @-360);
	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500110ri">
「タク、感動の再会だね。また会えて嬉しい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","sigh", 200, @360);
	FadeStand("bu大輔_制服_通常_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500120mi">
「どこほっつき歩いてたんだ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500130ri">
「病室、どこか分からなくて。あちこちさまよっちゃった」

{	Stand("bu梨深_制服_正面","sad", 250, @-360);
	FadeStand("bu梨深_制服_正面_sad", 300, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, false);}
//◆わざとらしく
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500140ri">
「ひどいよー、置いてくなんて」

梨深はわざとらしく泣き真似をして見せる。

{	Stand("bu大輔_制服_通常","worry", 200, @360);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500150mi">
「お前が先に行けって言ったんだろ」

{	Stand("bu梨深_制服_正面","smile", 250, @-360);
	FadeStand("bu梨深_制服_正面_smile", 300, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500160ri">
「あは。そうだったね」

{	Stand("bu梨深_制服_通常","smile", 250, @-360);
	DeleteStand("bu梨深_制服_正面_smile", 500, false);
	FadeStand("bu梨深_制服_通常_smile", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500170ri">
「で、岸本さんには会えた？」

{	Stand("bu大輔_制服_通常","pride", 200, @360);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, false);}
うなずく僕の横で、三住くんがあからさまにニヤリと笑うのが分かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500180mi">
「お前、岸本にビンタされてただろ」

{	Stand("bu梨深_制服_通常","shock", 250, @-360);
	FadeStand("bu梨深_制服_通常_shock", 300, true);
	DeleteStand("bu梨深_制服_通常_smile", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500190ri">
「え……」

{	Stand("bu梨深_制服_通常","smile", 250, @-360);
	FadeStand("bu梨深_制服_通常_smile", 300, true);
	DeleteStand("bu梨深_制服_通常_shock", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500200ri">
「さ、さあて、なんのことでしょーう？」

どうやら梨深は、あやせにひっぱたかれたことは隠しておきたいらしい。

あえて触れずにおこうと思ってたのに。三住くん空気嫁。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500210mi">
「隠そうったって無駄だぜ。俺は一部始終を見てたんだ。某家政婦のようにな」

{	Stand("bu梨深_制服_正面","sad", 250, @-360);
	FadeStand("bu梨深_制服_正面_sad", 500, false);
	DeleteStand("bu梨深_制服_通常_smile", 500, true);}
//◆シュンとする
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500220ri">
「……ええー。なーんだ、バレてたのかあ」

罰が悪そうにため息をつきシュンとすると、僕の顔を上目遣いで窺ってくる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500230ri">
「もしかして、タクも見てたの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16500240ta">
「え……と……」

{	Stand("bu大輔_制服_通常","normal", 200, @360);
	FadeStand("bu大輔_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500250mi">
「そうだ。俺とタクで、決定的瞬間をバッチリ見てた」

い、言うなよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("SE*", 500, 0, null);


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//	Stand("bu梨深_制服_右向き","hurry", 250, @-360);
//	Stand("bu梨深_制服_正面","normal", 250, @-360);
	Stand("bu梨深_制服_通常","normal", 250, @-360);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//	FadeStand("bu梨深_制服_右向き_hurry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500260ri">
「たはは。なんだ、それじゃ必死にごまかそうとしてたのがバカみたいじゃない」

//	DeleteStand("bu梨深_制服_右向き_hurry", 500, false);
//	FadeStand("bu梨深_制服_正面_normal", 500, true);
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500270ri">
「屋上に行ったらちょうど岸本さんがいたから。つい、気になってたことを質問をしちゃったの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500280ri">
「そしたら、機嫌損ねたみたい」

気になってた、こと……？

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16500290mi">
「なんだよ、気になってたことって」

//	FadeStand("bu梨深_制服_通常_normal", 500, false);
//	DeleteStand("bu梨深_制服_正面_normal", 500, true);
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16500300ri">
「えーっとね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("３８");
	DeleteStand("bu梨深_制服_正面_sad", 500, false);
	FadeStand("bu梨深_制服_通常_normal", 500, true);
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();
	
}