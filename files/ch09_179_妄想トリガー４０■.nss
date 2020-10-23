//<continuation number="660">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_179_妄想トリガー４０■";
		$GameContiune = 1;
		Reset();
	}

		ch09_179_妄想トリガー４０■();
}


function ch09_179_妄想トリガー４０■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー
//ポジティブ妄想→分岐１
//ネガティブ妄想→分岐２
//妄想しない→分岐３

if($妄想トリガー通過４０ == 0)
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
			$妄想トリガー４０ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー４０ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー４０ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー４０ == 2)
{
//☆☆☆
//分岐１
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	BoxDelete(0);

	DelusionFakeCut();

//ＢＧ//黒

//【梨深】
//<voice name="梨深" class="梨深" src="voice/ch09/17900010ri">
//「これ以上、妄想しちゃダメ」
	SetFont("ＭＳ ゴシック", 26, #000000, #FFFFFF, 500, LIGHTDOWN);
	CreateText("テキスト１", 1000, center, middle, Auto, Auto, "「これ以上、妄想しちゃダメ」");
	Move("テキスト１", 0, @10, @0, null, true);

	CreateVOICE("梨深０１","ch09/17900010ri");
	SoundPlay("梨深０１",0,1000,false);

	SetBacklog("「これ以上、妄想しちゃダメ」", "voice/ch09/17900010ri", 梨深);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	$待ち時間 = RemainTime ("梨深０１");
	$待ち時間 += 1000;
	WaitKey($待ち時間);

//	FadeDelete("テキスト１", 500, true);

/*
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900010ri">
「これ以上、妄想しちゃダメ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
*/

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//下北沢の街並み//夕方

	DelusionOut();

	Delete("テキスト１");

	DelusionFakeCut2();

	CreateBG(100, 0, 0, 0, "cg/bg/bg057_01_2_下北沢拓巳の家_a.jpg");

	Stand("bu梨深_制服_通常","angry", 200, @+150);
	FadeStand("bu梨深_制服_通常_angry", 0, true);

	DelusionOut2();
	PositiveHuman();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
妄想に逃げ込もうとする僕の心は、梨深の声によって強制的に引き戻される。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流１へ

}


//=============================================================================//

if($妄想トリガー４０ == 1)
{
//☆☆☆
//分岐２
//※分岐１と内容まったく同じです
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	BoxDelete(0);

	DelusionFakeCut();


//ＢＧ//黒


//【梨深】
//<voice name="梨深" class="梨深" src="voice/ch09/17900020ri">
//「これ以上、妄想しちゃダメ」
	SetFont("ＭＳ ゴシック", 26, #000000, #FFFFFF, 500, LIGHTDOWN);
	CreateText("テキスト１", 1000, center, middle, Auto, Auto, "「これ以上、妄想しちゃダメ」");
	Move("テキスト１", 0, @10, @0, null, true);

	CreateVOICE("梨深０２","ch09/17900020ri");
	SoundPlay("梨深０２",0,1000,false);

	SetBacklog("「これ以上、妄想しちゃダメ」", "voice/ch09/17900020ri", 梨深);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	$待ち時間 = RemainTime ("梨深０２");
	$待ち時間 += 500;
	WaitKey($待ち時間);

/*
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900020ri">
「これ以上、妄想しちゃダメ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
*/

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//下北沢の街並み//夕方
	DelusionOut();
	BoxDelete(0);

	Delete("テキスト１");

	DelusionFakeCut2();

	CreateBG(100, 0, 0, 0, "cg/bg/bg057_01_2_下北沢拓巳の家_a.jpg");

	Stand("bu梨深_制服_通常","angry", 200, @+150);
	FadeStand("bu梨深_制服_通常_angry", 0, true);

	DelusionOut2();
	NegativeHuman();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
妄想に逃げ込もうとする僕の心は、梨深の声によって強制的に引き戻される。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//合流１へ
}


//=============================================================================//

if($妄想トリガー４０ == 0)
{
//☆☆☆
//分岐３

	BoxDelete(0);

	CreateBG(100, 0, 0, 0, "cg/bg/bg057_01_2_下北沢拓巳の家_a.jpg");
	DrawTransition("back*", 300, 0, 1000, 100, null, "cg/data/lcenter.png", true);

	Stand("bu梨深_制服_通常","angry", 200, @+150);
	FadeStand("bu梨深_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900030ri">
「妄想は、しないで」

静かな、そして切実な、命令口調。
僕はゴクリと息を呑む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//合流１へ
}


//=============================================================================//

//☆☆☆
//合流１


	Stand("bu梨深_制服_正面","sad", 200, @+150);
	DeleteStand("bu梨深_制服_通常_angry", 500, false);
	FadeStand("bu梨深_制服_正面_sad", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900040ri">
「でないとあたし、タクを消さなくちゃいけなくなる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900050ta">
「こ、殺すの……！？」

戦慄が背中を駆け抜ける。

梨深への認識が、僕を救ってくれる女の子から、得体の知れない存在へと変わっていく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900060ta">
「殺すんだなっ！？　やっぱり、君が殺人犯なんだ……！」

{	CreateSE("SE10","SE_自然_風音_LOOP");
	MusicStart("SE10", 500, 400, 0, 1000, null, true);}
//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900070ri">
「…………」

だから、どうしてそんな顔をするんだよ……。

{	DeleteStand("bu梨深_制服_正面_sad", 500, true);
	Stand("st梨深_制服_正面","sad", 200, @+150);
	FadeStand("st梨深_制服_正面_sad", 500, true);}
そんな、泣きそうな顔をして、唇を噛んで、うなだれているから。
責めることをためらってしまう。

“実は嘘でした”って言ってよ。
“びっくりした？”って、いたずらげに笑ってよ。

そうすれば、またこれまでみたいな関係に戻れるんだ。
戻りたいんだ、僕は。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900080ta">
「だったら、僕は……なんなの……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900090ri">
「ギガロマニアックスの妄想によって作られた人間、かな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900100ta">
「……バ、バカらしい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900110ta">
「ぼ、僕には、ちゃんと、き、記憶が、あるんだ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900120ta">
「ちゅ、中学の頃の、細かい記憶は、思い出せないけど。わ、忘れちゃっただけで」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","hard", 200, @+150);
	DeleteStand("st梨深_制服_正面_sad", 500, false);
	FadeStand("st梨深_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900130ri">
「あなたが生まれたのは、１年半前なの」

１年半前だって！？
僕が高校に入学した時期だ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900140ta">
「だったら、ぼ、僕は、１歳半の赤ん坊っていうことじゃないか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900150ta">
「バブバブ言ってなくちゃ……おかしい……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900160ri">
「タクは生まれた瞬間からタクだった」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900170ta">
「き、君が、その目で見たって、言いたいの？　確かに僕らは、１年半前から、友達、だった、らしいね。ぼ、僕は、覚えてないけど……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900180ri">
「あたしとあなたが会ったのは、１ヶ月前」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900190ri">
「あの、『張り付け』の現場」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900200ri">
「あたしは元々、翠明の生徒じゃないから」

梨深は、デンパだ。
梨深も、デンパだった。

セナやあやせとは比べものにならないくらいの、スーパーデンパ女だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900210ta">
「だ、誰が、僕を、妄想したの？　言って、みてよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900220ri">
「ニシジョウタクミくんだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900230ta">
「はい、ダ、ダウト～。ぼ、僕は、妄想なんでしょ？　その僕が妄想して、僕を作ったって？　矛盾してるじゃないか。はい、論破、し、終了」

{	Stand("st梨深_制服_正面","sad", 200, @+150);
	DeleteStand("st梨深_制服_通常_hard", 500, false);
	FadeStand("st梨深_制服_正面_sad", 500, true);}
//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900240ri">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900250ta">
「それとも、き、君の妄想……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900260ta">
「君が勝手に作り出した、君だけの脳内設定なんでしょ。僕を、それに、巻き込まないでよ……っ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900270ri">
「あたしだって、タクには、知ってほしくなかった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900280ri">
「ここにも、来てほしくなかった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900290ri">
「もっと、強く引き止めればよかったね……」

梨深が顔を上げる。
毅然として。
僕をまっすぐに見つめてくるその瞳。

とても真剣で。
輝きに満ちていて。
嘘をついているようには見えない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_正面","hard", 200, @+150);
	FadeStand("st梨深_制服_正面_hard", 300, true);
	DeleteStand("st梨深_制服_正面_sad", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900300ri">
「でもここまで来たら、本当のことを知ってもらった方が、いいと思う」

でも、嘘だ。
こんなの嘘だ。
嘘でなきゃいけない。

でないと、僕は、まともでいられない。
いきなり“お前は妄想だ”って言われて、誰が信じるって言うんだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900310ri">
「あなたの行動が、他の人の命を削っていくんだって、知ってもらった方が――」

//◆梨深（の直前のセリフ）を遮って
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900320ta">
「そ、そうだ、な、な、七海は！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900330ta">
「ぼ、僕が、妄想だったら！　僕と、血、血が繋がってる七海も、両親も、妄想ってこと！？　そんなのムチャクチャ――」

{	SetVolume("SE10", 1000, 0, NULL);
	Stand("st梨深_制服_通常","normal", 200, @+150);
	DeleteStand("st梨深_制服_正面_hard", 500, false);
	FadeStand("st梨深_制服_通常_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900340ri">
「ナナちゃんは、いるよ」

梨深の口振りは、まるで七海のことを知っているかのようなものだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900350ta">
「な、七海を誘拐したのは……き、君、なの？」

{	Stand("st梨深_制服_通常","hard", 200, @+150);
	FadeStand("st梨深_制服_通常_hard", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900360ri">
「似たようなものかもね……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900370ri">
「あたしはタクを守ることに気を取られすぎて……ナナちゃんが狙われる可能性を、考えてなかった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900380ri">
「あたしは、誘拐犯のこと、知ってる」

やっぱり、そうだったんだ……。
最初僕が予想した通りの“悪魔女”だったんだ。

{	BGMPlay360("CH22", 2000, 1000, true);}
梨深だけは、僕の味方であってほしかった。
その願望だけで、これまでずっと信じてきたのに。

疑わしいことならこれまでにもいくらでもあった。

そういうことにひたすら目をつむって、“一緒にいてあげる”っていうあの言葉を信じた。

それなのに、結局は優愛のときみたいに、梨深も――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900390ta">
「君も、僕を、裏切るんだね……」

{	Stand("st梨深_制服_正面","sad", 200, @+150);
	DeleteStand("st梨深_制服_通常_hard", 500, false);
	FadeStand("st梨深_制服_正面_sad", 500, true);}
//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900400ri">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900410ri">
「そう、だね……。あたしは、タクを裏切った。隠し事、たくさんしてた」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900420ri">
「ごめんね……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900430ri">
「あたしのこと、恨んでいいよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900440ta">
「謝られたって……ぼ、僕は、信じない。信じられない」

口ではそう言っても、僕は僕のことを本物だって証明できない。

それに、今までに見てきた数々の超常的な現象が脳裏にちらついて、梨深の話を“突拍子のないもの”だって笑い飛ばすこともできない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_正面_sad", 500, true);
	CreateSE("SE01","SE_じん体_動作_抱く1");
	Stand("bu梨深_制服_正面","sad", 200, @+150);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
と、ゆっくり歩み寄ってきた梨深は。
{	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	FadeStand("bu梨深_制服_正面_sad", 500, true);}
正面から、僕を抱きしめてくる。
僕は不意を突かれて、為すがままになってしまう。

その、温もり。

僕の危機を救ってくれた。<k>
僕の心を救ってくれた。<k>
僕に優しさを教えてくれた。

でも今は、こうして抱きしめてもらっても、その温かさがひどく遠くに感じる。

//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900450ri">
「……そろそろ、行かなきゃ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900460ta">
「行くって、ど、どこへ……？」

{	Stand("bu梨深_制服_正面","normal", 200, @+150);
	FadeStand("bu梨深_制服_正面_normal", 300, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900470ri">
「ナナちゃんをさらった誘拐犯のところ。決着、付けなくちゃいけないの。ナナちゃんのことも、他のことも」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900480ri">
「このままだと、タクも守りきれないし」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900490ta">
「そんなの……む、無責任だ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900500ta">
「僕に、ここまで、ひど、ひどいこと、
言っておいて……逃げるの……？」

{	DeleteStand("bu梨深_制服_正面_normal", 500, true);}
梨深が僕から離れる。
一歩、また一歩。ゆっくりと、僕から距離を取る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","normal", 200, @+150);
	FadeStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900510ri">
「戻ってくるから。タクは部屋にいて」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900520ri">
「そしたらまた、一緒にいろいろ楽しいお話しよう」

{	Stand("st梨深_制服_通常","smile", 200, @+150);
	FadeStand("st梨深_制服_通常_smile", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900530ri">
「あなたは、あそこに、いてもいいんだよ」

優しげな口調。<k>
あれだけ残酷なことを言っておいて。
どうして、まだ優しくするんだ。

{	Stand("st梨深_制服_通常","hard", 200, @+150);
	FadeStand("st梨深_制服_通常_hard", 300, true);
	DeleteStand("st梨深_制服_通常_smile", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900540ri">
「でも、ひとつだけ、約束」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900550ri">
「“もう、妄想はしない”」

{	Stand("st梨深_制服_通常","normal", 200, @+150);
	FadeStand("st梨深_制服_通常_normal", 300, true);
	DeleteStand("st梨深_制服_通常_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900560ri">
「ね？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900570ri">
「タクの妄想力は、とっても強いから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900580ri">
「妄想すればするほど、本物のあなたの命が、削られていっちゃうんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900590ta">
「なにを……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900600ri">
「それじゃ、また明日」

{	Stand("st梨深_制服_通常ビシッ！","smile", 200, @+150);
	DeleteStand("st梨深_制服_通常_normal", 500, false);
	FadeStand("st梨深_制服_通常ビシッ！_smile", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900610ri">
「ビシッ」

梨深は敬礼のポーズを取る。
とてつもなく場違いな、笑顔。

{	DeleteStand("st梨深_制服_通常ビシッ！_smile", 500, false);}
でもすぐに、その目から、静かに、涙がこぼれて。

//◆泣くブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17900620ri">
「っ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	SetVolume("SE02", 2000, 0, NULL);

	Wait(1000);
	CreateTextureEX("back10", 500, 0, 0, "cg/bg/bg057_01_3_下北沢拓巳の家_a.jpg");
	CreateSE("SE005","SE_じん体_動作_尻餅");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
慌てたように僕に背を向けた梨深は、肩を震わせながら走り去っていった。

{	MusicStart("SE05", 0, 500, 0, 1000, null, false);}
茫然自失の状態で彼女を見送った僕は、ヘナヘナとその場にへたり込む。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900630ta">
「“本物”の僕って……なんだよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900640ta">
「僕は……ニセモノじゃ……ない……」

世界が色褪せて見える。<k>
なんの希望も見出せない。<k>
存在そのものを全否定された。

僕は、ここにいる意味がない。<k>
死ぬことにすら、意味がない。

こんな無意味な僕を置いて、梨深は行ってしまった。
彼女も僕の敵だった。僕を騙していた。

そして、ああやってすべてを僕に語った以上、もう一緒にいる理由も喪失したんだろう。

{{	SetVolume360("CH22", 2000, 0, NULL);}}
//◆※以下、拓巳は９章ラストまで鬱状態になります。セリフも鬱状態強めで
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900650ta">
「戻ってくるはずない……」

梨深に見捨てられた……。
だって僕は妄想の存在らしいから。化け物だから。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17900660ta">
「ふひひ……ふ……ひ……」

どうでもいい……。
もう、なにもかもどうでもいい……。

立ち上がる気力もなく。
いまだ心が整理できず。
ショックのあまり涙も出なくて。

{	Fade("back10", 4000, 1000, null, false);}
日暮れ直前の風が、身体の芯から熱を奪っていく。<k>
わずかに残っていた梨深の温もりも、消えて。

意味もなく空を見上げれば、夕焼けはすでにほとんどを夜の闇に侵食されていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("back10", null);

	Wait(2000);

//～～Ｆ・Ｏ

}

..//梨深特殊妄想イン用
..DelusionFakeCut
function DelusionFakeCut()
{
	CreateColor("白１", 500, 0, 0, 1280, 720, "White");
	Request("白１", Lock);
	Fade("白１", 0, 0, null, false);

	CreateSE("SEIN","SE_擬音_妄そうIN");

//画面エフェクト//妄想ＩＮエフェクト
	CreateMovie360("妄想in", 500, Center, Middle, false, false, "dx/mvin.avi");
	Request("妄想in", Lock);
//	Request("妄想in", Play);

//ＳＥ//妄想ＩＮ
	SoundPlay("SEIN", 0, 1000, false);
	WaitAction("SEIN", 1000);

	SetVolume("SEIN", 0, 0, NULL);

	Fade("白１", 0, 1000, null, true);
	Request("妄想in", UnLock);
	Delete("妄想in");
}

..DelusionFakeCut2
function DelusionFakeCut2()
{
	Request("白１", UnLock);
	Fade("白１", 0, 0, null, true);
	Delete("白１");
}

..DelusionFakeCutOut
function DelusionOut()
{
	CreateColor("黒１", 22000, 0, 0, 1280, 720, "Black");
	Request("黒１", Lock);
	Fade("黒１", 0, 0, null, false);

	CreateSE("SE01","SE_擬音_妄そうOUT");

//画面エフェクト//妄想ＯＵＴエフェクト
	CreateMovie360("妄想out", 21000, Center, Middle, false, false, "dx/mvout.avi");
//	Request("妄想out", Play);

//ＳＥ//妄想ＯＵＴ
	SoundPlay("SE01", 0, 1000, false);
	WaitAction("妄想out", null);

	Fade("黒１", 300, 1000, null, true);
	Delete("妄想out");
}

..DelusionFakeCutOut2
function DelusionOut2()
{
	Wait(2000);

	Request("黒１", UnLock);
	Fade("黒１", 1000, 0, null, true);
	Delete("黒１");

}
