//<continuation number="80">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_176_インターミッション４１";
		$GameContiune = 1;
		Reset();
	}

		ch08_176_インターミッション４１();
}


function ch08_176_インターミッション４１()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg057_01_2_下北沢拓巳の家_a.jpg");
	Stand("st梨深_制服_正面","sad", 250, @150);
	FadeStand("st梨深_制服_正面_sad", 0, true);

	IntermissionIn();

	DeleteStand("st梨深_制服_正面_sad", 0, true);
	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg099_03_2_AH廊下_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	IntermissionIn2();

	Wait(1000);
	CreateSE("SE01","SE_日常_車椅す");
	MusicStart("SE01", 4000, 1000, 0, 1000, null, true);

//アイキャッチ
//■インターミッション４１
//ＢＧ//ＡＨ総合病院・廊下//夕方
//ＳＥ//車椅子の軋む音

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
斜陽が射し込む病院の廊下。夜に変わる直前であるこの時間帯は、照明がまだ点灯していないこともあり、かなり薄暗い。

先ほどまでの夕食時の喧噪は収まり、不気味なほどの静けさが舞い降りている。

『将軍』は、その廊下を車椅子でゆっくりと進んでいた。車輪が軋む音が、廊下に響き渡る。

何度かすれ違った看護師の誰も、彼に声をかけようとせず、目も合わせようとしなかった。

そして『将軍』もまた、それが当然とばかりの態度で、
骨と皮しかないやせ細った手で車椅子の車輪を回し続ける。

//【山井】
<voice name="山井" class="山井" src="voice/ch08/17600001yi">
「あ、あみぃちゃん！」

ある病室の前を通りかかったところで、山井という名の男性患者が声を上げた。
『将軍』を指差し、必死の様子で叫び出す。

//【山井】
<voice name="山井" class="山井" src="voice/ch08/17600020yi">
「あみぃちゃんだ！」

ちょうど山井と一緒にいた看護師はと言えば、完全に困惑顔だ。

//【山井】
<voice name="山井" class="山井" src="voice/ch08/17600030yi">
「ほら、あみぃちゃんが帰ってきたよ。またお外に出かけてたんだ。いけないんだ！」

//【看護師Ａ】
<voice name="看護師Ａ" class="看護師Ａ" src="voice/ch08/17600040n1">
「誰もいませんよ？」

看護師は周囲を見回して、苦笑した。

『将軍』が目の前の廊下を車椅子で進んでいるにもかかわらず、“誰もいない”と、その看護師は言ったのだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆優しく
//【看護師Ａ】
<voice name="看護師Ａ" class="看護師Ａ" src="voice/ch08/17600050n1">
「また山井さんは、私のことからかってるんでしょう？　でも今日は騙されませんからね」

//◆舌足らずで子供っぽい喋り方。だんだん「たくみちゃん」と聞こえるようにする
//【山井】
<voice name="山井" class="山井" src="voice/ch08/17600060yi">
「あみぃちゃん！」

//【山井】
<voice name="山井" class="山井" src="voice/ch08/17600070yi">
「らぅみぃちゃん！」

//【山井】
<voice name="山井" class="山井" src="voice/ch08/17600080yi">
「たぅみちゃん！」

{	SoundPlay("SE01", 2000, 500, true);}
山井がムキになったように、叫び続ける。

それを無視し、『将軍』は無言のまま廊下を右へと曲がる。
{	Wait(1000);
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg109_01_2_黒い壁_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	Wait(1000);}
それまでクリーム色だった壁は、そこで唐突に黒い色へと変わっていた。

『将軍』はその壁を目の前にしても、車椅子を止めようとはせず。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg110_01_2_AH隠し廊下_a.jpg");
	Fade("背景１", 500, 1000, null, true);
	BGMPlay360("CH01", 2000, 1000, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
壁に激突しそうになった直前、その黒い壁が不意に消失した。

文字通り――消失。
壁は消え、その奥に隠されていた廊下が現れる。

そのまま『将軍』はまっすぐ進んでいった。
廊下は２０メートルほど行ったところで、今度こそ突き当たりになっていて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	SoundPlay("SE02", 0, 1000, false);
	Wait(2000);
	MusicStart("SE01", 2000, 0, 0, 1000, null, false);
	CreateSE("SE02","SE_日常_びょういんどあ_閉まる");
	SoundPlay("SE02", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
病室のドアがひとつあった。
『将軍』はドアを開け、中へと入っていく。

そこは、幻の病室。
数年前から怪談としてささやかれている、誰も知らない部屋。

入院している患者を示すネームプレートに書かれた名は――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//イメージＢＧ//病室のネームプレート『西條拓巳』

	BGMPlay360("CH01", 500, 0, false);
	SoundPlay("SE01", 500, 0, false);
	Wait(1000);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg189_01_1_ネームプレート_a.jpg");
	CreateSE("SE02","SE_衝撃_衝撃音01");

	SoundPlay("SE02", 0, 1000, false);
	Fade("背景１", 0, 1000, null, true);


	Wait(2500);
	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*",2000,0,false);
	ClearAll(3000);

//○実績No.9：第八章【Ir2】
	XBOX360_Achieved(9);

	Wait(1000);
//ＳＥ//病室のドアが閉まる音
//～～Ｆ・Ｏ

//■インターミッション４１終了

//第８章　ＥＮＤ

}