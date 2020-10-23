//<continuation number="190">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "chz_212_青空編_pray";
		$GameContiune = 1;
		$GameDebugSelect=1;
		$Ａルート = true;
			#ClearG=true;
			#ClearPieceR=true;
			#ClearPieceY=true;
			#ClearPieceS=true;
			#ClearPieceK=true;
			#ClearPieceN=true;
			#ClearPieceA=true;
			#ClearRouteB=true;
			#ClearRouteA=true;
			#EndPieceR=true;
			#EndPieceY=true;
			#EndPieceS=true;
			#EndPieceK=true;
			#EndPieceN=true;
			#EndPieceA=true;
			#EndRouteB=true;
			#EndRouteA=true;
			$ClearPreAll=true;
		Reset();
	}

		chz_212_青空編_pray();
}


function chz_212_青空編_pray()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($GameDebugSelect == 1)
{
	SetChoice02("タイトルから","十章頭から");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA02();
			$BlueSky=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			#ClearFinal=true;
			#EndFinal=true;
		}
	}
	$GameDebugSelect = 0;
}

	if($BlueSky){
		//■第１０章【bluesky】
		ChapterIn("dx/mvI.avi");
			CreateColor("色１", 500, 0, 0, 1280, 720, "White");
			Request("色１", AddRender);
			CreateTexture360("back03", 100, 0, 0, "cg/ev/ev100_01_1_６人祈る_a.jpg");
		ChapterIn2();
	
		BGMPlay360("CH22",0,1000,true);

		Fade("色１", 2000, 0, null, true);
		Delete("色１");

		Wait(3000);
	}else{
		//アイキャッチ挿入
		Wait(500);
		IntermissionIn();
			DeleteAll();
			CreateColor("色１", 500, 0, 0, 1280, 720, "White");
			Request("色１", AddRender);
			CreateTexture360("back03", 100, 0, 0, "cg/ev/ev100_01_1_６人祈る_a.jpg");
		IntermissionIn2();
	
		BGMPlay360("CH22",0,1000,true);
	
		Fade("色１", 2000, 0, null, true);
		Delete("色１");
	
		Wait(2000);
	}

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

	CreateTextureEX("back04", 100, 0, 0, "cg/sys/select/back.png");

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

{	Fade("back04", 4000, 1000, null, false);}
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200060jn">
「君こそが――」

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

//※以下のＹＥＳ／ＮＯ分岐は分岐しません。必ず全問に解答します
//※ＹＥＳ／ＮＯ分岐
//■選択肢開始====================================================
	WaitAction("back04", null);
	StartWhich();

	$parsonback=9500;//画像優先度
	$parson=false;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001270ta">
“きみはぼく。”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
				YES();
			}
		}
		Wait(16);
			}


//■設定====================================================
	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture360("back04", 100, 0, 0, "cg/ev/ev052_02_3_将軍車椅子_a.jpg");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢２
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001280ta">
“ぼくはきみ。”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
				YES();
			}
			}
		Wait(16);
		}



//■設定====================================================
	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture360("back04", 100, 0, 0, "cg/ev/ev038_01_3_優愛ROOM37乱入_a.jpg");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢３
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001290ta">
“ぼくなんて、いない。”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→ミス
//ＮＯ→正解
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO();
			}
			case @選択肢１:
			{
				YES();
				$バット = 1;
			}
			}
		Wait(16);
		}


//■設定====================================================

	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture360("back04", 100, 0, 0, "cg/ev/ev066_01_1_あやせ花壇落ち_a.jpg");
	Request("back04", Smoothing);
	Zoom("back04", 0, 500, 500, null, true);
	Move("back04", 0, @-512, @-384, null, true);
	//★★★★アンロック
	XBOX360_LockVideo(false);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢４
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001300ta">
“きみなんて、いない。”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→ミス
//ＮＯ→正解
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO();
			}
			case @選択肢１:
			{
				YES();
				$バット = 1;
			}
			}
		Wait(16);
		}


