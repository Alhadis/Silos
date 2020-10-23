#include "nss/function_system.nss"

//=============================================================================//
//■メニュー■
//=============================================================================//
chapter main
{

	//★★★★ロック
	XBOX360_LockVideo(true);

	CursorPosition($PosX,$PosY);

	//★定義「ストレージ番号取得」
	FlagCheck();

	if($GameClose){return;}

	if(Platform()==100){
		CreateTexture("video1",0,center,middle,SCREEN);
	}else{
		CreateTexture("video1",0,center,middle,VIDEO);
	}

	//★選択肢への布石
	if($CX==500&&$CY==300){
		Fade("<@選択肢１/MouseOver/選択範囲２>", 0, 0, null, true);
	}else if($CX==750&&$CY==300){
		Fade("<@選択肢２/MouseOver/選択範囲２>", 0, 0, null, true);
	}

	//■背景
	$MenuBaseLX=0;
	$MenuBaseLY=160;
	$MenuBaseRX=506;
	$MenuBaseRY=0;

	CreateTexture("Menuベース左", 1001, $MenuBaseLX, $MenuBaseLY, "cg/sys/menu/Pull-down-L000.png");
	CreateTexture("Menuベース右", 1001, $MenuBaseRX, $MenuBaseRY, "cg/sys/menu/Pull-down-R000.png");

	//■選択肢
	$MenuEraseX=$MenuBaseLX;
	$MenuEraseY=$MenuBaseLY;
	$MenuSendX=$MenuBaseLX;
	$MenuSendY=$MenuBaseLY;
	$MenuTitleX=$MenuBaseLX;
	$MenuTitleY=$MenuBaseLY;
	$MenuCancelX=$MenuBaseLX;
	$MenuCancelY=$MenuBaseLY;
	$MenuTipsX=$MenuBaseLX;
	$MenuTipsY=$MenuBaseLY;

	$MenuSaveX=$MenuBaseRX;
	$MenuSaveY=$MenuBaseRY;
	$MenuLoadX=$MenuBaseRX;
	$MenuLoadY=$MenuBaseRY;
	$MenuSkipX=$MenuBaseRX;
	$MenuSkipY=$MenuBaseRY;
	$MenuLogX=$MenuBaseRX;
	$MenuLogY=$MenuBaseRY;
	$MenuConfigX=$MenuBaseRX;
	$MenuConfigY=$MenuBaseRY;

	$MenuEraseX2=276;
	$MenuEraseY2=336;
	$MenuSendX2=321;
	$MenuSendY2=381;
	$MenuTitleX2=296;
	$MenuTitleY2=408;
	$MenuCancelX2=212;
	$MenuCancelY2=420;
	$MenuTipsX2=122;
	$MenuTipsY2=433;

	$MenuSaveX2=736;
	$MenuSaveY2=22;
	$MenuLoadX2=692;
	$MenuLoadY2=36;
	$MenuSkipX2=642;
	$MenuSkipY2=44;
	$MenuLogX2=676;
	$MenuLogY2=96;
	$MenuConfigX2=708;
	$MenuConfigY2=138;

	$MenuSpace=30;

	CreateChoice("Menuメッセージ");
	SetAlias("Menuメッセージ", "Menuメッセージ");
	CreateTexture("Menuメッセージ/MouseUsual/hit",1020,$MenuEraseX,$MenuEraseY,"cg/sys/menu/Pull-down-L005-D.png");
	CreateTexture("Menuメッセージimg",1020,$MenuEraseX,$MenuEraseY,"cg/sys/menu/Pull-down-L005-A.png");
	CreateTexture("Menuメッセージ/MouseOver/img",1020,$MenuEraseX,$MenuEraseY,"cg/sys/menu/Pull-down-L005-B.png");
	CreateTexture("Menuメッセージ/MouseClick/img",1020,$MenuEraseX,$MenuEraseY,"cg/sys/menu/Pull-down-L005-C.png");
//	CreateProcess("Menuメッセージ/MouseOver/chメッセージプロセス１", 150, 0, 0, "MenuEraseProcessOpen");
//	CreateProcess("Menuメッセージ/MouseLeave/chメッセージプロセス２", 150, 0, 0, "MenuEraseProcessPause");
	CreateChoice("Menuメッセージ２");
	SetAlias("Menuメッセージ２", "Menuメッセージ２");
	CreateColor("Menuメッセージ２/MouseUsual/hit", 1150, $MenuEraseX2,$MenuEraseY2, $MenuSpace, $MenuSpace, "BLACK");


	CreateChoice("Menu自動メッセージ");
	SetAlias("Menu自動メッセージ", "Menu自動メッセージ");
	CreateTexture("Menu自動メッセージ/MouseUsual/hit",1020,$MenuSendX,$MenuSendY,"cg/sys/menu/Pull-down-L004-D.png");
	CreateTexture("Menu自動メッセージimg",1020,$MenuSendX,$MenuSendY,"cg/sys/menu/Pull-down-L004-A.png");
	CreateTexture("Menu自動メッセージ/MouseOver/img",1020,$MenuSendX,$MenuSendY,"cg/sys/menu/Pull-down-L004-B.png");
	CreateTexture("Menu自動メッセージ/MouseClick/img",1020,$MenuSendX,$MenuSendY,"cg/sys/menu/Pull-down-L004-C.png");
//	CreateProcess("Menu自動メッセージ/MouseOver/ch自動メッセージプロセス１", 150, 0, 0, "MenuSendProcessOpen");
//	CreateProcess("Menu自動メッセージ/MouseLeave/ch自動メッセージプロセス２", 150, 0, 0, "MenuSendProcessPause");
	CreateChoice("Menu自動メッセージ２");
	SetAlias("Menu自動メッセージ２", "Menu自動メッセージ２");
	CreateColor("Menu自動メッセージ２/MouseUsual/hit", 1150, $MenuSendX2,$MenuSendY2, $MenuSpace, $MenuSpace, "BLACK");

	CreateChoice("Menuタイトル");
	SetAlias("Menuタイトル", "Menuタイトル");
	CreateTexture("Menuタイトル/MouseUsual/hit",1020,$MenuTitleX,$MenuTitleY,"cg/sys/menu/Pull-down-L003-D.png");
	CreateTexture("Menuタイトルimg",1020,$MenuTitleX,$MenuTitleY,"cg/sys/menu/Pull-down-L003-A.png");
	CreateTexture("Menuタイトル/MouseOver/img",1020,$MenuTitleX,$MenuTitleY,"cg/sys/menu/Pull-down-L003-B.png");
	CreateTexture("Menuタイトル/MouseClick/img",1020,$MenuTitleX,$MenuTitleY,"cg/sys/menu/Pull-down-L003-C.png");
//	CreateProcess("Menuタイトル/MouseOver/chタイトルプロセス１", 150, 0, 0, "MenuTitleProcessOpen");
//	CreateProcess("Menuタイトル/MouseLeave/chタイトルプロセス２", 150, 0, 0, "MenuTitleProcessPause");
	CreateChoice("Menuタイトル２");
	SetAlias("Menuタイトル２", "Menuタイトル２");
	CreateColor("Menuタイトル２/MouseUsual/hit", 1150, $MenuTitleX2,$MenuTitleY2, $MenuSpace, $MenuSpace, "BLACK");

	CreateChoice("Menuキャンセル");
	SetAlias("Menuキャンセル", "Menuキャンセル");
	CreateTexture("Menuキャンセル/MouseUsual/hit",1020,$MenuCancelX,$MenuCancelY,"cg/sys/menu/Pull-down-L002-D.png");
	CreateTexture("Menuキャンセルimg",1020,$MenuCancelX,$MenuCancelY,"cg/sys/menu/Pull-down-L002-A.png");
	CreateTexture("Menuキャンセル/MouseOver/img",1020,$MenuCancelX,$MenuCancelY,"cg/sys/menu/Pull-down-L002-B.png");
	CreateTexture("Menuキャンセル/MouseClick/img",1020,$MenuCancelX,$MenuCancelY,"cg/sys/menu/Pull-down-L002-C.png");
//	CreateProcess("Menuキャンセル/MouseOver/chキャンセルプロセス１", 150, 0, 0, "MenuCancelProcessOpen");
//	CreateProcess("Menuキャンセル/MouseLeave/chキャンセルプロセス２", 150, 0, 0, "MenuCancelProcessPause");
	CreateChoice("Menuキャンセル２");
	SetAlias("Menuキャンセル２", "Menuキャンセル２");
	CreateColor("Menuキャンセル２/MouseUsual/hit", 1150, $MenuCancelX2,$MenuCancelY2, $MenuSpace, $MenuSpace, "BLACK");

	CreateChoice("Menuティップス");
	SetAlias("Menuティップス", "Menuティップス");
	CreateTexture("Menuティップス/MouseUsual/hit",1020,$MenuTipsX,$MenuTipsY,"cg/sys/menu/Pull-down-L001-D.png");
	CreateTexture("Menuティップスimg",1020,$MenuTipsX,$MenuTipsY,"cg/sys/menu/Pull-down-L001-A.png");
	CreateTexture("Menuティップス/MouseOver/img",1020,$MenuTipsX,$MenuTipsY,"cg/sys/menu/Pull-down-L001-B.png");
	CreateTexture("Menuティップス/MouseClick/img",1020,$MenuTipsX,$MenuTipsY,"cg/sys/menu/Pull-down-L001-C.png");
//	CreateProcess("Menuティップス/MouseOver/chティップスプロセス１", 150, 0, 0, "MenuCancelProcessOpen");
//	CreateProcess("Menuティップス/MouseLeave/chティップスプロセス２", 150, 0, 0, "MenuCancelProcessPause");
	CreateChoice("Menuティップス２");
	SetAlias("Menuティップス２", "Menuティップス２");
	CreateColor("Menuティップス２/MouseUsual/hit", 1150, $MenuTipsX2,$MenuTipsY2, $MenuSpace, $MenuSpace, "BLACK");




	CreateChoice("Menuコンフィグ");
	SetAlias("Menuコンフィグ", "Menuコンフィグ");
	CreateTexture("Menuコンフィグ/MouseUsual/hit",1020,$MenuConfigX,$MenuConfigY,"cg/sys/menu/Pull-down-R005-D.png");
	CreateTexture("Menuコンフィグimg",1020,$MenuConfigX,$MenuConfigY,"cg/sys/menu/Pull-down-R005-A.png");
	CreateTexture("Menuコンフィグ/MouseOver/img",1020,$MenuConfigX,$MenuConfigY,"cg/sys/menu/Pull-down-R005-B.png");
	CreateTexture("Menuコンフィグ/MouseClick/img",1020,$MenuConfigX,$MenuConfigY,"cg/sys/menu/Pull-down-R005-C.png");
//	CreateProcess("Menuコンフィグ/MouseOver/chコンフィグプロセス１", 150, 0, 0, "MenuConfigProcessOpen");
//	CreateProcess("Menuコンフィグ/MouseLeave/chコンフィグプロセス２", 150, 0, 0, "MenuConfigProcessPause");
	CreateChoice("Menuコンフィグ２");
	SetAlias("Menuコンフィグ２", "Menuコンフィグ２");
	CreateColor("Menuコンフィグ２/MouseUsual/hit", 1150, $MenuConfigX2,$MenuConfigY2, $MenuSpace, $MenuSpace, "BLACK");


	CreateChoice("Menuバックログ");
	SetAlias("Menuバックログ", "Menuバックログ");
	CreateTexture("Menuバックログ/MouseUsual/hit",1020,$MenuLogX,$MenuLogY,"cg/sys/menu/Pull-down-R004-D.png");
	CreateTexture("Menuバックログimg",1020,$MenuLogX,$MenuLogY,"cg/sys/menu/Pull-down-R004-A.png");
	CreateTexture("Menuバックログ/MouseOver/img",1020,$MenuLogX,$MenuLogY,"cg/sys/menu/Pull-down-R004-B.png");
	CreateTexture("Menuバックログ/MouseClick/img",1020,$MenuLogX,$MenuLogY,"cg/sys/menu/Pull-down-R004-C.png");
//	CreateProcess("Menuバックログ/MouseOver/chバックログプロセス１", 150, 0, 0, "MenuLogProcessOpen");
//	CreateProcess("Menuバックログ/MouseLeave/chバックログプロセス２", 150, 0, 0, "MenuLogProcessPause");
	CreateChoice("Menuバックログ２");
	SetAlias("Menuバックログ２", "Menuバックログ２");
	CreateColor("Menuバックログ２/MouseUsual/hit", 1150, $MenuLogX2,$MenuLogY2, $MenuSpace, $MenuSpace, "BLACK");

	CreateChoice("Menuスキップ");
	SetAlias("Menuスキップ", "Menuスキップ");
	CreateTexture("Menuスキップ/MouseUsual/hit",1020,$MenuSkipX,$MenuSkipY,"cg/sys/menu/Pull-down-R003-D.png");
	CreateTexture("Menuスキップimg",1020,$MenuSkipX,$MenuSkipY,"cg/sys/menu/Pull-down-R003-A.png");
	CreateTexture("Menuスキップ/MouseOver/img",1020,$MenuSkipX,$MenuSkipY,"cg/sys/menu/Pull-down-R003-B.png");
	CreateTexture("Menuスキップ/MouseClick/img",1020,$MenuSkipX,$MenuSkipY,"cg/sys/menu/Pull-down-R003-C.png");
//	CreateProcess("Menuスキップ/MouseOver/chスキッププロセス１", 150, 0, 0, "MenuSkipProcessOpen");
//	CreateProcess("Menuスキップ/MouseLeave/chスキッププロセス２", 150, 0, 0, "MenuSkipProcessPause");
	CreateChoice("Menuスキップ２");
	SetAlias("Menuスキップ２", "Menuスキップ２");
	CreateColor("Menuスキップ２/MouseUsual/hit", 1150, $MenuSkipX2,$MenuSkipY2, $MenuSpace, $MenuSpace, "BLACK");

	CreateChoice("Menuロード");
	SetAlias("Menuロード", "Menuロード");
	CreateTexture("Menuロード/MouseUsual/hit",1020,$MenuLoadX,$MenuLoadY,"cg/sys/menu/Pull-down-R002-D.png");
	CreateTexture("Menuロードimg",1020,$MenuLoadX,$MenuLoadY,"cg/sys/menu/Pull-down-R002-A.png");
	CreateTexture("Menuロード/MouseOver/img",1020,$MenuLoadX,$MenuLoadY,"cg/sys/menu/Pull-down-R002-B.png");
	CreateTexture("Menuロード/MouseClick/img",1020,$MenuLoadX,$MenuLoadY,"cg/sys/menu/Pull-down-R002-C.png");
//	CreateProcess("Menuロード/MouseOver/chロードプロセス１", 150, 0, 0, "MenuLoadProcessOpen");
//	CreateProcess("Menuロード/MouseLeave/chロードプロセス２", 150, 0, 0, "MenuLoadProcessPause");
	CreateChoice("Menuロード２");
	SetAlias("Menuロード２", "Menuロード２");
	CreateColor("Menuロード２/MouseUsual/hit", 1150, $MenuLoadX2,$MenuLoadY2, $MenuSpace, $MenuSpace, "BLACK");

	CreateChoice("Menuセーブ");
	SetAlias("Menuセーブ", "Menuセーブ");
	CreateTexture("Menuセーブ/MouseUsual/hit",1020,$MenuSaveX,$MenuSaveY,"cg/sys/menu/Pull-down-R001-D.png");
	CreateTexture("Menuセーブimg",1020,$MenuSaveX,$MenuSaveY,"cg/sys/menu/Pull-down-R001-A.png");
	CreateTexture("Menuセーブ/MouseOver/img",1020,$MenuSaveX,$MenuSaveY,"cg/sys/menu/Pull-down-R001-B.png");
	CreateTexture("Menuセーブ/MouseClick/img",1020,$MenuSaveX,$MenuSaveY,"cg/sys/menu/Pull-down-R001-C.png");
//	CreateProcess("Menuセーブ/MouseOver/chセーブプロセス１", 150, 0, 0, "MenuSaveProcessOpen");
//	CreateProcess("Menuセーブ/MouseLeave/chセーブプロセス２", 150, 0, 0, "MenuSaveProcessPause");
	CreateChoice("Menuセーブ２");
	SetAlias("Menuセーブ２", "Menuセーブ２");
	CreateColor("Menuセーブ２/MouseUsual/hit", 1150, $MenuSaveX2,$MenuSaveY2, $MenuSpace, $MenuSpace, "BLACK");


//	CreateChoice("Menu超速");
//	SetAlias("Menu超速", "Menu超速");
//	CreateTexture("Menu超速/MouseUsual/hit",20,$MenuSuperX,$MenuSuperY,"cg/sys/menu/bt04_base.png");
//	CreateTexture("Menu超速img",20,$MenuSuperX,$MenuSuperY,"cg/sys/menu/bt04_off.png");
//	CreateTexture("Menu超速/MouseOver/img",20,$MenuSuperX,$MenuSuperY,"cg/sys/menu/bt04_over.png");
//	CreateTexture("Menu超速/MouseClick/img",20,$MenuSuperX,$MenuSuperY,"cg/sys/menu/bt04_on.png");
//	CreateProcess("Menu超速/MouseOver/ch超速プロセス１", 150, 0, 0, "MenuSuperProcessOpen");
//	CreateProcess("Menu超速/MouseLeave/ch超速プロセス２", 150, 0, 0, "MenuSuperProcessPause");

//	CreateChoice("Menuフルスクリーン");
//	SetAlias("Menuフルスクリーン", "Menuフルスクリーン");
//	CreateTexture("Menuフルスクリーン/MouseUsual/hit",20,$MenuFullX,$MenuFullY,"cg/sys/menu/bt06_base.png");
//	CreateTexture("Menuフルスクリーンimg",20,$MenuFullX,$MenuFullY,"cg/sys/menu/bt06_off.png");
//	CreateTexture("Menuフルスクリーン/MouseOver/img",20,$MenuFullX,$MenuFullY,"cg/sys/menu/bt06_over.png");
//	CreateTexture("Menuフルスクリーン/MouseClick/img",20,$MenuFullX,$MenuFullY,"cg/sys/menu/bt06_on.png");
//	CreateProcess("Menuフルスクリーン/MouseOver/chフルスクリーンプロセス１", 150, 0, 0, "MenuFullProcessOpen");
//	CreateProcess("Menuフルスクリーン/MouseLeave/chフルスクリーンプロセス２", 150, 0, 0, "MenuFullProcessPause");

//	CreateChoice("Menu前選択");
//	SetAlias("Menu前選択", "Menu前選択");
//	CreateTexture("Menu前選択/MouseUsual/hit",20,$MenuBackX,$MenuBackY,"cg/sys/menu/bt09_base.png");
//	CreateTexture("Menu前選択img",20,$MenuBackX,$MenuBackY,"cg/sys/menu/bt09_off.png");
//	CreateTexture("Menu前選択/MouseOver/img",20,$MenuBackX,$MenuBackY,"cg/sys/menu/bt09_over.png");
//	CreateTexture("Menu前選択/MouseClick/img",20,$MenuBackX,$MenuBackY,"cg/sys/menu/bt09_on.png");
//	CreateProcess("Menu前選択/MouseOver/ch前選択プロセス１", 150, 0, 0, "MenuBackProcessOpen");
//	CreateProcess("Menu前選択/MouseLeave/ch前選択プロセス２", 150, 0, 0, "MenuBackProcessPause");

//	CreateChoice("Menuゲーム終了");
//	SetAlias("Menuゲーム終了", "Menuゲーム終了");
//	CreateTexture("Menuゲーム終了/MouseUsual/hit",20,$MenuExitX,$MenuExitY,"cg/sys/menu/bt12_base.png");
//	CreateTexture("Menuゲーム終了img",20,$MenuExitX,$MenuExitY,"cg/sys/menu/bt12_off.png");
//	CreateTexture("Menuゲーム終了/MouseOver/img",20,$MenuExitX,$MenuExitY,"cg/sys/menu/bt12_over.png");
//	CreateTexture("Menuゲーム終了/MouseClick/img",20,$MenuExitX,$MenuExitY,"cg/sys/menu/bt12_on.png");
//	CreateProcess("Menuゲーム終了/MouseOver/chゲーム終了プロセス１", 150, 0, 0, "MenuExitProcessOpen");
//	CreateProcess("Menuゲーム終了/MouseLeave/chゲーム終了プロセス２", 150, 0, 0, "MenuExitProcessPause");

//	CreateTexture("Menuオート", 100, 683, 149, "cg/sys/menu/看板/ico_auto.png");
//	SetAlias("Menuオート", "Menuオート");


	//▼フォーカス
	FocusPlus("セーブ２","ロード２",DOWN);
//	FocusPlus("セーブ２","ロード２",LEFT);
	FocusPlus("ロード２","スキップ２",DOWN);
//	FocusPlus("ロード２","スキップ２",LEFT);
	FocusPlus("スキップ２","バックログ２",DOWN);
//	FocusPlus("スキップ２","バックログ２",LEFT);
	FocusPlus("バックログ２","コンフィグ２",DOWN);
//	FocusPlus("バックログ２","コンフィグ２",LEFT);
	FocusPlus("コンフィグ２","メッセージ２",DOWN);
//	FocusPlus("コンフィグ２","メッセージ２",LEFT);
	FocusPlus("メッセージ２","自動メッセージ２",DOWN);
//	FocusPlus("メッセージ２","自動メッセージ２",LEFT);
	FocusPlus("自動メッセージ２","タイトル２",DOWN);
//	FocusPlus("自動メッセージ２","タイトル２",LEFT);
	FocusPlus("タイトル２","キャンセル２",DOWN);
//	FocusPlus("タイトル２","キャンセル２",LEFT);
	FocusPlus("キャンセル２","ティップス２",DOWN);
//	FocusPlus("キャンセル２","ティップス２",LEFT);
	FocusPlus("ティップス２","セーブ２",DOWN);
//	FocusPlus("ティップス２","セーブ２",LEFT);

	FocusPlus("セーブ２","ティップス２",UP);
//	FocusPlus("セーブ２","ティップス２",RIGHT);
	FocusPlus("ロード２","セーブ２",UP);
//	FocusPlus("ロード２","セーブ２",RIGHT);
	FocusPlus("スキップ２","ロード２",UP);
//	FocusPlus("スキップ２","ロード２",RIGHT);
	FocusPlus("バックログ２","スキップ２",UP);
//	FocusPlus("バックログ２","スキップ２",RIGHT);
	FocusPlus("コンフィグ２","バックログ２",UP);
//	FocusPlus("コンフィグ２","バックログ２",RIGHT);
	FocusPlus("メッセージ２","コンフィグ２",UP);
//	FocusPlus("メッセージ２","コンフィグ２",RIGHT);
	FocusPlus("自動メッセージ２","メッセージ２",UP);
//	FocusPlus("自動メッセージ２","メッセージ２",RIGHT);
	FocusPlus("タイトル２","自動メッセージ２",UP);
//	FocusPlus("タイトル２","自動メッセージ２",RIGHT);
	FocusPlus("キャンセル２","タイトル２",UP);
//	FocusPlus("キャンセル２","タイトル２",RIGHT);
	FocusPlus("ティップス２","キャンセル２",UP);
//	FocusPlus("ティップス２","キャンセル２",RIGHT);


	//●準備１
	Request("Menu*/MouseUsual/hit", Erase);
	Fade("Menu*",0,0,null,false);
	Fade("Menu*/*/*",0,0,null,false);

//	$MenuMoveLX0=-379;
//	$MenuMoveLY0=208;
//	$MenuMoveLX1=-66;
//	$MenuMoveLY1=62;
//	$MenuMoveLX2=-51;
//	$MenuMoveLY2=53;
//	$MenuMoveLX3=-53;
//	$MenuMoveLY3=57;
//	$MenuMoveLX4=-46;
//	$MenuMoveLY4=64;
//	$MenuMoveLX5=-52;
//	$MenuMoveLY5=76;

//	$MenuMoveRX0=379;
//	$MenuMoveRY0=-208;
//	$MenuMoveRX1=66;
//	$MenuMoveRY1=-62;
//	$MenuMoveRX2=51;
//	$MenuMoveRY2=-53;
//	$MenuMoveRX3=53;
//	$MenuMoveRY3=-57;
//	$MenuMoveRX4=46;
//	$MenuMoveRY4=-64;
//	$MenuMoveRX5=52;
//	$MenuMoveRY5=-76;

	$MenuMoveLX0=-304;
	$MenuMoveLY0=166;
	$MenuMoveLX1=-356;
	$MenuMoveLY1=216;
	$MenuMoveLX2=-396;
	$MenuMoveLY2=258;
	$MenuMoveLX3=-440;
	$MenuMoveLY3=304;
	$MenuMoveLX4=-476;
	$MenuMoveLY4=356;
	$MenuMoveLX5=-517;
	$MenuMoveLY5=416;

	$MenuMoveRX0=304;
	$MenuMoveRY0=-166;
	$MenuMoveRX1=356;
	$MenuMoveRY1=-216;
	$MenuMoveRX2=396;
	$MenuMoveRY2=-258;
	$MenuMoveRX3=440;
	$MenuMoveRY3=-304;
	$MenuMoveRX4=476;
	$MenuMoveRY4=-356;
	$MenuMoveRX5=517;
	$MenuMoveRY5=-416;

	Move("Menuベース右", 0, @$MenuMoveRX0, @$MenuMoveRY0, null, false);
	Move("Menuセーブimg", 0, @$MenuMoveRX1, @$MenuMoveRY1, null, false);
	Move("Menuロードimg", 0, @$MenuMoveRX2, @$MenuMoveRY2, null, false);
	Move("Menuスキップimg", 0, @$MenuMoveRX3, @$MenuMoveRY3, null, false);
	Move("Menuバックログimg", 0, @$MenuMoveRX4, @$MenuMoveRY4, null, false);
	Move("Menuコンフィグimg", 0, @$MenuMoveRX5, @$MenuMoveRY5, null, false);

	Move("Menuベース左", 0, @$MenuMoveLX0, @$MenuMoveLY0, null, false);
	Move("Menuティップスimg", 0, @$MenuMoveLX1, @$MenuMoveLY1, null, false);
	Move("Menuキャンセルimg", 0, @$MenuMoveLX2, @$MenuMoveLY2, null, false);
	Move("Menuタイトルimg", 0, @$MenuMoveLX3, @$MenuMoveLY3, null, false);
	Move("Menu自動メッセージimg", 0, @$MenuMoveLX4, @$MenuMoveLY4, null, false);
	Move("Menuメッセージimg", 0, @$MenuMoveLX5, @$MenuMoveLY5, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	//★描画開始
	$MenuIconMovePase="Dxl1";

	$MenuIconMoveTime0=300;
	$MenuIconFadeTime0=0;
	$MenuIconFadeWait0=0;

	$MenuIconMoveTime1=400;
	$MenuIconFadeTime1=400;
	$MenuIconFadeWait1=0;

	$MenuIconMoveTime2=500;
	$MenuIconFadeTime2=500;
	$MenuIconFadeWait2=0;

	$MenuIconMoveTime3=600;
	$MenuIconFadeTime3=600;
	$MenuIconFadeWait3=0;

	$MenuIconMoveTime4=700;
	$MenuIconFadeTime4=700;
	$MenuIconFadeWait4=0;

	$MenuIconMoveTime5=800;
	$MenuIconFadeTime5=800;
	$MenuIconFadeWait5=0;

	Move("Menuベース左", $MenuIconMoveTime0, @$MenuMoveRX0, @$MenuMoveRY0, $MenuIconMovePase, false);
	Move("Menuベース右", $MenuIconMoveTime0, @$MenuMoveLX0, @$MenuMoveLY0, $MenuIconMovePase, false);
	Fade("Menuベース右", $MenuIconFadeTime0, 1000, null, false);
	Fade("Menuベース左", $MenuIconFadeTime0, 1000, null, $MenuIconFadeWait0);

	Move("Menuティップスimg", $MenuIconMoveTime1, @$MenuMoveRX1, @$MenuMoveRY1, $MenuIconMovePase, false);
	Move("Menuセーブimg", $MenuIconMoveTime1, @$MenuMoveLX1, @$MenuMoveLY1, $MenuIconMovePase, false);
	Fade("Menuティップスimg", $MenuIconFadeTime1, 1000, null, false);
	Fade("Menuセーブimg", $MenuIconFadeTime1, 1000, null, $MenuIconFadeWait1);

	Move("Menuキャンセルimg", $MenuIconMoveTime2, @$MenuMoveRX2, @$MenuMoveRY2, $MenuIconMovePase, false);
	Move("Menuロードimg", $MenuIconMoveTime2, @$MenuMoveLX2, @$MenuMoveLY2, $MenuIconMovePase, false);
	Fade("Menuキャンセルimg", $MenuIconFadeTime2, 1000, null, false);
	Fade("Menuロードimg", $MenuIconFadeTime2, 1000, null, $MenuIconFadeWait2);

	Move("Menuタイトルimg", $MenuIconMoveTime3, @$MenuMoveRX3, @$MenuMoveRY3, $MenuIconMovePase, false);
	Move("Menuスキップimg", $MenuIconMoveTime3, @$MenuMoveLX3, @$MenuMoveLY3, $MenuIconMovePase, false);
	Fade("Menuタイトルimg", $MenuIconFadeTime3, 1000, null, false);
	Fade("Menuスキップimg", $MenuIconFadeTime3, 1000, null, $MenuIconFadeWait3);

	Move("Menu自動メッセージimg", $MenuIconMoveTime4, @$MenuMoveRX4, @$MenuMoveRY4, $MenuIconMovePase, false);
	Move("Menuバックログimg", $MenuIconMoveTime4, @$MenuMoveLX4, @$MenuMoveLY4, $MenuIconMovePase, false);
	Fade("Menu自動メッセージimg", $MenuIconFadeTime4, 1000, null, false);
	Fade("Menuバックログimg", $MenuIconFadeTime4, 1000, null, $MenuIconFadeWait4);

	Move("Menuメッセージimg", $MenuIconMoveTime5, @$MenuMoveRX5, @$MenuMoveRY5, $MenuIconMovePase, false);
	Move("Menuコンフィグimg", $MenuIconMoveTime5, @$MenuMoveLX5, @$MenuMoveLY5, $MenuIconMovePase, false);
	Fade("Menuメッセージimg", $MenuIconFadeTime5, 1000, null, false);
	Fade("Menuコンフィグimg", $MenuIconFadeTime5, 1000, null, true);


	if($SYSTEM_XBOX360_change_user_state){DialogChangeState2();}

	MoveCursor(749,34);
	$SYSTEM_menu_enable=true;
	$SYSTEM_menu_close_enable=false;
	$SYSTEM_buttondown_close=false;
	$SYSTEM_keydown_esc=false;
	$SYSTEM_XBOX360_button_b_down=false;
	while($SYSTEM_menu_enable){
		select{
			if($SYSTEM_XBOX360_change_user_state){DialogChangeState2();}
			if($SYSTEM_XBOX360_button_b_down){$SYSTEM_menu_enable=false;break;}
			case Menuセーブ２{
			}case Menuロード２{
			}case Menuスキップ２{
			}case Menuバックログ２{
			}case Menuコンフィグ２{
			}case Menuメッセージ２{
			}case Menu自動メッセージ２{
			}case Menuタイトル２{
			}case Menuキャンセル２{
			}case Menuティップス２{
			}case Menuセーブ{
				if(!$SYSTEM_save_lock){
					call_chapter nss/sys_save.nss;
					$SYSTEM_menu_enable=true;
					MoveCursor(749,34);
				}
			}case Menuロード{
				if(!$SYSTEM_load_lock){
					call_chapter nss/sys_load.nss;
					$SYSTEM_menu_enable=true;
					MoveCursor(706,48);
				}
			}case Menuスキップ{
				if(!$SYSTEM_skip_lock){
					$SYSTEM_skip=true;
					$SYSTEM_menu_enable=false;
				}
			}case Menuバックログ{
				call_chapter nss/sys_backlog.nss;
				$SYSTEM_menu_enable=true;
				MoveCursor(689,108);
			}case Menuコンフィグ{
				call_chapter nss/sys_config.nss;
				$SYSTEM_menu_enable=true;
				MoveCursor(722,150);
			}case Menuメッセージ{
				if(!$SYSTEM_text_erase_lock){
					$SYSTEM_text_erase=!$SYSTEM_text_erase;
					$SYSTEM_menu_enable=false;
				}
			}case Menu自動メッセージ{
				if(!$SYSTEM_text_auto_lock){
					$SYSTEM_text_auto=!$SYSTEM_text_auto;
					$SYSTEM_menu_enable=false;
				}
			}case Menuタイトル{
				call_chapter nss/sys_reset.nss;
				$SYSTEM_menu_enable=true;
				MoveCursor(308,420);
			}case Menuキャンセル{
				$SYSTEM_menu_enable=false;
			}case Menuティップス{
				call_chapter nss/extra_tips.nss;
				$SYSTEM_menu_enable=true;
				MoveCursor(136,442);
			}

			if(!$SYSTEM_menu_enable){break;}
			if($SYSTEM_keydown_f){
				if(!#SYSTEM_window_full_lock){
					#SYSTEM_window_full=!#SYSTEM_window_full;
					#SYSTEM_window_full_lock=false;
					#SYSTEM_video_aspect_fixed=1;
					Wait(300);
					$SYSTEM_keydown_f=false;
				}
			}
			else if($SYSTEM_menu_close_enable || $SYSTEM_buttondown_close || $SYSTEM_keydown_esc){call_chapter nss/sys_close.nss;}
		}
	}



	$MenuIconMovePase="Axl1";

	$MenuIconMoveTime0=100;
	$MenuIconFadeTime0=100;
	$MenuIconFadeWait0=0;

	$MenuIconMoveTime1=200;
	$MenuIconFadeTime1=200;
	$MenuIconFadeWait1=0;

	$MenuIconMoveTime2=300;
	$MenuIconFadeTime2=300;
	$MenuIconFadeWait2=0;

	$MenuIconMoveTime3=400;
	$MenuIconFadeTime3=400;
	$MenuIconFadeWait3=0;

	$MenuIconMoveTime4=500;
	$MenuIconFadeTime4=500;
	$MenuIconFadeWait4=0;

	$MenuIconMoveTime5=600;
	$MenuIconFadeTime5=600;
	$MenuIconFadeWait5=0;

	Move("Menuメッセージ/*/img", $MenuIconMoveTime0, @$MenuMoveLX5, @$MenuMoveLY5, $MenuIconMovePase, false);
	Move("Menuコンフィグ/*/img", $MenuIconMoveTime0, @$MenuMoveRX5, @$MenuMoveRY5, $MenuIconMovePase, false);
	Fade("Menuメッセージ/*/img", $MenuIconFadeTime0, 0, null, false);
	Fade("Menuコンフィグ/*/img", $MenuIconFadeTime0, 0, null, false);
	Move("Menuメッセージimg", $MenuIconMoveTime0, @$MenuMoveLX5, @$MenuMoveLY5, $MenuIconMovePase, false);
	Move("Menuコンフィグimg", $MenuIconMoveTime0, @$MenuMoveRX5, @$MenuMoveRY5, $MenuIconMovePase, false);
	Fade("Menuメッセージimg", $MenuIconFadeTime0, 0, null, false);
	Fade("Menuコンフィグimg", $MenuIconFadeTime0, 0, null, $MenuIconFadeWait0);

	Move("Menu自動メッセージ/*/img", $MenuIconMoveTime1, @$MenuMoveLX4, @$MenuMoveLY4, $MenuIconMovePase, false);
	Move("Menuバックログ/*/img", $MenuIconMoveTime1, @$MenuMoveRX4, @$MenuMoveRY4, $MenuIconMovePase, false);
	Fade("Menu自動メッセージ/*/img", $MenuIconFadeTime1, 0, null, false);
	Fade("Menuバックログ/*/img", $MenuIconFadeTime1, 0, null, false);
	Move("Menu自動メッセージimg", $MenuIconMoveTime1, @$MenuMoveLX4, @$MenuMoveLY4, $MenuIconMovePase, false);
	Move("Menuバックログimg", $MenuIconMoveTime1, @$MenuMoveRX4, @$MenuMoveRY4, $MenuIconMovePase, false);
	Fade("Menu自動メッセージimg", $MenuIconFadeTime1, 0, null, false);
	Fade("Menuバックログimg", $MenuIconFadeTime1, 0, null, $MenuIconFadeWait1);

	Move("Menuタイトル/*/img", $MenuIconMoveTime2, @$MenuMoveLX3, @$MenuMoveLY3, $MenuIconMovePase, false);
	Move("Menuスキップ/*/img", $MenuIconMoveTime2, @$MenuMoveRX3, @$MenuMoveRY3, $MenuIconMovePase, false);
	Fade("Menuタイトル/*/img", $MenuIconFadeTime2, 0, null, false);
	Fade("Menuスキップ/*/img", $MenuIconFadeTime2, 0, null, false);
	Move("Menuタイトルimg", $MenuIconMoveTime2, @$MenuMoveLX3, @$MenuMoveLY3, $MenuIconMovePase, false);
	Move("Menuスキップimg", $MenuIconMoveTime2, @$MenuMoveRX3, @$MenuMoveRY3, $MenuIconMovePase, false);
	Fade("Menuタイトルimg", $MenuIconFadeTime2, 0, null, false);
	Fade("Menuスキップimg", $MenuIconFadeTime2, 0, null, $MenuIconFadeWait2);

	Move("Menuキャンセル/*/img", $MenuIconMoveTime3, @$MenuMoveLX2, @$MenuMoveLY2, $MenuIconMovePase, false);
	Move("Menuロード/*/img", $MenuIconMoveTime3, @$MenuMoveRX2, @$MenuMoveRY2, $MenuIconMovePase, false);
	Fade("Menuキャンセル/*/img", $MenuIconFadeTime3, 0, null, false);
	Fade("Menuロード/*/img", $MenuIconFadeTime3, 0, null, false);
	Move("Menuキャンセルimg", $MenuIconMoveTime3, @$MenuMoveLX2, @$MenuMoveLY2, $MenuIconMovePase, false);
	Move("Menuロードimg", $MenuIconMoveTime3, @$MenuMoveRX2, @$MenuMoveRY2, $MenuIconMovePase, false);
	Fade("Menuキャンセルimg", $MenuIconFadeTime3, 0, null, false);
	Fade("Menuロードimg", $MenuIconFadeTime3, 0, null, $MenuIconFadeWait3);

	Move("Menuティップス/*/img", $MenuIconMoveTime4, @$MenuMoveLX1, @$MenuMoveLY1, $MenuIconMovePase, false);
	Move("Menuセーブ/*/img", $MenuIconMoveTime4, @$MenuMoveRX1, @$MenuMoveRY1, $MenuIconMovePase, false);
	Fade("Menuティップス/*/img", $MenuIconFadeTime4, 0, null, false);
	Fade("Menuセーブ/*/img", $MenuIconFadeTime4, 0, null, false);
	Move("Menuティップスimg", $MenuIconMoveTime4, @$MenuMoveLX1, @$MenuMoveLY1, $MenuIconMovePase, false);
	Move("Menuセーブimg", $MenuIconMoveTime4, @$MenuMoveRX1, @$MenuMoveRY1, $MenuIconMovePase, false);
	Fade("Menuティップスimg", $MenuIconFadeTime4, 0, null, false);
	Fade("Menuセーブimg", $MenuIconFadeTime4, 0, null, $MenuIconFadeWait4);

	Move("Menuベース左", $MenuIconMoveTime5, @$MenuMoveLX0, @$MenuMoveLY0, $MenuIconMovePase, false);
	Move("Menuベース右", $MenuIconMoveTime5, @$MenuMoveRX0, @$MenuMoveRY0, $MenuIconMovePase, false);
	Fade("Menuベース右", $MenuIconFadeTime5, 1000, null, false);
	Fade("Menuベース左", $MenuIconFadeTime5, 1000, null, true);
	WaitAction("Menuベース左", null);

//	Delete("Menu*");
//	Delete("Menu*/*/*");

	//★選択肢への布石
	if($CX==500&&$CY==300){
		Fade("<@選択肢１/MouseOver/選択範囲２>", 0, 1000, null, false);
	}else if($CX==750&&$CY==300){
		Fade("<@選択肢２/MouseOver/選択範囲２>", 0, 1000, null, false);
	}

	MoveCursor($PosX,$PosY);
	$SYSTEM_menu_enable=false;
}




function RAKUSEN()
{
			case Menu超速{
				if(!$SYSTEM_skip_lock){
					#SYSTEM_skip_express=true;
					$SYSTEM_skip=true;
					$SYSTEM_menu_enable=false;
				}
			}case Menuフルスクリーン{
				if(!#SYSTEM_window_full_lock){
					#SYSTEM_window_full=!#SYSTEM_window_full;
				}
			}case Menu前選択{
				if((!$PLACE_select&&ExistSave(9999))&&!$SYSTEM_backselect_lock){
					call_chapter nss/sys_backselect.nss;
					$SYSTEM_menu_enable=true;
				}
			}case Menuゲーム終了{
				call_chapter nss/sys_close.nss;
				$SYSTEM_menu_enable=true;
			}
}


function FocusPlus($FocusNumberA,$FocusNumberB,$FocusTarget)
{
	$FocusNameA = "Menu" + $FocusNumberA + "/MouseUsual/hit";
	$FocusNameB = "Menu" + $FocusNumberB + "/MouseUsual/hit";
	SetNextFocus($FocusNameA, $FocusNameB, $FocusTarget);
}




function FocusBreak($FocusNumberA)
{
	//▼フォーカス
	FocusPlus("セーブ２",$FocusNumberA,DOWN);
	FocusPlus("セーブ２",$FocusNumberA,LEFT);
	FocusPlus("ロード２",$FocusNumberA,DOWN);
	FocusPlus("ロード２",$FocusNumberA,LEFT);
	FocusPlus("スキップ２",$FocusNumberA,DOWN);
	FocusPlus("スキップ２",$FocusNumberA,LEFT);
	FocusPlus("バックログ２",$FocusNumberA,DOWN);
	FocusPlus("バックログ２",$FocusNumberA,LEFT);
	FocusPlus("コンフィグ２",$FocusNumberA,DOWN);
	FocusPlus("コンフィグ２",$FocusNumberA,LEFT);
	FocusPlus("メッセージ２",$FocusNumberA,DOWN);
	FocusPlus("メッセージ２",$FocusNumberA,LEFT);
	FocusPlus("自動メッセージ２",$FocusNumberA,DOWN);
	FocusPlus("自動メッセージ２",$FocusNumberA,LEFT);
	FocusPlus("タイトル２",$FocusNumberA,DOWN);
	FocusPlus("タイトル２",$FocusNumberA,LEFT);
	FocusPlus("キャンセル２",$FocusNumberA,DOWN);
	FocusPlus("キャンセル２",$FocusNumberA,LEFT);
	FocusPlus("ティップス２",$FocusNumberA,DOWN);
	FocusPlus("ティップス２",$FocusNumberA,LEFT);

	FocusPlus("セーブ２","ティップス２",UP);
	FocusPlus("セーブ２","ティップス２",RIGHT);
	FocusPlus("ロード２","セーブ２",UP);
	FocusPlus("ロード２","セーブ２",RIGHT);
	FocusPlus("スキップ２","ロード２",UP);
	FocusPlus("スキップ２","ロード２",RIGHT);
	FocusPlus("バックログ２","スキップ２",UP);
	FocusPlus("バックログ２","スキップ２",RIGHT);
	FocusPlus("コンフィグ２","バックログ２",UP);
	FocusPlus("コンフィグ２","バックログ２",RIGHT);
	FocusPlus("メッセージ２","コンフィグ２",UP);
	FocusPlus("メッセージ２","コンフィグ２",RIGHT);
	FocusPlus("自動メッセージ２","メッセージ２",UP);
	FocusPlus("自動メッセージ２","メッセージ２",RIGHT);
	FocusPlus("タイトル２","自動メッセージ２",UP);
	FocusPlus("タイトル２","自動メッセージ２",RIGHT);
	FocusPlus("キャンセル２","タイトル２",UP);
	FocusPlus("キャンセル２","タイトル２",RIGHT);
	FocusPlus("ティップス２","キャンセル２",UP);
	FocusPlus("ティップス２","キャンセル２",RIGHT);
}

function MenuFocus()
{
	//▼フォーカス
	FocusPlus("セーブ２","ロード２",DOWN);
	FocusPlus("セーブ２","ロード２",LEFT);
	FocusPlus("ロード２","スキップ２",DOWN);
	FocusPlus("ロード２","スキップ２",LEFT);
	FocusPlus("スキップ２","バックログ２",DOWN);
	FocusPlus("スキップ２","バックログ２",LEFT);
	FocusPlus("バックログ２","コンフィグ２",DOWN);
	FocusPlus("バックログ２","コンフィグ２",LEFT);
	FocusPlus("コンフィグ２","メッセージ２",DOWN);
	FocusPlus("コンフィグ２","メッセージ２",LEFT);
	FocusPlus("メッセージ２","自動メッセージ２",DOWN);
	FocusPlus("メッセージ２","自動メッセージ２",LEFT);
	FocusPlus("自動メッセージ２","タイトル２",DOWN);
	FocusPlus("自動メッセージ２","タイトル２",LEFT);
	FocusPlus("タイトル２","キャンセル２",DOWN);
	FocusPlus("タイトル２","キャンセル２",LEFT);
	FocusPlus("キャンセル２","ティップス２",DOWN);
	FocusPlus("キャンセル２","ティップス２",LEFT);
	FocusPlus("ティップス２","セーブ２",DOWN);
	FocusPlus("ティップス２","セーブ２",LEFT);

	FocusPlus("セーブ２","ティップス２",UP);
	FocusPlus("セーブ２","ティップス２",RIGHT);
	FocusPlus("ロード２","セーブ２",UP);
	FocusPlus("ロード２","セーブ２",RIGHT);
	FocusPlus("スキップ２","ロード２",UP);
	FocusPlus("スキップ２","ロード２",RIGHT);
	FocusPlus("バックログ２","スキップ２",UP);
	FocusPlus("バックログ２","スキップ２",RIGHT);
	FocusPlus("コンフィグ２","バックログ２",UP);
	FocusPlus("コンフィグ２","バックログ２",RIGHT);
	FocusPlus("メッセージ２","コンフィグ２",UP);
	FocusPlus("メッセージ２","コンフィグ２",RIGHT);
	FocusPlus("自動メッセージ２","メッセージ２",UP);
	FocusPlus("自動メッセージ２","メッセージ２",RIGHT);
	FocusPlus("タイトル２","自動メッセージ２",UP);
	FocusPlus("タイトル２","自動メッセージ２",RIGHT);
	FocusPlus("キャンセル２","タイトル２",UP);
	FocusPlus("キャンセル２","タイトル２",RIGHT);
	FocusPlus("ティップス２","キャンセル２",UP);
	FocusPlus("ティップス２","キャンセル２",RIGHT);
}

