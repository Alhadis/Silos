

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_165_あやせ編_小さな世界の希望となって";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_165_あやせ編_小さな世界の希望となって();
}


function cha_165_あやせ編_小さな世界の希望となって()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編
//ＳＥ//衝撃音
//ＢＧ//道玄坂・崩壊後
	PrintBG(1000);

	CreateSE("SEおど","SE_衝撃_衝撃音01");
	MusicStart("SEおど", 0, 700, 0, 1000, null, false);

	CreateColor("White", 1500, 0, 0, 1280, 720, "White");

	Fade("White", 0, 0, null, true);
	Fade("White", 200, 1000, null, true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");

	Stand("stあやせ_制服_自分抱きしめ","sad", 250, @-50);
	FadeStand("stあやせ_制服_自分抱きしめ_sad", 0, true);

	Delete("back*");

	Wait(200);

	FadeDelete("White", 1000, true);

	CreateSE("SE3699","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE3699",2000,400,0,1000,null,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
景色が元に戻る。
この色は、僕の世界だ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300460ta">
「あやせは、ず、ずっとあんな世界を、見てきたの？」

あやせは小さくうなずいた。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300470ay">
「生まれたときからずっと。それが、当たり前のことだと思っていたわ、世界の構造として」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300471ay">
「でも違うのね。今、拓巳の話を聞いて、理解できたわ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300480ta">
「あの、く、黒い靄は、なんなの？」

{	Stand("stあやせ_制服_通常","hard", 250, @-50);
	DeleteStand("stあやせ_制服_自分抱きしめ_sad", 300, false);
	FadeStand("stあやせ_制服_通常_hard", 300, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300490ay">
「邪心よ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300500ay">
「誰でも持っているものなの、人ならば。そしてこの邪心が、グラジオールの糧となり、形を作り出していく」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300510ay">
「見えた？　人々の負の妄想が」

負の妄想って、まさか、ノイズとともに変化する、人々の非道で残虐な振る舞いのこと？

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300520ay">
「私は昔から、見てきた」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300530ay">
「黒騎士ならば、程度の差はあっても、みんな見えているはずよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300540ay">
「そこにあるのは、むき出しの悪意。むき出しの欲望」

あんな世界を、あやせは生まれたときから見てきたって言うの？

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300550ay">
「拓巳……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300560ay">
「私が望む結末は……」

{	Stand("stあやせ_制服_通常","angry", 250, @-50);
	FadeStand("stあやせ_制服_通常_angry", 300, true);
	DeleteStand("stあやせ_制服_通常_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300570ay">
「この錆び付いた世界から、魂ごと、抜け出すこと」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300580ay">
「そのためには、グラジオールを倒さなければならないのよ」

あやせが僕に歩み寄ってくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("stあやせ_制服_通常_angry", 500, true);
	Stand("buあやせ_制服_通常","normal", 250, @-50);
	FadeStand("buあやせ_制服_通常_normal", 500, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300590ay">
「だから、見つけて」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300600ay">
「後は、拓巳だけなの」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300610ay">
「ディソードを、見つけて……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300620ta">
「む、無理だ……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_掴む");
	MusicStart("SE01", 0, 700, 0, 1000, null, false);

	Stand("buあやせ_制服_通常","shock", 250, @-50);
	FadeStand("buあやせ_制服_通常_shock", 300, true);
	DeleteStand("buあやせ_制服_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
たまらず、あやせの肩をつかんで押しのけた。
あやせはショックを受けたかのように、目を見開く。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300630ay">
「なぜ……？　あきらめるの……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300640ta">
「僕は、あやせが思うほど、すごい人間じゃ、ない……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300650ta">
「どれだけ望んでも、ディソードが手に入る兆候すら、
ないじゃないか……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300660ta">
「Ｏ－ＦＲＯＮＴのときも、そ、そうだったし……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300670ta">
「地震が起きてからも、そうだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300680ta">
「方法が分からないんだ……。
ディソードなんて、手に入れられないよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300690ta">
「自信が、ないよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_通常","hard", 250, @-50);
	FadeStand("buあやせ_制服_通常_hard", 300, true);
	DeleteStand("buあやせ_制服_通常_shock", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300700ay">
「それなら、なぜ私を助けたの？」

あやせに詰め寄られた。
僕は逃げるように後ずさる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300710ta">
「た、助けたって、い、いったいなんのことを……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300720ay">
「私が学校の屋上から飛び降りたとき――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300730ay">
「キミが、花壇のある世界を産み出した」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300740ay">
「だから私は、ひとつ上のステージに魂を移すことはできなかったわ」

あれは、たまたまだ。
意識的にやったわけじゃない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300750ay">
「それでもいいと思った。キミの力を、知ることができたから」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300760ay">
「あのときから、キミが私の希望になったから」

勝手に、希望にしないで。
僕に、期待しないでくれ……。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300770ay">
「拓巳……。自分を卑下しないで」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300780ay">
「それは邪心王の精神侵略よ。負けてはいけないわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300790ay">
「キミには力がある。確実に」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300800ay">
「手に入れられる。必ず。ディソードを」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300810ta">
「む、無理だ。無理だよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	DeleteStand("buあやせ_制服_通常_hard", 300, true);
//おがみ：先行読み込み
	CreateSE("SE02","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
	CreateSE("SEおど","SE_衝撃_衝撃音02");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
僕はあやせに付いていこうと思った。僕を守ってくれそうなのはあやせしかいなかった。

だけど、こうして一緒に過ごしてみて、分かった。
僕は、あやせの考えには付いていけない……。
あまりに、僕とは、世界への認識が違いすぎて。

……はっきり言うなら。
メンヘラには、付き合いきれないっていうこと。

最低だよね、僕は。
でも所詮、僕はこんな人間でしかないんだ……。

{	Stand("buあやせ_制服_自分抱きしめ","sad", 250, @-50);
	FadeStand("buあやせ_制服_自分抱きしめ_sad", 300, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300820ay">
「なぜそんなことを言うの……？」

あやせが、泣きそうな表情で僕にすがりついてくる。
いつものクールでアンニュイなあやせじゃなかった。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300830ay">
「私はこんな世界にいたくない。お願い、解放して。私を」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300840ay">
「私の、希望になって」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300850ay">
「黒騎士として、目覚めて……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300860ta">
「無理だよっ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//おがみ：先行読み込み
	CreateColor("Red", 1000, 0, 0, 1280, 720, "Red");
	Fade("Red", 0, 0, null, true);
	Request("Red", AddRender);

	Stand("buあやせ_制服_通常","angry", 250, @-50);
	DeleteStand("buあやせ_制服_自分抱きしめ_sad", 300, false);
	FadeStand("buあやせ_制服_通常_angry", 300, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300870ay">
「無理じゃないわ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3699", 500, 0, null);

//ＳＥ//衝撃音
//ＢＧ//道玄坂・崩壊後・錆び付いた世界（または「おどろおどろしいイメージ」）
	CreateTextureEX("背景０", 100, 0, 0, "cg/bg/bg027_05_6_chn道玄坂_a.jpg");

//ＳＥ//衝撃音
//ＢＧ//おどろおどろしいイメージ
	CreateMovie360("砂嵐", 500, Center, Middle, true, false, "dx/mv砂嵐.avi");	
	MusicStart("SE02",0,1000,0,1000,null,true);
	Fade("砂嵐", 0, 1000, null, true);


	Wait(500);
	SetVolume("SE02", 0, 1, null);

	Fade("砂嵐", 0, 0, null, true);

	Wait(500);
	SetVolume("SE02", 0, 1000, null);

	Fade("砂嵐", 0, 1000, null, true);
	Fade("背景０", 0, 1000, null, true);

	Delete("背景１");
	DeleteStand("buあやせ_制服_通常_angry", 0, true);

	Fade("Red", 200, 1000, null, true);


	MusicStart("SEおど", 0, 700, 0, 1000, null, false);
	SetVolume("SE02", 1500, 300, null);

	FadeDelete("Red", 1000, false);
	Fade("砂嵐", 1000, 0, null, true);
	Delete("砂嵐");

	Wait(1000);

	BGMPlay360("CH26", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300880ta">
「あ……っ！」

あやせの世界と、またも同期してしまった。

あやせの胸から溢れ出した黒い靄が、僕の身体に巻き付いている。
まるでアナコンダが獲物をゆっくりと絞め殺すように、僕の身体の表面を這う。

ゾクリと、鳥肌が立つほどの、おぞましい気配。

それは、あやせのむき出しの欲望だ。

僕は――僕だけじゃなくて、あらゆる人間は――他人のむき出しの感情を見ることに、慣れていない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300890ta">
「ひ……」

ノイズが走る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_通常","shy", 250, @-50);
	FadeStand("buあやせ_制服_通常_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300900ay">
「キミは私の希望」

あやせが僕を見つめてくる。
その瞳は、真っ黒に染まっている。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300910ay">
「キミを離さないわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300920ay">
「繋ぎ止める、どんな手を使ってでも」

{	CreateSE("SE01","SE_じん体_動作_服を脱ぐ");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
あやせの指が、僕の上着のボタンをひとつずつ外していく。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300930ay">
「キミが欲しいの」

僕に密着してきた。
病室のクローゼットでキスをしたときみたいに。

僕は蛇ににらまれたカエル。動けない。

上着のボタンがすべて外されて、胸をはだけさせられる。
さらにベルトも緩められ、ズボンのチャックを下ろされて。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300940ay">
「キミの、力が、欲しいの」

あやせのひんやりと冷たい手が、一度、僕の胸を撫でたかと思うと。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//肉を抉る
//ＳＥ//血が噴き出す
	CreateSE("SE02","SE_擬音_お腹裂く");
	CreateSE("SE03","SE_じん体_血_噴きでる");
	CreateSE("SE04","SE_じん体_心臓_鼓動");

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Wait(500);

	CreateColor("痛い", 2000, 0, 0, 1280, 720, "Red");
	Request("痛い", AddRender);
	Fade("痛い", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
あやせは、爪を立ててきた。
激痛が走る。
それでも身動きは取れず。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300950ta">
「あ、ぐ……っ」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300960ay">
「欲しいのよ」

指が、僕の肉を抉り。
骨をかき分け。

//ＳＥ//心臓の鼓動
{	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	Fade("痛い", 100, 800, null, true);
	FadeDelete("痛い", 100,. true);}
ドクン、ドクンと鼓動する僕の心臓を、優しくわしづかみにした。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300970ta">
「あ……あぁ……」

震える。恐怖と、痛みと、あやせの指先の冷たさに。

{	Stand("buあやせ_制服_自分抱きしめ","ero", 250, @-50);
	DeleteStand("buあやせ_制服_通常_shy", 300, false);
	FadeStand("buあやせ_制服_自分抱きしめ_ero", 300, true);}
//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300980ay">
「あったかい……」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300990ay">
「もらうわね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01301000ta">
「や、やめ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//肉を抉る
//ＳＥ//血が噴き出す
	CreateSE("SE02","SE_擬音_お腹裂く");
	CreateSE("SE03","SE_じん体_血_噴きでる");

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	CreateMovie360("ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");
//	Request("ムービー", Play);
	Wait(500);
	Fade("ムービー", 300, 0, null, true);
	Delete("ムービー");

	CreateColor("Red", 1000, 0, 0, 1280, 720, "Red");
	Fade("Red", 0, 800, null, true);
	Fade("Red", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
ブチブチと血管が引きちぎられる感触。
血が、胸から大量に溢れ出す。

持って行かれる……！
僕の心臓が……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音
//ＢＧ//道玄坂・崩壊後
	SetVolume360("CH*", 500, 0, NULL);

	CreateSE("SEおど","SE_衝撃_衝撃音01");
	MusicStart("SEおど", 0, 700, 0, 1000, null, false);

	CreateColor("White", 2000, 0, 0, 1280, 720, "White");

	Fade("White", 0, 0, null, true);
	Fade("White", 200, 1000, null, true);

	DeleteStand("buあやせ_制服_自分抱きしめ_ero", 0, true);
	CreateTexture360("背景０", 100, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");

	Delete("Red");

	Wait(2000);

	FadeDelete("White", 0, true);

	CreateSE("SE3699","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE3699",2000,400,0,1000,null,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01301010ta">
「ぁぁぁああっ！」

世界の色が、瞬時に変化した。
元の、くすんだ世界。

赤錆は消えていた。
僕の身体は、無傷だった。

胸に手を添えてみると、ちゃんと鼓動を感じた。
そこに、心臓がある。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3699", 1000, 0, null);


	Stand("buあやせ_制服_自分抱きしめ","sad", 250, @-50);
	FadeStand("buあやせ_制服_自分抱きしめ_sad", 500, true);

	BGMPlay360("CH16", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//◆苦しげなブレス
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301020ay">
「……っ」

あやせは、自らを抱きしめるようにして、僕の前に立っていた。
その表情は、とても悲しそうだった。
今にも、泣き出しそうな顔。

まただ。優愛からディソードを手に入れたときも。
スクランブル交差点で僕があやせの世界を初めて見たときも。
セナとこずぴぃからディソードを手に入れたときも。

あやせは、そんな、泣くのをこらえているような顔で僕を見ていた。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301030ay">
「た……くみ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301040ay">
「そんなつもりじゃ、ないの……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301050ay">
「邪心を、制御できなくなっているわ、私も……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301060ay">
「取り込みすぎたせいかもしれない、ディソードを……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301070ay">
「邪心王の精神侵食で、私は、おかしくなりつつある……」

それもすべて、あやせの妄想じゃないのか？
語る言葉は、すべて詭弁なんじゃないのか？

ふと、そう思ったけど、僕はそれを口には出さなかった。
出せるわけ、なかった。

いつもマイペースで、あまり表情を変えようとしなかったあやせが、こんなにも、悲しそうだから。

今にも壊れてしまいそうな脆い姿を、僕にさらけ出しているから。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01301080ta">
「僕は……ど、どうすればいい……？」

声をかけると、あやせの目尻に、わずかに涙が溢れた。
僕に、すがるような視線を向けてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_抱く1");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301090ay">
「……私は、支配されつつあるわ。邪心王の攻撃によって」

//◆保てない＝たもてない
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301100ay">
「このままじゃ、自我を保てない……。だから……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301110ay">
「取り除いて。私の中を侵食する、不浄なる邪心を」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01301120ta">
「と、取り除くって、どうやって……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301130ay">
「私の世界を見たでしょう？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301140ay">
「あの、黒い靄は、人が持つ不浄なる邪心が具現化したもの」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301150ay">
「むき出しの、悪意」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301160ay">
「それをつかんで、私の身体から、引き抜いて……」

無理だ……。
そんなおぞましいこと、できるわけがない……！

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301170ay">
「はぁ、はぁ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301180ay">
「お願い、拓巳……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301190ay">
「私は、私でいたいの」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01301200ay">
「私の世界を、救って……！」

{	MusicStart("SE01",0,1000,0,1000,null,false);
	DeleteStand("buあやせ_制服_自分抱きしめ_sad", 500, true);}
よろよろと、あやせはその場にへたり込んだ。
とても弱々しい姿。

約束した。あやせは、こう言ったんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE回想in","SE_衝撃_衝撃音02");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2500, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateColor("回想明度", 2400, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

//▼べー：BG:ディソード3本バージョンへ差し替え
	CreateTexture360("回想背景", 2000, 0, 0, "cg/bg/bg102_01_3_chnあやせ病室_a.jpg");
	Stand("buあやせ_パジャマ_通常_血まみれ","shy", 2200, @-50);
	FadeStand("buあやせ_パジャマ_通常_血まみれ_shy", 0, true);

	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(100);

//■３６０：ＶＦ：ファイル名、タグ調整
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602010]
//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700500ay_efx">
「キミを守るわ。キミも、私を守って」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Wait(100);

	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("回想明度");
	Delete("回想背景");
	DeleteStand("buあやせ_パジャマ_通常_血まみれ_shy", 0, true);

	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603010]
セナもこずぴぃも、もう壊れてしまった。
梨深はいなくなってしまった。

だから、ここであやせまで失いたくなかった。
そんな打算があった。

でもなによりも。

助けたい。

僕にできるわけないって、自覚してる。

それでも、例えあやせのデンパだったのだとしても。
例えあやせの妄想でしかなかったのだとしても。

助けてあげたい――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 1000, 0, NULL);

}






