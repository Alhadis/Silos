//<continuation number="100">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_116_飛び降りるあやせ";
		$GameContiune = 1;
		Reset();
	}

		ch06_116_飛び降りるあやせ();
}


function ch06_116_飛び降りるあやせ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	Delete("*");
	ClearAll(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev064_01_1_あやせ飛び降りようと_a.jpg");
	Fade("背景１", 1000, 1000, null, true);


	Wait(500);

/*
//※拓巳視点に戻る
//ＣＧ//飛び降りるあやせ
//※セリフでなくＳＥ扱いで野次馬の悲鳴やどよめきがあるといいのですが……


//【ガヤ】
//<voice name="ガヤ" class="ガヤ" src="voice/ch06/11600010aa">
//「ああっ！」

//【ガヤ】
//<voice name="ガヤ" class="ガヤ" src="voice/ch06/11600020aa">
//「うおー！？」

//【ガヤ】
//<voice name="ガヤ" class="ガヤ" src="voice/ch06/11600030aa">
//「うわあ！」

//【ガヤ】
//<voice name="ガヤ" class="ガヤ" src="voice/ch06/11600040aa">
//「キャー！」

//【ガヤ】
//<voice name="ガヤ" class="ガヤ" src="voice/ch06/11600050aa">
//「いやー！」

//【ガヤ】
//<voice name="ガヤ" class="ガヤ" src="voice/ch06/11600060aa">
//「ダメー！」

//などなど
*/

//おがみ：バグ回避のためSE削減
	CreateSE("SE01","SE_はいけい_生と_悲鳴とどよめき_2");
	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
//	SoundPlay("SE02", 0, 1000, true);
//	CreateSE("SE03","SE_じん体_心臓_鼓動_LOOP");
//	SoundPlay("SE03", 0, 1000, true);

	MusicStart("SE02",0,1000,0,1000,null,true);
//	MusicStart("SE02",0,1000,0,1000,null,false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
僕には、為す術もなくそれを見ていることしかできなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
あやせは両手を広げたかと思うと――

そこに見えない階段でもあるかのように、ゆっくりと足を中空へと踏み出した。

{	SoundPlay("SE01", 1000, 500, true);
}
野次馬たちの間から、一斉にどよめきや悲鳴が溢れる。

あやせの身体は、糸の切れた人形のように支えを失い、
真っ逆さまに舞った。

{	SetVolume360("SE01", 5000, 0, null);
//	SoundPlay("SE01", 5000, 0, false);
}
すべてがスローモーションになっていた。

あやせの身体が墜落する。

その速度はひどく緩慢で。

でも確かに落ちてくる。

死ぬ――

あれは死ぬ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
僕には助けられない。
あの高さから落ちたら助からない。

ましてや下はコンクリートだ。

骨は砕け、内臓は潰れ、脳漿がぶちまかれ、どす黒い血が飛び散るんだ。

せめて花壇かなにかがそこにあったなら。

せめて、柔らかい土の上だったなら。

もしかしたら助かったかもしれないのに……

人が死ぬ瞬間なんて、見たくない！

僕は目を閉じようとした――

その刹那。感じた。

うなじのあたりに、チリチリとした感覚。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//ＢＧ//翠明学園校門前
	CreateTextureEX("背景２", 100, 0, -1296, "cg/ev/ev064_01_1_あやせ飛び降りようと_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	SetVolume360("SE02", 200, 0, null);

	DrawTransition("色１", 300, 1000, 0, 100, null, "cg/data/left2.png", true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
振り返る。僕を見ている人間なんて、誰もいない。

みんな、うつむいているか見上げているかのどちらかだった。

――その目だれの目？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_衝撃_落下激突");
	CreateSE("SE03","SE_衝撃_どすーん");

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);

	Move("背景１", 0, @0, @-400, null, true);
	Fade("背景２", 200, 0, null, false);

	Move("背景１", 1500, @0, @-1024, Axl3, false);

	Wait(1300);

	MusicStart("SE02",0,1000,0,1000,null,false);
	MusicStart("SE03",0,1000,0,1000,null,false);
	Zoom("背景１", 600, 2000, 2000, Dxl2, false);
	Fade("色１", 500, 1000, null, true);
//	DrawTransition("色１", 200, 0, 1000, 100, null, "cg/data/zoom2.png", false);
//ＳＥ//ドスーーーーン（土の上の落ちる音）

	Delete("背景１");

	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
音が、響いた。

人が墜落した音。

初めて聞いた。

その音は……意外にも衝撃が少なくて。

//◆呆然
//【三住】
<voice name="三住" class="三住" src="voice/ch06/11600070mi">
「まさか……」

隣で、三住くんが呆然と目を見開いていた。

その視線は確かにあやせが落ちた場所を向いているはずなのに、恐ろしさや哀しみよりも、むしろ驚きの色を強くたたえている。

三住くんだけじゃない。

野次馬の誰もが、なにが起こったのか理解できていないような表情で、
声を失っていた。

//【三住】
<voice name="三住" class="三住" src="voice/ch06/11600080mi">
「……生きて……る……」

…………え！？

生きてる？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 100, center, middle, "cg/ev/ev066_01_1_あやせ花壇落ち_a.jpg");
	Request("背景１", Smoothing);
	Fade("背景１", 0, 1000, null, true);
//	Move("背景１", 0, @-400, @-300, Dxl1, true);
	Zoom("背景１", 0, 500, 500, Dxl2, true);
	Fade("色１", 4000, 0, null, false);

//ＣＧ//花壇に倒れているあやせ

	Zoom("背景１", 30000, 1000, 1000, Dxl1, false);
	Move("背景１", 30000, @0, @0, Dxl1, false);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
あやせが、倒れている。

骨が砕けたのかどうか……分からない。
内臓が潰れたのかどうか……分からない。

脳漿は……ぶちまかれていない。
どす黒い血は……飛び散っていない。

//◆かすかにうめき声
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11600090ay">
「う……」

あやせの口から、か細いが確かにうめくような声が漏れた。

生きてる……。

意識は失ってるみたいで、ピクリとも動かない。でも外傷はほとんどない。額にわずかに血が垂れているぐらい。

屋上から落ちたはずなのに。

そこに、ほぼ無傷で倒れている。
花壇の上に、倒れている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/11600100ta">
「…………花壇……に？」

そこに、

花壇なんてあったっけ……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＦＦエフェクト
//ＳＥ//妄想ＯＦＦ

//※これは妄想ではなく現実。ただし妄想ＯＦＦエフェクトを入れることでプレイヤーに妄想か現実か迷わせる。

	SetVolume360("CH*", 100, 0, null);
	MusicStart("SE*", 100, 0, 0, 1000, null, false);

	DelusionOut();

	ClearAll(0);

	DelusionOut2();


}