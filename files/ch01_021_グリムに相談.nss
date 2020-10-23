//<continuation number="50">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_021_グリムに相談";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

	ch01_021_グリムに相談();
}


function ch01_021_グリムに相談()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


if($GameDebugSelect == 1)
{
	SetChoice03("競泳水着","スクール","それ以外");
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
			$競泳水着 = 1;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$スクール = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
		}
	}
}


if($GameDebugSelect == 1)
{
	SetChoice02("優愛ルート有り","優愛ルート無し");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA02();
			$優愛ルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$優愛ルート=false;
		}
	}
	$GameDebugSelect = 0;
}



//☆Cut-72-----------------------------
//ＳＥ//ハードデスク
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 0, 500, 0, 1000, null, true);

//イメージＢＧ//チャット画面
//ＳＥ//キーボードを叩く//以下略

	CreateColor("色１", 10000, 0, 0, 1280, 720, "BLACK");

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	ChatMain(420,-54,"002");

	Fade("背景１", 0, 1000, null, false);
	Fade("box01", 0, 1000, null, true);

	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text001]
ナイトハルト：そういう女って、どう思う？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat( 1, 1, key);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text002]
ナイトハルト：僕、もうどうしたらいいか分からないんだ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat( 1, 1, 700);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text003]
ナイトハルト：絶対裏があるような気がして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat( 1, 1, 500);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text004]
ナイトハルト：そうとしか思えないよ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat( 1, 1, 500);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text005]
ナイトハルト：なあ、聞いてる？＞グリム
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat( 1, 1, key);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text006]
グリム：そ　れ　な　ん　て　エ　ロ　ゲ　？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat( 0, 0, false);
	TypeChat("1000");

//わざとスペース開けてます

//☆Cut-73-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02100010ta">
「…………」

その夜。チャットでグリムに優愛のことを相談してみた。

このままひとりで疑心暗鬼になっていても埒があかないと思ったんだ。

でも、その回答がこれだった。
まあ、僕も優愛と最初に話したときはまったく同じリアクションだったけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-74-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text008]
ナイトハルト：グリムに相談した僕がバカだった
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text009]
グリム：ちょｗｗおまｗｗマジで！？　フラグ立ちまくりじゃん！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text010]
//わざと「おまい」
グリム：おまい、やることはしっかりやってるんだなｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text011]
//わざと「だぜ」
グリム：三次元に興味ないとか言ってたのはどこの誰だぜ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text012]
ナイトハルト：別にそういう関係じゃないっつーの
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1000");


//☆Cut-75-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
グリムのリアクションって、三住くんにそっくりだな。
案外、同一人物だったりして。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//☆Cut-76-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text014]
グリム：ま、恋愛経験のないナイトハルトみたいなのは
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text015]
グリム：女ができた途端にオタ卒業ってなりやすいよな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text016]
グリム：スク水ハァハァとか言ってたらカノジョに嫌われるだろ。常識的に考えて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");


