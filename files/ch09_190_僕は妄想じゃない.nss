//<continuation number="440">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_190_僕は妄想じゃない";
		$GameContiune = 1;
		Reset();
	}

		ch09_190_僕は妄想じゃない();
}


function ch09_190_僕は妄想じゃない()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

//※拓巳視点に戻る
//ＢＧ//拓巳の部屋

	CubeRoom4("ルーム", 100, 0);
	MoveCube("ルーム", 10, -100, -100, 100, Axl2, false);
	Rotate("ルーム", 10, 0, -90, 0, AxlDxl, false);
	Fade("ルーム", 500, 1000, null, true);

	Stand("bu七海_制服_通常","normal", 200, @+200);
	FadeStand("bu七海_制服_通常_normal", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000010ta">
「僕を、殺して、くれないか……」

{	Stand("bu七海_制服_通常","shock", 200, @+200);
	FadeStand("bu七海_制服_通常_shock", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000020na">
「…………」

僕の言葉に、七海は顔を強張らせた。
でもすぐに、わざとらしい笑みを浮かべる。

{	Stand("bu七海_制服_通常","normal", 200, @+200);
	FadeStand("bu七海_制服_通常_normal", 300, true);
	DeleteStand("bu七海_制服_通常_shock", 0, true);}
//◆無理に冗談めかす
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000030na">
「あはは。おにぃ、つまんない冗談やめなよー」

そのリアクションは、七海らしくなかった。

本来なら、笑って受け流すんじゃなく、むしろ
“そんなこと言わないでよ、バカ！”と怒って説教してくるはずだ。

まあ、別にどうでもいいさ……。

どうでもいい。僕を殺してくれないなら、この七海にもう用はない。今すぐ消えてもらっても構わない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_制服_通常_normal", 300, true);
	Rotate("ルーム", 2000, -40, -90, 0, AxlDxl, true);

	if(#下着パッチ==true)
	{
		CreateTextureEX("星来", 200, Center, @0, "ex/bu/bu星来_覚醒後_通常_下着_normal.png");
	}else{
		CreateTextureEX("星来", 200, Center, @0, "cg/bu/bu星来_覚醒後_通常_normal.png");
	}



	Move("星来", 0, @-160, @0, null, false);
	Fade("星来", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
僕は星来たんと見つめ合った。
星来たんが三次元にいてくれたら、きっと僕の望みを喜んで叶えてくれるのに。

どうせ妄想の存在として生まれるなら、二次元に生まれたかったよ……。

//◆深刻に
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000040na">
「ねえ、そんな冗談は置いといて……その、話があるんだ……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000050na">
「あのね、おにぃにもらったバングル、なくしちゃったの……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000060na">
「ど、どうせ適当に扱ってたんだろ、とか言わないでね。ナナ、そんなことしてないもん。ホントに大切にしてたもん……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000070na">
「なのに、どこでなくしたのかも分かんなくて……」

ふん、あんなものを大切にしてたのか。
滑稽だ。僕から見たら滑稽にもほどがある。

所詮、僕があげたものじゃないか。そんなものに価値はない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆ブツブツと小声で
//◆※２パターンぐらい欲しい
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000080ta">
「僕は妄想じゃない……僕は妄想じゃない……」

そもそも僕が七海にバングルをあげたかどうかも怪しい。その出来事さえ妄想だったかもしれない。

だから、この世のすべてには価値がない。
僕の記憶にあるものはことごとく価値がない。

//◆ブツブツと小声で
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000090ta">
「僕は妄想じゃない……僕は妄想じゃない……」

//◆悲しそうに
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000100na">
「おにぃが初めてくれたプレゼントだったのになぁ」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000110na">
「なんでなくしちゃったりしたんだろ……」

//◆ブツブツと小声で
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000120ta">
「僕は妄想じゃない……僕は妄想じゃない……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//◆おずおずと
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000130na">
「おにぃ？　聞いてる？」

//◆ブツブツと小声で
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000140ta">
「僕は妄想じゃない……僕は妄想じゃない……」

//◆切ないブレス
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000150na">
「…………」

{	BGMPlay360("CH22", 2000, 1000, true);}
//◆悲しそうに
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000140na">
「……おにぃは、どうして、いつもそうなの？」

うなだれたまま。
拳を握りしめて。
七海がポツリとつぶやく。

//◆悲しそうに
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000170na">
「たまには……お兄ちゃんらしく、頼りがいのあるとこ、見せてよ……」

なんだよ……僕を責めるのなんてお門違いだ。
だって僕は妄想の存在。

//◆ブツブツと小声で
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000180ta">
「僕は妄想じゃない……僕は妄想じゃない……」

星来たんの笑顔だけをじっと見つめる。

七海の話なんて聞く必要はない。
聞いても無駄だ。
だって僕は妄想の存在。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000190na">
「今までずっと……ナナがしっかりしなきゃって思って、頑張ってきたけど」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000200na">
「でもね、やっぱり……ナナだって、たまには……誰かに甘えたいよ」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000210na">
「ううん、誰かに、じゃなくて……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000220na">
「おにぃに、甘えたいよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//◆ブツブツと小声で
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000230ta">
「僕は妄想じゃない……僕は妄想じゃない……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000240na">
「だって、おにぃは、ナナのおにぃなんだから……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000250na">
「おにぃに頼りたいって思うこと、ナナにもあるんだよ……？」

//◆ブツブツと小声で
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000260ta">
「僕は妄想じゃない……僕は妄想じゃない……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000270na">
「そりゃ、いつもああしろこうしろ言われて、おにぃもイヤだろうけど……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//■３６０
//「そりゃ、いつもいつもああしろこうしろ言われて、おにぃもイヤだろうけど……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000280na">
「それは、おにぃがだらしないから、仕方なく……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000290na">
「ううん、言いたいことはそういうことじゃなくて……っ」

//◆ブツブツと小声で
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000300ta">
「僕は妄想じゃない……僕は妄想じゃない……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000310na">
「ナナだって、いろいろ、愚痴を聞いてもらいたいときとか、泣きたいときとか、あるんだよ……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000320na">
「おにぃに、優しくしてもらいたいときとか、あるんだよ……？」

//◆ブツブツと小声で
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000330ta">
「僕は妄想じゃない……僕は妄想じゃない……」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000340na">
「ねえ、おにぃ……っ」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000350na">
「ナナの話、聞いてよ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19000360ta">
「…………」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000370na">
「ナナ、今……すごく、悲しいんだよ？」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000380na">
「おにぃにもらった、大切なバングル……なくなっちゃって……」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000390na">
「声出して、泣きたいくらい……悲しくて、つらくて……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604003]
//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000400na">
「おにぃに、抱きしめてほしいのに……」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000410na">
「おにぃに、頭撫でて慰めてほしいのに……」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000420na">
「ねえ、おにぃ……」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000430na">
「今日だけは、ナナのわがまま、受け止めてよ……」

//◆泣く
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19000440na">
「うう……ぐすっ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("星来", 300, 1000, null, true);
	Delete("星来");
	Rotate("ルーム", 2000, 0, -90, 0, AxlDxl, true);

	Stand("bu七海_制服_拗ね","cry", 200, @+200);
	FadeStand("bu七海_制服_拗ね_cry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
僕がぼんやりと顔を上げると。
七海が、泣いていた。

うなだれ、こらえようとしながらも。
辛そうに、涙を落としていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH22", 2000, 0, NULL);

	Wait(2000);

//～～Ｆ・Ｏ

}