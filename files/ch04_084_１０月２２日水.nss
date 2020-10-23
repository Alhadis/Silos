//<continuation number="160">




chapter main
{

	$PreGameName = "boot_第四章";

	if($GameStart != 1)
	{
		$GameName = "ch04_084_１０月２２日水";
		$GameContiune = 1;
		Reset();
	}

		ch04_084_１０月２２日水();
}


function ch04_084_１０月２２日水()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//※拓巳視点に戻る
//ＢＧ//＠カフェ・ＲＯＯＭ３７
//１０月２２日（水）//日付は表示しない

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg034_01_3_ネットカフェ37_a.jpg");
	Fade("back04", 1000, 1000, null, true);

	Delete("back03");

	CreateSE("SE01","SE_日常_ねっとかふぇ_空調_LOOP");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE02", 1000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
いつものＲＯＯＭ３７。
そのリクライニングシートに腰を沈めながら、僕はイライラした気持ちを紛らわそうと爪を噛んだ。

昨日、今日と２日連続で＠カフェに来たのには理由がある。

一昨日の夜。
セナの例の話が事実だったっていうのをグリムたちに調べてもらった後で、優愛からメールが来た。

しかも厚かましくも、僕ともう一度話がしたいだなんて言ってきたんだ。

ふざけんな、と言いたいね。

僕を騙しておいてなにが“話がしたい”だよ。
僕には話すことなんてないよ。

どうせまた僕をはめる新しい罠でも思いついたんだろ。相手にしてられるか。

確かに僕は女の子と話すことに慣れてない。
だから優愛に言い寄られたときはすっかり浮かれちゃってた。

そんな僕をあの女は陰でこっそりバカにしていたんだ。

それにあの訳の分からない妄想話。

僕だって妄想はするけど、それで他人に迷惑をかけたことはない。

でもあの女は、僕をまるでニュージェネの犯人扱いでもするかのようなデンパを垂れ流した。

