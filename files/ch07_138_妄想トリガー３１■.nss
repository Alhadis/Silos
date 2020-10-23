//<continuation number="460">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_138_妄想トリガー３１■";
		$GameContiune = 1;
		Reset();
	}

		ch07_138_妄想トリガー３１■();
}


function ch07_138_妄想トリガー３１■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//ＢＧ//教室
	CreateBG(100, 0, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);


//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐４へ
//ネガティブ妄想→分岐５へ
//妄想しない→分岐６へ

if($妄想トリガー通過３１ == 0)
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
			$妄想トリガー３１ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー３１ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー３１ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー３１ == 2)
{
//☆☆☆
//分岐４

//ＳＥ教室
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);
	
//ＢＧ//教室
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
例えば――

クラスの女子の誰かに、エロゲーに出てきそうな淫語を口走りながら抱きついてみるとか。

可能ならそのまま、朝の教室で衆人環視の陵辱プレイに突入だ、ふひひ。

僕は半ば開き直って、教室の中を見回した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 200, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");
	Fade("背景２", 1000, 1000, null, true);
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
標的は誰がいいだろう。どうせならかわいくて、あんまり抵抗されなさそうな子がいい。

ＤＱＮ女どもは論外だ。あいつらは高校生のくせに化粧が濃すぎで、まったく魅力を感じない。

そうだな……あの転校生なんかいいかもしれない。

見るからにおとなしそうだし。ついいじめたくなっちゃいそうなロリ属性オーラが全身からにじみ出てるし。

それにあの子って、確かドジっ娘属性だったよな。その辺も萌える。ある意味で二次元キャラに近い。

うん、いいかもしれないな……ふひひ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("SE01");

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	DelusionIn();

	CreateBG(100, 0, 0, 0, "cg/bg/bg017_02_0_教室_a.jpg");

	DelusionIn2();

//ＳＥ教室
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
僕はゆらりと立ち上がった。

周囲の空気が変わる。

{	SoundStop("SE01");}
さっきまで僕を挑発し嘲笑していた連中も、
僕の突然の行動を見て少し後ずさっている。
ふん、お前ら結局口だけか。

でも僕は違うぞ。
やるときはやる男なんだ。
それを今証明してやる。

無言のまま、転校生の席へと向かった。

{	Stand("bu梢_制服_正面","normal", 200, @+100);
	FadeStand("bu梢_制服_正面_normal", 500, false);}
転校生は自身の席で身を縮こまらせ、うつむいて座っている。

{	Stand("bu梢_制服_正面","sad", 200, @+100);
	FadeStand("bu梢_制服_正面_sad", 300, false);
	DeleteStand("bu梢_制服_正面_normal", 300, true);}
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800010ko">
「……？」

僕に気付いた転校生が、いぶかしげに見上げてきた。
なぜかもうすでに泣きそうな顔をしている。

