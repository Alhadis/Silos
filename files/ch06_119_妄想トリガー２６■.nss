//<continuation number="770">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_119_妄想トリガー２６■";
		$GameContiune = 1;
		Reset();
	}

		ch06_119_妄想トリガー２６■();
}


function ch06_119_妄想トリガー２６■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景４", 100, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");
	Stand("buセナ_制服_通常","hard", 200, @-50);
	FadeStand("buセナ_制服_通常_hard", 0, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐４へ
//ネガティブ妄想→分岐５へ
//妄想しない→分岐６へ

if($妄想トリガー通過２６ == 0)
{
	SetChoice03("ポジティブ妄想","ネガティブ妄想","妄想しない");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA03();
			$妄想トリガー２６ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー２６ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー２６ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー２６ == 2)
{
//☆☆☆
//分岐４
//画面エフェクト//妄想ＩＮエフェクト

	SetVolume360("CH*", 0, 0, null);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();
	BoxDelete(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Delete("背景４");
	DeleteStand("buセナ_制服_通常_hard", 0, true);
	Stand("buセナ_制服_通常","hard", 200, @-50);
	FadeStand("buセナ_制服_通常_hard", 0, true);

	DelusionIn2();

	CreateSE("SE01","SE_日常_松濤公園");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
セナの荒い鼻息が、僕の頬を撫でる。

それこそ本気で噛みつかれるんじゃないかと思って怖くなる。

セナは僕を至近距離から睨んだまま――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("セナキス", 200, 0, 96, "cg/ev/ev121_01_1_セナキス_a.jpg");
	DeleteStand("buセナ_制服_通常_hard", 300, true);

	Move("セナキス", 1000, @0, @-96, Dxl1, false);
	Fade("セナキス", 1000, 1000, null, true);
	SoundPlay("SE01", 500, 0, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//◆荒々しくキスする
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900010sn">
「んっ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900020ta">
「……！？」

僕の唇に、なにか柔らかいものが押しつけられた。

なにが起きたか理解できず、しかも呼吸ができなくなって、目が回りそうになる。

逃げようと思っても、セナに胸ぐらをつかまれたままで動けない。

{	BGMPlay360("CH11",2000,1000,true);}
//◆荒々しくキスする
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900030sn">
「んっ……ふっ……！」

しかも口の中に、艶めかしく蠢くなにかが侵入してきた。それは荒々しく僕の舌に絡みつき、僕の歯茎を舐め、僕の口内を蹂躙する。

訳が分からなくて、
でもなぜか、
すごく気持ちがよくて、

だけどやっぱり息が苦しくて、
失神しそうになる。

その直前で、ようやくその蠢くなにかが口から出ていった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Fade("セナキス", 1000, 0, null, true);
	Stand("buセナ_制服_照れ","shy", 200, @-50);
	FadeStand("buセナ_制服_照れ_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆唇を離して吐息
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900040sn">
「ぁっ……」

//◆恍惚
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900050sn">
「はあ……はあ……」

セナの唇が、だ液でぬらぬらと濡れていた。

さっきまで殺気じみた目でにらみつけていたのに、今はとろけたような目付きをしている。

もしかして今のって……

キスされた……！？

//◆怒った口調
//【セナ】
{	Stand("buセナ_制服_通常","hard", 200, @-50);
	DeleteStand("buセナ_制服_照れ_shy", 300, true);
	FadeStand("buセナ_制服_通常_hard", 300, true);}
<voice name="セナ" class="セナ" src="voice/ch06/11900060sn">
「お前こそ勇者だ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900070sn">
「お前の力を私に貸せ。私と一緒に戦え」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900080sn">
「拒否するのは許さない……！」

{	DeleteStand("buセナ_制服_通常_hard", 200, true);
	Fade("セナキス", 300, 1000, null, false);}
怒った口調でそんな意味不明なことをまくしたて、またセナは顔を寄せてきた。

//◆荒々しくキスする
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900090sn">
「んっ……！」

狂おしいまでに唇を押しつけられ、口の中を犯される。

その熱い吐息、さらに甘いだ液までも僕の口の中へと送り込んでくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("セナキス", 300, 0, null, true);
	Stand("buセナ_制服_横向","shy", 200, @-50);
	FadeStand("buセナ_制服_横向_shy", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆恍惚
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900100sn">
「はぁっ、はぁっ、はぁっ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900110sn">
「私は勇者に純血を捧げるために生まれてきた巫女だ」

恍惚の表情を浮かべ、“それなんてエロゲ？”なセリフを吐き、

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900120sn">
「お前がいないとこの戦いには勝てない」

{	Stand("buセナ_制服_通常","hard", 200, @-50);
	FadeStand("buセナ_制服_通常_hard", 500, false);
	DeleteStand("buセナ_制服_横向_shy", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900130sn">
「さあ、血の契約を交わそう……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buセナ_制服_通常_hard", 500, true);
	Fade("セナキス", 1000, 1000, null, true);
	Wait(500);
	CreateColor("痛い", 2000, 0, 0, 1280, 720, "Red");
	Request("痛い", AddRender);
	Fade("痛い", 0, 0, null, true);
	Fade("痛い", 150, 800, null, true);
	FadeDelete("痛い", 150,. true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
セナは、僕の唇をきつく噛んだ。
痛みが走り、口の中に血の味が広がる。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900140sn">
「お前が欲しい」

人にものを頼む態度じゃなかった。

そもそも言っていることが無茶苦茶だった。

でも、まるで逆レイプされているような感覚に、僕は……

こういうプレイもありかも、と興奮してしまっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//妄想ＯＵＴ
//画面エフェクト//妄想ＯＵＴエフェクト

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*", 0, 0, false);

	DelusionOut();

	Delete("セナキス");
	Stand("buセナ_制服_通常","hard", 200, @-50);
	FadeStand("buセナ_制服_通常_hard", 0, true);

	CreateSE("SE01","SE_日常_松濤公園");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

	DelusionOut2();
	PositiveHuman();

//ＢＧ//松濤公園

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900150sn">
「――おい、無視するな！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900160ta">
「……！」

我に返る。

僕はセナに胸ぐらをつかまれ、相変わらず遊具に押しつけられていた。

セナの顔はやっぱり間近にある。
彼女と目が合って、つい顔が熱くなった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900170ta">
「え……と……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900180sn">
「その力のことを誰に教わったんだって聞いているんだ……！」

そんなこと聞かれた覚えはなかった。

もしかしてさっきの逆レイプは僕の妄想で、そっちに現実逃避していた……のか？

まだ状況が整理できないでいるのに、セナはお構いなしで僕の身体を乱暴に揺すってくる。

{	Stand("buセナ_制服_通常","angry", 200, @-50);
	FadeStand("buセナ_制服_通常_angry", 300, true);
	DeleteStand("buセナ_制服_通常_hard", 0, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900190sn">
「誰からだ！　答えろ！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900200sn">
{#TIPS_天成神光会 = true;$TIPS_on_天成神光会 = true;}「<FONT incolor="#88abda" outcolor="BLACK">天成神光会</FONT>とは関係あるのか、ないのか！」

{$TIPS_on_天成神光会 = false;}
な、なんだよその天成なんとかって……。
僕は反射的に首を左右に振っていた。

息が……できない……！
窒息する……気が遠くなる……死ぬ……
もう……ダメだ……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	SoundPlay("SE01",3000,100,true);
	Fade("色１", 0, 0, null, true);
	Fade("色１", 3000, 1000, null, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Wait(200);

	DeleteStand("buセナ_制服_通常_angry", 0, true);

	Fade("色１", 100, 0, null, true);

	CreateSE("SE03","SE_じん体_動作_滑って転ぶ");
	SoundPlay("SE03",0,500,false);
	Shake("背景１", 300, 5, 5, 0, 0, 300, null, false);
	SoundPlay("SE01",3000,300,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
意識を失いそうになったその寸前、セナはいきなり手を離した。僕はその場に倒れ込む。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900210ta">
「うう……げほげほげほっ……！」

咳き込みつつも、必死で空気を吸い込んだ。

やっぱりセナは敵なの？　こいつも『将軍』の手下？

だとしたら逃げなくちゃ……

{	Stand("buセナ_制服_横向","hard_r", 200, @-50);
	FadeStand("buセナ_制服_横向_hard_r", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900220sn">
「関係ないならいい。悪かった……」

{	DeleteStand("buセナ_制服_横向_hard_r", 500, true);}
僕の困惑顔を見て、セナは軽く舌打ちし、それからため息をついた。

そのまま去っていこうとする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//合流２へ

}


//=============================================================================//

if($妄想トリガー２６ == 1)
{
//☆☆☆
//分岐５

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
セナの荒い鼻息が、僕の頬を撫でる。

今にも噛みつかれそうな勢い。

なんでこの女は……こんなに乱暴で……怖いんだ……っ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//妄想ＩＮ
//画面エフェクト//妄想ＩＮエフェクト

	SetVolume360("CH*", 0, 0, null);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();

	Delete("背景４");
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");

	DelusionIn2();

	CreateSE("SE01","SE_日常_松濤公園");
	MusicStart("SE01", 2000, 300, 0, 1000, null, true);

	CreateSE("SE02","SE_衝撃_びんたされる");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900230ta">
「離せ……このっ……！」

{	Stand("buセナ_制服_横向","think", 200, @-50);
	FadeStand("buセナ_制服_横向_think", 300, true);
	DeleteStand("buセナ_制服_通常_hard", 0, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900240sn">
「っ！」

//ＳＥ//全力ビンタ
{	SoundPlay("SE02",0,1000,false);
	Shake("背景１", 300, 5, 5, 0, 0, 300, null, false);
	Shake("buセナ_制服_横向_think", 300, 5, 5, 0, 0, 300, null, false);
	DeleteStand("buセナ_制服_横向_think", 300, false)}
思い切り手を振り抜いたら、それが偶然セナの頬を叩いていた。

//ＳＥ//人が倒れる音
{	CreateSE("SE03","SE_じん体_動作_滑って転ぶ");
	SoundPlay("SE03",0,500,false);}
セナはそのまま勢いよく倒れ込む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 300, 1000, null, true);
	CreateTexture360("セナ倒れ", 200, 0, 96, "cg/ev/ev122_01_1_セナ押し倒し_a.jpg");
	Fade("セナ倒れ", 0, 0, null, true);
	Fade("セナ倒れ", 0, 1000, null, true);
	Move("セナ倒れ", 1000, @0, @-96, Dxl1, false);
	FadeDelete("Black", 300, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900250sn">
「う……」

頬を手で押さえ、さっきまでの強気はどこへやら、少し怯えた目で僕を見上げてきた。

心なしかその瞳が潤んでいるように見える。

そんな、これまで目にしたことのないセナの弱々しい姿に、僕の中で嗜虐的な感情が燃え上がった。

これまでたまりにたまっていた鬱憤が、出口を見つけて一気に吐き出される。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900260ta">
「僕を……なめるな……っ」

けんか腰の言葉。
普通なら絶対使わない言葉。
それを言ってやった。

言ったら気持ちよかった。すっきりした。

//◆弱気
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900270sn">
「わ、悪かった……」

//◆弱気
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900280sn">
「でも、叩くなんて……ひどい……だろ……」

セナが泣きそうな顔をしているから、もっと言いたくなった。

{	CreateTexture360("セナ倒れ２", 250, 0, 0, "cg/ev/ev122_01_1_セナ押し倒し_a.jpg");
	Request("セナ倒れ２", Smoothing);
	Zoom("セナ倒れ２", 0, 1500, 1500, null, true);
	Move("セナ倒れ２", 0, -240, -200, null, true);
	Fade("セナ倒れ２", 0, 0, null, true);}
なよっとした感じで倒れているその姿とか、

{	Fade("セナ倒れ２", 1000, 1000, null, true);
	Wait(500);
	Move("セナ倒れ２", 20000, @+496, @+200, null, false);}
スカートがめくれていつも以上に露わになっている太ももの肉感とか、

地面に流れるように広がった長い黒髪とか、

そのどれもが僕を興奮させる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	FadeDelete("セナ倒れ２", 1500, true);
	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE02", 500, 1000, true);

	MusicStart("SE01", 5000, 0, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900290ta">
「ぼ、僕が、やられてばかりだと、お、思ったのか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900300ta">
「確かに、み、見た目は明らかに弱そうだもんな、僕は」

//◆「ＤＱＮ」＝「ドキュン」
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900310ta">
「明らかなＤＱＮを相手にするより、ぼ、僕みたいな、弱そうなヤツをいじめる方が楽だし、た、楽しいだろ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900320ta">
「調子に乗りやがって……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900330ta">
「ぼ、僕だって……や、やるときは、
やるんだぞ……っ、このビッチが！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900340ta">
「いつまでも、だ、黙ってばかりだと、思うなよ……！」

もう怒りの衝動は止められなかった。
この生意気な女を、メチャクチャにしてやりたかった。

倒れたままのセナの上に馬乗りになる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	BGMPlay360("CH06",1000,1000,true);

	CreateSE("SE03","SE_衝撃_どさっ");
	CreateSE("SE04","SE_じん体_動作_のぞく");
	SoundPlay("SE04", 0, 1000, false);
	Shake("セナ倒れ", 300, 5, 5, 0, 0, 300, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//◆弱気
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900350sn">
「な、なにを……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900360ta">
「うるさい……！」

{	SoundPlay("SE03",0,1000,false);}
彼女の両手首をつかみ、身動きを取れなくする。

{	CreateTexture360("セナ倒れ２", 250, 0, 0, "cg/ev/ev122_01_1_セナ押し倒し_a.jpg");
	Request("セナ倒れ２", Smoothing);
	Zoom("セナ倒れ２", 0, 1500, 1500, null, true);
	Move("セナ倒れ２", 0, 256, 120, null, true);
	Fade("セナ倒れ２", 0, 0, null, true);
	Fade("セナ倒れ２", 1000, 1000, null, true);}
真下から見上げられる形になった。
今まではいつも見下されていた。

今は、僕が上だ……！

この優越感に、頭がクラクラした。

//◆弱気
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900370sn">
「や、やめろよ……離せ……っ」

口調はいつものぶっきらぼうなものだけど、その声音は明らかに弱気だ。

っていうか泣いてるじゃないか。

こいつも所詮、力じゃ男の僕にはかなわないっていうことだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_じん体_動作_のぞく");
	SoundPlay("SE04", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//◆弱気
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900380sn">
「頼む……こんなこと、やめろ……」

//◆弱気
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900390sn">
「お願い……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900400ta">
「ふひひ……」

笑いをこらえきれなかった。

今、僕はこの女を支配した。

僕はこの女を自由にできる。

ああ、こんな素晴らしい世界があったなんて。

どうして、最初からこうしなかったんだろう。
なにを怯えていたんだろう。

今までの自分がバカみたいだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900410ta">
「ふひひ、たっぷりかわいがってやるよ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//妄想ＯＵＴ
//画面エフェクト//妄想ＯＵＴエフェクト
//ＢＧ//松濤公園

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionOut();

	Delete("セナ倒れ");
	Delete("セナ倒れ２");
	Stand("buセナ_制服_通常","hard", 200, @-50);
	FadeStand("buセナ_制服_通常_hard", 0, true);

	CreateSE("SE01","SE_日常_松濤公園");
	MusicStart("SE01", 2000, 300, 0, 1000, null, true);

	DelusionOut2();
	NegativeHuman();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900420sn">
「――おい、無視するな！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900430ta">
「……！」

我に返ると、僕はセナに馬乗りになっているどころか、相変わらず胸ぐらをつかまれて遊具に押しつけられていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900440ta">
「え……あれ……」

一瞬にして力関係が逆転してしまったことに、軽く混乱する。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900450sn">
「その力のことを誰に教わったんだって聞いているんだ……！」

そんなこと聞かれた覚えはなかった。

もしかしてさっきのは僕の妄想で、そっちに現実逃避していた……のか？

まだ状況が整理できないでいるのに、セナは僕の身体を乱暴に揺すってくる。

{	Stand("buセナ_制服_通常","angry", 200, @-50);
	FadeStand("buセナ_制服_通常_angry", 300, true);
	DeleteStand("buセナ_制服_通常_hard", 0, false);
	CreateSE("SE02","SE_衝撃_肩にぶつかる");
	CreateSE("SE03","SE_じん体_動作_足_蹴る_イス");
	SoundPlay("SE02", 0, 1000, false);
	SoundPlay("SE03", 0, 1000, false);
	Shake("背景１", 200, 5, 5, 0, 0, 300, null, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900460sn">
「誰からだ！　答えろ！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900470sn">
{#TIPS_天成神光会 = true;$TIPS_on_天成神光会 = true;}「<FONT incolor="#88abda" outcolor="BLACK">天成神光会</FONT>とは関係あるのか、ないのか！」

{$TIPS_on_天成神光会 = false;}
な、なんだよその天成なんとかって……。
僕は反射的に首を左右に振っていた。

息が……できない……！
窒息する……気が遠くなる……死ぬ……
もう……ダメだ……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	SoundPlay("SE01",3000,100,true);
	Fade("色１", 0, 0, null, true);
	Fade("色１", 3000, 1000, null, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Wait(200);

	DeleteStand("buセナ_制服_通常_angry", 0, true);

	Fade("色１", 100, 0, null, true);

	CreateSE("SE03","SE_じん体_動作_滑って転ぶ");
	SoundPlay("SE03",0,500,false);
	Shake("背景１", 300, 5, 5, 0, 0, 300, null, false);
	SoundPlay("SE01",3000,300,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
意識を失いそうになったその寸前、セナはいきなり手を離した。僕はその場に倒れ込む。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900480ta">
「うう……げほげほげほっ……！」

咳き込みつつも、必死で空気を吸い込んだ。

さっきの妄想とは正反対の展開に、無性に情けなくなる。

やっぱりセナは敵なの？　こいつも『将軍』の手下？

だとしたら逃げなくちゃ……

{	Stand("buセナ_制服_横向","hard_r", 200, @-50);
	FadeStand("buセナ_制服_横向_hard_r", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900490sn">
「関係ないならいい。悪かった……」

{	DeleteStand("buセナ_制服_横向_hard_r", 500, true);}
僕の困惑顔を見て、セナは軽く舌打ちし、それからため息をついた。
そのまま去っていこうとする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//合流２へ

}


//=============================================================================//

if($妄想トリガー２６ == 0)
{
//☆☆☆
//分岐６

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
セナの荒い鼻息が、僕の頬を撫でる。

今にも噛みつかれそうな勢い。

なんでこの女は……こんなに乱暴で……怖いんだ……っ。

助けて……誰か助けて……

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900500sn">
{#TIPS_天成神光会 = true;$TIPS_on_天成神光会 = true;}「お前は<FONT incolor="#88abda" outcolor="BLACK">天成神光会</FONT>と関係があるのか？」

{$TIPS_on_天成神光会 = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900510ta">
「がはっ……え……？」

てんせい……なに？

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900520sn">
「その力を、誰から教わった！？」

セナの声には、珍しく逼迫したものが含まれている。

でも僕は訳が分からなくて、とにかく何度も何度も首を左右に振り続けるしかない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_衝撃_肩にぶつかる");
	CreateSE("SE03","SE_じん体_動作_足_蹴る_イス");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900530sn">
「あんなの……あり得ない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900540sn">
「ディソードなしでエラーを現実にするなんて」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900550sn">
「お前は、その力のことを誰に教わったんだ」

{	Stand("buセナ_制服_通常","angry", 200, @-50);
	FadeStand("buセナ_制服_通常_angry", 300, true);
	DeleteStand("buセナ_制服_通常_hard", 0, false);
	SoundPlay("SE02", 0, 1000, false);
	SoundPlay("SE03", 0, 1000, false);
	Shake("背景４", 200, 5, 5, 0, 0, 300, null, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900560sn">
「誰からだ！　答えろ！」

力のことなんて……誰にも教えてもらってない……！
でも、強いて言うなら……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900570ta">
「うぐ……ぐ……あ、あやせ……ぐ……」

//◆ブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900580sn">
「…………」

息が……できない……！
窒息する……気が遠くなる……死ぬ……
もう……ダメだ……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	SoundPlay("SE01",3000,100,true);
	Fade("色１", 0, 0, null, true);
	Fade("色１", 3000, 1000, null, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Wait(200);


//ＢＧ//松濤公園

	DeleteStand("buセナ_制服_通常_angry", 0, true);
	CreateSE("SE03","SE_じん体_動作_滑って転ぶ");

	Fade("色１", 100, 0, null, true);

	SoundPlay("SE03",0,500,false);
	Shake("背景１", 300, 5, 5, 0, 0, 300, null, false);
	SoundPlay("SE01",3000,300,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
意識を失いそうになったその寸前、セナはいきなり手を離した。僕はその場に倒れ込む。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900590ta">
「うう……げほげほげほっ……！」

咳き込みつつも、必死で空気を吸い込んだ。

なんなんだよ、いったい……

やっぱりセナは敵なの？　こいつも『将軍』の手下？

だとしたら、逃げなくちゃ……

{	Stand("buセナ_制服_通常","hard", 200, @-50);
	FadeStand("buセナ_制服_通常_hard", 400, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900600sn">
「本当に天成神光会とは関係ないんだな？」

天成神光会ってなんだよぅ……。
そんなの聞いたこともないよ……。

{	Stand("buセナ_制服_横向","hard_r", 200, @-50);
	FadeStand("buセナ_制服_横向_hard_r", 300, false);
	DeleteStand("buセナ_制服_通常_hard", 300, true);}
僕の困惑顔を見て、セナはようやくにらみつけてくるのをやめた。
軽く舌打ちし、それからため息をつく。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900610sn">
「悪かった。関係ないならいい」

{	DeleteStand("buセナ_制服_横向_hard_r", 300, true);}
とても謝っているとは思えない淡々とした口調でつぶやき、そのまま去っていこうとする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//合流２へ

}


//=============================================================================//

//☆☆☆
//合流２


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
どうやら僕を攻撃するつもりはないらしい。
それなら――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900620ta">
「あ、あ、あの……」

勇気を振り絞って、呼び止める。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","hard", 200, @-50);
	FadeStand("buセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601017]
無視されるかと思ったけど、セナは立ち止まり、僕に向き直ってくれた。

表情は厳しいままだけど、話は聞いてくれるらしい。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900630ta">
「ち、ちか、力って……なんな……の……？」

セナは、なにか知っている。

さっきの花壇のことを“お前が作ったんだろう”って言った。

あの場にいた僕以外の全員が、あの花壇を“はじめからそこにあったもの”として認識していた。でもセナは違うみたいだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900640ta">
「さっきの、か、花壇……どうなって……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900650sn">
「お前が妄想したんだろう？」

妄想……。
した、けど……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900660sn">
「妄想は、現実にすることが可能だ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900670sn">
「本当じゃないモノが景色に紛れ込む」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900680sn">
「つまりエラーを現実として認識させる」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//イメージＢＧ//特許登録イメージ１
//フラッシュバックで一瞬表示

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900690ta">
「で、で、でも……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11900700ta">
「視界に、う、映す、だけじゃ……
それって……ま、幻……でしかない……よ」

幻は幻でしかなくて、それはニセモノ。

あの花壇が幻だったなら、あやせが助かるはずはないんだ。

あやせが助かったのは、
幻じゃなくて本物の花壇がそこにあったからで……

{	Stand("buセナ_制服_通常","normal", 200, @-50);
	FadeStand("buセナ_制服_通常_normal", 300, true);
	DeleteStand("buセナ_制服_通常_hard", 0, false);}
//◆「－１」＝「マイナスいち」
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900710sn">
「世界の仕組みは、３つの数字ですべて説明できる。
０と１、そして－１」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900720sn">
「ディソードはその－１を生み出すためのショートカットになる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900730sn">
「だがお前はディソードなしでそれをやった……」

ま、また訳の分からないことを言い始めたぞ。

いや、だけど――
セナの言ってることはただのデンパじゃない。

少なくともＶＲ技術の特許は事実だったし……。
やっぱり、セナは、なにか知ってる……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","hard", 200, @-50);
	FadeStand("buセナ_制服_通常_hard", 300, true);
	DeleteStand("buセナ_制服_通常_normal", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900740sn">
「いいか、これ以上、エラーを作るな」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900750sn">
「それがお前のためだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900760sn">
「それと、他にもエラーを見たら教えろ」

{	DeleteStand("buセナ_制服_通常_hard", 800, true);}
脅迫にも似た言葉を一方的に投げつけてくる。そして僕に背を向けた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/11900770sn">
「目に見えるものだけを信じられることが、どんなに幸せか……」

セナは吐き捨てるようにつぶやき、今度こそその場から去っていった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);

	Wait(2000);


}