//<continuation number="250">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_213_Ａインターミッション５５ａ";
		$GameContiune = 1;
		$Ａルート = true;
		Reset();
	}

		ch10_213_Ａインターミッション５５ａ();
}


function ch10_213_Ａインターミッション５５ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//ＢＧ//海と青い空
	if($バット == 1)
	{
	}else{
		CreateTextureEX("背景８", 1000, center, middle, "cg/sys/select/back.png");
		Fade("背景８", 1000, 1000, null, true);
	}

	SetVolume360("CH22", 2000, 0, NULL);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text0001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001360ta">
僕は――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back11", 1000, 0, 0, "cg/ev/ev107_01_1_梨深祈る_a.jpg");
	Request("back11", Smoothing);
//	Request("back11", AddRender);
	CreateTextureEX("back12", 1000, 0, 0, "cg/ev/ev107_01_1_梨深祈る_a.jpg");
	Request("back12", Smoothing);
	Request("back12", AddRender);
	CreateTextureEX("back13", 1000, 0, 0, "cg/ev/ev107_01_1_梨深祈る_a.jpg");
	Request("back13", Smoothing);
	Request("back13", AddRender);

	Zoom("back13", 0, 1500, 1500, null, true);
	Zoom("back12", 0, 2000, 2000, null, true);
	Zoom("back11", 0, 3000, 3000, null, true);

