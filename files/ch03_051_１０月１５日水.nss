//<continuation number="220">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_051_１０月１５日水";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch03_051_１０月１５日水();
}


function ch03_051_１０月１５日水()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($GameDebugSelect == 1)
{
	SetChoice02("あやせルート有り","あやせルート無し");
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
			$あやせルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$あやせルート=false;
		}
	}
	$GameDebugSelect = 0;
}

	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",500,0,false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_01_1_拓巳部屋_a.jpg");
	Fade("背景１", 2000, 1000, null, true);

	Wait(1000);

//１０月１５日（水）//日付は表示しない
//ＢＧ//神泉の街並み//昼

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
今週はよりによって週に３回登校しなくちゃいけないんだよなあ。
はあ、憂鬱だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_自然_動物_カラス_鳴き声_LOOP");
	SoundPlay("SE01", 0, 200, true);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg005_01_1_KURENAI見上げ_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/l_blind.png", true);

	Wait(1000);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg014_01_0_神泉町並み_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	Wait(500);

	SoundPlay("SE01", 0, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text801]
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100010na">
「あ～～～～っ！！！」

と、少し離れたところから謎の奇声が聞こえてきた。
突然のことにビックリして、つい肩をすくめちゃったよ。
声のした方へそーっと目を向けてみると……

