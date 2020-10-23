//<continuation number="210">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_020_アドレス交換";
		$GameContiune = 1;
		Reset();
	}

	ch01_020_アドレス交換();
}


function ch01_020_アドレス交換()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//☆Cut-71-----------------------------

	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");
	CreateColor("夕方", 120, 0, 0, 1280, 720, "#FF8800");
	Fade("夕方", 0, 0, null, true);
	Request("夕方", MulRender);

//ＢＧ//アニメエイト前//昼
	Fade("夕方", 1000, 500, Dxl1, false);
	CreateBG(100, 1000, 0, 0, "cg/bg/bg031_01_1_アニメエイト_a.jpg");

	Stand("st優愛_制服_通常左手下", "normal", 200, @-100);
	FadeStand("st優愛_制服_通常左手下_normal", 500, true);

	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 0, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
アニメについて僕が優愛にあれこれレクチャーしている間に、アニメエイトの前まで来ちゃっていた。
思ったよりあっという間に着いちゃったぞ。

つい調子に乗って喋りすぎちゃったよ……。

優愛が聞き上手だからかな。僕がいろいろ知識を披露してるのを、優愛はいかにも興味深そうに聞いてくれる。

だから僕もついつい、罠だと知りつつも自分の知っていることを話したくなっちゃうんだ。

僕って喋るの苦手なのに。こんなこと初めてだ。まるでネットでチャットしてるみたいな感覚で話せた。なんだか変な感じ。

{	Stand("st優愛_制服_通常","worry", 200, @-100);
	DeleteStand("st優愛_制服_通常左手下_normal", 300, false);
	FadeStand("st優愛_制服_通常_worry", 300, true);}

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000010yu">
「はあ。なんだかドキドキしてきました……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02000200ta">
「…………」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000030yu">
「あの、先に帰ったりしないでくださいね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02000040ta">
「う、うん……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, NULL);
	SetVolume360("CH03", 2000, 0, NULL);

	CreateTexture360("背景１", 1000, center, middle, "SCREEN");

	Delete("back0*");
	Delete("夕方");

	DeleteStand("st優愛_制服_通常_worry", 0, true);
	FadeDelete("背景１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
優愛はますます緊張した面持ちで、店員に星来覚醒後バージョンの予約を言い出していた。僕はずっとそばで見ているしかなかった。

逃げるチャンスを窺ってたけど、優愛が常に不安そうに僕へチラチラと視線を投げてくるから、まったく身動きが取れなかった。

その後、優愛のたってのお願いで、一緒に店内の物色までさせられた。

優愛は"ここはお金がいくらあっても足りませんね"って喜んでいたけど、僕はそれに笑顔を返す気力は残っていなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

	CreateSE("サウンド１","SE_日常_雑踏01");
	MusicStart("サウンド１",0,1000,0,1000,null,true);

//ＢＧ//神泉駅//夕方
	CreateBG(100, 0, 0, 0, "cg/bg/bg032_01_2_神泉駅_a.jpg");
	DrawTransition("back*", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
優愛は電車通学らしい。というわけで神泉の駅まで一緒についていかされた。

この女、おっとりしているように見えて、実はけっこうしたたかだ。わがままをわがままだと思わせないような言い方で要求してくる。

{#TIPS_黒キャラ = true;$TIPS_on_黒キャラ = true;}
黒いぞ。優愛は<FONT incolor="#88abda" outcolor="BLACK">黒キャラ</FONT>だ。

{	Stand("bu優愛_制服_通常左手下","normal", 200, @100);
	FadeStand("bu優愛_制服_通常左手下_normal", 500, true);}
{$TIPS_on_黒キャラ = false;}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000050yu">
「西條くんって、ケータイは持ってないんですか？」

駅前についたところで、優愛が唐突にそう聞いてきた。

ケータイ、か……。
僕は力なく首を振った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","worry", 200, @+100);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_normal", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000060yu">
「持ってないんですか……それじゃ連絡が取れないですね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02000070ta">
「れ、連絡……？」

連絡を取って、どうするつもり？
まさかことあるごとにメールをよこせって要求してくるつもり？

{	Stand("bu優愛_制服_通常","normal", 200, @+100);
	DeleteStand("bu優愛_制服_通常左手下_worry", 300, false);
	FadeStand("bu優愛_制服_通常_normal", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000080yu">
「あ、でも西條くん、パソコン持ってましたよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000090yu">
「わたしも持ってるから、メールアドレスを交換しませんか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02000100ta">
「ど、どう、して……？」

{	Stand("bu優愛_制服_通常","worry", 200, @+100);
	FadeStand("bu優愛_制服_通常_worry", 300, true);
	DeleteStand("bu優愛_制服_通常_normal", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000110yu">
「え、その……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000120yu">
「フィギュアの発売日に――」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000130yu">
「取りに行かなくちゃいけませんよね」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000140yu">
「そのときに、また、一緒に……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000150yu">
「まだ、ひとりでアニメエイトに行く勇気は……ないから……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02000160ta">
「…………」

巧妙だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常","normal", 200, @+100);
	FadeStand("bu優愛_制服_通常_normal", 300, true);
	DeleteStand("bu優愛_制服_通常_worry", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000170yu">
「それに――」

この女は巧妙だ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000180yu">
「わたし、西條くんと――」

そうは分かってるのに、断れない。断ったら僕が悪いみたいになっちゃう……。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000190yu">
「もっと――」

三次元っていうのはなんて恐ろしいんだ……。

{	Stand("bu優愛_制服_通常左手下","shy", 200, @+100);
	DeleteStand("bu優愛_制服_通常_normal", 300, false);
	FadeStand("bu優愛_制服_通常左手下_shy", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02000200yu">
「仲良く、なりたいから……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02000210ta">
「…………っ」

これは僕が、人と話すことに慣れてないせい？　それともこの女の話術のレベルが高すぎるのか……？

どうやら優愛は、僕からアドレスを教えてもらうまで帰るつもりはなさそうだった。そのくせ、眼鏡越しに不安げな上目遣いをよこしてくる。

なぜか、反発する気力が奪い取られていく。

全身に鳥肌が立って、背中を悪寒が走っているっていうのに、逃げることも断ることもできない。

優愛は、異様だ……。
この雰囲気……普通じゃない……。

なにが普通じゃないのか、はっきりと言葉で説明することはできないけど……とにかく、異様なんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//黒
	CreateColor("背景１", 1000, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 0, null, true);
	Fade("背景１", 1000, 1000, null, true);

	DeleteStand("bu優愛_制服_通常左手下_shy", 0, true);
	Stand("st優愛_制服_通常左手下","smile", 200, @-150);
	FadeStand("st優愛_制服_通常左手下_smile", 0, false);

	Wait(1000);

	FadeDelete("背景１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
気が付けば、僕はノートの切れ端に自分のメルアドを書いて、優愛に渡してしまっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常左手下_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
優愛は嬉しそうにそれを受け取った後、ペコリと頭を下げて駅へと消えていった。

魂を抜き取られたような気がして、僕はその場に１０分ほど呆然と立ち尽くしていた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetVolume("サウンド１", 3000, 0, NULL);

	ClearAll(3000);

	Wait(2000);

}

