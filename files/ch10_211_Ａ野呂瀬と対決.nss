//<continuation number="1300">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_211_Ａ野呂瀬と対決";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		$Ａルート = true;
		Reset();
	}

		ch10_211_Ａ野呂瀬と対決();
}


function ch10_211_Ａ野呂瀬と対決()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


if($GameDebugSelect == 1)
{
	SetChoice02("既に全クリア","まだ全部クリアしてない");
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
			#ClearG=true;
			#ClearPieceR=true;
			#ClearPieceY=true;
			#ClearPieceS=true;
			#ClearPieceK=true;
			#ClearPieceN=true;
			#ClearPieceA=true;
			#ClearRouteB=true;
			#ClearRouteA=true;
			#ClearFinal=true;
			#EndPieceR=true;
			#EndPieceY=true;
			#EndPieceS=true;
			#EndPieceK=true;
			#EndPieceN=true;
			#EndPieceA=true;
			#EndRouteB=true;
			#EndRouteA=true;
			#EndFinal=true;
			$ClearPreAll=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$ClearPreAll=false;
		}
	}
	$GameDebugSelect = 0;
}


//※トンネル抜けて暗いところから明るいところへ抜け出るような演出がここでほしいです

//ＢＧ//白


	CreateColor("上敷き", 100, 0, 0, 1280, 720, "White");

	CreateColor("back11", 200, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 1000, 1000, null, true);

	Delete("back0*");
	Delete("back10");
	Delete("上敷き");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
渋谷駅の東口にある、一棟の古ぼけたビル。

他はことごとく建物の一部、あるいはほとんどが崩壊してしまっていたのに、そこだけは無傷で残っていた。

屋上には、何年か前に閉鎖されたプラネタリウムのドームがあった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

//ＳＥ//プラネタリウムの扉を勢いよく開く
//ＢＧ//ノアⅡ
//ＳＥ//ノアⅡ稼働音

	CreateSE("SE02","SE_日常_ぷらねたりうむ入り口扉開く");
	CreateSE("SE10","SE_擬音_のあII稼働音_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateTexture360("back04", 100, 0, 96, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");

	MusicStart("SE10", 1500, 700, 0, 1000, null, true);
	Fade("back11", 2000, 0, null, true);
	Move("back04", 2000, @0, @-96, AxlDxl, true);

	Delete("back11");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
息も絶え絶えの状態で、無人の階段を最上階まで上り、静まり返ったロビーからプラネタリウム内に入った僕は、目に飛び込んできた巨大な装置に息を呑んだ。

ノアⅡの威容。
身体の体温を奪っていく冷気。
そしてノアⅡの傍らに立てられたオブジェ。

//◆苦しげ
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100010ta">
「梨……深……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(200);

	CreateTextureEX("back05", 200, 0, 0, "cg/ev/ev097_01_1_梨深はりつけ_a.jpg");
	Request("back05", Smoothing);
	Fade("back05", 500, 1000, null, false);
	Move("back05", 6000, 0, -848, Dxl1, 3000);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
そのオブジェに張り付けにされた梨深が、僕の声に気付いてゆっくりと顔を上げる。

目が、逢う。

彼女の目が、見開かれる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("back05", null);

	CreateTextureEX("back06", 200, Center, Middle, "cg/ev/ev097_02_1_梨深はりつけ_a.jpg");

	Fade("back06", 1000, 1000, null, true);

	Fade("back05", 0, 0, null, false);
	Delete("back05");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆驚き
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100020ri">
「どう……して……」

//◆驚き
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100030ri">
「どうして……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100040ta">
「君を……助けに……」

彼女の目が、揺れる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100050ri">
「……バカ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100060ri">
「バカ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100070ri">
「バ……カ、だよ……」

彼女が、悲しそうにかぶりを振る。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100080ri">
「そんな……傷だらけになって……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100090ri">
「そんな……無茶して……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100100ri">
「待っててって……言ったのに……」

//◆泣きそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100110ri">
「なんで……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back05", 100, Center, 0, "cg/ev/ev097_01_1_梨深はりつけ_a.jpg");
	Request("back05", Smoothing);
	Zoom("back05", 0, 1500, 1500, null, true);
	Move("back05", 0, @0, @-736, null, true);

	Move("back05", 700, @0, @-80, Dxl1, false);
	Fade("back06", 1000, 0, null, true);
	Delete("back06");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
好き、だから。
僕は、梨深が、好きだから。

でもそれは口には出さない。

こんな、血まみれで腕も潰されてる僕が“好きだから助けに来ました”なんて言えない。

自分の姿は、白馬の王子にはほど遠い。
そしてきっと、キモいと思われる。
ストーカーと同じじゃないか。

僕が一方的に想いを伝えたって。
梨深は迷惑がるだけだろう。

これからも彼女は生きていく。
これから僕はすぐに死ぬ。

死の間際の人間に勝手に想いを伝えられたって、後味が悪いだけ。

だから僕は、その想いは口には出さず。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100120ta">
「梨深に、これを、返したくて」

