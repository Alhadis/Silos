//<continuation number="170">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_192_消える七海";
		$GameContiune = 1;
		Reset();
	}

		ch09_192_消える七海();
}


function ch09_192_消える七海()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//ＢＧ//拓巳の部屋

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

	CubeRoom4("ルーム", 100, 0);
	MoveCube("ルーム", 10, -100, -100, 100, Axl2, false);
	Rotate("ルーム", 10, 0, -90, 0, AxlDxl, false);
	Fade("ルーム", 500, 1000, null, true);

	Stand("bu七海_制服_拗ね","cry", 200, @+150);
	FadeStand("bu七海_制服_拗ね_cry", 500, true);

	BGMPlay360("CH22", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19200010na">
「今日だけは、ナナのわがまま、受け止めてよ……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19200020na">
「うう……ぐすっ……」

七海が、泣いていた。
うなだれ、こらえようとしながらも。
辛そうに、涙を落としていた。

僕はそれを一瞥して。
視線をすぐに天井に戻し、サビている箇所を数え直す作業に戻る。

//◆無気力
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19200030ta">
「泣かれたって……僕には、なにも、できないよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19200040ta">
「僕は、妄想の、存在なんだから……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19200050ta">
「妄想の……」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19200060na">
「そんなこと言わないでよぅ！」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19200070na">
「おにぃが妄想のはずないじゃん……！　だって、ナナは、小さい頃のおにぃのこと、知ってるもん……！」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19200080na">
「いっつもナナに世話かけさせて、ちっとも頼りにならないけど……っ」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19200090na">
「でも、おにぃは昔からずっとナナと一緒だったよ……っ」

//◆ハッとする
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19200100ta">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
そうだ……。
七海の言う通りだ。

僕には、七海がまだ小さかった頃の記憶がある。
僕には、幼い頃の記憶がある。

小学生のときには、遠足に行けなくて、クラスメートが乗ったバスが事故を起こしたのをテレビで見ていた記憶がある。そのとき亡くなった担任の斎藤先生のことだって覚えてる。

赤の他人である梨深の言葉と。
幼い頃から一緒に育ってきた妹の言葉。

どっちを信じるべきかなんて、分かりきったことじゃないか。

正しいのは、梨深じゃない。
正しいのは、七海だ。

もし、七海が本物なら、僕も、本物。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19200110ta">
「なな、み……」

七海に手を伸ばす。
七海の存在は、今の僕の唯一の希望。
僕を救ってくれる、ただひとりの存在。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19200120ta">
「助けて……七海……助けて……」

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19200130na">
「おにぃ……ぐすっ……」

七海の温もりが本物なら。
僕は、僕を証明できるんだ。

寂しそうに泣いていた七海が、
涙を拭って、

真っ赤になった目を僕に向けて、
泣き笑いの表情を浮かべて、

//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19200140na">
「抱きしめて……くれる……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
僕はうなずく。
何度も。何度も。

そうすることで七海が救われるなら。
そうすることで僕が救われるから。

この生意気な妹を、いつだって、喜んで抱きしめよう。
この世界でただひとりの、血を分けた妹を、抱きしめよう。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19200150ta">
「七海……助けて……」

その温もりを、一刻も早く感じたくて。
僕の胸に、ゆっくりと、飛び込んでくる、その身体に、手を回して、

きつく、
きつく――

抱きしめようと、して――

{	DeleteStand("bu七海_制服_拗ね_cry", 500, true);
	Stand("bu七海_制服_通常","normal", 200, @+0);
	FadeStand("bu七海_制服_通常_normal", 500, true);}
//◆ささやき
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19200160na">
「おにぃ……」

その寸前で、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume360("CH22", 500, 0, null);

//ＳＥ//七海消滅
	CreateSE("SE01","SE_擬音_七海消滅");

	CreateMovie360("消滅", 5000, Center, Middle, false, false, "dx/mv消える01.avi");
	Fade("消滅", 0, 0, null, true);
//	Request("消滅", Play);
	Wait(1000);
	Fade("消滅", 500, 1000, null, true);

	DeleteStand("bu七海_制服_通常_normal", 0, true);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	WaitAction("消滅", null);


	Fade("消滅", 500, 0, null, true);
	Delete("消滅");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
七海の身体が、淡い光に包まれ、青い、無数の小さな粒子へと分解し、

粒子は空気の中で泡のように次々と弾けて、

伸ばした僕の手は、なにも抱きしめることなく。
僕の胸には、なんの温もりもなく。

僕の目の前で、七海は、

消滅した。

{	Rotate("ルーム", 500, 70, -90, 0, Dxl2, false);
	CreateColor("back11", 500, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 200, 1000, null, true);}
//◆絶叫
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19200170ta">
「うわああああああああああああああああああああああああああああああああああああ――――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH22", 1000, 0, null);

	Wait(3000);

//～～Ｆ・Ｏ

}