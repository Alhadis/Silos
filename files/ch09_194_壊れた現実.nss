//<continuation number="270">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_194_壊れた現実";
		$GameContiune = 1;
		Reset();
	}

		ch09_194_壊れた現実();
}


function ch09_194_壊れた現実()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("back05", 100, 0, 0, 1280, 720, null, "Black");

//※拓巳視点に戻る
//ＢＧ//拓巳の部屋

	CubeRoom4("room", 100, 0);
	MoveCube("room", 10, -100, -100, 100, Axl2, true);
	Rotate("room", 10, 0, -90, 0, AxlDxl, true);
	Fade("room", 500, 1000, null, true);
	SetAlias("room", "room");

	Delete("back05");

/*キョロキョロプロセス１*/
	CreateProcess("プロセス１", 1000, 0, 0, "Staring");
	Request("プロセス１", Start);

//ＳＥ//ヒュンヒュンという機械的な音（ドアの外で聞こえているものなので音は小さめ）
//ＳＥは以下しばらく続きます

	CreateSE("SE01","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE01", 1000, 200, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆狂気の笑み
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400010ta">
「ふひ……ふひひ……ひひひひ……」

七海が跡形もなく消えた。

僕の目の前で、泡になった。
実体なんて存在しなかった。

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400020ta">
「なな……な、なみ……どこだよ……で、出て、きてよ……ふひ……ひ……」

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400030ta">
「い、いるんだろ、また、いた、いたずらか……ふひひ……かくれ、れてるんだ……や、やめろよ……ふひ……ふひひひ……」

涙のせいで、視界がぼやけている。
拭いても拭いても湧き出てくる……熱い雫。

でもこの熱ささえも。
そして涙を流させている感情さえも。

妄想だ。

僕そのものが、妄想なんだから。

七海は、妄想だった。
一瞬でも、期待した僕がバカだった。
希望はあっさり打ち砕かれた。

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400040ta">
「ね、ねえ、いつ……この妄想って、さ、覚めるの……？
早く、覚めてよ……」

誰に対して話しかけているのか、自分でもよく分からないけど。とにかく、誰でもいいから、聞いてもらいたかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400050ta">
「こ、この妄想が覚めたら、ぼ、僕は、ホン、ホントはイケメン、なんだ、そ、そうに決まってる……。も、物分かりの、いい、妹と、や、優しい、姉が、いるんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400060ta">
「か、かわいい、カノジョと、付き、合ってて……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400070ta">
「その子は、り、梨深とか、セナ、みたいな、デンパ女、じゃなくて……せ、星来たんみたいな、いい子……なんだ……ふひひ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);
	Fade("back04", 200, 1000, null, true);

	Delete("プロセス１");
	Rotate("room", 10, 0, -90, 0, Dxl1, true);