//■設定====================================================
	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture360("back04", 100, 0, 0, "cg/ev/ev013_03_1_拓巳笑い口UP_a.jpg");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢５
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001310ta">
“ぼくはぼくじゃない。”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→ミス
//ＮＯ→正解
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO();
			}
			case @選択肢１:
			{
				YES();
				$バット = 1;
			}
			}
		Wait(16);
		}

//■設定====================================================
	$parson=true;

	//★★★★ロック
	XBOX360_LockVideo(true);
//	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg098_01_0_AHロビー_a.jpg");
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg195_02_6_chnBエンド拓巳部屋_a.jpg");
	Stand("bu七海_トレーナー_通常","normal", 15000, @0);

	if(#下着パッチ==true)
	{
		CreateTexture("七海", 10100, @-74, InBottom, "ex/bu/bu七海_トレーナー_通常_下着_normal.png");
	}else{
		CreateTexture("七海", 10100, @-74, InBottom, "cg/bu/bu七海_トレーナー_通常_normal.png");
	}
	Fade("七海", 0, 0, null, true);
	Move("七海", 0, @-31, @136, null, true);

		//■徒歩：追加
		CreateTextureEX("back05", $parsonback, -251, -174, "cg/ev/ev141_01_1_七海キス_a.jpg");
		Request("back05", Smoothing);
		Zoom("back05", 0, 1500, 1500, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	FadeStand("bu七海_トレーナー_通常_normal", 0, true);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢６
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【七海】
<voice name="七海" class="七海" src="voice/ch10/21200070na">
「あなたは、おにぃ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
		//■徒歩：追加
		Fade("back05", 500, 1000, null, false);
	Fade("七海", 0, 1000, null, false);
	DeleteStand("bu七海_トレーナー_通常_normal", 0, false);
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
	//			DeleteStand("bu七海_制服_通常_normal", 500, false);
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
	//			DeleteStand("bu七海_制服_通常_normal", 500, false);
				YES();
			}
			}
		Wait(16);
		}

			FadeDelete("七海", 0, true);

//■設定====================================================
	$parson=true;

	//★★★★ロック
	XBOX360_LockVideo(true);

//	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg220_01_3_chnコーネリアス屋上_a.jpg");
	Stand("bu優愛_制服_通常左手下_メガネなし","normal", 15000, @0);

	if(#下着パッチ==true)
	{
		CreateTexture("優愛", 10100, Center, InBottom, "ex/bu/bu優愛_制服_通常左手下_メガネなし_下着_normal.png");
	}else{
		CreateTexture("優愛", 10100, Center, InBottom, "cg/bu/bu優愛_制服_通常左手下_メガネなし_normal.png");
	}
	Fade("優愛", 0, 0, null, true);
	Move("優愛", 0, @-20, @136, null, true);

		//■徒歩：追加
		CreateTextureEX("back05", $parsonback, -251, -174, "cg/ev/ev125_01_3_優愛すがりつき_a.jpg");
		Request("back05", Smoothing);
		Zoom("back05", 0, 1500, 1500, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	FadeStand("bu優愛_制服_通常左手下_メガネなし_normal", 0, true);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢７
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/21200080yu">
「あなたは、にしじょうくん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――


//ＹＥＳ→正解
//ＮＯ→ミス
		//■徒歩：追加
		Fade("back05", 500, 1000, null, false);
	Fade("優愛", 0, 1000, null, false);
	DeleteStand("bu優愛_制服_通常左手下_メガネなし_normal", 0, false);
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
	//			DeleteStand("bu優愛_制服_通常_normal", 500, false);
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
	//			DeleteStand("bu優愛_制服_通常_normal", 500, false);
				YES();
			}
			}
		Wait(16);
		}

	FadeDelete("優愛", 0, true);

//■設定====================================================
	$parson=true;

	//★★★★ロック
	XBOX360_LockVideo(true);

