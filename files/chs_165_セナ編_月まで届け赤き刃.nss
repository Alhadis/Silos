//<continuation number="600">

chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "chs_165_セナ編_月まで届け赤き刃";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_165_セナ編_月まで届け赤き刃();
}


function chs_165_セナ編_月まで届け赤き刃()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編
//ＢＧ//渋谷東口とプラネタリウム
//↑プラネタリウムの周囲の建物は崩壊していて、プラネタリウムの建物だけ無傷、という差分があると嬉しいです……


	CreateSE("SE3601","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE3601",3000,300,0,1000,null,true);

	CreateTexture360("back01", 100, 0, -96, "cg/bg/bg197_02_6_渋谷駅東口とプラネタリウム_a.jpg");
	Fade("back01", 0, 0, null, false);
	Fade("back01", 1000, 1000, null, true);

	Wait(1000);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
地上に出た。
僕が歩いてきた後には、転々と血が滴っていた。
かなりの出血量だ。

さっきまで、傷口がすごく熱かったのに、今は、寒くてしょうがない。どれだけ抑えようとしても、身体が激しく震えてしまう。歯が、噛み合わない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("back01", 1000, @0, @96, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
顔を上げると、目の前にはプラネタリウム。
それを目にして、違和感を覚えた。

周囲の建物は、地震の影響でことごとく崩壊したり、亀裂が入っていたりするのに。
プラネタリウムがあるあのビルだけは、完璧に無傷。

しかも、あのビルは、数年前に、取り壊されたはずだ。

なのに、どうして今もそこにあるんだろう。
どうして僕は、今の今まで、そのことにまったく疑問を抱かなかったんだろう。

これも、ギガロマニアックスの力なんだろうか。
それとも、ノアⅡの仕業によるものなのか……？

いずれにせよ、気付けたのはきっとチートコードのおかげだ。

あとはコードを起動させて、
あのプラネタリウムを破壊すればいいんだ……。

{	CreateSE("SE01","SE_じん体_動作_尻餅");
	MusicStart("SE01",0,1000,0,1000,null,false);}
//以下、どこか最適な場所にイベントＣＧ１枚使ってください（エンディング後のエピローグのぞく）
僕はそれ以上セナを支えていられず、がっくりとその場に膝を突いた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800010ta">
「セ……ナ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800020ta">
「チート、使うんだ……」

喋るのさえも辛い。
セナは僕と赤ん坊を交互に見て、いやいやをするようにかぶりを振り、震えているだけ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("ブラー用", 120, 0, 0, "cg/bg/bg197_02_6_渋谷駅東口とプラネタリウム_a.jpg");

	Zoom("ブラー用", 0, 1000, 1000, null, true);
	Fade("ブラー用", 0, 500, null, true);
	Fade("ブラー用", 1000, 500, Axl2, false);
	Zoom("ブラー用", 1000, 1100, 1100, Dxl2, true);
	Zoom("ブラー用", 1000, 1050, 1050, AxlDxl, true);
	Fade("ブラー用", 2500, 0, Axl2, false);
	Zoom("ブラー用", 1500, 1100, 1100, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
ダメだ……目が、かすんできた……。
チートコードを発動しないと、僕は、死んじゃうよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","cry", 200, @+150);
	FadeStand("buセナ_制服_通常_cry", 500, true);

	Fade("ブラー用", 300, 0, null, true);
	Delete("ブラー用");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800030sn">
「西條、しっかりしろ……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800040sn">
「こんな……こんなのって……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800050sn">
「死なないで……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800060sn">
「お願いだから……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800070sn">
「なあ、西條……。世界は、電気仕掛けなんかじゃ、ないんだ……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800080sn">
「私はただ……、思い込みたかっただけ……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800090sn">
「母さんと妹を見殺しにしかできなかった自分が、許せなくて。
　気持ち悪いと、吐いてしまった自分が、許せなくて……っ」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800100sn">
「２人が死んだのも、父さんがあんなことしたのも、全部、信じたくなくて、感情なんて、捨て去りたくて……っ」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800110sn">
「だけど、ダメなんだ……、どうやったって、父さんを憎んでしまうし、母さんや妹の死んだことが悲しいし、自分が許せないし……！」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800120sn">
「この子を、死なせたくないんだっ……」

くそぅ……、セナは、役に立たない……。
僕が、なんとかするしか……。

手を伸ばす。セナが抱いている、血まみれの赤ん坊に。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800130ta">
「か、貸して……それを……」

だけどセナは、赤ん坊を離してくれない。

{	Stand("buセナ_制服_通常","sad", 200, @+150);
	DeleteStand("buセナ_制服_通常_cry", 300, false);
	FadeStand("buセナ_制服_通常_sad", 300, true);}
//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800140sn">
「ダメだ、西條、やめろ……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800150ta">
「も、もう、し、死んでるよ……っ」

{	DeleteStand("buセナ_制服_通常_sad", 500, true);}
核心を突いて、ハッとしたセナの手から、無理矢理赤ん坊を奪った。

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800160sn">
「う、うう……」

泣き崩れるセナを無視して、僕は赤ん坊を抱く。
チートコードよ、発動しろ……僕に、力をくれ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume("SE3601", 1000, 0, null);

//ＳＥ//共鳴音
//画面エフェクト//赤い光の粒子がゆらゆら舞う（ディソードの光）
	CreateSE("SE01","SE_擬音_共鳴音_激しい_LOOP");
	MusicStart("SE01", 2500, 1000, 0, 1000, null, true);

	CreateColor("黒幕", 1000, 0, 0, 1280, 720, "Black");
	Fade("黒幕", 0, 0, null, true);
	Fade("黒幕", 1000, 1000, null, true);

	CreateTexture360("back02", 105, 0, 0, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");
	CreateTexture360("ブラー用", 120, 0, 0, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");
	CreateTexture360("加算用", 130, 0, 0, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");
	Request("加算用", AddRender);

	Zoom("ブラー用", 0, 1050, 1050, null, true);
	Fade("ブラー用", 0, 500, null, true);
	Fade("加算用", 0, 0, null, true);

	Wait(1500);

	Fade("黒幕", 2000, 500, null, false);

	Fade("ブラー用", 1000, 500, Axl2, false);
	Zoom("ブラー用", 1000, 1100, 1100, Dxl2, true);
	Zoom("ブラー用", 1000, 1050, 1050, AxlDxl, true);


	Fade("ブラー用", 2500, 500, Axl2, false);
	Zoom("ブラー用", 1500, 1100, 1100, AxlDxl, false);
	Fade("黒幕", 1000, 800, null, true);
	Fade("黒幕", 1000, 500, null, true);

	Fade("加算用", 300, 300, null, true);
	Fade("加算用", 1000, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
ふと、気付く。
淡い光。不思議な色。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("黒幕", 1000, 800, null, false);
	Zoom("ブラー用", 1000, 1050, 1050, AxlDxl, true);

	Fade("ブラー用", 2500, 0, Axl2, false);
	Zoom("ブラー用", 1500, 1100, 1100, AxlDxl, false);
	Fade("黒幕", 1000, 0, null, true);
	Delete("黒幕");

	Fade("加算用", 300, 500, null, true);
	Fade("加算用", 1000, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
足許に、輝く剣が横たわっていた。

ディソード……！

{	SetVolume("SE01", 1000, 0, null);}
痛みも忘れて、それを手に取った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 0, null, false);
	Request("フラッシュ", AddRender);


	CreateSE("SE01","SE_衝撃_衝撃は_リアルぶーと");
	MusicStart("SE01",0,1000,0,1000,null,false);

	Wait(2000);

	Fade("フラッシュ", 1500, 1000, Axl2, false);

	Fade("加算用", 1500, 1000, Dxl1, false);

	Fade("ブラー用", 1500, 1000, Dxl2, false);
	Zoom("ブラー用", 1500, 2000, 2000, Axl2, true);
	Delete("ブラー用");
	Wait(1000);



	Fade("加算用", 1500, 0, Axl2, false);
	Fade("フラッシュ", 1500, 0, Axl2, true);
	Delete("加算用");
	Wait(2000);

	CreateSE("SE3602","SE_擬音_ディそーどかまえる");
	MusicStart("SE3602",0,1000,0,1000,null,false);

	BGMPlay360("CH29",0,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
長く巨大な割に、驚くほどに軽い。まるで空気をつかんでるみたいだ。

確信する。これは、本物だ。ニセモノなんかじゃない。

さ、さすが、チートコード。
あれだけ手に入れられなかったディソードを、こうもあっさり入手できちゃうなんて。

僕は気力を振り絞り、立ち上がった。
まだ傷は癒えていない。でも今の僕は、もう無敵なんだ。この程度の傷、きっとすぐに治せるから平気だ。

セナが使い物にならない以上、僕が、ノアⅡを壊す。

{	CreateSE("SE01","SE_衝撃_どさっ");
	CreateSE("SE02","SE_はいけい_瓦礫_取り除かれる2");
	MusicStart("SE01",0,1000,0,1000,null,false);
	MusicStart("SE02",0,1000,0,1000,null,false);}
身体の奥底から、力が溢れてくるのを感じる。
今ならなんでもできそうな気がする。
神に匹敵する力を手に入れたんだから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("フラッシュ", 200, 1000, Axl2, true);
	Delete("back02");
	Fade("フラッシュ", 1000, 0, Dxl2, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
剣を振りかぶった。
狙うは、不気味にライトアップされたプラネタリウム。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800170ta">
「こ、わしてやる……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800180ta">
「これで、終わりに……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("フラッシュ");

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, false);

	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, true);
//	Request("血", AddRender);
	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg197_02_6_渋谷駅東口とプラネタリウム_a.jpg");

//ＳＥ//銃声
	CreateSE("SE02","SE_衝撃_じゅう声");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Shake("back01", 500, 5, 10, 0, 0, 500, null, false);
	Fade("血", 0, 1000, null, true);
	Fade("血", 500, 0, null, true);

	Wait(300);
	Delete("下敷き");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
銃声が響き渡り。
僕の胸から血が噴き出した。

その後で、すさまじい痛みが襲ってきた。

{	Fade("Black", 100, 1000, null, true);}
一瞬、呼吸が止まる。
視界がブラックアウトする。
のどの奥に不快感が溢れ、咳き込むと口の中に血の味が広がった。

{	Fade("血", 0, 0, null, true);
	Fade("血", 100, 1000, null, true);
	Delete("Black");}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800190ta">
「あ……う……」

さっきの男が、また撃ってきた……？
梨深は、食い止めてくれたんじゃないの？

{	DrawTransition("血", 500, 1000, 0, 100, null, "cg/data/zoom1.png", true);
	Delete("血");}
周囲を見回す。

そして愕然となった。

人が、たくさんいる。
僕とセナを、取り囲んでいる。

みんな、死んだような目をして。
みんな、手に銃を持っていて。
僕を、狙っていた。

しかも誰もが、なにかをつぶやいている。

//【葉月】
<voice name="葉月" class="葉月" src="voice/chn02/19701160hd">
「神光の救いあれ、神光の救いあれ……」

//【ポーターＢ】
<voice name="ポーターＢ" class="ポーターＢ" src="voice/chn02/19701170pb">
「神光の救いあれ、神光の救いあれ……」

//【ポーターＣ】
<voice name="ポーターＣ" class="ポーターＣ" src="voice/chn02/19701180pc">
「神光の救いあれ、神光の救いあれ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800200ta">
「セナ、ふ、伏せて……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//▼べー：ＳＥ：適当です。乱射音必要であれば発注お願い致します。
//ＳＥ//銃声（乱射）

	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, true);
	Request("血", AddRender);
	CreateSE("SE02a","SE_衝撃_じゅう声");

	MusicStart("SE02a", 0, 1000, 0, 1000, null, false);
	Wait(100);

	Shake("back01", 700, 5, 10, 0, 0, 500, null, false);
	Fade("血", 0, 1000, null, true);
	Fade("血", 100, 0, null, false);

	CreateSE("SE02b","SE_衝撃_じゅう声");
	MusicStart("SE02b", 0, 1000, 0, 1000, null, false);
	Fade("血", 0, 1000, null, true);
	Fade("血", 100, 0, null, false);

	Wait(50);

	CreateSE("SE02c","SE_衝撃_じゅう声");
	MusicStart("SE02c", 0, 1000, 0, 1000, null, false);

	Fade("血", 0, 1000, null, true);
	Fade("血", 100, 0, null, false);

	Wait(100);

	CreateSE("SE02d","SE_衝撃_じゅう声");
	MusicStart("SE02d", 0, 1000, 0, 1000, null, false);

	Fade("血", 0, 1000, null, true);
	Fade("血", 100, 0, null, false);

	Wait(100);

	CreateSE("SE02e","SE_衝撃_じゅう声");
	MusicStart("SE02e", 0, 1000, 0, 1000, null, false);

	Fade("血", 0, 1000, null, true);
	FadeDelete("血", 100, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
一斉に、撃ってきた。

無数の鉛の弾が、僕の身体を貫く。
肉を抉る。
骨を断つ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800210ta">
「あ、が、ぐ、ぎ……っ」

衝撃に襲われて。
僕は踊らされる。
操り人形のように。

痛みは意識を直撃し。
気絶しそうになって。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800220ta">
「こ、の……！」

それでも、必死で踏ん張った。
片手で、ディソードを振り上げたまま。

壊してやる――

祈る。

ノアⅡを壊してやる――

どれだけボロボロになったって、僕は、死なないんだ。死なないはずなんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800230ta">
「うおおおおお！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//剣を振る
	CreateSE("SE03","SE_擬音_ディそーど2");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	CreateColor("赤フラッシュ", 1000, 0, 0, 1280, 720, "Red");
	Fade("赤フラッシュ", 0, 0, null, true);
	Request("赤フラッシュ", AddRender);


	CreateColor("White", 3000, 0, 0, 1280, 720, "White");
	Fade("White", 0, 0, null, true);
	Request("White", AddRender);

	Fade("赤フラッシュ", 500, 700, null, true);

	Fade("White", 300, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
振り下ろした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//閃光の音
	CreateSE("SE04","SE_擬音_のあⅡ_閃光");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	CreateColor("Red", 4000, 0, 0, 1280, 720, "Red");

	Fade("Red", 0, 0, null, true);
	Fade("Red", 0, 700, null, true);
	DrawTransition("Red", 300, 0, 200, 100, Dxl1, "cg/data/tcenter.png", true);


	Fade("White", 300, 0, null, true);
	Delete("White");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
ディソードは赤き光の軌跡を放つ。

夜空に、閃光――

ほとばしる。
闇夜を切り裂く光の刃。

それはまっすぐにプラネタリウムのドームへと向かい――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//見えない障壁で弾かれる
	CreateSE("SE05","SE_擬音_障壁_はじく");
	SetVolume360("CH*", 2000, 0, null);

	DrawTransition("Red", 500, 200, 1000, 100, Axl1, "cg/data/tcenter.png", false);

	CreateColor("White", 5000, 0, 0, 1280, 720, "White");
	Fade("White", 0, 0, null, true);
	Request("White", AddRender);

	CreateTexture360("ブラー用", 100, 0, 0, "cg/bg/bg197_02_6_渋谷駅東口とプラネタリウム_a.jpg");
	Request("ブラー用", AddRender);

	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Shake("ロッカー１", 500, 5, 10, 0, 5, 500, null, false);

	Zoom("ブラー用", 0, 1000, 1000, null, true);
	Fade("ブラー用", 0, 500, null, true);
	Zoom("ブラー用", 2500, 1200, 1200, Dxl2, false);
	Fade("ブラー用", 2500, 0, Axl2, false);

	Fade("White", 100, 1000, null, true);

	Delete("Red");
	DrawTransition("赤フラッシュ", 300, 1000, 0, 100, null, "cg/data/爆発２.png", false);

	FadeDelete("White", 100, 0, true);

	Wait(2000);
	Delete("赤フラッシュ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
見えない力に弾かれた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800240ta">
「う、そでしょ……」

まるで、そこに透明の壁でもあるかのようだった。
ディソードが放った光は弾かれ、屈折して霧散する。

静寂。

僕に銃を撃ってきた連中も。
セナも。僕も。
みんな、呆然と今の光景を見つめていた。

チートを使っても、ダメなの？
ノアⅡは、壊せないの……？

もう一発だ……。
こんなところで、終わってたまるか……。

血を吐き。
脂汗が目に染みる。

痛みはほとんど感じない。
もう、全身の感覚が失われつつある。
神経が麻痺したのかもしれない。

もう一発だ……。

僕は、強いんだ。最強なんだ。
反則級の強さを手に入れたはずなんだ……。

だから、もう一発――

剣を振り上げる。

{	CreateSE("SE3603","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE3603",5000,300,0,1000,null,true);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800230hd">
「神光の救いあれ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("ブラー用");

	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, true);
	Request("血", AddRender);

//ＳＥ//銃声（乱射）
	CreateSE("SE02a","SE_衝撃_じゅう声");
	MusicStart("SE02a", 0, 1000, 0, 1000, null, false);
	Fade("血", 0, 1000, null, true);
	Fade("血", 100, 0, null, false);

	Wait(100);
	CreateSE("SE02b","SE_衝撃_じゅう声");
	MusicStart("SE02b", 0, 1000, 0, 1000, null, false);

	Fade("血", 0, 1000, null, true);
	Fade("血", 100, 0, null, false);
	Wait(50);
	CreateSE("SE02c","SE_衝撃_じゅう声");
	MusicStart("SE02c", 0, 1000, 0, 1000, null, false);

	Fade("血", 0, 1000, null, true);
	Fade("血", 100, 0, null, false);
	Wait(100);
	CreateSE("SE02d","SE_衝撃_じゅう声");
	MusicStart("SE02d", 0, 1000, 0, 1000, null, false);

	Fade("血", 0, 1000, null, true);
	Fade("血", 100, 0, null, false);
	Wait(100);
	CreateSE("SE02e","SE_衝撃_じゅう声");
	MusicStart("SE02e", 0, 1000, 0, 1000, null, false);

	Fade("血", 0, 1000, null, true);
	FadeDelete("血", 100, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
女の叫びとともに、再び銃が乱射され。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800250sn">
「西條……っ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//人がぶつかる音
	CreateSE("SE06","SE_衝撃_ひととぶつかる");
	MusicStart("SE06", 0, 1000, 0, 1000, null, false);
	Stand("buセナ_制服_横向","shy", 200, @+150);
	FadeStand("buセナ_制服_横向_shy", 200, true);

	Wait(500);
	DeleteStand("buセナ_制服_横向_shy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
セナが僕の身体に覆い被さってきた。
今度は僕がセナに助けられたみたいだ。

//◆痛い
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800260sn">
「ぐ……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800270ta">
「セ……ナ……？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800280sn">
「私も、手伝う……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800290sn">
「手伝うよ……」

セナが、きつく、きつく、血まみれの僕を抱きしめてくる。
ディソードを持つ僕の手を、握りしめてくる。

セナの身体は、とても温かい。熱く感じるくらいだ。
それはきっと、セナの血の熱さ。今の銃撃で受けたセナの傷。セナの、命の鼓動の熱さ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateSE("SE3601","SE_じん体_心臓_鼓動");
	CreateSE("SE3602","SE_じん体_心臓_鼓動_LOOP");
	MusicStart("SE3601",0,1000,0,1000,null,true);
	MusicStart("SE3602",0,1000,0,1000,null,true);

	CreateTexture360("セナタクミ剣下ろし", 250, center, middle, "cg/ev/ev120_02_6_ノアⅡ破壊_a.jpg");
	Fade("セナタクミ剣下ろし", 0, 0, null, false);
	Fade("セナタクミ剣下ろし", 1000, 1000, null, true);

	Delete("back01");

	BGMPlay360("chn01",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆苦しげ
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800300sn">
「がは……はあ、はあ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800310sn">
「お前の覚悟……ちゃんと、分かったから……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800320sn">
「壊そう……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800330sn">
「その子のためにも……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800340sn">
「壊そう……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800350sn">
「はあ、はあ、はあ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800360sn">
「２人で、力を合わせて……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800370sn">
「お前だけ、死なせない……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800380sn">
「お前だけ、無茶させない……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800390sn">
「う、く……はあ、はあ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800400sn">
「私とお前は、運命共同体だ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800410sn">
「ずっと、一緒だ……死ぬときも、戦うときも……一緒だ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800420sn">
「もう、こんな哀しみの連鎖は、止めよう……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800430sn">
「復活とか、そんなの、どうでもいい……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800440sn">
「自然の摂理に反することは、するべきじゃない……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800450sn">
「はあ、はあ、私はただ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800460sn">
「もう、憎しみも哀しみも、見たくないんだ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800470sn">
「こんな世界を、見たくないんだ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800480sn">
「お前が傷つくのも、見たくないんだ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800490sn">
「だから、はあ、はあ、一緒に……壊そう……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800500sn">
「あの、すべての元凶を……」

セナの声が、ぼんやりする意識の中に響いてくる。
やっと、立ち直ってくれたのか。

そんなに、ぼろぼろに泣いて。
僕みたいな、キモオタをかばって、血だらけになって。
僕も、セナも、真っ赤に染まって。

でも、セナの熱さを、僕は、確かに感じたから。
セナの声が、確かに届いたから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE360*", 2000, 0, null);

	CreateSE("SE01","SE_擬音_ディそーど2");
	CreateSE("SE02","SE_衝撃_衝撃は_リアルぶーと");
	CreateSE("SE03","SE_擬音_ディそーどかまえる");
	CreateSE("SE04","SE_擬音_ディそーどかまえる");
	CreateSE("SE05","SE_擬音_ディそーどかまえる");
	CreateSE("SE06","SE_擬音_ディそーどかまえる");

	CreateColor("White", 1100, 0, 0, 1280, 720, "White");
	Request("White", AddRender);
	Fade("White", 0, 0, null, true);

	CreateTextureEX("セナタクミ剣振り上げ", 260, center, middle, "cg/ev/ev120_01_6_ノアⅡ破壊_a.jpg");

	Move("セナタクミ剣下ろし", 1000, 0, @-80, AxlDxl, true);

	Wait(500);

	MusicStart("SE01",0,1000,0,1000,null,false);

	Move("セナタクミ剣振り上げ", 0, 0, @-400, null, true);
	Fade("セナタクミ剣振り上げ", 500, 1000, null, false);
	Move("セナタクミ剣振り上げ", 800, 0, @160, Dxl2, true);

	Fade("White", 600, 1000, null, true);
	MusicStart("SE03",0,1000,0,1000,null,false);
	MusicStart("SE04",0,1000,0,1000,null,false);
	Wait(400);
	MusicStart("SE05",0,1000,0,1000,null,false);
	Fade("White", 400, 0, null, true);
	MusicStart("SE06",0,500,0,1000,null,false);
	Delete("White");
	Wait(800);

	Delete("セナタクミ剣下ろし");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
一緒に、ディソードを振りかぶる。
まだ、周囲で銃声は聞こえている。

でも、もう無駄。
さっきより、力が溢れてくる。
セナからの強い命のほとばしりを感じる。

神の力で、神に匹敵する装置を壊す。
今度こそ――

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800510sn">
「行くぞ……西條……！」

僕はうなずき――

セナと、２人で。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	Fade("セナタクミ剣振り上げ", 200, 1000, null, false);
	MusicStart("SE02",0,1000,0,1000,null,false);

	Wait(300);


//◆以下、同時

//【セナ】
//<voice name="セナ" class="セナ" src="voice/chn02/09800520sn">
//「うおおおおおおお――！」
//【拓巳】
//<voice name="拓巳" class="拓巳" src="voice/chn02/09800530ta">
//「うおおおおおおお――！」
//◆以上、同時

	CreateVOICE("セナ","chn02/09800520sn");
	SoundPlay("セナ",0,1000,false);
	SetBacklog("「うおおおおおおお――！」", "voice/chn02/09800520sn", セナ);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09800530ta">
「うおおおおおおお――！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＢＧ//夜空に立ち上る赤紫色の一条の閃光
//ＳＥ//閃光の音
	CreateTextureEX("ラストシュート", 1000, 0, -192, "cg/bg/bg232_01_6_chn一条の閃光_a.jpg");
//	Request("ラストシュート", AddRender);

	CreateSE("SE3601","SE_擬音_ディそーど_衝撃は");
	CreateSE("SE3602","SE_擬音_のあⅡ_閃光");
	MusicStart("SE3601",0,1000,0,1000,null,false);
	MusicStart("SE3602",0,1000,0,1000,null,false);


	Shake("セナタクミ剣振り上げ", 800, 5, 5, 0, 0, 1000, null, false);
	Move("セナタクミ剣振り上げ", 1200, 0, 0, AxlDxl, true);

	Wait(500);

	Move("セナタクミ剣振り上げ", 800, 0, -640, Axl2, 600);
	Fade("ラストシュート", 200, 1000, null, false);
	Move("ラストシュート", 400, 0, @192, Dxl2, true);
	Delete("セナタクミ剣振り上げ");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
ディソードを、全力で振り下ろした――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("White", 1100, 0, 0, 1280, 720, "White");
	Request("White", AddRender);
	Fade("White", 0, 0, null, true);

	CreateSE("SE01","SE_衝撃_のあII崩壊");
	CreateSE("SE360901","SE_自然_じ鳴り_LOOP");
	MusicStart("SE01",0,1000,0,1000,null,false);
	MusicStart("SE360901",1000,1000,0,1000,null,true);

	SetVolume360("chn01", 5000, 0, null);


	CreateTextureEX("ブラー用", 1000, center, middle, "cg/bg/bg232_01_6_chn一条の閃光_a.jpg");
	Request("ブラー用", Smoothing);
	Request("ブラー用", AddRender);

	Move("ラストシュート", 4000, 0, @80, Axl2, false);
	Move("ブラー用", 4000, 0, @80, Axl1, false);
	Fade("ブラー用", 4000, 1000, null, true);


	Zoom("ブラー用", 1000, 2000, 4000, Axl2, false);
	Fade("White", 1000, 1000, Dxl2, true);
	Delete("ラストシュート");
	Delete("ブラー用");

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
まさに、一閃だった。

世界そのものを切り裂く閃光。
赤い光が、夜空を両断する。
月にまで届くかもしれない赤き刃。

それはあらゆるものを吹き飛ばし、消し去る。
ノアⅡの見えざる障壁ごと、プラネタリウムを灰燼と化す。

すさまじい衝撃と爆風。
身体が千切れそう。
僕らを取り囲んでいた連中も、吹き飛ばされていく。

それでも――

僕は、セナと互いの身体を支え合い――
手元の赤ん坊を、２人でかばうように抱きしめ――

最後の一滴まで、力を使い果たす。
後のことなんて考えてなかった。
チートコードがあれば、傷は治せる。

だから今は、ノアⅡを壊すことだけを。

ひたすらに。

己の気力を爆発させた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//爆発音
//ホワイトアウト
	CreateSE("SE101","SE_衝撃_道路陥ぼつ");
	CreateSE("SE360101","SE_擬音_ディそーど_衝撃は");

	MusicStart("SE101", 0, 1000, 0, 1000, null, false);
	MusicStart("SE360101", 0, 1000, 0, 1000, null, false);

	Wait(2500);

	SetVolume360("SE*", 4000, 0, null);

	Wait(1000);

//ＢＧ//夜空
	CreateTexture360("夜空", 1000, 0, 0, "cg/bg/bg206_01_3_夜空_a.jpg");
	FadeDelete("White", 3000, true);

	CreateSE("SE3601","SE_自然_風音_強_LOOP");
	MusicStart("SE3601",5000,1000,0,1000,null,true);

	Wait(2000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
音が、消えた。
光も、失われた。

廃墟と化した、死の街の真ん中で。

僕とセナは、たたずんでいる。

セナは、僕にしがみつくようにして。
僕は、セナに寄りかかるようにして。
２人の間には、血に染まった赤ん坊を抱いて。

一歩も歩けない。
ほんの少しも、動けない。
そんな力、残ってなかった。

//◆ささやき
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800540sn">
「もう、いいんだ……」

{
//	BGMPlay360("chn04",1000,1000,true);
}
//◆ささやき
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800550sn">
「哀しいけど、もう、いいんだ……」

//◆ささやき
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800560sn">
「死んだ人を生き返らせるのなんて、エゴでしかないから……」

//◆ささやき
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800570sn">
「チートコードは、返そう……」

僕も、同じ意見だった。
そして、僕たちは、生きているから。
これから、死んだ人たちの分まで、生きて行かなくちゃならない。

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800580sn">
「ごめん……」

セナは、血に染まった赤ん坊を、そっと、抱きしめる。

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800590sn">
「ごめん……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09800600sn">
「死なせてしまって、ごめん……っ」

今日のセナは、よく泣く。

でも、普段の誰彼構わずにらみつけてるセナよりも、

今の、弱さが見えるセナの方が、キレイだ――

そんなセナの流す涙は、とてもキレイだ――

そんなことを思いながら、僕は、夜空を見上げた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX2();//――――――――――――――――――――――――――――――

	SetVolume360("SE3601", 3000, 0, null);
	SetVolume360("chn04", 2000, 0, null);
	BGMPlay360Suspend("CHN_ED_sena",0,1000,true);
	Wait(2000);
	BoxDelete(1000);

//スタッフロールへ
//スタッフロール後、エピローグ入ります
//	ClearAll(3000);
	Wait(2000);
}