その細い二の腕を、僕はいきなりつかんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH05", 0, 1000, true);
	Stand("bu梢_制服_通常","sad", 200, @+100);
	DeleteStand("bu梢_制服_正面_sad", 200, false);
	FadeStand("bu梢_制服_通常_sad", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆びっくり
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800020ko">
「……っ」

そのまま引き寄せようとした。
転校生は弱々しい力でそれに抵抗する。

戸惑っているのか、どうしたらいいか分からない様子で周囲と僕とを交互に見つめてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("huhi1", 500, 0, 0, "cg/ev/ev013_01_1_拓巳笑い口UP_a.jpg");
	CreateTextureEX("huhi2", 800, 0, 0, "cg/ev/ev013_02_1_拓巳笑い口UP_a.jpg");
	Fade("huhi1", 500, 1000, null, true);
	Fade("huhi2", 1000, 1000, null, true);
	Delete("huhi1");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800030ta">
「ふひ……ふひひ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("huhi2", 500, 0, null, true);
	Delete("huhi2");

	CreateSE("SE02","SE_衝撃_衝撃音03");
	MusicStart("SE02", 0, 500, 0, 700, null, false);
	Shake("背景２", 500, 5, 5, 0, 0, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
僕はかなり強引に、転校生に背中から抱きついた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("ちんすこう１", 500, 0, 0, "cg/ev/ev138_01_1_梢ちんすこう_a.jpg");
	Fade("ちんすこう１", 0, 0, null, true);
	Fade("ちんすこう１", 500, 1000, null, true);
	DeleteStand("bu梢_制服_通常_sad", 200, true);
	Delete("back*");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601901]
その身体はやっぱりすごく細くて、乱暴に扱ったらぽっきりと折れちゃうんじゃないかと思うほどだった。それに、チワワみたいにプルプルと震えている。

でも……いい匂いがする……。

僕よりも頭ひとつ分低いところにある転校生の頭に、自分の顔をこすりつけた。
柔らかい髪の中に鼻を埋め、匂いを嗅ぐ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("ちんすこう２", 500, 0, 0, "cg/ev/ev138_02_1_梢ちんすこう_a.jpg");
	Fade("ちんすこう２", 0, 0, null, true);
	Fade("ちんすこう２", 500, 1000, null, true);
	Delete("ちんすこう１");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆怯えるブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800040ko">
「……っ、……っ！？」

転校生は怯えているらしく、声も出せないでいた。
っていうかこの女が喋っているところを僕は見たことないけど。

転校生は身をよじらせて僕の手から逃れようとしている。だけど、その力は全然大したことがなかった。

//普段まったく運動なんてしない、筋肉量ゼロの僕でさえ簡単に抑え込むことができた。
普段まったく運動なんてしない、筋肉量ゼロの僕でさえ簡単に押さえ込むことができた。

周囲のＤＱＮどもは、僕の奇行に面食らっているのか、誰もが凍り付いたように動かない。

//◆怯えるブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800050ko">
「……っ」

首をふるふると振っている転校生の耳たぶを、僕はべろりと舐めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("ちんすこう４", 500, 0, 0, "cg/ev/ev138_04_1_梢ちんすこう_a.jpg");
	Fade("ちんすこう４", 0, 0, null, true);
	Fade("ちんすこう４", 500, 1000, null, true);

	Delete("ちんすこう２");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800060ko">
「――――っ」

ビクン、と転校生の華奢な身体が弾む。

いいねえ、そのリアクション、たまりませんなあ。

だんだん興奮してきたぞ。もう後のことなんてなにも考えずに、欲望の赴くままに行動してやる。

まずは淫語だ。
淫らな言葉をこの気弱な転校生に言わせてやろう。
ふひひ、なんというエロス。

//※※３６０以下
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800090ta">
「レマン湖って言え」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("ちんすこう２", 500, 0, 0, "cg/ev/ev138_02_1_梢ちんすこう_a.jpg");
	Fade("ちんすこう２", 0, 0, null, true);
	Fade("ちんすこう２", 500, 1000, null, true);

	Delete("ちんすこう４");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆泣く
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800080ko">
「…………」

転校生は顔をみるみる紅潮させた。涙を目にためながら、それまで以上に必死に首を振る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800110ta">
「栗とキリギリスって言え」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("ちんすこう４", 500, 0, 0, "cg/ev/ev138_04_1_梢ちんすこう_a.jpg");
	Fade("ちんすこう４", 0, 0, null, true);
	Fade("ちんすこう４", 500, 1000, null, true);

	Delete("ちんすこう２");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//◆泣く
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800100ko">
「……っ」

嫌がってる仕草に、ますます嗜虐心をかき立てられる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800070ta">
「ちんすこうって言え」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateTexture360("ちんすこう３", 500, 0, 0, "cg/ev/ev138_03_1_梢ちんすこう_a.jpg");
	Fade("ちんすこう３", 0, 0, null, true);


	SetVolume360("CH*", 200, 0, null);

	Wait(500);
	Fade("ちんすこう３", 100, 1000, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//◆元気よく
//【梢】
<voice name="梢" class="梢" src="voice/chn00/00600010ko">
「ちんすこう♪」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn00/00600020ta">
「え！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//※※３６０以上

//PC版
/*
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800070ta">
「ちんすこうって言え」

//◆泣く
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800080ko">
「…………」

転校生は顔をみるみる紅潮させた。涙を目にためながら、それまで以上に必死に首を振る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800090ta">
「レマン湖って言え」

//◆泣く
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800100ko">
「……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800110ta">
「栗とキリギリスって言え」

//◆泣く
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800120ko">
「っ」

嫌がってる仕草に、ますます嗜虐心をかき立てられる。

これはもう、この場で公開陵辱するしかないな。『陵辱学園２年蜜組』っていうエロゲーにあった、僕の気に入っているＨシーンを再現してやろう。

自分の手を、ゆっくりと転校生の胸からお腹へと這わせていく。

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800130ko">
「――っ」

転校生はビクンビクンと身を震わせている。
だんだん抵抗する力が弱まってきていた。

『悔しい、でも感じちゃう！』っていう感じか？

ふひひ、かわいい顔してなんという淫乱。

僕はこみ上げてくる笑みを隠さず、ニヤニヤと頬を緩めながら、転校生のスカートの中へと手を突っ込んだ――

//◆声にならない悲鳴
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800140ko">
「ぁ――っ」
*/

	BGMPlay360("CH0*", 0, 0, false);
	Delete("ちんすこう２");

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//教室
	DelusionOut();

	DeleteStand("bu梢_制服_正面_sad", 0, true);
	Delete("*");
	
	CreateBG(100, 0, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");

	DelusionOut2();
	PositiveHuman();

//ＳＥ教室
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

//おがみ：シナリオ修正　12/18
//自分の席でうつむいたまま、そんな妄想に耽る。
//脳内ではいまや、転校生はあられもない姿で身悶え、可愛らしいあえぎ声を上げていた。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
ま、まあ、最後のはともかくとして……。

僕は自分の席でうつむいたまま、脳内で転校生に屈辱的な行為の数々をやらせてみた。

ふひひ。たまらん。

どうせ人生が終わりになるなら、最後はそれぐらい楽しい思いを味わってから終わりたいよね。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//合流２へ
}


//=============================================================================//

if($妄想トリガー３１ == 1)
{
//☆☆☆
//分岐５

//ＳＥ教室
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

//ＢＧ//教室
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Fade("背景１", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
例えば――

奇声を発してイスを持ち上げ、ＤＱＮに襲いかかってみるとか。

調子に乗っているバカどもに怒りの鉄槌をかましてやれたら、気持ちいいだろうな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("SE01");

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	DelusionIn();

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg017_02_0_教室_a.jpg");

	DelusionIn2();

//ＳＥ教室
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
僕はゆらりと立ち上がった。

ＤＱＮどもは、これから自分たちの身に神の裁きが下るとも知らずに、相変わらず僕を見てニヤニヤ笑っている。

僕は無造作にイスを持ち上げる。

それを頭上に掲げ持ち、さっき最初に僕をバカにしたＤＱＮへと歩み寄る。
僕の突然の行動に、ＤＱＮはニヤニヤ顔のまま凍り付いていた。

//ガヤ停止
{	SetVolume("SE01", 500, 0, null);}
//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/ch07/13800150ec">
「……あ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800160ta">
「あああああああっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//イスを振り下ろす
	CreateSE("SE02","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
//ＳＥ//イスで人の頭を殴る
	CreateSE("SE03","SE_衝撃_打撃_殴る");
	Shake("背景１", 400, 0, 10, 0, 0, 500, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
//ＳＥ//血が飛び散る
	CreateSE("SE04","SE_じん体_動作_と血");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("血", 2000, 0, 0, 1280, 720, "RED");
	DrawTransition("血", 300, 0, 1000, 100, null, "cg/data/ランダム.png", true);

	Fade("血", 300, 0, null, true);

	BGMPlay360("CH06", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
躊躇なくイスを振り下ろしたら、そいつの頭にまともに当たった。

手応えが確かにあった。

ＤＱＮ男はその場に倒れ、瞬く間に床に血だまりが広がっていく。

{	SetVolume("SE01", 0, 0, null);}
一瞬、教室内が静寂に包まれ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//教室にクラスメートたちの悲鳴が響き渡る
	CreateSE("SE05","SE_はいけい_生と_悲鳴とどよめき_2");
	MusicStart("SE05", 0, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
すぐに大混乱になった。
男子も女子も悲鳴を上げ、僕に恐怖の瞳を向けて我先にと逃げ出していく。

僕はそいつらの醜態を悠然と眺めながら、足許に倒れてピクリとも動かないＤＱＮに、もう一度イスを全力で振り下ろした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//イスを振り下ろす
	CreateSE("SE02","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
//ＳＥ//イスで人の頭を殴る
	CreateSE("SE03","SE_衝撃_打撃_殴る");
	Shake("背景１", 400, 0, 10, 0, 0, 500, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	
	CreateColor("赤", 1000, 0, 0, 1280, 720, "Red");
	Fade("赤", 0, 700, null, true);
	Fade("赤", 500, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
ＤＱＮの身体がビクンと痙攣する。

でも気を失ったのかもうすでに死んでいるのか、声は出さなかった。

なんだか怖くなってきた。

ここで手を抜いたら、いつ起き上がってきて反撃してくるか分からない。

ＤＱＮのことだからカバンの中にナイフのひとつでも持ち歩いているかもしれない。

人生が終わることにはもうあきらめもついたけど、痛いのはイヤだ。

殺さないと……。
確実に死ぬまで、手を抜いちゃダメだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//イスを振り下ろす
	CreateSE("SE02","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
//ＳＥ//イスで人の頭を殴る
	CreateSE("SE03","SE_衝撃_打撃_殴る");
	Shake("背景１", 400, 0, 10, 0, 0, 500, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	
	Fade("赤", 0, 700, null, true);
	Fade("赤", 500, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
ＤＱＮの頭に三度、イスをぶち当てる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	MusicStart("SE05", 6000, 0, 0, 1000, null, false);

//ＳＥ//イスを振り下ろす
	CreateSE("SE02","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
//ＳＥ//イスで人の頭を殴る
	CreateSE("SE03","SE_衝撃_打撃_殴る");
	Shake("背景１", 400, 0, 10, 0, 0, 500, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	
	Fade("赤", 0, 700, null, true);
	Fade("赤", 500, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
さらにもう一度――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//イスを振り下ろす
	CreateSE("SE02","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
//ＳＥ//イスで人の頭を殴る
	CreateSE("SE03","SE_衝撃_打撃_殴る");
	Shake("背景１", 400, 0, 10, 0, 0, 500, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Fade("赤", 0, 700, null, true);
	Fade("赤", 500, 0, null, true);
	Wait(500);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
もう一度――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//イスを振り下ろす
	CreateSE("SE02","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
//ＳＥ//イスで人の頭を殴る
	CreateSE("SE03","SE_衝撃_打撃_殴る");
	Shake("背景１", 400, 0, 10, 0, 0, 500, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Fade("赤", 0, 700, null, true);
	Fade("赤", 500, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
もう一度――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//イスを振り下ろす
	CreateSE("SE02","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
//ＳＥ//イスで人の頭を殴る
	CreateSE("SE03","SE_衝撃_打撃_殴る");
	Shake("背景１", 400, 0, 10, 0, 0, 500, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Fade("赤", 0, 700, null, true);
	Fade("赤", 500, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
もう一撃――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 0, 0, false);
	Delete("赤");
//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//ＢＧ//教室
	DelusionOut();

	Delete("*");
	CreateBG(100, 0, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Request("レンズ１", UnLock);
	Delete("レンズ１");
	
	DelusionOut2();
	NegativeHuman();

//ＳＥ教室
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
自分の席でうつむいたまま、そんな妄想に耽る。

ふひひ。なんていう快感なんだ。

今の僕の脳内はちょっとしたスプラッタホラーだ。
ああ、本気で全員ぶち殺してやりたい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//合流２へ
}


//=============================================================================//

if($妄想トリガー３１ == 0)
{
//☆☆☆
//分岐６

//ＳＥ教室
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

//ＢＧ//教室
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Fade("背景１", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
脳内でＤＱＮどもをぶち殺して、憂さを晴らしてみる。
でもそんなんじゃこの屈辱はおさまらない。

しかもさっきのＤＱＮどもは、なおも教室中に響き渡るようなやかましい声で、僕を挑発してくる。

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/ch07/13800170ec">
「なあ、お前なんで死なないの？」

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/ch07/13800180ec">
「生きてるのキツくね？」

//【生徒Ａ】
<voice name="生徒Ａ" class="生徒Ａ" src="voice/ch07/13800190ea">
「オレら手伝ってやろうか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//以下、同時に
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【生徒Ａ】
<voice name="生徒Ａ" class="生徒Ａ" src="voice/ch07/13800200ea">
「ギャハハハハハハ」

//【生徒Ｂ】
<voice name="生徒Ｂ" class="生徒Ｂ" src="voice/ch07/13800210eb">
「ギャハハハハハハ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――
//以上、同時に

/*
//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/ch07/13800220ec">
「ギャハハハハハハ」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch07/13800230wa">
「ギャハハハハハハ」

//【女子Ｂ】
<voice name="女子Ｂ" class="女子Ｂ" src="voice/ch07/13800240wb">
「ギャハハハハハハ」

//【女子Ｃ】
<voice name="女子Ｃ" class="女子Ｃ" src="voice/ch07/13800250wc">
「ギャハハハハハハ」
*/

	SoundStop("SE01");
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800260ta">
「…………」

僕は耳を塞いで必死に耐えた。

殺してやりたい。

こいつら全員、僕がディソードで血祭りに上げてやりたい。僕の振るった剣が、こいつらの頭をかち割り、心臓をえぐり出し、胴体を真っ二つにする姿を想像する。

死ね……。

死ね……！

死ね！

死ねっ！

ディソードは持ってないけど、長い包丁ならどこででも買える。
こいつらのウジ虫以下の命を、自分自身の手で踏み潰してやりたかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流２へ
}


//=============================================================================//

//☆☆☆
//合流２

	BGMPlay360("CH01", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
考えれば考えるほど、やってみたいっていう衝動に駆られる。

その無茶な行動を取った瞬間に、世界はリセットされて、“選ぶと不幸になる方の選択肢”の疑似体験は終了するかもしれない。

そして元の世界に戻る。

そこには梨深がちゃんといて。
三住くんも馴れ馴れしく話しかけてきて。
みんな、僕の醜態をきれいさっぱり忘れてて。

誰も僕をバカにしたりしない。

――やってみようかな。

頭の芯がボーッとする。
なんだか熱っぽいかも。

知恵熱ってやつ？
それとも妄想熱かな？　そんな言葉ないけど。

まあ、どうでもいいや。

――やってみようかな。

元の世界に戻れなかったとしても、頭がおかしい奴だって思われるだけだし。いや、もうすでに思われてるのか。もう失うものはないからどうでもいいさ。

一週間前、七海が生きてることを看護師さんに知らされたあのとき、僕は思ったはずだ。

七海が生きていたんだから、他はどうでもいいって。
僕の人生だって、どうでもいいんだ。

変人扱いされて病院送りになったって構わない。

あやせと同じ病院だといいな。
あやせはどこに入院したんだろう？

昔入れられてたっていう、あの牢屋みたいな病院かな？

それでもいい。
梨深のいないこの学校より、
少しはマシだ。

マグマのような衝動を抑えることができなくなっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg017_02_0_教室_a.jpg");
	Fade("背景２", 500, 1000, null, true);
//	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left2.png", true);
	Delete("背景１");
	Delete("back*");
	
	SoundStop("SE*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601021]
僕はゆっくりと立ち上がる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800270ta">
「ふひひ……」

ついつい、笑いがこみ上げてしまう。
クラス中のみんなが、表情を引きつらせて僕に注目している。

――見るな。

僕なんか、見られる価値もないんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 500, 0, null);

//※以下、梢の声はすべて『心の声』なので、ボイスエフェクトかけてください
//ここでは声の正体が梢だとは分からない

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800280ko">
「価値なら――」

唐突に、

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800290ko">
「あるよ！」

聞こえてきたのは、

{	BGMPlay360("CH12",0,1000,true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800300ta">
「…………？」

女子の、声……。

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800310ko">
「い、いっぱーいある！」

しかも、なんというアニメ声……。

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800320ko">
「この前、飛び降り自殺しようとした人を助けたのは、
西條くんだもん！」

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800330ko">
「だから、だから西條くんには沢山たーくさん価値はあるよっ」

だ……誰だ？
いったい、誰が話しかけてきてる？

僕はもう一度、教室を見回した。
みんな、僕の不審な行動に凍り付いたまま口を閉ざしている。
喋ってる人間なんて、見当たらない。

そもそも今の声――
まるで、頭の中に直接響いてきたような、奇妙な感覚があった。

幻聴？
それとも僕はまた、妄想の女子を作り出した？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800340ko">
「幻聴なんかじゃ、ないのら」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800350ta">
「……！」

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800360ko">
「妄想でもなーい」

え？　い、今の、なんだ……？

僕が想ったことに対して返事があったぞ。

心を、読まれた？

いや、やっぱり妄想か……。

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800370ko">
「こずぴぃは、ここにいるよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800380ta">
「こずぴぃって、なんだよ！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800390ta">
「こ、ここって、どこ！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/13800400ta">
「誰なの！？」

叫ぶと、周囲のクラスメイトが、逃げるように僕から距離を取る。

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800410ko">
「西條くんに価値がないなんて、そんなの全然ぜーんぜん違う」

声は僕の問いかけには答えない。

奇妙な言葉遣いで、なおも語りかけてくる。

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800420ko">
「むしろ、むーしーろー」

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800430ko">
「西條くんのことをひどく言う、クラスのみんなの方が――」

{	SetVolume360("CH12", 200, 0, null);}
//◆明るく
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800440ko">
「価値が、ないから」

ゾクリとした。
鳥肌が立った。

とても明るい調子で、
その声は、こう言った。

//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800450ko">
「いいと思うのら」

//◆明るく
//【梢】
<voice name="梢" class="梢" src="voice/ch07/13800460ko">
「殺しても♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg018_04_0_教室席視線_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	DrawTransition("背景１", 300, 0, 1000, 100, null, "cg/data/right.png", true);
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
……もう、やめてくれ。

僕は自分の席にうずくまって、頭を抱えた。

{#TIPS_並行世界 = true;$TIPS_on_並行世界 = true;}
世界はリセットされることもなくて。
梨深がいる<FONT incolor="#88abda" outcolor="BLACK">並行世界</FONT>に戻ることもなくて。

{$TIPS_on_並行世界 = false;}
どうやら、僕は、
完全に、おかしくなっちゃったみたいだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	Wait(1500);
	
}