//	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg050_01_2_学校屋上_a.jpg");
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg904_02_1_エンド青空_a.jpg");
	Stand("buあやせ_制服_泣く","utsu", 15000, @0);

	if(#下着パッチ==true)
	{
		CreateTexture("あやせ", 10100, Center, InBottom, "ex/bu/buあやせ_制服_泣く_下着_utsu.png");
	}else{
		CreateTexture("あやせ", 10100, Center, InBottom, "cg/bu/buあやせ_制服_泣く_utsu.png");
	}
	Fade("あやせ", 0, 0, null, true);
	Move("あやせ", 0, @-20, @136, null, true);

		//■徒歩：追加
		CreateTextureEX("back05", $parsonback, 118, -211, "cg/ev/ev130_01_6_あやせ空見上げ_a.jpg");
		Request("back05", Smoothing);
		Zoom("back05", 0, 1500, 1500, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	FadeStand("buあやせ_制服_泣く_utsu", 0, true);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢８
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/21200090ay">
「きみは、たくみ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――


//ＹＥＳ→正解
//ＮＯ→ミス
		//■徒歩：追加
		Fade("back05", 500, 1000, null, false);
	Fade("あやせ", 0, 1000, null, false);
	DeleteStand("buあやせ_制服_泣く_utsu", 0, false);
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
	//			DeleteStand("buあやせ_制服_通常_normal", 500, false);
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
	//			DeleteStand("buあやせ_制服_通常_normal", 500, false);
				YES();
			}
			}
		Wait(16);
		}
	FadeDelete("あやせ", 0, true);

//■設定====================================================
	$parson=true;

	//★★★★ロック
	XBOX360_LockVideo(true);

//	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg043_01_1_学校中庭_a.jpg");
	Stand("bu梢_制服_通常","normal", 15000, @0);

	if(#下着パッチ==true)
	{
		CreateTexture("梢", 10100, Center, InBottom, "ex/bu/bu梢_制服_通常_下着_normal.png");
	}else{
		CreateTexture("梢", 10100, Center, InBottom, "cg/bu/bu梢_制服_通常_normal.png");
	}
	Fade("梢", 0, 0, null, true);
	Move("梢", 0, @-20, @136, null, true);

		//■徒歩：追加
		CreateTextureEX("back05", $parsonback, 278, -7, "cg/ev/ev136_01_1_梢空見上げ_a.jpg");
		Request("back05", Smoothing);
		Zoom("back05", 0, 1500, 1500, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	FadeStand("bu梢_制服_通常_normal", 0, true);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢９
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【梢】
<voice name="梢" class="梢" src="voice/ch10/21200100ko">
「あなたは、たくみしゃん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
		//■徒歩：追加
		Fade("back05", 500, 1000, null, false);
	Fade("梢", 0, 1000, null, false);
	DeleteStand("bu梢_制服_通常_normal", 0, false);
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
			//	DeleteStand("bu梢_制服_通常_normal", 500, false);
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
			//	DeleteStand("bu梢_制服_通常_normal", 500, false);
				YES();
			}
			}
		Wait(16);
		}
	FadeDelete("梢", 0, true);

//■設定====================================================
	$parson=true;

	//★★★★ロック
	XBOX360_LockVideo(true);

//	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg197_02_6_渋谷駅東口とプラネタリウム_a.jpg");
	Stand("buセナ_制服_照れ","smile", 15000, @0);

	if(#下着パッチ==true)
	{
		CreateTexture("セナ", 10100, Center, InBottom, "ex/bu/buセナ_制服_照れ_下着_smile.png");
	}else{
		CreateTexture("セナ", 10100, Center, InBottom, "cg/bu/buセナ_制服_照れ_smile.png");
	}
	Fade("セナ", 0, 0, null, true);
	Move("セナ", 0, @-20, @136, null, true);

		//■徒歩：追加
		CreateTextureEX("back05", $parsonback, 162, -29, "cg/ev/ev120_02_6_ノアⅡ破壊_a.jpg");
		Request("back05", Smoothing);
		Zoom("back05", 0, 1500, 1500, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	FadeStand("buセナ_制服_照れ_smile", 0, true);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢１０
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21200110sn">
「おまえは、にしじょう」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
		//■徒歩：追加
		Fade("back05", 500, 1000, null, false);
	Fade("セナ", 0, 1000, null, false);
	DeleteStand("buセナ_制服_照れ_smile", 0, false);
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
	//			DeleteStand("buセナ_制服_通常_normal", 500, false);
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
	//			DeleteStand("buセナ_制服_通常_normal", 500, false);
				YES();
			}
			}
		Wait(16);
		}
	FadeDelete("セナ", 0, true);

