//<continuation number="150">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_062_インターミッション０９";
		$GameContiune = 1;
		Reset();
	}

		ch03_062_インターミッション０９();
}


function ch03_062_インターミッション０９()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	IntermissionIn();

	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",500,0,false);

	ClearAll(0);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg136_01_1_希ＶＩＰルーム_a.jpg");

	IntermissionIn2();

	BGMPlay360("CH27", 2000, 1000, true);
	CreateSE("SE01","SE_日常_ねっとかふぇ_空調_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	Wait(2000);


//アイキャッチ
//■インターミッション０９
//ＢＧ//希テクノロジー・ＶＩＰルーム（真っ暗な部屋に青白く光を放ついくつかのモニタ）
//※最初はどこか見知らぬ地の果てのような場所と感じさせるが、実は日本の大手企業ビルの一室
//※三者会談編はト書きはわざと書いていません。それによってミステリアスな感じを強調させます。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch03/06200010nr">
「ファーストメルトは、期待以上の結果に終わりました」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch03/06200020nr">
//◆ＧＥレート＝じーいーれーと
「ＧＥレートの上昇率は、当初の予測からわずかな誤差があった程度です」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch03/06200030ih">
{#TIPS_バイオリズム = true;$TIPS_on_バイオリズム = true;}「<FONT incolor="#88abda" outcolor="BLACK">バイオリズム</FONT>コントロールも順調なのかね？」

{$TIPS_on_バイオリズム = false;}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch03/06200040nr">
「渋谷のＧＥレートは、他のエリアと比べて高い値を持っていると同時に、安定性についても特出したものがあります」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch03/06200050kr">
「それゆえに意図的に操作しやすい、ということか。そして、渋谷にいる人々のバイオリズムを急激に引き上げることもまた……」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch03/06200060nr">
「実験結果についてはレポートをご参照ください。納得していただける成果を上げております」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch03/06200070ih">
「ふん、貴様が成果を出すのは当然だ。そのために高い金と多くの人材を提供しているのだからな」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch03/06200080kr">
「実効性については理解しているよ。この数ヶ月だけでも我が会の信者が数倍に膨れあがっているからね」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch03/06200090nr">
「それでは、『プロジェクト・ノア』は次の段階へと進ませます。よろしいですね？」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch03/06200100ih">
「ＣＯＤＥサンプルの件はどうするのだ。すでに３人分は確保したとはいえ、目標数値には達しておらんではないか」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch03/06200110kr">
「いかにも。数値達成のためには、最低でも５人分はなければ厳しい」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch03/06200120nr">
「サンプル保持者は集まりつつあります。あとは、採取するのみ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch03/06200130ih">
「ならばその件は任せる」

//※「神光の救いあれ」＝天成神光会の教義のようなもの。最終的に伏線として使います
//【倉持】
<voice name="倉持" class="倉持" src="voice/ch03/06200140kr">
「神光の救いあれ。くれぐれも慎重に事を進めるように」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch03/06200150nr">
「はい、心得ております……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※カメラ左右へパン。モニタを大きく映し出す。そこには『NOZOMI』の文字が。
//※プレイヤーにNOZOMIの存在と病院との関係を想像させる。ついでに病院もあの先生も実は危険かも？を強調
//おがみ：画像ダミーの為、後ほど演出

//■インターミッション０９終了

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);

	ClearAll(2000);
	Wait(3000);

}