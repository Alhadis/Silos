

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_156_あやせ編_血塗られた黒騎士";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_156_あやせ編_血塗られた黒騎士();
}


function cha_156_あやせ編_血塗られた黒騎士()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編
//※※３６０以下
//以下からあやせ編専用シナリオです

	PrintBG(1000);

//ＢＧ//ＡＨ廊下//夕方
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg099_01_2_AH廊下_a.jpg");
	DrawTransition("back01", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);


	CreateSE("SE3601","SE_はいけい_びょういん_LOOP");
	MusicStart("SE3601", 3000, 300, 0, 1000, null, true);

	Stand("bu大輔_制服_通常","pride", 250, @+180);
	FadeStand("bu大輔_制服_通常_pride", 500, true);




//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【三住】
<voice name="三住" class="三住" src="voice/chn05/00700090mi">
「なあ、この前話したよな。女をオトすのに一番簡単な方法」

廊下を歩きながら、三住くんはニヤニヤしてそんなことを言った。
それって、病院に来て話すべき内容じゃないよな、常識的に考えて。

ええと、その方法って確か、“弱ってるときに優しくしてやること”だっけ

//【三住】
<voice name="三住" class="三住" src="voice/chn05/00700100mi">
「俺は今日こそ、あの難攻不落の岸本をオトしてみせるぜ！」

//【拓巳】
//（voice name="拓巳" class="拓巳" src="voice/chn05/00700110ta"）
//「も、もしかして、あやせの、お、お見舞いに来たのって……」
//【三住】
//（voice name="三住" class="三住" src="voice/chn05/00700120mi"）
//「ああ。あの難攻不落の岸本を、俺はオトしてみせるぜ」
ぐっと親指を立てて、白い歯を見せ笑う三住くん。
すごく爽やかだけど、言っていることは最低だ。
それでも許されてしまうんだからイケメンはいいよな……。

//【三住】
<voice name="三住" class="三住" src="voice/chn05/00700130mi">
「で、だ。お前って岸本と仲いいだろ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700140ta">
「べ、別に……」

//【三住】
<voice name="三住" class="三住" src="voice/chn05/00700150mi">
「しらばっくれるなよ。というわけで、フォロー頼むぜ。岸本に、いかに三住大輔って人間が素晴らしいかを語ってくれ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700160ta">
「む、無理だよ……」

