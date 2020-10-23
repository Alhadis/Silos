//<continuation number="1170">




chapter main
{

	$PreGameName = "boot_第四章";

	if($GameStart != 1)
	{
		$GameName = "ch04_078_妄想トリガー１５■";
		$GameContiune = 1;
		Reset();
	}

		ch04_078_妄想トリガー１５■();
}


function ch04_078_妄想トリガー１５■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Fade("back03", 0, 1000, null, true);
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE01", 0, 500, 0, 1000, null, true);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１へ
//ネガティブ妄想→分岐２へ
//妄想しない→分岐３へ

if($妄想トリガー通過１５ == 0)
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
			$妄想トリガー１５ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー１５ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー１５ = 0;
		}
	}
}



//=============================================================================//

if($妄想トリガー１５ == 2)
{
//☆☆☆
//分岐１
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume("SE01", 100, 0, NULL);
	DelusionIn();

	BoxDelete(0);

	Delete("*");

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Fade("back04", 0, 1000, null, true);
	Stand("bu梨深_制服_通常","normal", 200, @+100);
	FadeStand("bu梨深_制服_通常_normal", 0, true);

	DelusionIn2();

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 1000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
こ、ここは勇気を持って、なおかつ自然な感じで……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800010ta">
「お、おはよう、咲畑さん……っ」

{	Stand("bu梨深_制服_通常","smile", 200, @+100);
	FadeStand("bu梨深_制服_通常_smile", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, false);}
//◆笑顔
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800020ri">
「うん、おはよー」

よ、よし。ファーストコンタクトはうまく行った。

{	Stand("bu梨深_制服_通常","rage", 200, @+100);
	FadeStand("bu梨深_制服_通常_rage", 300, true);
	DeleteStand("bu梨深_制服_通常_smile", 0, false);}
ホッとしていると、梨深はすぐに渋い顔をして首を傾げた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800030ri">
「ねえタク、なんで急に妙ちくりんな呼び方するの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800040ta">
「み、妙ちくりん……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800050ri">
「“咲畑さん”なんて。なんだか他人行儀」

{	Stand("bu梨深_制服_通常","normal", 200, @+100);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_rage", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800060ri">
「今までみたいに呼んでよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800070ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
今までみたい、か。
よく分からないけど……。

{	SetVolume("SE01", 2000, 300, NULL);
	BGMPlay360("CH11", 2000, 1000, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800080ta">
「じゃあ、り、梨深」

{	Stand("bu梨深_制服_通常","smile", 200, @+100);
	FadeStand("bu梨深_制服_通常_smile", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800090ri">
「おう、なんだいタク」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800100ta">
「いや、特になにもないけど……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800110ri">
「じゃああたしから一言」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_通常_smile", 300, true);
	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
梨深は咳払いをして改まると、周囲を見回してから僕の方に顔を寄せてきた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800120ri">
「タクは大ちんみたいになっちゃダメだよ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800130ri">
「ああいう女たらしは、いつかひどい目に遭うに決まってるから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800140ta">
「あ、うん……肝に銘じておくよ」

{	Stand("bu梨深_制服_通常","happy", 200, @0);
	FadeStand("bu梨深_制服_通常_happy", 500, true);
	DeleteStand("bu梨深_制服_通常_hard", 0, true);}
//嬉しそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800150ri">
「うんうん。タクのそういう素直なところ、あたし好きだな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
す、好き……なのか……。

っていうか梨深からすると、僕は素直キャラなの？

{	Stand("bu梨深_制服_通常","angry", 200, @0);
	FadeStand("bu梨深_制服_通常_angry", 300, true);
	DeleteStand("bu梨深_制服_通常_happy", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800160ri">
「そもそもあたし、大ちんのことでひとつだけどーうしても許せないことがあるんだよね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800170ri">
「あれだけあちこちの女子に声かけてるのに、あたしにはまったく見向きもしないってこと」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800180ri">
「ひどいと思わない？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800190ta">
「え、三住くんに、口説かれたいの……？」

そりゃそうだよね。
彼ってイケメンだし、話だって面白いし。

女たらしだっていうデメリット部分を差し引いても、女子としては付き合いたい存在なのかも。

なんて思っていたけど、梨深はあからさまに顔をしかめて首を振った。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800200ri">
「タク、冗談きっついよー」

{	Stand("bu梨深_制服_通常","rage", 200, @0);
	FadeStand("bu梨深_制服_通常_rage", 300, true);
	DeleteStand("bu梨深_制服_通常_angry", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800210ri">
「大ちんに口説かれるなんて、想像しただけで鳥肌立っちゃう」

自分自身を抱きしめるようにして、わざとらしくブルブルと震えて見せる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800220ri">
「あたしはノーサンキュー」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_rage", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800230ri">
「でもなんて言うのかなぁ、女としてのプライドっていうものがあるわけじゃない？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800240ri">
「ねえ、タクから見てあたしってどう？　魅力、ある？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
う……。
こ、答えにくいことを聞いてくるなあ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800250ri">
「どう？　どう？」

しかも目をキラキラさせて、期待に胸膨らませてるし。

そりゃ……えっと、確かに梨深は、魅力的だと思うけど。
それを口にするのは勇気がいるなあ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800260ta">
「み……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800270ri">
「み？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800280ta">
「み……み……」

{	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800290ri">
「“認めたくないものだな”」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800300ta">
「“若さ故のあやまちというものを”」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800310ta">
「あ……」

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, true);
	DeleteStand("bu梨深_制服_通常_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800320ri">
「あはは、引っかかった」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
得意げに梨深が笑う。

まさか彼女ってオタなの？
思わず僕は苦笑してしまう。

はあ、でもなんか、何気ない会話だけど、すごく楽しいなあ。
僕って女子とこういう会話をすることなんてこれまでほとんどなかったから。

どうしてだろう、不思議と梨深とは馬が合う気がする。

だから、ごく自然に、僕はその言葉を口にできた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_smile", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800330ta">
「梨深は、魅力的だよ」

//◆呆然
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800340ri">
「え……」

{	Stand("bu梨深_制服_通常","shock", 200, @0);
	FadeStand("bu梨深_制服_通常_shock", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, true);}
//驚き
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800350ri">
「え゛！？」

梨深は大げさにのけぞって見せると、みるみるうちに顔を赤くした。

{	Stand("bu梨深_制服_右向き","shy", 200, @0);
	DeleteStand("bu梨深_制服_通常_shock", 500, false);
	FadeStand("bu梨深_制服_右向き_shy", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800360ri">
「たはは、面と向かって言われると……恥ずかしぃ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800370ri">
「でもありがとう。タクにそう言ってもらえると、すごく嬉しい」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800380ri">
「大ちんに口説かれるより一億兆倍嬉しいっ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800390ta">
「……一億兆なんて桁はないけど」

{	Stand("bu梨深_制服_通常","happy", 200, @0);
	DeleteStand("bu梨深_制服_右向き_shy", 300, true);
	FadeStand("bu梨深_制服_通常_happy", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800400ri">
「なんとなくニュアンスで分かってよ～。それだけスケールの大きい嬉しさってこと♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, NULL);
	SetVolume360("CH11", 1000, 0, NULL);

	WaitAction("@CH11", null);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//黒
	DelusionOut();

	Delete("*");

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

	DelusionOut2();
	PositiveHuman();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
青春ってこういうことだよなあ……。

こんな会話を、毎日のように交わすことができたら。

きっと、日々が楽しくて、充実してて、世界の色も変わって見えるんだろう。

でも、しょせんそんなのは幻想なんだ。

現実の僕は、梨深と目を合わせることもできず、ただじっとうつむいて黙りこくっているだけ。

自分の臆病さが、恨めしくなる。鬱だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//翠明学園教室
	CreateBG(100, 1000, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");

	Stand("bu梨深_制服_正面","sad", 200, @+150);
	FadeStand("bu梨深_制服_正面_sad", 500, true);

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800410ri">
「……タク？」

ずっと黙り込んでいた梨深が、恐る恐るという感じでようやく声をかけてきた。

でも、僕はとっさのことにリアクションを返せなかった。たぶん、梨深からすると無視されたように感じるだろう。

心では、このままじゃダメだって思いつつも、結局なにもできない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800420ri">
「大丈夫？」

今度は必死にうなずいた。
かなり挙動不審に見られているかもしれない。

{	Stand("bu梨深_制服_通常","normal", 200, @+150);
	DeleteStand("bu梨深_制服_正面_sad", 500, false);
	FadeStand("bu梨深_制服_通常_normal", 500, true);}
//◆安心して
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800430ri">
「そう。だったらいいんだ」

梨深の声音は優しい。
信じられない話だけど、彼女は無言の僕に辛抱強く付き合ってくれるらしい。

“大丈夫？”か……。

ふと、尋ねてみたくなった。

梨深にはあのときの――１０７前で僕と会ったときのことが、どう見えていたんだろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流１へ


}


//=============================================================================//

if($妄想トリガー１５ == 1)
{

//☆☆☆
//分岐２
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume("SE01", 100, 0, NULL);
	DelusionIn();

	BoxDelete(0);

	Delete("*");

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Fade("back04", 0, 1000, null, true);
	Stand("bu梨深_制服_正面","sad", 200, @+100);
	FadeStand("bu梨深_制服_正面_sad", 0, true);

	DelusionIn2();

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
なにか、言わなきゃ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800440ta">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800450ri">
「…………」

なにか、言わなきゃいけない……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800460ta">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800470ri">
「…………」

でも……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800480ta">
「…………」

//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800490ri">
「…………」

なにを言えばいいのか……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800500ta">
「…………」

//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800510ri">
「…………」

考えれば考えるほど、追い詰められて、頭が真っ白になって。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800520ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//◆泣く
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800530ri">
「ぐす……っ」

ふと梨深が鼻をすすった。
驚いて、反射的に顔を上げる。

//◆泣く
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800540ri">
「…………」

泣いていた。
なぜか分からないけど、梨深はぽろぽろと涙を流していた。

僕はますます混乱して、間抜けな感じで絶句して、もうなにも考えられなくなる。

//◆涙声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800550ri">
「あたし……」

湿った声で、梨深がつぶやく。

//◆涙声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800560ri">
「タクに、嫌われちゃってるのかな」

//◆涙声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800570ri">
「ごめん、もう、話しかけないから……」

//◆涙声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800580ri">
「ごめんね。あたし、邪魔だよね……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_正面_sad", 300, true);

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE02", 0, 700, 0, 1000, null, false);
	SetVolume("SE02", 1000, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
そして梨深は、踵を返して早足で教室を出ていってしまった。

叫びたかった。
違うんだ、って、言いたかった。
嫌ってなんていない。

ただ、どうしていいか分からないだけなのに……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back05", 100, 0, 0, 1280, 720, "Black");
	Fade("back05", 0, 0, null, false);
	Fade("back05", 1000, 1000, null, true);
	Delete("back04");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
追いかけるべきか、迷った。
でも、僕は結局自分の席から腰を上げることができない。

追いかけて、なんて言えばいい？
なにが言える？

“キミのこと好きだよ”って言えばいいの？
“僕らは友達だよ”って言えばいいの？

……無理だ。

僕は梨深のことが分からない。

確かにこの前は梨深のおかげで救われたけど。

でも彼女は僕にとっていまだに、突然目の前に現れた謎の人物なんだ。

“嫌われちゃってるのかな”って言われたって、答えようがない。

好きなのか嫌いなのか判断する記憶がないんだから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");

	Stand("bu大輔_制服_通常","sigh", 200, @+150);
	FadeStand("bu大輔_制服_通常_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07800590mi">
「あーあ」

と、転校生の相手をしているはずの三住くんが戻ってきた。僕に哀れむような目を向けてくる。

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07800600mi">
「泣かせちまったな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800610ta">
「…………」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07800620mi">
「あいつ、前に俺に相談してきてたんだぜ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07800630mi">
「タクのことが好きなんだけど、全然気付いてもらえない、って」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800640ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
なんだよ、それ……。
いつ、そんなことになったんだ……。

僕は頭を抱えて激しく首を振った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800650ta">
「だって、分からないんだ……！　さっぱり、分からないんだよぅ！」

{	Stand("bu大輔_制服_通常","pride", 200, @+150);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07800660mi">
「分かるか分からないか、そんな理屈の話じゃねえだろ」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07800670mi">
「ま、結局お前は一生ニートやってろってこった」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//ＢＧ//黒
	SetVolume("SE01", 1000, 0, null);

	CreateColor("back05", 1000, 0, 0, 1280, 720, "Black");
	Fade("back05", 0, 0, null, false);
	Fade("back05", 1000, 1000, null, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);

	Wait(1000);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
それ以来、卒業するまで梨深と話す機会はなかった。

教室で顔を合わせても、互いに避けていた。

そして卒業後、僕は三住くんの予言通りニートになり、一生梨深と会うことはなかった……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//翠明学園教室

	DelusionOut();

	DeleteAll();

	CreateBG(100, 0, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");

	DelusionOut2();
	NegativeHuman();

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 1000, 700, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
……っていうバッドエンドになるかもしれない。

それはそれで悲しいけど。

でも梨深のことが分からないっていうのも事実なわけで。

やっぱり僕には、なにもできず黙り込むっていう選択肢しかない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 200, @+150);
	FadeStand("bu梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800680ri">
「……タク？」

ずっと黙り込んでいた梨深が、恐る恐るという感じでようやく声をかけてきた。

でも、僕はとっさのことにリアクションを返せなかった。たぶん、梨深からすると無視されたように感じるだろう。

心では、このままじゃダメだって思いつつも、結局なにもできない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800690ri">
「大丈夫？」

今度は必死にうなずいた。
かなり挙動不審に見られているかもしれない。

{	Stand("bu梨深_制服_通常","normal", 200, @+150);
	FadeStand("bu梨深_制服_通常_normal", 500, false);
	DeleteStand("bu梨深_制服_正面_sad", 500, true);}
//◆安心して
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800700ri">
「そう。だったらいいんだ」

梨深の声音は優しい。

どうやら信じられないことだけど、バッドエンドは避けられたらしい。

“大丈夫？”か……。

ふと、尋ねてみたくなった。

梨深にはあのときの――１０７前で僕と会ったときのことが、どう見えていただんだろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流１へ

}


//=============================================================================//

if($妄想トリガー１５ == 0)
{

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 0, 500, 0, 1000, null, true);

//☆☆☆
//分岐３

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
なにか言うべきかな……。

適当な挨拶？

でもそもそも僕は普段から挨拶なんてしない。
いきなりここで挨拶し出したら逆に不自然だ。

転校生についての話題でも振るか？

でもそもそも僕は普段から梨深と雑談なんてしてない。

いきなりここで雑談を開始したら逆に不自然だ。

え～っと……

一昨日のお礼とか？

いやその前にせっかく助けてくれたのに僕が邪険な態度を取ったことを謝るべきか？

あのときどうして梨深はあそこにいたかについて聞いてみるとか……

抱きしめてくれたのは僕に気があるからかって聞いてみるとか……

それともそれとも……あの『張り付け』現場にいた理由について聞くとか……

いやいやいや、どれも簡単に話題として振れる内容じゃないし！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","normal", 200, @+150);
	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800710ri">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800720ta">
「…………」

あああ、どうすりゃいいんだよぅ！

沈黙が僕にどんどんプレッシャーを与えてくる。

なにか喋った方がいい、このまま沈黙で通すのも気まずい、とは思うけど言葉が出ない。

うう、やっぱり三次元なんて嫌いだ……。

喋ろうとするだけでこんなに息が詰まるなんて、やってられない。
早く帰って星来たんに慰めてもらいたい……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800730ri">
「ねえ、タク」

梨深がようやく声を発した。

僕はビクッと身を震わせてしまった。
まだ顔を上げられない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_正面_normal", 500, true);

	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//◆小声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800740ri">
「その……一昨日は、あの後大丈夫だった？」

梨深の声が潜められる。

かすかに耳のあたりに息がかかったような気がして、驚いて視線だけを上げると、梨深は僕の方に顔を寄せて耳打ちしているのだった。

すぐ近くに梨深の身体がある。

あの道の真ん中で僕を抱きしめてくれた、柔らかくて温かい身体……。

梨深の身体の感触ばかりが思い出されて、頭の中は真っ白になりつつある。

//◆小声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800750ri">
「無事に帰れたかなって……けっこう心配した」

僕は必死でコクコクと何度もうなずいた。

{	Stand("bu梨深_制服_正面","normal", 200, @0);
	FadeStand("bu梨深_制服_正面_normal", 500, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, true);}
//◆小声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800760ri">
「そっか。よかった」

//◆小声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800770ri">
「もうあんな危ないことしちゃだめだぞ」

{	DeleteStand("bu梨深_制服_正面_normal", 500, true);
	Stand("bu梨深_制服_通常","normal", 200, @+150);
	FadeStand("bu梨深_制服_通常_normal", 500, true);}
それだけ言うと、梨深は離れていこうとする。

ふと、尋ねてみたくなった。
梨深は今“あんな危ないこと”って言ったけど。

あのときの状況は、梨深にはどう見えていたんだろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流１へ

}

//=============================================================================//

//☆☆☆
//合流１

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
特になにも言及しないことを考えると、渋谷の街から人が一時的に消えたことや、車椅子に乗った『将軍』のことはなにも知らないように思える。

ということはつまり、やっぱりあれは僕の妄想だったっていうことだよな……。

梨深にそれを聞いてみたい。

でも今さら顔を上げて質問するなんて、とてもできそうにない。
とにかく今日は無理だ。
心の準備もできてないし。

だから次だ。次に学校に来たときに聞こう。そうしよう。
それまでに聞いておくべき質問について整理もしておこう……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800780ri">
「あれ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800790ri">
「ね、タク。折原さんがこっち来たよ」

転校生が……？

なんでこっちに来るんだろう。
さっき階段で助けてあげなかったことについて、責めてくるのかな？

でもそういうタイプには見えないし……。

もしかすると僕じゃなくて梨深に用があるのかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_通常_normal", 500, true);
	Stand("bu梨深_制服_通常","normal", 200, @-300);
	Stand("bu梢_制服_通常","sad", 250, @+300);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	Wait(500);
	FadeStand("bu梢_制服_通常_sad", 700, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【梢】
<voice name="梢" class="梢" src="voice/ch04/07800800ko">
「…………」

転校生は梨深の横まで来て立ち止まった。

なにも言ってこない。
いったいなんだ？

梨深がいる手前、僕は顔を上げられない。

転校生は、つま先をもじもじとさせている。でもやっぱりなにも言おうとしない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800810ri">
「折原さん、どうしたの？」

{	Stand("bu梢_制服_通常","shy", 250, @+300);
	FadeStand("bu梢_制服_通常_shy", 300, true);
	DeleteStand("bu梢_制服_通常_sad", 0, true);}
//【梢】
<voice name="梢" class="梢" src="voice/ch04/07800820ko">
「…………っ」

と、なぜか転校生は、僕の机の端っこに、おずおずとばんそうこうをひとつ、置いた。

ヘンテコなキャラ――『ゲロカエルん』だ――が描かれている、ファンシーなばんそうこうだった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800830ta">
「……？」

//【梢】
<voice name="梢" class="梢" src="voice/ch04/07800840ko">
「…………」

これ……くれるっていうことだろうか。

うう、リアクションに困るぞ。
この折原梢っていう転校生、ちょっと変だ。

{	Stand("bu梢_制服_通常","sad", 250, @+300);
	FadeStand("bu梢_制服_通常_sad", 300, true);
	DeleteStand("bu梢_制服_通常_shy", 0, true);}
//【梢】
<voice name="梢" class="梢" src="voice/ch04/07800850ko">
「…………っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07800860ta">
「…………」

{	Stand("bu梨深_制服_通常","shock", 200, @-300);
	FadeStand("bu梨深_制服_通常_shock", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, true);}
//◆焦る
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800870ri">
「わわ、折原さん、泣かないで……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
はあ？
な、泣いてるのか……。

なんで泣いてるんだろう？
僕がなにも答えないから？

でも転校生の方だってなにも言わないじゃないか……。

{	Stand("bu梨深_制服_通常","normal", 200, @-300);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_shock", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800880ri">
「タクは怒ってるわけじゃないと思うよ」

梨深がフォローしてくれる。
なんだか不思議な気分だ。

僕は梨深のことをほとんどなにも知らないのに、梨深は僕のことを知っている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800890ri">
「彼って、あんまり人と目を合わせようとしないの。引っ込み思案ってやつ」

//【梢】
<voice name="梢" class="梢" src="voice/ch04/07800900ko">
「…………」

{	Stand("bu梨深_制服_通常","smile", 200, @-300);
	FadeStand("bu梨深_制服_通常_smile", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800910ri">
「だからそんなにガチガチに緊張しなくても……ね？　たはは」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","shy", 250, @+300);
	FadeStand("bu梢_制服_通常_shy", 500, true);
	DeleteStand("bu梢_制服_通常_sad", 0, true);
	Stand("bu梨深_制服_正面","normal", 200, @-300);
	DeleteStand("bu梨深_制服_通常_smile", 500, false);
	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601021]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800920ri">
「え？　あたしにもばんそうこうくれるの？　ありがとう」

{	DeleteStand("bu梢_制服_通常_shy", 500, true);}
と、転校生は深々と頭を下げると、逃げるように自分の席に戻っていった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_正面_normal", 500, true);

	Stand("bu梨深_制服_通常","shock", 200, @+100);
	FadeStand("bu梨深_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//◆絶句
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800930ri">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800940ri">
「え～っと、なんだかよく分かんないんだけど……タク、そのばんそうこう、もらってあげるべきだと思う」

なんでくれたんだろう？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_通常_shock", 500, true);
	Stand("bu大輔_制服_通常","smile", 250, @-300);
	Stand("bu梨深_制服_通常","normal", 200, @300);
	FadeStand("bu梨深_制服_通常_normal", 500, false);
	FadeStand("bu大輔_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601022]

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07800950mi">
「梢ちゃん、無口だよなー」

三住くんが戻ってくる気配。

{	Stand("bu大輔_制服_通常","pride", 250, @-300);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_smile", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07800960mi">
「転校初日に俺が校内を案内したんだけどよ」

{	Stand("bu梨深_制服_通常","rage", 200, @300);
	FadeStand("bu梨深_制服_通常_rage", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07800970ri">
「うわ、早くも手出したんだ……」

{	Stand("bu大輔_制服_通常","shock", 250, @-300);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07800980mi">
「まだ出してねーっつーの！」

{	Stand("bu大輔_制服_通常","pride", 250, @-300);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_shock", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07800990mi">
「んで、まあ１時間ぐらいかけてあちこち回ったんだけど、もう俺ひとりで延々と喋り続けたよ。あんときはさすがにちぃーっと疲れたぜ」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07801000mi">
「しかもすぐ泣きべそかく」

{	Stand("bu梨深_制服_通常","hard", 200, @300);
	FadeStand("bu梨深_制服_通常_hard", 300, true);
	DeleteStand("bu梨深_制服_通常_rage", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07801010ri">
「そうそう。今も急に泣き出したから、
なにが起きたかと思ってあたふたしちゃった」

{	Stand("bu大輔_制服_通常","normal", 250, @-300);
	Stand("bu梨深_制服_通常","normal", 200, @300);
	FadeStand("bu大輔_制服_通常_normal", 300, false);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, false);
	DeleteStand("bu梨深_制服_通常_hard", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07801020mi">
「そんだけピュアなんだよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07801030mi">
「なあタク。お前なら分かるだろ。梢ちゃんの仕草ひとつひとつのかわいさってのがよ！」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07801040mi">
「お前流に言うなら、萌え～～ってヤツだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07801050ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","worry", 250, @-300);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07801060mi">
「なんだ？　クソでも我慢してんのか？」

僕は全力で首を左右に振った。

{	Stand("bu梨深_制服_正面","sad", 200, @300);
	DeleteStand("bu梨深_制服_通常_normal", 500, false);
	FadeStand("bu梨深_制服_正面_sad", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07801070ri">
「タク、さっきからちっとも喋ってくれないんだ」

それは梨深がいるからだよ……。

まだ心の準備ができてないんだよ。僕は女友達と親しげに話すなんてこと、したことがないんだ。

そもそも女の友達ができたことも人生の中で一度もないし。

{	Stand("bu梨深_制服_通常","normal", 200, @300);
	DeleteStand("bu梨深_制服_正面_sad", 500, false);
	FadeStand("bu梨深_制服_通常_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07801080ri">
「でもさ、今折原さんと話してみてなんとなく思ったんだけど……」

{	Stand("bu梨深_制服_右向き","hurry", 200, @300);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);
	FadeStand("bu梨深_制服_右向き_hurry", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07801090ri">
「彼女と話してると、なんだか疲れちゃいそうかも……
なんて。たはは……」

{	Stand("bu大輔_制服_通常","normal", 250, @-300);
	FadeStand("bu大輔_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07801100mi">
「女子ってのはマジで同性に対して容赦ねーな。ま、梢ちゃんは俺が守るからいいけどな」

{	Stand("bu梨深_制服_通常","hard", 200, @300);
	FadeStand("bu梨深_制服_通常_hard", 300, true);
	DeleteStand("bu梨深_制服_右向き_hurry", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07801110ri">
「ほんの数十秒前に、大ちんも“相手するの疲れた”って言ってなかった～？」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07801120mi">
「うっせ」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07801130mi">
「梢ちゃんはタクと同じ匂いがするぜ。ほっとけねーって感じ」

{	Stand("bu梨深_制服_通常","normal", 200, @300);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_hard", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07801140ri">
「あ、それは分かるかも」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07801150ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//	DeleteStand("bu大輔_制服_通常_normal", 500, false);
//	DeleteStand("bu梨深_制服_通常_normal", 500, true);

//おがみ：シナリオ修正　12/17
/*
そうか、そう言えばあの転校生が最初にこのクラスにやって来たとき、そんなようなことも言ってたっけ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_normal", 500, false);
	DeleteStand("bu梨深_制服_通常_normal", 500, true);
	CreateColor("back04", 200, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);
	CreateTextureEX("back05", 100, 0, 0, "cg/ev/ev031_01_0_梢転校_a.jpg");
	Fade("back04", 500, 300, null, false);
	Fade("back05", 500, 1000, null, true);
	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601023]
//ＶＦ//回想セリフ
//【梢】
<voice name="梢" class="梢" src="voice/ch04/07801160ko">
「この人……似てる……」

//【梢】
<voice name="梢" class="梢" src="voice/ch04/07801170ko">
「同じクラスでよかった」

あれって、そういう意味だったのかな……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

*/

	ClearAll(2000);


//～～Ｆ・Ｏ

}