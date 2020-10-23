//<continuation number="600">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_145_妄想トリガー３３■";
		$GameContiune = 1;
		Reset();
	}

		ch07_145_妄想トリガー３３■();
}


function ch07_145_妄想トリガー３３■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//	CreateTexture360("梢ディソード２", 1000, 0, -500, "cg/ev/ev071_01_1_梢ディソード顕現_a.jpg");
//	Request("梢ディソード２", Smoothing);
//	Fade("梢ディソード２", 0,1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	PrintBG(1000);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー
//ポジティブ妄想→分岐１０へ
//ネガティブ妄想→分岐１１へ
//妄想しない→分岐１２へ

if($妄想トリガー通過３３ == 0)
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
			$妄想トリガー３３ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー３３ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー３３ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー３３ == 2)
{
//☆☆☆
//分岐１０
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
	DelusionIn();

	Delete("back*");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg059_01_2_Ｒｏｆｔ店内_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Stand("bu梢_制服_武器構え青","smile", 500, @+100);
	FadeStand("bu梢_制服_武器構え青_smile", 0, true);

	DelusionIn2();

//べー：Ｒｏｆｔ店内
//	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
//	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
あの華奢な身体のどこに、そんな力があるんだ。

見た限りだと、少なくとも５ｋｇ以上は確実にある大きさだぞ。

そんな僕の心の中の疑問を、文字通り“読み取った”こずぴぃが、僕に振り向いて遠慮がちに微笑む。

{	MusicStart("SE01", 500, 0, 0, 0, null, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500010ko">
「こずぴぃは、拓巳しゃんを守るたーめだけに造られた、
アンドロイドなのらー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14500020ta">
「……はい？」

{	BGMPlay360("CH05", 0, 1000, true);}
今、アンドロイド……って言った？
どこのアニメの設定だよ、それ……。

あ然となっている僕を無視して、こずぴぃは可愛らしく片手で握り拳を作る。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500030ko">
「拓巳しゃん、もう安心なの」

//◆ヤーツ＝奴
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500040ko">
「拓巳しゃんを狙う悪いヤーツは、こずぴぃがドッカーンってするのら」

//◆ちーなみに＝ちなみに
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500050ko">
「ちーなみに、こずぴぃはメイド機能もあるの」

//■３６０
//「ちーなみに、こずぴぃにはメイド機能もあるの」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500060ko">
「だからーだからー、これから拓巳しゃんと一緒に住んで、身の回りのお世話もしたいのらー」

な、なるほど、それは便利だ……。

こずぴぃがアンドロイドであることも、まあ受け入れてあげてもいい。
ただし、そのためにはひとつだけ譲れない条件があった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_武器構え青","normal", 500, @+100);
	FadeStand("bu梢_制服_武器構え青_normal", 300, true);
	DeleteStand("bu梢_制服_武器構え青_smile", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14500070ta">
「……え、えっちなことをできる機能はありますか？」

なぜか敬語になってしまった……。

っていうか僕、今とんでもないことを聞いちゃったような。

謝ろうかどうか迷っていると、<?>
{	Stand("bu梢_制服_武器構え青","shy", 500, @+100);
	FadeStand("bu梢_制服_武器構え青_shy", 300, true);
	DeleteStand("bu梢_制服_武器構え青_normal", 0, true);}
こずぴぃは頬を染めて目を伏せた。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500080ko">
「……うん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14500090ta">
「え……？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500100ko">
「えっちなことも……できるの……」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500110ko">
「夜のご奉仕、頑張るの……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14500120ta">
「…………！」

キタコレ！！！１１！！！１！

戦闘能力を有したメイドアンドロイドで、さらに夜のご奉仕機能まで付いてるなんて！

それなんてエロゲ！

オプション機能充実しすぎだろｗ

日本の技術力は世界イチィィィィ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 0, 0, false);
	
//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
	DelusionOut();

	DeleteStand("bu梢_制服_武器構え青_shy", 0, true);

//ＢＧ//Ｒｏｆｔ店内
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg059_01_2_Ｒｏｆｔ店内_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	Stand("st梢_制服_武器構え青","normal", 500, @+150);
	FadeStand("st梢_制服_武器構え青_normal", 0, true);
	
	DelusionOut2();
	PositiveHuman();

	CreateSE("SE01","SE_はいけい_しーでーしょっぷ店内_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
……そんなアホな妄想をしている間も、こずぴぃは剣を持ったまま軽い足取りで店内を闊歩していく。

こずぴぃは、それが当たり前であるかのように周囲から剣を隠そうとはしない。

セナと同じだ。あの女も渋谷のど真ん中で周囲の迷惑も顧みずあの巨大なディソードを持ち歩いていた。

あまりにも平然としすぎている。
セナもこずぴぃも、やっぱり異常だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流４へ
}


//=============================================================================//

if($妄想トリガー３３ == 1)
{
//☆☆☆
//分岐１１

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//梢ディゾードＣＧ前cutより
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg059_01_2_Ｒｏｆｔ店内_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Stand("bu梢_制服_武器構え青","smile", 500, @+150);
	FadeStand("bu梢_制服_武器構え青_smile", 0, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

	FadeDelete("back*", 1000, true);
	Delete("back*");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
なんで、こずぴぃがディソードを……

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500130ko">
「だーって、こずぴぃは――」

こずぴぃは無邪気な笑みを浮かべたまま、僕の方を振り返り――

{	Delete("SE01");}
//◆「しょーぐんしゃん」＝「将軍しゃん」
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500140ko">
「しょーぐんしゃんの手下だもーん♪」

あの巨大なスノボーのような板が、
空気を切り裂くかのように閃く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//べー：音と剣閃ムービー調節
//ＳＥ//ディソードを振り回す
	CreateSE("SE02","SE_擬音_ディそーど_空を切る2");

	Stand("bu梢_制服_武器構え","smile", 500, @+150);
	FadeStand("bu梢_制服_武器構え_smile", 0, true);

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateMovie360("剣１", 1000, Center, Middle, false, false, "dx/mv軌跡02.avi");
	Fade("剣１", 0, 0, null, true);
	Fade("剣１", 50, 1000, null, true);
	Wait(500);
	DeleteStand("bu梢_制服_武器構え青_smile", 0, true);
	Fade("剣１", 500, 0, null, true);
	Delete("剣１");

//	WaitPlay("SE02", null);

//ＳＥ//剣が肉体をえぐる音
	CreateSE("SE03","SE_擬音_ディそーど_人を切る");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	CreateColor("赤", 1000, 0, 0, 1280, 720, "Red");
	Fade("赤", 0, 1000, null, true);
	Fade("赤", 500, 0, null, true);
	Wait(500);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14500150ta">
「……え？」

なにが起きたのか、よく理解できなかった。
僕が反応する前に、すべては終わっていた。

こずぴぃは、ディソードを小さな身体で抱きしめるようにする。

その剣に、べったりとこびりついている――血。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500160ko">
「バイバーイ、拓巳しゃん♪」

ずるり、と。
僕の身体が、
歪んだ。

{	CreateSE("SE36002","SE_じん体_心臓_鼓動");
	MusicStart("SE36002", 0, 1000, 0, 1000, null, true);
	CreateColor("黒", 1000, 0, 0, 1280, 720, "Black");
	Fade("黒", 0, 900, null, true);
	Fade("黒", 500, 0, null, true);
	Wait(500);}
倒れそうになって、右足を前へ出して踏ん張ろうとした。

{	Fade("黒", 0, 900, null, true);
	Fade("黒", 500, 0, null, true);
	Delete("黒");
	Wait(500);}
でも、足が動かない。
下半身の感覚が、消失していた。
腰のあたりに、強烈な熱を感じる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14500170ta">
「あ……れ……？」

{	DeleteStand("bu梢_制服_武器構え_smile", 300, true);
	CreateSE("SE03","SE_じん体_動作_おうと");
	MusicStart("SE03", 500, 400, 0, 1000, null, false);
	CreateSE("SE04","SE_衝撃_どさっ");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}
僕は前のめりに倒れる。
身体の自由がきかない。

手だけでわずかに身を起こし、混乱しながらも、自分の身体へと目を向けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateColor("赤", 1000, 0, 0, 1280, 720, "Red");
	Fade("赤", 0, 900, null, true);
	CreateSE("SE04","SE_じん体_血_噴きでる");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	Fade("赤", 500, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
脇腹から、ドクドクと流れ出る血。
はみ出した腸がぬらぬらと光り。
露わになった白い骨に、ピンク色の肉がこびりついている。

えぐられた、身体。
自分のものとは思えない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14500180ta">
「ウソ……でしょ……」

{	Stand("bu梢_制服_武器構え","smile", 500, @+150);
	FadeStand("bu梢_制服_武器構え_smile", 500, true);}
その光景が信じられなくて、こずぴぃを見上げた。

{	Stand("bu梢_制服_武器構え","shy", 500, @+150);
	FadeStand("bu梢_制服_武器構え_shy", 300, false);
	DeleteStand("bu梢_制服_武器構え_smile", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500190ko">
「うぴゅ～」

{	DeleteStand("bu梢_制服_武器構え_shy", 500, true);}
こずぴぃは、僕を蔑むような瞳で見つめたまま、

ディソードに付いた僕の血を、

その可愛らしい舌で、

ゆっくりと、

見せつけるように、

――舐めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("赤");
	Delete("SE36002");

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
	DelusionOut();

	DeleteStand("bu梢_制服_武器構え青_shy", 0, true);
	
//ＢＧ//Ｒｏｆｔ店内
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg059_01_2_Ｒｏｆｔ店内_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	DelusionOut2();
	NegativeHuman();

	Stand("st梢_制服_武器構え青","normal", 500, @+150);
	FadeStand("st梢_制服_武器構え青_normal", 500, true);
	
	CreateSE("SE01","SE_はいけい_しーでーしょっぷ店内_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14500200ta">
「うえ……」

自分の妄想で気持ち悪くなってしまった。

でも、その妄想が現実にならないとは限らない。

最悪の事態を想定し、僕はこずぴぃから少し距離を取った。いつでも逃げられるように身構える。

……そんな僕の気持ちになんて気付いてないかのように、こずぴぃは剣を持ったまま軽い足取りで店内を闊歩していく。

それが当たり前であるかのように周囲から剣を隠そうとはしない。

セナと同じだ。あの女も渋谷のど真ん中で周囲の迷惑も顧みずあの巨大なディソードを持ち歩いていた。

あまりにも平然としすぎている。

例えこずぴぃが『将軍』の手下じゃないとしても。
やっぱり異常だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流４へ
}


//=============================================================================//

if($妄想トリガー３３ == 0)
{
//☆☆☆
//分岐１２


//梢ディゾードＣＧ前cutより
//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//ＢＧ//Ｒｏｆｔ店内
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg059_01_2_Ｒｏｆｔ店内_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	
	Stand("st梢_制服_武器構え青","normal", 500, @+150);
	FadeStand("st梢_制服_武器構え青_normal", 0, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	CreateSE("SE01","SE_はいけい_しーでーしょっぷ店内_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);
	
	FadeDelete("back*", 1000, true);
	Delete("back*");
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
それは、屋内で振り回すにはあまりにも巨大だった。

周囲には他に客だっている。もし誰かにケガなんかさせたら大変なことになる。

僕は、こずぴぃの立ち振る舞いにハラハラさせられた。

{	Stand("st梢_制服_武器構え青","smile", 500, @+150);
	FadeStand("st梢_制服_武器構え青_smile", 500, false);
	DeleteStand("st梢_制服_武器構え青_normal", 500, true);}
そんな僕の心配なんて知ってか知らずか、こずぴぃは無謀にも剣を下ろしてクルクルとその場で回る。楽しそうに。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500210ko">
「これが、こずぴぃの剣だよー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500220ko">
「悪い人をやっつけるのら」

悪い人を……やっつける？

その言葉に、僕は胸騒ぎを覚えた。
なにかが、引っかかる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_武器構え青","normal", 500, @+150);
	FadeStand("st梢_制服_武器構え青_normal", 500, false);
	DeleteStand("st梢_制服_武器構え青_smile", 500, true);

//合流４へ
}


//=============================================================================//

//☆☆☆
//合流４
//ＢＧ//Ｒｏｆｔ店内

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg059_01_2_Ｒｏｆｔ店内_a.jpg");
	Fade("背景１", 0, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	CreateSE("SE36001","SE_じん体_心臓_鼓動");
	MusicStart("SE36001", 0, 1000, 0, 1000, null, false);

	CreateColor("赤", 1000, 0, 0, 1280, 720, "Red");
	Fade("赤", 0, 800, null, true);
	Fade("赤", 500, 0, null, true);
	Delete("赤");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
そして思い出したのは、匂い。
血の、匂い。

さっきのＤＱＮたちが、血まみれで倒れていた光景を思い出す……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_武器構え青_normal", 500, true);
	Stand("bu梢_制服_武器構え青","angry", 500, @+150);
	FadeStand("bu梢_制服_武器構え青_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//◆とーうぜん＝当然
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500230ko">
「あんなひどいことする人たちは、死んでとーうぜんだよ、ぷんぷん」

や、やっぱりあいつら、死んでた……の？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500240ko">
「ううん」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500250ko">
「生きてる価値もなーいけど。あんな、ゴキゴキな人たちは」

ゴキゴキ？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500260ko">
「ゴキブリ♪」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500270ko">
「はーあ、殺したかったなぁ」

//※梢はＤＱＮ３人組に対してなにもしていない。梢があの場に来たときにはすでに拓巳によって３人組はボコボコにされた後だった。
そう言い放ったときのこずぴぃの心の動きが、僕にははっきりと感じられた。

彼女の中には、これっぽっちの悪意もなかった。
ただ純粋に、悪い人に報復したいっていうだけで、それはなにも間違ってないって思ってる。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500280ko">
「最近、渋谷はまーすます物騒だよ」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500290ko">
「昨日も怖そうなゴキゴキ男たちに拉致されそうになっちゃったから、ドガドガドガーンってしてやったのら」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14500300ta">
「…………」

この子も、歪んでいるかもしれない。
僕とは、違う意味で。

{	Stand("st梢_制服_武器構え青","smile", 500, @+150);
	DeleteStand("bu梢_制服_武器構え青_angry", 500, true);
	FadeStand("st梢_制服_武器構え青_smile", 500, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500310ko">
「西條くん、こっちでーす」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
こずぴぃは、巨大なディソードを持ったまま歩き始めた。

背も低くて、腕も細くて、力なんて全然なさそうに見えるのに、特に剣を重たがる素振りを見せず、足取りも軽く進んでいく。

すれ違う他の客や、陳列してある商品に何度も剣の端がぶつかりそうになり、僕はその度に目を覆った。でも、奇跡的にどこにも、誰にも当たらずに済んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//べー：Ｒｏｆｔ店内音量下げ
	SetVolume("SE01", 3000, 600, null);
	CreateTexture360("効果０", 800, center, middle, "SCREEN");
	DeleteStand("st梢_制服_武器構え青_smile", 0, true);
	Delete("背景１")

//ＢＧ//Ｒｏｆｔ店内・階段
	Delete("back*");
//	CreateBG(300, 0, 0, "cg/bg/bg061_01_2_Ｒｏｆｔ店内階段_a.jpg");
	CreateTexture360("背景２", 300, 0, 0, "cg/bg/bg061_01_2_Ｒｏｆｔ店内階段_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	DrawTransition("効果０", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);
		
	Delete("効果０");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
行き着いた先は、階段だった。

薄暗いそこは、フロア内とは違って人の気配がまったくない。誰も来ない。

渋谷の駅から歩いてわずか５分の距離にある、天下のＲｏｆｔ店内に、こんなうら寂しいスペースがあるなんて、意外だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_武器構え青","normal", 500, @-150);
	FadeStand("st梢_制服_武器構え青_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500320ko">
「Ｒｏｆｔだけじゃないのだ」

//◆ぜんぜーん＝全然
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500330ko">
「デパートの階段って、ぜんぜーん人がいないのー」

渋谷に住んでもうすぐ２年になろうとしてる僕が知らないことを、引っ越してきて数週間の彼女がどうして知ってるんだろう……。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500340ko">
「こずぴぃは、東京に来てから毎日渋谷を歩き回ってたのら」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500350ko">
「それで見ーつけたの。憩いの場所だよー」

こずぴぃは上機嫌な様子で、階段に座り込んだ。
{	DeleteStand("st梢_制服_武器構え青_normal", 300, true);
	Stand("bu梢_制服_通常","smile", 500, @-150);
	FadeStand("bu梢_制服_通常_smile", 300, true);}
すぐ横にディソードを無造作に寝かせる。

僕も脇腹の痛みが耐えきれなくなってきていたから、とりあえず一休みすることにした。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500360ko">
「それでそれでー、景色とか模様とか見ると、別のものが見えたりしなーいかな？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500370ko">
「ゾウさんとか、ウサギさんとか、ライオンさんとか」

{	Stand("bu梢_制服_通常","normal", 500, @-150);
	FadeStand("bu梢_制服_通常_normal", 300, true);
	DeleteStand("bu梢_制服_通常_smile", 0, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500380ko">
「一番おおーって思ったのは、オオサンショウウオさんに見えたとーき」

……いったいなんの話？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","angry", 500, @-150);
	FadeStand("bu梢_制服_通常_angry", 300, true);
	DeleteStand("bu梢_制服_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500390ko">
「ディソードの話でーすよ、うぷー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500400ko">
「なにかの模様とか、景色とか見ると、動物さんとか、色んな形に見えることがあって」

ああ、そのことか。
そう、僕もそれは経験ある。

そしてあのＯ－ＦＲＯＮＴ屋上でも、そんな視点で見てみたら、あった。

景色の中に溶け込んでいた、ディソードが。

{	Stand("bu梢_制服_通常","smile", 500, @-150);
	FadeStand("bu梢_制服_通常_smile", 300, true);
	DeleteStand("bu梢_制服_通常_angry", 0, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500410ko">
「はーい、ピンポンでーす♪」

{	Stand("bu梢_制服_通常","normal", 500, @-150);
	FadeStand("bu梢_制服_通常_normal", 300, true);
	DeleteStand("bu梢_制服_通常_smile", 0, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500420ko">
「こずぴぃが最初に見えたときは、ハムポンポンが死んじゃったとき」

ハムポンポン？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500430ko">
「小学生のとき飼ってたハムスター」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500440ko">
「ほいで、ハムポンポンのお墓を作ってあげよーうって、土手に行ったのら」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500450ko">
「でもスコップ忘れて、お墓作れなくて、ふみゅーって泣いていたら」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500460ko">
「お空に、この剣の形が見えた」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500470ko">
「それからは、いろんなところでよく見るようになったのら」

どうやって手に入れた？

僕は結局、ディソードを見つけたものの、つかめなかった。どれだけ手を伸ばしても、手応えはなくて、つかめなかったんだ……。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500480ko">
「ただ、願ったんだよ」

願った？
手に入れたい、って？
でもそれなら僕だって――

と、こずぴぃは上目遣いで僕を見て、かすかに首を振った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500490ko">
「ちがーうのだ」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500500ko">
「願ったのはね」

{	SetVolume("SE01", 500, 1, null);
	Stand("bu梢_制服_通常","shy2", 500, @-150);
	FadeStand("bu梢_制服_通常_shy2", 300, true);
	DeleteStand("bu梢_制服_通常_normal", 0, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500510ko">
「……殺してやりたい、っていうこと」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14500520ta">
「……え？」

{	SetVolume("SE01", 3000, 600, null);
	Stand("bu梢_制服_通常","normal", 500, @-150);
	FadeStand("bu梢_制服_通常_normal", 300, true);
	DeleteStand("bu梢_制服_通常_shy2", 0, true);}
彼女の心の声は、はっきりと僕の頭の中に響く。
聞き間違いとかじゃない。
今、はっきりと言った。

“殺してやりたいと願った”って。
はにかみながら、言ったんだ。

Ｒｏｆｔの５階から６階へ上る階段には、店内のＢＧＭがかすかに届くくらいで、とても静か。

僕も、彼女も、一言も発しない。
誰かの息づかいが、やけに耳につく。

それは彼女のもの？

いや、僕自身のものだ。

誰も、来ない階段。

渋谷っていう街の中心にある、死角。エアポケット。

僕は、渇いたのどを潤すために、唾を飲み込んだ。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500530ko">
「そう願いながら、みゅーって空見たら、また剣が見えて」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500540ko">
「でもでもー、そのときまで、剣とは思ってなかったよ。
なんだかガキーンってしたものって思ってた」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500550ko">
「あれでブーン！　ってやったら殺せるかなーって、
無意識に手を伸ばしたら……」

{	Stand("bu梢_制服_通常","smile", 500, @-150);
	FadeStand("bu梢_制服_通常_smile", 300, true);
	DeleteStand("bu梢_制服_通常_normal", 0, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500560ko">
「ホントに、つかめたのらー」

それで……どうしたの？
なにを、したの？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面","sad", 500, @-150);
	DeleteStand("bu梢_制服_通常_smile", 500, false);
	FadeStand("bu梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14500570ko">
「…………」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500580ko">
「殺そうとしたけど、できなかった」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500590ko">
「こずぴぃの力じゃ、半殺しにするのが精一杯だったのでーす」

この子は……壊れてる……。

{	Stand("bu梢_制服_通常","angry", 500, @-150);
	DeleteStand("bu梢_制服_正面_sad", 500, false);
	FadeStand("bu梢_制服_通常_angry", 500, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14500600ko">
「壊れてなーいよ、ぷんぷん。ここに剣あるもーん」

彼女が、傍らに置かれたディソードを愛おしそうに見つめるその態度からは、まさに絶対的信頼を置いていることが見て取れた。彼女の心もまた、僕にそう告げていて。

僕も、これくらい壊れなきゃ、ディソードを手に入れられないのかな。

……そもそも僕は、まだ、壊れてなかったのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
	
	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*", 2000, 0, false);

	Wait(1000);
	
//～～Ｆ・Ｏ
	PrintBG(1000);
	
	Wait(1500);


}