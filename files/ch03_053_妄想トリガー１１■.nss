//<continuation number="680">





chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_053_妄想トリガー１１■";
		$GameContiune = 1;
		Reset();
	}

		ch03_053_妄想トリガー１１■();
}


function ch03_053_妄想トリガー１１■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//	WaitKey();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");	
	Stand("buあやせ_制服_通常","normal", 200, @0);
	FadeStand("buあやせ_制服_通常_normal", 0, true);
	Delete("背景２");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐４へ
//ネガティブ妄想→分岐５へ
//妄想しない→分岐６へ


if($妄想トリガー通過１１ == 0)
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
			$妄想トリガー１１ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー１１ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー１１ = 0;
		}
	}
}



//=============================================================================//

if($妄想トリガー１１ == 2)
{
//☆☆☆
//分岐４
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ


	SetVolume360("CH*", 500, 0, null);

	DelusionIn();


	DeleteStand("buあやせ_制服_通常_normal", 0, true);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	Stand("stあやせ_制服_通常","normal", 200, @-100);
	FadeStand("stあやせ_制服_通常_normal", 0, true);

	DelusionIn2();

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE01", 2000, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300010ay">
「私、好きな人がいるのよ」

//◆冗談めかして
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300020mi">
「え？　マジ？　なになに？　それって俺のこと～？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300030ay">
「そこの人」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300040mi">
「そこ？」

そこ……？

そこって？

ＦＥＳはどこかを指差したりすることはしなかった。
ただ、僕を見ていた。僕だけを、見ていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05300050ta">
「えっと……？」

{	SoundPlay("SE01", 0, 0, false);}
もしかして、僕が、ＦＥＳの好きな人！？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_はいけい_教室ざわめき_LOOP");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300060ay">
「この前、ライブに来てたわね」

{	SoundPlay("SE02", 100, 500, false);}
ＦＥＳが僕の方へと歩み寄ってくる。
相変わらず視線はそらさない。

周囲が、ざわめき始めた。
みんな、渋谷のカリスマ歌姫であるＦＥＳの思いもよらない告白に聞き耳を立てていたらしい。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300070mi">
「いや、あの～、俺もライブに行って――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300080ay">
「一目で、悟ったわ」

{	DeleteStand("stあやせ_制服_通常_normal", 200, true);
	Stand("buあやせ_制服_通常","normal", 200, @-100);
	FadeStand("buあやせ_制服_通常_normal", 300, true);}
ＦＥＳは三住くんの言葉を聞いていなかった。
僕の制服のネクタイを片手でつかみ、引き寄せる。
彼女の息づかいがはっきり感じ取れるくらいの距離。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//周囲からのどよめき
	SoundPlay("SE01", 100, 800, true);
	CreateSE("SE02","SE_はいけい_教室ざわめき_LOOP");
	SoundPlay("SE02", 100, 700, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
これは“親しい仲”程度の間柄でできる距離じゃない。“家族”でも難しい。そう、“恋人”の距離だ。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300090ay">
「キミが、私の運命の人だって」

ＦＥＳはニコリともせずに、僕の頬を指先でスーッと撫でた。
その艶やかな仕草に、僕はゾクリとした。
魅入られる。ＦＥＳに。目をそらせない。

{	SoundPlay("SE01", 1000, 0, false);
	SoundPlay("SE02", 1000, 0, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300100ay">
「決めたわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300110ay">
「私、キミの――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300120ay">
「お嫁さんになる」

//ＳＥ//おおきなざわめき
{	BGMPlay360("CH11",0,1000,true);
	CreateSE("SE01","SE_日常_歓声_LOOP");
	SoundPlay("SE01", 500, 1000, true);}
その宣言は、ＦＥＳの身に纏うアンニュイで退廃的な雰囲気とはかけ離れたものだったけど、逆にそのギャップがたまらなくかわいかった。

周囲は事実上のＦＥＳの婚約宣言に色めきだち、
三住くんなどは僕に“負けた”ことの悔しさのあまり、
その場にがっくりと膝を突いてしまっている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05300130ta">
「あ、あの……ぼ、ぼ、僕の意見は……無視……ですか？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300140ay">
「イヤなの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05300150ta">
「…………イヤ、じゃない……です」

なんだか流されちゃってるような気もするけど。
こんなキレイな子と婚約できるなら、それだけで人生勝ち組だよ。

こうして、僕とＦＥＳの、ドキドキな恋物語は始まったんだ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	SoundPlay("SE*", 0, 0, false);
	SetVolume360("CH*", 500, 0, null);

	DelusionOut();

	DeleteStand("buあやせ_制服_通常_normal", 200, true);

	DelusionOut2();
	PositiveHuman();

	CreateSE("SE02","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE02", 1000, 500, true);

	Wait(1000);

//ＢＧ//翠明学園廊下

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
……始まるわけないだろ。

下らない妄想をしている間に、ＦＥＳはなにやら小声でつぶやいて、さっさといなくなってしまっていた。


{	Stand("bu大輔_制服_通常","sigh", 200, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 300, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300160mi">
「自信なくすぜ……くそぅ」

完全無視された三住くんが、ふてくされている。

{#TIPS_百合属性 = true;$TIPS_on_百合属性 = true;}
彼ほどのイケメンの誘いをあそこまで華麗にスルーするっていうことは、ＦＥＳはもしかすると<FONT incolor="#88abda" outcolor="BLACK">百合属性</FONT>なのかもしれない。

{$TIPS_on_百合属性 = false;}
//◆スール＝フランス語で「姉妹」。『マリア様がみてる』より
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05300170ta">
「……そ、それは……すごく、いいスールです。ふひひ」

相手は七海みたいなロリキャラが最適だな。うんうん。

{	Stand("bu大輔_制服_通常","worry", 200, @+100);
	FadeStand("bu大輔_制服_通常_worry", 300, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300180mi">
「あんな無愛想な女、もう二度と相手にしてやるもんかよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300190mi">
「あー、ウゼー……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300200mi">
「だいたい、なにが剣を見つけろだ、訳分かんね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05300210ta">
「……剣？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300220mi">
「ああ、岸本がそう言ってただろ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300230mi">
「剣を見つけろ、そうすれば救われる、って」

救われる……。

{	Stand("bu大輔_制服_通常","sigh", 200, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 300, false);
	DeleteStand("bu大輔_制服_通常_worry", 500, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300240mi">
「なあタク、ファンタズムの歌にそんな歌詞でもあるのか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05300250ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_sigh", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
剣……。

それってもしかして、ライブのときに使っていたあのマイクスタンドみたいな物のことだろうか。

そう言えばつい２日前にも、
まったく別の人物から“剣”について詰問されたっけ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//合流３へ

}


//=============================================================================//

if($妄想トリガー１１ == 1)
{

//☆☆☆
//分岐５
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume360("CH*", 500, 0, null);

	DelusionIn();

	BoxDelete(0);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Stand("buあやせ_制服_通常","normal", 200, @0);
	FadeStand("buあやせ_制服_通常_normal", 0, true);
	Delete("背景１");

	DelusionIn2();

	Wait(1000);

	CreateSE("SE02","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE02", 2000, 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆呼びかける
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300260ay">
「そこのキミ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05300270ta">
「は、はい……っ」

呼びかけられて、僕は直立不動で返事をしてしまった。

浮世離れした雰囲気を全身から放っているから、どうしても年上に思えてしまう。でもよく考えたら、同級生なんだよな……。

ＦＥＳは、付きまとう三住くんの方を、顎でしゃくるようにして指し示した。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300280ay">
「付き合わない方がいいわよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300290ay">
「こんな人とは」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buあやせ_制服_通常_normal", 500, true);
	Wait(500);
	Stand("st大輔_制服_通常","pride", 200, @150);
	Move("st大輔_制服_通常_pride", 0, @0, @50, null, true);
	FadeStand("st大輔_制服_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//◆冗談めかして
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300300mi">
「おいおい、こんな人呼ばわりはひどくね？　っていうか、こんな人ってどんな人だよぉ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300310ay">
{	Stand("stあやせ_制服_通常","hard", 210, @-150);
	Move("stあやせ_制服_通常_hard", 0, @0, @50, null, true);
	FadeStand("stあやせ_制服_通常_hard", 300, false);}
「……鬱陶しい人」

{	Stand("st大輔_制服_通常","worry", 200, @150);
	Move("st大輔_制服_通常_worry", 0, @0, @50, null, true);
	FadeStand("st大輔_制服_通常_worry", 300, false);
	DeleteStand("st大輔_制服_通常_pride", 300, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300320mi">
「はあ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SoundPlay("SE02", 2000, 0, false);
	BGMPlay360("CH01",1000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
うわあ……。

三住くんがあからさまに不機嫌になった。
でもＦＥＳはそんな彼の鋭い眼光を、興味なさげに受け流してしまっている。

なんという険悪な雰囲気。

ぼ、僕、関わり合いになりたくないな……。

口ゲンカも暴力的なケンカも苦手だし、学校で問題起こしたら内申点にも響くし……。

巻き込まれないように、さっさと退散しようかな――

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300330mi">
「なに？　もしかして岸本さんさぁ、俺のことバカにしてる？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300340ay">
「別に」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300350ay">
「でも、迷惑よ」

{	Stand("st大輔_制服_通常","pride", 200, @150);
	Move("st大輔_制服_通常_pride", 0, @0, @50, null, true);
	FadeStand("st大輔_制服_通常_pride", 300, false);
	DeleteStand("st大輔_制服_通常_worry", 300, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300360mi">
「ふーん、あ、そーなんだぁ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300370mi">
「そういうこと言うんだ、岸本さんって」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300380mi">
「ちょっとさあ、人のいないところで２人でゆっくり話そうぜ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	DeleteStand("st大輔_制服_通常_pride", 500, false);
	DeleteStand("stあやせ_制服_通常_hard", 500, false);
	CreateSE("SE02","SE_衝撃_せ中を押される");
	SoundPlay("SE02", 0, 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
三住くんが、怒りで笑みを引きつらせながら、ＦＥＳの肩に手をかける。
ＦＥＳの眉が、ぴくりと動いた。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300390ay">
「……触らないで」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300400mi">
「そう言うなって。いいからちょっと付き合ってよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300410ay">
「……触らないで、って言ってるの」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300420mi">
「うっせえな、付いてこいって言ってんだよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300430ay">
「…………」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300440ay">
「バカな人」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 500, 0, null);

	Wait(500);

//イメージＢＧ//剣の軌跡
	CreateSE("SE02","SE_擬音_ディそーど_空を切る1");
	SoundPlay("SE02", 0, 1000, false);
	CreateColor("色１", 100, 0, 0, 1280, 720, "White");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 50, 1000, null, true);
	Fade("色１", 1000, 0, null, false);

//ＳＥ//剣が空を切る

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
それは、一瞬の出来事だった。

一部始終を見ていた僕でさえも、なにが起こったのかよく理解できなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//肉を斬る音
//ＳＥ//血が噴き出る
	CreateSE("SE02","SE_擬音_ディそーど_人を切る");
	CreateSE("SE03","SE_じん体_血_噴きでる_包丁でさされ");
	CreateColor("色１", 500, 0, 0, 1280, 720, "Red");
	Fade("色１", 0, 0, null, true);

	CreateMovie360("斬撃", 200, Center, Middle, false, false, "dx/mv軌跡02.avi");	

	SoundPlay("SE02", 0, 1000, false);
	Wait(1000);
	SoundPlay("SE03", 0, 1000, false);

	Fade("色１", 0, 1000, null, true);
	DrawTransition("色１", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);
	Delete("斬撃");

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg019_02_1_学校廊下_a.jpg");
	Fade("色１", 2000, 0, null, true);
	Delete("背景１");

//ＢＧ//翠明学園廊下

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
いつの間にか、ＦＥＳの手にはあのかっこいいマイクスタンド――あるいは剣――が握られていたんだ。

どこから取り出したのかは分からない。
でもＦＥＳは、それを軽々と閃かせていた。

そして――

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300450mi">
「う、ぎゃあああああ！？」

{	BGMPlay360("CH06",1000,1000,true);}
三住くんの左手が、肘のところでバッサリと断ち切られていた。血が大量に噴き出し、斬られた手の方は床に転がっていた。
廊下が、赤く染まっていく。

見えなかった。

なにも、見えなかった。

ＦＥＳが剣を取り出したところも。
ＦＥＳが振るった剣の軌跡も。

三住くんの腕が斬られたところも。

すべては、まばたきをするくらいの間に起きていた。
気が付いたときには、すべてが終わっていた。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300460mi">
「あ、がああああああああっ！」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300470mi">
「手が……！　俺っ、俺のっ、腕、ううう、腕がぁぁぁっ！」

三住くんはその場に倒れ込み、
床に落ちている自分の手を拾い上げて必死にくっつけようとしている。

彼の悲鳴が廊下に響き渡る。

{	CreateSE("SE02","SE_はいけい_生と_悲鳴とどよめき_2");
	SoundPlay("SE02", 1000, 500, false);}
周囲の生徒たちは悲鳴を上げて逃げ惑う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Fade("色１", 0, 1000, null, true);
	CreateTexture360("背景３", 100, 0, 0, "cg/ev/ev028_01_0_あやせライブ三住切る_a.jpg");

	Fade("色１", 3000, 0, null, true);
	Delete("背景２");
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
ＦＥＳは――

剣を持ったまま、悠然と周囲のパニックを眺めていた。

そして再び、僕を見た。

赤い舌で、自身の唇をゆっくりと舐めながら、
頬を桃色に染めて、微笑んだんだ。

{	SoundPlay("SE02", 500, 0, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300480ay">
「キモチイイ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	SoundPlay("SE*", 0, 0, false);
	SetVolume360("CH*", 500, 0, null);

	DelusionOut();

	Delete("背景３");
	Fade("色１", 0, 0, null, true);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");	

	DelusionOut2();
	NegativeHuman();

	CreateSE("SE02","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE02", 1000, 500, true);

	Wait(1000);

//ＢＧ//翠明学園廊下

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
……そんな修羅場が展開されることもなく。

下らない妄想をしている間に、ＦＥＳはなにやら小声でつぶやいて、さっさといなくなってしまった。

{	Stand("bu大輔_制服_通常","sigh", 200, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 300, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300490mi">
「自信なくすぜ……くそぅ」

完全無視された三住くんが、ふてくされている。

{#TIPS_百合属性 = true;$TIPS_on_百合属性 = true;}
彼ほどのイケメンの誘いをあそこまで華麗にスルーするっていうことは、ＦＥＳはもしかすると<FONT incolor="#88abda" outcolor="BLACK">百合属性</FONT>なのかもしれない。

{$TIPS_on_百合属性 = false;}
//◆スール＝フランス語で「姉妹」。『マリア様がみてる』より
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05300500ta">
「……そ、それは……すごく、いいスールです。ふひひ」

相手は七海みたいなロリキャラが最適だな。うんうん。

{	Stand("bu大輔_制服_通常","worry", 200, @+100);
	FadeStand("bu大輔_制服_通常_worry", 300, false);
	DeleteStand("bu大輔_制服_通常_sigh", 500, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300510mi">
「あんな無愛想な女、もう二度と相手にしてやるもんかよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300520mi">
「あー、ウゼー……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300530mi">
「だいたい、なにが剣を見つけろだ、訳分かんね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05300540ta">
「……剣？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300550mi">
「ああ、岸本がそう言ってただろ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300560mi">
「剣を見つけろ、そうすれば救われる、って」

救われる……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","sigh", 200, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 300, false);
	DeleteStand("bu大輔_制服_通常_worry", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300570mi">
「なあタク、ファンタズムの歌にそんな歌詞でもあるのか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05300580ta">
「…………」

{	DeleteStand("bu大輔_制服_通常_sigh", 500, false);}
剣……。

それって、さっき僕も妄想していた、あのマイクスタンドか剣なのか分からない代物のことだろうか。

そう言えばつい２日前にも、
まったく別の人物から“剣”について詰問されたっけ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//合流３へ


}


//=============================================================================//

if($妄想トリガー１１ == 0)
{

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE01", 2000, 500, true);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	DeleteStand("buあやせ_制服_通常_normal", 300, true);

//☆☆☆
//分岐６
//フラグ【３章あやせ妄想しない分岐】ＯＮ
	$３章あやせ妄想しない分岐 = true;


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
僕は当然のごとく、目をそらした。
だからＦＥＳと視線を交わしたのは、ほんの一瞬だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_制服_通常","normal", 200, @-100);
	FadeStand("stあやせ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300590ay">
「見つけて。早く。剣を」

急に、ＦＥＳが声を発する。

あまり覇気を感じさせない、淡々とした口調。
その言葉が、僕か、三住くんか、どちらに向かって発せられたものなのか、よく分からなかった。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300600mi">
「剣……って？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05300610ay">
「そうすれば、キミは救われるわ」

{	DeleteStand("stあやせ_制服_通常_normal", 500, true);}
ＦＥＳは一方的につぶやくと、さっきのように目を伏せてまた歩き出した。

そして僕の横をすり抜けて、Ｄ組に入っていった。
僕も三住くんも、困惑したままそれを見送った。

{	Stand("bu大輔_制服_通常","sigh", 200, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 300, false);}
//◆ふてくされてる
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300620mi">
「……なあ、タク」

三住くんは明らかにふてくされている。

結局彼はあんなに努力したにもかかわらず、ＦＥＳからまったく相手にされなかった。存在そのものを無視されるっていうのは、けっこうキツいかもしれない。

僕は……そういう扱いをされることには慣れてるけど。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300630mi">
「俺はここまでプライドをズタズタにされたのは初めてだ……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300640mi">
「自信なくすぜ……くそぅ」

{	Stand("bu大輔_制服_通常","worry", 200, @+100);
	FadeStand("bu大輔_制服_通常_worry", 300, false);
	DeleteStand("bu大輔_制服_通常_sigh", 500, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300650mi">
「ちょっと有名人だからって調子乗りやがって」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300660mi">
「あんな無愛想な女、もう二度と相手にしてやるもんかよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300670mi">
「あー、ウゼー……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05300680mi">
「だいたい、なにが剣を見つけろだ、訳分かんね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
剣……。

それってもしかして、ライブのときに使っていたあのマイクスタンドみたいな物のことだろうか。

そう言えばつい２日前にも、
まったく別の人物から“剣”について詰問されたっけ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//合流３へ

}

//=============================================================================//

//☆☆☆
//合流３

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 200, 1000, null, true);
	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev027_01_3_見下ろしセナ_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, false);

	SoundPlay("SE01", 2000, 100, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
セナ、とかいうあの女……すごく怖かった。

本気で斬りつけられるかと思った。

あの女が持っていた剣も、形は違うけど、ＦＥＳがライブで持っていた物と雰囲気は似ていた。
なにか、両者には関係があるんだろうか……。

分からない……。
分からないことだらけだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);
	Fade("回想フラッシュ", 500, 1000, null, true);
	Delete("回想明度");
	Delete("背景１");
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	Fade("回想フラッシュ", 1000, 0, null, true);
	Delete("回想フラッシュ");

	Wait(500);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１３", 100, center, middle, Auto, Auto, "・将軍");
	Move("テキスト１３", 0, @-8, @-72, null, false);
	SetBacklog("・将軍", "NULL", NULL);
	Request("テキスト１３", NoLog);
	Request("テキスト１３", Erase);
	Request("テキスト１３", Enter);
	WaitAction("テキスト１３", null);

	Wait(1000);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１４", 100, center, middle, Auto, Auto, "・悪魔女");
	Move("テキスト１４", 0, @0, @-43, null, false);
	SetBacklog("・悪魔女", "NULL", NULL);
	Request("テキスト１４", NoLog);
	Request("テキスト１４", Erase);
	Request("テキスト１４", Enter);
	WaitAction("テキスト１４", null);

	Wait(1000);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１５", 100, center, middle, Auto, Auto, "・優愛");
	Move("テキスト１５", 0, @-8, @-14, null, true);
	SetBacklog("・優愛", "NULL", NULL);
	Request("テキスト１５", NoLog);
	Request("テキスト１５", Erase);
	Request("テキスト１５", Enter);
	WaitAction("テキスト１５", null);

	Wait(1000);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１６", 100, center, middle, Auto, Auto, "・ＦＥＳ");
	Move("テキスト１６", 0, @0, @14, null, false);
	SetBacklog("・ＦＥＳ", "NULL", NULL);
	Request("テキスト１６", NoLog);
	Request("テキスト１６", Erase);
	Request("テキスト１６", Enter);
	WaitAction("テキスト１６", null);

	Wait(1000);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１７", 100, center, middle, Auto, Auto, "・セナ");
	Move("テキスト１７", 0, @-8, @43, null, false);
	SetBacklog("・セナ", "NULL", NULL);
	Request("テキスト１７", NoLog);
	Request("テキスト１７", Erase);
	Request("テキスト１７", Enter);
	WaitAction("テキスト１７", null);

	Wait(1000);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１８", 100, center, middle, Auto, Auto, "・剣");
	Move("テキスト１８", 0, @-16, @72, null, true);
	SetBacklog("・剣", "NULL", NULL);
	Request("テキスト１８", NoLog);
	Request("テキスト１８", Erase);
	Request("テキスト１８", Enter);
	WaitAction("テキスト１８", null);

	Wait(3000);


	FadeDelete("テキスト１３", 1000, false);
	FadeDelete("テキスト１４", 1000, false);
	FadeDelete("テキスト１５", 1000, false);
	FadeDelete("テキスト１６", 1000, false);
	FadeDelete("テキスト１７", 1000, false);
	FadeDelete("テキスト１８", 1000, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601016]
いつもの癖で、“分からないこと”について頭の中で箇条書きにしてまとめてみる。

最後にもうひとつ“自分自身”と付け加えようと思ったけどやめた。
僕はまともだ。まわりが異常なんだ。そうに決まってる。

{	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Fade("背景１", 1000, 1000, null, true);
	SoundPlay("SE01", 2000, 500, true);
	Fade("色１", 0, 0, null, true);}
ＦＥＳは、僕の味方なんだろうか、敵なんだろうか。
それだけでも分かればいいんだけど。
でも彼女に話しかける勇気なんて、僕にはない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

	SetVolume360("CH*", 2000, 0, null);
	MusicStart("SE*",2000,0,0,0,null,false);

	ClearAll(2000);

	Wait(3000);


//～～Ｆ・Ｏ

}