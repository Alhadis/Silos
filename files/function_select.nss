//======================================================================//
//　選択肢用の設定
//======================================================================//

//======================================================================//
.//■妄想トリガーフラグ
//======================================================================//
//初期化
function InitTrigger()
{
	$妄想トリガー通過１ = 1;
	$妄想トリガー通過２ = 1;
	$妄想トリガー通過３ = 1;
	$妄想トリガー通過４ = 1;
	$妄想トリガー通過５ = 1;
	$妄想トリガー通過６ = 1;
	$妄想トリガー通過７ = 1;
	$妄想トリガー通過８ = 1;
	$妄想トリガー通過９ = 1;
	$妄想トリガー通過１０ = 1;
	$妄想トリガー通過１１ = 1;
	$妄想トリガー通過１２ = 1;
	$妄想トリガー通過１２Ａ = 1;
	$妄想トリガー通過１３ = 1;
	$妄想トリガー通過１４ = 1;
	$妄想トリガー通過１５ = 1;
	$妄想トリガー通過１６ = 1;
	$妄想トリガー通過１７ = 1;
	$妄想トリガー通過１８ = 1;
	$妄想トリガー通過１９ = 1;
	$妄想トリガー通過２０ = 1;
	$妄想トリガー通過２１ = 1;
	$妄想トリガー通過２２ = 1;
	$妄想トリガー通過２３ = 1;
	$妄想トリガー通過２４ = 1;
	$妄想トリガー通過２５ = 1;
	$妄想トリガー通過２６ = 1;
	$妄想トリガー通過２７ = 1;
	$妄想トリガー通過２８ = 1;
	$妄想トリガー通過２９ = 1;
	$妄想トリガー通過３０ = 1;
	$妄想トリガー通過３１ = 1;
	$妄想トリガー通過３２ = 1;
	$妄想トリガー通過３３ = 1;
	$妄想トリガー通過３４ = 1;
	$妄想トリガー通過３５ = 1;
	$妄想トリガー通過３６ = 1;
	$妄想トリガー通過３７ = 1;
	$妄想トリガー通過３８ = 1;
	$妄想トリガー通過３９ = 1;
	$妄想トリガー通過４０ = 1;
	$妄想トリガー通過４１ = 1;
	$妄想トリガー通過４２ = 1;
	$妄想トリガー通過４３ = 1;
	$妄想トリガー通過４４ = 1;
}

//======================================================================//
.//■妄想トリガー選択肢
//======================================================================//
//定義

function SetTrigger($妄想トリガー名)
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	Delete("@サウンド中");
	Delete("@サウンド左");
	Delete("@サウンド右");
	Delete("@サウンドＩＮ");
	Delete("@サウンドＯＮ");
	Delete("@サウンドＯＦＦ");

	//●トリガーサウンド
	CreateSE("サウンドＯＮ","SE_日常_照明点灯");
//	Request("サウンドＯＮ", Lock);
	SetLoop("サウンドＯＮ", false);

	CreateSE("サウンドＯＦＦ","SE_日常_照明消灯");