{	CreateSE("SE01","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
//朱色のハンカチ＝５章参照
力が入らない右手。
ディソードを握ったままの手。
その指を必死に使って、懐から、一枚のハンカチを取り出す。

その柔らかな朱色は。
元々の色なのか、僕の血に染まってしまったものなのか、分からない。

フローラルな香りも、もうしない。
梨深が、僕にくれたもの。
梨深からもらった、大切な想い出のひとつ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back06", 200, Center, Middle, "cg/ev/ev097_02_1_梨深はりつけ_a.jpg");
	Fade("back06", 500, 1000, null, true);

	Fade("back05", 0, 0, null, false);
	Delete("back05");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100130ta">
「僕は、君を、ここから助け出して」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100140ta">
「ノアⅡを、壊して」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100150ta">
「このハンカチを、返すんだ……」

それが僕にできるすべて。
それさえ果たせたなら、悔いなく消えていける。

それに、それ以外にはもうできそうにない。

さっきからずっと、全身の感覚が麻痺したような錯覚がある。あまりの痛みに、脳がいくつかの神経から伝わる感覚を遮断したのかもしれない。

身体をうまく動かせない。
腕から血は垂れ続け。
目もかすんでいる。

すごく寒い。
気を抜けば意識が飛びそうになる。

//◆嬉しくて泣く
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100160ri">
「タク……」

//◆嬉しくて絞り出すように泣く
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100170ri">
「タク…………っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＳＥ//拍手
	CreateSE("SE02","SE_じん体_拍手_一り");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

	CreateTexture360("back07", 100, Center, 0, "cg/ev/ev097_01_1_梨深はりつけ_a.jpg");
	Request("back07", Smoothing);
	Zoom("back07", 0, 1500, 1500, null, true);
	Move("back07", 0, @0, @-1120, null, true);
	Fade("back07", 0, 1000, null, true);
	Fade("back06", 500, 0, null, true);
	Delete("back06");

	Stand("st玄一_スーツ_通常","normal", 400, @+200);
	FadeStand("st玄一_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100180nr">
「君は実に勇敢ですね」

ノアⅡの陰から現れたのは、長身の男――野呂瀬玄一。
僕に向かって、無表情のまま白々しく手を叩く。

{	SetVolume("SE02", 0, 0, NULL);}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100190nr">
「しかし、致命的なことがひとつあります」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100200nr">
「行動原理が感情に根ざしている、ということです。それは野蛮人のすることだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100210ta">
「…………」

この男の言葉を、よく理解できない。

痛みを受け止め処理するのに必死で、相手の――梨深以外の人間の――発言の意味を理解する余裕はない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100220ri">
「タク、逃げて……」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100230nr">
「小を犠牲にして、大の利益を守る」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100240nr">
「それを悪だと思いますか？」

{	Stand("st玄一_スーツ_通常","hard", 400, @+200);
	FadeStand("st玄一_スーツ_通常_hard", 300, true);
	DeleteStand("st玄一_スーツ_通常_normal", 0, true);}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100250nr">
「私はそうは思いません」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100260nr">
「このままでは、人類はいずれ滅び去る」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100270nr">
「人の欲望によって、です」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100280nr">
「あまりにも醜い心」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100290nr">
「あまりに利己的な欲望の洪水」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100300nr">
「人の社会は、すでに破綻し、腐り落ちようとしています」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100310nr">
「誰もが、己のことしか考えず、その結果殺し合い、奪い合っています」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100320nr">
「君もギガロマニアックスとして覚醒したのなら、見たはずですよ。人の心の本質を」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100330nr">
「私は幼い頃に覚醒したため、もう何十年という間、それを見てきた」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100340nr">
「３００人委員会は、人類の自滅を阻止するためという大義名分の元、世界人間牧場計画を推し進めてきました」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100350nr">
「けれどそれも所詮、彼らのエゴを満たすものでしかない」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100360nr">
「私が目指すのはそんなものではありません」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100370nr">
「悟ったのですよ」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100380nr">
「この腐った世界を再生するためには、社会のシステムを変えるのではなく――」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100390nr">
「世界中すべての人間の“心”を変える必要があるのだ、と」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100400nr">
「そのための、プロジェクト・ノアです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100410nr">
「ノアⅡがあれば、世界中すべての人間から負の妄想を消し去り、清廉な心へと漂白できます」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100420nr">
「争いは消え、世界に永遠の平和を与えることができます」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100430nr">
「君も、誰かに蔑まれることもなくなるでしょう」

長ったらしい演説が、ようやく終わった。
自分の身体が倒れそうになり、必死で踏ん張る。
少し、休めた。おかげで、助かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//◆息も絶え絶え
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100440ta">
「あんたの……言ってることは、もしかしたら……正しい……かもしれない」

よくは聞いてなかったけど。
人間の未来のことを考えたら、きっと正しいんだろう。
すごく立派な考え方だと思うよ。

野呂瀬は大企業の社長で、人類全体のことを考えている正義の人。

僕は化け物で、童貞で、キモオタで、好きな女の子ひとりだけを助けようとしてる、自分勝手でエゴ丸出しの男だ。

普通だったら、完全に僕が悪役。化け物は倒されて、正義は勝つ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100450ta">
「でも――」

//◆息も絶え絶え
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100460ta">
「僕は……あんたには負けられない……」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100470nr">
「なぜ否定するのです？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100480ta">
「ただの、自己、満足だ……！」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100490nr">
「残念です――」

{	DeleteStand("st玄一_スーツ_通常_hard", 400, true);}
野呂瀬は僕を見据えたまま、梨深の胸ぐらをつかむようにして“オブジェ”から引きずり下ろした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//人が倒れる音
	CreateSE("SE02","SE_衝撃_どさっ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateTexture360("下敷き", 10, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");

	Shake("back07", 500, 10, 10, 0, 0, 500, null, false);
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("back07", 500, 0, null, true);
	Delete("back07");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//◆痛そうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100500ri">
「あぅ……っ」

そしてオブジェの前で、右手を横へ伸ばす。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("剣アップ", 200, 0, 96, "cg/bg/bg246_01_6_chnディソード全体_野呂瀬_a.png");
	CreateSE("SE03","SE_衝撃_衝撃は_リアルぶーと");

	CreateColor("back10", 500, 0, 0, 1280, 720, "White");
	Request("back10", Smoothing);
	Fade("back10", 0, 0, null, true);

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Rotate("剣アップ", 1000, @0, @0, @360, Axl3,false);
	Zoom("剣アップ", 1000, 2200, 2200, Axl3, false);
	Fade("剣アップ", 500, 1000, null, true);
	Fade("back10", 500, 1000, null, true);
	CreateTexture360("back05", 200, 0, 0, "cg/ev/ev098_01_1_野呂瀬ディソード_a.jpg");
	CreateTexture360("blur", 300, 0, 0, "cg/ev/ev098_01_1_野呂瀬ディソード_a.jpg");
	Request("blur", Smoothing);
	SetBlur("blur", true, 3, 300, 50);
	Fade("blur", 0, 500, null, true);
	Zoom("blur", 0, 1200, 1200, null, true);
	Zoom("blur", 2000, 950, 950, Dxl1, false);
	Fade("back10", 200, 0, null, true);
	WaitAction("blur", null);
	Zoom("blur", 300, 1500, 1500, Dxl1, false);
	Fade("blur", 300, 0, null, true);
	Delete("blur");
	Delete("back10");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text800]
刹那――

立てられていたはずのオブジェが、野呂瀬の手に装着されていた。

それはオブジェなんかじゃなく。
ましてや磔のための十字架なんかでもなく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH10", 1000, 1000, true);

	CreateSE("SE07","SE_擬音_共鳴音_女性悲鳴のよう");
	MusicStart("SE07", 0, 1000, 0, 1000, null, false);
	CreateColor("Black", 500, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 700, null, false);
	DrawTransition("Black", 500, 0, 1000, 500, null, "cg/data/爆発.png", false);
	Fade("Black", 1500, 0, null, true);
	Delete("Black");

	CreateTextureEX("剣アップ", 250, 0, 0, "cg/bg/bg246_01_6_chnディソード全体_野呂瀬_a.png");
	CreateTextureEX("剣アップ背景", 220, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
	Move("剣アップ", 4000, @0, @48, null, false);
	Move("剣アップ背景", 4000, @0, @24, null, false);
	Fade("剣アップ", 1000, 1000, null, false);
	Fade("剣アップ背景", 1000, 1000, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601800]
ディソード。

剣と呼ぶには、あまりにも巨大で。

残虐で。

冷たく。

恐怖を振りまくもの。

汚染された福音。

錯雑とした混沌。

蹂躙する冒涜。

清浄なる邪悪。

見た者の心を奪い、永久に終わらない苦悶の輪環へ誘う、さながら地獄への門。

この世の負をすべてひとつに混ぜ合わせ、体現した姿。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("剣アップ*", 500, 0, null, true);
	Delete("剣アップ*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602800]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100510ta">
「…………」

僕はゴクリと息をひとつ呑み。
それでも、覚悟を決めて。
紐で固定したディソードを持ち直し。

{	CreateSE("SE01","SE_擬音_ちを蹴る");
	MusicStart("SE01", 0, 300, 0, 1000, null, false);}
ノアⅡへ向け、一歩を踏み出す。

それはすなわち、野呂瀬との距離を詰めるということ。

間合いの広さで言えば、圧倒的に向こうに分がある。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100520nr">
「剣で斬り合うような野蛮な行為は、あまり得意ではないのですがね」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100530nr">
「しかし、君からＣＯＤＥサンプルを手に入れる必要があります。そのために、無力化しなければね」

長身の野呂瀬が、自らの身の丈よりはるかに巨大なディソードを片手で振り回してきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_ディそーど1");
	CreateColor("back10", 200, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, true);
	Fade("back10", 300, 1000, null, true);

	CreateMovie360("ムービー", 500, Center, Middle, false, false, "dx/mv軌跡01.avi");
	Fade("ムービー", 0, 0, null, true);
	Rotate("ムービー", 1, @0, @0, @180, null, true);

//ＳＥ//ディソードを振る
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Fade("ムービー", 0, 1000, null, true);

	Delete("back05");

	WaitAction("ムービー", null);
	Delete("ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
それは、いかなるものをも粉砕するかのような、重量感に満ちた一撃。

腕はすぐに反応してくれない。
力を込めるだけで、痛みが走る。
それでも無理矢理、その腕を上げ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, true);

//ＳＥ//剣戟
	CreateSE("SE03","SE_擬音_ディそーど同士ぶつかる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Fade("色１", 100, 1000, null, true);
	Stand("bu玄一_スーツ_武器構え","pride", 200, @-50);
	Delete("back10");
	FadeStand("bu玄一_スーツ_武器構え_pride", 0, false);
	Fade("色１", 300, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
ディソードで受け止める。

普通の剣だったらそれで真っ二つに折れてしまっていただろう。

ましてや僕のディソードは、ひどく細く。
野呂瀬の剣とはあまりに対照的。

でも。
ディソードは折れず。
野呂瀬の第一撃を、なんとか受け流す。

{	CreateSE("SE05","SE_擬音_ちを蹴る");
	MusicStart("SE05", 0, 300, 0, 1000, null, false);
	CreateSE("SE06","SE_衝撃_どさっ");
	MusicStart("SE06", 0, 300, 0, 1000, null, false);}
手が痺れる。
左手がないから、うまくバランスを取れない。
姿勢が崩れる。

{	CreateSE("SE07","SE_擬音_ディそーどかまえる");
	MusicStart("SE07", 0, 1000, 0, 1000, null, false);}
吹っ飛ばされそうになる。
それに耐え――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	DeleteStand("bu玄一_スーツ_武器構え_pride", 300, true);

	CreateColor("back11", 500, 0, 0, 1280, 720, "WHITE");
	Request("back11", AddRender);
	Fade("back11", 0, 0, null, true);

	CreateMovie360("ムービー", 1000, Center, Middle, false, false, "dx/mv軌跡01.avi");
	Rotate("ムービー", 0, @0, @0, @0, null, true);

//ＳＥ//剣戟
	CreateSE("SE02","SE_擬音_ディそーど1");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//	Request("ムービー", Play);
	Fade("back11", 0, 1000, null, true);

	WaitAction("ムービー", null);

	Stand("bu玄一_スーツ_武器構え","pride", 200, @-50);
	FadeStand("bu玄一_スーツ_武器構え_pride", 0, true);

	Delete("ムービー");
	CreateSE("SE03","SE_擬音_ディそーど同士ぶつかる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	FadeDelete("back11", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
野呂瀬の第二撃と打ち合う。
ヤツの切り返しはあまりに早い。

剣の見た目に惑わされるな。
そう自分に言い聞かせる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu玄一_スーツ_武器構え_pride", 300, true);

	Stand("st玄一_スーツ_武器構え","pride", 200, @-250);
	CreateColor("back11", 500, 0, 0, 1280, 720, "WHITE");
	Request("back11", AddRender);
	Fade("back11", 0, 0, null, true);

	CreateSE("SE02","SE_擬音_ディそーど1");
	CreateSE("SE03","SE_擬音_ディそーど同士ぶつかる");

	CreateMovie360("ムービー", 1000, Center, Middle, false, false, "dx/mv軌跡01.avi");
	Rotate("ムービー", 0, @0, @0, @180, null, true);

//ＳＥ//剣戟
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//	Request("ムービー", Play);

	Fade("back11", 0, 1000, null, true);

	FadeStand("st玄一_スーツ_武器構え_pride", 0, true);
	WaitAction("ムービー", null);

	Delete("ムービー");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	FadeDelete("back11", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
力勝負。
あまりにも細く繊細なる剣と。
あまりにも巨大で凶暴なる剣。

なんとか、やり合えている。
あくまでも、今は。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("st玄一_スーツ_武器構え_pride", 200, true);
	Stand("bu玄一_スーツ_武器構え","hard", 200, @-50);
	FadeStand("bu玄一_スーツ_武器構え_hard", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
//◆気合
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100540nr">
「――っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//	CreateTexture360("blur", 500, center, middle, "SCREEN");
//	CreateTexture360("dwon", 400, center, middle, "SCREEN");

	DeleteStand("bu玄一_スーツ_武器構え_hard", 200, true);

//おがみ：↓描画バグの修正追加用　上手くいくなら後で消す
	CreateTextureEX("blur", 500, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
	Request("blur", Smoothing);
	SetBlur("blur", true, 3, 400, 50);
	Fade("blur", 500, 500, Dxl1, false);
	Move("blur", 300, @-80, @0, Dxl2, false);
	Zoom("blur", 300, 1500, 1500, Dxl2, false);
	Fade("blur", 300, 1000, Dxl2, true);
	WaitAction("blur", null);

//ＳＥ//剣戟
	CreateSE("SE02","SE_擬音_ディそーど1");
	CreateSE("SE03","SE_擬音_ディそーど同士ぶつかる");

	CreateTextureEX("back13", 100, 0, 0, "cg/ev/ev106_01_1_剣交え_a.jpg");

//ＳＥ//剣戟
	CreateMovie360("ムービー", 1000, Center, Middle, false, false, "dx/mv軌跡01.avi");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//	Request("ムービー", Play);

	Delete("blur");
	Delete("dwon");
	CreateColor("back11", 500, 0, 0, 1280, 720, "WHITE");
	Request("back11", AddRender);
	Fade("back11", 0, 1000, null, true);


	Fade("back13", 0, 1000, null, true);

	Fade("ムービー", 1500, 0, null, true);

	Delete("ムービー");

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Shake("back13", 500, 0, 8, 0, 0, 500, null, false);
	FadeDelete("back11", 300, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
４度。
斬り結び。
野呂瀬の手の動きが変化する。

剣のグリップ部分を握りしめたように見えた。

ヤツのディソードが。
蠢動する。
{	CreateSE("SE09","SE_日常_スクーター_倒れる");
	MusicStart("SE09", 0, 1000, 0, 1000, null, false);}
不気味な音を立て、可変機構がうなる。

刃の先端がはさみのように開き。
僕の胸へ向けて突き上げてくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100550ta">
「……！」

その変化が。
自分にとって致命的なものになると悟る。

{	CreateColor("back11", 200, 0, 0, 1280, 720, "WHITE");
	Fade("back11", 0, 0, null, false);
	Request("back11", AddRender);
	Fade("back11", 500, 200, null, true);
	CreateSE("SE03","SE_擬音_ディそーど_空を切る2");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
対抗。
僕は、剣を正面から振り下ろす。

でも遅かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH10", 0, 0, NULL);

	CreateSE("SE02","SE_擬音_ディそーど1");
	CreateSE("SE03","SE_じん体_血_噴きでる");

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");

	CreateMovie360("ムービー", 500, Center, Middle, false, false, "dx/mvやられ01.avi");

//ＳＥ//ディソードを振る
//ＳＥ//肉を抉る
//ＳＥ//血が噴き出す
//	Request("ムービー", Play);

	Delete("back13");
	Delete("back11");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Fade("back03", 0, 1000, null, true);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);


	Fade("ムービー", 1500, 0, null, true);
	Delete("ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
胸に突き刺さる、二叉の切っ先。

{	Stand("st玄一_スーツ_武器構え","pride", 200, @-400);
	FadeStand("st玄一_スーツ_武器構え_pride", 300, true);}
//◆ニヤリとしてブレス
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100560nr">
「…………」

野呂瀬の口許に、残虐なる笑み。
手のグリップを緩め。

巨大なはさみがその口を締める。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("back11", 500, 0, 0, 1280, 720, "RED");
	Request("back11", AddRender);
	Fade("back11", 0, 0, null, false);

//ＳＥ//肉を抉る
	CreateSE("SE03","SE_じん体_動作_と血");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Fade("back11", 100, 1000, null, true);
	FadeDelete("back11", 200, true);

	Shake("back03", 100, 10, 10, 0, 0, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//◆苦痛の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100570ta">
「が……っ！」

僕の胸を。
肋骨ごと。
肺ごと。

食いちぎる。

{	CreateSE("SE03","SE_擬音_ちを蹴る");
	MusicStart("SE03", 0, 500, 0, 1000, null, false);}
必死で、一歩後ずさる。

{	DeleteStand("st玄一_スーツ_武器構え_pride", 200, true);}
//◆気合い
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100580nr">
「――っ」

野呂瀬はさらに、そのまま腕を横へ払った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,1);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_ディそーど1");
	CreateSE("SE04","SE_じん体_血_噴きでる");

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("色１", 500, 0, 0, 1280, 720, "RED");
	DrawTransition("色１", 500, 300, 1000, 500, null, "cg/data/zoom1.png", true);
	FadeDelete("色１", 500, true);

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "RED");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
鮮血が僕の眼前を舞う。
痛みが全身を突き抜ける。

感覚は麻痺しかけていたはずなのに。
絶叫しそうなほど。
歯を食いしばり、耐える。

かき回され、ミンチ状になった胸。
後ろに下がってなければ、心臓までやられていた。
血が大量にぶちまかれ。

{	Fade("攻撃フラッシュ", 0, 1000, null, true);
	Fade("攻撃フラッシュ", 500, 0, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100590ta">
「ぐ……ぎ――！」

倒れかけ。
踏ん張る。

――死ねない。

ここまで来て、死ねるもんか……！

野呂瀬は無視。
ノアⅡ――そして倒れている梨深に向かって、必死で進む。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100600ri">
「タク……」

横たわった梨深が、頭だけをわずかにもたげ、僕を見上げてくる。

衰弱しているんだろうか。
身体に力が入らないんだろうか。

疲労――あるいは怪我のせいで、視界がはっきりしない。梨深がどんな顔をして僕を見ているのか分からない。

僕はその梨深と視線を合わせられなかった。

こんな、血まみれで、やられまくりの姿を見られたくない。

ちっぽけな自尊心。
どうせ死ぬのに、そんなことにこだわってしまう。

僕はさらにノアⅡへ歩を進める。
すでにディソードの間合い。
背後の野呂瀬は、不思議なことに追ってこない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＳＥ//「通りゃんせ」が鳴り響く（以下続く）
//ＳＥ//ノアⅡ稼働音がさらに甲高くなる
//※“通りゃんせ”はノアⅡ稼働警告音です。周囲の人たちに「稼働します。ご注意ください」と警告する為のもの
	CreateSE("SE11","SE_はいけい_通りゃんせ_LOOP");
	MusicStart("SE11", 0, 1000, 0, 1000, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
と、ドーム内に突如として呑気なメロディが流れ出す。

“通りゃんせ”

目の前にそびえ立つノアⅡ。そこから響く音が、甲高くなる。

この威容の中で、なにかが動き出している、得体の知れない気配。

一瞬、ひるんだけど。
僕はゆっくりと腰溜めに構え。
ノアⅡの、有機的にさえ見える、チューブだらけの表面に向けて。

ディソードをなぎ払った――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ディソードを振る
	CreateSE("SE03","SE_擬音_ディそーど_空を切る1");

	CreateMovie360("ムービー", 1000, Center, Middle, false, false, "dx/mv軌跡01.avi");

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//	Request("ムービー", Play);


	WaitAction("ムービー", null);

	Stand("st玄一_スーツ_武器構え","pride", 200, @-400);
	FadeStand("st玄一_スーツ_武器構え_pride", 1, true);

	Delete("ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
ふと気付く。
いつの間にか、視界からノアⅡが消えていた。
なぜか、ノアⅡに背中を向けて立っている。

確かに壊そうとしたはずだった。
身体を回転させた気はまったくなかった。

でも、後ろを向いていた。

正面に立つ野呂瀬の姿が、ノアⅡの代わりに僕のぼやけた視界の中央に見えている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("st玄一_スーツ_武器構え_pride", 300, true);

//ＳＥ//ディソードを振る
	CreateSE("SE03","SE_擬音_ディそーど_空を切る1");
	Stand("st玄一_スーツ_武器構え","pride", 200, @-400);

	CreateMovie360("ムービー", 500, Center, Middle, false, false, "dx/mv軌跡01.avi");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
//	Request("ムービー", Play);
	FadeStand("st玄一_スーツ_武器構え_pride", 1, true);
	WaitAction("ムービー", null);
	Delete("ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601020]
僕は振り返りざまに、もう一度ディソードを振るう。

けれど、振り返ったつもりが、振り返っていなかった。

振り返る意志はある。
振り返る動作もした。
でも結果は、振り返っていなかった。

混乱する。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100610nr">
「ノアⅡの自己防衛機能、とでも言うべきものです」

野呂瀬の静かな声が、ドーム内に響く。
“通りゃんせ”のメロディと混ざり合う。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100620nr">
「近づく者の心に干渉し、意志を歪ませる」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100630nr">
「ノアⅡには、誰も近寄れません。私以外は」

言い終えて。
野呂瀬が優雅な足取りで、僕へと迫ってくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	DeleteStand("st玄一_スーツ_武器構え_pride", 500, true);
	Stand("bu玄一_スーツ_武器構え","pride", 200, @-50);
	FadeStand("bu玄一_スーツ_武器構え_pride", 500, true);
	CreateSE("SE05","SE_擬音_ディそーど_空を切る1");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602020]
その手の巨大なディソードを、悠々と振り上げる。

僕は歯噛みする。
血が足りない。
よく思考が働かない。

それでも、感覚がほとんどない右手を。
痛みでまともに動かない右手を。
必死に持ち上げ、次の一撃に備える。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//ＳＥ//剣戟
//ＳＥ//ディソードが床を転がっていく
	CreateSE("SE02","SE_擬音_ディそーど2");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Wait(1000);
	Fade("色１", 100, 1000, null, true);
	DeleteStand("bu玄一_スーツ_武器構え_pride", 0, true);
	CreateSE("SE03","SE_擬音_ディそーど同士ぶつかる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Wait(500);
	CreateSE("SE04","SE_衝撃_杭_落ちる_壁");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	Fade("色１", 500, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
紐だけでなんとか手に固定していたディソードが、ものすごい衝撃を受けて弾き飛ばされていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//青信号が点滅すると鳴り出す警告音「ピーポーピーポー」

	SetVolume("SE11", 1000, 0, null);
	CreateSE("SE12","SE_はいけい_点滅ぴーポー_LOOP");
	MusicStart("SE12", 1000, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
床の上を、転がっていく。
僕から、離れていく。

それを愕然として見送り。
{	Stand("st玄一_スーツ_武器構え","pride", 200, @-300);
	FadeStand("st玄一_スーツ_武器構え_pride", 300, false);}
視線を戻せば、目の前に。
嘲笑する、野呂瀬の姿。

メロディが、変わっていた。
なにかを警告するような。
心を急き立てられるような。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100640nr">
「君の存在を、否定してあげましょう」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//※ここから野呂瀬による妄想攻撃に入ってます
//ＳＥ//警告音終了　


	SetVolume360("SE12", 200, 0, null);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
野呂瀬はすでに次の攻撃の姿勢に入っている。
振り下ろされようとしている。

あまりにも圧倒的な。
あまりにも破壊的な。
あまりにも凶悪な。

その、ディソードを。

対して僕は丸腰。
その一撃を防ぐ手だてはなく。
棒立ちになる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","hard", 250, @0);
	CreateSE("SE02","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE02", 0, 700, 0, 1000, null, false);
	FadeStand("bu梨深_制服_正面_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601023]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100650ri">
「ダメっ！」

梨深が、僕と野呂瀬の間に割って入った。
柔らかい感触が、僕の顔を包む。

{	Stand("bu梨深_制服_正面","sad", 250, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, true);
	DeleteStand("bu梨深_制服_正面_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100660ri">
「タクを、殺さないで……っ」

梨深の胸。
梨深が、僕の身体を包むように抱きしめ。
野呂瀬から、かばってくれた。

{	Stand("st玄一_スーツ_武器構え","hard", 200, @-300);
	FadeStand("st玄一_スーツ_武器構え_hard", 300, true);
	DeleteStand("st玄一_スーツ_武器構え_pride", 0, true);}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100670nr">
「…………」

{	DeleteStand("st玄一_スーツ_武器構え_hard", 300, true);}
野呂瀬は小さく息をつくと、剣を下ろす。

僕は、また梨深に助けられた。
助けに来たって言うのに。
なんて、情けないんだ。

悔しくて、僕は。
梨深のブラウスの、ボタンとボタンの隙間へ。
右手を差し込む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH06",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
//◆戸惑い
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100680ri">
「……タク？」

{	CreateSE("SE03","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
彼女が身に付けている下着の、少しザラザラして、あったかい肌触り。

胸の、抉られた傷の痛みも。
左手の、切断された痛みも。
右手の、肩が抜けた痛みも。

肺をやられて、まともに呼吸できない苦しみも。

そうした苦痛のすべてを癒してくれるかのような、温もり。

梨深の、下着。
梨深の、素肌。

//◆戸惑い
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100690ri">
「な……にを……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100700ta">
「はあ、はあ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_正面_sad", 300, false);

//ＳＥ//服が破れる
	CreateSE("SE02","SE_擬音_服がやぶれる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
ブラウスのボタンを、引きちぎる。
彼女の身体を隠している服を、引き裂く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_衝撃_せ中を押される");
	MusicStart("SE03", 0, 700, 0, 1000, null, false);
	Wait(300);
	CreateSE("SE04","SE_衝撃_どさっ");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 500, 0, 0, "cg/ev/ev099_01_1_梨深レイプ_a.jpg");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601025]
露わになる、下着。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100710ri">
「タク、やめ……」

{	CreateSE("SE02","SE_じん体_掴む");
	MusicStart("SE02", 0, 600, 0, 1000, null, false);}
わしづかみにする。
下着越しに。
その、豊かな胸を。

//◆「いたっ」
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100720ri">
「痛っ……」

血にまみれた、右手で。
下着に。梨深の柔肌に。赤い血をこすりつけるようにして。

弾力が、伝わってくる。
なんて、柔らかい……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100730ri">
「いやっ……！」

{	CreateSE("SE02","SE_じん体_動作_のぞく");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
梨深が身をよじらせ、逃げようとする。
僕はその梨深の身体にしがみつく。
離さない。

{	CreateSE("SE03","SE_衝撃_どさっ");
	MusicStart("SE03", 0, 500, 0, 1000, null, false);}
胸に、顔を埋める。
ぴったりと吸い付くような、すべすべした肌。
{	CreateSE("SE04","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}
さらに、自由になった右手で彼女のスカートの中をまさぐる。

//◆悲しくて泣く
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100740ri">
「やめて……やめ、てよ……タク……」

//◆悲しくて泣く
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100750ri">
「こんなの……イヤだよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateBG(100, 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");

	CreateSE("SE01","SE_じん体_動作_手_梨深を振り払う");
	MusicStart("SE01",0,1000,0,1000,null,false);


	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
ハッとして、僕は梨深から身体を離した。
自分のしようとしていたことを自覚し、愕然となる。

//◆悲しくて泣く
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100760ri">
「う……ぐすっ……うう……」

僕が離れても、梨深は胸元を手で隠して、悲しそうに泣き続けた。

僕を、かばってくれたのに。
なんで、僕はこんなことを……。

こんなときに、なにをやってるんだ……。
どうして、僕が、梨深を泣かせてるんだ……。

{	CreateTextureEX("口元１", 600, 0, 0, "cg/ev/ev013_01_1_拓巳笑い口UP_a.jpg");
	Fade("口元１", 0, 300, null, true);}
//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100770ta">
「ホントは咲畑梨深を犯したいんでしょ？」

{	Fade("口元１", 300, 0, null, true);
	Delete("口元１");}
僕の声が、心の中に響いた。
ギクリとして、息を呑む。

どうしてギクリとした？
確信を突かれたから？

見透かされたから？
誰に？

僕の声。
心の声。
僕の……本性？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("口元１", 600, 0, 0, "cg/ev/ev013_01_1_拓巳笑い口UP_a.jpg");
	Fade("口元１", 0, 600, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100780ta">
「ここでモノにしておかないと、『将軍』に寝取られちゃうよ」

//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100790ta">
「あんなしわくちゃ野郎に、梨深はヤられちゃうんだよ？」

//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100800ta">
「寝取られるなんてイヤじゃね？」

{	CreateTextureEX("口元２", 600, 0, 0, "cg/ev/ev013_03_1_拓巳笑い口UP_a.jpg");
	Fade("口元１", 300, 0, null, false);
	Fade("口元２", 300, 600, null, true);
	Delete("口元１");}
//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100810ta">
「まあ、もうすでにヤられちゃってる可能性もあるけどさ」

{	Fade("口元２", 300, 0, null, true);
	Delete("口元２");}
僕の本性が、ささやいてくる。
やめてくれ。そんなこと言うな。
僕はそんなこと思ってないんだ。

耳を塞ぎたくても、左手がないからそれができない。

乱れた着衣を直すこともできず泣いている梨深。その顔を見て、心が潰されるような痛みを覚える。

{	CreateTextureEX("口元１", 600, 0, 0, "cg/ev/ev013_03_1_拓巳笑い口UP_a.jpg");
	Fade("口元１", 300, 600, null, true);}
//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100820ta">
「片想いでいいとか、きれい事言ってないでさあ」

{	CreateTextureEX("口元２", 600, 0, 0, "cg/ev/ev013_02_1_拓巳笑い口UP_a.jpg");
	Fade("口元１", 300, 0, null, false);
	Fade("口元２", 300, 600, null, true);
	Delete("口元１");}
//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100830ta">
「犯しちゃえって」

//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100840ta">
「野呂瀬はそれをする時間ぐらい待ってくれるってよ」

//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100850ta">
「どうせ僕はもうすぐ死ぬんだ。恨まれたって、屁でもないって」

//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100860ta">
「やりたいことやって死のうよ。僕のこのかわいそうな境遇なら、ここでちょっとひどいことやったって“しょうがなかった”で許されるよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("口元２", 300, 0, null, true);
	Delete("口元２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
これは僕の妄想だ。
僕の悪い癖だ。

だから聞かないようにしないとまずい。
流されかねない。

僕の弱い心が、僕を悪い方へと、楽な方へと誘導しようとする。
でも今は、流されちゃダメなんだ……。

{	CreateTextureEX("口元１", 600, 0, 0, "cg/ev/ev013_01_1_拓巳笑い口UP_a.jpg");
	Request("口元１", Smoothing);
	SetBlur("口元１", true, 3, 100, 50);
	Fade("口元１", 300, 600, null, true);}
//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100870ta">
「それに梨深は僕に同情してくれてた。それなら、むしろヤらしてくれるべきだ」

//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100880ta">
「犯せよ。死ぬ前に童貞捨てようよ」

{	Zoom("口元１", 300, 2000, 2000, null, false);
	Fade("口元１", 300, 0, null, false);}
//◆以下は現実の拓巳の声
{	SetVolume360("CH06", 2000, 0, NULL);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100890ta">
「ダメだ……！」

叫ぶ。
弱い心を打ち破るように。
吹き飛ばしてしまえるように。

幸い、それで心の声は消えてくれた。
目の前の梨深も、泣きやんでいた。

顔を覆っていた手を下ろし。
冷めた目で僕を一瞥してくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","lost", 200, @0);
	FadeStand("bu梨深_制服_正面_lost", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601028]
//◆冷たく
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21100900ri">
「つまんない男……」

その一言で、僕の頭の中がどす黒い感情で埋まり。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100910ta">
「あ、あああああ――」

梨深に襲いかかろうとしたら――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Delete("口元１");
	DeleteStand("bu梨深_制服_正面_lost", 0, false);

//ＳＥ//太い杭が拓巳に突き刺さる
	CreateSE("SE01","SE_衝撃_巨大杭_突きやぶる");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateColor("色１", 1200, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	CreateTexture360("fader00", 1000, 0, 0, "cg/ev/ev108_02_1_串刺し_a.jpg");
	CreateTextureEX("fader02", 1000, 0, 0, "cg/ev/ev108_02_1_串刺し_a.jpg");
	Fade("fader02", 0, 1000, null, true);
	Shake("fader02", 500, 20, 0, 0, 0, 500, null, false);

	FadeDelete("色１", 200, true);

	CreateTextureEX("fader01", 1500, 0, 0, "cg/ev/ev108_01_1_串刺し_a.jpg");
	Request("fader01", Smoothing);
	SetAlias("fader01", "fader01");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100920ta">
「はぐっ……！？」

ものすごい勢いで、床のコンクリートを巨大な杭が突き破ってきた。

その杭の先端は尖っていて。
僕の股に突き刺さる。

{	BGMPlay360("CH26", 1000, 1000, true);
	CreateProcess("プロセス１", 1000, 0, 0, "Fader1");
	Request("プロセス１", Start);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100930ta">
「あ……ぐ……？」

状況が呑み込めない。

足が宙に浮く。

逃れたくてもできない。

{	CreateSE("SE01","SE_擬音_肉手を突っ込む");
	MusicStart("SE01",0,1000,0,1000,null,false);}
杭はどんどん僕の体内に食い込んでくる。

すさまじい痛み。
でも死ぬほどじゃない。

なおも杭は伸びて、僕は１メートルほどの高さにまで持ち上げられる。

動けば、股間に痛みが走る。
身動きが取れなくなる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21100940ta">
「あ、あ……」

助けてほしい。
懇願の目を、眼下の梨深へと送る。

でも彼女は、僕を見ようともせず、野呂瀬の元へ歩いていってしまう。
そして、力尽きたようにペタンとしゃがみ込む。

野呂瀬も、梨深も。
僕のこの醜態を、眺めている。

ただ、無表情に、眺めているだけ。
助けようとはしてくれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100950nr">
「知っていますか？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100960nr">
「かつて拷問刑として串刺しは世界中のあちこちで用いられていました」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100970nr">
「この拷問の特徴は」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100980nr">
「死ぬまで３日ほどかかる、ということです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21100990nr">
「自らの体重によって、徐々にその杭は身体に食い込んでいく。ポイントは、杭の先端はそれほど尖らせないことです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101000nr">
「それにより、臓器を傷つけることがなくなり、死ぬまでの期間が伸びるわけです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101010nr">
「最終的に、杭の先端が口や肩から突き破れば、処刑は終了」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101020nr">
「見守っていてあげますよ。３日間」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101030nr">
「あなたが死ぬまでね」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101040nr">
「彼女も、同じ考えのようですし」

梨深が、こくりとうなずく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text031]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101050nr">
「もっとも、その前に胸や腕の傷のせいで、失血死に至る方が早いかもしれませんが」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21101060ta">
「…………」

これは妄想だ。妄想による攻撃だ。
そう自分に言い聞かせた。

実際の僕は、串刺しになんてされていない。
ただノアⅡを前にして立ち尽くしているだけだ。

幻覚を見ているだけなんだ。
そう信じる。
信じるしかない。

３日間。<k>７２時間。<k>
４３２０分。<k>
２５９２００秒。

それに耐えれば、この妄想は終わるんだ。
終わるはずなんだ。

せめて、眠れたり、気絶できたら楽なのに。
そう思ってしまう。

でもそれはできない。
痛みが、それを許してくれない。
だからこそ、拷問刑になり得るんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21101070ta">
「あ、ひぐ……う、う、ぐ、……は、あ、はあ……」

こんなの、続けられたら気が狂う――

一瞬前まで、耐えようと考えていたのに。
転じて、絶望的な気分に落ち込む。

死ぬまでのあまりに膨大な時間の量を考えると、絶望以外の感情は吹き飛んでしまう。
いっそ殺してほしい……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//一度暗転

	ClearAll(1000);

//ＢＧ//ノアⅡ

	CreateTextureEX("fader02", 1000, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("fader02", 1000, 1000, null, true);

	CreateTextureEX("fader01", 1500, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
	Request("fader01", Smoothing);
//おがみ：360：Shade除去
//	SetShade("fader01", HEAVY);
	SetAlias("fader01", "fader01");

	CreateProcess("プロセス１", 1000, 0, 0, "Fader1");
	Request("プロセス１", Start);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text032]
どれぐらいの時間が経ったんだろう。
時計がないから、時間が分からない。

時計を見たい。
でも見たら、その針の進みのあまりの遅さに精神が壊れるだろう。

歯を食いしばる。
全身から、汗が滝のように出ている。

おかげで喉はカラカラだ。
たまに逆流してくる血を飲み込んで、潤す。

身体の中で。
杭が、内臓を徐々に押しのけ、深く埋まってくるのを感じる。

その感覚が、確かにある。

それは死へのカウントダウンだ。

これがやがて、僕のミンチ状になった胸までせり上がり。さらには首を貫いて。

僕の口を突き破るんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21101080ta">
「あ、ぎ、ぎ、あ、あ……」

痛みと恐怖で頭がどうにかなりそうだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//一度暗転
	ClearAll(1000);

//ＢＧ//ノアⅡ

	CreateTextureEX("fader02", 1000, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("fader02", 1000, 1000, null, true);

	CreateTextureEX("fader01", 1500, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
	Request("fader01", Smoothing);
//おがみ：360：Shade除去
//	SetShade("fader01", HEAVY);
	SetAlias("fader01", "fader01");

	CreateProcess("プロセス１", 1000, 0, 0, "Fader1");
	Request("プロセス１", Start);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text033]
５分おきぐらいの感覚で、気絶しては痛みに目覚めるというのを繰り返している。

それで分かったことは。
気絶すると身体が弛緩して。
杭が食い込む早さが増す、ということ。

当然ながら、痛みも比べものにならなくなる。
その痛みのせいで目が覚める。

そして自由にならない身体で激痛にのたうち回り。
その痛さから逃れるべくまた気絶してしまう。
その最悪な循環の繰り返し。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//一度暗転
	ClearAll(1000);

//ＢＧ//ノアⅡ

	CreateTextureEX("fader02", 1000, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("fader02", 1000, 1000, null, true);

	CreateTextureEX("fader01", 1500, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
	Request("fader01", Smoothing);
//おがみ：360：Shade除去
//	SetShade("fader01", HEAVY);
	SetAlias("fader01", "fader01");

	CreateProcess("プロセス１", 1000, 0, 0, "Fader2");
	Request("プロセス１", Start);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text034]
目が覚めていても、常にぼんやりしている。
痛みもなぜかやわらいできた感じだ。

視界は薄暗い。

夜になったのかな、と思ったけど、このドームには窓がないからそれは関係ない。

きっと血が足りないせいだろうと思った。

胸からも左腕からも、ごくわずかずつだけど、血が垂れてきている。

この血がもっと流れれば、串刺しで死ぬ前に失血死で安らかに死ねるかもしれない。

そう思って、肘から下が潰れている左腕を振り回そうとしてみた。

でも動かなかった。
きっともう、神経が死んでいる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//一度暗転
	ClearAll(1000);

//ＢＧ//ノアⅡ

	CreateTextureEX("fader02", 1000, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("fader02", 1000, 1000, null, true);

	CreateTextureEX("fader01", 1500, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
	Request("fader01", Smoothing);
//おがみ：360：Shade除去
//	SetShade("fader01", HEAVY);
	SetAlias("fader01", "fader01");

	CreateProcess("プロセス１", 1000, 0, 0, "Fader3");
	Request("プロセス１", Start);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text035]
あひゃひゃひゃひゃ。

あばばばばば。

ぶぶぶぶ、ぶぺ。ぶぺぺぺ。ぼ。

びびゃびゃびゃびゃ。

ぶひひひひひひひひ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//一度暗転
	ClearAll(1000);

//ＢＧ//ノアⅡ

	CreateTextureEX("fader02", 1000, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("fader02", 1000, 1000, null, true);

	CreateTextureEX("fader01", 1500, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
	Request("fader01", Smoothing);
//おがみ：360：Shade除去
//	SetShade("fader01", HEAVY);
	SetAlias("fader01", "fader01");

	CreateProcess("プロセス１", 1000, 0, 0, "Fader2");
	Request("プロセス１", Start);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text036]
これはホントに妄想なの？

いつ終わるの？

ホントに終わるの？

そもそも妄想だって信じた根拠は？

なんで妄想だって分かるんだ？

もし現実だったら？

耐えたところで、死ぬだけなんだぞ。

耐えても意味がないんだぞ。

なのに耐える？

バカみたいだ。

アホだ。

僕はバカだ。

死ね。氏ねじゃなくて死ね！

今すぐ死ぬべきだ。

こんな痛みはもうたくさんだ。

こんな苦しみはもううんざりだ。

舌を噛み切れ。

そうすれば今すぐ楽になれる。

もう、解放してくれ……。

……これは妄想だよね？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//一度暗転
	ClearAll(1000);
//ＢＧ//ノアⅡ
	CreateTextureEX("fader02", 1000, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("fader02", 1000, 1000, null, true);

	CreateTextureEX("fader01", 1500, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
	Request("fader01", Smoothing);
//おがみ：360：Shade除去
//	SetShade("fader01", HEAVY);
	SetAlias("fader01", "fader01");

	CreateProcess("プロセス１", 1000, 0, 0, "Fader3");
	Request("プロセス１", Start);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text037]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21101090ta">
「死ぬ……死ぬ……死ぬ……死ぬ……死ぬ……死ぬ……痛い……死ぬ……死ぬ……死ぬ……死ぬ……死ぬ……死ぬ……死ぬ……痛い……死ぬ……死ぬ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//一度暗転
	ClearAll(1000);
//ＢＧ//ノアⅡ
	CreateTextureEX("fader02", 1000, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("fader02", 1000, 1000, null, true);

	CreateTextureEX("fader01", 1500, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
	Request("fader01", Smoothing);
//おがみ：360：Shade除去
//	SetShade("fader01", HEAVY);
	SetAlias("fader01", "fader01");

	CreateProcess("プロセス１", 1000, 0, 0, "Fader2");
	Request("プロセス１", Start);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text038]
胸からの出血量が増す。
息ができなくなる。

どんなに酸素を吸い込もうとしても、喉がヒューヒューと間抜けな音を立てるだけ。

見ると、胸の傷痕から杭がのぞいていた。

僕は血を激しく吐き。
酸素を求めて口をパクパクとさせながら。

もうすぐ死ねる、と安堵した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	FadeDelete("fader01", 500, false);
	FadeDelete("fader02", 500, true);
	Delete("プロセス１");

//一度暗転

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 1000, 1000, null, true);

//ＢＧ//黒


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text039]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101100nr">
「そろそろですね」

野呂瀬の声がした。
すぐ鼻先に、ヤツの気配。

でもその姿は見えない。
僕の目はもうなにも映してくれない。

あまりにも長い時間、串刺しにされたまま苦痛に晒され続けてきたせいで、こいつや梨深の存在を完全に忘れていた。

梨深はまだ、近くにいるんだろうか。
そんなの、どうでもいいけど。

僕は息を吸うことに忙しい。

ここしばらくは、ずっとその作業のためだけにすべての体力、全神経を使っていた。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101110nr">
「君が無事死ぬ前に、彼女を始末しておきましょう」

なにを言っているのか、よく分からなかった。
考える余裕もなかった。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21101120ri">
「あたしを……殺すの？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101130nr">
「ええ。そういうことです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101140nr">
「遺言をどうぞ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21101150ri">
「……ごめん、タク。タクのこと、助けてあげられなかった」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//銃声

	CreateSE("SE01","SE_衝撃_じゅう声");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text040]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21101160ri">
「うっ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//人が倒れる音
	CreateSE("SE01","SE_衝撃_どさっ");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text041]
梨深の断末魔が聞こえ。
人が倒れる音がして。
梨深は撃たれて死んだんだ、と僕は思った。

感情は動かなかった。
それどころじゃないんだ。

僕は呼吸をする作業に戻る。

そして、そんな自分に愕然となる。

こんなことに、なんの意味があるんだ。
僕は、なんのために必死で呼吸をしているんだ。
こんなの、あんまりじゃないか。

頬を、熱いものが流れていく。

もしかしたら泣いているかもしれないけど、確かめる術はない。

ここまで頑張って耐えた意味は、３日間を耐え切るまであと少しというところで、失われたんだ。

ごめん、梨深。
謝るのは僕の方だ。
僕は、君を守れなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("fader02", 1000, 0, 0, "cg/ev/ev108_02_1_串刺し_a.jpg");
	Fade("fader02", 0, 1000, null, true);
	CreateTextureEX("fader01", 1500, 0, 0, "cg/ev/ev108_01_1_串刺し_a.jpg");
	Request("fader01", Smoothing);
	SetAlias("fader01", "fader01");
	CreateProcess("プロセス１", 1000, 0, 0, "Fader2");
	Request("プロセス１", Start);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601041]
もう、生きている意味もない。
身体の緊張を解く。

すると、僕の身体が体重で沈んでいく早さが増した。
のどに、異物感。
完全に呼吸不能。

なにかがせり上がってくる――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21101170ta">
「おごごっ、がっ、がががあああ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//イメージＢＧ//赤
//ＳＥ//血が噴き出す音
	CreateSE("SE03","SE_じん体_血_噴きでる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	CreateColor("back11", 500, 0, 0, 1280, 720, "RED");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 300, 1000, null, true);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//ノアⅡ
//ＳＥ//青信号が点滅すると鳴り出す警告音「ピーポーピーポー」

//	DelusionOut();

	SetVolume360("CH26", 0, 0, NULL);
	Delete("*");

	CreateBG(100, 0, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");

	Stand("st玄一_スーツ_武器構え","pride", 200, @-400);
	FadeStand("st玄一_スーツ_武器構え_pride", 0, true);

	CreateSE("SE12","SE_はいけい_点滅ぴーポー_LOOP");
	MusicStart("SE12", 5000, 600, 0, 1000, null, true);

//	DelusionOut2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text042]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21101180ta">
「――っ」

我に返る。
体内の異物感が消える。

僕は串刺しにはされていなかった。
血まみれなのは、胸と左腕だけ。

どこからが妄想だったんだ？

脳の処理速度が追いつかない。
状況を把握できない。

目の前に、ディソードを振り上げた野呂瀬の姿がある。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101190nr">
「帰ってきましたか」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101200nr">
「あなたが体験した３日間は、現実では１秒しか経っていませんが」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21101210ta">
「やっぱり、妄想――」

ホッとして、そうつぶやいたら。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ディソードを振る
//ＳＥ//胴体を両断される
//ＳＥ//血が噴き出す
//ＳＥ//ディソードを振る
	CreateSE("SE03","SE_擬音_ディそーど1");
	CreateSE("SE0903","SE_じん体_血_噴きでる");

	CreateColor("back10", 200, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, true);


	CreateMovie360("ムービー", 1000, Center, Middle, false, false, "dx/mv軌跡02.avi");

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//	Request("ムービー", Play);

	DeleteStand("st玄一_スーツ_武器構え_pride", 0, true);
	Delete("back05");
	WaitAction("ムービー", null);

	Fade("back10", 0, 1000, null, true);

	MusicStart("SE0903", 0, 1000, 0, 1000, null, false);

	Delete("ムービー");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text043]
野呂瀬のディソードが、暴風のように閃いて。

僕の上半身と下半身が、ズレる。

視界が、傾く。

腰から下は、地面に立っているのに。

{	CreateSE("SE02","SE_衝撃_どさっ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
腰から上が、倒れた。

胴体が、両断されていた。
あまりにもキレイな断面。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21101220ta">
「あ……」

自分の下半身を、訳も分からず凝視する。

認めたくない現実。
これも妄想？

妄想ならいいのに。
妄想であってくれ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601043]
//◆泣き叫ぶ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21101230ri">
「タク……！　タク！　タクーっ！」

{	DeleteStand("bu梨深_制服_正面_sad", 500, true);}
梨深が、僕を呼んでる……。
悲しそうな声で、呼んでる……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：ぼかしエフェクトが未実装の為　演出変更

//	CreateTexture360("fader00", 1000, center, middle, "SCREEN");
//	CreateTextureEX("fader01", 1500, center, middle, "SCREEN");
//	Request("fader01", Smoothing);
//	SetShade("fader01", NOMORE);
//	SetAlias("fader01", "fader01");

	CreateSE("SE15","SE_じん体_動作_足_引きずる_ばいのーらる_LOOP");

	CreateColor("fader03", 1600, 0, 0, 1280, 720, "Black");
	Fade("fader03", 0, 0, null, false);
	SetAlias("fader03", "fader03");

//	Fade("fader01", 500, 1000, null, true);
//	CreateProcess("プロセス１", 1000, 0, 0, "Fader4");
//	Request("プロセス１", Start);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text044]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101240nr">
「その状態でも、死ぬまで数分は保つはずです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101250nr">
「元医師である私が言うのだから、確かですよ」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101260nr">
「その間に、ＣＯＤＥサンプルを採ることにしましょうか」

{	MusicStart("SE15", 0, 1000, 0, 1000, null, true);}
僕は、這う。
右手だけで、身体を前へと進める。
梨深の声がする方へ。

梨深に、触れたい。
梨深を、助けなくちゃ。
梨深――

右手を。
先へ。
先へと。

伸ばす。

でも。
梨深がどこにいるか、分からなくて。
届かない。

どこにも、届かない――

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101270nr">
「しぶとい男だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	SetVolume("SE15", 0, 0, NULL);

//ＳＥ//右手を踏まれる
	CreateSE("SE02","SE_衝撃_顔面蹴られる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//	Delete("プロセス１");
	Fade("fader01", 500, 0, null, false);
//	Fade("fader00", 500, 0, null, true);
	Delete("fader*");

	Stand("st玄一_スーツ_通常","normal", 190, @+150);
	Move("st玄一_スーツ_通常_normal", 0, @0, @-100);
	FadeStand("st玄一_スーツ_通常_normal", 0, true);
	Shake("st玄一_スーツ_通常_normal*", 500, 0, 10, 0, 0, 500, null, false);
	Shake("back01", 500, 0, 10, 0, 0, 500, null, false);

	Fade("back10", 500, 0, null, true);
	Delete("back10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text045]
ぐしゃりと。
骨が軋む感触。

野呂瀬の革靴が、僕の伸ばした右手の甲を踏みつけていた。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21101280nr">
「さすが化け物、と言うべきですか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――


//ＳＥ//警告音終了
	SetVolume("SE12", 1000, 0, NULL);

//ＳＥ//共鳴音
	CreateSE("SE100","SE_擬音_共鳴音_激しい_LOOP");
	SetAlias("SE100", "SE100");

//画面エフェクト//歪み
//	CreateTexture360("start01", 100, center, middle, "SCREEN");
//	CreateTextureEX("start02", 100, center, middle, "SCREEN");
//	CreateTextureEX("start03", 500, center, middle, "SCREEN");

//おがみ：SCREEN問題対処
	CreateTexture360("start01", 100, center, middle, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	MusicStart("SE100", 1000, 1000, 0, 1000, null, true);

	Wait(700);

	Fade("start01", 300, 0, null, false);
	Zoom("st玄一_スーツ_通常_normal*", 300, 2000, 1000, null, false);
	DeleteStand("st玄一_スーツ_通常_normal", 300, false);
	Zoom("start01", 300, 2000, 2000, null, true);
	Zoom("start01", 0, 1000, 1000, null, true);
	Fade("start01", 0, 1000, null, true);


//	Request("start02", Smoothing);
//	Fade("start02", 500, 300, null, false);
//▼べー：演出：DrawEffect使用不可のため一時的にコメントアウト致します。
/*
	if(Platform()!=100){
		DrawEffect("start02", 500, "LowWave", 0, 100, null);
	}
*/

//おがみ：SetPanの不具合か不明だが、とりあえず対処
//	CreateProcess("プロセス１", 1000, 0, 0, "CrazyPan");
//	Request("プロセス１", Start);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text046]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000010ta">
その野呂瀬の足が、蜃気楼のように揺れた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000020ta">
床のタイルの模様がぼんやりとし始めて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("Black01", 2000, 0, 0, 1280, 720, "Black");
	Fade("Black01", 500, 1000, null, true);
//	Request("start02", Erase);
//	Rotate("start02", 1, @0, @0, 180, null, true);
	Rotate("start01", 1, @0, @0, 180, null, true);
//	Move("start02", 0, @0, @0, null, true);
//	Fade("start02", 500, 300, null, false);
	Move("start01", 0, @0, @0, null, true);
	Fade("Black01", 500, 0, null, true);
	Delete("Black01");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601046]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000030ta">
天地が回転する。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000040ta">
床と天井が逆になる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000050ta">
僕は天井に這いつくばっている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_血_噴きでる");
	CreateSE("SE03","SE_じん体_動作_と血");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	WaitAction("SE02", null);
	MusicStart("SE03", 0, 600, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602046]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000060ta">
両断された腰から、ものすごい勢いで血が噴き出す。

{	CreateSE("SE04","SE_じん体_手首_たれる血");
	CreateSE("SE02","SE_擬音_とどめ_ディそーど");
	MusicStart("SE04", 0, 1000, 0, 1000, null, true);
	MusicStart("SE02", 0, 800, 0, 1000, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000070ta">
全開にした蛇口のように。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000080ta">
血が、身体から抜けていく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000090ta">
そのまま、腕の傷口を通って内臓までが流れ出る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black02", 1500, 0, 0, 1280, 720, "Black");
	Fade("Black02", 0, 0, null, false);
	Fade("Black02", 1000, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text047]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000100ta">
意識がスーッと遠くなる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000110ta">
でも完全には途切れない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000120ta">
血だまりができて。

{	CreateColor("Red02", 1500, 0, 0, 1280, 720, "RED");
	DrawTransition("Red02", 2000, 0, 1000, 800, null, "cg/data/effect.png", false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000130ta">
僕はその真紅の海に身を横たえている。

{	SetVolume("SE04", 1000, 0, NULL);
	CreateSE("SE05","SE_じん体_心臓_鼓動_LOOP");
	MusicStart("SE05", 0, 1000, 0, 1000, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000140ta">
どくん。どくんと。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000150ta">
鼓動する心臓が。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000160ta">
僕の目の前に転がっていて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000170ta">
血だまりに波紋を作り。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000180ta">
その波紋をぼんやり見ていたら。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE06","SE_衝撃_どすーん");
	CreateSE("SE07","SE_じん体_動作_おうと");
	CreateColor("Black02", 1500, 0, 0, 1280, 720, "Black");
	Fade("Black02", 0, 0, null, false);

	SetVolume("SE05", 1000, 0, NULL);

	MusicStart("SE06", 0, 700, 0, 1000, null, false);
	MusicStart("SE07", 0, 1000, 0, 1000, null, false);

	Fade("Black02", 0, 1000, null, true);
	Delete("Red02");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601047]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000190ta">
僕の、形が、崩れた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateColor("Black03", 500, 0, 0, 1280, 720, "Black");
	Fade("Black03", 0, 1000, null, true);
	Delete("Black02");
	CreateColor("BlackRed", 1000, 0, 0, 1280, 720, "#990000");
	DrawTransition("BlackRed", 3000, 0, 1000, 1000, null, "cg/data/円形中外.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602047]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000200ta">
人としての形を、維持できない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("BlackRed02", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("BlackRed02", 2000, 0, 1000, 500, null, "cg/data/爆発２.png", true);
	CreateColor("White01", 100, 0, 0, 1280, 720, "White");
	Request("White01", AddRender);
	Fade("White01", 0, 1000, null, false);
//	Request("start03", SubRender);
//	Fade("start03", 0, 1000, null, false);
	Fade("BlackRed", 1000, 0, null, false);
	Fade("BlackRed02", 1000, 0, null, false);
	Fade("Black03", 1000, 0, null, true);
	Delete("Black03");
	Delete("BlackRed");
	Delete("BlackRed02");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603047]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000210ta">
僕と世界との境界が消失する。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000220ta">
肉が溶け。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000230ta">
骨がゴムのように曲がり。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000240ta">
眼球は四角になり。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000250ta">
口から、裏返った肺がこぼれ出し。

{	CreateColor("BlackRed", 1000, 0, 0, 1280, 720, "#990000");
	DrawTransition("BlackRed", 3000, 0, 1000, 1000, null, "cg/data/円形中外.png", false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000260ta">
神経は数万キロメートルも引っ張られ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000270ta">
脳はシワのひとつひとつを丁寧に伸ばされ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000280ta">
身体はぶよぶよになる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



	CreateColor("Black00", 500, 0, 0, 1280, 720, "Black");
	Fade("Black00", 0, 1000, null, false);

	Fade("BlackRed", 3000, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text048]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000290ta">
くうきに溶けていく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000300ta">
右手がいとのようにのびて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("BlackRed", null);

	CreateColor("Black03", 3000, 0, 0, 1280, 720, "Black");
//	Fade("start03", 0, 0, null, false);
	Fade("Black03", 0, 400, null, true);

	Delete("BlackRed");
	Delete("White01");
	Delete("start01");
//	Delete("start02");

	CreateTextureEX("BackG01", 600, 0, 0, "cg/bg/bg199_01_3_プラネタリウム・ロビー_a.jpg");
//	Request("BackG01", SubRender);
	CreateColor("White00", 750, 0, 0, 1280, 720, "White");
	Request("White00", AddRender);

	Fade("White00", 500, 500, null, false);
	Zoom("BackG01", 3000, 1000, 2500, Dxl2, false);

	Fade("BackG01", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601048]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000310ta">
プラネタリウムを出ていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("BackG02", 600, 0, 0, "cg/bg/bg197_01_3_渋谷駅東口とプラネタリウム_a.jpg");
	Request("BackG02", AddRender);
	Zoom("BackG02", 3000, 1000, 2500, Dxl2, false);
	Fade("BackG02", 0, 1000, null, true);
	Delete("BackG01");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602048]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000320ta">
それはあめざいくのように。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("BackG03", 600, 0, 0, "cg/bg/bg206_01_3_夜空_a.jpg");
	Zoom("BackG03", 3000, 1000, 2500, Dxl2, false);
	Fade("BackG03", 0, 1000, null, true);
	Delete("BackG02");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603048]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000330ta">
しぶやの空をさまよって。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("BackG04", 600, 0, 0, "cg/bg/bg165_01_3_O-FRONT見上げ_a.jpg");
	Request("BackG04", AddRender);
	Zoom("BackG04", 3000, 1000, 2500, Dxl2, false);
	Fade("BackG04", 0, 1000, null, true);
	Delete("BackG03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604048]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000340ta">
こーねりあすたわーに、くるくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000350ta">
まきつく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000360ta">
なんども。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000370ta">
なんども。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000380ta">
なんども。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE08","SE_擬音_拓巳再生");
	MusicStart("SE08", 0, 200, 0, 1000, null, false);
	Zoom("BackG04", 1000, 2000, 2500, Dxl2, false);
	Fade("Black03", 500, 0, null, false);
	CreateColor("BlackRed", 1000, 0, 0, 1280, 720, "#990000");
	DrawTransition("BlackRed", 3000, 0, 1000, 1000, null, "cg/data/effect.png", 1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text049]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000390ta">
わかれたあしが、ふくれてる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("BlackRed", null);
	Delete("BackG04");
	Delete("White00");
	Delete("Black03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601049]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000400ta">
ぶくぶくと。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000410ta">
みずふうせんみたい。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000420ta">
ぱんぱんに。ひふがのびて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000430ta">
ぎちぎち、おとをたててる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("Black04", 500, 0, null, false);
	CreateColor("Black04", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("Black04", 3000, 0, 1000, 1000, null, "cg/data/effect.png", 1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602049]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000440ta">
えきじょうか。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000450ta">
にくも、ほねも。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000460ta">
とろけて、ふくらはぎにたまってる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000470ta">
こしから、にょきってちいさなあたまがはえて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000480ta">
ぎょろりとしたしろいめが、ぼくをみたよ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE09","SE_衝撃_打撃_殴る");
	CreateSE("SE10","SE_じん体_動作_おうと");

	MusicStart("SE09", 0, 400, 0, 1000, null, false);
	MusicStart("SE10", 0, 400, 0, 1000, null, false);

	CreateColor("BlackRed", 2000, 0, 0, 1280, 720, "#990000");
	DrawTransition("BlackRed", 1000, 0, 700, 1000, null, "cg/data/zoom1.png", 1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603049]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000490ta">
そしたら、ぼくのあたまがぐしゃってつぶされた。

{	CreateColor("Black05", 2000, 0, 0, 1280, 720, "Black");
	Fade("Black05", 0, 0, null, false);
	Fade("Black05", 500, 1000, null, true);
	Delete("BlackRed");
}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000500ta">
どっちのあたまかは、よくわかんない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000510ta">
つぶれて、とろとろになって。

{	CreateTextureEX("BackG05", 1100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("BackG05", 0, 600, null, false);
	Fade("Black05", 500, 0, null, true);
	Delete("Black05");}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000520ta">
びるのゆか。こんくりーとのぶんしのすきまをぬけて。

{	CreateSE("SE11","SE_擬音_風圧落下_LOOP");
	MusicStart("SE11", 1000, 400, 0, 1000, null, true);
	DrawTransition("BackG05", 500, 1000, 0, 800, null, "cg/data/zoom2.png", false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000530ta">
おちていく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000540ta">
ちじょうへ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000550ta">
びゅーって。

{	CreateSE("SE11","SE_衝撃_落下激突");
	MusicStart("SE11", 0, 1000, 0, 1000, null, false);
	CreateSE("SE12","SE_じん体_動作_おうと");
	MusicStart("SE12", 0, 1000, 500, 1000, null, false);
	CreateColor("Red04", 2000, 0, 0, 1280, 720, "RED");
	DrawTransition("Red04", 500, 0, 700, 1000, null, "cg/data/zoom1.png", false);
	Fade("Red04", 1000, 0, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000560ta">
じめんに、つくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000570ta">
どろりとした、のうみそのみずたまり。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateColor("backblack", 500, 0, 0, 1024, 576, "Black");
	Delete("BackG05");
	Delete("RED04");
	Delete("Black04");

	CreateColor("Moza", 2000, 0, 0, 1024, 576, "Black");
	Fade("Moza", 0, 300, null, false);
	DrawTransition("Moza", 0, 0, 600, 300, null, "cg/data/noize.png", false);

	CreateColor("Moza2", 2200, 0, 0, 1024, 576, "White");
	Fade("Moza2", 0, 200, null, true);
	DrawTransition("Moza2", 0, 0, 500, 700, null, "cg/data/noize.png", false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text050]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000580ta">
もぞもぞ、もごもご。じゅるじゅる。どろどろ。ぷるぷる。びよんびよん。びちゃびちゃ。ぐじゅぐじゅ。ぐちゃりぐちゃり。

{	CreateColor("tile", 600, 0, 0, 512, 576, "RED");}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000590ta">
ぼくはふたつになる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("tileA01", 600, 0, 288, 512, 576, "Black");
	Fade("tileA01", 0, 0, null, false);
	CreateColor("tileA02", 600, 512, 288, 1024, 576, "RED");
	Fade("tileA02", 0, 0, null, false);
	Fade("tileA*", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000600ta">
ふたつが、よっつになる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("tileB01", 600, 0, 0, 256, 288, "Black");
	Fade("tileB01", 0, 0, null, false);
	CreateColor("tileB02", 600, 0, 288, 256, 576, "RED");
	Fade("tileB02", 0, 0, null, false);
	CreateColor("tileB03", 600, 768, 288, 1024, 576, "Black");
	Fade("tileB03", 0, 0, null, false);
	CreateColor("tileB04", 600, 768, 0, 1024, 288, "RED");
	Fade("tileB04", 0, 0, null, false);
	Fade("tileB*", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text902]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000610ta">
よっつが、やっつになる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("tileB*", 0, 0, null, true);
	Delete("tileB*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text903]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000620ta">
やっつがよっつに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("tile*", 0, 0, null, true);
	Delete("tile*");
	CreateColor("tileZ00", 600, 512, 0, 1024, 576, "RED");
	Fade("tileZ00", 0, 0, null, false);
	CreateColor("tileC01", 600, 0, 288, 512, 576, "RED");
	Fade("tileC01", 0, 0, null, false);
	CreateColor("tileC02", 600, 512, 288, 1024, 576, "Black");
	Fade("tileC02", 0, 0, null, false);
	CreateColor("tileD03", 600, 768, 288, 1024, 576, "RED");
	Fade("tileC03", 0, 0, null, false);
	CreateColor("tileD04", 600, 768, 0, 1024, 288, "Black");
	Fade("tileC04", 0, 0, null, false);
	CreateColor("tileD05", 600, 0, 0, 256, 288, "RED");
	Fade("tileC05", 0, 0, null, false);
	CreateColor("tileD06", 600, 0, 288, 256, 576, "Black");
	Fade("tileC06", 0, 0, null, false);
	Fade("tile*", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text904]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000630ta">
ふたつがやっつに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("tileD*", 0, 0, null, true);
	Delete("tileD*");
	CreateColor("tileEBlack", 600, 0, 0, 1024, 576, "Black");
	Fade("tileEBlack", 0, 0, null, false);
	CreateColor("tileE00", 600, 0, 0, 512, 576, "RED");
	Fade("tileE00", 0, 0, null, false);
	CreateColor("tileE01", 600, 0, 288, 512, 576, "Black");
	Fade("tileE01", 0, 0, null, false);
	CreateColor("tileE02", 600, 512, 288, 1024, 576, "Red");
	Fade("tileE02", 0, 0, null, false);
	Fade("tileE*", 0, 1000, null, true);

//	CreateTexture360("tile10", 600, center, middle, "SCREEN");
//	Delete("tileE*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text905]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000640ta">
よっつがよっつに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("tileF01", 600, 0, 0, 256, 288, "Black");
	Fade("tileF01", 0, 0, null, false);
	CreateColor("tileF02", 600, 0, 288, 256, 576, "RED");
	Fade("tileF02", 0, 0, null, false);
	CreateColor("tileF03", 600, 768, 288, 1024, 576, "Black");
	Fade("tileF03", 0, 0, null, false);
	CreateColor("tileF04", 600, 768, 0, 1024, 288, "RED");
	Fade("tileF04", 0, 0, null, false);
	Fade("tileF*", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text906]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000650ta">
どんどん、ふえて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("tile*", 0, 0, null, true);
	Delete("tile*");
	Delete("Moza");
	Delete("Moza2");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text907]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000660ta">
どんどん、へる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateTextureEX("おど", 600, 0, 0, "cg/bg/bg207_01_6_おどろおどろしいイメージ_a.jpg");
	Fade("おど", 1000, 1000, null, true);
	Delete("back01");
	Delete("Black00");
	Delete("Red04");
	Delete("backblack");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text051]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000670ta">
ぼくが、いっぱい。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000680ta">
ぼくが、いない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000690ta">
ぼくは、なに？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000700ta">
ぼくって、なに？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000710ta">
なにって、ぼく？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000720ta">
ぼく？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000730ta">
なに？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("サイケ", 600, 0, 0, "cg/bg/bg210_01_6_サイケデリックなイメージ_a.jpg");
	Fade("サイケ", 500, 1000, null, true);
	Delete("おど");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601051]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000740ta">
なにくがなぼに？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000750ta">
なぼ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000760ta">
ぼに。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000770ta">
なく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000780ta">
ぼ？？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000790ta">
？？な？？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("@SE100", 50, 0, null);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text052]
//ＶＦ//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21101290jn">
「君は妄想なんかじゃないよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000800ta">
れ？？？だ？？？

//ＶＦ//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21101300jn">
「見てごらん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


}



/*森島連続ブラー用function*/
..//Fader1(ブラー弱)
function Fader1()
{
	while(1)
	{
//秒数乱数
	Fade("@fader01", 750, 800, null, true);
	$bayran = Random(9) + 1;
	$bay = $bayran * 100;
	Wait($bay);
	Fade("@fader01", 750, 200, null, true);
	$bayran2 = Random(4) + 1;
	$bay2 = $bayran * 100;
	Wait($bay2);
	}
}
..//Fader1(ブラー中)
function Fader2()
{
	while(1)
	{
	Fade("@fader01", 500, 800, Dxl2, true);
	$bayran = Random(9) + 1;
	$bay = $bayran * 100;
	Wait($bay);
	Fade("@fader01", 500, 200, Axl2, true);
	$bayran2 = Random(4) + 1;
	$bay2 = $bayran * 100;
	Wait($bay2);
	}
}
..//Fader1(ブラー強)
function Fader3()
{
	while(1)
	{
	Fade("@fader01", 300, 800, null, true);
	$bayran = Random(9) + 1;
	$bay = $bayran * 100;
	Wait($bay);
	Fade("@fader01", 300, 200, null, true);
	$bayran2 = Random(4) + 1;
	$bay2 = $bayran * 100;
	Wait($bay2);
	}
}
..//fader4
function Fader4()
{
	while(1)
	{
	Fade("@fader03", 3000, 500, null, false);
	Fade("@fader01", 3000, 800, null, true);
	Fade("@fader03", 3000, 100, null, false);
	Fade("@fader01", 3000, 200, null, true);
	}
}

/*森島連続歪み用function*/
..//Distortion(歪み)
function Distortion()
{
	Fade("@dis", 500, 800, null, false);
	while(1)
	{
	DrawTransition("@dis", 500, 100, 600, 500, null, "cg/data/波.png", true);
	$bayran = Random(4) + 1;
	$bay = $bayran * 100;
	Wait($bay);
	DrawTransition("@dis", 500, 600, 100, 500, null, "cg/data/波.png", true);
	$bayran = Random(4) + 1;
	$bay = $bayran * 100;
	Wait($bay);
	}
}

..//Distortion2(歪み)
function Distortion2()
{
	Fade("@dis02", 300, 400, null, false);
	while(1)
	{
	DrawTransition("@dis02", 300, 200, 700, 500, null, "cg/data/波.png", true);
	$bayran3 = Random(4) + 1;
	$bay3 = $bayran3 * 100;
	Wait($bay3);
	DrawTransition("@dis02", 300, 700, 200, 500, null, "cg/data/波.png", true);
	$bayran4 = Random(4) + 1;
	$bay4 = $bayran4 * 100;
	Wait($bay4);
	}
}

..//CrazyPan(音)
function CrazyPan()
{

	while(1)
	{
	SetPan("@SE100", 2000, -500, AxlDxl);
	Wait(1500);
	SetPan("@SE100", 2000, 500, AxlDxl);
	Wait(1500);
	}
}