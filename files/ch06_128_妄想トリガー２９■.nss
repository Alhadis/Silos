//<continuation number="690">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_128_妄想トリガー２９■";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch06_128_妄想トリガー２９■();
}


function ch06_128_妄想トリガー２９■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


if($GameDebugSelect == 1)
{
	SetChoice02("梨深ルート有り","梨深ルート無し");
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
			$梨深ルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$梨深ルート=false;
		}
	}
	$GameDebugSelect = 0;
}


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景２", 100, -480, -96, "cg/bg/bg163_01_3_渋谷夜景暗い_a.jpg");
	Request("背景２", Smoothing);
	Move("背景２", 0, @264, @0, null, true);
	Move("背景２", 0, @160, @24, null, true);
	Zoom("背景２", 0, 1500, 1500, null, true);
	Fade("背景２", 0, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１３へ
//ネガティブ妄想→分岐１４へ
//妄想しない→分岐１５へ

if($妄想トリガー通過２９ == 0)
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
			$妄想トリガー２９ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー２９ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー２９ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー２９ == 2)
{
//☆☆☆
//分岐１３


	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionIn();

	BoxDelete(0);

	Delete("背景*");
	Delete("色*");

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg161_01_6_妄想世界_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Stand("st星来_覚醒後_通常","normal", 200, @0);
	FadeStand("st星来_覚醒後_通常_normal", 0, true);

	DelusionIn2();

	BGMPlay360("CH07",4000,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
でも、七海が……

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800010se">
「タッキーはよくやったよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800020se">
「妹を亡くした悲劇の兄として、今後もやってけるって♪」

悲劇の兄……。

//◆ＰＴＳＤ＝ピーティーエスディー
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800030se">
「ＰＴＳＤって言えばなにもかも許されるっしょ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800040se">
「正々堂々と引きこもれるんだよ？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800050se">
「あ、もしかしたらさ、どっかの偽善者が同情して、タッキーを養ってくれるかもしんないね」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800060se">
「ブログに適当なこと書けば、出版社に目を付けられてベストセラーになっちゃうかも！」

{	Stand("st星来_覚醒後_通常","happy", 200, @0);
	FadeStand("st星来_覚醒後_通常_happy", 300, true);
	DeleteStand("st星来_覚醒後_通常_normal", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800070se">
「“日本中が泣いた”とか白々しいキャッチコピーが付けられて、
　それに乗せられたバカでゆとりな人たちからの
　“感動した、共感した”っていう絶賛の嵐！」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800080se">
「それで印税もがっぽがっぽ。半年後に映画化決定っしょ！」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800090se">
「すごいよ。七海っちをここで見殺しにするだけで、タッキーにはバラ色の人生が待ってるんさ！」

{	Stand("st星来_覚醒後_通常","normal", 200, @0);
	FadeStand("st星来_覚醒後_通常_normal", 300, true);
	DeleteStand("st星来_覚醒後_通常_happy", 200, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800100se">
「さあ、どっちを選ぶ？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800110se">
「タッキーがここで頑張って、でも死んですべてが無になるか」

{	Stand("st星来_覚醒後_通常","happy", 200, @0);
	FadeStand("st星来_覚醒後_通常_happy", 300, true);
	DeleteStand("st星来_覚醒後_通常_normal", 200, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800120se">
「バラ色の人生か」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流５へ

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionOut();

	Delete("背景*");
	Delete("色*");
	DeleteStand("st星来_覚醒後_通常_happy", 0, true);

	DelusionOut2();
	PositiveHuman();

}


//=============================================================================//

if($妄想トリガー２９ == 1)
{
//☆☆☆
//分岐１４

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionIn();

	BoxDelete(0);

	Delete("背景*");
	Delete("色*");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg161_01_6_妄想世界_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Stand("st星来_覚醒後_通常","normal", 200, @0);
	FadeStand("st星来_覚醒後_通常_normal", 300, true);

	DelusionIn2();

	BGMPlay360("CH01",4000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
でも、七海が……

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800130se">
「じゃあはっきり言ったげる」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800140se">
「七海っちが死んだっていいじゃん」

え……

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800150se">
「タッキーは、自分の命より七海っちの命の方が大事なの？」

な、七海は僕の、大切な妹で……

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800160se">
「でも、突き詰めれば他人っしょ？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800170se">
「死んだら悲しいけど、それだけ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800180se">
「タッキーになにか害が及ぶ？」

………………及ばない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800190se">
「自分の命と、他人の命と、どっちが大事？」

{	Stand("st星来_覚醒後_通常","sad", 200, @0);
	FadeStand("st星来_覚醒後_通常_sad", 300, true);
	DeleteStand("st星来_覚醒後_通常_normal", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800200se">
「死んだらさ、世界が終わるんだよ？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800210se">
「タッキーにとっての世界は終わるの。分かる？　死んだら後はなにも残らない」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800220se">
「死後の世界なんてない。天国もない。生まれ変わることもない」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800230se">
「ただ、タッキーっていうひとりの動物の生命活動が終わって、タッキーはもう世界を“観測”できなくなるんさ。それって世界が終わるってことっしょ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800240se">
「つまりさ――」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800250se">
「タッキーが死んだら、タッキーが観測してた七海っちもどうせ消えるってことなんだよ。七海っちだけじゃない。梨深っちも、あやせっちも、それにあたしも」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800260se">
「みんな消える」

{	Stand("st星来_覚醒後_通常","normal", 200, @0);
	FadeStand("st星来_覚醒後_通常_normal", 300, true);
	DeleteStand("st星来_覚醒後_通常_sad", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800270se">
「でも、七海っちが死んだだけなら、タッキーは消えないで済むし、タッキーの世界も消えないで済むんさ」

{	Stand("st星来_覚醒後_通常","happy", 200, @0);
	FadeStand("st星来_覚醒後_通常_happy", 300, true);
	DeleteStand("st星来_覚醒後_通常_normal", 200, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800280se">
「ブラチューの最終回もちゃんと見られるし、来年発売予定のブラチューのゲームも、あたしの新作フィギュアも、ちゃんと買える世界が残るんさ」

{	Stand("st星来_覚醒後_通常","normal", 200, @0);
	FadeStand("st星来_覚醒後_通常_normal", 300, true);
	DeleteStand("st星来_覚醒後_通常_happy", 200, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800290se">
「ねえ、タッキー」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800300se">
「死にたい？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800310se">
「死にたくない？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionOut();

	DeleteStand("st星来_覚醒後_通常_normal", 0, true);
	Delete("背景*");
	Delete("色*");

	DelusionOut2();
	NegativeHuman();

//合流５へ

}


//=============================================================================//

if($妄想トリガー２９ == 0)
{
//☆☆☆
//分岐１５


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
でも、七海が……

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800320se">
「どうせ生意気な七海っちのことだからさ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 3000, 0, null);
	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	CreateColor("色２", 250, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);
	Fade("色２", 0, 500, null, true);
	Stand("bu星来_覚醒後_通常","normal", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_normal", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800330se">
「ここでタッキーが頑張って助けたって、
感謝してくれなさそうじゃん？」

その核心を突いた星来たんの言葉に、僕はハッとした。

確かに、僕が命を賭けて助けても、七海ならきっとこう言うだろう。

{	Stand("bu七海_制服_キレ","mad", 200, @0);
	DeleteStand("bu星来_覚醒後_通常_normal", 0, true);
	FadeStand("bu七海_制服_キレ_mad", 100, true);}
//◆怒った口調で
//ＶＦ//妄想セリフ
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12800340na">
「おにぃのせいでこんな目に遭ったんだからね、バカ！」

{	Stand("bu星来_覚醒後_通常","normal", 200, @-100);
	DeleteStand("bu七海_制服_キレ_mad", 500, false);
	FadeStand("bu星来_覚醒後_通常_normal", 500, true);}
感謝すらせず、それどころか逆に罵られて。

僕は家族からも蔑まれてこれから生きていく羽目になるんだ。

なんだかんだ言ったって、七海はしょせん三次元の妹。

萌えもしないし、二次元キャラのようにキレイな心なんて持ってない。

あいつはいつも僕に対して上から目線で、密かに……いや、あからさまに僕のことバカにしてる。

あんな生意気な妹がどうなろうと僕の知ったことじゃない……。

星来たんならともかく、あのクソ妹には僕の命を賭ける価値はない。

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800350se">
「タッキー、自分のことだけ考えよう？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800360se">
「あたしはさ、タッキーに死んでほしくないな」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800370se">
「こうして、ずっとタッキーの脳内で、ふたりきりでお話し続けたいんよ」

僕もだよ……。
僕も、星来たんと話してるときが一番落ち着く。
七海なんて、どうでもいい……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu星来_覚醒後_通常_normal", 200, true);
	Fade("色２", 0, 0, null, true);
	Fade("色１", 1000, 0, null, true);

//合流５へ
}


//=============================================================================//

//☆☆☆
//合流５

	Wait(1000);

	CreateTextureEX("背景５", 100, 0, 0, "cg/bg/bg163_01_3_渋谷夜景暗い_a.jpg");
	Move("背景５", 0, @-320, @0, null, true);
	Fade("背景５", 2000, 1000, null, true);

	SoundPlay("SE*", 2000, 0, false);
	SetVolume360("CH*", 2000, 0, null);
	CreateSE("SE02","SE_はいけい_すくらんぶる交差点ガヤ_どよめき_LOOP");
	SoundPlay("SE02", 2000, 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800380ta">
「死にたく……ない……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800390ta">
「痛いのは、イヤだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800400ta">
「死ぬのは、イヤだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800410ta">
「消えるのは、イヤだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800420ta">
「七海がどうなろうと……僕は痛くもかゆくもない……」

自分に言い聞かせるように。
僕はブツブツとつぶやく。

正しいのは……『将軍』じゃない。星来たんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800430ta">
「あの剣は……剣に見えるだけで、剣じゃない。ただの光の反射とか、目の錯覚だ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	CreateColor("色２", 250, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);
	Fade("色２", 0, 500, null, true);
	Stand("bu星来_覚醒後_通常","normal", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_normal", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800440se">
「そうだよ。さあ、帰ろ？」

{	Stand("bu星来_覚醒後_通常","ero", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_ero", 200, true);
	DeleteStand("bu星来_覚醒後_通常_normal", 100, false);}
//◆優しく
//【星来】
<voice name="星来" class="星来" src="voice/chn00/00500010se">
「帰ったらさ、あたしのパンツ見ながら、いっぱいエッチなこと想像していいから」

//【星来】
//<voice name="星来" class="星来" src="voice/ch06/12800450se">
//「帰ったらさ、あたしのパンツ見ながら、いっぱいオナニーしていいから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800460ta">
「…………うん。僕、帰る」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800470ta">
「帰って……星来たんでハァハァするよ……」

{	Stand("bu星来_覚醒後_通常","happy", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_happy", 200, true);
	DeleteStand("bu星来_覚醒後_通常_ero", 100, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800480se">
「嬉しいな」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12800490se">
「タッキーのために、エッチなポーズたくさんしてあげるね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

//ＢＧ//Ｏ－ＦＲＯＮＴ屋上
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg089_01_3_Ｏ－ＦＲＯＮＴ屋上_a.jpg");
	DeleteStand("bu星来_覚醒後_通常_happy", 1000, true);
	Delete("色２");
	Fade("色１", 2000, 0, null, true);

	SoundPlay("SE*", 2000, 0, false);
	BGMPlay360("CH22",3000,1000,true);

	Wait(1000);
	Delete("色１");
	Delete("背景５");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
僕は伸ばした手をゆっくりと引っ込めた。
それだけで、とても安らかな気持ちになる。

胸元のポケットに入っている星来たんを取り出して、その笑顔を眺める。星来たんが許してくれるなら、僕は他になにもいらない……。

鼻から垂れた鼻水をすすった。
回れ右して、『将軍』の方に歩み寄る。

//◆あくまで余裕の態度
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12800500su">
「誰が、動いていいと許可した？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12800510su">
「クエストはまだクリアしていないぞ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800520ta">
「僕は……勇者なんかじゃない……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800530ta">
「妹ひとり救えないような、ヘタレな、キモオタ……だよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800540ta">
「僕に、期待しないで……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800550ta">
「僕を、見ないで……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800560ta">
「僕を、そっとしておいて……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12800570su">
「では、七海ちゃんは殺すことにするよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800580ta">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800590ta">
「どうせ、もう死んでる……」

もう、死んでるんだ……。

七海は、『将軍』に無惨に殺されたんだ。

ニュージェネ第６の事件として、明日にでも大々的に報道されるんだ。

悲しいけど、僕にはどうしようもない……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
//ＣＧ//血だまりに倒れている七海
//片手の手首が切断されている。
//ＳＥ//ぴちゃん、ぴちゃんと、一定の間隔で水滴音（七海の切断された手首から垂れている血）

//※５秒ほど見せてから……
	Delete("*");
	ClearAll(0);
	SoundPlay("SE*", 100, 0, false);
	BGMPlay360("CH*", 100, 0, false);

	DelusionIn();

	DelusionIn2();

	CreateSE("SE01","SE_じん体_手首_たれる血");
	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev067_01_6_血溜り七海_a.jpg");
	Fade("色１", 0, 1000, null, true);
	Fade("背景１", 0, 1000, null, true);

	Wait(500);
	SoundPlay("SE01", 0, 1000, true);
	SoundPlay("SE02", 0, 1000, true);
	Wait(2000);
	Fade("色１", 0, 0, null, true);
	Wait(500);
	Fade("色１", 0, 1000, null, true);
	Wait(2000);
	Fade("色１", 0, 0, null, true);
	Wait(500);
	Fade("色１", 0, 1000, null, true);
	Wait(1000);
	Fade("色１", 0, 0, null, true);
	Wait(300);
	Fade("色１", 0, 1000, null, true);
	Wait(300);
	Fade("色１", 0, 0, null, true);
	Wait(300);
	Fade("色１", 0, 1000, null, true);
	Wait(200);
	Fade("色１", 2000, 0, null, true);


	Wait(3000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆息も絶え絶え
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12800600na">
「おにぃ……」

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12800610na">
「お……にぃ……」

水滴が、垂れている音がする。
それは、水滴じゃなくて。

七海の血。

切断された手首から垂れる、真っ赤な血。

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12800620na">
「なんで……助け……て、くれ……なかったの……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12800630na">
「おにぃ……」

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12800640na">
「おにぃって……」

//◆冷たく
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12800650na">
「最低」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionOut();

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg089_01_3_Ｏ－ＦＲＯＮＴ屋上_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");

	DelusionOut2();

//ＢＧ//Ｏ－ＦＲＯＮＴ屋上

	Fade("色１", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800660ta">
「うわあああああああああああああああああああああああああああああああああああああああ！！！！！」

絶叫していた――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800670ta">
「よくも！　よくもよくもよくもよくもよくもよくもよくもよくもよくもよくもよくもよくもよくもよくも！！！！！！！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "RED");
	DrawTransition("色１", 300, 0, 1000, 100, null, "cg/data/effect.png", true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
世界が真っ赤に染まって。
怒りと悲しみと情けなさで、思考がぐちゃぐちゃになって。

{	CreateSE("SE01","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE01", 0, 1000, false);}
ただ訳もなく『将軍』に突進していた。
影の中にたたずむ『将軍』につかみかかる。

でも――

予想以上に手応えがなくて――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE*", 0, 0, false);

	CreateColor("色２", 150, 0, 0, 1280, 720, "Black");
	Fade("色２", 300, 1000, null, false);
	Shake("背景１", 300, 5, 5, 0, 0, 500, null, false);
	CreateSE("SE01","SE_衝撃_どんがらがっしゃーん");
	CreateSE("SE02","SE_衝撃_車椅す_転倒");
	SoundPlay("SE01", 0, 1000, false);
	SoundPlay("SE02", 0, 1000, false);


//ＳＥ//車椅子ごと拓巳は転倒

	Fade("色１", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
僕は車椅子ごと倒れ込んだ。

肘を打ったらしく、痛みが走る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色２", 3000, 0, null, true);
	Delete("色*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
顔をしかめながら、戸惑いつつ車椅子に座っていた人物の姿を探す。

僕の足許に、生首が、転がっていた。

恐る恐る、手を伸ばしてみる。
それはとても硬くて。
生首ではなく、明らかに、

ヘルメットのようなものだった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800680ta">
「これ……」

真っ黒な、ヘルメット……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ダーススパイダーのヘルメット
	Wait(1000);
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg168_01_3_ダーススパイダーメット_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	CreateSE("SE01","SE_衝撃_衝撃音01");
	SoundPlay("SE01", 0, 1000, false);
	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12800690ta">
「ダ、ダーススパイダー……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(2000);
	ClearAll(2000);

//○実績No.7：第六章【Noah】
	XBOX360_Achieved(7);

	Wait(2000);

//※５秒ほどウエイト

//～～Ｆ・Ｏ

//第６章　ＥＮＤ

}