//	Request("サウンドＯＦＦ", Lock);
	SetLoop("サウンドＯＦＦ", false);

	CreateSE("サウンドＩＮ","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
//	Request("サウンドＩＮ", Lock);
	SetLoop("サウンドＩＮ", true);

	//●トリガーサウンド
	CreateSE("サウンド中","SE_じん体_心臓_鼓動T_LOOP");
//	Request("サウンド中", Lock);
	SetLoop("サウンド中", true);

	CreateSE("サウンド左","SE_じん体_心臓_鼓動L_LOOP");
//	Request("サウンド左", Lock);
	SetLoop("サウンド左", true);

	CreateSE("サウンド右","SE_じん体_心臓_鼓動R_LOOP");
//	Request("サウンド右", Lock);
	SetLoop("サウンド右", true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	MoveCursor(1024,576);
	$LockText=true;

	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;

	//$SYSTEM_skip_lock = true;
	$SYSTEM_menu_lock = true;

	//★★★★ロック
	XBOX360_LockVideo(true);

	if($妄想トリガー名 == "１")
	{
		$妄想トリガー通過１ = 1;
	}
	else if($妄想トリガー名 == "２")
	{
		$妄想トリガー通過２ = 1;
	}
	else if($妄想トリガー名 == "３")
	{
		$妄想トリガー通過３ = 1;
	}
	else if($妄想トリガー名 == "４")
	{
		$妄想トリガー通過４ = 1;
	}
	else if($妄想トリガー名 == "５")
	{
		$妄想トリガー通過５ = 1;
	}
	else if($妄想トリガー名 == "６")
	{
		$妄想トリガー通過６ = 1;
	}
	else if($妄想トリガー名 == "７")
	{
		$妄想トリガー通過７ = 1;
	}
	else if($妄想トリガー名 == "８")
	{
		$妄想トリガー通過８ = 1;
	}
	else if($妄想トリガー名 == "９")
	{
		$妄想トリガー通過９ = 1;
	}
	else if($妄想トリガー名 == "１０")
	{
		$妄想トリガー通過１０ = 1;
	}
	else if($妄想トリガー名 == "１１")
	{
		$妄想トリガー通過１１ = 1;
	}
	else if($妄想トリガー名 == "１２")
	{
		$妄想トリガー通過１２ = 1;
	}
	else if($妄想トリガー名 == "１２Ａ")
	{
		$妄想トリガー通過１２Ａ = 1;
	}
	else if($妄想トリガー名 == "１３")
	{
		$妄想トリガー通過１３ = 1;
	}
	else if($妄想トリガー名 == "１４")
	{
		$妄想トリガー通過１４ = 1;
	}
	else if($妄想トリガー名 == "１５")
	{
		$妄想トリガー通過１５ = 1;
	}
	else if($妄想トリガー名 == "１６")
	{
		$妄想トリガー通過１６ = 1;
	}
	else if($妄想トリガー名 == "１７")
	{
		$妄想トリガー通過１７ = 1;
	}
	else if($妄想トリガー名 == "１８")
	{
		$妄想トリガー通過１８ = 1;
	}
	else if($妄想トリガー名 == "１９")
	{
		$妄想トリガー通過１９ = 1;
	}
	else if($妄想トリガー名 == "２０")
	{
		$妄想トリガー通過２０ = 1;
	}
	else if($妄想トリガー名 == "２１")
	{
		$妄想トリガー通過２１ = 1;
	}
	else if($妄想トリガー名 == "２２")
	{
		$妄想トリガー通過２２ = 1;
	}
	else if($妄想トリガー名 == "２３")
	{
		$妄想トリガー通過２３ = 1;
	}
	else if($妄想トリガー名 == "２４")
	{
		$妄想トリガー通過２４ = 1;
	}
	else if($妄想トリガー名 == "２５")
	{
		$妄想トリガー通過２５ = 1;
	}
	else if($妄想トリガー名 == "２６")
	{
		$妄想トリガー通過２６ = 1;
	}
	else if($妄想トリガー名 == "２７")
	{
		$妄想トリガー通過２７ = 1;
	}
	else if($妄想トリガー名 == "２８")
	{
		$妄想トリガー通過２８ = 1;
	}
	else if($妄想トリガー名 == "２９")
	{
		$妄想トリガー通過２９ = 1;
	}
	else if($妄想トリガー名 == "３０")
	{
		$妄想トリガー通過３０ = 1;
	}
	else if($妄想トリガー名 == "３１")
	{
		$妄想トリガー通過３１ = 1;
	}
	else if($妄想トリガー名 == "３２")
	{
		$妄想トリガー通過３２ = 1;
	}
	else if($妄想トリガー名 == "３３")
	{
		$妄想トリガー通過３３ = 1;
	}
	else if($妄想トリガー名 == "３４")
	{
		$妄想トリガー通過３４ = 1;
	}
	else if($妄想トリガー名 == "３５")
	{
		$妄想トリガー通過３５ = 1;
	}
	else if($妄想トリガー名 == "３６")
	{
		$妄想トリガー通過３６ = 1;
	}
	else if($妄想トリガー名 == "３７")
	{
		$妄想トリガー通過３７ = 1;
	}
	else if($妄想トリガー名 == "３８")
	{
		$妄想トリガー通過３８ = 1;
	}
	else if($妄想トリガー名 == "３９")
	{
		$妄想トリガー通過３９ = 1;
	}
	else if($妄想トリガー名 == "４０")
	{
		$妄想トリガー通過４０ = 1;
	}
	else if($妄想トリガー名 == "４１")
	{
		$妄想トリガー通過４１ = 1;
	}
	else if($妄想トリガー名 == "４２")
	{
		$妄想トリガー通過４２ = 1;
	}
	else if($妄想トリガー名 == "４３")
	{
		$妄想トリガー通過４３ = 1;
	}
	else if($妄想トリガー名 == "４４")
	{
		$妄想トリガー通過４４ = 1;
	}

	$妄想パターン=0;
	$zoom=2;

	//■トリガー影
	CreateTextureEX("トリガー影", 19100, Center, Middle, "cg/sys/trigger/妄想トリガー用_ビルマスク2.png");
	Request("トリガー影", Smoothing);
	SetAlias("トリガー影", "トリガー影");
	$TriggerZoom=3000*$zoom;
	Zoom("トリガー影", 0, $TriggerZoom, $TriggerZoom, null, true);
	Fade("トリガー影", 0, 1000, null, true);

	//■ノイズプロセス
	CreateProcess("トリガープロセス中", 19000, 0, 0, "TriggerCenter");
	SetAlias("トリガープロセス中", "トリガープロセス中");
	CreateProcess("トリガープロセス左", 19000, 0, 0, "TriggerLeft");
	SetAlias("トリガープロセス左", "トリガープロセス左");
	CreateProcess("トリガープロセス右", 19000, 0, 0, "TriggerRight");
	SetAlias("トリガープロセス右", "トリガープロセス右");

	//■トリガープロセス
	CreateProcess("トリガープロセス１", 19000, 0, 0, "ProcessTrigger");
	SetAlias("トリガープロセス１", "トリガープロセス１");

	//■共通
	CreateTexture("トリガースク", 19010, 0, 0, "cg/data/noize.png");
	SetAlias("トリガースク", "トリガースク");
	Fade("トリガースク", 0, 0, null, true);
	Request("トリガースク", MulRender);
	CreateProcess("トリガープロセス０", 19000, 0, 0, "ProcessNew");
	SetAlias("トリガープロセス０", "トリガープロセス０");

	//■ノイズプロセス
	CreateProcess("トリガープロセスノイズ", 19000, 0, 0, "ProcessNoise");
	SetAlias("トリガープロセスノイズ", "トリガープロセスノイズ");
	CreateTexture("トリガーノイズ", 19000, Center, Middle, "cg/sys/trigger/ノイズ.jpg");
	SetAlias("トリガーノイズ", "トリガーノイズ");
	Fade("トリガーノイズ", 0, 0, null, true);
	Zoom("トリガーノイズ", 0, 2000, 2000, null, true);
	Request("トリガーノイズ", MulRender);

	//■緑色
	CreateColor("トリガーみどり", 19100, Center, Middle, 16, 9, "#0d7a05");
	SetAlias("トリガーみどり", "トリガーみどり");
	Zoom("トリガーみどり", 0, 90000, 90000, null, false);
	Fade("トリガーみどり", 0, 0, null, true);
	Request("トリガーみどり", MulRender);
	CreateProcess("トリガープロセス２", 19000, 0, 0, "ProcessPosi");
	SetAlias("トリガープロセス２", "トリガープロセス２");

	//■赤色
	CreateColor("トリガーあか", 19100, Center, Middle, 16, 9, "#c20404");
	SetAlias("トリガーあか", "トリガーあか");
	Zoom("トリガーあか", 0, 90000, 90000, null, false);
	Fade("トリガーあか", 0, 0, null, true);
	Request("トリガーあか", MulRender);
	CreateProcess("トリガープロセス３", 19000, 0, 0, "ProcessNega");
	SetAlias("トリガープロセス３", "トリガープロセス３");

	//■トリガー緑
	CreateMovie("トリガー緑", 19000, Center, Middle, true, false, "dx/mvとりがー緑.avi");
	Zoom("トリガー緑", 0, 2010, 2010, null, false);
	SetAlias("トリガー緑", "トリガー緑");
	Fade("トリガー緑", 0, 0, null, true);
	Request("トリガー緑", MulRender);

	//■トリガー赤
	CreateMovie("トリガー赤", 19000, Center, Middle, true, false, "dx/mvとりがー赤.avi");
	Zoom("トリガー赤", 0, 2010, 2010, null, false);
	SetAlias("トリガー赤", "トリガー赤");
	Fade("トリガー赤", 0, 0, null, true);
	Request("トリガー赤", MulRender);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	//Fade("トリガー緑", 0, 1, null, false);
	//Fade("トリガー赤", 0, 1, null, true);
	//Fade("トリガー緑", 0, 0, null, false);
	//Fade("トリガー赤", 0, 0, null, true);

	//★描画
	$TriggerZoom1=870*$zoom;
	$TriggerZoom2=1000*$zoom;

	Zoom("トリガー影", 800, $TriggerZoom1, $TriggerZoom1, DxlAuto, false);
	Rotate("トリガー影", 1400, 0, 0, @530, DxlAuto, true);

	Request("トリガープロセスノイズ", Start);
	Fade("トリガーノイズ", 400, 400, null, false);
	Rotate("トリガー影", 400, 0, 0, @-270, Dxl2, false);
	Zoom("トリガー影", 400, $TriggerZoom2, $TriggerZoom2, Dxl2, true);

	$NoiseVolume=150;
	$NoiseVolume2=300;

	$TriggerOn=false;

	//MusicStart("サウンドＩＮ",3000,$NoiseVolume,0,1000,null,true);
	Request("サウンドＩＮ", Play);
	SetVolume("サウンドＩＮ", 3000, $NoiseVolume, null);

	$DeleteText = "box00/*";
	Delete($DeleteText);

	Request("トリガープロセス中", Start);
	Request("トリガープロセス１", Start);
	Request("トリガープロセス１", Disused);

	$SYSTEM_menu_lock = false;

	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
}


function ProcessTrigger()
{
	if(Platform()!=100){
		CreateChoice("選択肢１");
		SetAlias("選択肢１", "選択肢１");
		CreateTexture("選択肢１/MouseUsual/選択範囲１", 19000, 0, 0, "cg/sys/trigger/left-001.png");
		SetAlias("選択肢１/MouseUsual/選択範囲１", "選択肢１/MouseUsual/選択範囲１");

	//	CreateTexture("選択肢１/MouseOver/選択範囲２", 19000, 0, 0, "cg/sys/trigger/left-001.png");
	//	SetAlias("選択肢１/MouseOver/選択範囲２", "選択肢１/MouseUsual/選択範囲２");
	//	CreateTexture("選択肢１/MouseClick/選択範囲３", 19000, 0, 0, "cg/sys/trigger/left-001.png");
	//	SetAlias("選択肢１/MouseOver/選択範囲３", "選択肢１/MouseUsual/選択範囲３");
	//	CreateSound("選択肢１/MouseOver/効果音１", SE, "sound/se/se01.wav");
	//	CreateSound("選択肢１/MouseClick/効果音２", SE, "sound/se/se02.wav");
		Request("選択肢１/*/*", Erase);
	
		CreateChoice("選択肢２");
		SetAlias("選択肢２", "選択肢２");
		CreateTexture("選択肢２/MouseUsual/選択範囲１", 19000, 896, 0, "cg/sys/trigger/right-001.png");
		SetAlias("選択肢２/MouseUsual/選択範囲１", "選択肢２/MouseUsual/選択範囲１");
	//	CreateTexture("選択肢２/MouseOver/選択範囲２", 19000, 1120, 0, "cg/sys/trigger/right-001.png");
	//	SetAlias("選択肢２/MouseUsual/選択範囲２", "選択肢２/MouseUsual/選択範囲２");
	//	CreateTexture("選択肢２/MouseClick/選択範囲３", 19000, 1120, 0, "cg/sys/trigger/right-001.png");
	//	SetAlias("選択肢２/MouseUsual/選択範囲３", "選択肢２/MouseUsual/選択範囲３");
	//	CreateSound("選択肢２/MouseOver/効果音１", SE, "sound/se/se01.wav");
	//	CreateSound("選択肢２/MouseClick/効果音２", SE, "sound/se/se02.wav");
		Request("選択肢２/*/*", Erase);
	}

	begin:

	$ProcessTrigger_Flag=true;
	while($ProcessTrigger_Flag){
		if(Platform()==100){
		//◆360版
			select
			{
				if(XBOX360_PadTrigger(0)>0.3){
					$SYSTEM_skip=false;
					//TriggerPattern2();
					if($妄想パターン==0){
						$妄想パターン=2;
						Request("@トリガープロセス２", Start);
						Wait(500);
					}else if($妄想パターン==1){
						$前妄想パターン=1;
						$妄想パターン=0;
						Request("@トリガープロセス０", Start);
						WaitAction("@トリガープロセス０", null);
					}
					TriggerPatternWhile2();
					//break;
				}else if(XBOX360_PadTrigger(1)>0.3){
					$SYSTEM_skip=false;
					//TriggerPattern1();
					if($妄想パターン==0){
						$妄想パターン=1;
						Request("@トリガープロセス３", Start);
						Wait(500);
					}else if($妄想パターン==2){
						$前妄想パターン=2;
						$妄想パターン=0;
						Request("@トリガープロセス０", Start);
						WaitAction("@トリガープロセス０", null);
					}
					TriggerPatternWhile1();
					//break;
				}
				//Wait(16);
			}
		}else{
		//◆PC版
			select
			{
				case 選択肢１:
				{
					TriggerPattern2();
				}
				case 選択肢２:
				{
					TriggerPattern1();
				}
				Wait(32);
			}
		}
		Wait(16);
	}
}


function TriggerPatternWhile2()
{
	while(XBOX360_PadTrigger(0)>0.3&&$ProcessTrigger_Flag&&$妄想パターン==2){
//		$SYSTEM_skip=false;
		Wait(32);
	}
}

function TriggerPatternWhile1()
{
	while(XBOX360_PadTrigger(1)>0.3&&$ProcessTrigger_Flag&&$妄想パターン==1){
//		$SYSTEM_skip=false;
		Wait(32);
	}
}


//●ノーマル状態
function ProcessNoise()
{
	while(1){
		Move("@トリガーノイズ", 0, @0, 432, null, false);
		Wait(70);
		Move("@トリガーノイズ", 0, @0, -144, null, false);
		Wait(70);
		Move("@トリガーノイズ", 0, @0, -720, null, false);
		Wait(70);
	}
}




//●ポジティブトリガ選択
function TriggerPattern2()
{
	if($妄想パターン==0){
		$妄想パターン=2;
		Request("@トリガープロセス２", Start);
	}else if($妄想パターン==1){
		$前妄想パターン=1;
		$妄想パターン=0;
		Request("@トリガープロセス０", Start);
		WaitAction("@トリガープロセス０", null);
	}
}

//●ネガティブトリガ選択
function TriggerPattern1()
{
	if($妄想パターン==0){
		$妄想パターン=1;
		Request("@トリガープロセス３", Start);
	}else if($妄想パターン==2){
		$前妄想パターン=2;
		$妄想パターン=0;
		Request("@トリガープロセス０", Start);
		WaitAction("@トリガープロセス０", null);
	}
}


//●ノーマルパターン
function ProcessNew()
{
	begin:

		Request("@トリガープロセス２", Stop);
		Request("@トリガープロセス３", Stop);
		WaitAction("@トリガープロセス２", null);
		WaitAction("@トリガープロセス３", null);
		Request("@トリガープロセス右", Stop);
		Request("@トリガープロセス左", Stop);
//		WaitAction("@トリガープロセス右", null);
//		WaitAction("@トリガープロセス左", null);

		Wait(32);
		//MusicStart("@サウンドＯＦＦ",0,1000,0,1000,null,false);
			Request("@サウンドＯＦＦ", Play);
			SetVolume("@サウンドＯＦＦ", 0, 1000, null);
		Wait(32);
		SetVolume("@サウンドＩＮ", 0, $NoiseVolume, NULL);
		Request("@サウンドＯＮ", Stop);
		Request("@サウンド中", Stop);
		Request("@サウンド左", Stop);
		Request("@サウンド右", Stop);

	Fade("@トリガーノイズ", 0, 800, null, false);
	Fade("@トリガースク", 0, 1000, null, true);

		Rotate("@トリガー影", 0, @0, @0, @0, AxlDxl, false);
		Request("@トリガープロセス右", Stop);
		Request("@トリガープロセス左", Stop);

	//260
	if($前妄想パターン==2){
		Rotate("@トリガー影", 5000, @0, @0, @-10, AxlDxl, false);
	}else{
		Rotate("@トリガー影", 5000, @0, @0, @10, AxlDxl, false);
	}

		SetVolume("@サウンドＩＮ", 0, $NoiseVolume, NULL);

	Fade("@トリガーノイズ", 300, 400, null, false);
	Fade("@トリガー緑", 300, 0, null, false);
	Fade("@トリガーみどり", 300, 0, null, false);
	Fade("@トリガー赤", 300, 0, null, false);
	Fade("@トリガーあか", 300, 0, null, false);
	Fade("@トリガースク", 300, 0, null, true);

		SetVolume("@サウンドＩＮ", 0, $NoiseVolume, NULL);

		Request("@トリガープロセス右", Stop);
		Request("@トリガープロセス左", Stop);

		Request("@トリガープロセス中", Start);
}

function TriggerCenter()
{
	begin:

//	Request("@トリガープロセス２", Stop);
//	Request("@トリガープロセス３", Stop);
//	WaitAction("@トリガープロセス２", null);
//	WaitAction("@トリガープロセス３", null);
//	Request("@トリガープロセス右", Stop);
//	Request("@トリガープロセス左", Stop);
//	WaitAction("@トリガープロセス右", null);
//	WaitAction("@トリガープロセス左", null);

	WaitAction("@トリガー影", null);

	if($前妄想パターン==2){
		while(1)
		{
			Rotate("@トリガー影", 5000, @0, @0, @10, AxlDxl, true);
			Rotate("@トリガー影", 5000, @0, @0, @-10, AxlDxl, true);
		}
	}else{
		while(1)
		{
			Rotate("@トリガー影", 5000, @0, @0, @-10, AxlDxl, true);
			Rotate("@トリガー影", 5000, @0, @0, @10, AxlDxl, true);
		}
	}
}

//●ポジティブパターン
function ProcessPosi()
{
	begin:
	
		Fade("@トリガースク", 0, 0, null, false);
		Fade("@トリガーノイズ", 0, 400, null, false);

		Wait(32);
		//Rotate("@トリガー影", 0, @0, @0, @0, null, true);
		FadeFF4("@トリガー影", 200, 1000, 200, 0, 0, Dxl1, false);
		//MusicStart("@サウンドＯＮ",0,1000,0,1000,null,false);
			Request("@サウンドＯＮ", Play);
			SetVolume("@サウンドＯＮ", 0, 1000, null);
		Wait(32);
		//MusicStart("@サウンド中",1000,700,0,1000,null,true);
			Request("@サウンド中", Play);
			SetVolume("@サウンド中", 1000, 700, null);

			Request("@トリガープロセス３", Stop);
			WaitAction("@トリガープロセス３", null);
		Request("@トリガープロセス０", Stop);
		WaitAction("@トリガープロセス０", null);
			Request("@トリガープロセス右", Stop);
			WaitAction("@トリガープロセス右", null);
		Request("@トリガープロセス中", Stop);
		WaitAction("@トリガープロセス中", null);
		//Wait(100);
		Rotate("@トリガー影", 0, @0, @0, @0, null, true);

		//WaitAction("@トリガー影", null);

	DrawTransition("@トリガー緑", 3000, 0, 1000, 100, DxlAxl, "cg/data/right.png", false);
	Fade("@トリガー緑", 1000, 300, Dxl2, true);
	Wait(1800);

		Request("@トリガープロセス右", Stop);
		Request("@トリガープロセス中", Stop);
		//WaitAction("@トリガープロセス右", null);
		//WaitAction("@トリガープロセス中", null);

	Fade("@トリガーあか", 0, 0, null, false);
	Fade("@トリガー赤", 0, 0, null, false);
	Fade("@トリガーみどり", 0, 300, null, false);

	Rotate("@トリガー影", 0, 0, 0, @0, null, false);
	Fade("@トリガースク", 0, 1000, null, true);

		Request("@トリガープロセス左", Start);
		Wait(32);
		SetVolume("@サウンドＩＮ", 300, $NoiseVolume2, NULL);
		Wait(32);
		SetVolume("@サウンド中", 300, 0, NULL);
		Wait(32);
		//MusicStart("@サウンド左",300,800,0,1000,null,true);
			Request("@サウンド左", Play);
			SetVolume("@サウンド左", 300, 800, null);

	Fade("@トリガースク", 300, 0, null, false);
	Fade("@トリガー緑", 300, 500, null, true);
}

function TriggerLeft()
{
	begin:

//		Request("@トリガープロセス中", Stop);
//		WaitAction("@トリガープロセス中", null);
		Rotate("@トリガー影", 0, @0, @0, @0, null, true);

	while(1){
		Rotate("@トリガー影", 360000, 0, 0, @-3600, null, true);
	}
}

//●ネガティブパターン
function ProcessNega()
{
	begin:

		Fade("@トリガースク", 0, 0, null, false);
		Fade("@トリガーノイズ", 0, 400, null, false);

		Wait(32);
		//Rotate("@トリガー影", 0, @0, @0, @0, null, true);
		FadeFF4("@トリガー影", 200, 1000, 200, 0, 0, Dxl1, false);
		//MusicStart("@サウンドＯＮ",0,1000,0,1000,null,false);
			Request("@サウンドＯＮ", Play);
			SetVolume("@サウンドＯＮ", 0, 1000, null);
		Wait(32);
		//MusicStart("@サウンド中",1000,700,0,1000,null,true);
			Request("@サウンド中", Play);
			SetVolume("@サウンド中", 1000, 700, null);

			Request("@トリガープロセス２", Stop);
			WaitAction("@トリガープロセス２", null);
		Request("@トリガープロセス０", Stop);
		WaitAction("@トリガープロセス０", null);
			Request("@トリガープロセス左", Stop);
			WaitAction("@トリガープロセス左", null);
		Request("@トリガープロセス中", Stop);
		WaitAction("@トリガープロセス中", null);
		//Wait(100);
		Rotate("@トリガー影", 0, @0, @0, @0, null, true);

		//WaitAction("@トリガー影", null);

	DrawTransition("@トリガー赤", 3000, 0, 1000, 100, DxlAxl, "cg/data/left.png", false);
	Fade("@トリガー赤", 1000, 300, Dxl2, true);
	Wait(1800);

		Request("@トリガープロセス左", Stop);
		Request("@トリガープロセス中", Stop);
//		WaitAction("@トリガープロセス左", null);
//		WaitAction("@トリガープロセス中", null);

	Fade("@トリガーみどり", 0, 0, null, false);
	Fade("@トリガー緑", 0, 0, null, false);
	Fade("@トリガーあか", 0, 300, null, false);

	Rotate("@トリガー影", 0, 0, 0, @0, null, false);
	Fade("@トリガースク", 0, 1000, null, true);

		Request("@トリガープロセス右", Start);
		Wait(32);
		SetVolume("@サウンドＩＮ", 300, $NoiseVolume2, NULL);
		Wait(32);
		SetVolume("@サウンド中", 300, 0, NULL);
		Wait(32);
		//MusicStart("@サウンド右",300,800,0,1000,null,true);
			Request("@サウンド右", Play);
			SetVolume("@サウンド右", 300, 800, null);

	Fade("@トリガースク", 300, 0, null, false);
	Fade("@トリガー赤", 300, 500, null, true);
}

function TriggerRight()
{
	begin:

//		Request("@トリガープロセス中", Stop);
//		WaitAction("@トリガープロセス中", null);
		Rotate("@トリガー影", 0, @0, @0, @0, null, true);

	while(1){
		Rotate("@トリガー影", 360000, 0, 0, @3600, null, true);
	}
}



//★エンドトリガー
function EndTrigger()
{
	$ProcessTrigger_Flag=false;

	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
	$SYSTEM_menu_lock = true;

	Request("@トリガープロセス１", Stop);
	WaitAction("@トリガープロセス１", null);
	Delete("@トリガープロセス１");

	//★★★★ロック
	//XBOX360_LockVideo(true);
	TriggerCheck();
	//★★★★アンロック
	//XBOX360_LockVideo(false);

	if($妄想パターン==2){
		WaitAction("@トリガープロセス２", null);
	}else if($妄想パターン==1){
		WaitAction("@トリガープロセス３", null);
	}else{
		WaitAction("@トリガープロセス０", null);
	}

	Request("@トリガープロセス０", Stop);
	Request("@トリガープロセス２", Stop);
	Request("@トリガープロセス３", Stop);
	Delete("@トリガープロセス０");
	Delete("@トリガープロセス２");
	Delete("@トリガープロセス３");


	if($妄想パターン==2){
		Wait(32);
		SetVolume("@サウンド左", 800, 1000, NULL);
		Wait(32);
		SetVolume("@サウンドＩＮ", 800, 500, NULL);
		Wait(32);
	}else if($妄想パターン==1){
		Wait(32);
		SetVolume("@サウンド右", 800, 1000, NULL);
		Wait(32);
		SetVolume("@サウンドＩＮ", 800, 500, NULL);
		Wait(32);
	}

//	Request("@サウンド中", UnLock);
//	Request("@サウンド左", UnLock);
//	Request("@サウンド右", UnLock);
//	Request("@サウンドＩＮ", UnLock);
//	Request("@サウンドＯＮ", UnLock);
//	Request("@サウンドＯＦＦ", UnLock);

	$TriggerZoom1=870*$zoom;
	$TriggerZoom2=910*$zoom;
	$TriggerZoom3=880*$zoom;
	$TriggerZoom4=895*$zoom;
	$TriggerZoom5=890*$zoom;
	$TriggerZoom6=3000*$zoom;


	Zoom("@トリガー影", 500, $TriggerZoom1, $TriggerZoom1, Dxl3, false);
	Wait(500);
	Zoom("@トリガー影", 100, $TriggerZoom2, $TriggerZoom2, Dxl2, false);
	Wait(100);
	Zoom("@トリガー影", 100, $TriggerZoom3, $TriggerZoom3, Dxl2, false);
	Wait(100);
	Zoom("@トリガー影", 100, $TriggerZoom4, $TriggerZoom4, Dxl2, false);
	Wait(100);
	Zoom("@トリガー影", 100, $TriggerZoom5, $TriggerZoom5, Dxl2, false);
	Wait(100);


	if($妄想パターン==2){
		Request("@トリガープロセス左", Stop);
		SetVolume("@サウンドＩＮ", 2000, 0, NULL);
		SetVolume("@サウンド左", 2000, 0, NULL);

		Fade("@トリガー緑", 500, 800, null, false);
		Fade("@トリガーみどり", 500, 500, null, false);
		Rotate("@トリガー影", 1000, 0, 0, @-3600, Axl3, false);
		Zoom("@トリガー影", 1000, $TriggerZoom6, $TriggerZoom6, Axl2, 500);

		Fade("@トリガーノイズ", 500, 0, null, false);
		Fade("@トリガー緑", 500, 0, null, false);
		Fade("@トリガーみどり", 500, 0, null, true);

		Delete("@サウンド右");
	}else if($妄想パターン==1){
		Request("@トリガープロセス右", Stop);
		SetVolume("@サウンドＩＮ", 2000, 0, NULL);
		SetVolume("@サウンド右", 2000, 0, NULL);

		Fade("@トリガー赤", 500, 800, null, false);
		Fade("@トリガーあか", 500, 500, null, false);
		Rotate("@トリガー影", 1000, 0, 0, @3600, Axl3, false);
		Zoom("@トリガー影", 1000, $TriggerZoom6, $TriggerZoom6, Axl2, 500);

		Fade("@トリガーノイズ", 500, 0, null, false);
		Fade("@トリガー赤", 500, 0, null, false);
		Fade("@トリガーあか", 500, 0, null, true);

		Delete("@サウンド左");
	}else{
		Request("@トリガープロセス中", Stop);
		SetVolume("@サウンドＩＮ", 2000, 0, NULL);
//		Rotate("@トリガー影", 1000, 0, 0, @-3600, Axl3, false);
		Zoom("@トリガー影", 500, $TriggerZoom6, $TriggerZoom6, Axl2, false);
		Fade("@トリガーノイズ", 500, 0, null, true);

		Delete("@サウンド右");
		Delete("@サウンド左");
	}

	Request("@トリガープロセスノイズ", Stop);
	Delete("@トリガー*");

	Delete("@サウンド中");
	Delete("@サウンドＯＮ");
	Delete("@サウンドＯＦＦ");

	Request("@サウンド右", Disused);
	Request("@サウンド左", Disused);
	Request("@サウンドＩＮ", Disused);

	$SYSTEM_menu_lock = false;
	//$SYSTEM_skip_lock = false;

	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
}



function TriggerCheck()
{
	if($妄想トリガー名 == "１")
	{
		if($妄想パターン==2){$妄想トリガー１=2;}
		else if($妄想パターン==1){$妄想トリガー１=1;}
		else if($妄想パターン==0){$妄想トリガー１=0;}
	}
	else if($妄想トリガー名 == "２")
	{
		if($妄想パターン==2){$妄想トリガー２=2;}
		else if($妄想パターン==1){$妄想トリガー２=1;}
		else if($妄想パターン==0){$妄想トリガー２=0;}
	}
	else if($妄想トリガー名 == "３")
	{
		if($妄想パターン==2){$妄想トリガー３=2;}
		else if($妄想パターン==1){$妄想トリガー３=1;}
		else if($妄想パターン==0){$妄想トリガー３=0;}
	}
	else if($妄想トリガー名 == "４")
	{
		if($妄想パターン==2){$妄想トリガー４=2;}
		else if($妄想パターン==1){$妄想トリガー４=1;}
		else if($妄想パターン==0){$妄想トリガー４=0;}
	}
	else if($妄想トリガー名 == "５")
	{
		if($妄想パターン==2){$妄想トリガー５=2;}
		else if($妄想パターン==1){$妄想トリガー５=1;}
		else if($妄想パターン==0){$妄想トリガー５=0;}
	}
	else if($妄想トリガー名 == "６")
	{
		if($妄想パターン==2){$妄想トリガー６=2;}
		else if($妄想パターン==1){$妄想トリガー６=1;}
		else if($妄想パターン==0){$妄想トリガー６=0;}
	}
	else if($妄想トリガー名 == "７")
	{
		if($妄想パターン==2){$妄想トリガー７=2;}
		else if($妄想パターン==1){$妄想トリガー７=1;}
		else if($妄想パターン==0){$妄想トリガー７=0;}
	}
	else if($妄想トリガー名 == "８")
	{
		if($妄想パターン==2){$妄想トリガー８=2;}
		else if($妄想パターン==1){$妄想トリガー８=1;}
		else if($妄想パターン==0){$妄想トリガー８=0;}
	}
	else if($妄想トリガー名 == "９")
	{
		if($妄想パターン==2){$妄想トリガー９=2;}
		else if($妄想パターン==1){$妄想トリガー９=1;}
		else if($妄想パターン==0){$妄想トリガー９=0;}
	}
	else if($妄想トリガー名 == "１０")
	{
		if($妄想パターン==2){$妄想トリガー１０=2;}
		else if($妄想パターン==1){$妄想トリガー１０=1;}
		else if($妄想パターン==0){$妄想トリガー１０=0;}
	}
	else if($妄想トリガー名 == "１１")
	{
		if($妄想パターン==2){$妄想トリガー１１=2;}
		else if($妄想パターン==1){$妄想トリガー１１=1;}
		else if($妄想パターン==0){$妄想トリガー１１=0;}
	}
	else if($妄想トリガー名 == "１２")
	{
		if($妄想パターン==2){$妄想トリガー１２=2;}
		else if($妄想パターン==1){$妄想トリガー１２=1;}
		else if($妄想パターン==0){$妄想トリガー１２=0;}
	}
	else if($妄想トリガー名 == "１２Ａ")
	{
		if($妄想パターン==2){$妄想トリガー１２Ａ=2;}
		else if($妄想パターン==1){$妄想トリガー１２Ａ=1;}
		else if($妄想パターン==0){$妄想トリガー１２Ａ=0;}
	}
	else if($妄想トリガー名 == "１３")
	{
		if($妄想パターン==2){$妄想トリガー１３=2;}
		else if($妄想パターン==1){$妄想トリガー１３=1;}
		else if($妄想パターン==0){$妄想トリガー１３=0;}
	}
	else if($妄想トリガー名 == "１４")
	{
		if($妄想パターン==2){$妄想トリガー１４=2;}
		else if($妄想パターン==1){$妄想トリガー１４=1;}
		else if($妄想パターン==0){$妄想トリガー１４=0;}
	}
	else if($妄想トリガー名 == "１５")
	{
		if($妄想パターン==2){$妄想トリガー１５=2;}
		else if($妄想パターン==1){$妄想トリガー１５=1;}
		else if($妄想パターン==0){$妄想トリガー１５=0;}
	}
	else if($妄想トリガー名 == "１６")
	{
		if($妄想パターン==2){$妄想トリガー１６=2;}
		else if($妄想パターン==1){$妄想トリガー１６=1;}
		else if($妄想パターン==0){$妄想トリガー１６=0;}
	}
	else if($妄想トリガー名 == "１７")
	{
		if($妄想パターン==2){$妄想トリガー１７=2;}
		else if($妄想パターン==1){$妄想トリガー１７=1;}
		else if($妄想パターン==0){$妄想トリガー１７=0;}
	}
	else if($妄想トリガー名 == "１８")
	{
		if($妄想パターン==2){$妄想トリガー１８=2;}
		else if($妄想パターン==1){$妄想トリガー１８=1;}
		else if($妄想パターン==0){$妄想トリガー１８=0;}
	}
	else if($妄想トリガー名 == "１９")
	{
		if($妄想パターン==2){$妄想トリガー１９=2;}
		else if($妄想パターン==1){$妄想トリガー１９=1;}
		else if($妄想パターン==0){$妄想トリガー１９=0;}
	}
	else if($妄想トリガー名 == "２０")
	{
		if($妄想パターン==2){$妄想トリガー２０=2;}
		else if($妄想パターン==1){$妄想トリガー２０=1;}
		else if($妄想パターン==0){$妄想トリガー２０=0;}
	}
	else if($妄想トリガー名 == "２１")
	{
		if($妄想パターン==2){$妄想トリガー２１=2;}
		else if($妄想パターン==1){$妄想トリガー２１=1;}
		else if($妄想パターン==0){$妄想トリガー２１=0;}
	}
	else if($妄想トリガー名 == "２２")
	{
		if($妄想パターン==2){$妄想トリガー２２=2;}
		else if($妄想パターン==1){$妄想トリガー２２=1;}
		else if($妄想パターン==0){$妄想トリガー２２=0;}
	}
	else if($妄想トリガー名 == "２３")
	{
		if($妄想パターン==2){$妄想トリガー２３=2;}
		else if($妄想パターン==1){$妄想トリガー２３=1;}
		else if($妄想パターン==0){$妄想トリガー２３=0;}
	}
	else if($妄想トリガー名 == "２４")
	{
		if($妄想パターン==2){$妄想トリガー２４=2;}
		else if($妄想パターン==1){$妄想トリガー２４=1;}
		else if($妄想パターン==0){$妄想トリガー２４=0;}
	}
	else if($妄想トリガー名 == "２５")
	{
		if($妄想パターン==2){$妄想トリガー２５=2;}
		else if($妄想パターン==1){$妄想トリガー２５=1;}
		else if($妄想パターン==0){$妄想トリガー２５=0;}
	}
	else if($妄想トリガー名 == "２６")
	{
		if($妄想パターン==2){$妄想トリガー２６=2;}
		else if($妄想パターン==1){$妄想トリガー２６=1;}
		else if($妄想パターン==0){$妄想トリガー２６=0;}
	}
	else if($妄想トリガー名 == "２７")
	{
		if($妄想パターン==2){$妄想トリガー２７=2;}
		else if($妄想パターン==1){$妄想トリガー２７=1;}
		else if($妄想パターン==0){$妄想トリガー２７=0;}
	}
	else if($妄想トリガー名 == "２８")
	{
		if($妄想パターン==2){$妄想トリガー２８=2;}
		else if($妄想パターン==1){$妄想トリガー２８=1;}
		else if($妄想パターン==0){$妄想トリガー２８=0;}
	}
	else if($妄想トリガー名 == "２９")
	{
		if($妄想パターン==2){$妄想トリガー２９=2;}
		else if($妄想パターン==1){$妄想トリガー２９=1;}
		else if($妄想パターン==0){$妄想トリガー２９=0;}
	}
	else if($妄想トリガー名 == "３０")
	{
		if($妄想パターン==2){$妄想トリガー３０=2;}
		else if($妄想パターン==1){$妄想トリガー３０=1;}
		else if($妄想パターン==0){$妄想トリガー３０=0;}
	}
	else if($妄想トリガー名 == "３１")
	{
		if($妄想パターン==2){$妄想トリガー３１=2;}
		else if($妄想パターン==1){$妄想トリガー３１=1;}
		else if($妄想パターン==0){$妄想トリガー３１=0;}
	}
	else if($妄想トリガー名 == "３２")
	{
		if($妄想パターン==2){$妄想トリガー３２=2;}
		else if($妄想パターン==1){$妄想トリガー３２=1;}
		else if($妄想パターン==0){$妄想トリガー３２=0;}
	}
	else if($妄想トリガー名 == "３３")
	{
		if($妄想パターン==2){$妄想トリガー３３=2;}
		else if($妄想パターン==1){$妄想トリガー３３=1;}
		else if($妄想パターン==0){$妄想トリガー３３=0;}
	}
	else if($妄想トリガー名 == "３４")
	{
		if($妄想パターン==2){$妄想トリガー３４=2;}
		else if($妄想パターン==1){$妄想トリガー３４=1;}
		else if($妄想パターン==0){$妄想トリガー３４=0;}
	}
	else if($妄想トリガー名 == "３５")
	{
		if($妄想パターン==2){$妄想トリガー３５=2;}
		else if($妄想パターン==1){$妄想トリガー３５=1;}
		else if($妄想パターン==0){$妄想トリガー３５=0;}
	}
	else if($妄想トリガー名 == "３６")
	{
		if($妄想パターン==2){$妄想トリガー３６=2;}
		else if($妄想パターン==1){$妄想トリガー３６=1;}
		else if($妄想パターン==0){$妄想トリガー３６=0;}
	}
	else if($妄想トリガー名 == "３７")
	{
		if($妄想パターン==2){$妄想トリガー３７=2;}
		else if($妄想パターン==1){$妄想トリガー３７=1;}
		else if($妄想パターン==0){$妄想トリガー３７=0;}
	}
	else if($妄想トリガー名 == "３８")
	{
		if($妄想パターン==2){$妄想トリガー３８=2;}
		else if($妄想パターン==1){$妄想トリガー３８=1;}
		else if($妄想パターン==0){$妄想トリガー３８=0;}
	}
	else if($妄想トリガー名 == "３９")
	{
		if($妄想パターン==2){$妄想トリガー３９=2;}
		else if($妄想パターン==1){$妄想トリガー３９=1;}
		else if($妄想パターン==0){$妄想トリガー３９=0;}
	}
	else if($妄想トリガー名 == "４０")
	{
		if($妄想パターン==2){$妄想トリガー４０=2;}
		else if($妄想パターン==1){$妄想トリガー４０=1;}
		else if($妄想パターン==0){$妄想トリガー４０=0;}
	}
	else if($妄想トリガー名 == "４１")
	{
		if($妄想パターン==2){$妄想トリガー４１=2;}
		else if($妄想パターン==1){$妄想トリガー４１=1;}
		else if($妄想パターン==0){$妄想トリガー４１=0;}
	}
	else if($妄想トリガー名 == "４２")
	{
		if($妄想パターン==2){$妄想トリガー４２=2;}
		else if($妄想パターン==1){$妄想トリガー４２=1;}
		else if($妄想パターン==0){$妄想トリガー４２=0;}
	}
	else if($妄想トリガー名 == "４３")
	{
		if($妄想パターン==2){$妄想トリガー４３=2;}
		else if($妄想パターン==1){$妄想トリガー４３=1;}
		else if($妄想パターン==0){$妄想トリガー４３=0;}
	}
	else if($妄想トリガー名 == "４４")
	{
		if($妄想パターン==2){$妄想トリガー４４=2;}
		else if($妄想パターン==1){$妄想トリガー４４=1;}
		else if($妄想パターン==0){$妄想トリガー４４=0;}
	}
}





//======================================================================//
//■ＹＥＳ・ＮＯ選択肢２
//======================================================================//
// ＹＥＳ・ＮＯを表示
function StartWhich02()
{
	MoveCursor(0,0);
	$WhichBreak=true;

	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_backlog_lock = true;
	$SYSTEM_text_erase_lock = true;
	$SYSTEM_skip_lock = true;

	//★★★★ロック
	XBOX360_LockVideo(true);

	CreateTexture("セカイ背景", 10000, Center, Middle, "cg/sys/select2/back.png");
	Fade("セカイ背景", 0, 0, null, true);
	Request("セカイ背景", Smoothing);

	CreateTexture("セカイ背景２", 10000, Center, Middle, "cg/sys/select2/back02.png");
	Fade("セカイ背景２", 0, 0, null, true);
	Request("セカイ背景２", Smoothing);
	Request("セカイ背景２", AddRender);

	CreateTexture("セカイ背景３", 10000, Center, Middle, "cg/sys/select2/back03.png");
	Fade("セカイ背景３", 0, 0, null, true);
	Request("セカイ背景３", Smoothing);

	CreateTexture("セカイドア", 10000, 0, 0, "cg/sys/select2/yesno.png");
	Fade("セカイドア", 0, 0, null, true);
	Zoom("セカイドア", 0, 200, 200, null, true);
	SetAlias("セカイドア","セカイドア");
	Request("セカイドア", Smoothing);

	CreateTexture360("セカイ乗算", 10350, 0, 0, "cg/sys/select2/jyousan.png");
	Fade("セカイ乗算", 0, 0, null, true);
	SetAlias("セカイ乗算","セカイ乗算");
	Request("セカイ乗算", Smoothing);
	Request("セカイ乗算", AddRender);


	CreateChoice("選択肢１");
	SetAlias("選択肢１","選択肢１");

	CreateTexture("@選択肢１/MouseUsual/選択範囲１", 10100, 128, 80, "cg/sys/select2/room.png");
	CreateTexture("@選択肢１/MouseOver/選択範囲２", 10100, 0, 0, "cg/sys/select2/yes.png");
	CreateTexture("@選択肢１/MouseClick/選択範囲３", 10100, 0, 0, "cg/sys/select2/yes.png");
	Request("@選択肢１/MouseUsual/選択範囲１", Erase);
	Request("@選択肢１/選択肢０１", Erase);

	CreateChoice("選択肢２");
	SetAlias("選択肢２","選択肢２");

	CreateTexture("@選択肢２/MouseUsual/選択範囲１", 10100, 344, 80, "cg/sys/select2/room.png");
	CreateTexture("@選択肢２/MouseOver/選択範囲２", 10100, 0, 0, "cg/sys/select2/no.png");
	CreateTexture("@選択肢２/MouseClick/選択範囲３", 10100, 0, 0, "cg/sys/select2/no.png");
	Request("@選択肢２/MouseUsual/選択範囲１", Erase);
	Request("@選択肢２/選択肢０１", Erase);

	if(Platform()!=100){
		SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", UP);
		SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", DOWN);
		SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", LEFT);
		SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", RIGHT);
	
		SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", UP);
		SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", DOWN);
		SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", LEFT);
		SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", RIGHT);
	}

	Move("@選択肢*/*/*", 0, @192, @48, null, false);
	Fade("@選択肢*/*/*",0,0,null,true);

	CreateColor("セカイ色１", 15000, 0, 0, 1024, 576, "WHITE");
	Fade("セカイ色１", 0, 0, null, true);
	Request("セカイ色１", AddRender);

	CreateSE("セカイサウンド１","SE_擬音_YESNO選択_IN");
	CreateSE("サウンド１","SE_擬音_YESNO選択_クリック");
//	CreateSound("セカイサウンド１", SE, "sound/se/SE_擬音_YESNO選択_IN");
//	SetVolume("セカイサウンド１", 0, 1000, NULL);
//	CreateSound("サウンド１", SE, "sound/se/SE_擬音_YESNO選択_クリック");
//	SetVolume("サウンド１", 0, 1000, NULL);
	Request("セカイサウンド１", Lock);
	Request("サウンド１", Lock);


	if(Platform()==100){
		CreateMovie360("選択肢ムービー", 9999, Center, Middle, true, true, "dx/mv選択02.avi");
		Fade("選択肢ムービー", 0, 0, null, true);
		Zoom("選択肢ムービー", 0, 2000, 2000, null, true);
	}else{
		CreateMovie360("選択肢ムービー", 9999, Center, Middle, true, false, "dx/mv選択02.avi");
		Fade("選択肢ムービー", 0, 0, null, true);
	}

	//★★★★アンロック
	XBOX360_LockVideo(false);


	Move("セカイドア", 0, 192, 48, null, false);
	Fade("セカイ背景", 500, 700, null, false);
	Fade("セカイ背景２", 500, 400, null, true);

	Fade("セカイドア", 500, 600, null, true);

	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
//	$SYSTEM_backselect_lock = true;
}


function PreWhich02()
{
	MoveCursor(0,0);
	$WhichBreak=true;

//撤去
//	CreateTexture360("セカイ背景", 9500, 0, 0, "cg/sys/select2/back.png");
//	Request("セカイ背景", Smoothing);

//	CreateTexture("セカイ背景２", 10000, Center, Middle, "cg/sys/select2/back02.png");
//	Fade("セカイ背景２", 0, 0, null, true);
//	Request("セカイ背景２", Smoothing);
//	Request("セカイ背景２", AddRender);

//	CreateTexture("セカイ背景３", 10000, Center, Middle, "cg/sys/select2/back03.png");
//	Fade("セカイ背景３", 0, 0, null, true);
//	Request("セカイ背景３", Smoothing);

//	CreateTexture("セカイドア", 10000, 0, 0, "cg/sys/select2/yesno.png");
//	Zoom("セカイドア", 0, 1, 1, null, true);
//	SetAlias("セカイドア","セカイドア");
//	Request("セカイドア", Smoothing);

//■初期起動設定
	Zoom("セカイドア", 0, 1, 1, null, true);
	Move("セカイドア", 0, 192, 48, null, false);
	Fade("セカイドア", 0, 500, null, true);
	Fade("セカイ背景", 0, 700, null, true);
	Fade("セカイ背景２", 0, 400, null, true);
	Fade("セカイ色１", 0, 0, null, true);
	Fade("セカイ乗算", 0, 0, null, true);

	DrawTransition("世界スクリーン", 500, 1000, 0, 100, Axl2, "cg/data/zoom2.png", true);
	Delete("世界スクリーン");

	Zoom("セカイドア", 500, 200, 200, Dxl2, true);

	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
//	$SYSTEM_backselect_lock = true;
}





function FadeWhich02()
{
//撤去
//	CreateTexture360("セカイ乗算", 10350, 0, 0, "cg/sys/select2/jyousan.png");
//	Fade("セカイ乗算", 0, 0, null, true);
//	SetAlias("セカイ乗算","セカイ乗算");
//	Request("セカイ乗算", Smoothing);
//	Request("セカイ乗算", AddRender);

//	CreateSE("セカイサウンド１","SE_擬音_YESNO選択_IN");
	MusicStart("セカイサウンド１",1000,1000,0,1000,null,false);
//	SetVolume("セカイサウンド１", 0, 1000, NULL);
//	Request("セカイサウンド１", Play);

	Zoom("セカイドア", 800, 1000, 1000, AxlDxl, false);
	Fade("セカイドア", 800, 1000, null, false);
	Fade("セカイ乗算", 800, 500, null, true);
}



// ＹＥＳ・ＮＯを表示
function SetWhich02()
{
//撤去
//	CreateChoice("選択肢１");
//	SetAlias("選択肢１","選択肢１");

//	CreateTexture("@選択肢１/MouseUsual/選択範囲１", 10100, 160, 100, "cg/sys/select2/room.png");
//	CreateTexture("@選択肢１/MouseOver/選択範囲２", 10100, 0, 0, "cg/sys/select2/yes.png");
//	CreateTexture("@選択肢１/MouseClick/選択範囲３", 10100, 0, 0, "cg/sys/select2/yes.png");
//	Request("@選択肢１/MouseUsual/選択範囲１", Erase);
//	Request("@選択肢１/選択肢０１", Erase);

//	CreateChoice("選択肢２");
//	SetAlias("選択肢２","選択肢２");

//	CreateTexture("@選択肢２/MouseUsual/選択範囲１", 10100, 430, 100, "cg/sys/select2/room.png");
//	CreateTexture("@選択肢２/MouseOver/選択範囲２", 10100, 0, 0, "cg/sys/select2/no.png");
//	CreateTexture("@選択肢２/MouseClick/選択範囲３", 10100, 0, 0, "cg/sys/select2/no.png");
//	Request("@選択肢２/MouseUsual/選択範囲１", Erase);
//	Request("@選択肢２/選択肢０１", Erase);

//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", UP);
//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", DOWN);
//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", LEFT);
//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", RIGHT);

//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", UP);
//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", DOWN);
//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", LEFT);
//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", RIGHT);

//	Move("@選択肢*/*/*", 0, @240, @60, null, false);
//	Fade("@選択肢*/*/*",0,0,null,true);

	$SYSTEM_show_cursor = true;

//撤去
//	CreateMovie360("選択肢ムービー", 9999, Center, Middle, true, true, "dx/mv選択02.avi");
//	Fade("選択肢ムービー", 0, 0, null, true);
//	Zoom("選択肢ムービー", 0, 2000, 2000, null, true);

//	CreateMovie360("選択肢ムービー", 9999, Center, Middle, true, false, "dx/mv選択02.avi");
//	Fade("選択肢ムービー", 0, 0, null, true);

		Fade("セカイ乗算", 300, 150, null, false);
		Fade("セカイ背景", 300, 0, null, false);
		Fade("セカイ背景２", 300, 1000, null, false);
		Fade("セカイ背景３", 300, 500, null, false);
		Fade("選択肢ムービー", 300, 400, null, true);
}



function YES02()
{
	$WhichBreak=false;
	$CX=0;
	$CY=0;

//撤去
//	CreateSE("サウンド１","SE_擬音_YESNO選択_クリック");
	SoundPlay("サウンド１",0,1000,false);

	Fade("@box360",500,0,null,false);
	Fade("box00/*",500,0,null,false);
	Fade("@選択肢１/MouseOver/選択範囲２",0,0,null,false);
	Fade("@選択肢１/MouseClick/選択範囲３",500,0,null,true);

//撤去
//	CreateColor("セカイ色１", 15000, 0, 0, 1280, 720, "WHITE");
//	Request("セカイ色１", AddRender);
//	Fade("セカイ色１", 0, 0, null, true);

	Fade("セカイ背景", 300, 700, null, false);
	Fade("セカイ背景２", 300, 400, null, false);
	Fade("セカイ背景３", 300, 0, null, true);

	Fade("セカイ乗算", 1000, 1000, AxlAuto, false);
	Fade("セカイ色１", 1000, 1000, Axl3, false);
	Move("セカイドア", 1000, @880, @400, Axl2, false);
	Zoom("セカイドア", 1000, 8000, 8000, Axl2, true);

	Fade("選択肢ムービー", 0, 0, null, true);

	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture("世界スクリーン", 20550, 0, 0, "SCREEN");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	$テキストデータバックログ１ = "【YES】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ１, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

//撤去
//	Delete("box00/*");
//	Delete("@選択肢*");
//	Delete("選択肢*");
//	Delete("セカイ*");
}




function NO02()
{
	$WhichBreak=false;
	$CX=0;
	$CY=0;

//撤去
//	CreateSE("サウンド１","SE_擬音_YESNO選択_クリック");
	SoundPlay("サウンド１",0,1000,false);

	Fade("@box360",500,0,null,false);
	Fade("box00/*",500,0,null,false);
	Fade("@選択肢２/MouseOver/選択範囲２",0,0,null,false);
	Fade("@選択肢２/MouseClick/選択範囲３",500,0,null,true);

//撤去
//	CreateColor("セカイ色１", 15000, 0, 0, 1024, 576, "WHITE");
//	Request("セカイ色１", AddRender);
//	Fade("セカイ色１", 0, 0, null, true);

	Fade("セカイ背景", 300, 700, null, false);
	Fade("セカイ背景２", 300, 400, null, false);
	Fade("セカイ背景３", 300, 0, null, true);

	Fade("セカイ乗算", 1000, 1000, AxlAuto, false);
	Fade("セカイ色１", 1000, 1000, Axl3, false);
	Move("セカイドア", 1000, @-880, @400, Axl2, false);
	Zoom("セカイドア", 1000, 8000, 8000, Axl2, true);

	Fade("選択肢ムービー", 0, 0, null, true);

	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture("世界スクリーン", 20550, 0, 0, "SCREEN");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	$テキストデータバックログ１ = "【NO】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ１, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

//	Delete("box00/*");
//	Delete("@選択肢*");
//	Delete("選択肢*");
//	Delete("セカイ*");
}




function EndWhich02()
{
	Request("セカイサウンド１", UnLock);
	Request("サウンド１", UnLock);
	$WhichBreak=false;

	$CX=0;
	$CY=0;

	Delete("box00/*");
	Delete("@選択肢*");
	Delete("選択肢*");
	Delete("セカイ*");

	DrawTransition("世界スクリーン", 500, 1000, 0, 100, Axl2, "cg/data/zoom2.png", true);
	Delete("世界スクリーン");

	$SYSTEM_backlog_lock = 0;
	$SYSTEM_skip_lock=false;
	
	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
//	$SYSTEM_backselect_lock =false;
	$SYSTEM_show_cursor = false;
	$SYSTEM_text_erase_lock = false;
}





//======================================================================//
.//■ＹＥＳ・ＮＯ選択肢３（６章・キャラ別）
//======================================================================//
// ＹＥＳ・ＮＯを表示
function StartWhich03()
{
	MoveCursor(0,0);
	$door_Flag=true;
	$WhichBreak=true;

	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_backlog_lock = true;
	$SYSTEM_text_erase_lock = true;
	$SYSTEM_skip_lock = true;

	//★★★★ロック
	XBOX360_LockVideo(true);

	CreateTexture360("セカイ背景", 9500, 0, 0, "cg/sys/select/back.png");
	Fade("セカイ背景", 0, 0, null, false);
	Request("セカイ背景", Smoothing);

	CreateTexture("セカイドア", 10000, 320, 128, "cg/sys/select/yesno.png");
	Fade("セカイドア", 0, 0, null, false);
	Zoom("セカイドア", 0, 200, 200, null, false);
	SetAlias("セカイドア","セカイドア");
	Request("セカイドア", Smoothing);

		CreateTexture360("セカイ乗算", 10350, 0, 0, "cg/sys/select/jyousan.png");
		Fade("セカイ乗算", 0, 0, null, false);
		SetAlias("セカイ乗算","セカイ乗算");
		Request("セカイ乗算", Smoothing);
		Request("セカイ乗算", AddRender);

		CreateChoice("選択肢１");
		SetAlias("選択肢１","選択肢１");
		CreateTexture("@選択肢１/MouseUsual/選択範囲１", 10100, 320, 128, "cg/sys/select/room.png");
		CreateTexture("@選択肢１/MouseOver/選択範囲２", 10100, 320, 128, "cg/sys/select/yes.png");
		CreateTexture("@選択肢１/MouseClick/選択範囲３", 10100, 320, 128, "cg/sys/select/yes.png");
		Request("@選択肢１/MouseUsual/選択範囲１", Erase);
		CreateChoice("選択肢２");
		SetAlias("選択肢２","選択肢２");
		CreateTexture("@選択肢２/MouseUsual/選択範囲１", 10100, 536, 128, "cg/sys/select/room.png");
		CreateTexture("@選択肢２/MouseOver/選択範囲２", 10100, 536, 128, "cg/sys/select/no.png");
		CreateTexture("@選択肢２/MouseClick/選択範囲３", 10100, 536, 128, "cg/sys/select/no.png");
		Request("@選択肢２/MouseUsual/選択範囲１", Erase);
		Fade("@選択肢*/*/*",0,0,null,false);

		if(Platform()!=100){
			SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", UP);
			SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", DOWN);
			SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", LEFT);
			SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", RIGHT);
		
			SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", UP);
			SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", DOWN);
			SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", LEFT);
			SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", RIGHT);
		}

	$DoorSelectX1=315;
	$DoorSelectX2=531;
	$DoorSelectY=78;

	CreateTexture("選択肢１＿００", 10100, 320, 128, "cg/sys/select/yes000.png");
	CreateTexture("選択肢１＿０１", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes001.png");
	CreateTexture("選択肢１＿０２", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes002.png");
	CreateTexture("選択肢１＿０３", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes003.png");
	CreateTexture("選択肢１＿０４", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes004.png");
	CreateTexture("選択肢１＿０５", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes005.png");
	CreateTexture("選択肢１＿０６", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes006.png");
	CreateTexture("選択肢１＿０７", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes007.png");
	CreateTexture("選択肢１＿０８", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes008.png");
	CreateTexture("選択肢１＿０９", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes009.png");
	CreateTexture("選択肢１＿１０", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes010.png");
//	CreateTexture("選択肢１＿１１", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no000.png");
//	CreateTexture("選択肢１奥", 20550, 320, 128, "cg/sys/select/room.png");
	Request("選択肢１＿００", Smoothing);
	Request("選択肢１奥", Smoothing);
	Fade("選択肢１*",0,0,null,false);

	CreateTexture("選択肢２＿００", 10100, 536, 128, "cg/sys/select/no000.png");
	CreateTexture("選択肢２＿０１", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no001.png");
	CreateTexture("選択肢２＿０２", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no002.png");
	CreateTexture("選択肢２＿０３", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no003.png");
	CreateTexture("選択肢２＿０４", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no004.png");
	CreateTexture("選択肢２＿０５", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no005.png");
	CreateTexture("選択肢２＿０６", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no006.png");
	CreateTexture("選択肢２＿０７", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no007.png");
	CreateTexture("選択肢２＿０８", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no008.png");
	CreateTexture("選択肢２＿０９", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no009.png");
	CreateTexture("選択肢２＿１０", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no010.png");
//	CreateTexture("選択肢２＿１１", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes000.png");
//	CreateTexture("選択肢２奥", 20550, 536, 128, "cg/sys/select/room.png");
	Request("選択肢２＿００", Smoothing);
	Request("選択肢２奥", Smoothing);
	Fade("選択肢２*",0,0,null,false);

	CreateTexture("選択肢奥", 20550, 536, 128, "cg/sys/select/room.png");
	Fade("選択肢奥",0,0,null,true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	CreateSE("セカイサウンド１","SE_擬音_YESNO選択_IN");
	CreateSE("サウンド１","SE_擬音_YESNO選択_クリック");
	Request("セカイサウンド１", Lock);
	Request("サウンド１", Lock);

	Fade("セカイ背景", 500, 500, null, true);
	Fade("セカイドア", 500, 600, null, true);

	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
//	$SYSTEM_backselect_lock = true;
}


function PreWhich03()
{
	MoveCursor(0,0);
	$WhichBreak=true;

//撤去
//	CreateTexture360("セカイ背景", 10000, 0, 0, "cg/sys/select/back.png");
//	Request("セカイ背景", Smoothing);
//	CreateTexture("セカイドア", 10000, 160, 100, "cg/sys/select/yesno.png");
//	Zoom("セカイドア", 0, 1, 1, null, true);
//	SetAlias("セカイドア","セカイドア");
//	Request("セカイドア", Smoothing);


//■初期起動設定
	//★★★★ロック
	XBOX360_LockVideo(true);

	Fade("セカイ乗算", 0, 0, null, true);
	Fade("セカイ背景", 0, 500, null, true);
	Fade("セカイドア", 0, 600, null, true);

	Zoom("セカイ乗算", 0, 1000, 1000, null, false);
	Zoom("セカイ背景", 0, 1000, 1000, null, false);
	Zoom("セカイドア", 0, 1, 1, null, true);
	Move("セカイドア", 0, 320, 128, null, false);

	Zoom("選択肢１＿００", 0, 1000, 1000, null, false);
	Zoom("選択肢２＿００", 0, 1000, 1000, null, false);
	Zoom("選択肢奥", 0, 1000, 1000, null, true);

	Move("選択肢１＿*", 0, $DoorSelectX1, $DoorSelectY, null, false);
	Fade("選択肢１＿*",0,0,null,false);
	Move("選択肢２＿*", 0, $DoorSelectX2, $DoorSelectY, null, false);
	Fade("選択肢２＿*",0,0,null,false);
	Fade("選択肢奥",0,0,null,true);

	Move("選択肢１＿００", 0, 320, 128, null, false);
	Move("選択肢２＿００", 0, 536, 128, null, false);

	Fade("@選択肢*/*/*",0,0,null,true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	DrawTransition("世界スクリーン", 500, 1000, 0, 100, Axl2, "cg/data/zoom2.png", true);
	Delete("世界スクリーン");

	Zoom("セカイドア", 500, 200, 200, Dxl2, true);

	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
//	$SYSTEM_backselect_lock = true;
}


function FadeWhich03()
{
	if($door_Flag){
		//★★★★ロック
		XBOX360_LockVideo(false);
		$door_Flag=false;

		CreateMovie360("選択肢ムービー", 10100, Center, Middle, true, false, "dx/mv選択01.avi");
		Fade("選択肢ムービー", 0, 0, null, true);
		Request("選択肢ムービー", AddRender);

		//★★★★アンロック
		XBOX360_LockVideo(false);
	}

//撤去
//	CreateTexture360("セカイ乗算", 10350, 0, 0, "cg/sys/select/jyousan.png");
//	Fade("セカイ乗算", 0, 0, null, true);
//	SetAlias("セカイ乗算","セカイ乗算");
//	Request("セカイ乗算", Smoothing);
//	Request("セカイ乗算", AddRender);

//	CreateSE("セカイサウンド１","SE_擬音_YESNO選択_IN");

	MusicStart("セカイサウンド１",1000,1000,0,1000,null,false);

	Zoom("セカイドア", 1000, 1000, 1000, AxlDxl, false);
	Fade("セカイドア", 1000, 1000, null, false);
	Fade("セカイ乗算", 1000, 500, null, true);
}


// ＹＥＳ・ＮＯを表示
function SetWhich03()
{
	if(Platform()==100){
		$fadetime=20;
		$fadetime2=10;
		$waittime=10;
	}else{
		$fadetime=30;
		$fadetime2=30;
		$waittime=30;
	}

//撤去
//	CreateChoice("選択肢１");
//	SetAlias("選択肢１","選択肢１");
//	CreateTexture("@選択肢１/MouseUsual/選択範囲１", 10100, 160, 100, "cg/sys/select/room.png");
//	CreateTexture("@選択肢１/MouseOver/選択範囲２", 10100, 160, 100, "cg/sys/select/yes.png");
//	CreateTexture("@選択肢１/MouseClick/選択範囲３", 10100, 160, 100, "cg/sys/select/yes.png");
//	Request("@選択肢１/MouseUsual/選択範囲１", Erase);

//	CreateChoice("選択肢２");
//	SetAlias("選択肢２","選択肢２");
//	CreateTexture("@選択肢２/MouseUsual/選択範囲１", 10100, 430, 100, "cg/sys/select/room.png");
//	CreateTexture("@選択肢２/MouseOver/選択範囲２", 10100, 430, 100, "cg/sys/select/no.png");
//	CreateTexture("@選択肢２/MouseClick/選択範囲３", 10100, 430, 100, "cg/sys/select/no.png");
//	Request("@選択肢２/MouseUsual/選択範囲１", Erase);


//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", UP);
//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", DOWN);
//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", LEFT);
//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", RIGHT);

//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", UP);
//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", DOWN);
//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", LEFT);
//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", RIGHT);

//	Move("@選択肢*/*/*", 0, @240, @60, null, false);
//	Fade("@選択肢*/*/*",0,0,null,true);

	$SYSTEM_show_cursor = true;

//撤去
//	CreateMovie360("選択肢ムービー", 10100, Center, Middle, true, false, "dx/mv選択01.ngs");
//	Fade("選択肢ムービー", 0, 0, null, true);
//	Request("選択肢ムービー", AddRender);

	Fade("セカイ乗算", 300, 0, null, false);
	Fade("選択肢ムービー", 300, 400, null, true);
}


function YES03()
{
	$WhichBreak=false;
	$CX=0;
	$CY=0;

//撤去
//	CreateTexture("選択肢１＿００", 10100, 130, 0, "cg/sys/select/yes000.png");
//	CreateTexture("選択肢１＿０１", 10100, 130, 0, "cg/sys/select/yes001.png");
//	CreateTexture("選択肢１＿０２", 10100, 130, 0, "cg/sys/select/yes002.png");
//	CreateTexture("選択肢１＿０３", 10100, 130, 0, "cg/sys/select/yes003.png");
//	CreateTexture("選択肢１＿０４", 10100, 130, 0, "cg/sys/select/yes004.png");
//	CreateTexture("選択肢１＿０５", 10100, 130, 0, "cg/sys/select/yes005.png");
//	CreateTexture("選択肢１＿０６", 10100, 130, 0, "cg/sys/select/yes006.png");
//	CreateTexture("選択肢１＿０７", 10100, 130, 0, "cg/sys/select/yes007.png");
//	CreateTexture("選択肢１＿０８", 10100, 130, 0, "cg/sys/select/yes008.png");
//	CreateTexture("選択肢１＿０９", 10100, 130, 0, "cg/sys/select/yes009.png");
//	CreateTexture("選択肢１＿１０", 10100, 130, 0, "cg/sys/select/yes010.png");
//	CreateTexture("選択肢１＿１１", 10100, 400, 0, "cg/sys/select/no000.png");
//	CreateTexture("選択肢１奥", 20550, 160, 100, "cg/sys/select/room.png");
//	Request("選択肢１＿１１", Smoothing);
//	Request("選択肢１奥", Smoothing);

//	Move("選択肢１奥", 0, @240, @60, null, false);
//	Move("選択肢１＿*", 0, @240, @60, null, false);

//	Fade("選択肢１＿*",0,0,null,false);
//	Fade("選択肢１奥",0,0,null,true);

	Move("選択肢奥", 0, 320, 128, null, true);

	Fade("セカイ乗算", 500, 500, null, false);
	Fade("選択肢ムービー", 500, 0, null, false);
	Fade("@box360",500,0,null,false);

	Fade("box00/*",500,0,null,false);
	Fade("@選択肢１/MouseOver/選択範囲２",0,0,null,false);
	Fade("@選択肢１/MouseClick/選択範囲３",500,0,null,true);

//撤去
//	CreateSE("サウンド１","SE_擬音_YESNO選択_クリック");
	SoundPlay("サウンド１",0,1000,false);



	Fade("選択肢１＿００",0,1000,null,false);
	Fade("選択肢２＿００",0,1000,null,true);
	Fade("セカイドア",0,0,null,true);

	Fade("選択肢１＿０１",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿００",$fadetime2,0,null,false);
	Fade("選択肢１＿０２",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０１",$fadetime2,0,null,false);
	Fade("選択肢１＿０３",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０２",$fadetime2,0,null,false);
	Fade("選択肢１＿０４",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０３",$fadetime2,0,null,false);
	Fade("選択肢１＿０５",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０４",$fadetime2,0,null,false);
	Fade("選択肢１＿０６",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０５",$fadetime2,0,null,false);
	Fade("選択肢１＿０７",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０６",$fadetime2,0,null,false);
	Fade("選択肢１＿０８",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０７",$fadetime2,0,null,false);
	Fade("選択肢１＿０９",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０８",$fadetime2,0,null,false);
	Fade("選択肢１＿１０",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０９",$fadetime2,0,null,false);

	Fade("セカイ背景", 600, 1000, null, false);
	Fade("選択肢奥",300,1000,null,300);
	Fade("選択肢１＿１０",300,0,null,300);

	Zoom("セカイ乗算", 1000, 2000, 2000, Axl2, false);
	Zoom("セカイ背景", 1000, 2000, 2000, Axl2, false);
	Move("選択肢２＿００", 1000, @1600, @208, Axl2, false);
	Zoom("選択肢２＿００", 1000, 7000, 7000, Axl2, false);
	Move("選択肢奥", 1000, @144, @192, Axl2, false);
	Zoom("選択肢奥", 1000, 7000, 7000, Axl2, true);

	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture("世界スクリーン", 20550, 0, 0, "SCREEN");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	$テキストデータバックログ１ = "【YES】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ１, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

//	Delete("box00/*");
//	Delete("@選択肢*");
//	Delete("選択肢*");
//	Delete("セカイ*");
}




function NO03()
{
	$WhichBreak=false;
	$CX=0;
	$CY=0;

//撤去
//	CreateTexture("選択肢２＿００", 10100, 400, 0, "cg/sys/select/no000.png");
//	CreateTexture("選択肢２＿０１", 10100, 400, 0, "cg/sys/select/no001.png");
//	CreateTexture("選択肢２＿０２", 10100, 400, 0, "cg/sys/select/no002.png");
//	CreateTexture("選択肢２＿０３", 10100, 400, 0, "cg/sys/select/no003.png");
//	CreateTexture("選択肢２＿０４", 10100, 400, 0, "cg/sys/select/no004.png");
//	CreateTexture("選択肢２＿０５", 10100, 400, 0, "cg/sys/select/no005.png");
//	CreateTexture("選択肢２＿０６", 10100, 400, 0, "cg/sys/select/no006.png");
//	CreateTexture("選択肢２＿０７", 10100, 400, 0, "cg/sys/select/no007.png");
//	CreateTexture("選択肢２＿０８", 10100, 400, 0, "cg/sys/select/no008.png");
//	CreateTexture("選択肢２＿０９", 10100, 400, 0, "cg/sys/select/no009.png");
//	CreateTexture("選択肢２＿１０", 10100, 400, 0, "cg/sys/select/no010.png");
//	CreateTexture("選択肢２＿１１", 10100, 130, 0, "cg/sys/select/yes000.png");
//	CreateTexture("選択肢２奥", 20550, 430, 100, "cg/sys/select/room.png");
//	Request("選択肢２＿１１", Smoothing);
//	Request("選択肢２奥", Smoothing);

//	Move("選択肢２＿*", 0, @240, @60, null, false);
//	Move("選択肢２奥", 0, @240, @60, null, false);
//	Fade("選択肢２＿*",0,0,null,false);
//	Fade("選択肢２奥",0,0,null,true);

	Move("選択肢奥", 0, 536, 128, null, true);

	Fade("セカイ乗算", 500, 500, null, false);
	Fade("選択肢ムービー", 500, 0, null, false);
	Fade("@box360",500,0,null,false);

	Fade("box00/*",500,0,null,false);
	Fade("@選択肢２/MouseOver/選択範囲２",0,0,null,false);
	Fade("@選択肢２/MouseClick/選択範囲３",500,0,null,true);

//撤去
//	CreateSE("サウンド１","SE_擬音_YESNO選択_クリック");
	SoundPlay("サウンド１",0,1000,false);

	Fade("選択肢２＿００",0,1000,null,false);
	Fade("選択肢１＿００",0,1000,null,true);
	Fade("セカイドア",0,0,null,true);

	Fade("選択肢２＿０１",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿００",$fadetime2,0,null,false);
	Fade("選択肢２＿０２",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０１",$fadetime2,0,null,false);
	Fade("選択肢２＿０３",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０２",$fadetime2,0,null,false);
	Fade("選択肢２＿０４",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０３",$fadetime2,0,null,false);
	Fade("選択肢２＿０５",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０４",$fadetime2,0,null,false);
	Fade("選択肢２＿０６",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０５",$fadetime2,0,null,false);
	Fade("選択肢２＿０７",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０６",$fadetime2,0,null,false);
	Fade("選択肢２＿０８",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０７",$fadetime2,0,null,false);
	Fade("選択肢２＿０９",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０８",$fadetime2,0,null,false);
	Fade("選択肢２＿１０",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０９",$fadetime2,0,null,false);


	Fade("セカイ背景", 600, 1000, null, false);
	Fade("選択肢奥",300,1000,null,300);
	Fade("選択肢２＿１０",300,0,null,300);

	Zoom("セカイ乗算", 1000, 2000, 2000, Axl2, false);
	Zoom("セカイ背景", 1000, 2000, 2000, Axl2, false);
	Move("選択肢１＿００", 1000, @-1760, @208, Axl2, false);
	Zoom("選択肢１＿００", 1000, 7000, 7000, Axl2, false);
	Move("選択肢奥", 1000, @-160, @192, Axl2, false);
	Zoom("選択肢奥", 1000, 7000, 7000, Axl2, true);

	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture("世界スクリーン", 20550, 0, 0, "SCREEN");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	$テキストデータバックログ１ = "【NO】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ１, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

//	Delete("box00/*");
//	Delete("@選択肢*");
//	Delete("選択肢*");
//	Delete("セカイ*");
}


function EndWhich03()
{
	Request("セカイサウンド１", UnLock);
	Request("サウンド１", UnLock);
	$WhichBreak=false;

	$CX=0;
	$CY=0;

	Delete("box00/*");
	Delete("@選択肢*");
	Delete("選択肢*");
	Delete("セカイ*");

	DrawTransition("世界スクリーン", 500, 1000, 0, 100, Axl2, "cg/data/zoom2.png", true);
	Delete("世界スクリーン");

	$SYSTEM_backlog_lock = 0;
	$SYSTEM_skip_lock=false;
	
	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
//	$SYSTEM_backselect_lock =false;
	$SYSTEM_show_cursor = false;
	$SYSTEM_text_erase_lock = false;
}





























//======================================================================//
.//■ＹＥＳ・ＮＯ選択肢１（ラストのみ）
//======================================================================//
// ＹＥＳ・ＮＯを表示
function StartWhich()
{
	MoveCursor(0,0);
	$door_Flag=true;
	$WhichBreak=true;

	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_backlog_lock = true;
	$SYSTEM_text_erase_lock = true;
	$SYSTEM_skip_lock = true;

	//★★★★ロック
	XBOX360_LockVideo(true);

	CreateTexture360("セカイ背景", 9500, 0, 0, "cg/sys/select/back.png");
	Fade("セカイ背景", 0, 0, null, false);
	Request("セカイ背景", Smoothing);

	CreateTexture("セカイドア", 10000, 320, 128, "cg/sys/select/yesno.png");
	Fade("セカイドア", 0, 0, null, false);
	Zoom("セカイドア", 0, 200, 200, null, false);
	SetAlias("セカイドア","セカイドア");
	Request("セカイドア", Smoothing);

		CreateTexture360("セカイ乗算", 10350, 0, 0, "cg/sys/select/jyousan.png");
		Fade("セカイ乗算", 0, 0, null, false);
		SetAlias("セカイ乗算","セカイ乗算");
		Request("セカイ乗算", Smoothing);
		Request("セカイ乗算", AddRender);

		CreateChoice("選択肢１");
		SetAlias("選択肢１","選択肢１");
		CreateTexture("@選択肢１/MouseUsual/選択範囲１", 10100, 320, 128, "cg/sys/select/room.png");
		CreateTexture("@選択肢１/MouseOver/選択範囲２", 10100, 320, 128, "cg/sys/select/yes.png");
		CreateTexture("@選択肢１/MouseClick/選択範囲３", 10100, 320, 128, "cg/sys/select/yes.png");
		Request("@選択肢１/MouseUsual/選択範囲１", Erase);
		CreateChoice("選択肢２");
		SetAlias("選択肢２","選択肢２");
		CreateTexture("@選択肢２/MouseUsual/選択範囲１", 10100, 536, 128, "cg/sys/select/room.png");
		CreateTexture("@選択肢２/MouseOver/選択範囲２", 10100, 536, 128, "cg/sys/select/no.png");
		CreateTexture("@選択肢２/MouseClick/選択範囲３", 10100, 536, 128, "cg/sys/select/no.png");
		Request("@選択肢２/MouseUsual/選択範囲１", Erase);
		Fade("@選択肢*/*/*",0,0,null,false);

		if(Platform()!=100){
			SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", UP);
			SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", DOWN);
			SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", LEFT);
			SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", RIGHT);
		
			SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", UP);
			SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", DOWN);
			SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", LEFT);
			SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", RIGHT);
		}

	$DoorSelectX1=315;
	$DoorSelectX2=531;
	$DoorSelectY=78;

	CreateColor("セカイ色１", 15000, 0, 0, 1280, 720, "WHITE");
	Fade("セカイ色１", 0, 0, null, false);
	Request("セカイ色１", AddRender);

	CreateTexture("選択肢手前", 10100, 320, 128, "cg/sys/select/yes100.png");
	Fade("選択肢手前",0,0,null,false);

	CreateWindow("セカイウィンドウ１", 10100, 320, 128, 168, 256, false);
	CreateTexture("セカイウィンドウ１/選択肢１奥", 10100, 0, -96, "cg/bg/bg113_01_6_海と青い空_a.jpg");
	Zoom("セカイウィンドウ１/選択肢１奥", 0, 500, 500, null, false);
	Fade("セカイウィンドウ１/選択肢１奥", 0, 0, null, false);
	Request("セカイウィンドウ１/選択肢１奥", Smoothing);

	CreateTexture("選択肢１＿００", 10100, 320, 128, "cg/sys/select/yes000.png");
	CreateTexture("選択肢１＿０１", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes101.png");
	CreateTexture("選択肢１＿０２", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes102.png");
	CreateTexture("選択肢１＿０３", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes103.png");
	CreateTexture("選択肢１＿０４", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes104.png");
	CreateTexture("選択肢１＿０５", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes105.png");
	CreateTexture("選択肢１＿０６", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes106.png");
	CreateTexture("選択肢１＿０７", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes107.png");
	CreateTexture("選択肢１＿０８", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes108.png");
	CreateTexture("選択肢１＿０９", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes109.png");
	CreateTexture("選択肢１＿１０", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes110.png");
//	CreateTexture("選択肢１＿１１", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no000.png");
//	CreateTexture("選択肢１奥", 20550, 400, 160, "cg/sys/select/room.png");
	Request("選択肢１＿００", Smoothing);
//	Request("選択肢１奥", Smoothing);

	CreateTexture("選択肢２＿００", 10100, 536, 128, "cg/sys/select/no000.png");
	CreateTexture("選択肢２＿０１", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no001.png");
	CreateTexture("選択肢２＿０２", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no002.png");
	CreateTexture("選択肢２＿０３", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no003.png");
	CreateTexture("選択肢２＿０４", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no004.png");
	CreateTexture("選択肢２＿０５", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no005.png");
	CreateTexture("選択肢２＿０６", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no006.png");
	CreateTexture("選択肢２＿０７", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no007.png");
	CreateTexture("選択肢２＿０８", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no008.png");
	CreateTexture("選択肢２＿０９", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no009.png");
	CreateTexture("選択肢２＿１０", 10100, $DoorSelectX2, $DoorSelectY, "cg/sys/select/no010.png");
//	CreateTexture("選択肢２＿１１", 10100, $DoorSelectX1, $DoorSelectY, "cg/sys/select/yes000.png");
//	CreateTexture("選択肢２奥", 20550, 670, 160, "cg/sys/select/room.png");
	Request("選択肢２＿００", Smoothing);
//	Request("選択肢２奥", Smoothing);

	Fade("選択肢*",0,0,null,false);

	CreateTexture("選択肢奥", 20550, 320, 128, "cg/sys/select/room.png");
	Fade("選択肢奥",0,0,null,true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	CreateSE("セカイサウンド１","SE_擬音_YESNO選択_IN");
	CreateSE("サウンド１","SE_擬音_YESNO選択_クリック");
	Request("セカイサウンド１", Lock);
	Request("サウンド１", Lock);

	Fade("セカイ背景", 500, 500, null, true);
	Fade("セカイドア", 500, 1000, null, true);


	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
//	$SYSTEM_backselect_lock = true;
}


function PreWhich()
{
	MoveCursor(0,0);
	$WhichBreak=true;

//撤去
//	CreateTexture360("セカイ背景", 9500, 0, -130, "cg/sys/select/back.png");
//	Request("セカイ背景", Smoothing);
//	CreateTexture("セカイドア", 10000, 160, 70, "cg/sys/select/yesno.png");
//	Zoom("セカイドア", 0, 200, 200, null, true);
//	SetAlias("セカイドア","セカイドア");
//	Request("セカイドア", Smoothing);

//■初期起動設定
	//★★★★ロック
	XBOX360_LockVideo(true);

	Fade("セカイ色１", 0, 0, null, false);

	Fade("選択肢手前",0,0,null,false);

	Fade("セカイドア", 0, 500, null, false);
	Zoom("セカイドア", 0, 200, 200, null, false);
	Move("セカイドア", 0, 320, 104, null, false);

	Fade("セカイ背景", 0, 500, null, false);
	Zoom("セカイ背景", 0, 1000, 1000, null, false);
	Move("セカイ背景", 0, 0, -104, null, false);

	Fade("セカイ乗算", 0, 0, null, false);
	Zoom("セカイ乗算", 0, 1000, 1000, null, false);

	Zoom("選択肢１＿００", 0, 1000, 1000, null, false);
	Zoom("選択肢２＿００", 0, 1000, 1000, null, false);
	Zoom("選択肢奥", 0, 1000, 1000, null, true);

	Move("選択肢１＿*", 0, $DoorSelectX1, $DoorSelectY, null, false);
	Fade("選択肢１＿*",0,0,null,false);
	Move("選択肢２＿*", 0, $DoorSelectX2, $DoorSelectY, null, false);
	Fade("選択肢２＿*",0,0,null,false);
	Fade("選択肢奥",0,0,null,true);

	Move("選択肢１＿００", 0, 320, 128, null, false);
	Move("選択肢２＿００", 0, 536, 128, null, false);
	Fade("@選択肢*/*/*",0,0,null,true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Move("セカイ背景", 1000, @0, @104, Dxl2, false);
	Move("セカイドア", 1000, @0, @24, Dxl2, false);

	DrawTransition("世界スクリーン", 500, 1000, 0, 100, Axl2, "cg/data/zoom2.png", true);
	Delete("世界スクリーン");

	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
//	$SYSTEM_backselect_lock = true;
}



function FadeWhich()
{
	if($door_Flag){
		//★★★★ロック
		XBOX360_LockVideo(false);
		$door_Flag=false;

		CreateMovie360("選択肢ムービー", 10100, Center, Middle, true, false, "dx/mv選択01.avi");
		Fade("選択肢ムービー", 0, 0, null, true);
		Request("選択肢ムービー", AddRender);

		//★★★★アンロック
		XBOX360_LockVideo(false);
	}

	if($parson){
		Fade("七海", 1000, 0, null, false);
		Fade("優愛", 1000, 0, null, false);
		Fade("あやせ", 1000, 0, null, false);
		Fade("梢", 1000, 0, null, false);
		Fade("セナ", 1000, 0, null, false);
		Fade("梨深", 1000, 0, null, false);
	}

//撤去
//	CreateTexture360("セカイ乗算", 10350, 0, 0, "cg/sys/select/jyousan.png");
//	Fade("セカイ乗算", 0, 0, null, true);
//	SetAlias("セカイ乗算","セカイ乗算");
//	Request("セカイ乗算", Smoothing);
//	Request("セカイ乗算", AddRender);

//	CreateSE("セカイサウンド１","SE_擬音_YESNO選択_IN");
	MusicStart("セカイサウンド１",1000,1000,0,1000,null,false);

	Fade("セカイドア", 1000, 1000, null, false);
	Zoom("セカイドア", 1000, 1000, 1000, AxlDxl, false);
	Fade("セカイ乗算", 1000, 500, null, true);
}


// ＹＥＳ・ＮＯを表示
function SetWhich()
{
	if(Platform()==100){
		$fadetime=20;
		$fadetime2=10;
		$waittime=10;
	}else{
		$fadetime=30;
		$fadetime2=30;
		$waittime=30;
	}

//撤去
//	CreateChoice("選択肢１");
//	SetAlias("選択肢１","選択肢１");
//	CreateTexture("@選択肢１/MouseUsual/選択範囲１", 10100, 160, 100, "cg/sys/select/room.png");
//	CreateTexture("@選択肢１/MouseOver/選択範囲２", 10100, 160, 100, "cg/sys/select/yes.png");
//	CreateTexture("@選択肢１/MouseClick/選択範囲３", 10100, 160, 100, "cg/sys/select/yes.png");
//	Request("@選択肢１/MouseUsual/選択範囲１", Erase);

//	CreateChoice("選択肢２");
//	SetAlias("選択肢２","選択肢２");
//	CreateTexture("@選択肢２/MouseUsual/選択範囲１", 10100, 430, 100, "cg/sys/select/room.png");
//	CreateTexture("@選択肢２/MouseOver/選択範囲２", 10100, 430, 100, "cg/sys/select/no.png");
//	CreateTexture("@選択肢２/MouseClick/選択範囲３", 10100, 430, 100, "cg/sys/select/no.png");
//	Request("@選択肢２/MouseUsual/選択範囲１", Erase);


//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", UP);
//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", DOWN);
//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", LEFT);
//	SetNextFocus("@選択肢１/MouseUsual/選択範囲１", "@選択肢２/MouseUsual/選択範囲１", RIGHT);

//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", UP);
//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", DOWN);
//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", LEFT);
//	SetNextFocus("@選択肢２/MouseUsual/選択範囲１", "@選択肢１/MouseUsual/選択範囲１", RIGHT);

//	Move("@選択肢*/*/*", 0, @240, @60, null, false);
//	Fade("@選択肢*/*/*",0,0,null,true);

	$SYSTEM_show_cursor = true;

	//■３６０
	//CreateMovie360("選択肢ムービー", 10100, Center, Middle, true, false, "dx/mv選択01.avi");
	//Fade("選択肢ムービー", 0, 0, null, true);
	//Request("選択肢ムービー", AddRender);

	Fade("セカイ乗算", 300, 0, null, false);
	Fade("選択肢ムービー", 300, 400, null, true);
}



function YES()
{
	$WhichBreak=false;
	$CX=0;
	$CY=0;

	if($parson){
		$FadeF=1000;
		$FadeF2=300;
	}else{
		$FadeF=1000;
		$FadeF2=200;
	}

//撤去
//	CreateColor("セカイ色１", 15000, 0, 0, 1280, 720, "WHITE");
//	Request("セカイ色１", AddRender);
//	Fade("セカイ色１", 0, 0, null, true);

//	CreateTexture("選択肢１＿００", 10100, 130, 0, "cg/sys/select/yes000.png");
//	CreateTexture("選択肢１＿０１", 10100, 130, 0, "cg/sys/select/yes001.png");
//	CreateTexture("選択肢１＿０２", 10100, 130, 0, "cg/sys/select/yes002.png");
//	CreateTexture("選択肢１＿０３", 10100, 130, 0, "cg/sys/select/yes003.png");
//	CreateTexture("選択肢１＿０４", 10100, 130, 0, "cg/sys/select/yes004.png");
//	CreateTexture("選択肢１＿０５", 10100, 130, 0, "cg/sys/select/yes005.png");
//	CreateTexture("選択肢１＿０６", 10100, 130, 0, "cg/sys/select/yes006.png");
//	CreateTexture("選択肢１＿０７", 10100, 130, 0, "cg/sys/select/yes007.png");
//	CreateTexture("選択肢１＿０８", 10100, 130, 0, "cg/sys/select/yes008.png");
//	CreateTexture("選択肢１＿０９", 10100, 130, 0, "cg/sys/select/yes009.png");
//	CreateTexture("選択肢１＿１０", 10100, 130, 0, "cg/sys/select/yes010.png");
//	CreateTexture("選択肢１＿１１", 10100, 400, 0, "cg/sys/select/no000.png");
//	CreateTexture("選択肢１奥", 20550, 160, 100, "cg/sys/select/room.png");
//	SetVertex("選択肢１奥", 70, middle);//コメントアウト済み
//	Request("選択肢１＿１１", Smoothing);
//	Request("選択肢１奥", Smoothing);

//	Move("選択肢１奥", 0, @240, @60, null, false);
//	Move("選択肢１＿*", 0, @240, @60, null, false);

//	Fade("選択肢１＿*",0,0,null,false);
//	Fade("選択肢１奥",0,0,null,true);

	Move("選択肢奥", 0, 320, 128, null, true);

	Fade("セカイ乗算", 500, 500, null, false);
	Fade("選択肢ムービー", 500, 0, null, false);
	Fade("@box360",500,0,null,false);

	Fade("box00/*",500,0,null,false);
	Fade("@選択肢１/MouseOver/選択範囲２",0,0,null,false);
	Fade("@選択肢１/MouseClick/選択範囲３",500,0,null,true);

//撤去
//	CreateSE("サウンド１","SE_擬音_YESNO選択_クリック");
	SoundPlay("サウンド１",0,1000,false);

	Fade("選択肢１＿００",0,1000,null,false);
	Fade("選択肢２＿００",0,1000,null,true);
	Fade("セカイドア",0,0,null,true);

	Fade("選択肢手前", 0, 1000, null, true);

	Fade("選択肢１＿０１",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿００",$fadetime2,0,null,false);
	Fade("選択肢１＿０２",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０１",$fadetime2,0,null,false);
	Fade("選択肢１＿０３",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０２",$fadetime2,0,null,false);
	Fade("選択肢１＿０４",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０３",$fadetime2,0,null,false);
	Fade("選択肢１＿０５",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０４",$fadetime2,0,null,false);
	Fade("選択肢１＿０６",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０５",$fadetime2,0,null,false);
	Fade("選択肢１＿０７",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０６",$fadetime2,0,null,false);
	Fade("選択肢１＿０８",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０７",$fadetime2,0,null,false);
	Fade("選択肢１＿０９",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０８",$fadetime2,0,null,false);
	Fade("選択肢１＿１０",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０９",$fadetime2,0,null,false);

	if($parson){
		Fade("back05", 1600, 0, null, false);
	}

	Fade("セカイ背景", 600, $FadeF, null, false);
	Fade("選択肢奥",300,1000,null,300);

	Fade("選択肢手前", 300, 0, null, false);
	Fade("選択肢１＿１０",300,0,null,300);

	Fade("セカイ乗算", 1000, 1000, null, false);
	Fade("セカイ色１", 1000, $FadeF2, null, false);

	Zoom("セカイ乗算", 1000, 2000, 2000, Axl2, false);
	Zoom("セカイ背景", 1000, 2000, 2000, Axl2, false);
	Move("選択肢２＿００", 1000, @1600, @208, Axl2, false);
	Zoom("選択肢２＿００", 1000, 7000, 7000, Axl2, false);
	Move("選択肢奥", 1000, @144, @192, Axl2, false);
	Zoom("選択肢奥", 1000, 7000, 7000, Axl2, true);

	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture("世界スクリーン", 20550, 0, 0, "SCREEN");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	$テキストデータバックログ１ = "【YES】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ１, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

//	Delete("box00/*");
//	Delete("@選択肢*");
//	Delete("選択肢*");
//	Delete("セカイ*");
}


function NO()
{
	$WhichBreak=false;
	$CX=0;
	$CY=0;

	if($parson){
		$FadeF=1000;
		$FadeF2=300;
	}else{
		$FadeF=1000;
		$FadeF2=200;
	}

//撤去
//	CreateColor("セカイ色１", 15000, 0, 0, 1280, 720, "WHITE");
//	Request("セカイ色１", AddRender);
//	Fade("セカイ色１", 0, 0, null, true);

//	CreateTexture("選択肢２＿００", 10100, 400, 0, "cg/sys/select/no000.png");
//	CreateTexture("選択肢２＿０１", 10100, 400, 0, "cg/sys/select/no001.png");
//	CreateTexture("選択肢２＿０２", 10100, 400, 0, "cg/sys/select/no002.png");
//	CreateTexture("選択肢２＿０３", 10100, 400, 0, "cg/sys/select/no003.png");
//	CreateTexture("選択肢２＿０４", 10100, 400, 0, "cg/sys/select/no004.png");
//	CreateTexture("選択肢２＿０５", 10100, 400, 0, "cg/sys/select/no005.png");
//	CreateTexture("選択肢２＿０６", 10100, 400, 0, "cg/sys/select/no006.png");
//	CreateTexture("選択肢２＿０７", 10100, 400, 0, "cg/sys/select/no007.png");
//	CreateTexture("選択肢２＿０８", 10100, 400, 0, "cg/sys/select/no008.png");
//	CreateTexture("選択肢２＿０９", 10100, 400, 0, "cg/sys/select/no009.png");
//	CreateTexture("選択肢２＿１０", 10100, 400, 0, "cg/sys/select/no010.png");
//	CreateTexture("選択肢２＿１１", 10100, 130, 0, "cg/sys/select/yes000.png");
//	CreateTexture("選択肢２奥", 20550, 430, 100, "cg/sys/select/room.png");
//	SetVertex("選択肢２奥", 140, middle);//コメントアウト済み
//	Request("選択肢２＿１１", Smoothing);
//	Request("選択肢２奥", Smoothing);

//	Move("選択肢２奥", 0, @240, @60, null, false);
//	Move("選択肢２＿*", 0, @240, @60, null, false);

//	Fade("選択肢２＿*",0,0,null,false);
//	Fade("選択肢２奥",0,0,null,true);

	Move("選択肢奥", 0, 536, 128, null, true);

	Fade("セカイ乗算", 500, 500, null, false);
	Fade("選択肢ムービー", 500, 0, null, false);
	Fade("@box360",500,0,null,false);

	Fade("box00/*",500,0,null,false);
	Fade("@選択肢２/MouseOver/選択範囲２",0,0,null,false);
	Fade("@選択肢２/MouseClick/選択範囲３",500,0,null,true);

//撤去
//	CreateSE("サウンド１","SE_擬音_YESNO選択_クリック");
	SoundPlay("サウンド１",0,1000,false);

	Fade("選択肢２＿００",0,1000,null,false);
	Fade("選択肢１＿００",0,1000,null,true);
	Fade("セカイドア",0,0,null,true);

	Fade("選択肢２＿０１",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿００",$fadetime2,0,null,false);
	Fade("選択肢２＿０２",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０１",$fadetime2,0,null,false);
	Fade("選択肢２＿０３",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０２",$fadetime2,0,null,false);
	Fade("選択肢２＿０４",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０３",$fadetime2,0,null,false);
	Fade("選択肢２＿０５",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０４",$fadetime2,0,null,false);
	Fade("選択肢２＿０６",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０５",$fadetime2,0,null,false);
	Fade("選択肢２＿０７",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０６",$fadetime2,0,null,false);
	Fade("選択肢２＿０８",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０７",$fadetime2,0,null,false);
	Fade("選択肢２＿０９",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０８",$fadetime2,0,null,false);
	Fade("選択肢２＿１０",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢２＿０９",$fadetime2,0,null,false);

	if($parson){
		Fade("back05", 1600, 0, null, false);
	}

	Fade("セカイ背景", 600, $FadeF, null, false);
	Fade("選択肢奥",300,1000,null,300);
	Fade("選択肢２＿１０",300,0,null,300);

	Fade("セカイ乗算", 1000, 1000, null, false);
	Fade("セカイ色１", 1000, $FadeF2, null, false);

	Zoom("セカイ乗算", 1000, 2000, 2000, Axl2, false);
	Zoom("セカイ背景", 1000, 2000, 2000, Axl2, false);
	Move("選択肢１＿００", 1000, @-1760, @208, Axl2, false);
	Zoom("選択肢１＿００", 1000, 7000, 7000, Axl2, false);
	Move("選択肢奥", 1000, @-160, @192, Axl2, false);
	Zoom("選択肢奥", 1000, 7000, 7000, Axl2, true);

	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture("世界スクリーン", 20550, 0, 0, "SCREEN");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	$テキストデータバックログ１ = "【NO】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ１, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

//	Delete("box00/*");
//	Delete("@選択肢*");
//	Delete("選択肢*");
//	Delete("セカイ*");
}




function YES00()
{
	$WhichBreak=false;
	$CX=0;
	$CY=0;

	if(Platform()==100){
		$fadetime=100;
		$fadetime2=50;
		$waittime=50;
	}else{
		$fadetime=50;
		$fadetime2=50;
		$waittime=50;
	}
//撤去
//	CreateColor("セカイ色１", 20550, 0, 0, 1280, 720, "WHITE");
//	Request("セカイ色１", AddRender);
//	Fade("セカイ色１", 0, 0, null, true);

//	CreateWindow("セカイウィンドウ１", 10100, 400, 160, 210, 320, false);
//	CreateTexture("セカイウィンドウ１/選択肢１奥", 10100, 0, -120, "cg/bg/bg113_01_6_海と青い空_a.jpg");
//	CreateTexture("選択肢１＿００", 10100, 130, 0, "cg/sys/select/yes000.png");
//	CreateTexture("選択肢１＿０１", 10100, 130, 0, "cg/sys/select/yes101.png");
//	CreateTexture("選択肢１＿０２", 10100, 130, 0, "cg/sys/select/yes102.png");
//	CreateTexture("選択肢１＿０３", 10100, 130, 0, "cg/sys/select/yes103.png");
//	CreateTexture("選択肢１＿０４", 10100, 130, 0, "cg/sys/select/yes104.png");
//	CreateTexture("選択肢１＿０５", 10100, 130, 0, "cg/sys/select/yes105.png");
//	CreateTexture("選択肢１＿０６", 10100, 130, 0, "cg/sys/select/yes106.png");
//	CreateTexture("選択肢１＿０７", 10100, 130, 0, "cg/sys/select/yes107.png");
//	CreateTexture("選択肢１＿０８", 10100, 130, 0, "cg/sys/select/yes108.png");
//	CreateTexture("選択肢１＿０９", 10100, 130, 0, "cg/sys/select/yes109.png");
//	CreateTexture("選択肢１＿１０", 10100, 130, 0, "cg/sys/select/yes110.png");
//	CreateTexture("選択肢１＿１１", 10100, 400, 0, "cg/sys/select/no000.png");

//	SetVertex("選択肢１奥", 70, middle);//コメントアウト済み
//	Request("選択肢１＿１１", Smoothing);
//	Request("セカイウィンドウ１/選択肢１奥", Smoothing);

//	Move("選択肢１奥", 0, @240, @60, null, false);
//	Move("選択肢１＿*", 0, @240, @60, null, false);
//	Zoom("セカイウィンドウ１/選択肢１奥", 0, 500, 500, null, false);

//	Fade("選択肢１＿*",0,0,null,false);
//	Fade("セカイウィンドウ１/選択肢１奥",0,0,null,true);

	Fade("セカイ乗算", 500, 500, null, false);
	Fade("選択肢ムービー", 500, 0, null, false);
	Fade("@box360",500,0,null,false);

	Fade("box00/*",500,0,null,false);
	Fade("@選択肢１/MouseOver/選択範囲２",0,0,null,false);
	Fade("@選択肢１/MouseClick/選択範囲３",500,0,null,true);

//撤去
//	CreateSE("サウンド１","SE_擬音_YESNO選択_クリック");
	SoundPlay("サウンド１",0,1000,false);

	Fade("選択肢１＿００",0,1000,null,false);
	Fade("選択肢２＿００",0,1000,null,true);
	Fade("セカイドア",0,0,null,true);

	Fade("セカイウィンドウ１/選択肢１奥",0,1000,null,true);

	Fade("選択肢１＿０１",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿００",$fadetime2,0,null,false);
	Fade("選択肢１＿０２",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０１",$fadetime2,0,null,false);
	Fade("選択肢１＿０３",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０２",$fadetime2,0,null,false);
	Fade("選択肢１＿０４",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０３",$fadetime2,0,null,false);
	Fade("選択肢１＿０５",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０４",$fadetime2,0,null,false);
	Fade("選択肢１＿０６",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０５",$fadetime2,0,null,false);
	Fade("選択肢１＿０７",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０６",$fadetime2,0,null,false);
	Fade("選択肢１＿０８",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０７",$fadetime2,0,null,false);
	Fade("選択肢１＿０９",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０８",$fadetime2,0,null,false);
	Fade("選択肢１＿１０",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０９",$fadetime2,0,null,false);


	Fade("セカイ背景", 600, 1000, null, 300);
//	Fade("セカイウィンドウ１/選択肢１奥",300,1000,null,300);
	Fade("選択肢１＿１０",300,0,null,300);


	Fade("セカイ乗算", 2000, 1000, null, false);
	Fade("セカイ色１", 2000, 1000, Axl3, false);

	Zoom("セカイ乗算", 2000, 2000, 2000, Axl2, false);
	Zoom("セカイ背景", 2000, 2000, 2000, Axl2, false);
	Move("選択肢２＿００", 2000, @1600, @208, Axl2, false);
	Zoom("選択肢２＿００", 2000, 7000, 7000, Axl2, false);
	Move("セカイウィンドウ１/選択肢１奥", 2000, @0, @0, Axl2, false);
	Zoom("セカイウィンドウ１/選択肢１奥", 2000, 2000, 2000, Axl2, false);
	Move("セカイウィンドウ１", 2000, @160, @168, Axl2, false);
	Zoom("セカイウィンドウ１", 2000, 7000, 7000, Axl2, true);

	//★★★★ロック
	XBOX360_LockVideo(true);
	CreateTexture("世界スクリーン", 20550, 0, 0, "SCREEN");
	Request("世界スクリーン", AddRender);
	//★★★★アンロック
	XBOX360_LockVideo(false);

	$テキストデータバックログ１ = "【YES】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ１, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

//	Delete("box00/*");
//	Delete("@選択肢*");
//	Delete("選択肢*");
//	Delete("セカイ*");
//	Delete("セカイ*/*");
}




function EndWhich()
{
	Request("セカイサウンド１", UnLock);
	Request("サウンド１", UnLock);
	$WhichBreak=false;

	$CX=0;
	$CY=0;

	//★★★★ロック
	XBOX360_LockVideo(true);
	Delete("box00/*");
	Delete("@選択肢*");
	Delete("選択肢*");
	Delete("セカイ*");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	DrawTransition("世界スクリーン", 500, 1000, 0, 100, Axl2, "cg/data/zoom2.png", true);
	Delete("世界スクリーン");

	$SYSTEM_backlog_lock = 0;
	$SYSTEM_skip_lock=false;
	
	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
//	$SYSTEM_backselect_lock =false;
	$SYSTEM_show_cursor = false;
	$SYSTEM_text_erase_lock = false;
}

function EndWhich00()
{
	Request("セカイサウンド１", UnLock);
	Request("サウンド１", UnLock);
	$WhichBreak=false;

	$CX=0;
	$CY=0;

	//★★★★ロック
	XBOX360_LockVideo(true);
	Delete("box00/*");
	Delete("@選択肢*");
	Delete("選択肢*");
	Delete("セカイ*/*");
	Delete("セカイ*");
	//★★★★アンロック
	XBOX360_LockVideo(false);

	Wait(500);
	Fade("世界スクリーン", 3000, 0, null, true);
	Delete("世界スクリーン");
	Wait(500);

	$SYSTEM_backlog_lock = 0;
	$SYSTEM_skip_lock=false;
	
	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
//	$SYSTEM_backselect_lock =false;
	$SYSTEM_show_cursor = false;
	$SYSTEM_text_erase_lock = false;
}




function SelectBox()
{
	Zoom("@box360", 0, 500, 0, Axl1, false);
	Rotate("@box360", 0, -90, 0, 0, Axl1, true);
}


function SelectCursor()
{
	if(Platform()==100){
		$SelectBreak=false;
		CursorPosition($CX,$CY);
		if($SYSTEM_XBOX360_button_left_down||$SYSTEM_XBOX360_button_up_down){
			if($CX>=400&&$CX<=610&&$CY>=160&&$CY<=480){
				MoveCursor(750,300);
			}else if($CX>=670&&$CX<=880&&$CY>=160&&$CY<=480){
				MoveCursor(500,300);
			}else{
				MoveCursor(500,300);
			}
			$SelectBreak=true;
		}else if($SYSTEM_XBOX360_button_right_down||$SYSTEM_XBOX360_button_down_down){
			if($CX>=400&&$CX<=610&&$CY>=160&&$CY<=480){
				MoveCursor(750,300);
			}else if($CX>=670&&$CX<=880&&$CY>=160&&$CY<=480){
				MoveCursor(500,300);
			}else{
				MoveCursor(750,300);
			}
			$SelectBreak=true;
		}
		$SYSTEM_XBOX360_button_left_down=false;
		$SYSTEM_XBOX360_button_up_down=false;
		$SYSTEM_XBOX360_button_right_down=false;
		$SYSTEM_XBOX360_button_down_down=false;
	}
}











//======================================================================//
.//■デバッグ選択肢
//======================================================================//
..//２択の選択肢ボタンを表示
function SetChoice02($テキストデータ１,$テキストデータ２)
{
	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_backlog_lock = 1;
	$SYSTEM_text_erase_lock = true;
	$SYSTEM_skip_lock = true;

	SetFont("ＭＳ ゴシック", 22, #FFFFFF, #000000, 500, LEFTDOWN);

	LoadImage("select_img","cg/sys/select4/Select001.png");

	CreateTexture("選択肢板１",10400,110,160,"select_img");
	SetAlias("選択肢板１","選択肢板１");
	CreateTexture("選択肢板２",10410,110,240,"select_img");
	SetAlias("選択肢板２","選択肢板２");

	CreateText("選択肢板１/選択肢文字列１",10401,inherit, inherit,auto,auto,$テキストデータ１);
	SetAlias("選択肢板１/選択肢文字列１","選択肢文字列１");
	CreateText("選択肢板２/選択肢文字列２",10411,inherit, inherit,auto,auto,$テキストデータ２);
	SetAlias("選択肢板２/選択肢文字列２","選択肢文字列２");
	Request("@選択肢文字列*",PushText);
	Request("@選択肢文字列*",NoLog);

	CreateChoice("選択肢１");
	SetAlias("選択肢１","選択肢１");
	CreateTexture("@選択肢１/MouseUsual/選択肢１板１",10400,110,160,"select_img");
	CreateTexture("@選択肢１/MouseOver/選択肢１板２", 10400,110,160,"cg/sys/select4/Select002.png");
	CreateTexture("@選択肢１/MouseClick/選択肢１板３",10400,110,160,"cg/sys/select4/Select003.png");

	CreateChoice("選択肢２");
	SetAlias("選択肢２","選択肢２");
	CreateTexture("@選択肢２/MouseUsual/選択肢２板１",10410,110,240,"select_img");
	CreateTexture("@選択肢２/MouseOver/選択肢２板２", 10410,110,240,"cg/sys/select4/Select002.png");
	CreateTexture("@選択肢２/MouseClick/選択肢２板３",10410,110,240,"cg/sys/select4/Select003.png");

	SetNextFocus("@選択肢１/MouseUsual/選択肢１板１", "@選択肢２/MouseUsual/選択肢２板１", UP);
	SetNextFocus("@選択肢１/MouseUsual/選択肢１板１", "@選択肢２/MouseUsual/選択肢２板１", DOWN);
	SetNextFocus("@選択肢１/MouseUsual/選択肢１板１", "@選択肢２/MouseUsual/選択肢２板１", LEFT);
	SetNextFocus("@選択肢１/MouseUsual/選択肢１板１", "@選択肢２/MouseUsual/選択肢２板１", RIGHT);

	SetNextFocus("@選択肢２/MouseUsual/選択肢２板１", "@選択肢１/MouseUsual/選択肢１板１", UP);
	SetNextFocus("@選択肢２/MouseUsual/選択肢２板１", "@選択肢１/MouseUsual/選択肢１板１", DOWN);
	SetNextFocus("@選択肢２/MouseUsual/選択肢２板１", "@選択肢１/MouseUsual/選択肢１板１", LEFT);
	SetNextFocus("@選択肢２/MouseUsual/選択肢２板１", "@選択肢１/MouseUsual/選択肢１板１", RIGHT);

	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
//	$SYSTEM_backselect_lock = true;


	//■３６０
	Move("選択肢*", 0, @192, @48, null, false);
	Move("選択肢*/*/*", 0, @192, @48, null, false);

	Fade("@選択肢板*",0,0,null,false);
	Fade("@選択肢*/*/*",0,0,null,false);
	Fade("@選択肢文字列*",0,0,null,false);
	Fade("@選択肢板*",$SelectFadeTime,1000,null,false);
	Fade("@選択肢文字列*",$SelectFadeTime,1000,null,false);
	Fade("@選択肢*/MouseUsual/*",$SelectFadeTime,1000,null,true);
	
	Draw();
	
	$SYSTEM_show_cursor = true;
	$SYSTEM_last_text = $テキストデータ１ + "<BR>　　"+$テキストデータ２;
}

// ２択の１番目が選ばれた後の処理
function ChoiceA02()
{
	Fade("@選択肢板２",$SelectFadeTime,0,null,false);
	Fade("@選択肢文字列２",$SelectFadeTime,0,null,false);
	Fade("@選択肢２/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢２/*/*",$SelectFadeTime,0,null,false);
	Wait($SelectWaitTime);
	Fade("@選択肢板１",$SelectDeleteTime,0,null,false);
	Fade("@選択肢文字列１",$SelectDeleteTime,0,null,false);
	Fade("@選択肢１/*",$SelectDeleteTime,0,null,false);
	Fade("@選択肢１/*/*",$SelectDeleteTime,0,null,false);

	WaitAction("@選択肢*",null);
	WaitAction("@選択肢*/*",null);
	WaitAction("@選択肢*/*/*",null);
			
	$テキストデータバックログ１ = "【" + $テキストデータ１ + "】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ１, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

	Delete("選択*");
	Delete("@選択*");
	Delete("select_*");

	$SYSTEM_backlog_lock = 0;
	$SYSTEM_skip_lock=false;
	
	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
//	$SYSTEM_backselect_lock =false;
	$SYSTEM_show_cursor = false;
	$SYSTEM_text_erase_lock = false;
}

// ２択の２番目が選ばれた後の処理
function ChoiceB02()
{
	Fade("@選択肢板１",$SelectFadeTime,0,null,false);
	Fade("@選択肢文字列１",$SelectFadeTime,0,null,false);
	Fade("@選択肢１/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢１/*/*",$SelectFadeTime,0,null,false);
	Wait($SelectWaitTime);
	Fade("@選択肢板２",$SelectDeleteTime,0,null,false);
	Fade("@選択肢文字列２",$SelectDeleteTime,0,null,false);
	Fade("@選択肢２/*",$SelectDeleteTime,0,null,false);
	Fade("@選択肢２/*/*",$SelectDeleteTime,0,null,false);

	WaitAction("@選択肢*",null);
	WaitAction("@選択肢*/*",null);
	WaitAction("@選択肢*/*/*",null);
	
	//SetFont("ＭＳ ゴシック", 22, #FFFFFF, #00000, 500,DOWN);

	$テキストデータバックログ２ = "【" + $テキストデータ２ + "】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ２, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

	Delete("選択*");
	Delete("@選択*");
	Delete("select_*");

	$SYSTEM_backlog_lock = 0;
	$SYSTEM_skip_lock=false;

	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
//	$SYSTEM_backselect_lock = false;
	$SYSTEM_show_cursor = false;
	$SYSTEM_text_erase_lock = false;
}










..//３択の選択肢ボタンを表示
function SetChoice03($テキストデータ１,$テキストデータ２,$テキストデータ３)
{
	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_backlog_lock = 1;
	$SYSTEM_text_erase_lock = true;
	$SYSTEM_skip_lock = true;

	SetFont("ＭＳ ゴシック", 22, #FFFFFF, #000000, 500, LEFTDOWN);

	LoadImage("select_img","cg/sys/select4/Select001.png");

	CreateTexture("選択肢板１",10400,110,120,"select_img");
	SetAlias("選択肢板１","選択肢板１");
	CreateTexture("選択肢板２",10410,110,200,"select_img");
	SetAlias("選択肢板２","選択肢板２");
	CreateTexture("選択肢板３",10420,110,280,"select_img");
	SetAlias("選択肢板３","選択肢板３");

	CreateText("選択肢板１/選択肢文字列１",10401,inherit, inherit,auto,auto,$テキストデータ１);
	SetAlias("選択肢板１/選択肢文字列１","選択肢文字列１");
	CreateText("選択肢板２/選択肢文字列２",10411,inherit, inherit,auto,auto,$テキストデータ２);
	SetAlias("選択肢板２/選択肢文字列２","選択肢文字列２");
	CreateText("選択肢板３/選択肢文字列３",10421,inherit, inherit,auto,auto,$テキストデータ３);
	SetAlias("選択肢板３/選択肢文字列３","選択肢文字列３");
	Request("@選択肢文字列*",PushText);
	Request("@選択肢文字列*",NoLog);

	CreateChoice("選択肢１");
	SetAlias("選択肢１","選択肢１");
	CreateTexture("@選択肢１/MouseUsual/選択肢１板１",10400,110,120,"select_img");
	CreateTexture("@選択肢１/MouseOver/選択肢１板２", 10400,110,120,"cg/sys/select4/Select002.png");
	CreateTexture("@選択肢１/MouseClick/選択肢１板３",10400,110,120,"cg/sys/select4/Select003.png");

	CreateChoice("選択肢２");
	SetAlias("選択肢２","選択肢２");
	CreateTexture("@選択肢２/MouseUsual/選択肢２板１",10410,110,200,"select_img");
	CreateTexture("@選択肢２/MouseOver/選択肢２板２", 10410,110,200,"cg/sys/select4/Select002.png");
	CreateTexture("@選択肢２/MouseClick/選択肢２板３",10410,110,200,"cg/sys/select4/Select003.png");

	CreateChoice("選択肢３");
	SetAlias("選択肢３","選択肢３");
	CreateTexture("@選択肢３/MouseUsual/選択肢３板１",10420,110,280,"select_img");
	CreateTexture("@選択肢３/MouseOver/選択肢３板２", 10420,110,280,"cg/sys/select4/Select002.png");
	CreateTexture("@選択肢３/MouseClick/選択肢３板３",10420,110,280,"cg/sys/select4/Select003.png");

	SetNextFocus("@選択肢１/MouseUsual/選択肢１板１", "@選択肢３/MouseUsual/選択肢３板１", UP);
	SetNextFocus("@選択肢１/MouseUsual/選択肢１板１", "@選択肢２/MouseUsual/選択肢２板１", DOWN);
	SetNextFocus("@選択肢１/MouseUsual/選択肢１板１", "@選択肢３/MouseUsual/選択肢３板１", LEFT);
	SetNextFocus("@選択肢１/MouseUsual/選択肢１板１", "@選択肢２/MouseUsual/選択肢２板１", RIGHT);
	
	SetNextFocus("@選択肢２/MouseUsual/選択肢２板１", "@選択肢１/MouseUsual/選択肢１板１", UP);
	SetNextFocus("@選択肢２/MouseUsual/選択肢２板１", "@選択肢３/MouseUsual/選択肢３板１", DOWN);
	SetNextFocus("@選択肢２/MouseUsual/選択肢２板１", "@選択肢１/MouseUsual/選択肢１板１", LEFT);
	SetNextFocus("@選択肢２/MouseUsual/選択肢２板１", "@選択肢３/MouseUsual/選択肢３板１", RIGHT);
	
	SetNextFocus("@選択肢３/MouseUsual/選択肢３板１", "@選択肢２/MouseUsual/選択肢２板１", UP);
	SetNextFocus("@選択肢３/MouseUsual/選択肢３板１", "@選択肢１/MouseUsual/選択肢１板１", DOWN);
	SetNextFocus("@選択肢３/MouseUsual/選択肢３板１", "@選択肢２/MouseUsual/選択肢２板１", LEFT);
	SetNextFocus("@選択肢３/MouseUsual/選択肢３板１", "@選択肢１/MouseUsual/選択肢１板１", RIGHT);
	
	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
//	$SYSTEM_backselect_lock = true;

	//■３６０
	Move("選択肢*", 0, @192, @48, null, false);
	Move("選択肢*/*/*", 0, @192, @48, null, false);

	Fade("@選択肢板*",0,0,null,false);
	Fade("@選択肢*/*/*",0,0,null,false);
	Fade("@選択肢文字列*",0,0,null,false);
	Fade("@選択肢板*",$SelectFadeTime,1000,null,false);
	Fade("@選択肢文字列*",$SelectFadeTime,1000,null,false);
	Fade("@選択肢*/MouseUsual/*",$SelectFadeTime,1000,null,true);
	
	Draw();
	
	$SYSTEM_show_cursor = true;
	$SYSTEM_last_text = $テキストデータ１ + "<BR>　　"+$テキストデータ２ + "<BR>　　"+$テキストデータ３;
}

// ３択の１番目が選ばれた後の処理
function ChoiceA03()
{
	Fade("@選択肢板２",$SelectFadeTime,0,null,false);
	Fade("@選択肢文字列２",$SelectFadeTime,0,null,false);
	Fade("@選択肢２/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢２/*/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢板３",$SelectFadeTime,0,null,false);
	Fade("@選択肢文字列３",$SelectFadeTime,0,null,false);
	Fade("@選択肢３/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢３/*/*",$SelectFadeTime,0,null,false);
	Wait($SelectWaitTime);
	Fade("@選択肢板１",$SelectDeleteTime,0,null,false);
	Fade("@選択肢文字列１",$SelectDeleteTime,0,null,false);
	Fade("@選択肢１/*",$SelectDeleteTime,0,null,false);
	Fade("@選択肢１/*/*",$SelectDeleteTime,0,null,false);
	WaitAction("@選択肢*",null);
	WaitAction("@選択肢*/*",null);
	WaitAction("@選択肢*/*/*",null);
			
	$テキストデータバックログ１ = "【" + $テキストデータ１ + "】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ１, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

	Delete("選択*");
	Delete("@選択*");
	Delete("select_*");

	$SYSTEM_backlog_lock = 0;
	$SYSTEM_skip_lock=false;
	
	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
//	$SYSTEM_backselect_lock =false;
	$SYSTEM_show_cursor = false;
	$SYSTEM_text_erase_lock = false;
}

// ３択の２番目が選ばれた後の処理
function ChoiceB03()
{
	Fade("@選択肢板１",$SelectFadeTime,0,null,false);
	Fade("@選択肢文字列１",$SelectFadeTime,0,null,false);
	Fade("@選択肢１/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢１/*/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢板３",$SelectFadeTime,0,null,false);
	Fade("@選択肢文字列３",$SelectFadeTime,0,null,false);
	Fade("@選択肢３/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢３/*/*",$SelectFadeTime,0,null,false);
	Wait($SelectWaitTime);
	Fade("@選択肢板２",$SelectDeleteTime,0,null,false);
	Fade("@選択肢文字列２",$SelectDeleteTime,0,null,false);
	Fade("@選択肢２/*",$SelectDeleteTime,0,null,false);
	Fade("@選択肢２/*/*",$SelectDeleteTime,0,null,false);
	WaitAction("@選択肢*",null);
	WaitAction("@選択肢*/*",null);
	WaitAction("@選択肢*/*/*",null);
	
	//SetFont("ＭＳ ゴシック", 22, #FFFFFF, #00000, 500,DOWN);

	$テキストデータバックログ２ = "【" + $テキストデータ２ + "】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ２, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

	Delete("選択*");
	Delete("@選択*");
	Delete("select_*");

	$SYSTEM_backlog_lock = 0;
	$SYSTEM_skip_lock=false;

	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
//	$SYSTEM_backselect_lock = false;
	$SYSTEM_show_cursor = false;
	$SYSTEM_text_erase_lock = false;
}

// ３択の３番目が選ばれた後の処理
function ChoiceC03()
{
	Fade("@選択肢板１",$SelectFadeTime,0,null,false);
	Fade("@選択肢文字列１",$SelectFadeTime,0,null,false);
	Fade("@選択肢１/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢１/*/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢板２",$SelectFadeTime,0,null,false);
	Fade("@選択肢文字列２",$SelectFadeTime,0,null,false);
	Fade("@選択肢２/*",$SelectFadeTime,0,null,false);
	Fade("@選択肢２/*/*",$SelectFadeTime,0,null,false);
	Wait($SelectWaitTime);
	Fade("@選択肢板３",$SelectDeleteTime,0,null,false);
	Fade("@選択肢文字列３",$SelectDeleteTime,0,null,false);
	Fade("@選択肢３/*",$SelectDeleteTime,0,null,false);
	Fade("@選択肢３/*/*",$SelectDeleteTime,0,null,false);
	WaitAction("@選択肢*",null);
	WaitAction("@選択肢*/*",null);
	WaitAction("@選択肢*/*/*",null);
	
	//SetFont("ＭＳ ゴシック", 22, #FFFFFF, #00000, 500,DOWN);

	$テキストデータバックログ３ = "【" + $テキストデータ３ + "】";

	SetBacklog("　", "null", null);//★バクログ
	SetBacklog($テキストデータバックログ３, "null", null);//★バクログ
	SetBacklog("　", "null", null);//★バクログ

	Delete("選択*");
	Delete("@選択*");
	Delete("select_*");

	$SYSTEM_backlog_lock = 0;
	$SYSTEM_skip_lock=false;

	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
//	$SYSTEM_backselect_lock = false;
	$SYSTEM_show_cursor = false;
	$SYSTEM_text_erase_lock = false;
}

