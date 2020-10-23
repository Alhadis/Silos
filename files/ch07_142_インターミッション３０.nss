//<continuation number="300">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_142_インターミッション３０";
		$GameContiune = 1;
		Reset();
	}

		ch07_142_インターミッション３０();
}


function ch07_142_インターミッション３０()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//■インターミッション３０

//アイキャッチIN
	IntermissionIn();

	Delete("*");
	CreateColor("白", 200, 0, 0, 1280, 720, "White");
	
//アイキャッチOUT
	IntermissionIn2();

	CreateSE("SE10","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE10", 0, 1000, 0, 1000, null, true);

//ＣＧ//病室で会話する将軍と梨深
	CreateTextureEX("会話１", 100, 0, 0, "cg/ev/ev070_02_2_将軍と梨深in病院_a.jpg");
	Fade("会話１", 0, 1000, null, true);
	
	Fade("白", 2000, 0, null, true);
	
//窓から夕陽が射し込んでいる。その窓を背にして、逆光の中に車椅子の将軍がいる。梨深は部屋の入り口に立って将軍の方を見ている。（梨深は私服）
//将軍は入院しています。病院は拓巳が通っていたＡＨ東京総合病院

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
その病室の窓からは、淡い夕陽が射し込んでいた。

黄昏色の光によって、部屋の中は明と暗にはっきりと分断されてしまっている。

浮かび上がっているのは――

真っ白いシーツがかけられたベッド。
その枕元に置かれた携帯ゲーム機。

棚に並べられた何冊もの学術書。
花瓶に生けられたコスモスの薄桃色をした花びら。

//※可能ならベッドの上にスケッチブックを置いてください（テキストでは触れません）将軍の正体についての重大なヒントとなります。２章インターミッション０４参照。
その部屋は、整然としていた。
なにも動かない。
時が止まったような空間。

夕焼け空を切り取った窓。
その窓際に、車椅子に座った小さな人影がたたずんでいた。

窓に背を向け、じっとして動かない。
死んでいるのではないかと思うほど、その呼吸は穏やかで、間隔が長い。

その肌は皺だらけで。
頬はこけ。

目は落ちくぼみ。
頭髪はいっさいない。

少年と呼ぶべきなのか、老人と呼ぶべきなのか分からないその容姿。

『将軍』と自らを呼ぶ彼の影が、部屋のドアまで長く伸びていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE13","SE_日常_びょういんどあ_開く");
	MusicStart("SE13", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
そこで初めて、世界が動いた。
ドアがゆっくりと開き、暗い廊下から夕陽の当たる場所へと人影が入ってくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("会話２", 200, 0, 0, "cg/ev/ev070_01_2_将軍と梨深in病院_a.jpg");
	Fade("会話２", 1000, 1000, null, true);
	Delete("会話１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
咲畑梨深は、病室の中には入らず、入り口のところに立ち尽くした。

夕陽に照らされたのは、
思い詰めたような彼女の表情。

//◆悲しそうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200010ri">
「もう……やめよう？」

//◆悲しそうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200020ri">
「残念だけど……」

//◆悲しそうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200030ri">
「……あの彼は……西條拓巳は、消すべきだよ」

『将軍』は、彼女の言葉にも微動だにしない。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch07/14200040jn">
「どうして？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200050ri">
「危険だから」

答える梨深の声には、悲痛な感情が含まれている。
瞳も、心なしか潤んで見えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200060ri">
「あたしが……消そうか？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch07/14200070jn">
「ダメだよ」

果たして彼が口を動かして喋っているのかどうか、梨深にもそれを確認することはできなかった。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch07/14200080jn">
「彼には、やってもらわなくちゃいけないことがあるんだ」

//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200090ri">
「…………」

梨深はうなだれ、その際に前に垂れた髪を指でそっとかき上げた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200100ri">
「……例えば、あなたは、夢に見たことを覚えていられる？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch07/14200110jn">
「うん」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200120ri">
「そっかぁ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200130ri">
「あたし、すぐ忘れちゃうんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch07/14200140jn">
「できる人と、できない人がいる」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200150ri">
「できる人はきっと、ロマンティストなんだね」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch07/14200160jn">
「すごく、長い、長い、夢を、よく見るよ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch07/14200170jn">
「見ている間は、何年にも感じられる」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200180ri">
「あたしも、そうだった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200190ri">
「そうだった、気がする」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200200ri">
「でも、それは幻」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200210ri">
「実際の時間としては、寝ているうちのほんの２、３秒程度のものなんだって、夢って」

//◆泡沫＝うたかた
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200220ri">
「心の泡沫……なの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200230ri">
「だから……早く目覚めて」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200240ri">
「でないと、いつか――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200250ri">
「あなたは、西條拓巳に殺されちゃう」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch07/14200260jn">
「それでも、構わないよ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch07/14200270jn">
「夢から覚めるわけにはいかない」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch07/14200280jn">
「この夢は、完結させなくちゃ」

//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200290ri">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//以下のセリフのみ、梨深の口元アップに

	CreateColor("白", 1000, 0, 0, 1280, 720, "White");
	Fade("白", 0, 0, null, false);
	Fade("白", 500, 1000, null, true);

	CreateTexture360("背景１", 400, 0, 0, "cg/bg/bg108_01_2_将軍病室_a.jpg");
	SetShade("背景１", MEDIUM);

	Stand("hu梨深_制服_正面","sad", 500, @+50);
	Move("hu梨深_制服_正面_sad", 0, @0, @+312, null, true);
	FadeStand("hu梨深_制服_正面_sad", 0, true);

	Fade("白", 2000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/14200300ri">
「完結した夢の後には、なにが残るの……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 1000, 0, NULL);

//～～Ｆ・Ｏ
	ClearAll(2000);

	Wait(3000);
	
//■インターミッション３０終了


}