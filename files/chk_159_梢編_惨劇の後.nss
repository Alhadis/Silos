//<continuation number="610">

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_159_梢編_惨劇の後";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_159_梢編_惨劇の後();
}


function chk_159_梢編_惨劇の後()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編
//ＢＧ//学校廊下

	CreateSE("SE3601","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE3601",0,1000,0,1000,null,true);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg019_02_1_学校廊下_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
たまらず逃げ出していた。
あの状況で笑えるこずぴぃが恐ろしかった。
あんなに残虐に殺せるこずぴぃが恐ろしかった。

訳が分からなかった。
人が、人の形でなくなっていて。
バラバラになっていて。

屋上の光景が脳裏に焼き付いて離れない。
僕の脳内でその光景が延々と繰り返されている。
そしてその度に吐きそうになって、何度もえずく。

あてもなく校内を走った。
ホームルームが始まっているから廊下に人影はない。
こずぴぃは追ってこなかった。

どうしよう……。どうしよう……。どうしよう……。
逃げてきてよかったのか？　こずぴぃのところに残るべきだったのか？

逃げたことで、こずぴぃに“敵”って認識されたらまずいんじゃないか？

もし“敵”と思われたら、僕も屋上の女子たちみたいにバラバラにされるんだろうか。そんなのイヤだ……。イヤだよ！

でもだとしたら、どうすればよかったんだ……。
こずぴぃのところに今から戻るとしても、どう接していいか分からない。

ふらつき、転びそうになりながらなおも走っていると、角を曲がったところで人とぶつかりそうになった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE3602","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE3602",2000,400,0,1000,null,false);

	SetVolume("SE3601", 1000, 0, null);

	Stand("st大輔_制服_通常","shock", 200, @-150);
	FadeStand("st大輔_制服_通常_shock", 300, true);

	Wait(500);

	Stand("st大輔_制服_通常","sigh", 200, @-150);
	FadeStand("st大輔_制服_通常_sigh", 300, true);
	DeleteStand("st大輔_制服_通常_shock", 0, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
それは三住くんと、この前僕をからかったクラスのＤＱＮだった。
僕を見て三住くんは気まずそうに目を伏せ、ＤＱＮはニヤニヤとして僕の行く手を塞いだ。

{	DeleteStand("st大輔_制服_通常_sigh", 500, false);}
//【男子Ｃ】
<voice name="男子Ｃ" class="男子Ｃ" src="voice/chn04/01200010dc">
「よおエスパー。お前、ちょっと超能力使ってくんねえ？」

そう言われて、僕はぐっと唇を噛みしめた。
視線は合わせない。合わせたらどうせ殴られるに決まってる。

ＤＱＮは、ケータイを取り出すような真似はしなかった。
もしそれをされたら、僕もキレてこずぴぃみたいに人を殺しかねない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_衝撃_顔面蹴られる");
	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg019_02_1_学校廊下_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01200020ec">
「クラスの女子が授業ボイコットしたみてえでよ。誰も来ねえから俺ら今、探してるわけよ」

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01200030ec">
「でもダルいと思わねえ？　三住はミナコが心配みてえだけどよ、どうせ集団でサボってるだけだろ。そう思うよなエスパー？」

僕は答えなかった。
すると腰を蹴られた。

//ＳＥ//蹴る音
{	MusicStart("SE01", 0, 500, 0, 1000, null, false);
	Shake("back01", 500, 5, 5, 0, 0, 500, null, false);}
//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01200040ec">
「おい、シカトしてんじゃねえよ」

//【三住】
<voice name="三住" class="三住" src="voice/chn04/01200050mi">
「やめろよ」

{	Stand("bu大輔_制服_通常","sigh", 200, @-50);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);}
三住くんが口を開く。なおも僕に暴力を振るおうとするＤＱＮを止めた。