絶対許せない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back36010", 500, 0, 0, 1280, 720, "BLACK");
	Fade("back36010", 0, 0, null, false);
	Fade("back36010", 500, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
というわけであの女からのメールは無視したわけだけど、ひとつ懸念があった。

メールでは、優愛は僕のベースに行くと書いてあった。確かにあの女には住所を知られてしまっている。

だから、学校に行く日じゃないのにこうして＠カフェに避難してきているんだ。

できればお守り代わりのディソードを持ってきたかったけど、セナと違って、アレを持ち歩いてセンター街を歩く勇気はさすがにない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back36010", 500, 0, null, true);
	Delete("back36010");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
それにしても、一日のほぼ半分をネットカフェで過ごすのはけっこう疲れる。

リクライニングシートは座り心地がいいし店内にはシャワーも完備してあるけど、ベースと同じようにくつろぐことはさすがにできない。

それに一番の問題は、星来たんがいないっていうことだ。

星来たんの存在が僕にとってどれだけ救いになっているかを、こうして２日間＠カフェに籠もってみて実感した。

早くベースに帰りたい。

でも帰るのは深夜、日付が変わってからと決めていた。

その時間になれば終電もなくなるし
さすがの優愛も待ち構えてはいないだろうって思ったからだ。

０時になるまであと４時間は粘らないといけない。

エンスーをやっていればすぐなんだろうけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back10", 500, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);
	Fade("back10", 0, 0, null, false);

	CreateMovie360("リーゼロッテ", 100, Center, Middle, true, false, "dx/mvNH03.avi");
//	Request("リーゼロッテ", Play);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text503]
僕はＰＣのモニタへと視線を移す。

僕のセカンドキャラであるリーゼロッテが、手持ち無沙汰な様子で立ち尽くしていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, null);
	SetVolume("SE02", 500, 0, null);

	Fade("back10", 100, 1000, null, true);

	Delete("リーゼロッテ");

	CreateColor("back11", 400, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 300, null, false);
	CreateTexture360("back12", 200, 0, 0, "cg/bg/bg081_01_1_電車カットボディ窓_a.jpg");
	Stand("buセナ_制服_通常","hard", 300, @+200);
	FadeStand("buセナ_制服_通常_hard", 0, true);

	Fade("back10", 300, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch04/08400010sn">
「――お前の見ている景色は、本物か？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("back10", 100, 1000, null, true);
	Delete("back11");
	Delete("back12");
	DeleteStand("buセナ_制服_通常_hard", 0, true);
	Fade("back10", 300, 0, null, true);
	Delete("back10");


	CreateSE("SE01","SE_日常_ねっとかふぇ_空調_LOOP");
	MusicStart("SE01", 500, 700, 0, 1000, null, true);
	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE02", 500, 700, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
セナの言葉を思い出す。
彼女の言っていたことの半分以上は事実だった。

ただ“人の意志や肉体的な部分までコントロールする”という部分についてはついにソースは見つからなかった。
そこに関してはセナの妄想でしかないのかもしれない。

事実の中に嘘を少しだけ混ぜるのは、特に脅し文句としては巧妙で効果的な手段だからね。

理性ではそう分かっていても、僕自身にここ数週間で起きた不可思議な現象のことが頭の中をちらつき、どうしても恐怖を覚えちゃうなあ……。

ぼんやりと、画面内のリーゼロッテを眺める。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE10","SE_じん体_動作_尻餅");

//	Move("リーゼロッテ", 13000, @0, @-120, Dxl1, false);
	CreateMovie360("リーゼロッテ", 100, Center, Middle, true, false, "dx/mvNH03.avi");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08400020ta">
「リーゼロッテ、お前の見ている景色は、本物か？」

周囲に聞かれないよう、小声でボソッとつぶやいてみる。

以前にも似たようなことを何度か考えたことがある。

僕が今見ているリーゼロッテがいる世界――バゼラードは、
リーゼロッテにとっては本物かもしれないけど、僕にとっては偽物だ。

ということは、僕の中の人が見ている“僕のいる世界”も偽物っていうことになる。

ただ、リーゼロッテが僕という高次存在を認識できないように、僕もまた僕の中の人という高次存在を認識できない。

リーゼロッテも僕が考えているようなことを考えたりしてるのかな。

少なくとも彼女は僕が干渉しないと、自力で動くことすらできない。

じゃあ僕はどうなの？

僕も、“僕の中の人”が干渉しない限り、このリクライニングシートから立ち上がることすらできないのかな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	MusicStart("SE10", 0, 1000, 0, 1000, null, false);
	Move("back04", 300, 0, @40, Dxl1, false);
//	Move("リーゼロッテ", 300, @0, 50, Axl1, false);
	Fade("リーゼロッテ", 300, 0, null, true);
	Delete("リーゼロッテ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
試しに立ち上がってみた。
あっさりとそれに成功する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateMovie360("リーゼロッテ", 100, Center, Middle, true, false, "dx/mvNH03.avi");
	Fade("リーゼロッテ", 0, 0, null, true);
//	Request("リーゼロッテ", Play);
	Move("back04", 300, @-0, @-40, Axl1, false);
	Fade("back04", 300, 0, null, true);
//	Move("リーゼロッテ", 500, 0, -120, Dxl1, false);
	Fade("リーゼロッテ", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
今度は座ってみる。難なくできた。

今の一連の動作が――
僕自身の意志によるものなのか。

それとも、僕の中の人が干渉した結果なのか。
それを確かめる術はなくて、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//	Move("back04", 0, 0, 0, null, true);
	Fade("back04", 0, 1000, null, true);
	Delete("リーゼロッテ");

//ＳＥ//ＲＯＯＭ３７の仕切り戸が開けられる
	CreateSE("SE03","SE_日常_し切り扉_開く");
	CreateSE("SE04","SE_日常_し切り扉_開く");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08400030ta">
「え……？」

背後で、僕がいる個室の仕切り戸が開かれる音がした。
同時に、誰かが入ってくる気配も。

驚いて振り返る――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＣＧ//ＲＯＯＭ３７に乱入してくる優愛
	Wait(500);

	CreateSE("SE衝撃","SE_衝撃_衝撃音02");

	MusicStart("SE衝撃",0,1000,0,1000,null,false);
	CreateTexture360("back03", 100, 0, 0, "cg/ev/ev038_01_3_優愛ROOM37乱入_a.jpg");
	DrawTransition("back03", 200, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/ev/ev038_01_3_優愛ROOM37乱入_a.jpg");

	BGMPlay360("CH10", 0, 1000, true);

	Wait(1000);
	CreateSE("SE01","SE_にん間_動作_手_はたく");
	CreateSE("SE03","SE_じん体_動作_のぞく");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
楠……優愛……！

恐怖のあまり叫び声を上げようとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("back14", 100, 0, 0, "cg/bg/bg034_01_3_ネットカフェ37_a.jpg");
	Stand("bu優愛_制服_冷酷","cool", 200, @0);
	Request("back14", Smoothing);
	Shake("back14", 300, 0, 10, 0, 0, 500, null, false);
	Shake("bu優愛_制服_冷酷_cool", 300, 0, 15, 0, 0, 500, null, false);
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Fade("back14", 300, 1000, null, false);
	FadeStand("bu優愛_制服_冷酷_cool", 500, true);
	Delete("back0*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
でも優愛の手によって口を塞がれてしまった。

その手は熱を帯びていて、優愛の汗の香りが僕の鼻をつく。

//◆以下、優愛の声はすべて小声
//◆口調は冷徹に
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400040yu">
「黙って」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400050yu">
「声を出さないで」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400060yu">
「出さないって約束して」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400070yu">
「約束してくれるよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400080yu">
「しないなんて言わないよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400090yu">
「約束して」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400100yu">
「するでしょ？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400110yu">
「するの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400120yu">
「お願い」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08400130ta">
「…………っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_冷酷_cool", 300, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
狭い個室内。
逃げ道は優愛に塞がれている。

気が付けば肩も優愛にすごい力で押さえつけられ、シートから立ち上がることもできない。

優愛の冷たい眼差しが、至近距離から僕を射抜いてくる。

たまらず目をそらすと、彼女が肩から提げているカバンに付けられた３匹のゲロカエルんが見えた。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400140yu">
「いい？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400150yu">
「声を」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08400160yu">
「出さないで」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("１７");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

}