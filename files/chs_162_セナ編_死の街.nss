//<continuation number="90">

chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "chs_162_セナ編_死の街";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_162_セナ編_死の街();
}


function chs_162_セナ編_死の街()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編
//※拓巳視点に戻る
//ＢＧ//１０９//渋谷崩壊後

	CreateSE("SE10","SE_はいけい_崩壊しぶ谷_107前_LOOP");
	MusicStart("SE10", 2000, 1000, 0, 1000, null, true);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg001_02_5_崩壊渋谷_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	Wait(500);

	Move("back01", 8000, @0, @-800, DxlAuto, true);

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
渋谷の街を歩いてみて、ようやく僕は実感した。
この町を襲った地震が、いかにすさまじいものだったか、って。

かつてのきらびやかな街の面影なんて、もうどこにもない。
この街は、死んだ。死の街だ。

ピクリとも動かない人たちが何人も、折り重なるようにして倒れている。道路のところどころには、血溜まりができている。

生きていない。
みんな、死んでいる。

波多野さんが、死傷者は４桁以上だって言ってた。
そしてこれを引き起こしたのは……ノアⅡ。

天災じゃない。人災ですらない。
これは、虐殺だ……。

僕の少し前を歩くセナも、悲痛な面持ちをしていた。
波多野さんは一緒じゃない。希テクノロジーのビルに残った。

セナとは親子らしいけど、とてもそうは見えなかったな。
セナが一方的に波多野さんを憎んでるって感じだった。
母親とか妹とかって単語が、会話の端々に出てきていた。

２人の間にはなにかがあったんだろう。
そして、そのことできっとセナの心も“壊れた”んだ。
詳しい話を聞くつもりはない。どう話せばいいのか分からないし。

それに今は、チートコードを手に入れるのが最優先だ。
それさえあれば、もうセナに守ってもらわなくてもいい。
僕は１人で生きていける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 2000, 500, null);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);

//ＳＥ//地響き
	CreateSE("SE01","SE_自然_じ鳴り_ふぇーどいん_LOOP");
	MusicStart("SE01", 500, 500, 0, 1000, null, true);

	CreateSE("SE02","SE_自然_じ鳴り_LOOP");
	MusicStart("SE02", 500, 500, 0, 1000, null, true);

	Fade("Black", 2000, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
ふと、背後から地響きのような音が聞こえてきた。
また地震か、と思ってとっさにその場に這いつくばったけど、地面が揺れることはない。

恐る恐る振り返る。
そこには、僕らがさっきまでいた希の本社ビルがそびえ立っているはずだったけど。

もうもうとした煙が巻き上がっていた。
まるで火山が噴火したかのような光景。
そして、あったはずのビルの姿が、ない。

まさか、崩壊した……？
あそこには、波多野さんが残っていたのに……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//希ビル崩壊
	SetVolume("SE01", 2000, 0, null);
	SetVolume("SE02", 2000, 0, null);
	CreateSE("SE03","SE_衝撃_瓦礫砕く");
	CreateSE("SE04","SE_衝撃_爆発音");
	CreateSE("SE05","SE_衝撃_道路陥ぼつ");
	CreateSE("SE06","SE_衝撃_道路陥ぼつ");
	MusicStart("SE03", 0, 500, 0, 1000, null, false);
	MusicStart("SE04", 0, 500, 0, 1000, null, false);
	MusicStart("SE05", 0, 500, 0, 1000, null, false);
	MusicStart("SE06", 0, 500, 0, 1000, null, false);

	Fade("Black", 2000, 0, null, true);

	Wait(1000);

	Stand("stセナ_制服_通常","sad", 300, @+180);
	FadeStand("stセナ_制服_通常_sad", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09600010sn">
「あ……ああ……」

セナがうめく。呆然と、空を覆い尽くさんばかりの煙を見上げて。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09600020sn">
「父さん……」

{	DeleteStand("stセナ_制服_通常_sad", 300, false);}
それから僕の視線に気付き、すぐにそっぽを向く。
けれど、その肩は震えていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_横向","shy", 300, @+180);
	FadeStand("stセナ_制服_横向_shy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09600030sn">
「く、そ……っ。こんなことなら、私が、この手で、殺しておくんだった……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09600040sn">
「殺して……おけば……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09600050sn">
「ぐすっ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09600060ta">
「だ、だったら……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09600070ta">
「あの人も、生き返らせれば、いい……」

チートコードを手に入れれば、それができる。
できるはずだ。『禁（０漸Ｖ・＄』の言葉を信じるなら。

{	Stand("stセナ_制服_横向","think", 300, @+180);
	FadeStand("stセナ_制服_横向_think", 300, true);
	DeleteStand("stセナ_制服_横向_shy", 300, false);}
//◆涙声、自嘲気味
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09600080sn">
「フン……、殺すために、生き返らせるのか……？」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09600090sn">
「非効率的だな……ぐすっ」

{	DeleteStand("stセナ_制服_横向_think", 500, true);}
自嘲気味に笑って、でもその声は涙で濡れていて。
僕はなんて声をかけていいか分からず、うなだれる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Fade("Black", 1000, 1000, null, true);

	Wait(1000);

	CreateSE("SE06","SE_はいけい_瓦礫_踏む足音_LOOP");
	MusicStart("SE06", 0, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
しばらくセナは涙をこらえていたけど、やがて意を決したように再び歩き出した。もう、その目に涙はなかった。

僕も、慌ててセナを追った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	SetVolume("SE*", 2000, 0, null);
	Waite(300);

	ClearAll(2000);
	Wait(1000);
}

