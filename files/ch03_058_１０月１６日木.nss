//<continuation number="50">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_058_１０月１６日木";
		$GameContiune = 1;
		Reset();
	}

		ch03_058_１０月１６日木();
}


function ch03_058_１０月１６日木()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//アイキャッチ
//※拓巳視点に戻る
//ＢＧ//総合病院ロビー//昼
//１０月１６日（木）//日付は表示しない

	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",500,0,false);

	ClearAll(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg098_02_0_AHロビー_a.jpg");
	Fade("背景１", 2000, 1000, null, true);


	CreateSE("SE03","SE_はいけい_びょういん_LOOP");
	MusicStart("SE03", 2000, 800, 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
翌日の朝一番で、僕は病院へ向かった。

前に来たときは結局確認できなかったけど、今日こそ僕は正常だって認めてもらうんだ。

先生には僕のことを思い出してもらう。
“４年前まであなたの患者だった西條です”って打ち明けてやるんだ。
そして、いろいろ話を聞いてもらおう。

おかしいのは僕じゃない。
悪魔女や三住くんの方なんだ。先生もそう言ってくれるはず。

ここの開院時間は朝８時と、普通の病院より少し早い。
だからその開院時間ぴったりに来たんだけど……

すでにロビーのソファには多くの老人たちが座っていた。

なんでだよ！

開院時間直後なのになんでもうこんなに人がいるんだよ！
フライングするなんてズルいぞ！　ちゃんと時間通りに来いよ！

心の中で悪態をつきつつも、やむなく待つことにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE03", 2000, 200, 0, 1000, null, true);

//ＢＧ//黒
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
予約を入れるべきだった、と後悔したのは待ち始めて１時間が経った頃だった。

でもその直後に僕の名前を呼ばれ、先週ほど待たされなくて助かったとホッとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	SoundPlay("SE02", 0, 1000, false);

	Wait(1500);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Delete("色１");

	MusicStart("SE03", 1000, 300, 0, 1000, null, true);

	CreateSE("SE02","SE_日常_びょういんどあ_閉まる");
	SoundPlay("SE02", 0, 1000, false);

//ＢＧ//診察室
//※今回はヒュンヒュンという機械音はしません

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
ところが、通された診察室で僕を待っていたのは高科先生じゃなくて、見ず知らずの白髪のじいさんだった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05800010ta">
「あの……た、た……高科、先生は……？」

僕が戸惑っていると、ちょうど後ろに控えていた
看護師さん――名前は確か……葉月さんだ――が申し訳なさそうな顔をしながら答えてくれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st志乃_白衣_通常","worry", 200, @150);
	FadeStand("st志乃_白衣_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch03/05800020hd">
「高科先生は、もういません……」

もう、いない……？

//◆精神科医＝５０代ぐらいの男性
//【精神科医】
<voice name="精神科医" class="精神科医" src="voice/ch03/05800030ph">
「もういないと言うか、過労がたたって先週末に倒れてしまわれてね。
今週はそれでずっと休みだよ」

なんてことだ……僕の唯一の味方が……。

……いや、ホントに先生が倒れたのは過労か？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05800040ta">
「い、陰謀だ……悪魔女の……陰謀だ……」

{	Stand("st志乃_白衣_通常","shock", 200, @150);
	FadeStand("st志乃_白衣_通常_shock", 200, false);
	DeleteStand("st志乃_白衣_通常_worry", 300, true);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch03/05800050hd">
「に、西條さん……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
きっと食事に毒を盛られるとか、脅迫の手紙を送るとかして、先生を精神的に追い詰めたんだ。あの悪魔女の仕業なんだ。僕を孤立無援にしようとしているんだ。

{	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	CreateSE("SE04","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE02", 0, 1000, false);
	SoundPlay("SE04", 500, 1000, true);}
僕は自分のことについて高科先生以外の人間に診てもらうつもりはなかった。だから診察は受けず、逃げるように病院を後にした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 3000, 0, false);
	ClearAll(2000);
	Wait(2500);

//～～Ｆ・Ｏ

}