//<continuation number="230">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_117_インターミッション２３";
		$GameContiune = 1;
		Reset();
	}

		ch06_117_インターミッション２３();
}


function ch06_117_インターミッション２３()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();



//アイキャッチ
//■インターミッション２３




	IntermissionIn();

	Delete("*");
	ClearAll(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg136_01_1_希ＶＩＰルーム_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	CreateSE("SE01","SE_はいけい_びっぷルーム_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

	IntermissionIn2();

	BGMPlay360("CH20",1000,1000,true);

	Wait(2000);

//ＢＧ//希テクノロジー・ＶＩＰルーム

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/11700010ih">
「予定と結果に大きな違いがあったようだが？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/11700020nr">
「我々は進化への第一歩を踏み出したんですよ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/11700030ih">
「三桁もの死人が出るなど、我々は聞いておらんぞ！」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/11700040kr">
「計画に不備があったのかね？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/11700050nr">
「……いいえ」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/11700060nr">
「おふたりには、ぜひ人の進化の歴史というものを、振り返ってみていただきたいものですね」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/11700070kr">
「進化には多少の犠牲はつきものという点については、異論はないよ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/11700080ih">
「死人のことなどどうでもいい」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/11700090ih">
「重要なのは、予定と違うということだ！」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/11700100nr">
「想定の範囲内ですよ。私の中ではね」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/11700110ih">
「ならばなぜ事前に我々へ連絡せんのだ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/11700120ih">
「情報をコントロールするには、それなりの下準備が必要なのだぞ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/11700130ih">
「貴様の酔狂のために、人や金を犠牲にしてきたわけではない。それを忘れるな」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/11700140nr">
「ご安心を。先ほど申しました通り、すべては想定の範囲内」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/11700150nr">
「いずれ近いうちに、選挙での票集めに苦労することも、強引な勧誘活動を告発される恐れもなくなるでしょう」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/11700160nr">
「我々が日本を……いや、世界を変える日もじきに……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/11700170ih">
{#TIPS_３００人委員会 = true;$TIPS_on_３００人委員会 = true;}「口を慎め。<FONT incolor="#88abda" outcolor="BLACK">３００人委員会</FONT>への造反が知れれば、我らに待っているのは破滅だけだ」

{$TIPS_on_３００人委員会 = false;}
//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/11700180kr">
「キミの役目は、計画通りに事を進めることであって、それ以上でも以下でもないよ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/11700190ih">
「調整は我々がやる」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/11700200nr">
「承知しています。クク……」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/11700210kr">
「それで。第２世代についての報告を聞こうか」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/11700220nr">
「おふたりにも満足していただける仕上がりですよ」

//◆ノアⅡ＝ノア・ツー
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/11700230nr">
「『ノアⅡ』はね……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
//～～Ｆ・Ｏ

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);

	ClearAll(2000);
	Wait(2000);

//■インターミッション２３終了
//アイキャッチ

}