//<continuation number="570">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_210_Ａ地下トンネルの星来達";
		$GameContiune = 1;
		$Ａルート = true;
		Reset();
	}

		ch10_210_Ａ地下トンネルの星来達();
}


function ch10_210_Ａ地下トンネルの星来達()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//※拓巳視点に戻る
//ＢＧ//井乃頭線地下鉄トンネル

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg194_01_6_井の頭線地下トンネル_a.jpg");
	CreateTextureEX("下敷き", 40, 0, 0, "cg/bg/bg194_01_6_井の頭線地下トンネル_a.jpg");

	Fade("back04", 1000, 1000, null, true);
	Fade("下敷き", 1000, 1000, null, true);

	CreateSE("SE20","SE_はいけい_玉川通ち下道_LOOP");
	MusicStart("SE20", 1000, 1000, 0, 1000, null, true);

	Delete("back03");

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ディソードの赤い光を頼りにして、僕は暗いトンネルを進んでいく。

歩みは自然と速くなっていた。
地下鉄の線路を歩くなんて、初めての経験だ。

来るはずがないと思っていても、ついつい、電車が走ってこないかと前後を何度も確認してしまう。

渋谷駅と神泉駅の間は、電車なら１分程度。
距離にして１キロもないはず。

幸いにして、井乃頭線のトンネルは崩落が少なかったみたいで、これならなんとか渋谷駅までたどり着けそうだった。

