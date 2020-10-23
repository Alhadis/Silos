//<continuation number="120">

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_162_あやせ編_相克世界";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_162_あやせ編_相克世界();
}


function cha_162_あやせ編_相克世界()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編
//ＢＧ//おどろおどろしいイメージ
//あやせが見ている世界です

	Wait(1500);

	CreateColor("黒幕", 1000, 0, 0, 1280, 720, "Black");
	Fade("黒幕", 0, 1000, null, true);

	CreateTexture360("おど２", 600, 0, 0, "cg/bg/bg207_01_6_おどろおどろしいイメージ_a.jpg");
	CreateTexture360("赤い空", 500, 0, 0, "cg/bg/bg216_01_6_chn赤い空_a.jpg");
	Request("おど２", Smoothing);
	Request("おど２", MulRender);
	Zoom("おど２", 100000, 2000, 2000, Dxl2, false);
	Fade("おど２", 0, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
これは夢――？

{	FadeDelete("黒幕", 2000, false);}
空が赤い。さっきまで白かったのに。

世界そのものが、錆びて、赤く変色している。

きっと夢だ。いつもと同じ、僕の妄想だ。そう思うことにする。

ところどころに、黒い靄が見える。

人の形をしているような気がする。
錯視。だけど妙に生々しく見える。
それはゆらゆらと不規則に揺れていて。

やがてふっと消えたかと思うと、また別の場所に現れる。

そんな黒い靄が、いくつも、ある。

見ているだけで、不快な気分になった。

強烈な腐臭がする。吐きそうになった。

こんなところには、１秒たりともいたくない。

強く、そう思った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

//～～Ｆ・Ｏ

//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 2000, 1000, null, true);
	CreateTexture360("back01", 600, 0, 0, "cg/bg/bg209_01_5_曇り空_a.jpg");
	CreateColor("フラッシュ",900, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 300, null, true);
	Request("フラッシュ", AddRender);

	Delete("おど");
	Delete("おど２");
	Delete("赤い空");
	Wait(1000);

	Fade("Black", 1000, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
僕が意識を取り戻したときには、空は明るくなっていて、渋谷は死の街と化していた。

ＡＨ病院は倒壊こそ免れたけど、ところどころの壁に大きな亀裂が走っていたし、病院内はしっちゃかめっちゃかだった。

外来棟の入り口には、救急車と、徒歩で来た怪我人が溢れ、我先に医師の診察を受けさせろと押し合いへし合いしていた。

僕が目覚めるとあやせは微笑みを浮かべ、「渋谷に戻るのよ」と言った。時間を聞くと朝の６時少し前で、つまり僕は１０時間近く気を失っていたことになる。

優愛の姿は見当たらなくて、あやせに聞いても分からないとしか答えてもらえなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("Black", 1000, 1000, null, true);

//ＢＧ//１０９・崩壊後・昼
	CreateSE("SE01","SE_はいけい_崩壊しぶ谷_107前_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	CreateSE("SE02","SE_はいけい_瓦礫_踏む足音_LOOP");
	MusicStart("SE02", 2000, 700, 0, 1000, null, true);

	CreateColor("Black02", 90, 0, 0, 1280, 720, "Black");
	Delete("Black");
	Delete("フラッシュ");
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg001_02_5_崩壊渋谷_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	Delete("Black02");

	Wait(1000);

	Move("back01", 6000, @0, @-800, DxlAuto, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
代々木から渋谷までは、電車なら５分もかからない。

だけど地震の余波で公共交通機関は完全に止まっていた。
線路はズタズタになっていて、今日中に復旧するのは無理だろう。

やむなく歩くことにしたわけだけど、道のあちこちがひび割れたり陥没したり、ビルの巨大な瓦礫が道を塞いでいたりして、まっすぐ歩くことすら困難だった。

だから、渋谷の駅前にたどり着く頃には、３時間近くが経っていた。

駅周辺もひどいことになっていて、ビルのほとんどが倒壊していた。

あちこちに、数え切れないほどの死体が転がっている。
しかもどれも、目を背けたくなるような悲惨なものばかりだ。

まだ動いている人たちもいる。僕らみたいに、呆然とした顔で歩いている人もいるし、瓦礫の傍らにうずくまって助けを待っている人たちもいる。

中には、死体にすがりついて泣いている人なんかもいた。

生きている人間は誰１人としてその目に精気はなかった。あまりのショックに、すべての気力を奪われたって感じだ。

強い血の匂いと、埃の匂いと、すえたような腐臭が充満し、耐えがたい環境と化していた。

これもグラジオールによる仕業なんだろうか。
もしそうだとしたら、グラジオールは地震だっていうこと？

アメリカだと、ハリケーンに人の名前が付けられる。
アンドリューとかカトリーナとか。

これが、あやせの望んだ結末なの？
終末思想としては、理想的な展開かもしれない。

だけど、いくらあやせがギガロマニアックス――あやせが言うところの“黒騎士”か――だとしても、こんなすさまじい地震をたった１人で起こすことが可能なんだろうか。

世界が融解して連結されるって、あやせは言っていたけど、それにはどういう意味が込められている？

僕の少し前を歩くあやせの横顔を、そっとうかがってみた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_制服_通常","hard", 250, @-50);
	FadeStand("stあやせ_制服_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
さすがのあやせも、この渋谷の惨状に顔色を蒼白にさせている。
辛さに耐えるかのように唇を噛み、黙々と歩いていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 2000, 0, null);
	DeleteStand("stあやせ_制服_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100010d1">
「おいみんな！　ここは危ないから、避難場所へ行こう！」

そう叫んでいるのは、スーツを着た中年の男だ。
周囲には僕らも含めて、生き延びることができた人間がかなりの数、残っている。そうした人たちに呼びかけているようだった。

//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100020d1">
「救助を待ってたら、日が暮れてしまう！　避難場所まで行けば、きっとなんとかなる！　ここにとどまっているよりずっとマシだ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100030d1">
「辛いかもしれないが、立って、歩こうじゃないか！　俺たちには、亡くなった人たちの分まで、生きなくちゃならない使命があるんだ！」

ずいぶん元気なおっさんだな、と思った。

何人かはその訴えに賛同して、おっさんの方へのろのろと歩み寄っていく。でもほとんどの人は、動こうとしなかった。

あやせは目もくれようとしない。
その足取りはどこかを目指しているかのようだった。
だから僕も付いていくしかない。

ズキリ、と刺すような痛みがこめかみに走った。
代々木からここまで歩いてくる途中、何度か襲われた痛みだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100040d1">
「頼むよ、みんな！　立ってくれ！　どうして分からないんだ、ここは危ないんだって！　瓦礫の下敷きになったらどうするんだ！」

//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100050d1">
「俺は、みんなに生きていてほしいんだよ！」

頭が……痛い……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, null);

//ＳＥ//衝撃音
//ＢＧ//おどろおどろしいイメージ

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE02","SE_日常_けい帯_のいず");
	CreateSE("SEおど","SE_衝撃_衝撃音02");
	CreateSE("SE04","SE_はいけい_自動小じゅう");

	CreateColor("Red", 1000, 0, 0, 1280, 720, "Red");
	Fade("Red", 0, 0, null, true);
	Request("Red", AddRender);

	CreateColor("Black", 5000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);

	CreateTextureEX("赤い空", 200, 0, 0, "cg/bg/bg216_01_6_chn赤い空_a.jpg");
	CreateTextureEX("おど", 600, 0, 0, "cg/bg/bg207_01_6_おどろおどろしいイメージ_a.jpg");
	Request("おど", MulRender);


//おがみ：ビデオロック
	XBOX360_LockVideo(false);


	CreateMovie360("砂嵐", 500, Center, Middle, true, false, "dx/mv砂嵐.avi");	


	MusicStart("SE02",0,1000,0,1000,null,false);
	Fade("砂嵐", 0, 1000, null, true);
	Wait(200);
	SetVolume("SE02", 0, 1, null);
	Fade("砂嵐", 0, 0, null, true);
	Wait(200);
	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);

	Fade("Red", 200, 1000, null, true);
	Fade("おど", 0, 500, null, true);

	MusicStart("SEおど", 0, 700, 0, 1000, null, false);

//	Wait(200);
	SetVolume("SE02", 1000, 0, null);
	FadeDelete("Red", 1000, false);
	Fade("砂嵐", 0, 200, null, true);
	Wait(1000);

	BGMPlay360("CH26", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
な、なんだ……っ！？

いきなり、世界が赤く染まった。

{	Fade("赤い空", 300, 1000, null, true);}
空を見上げれば、赤銅色の雲。

夢で見た光景。

アスファルトの路面も、コンクリートの瓦礫も、あらゆる建物も、地面に散乱しているガラスも、壊れて放置されている車も、幹から折れてしまっている街路樹も、錆に覆われていて。

{	Fade("赤い空", 300, 0, null, true);
	Delete("赤い空");}
//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100060d1">
「あひひひひひ！」

常軌を逸した笑い声が辺りに響く。
さっき、みんなに避難をうながしていた男だった。

その身体の周囲に、黒い靄のようなものがまとわりついている。

いや、その男だけじゃない。
死体以外の、この場にいるすべての人の身体からも、同じような靄が出ていた。

その靄は人と同じくらいの大きさ。
ゆらゆらと揺れている。
妙に生々しくて。おぞましさを覚えた。

これも、夢で見たのと同じだ……。

//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100070d1">
「あひ、ひひ、ひひひひ！」

男の笑い声に、イライラしてくる。
視線をそいつに戻すと、なぜかそいつは、手に――

アサルトライフルを構えていた。

//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100080d1">
「今なら警察いないから殺し放題じゃないか！　あははははは！」

//ＳＥ//自動小銃の乱射
{	MusicStart("SE04", 0, 700, 0, 1000, null, false);}
その銃を、男は唐突に乱射した。

//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100090d1">
「あひひひひ！　うひひひひ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//▼べー：ムービー：停止位置調整
	Fade("Black", 200, 1000, null, true);
	Fade("おど", 0, 0, null, true);
	Fade("砂嵐", 0, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3061005]
とっさに身を伏せる。

撃たれた――

そう思った。間違いなく僕は銃弾に当たる場所にいた。

でも痛みは襲ってこなくて。
恐る恐る顔を上げると。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back01", 100, 0, -800, "cg/bg/bg001_02_5_崩壊渋谷_a.jpg");

	FadeDelete("Black", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100100d1">
「避難場所に行けば水や食料、それに毛布もある！　ここにとどまっていても意味はないんだ！」

男は銃なんて持ってなくて、また周囲の人々に訴えかけていた。

//◆「無駄死にするな」と言おうとしていたが途中で不自然に途切れる
//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100110d1">
「さあ、生きる気力を持とう！　無駄死に――」

異変は唐突だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("Red", 1000, 0, 0, 1280, 720, "Red");
	Fade("Red", 0, 0, null, true);
	Request("Red", AddRender);

	CreateSE("SE02","SE_日常_けい帯_のいず");
	CreateSE("SEおど","SE_衝撃_衝撃音02");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//ＳＥ//衝撃音
//ＢＧ//おどろおどろしいイメージ
	MusicStart("SE02",0,1000,0,1000,null,false);
	Fade("砂嵐", 0, 1000, null, true);
	Wait(200);
	SetVolume("SE02", 0, 1, null);
	Fade("砂嵐", 0, 0, null, true);
	Wait(200);
	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);


	Fade("Red", 200, 1000, null, true);
	Fade("おど", 0, 500, null, true);


//	Delete("back01");
	MusicStart("SEおど", 0, 700, 0, 1000, null, false);

//	Wait(200);
	SetVolume("SE02", 1000, 0, null);
	Fade("おど", 0, 500, null, true);
	FadeDelete("Red", 1000, false);
	Fade("砂嵐", 1000, 200, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
拳を握りしめて声を張り上げていた男の姿が、急にノイズに覆われて、一瞬後には自動小銃を構えていた。

それは人間の動きじゃなかった。
動作として連続していなくて、まったくリアルじゃない。

まるでぶつ切りに編集された映像を見ているようだった。

//【男性被災者Ａ】
<voice name="男性被災者Ａ" class="男性被災者Ａ" src="voice/chn05/01100120d1">
「あひひひひひ！」

//ＳＥ//自動小銃の乱射
{	CreateSE("SE04","SE_はいけい_自動小じゅう");
	MusicStart("SE04", 0, 700, 0, 1000, null, false);}
またも男はその銃を乱射。
周囲の人々が撃たれ、血を噴き出して倒れていく。
悲鳴がこだまする。

でも、銃弾はなぜか僕には当たらない。
映画でも見ている気分になる。
リアルじゃない。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01200010ay">
「拓巳？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＢＧ//１０９・崩壊後・昼
	SetVolume360("CH*", 2000, 0, NULL);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SEおど","SE_衝撃_衝撃音01");
	MusicStart("SEおど", 0, 700, 0, 1000, null, false);

	CreateColor("White", 1000, 0, 0, 1280, 720, "White");
	Request("White", AddRender);
	Fade("White", 0, 0, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("White", 200, 1000, null, true);

	Delete("おど");
	Delete("砂嵐");

	CreateTexture360("back01", 100, 0, -800, "cg/bg/bg001_02_5_崩壊渋谷_a.jpg");
	Stand("stあやせ_制服_通常","hard", 250, @-80);
	FadeStand("stあやせ_制服_通常_hard", 0, true);

	CreateSE("SE01","SE_はいけい_崩壊しぶ谷_107前_LOOP");

	Wait(500);

	FadeDelete("White", 2000, true);

	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);


	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
呼びかけられて、我に返った。

あやせが、僕をじっと見つめている。
なにか言いたそうな表情をしていた。
でもなにも言わず、僕に背を向け、また歩き出す。

{	DeleteStand("stあやせ_制服_通常_hard", 500, true);
	Move("back01", 3000, @0, @+800, AxlDxl, false);}
空を見上げてみた。
曇り空。でも赤くない。

周囲の光景も、鈍色に支配されている。
決して、赤錆びた色はしていない。

銃を乱射した男は今も人々に避難場所へ行くよう訴えているし、さっき撃たれた人たちは無傷だ。誰の身体からも、黒い靄なんて出ていなかった。

今のは、なんだったんだ？
いつもの、妄想？

だとしたら、僕の妄想力も落ちたものだよ。
今の妄想は、ちっともリアルじゃなかった。
映画かゲームみたいだった。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01200020ay">
「拓巳。早く来て」

あやせが僕を急かす。
彼女はいったいどこに向かってるんだろう。
あの男が言ってるみたいに、避難場所に行くつもりなのかな？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_はいけい_瓦礫_踏む足音_LOOP");
	MusicStart("SE02", 2000, 700, 0, 1000, null, true);

//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
でもあやせが向かったのは避難場所なんかじゃなかった。
なにを思ったのか、井乃頭線の駅に入っていったんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE*", 1500, 0, null);

	ClearAll(1500);
	Wait(100);
}




