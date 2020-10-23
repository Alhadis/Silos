//<continuation number="30">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_184_消えてしまいたい";
		$GameContiune = 1;
		Reset();
	}

		ch09_184_消えてしまいたい();
}


function ch09_184_消えてしまいたい()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//※拓巳視点に戻る
//ＢＧ//黒
//ＳＥ//コンテナハウスの扉が閉まる

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

	Wait(1000);

	CreateSE("SE02","SE_日常_扉_閉まる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
すべての気力を失って。
気が付けば、僕はベースにいた。

山手通りで死に損なってから、ここまでどうやって戻ってきたのか、
記憶がはっきりしない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18400010ta">
「このコンテナって……
誰が、どうやって、ここまで運んだんだろう……」

今まで疑問にすら思わなかったこと。改めて考えると少しおかしいと感じることが、目に付く。僕をますます追い詰める。

扉を閉めると、室内は真っ暗になった。
僕は扉に寄りかかって、立ち尽くす。

静かな部屋の中に、ＰＣのファンがうなる音と、僕の浅い呼吸音だけが響いている。

暗闇の中にいると、醜い自分を意識しなくてもよくなるかもしれない、なんて思ったけど、逆効果だった。

なにも見えず、とても静かなせいもあって、さっき梨深に言われたあの残酷な言葉が頭の中で延々とリピートされる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＶＦ//回想セリフ
//【梨深】
//<voice name="梨深" class="梨深" src="voice/ch09/18400020ri">
//「あなたは……妄想の存在なんだよ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 1000, center, middle, Auto, Auto, "「あなたは……妄想の存在なんだよ」");
	Move("テキスト１", 0, @10, @0, null, true);

	CreateVOICE("梨深","ch09/18400020ri");
	SoundPlay("梨深",0,1000,false);

	SetBacklog("「あなたは……妄想の存在なんだよ」", "voice/ch09/18400020ri", 梨深);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	$待ち時間 = RemainTime ("梨深");
	$待ち時間 += 2000;
	WaitKey($待ち時間);

	SetVolume("梨深", 0, 0, NULL);

	FadeDelete("テキスト１", 1000, true);
	CreateTextureEX("back01", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18400030ta">
「うぅぅ……」

自分のうめき声が、どうしようもなくキモく感じた。吐き気さえ覚えた。

ただでさえキモい僕なのに、存在として奇形だったら、もう救いようがない。

消えてしまいたい――

僕は床に散乱しているゴミに足を取られながら、部屋の奥までのろのろと進んでいった。

//	CraeteBG(100, 500, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
//ＢＧ//拓巳の部屋（ＰＣ前）
{	Fade("back01", 500, 1000, null, true);}
明かりを点け、闇を追い払う。
{	CreateTextureEX("back10", 100, 0, 0, "cg/bg/bg000_06_1_chnチャットサンプル_a.jpg");
	Fade("back10", 500, 1000, null, true);}
ちょうど目に入った星来たんフィギュア（覚醒後バージョン）をつかみ、イスに倒れ込んだ。

星来たんを胸元に抱き寄せる。

彼女はとても小さく。
そしてとても硬い。
息もしていないし、なにも喋ってくれない。

三次元の女子のような温もりは、ない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("back01");
	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
それでも今の僕には、星来たんしかいなかった。

梨深は僕の前から去っていった。

七海は行方不明。

セナは僕に襲いかかってきたし。

こずぴぃも僕を守ってくれなかった。

優愛は敵。

そしてあやせは入院中。

僕が名前を知っている女子は、それだけ。
そして誰も、僕のためになにかをしてなんてくれない。

現実は甘くない。
僕みたいな化け物なんて眼中にないんだ。

震える手で、星来たんを握りしめる。
きつく、きつく。
折れそうなほどに。

消えてしまいたい――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("４２");
	TypeBegin();//――――――――――――――――――――――――――――――


	EndTrigger();

}