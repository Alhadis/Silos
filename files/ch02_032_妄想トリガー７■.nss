//<continuation number="880">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_032_妄想トリガー７■";
		$GameContiune = 1;
		Reset();
	}

		"ch02_032_妄想トリガー７■";
}


function ch02_032_妄想トリガー７■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("背景２", 100, 0, 0, 1280, 720, "White");
	Stand("st星来_覚醒前_通常","normal", 200, @0);
	FadeStand("st星来_覚醒前_通常_normal", 0, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Delete("色２");

//=============================================================================//
//妄想トリガー分岐
//ポジティブ妄想→分岐４へ
//ネガティブ妄想→分岐５へ
//妄想しない→分岐６へ
//=============================================================================//

if($妄想トリガー通過７ == 0)
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
			$妄想トリガー７ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー７ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー７ = 0;
		}
	}
}


//=============================================================================//
if($妄想トリガー７ == 2)
{
//分岐４
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume360("CH*", 0, 0, null);
	SetVolume360("SE*", 0, 0, null);

	DelusionIn();

	ClearAll(0);
	CreateColor("背景１", 400, 0, 0, 1280, 720, "Black");

	DelusionIn2();



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200010se">
「帰らなくてもいいよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200020ta">
「……どういうこと？」

//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200030se">
「迎えに来たから」

耳元から、やけにリアルなささやきが聞こえた。

頬を、つんつんとつつかれた……ような気もした。

ゆっくりと目を開いてみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH07",2000,1000,true);

//ＢＧ//カーテンが閉まったベッド
//ＣＨ//星来
//※星来は制服バージョン

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg101_01_1_AHベッド_a.jpg");
	Stand("st星来_制服_通常","normal", 200, @0);
//	Move("st星来_制服_通常_normal", 0, @0, @100, Axl1, true);
	FadeStand("st星来_制服_通常_normal", 0, true);
	DrawTransition("背景１", 1000, 1000, 0, 100, null, "cg/data/lcenter2.png", true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200040se">
「おはよ、ぼけなす♪」

ベッドの脇に、星来たん（変身前・<RUBY text="あまのがわ">天之河</RUBY><RUBY text="せいら">星来</RUBY>ｖｅｒ）が立っていた。

１／８スケールとかじゃない。

等身大だ。しかも滑らかに動いてる。

僕は息を呑み、身体を起こしつつ星来たんの胸をつついてみた。

{	Zoom("st星来_制服_通常_normal", 50, 1020, 1020, Dxl2, true);
	Zoom("st星来_制服_通常_normal", 50, 1000, 1000, Dxl2, true);
	Stand("st星来_制服_通常","ero", 200, @0);
//	Move("st星来_制服_通常_ero", 0, @0, @100, null, true);
	FadeStand("st星来_制服_通常_ero", 200, false);
	DeleteStand("st星来_制服_通常_normal", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200050se">
「あ……んっ♪」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200060ta">
「お、おおお！？」

プニプニだった。

フィギュアじゃない。

ほ、ほ、本物だ。
星来たんが三次元に降臨した！

{	Stand("st星来_制服_通常","happy", 200, @0);
//	Move("st星来_制服_通常_happy", 0, @0, @100, null, true);
	FadeStand("st星来_制服_通常_happy", 200, false);
	DeleteStand("st星来_制服_通常_ero", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200070se">
「ノンノン。ここは二次元だよ」

え、そうなの？
こんなにプニプニなのに？

{	Stand("st星来_制服_通常","normal", 200, @0);
//	Move("st星来_制服_通常_normal", 0, @0, @100, null, true);
	FadeStand("st星来_制服_通常_normal", 200, false);
	DeleteStand("st星来_制服_通常_happy", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200080se">
「二次元的にプニプニなんさ」

意味は分からないけど、とりあえずプニプニだからそれでいいや。

っていうか、驚きのあまりつい胸をタッチしちゃったけど……急に恥ずかしくなってきた。

等身大の星来たんはすごくかわいい。萌え死ねる。そしてリアルだ。

だからこそ、胸を触っちゃったことへの後ろめたさや、星来たんに嫌われちゃうかもっていう想いが強くなってくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200090ta">
「ごめん、星来たん……」

{	Stand("st星来_制服_通常","ero", 200, @0);
//	Move("st星来_制服_通常_ero", 0, @0, @100, null, true);
	FadeStand("st星来_制服_通常_ero", 200, false);
	DeleteStand("st星来_制服_通常_normal", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200100se">
「……タッキーなら、いいよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200110ta">
「ホ、ホント？」

{	Stand("st星来_制服_通常","happy", 200, @0);
//	Move("st星来_制服_通常_happy", 0, @0, @100, null, true);
	FadeStand("st星来_制服_通常_happy", 200, false);
	DeleteStand("st星来_制服_通常_ero", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200120se">
「うん。他の人には、こんなことされるのはイヤだけどさ」

{	Stand("st星来_制服_通常","angry", 200, @0);
//	Move("st星来_制服_通常_angry", 0, @0, @100, null, true);
	FadeStand("st星来_制服_通常_angry", 200, false);
	DeleteStand("st星来_制服_通常_happy", 200, false);}
//◆ささやき
//※ススム＝ブラチューの主人公。第１章参照。
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200130se">
「特にススムとか。あいつに胸触られたら、金棒で月までぶっ飛ばしちゃってる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200140ta">
「ふ、ふひひ」

{	Stand("st星来_制服_通常","normal", 200, @0);
//	Move("st星来_制服_通常_normal", 0, @0, @100, null, true);
	FadeStand("st星来_制服_通常_normal", 200, false);
	DeleteStand("st星来_制服_通常_angry", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200150se">
「シッ、静かに。声出すと、看護師さんたちに見つかっちゃうっしょ」

星来たんはカーテンの外を気にしてるようだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st星来_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
そして、音を立てないようにしながら靴を脱ぐと、ベッドに上がってきた。僕の腰の上にまたがる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200160ta">
「ちょっ……」

また声を出しそうになって、慌てて口を手で塞ぐ。

せ、星来たんが僕の上にまたがってる……。

スカートの中の、生パンツが……僕の股間に当たってる……。
まずい、僕のムスコが暴れ出しそうだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu星来_制服_通常","ero", 200, @0);
//	Move("bu星来_制服_通常_ero", 0, @0, @100, null, true);
	FadeStand("bu星来_制服_通常_ero", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200170se">
「うふっ」

星来たんが、顔を寄せてくる。
いい香りがする。これが星来たんの匂い……。

//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200180se">
「ねえねえタッキー」

//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200190se">
「タッキーも、二次元になっちゃうべきだよ」

ど、どういうこと……？

{	Stand("bu星来_制服_通常","normal", 200, @0);
//	Move("bu星来_制服_通常_normal", 0, @0, @100, null, true);
	FadeStand("bu星来_制服_通常_normal", 200, false);
	DeleteStand("bu星来_制服_通常_ero", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200200se">
「タッキーはまだ三次元なんさ」

//◆ささやき
//◆したげる＝してあげる
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200210se">
「だからぁ、あたしが二次元にしたげる」

{	Stand("bu星来_制服_通常","happy", 200, @0);
//	Move("bu星来_制服_通常_happy", 0, @0, @100, null, true);
	FadeStand("bu星来_制服_通常_happy", 200, false);
	DeleteStand("bu星来_制服_通常_normal", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200220se">
「いいっしょ？」

そんなこと、できるの？

//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200230se">
「できるよ。それに――」

{	Stand("bu星来_制服_通常","ero", 200, @0);
//	Move("bu星来_制服_通常_ero", 0, @0, @100, null, true);
	FadeStand("bu星来_制服_通常_ero", 200, false);
	DeleteStand("bu星来_制服_通常_happy", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200240se">
「すっごく、気持ちいいよ」

周囲からは、看護師さんたちがせわしなく歩き回っている音や、先生が他の患者を診ている声が聞こえてくる。

カーテンを一枚隔てただけの、この空間。
もしカーテンを開いたら確実にバレる。

そのドキドキと、病院でこんなことをしているっていう背徳感で、頭がクラクラする。

しかも、この淫靡な行為の相手が、いまや僕の一番お気に入りの嫁である星来たんなんて。
ああ、なんて幸せなんだ……。

もう他のことなんてなにも考えられなかった。
だから、ただただ星来たんの言うままに、僕はうなずいてしまっていた。

{	Stand("bu星来_制服_通常","happy", 200, @0);
//	Move("bu星来_制服_通常_happy", 0, @0, @100, null, true);
	FadeStand("bu星来_制服_通常_happy", 200, false);
	DeleteStand("bu星来_制服_通常_ero", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200250se">
「そう来なくっちゃ♪」

{	Stand("bu星来_制服_通常","ero", 200, @0);
//	Move("bu星来_制服_通常_ero", 0, @0, @100, null, true);
	FadeStand("bu星来_制服_通常_ero", 200, false);
	DeleteStand("bu星来_制服_通常_happy", 200, false);}
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200260se">
「そんなタッキーが、好き……」

{	DeleteStand("bu星来_制服_通常_ero", 500, true);}
そして、星来たんが、僕の口に強く唇を押しつけてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//星来と濃厚なキスをする拓巳
	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev022_01_1_星来キス妄想_a.jpg");
	Fade("背景１", 1000, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200270ta">
「ん……」

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200280se">
「んふ……っ」

な、なんて柔らかいんだ……っ。
これも、二次元的な柔らかさなのかな。それってリアルよりも柔らかいのかな。

このエロ展開になかなか思考がついていかない。自分からなにかするなんて、考えも付かない。

目を白黒させているうちに、星来たんの舌が僕の唇を割って侵入してくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200290ta">
「ん――！？」

目が回りそうなくらいの快感。

キスが、こんなに気持ちいいものだったなんて。
ああ、艶めかしくうごめくその舌に、いつまでも口を犯されていたい……。

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200300se">
「ん……んふ」

僕は星来たんの腰を抱きしめた。

でもその身体はペラペラだ。二次元だからだ。プニプニだけど、ペラペラなんだ。

紙とキスしてるようなものか。
だけどすごく気持ちいいから気にならない。気にする余裕もない。

星来たん、テラエロス……。

//◆吸う
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200310se">
「ずっ……ぐぷっ……んぐっ……」

僕の舌を、星来たんが吸う。
もう死にそうだ。耐えられない。

//◆吸う
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200320se">
「んぶっ……ぐりゅっ……ずひっ……」

……だんだん、痛くなってくる。

星来たんの吸引力がすさまじい。
僕は舌を引っ込めようとする。

でもできない。
さらに吸われる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200330ta">
「んぐっ……ぐひ……ぎ……」

引っ張られる。
千切れそうなくらいに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	Fade("色１", 0, 700, null, true);
	Fade("色１", 500, 0, null, true);
	BGMPlay360("CH07",3000,500,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
舌だけじゃない。

のどの奥が熱い。

眼球が飛び出しそうになる。

息を吸えない。
胸が苦しい。

お腹の中をぐちゃぐちゃにかき回されているかのよう。

吸われる……。

全部、なにもかも、僕の身体の中のものが、内臓が、肉が、骨が、星来たんに吸われていく。

{	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	SoundPlay("SE03", 0, 1000, false);
	Fade("色１", 0, 700, null, true);
	Fade("色１", 500, 0, null, true);}
のどを、ドクンドクンと脈打つ心臓がせり上がってくるのを感じた。心臓に繋がるいくつもの太い血管が、体内でブチブチと千切れていく。

あり得ない感覚だった。

{	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	SoundPlay("SE03", 0, 1000, false);
	Fade("色１", 0, 700, null, true);
	Fade("色１", 500, 0, null, true);}
すごく痛かった。
だけど、それ以上に気持ちよかった。

全身が性感帯になっていた。
文字通り、全身。

体表だけじゃなくて。

{	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	SoundPlay("SE03", 0, 1000, false);
	Fade("色１", 0, 700, null, true);
	Fade("色１", 500, 0, null, true);}
のどの中も。
心臓も。

{	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	SoundPlay("SE03", 0, 1000, false);
	Fade("色１", 0, 700, null, true);
	Fade("色１", 500, 0, null, true);
	BGMPlay360("CH07",3000,1000,true);}
血管も。
肺も。
腸も。

体内を星来たんに蹂躙されて、それを吸われて、星来たんに食べてもらえることが、気絶しそうなくらいに嬉しくて、快感だった。

死ぬ……気持ちよすぎて死ぬ……！

//◆吸う
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200340se">
「ずりゅっ、ん、ぐぷっ、あ、ふっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200350ta">
「ごぽごぽ……げ、えええええええ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "White");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 1000, null, true);

	SoundPlay("SE02", 500, 0, false);
	Wait(2000);

//一度、ホワイトアウト
//ＢＧ//カーテンが閉まったベッド

	SetVolume360("CH07", 3000, 0, null);

	Fade("色１", 500, 1000, null, true);
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg101_01_1_AHベッド_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	DrawTransition("色１", 2000, 1000, 0, 100, null, "cg/data/lcenter2.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
僕の身体の中のすべてを吸い出して、星来たんは満足げに唇を離した。
彼女の口元に、血とよだれの入り混じったものが垂れている。

//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200360se">
「タッキーの……すごくおいしかった」

妖艶に微笑む。

僕はそれに答える気力もない。なにもかもを星来たんに奪われた。

こんなめくるめく快楽を味わったのは初めてで、放心状態だった。意識の中に霧が立ちこめて、思考がおぼろげになっている。

//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200370se">
「ほら、タッキー。自分の身体、見てみて」

//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200380se">
「タッキーもこれで二次元の住人だよ」

フラフラしながらも、ベッドから降りて立ってみる。
自分の身体が、星来たんと同じようにペラペラになっていた。

なんだか歩きにくい。
というかフニャフニャして、立っていられない。

僕は床に這いつくばるようにして、音もなく倒れる。
星来たん、起きられないよ。手を貸してよ……。

ベッドの上から、星来たんの声が届く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	Stand("st星来_制服_通常","happy", 200, @0);
//	Move("st星来_制服_通常_happy", 0, @0, @100, null, true);
	FadeStand("st星来_制服_通常_happy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//◆ささやき
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03200390se">
「二次元へようこそぉ♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
	SetVolume360("CH*", 100, 0, null);
	MusicStart("SE*", 100, 0, 0, 1000, null, false);

	DelusionOut();

	ClearAll(0);
	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg101_01_1_AHベッド_a.jpg");

	DelusionOut2();
	PositiveHuman();

//ＢＧ//カーテンが閉まったベッド
	CreateSE("SE04","SE_じん体_動作_のぞく");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateSE("SE02","SE_日常_雑踏02");
	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE03", 2000, 300, 0, 1000, null, true);
	MusicStart("SE02", 2000, 200, 0, 1000, null, true);
	Fade("色１", 0, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200400ta">
「……っ！」

飛び起きると、そこは相変わらずベッドの上だった。
心臓が早鐘を打っている。

……心臓は、僕の胸にまだちゃんとある。

自分の身体をあちこち触れてみた。
ペラペラじゃなかった。
まだ僕は三次元のままだ。

星来たんの姿はない。

……あるわけがない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200410ta">
「夢……か……」

よかったのか、悪かったのか……。

僕は無意識に、ため息をついていた。

あの展開は、前に買った『サークルぴるぽる』のブラチュー同人誌と同じだ。つまりそれを元に僕が妄想したってこと。

どうして夢の中で気付けなかったんだろう。気付かないから夢って言うのは分かっていても、そう思わずにはいられない。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200420hd">
「西條さん？」

カーテンの向こうから、僕を呼ぶ声がした。
すぐにそのカーテンが開き、さっきの看護師――葉月さんが顔を見せる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//ＢＧ//診察室

	CreateTexture360("背景１", 80, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Stand("bu志乃_白衣_通常","normal", 90, @150);
	FadeStand("bu志乃_白衣_通常_normal", 0, true);
	CreateSE("SE05","SE_じん体_動作_手_かーてん開ける");
	SoundPlay("SE05", 0, 1000, false);
	DrawTransition("背景２", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200430hd">
「おはようございます」

僕は目を伏せつつ、無言でペコリと頭を下げた。

{	Stand("bu志乃_白衣_通常","smile", 200, @150);
	FadeStand("bu志乃_白衣_通常_smile", 300, true);
	DeleteStand("bu志乃_白衣_通常_normal", 300, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200440hd">
「結局、３時間ぐっすりでしたね」

え、もう３時間……？

濃密すぎる夢を見ていたから、時間の感覚なんてなくなっていたけど、やっぱり疲れてたんだなあ。

{	Stand("bu志乃_白衣_通常","worry", 200, @150);
	FadeStand("bu志乃_白衣_通常_worry", 300, true);
	DeleteStand("bu志乃_白衣_通常_smile", 300, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200450hd">
「少しうなされていたみたいですけど、大丈夫？」

……エロい夢を見てました、なんてとても言えない。

というか、リビドー全開の自分が恥ずかしい。

{	Stand("bu志乃_白衣_通常","smile", 200, @150);
	FadeStand("bu志乃_白衣_通常_smile", 300, true);
	DeleteStand("bu志乃_白衣_通常_worry", 300, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200460hd">
「でも、夢遊病の症状は結局出ませんでしたよ」

僕を安心させるような口調で、葉月さんがそう教えてくれる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//合流２へ

}
//=============================================================================//





//=============================================================================//
if($妄想トリガー７ == 1)
{
//分岐５
//～～Ｆ・Ｏ

//アイキャッチ
//■【インターミッション番外編１】
//※“悪魔女視点”になります。（梨深ではないです。あくまで拓巳の妄想）

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume360("CH*", 0, 0, null);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();

	ClearAll(0);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");

	DelusionIn2();

	Wait(1000);

//ＢＧ//診察室

	CreateSE("SE02","SE_はいけい_びょういん_LOOP");
	MusicStart("SE02", 2000, 300, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
“彼女”が診察室のドアを開くと、医師がにこやかな顔で出迎えた。

{	Stand("st史男_白衣_通常","smile", 200, @-100);
	Move("st史男_白衣_通常_smile", 0, @0, @100, null, true);
	FadeStand("st史男_白衣_通常_smile", 500, true);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03200470tk">
「今日はどうしました？」

その問いかけを無視して、“彼女”は周囲を見回す。
あまり広くはない診察室だ。

医師のデスクの上には、白紙のカルテと、もう一枚、日本語ではない文字で色々と書き込んであるカルテが広げられている。

“彼女”は悪魔と呼ばれていた。
みんなそう呼ぶ。両親さえも。

最初から悪魔だったのか、そう呼ばれていたせいで悪魔になったのかは、今となってはどっちでもいいことだ。

とりあえず、この１ヶ月ほどで８人殺した。

世間では狂気だなんだと言って騒いでいるけど、“彼女”にしてみればどうってことない数字だった。

だって、悪魔だから。

{	Stand("st史男_白衣_通常","normal", 200, @-100);
	Move("st史男_白衣_通常_normal", 0, @0, @100, null, true);
	FadeStand("st史男_白衣_通常_normal", 300, true);
	DeleteStand("st史男_白衣_通常_smile", 0, false);}
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03200480tk">
「なにか気になりますか？」

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03200490tk">
「もし気になる物があるなら、言ってください。どかしますから」

精神科医らしく、患者に対する心遣いが細かい。

“彼女”はそれを微笑ましく思いながら、持っていたバッグを開いた。中から、ゆっくりと取り出したのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	MusicStart("SE*", 500, 0, 0, 1000, null, true);

	CreateSE("SE01","SE_衝撃_鞄_落ちる");
	SoundPlay("SE01", 0, 1000, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
刃渡り２４センチの柳刃包丁。

//【高科】
<voice name="高科" class="高科" src="voice/ch02/03200500tk">
「それとも、もっと広い部屋に変え――」

{	DeleteStand("st史男_白衣_通常_normal", 300, false);
	Wait(200);
	BGMPlay360("CH10",200,1000,true);
	CreateSE("SE01","SE_じん体_動作_足_蹴る_イス");
	SoundPlay("SE01", 0, 1000, false);}
医師はそれを見て話の途中で絶句し、表情を引きつらせる。

“彼女”はそんな医師の怯えを感じ取り、優しく微笑んだ。

９人目は、この医師になる。

本来の標的ではなかったが、ついでだった。

“彼女”はバッグをその場に置き、足音をたてずに大股で一歩、医師へと歩み寄る。その勢いのまま、医師の胸に飛び込むようにして、包丁を突き立てていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_血_噴きでる_包丁でさされ");
	SoundPlay("SE02", 0, 1000, false);
	CreateColor("背景３", 100, 0, 0, 1280, 720, "RED");
	DrawTransition("背景３", 100, 0, 1000, 100, null, "cg/data/effect.png", true);
	DrawTransition("背景３", 300, 1000, 0, 100, null, "cg/data/effect.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//【高科】
<voice name="高科" class="高科" src="voice/ch02/03200510tk">
「が……っ」

医師の胸に刺さった包丁は、肋骨をすり抜けて心臓まで達した。

その一突きで、医師は絶命していた。

“彼女”に寄りかかるようにして、すでに物体と化した医師が倒れてくる。それを一度支えて包丁を抜き、それから肘でその“物体”を振り払った。

{	CreateSE("SE03","SE_じん体_動作_滑って転ぶ");
	SoundPlay("SE03", 400, 1000, false);
	Stand("st志乃_白衣_通常","shock", 250, @100);
	Move("st志乃_白衣_通常_shock", 0, @0, @0, null, true);
	FadeStand("st志乃_白衣_通常_shock", 500, true);
	Wait(1000);
	DeleteStand("st志乃_白衣_通常_shock", 500, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200520hd">
「きゃあああああ！」

仰向けに倒れた“物体”が羽織っている白衣は真紅に染まっており、物音に気付いて駆けつけてきた看護師が悲鳴を上げる。

{	CreateSE("SE04","SE_衝撃_ひととぶつかる");
	SoundPlay("SE04", 0, 500, false);}
“彼女”は医師の身体を踏みつけながらまたぎ、看護師に向けて包丁で斬りつけた。

//◆声にならない悲鳴
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200530hd">
「――――っ！！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_血_噴きでる");
	CreateColor("背景３", 100, 0, 0, 1280, 720, "RED");
	SoundPlay("SE02", 0, 1000, false);
	DrawTransition("背景３", 100, 0, 1000, 100, null, "cg/data/effect.png", true);
	DrawTransition("背景３", 300, 1000, 0, 100, null, "cg/data/effect.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
鮮血が、パッと舞う。
致命傷ではないが、おとなしそうな看護師の顔にはざっくりとした傷が刻まれたことだろう。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200540hd">
「あああああっ！　ぎああああああああ！」

うなるような声をあげ、看護師は顔を押さえてその場にうずくまった。押さえた手の指の間から、血が大量にこぼれ落ちている。

“彼女”はそれを無視して、診察室の奥へと歩を進めた。

１０人目はあの看護師ではない。
記念なのだ。１０人目。二桁。

だから、当初の予定通りの標的でなければならない。

他の患者や看護師は、すでに悲鳴を上げて逃げ出している。周囲は騒然となっていた。

けれど“彼女”の耳にはその声は届いていない。

ただ、そこに“彼”がいることを確信して、探し回る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTexture360("カーテン", 95, center, middle, "cg/ev/ev144_02_1_拓巳ベッド_a.png");
	CreateTexture360("タクミ", 80, center, middle, "cg/ev/ev144_01_1_拓巳ベッド_a.jpg");

	Fade("背景１", 500, 0, null, true);
	Delete("背景１");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
目を留めたのは、カーテンだった。

１畳か２畳ほどの場所を囲むようにして仕切られたカーテン。
その中にはおそらくベッドがある。

――そこにいたのね。

“彼女”の心が歓喜に震える。
ようやく“彼”を殺せると思うと、“彼女”の下腹部が熱くなった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_手_すけっちぶっくやぶる");

	SoundPlay("SE02", 0, 1000, false);

	CreateTexture360("破れカーテン", 90, center, middle, "cg/ev/ev144_03_1_拓巳ベッド_a.png");
	DrawTransition("破れカーテン", 300, 0, 1000, 100, null, "cg/data/up2.png", false);
	DrawTransition("カーテン", 300, 1000, 0, 100, null, "cg/data/down2.png", true);
	Delete("カーテン");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602012]
ゆっくりとカーテンに近づき、あえて普通に開くことはせずに、包丁で切り裂く。

そして開いた隙間から中をのぞくと、やはりそこにはベッドがあって、“彼”が横たわっていた。

――見つけた。

“彼”の姿を見たら、もう我慢できなかった。

“彼女”はカーテンを開け、ベッドの傍らに立つ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_手_かーてん開ける");
	SoundPlay("SE02", 0, 1000, false);
	DrawTransition("破れカーテン", 300, 1000, 0, 100, null, "cg/data/やや細かい縦ブラインド2.png", true);
	Delete("破れカーテン");


//ＣＧ//うなされて眠っている拓巳

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
少し苦しげな表情で、“彼”は眠っていた。
その髪に“彼女”は自らの指を絡め、優しく撫でる。

“彼”は目を覚まさない。
“彼女”は両手で包丁を逆手に握る。

腕を高く掲げる。
狙うのは、“彼”の心臓。

{	SetVolume360("CH*", 1000, 0, null);}
一突きで――
さっきの医師のように――

殺してあげる――

“彼女”は恍惚感とともに、
思い切り、包丁を振り下ろした――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE04","SE_じん体_動作_手_棒を振り回す");
	CreateSE("SE03","SE_衝撃_肩にぶつかる");
	CreateSE("SE02","SE_じん体_血_噴きでる_包丁でさされ");
	CreateColor("背景３", 100, 0, 0, 1280, 720, "RED");
	Fade("背景３", 0, 0, null, true);


//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	SoundPlay("SE04", 0, 1000, false);
	Wait(500);
	SoundPlay("SE03", 0, 1000, false);
	Wait(200);

	Fade("背景３", 0, 1000, null, true);
	DrawTransition("背景３", 100, 0, 1000, 100, null, "cg/data/zoom2.png", false);
	SoundPlay("SE02", 0, 1000, false);

	Wait(1500);

//イメージＢＧ//血のイメージ
//ＳＥ//包丁で刺される、血が噴き出る

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//■インターミッション番外編１終了

	SetVolume360("CH*", 100, 0, null);
	MusicStart("SE*", 100, 0, 0, 1000, null, false);

	DelusionOut();

	ClearAll(0);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg101_01_1_AHベッド_a.jpg");

	DelusionOut2();
	NegativeHuman();


//アイキャッチ
//※拓巳視点に戻る
//ＢＧ//カーテンが閉まったベッド

	CreateSE("SE02","SE_日常_雑踏02");
	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE02", 2000, 200, 0, 1000, null, true);
	MusicStart("SE03", 2000, 400, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200550ta">
「……っ！」

飛び起きると、そこは相変わらずベッドの上だった。
心臓が早鐘を打っている。

自分の胸元を調べてみた。

傷なんてどこにもない。血も出てない。
僕は……無傷だ。

周囲を見回す。
カーテンは閉じられている。
包丁で切り裂かれてなんていなかった。

カーテンにそっと手をかけた。
それを開くと先生と葉月さんが血まみれで倒れている……っていう光景を妄想し、また身体が震えた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200560ta">
「ゆ、夢……だよな……」

でも、カーテンを開ける勇気が出ない。

もしこのカーテンの外が血の海だったら？
もし悪魔女が包丁を持って立っていたら？

そう思うと、怖くて僕はどうすることもできなかった。

と、そのとき――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//カーテンを開く
//ＢＧ//診察室
	CreateTexture360("背景１", 80, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");
	CreateSE("SE05","SE_じん体_動作_手_かーてん開ける");
	SoundPlay("SE05", 0, 1000, false);
	Fade("背景１", 200, 1000, null, true);
	Stand("bu志乃_白衣_通常","shock", 90, @150);
	FadeStand("bu志乃_白衣_通常_shock", 0, true);
	DrawTransition("背景２", 500, 1000, 0, 100, null, "cg/data/right3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200570ta">
「わ、わああああああ！」

僕の目の前でカーテンが外から開けられた。
たまらず悲鳴を上げ、ベッドから転げ落ちる。

{	Stand("bu志乃_白衣_通常","worry", 200, @150);
	FadeStand("bu志乃_白衣_通常_worry", 200, false);
	DeleteStand("bu志乃_白衣_通常_shock", 200, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200580hd">
「だ、大丈夫ですか……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200590ta">
「は……い……？」

恐る恐る顔を上げる。

目を丸くして僕を見下ろしているのは、葉月さんだった。彼女が着ている白衣には赤い血の跡などなく、顔もまったく傷ついていない。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200600hd">
「ごめんなさい、驚かせてしまって……」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200610hd">
「起きているとは思わなかったので……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200620ta">
「あ、はい、や、いえ……」

情けないところを見られちゃったよ……。

僕は顔を伏せたまま、のろのろと立ち上がった。

まだ胸の鼓動がおさまらない。
でも、夢でよかった……。
まるでホラー映画を見てるみたいだったよ。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200630hd">
「本当に大丈夫？」

心配そうに、葉月さんが僕の顔をのぞき込んでくる。
照れくさいので顔を上げられない。僕はコクコクとうなずくのが精一杯だった。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200640hd">
「少し、うなされていたみたいでしたけど」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200650ta">
「こ、怖い、夢を……見て……」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200660hd">
「そう……」

今、何時だろう。
僕はどれぐらい眠ってたのかな。

葉月さんに聞いてみる。
意外にも、３時間が経っていた。
思った以上に僕は疲れていたみたいだ。

{	Stand("bu志乃_白衣_通常","smile", 200, @150);
	FadeStand("bu志乃_白衣_通常_smile", 200, false);
	DeleteStand("bu志乃_白衣_通常_worry", 200, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200670hd">
「でも、夢遊病の症状は結局出ませんでしたよ」

僕を安心させるような口調で、葉月さんがそう教えてくれる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――


}
//合流２へ
//=============================================================================//





//=============================================================================//
if($妄想トリガー７ == 0)
{
//分岐６
//※星来の立ち絵表示させたまま、星来が喋っているように見せる

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200680hd">
「西條さん？」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200690hd">
「起きてください。時間ですよ」

星来たんが、僕の胸にそっと手を添えて、優しく揺り起こしてくれる。

――ああ、こんな日が来ることを夢見てた。

星来たんとの同棲生活。僕は毎朝、裸エプロンの星来たんに起こしてもらうんだ。そして目覚めのキスを……

{	SetVolume360("CH*", 5000, 0, null);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200700hd">
「西條さーん？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st星来_制服_通常_normal", 2000, false);
	ClearAll(2000);

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	CreateTexture360("背景３", 80, 0, 0, "cg/bg/bg101_01_1_AHベッド_a.jpg");
	Stand("bu志乃_白衣_通常","normal", 90, @150);
	FadeStand("bu志乃_白衣_通常_normal", 0, true);

//イメージＢＧ//カーテンが閉まったベッド

	CreateSE("SE02","SE_日常_雑踏02");
	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE03", 2000, 300, 0, 1000, null, true);
	MusicStart("SE02", 2000, 200, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
目をゆっくりと開く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DrawTransition("色１", 2000, 1000, 0, 100, null, "cg/data/lcenter2.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601017]
誰かが僕を上から見下ろしていた。
まともに目が合ってしまう。

この人は……看護師の葉月さんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200710ta">
「……！？」

慌てて周囲を見回した。
そこは相も変わらず病院のベッドの上。

なんだ、星来たんが語りかけてくれたのは、夢だったのか……

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200720hd">
「おはようございます」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200730ta">
「…………」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200740hd">
「結局、３時間ぐっすりでしたね」

もう３時間……。まだ５分ぐらいしか経ってないような感覚なのに。

ぼんやりと目をこすっている僕にチラリと視線をよこして、葉月さんはなぜか笑いがこらえきれないかのように口元を覆った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu志乃_白衣_通常","smile", 200, @150);
	FadeStand("bu志乃_白衣_通常_smile", 300, true);
	DeleteStand("bu志乃_白衣_通常_normal", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602017]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200750hd">
「星来さんって、カノジョさん？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200760ta">
「なっ……！？」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200770hd">
「ずっと寝言でつぶやいてましたから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200780ta">
「…………」

{	DeleteStand("bu志乃_白衣_通常_smile", 500, true);}
血の気が引いていくのが、自分でも分かった。

とんでもないミスをしてしまった。
寝言を一般人に聞かれちゃうなんて……！

しかも僕はよりによって……星来たんの名前を口走っていたらしい……！

はあああああ……。
鬱だ死のう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//カーテンを開ける
//おがみ：SE後で組み込み
//ＢＧ//診察室
	CreateSE("SE05","SE_じん体_動作_手_かーてん開ける");
	CreateTextureEX("背景１", 80, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");

	SoundPlay("SE05", 0, 1000, false);
	Fade("背景１", 200, 1000, null, true);

	Wait(500);

	Stand("bu志乃_白衣_通常","smile", 200, @150);
	FadeStand("bu志乃_白衣_通常_smile", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603017]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200790hd">
「でも、夢遊病の症状は結局出ませんでしたよ」

カーテンを開けながら、葉月さんがそう教えてくれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

}
//合流２へ
//=============================================================================//




//=============================================================================//
//合流２

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//■３６０
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200800hd">
「まあ、今日はたまたま症状が出なかっただけかもしれないから、夢遊病でないっていう断定はできないですけど」

//「まあ、今日はたまたま症状が出なかっただけかもしれないから、夢遊病ではないっていう断定はできないですけど」

いや、僕は夢遊病なんかじゃない。
それよりも、先生に肝心の質問をしないと。

でもその先生の姿は見えなかった。

と、葉月さんが僕に一枚の用紙を差し出してきた。
何気なく受け取って目を通してみると、マークシート形式になっている。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200810hd">
「それは、あなたの心理状態を把握するためのチェックシートです。心理テストのようなものね。それを書いてくれたら、今日はもう帰っていいって先生が」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03200820ta">
「え、えと……せ、先生は……」

{	Stand("bu志乃_白衣_通常","worry", 200, @150);
	FadeStand("bu志乃_白衣_通常_worry", 300, true);
	DeleteStand("bu志乃_白衣_通常_smile", 300, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200830hd">
「ごめんなさい、ずっと診察が続いてて」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200840hd">
「来週まで様子を見て、まだ改善が見られないようならもう一度来てください、って」

まあ、僕の専属医師っていうわけじゃないもんね……。
僕のことはこの葉月さんにいろいろ指示がしてあるんだろう。

これじゃ、わざわざ病院に来た意味がない……。

僕が僕じゃない何者かに操られたっていう、そのゾッとするような症状について聞きたかったのに。

とは言え、申し訳なさそうな顔をしている葉月さんに“高科先生に会わせろ”ってごねる勇気もなかった。

仕方なく、手渡されたチェックシートをやることにする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
僕の陥っている症状については、シートの裏面に書いておこう。
それでまた来週にでももう一度診てもらおう……。

{	Stand("bu志乃_白衣_通常","normal", 200, @150);
	FadeStand("bu志乃_白衣_通常_normal", 300, true);
	DeleteStand("bu志乃_白衣_通常_worry", 300, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200850hd">
「チェックシートは、質問に対してＹＥＳかＮＯかだけを答える簡単なものですから」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200860hd">
「当てはまる点があったら、ＹＥＳにチェックしてくださいね」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200870hd">
「今後の西條さんの治療に対する参考にしますから、じっくり考えて答えてください」

わざわざ懇切丁寧に、葉月さんは説明してくれた。

チェックシートに書かれてある質問事項は、およそ病院のものとは思えないような変なものも混じっていた。

ホントに心理テストみたいだ。
こんな質問に答えたぐらいで、なにか分かるのかな？

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch02/03200880hd">
「…………」

葉月さんが、じっと僕を見ている。
立ち去ろうとしない。

手持ち無沙汰とかそういう雰囲気じゃなくて、
どちらかって言うと僕を監視――いや、見守っている、という感じ。

見られていると緊張しちゃって、あんまりじっくり考えられないんだけど……。これも看護師の仕事なのかな。

とにかくさっさと書き込んじゃおう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

}
