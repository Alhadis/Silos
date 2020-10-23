//<continuation number="1330">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_031_妄想トリガー６■";
		$GameContiune = 1;
		Reset();
	}

		ch02_031_妄想トリガー６■;
}


function ch02_031_妄想トリガー６■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg098_02_0_AHロビー_a.jpg");
	Delete("背景１");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);


//=============================================================================//
//妄想トリガー分岐
//ポジティブ妄想→分岐１へ
//ネガティブ妄想→分岐２へ
//妄想しない→分岐３へ
//=============================================================================//
if($妄想トリガー通過６ == 0)
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
			$妄想トリガー６ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー６ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー６ = 0;
		}
	}
}



if($妄想トリガー６ == 2)
{
//分岐１
//=============================================================================//
//ＢＧ//診察室

	SetVolume360("CH*", 0, 0, null);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();

	ClearAll(0);

	CreateTexture360("病院廊下", 100, 0, 0, "cg/bg/bg099_02_0_AH廊下_a.jpg");

	CreateSE("SE02","SE_はいけい_びょういん_LOOP");
	MusicStart("SE02", 2000, 800, 0, 1000, null, true);

	DelusionIn2();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
診察室にはすぐに呼ばれた。もっと待たされるかと思ったけど、全然そんなことはなかった。

ロビーにいたたくさんの人たちはいったいなんだったんだろう。案外、サクラだったりするのかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");

	CreateSE("SE10","SE_日常_びょういんどあ_開く");
	CreateSE("SE11","SE_日常_びょういんどあ_閉まる");
	SoundPlay("SE10", 0, 1000, false);

	Wait(1000);

	DrawTransition("色１", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);
	Wait(1000);
	SoundPlay("SE11", 0, 1000, false);
	MusicStart("SE02", 1000, 400, 0, 1000, null, true);
	Wait(500);
	Delete("色*");
	Delete("病院廊下");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
４年前とは違う診察室だった。入っていくと、懐かしい顔が僕を出迎えてくれた。

{	Stand("bu史男_白衣_通常","smile", 200, @-100);
	FadeStand("bu史男_白衣_通常_smile", 500, true);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100010tk">
「やあ、西條くん」

{	CreateSE("SE03","SE_日常_家具_イス_きしむ_回転");
	SoundPlay("SE03", 0, 1000, false);}
高科先生は親しげな笑顔を浮かべると立ち上がり、僕に手を差し出してきた。握手を求められていると気付いて、慌てて握り返す。

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100020tk">
「また君に会えて、嬉しいよ」

{	Stand("bu史男_白衣_通常","normal", 200, @-100);
	FadeStand("bu史男_白衣_通常_normal", 300, true);
	DeleteStand("bu史男_白衣_通常_smile", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100030tk">
「いや、嬉しい、というのは変かな」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100040tk">
「君にしてみれば、またここに来るというのは辛いことなわけだからね」

//※最後に高科と拓巳が会ったのは４年前（拓巳が小学校を卒業した頃）最初に高科と拓巳が会ったのは７年前（拓巳が小４の頃）→分岐１と分岐２で年数が違っているのはそういう理由です
４年振りだっていうのに、先生はすごくフレンドリーだ。
僕は少し緊張していたんだけど、一気に気が楽になった。

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100050tk">
「それで、今日はどうしたんだい？」

{	CreateSE("SE03","SE_日常_家具_イス_きしむ");
	SoundPlay("SE03", 0, 1000, false);}
先生にイスにかけるように促され、僕は腰を落ち着けた。

{	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 1000, null, true);}
緊張が解けたせいか、僕は一気に自分に起きたこと、起きているかもしれないことを話した。

話すことに慣れていないせいか何度もつっかえたけど、先生は僕を急かすことなくずっと真剣な顔で、相づちを打ちながら聞き入ってくれた。

もちろん優愛のことや悪魔女のことも、なにもかも話した。危険かな、と思ったけど今の僕には頼れるのはこの人しかいないんだ。

{	Fade("色１", 1500, 0, null, true);
	Wait(1000);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100060tk">
「結論から先に言おうか」

{	DeleteStand("bu史男_白衣_通常_normal", 500, false);}
すべてを聞いてから、高科先生は少し考え込み、そう口を開いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE02", 500, 200, 0, 1000, null, true);

	Wait(500);

	Stand("bu史男_白衣_通常","smile", 200, @-100);
	FadeStand("bu史男_白衣_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100070tk">
「君は正常だよ」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100080tk">
「なんの問題もない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100090ta">
「ホ、ホント……ですか……？」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100100tk">
「もちろん」

それはなによりも期待していた言葉。

これを言ってもらいたいためだけに、この病院にわざわざ足を運んだんだ。

もし“お前は異常だ”って言われたらどうしようって、ビクビクしていた。
でも、先生に診てもらってよかった。

{	MusicStart("SE02", 5000, 400, 0, 1000, null, true);
	Stand("bu史男_白衣_通常","normal", 200, @-100);
	FadeStand("bu史男_白衣_通常_normal", 300, true);
	DeleteStand("bu史男_白衣_通常_smile", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100110tk">
「むしろ、おかしいのはその楠さんという女性だね」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100120tk">
「西條くんの話だけで判断するのは難しいが、おそらくその女性は精神的な障害を患っているだろう」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100130tk">
「今後、君に危険を及ぼすような行動に出る可能性がある」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100140tk">
「すぐに警察に通報しよう」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100150ta">
「え……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
警察……。
確かにそれが一番安全かも。

優愛は異常だ。頭がおかしいんだ。もしまたストーカー行為をされたら、と考えるとゾッとする。

{	Stand("bu史男_白衣_通常","smile", 200, @-100);
	FadeStand("bu史男_白衣_通常_smile", 300, true);
	DeleteStand("bu史男_白衣_通常_normal", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100160tk">
「もちろん、僕も責任を持って君を保護するつもりだ」

僕に力強い瞳を向けて、励ますように肩を叩いてくれる。さらに、名刺まで渡された。そこには先生のケータイ番号が印刷されている。

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100170tk">
「なにか問題が起きたら、いつでも連絡をくれて構わないよ」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100180tk">
「２４時間、いつでも君のところに飛んでいくからね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100190ta">
「え、い、いいん、ですか……？」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100200tk">
「当たり前だよ」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100210tk">
「僕は、君の主治医なんだから」

涙が出そうになった。

この人に担当してもらってよかったって、心からそう思う。
今どき、こんなにいい先生はなかなかいない。

{	Stand("bu史男_白衣_通常","normal", 200, @-100);
	FadeStand("bu史男_白衣_通常_normal", 300, true);
	DeleteStand("bu史男_白衣_通常_smile", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100220tk">
「悪魔女のことについても、通報した方がよさそうだね」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100230tk">
「西條くん、君の見たその女がニュージェネの真犯人で間違いないよ。これはものすごい目撃証言だ」

先生は少し興奮気味だ。
だけど声音にはそれを出さない。
相変わらず落ち着いた話し方。

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100240tk">
「事件は、西條くんのおかげで解決だ」

{	MusicStart("SE02", 500, 0, 0, 1000, null, true);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100250tk">
「君は渋谷のヒーローだよ」

{	Stand("bu史男_白衣_通常","smile", 200, @-100);
	FadeStand("bu史男_白衣_通常_smile", 300, true);
	DeleteStand("bu史男_白衣_通常_normal", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100260tk">
「僕はこの瞬間に立ち会えて、実に光栄に思う」

{	BGMPlay360("CH02",0,1000,true);}
僕が……ヒーロー……？

エンスーじゃあるまいし。
こんな僕がヒーローだなんてあり得ないよ。

でも想像してみたら、つい顔がにやけそうになる。

渋谷の女子中学生も女子高生も女子大生もＯＬも、誰もが僕に黄色い声援を送り、僕はカリスマ的な人気を得る。

テレビタレントになるのもいいけど、人前に出るのはイヤだから、ベンチャー企業を起ち上げるんだ。

そしてカリスマ社長として大儲け。会社には美人秘書をたくさんはべらせてハーレム状態。当然ながら全員フラグが立ってて僕にメロメロだ。

家は六本木の高層マンションで、かわいいメイドさんを何人も雇う。まさに僕専用メイドカフェって感じ。もちろん、甘くて濃厚な“夜のご奉仕”も……なんつって！　なんつって！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100270ta">
「ふひ……ふひひ……まさに勝ち組……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴ
//ＳＥ//妄想ＯＵＴ

	SetVolume360("CH*", 100, 0, null);

	DelusionOut();

	ClearAll(0);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg098_02_0_AHロビー_a.jpg");

	DelusionOut2();
	PositiveHuman();


//ＢＧ//総合病院ロビー

	Wait(500);

	CreateSE("SE02","SE_はいけい_びょういん_LOOP");
	MusicStart("SE02", 2000, 800, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
ハッと我に返ると、僕はいまだにロビーのソファに座っていた。

状況がよく把握できなくて、思わず周囲をキョロキョロと見回してしまう。

隣には背中を丸めたおばあさんが座っていた。目が皺に埋もれていて、寝ているのか起きているのかよく分からない。

受付カウンターの上にある時計を見てみると、このロビーで待ち始めて１時間ほどが過ぎていた。

……もしかして、今のは夢？

昨日から寝てないから、待っているうちにうたた寝しちゃってたのか。

今の夢が現実だったらどんなによかっただろう。

すごくガッカリだよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 2000, 200, NULL);

//～～Ｆ・Ｏ
//ＢＧ//黒
	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 0, null, true);
	Fade("背景１", 1000, 1000, null, true);

	Wait(1000);

	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	CreateSE("SE10","SE_日常_びょういんどあ_開く");
	CreateSE("SE11","SE_日常_びょういんどあ_閉まる");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
結局、その後もさらに２時間ほど待たされて、ようやく名前を呼ばれた。

//ＢＧ//診察室
//ＳＥ//ヒュンヒュンという機械的な音
//※↑かすかに機械音が聞こえている感じ。テキストでは触れません。後の伏線。
{	SoundPlay("SE10", 0, 1000, false);
	MusicStart("SE03", 2000, 400, 0, 1000, null, true);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	Wait(1000);
	SoundPlay("SE11", 0, 1000, false);
	FadeDelete("背景１", 100, 0, null, true);}
診察室に入ると、さっき見た夢と同じことが繰り返されているかのような錯覚を覚える。

高科先生だって夢に出てきたのとほとんど同じだ。

いや、最後に会った４年前とまるで変わってないだけか。

でも先生はイスから立ち上がらなかったし、僕に握手も求めなかった。

{	Stand("st史男_白衣_通常","normal", 200, @-100);
	FadeStand("st史男_白衣_通常_normal", 500, true);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100280tk">
「今日はどうしました？」

そして夢のときのように、僕との再会を懐かしんだりもしなかったんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100290ta">
「え、あ、あの、西條、です」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100300tk">
「うん？　ああ、これはご丁寧に」

{	Stand("st史男_白衣_通常","smile", 200, @-100);
	FadeStand("st史男_白衣_通常_smile", 300, true);
	DeleteStand("st史男_白衣_通常_normal", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100310tk">
「高科です。初めまして」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st史男_白衣_通常_smile", 500, true);

}
//合流１へ
//=============================================================================//




if($妄想トリガー６ == 1)
{
//分岐２
//=============================================================================//
//ＢＧ//診察室

	SetVolume360("CH*", 0, 0, null);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();

	ClearAll(0);

	CreateTexture360("病院廊下", 100, 0, 0, "cg/bg/bg099_02_0_AH廊下_a.jpg");
	CreateSE("SE02","SE_はいけい_びょういん_LOOP");
	MusicStart("SE02", 2000, 1000, 0, 1000, null, true);

	DelusionIn2();

	CreateSE("SE03","SE_日常_びょういんどあ_開く");
	CreateSE("SE04","SE_日常_びょういんどあ_閉まる");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
診察室にはすぐに呼ばれた。もっと待たされるかと思ったけど、全然そんなことはなかった。

ロビーにいたたくさんの人たちはいったいなんだったんだろう。案外、サクラだったりするのかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	SoundPlay("SE03",0,1000,false);
	Wait(1500);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	SetVolume("SE02", 1000, 400, NULL);
	SetVolume("SE03", 500, 0, NULL);
	Wait(500);
	SoundPlay("SE04",0,1000,false);
	Delete("背景１");
	Delete("病院廊下");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text907]
４年前とは違う診察室だった。入っていくと、懐かしい顔が僕を出迎えてくれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu史男_白衣_通常","smile", 200, @-100);
	FadeStand("bu史男_白衣_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601907]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100320tk">
「やあ、西條くん」

高科先生は僕ににこやかな笑みを向けてくれた。
４年前となにも変わっていない。そのことに安心した僕は、思いの丈をぶちまけていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100330ta">
「せ、せ、先生、たす、助けて……」

{	Stand("bu史男_白衣_通常","normal", 200, @-100);
	FadeStand("bu史男_白衣_通常_normal", 300, true);
	DeleteStand("bu史男_白衣_通常_smile", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100340tk">
「ど、どうしたんだい？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100350ta">
「変な……お、女が……僕にストーカー行為を……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100360ta">
「このままじゃ、が、学校にも、い、行けないし、い、家にも、い、一度、来られてて、場所知られてるから、あ、安心、できないし……っ」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100370tk">
「……落ち着いて」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100380ta">
「お、落ち着いてなんて、いら、いられないよっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100390ta">
「あの、女、異常だ……っ。僕は、せ、正常なんだっ。それに、優愛だけじゃない、あ、悪魔女だって……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100400ta">
「そうだ、悪魔女が、し、真犯人なんだっ」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100410tk">
「真犯人？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100420ta">
「ニ、ニュージェネの……犯人だよっ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100430ta">
「ま、間違いないんだっ！　僕は、じ、事件現場で、死体を、は、張り付けにしてる最中の、あの女を、み、見たんだっ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100440tk">
「大丈夫だ、なにも心配いらないから」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100450tk">
「とにかく落ち着こう。いいね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100460ta">
「…………」

諭されて、僕は口を閉ざした。
いったいなにが大丈夫なのかはよく分からない。

でもプロの医者が、それも高科先生がそう言ってくれるんだから、きっとホントに大丈夫なんだ。そう自分に言い聞かせた。

興奮したせいか、息が苦しい。僕は息を整える。

先生はそんな僕の様子をじっと見つめていた。
やけに深刻そうだけど……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100470ta">
「あ、あの……ほ、ホントに、大丈夫……なの？」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100480tk">
「もちろんだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100490ta">
「あんな、あ、危ない、女が……僕を、ね、狙ってるのに……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100500ta">
「なんで、そ、そう、言い切れるの……？」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100510tk">
「理由を知りたいかい？」

僕がうなずくと、先生は小さく肩をすくめた。
手に握ったペンを、無意識なのかしきりに指の上で回転させている。

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100520tk">
「なぜなら、君の言っている女の人は――」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100530tk">
「この世には存在しないからだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100540ta">
「……は？　で、でも……」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100550tk">
「君は自分の妄想に怯えているだけなんだ」

{	MusicStart("SE02", 2000, 0, 0, 1000, null, false);
	BGMPlay360("CH01",0,1000,true);}
その声音は、不気味なくらいに優しい。

僕は身を震わせる。止まらない。

どうしてだろう。
先生はこんなに優しいのに……

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100560tk">
「西條くん、君はその女の人には会っていない。分かるね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100570ta">
「わ、分からないよ……っ」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100580tk">
「じゃあ、もっと具体的に言おうか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SoundPlay("SE02", 0, 0, false);

//ＳＥ//心臓の鼓動
	CreateSE("SE01","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE01", 10000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100590tk">
「君は、その女の人には会えるはずがないんだ」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100600tk">
「もう７年間も、君は」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100610tk">
「この病院から」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100620tk">
「一歩も」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100630tk">
「外に」

{	SetVolume360("CH01", 500, 0, null);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100640tk">
「出ていないんだからね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100650ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	BGMPlay360("CH06",2000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
どういう……こと……？
え？　え？　先生は、いったいなにを……

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100660tk">
「君はこの病院の精神科に、７年間入院している。そのことは分かるだろう？」

分からない……分かるわけがない。
なんでこの人は、微笑みを浮かべながらこんなデタラメなことを言い出すんだ……

ふと自分が着ている服を見た。

今日はブラチューの星来Ｔシャツの上に、デニムの長袖シャツを羽織って、下は一着しか持っていないジーパンっていう服装でこの病院に来たはずだった。

なのに、なぜか、

今、僕が着ているのは、

病院着だ。

淡い黄緑色をしていて、ワンピースみたいになっている服。
前を合わせて紐で結ぶだけの簡素なもの。下はズボンもはいていない。

僕は、いつ、着替えたんだっけ？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100670tk">
「ここは閉鎖病棟だから、お見舞いの人も来ない」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100680tk">
「入院患者さんも男女で別フロアに分けられていて、行き来はできない」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100690tk">
「精神科の看護師は全員、男だし」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100700tk">
「君の病室は完全に個室。窓もない」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100710tk">
「つまり、君は７年間、女性と接触したことがないんだ。君の家族も含めてね」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100720tk">
「思い出したかな？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100730ta">
「あ……あああ……」

嘘だ……。
そんなの嘘だ……。

僕は、入院なんてしてない。僕は渋谷でひとり暮らしをしてるし、エンスーではかなり名の知れた上級プレイヤーで、学校だって最低登校シフト表に従って週に２、３回だけどちゃんと行ってるんだ。

それにさっき、病院の受付の看護師さんとも事務的に話をした。

“初診ですか？”“はいそうです”“ではこの用紙に必要事項を記入してお待ちください”

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100740ta">
「嘘に決まってる……」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100750tk">
「……本当にそう思うのかい？」

先生が、カルテになにかを書き込みながらつぶやく。

なにを書いているのか僕には読めない。
日本語じゃなかった。英語？　いや、ドイツ語？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100760tk">
「だとしたら、君の精神はまだ異常だっていうことだよ」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100770tk">
「もうしばらくは入院が必要だね」

チラリと、先生が僕を一瞥する。
憐れみの色をたたえた瞳。
そんな目をされるなんて、以前は一度もなかったのに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("背景１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/effect.png", true);
	Fade("背景２", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
僕は力なくその場に膝を突いた。
涙が溢れてくる。

ああ、そうか。そうだったんだ。
これまでの記憶は全部、僕の妄想だったんだ。
異常なのは僕。頭がおかしいのは僕。

なんてひどいオチなんだ。
でもまあ、もうどうでもいいや。

妄想だったとしても、惜しい記憶じゃないし。
どうせまた新しく創り出せるんだろう？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("背景２", 500, 0, 0, 1280, 720, "White");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/effect.png", true);
	Fade("背景１", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602011]
今度は、怖い事件が起きない世界がいいな。

僕は社交的な性格で成績も優秀。女子にモテモテなんだ。グラビアアイドル並みの美人ばかりが僕の友達にいて、しかもみんながみんな僕のことが好きなんだ。

そこで僕が、一つ屋根の下でみんなで暮らそうって提案するんだ。
そして、楽しくて甘酸っぱくてちょっとドタバタな毎日が始まるんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100780ta">
「ふひ……ふひひひ……」

無理に笑おうとした。

顔が、引きつった。

死にたくなった――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	SetVolume360("CH*", 100, 0, null);
	MusicStart("SE*", 100, 0, 0, 1000, null, false);

	DelusionOut();

	ClearAll(0);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg098_02_0_AHロビー_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	DelusionOut2();
	NegativeHuman();


	CreateSE("SE02","SE_はいけい_びょういん_LOOP");
	MusicStart("SE02", 2000, 800, 0, 1000, null, true);

//ＢＧ//総合病院ロビー

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
ハッと我に返ると、僕はいまだにロビーのソファに座っていた。

全身にイヤな汗をじっとりとかいている。ゾクリと背筋を悪寒が走った。

状況がよく把握できなくて、思わず周囲をキョロキョロと見回してしまう。

隣には背中を丸めたおばあさんが座っていた。目が皺に埋もれていて、寝ているのか起きているのかよく分からない。

受付カウンターの上にある時計を見てみると、このロビーで待ち始めて１時間ほどが過ぎていた。

……もしかして、今のは夢？

昨日から寝てないから、待っているうちにうたた寝しちゃってたのか？

僕は深々とため息をついた。
イヤな夢だった。夢……だよな……？

{	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/effect.png", true);}
昨日までのことを思い出してみる。

大丈夫だ。記憶は連続している。

僕は事件現場で悪魔女と遭遇し、優愛に騙され脅された。
そして、自分が正常だって証明したくてこの病院に来た。そうだ、大丈夫。

{	Fade("色１", 1000, 0, null, false);}
……実は妄想でしたっていうオチでも、よかったけど。

そして、また新しい妄想世界を創ってその中で楽しく過ごす方が、よっぽど幸せなのかもしれない。

そう思えるくらい、今の状況は僕にとってうんざりするものだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 2000, 200, NULL);

//～～Ｆ・Ｏ
//ＢＧ//黒
	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 0, null, true);
	Fade("背景１", 1000, 1000, null, true);

	Wait(1000);


	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	CreateSE("SE10","SE_日常_びょういんどあ_開く");
	CreateSE("SE11","SE_日常_びょういんどあ_閉まる");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
結局、その後もさらに２時間ほど待たされて、ようやく名前を呼ばれた。

//ＢＧ//診察室
//ＳＥ//ヒュンヒュンという機械的な音
//※↑かすかに機械音が聞こえている感じ。
{	MusicStart("SE03", 2000, 400, 0, 1000, null, true);
	SoundPlay("SE10", 0, 1000, false);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Wait(1000);
	SoundPlay("SE11", 0, 1000, false);
	FadeDelete("背景１", 0, 0, null, true);}
診察室に入ると、さっき見た夢と同じことが繰り返されているかのような錯覚を覚える。

高科先生だって夢に出てきたのとほとんど同じだ。

いや、最後に会った４年前とまるで変わってないだけか。

{	Stand("st史男_白衣_通常","normal", 200, @-100);
	FadeStand("st史男_白衣_通常_normal", 500, true);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100790tk">
「今日はどうしました？」

先生は“その記憶は君の妄想だ”なんて言い出したりはしなかった。
だけど――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100800ta">
「え、あ、あの、西條、です」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100810tk">
「うん？　ああ、これはご丁寧に」

{	Stand("st史男_白衣_通常","smile", 200, @-100);
	FadeStand("st史男_白衣_通常_smile", 300, true);
	DeleteStand("st史男_白衣_通常_normal", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100820tk">
「高科です。初めまして」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st史男_白衣_通常_smile", 500, true);

}
//合流１へ
//=============================================================================//



if($妄想トリガー６ == 0)
{
//=============================================================================//
//分岐３

//ＢＧ//診察室
//ＳＥ//ヒュンヒュンという機械的な音
//※↑かすかに機械音が聞こえている感じ。

	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 0, null, true);
	Fade("背景１", 1500, 1000, null, true);

	MusicStart("SE02", 2000, 200, 0, 1000, null, true);

	Wait(2000);


	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	CreateSE("SE10","SE_日常_びょういんどあ_開く");
	CreateSE("SE11","SE_日常_びょういんどあ_閉まる");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
３時間も待たされて、ようやく名前を呼ばれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE10", 0, 1000, false);
	MusicStart("SE03", 2000, 400, 0, 1000, null, true);
	Wait(1000);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	Delete("背景１");
	Wait(1000);
	SoundPlay("SE11", 0, 1000, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
４年前とは違う診察室だったけど、入っていくと懐かしい顔が僕を出迎えてくれた。

この先生は、“誠実そうなおじさん”っていう形容がぴったり来る。老け顔だけど表情は柔らかいし、なによりもしゃべり方や態度にその要素がにじみ出ている。

最後に会った４年前とそれはちっとも変わってない。

この人は歳を取らないんだろうかと思っちゃいそうになるくらいだ。もともと年齢不詳だけど。

すがるような想いが僕の心の中でますます強くなった。

この人なら頼りになる。この人なら僕を救ってくれる。

先生と再会できたことが、すごく嬉しかった。

先生の、僕へ向けた第一声を聞くまでは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st史男_白衣_通常","normal", 200, @-100);
	FadeStand("st史男_白衣_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602014]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100830tk">
「今日はどうしました？」

その声は確かに柔らかで、人を安心させる優しさに満ちている。でも、かつて僕がこの病院に通っていた頃のような、親しげな感じはなかった。

あくまでも仕事として僕に接しているような――

だから僕はたまらず、名前を告げていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100840ta">
「え、あ、あの、西條、です」

//【高科】
//<voice name="高科" class="高科" src="voice/ch02/03100300tk">
<voice name="高科" class="高科" src="voice/ch02/03100850tk">
「うん？　ああ、これはご丁寧に」

{	Stand("st史男_白衣_通常","smile", 200, @-100);
	FadeStand("st史男_白衣_通常_smile", 300, true);
	DeleteStand("st史男_白衣_通常_normal", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100860tk">
「高科です。初めまして」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st史男_白衣_通常_smile", 500, true);

//合流１へ
//=============================================================================//
}


//=============================================================================//
//合流１

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
にこやかに頭を下げられた。
僕は……なにも言えなくなった。

“初めまして”

先生は確かに今、そう言った。

僕のこと……忘れてるんだ。
それもそうだよな、もう４年だもんね……。

でも先生なら……先生ならきっと僕のことを覚えていてくれてるって思ってた。

そんな期待を、勝手に抱いてた。

だからそれを打ち砕かれたことで、僕の心の中に寂しさや虚しさが一気に溢れ出した。
自分っていう存在が否定されたような気分だ。

先生は僕の目を見て語りかけてくる。
僕はそれから目をそらした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu史男_白衣_通常","normal", 200, @-100);
	FadeStand("bu史男_白衣_通常_normal", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100870tk">
「夢遊病かどうか調べてほしいと書いてあるが」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100880tk">
「なにかあったのかな？」

そう、確かにアンケート用紙にはそう書いた。
でももう無意味だ。先生が僕のこと覚えてないんじゃ……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＶＦ//妄想セリフ
//【星来】
	CreateColor("色１", 300, 0, 0, 1280, 720, "WHITE");
	CreateColor("色２", 150, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	Fade("色２", 0, 1000, null, true);
	Stand("bu星来_覚醒前_通常","normal", 200, @0);
	DeleteStand("bu史男_白衣_通常_normal", 0, true);
	FadeStand("bu星来_覚醒前_通常_normal", 0, true);
	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
<voice name="星来" class="星来" src="voice/ch02/03100890se">
「別にいいじゃん」

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03100900se">
「先生が覚えてようが覚えてなかろうが、関係ないっしょ。
　最初の目的を忘れちゃダメ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 100, 1000, null, true);
	Delete("色２");
	DeleteStand("bu星来_覚醒前_通常_normal", 0, true);
	Stand("bu史男_白衣_通常","normal", 200, @-100);
	FadeStand("bu史男_白衣_通常_normal", 0, true);
	Fade("色１", 500, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601016]
あ、そうか……。

僕は先生に会いに来たんじゃない。

僕っていう人間は正常なんだって証明しに来たんだ。

先生との再会はあくまでおまけ。
忘れられてるからなんだって言うんだ。

星来たんが忠告してくれなかったら、
危うく自分を見失っているところだったよ。ふう……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100910ta">
「あ、あの……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100920ta">
「……じ、自分でも知らないうちに、外に、出かけてて、
　パソコンで、ぶ、文章を打ってて、それをまったく、
　お、覚えてない、なんて……あり得ます、か……？」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100930tk">
「ほう」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100940ta">
「し、知り合いから……そう指摘されて
　……混乱、しちゃって……」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100950tk">
「その知り合いの人が冗談を言っているっていう可能性は、あると思うかい？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602016]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100960ta">
「…………」

優愛のあの目は、本気だった。
僕をからかったりしているようには見えなかった。

少なくとも優愛は、優愛自身が語ったことを信じて疑っていなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03100970ta">
「分かり……ません……」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100980tk">
「なるほど」

{	Stand("bu史男_白衣_通常","smile", 200, @-100);
	FadeStand("bu史男_白衣_通常_smile", 300, true);
	DeleteStand("bu史男_白衣_通常_normal", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03100990tk">
「ちなみに、その知り合いとはどういう関係だろう？　恋人？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03101000ta">
「はあ……？」

なにをいきなり言い出すんだ、この人は。
それとこれと、なにか関係があるのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu史男_白衣_通常","normal", 200, @-100);
	FadeStand("bu史男_白衣_通常_normal", 300, true);
	DeleteStand("bu史男_白衣_通常_smile", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101010tk">
「いや、言い方が悪かったかな。じゃあ言い直そう」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101020tk">
「その知り合いの人は、君が意識もないまま歩き回っているのを実際に目撃したのかな？」

なんだ、そういうことか。
僕は首を振った。

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101030tk">
「じゃあ、証拠はないわけだ」

さらにもう一度、僕は首を振る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03101040ta">
「そ、そいつ……た、探偵気取り……で。
　いろいろ、証拠を突きつけてきて……」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101050tk">
「ふむ、そういうことか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601017]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101060tk">
「ちなみにこれまでにも夢遊病の兆候はあったかい？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03101070ta">
「い、いいえ……」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101080tk">
「朝目覚めたら、いつものベッドじゃなくて違う場所で寝てた、っていうことは過去に一度でもあった？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03101090ta">
「い、いいえ」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101100tk">
「じゃあ、その知り合いに言われたのが初めてっていうことだね？」

僕は力なくうなずいてから、思い切って口を開いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602017]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03101110ta">
「ぼ、僕……ね、寝て、ない……んです……」

{	Stand("bu史男_白衣_通常","smile", 200, @-100);
	FadeStand("bu史男_白衣_通常_smile", 300, true);
	DeleteStand("bu史男_白衣_通常_normal", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101120tk">
「もしかして怖いのかな？　でもそんなに深刻になる必要はないよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03101130ta">
「あ、いや……その……」

そうじゃなくて――
僕が言いたいのはそういうことじゃなくて――

でもなんて説明すればいいのか、頭の中がうまく整理できず、まごまごしているうちに言い出すタイミングを失ってしまった。

{	DeleteStand("bu史男_白衣_通常_smile", 500, false);
	CreateSE("SE05","SE_日常_家具_イス_きしむ_回転");
	SoundPlay("SE05", 0, 1000, false);}
先生はカルテになにやら走り書きをしてから、座っているイスを回転させて僕に背を向け、診察室の奥へと身を乗り出した。

//おがみ：ルビ入力
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101140tk">
「<RUBY text="はづき">葉月</RUBY>くん、ちょっと」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st志乃_白衣_通常","normal", 200, @150);
	FadeStand("st志乃_白衣_通常_normal", 700, true);

//※葉月志乃（看護師）後々、重要なキャラになってきます。「グリム」の中の人。
//フラグ【葉月メガネ】ＯＮだった場合は、葉月はメガネをかけています。
	if($葉月メガネ){
		//○実績No.33：メガネスキー
		XBOX360_Achieved(33);
	}

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601018]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03101150hd">
「はい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
	DeleteStand("st志乃_白衣_通常_normal", 700, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
駆け寄ってきたのはまだ若い看護師で、先生がカルテを見せながら小声でなにやら指示すると、彼女はすぐに奥に引っ込んでいった。

なんだろう……？

戸惑っていると、先生はまた僕に向き直る。
それから、優しい口調で夢遊病がどういうものかについて教えてくれた。

人は眠りに落ちると、まずレム睡眠が始まり、やがてノンレム睡眠に移行する。

レム睡眠っていうのは、身体は休息状態だけど脳が覚醒に近い状態で活動している睡眠のこと。

それに対してノンレム睡眠は、脳の活動が休止状態になるより深い眠りのことを言う。

{	Stand("bu史男_白衣_通常","normal", 200, @-100);
	FadeStand("bu史男_白衣_通常_normal", 400, true);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101160tk">
「夢遊病は、ノンレム睡眠のときに起きやすいって言われてる」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101170tk">
「脳が通常の活動をしていないから、普通の受け答えとかは成立しにくいけど、ちゃんと返事もするし、階段などを踏み外さずに上り下りすることだってできる」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101180tk">
「原因としては、精神的なストレスを抱えてるときになりやすいんだ」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101190tk">
「子供に多い症状だけど、成人でもよくある症状なんだよ。これで分かっただろう？　深刻になることはないって言った意味が」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03101200ta">
「はあ……」

でも……

僕は、寝てないんだ。寝ていないのに、自分で覚えていない行動を取っていたんだ。

ＲＯＯＭ３７で『将軍』がチャットに書き込んだとされる時間、僕はずっとエンスーをやっていたはずなんだ。

それって、夢遊病って言うのかな？
教えてもらいたかったけど……先生はどんどん話を進めてしまっていた。

{	Stand("bu史男_白衣_通常","smile", 200, @-100);
	FadeStand("bu史男_白衣_通常_smile", 300, true);
	DeleteStand("bu史男_白衣_通常_normal", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101210tk">
「夢遊病かどうかを調べる方法としては、いくつかある。一番手っ取り早いのは、ここのベッドで寝てもらうことだね。ははは」

{	Stand("bu史男_白衣_通常","normal", 200, @-100);
	FadeStand("bu史男_白衣_通常_normal", 300, true);
	DeleteStand("bu史男_白衣_通常_smile", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101220_1tk">
「ただ、特定条件じゃないと発生しない場合もあるかもしれない。例えば自分のベッドじゃないとダメ、とか」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101220_2tk">
「意識がない状態で出歩くにしても、目的もなくフラフラと歩き続けるのか、それともなんらかの強迫観念があって、それに影響されてなんらかの“一連の目的”を持って出歩いているのか」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101230tk">
「それに君の精神状態についても、特定の条件下じゃないとダメかもしれない。自宅のベッドの上ならリラックスできるけど、ここじゃリラックスのしようがないわけだ」

{	Stand("bu史男_白衣_通常","smile", 200, @-100);
	FadeStand("bu史男_白衣_通常_smile", 300, true);
	DeleteStand("bu史男_白衣_通常_normal", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03101240tk">
「どうする？　とりあえず寝ていってみるかい？」

調べてもらうことには損はないはず。
夢遊病じゃないって証明できた後で、本来するつもりだった質問をしてみよう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu史男_白衣_通常_smile", 500, true);
	Wait(500);

//ＢＧ//カーテンが閉まったベッド
	CreateTexture360("背景４", 100, 0, 0, "cg/bg/bg101_02_1_AHベッド_a.jpg");
	DrawTransition("背景４", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

	Wait(1000);
	CreateSE("SE06","SE_じん体_動作_抱く1");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
奥にある診療用ベッドまで、さっきの葉月とかいう看護師さんに案内された。

眠るためのものじゃないから、ベッドは硬くて寝心地が悪かった。

まあ、僕が普段寝ているソファに比べれば全然問題ないレベルだけど。

{	Stand("bu志乃_白衣_通常","normal", 200, @100);
	FadeStand("bu志乃_白衣_通常_normal", 500, true);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03101250hd">
「３時間くらいしたら、起こしに来ますから」

この看護師さん、かわいいなあ……。

ベッドに横たわったまま、視線を合わせないようにしつつその顔を盗み見る。

ちょっと童顔の顔立ちはなんだか頼りなさそうで、不幸オーラを醸し出している雰囲気だけど、仕事はテキパキとこなしている。

昔のエロゲに出てきそうなヒロインって感じ。しかも病院の陵辱もの。ふひひ。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03101260hd">
「できるだけ目は離さないようにしていますので、安心して眠ってくださいね」

つまり、僕に夢遊病の症状が出て勝手に徘徊し始めても、ちゃんと保護してくれるっていうことだ。

{	Stand("bu志乃_白衣_通常","smile", 200, @100);
	FadeStand("bu志乃_白衣_通常_smile", 300, true);
	DeleteStand("bu志乃_白衣_通常_normal", 0, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03101270hd">
「それでは、ごゆっくり」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_じん体_動作_手_かーてん開ける");
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg101_01_1_AHベッド_a.jpg");

	DeleteStand("bu志乃_白衣_通常_smile", 300, true);
	Wait(500);
	SoundPlay("SE05", 0, 1000, false);
	Fade("背景２", 0, 1000, null, true);
	DrawTransition("背景２", 800, 0, 1000, 100, null, "cg/data/left.png", true);
	Delete("背景４");



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601019]
看護師さんはわずかに笑みを浮かべた後、カーテンを閉めて去っていった。
真っ白いカーテンに囲まれて、僕は深く息を漏らす。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("天井", 100, 0, 0, "cg/bg/bg115_01_1_ベッドに寝ている_a.jpg");

	MusicStart("SE06",0,700,0,1000,null,false);
	Fade("天井", 500, 1000, null, true);
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602019]
周囲からは、先生が患者さんを診察している声や、他の看護師さんたちがパタパタと歩き回る音や、診察室のドアを開け閉めする音などが聞こえてくる。

さすがに落ち着かないなあ。
こんな状況で眠れるかな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//黒
	CreateSE("SE05","SE_じん体_動作_のぞく");
	SoundPlay("SE05", 0, 700, false);
	CreateColor("背景３", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("背景３", 2000, 0, 1000, 100, null, "cg/data/center.png", true);
	Delete("天井");

	SetVolume360("SE03", 3000, 0, null);

	Wait(500);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("色１", 300, 0, 0, 1280, 720, "WHITE");
	Fade("色１", 0, 0, null, true);
	Request("色１", AddRender);
	CreateColor("色２", 150, 0, 0, 1280, 720, "WHITE");
	Fade("色２", 0, 0, null, true);
	Stand("st星来_覚醒前_通常","normal", 200, @0);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
ダメもとで僕は目を閉じた。

//おがみ：シナリオ修正のため、コメントアウトしました。
//眠気はあった。
//昨日は結局一睡もしてない。
//さっきロビーで待ってるときに少しうたた寝したけど、あんなんじゃ全然足りない。
どうしても脳裏には『将軍』からのグロ画像や、杭で張り付けにされたあの惨殺死体の映像が浮かびそうになる。

なので無理矢理、星来たんの姿を思い浮かべた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("SE*", 2000, 0, null);

	Fade("色１", 100, 1000, null, true);
	Fade("色２", 0, 1000, null, true);
	Delete("背景３");
	FadeStand("st星来_覚醒前_通常_normal", 0, true);
	Fade("色１", 500, 0, null, true);
	Delete("色１");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601020]
//ＣＨ//星来
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03101280se">
「タッキー、外出嫌いなのに病院来るなんてすごい！」

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03101290se">
「あたし前から思ってたんだけどさ、タッキーって実はすごく強い男の子だよね」

僕の妄想の中で、星来が躍動する。星来がかわいい声でさえずってくれる。

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03101300se">
「あたし、そんなタッキーの強さが、ス・キ♪」

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03101310se">
「それにタッキーは夢遊病なんかじゃないよ。あたし、毎日タッキーのこと見てるもん。だから分かるんさ」

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03101320se">
「三次元女になんか騙されちゃダメだゾ。タッキーにはあたしがいるっしょ？」

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03101330se">
「またあのコンテナハウスで、２人きりで過ごそうね、ぼけなす♪」

ふひひ。
星来たんかわいいよ星来たん。

やっぱり星来たんは僕の理想の嫁。
星来たん以上の女はいない。

三次元？　なにそれ？

ああ、早く帰りたい。
帰って星来たんに“おかえり”って笑顔で出迎えられたい。

待っててね星来たん。すぐ帰るから――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("７");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

}