//【三住】
<voice name="三住" class="三住" src="voice/chn04/01200060mi">
「タク。ミナコ見なかったか？　チャイム鳴るまでいたんだけどよ。今はメールしても電話しても返ってこねえんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3602", 1000, 0, null);

//ＳＥ//心臓の鼓動
	CreateSE("SE02","SE_じん体_心臓_鼓動");
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
//ＢＧ//赤
//少しだけフラッシュバック
	CreateSE("SE回想in","SE_衝撃_ふらっしゅばっく");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "White");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateTexture360("回想背景", 1000, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");
	DeleteStand("bu大輔_制服_通常_sigh", 0, true);

	CreateColor("血", 1100, 0, 0, 1280, 720, "Red");
	Request("血", AddRender);

	CreateColor("血２", 1100, 0, 0, 1280, 720, "Red");
	DrawTransition("血２", 2200, 0, 1000, 100, Axl1, "cg/data/effect.png", false);

	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1500);

	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("回想背景");
	Delete("血");
	Delete("血２");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
言えない……。
あの屋上の惨劇を言うことはできない。

ミナコっていうのが誰かは知らないけど、どうせ三住くんの今のカノジョだろう。そのミナコって女も、あの屋上の肉片の中に混じっていたんだろうか。

……それと……梨深は？
梨深も、こずぴぃに殺されたのかな……？

そんなはず、ないよね。梨深は最近はずっと行方不明だし。学校にも来ていない。

っていうか、この期に及んで梨深の心配をしているなんて。
僕はどれだけ彼女に期待してるんだ……。どうせ、もう二度と僕の前には現れるはずないっていうのに。

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01200070ec">
「なあエスパー、お前なんで服に血がついてんだ？」

ギクリとした。
さっきこずぴぃにしがみつかれたときの血だ。
裾のあたりにべったりとこびりついてしまっている。