//ＶＦ//回想セリフ
//【梨深】
//<voice name="梨深" class="梨深" src="voice/ch09/19400080ri">
//「あなたは……妄想の存在なんだよ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 1000, center, middle, Auto, Auto, "「あなたは……妄想の存在なんだよ」");
	Move("テキスト１", 0, @10, @0, null, true);
	SetBacklog("「あなたは……妄想の存在なんだよ」", "voice/ch09/18100010ri", 梨深);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);

	CreateVOICE("梨深","ch09/18100010ri");
	SoundPlay("梨深",0,1000,false);

	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);
	Wait(2000);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("back04", 1000, true);

	Rotate("room", 1000, -55, -100, 0, Axl1, true);

	CreateSE("SE10","SE_衝撃_どんがらがっしゃーん");
	MusicStart("SE10", 0, 500, 0, 1000, null, false);
	CreateSE("SE11","SE_衝撃_ぺっとぼとる");
	MusicStart("SE11", 0, 1000, 0, 1000, null, false);

	MoveCube("room", 500, -100, -200, 100, Dxl2, true);

	Wait(500);

	CreateSE("SE12","SE_衝撃_ぺっとぼとる");
	MusicStart("SE12", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
床に這いつくばり、ゴミの山の中に頭を埋め、星来たんを握りしめ。

{	CreateColor("back03", 300, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 300, 1000, null, true);
	CreateSE("SE02","SE_衝撃_どさっ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
//ＳＥ//床を拳で叩く
拳を床に打ち付けて、現実から必死で目をそらそうとする。
でもできない。
梨深の言葉が、容赦なく僕の頭の中で繰り返される。

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400090ta">
「し、死にたい……うう、死にたいよぅ……」

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400100ta">
「どうして、だ、誰も、ぼ、僕を、殺して、く、くれないんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400110ta">
「ねえ、星来たん……殺して……僕を殺して……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒後_通常","normal", 200, @0);
	FadeStand("bu星来_覚醒後_通常_normal", 0, true);
	Fade("back03", 500, 0, null, true);
	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19400120se">
「そんなに死にたいの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400130ta">
「死にたい……こんなの、もう……イヤだ……。
自分の存在が……イヤだ……。
なにも、考えたく、ない……。生きていたくない……」

{	Stand("bu星来_覚醒後_通常","sad", 200, @0);
	FadeStand("bu星来_覚醒後_通常_sad", 300, true);
	DeleteStand("bu星来_覚醒後_通常_normal", 0, true);}
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19400140se">
「かわいそうなタッキー」

{	Stand("bu星来_覚醒後_通常","happy", 200, @0);
	FadeStand("bu星来_覚醒後_通常_happy", 300, true);
	DeleteStand("bu星来_覚醒後_通常_sad", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19400150se">
「だったら、すぐに殺される方法を教えたげる」

ああ、さすが僕の嫁だ……。
星来たんはいつだって健気に僕に尽くしてくれる。

{	Stand("bu星来_覚醒後_通常","normal", 200, @0);
	FadeStand("bu星来_覚醒後_通常_normal", 300, true);
	DeleteStand("bu星来_覚醒後_通常_happy", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19400160se">
「とりあえず、外に出るんさ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400170ta">
「外……に？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu星来_覚醒後_通常_normal", 500, true);
	CreateSE("SE10","SE_衝撃_ひととぶつかる");
	MusicStart("SE10", 0, 300, 0, 1000, null, false);
	CreateBG(100, 500, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	CreateSE("SE11","SE_衝撃_ぺっとぼとる");
	MusicStart("SE11", 0, 1000, 0, 1000, null, false);
	Delete("room");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
僕は言われるままに立ち上がると、ゴミに足を取られて何度も転びそうになりながら、ベースから出た。

そうすることに、なんの疑問も抱かなかった。
星来たんだけは僕を裏切らない。
だって僕の嫁だから。三次元の女じゃないから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//コンテナハウスの扉を開く

	CreateSE("SE02","SE_日常_扉_開ける");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateBG(100, 500, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");

//ＢＧ//ＫＵＲＥＮＡＩ会館屋上//夜
//ＳＥ//ヒュンヒュンという機械的な音（はっきり聞こえるようになる）

	SetVolume("SE01", 500, 500, NULL);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg006_01_3_コンテナ外観_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg006_01_3_コンテナ外観_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
外に出ると、妙な音が耳に付いた。
この音……前にも、どこかで聞いたことがあるような……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒後_通常","normal", 200, @0);
	FadeStand("bu星来_覚醒後_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19400180se">
「この音を追いかけて」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400190ta">
「追いかけたら……殺して、もらえる……の？」

//【星来】
<voice name="星来" class="星来" src="voice/ch09/19400200se">
「そういうこと」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400210ta">
「や、優しく、殺して、もらえるかな……」

{	Stand("bu星来_覚醒後_通常","happy", 200, @0);
	FadeStand("bu星来_覚醒後_通常_happy", 300, true);
	DeleteStand("bu星来_覚醒後_通常_normal", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19400220se">
「あたしが保証するよ♪」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400230ta">
「よかった……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400240ta">
「やっと、し、死ねる……ふひ、ふひひ……」

この音は、僕にとっての救世主。
僕を安らかな地へ誘ってくれる救いの鐘。

{	DeleteStand("bu星来_覚醒後_通常_happy", 500, true);}
星来たんを持ったまま、僕は音のする方へと歩き出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//夜空
	CreateBG(100, 1000, 0, 0, "cg/bg/bg206_01_3_夜空_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
音は、まるで僕を先導しているかのように、近づいては離れるのを繰り返した。

僕が追いつきそうになると、急速に遠くなる。
僕が音の方向を見失いそうになると、近づいてきて僕を待ってくれる。

意志でもあるかのようだった。

意志のある音――

『将軍』の存在を連想し、その顔が脳裏にちらついたけど、すぐにどうでもよくなった。

ヤツだろうとそうじゃなかろうと、僕を殺してくれるのなら誰でも構わない。

この音の正体がなんなのかについても、考えるのはやめた。あと少しで死ぬんだし、僕は妄想の存在なんだから、考えたって無意味だ。

頭の中を真っ白にして、光に群れる蛾のように、ほとんど無意識に、僕は音をふらふらと追いかける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back05", 100, 0, 0, 1280, 720, "Black");
	Fade("back05", 0, 0, null, false);
	Fade("back05", 1000, 1000, null, true);
	CreateSE("SE02","SE_はいけい_すくらんぶる交差点ガヤ_どよめき_LOOP");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//ＳＥ//ザワザワ
周囲が騒がしくなった。
音が、聞き取れなくなる。
僕は舌打ちし、このうるささの原因を確かめようとして――

ギクリとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);
	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん2_LOOP");
	MusicStart("SE03", 500, 500, 0, 1000, null, true);


//ＢＧ//スクランブル交差点//夜
	CreateBG(100, 1000, 0, 0, "cg/bg/bg085_04_3_スクランブル交差点_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
いつの間にか僕は、スクランブル交差点に立っていた。

騒がしさは、この交差点を埋め尽くした、ものすごい数の人だかりからのものだと気付く。

ほとんど寿司詰め状態。朝の通勤電車みたいに、みんな押し合いへし合いしていた。

前に僕がＯ－ＦＲＯＮＴの上から生中継されたときより、
さらに多い人の数だった。

そう言えば、グリムがチャットに書き込んでいた。今夜、スクランブル交差点で祭りが起きるって。

星来、いったいどういうことなの？
この場所には、イヤな思い出しかないのに。
どうしてこの場所に連れてきたんだよぅ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒後_通常","happy", 200, @0);
	FadeStand("bu星来_覚醒後_通常_happy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19400250se">
「リベンジってこと」

それに、僕を殺してくれる人が、どこにいるって言うんだ。

//【星来】
<voice name="星来" class="星来" src="voice/ch09/19400260se">
「目の前にいるっしょ♪」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19400270ta">
「目の……前……」

{	DeleteStand("bu星来_覚醒後_通常_happy", 500, true);}
ものすごい数の群衆。
この肌寒い秋の夜に。

立錐の余地もないくらいの人が集まった“祭り”って、いったいなんだ……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("４４");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

}

/*森島プロセス用function*/
function Staring()
{
	while(1)
	{
	$ran1 = Random(6) + 1;
	$ran2 = Random(5) + 1;
	$ran = $ran1 - $ran2;
	$angle = $ran * 10;
	Rotate("@room", 5000, $angle, @+20, @0, AxlDxl, true);
	Rotate("@room", 6000, @-40, @-30, @0, Dxl1, true);
	$bayran = Random(4) + 1;
	$bay = $bayran * 100;
	Wait($bay);
	Rotate("@room", 3500, $angle, @0, @0, Dxl1, true);
	Rotate("@room", 5000, 0, -90, 0, Dxl1, true);
	}

}