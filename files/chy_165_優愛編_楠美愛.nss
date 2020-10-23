//<continuation number="240">

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_165_優愛編_楠美愛";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_165_優愛編_楠美愛();
}


function chy_165_優愛編_楠美愛()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★優愛編
//ＢＧ//拓巳部屋地震後
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg049_01_6_拓巳部屋地震後_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 2000, 500, null, true);
	Fade("back01", 2000, 300, AxlDxl, true);
	Fade("back01", 2000, 1000, AxlDxl, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01300010ta">
「う……」

激しい頭痛がして、僕は意識を取り戻した。

自分が、倒れたベッドの下敷きになっていることに気付く。
頭痛だけじゃなく、そのベッドの重みで背中にも痛みがあった。
目だけを動かし、部屋の中の惨状を確認する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

	Stand("bu優愛_制服_通常左手下_メガネなし","sad", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_メガネなし_sad", 500, true);

	Wait(500);
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//◆以下、優愛は美愛としての記憶を取り戻したのですべて美愛となります
//◆美愛は翠明制服着用済み。以下、すべて眼鏡なし
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300020ma">
「…………」

{	DeleteStand("bu優愛_制服_通常左手下_メガネなし_sad", 500, true);}
優愛が、ぼんやりと壁際にへたり込んでいた。

地震が起きる前は上半身裸だったはずだけど、服は着たらしい。
眼鏡をしていない優愛は新鮮だった。その眼鏡は、彼女の足許に落ちている。レンズが割れてしまっていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01300030ta">
「た、助け……て……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01300040ta">
「紐……ほどいてよ……！」

僕は頭の痛みをこらえつつ、必死で優愛に呼びかけた。
虚ろな瞳が、僕に向けられる。

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300050ma">
「……思い出したの」

なにを思い出そうが、今はどうでもいい。
それより紐をほどけよ……。これじゃ下敷きになったまま動けないだろ……！

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300060ma">
「思い出したのよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下_メガネなし","sad", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_メガネなし_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
優愛はのろのろと立ち上がった。

{	DeleteStand("bu優愛_制服_通常左手下_メガネなし_sad", 300, true);
	CreateSE("SE01","SE_じん体_動作_手_ぱいぷいす引きずる");
	MusicStart("SE01",0,1000,0,1000,null,false);}
眼鏡をかけていないにもかかわらず、この暗い中で固く結ばれた紐をすんなりとほどく。

{	CreateSE("SE02","SE_じん体_動作_抱く1");
	MusicStart("SE02",0,1000,0,1000,null,false);}
ようやく自由になった僕は、なんとかベッドの下から抜け出すことができた。

でもそれが精一杯だった。
前の地震のときと同じように、頭が割れるように痛い。
立っていることも辛くて、四つん這いのまま痛みに耐える。

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300070ma">
「優愛ちゃんだったのよ……」

美愛が、まだなにかボソボソとつぶやいている。

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300080ma">
「『集団ダイブ』で死んだのは……美愛じゃない。優愛ちゃんだった」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01300090ta">
「優愛……なにを……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下_メガネなし","shy", 200, @+150);
	FadeStand("st優愛_制服_通常左手下_メガネなし_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300100ma">
「わたしは、優愛じゃない」

優愛は自嘲気味に笑みを浮かべた。

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300110ma">
「わたしは、美愛よ」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300120ma">
「自分を、優愛ちゃんだって思い込んでただけ」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300130ma">
「あの日、わたしたちは入れ替わったの。それで、優愛ちゃんは死んだ。本当は、わたしが死ぬはずだったのに」

{	DeleteStand("bu優愛_制服_通常左手下_メガネなし_shy", 300, true);}
ふと、優愛の顔から表情が消える。
相変わらず虚ろな瞳。
僕の方に手を差し出して。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_冷酷_メガネなし","cool", 200, @+150);
	FadeStand("bu優愛_制服_冷酷_メガネなし_cool", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300140ma">
「西條くん」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300150ma">
「もう、『将軍』のことなんて、どうでもよくなっちゃった」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300160ma">
「結局、優愛ちゃんは、わたしが死なせたようなものだから」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300170ma">
「ねえ、一緒に、来てほしい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01300180ta">
「ど、どこへ？」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300190ma">
「……優愛ちゃんが死んだ場所。一緒に、来てくれるだけでいい」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300200ma">
「お願い」

だいたいの事情は分かった。

そして、僕は悟った。

優愛は――いや、美愛は――死ぬつもりだ。
止めるべきかどうか、迷ったけど。
たぶん、僕の言葉は今の美愛には届かないから。

{	DeleteStand("bu優愛_制服_冷酷_メガネなし_cool", 300, true);}
だから、僕は美愛の手を取り、それを支えに立ち上がろうとした。

{	CreateColor("痛い", 1000, 0, 0, 1280, 720, "Red");
	Fade("痛い", 0, 0, null, true);
	Fade("痛い", 100, 800, null, true);
	FadeDelete("痛い", 100,. true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01300210ta">
「う、ぐああ……っ！」

頭に、刺すような痛み。

視界が赤く染まるような錯覚。
ドクンドクンという、頭の血管の脈動が全身に響く。
痛すぎて、身体に力を入れられない。

{	CreateSE("SE01","SE_じん体_掴む");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300220ma">
「……歩ける？」

美愛が、僕の身体を抱き、支えてくれた。

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300230ma">
「歩いてくれないと、困るわ。一緒に、来て欲しいの」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01300240ma">
「わたしを、助けると思って……お願い」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(2000);
	Wait(2000);
}
