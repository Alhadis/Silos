//<continuation number="50">

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_169_あやせ編_エピローグ";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_169_あやせ編_エピローグ();
}


function cha_169_あやせ編_エピローグ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編
//少し間を置いて

//おがみ：あやせ青空差し替え
//	CreateColor("黒幕", 1000, 0, 0, 1280, 720, "BLACK");

	PrintBG(25000);

	CreateSE("SE01","SE_自然_風音_LOOP");
	CreateTextureEX("黒幕", 1000, 0, 0, "cg/bg/bg904_02_1_エンド青空_a.jpg");
	Fade("黒幕", 0, 1000, null, true);

	Delete("色");
	Delete("フラッシュ");

	Fade("back*", 2000, 0, null, true);
	Delete("back*");

//ＢＧ//青空（フェードイン）
	MusicStart("SE01",3000,1000,0,1000,null,true);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg002_01_1_青空_a.jpg");
	Move("back01", 0, @0, @-80, null, true);

	CreateTexture360("back02", 120, 0, 0, "cg/bg/bg002_01_1_青空_a.jpg");
	Request("back02", AddRender);
	SetAlias("back02", "back02");
	Fade("back02", 0, 0, null, true);
	Zoom("back02", 0, 3000, 3000, null, true);
	CreateTexture360("back03", 130, 0, 0, "cg/bg/bg002_01_1_青空_a.jpg");
	Request("back03", AddRender);
	SetAlias("back03", "back03");
	Fade("back03", 0, 0, null, true);
	Zoom("back03", 0, 3000, 3000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	CreateProcess("プロセス１", 1000, 0, 0, "scrool1");
	Request("プロセス１", Start);


	Move("back01", 3000, @0, @80, Dxl1, false);
	Fade("黒幕", 2000, 0, null, true);
	Delete("黒幕");


	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//以下追加081205
気が付けば――

世界に鮮やかな光が戻っていた。

//以上追加081205
空が、青い。

言葉では、その色について説明できないけど。

今、僕が見上げている空は、確かに、青い。

グラジオールは、倒せたんだろうか。
少なくとも世界を覆っていた黒い靄は消えた。

僕の手を、温かくて柔らかい手が握りしめてくる。

あやせが、僕の隣に立って。

僕と同じように、空を見上げて。

声もなく、涙を流した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//青い空を見て泣くあやせ
	CreateTexture360("あやせ泣", 300, 0, 80, "cg/ev/ev130_01_6_あやせ空見上げ_a.jpg");
	Fade("あやせ泣", 0, 0, null, true);
	Move("あやせ泣", 1500, @0, @-80, Dxl1, false);
	Fade("あやせ泣", 1000, 1000, null, true);

	Delete("プロセス１");
	Delete("back02");
	Delete("back03");
	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01500010ay">
「青は、あんなに美しい色をしていたのね……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01500020ta">
「見えるの？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01500030ay">
「見えるわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01500040ay">
「拓巳が見ているのと、同じ色の空が」

//以下追加081205
なんて、澄んだ色なんだろう。<K>
胸に染みてくるほどに。<K>
瞳に痛みを覚えるほどに。

こんなに澄んだ色が、僕たちの頭上に横たわっていただなんて。
今まで、気付かなかった。

//以下追加081205
瓦礫に埋もれ、死の街と化した渋谷。
かつてのきらびやかさは影も形も残っていない。

けれど、あやせは、まぶしそうに目を細め――

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01500050ay">
「世界は、こんなにも美しいのね」

僕の手をそっと握って、そう言ったんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(2000);
	SetVolume("SE01", 4000, 0, null);

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 0, 0, null, true);
	Fade("フラッシュ", 3000, 1000, null, true);


	Wait(2000);
//あやせ編ＥＮＤ
	ClearAll(2000);

//○実績No.19：【罪過に契約の血を】
	XBOX360_Achieved(19);

	Wait(1000);
}



//おどろおどろしいfunction
function scrool1()
{

	while(1)
	{
	Fade("@back02", 2000, 400, null, false);
	Move("@back02", 16000, @-640, @0, null, false);
	Fade("@back03", 2000, 0, null, true);
	Move("@back03", 0, 0, 0, null, true);

	Wait(12000);

	Fade("@back03", 2000, 400, null, false);
	Move("@back03", 16000, @-640, @0, null, false);
	Fade("@back02", 2000, 0, null, true);
	Move("@back02", 0, 0, 0, null, true);

	Wait(12000);

	}
}
