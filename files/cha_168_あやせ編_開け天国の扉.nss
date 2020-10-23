

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_168_あやせ編_開け天国の扉";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_168_あやせ編_開け天国の扉();
}


function cha_168_あやせ編_開け天国の扉()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編
//ＣＧ//あやせ投擲動作
//ＳＥ//衝撃波
	BGMPlay360("CH_INS_FES_ライヴ", 0, 1000, true);

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");

	SetVolume("SE11", 500, 0, null);
	CreateSE("SE001","SE_擬音_ディそーど_衝撃は");
	MusicStart("SE001", 0, 1000, 0, 1000, null, false);

	CreateSE("SE3601","SE_擬音_共鳴音_激しい_LOOP");
	MusicStart("SE3601",1000,1000,0,1000,null,true);


	CreateColor("赤い光", 3500, 0, 0, 1280, 720, "RED");
	Fade("赤い光", 0, 0, null, false);
	Request("赤い光", AddRender);
	Fade("赤い光", 200, 800, null, true);
	Fade("赤い光", 2000, 0, null, false);

	CreateTexture360("あやせ投擲前", 100, Center, Middle, "cg/ev/ev129_01_6_あやせ投擲_a.jpg");
	CreateTexture360("あやせ投擲前効果", 100, Center, Middle, "cg/ev/ev129_01_6_あやせ投擲_a.jpg");
	Zoom("あやせ投擲前効果", 0, 2000, 2000, null, false);
	SetBlur("あやせ投擲前効果", true, 2, 400, 100);
	Fade("あやせ投擲前効果", 0, 500, null, false);


	Fade("フラッシュ", 1000, 0, null, false);
	Zoom("あやせ投擲前効果", 1500, 1000, 1000, Dxl2, true);

	Fade("あやせ投擲前効果", 0, 0, null, true);

	WaitAction("あやせ投擲前効果", null);

	Delete("あやせ投擲前効果");
	Delete("フラッシュ");

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
あやせが、黒騎士としての力を解き放つ。
激しい風圧。あやせの周囲の空気が震える。

黒の波が、その震えた空気によって押しのけられ、渦巻く。

//以下追加081205
今の彼女に、いつもの気怠げな雰囲気は微塵もない。

剣を構え。

足を大きく開いて腰を落とし。

振りかぶる。

全身に、緊張と、未来を見据える意志の強さをみなぎらせている。

まだギリギリのところで押しとどめられている、彼女の純粋なる破壊の衝動――
それを暴発させる刹那の機を逃すまいとしている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//以上追加081205

	Fade("赤い光", 200, 800, null, true);
	CreateTextureEX("あやせディソード", 500, 0, 0, "cg/bg/bg242_01_6_chnディソード全体_あやせ_a.jpg");
	Request("あやせディソード", Smoothing);
	Zoom("あやせディソード", 0, 1200, 1200, null, true);

	Fade("あやせディソード", 200, 1000, null, true);
	FadeDelete("赤い光", 200, false);

	Zoom("あやせディソード", 3000, 1000, 1000, Dxl1, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605001]
剣の赤い明滅が、速くなった。

//以下追加081205
――その剣は、命運を握るもの。

――その剣は、嘆きを集束させたもの。

――その剣は、超越した場所に干渉するためのもの。

邪心を取り込み、邪心を屠る、諸刃の剣。

救いを求めるあやせの魂の叫びが、
形を帯びて、具現化したもの。
あやせの混沌なる心そのもの。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//以上追加081205
	FadeDelete("あやせディソード", 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3606001]
あやせがにらむのは、ただ一点。

黒い天空。

僕が見てきた青い空を覆い。
あやせの見てきた赤い空を覆い。
世界に闇をもたらそうとする、不浄なる邪心の空。

後は、僕にできるのは祈ることだけ。

邪心王か、黒騎士か。
命運はあやせ次第。

//以下追加081205
けれど、不思議と僕にあるのは確信。

あやせが奏でてきた神話は。

邪心王なんかに負けはしない――！

だから――

//以上追加081205
杭よ――

世界を貫け――！

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400680ay">
「開け……天国の扉……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateTexture360("あやせ投擲前ズーム", 110, @+240, 0, "cg/ev/ev129_01_6_あやせ投擲_a.jpg");
	Fade("あやせ投擲前ズーム", 0, 0, null, true);
	
	Request("あやせ投擲前ズーム", Smoothing);
	CreateSE("SE01","SE_擬音_ディそーどかまえる");
	MusicStart("SE01",0,1000,0,1000,null,false);
	
	Zoom("あやせ投擲前ズーム", 300, 2000, 2000, Dxl2, false);
	Fade("あやせ投擲前ズーム", 300, 1000, null, true);
	Delete("あやせ投擲前");


	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3607001]
全身を弓のようにしならせて。