ただ、こずぴぃが別れ際に言った忠告が気になっていた。彼女はこう言ったんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE20", 500, 0, NULL);

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 1000, null, true);
	CreateColor("BK", 300, 0, 0, 1280, 720, "Black");
	Fade("BK", 0, 0, null, false);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	Stand("bu梢_制服_正面","sad", 200, @-200);
	FadeStand("bu梢_制服_正面_sad", 0, false);
	Fade("BK", 0, 300, null, false);

	Fade("色１", 500, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//ＶＦ//回想セリフ
//◆心配そう
//【梢】
<voice name="梢" class="梢" src="voice/ch10/21000010ko">
「たっくさんのグモグモドロドロ～っていう意識がね、待ち構えてるのら」

//◆心配そう
//【梢】
<voice name="梢" class="梢" src="voice/ch10/21000020ko">
「こずぴぃ、力にな～れないけど……」

//◆心配そう
//【梢】
<voice name="梢" class="梢" src="voice/ch10/21000030ko">
「気をつーけてね、拓巳しゃん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 100, 1000, null, true);
	Delete("BK");
	Delete("背景１");
	DeleteStand("bu梢_制服_正面_sad", 0, true);
	CreateSE("SE20","SE_はいけい_玉川通ち下道_LOOP");
	MusicStart("SE20", 1000, 1000, 0, 1000, null, true);
	Fade("色１", 500, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
“グモグモドロドロっていう意識”か……。
少なくとも好意的なものじゃないのは確かだ。

怯えそうになる。すごく心細い。

たったひとりで進む、この真っ暗なトンネル。

この先に、なにか恐ろしいものが待ち構えていると言われたら、腰が引けてしまう。

今すぐにでも引き返して、地上から渋谷駅に向かうべきだと僕の心がささやく。

でも、そんな時間のロスをするわけにもいかない。

だから僕は、脳裏に梨深の笑顔を思い浮かべることでその恐怖をかき消した。

ディソードを前方へと突き出し、トンネルの先を照らす。赤い光は不気味さと不安をかき立てる。

{	Wait(300);}
ふと、違和感。

なにか、妙なものが目に入ったような気がして、その正体がなんなのか、せわしなく視線を泳がせてみる。

１０メートルほど先の線路。
そこに、それまでにはない小さな突起のような影を見つけた。

目を凝らす。

それは突起じゃなかった。
２０センチほどの高さがあるそれは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//※覚醒後バージョン
星来たんのフィギュア。

//◆息を呑む
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000040ta">
「…………」

なんだ？
なんで、こんなところに、フィギュアが置いてある？

あまりにも、場違い。
薄暗い地下鉄の構内。
駅と駅の間の線路上。

一般の人は絶対に入ってこられない場所。
線路のど真ん中。

そこに置かれたフィギュア。

僕の一番のお気に入りである、覚醒後バージョン。
しかも胸の部分が潰れていて。

まさか、あれって……

昨日、スクランブル交差点の混乱の中で落とした、僕のフィギュア……？

それが、どうしてこんなところにあるんだ。

しかもちゃんと立たせてあり、その妖艶な笑顔が、まっすぐに、僕を見つめていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000050ta">
「なんで、星来が……」

//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000060se">
「ふーん、タッキーにはそう見えてるんだ」

声が聞こえた。
いつも頭の中で妄想していた、星来の声。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

	CreateColor("黒幕", 2100, 0, 0, 1280, 720, "BLACK");
//	Fade("黒幕", 0, 0, null, true);

	SetVolume("SE20", 1000, 500, null);


	Stand("st星来_覚醒後_通常","normal", 200, @0);
	FadeStand("st星来_覚醒後_通常_normal", 0, true);
	Fade("黒幕", 300, 0, null, true);
//	Delete("黒幕");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000070se">
「ま、なんでもいいけどさ。ふっふ～ん♪」

僕がまばたきをした、その１秒にも満たない間に。

フィギュアだったはずの星来たんが、等身大スケールへと姿を変えていた。

そして、人間とまったく同じように、滑らかにそのエロいボディをくねらす。巨乳が揺れ、髪が波打つ。

これは、僕の妄想……？

//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000080se">
「ねえタッキー。遊ぼうよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("黒幕", 100, 1000, null, true);
	DeleteStand("st星来_覚醒後_通常_normal", 0, true);
	Stand("st星来_覚醒前_通常","happy", 180, @0);
	Fade("黒幕", 300, 0, null, false);
	FadeStand("st星来_覚醒前_通常_happy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
声は後ろから聞こえた。
ハッとして振り返ると、そこにも等身大の星来たんがいる。

//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000090se">
「梨深っちのことなんてほっといてさ」

後ろだけじゃない。<k>
{	Stand("st星来_覚醒後_通常","normal", 180, @-300);
	FadeStand("st星来_覚醒後_通常_normal", 300, true);}
左にも。
{	Stand("st星来_覚醒後_通常","angry", 150, @+300);
	FadeStand("st星来_覚醒後_通常_angry", 300, true);}
右にも。

星来たんが、どんどん増殖していく。
闇の中から、湧き出てくる。

僕は薄ら寒さを覚えながら、その光景を見つめる。
星来たんの数はやがて、３桁近くにまで増えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("黒幕");
	CreateTextureEX("back20", 500, 0, 0, "cg/bg/bg194_01_6_井の頭線地下トンネル_a.jpg");


	Fade("黒幕", 100, 1000, null, false);
	DeleteStand("st星来_覚醒後_通常_angry", 500, false);
	DeleteStand("st星来_覚醒前_通常_happy", 500, false);
	DeleteStand("st星来_覚醒後_通常_normal", 500, true);


	Fade("back20", 0, 0, null, false);

	CreateTextureEX("layer", 150, Center, Middle, "cg/ev/ev096_01_1_星来大群_a.png");
	Move("layer", 0, @+0, @-80, null, true);
	Move("layer", 1000, @+0, @+80, Dxl2, false);
	Fade("layer", 500, 1000, null, true);

	SetVolume("SE20", 1000, 0, NULL);
	BGMPlay360("CH13", 2000, 1000, true);


	Wait(1000);

	Delete("back20");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//ＶＦ//反響
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000100se">
「あたしと気持ちいいことしよ？」

その１００人ほどの星来たんが、僕を取り囲んで一斉に喋る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st星来_覚醒前_通常","happy", 200, @0);
	FadeStand("st星来_覚醒前_通常_happy", 500, true);
	Fade("layer", 500, 0, null, true);
	Delete("layer");

	CreateSE("SE05","SE_じん体_動作_手_棒を振り回す");
	CreateSE("SE36005","SE_擬音_金棒振り回す");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000110se">
「いいっしょ、ぼ・け・な・す♪」

{	CreateTextureEX("星来１", 200, Center, @-128, "cg/ev/ev096_02_1_星来大群_a.png");
	DeleteStand("st星来_覚醒前_通常_happy", 300, false);
	MusicStart("SE05", 0, 500, 0, 1000, null, false);
	MusicStart("SE36005", 0, 500, 0, 1000, null, false);
	Fade("星来１", 200, 1000, null, true);}
正面にいた星来たんのうちのひとりが、笑いながら僕目がけて突進してきた。
その細い腕で、巨大な金棒を振り回し。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("星来２", 200, Center, Middle, "cg/ev/ev096_06_1_星来大群_a.png");
	SetBlur("星来２", true, 3, 300, 40);
	Request("星来２", Smoothing);
	Fade("星来１", 300, 0, null, false);
	Fade("星来２", 300, 1000, null, true);

	Zoom("星来２", 100, 1500, 1500, Dxl1, false);
//ＳＥ//金棒を振り回す
//ＳＥ//ディソードで金棒を受け止める
	CreateSE("SE01","SE_擬音_金棒振り回す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(300);

	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	CreateSE("SE05","SE_衝撃_打撃_殴る");
	MusicStart("SE05", 0, 500, 0, 1000, null, false);
	CreateSE("SE02","SE_擬音_ディそーど同士ぶつかる");
	MusicStart("SE02", 500, 1000, 0, 1000, null, false);
	Fade("色１", 100, 1000, null, true);
	Delete("星来２");
	Delete("星来１");
	FadeDelete("色１", 200, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text906]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000120ta">
「――っ！？」

それは現実の衝撃。
受け止めたディソードを通して伝わってくる。

あまりに重い一撃。
僕の手が、痙攣したように痺れる。
痛みさえ覚える。

それで、僕は悟った。

現実――
これは妄想じゃない――
リアルブートされた存在――

ここにいる全員が敵――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("星来３", 200, Center, Middle, "cg/ev/ev096_04_1_星来大群_a.png");
	Move("星来３", 0, @+120, @-40, null, false);
	CreateTextureEX("星来２", 250, Center, Middle, "cg/ev/ev096_05_1_星来大群_a.png");
	Move("星来２", 0, @-80, @-40, null, false);
	Fade("星来２", 300, 1000, null, true);
	Fade("星来３", 300, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000130se">
「遊んでくれないと、ぶっとばしちゃうゾ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000140ta">
「僕の嫁なら……道を開けて……」

//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000150se">
「ヤダー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000160ta">
「それなら……」

無理矢理通るしかない。
きつく剣を握り直した。

{	CreateSE("SE02","SE_擬音_ディそーどかまえる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
ディソードの柄部分にある炎の意匠が燃え上がる。
剣が発する赤い光の量が増す。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000170ta">
「ああああっ！」

斬りかかる。
僕の嫁のひとりへ。

剣に重さは感じない。
滑らかに。
剣は僕の望んだ軌道を描く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//ＳＥ//斬る
	CreateSE("SE02","SE_擬音_ディそーど_人を切る");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateColor("back10", 200, 0, 0, 1280, 720, "White");
	DrawTransition("back10", 300, 300, 1000, 300, null, "cg/data/ncenter1.png", false);
	Fade("星来２", 0, 0, null, true);
	Fade("星来３", 0, 0, null, true);
	Fade("back10", 300, 0, null, true);

	Delete("星来２");
	Delete("星来３");
	Delete("back10");

	CreateSE("SE04","SE_じん体_血_噴きでる");

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "RED");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆斬られて声にならない悲鳴
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000180se">
「――ぁっ」

袈裟切りに斬り伏せた。

肉や骨を断つ抵抗はまったくなく。
力をほとんど入れる必要もなく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	Fade("攻撃フラッシュ", 0, 1000, null, true);
	DrawTransition("攻撃フラッシュ", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);
	Fade("攻撃フラッシュ", 500, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
星来は、グラマラスな身体を斜めに両断され。
その場に血をぶちまけつつ倒れる。

内臓までリアルに再現されていた。
テラテラと光るピンク色。
僕は目をそらす。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000190ta">
「ごめん、星来……」

自分の好きなキャラを、自分の手で斬殺する。
オタとして、こんな辛いことはない。

それでも、ここで止まるわけにはいかないんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("星来２", 200, Center, Middle, "cg/ev/ev096_02_1_星来大群_a.png");
	Move("星来２", 1, @-240, @-120, null, true);
	Fade("星来２", 300, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000200se">
「強い強い！」

//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000210se">
「さすがタッキー♪」

//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000220se">
「そんなタッキーが好き」

//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000230se">
「もっと気持ちよくして」

//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000240se">
「遊ぼうよ」

{	CreateTextureEX("星来３", 250, Center, Middle, "cg/ev/ev096_06_1_星来大群_a.png");
	Move("星来３", 1, @+320, @-40, null, true);
	Fade("星来３", 300, 1000, null, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000250se">
「めちゃくちゃにしてあげる」

{	Stand("bu星来_覚醒後_通常","happy", 500, @0);
	FadeStand("bu星来_覚醒後_通常_happy", 300, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000260se">
「楽しい楽しい！」

ひとりひとりの星来が、思い思いに勝手に喋り出す。
その声が洪水となって僕を呑み込もうとする。

こいつらを星来と思い込むのをやめるんだ。
僕は自分に言い聞かせ。
先へ進むため、道を塞ぐ星来たちに斬りかかる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000270ta">
「どいてよ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//ＳＥ//剣が空を切る音
	CreateSE("SE02","SE_擬音_ディそーど1");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateColor("back10", 200, 0, 0, 1280, 720, "White");
	DrawTransition("back10", 300, 300, 1000, 300, null, "cg/data/ncenter1.png", false);
	Delete("星来２");
	Delete("星来３");
	DeleteStand("bu星来_覚醒後_通常_happy", 0, true);
	Fade("back10", 200, 0, null, true);

	Delete("back10");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
疾走する、赤い軌道。
闇を切り裂き。
横凪ぎに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//斬る

	CreateColor("back20", 500, 0, 0, 1280, 720, "#990000");
	DrawTransition("back20", 300, 300, 800, 500, null, "cg/data/zoom1.png", false);

	Fade("攻撃フラッシュ", 0, 1000, null, true);
	DrawTransition("攻撃フラッシュ", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);
	Fade("攻撃フラッシュ", 500, 0, null, false);

	CreateSE("SE02","SE_じん体_血_噴きでる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 100);

	CreateSE("SE03","SE_じん体_血_噴きでる");
	MusicStart("SE03", 200, 1000, 0, 1000, null, false);

	Fade("back20", 500, 0, null, true);
	Delete("back20");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
並んでいた星来たん４人を、同時に死体へ変える。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_衝撃_せ中を押される");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Shake("back04", 200, 10, 30, 0, 0, 200, null, false);
	Shake("layer", 200, 10, 30, 0, 0, 200, null, false);
	Stand("bu星来_覚醒後_通常","happy", 500, @+200);
	FadeStand("bu星来_覚醒後_通常_happy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//◆※以下、星来の「タッキー♪」というセリフをＳＥ扱いで延々とたくさん同時に再生したいです
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000280se">
「タッキー♪」

背後からつかみかかられた。
スリーパーホールドのように首に腕を回される。
大きくて柔らかい胸が背中に押しつけられ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000290ta">
「は……なせ……っ」

//ＳＥ//剣が空を切る音
{	CreateSE("SE02","SE_擬音_ディそーど_コンクリート砕く");
	MusicStart("SE02", 0, 800, 0, 1000, null, false);}
足にすがりつこうとした別の星来の顔面に、ディソードを突き刺す。
それにより、彼女の端正な笑顔が融解し、穴が開く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE36001","SE_擬音_服がやぶれる");
	MusicStart("SE36001",0,1000,0,1000,null,false);


	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	Fade("色１", 200, 0, null, true);
	Delete("色１");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
息が苦しい。
首を絞められ。
窒息しそう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//金棒を振り回す

	CreateTextureEX("星来１", 200, Center, InBottom, "cg/ev/ev096_02_1_星来大群_a.png");
	Move("星来１", 0, @-80, @0, null, false);
	Fade("星来１", 300, 1000, null, true);

	CreateSE("SE01","SE_擬音_金棒振り回す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000300se">
「浮気しちゃダメ！」

金棒が目の前に迫る。
僕はその場で身体を入れ替える。
背中を向け。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("星来２", 200, Center, Middle, "cg/ev/ev096_06_1_星来大群_a.png");
	SetBlur("星来２", true, 3, 300, 40);
	Request("星来２", Smoothing);
	Fade("星来２", 300, 1000, null, true);

	Zoom("星来２", 200, 1500, 1500, Dxl1, false);

	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);

//ＳＥ//金棒で殴られる
	CreateSE("SE01","SE_衝撃_打撃_殴る");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Fade("色１", 100, 1000, null, true);
	DeleteStand("bu星来_覚醒後_通常_happy", 0, true);
	Delete("星来１");
	Delete("背景１");
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000310se">
「ぐえっ！」

ビクンと身を震わせた星来の腕の力が弱まる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("星来１", 500, Center, Middle, "cg/ev/ev096_01_1_星来大群_a.png");
	Fade("星来２", 300, 0, null, true);
	Fade("星来１", 300, 1000, null, true);
	Delete("星来２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000320se">
「梨深っちのことなんて忘れて」

{	CreateSE("SE05","SE_擬音_ディそーど_空を切る1");
	MusicStart("SE05", 0, 700, 0, 1000, null, false);}
背中の星来を振り落としつつ。
身体を回転させ、ディソードを払う。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000330ta">
「っ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//斬る
	CreateSE("SE02","SE_擬音_ディそーど1");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateColor("back10", 200, 0, 0, 1280, 720, "White");
	DrawTransition("back10", 300, 300, 1000, 100, null, "cg/data/lcenter.png", false);
	Fade("星来１", 0, 0, null, false);
	Fade("back10", 300, 0, null, true);

	Delete("星来１");
	Delete("back10");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
迫っていた３人の星来たんの足。
その太股を断つ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("攻撃フラッシュ", 0, 1000, null, true);
	DrawTransition("攻撃フラッシュ", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);
	Fade("攻撃フラッシュ", 500, 0, null, false);
	CreateSE("SE03","SE_衝撃_どすーん");
	MusicStart("SE03", 0, 600, 0, 1000, null, false);
	CreateSE("SE04","SE_じん体_血_噴きでる");
	MusicStart("SE04", 0, 600, 0, 1000, null, false);
	WaitAction("SE04", 100);
	CreateSE("SE05","SE_衝撃_どすーん");
	MusicStart("SE05", 200, 600, 0, 1000, null, false);


	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
３人が一斉に前のめりに倒れ。
僕はその背を踏み越えて。

{	CreateTextureEX("星来１", 500, Center, Middle, "cg/ev/ev096_04_1_星来大群_a.png");
	Move("星来１", 1, @0, @-80, null, true);
	Fade("星来１", 300, 1000, null, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000340se">
「強い男って好き♪」

奥で金棒を回している星来へと剣を振り下ろす。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_衝撃_打撃_殴る");
	MusicStart("SE05", 0, 500, 0, 1000, null, false);
	CreateColor("色２", 500, 0, 0, 1280, 720, "WHITE");
	Request("色２", AddRender);
	Fade("色２", 0, 0, null, false);
	Fade("色２", 0, 1000, null, true);
	CreateSE("SE02","SE_擬音_ディそーど同士ぶつかる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Shake("back04", 500, 5, 5, 0, 0, 500, null, false);
	Fade("色２", 200, 0, null, true);
	Delete("色２");

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602014]
金棒でディソードを受け止められる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//斬る
	CreateSE("SE01","SE_擬音_ディそーど_人を切る");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Fade("攻撃フラッシュ", 0, 1000, null, true);
	DrawTransition("攻撃フラッシュ", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);
	Fade("攻撃フラッシュ", 500, 0, null, false);

	CreateSE("SE02","SE_擬音_ディそーど2");
	MusicStart("SE02", 300, 1000, 0, 1000, null, false);


	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);

	CreateSE("SE02","SE_擬音_ディそーど2");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Fade("色１", 100, 1000, null, true);
	Delete("星来１");
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
その金棒ごと、脳天から叩き斬った。

僕のディソードは、正しくは“斬って”いない。

斬ると言うよりも、その軌跡に沿ってあらゆるものを“蒸発”させている、というのが正しい。

どんなに硬いものであろうと。
どんなに柔らかいものであろうと。

どんなに冷たいものでも。
どんなに熱いものでも。

この剣は、触れたものすべてを一瞬にして沸騰させ、焼き切る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒後_通常","happy", 200, @0);
	FadeStand("bu星来_覚醒後_通常_happy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000350se">
「タッキー♪」

身の毛がよだつ。

同じ顔をしたアニメキャラが。
一斉に、僕の名を呼びながら。
襲いかかってくるその光景。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000360ta">
「うわあああっ！」

鼓舞するように声をあげ。
{	Shake("bu星来_覚醒後_通常_happy", 200, 2, 5, 0, 0, 500, null, false);
	CreateSE("SE02","SE_じん体_血_噴きでる_包丁でさされ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
正面にいた星来の胸を剣で突く。

{	Stand("bu星来_覚醒後_通常","ero", 200, @0);
	FadeStand("bu星来_覚醒後_通常_ero", 300, true);
	DeleteStand("bu星来_覚醒後_通常_happy", 0, true);}
//◆恍惚
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000370se">
「あぁぁ、タッキー」

{	CreateSE("SE05","SE_にん間_動作_手_はたく");
	MusicStart("SE05", 0, 800, 0, 1000, null, false);}
その星来が、ディソードをつかんだ。
{	CreateSE("SE06","SE_擬音_肉手を突っ込む");
	MusicStart("SE06", 0, 600, 0, 1000, null, false);}
ほぼ同時に手は蒸発する。

//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000380se">
「熱い、熱いよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000390ta">
「…………っ」

{	DeleteStand("bu星来_覚醒後_通常_ero", 300, true);}
絶句する。
恐怖が身体の奥から這い上がってくる。

悪寒が背中を駆け抜ける。
身体が硬直してしまう。

こんなの星来じゃない。
星来は僕に刃向かったりしない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒後_通常","angry", 200, @0);
	FadeStand("bu星来_覚醒後_通常_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000400se">
「タッキーのぼけなすぅっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH13", 500, 0, null);

	CreateTextureEX("星来２", 200, Center, Middle, "cg/ev/ev096_03_1_星来大群_a.png");
	SetBlur("星来２", true, 3, 300, 40);
	Request("星来２", Smoothing);

	DeleteStand("bu星来_覚醒後_通常_angry", 300, false);
	Fade("星来２", 300, 1000, null, true);

	Zoom("星来２", 100, 1500, 1500, Dxl1, false);

//ＳＥ//金棒を振り回す
//ＳＥ//金棒の一撃を食らう

	CreateSE("SE01","SE_擬音_ちを蹴る");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	WaitAction("SE01", 500);

	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);

	CreateSE("SE02","SE_衝撃_打撃_殴る");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Fade("攻撃フラッシュ", 0, 1000, null, true);
	DrawTransition("攻撃フラッシュ", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);
	Fade("攻撃フラッシュ", 500, 0, null, false);

	Fade("色１", 100, 1000, null, true);
	Delete("星来２");

	CreateColor("back20", 300, 0, 0, 1280, 720, "Black");

	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000410ta">
「おぐっ……！」

あばら骨が数本、粉砕された音。
右腕からも、骨が軋む鈍い音。

自分の身体の中から響いて。

衝撃。

吹っ飛ばされる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 0, 1000, null, true);
	CreateSE("SE03","SE_衝撃_どすーん");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Shake("背景１", 500, 50, 50, 0, 0, 500, null, false);

	Fade("色１", 300, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601017]
壁に激突。

頭をまともにぶつけた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("back20", 1000, 0, null, true);
	Delete("back20");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602017]
グラグラと視界が歪む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒前_通常","happy", 200, @0);
	FadeStand("bu星来_覚醒前_通常_happy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603017]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000420se">
「腕組みしようっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	DeleteStand("bu星来_覚醒前_通常_happy", 300, true);
//ＳＥ//金棒を振り回す
//ＳＥ//金棒が壁をえぐる
	CreateSE("SE02","SE_擬音_金棒振り回す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE01", 500);

	CreateColor("back20", 500, 0, 0, 1280, 720, "#990000");
	DrawTransition("back20", 300, 300, 800, 500, null, "cg/data/zoom1.png", false);

	CreateSE("SE03","SE_衝撃_落下激突");
	CreateSE("SE36003","SE_擬音_ディそーど_コンクリート砕く");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	MusicStart("SE36003", 0, 1000, 0, 1000, null, false);

	Shake("back04", 600, 0, 10, 0, 0, 500, null, false);

	CreateSE("SE04","SE_擬音_脳みそ");
	MusicStart("SE04", 0, 600, 0, 1000, null, false);

	Fade("back20", 300, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
高速で振り下ろされた金棒によって。
叩き潰される。

左手の肘から先がミンチになる。
壁のコンクリートごと抉られる。

{	BGMPlay360("CH10",0,1000,true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000430ta">
「ぎゃああああ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000440ta">
「腕……腕が……っ！」

//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000450se">
「タッキー、逃がさない♪」

{	CreateSE("SE01","SE_擬音_金棒振り回す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
//ＳＥ//金棒を振り回す
別の金棒が、僕の足目がけて迫る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000460ta">
「――――っ」

力の入らない右手。
少しでも動けば脳髄にまで響く激痛。

それを無視して。
ディソードを振るう。

{	CreateSE("SE02","SE_擬音_ディそーど_人を切る");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Stand("bu星来_覚醒後_通常","shock", 200, @0);
	FadeStand("bu星来_覚醒後_通常_shock", 300, true);}
迫る金棒をすっぱりと切断し。
痛みで、自分の口から唸るような声が漏れる。

{	CreateSE("SE04","SE_擬音_ちを蹴る");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}
目の前の星来の懐に飛び込み。
胴体にディソードを押しつけ。
振り抜く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//斬る
//ＳＥ//血が噴き出す
	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 0, 1000, null, true);

	DeleteStand("bu星来_覚醒後_通常_shock", 200, false);

	CreateSE("SE01","SE_擬音_ディそーど1");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	WaitAction("SE01", 500);
	Fade("色１", 300, 0, null, true);

	Delete("色１");

	CreateSE("SE03","SE_じん体_血_噴きでる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Fade("攻撃フラッシュ", 0, 1000, null, true);
	DrawTransition("攻撃フラッシュ", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);
	Fade("攻撃フラッシュ", 500, 0, null, false);

	CreateColor("色１", 500, 0, 0, 1280, 720, "#990000");
	DrawTransition("色１", 200, 300, 800, 100, null, "cg/data/zoom1.png", true);
	FadeDelete("色１", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
星来の血を手に浴びる。
アニメキャラなのにちゃんとその血は熱くて。

麻痺していく心。
痛みだけに支配される。

遮断したいが、できない。
この“痛み”がある限り。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000470ta">
「が、はあ、はあ、あ、が……うぐ、はあ……」

{	CreateSE("SE02","SE_じん体_動作_と血");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateSE("SE01","SE_じん体_手首_たれる血");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
潰された左手から、大量の血糊がこぼれる。

右手はディソードを持っているのも辛い。

{	CreateColor("色１", 500, 0, 0, 1280, 720, "#990000");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	Fade("色１", 300, 0, null, true);
	Delete("色１");}
骨の中から、失神しそうなほどの痛みが響く。

気が付けば全身に汗。
雫が目に入って、染みる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("layer", 150, Center, Middle, "cg/ev/ev096_01_1_星来大群_a.png");
	Fade("layer", 500, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601019]
かすむ視界。
目の前に迫る、星来たち。

彼女たちの愉快そうな笑い声が、残響のように僕の鼓膜を震わせる。

こんな怪我じゃ、あと数時間も生きられないかもしれない。

ふとそんなことを思う。
それでも別に構わない。
どうせ僕は妄想の存在だ。

明日には消えちゃうような存在だ。
どれだけ傷ついたって、構わない。

梨深さえ助け出せるなら。
ノアⅡさえ破壊できるなら。

この身体の一部ぐらい、いくらでも差し出すよ。

だから――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000480ta">
「道を、開け、てよ……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒後_通常","happy", 200, @0);
	FadeStand("bu星来_覚醒後_通常_happy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000490se">
「一緒にいようよ♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//ＳＥ//金棒を振り回す
	CreateSE("SE01","SE_擬音_金棒振り回す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
再び襲いかかってくる金棒。
避けようかと思った。
でも疲労と痛みで反応が遅れる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	PrintBG(100);

	CreateTexture360("背景１", 99, center, middle, "SCREEN");
	CreateColor("色１", 500, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);

//ＳＥ//金棒の一撃を食らう

	Shake("back*", 500, 50, 50, 0, 0, 500, null, false);

	CreateSE("SE02","SE_衝撃_打撃_殴る");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);


	Fade("色１", 0, 1000, null, true);
	Fade("色１", 300, 0, null, true);

	CreateColor("back10", 500, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);

	SetVolume360("CH10", 100, 1, null);
	Fade("back10", 100, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
こめかみにまともに食らう。
巨大なトゲが頭蓋骨にめり込む感触。

{	Delete("背景１");}
世界が揺れた。
ブラックアウト。
ただでさえ暗かったのに、なにも見えなくなる。

転がる。
転がりながら。
痛みが響く右手に、ディソードがあることを確かめ。

体勢を立て直そうと、潰された左手を振り。
{	CreateSE("SE02","SE_衝撃_打撃_殴る");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);}
むき出しの骨で地面を叩く。

{	CreateColor("色１", 500, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 0, 1000, null, true);
	Fade("色１", 300, 0, null, true);}
全身を電撃のような衝撃が走り。
一瞬気絶。
すぐ気が付く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH10", 1000, 1000, null);

	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg194_01_6_井の頭線地下トンネル_a.jpg");
	CreateTexture360("layer", 150, Center, Middle, "cg/ev/ev096_01_1_星来大群_a.png");
	Stand("st星来_覚醒後_通常","happy", 200, @0);
	FadeStand("st星来_覚醒後_通常_happy", 0, true);
	Fade("back10", 500, 0, null, true);
	Delete("back10");

	CreateSE("SE02","SE_擬音_ちを蹴る");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601022]
視界が戻る。
浮いている身体。
足裏が地面を捉える。

吹っ飛ばされた遠心力を利用し。
{	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	DeleteStand("st星来_覚醒後_通常_happy", 200, true);
	Stand("bu星来_覚醒後_通常","shock", 200, @0);
	FadeStand("bu星来_覚醒後_通常_shock", 300, true);}
星来たちの中へ突っ込んだ。
右手を振る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//ＳＥ//ディソードを振る
//ＳＥ//斬る
	CreateSE("SE01","SE_擬音_ディそーど1");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	WaitAction("SE01", 500);

	CreateColor("back10", 200, 0, 0, 1280, 720, "White");
	DrawTransition("back10", 300, 300, 1000, 300, null, "cg/data/ncenter1.png", false);
	DeleteStand("bu星来_覚醒後_通常_shock", 0, true);
	Fade("back10", 300, 0, null, true);

	CreateSE("SE02","SE_じん体_血_噴きでる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Fade("攻撃フラッシュ", 0, 1000, null, true);
	DrawTransition("攻撃フラッシュ", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);
	Fade("攻撃フラッシュ", 500, 0, null, false);

	Delete("back10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
骨が軋む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("back20", 500, 0, 0, 1280, 720, "#990000");
	DrawTransition("back20", 300, 300, 800, 500, null, "cg/data/zoom1.png", false);
	CreateSE("SE03","SE_じん体_血_噴きでる");
	MusicStart("SE03", 200, 1000, 0, 1000, null, false);
	Fade("back20", 1000, 0, null, true);
	Delete("back20");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601023]
星来たちが鮮血を噴き出す。
鼻をつく血の匂い。

自分の血か。
星来の血か。
もう分からない。

混ざり合って。
自分が血まみれだと知る。
ぼやけた視界が赤く染まっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒後_通常","angry", 250, @+240);
	Stand("bu星来_覚醒後_通常","happy", 200, @-240);
	FadeStand("bu星来_覚醒後_通常_happy", 300, false);
	FadeStand("bu星来_覚醒後_通常_angry", 300, true);

//ＳＥ//斬る
	CreateSE("SE01","SE_擬音_ディそーど1");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	WaitAction("SE01", 500);

	DeleteStand("bu星来_覚醒後_通常_happy", 300, false);
	DeleteStand("bu星来_覚醒後_通常_angry", 300, true);

	CreateColor("back20", 500, 0, 0, 1280, 720, "#990000");
	DrawTransition("back20", 300, 300, 800, 500, null, "cg/data/zoom1.png", false);
	CreateSE("SE03","SE_じん体_血_噴きでる");
	MusicStart("SE03", 200, 1000, 0, 1000, null, false);
	Fade("back20", 1000, 0, null, true);
	Delete("back20");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
なおも斬る。
もう何人斬ったか分からない。

いつ終わるのか。

星来が無限に増え続けているような錯覚。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒後_通常","happy", 200, @+240);
	CreateSE("SE02","SE_じん体_掴む");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	FadeStand("bu星来_覚醒後_通常_happy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601024]
右手に星来がしがみつく。
その星来ごと、ディソードを振り回す。

{	CreateSE("SE01","SE_擬音_ディそーど_空を切る1");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Shake("bu星来_覚醒後_通常_happy", 200, 100, 0, 0, 0, 500, null, false);}
でも星来は離れず。
腕を逆にねじ曲げられ。

{	CreateColor("色１", 500, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 0, 1000, null, true);
	Fade("色１", 300, 0, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000500ta">
「がっ……ぁ」

間接が外れた。
力が入らなくなる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――


//ＳＥ//ディソードを落とす
	CreateSE("SE01","SE_擬音_ディそーど落ちる");
	MusicStart("SE01", 0, 800, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
ディソードを落としてしまう。

吐き気がこみあげ。
咳き込む。

血の味が、口の中に広がった。
折れたあばら骨が内臓を傷つけたかもしれない。

あらゆる痛みが身体を蝕む。
頭がおかしくなりそうだ。

願う。
願わずにはいられない。

解放されたい。
無理なのは知っている。
だから、おまじないのようなもの。

{	Stand("bu星来_覚醒後_通常","normal", 200, @+240);
	FadeStand("bu星来_覚醒後_通常_normal", 300, true);
	DeleteStand("bu星来_覚醒後_通常_happy", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000510se">
「汗、拭いてあげよっか」

僕の顔をニコニコとのぞき込んでくる星来。
その顎を全力で蹴り上げ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//顎を蹴り上げる
	CreateSE("SE01","SE_衝撃_顔面蹴られる");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Shake("bu星来_覚醒後_通常_normal", 200, 100, 0, 0, 0, 500, null, false);
	DeleteStand("bu星来_覚醒後_通常_normal", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
右腕に無理矢理力を入れる。
感覚がなくなりつつある。

神経が焼き切れる錯覚。
全身が熱い。

いまや、骨の痛みは、腕だけでなく全身へと波紋のように伝わっている。
身体が砕けるかのような。

獣のうなり声が聞こえて。
誰の声かと思ったら、自分の口からそれは発せられていた。

右手の指がかすかに動き。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000520ta">
「あああああああ！」

ディソードを拾う。
妄想。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("白幕", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("白幕", 0, 1000, null, true);
	CreateSE("SE03","SE_擬音_ディそーどかまえる");
	CreateSE("SE360103","SE_衝撃_ふらっしゅばっく");
	MusicStart("SE03", 200, 1000, 0, 1000, null, false);
	MusicStart("SE360103", 200, 1000, 0, 1000, null, false);
	Fade("白幕", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601026]
紐で縛り付けてある映像。
それは一瞬で現実となり。
僕の手に剣は紐で固定された。

行かなくちゃ。
梨深のところへ。
この闇の、先へ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒後_通常","sad", 200, @0);
	FadeStand("bu星来_覚醒後_通常_sad", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
//【星来】
<voice name="星来" class="星来" src="voice/ch10/21000530se">
「タッキー、どうしてあたしと一緒にいてくれないの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 0, 1000, null, true);
	CreateSE("SE02","SE_じん体_動作_と血");
	MusicStart("SE02", 200, 1000, 0, 1000, null, false);
	Fade("色１", 300, 0, null, true);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601027]
口の中にたまった血を、吐き出した。
周囲には、累々と横たわる、星来の死体。

それを足蹴にして迫ってくる、別の星来たち。
血だまりが波紋を作る。

僕は、ゆっくりと首を振る。

{	SetVolume360("CH10", 2000, 0, NULL);}
//◆苦しそうに
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000540ta">
「だって、星来は」

ギリリと、歯噛みして。

//◆苦しそうに
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000550ta">
「アニメじゃないか――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	PrintBG(100);
	CreateColor("色１", 300, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	CreateSE("SE02","SE_衝撃_衝撃音01");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Fade("色１", 100, 1000, null, true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg194_01_6_井の頭線地下トンネル_a.jpg");
	Fade("色１", 500, 0, null, true);
	Delete("色１");

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text100]
直後に。
すべての星来が、一瞬で二次元に変化した。

立っている者は、等身大ＰＯＰに。
横たわっていた死体は、抱き枕カバーに。

彼女たちは、本来の住処――二次元へと回帰した。
そしてもう、動かなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000560ta">
「塵は、塵に還らなきゃ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21000570ta">
「僕も、後で行くよ」

彼女たちの残骸に、黙祷するように少しの間だけ頭を垂れて。

血まみれグロ星来の抱き枕カバーは、絶対売れないだろうな、と頭の隅の方で思う。

今にも気を失いそうだったけど、唇を強く噛むことでそれに耐えた。

そして暗闇のトンネルを、再び歩き出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_足_歩く");
	MusicStart("SE01",100,1000,0,1000,null,true);


	Wait(2000);

	CreateColor("back10", 100, 0, 0, 1280, 720, "White");
	DrawTransition("back10", 1000, 300, 1000, 500, Dxl1, "cg/data/爆発.png", true);

	SetVolume("SE01", 2000, 0, null);

	Wait(2000);

//※トンネル抜けて暗いところから明るいところへ抜け出るような演出がここでほしいです


//ＢＧ//白

}