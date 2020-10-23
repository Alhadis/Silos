#include "nss/function_system.nss"

$Revision: 35 $

//=============================================================================//
//■コンフィグ■
//=============================================================================//
chapter main
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	//★定義「ストレージ番号取得」
	FlagCheck();

	//★前提変数
	//#SYSTEM_interrupt_play_speed=3;
	$SYSTEM_backlog_lock=true;

	//★前提変数
	if($Title_Config){
		//★：タイトルのゲームスピード保管
		#play_speed_plus2 = #SYSTEM_play_speed;
		//タイトルにおいてのコンフィグのゲームスピード
		#SYSTEM_play_speed=3;
	}else{
		#play_speed_plus=#SYSTEM_play_speed;
	}


	//最初はどこのページ？
	$cfgtab=1;
	//一度読み込んだら読み込まないように
	$cfgmaketab1=false;
	//テスト音声用初期化変数
	$cfgvoicetest=1;
	//初期化やページ移動用
	$ConfigBreakFlag=false;
	//チェックボックスのFADE秒数
	$ConfigFadeTime=100;
	//選択オーバー音
	$ConfigSound_over="sound/se/SE_じん体_動作_ぺーじめくり";
	//選択クリック音
	$ConfigSound_click="sound/se/SE_擬音_杭_突きささる";
	//スクロールスピード
	$ConfigScrollSpeed=24;

	SetFont("ArialTahomaUnicod MS",17,#00000,#FFFFFF,500,NONE);

	//■準備「スクリーン」//※タイトルとかメニューから？それとも？
	if(!$PLACE_title&&!$SYSTEM_menu_enable&&!$SYSTEM_menu_lock){
		LoadImage("IMG_video",VIDEO);
	}else{
		LoadImage("IMG_video",SCREEN);
	}
	CreateTexture("video_config01",10000,center,middle,"IMG_video");

	//■定義「共通素材」
	ConfigReady();

	//■開始「コンフィグ画面」
	$SYSTEM_menu_config_enable=true;
	$SYSTEM_menu_close_enable=false;
	$SYSTEM_buttondown_close=false;
	$SYSTEM_keydown_esc=false;
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	while($SYSTEM_menu_config_enable)
	{
		//★初期化やページ移動用
		$ConfigBreakFlag=false;

		//▼定義
		ConfigSet();

		//▼描画
		ConfigFade();

		//▼選択肢
		ConfigSelect();

		if($ConfigBreakFlag){$SYSTEM_menu_config_enable=true;}
	}

	if($TypeBeginNow){
		Fade("<@box360>", 0, #LOCAL_window_fade, null, true);
	}

	ConfigCharacterVoice();
	SavingStart();

	CreateWindow("finfin", 11100, center, OutBottom, 1024, 576, false);
	CreateTexture("finfin/fin",11100,center,middle,"IMG_video");
//	Fade("fin",0,0,null,false);
//	Fade("fin",300,1000,null,true);

	//▲描画「ボタン説明」
	DialogButtonOFF("Button_CONFIG");
	Move("finfin", 300, @0, @-576, null, true);
	$SYSTEM_backlog_lock=false;
	$SYSTEM_menu_config_enable=false;
	if($PLACE_select){
//		$SYSTEM_backlog_lock=true;
	}

	if($Title_Config){
		#SYSTEM_play_speed=#play_speed_plus2;
	}else{
		#SYSTEM_play_speed=#play_speed_plus;
	}

	$SYSTEM_r_button_down=false;
	$SYSTEM_XBOX360_button_b_down=false;
	#SYSTEM_interrupt_play_speed=3;
}





//■マクロ「共通素材」
function ConfigReady()
{
	//■ロード「共通画像系」
	LoadImage("ConfigImageLine","cg/sys/config/バー裏側アタリ判定.png");

	LoadImage("ConfigImagePen00","cg/sys/config/調整バーつまみ裏側アタリ判定.png");
	LoadImage("ConfigImagePen01","cg/sys/config/メモリ針-001.png");
	LoadImage("ConfigImagePen02","cg/sys/config/メモリ針-002.png");

	LoadImage("ConfigImageCheck01","cg/sys/config/チェックボックス選択色.png");//チェックデフォ、および当たり判定
	LoadImage("ConfigImageCheck02","cg/sys/config/チェックボックス選択色.png");//チェックオーバー
	LoadImage("ConfigImageCheck03","cg/sys/config/チェックicon.png");//チェック

	LoadImage("ConfigImageBottan01","cg/sys/config/PUSH-001.png");//チェックデフォ、および当たり判定
	LoadImage("ConfigImageBottan02","cg/sys/config/PUSH-002.png");//チェックオーバー
	LoadImage("ConfigImageBottan03","cg/sys/config/PUSH-003.png");//チェック

	LoadImage("ConfigImageBar","cg/sys/config/コンフィグ座標選択バー.png");//ラインオーバー

	//▼定義「音」
	CreateSound("ConfigSound_over", SE, $ConfigSound_over);
	CreateSound("ConfigSound_click", SE, $ConfigSound_click);

	//▼定義「背景」
	CreateTexture("Config9f_ConfigGround", 10000, Center, Middle, "cg/sys/config/config背景画像.png");

	//▼定義「バー」
	$ConfigBarX=128;
	$ConfigBarY=188;
	CreateTexture("Config9f_bar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
	Request("Config9f_bar", MulRender);

	Request("Config*/MouseUsual/hit", Erase);
	Fade("*",0,0,null,false);
	Fade("*/*/*",0,0,null,true);
	Fade("video_config01", 0, 1000, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	WaitAction("video_config01", null);
}


//■マクロ「コンフィグ定義」
function ConfigSet()
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	$ConfigBarX=128;

	//▼描画「スクリーン」
	CreateWindow("コンフィグウィンドウ", 20000, 0, 0, 1024, 576, false);
	CreateTexture("コンフィグウィンドウ/背景", 20000, 0, 0, SCREEN);

	//■定義「ボタン説明」
	DialogButtonON("Button_CONFIG");

	//★ＴＣＲ対策
	//LoadingStart();

	if($cfgtab==1&&!$cfgmaketab1){
		//▼バー初期位置
		Move("Config9f_bar", 0, 128, 188, null, true);

		//▼定義「出口」
		$ConfigExitX=441;
		$ConfigExitY=1004;
		//CreateChoice("Config1a_EXIT");
		//CreateTexture("Config1f_EXIT", 10010, $ConfigExitX, $ConfigExitY, "cg/sys/config/all-ok-001.png");
		//CreateTexture("Config1a_EXIT/MouseUsual/hit", 10010, $ConfigExitX, $ConfigExitY, "cg/sys/config/all-ok-001.png");
		//CreateTexture("Config1a_EXIT/MouseOver/icon", 10010, $ConfigExitX, $ConfigExitY, "cg/sys/config/all-ok-002.png");
		//CreateTexture("Config1a_EXIT/MouseClick/icon", 10010, $ConfigExitX, $ConfigExitY, "cg/sys/config/all-ok-003.png");
		//CreateSound("Config1a_EXIT/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("Config1a_EXIT/MouseClick/sound", SE, $ConfigSound_click);
		$ConfigExitH=ImageHorizon("Config1a_EXIT/MouseUsual/hit");
		$ConfigExitV=ImageVertical("Config1a_EXIT/MouseUsual/hit");

		//▼定義「全体スクロール」
//		CreateScrollbar("ナット名", 描画優先度, 最小値Ｘ座標, 最小値Ｙ座標, 最大値Ｘ座標, 最大値Ｙ座標, 初期値, スクロールタイプ, "カーソルバーイメージ")
		CreateChoice("Config9f_Scrollbar");
		CreateScrollbar("Config9f_Scrollbar", 10001, 904, 171, 904, 445, 0, VERTICAL, "cg/sys/config/スクロールボタン.png");
		SetScrollbar("Config9f_Scrollbar", "Config9f_Scrollbar");
		SetScrollSpeed("Config9f_Scrollbar",31);
		SetAlias("Config9f_Scrollbar", "Config9f_Scrollbar");
		
		//▼定義「一枚目」
		CreateTexture("Config1f_ConfigGround", 10000, Center, 48, "cg/sys/config/コンフィグシート.jpg");

		//▼定義「ストレージ変更」
		$ConfigStorageX=824;
		$ConfigStorageY=898;
		$ConfigStorageBar=$ConfigStorageY-7;
		CreateChoice("Config1a_Storage");
		CreateTexture("Config1f_Storage", 10010, $ConfigStorageX, $ConfigStorageY, "ConfigImageBottan01");
		CreateTexture("Config1a_Storage/MouseUsual/hit", 10010, $ConfigStorageX, $ConfigStorageY, "ConfigImageBottan01");
		CreateTexture("Config1a_Storage/MouseOver/icon", 10010, $ConfigStorageX, $ConfigStorageY, "ConfigImageBottan02");
		CreateTexture("Config1a_Storage/MouseClick/icon", 10010, $ConfigStorageX, $ConfigStorageY, "ConfigImageBottan03");
		//CreateTexture("Config1a_Storage/MouseOver/bar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//CreateSound("Config1a_Storage/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("Config1a_Storage/MouseClick/sound", SE, $ConfigSound_click);
		//Request("Config1a_Storage/MouseOver/bar", MulRender);
		Request("Config1a_Storage/MouseUsual/hit", Erase);
		$ConfigStorageH=ImageHorizon("Config1a_Storage/MouseUsual/hit");
		$ConfigStorageV=ImageVertical("Config1a_Storage/MouseUsual/hit");

		//▼定義「初期化」
		$ConfigDefaultX=824;
		$ConfigDefaultY=930;
		$ConfigDefaultBar=$ConfigDefaultY-7;
		CreateChoice("Config1a_Default");
		CreateTexture("Config1f_Default", 10010, $ConfigDefaultX, $ConfigDefaultY, "ConfigImageBottan01");
		CreateTexture("Config1a_Default/MouseUsual/hit", 10010, $ConfigDefaultX, $ConfigDefaultY, "ConfigImageBottan01");
		CreateTexture("Config1a_Default/MouseOver/icon", 10010, $ConfigDefaultX, $ConfigDefaultY, "ConfigImageBottan02");
		CreateTexture("Config1a_Default/MouseClick/icon", 10010, $ConfigDefaultX, $ConfigDefaultY, "ConfigImageBottan03");
		//CreateTexture("Config1a_Default/MouseOver/bar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//CreateSound("Config1a_Default/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("Config1a_Default/MouseClick/sound", SE, $ConfigSound_click);
		//Request("Config1a_Default/MouseOver/bar", MulRender);
		Request("Config1a_Default/MouseUsual/hit", Erase);
		$ConfigDefaultH=ImageHorizon("Config1a_Default/MouseUsual/hit");
		$ConfigDefaultV=ImageVertical("Config1a_Default/MouseUsual/hit");



		//▼定義「メッセージスピード」
		$ConfigMSpeedX=638;//固定
		$ConfigMSpeedY=193;
		$ConfigMSpeedX2=831;//固定
		$ConfigMSpeedY2=193;
		$ConfigMSpeedBaseX=630;//固定
		$ConfigMSpeedBaseX2=839;//固定
		$ConfigMSpeedBar=$ConfigMSpeedY-5;
		$pos=1000*(1-(#SYSTEM_text_speed/1000));

		CreateScrollbar("Config1a_MSpeed",10050,$ConfigMSpeedX,$ConfigMSpeedY,$ConfigMSpeedX2,$ConfigMSpeedY2,$pos,HORIZON,"ConfigImagePen00");
		Request("Config1a_MSpeed", Erase);
		SetScrollSpeed("Config1a_MSpeed", $ConfigScrollSpeed);
			//▼アイコンアニメーションの当たり判定
			CreateChoice("Config1a_MSpeed_Pro01");
			SetAlias("Config1a_MSpeed_Pro01", "Config1a_MSpeed_Pro01");
			CreateTexture("@Config1a_MSpeed_Pro01/MouseUsual/hit",0,$ConfigMSpeedX,$ConfigMSpeedY,"ConfigImageLine");
			CreateProcess("@Config1a_MSpeed_Pro01/MouseOver/button", 10010, 0, 0, "ConfigMSpeedProcessOPEN");
			CreateProcess("@Config1a_MSpeed_Pro01/MouseLeave/button", 10010, 0, 0, "ConfigMSpeedProcessSTOP");
			//CreateTexture("@Config1a_MSpeed_Pro01/MouseOver/bar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
			//CreateSound("@Config1a_MSpeed_Pro01/MouseOver/sound", SE, $ConfigSound_over);
			//CreateSound("@Config1a_MSpeed_Pro01_sound", SE, $ConfigSound_click);
			//Request("@Config1a_MSpeed_Pro01/MouseOver/bar", MulRender);
			Request("@Config1a_MSpeed_Pro01/MouseUsual/hit", Erase);
			//▼カーソル定義
			$ConfigMSpeedX3=($pos/1000)*($ConfigMSpeedX2-$ConfigMSpeedX)+($ConfigMSpeedX-1);
			CreateTexture("Config1f_MSpeed01", 10010, $ConfigMSpeedX3, $ConfigMSpeedY, "ConfigImagePen01");
			SetAlias("Config1f_MSpeed01", "Config1f_MSpeed01");
			CreateTexture("Config1a_MSpeed02", 10010, $ConfigMSpeedX3, $ConfigMSpeedY, "ConfigImagePen02");
			SetAlias("Config1a_MSpeed02", "Config1a_MSpeed02");
		//▽幅
		$ConfigMSpeedH=ImageHorizon("Config1a_MSpeed");
		$ConfigMSpeedV=ImageVertical("Config1a_MSpeed");

		//▼定義「ウィンドウ透過度」
		$ConfigMTransX=638;//固定
		$ConfigMTransY=225;
		$ConfigMTransX2=831;//固定
		$ConfigMTransY2=225;
		$ConfigMTransBaseX=630;//固定
		$ConfigMTransBaseX2=839;//固定
		$ConfigMTransBar=$ConfigMTransY-5;
		$pos=1000*(#LOCAL_window_fade/1000);

		CreateScrollbar("Config1a_MTrans",10050,$ConfigMTransX,$ConfigMTransY,$ConfigMTransX2,$ConfigMTransY2,$pos,HORIZON,"ConfigImagePen00");
		Request("Config1a_MTrans", Erase);
		SetScrollSpeed("Config1a_MTrans", $ConfigScrollSpeed);
			//▼アイコンアニメーションの当たり判定
			CreateChoice("Config1a_MTrans_Pro01");
			SetAlias("Config1a_MTrans_Pro01", "Config1a_MTrans_Pro01");
			CreateTexture("@Config1a_MTrans_Pro01/MouseUsual/hit",0,$ConfigMTransX,$ConfigMTransY,"ConfigImageLine");
			CreateProcess("@Config1a_MTrans_Pro01/MouseOver/button", 10010, 0, 0, "ConfigMTransProcessOPEN");
			CreateProcess("@Config1a_MTrans_Pro01/MouseLeave/button", 10010, 0, 0, "ConfigMTransProcessSTOP");
			//CreateTexture("@Config1a_MTrans_Pro01/MouseOver/bar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
			//CreateSound("@Config1a_MTrans_Pro01/MouseOver/sound", SE, $ConfigSound_over);
			//CreateSound("@Config1a_MTrans_Pro01_sound", SE, $ConfigSound_click);
			//Request("@Config1a_MTrans_Pro01/MouseOver/bar", MulRender);
			Request("@Config1a_MTrans_Pro01/MouseUsual/hit", Erase);
			//▼カーソル定義
			$ConfigMTransX3=($pos/1000)*($ConfigMTransX2-$ConfigMTransX)+($ConfigMTransX-1);
			CreateTexture("Config1f_MTrans01", 10010, $ConfigMTransX3, $ConfigMTransY, "ConfigImagePen01");
			SetAlias("Config1f_MTrans01", "Config1f_MTrans01");
			CreateTexture("Config1a_MTrans02", 10010, $ConfigMTransX3, $ConfigMTransY, "ConfigImagePen02");
			SetAlias("Config1a_MTrans02", "Config1a_MTrans02");
		//▽幅
		$ConfigMTransH=ImageHorizon("Config1a_MTrans");
		$ConfigMTransV=ImageVertical("Config1a_MTrans");

		//▼定義「選択肢後の自動文字送り＆スキップを解除」
		$ConfigCSkipX=774;//ほぼ固定
		$ConfigCSkipY=254;
		$ConfigCSkipX2=835;//ほぼ固定
		$ConfigCSkipY2=254;
		$ConfigCSkipOnBar=$ConfigCSkipY-2;
		$ConfigCSkipOffBar=$ConfigCSkipY-2;
		CreateChoice("Config1a_CSkipON");
		SetAlias("Config1a_CSkipON", "Config1a_CSkipON");
//		CreateTexture("Config1f_CSkipON01", 10010, $ConfigCSkipX, $ConfigCSkipY, "ConfigImageCheck01");
		CreateTexture("Config1a_CSkipON02", 10100, $ConfigCSkipX, $ConfigCSkipY, "ConfigImageCheck03");
		CreateTexture("@Config1a_CSkipON/MouseUsual/hit", 10010, $ConfigCSkipX, $ConfigCSkipY, "ConfigImageCheck01");
		CreateTexture("@Config1a_CSkipON/MouseOver/icon", 10010, $ConfigCSkipX, $ConfigCSkipY, "ConfigImageCheck02");
		CreateTexture("@Config1a_CSkipON/MouseClick/icon", 10010, $ConfigCSkipX, $ConfigCSkipY, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CSkipON/MouseOver/button", 10010, 0, 0, "ConfigCSkipONProcessOPEN");
		//CreateProcess("@Config1a_CSkipON/MouseLeave/button", 10010, 0, 0, "ConfigCSkipONProcessSTOP");
		//CreateSound("@Config1a_CSkipON/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CSkipON/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CSkipON/MouseUsual/hit", Erase);
			$ConfigCSkipOnH=ImageHorizon("Config1a_CSkipON/MouseUsual/hit");
			$ConfigCSkipOnV=ImageVertical("Config1a_CSkipON/MouseUsual/hit");
		CreateChoice("Config1a_CSkipOFF");
		SetAlias("Config1a_CSkipOFF", "Config1a_CSkipOFF");
//		CreateTexture("Config1f_CSkipOFF01", 10010, $ConfigCSkipX2, $ConfigCSkipY2, "ConfigImageCheck01");
		CreateTexture("Config1a_CSkipOFF02", 10100, $ConfigCSkipX2, $ConfigCSkipY2, "ConfigImageCheck03");
		CreateTexture("@Config1a_CSkipOFF/MouseUsual/hit", 10010, $ConfigCSkipX2, $ConfigCSkipY2, "ConfigImageCheck01");
		CreateTexture("@Config1a_CSkipOFF/MouseOver/icon", 10010, $ConfigCSkipX2, $ConfigCSkipY2, "ConfigImageCheck02");
		CreateTexture("@Config1a_CSkipOFF/MouseClick/icon", 10010, $ConfigCSkipX2, $ConfigCSkipY2, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CSkipOFF/MouseOver/button", 10010, 0, 0, "ConfigCSkipOFFProcessOPEN");
		//CreateProcess("@Config1a_CSkipOFF/MouseLeave/button", 10010, 0, 0, "ConfigCSkipOFFProcessSTOP");
		//CreateSound("@Config1a_CSkipOFF/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CSkipOFF/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CSkipOFF/MouseUsual/hit", Erase);
			$ConfigCSkipOffH=ImageHorizon("Config1a_CSkipOFF/MouseUsual/hit");
			$ConfigCSkipOffV=ImageVertical("Config1a_CSkipOFF/MouseUsual/hit");
		//CreateTexture("Config1a_CSkipBar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//SetAlias("Config1a_CSkipBar", "Config1a_CSkipBar");
			//Request("Config1a_CSkipBar", MulRender);

		//▼定義「未読時でもスキップする？」
		$ConfigASkipX=774;//ほぼ固定
		$ConfigASkipY=286;
		$ConfigASkipX2=835;//ほぼ固定
		$ConfigASkipY2=286;
		$ConfigASkipOnBar=$ConfigASkipY-2;
		$ConfigASkipOffBar=$ConfigASkipY-2;
		CreateChoice("Config1a_ASkipON");
		SetAlias("Config1a_ASkipON", "Config1a_ASkipON");
//		CreateTexture("Config1f_ASkipON01", 10010, $ConfigASkipX, $ConfigASkipY, "ConfigImageCheck01");
		CreateTexture("Config1a_ASkipON02", 10100, $ConfigASkipX, $ConfigASkipY, "ConfigImageCheck03");
		CreateTexture("@Config1a_ASkipON/MouseUsual/hit", 10010, $ConfigASkipX, $ConfigASkipY, "ConfigImageCheck01");
		CreateTexture("@Config1a_ASkipON/MouseOver/icon", 10010, $ConfigASkipX, $ConfigASkipY, "ConfigImageCheck02");
		CreateTexture("@Config1a_ASkipON/MouseClick/icon", 10010, $ConfigASkipX, $ConfigASkipY, "ConfigImageCheck02");
		CreateProcess("@Config1a_ASkipON/MouseOver/button", 10010, 0, 0, "ConfigASkipONProcessOPEN");
		CreateProcess("@Config1a_ASkipON/MouseLeave/button", 10010, 0, 0, "ConfigASkipONProcessSTOP");
		//CreateSound("@Config1a_ASkipON/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_ASkipON/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_ASkipON/MouseUsual/hit", Erase);
			$ConfigASkipOnH=ImageHorizon("Config1a_ASkipON/MouseUsual/hit");
			$ConfigASkipOnV=ImageVertical("Config1a_ASkipON/MouseUsual/hit");
		CreateChoice("Config1a_ASkipOFF");
		SetAlias("Config1a_ASkipOFF", "Config1a_ASkipOFF");
//		CreateTexture("Config1f_ASkipOFF01", 10010, $ConfigASkipX2, $ConfigASkipY2, "ConfigImageCheck01");
		CreateTexture("Config1a_ASkipOFF02", 10100, $ConfigASkipX2, $ConfigASkipY2, "ConfigImageCheck03");
		CreateTexture("@Config1a_ASkipOFF/MouseUsual/hit", 10010, $ConfigASkipX2, $ConfigASkipY2, "ConfigImageCheck01");
		CreateTexture("@Config1a_ASkipOFF/MouseOver/icon", 10010, $ConfigASkipX2, $ConfigASkipY2, "ConfigImageCheck02");
		CreateTexture("@Config1a_ASkipOFF/MouseClick/icon", 10010, $ConfigASkipX2, $ConfigASkipY2, "ConfigImageCheck02");
		//CreateProcess("@Config1a_ASkipOFF/MouseOver/button", 10010, 0, 0, "ConfigASkipOFFProcessOPEN");
		//CreateProcess("@Config1a_ASkipOFF/MouseLeave/button", 10010, 0, 0, "ConfigASkipOFFProcessSTOP");
		//CreateSound("@Config1a_ASkipOFF/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_ASkipOFF/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_ASkipOFF/MouseUsual/hit", Erase);
			$ConfigASkipOffH=ImageHorizon("Config1a_ASkipOFF/MouseUsual/hit");
			$ConfigASkipOffV=ImageVertical("Config1a_ASkipOFF/MouseUsual/hit");
		//CreateTexture("Config1a_ASkipBar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//SetAlias("Config1a_ASkipBar", "Config1a_ASkipBar");
			//Request("Config1a_ASkipBar", MulRender);

		//▼定義「文字送り時の音声設定」
		$ConfigKVoiceX=774;//ほぼ固定
		$ConfigKVoiceY=318;
		$ConfigKVoiceX2=835;//ほぼ固定
		$ConfigKVoiceY2=318;
		$ConfigKVoiceOnBar=$ConfigKVoiceY-2;
		$ConfigKVoiceOffBar=$ConfigKVoiceY-2;
		CreateChoice("Config1a_KVoiceON");
		SetAlias("Config1a_KVoiceON", "Config1a_KVoiceON");
//		CreateTexture("Config1f_KVoiceON01", 10010, $ConfigKVoiceX, $ConfigKVoiceY, "ConfigImageCheck01");
		CreateTexture("Config1a_KVoiceON02", 10100, $ConfigKVoiceX, $ConfigKVoiceY, "ConfigImageCheck03");
		CreateTexture("@Config1a_KVoiceON/MouseUsual/hit", 10010, $ConfigKVoiceX, $ConfigKVoiceY, "ConfigImageCheck01");
		CreateTexture("@Config1a_KVoiceON/MouseOver/icon", 10010, $ConfigKVoiceX, $ConfigKVoiceY, "ConfigImageCheck02");
		CreateTexture("@Config1a_KVoiceON/MouseClick/icon", 10010, $ConfigKVoiceX, $ConfigKVoiceY, "ConfigImageCheck02");
		//CreateProcess("@Config1a_KVoiceON/MouseOver/button", 10010, 0, 0, "ConfigKVoiceONProcessOPEN");
		//CreateProcess("@Config1a_KVoiceON/MouseLeave/button", 10010, 0, 0, "ConfigKVoiceONProcessSTOP");
		//CreateSound("@Config1a_KVoiceON/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_KVoiceON/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_KVoiceON/MouseUsual/hit", Erase);
			$ConfigKVoiceOnH=ImageHorizon("Config1a_KVoiceON/MouseUsual/hit");
			$ConfigKVoiceOnV=ImageVertical("Config1a_KVoiceON/MouseUsual/hit");
		CreateChoice("Config1a_KVoiceOFF");
		SetAlias("Config1a_KVoiceOFF", "Config1a_KVoiceOFF");
//		CreateTexture("Config1f_KVoiceOFF01", 10010, $ConfigKVoiceX2, $ConfigKVoiceY2, "ConfigImageCheck01");
		CreateTexture("Config1a_KVoiceOFF02", 10100, $ConfigKVoiceX2, $ConfigKVoiceY2, "ConfigImageCheck03");
		CreateTexture("@Config1a_KVoiceOFF/MouseUsual/hit", 10010, $ConfigKVoiceX2, $ConfigKVoiceY2, "ConfigImageCheck01");
		CreateTexture("@Config1a_KVoiceOFF/MouseOver/icon", 10010, $ConfigKVoiceX2, $ConfigKVoiceY2, "ConfigImageCheck02");
		CreateTexture("@Config1a_KVoiceOFF/MouseClick/icon", 10010, $ConfigKVoiceX2, $ConfigKVoiceY2, "ConfigImageCheck02");
		//CreateProcess("@Config1a_KVoiceOFF/MouseOver/button", 10010, 0, 0, "ConfigKVoiceOFFProcessOPEN");
		//CreateProcess("@Config1a_KVoiceOFF/MouseLeave/button", 10010, 0, 0, "ConfigKVoiceOFFProcessSTOP");
		//CreateSound("@Config1a_KVoiceOFF/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_KVoiceOFF/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_KVoiceOFF/MouseUsual/hit", Erase);
			$ConfigKVoiceOffH=ImageHorizon("Config1a_KVoiceOFF/MouseUsual/hit");
			$ConfigKVoiceOffV=ImageVertical("Config1a_KVoiceOFF/MouseUsual/hit");
		//CreateTexture("Config1a_KVoiceBar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//SetAlias("Config1a_KVoiceBar", "Config1a_KVoiceBar");
			//Request("Config1a_KVoiceBar", MulRender);

		//▼定義「自動文字送りスピード」
		$ConfigASpeedX=638;//固定
		$ConfigASpeedY=353;
		$ConfigASpeedX2=831;//固定
		$ConfigASpeedY2=353;
		$ConfigASpeedBaseX=630;//固定
		$ConfigASpeedBaseX2=839;//固定
		$ConfigASpeedBar=$ConfigASpeedY-5;
		$pos=1000*(1-(#SYSTEM_auto_wait_per_character/200));

		CreateScrollbar("Config1a_ASpeed",10050,$ConfigASpeedX,$ConfigASpeedY,$ConfigASpeedX2,$ConfigASpeedY2,$pos,HORIZON,"ConfigImagePen00");
		Request("Config1a_ASpeed", Erase);
		SetScrollSpeed("Config1a_ASpeed", $ConfigScrollSpeed);
			//▼アイコンアニメーションの当たり判定
			CreateChoice("Config1a_ASpeed_Pro01");
			SetAlias("Config1a_ASpeed_Pro01", "Config1a_ASpeed_Pro01");
			CreateTexture("@Config1a_ASpeed_Pro01/MouseUsual/hit",0,$ConfigASpeedX,$ConfigASpeedY,"ConfigImageLine");
			CreateProcess("@Config1a_ASpeed_Pro01/MouseOver/button", 10010, 0, 0, "ConfigASpeedProcessOPEN");
			CreateProcess("@Config1a_ASpeed_Pro01/MouseLeave/button", 10010, 0, 0, "ConfigASpeedProcessSTOP");
			//CreateTexture("@Config1a_ASpeed_Pro01/MouseOver/bar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
			//CreateSound("@Config1a_ASpeed_Pro01/MouseOver/sound", SE, $ConfigSound_over);
			//CreateSound("@Config1a_ASpeed_Pro01_sound", SE, $ConfigSound_click);
			//Request("@Config1a_ASpeed_Pro01/MouseOver/bar", MulRender);
			Request("@Config1a_ASpeed_Pro01/MouseUsual/hit", Erase);
			//▼カーソル定義
			$ConfigASpeedX3=($pos/1000)*($ConfigASpeedX2-$ConfigASpeedX)+($ConfigASpeedX-1);
			CreateTexture("Config1f_ASpeed01", 10010, $ConfigASpeedX3, $ConfigASpeedY, "ConfigImagePen01");
			SetAlias("Config1f_ASpeed01", "Config1f_ASpeed01");
			CreateTexture("Config1a_ASpeed02", 10010, $ConfigASpeedX3, $ConfigASpeedY, "ConfigImagePen02");
			SetAlias("Config1a_ASpeed02", "Config1a_ASpeed02");
			//▽幅
			$ConfigASpeedH=ImageHorizon("Config1a_ASpeed");
			$ConfigASpeedV=ImageVertical("Config1a_ASpeed");

		//▼定義「自動文字送り時の音声設定」
		$ConfigSVoiceX=610;
		$ConfigSVoiceY=382;
		$ConfigSVoiceX2=747;
		$ConfigSVoiceY2=382;
		$ConfigSVoiceOnBar=$ConfigSVoiceY-2;
		$ConfigSVoiceOffBar=$ConfigSVoiceY-2;
		CreateChoice("Config1a_SVoiceON");
		SetAlias("Config1a_SVoiceON", "Config1a_SVoiceON");
//		CreateTexture("Config1f_SVoiceON01", 10010, $ConfigSVoiceX, $ConfigSVoiceY, "ConfigImageCheck01");
		CreateTexture("Config1a_SVoiceON02", 10100, $ConfigSVoiceX, $ConfigSVoiceY, "ConfigImageCheck03");
		CreateTexture("@Config1a_SVoiceON/MouseUsual/hit", 10010, $ConfigSVoiceX, $ConfigSVoiceY, "ConfigImageCheck01");
		CreateTexture("@Config1a_SVoiceON/MouseOver/icon", 10010, $ConfigSVoiceX, $ConfigSVoiceY, "ConfigImageCheck02");
		CreateTexture("@Config1a_SVoiceON/MouseClick/icon", 10010, $ConfigSVoiceX, $ConfigSVoiceY, "ConfigImageCheck02");
		//CreateProcess("@Config1a_SVoiceON/MouseOver/button", 10010, 0, 0, "ConfigSVoiceONProcessOPEN");
		//CreateProcess("@Config1a_SVoiceON/MouseLeave/button", 10010, 0, 0, "ConfigSVoiceONProcessSTOP");
		//CreateSound("@Config1a_SVoiceON/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_SVoiceON/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_SVoiceON/MouseUsual/hit", Erase);
			$ConfigSVoiceOnH=ImageHorizon("Config1a_SVoiceON/MouseUsual/hit");
			$ConfigSVoiceOnV=ImageVertical("Config1a_SVoiceON/MouseUsual/hit");
		CreateChoice("Config1a_SVoiceOFF");
		SetAlias("Config1a_SVoiceOFF", "Config1a_SVoiceOFF");
//		CreateTexture("Config1f_SVoiceOFF01", 10010, $ConfigSVoiceX2, $ConfigSVoiceY2, "ConfigImageCheck01");
		CreateTexture("Config1a_SVoiceOFF02", 10100, $ConfigSVoiceX2, $ConfigSVoiceY2, "ConfigImageCheck03");
		CreateTexture("@Config1a_SVoiceOFF/MouseUsual/hit", 10010, $ConfigSVoiceX2, $ConfigSVoiceY2, "ConfigImageCheck01");
		CreateTexture("@Config1a_SVoiceOFF/MouseOver/icon", 10010, $ConfigSVoiceX2, $ConfigSVoiceY2, "ConfigImageCheck02");
		CreateTexture("@Config1a_SVoiceOFF/MouseClick/icon", 10010, $ConfigSVoiceX2, $ConfigSVoiceY2, "ConfigImageCheck02");
		//CreateProcess("@Config1a_SVoiceOFF/MouseOver/button", 10010, 0, 0, "ConfigSVoiceOFFProcessOPEN");
		//CreateProcess("@Config1a_SVoiceOFF/MouseLeave/button", 10010, 0, 0, "ConfigSVoiceOFFProcessSTOP");
		//CreateSound("@Config1a_SVoiceOFF/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_SVoiceOFF/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_SVoiceOFF/MouseUsual/hit", Erase);
			$ConfigSVoiceOffH=ImageHorizon("Config1a_SVoiceOFF/MouseUsual/hit");
			$ConfigSVoiceOffV=ImageVertical("Config1a_SVoiceOFF/MouseUsual/hit");
		//CreateTexture("Config1a_SVoiceBar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//SetAlias("Config1a_SVoiceBar", "Config1a_SVoiceBar");
			//Request("Config1a_SVoiceBar", MulRender);

		//▼定義「ＢＧＭを再生する」
		$ConfigBPlayX=774;//ほぼ固定
		$ConfigBPlayY=478;
		$ConfigBPlayX2=835;//ほぼ固定
		$ConfigBPlayY2=478;
		$ConfigBPlayOnBar=$ConfigBPlayY-2;
		$ConfigBPlayOffBar=$ConfigBPlayY-2;
		CreateChoice("Config1a_BPlayON");
		SetAlias("Config1a_BPlayON", "Config1a_BPlayON");
//		CreateTexture("Config1f_BPlayON01", 10010, $ConfigBPlayX, $ConfigBPlayY, "ConfigImageCheck01");
		CreateTexture("Config1a_BPlayON02", 10100, $ConfigBPlayX, $ConfigBPlayY, "ConfigImageCheck03");
		CreateTexture("@Config1a_BPlayON/MouseUsual/hit", 10010, $ConfigBPlayX, $ConfigBPlayY, "ConfigImageCheck01");
		CreateTexture("@Config1a_BPlayON/MouseOver/icon", 10010, $ConfigBPlayX, $ConfigBPlayY, "ConfigImageCheck02");
		CreateTexture("@Config1a_BPlayON/MouseClick/icon", 10010, $ConfigBPlayX, $ConfigBPlayY, "ConfigImageCheck02");
		//CreateProcess("@Config1a_BPlayON/MouseOver/button", 10010, 0, 0, "ConfigBPlayONProcessOPEN");
		//CreateProcess("@Config1a_BPlayON/MouseLeave/button", 10010, 0, 0, "ConfigBPlayONProcessSTOP");
		//CreateSound("@Config1a_BPlayON/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_BPlayON/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_BPlayON/MouseUsual/hit", Erase);
			$ConfigBPlayOnH=ImageHorizon("Config1a_BPlayON/MouseUsual/hit");
			$ConfigBPlayOnV=ImageVertical("Config1a_BPlayON/MouseUsual/hit");
		CreateChoice("Config1a_BPlayOFF");
		SetAlias("Config1a_BPlayOFF", "Config1a_BPlayOFF");
//		CreateTexture("Config1f_BPlayOFF01", 10010, $ConfigBPlayX2, $ConfigBPlayY2, "ConfigImageCheck01");
		CreateTexture("Config1a_BPlayOFF02", 10100, $ConfigBPlayX2, $ConfigBPlayY2, "ConfigImageCheck03");
		CreateTexture("@Config1a_BPlayOFF/MouseUsual/hit", 10010, $ConfigBPlayX2, $ConfigBPlayY2, "ConfigImageCheck01");
		CreateTexture("@Config1a_BPlayOFF/MouseOver/icon", 10010, $ConfigBPlayX2, $ConfigBPlayY2, "ConfigImageCheck02");
		CreateTexture("@Config1a_BPlayOFF/MouseClick/icon", 10010, $ConfigBPlayX2, $ConfigBPlayY2, "ConfigImageCheck02");
		//CreateProcess("@Config1a_BPlayOFF/MouseOver/button", 10010, 0, 0, "ConfigBPlayOFFProcessOPEN");
		//CreateProcess("@Config1a_BPlayOFF/MouseLeave/button", 10010, 0, 0, "ConfigBPlayOFFProcessSTOP");
		//CreateSound("@Config1a_BPlayOFF/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_BPlayOFF/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_BPlayOFF/MouseUsual/hit", Erase);
			$ConfigBPlayOffH=ImageHorizon("Config1a_BPlayOFF/MouseUsual/hit");
			$ConfigBPlayOffV=ImageVertical("Config1a_BPlayOFF/MouseUsual/hit");
		//CreateTexture("Config1a_BPlayBar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//SetAlias("Config1a_BPlayBar", "Config1a_BPlayBar");
			//Request("Config1a_BPlayBar", MulRender);

		//▼定義「ＳＥを再生する」
		$ConfigSPlayX=774;//ほぼ固定
		$ConfigSPlayY=542;
		$ConfigSPlayX2=835;//ほぼ固定
		$ConfigSPlayY2=542;
		$ConfigSPlayOnBar=$ConfigSPlayY-2;
		$ConfigSPlayOffBar=$ConfigSPlayY-2;
		CreateChoice("Config1a_SPlayON");
		SetAlias("Config1a_SPlayON", "Config1a_SPlayON");
//		CreateTexture("Config1f_SPlayON01", 10010, $ConfigSPlayX, $ConfigSPlayY, "ConfigImageCheck01");
		CreateTexture("Config1a_SPlayON02", 10100, $ConfigSPlayX, $ConfigSPlayY, "ConfigImageCheck03");
		CreateTexture("@Config1a_SPlayON/MouseUsual/hit", 10010, $ConfigSPlayX, $ConfigSPlayY, "ConfigImageCheck01");
		CreateTexture("@Config1a_SPlayON/MouseOver/icon", 10010, $ConfigSPlayX, $ConfigSPlayY, "ConfigImageCheck02");
		CreateTexture("@Config1a_SPlayON/MouseClick/icon", 10010, $ConfigSPlayX, $ConfigSPlayY, "ConfigImageCheck02");
		//CreateProcess("@Config1a_SPlayON/MouseOver/button", 10010, 0, 0, "ConfigSPlayONProcessOPEN");
		//CreateProcess("@Config1a_SPlayON/MouseLeave/button", 10010, 0, 0, "ConfigSPlayONProcessSTOP");
		//CreateSound("@Config1a_SPlayON/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_SPlayON/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_SPlayON/MouseUsual/hit", Erase);
			$ConfigSPlayOnH=ImageHorizon("Config1a_SPlayON/MouseUsual/hit");
			$ConfigSPlayOnV=ImageVertical("Config1a_SPlayON/MouseUsual/hit");
		CreateChoice("Config1a_SPlayOFF");
		SetAlias("Config1a_SPlayOFF", "Config1a_SPlayOFF");
//		CreateTexture("Config1f_SPlayOFF01", 10010, $ConfigSPlayX2, $ConfigSPlayY2, "ConfigImageCheck01");
		CreateTexture("Config1a_SPlayOFF02", 10100, $ConfigSPlayX2, $ConfigSPlayY2, "ConfigImageCheck03");
		CreateTexture("@Config1a_SPlayOFF/MouseUsual/hit", 10010, $ConfigSPlayX2, $ConfigSPlayY2, "ConfigImageCheck01");
		CreateTexture("@Config1a_SPlayOFF/MouseOver/icon", 10010, $ConfigSPlayX2, $ConfigSPlayY2, "ConfigImageCheck02");
		CreateTexture("@Config1a_SPlayOFF/MouseClick/icon", 10010, $ConfigSPlayX2, $ConfigSPlayY2, "ConfigImageCheck02");
		//CreateProcess("@Config1a_SPlayOFF/MouseOver/button", 10010, 0, 0, "ConfigSPlayOFFProcessOPEN");
		//CreateProcess("@Config1a_SPlayOFF/MouseLeave/button", 10010, 0, 0, "ConfigSPlayOFFProcessSTOP");
		//CreateSound("@Config1a_SPlayOFF/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_SPlayOFF/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_SPlayOFF/MouseUsual/hit", Erase);
			$ConfigSPlayOffH=ImageHorizon("Config1a_SPlayOFF/MouseUsual/hit");
			$ConfigSPlayOffV=ImageVertical("Config1a_SPlayOFF/MouseUsual/hit");
		//CreateTexture("Config1a_SPlayBar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//SetAlias("Config1a_SPlayBar", "Config1a_SPlayBar");
			//Request("Config1a_SPlayBar", MulRender);

		//▼定義「音声を再生する」
		$ConfigVPlayX=774;//ほぼ固定
		$ConfigVPlayY=606;
		$ConfigVPlayX2=835;//ほぼ固定
		$ConfigVPlayY2=606;
		$ConfigVPlayOnBar=$ConfigVPlayY-2;
		$ConfigVPlayOffBar=$ConfigVPlayY-2;
		CreateChoice("Config1a_VPlayON");
		SetAlias("Config1a_VPlayON", "Config1a_VPlayON");
//		CreateTexture("Config1f_VPlayON01", 10010, $ConfigVPlayX, $ConfigVPlayY, "ConfigImageCheck01");
		CreateTexture("Config1a_VPlayON02", 10100, $ConfigVPlayX, $ConfigVPlayY, "ConfigImageCheck03");
		CreateTexture("@Config1a_VPlayON/MouseUsual/hit", 10010, $ConfigVPlayX, $ConfigVPlayY, "ConfigImageCheck01");
		CreateTexture("@Config1a_VPlayON/MouseOver/icon", 10010, $ConfigVPlayX, $ConfigVPlayY, "ConfigImageCheck02");
		CreateTexture("@Config1a_VPlayON/MouseClick/icon", 10010, $ConfigVPlayX, $ConfigVPlayY, "ConfigImageCheck02");
		//CreateProcess("@Config1a_VPlayON/MouseOver/button", 10010, 0, 0, "ConfigVPlayONProcessOPEN");
		//CreateProcess("@Config1a_VPlayON/MouseLeave/button", 10010, 0, 0, "ConfigVPlayONProcessSTOP");
		//CreateSound("@Config1a_VPlayON/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_VPlayON/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_VPlayON/MouseUsual/hit", Erase);
			$ConfigVPlayOnH=ImageHorizon("Config1a_VPlayON/MouseUsual/hit");
			$ConfigVPlayOnV=ImageVertical("Config1a_VPlayON/MouseUsual/hit");
		CreateChoice("Config1a_VPlayOFF");
		SetAlias("Config1a_VPlayOFF", "Config1a_VPlayOFF");
//		CreateTexture("Config1f_VPlayOFF01", 10010, $ConfigVPlayX2, $ConfigVPlayY2, "ConfigImageCheck01");
		CreateTexture("Config1a_VPlayOFF02", 10100, $ConfigVPlayX2, $ConfigVPlayY2, "ConfigImageCheck03");
		CreateTexture("@Config1a_VPlayOFF/MouseUsual/hit", 10010, $ConfigVPlayX2, $ConfigVPlayY2, "ConfigImageCheck01");
		CreateTexture("@Config1a_VPlayOFF/MouseOver/icon", 10010, $ConfigVPlayX2, $ConfigVPlayY2, "ConfigImageCheck02");
		CreateTexture("@Config1a_VPlayOFF/MouseClick/icon", 10010, $ConfigVPlayX2, $ConfigVPlayY2, "ConfigImageCheck02");
		//CreateProcess("@Config1a_VPlayOFF/MouseOver/button", 10010, 0, 0, "ConfigVPlayOFFProcessOPEN");
		//CreateProcess("@Config1a_VPlayOFF/MouseLeave/button", 10010, 0, 0, "ConfigVPlayOFFProcessSTOP");
		//CreateSound("@Config1a_VPlayOFF/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_VPlayOFF/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_VPlayOFF/MouseUsual/hit", Erase);
			$ConfigVPlayOffH=ImageHorizon("Config1a_VPlayOFF/MouseUsual/hit");
			$ConfigVPlayOffV=ImageVertical("Config1a_VPlayOFF/MouseUsual/hit");
		//CreateTexture("Config1a_VPlayBar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//SetAlias("Config1a_VPlayBar", "Config1a_VPlayBar");
			//Request("Config1a_VPlayBar", MulRender);

		//▼定義「ＢＧＭボリューム」
		$ConfigBVolumeX=638;//固定
		$ConfigBVolumeY=513;
		$ConfigBVolumeX2=831;//固定
		$ConfigBVolumeY2=513;
		$ConfigBVolumeBaseX=630;//固定
		$ConfigBVolumeBaseX2=839;//固定
		$ConfigBVolumeBar=$ConfigBVolumeY-5;
		$pos=1000*(#SYSTEM_sound_volume_bgm/1000);

		CreateScrollbar("Config1a_BVolume",10050,$ConfigBVolumeX,$ConfigBVolumeY,$ConfigBVolumeX2,$ConfigBVolumeY2,$pos,HORIZON,"ConfigImagePen00");
		Request("Config1a_BVolume", Erase);
		SetScrollSpeed("Config1a_BVolume", $ConfigScrollSpeed);
			//▼アイコンアニメーションの当たり判定
			CreateChoice("Config1a_BVolume_Pro01");
			SetAlias("Config1a_BVolume_Pro01", "Config1a_BVolume_Pro01");
			CreateTexture("@Config1a_BVolume_Pro01/MouseUsual/hit",0,$ConfigBVolumeX,$ConfigBVolumeY,"ConfigImageLine");
			CreateProcess("@Config1a_BVolume_Pro01/MouseOver/button", 10010, 0, 0, "ConfigBVolumeProcessOPEN");
			CreateProcess("@Config1a_BVolume_Pro01/MouseLeave/button", 10010, 0, 0, "ConfigBVolumeProcessSTOP");
			//CreateTexture("@Config1a_BVolume_Pro01/MouseOver/bar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
			//CreateSound("@Config1a_BVolume_Pro01/MouseOver/sound", SE, $ConfigSound_over);
			//CreateSound("@Config1a_BVolume_Pro01_sound", SE, $ConfigSound_click);
			//Request("@Config1a_BVolume_Pro01/MouseOver/bar", MulRender);
			Request("@Config1a_BVolume_Pro01/MouseUsual/hit", Erase);
			//▼カーソル定義
			$ConfigBVolumeX3=($pos/1000)*($ConfigBVolumeX2-$ConfigBVolumeX)+($ConfigBVolumeX-1);
			CreateTexture("Config1f_BVolume01", 10010, $ConfigBVolumeX3, $ConfigBVolumeY, "ConfigImagePen01");
			SetAlias("Config1f_BVolume01", "Config1f_BVolume01");
			CreateTexture("Config1a_BVolume02", 10010, $ConfigBVolumeX3, $ConfigBVolumeY, "ConfigImagePen02");
			SetAlias("Config1a_BVolume02", "Config1a_BVolume02");
			//▽幅
			$ConfigBVolumeH=ImageHorizon("Config1a_BVolume");
			$ConfigBVolumeV=ImageVertical("Config1a_BVolume");

		//▼定義「ＳＥボリューム」
		$ConfigSVolumeX=638;//固定
		$ConfigSVolumeY=577;
		$ConfigSVolumeX2=831;//固定
		$ConfigSVolumeY2=577;
		$ConfigSVolumeBaseX=630;//固定
		$ConfigSVolumeBaseX2=839;//固定
		$ConfigSVolumeBar=$ConfigSVolumeY-5;
		$pos=1000*(#SYSTEM_sound_volume_se/1000);

		CreateScrollbar("Config1a_SVolume",10050,$ConfigSVolumeX,$ConfigSVolumeY,$ConfigSVolumeX2,$ConfigSVolumeY2,$pos,HORIZON,"ConfigImagePen00");
		Request("Config1a_SVolume", Erase);
		SetScrollSpeed("Config1a_SVolume", $ConfigScrollSpeed);
			//▼アイコンアニメーションの当たり判定
			CreateChoice("Config1a_SVolume_Pro01");
			SetAlias("Config1a_SVolume_Pro01", "Config1a_SVolume_Pro01");
			CreateTexture("@Config1a_SVolume_Pro01/MouseUsual/hit",0,$ConfigSVolumeX,$ConfigSVolumeY,"ConfigImageLine");
			CreateProcess("@Config1a_SVolume_Pro01/MouseOver/button", 10010, 0, 0, "ConfigSVolumeProcessOPEN");
			CreateProcess("@Config1a_SVolume_Pro01/MouseLeave/button", 10010, 0, 0, "ConfigSVolumeProcessSTOP");
			//CreateTexture("@Config1a_SVolume_Pro01/MouseOver/bar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
			//CreateSound("@Config1a_SVolume_Pro01/MouseOver/sound", SE, $ConfigSound_over);
			//CreateSound("@Config1a_SVolume_Pro01_sound", SE, $ConfigSound_click);
			//Request("@Config1a_SVolume_Pro01/MouseOver/bar", MulRender);
			Request("@Config1a_SVolume_Pro01/MouseUsual/hit", Erase);
			//▼カーソル定義
			$ConfigSVolumeX3=($pos/1000)*($ConfigSVolumeX2-$ConfigSVolumeX)+($ConfigSVolumeX-1);
			$PreConfigMSX=$ConfigSVolumeX3;
			CreateTexture("Config1f_SVolume01", 10010, $ConfigSVolumeX3, $ConfigSVolumeY, "ConfigImagePen01");
			SetAlias("Config1f_SVolume01", "Config1f_SVolume01");
			CreateTexture("Config1a_SVolume02", 10010, $ConfigSVolumeX3, $ConfigSVolumeY, "ConfigImagePen02");
			SetAlias("Config1a_SVolume02", "Config1a_SVolume02");
			//▽幅
			$ConfigSVolumeH=ImageHorizon("Config1a_SVolume");
			$ConfigSVolumeV=ImageVertical("Config1a_SVolume");

		//▼定義「音声ボリューム」
		$ConfigVVolumeX=638;//固定
		$ConfigVVolumeY=641;
		$ConfigVVolumeX2=831;//固定
		$ConfigVVolumeY2=641;
		$ConfigVVolumeBaseX=630;//固定
		$ConfigVVolumeBaseX2=839;//固定
		$ConfigVVolumeBar=$ConfigVVolumeY-5;
		$pos=1000*(#SYSTEM_sound_volume_voice/1000);

		CreateScrollbar("Config1a_VVolume",10050,$ConfigVVolumeX,$ConfigVVolumeY,$ConfigVVolumeX2,$ConfigVVolumeY2,$pos,HORIZON,"ConfigImagePen00");
		Request("Config1a_VVolume", Erase);
		SetScrollSpeed("Config1a_VVolume", $ConfigScrollSpeed);
			//▼アイコンアニメーションの当たり判定
			CreateChoice("Config1a_VVolume_Pro01");
			SetAlias("Config1a_VVolume_Pro01", "Config1a_VVolume_Pro01");
			CreateTexture("@Config1a_VVolume_Pro01/MouseUsual/hit",0,$ConfigVVolumeX,$ConfigVVolumeY,"ConfigImageLine");
			CreateProcess("@Config1a_VVolume_Pro01/MouseOver/button", 10010, 0, 0, "ConfigVVolumeProcessOPEN");
			CreateProcess("@Config1a_VVolume_Pro01/MouseLeave/button", 10010, 0, 0, "ConfigVVolumeProcessSTOP");
			//CreateTexture("@Config1a_VVolume_Pro01/MouseOver/bar", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
			//CreateSound("@Config1a_VVolume_Pro01/MouseOver/sound", SE, $ConfigSound_over);
			//CreateSound("@Config1a_VVolume_Pro01_sound", SE, $ConfigSound_click);
			//Request("@Config1a_VVolume_Pro01/MouseOver/bar", MulRender);
			Request("@Config1a_VVolume_Pro01/MouseUsual/hit", Erase);
			//▼カーソル定義
			$ConfigVVolumeX3=($pos/1000)*($ConfigVVolumeX2-$ConfigVVolumeX)+($ConfigVVolumeX-1);
			$PreConfigMSX=$ConfigVVolumeX3;
			CreateTexture("Config1f_VVolume01", 10010, $ConfigVVolumeX3, $ConfigVVolumeY, "ConfigImagePen01");
			SetAlias("Config1f_VVolume01", "Config1f_VVolume01");
			CreateTexture("Config1a_VVolume02", 10010, $ConfigVVolumeX3, $ConfigVVolumeY, "ConfigImagePen02");
			SetAlias("Config1a_VVolume02", "Config1a_VVolume02");
			//▽幅
			$ConfigVVolumeH=ImageHorizon("Config1a_VVolume");
			$ConfigVVolumeV=ImageVertical("Config1a_VVolume");

		//▼定義「音声バー：一列目」
		$ConfigBarY=732;
		//CreateTexture("Config1a_CV_Bar01", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//Request("Config1a_CV_Bar01", MulRender);
		//SetAlias("Config1a_CV_Bar01", "Config1a_CV_Bar01");

		//▼定義「ＣＶ：拓巳」
		$ConfigCV_拓巳X=139;
		$ConfigCV_拓巳Y=734;//しばらく固定
		$ConfigCV_拓巳Bar=732;
		CreateChoice("Config1a_CV_拓巳");
		SetAlias("Config1a_CV_拓巳", "Config1a_CV_拓巳");
//		CreateTexture("Config1f_CV_拓巳01", 10010, $ConfigCV_拓巳X, $ConfigCV_拓巳Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_拓巳02", 10100, $ConfigCV_拓巳X, $ConfigCV_拓巳Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_拓巳/MouseUsual/hit", 10010, $ConfigCV_拓巳X, $ConfigCV_拓巳Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_拓巳/MouseOver/icon", 10010, $ConfigCV_拓巳X, $ConfigCV_拓巳Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_拓巳/MouseClick/icon", 10010, $ConfigCV_拓巳X, $ConfigCV_拓巳Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_拓巳/MouseOver/button", 10010, 0, 0, "ConfigCV_拓巳ProcessOPEN");
		//CreateProcess("@Config1a_CV_拓巳/MouseLeave/button", 10010, 0, 0, "ConfigCV_拓巳ProcessSTOP");
		//CreateSound("@Config1a_CV_拓巳/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_拓巳/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_拓巳/MouseUsual/hit", Erase);
			$ConfigCV_拓巳H=ImageHorizon("Config1a_CV_拓巳/MouseUsual/hit");
			$ConfigCV_拓巳V=ImageVertical("Config1a_CV_拓巳/MouseUsual/hit");

		//▼定義「ＣＶ：梨深」
		$ConfigCV_梨深X=251;
		$ConfigCV_梨深Y=734;//しばらく固定
		$ConfigCV_梨深Bar=732;
		CreateChoice("Config1a_CV_梨深");
		SetAlias("Config1a_CV_梨深", "Config1a_CV_梨深");
//		CreateTexture("Config1f_CV_梨深01", 10010, $ConfigCV_梨深X, $ConfigCV_梨深Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_梨深02", 10100, $ConfigCV_梨深X, $ConfigCV_梨深Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_梨深/MouseUsual/hit", 10010, $ConfigCV_梨深X, $ConfigCV_梨深Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_梨深/MouseOver/icon", 10010, $ConfigCV_梨深X, $ConfigCV_梨深Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_梨深/MouseClick/icon", 10010, $ConfigCV_梨深X, $ConfigCV_梨深Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_梨深/MouseOver/button", 10010, 0, 0, "ConfigCV_梨深ProcessOPEN");
		//CreateProcess("@Config1a_CV_梨深/MouseLeave/button", 10010, 0, 0, "ConfigCV_梨深ProcessSTOP");
		//CreateSound("@Config1a_CV_梨深/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_梨深/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_梨深/MouseUsual/hit", Erase);
			$ConfigCV_梨深H=ImageHorizon("Config1a_CV_梨深/MouseUsual/hit");
			$ConfigCV_梨深V=ImageVertical("Config1a_CV_梨深/MouseUsual/hit");

		//▼定義「ＣＶ：セナ」
		$ConfigCV_セナX=363;
		$ConfigCV_セナY=734;//しばらく固定
		$ConfigCV_セナBar=732;
		CreateChoice("Config1a_CV_セナ");
		SetAlias("Config1a_CV_セナ", "Config1a_CV_セナ");
//		CreateTexture("Config1f_CV_セナ01", 10010, $ConfigCV_セナX, $ConfigCV_セナY, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_セナ02", 10100, $ConfigCV_セナX, $ConfigCV_セナY, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_セナ/MouseUsual/hit", 10010, $ConfigCV_セナX, $ConfigCV_セナY, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_セナ/MouseOver/icon", 10010, $ConfigCV_セナX, $ConfigCV_セナY, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_セナ/MouseClick/icon", 10010, $ConfigCV_セナX, $ConfigCV_セナY, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_セナ/MouseOver/button", 10010, 0, 0, "ConfigCV_セナProcessOPEN");
		//CreateProcess("@Config1a_CV_セナ/MouseLeave/button", 10010, 0, 0, "ConfigCV_セナProcessSTOP");
		//CreateSound("@Config1a_CV_セナ/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_セナ/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_セナ/MouseUsual/hit", Erase);
			$ConfigCV_セナH=ImageHorizon("Config1a_CV_セナ/MouseUsual/hit");
			$ConfigCV_セナV=ImageVertical("Config1a_CV_セナ/MouseUsual/hit");

		//▼定義「ＣＶ：優愛」
		$ConfigCV_優愛X=475;
		$ConfigCV_優愛Y=734;//しばらく固定
		$ConfigCV_優愛Bar=732;
		CreateChoice("Config1a_CV_優愛");
		SetAlias("Config1a_CV_優愛", "Config1a_CV_優愛");
//		CreateTexture("Config1f_CV_優愛01", 10010, $ConfigCV_優愛X, $ConfigCV_優愛Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_優愛02", 10100, $ConfigCV_優愛X, $ConfigCV_優愛Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_優愛/MouseUsual/hit", 10010, $ConfigCV_優愛X, $ConfigCV_優愛Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_優愛/MouseOver/icon", 10010, $ConfigCV_優愛X, $ConfigCV_優愛Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_優愛/MouseClick/icon", 10010, $ConfigCV_優愛X, $ConfigCV_優愛Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_優愛/MouseOver/button", 10010, 0, 0, "ConfigCV_優愛ProcessOPEN");
		//CreateProcess("@Config1a_CV_優愛/MouseLeave/button", 10010, 0, 0, "ConfigCV_優愛ProcessSTOP");
		//CreateSound("@Config1a_CV_優愛/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_優愛/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_優愛/MouseUsual/hit", Erase);
			$ConfigCV_優愛H=ImageHorizon("Config1a_CV_優愛/MouseUsual/hit");
			$ConfigCV_優愛V=ImageVertical("Config1a_CV_優愛/MouseUsual/hit");

		//▼定義「ＣＶ：梢」
		$ConfigCV_梢X=571;
		$ConfigCV_梢Y=734;//しばらく固定
		$ConfigCV_梢Bar=732;
		CreateChoice("Config1a_CV_梢");
		SetAlias("Config1a_CV_梢", "Config1a_CV_梢");
//		CreateTexture("Config1f_CV_梢01", 10010, $ConfigCV_梢X, $ConfigCV_梢Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_梢02", 10100, $ConfigCV_梢X, $ConfigCV_梢Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_梢/MouseUsual/hit", 10010, $ConfigCV_梢X, $ConfigCV_梢Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_梢/MouseOver/icon", 10010, $ConfigCV_梢X, $ConfigCV_梢Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_梢/MouseClick/icon", 10010, $ConfigCV_梢X, $ConfigCV_梢Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_梢/MouseOver/button", 10010, 0, 0, "ConfigCV_梢ProcessOPEN");
		//CreateProcess("@Config1a_CV_梢/MouseLeave/button", 10010, 0, 0, "ConfigCV_梢ProcessSTOP");
		//CreateSound("@Config1a_CV_梢/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_梢/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_梢/MouseUsual/hit", Erase);
			$ConfigCV_梢H=ImageHorizon("Config1a_CV_梢/MouseUsual/hit");
			$ConfigCV_梢V=ImageVertical("Config1a_CV_梢/MouseUsual/hit");

		//▼定義「ＣＶ：あやせ」
		$ConfigCV_あやせX=666;
		$ConfigCV_あやせY=734;//しばらく固定
		$ConfigCV_あやせBar=732;
		CreateChoice("Config1a_CV_あやせ");
		SetAlias("Config1a_CV_あやせ", "Config1a_CV_あやせ");
//		CreateTexture("Config1f_CV_あやせ01", 10010, $ConfigCV_あやせX, $ConfigCV_あやせY, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_あやせ02", 10100, $ConfigCV_あやせX, $ConfigCV_あやせY, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_あやせ/MouseUsual/hit", 10010, $ConfigCV_あやせX, $ConfigCV_あやせY, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_あやせ/MouseOver/icon", 10010, $ConfigCV_あやせX, $ConfigCV_あやせY, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_あやせ/MouseClick/icon", 10010, $ConfigCV_あやせX, $ConfigCV_あやせY, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_あやせ/MouseOver/button", 10010, 0, 0, "ConfigCV_あやせProcessOPEN");
		//CreateProcess("@Config1a_CV_あやせ/MouseLeave/button", 10010, 0, 0, "ConfigCV_あやせProcessSTOP");
		//CreateSound("@Config1a_CV_あやせ/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_あやせ/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_あやせ/MouseUsual/hit", Erase);
			$ConfigCV_あやせH=ImageHorizon("Config1a_CV_あやせ/MouseUsual/hit");
			$ConfigCV_あやせV=ImageVertical("Config1a_CV_あやせ/MouseUsual/hit");

		//▼定義「ＣＶ：七海」
		$ConfigCV_七海X=795;
		$ConfigCV_七海Y=734;//しばらく固定
		$ConfigCV_七海Bar=734;
		CreateChoice("Config1a_CV_七海");
		SetAlias("Config1a_CV_七海", "Config1a_CV_七海");
//		CreateTexture("Config1f_CV_七海01", 10010, $ConfigCV_七海X, $ConfigCV_七海Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_七海02", 10100, $ConfigCV_七海X, $ConfigCV_七海Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_七海/MouseUsual/hit", 10010, $ConfigCV_七海X, $ConfigCV_七海Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_七海/MouseOver/icon", 10010, $ConfigCV_七海X, $ConfigCV_七海Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_七海/MouseClick/icon", 10010, $ConfigCV_七海X, $ConfigCV_七海Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_七海/MouseOver/button", 10010, 0, 0, "ConfigCV_七海ProcessOPEN");
		//CreateProcess("@Config1a_CV_七海/MouseLeave/button", 10010, 0, 0, "ConfigCV_七海ProcessSTOP");
		//CreateSound("@Config1a_CV_七海/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_七海/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_七海/MouseUsual/hit", Erase);
			$ConfigCV_七海H=ImageHorizon("Config1a_CV_七海/MouseUsual/hit");
			$ConfigCV_七海V=ImageVertical("Config1a_CV_七海/MouseUsual/hit");

		//▼定義「音声バー：二列目」
		$ConfigBarY=764;
		//CreateTexture("Config1a_CV_Bar02", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//Request("Config1a_CV_Bar02", MulRender);
		//SetAlias("Config1a_CV_Bar02", "Config1a_CV_Bar02");

		//▼定義「ＣＶ：星来」
		$ConfigCV_星来X=139;
		$ConfigCV_星来Y=766;//しばらく固定２
		$ConfigCV_星来Bar=764;
		CreateChoice("Config1a_CV_星来");
		SetAlias("Config1a_CV_星来", "Config1a_CV_星来");
//		CreateTexture("Config1f_CV_星来01", 10010, $ConfigCV_星来X, $ConfigCV_星来Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_星来02", 10100, $ConfigCV_星来X, $ConfigCV_星来Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_星来/MouseUsual/hit", 10010, $ConfigCV_星来X, $ConfigCV_星来Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_星来/MouseOver/icon", 10010, $ConfigCV_星来X, $ConfigCV_星来Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_星来/MouseClick/icon", 10010, $ConfigCV_星来X, $ConfigCV_星来Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_星来/MouseOver/button", 10010, 0, 0, "ConfigCV_星来ProcessOPEN");
		//CreateProcess("@Config1a_CV_星来/MouseLeave/button", 10010, 0, 0, "ConfigCV_星来ProcessSTOP");
		//CreateSound("@Config1a_CV_星来/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_星来/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_星来/MouseUsual/hit", Erase);
			$ConfigCV_星来H=ImageHorizon("Config1a_CV_星来/MouseUsual/hit");
			$ConfigCV_星来V=ImageVertical("Config1a_CV_星来/MouseUsual/hit");

		//▼定義「ＣＶ：葉月」
		$ConfigCV_葉月X=293;
		$ConfigCV_葉月Y=766;//しばらく固定２
		$ConfigCV_葉月Bar=764;
		CreateChoice("Config1a_CV_葉月");
		SetAlias("Config1a_CV_葉月", "Config1a_CV_葉月");
//		CreateTexture("Config1f_CV_葉月01", 10010, $ConfigCV_葉月X, $ConfigCV_葉月Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_葉月02", 10100, $ConfigCV_葉月X, $ConfigCV_葉月Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_葉月/MouseUsual/hit", 10010, $ConfigCV_葉月X, $ConfigCV_葉月Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_葉月/MouseOver/icon", 10010, $ConfigCV_葉月X, $ConfigCV_葉月Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_葉月/MouseClick/icon", 10010, $ConfigCV_葉月X, $ConfigCV_葉月Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_葉月/MouseOver/button", 10010, 0, 0, "ConfigCV_葉月ProcessOPEN");
		//CreateProcess("@Config1a_CV_葉月/MouseLeave/button", 10010, 0, 0, "ConfigCV_葉月ProcessSTOP");
		//CreateSound("@Config1a_CV_葉月/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_葉月/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_葉月/MouseUsual/hit", Erase);
			$ConfigCV_葉月H=ImageHorizon("Config1a_CV_葉月/MouseUsual/hit");
			$ConfigCV_葉月V=ImageVertical("Config1a_CV_葉月/MouseUsual/hit");

		//▼定義「ＣＶ：三住」
		$ConfigCV_三住X=405;
		$ConfigCV_三住Y=766;//しばらく固定２
		$ConfigCV_三住Bar=764;
		CreateChoice("Config1a_CV_三住");
		SetAlias("Config1a_CV_三住", "Config1a_CV_三住");
//		CreateTexture("Config1f_CV_三住01", 10010, $ConfigCV_三住X, $ConfigCV_三住Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_三住02", 10100, $ConfigCV_三住X, $ConfigCV_三住Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_三住/MouseUsual/hit", 10010, $ConfigCV_三住X, $ConfigCV_三住Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_三住/MouseOver/icon", 10010, $ConfigCV_三住X, $ConfigCV_三住Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_三住/MouseClick/icon", 10010, $ConfigCV_三住X, $ConfigCV_三住Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_三住/MouseOver/button", 10010, 0, 0, "ConfigCV_三住ProcessOPEN");
		//CreateProcess("@Config1a_CV_三住/MouseLeave/button", 10010, 0, 0, "ConfigCV_三住ProcessSTOP");
		//CreateSound("@Config1a_CV_三住/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_三住/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_三住/MouseUsual/hit", Erase);
			$ConfigCV_三住H=ImageHorizon("Config1a_CV_三住/MouseUsual/hit");
			$ConfigCV_三住V=ImageVertical("Config1a_CV_三住/MouseUsual/hit");

		//▼定義「ＣＶ：諏訪」
		$ConfigCV_諏訪X=517;
		$ConfigCV_諏訪Y=766;//しばらく固定２
		$ConfigCV_諏訪Bar=764;
		CreateChoice("Config1a_CV_諏訪");
		SetAlias("Config1a_CV_諏訪", "Config1a_CV_諏訪");
//		CreateTexture("Config1f_CV_諏訪01", 10010, $ConfigCV_諏訪X, $ConfigCV_諏訪Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_諏訪02", 10100, $ConfigCV_諏訪X, $ConfigCV_諏訪Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_諏訪/MouseUsual/hit", 10010, $ConfigCV_諏訪X, $ConfigCV_諏訪Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_諏訪/MouseOver/icon", 10010, $ConfigCV_諏訪X, $ConfigCV_諏訪Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_諏訪/MouseClick/icon", 10010, $ConfigCV_諏訪X, $ConfigCV_諏訪Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_諏訪/MouseOver/button", 10010, 0, 0, "ConfigCV_諏訪ProcessOPEN");
		//CreateProcess("@Config1a_CV_諏訪/MouseLeave/button", 10010, 0, 0, "ConfigCV_諏訪ProcessSTOP");
		//CreateSound("@Config1a_CV_諏訪/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_諏訪/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_諏訪/MouseUsual/hit", Erase);
			$ConfigCV_諏訪H=ImageHorizon("Config1a_CV_諏訪/MouseUsual/hit");
			$ConfigCV_諏訪V=ImageVertical("Config1a_CV_諏訪/MouseUsual/hit");

		//▼定義「ＣＶ：百瀬」
		$ConfigCV_百瀬X=610;
		$ConfigCV_百瀬Y=766;//しばらく固定２
		$ConfigCV_百瀬Bar=764;
		CreateChoice("Config1a_CV_百瀬");
		SetAlias("Config1a_CV_百瀬", "Config1a_CV_百瀬");
//		CreateTexture("Config1f_CV_百瀬01", 10010, $ConfigCV_百瀬X, $ConfigCV_百瀬Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_百瀬02", 10100, $ConfigCV_百瀬X, $ConfigCV_百瀬Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_百瀬/MouseUsual/hit", 10010, $ConfigCV_百瀬X, $ConfigCV_百瀬Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_百瀬/MouseOver/icon", 10010, $ConfigCV_百瀬X, $ConfigCV_百瀬Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_百瀬/MouseClick/icon", 10010, $ConfigCV_百瀬X, $ConfigCV_百瀬Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_百瀬/MouseOver/button", 10010, 0, 0, "ConfigCV_百瀬ProcessOPEN");
		//CreateProcess("@Config1a_CV_百瀬/MouseLeave/button", 10010, 0, 0, "ConfigCV_百瀬ProcessSTOP");
		//CreateSound("@Config1a_CV_百瀬/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_百瀬/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_百瀬/MouseUsual/hit", Erase);
			$ConfigCV_百瀬H=ImageHorizon("Config1a_CV_百瀬/MouseUsual/hit");
			$ConfigCV_百瀬V=ImageVertical("Config1a_CV_百瀬/MouseUsual/hit");

		//▼定義「ＣＶ：高科」
		$ConfigCV_高科X=723;
		$ConfigCV_高科Y=766;//しばらく固定２
		$ConfigCV_高科Bar=764;
		CreateChoice("Config1a_CV_高科");
		SetAlias("Config1a_CV_高科", "Config1a_CV_高科");
//		CreateTexture("Config1f_CV_高科01", 10010, $ConfigCV_高科X, $ConfigCV_高科Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_高科02", 10100, $ConfigCV_高科X, $ConfigCV_高科Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_高科/MouseUsual/hit", 10010, $ConfigCV_高科X, $ConfigCV_高科Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_高科/MouseOver/icon", 10010, $ConfigCV_高科X, $ConfigCV_高科Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_高科/MouseClick/icon", 10010, $ConfigCV_高科X, $ConfigCV_高科Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_高科/MouseOver/button", 10010, 0, 0, "ConfigCV_高科ProcessOPEN");
		//CreateProcess("@Config1a_CV_高科/MouseLeave/button", 10010, 0, 0, "ConfigCV_高科ProcessSTOP");
		//CreateSound("@Config1a_CV_高科/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_高科/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_高科/MouseUsual/hit", Erase);
			$ConfigCV_高科H=ImageHorizon("Config1a_CV_高科/MouseUsual/hit");
			$ConfigCV_高科V=ImageVertical("Config1a_CV_高科/MouseUsual/hit");

		//▼定義「ＣＶ：将軍」
		$ConfigCV_将軍X=835;
		$ConfigCV_将軍Y=766;//しばらく固定２
		$ConfigCV_将軍Bar=764;
		CreateChoice("Config1a_CV_将軍");
		SetAlias("Config1a_CV_将軍", "Config1a_CV_将軍");
//		CreateTexture("Config1f_CV_将軍01", 10010, $ConfigCV_将軍X, $ConfigCV_将軍Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_将軍02", 10100, $ConfigCV_将軍X, $ConfigCV_将軍Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_将軍/MouseUsual/hit", 10010, $ConfigCV_将軍X, $ConfigCV_将軍Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_将軍/MouseOver/icon", 10010, $ConfigCV_将軍X, $ConfigCV_将軍Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_将軍/MouseClick/icon", 10010, $ConfigCV_将軍X, $ConfigCV_将軍Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_将軍/MouseOver/button", 10010, 0, 0, "ConfigCV_将軍ProcessOPEN");
		//CreateProcess("@Config1a_CV_将軍/MouseLeave/button", 10010, 0, 0, "ConfigCV_将軍ProcessSTOP");
		//CreateSound("@Config1a_CV_将軍/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_将軍/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_将軍/MouseUsual/hit", Erase);
			$ConfigCV_将軍H=ImageHorizon("Config1a_CV_将軍/MouseUsual/hit");
			$ConfigCV_将軍V=ImageVertical("Config1a_CV_将軍/MouseUsual/hit");

		//▼定義「音声バー：三列目」
		$ConfigBarY=796;
		//CreateTexture("Config1a_CV_Bar03", 10010, $ConfigBarX, $ConfigBarY, "ConfigImageBar");
		//Request("Config1a_CV_Bar03", MulRender);
		//SetAlias("Config1a_CV_Bar03", "Config1a_CV_Bar03");

		//▼定義「ＣＶ：判」
		$ConfigCV_判X=139;
		$ConfigCV_判Y=797;//しばらく固定３
		$ConfigCV_判Bar=796;
		CreateChoice("Config1a_CV_判");
		SetAlias("Config1a_CV_判", "Config1a_CV_判");
//		CreateTexture("Config1f_CV_判01", 10010, $ConfigCV_判X, $ConfigCV_判Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_判02", 10100, $ConfigCV_判X, $ConfigCV_判Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_判/MouseUsual/hit", 10010, $ConfigCV_判X, $ConfigCV_判Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_判/MouseOver/icon", 10010, $ConfigCV_判X, $ConfigCV_判Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_判/MouseClick/icon", 10010, $ConfigCV_判X, $ConfigCV_判Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_判/MouseOver/button", 10010, 0, 0, "ConfigCV_判ProcessOPEN");
		//CreateProcess("@Config1a_CV_判/MouseLeave/button", 10010, 0, 0, "ConfigCV_判ProcessSTOP");
		//CreateSound("@Config1a_CV_判/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_判/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_判/MouseUsual/hit", Erase);
			$ConfigCV_判H=ImageHorizon("Config1a_CV_判/MouseUsual/hit");
			$ConfigCV_判V=ImageVertical("Config1a_CV_判/MouseUsual/hit");

		//▼定義「ＣＶ：野呂瀬」
		$ConfigCV_野呂瀬X=234;
		$ConfigCV_野呂瀬Y=797;//しばらく固定３
		$ConfigCV_野呂瀬Bar=796;
		CreateChoice("Config1a_CV_野呂瀬");
		SetAlias("Config1a_CV_野呂瀬", "Config1a_CV_野呂瀬");
//		CreateTexture("Config1f_CV_野呂瀬01", 10010, $ConfigCV_野呂瀬X, $ConfigCV_野呂瀬Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_野呂瀬02", 10100, $ConfigCV_野呂瀬X, $ConfigCV_野呂瀬Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_野呂瀬/MouseUsual/hit", 10010, $ConfigCV_野呂瀬X, $ConfigCV_野呂瀬Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_野呂瀬/MouseOver/icon", 10010, $ConfigCV_野呂瀬X, $ConfigCV_野呂瀬Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_野呂瀬/MouseClick/icon", 10010, $ConfigCV_野呂瀬X, $ConfigCV_野呂瀬Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_野呂瀬/MouseOver/button", 10010, 0, 0, "ConfigCV_野呂瀬ProcessOPEN");
		//CreateProcess("@Config1a_CV_野呂瀬/MouseLeave/button", 10010, 0, 0, "ConfigCV_野呂瀬ProcessSTOP");
		//CreateSound("@Config1a_CV_野呂瀬/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_野呂瀬/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_野呂瀬/MouseUsual/hit", Erase);
			$ConfigCV_野呂瀬H=ImageHorizon("Config1a_CV_野呂瀬/MouseUsual/hit");
			$ConfigCV_野呂瀬V=ImageVertical("Config1a_CV_野呂瀬/MouseUsual/hit");

		//▼定義「ＣＶ：その他」
		$ConfigCV_その他X=363;
		$ConfigCV_その他Y=797;//しばらく固定３
		$ConfigCV_その他Bar=796;
		CreateChoice("Config1a_CV_その他");
		SetAlias("Config1a_CV_その他", "Config1a_CV_その他");
//		CreateTexture("Config1f_CV_その他01", 10010, $ConfigCV_その他X, $ConfigCV_その他Y, "ConfigImageCheck01");
		CreateTexture("Config1a_CV_その他02", 10100, $ConfigCV_その他X, $ConfigCV_その他Y, "ConfigImageCheck03");
		CreateTexture("@Config1a_CV_その他/MouseUsual/hit", 10010, $ConfigCV_その他X, $ConfigCV_その他Y, "ConfigImageCheck01");
		CreateTexture("@Config1a_CV_その他/MouseOver/icon", 10010, $ConfigCV_その他X, $ConfigCV_その他Y, "ConfigImageCheck02");
		CreateTexture("@Config1a_CV_その他/MouseClick/icon", 10010, $ConfigCV_その他X, $ConfigCV_その他Y, "ConfigImageCheck02");
		//CreateProcess("@Config1a_CV_その他/MouseOver/button", 10010, 0, 0, "ConfigCV_その他ProcessOPEN");
		//CreateProcess("@Config1a_CV_その他/MouseLeave/button", 10010, 0, 0, "ConfigCV_その他ProcessSTOP");
		//CreateSound("@Config1a_CV_その他/MouseOver/sound", SE, $ConfigSound_over);
		//CreateSound("@Config1a_CV_その他/MouseClick/sound", SE, $ConfigSound_click);
			Request("@Config1a_CV_その他/MouseUsual/hit", Erase);
			$ConfigCV_その他H=ImageHorizon("Config1a_CV_その他/MouseUsual/hit");
			$ConfigCV_その他V=ImageVertical("Config1a_CV_その他/MouseUsual/hit");

		$cfgmaketab1=true;
	}

	$ConfigPage=1;
	$ConfigPhase=1;
	$ConfigNumber=1;

	if(Platform()==100){
		ConfigMoveScroll();
		ConfigMoveSet();
	}else{
		ConfigFocus();
	}
}





//■マクロ「コンフィグ描画」
function ConfigFade()
{
	//●描画「全消し」
	Fade("Config*/*/*", 0, 0, null, false);
	Fade("Config*", 0, 0, null, true);

	//●描画「共通素材」
//	Fade("Config0f*", 0, 1000, null, false);
	Fade("Config9f*", 0, 1000, null, false);

	if($cfgtab==1){
		//★ボイス変数の確認
		ConfigCharacterVoice();

		//●描画「基本」
		Fade("Config1f*", 0, 1000, null, false);
		Fade("Config9f*", 0, 1000, null, false);

		//●描画「選択肢後の自動文字送り＆スキップを解除」
		if(#keep_auto_and_skip){
			Fade("Config1a_CSkipOFF02",0,1000,null,false);
		}else{
			Fade("Config1a_CSkipON02",0,1000,null,false);
		}
		//●描画「未読時でもスキップする？」
		if(#SYSTEM_skip_absolute){
			Fade("Config1a_ASkipON02",0,1000,null,false);
		}else{
			Fade("Config1a_ASkipOFF02",0,1000,null,false);
		}
		//●描画「文字送り時の音声再生」
		if(#SYSTEM_click_break_voice){
			Fade("Config1a_KVoiceOFF02",0,1000,null,false);
		}else{
			Fade("Config1a_KVoiceON02",0,1000,null,false);
		}
		//●描画「自動文字送り時の音声設定」
		if(#SYSTEM_auto_text_break_voice){
			Fade("Config1a_SVoiceOFF02",0,1000,null,false);
		}else{
			Fade("Config1a_SVoiceON02",0,1000,null,false);
		}
		//●描画「ＢＧＭを再生する」
		if(#SYSTEM_sound_bgm){
			Fade("Config1a_BPlayON02",0,1000,null,false);
		}else{
			Fade("Config1a_BPlayOFF02",0,1000,null,false);
		}
		//●描画「ＳＥを再生する」
		if(#SYSTEM_sound_se){
			Fade("Config1a_SPlayON02",0,1000,null,false);
		}else{
			Fade("Config1a_SPlayOFF02",0,1000,null,false);
		}
		//●描画「音声を再生する」
		if(#SYSTEM_sound_voice){
			Fade("Config1a_VPlayON02",0,1000,null,false);
		}else{
			Fade("Config1a_VPlayOFF02",0,1000,null,false);
		}
		//●描画「ＣＶ」
		if(!#voice_skip_拓巳){
			Fade("Config1a_CV_拓巳02",0,1000,null,false);
		}
		if(!#voice_skip_梨深){
			Fade("Config1a_CV_梨深02",0,1000,null,false);
		}
		if(!#voice_skip_セナ){
			Fade("Config1a_CV_セナ02",0,1000,null,false);
		}
		if(!#voice_skip_優愛){
			Fade("Config1a_CV_優愛02",0,1000,null,false);
		}
		if(!#voice_skip_梢){
			Fade("Config1a_CV_梢02",0,1000,null,false);
		}
		if(!#voice_skip_あやせ){
			Fade("Config1a_CV_あやせ02",0,1000,null,false);
		}
		if(!#voice_skip_七海){
			Fade("Config1a_CV_七海02",0,1000,null,false);
		}
		if(!#voice_skip_星来){
			Fade("Config1a_CV_星来02",0,1000,null,false);
		}
		if(!#voice_skip_葉月){
			Fade("Config1a_CV_葉月02",0,1000,null,false);
		}
		if(!#voice_skip_三住){
			Fade("Config1a_CV_三住02",0,1000,null,false);
		}
		if(!#voice_skip_諏訪){
			Fade("Config1a_CV_諏訪02",0,1000,null,false);
		}
		if(!#voice_skip_百瀬){
			Fade("Config1a_CV_百瀬02",0,1000,null,false);
		}
		if(!#voice_skip_高科){
			Fade("Config1a_CV_高科02",0,1000,null,false);
		}
		if(!#voice_skip_将軍){
			Fade("Config1a_CV_将軍02",0,1000,null,false);
		}
		if(!#voice_skip_判){
			Fade("Config1a_CV_判02",0,1000,null,false);
		}
		if(!#voice_skip_野呂瀬){
			Fade("Config1a_CV_野呂瀬02",0,1000,null,false);
		}
		if(#SYSTEM_voice_enable_another){
			Fade("Config1a_CV_その他02",0,1000,null,false);
		}

		//★ＴＣＲ対策
		//LoadingEnd();
		//★★★★アンロック
		XBOX360_LockVideo(false);

		//▲描画「ボタン説明」
		Move("コンフィグウィンドウ", 300, @0, @576, null, true);
		DialogButtonFade3("Button_CONFIG");
	}
}


/*
	$PreConfigScrollbar = Integer((ImageVertical("Config1f_ConfigGround")-576) * ScrollbarValue("Config9f_Scrollbar"));

				//★全体スクロール
				$ConfigScrollbar = Integer((ImageVertical("Config1f_ConfigGround")-576) * ScrollbarValue("Config9f_Scrollbar"));
				$ConfigScrollbarY = $PreConfigScrollbar - $ConfigScrollbar;
				if($PreConfigScrollbar!=$ConfigScrollbar){
					Move("Config0*/*/*", 0, @0, @$ConfigScrollbarY, null, false);
					Move("Config1*/*/*", 0, @0, @$ConfigScrollbarY, null, false);
					Move("Config0*", 0, @0, @$ConfigScrollbarY, null, false);
					Move("Config1*", 0, @0, @$ConfigScrollbarY, null, false);
				}
				$PreConfigScrollbar = $ConfigScrollbar;

				case Config9f_Scrollbar{}
*/


//■マクロ「コンフィグ選択」
function ConfigSelect()
{
	Position("Config1f_MSpeed01", $x, $y);
	$x=$x+2;
	$y=$y+2;
	MoveCursor($x,$y);

	$ConfigNextFlag=0;
	$ConfigPage=1;
	
	$PreConfigScrollbar = Integer((ImageVertical("Config1f_ConfigGround")-500) * ScrollbarValue("Config9f_Scrollbar"));

	while($SYSTEM_menu_config_enable)
	{
		if($SYSTEM_XBOX360_change_user_state){DialogChangeState2();}
		if($cfgtab==1){
			select{
				if($SYSTEM_XBOX360_change_user_state){DialogChangeState2();}

				//★全体スクロール跡地
				CursorPosition($ConX,$ConY);
				//CreateText("テキスト１", 20200, 50, 50, 700, 500, $ConX);
				//CreateText("テキスト２", 20200, 50, 150, 700, 500, $ConY);
				if(Platform()==100){
					if($SYSTEM_XBOX360_button_up_down){
						$LOCAL_XBOX360_button_up_down=true;
						break;
					}else if($SYSTEM_XBOX360_button_down_down&&$ConfigNumber!=40){
						$LOCAL_XBOX360_button_down_down=true;
						break;
					}else if($SYSTEM_XBOX360_button_left_down&&$ConfigNumber!=40&&$ConfigNumber!=1&&$ConfigNumber!=2&&$ConfigNumber!=9&&$ConfigNumber!=14&&$ConfigNumber!=17&&$ConfigNumber!=20){
						$LOCAL_XBOX360_button_left_down=true;
						break;
					}else if($SYSTEM_XBOX360_button_right_down&&$ConfigNumber!=40&&$ConfigNumber!=1&&$ConfigNumber!=2&&$ConfigNumber!=9&&$ConfigNumber!=14&&$ConfigNumber!=17&&$ConfigNumber!=20){
						$LOCAL_XBOX360_button_right_down=true;
						break;
					}
				}else{
					if($ConfigPage==1){
						if($ConX<=792&&$ConX>=772&&$ConY<=500&&$ConY>=484){
							$ConfigNextFlag=1;
							break;
						}else if($ConX<=1066&&$ConX>=1043&&$ConY<=500&&$ConY>=484){
							$ConfigNextFlag=2;
							break;
						}
					}else if($ConfigPage==2){
						if($ConX<=628&&$ConX>=610&&$ConY<=60&&$ConY>=44){
							$ConfigNextFlag=3;
							break;
						}else if($ConX<=765&&$ConX>=748&&$ConY<=60&&$ConY>=44){
							$ConfigNextFlag=4;
							break;
						}else if($ConX<=894&&$ConX>=825&&$ConY<=572&&$ConY>=554){
							$ConfigNextFlag=5;
							break;
						}
					}else if($ConfigPage==3){
						if($ConX<=381&&$ConX>=364&&$ConY<=252&&$ConY>=236){
							$ConfigNextFlag=6;
							break;
						}
					}
				}

				//★バー系判定用
				#SYSTEM_text_speed=(1-ScrollbarValue("Config1a_MSpeed"))*1000;
				#LOCAL_window_fade=ScrollbarValue("Config1a_MTrans")*1000;
				#SYSTEM_auto_wait_per_character=(1-ScrollbarValue("Config1a_ASpeed"))*200;

				#SYSTEM_sound_volume_bgm=ScrollbarValue("Config1a_BVolume")*1000;
				#SYSTEM_sound_volume_se=ScrollbarValue("Config1a_SVolume")*1000;
				#SYSTEM_sound_volume_voice=ScrollbarValue("Config1a_VVolume")*1000;
			

				//★選択肢後の自動文字送り＆スキップを解除
				case Config1a_CSkipON{
					#keep_auto_and_skip=false;
					Fade("Config1a_CSkipON02",$ConfigFadeTime,1000,null,false);
					Fade("Config1a_CSkipOFF02",$ConfigFadeTime,0,null,false);
				}
				case Config1a_CSkipOFF{
					#keep_auto_and_skip=true;
					Fade("Config1a_CSkipON02",$ConfigFadeTime,0,null,false);
					Fade("Config1a_CSkipOFF02",$ConfigFadeTime,1000,null,false);
				}

				//★未読時でもスキップ
				case Config1a_ASkipON{
					#SYSTEM_skip_absolute=true;
					Fade("Config1a_ASkipON02",$ConfigFadeTime,1000,null,false);
					Fade("Config1a_ASkipOFF02",$ConfigFadeTime,0,null,false);
				}
				case Config1a_ASkipOFF{
					#SYSTEM_skip_absolute=false;
					Fade("Config1a_ASkipON02",$ConfigFadeTime,0,null,false);
					Fade("Config1a_ASkipOFF02",$ConfigFadeTime,1000,null,false);
				}

				//★文字送り時の音声再生
				case Config1a_KVoiceON{
					#SYSTEM_click_break_voice=false;
					Fade("Config1a_KVoiceON02",$ConfigFadeTime,1000,null,false);
					Fade("Config1a_KVoiceOFF02",$ConfigFadeTime,0,null,false);
				}
				case Config1a_KVoiceOFF{
					#SYSTEM_click_break_voice=true;
					Fade("Config1a_KVoiceON02",$ConfigFadeTime,0,null,false);
					Fade("Config1a_KVoiceOFF02",$ConfigFadeTime,1000,null,false);
				}

				//★自動文字送り時の音声設定
				case Config1a_SVoiceON{
					#SYSTEM_auto_text_break_voice=false;
					Fade("Config1a_SVoiceON02",$ConfigFadeTime,1000,null,false);
					Fade("Config1a_SVoiceOFF02",$ConfigFadeTime,0,null,false);
				}
				case Config1a_SVoiceOFF{
					#SYSTEM_auto_text_break_voice=true;
					Fade("Config1a_SVoiceON02",$ConfigFadeTime,0,null,false);
					Fade("Config1a_SVoiceOFF02",$ConfigFadeTime,1000,null,false);
				}


				//★ＢＧＭを再生する
				case Config1a_BPlayON{
					#SYSTEM_sound_bgm=true;
					Fade("Config1a_BPlayON02",$ConfigFadeTime,1000,null,false);
					Fade("Config1a_BPlayOFF02",$ConfigFadeTime,0,null,false);
				}
				case Config1a_BPlayOFF{
					#SYSTEM_sound_bgm=false;
					Fade("Config1a_BPlayON02",$ConfigFadeTime,0,null,false);
					Fade("Config1a_BPlayOFF02",$ConfigFadeTime,1000,null,false);
				}

				//★ＳＥを再生する
				case Config1a_SPlayON{
					#SYSTEM_sound_se=true;
					Fade("Config1a_SPlayON02",$ConfigFadeTime,1000,null,false);
					Fade("Config1a_SPlayOFF02",$ConfigFadeTime,0,null,false);
				}
				case Config1a_SPlayOFF{
					#SYSTEM_sound_se=false;
					Fade("Config1a_SPlayON02",$ConfigFadeTime,0,null,false);
					Fade("Config1a_SPlayOFF02",$ConfigFadeTime,1000,null,false);
				}

				//★音声を再生する
				case Config1a_VPlayON{
					#SYSTEM_sound_voice=true;
					Fade("Config1a_VPlayON02",$ConfigFadeTime,1000,null,false);
					Fade("Config1a_VPlayOFF02",$ConfigFadeTime,0,null,false);
				}
				case Config1a_VPlayOFF{
					#SYSTEM_sound_voice=false;
					Fade("Config1a_VPlayON02",$ConfigFadeTime,0,null,false);
					Fade("Config1a_VPlayOFF02",$ConfigFadeTime,1000,null,false);
				}

				//★メッセージスピード
				case Config1a_MSpeed{
					#SYSTEM_text_speed=(1-ScrollbarValue("Config1a_MSpeed"))*1000;
					SetVolume("@Config1a_MSpeed_Pro01/MouseOver/sound", 0, 0, NULL);
					Request("Config1a_MSpeed_Pro01_sound", Stop);
					Request("Config1a_MSpeed_Pro01_sound", Play);
					Fade("@Config1a_MSpeed02", 0, 1000, null, false);
					Fade("@Config1f_MSpeed01", 0, 0, null, false);
				}case Config1a_MSpeed_Pro01{}
				Position("Config1a_MSpeed",$ConfigMSpeedX,$ConfigMSpeedY);
				if($PreConfigMSpeedX!=$ConfigMSpeedX){
					Move("@Config1a_MSpeed_Pro02/MouseUsual/hit", 0, $ConfigMSpeedX, $ConfigMSpeedY, null, false);
					Move("Config1f_MSpeed01", 0, $ConfigMSpeedX, $ConfigMSpeedY, null, false);
					Move("Config1a_MSpeed02", 0, $ConfigMSpeedX, $ConfigMSpeedY, null, false);
				}
				$PreConfigMSpeedX=$ConfigMSpeedX;

				//★ウィンドウ透過度
				case Config1a_MTrans{
					#LOCAL_window_fade=ScrollbarValue("Config1a_MTrans")*1000;
					SetVolume("@Config1a_MTrans_Pro01/MouseOver/sound", 0, 0, NULL);
					Request("Config1a_MTrans_Pro01_sound", Stop);
					Request("Config1a_MTrans_Pro01_sound", Play);
					Fade("@Config1a_MTrans02", 0, 1000, null, false);
					Fade("@Config1f_MTrans01", 0, 0, null, false);
				}case Config1a_MTrans_Pro01{}
				Position("Config1a_MTrans",$ConfigMTransX,$ConfigMTransY);
				if($PreConfigMTransX!=$ConfigMTransX){
					Move("@Config1a_MTrans_Pro02/MouseUsual/hit", 0, $ConfigMTransX, $ConfigMTransY, null, false);
					Move("Config1f_MTrans01", 0, $ConfigMTransX, $ConfigMTransY, null, false);
					Move("Config1a_MTrans02", 0, $ConfigMTransX, $ConfigMTransY, null, false);
				}
				$PreConfigMTransX=$ConfigMTransX;

				//★自動文字送りスピード
				case Config1a_ASpeed{
					#SYSTEM_auto_wait_per_character=(1-ScrollbarValue("Config1a_ASpeed"))*200;
					SetVolume("@Config1a_ASpeed_Pro01/MouseOver/sound", 0, 0, NULL);
					Request("Config1a_ASpeed_Pro01_sound", Stop);
					Request("Config1a_ASpeed_Pro01_sound", Play);
					Fade("@Config1a_ASpeed02", 0, 1000, null, false);
					Fade("@Config1f_ASpeed01", 0, 0, null, false);
				}case Config1a_ASpeed_Pro01{}
				Position("Config1a_ASpeed",$ConfigASpeedX,$ConfigASpeedY);
				if($PreConfigASpeedX!=$ConfigASpeedX){
					Move("@Config1a_ASpeed_Pro02/MouseUsual/hit", 0, $ConfigASpeedX, $ConfigASpeedY, null, false);
					Move("Config1f_ASpeed01", 0, $ConfigASpeedX, $ConfigASpeedY, null, false);
					Move("Config1a_ASpeed02", 0, $ConfigASpeedX, $ConfigASpeedY, null, false);
				}
				$PreConfigASpeedX=$ConfigASpeedX;

				//★ＢＧＭボリューム
				case Config1a_BVolume{
					#SYSTEM_sound_volume_bgm=ScrollbarValue("Config1a_BVolume")*1000;
					SetVolume("@Config1a_BVolume_Pro01/MouseOver/sound", 0, 0, NULL);
					Request("Config1a_BVolume_Pro01_sound", Stop);
					Request("Config1a_BVolume_Pro01_sound", Play);
					Fade("@Config1a_BVolume02", 0, 1000, null, false);
					Fade("@Config1f_BVolume01", 0, 0, null, false);
				}case Config1a_BVolume_Pro01{}
				Position("Config1a_BVolume",$ConfigBVolumeX,$ConfigBVolumeY);
				if($PreConfigBVolumeX!=$ConfigBVolumeX){
					Move("@Config1a_BVolume_Pro02/MouseUsual/hit", 0, $ConfigBVolumeX, $ConfigBVolumeY, null, false);
					Move("Config1f_BVolume01", 0, $ConfigBVolumeX, $ConfigBVolumeY, null, false);
					Move("Config1a_BVolume02", 0, $ConfigBVolumeX, $ConfigBVolumeY, null, false);
				}
				$PreConfigBVolumeX=$ConfigBVolumeX;


				//★ＳＥボリューム
				case Config1a_SVolume{
					#SYSTEM_sound_volume_se=ScrollbarValue("Config1a_SVolume")*1000;
					SetVolume("@Config1a_SVolume_Pro01/MouseOver/sound", 0, 0, NULL);
					Request("Config1a_SVolume_Pro01_sound", Stop);
					Request("Config1a_SVolume_Pro01_sound", Play);
					Fade("@Config1a_SVolume02", 0, 1000, null, false);
					Fade("@Config1f_SVolume01", 0, 0, null, false);
				}case Config1a_SVolume_Pro01{}
				Position("Config1a_SVolume",$ConfigSVolumeX,$ConfigSVolumeY);
				if($PreConfigSVolumeX!=$ConfigSVolumeX){
					Move("@Config1a_SVolume_Pro02/MouseUsual/hit", 0, $ConfigSVolumeX, $ConfigSVolumeY, null, false);
					Move("Config1f_SVolume01", 0, $ConfigSVolumeX, $ConfigSVolumeY, null, false);
					Move("Config1a_SVolume02", 0, $ConfigSVolumeX, $ConfigSVolumeY, null, false);
				}
				$PreConfigSVolumeX=$ConfigSVolumeX;

				//★音声ボリューム
				case Config1a_VVolume{
					#SYSTEM_sound_volume_voice=ScrollbarValue("Config1a_VVolume")*1000;
					SetVolume("@Config1a_VVolume_Pro01/MouseOver/sound", 0, 0, NULL);
					Request("Config1a_VVolume_Pro01_sound", Stop);
					Request("Config1a_VVolume_Pro01_sound", Play);
					Fade("@Config1a_VVolume02", 0, 1000, null, false);
					Fade("@Config1f_VVolume01", 0, 0, null, false);
				}case Config1a_VVolume_Pro01{}
				Position("Config1a_VVolume",$ConfigVVolumeX,$ConfigVVolumeY);
				if($PreConfigVVolumeX!=$ConfigVVolumeX){
					Move("@Config1a_VVolume_Pro02/MouseUsual/hit", 0, $ConfigVVolumeX, $ConfigVVolumeY, null, false);
					Move("Config1f_VVolume01", 0, $ConfigVVolumeX, $ConfigVVolumeY, null, false);
					Move("Config1a_VVolume02", 0, $ConfigVVolumeX, $ConfigVVolumeY, null, false);
				}
				$PreConfigVVolumeX=$ConfigVVolumeX;

				//★キャラクターボイス
				case Config1a_CV_拓巳{
					#voice_skip_拓巳=!#voice_skip_拓巳;
					if(!#voice_skip_拓巳){
						Fade("Config1a_CV_拓巳02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_拓巳02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_梨深{
					#voice_skip_梨深=!#voice_skip_梨深;
					if(!#voice_skip_梨深){
						Fade("Config1a_CV_梨深02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_梨深02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_セナ{
					#voice_skip_セナ=!#voice_skip_セナ;
					if(!#voice_skip_セナ){
						Fade("Config1a_CV_セナ02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_セナ02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_優愛{
					#voice_skip_優愛=!#voice_skip_優愛;
					if(!#voice_skip_優愛){
						Fade("Config1a_CV_優愛02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_優愛02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_梢{
					#voice_skip_梢=!#voice_skip_梢;
					if(!#voice_skip_梢){
						Fade("Config1a_CV_梢02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_梢02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_あやせ{
					#voice_skip_あやせ=!#voice_skip_あやせ;
					if(!#voice_skip_あやせ){
						Fade("Config1a_CV_あやせ02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_あやせ02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_七海{
					#voice_skip_七海=!#voice_skip_七海;
					if(!#voice_skip_七海){
						Fade("Config1a_CV_七海02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_七海02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_星来{
					#voice_skip_星来=!#voice_skip_星来;
					if(!#voice_skip_星来){
						Fade("Config1a_CV_星来02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_星来02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_葉月{
					#voice_skip_葉月=!#voice_skip_葉月;
					if(!#voice_skip_葉月){
						Fade("Config1a_CV_葉月02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_葉月02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_三住{
					#voice_skip_三住=!#voice_skip_三住;
					if(!#voice_skip_三住){
						Fade("Config1a_CV_三住02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_三住02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_諏訪{
					#voice_skip_諏訪=!#voice_skip_諏訪;
					if(!#voice_skip_諏訪){
						Fade("Config1a_CV_諏訪02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_諏訪02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_百瀬{
					#voice_skip_百瀬=!#voice_skip_百瀬;
					if(!#voice_skip_百瀬){
						Fade("Config1a_CV_百瀬02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_百瀬02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_高科{
					#voice_skip_高科=!#voice_skip_高科;
					if(!#voice_skip_高科){
						Fade("Config1a_CV_高科02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_高科02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_将軍{
					#voice_skip_将軍=!#voice_skip_将軍;
					if(!#voice_skip_将軍){
						Fade("Config1a_CV_将軍02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_将軍02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_判{
					#voice_skip_判=!#voice_skip_判;
					if(!#voice_skip_判){
						Fade("Config1a_CV_判02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_判02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_野呂瀬{
					#voice_skip_野呂瀬=!#voice_skip_野呂瀬;
					if(!#voice_skip_野呂瀬){
						Fade("Config1a_CV_野呂瀬02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_野呂瀬02",$ConfigFadeTime,0,null,false);
					}
				}case Config1a_CV_その他{
					#SYSTEM_voice_enable_another=!#SYSTEM_voice_enable_another;
					if(#SYSTEM_voice_enable_another){
						Fade("Config1a_CV_その他02",$ConfigFadeTime,1000,null,false);
					}else{
						Fade("Config1a_CV_その他02",$ConfigFadeTime,0,null,false);
					}
				}

				//★ストレージ変更
				case Config1a_Storage{ConfigStorageInit();}
				//★初期化
				case Config1a_Default{ConfigDefaultInit();}
				//★出口
				case Config1a_EXIT{$SYSTEM_menu_config_enable=false;}

				//★コンフィグ脱出
				if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$SYSTEM_menu_config_enable=false;break;}
				if(!$SYSTEM_menu_config_enable){break;}
				
				

				//★全体スクロール
				case Config9f_Scrollbar{}
				$ConfigScrollbar = Integer((ImageVertical("Config1f_ConfigGround")-500) * ScrollbarValue("Config9f_Scrollbar"));
				$ConfigScrollbarY = $PreConfigScrollbar - $ConfigScrollbar;
				if($PreConfigScrollbar!=$ConfigScrollbar){
					Move("Config0*/*/*", 0, @0, @$ConfigScrollbarY, null, false);
					Move("Config1*/*/*", 0, @0, @$ConfigScrollbarY, null, false);
					Move("Config0*", 0, @0, @$ConfigScrollbarY, null, false);
					Move("Config1*", 0, @0, @$ConfigScrollbarY, null, false);
				}
				$PreConfigScrollbar = $ConfigScrollbar;

				
				
			if($SYSTEM_keydown_f){
				if(!#SYSTEM_window_full_lock){
					#SYSTEM_window_full=!#SYSTEM_window_full;
					#SYSTEM_window_full_lock=false;
					#SYSTEM_video_aspect_fixed=1;
					Wait(300);
					$SYSTEM_keydown_f=false;
				}
			}
			else if($SYSTEM_menu_close_enable || $SYSTEM_buttondown_close || $SYSTEM_keydown_esc){
					ConfigCharacterVoice();
					call_chapter nss/sys_close.nss;
				}
			}
		}else{
			break;
		}

		if(Platform()==100){
			//▽廻す
			ConfigMoveStart();
		}else{
			ConfigMoveStart2();
		}

		$LOCAL_XBOX360_button_left_down=false;$LOCAL_XBOX360_button_right_down=false;
		$LOCAL_XBOX360_button_up_down=false;$LOCAL_XBOX360_button_down_down=false;
		$SYSTEM_XBOX360_button_left_down=false;$SYSTEM_XBOX360_button_right_down=false;
		$SYSTEM_XBOX360_button_up_down=false;$SYSTEM_XBOX360_button_down_down=false;
		Wait(4);
	}
}





//■マクロ「セットネクストフォーカス」
function ConfigMoveStart()
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	Fade("Config9f_bar", 0, 1000, null, false);

	if($ConX>=$ConfigMSpeedX_E1&&$ConX<=$ConfigMSpeedX_E2&&$ConY>=$ConfigMSpeedY_E1&&$ConY<=$ConfigMSpeedY_E2){
		//▼「メッセージスピード」
		if($LOCAL_XBOX360_button_up_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigMTrans();//●「ウィンドウ透過度」
		}else if($LOCAL_XBOX360_button_left_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_right_down){
			//●動作無し
		}
	}else if($ConX>=$ConfigMTransX_E1&&$ConX<=$ConfigMTransX_E2&&$ConY>=$ConfigMTransY_E1&&$ConY<=$ConfigMTransY_E2){
		//▼「ウィンドウ透過度」
		if($LOCAL_XBOX360_button_up_down){
			ConfigMSpeed();//●「メッセージスピード」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCSkipOn();//●「選択肢後の自動文字送り＆スキップを解除on」
		}else if($LOCAL_XBOX360_button_left_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_right_down){
			//●動作無し
		}
	}else if($ConX>=$ConfigCSkipOnX_E1&&$ConX<=$ConfigCSkipOnX_E2&&$ConY>=$ConfigCSkipOnY_E1&&$ConY<=$ConfigCSkipOnY_E2){
		//▼「選択肢後の自動文字送り＆スキップを解除on」
		if($LOCAL_XBOX360_button_up_down){
			ConfigMTrans();//●「ウィンドウ透過度」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigASkipOn();//●「未読時でもスキップする？on」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCSkipOff();//●「選択肢後の自動文字送り＆スキップを解除off」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCSkipOff();//●「選択肢後の自動文字送り＆スキップを解除off」
		}
	}else if($ConX>=$ConfigCSkipOffX_E1&&$ConX<=$ConfigCSkipOffX_E2&&$ConY>=$ConfigCSkipOffY_E1&&$ConY<=$ConfigCSkipOffY_E2){
		//▼「選択肢後の自動文字送り＆スキップを解除off」
		if($LOCAL_XBOX360_button_up_down){
			ConfigMTrans();//●「ウィンドウ透過度」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigASkipOff();//●「未読時でもスキップする？off」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCSkipOn();//●「選択肢後の自動文字送り＆スキップを解除on」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCSkipOn();//●「選択肢後の自動文字送り＆スキップを解除on」
		}
	}else if($ConX>=$ConfigASkipOnX_E1&&$ConX<=$ConfigASkipOnX_E2&&$ConY>=$ConfigASkipOnY_E1&&$ConY<=$ConfigASkipOnY_E2){
		//▼「未読時でもスキップする？on」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCSkipOn();//●「選択肢後の自動文字送り＆スキップを解除on」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigKVoiceOn();//●「文字送り時の音声設定on」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigASkipOff();//●「未読時でもスキップする？off」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigASkipOff();//●「未読時でもスキップする？off」
		}
	}else if($ConX>=$ConfigASkipOffX_E1&&$ConX<=$ConfigASkipOffX_E2&&$ConY>=$ConfigASkipOffY_E1&&$ConY<=$ConfigASkipOffY_E2){
		//▼「未読時でもスキップする？off」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCSkipOff();//●「選択肢後の自動文字送り＆スキップを解除off」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigKVoiceOff();//●「文字送り時の音声設定off」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigASkipOn();//●「未読時でもスキップする？on」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigASkipOn();//●「未読時でもスキップする？on」
		}
	}else if($ConX>=$ConfigKVoiceOnX_E1&&$ConX<=$ConfigKVoiceOnX_E2&&$ConY>=$ConfigKVoiceOnY_E1&&$ConY<=$ConfigKVoiceOnY_E2){
		//▼「文字送り時の音声設定on」
		if($LOCAL_XBOX360_button_up_down){
			ConfigASkipOn();//●「未読時でもスキップする？on」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigASpeed();//●「自動文字送りスピード」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigKVoiceOff();//●「文字送り時の音声設定off」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigKVoiceOff();//●「文字送り時の音声設定off」
		}
	}else if($ConX>=$ConfigKVoiceOffX_E1&&$ConX<=$ConfigKVoiceOffX_E2&&$ConY>=$ConfigKVoiceOffY_E1&&$ConY<=$ConfigKVoiceOffY_E2){
		//▼「文字送り時の音声設定off」
		if($LOCAL_XBOX360_button_up_down){
			ConfigASkipOff();//●「未読時でもスキップする？off」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigASpeed();//●「自動文字送りスピード」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigKVoiceOn();//●「文字送り時の音声設定on」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigKVoiceOn();//●「文字送り時の音声設定on」
		}
	}else if($ConX>=$ConfigASpeedX_E1&&$ConX<=$ConfigASpeedX_E2&&$ConY>=$ConfigASpeedY_E1&&$ConY<=$ConfigASpeedY_E2){
		//▼「自動文字送りスピード」
		if($LOCAL_XBOX360_button_up_down){
			ConfigKVoiceOn();//●「文字送り時の音声設定on」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigSVoiceOn();//●「自動文字送り時の音声設定on」
		}else if($LOCAL_XBOX360_button_left_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_right_down){
			//●動作無し
		}
	}else if($ConX>=$ConfigSVoiceOnX_E1&&$ConX<=$ConfigSVoiceOnX_E2&&$ConY>=$ConfigSVoiceOnY_E1&&$ConY<=$ConfigSVoiceOnY_E2){
		//▼「自動文字送り時の音声設定on」
		if($LOCAL_XBOX360_button_up_down){
			ConfigASpeed();//●「自動文字送りスピード」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigBPlayOn();//●「ＢＧＭを再生するon」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigSVoiceOff();//●「自動文字送り時の音声設定off」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigSVoiceOff();//●「自動文字送り時の音声設定off」
		}
	}else if($ConX>=$ConfigSVoiceOffX_E1&&$ConX<=$ConfigSVoiceOffX_E2&&$ConY>=$ConfigSVoiceOffY_E1&&$ConY<=$ConfigSVoiceOffY_E2){
		//▼「自動文字送り時の音声設定off」
		if($LOCAL_XBOX360_button_up_down){
			ConfigASpeed();//●「自動文字送りスピード」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigBPlayOff();//●「ＢＧＭを再生するoff」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigSVoiceOn();//●「自動文字送り時の音声設定on」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigSVoiceOn();//●「自動文字送り時の音声設定on」
		}
	}else if($ConX>=$ConfigBPlayOnX_E1&&$ConX<=$ConfigBPlayOnX_E2&&$ConY>=$ConfigBPlayOnY_E1&&$ConY<=$ConfigBPlayOnY_E2){
		//▼「ＢＧＭを再生するon」
		if($LOCAL_XBOX360_button_up_down){
			ConfigSVoiceOn();//●「自動文字送り時の音声設定on」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigBVolume();//●「ＢＧＭボリューム」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigBPlayOff();//●「ＢＧＭを再生するoff」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigBPlayOff();//●「ＢＧＭを再生するoff」
		}
	}else if($ConX>=$ConfigBPlayOffX_E1&&$ConX<=$ConfigBPlayOffX_E2&&$ConY>=$ConfigBPlayOffY_E1&&$ConY<=$ConfigBPlayOffY_E2){
		//▼「ＢＧＭを再生するoff」
		if($LOCAL_XBOX360_button_up_down){
			ConfigSVoiceOff();//●「自動文字送り時の音声設定off」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigBVolume();//●「ＢＧＭボリューム」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigBPlayOn();//●「ＢＧＭを再生するon」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigBPlayOn();//●「ＢＧＭを再生するon」
		}
	}else if($ConX>=$ConfigBVolumeX_E1&&$ConX<=$ConfigBVolumeX_E2&&$ConY>=$ConfigBVolumeY_E1&&$ConY<=$ConfigBVolumeY_E2){
		//▼「ＢＧＭボリューム」
		if($LOCAL_XBOX360_button_up_down){
			ConfigBPlayOn();//●「ＢＧＭを再生するon」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigSPlayOn();//●「ＳＥを再生するon」
		}else if($LOCAL_XBOX360_button_left_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_right_down){
			//●動作無し
		}
	}else if($ConX>=$ConfigSPlayOnX_E1&&$ConX<=$ConfigSPlayOnX_E2&&$ConY>=$ConfigSPlayOnY_E1&&$ConY<=$ConfigSPlayOnY_E2){
		//▼「ＳＥを再生するon」
		if($LOCAL_XBOX360_button_up_down){
			ConfigBVolume();//●「ＢＧＭボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigSVolume();//●「ＳＥボリューム」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigSPlayOff();//●「ＳＥを再生するoff」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigSPlayOff();//●「ＳＥを再生するoff」
		}
	}else if($ConX>=$ConfigSPlayOffX_E1&&$ConX<=$ConfigSPlayOffX_E2&&$ConY>=$ConfigSPlayOffY_E1&&$ConY<=$ConfigSPlayOffY_E2){
		//▼「ＳＥを再生するoff」
		if($LOCAL_XBOX360_button_up_down){
			ConfigBVolume();//●「ＢＧＭボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigSVolume();//●「ＳＥボリューム」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigSPlayOn();//●「ＳＥを再生するon」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigSPlayOn();//●「ＳＥを再生するon」
		}
	}else if($ConX>=$ConfigSVolumeX_E1&&$ConX<=$ConfigSVolumeX_E2&&$ConY>=$ConfigSVolumeY_E1&&$ConY<=$ConfigSVolumeY_E2){
		//▼「ＳＥボリューム」
		if($LOCAL_XBOX360_button_up_down){
			ConfigSPlayOn();//●「ＳＥを再生するon」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigVPlayOn();//●「音声を再生するon」
		}else if($LOCAL_XBOX360_button_left_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_right_down){
			//●動作無し
		}
	}else if($ConX>=$ConfigVPlayOnX_E1&&$ConX<=$ConfigVPlayOnX_E2&&$ConY>=$ConfigVPlayOnY_E1&&$ConY<=$ConfigVPlayOnY_E2){
		//▼「音声を再生するon」
		if($LOCAL_XBOX360_button_up_down){
			ConfigSVolume();//●「ＳＥボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigVVolume();//●「音声ボリューム」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigVPlayOff();//●「音声を再生するoff」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigVPlayOff();//●「音声を再生するoff」
		}
	}else if($ConX>=$ConfigVPlayOffX_E1&&$ConX<=$ConfigVPlayOffX_E2&&$ConY>=$ConfigVPlayOffY_E1&&$ConY<=$ConfigVPlayOffY_E2){
		//▼「音声を再生するoff」
		if($LOCAL_XBOX360_button_up_down){
			ConfigSVolume();//●「ＳＥボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigVVolume();//●「音声ボリューム」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigVPlayOn();//●「音声を再生するon」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigVPlayOn();//●「音声を再生するon」
		}
	}else if($ConX>=$ConfigVVolumeX_E1&&$ConX<=$ConfigVVolumeX_E2&&$ConY>=$ConfigVVolumeY_E1&&$ConY<=$ConfigVVolumeY_E2){
		//▼「音声ボリューム」
		if($LOCAL_XBOX360_button_up_down){
			ConfigVPlayOn();//●「音声を再生するon」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_拓巳();//●「ＣＶ：拓巳」
		}else if($LOCAL_XBOX360_button_left_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_right_down){
			//●動作無し
		}
	}else if($ConX>=$ConfigCV_拓巳X_E1&&$ConX<=$ConfigCV_拓巳X_E2&&$ConY>=$ConfigCV_拓巳Y_E1&&$ConY<=$ConfigCV_拓巳Y_E2){
		//▼「ＣＶ：拓巳」
		if($LOCAL_XBOX360_button_up_down){
			ConfigVVolume();//●「音声ボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_星来();//●「ＣＶ：星来」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_七海();//●「ＣＶ：七海」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_梨深();//●「ＣＶ：梨深」
		}
	}else if($ConX>=$ConfigCV_梨深X_E1&&$ConX<=$ConfigCV_梨深X_E2&&$ConY>=$ConfigCV_梨深Y_E1&&$ConY<=$ConfigCV_梨深Y_E2){
		//▼「ＣＶ：梨深」
		if($LOCAL_XBOX360_button_up_down){
			ConfigVVolume();//●「音声ボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_葉月();//●「ＣＶ：葉月」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_拓巳();//●「ＣＶ：拓巳」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_セナ();//●「ＣＶ：セナ」
		}
	}else if($ConX>=$ConfigCV_セナX_E1&&$ConX<=$ConfigCV_セナX_E2&&$ConY>=$ConfigCV_セナY_E1&&$ConY<=$ConfigCV_セナY_E2){
		//▼「ＣＶ：セナ」
		if($LOCAL_XBOX360_button_up_down){
			ConfigVVolume();//●「音声ボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_三住();//●「ＣＶ：三住」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_梨深();//●「ＣＶ：梨深」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_優愛();//●「ＣＶ：優愛」
		}
	}else if($ConX>=$ConfigCV_優愛X_E1&&$ConX<=$ConfigCV_優愛X_E2&&$ConY>=$ConfigCV_優愛Y_E1&&$ConY<=$ConfigCV_優愛Y_E2){
		//▼「ＣＶ：優愛」
		if($LOCAL_XBOX360_button_up_down){
			ConfigVVolume();//●「音声ボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_諏訪();//●「ＣＶ：諏訪」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_セナ();//●「ＣＶ：セナ」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_梢();//●「ＣＶ：梢」
		}
	}else if($ConX>=$ConfigCV_梢X_E1&&$ConX<=$ConfigCV_梢X_E2&&$ConY>=$ConfigCV_梢Y_E1&&$ConY<=$ConfigCV_梢Y_E2){
		//▼「ＣＶ：梢」
		if($LOCAL_XBOX360_button_up_down){
			ConfigVVolume();//●「音声ボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_百瀬();//●「ＣＶ：百瀬」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_優愛();//●「ＣＶ：優愛」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_あやせ();//●「ＣＶ：あやせ」
		}
	}else if($ConX>=$ConfigCV_あやせX_E1&&$ConX<=$ConfigCV_あやせX_E2&&$ConY>=$ConfigCV_あやせY_E1&&$ConY<=$ConfigCV_あやせY_E2){
		//▼「ＣＶ：あやせ」
		if($LOCAL_XBOX360_button_up_down){
			ConfigVVolume();//●「音声ボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_高科();//●「ＣＶ：高科」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_梢();//●「ＣＶ：梢」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_七海();//●「ＣＶ：七海」
		}
	}else if($ConX>=$ConfigCV_七海X_E1&&$ConX<=$ConfigCV_七海X_E2&&$ConY>=$ConfigCV_七海Y_E1&&$ConY<=$ConfigCV_七海Y_E2){
		//▼「ＣＶ：七海」
		if($LOCAL_XBOX360_button_up_down){
			ConfigVVolume();//●「音声ボリューム」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_将軍();//●「ＣＶ：将軍」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_あやせ();//●「ＣＶ：あやせ」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_拓巳();//●「ＣＶ：拓巳」
		}
	}else if($ConX>=$ConfigCV_星来X_E1&&$ConX<=$ConfigCV_星来X_E2&&$ConY>=$ConfigCV_星来Y_E1&&$ConY<=$ConfigCV_星来Y_E2){
		//▼「ＣＶ：星来」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_拓巳();//●「ＣＶ：拓巳」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_判();//●「ＣＶ：判」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_将軍();//●「ＣＶ：将軍」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_葉月();//●「ＣＶ：葉月」
		}
	}else if($ConX>=$ConfigCV_葉月X_E1&&$ConX<=$ConfigCV_葉月X_E2&&$ConY>=$ConfigCV_葉月Y_E1&&$ConY<=$ConfigCV_葉月Y_E2){
		//▼「ＣＶ：葉月」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_梨深();//●「ＣＶ：梨深」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_野呂瀬();//●「ＣＶ：野呂瀬」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_星来();//●「ＣＶ：星来」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_三住();//●「ＣＶ：三住」
		}
	}else if($ConX>=$ConfigCV_三住X_E1&&$ConX<=$ConfigCV_三住X_E2&&$ConY>=$ConfigCV_三住Y_E1&&$ConY<=$ConfigCV_三住Y_E2){
		//▼「ＣＶ：三住」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_セナ();//●「ＣＶ：セナ」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigCV_その他();//●「ＣＶ：その他」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_葉月();//●「ＣＶ：葉月」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_諏訪();//●「ＣＶ：諏訪」
		}
	}else if($ConX>=$ConfigCV_諏訪X_E1&&$ConX<=$ConfigCV_諏訪X_E2&&$ConY>=$ConfigCV_諏訪Y_E1&&$ConY<=$ConfigCV_諏訪Y_E2){
		//▼「ＣＶ：諏訪」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_優愛();//●「ＣＶ：優愛」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigStorage();//●「ストレージ変更」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_三住();//●「ＣＶ：三住」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_百瀬();//●「ＣＶ：百瀬」
		}
	}else if($ConX>=$ConfigCV_百瀬X_E1&&$ConX<=$ConfigCV_百瀬X_E2&&$ConY>=$ConfigCV_百瀬Y_E1&&$ConY<=$ConfigCV_百瀬Y_E2){
		//▼「ＣＶ：百瀬」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_梢();//●「ＣＶ：梢」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigStorage();//●「ストレージ変更」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_諏訪();//●「ＣＶ：諏訪」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_高科();//●「ＣＶ：高科」
		}
	}else if($ConX>=$ConfigCV_高科X_E1&&$ConX<=$ConfigCV_高科X_E2&&$ConY>=$ConfigCV_高科Y_E1&&$ConY<=$ConfigCV_高科Y_E2){
		//▼「ＣＶ：高科」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_あやせ();//●「ＣＶ：あやせ」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigStorage();//●「ストレージ変更」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_百瀬();//●「ＣＶ：百瀬」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_将軍();//●「ＣＶ：将軍」
		}
	}else if($ConX>=$ConfigCV_将軍X_E1&&$ConX<=$ConfigCV_将軍X_E2&&$ConY>=$ConfigCV_将軍Y_E1&&$ConY<=$ConfigCV_将軍Y_E2){
		//▼「ＣＶ：将軍」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_七海();//●「ＣＶ：七海」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigStorage();//●「ストレージ変更」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_高科();//●「ＣＶ：高科」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_星来();//●「ＣＶ：星来」
		}
	}else if($ConX>=$ConfigCV_判X_E1&&$ConX<=$ConfigCV_判X_E2&&$ConY>=$ConfigCV_判Y_E1&&$ConY<=$ConfigCV_判Y_E2){
		//▼「ＣＶ：判」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_星来();//●「ＣＶ：星来」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigStorage();//●「ストレージ変更」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_その他();//●「ＣＶ：その他」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_野呂瀬();//●「ＣＶ：野呂瀬」
		}
	}else if($ConX>=$ConfigCV_野呂瀬X_E1&&$ConX<=$ConfigCV_野呂瀬X_E2&&$ConY>=$ConfigCV_野呂瀬Y_E1&&$ConY<=$ConfigCV_野呂瀬Y_E2){
		//▼「ＣＶ：野呂瀬」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_葉月();//●「ＣＶ：葉月」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigStorage();//●「ストレージ変更」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_判();//●「ＣＶ：判」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_その他();//●「ＣＶ：その他」
		}
	}else if($ConX>=$ConfigCV_その他X_E1&&$ConX<=$ConfigCV_その他X_E2&&$ConY>=$ConfigCV_その他Y_E1&&$ConY<=$ConfigCV_その他Y_E2){
		//▼「ＣＶ：その他」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_三住();//●「ＣＶ：三住」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigStorage();//●「ストレージ変更」
		}else if($LOCAL_XBOX360_button_left_down){
			ConfigCV_野呂瀬();//●「ＣＶ：野呂瀬」
		}else if($LOCAL_XBOX360_button_right_down){
			ConfigCV_判();//●「ＣＶ：判」
		}
	}else if($ConX>=$ConfigStorageX_E1&&$ConX<=$ConfigStorageX_E2&&$ConY>=$ConfigStorageY_E1&&$ConY<=$ConfigStorageY_E2){
		//▼「ストレージ変更」
		if($LOCAL_XBOX360_button_up_down){
			ConfigCV_その他();//●「ＣＶ：その他」
		}else if($LOCAL_XBOX360_button_down_down){
			ConfigDefault();//●「初期化」
		}else if($LOCAL_XBOX360_button_left_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_right_down){
			//●動作無し
		}
	}else if($ConX>=$ConfigDefaultX_E1&&$ConX<=$ConfigDefaultX_E2&&$ConY>=$ConfigDefaultY_E1&&$ConY<=$ConfigDefaultY_E2){
		//▼「初期化」
		if($LOCAL_XBOX360_button_up_down){
			ConfigStorage();//●「ストレージ変更」
		}else if($LOCAL_XBOX360_button_down_down){
			//ConfigExit();//●「出口」
		}else if($LOCAL_XBOX360_button_left_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_right_down){
			//●動作無し
		}
	}else if($ConX>=$ConfigExitX_E1&&$ConX<=$ConfigExitX_E2&&$ConY>=$ConfigExitY_E1&&$ConY<=$ConfigExitY_E2){
		//▼「出口」
		if($LOCAL_XBOX360_button_up_down){
			ConfigDefault();//●「初期化」
		}else if($LOCAL_XBOX360_button_down_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_left_down){
			//●動作無し
		}else if($LOCAL_XBOX360_button_right_down){
			//●動作無し
		}
	}

	CursorPosition($ConX,$ConY);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	if($ConfigPhase==1){
		if($ConX>=$ConfigBPlayOnX_E1&&$ConX<=$ConfigBPlayOnX_E2&&$ConY>=$ConfigBPlayOnY_E1&&$ConY<=$ConfigBPlayOnY_E2){
			//▼「ＢＧＭを再生するon」
			$ConfigMove=-360;
			Fade("Config1*/MouseOver/*", 0, 0, null, false);
			Move("Config1*/*/*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config1*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config9f_bar", 250, @0, @$ConfigMove, Dxl1, false);
			$ConfigPhase=2;
			Wait(250);
			//★★★★ロック
			XBOX360_LockVideo(true);
			ConfigMovePage();
			ConfigBPlayOn();//●「ＢＧＭを再生するon」
			//★★★★アンロック
			XBOX360_LockVideo(false);
		}else if($ConX>=$ConfigBPlayOffX_E1&&$ConX<=$ConfigBPlayOffX_E2&&$ConY>=$ConfigBPlayOffY_E1&&$ConY<=$ConfigBPlayOffY_E2){
			//▼「ＢＧＭを再生するoff」
			$ConfigMove=-360;
			Fade("Config1*/MouseOver/*", 0, 0, null, false);
			Move("Config1*/*/*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config1*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config9f_bar", 250, @0, @$ConfigMove, Dxl1, false);
			$ConfigPhase=2;
			Wait(250);
			//★★★★ロック
			XBOX360_LockVideo(true);
			ConfigMovePage();
			ConfigBPlayOff();//●「ＢＧＭを再生するoff」
			//★★★★アンロック
			XBOX360_LockVideo(false);
		}
	}else if($ConfigPhase==2){
		if($ConX>=$ConfigSVoiceOnX_E1&&$ConX<=$ConfigSVoiceOnX_E2&&$ConY>=$ConfigSVoiceOnY_E1&&$ConY<=$ConfigSVoiceOnY_E2){
			//▼「自動文字送り時の音声設定on」
			$ConfigMove=360;
			Fade("Config1*/MouseOver/*", 0, 0, null, false);
			Move("Config1*/*/*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config1*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config9f_bar", 250, @0, @$ConfigMove, Dxl1, false);
			$ConfigPhase=1;
			Wait(250);
			//★★★★ロック
			XBOX360_LockVideo(true);
			ConfigMovePage();
			ConfigSVoiceOn();//●「自動文字送り時の音声設定on」
			//★★★★アンロック
			XBOX360_LockVideo(false);
		}else if($ConX>=$ConfigSVoiceOffX_E1&&$ConX<=$ConfigSVoiceOffX_E2&&$ConY>=$ConfigSVoiceOffY_E1&&$ConY<=$ConfigSVoiceOffY_E2){
			//▼「自動文字送り時の音声設定off」
			$ConfigMove=360;
			Fade("Config1*/MouseOver/*", 0, 0, null, false);
			Move("Config1*/*/*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config1*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config9f_bar", 250, @0, @$ConfigMove, Dxl1, false);
			$ConfigPhase=1;
			Wait(250);
			//★★★★ロック
			XBOX360_LockVideo(true);
			ConfigMovePage();
			ConfigSVoiceOff();//●「自動文字送り時の音声設定off」
			//★★★★アンロック
			XBOX360_LockVideo(false);
		}else if($ConX>=$ConfigCV_拓巳X_E1&&$ConX<=$ConfigCV_拓巳X_E2&&$ConY>=$ConfigCV_拓巳Y_E1&&$ConY<=$ConfigCV_拓巳Y_E2){
			//▼「ＣＶ：拓巳」
			$ConfigMove=-320;
				Fade("Config1a_VVolume02", 0, 0, null, false);
				Fade("Config1f_VVolume01", 0, 1000, null, false);
			Fade("Config1*/MouseOver/*", 0, 0, null, false);
			Move("Config1*/*/*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config1*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config9f_bar", 250, @0, @$ConfigMove, Dxl1, false);
			$ConfigPhase=3;
			Wait(250);
			//★★★★ロック
			XBOX360_LockVideo(true);
			ConfigMovePage();
			ConfigCV_拓巳();//●「ＣＶ：拓巳」
			//★★★★アンロック
			XBOX360_LockVideo(false);
		}
	}else if($ConfigPhase==3){
		if($ConX>=$ConfigVVolumeX_E1&&$ConX<=$ConfigVVolumeX_E2&&$ConY>=$ConfigVVolumeY_E1&&$ConY<=$ConfigVVolumeY_E2){
			//▼「音声ボリューム」
			$ConfigMove=320;
			Fade("Config1*/MouseOver/*", 0, 0, null, false);
			Move("Config1*/*/*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config1*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config9f_bar", 250, @0, @$ConfigMove, Dxl1, false);
			$ConfigPhase=2;
			Wait(250);
			//★★★★ロック
			XBOX360_LockVideo(true);
			ConfigMovePage();
			ConfigVVolume();//●「音声ボリューム」
			//★★★★アンロック
			XBOX360_LockVideo(false);
		}else if($ConX>=$ConfigStorageX_E1&&$ConX<=$ConfigStorageX_E2&&$ConY>=$ConfigStorageY_E1&&$ConY<=$ConfigStorageY_E2){
			//▼「ストレージ変更」
			$ConfigMove=-200;
			Fade("Config1*/MouseOver/*", 0, 0, null, false);
			Move("Config1*/*/*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config1*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config9f_bar", 250, @0, @$ConfigMove, Dxl1, false);
			$ConfigPhase=4;
			Wait(250);
			//★★★★ロック
			XBOX360_LockVideo(true);
			ConfigMovePage();
			ConfigStorage();//●「ストレージ変更」
			//★★★★アンロック
			XBOX360_LockVideo(false);
		}
	}else if($ConfigPhase==4){
		if($ConX>=$ConfigCV_その他X_E1&&$ConX<=$ConfigCV_その他X_E2&&$ConY>=$ConfigCV_その他Y_E1&&$ConY<=$ConfigCV_その他Y_E2){
			//▼「ＣＶ：その他」
			$ConfigMove=200;
			Fade("Config1*/MouseOver/*", 0, 0, null, false);
			Move("Config1*/*/*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config1*", 250, @0, @$ConfigMove, Dxl1, false);
			Move("Config9f_bar", 250, @0, @$ConfigMove, Dxl1, false);
			$ConfigPhase=3;
			Wait(250);
			//★★★★ロック
			XBOX360_LockVideo(true);
			ConfigMovePage();
			ConfigCV_その他();//●「ＣＶ：その他」
			//★★★★アンロック
			XBOX360_LockVideo(false);
		}else if($ConX>=$ConfigExitX_E1&&$ConX<=$ConfigExitX_E2&&$ConY>=$ConfigExitY_E1&&$ConY<=$ConfigExitY_E2){
			//▼「出口」
			Fade("Config9f_bar", 200, 0, null, false);
		}
	}
}


function ConfigMSpeed()
{
	$ConfigNumber=1;
	Position("Config1f_MSpeed01",$ConfigMSpeedX,$ConfigMSpeedY);
	$ConfigMSpeedX_M=$ConfigMSpeedX+($ConfigMSpeedH/2);

	MoveCursor($ConfigMSpeedX_M,$ConfigMSpeedY_M);
	Move("Config9f_bar", 0, @0, $ConfigMSpeedBar, null, false);
}
function ConfigMTrans()
{
	$ConfigNumber=2;
	Position("Config1f_MTrans01",$ConfigMTransX,$ConfigMTransY);
	$ConfigMTransX_M=$ConfigMTransX+($ConfigMTransH/2);

	MoveCursor($ConfigMTransX_M,$ConfigMTransY_M);
	Move("Config9f_bar", 0, @0, $ConfigMTransBar, null, false);
}
function ConfigCSkipOn()
{
	$ConfigNumber=3;
	MoveCursor($ConfigCSkipOnX_M,$ConfigCSkipOnY_M);
	Move("Config9f_bar", 0, @0, $ConfigCSkipOnBar, null, false);
}
function ConfigCSkipOff()
{
	$ConfigNumber=4;
	MoveCursor($ConfigCSkipOffX_M,$ConfigCSkipOffY_M);
	Move("Config9f_bar", 0, @0, $ConfigCSkipOffBar, null, false);
}
function ConfigASkipOn()
{
	$ConfigNumber=5;
	MoveCursor($ConfigASkipOnX_M,$ConfigASkipOnY_M);
	Move("Config9f_bar", 0, @0, $ConfigASkipOnBar, null, false);
}
function ConfigASkipOff()
{
	$ConfigNumber=6;
	MoveCursor($ConfigASkipOffX_M,$ConfigASkipOffY_M);
	Move("Config9f_bar", 0, @0, $ConfigASkipOffBar, null, false);
}
function ConfigKVoiceOn()
{
	$ConfigNumber=7;
	MoveCursor($ConfigKVoiceOnX_M,$ConfigKVoiceOnY_M);
	Move("Config9f_bar", 0, @0, $ConfigKVoiceOnBar, null, false);
}
function ConfigKVoiceOff()
{
	$ConfigNumber=8;
	MoveCursor($ConfigKVoiceOffX_M,$ConfigKVoiceOffY_M);
	Move("Config9f_bar", 0, @0, $ConfigKVoiceOffBar, null, false);
}
function ConfigASpeed()
{
	$ConfigNumber=9;
	Position("Config1f_ASpeed01",$ConfigASpeedX,$ConfigASpeedY);
	$ConfigASpeedX_M=$ConfigASpeedX+($ConfigASpeedH/2);
	MoveCursor($ConfigASpeedX_M,$ConfigASpeedY_M);
	Move("Config9f_bar", 0, @0, $ConfigASpeedBar, null, false);
}
function ConfigSVoiceOn()
{
	$ConfigNumber=10;
	MoveCursor($ConfigSVoiceOnX_M,$ConfigSVoiceOnY_M);
	Move("Config9f_bar", 0, @0, $ConfigSVoiceOnBar, null, false);
}
function ConfigSVoiceOff()
{
	$ConfigNumber=11;
	MoveCursor($ConfigSVoiceOffX_M,$ConfigSVoiceOffY_M);
	Move("Config9f_bar", 0, @0, $ConfigSVoiceOffBar, null, false);
}
function ConfigBPlayOn()
{
	$ConfigNumber=12;
	MoveCursor($ConfigBPlayOnX_M,$ConfigBPlayOnY_M);
	Move("Config9f_bar", 0, @0, $ConfigBPlayOnBar, null, false);
}
function ConfigBPlayOff()
{
	$ConfigNumber=13;
	MoveCursor($ConfigBPlayOffX_M,$ConfigBPlayOffY_M);
	Move("Config9f_bar", 0, @0, $ConfigBPlayOffBar, null, false);
}
function ConfigBVolume()
{
	$ConfigNumber=14;
	Position("Config1f_BVolume01",$ConfigBVolumeX,$ConfigBVolumeY);
	$ConfigBVolumeX_M=$ConfigBVolumeX+($ConfigBVolumeH/2);
	MoveCursor($ConfigBVolumeX_M,$ConfigBVolumeY_M);
	Move("Config9f_bar", 0, @0, $ConfigBVolumeBar, null, false);
}
function ConfigSPlayOn()
{
	$ConfigNumber=15;
	MoveCursor($ConfigSPlayOnX_M,$ConfigSPlayOnY_M);
	Move("Config9f_bar", 0, @0, $ConfigSPlayOnBar, null, false);
}
function ConfigSPlayOff()
{
	$ConfigNumber=16;
	MoveCursor($ConfigSPlayOffX_M,$ConfigSPlayOffY_M);
	Move("Config9f_bar", 0, @0, $ConfigSPlayOffBar, null, false);
}
function ConfigSVolume()
{
	$ConfigNumber=17;
	Position("Config1f_SVolume01",$ConfigSVolumeX,$ConfigSVolumeY);
	$ConfigSVolumeX_M=$ConfigSVolumeX+($ConfigSVolumeH/2);
	MoveCursor($ConfigSVolumeX_M,$ConfigSVolumeY_M);
	Move("Config9f_bar", 0, @0, $ConfigSVolumeBar, null, false);
}
function ConfigVPlayOn()
{
	$ConfigNumber=18;
	MoveCursor($ConfigVPlayOnX_M,$ConfigVPlayOnY_M);
	Move("Config9f_bar", 0, @0, $ConfigVPlayOnBar, null, false);
}
function ConfigVPlayOff()
{
	$ConfigNumber=19;
	MoveCursor($ConfigVPlayOffX_M,$ConfigVPlayOffY_M);
	Move("Config9f_bar", 0, @0, $ConfigVPlayOffBar, null, false);
}
function ConfigVVolume()
{
	$ConfigNumber=20;
	Position("Config1f_VVolume01",$ConfigVVolumeX,$ConfigVVolumeY);
	$ConfigVVolumeX_M=$ConfigVVolumeX+($ConfigVVolumeH/2);
	MoveCursor($ConfigVVolumeX_M,$ConfigVVolumeY_M);
	Move("Config9f_bar", 0, @0, $ConfigVVolumeBar, null, false);
}
function ConfigCV_拓巳()
{
	$ConfigNumber=21;
	MoveCursor($ConfigCV_拓巳X_M,$ConfigCV_拓巳Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_拓巳Bar, null, false);
}
function ConfigCV_梨深()
{
	$ConfigNumber=22;
	MoveCursor($ConfigCV_梨深X_M,$ConfigCV_梨深Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_梨深Bar, null, false);
}
function ConfigCV_セナ()
{
	$ConfigNumber=23;
	MoveCursor($ConfigCV_セナX_M,$ConfigCV_セナY_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_セナBar, null, false);
}
function ConfigCV_優愛()
{
	$ConfigNumber=24;
	MoveCursor($ConfigCV_優愛X_M,$ConfigCV_優愛Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_優愛Bar, null, false);
}
function ConfigCV_梢()
{
	$ConfigNumber=25;
	MoveCursor($ConfigCV_梢X_M,$ConfigCV_梢Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_梢Bar, null, false);
}
function ConfigCV_あやせ()
{
	$ConfigNumber=26;
	MoveCursor($ConfigCV_あやせX_M,$ConfigCV_あやせY_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_あやせBar, null, false);
}
function ConfigCV_七海()
{
	$ConfigNumber=27;
	MoveCursor($ConfigCV_七海X_M,$ConfigCV_七海Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_七海Bar, null, false);
}
function ConfigCV_星来()
{
	$ConfigNumber=28;
	MoveCursor($ConfigCV_星来X_M,$ConfigCV_星来Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_星来Bar, null, false);
}
function ConfigCV_葉月()
{
	$ConfigNumber=29;
	MoveCursor($ConfigCV_葉月X_M,$ConfigCV_葉月Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_葉月Bar, null, false);
}
function ConfigCV_三住()
{
	$ConfigNumber=30;
	MoveCursor($ConfigCV_三住X_M,$ConfigCV_三住Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_三住Bar, null, false);
}
function ConfigCV_諏訪()
{
	$ConfigNumber=31;
	MoveCursor($ConfigCV_諏訪X_M,$ConfigCV_諏訪Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_諏訪Bar, null, false);
}
function ConfigCV_百瀬()
{
	$ConfigNumber=32;
	MoveCursor($ConfigCV_百瀬X_M,$ConfigCV_百瀬Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_百瀬Bar, null, false);
}
function ConfigCV_高科()
{
	$ConfigNumber=33;
	MoveCursor($ConfigCV_高科X_M,$ConfigCV_高科Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_高科Bar, null, false);
}
function ConfigCV_将軍()
{
	$ConfigNumber=34;
	MoveCursor($ConfigCV_将軍X_M,$ConfigCV_将軍Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_将軍Bar, null, false);
}
function ConfigCV_判()
{
	$ConfigNumber=35;
	MoveCursor($ConfigCV_判X_M,$ConfigCV_判Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_判Bar, null, false);
}
function ConfigCV_野呂瀬()
{
	$ConfigNumber=36;
	MoveCursor($ConfigCV_野呂瀬X_M,$ConfigCV_野呂瀬Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_野呂瀬Bar, null, false);
}
function ConfigCV_その他()
{
	$ConfigNumber=37;
	MoveCursor($ConfigCV_その他X_M,$ConfigCV_その他Y_M);
	Move("Config9f_bar", 0, @0, $ConfigCV_その他Bar, null, false);
}
function ConfigStorage()
{
	$ConfigNumber=38;
	MoveCursor($ConfigStorageX_M,$ConfigStorageY_M);
	Move("Config9f_bar", 0, @0, $ConfigStorageBar, null, false);
}
function ConfigDefault()
{
	$ConfigNumber=39;
	MoveCursor($ConfigDefaultX_M,$ConfigDefaultY_M);
	Move("Config9f_bar", 0, @0, $ConfigDefaultBar, null, false);
}
function ConfigExit()
{
	$ConfigNumber=40;
	MoveCursor($ConfigExitX_M,$ConfigExitY_M);
	Move("Config9f_bar", 0, @0, $ConfigExitBar, null, false);
}



//■マクロ「ページ移動用設定」
function ConfigMovePage()
{
	//▼定義「メッセージスピード」
	$ConfigMSpeedY_E1=$ConfigMSpeedY_E1+$ConfigMove;
	$ConfigMSpeedY_E2=$ConfigMSpeedY_E1+$ConfigMSpeedV;
	$ConfigMSpeedY_M=$ConfigMSpeedY_M+$ConfigMove;
	$ConfigMSpeedBar=$ConfigMSpeedBar+$ConfigMove;
	//▼定義「ウィンドウ透過度」
	$ConfigMTransY_E1=$ConfigMTransY_E1+$ConfigMove;
	$ConfigMTransY_E2=$ConfigMTransY_E1+$ConfigMTransV;
	$ConfigMTransY_M=$ConfigMTransY_M+$ConfigMove;
	$ConfigMTransBar=$ConfigMTransBar+$ConfigMove;
	//▼定義「選択肢後の自動文字送り＆スキップを解除」
	$ConfigCSkipOnY_E1=$ConfigCSkipOnY_E1+$ConfigMove;
	$ConfigCSkipOnY_E2=$ConfigCSkipOnY_E1+$ConfigCSkipOnV;
	$ConfigCSkipOnY_M=$ConfigCSkipOnY_M+$ConfigMove;
	$ConfigCSkipOnBar=$ConfigCSkipOnBar+$ConfigMove;
	$ConfigCSkipOffY_E1=$ConfigCSkipOffY_E1+$ConfigMove;
	$ConfigCSkipOffY_E2=$ConfigCSkipOffY_E1+$ConfigCSkipOffV;
	$ConfigCSkipOffY_M=$ConfigCSkipOffY_M+$ConfigMove;
	$ConfigCSkipOffBar=$ConfigCSkipOffBar+$ConfigMove;
	//▼定義「未読時でもスキップする？」
	$ConfigASkipOnY_E1=$ConfigASkipOnY_E1+$ConfigMove;
	$ConfigASkipOnY_E2=$ConfigASkipOnY_E1+$ConfigASkipOnV;
	$ConfigASkipOnY_M=$ConfigASkipOnY_M+$ConfigMove;
	$ConfigASkipOnBar=$ConfigASkipOnBar+$ConfigMove;
	$ConfigASkipOffY_E1=$ConfigASkipOffY_E1+$ConfigMove;
	$ConfigASkipOffY_E2=$ConfigASkipOffY_E1+$ConfigASkipOffV;
	$ConfigASkipOffY_M=$ConfigASkipOffY_M+$ConfigMove;
	$ConfigASkipOffBar=$ConfigASkipOffBar+$ConfigMove;
	//▼定義「文字送り時の音声設定」
	$ConfigKVoiceOnY_E1=$ConfigKVoiceOnY_E1+$ConfigMove;
	$ConfigKVoiceOnY_E2=$ConfigKVoiceOnY_E1+$ConfigKVoiceOnV;
	$ConfigKVoiceOnY_M=$ConfigKVoiceOnY_M+$ConfigMove;
	$ConfigKVoiceOnBar=$ConfigKVoiceOnBar+$ConfigMove;
	$ConfigKVoiceOffY_E1=$ConfigKVoiceOffY_E1+$ConfigMove;
	$ConfigKVoiceOffY_E2=$ConfigKVoiceOffY_E1+$ConfigKVoiceOffV;
	$ConfigKVoiceOffY_M=$ConfigKVoiceOffY_M+$ConfigMove;
	$ConfigKVoiceOffBar=$ConfigKVoiceOffBar+$ConfigMove;
	//▼定義「自動文字送りスピード」
	$ConfigASpeedY_E1=$ConfigASpeedY_E1+$ConfigMove;
	$ConfigASpeedY_E2=$ConfigASpeedY_E1+$ConfigASpeedV;
	$ConfigASpeedY_M=$ConfigASpeedY_M+$ConfigMove;
	$ConfigASpeedBar=$ConfigASpeedBar+$ConfigMove;
	//▼定義「自動文字送り時の音声設定」
	$ConfigSVoiceOnY_E1=$ConfigSVoiceOnY_E1+$ConfigMove;
	$ConfigSVoiceOnY_E2=$ConfigSVoiceOnY_E1+$ConfigSVoiceOnV;
	$ConfigSVoiceOnY_M=$ConfigSVoiceOnY_M+$ConfigMove;
	$ConfigSVoiceOnBar=$ConfigSVoiceOnBar+$ConfigMove;
	$ConfigSVoiceOffY_E1=$ConfigSVoiceOffY_E1+$ConfigMove;
	$ConfigSVoiceOffY_E2=$ConfigSVoiceOffY_E1+$ConfigSVoiceOffV;
	$ConfigSVoiceOffY_M=$ConfigSVoiceOffY_M+$ConfigMove;
	$ConfigSVoiceOffBar=$ConfigSVoiceOffBar+$ConfigMove;
	//▼定義「ＢＧＭを再生する」
	$ConfigBPlayOnY_E1=$ConfigBPlayOnY_E1+$ConfigMove;
	$ConfigBPlayOnY_E2=$ConfigBPlayOnY_E1+$ConfigBPlayOnV;
	$ConfigBPlayOnY_M=$ConfigBPlayOnY_M+$ConfigMove;
	$ConfigBPlayOnBar=$ConfigBPlayOnBar+$ConfigMove;
	$ConfigBPlayOffY_E1=$ConfigBPlayOffY_E1+$ConfigMove;
	$ConfigBPlayOffY_E2=$ConfigBPlayOffY_E1+$ConfigBPlayOffV;
	$ConfigBPlayOffY_M=$ConfigBPlayOffY_M+$ConfigMove;
	$ConfigBPlayOffBar=$ConfigBPlayOffBar+$ConfigMove;
	//▼定義「ＳＥを再生する」
	$ConfigSPlayOnY_E1=$ConfigSPlayOnY_E1+$ConfigMove;
	$ConfigSPlayOnY_E2=$ConfigSPlayOnY_E1+$ConfigSPlayOnV;
	$ConfigSPlayOnY_M=$ConfigSPlayOnY_M+$ConfigMove;
	$ConfigSPlayOnBar=$ConfigSPlayOnBar+$ConfigMove;
	$ConfigSPlayOffY_E1=$ConfigSPlayOffY_E1+$ConfigMove;
	$ConfigSPlayOffY_E2=$ConfigSPlayOffY_E1+$ConfigSPlayOffV;
	$ConfigSPlayOffY_M=$ConfigSPlayOffY_M+$ConfigMove;
	$ConfigSPlayOffBar=$ConfigSPlayOffBar+$ConfigMove;
	//▼定義「音声を再生する」
	$ConfigVPlayOnY_E1=$ConfigVPlayOnY_E1+$ConfigMove;
	$ConfigVPlayOnY_E2=$ConfigVPlayOnY_E1+$ConfigVPlayOnV;
	$ConfigVPlayOnY_M=$ConfigVPlayOnY_M+$ConfigMove;
	$ConfigVPlayOnBar=$ConfigVPlayOnBar+$ConfigMove;
	$ConfigVPlayOffY_E1=$ConfigVPlayOffY_E1+$ConfigMove;
	$ConfigVPlayOffY_E2=$ConfigVPlayOffY_E1+$ConfigVPlayOffV;
	$ConfigVPlayOffY_M=$ConfigVPlayOffY_M+$ConfigMove;
	$ConfigVPlayOffBar=$ConfigVPlayOffBar+$ConfigMove;
	//▼定義「ＢＧＭボリューム」
	$ConfigBVolumeY_E1=$ConfigBVolumeY_E1+$ConfigMove;
	$ConfigBVolumeY_E2=$ConfigBVolumeY_E1+$ConfigBVolumeV;
	$ConfigBVolumeY_M=$ConfigBVolumeY_M+$ConfigMove;
	$ConfigBVolumeBar=$ConfigBVolumeBar+$ConfigMove;
	//▼定義「ＳＥボリューム」
	$ConfigSVolumeY_E1=$ConfigSVolumeY_E1+$ConfigMove;
	$ConfigSVolumeY_E2=$ConfigSVolumeY_E1+$ConfigSVolumeV;
	$ConfigSVolumeY_M=$ConfigSVolumeY_M+$ConfigMove;
	$ConfigSVolumeBar=$ConfigSVolumeBar+$ConfigMove;
	//▼定義「音声ボリューム」
	$ConfigVVolumeY_E1=$ConfigVVolumeY_E1+$ConfigMove;
	$ConfigVVolumeY_E2=$ConfigVVolumeY_E1+$ConfigVVolumeV;
	$ConfigVVolumeY_M=$ConfigVVolumeY_M+$ConfigMove;
	$ConfigVVolumeBar=$ConfigVVolumeBar+$ConfigMove;
	//▼定義「ＣＶ：拓巳」
	$ConfigCV_拓巳Y_E1=$ConfigCV_拓巳Y_E1+$ConfigMove;
	$ConfigCV_拓巳Y_E2=$ConfigCV_拓巳Y_E1+$ConfigCV_拓巳V;
	$ConfigCV_拓巳Y_M=$ConfigCV_拓巳Y_M+$ConfigMove;
	$ConfigCV_拓巳Bar=$ConfigCV_拓巳Bar+$ConfigMove;
	//▼定義「ＣＶ：梨深」
	$ConfigCV_梨深Y_E1=$ConfigCV_梨深Y_E1+$ConfigMove;
	$ConfigCV_梨深Y_E2=$ConfigCV_梨深Y_E1+$ConfigCV_梨深V;
	$ConfigCV_梨深Y_M=$ConfigCV_梨深Y_M+$ConfigMove;
	$ConfigCV_梨深Bar=$ConfigCV_梨深Bar+$ConfigMove;
	//▼定義「ＣＶ：セナ」
	$ConfigCV_セナY_E1=$ConfigCV_セナY_E1+$ConfigMove;
	$ConfigCV_セナY_E2=$ConfigCV_セナY_E1+$ConfigCV_セナV;
	$ConfigCV_セナY_M=$ConfigCV_セナY_M+$ConfigMove;
	$ConfigCV_セナBar=$ConfigCV_セナBar+$ConfigMove;
	//▼定義「ＣＶ：優愛」
	$ConfigCV_優愛Y_E1=$ConfigCV_優愛Y_E1+$ConfigMove;
	$ConfigCV_優愛Y_E2=$ConfigCV_優愛Y_E1+$ConfigCV_優愛V;
	$ConfigCV_優愛Y_M=$ConfigCV_優愛Y_M+$ConfigMove;
	$ConfigCV_優愛Bar=$ConfigCV_優愛Bar+$ConfigMove;
	//▼定義「ＣＶ：梢」
	$ConfigCV_梢Y_E1=$ConfigCV_梢Y_E1+$ConfigMove;
	$ConfigCV_梢Y_E2=$ConfigCV_梢Y_E1+$ConfigCV_梢V;
	$ConfigCV_梢Y_M=$ConfigCV_梢Y_M+$ConfigMove;
	$ConfigCV_梢Bar=$ConfigCV_梢Bar+$ConfigMove;
	//▼定義「ＣＶ：あやせ」
	$ConfigCV_あやせY_E1=$ConfigCV_あやせY_E1+$ConfigMove;
	$ConfigCV_あやせY_E2=$ConfigCV_あやせY_E1+$ConfigCV_あやせV;
	$ConfigCV_あやせY_M=$ConfigCV_あやせY_M+$ConfigMove;
	$ConfigCV_あやせBar=$ConfigCV_あやせBar+$ConfigMove;
	//▼定義「ＣＶ：七海」
	$ConfigCV_七海Y_E1=$ConfigCV_七海Y_E1+$ConfigMove;
	$ConfigCV_七海Y_E2=$ConfigCV_七海Y_E1+$ConfigCV_七海V;
	$ConfigCV_七海Y_M=$ConfigCV_七海Y_M+$ConfigMove;
	$ConfigCV_七海Bar=$ConfigCV_七海Bar+$ConfigMove;
	//▼定義「ＣＶ：星来」
	$ConfigCV_星来Y_E1=$ConfigCV_星来Y_E1+$ConfigMove;
	$ConfigCV_星来Y_E2=$ConfigCV_星来Y_E1+$ConfigCV_星来V;
	$ConfigCV_星来Y_M=$ConfigCV_星来Y_M+$ConfigMove;
	$ConfigCV_星来Bar=$ConfigCV_星来Bar+$ConfigMove;
	//▼定義「ＣＶ：葉月」
	$ConfigCV_葉月Y_E1=$ConfigCV_葉月Y_E1+$ConfigMove;
	$ConfigCV_葉月Y_E2=$ConfigCV_葉月Y_E1+$ConfigCV_葉月V;
	$ConfigCV_葉月Y_M=$ConfigCV_葉月Y_M+$ConfigMove;
	$ConfigCV_葉月Bar=$ConfigCV_葉月Bar+$ConfigMove;
	//▼定義「ＣＶ：三住」
	$ConfigCV_三住Y_E1=$ConfigCV_三住Y_E1+$ConfigMove;
	$ConfigCV_三住Y_E2=$ConfigCV_三住Y_E1+$ConfigCV_三住V;
	$ConfigCV_三住Y_M=$ConfigCV_三住Y_M+$ConfigMove;
	$ConfigCV_三住Bar=$ConfigCV_三住Bar+$ConfigMove;
	//▼定義「ＣＶ：諏訪」
	$ConfigCV_諏訪Y_E1=$ConfigCV_諏訪Y_E1+$ConfigMove;
	$ConfigCV_諏訪Y_E2=$ConfigCV_諏訪Y_E1+$ConfigCV_諏訪V;
	$ConfigCV_諏訪Y_M=$ConfigCV_諏訪Y_M+$ConfigMove;
	$ConfigCV_諏訪Bar=$ConfigCV_諏訪Bar+$ConfigMove;
	//▼定義「ＣＶ：百瀬」
	$ConfigCV_百瀬Y_E1=$ConfigCV_百瀬Y_E1+$ConfigMove;
	$ConfigCV_百瀬Y_E2=$ConfigCV_百瀬Y_E1+$ConfigCV_百瀬V;
	$ConfigCV_百瀬Y_M=$ConfigCV_百瀬Y_M+$ConfigMove;
	$ConfigCV_百瀬Bar=$ConfigCV_百瀬Bar+$ConfigMove;
	//▼定義「ＣＶ：高科」
	$ConfigCV_高科Y_E1=$ConfigCV_高科Y_E1+$ConfigMove;
	$ConfigCV_高科Y_E2=$ConfigCV_高科Y_E1+$ConfigCV_高科V;
	$ConfigCV_高科Y_M=$ConfigCV_高科Y_M+$ConfigMove;
	$ConfigCV_高科Bar=$ConfigCV_高科Bar+$ConfigMove;
	//▼定義「ＣＶ：将軍」
	$ConfigCV_将軍Y_E1=$ConfigCV_将軍Y_E1+$ConfigMove;
	$ConfigCV_将軍Y_E2=$ConfigCV_将軍Y_E1+$ConfigCV_将軍V;
	$ConfigCV_将軍Y_M=$ConfigCV_将軍Y_M+$ConfigMove;
	$ConfigCV_将軍Bar=$ConfigCV_将軍Bar+$ConfigMove;
	//▼定義「ＣＶ：判」
	$ConfigCV_判Y_E1=$ConfigCV_判Y_E1+$ConfigMove;
	$ConfigCV_判Y_E2=$ConfigCV_判Y_E1+$ConfigCV_判V;
	$ConfigCV_判Y_M=$ConfigCV_判Y_M+$ConfigMove;
	$ConfigCV_判Bar=$ConfigCV_判Bar+$ConfigMove;
	//▼定義「ＣＶ：野呂瀬」
	$ConfigCV_野呂瀬Y_E1=$ConfigCV_野呂瀬Y_E1+$ConfigMove;
	$ConfigCV_野呂瀬Y_E2=$ConfigCV_野呂瀬Y_E1+$ConfigCV_野呂瀬V;
	$ConfigCV_野呂瀬Y_M=$ConfigCV_野呂瀬Y_M+$ConfigMove;
	$ConfigCV_野呂瀬Bar=$ConfigCV_野呂瀬Bar+$ConfigMove;
	//▼定義「ＣＶ：その他」
	$ConfigCV_その他Y_E1=$ConfigCV_その他Y_E1+$ConfigMove;
	$ConfigCV_その他Y_E2=$ConfigCV_その他Y_E1+$ConfigCV_その他V;
	$ConfigCV_その他Y_M=$ConfigCV_その他Y_M+$ConfigMove;
	$ConfigCV_その他Bar=$ConfigCV_その他Bar+$ConfigMove;
	//▼定義「ストレージ変更」
	$ConfigStorageY_E1=$ConfigStorageY_E1+$ConfigMove;
	$ConfigStorageY_E2=$ConfigStorageY_E1+$ConfigStorageV;
	$ConfigStorageY_M=$ConfigStorageY_M+$ConfigMove;
	$ConfigStorageBar=$ConfigStorageBar+$ConfigMove;
	//▼定義「初期化」
	$ConfigDefaultY_E1=$ConfigDefaultY_E1+$ConfigMove;
	$ConfigDefaultY_E2=$ConfigDefaultY_E1+$ConfigDefaultV;
	$ConfigDefaultY_M=$ConfigDefaultY_M+$ConfigMove;
	$ConfigDefaultBar=$ConfigDefaultBar+$ConfigMove;
	//▼定義「出口」
	$ConfigExitY_E1=$ConfigExitY_E1+$ConfigMove;
	$ConfigExitY_E2=$ConfigExitY_E1+$ConfigExitV;
	$ConfigExitY_M=$ConfigExitY_M+$ConfigMove;
	$ConfigExitBar=$ConfigExitBar+$ConfigMove;
}














//■マクロ「スクロール位置取得」
function ConfigMoveScroll()
{
	Position("Config1f_MSpeed01",$ConfigMSpeedX,$ConfigMSpeedY);
	Position("Config1f_MTrans01",$ConfigMTransX,$ConfigMTransY);
	Position("Config1f_ASpeed01",$ConfigASpeedX,$ConfigASpeedY);
	Position("Config1f_BVolume01",$ConfigBVolumeX,$ConfigBVolumeY);
	Position("Config1f_SVolume01",$ConfigSVolumeX,$ConfigSVolumeY);
	Position("Config1f_VVolume01",$ConfigVVolumeX,$ConfigVVolumeY);
}

//■マクロ「移動先設定」
function ConfigMoveSet()
{
	//▼定義「メッセージスピード」
	$ConfigMSpeedX_E1=$ConfigMSpeedBaseX;
	$ConfigMSpeedY_E1=$ConfigMSpeedY;
	$ConfigMSpeedX_E2=$ConfigMSpeedBaseX2;
	$ConfigMSpeedY_E2=$ConfigMSpeedY_E1+$ConfigMSpeedV;
	$ConfigMSpeedX_M=$ConfigMSpeedX+($ConfigMSpeedH/2);
	$ConfigMSpeedY_M=$ConfigMSpeedY+($ConfigMSpeedV/2);

	//▼定義「ウィンドウ透過度」
	$ConfigMTransX_E1=$ConfigMTransBaseX;
	$ConfigMTransY_E1=$ConfigMTransY;
	$ConfigMTransX_E2=$ConfigMTransBaseX2;
	$ConfigMTransY_E2=$ConfigMTransY_E1+$ConfigMTransV;
	$ConfigMTransX_M=$ConfigMTransX+($ConfigMTransH/2);
	$ConfigMTransY_M=$ConfigMTransY+($ConfigMTransV/2);

	//▼定義「選択肢後の自動文字送り＆スキップを解除」
	$ConfigCSkipOnX_E1=$ConfigCSkipX;
	$ConfigCSkipOnY_E1=$ConfigCSkipY;
	$ConfigCSkipOnX_E2=$ConfigCSkipOnX_E1+$ConfigCSkipOnH;
	$ConfigCSkipOnY_E2=$ConfigCSkipOnY_E1+$ConfigCSkipOnV;
	$ConfigCSkipOnX_M=$ConfigCSkipX+($ConfigCSkipOnH/2);
	$ConfigCSkipOnY_M=$ConfigCSkipY+($ConfigCSkipOnV/2);

	$ConfigCSkipOffX_E1=$ConfigCSkipX2;
	$ConfigCSkipOffY_E1=$ConfigCSkipY2;
	$ConfigCSkipOffX_E2=$ConfigCSkipOffX_E1+$ConfigCSkipOffH;
	$ConfigCSkipOffY_E2=$ConfigCSkipOffY_E1+$ConfigCSkipOffV;
	$ConfigCSkipOffX_M=$ConfigCSkipX2+($ConfigCSkipOffH/2);
	$ConfigCSkipOffY_M=$ConfigCSkipY2+($ConfigCSkipOffV/2);

	//▼定義「未読時でもスキップする？」
	$ConfigASkipOnX_E1=$ConfigASkipX;
	$ConfigASkipOnY_E1=$ConfigASkipY;
	$ConfigASkipOnX_E2=$ConfigASkipOnX_E1+$ConfigASkipOnH;
	$ConfigASkipOnY_E2=$ConfigASkipOnY_E1+$ConfigASkipOnV;
	$ConfigASkipOnX_M=$ConfigASkipX+($ConfigASkipOnH/2);
	$ConfigASkipOnY_M=$ConfigASkipY+($ConfigASkipOnV/2);

	$ConfigASkipOffX_E1=$ConfigASkipX2;
	$ConfigASkipOffY_E1=$ConfigASkipY2;
	$ConfigASkipOffX_E2=$ConfigASkipOffX_E1+$ConfigASkipOffH;
	$ConfigASkipOffY_E2=$ConfigASkipOffY_E1+$ConfigASkipOffV;
	$ConfigASkipOffX_M=$ConfigASkipX2+($ConfigASkipOffH/2);
	$ConfigASkipOffY_M=$ConfigASkipY2+($ConfigASkipOffV/2);

	//▼定義「文字送り時の音声設定」
	$ConfigKVoiceOnX_E1=$ConfigKVoiceX;
	$ConfigKVoiceOnY_E1=$ConfigKVoiceY;
	$ConfigKVoiceOnX_E2=$ConfigKVoiceOnX_E1+$ConfigKVoiceOnH;
	$ConfigKVoiceOnY_E2=$ConfigKVoiceOnY_E1+$ConfigKVoiceOnV;
	$ConfigKVoiceOnX_M=$ConfigKVoiceX+($ConfigKVoiceOnH/2);
	$ConfigKVoiceOnY_M=$ConfigKVoiceY+($ConfigKVoiceOnV/2);

	$ConfigKVoiceOffX_E1=$ConfigKVoiceX2;
	$ConfigKVoiceOffY_E1=$ConfigKVoiceY2;
	$ConfigKVoiceOffX_E2=$ConfigKVoiceOffX_E1+$ConfigKVoiceOffH;
	$ConfigKVoiceOffY_E2=$ConfigKVoiceOffY_E1+$ConfigKVoiceOffV;
	$ConfigKVoiceOffX_M=$ConfigKVoiceX2+($ConfigKVoiceOffH/2);
	$ConfigKVoiceOffY_M=$ConfigKVoiceY2+($ConfigKVoiceOffV/2);

	//▼定義「自動文字送りスピード」
	$ConfigASpeedX_E1=$ConfigASpeedBaseX;
	$ConfigASpeedY_E1=$ConfigASpeedY;
	$ConfigASpeedX_E2=$ConfigASpeedBaseX2;
	$ConfigASpeedY_E2=$ConfigASpeedY_E1+$ConfigASpeedV;
	$ConfigASpeedX_M=$ConfigASpeedX+($ConfigASpeedH/2);
	$ConfigASpeedY_M=$ConfigASpeedY+($ConfigASpeedV/2);

	//▼定義「自動文字送り時の音声設定」
	$ConfigSVoiceOnX_E1=$ConfigSVoiceX;
	$ConfigSVoiceOnY_E1=$ConfigSVoiceY;
	$ConfigSVoiceOnX_E2=$ConfigSVoiceOnX_E1+$ConfigSVoiceOnH;
	$ConfigSVoiceOnY_E2=$ConfigSVoiceOnY_E1+$ConfigSVoiceOnV;
	$ConfigSVoiceOnX_M=$ConfigSVoiceX+($ConfigSVoiceOnH/2);
	$ConfigSVoiceOnY_M=$ConfigSVoiceY+($ConfigSVoiceOnV/2);

	$ConfigSVoiceOffX_E1=$ConfigSVoiceX2;
	$ConfigSVoiceOffY_E1=$ConfigSVoiceY2;
	$ConfigSVoiceOffX_E2=$ConfigSVoiceOffX_E1+$ConfigSVoiceOffH;
	$ConfigSVoiceOffY_E2=$ConfigSVoiceOffY_E1+$ConfigSVoiceOffV;
	$ConfigSVoiceOffX_M=$ConfigSVoiceX2+($ConfigSVoiceOffH/2);
	$ConfigSVoiceOffY_M=$ConfigSVoiceY2+($ConfigSVoiceOffV/2);

	//▼定義「ＢＧＭを再生する」
	$ConfigBPlayOnX_E1=$ConfigBPlayX;
	$ConfigBPlayOnY_E1=$ConfigBPlayY;
	$ConfigBPlayOnX_E2=$ConfigBPlayOnX_E1+$ConfigBPlayOnH;
	$ConfigBPlayOnY_E2=$ConfigBPlayOnY_E1+$ConfigBPlayOnV;
	$ConfigBPlayOnX_M=$ConfigBPlayX+($ConfigBPlayOnH/2);
	$ConfigBPlayOnY_M=$ConfigBPlayY+($ConfigBPlayOnV/2);

	$ConfigBPlayOffX_E1=$ConfigBPlayX2;
	$ConfigBPlayOffY_E1=$ConfigBPlayY2;
	$ConfigBPlayOffX_E2=$ConfigBPlayOffX_E1+$ConfigBPlayOffH;
	$ConfigBPlayOffY_E2=$ConfigBPlayOffY_E1+$ConfigBPlayOffV;
	$ConfigBPlayOffX_M=$ConfigBPlayX2+($ConfigBPlayOffH/2);
	$ConfigBPlayOffY_M=$ConfigBPlayY2+($ConfigBPlayOffV/2);

	//▼定義「ＳＥを再生する」
	$ConfigSPlayOnX_E1=$ConfigSPlayX;
	$ConfigSPlayOnY_E1=$ConfigSPlayY;
	$ConfigSPlayOnX_E2=$ConfigSPlayOnX_E1+$ConfigSPlayOnH;
	$ConfigSPlayOnY_E2=$ConfigSPlayOnY_E1+$ConfigSPlayOnV;
	$ConfigSPlayOnX_M=$ConfigSPlayX+($ConfigSPlayOnH/2);
	$ConfigSPlayOnY_M=$ConfigSPlayY+($ConfigSPlayOnV/2);

	$ConfigSPlayOffX_E1=$ConfigSPlayX2;
	$ConfigSPlayOffY_E1=$ConfigSPlayY2;
	$ConfigSPlayOffX_E2=$ConfigSPlayOffX_E1+$ConfigSPlayOffH;
	$ConfigSPlayOffY_E2=$ConfigSPlayOffY_E1+$ConfigSPlayOffV;
	$ConfigSPlayOffX_M=$ConfigSPlayX2+($ConfigSPlayOffH/2);
	$ConfigSPlayOffY_M=$ConfigSPlayY2+($ConfigSPlayOffV/2);

	//▼定義「音声を再生する」
	$ConfigVPlayOnX_E1=$ConfigVPlayX;
	$ConfigVPlayOnY_E1=$ConfigVPlayY;
	$ConfigVPlayOnX_E2=$ConfigVPlayOnX_E1+$ConfigVPlayOnH;
	$ConfigVPlayOnY_E2=$ConfigVPlayOnY_E1+$ConfigVPlayOnV;
	$ConfigVPlayOnX_M=$ConfigVPlayX+($ConfigVPlayOnH/2);
	$ConfigVPlayOnY_M=$ConfigVPlayY+($ConfigVPlayOnV/2);

	$ConfigVPlayOffX_E1=$ConfigVPlayX2;
	$ConfigVPlayOffY_E1=$ConfigVPlayY2;
	$ConfigVPlayOffX_E2=$ConfigVPlayOffX_E1+$ConfigVPlayOffH;
	$ConfigVPlayOffY_E2=$ConfigVPlayOffY_E1+$ConfigVPlayOffV;
	$ConfigVPlayOffX_M=$ConfigVPlayX2+($ConfigVPlayOffH/2);
	$ConfigVPlayOffY_M=$ConfigVPlayY2+($ConfigVPlayOffV/2);

	//▼定義「ＢＧＭボリューム」
	$ConfigBVolumeX_E1=$ConfigBVolumeBaseX;
	$ConfigBVolumeY_E1=$ConfigBVolumeY;
	$ConfigBVolumeX_E2=$ConfigBVolumeBaseX2;
	$ConfigBVolumeY_E2=$ConfigBVolumeY_E1+$ConfigBVolumeV;
	$ConfigBVolumeX_M=$ConfigBVolumeX+($ConfigBVolumeH/2);
	$ConfigBVolumeY_M=$ConfigBVolumeY+($ConfigBVolumeV/2);

	//▼定義「ＳＥボリューム」
	$ConfigSVolumeX_E1=$ConfigSVolumeBaseX;
	$ConfigSVolumeY_E1=$ConfigSVolumeY;
	$ConfigSVolumeX_E2=$ConfigSVolumeBaseX2;
	$ConfigSVolumeY_E2=$ConfigSVolumeY_E1+$ConfigSVolumeV;
	$ConfigSVolumeX_M=$ConfigSVolumeX+($ConfigSVolumeH/2);
	$ConfigSVolumeY_M=$ConfigSVolumeY+($ConfigSVolumeV/2);

	//▼定義「音声ボリューム」
	$ConfigVVolumeX_E1=$ConfigVVolumeBaseX;
	$ConfigVVolumeY_E1=$ConfigVVolumeY;
	$ConfigVVolumeX_E2=$ConfigVVolumeBaseX2;
	$ConfigVVolumeY_E2=$ConfigVVolumeY_E1+$ConfigVVolumeV;
	$ConfigVVolumeX_M=$ConfigVVolumeX+($ConfigVVolumeH/2);
	$ConfigVVolumeY_M=$ConfigVVolumeY+($ConfigVVolumeV/2);

	//▼定義「ＣＶ：拓巳」
	$ConfigCV_拓巳X_E1=$ConfigCV_拓巳X;
	$ConfigCV_拓巳Y_E1=$ConfigCV_拓巳Y;
	$ConfigCV_拓巳X_E2=$ConfigCV_拓巳X_E1+$ConfigCV_拓巳H;
	$ConfigCV_拓巳Y_E2=$ConfigCV_拓巳Y_E1+$ConfigCV_拓巳V;
	$ConfigCV_拓巳X_M=$ConfigCV_拓巳X+($ConfigCV_拓巳H/2);
	$ConfigCV_拓巳Y_M=$ConfigCV_拓巳Y+($ConfigCV_拓巳V/2);

	//▼定義「ＣＶ：梨深」
	$ConfigCV_梨深X_E1=$ConfigCV_梨深X;
	$ConfigCV_梨深Y_E1=$ConfigCV_梨深Y;
	$ConfigCV_梨深X_E2=$ConfigCV_梨深X_E1+$ConfigCV_梨深H;
	$ConfigCV_梨深Y_E2=$ConfigCV_梨深Y_E1+$ConfigCV_梨深V;
	$ConfigCV_梨深X_M=$ConfigCV_梨深X+($ConfigCV_梨深H/2);
	$ConfigCV_梨深Y_M=$ConfigCV_梨深Y+($ConfigCV_梨深V/2);

	//▼定義「ＣＶ：セナ」
	$ConfigCV_セナX_E1=$ConfigCV_セナX;
	$ConfigCV_セナY_E1=$ConfigCV_セナY;
	$ConfigCV_セナX_E2=$ConfigCV_セナX_E1+$ConfigCV_セナH;
	$ConfigCV_セナY_E2=$ConfigCV_セナY_E1+$ConfigCV_セナV;
	$ConfigCV_セナX_M=$ConfigCV_セナX+($ConfigCV_セナH/2);
	$ConfigCV_セナY_M=$ConfigCV_セナY+($ConfigCV_セナV/2);

	//▼定義「ＣＶ：優愛」
	$ConfigCV_優愛X_E1=$ConfigCV_優愛X;
	$ConfigCV_優愛Y_E1=$ConfigCV_優愛Y;
	$ConfigCV_優愛X_E2=$ConfigCV_優愛X_E1+$ConfigCV_優愛H;
	$ConfigCV_優愛Y_E2=$ConfigCV_優愛Y_E1+$ConfigCV_優愛V;
	$ConfigCV_優愛X_M=$ConfigCV_優愛X+($ConfigCV_優愛H/2);
	$ConfigCV_優愛Y_M=$ConfigCV_優愛Y+($ConfigCV_優愛V/2);

	//▼定義「ＣＶ：梢」
	$ConfigCV_梢X_E1=$ConfigCV_梢X;
	$ConfigCV_梢Y_E1=$ConfigCV_梢Y;
	$ConfigCV_梢X_E2=$ConfigCV_梢X_E1+$ConfigCV_梢H;
	$ConfigCV_梢Y_E2=$ConfigCV_梢Y_E1+$ConfigCV_梢V;
	$ConfigCV_梢X_M=$ConfigCV_梢X+($ConfigCV_梢H/2);
	$ConfigCV_梢Y_M=$ConfigCV_梢Y+($ConfigCV_梢V/2);

	//▼定義「ＣＶ：あやせ」
	$ConfigCV_あやせX_E1=$ConfigCV_あやせX;
	$ConfigCV_あやせY_E1=$ConfigCV_あやせY;
	$ConfigCV_あやせX_E2=$ConfigCV_あやせX_E1+$ConfigCV_あやせH;
	$ConfigCV_あやせY_E2=$ConfigCV_あやせY_E1+$ConfigCV_あやせV;
	$ConfigCV_あやせX_M=$ConfigCV_あやせX+($ConfigCV_あやせH/2);
	$ConfigCV_あやせY_M=$ConfigCV_あやせY+($ConfigCV_あやせV/2);

	//▼定義「ＣＶ：七海」
	$ConfigCV_七海X_E1=$ConfigCV_七海X;
	$ConfigCV_七海Y_E1=$ConfigCV_七海Y;
	$ConfigCV_七海X_E2=$ConfigCV_七海X_E1+$ConfigCV_七海H;
	$ConfigCV_七海Y_E2=$ConfigCV_七海Y_E1+$ConfigCV_七海V;
	$ConfigCV_七海X_M=$ConfigCV_七海X+($ConfigCV_七海H/2);
	$ConfigCV_七海Y_M=$ConfigCV_七海Y+($ConfigCV_七海V/2);

	//▼定義「ＣＶ：星来」
	$ConfigCV_星来X_E1=$ConfigCV_星来X;
	$ConfigCV_星来Y_E1=$ConfigCV_星来Y;
	$ConfigCV_星来X_E2=$ConfigCV_星来X_E1+$ConfigCV_星来H;
	$ConfigCV_星来Y_E2=$ConfigCV_星来Y_E1+$ConfigCV_星来V;
	$ConfigCV_星来X_M=$ConfigCV_星来X+($ConfigCV_星来H/2);
	$ConfigCV_星来Y_M=$ConfigCV_星来Y+($ConfigCV_星来V/2);

	//▼定義「ＣＶ：葉月」
	$ConfigCV_葉月X_E1=$ConfigCV_葉月X;
	$ConfigCV_葉月Y_E1=$ConfigCV_葉月Y;
	$ConfigCV_葉月X_E2=$ConfigCV_葉月X_E1+$ConfigCV_葉月H;
	$ConfigCV_葉月Y_E2=$ConfigCV_葉月Y_E1+$ConfigCV_葉月V;
	$ConfigCV_葉月X_M=$ConfigCV_葉月X+($ConfigCV_葉月H/2);
	$ConfigCV_葉月Y_M=$ConfigCV_葉月Y+($ConfigCV_葉月V/2);

	//▼定義「ＣＶ：三住」
	$ConfigCV_三住X_E1=$ConfigCV_三住X;
	$ConfigCV_三住Y_E1=$ConfigCV_三住Y;
	$ConfigCV_三住X_E2=$ConfigCV_三住X_E1+$ConfigCV_三住H;
	$ConfigCV_三住Y_E2=$ConfigCV_三住Y_E1+$ConfigCV_三住V;
	$ConfigCV_三住X_M=$ConfigCV_三住X+($ConfigCV_三住H/2);
	$ConfigCV_三住Y_M=$ConfigCV_三住Y+($ConfigCV_三住V/2);

	//▼定義「ＣＶ：諏訪」
	$ConfigCV_諏訪X_E1=$ConfigCV_諏訪X;
	$ConfigCV_諏訪Y_E1=$ConfigCV_諏訪Y;
	$ConfigCV_諏訪X_E2=$ConfigCV_諏訪X_E1+$ConfigCV_諏訪H;
	$ConfigCV_諏訪Y_E2=$ConfigCV_諏訪Y_E1+$ConfigCV_諏訪V;
	$ConfigCV_諏訪X_M=$ConfigCV_諏訪X+($ConfigCV_諏訪H/2);
	$ConfigCV_諏訪Y_M=$ConfigCV_諏訪Y+($ConfigCV_諏訪V/2);

	//▼定義「ＣＶ：百瀬」
	$ConfigCV_百瀬X_E1=$ConfigCV_百瀬X;
	$ConfigCV_百瀬Y_E1=$ConfigCV_百瀬Y;
	$ConfigCV_百瀬X_E2=$ConfigCV_百瀬X_E1+$ConfigCV_百瀬H;
	$ConfigCV_百瀬Y_E2=$ConfigCV_百瀬Y_E1+$ConfigCV_百瀬V;
	$ConfigCV_百瀬X_M=$ConfigCV_百瀬X+($ConfigCV_百瀬H/2);
	$ConfigCV_百瀬Y_M=$ConfigCV_百瀬Y+($ConfigCV_百瀬V/2);

	//▼定義「ＣＶ：高科」
	$ConfigCV_高科X_E1=$ConfigCV_高科X;
	$ConfigCV_高科Y_E1=$ConfigCV_高科Y;
	$ConfigCV_高科X_E2=$ConfigCV_高科X_E1+$ConfigCV_高科H;
	$ConfigCV_高科Y_E2=$ConfigCV_高科Y_E1+$ConfigCV_高科V;
	$ConfigCV_高科X_M=$ConfigCV_高科X+($ConfigCV_高科H/2);
	$ConfigCV_高科Y_M=$ConfigCV_高科Y+($ConfigCV_高科V/2);

	//▼定義「ＣＶ：将軍」
	$ConfigCV_将軍X_E1=$ConfigCV_将軍X;
	$ConfigCV_将軍Y_E1=$ConfigCV_将軍Y;
	$ConfigCV_将軍X_E2=$ConfigCV_将軍X_E1+$ConfigCV_将軍H;
	$ConfigCV_将軍Y_E2=$ConfigCV_将軍Y_E1+$ConfigCV_将軍V;
	$ConfigCV_将軍X_M=$ConfigCV_将軍X+($ConfigCV_将軍H/2);
	$ConfigCV_将軍Y_M=$ConfigCV_将軍Y+($ConfigCV_将軍V/2);

	//▼定義「ＣＶ：判」
	$ConfigCV_判X_E1=$ConfigCV_判X;
	$ConfigCV_判Y_E1=$ConfigCV_判Y;
	$ConfigCV_判X_E2=$ConfigCV_判X_E1+$ConfigCV_判H;
	$ConfigCV_判Y_E2=$ConfigCV_判Y_E1+$ConfigCV_判V;
	$ConfigCV_判X_M=$ConfigCV_判X+($ConfigCV_判H/2);
	$ConfigCV_判Y_M=$ConfigCV_判Y+($ConfigCV_判V/2);

	//▼定義「ＣＶ：野呂瀬」
	$ConfigCV_野呂瀬X_E1=$ConfigCV_野呂瀬X;
	$ConfigCV_野呂瀬Y_E1=$ConfigCV_野呂瀬Y;
	$ConfigCV_野呂瀬X_E2=$ConfigCV_野呂瀬X_E1+$ConfigCV_野呂瀬H;
	$ConfigCV_野呂瀬Y_E2=$ConfigCV_野呂瀬Y_E1+$ConfigCV_野呂瀬V;
	$ConfigCV_野呂瀬X_M=$ConfigCV_野呂瀬X+($ConfigCV_野呂瀬H/2);
	$ConfigCV_野呂瀬Y_M=$ConfigCV_野呂瀬Y+($ConfigCV_野呂瀬V/2);

	//▼定義「ＣＶ：その他」
	$ConfigCV_その他X_E1=$ConfigCV_その他X;
	$ConfigCV_その他Y_E1=$ConfigCV_その他Y;
	$ConfigCV_その他X_E2=$ConfigCV_その他X_E1+$ConfigCV_その他H;
	$ConfigCV_その他Y_E2=$ConfigCV_その他Y_E1+$ConfigCV_その他V;
	$ConfigCV_その他X_M=$ConfigCV_その他X+($ConfigCV_その他H/2);
	$ConfigCV_その他Y_M=$ConfigCV_その他Y+($ConfigCV_その他V/2);

	//▼定義「ストレージ変更」
	$ConfigStorageX_E1=$ConfigStorageX;
	$ConfigStorageY_E1=$ConfigStorageY;
	$ConfigStorageX_E2=$ConfigStorageX_E1+$ConfigStorageH;
	$ConfigStorageY_E2=$ConfigStorageY_E1+$ConfigStorageV;
	$ConfigStorageX_M=$ConfigStorageX+($ConfigStorageH/2);
	$ConfigStorageY_M=$ConfigStorageY+($ConfigStorageV/2);

	//▼定義「初期化」
	$ConfigDefaultX_E1=$ConfigDefaultX;
	$ConfigDefaultY_E1=$ConfigDefaultY;
	$ConfigDefaultX_E2=$ConfigDefaultX_E1+$ConfigDefaultH;
	$ConfigDefaultY_E2=$ConfigDefaultY_E1+$ConfigDefaultV;
	$ConfigDefaultX_M=$ConfigDefaultX+($ConfigDefaultH/2);
	$ConfigDefaultY_M=$ConfigDefaultY+($ConfigDefaultV/2);

	//▼定義「出口」
	$ConfigExitX_E1=$ConfigExitX;
	$ConfigExitY_E1=$ConfigExitY;
	$ConfigExitX_E2=$ConfigExitX_E1+$ConfigExitH;
	$ConfigExitY_E2=$ConfigExitY_E1+$ConfigExitV;
	$ConfigExitX_M=$ConfigExitX+($ConfigExitH/2);
	$ConfigExitY_M=$ConfigExitY+($ConfigExitV/2);

}







function ConfigMoveStart2()
{
	if($ConfigNextFlag!=0){
		if($ConfigNextFlag==1){
			;
			Move("Config1*/*/*", 250, @0, @-344, Dxl1, false);
			Move("Config1*", 250, @0, @-344, Dxl1, false);
			$ConfigPage=2;
			Wait(300);
			;
		}else if($ConfigNextFlag==2){
			;
			Move("Config1*/*/*", 250, @0, @-344, Dxl1, false);
			Move("Config1*", 250, @0, @-344, Dxl1, false);
			$ConfigPage=2;
			Wait(300);
			;
		}else if($ConfigNextFlag==3){
			;
			Move("Config1*/*/*", 250, @0, @344, Dxl1, false);
			Move("Config1*", 250, @0, @344, Dxl1, false);
			$ConfigPage=1;
			Wait(300);
			;
		}else if($ConfigNextFlag==4){
			;
			Move("Config1*/*/*", 250, @0, @344, Dxl1, false);
			Move("Config1*", 250, @0, @344, Dxl1, false);
			$ConfigPage=1;
			Wait(300);
			;
		}else if($ConfigNextFlag==5){
			;
			Move("Config1*/*/*", 250, @0, @-224, Dxl1, false);
			Move("Config1*", 250, @0, @-224, Dxl1, false);
			$ConfigPage=3;
			Wait(300);
			;
		}else if($ConfigNextFlag==6){
			;
			Move("Config1*/*/*", 250, @0, @224, Dxl1, false);
			Move("Config1*", 250, @0, @224, Dxl1, false);
			$ConfigPage=2;
			Wait(300);
			;
		}
		$ConfigNextFlag=0;
		ConfigFocus();
	}
}




//■マクロ「初期化」
function ConfigDefaultInit()
{
	#no_ask=false;

	//★尋ねない
	if(!#no_ask){
		$go=false;

		//★★★★ロック
		XBOX360_LockVideo(true);

		//■定義「メッセージウインドウ作成」
		if(!$PLACE_title&&!$SL_Exit&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable&&!$SYSTEM_menu_save_enable&&!$SYSTEM_menu_load_enable&&!$tps_close){
			//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
			CreateName("MSGWND");
		}else{
			//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
			CreateName("MSGWND");
		}

		$DialogText01="Сбросить все настройки по умолчанию?";
		$DialogText02=" ";
//		$DialogText03=" ";
		
		//▲画像ロード
		LoadImage("MSGWND/IMG_yes_on","cg/sys/dialog/yes-002.png");
		LoadImage("MSGWND/IMG_yes_off","cg/sys/dialog/yes-001.png");
		LoadImage("MSGWND/IMG_no_on","cg/sys/dialog/no-002.png");
		LoadImage("MSGWND/IMG_no_off","cg/sys/dialog/no-001.png");
		
		//■定義「背景」
		CreateTexture("MSGWND/MSG_bak",1010000,0,0,"cg/sys/dialog/ダイアログkeep-out.png");
		
		//■定義「選択肢」
		//box
		CreateTexture("MSGWND/MSG_msg",1010000,280,184,"cg/sys/dialog/ダイアログ台座.png");
		//text
		SetFont("ArialTahomaUnicod MS", 18, FFFFFF, 000000, MEDIUM, NULL);
		CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
		CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
//		CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
		//YES
		CreateChoice("MSGWND/MSG_yes");
		CreateTexture("MSGWND/MSG_yes/MouseUsual/img",1012000,360,288,"MSGWND/IMG_yes_off");
		CreateTexture("MSGWND/MSG_yes/MouseOver/img",1011000,360,288,"MSGWND/IMG_yes_on");
		CreateTexture("MSGWND/MSG_yes/MouseClick/img",1011000,360,288,"MSGWND/IMG_yes_on");
		//NO
		CreateChoice("MSGWND/MSG_no");
		CreateTexture("MSGWND/MSG_no/MouseUsual/img",1012000,520,288,"MSGWND/IMG_no_off");
		CreateTexture("MSGWND/MSG_no/MouseOver/img",1011000,520,288,"MSGWND/IMG_no_on");
		CreateTexture("MSGWND/MSG_no/MouseClick/img",1011000,520,288,"MSGWND/IMG_no_on");
		
		//▲セットフォーカス
		SetNextFocus("MSGWND/MSG_yes/MouseUsual/img","MSGWND/MSG_no/MouseUsual/img",LEFT);
		SetNextFocus("MSGWND/MSG_yes/MouseUsual/img","MSGWND/MSG_no/MouseUsual/img",RIGHT);
		SetNextFocus("MSGWND/MSG_yes/MouseUsual/img","MSGWND/MSG_no/MouseUsual/img",DOWN);
		SetNextFocus("MSGWND/MSG_yes/MouseUsual/img","MSGWND/MSG_no/MouseUsual/img",UP);
		SetNextFocus("MSGWND/MSG_no/MouseUsual/img","MSGWND/MSG_yes/MouseUsual/img",LEFT);
		SetNextFocus("MSGWND/MSG_no/MouseUsual/img","MSGWND/MSG_yes/MouseUsual/img",RIGHT);
		SetNextFocus("MSGWND/MSG_no/MouseUsual/img","MSGWND/MSG_yes/MouseUsual/img",DOWN);
		SetNextFocus("MSGWND/MSG_no/MouseUsual/img","MSGWND/MSG_yes/MouseUsual/img",UP);
		
		//●最終準備
		Fade("MSGWND/MSG_*",0,0,null,false);
		Fade("MSGWND/MSG_*/*/*",0,0,null,false);
		Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
		Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
		Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
		Request("MSGWND/MSG_text*", NoLog);
		Request("MSGWND/MSG_text*", PushText);
		
		//●文字位置調整
		//Move("MSGWND/MSG_text1", 0, @15, @-45, null, true);
		Move("MSGWND/MSG_text1", 0, @12, @-44, null, true);
		Move("MSGWND/MSG_text2", 0, @12, @-20, null, true);
		//Move("MSGWND/MSG_text1", 0, @15, @-70, null, true);
		//Move("MSGWND/MSG_text2", 0, @15, @-44, null, true);
		//Move("MSGWND/MSG_text3", 0, @15, @-20, null, true);

		//★★★★アンロック
		XBOX360_LockVideo(false);

		//★描画開始
		Fade("MSGWND/MSG_bak",200,1000,null,false);
		Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
		Move("MSGWND/MSG_msg",300,@0,@6,null,false);
		Move("MSGWND/MSG_text*",300,@0,@6,null,false);
		Fade("MSGWND/MSG_*",300,1000,null,false);
		Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);
		
		WaitAction("MSGWND/MSG_*",null);
		
		;
		
		if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
		$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
		select{
			if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){break;}
			case MSGWND/MSG_no{}
			case MSGWND/MSG_yes{
				$go=true;
			}
		
			if($SYSTEM_menu_close_enable || $SYSTEM_buttondown_close || $SYSTEM_keydown_esc){
				Fade("MSGWND/MSG_text*",200,0,null,false);
				Fade("MSGWND/MSG_*/*/*",200,0,null,false);
				WaitAction("MSGWND/MSG_*/*/*",null);
				
				$InDialog=true;
				call_chapter nss/sys_close.nss;
				$InDialog=false;
				
				Fade("MSGWND/MSG_text*",200,1000,null,false);
				Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);
				WaitAction("MSGWND/MSG_*/*/*",null);
			}
		}
		
		Fade("MSGWND/MSG_*",200,0,null,false);
		Fade("MSGWND/MSG_*/*/*",100,0,null,false);
		Move("MSGWND/MSG_msg",300,@0,@6,null,false);
		Move("MSGWND/MSG_text*",300,@0,@6,null,false);
		Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
		WaitAction("MSGWND/MSG_*",null);

		;

		$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;

		if(!$go){
			MoveCursor($ConfigDefaultX_M,$ConfigDefaultY_M);
			return;
		}
	}

	//★初期化内容
	ConfigFormat();

	$cfgmaketab1=false;
	$cfgmaketab2=false;
	$cfgmaketab3=false;

	$SYSTEM_menu_config_enable=false;
	$ConfigBreakFlag=true;

	SavingStart();
	WaitAction("Config*/*/sound", null);
}



//■マクロ「ストレージ変更」
function ConfigStorageInit()
{
	//★ダイアログ：サインイン確認
	if(XBOX360_IsSignin()){
		DialogConfigStorage();
	}else{
		DialogCautionSignIn();
		MoveCursor($ConfigStorageX_M,$ConfigStorageY_M);
		return;
	}
	MoveCursor($ConfigStorageX_M,$ConfigStorageY_M);
}







//■マクロ「キャラボイス変数確認」
function ConfigCharacterVoice()
{
	#SYSTEM_voice_enable_list=""
	if(!#voice_skip_拓巳){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"拓巳";}
	if(!#voice_skip_梨深){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"梨深";}
	if(!#voice_skip_セナ){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"セナ";}
	if(!#voice_skip_優愛){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"優愛";}
	if(!#voice_skip_梢){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"梢こずえ";}
	if(!#voice_skip_あやせ){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"あやせ";}
	if(!#voice_skip_七海){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"七海";}
	if(!#voice_skip_星来){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"星来";}
	if(!#voice_skip_葉月){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"葉月";}
	if(!#voice_skip_三住){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"三住";}
	if(!#voice_skip_諏訪){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"諏訪";}
	if(!#voice_skip_百瀬){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"百瀬";}
	if(!#voice_skip_高科){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"高科";}
	if(!#voice_skip_将軍){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"将軍";}
	if(!#voice_skip_判){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"判";}
	if(!#voice_skip_野呂瀬){#SYSTEM_voice_enable_list=#SYSTEM_voice_enable_list+"野呂瀬";}
}


//■マクロ「ボイステスト」
function ConfigVoiceTest()
{
	Request("Config1a_TEST01", Stop);
	Request("Config1a_TEST01", Play);
}




//■マクロ「セットフォーカス」
function ConfigFocus()
{
	if($cfgtab==1){

		if($ConfigPage==1){
			ConfigSetFocusBar1("MSpeed", "MTrans", DOWN);
	
			ConfigSetFocusBar1("MTrans", "MSpeed", UP);
			ConfigSetFocusBar2("MTrans", "CSkipON", DOWN);
	
			ConfigSetFocusNor2("CSkipON", "MTrans", UP);
			ConfigSetFocusNor1("CSkipON", "CSkipOFF", LEFT);
			ConfigSetFocusNor1("CSkipON", "ASkipON", DOWN);
			ConfigSetFocusNor1("CSkipON", "CSkipOFF", RIGHT);
			ConfigSetFocusNor2("CSkipOFF", "MTrans", UP);
			ConfigSetFocusNor1("CSkipOFF", "CSkipON", LEFT);
			ConfigSetFocusNor1("CSkipOFF", "ASkipOFF", DOWN);
			ConfigSetFocusNor1("CSkipOFF", "CSkipON", RIGHT);
	
			ConfigSetFocusNor1("ASkipON", "CSkipON", UP);
			ConfigSetFocusNor1("ASkipON", "ASkipOFF", LEFT);
			ConfigSetFocusNor1("ASkipON", "KVoiceON", DOWN);
			ConfigSetFocusNor1("ASkipON", "ASkipOFF", RIGHT);
			ConfigSetFocusNor1("ASkipOFF", "CSkipOFF", UP);
			ConfigSetFocusNor1("ASkipOFF", "ASkipON", LEFT);
			ConfigSetFocusNor1("ASkipOFF", "KVoiceOFF", DOWN);
			ConfigSetFocusNor1("ASkipOFF", "ASkipON", RIGHT);
	
			ConfigSetFocusNor1("KVoiceON", "ASkipON", UP);
			ConfigSetFocusNor1("KVoiceON", "KVoiceOFF", LEFT);
			ConfigSetFocusNor2("KVoiceON", "ASpeed", DOWN);
			ConfigSetFocusNor1("KVoiceON", "KVoiceOFF", RIGHT);
			ConfigSetFocusNor1("KVoiceOFF", "ASkipOFF", UP);
			ConfigSetFocusNor1("KVoiceOFF", "KVoiceON", LEFT);
			ConfigSetFocusNor2("KVoiceOFF", "ASpeed", DOWN);
			ConfigSetFocusNor1("KVoiceOFF", "KVoiceON", RIGHT);
	
			ConfigSetFocusBar2("ASpeed", "KVoiceON", UP);
			ConfigSetFocusBar2("ASpeed", "SVoiceON", DOWN);
	
			ConfigSetFocusNor2("SVoiceON", "ASpeed", UP);
			ConfigSetFocusNor1("SVoiceON", "SVoiceOFF", LEFT);
			ConfigSetFocusNor1("SVoiceON", "BPlayON", DOWN);
			ConfigSetFocusNor1("SVoiceON", "SVoiceOFF", RIGHT);
			ConfigSetFocusNor2("SVoiceOFF", "ASpeed", UP);
			ConfigSetFocusNor1("SVoiceOFF", "SVoiceON", LEFT);
			ConfigSetFocusNor1("SVoiceOFF", "BPlayOFF", DOWN);
			ConfigSetFocusNor1("SVoiceOFF", "SVoiceON", RIGHT);

				ConfigSetFocusNor1("BPlayON", "BPlayON", UP);
				ConfigSetFocusNor1("BPlayON", "BPlayON", LEFT);
				ConfigSetFocusNor2("BPlayON", "BPlayON", DOWN);
				ConfigSetFocusNor1("BPlayON", "BPlayON", RIGHT);
				ConfigSetFocusNor1("BPlayOFF", "BPlayOFF", UP);
				ConfigSetFocusNor1("BPlayOFF", "BPlayOFF", LEFT);
				ConfigSetFocusNor2("BPlayOFF", "BPlayOFF", DOWN);
				ConfigSetFocusNor1("BPlayOFF", "BPlayOFF", RIGHT);

		}else if($ConfigPage==2){
	//―――――――――――――――――――――――――――

				ConfigSetFocusNor2("SVoiceON", "SVoiceON", UP);
				ConfigSetFocusNor1("SVoiceON", "SVoiceON", LEFT);
				ConfigSetFocusNor1("SVoiceON", "SVoiceON", DOWN);
				ConfigSetFocusNor1("SVoiceON", "SVoiceON", RIGHT);
				ConfigSetFocusNor2("SVoiceOFF", "SVoiceOFF", UP);
				ConfigSetFocusNor1("SVoiceOFF", "SVoiceOFF", LEFT);
				ConfigSetFocusNor1("SVoiceOFF", "SVoiceOFF", DOWN);
				ConfigSetFocusNor1("SVoiceOFF", "SVoiceOFF", RIGHT);
	
			ConfigSetFocusNor1("BPlayON", "SVoiceON", UP);
			ConfigSetFocusNor1("BPlayON", "BPlayOFF", LEFT);
			ConfigSetFocusNor2("BPlayON", "BVolume", DOWN);
			ConfigSetFocusNor1("BPlayON", "BPlayOFF", RIGHT);
			ConfigSetFocusNor1("BPlayOFF", "SVoiceOFF", UP);
			ConfigSetFocusNor1("BPlayOFF", "BPlayON", LEFT);
			ConfigSetFocusNor2("BPlayOFF", "BVolume", DOWN);
			ConfigSetFocusNor1("BPlayOFF", "BPlayON", RIGHT);
	
			ConfigSetFocusBar2("BVolume", "BPlayON", UP);
			ConfigSetFocusBar2("BVolume", "SPlayON", DOWN);
	
			ConfigSetFocusNor2("SPlayON", "BVolume", UP);
			ConfigSetFocusNor1("SPlayON", "SPlayOFF", LEFT);
			ConfigSetFocusNor2("SPlayON", "SVolume", DOWN);
			ConfigSetFocusNor1("SPlayON", "SPlayOFF", RIGHT);
			ConfigSetFocusNor2("SPlayOFF", "BVolume", UP);
			ConfigSetFocusNor1("SPlayOFF", "SPlayON", LEFT);
			ConfigSetFocusNor2("SPlayOFF", "SVolume", DOWN);
			ConfigSetFocusNor1("SPlayOFF", "SPlayON", RIGHT);
	
			ConfigSetFocusBar2("SVolume", "SPlayON", UP);
			ConfigSetFocusBar2("SVolume", "VPlayON", DOWN);
	
			ConfigSetFocusNor2("VPlayON", "SVolume", UP);
			ConfigSetFocusNor1("VPlayON", "VPlayOFF", LEFT);
			ConfigSetFocusNor2("VPlayON", "VVolume", DOWN);
			ConfigSetFocusNor1("VPlayON", "VPlayOFF", RIGHT);
			ConfigSetFocusNor2("VPlayOFF", "SVolume", UP);
			ConfigSetFocusNor1("VPlayOFF", "VPlayON", LEFT);
			ConfigSetFocusNor2("VPlayOFF", "VVolume", DOWN);
			ConfigSetFocusNor1("VPlayOFF", "VPlayON", RIGHT);
	
			ConfigSetFocusBar2("VVolume", "VPlayON", UP);
			ConfigSetFocusBar2("VVolume", "CV_拓巳", DOWN);
	
			ConfigSetFocusNor2("CV_拓巳", "VVolume", UP);
			ConfigSetFocusNor1("CV_拓巳", "CV_七海", LEFT);
			ConfigSetFocusNor1("CV_拓巳", "CV_星来", DOWN);
			ConfigSetFocusNor1("CV_拓巳", "CV_梨深", RIGHT);
			ConfigSetFocusNor2("CV_梨深", "VVolume", UP);
			ConfigSetFocusNor1("CV_梨深", "CV_拓巳", LEFT);
			ConfigSetFocusNor1("CV_梨深", "CV_葉月", DOWN);
			ConfigSetFocusNor1("CV_梨深", "CV_セナ", RIGHT);
			ConfigSetFocusNor2("CV_セナ", "VVolume", UP);
			ConfigSetFocusNor1("CV_セナ", "CV_梨深", LEFT);
			ConfigSetFocusNor1("CV_セナ", "CV_三住", DOWN);
			ConfigSetFocusNor1("CV_セナ", "CV_優愛", RIGHT);
			ConfigSetFocusNor2("CV_優愛", "VVolume", UP);
			ConfigSetFocusNor1("CV_優愛", "CV_セナ", LEFT);
			ConfigSetFocusNor1("CV_優愛", "CV_諏訪", DOWN);
			ConfigSetFocusNor1("CV_優愛", "CV_梢", RIGHT);
			ConfigSetFocusNor2("CV_梢", "VVolume", UP);
			ConfigSetFocusNor1("CV_梢", "CV_優愛", LEFT);
			ConfigSetFocusNor1("CV_梢", "CV_百瀬", DOWN);
			ConfigSetFocusNor1("CV_梢", "CV_あやせ", RIGHT);
			ConfigSetFocusNor2("CV_あやせ", "VVolume", UP);
			ConfigSetFocusNor1("CV_あやせ", "CV_梢", LEFT);
			ConfigSetFocusNor1("CV_あやせ", "CV_高科", DOWN);
			ConfigSetFocusNor1("CV_あやせ", "CV_七海", RIGHT);
			ConfigSetFocusNor2("CV_七海", "VVolume", UP);
			ConfigSetFocusNor1("CV_七海", "CV_あやせ", LEFT);
			ConfigSetFocusNor1("CV_七海", "CV_将軍", DOWN);
			ConfigSetFocusNor1("CV_七海", "CV_拓巳", RIGHT);
	
			ConfigSetFocusNor1("CV_星来", "CV_拓巳", UP);
			ConfigSetFocusNor1("CV_星来", "CV_将軍", LEFT);
			ConfigSetFocusNor1("CV_星来", "CV_判", DOWN);
			ConfigSetFocusNor1("CV_星来", "CV_葉月", RIGHT);
			ConfigSetFocusNor1("CV_葉月", "CV_梨深", UP);
			ConfigSetFocusNor1("CV_葉月", "CV_星来", LEFT);
			ConfigSetFocusNor1("CV_葉月", "CV_野呂瀬", DOWN);
			ConfigSetFocusNor1("CV_葉月", "CV_三住", RIGHT);
			ConfigSetFocusNor1("CV_三住", "CV_セナ", UP);
			ConfigSetFocusNor1("CV_三住", "CV_葉月", LEFT);
			ConfigSetFocusNor1("CV_三住", "CV_その他", DOWN);
			ConfigSetFocusNor1("CV_三住", "CV_諏訪", RIGHT);
			ConfigSetFocusNor1("CV_諏訪", "CV_優愛", UP);
			ConfigSetFocusNor1("CV_諏訪", "CV_三住", LEFT);
			ConfigSetFocusNor1("CV_諏訪", "Storage", DOWN);
			ConfigSetFocusNor1("CV_諏訪", "CV_百瀬", RIGHT);
			ConfigSetFocusNor1("CV_百瀬", "CV_梢", UP);
			ConfigSetFocusNor1("CV_百瀬", "CV_諏訪", LEFT);
			ConfigSetFocusNor1("CV_百瀬", "Storage", DOWN);
			ConfigSetFocusNor1("CV_百瀬", "CV_高科", RIGHT);
			ConfigSetFocusNor1("CV_高科", "CV_あやせ", UP);
			ConfigSetFocusNor1("CV_高科", "CV_百瀬", LEFT);
			ConfigSetFocusNor1("CV_高科", "Storage", DOWN);
			ConfigSetFocusNor1("CV_高科", "CV_将軍", RIGHT);
			ConfigSetFocusNor1("CV_将軍", "CV_七海", UP);
			ConfigSetFocusNor1("CV_将軍", "CV_高科", LEFT);
			ConfigSetFocusNor1("CV_将軍", "Storage", DOWN);
			ConfigSetFocusNor1("CV_将軍", "CV_星来", RIGHT);
	
			ConfigSetFocusNor1("CV_判", "CV_星来", UP);
			ConfigSetFocusNor1("CV_判", "CV_その他", LEFT);
			ConfigSetFocusNor1("CV_判", "Storage", DOWN);
			ConfigSetFocusNor1("CV_判", "CV_野呂瀬", RIGHT);
			ConfigSetFocusNor1("CV_野呂瀬", "CV_葉月", UP);
			ConfigSetFocusNor1("CV_野呂瀬", "CV_判", LEFT);
			ConfigSetFocusNor1("CV_野呂瀬", "Storage", DOWN);
			ConfigSetFocusNor1("CV_野呂瀬", "CV_その他", RIGHT);
			ConfigSetFocusNor1("CV_その他", "CV_三住", UP);
			ConfigSetFocusNor1("CV_その他", "CV_野呂瀬", LEFT);
			ConfigSetFocusNor1("CV_その他", "Storage", DOWN);
			ConfigSetFocusNor1("CV_その他", "CV_判", RIGHT);

				ConfigSetFocusNor1("Storage", "Storage", UP);
				ConfigSetFocusNor1("Storage", "Storage", DOWN);

		}else if($ConfigPage==3){
	//―――――――――――――――――――――――――――

				ConfigSetFocusNor1("CV_その他", "CV_その他", UP);
				ConfigSetFocusNor1("CV_その他", "CV_その他", LEFT);
				ConfigSetFocusNor1("CV_その他", "CV_その他", DOWN);
				ConfigSetFocusNor1("CV_その他", "CV_その他", RIGHT);

			ConfigSetFocusNor1("Storage", "CV_その他", UP);
			ConfigSetFocusNor1("Storage", "Default", DOWN);
	
			ConfigSetFocusNor1("Default", "Storage", UP);
			ConfigSetFocusNor1("Default", "EXIT", DOWN);
	
			ConfigSetFocusNor1("EXIT", "Default", UP);
		}
	}
}

//■マクロ「フォーカス用マクロ」
function ConfigSetFocusNor1($a,$b,$fwd)
{
	$a="Config1a_"+$a+"/MouseUsual/hit";
	$b="Config1a_"+$b+"/MouseUsual/hit";
	SetNextFocus($a,$b,$fwd);
}

//■マクロ「フォーカス用マクロ」
function ConfigSetFocusNor2($a,$b,$fwd)
{
	$a="Config1a_"+$a+"/MouseUsual/hit";
	$b="Config1a_"+$b;
	SetNextFocus($a,$b,$fwd);
}

//■マクロ「フォーカス用マクロ」
function ConfigSetFocusBar1($a,$b,$fwd)
{
	$a="Config1a_"+$a;
	$b="Config1a_"+$b;
	SetNextFocus($a,$b,$fwd);
}

//■マクロ「フォーカス用マクロ」
function ConfigSetFocusBar2($a,$b,$fwd)
{
	$a="Config1a_"+$a;
	$b="Config1a_"+$b+"/MouseUsual/hit";
	SetNextFocus($a,$b,$fwd);
}






//■プロセスマクロ「メッセージウィンドウ」
function ConfigMTransProcessOPEN()
{
		Fade("@Config1a_MTrans02", 0, 1000, null, false);
		Fade("@Config1f_MTrans01", 0, 0, null, true);
}
function ConfigMTransProcessSTOP()
{
	Fade("@Config1f_MTrans01", 0, 1000, null, false);
	Fade("@Config1a_MTrans02", 0, 0, null, false);
	SetVolume("@Config1a_MTrans_Pro01/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「メッセージスピード」
function ConfigMSpeedProcessOPEN()
{
		Fade("@Config1a_MSpeed02", 0, 1000, null, false);
		Fade("@Config1f_MSpeed01", 0, 0, null, true);
}
function ConfigMSpeedProcessSTOP()
{
	Fade("@Config1f_MSpeed01", 0, 1000, null, false);
	Fade("@Config1a_MSpeed02", 0, 0, null, false);
	SetVolume("@Config1a_MSpeed_Pro01/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「自動文字送りスピード」
function ConfigASpeedProcessOPEN()
{
		Fade("@Config1a_ASpeed02", 0, 1000, null, false);
		Fade("@Config1f_ASpeed01", 0, 0, null, true);
}
function ConfigASpeedProcessSTOP()
{
	Fade("@Config1f_ASpeed01", 0, 1000, null, false);
	Fade("@Config1a_ASpeed02", 0, 0, null, false);
	SetVolume("@Config1a_ASpeed_Pro01/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＢＧＭボリューム」
function ConfigBVolumeProcessOPEN()
{
		Fade("@Config1a_BVolume02", 0, 1000, null, false);
		Fade("@Config1f_BVolume01", 0, 0, null, true);
}
function ConfigBVolumeProcessSTOP()
{
	Fade("@Config1f_BVolume01", 0, 1000, null, false);
	Fade("@Config1a_BVolume02", 0, 0, null, false);
	SetVolume("@Config1a_BVolume_Pro01/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＳＥボリューム」
function ConfigSVolumeProcessOPEN()
{
		Fade("@Config1a_SVolume02", 0, 1000, null, false);
		Fade("@Config1f_SVolume01", 0, 0, null, true);
}
function ConfigSVolumeProcessSTOP()
{
	Fade("@Config1f_SVolume01", 0, 1000, null, false);
	Fade("@Config1a_SVolume02", 0, 0, null, false);
	SetVolume("@Config1a_SVolume_Pro01/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「音声ボリューム」
function ConfigVVolumeProcessOPEN()
{
		Fade("@Config1a_VVolume02", 0, 1000, null, false);
		Fade("@Config1f_VVolume01", 0, 0, null, true);
}
function ConfigVVolumeProcessSTOP()
{
	Fade("@Config1f_VVolume01", 0, 1000, null, false);
	Fade("@Config1a_VVolume02", 0, 0, null, false);
	SetVolume("@Config1a_VVolume_Pro01/MouseOver/sound", 0, 1000, NULL);
}


//■プロセスマクロ「選択肢後の自動文字送り＆スキップを解除」
function ConfigCSkipProcessOPEN()
{
		Fade("@Config1a_CSkip02", 0, 1000, null, false);
		Fade("@Config1f_CSkip01", 0, 0, null, true);
}
function ConfigCSkipProcessSTOP()
{
	Fade("@Config1f_CSkip01", 0, 1000, null, false);
	Fade("@Config1a_CSkip02", 0, 0, null, false);
	SetVolume("@Config1a_CSkip_Pro01/MouseOver/sound", 0, 1000, NULL);
}


//■プロセスマクロ「選択肢後の自動文字送り＆スキップを解除」
function ConfigCSkipONProcessOPEN()
{
	Request("@Config1a_CSkipOFF/MouseLeave/button", Stop);
	WaitAction("@Config1a_CSkipOFF/MouseLeave/button", null);
	Fade("@Config1a_CSkipBar", 0, 1000, null, false);
}
function ConfigCSkipONProcessSTOP()
{
	Fade("@Config1a_CSkipBar", 100, 0, null, false);
	SetVolume("@Config1a_CSkipON/MouseOver/sound", 0, 1000, NULL);
}
function ConfigCSkipOFFProcessOPEN()
{
	Request("@Config1a_CSkipON/MouseLeave/button", Stop);
	WaitAction("@Config1a_CSkipON/MouseLeave/button", null);
	Fade("@Config1a_CSkipBar", 0, 1000, null, false);
}
function ConfigCSkipOFFProcessSTOP()
{
	Fade("@Config1a_CSkipBar", 100, 0, null, false);
	SetVolume("@Config1a_CSkipOFF/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「未読時でもスキップする？」
function ConfigASkipONProcessOPEN()
{
	Request("@Config1a_ASkipOFF/MouseLeave/button", Stop);
	WaitAction("@Config1a_ASkipOFF/MouseLeave/button", null);
	Fade("@Config1a_ASkipBar", 0, 1000, null, false);
}
function ConfigASkipONProcessSTOP()
{
	Fade("@Config1a_ASkipBar", 100, 0, null, false);
	SetVolume("@Config1a_ASkipON/MouseOver/sound", 0, 1000, NULL);
}
function ConfigASkipOFFProcessOPEN()
{
	Request("@Config1a_ASkipON/MouseLeave/button", Stop);
	WaitAction("@Config1a_ASkipON/MouseLeave/button", null);
	Fade("@Config1a_ASkipBar", 0, 1000, null, false);
}
function ConfigASkipOFFProcessSTOP()
{
	Fade("@Config1a_ASkipBar", 100, 0, null, false);
	SetVolume("@Config1a_ASkipOFF/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「文字送り時の音声設定」
function ConfigKVoiceONProcessOPEN()
{
	Request("@Config1a_KVoiceOFF/MouseLeave/button", Stop);
	WaitAction("@Config1a_KVoiceOFF/MouseLeave/button", null);
	Fade("@Config1a_KVoiceBar", 0, 1000, null, false);
}
function ConfigKVoiceONProcessSTOP()
{
	Fade("@Config1a_KVoiceBar", 100, 0, null, false);
	SetVolume("@Config1a_KVoiceON/MouseOver/sound", 0, 1000, NULL);
}
function ConfigKVoiceOFFProcessOPEN()
{
	Request("@Config1a_KVoiceON/MouseLeave/button", Stop);
	WaitAction("@Config1a_KVoiceON/MouseLeave/button", null);
	Fade("@Config1a_KVoiceBar", 0, 1000, null, false);
}
function ConfigKVoiceOFFProcessSTOP()
{
	Fade("@Config1a_KVoiceBar", 100, 0, null, false);
	SetVolume("@Config1a_KVoiceOFF/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「自動文字送り時の音声設定」
function ConfigSVoiceONProcessOPEN()
{
	Request("@Config1a_SVoiceOFF/MouseLeave/button", Stop);
	WaitAction("@Config1a_SVoiceOFF/MouseLeave/button", null);
	Fade("@Config1a_SVoiceBar", 0, 1000, null, false);
}
function ConfigSVoiceONProcessSTOP()
{
	Fade("@Config1a_SVoiceBar", 100, 0, null, false);
	SetVolume("@Config1a_SVoiceON/MouseOver/sound", 0, 1000, NULL);
}
function ConfigSVoiceOFFProcessOPEN()
{
	Request("@Config1a_SVoiceON/MouseLeave/button", Stop);
	WaitAction("@Config1a_SVoiceON/MouseLeave/button", null);
	Fade("@Config1a_SVoiceBar", 0, 1000, null, false);
}
function ConfigSVoiceOFFProcessSTOP()
{
	Fade("@Config1a_SVoiceBar", 100, 0, null, false);
	SetVolume("@Config1a_SVoiceOFF/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＢＧＭを再生する」
function ConfigBPlayONProcessOPEN()
{
	Request("@Config1a_BPlayOFF/MouseLeave/button", Stop);
	WaitAction("@Config1a_BPlayOFF/MouseLeave/button", null);
	Fade("@Config1a_BPlayBar", 0, 1000, null, false);
}
function ConfigBPlayONProcessSTOP()
{
	Fade("@Config1a_BPlayBar", 100, 0, null, false);
	SetVolume("@Config1a_BPlayON/MouseOver/sound", 0, 1000, NULL);
}
function ConfigBPlayOFFProcessOPEN()
{
	Request("@Config1a_BPlayON/MouseLeave/button", Stop);
	WaitAction("@Config1a_BPlayON/MouseLeave/button", null);
	Fade("@Config1a_BPlayBar", 0, 1000, null, false);
}
function ConfigBPlayOFFProcessSTOP()
{
	Fade("@Config1a_BPlayBar", 100, 0, null, false);
	SetVolume("@Config1a_BPlayOFF/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＳＥを再生する」
function ConfigSPlayONProcessOPEN()
{
	Request("@Config1a_SPlayOFF/MouseLeave/button", Stop);
	WaitAction("@Config1a_SPlayOFF/MouseLeave/button", null);
	Fade("@Config1a_SPlayBar", 0, 1000, null, false);
}
function ConfigSPlayONProcessSTOP()
{
	Fade("@Config1a_SPlayBar", 100, 0, null, false);
	SetVolume("@Config1a_SPlayON/MouseOver/sound", 0, 1000, NULL);
}
function ConfigSPlayOFFProcessOPEN()
{
	Request("@Config1a_SPlayON/MouseLeave/button", Stop);
	WaitAction("@Config1a_SPlayON/MouseLeave/button", null);
	Fade("@Config1a_SPlayBar", 0, 1000, null, false);
}
function ConfigSPlayOFFProcessSTOP()
{
	Fade("@Config1a_SPlayBar", 100, 0, null, false);
	SetVolume("@Config1a_SPlayOFF/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「音声を再生する」
function ConfigVPlayONProcessOPEN()
{
	Request("@Config1a_VPlayOFF/MouseLeave/button", Stop);
	WaitAction("@Config1a_VPlayOFF/MouseLeave/button", null);
	Fade("@Config1a_VPlayBar", 0, 1000, null, false);
}
function ConfigVPlayONProcessSTOP()
{
	Fade("@Config1a_VPlayBar", 100, 0, null, false);
	SetVolume("@Config1a_VPlayON/MouseOver/sound", 0, 1000, NULL);
}
function ConfigVPlayOFFProcessOPEN()
{
	Request("@Config1a_VPlayON/MouseLeave/button", Stop);
	WaitAction("@Config1a_VPlayON/MouseLeave/button", null);
	Fade("@Config1a_VPlayBar", 0, 1000, null, false);
}
function ConfigVPlayOFFProcessSTOP()
{
	Fade("@Config1a_VPlayBar", 100, 0, null, false);
	SetVolume("@Config1a_VPlayOFF/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：拓巳」
function ConfigCV_拓巳ProcessOPEN()
{
	Request("@Config1a_CV_拓巳/MouseLeave/button", Stop);
	Request("@Config1a_CV_梨深/MouseLeave/button", Stop);
	Request("@Config1a_CV_セナ/MouseLeave/button", Stop);
	Request("@Config1a_CV_優愛/MouseLeave/button", Stop);
	Request("@Config1a_CV_梢/MouseLeave/button", Stop);
	Request("@Config1a_CV_あやせ/MouseLeave/button", Stop);
	Request("@Config1a_CV_七海/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_拓巳/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梨深/MouseLeave/button", null);
	WaitAction("@Config1a_CV_セナ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_優愛/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梢/MouseLeave/button", null);
	WaitAction("@Config1a_CV_あやせ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_七海/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar01", 0, 1000, null, false);
}
function ConfigCV_拓巳ProcessSTOP()
{
	Fade("@Config1a_CV_Bar01", 100, 0, null, false);
	SetVolume("@Config1a_CV_拓巳/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：梨深」
function ConfigCV_梨深ProcessOPEN()
{
	Request("@Config1a_CV_拓巳/MouseLeave/button", Stop);
	Request("@Config1a_CV_梨深/MouseLeave/button", Stop);
	Request("@Config1a_CV_セナ/MouseLeave/button", Stop);
	Request("@Config1a_CV_優愛/MouseLeave/button", Stop);
	Request("@Config1a_CV_梢/MouseLeave/button", Stop);
	Request("@Config1a_CV_あやせ/MouseLeave/button", Stop);
	Request("@Config1a_CV_七海/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_拓巳/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梨深/MouseLeave/button", null);
	WaitAction("@Config1a_CV_セナ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_優愛/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梢/MouseLeave/button", null);
	WaitAction("@Config1a_CV_あやせ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_七海/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar01", 0, 1000, null, false);
}
function ConfigCV_梨深ProcessSTOP()
{
	Fade("@Config1a_CV_Bar01", 100, 0, null, false);
	SetVolume("@Config1a_CV_梨深/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：セナ」
function ConfigCV_セナProcessOPEN()
{
	Request("@Config1a_CV_拓巳/MouseLeave/button", Stop);
	Request("@Config1a_CV_梨深/MouseLeave/button", Stop);
	Request("@Config1a_CV_セナ/MouseLeave/button", Stop);
	Request("@Config1a_CV_優愛/MouseLeave/button", Stop);
	Request("@Config1a_CV_梢/MouseLeave/button", Stop);
	Request("@Config1a_CV_あやせ/MouseLeave/button", Stop);
	Request("@Config1a_CV_七海/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_拓巳/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梨深/MouseLeave/button", null);
	WaitAction("@Config1a_CV_セナ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_優愛/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梢/MouseLeave/button", null);
	WaitAction("@Config1a_CV_あやせ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_七海/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar01", 0, 1000, null, false);
}
function ConfigCV_セナProcessSTOP()
{
	Fade("@Config1a_CV_Bar01", 100, 0, null, false);
	SetVolume("@Config1a_CV_セナ/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：優愛」
function ConfigCV_優愛ProcessOPEN()
{
	Request("@Config1a_CV_拓巳/MouseLeave/button", Stop);
	Request("@Config1a_CV_梨深/MouseLeave/button", Stop);
	Request("@Config1a_CV_セナ/MouseLeave/button", Stop);
	Request("@Config1a_CV_優愛/MouseLeave/button", Stop);
	Request("@Config1a_CV_梢/MouseLeave/button", Stop);
	Request("@Config1a_CV_あやせ/MouseLeave/button", Stop);
	Request("@Config1a_CV_七海/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_拓巳/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梨深/MouseLeave/button", null);
	WaitAction("@Config1a_CV_セナ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_優愛/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梢/MouseLeave/button", null);
	WaitAction("@Config1a_CV_あやせ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_七海/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar01", 0, 1000, null, false);
}
function ConfigCV_優愛ProcessSTOP()
{
	Fade("@Config1a_CV_Bar01", 100, 0, null, false);
	SetVolume("@Config1a_CV_優愛/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：梢」
function ConfigCV_梢ProcessOPEN()
{
	Request("@Config1a_CV_拓巳/MouseLeave/button", Stop);
	Request("@Config1a_CV_梨深/MouseLeave/button", Stop);
	Request("@Config1a_CV_セナ/MouseLeave/button", Stop);
	Request("@Config1a_CV_優愛/MouseLeave/button", Stop);
	Request("@Config1a_CV_梢/MouseLeave/button", Stop);
	Request("@Config1a_CV_あやせ/MouseLeave/button", Stop);
	Request("@Config1a_CV_七海/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_拓巳/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梨深/MouseLeave/button", null);
	WaitAction("@Config1a_CV_セナ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_優愛/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梢/MouseLeave/button", null);
	WaitAction("@Config1a_CV_あやせ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_七海/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar01", 0, 1000, null, false);
}
function ConfigCV_梢ProcessSTOP()
{
	Fade("@Config1a_CV_Bar01", 100, 0, null, false);
	SetVolume("@Config1a_CV_梢/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：あやせ」
function ConfigCV_あやせProcessOPEN()
{
	Request("@Config1a_CV_拓巳/MouseLeave/button", Stop);
	Request("@Config1a_CV_梨深/MouseLeave/button", Stop);
	Request("@Config1a_CV_セナ/MouseLeave/button", Stop);
	Request("@Config1a_CV_優愛/MouseLeave/button", Stop);
	Request("@Config1a_CV_梢/MouseLeave/button", Stop);
	Request("@Config1a_CV_あやせ/MouseLeave/button", Stop);
	Request("@Config1a_CV_七海/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_拓巳/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梨深/MouseLeave/button", null);
	WaitAction("@Config1a_CV_セナ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_優愛/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梢/MouseLeave/button", null);
	WaitAction("@Config1a_CV_あやせ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_七海/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar01", 0, 1000, null, false);
}
function ConfigCV_あやせProcessSTOP()
{
	Fade("@Config1a_CV_Bar01", 100, 0, null, false);
	SetVolume("@Config1a_CV_あやせ/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：七海」
function ConfigCV_七海ProcessOPEN()
{
	Request("@Config1a_CV_拓巳/MouseLeave/button", Stop);
	Request("@Config1a_CV_梨深/MouseLeave/button", Stop);
	Request("@Config1a_CV_セナ/MouseLeave/button", Stop);
	Request("@Config1a_CV_優愛/MouseLeave/button", Stop);
	Request("@Config1a_CV_梢/MouseLeave/button", Stop);
	Request("@Config1a_CV_あやせ/MouseLeave/button", Stop);
	Request("@Config1a_CV_七海/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_拓巳/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梨深/MouseLeave/button", null);
	WaitAction("@Config1a_CV_セナ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_優愛/MouseLeave/button", null);
	WaitAction("@Config1a_CV_梢/MouseLeave/button", null);
	WaitAction("@Config1a_CV_あやせ/MouseLeave/button", null);
	WaitAction("@Config1a_CV_七海/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar01", 0, 1000, null, false);
}
function ConfigCV_七海ProcessSTOP()
{
	Fade("@Config1a_CV_Bar01", 100, 0, null, false);
	SetVolume("@Config1a_CV_七海/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：星来」
function ConfigCV_星来ProcessOPEN()
{
	Request("@Config1a_CV_星来/MouseLeave/button", Stop);
	Request("@Config1a_CV_葉月/MouseLeave/button", Stop);
	Request("@Config1a_CV_三住/MouseLeave/button", Stop);
	Request("@Config1a_CV_諏訪/MouseLeave/button", Stop);
	Request("@Config1a_CV_百瀬/MouseLeave/button", Stop);
	Request("@Config1a_CV_高科/MouseLeave/button", Stop);
	Request("@Config1a_CV_将軍/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_星来/MouseLeave/button", null);
	WaitAction("@Config1a_CV_葉月/MouseLeave/button", null);
	WaitAction("@Config1a_CV_三住/MouseLeave/button", null);
	WaitAction("@Config1a_CV_諏訪/MouseLeave/button", null);
	WaitAction("@Config1a_CV_百瀬/MouseLeave/button", null);
	WaitAction("@Config1a_CV_高科/MouseLeave/button", null);
	WaitAction("@Config1a_CV_将軍/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar02", 0, 1000, null, false);
}
function ConfigCV_星来ProcessSTOP()
{
	Fade("@Config1a_CV_Bar02", 100, 0, null, false);
	SetVolume("@Config1a_CV_星来/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：葉月」
function ConfigCV_葉月ProcessOPEN()
{
	Request("@Config1a_CV_星来/MouseLeave/button", Stop);
	Request("@Config1a_CV_葉月/MouseLeave/button", Stop);
	Request("@Config1a_CV_三住/MouseLeave/button", Stop);
	Request("@Config1a_CV_諏訪/MouseLeave/button", Stop);
	Request("@Config1a_CV_百瀬/MouseLeave/button", Stop);
	Request("@Config1a_CV_高科/MouseLeave/button", Stop);
	Request("@Config1a_CV_将軍/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_星来/MouseLeave/button", null);
	WaitAction("@Config1a_CV_葉月/MouseLeave/button", null);
	WaitAction("@Config1a_CV_三住/MouseLeave/button", null);
	WaitAction("@Config1a_CV_諏訪/MouseLeave/button", null);
	WaitAction("@Config1a_CV_百瀬/MouseLeave/button", null);
	WaitAction("@Config1a_CV_高科/MouseLeave/button", null);
	WaitAction("@Config1a_CV_将軍/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar02", 0, 1000, null, false);
}
function ConfigCV_葉月ProcessSTOP()
{
	Fade("@Config1a_CV_Bar02", 100, 0, null, false);
	SetVolume("@Config1a_CV_葉月/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：三住」
function ConfigCV_三住ProcessOPEN()
{
	Request("@Config1a_CV_星来/MouseLeave/button", Stop);
	Request("@Config1a_CV_葉月/MouseLeave/button", Stop);
	Request("@Config1a_CV_三住/MouseLeave/button", Stop);
	Request("@Config1a_CV_諏訪/MouseLeave/button", Stop);
	Request("@Config1a_CV_百瀬/MouseLeave/button", Stop);
	Request("@Config1a_CV_高科/MouseLeave/button", Stop);
	Request("@Config1a_CV_将軍/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_星来/MouseLeave/button", null);
	WaitAction("@Config1a_CV_葉月/MouseLeave/button", null);
	WaitAction("@Config1a_CV_三住/MouseLeave/button", null);
	WaitAction("@Config1a_CV_諏訪/MouseLeave/button", null);
	WaitAction("@Config1a_CV_百瀬/MouseLeave/button", null);
	WaitAction("@Config1a_CV_高科/MouseLeave/button", null);
	WaitAction("@Config1a_CV_将軍/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar02", 0, 1000, null, false);
}
function ConfigCV_三住ProcessSTOP()
{
	Fade("@Config1a_CV_Bar02", 100, 0, null, false);
	SetVolume("@Config1a_CV_三住/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：諏訪」
function ConfigCV_諏訪ProcessOPEN()
{
	Request("@Config1a_CV_星来/MouseLeave/button", Stop);
	Request("@Config1a_CV_葉月/MouseLeave/button", Stop);
	Request("@Config1a_CV_三住/MouseLeave/button", Stop);
	Request("@Config1a_CV_諏訪/MouseLeave/button", Stop);
	Request("@Config1a_CV_百瀬/MouseLeave/button", Stop);
	Request("@Config1a_CV_高科/MouseLeave/button", Stop);
	Request("@Config1a_CV_将軍/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_星来/MouseLeave/button", null);
	WaitAction("@Config1a_CV_葉月/MouseLeave/button", null);
	WaitAction("@Config1a_CV_三住/MouseLeave/button", null);
	WaitAction("@Config1a_CV_諏訪/MouseLeave/button", null);
	WaitAction("@Config1a_CV_百瀬/MouseLeave/button", null);
	WaitAction("@Config1a_CV_高科/MouseLeave/button", null);
	WaitAction("@Config1a_CV_将軍/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar02", 0, 1000, null, false);
}
function ConfigCV_諏訪ProcessSTOP()
{
	Fade("@Config1a_CV_Bar02", 100, 0, null, false);
	SetVolume("@Config1a_CV_諏訪/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：百瀬」
function ConfigCV_百瀬ProcessOPEN()
{
	Request("@Config1a_CV_星来/MouseLeave/button", Stop);
	Request("@Config1a_CV_葉月/MouseLeave/button", Stop);
	Request("@Config1a_CV_三住/MouseLeave/button", Stop);
	Request("@Config1a_CV_諏訪/MouseLeave/button", Stop);
	Request("@Config1a_CV_百瀬/MouseLeave/button", Stop);
	Request("@Config1a_CV_高科/MouseLeave/button", Stop);
	Request("@Config1a_CV_将軍/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_星来/MouseLeave/button", null);
	WaitAction("@Config1a_CV_葉月/MouseLeave/button", null);
	WaitAction("@Config1a_CV_三住/MouseLeave/button", null);
	WaitAction("@Config1a_CV_諏訪/MouseLeave/button", null);
	WaitAction("@Config1a_CV_百瀬/MouseLeave/button", null);
	WaitAction("@Config1a_CV_高科/MouseLeave/button", null);
	WaitAction("@Config1a_CV_将軍/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar02", 0, 1000, null, false);
}
function ConfigCV_百瀬ProcessSTOP()
{
	Fade("@Config1a_CV_Bar02", 100, 0, null, false);
	SetVolume("@Config1a_CV_百瀬/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：高科」
function ConfigCV_高科ProcessOPEN()
{
	Request("@Config1a_CV_星来/MouseLeave/button", Stop);
	Request("@Config1a_CV_葉月/MouseLeave/button", Stop);
	Request("@Config1a_CV_三住/MouseLeave/button", Stop);
	Request("@Config1a_CV_諏訪/MouseLeave/button", Stop);
	Request("@Config1a_CV_百瀬/MouseLeave/button", Stop);
	Request("@Config1a_CV_高科/MouseLeave/button", Stop);
	Request("@Config1a_CV_将軍/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_星来/MouseLeave/button", null);
	WaitAction("@Config1a_CV_葉月/MouseLeave/button", null);
	WaitAction("@Config1a_CV_三住/MouseLeave/button", null);
	WaitAction("@Config1a_CV_諏訪/MouseLeave/button", null);
	WaitAction("@Config1a_CV_百瀬/MouseLeave/button", null);
	WaitAction("@Config1a_CV_高科/MouseLeave/button", null);
	WaitAction("@Config1a_CV_将軍/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar02", 0, 1000, null, false);
}
function ConfigCV_高科ProcessSTOP()
{
	Fade("@Config1a_CV_Bar02", 100, 0, null, false);
	SetVolume("@Config1a_CV_高科/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：将軍」
function ConfigCV_将軍ProcessOPEN()
{
	Request("@Config1a_CV_星来/MouseLeave/button", Stop);
	Request("@Config1a_CV_葉月/MouseLeave/button", Stop);
	Request("@Config1a_CV_三住/MouseLeave/button", Stop);
	Request("@Config1a_CV_諏訪/MouseLeave/button", Stop);
	Request("@Config1a_CV_百瀬/MouseLeave/button", Stop);
	Request("@Config1a_CV_高科/MouseLeave/button", Stop);
	Request("@Config1a_CV_将軍/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_星来/MouseLeave/button", null);
	WaitAction("@Config1a_CV_葉月/MouseLeave/button", null);
	WaitAction("@Config1a_CV_三住/MouseLeave/button", null);
	WaitAction("@Config1a_CV_諏訪/MouseLeave/button", null);
	WaitAction("@Config1a_CV_百瀬/MouseLeave/button", null);
	WaitAction("@Config1a_CV_高科/MouseLeave/button", null);
	WaitAction("@Config1a_CV_将軍/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar02", 0, 1000, null, false);
}
function ConfigCV_将軍ProcessSTOP()
{
	Fade("@Config1a_CV_Bar02", 100, 0, null, false);
	SetVolume("@Config1a_CV_将軍/MouseOver/sound", 0, 1000, NULL);
}


//■プロセスマクロ「ＣＶ：判」
function ConfigCV_判ProcessOPEN()
{
	Request("@Config1a_CV_判/MouseLeave/button", Stop);
	Request("@Config1a_CV_野呂瀬/MouseLeave/button", Stop);
	Request("@Config1a_CV_その他/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_判/MouseLeave/button", null);
	WaitAction("@Config1a_CV_野呂瀬/MouseLeave/button", null);
	WaitAction("@Config1a_CV_その他/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar03", 0, 1000, null, false);
}
function ConfigCV_判ProcessSTOP()
{
	Fade("@Config1a_CV_Bar03", 100, 0, null, false);
	SetVolume("@Config1a_CV_判/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：野呂瀬」
function ConfigCV_野呂瀬ProcessOPEN()
{
	Request("@Config1a_CV_判/MouseLeave/button", Stop);
	Request("@Config1a_CV_野呂瀬/MouseLeave/button", Stop);
	Request("@Config1a_CV_その他/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_判/MouseLeave/button", null);
	WaitAction("@Config1a_CV_野呂瀬/MouseLeave/button", null);
	WaitAction("@Config1a_CV_その他/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar03", 0, 1000, null, false);
}
function ConfigCV_野呂瀬ProcessSTOP()
{
	Fade("@Config1a_CV_Bar03", 100, 0, null, false);
	SetVolume("@Config1a_CV_野呂瀬/MouseOver/sound", 0, 1000, NULL);
}

//■プロセスマクロ「ＣＶ：その他」
function ConfigCV_その他ProcessOPEN()
{
	Request("@Config1a_CV_判/MouseLeave/button", Stop);
	Request("@Config1a_CV_野呂瀬/MouseLeave/button", Stop);
	Request("@Config1a_CV_その他/MouseLeave/button", Stop);
	WaitAction("@Config1a_CV_判/MouseLeave/button", null);
	WaitAction("@Config1a_CV_野呂瀬/MouseLeave/button", null);
	WaitAction("@Config1a_CV_その他/MouseLeave/button", null);
	Fade("@Config1a_CV_Bar03", 0, 1000, null, false);
}
function ConfigCV_その他ProcessSTOP()
{
	Fade("@Config1a_CV_Bar03", 100, 0, null, false);
	SetVolume("@Config1a_CV_その他/MouseOver/sound", 0, 1000, NULL);
}



