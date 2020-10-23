//<continuation number="190">

chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_212_Ａ僕は";
		$GameContiune = 1;
		$Ａルート = true;
		Reset();
	}

		ch10_212_Ａ僕は();
}


function ch10_212_Ａ僕は()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	Wait(500);

	//アイキャッチ挿入
	IntermissionIn();
//		DeleteAll();
		ClearAll(0);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

		CreateColor("色１", 500, 0, 0, 1280, 720, "White");
		Request("色１", AddRender);
		CreateTexture360("back03", 100, 0, 0, "cg/ev/ev100_01_1_６人祈る_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);	

	IntermissionIn2();

	BGMPlay360("CH22",0,1000,true);

	Fade("色１", 2000, 0, null, true);
	Delete("色１");

	Wait(2000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text053]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000810ta">
西條七海が、祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000820ta">
兄とともに収容された病院。ケガ人が溢れた待合室の片隅にうずくまり。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000830ta">
実の兄の、しわくちゃの手を握りしめて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000840ta">
右手の痛みに耐えて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000850ta">
目を閉じて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000860ta">
祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000870ta">
もうひとりの兄の無事を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 852, 0, 172, 576, "White");
	Fade("色１", 0, 0, null, false);
	Request("色１", AddRender);
	Fade("色１", 10, 1000, null, true);

	CreateBG(100, 0, 0, 0, "cg/ev/ev100_02_1_６人祈る_a.jpg");

	Fade("色１", 1000, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text054]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000880ta">
楠優愛が、祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000890ta">
倒壊したビルの瓦礫。そこに埋もれるように横たわるコンテナの中で。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000900ta">
“彼”の美少女フィギュアのひとつを握りしめて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000910ta">
地震と火事で醜く変形してしまったフィギュアたちの姿に感じた、胸の痛みに耐え。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000920ta">
目を閉じて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000930ta">
祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000940ta">
彼女を許してくれた少年の無事を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 172, 576, "White");
	Fade("色１", 0, 0, null, false);
	Request("色１", AddRender);
	Fade("色１", 10, 1000, null, true);

	CreateBG(100, 0, 0, 0, "cg/ev/ev100_03_1_６人祈る_a.jpg");

	Fade("色１", 1000, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text055]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000950ta">
岸本あやせが、祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000960ta">
避難所となっている、翠明学園。その校舎の屋上で空を見上げて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000970ta">
神話が書かれた文庫本を握りしめて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000980ta">
崩壊した渋谷を覆う、不特定多数の妄想が見せる悪意の痛みに耐え。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00000990ta">
目を閉じて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001000ta">
祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001010ta">
彼女の歌を、彼女の話を、聞いてくれた少年の無事を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 682, 0, 172, 576, "White");
	Fade("色１", 0, 0, null, false);
	Request("色１", AddRender);
	Fade("色１", 10, 1000, null, true);

	CreateBG(100, 0, 0, 0, "cg/ev/ev100_04_1_６人祈る_a.jpg");

	Fade("色１", 1000, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text056]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001020ta">
折原梢が、祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001030ts">
神泉駅の、薄暗いホーム。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001040ta">
蒼井セナの、震える手を握りしめて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001050ta">
足の傷の痛みに耐えて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001060ta">
目を閉じて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001070ta">
祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001080ta">
心の声で語り合ったクラスメイトの少年の無事を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 170, 0, 172, 576, "White");
	Fade("色１", 0, 0, null, false);
	Request("色１", AddRender);
	Fade("色１", 10, 1000, null, true);

	CreateBG(100, 0, 0, 0, "cg/ev/ev100_05_1_６人祈る_a.jpg");

	Fade("色１", 1000, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text057]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001090ta">
蒼井セナが、祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001100ta">
横たわる父の傍らに座り。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001110ta">
父の、冷たくなった手を握りしめて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001120ta">
最後まで素直になれなかった後悔の痛みに耐えて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001130ta">
目を閉じて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001140ta">
祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001150ta">
彼女の“お願い”に、不器用ながら応えようとしてくれた少年の無事を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 512, 0, 172, 576, "White");
	Fade("色１", 0, 0, null, false);
	Request("色１", AddRender);
	Fade("色１", 10, 1000, null, true);

	CreateBG(100, 0, 0, 0, "cg/ev/ev100_06_1_６人祈る_a.jpg");

	Fade("色１", 1000, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text058]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001160ta">
咲畑梨深が、祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001170ta">
冷たい床に横たわりながら。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001180ta">
“彼”へ伸ばした自らの手を、きつく握りしめて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001190ta">
傷だらけの“彼”の姿を見て感じた、締め付けられるような胸の痛みに耐えて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001200ta">
目を閉じて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001210ta">
祈る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001220ta">
自分が守ろうとした、自分を助けに来てくれた少年の無事を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back10", 1000, 0, 0, 1280, 720, "White");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 1000, 1000, null, true);

	Wait(2000);


//アイキャッチ
//ＢＧ//海と青い空
	CreateColor("白１", 500, 0, 0, 1280, 720, "white");
	Delete("back*");

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg113_01_6_海と青い空_a.jpg");

	Fade("白１", 2000, 0, null, true);
	Delete("白１");

	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200010jn">
「僕はなにもできなかった」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200020jn">
「君が、行動したんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200030jn">
「その結果として、みんなが君のことを見てきた」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200040jn">
「君という周囲共通認識は、とっくに、できあがっているんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200050jn">
「これからは、いや、もうすでに」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200060jn">
「君こそが――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001230ta">
「ぼく……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001240ta">
「ぼくは？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001250ta">
「きみは？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001260ta">
「だれ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



}