{	Stand("bu大輔_制服_通常","smile", 250, @+180);
	FadeStand("bu大輔_制服_通常_smile", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/chn05/00700170mi">
「無理とか言うなってー。マジ頼むからさ！」

{	DeleteStand("bu大輔_制服_通常_smile", 300, true);}
少しは自重しろよ……。
ここは病院だぞ。コンパの場じゃないんだぞ……。

このノリであやせに会いに行って大丈夫なんだろうか。
あやせって、三住くんのことあんまり良く思ってなさそうだからなあ。
胃のあたりがずぅーんと重くなってきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateSE("SE01","SE_じん体_動作_足_歩く");
	MusicStart("SE01",0,1000,0,1000,null,false);

	Wait(2500);

	Stand("bu大輔_制服_通常","normal", 250, @+180);
	FadeStand("bu大輔_制服_通常_normal", 500, true);

	SetVolume("SE01", 500, 0, null);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【三住】
<voice name="三住" class="三住" src="voice/chn05/00700180mi">
「お、タク、病室はここじゃねえか？」

三住くんが立ち止まり、病室の扉の横にあるプレートを指差した。
そこには確かに“岸本あやせ”という名前。
扉は閉まっていて、中の様子はうかがい知ることはできない。

{	Stand("bu大輔_制服_通常","pride", 250, @+180);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/chn05/00700190mi">
「いいか？　うまく俺に話を合わせろよ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700200ta">
「え、う、うん……」

とりあえずうなずいておく。
僕としてもあやせに話があるんだけど……。
三住くんがいてもいなくても、うまく切り出せないような気がする。

//ＳＥ//病室の扉を開ける
{	CreateSE("SE01","SE_日常_びょういんどあ_開く");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Stand("bu大輔_制服_通常","smile", 250, @+180);
	FadeStand("bu大輔_制服_通常_smile", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/chn05/00700210mi">
「おーっす、岸本さーん」

三住くんは扉を開けるなり、明るく中に声をかけた。

{	SetVolume("SE3601", 1000, 0, null);
	Stand("bu大輔_制服_通常","shock", 250, @+180);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_smile", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/chn05/00700220mi">
「お見舞いに来た……ぜ……」

と、急にその声音がトーンダウンして。
表情を引きつらせる。
何事かと、僕は三住くんの肩越しに中をのぞき込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//あやせの病室
//※※ディソード３本に増やして下さい。「あやせディソード」「梨深ディソード」「七海ディソード」が壁に立てかけてある
//おがみ：BG:追加希望　ディソード3本バージョン
	PrintBG(2000);

	CreateTexture360("背景０", 100, 0, 0, "cg/bg/bg102_02_2_あやせの病室_a.jpg");
	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg102_02_2_あやせの病室_a.jpg");

	DrawTransition("back*", 500, 1000, 0, 100, null, "cg/data/right3.png", true);
	Delete("back*");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
その病室は六畳ほどの広さの個室。
入ると右側に備え付けのトイレ、奥にベッドがある。
そのベッドに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, false);
	Request("血", AddRender);

	Fade("血", 0, 1000, null, true);


	BGMPlay360("CH01",0,1000,true);

//※あやせの立ち絵は「パジャマ・血まみれ」を使ってください
	Stand("stあやせ_パジャマ_通常_血まみれ","normal", 250, @-50);
	FadeStand("stあやせ_パジャマ_通常_血まみれ_normal", 700, true);


	Fade("血", 1000, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
全身を血にまみれさせたあやせが、腰掛けていて。
その彼女の虚ろな瞳が、僕らを、射抜いた。

//【三住】
<voice name="三住" class="三住" src="voice/chn05/00700230mi">
「う、うわああ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);


//ＳＥ//人とぶつかる音
	CreateSE("SE02","SE_衝撃_ひととぶつかる");
	Shake("背景０", 500, 5, 10, 0, 0, 500, null, false);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateSE("SE01","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE01",0,1000,0,1000,null,false);
	Wait(200);
	SetVolume("SE01", 3000, 0, Axl1);

	Fade("Black", 200, 1000, null, true);


	//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3611003]
三住くんが情けない悲鳴を上げ、僕を押しのけるようにして病室を飛び出していく。

僕も逃げ出したかった。

でも――

足が竦んでしまって。
恐怖に震えてしまって。

{	Fade("Black", 500, 0, null, true);
	Delete("Black");}
同時に、血に濡れたあやせの妖艶な美しさと。
彼女の背後の壁に立てかけている“もの”に目を奪われて。

その場から動くことができなかった。

{	DeleteStand("stあやせ_パジャマ_通常_血まみれ_normal", 500, true);}
とても無造作に、そこに置いてあったのは。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Request("背景０", Smoothing);
	Zoom("背景０", 1000, 2000, 2000, AxlDxl, false);
	Move("背景０", 1000, @-512, @-56, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
ディソード。

しかも、前にあやせが持っていたものも含めて、計３本。
どれも、形状が違う。

ひとつは、剣とは思えないような、奇妙で洗練されたフォルム。
ひとつは、さながら十字架かと思えてしまう、痛々しいフォルム。
そしてあやせが以前も手にしていた、流線形の神秘的なフォルム。

どうしてあやせは、ディソードを３本も持ってるんだ。

いや、１人につき１本しかディソードを持てないなんて、誰が決めた？
もしかしたらセナやこずぴぃだって、違う形状の剣を何本も持っているかもしれない。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700240ay">
「拓巳」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Zoom("背景０", 500, 1000, 1000, AxlDxl, false);
	Move("背景０", 500, @512, @56, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
呼ばれて、ギクリとした。
あやせが、立ち尽くす僕の方へとゆらりと歩み寄ってくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



	Stand("buあやせ_パジャマ_通常_血まみれ","normal", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_血まみれ_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700250ay">
「来て、くれたのね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700260ta">
「ど、どうして、そんなに、血が……」

しかもパジャマを紅く染めているその血は、まだ乾いていない。
生々しい匂いが、僕の鼻をつく。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700270ay">
「黒騎士の血よ、これは」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700280ta">
「黒騎士って……あ、あやせ本人の……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700290ay">
「いいえ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700300ta">
「じゃあ、だ、誰……？　あやせは、その人を、こ、殺したの……？」

{	Stand("buあやせ_パジャマ_通常_血まみれ","smile", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_血まみれ_smile", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_血まみれ_normal", 0, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700310ay">
「ふふふ……」

あやせは目を細めて、笑った。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700320ay">
「怯えているのね、拓巳」

血で濡れた指で、僕の頬を撫でてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("buあやせ_パジャマ_通常_血まみれ","shy", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_血まみれ_shy", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_血まみれ_smile", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700330ay">
「でも、キミを怯えさせているのは、キミ自身の心の内にあるものよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700340ay">
「不浄なる邪心に打ち勝って。純粋な邪心のみを心にとどめるのよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700350ay">
「そうすれば、ディソードは手に入る」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700360ay">
「手に入れてもらわなくちゃいけない」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700370ay">
「キミは、黒騎士なのよ。キミには、力があるわ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700380ta">
「ディソードを手に入れたら、ぼ、僕も、殺すの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700390ta">
「黒騎士を、こ、殺して、き、来たんだろ……？」

{	Stand("buあやせ_パジャマ_通常_血まみれ","hard", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_血まみれ_hard", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_血まみれ_shy", 0, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700400ay">
「惑わされないで」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700410ay">
「それが、不浄なる邪心よ」

あやせは僕の頬に手を添えたまま、じっと見つめてくる。
その目は虚ろなように見えて、でも瞳の奥に、とても深い輝きをたたえている気がして。

僕は目を離せなくなる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("buあやせ_パジャマ_通常_血まみれ","normal", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_血まみれ_normal", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_血まみれ_hard", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700420ay">
「黒騎士は、本来なら邪心を制御できるわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700430ay">
「けれど邪心王は巧妙だった」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700440ay">
「グラジオール記黙示録詩編第６巻２章５０節。グラジオールは邪心を少しずつ侵食することで、静かに支配を完了し、邪心の暴走を引き起こすのよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700450ay">
「負けてはいけないわ。邪心王の精神侵略に」

三次元女子と、こんなに長い時間、見つめ合うのは初めてだった。
あやせの、哀しみと寂しさと力強さを秘めた瞳に、魅入られていた。
彼女の話なんてまったく聞こえていなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700460ta">
「ま、守って……」

気が付けば、僕はつぶやいていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700470ta">
「ぼ、僕を……守って、くれ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700480ay">
「いいわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("buあやせ_パジャマ_通常_血まみれ","shy", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_血まみれ_shy", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_血まみれ_normal", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
あやせはあっさりとうなずいた。
さらに顔を近づけてきて。
血の匂いをますますきつく感じて

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700490ay">
「これは、予定されていたこと」

耳元で、ささやいてくる。
すごくドキドキする。

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700500ay">
「キミを守るわ。キミも、私を守って」

血にまみれたあやせは、背徳的で、淫靡で、妖艶だ。
とても同級生とは思えない。

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700510ay">
「他の黒騎士は、もう……アテにはできない。最初は、予言通りに黒騎士を集めようと思ったけれど、私の力では無理だった」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700520ay">
「でも、拓巳がいてくれるなら……」

あのライブのときもそうだった。
あやせは時に、すごく蠱惑的な顔を見せることがある。

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700530ay">
「いずれ完全に開くわ、コキュートスの門は。そのとき、邪心王はこの世に降臨する」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700540ay">
「だから、急いで集めるのよ」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700550ay">
「７本の、ディソードを」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700560ay">
「私と、キミ。２人で」

壁に立てかけてあるのは、３本
残りは４本……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("buあやせ_パジャマ_通常_血まみれ","normal", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_血まみれ_normal", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_血まみれ_shy", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700570ay">
「うち１本は、拓巳、キミが見つけるべきディソードよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700580ta">
「……僕は、手に入れられなかった」

Ｏ－ＦＲＯＮＴで、惜しいところまで行ったけど、結局はなにもかも投げ出して、逃げた。手に入れることを放棄してしまった。

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700590ay">
「落ち込むことはないわ」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700600ay">
「機会はいくらでもやってくる」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700610ay">
「すでに拓巳は“見えている”んだから」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700620ay">
「それこそが、キミが黒騎士である証拠よ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700630ta">
「い、いつか……、手に、入るのかな……？」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700640ay">
「不浄なる邪心に打ち勝てば、必ず」

邪心って、なんなんだろう……。
邪な心っていうことは、エロい妄想とかかな……？

それはとても難しい気がする。
打ち勝てる気がしないよ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("@CH*", 3000, 0, null);


	DeleteStand("buあやせ_パジャマ_通常_血まみれ_normal", 500, true);

	Wait(200);

	Stand("stあやせ_パジャマ_通常_血まみれ","normal", 500, @-50);
	FadeStand("stあやせ_パジャマ_通常_血まみれ_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
あやせは僕から離れ、ベッドの方へ戻る。
それからおもむろに、上着のボタンを外し始めた。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700650ay">
「……着替えるわ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700660ta">
「ちょ、まっ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black", 2000, 0, 0, 1280, 720, "Black");
	DrawTransition("Black", 500, 0, 1000, 100, null, "cg/data/right2.png", true);

	ClearAll(10);
}
