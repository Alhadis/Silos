//<continuation number="160">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_010_９月３０日火";
		$GameContiune = 1;
		Reset();
	}

	ch01_010_９月３０日火();
}


function ch01_010_９月３０日火()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//☆Cut-61-----------------------------

//ＢＧ//黒
	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");

//９月３０日（火）//日付は表示しない
	CreateTextureEX("背景２", 5000, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Fade("背景２", 500, 1000, null, true);


	BGMPlay360("CH02", 1000, 300, true);

	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

	Delete("背景１");



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
それから丸１日、僕はバゼラードに潜り続けた。食事を取る時間も惜しんで、ひたすら西條拓巳を消してナイトハルトであり続けた。

エンスーでは僕は神だ。悪魔に怯えるようなこともない。みんなが僕を尊敬してくれるんだ。

この居心地のいい世界に永遠にいられたらどんなにいいだろうと、いつも思う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ＰＣ画面（エンスープレイ中）
	SetVolume360("CH02", 500, 800, NULL);

	MmoMain(0,0,"cg/sys/mmo/エンスー3.jpg");
	Fade("MmoWindow", 0, 1000, null, true);
	Fade("背景２", 500, 0, null, true);

//ＳＥ//ハードデスク

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01000010ta">
「ちょ！　お、おおお！　エンジェルハィロゥ、キターー！　キタコレ！
超レア！　すげー！　ふひひ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("MmoWindow", 500, @0, @-192, Dxl1, true);

//☆☆☆☆071011
//※エンスーでのチャットでは表示は以下のようになります。普通のチャットだと「：」ですがエンスーのチャットの場合は「＞」です。
//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text003]
ナイトハルト＞エンジェルハィロゥｋｔｋｒ{#TIPS_ｋｔｋｒ = true;$TIPS_on_ｋｔｋｒ = true;}！！！１１！！１！！１
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,mmo);
	TypeMmo("0");

	Wait(1000);

	SetVolume360("CH02", 1000, 300, NULL);

	Fade("背景２", 500, 1000, null, true);

//ＳＥ//扉を乱暴に叩く音30％
//ＳＥ//七海「おにぃー」30％
	CreateSE("SE02","SE_じん体_動作_手_扉たたく02_LOOP");
	CreateSE("SE03","SE_音声_七海_おにぃ_LOOP");

//エンスーＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01000020ta">
「こ、これはさっそく使わないと……えーっと、装備装備……」

{	MusicStart("SE02", 0, 400, 0, 1000, null, true);
	MusicStart("SE03", 0, 300, 0, 1000, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01000030ta">
「おおお、キャラの見た目変わった！　すげ！　これすげ！　ちょ、見て見て、見ろってグリム！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01000040ta">
「ん？」
{Wait(500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-62-----------------------------

	//エンジェルハイロゥ用
	MmoKnight();

	Fade("背景２", 500, 0, null, true);
	SetVolume360("CH02", 500, 800, NULL);

//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text005]
ＳＷ＞ナイトハルト自重しろ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text006]
グリム＞ナイトハルト自重しろ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text007]
ゲジ姉＞ナイトハルト自重しろ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(0,0,false);
	TypeMmo("500");

//エンスーＣＨＡＴ終了

//演出：ここセリフ分割してみました。
//☆Cut-63-----------------------------

//ＳＥ//七海「おにぃー」音5secF/up40％
//	SetVolume("SE03", 3000, 1000, null);
	CreateVOICE("ななみ１","ch01/01000070na");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01000050ta">
「『ナイトハルト自重しろ』？　うっせー氏ねよ負け組。ふひひひひ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01000060ta">
「ちょっと街に戻って見せびらかしてこようかなぁ」

//ＳＥ//扉を乱暴に叩く音5secF/up40％
{	SetVolume("SE02", 3000, 500, null);
	SoundPlay("ななみ１",0,300,false);}
ずっと探し求めていた超レアアイテムのひとつが手に入って、僕は興奮状態だった。憂鬱な気分はすっかり吹き飛んでいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//扉を乱暴に叩く音が断続的に続く
//扉の外から七海が扉を叩いて呼んでいる
//以下の七海のセリフ、可能ならセリフ表示なしで、拓巳のモノローグ中に挿入

/*
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01000070na">
「おにぃー」（※後にSE化）

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01000080na">
「おにぃってば！」（※後にSE化）

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01000090na">
「おーい！　開けろー！」（※後にSE化）

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01000100na">
「おーにーーー！」（※後にSE化）
*/

	SoundStop("SE03");
	CreateVOICE("ななみ１","ch01/01000080na");

	Move("MmoWindow", 500, @0, @192, Dxl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
{	SoundPlay("ななみ１",0,400,false);}
エンジェルハィロゥって言えば、ドロップ率０．０００１％っていう幻のアイテムなんだぞ！

//ＳＥ//扉を乱暴に叩く音5secF/up50％
//ＳＥ//七海「おにぃー」音5secF/up50％
{	SetVolume("SE02", 3000, 550, null);
	CreateVOICE("ななみ２","ch01/01000090na");
	SoundPlay("ななみ２",0,600,false);}
その効果はキャラの外見が変わるだけっていう、ちっとも役に立たない
アイテムなんだけど、逆に言えば一目でエンジェルハィロゥを持って
るって周囲に分かるから、羨望の眼差しを受けること間違いなしだ。

{	CreateVOICE("ななみ１","ch01/01000100na");
	SoundPlay("ななみ１",0,800,false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01000110ta">
「ふひひ、やった……ナイトハルトがまた一歩、神に近づいた……！」

//ＳＥ//七海「おにぃー」停止
{	SetVolume("ななみ１", 300, 0, NULL);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01000120na">
「こーらーぁ！　開ーけーろー！」

//▼TIPS：解除：ｋｔｋｒ
{$TIPS_on_ｋｔｋｒ = false;}
//ＳＥ//扉を乱暴に叩く音60％
{	SetVolume360("CH02", 500, 300, NULL);
	Fade("背景２", 500, 1000, null, true);
//	Draw();
	SetVolume("SE02", 0, 600, null);}
うるさいなあ。さっきからドンドンと扉を叩いてるのはどこの誰だ！？

せっかくレアアイテムゲットの喜びに浸ってるって言うのに。僕の邪魔をするなよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Delete("MmoWindow");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01000130na">
「バカおにーー！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01000140ta">
「げ…………」

この声……

//おがみ：ルビ入力
聞き覚えのある声を聞いたとたん、僕はげんなりした。
間違いない、この声の主は両親が放った刺客――妹の<RUBY text="ななみ">七海</RUBY>だ。めんどくさいことになったぞ。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01000150na">
「開けないとひどいんだからねー！」

//ＳＥ//扉を乱暴に叩く音65％
{	SetVolume("SE02", 0, 700, null);}
く、くそう……。

嵐のような時間が始まってしまう。

ホントは開けたくないけど、そんなことをしたら今度は両親が駆けつけてきて"やっぱりひとり暮らしはやめて実家に戻ってきなさい"って言われてしまう……。

ここのビルのオーナーは実質的には父さんだから、圧力をかけて僕を追い出すことなんて朝飯前だろう。

うう、こんな理不尽なことったらないよ……。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01000160na">
「おーーーにーーー！」

//ＳＥ//扉を乱暴に叩く音70％
{	SetVolume("SE02", 0, 1000, null);}

{#TIPS_ｕｚｅｅｅｅｅｅｅｅｅｅｅ！ = true;$TIPS_on_ｕｚｅｅｅｅｅｅｅｅｅｅｅ！ = true;}
<FONT incolor="#88abda" outcolor="BLACK">ｕｚｅｅｅｅｅｅｅｅｅｅｅ！</FONT>

{$TIPS_on_ｕｚｅｅｅｅｅｅｅｅｅｅｅ！ = false;}
そんな大声でわめき散らすなよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	CubeRoom("ルーム", 1500, 0);
	Fade("ルーム", 0, 1000, null, true);

	FadeDelete("背景２", 500, true);


	CreateSE("SE03","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Rotate("ルーム", 1000, 0, -180, 0, Dxl2, true);

	Zoom("ルーム", 1000, 1500, 1500, null, true);

	SetVolume360("CH02", 1000, 0, NULL);
	Delete("背景*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
扉はいまだに、外から乱暴に叩かれ続けている。
コンテナハウスの壁は鉄板一枚だから、音が室内にすごく響く。それを分かっててヤツはわざとやってるんだ。

僕はやむなく、内側からかけておいた南京錠の鍵を外し、観音扉を開けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundStop2("SE*");

}




















