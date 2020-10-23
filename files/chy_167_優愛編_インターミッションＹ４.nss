//<continuation number="250">

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_167_優愛編_インターミッションＹ４";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_167_優愛編_インターミッションＹ４();
}


function chy_167_優愛編_インターミッションＹ４()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//★優愛編
//■インターミッションＹ４
//ＢＧ//コーネリアスタワー屋上//夜

//■アイキャッチIN
	IntermissionIn();

	Delete("*");
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg220_01_3_chnコーネリアス屋上_a.jpg");

//■アイキャッチOUT
	IntermissionIn2();

	Wait(1000);

	BGMPlay360("CH22", 5000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
西條くんの言うことは、もっともだった。

不思議だけど。
感じるのは、寂しさ。
胸の奥が、切なくうずく。

結局、わたしは彼が『将軍』だということを最後までこの目で確かめられなかった。
彼の言う通り、間違っていたのはわたしなのかも。

どっちにしても、彼を恨むのはわたしの中でもう無意味。

わたしがあのとき優愛ちゃんに、代わりにオフ会へ出るよう頼まなければ、優愛ちゃんは死ななかった。

優愛ちゃんは、死んじゃいけなかったんだ。
友達も多くて、両親からも愛されていて、頭もよくて、美人で。

でも、死んだ。
楠優愛は、死んだ。

そして同時に、楠美愛は、消えた。幽霊みたいな存在になった。わたしが、そうなることを選んだ。

生きているのか、死んでいるのか、分からないわたし。
もう、優愛ちゃんもいないから。
死んだ方がマシ。

ヘリポートの縁に立つ。

そこは、優愛ちゃんたち５人が飛び降りた、その場所。

下を見て、目がくらんだ。
眼下の光はほとんど消えていて真っ暗だとは言え、それでもものすごい高さだと肌で感じる。

優愛ちゃんは、ここから飛んだとき、どんな気持ちだったんだろう。
怖かったんだろうか。

ごめんね、怖い思いさせて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 2000, 1000, null, true);
	Delete("back01");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
――わたしも、今から行くから。

本来、わたしが味わうはずだった苦痛を、優愛ちゃんと同じ痛みを、この身に刻もう。

大きく息を吸う。
心は穏やか。
死ぬことは怖くない。

両手を、翼のように左右に広げて。
目を閉じて。

わたしは、なにもない空間に、自分の足を踏み出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH22", 2000, 0, NULL);

