//<continuation number="70">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_046_ヴァンパイ屋事件";
		$GameContiune = 1;
		Reset();
	}

		ch02_046_ヴァンパイ屋事件();
}


function ch02_046_ヴァンパイ屋事件()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//ＢＧ//黒

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
その夜、また新しい猟奇的事件が起きた。
ニュージェネ第４の事件だ。

エンスーをやっていたら、例によってグリムが情報を仕入れてきたんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/sblind.png", true);
	Delete("ナイトハルト");

	Wait(500);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景２", 5000, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	CreateTextureEX("背景３", 5000, 0, 96, "cg/bg/bg128_01_3_ネットオークション_a.jpg");

//おがみ：先行入力
	CreateSE("SE02","SE_衝撃_衝撃音02");
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	CreateSE("SE360103","SE_日常_PC_マウスくりっく");
	CreateTexture360("背景１", 25000, center, middle, "SCREEN");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MmoMain(0,0,"cg/sys/mmo/エンスー2.jpg");
	MmoKnight();

	Fade("MmoWindow", 0, 1000, null, true);
	FadeDelete("背景１", 500, true);

	Wait(500);
	Move("MmoWindow", 500, @0, @-192, Dxl1, true);

	Wait(500);

//イメージＢＧ//ＰＣ画面（エンスープレイ中）
//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text002]
ナイトハルト＞おっす、グリム
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,800);
	TypeMmo("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text003]
ナイトハルト＞今日は入るの遅かったじゃん
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,1100);
	TypeMmo("0");

	Wait(2500);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text004]
グリム＞その目だれの目？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);

//エンスーＣＨＡＴ終了

	Fade("背景２", 0, 1000, null, true);

//ＳＥ//心臓の鼓動
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04600010ta">
「……！」

一瞬、目を疑った。

なんで……グリムがその言葉を知っているのか……。
混乱して、キーボードに添えていた指が震えた。

どんな返事をすればいいか分からなくて、グリムの言葉を目で追いかけていくのが精一杯になる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Fade("背景２", 200, 0, null, true);

	Wait(1000);

//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text006]
グリム＞ニュージェネ第４の事件が起きたお（ ＾ω＾）
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text007]
グリム＞その祭りをずっと追ってた
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text008]
グリム＞いやー、マジで渋谷始まったな
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text009]
グリム＞今回もぶっ飛んでてすげーヤバいｗ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


	Wait(2200);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text010]
グリム＞被害者の死体から血が全部抜かれたらしい
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


	Wait(2500);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text011]
グリム＞井乃頭線の駅のトイレに倒れてたんだけど
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1800);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text012]
グリム＞その死体がさ、すごいんだお！
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


	Wait(2300);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text013]
グリム＞全身の皮膚が緑色に変色してるんだお！
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


	Wait(1800);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text014]
グリム＞こええええ！　マジこえええええ！(;´Д｀)
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


	Wait(2500);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text015]
グリム＞漏れ、オカルト説もあながち間違ってないかも、とか最近思い始めてきたお
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1700);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text016]
グリム＞人にできる犯行じゃねーって！
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(3000);

//エンスーＣＨＡＴ終了
	Fade("背景２", 200, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
僕はＰＣの前で唇を噛んだ。

頭の中で想像しそうになった。でもなんとかその妄想を振り払った。
ひとまずコーラをペットボトルから一口飲み、気分を落ち着かせる。

くそぅ、グリムのヤツ、絶対わざと奇襲のようなマネをしているに違いない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Fade("背景２", 200, 0, null, true);

	Wait(500);

//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text018]
グリム＞あり？　ありり？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text019]
グリム＞リアクションなし？(´・ω・｀)
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text020]
ナイトハルト＞なんでそんな詳しいんだ？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,800);
	TypeMmo("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text021]
ナイトハルト＞まるで実際に見てきたみたいだぞ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,1200);
	TypeMmo("0");

	Wait(2500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text022]
グリム＞まあ似たようなもんだ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2500);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text023]
グリム＞つーか相変わらずナイトハルトは興味なし？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text024]
グリム＞ニュージェネのこと
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text025]
ナイトハルト＞ニュージェネ追ってるぐらいなら
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,1100);
	TypeMmo("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text026]
ナイトハルト＞エンスーで狩りに打ち込むね
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,800);
	TypeMmo("0");

	Wait(2500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text027]
