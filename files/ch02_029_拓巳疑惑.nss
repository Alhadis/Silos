//<continuation number="60">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_029_拓巳疑惑";
		$GameContiune = 1;
		Reset();
	}

		ch02_029_拓巳疑惑();
}


function ch02_029_拓巳疑惑()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//※拓巳視点に戻る

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);

	CreateColor("背景１", 150, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 1000, null, true);

//ＳＥ//マウスのボタンを押す音//断続的に続く
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	CreateSE("SE10","SE_日常_PC_マウスくりっく02");
	SoundPlay("SE01", 2000, 500, true);
	SoundPlay("SE10", 500, 500, true);
	Wait(1000);

//ＢＧ//拓巳の部屋
//イメージＢＧ//ＰＣ画面（エンスープレイ中）
	CubeRoom3("ルーム", 100, 0);
	Fade("ルーム", 0, 1000, null, true);
	Rotate("ルーム", 1, @0, @20, @0, null, true);
	MoveCube("ルーム", 0, @-50, @0, @-150, null, true);

//ＳＥ//イス軋
	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	SoundPlay("SE02", 0, 1000, false);

	Fade("背景１", 1000, 0, null, false);
	MoveCube("ルーム", 2000, @50, @0, @150, Dxl3, true);
	Wait(1500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
――すべてが、嘘に感じる。

世界は虚構で満ちている。

しかも悪意ばかりが溢れていて、僕を攻撃してくる。

</PRE>/	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	Wait(200);

	SoundPlay("SE10", 200, 0, false);
	SoundPlay("SE01", 1000, 1, true);
	CreateColor("背景２", 50, 0, 0, 1280, 720, "Black");
	CreateColor("背景３", 70, 0, 0, 1280, 720, "Black");
	Fade("背景３", 0, 500, null, true);
	Stand("bu優愛_制服_通常左手下","hard", 60, @100);
	FadeStand("bu優愛_制服_通常左手下_hard", 0, true);
	Fade("ルーム", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//ＶＦ//回想セリフ
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/02900010yu">
「いつもあなたが使っているチャットルームへログインして、
　自分で調べてみてください」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/02900020yu">
「わたしの言っていることが間違っていないって、分かるはずです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/02900030yu">
「それと……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/02900040yu">
「わたしが言ったことは……全部、本心です。これだけは……信じて」

</PRE>/	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常左手下_hard", 300, true);
	SoundPlay("SE01", 1000, 500, true);
	Fade("背景３", 0, 0, null, true);
	Fade("ルーム", 1000, 1000, null, true);
	Delete("背景２");
	Delete("背景３");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
優愛は意味不明な自説を披露した後、最後にそう付け加えて僕の前から去っていった。

信じられるわけがない。
僕を騙しておいて、なにが“信じて”だ。

優愛が僕に突きつけた“僕のすべて”については、絶対に認めたくなかった。
『将軍』が僕自身だなんていうのは戯言だって思いたかった。

でも、チャットのログ時間を調べると、会話が噛み合っていないのは間違いなかったんだ。

</PRE>/	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――


	CreateTextureEX("背景２", 100, 80, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Rotate("ルーム", 1000, @0, @-20, @0, AxlDxl, false);
	Wait(100);
	Move("背景２", 800, @-80, @0, Dxl1, false);
	Fade("背景２", 1000, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【拓巳】
{#TIPS_夢遊病 = true;$TIPS_on_夢遊病 = true;}
<voice name="拓巳" class="拓巳" src="voice/ch02/02900050ta">
「僕は……<FONT incolor="#88abda" outcolor="BLACK">夢遊病</FONT>なの……？」

{$TIPS_on_夢遊病 = false;}
僕は、『将軍』がチャットに書き込みをしたと思われる時間、眠ってなんかいなかった。

確かにあの時間、僕が＠カフェに行ったのは事実だ。
でも寝てなんていない。だから夢遊病っていうのはあり得ない。

じゃあ、僕が『将軍』として書き込んだ記憶がいっさいないのはどういうことなんだろう。

あるいは、そのとき僕の身体を僕じゃない何者かが操っていたっていうことになるんだろうか……。

{	SetVolume360("CH*", 1000, 0, null);
	Fade("背景２", 500, 0, null, true);}
バカバカしい……。

</PRE>/	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	SoundPlay("SE02", 0, 1000, false);
	Rotate("ルーム", 1000, @0, @20, @0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
僕は動揺を抑えるために、もうひとつの虚構世界であるエンスーへと現実逃避することにした。

エンスーだって、すべてが嘘だ。
これはしょせんゲームの世界なんだから。

でもバゼラードでは僕はナイトハルトっていう、神に等しい存在になれる。

こういう虚構なら、こういう嘘なら、僕は受け入れられる。
ここにいたいって思う。

それでいいじゃないか。

あるいは――

エンスーの世界こそが“本物”で、
こっちがニセモノ――ゲームだったりするのかもしれない。

西條拓巳なんて架空の存在で、
僕の真の姿はナイトハルトの方なのかもしれない。

</PRE>/	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：先行生成
	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "Red");
	Fade("フラッシュ", 0, 0, null, false);
	Request("フラッシュ", AddRender);


	CreateMovie360("ナイトハルト", 100, Center, Middle, true, false, "dx/mvNH01.avi");	
	Fade("ナイトハルト", 0, 0, null, true);

	Fade("ルーム", 1000, 0, null, false);
	MoveCube("ルーム", 1000, @-50, @0, @-150, AxlDxl, false);
	Fade("ナイトハルト", 1000, 1000, null, true);

	Delete("ルーム");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/02900060ta">
「ねえ、ナイトハルト……」

モニタの中の聖騎士に向かって呼びかけてみる。

僕がキミを操作してるのか、キミが僕を操作してるのか、どっちなんだろう。
キミが現実で、僕がアバターなのかな？

僕がいるこの世界こそが、ゲームだったとしたら？
もしそうなら、謎はすべて解決するんだ。

僕が今、モニタの中のナイトハルトを見つめているように。
僕も、誰かに見つめられているんだとしたら。

</PRE>/	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 0, 1000, null, true);

//――その目だれの目？
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 600, center, middle, Auto, Auto, "――その目だれの目？");

	SetBacklog("――その目だれの目？", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, false);
	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601102]
その答えは“僕を操作しているプレイヤー”っていうことになる。

だったらもっと上手にプレイしてほしいね。
でもアバターは文句を言えない。

『将軍』と僕が同一人物っていうのも、説明がつく。

言ってみればリーゼロッテみたいなものだ。
ナイトハルトとリーゼロッテは、決して同じ時間にバゼラードに存在できない。プレイヤーは僕ひとりなんだから。

それと同じように、西條拓巳と『将軍』もまた、同じ時間にこの世界には存在できないのかも。

あるいはバグだっていう可能性も考えられる。

バグと言えば、妙な女が現れたり殺人事件に遭遇したりするのもバグかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	Fade("フラッシュ", 100, 1000, null, true);
	Delete("ナイトハルト");

	CreateSE("SE02","SE_衝撃_ふらっしゅばっく");
	CreateTextureEX("背景２", 100, 0, 0, "cg/ev/ev006_01_3_グロ画像_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	SoundPlay("SE02", 0, 1000, false);
	Fade("フラッシュ", 100, 0, null, true);
	Wait(1000);

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "Red");
	Fade("フラッシュ", 0, 0, null, false);
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 300, 1000, null, true);
	Delete("背景２");

	CreateMovie360("ナイトハルト", 100, Center, Middle, true, false, "dx/mvNH01.avi");	

	FadeDelete("フラッシュ", 500, true);

	Wait(500);

//イメージＢＧ//グロ画像イメージ
//フラッシュバックで一瞬表示

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
『将軍』から送られてきたあの画像が脳裏をよぎり、僕は頭を抱えた。
必死でかぶりを振る。

すべてから逃げ出しちゃいたいよ――

もし僕を操作してるプレイヤーがいるなら、

頼むからリセットして、

一からキャラメイキングをやり直してくれ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴ用エフェクト
//ＳＥ//妄想ＯＵＴ

	SetVolume360("CH*", 100, 0, null);

	DelusionOut();

	Delete("背景*");
	Delete("色*");
	Delete("ナイトハルト");

	DelusionOut2();

//おがみ：TCR抵触につき修正
//	Wait(6000);

//画面暗転で１５秒ほどウエイト
//プレイヤーに「拓巳の言葉によって、現実の（プレイヤーの）パソコンの電源が切れた！？」とちょっとビックリさせる。

}

