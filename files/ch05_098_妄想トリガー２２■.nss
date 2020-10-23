//<continuation number="870">




chapter main
{

	$PreGameName = "boot_第五章";

	if($GameStart != 1)
	{
		$GameName = "ch05_098_妄想トリガー２２■";
		$GameContiune = 1;
		Reset();
	}

		ch05_098_妄想トリガー２２■();
}


function ch05_098_妄想トリガー２２■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	CreateSE("SE10","SE_日常_PC_はーどでぃすく_LOOP");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Delete("上敷き");
	MusicStart("SE10", 0, 1000, 0, 1000, null, true);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１０へ
//ネガティブ妄想→分岐１１へ
//妄想しない→分岐１２へ

if($妄想トリガー通過２２ == 0)
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
			$妄想トリガー２２ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー２２ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー２２ = 0;
		}
	}
}



//=============================================================================//

if($妄想トリガー２２ == 2)
{
//☆☆☆
//分岐１０

	CreateSE("SE03","SE_日常_家具_イス_きしむ");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	CreateBG(100, 500, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
まだＰＣモニタを眺めながら眉をひそめてうなっている梨深を放っておいて、部屋の隅に立て掛けておいたオモチャのディソードを手に取る。

部屋の真ん中に立ち、それをエンスーキャラの見よう見まねで正眼に構えた。
目を閉じる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 500, 0, NULL);

//ＢＧ//黒
	CreateColor("back03", 500, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
頭の中に、剣のイメージを思い浮かべようとする。

モチーフは当然、セナやあやせが持っていたあの、美麗で、禍々しくて、触れればすべてを断ち切ってしまいそうな剣。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//黒背景に拓巳のディソード（ぼやけている）
	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg147_01_2_ディソード想像_a.jpg");
	Request("back04", Smoothing);
	SetShade("back04", HEAVY);
	Fade("back04", 0, 1000, null, false);

	FadeDelete("back03", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
妄想は得意なんだ。

なにしろ毎日のようにいろんな妄想をしてるんだから。

やろうと思えば細部まで明確に脳内に再現することだってできる。

なんとなくイメージが固まってきたところで、奥歯を噛みしめ、剣を握る両手に力をこめる。

現実になれ……！　現実になれ……！　現実になれ……！　現実になれ……！　現実になれ……！　現実になれ……！　現実になれ……！　現実になれ……！

念じる。
ただそれだけを考える。

僕が今握っているのは、本物のディソードだ。ニセモノじゃない。本物なんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800010ta">
「…………っ」

全身に力を入れる。
さあ、僕の前に姿を現せ。

僕に救いをもたらしてくれ……！
僕を、守ってくれ……！

そっと、目を開けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	CreateBG(100, 500, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

	CreateSE("SE10","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE10", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800020ta">
「…………」

僕が構えている剣は――

なんの変化もなかった。
相変わらずチープな見た目の、オモチャのままだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800030ta">
「……そ、そりゃそうだよな……」

妄想を現実にする超能力なんて、そんな邪気眼みたいな力はあるわけないんだ。

中２病もはなはだしい。

自分にそんな力があるなんて信じかけたのが恥ずかしかった。

ため息をついて、剣を下ろす。

そのとき、背後から視線を感じた。

首筋に、チリチリとした感覚。
ゾワリと全身に鳥肌が立った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


	SetVolume("SE10", 1000, 500, NULL);

//この辺から緊迫ＢＧＭ開始
	BGMPlay360("CH01", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
またあの“視線”か……？

明確な気配がある。
僕は今、見られている。

僕を、見るな。

振り向かないぞ……！
振り向いたりするもんか……！

//◆深刻そうなブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800040ri">
「…………」

ん……？

気配だけじゃなくて今、声が聞こえたぞ。

正確には声じゃなくて、吐息のようなもの。

ま、まさか……
僕はとんでもない勘違いをしていたかも……

そーっと、振り返ってみた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＨ//梨深
	Stand("st梨深_制服_通常","angry", 200, @-100);
	FadeStand("st梨深_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
梨深が、僕をじっと見つめていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800050ta">
「……はあ」

なんだ、そういうことか。

どうりでいつもより強烈な気配を感じるはずだよ。

“見られている気がする”じゃなくて、実際に見られていたんだから、それも当然だ。

紛らわしいことしてくれるよ。

っていうか、僕が中２病丸出しで剣を構えていた一部始終を、梨深に見られちゃったのか……。

こ、これはかなり恥ずかしい……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800060ri">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800070ta">
「……？」

でも、なんだか様子が変だ。

梨深は眉間に皺を寄せ、まばたきひとつせずにこっちをにらみつけてくる。

しかも彼女が見ているのは僕じゃなくて――

僕が持っている、オモチャのディソード。

どうしてそんな深刻そうな顔をしてるんだろう。

さっきまで特許の話で首を傾げていたのとはまるで別人だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＣＧ//張り付け死体の前に立ち、こちらを振り返る血まみれの梨深
//フラッシュバックで一瞬表示
	CreateTextureEX("はりつけ２", 500, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");

	if(#下着パッチ==true)
	{
		CreateTexture360("梨深", 600, center, -352, "ex/hu/hu梨深_制服_正面血まみれ_下着_lost_eye01.png");
	}else{
		CreateTexture360("梨深", 600, center, -352, "cg/hu/hu梨深_制服_正面血まみれ_lost_eye01.png");
	}

	Fade("梨深", 0, 0, null, true);
	Move("梨深", 0, @120, @0, null, true);

	CreateSE("SE01","SE_衝撃_衝撃音01");
	MusicStart("SE01", 0, 600, 0, 1000, null, false);

	Fade("はりつけ２", 200, 1000, null, false);
	Fade("梨深", 200, 1000, null, true);


	FadeDelete("梨深", 300, 1000, null, false);
	FadeDelete("はりつけ２", 300, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
イヤな記憶が脳裏をかすめた。

梨深は僕の味方だ。そのはずだ。

でもまだ、彼女の謎がすべて解けたわけじゃない。

なにか……ディソードのことを梨深も知っているのか……？

僕はゴクリと息を呑んで、恐る恐る呼びかけてみた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800080ta">
「あ……の……」

//深刻そうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800090ri">
「タク……」

梨深は視線を固定したまま、口を開いた。感情を排除した、押し殺したような声。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800100ri">
「その剣だけど……」

――梨深は……僕の味方だよね？

――優愛みたいに、裏切ったりしないよね……。

――梨深にまで裏切られたら、僕はもう……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800110ri">
「捨てた方が、いいと思う」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800120ta">
「ど、どう……して……」

声がかすれそうになった。
やっぱり、梨深もなにか知っている……？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800130ri">
「だって――」

梨深の視線がようやく動き、今度はまっすぐに僕の目に向けられた。

僕は慌てて目をそらす。

“だって”――なんだって言うんだよ……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800140ri">
「だって」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800150ri">
「もう、高校生だし」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//緊迫ＢＧＭはここで終了
	SetVolume360("CH01", 1000, 0, NULL);

	SetVolume("SE10", 1000, 1000, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800160ta">
「は……？」

{	Stand("st梨深_制服_通常","smile", 200, @-100);
	FadeStand("st梨深_制服_通常_smile", 300, true);
	DeleteStand("st梨深_制服_通常_angry", 0, true);}
梨深はいきなり破顔した。
いたずらげな笑み。

その唐突な変化に、僕は拍子抜けしてしまう。

{	Stand("st梨深_制服_通常","normal", 200, @-100);
	FadeStand("st梨深_制服_通常_normal", 300, true);
	DeleteStand("st梨深_制服_通常_smile", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800170ri">
「そりゃ、男の子っていくつになってもそういうオモチャが大好きなんだなーってのは、なんとなく分かるけど」

{	Stand("st梨深_制服_通常","hard", 200, @-100);
	FadeStand("st梨深_制服_通常_hard", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800180ri">
「さすがにそんな大きなオモチャ、ひとりで部屋で振り回してるのは、どうかと思うよー」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800190ri">
「それが許されるのは小学生までじゃない？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800200ri">
「あ、でもでも、タクの個人的な趣味をあたしの前で披露してくれたってのは、ちょっと嬉しいかも」

{	Stand("st梨深_制服_通常","happy", 200, @-100);
	FadeStand("st梨深_制服_通常_happy", 300, true);
	DeleteStand("st梨深_制服_通常_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800210ri">
「あたしにだけ秘密を教えてくれたみたいで。あはは」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800220ta">
「…………」

な、なんだそれ。
はあ、ビビって損した……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	PositiveHuman();

//合流４へ

}


//=============================================================================//

if($妄想トリガー２２ == 1)
{

//☆☆☆
//分岐１１

	CreateBG(100, 500, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
まだＰＣモニタを眺めながら眉をひそめてうなっている梨深を放っておいて、部屋の隅に立て掛けておいたオモチャのディソードを手に取る。

部屋の真ん中に立ち、それをエンスーキャラの見よう見まねで正眼に構えた。

その時点で、なんだか滑稽な気分になった。

僕みたいなヒョロヒョロの日本人が、こんな大きな剣を構えたって、様になるわけがない。

コスプレイベントなんかの写真をネットでよく見るけど、その大半はどれも痛々しいものばっかりだ。今の僕もきっとそうに違いない。

これは無理かも分からんね……。

頭の片隅でそう思いつつも、とりあえずやってみることにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 1000, 0, NULL);

//ＢＧ//黒
	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 1000, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
えーっと、頭の中に剣のイメージを思い浮かべればいいのかなぁ……。

剣っていうと、どうしてもエンスーに出てくるものがモチーフになってしまう。

それとも、セナやあやせが持っていたあの、美麗で、禍々しくて、触れればすべてを断ち切ってしまいそうな剣をイメージすればいいんだろうか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//黒背景に拓巳のディソード（ぼやけている）
	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg147_01_2_ディソード想像_a.jpg");
	Request("back04", Smoothing);
	SetShade("back04", HEAVY);
	Fade("back04", 0, 1000, null, false);

	FadeDelete("back03", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
いまいちはっきりとした形を思い描けない。

心に迷いがあるせいだ。

エンスーの剣か、セナやあやせの持っていたような剣か、
どっちかに絞った方がいい。

となるとやっぱり、後者だよね。
よ、よし、ダメでもともとだ。

脳内で妄想を再現し、奥歯を噛みしめて剣を握る手に力をこめる。強く念じる。

現実になれ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//◆深刻な感じで
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800230ri">
「やめて」

と、剣を握る僕の手に、柔らかくて温かいものが覆い被さってきた。

ドキッとして目を開ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	CreateBG(100, 500, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

	Stand("bu梨深_制服_通常","angry", 200, @-150);
	FadeStand("bu梨深_制服_通常_angry", 500, true);


	BGMPlay360("CH01", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
僕の横から手を伸ばした梨深が、

僕の手首をつかんでいた。

彼女はうなだれ、
苦しそうに眉根を寄せ、
わずかに唇を震えている。

なんだ……？

様子が変だ。

さっきまで特許の話で首を傾げていたのとはまるで別人だ……。

それに“やめて”ってどういう意味だろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＣＧ//張り付け死体の前に立ち、こちらを振り返る血まみれの梨深
//フラッシュバックで一瞬表示
	CreateTextureEX("はりつけ２", 500, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");

	if(#下着パッチ==true)
	{
		CreateTexture360("梨深", 600, center, -352, "ex/hu/hu梨深_制服_正面血まみれ_下着_lost_eye01.png");
	}else{
		CreateTexture360("梨深", 600, center, -352, "cg/hu/hu梨深_制服_正面血まみれ_lost_eye01.png");
	}

	Fade("梨深", 0, 0, null, false);
	Move("梨深", 0, @120, @0, null, true);

	CreateSE("SE01","SE_衝撃_衝撃音01");
	MusicStart("SE01", 0, 600, 0, 1000, null, false);

	Fade("はりつけ２", 200, 1000, null, false);
	Fade("梨深", 200, 1000, null, true);


	FadeDelete("梨深", 500, 1000, null, false);
	FadeDelete("はりつけ２", 500, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
イヤな記憶が脳裏をかすめた。

梨深は僕の味方だ。そのはずだ。

でもまだ、彼女の謎がすべて解けたわけじゃない。

なにか……ディソードのことを梨深も知っているのか……？

僕はゴクリと息を呑んで、恐る恐る呼びかけてみた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800240ta">
「あ……の……」

//◆深刻そうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800250ri">
「タク……」

梨深は目を伏せたまま、口を開いた。
感情を排除した、押し殺したような声。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800260ri">
「その剣だけど……」

――梨深は……僕の味方だよね？

――優愛みたいに、裏切ったりしないよね……。

――梨深にまで裏切られたら、僕はもう……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800270ri">
「捨てた方が、いいと思う」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800280ta">
「ど、どう……して……」

声がかすれそうになった。

やっぱり、梨深もなにか知っている……？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800290ri">
「だって――」

梨深の視線がようやく動き、今度はまっすぐに僕の目に向けられた。

僕は慌てて目をそらす。

“だって”――なんだって言うんだよ……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800300ri">
「だって」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800310ri">
「もう、高校生だし」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800320ta">
「は……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SetVolume360("CH01", 1000, 0, NULL);

	DeleteStand("bu梨深_制服_通常_angry", 500, true);

	Stand("st梨深_制服_通常","smile", 200, @-100);
	FadeStand("st梨深_制服_通常_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
梨深はいきなり破顔した。
いたずらげな笑み。

その唐突な変化に、僕は拍子抜けしてしまう。

{	Stand("st梨深_制服_通常","normal", 200, @-100);
	FadeStand("st梨深_制服_通常_normal", 300, true);
	DeleteStand("st梨深_制服_通常_smile", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800330ri">
「そりゃ、男の子っていくつになってもそういうオモチャが大好きなんだなーってのは、なんとなく分かるけど」

{	Stand("st梨深_制服_通常","hard", 200, @-100);
	FadeStand("st梨深_制服_通常_hard", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800340ri">
「さすがにそんな大きなオモチャ、ひとりで部屋で振り回してるのは、どうかと思うよー」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800350ri">
「それが許されるのは小学生までじゃない？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800360ri">
「あ、でもでも、タクの個人的な趣味をあたしの前で披露してくれたってのは、ちょっと嬉しいかも」

{	Stand("st梨深_制服_通常","happy", 200, @-100);
	FadeStand("st梨深_制服_通常_happy", 300, true);
	DeleteStand("st梨深_制服_通常_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800370ri">
「あたしにだけ秘密を教えてくれたみたいで。あはは」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800380ta">
「…………」

な、なんだそれ。
はあ、ビビって損した……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	NegativeHuman();

//合流４へ

}

//=============================================================================//

if($妄想トリガー２２ == 0)
{

//☆☆☆
//分岐１２
	CreateBG(100, 500, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
部屋の隅に立て掛けておいたオモチャのディソードを手に取る。

部屋の真ん中に立ち、それをエンスーキャラの見よう見まねで正眼に構えた。

よし、頭の中に剣のイメージを――

{	Stand("st梨深_制服_通常","normal", 200, @-100);
	FadeStand("st梨深_制服_通常_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800390ri">
「…………」

梨深が、こっちを見ていた。
目が合った。

//◆ニヤニヤ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800400ri">
「…………」

//◆ニヤニヤ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800410ri">
「ふ～ん……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	BGMPlay360("CH03", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
なんか、ニヤニヤしてる……。

僕は自分の顔が火照ってくるのを感じた。

ついいつもの癖で、この部屋に自分ひとりしかいないつもりで剣を構えちゃったけど……。

きっと梨深の目には、今の僕がかなり痛々しく映っている……かも……。

鬱だ……。

{	DeleteStand("st梨深_制服_通常_normal", 500, true);}
自重して、剣を下ろした。

恥ずかしくて、梨深の方を見られない。

穴があったら入りたいとは、まさにこのことだよ。

見なかったことにしてもらえないかな。

そうしてくれるなら土下座でもなんでもするね……。

そんな僕に、梨深が追い討ちをかけてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","normal", 200, @-100);
	FadeStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//◆いたずらげに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800420ri">
「ねえねえ、チャンバラごっこ？」

僕は首を横に振った。

//◆いたずらげに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800430ri">
「いつもそういうことしてるの？」

もう一度、僕は首を横に振った。

//◆いたずらげに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800440ri">
「今日が初めて？」

今度はコクコクとうなずく。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800450ri">
「チャンバラごっこの相手役、あたしがしようか？　よく分からないけど」

僕は激しく首を横に振った。

っていうかチャンバラごっこじゃないって言ってるのに……。

//◆いたずらげに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800460ri">
「ねえタク。どうしてこっち見てくれないのかなー？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800470ta">
「…………」

そんなの恥ずかしいからに決まってるじゃないかっ。

まずいものを見られた。

隠していたエロ本を恋人に発見させられたときの男の心理状態は、きっと今の僕と近いに違いない……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800480ri">
「タクってさ……」

もしかして軽蔑されちゃっただろうか。

最悪だ。なんとかして誤解を解かなきゃ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","smile", 200, @-100);
	FadeStand("st梨深_制服_通常_smile", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800490ri">
「かわいいねー♪」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800500ta">
「……え？」

{	Stand("st梨深_制服_通常","happy", 200, @-100);
	FadeStand("st梨深_制服_通常_happy", 300, true);
	DeleteStand("st梨深_制服_通常_smile", 0, true);}
//◆はにかむ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800510ri">
「かなりキュンと来ちゃったなぁ、今のは。あはは」

ＰＣデスク用のイスに置いてあった星来たん抱き枕を胸にギュッと抱きしめて、梨深は身もだえている。

バカにされてるのかと思ったけど、その態度を見る限り、どうやら本気で言ってるらしい。

つまり、梨深は僕に対して――
不覚にも萌えた、と。

ホッとした。

嫌われたわけじゃなかったんだ。よかった……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流４へ

}

//=============================================================================//

//☆☆☆
//合流４

	Stand("st梨深_制服_正面","normal", 200, @-100);
	DeleteStand("st梨深_制服_通常_happy", 500, false);
	FadeStand("st梨深_制服_正面_normal", 500, true);

	BGMPlay360("CH03", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800520ri">
「そもそもそれ、どこで買ってきたの？　高かったんじゃない？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800530ta">
「い、一万円……。渋谷の……雑貨屋で……」

{	Stand("st梨深_制服_正面","smile", 200, @-100);
	FadeStand("st梨深_制服_正面_smile", 300, true);
	DeleteStand("st梨深_制服_正面_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800540ri">
「へえ、一万円か……安いのか高いのか、分からないけど。たはは」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800550ri">
「でもそんな大きなオモチャが、普通に売ってるんだね。あたし、そんな大きなのを直接見たのって初めて」

{	Stand("st梨深_制服_通常","normal", 200, @-100);
	DeleteStand("st梨深_制服_正面_smile", 500, false);
	FadeStand("st梨深_制服_通常_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800560ri">
「その雑貨屋さんに売ってるっていうのは、誰かに教えてもらったの？」

やけに食いついてくるな……。
こういう剣に興味があるのかな？
こっそり梨深も中２病だとか。

僕が剣を持っていることにはちょっとバカにしたような態度を取っておきながら、実は自分も欲しくてしょうがないってヤツ？

それなんてツンデレｗｗｗふひひｗｗｗ

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SetVolume360("CH03", 4000, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800570ta">
「じ、自分で、調べた……ネットで」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800580ri">
「ネットかあ」

{	Stand("st梨深_制服_正面","normal", 200, @-100);
	DeleteStand("st梨深_制服_通常_normal", 500, false);
	FadeStand("st梨深_制服_正面_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800590ri">
「すごいな、なんでも情報が手に入るんだね。あたしは全然ダメ。パソコンなんてろくに使えないよー」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800600ri">
「で、その剣って流行ってるの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800610ta">
「え……な、なんで……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800620ri">
「タクはどうしてそれを買おうと思ったのかな、って」

ホントのことを、梨深に話すべきかな……。

これから一緒にいてもらうなら、今後本物のディソードを探すときに付き合ってもらうことになるかもしれないし、今ここで話しておいた方がいいかもしれない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	BGMPlay360("CH15", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800630ta">
「こ、これは、ニセモノ……だけど……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800640ta">
「本物が……あるんだ……」

{	Stand("st梨深_制服_通常","normal", 200, @-100);
	DeleteStand("st梨深_制服_正面_normal", 500, false);
	FadeStand("st梨深_制服_通常_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800650ri">
「本物？」

梨深は怪訝な顔をして首を傾げた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800660ta">
「ほ、本物を、持ってる人を、ぼ、僕、知ってるんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800670ta">
「２人、い、いる。同じ、学校……の、女子……」

{	Stand("st梨深_制服_通常","hard", 200, @-100);
	FadeStand("st梨深_制服_通常_hard", 500, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//◆深刻なブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800680ri">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800690ri">
「女子ねえ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800700ri">
「女の子がこんなオモチャを欲しがるかな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800710ta">
「ホ、ホント、なんだ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800720ta">
「そ、そ、それに、オモチャ、じゃない……！」

{	Stand("st梨深_制服_正面","sad", 200, @-100);
	DeleteStand("st梨深_制服_通常_hard", 500, false);
	FadeStand("st梨深_制服_正面_sad", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800730ri">
「あ、ゴメン」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800740ta">
「ほ、本物は、光るんだ……！　それに、すごい、そ、存在感で……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800750ta">
「僕……そ、それを、探してる……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800760ta">
「それさえ、て、手に入れれば……僕は、す、救われるんだ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800770ri">
「救われる……って」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
梨深はポカンと呆けたような顔をしたけど、僕はいたって真面目だ。

それに、『将軍』に対抗するのにディソードは強い支えになる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800780ta">
「そ、それで、あの……て、てつ……」

{	Stand("st梨深_制服_正面","normal", 200, @-100);
	FadeStand("st梨深_制服_正面_normal", 500, true);
	DeleteStand("st梨深_制服_正面_sad", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800790ri">
「……？」

一緒に探すのを手伝ってほしい、って言いたかった。

だけど、もし断られたらどうしようって考えたら、怖くて、不安で、なにも言えなくなった。

僕はニセモノの剣をその場に放り出し、ソファに座り込む。

ため息をつきながら、目を閉じた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_正面_normal", 500, false);

//ＢＧ//黒
	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
梨深の方から、探すのを手伝ってあげるって言ってくれないかな……。

そしたら、僕は即ＯＫするのに。

さすがにそこまで期待するのは無理があるか……。

ただ、梨深は今までにも、まるで僕の心の声を聞いたかのように、ピンチのときに颯爽と現れてくれた。

だから、もしかしたら――

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800800ri">
「とにかく。もし本物があったとしても、それこそ買ったりしちゃダメだよ？　今タクが持ってるのはオモチャだからいいけど、本物ってことは銃刀法違反になっちゃうんだから！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800810ta">
「…………」

僕の期待はあっさり打ち砕かれた。
うう、梨深にはがっかりだ……。

まあ、梨深のリアクションは、きっと一般人としてはすごくまともなんだろう。

僕は、ここ数週間でいろいろと訳の分からないことに遭遇したことも
あって、セナやあやせの話を信じかけているけど。

……やっぱりディソードは、自分ひとりで探すしかない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800820ri">
「それで、タク」

梨深が、僕の横に座ってくるのを、気配で感じた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800830ri">
「その本物の剣を持ってる女子って……誰、かなぁ？」

{	SetVolume360("CH15", 1000, 0, NULL);}
声がすぐ近くから聞こえてくる。
真横にいるぞ……。

密閉した、薄暗い部屋で、ふたりきり。しかも、こんな隣り合って座っているなんて……。

緊急事態だ……！　緊急事態発生！

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800840ri">
「タクに女子の知り合いがあたし以外にいたなんて……ちょっとビックリ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800850ri">
「もしかして～、カノジョ？」

そ、そういう話題を、あえてするのか……。

もしかして、梨深は僕を誘ってるのか？

この話題から後に続く展開って、恋愛の話しかなさそうなんだけど……！

それで告白っぽいセリフとか言われて、
そのままいい雰囲気になって……とか……！？

む、無理だ、心の準備がまったくできてないよ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	CreateTextureEX("back12", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("back12", 500, 1000, null, true);

	Delete("back0*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
僕は目を開き、必死で首を振った。

あやせもセナも……ミステリアスな存在だ。そしてどっちもデンパな不思議ちゃんだ。

二次元キャラなら萌えただろうけど、三次元じゃ萌えない。<k>
特にセナなんて、話してるだけで怖い。
普通に暴力を振るってきそう。

できればあんまり関わり合いにはなりたくない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_右向き","hurry", 200, @+150);
	FadeStand("bu梨深_制服_右向き_hurry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601028]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09800860ri">
「そっか。ちょっと……安心した、かな。たはは」

//◆小声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09800870ta">
「え……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_右向き_hurry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602028]
フ、フ、フラグキタァァァァァァァ！１！１！！

やばいやばいやばい！
思わず全身が凍り付く。

今のって明らかに、狙って言ってるよね！？

ここ、これが恋愛の機微ってやつなのか！？

この一連の会話の流れからして、僕は梨深の手の平の上で転がされてる可能性大だ！

こ、こ、こ、これはいったいなんて答えれば……

梨深の期待することを言えばいいの？

いや、そりゃ悪い気はしないけどっ。

で、でも僕、生身の女の子と付き合うなんて自信ないし……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("２３");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();
	
}