グリム＞さすが疾風迅雷のナイトハルト
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2200);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text028]
グリム＞俺たちにはできない廃人プレイ{#TIPS_廃人プレイ = true;$TIPS_on_廃人プレイ = true;}を平然とやってのける！
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text029]
グリム＞そこにしびれるあこがれるゥ！
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2000);

//エンスーＣＨＡＴ終了
//	Move("MmoWindow", 500, @0, @180, Dxl1, true);

	Fade("背景２", 200, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
ニュージェネの話題なんかしたくなかったから、なんとかうまくごまかしてこの話を終わらせようとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ＰＣ画面（エンスープレイ中）
//エンスーＣＨＡＴ開始

	Fade("背景２", 200, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text031]
グリム＞ところでこいつを見てくれ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2500);

//※ＵＲＬは後日再調整
//わざと「ところでこいつを見てくれ」です

//■３６０
//ウェブ魚拓風のＵＲＬに変更（演出上の問題です）
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text032]
<pre>グリム＞つhttp://a07.gyotaku.jp/http://page16.auctions.taboo.co.jp/jp/auction/u15524569</pre>
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1200);

//▼TIPS：解除：廃人プレイ
	$TIPS_on_廃人プレイ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text033]
グリム＞どう思う？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

//	Move("MmoWindow", 500, @0, @-180, Dxl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text034]
ナイトハルト＞すごく……釣り{#TIPS_釣り = true;$TIPS_on_釣り = true;}の予感です……
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,1100);
	TypeMmo("0");

	Wait(2000);

//エンスーＣＨＡＴ終了
	Fade("背景２", 200, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text035]
前にもこういう展開でグロ画像だとさんざん煽っておいて、バカ画像だった。
その逆もじゅうぶんあり得る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景２", 200, 0, null, true);
	Wait(1000);

//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text036]
グリム＞あれ、マジで知らんのか？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text037]
ナイトハルト＞なにが？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,500);
	TypeMmo("0");

	Wait(2000);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text038]
グリム＞ナイトハルトって実は情報弱者なんじゃね？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text039]
ナイトハルト＞うっせー
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,400);
	TypeMmo("0");

//▼TIPS：解除：釣り
	$TIPS_on_釣り = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text040]
ナイトハルト＞で、なんなんだ？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,600);
	TypeMmo("0");

	Wait(2500);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text041]
グリム＞おまいの大好きな星来たん関係、と言えばどうかな？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(3000);

//エンスーＣＨＡＴ終了

	Fade("背景２", 200, 1000, null, true);
//	Delete("MmoWindow");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text042]
マジ！？
それは見るしかない！

{#TIPS_ブラクラ = true;$TIPS_on_ブラクラ = true;}
まあ、ＵＲＬから推測する限り、リンク先はネットオークションのページみたいだし、いきなり精神的<FONT incolor="#88abda" outcolor="BLACK">ブラクラ</FONT>を踏むこともないだろう。

{$TIPS_on_ブラクラ = false;}
僕は少し興奮しつつリンクを開いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//	CreateSE("SE02","SE_日常_PC_マウスくりっく");
//	SoundPlay("SE02", 0, 1000, false);
//	Wait(150);
	SoundPlay("SE360103", 0, 1000, false);


	Wait(500);

//イメージＢＧ//ＰＣ画面（ネットブラウザ）
//※ネットオークションのページが表示される。オークションの見出しとして大きめのフォントで「Ｂ型の血液が不足しています！」と表示

	Fade("背景３", 0, 1000, null, true);
	Delete("背景２");
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text043]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04600020ta">
「ん？」

“Ｂ型の血液が不足しています”……？

なんだかこの見出し……前にもどこかで見たような。
またデジャヴかな。

//※わざと「どこでつか」です
いや、そんなことより星来たんハァハァな画像はどこでつか！？
マウスのホイールを回転させて、ページをスクロールさせていった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※可能ならブラウザウインドに表示されている内容がスクロールして、ＣＧ表示
//ＣＧ//ヴァンパイ屋事件
//一瞬表示


	Move("背景３", 800, @0, @-480, null, true);
	SoundPlay("SE02", 0, 1000, false);

	Wait(700);

	BGMPlay360("CH01",2000,1000,true);

	Fade("背景３", 0, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601043]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04600030ta">
