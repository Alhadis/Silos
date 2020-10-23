//<continuation number="310">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_208_Ａセナの想い";
		$GameContiune = 1;
		$Ａルート = true;
		Reset();
	}

		ch10_208_Ａセナの想い();
}


function ch10_208_Ａセナの想い()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


	CreateTextureEX("back360", 100, 0, 0, "cg/ev/ev095_02_1_拓巳ダーツ逆転_a.jpg");
	Fade("back360", 0, 1000, null, true);

	CreateTextureEX("back11", 100, 0, 0, "cg/ev/ev095_02_1_拓巳ダーツ逆転_a.jpg");
	Fade("back11", 0, 1000, null, true);

	Delete("back360");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
諏訪は、もうなにも答えなかった。
立ったまま、息絶えていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	CreateSE("SE10","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE10", 1000, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
僕は、駅の構内へと戻る。

こずぴぃはポカンと呆けたような顔をしていた。
今の一部始終を見て驚いているみたいだ。
その足は血に染まっていて、痛々しい。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20800010ta">
「こずぴぃ、大丈夫？」

こずぴぃはへたり込んだまま、コクコクとうなずいた。
でも自力で立つことはできないらしい。
キラキラと輝かせた目で僕を見上げてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","normal", 200, @+250);
	FadeStand("bu梢_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//◆「起っきた」＝「おっきた」
//【梢】
<voice name="梢" class="梢" src="voice/ch10/20800020ko">
「拓巳しゃん、いまいまー、なにが起きったの？」

こずぴぃ、普通に喋ってるね……。

//【梢】
<voice name="梢" class="梢" src="voice/ch10/20800030ko">
「ふぇう？」

{	Stand("bu梢_制服_通常","shy2", 200, @+250);
	FadeStand("bu梢_制服_通常_shy2", 300, true);
	DeleteStand("bu梢_制服_通常_normal", 0, true);}
//【梢】
<voice name="梢" class="梢" src="voice/ch10/20800040ko">
「あ、ほーんとだ……」

自分の唇を指で触れ、不思議そうに首を傾げている。

でもすぐに、そんなことはどうでもよくなったみたいだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","normal", 200, @+250);
	FadeStand("bu梢_制服_通常_normal", 300, true);
	DeleteStand("bu梢_制服_通常_shy2", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆「あのあーの」＝「あの、すいません」みたいな意味
//◆「どうてーいさん」＝「童貞さん」
//◆「すごすごーい」＝「凄い」
//【梢】
<voice name="梢" class="梢" src="voice/ch10/20800050ko">
「あのあーの！　どうてーいさんの妄想力はすごすごーいの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20800060ta">
「……すごいよ」

無知は罪だって、セナが言ってた。でも僕はそうは思わない。

知らないからこそ、妄想で補完する。<k>
妄想でいくらでも膨らませられる。<k>
知っていたらできない妄想ができる。

童貞が一番得意なのは、妄想なんだ。

そう言えば、セナは……？
{	DeleteStand("bu梢_制服_通常_normal", 300, false);}
僕は薄暗いホームに、彼女の姿を探した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 1000, 0, NULL);

	Stand("stセナ_制服_通常","rage", 200, @+250);
	FadeStand("stセナ_制服_通常_rage", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800070sn">
「…………」

セナは、ホームの端に立って、うなだれていた。
その足下には――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20800080ta">
「……波多野さん」

血だまりの中に横たわっている、波多野一成。
すでに動く気配はなく、絶命しているのが僕にも分かった。

間に合わなかった。
あの人なら、ノアⅡの場所を知ってるかもって思ったのに……。

//◆淡々と
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800090sn">
「ノアⅡは、渋谷駅のすぐ横にある」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20800100ta">
「え……？」

僕の心を見抜いたかのように、セナが波多野さんを――彼女の実の父の亡骸を――見下ろしたまま、つぶやいた。

//◆淡々と
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800110sn">
「この男が死ぬ間際に……私の心に、伝えてきた」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800120sn">
「渋谷駅の東口。ビルの屋上にある、今は閉鎖されたプラネタリウム」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800130sn">
「そこに、ノアⅡがある」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20800140ta">
「……ど、どうも」

セナに、なにか声をかけるべきかどうか、迷った。

彼女は、父を恨んでいた。父を殺したいと願っていた。

念願が叶ったって言うのに、その背中はひどく寂しそうで。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH22", 1000, 1000, true);

	Stand("stセナ_制服_通常","hard", 200, @+250);
	FadeStand("stセナ_制服_通常_hard", 300, true);
	DeleteStand("stセナ_制服_通常_rage", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800150sn">
「くそ……っ」

//◆ムッとして
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800160sn">
「私をかばって、それで罪を償ったつもりか……」

セナの言葉は、今はもう答えない父の遺体に語りかけているものだった。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800170sn">
「お前は、自分の罪を認めた。その上で、私に見せつけるように……自殺したようなものだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800180sn">
「許せない……。私は、お前を許さない」

//【梢】
<voice name="梢" class="梢" src="voice/ch10/20800190ko">
「セナしゃん……心が、泣いてるの……」

//【梢】
<voice name="梢" class="梢" src="voice/ch10/20800200ko">
「ほんとーうは、お父しゃん、殺したくなかったのら……」

こずぴぃのささやきの通りに。
セナが毅然とした態度を見せていたのも、そこまでだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","sad", 200, @+250);
	FadeStand("stセナ_制服_通常_sad", 300, true);
	DeleteStand("stセナ_制服_通常_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800210sn">
「う、ぐすっ……」

{	DeleteStand("stセナ_制服_通常_sad", 300, true);}
肩を震わせ。
その場に、がっくりと膝をついて。

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800220sn">
「どうして、生きて罪を償おうとしないんだ……っ」

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800230sn">
「どうして、私をひとりにするんだ……」

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800240sn">
「どう……して……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20800250ta">
「セナ……」

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800260sn">
「西條……お願い……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","cry", 200, @+250);
	FadeStand("buセナ_制服_通常_cry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
セナが、顔を上げる。
涙で濡れたその表情は、いつもの険しいものではなく。

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20800270sn">
「ノアⅡを……壊して……」

{	DeleteStand("buセナ_制服_通常_cry", 300, true);}
父を、家族を失って悲嘆に暮れる、ひとりの女の子の弱々しいものだった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20800280ta">
「僕を殺そうとしたくせに……。君のお願いなんて、聞く義理は、ないよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","sad", 200, @-250);
	FadeStand("bu梢_制服_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【梢】
<voice name="梢" class="梢" src="voice/ch10/20800290ko">
「拓巳しゃん……」

{	DeleteStand("bu梢_制服_通常_sad", 500, true);}
僕はセナとこずぴぃに背中を向け、渋谷駅へと繋がっているトンネルへと歩き出した。

ぽっかりと開いた、ふたつの大きな口。
奥に広がっているのは、深い闇。
そこを抜ければ、最短ルートで渋谷駅に出られる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20800300ta">
「僕は、僕の目的の、ためだけに――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20800310ta">
「ノアⅡを、壊す。絶対に」

セナがなにか言った気がしたけど、僕はもう聞いていなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH22", 1000, 0, NULL);

//～～Ｆ・Ｏ

}