//<continuation number="60">




chapter main
{

	$PreGameName = "boot_第四章";

	if($GameStart != 1)
	{
		$GameName = "ch04_074_梨深の妄想世界";
		$GameContiune = 1;
		Reset();
	}

		ch04_074_梨深の妄想世界();
}


function ch04_074_梨深の妄想世界()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//※拓巳視点に戻る

	CreateSE("SE01","SE_自然_なみ音_LOOP");
	MusicStart("SE01", 1000, 500, 0, 1000, null, true);

//ＢＧ//海と青い空
	CreateTextureEX("back03", 100, 0, 48, "cg/bg/bg113_01_6_海と青い空_a.jpg");
	Fade("back03", 2000, 1000, null, true);

	Wait(1000);
//ＳＥ//波の音

//※この海は梨深の妄想世界です。その妄想にシンクロし、拓巳（将軍）が中に入り込んだときの記憶

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆梨深はテンション低め
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07400010ri">
「あの空は――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07400020ri">
「どうして、あんなに泣きたくなるくらい青いのかな？」

――それを望んだから。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07400030ri">
「あたしは、望んでない……」

――僕が、望んだんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：演出：ムービーのサイズ（上下比率）が変わり、余剰スペースがなくなりましたのでムーブInをなくします。

	CreateTextureEX("back10", 100, 0, 0, "cg/ev/ev034_01_6_梨深と将軍の出会い_a.jpg");

	CreateMovie360("movie01", 200, Center, Middle, true, false, "dx/mv海.avi");
	Fade("movie01", 0, 0, null, true);
//	Request("movie01", Play);
//	Move("movie01", 3000, @+0, Middle, null, false);
	Fade("movie01", 2000, 1000, null, true);
	Fade("back10", 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
――ここは、君の心象世界であると同時に、僕の心象世界でもあるから。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07400040ri">
「……ねえ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07400050ri">
「あの空は、どこにあるの？」

――君が、望めば、どこにでも。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07400060ri">
「望んで、いいの……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

	CreateColor("back10", 300, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);
	Fade("back10", 0, 0, null, false);
	Fade("back10", 2000, 1000, Axl1, true);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	DelusionOut();

	Delete("*");

	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");

	DelusionOut2();

	ClearAll(500);

}