//<continuation number="270">

chapter main
{
	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "chz_222_エンドクレジット";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

	chz_222_エンドクレジット();
}






function chz_222_エンドクレジット()
{
		#play_speed_plus = #SYSTEM_play_speed;
		#SYSTEM_play_speed = 3;
	
		$SYSTEM_text_auto=false;
		$SYSTEM_skip=false;
		#SYSTEM_skip_express=false;
	
		$SYSTEM_menu_lock=true;

	$SYSTEM_XBOX360_rich_presence_mode=23;
	XBOX360_Presence(23);

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($GameDebugSelect == 1)
{
	$Ａルート=false;

	SetChoice03("Ａ","Ｂ","その他");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA03();
			$Ａルート = true;
			$GameDebugSelect = false;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$Ｂルート = true;
			$GameDebugSelect = false;
		}
		case @選択肢３:
		{
			ChoiceC03();
		}
	}
}

if($GameDebugSelect == 1)
{
	SetChoice03("梨深","優愛","その他");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA03();
			$梨深ルート = true;
			$GameDebugSelect = false;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$優愛ルート = true;
			$GameDebugSelect = false;
		}
		case @選択肢３:
		{
			ChoiceC03();
		}
	}
}

if($GameDebugSelect == 1)
{
	SetChoice03("セナ","梢","その他");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA03();
			$セナルート = true;
			$GameDebugSelect = false;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$梢ルート = true;
			$GameDebugSelect = false;
		}
		case @選択肢３:
		{
			ChoiceC03();
		}
	}
}

if($GameDebugSelect == 1)
{
	SetChoice03("あやせ","七海","グランドフィナーレ");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA03();
			$あやせルート = true;
			$GameDebugSelect = false;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$七海ルート = true;
			$GameDebugSelect = false;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$Ａ２ルート = true;
			$GameDebugSelect = false;
		}
	}
}


//■どのロール？
	if($Ａ２ルート){
		$BGM="CHN_ED_A";
		PreSetRoll($BGM,"cg/bg/bg904_01_1_エンド青空_a.jpg");
		if(#EndFinal){
			SetRoll("ProcessRoll03",$BGM,false);
		}else{
			SetRoll("ProcessRoll03",$BGM,true);
			#EndFinal=true;
//○実績No.25：【blue sky】
			XBOX360_Achieved(25);
		}
	}else if($Ｂルート){
		$BGM="CHN_ED_B";
		PreSetRoll3($BGM,"cg/ev/ev105_02_1_拓巳光と消える_a.jpg");
		if(#EndRouteB){
			SetRoll("ProcessRollDX",$BGM,false);
		}else{
			SetRoll("ProcessRollDX",$BGM,true);
			#EndRouteB=true;
//○実績No.24：【crying sky】
			XBOX360_Achieved(24);
		}
	}else if($Ａルート){
		$BGM="chn05";
		PreSetRoll2($BGM,"#FFFFFF");
		if(#EndRouteA){
			SetRoll("ProcessRoll01",$BGM,false);
		}else{
			SetRoll("ProcessRoll01",$BGM,true);
			#EndRouteA=true;
//○実績No.23：【silent sky】
			XBOX360_Achieved(23);
		}
	}else if($梨深ルート){
		$BGM="CHN_ED_rimi";
		PreSetRoll4($BGM,"cg/bg/bg002_01_1_青空_a.jpg");
		if(#EndPieceR){
			SetRoll("ProcessRoll01",$BGM,false);
		}else{
			SetRoll("ProcessRoll01",$BGM,true);
			#EndPieceR=true;
//○実績No.17：【アニマの像】
			XBOX360_Achieved(17);
		}
	}else if($優愛ルート){
		$BGM="CHN_ED_yua";
		PreSetRoll5($BGM,"cg/ev/ev125_01_3_優愛すがりつき_a.jpg");
		if(#EndPieceY){
			SetRoll("ProcessRoll02",$BGM,false);
		}else{
			SetRoll("ProcessRoll02",$BGM,true);
			#EndPieceY=true;
//○実績No.22：【月と太陽】
			XBOX360_Achieved(22);
		}
	}else if($セナルート){
		$BGM="CHN_ED_sena";
		PreSetRoll($BGM,"cg/bg/bg206_01_3_夜空_a.jpg");
		if(#EndPieceS){
			SetRoll("ProcessRollSP",$BGM,false);
		}else{
			SetRoll("ProcessRollSP",$BGM,true);
			#EndPieceS=true;
//エピローグがあるため「chs_166_セナ編_エピローグ.nss」にて実績
		}
	}else if($梢ルート){
		$BGM="CHN_ED_kozue";
		PreSetRoll($BGM,"cg/bg/bg234_01_6_chnビーズコレクション_a.jpg");
		if(#EndPieceK){
			SetRoll("ProcessRollEX",$BGM,false);
		}else{
			SetRoll("ProcessRollEX",$BGM,true);
			#EndPieceK=true;
//○実績No.21：【殺戮に至る病】
			XBOX360_Achieved(21);
		}
	}else if($七海ルート){
		$BGM="CHN_ED_nanami";
		PreSetRoll($BGM,"cg/ev/ev141_01_1_七海キス_a.jpg");
		if(#EndPieceN){
			SetRoll("ProcessRoll01",$BGM,false);
		}else{
			SetRoll("ProcessRoll01",$BGM,true);
			#EndPieceN=true;
//○実績No.18：【daydream】
			XBOX360_Achieved(18);
		}
	}else if($あやせルート){
		$BGM="CHN_ED_ayase";
		PreSetRoll($BGM,"cg/bg/bg904_02_1_エンド青空_a.jpg");
		if(#EndPieceA){
			SetRoll("ProcessRoll01",$BGM,false);
		}else{
			SetRoll("ProcessRoll01",$BGM,true);
			#EndPieceA=true;
//エピローグがあるため「cha_169_あやせ編_エピローグ.nss」にて実績
		}
	}
}




