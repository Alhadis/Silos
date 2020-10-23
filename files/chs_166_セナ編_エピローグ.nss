//<continuation number="190">

chapter main
{

	if($GameStart != 1)
	{

	$PreGameName = "boot_セナルート";
		$GameName = "chs_166_セナ編_エピローグ";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_166_セナ編_エピローグ();
}


function chs_166_セナ編_エピローグ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編
//◆セナ編エピローグ
//ＢＧ//黒
//◆百瀬は電話中。電話の相手に向かって喋っている。電話の相手は３００人委員会幹部
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");

//おがみ：演出：百瀬立ち絵出す？

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900010mm">
「エラーはすべて消滅。ノアⅡと野呂瀬玄一の消去も確認したわ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900020mm">
「オリジナルの西條拓巳は確保済み。虫の息だけどね」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900030mm">
「コピーの西條拓巳、および波多野セナは予定通り任務を実行後、ともに……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900040mm">
「死んだわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//◆少し間を置く

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900050mm">
「今後も引き続き調査は続行するけど、おそらく波多野セナも西條拓巳も、“エラー”は生み出さなかったんでしょ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900060mm">
「……それでいいんじゃない？　私の仕事も減ったことだし」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900070mm">
「そうそう、ついでに周りをウロチョロしてた、天成神光会の信者連中も、処分しといたから」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900080mm">
「咲畑梨深には逃げられたみたいだけど、ま、脅威にはならないでしょ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900090mm">
「世界人間牧場計画の予定には、若干の修正が必要ね」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900100mm">
「でも、今回の一連のエラーは、計画へと利用、還元できると判断するわ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900110mm">
「結果的には、３００人委員会になんらの不利益も生じない」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900120mm">
「……ええ、了解。デバッガの任務は終了します」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900130mm">
「以後、監視者の役割に戻るわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ケータイを切る「ピッ」
	CreateSE("SE01","SE_日常_けい帯ボタン押す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆ため息
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900140mm">
「ふう……」

//◆/ＳＥ/子供の泣き声
{	CreateSE("SE02","SE_日常_泣き声_赤ん坊");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900150mm">
「あら？　この子、生きてるわね……。エラーになっちゃうわ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900160mm">
「……２人が、命を与えたのかしら？」

//◆困った感じのブレス
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900170mm">
「…………」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900180mm">
「はあ、見なかったことにしますか。私は独身だし、子供はちょっと苦手なんだけど……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/chn02/09900190mm">
「ミルクは、手に入るかしらね、この渋谷で……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,1000);//――――――――――――――――――――――――――――――


//セナ編エンド
	SetVolume360("SE02", 5000, 0, null);

	ClearAll(3000);

//○実績No.20：【デウス・エクス・マキナ】
	XBOX360_Achieved(20);

	Wait(1000);
}