//	SetBlur("back11", true, 2, 300, 100);

	Zoom("back11", 1000, 1000, 1000, Axl1, false);
	Zoom("back12", 1000, 1000, 1000, Axl2, false);
	Zoom("back13", 1000, 1000, 1000, Axl3, false);

	Fade("back11", 300, 500, null, false);
	Fade("back12", 300, 300, null, false);
	Fade("back13", 300, 300, null, true);

	Fade("back12", 1200, 0, Axl3, false);
	Fade("back13", 1200, 0, Axl3, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text0002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21200130ri">
「タクーっ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001370ta">
その声が聞こえた瞬間に。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("back13", null);
	SetBlur("back11", true, 2, 300, 100);

//	CreateSE("SE03","SE_擬音_妄そうIN");
//	MusicStart("SE03",0,1000,0,1000,null,false);
	Fade("back11", 2000, 1000, null, true);

	Wait(300);

	CreateSE("SE04","SE_擬音_ディそーど_具現化直前_Loop");
	CreateSE("SE05","SE_衝撃_衝撃音02");
	CreateSE("SE06","SE_擬音_ディそーど出現");
	CreateColor("色１", 1000, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, true);

	MusicStart("SE04",0,1000,0,1000,null,true);
	MusicStart("SE05",0,1000,0,1000,null,false);
	MusicStart("SE06",0,1000,0,1000,null,false);
	BGMPlay360("CHN_OP", 1000, 1000, true);

	Zoom("back11", 500, 1200, 1200, null, false);
	Fade("色１", 500, 1000, null, true);
	Fade("back11", 500, 0, null, true);
	Delete("back11");
	Delete("back12");
	Delete("back13");

	FadeDelete("背景８", 0, true);
	Fade("色１", 1000, 0, null, true);

	Wait(500);
	CreateTextureEX("360剣追加", 100, 0, -16, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text0003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001380ta">
意識が僕を固定した。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001390ta">
ぐちゃぐちゃにかき回されていた世界が、一気に収束する。

{	Fade("色１", 0, 1000, null, true);
	Fade("360剣追加", 0, 1000, null, true);
	Fade("色１", 500, 0, null, true);
}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001400ta">
混沌は、僕のディソードを形作って収束する。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001410ta">
僕は、僕としての形に、戻る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001420ta">
世界は、世界としての形に、戻る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001430ta">
僕は、僕だ――！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("@text101", null);

	CreateTextureEX("back03", 120, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Zoom("back03", 0, 2000, 1500, null, true);
	Zoom("back04", 0, 2000, 1500, null, true);



//ＳＥ//衝撃音
//ＢＧ//ノアⅡ
	CreateSE("SE10","SE_衝撃_衝撃は_リアルぶーと");

	SetVolume("SE04", 1000, 0, NULL);
	SetVolume("SE05", 1000, 0, NULL);
	SetVolume("SE06", 1000, 0, NULL);

	MusicStart("SE10", 0, 1000, 0, 1000, null, false);

	Fade("色１", 500, 1000, Axl2, false);
	Zoom("360剣追加", 500, 2000, 2000, Axl2, true);
	Delete("360剣追加");

	Wait(1300);

	Fade("back03", 500, 500, null, false);
	Fade("back04", 500, 1000, null, false);
	Zoom("back03", 500, 1000, 1000, Dxl1, false);
	Zoom("back04", 1000, 1000, 1000, Dxl1, false);

	Fade("色１", 500, 0, null, false);
	DrawTransition("色１", 500, 1000, 0, 100, null, "cg/data/zoom2.png", true);

	Delete("色１");

	Wait(1000);
	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text0004]
視界はクリアになっていた。

身体の傷は治っていた。

上半身と下半身は繋がっていた。

僕は自分の足で、立っていた。

痛みは完璧に消えていた。

心は、穏やかに凪いでいた。

//ＶＦ
//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200140jn">
「妄想によく打ち勝ったね」

//ＶＦ
//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200150jn">
「僕の最期の力を、君に託すよ」

梨深の姿を視界の隅に認める。

彼女は無事。
僕を見ている。
泣いている。

泣かないで。

ディソードの柄を握る手。
力を込める。

感触を確かめる。
腕がちゃんと動く。
完全に再生している。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st玄一_スーツ_武器構え","hard", 200, @-400);
	FadeStand("st玄一_スーツ_武器構え_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text0005]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21200160nr">
「これは……実に興味深いですよ」

//◆興奮して苦笑いしながら
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21200170nr">
「この……化け物め……！」

{	DeleteStand("st玄一_スーツ_武器構え_hard", 300, true);}
僕は野呂瀬を見据え。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21200180ta">
「確かに、僕は、化け物だよ。でもこれが」

梨深を救い出すために。
ノアⅡを破壊するために。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21200190ta">
「僕が望んだ妄想だ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

	IntermissionIn();
		DeleteAll();
		CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
		Fade("back04", 0, 1000, null, true);
		Stand("st玄一_スーツ_武器構え","hard", 200, @-400);
		FadeStand("st玄一_スーツ_武器構え_hard", 0, true);
		Delete("back03");
	IntermissionIn2();

	Wait(1000);

//アイキャッチ
//■インターミッション５５ａ

//ＢＧ//ノアⅡ

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
野呂瀬の反応は素早かった。

いまだ、ニシジョウタクミのＣＯＤＥサンプルは採れていない。

妄想による精神攻撃で追い詰めたはずが、逆に足をすくわれかけている。

それを許すわけにはいかなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("st玄一_スーツ_武器構え_hard", 200, @100, @0, Axl1, false);
	DeleteStand("st玄一_スーツ_武器構え_hard", 200, true);
	CreateSE("SE03","SE_擬音_ちを蹴る");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Stand("bu玄一_スーツ_武器構え","hard", 200, @-50);
	Move("bu玄一_スーツ_武器構え_hard", 200, @200, @0, null, true);
	Move("bu玄一_スーツ_武器構え_hard", 200, @-200, @0, Dxl1, false);
	FadeStand("bu玄一_スーツ_武器構え_hard", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
野呂瀬は拓巳との間合いを詰め。
ディソードを斜め下から振り上げる。

拓巳の胸を斜めに斬りつける。
いかなるものを切断するディソード。

対象の硬さに関係しない。
ましてや人を斬るなど、ゼリーを切るように簡単。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ディソードを振る
	CreateSE("SE03","SE_擬音_ディそーど_人を切る");
	CreateSE("SE04","SE_じん体_血_噴きでる");

//おがみ：剣演出
	CreateTextureEX("360剣追加", 100, 0, 0, "cg/bg/bg250_02_6_斬撃汎用横_a.jpg");
	CreateColor("back10", 200, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Fade("360剣追加", 0, 1000, null, true);
	DeleteStand("bu玄一_スーツ_武器構え_hard", 0, true);

	FadeDelete("back10", 200, true);

	Stand("bu玄一_スーツ_武器構え","pride", 200, @-50);

//おがみ：血演出
	CreateMovie360("ムービー", 1000, Center, Middle, false, false, "dx/mvやられ01.avi");
//	Request("ムービー", Play);
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	Delete("360剣追加");

	Wait(500);

	FadeDelete("ムービー", 1000, false);

	Move("bu玄一_スーツ_武器構え_pride", 0, @-100, @50, null, true);
	FadeStand("bu玄一_スーツ_武器構え_pride", 0, false);
	Move("bu玄一_スーツ_武器構え_pride", 200, @100, @-50, Dxl1, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
野呂瀬の素早い一撃で。
拓巳の身体は分断され。

首と右手、右肩が、スライドする。
ズルリと。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Move("bu玄一_スーツ_武器構え_pride", 200, @100, @0, Axl1, false);
	DeleteStand("bu玄一_スーツ_武器構え_pride", 200, true);
	Stand("st玄一_スーツ_武器構え","pride", 200, @-200);
	Move("st玄一_スーツ_武器構え_pride", 200, @-100, @0, Dxl1, false);
	FadeStand("st玄一_スーツ_武器構え_pride", 200, true);

	CreateColor("back11", 500, 0, 0, 1280, 720, "RED");
	Request("back11", AddRender);
	Fade("back11", 0, 0, null, false);

//ＳＥ//内臓が床に落ちる
	CreateSE("SE03","SE_じん体_動作_おうと");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Fade("back11", 100, 1000, null, true);
	FadeDelete("back11", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
内臓ごと、床に落ち。
だが血は出ない。

拓巳の下半身が、倒れかけて。
{	CreateSE("SE03","SE_擬音_ちを蹴る");
	MusicStart("SE03", 0, 300, 0, 1000, null, false);
	SetVolume("SE03", 300, 0, null);}
踏ん張る。

{	Stand("st玄一_スーツ_武器構え","hard", 200, @-300);
	FadeStand("st玄一_スーツ_武器構え_hard", 200, true);
	DeleteStand("st玄一_スーツ_武器構え_pride", 0, true);}
踏ん張っていた。

次の瞬間には、切断面が波打ち。
うごめき。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("st玄一_スーツ_武器構え_hard", 300, true);
	CreateTextureEX("back03", 120, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("back03", 0, 300, null, true);

//ＳＥ//泡立つ音「ぶちゅぶちゅぶちゅ」
	CreateSE("SE03","SE_擬音_拓巳再生");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);


	CreateColor("back11", 500, 0, 0, 1280, 720, "#990000");
	Fade("back11", 0, 700, null, false);
	DrawTransition("back11", 1000, 0, 1000, 400, null, "cg/data/虫食い.png", false);
	Zoom("back03", 50, 1100, 1000, null, true);
	Zoom("back03", 50, 1000, 1100, null, true);
	Zoom("back03", 50, 1100, 1000, null, true);
	Zoom("back03", 100, 1100, 1100, Axl2, true);
	Zoom("back03", 600, 1000, 1000, Dxl2, false);
	Fade("back03", 600, 0, null, true);

	Fade("back03", 600, 0, null, false);
	Fade("back11", 2000, 0, null, true);
	Delete("back03");
	Delete("back11");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
泡立つ音。

そして、再生した。

無傷。
無効。

たった１秒前に斬られた身体。
すでに、新たな首と右手、右肩が生まれていた。
ずり落ちた古い方の首や内臓はそのままに。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300010ta">
「痛覚は遮断した」

拓巳が一歩、野呂瀬へ歩み寄る。

野呂瀬は舌打ち。
ディソードを翻し。

{	Stand("st玄一_スーツ_武器構え","hard", 200, @-300);
	FadeStand("st玄一_スーツ_武器構え_hard", 300, true);}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21300020nr">
「肉体の形を捨てたが故に――」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21300030nr">
「いかなる形をも取れる、ということですか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300040ta">
「あんたの見せてくれた、妄想のおかげだよ」

人としての形が保てなかった――
その妄想を取り込み、拓巳は自分のものとした。

これは再生ではなく。
補充。

失われた部分は。
拓巳の体内から無限に増殖する塵から、再び肉を、骨を作り出し。
補う。

形は一定ではなく。

アメーバのように。
スライムのように。
自在に変えられる。

化け物と、拓巳が自らを呼んだ、それが理由。

拓巳の足が、さらに一歩、野呂瀬へ。

野呂瀬の苛立ちが増す。
ディソードのグリップ部を握りながら、迫る拓巳へと突き出す。
巨大なはさみが拓巳の頭を挟み込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("st玄一_スーツ_武器構え_hard", 200, false);
	Move("st玄一_スーツ_武器構え_hard*", 200, @-100, @0, Axl1, true);

	Stand("bu玄一_スーツ_武器構え","pride", 200, @-150);
	Move("bu玄一_スーツ_武器構え_pride*", 200, @100, @0, Dxl1, false);
	FadeStand("bu玄一_スーツ_武器構え_pride", 200, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21300050nr">
「脳を失えば、妄想はできないでしょう？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE360103","SE_衝撃_衝撃音03");

//おがみ：剣演出
	CreateTextureEX("360剣追加", 100, 0, 0, "cg/bg/bg250_02_6_斬撃汎用横_a.jpg");
	CreateTextureEX("360剣追加２", 100, 0, 0, "cg/bg/bg250_02_6_斬撃汎用横_a.jpg");
	Request("360剣追加２", AddRender);
	Rotate("360剣追加", 0, @0, @0, @180, null,true);

	CreateColor("back10", 200, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);
	DeleteStand("bu玄一_スーツ_武器構え_pride", 200, false);

	Fade("360剣追加", 0, 1000, null, true);

	MusicStart("SE360103", 0, 1000, 0, 1000, null, false);;

	FadeDelete("back10", 200, true);
	Fade("360剣追加２", 200, 1000, null, true);


//ＳＥ//頭を潰される
//ＳＥ//血が噴き出す
	CreateSE("SE03","SE_じん体_血_噴きでる");
	CreateSE("SE04","SE_じん体_動作_おうと");
	CreateSE("SE05","SE_じん体_血_噴きでる_包丁でさされ");
	CreateColor("back10", 200, 0, 0, 1280, 720, "White");
	Fade("back10", 0, 0, null, true);
	Request("back10", Smoothing);


//おがみ：血演出
	CreateMovie360("ムービー", 1000, Center, Middle, false, false, "dx/mvやられ02.avi");
	Rotate("ムービー", 0, @0, @0, @180, null, true);
//	Request("ムービー", Play);
	Delete("360剣追加");
	Delete("360剣追加２");


//	Request("ムービー", Play);
	Fade("back10", 0, 1000, null, true);

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	Wait(300);
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	WaitAction("ムービー", null);

	Delete("ムービー");

	Fade("back10", 300, 0, null, true);
	Delete("back10");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
拓巳の頭が潰される。
割れたスイカ。
血と脳漿が炸裂する。

{	DeleteStand("bu玄一_スーツ_武器構え_pride", 300, true);}
首から上を失って。
拓巳の身体はそれでも前へ。

再生――補充――は、一瞬。

踏み出したかかとが床に付くのと同時。

何事もなかったように。

すげ替えたかのように。

頭は傷ひとつなく、そこにある。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("st玄一_スーツ_武器構え","hard", 200, @-400);
	FadeStand("st玄一_スーツ_武器構え_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
野呂瀬は悟る。
自分では勝てない、と。

ディソードによる物理攻撃は通用しない。

存在理由を否定する妄想攻撃は逆に取り込まれた。

今の西條拓巳は。

人としてはあまりに常軌を逸していて。

存在としてはあまりに歪で。

化け物としてあまりにもふさわしい。

それでも野呂瀬は引き下がるわけにはいかなかった。

ノアⅡの力を利用し、拓巳に無数の反粒子をぶつけるべきだと考える。

いかなる存在も、反粒子をぶつけられれば負の物質へと変化し、自己崩壊へと至る。

外部からの破壊が無理ならば。
内部から崩壊させればいい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 1000, 0, NULL);

	Wait(300);
	CreateSE("SE02","SE_擬音_ディそーど_黒");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300060ta">
「そうなんだね」

野呂瀬の考えを。
拓巳は、読んだ。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21300070nr">
「な……！」

{	DeleteStand("st玄一_スーツ_武器構え_hard", 300, false);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
拓巳のディソードの輝きが、赤から黒へと変わる。

黒き炎は剣を包み。
うねり。
伸びる。

その姿は、さながら――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH29",0,1000,true);

	CreateSE("SE10","SE_擬音_蛇うごめく_LOOP");
	MusicStart("SE10", 0, 1000, 0, 1000, null, true);

	CreateMovie360("ムービー", 500, Center, middle, true, false, "dx/mvそーど04_a.avi");
	Fade("ムービー", 0, 0, null, false);
//	Request("ムービー", Play);

	Fade("ムービー", 500, 1000, null, true);
	SetVolume("SE10", 1000, 500, NULL);

	Delete("back04");


	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
黒の大蛇。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "White");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 1000, null, true);

	Delete("ムービー");

	CreateColor("BK", 700, 0, 0, 1280, 720, "Black");
	Fade("BK", 0, 0, null, false);
	CreateTexture360("背景１", 500, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	Stand("buあやせ_パジャマ_通常","hard", 600, @-220);
	FadeStand("buあやせ_パジャマ_通常_hard", 0, true);
	Fade("BK", 0, 300, null, false);
	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/21300080ay">
「そして、現れるのよ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("色１", 100, 1000, null, true);
	Delete("BK");
	Delete("背景１");
	DeleteStand("buあやせ_パジャマ_通常_hard", 0, true);


	CreateMovie360("ムービー２", 550, Center, middle, true, false, "dx/mvそーど04_b.avi");
	CreateMovie360("ムービー３", 500, Center, middle, true, false, "dx/mvそーど04_c.avi");
	Fade("ムービー３", 0, 0, null, true);

//	Request("ムービー２", Play);

	Fade("色１", 300, 0, null, true);

	Wait(800);

	Fade("ムービー３", 0, 1000, null, true);
	Fade("ムービー２", 500, 0, null, true);
	Delete("ムービー２");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603006]
ドーム内を窮屈そうにさまよい。

屋根を、床を、
舐めるように。
削り取っていくように。

食らっていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("色１", 200, 1000, null, true);
	Delete("ムービー");
	Delete("ムービー２");
	Delete("ムービー３");

	CreateColor("BK", 700, 0, 0, 1280, 720, "Black");
	Fade("BK", 0, 0, null, false);
	CreateTexture360("背景１", 500, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	Stand("buあやせ_パジャマ_通常","hard", 600, @-220);
	FadeStand("buあやせ_パジャマ_通常_hard", 0, true);
	Fade("BK", 0, 300, null, false);
	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604006]
//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/21300090ay">
「邪心の黒き大蛇。あらゆる崩壊を呑み込み、邪心王の身を砕くことのできる、同質にして異質なるものが」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("色１", 100, 1000, null, true);
	Delete("BK");
	Delete("背景１");
	DeleteStand("buあやせ_パジャマ_通常_hard", 0, true);
	CreateTexture360("blackfire", 410, 0, 0, "cg/bg/bg216_01_6_chn赤い空_a.jpg");
	Fade("blackfire", 0, 0, null, true);
	Request("blackfire", AddRender);
	SetAlias("blackfire", "blackfire");

	CreateTexture360("back05", 400, 0, 0, "cg/ev/ev101_01_1_拓巳大蛇_a.jpg");
	CreateProcess("プロセス１", 1000, 0, 0, "LastFire");
	Request("プロセス１", Start);

	Move("back05", 1000, 0, -768, Dxl1, false);
	Fade("色１", 500, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605006]
大蛇の身体は、反粒子により形成されたもの。

いかなるものをも、触れるだけで自己崩壊させる。

あまりにもどん欲な、破壊の噴流。

//◆「触手ゲー」＝触手が出てくるゲーム
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300100ta">
{#TIPS_触手ゲー = true;$TIPS_on_触手ゲー = true;}「<FONT incolor="#88abda" outcolor="BLACK">触手ゲー</FONT>は、あんまり好みじゃないけど」

{$TIPS_on_触手ゲー = false;}
拓巳はその場でディソードを振り。
切っ先を、野呂瀬へと固定した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("色１");
	CreateSE("SE11","SE_擬音_蛇くらいつく");

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);

	MusicStart("SE11", 0, 1000, 0, 1000, null, false);

//	Shake("back05", 800, 0, 10, 0, 0, 500, null, false);

	CreateMovie360("大蛇", 550, Center, middle, false, false, "dx/mv大蛇突進.avi");
	WaitPlay("大蛇", null);

	Fade("Black", 500, 1000, null, true);


//	DrawTransition("Black", 200, 0, 1000, 100, null, "cg/data/circle.png", true);
//	DrawTransition("Black", 200, 1000, 0, 100, null, "cg/data/circle.png", true);
//	DrawTransition("Black", 200, 0, 1000, 100, null, "cg/data/zoom1.png", true);

	Delete("大蛇");
	Delete("back05");
	Delete("プロセス１");
	Delete("blackfire");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3606006]
とぐろを巻いていた黒い蛇は、その身を鞭のようにしならせ。
あぎとが、野呂瀬に食らいついた。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21300110nr">
「まさか、これほどとは……！」

野呂瀬はディソードのそんな現象を、いまだかつて見たことがなかった。

これがギガロマニアックスに秘められた力なのか、拓巳による妄想なのか、その判断は付かない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE36001","SE_擬音_胴体引きちぎり");
	MusicStart("SE36001",0,1000,0,1000,null,false);


	CreateTexture360("back05", 400, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	CreateTexture360("blackfire", 410, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
//	Request("blackfire", AddRender);
	Fade("blackfire", 0, 0, null, true);
	SetAlias("blackfire", "blackfire");
	CreateProcess("プロセス１", 1000, 0, 0, "LastFire");
	Request("プロセス１", Start);

	Fade("Black", 500, 0, null, true);

	Shake("back05", 800, 0, 2, 0, 0, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
黒い牙に、野呂瀬の身体は侵食される。
崩壊していく。

あまりにも緩慢に。
蛇の腹の中でゆっくりと溶かされるカエルのように。

{	Fade("Black", 2000, 1000, Axl1, false);}
闇に、呑まれていく。

痛みは感じない。
本来なら一瞬で死に至るはずだった。

しかしそれを拓巳が望んでいない。
野呂瀬はそれに気付き、自嘲気味に唇を歪めた。

野呂瀬は死は恐れていない。
彼の目指した理想は、ノアⅡの完成により達成されたと言っていいのだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	WaitAction("Black", null);

	Delete("プロセス１");
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg200_02_6_ノアIIのあるドーム内_a.jpg");
	CreateTexture360("blackfire", 410, 0, 0, "cg/bg/bg207_01_6_おどろおどろしいイメージ_a.jpg");
	Request("blackfire", MulRender);
	Fade("blackfire", 0, 0, null, true);
	SetAlias("blackfire", "blackfire");


	CreateProcess("プロセス１", 1000, 0, 0, "LastFire2");
	Request("プロセス１", Start);
	Stand("bu玄一_スーツ_武器構え","hard", 200, @-350);
	FadeStand("bu玄一_スーツ_武器構え_hard", 0, true);

	FadeDelete("Black", 1000, true);


	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21300120nr">
「私を殺しても、ノアⅡには誰も近づけない」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21300130nr">
{#TIPS_永久機関 = true;$TIPS_on_永久機関 = true;}「<FONT incolor="#88abda" outcolor="BLACK">永久機関</FONT>なんですよ、それは」

{$TIPS_on_永久機関 = false;}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21300140nr">
「人類を、未来永劫に渡って管理し続ける」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21300150nr">
「ただ座して眺めているだけではない、人の幸福のために干渉してくる、人工の神なのです」

言わば、野呂瀬は神の創造主。
ノアⅡが存在し続ける限り、人は滅びず。
野呂瀬が願った永遠なる理想郷は現実となる。

だが――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300160ta">
「あんたなら――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300170ta">
「近づけるんでしょ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE36001","SE_擬音_ディそーど2");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21300180nr">
「な……に……？」

野呂瀬を捕らえた蛇が、その身を蠢かせる。
彼の身体を持ち上げ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300190ta">
「それなら、あんたは、鍵だ」

野呂瀬は呆然とする。
けれどそれはすぐに、苦悶の表情へと変わった。
{	MusicStart("SE36001",0,1000,0,1000,null,false);
	Zoom("back05", 500, 2000, 2000, Dxl1, false);
	Zoom("blackfire", 500, 2000, 2000, Axl1, false);
	Move("bu玄一_スーツ_武器構え_hard", 500, @-1000, @-100, Dxl2, false);
	DeleteStand("bu玄一_スーツ_武器構え_hard", 300, true);}
蛇が、その身体を軽々と振り回す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("back10", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("back10", 300, 0, 1000, 100, null, "cg/data/right2.png", true);

	Delete("blackfire");
	Delete("プロセス１");
	Zoom("back05", 0, 1000, 1000, null, true);

	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 0, true);
	DrawTransition("back10", 300, 1000, 0, 100, null, "cg/data/left2.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
拓巳は、チラリと梨深を見た。
目が合う。

梨深は、どんな想いで見ているんだろう。
心を読むことはたやすい。
けれど拓巳はそれをしなかった。

――どうやら、君を助けることができたみたいだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DrawTransition("back10", 300, 0, 1000, 100, null, "cg/data/right2.png", true);
	DeleteStand("bu梨深_制服_正面_sad", 0, true);
	CreateTexture360("back06", 500, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Delete("back05");
	DrawTransition("back10", 300, 1000, 0, 100, null, "cg/data/left2.png", true);
	Delete("back10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
すぐに目をそらす。

その視線を、今もうなり続けるノアⅡへ向けた。
誰をも寄せ付けない、神の座。
幸せな夢を見せる、ゆりかご。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300200ta">
「ごめん」

誰にともなく謝った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300210ta">
「僕は、人類にとっての敵かもね」

この装置が生み出す、永遠の理想郷を。

争いのない未来を。

拓巳は、この手で摘み取ろうとしている。

それが正しいのか間違いなのか、その答えは拓巳には出せない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTexture360("back05", 100, 0, 0, "cg/ev/ev101_01_1_拓巳大蛇_a.jpg");
	Request("back05", Smoothing);
	Move("back05", 0, 0, -768, null, true);

	CreateTexture360("blackfire", 410, 0, 0, "cg/ev/ev101_01_1_拓巳大蛇_a.jpg");
	Move("blackfire", 0, 0, -768, null, true);
	Fade("blackfire", 0, 0, null, true);
	Request("blackfire", AddRender);
	Request("blackfire", Smoothing);
	SetAlias("blackfire", "blackfire");

	CreateProcess("プロセス１", 1000, 0, 0, "LastFire3");
	Request("プロセス１", Start);

	FadeDelete("back06", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300220ta">
「でも、神話でもよくあるでしょ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300230ta">
「神だって、女絡みでウダウダやってる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300240ta">
「だから僕も――」

{	SetVolume("SE10", 500, 0, NULL);}
好きな女の子のために、人類の幸福を犠牲にする――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("白光", 1000, 0, 0, 1280, 720, "White");
	Fade("白光", 0, 0, null, true);

	Zoom("blackfire", 300, 2000, 2000, Dxl2, false);
	Zoom("back05", 300, 2000, 2000, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
拓巳は、
ディソードを持つ腕を、
大きく弓なりに反らし。

{	Fade("白光", 300, 1000, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21300250ta">
「突き破れぇぇ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE11","SE_擬音_蛇とっしん_らすとあたっく");
	MusicStart("SE11", 0, 1000, 0, 1000, null, false);
	CreateTexture360("blur", 600, 0, 64, "cg/ev/ev111_01_6_野呂瀬ラスト_a.jpg");
	CreateTexture360("last", 500, 0, 64, "cg/ev/ev111_01_6_野呂瀬ラスト_a.jpg");
	Request("blur", Smoothing);
	Request("last", Smoothing);
	Zoom("last", 0, 1500, 1500, null, true);
	Zoom("blur", 0, 2000, 2000, null, true);
//	SetBlur("blur", true, 3, 500, 50);
	Fade("blur", 0, 500, null, true);
	Fade("last", 0, 1000, null, true);

	FadeDelete("白光", 1000, false);

	Zoom("blur", 2000, 1000, 1000, Axl1, false);
	Zoom("last", 2000, 1000, 1000, Axl1, true);
	Delete("プロセス１");
	Delete("blur");
	Delete("back05");
	Delete("blackfire");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
突く。
槍のごとく。
暗黒の大蛇は一直線に猛進する。

先端に野呂瀬という餌を刺したまま。
ノアⅡへ。

いかなるものをも消滅させる、反粒子の巨大なる槍は。

意志など持たない。故に、歪まされることもなく。

どん欲なる破壊の衝動が、
野呂瀬という鍵を使って、
妄想の結界を、

あっさりと打ち破った――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 0, 0, NULL);

	CreateSE("SE100","SE_えい像_野呂瀬ラスと");
	CreateSE("SE101","SE_えい像_のあII爆発");

	CreateMovie360("ムービー", 2000, Center, Middle, false, false, "dx/mv爆発01.avi");
	Fade("ムービー", 0, 0, null, true);
//	Request("ムービー", Play);


	MusicStart("SE100", 0, 1000, 0, 1000, null, false);
	Fade("ムービー", 500, 1000, null, true);
	Delete("last");

	CreateColor("back10", 1800, 0, 0, 1280, 720, "White");
	WaitAction("ムービー", null);

	Delete("ムービー");


	CreateMovie360("ムービー１", 2000, Center, Middle, false, false, "dx/mv爆発02.avi");
//	Request("ムービー１", Play);
	Wait(300);
	MusicStart("SE101", 0, 1000, 0, 1000, null, false);
	WaitAction("ムービー１", null);

	ClearAll(3000);

//ＳＥ//爆発音
//ホワイトアウト
//■インターミッション５５ａ終了
//アイキャッチ




}

function LastFire()
{
	while(1)
	{

	Wait(1200);

	Shake("@blackfire", 800, 0, 2, 0, 0, 1000, null, false);
	Fade("@blackfire", 100, 600, null, true);
	Fade("@blackfire", 1000, 0, null, true);
	Wait(800);
	Shake("@blackfire", 800, 0, 2, 0, 0, 1000, null, false);
	Fade("@blackfire", 50, 700, null, true);
	Fade("@blackfire", 1000, 0, null, true);
	Shake("@blackfire", 800, 0, 2, 0, 0, 1000, null, false);
	Fade("@blackfire", 80, 500, null, true);
	Fade("@blackfire", 1500, 0, null, true);

	Wait(800);

	Shake("@blackfire", 1800, 0, 2, 0, 0, 1000, null, false);
	Fade("@blackfire", 50, 600, null, true);
	Fade("@blackfire", 200, 400, null, true);
	Fade("@blackfire", 50, 600, null, true);
	Fade("@blackfire", 1000, 0, null, true);

	}

}

function LastFire2()
{
	while(1)
	{

	Wait(1200);

	Fade("@blackfire", 500, 600, null, true);
	Fade("@blackfire", 1000, 100, null, true);
	Wait(800);
	Fade("@blackfire", 500, 700, null, true);
	Fade("@blackfire", 1000, 200, null, true);
	Fade("@blackfire", 80, 500, null, true);
	Fade("@blackfire", 1500, 100, null, true);

	Wait(800);

	Fade("@blackfire", 500, 600, null, true);
	Fade("@blackfire", 200, 400, null, true);
	Fade("@blackfire", 50, 600, null, true);
	Fade("@blackfire", 1000, 300, null, true);

	}

}

function LastFire3()
{
	while(1)
	{

	Wait(400);

	Shake("@blackfire", 800, 0, 8, 0, 0, 1000, null, false);
	Fade("@blackfire", 100, 600, null, true);
	Fade("@blackfire", 1000, 0, null, true);
	Wait(300);
	Shake("@blackfire", 800, 0, 4, 0, 0, 1000, null, false);
	Fade("@blackfire", 50, 700, null, true);
	Fade("@blackfire", 100, 0, null, true);
	Shake("@blackfire", 800, 0, 4, 0, 0, 1000, null, false);
	Fade("@blackfire", 80, 500, null, true);
	Fade("@blackfire", 500, 0, null, true);

	Wait(200);

	Shake("@blackfire", 1800, 0, 10, 0, 0, 1000, null, false);
	Fade("@blackfire", 50, 600, null, true);
	Fade("@blackfire", 200, 400, null, true);
	Fade("@blackfire", 50, 600, null, true);
	Fade("@blackfire", 300, 0, null, true);

	}

}