function PreSetRoll($EndRollBGM,$EndRollBack)
{
	$EndRollBackName="エンドロール背景";

//	CreateBGM360($EndRollBGM);
	BGMPlay360Suspend($EndRollBGM,0,1000,true);

	CreateTextureEX($EndRollBackName, 1000, 0, 0, $EndRollBack);
	SetAlias($EndRollBackName, $EndRollBackName);
	Fade($EndRollBackName, 3000, 1000, null, true);

	$BGM="@"+$EndRollBGM;
}

function PreSetRoll2($EndRollBGM,$EndRollBack)
{
	$EndRollBackName="エンドロール背景";

//	CreateBGM360($EndRollBGM);
	BGMPlay360Suspend($EndRollBGM,0,1000,true);

	CreateColor($EndRollBackName, 150, 0, 0, 1280, 720, $EndRollBack);
	Fade($EndRollBackName, 0, 0, null, true);
	SetAlias($EndRollBackName, $EndRollBackName);
	Fade($EndRollBackName, 0, 1000, null, true);

	$BGM="@"+$EndRollBGM;
}

function PreSetRoll3($EndRollBGM,$EndRollBack)
{
	$EndRollBackName="エンドロール背景";

//	CreateBGM360($EndRollBGM);
	BGMPlay360Suspend($EndRollBGM,0,1000,true);
	CreateTexture($EndRollBackName, 1000, 0, -76, $EndRollBack);
	Fade($EndRollBackName, 0, 0, null, true);
	SetAlias($EndRollBackName, $EndRollBackName);
	Fade($EndRollBackName, 3000, 1000, null, true);

	$BGM="@"+$EndRollBGM;
}

function PreSetRoll4($EndRollBGM,$EndRollBack)
{
	$EndRollBackName="エンドロール背景";

//	CreateBGM360($EndRollBGM);
	BGMPlay360Suspend($EndRollBGM,0,1000,true);

	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTextureEX($EndRollBackName, 1000, Center, Middle, SCREEN);
	SetAlias($EndRollBackName, $EndRollBackName);
	//★★★★アンロック
	XBOX360_LockVideo(false);

	Fade($EndRollBackName, 500, 1000, null, true);

	$BGM="@"+$EndRollBGM;
}

function PreSetRoll5($EndRollBGM,$EndRollBack)
{
	$EndRollBackName="エンドロール背景";

//	CreateBGM360($EndRollBGM);
	BGMPlay360Suspend($EndRollBGM,0,1000,true);

	CreateTextureEX($EndRollBackName, 1000, 0, 0, $EndRollBack);
	SetAlias($EndRollBackName, $EndRollBackName);
	Fade($EndRollBackName, 0, 1000, null, true);

	$BGM="@"+$EndRollBGM;
}







