//<continuation number="20">




chapter main
{

	$PreGameName = "boot_第四章";

	if($GameStart != 1)
	{
		$GameName = "ch04_086_優愛から逃走";
		$GameContiune = 1;
		Reset();
	}

		ch04_086_優愛から逃走();
}


function ch04_086_優愛から逃走()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");

	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

//ＢＧ//センター街//夜
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg009_02_3_107_a.jpg");
	DrawTransition("back03", 300, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg009_02_3_107_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
エレベーターから転げるようにして外に飛び出す。

すでに日は暮れている。
周囲を見回した。
人が多い。

逃げろ――
とにかくどこかへ逃げろ。

ベースに戻るのは危険だ。
あの女が追ってくる。

どこへ行くべきなのかも分からないまま、とにかく走り出す。

今にも別のエレベーターから優愛が降りてきて、またあの冷徹な声で僕を脅してくるかもしれないと思ったら、一秒でもこの場にとどまっていたくなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE02", 100, 1000, 0, 1000, null, true);

//ＢＧ//スペイン坂//夜
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg087_01_3_スペイン坂_a.jpg");
	DrawTransition("back03", 300, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg087_01_3_スペイン坂_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08600010ta">
「はぁっ、はぁっ、かはぁっ、はぁっ……！」

何度も後ろを振り返りながら、とにかく走る。

通行人が邪魔だった。

サラリーマンやＤＱＮぽい女子高生にぶつかる。その都度、悪態を浴びる。

それでも立ち止まらずに走り続けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//マルイチ前//夜
//※マルイチ＝マルイのこと
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg088_01_3_マルイチ前_a.jpg");
	DrawTransition("back03", 300, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg088_01_3_マルイチ前_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08600020ta">
「がはっ、はぁっ、くはぁっ、はぁっ……！」

息が苦しい。でたらめに道を選んで逃げてきたけど、どこを走っているのかよく分からない。

{	SetVolume("SE02", 500, 0, NULL);}
息を整えるために立ち止まる。
今自分が立っている場所の景色を確認する。

ここはマルイチ前だった。
それなら宮下公園まで避難しよう……！

そこで少し休んで、さらに遠くに逃げるんだ。

代々木公園まで行けば隠れる場所はいくらでもありそうだから、そこで一晩過ごすのもありだ。

背後が気になって仕方ない。
優愛の姿は見当たらない。

でも、今にも能面のような表情で目の前に現れてもおかしくない。

本能が僕を急き立てる。

――逃げろ。
――逃げるんだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, NULL);

//ＢＧ//宮下公園//夜
//※ホームレスモブあり。『恐怖の大王がこの街を選んだ』と書いたプラカードを抱えてしゃがみ込んでいる

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg083_02_3_宮下公園_a.jpg");
	DrawTransition("back03", 300, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateTexture360("back06", 100, 0, 0, "cg/bg/bg083_02_3_宮下公園_a.jpg");

	Delete("back03");

	Wait(500);

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_じん体_動作_尻餅");
	MusicStart("SE02", 100, 600, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
宮下公園の陸橋の上で、へなへなと地べたに腰を下ろす。

走りすぎて、のどが渇いた。
キンキンに冷えたコーラを飲みたい。

でも近くに自販機は見当たらなかった。

ここまで来ればもう大丈夫かな……。

いや、油断しちゃダメだ。
僕はなおも周囲への警戒を怠らない。

夜の宮下公園には人の姿は少ない……と思っていたけど、意外にもそうじゃなかった。

//おがみ：テキスト分割
公園内をショートカットしているのか足早に歩いているサラリーマン、ベンチに座ってケータイをいじっているおっさん、

さらにホームレスも何人か座り込んでぼんやりしているし、そのホームレスのひとりに話しかけている青い服装の人は……警官だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_心臓_鼓動");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
警察……

ゴクリと、息を呑む。

そう言えば以前、２人組の刑事に話を聞かれた。

あれ以来、なんの音沙汰もない。

僕のベース近辺を警備してくれるって言ってたのに、その気配もない。

三住くんの話じゃ学校にも捜査に来ていたらしいけど。

あの刑事２人組……なんて言ったっけ。
名前は思い出せない。

僕は連中に『張り付け』事件で目撃したことをありのままに話した。
けど今になって思えば、あの２人はあからさまに僕に疑いの眼差しを向けていたように思える。

と、ホームレスに話しかけていた警官が、チラリと僕の方を見た――ような気がした。

まさか――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("１８");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();
}