//<continuation number="680">

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_166_あやせ編_顕現する邪心";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_166_あやせ編_顕現する邪心();
}


function cha_166_あやせ編_顕現する邪心()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編
//ＳＥ//衝撃音
//ＢＧ//道玄坂・崩壊後・錆び付いた世界（または「おどろおどろしいイメージ」）
	PrintBG(1000);

	CreateColor("Red", 1500, 0, 0, 1280, 720, "Red");
	Fade("Red", 0, 0, null, true);
	Request("Red", AddRender);

	CreateSE("SE02","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
	CreateSE("SEおど","SE_衝撃_衝撃音02");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg027_05_6_chn道玄坂_a.jpg");

	CreateMovie360("砂嵐", 500, Center, Middle, true, false, "dx/mv砂嵐.avi");	
	MusicStart("SE02",0,1000,0,1000,null,true);

//ＳＥ//衝撃音
//ＢＧ//おどろおどろしいイメージ
	Fade("砂嵐", 0, 1000, null, true);
	Fade("Red", 200, 1000, null, true);

	Fade("背景１", 0, 1000, null, true);

	Fade("back*", 200, 0, null, true);
	Delete("back*");

	MusicStart("SEおど", 0, 700, 0, 1000, null, false);
	SetVolume("SE02", 1500, 300, null);

	FadeDelete("Red", 1000, false);
	Fade("砂嵐", 1000, 0, null, true);
	Delete("砂嵐");

	CreateSE("SE01","SE_じん体_動作_抱く1");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕がそう思ったのと同時に、世界は錆で覆われた。

あやせの胸から、黒い靄が蛇のように鎌首をもたげている。

見るだけで強い不快感を感じる。心が圧迫されて、目をそらしたくなる。

ここで目をそらしたら、結局今までと変わらない。
だから、頑張らなくちゃ、と思うんだけど……。

耐えられなかった。
胸が押し潰されるような感覚を覚えて。
頭痛も激しくなってきている。

無理だ、やっぱり無理だった……。
誰かを助けようなんて、僕はそんな器じゃないんだ……。

{	Stand("buあやせ_制服_自分抱きしめ","sad", 250, @-50);
	FadeStand("buあやせ_制服_自分抱きしめ_sad", 500, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400010ay">
「拓巳……」

あやせの呼びかけに、僕は顔を上げた。
彼女の手が、僕へと差し出される。
潤んだ瞳が、僕をまっすぐに捉えている。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400020ay">
「来て……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400030ay">
「私を、好きにして……」

完璧なる信頼。
あるいは、依存？

だけど、これまで人から頼りにされたことなんてなかった。
心が萎えそうになっていたけど、あやせの声でかろうじて踏みとどまる。

唇を噛み、僕は一歩、あやせへ踏み出す。

あやせの黒い靄が、獲物を見つけたかのように僕へと伸びてきて、首に巻き付いてきた。

その靄は、熱いと錯覚してしまうほど冷たくて。
緩やかな力で、心地よく、首を絞めてくる。

{	MusicStart("SE01",0,1000,0,1000,null,false);
	DeleteStand("buあやせ_制服_自分抱きしめ_sad", 500, true);}
あやせが僕の方へ寄りかかってきた。
身体の力を抜き、ぐったりとしてしまう。
僕は、あやせの全体重を支えなくちゃいけなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 2000, 0, null);


//ＣＧ//拓巳にしがみつくあやせ。胸には黒い靄
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 200, 1000, null, true);

	Delete("背景１");

	CreateTexture360("あやせ霧１", 100, 0, 96, "cg/ev/ev128_01_6_あやせしがみつき_a.jpg");

	BGMPlay360("chn03",0,1000,true);

	Move("あやせ霧１", 1500, @0, @-96, Dxl1, false);
	FadeDelete("Black", 1000, true);

	Wait(1000);
	CreateSE("SE01","SE_擬音_肉手を突っ込む");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400040ay">
「拓巳……」

僕は、彼女の細い腰を抱く。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400050ta">
「ほ、ホントに……いいの……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400060ay">
「……いいわ」

ゴクリと、僕は息を呑んで。
あやせの胸から溢れ出している黒い靄へ、手を伸ばした。

刹那、靄は実体を持った黒いヒルへと姿を変える。
おぞましさに拍車がかかる。

あやせのありのままの邪心。
あやせが最も人に見せたくない、醜い部分。
その塊だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE01",0,1000,0,1000,null,false);

	CreateTexture360("あやせ霧２", 100, 0, 0, "cg/ev/ev128_02_6_あやせしがみつき_a.jpg");
	Fade("あやせ霧２", 0, 0, null, true);
	Fade("あやせ霧２", 500, 1000, null, true);
	Delete("あやせ霧１");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
ヒルの身体をつかんだ。
ぬるぬるとしていて、しかも痛みすら感じるほどの冷たさ。

今すぐ手を離したかったのを、必死で歯を食いしばり、耐えた。

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400070ay">
「はぁ……あ……ん……っ」

あやせは、恍惚と苦痛のない交ぜになった表情を浮かべ、苦しげにうめく。

//◆「引っ張って」
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400080ay">
「ひっ……ぱって……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400090ay">
「抜いて……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ぐちゃぐちゃぐちゃ
//※肉がこすれる音というかなんというか……

	CreateSE("SE01","SE_擬音_ぐちゃぐちゃ");
	CreateSE("SE02","SE_擬音_びちゃ");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
思い切り引っ張ってみる。
ズルズルと肉がちぎれるような感触が手から伝わってくる。

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400100ay">
「くぅ……あ……ああぁっ……！」

//ＳＥ//びちゃっと水音
{	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
黒い液体が、あやせの胸から飛び散った。
僕の手や顔にかかる。

血なのか、それ以外のなにかなのかは分からない。

それでも構わず、僕はなおもヒルを引っ張る。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400110ay">
「ダ……メっ……うぅ……ぁあっ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400120ta">
「だ、だだ、大丈夫……！？」

僕はたまらず手を止めた。
その手に、あやせが手の平を重ねてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_擬音_ぐちゃぐちゃ");
	CreateSE("SE02","SE_擬音_びちゃ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400130ay">
「はぁはぁ……と、止めないで……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400140ay">
「うぅ……ダメじゃ……ないから……」

全身を汗まみれにしながらも、あやせは気丈にそう告げてくる。

もう躊躇はなかった。
逆に躊躇していたらあやせを苦しめるだけだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400150ta">
「ぬ……けろぉっ……！」

全力を込めて、ヒルを――

引き抜く――！

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400160ay">
「あ、ああ……ああああ――――っ」

//ＳＥ//ぐちゃぐちゃぐちゃ
//ＳＥ//びちゃっと水音
{	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Wait(50);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
あやせが全身をビクンビクンと痙攣させて。

ヒルがずるずると抜け出てくる。
それは予想以上に長かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("chn03", 2000, 0, NULL);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

//ＢＧ//道玄坂・崩壊後・錆び付いた世界（または「おどろおどろしいイメージ」）
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg027_05_6_chn道玄坂_a.jpg");
	Fade("Black", 500, 0, null, true);

	Delete("Black");
	Delete("あやせ霧２");

	CreateSE("SE01","SE_擬音_ぐちゃぐちゃ");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
ヒルは丸い塊となり、僕の腕に巻き付いた。
拳をすさまじい力で締め付けてくる。
それは邪心の断末魔とでも言うべきものだった。

その痛みに、僕は歯噛みして耐える。
あやせから引きはがしたのはいいけど、これをどうしたらいいのか分からない。

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400170ay">
「祈って……」

あやせが僕に身体を委ねたまま、僕の頬を優しく撫でてくる。

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400180ay">
「不浄なる邪心は、キミの手で純粋な邪心へと変わるわ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//女性の悲鳴のような共鳴音
	CreateSE("SE03","SE_擬音_共鳴音_女性悲鳴のよう");
	CreateColor("紫", 1000, 0, 0, 1280, 720, "800080");
	Request("紫", AddRender);
	Fade("紫", 0, 0, null, true);

	MusicStart("SE03", 500, 1000, 0, 1000, null, false);
	Fade("紫", 1000, 800, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
僕の手で蠢いていた黒い邪心が、やがて紫色に発光する。

悲鳴にも似た共鳴音を発して。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_擬音_共鳴音_激しい_LOOP");
	CreateSE("SE04","SE_擬音_ディそーど出現");
	CreateSE("SE360301","SE_擬音_ディそーどかまえる");

	CreateColor("赤い光", 3500, 0, 0, 1280, 720, "RED");
	Request("赤い光", AddRender);
	Fade("赤い光", 0, 0, null, false);

//ホワイトアウト
	CreateColor("フラッシュ", 3000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 200, 1000, null, true);

	Delete("紫");
	Delete("背景１");

	Wait(500);
	
//ＳＥ//ディソード顕現
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

//ＢＧ//拓巳ディソード
	Fade("赤い光", 200, 800, null, true);
	Fade("赤い光", 2000, 0, null, false);


	CreateTexture360("back10", 100, Center, Middle, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");
	CreateTexture360("back11", 100, Center, Middle, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");
	Zoom("back11", 0, 2000, 2000, null, true);
	SetBlur("back11", true, 2, 400, 100);
	Fade("back11", 0, 500, null, false);

	Fade("フラッシュ", 1000, 0, null, false);
	MusicStart("SE360301",0,1000,0,1000,null,false);
	Zoom("back11", 1500, 1000, 1000, Dxl2, true);

	MusicStart("SE01",1000,1000,0,1000,null,true);


	Wait(1500);

	Delete("back11");
	Delete("フラッシュ");
	Delete("赤い光");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
――邪心は、剣へと姿を変えていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400190ta">
「こ……れ……ディソード……！？」

あれだけ、欲していて、でもどうしても手に入れられなかった。
そのディソードが今、僕の手の中にある。
あやせの邪心が、ディソードに変化した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：拓巳ディソード表示時間が短いですがあやせ出します。
	CreateTexture360("おど", 100, 0, 0, "cg/bg/bg027_05_6_chn道玄坂_a.jpg");
	Fade("おど", 0, 0, null, true);
	Fade("おど", 1000, 1000, null, true);

	Delete("back*");

	Stand("buあやせ_制服_自分抱きしめ_胸血","ero", 250, @-50);
	FadeStand("buあやせ_制服_自分抱きしめ_胸血_ero", 500, true);

	SetVolume360("SE01", 4000, 0, null);

	BGMPlay360("CH22",0,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400200ay">
「目覚めたのね、拓巳」

僕の腕の中で、あやせは苦しげながら微笑みを浮かべた。
額には汗がにじみ、前髪がそこに張り付いてしまっている。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400210ay">
「ありがとう……目覚めてくれて……」

僕は、あやせに感謝されることを、したのかな……。
分からない。自信がない。

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400220ay">
「拓巳……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buあやせ_制服_自分抱きしめ_胸血_ero", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
あやせが、僕の首に手を回して。
ギュッと、僕を抱きしめてくる。

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400230ay">
「キミだけよ。私の話を、真面目に聞いてくれたのは……」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400240ay">
「嬉しかった。すごく……」

あやせの身体は、とても熱い。
胸の黒い液体は徐々にその色を赤へと変えていた。
その血が、僕の服をも汚す。

それでも構わない。僕もあやせをきつく抱きしめる。
まだ彼女の息は荒くて、背中が呼吸のたびに大きく揺れていた。
あやせの、汗の匂い。その匂いもまた愛おしく感じた。

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400250ay">
「大好き……」

僕は、あやせのこと、好きになってるのかな……？

……依存はしているかもしれない。
そしてあやせもまた、僕に依存してくれている。

こんな関係も悪くないって思った。
このまま２人で――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("@CH22", 1000, 0, null);
	Wait(1000);

//	ClearAll(2000);
//	Wait(1000);
}