//■大元のプロセス
function SetRoll($処理単位名,$ナット名,$待機)
{
	#play_speed_plus = #SYSTEM_play_speed;
	#SYSTEM_play_speed = 3;

	$SYSTEM_text_auto=false;
	$SYSTEM_skip=false;
	#SYSTEM_skip_express=false;

	$SYSTEM_menu_lock=true;

	CreateProcess("エンドロールプロセス", 2000, 0, 0, $処理単位名);
	SetAlias("エンドロールプロセス", "エンドロールプロセス");

	CreateColor("色", 2000, 0, 0, 1280, 720, #000000);
	SetAlias("色", "色");
	Fade("色", 0, 0, null, true);

	Request("エンドロールプロセス", Start);
	Wait(1000);

	if($待機){WaitAction("@エンドロールプロセス", null);}
	WaitKey();

	$EndingSkip=true;

	Request("@CH*", EntrustSuspend);
	Request("chn*", EntrustSuspend);
	SetVolume360("CH*", 4000, 0, NULL);
	SetVolume360("chn*", 4000, 0, NULL);

	Wait(2000);
	if(!$あやせルート){
		Fade("@色", 2000, 1000, null, true);
	}

	Request("エンドロールプロセス", Stop);

	Fade("@エンドロール*",0,0,null,true);
	Delete("@エンドロール*");
	Fade("@色", 0, 0, null, true);

	#SYSTEM_play_speed = #play_speed_plus;
	$SYSTEM_menu_lock = false;
}


//▼パターン１
function ProcessRoll01()
{
//七海//梨深//あやせ//Ａ
	//★★★★ロック
	XBOX360_LockVideo(true);

	$EndMoveA = 576;
	CreateTexture("エンドロールクレジット１", 1000, Center, 576, "cg/sys/ed/CHN-S-001.png");
	SetAlias("エンドロールクレジット１", "エンドロールクレジット１");

	$EndMoveA += ImageVertical("エンドロールクレジット１");
	CreateTexture("エンドロールクレジット２", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-002.png");
	SetAlias("エンドロールクレジット２", "エンドロールクレジット２");

	$EndMoveA += ImageVertical("エンドロールクレジット２");
	CreateTexture("エンドロールクレジット３", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-003.png");
	SetAlias("エンドロールクレジット３", "エンドロールクレジット３");

	$EndMoveA += ImageVertical("エンドロールクレジット３");
	CreateTexture("エンドロールクレジット４", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-004.png");
	SetAlias("エンドロールクレジット４", "エンドロールクレジット４");

	$EndMoveA += ImageVertical("エンドロールクレジット４");
//	$EndMoveA -= 720;
	$EndMoveB = -($EndMoveA);

	CreateTexture("エンドロールロゴ１", 1000, Center, 0, "cg/sys/ed/CHN-S-005.png");
	SetAlias("エンドロールロゴ１", "エンドロールロゴ１");
	if($Ａルート||$七海ルート||$梨深ルート){
		CreateTexture("エンドロールロゴ２", 1000, Center, 0, "cg/sys/ed/CHN-S-007.png");
	}else{
		CreateTexture("エンドロールロゴ２", 1000, Center, 0, "cg/sys/ed/CHN-S-006.png");
	}
	SetAlias("エンドロールロゴ２", "エンドロールロゴ２");
	Fade("エンドロールロゴ*", 0, 0, null, true);

	CreateProcess("エンドロール歌プロセス", 150, 0, 0, "EndSong");
	SetAlias("エンドロール歌プロセス", "エンドロール歌プロセス");

	//★★★★アンロック
	XBOX360_LockVideo(false);

begin:

	SetLoop($ナット名, false);
	Request($ナット名, CompulsorySuspend);

	$残り時間 = RemainTime($ナット名);
	$残り時間 += 0;

	if($Ａルート){
		if($残り時間 < 80000)
		{
			$秒数 = DurationTime($ナット名);
			$残り時間=$残り時間+$秒数;
			//SetLoop($ナット名, 1);
		}
	}else{
		if($残り時間 < 60000)
		{
			$秒数 = DurationTime($ナット名);
			$残り時間=$残り時間+$秒数+1000;
			Request("@エンドロール歌プロセス", Start);
			//SetLoop($ナット名, 1);
		}
	}


	if($あやせルート){
		$残り時間=$残り時間-6000;
	}else if($Ａルート){
		$残り時間=$残り時間+5000;
	}else if($梨深ルート){
		$残り時間=$残り時間-9000;
	}else if($七海ルート){
		$残り時間=$残り時間-6000;
	}else{
		$残り時間=$残り時間-2000;
	}

//	CreateText("テキスト１", 10200, Center, Middle, Auto, Auto, $EndMoveA);
//	CreateText("テキスト２", 10200, Center, 300, Auto, Auto, $EndMoveB);
//	CreateText("テキスト３", 10200, Center, 400, Auto, Auto, $残り時間);
//	WaitKey();

	$残り時間A=($残り時間/100)*97;
	$残り時間B=($残り時間/100)*2;
	$残り時間C=($残り時間/100)*1;

	$残り時間B1=($残り時間B/6)*1;
	$残り時間B2=($残り時間B/6)*4;
	$残り時間B3=($残り時間B/6)*1;

	$残り時間C0=($残り時間C/6)*2;
	$残り時間C1=($残り時間C/6)*4;

	Move("@エンドロールクレジット*", $残り時間A,@0,@$EndMoveB,null,true);

	Fade("@エンドロールロゴ１", $残り時間B1, 1000, null, true);
	Wait($残り時間B2);
	Fade("@エンドロールロゴ１", $残り時間B3, 0, null, true);

	if($Ａルート){SetVolume360($ナット名, $残り時間C1, 0, NULL);}
	Wait($残り時間C0);
	Fade("@エンドロールロゴ２", $残り時間C1, 1000, null, true);
}

//▼パターン２
function ProcessRoll02()
{
//優愛
	if($優愛ルート){
		$EndRollBack01="cg/ev/ev125_01_6_楠姉妹写真_a.jpg";
		$EndRollPosition=-190;
	}else if($梢ルート){
		$EndRollBack01="cg/ev/ev133_03_6_梢ほのぼの_a.jpg";
		$EndRollPosition=-120;
	}

	CreateTexture("エンドロール背景１", 1000, Center, $EndRollPosition, $EndRollBack01);
	SetAlias("エンドロール背景１", "エンドロール背景１");
	Fade("エンドロール背景１", 0, 0, null, true);

	$EndMoveA = 576;
	CreateTexture("エンドロールクレジット１", 1000, Center, 576, "cg/sys/ed/CHN-S-001.png");
	SetAlias("エンドロールクレジット１", "エンドロールクレジット１");

	$EndMoveA += ImageVertical("エンドロールクレジット１");
	CreateTexture("エンドロールクレジット２", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-002.png");
	SetAlias("エンドロールクレジット２", "エンドロールクレジット２");

	$EndMoveA += ImageVertical("エンドロールクレジット２");
	CreateTexture("エンドロールクレジット３", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-003.png");
	SetAlias("エンドロールクレジット３", "エンドロールクレジット３");

	$EndMoveA += ImageVertical("エンドロールクレジット３");
	CreateTexture("エンドロールクレジット４", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-004.png");
	SetAlias("エンドロールクレジット４", "エンドロールクレジット４");

	$EndMoveA += ImageVertical("エンドロールクレジット４");
//	$EndMoveA -= 720;
	$EndMoveB = -($EndMoveA);

	CreateTexture("エンドロールロゴ１", 1000, Center, 0, "cg/sys/ed/CHN-S-005.png");
	SetAlias("エンドロールロゴ１", "エンドロールロゴ１");
	CreateTexture("エンドロールロゴ２", 1000, Center, 0, "cg/sys/ed/CHN-S-007.png");
	SetAlias("エンドロールロゴ２", "エンドロールロゴ２");
	Fade("エンドロールロゴ*", 0, 0, null, true);

	CreateProcess("エンドロール歌プロセス", 150, 0, 0, "EndSong");
	SetAlias("エンドロール歌プロセス", "エンドロール歌プロセス");

begin:

	SetLoop($ナット名, false);
	Request($ナット名, CompulsorySuspend);

	$残り時間 = RemainTime($ナット名);
	$残り時間 += 0;

	if($残り時間 < 60000)
	{
		$秒数 = DurationTime($ナット名);
		$残り時間=$残り時間+$秒数+1000;
		Request("@エンドロール歌プロセス", Start);
//		SetLoop($ナット名, 1);
	}

	$残り時間=$残り時間-5000;

//	CreateText("テキスト１", 10200, Center, Middle, Auto, Auto, $EndMoveA);
//	CreateText("テキスト２", 10200, Center, 300, Auto, Auto, $EndMoveB);
//	CreateText("テキスト３", 10200, Center, 400, Auto, Auto, $残り時間);
//	WaitKey();

	$残り時間A=($残り時間/100)*97;
	$残り時間B=($残り時間/100)*2;
	$残り時間C=($残り時間/100)*1;

	$残り時間A1=($残り時間A/100)*93;
	$残り時間A2=($残り時間A/100)*4;
	$残り時間A3=($残り時間A/100)*3;


	$残り時間B1=($残り時間B/6)*1;
	$残り時間B2=($残り時間B/6)*4;
	$残り時間B3=($残り時間B/6)*1;

	$残り時間C0=($残り時間C/6)*2;
	$残り時間C1=($残り時間C/6)*4;

	Move("@エンドロールクレジット*", $残り時間A,@0,@$EndMoveB,null,$残り時間A1);
	Fade("@エンドロール背景１", $残り時間A2, 1000, null, true);
	Wait($残り時間A3);

	Fade("@エンドロールロゴ１", $残り時間B1, 1000, null, true);
	Wait($残り時間B2);
	Fade("@エンドロールロゴ１", $残り時間B3, 0, null, true);

	Wait($残り時間C0);
	Fade("@エンドロールロゴ２", $残り時間C1, 1000, null, true);
}


//▼パターン３
function ProcessRoll03()
{
//LAST
	CreateTexture("エンドロール背景１", 1000, 0, -192, "cg/ev/ev102_01_1_Ａエンド1_a.jpg");
	Fade("エンドロール背景１", 0, 0, null, true);
	SetAlias("エンドロール背景１", "エンドロール背景１");

	CreateTexture("エンドロール背景２", 1000, 0, 0, "cg/ev/ev126_01_5_優愛空見上げ_a.jpg");
	Fade("エンドロール背景２", 0, 0, null, true);
	SetAlias("エンドロール背景２", "エンドロール背景２");

	CreateTexture("エンドロール背景３", 1000, 0, -192, "cg/ev/ev137_01_6_梢セナ空見上げ_a.jpg");
	Fade("エンドロール背景３", 0, 0, null, true);
	SetAlias("エンドロール背景３", "エンドロール背景３");

	CreateTexture("エンドロール背景４", 1000, 0, 0, "cg/ev/ev103_01_1_Ａエンド2_a.jpg");
	Fade("エンドロール背景４", 0, 0, null, true);
	SetAlias("エンドロール背景４", "エンドロール背景４");

	$EndMoveA = 576;
	CreateTexture("エンドロールクレジット１", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-L-001.png");
	SetAlias("エンドロールクレジット１", "エンドロールクレジット１");

	$EndMoveA += 576;
	$EndMoveA += ImageVertical("エンドロールクレジット１");
	CreateTexture("エンドロールクレジット２", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-L-002.png");
	SetAlias("エンドロールクレジット２", "エンドロールクレジット２");

	$EndMoveA += ImageVertical("エンドロールクレジット２");
	CreateTexture("エンドロールクレジット３", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-L-003.png");
	SetAlias("エンドロールクレジット３", "エンドロールクレジット３");

	$EndMoveA += ImageVertical("エンドロールクレジット３");
	CreateTexture("エンドロールクレジット４", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-L-004.png");
	SetAlias("エンドロールクレジット４", "エンドロールクレジット４");

	$EndMoveA += ImageVertical("エンドロールクレジット４");
	CreateTexture("エンドロールクレジット５", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-L-005.png");
	SetAlias("エンドロールクレジット５", "エンドロールクレジット５");

	$EndMoveA += ImageVertical("エンドロールクレジット５");
	CreateTexture("エンドロールクレジット６", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-L-006.png");
	SetAlias("エンドロールクレジット６", "エンドロールクレジット６");

	$EndMoveA += ImageVertical("エンドロールクレジット６");
//	$EndMoveA += 720;
	$EndMoveB = -($EndMoveA);

	CreateTexture("エンドロールロゴ１", 1000, Center, 0, "cg/sys/ed/CHN-L-007.png");
	SetAlias("エンドロールロゴ１", "エンドロールロゴ１");
	CreateTexture("エンドロールロゴ２", 1000, Center, 0, "cg/sys/ed/CHN-L-009.png");
	SetAlias("エンドロールロゴ２", "エンドロールロゴ２");
	Fade("エンドロールロゴ*", 0, 0, null, true);

	CreateProcess("エンドロール歌プロセス", 150, 0, 0, "EndSong");
	SetAlias("エンドロール歌プロセス", "エンドロール歌プロセス");

begin:


	SetLoop($ナット名, false);
	Request($ナット名, CompulsorySuspend);

	$残り時間 = RemainTime($ナット名);

	if($残り時間 < 45000)
	{
		$秒数 = DurationTime($ナット名);
		$残り時間=$残り時間+$秒数+1000;
		Request("@エンドロール歌プロセス", Start);
//		SetLoop($ナット名, 1);
	}

	$残り時間=$残り時間-8000;

	$残り時間A=($残り時間/100)*97;
	$残り時間B=($残り時間/100)*2;
	$残り時間C=($残り時間/100)*1;

	$EndMoveC = -(576+ImageVertical("エンドロールクレジット１"));
	$EndMoveD = $EndMoveB-$EndMoveC;

	$残り時間Z1=($EndMoveC/$EndMoveB)*$残り時間A;
	$残り時間Z2=$残り時間A-$残り時間Z1;

	$残り時間A1=($残り時間Z2/100)*32;
	$残り時間A2=($残り時間Z2/100)*32;
	$残り時間A3=($残り時間Z2/100)*32;
	$残り時間A4=($残り時間Z2/100)*4;

	$残り時間F1=($残り時間A1/10)*1;
	$残り時間F2=($残り時間A2/10)*1;
	$残り時間F3=($残り時間A3/10)*1;
	$残り時間F4=($残り時間A4/10)*8;

	$残り時間M1=$残り時間A1+$残り時間F2;
	$残り時間M2=$残り時間A2+$残り時間F3;
	$残り時間M3=$残り時間A3+$残り時間F4;
	$残り時間M4=$残り時間A4+$残り時間B+$残り時間C;

	$残り時間B1=($残り時間B/6)*1;
	$残り時間B2=($残り時間B/6)*4;
	$残り時間B3=($残り時間B/6)*1;

	$残り時間C0=($残り時間C/6)*2;
	$残り時間C1=($残り時間C/6)*3;//調整

//	CreateText("テキスト１", 10200, Center, 200, Auto, Auto, $EndMoveA);
//	CreateText("テキスト２", 10200, Center, 300, Auto, Auto, $EndMoveB);
//	CreateText("テキスト３", 10200, Center, 400, Auto, Auto, $EndMoveC);
//	CreateText("テキスト４", 10200, Center, 500, Auto, Auto, $EndMoveD);

//下から上
	Move("@エンドロールクレジット*", $残り時間Z1,@0,@$EndMoveC,null,true);
	Move("@エンドロールクレジット*", $残り時間Z2,@0,@$EndMoveD,null,false);
		Fade("@エンドロール背景１", $残り時間F1, 1000, null, false);
		Move("@エンドロール背景１", $残り時間M1, @0, @192, null, false);
		Wait($残り時間A1);
		Fade("@エンドロール背景２", $残り時間F2, 1000, null, false);
		Move("@エンドロール背景２", $残り時間M2, @0, @-192, null, false);
		Wait($残り時間A2);
		Fade("@エンドロール背景３", $残り時間F3, 1000, null, false);
		Move("@エンドロール背景３", $残り時間M3, @0, @192, null, false);
		Wait($残り時間A3);
		Fade("@エンドロール背景４", $残り時間F4, 1000, null, false);
		Move("@エンドロール背景４", $残り時間M4, @0, @-192, null, false);
		Wait($残り時間A4);

	Fade("@エンドロールロゴ１", $残り時間B1, 1000, null, true);
	Wait($残り時間B2);
	Fade("@エンドロールロゴ１", $残り時間B3, 0, null, true);

	Wait($残り時間C0);
	Fade("@エンドロールロゴ２", $残り時間C1, 1000, null, true);
}

//▼パターンEX
function ProcessRollEX()
{
//梢
	if($梢ルート){
		$EndRollBack01="cg/ev/ev133_03_6_梢ほのぼの_a.jpg";
		$EndRollBack02="cg/ev/ev133_04_6_梢ほのぼの_a.jpg";
	}

	CreateTexture("エンドロール背景１", 1000, Center, -96, $EndRollBack01);
	SetAlias("エンドロール背景１", "エンドロール背景１");
	Fade("エンドロール背景１", 0, 0, null, true);

	CreateTexture("エンドロール背景２", 1000, Center, -96, $EndRollBack02);
	SetAlias("エンドロール背景２", "エンドロール背景２");
	Fade("エンドロール背景２", 0, 0, null, true);

	$EndMoveA = 576;
	CreateTexture("エンドロールクレジット１", 1000, Center, 576, "cg/sys/ed/CHN-S-001.png");
	SetAlias("エンドロールクレジット１", "エンドロールクレジット１");

	$EndMoveA += ImageVertical("エンドロールクレジット１");
	CreateTexture("エンドロールクレジット２", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-002.png");
	SetAlias("エンドロールクレジット２", "エンドロールクレジット２");

	$EndMoveA += ImageVertical("エンドロールクレジット２");
	CreateTexture("エンドロールクレジット３", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-003.png");
	SetAlias("エンドロールクレジット３", "エンドロールクレジット３");

	$EndMoveA += ImageVertical("エンドロールクレジット３");
	CreateTexture("エンドロールクレジット４", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-004.png");
	SetAlias("エンドロールクレジット４", "エンドロールクレジット４");

	$EndMoveA += ImageVertical("エンドロールクレジット４");
//	$EndMoveA -= 720;
	$EndMoveB = -($EndMoveA);

	CreateTexture("エンドロールロゴ１", 1000, Center, 0, "cg/sys/ed/CHN-S-005.png");
	SetAlias("エンドロールロゴ１", "エンドロールロゴ１");
	CreateTexture("エンドロールロゴ２", 1000, -245, 36, "cg/sys/ed/CHN-S-007.png");
	SetAlias("エンドロールロゴ２", "エンドロールロゴ２");
	Fade("エンドロールロゴ*", 0, 0, null, true);

	CreateProcess("エンドロール歌プロセス", 150, 0, 0, "EndSong");
	SetAlias("エンドロール歌プロセス", "エンドロール歌プロセス");

begin:

	SetLoop($ナット名, false);
	Request($ナット名, CompulsorySuspend);

	$残り時間 = RemainTime($ナット名);
	$残り時間 += 0;

	if($残り時間 < 60000)
	{
		$秒数 = DurationTime($ナット名);
		$残り時間=$残り時間+$秒数+1000;
		Request("@エンドロール歌プロセス", Start);
//		SetLoop($ナット名, 1);
	}

	$残り時間=$残り時間-3000;

//	CreateText("テキスト１", 10200, Center, Middle, Auto, Auto, $EndMoveA);
//	CreateText("テキスト２", 10200, Center, 300, Auto, Auto, $EndMoveB);
//	CreateText("テキスト３", 10200, Center, 400, Auto, Auto, $残り時間);
//	WaitKey();

	$残り時間A=($残り時間/100)*95;
	$残り時間B=($残り時間/100)*2;
	$残り時間C=($残り時間/100)*3;


	$残り時間A1=($残り時間A/100)*90;
	$残り時間A2=($残り時間A/100)*5;
	$残り時間A3=($残り時間A/100)*5;

	$残り時間B1=($残り時間B/6)*1;
	$残り時間B2=($残り時間B/6)*4;
	$残り時間B3=($残り時間B/6)*1;

	$残り時間C0=($残り時間C/80)*15;
	$残り時間C1=($残り時間C/80)*35;
	$残り時間C2=($残り時間C/80)*15;
	$残り時間C3=($残り時間C/80)*10;
	$残り時間C4=($残り時間C/80)*5;

	Move("@エンドロールクレジット*", $残り時間A,@0,@$EndMoveB,null,$残り時間A1);
	Fade("@エンドロール背景１", $残り時間A2, 1000, null, true);
	Wait($残り時間A3);

	Fade("@エンドロールロゴ１", $残り時間B1, 1000, null, true);
	Wait($残り時間B2);
	Fade("@エンドロールロゴ１", $残り時間B3, 0, null, true);

	Wait($残り時間C0);
	Fade("@エンドロール背景２", $残り時間C1, 1000, null, true);
	Wait($残り時間C2);
	Fade("@エンドロールロゴ２", $残り時間C3, 1000, null, false);
	Move("@エンドロールロゴ２", $残り時間C3, @0, @80, Axl2, true);
	Move("@エンドロールロゴ２", $残り時間C4, @0, @-16, Dxl2, true);
}



//▼パターンDX
function ProcessRollDX()
{
//Ｂルート
	if($Ｂルート){
		$EndRollBack01="cg/bg/bg001_02_5_崩壊渋谷_a.jpg";
		$EndRollPosition=-960;
	}

	CreateTexture("エンドロール背景１", 1000, Center, $EndRollPosition, $EndRollBack01);
	SetAlias("エンドロール背景１", "エンドロール背景１");
	Fade("エンドロール背景１", 0, 0, null, true);

	$EndMoveA = 576;
	CreateTexture("エンドロールクレジット１", 1000, Center, 576, "cg/sys/ed/CHN-S-001.png");
	SetAlias("エンドロールクレジット１", "エンドロールクレジット１");

	$EndMoveA += ImageVertical("エンドロールクレジット１");
	CreateTexture("エンドロールクレジット２", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-002.png");
	SetAlias("エンドロールクレジット２", "エンドロールクレジット２");

	$EndMoveA += ImageVertical("エンドロールクレジット２");
	CreateTexture("エンドロールクレジット３", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-003.png");
	SetAlias("エンドロールクレジット３", "エンドロールクレジット３");

	$EndMoveA += ImageVertical("エンドロールクレジット３");
	CreateTexture("エンドロールクレジット４", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-004.png");
	SetAlias("エンドロールクレジット４", "エンドロールクレジット４");

	$EndMoveA += ImageVertical("エンドロールクレジット４");
//	$EndMoveA -= 720;
	$EndMoveB = -($EndMoveA);

	CreateTexture("エンドロールロゴ１", 1000, Center, 0, "cg/sys/ed/CHN-S-005.png");
	SetAlias("エンドロールロゴ１", "エンドロールロゴ１");
	CreateTexture("エンドロールロゴ２", 1000, Center, 0, "cg/sys/ed/CHN-S-006.png");
	SetAlias("エンドロールロゴ２", "エンドロールロゴ２");
	Fade("エンドロールロゴ*", 0, 0, null, true);

	CreateProcess("エンドロール歌プロセス", 150, 0, 0, "EndSong");
	SetAlias("エンドロール歌プロセス", "エンドロール歌プロセス");

begin:

	SetLoop($ナット名, false);
	Request($ナット名, CompulsorySuspend);

	$残り時間 = RemainTime($ナット名);
	$残り時間 += 0;

	if($残り時間 < 60000)
	{
		$秒数 = DurationTime($ナット名);
		$残り時間=$残り時間+$秒数+1000;
		Request("@エンドロール歌プロセス", Start);
//		SetLoop($ナット名, 1);
	}

	$残り時間=$残り時間-7000;

//	CreateText("テキスト１", 10200, Center, Middle, Auto, Auto, $EndMoveA);
//	CreateText("テキスト２", 10200, Center, 300, Auto, Auto, $EndMoveB);
//	CreateText("テキスト３", 10200, Center, 400, Auto, Auto, $残り時間);
//	WaitKey();

	$残り時間A=($残り時間/100)*97;
	$残り時間B=($残り時間/100)*2;
	$残り時間C=($残り時間/100)*1;

	$残り時間A1=($残り時間A/100)*10;
	$残り時間A2=($残り時間A/100)*4;
	$残り時間A3=($残り時間A/100)*90;

	$残り時間A4=$残り時間A1+$残り時間A2;
	$残り時間A0=$残り時間A3+$残り時間B;

	$残り時間B1=($残り時間B/6)*1;
	$残り時間B2=($残り時間B/6)*4;
	$残り時間B3=($残り時間B/6)*1;

	$残り時間C0=($残り時間C/6)*2;
	$残り時間C1=($残り時間C/6)*4;

	Move("@エンドロール背景", $残り時間A4,@0,@-820,null,false);
	Move("@エンドロールクレジット*", $残り時間A,@0,@$EndMoveB,null,$残り時間A1);
	Move("@エンドロール背景１", $残り時間A0,@0,@960,null,false);
	Fade("@エンドロール背景１", $残り時間A2, 1000, null, false);
	Wait($残り時間A3);

	Fade("@エンドロールロゴ１", $残り時間B1, 1000, null, true);
	Wait($残り時間B2);
	Fade("@エンドロールロゴ１", $残り時間B3, 0, null, true);

	Wait($残り時間C0);
	Fade("@エンドロールロゴ２", $残り時間C1, 1000, null, true);
}




//▼パターンSP
function ProcessRollSP()
{
//セナルート
	$EndRollBack01="cg/bg/bg001_03_6_崩壊渋谷_a.jpg";
	$EndRollPosition=0;

	CreateTexture("エンドロール背景１", 1000, Center, $EndRollPosition, $EndRollBack01);
	SetAlias("エンドロール背景１", "エンドロール背景１");
	Fade("エンドロール背景１", 0, 0, null, true);

	$EndMoveA = 576;
	CreateTexture("エンドロールクレジット１", 1000, Center, 576, "cg/sys/ed/CHN-S-001.png");
	SetAlias("エンドロールクレジット１", "エンドロールクレジット１");

	$EndMoveA += ImageVertical("エンドロールクレジット１");
	CreateTexture("エンドロールクレジット２", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-002.png");
	SetAlias("エンドロールクレジット２", "エンドロールクレジット２");

	$EndMoveA += ImageVertical("エンドロールクレジット２");
	CreateTexture("エンドロールクレジット３", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-003.png");
	SetAlias("エンドロールクレジット３", "エンドロールクレジット３");

	$EndMoveA += ImageVertical("エンドロールクレジット３");
	CreateTexture("エンドロールクレジット４", 1000, Center, $EndMoveA, "cg/sys/ed/CHN-S-004.png");
	SetAlias("エンドロールクレジット４", "エンドロールクレジット４");

	$EndMoveA += ImageVertical("エンドロールクレジット４");
//	$EndMoveA -= 720;
	$EndMoveB = -($EndMoveA);

	CreateTexture("エンドロールロゴ１", 1000, Center, 0, "cg/sys/ed/CHN-S-005.png");
	SetAlias("エンドロールロゴ１", "エンドロールロゴ１");
	CreateTexture("エンドロールロゴ２", 1000, Center, 0, "cg/sys/ed/CHN-S-006.png");
	SetAlias("エンドロールロゴ２", "エンドロールロゴ２");
	Fade("エンドロールロゴ*", 0, 0, null, true);

	CreateProcess("エンドロール歌プロセス", 150, 0, 0, "EndSong");
	SetAlias("エンドロール歌プロセス", "エンドロール歌プロセス");

begin:

	SetLoop($ナット名, false);
	Request($ナット名, CompulsorySuspend);

	$残り時間 = RemainTime($ナット名);
	$残り時間 += 0;

	if($残り時間 < 60000)
	{
		$秒数 = DurationTime($ナット名);
		$残り時間=$残り時間+$秒数+1000;
		Request("@エンドロール歌プロセス", Start);
//		SetLoop($ナット名, 1);
	}

	$残り時間=$残り時間-6000;

	$残り時間A=($残り時間/100)*97;
	$残り時間B=($残り時間/100)*2;
	$残り時間C=($残り時間/100)*1;

	$残り時間A1=($残り時間A/100)*10;
	$残り時間A2=($残り時間A/100)*4;
	$残り時間A3=($残り時間A/100)*90;

	$残り時間B1=($残り時間B/6)*1;
	$残り時間B2=($残り時間B/6)*4;
	$残り時間B3=($残り時間B/6)*1;

	$残り時間C0=($残り時間C/6)*2;
	$残り時間C1=($残り時間C/6)*4;

	$残り時間A4=($残り時間A/100)*2;
	$残り時間A0=$残り時間A3+$残り時間B+$残り時間C;

//	CreateText("テキスト１", 10200, Center, Middle, Auto, Auto, $EndMoveA);
//	CreateText("テキスト２", 10200, Center, 300, Auto, Auto, $EndMoveB);
//	CreateText("テキスト３", 10200, Center, 400, Auto, Auto, $残り時間);
//	WaitKey();


	Move("@エンドロールクレジット*", $残り時間A,@0,@$EndMoveB,null,$残り時間A1);

	Fade("@エンドロール背景１", $残り時間A2, 1000, null, false);
	Move("@エンドロール背景１", $残り時間A,@0,@-960,null,false);
	Wait($残り時間A3);

	Fade("@エンドロールロゴ１", $残り時間B1, 1000, null, true);
	Wait($残り時間B2);
	Fade("@エンドロールロゴ１", $残り時間B3, 0, null, true);

	Wait($残り時間C0);
	Fade("@エンドロールロゴ２", $残り時間C1, 1000, null, true);
}



function EndSong()
{
	$EndTime=RemainTime($BGM);
	Wait($EndTime);

	SetVolume360($BGM, 1000, 0, NULL);
	WaitAction($BGM, null);

	BGMPlay360Suspend($EndRollBGM,0,1000,false);
}

