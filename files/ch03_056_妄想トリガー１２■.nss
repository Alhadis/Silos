//<continuation number="4490">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_056_妄想トリガー１２■";
		$GameContiune = 1;
		Reset();
	}

		ch03_056_妄想トリガー１２■();
}


function ch03_056_妄想トリガー１２■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Delete("背景２");


//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐７へ
//ネガティブ妄想→分岐８へ
//妄想しない→分岐９へ

if($妄想トリガー通過１２ == 0)
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
			$妄想トリガー１２ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー１２ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー１２ = 0;
		}
	}
}



//=============================================================================//

if($妄想トリガー１２ == 2)
{
//☆☆☆
//分岐７
//フラグ【３章エンドフラグ①】ＯＮ
//梨深ソファフラグ ＯＮ（ch07_136_１１月３日月用）
	$３章エンドフラグ① = true;

//画面エフェクト//妄想ＩＮエフェクト
//演出：フェイクイン
	DelusionFakeIn();

	BoxDelete(0);

	DelusionFakeIn2();

//ＳＥ//妄想ＩＮ

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600010ri">
「わ、バレちゃった」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600020ta">
「当たり前だ。僕の後ろに立つなと何度言えば…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE01", 0, 1000, true);

//ＳＥ//心臓の鼓動「ドクン」
//ＳＥ//以下、鼓動のスピードが徐々に早くなっていく

	SetFrequency("SE01", 1000, 1000, Dxl3);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
…………え？

今、女の声が聞こえなかったか？

全身に鳥肌が立った。

{	SetFrequency("SE01", 2000, 1100, Dxl3);}
一度として姿を見せることのなかった“視線”の主が、ついに現れたっていうのか。

そんなことあり得るのか？

振り返って、その正体を確かめるべきなのかな……。

{	SetFrequency("SE01", 2000, 1200, Dxl3);}
でも、もし振り返った瞬間に襲いかかってきたら？

けっこう可愛らしい声ではあったけど、およそ人間とはかけ離れた化け物がそこにいたら？

いやいや、だけどもしかすると今にも襲いかかってこようとしてるかもしれないじゃないか。振り返らなかったらそれこそ自分が殺されたことにすら気付けないかもしれない。

{	SetFrequency("SE01", 2000, 1300, Dxl3);}
声を出して、もう一度相手の返事があるか確かめてみるべきか。さっき聞いた声は僕の幻聴とか、妄想かもしれないし。

ほら、いつも僕の脳内だとフィギュアの星来たんだって喋りまくってるじゃないか。あれと同じだよ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetFrequency("SE01", 5000, 1400, Dxl3);
	CubeRoom4("ルーム", 100, 0);
	Fade("ルーム", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600030ta">
「だ……」

思い切って“誰だ？”と言おうとして、でもすぐに躊躇した。

もしこれで相手を刺激しちゃったら、まずいんじゃないだろうか。それがきっかけで襲いかかられちゃうことだってありそうだし……

いろいろ妄想し過ぎて、僕は身動きが取れなくなっていた。

どうしよう……。

もしかしたら今、自分はすごく間抜けな状態かもしれない。“視線の主”なんていなくて、僕はイスに座ったままひとり延々と自分の妄想に怯えて震え続けているっていうのが真相だったら、本気でバカすぎ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE02","SE_衝撃_衝撃音01");
	CreateTextureEX("背景２", 100, 80, -480, "cg/ev/ev029_01_2_梨深ソファ腰掛け_a.jpg");

	CreateTextureEX("はりつけ", 1000, Center, Middle, "cg/ev/ev005_01_3_杭貼付け_a.jpg");
	Request("はりつけ", Smoothing);
	CreateTextureEX("はりつけ２", 100, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");

	if(#下着パッチ==true)
	{
		CreateTextureEX("梨深", 100, center, -352, "ex/hu/hu梨深_制服_正面血まみれ_下着_lost_eye01.png");
	}else{
		CreateTextureEX("梨深", 100, center, -352, "cg/hu/hu梨深_制服_正面血まみれ_lost_eye01.png");
	}

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600040ri">
「ん？　あれ、タク？　固まってる？」

{	SetFrequency("SE01", 1000, 1500, Dxl3);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600050ta">
「――っ！」

{	Fade("ルーム", 300, 1000, null, true);}
やっぱり、幻聴でも妄想でもない！
僕の背後に、誰かいる……！

びっくりして、僕は反射的に振り返ってしまっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "White");
	Fade("色１", 0, 0, null, true);
	Request("色１", AddRender);

	CreateColor("色２", 150, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 0, null, true);

	CreateTextureEX("画面ブレ１", 100, 0, 0, "cg/ev/ev029_01_2_梨深ソファ腰掛け_a.jpg");
	CreateTextureEX("画面ブレ２", 100, 0, 0, "cg/ev/ev029_01_2_梨深ソファ腰掛け_a.jpg");
//	SetBlur("画面ブレ２", true, 3, 300, 40);
//	CreateTextureEX("画面ブレ３", 100, 0, 0, "cg/ev/ev029_01_2_梨深ソファ腰掛け_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Rotate("ルーム", 500, @0, @-180, @0, Dxl3, false);
	Fade("背景２", 300, 1000, null, false);
	Move("背景２", 500, @-80, @0, Dxl3, true);

	Delete("背景１");
	Delete("ルーム");
	Wait(500);

	Move("背景２", 1000, @0, @480, AxlDxl, true);

	Wait(1000);

//張り付けフラッシュバック

	SoundPlay("SE02", 0, 1000, false);

	Zoom("はりつけ", 0, 2000, 2000, null, true);
	Move("はりつけ", 0, @80, @0, null, true);
	Fade("はりつけ", 0, 1000, null, true);

	Wait(200);

	Fade("はりつけ２", 0, 1000, null, true);
	Delete("はりつけ");

	Wait(200);


	Fade("梨深", 0, 0, null, true);
	Move("梨深", 0, @80, @0, null, true);

	Fade("梨深", 0, 1000, null, true);

	Wait(500);

	Stand("st梨深_制服_正面血まみれ","lost", 200, @0);
	Fade("色２", 0, 1000, null, true);

	Delete("はりつけ２");
	Delete("梨深");
	FadeStand("st梨深_制服_正面血まみれ_lost", 0, true);

	Wait(500);


	Fade("色１", 1000, 1000, null, true);
	Delete("色２");
	DeleteStand("st梨深_制服_正面血まみれ_lost", 0, true);

//透過度と大きさ
	Zoom("画面ブレ１", 0, 1100, 1100, null, true);
	Zoom("画面ブレ２", 0, 1100, 1100, null, true);
//	Zoom("画面ブレ３", 0, 1100, 1100, null, true);
	Fade("画面ブレ１", 0, 500, null, true);
	Fade("画面ブレ２", 0, 500, null, true);
//	Fade("画面ブレ３", 0, 500, null, true);

//動作
	Fade("色１", 500, 0, null, false);
	Zoom("画面ブレ１", 800, 1000, 1000, Dxl3, false);
	Fade("画面ブレ１", 800, 0, null, false);
	Wait(100);
	Zoom("画面ブレ２", 800, 1000, 1000, Dxl3, false);
	Fade("画面ブレ２", 800, 0, null, false);
	Wait(100);
//	Zoom("画面ブレ３", 800, 1000, 1000, Dxl3, false);
//	Fade("画面ブレ３", 800, 0, null, false);

	Wait(1000);
	Delete("画面ブレ*");
	Delete("色１");


//ＣＧ//ソファに腰掛けている梨深
//ＢＧＭ//緊迫
	SoundPlay("SE01", 500, 400, true);
	BGMPlay360("CH06",1000,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600060ri">
//◆「どうもどうも」の意
「どもどもー♪」

あ、あく、悪魔女……！

ソファに腰掛けていたのは、間違いなくあの『張り付け』の現場で会った女だった。

なぜかニコニコした笑顔で僕の方を見ている。

なんてことだ……なんてことだ……なんてことだ……！

ついに僕を殺しに来たんだ。

きっとさっき警察に事実を話しちゃったせいだ！
千里眼でそれを見られてたんだ！

それで音もなくこの部屋に入ってきて、いつでも殺せる位置に陣取って僕が恐怖に泣き叫ぶ様を眺めることにしたんだ！

そうに違いない！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600070ta">
「こ、こ……こ……っ」

殺さないで！　って叫ぼうとしたけど、あまりの恐怖でうまく声が出ない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600080ri">
「？？？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600090ri">
「こけこっこー？」

悪魔女は首をひねりながら、謎の呪文を発する。
きっと悪魔語だ、呪いとかかけられるんだ……っ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CubeRoom4("ルーム", 90, 0);
	Rotate("ルーム", 10, @0, @-180, @0, null, true);
	Fade("ルーム", 0, 1000, null, true);

	CreateSE("SE02","SE_衝撃_衝撃音03");

	Fade("背景２", 300, 0, null, false);
	Rotate("ルーム", 400, @-30, @-180, @0, Dxl1, true);
	SoundPlay("SE02", 0, 1000, false);
	Shake("ルーム", 300, 5, 5, 0, 0, 300, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
少しでも悪魔女から距離を開けるべく、ＰＣデスクの下に逃げ込もうとした。でも動揺しすぎていたせいで、頭をデスクの縁にぶつけ、あまりの痛さでたまらずその場にうずくまる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	Fade("背景２", 300, 1000, null, true);
	Delete("ルーム");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600100ri">
「プッ。なにやってるの、タク」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600110ri">
「今、すっごい音したよ？　ゴツンッて」

なおも悪魔女は楽しそうな笑顔を崩さない。

でもきっと僕を油断させるための罠だ。

僕が安心したところで、グサリと来る気なんだ。あるいはさっきの呪文ですでに呪いをかけられてしまったかもしれない。

数日後に僕は全身から血を噴き出して死ぬのかも……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600120ta">
「た、た、頼む、よぅ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600130ta">
「ころさ……ないで……」

{	CreateSE("SE02","SE_じん体_動作_尻餅");
	Move("背景２", 500, @0, @-320, Axl1, true);
	SoundPlay("SE02", 0, 800, false);
	Shake("背景２", 300, 5, 5, 0, 0, 300, null, true);}
僕は頭を抱えて、床に突っ伏した。
さっき僕の前に現れた２人の刑事を恨んだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600140ta">
「け、け、いさつに、喋ったこと、あ、謝る、から……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600150ri">
「警察……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600160ta">
「そ、それにっ、話しても、ち、ちっとも、
信じて、も、もらえてなかったし……」

というのは時間を稼ぐための嘘だ。

さっき刑事のおっさんは、僕の身の安全は保証するって言ってくれた。
あのおっさんがちゃんと仕事をしてくれてるなら、警備の警官のひとりでも僕の家によこしてくれるはず……

そこまで考えて、ハッとした。

僕はあのおっさんに電話番号は教えたけど、

ここの住所は教えてない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	Delete("背景２");
	Delete("ルーム");

	Stand("st梨深_制服_通常ビシッ！","angry", 200, @150);
	FadeStand("st梨深_制服_通常ビシッ！_angry", 200, true);
	Shake("背景１", 200, 2, 2, 0, 0, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600170ri">
「ビシィッ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600180ta">
「ひえ……っ」

いきなり悪魔女が敬礼らしきポーズをした。

しかも奇妙なことに、効果音らしき言葉を自分でつぶやいたぞ……。これも悪魔の呪文か？

{	Stand("st梨深_制服_通常ビシッ！","hard", 200, @150);
	FadeStand("st梨深_制服_通常ビシッ！_hard", 300, false);
	DeleteStand("st梨深_制服_通常ビシッ！_angry", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600190ri">
「独り言はやめるべし！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600200ri">
「殺さないでとか、警察がどーとか、あたしにはなんのことかさっぱりだよ」

さっぱりだって？
とぼけるつもりか？

それとも“事実は忘れて、なにもなかったことにしろ”っていう無言の圧力か？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600210ta">
「…………」

この女……いったいなにを考えてるんだ……？
僕を殺しに来たわけじゃないのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_のぞく");
	SoundPlay("SE02", 0, 1000, false);
	DeleteStand("st梨深_制服_通常ビシッ！_hard", 500, true);
	Wait(500);
	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600220ri">
「ほら、立てる？　立とう！」

ソファから立ち上がった悪魔が、僕に向かって手を差しのべてきた。

その表情はとても優しそうだ。
しかも、こうして近くで見ると……けっこうかわいい……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600230ta">
「……っ」

くそぅ、バカ丸出しじゃないか、僕は！

悪魔に対してなにが“けっこうかわいい”だ。

こいつは殺人鬼で。
優愛や『将軍』を使って僕を罠にはめようとして。
今、こうして僕を直接殺しに来てるんだぞ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
信じるな……。

もう、優愛のときで懲りている。二度と同じ過ちは犯さない。だから差し出された手を、僕は取らなかった。

この悪魔女の笑顔に、騙されるな。
これは悪魔の誘惑だ。誘惑に負けたら僕は死ぬ。

なにも信じるな。誰の言葉も信じるな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600240ta">
「だ、だって……み、見たんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600250ta">
「お、おま、お前が……人を、こ、殺してるとこ……」

{	Stand("bu梨深_制服_右向き","hurry", 200, @0);
	FadeStand("bu梨深_制服_右向き_hurry", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
<voice name="梨深" class="梨深" src="voice/ch03/05600260ri">
//◆苦笑
//【梨深】
「あ、あのさ、タク。それかなりひどいこと言ってるって気付いてる？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600270ri">
「まさか殺人犯呼ばわりされるなんてね……たはは……」

僕を、どうするつもりだ……？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600280ta">
「ニュージェネの……」

あの４つの事件みたいに……僕も……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600290ta">
「こ、ろすんでしょ……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600300ta">
「そ、それとも、優愛とか、『将軍』とかがいる、ば、場所に連れてって――」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_右向き_hurry", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600310ri">
「ゆあ？　ショウグン？　誰それ？」

//※禁則処理
３人でよってたかって無抵抗の僕を集団リンチとかする気かもしれない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600320ta">
「そ、そんなの、い、イヤだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600330ta">
「助けて……」

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600340ri">
「んー、じゃあね、あたしを殺人犯扱いしなければ、助けてあげる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600350ta">
「ひっ……」

や、やっぱりそうだったんだ……！

{	Stand("bu梨深_制服_通常","rage", 200, @0);
	FadeStand("bu梨深_制服_通常_rage", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600360ri">
「って、そんなビビらないでよぉ。いちいちあたしがヘコむようなリアクションしてくれるよね……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600370ta">
「お、お願いだ……もう二度と、誰にも……し、喋らないから……だから、み、見逃して……」

{	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_rage", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600380ri">
「もしもーし、タク！　ちょっと落ち着こう？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
この女、馴れ馴れしくタクって呼びやがって……。

そう言えばどうしてこの女は僕の名前を知ってる？

あの『張り付け』の現場で初めて会ったときから、すでにこの女は僕の名前を知ってた。

どうして？
それに僕のベースの場所もどうして分かった？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600390ri">
「当然でしょ――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600400ri">
「あなたの名前を知ってるのは」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600410ta">
「！？」

今、心を読まれた！？

やっぱりこの女は千里眼が使えるんだ！
名前や住所を知られたのもその能力を使ったからだ！

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600420ri">
「タクってけっこう独り言多いよね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600430ri">
「――前から思ってたことだけど」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
前から……？　それっていつから？
っていうか、僕は今独り言を言っていたの？

自分ではまったく自覚がない。

ホントに？　ホントのホントに独り言を言ってた？
この女が嘘を言っている可能性は？
心を読まれた可能性は？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600440ri">
「タクの名前を知らないわけないよー。
あたし、物覚えはそんなによくない方だけど――」

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600450ri">
「友達の名前くらい、覚えるよ」

友……達……？

{	Stand("bu梨深_制服_通常","rage", 200, @0);
	FadeStand("bu梨深_制服_通常_rage", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600460ri">
「それともタク、あたしのことバカにしてる？
そりゃあたし、テストの点数はそんなによくないけど」

{	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_rage", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600470ri">
「面と向かってそういうこと言われると傷ついちゃうな」

頭がおかしいのか……？
誰の頭が？　僕の？　この女の？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600480ta">
「も、もしかして……て、転校生……？」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600490ri">
「あ、そう言えば近いうちに転校生が来るらしいよ。塚ちんセンセーが言ってた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 1000, 0, false);

	Wait(500);

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 0, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
会話がかみ合ってない……。

さっきまでの、いつ殺されるか分からないっていう緊張感の入り交じった恐怖は薄れつつあった。

でも、その代わりに薄ら寒くなるような別の種類の恐怖が、心をジワジワと侵食してきている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600500ri">
「えーっと、もしもしー？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600510ri">
「その顔はまさか、まだ信じてくれてない？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600520ta">
「だ、誰……だ……？」

お前は、誰だ？
こいつは殺人鬼だ。悪魔女だ。

{	Stand("bu梨深_制服_通常","rage", 200, @0);
	FadeStand("bu梨深_制服_通常_rage", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600530ri">
「うわ、タクこそクラスメイトの顔覚えてないんだ。ひどー」

クラスメイトだって……？

友達だけじゃなくて、クラスメイトだっていうのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_rage", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600540ri">
「でもまあしょうがないか、タクはあんまり学校来ないもんね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600550ri">
「だからって、あたしの存在まるごとなかったことにするのはどうかと思う」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600560ri">
「あたしの名前、ほんっとーうに、忘れちゃった？」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600570ri">
「そんなことないよね。知ってるでしょ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600580ri">
「あなたは」

{	SetVolume360("CH*", 3000, 0, null);
	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600590ri">
「知ってるはず」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600600ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//白
//画面中央に黒字で「リミ」と出る

	MusicStart("SE01", 500, 0, 0, 0, null, false);

	DeleteStand("bu梨深_制服_通常_smile", 500, false);

	CreateColor("色１", 100, 0, 0, 1280, 720, "White");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/effect.png", true);

	CreateTextureEX("文字１", 110, 0, 0, "cg/bg/bg902_01_6_リミ01_a.jpg");
	CreateTextureEX("文字２", 120, 0, 0, "cg/bg/bg902_02_6_リミ01_a.jpg");

	CreateEffect("レンズ１", 1000, @-450, @-500, 1920, 1920, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

	Wait(1000);

	Fade("文字１", 300, 1000, null, true);

	Wait(2500);

	Fade("文字２", 300, 1000, null, true);

	Wait(2000);


/*おがみ：テキスト演出修正
	SetBacklog("リミ", "null", null);

	SetFont("ＭＳ ゴシック", 51, #000000, #666666, 500, LIGHTDOWN);
	CreateText("テキスト１４", 100, center, middle, Auto, Auto, "リ");
	Move("テキスト１４", 0, @-24, @0, null, true);
	Request("テキスト１４", NoLog);
	Request("テキスト１４", Erase);
	Request("テキスト１４", Enter);
	WaitAction("テキスト１４", null);

	Wait(1000);

	SetFont("ＭＳ ゴシック", 51, #000000, #666666, 500, LIGHTDOWN);
	CreateText("テキスト１５", 100, center, middle, Auto, Auto, "ミ");
	Move("テキスト１５", 0, @24, @0, null, true);
	Request("テキスト１５", NoLog);
	Request("テキスト１５", Erase);
	Request("テキスト１５", Enter);
	WaitAction("テキスト１５", null);

	Wait(2000);

	FadeDelete("テキスト１４", 1000, false);
	FadeDelete("テキスト１５", 1000, false);

*/
	CreateColor("色２", 200, 0, 0, 1280, 720, "Black");
	DrawTransition("色２", 100, 0, 1000, 100, null, "cg/data/effect.png", true);

	Delete("文字１");
	Delete("文字２");
	Delete("色１");

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600610ta">
「リ……ミ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Delete("レンズ*");
	DrawTransition("色２", 1000, 1000, 0, 100, null, "cg/data/effect.png", true);
	Delete("色２");
	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601018]
//ＢＧ//拓巳の部屋
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600620ri">
「そう！　正解！　賞金５０円プレゼント！」

//ＳＥ//心臓の鼓動
{	BGMPlay360("CH01",1000,1000,true);
	CreateSE("SE01","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE01", 0, 500, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600630ta">
「え……！？」

{	Stand("bu梨深_制服_通常ビシッ！","happy", 200, @0);
	FadeStand("bu梨深_制服_通常ビシッ！_happy", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600640ri">
「あたし、<RUBY text="さきはた">咲畑</RUBY><RUBY text="りみ">梨深</RUBY>でーす」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600650ri">
「な～んだ。やっぱり覚えててくれたんだね」

{	Stand("bu梨深_制服_通常ビシッ！","smile", 200, @0);
	FadeStand("bu梨深_制服_通常ビシッ！_smile", 300, false);
	DeleteStand("bu梨深_制服_通常ビシッ！_happy", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600660ri">
「よかったよかった♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
な……んで……。

ホント、なのか？

この悪魔女の名前は、ホントに“リミ”って言うのか？

なんで今、僕の心の中にその名前が浮かんだんだろう。

なんで僕は、この女の名前を知ってるんだろう。

もしかして、僕が忘れてるだけで、ホントにクラスメイトで友達だったりするのか？

……いや、そんなはずないっ。

咲畑梨深なんて名前、聞いたことすらない。

きっと偽名だ。僕が“リミ”って言ったから、この女はそういう名前にしたんだ。オレオレ詐欺と同じだ。

そもそも僕に対してこんなに馴れ馴れしく話してくる三次元女なんて、優愛ぐらいしか知り合ったことがない。

そして優愛はこの悪魔女の手下だ。

あ、そうか……！

今まさに目の前で起きている咲畑とかいうこの女のしていることは、優愛のときと同じ手法なんだ。

僕に馴れ馴れしくして、三次元女との付き合いに慣れてない僕をちょっと誘惑しておいて、罠にはめようっていうつもりだ。

そりゃ、クラスメイトの顔なんてさっぱり覚えてないし覚える気もないけど、少なくともこの女の顔は今まで同じ教室で見たことは一度もない……はずだよな。

……ダメだ、断言できない。

なにしろ僕はいつも学校では、始終自分の机に張り付いて、寝たふりをして妄想しているか机の表面をじっと眺めているか教科書を読むフリをしているかのいずれかしかない。

クラスメイトの顔も名前も、まるで覚えてない。覚えようともしなかった。

どっちなんだ？
この女の言っていることはホントなのか、違うのか。

いや、クラスメイトかどうかは問題じゃない。少なくとも厳然たる事実としてあるのは、この女が人殺しということで――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	CreateSE("SE02","SE_じん体_動作_尻餅");

	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常ビシッ！_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600670ri">
「もしかして本気で思い出せないの？　さっき頭打ったせいで記憶喪失になっちゃった？」

悪魔女が僕の頭に手を伸ばしてくる。

{	SoundPlay("SE02", 0, 800, false);
	Fade("色１", 500, 1000, null, true);}
僕はそれを避けようと、またデスクの下に逃げ込んだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600680ri">
「……タク、変だよ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600690ta">
「…………」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//◆だいちん
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600700ri">
「じゃあ、“大ちん”に聞いてみて」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600710ri">
「そしたらタクも思い出せるかも」

だ、大ちん？
なんだそれ？　人名か？　それともなにかの暗号？　悪魔の呪文――？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600720ri">
「大ちんだよ、大ちん。三住大輔！」

{	Fade("色１", 500, 0, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600730ta">
「え……！？」

こ、こいつ、三住くんの名前を知ってる……？
しかも大ちんって……よっぽど親しくないとそうは呼ばないぞ……。

{	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600740ri">
「んーと、ちょっと待ってね」

悪魔女は、ソファの脇に置いてあったカバン――僕はこんなカバン持ってない――から、ケータイを取り出した。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600750ri">
「えーと、大ちん大ちん、は、と……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//ケータイ操作音
	CreateSE("SE02","SE_日常_けい帯操作");
	SoundPlay("SE02", 0, 1000, false);
	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600760ri">
「よし、オッケー」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600770ri">
「はい」

なにやら操作をしていたかと思うと、僕の方に差し出してくる。

受け取らずにいると、悪魔女は苦笑しながら、いきなり僕の手を取った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600780ta">
「わ……っ！」

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600790ri">
「ほら、固まってないで」

強引に、僕の手にケータイを握らせてくる。

悪魔女の手は柔らかくて、少しひんやりしていた。
もっと冷たい、氷のような手だと思ってたけど、それほどでもなかった。
殺人鬼でもちゃんと血が通ってるらしい。

と言うか、予想以上に女の子らしい手だったから、ドキドキした。

い、いや、惑わされるな！

こいつは悪魔だ！　誘惑なんかされるもんか！　僕は三次元に興味はないんだ！
星来たん、僕に力をくれ！

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600800ri">
「タク、ケータイ使ったことないの？　電話機は耳に当てるんだよー？」

至近距離から、悪魔女が首を傾げつつ僕の顔をのぞき込んでくる。

さらに、僕の手をつかんだまま、耳元へと持ち上げる。

{	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
僕はとっさに、ケータイの液晶画面を見た。

“大ちん”という登録された名前が表示されていて、すでに電話でコール中になっている。

やむなく耳に受話器を当ててみると、

//ＳＥ//電話呼び出し音
{	CreateSE("SE02","SE_日常_でんわ_呼びだし音_LOOP");
	SoundPlay("SE02", 0, 1000, true);}
呼び出し音が鳴っていた。

//ＳＥ//電話が繋がる
{	SoundPlay("SE02", 0, 0, false);}
やがてすぐにその音は途絶え、
聞こえてきたのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_衝撃_衝撃音02");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//以下、三住の声は電話の声
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600810mi">
「その目だれの目？」

{
//おがみ：実績：その目
	Eyes();
	SoundPlay("SE02", 0, 1000, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600820ta">
「……！？」

その言葉は、僕に言ったの？
それとも、悪魔女に言ったの？
なんで、その言葉を言ったの？

相手は沈黙する。名乗りもしない。

どうやら繁華街にいるらしく、周囲の喧噪が受話器を通して聞こえてくる。

僕は混乱する。声が出せない。なにを言えばいいか分からない。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600830mi">
//◆楽しそうに
「な～んてな。今この言葉、流行ってるらしいぜ。はは」

三住くん――と思われる人物――はすぐにいつもの調子に戻った。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600840mi">
「で、なんの用だよ――」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600850mi">
「リミ」

リミ……。
サキハタリミ。

三住くんも、知ってるのか……。

いや、そのこと自体は不思議じゃない。なにしろ三住くんはナチュラルボーン女たらしだ。この悪魔女と過去に付き合ってたとか、今も絶賛交際中とかでもうなずける。

問題は、悪魔女が、僕の、今の、クラスメイトかどうか、なんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	CubeRoom2("ルーム", 100, 0);
	Fade("ルーム", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05600860ri">
「タク、大ちん出た？」

悪魔女がまたも僕の顔をのぞき込んでくる。

くそ、顔が近いんだよ……。

僕は女に背を向けて、電話の向こうに呼びかけた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_通常_normal", 300, false);
	Rotate("ルーム", 0, @0, @-180, @0, Dxl3, false);
	Fade("ルーム", 300, 1000, null, false);
	Rotate("ルーム", 300, @0, @180, @0, Dxl3, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601023]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600870ta">
「ぼ、ぼ、僕、西條……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600880mi">
「なんだ、タクか。リミと一緒にいるのか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600890ta">
「…………」

な、なんでそんなにあっさり納得するんだ……。

それじゃまるで、僕が悪魔女と一緒にいるっていうシチュエーションが、日常的なことみたいに聞こえるじゃないか……。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600900mi">
「またリミに振り回されてるのか？　大変だなお前も」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600910mi">
「でもよ、ひとつだけ言っていいか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600920mi">
「お前、そろそろ自分のケータイ買えよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600930ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
この電話の向こうの相手は、
ホントに、三住くんなんだろうか？

例えば悪魔女が僕をはめるために、“三住くんの声によく似た別の誰かのところにかけさせた”可能性もある。

この“三住くんの声に似た誰か”は悪魔女の手下で、三住くんを装って僕を騙そうとしているかもしれない。

なにもかもが疑わしく思えてくる。
なにが真実で、なにが嘘なのかが、分からない。

そもそも悪魔女はそこまで手の込んだことをしているとして、いったい僕をどんな罠にはめようとしてるんだろう。

この状況なら、悪魔女が僕を直接殺すのが一番手っ取り早いんじゃないのか？

それとも、こんなまだるっこしいことをしてでも“騙さなくちゃいけない”理由があるのか？

//※テキストオーバー08/11/17
いや、もしかしたら三住くん主導で仕掛けたドッキリのようなものかもしれない。

この女は三住くんのカノジョで、クラスメイトでもなんでもなくて、僕をからかうために三住くんの手によって送り込まれた仕掛け人――

そんなわけないだろ！

だったらあの『張り付け』現場でのことはどう説明する気だよっ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600940mi">
「で、タク、なんか用か？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600950mi">
「俺としては野郎からの電話なんてあんま嬉しくねえんだけどな。
ははっ」

口調は完全に三住くんと同じだ。

聞けば聞くほど、電話の向こうの相手は三住くん以外には考えられなくなってくる。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600960mi">
「女の口説き方でも教えてもらいたいのか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600970mi">
「んなわけねーか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05600980ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
なんて切り出すべきだろう。
視線を背中に感じる。あの女は、じっと僕を見つめている。

首筋のチリチリとした感覚はいまだ消えない。
悪魔女は、どんな顔をして僕を見ているんだろう。
振り返って、確かめたい。でも、怖くてできない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05600990mi">
「で、なんなんだ？　今、俺も女と一緒なんだよ。なるべく手短に頼むわ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601000ta">
「そ、そのっ、えっ……と……！」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601010mi">
「なんだよ？　早く言えって」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601020ta">
「…………ウ、ウ、ウチの」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601030mi">
「うん？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601040ta">
「クラス……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601050mi">
「ああ、ウチのクラスがどうした？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601060ta">
「い、いる？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601070mi">
「なにが？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601080ta">
「女子……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601090mi">
「はあ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601100ta">
「サ、サ、サキハタ……って名前の……」

しどろもどろになってなんとか説明する。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601110mi">
「………………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SoundPlay("SE*", 500, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
ふと、三住くんからの返事が途切れた。

沈黙。

でも街の喧噪などの雑音は聞こえてくるから、電話が切れたわけじゃない。
なんで黙るの――？

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601120mi">
「はあああ～～～～」

と、次に聞こえてきたのは盛大なため息だった。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601130mi">
{#TIPS_ゲーム脳 = true;$TIPS_on_ゲーム脳 = true;}
「お前さぁ、<FONT incolor="#88abda" outcolor="BLACK">ゲーム脳</FONT>じゃねえの？」

{$TIPS_on_ゲーム脳 = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601140ta">
「ちょ……」

な、なんだよいきなり……。

しかもゲーム脳って、そんな科学的根拠もないようなトンデモ科学でレッテル貼りかよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601150mi">
「それって梨深のことだろ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601160mi">
「梨深のケータイでかけてきてるくせに、なにバカなこと言ってんだ、お前」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601170ta">
「…………」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601180mi">
「分かった、お前もしかして、梨深になにか指図されてんだろ？
イタズラか？　ドッキリか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601190mi">
「じゃあ梨深に伝えといてくれ。
“お前の低レベルのドッキリに引っかかるほど俺はバカじゃねえ”ってな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601200ta">
「ホ、ホント……！？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601210mi">
「ん？　なにが？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601220ta">
「ホントに、ク、クラス、メイト……？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601230mi">
「お前なあ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601240mi">
「たまにしか学校来ねえから忘れちまったか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601250mi">
「俺はともかく、お前は１年のときから同じクラスだろ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601260mi">
「この前だって３人で一緒に映画見に行ったじゃねーか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 500, null, true);

	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE02", 0, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
この“三住くんらしき誰か”の言っていることが理解できない。

悪魔女と僕が、１年生のときから同じクラスだったって？
この前３人で一緒に映画を見に行ったって？

この前……って、いつだ？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text031]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601270mi">
「俺がお前とダチになったのだって、最初は梨深に付き合わされたのがきっかけだったしな」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601280mi">
「俺と同じで梨深も物好きだからよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601290mi">
「ニートのお前を気にかけてやってるのは、世界広しと言えど俺と梨深ぐらいだぜ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601300mi">
「あ、それは言い過ぎか。ははっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601310ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text032]
電話の向こうから聞こえてくる言葉……その単語のひとつひとつにまるでリアルさを感じない。感じるわけがない。一切僕の記憶にはないんだから。

そんな過去があったなんて認めることはできない。

“三住くんらしき誰か”が話しているのは、物語だ。過去じゃない。過去は、記憶に裏打ちされていなくちゃ成り立たないものなんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text033]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601320mi">
「っていうか梨深ってマジで女っ気ないよな。おっと、これはあいつには言うなよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601330ta">
「キミは……誰だ……？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05601340mi">
「おいおい、マジでおかしくなったか？
俺のことまで忘れたわけか。ゲームやり過ぎ――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601350ta">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 500, 0, null);

	Fade("色１", 500, 1000, null, true);
	SoundPlay("SE*", 0, 0, false);

//ＳＥ//ケータイ切る
	CreateSE("SE03","SE_日常_けい帯ボタン押す");
	SoundPlay("SE03", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text034]
耐えられなくなって、僕は一方的に電話を切った。

{	Fade("色１", 2000, 0, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601360ta">
「はあ、はあ、はあっ……」

気が付けば自分がひどく荒い呼吸をしていることに気付く。額からにじみ出る汗はさっきから止まる気配がないどころか、さらに増えている。顎からポタポタと足許にしたたり落ちるほどだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("ルーム", 300, 0, null, true);

	Delete("ルーム");
	Delete("色１");
	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, true);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601034]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601370ri">
「タク、汗びっしょりだよ？」

悪魔女が、いかにも僕を心配している、という表情をしながら、平然とハンカチを差し出してきた。

朱色がかった、かわいらしい無地のハンカチ。かすかにフローラルな香りがした。

それは受け取らず、なんとか冷静に状況を整理しようとしてみる。でもうまくいかない。疑心暗鬼な感情が渦巻いて混乱してる。

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601380ri">
「で、大ちんはなんて？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",2000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text035]
かすかに残念そうなため息をついてハンカチをしまった悪魔女は、すぐに勝ち誇ったような表情になって聞いてきた。

それは答えを最初から確信している態度だ――

僕はそれに答える余裕はない。

この女がなんなのか。ただのクラスメイトなのか化け物なのか……分からない。

もしかしたら僕の頭の方がオカシイのかもしれない。

『将軍』とのチャットのことも考えると、僕じゃない誰かが僕の身体を操っている可能性も捨てきれない。

あるいはこの悪魔女……咲畑梨深という女との記憶だけが、なんらかのアクシデントですっぽり抜け落ちたことも考えられる。

いずれにせよ、僕は自分が分からない……。

記憶喪失？　夢遊病？　それ以外のなにか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text036]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601390ri">
「大丈夫？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601400ri">
「身体、辛いならソファで横になる？」

悪魔女が優しい言葉をかけてくる。

優しい言葉には気をつけろ。僕みたいなキモオタに優しくするヤツは、絶対裏があるに決まってる。

僕は悪魔女の言葉に首を振って拒絶の意志を示し、思い切って顔を上げた。
汗が目に入って、視界が滲む。

悪魔女の顔は予想以上に近くにある。
その瞳は、どんな色を含んでる……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text037]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601410ta">
「なんで……」

{	Stand("bu梨深_制服_正面","normal", 200, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601420ri">
「ん？　なになに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601430ta">
「ここにいる……？」

{	Stand("bu梨深_制服_正面","hard", 200, @0);
	FadeStand("bu梨深_制服_正面_hard", 300, false);
	DeleteStand("bu梨深_制服_正面_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601440ri">
「なんで、って。タクに会いに来たんだよ」

{	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, false);
	DeleteStand("bu梨深_制服_正面_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601450ri">
「もしかして、勝手に部屋に入ったこと、怒ってる？」

{	Stand("bu梨深_制服_正面","hard", 200, @0);
	FadeStand("bu梨深_制服_正面_hard", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601460ri">
「でもそれは、タクがちっとも返事してくれないから悪いんだよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601470ri">
「けっこう長い時間、ノックしてたんだから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601480ta">
「…………」

僕は、借りていたケータイを突き返した。
悪魔女がそれをおずおずと受け取るのを見ながら、改めて問い質す。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601490ta">
「なんで……」

{	Stand("bu梨深_制服_正面","normal", 200, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601500ri">
「ん？　今度はなに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601510ta">
「ここにいる……？」

こいつが僕を訪ねて来た理由はなんだ？
僕を殺しに来たならとっくに実行してるはずなのに、どうしてなにもしない？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	PositiveHuman();

//※妄想ＯＵＴエフェクトはナシ。
//合流４へ

}





//=============================================================================//

if($妄想トリガー１２ == 1)
{

//☆☆☆
//分岐８
//梨深ソファフラグ ＯＮ（ch07_136_１１月３日月用）
//※ここではネガティブ妄想を選んだ場合も、ポジティブ妄想と内容はほぼ同じです。（少しだけ違う箇所があります）

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
//演出：フェイクイン

	DelusionFakeIn();
	BoxDelete(0);

	DelusionFakeIn2();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text038]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601520ri">
「わ、バレちゃった」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601530ta">
「当たり前だ。僕の後ろに立つなと何度言えば…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//心臓の鼓動「ドクン」
//ＳＥ//以下、鼓動のスピードが徐々に早くなっていく

	CreateSE("SE01","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE01", 0, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text039]
…………え？

今、女の声が聞こえなかったか？

全身に鳥肌が立った。

{	SetFrequency("SE01", 2000, 1100, Dxl3);}
一度として姿を見せることのなかった“視線”の主が、ついに現れたっていうのか。

そんなことあり得るのか？

振り返って、その正体を確かめるべきなのかな……。

{	SetFrequency("SE01", 2000, 1200, Dxl3);}
でも、もし振り返った瞬間に襲いかかってきたら？

けっこう可愛らしい声ではあったけど、およそ人間とはかけ離れた化け物がそこにいたら？

いやいや、だけどもしかすると今にも襲いかかってこようとしてるかもしれないじゃないか。振り返らなかったらそれこそ自分が殺されたことにすら気付けないかもしれない。

{	SetFrequency("SE01", 2000, 1300, Dxl3);}
声を出して、もう一度相手の返事があるか確かめてみるべきか。さっき聞いた声は僕の幻聴とか、妄想かもしれないし。

ほら、いつも僕の脳内だとフィギュアの星来たんだって喋りまくってるじゃないか。あれと同じだよ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CubeRoom4("ルーム", 100, 0);
	Fade("ルーム", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text040]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601540ta">
「だ……」

思い切って“誰だ？”と言おうとして、でもすぐに躊躇した。

もしこれで相手を刺激しちゃったら、まずいんじゃないだろうか。それがきっかけで襲いかかられちゃうことだってありそうだし……

いろいろ妄想し過ぎて、僕は身動きが取れなくなっていた。

どうしよう……。

もしかしたら今、自分はすごく間抜けな状態かもしれない。“視線の主”なんていなくて、僕はイスに座ったままひとり延々と自分の妄想に怯えて震え続けているっていうのが真相だったら、本気でバカすぎ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE02","SE_衝撃_衝撃音01");
	CreateTextureEX("背景２", 100, 80, -480, "cg/ev/ev029_01_2_梨深ソファ腰掛け_a.jpg");

	CreateTextureEX("はりつけ", 1000, Center, Middle, "cg/ev/ev005_01_3_杭貼付け_a.jpg");
	Request("はりつけ", Smoothing);
	CreateTextureEX("はりつけ２", 100, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");

	if(#下着パッチ==true)
	{
		CreateTextureEX("梨深", 100, center, -352, "ex/hu/hu梨深_制服_正面血まみれ_下着_lost_eye01.png");
	}else{
		CreateTextureEX("梨深", 100, center, -352, "cg/hu/hu梨深_制服_正面血まみれ_lost_eye01.png");
	}

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601040]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601550ri">
「ん？　あれ、タク？　固まってる？」

{	SetFrequency("SE01", 2000, 1400, Dxl3);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601560ta">
「――っ！」

{	Fade("ルーム", 300, 1000, null, );}
やっぱり、幻聴でも妄想でもない！
僕の背後に、誰かいる……！

びっくりして、僕は反射的に振り返ってしまっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "White");
	Fade("色１", 0, 0, null, true);
	Request("色１", AddRender);

	CreateColor("色２", 150, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 0, null, true);

	CreateTextureEX("画面ブレ１", 100, 0, 0, "cg/ev/ev029_01_2_梨深ソファ腰掛け_a.jpg");
	CreateTextureEX("画面ブレ２", 100, 0, 0, "cg/ev/ev029_01_2_梨深ソファ腰掛け_a.jpg");
//	SetBlur("画面ブレ２", true, 3, 300, 40);
//	CreateTextureEX("画面ブレ３", 100, 0, 0, "cg/ev/ev029_01_2_梨深ソファ腰掛け_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Rotate("ルーム", 500, @0, @-180, @0, Dxl3, false);
	Fade("背景２", 300, 1000, null, false);
	Move("背景２", 500, @-80, @0, Dxl3, true);

	Delete("背景１");
	Delete("ルーム");
	Wait(500);

	Move("背景２", 1000, @0, @480, AxlDxl, true);

	Wait(1000);

//張り付けフラッシュバック

	SoundPlay("SE02", 0, 1000, false);

	Zoom("はりつけ", 0, 2000, 2000, null, true);
	Move("はりつけ", 0, @80, @0, null, true);
	Fade("はりつけ", 0, 1000, null, true);

	Wait(200);

	Fade("はりつけ２", 0, 1000, null, true);
	Delete("はりつけ");

	Wait(200);


	Fade("梨深", 0, 0, null, true);
	Move("梨深", 0, @80, @0, null, true);

	Fade("梨深", 0, 1000, null, true);

	Wait(500);

	Stand("st梨深_制服_正面血まみれ","lost", 200, @0);
	Fade("色２", 0, 1000, null, true);

	Delete("はりつけ２");
	Delete("梨深");
	FadeStand("st梨深_制服_正面血まみれ_lost", 0, true);

	Wait(500);


	Fade("色１", 1000, 1000, null, true);
	Delete("色２");
	DeleteStand("st梨深_制服_正面血まみれ_lost", 0, true);

//透過度と大きさ
	Zoom("画面ブレ１", 0, 1100, 1100, null, true);
	Zoom("画面ブレ２", 0, 1100, 1100, null, true);
//	Zoom("画面ブレ３", 0, 1100, 1100, null, true);
	Fade("画面ブレ１", 0, 500, null, true);
	Fade("画面ブレ２", 0, 500, null, true);
//	Fade("画面ブレ３", 0, 500, null, true);

//動作
	Fade("色１", 500, 0, null, false);
	Zoom("画面ブレ１", 800, 1000, 1000, Dxl3, false);
	Fade("画面ブレ１", 800, 0, null, false);
	Wait(100);
	Zoom("画面ブレ２", 800, 1000, 1000, Dxl3, false);
	Fade("画面ブレ２", 800, 0, null, false);
	Wait(100);
//	Zoom("画面ブレ３", 800, 1000, 1000, Dxl3, false);
//	Fade("画面ブレ３", 800, 0, null, false);

	Wait(1000);
	Delete("画面ブレ*");
	Delete("色１");


//ＣＧ//ソファに腰掛けている梨深
//ＢＧＭ//緊迫
	SoundPlay("SE01", 500, 400, true);
	BGMPlay360("CH06",1000,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text041]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601570ri">
//◆「どうもどうも」の意
「どもどもー♪」

あ、あく、悪魔女……！

ソファに腰掛けていたのは、間違いなくあの『張り付け』の現場で会った女だった。

なぜかニコニコした笑顔で僕の方を見ている。

なんてことだ……なんてことだ……なんてことだ……！

ついに僕を殺しに来たんだ。

きっとさっき警察に事実を話しちゃったせいだ！
千里眼でそれを見られてたんだ！

それで音もなくこの部屋に入ってきて、いつでも殺せる位置に陣取って僕が恐怖に泣き叫ぶ様を眺めることにしたんだ！

そうに違いない！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601580ta">
「こ、こ……こ……っ」

殺さないで！　って叫ぼうとしたけど、あまりの恐怖でうまく声が出ない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601590ri">
「？？？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601600ri">
「こんびーふ？」

悪魔女は首をひねりながら、謎の呪文を発する。
きっと悪魔語だ、呪いとかかけられるんだ……っ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CubeRoom4("ルーム", 90, 0);
	Rotate("ルーム", 10, @0, @-180, @0, null, true);
	Fade("ルーム", 0, 1000, null, true);

	CreateSE("SE02","SE_衝撃_衝撃音03");

	Fade("背景２", 300, 0, null, false);
	Rotate("ルーム", 500, @-30, @-180, @0, Dxl3, true);
	SoundPlay("SE02", 0, 1000, false);
	Shake("ルーム", 300, 5, 5, 0, 0, 300, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text042]
少しでも悪魔女から距離を開けるべく、ＰＣデスクの下に逃げ込もうとした。でも動揺しすぎていたせいで、頭をデスクの縁にぶつけ、あまりの痛さでたまらずその場にうずくまる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	Fade("背景２", 300, 1000, null, true);
	Delete("ルーム");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601042]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601610ri">
「プッ。なにやってるの、タク」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601620ri">
「今、すっごい音したよ？　ゴツンッて」

なおも悪魔女は楽しそうな笑顔を崩さない。

でもきっと僕を油断させるための罠だ。

僕が安心したところで、グサリと来る気なんだ。あるいはさっきの呪文ですでに呪いをかけられてしまったかもしれない。

数日後に僕は全身から血を噴き出して死ぬのかも……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601630ta">
「た、た、頼む、よぅ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601640ta">
「ころさ……ないで……」

{	CreateSE("SE02","SE_じん体_動作_尻餅");
	Move("背景２", 500, @0, @-320, Axl1, true);
	SoundPlay("SE02", 0, 800, false);
	Shake("背景２", 300, 5, 5, 0, 0, 300, null, true);}
僕は頭を抱えて、床に突っ伏した。
さっき僕の前に現れた２人の刑事を恨んだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601650ta">
「け、け、いさつに、喋ったこと、あ、謝る、から……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601660ri">
「警察……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601670ta">
「そ、それにっ、話しても、ち、ちっとも、
信じて、も、もらえてなかったし……」

というのは時間を稼ぐための嘘だ。

さっき刑事のおっさんは、僕の身の安全は保証するって言ってくれた。

あのおっさんがちゃんと仕事をしてくれてるなら、警備の警官のひとりでも僕の家によこしてくれるはず……

そこまで考えて、ハッとした。

僕はあのおっさんに電話番号は教えたけど、

ここの住所は教えてない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	Delete("背景２");
	Delete("ルーム");

	Stand("st梨深_制服_通常ビシッ！","angry", 200, @150);
	FadeStand("st梨深_制服_通常ビシッ！_angry", 200, true);
	Shake("背景１", 200, 2, 2, 0, 0, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text043]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601680ri">
「ビシィッ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601690ta">
「ひえ……っ」

いきなり悪魔女が敬礼らしきポーズをした。

しかも奇妙なことに、効果音らしき言葉を自分でつぶやいたぞ……。これも悪魔の呪文か？

{	Stand("st梨深_制服_通常ビシッ！","hard", 200, @150);
	FadeStand("st梨深_制服_通常ビシッ！_hard", 300, false);
	DeleteStand("st梨深_制服_通常ビシッ！_angry", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601700ri">
「独り言はやめるべし！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601710ri">
「殺さないでとか、警察がどーとか、あたしにはなんのことかさっぱりだよ」

さっぱりだって？
とぼけるつもりか？

それとも“事実は忘れて、なにもなかったことにしろ”っていう無言の圧力か？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601720ta">
「…………」

この女……いったいなにを考えてるんだ……？
僕を殺しに来たわけじゃないのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_のぞく");
	SoundPlay("SE02", 0, 1000, false);
	DeleteStand("st梨深_制服_通常ビシッ！_hard", 500, true);
	Wait(500);
	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601043]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601730ri">
「ほら、立てる？　立とう！」

ソファから立ち上がった悪魔が、僕に向かって手を差しのべてきた。

その表情はとても優しそうだ。
しかも、こうして近くで見ると……けっこうかわいい……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601740ta">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text044]
くそぅ、バカ丸出しじゃないか、僕は！

悪魔に対してなにが“けっこうかわいい”だ。

こいつは殺人鬼で。
優愛や『将軍』を使って僕を罠にはめようとして。
今、こうして僕を直接殺しに来てるんだぞ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text045]
信じるな……。

もう、優愛のときで懲りている。二度と同じ過ちは犯さない。だから差し出された手を、僕は取らなかった。

この悪魔女の笑顔に、騙されるな。
これは悪魔の誘惑だ。誘惑に負けたら僕は死ぬ。

なにも信じるな。誰の言葉も信じるな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text046]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601750ta">
「だ、だって……み、見たんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601760ta">
「お、おま、お前が……人を、こ、殺してるとこ……」

{	Stand("bu梨深_制服_右向き","hurry", 200, @0);
	FadeStand("bu梨深_制服_右向き_hurry", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601770ri">
//◆苦笑
「あ、あのさ、タク。それかなりひどいこと言ってるって気付いてる？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601780ri">
「まさか殺人犯呼ばわりされるなんてね……たはは……」

僕を、どうするつもりだ……？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601790ta">
「ニュージェネの……」

あの四つの事件みたいに……僕も……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601800ta">
「こ、ろすんでしょ……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601810ta">
「そ、それとも、優愛とか、『将軍』とかがいる、ば、場所に連れてって――」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_右向き_hurry", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601820ri">
「ゆあ？　ショウグン？　誰それ？」

//※禁則処理
３人でよってたかって無抵抗の僕を集団リンチとかする気かもしれない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text047]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601830ta">
「そ、そんなの、い、イヤだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601840ta">
「助けて……」

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601850ri">
「んー、じゃあね、あたしを殺人犯扱いしなければ、助けてあげる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601860ta">
「ひっ……」

や、やっぱりそうだったんだ……！

{	Stand("bu梨深_制服_通常","rage", 200, @0);
	FadeStand("bu梨深_制服_通常_rage", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601870ri">
「って、そんなビビらないでよぉ。いちいちあたしがヘコむようなリアクションしてくれるよね……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601880ta">
「お、お願いだ……もう二度と、誰にも……し、喋らないから……だから、み、見逃して……」

{	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_rage", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601890ri">
「もしもーし、タク！　ちょっと落ち着こう？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text048]
この女、馴れ馴れしくタクって呼びやがって……。

そう言えばどうしてこの女は僕の名前を知ってる？

あの『張り付け』の現場で初めて会ったときから、すでにこの女は僕の名前を知ってた。

どうして？
それに僕のベースの場所もどうして分かった？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text049]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601900ri">
「当然でしょ――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601910ri">
「あなたの名前を知ってるのは」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601920ta">
「！？」

今、心を読まれた！？

やっぱりこの女は千里眼が使えるんだ！
名前や住所を知られたのもその能力を使ったからだ！

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601930ri">
「タクってけっこう独り言多いよね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601940ri">
「――前から思ってたことだけど」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text050]
前から……？　それっていつから？
っていうか、僕は今独り言を言っていたの？

自分ではまったく自覚がない。

ホントに？　ホントのホントに独り言を言ってた？
この女が嘘を言っている可能性は？
心を読まれた可能性は？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text051]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601950ri">
「タクの名前を知らないわけないよー。
あたし、物覚えはそんなによくない方だけど――」

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601960ri">
「友達の名前くらい、覚えるよ」

友……達……？

{	Stand("bu梨深_制服_通常","rage", 200, @0);
	FadeStand("bu梨深_制服_通常_rage", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601970ri">
「それともタク、あたしのことバカにしてる？
そりゃあたし、テストの点数はそんなによくないけど」

{	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_rage", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05601980ri">
「面と向かってそういうこと言われると傷ついちゃうな」

頭がおかしいのか……？
誰の頭が？　僕の？　この女の？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05601990ta">
「も、もしかして……て、転校生……？」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602000ri">
「あ、そう言えば近いうちに転校生が来るらしいよ。塚ちんセンセーが言ってた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text052]
会話がかみ合ってない……。

さっきまでの、いつ殺されるか分からないっていう緊張感の入り交じった恐怖は薄れつつあった。

でも、その代わりに薄ら寒くなるような別の種類の恐怖が、心をジワジワと侵食してきている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text053]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602010ri">
「えーっと、もしもしー？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602020ri">
「その顔はまさか、まだ信じてくれてない？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602030ta">
「だ、誰……だ……？」

お前は、誰だ？
こいつは殺人鬼だ。悪魔女だ。

{	Stand("bu梨深_制服_通常","rage", 200, @0);
	FadeStand("bu梨深_制服_通常_rage", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602040ri">
「うわ、タクこそクラスメイトの顔覚えてないんだ。ひどー」

クラスメイトだって……？
友達だけじゃなくて、クラスメイトだっていうのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_rage", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text054]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602050ri">
「でもまあしょうがないか、タクはあんまり学校来ないもんね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602060ri">
「だからって、あたしの存在まるごとなかったことにするのはどうかと思う」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602070ri">
「あたしの名前、ほんっとーうに、忘れちゃった？」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602080ri">
「そんなことないよね。知ってるでしょ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602090ri">
「あなたは」

{	SetVolume360("CH*", 3000, 0, null);
	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602100ri">
「知ってるはず」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602110ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＢＧ//白
//画面中央に黒字で「リミ」と出る

	MusicStart("SE01", 500, 0, 0, 0, null, false);

	DeleteStand("bu梨深_制服_通常_smile", 500, false);

	CreateColor("色１", 100, 0, 0, 1280, 720, "White");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/effect.png", true);

	CreateTextureEX("文字１", 110, 0, 0, "cg/bg/bg902_01_6_リミ01_a.jpg");
	CreateTextureEX("文字２", 120, 0, 0, "cg/bg/bg902_02_6_リミ01_a.jpg");

	CreateEffect("レンズ１", 1000, @-450, @-500, 1920, 1920, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

	Wait(1000);

	Fade("文字１", 300, 1000, null, true);

	Wait(2500);

	Fade("文字２", 300, 1000, null, true);

	Wait(2000);


/*おがみ：テキスト演出修正
	SetBacklog("リミ", "null", null);

	SetFont("ＭＳ ゴシック", 51, #000000, #666666, 500, LIGHTDOWN);
	CreateText("テキスト１４", 100, center, middle, Auto, Auto, "リ");
	Move("テキスト１４", 0, @-24, @0, null, true);
	Request("テキスト１４", NoLog);
	Request("テキスト１４", Erase);
	Request("テキスト１４", Enter);
	WaitAction("テキスト１４", null);

	Wait(1000);

	SetFont("ＭＳ ゴシック", 51, #000000, #666666, 500, LIGHTDOWN);
	CreateText("テキスト１５", 100, center, middle, Auto, Auto, "ミ");
	Move("テキスト１５", 0, @24, @0, null, true);
	Request("テキスト１５", NoLog);
	Request("テキスト１５", Erase);
	Request("テキスト１５", Enter);
	WaitAction("テキスト１５", null);

	Wait(2000);

	FadeDelete("テキスト１４", 1000, false);
	FadeDelete("テキスト１５", 1000, false);

*/
	CreateColor("色２", 200, 0, 0, 1280, 720, "Black");
	DrawTransition("色２", 100, 0, 1000, 100, null, "cg/data/effect.png", true);

	Delete("文字１");
	Delete("文字２");
	Delete("色１");

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text055]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602120ta">
「リ……ミ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Delete("レンズ*");
	DrawTransition("色２", 1000, 1000, 0, 100, null, "cg/data/effect.png", true);
	Delete("色２");
	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601055]
//ＢＧ//拓巳の部屋
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602130ri">
「そう！　正解！　賞金５０円プレゼント！」

//ＳＥ//心臓の鼓動
{	BGMPlay360("CH01",1000,1000,true);
	CreateSE("SE01","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE01", 0, 1000, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602140ta">
「え……！？」

{	Stand("bu梨深_制服_通常ビシッ！","happy", 200, @0);
	FadeStand("bu梨深_制服_通常ビシッ！_happy", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
//おがみ：ルビ入力
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602150ri">
「あたし、<RUBY text="さきはた">咲畑</RUBY><RUBY text="りみ">梨深</RUBY>でーす」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602160ri">
「な～んだ。やっぱり覚えててくれたんだね」

{	Stand("bu梨深_制服_通常ビシッ！","smile", 200, @0);
	FadeStand("bu梨深_制服_通常ビシッ！_smile", 300, false);
	DeleteStand("bu梨深_制服_通常ビシッ！_happy", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602170ri">
「よかったよかった♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text056]
な……んで……。

ホント、なのか？

この悪魔女の名前は、ホントに“リミ”って言うのか？

なんで今、僕の心の中にその名前が浮かんだんだろう。

なんで僕は、この女の名前を知ってるんだろう。

もしかして、僕が忘れてるだけで、ホントにクラスメイトで友達だったりするのか？

……いや、そんなはずないっ。

咲畑梨深なんて名前、聞いたことすらない。

きっと偽名だ。僕が“リミ”って言ったから、この女はそういう名前にしたんだ。オレオレ詐欺と同じだ。

そもそも僕に対してこんなに馴れ馴れしく話してくる三次元女なんて、優愛ぐらいしか知り合ったことがない。

そして優愛はこの悪魔女の手下だ。

あ、そうか……！

今まさに目の前で起きている咲畑とかいうこの女のしていることは、優愛のときと同じ手法なんだ。

僕に馴れ馴れしくして、三次元女との付き合いに慣れてない僕をちょっと誘惑しておいて、罠にはめようっていうつもりだ。

そりゃ、クラスメイトの顔なんてさっぱり覚えてないし覚える気もないけど、少なくともこの女の顔は今まで同じ教室で見たことは一度もない……はずだよな。

……ダメだ、断言できない。

なにしろ僕はいつも学校では、始終自分の机に張り付いて、寝たふりをして妄想しているか机の表面をじっと眺めているか教科書を読むフリをしているかのいずれかしかない。

クラスメイトの顔も名前も、まるで覚えてない。覚えようともしなかった。

どっちなんだ？
この女の言っていることはホントなのか、違うのか。

いや、クラスメイトかどうかは問題じゃない。少なくとも厳然たる事実としてあるのは、この女が人殺しということで――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常ビシッ！_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text057]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602180ri">
「もしかして本気で思い出せないの？　さっき頭打ったせいで記憶喪失になっちゃった？」

悪魔女が僕の頭に手を伸ばしてくる。

{	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	CreateSE("SE02","SE_じん体_動作_尻餅");
	Fade("色１", 0, 0, null, true);
	SoundPlay("SE02", 0, 800, false);
	Fade("色１", 500, 1000, null, true);}
僕はそれを避けようと、またデスクの下に逃げ込んだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602190ri">
「……タク、変だよ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602200ta">
「…………」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602210ri">
//◆だいちん
「じゃあ、“大ちん”に聞いてみて」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602220ri">
「そしたらタクも思い出せるかも」

だ、大ちん？
なんだそれ？　人名か？　それともなにかの暗号？　悪魔の呪文――？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602230ri">
「大ちんだよ、大ちん。三住大輔！」

{	Fade("色１", 500, 0, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602240ta">
「え……！？」

こ、こいつ、三住くんの名前を知ってる……？
しかも大ちんって……よっぽど親しくないとそうは呼ばないぞ……。

{	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602250ri">
「んーと、ちょっと待ってね」

悪魔女は、ソファの脇に置いてあったカバン――僕はこんなカバン持ってない――からケータイを取り出した。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602260ri">
「えーと、大ちん大ちん、は、と……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//ケータイ操作音
	CreateSE("SE02","SE_日常_けい帯操作");
	SoundPlay("SE02", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text058]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602270ri">
「よし、オッケー」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602280ri">
「はい」

なにやら操作をしていたかと思うと、僕の方に差し出してくる。

受け取らずにいると、悪魔女は苦笑しながら、いきなり僕の手を取った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602290ta">
「わ……っ！」

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602300ri">
「ほら、固まってないで」

強引に、僕の手にケータイを握らせてくる。

悪魔女の手は柔らかくて、少しひんやりしていた。
もっと冷たい、氷のような手だと思ってたけど、それほどでもなかった。
殺人鬼でもちゃんと血が通ってるらしい。

と言うか、予想以上に女の子らしい手だったから、ドキドキした。

い、いや、惑わされるな！

こいつは悪魔だ！　誘惑なんかされるもんか！　僕は三次元に興味はないんだ！
星来たん、僕に力をくれ！

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602310ri">
「タク、ケータイ使ったことないの？　電話機は耳に当てるんだよー？」

至近距離から、悪魔女が首を傾げつつ僕の顔をのぞき込んでくる。

さらに、僕の手をつかんだまま、耳元へと持ち上げる。

{	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
僕はとっさに、ケータイの液晶画面を見た。

“大ちん”という登録された名前が表示されていて、すでに電話でコール中になっている。

やむなく耳に受話器を当ててみると、

//ＳＥ//電話呼び出し音
{	CreateSE("SE02","SE_日常_でんわ_呼びだし音_LOOP");
	SoundPlay("SE02", 0, 1000, true);}
呼び出し音が鳴っていた。

//ＳＥ//電話が繋がる
{	SoundPlay("SE02", 0, 0, false);}
やがてすぐにその音は途絶え、代わりに三住くんの声が聞こえてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text059]
//以下、三住の声は電話の声
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602320mi">
「はい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602330ta">
「あ……」

相手は名乗らない。
どうやら繁華街にいるらしく、周囲の喧噪が受話器を通して聞こえてくる。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602340mi">
「なんか用か――」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602350mi">
「リミ」

リミ……。
サキハタリミ。

三住くんも、知ってるのか……。

いや、そのこと自体は不思議じゃない。なにしろ三住くんはナチュラルボーン女たらしだ。この悪魔女と過去に付き合ってたとか、今も絶賛交際中とかでもうなずける。

問題は、悪魔女が、僕の、今の、クラスメイトかどうか、なんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	CubeRoom2("ルーム", 100, 0);
	Fade("ルーム", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text060]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602360ri">
「タク、大ちん出た？」

悪魔女がまたも僕の顔をのぞき込んでくる。

くそ、顔が近いんだよ……。

僕は女に背を向けて、電話の向こうに呼びかけた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602370ta">
{	DeleteStand("bu梨深_制服_通常_normal", 300, false);
	Rotate("ルーム", 0, @0, @-180, @0, Dxl3, false);
	Fade("ルーム", 300, 1000, null, false);
	Rotate("ルーム", 300, @0, @180, @0, Dxl3, true);}
「ぼ、ぼ、僕、西條……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602380mi">
「なんだ、タクか。リミと一緒にいるのか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602390ta">
「…………」

な、なんでそんなにあっさり納得するんだ……。

それじゃまるで、僕が悪魔女と一緒にいるっていうシチュエーションが、日常的なことみたいに聞こえるじゃないか……。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602400mi">
「またリミに振り回されてるのか？　大変だなお前も」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602410mi">
「でもよ、ひとつだけ言っていい？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602420mi">
「お前、そろそろ自分のケータイ買えよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602430ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",1000,1000,true);

	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text061]
この電話の向こうの相手は、
ホントに、三住くんなんだろうか？

例えば悪魔女が僕をはめるために、“三住くんの声によく似た別の誰かのところにかけさせた”可能性もある。

この“三住くんの声に似た誰か”は悪魔女の手下で、三住くんを装って僕を騙そうとしているかもしれない。

なにもかもが疑わしく思えてくる。
なにが真実で、なにが嘘なのかが、分からない。

そもそも悪魔女はそこまで手の込んだことをしているとして、いったい僕をどんな罠にはめようとしてるんだろう。

この状況なら、悪魔女が僕を直接殺すのが一番手っ取り早いんじゃないのか？

それとも、こんなまだるっこしいことをしてでも“騙さなくちゃいけない”理由があるのか？

//※テキストオーバー
いや、もしかしたら三住くん主導で仕掛けたドッキリのようなものかもしれない。

この女は三住くんのカノジョで、クラスメイトでもなんでもなくて、僕をからかうために三住くんの手によって送り込まれた仕掛け人――

そんなわけないだろ！

だったらあの『張り付け』現場でのことはどう説明する気だよっ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text062]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602440mi">
「で、タク、なんか用か？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602450mi">
「俺としては野郎からの電話なんてあんま嬉しくねえんだけどな。
ははっ」

口調は完全に三住くんと同じだ。

聞けば聞くほど、電話の向こうの相手は三住くん以外には考えられなくなってくる。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602460mi">
「女の口説き方でも教えてもらいたいのか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602470mi">
「んなわけねーか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602480ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text063]
なんて切り出すべきだろう。
視線を背中に感じる。あの女は、じっと僕を見つめている。

首筋のチリチリとした感覚はいまだ消えない。
悪魔女は、どんな顔をして僕を見ているんだろう。
振り返って、確かめたい。でも、怖くてできない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text064]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602490mi">
「で、なんなんだ？　今、俺も女と一緒なんだよ。なるべく手短に頼むわ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602500ta">
「そ、そのっ、えっ……と……！」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602510mi">
「なんだよ？　早く言えって」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602520ta">
「…………ウ、ウ、ウチの」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602530mi">
「うん？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602540ta">
「クラス……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602550mi">
「ああ、ウチのクラスがどうした？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602560ta">
「い、いる？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602570mi">
「なにが？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602580ta">
「女子……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602590mi">
「はあ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602600ta">
「サ、サ、サキハタ……って名前の……」

しどろもどろになってなんとか説明する。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602610mi">
「………………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SoundPlay("SE*", 500, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text065]
ふと、三住くんからの返事が途切れた。

沈黙。

でも街の喧噪などの雑音は聞こえてくるから、電話が切れたわけじゃない。
なんで黙るの――？

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602620mi">
「はあああ～～～～」

と、次に聞こえてきたのは盛大なため息だった。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602630mi">
{#TIPS_ゲーム脳 = true;$TIPS_on_ゲーム脳 = true;}
「お前さぁ、<FONT incolor="#88abda" outcolor="BLACK">ゲーム脳</FONT>じゃねえの？」

{$TIPS_on_ゲーム脳 = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602640ta">
「ちょ……」

な、なんだよいきなり……。

しかもゲーム脳って、そんな科学的根拠もないようなトンデモ科学でレッテル貼りかよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	SoundPlay("SE01", 500, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text066]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602650mi">
「それって梨深のことだろ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602660mi">
「梨深のケータイでかけてきてるくせに、なにバカなこと言ってんだ、お前」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602670ta">
「…………」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602680mi">
「分かった、お前もしかして、梨深になにか指図されてんだろ？
イタズラか？　ドッキリか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602690mi">
「じゃあ梨深に伝えといてくれ。
“お前の低レベルのドッキリに引っかかるほど俺はバカじゃねえ”ってな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602700ta">
「ホ、ホント……！？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602710mi">
「ん？　なにが？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602720ta">
「ホントに、ク、クラス、メイト……？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602730mi">
「お前なあ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602740mi">
「たまにしか学校来ねえから忘れちまったか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602750mi">
「俺はともかく、お前は１年のときから同じクラスだろ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602760mi">
「この前だって３人で一緒に映画見に行ったじゃねーか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 500, null, true);

	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE02", 0, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text067]
この“三住くんらしき誰か”の言っていることが理解できない。

悪魔女と僕が、１年生のときから同じクラスだったって？
この前３人で一緒に映画を見に行ったって？

この前……って、いつだ？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text068]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602770mi">
「俺がお前とダチになったのだって、最初は梨深に付き合わされたのがきっかけだったしな」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602780mi">
「俺と同じで梨深も物好きだからよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602790mi">
「ニートのお前を気にかけてやってるのは、世界広しと言えど俺と梨深ぐらいだぜ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602800mi">
「あ、それは言い過ぎか。ははっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602810ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text069]
電話の向こうから聞こえてくる言葉……その単語のひとつひとつにまるでリアルさを感じない。感じるわけがない。一切僕の記憶にはないんだから。

そんな過去があったなんて認めることはできない。

“三住くんらしき誰か”が話しているのは、物語だ。過去じゃない。過去は、記憶に裏打ちされていなくちゃ成り立たないものなんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text070]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602820mi">
「っていうか梨深ってマジで女っ気ないよな。おっと、これはあいつには言うなよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602830ta">
「キミは……誰だ……？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05602840mi">
「おいおい、マジでおかしくなったか？
俺のことまで忘れたわけか。ゲームやり過ぎ――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602850ta">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 500, 0, null);

	Fade("色１", 500, 1000, null, true);
	SoundPlay("SE*", 0, 0, false);

//ＳＥ//ケータイ切る
	CreateSE("SE03","SE_日常_けい帯ボタン押す");
	SoundPlay("SE03", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text071]
耐えられなくなって、僕は一方的に電話を切った。

{	Fade("色１", 2000, 0, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602860ta">
「はあ、はあ、はあっ……」

気が付けば自分がひどく荒い呼吸をしていることに気付く。額からにじみ出る汗はさっきから止まる気配がないどころか、さらに増えている。顎からポタポタと足許にしたたり落ちるほどだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("ルーム", 300, 0, null, true);

	Delete("ルーム");
	Delete("色１");

	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, false);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601071]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602870ri">
「タク、汗びっしょりだよ？」

悪魔女が、いかにも僕を心配している、という表情をしながら、平然とハンカチを差し出してきた。

朱色がかった、かわいらしい無地のハンカチ。かすかにフローラルな香りがした。

それは受け取らず、なんとか冷静に状況を整理しようとしてみる。でもうまくいかない。疑心暗鬼な感情が渦巻いて混乱してる。

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602880ri">
「で、大ちんはなんて？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",2000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text072]
かすかに残念そうなため息をついてハンカチをしまった悪魔女は、すぐに勝ち誇ったような表情になって聞いてきた。

それは答えを最初から確信している態度だ――

僕はそれに答える余裕はない。

この女がなんなのか。ただのクラスメイトなのか化け物なのか……分からない。

もしかしたら僕の頭の方がオカシイのかもしれない。

『将軍』とのチャットのことも考えると、僕じゃない誰かが僕の身体を操っている可能性も捨てきれない。

あるいはこの悪魔女……咲畑梨深という女との記憶だけが、なんらかのアクシデントですっぽり抜け落ちたことも考えられる。

いずれにせよ、僕は自分が分からない……。

記憶喪失？　夢遊病？　それ以外のなにか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text073]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602890ri">
「大丈夫？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602900ri">
「身体、辛いならソファで横になる？」

悪魔女が優しい言葉をかけてくる。

優しい言葉には気をつけろ。僕みたいなキモオタに優しくするヤツは、絶対裏があるに決まってる。

僕は悪魔女の言葉に首を振って拒絶の意志を示し、思い切って顔を上げた。
汗が目に入って、視界が滲む。

悪魔女の顔は予想以上に近くにある。
その瞳は、どんな色を含んでる……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text074]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602910ta">
「なんで……」

{	Stand("bu梨深_制服_正面","normal", 200, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602920ri">
「ん？　なになに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602930ta">
「ここにいる……？」

{	Stand("bu梨深_制服_正面","hard", 200, @0);
	FadeStand("bu梨深_制服_正面_hard", 300, false);
	DeleteStand("bu梨深_制服_正面_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602940ri">
「なんで、って。タクに会いに来たんだよ」

{	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, false);
	DeleteStand("bu梨深_制服_正面_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602950ri">
「もしかして、勝手に部屋に入ったこと、怒ってる？」

{	Stand("bu梨深_制服_正面","hard", 200, @0);
	FadeStand("bu梨深_制服_正面_hard", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602960ri">
「でもそれは、タクがちっとも返事してくれないから悪いんだよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05602970ri">
「けっこう長い時間、ノックしてたんだから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602980ta">
「…………」

僕は、借りていたケータイを突き返した。
悪魔女がそれをおずおずと受け取るのを見ながら、改めて問い質す。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05602990ta">
「なんで……」

{	Stand("bu梨深_制服_正面","normal", 200, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, true);
	DeleteStand("bu梨深_制服_正面_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603000ri">
「ん？　今度はなに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603010ta">
「ここにいる……？」

こいつが僕を訪ねて来た理由はなんだ？
僕を殺しに来たならとっくに実行してるはずなのに、どうしてなにもしない？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	NegativeHuman();

//※妄想ＯＵＴエフェクトはナシ。
//合流４へ

}



//=============================================================================//

if($妄想トリガー１２ == 0)
{

//☆☆☆
//分岐９

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text075]
………………。

返事はなかった。
あるわけがないよね。
あったら逆に怖いよ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//扉をノックする音
	CreateSE("SE01","SE_じん体_動作_手_扉たたく01_LOOP");
	SoundPlay("SE01", 0, 1000, false);
	Wait(800);
	SoundPlay("SE01", 100, 0, false);

	CubeRoom4("ルーム", 100, 0);
	Fade("ルーム", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text076]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603020ta">
「…………え？」

音が、した。

{	Fade("ルーム", 300, 1000, null, );
	Rotate("ルーム", 500, @0, @-180, @0, Dxl3, true);}
それで、僕はとっさに振り返ってしまっていた。

今日の振り向かないぞゲームは僕の負け。

部屋の中には誰もいない。
幻聴……かな？

幻聴であってほしい……心の中でそう願ってしまう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//扉をノックする音
	CreateSE("SE01","SE_じん体_動作_手_扉たたく01_LOOP");
	SoundPlay("SE01", 0, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text077]
まただ。

また、音がした。

もう自分をごまかすことはできない。
これは、外から扉をノックする音だ。

つまり、

誰かが、来た。

ここを訪ねてくる人間なんてほとんどいない。
新聞の勧誘でさえこんな屋上までは上がってこない。

考えられるのは……

宅配業者？

いや、今日は荷物が届く予定はないはずだ。

七海……？

いや、七海ならもっと激しく乱暴に扉を叩く。
そして“おにぃ！　開けろー！”って外で騒ぐはずだ。

優愛……？

その可能性は高い。あの女はここに一度来たことがある。悪魔女の指示を受けて僕を殺しに来たのか？

でもそうだとしたら、わざわざノックなんてするだろうか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//扉をノックする音

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text078]
ノックする音はしつこく続いている。

僕はその場で凍り付いたまま、どうすべきか考えを巡らした。だけどいいアイデアなんて浮かばず、焦りばかりが募っていく。

そ、そうだ、居留守を使おう。

いくらなんでも警戒しすぎかな？

だけど念には念を入れないと。最近の渋谷はすごく物騒だし。

もし優愛だったら、あいつを中に入れるわけにはいかないんだ。そんなことしたら、どうぞ殺してくださいって言ってるようなもんだ。

っていうか、鍵はかかってたっけ？

扉の方を凝視してみる。
でも暗くて、よく見えない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MoveCube("ルーム", 1000, @-20, @0, @100, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601078]
僕はそっと立ち上がると、足音を立てないように抜き足差し足でドアへと近づき、

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603030ta">
「あ……」

部屋の真ん中あたりまで進んだところで、ようやく確認できた。

鍵は、

{	CreateSE("SE03","SE_衝撃_衝撃音02");
	SoundPlay("SE03", 0, 1000, false);}
かかっていない――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//扉をノックする音

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text079]
全身に悪寒が走る。
緊張で、鼓動が速くなる。

これじゃ、勝手に侵入されて後ろからいきなり刺し殺されても、文句は言えない。

とにかく急いで鍵をかけなくちゃ。

音を立てたら居留守してるのがバレバレだけど、中に入ってこられるよりはマシだ。

僕は扉に駆け寄ろうとして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 500, 0, false);

	CreateSE("SE02","SE_じん体_動作_棚にぶつかり倒れる");
	CreateSE("SE03","SE_じん体_動作_足_蹴る_ぺっとぼとる");
	MoveCube("ルーム", 1000, @0, @-30, @100, AxlDxl, false);
	Wait(500);
	Rotate("ルーム", 500, @-70, @0, @0, Axl3, false);
	Wait(500);
	SoundPlay("SE02", 0, 1000, false);
	SoundPlay("SE03", 0, 1000, false);
	Shake("ルーム", 200, 10, 10, 0, 0, 500, null, true);

//ＳＥ//滑って転ぶ
//おがみ：滑って転ぶ音ダミー

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text080]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603040ta">
「っ！」

床に落ちていたコンビニ弁当の空容器を踏んづけてしまった。

見事に足を滑らせて、尻をしたたかに打つ。

激痛に、声にならないうめき声を上げる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//コンテナハウスの扉を開く

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");
	CreateSE("SE01","SE_日常_扉_開ける");
	SoundPlay("SE01", 0, 500, false);
	Fade("背景１", 1000, 1000, null, true);
	Fade("背景２", 0, 0, null, true);
	FadeDelete("ルーム", 0, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text081]
すると、その僕の目の前で、扉がゆっくりと開き始めた。

誰だか知らないけど、ノックしていた何者かが勝手に扉を開けようとしている。

僕は立ち上がろうとした。でも、痛みで身体が思うように動かない。

だから、ただ涙目で扉が開いていくのを見ていることしかできない。

まず最初に、手が見えた。
服の袖は、明らかに翠明学園の制服のものだった。

次に、髪が見えた。
七海より少し長い。
優愛より短い。

誰だか分からない。

最後に、その髪を揺らしながら、ひょっこりと扉の影から顔がのぞいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_衝撃_衝撃音01");

	Stand("st梨深_制服_正面","normal", 150, @150);
	FadeStand("st梨深_制服_正面_normal", 1000, true);

	CreateTextureEX("はりつけ", 1000, Center, Middle, "cg/ev/ev005_01_3_杭貼付け_a.jpg");
	Request("はりつけ", Smoothing);
	CreateTextureEX("はりつけ２", 1000, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text082]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603050ri">
//◆恐る恐るという感じで
「こん、にちは～」

{	BGMPlay360("CH06",1000,1000,true);}
それが誰なのか――
ようやく、悟った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE02", 0, 1000, false);

	Zoom("はりつけ", 0, 2000, 2000, null, true);
	Move("はりつけ", 0, @80, @0, null, true);
	Fade("はりつけ", 0, 1000, null, true);

	Wait(200);

	Fade("はりつけ２", 0, 1000, null, true);

	FadeDelete("はりつけ", 0, true);

	Wait(200);

	if(#下着パッチ==true)
	{
		CreateTexture360("梨深", 1000, center, -352, "ex/hu/hu梨深_制服_正面血まみれ_下着_lost_eye01.png");
	}else{
		CreateTexture360("梨深", 1000, center, -352, "cg/hu/hu梨深_制服_正面血まみれ_lost_eye01.png");
	}

	Fade("梨深", 0, 0, null, true);
	Move("梨深", 0, @80, @0, null, true);

	Fade("梨深", 0, 1000, null, true);

	Wait(300);

	Stand("st梨深_制服_正面血まみれ","lost", 200, @150);

	CreateColor("色２", 150, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 1000, null, true);
	FadeDelete("はりつけ２", 0, true);
	FadeDelete("梨深", 0, true);
	FadeStand("st梨深_制服_正面血まみれ_lost", 0, true);

	Wait(300);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "White");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, true);

	Fade("色１", 1000, 1000, null, true);
	Delete("色２");
	DeleteStand("st梨深_制服_正面血まみれ_lost", 0, true);
	Fade("色１", 1000, 0, null, true);
	Delete("色１");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text582]
予想外の人物。
最悪の展開。
絶望感で、目の前が真っ暗になりそうだった。

あ、あく、悪魔女……！

まさか、優愛じゃなくて悪魔女本人が乗り込んでくるなんて……！

{	Stand("st梨深_制服_正面","smile", 200, @150);
	FadeStand("st梨深_制服_正面_smile", 300, false);
	DeleteStand("st梨深_制服_正面_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603060ri">
「あ、いたいた」

目が合う。
途端に、悪魔女が嬉しそうに笑う。
その笑顔に、僕はゾッとした。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603070ri">
「もー、どうしてすぐ返事してくれないの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text083]
なんてことだ……なんてことだ……なんてことだ……！

扉に隠れている手に、あの十字の杭を握りしめてるに違いない！

ついに僕を殺しに来たんだ！
僕を殺せる喜びで笑っているんだ！

きっとさっき警察に事実を話しちゃったせいだ！
千里眼でそれを見られてたんだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text084]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603080ta">
「こ、こ……こ……っ」

殺さないで！　って叫ぼうとしたけど、あまりの恐怖でうまく声が出ない。

{	Stand("st梨深_制服_通常","normal", 200, @150);
	FadeStand("st梨深_制服_通常_normal", 300, false);
	DeleteStand("st梨深_制服_正面_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603090ri">
「？？？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603100ri">
「ころっけ？」

悪魔女は首をひねりながら、謎の呪文を発する。

きっと悪魔語だ、呪いとかかけられるんだ……っ！

少しでも悪魔女から距離を開けるべく、僕は尻餅をついたまま後ずさった。散らかっているゴミで何度も手を滑らせながら、とにかく部屋の一番奥――ＰＣデスクのところまで逃げる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603110ri">
「ねえ、入っていいかな？」

{	Stand("st梨深_制服_通常","smile", 200, @150);
	FadeStand("st梨深_制服_通常_smile", 300, false);
	DeleteStand("st梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603120ri">
「っていうか、入っちゃいまーす♪」

悪魔女が侵入してくる。
しかも律儀に靴を脱いで。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603130ri">
「お邪魔しちゃった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603140ri">
「あ、散らかっててもあたし、平気だから。気にしないでね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_通常_smile", 300, true);
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	Delete("背景１");

//ＳＥ//拓巳の部屋の扉が閉まる
	CreateSE("SE01","SE_日常_扉_閉まる");
	SoundPlay("SE01", 0, 800, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text085]
扉が閉まる。
逃げ道を塞がれてしまった。

ただ意外にも、悪魔女はカバンを持っているだけだった。凶器らしいものは見当たらない。

いや、きっとあのカバンに入っているんだ……！

油断しちゃだめだ。

僕が安心したところで、グサリと来る気なんだ。あるいはさっきの呪文ですでに呪いをかけられてしまったかもしれない。

数日後に僕は全身から血を噴き出して死ぬのかも……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text086]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603150ta">
「た、た、頼む、よぅ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603160ta">
「ころさ……ないで……」

{	CreateSE("SE02","SE_じん体_動作_尻餅");
	SoundPlay("SE02", 0, 800, false);
	Shake("背景２", 300, 3, 3, 0, 0, 300, null, true);}
僕は頭を抱えて、床に突っ伏した。
さっき僕の前に現れた２人の刑事を恨んだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603170ta">
「け、け、いさつに、喋ったこと、あ、謝る、から……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603180ri">
「警察……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603190ta">
「そ、それにっ、話しても、ち、ちっとも、
信じて、も、もらえてなかったし……」

というのは時間を稼ぐための嘘だ。

さっき刑事のおっさんは、僕の身の安全は保証するって言ってくれた。
あのおっさんがちゃんと仕事をしてくれてるなら、警備の警官のひとりでも僕の家によこしてくれるはず……

そこまで考えて、ハッとした。

僕はあのおっさんに電話番号は教えたけど、

ここの住所は教えてない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常ビシッ！","angry", 200, @150);
	FadeStand("st梨深_制服_通常ビシッ！_angry", 200, true);
	Shake("背景２", 200, 5, 5, 0, 0, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text087]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603200ri">
「ビシィッ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603210ta">
「ひえ……っ」

いきなり悪魔女が敬礼らしきポーズをした。

しかも奇妙なことに、効果音らしき言葉を自分でつぶやいたぞ……。これも悪魔の呪文か？

{	Stand("st梨深_制服_通常ビシッ！","hard", 200, @150);
	FadeStand("st梨深_制服_通常ビシッ！_hard", 300, false);
	DeleteStand("st梨深_制服_通常ビシッ！_angry", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603220ri">
「独り言はやめるべし！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603230ri">
「殺さないでとか、警察がどーとか、あたしにはなんのことかさっぱりだよ」

さっぱりだって？
とぼけるつもりか？

それとも“事実は忘れて、なにもなかったことにしろ”っていう無言の圧力か？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603240ta">
「…………」

この女……いったいなにを考えてるんだ……？
僕を殺しに来たわけじゃないのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_のぞく");
	SoundPlay("SE02", 0, 1000, false);
	DeleteStand("st梨深_制服_通常ビシッ！_hard", 500, true);
	Wait(500);
	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text088]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603250ri">
「ほら、立てる？　立とう！」

悪魔は僕の方に歩み寄り、手を差しのべてきた。

その表情はとても優しそうだ。
しかも、こうして近くで見ると……けっこうかわいい……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603260ta">
「……っ」

くそぅ、バカ丸出しじゃないか、僕は！

悪魔に対してなにが“けっこうかわいい”だ。

こいつは殺人鬼で。
優愛や『将軍』を使って僕を罠にはめようとして。
今、こうして僕を直接殺しに来てるんだぞ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text089]
信じるな……。

もう、優愛のときで懲りている。二度と同じ過ちは犯さない。だから差し出された手を、僕は取らなかった。

この悪魔女の笑顔に、騙されるな。
これは悪魔の誘惑だ。誘惑に負けたら僕は死ぬ。

なにも信じるな。誰の言葉も信じるな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text090]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603270ta">
「だ、だって……み、見たんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603280ta">
「お、おま、お前が……人を、こ、殺してるとこ……」

{	Stand("bu梨深_制服_右向き","hurry", 200, @0);
	FadeStand("bu梨深_制服_右向き_hurry", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603290ri">
//◆苦笑
「あ、あのさ、タク。それかなりひどいこと言ってるって気付いてる？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603300ri">
「まさか殺人犯呼ばわりされるなんてね……たはは……」

僕を、どうするつもりだ……？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603310ta">
「ニュージェネの……」

あの四つの事件みたいに……僕も……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603320ta">
「こ、ろすんでしょ……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603330ta">
「そ、それとも、優愛とか、『将軍』とかがいる、ば、場所に連れてって――」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_右向き_hurry", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603340ri">
「ゆあ？　ショウグン？　誰それ？」

//※禁則処理
３人でよってたかって無抵抗の僕を集団リンチとかする気かもしれない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text091]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603350ta">
「そ、そんなの、い、イヤだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603360ta">
「助けて……」

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603370ri">
「んー、じゃあね、あたしを殺人犯扱いしなければ、助けてあげる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603380ta">
「ひっ……」

や、やっぱりそうだったんだ……！

{	Stand("bu梨深_制服_通常","rage", 200, @0);
	FadeStand("bu梨深_制服_通常_rage", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603390ri">
「って、そんなビビらないでよぉ。いちいちあたしがヘコむようなリアクションしてくれるよね……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603400ta">
「お、お願いだ……もう二度と、誰にも……し、喋らないから……だから、み、見逃して……」

{	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_rage", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603410ri">
「もしもーし、タク！　ちょっと落ち着こう？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text092]
この女、馴れ馴れしくタクって呼びやがって……。

そう言えばどうしてこの女は僕の名前を知ってる？

あの『張り付け』の現場で初めて会ったときから、すでにこの女は僕の名前を知ってた。

どうして？
それに僕のベースの場所もどうして分かった？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text093]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603420ri">
「当然でしょ――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603430ri">
「あなたの名前を知ってるのは」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603440ta">
「！？」

今、心を読まれた！？

やっぱりこの女は千里眼が使えるんだ！
名前や住所を知られたのもその能力を使ったからだ！

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603450ri">
「タクってけっこう独り言多いよね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603460ri">
「――前から思ってたことだけど」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text094]
前から……？　それっていつから？
っていうか、僕は今独り言を言っていたの？

自分ではまったく自覚がない。

ホントに？　ホントのホントに独り言を言ってた？
この女が嘘を言っている可能性は？
心を読まれた可能性は？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);

	SoundPlay("SE01", 1000, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text095]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603470ri">
「タクの名前を知らないわけないよー。
あたし、物覚えはそんなによくない方だけど――」

{	Stand("bu梨深_制服_通常","smile", 200, @0);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603480ri">
「友達の名前くらい、覚えるよ」

友……達……？

{	Stand("bu梨深_制服_通常","rage", 200, @0);
	FadeStand("bu梨深_制服_通常_rage", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603490ri">
「それともタク、あたしのことバカにしてる？
そりゃあたし、テストの点数はそんなによくないけど」

{	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_rage", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603500ri">
「面と向かってそういうこと言われると傷ついちゃうな」

頭がおかしいのか……？
誰の頭が？　僕の？　この女の？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603510ta">
「も、もしかして……て、転校生……？」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603520ri">
「あ、そう言えば近いうちに転校生が来るらしいよ。塚ちんセンセーが言ってた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text096]
会話がかみ合ってない……。

さっきまでの、いつ殺されるか分からないっていう緊張感の入り交じった恐怖は薄れつつあった。

でも、その代わりに薄ら寒くなるような別の種類の恐怖が、心をジワジワと侵食してきている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text097]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603530ri">
「えーっと、もしもしー？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603540ri">
「その顔はまさか、まだ信じてくれてない？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603550ta">
「だ、誰……だ……？」

お前は、誰だ？
こいつは殺人鬼だ。悪魔女だ。

{	Stand("bu梨深_制服_通常","rage", 200, @0);
	FadeStand("bu梨深_制服_通常_rage", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603560ri">
「うわ、タクこそクラスメイトの顔覚えてないんだ。ひどー」

クラスメイトだって……？
友達だけじゃなくて、クラスメイトだっていうのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","hard", 200, @0);
	FadeStand("bu梨深_制服_通常_hard", 300, false);
	DeleteStand("bu梨深_制服_通常_rage", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text098]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603570ri">
「でもまあしょうがないか、タクはあんまり学校来ないもんね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603580ri">
「だからって、あたしの存在まるごとなかったことにするのはどうかと思う」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603590ri">
「ちなみに名前も忘れちゃってるわけかな？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603600ta">
「…………」

{	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, false);
	DeleteStand("bu梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603610ri">
「はいはい、そうなのね～。ショック……」

{	Stand("bu梨深_制服_正面","normal", 200, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603620ri">
「ゴホン。じゃあ思い出させてあげますよ、と」

{	SetVolume360("CH*", 3000, 0, null);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603630ri">
「あたしは――」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_normal", 200, true);}
//おがみ：ルビ入力
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603640ri">
「<RUBY text="さきはた">咲畑</RUBY><RUBY text="りみ">梨深</RUBY>」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603650ta">
「…………」

{	Stand("bu梨深_制服_通常ビシッ！","rage", 200, @0);
	FadeStand("bu梨深_制服_通常ビシッ！_rage", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 200, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603660ri">
「って、リアクションなしかーい！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603670ri">
「サ・キ・ハ・タ・リ・ミ！　思い出した？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603680ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",1000,1000,true);

	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text099]
そんな名前、聞いたことすらない。

そもそも僕に対してこんなに馴れ馴れしく話してくる三次元女なんて、優愛ぐらいしか知り合ったことがない。

そして優愛はこの悪魔女の手下だ。

あ、そうか……！

今まさに目の前で起きている咲畑とかいうこの女のしていることは、優愛のときと同じ手法なんだ。

僕に馴れ馴れしくして、三次元女との付き合いに慣れてない僕をちょっと誘惑しておいて、罠にはめようっていうつもりだ。

そりゃ、クラスメイトの顔なんてさっぱり覚えてないし覚える気もないけど、少なくともこの女の顔は今まで同じ教室で見たことは一度もない……はずだよな。

……ダメだ、断言できない。

なにしろ僕はいつも学校では、始終自分の机に張り付いて、寝たふりをして妄想しているか机の表面をじっと眺めているか教科書を読むフリをしているかのいずれかしかない。

クラスメイトの顔も名前も、まるで覚えてない。覚えようともしなかった。

どっちなんだ？
この女の言っていることはホントなのか、違うのか。

いや、クラスメイトかどうかは問題じゃない。少なくとも厳然たる事実としてあるのは、この女が人殺しということで――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 0, true);
	DeleteStand("bu梨深_制服_通常ビシッ！_rage", 0, true);

	Fade("色１", 500, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text100]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603690ri">
「タク、記憶力ゼロ？　まあいいや……」

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603700ri">
//◆だいちん
「じゃあ、“大ちん”に聞いてみて」

だ、大ちん？
なんだそれ？　人名か？　それともなにかの暗号？　悪魔の呪文――？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603710ri">
「大ちんだよ、大ちん。三住大輔！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603720ta">
「え……！？」

こ、こいつ、三住くんの名前を知ってる……？
しかも大ちんって……よっぽど親しくないとそうは呼ばないぞ……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603730ri">
「というわけで、ハイ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text101]
悪魔女はソファの上に置きっぱなしにされていた僕のケータイをめざとく見つけると、それを拾い上げ、僕の方に差し出してくる。

三住くんに電話してみろ、っていうことらしい。

電話は好きじゃないけど、逆らったら殺されちゃうかもしれない。そんな怯えもあって、僕はやむなく電話をかけようとし……

彼のケータイ番号なんて知らないことに気付いた。

戸惑ったままフリーズしていると、悪魔女はまた首をひねりつつ、僕の横に回り、肩越しにケータイの画面をのぞき込んでくる。

彼女の髪が揺れて、シャンプーのいい香りが僕の鼻先まで漂ってきた。

でもこいつは悪魔だ！　誘惑なんかされるもんか！
僕は三次元に興味はないんだ！
星来たん、僕に力をくれ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text102]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603740ri">
「もしかして番号知らない？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603750ta">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603760ri">
「だったら先にそう言ってくれなきゃ。ゴメンゴメン」

{	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
軽い調子で謝りつつ、悪魔女は僕の手からケータイを引ったくっていった。一瞬触れた指は温かかった。悪魔も人間と同じ血が通っているらしい。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603770ri">
「えーっと、大ちんの番号はねぇ、ほい、ほい、ほいの……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//「ほい」とつぶやきながらボタンを押していく
//ＳＥ//ケータイ操作音
	CreateSE("SE02","SE_日常_けい帯操作");
	SoundPlay("SE02", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text103]
悪魔女は淀みなく番号を押していく。

それはどう見ても、普段かけ慣れている番号のように思えた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603780ri">
「ほーい、繋がった」

笑顔でまたケータイを差し出してくる。

どうしていいか分からないまま、なんとなくそれを受け取り耳に当ててみると、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//電話呼び出し音
	CreateSE("SE02","SE_日常_でんわ_呼びだし音_LOOP");
	SoundPlay("SE02", 0, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text104]
ちょうど呼び出し音が鳴っていた。
やがてすぐにその音は途絶え、代わりに三住くんの声が聞こえてくる。

{	SoundPlay("SE02", 100, 0, false);}
//以下、三住の声は電話の声
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603790mi">
「はい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603800ta">
「あ……」

出た。相手は名乗らない。

どうやら繁華街にいるらしく、周囲の喧噪が受話器を通して聞こえてくる。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603810mi">
「誰？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603820ta">
「…………」

やっぱり、電話は苦手だ。
相手が三住くんなのかどうか、確信が持てない。
彼の声に似ているけど、でも微妙に違うような気もする。

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05603830ri">
「タク、大ちん出た？」

今度は正面から悪魔女が僕の顔をのぞき込んでくる。

くそ、顔が近いんだよ……。

僕は女に背を向けて、覚悟を決めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_通常_normal", 300, false);
	CubeRoom2("ルーム", 100, 0);
	Rotate("ルーム", 0, @0, @-180, @0, Dxl3, false);
	Fade("ルーム", 300, 1000, null, false);
	Rotate("ルーム", 300, @0, @180, @0, Dxl3, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text105]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603840ta">
「に、に、西……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603850mi">
「おお、タクか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603860ta">
「…………」

今の三住くん、妙じゃなかったか？

どうしてそんなに早く僕だって分かった？

僕はまだ“西”までしか名乗ってなかったのに。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603870mi">
「見慣れない番号だったから誰かと思ったぜ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603880mi">
「お前もしかしてケータイ買ったのか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603890ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",1000,1000,true);

	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text106]
例えば悪魔女が僕をはめるために、“三住くんの声によく似た別の誰かのところにかけさせた”可能性もある。

この“三住くんの声に似た誰か”は悪魔女の手下で、三住くんを装って僕を騙そうとしているかもしれない。

悪魔女の方も、僕が三住くんのケータイ番号を知らないことを
あらかじめ分かっていてこういう展開に“誘導”したのかもしれない。

なにもかもが疑わしく思えてくる。
なにが真実で、なにが嘘なのかが、分からない。

そもそも悪魔女はそこまで手の込んだことをしているとして、いったい僕をどんな罠にはめようとしてるんだろう。

この状況なら、悪魔女が僕を直接殺すのが一番手っ取り早いんじゃないのか？

それとも、こんなまだるっこしいことをしてでも“騙さなくちゃいけない”理由があるのか？

//※テキストオーバー
いや、もしかしたら三住くん主導で仕掛けたドッキリのようなものかもしれない。

この女は三住くんのカノジョで、クラスメイトでもなんでもなくて、僕をからかうために三住くんの手によって送り込まれた仕掛け人――

そんなわけないだろ！

だったらあの『張り付け』現場でのことはどう説明する気だよっ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text107]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603900mi">
「で、タク、なんか用か？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603910mi">
「お前から連絡してくるなんて、珍しいこともあるもんだな」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603920mi">
「ま、俺としては野郎からの電話なんてあんま嬉しくねえんだけどな。
ははっ」

口調は完全に三住くんと同じだ。

聞けば聞くほど、電話の向こうの相手は三住くん以外には考えられなくなってくる。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603930mi">
「女の口説き方でも教えてもらいたいのか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603940mi">
「んなわけねーか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603950ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text108]
なんて切り出すべきだろう。
視線を背中に感じる。あの女は、じっと僕を見つめている。

首筋のチリチリとした感覚はいまだ消えない。
悪魔女は、どんな顔をして僕を見ているんだろう。
振り返って、確かめたい。でも、怖くてできない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text109]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603960mi">
「用がねーなら切るぞ。お前の無言電話に付き合ってるほどヒマじゃねーんだ。今、女と一緒だからよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603970ta">
「ま、待っ……！」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05603980mi">
「だから、なんだよ？　用があるなら早く言えって」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05603990ta">
「そ、そのっ、えっ……と……！」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604000mi">
「なんだよ？　早く言えって」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604010ta">
「…………ウ、ウ、ウチの」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604020mi">
「うん？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604030ta">
「クラス……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604040mi">
「ああ、ウチのクラスがどうした？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604050ta">
「い、いる？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604060mi">
「なにが？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604070ta">
「女子……」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604080mi">
「はあ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604090ta">
「サ、サ、サキハタ……って名前の……」

しどろもどろになってなんとか説明する。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604100mi">
「………………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SoundPlay("SE*", 500, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text110]
ふと、三住くんからの返事が途切れた。

沈黙。

でも街の喧噪などの雑音は聞こえてくるから、電話が切れたわけじゃない。
なんで黙るの――？

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604110mi">
「はあああ～～～～」

と、次に聞こえてきたのは盛大なため息だった。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604120mi">
{#TIPS_ゲーム脳 = true;$TIPS_on_ゲーム脳 = true;}
「お前さぁ、<FONT incolor="#88abda" outcolor="BLACK">ゲーム脳</FONT>じゃねえの？」

{$TIPS_on_ゲーム脳 = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604130ta">
「ちょ……」

な、なんだよいきなり……。

しかもゲーム脳って、そんな科学的根拠もないようなトンデモ科学でレッテル貼りかよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	SoundPlay("SE01", 500, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text111]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604140mi">
「一瞬考えちまったよ、サキハタなんて苗字で言うからよー」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604150mi">
「それって梨深のことだろ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604160ta">
「な……」

なんで……

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604170mi">
「お前、いくら三次元の女に興味ねえからって、
あいつのことまで忘れるかぁ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604180mi">
「俺はともかく、お前は１年のときから同じクラスだったろ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604190mi">
「この前だって３人で一緒に映画見に行ったじゃねーか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 500, null, true);

	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE02", 0, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text112]
この“三住くんらしき誰か”の言っていることが理解できない。

悪魔女と僕が、１年生のときから同じクラスだったって？
この前３人で一緒に映画を見に行ったって？

この前……って、いつだ？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text113]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604200mi">
「俺がお前とダチになったのだって、最初は梨深に付き合わされたのがきっかけだったしな」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604210mi">
「俺と同じで梨深も物好きだからよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604220mi">
「ニートのお前を気にかけてやってるのは、世界広しと言えど俺と梨深ぐらいだぜ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604230mi">
「あ、それは言い過ぎか。ははっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604240ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text114]
電話の向こうから聞こえてくる言葉……その単語のひとつひとつにまるでリアルさを感じない。感じるわけがない。一切僕の記憶にはないんだから。

そんな過去があったなんて認めることはできない。

“三住くんらしき誰か”が話しているのは、物語だ。過去じゃない。過去は、記憶に裏打ちされていなくちゃ成り立たないものなんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text115]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604250mi">
「っていうか梨深ってマジで女っ気ないよな。おっと、これはあいつには言うなよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604260ta">
「キミは……誰だ……？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05604270mi">
「おいおい、マジでおかしくなったか？
俺のことまで忘れたわけか。ゲームやり過ぎ――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604280ta">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 500, 0, null);

	Fade("色１", 500, 1000, null, true);
	SoundPlay("SE*", 0, 0, false);

//ＳＥ//ケータイ切る
	CreateSE("SE03","SE_日常_けい帯ボタン押す");
	SoundPlay("SE03", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text116]
耐えられなくなって、僕は一方的に電話を切った。

{	Fade("色１", 2000, 0, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604290ta">
「はあ、はあ、はあっ……」

気が付けば自分がひどく荒い呼吸をしていることに気付く。額からにじみ出る汗はさっきから止まる気配がないどころか、さらに増えている。顎からポタポタと足許にしたたり落ちるほどだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("ルーム", 300, 0, null, true);

	Delete("ルーム");
	Delete("色１");

	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, false);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text361117]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604300ri">
「タク、汗びっしょりだよ？」

悪魔女が、いかにも僕を心配している、という表情をしながら、平然とハンカチを差し出してきた。

朱色がかった、かわいらしい無地のハンカチ。かすかにフローラルな香りがした。

それは受け取らず、なんとか冷静に状況を整理しようとしてみる。でもうまくいかない。疑心暗鬼な感情が渦巻いて混乱してる。

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604310ri">
「で、大ちんはなんて？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",2000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text117]
かすかに残念そうなため息をついてハンカチをしまった悪魔女は、すぐに勝ち誇ったような表情になって聞いてきた。

それは答えを最初から確信している態度だ――

僕はそれに答える余裕はない。

この女がなんなのか。ただのクラスメイトなのか化け物なのか……分からない。

もしかしたら僕の頭の方がオカシイのかもしれない。

『将軍』とのチャットのことも考えると、僕じゃない誰かが僕の身体を操っている可能性も捨てきれない。

あるいはこの悪魔女……咲畑梨深という女との記憶だけが、なんらかのアクシデントですっぽり抜け落ちたことも考えられる。

いずれにせよ、僕は自分が分からない……。

記憶喪失？　夢遊病？　それ以外のなにか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text118]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604320ri">
「大丈夫？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604330ri">
「身体、辛いならソファで横になる？」

悪魔女が優しい言葉をかけてくる。

優しい言葉には気をつけろ。
僕みたいなキモオタに優しくするヤツは、絶対裏があるに決まってる。

僕は悪魔女の言葉に首を振って拒絶の意志を示し、思い切って顔を上げた。
汗が目に入って、視界が滲む。

悪魔女の顔は予想以上に近くにある。
その瞳は、どんな色を含んでる……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text119]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604340ta">
「なんで……」

{	Stand("bu梨深_制服_正面","normal", 200, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604350ri">
「ん？　なになに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604360ta">
「ここにいる……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604370ri">
「ああ、ゴメンね、勝手に入っちゃって」

{	Stand("bu梨深_制服_正面","hard", 200, @0);
	FadeStand("bu梨深_制服_正面_hard", 300, false);
	DeleteStand("bu梨深_制服_正面_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604380ri">
「でも、ノックしてたんだよ？」

{	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, false);
	DeleteStand("bu梨深_制服_正面_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604390ri">
「タクは全然出てきてくれないし、
中でものすごい音が聞こえてくるしで、
けっこうハラハラしてたんだから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604400ta">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604410ta">
「なんで……」

{	Stand("bu梨深_制服_正面","normal", 200, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604420ri">
「ん？　今度はなに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604430ta">
「ここにいる……？」

誰も不法侵入した方法なんて聞いてない。

こいつがここに来た理由はなんだ？
僕を殺しに来たならとっくに実行してるはずなのに、どうしてなにもしない？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流４へ

}


//=============================================================================//

//☆☆☆


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text120]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604440ri">
「ああ、ここに来た理由？　えっとねぇ――」

//おがみ：鞄さぐるSEダミーです
{	DeleteStand("bu梨深_制服_正面_normal", 400, true);
	CreateSE("SE02","SE_じん体_動作_のぞく");
	SoundPlay("SE02", 0, 1000, false);}
悪魔女はカバンの中から……

一枚のプリントを差し出してきた。

{	Stand("bu梨深_制服_通常","normal", 200, @0);
	FadeStand("bu梨深_制服_通常_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604450ri">
「はい」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604460ri">
「進路希望のプリント持ってきてあげたの」

ついそれを受け取ってしまう。
確かに『進路希望調査』と書かれていて、第３希望まで書ける空欄があった。

……ホントに、それだけか？　それだけなのか？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604470ta">
「か、帰って……よ……」

{	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 500, false);
	DeleteStand("bu梨深_制服_通常_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/05604480ri">
//◆ブレス
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text121]
関わりたくない。
三次元女とは関わっちゃいけない。

これは罠だ。

聞く耳を持つな。

こんなの現実じゃないんだ。

ゲームだ。しかもバグだらけの。
だって矛盾が多すぎる。物語として成り立ってない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/lcenter2.png", true);
	DeleteStand("bu梨深_制服_正面_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text122]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05604490ta">
「僕に、関わらないでよ……」

僕を殺すつもりがないなら、そっとしておいてくれ。

僕は僕だ。
僕じゃない僕が咲畑梨深と仲良くしていようが、それは今の僕とは関係ない。

頭を抱えて、心を閉ざした。
咲畑梨深なんていう女はそこにいないんだって夢想しながら震え続けた。

{	CreateSE("SE02","SE_日常_扉_開ける");
	SoundPlay("SE02", 0, 1000, false);}
しばらくすると扉が開く音がして、悪魔女が出ていったことを僕の耳に知らせてくれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 1000, 0, false);

	CreateSE("SE02","SE_日常_扉_閉まる");
	SoundPlay("SE02", 0, 1000, false);

	Wait(4000);
//～～Ｆ・Ｏ

}