//イメージＢＧ//落下
//落下する美愛からの視点。上空、コーネリアスタワー屋上の方を見ている
//夜空で代用してもＯＫです
//ＳＥ//風を切る轟音（落下中）
	CreateSE("SE3601","SE_擬音_ちを蹴る");
	MusicStart("SE3601",0,1000,0,1000,null,false);

	Wait(1500);

	CreateSE("SE02","SE_衝撃_落下激突");
	CreateSE("SE01","SE_擬音_風圧落下_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

	CreateColor("血", 2000, 0, 0, 1280, 720, "Red");
	CreateColor("下敷き", 50, 0, 0, 1280, 720, "Black");
	Fade("血", 0, 0, null, true);

	CreateTexture360("back02", 110, 0, 96, "cg/bg/bg237_01_6_chn美愛落下_a.jpg");
	CreateTexture360("back03", 100, 0, 96, "cg/bg/bg237_01_6_chn美愛落下_a.jpg");

	Zoom("back02", 0, 3200, 3200, null, true);
		Request("back02", Smoothing);
		SetBlur("back02", true, 2, 500, 100, false);

	Zoom("back03", 0, 3000, 3000, null, true);

	Fade("back02", 0, 300, null, true);
	Fade("back03", 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
自分を支えるものが消え失せて――

墜落する。

{	Shake("back02", 10000000, 1, 4, 0, 1, 1000, null, false);
	Zoom("back02", 20000, 1500, 1500, Dxl1, false);
	Zoom("back03", 20000, 1500, 1500, Dxl1, false);
	FadeDelete("Black", 2000, false);
}
世界が逆さまになる。

わたしを縛るものはなにもなくなる。

落ちているのに、身体が浮き上がるような錯覚。

轟々という風の音の中。

地面が迫ってくる。
２ヶ月前、優愛ちゃんが墜落し、全身の骨を砕き、内臓を破裂させ、血と脳漿を散乱させた、アスファルトが、迫ってくる。

――死にたくない！

ついさっきまで、死は怖くなかったはずなのに。
いざ自分の身体の自由が効かなくなった瞬間に、すさまじい恐怖が襲ってきた。

――死にたくない！

優愛ちゃんは死んだのに、自分は生きたいと願っている。

ただ生存の本能に支配されて。

絶叫する。

心の底から悲鳴を上げる。

わたしは、遠ざかっていく夜空へと、必死で手を伸ばす。
誰もその手をつかんでくれるはずがないって、分かっていながら。

それでも手を伸ばして。

願う。ひたすら叫ぶ。

――死にたくないよ！

けれど、願いは届かなくて。
誰も、わたしの手を握ってなんかくれなくて。

地面が、落ちてきた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	Zoom("back02", 1600, 1000, 1000, Axl1, false);
	Zoom("back03", 1600, 1000, 1000, Axl1, false);

//イメージＢＧ//飛び散った血のイメージ
//ＳＥ//グシャッ（地面に人が激突した音）
	SetVolume("SE01", 1500, 0, null);
	Wait(1500);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Fade("血", 0, 1000, null, true);
	DrawTransition("血", 200, 0, 1000, 100, null, "cg/data/zoom1.png", true);

	Delete("back*");

	DrawTransition("血", 3000, 1000, 0, 100, null, "cg/data/effect.png", false);
	Fade("血", 3000, 0, null, false);

	Wait(2000);
//画面エフェクト//妄想ＯＵＴエフェクト

	DelusionOut();

//ＢＧ//コーネリアスタワー屋上
	Delete("*");
	CreateTextureEX("back01", 100, 0, 0, "cg/bg/bg220_01_3_chnコーネリアス屋上_a.jpg");
	Zoom("back01", 0, 2000, 2000, null, true);
	DelusionOut2();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500010ma">
「いやあああぁぁぁぁっ――！」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500020ma">
「あ……ああ……。え……？」

全身が粉々に砕けたかのような感覚があって。
でもその感覚はすぐに消え。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_自然_風音_LOOP");
	MusicStart("SE04", 2000, 1000, 0, 1000, null, true);

	Fade("back01", 0, 1000, null, true);
	Zoom("back01", 500, 1000, 1000, Dxl2, false);

//徒歩：移動
//ＣＧ//拓巳の手にすがりつき泣く美愛
//	CreateTexture360("美愛１", 200, 0, 0, "cg/ev/ev125_01_3_優愛すがりつき_a.jpg");
//	Fade("美愛１", 0, 0, null, true);
//	Fade("美愛１", 1000, 1000, null, true);

//	Delete("back*");

	Wait(1000);
//	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
我に返ると、わたしはコーネリアスタワーの屋上にへたり込んでいた。

目の前には、西條くん。
わたしの方は見ないまま。
手を、差し伸べていた。

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500030ma">
「な……んで……」

わたしは、飛び降りたはずなのに。
１８０メートル近く墜落して、地面に叩きつけられたはずなのに。

涙を拭うことも忘れて、わたしは呆然と西條くんの手を見つめる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01500040ta">
「気が……す、済んだ……？」

彼の声は、素っ気ない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01500050ta">
「き、き、君に、死なれるのは、こ、困るんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01500060ta">
「まるで僕が、つ、突き落とした、みたいじゃないか。ぼ、ぼ、僕は、殺人犯扱い、されたくないね……」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500070ma">
「わたし……落ちたのに……。自分で、飛び降りたのに……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01500080ta">
「も、妄想でも、見てたんじゃ、ない？」

妄想……？
あんなリアルな感覚や痛みが、妄想だったなんて、信じられない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//	CreateTexture360("美愛２", 100, -520, -440, "cg/ev/ev125_02_3_優愛すがりつき_a.jpg");
//	Request("美愛２", Smoothing);
//	Fade("美愛２", 0, 1000, null, truee);

//	FadeDelete("美愛１", 1500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500090ma">
「ねえ、西條くん……」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500100ma">
「優愛ちゃんは……あんな、痛い思いをして、死んだんだね……」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500110ma">
「なのに、わたし……」

//◆泣く
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500120ma">
「優愛ちゃんと、同じ痛みを味わおうとしたのに……わたしは……！」

{
	SetVolume("SE*", 2000, 0, null);
	BGMPlay360("chn04", 0, 1000, true);
}
//◆泣く
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500130ma">
「死にたくないって、思っちゃったの……！」

//◆泣く
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500140ma">
「本来死ぬのは、わたしだったのに、死にたくないって……！」

//◆泣く
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500150ma">
「もう、飛べない……」

//◆泣く
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500160ma">
「あの痛みを知ってしまったら、もう、怖くて、飛べない……」

//◆泣く
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500170ma">
「わたし、どうすればいいのか……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01500180ta">
「い、今ので、き、君は、一度死んだ」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500190ma">
「え……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01500200ta">
「ゆ、優愛の、痛みを知ったなら、
もう、そ、それでいいじゃないか……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01500210ta">
「こ、これからは、も、もう一度、楠美愛として、い、一から、生きていけば、いいと思う……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01500220ta">
「優愛の、ぶ、分まで……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX2();//――――――――――――――――――――――――――――――

	CreateTexture360("美愛２", 100, -416, -352, "cg/ev/ev125_02_3_優愛すがりつき_a.jpg");
	Request("美愛２", Smoothing);
	Fade("美愛２", 0, 0, null, true);
	Fade("美愛２", 1000, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆泣く
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500230ma">
「あ、ああ……」

//◆泣く
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500240ma">
「あ、りがとう……」

//◆泣く
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01500250ma">
「ありが、とう……」

わたしは、伸ばした手で、彼の手を握った。

{	SetVolume360("chn04", 4000, 0, null);}
その手は、とても――

とても、温かくて――

彼の体温が、肌を通して、伝わってきて――

わたしの手は、温もりとともに、震えが収まって――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX2();//――――――――――――――――――――――――――――――

	$SYSTEM_text_interval = 128;

	CreateTextureEX("美愛３", 1000, 0, 0, "cg/ev/ev125_01_3_優愛すがりつき_a.jpg");

	BGMPlay360Suspend("CHN_ED_yua", 0, 1000, true);

	Move("美愛２", 8000, 0, 0, AxlDxl, false);
	Zoom("美愛２", 8000, 1100, 1100, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
わたしは、まだ、生きているって、感じた――{Wait(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,1000);//――――――――――――――――――――――――――――――

	//BoxDelete(1000);

	Fade("美愛３", 3000, 1000, null, true);

	Delete("美愛２");
	Delete("back*");

//～～Ｆ・Ｏ

//エンディングへ
//	SetVolume360("CHN_ED_yua", 4000, 1000, null);

//優愛編エンド
//	ClearAll(2500);
}
