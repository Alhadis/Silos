//<continuation number="300">

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_157_梢編_インターミッションＫ１";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_157_梢編_インターミッションＫ１();
}


function chk_157_梢編_インターミッションＫ１()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編

//■インターミッションＫ１

//ＢＧ//学校廊下・昼

//■アイキャッチIN
	IntermissionIn();

	DeleteAll();

//ＢＧ//学校廊下・昼
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");


//■アイキャッチOUT
	IntermissionIn2();

	CreateSE("SE3602","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE3602", 1500, 700, 0, 1000, null, true);

	Wait(1000);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//※二ノ宮美菜子＝にのみや　みなこ
折原梢が登校すると、教室に入る直前で、クラスメイトの１人である二ノ宮美菜子に呼び止められた。

//【美菜子】
<voice name="美菜子" class="美菜子" src="voice/chn04/01000010mk">
「折原。ちょっと話があるんだけど」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_正面","sad", 200, @+150);
	FadeStand("st梢_制服_正面_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01000020ko">
「……っ」

//以上、リアル声
その声には明らかに敵意が込められていて、梢はひるんでしまう。

しかも梢をにらんでいるのは、美菜子だけではなかった。

美菜子の後ろには、さらに５人ほどの女子が控えている。
全員、クラスメイトだ。ただ、顔と名前は一致しない。

//【美菜子】
<voice name="美菜子" class="美菜子" src="voice/chn04/01000030mk">
「いいよね？　付き合ってくれるでしょ？」

{	Stand("st梢_制服_通常","sad", 200, @+150);
	DeleteStand("st梢_制服_正面_sad", 300, false);
	FadeStand("st梢_制服_通常_sad", 300, true);}
//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01000040ko">
「…………っ」

//以上、リアル声
どうしたらいいか分からずもじもじしている梢の肩を、美菜子ではなく別の女子が小突いてきた。

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/chn04/01000050wa">
「ちょっと、なんとか言いなよ」

//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01000060ko">
「っ……」

//以上、リアル声
数人の女子に囲まれて、梢の目尻から涙が溢れ出す。
それを見て、周囲はあからさまに苛立ちを見せた。

//【美菜子】
<voice name="美菜子" class="美菜子" src="voice/chn04/01000070mk">
「いちいち泣いてんじゃねーよ。いいからちょっときなよ」

イヤな予感がして梢は拒否しようとした。
でも二の腕をつかまれていて、逃げることは許されなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3602", 1000, 0, null);
//ＢＧ//学校屋上
	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 500, 0, 1000, 200, null, "cg/data/left3.png", true);

	DeleteStand("st梢_制服_通常_sad", 0, true);
	Delete("back*");

	CreateSE("SE01","SE_日常_屋上扉_開く");
	CreateSE("SE3601","SE_自然_風音_LOOP");
	MusicStart("SE01",0,1000,0,1000,null,false);
	MusicStart("SE3601",2000,1000,0,1000,null,true);


	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");
	DrawTransition("黒", 500, 1000, 0, 200, null, "cg/data/right3.png", true);
	Delete("黒");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
連れてこられたのは屋上だった。

そこには、さらに１０人ほどの女子が待ち構えていた。
クラスメイトの女子がほぼ全員集まっていたのだ。
その事実に、梢は愕然となる。

これからなにが始まるのか、梢には予想がついた。
なにしろ集まっている全員から、梢に対する悪意がひしひしと伝わってくるのだ。

自分に向けられる大量の負の妄想を前にして、梢は身を震わせた。
どれだけ我慢しようと思っても、涙は止まらなかった。

//【女子Ｂ】
<voice name="女子Ｂ" class="女子Ｂ" src="voice/chn04/01000080wb">
「こいつ、もう泣いてんじゃん」

//【女子Ｃ】
<voice name="女子Ｃ" class="女子Ｃ" src="voice/chn04/01000090wc">
「うわ、マジ、ウザくない？」

あからさまな言葉を投げかけられた。
この学校に転校してきて初めてのことだった。

もちろん、周囲の女子が自分を嫌っていることに、梢はとっくに気付いていた。教室にいると、彼女たちの心の声が聞こえてくるからイヤでも気付いてしまうのだ。

でも、こうして面と向かって悪意を口に出されたのは今が初めてだった。