「……！」

//イメージＢＧ//ＰＣ画面（エンスープレイ中）
モニタにいきなり表示されたのは、
一目でグロ画像と分かるもので、

僕は慌てて視線を左のモニタへ戻しておいて、ブラウザのウインドウを消した。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04600040ta">
「はあ……はあ……」

モニタにグロ画像が表示されていた時間は、３秒もなかった。まともにこの目で見た時間で言えば、１秒にも満たない。それなのに――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(500);

//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text044]
グリム＞それ、ニュージェネ第４の事件の遺体写真
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text045]
グリム＞マスコミが事件を報じるより前に
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text046]
グリム＞オークションに普通に出品されてたんだお
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text047]
グリム＞被害者の悲惨な姿そのものに値付けされてるわけ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text048]
グリム＞つまり出品者がニュージェネの真犯人ってこと
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text049]
グリム＞すごくね？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text050]
グリム＞出品者名は『ヴァンパイ屋』
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text051]
グリム＞ま、捨てＩＤなんだけどな
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2500);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text052]
グリム＞早くもネットじゃ祭り発生中
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text053]
グリム＞いろんな画像掲示板に貼られまくってるし
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text054]
グリム＞ネタ画像なんかも作られてる
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1800);

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text055]
グリム＞職人{#TIPS_職人 = true;$TIPS_on_職人 = true;}仕事早すぎだおｗ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);


//エンスーＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text056]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04600050ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);


//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text057]
グリム＞ってか、ダイイングメッセージあるだろ？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text058]
グリム＞さっきの画像の中に
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);


//エンスーＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text059]
ダイイング……メッセージ……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text060]
グリム＞壁にさ、被害者が血で書いたやつ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1800);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text061]
グリム＞ああいうの、マジであるんだな
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);

//▼TIPS：解除：職人
	$TIPS_on_職人 = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text062]
グリム＞犯人が面白がってやったのかもしれんね
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(3000);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text063]
グリム＞って、おーい、ナイトハルトさーん？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text064]
グリム＞フリーズしてる？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

	Wait(1500);

//エンスーＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text065]
ダイイング……メッセージ……

さっき、一瞬しか画像を見なかった。
それなのに――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04600060ta">
「ゲームだ……こんな世界は、
虚構の……ゲームの世界に違いないんだ……」

壁に紅い文字で不格好に描かれた、断末魔のメッセージが、脳裏に焼き付いてしまっている……

考えないようにしているにもかかわらず、ひとつひとつの文字がまぶたの裏に浮かび上がり、僕に訴えかけてくるんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04600070ta">
「なんであの言葉が……あの言葉がここで出てくるんだ……」

それは、僕の見知った言葉。
よくつぶやいている言葉。

誰にともなく問いかけている言葉。
さっきグリムがエンスーに入ってきたとき最初に言い放った言葉。

ありふれているようで――
普通に生活する分にはまったく使う機会のない言葉――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//おがみ：一瞬ヴァンパイア事件画像を出して、ダイイングメッセージ出す予定
//おがみ：両方後で差し替え

	Fade("背景３", 0, 1000, null, true);
	Delete("MmoWindow");

	Wait(500);

	SetVolume360("CH*", 200, 0, null);
	MusicStart("SE*", 1400, 0, 0, 1000, null, false);

	Wait(1000);

//イメージＢＧ//ダイイングメッセージ
//血で描かれた『その目だれの目？』
//ＳＥ//ドーン！
	CreateSE("SE02","SE_衝撃_衝撃音01");
	CreateTextureEX("背景２", 5000, 0, 0, "cg/bg/bg128_02_3_ネットオークション_a.jpg");

	Fade("背景２", 0, 1000, null, true);
	Delete("背景３");

	SoundPlay("SE02", 0, 1000, false);


	Wait(3000);

	MusicStart("SE*", 2000, 0, 0, 1000, null, false);

//しばらくウェイトしつつＦ・Ｏ～～

	ClearAll(3000);

//○実績No.3：第二章【Click me】
	XBOX360_Achieved(3);

	Wait(2000);


//第２章　ＥＮＤ

}

