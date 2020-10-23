//<continuation number="250">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_207_Ａインターミッション５３ａ";
		$GameContiune = 1;
		$Ａルート = true;
		Reset();
	}

		ch10_207_Ａインターミッション５３ａ();
}

function ch10_207_Ａインターミッション５３ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//■インターミッション５３ａ

//ＢＧ//崩壊渋谷・神泉駅ホーム//昼・曇り
//ＳＥ//ヒュンヒュンという機械音

	IntermissionIn();

	DeleteAll();

	CreateColor("Black", 100, 0, 0, 1280, 720, "Black");

	IntermissionIn2();

	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE03", 0, 800, 0, 1000, null, true);

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	Fade("back04", 2000, 1000, null, true);

//おがみ：BGM入れ込み
	BGMPlay360("chn01",0,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
諏訪の手に、十字架型の杭がいつの間にか握られている。

彼は暴発しそうになる怒りの感情を強引に抑え付け、その杭を西條拓巳に向けて放つ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//杭が高速で飛び、空気を切り裂く音
	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	WaitAction("SE02", 100);
	CreateSE("SE04","SE_擬音_杭_飛ぶ");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	WaitAction("SE04", 100);
	CreateSE("SE05","SE_擬音_杭_飛ぶ");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	CreateColor("back10", 500, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 200, 1000, null, true);
	WaitAction("SE02", 1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
それは物理法則や空気抵抗を一切無視し。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//杭が拓巳に突き刺さる
	CreateSE("SE05","SE_擬音_杭_突きささる");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	WaitAction("SE05", 100);

	CreateSE("SE06","SE_擬音_杭_突きささる");
	MusicStart("SE06", 0, 1000, 0, 1000, null, false);

	WaitAction("SE06", 100);

	CreateSE("SE07","SE_擬音_杭_突きささる");
	MusicStart("SE07", 0, 1000, 0, 1000, null, false);

	CreateColor("back11", 300, 0, 0, 1280, 720, "White");
	Request("back11", AddRender);
	FadeDelete("back10", 100, false);
	FadeDelete("back11", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆苦痛
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700010ta">
「が……あ……っ」

自らが意志を持つかのように、一直線に拓巳の腕へと突き刺さった。

すでに１５本が命中。外れは１本もなし。
拓巳の肩、二の腕、手首、掌、腰、太もも、膝、脛。
深々と突き刺さった傷口から、血がダラダラと流れ出ている。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700020su">
「絶対に外れないダーツってのは、あんま面白くないけどな」

すでに次の杭が諏訪の手の中にある。
繰り返しその杭を投げ放っていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//※以下から、画面中央とテキストウインドウ（画面下方）にテキスト同時表示開始

//ＳＥ//杭が高速で飛び、空気を切り裂く音
//ＳＥ//杭が拓巳に突き刺さる
/*森島ＳＥダミー*/
	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back10", 500, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 100, 1000, null, true);

	WaitAction("SE02", 500);

	CreateSE("SE05","SE_擬音_杭_突きささる");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	CreateColor("back11", 600, 0, 0, 1280, 720, "White");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 100, 1000, null, true);
	FadeDelete("back10", 200, false);
	FadeDelete("back11", 500, true);

	Wait(1000);

//「う……ぐ……！」
	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0><SPAN value=0>「う……ぐ……！」</SPAN>");
//	Move("テキスト１",0,@40,@0,null,true);
	Request("テキスト１", NoLog);
	Request("テキスト１", NoIcon);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	CreateVOICE("拓巳","ch10/20700030ta");
//	SoundPlay("拓巳",0,1000,false);

	SetBacklog("「う……ぐ……！」", "voice/ch10/20700030ta", 拓巳);
	SetBacklog("「う……ぐ……！」", "NULL", NULL);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700030ta">
「う……ぐ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	Request("@text003", NoIcon);
	Request("@text003", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("bu護_スーツ_通常","cool", 200, @+150);
	FadeStand("bu護_スーツ_通常_cool", 0, false);

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

	Wait(1000);

//「自分が万能の神になったような気がするんだよ」
	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「自分が万能の神になったような気がするんだよ」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("拓巳", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700040su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「自分が万能の神になったような気がするんだよ」", "voice/ch10/20700040su", 諏訪);
	SetBacklog("「自分が万能の神になったような気がするんだよ」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700040su">
「自分が万能の神になったような気がするんだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	Request("@text004", NoIcon);
	Request("@text004", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

	Wait(500);

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 1000);

	CreateSE("SE02","SE_擬音_杭_突きささる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back11", 600, 0, 0, 1280, 720, "White");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 100, 1000, null, true);
	FadeDelete("back11", 200, true);

/*森島おそらくこちらなので変更*/
//すごく不思議な感覚だ。僕はそう思う。
	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>すごく不思議な感覚だ。僕はそう思う。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("すごく不思議な感覚だ。僕はそう思う。", "NULL", NULL);
	SetBacklog("どうせ聞こえていないだろうと、諏訪は思う。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「なんだか、すごく不思議な感覚だ。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
どうせ聞こえていないだろうと、諏訪は思う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text005", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

	Wait(1000);

//こうして刻まれる痛みのひとつひとつが、僕に生を実感させる。
	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>こうして刻まれる痛みのひとつひとつが、僕に生を実感させる。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	SetBacklog("こうして刻まれる痛みのひとつひとつが、僕に生を実感させる。", "NULL", NULL);
	SetBacklog("うなだれ、為すがままになっている拓巳に向かって、諏訪はまた杭を投げた。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「こうして刻まれる痛みのひとつひとつが、僕に生を実感させる。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
うなだれ、為すがままになっている拓巳に向かって、諏訪はまた杭を投げた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text006", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

//ＳＥ//杭が高速で飛び、空気を切り裂く音
//ＳＥ//杭が拓巳に突き刺さる

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 1000);

	CreateSE("SE02","SE_擬音_杭_突きささる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back11", 600, 0, 0, 1280, 720, "White");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 100, 1000, null, true);
	FadeDelete("back11", 200, true);

	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
//「オレはただの人間だけどな、お前らと同等の力を手に入れた」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「オレはただの人間だけどな、お前らと同等の力を手に入れた」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700050su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「オレはただの人間だけどな、お前らと同等の力を手に入れた」", "voice/ch10/20700050su", 諏訪);
	SetBacklog("「オレはただの人間だけどな、お前らと同等の力を手に入れた」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700050su">
「オレはただの人間だけどな、お前らと同等の力を手に入れた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text007", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

	Wait(1000);

	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
//すべては、あいつが背負ったリュックの中にある、ノアⅡの端末の仕業だ。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>すべては、あいつが背負ったリュックの中にある、ノアⅡの端末の仕業だ。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	SetBacklog("すべては、あいつが背負ったリュックの中にある、ノアⅡの端末の仕業だ。", "NULL", NULL);
	SetBacklog("すべては、諏訪が背負ったリュックの中にある、ノアⅡの端末のおかげだった。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「すべては、諏訪が背負ったリュックの中にある、ノアⅡ端末の仕業だ。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
すべては、諏訪が背負ったリュックの中にある、ノアⅡの端末のおかげだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text008", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//あれを持っていれば、ノアⅡの近くにいなくてもその力の恩恵を受ける。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>あれを持っていれば、ノアⅡの近くにいなくてもその力の恩恵を受ける。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("あれを持っていれば、ノアⅡの近くにいなくてもその力の恩恵を受ける。", "NULL", NULL);
	SetBacklog("これを持っていれば、ノアⅡの近くにいなくてもその力の恩恵を受ける。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「あれを持っていれば、ノアⅡの近くにいなくてもその力の恩恵を受ける。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
これを持っていれば、ノアⅡの近くにいなくてもその力の恩恵を受ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text009", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//人工のギガロマニアックスになるんだ。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>人工のギガロマニアックスになるんだ。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("人工のギガロマニアックスになるんだ。", "NULL", NULL);
	SetBacklog("人工のギガロマニアックスになれるのだ。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「人工のギガロマニアックスになるんだ。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
人工のギガロマニアックスになれるのだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text010", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//諏訪は、力に完全に魅入られてしまっている。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>諏訪は、力に完全に魅入られてしまっている。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("諏訪は、力に完全に魅入られてしまっている。", "NULL", NULL);
	SetBacklog("諏訪は、力に完全に魅入られていた。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「諏訪は、力に完全に魅入られてしまっている。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
諏訪は、力に完全に魅入られていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text011", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//杭が高速で飛び、空気を切り裂く音
//ＳＥ//杭が拓巳に突き刺さる
	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 1000);

	CreateSE("SE02","SE_擬音_杭_突きささる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back11", 600, 0, 0, 1280, 720, "White");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 100, 1000, null, true);
	FadeDelete("back11", 200, true);

//信奉すべき教えと教祖のために、どんな汚いことでもする、狂信者。
	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>信奉すべき教えと教祖のために、どんな汚いことでもする、狂信者。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("信奉すべき教えと教祖のために、どんな汚いことでもする、狂信者。", "NULL", NULL);
	SetBacklog("信奉すべき教えと教祖のために、どんな汚いことでもする、尖兵。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「信奉すべき教えと教祖のために、どんな汚いことでもする、狂信者。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
信奉すべき教えと教祖のために、どんな汚いことでもする、尖兵。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text012", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「この力は、神からの贈り物だ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「この力は、神からの贈り物だ」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700060su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「この力は、神からの贈り物だ」", "voice/ch10/20700060su", 諏訪);
	SetBacklog("「この力は、神からの贈り物だ」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700060su">
「この力は、神からの贈り物だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text013", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「神光のため、信じるもののために戦えるんだからな」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「神光のため、信じるもののために戦えるんだからな」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700070su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「神光のため、信じるもののために戦えるんだからな」", "voice/ch10/20700070su", 諏訪);
	SetBacklog("「神光のため、信じるもののために戦えるんだからな」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700070su">
「神光のため、信じるもののために戦えるんだからな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text014", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	FadeDelete("テキスト１", 0, true);

//またも諏訪が杭を投げつけ。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>またも諏訪が杭を投げつけ。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("またも諏訪が杭を投げつけ。", "NULL", NULL);
	SetBacklog("またも諏訪は杭を投げつけ。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「またも諏訪が杭を投げつけ。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
またも諏訪は杭を投げつけ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text015", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//ＳＥ//杭が高速で飛び、空気を切り裂く音
//ＳＥ//杭が拓巳に突き刺さる
	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 1000);

	CreateSE("SE02","SE_擬音_杭_突きささる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back11", 600, 0, 0, 1280, 720, "White");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 100, 1000, null, true);
	FadeDelete("back11", 200, true);

//それは僕の首筋を貫く。
	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>それは僕の首筋を貫く。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("それは僕の首筋を貫く。", "NULL", NULL);
	SetBacklog("それは拓巳の首筋を貫く。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「それは僕の首筋を貫く。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
それは拓巳の首筋を貫く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text016", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	FadeDelete("テキスト１", 0, true);

//全身が千切れそうなほどの激痛。気が狂いそうな痛み。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>全身が千切れそうなほどの激痛。気が狂いそうな痛み。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("全身が千切れそうなほどの激痛。気が狂いそうな痛み。", "NULL", NULL);
	SetBacklog("どこまで痛みに耐えきれるかと、諏訪の心は残忍さで沸き立つ。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「全身が千切れそうなほどの激痛。気が狂いそうな痛み。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
どこまで痛みに耐えきれるかと、諏訪の心は残忍さで沸き立つ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text017", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	FadeDelete("テキスト１", 0, true);

//拷問のように、徐々に死へと近づいている。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>拷問のように、徐々に死へと近づいている。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("拷問のように、徐々に死へと近づいている。", "NULL", NULL);
	SetBacklog("拷問のように、徐々に死へと近づかせてやる。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「拷問のように、徐々に死へと近づいている。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
拷問のように、徐々に死へと近づかせてやる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text018", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「はぁ……はぁ……はぁ……」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「はぁ……はぁ……はぁ……」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("拓巳","ch10/20700080ta");
//	SoundPlay("拓巳",0,1000,false);

	SetBacklog("「はぁ……はぁ……はぁ……」", "voice/ch10/20700080ta", 拓巳);
	SetBacklog("「はぁ……はぁ……はぁ……」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700080ta">
「はぁ……はぁ……はぁ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text019", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//僕は抵抗もできず、しかし倒れないように足に力を込め、身体に杭を受け続ける。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>僕は抵抗もできず、しかし倒れないように足に力を込め、");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("僕は抵抗もできず、しかし倒れないように足に力を込め、", "NULL", NULL);
	SetBacklog("拓巳は抵抗もできず、しかし倒れることもせず、", "NULL", NULL);

	Request("テキスト１", NoIcon);


//※「僕は抵抗もできず、しかし倒れないように足に力を込め、身体に杭を受け続ける。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
拓巳は抵抗もできず、しかし倒れることもせず、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text020", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//身体に杭を受け続ける。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>身体に杭を受け続ける。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("身体に杭を受け続ける。", "NULL", NULL);
	SetBacklog("その身体に杭を受け続ける。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「僕は抵抗もできず、しかし倒れないように足に力を込め、身体に杭を受け続ける。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text100]
その身体に杭を受け続ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text100", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

//ＳＥ//杭が高速で飛び、空気を切り裂く音
//ＳＥ//杭が拓巳に突き刺さる

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 1000);

	CreateSE("SE02","SE_擬音_杭_突きささる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back11", 600, 0, 0, 1280, 720, "White");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 100, 1000, null, true);
	FadeDelete("back11", 200, true);

//僕の胸。腹。爪先。全身の至るところへと。
	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>僕の胸。腹。爪先。全身の至るところへと。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("僕の胸。腹。爪先。全身の至るところへと。", "NULL", NULL);
	SetBacklog("拓巳の胸。腹。爪先。全身の至るところへと。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「僕の胸。腹。爪先。全身の至るところへと。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
拓巳の胸。腹。爪先。全身の至るところへと。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text021", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	FadeDelete("テキスト１", 0, true);

//太く鋭い杭が容赦なく打ち込まれ続ける。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>太く鋭い杭が容赦なく打ち込まれ続ける。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("太く鋭い杭が容赦なく打ち込まれ続ける。", "NULL", NULL);
	SetBacklog("太く鋭い杭を容赦なく打ち込み続ける。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「太く鋭い杭が容赦なく打ち込まれ続ける。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
太く鋭い杭を容赦なく打ち込み続ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text022", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

//ＳＥ//杭が高速で飛び、空気を切り裂く音
//ＳＥ//杭が拓巳に突き刺さる

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 1000);

	CreateSE("SE02","SE_擬音_杭_突きささる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back11", 600, 0, 0, 1280, 720, "White");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 100, 1000, null, true);
	FadeDelete("back11", 200, true);

//「虫ピンで標本にされた昆虫みたいだな」
	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「虫ピンで標本にされた昆虫みたいだな」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("拓巳", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700090su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「虫ピンで標本にされた昆虫みたいだな」", "voice/ch10/20700090su", 諏訪);
	SetBacklog("「虫ピンで標本にされた昆虫みたいだな」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700090su">
「虫ピンで標本にされた昆虫みたいだな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text023", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「しかもカブトムシとか蝶とかじゃない」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「しかもカブトムシとか蝶とかじゃない」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700100su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「しかもカブトムシとか蝶とかじゃない」", "voice/ch10/20700100su", 諏訪);
	SetBacklog("「しかもカブトムシとか蝶とかじゃない」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700100su">
「しかもカブトムシとか蝶とかじゃない」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text024", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「お前みたいなガキには、コガネムシあたりがお似合いだ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「お前みたいなガキには、コガネムシあたりがお似合いだ」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700110su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「お前みたいなガキには、コガネムシあたりがお似合いだ」", "voice/ch10/20700110su", 諏訪);
	SetBacklog("「お前みたいなガキには、コガネムシあたりがお似合いだ」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700110su">
「お前みたいなガキには、コガネムシあたりがお似合いだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text025", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//僕はもう立っているのも無理な状態だった。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>僕はもう立っているのも無理な状態だった。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	SetBacklog("僕はもう立っているのも無理な状態だった。", "NULL", NULL);
	SetBacklog("拓巳はもはや立っているのも無理な状態だった。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「僕はもう立っているのも無理な状態だった。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
拓巳はもはや立っているのも無理な状態だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text026", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//ただ気力だけで、僕は倒れずにいる。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>ただ気力だけで、僕は倒れずにいる。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	SetBacklog("ただ気力だけで、僕は倒れずにいる。", "NULL", NULL);
	SetBacklog("なぜ倒れないのか、諏訪には不思議でならない。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「ただ気力だけで、僕は倒れずにいる。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
なぜ倒れないのか、諏訪には不思議でならない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text027", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//ＳＥ//杭が高速で飛び、空気を切り裂く音
//ＳＥ//杭が拓巳に突き刺さる
	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 1000);

	CreateSE("SE02","SE_擬音_杭_突きささる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back11", 600, 0, 0, 1280, 720, "White");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 100, 1000, null, true);
	FadeDelete("back11", 200, true);

	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
//でも、そろそろ限界だ……。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>でも、そろそろ限界だ……。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("でも、そろそろ限界だ……。", "NULL", NULL);
	SetBacklog("だが、そろそろ限界のはず。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「でも、そろそろ限界だ……。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
だが、そろそろ限界のはず。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text028", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//視界にモザイクがかかったようで、はっきり見えない。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>視界にモザイクがかかったようで、はっきり見えない。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	SetBacklog("視界にモザイクがかかったようで、はっきり見えない。", "NULL", NULL);
	SetBacklog("その目は虚ろで、おそらくもうなにも見えていない。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「視界にモザイクがかかったようで、はっきり見えない。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
その目は虚ろで、おそらくもうなにも見えていない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text029", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「遺言があるなら言いな。ただし２０字以内だ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「遺言があるなら言いな。ただし２０字以内だ」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700120su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「遺言があるなら言いな。ただし２０字以内だ」", "voice/ch10/20700120su", 諏訪);
	SetBacklog("「遺言があるなら言いな。ただし２０字以内だ」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700120su">
「遺言があるなら言いな。ただし２０字以内だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text030", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//手に次なる杭を握りしめ、諏訪が、僕に勝ち誇ったようにつぶやく。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>手に次なる杭を握りしめ、諏訪が、僕に勝ち誇ったようにつぶやく。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("手に次なる杭を握りしめ、諏訪が、僕に勝ち誇ったようにつぶやく。", "NULL", NULL);
	SetBacklog("手に次なる杭を握りしめ、諏訪は、拓巳に勝ち誇ったようにつぶやく。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「手に次なる杭を握りしめ、諏訪が、僕に勝ち誇ったようにつぶやく。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text031]
手に次なる杭を握りしめ、諏訪は、拓巳に勝ち誇ったようにつぶやく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text031", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「は……あ……は、あ……は……あ……」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「は……あ……は、あ……は……あ……」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("拓巳","ch10/20700130ta");
//	SoundPlay("拓巳",0,1000,false);

	SetBacklog("「は……あ……は、あ……は……あ……」", "voice/ch10/20700130ta", 拓巳);
	SetBacklog("「は……あ……は、あ……は……あ……」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text032]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700130ta">
「は……あ……は、あ……は……あ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text032", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//次で殺される。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>次で殺される。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("次で殺される。", "NULL", NULL);
	SetBacklog("次で殺してやる。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「次で殺される。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text033]
次で殺してやる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text033", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「さっき……童貞野郎、って、言った……」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「さっき……童貞野郎、って、言った……」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("拓巳", 0, 0, NULL);
//	CreateVOICE("拓巳","ch10/20700140ta");
//	SoundPlay("拓巳",0,1000,false);

	SetBacklog("「さっき……童貞野郎、って、言った……」", "voice/ch10/20700140ta", 拓巳);
	SetBacklog("「さっき……童貞野郎、って、言った……」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text034]
//◆息も絶え絶え
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700140ta">
「さっき……童貞野郎、って、言った……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text034", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「傷ついたのか？」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「傷ついたのか？」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("拓巳", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700150su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「傷ついたのか？」", "voice/ch10/20700150su", 諏訪);
	SetBacklog("「傷ついたのか？」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text035]
//◆嘲笑
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700150su">
「傷ついたのか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text035", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//僕は、遠くから聞こえてくる声を頼りに、諏訪をにらみつけ。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>僕は、遠くから聞こえてくる声を頼りに、諏訪をにらみつけ。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("僕は、遠くから聞こえてくる声を頼りに、諏訪をにらみつけ。", "NULL", NULL);
	SetBacklog("拓巳の、光が消えかけた瞳が、諏訪をにらみつけ。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「僕は、遠くから聞こえてくる声を頼りに、諏訪をにらみつけ。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text036]
拓巳の、光が消えかけた瞳が、諏訪をにらみつけ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text036", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「これが最後の１本」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「これが最後の１本」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700160su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「これが最後の１本」", "voice/ch10/20700160su", 諏訪);
	SetBacklog("「これが最後の１本」", "NULL", NULL);

	Request("テキスト１", NoIcon);

	SetVolume360("chn01", 3000, 0, null);


//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text037]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700160su">
「これが最後の１本」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text037", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「神光の救いは……お前にはやらねえよ！」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「神光の救いは……お前にはやらねえよ！」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700170su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「神光の救いは……お前にはやらねえよ！」", "voice/ch10/20700170su", 諏訪);
	SetBacklog("「神光の救いは……お前にはやらねえよ！」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text038]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700170su">
「神光の救いは……お前にはやらねえよ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text038", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//ＳＥ//杭が高速で飛び、空気を切り裂く音
	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 1000);

	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
//諏訪が投げた杭の、空気を切り裂く気配を感じる。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>諏訪が投げた杭の、空気を切り裂く気配を感じる。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("諏訪が投げた杭の、空気を切り裂く気配を感じる。", "NULL", NULL);
	SetBacklog("諏訪は、手許の杭を投げた。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「諏訪が投げた杭の、空気を切り裂く気配を感じる。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text039]
諏訪は、手許の杭を投げた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text039", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	FadeDelete("テキスト１", 0, true);

//「……知ってる？」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「……知ってる？」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("拓巳","ch10/20700180ta");
//	SoundPlay("拓巳",0,1000,false);

	SetBacklog("「……知ってる？」", "voice/ch10/20700180ta", 拓巳);
	SetBacklog("「……知ってる？」", "NULL", NULL);

	Request("テキスト１", NoIcon);

	DeleteStand("bu護_スーツ_通常_cool", 0, true);
	Delete("back04");

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text040]
//◆息も絶え絶え
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700180ta">
「……知ってる？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text040", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

	CreateTexture360("back10", 100, 0, 0, "cg/ev/ev095_01_1_拓巳ダーツ逆転_a.jpg");

//※ここで拓巳と諏訪の妄想が完全に同期

	Wait(1000);

	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
//それは必殺の杭。約束された福音をもたらす十字架。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>それは必殺の杭。約束された福音をもたらす十字架。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	SetBacklog("それは必殺の杭。約束された福音をもたらす十字架。", "NULL", NULL);
	SetBacklog("それは必殺の杭。約束された福音をもたらす十字架。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text041]
それは必殺の杭。約束された福音をもたらす十字架。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text041", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

	Move("back10", 3000, 0, -832, Axl2, true);

	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
//この一撃で、死ぬのは――
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 480, @86, Middle, Auto, Auto, "<SPAN value=0>この一撃で、死ぬのは――");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("この一撃で、死ぬのは――", "NULL", NULL);
	SetBacklog("この一撃で、死ぬのは――", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text042]
この一撃で、死ぬのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text042", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

	Wait(1000);

	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
//「童貞の妄想力は、凄いんだ――」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「童貞の妄想力は、凄いんだ――」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("拓巳", 0, 0, NULL);
//	CreateVOICE("拓巳","ch10/20700190ta");
//	SoundPlay("拓巳",0,1000,false);

	SetBacklog("「童貞の妄想力は、凄いんだ――」", "voice/ch10/20700190ta", 拓巳);
	SetBacklog("「童貞の妄想力は、凄いんだ――」", "NULL", NULL);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text043]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700190ta">
「童貞の妄想力は、凄いんだ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text043", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//※ここで「画面中央＝拓巳主観、テキストウインドウ＝諏訪主観」から「画面中央＝諏訪主観、テキストウインドウ＝拓巳主観」に入れ替わります。

//ＳＥ//ヒュンヒュンという機械音はここで終了
//ＳＥ//諏訪の額に杭が突き刺さる
	SetVolume("SE03", 0, 0, null);
	FadeDelete("テキスト１", 0, true);

	CreateSE("SE02","SE_擬音_杭_突きささる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back11", 600, 0, 0, 1280, 720, "White");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 100, 1000, null, true);
	FadeDelete("back11", 200, true);

	FadeDelete("CenterLog", 500, false);

//鈍い音を立てて。
	CreateColor("CenterLog", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>鈍い音を立てて。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("鈍い音を立てて。", "NULL", NULL);
	SetBacklog("鈍い音を立てて。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text044]
鈍い音を立てて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text044", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	Delete("back11");
	FadeDelete("CenterLog", 500, true);

	CreateTextureEX("back11", 100, 0, -736, "cg/ev/ev095_02_1_拓巳ダーツ逆転_a.jpg");
	Request("back11", Smoothing);
	CreateSE("SE05","SE_擬音_光が広がる");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	Move("back10", 5000, 0, @736, Dxl2, false);
	Move("back11", 5000, 0, @736, Dxl2, false);
	Fade("back11", 3000, 1000, null, false);

/*
	CreateTextureEX("back11", 100, Center, InBottom, "cg/ev/ev095_01_1_拓巳ダーツ逆転_a.jpg");
	SetBlur("back11", true, 2, 500, 100);
	Zoom("back11", 0, 1500, 1500, null, true);
	Move("back10", 100, 0, -480, Dxl2, false);
	Zoom("back11", 1500, 1000, 1000, Dxl1, false);
	Fade("back11", 1000, 1000, null, true);
*/

	Wait(1000);

//杭は、額に深々と突き刺さった。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>杭は、額に深々と突き刺さった。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("杭は、額に深々と突き刺さった。", "NULL", NULL);
	SetBacklog("杭は、額に深々と突き刺さった。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text045]
杭は、額に深々と突き刺さった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text045", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//諏訪の全身――その体内から、湧き出るように激痛が発生した。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>諏訪の全身――その体内から、湧き出るように激痛が発生した。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	SetBacklog("諏訪の全身――その体内から、湧き出るように激痛が発生した。", "NULL", NULL);
	SetBacklog("僕の全身を蝕んでいた激痛が、まるで幻だったかのようにすべて消え去る。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「諏訪の全身――その体内から、湧き出るように激痛が発生した。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text046]
僕の全身を蝕んでいた激痛が、まるで幻だったかのようにすべて消え去る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text046", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//諏訪は声にならない悲鳴を上げ、あえぐ。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>諏訪は声にならない悲鳴を上げ、あえぐ。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);


	SetBacklog("諏訪は声にならない悲鳴を上げ、あえぐ。", "NULL", NULL);
	SetBacklog("僕は深く息をつき、渇いた唇をそっと舐めた。", "NULL", NULL);

//※「諏訪は声にならない悲鳴を上げ、あえぐ。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text047]
僕は深く息をつき、渇いた唇をそっと舐めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text047", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//諏訪の全身には、十字架型の杭が突き刺さっている。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>諏訪の全身には、十字架型の杭が突き刺さっている。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("諏訪の全身には、十字架型の杭が突き刺さっている。", "NULL", NULL);
	SetBacklog("僕の手には、十字架型の杭がひとつ。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「諏訪の全身には、十字架型の杭が突き刺さっている。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text048]
僕の手には、十字架型の杭がひとつ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text048", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	FadeDelete("テキスト１", 0, true);

//上を見上げれば、額に突き刺さった十字架。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>上を見上げれば、額に突き刺さった十字架。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("上を見上げれば、額に突き刺さった十字架。", "NULL", NULL);
	SetBacklog("空を見上げれば、どんよりとした雲。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「上を見上げれば、額に突き刺さった十字架。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text049]
空を見上げれば、どんよりとした雲。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text049", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「復活の奇跡は物語で、妄想なんだ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「復活の奇跡は物語で、妄想なんだ」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("拓巳", 0, 0, NULL);
//	CreateVOICE("拓巳","ch10/20700200ta");
//	SoundPlay("拓巳",0,1000,false);

	SetBacklog("「復活の奇跡は物語で、妄想なんだ」", "voice/ch10/20700200ta", 拓巳);
	SetBacklog("「復活の奇跡は物語で、妄想なんだ」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text050]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700200ta">
「復活の奇跡は物語で、妄想なんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text050", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「なに……を、し、た……？」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「なに……を、し、た……？」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("拓巳", 0, 0, NULL);
//	CreateVOICE("諏訪","ch10/20700210su");
//	SoundPlay("諏訪",0,1000,false);

	SetBacklog("「なに……を、し、た……？」", "voice/ch10/20700210su", 諏訪);
	SetBacklog("「なに……を、し、た……？」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text051]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20700210su">
「なに……を、し、た……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text051", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	FadeDelete("テキスト１", 0, true);

//「妄想シンクロ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「妄想シンクロ」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("諏訪", 0, 0, NULL);
//	CreateVOICE("拓巳１","ch10/20700220ta");
//	SoundPlay("拓巳１",0,1000,false);

	SetBacklog("「妄想シンクロ」", "voice/ch10/20700220ta", 拓巳);
	SetBacklog("「妄想シンクロ」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text052]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700220ta">
「妄想シンクロ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text052", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	FadeDelete("テキスト１", 0, true);

//妄想への同化。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>妄想への同化。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("妄想への同化。", "NULL", NULL);
	SetBacklog("心への侵食。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「妄想への同化。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text053]
心への侵食。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text053", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//ふたつの波紋が打ち消し合うように。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>ふたつの波紋が打ち消し合うように。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("ふたつの波紋が打ち消し合うように。", "NULL", NULL);
	SetBacklog("ふたつの波長が共鳴するように。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「ふたつの波紋が打ち消し合うように。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text054]
ふたつの波長が共鳴するように。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text054", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//絡まり合い。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>絡まり合い。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("絡まり合い。", "NULL", NULL);
	SetBacklog("溶け合い。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「絡まり合い。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text055]
溶け合い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text055", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	FadeDelete("テキスト１", 0, true);

//自分が作り出した因果が歪まされ。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>自分が作り出した因果が歪まされ。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("自分が作り出した因果が歪まされ。", "NULL", NULL);
	SetBacklog("他人が作り出した因果を歪ませて。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「自分が作り出した因果が歪まされ。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text056]
他人が作り出した因果を歪ませて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text056", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	FadeDelete("テキスト１", 0, true);

//入れ替えられた。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>入れ替えられた。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("入れ替えられた。", "NULL", NULL);
	SetBacklog("入れ替えた。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「入れ替えられた。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text057]
入れ替えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text057", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//そんなことできるわけがない、と諏訪は信じられない思いだった。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>そんなことできるわけがない、と諏訪は信じられない思いだった。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("そんなことできるわけがない、と諏訪は信じられない思いだった。", "NULL", NULL);
	SetBacklog("そんなことできるわけがない、と諏訪の表情は語っていた。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「そんなことできるわけがない、と諏訪は信じられない思いだった。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text058]
そんなことできるわけがない、と諏訪の表情は語っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text058", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Delete("テキスト１");
	Delete("@text058");

//「神の尖兵なら、メシアと同じように、朽ち果てろ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「神の尖兵なら、メシアと同じように、朽ち果てろ」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", NoIcon);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("拓巳１", 0, 0, NULL);
//	CreateVOICE("拓巳","ch10/20700230ta");
//	SoundPlay("拓巳",0,1000,false);

	SetBacklog("「神の尖兵なら、メシアと同じように、朽ち果てろ」", "voice/ch10/20700230ta", 拓巳);
	SetBacklog("「神の尖兵なら、メシアと同じように、朽ち果てろ」", "NULL", NULL);

#TIPS_メシア = true;
$TIPS_on_メシア = true;

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text059]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700230ta">
「神の尖兵なら、<FONT incolor="#88abda" outcolor="BLACK">メシア</FONT>と同じように、朽ち果てろ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text059", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

	CreateSE("SE02","SE_衝撃_杭_落ちる_壁");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//拓巳が、杭を放り捨てる。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>拓巳が、杭を放り捨てる。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("拓巳が、杭を放り捨てる。", "NULL", NULL);
	SetBacklog("僕は、杭を放り捨てる。", "NULL", NULL);

	Request("テキスト１", NoIcon);

$TIPS_on_メシア = false;

//※「拓巳が、杭を放り捨てる。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text060]
僕は、杭を放り捨てる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text060", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//諏訪の視界から、急速に色が失われていく。
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>諏訪の視界から、急速に色が失われていく。");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetBacklog("諏訪の視界から、急速に色が失われていく。", "NULL", NULL);
	SetBacklog("諏訪の瞳から、急速に輝きが失われていく。", "NULL", NULL);

	Request("テキスト１", NoIcon);

//※「諏訪の視界から、急速に色が失われていく。」は画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text061]
諏訪の瞳から、急速に輝きが失われていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text061", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「それと」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「それと」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("拓巳", 0, 0, NULL);
//	CreateVOICE("拓巳","ch10/20700240ta");
//	SoundPlay("拓巳",0,1000,false);

	SetBacklog("「それと」", "voice/ch10/20700240ta", 拓巳);
	SetBacklog("「それと」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text062]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700240ta">
「それと」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text062", NoLog);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);

//「僕は、救いなんか、いらないよ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, AROUND);
	CreateText("テキスト１", 600, @108, Middle, Auto, Auto, "<SPAN value=0>「僕は、救いなんか、いらないよ」</SPAN>");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

//	SetVolume("拓巳", 0, 0, NULL);
//	CreateVOICE("拓巳","ch10/20700250ta");
//	SoundPlay("拓巳",0,1000,false);

	SetBacklog("「僕は、救いなんか、いらないよ」", "voice/ch10/20700250ta", 拓巳);
	SetBacklog("「僕は、救いなんか、いらないよ」", "NULL", NULL);

	Request("テキスト１", NoIcon);

//画面中央とテキストウインドウ（画面下方）に以下の同じテキストを表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text063]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20700250ta">
「僕は、救いなんか、いらないよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	Request("@text063", NoLog);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	FadeDelete("テキスト１", 0, true);
	FadeDelete("CenterLog", 500, true);

	Wait(500);

//■インターミッション５３ａ終了
//※インターミッション５３ａは終了を意味するアイキャッチはありません
//※以下から、画面中央のテキスト表示ナシでお願いします

}


//■TypeBegin10
//■SetText2