あやせは渾身の力で、投擲した――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音（ディソード投擲。音速突破）

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE002","SE_擬音_ディそーど2");
	CreateSE("SE003","SE_擬音_ディそーど_投擲");

	CreateTexture360("あやせ投擲後", 100, Center, Middle, "cg/ev/ev129_02_6_あやせ投擲_a.jpg");
	Request("あやせ投擲後", Smoothing);
	Zoom("あやせ投擲後", 300, 1200, 1200, null, false);
	SetBlur("あやせ投擲後", true, 2, 300, 100);
	SetBlur("あやせ投擲m前ズーム", true, 2, 300, 100);


	CreateSE("SE004","SE_擬音_ディそーど同士ぶつかる");
	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 0, 0, null, true);


//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE002",0,1000,0,1000, null, false);
	MusicStart("SE003",0,1000,0,1000, null, false);

	FadeDelete("あやせ投擲前ズーム", 500, false);
	Zoom("あやせ投擲前ズーム", 500, 1000, 1000, Axl1, false);
	Move("あやせ投擲前ズーム", 1000, -240, 0, Axl1, false);

//	CreateColor("フラッシュ２", 1000, 0, 0, 1280, 720, "White");
//	Request("フラッシュ２", AddRender);
//	Fade("フラッシュ２", 0, 0, null, true);
//	Fade("フラッシュ２", 500, 1000, null, true);
	Fade("フラッシュ", 500, 1000, null, true);

//	FadeDelete("フラッシュ２", 200, false);
	Fade("フラッシュ", 200, 0, null, false);
	Zoom("あやせ投擲後", 300, 1000, 1000, Axl3, true);

	Wait(500);

//ＢＧ//赤い空
	CreateColor("White", 1000, 0, 0, 1280, 720, "White");
	DrawTransition("White", 300, 0, 1000, 100, null, "cg/data/爆発.png", true);

	CreateMovie360("投擲ムービー", 800, Center, Middle, false, false, "dx/mvあやせとうてき.avi");

	Delete("あやせ投擲後");

	Fade("White", 2000, 0, null, true);
	Delete("White");

	$SYSTEM_text_interval = 128;
	LoadBox10();

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3601001]
光の軌跡が放たれる。
{	Wait(2000);}
衝撃で黒は吹き飛び。
{	Wait(2000);}
赤い天を貫き。
{	Wait(2000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(500);//――――――――――――――――――――――――――――――

	Wait(500);
	WaitPlay("投擲ムービー", null);

	Fade("フラッシュ", 200, 1000, null, true);

	MusicStart("SE004",0,1000,0,1000, null, false);

//	Fade("投擲ムービー", 200, 0, null, true);
	Delete("投擲ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3602001]
突き刺さった。
{	Wait(1500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(500);//――――――――――――――――――――――――――――――


	SetVolume("SE3601", 500, 0, null);
	SetVolume360("CH*", 500, 0, NULL);

//ＳＥ//ガラスがひび割れる音
//ＢＧ//ひび割れた赤い空

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE009","SE_衝撃_ガラス_割れる_あやせディそーど");
	CreateSE("SE005","SE_衝撃_ガラス_割れる_あやせディそーど");
	CreateTextureEX("赤い空ひび", 100, 0, 0, "cg/bg/bg216_02_6_chn赤い空_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE005",0,1000,0,1000, null, false);
	MusicStart("SE009",0,1000,0,1000, null, false);

	CreateMovie360("ひび割れムービー", 1100, Center, Middle, false, false, "dx/mvあやせとうてき2.avi");
	WaitPlay("ひび割れムービー", null);

	Fade("赤い空ひび", 0, 1000, null, true);
	Delete("フラッシュ");

	Fade("ひび割れムービー", 200, 0, null, true);
	Delete("ひび割れムービー");



	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3603001]
空に、ヒビが入った。
{	Wait(2000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(500);//――――――――――――――――――――――――――――――

	Delete("ブラー用*");
//ＳＥ//ガラスがひび割れる音
	CreateSE("SE005","SE_擬音_ディそーど_ひび割れ");
	MusicStart("SE005",0,1000,0,1000, null, false);

	BGMPlay360Suspend("CHN_ED_ayase", 0, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3604001]
そのヒビは徐々に空全体に広がって。
{	Wait(2000);}
やがて――
{	Wait(2000);}
音の洪水とともに、世界が、砕け散った――
{	Wait(2000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(500);//――――――――――――――――――――――――――――――

//ＳＥ//ガラスが割れる音
//ホワイトアウト

	CreateSE("SE006","SE_衝撃_ガラス_割れる_あやせディそーど");
	CreateSE("SE007","SE_擬音_ディそーど_衝突2");
	CreateSE("SE008","SE_擬音_ディそーど_衝撃は");
	MusicStart("SE006",0,1000,0,1000, null, false);
	MusicStart("SE007",0,1000,0,1000, null, false);
	MusicStart("SE008",0,1000,0,1000, null, false);
	
	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 0, 0, null, true);
	Fade("フラッシュ", 5000, 1000, null, true);

//※ここでエンディングスタッフロール入れるか、またはエピローグなしで最後にスタッフロール入れるか。どっちでもＯＫです（林）
//スタッフロール入れたいです。キャラソンがそこまでの流れの雰囲気と違った場合は　再考（松原）
//少し間を置いて

	Wait(500);
//	ClearAll(2000);
//	Wait(1000);


}