梢はこの場から逃げ出そうとした。
しかし十数人のクラスメイトに囲まれて、逃げ道は塞がれてしまう。

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/chn04/01000100wa">
「逃げようとしてんじゃねーよ。美菜子が話あるんだからさ。ちゃんと聞きな」

クラスメイトの言葉に促されるように、美菜子が威圧的な目付きで梢をにらんだ。

美菜子はモデルのように背が高く、小柄な梢とは対照的だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【美菜子】
<voice name="美菜子" class="美菜子" src="voice/chn04/01000110mk">
「折原、あんたさ、大輔に色目使ってんじゃないわよ」

大輔、と言われても、梢にはとっさに誰のことか思い浮かばなかった。
でもそれを口に出すことはできなくて、ただただ混乱した状態でさらに身を縮こまらせるのが精一杯。

//【美菜子】
<voice name="美菜子" class="美菜子" src="voice/chn04/01000120mk">
「聞いてんの！？　ウザいんだよ、あんた。人のカレシに手出そうとしてんなよ」

梢は必死で首を振った。
身に覚えはまったくなかった。

そこでようやく、大輔というのがクラスメイトの三住であることに気付く。梢にしてみれば色目を使ったつもりなどまったくなくて、むしろ下心丸出しの彼には迷惑していた。

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/chn04/01000130wa">
「っていうかぁ、前から折原のこと気に入らなかったんだよね」

//【女子Ｂ】
<voice name="女子Ｂ" class="女子Ｂ" src="voice/chn04/01000140wb">
「ねえ、なんで喋んないの？　かわいこぶってんの？」

//【女子Ｃ】
<voice name="女子Ｃ" class="女子Ｃ" src="voice/chn04/01000150wc">
「はっきり言ってウザすぎだし。ムカつくし」

//■３６０
//【女子Ｄ】
//「それとも、男子とは話せてもあたしたちとは話すつもりないって？　調子乗ってんじゃねーよ」
<voice name="女子Ｄ" class="女子Ｄ" src="voice/chn04/01000160wd">
「それとも、男子とは話せてもあたしたちとは話すつもりないって？　調子に乗ってんじゃねーよ」