三住くんが目を見開き、息を呑んでいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);

	CreateSE("SE3601","SE_じん体_動作_足_走る_LOOP");

	Stand("st大輔_制服_通常","shock", 200, @-150);
	FadeStand("st大輔_制服_通常_shock", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【三住】
<voice name="三住" class="三住" src="voice/chn04/01200080mi">
「タク、なにかあったのか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200090ta">
「な、なにもないよ……！」

{	SetVolume("SE02", 1000, 0, null);
	Fade("Black", 500, 1000, null, true);
	MusicStart("SE3601",0,1000,0,1000,null,true);}
その場できびすを返して、僕は逃げ出した。
後ろから呼び止める声が聞こえてきたけど、無視した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st大輔_制服_通常_shock", 0, true);
	Delete("back01");

	Wait(500);

//ＢＧ//学校階段
	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg052_01_1_学校階段_a.jpg");
	Request("back02", Smoothing);
	Zoom("back02", 0, 1500, 1500, null, true);
	Move("back02", 0, @-160, @200, null, true);


	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg052_01_1_学校階段_a.jpg");
	Fade("Black", 500, 0, null, true);

	CreateSE("SE3602","SE_衝撃_階だん転がり落ちる");
	SetVolume("SE3601", 1000, 0, null);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
階段を駆け下りる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//ＳＥ//階段を転がり落ちる
	MusicStart("SE3602", 0, 1000, 0, 1000, null, false);
	Shake("back02", 1500, 0, 5, 0, 0, 500, null, false);

	Zoom("back02", 1700, 1000, 1000, Axl2, false);
	Move("back02", 1700, 0, 0, Axl2, true);

	Shake("back02", 500, 5, 15, 0, 0, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
でも混乱しているせいで足を踏み外し、踊り場に転がり落ちた。

倒れ込んだまま、立つ気力を失う。

僕にはもう一生、平穏は訪れないんだろうか。
どうして次から次へと、こんな有り得ないことばかり起こるんだ……。

{	Fade("Black", 0, 1000, null, true);
	Wait(500);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200100ri">
「タク」

名前を、呼ばれた。

その呼び方をする女子は、僕の知る限り、１人しかいなくて。
おずおずと顔を上げると、差し出されている手が目に入った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Fade("Black", 1000, 0, null, true);

	Wait(500);
	Stand("st梨深_制服_通常","normal", 200, @+150);
	FadeStand("st梨深_制服_通常_normal", 500, true);
	Wait(500);

	CreateSE("SE01","SE_じん体_動作_尻餅");

	CreateSE("SE3602","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE3602",2000,300,0,1000,null,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200110ri">
「どうしたの？　そんなに慌てて。どこかケガしてない？」

梨深だ……。
梨深が、いる……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200120ta">
「あ、り、梨深……僕は……」

泣きそうになって、ここで泣いたら相当恥ずかしいって思って、涙をこらえて、差し出された手を握った。

梨深の手は温かい。
僕を引っ張り起こしてくれた。

{	Stand("st梨深_制服_正面","sad", 200, @+150);
	DeleteStand("st梨深_制服_通常_normal", 300, false);
	FadeStand("st梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200130ri">
「ホントに大丈夫？　かなり派手に転んでたけど」

{	DeleteStand("st梨深_制服_正面_sad", 500, true);
	MusicStart("SE01",0,1000,0,1000,null,false);}
僕の全身をためつすがめつしつつ、服をはたいて埃を払ってくれた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200140ta">
「り、梨深……どこへ……」

今まで、どこに行っていたんだろう。
どうして連絡をくれなかったんだろう。
僕を守ってくれるって言ったのに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_右向き","hurry", 200, @+150);
	FadeStand("st梨深_制服_右向き_hurry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200150ri">
「ああ、あたし？　あたしは今日は遅刻。たはは……」

いや、そんなことを聞いてるんじゃないんだけど……。

でもそのあっけらかんとした笑みを見て、少しだけ恐怖が和らいだ。
この笑顔に、これまで何度も救われてきた。

だから、今までどこでなにをしてたかなんて、聞かなくてもいい。
どうして連絡をくれなかったのかなんて、聞く必要はない。

梨深が、戻ってきてくれた。だから、僕はもう大丈夫だ。
後はどんな敵だろうと、梨深が守ってくれる――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Fade("Black", 200, 1000, null, true);


	CreateSE("SE02","SE_じん体_心臓_鼓動");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

	SetVolume("SE3601", 1000, 1, null);

	DeleteStand("st梨深_制服_右向き_hurry", 0, true);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
ホントに、守ってくれるのか？

梨深だけ、こずぴぃに殺されなかったのは、たまたまだろうか？
そんな疑問が、頭の片隅に浮かんだ。浮かんでしまった。

これまでずっと休んでたけど今日はたまたま学校に来た？
そのたまたま学校に来た日にたまたま遅刻した？

//※１０月３日修正、以下
//そのたまたま遅刻した日に、たまたまこずぴぃが凶行を起こした？
//※１０月３日修正、以上
そのたまたま遅刻した日に、たまたまこずぴぃが凶行に及んだ？

{	SetVolume("SE02", 1000, 0, null);
	SetVolume("SE3601", 1000, 300, null);
	Fade("Black", 300, 0, null, true);}
ダメだ、そんなネガティブ思考はよせ……。
僕はこめかみを指で揉んで、自分を落ち着かせた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("Black");

	Stand("bu梨深_制服_通常","normal", 200, @+150);
	FadeStand("bu梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200160ri">
「なんだか具合も悪そうだね。保健室に連れてってあげる。そこで少し休んだ方がいいよ」

そう言うと、梨深は僕の手を引っ張ってきた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200170ri">
「ほら、行こう」

梨深は屋上の惨劇を知らないんだろうか。
知らないのが当然か。遅刻してきたって言ってたし。

//※１０月３日追加、以下
僕の服に付着している血のことをあえて指摘してこないのも、きっと気を遣ってくれているだけなんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(2000);
	Wait(1000);
}