{	Stand("st七海_制服_通常","angry", 200, @-150);
	FadeStand("st七海_制服_通常_angry", 200, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05100020ta">
「げっ」

//ＣＨ//七海
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100030na">
「おにぃ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_制服_通常_angry", 300, true);
	CreateSE("SE01","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE01", 200, 500, false);
	Wait(2000);
	SoundPlay("SE01", 300, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
七海がものすごい勢いで僕のところに駆け寄ってきた。
逃げようと思ったけど、手遅れだった。回り込まれ、行く手を遮られる。こいつは昔から運動神経はいいんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH08", 0, 1000, true);
	Wait(500);
	Stand("bu七海_制服_通常","angry", 200, @-150);
	FadeStand("bu七海_制服_通常_angry", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100040na">
「ちょっと！　なんで妹見て逃げるの！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05100050ta">
「…………」

そんなの、鬱陶しいからに決まってるだろう……。

{	Stand("bu七海_制服_拗ね","angry", 200, @-150);
	FadeStand("bu七海_制服_拗ね_angry", 500, false);
	DeleteStand("bu七海_制服_通常_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100060na">
「あ、そうやってすぐ黙るし」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
ホント、どうしてこの妹はよりにもよって僕と同じ翠明学園に通うことにしたんだろう。僕にとってはとてつもなく迷惑だ。こうして学校で遭遇すると、ここぞとばかりにあれこれと干渉してくるから。

{	Stand("bu七海_制服_通常","normal", 200, @-150);
	FadeStand("bu七海_制服_通常_normal", 500, false);
	DeleteStand("bu七海_制服_拗ね_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100070na">
「ねーねー、ケータイどう？　使ってる？　使ってないでしょ？」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100080na">
「買ってからもう何日か経ってるけど、一度も家にかけてこないもんね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05100090ta">
「…………」

{	DeleteStand("bu七海_制服_通常_normal", 500, true);}
七海を振り切ろうと、僕は早足で歩き出す。
でも七海はしつこくついてきた。

{	Stand("bu七海_制服_通常","pride", 200, @-150);
	FadeStand("bu七海_制服_通常_pride", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100100na">
「家に生存報告の電話ぐらいしなよ。そのために買ったんだから」

{	Stand("bu七海_制服_拗ね","angry", 200, @-150);
	FadeStand("bu七海_制服_拗ね_angry", 500, false);
	DeleteStand("bu七海_制服_通常_pride", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100110na">
「どうしてもイヤなら、その……ナナのケータイにかけるだけでもいいからさ」

{	Stand("bu七海_制服_通常","angry", 200, @-150);
	FadeStand("bu七海_制服_通常_angry", 500, false);
	DeleteStand("bu七海_制服_拗ね_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100120na">
「お母さん心配してるんだからねっ」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100130na">
「そもそもちゃんとご飯食べてんの？
どーせコンビニ弁当ばっかなんでしょ？」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100140na">
「やっぱおにぃにひとり暮らしは無理なんだよ。家に帰ってきなよ」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100150na">
「ナナがどんな気持ちでおにぃの様子見に行ってるか、分かってる？」

{	Stand("bu七海_制服_拗ね","angry", 200, @-150);
	FadeStand("bu七海_制服_拗ね_angry", 500, false);
	DeleteStand("bu七海_制服_通常_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100160na">
「い、いつも、心配でしょうがないんだからね……」

{	DeleteStand("bu七海_制服_拗ね_angry", 500, true);
	Wait(200);}
ｕｚｅｅｅｅｅｅｅｅｅ！

なんだよこいつは！　僕の母親かよ！

しかも道端でそんなこと話すなよ、恥ずかしいなあ。
ただでさえ憂鬱なのに、気分はますます最悪な方向へと落ち込んでいく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//松濤の街並み
	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	CreateTexture360("背景３", 110, 0, 0, "cg/bg/bg039_01_2_松濤_b.png");
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg039_01_2_松濤_a.jpg");
	Wait(500);

	DrawTransition("色１", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
そもそも妹と一緒に学校へ登校するなんて、恥ずかしいことこの上ない。

エロゲならよくあるシチュエーションだし、僕も憧れたことはあるけど、七海と二次元妹じゃ比べものにならない。

はあ、もっとかわいい妹をくれ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundStop("@CH08");
	CreateSE("SE01","SE_日常_雑踏02");
	SoundPlay("SE01", 0, 500, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
僕と七海は、少し険悪な雰囲気のまま肩を並べて学校へと歩いていく。
なんとか校門に着くまでに逃げ出すチャンスがないかと、七海の様子を窺った。

七海はさっき僕にあれだけまくし立ててきたのに、今は黙り込み、ぼんやりとした顔つきで歩いている。
なんだか目が泳いでいるように見えるけど、気のせいだろうか。

七海は足取りもおぼつかない。

//おがみ：SE：足音欲しい
//	CreateSE("SE02","SE_じん体_動作_足_三歩");
//	SoundPlay("SE02", 0, 1000, false);
様子が変だ、といぶかしく思っていたら、そのままフラフラと車道に出て行こうとする。
ちょうど前から車が走ってきたところで――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 0, 0, false);

//ＳＥ//車のクラクション
	CreateColor("色１", 150, 0, 0, 1280, 720, "White");
	Fade("色１", 0, 500, null, true);
	CreateSE("SE02","SE_日常_車_クラクション");
	CreateSE("SE03","SE_日常_車_クラクション");

	SoundPlay("SE02", 0, 1000, false);
	Fade("色１", 200, 0, null, true);

	Wait(400);

	Fade("色１", 0, 500, null, true);
	SoundPlay("SE03", 0, 1000, false);
	Fade("色１", 200, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05100170ta">
「ちょ、危ない！」

{	CreateSE("SE04","SE_じん体_動作_尻餅");
	Shake("背景３", 200, 5, 5, 0, 0, 500, null, false);	
	Shake("背景２", 200, 5, 5, 0, 0, 500, null, false);	
	SoundPlay("SE04", 0, 1000, false);}
慌てて、七海の腕をつかんで引き寄せた。

車はクラクションを鳴らして走り抜けていく。
すんでの所で、轢かれずに済んだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05100180ta">
「おま、な、なにやってんだ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_雑踏02");
	SoundPlay("SE01", 0, 500, true);
	Stand("bu七海_制服_通常","shock", 200, @150);
	FadeStand("bu七海_制服_通常_shock", 500, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100190na">
「え？　あ、えっと、あれ？」

七海は目をパチクリとさせ、首を傾げている。

//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100200na">
「ナナ、今なんであんなこと……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100210na">
「あれえ？」

{	DeleteStand("bu七海_制服_通常_shock", 400, true);}
こいつ……真性のアホだったのか。

自分のやったことを理解できてないなんて。
言っとくけど萌えない。全然萌えないぞこんなの！

//※※３６０以下
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn00/00100010ta">
「な、なにやってるんだよ……。車に、ひ、轢かれたいのか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_拗ね","angry", 200, @150);
	FadeStand("bu七海_制服_拗ね_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【七海】
<voice name="七海" class="七海" src="voice/chn00/00100020na">
「車なんて……来てた？」

来てただろ！
なんだこのボケボケ妹は。

//【七海】
<voice name="七海" class="七海" src="voice/chn00/00100030na">
「ねえおにぃ。
今、ヒュンヒュンヒューンっていう音、聞こえなかった？」

はあ？　なんだそれ？　なんにも聞こえなかったぞ。

//【七海】
<voice name="七海" class="七海" src="voice/chn00/00100040na">
「その音聞いてたらね、なんだかぼんやりした感覚になって……」

//【七海】
<voice name="七海" class="七海" src="voice/chn00/00100050na">
「で、あそこに――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_制服_拗ね_angry", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
七海が道の角を指差した。

//【七海】
<voice name="七海" class="七海" src="voice/chn00/00100060na">
「お父さんとお母さんが立ってて、ナナを呼んでたの」

七海が指し示した場所には、両親ではなく、気色の悪い男が立っていた。

チェックのシャツ、指出し手袋、裾を折り曲げたジーパン、白いスニーカー。背中にはパンパンにふくらんだリュック。秋葉原にいそうなオタ丸出しの格好だ。

しかも片手にビデオカメラを持っていた。もしかして盗撮が趣味ですか？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn00/00100070ta">
「お、おい、た、他人を指差すな」

まったく、なんていう失礼な妹だ。

そもそも両親がここにいるわけないじゃないか。
実家は下北沢なんだから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","pride", 200, @150);
	FadeStand("bu七海_制服_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604004]
//【七海】
<voice name="七海" class="七海" src="voice/chn00/00100080na">
「おかしいなあ。確かに呼ばれたのに……」

と、男がこっちを見た。
僕と七海に、ビデオカメラのレンズを向けてくる。

うわ、なんだこいつ！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn00/00100090ta">
「行くぞ、七海！」

怖くなった僕は、七海を置いてさっさとその場から逃げ出した。

//※※３６０以上
//★徒歩：カット
//本気でウザくなった僕は、まだポカンとしている七海を置き去りにして、先を急いだ。
{	DeleteStand("bu七海_制服_通常_pride", 400, true);
	Wait(500);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/05100220na">
「あ、おにぃ！　ちょっと待ってよ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//★あやせ編
if(!$あやせルート){
	Wait(1000);

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
}else{
	Wait(2000);
}


//～～Ｆ・Ｏ


}