if($競泳水着 == 1)
{

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text017]
//顔文字平気でしょうか？
ナイトハルト：僕はスク水より競泳水着が好きです(`･ω･´) 
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text018]
グリム：そういう話をしてるんじゃねえｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

}
else if($スクール == 1)
{

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text817]
//顔文字平気でしょうか？
ナイトハルト：スク水にハァハァしてなにが悪い！(#ﾟДﾟ)
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text818]
グリム：ダメだこいつ……早くなんとかしないと……
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

}
else
{

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text917]
//顔文字平気でしょうか？
ナイトハルト：スク水にハァハァしてなにが悪い！(#ﾟДﾟ)
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text918]
グリム：ダメだこいつ……早くなんとかしないと……
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

}


//☆Cut-77-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//ＶＦ//ＰＣのスピーカーからの音声
//【星来】
<voice name="星来" class="星来" src="voice/ch01/02100020se">
「メールだよ～、ぼけなす♪」

お？　星来たんの声が聞こえてきた。
メールが届いたときには、今の音声が鳴るように設定してあるんだ。

何気なくメールソフトをチェックしてみると、差出人の名前欄には――

楠優愛

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02100030ta">
「うわ……さっそく来た」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-78-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text020]
ナイトハルト：メールきた
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text021]
ナイトハルト：今
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,100);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text022]
//顔文字
グリム：ｷﾀ━(ﾟ∀ﾟ)━(∀ﾟ )━(ﾟ　 )━(　　)━(　　)━(　 ﾟ)━( ﾟ∀)━(ﾟ∀ﾟ)━！！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

//☆Cut-79-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
三次元女子からのメール……。こんなのもらったのは初めてだ……。
ゴクリと息を呑んで、メールを開いてみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-80-----------------------------

	CreateTextureEX("back05", 1005, 0, 0, "cg/bg/bg047_01_6_PCメール画面優愛_a.jpg");
	Fade("back05", 0, 1000, null, true);


	Wait(2500);

//※以下、優愛からのメール
//こんばんは。楠です。
//さっそくメールさせてもらいました。
//わたしのメルアド、登録しておいてくれると嬉しいですv(≧∇≦)v
//今日は付き合わせてしまってm(_ _)m ゴメンナサイ
//でも、わたしはとても楽しかったです。
//ああいうお店に行くのは初めてだったからかな。
//それとも、西條くんが一緒だったから……かな（笑）
//西條くんは明日、学校に何時頃来ますか？
//あ、どうしてそういうことを聞いたかっていうと、
//朝の挨拶をしたいなあ、なんて……
//もし朝、偶然でも顔を合わせられたらいいですね。
//それじゃ、またメールします。
//おやすみなさい(^ _ ^)/~~
//メール検分（テスト）


//☆Cut-81-----------------------------


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
優愛の品の良さや清楚さがにじみ出ているような内容だなあ。それでいて顔文字を使って親しみやすさも演出している。

でも……『西條くんが一緒だったから』とか『朝の挨拶をしたいなあ』とか……。

なにかを企んでいるとも取れる文章だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-82-----------------------------

	FadeDelete("back05", 100, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text026]
//「うｐ汁」＝「アップしろ」
グリム：内容うｐ汁！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text027]
ナイトハルト：普通だぞ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text028]
ナイトハルト：挨拶みたいなもの
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("1000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text029]
グリム：いいからうｐ！　うｐ！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

//☆Cut-83-----------------------------

	CreateColor("色１", 2000, 0, 0, 1280, 720, "BLACK");
	Fade("色１", 0, 0, null, true);

	Fade("色１", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text501]
ナイトハルト：こんばんは。○○です。
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text502]
ナイトハルト：さっそくメールさせてもらいました。
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text503]
ナイトハルト：わたしのメルアド、登録しておいてくれると嬉しいですv(≧∇≦)v
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text504]
ナイトハルト：今日は付き合わせてしまってm(_ _)m ゴメンナサイ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text505]
ナイトハルト：でも、わたしはとても楽しかったです。
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text506]
ナイトハルト：ああいうお店に行くのは初めてだったからかな。
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text507]
ナイトハルト：それとも、○○くんが一緒だったから……かな（笑）
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text508]
ナイトハルト：○○くんは明日、学校に何時頃来ますか？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text509]
ナイトハルト：あ、どうしてそういうことを聞いたかっていうと、
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text510]
ナイトハルト：朝の挨拶をしたいなあ、なんて……
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text511]
ナイトハルト：もし朝、偶然でも顔を合わせられたらいいですね。
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text512]
ナイトハルト：それじゃ、またメールします。
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text513]
ナイトハルト：おやすみなさい(^ _ ^)/~~
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

	FadeDelete("色１", 500, true);

//☆Cut-84-----------------------------


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
グリムがうるさいので、しょうがなく全文を打ち込んでアップしてやった。もちろん僕や優愛の個人を特定するような情報は消して、だけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text031]
グリム：ほほ～
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text032]
グリム：なんだこのラブラブメールは
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text033]
グリム：ナイトハルトは死ねばいいのに
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text034]
ナイトハルト：マジメに考えてくれ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,700);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text035]
ナイトハルト：これはなにかの罠だ！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,700);
	TypeChat("1700");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text036]
グリム：はいはい陰謀論陰謀論
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text037]
グリム：考えすぎじゃね？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text038]
グリム：フラグ立った状態にしか見えん
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text039]
グリム：グッドエンドまであと少しだ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text040]
ナイトハルト：だってあり得ないだろ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text041]
ナイトハルト：僕みたいなキモオタに
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,700);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text042]
ナイトハルト：あんなかわいいリアル女が言い寄ってくるはずがない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text043]
グリム：ちょｗｗｗのろけかｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text044]
ナイトハルト：たまにはマジレスしろよヽ(`Д´)ﾉ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,700);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text045]
グリム：まあまあ、だから考えすぎだって
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//わざと「おまい」
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text046]
グリム：おまいとも趣味や話が合うんだろ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//わざと「いないお」
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text047]
グリム：今どきそんな健気ないい子はいないお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

//☆Cut-85-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text048]
それは分かってる……。
でも、いい子すぎて逆にそれが気持ち悪い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-86-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text049]
グリム：ま、最初のストーカーっぽい行為はさすがにやりすぎかもしれんけど
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text050]
グリム：そういう衝動に突き動かされるくらい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text051]
グリム：おまいのことが気に入ったってことだ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text052]
グリム：その子アニメ好きなんだろ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text053]
グリム：こんな理想的なカノジョはいない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text054]
グリム：オタにとってはなｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text055]
グリム：その子をＹＯＵのマニアックな趣味で染めちゃいなヨ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

//☆☆☆☆071011
//※『グリム：競泳水着だって着てくれるかもだぜ』←カットしました

//☆Cut-87-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text056]
そ、それは、かなりいいかも……。

いやいやいや！　それこそ思うつぼだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-88-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text057]
グリム：逆ナンされたんだからもっと喜べよｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text058]
ナイトハルト：僕は三次元に興味はない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,700);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text059]
グリム：実は付き合いたくてしょうがないんだろ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1750");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text060]
グリム：脱オタするなら今がチャンスだ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text061]
グリム：こんなチャンスは二度とないな。間違いないお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

//☆Cut-89-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text062]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02100040ta">
「そうだけど……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-90-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text063]
//オメ＝おめでとう
グリム：モテ期突入オメ！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text064]
グリム：ビビってないでここは攻めろ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text065]
グリム：リアルでもナイトハルトみたいにしてりゃイインダヨ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text066]
グリム：グリーンンダヨーーーーーーーー！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

//☆Cut-91-----------------------------

	SetVolume360("CH03", 1000, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text067]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02100050ta">
「…………」

それができたら、苦労しないさ。

それに昨日、一昨日と優愛と話してみて分かった。

楽しくなることや嬉しくなることはあるけど、それ以上に疲れるし面倒くさかったんだ。

あんな大変な思いをするなら、僕はまったりと自分の好きなように生きられる二次元の方がマシだ……。

だから、優愛のメールに返事は出さなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ハードデスク2secF/out
	SetVolume("SE01", 1200, 0, null);

//～～Ｆ・Ｏ

}