//■設定====================================================
	$parson=true;

	//★★★★ロック
	XBOX360_LockVideo(true);

//	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg113_01_6_海と青い空_a.jpg");
	Stand("bu梨深_白ワンピ_正面","normal", 15000, @0);

	if(#下着パッチ==true)
	{
		CreateTexture("梨深", 10100, Center, InBottom, "ex/bu/bu梨深_白ワンピ_正面_下着_normal.png");
	}else{
		CreateTexture("梨深", 10100, Center, InBottom, "cg/bu/bu梨深_白ワンピ_正面_normal.png");
	}
	Fade("梨深", 0, 0, null, true);
	Move("梨深", 0, @-20, @136, null, true);

		//■徒歩：追加
		CreateTextureEX("back05", $parsonback, -252, -241, "cg/ev/ev114_02_6_梨深キス2_a.jpg");
		Request("back05", Smoothing);
		Zoom("back05", 0, 1500, 1500, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	FadeStand("bu梨深_白ワンピ_正面_normal", 0, true);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢１１
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21200120ri">
「あなたは、たく」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
		//■徒歩：追加
		Fade("back05", 500, 1000, null, false);
	Fade("梨深", 0, 1000, null, false);
	DeleteStand("bu梨深_白ワンピ_正面_normal", 0, false);
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
	//			DeleteStand("bu梨深_制服_通常_normal", 500, false);
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
	//			DeleteStand("bu梨深_制服_通常_normal", 500, false);
				YES();
			}
			}
		Wait(16);
		}
	FadeDelete("梨深", 0, true);
	Delete("back05");

//■設定====================================================
	$parson=false;

	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture360("back04", 100, 0, 0, "cg/ev/ev092_02_1_拓巳振り返り_a.jpg");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢１２
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001320ta">
“ぼくはぼく。”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
				YES();
			}
			}
		Wait(16);
		}


//■設定====================================================
	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture360("back04", 100, 0, 0, "cg/ev/ev032_01_3_梨深だきしめ_a.jpg");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢１３
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001330ta">
“ぼくは、妄想のそんざい。”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
				YES();
			}
			}
		Wait(16);
		}


//■設定====================================================
	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture360("back04", 100, 0, -79, "cg/ev/ev062_01_1_プリクラ_a.jpg");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	PreWhich();


//ＹＥＳ／ＮＯ選択肢１４
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001340ta">
“僕は、存在する。”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
				YES();
			}
			}
		Wait(16);
		}


//■設定====================================================
	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture360("back04", 100, 0, 0, "cg/ev/ev100_06_1_６人祈る_a.jpg");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	PreWhich();

//ＹＥＳ／ＮＯ選択肢１５
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001350ta">
“僕は、西條拓巳。”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich();
	SetWhich();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO();
				$バット = 1;
			}
			case @選択肢１:
			{
				if($バット==1){
					YES();
				}else{
					YES00();
				}
			}
			}
		Wait(16);
		}

	//★★★★ロック
	XBOX360_LockVideo(true);
	Delete("back04");
	CreateTexture360("背景８", 1000, 0, 0, "cg/sys/select/back.png");
	//★★★★アンロック
	XBOX360_LockVideo(false);


//■選択肢終了

	if($バット == 1){
		EndWhich();
	}else{
		EndWhich00();
		$Ａ２ルート = true;
	}


//※ＹＥＳ／ＮＯ分岐終了


//すべて正解の場合
//フラグ【Ａエンドエピローグ】ＯＮ

//ひとつでもミスがあった場合
//フラグ発生せず
	SetVolume360("CH22", 2000, 0, NULL);


}