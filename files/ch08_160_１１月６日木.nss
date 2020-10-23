//<continuation number="130">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_160_１１月６日木";
		$GameContiune = 1;
		Reset();
	}

		ch08_160_１１月６日木();
}


function ch08_160_１１月６日木()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//アイキャッチ
//※拓巳視点に戻る
//１１月６日（木）//日付は表示しない
//ＢＧ//ＡＨ総合病院・ロビー

	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);


	CreateTextureEX("病院入る前", 100, 0, 0, "cg/bg/bg097_02_2_ＡＨ病院外観_a.jpg");
	CreateSE("病院前","SE_日常_雑踏_遠い");
	MusicStart("病院前", 2000, 800, 0, 1000, null, true);
	Fade("病院入る前", 2000, 1000, null, true);

	Wait(2000);

	MusicStart("病院前", 3000, 0, 0, 1000, null, false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg098_02_2_AHロビー_a.jpg");
	Fade("背景１", 2000, 1000, null, true);
	Delete("病院入る前");

	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	MusicStart("SE01", 3000, 400, 0, 1000, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
木曜日に学校へ顔を出した僕は、いきなり三住くんから、あやせの見舞いに行こうという誘いを受けた。

その発想はまったくなかっただけに、意表を突かれた。

で、僕が返事をする前になぜか梨深までが“一緒に行きたい”と言い出したため、流されるままにこうして病院を訪れる羽目になった。

言っておくけど僕は決して冷たい人間じゃない。

ただ、『将軍』の脅威が迫っている中で他人の気遣いなんてしてる場合じゃないって思っただけだ。

僕は……死にたくない。

三住くんは正面の入り口から中に入り、ロビーに来たところで途方に暮れたように周囲を見回した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","normal", 200, @-320);
	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16000010ri">
「どうしたの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","worry", 250, @320);
	FadeStand("bu大輔_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16000020mi">
「いや、岸本の病室ってどこなんだろうなって思ってよ」

もしかして知らずにここまで来たんだろうか。
だとしたら呆れてものも言えない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16000030ta">
「ここは、外来棟だよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16000040ta">
「病棟は、隣……」

{	Stand("bu大輔_制服_通常","shock", 250, @320);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16000050mi">
「げっ、そうなのか？」

{	Stand("bu梨深_制服_通常","hard", 200, @-320);
	FadeStand("bu梨深_制服_通常_hard", 500, false);
	DeleteStand("bu梨深_制服_正面_normal", 500, true);}
//◆非難するように
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16000060ri">
「大ち～ん、しっかりしてよー」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景２", 300, 0, 0, "cg/bg/bg099_02_2_AH廊下_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Delete("背景１");

	DeleteStand("bu梨深_制服_通常_hard", 0, true);
	DeleteStand("bu大輔_制服_通常_shock", 0, true);

	MusicStart("SE01", 3000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
ＡＨ東京総合病院。

ここは、僕が昔から通っていた病院だ。それにこの前来たばかりでもある。だからどこになにがあるかっていうのは、それなりに詳しい。

つい、高科先生のことを思い出してしまい、僕は人知れずうめいた。

三住くんは病棟へと歩き出しながら、僕の方を振り返る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg099_02_2_AH廊下_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Delete("背景２");
	Stand("st大輔_制服_通常","normal", 250, @320);
	FadeStand("st大輔_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16000070mi">
「で、病棟の何号室だと思う？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16000080ta">
「そ、そんなの……分かんないよ……」

ここは総合病院だから、それこそたくさんの診療科がある。
考えられるとしたら――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16000090ta">
「た、たぶん、外科じゃないかな……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16000100ta">
「で、でも、もしかすると、精神科、かも……」

あやせは落ちたとき、外傷はそれほどあったように見えなかった。それに飛び降り自殺を図るなんて、それだけ精神的に追い詰められていたっていうことだろうから、精神科っていうのもじゅうぶんあり得る。

僕だって、あのＯ－ＦＲＯＮＴでの騒動のとき、なぜか精神科の病室に運び込まれていたし。

{	Stand("st大輔_制服_通常","shock", 250, @320);
	FadeStand("st大輔_制服_通常_shock", 300, true);
	DeleteStand("st大輔_制服_通常_normal", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16000110mi">
「タクって物知りだな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_正面","normal", 200, @-320);
	FadeStand("st梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16000120ri">
「常識でしょ常識。ね、タク」

常識ってわけでもないと思う……。
僕だって、この病院に何度も通った経験がなければ、分からなかったかもしれないし。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景２", 300, 0, 0, "cg/bg/bg106_01_2_ナースステーション_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	DeleteStand("st大輔_制服_通常_shock", 0, false);
	DeleteStand("st梨深_制服_正面_normal", 0, true);
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
病棟に入ろうとしたところで、梨深が立ち止まった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg106_01_2_ナースステーション_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Delete("背景２");
	Stand("st梨深_制服_通常ビシッ！","happy", 200, @-100);
	FadeStand("st梨深_制服_通常ビシッ！_happy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16000130ri">
「あたし、お手洗い行ってくる。先に行ってて」

{	CreateSE("SE02","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE02", 0, 1000, false);
	DeleteStand("st梨深_制服_通常ビシッ！_happy", 500, true);
	SoundPlay("SE02", 3000, 0, false);}
そう言うと、手を振ってさっさと外来棟の方に戻っていってしまった。

僕と三住くんは、病棟内をあちこち歩き回るのも患者に迷惑だと思い、結局ナースステーションで聞くことにした。そうしたら案の定、精神科患者用の階にある病室を教えられた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 1000, 0, false);

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Wait(2000);

//ＢＧ//ＡＨ総合病院・病室//夕方

	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	SoundPlay("SE02", 0, 1000, false);
	Wait(1500);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Delete("背景２");
	Delete("色*", 0, true);

	CreateSE("SE02","SE_日常_びょういんどあ_閉まる");
	SoundPlay("SE02", 0, 1000, false);

	Wait(1500);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
その病室は六畳ほどの広さの個室だった。

入ると右側に備え付けのトイレ、奥にベッドがある。
その向こうにある窓から、夕陽が射し込んでいた。

ベッドの上に、肝心のあやせの姿はない。
シーツが少し乱れているところを見ると、
ついさっきまではいたみたいだけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("３６");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	SoundPlay("SE01", 2000, 500, true);

}