//【女子Ｅ】
<voice name="女子Ｅ" class="女子Ｅ" src="voice/chn04/01000170we">
「なんか言えよブス！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_掴む");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Stand("st梢_制服_正面","sad", 200, @-150);
	FadeStand("st梢_制服_正面_sad", 300, true);
	Shake("st梢_制服_正面_sad*", 500, 5, 5, 0, 0, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01000180ko">
「っ！」

//以上、リアル声
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_正面_sad", 500, true);

	CreateSE("SE03","SE_じん体_掴む");
	CreateSE("SE04","SE_衝撃_びんたされる");
	CreateSE("SE05","SE_擬音_服がやぶれる");
	CreateSE("SE06","SE_じん体_掴む");
	CreateSE("SE07","SE_衝撃_びんたされる");
	CreateSE("SE08","SE_擬音_服がやぶれる");
	CreateSE("SE3620","SE_にん間_動作_手_はたく");
	CreateSE("SE3621","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE05", 0, 600, 0, 1000, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
髪を引っ張られた。<K>
{	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}
頬を叩かれた。<K>
{	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
肩を小突かれた。

逃げられない。
逃がしてくれない。

{	MusicStart("SE3620", 0, 700, 0, 1000, null, false);}
集団リンチ。イジメ。
そんな言葉が梢の脳裏に浮かび、恐怖に震える。

{	MusicStart("SE06", 0, 1000, 0, 1000, null, false);}
助けて、セナしゃん――
助けて、拓巳しゃん――

{	MusicStart("SE07", 0, 1000, 0, 1000, null, false);}
心の中で呼びかける。
でもそんなすぐに助けが来てくれるはずはない。

{	MusicStart("SE08", 0, 700, 0, 1000, null, false);}
東京に引っ越してくる前もそうだった。
梢がどれだけ助けを求めても、誰も助けてくれなかった。

{	MusicStart("SE3621", 0, 700, 0, 1000, null, false);}
だから耐えるしかない。
このくらいなら、まだ耐えられる――

そう思った刹那。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1000, 500, null);

//ＳＥ//ヒュンヒュンという機械的な音
//※１０月３日追加、以下
//※１０月３日追加、以上
	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん2_LOOP");
	MusicStart("SE03", 2000, 700, 0, 1000, null, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
どこからか、奇妙な音がかすかに響き始めた。

クラスメイトたちの顔から、一斉に表情が抜け落ちた。
そしてみんなが、一斉に上着のポケットに手を入れて。

示し合わせたかのように、ゆっくりと、なにかを取り出す。

それは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("鏡反射", 1000, 0, 0, 1280, 720, "White");
	Request("鏡反射", AddRender);
	Fade("鏡反射", 0, 0, null, true);
	Fade("鏡反射", 0, 500, null, true);
	DrawTransition("鏡反射", 100, 0, 1000, 200, null, "cg/data/ncentern2.png", true);
	DrawTransition("鏡反射", 150, 1000, 0, 200, null, "cg/data/ncenter2.png", false);
	FadeDelete("鏡反射", 100, true);

	Wait(500);

	BGMPlay360("CH01",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01000190ko">
「ぁ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//以上、リアル声

	CreateColor("鏡反射", 1000, 0, 0, 1280, 720, "White");
	Request("鏡反射", AddRender);
	Fade("鏡反射", 0, 0, null, true);
	Fade("鏡反射", 0, 500, null, true);
	DrawTransition("鏡反射", 100, 0, 1000, 200, null, "cg/data/check.png.png", true);
	DrawTransition("鏡反射", 150, 1000, 0, 200, null, "cg/data/ncenter2.png", false);
	FadeDelete("鏡反射", 100, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
手鏡。
みんな形は違うけれど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	CreateColor("鏡反射", 1000, 0, 0, 1280, 720, "White");
	Request("鏡反射", AddRender);
	Fade("鏡反射", 0, 0, null, true);
	Fade("鏡反射", 0, 500, null, true);
	DrawTransition("鏡反射", 100, 0, 1000, 200, null, "cg/data/斜めチェッカー.png", true);
	DrawTransition("鏡反射", 150, 1000, 0, 200, null, "cg/data/ncenter2.png", false);
	FadeDelete("鏡反射", 100, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603005]
全員が同時に、鏡面を、梢へと向けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	CreateColor("鏡反射", 1000, 0, 0, 1280, 720, "White");
	Request("鏡反射", AddRender);
	Fade("鏡反射", 0, 0, null, true);
	Fade("鏡反射", 0, 500, null, true);
	DrawTransition("鏡反射", 100, 0, 1000, 200, null, "cg/data/放射状.png", true);
	DrawTransition("鏡反射", 150, 1000, 0, 200, null, "cg/data/ncenter2.png", false);
	FadeDelete("鏡反射", 100, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604005]
それはさながら儀式のようで。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	CreateColor("鏡反射", 1000, 0, 0, 1280, 720, "White");
	Request("鏡反射", AddRender);
	Fade("鏡反射", 0, 0, null, true);
	Fade("鏡反射", 0, 500, null, true);
	DrawTransition("鏡反射", 100, 0, 1000, 200, null, "cg/data/light10.png", true);
	DrawTransition("鏡反射", 150, 1000, 0, 200, null, "cg/data/ncenter2.png", false);
	FadeDelete("鏡反射", 100, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605005]
そして、すべての鏡に梢の、怯え、瞳を痙攣させている姿が映り込んでいて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("黒幕", 150, 0, 0, 1280, 720, "Black");

//◆以下、同時
//おがみ：音声：以下、同時発声加工したほうがよいのではと思うがスクリプトで再現

//【女子Ａ】
//<voice name="女子Ａ" class="女子Ａ" src="voice/chn04/01000200wa">
//「お前は誰？」

//【女子Ｂ】
//<voice name="女子Ｂ" class="女子Ｂ" src="voice/chn04/01000210wb">
//「お前は誰？」

//【女子Ｃ】
//<voice name="女子Ｃ" class="女子Ｃ" src="voice/chn04/01000220wc">
//「お前は誰？」

//【女子Ｄ】
//<voice name="女子Ｄ" class="女子Ｄ" src="voice/chn04/01000230wd">
//「お前は誰？」

//【女子Ｅ】
//<voice name="女子Ｅ" class="女子Ｅ" src="voice/chn04/01000240we">
//「お前は誰？」

//【美菜子】
//<voice name="美菜子" class="美菜子" src="voice/chn04/01000250mk">
//「お前は誰？」


	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 200, @40, @320, Auto, Auto, "「お前は誰？」");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト２", 200, @160, @400, Auto, Auto, "「お前は誰？」");
	Request("テキスト２", NoLog);
	Request("テキスト２", Erase);
	Request("テキスト２", Enter);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト３", 200, @312, @120, Auto, Auto, "「お前は誰？」");
	Request("テキスト３", NoLog);
	Request("テキスト３", Erase);
	Request("テキスト３", Enter);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト４", 200, @496, @304, Auto, Auto, "「お前は誰？」");
	Request("テキスト４", NoLog);
	Request("テキスト４", Erase);
	Request("テキスト４", Enter);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト５", 200, @680, @40, Auto, Auto, "「お前は誰？」");
	Request("テキスト５", NoLog);
	Request("テキスト５", Erase);
	Request("テキスト５", Enter);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト６", 200, @800, @464, Auto, Auto, "「お前は誰？」");
	Request("テキスト６", NoLog);
	Request("テキスト６", Erase);
	Request("テキスト６", Enter);


//おがみ：音声：お前は誰？　読み込み修正のため結合依頼
//	CreateVOICE("女子Ａ","chn04/01000200wa_a");
//	CreateVOICE("女子Ｂ","chn04/01000210wb_a");
//	CreateVOICE("女子Ｃ","chn04/01000220wc_c");
//	CreateVOICE("女子Ｄ","chn04/01000230wd_a");
//	CreateVOICE("女子Ｅ","chn04/01000240we_a");
//	CreateVOICE("美菜子","chn04/01000250mk_a");

	CreateVOICE("モブ全員","chn04/01000200w_m");


//	SoundPlay("女子Ａ",0,1000,false);
//	SoundPlay("女子Ｂ",0,1000,false);
//	SoundPlay("女子Ｃ",0,1000,false);
//	SoundPlay("女子Ｄ",0,1000,false);
//	SoundPlay("女子Ｅ",0,1000,false);
//	SoundPlay("美菜子",0,1000,false);

	SoundPlay("モブ全員",0,1000,false);

	SetBacklog("「お前は誰？」", "voice/chn04/01000200wa_a", 女子Ａ);
	SetBacklog("「お前は誰？」", "voice/chn04/01000210wb_a", 女子Ｂ);
	SetBacklog("「お前は誰？」", "voice/chn04/01000220wc_c", 女子Ｃ);
	SetBacklog("「お前は誰？」", "voice/chn04/01000230wd_a", 女子Ｄ);
	SetBacklog("「お前は誰？」", "voice/chn04/01000240we_a", 女子Ｅ);
	SetBacklog("「お前は誰？」", "voice/chn04/01000250mk_a", 美菜子);

	Wait(2000);

	FadeDelete("テキスト*", 1000, false);

	Fade("黒幕", 1000, 0, null, true);
	Delete("黒幕");

	CreateSE("SEお前","SE_はいけい_おまえだれ_LOOP");

	Stand("st梢_制服_拒絶","pinch", 200, @-100);
	FadeStand("st梢_制服_拒絶_pinch", 300, true);

	MusicStart("SEお前",1000,1000,0,1000,null,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆以上、同時
//「お前は誰？」はＳＥ扱いで何度か言わせ続ける
//おがみ：SE：追加モブ音声「お前は誰？」
かつての悪夢が、梢の中でよみがえる。
自分が自分でなくなる。
身体の震えが止まらない。

//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01000260ko">
「ぁ……ぁぁ……っ」

//以上、リアル声
いやいやをするように激しく首を振る。
その目は鏡の一つ一つの間をさまよう。
ブルブルと、なおも瞳は痙攣を続ける。

//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01000270ko">
「ぃ……ゃ……っ」

{	DeleteStand("st梢_制服_拒絶_pinch", 300, true);}
//以上、リアル声
梢の喉から、声にならない叫びがこだまして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	SetVolume360("SEお前", 5000, 0, null);

	CreateColor("黒幕", 110, 0, 0, 1280, 720, "Black");
	Fade("黒幕", 0, 0, null, true);
	DrawTransition("黒幕", 0, 300, 300, 300, null, "cg/data/effect.png", true);

	Fade("黒幕", 2000, 600, null, true);
	DrawTransition("黒幕", 6000, 300, 1000, 300, null, "cg/data/effect.png", false);
	Fade("黒幕", 2000, 1000, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる！

意識が、どす黒い妄想に支配された。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ディソード顕現
	CreateSE("SE04","SE_擬音_ディそーど出現");

	CreateTextureEX("剣エフェクト", 300, 0, 96, "cg/bg/bg244_01_6_chnディソード全体_梢_a.jpg");
	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 0, 0, null, true);

	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	Fade("フラッシュ", 200, 1000, null, true);
	Fade("剣エフェクト", 0, 1000, null, true);

	Delete("黒幕");

	CreateSE("SE01","SE_擬音_ディそーどかまえる");
	MusicStart("SE01",0,1000,0,1000,null,false);


	Move("剣エフェクト", 1000, @0, @-96, Dxl1, false);
	FadeDelete("フラッシュ", 1000, true);
	Fade("剣エフェクト", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
気が付けば、その手にディソードを掲げ持っていて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――



	CreateSE("SE05","SE_擬音_共鳴音_激しい_LOOP");
	MusicStart("SE05", 1000, 1000, 0, 1000, null, true);
	CreateColor("赤フラッシュ", 1000, 0, 0, 1280, 720, "Red");
	Request("赤フラッシュ", AddRender);
	Fade("赤フラッシュ", 0, 0, null, true);
	Fade("剣エフェクト", 200, 1000, null, false);
	Fade("赤フラッシュ", 200, 800, null, true);
	FadeDelete("赤フラッシュ", 200, false);
	FadeDelete("剣エフェクト", 500, false);

	CreateSE("SE06","SE_擬音_ちを蹴る");

	SetVolume("SE05", 5000, 0, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
その身を走る赤く淡い光が、歓喜の悲鳴を上げるように明滅する。
凶暴さを隠そうともせず。見る者すべてを威圧し。

あらゆるものを砕き、あらゆるものを呑み込み、あらゆるものを無に帰そうと、今、妄想ではなく現実の姿をまとった。

{	SetVolume("SE03", 3000, 0, null);}
それまで無表情で梢に鏡を向けていたクラスメイトたちが、ハッと我に返った。

だが――

もう手遅れだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("st梢_制服_武器構え2","cry", 200, @+150);
	FadeStand("st梢_制服_武器構え2_cry", 200, true);

	Wait(200);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01000280ko">
「ぁ――！」

//以上、リアル声
涙を流しながら、梢が絶叫する。
その目はもはやなにも見ていない。

{	DeleteStand("st梢_制服_武器構え2_cry", 300, false);
	MusicStart("SE06", 0, 1000, 0, 1000, null, false);}
よろけるようにして、梢は一歩前へと踏み出し。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("@CH*", 500, 0, null);

	CreateColor("剣閃", 1000, 0, 0, 1280, 720, "Red");
	Request("剣閃", AddRender);
	Fade("剣閃", 0, 0, null, true);

	CreateSE("SE07","SE_擬音_ディそーど1");
	CreateSE("SE3607","SE_じん体_心臓_鼓動");
	MusicStart("SE07", 0, 1000, 0, 1000, null, false);

	Fade("剣閃", 0, 800, null, true);
	CreateMovie360("剣ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");
//	Request("剣ムービー", Play);
	FadeDelete("剣閃", 500, false);

//	WaitAction("剣ムービー", null);
	Wait(500);
	Fade("剣ムービー", 500, 0, null, true);
	Delete("剣ムービー");

	MusicStart("SE3607", 0, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603007]
軽々と、ディソードを振り上げた。

その間合いの内に、美菜子がいた。

一刀両断という表現がふさわしかった。

美菜子の左脇下から右肩にかけて。

断裂した。

斬る、という表現はあまりに生ぬるい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//※１０月３日修正、以下
//すさまじい量の肉塊がぶちまかれた。
//※１０月３日修正、以上

	CreateSE("SE08","SE_じん体_血_噴きでる");
	CreateSE("SE3608","SE_じん体_血_噴きでる");
	MusicStart("SE08", 0, 1000, 0, 1000, null, false);
	MusicStart("SE3608", 0, 1000, 0, 1000, null, false);

	CreateColor("血", 2100, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 200, null, true);
	CreateMovie360("血ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");

//	Request("血ムービー", Play);


	WaitAction("血ムービー", null);
	Fade("血", 500, 0, null, false);
	Fade("血ムービー", 500, 0, null, true);
	Delete("血ムービー");



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
すさまじい量の血が飛び散った。

梢は振り上げたディソードに引っ張られるように、今度は後ろ側へとよろけて。

そのまま身を翻し、踊るように回る。
巨大な剣を、小柄な身体で軽々と振り回して。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");

	CreateSE("SE08","SE_擬音_びちゃ");
	CreateSE("SE09","SE_擬音_ディそーど_コンクリート砕く");
	MusicStart("SE08", 0, 1000, 0, 1000, null, false);
	MusicStart("SE09", 0, 1000, 0, 1000, null, false);
	CreateColor("赤フラッシュ", 1000, 0, 0, 1280, 720, "Red");
	Request("赤フラッシュ", AddRender);
	Fade("赤フラッシュ", 0, 0, null, true);
	Shake("back01", 500, 0, 10, 0, 0, 500, null, false);
	Fade("赤フラッシュ", 0, 800, null, true);
	Fade("赤フラッシュ", 500, 0, null, true);


//※１０月３日修正、以下
//肉塊と化し倒れた美菜子の頭へ、寝かせたディソードを振り下ろす。
//骨が砕け液体が爆散する音とともに頭部は叩き潰された。
//原形は一瞬で失われた。
//その剣の動きに合わせるかのように、梢はストンと膝を突く。
//これほど残虐な殺し方をしていながら、顔は泣きじゃくっていて、その涙のせいで、目は閉じていた。
//たった今、自分がミンチにした相手が誰なのかさえ、認識していなかった。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
すでに絶命している美菜子に、さらなる追い打ちを叩き込む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("赤フラッシュ", 0, 800, null, true);

	CreateSE("SE12","SE_じん体_血_噴きでる");
	CreateSE("SE10","SE_擬音_びちゃ");
	CreateSE("SE11","SE_擬音_ディそーど落ちる");


	MusicStart("SE10", 0, 1000, 0, 1000, null, false);
	MusicStart("SE11", 0, 1000, 0, 1000, null, false);
	MusicStart("SE12", 0, 1000, 0, 1000, null, false);

	Shake("back01", 500, 0, 10, 0, 0, 500, null, false);

	FadeDelete("赤フラッシュ", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3611008]
鮮血が舞い、剣を、梢の身体を、コンクリートを赤く染める。

つい数秒前まで“美菜子だったもの”が倒れ伏すのと、梢が脱力したようにストンと膝を突いたのは、同時だった。

梢は泣きじゃくっていて、その涙のせいで、目は閉じていた。

//※１０月３日修正、以上
あまりの光景に、クラスメイトたちはポカンとだらしなく口を半開きにして、声もなく立ち尽くしていた。

目の前で起きたことを、理解できていないようだった。

梢が、ゆらりと立ち上がる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("st梢_制服_武器構え2_血まみれ","sad", 200, @+50);
	Move("st梢_制服_武器構え2_血まみれ_sad*", 0, @0, @50, null, true);
	Move("st梢_制服_武器構え2_血まみれ_sad*", 1000, @0, @-50, Axl1, false);
	FadeStand("st梢_制服_武器構え2_血まみれ_sad", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//以下、リアル声
//◆リアル声//◆泣く
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01000290ko">
「っ、……っ」

//以上、リアル声
うなだれて、しゃくり上げながら。

血の滴るディソードを、凍り付いているクラスメイトたちへ向けた。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01000300ko">
「殺してやる――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(200);

//ＢＧ//赤
//▼べー：ＳＥ：暫定です。調整をお願い致します。
//ＳＥ//斬ったり血が飛び散ったり肉がぐちゃぐちゃしたり
	SetVolume("SE03", 5000, 0, null);
	CreateSE("SE10","SE_擬音_梢ディそーど_振り回す");
	CreateSE("SE3610","SE_擬音_ディそーど_人を切る");
	MusicStart("SE10", 0, 1000, 0, 1000, null, false);
	MusicStart("SE3610", 0, 1000, 0, 1000, null, false);
	Shake("st梢_制服_武器構え2_sad*", 500, 0, 20, 0, 0, 500, null, false);
	Shake("back01", 500, 0, 20, 0, 0, 500, null, false);
	Wait(200);
	Fade("血", 0, 1000, null, true);
	DeleteStand("st梢_制服_武器構え2_血まみれ_sad", 0, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603008]
その後に響いた、いくつもの悲鳴は、ほんの数秒で聞こえなくなった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//	SetVolume("SE01", 1000, 0, null);
//～～Ｆ・Ｏ

	SetVolume("SE*", 2000, 0, null);

//インターミッションＫ１終了
//※アイキャッチ
//拓巳視点に戻る

	ClearAll(2000);
	Wait(1000);
}