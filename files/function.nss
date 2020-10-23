
//■マクロをさらにマクロにてまとめて定義
//=============================================================================//
.//まとめ定義
//=============================================================================//

..SystemInit
function SystemInit()
{
	$SYSTEM_spt_name = $ChapterName;
	if(#DebugMode){
		Request("@debugfilename",UnLock);
		Delete("@debugfilename");
		CreateText("debugfilename",1000000,30,0,auto,auto,$SYSTEM_spt_name);
		SetAlias("debugfilename","debugfilename");
		Request("@debugfilename",Lock);
		Request("@debugfilename",PushText);
	}
	$SYSTEM_text_interval = 34;

	$SYSTEM_position_x_text_icon = 880;
	$SYSTEM_position_y_text_icon = 525;

	//■一度読み込んだら再度読み込んでしまわないように。
	if(!$InitFlag)
	{
		LoadBox();
//		InitBGM();

		$InitFlag=true;
	}

}

..SystemSet
function SystemSet()
{
	$DefoFadeIn=200;
	$DefoFadeOut=200;
	$DefoZoomOut=800;

//	$SelectFadeTime=300;
//	$SelectWaitTime=500;
//	$SelectDeleteTime=1000;
	$SelectFadeTime=0;
	$SelectWaitTime=300;
	$SelectDeleteTime=0;

	if($Pretextnumber==""){
		$Pretextnumber=xxx;
	}

	Request("box00", UnLock);
//	Fade("@box11",0,1000,null,false);
//	Fade("@box12",0,700,null,true);
	CreateWindow("box00", 20500, 108, 438, 944, 240, true);
//	SetAlias("box00", "box00");
	Request("box00", Lock);
}


//■テキストボックス・フォント、スクリプト中よく定義するものをマクロにてまとめて定義。
//=============================================================================//
.//ボックス定義
//=============================================================================//
..Box
function LoadBox()
{
	//シネスコもどき
//-----------------------------------------------------
//	CreateColor("box11", 20000, 0, 0, 800, 50, "BLACK");
//	CreateColor("box12", 20000, 0, 470, 800, 130, "BLACK");
//	SetAlias("box11", "box11");
//	SetAlias("box12", "box12");
//	Fade("box11",0,0,null,false);
//	Fade("box12",0,0,null,true);
//	Request("box11", Lock);
//	Request("box12", Lock);
//-----------------------------------------------------

//	CreateColor("box360", 20000, 0, 432, 1024, 144, "#000055");
	CreateColor("box360", 20000, 0, 432, 1024, 144, "#000000");
	SetAlias("box360", "box360");
	Fade("box360",0,0,null,true);
	Request("box360", Lock);
	Request("box360", Hideable);

	LoadFont("フォント１Ａ", "MS-Gothic-Mod", 25, #FFFFFF, #000000, 500, AROUND, "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをんがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽぁぃぅぇぉっゃゅょアイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポァィゥェォッャュョ、。ー…！？―「」『』１２３４５６７８９０");
	LoadFont("フォント１Ｂ", "MS-Gothic-Mod", 25, #FFFFFF, #000000, 500, AROUND, "一今日敵味方思分行時言聞見何人終好急");
	LoadFont("フォント１Ｃ", "MS-Gothic-Mod", 25, #FFFFFF, #000000, 500, AROUND, "渋谷西條拓巳将軍梨深美優愛梢七海星来判諏訪波多野呂瀬猪鼻倉持百瀬葉月三住目死体貼付ＤＱＮ");

	Request("フォント１Ａ", Lock);
	Request("フォント１Ｂ", Lock);
	Request("フォント１Ｃ", Lock);
}



function LoadBox10()
{
//	CreateWindow("box10", 1000, 50, 260, 800, 130, true);
	CreateWindow("box10", 1000, 120, 240, 840, 320, true);
}

//■スクリプトにおいてテキストを定義するマクロコマンド
//=============================================================================//
.//テキスト定義
//=============================================================================//

..SetText
function SetText($boxtype,$textnumber)
{
	Move("box00", 0, @0, @576, null, true);

	SetFont("MS-Gothic-Mod", 24, #FFFFFF, #000000, 500, AROUND);
	LoadText($構文名,$boxtype,$textnumber,800,120,-1,35);

	Request($textnumber, Erase);
	Request($textnumber, Hideable);
	Request($textnumber, Lock);

	Move("box00", 0, @0, @-576, null, true);
}

function SetText2($boxtype,$textnumber)
{
	SetFont("MS-Gothic-Mod", 24, #000000, #FFFFFF, 500, AROUND);
	LoadText($構文名,$boxtype,$textnumber,800,120,-1,35);

	Request($textnumber, Erase);
	Request($textnumber, Hideable);
	Request($textnumber, Lock);
}

function SetText3($boxtype,$textnumber)
{
	SetFont("MS-Gothic-Mod", 24, #000000, #CCCCCC, HEAVY, AROUND);
	LoadText($構文名,$boxtype,$textnumber,800,120,-1,35);

	Request($textnumber, Erase);
	Request($textnumber, Hideable);
	Request($textnumber, Lock);
}


//■定義したテキストの位置をまとめて調整
//=============================================================================//
.//テキスト位置補正
//=============================================================================//

//		Fade("@box360",100,660,Dxl3,false);
//		Zoom("@box360", 50, 1, 1000, null, true);
//		Zoom("@box360", 150, 1000, 1000, null, false);
//		Rotate("@box360", 150, 0, @0, @0, Dxl1, true);


//■ボックスを描画するのとテキストをタイピングする動作をまとめて実行するマクロ
//=============================================================================//
.//タイピングマクロ
//=============================================================================//


..TypeBegin
function TypeBegin()
{
//	$boxtype = $SYSTEM_present_preprocess;
//	$textnumber = $SYSTEM_present_text;

//	$SYSTEM_position_x_text_icon = -32768;
//	$SYSTEM_position_y_text_icon = -32768;

	if($Pretextnumber!=$textnumber){
		$distext = $boxtype + "/" + $Pretextnumber;
		Fade($distext, 0, 0, null, false);
		Request($distext, Disused);
	}

	$TypeBeginNow=true;
		Zoom("@box360", $DefoFadeIn, 1000, 1000, Dxl1, false);
		Fade("@box360", $DefoFadeIn, #LOCAL_window_fade, Dxl3, true);
	Request($textnumber, Enter);
	WaitText($textnumber, null);
	$TypeBeginNow=false;
		Zoom("@box360", $DefoFadeOut, $DefoZoomOut, 0, Axl1, false);
		Fade("@box360",$DefoFadeOut,0,null,false);
		Zoom($textnumber, $DefoFadeOut, $DefoZoomOut, 0, Axl1, false);
	Fade($textnumber, $DefoFadeOut, 0, null, true);
	Request($textnumber, UnLock);
	Request($textnumber, Disused);

	$Pretextnumber = $textnumber;
}

..TypeBeginEX
function TypeBeginEX()
{
//	$boxtype = $SYSTEM_present_preprocess;
//	$textnumber = $SYSTEM_present_text;

//	$SYSTEM_position_x_text_icon = -32768;
//	$SYSTEM_position_y_text_icon = -32768;

	if($Pretextnumber!=$textnumber){
		$distext = $boxtype + "/" + $Pretextnumber;
		Fade($distext, 0, 0, null, false);
		Request($distext, Disused);
	}

	$TypeBeginNow=true;
		Zoom("@box360", $DefoFadeIn, 1000, 1000, Dxl1, false);
		Fade("@box360", $DefoFadeIn, #LOCAL_window_fade, Dxl3, true);
	Request($textnumber, Enter);
	WaitText($textnumber, null);
	$TypeBeginNow=false;

//	Fade("@box360",$DefoFadeOut,0,null,false);
	Fade($textnumber, 0, 0, null, true);
	Request($textnumber, UnLock);
	Request($textnumber, Disused);

	$Pretextnumber = $textnumber;
}


..TypeBeginEX2
function TypeBeginEX2()
{
//	$boxtype = $SYSTEM_present_preprocess;
//	$textnumber = $SYSTEM_present_text;

//	$SYSTEM_position_x_text_icon = -32768;
//	$SYSTEM_position_y_text_icon = -32768;

	if($Pretextnumber!=$textnumber){
		$distext = $boxtype + "/" + $Pretextnumber;
		Fade($distext, 0, 0, null, false);
		Request($distext, Disused);
	}

	$TypeBeginNow=true;
		Zoom("@box360", $DefoFadeIn, 1000, 1000, Dxl1, false);
		Fade("@box360", $DefoFadeIn, #LOCAL_window_fade, Dxl3, true);
	Request($textnumber, Enter);
	WaitText($textnumber, null);
	$TypeBeginNow=false;

//	Fade("@box360",$DefoFadeOut,0,null,false);
//	Fade($textnumber, $DefoFadeOut, 0, null, true);
	Request($textnumber, UnLock);
//	Request($textnumber, Disused);

	$Pretextnumber = $textnumber;
}


..TypeBeginDX
function TypeBeginDX(入り秒数,抜け秒数)
{
//	$boxtype = $SYSTEM_present_preprocess;
//	$textnumber = $SYSTEM_present_text;

//	$SYSTEM_position_x_text_icon = -32768;
//	$SYSTEM_position_y_text_icon = -32768;

	if($Pretextnumber!=$textnumber){
		$distext = $boxtype + "/" + $Pretextnumber;
		Fade($distext, 0, 0, null, false);
		Request($distext, Disused);
	}

	$TypeBeginNow=true;
		Zoom("@box360", 入り秒数, 1000, 1000, Dxl1, false);
		Fade("@box360", 入り秒数, #LOCAL_window_fade, Dxl3, true);

	$distext = $boxtype + "/text*";
	Request($distext, Disused);

	Request($textnumber, Enter);
	WaitText($textnumber, null);
	$TypeBeginNow=false;

//	Fade("@box360",抜け秒数,0,null,false);
	Fade($textnumber,抜け秒数,0,null,true);
	Request($textnumber, UnLock);
	Request($textnumber, Disused);

	$Pretextnumber = $textnumber;
}


..TypeBeginDX2
function TypeBeginDX2(入り秒数,抜け秒数)
{
//	$boxtype = $SYSTEM_present_preprocess;
//	$textnumber = $SYSTEM_present_text;

//	$SYSTEM_position_x_text_icon = -32768;
//	$SYSTEM_position_y_text_icon = -32768;

	if($Pretextnumber!=$textnumber){
		$distext = $boxtype + "/" + $Pretextnumber;
		Fade($distext, 0, 0, null, false);
		Request($distext, Disused);
	}

	$TypeBeginNow=true;
		Zoom("@box360", 入り秒数, 1000, 1000, Dxl1, false);
		Fade("@box360", 入り秒数, #LOCAL_window_fade, Dxl3, true);

	$distext = $boxtype + "/text*";
	Request($distext, Disused);

	Request($textnumber, Enter);
	WaitText($textnumber, null);
	$TypeBeginNow=false;

		Zoom("@box360", 抜け秒数, $DefoZoomOut, 0, Axl1, false);
		Fade("@box360",抜け秒数,0,null,false);
		Zoom($textnumber, 抜け秒数, $DefoZoomOut, 0, Axl1, false);
	Fade($textnumber,抜け秒数,0,null,true);
	Request($textnumber, UnLock);
	Request($textnumber, Disused);

	$Pretextnumber = $textnumber;
}

function BoxDelete(抜け秒数)
{
		Zoom("@box360", 抜け秒数, $DefoZoomOut, 0, Axl1, false);
		Fade("@box360",抜け秒数,0,null,false);
		Zoom($textnumber, 抜け秒数, $DefoZoomOut, 0, Axl1, false);
	Fade($textnumber,抜け秒数,0,null,true);
	Request($textnumber, UnLock);
	Request($textnumber, Disused);
}

//ログを残さずにbox使用
function TypeBegin10()
{
//	$boxtype = $SYSTEM_present_preprocess;
//	$textnumber = $SYSTEM_present_text;

//	$SYSTEM_position_x_text_icon = -32768;
//	$SYSTEM_position_y_text_icon = -32768;

	if($Pretextnumber!=$textnumber){
		$distext = $boxtype + "/" + $Pretextnumber;
		Fade($distext, 0, 0, null, false);
		Request($distext, Disused);
	}

	$TypeBeginNow=true;
		Zoom("@box360", $DefoFadeIn, 1000, 1000, Dxl1, false);
		Fade("@box360", $DefoFadeIn, #LOCAL_window_fade, Dxl3, true);
	Request("$textnumber", NoLog);
	Request($textnumber, Enter);
	WaitText($textnumber, null);
	$TypeBeginNow=false;

		Zoom("@box360", $DefoFadeOut, $DefoZoomOut, 0, Axl1, false);
		Fade("@box360",$DefoFadeOut,0,null,false);
		Zoom($textnumber, $DefoFadeOut, $DefoZoomOut, 0, Axl1, false);
	Fade($textnumber, $DefoFadeOut, 0, null, true);
	Request($textnumber, UnLock);
	Request($textnumber, Disused);

	$Pretextnumber = $textnumber;
}




//僕を見るな系
..TypeBegin2
function TypeBegin2()
{
//	$boxtype = $SYSTEM_present_preprocess;
//	$textnumber = $SYSTEM_present_text;

//	$SYSTEM_position_x_text_icon = 750;
//	$SYSTEM_position_y_text_icon = 550;

	$distext = $boxtype + "/text*";
	Delete($distext);

	Request($textnumber, NoIcon);
	Request($textnumber, Enter);
	WaitText($textnumber, null);

	Request($textnumber, UnLock);
}


//妄想トリガー中
..TypeBegin4
function TypeBegin4()
{
//	$boxtype = $SYSTEM_present_preprocess;
//	$textnumber = $SYSTEM_present_text;

//	$SYSTEM_position_x_text_icon = 750;
//	$SYSTEM_position_y_text_icon = 550;

	if($Pretextnumber!=$textnumber){
		$distext = $boxtype + "/" + $Pretextnumber;
		Fade($distext, 0, 0, null, false);
		Request($distext, Disused);
	}

		Zoom("@box360", 0, 1000, 1000, Dxl1, false);
		Fade("@box360", 500, #LOCAL_window_fade, Dxl3, true);
	Request($textnumber, NoIcon);
	Request($textnumber, Enter);
	WaitText($textnumber, null);


//		Zoom("@box360", $DefoFadeOut, $DefoZoomOut, 0, Axl1, false);
//		Fade("@box360",500,0,null,false);
//		Zoom($textnumber, $DefoFadeOut, $DefoZoomOut, 0, Axl1, false);
//	Fade($textnumber, 500, 0, null, true);
	Request($textnumber, UnLock);
//	Request($textnumber, Disused);

	$Pretextnumber = $textnumber;
}


//真ん中モノローグ
..TypeBegin3
function TypeBegin3(秒数)
{
//	$boxtype = $SYSTEM_present_preprocess;
//	$textnumber = $SYSTEM_present_text;

//	$SYSTEM_position_x_text_icon = -32768;
//	$SYSTEM_position_y_text_icon = -32768;

	Request($textnumber, NoIcon);
	Request($textnumber, Enter);
	WaitText($textnumber, null);

	Fade($textnumber, 秒数, 0, null, true);
	Request($textnumber, UnLock);
	Request($textnumber, Disused);
}

//■Fade系
//=============================================================================//
.//Fade系
//=============================================================================//

//透明度0からスタートする「CreateTexture」です
..CreateTexture360
function CreateTexture360("ナット名", 描画優先度, Ｘ座標, $Ｙ座標, "イメージデータ")
{
	CreateTexture("ナット名", 描画優先度, Ｘ座標, $Ｙ座標, "イメージデータ");

	if($Ｙ座標!="middle"&&$Ｙ座標!="Middle"){
		Move("ナット名", 0, @0, @-96, null, false);
	}
}


//透明度0からスタートする「CreateTexture」です
..CreateTextureEX
function CreateTextureEX("ナット名", 描画優先度, Ｘ座標, $Ｙ座標, "イメージデータ")
{
	CreateTexture("ナット名", 描画優先度, Ｘ座標, $Ｙ座標, "イメージデータ");

	if($Ｙ座標!="middle"&&$Ｙ座標!="Middle"){
		Move("ナット名", 0, @0, @-96, null, false);
	}

	Fade("ナット名", 0, 0, null, true);
}



//倍角「CreateMovie」です
function CreateMovie360("ナット名", 画像優先度, Ｘ座標, Ｙ座標, ループ, αチャンネル, "ムービーファイル")
{
	//現在のEXEでは横幅800pixが限界
	if(#LOCAL_sys_platform==100){
		CreateMovie("ナット名", 画像優先度, Ｘ座標, Ｙ座標, ループ, αチャンネル, "ムービーファイル");
		Fade("ナット名", 0, 0, null, true);
		Fade("ナット名", 16, 1000, null, false);
	}else{
		CreateMovie("ナット名", 画像優先度, Ｘ座標, Ｙ座標, ループ, αチャンネル, "ムービーファイル");
		Fade("ナット名", 0, 0, null, true);
		Fade("ナット名", 0, 1000, null, false);
		//Zoom("ナット名", 0, 1024, 1024, null, false);
		Request("ナット名", Smoothing);
	}
}

function CreateMovie360EX("ナット名", 画像優先度, Ｘ座標, Ｙ座標, ループ, αチャンネル, "ムービーファイル")
{
	//現在のEXEでは横幅800pixが限界
	if(#LOCAL_sys_platform==100){
		CreateMovie("ナット名", 画像優先度, Ｘ座標, Ｙ座標, ループ, αチャンネル, "ムービーファイル");
		Fade("ナット名", 0, 0, null, true);
		Request("ナット名", Smoothing);
		Zoom("ナット名", 0, 1608, 1608, null, false);
		Fade("ナット名", 16, 1000, null, false);
	}else{
		CreateMovie("ナット名", 画像優先度, Ｘ座標, Ｙ座標, ループ, αチャンネル, "ムービーファイル");
		Fade("ナット名", 0, 0, null, true);
		Fade("ナット名", 0, 1000, null, false);
		//Zoom("ナット名", 0, 2400, 1600, null, false);
		Request("ナット名", Smoothing);
	}
}



//背景専用
..CreateBG
function CreateBG(描画優先度, 所要時間, Ｘ座標, $Ｙ座標, "イメージデータ")
{
	if($BackGround=="back01"){$BackGround="back02";}
	else{$BackGround="back01";}

	CreateTexture($BackGround, 描画優先度, Ｘ座標, $Ｙ座標, "イメージデータ");
	Fade($BackGround, 0, 0, null, true);
	Request($BackGround, Lock);

	if($Ｙ座標!="middle"&&$Ｙ座標!="Middle"){
		Move($BackGround, 0, @0, @-96, null, false);
	}

	Fade("$BackGround", 所要時間, 1000, null, true);

	Delete("back*");
	Request($BackGround, UnLock);
}

//背景専用
..CreateBG2
function CreateBG2(描画優先度, 所要時間, Ｘ座標, $Ｙ座標, "イメージデータ")
{
	if($BackGround=="back01"){$BackGround="back02";}
	else{$BackGround="back01";}

	CreateTexture($BackGround, 描画優先度, Ｘ座標, $Ｙ座標, "イメージデータ");
	Request($BackGround, Lock);

	if($Ｙ座標!="middle"&&$Ｙ座標!="Middle"){
		Move($BackGround, 0, @0, @-96, null, false);
	}

	Fade("back*", 所要時間, 0, null, false);
	Fade($BackGround, 0, 1000, null, false);
	Wait(所要時間);

	Delete("back*");
	Request($BackGround, UnLock);
}


..FadeDelete
function FadeDelete("ナット名", 所要時間, 待ち)
{
	Fade("ナット名", 所要時間, 0, null, 待ち);
	Request("ナット名", Disused);
}

..PrintBG
function PrintBG(描画優先度)
{
//	CreateBG(描画優先度, 0, 0, 0, "SCREEN");
	if($BackGround=="back01"){$BackGround="back02";}
	else{$BackGround="back01";}
	CreateTexture("$BackGround", 描画優先度, 0, 0, "SCREEN");
	Request("$BackGround", Lock);

	Delete("*");
	/*stand変数初期化*/
		$stand01_use="";
		$stand02_use="";
		$stand03_use="";
		$stand04_use="";
		$stand05_use="";
		$stand06_use="";
		$stand07_use="";
		$stand08_use="";
		$stand09_use="";
		$stand10_use="";
	Request("$BackGround", UnLock);
}


..ClearAll
function ClearAll(所要時間)
{
	CreateColor("黒", 30000, 0, 0, 1280, 720, "BLACK");
	Fade("黒", 0, 0, null, true);
	Fade("黒", 所要時間, 1000, null, true);
	Delete("*");
	/*stand変数初期化*/
		$stand01_use="";
		$stand02_use="";
		$stand03_use="";
		$stand04_use="";
		$stand05_use="";
		$stand06_use="";
		$stand07_use="";
		$stand08_use="";
		$stand09_use="";
		$stand10_use="";
}


..FadeCross
function FadeCross("$ナット名１","$ナット名２", 所要時間)
{
	$ナット名 = "$ナット名１" + "$ナット名２";
	$ナット名アスタ = "$ナット名１" + "*";

	Fade("$ナット名", 所要時間, 1000, null, true);
	Request("$ナット名", Lock);
	Delete("$ナット名アスタ");
	Request("$ナット名", UnLock);
}



..MoveEX
function MoveEX("ナット名", 所要時間, $Ｘ座標, $Ｙ座標, テンポ, 待ち)
{
	$Ｘ座標プレ = - $Ｘ座標;
	$Ｙ座標プレ = - $Ｙ座標;

	$Ｘ座標マイナス = "@" + $Ｘ座標プレ;
	$Ｙ座標マイナス = "@" + $Ｙ座標プレ;

	$Ｘ座標プラス = "@" + $Ｘ座標;
	$Ｙ座標プラス = "@" + $Ｙ座標;

	Move("ナット名", 0, $Ｘ座標マイナス, $Ｙ座標マイナス, null, true);
	Move("ナット名", 所要時間, $Ｘ座標プラス, $Ｙ座標プラス, テンポ, 待ち);
}

..DeleteAll
function DeleteAll()
{
	Delete("*");
	/*stand変数初期化*/
		$stand01_use="";
		$stand02_use="";
		$stand03_use="";
		$stand04_use="";
		$stand05_use="";
		$stand06_use="";
		$stand07_use="";
		$stand08_use="";
		$stand09_use="";
		$stand10_use="";
}

//■cube系
//=============================================================================//
.//cube系
//=============================================================================//

..CubeRoom
function CubeRoom("ナット名", 描画優先度, 視野角度)
{
	$フォルダ名 = #SYSTEM_max_texture_size;
	$フォルダ名 = 1024;

	$前面画像 = "cg/rv/星来覚醒前_明/" + "$フォルダ名" + "/" + "rv_cube_front" + ".jpg";
	$後面画像 = "cg/rv/星来覚醒前_明/" + "$フォルダ名" + "/" + "rv_cube_back" + ".jpg";
	$右面画像 = "cg/rv/星来覚醒前_明/" + "$フォルダ名" + "/" + "rv_cube_right" + ".jpg";
	$左面画像 = "cg/rv/星来覚醒前_明/" + "$フォルダ名" + "/" + "rv_cube_left" + ".jpg";
	$上面画像 = "cg/rv/星来覚醒前_明/" + "$フォルダ名" + "/" + "rv_cube_top" + ".jpg";
	$下面画像 = "cg/rv/星来覚醒前_明/" + "$フォルダ名" + "/" + "rv_cube_bottom" + ".jpg";

	CreateCube("ナット名", 描画優先度, "$前面画像", "$後面画像", "$右面画像", "$左面画像", "$上面画像", "$下面画像");
	SetFov("キューブ１", 視野角度);
	Fade("ナット名", 0, 0, null, true);
}


..CubeRoom2
function CubeRoom2("ナット名", 描画優先度, 視野角度)
{
	$フォルダ名 = #SYSTEM_max_texture_size;
	$フォルダ名 = 1024;

	$前面画像 = "cg/rv/星来覚醒後_明/" + "$フォルダ名" + "/" + "rv_cube_front" + ".jpg";
	$後面画像 = "cg/rv/星来覚醒後_明/" + "$フォルダ名" + "/" + "rv_cube_back" + ".jpg";
	$右面画像 = "cg/rv/星来覚醒後_明/" + "$フォルダ名" + "/" + "rv_cube_right" + ".jpg";
	$左面画像 = "cg/rv/星来覚醒後_明/" + "$フォルダ名" + "/" + "rv_cube_left" + ".jpg";
	$上面画像 = "cg/rv/星来覚醒後_明/" + "$フォルダ名" + "/" + "rv_cube_top" + ".jpg";
	$下面画像 = "cg/rv/星来覚醒後_明/" + "$フォルダ名" + "/" + "rv_cube_bottom" + ".jpg";

	CreateCube("ナット名", 描画優先度, "$前面画像", "$後面画像", "$右面画像", "$左面画像", "$上面画像", "$下面画像");
	SetFov("キューブ１", 視野角度);
	Fade("ナット名", 0, 0, null, true);
}

..CubeRoom3
function CubeRoom3("ナット名", 描画優先度, 視野角度)
{
	$フォルダ名 = #SYSTEM_max_texture_size;
	$フォルダ名 = 1024;

	$前面画像 = "cg/rv/星来覚醒前_暗/" + "$フォルダ名" + "/" + "rv_cube_front" + ".jpg";
	$後面画像 = "cg/rv/星来覚醒前_暗/" + "$フォルダ名" + "/" + "rv_cube_back" + ".jpg";
	$右面画像 = "cg/rv/星来覚醒前_暗/" + "$フォルダ名" + "/" + "rv_cube_right" + ".jpg";
	$左面画像 = "cg/rv/星来覚醒前_暗/" + "$フォルダ名" + "/" + "rv_cube_left" + ".jpg";
	$上面画像 = "cg/rv/星来覚醒前_暗/" + "$フォルダ名" + "/" + "rv_cube_top" + ".jpg";
	$下面画像 = "cg/rv/星来覚醒前_暗/" + "$フォルダ名" + "/" + "rv_cube_bottom" + ".jpg";

	CreateCube("ナット名", 描画優先度, "$前面画像", "$後面画像", "$右面画像", "$左面画像", "$上面画像", "$下面画像");
	SetFov("キューブ１", 視野角度);
	Fade("ナット名", 0, 0, null, true);
}

..CubeRoom4
function CubeRoom4("ナット名", 描画優先度, 視野角度)
{
	$フォルダ名 = #SYSTEM_max_texture_size;
	$フォルダ名 = 1024;

	$前面画像 = "cg/rv/星来覚醒後_暗/" + "$フォルダ名" + "/" + "rv_cube_front" + ".jpg";
	$後面画像 = "cg/rv/星来覚醒後_暗/" + "$フォルダ名" + "/" + "rv_cube_back" + ".jpg";
	$右面画像 = "cg/rv/星来覚醒後_暗/" + "$フォルダ名" + "/" + "rv_cube_right" + ".jpg";
	$左面画像 = "cg/rv/星来覚醒後_暗/" + "$フォルダ名" + "/" + "rv_cube_left" + ".jpg";
	$上面画像 = "cg/rv/星来覚醒後_暗/" + "$フォルダ名" + "/" + "rv_cube_top" + ".jpg";
	$下面画像 = "cg/rv/星来覚醒後_暗/" + "$フォルダ名" + "/" + "rv_cube_bottom" + ".jpg";

	CreateCube("ナット名", 描画優先度, "$前面画像", "$後面画像", "$右面画像", "$左面画像", "$上面画像", "$下面画像");
	SetFov("キューブ１", 視野角度);
	Fade("ナット名", 0, 0, null, true);
}


//■妄想イン・アウトマクロ
//=============================================================================//
.//妄想in・out
//=============================================================================//

..DelusionIn
function DelusionIn()
{
	Move("レンズ１", 0, @0, @0, null, true);
	Request("レンズプロセス１", UnLock);
	Delete("レンズプロセス１");
	Request("レンズ１", UnLock);
	Delete("レンズ１");

	CreateColor("白１", 22000, 0, 0, 1280, 720, "White");
	Fade("白１", 0, 0, null, false);

//ＳＥ//妄想ＩＮ
	CreateSE("SE100","SE_擬音_妄そうIN");

//画面エフェクト//妄想ＩＮエフェクト
	CreateMovie360("妄想in", 21000, Center, Middle, false, false, "dx/mvin.avi");
	SoundPlay("SE100", 0, 1000, false);
	//Request("妄想in", Play);
	WaitAction("妄想in", null);

	Fade("白１", 300, 1000, null, true);
	Request("白１", Lock);
	Delete("妄想in");
//	WaitPlay("SE100", null);

	//★★★★ロック
	XBOX360_LockVideo(true);

		$SYSTEM_effect_lens_curvature = 8000;
		$SYSTEM_effect_lens_distance = 10;
		CreateEffect("レンズ１", 2100, -108, -332, 1240, 1240, "Lens");
		SetAlias("レンズ１", "レンズ１");
		CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");

	Request("レンズ１", Lock);
	Request("レンズプロセス１", Lock);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Request("レンズプロセス１", Start);
}

..LensMove
function LensMove()
{
	while(1)
	{
		BezierMove("@レンズ１", 10000, (@0,@0){@4,@-24}{@20,@-24}(@24,@0){@20,@24}{@4,@24}(@0,@0), null, true);
		BezierMove("@レンズ１", 10000, (@0,@0){@-4,@-24}{@-20,@-24}(@-24,@0){@-20,@24}{@-4,@24}(@0,@0), null, true);
	}
}


..DelusionIn2
function DelusionIn2()
{
	Request("白１", UnLock);
	Fade("白１", 1000, 0, null, true);
	Delete("白１");
}


..DelusionFakeIn
function DelusionFakeIn()
{
	CreateColor("白１", 22000, 0, 0, 1024, 576, "White");
	Request("白１", Lock);
	Fade("白１", 0, 0, null, false);

//画面エフェクト//妄想ＩＮエフェクト
	CreateMovie360("妄想in", 21000, Center, Middle, false, false, "dx/mvin.avi");
	Request("妄想in", Lock);
	//Request("妄想in", Play);


//ＳＥ//妄想ＩＮ
	CreateSE("SE01","SE_擬音_妄そうIN");
	SoundPlay("SE01", 0, 1000, false);
	WaitAction("SE01", null);

	Fade("白１", 300, 1000, null, true);
	Request("妄想in", UnLock);
	Delete("妄想in");
}

..DelusionFakeIn2
function DelusionFakeIn2()
{
	Request("白１", UnLock);
	Fade("白１", 1000, 0, null, true);
	Delete("白１");
}



..DelusionOut
function DelusionOut()
{
	Request("レンズ１", UnLock);
	Request("レンズプロセス１", UnLock);

	CreateColor("黒１", 22000, 0, 0, 1280, 720, "Black");
	Request("黒１", Lock);
	Fade("黒１", 0, 0, null, false);

//ＳＥ//妄想ＯＵＴ
	CreateSE("SE01","SE_擬音_妄そうOUT");

//画面エフェクト//妄想ＯＵＴエフェクト
	CreateMovie360("妄想out", 21000, Center, Middle, false, false, "dx/mvout.avi");
	SoundPlay("SE01", 0, 1000, false);
//	Request("妄想out", Play);
	WaitAction("妄想out", null);

	Move("レンズ１", 0, @0, @0, null, true);
	Delete("レンズプロセス１");
	Delete("レンズ１");

	Fade("黒１", 300, 1000, null, true);
	Delete("妄想out");
}

..DelusionOut2
function DelusionOut2()
{
	Wait(100);

	Request("黒１", UnLock);
	Fade("黒１", 1000, 0, null, true);
	Delete("黒１");

}


//■インターミッション
//=============================================================================//
.//インターミッションIN
//=============================================================================//

..IntermissionIn
function IntermissionIn()
{
	CreateColor("インターミッション色", 25001, 0, 0, 1024, 576, "black");
	Fade("インターミッション色", 0, 0, null, false);
	Request("インターミッション色", Lock);

	CreateMovie360EX("インターミッションムービー１", 25000, Center, Middle, false, true, "dx/mvあいきゃっち01.avi");
	Request("インターミッションムービー１", Lock);
	WaitPlay("インターミッションムービー１", null);

	Fade("インターミッション色", 300, 1000, null, true);
}

..IntermissionIn2
function IntermissionIn2()
{

	Wait(500);
	CreateMovie360EX("インターミッションムービー２", 25002, Center, Middle, false, true, "dx/mvあいきゃっち02.avi");
	Wait(300);

	Request("インターミッション色", UnLock);
	Request("インターミッションムービー１", UnLock);
	FadeDelete("インターミッション色", 100, false);
	FadeDelete("インターミッションムービー１", 100, true);

	WaitPlay("インターミッションムービー２", null);

	Delete("インターミッションムービー２");


}


//■章IN
//=============================================================================//
.//章IN
//=============================================================================//

..ChapterIn
function ChapterIn($ChapterInMovie)
{
	$PreSoundName=true;
	CreateColor("インターチャプター色", 25000, 0, 0, 1280, 720, "black");
	Request("インターチャプター色", Lock);
}


..ChapterIn2
function ChapterIn2()
{
	CreateMovie360EX("インターチャプタームービー１", 25000, Center, Middle, false, true, $ChapterInMovie);
	Wait(5);

	Request("インターチャプター色", UnLock);
	FadeDelete("インターチャプター色", 100, false);
	WaitPlay("インターチャプタームービー１", null);
	Delete("インターチャプタームービー１");
}






//■音関係のマクロコマンド
//=============================================================================//
.//音関係
//=============================================================================//

// 定義
function CreateBGM("ナット名","$音楽データ")
{
	$場所指定 = "sound/bgm/" + "$音楽データ";

	CreateSound("ナット名", BGM, "$場所指定");
	SetVolume("ナット名", 0, 0, NULL);
	SetAlias("ナット名", "ナット名");
}

function CreateBGM2("ナット名","$音楽データ")
{
	$場所指定 = "sound/bgm/" + "$音楽データ";

	CreateSound("ナット名", SE, "$場所指定");
	SetVolume("ナット名", 0, 0, NULL);
	SetAlias("ナット名", "ナット名");
}

function CreateBGM3("ナット名","$音楽データ",開始ミリ秒,終了ミリ秒)
{
	$場所指定 = "sound/bgm/" + "$音楽データ";

	CreateSound("ナット名", BGM, "$場所指定");
	SetVolume("ナット名", 0, 0, NULL);
	SetAlias("ナット名", "ナット名");
	SetLoopPoint("ナット名",開始ミリ秒,終了ミリ秒);
}

function CreateSE("ナット名",$音楽データ)
{
	$場所指定 = "sound/se/" + $音楽データ;

	CreateSound("ナット名", SE, $場所指定);
	SetVolume("ナット名", 0, 0, NULL);
	SetAlias("ナット名", "ナット名");
}

function CreateVOICE("ナット名","$音楽データ")
{
	$場所指定 = "voice/" + "$音楽データ";

	CreateSound("ナット名", VOICE, "$場所指定");
	SetVolume("ナット名", 0, 0, NULL);
	SetAlias("ナット名", "ナット名");
}

function CreateVOICE2("ナット名","$音楽データ")
{
	$場所指定 = "voice/" + "$音楽データ";

	CreateSound("ナット名", SE, "$場所指定");
	SetVolume("ナット名", 0, 0, NULL);
	SetAlias("ナット名", "ナット名");
}

// 再生
function MusicStart("ナット名",秒数,ボリウム,再生方向,再生スピード,テンポ,ループ設定)
{
	Request("ナット名", Play);
	SetLoop("ナット名", ループ設定);
	SetFrequency("ナット名", 0, 再生スピード, NULL);
	SetPan("ナット名", 0, 再生方向, NULL);
	SetVolume("ナット名", 秒数, ボリウム, テンポ);
	Request("ナット名", Disused);
}

function SoundPlay("ナット名",秒数,ボリウム,ループ設定)
{
	Request("ナット名", Play);
	SetLoop("ナット名", ループ設定);
	SetVolume("ナット名", 秒数, ボリウム, null);
	Request("ナット名", Disused);
}

function SoundStop("ナット名")
{
	SetVolume("ナット名", 3000, 0, NULL);
}

function SoundStop2("ナット名")
{
	Request("ナット名", Stop);
	Delete("ナット名");
}

//■BGMを纏めて定義
//=============================================================================//
.//BGM定義
//=============================================================================//

function InitBGM()
{
	//27
	CreateBGM3("CH00","CH00",2981,43832);
	CreateBGM("CH01","CH01");
	CreateBGM3("CH02","CH02",9766,74528);
	CreateBGM3("CH03","CH03",6645,184915);
	CreateBGM3("CH04","CH04",10010,150010);
	CreateBGM3("CH05","CH05",18757,98757);
	CreateBGM("CH06","CH06");
	CreateBGM3("CH07","CH07",11575,117341);
	CreateBGM3("CH08","CH08",19426,221486);
	CreateBGM("CH09","CH09");
	CreateBGM("CH10","CH10");
	CreateBGM3("CH11","CH11",4675,90009);
	CreateBGM3("CH12","CH12",0,159157);
	CreateBGM("CH13","CH13");
	CreateBGM3("CH14","CH14",7019,170424);
	CreateBGM3("CH15","CH15",21905,181905);
	CreateBGM("CH16","CH16");
//	CreateBGM("CH17","CH17");
//	CreateBGM("CH18","CH18");
//	CreateBGM("CH19","CH19");
	CreateBGM3("CH20","CH20",6997,198998);
	CreateBGM("CH21","CH21");
	CreateBGM3("CH22","CH22",3272,119393);
	CreateBGM3("CH23","CH23",19495,107257);
	CreateBGM3("CH24","CH24",4952,182225);
	CreateBGM3("CH25","CH25",5109,68939);
	CreateBGM("CH26","CH26");
//	CreateBGM("CH27","CH27");
	CreateBGM("CH28","CH28");
	CreateBGM("CH29","CH29");

	CreateBGM("CH_INS_FES_あかぺら","CH_INS_FES_あかぺら");
	CreateBGM("CH_INS_FES_ライヴ","CH_INS_FES_ライヴ");
	CreateBGM("CH_OP","CH_OP");
	CreateBGM("CH_OP_Instrumental","CH_OP_Instrumental");
	CreateBGM2("CH_ED_A","CH_ED_A");
	CreateBGM2("CH_ED_B","CH_ED_B");
	CreateBGM2("CH_ED_C","CH_ED_C");

	Request("@CH00",Lock);
	Request("@CH01",Lock);
	Request("@CH02",Lock);
	Request("@CH03",Lock);
	Request("@CH04",Lock);
	Request("@CH05",Lock);
	Request("@CH06",Lock);
	Request("@CH07",Lock);
	Request("@CH08",Lock);
	Request("@CH09",Lock);
	Request("@CH10",Lock);
	Request("@CH11",Lock);
	Request("@CH12",Lock);
	Request("@CH13",Lock);
	Request("@CH14",Lock);
	Request("@CH15",Lock);
	Request("@CH16",Lock);
//	Request("@CH17",Lock);
//	Request("@CH18",Lock);
//	Request("@CH19",Lock);
	Request("@CH20",Lock);
	Request("@CH21",Lock);
	Request("@CH22",Lock);
	Request("@CH23",Lock);
	Request("@CH24",Lock);
	Request("@CH25",Lock);
	Request("@CH26",Lock);
//	Request("@CH27",Lock);
	Request("@CH28",Lock);
	Request("@CH29",Lock);

	Request("@CH_INS_FES_あかぺら",Lock);
	Request("@CH_INS_FES_ライヴ",Lock);
	Request("@CH_OP",Lock);
	Request("@CH_OP_Instrumental",Lock);
	Request("@CH_ED_A",Lock);
	Request("@CH_ED_B",Lock);
	Request("@CH_ED_C",Lock);
}

//=============================================================================//
.//BGM定義360
//=============================================================================//
function CreateBGM360A($音楽データ)
{
	$場所指定 = "sound/bgm/" + $音楽データ;
	$ナット名 = $音楽データ;

	CreateSound($ナット名, BGM, $場所指定);
	SetVolume($ナット名, 0, 0, NULL);
	SetAlias($ナット名, $音楽データ);
	Request($ナット名,Lock);
}

function CreateBGM360B($音楽データ)
{
	$場所指定 = "sound/bgm/" + $音楽データ;
	$ナット名 = $音楽データ;

	CreateSound($ナット名, BGM, $場所指定);
	SetVolume($ナット名, 0, 0, NULL);
	SetAlias($ナット名, $音楽データ);
	Request($ナット名,Lock);
}

function CreateBGM360C($音楽データ,開始ミリ秒,終了ミリ秒)
{
	$場所指定 = "sound/bgm/" + $音楽データ;
	$ナット名 = $音楽データ;

	CreateSound($ナット名, BGM, $場所指定);
	SetVolume($ナット名, 0, 0, NULL);
	SetAlias($ナット名, $音楽データ);
	SetLoopPoint($ナット名,開始ミリ秒,終了ミリ秒);
	Request($ナット名,Lock);
}


function CreateBGM360($BGMName)
{
	if($BGMName=="CH00"){
		CreateBGM360C("CH00",2981,43832);
	}else if($BGMName=="CH01"){
		CreateBGM360A("CH01");
	}else if($BGMName=="CH02"){
		CreateBGM360C("CH02",9766,74528);
	}else if($BGMName=="CH03"){
		CreateBGM360C("CH03",6645,184915);
	}else if($BGMName=="CH04"){
		CreateBGM360C("CH04",10010,150010);
	}else if($BGMName=="CH05"){
		CreateBGM360C("CH05",18757,98757);
	}else if($BGMName=="CH06"){
		CreateBGM360A("CH06");
	}else if($BGMName=="CH07"){
		CreateBGM360C("CH07",11575,117341);
	}else if($BGMName=="CH08"){
		CreateBGM360C("CH08",19426,221486);
	}else if($BGMName=="CH09"){
		CreateBGM360A("CH09");
	}else if($BGMName=="CH10"){
		CreateBGM360A("CH10");
	}else if($BGMName=="CH11"){
		CreateBGM360C("CH11",4675,90009);
	}else if($BGMName=="CH12"){
		CreateBGM360C("CH12",0,159157);
	}else if($BGMName=="CH13"){
		CreateBGM360A("CH13");
	}else if($BGMName=="CH14"){
		CreateBGM360C("CH14",7019,170424);
	}else if($BGMName=="CH15"){
		CreateBGM360C("CH15",21905,181905);
	}else if($BGMName=="CH16"){
		CreateBGM360A("CH16");
	}else if($BGMName=="CH17"){
//		CreateBGM360A("CH17");
	}else if($BGMName=="CH18"){
//		CreateBGM360A("CH18");
	}else if($BGMName=="CH19"){
//		CreateBGM360A("CH19");
	}else if($BGMName=="CH20"){
		CreateBGM360C("CH20",6997,198998);
	}else if($BGMName=="CH21"){
		CreateBGM360A("CH21");
	}else if($BGMName=="CH22"){
		CreateBGM360C("CH22",3272,119393);
	}else if($BGMName=="CH23"){
		CreateBGM360C("CH23",19495,107257);
	}else if($BGMName=="CH24"){
		CreateBGM360C("CH24",4952,182225);
	}else if($BGMName=="CH25"){
		CreateBGM360C("CH25",5109,68939);
	}else if($BGMName=="CH26"){
		CreateBGM360A("CH26");
	}else if($BGMName=="CH27"){
//		CreateBGM360A("CH27");
	}else if($BGMName=="CH28"){
		CreateBGM360A("CH28");
	}else if($BGMName=="CH29"){
		CreateBGM360A("CH29");
	}else if($BGMName=="CH_INS_FES_あかぺら"){
		CreateBGM360A("CH_INS_FES_あかぺら");
	}else if($BGMName=="CH_INS_FES_ライヴ"){
		CreateBGM360A("CH_INS_FES_ライヴ");
	}else if($BGMName=="CH_OP"){
		CreateBGM360A("CH_OP");
	}else if($BGMName=="CH_OP_Instrumental"){
		CreateBGM360A("CH_OP_Instrumental");
	}else if($BGMName=="CH_ED_A"){
		if($ExtraTitle){
			CreateBGM360A("CH_ED_A");//ED
		}else{
			CreateBGM360B("CH_ED_A");//ED
		}
	}else if($BGMName=="CH_ED_B"){
		if($ExtraTitle){
			CreateBGM360A("CH_ED_B");//ED
		}else{
			CreateBGM360B("CH_ED_B");//ED
		}
	}else if($BGMName=="CH_ED_C"){
		if($ExtraTitle){
			CreateBGM360A("CH_ED_C");//ED
		}else{
			CreateBGM360B("CH_ED_C");//ED
		}
	}else if($BGMName=="CHN_ED_A"){
		if($ExtraTitle){
			CreateBGM360A("CHN_ED_A");//ED
		}else{
			CreateBGM360B("CHN_ED_A");//ED
		}
	}else if($BGMName=="CHN_ED_B"){
		if($ExtraTitle){
			CreateBGM360A("CHN_ED_B");//ED
		}else{
			CreateBGM360B("CHN_ED_B");//ED
		}
	}else if($BGMName=="CHN_ED_ayase"){
		if($ExtraTitle){
			CreateBGM360A("CHN_ED_ayase");//ED
		}else{
			CreateBGM360B("CHN_ED_ayase");//ED
		}
	}else if($BGMName=="CHN_ED_kozue"){
		if($ExtraTitle){
			CreateBGM360A("CHN_ED_kozue");//ED
		}else{
			CreateBGM360B("CHN_ED_kozue");//ED
		}
	}else if($BGMName=="CHN_ED_nanami"){
		if($ExtraTitle){
			CreateBGM360A("CHN_ED_nanami");//ED
		}else{
			CreateBGM360B("CHN_ED_nanami");//ED
		}
	}else if($BGMName=="CHN_ED_rimi"){
		if($ExtraTitle){
			CreateBGM360A("CHN_ED_rimi");//ED
		}else{
			CreateBGM360B("CHN_ED_rimi");//ED
		}
	}else if($BGMName=="CHN_ED_sena"){
		if($ExtraTitle){
			CreateBGM360A("CHN_ED_sena");//ED
		}else{
			CreateBGM360B("CHN_ED_sena");//ED
		}
	}else if($BGMName=="CHN_ED_yua"){
		if($ExtraTitle){
			CreateBGM360A("CHN_ED_yua");//ED
		}else{
			CreateBGM360B("CHN_ED_yua");//ED
		}
	}else if($BGMName=="CHN_INS_PHANTASM"){
		if($ExtraTitle){
			CreateBGM360A("CHN_INS_PHANTASM");//ED
		}else{
			CreateBGM360B("CHN_INS_PHANTASM");//ED
		}
	}else if($BGMName=="CHN_OP"){
		if($ExtraTitle){
			CreateBGM360A("CHN_OP");//ED
		}else{
			CreateBGM360B("CHN_OP");//ED
		}
	}else if($BGMName=="chn01"){
		CreateBGM360A("chn01");
	}else if($BGMName=="chn02"){
		CreateBGM360A("chn02");
	}else if($BGMName=="chn03"){
		CreateBGM360A("chn03");
	}else if($BGMName=="chn04"){
		CreateBGM360A("chn04");
	}else if($BGMName=="chn05"){
		CreateBGM360A("chn05");
	}else if($BGMName=="CHN_ED_ayase_inst"){
		CreateBGM360A("CHN_ED_ayase_inst");
	}else if($BGMName=="CHN_ED_kozue_inst"){
		CreateBGM360A("CHN_ED_kozue_inst");
	}else if($BGMName=="CHN_ED_nanami_inst"){
		CreateBGM360A("CHN_ED_nanami_inst");
	}else if($BGMName=="CHN_ED_rimi_inst"){
		CreateBGM360A("CHN_ED_rimi_inst");
	}else if($BGMName=="CHN_ED_sena_inst"){
		CreateBGM360A("CHN_ED_sena_inst");
	}else if($BGMName=="CHN_ED_yua_inst"){
		CreateBGM360A("CHN_ED_yua_inst");
	}
}



function BGMPlay360($SoundName,秒数,$ボリウム,ループ設定)
{
	$SoundName2="@"+$SoundName;
	$SoundR=RemainTime($SoundName2);

	if($ボリウム==0){
		$PreSoundName=true;
		Request($SoundName, UnLock);
		Request($SoundName, Disused);
		SetVolume($SoundName, 秒数, $ボリウム, null);
	}else if($PreSoundName==$SoundName){
		SetVolume($SoundName, 秒数, $ボリウム, null);
	}else if($SoundR!=0){
		SetVolume($SoundName, 秒数, $ボリウム, null);
	}else{
		CreateBGM360($SoundName);

		$PreSoundName=$SoundName;
		Request($SoundName, Play);
		SetLoop($SoundName, ループ設定);
		SetVolume($SoundName, 秒数, $ボリウム, null);
		Request($SoundName, Disused);

		$PreSoundName=$SoundName;
	}
}

function BGMPlay360Suspend($SoundName,秒数,$ボリウム,ループ設定)
{
	$SoundName2="@"+$SoundName;
	$SoundR=RemainTime($SoundName2);

	if($ボリウム==0){
		$PreSoundName=true;
		Request($SoundName, UnLock);
		Request($SoundName, Disused);
		SetVolume($SoundName, 秒数, $ボリウム, null);
	}else if($PreSoundName==$SoundName){
		SetVolume($SoundName, 秒数, $ボリウム, null);
	}else if($SoundR!=0){
		SetVolume($SoundName, 秒数, $ボリウム, null);
	}else{
		CreateBGM360($SoundName);
		Request($SoundName, CompulsorySuspend);

		$PreSoundName=$SoundName;
		Request($SoundName, Play);
		SetLoop($SoundName, ループ設定);
		SetVolume($SoundName, 秒数, $ボリウム, null);
		Request($SoundName, Disused);

		$PreSoundName=$SoundName;
	}
}

function SetVolume360($SoundName,秒数,$ボリウム,テンポ)
{
	if($ボリウム==0){
		$PreSoundName=true;
		Request($SoundName, UnLock);
	}
	SetVolume($SoundName, 秒数, $ボリウム, null);
}


//=============================================================================//
.//スタートロード
//=============================================================================//
function StartLoad05()
{//待ち短
	//■バックログ
	LoadFile("cg/sys/backlog/new-back-logスライドバー.png",true);
	LoadFile("cg/sys/backlog/new-back-log地紋.png",true);
	LoadFile("cg/sys/backlog/スピーカ001.png",true);
	LoadFile("cg/sys/backlog/スピーカ002.png",true);
	LoadFile("cg/sys/backlog/スピーカ003.png",true);
}

function StartLoad06()
{//待ち長
	//■コンフィグ
	LoadFile("cg/sys/config/all-ok-001.png",true);
	LoadFile("cg/sys/config/all-ok-002.png",true);
	LoadFile("cg/sys/config/all-ok-003.png",true);
	LoadFile("cg/sys/config/config背景画像.png",true);
	LoadFile("cg/sys/config/PUSH-001.png",true);
	LoadFile("cg/sys/config/PUSH-002.png",true);
	LoadFile("cg/sys/config/PUSH-003.png",true);
	LoadFile("cg/sys/config/コンフィグシート.png",true);
	LoadFile("cg/sys/config/コンフィグ座標選択バー.png",true);
	LoadFile("cg/sys/config/スクロールボタン.png",true);
	LoadFile("cg/sys/config/チェックicon.png",true);
	LoadFile("cg/sys/config/チェックボックス選択色.png",true);
	LoadFile("cg/sys/config/バー裏側アタリ判定.png",true);
	LoadFile("cg/sys/config/メモリ針-001.png",true);
	LoadFile("cg/sys/config/メモリ針-002.png",true);
	LoadFile("cg/sys/config/調整バーつまみ裏側アタリ判定.png",true);
}


function StartLoad07()
{//待ち中
	//■セーブ
	LoadFile("cg/sys/save/BACK-000.png",true);
	LoadFile("cg/sys/save/BACK-001.png",true);
	LoadFile("cg/sys/save/BACK-002.png",true);
	LoadFile("cg/sys/save/BACK-003.png",true);
	LoadFile("cg/sys/save/NEW.png",true);
	LoadFile("cg/sys/save/NEXT-000.png",true);
	LoadFile("cg/sys/save/NEXT-001.png",true);
	LoadFile("cg/sys/save/NEXT-002.png",true);
	LoadFile("cg/sys/save/NEXT-003.png",true);
	LoadFile("cg/sys/save/NO-001.png",true);
	LoadFile("cg/sys/save/NO-002.png",true);
	LoadFile("cg/sys/save/NO-003.png",true);
	LoadFile("cg/sys/save/NO-004.png",true);
	LoadFile("cg/sys/save/NO-005.png",true);
	LoadFile("cg/sys/save/NO-006.png",true);
	LoadFile("cg/sys/save/NO-007.png",true);
	LoadFile("cg/sys/save/NO-008.png",true);
	LoadFile("cg/sys/save/NO-009.png",true);
	LoadFile("cg/sys/save/NO-010.png",true);
	LoadFile("cg/sys/save/サムネールNONE.png",true);
	LoadFile("cg/sys/save/サムネール選択中ワク.png",true);
	LoadFile("cg/sys/save/上帯.png",true);
	LoadFile("cg/sys/save/下帯LOAD.png",true);
	LoadFile("cg/sys/save/下帯SAVE.png",true);
	LoadFile("cg/sys/save/文章先頭▲.png",true);
	LoadFile("cg/sys/save/背景.png",true);
	LoadFile("cg/sys/save/選択サムネールNONE.png",true);
	LoadFile("cg/sys/save/選択サムネールNONE2.png",true);
}



function StartLoad09()
{//最後
	//■シリアス選択肢
	LoadFile("cg/sys/select/back.png",true);
	LoadFile("cg/sys/select/door-small.png",true);
	LoadFile("cg/sys/select/frame.png",true);
	LoadFile("cg/sys/select/jyousan.png",true);
	LoadFile("cg/sys/select/no.png",true);
	LoadFile("cg/sys/select/no000.png",true);
	LoadFile("cg/sys/select/no001.png",true);
	LoadFile("cg/sys/select/no002.png",true);
	LoadFile("cg/sys/select/no003.png",true);
	LoadFile("cg/sys/select/no004.png",true);
	LoadFile("cg/sys/select/no005.png",true);
	LoadFile("cg/sys/select/no006.png",true);
	LoadFile("cg/sys/select/no007.png",true);
	LoadFile("cg/sys/select/no008.png",true);
	LoadFile("cg/sys/select/no009.png",true);
	LoadFile("cg/sys/select/no010.png",true);
	LoadFile("cg/sys/select/no011.png",true);
	LoadFile("cg/sys/select/room.png",true);
	LoadFile("cg/sys/select/Select001.png",true);
	LoadFile("cg/sys/select/Select002.png",true);
	LoadFile("cg/sys/select/Select003.png",true);
	LoadFile("cg/sys/select/yes.png",true);
	LoadFile("cg/sys/select/yes000.png",true);
	LoadFile("cg/sys/select/yes001.png",true);
	LoadFile("cg/sys/select/yes002.png",true);
	LoadFile("cg/sys/select/yes003.png",true);
	LoadFile("cg/sys/select/yes004.png",true);
	LoadFile("cg/sys/select/yes005.png",true);
	LoadFile("cg/sys/select/yes006.png",true);
	LoadFile("cg/sys/select/yes007.png",true);
	LoadFile("cg/sys/select/yes008.png",true);
	LoadFile("cg/sys/select/yes009.png",true);
	LoadFile("cg/sys/select/yes010.png",true);
	LoadFile("cg/sys/select/yes011.png",true);
	LoadFile("cg/sys/select/yes101.png",true);
	LoadFile("cg/sys/select/yes102.png",true);
	LoadFile("cg/sys/select/yes103.png",true);
	LoadFile("cg/sys/select/yes104.png",true);
	LoadFile("cg/sys/select/yes105.png",true);
	LoadFile("cg/sys/select/yes106.png",true);
	LoadFile("cg/sys/select/yes107.png",true);
	LoadFile("cg/sys/select/yes108.png",true);
	LoadFile("cg/sys/select/yes109.png",true);
	LoadFile("cg/sys/select/yes110.png",true);
	LoadFile("cg/sys/select/yes111.png",true);
	LoadFile("cg/sys/select/yesno.png",true);

	//■ギャグ選択肢
	LoadFile("cg/sys/select2/back.png",true);
	LoadFile("cg/sys/select2/back02.png",true);
	LoadFile("cg/sys/select2/back03.png",true);
	LoadFile("cg/sys/select2/door-small.png",true);
	LoadFile("cg/sys/select2/frame.png",true);
	LoadFile("cg/sys/select2/jyousan.png",true);
	LoadFile("cg/sys/select2/no-ok.png",true);
	LoadFile("cg/sys/select2/no.png",true);
	LoadFile("cg/sys/select2/no000.png",true);
	LoadFile("cg/sys/select2/room.png",true);
	LoadFile("cg/sys/select2/yes-ok.png",true);
	LoadFile("cg/sys/select2/yes.png",true);
	LoadFile("cg/sys/select2/yes000.png",true);
	LoadFile("cg/sys/select2/yesno.png",true);

}



//――――――――――――――――――――――――――――――――――――――
function StartLoad_common()
{
	LoadFile("cg/sys/title/debug002.png",true);
	LoadFile("cg/sys/title/title.png",true);
	LoadFile("cg/sys/title/title2.png",true);
}

function StartLoad_normal()
{
	LoadFile("cg/sys/title/title-normal/menu-window.png",true);
	LoadFile("cg/sys/title/title-normal/synapse.png",true);
	LoadFile("cg/sys/title/title-normal/Title-back.png",true);
	LoadFile("cg/sys/title/title-normal/Title-bluesky-000.png",true);
	LoadFile("cg/sys/title/title-normal/Title-bluesky-001.png",true);
	LoadFile("cg/sys/title/title-normal/Title-bluesky-002.png",true);
	LoadFile("cg/sys/title/title-normal/Title-bluesky-003.png",true);
	if(#DebugMode){
		LoadFile("cg/sys/title/title-normal/Title-caution-000.png",true);
		LoadFile("cg/sys/title/title-normal/Title-caution-001.png",true);
		LoadFile("cg/sys/title/title-normal/Title-caution-002.png",true);
		LoadFile("cg/sys/title/title-normal/Title-caution-003.png",true);
	}
	LoadFile("cg/sys/title/title-normal/Title-config-000.png",true);
	LoadFile("cg/sys/title/title-normal/Title-config-001.png",true);
	LoadFile("cg/sys/title/title-normal/Title-config-002.png",true);
	LoadFile("cg/sys/title/title-normal/Title-config-003.png",true);
	LoadFile("cg/sys/title/title-normal/Title-continue-000.png",true);
	LoadFile("cg/sys/title/title-normal/Title-continue-001.png",true);
	LoadFile("cg/sys/title/title-normal/Title-continue-001a.png",true);
	LoadFile("cg/sys/title/title-normal/Title-continue-001b.png",true);
	LoadFile("cg/sys/title/title-normal/Title-continue-002.png",true);
	LoadFile("cg/sys/title/title-normal/Title-continue-002a.png",true);
	LoadFile("cg/sys/title/title-normal/Title-continue-002b.png",true);
	LoadFile("cg/sys/title/title-normal/Title-extra-000.png",true);
	LoadFile("cg/sys/title/title-normal/Title-extra-001.png",true);
	LoadFile("cg/sys/title/title-normal/Title-extra-002.png",true);
	LoadFile("cg/sys/title/title-normal/Title-extra-003.png",true);
	LoadFile("cg/sys/title/title-normal/Title-logo.png",true);
	LoadFile("cg/sys/title/title-normal/Title-logo2.png",true);
	LoadFile("cg/sys/title/title-normal/Title-start-000.png",true);
	LoadFile("cg/sys/title/title-normal/Title-start-001.png",true);
	LoadFile("cg/sys/title/title-normal/Title-start-002.png",true);
	LoadFile("cg/sys/title/title-normal/Title-start-003.png",true);


	LoadFile("cg/sys/title/title-normal/down-menu/000-チャプター選択表示時バー.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/001-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/001-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/001-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/002-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/002-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/002-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/003-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/003-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/003-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/004-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/004-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/004-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/005-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/005-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/005-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/006-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/006-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/006-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/007-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/007-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/007-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/008-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/008-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/008-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/009-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/009-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/009-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/010-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/010-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/010-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/011-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/011-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/011-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/012-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/012-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/012-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/013-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/013-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/013-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/014-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/014-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/014-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/015-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/015-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/015-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/016-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/016-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/016-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/017-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/017-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/017-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/018-チャプター001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/018-チャプター002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/018-チャプター003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/CHAPTERLIST-001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/CHAPTERLIST-002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/LASTSAVE-001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/LASTSAVE-002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/LASTSAVE-003.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/LOADGAME-001.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/LOADGAME-002.png",true);
	LoadFile("cg/sys/title/title-normal/down-menu/LOADGAME-003.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/bluesky-001.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/bluesky-002.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/bluesky-003.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/bluesky-004.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/bluesky-005.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/bluesky-006.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/bluesky-007.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/bluesky-008.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/bluesky-009.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/config-001.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/config-002.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/config-003.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/config-004.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/config-005.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/config-006.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/config-007.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/config-008.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/config-009.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/extra-001.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/extra-002.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/extra-003.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/extra-004.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/extra-005.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/extra-006.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/extra-007.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/extra-008.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/extra-009.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/cont-001.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/cont-002.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/cont-003.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/cont-004.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/cont-005.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/cont-006.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/cont-007.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/cont-008.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/cont-009.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/start-001.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/start-002.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/start-003.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/start-004.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/start-005.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/start-006.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/start-007.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/start-008.png",true);
	LoadFile("cg/sys/title/title-normal/title-anime/start-009.png",true);
}


function StartLoad_sky()
{
	LoadFile("cg/sys/title/title-sky/menu-window.png",true);
	LoadFile("cg/sys/title/title-sky/synapse.png",true);
	LoadFile("cg/sys/title/title-sky/Title-back.png",true);
	if(#DebugMode){
		LoadFile("cg/sys/title/title-sky/Title-caution-000.png",true);
		LoadFile("cg/sys/title/title-sky/Title-caution-001.png",true);
		LoadFile("cg/sys/title/title-sky/Title-caution-002.png",true);
		LoadFile("cg/sys/title/title-sky/Title-caution-003.png",true);
	}
	LoadFile("cg/sys/title/title-sky/Title-config-000.png",true);
	LoadFile("cg/sys/title/title-sky/Title-config-001.png",true);
	LoadFile("cg/sys/title/title-sky/Title-config-002.png",true);
	LoadFile("cg/sys/title/title-sky/Title-config-003.png",true);
	LoadFile("cg/sys/title/title-sky/Title-continue-000.png",true);
	LoadFile("cg/sys/title/title-sky/Title-continue-001.png",true);
	LoadFile("cg/sys/title/title-sky/Title-continue-001a.png",true);
	LoadFile("cg/sys/title/title-sky/Title-continue-001b.png",true);
	LoadFile("cg/sys/title/title-sky/Title-continue-002.png",true);
	LoadFile("cg/sys/title/title-sky/Title-continue-002a.png",true);
	LoadFile("cg/sys/title/title-sky/Title-continue-002b.png",true);
	LoadFile("cg/sys/title/title-sky/Title-extra-000.png",true);
	LoadFile("cg/sys/title/title-sky/Title-extra-001.png",true);
	LoadFile("cg/sys/title/title-sky/Title-extra-002.png",true);
	LoadFile("cg/sys/title/title-sky/Title-extra-003.png",true);
	LoadFile("cg/sys/title/title-sky/Title-logo.png",true);
	LoadFile("cg/sys/title/title-sky/Title-logo2.png",true);
	LoadFile("cg/sys/title/title-sky/Title-start-000.png",true);
	LoadFile("cg/sys/title/title-sky/Title-start-001.png",true);
	LoadFile("cg/sys/title/title-sky/Title-start-002.png",true);
	LoadFile("cg/sys/title/title-sky/Title-start-003.png",true);


	LoadFile("cg/sys/title/title-sky/down-menu/000-チャプター選択表示時バー.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/001-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/001-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/001-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/002-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/002-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/002-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/003-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/003-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/003-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/004-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/004-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/004-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/005-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/005-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/005-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/006-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/006-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/006-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/007-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/007-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/007-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/008-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/008-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/008-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/009-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/009-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/009-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/010-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/010-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/010-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/011-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/011-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/011-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/012-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/012-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/012-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/013-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/013-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/013-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/014-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/014-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/014-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/015-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/015-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/015-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/016-チャプター001 .png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/016-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/016-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/017-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/017-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/017-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/018-チャプター001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/018-チャプター002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/018-チャプター003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/CHAPTERLIST-001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/CHAPTERLIST-002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/LASTSAVE-001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/LASTSAVE-002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/LASTSAVE-003.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/LOADGAME-001.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/LOADGAME-002.png",true);
	LoadFile("cg/sys/title/title-sky/down-menu/LOADGAME-003.png",true);

	LoadFile("cg/sys/title/title-sky/title-anime/config-001.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/config-002.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/config-003.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/config-004.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/config-005.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/config-006.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/config-007.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/config-008.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/config-009.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/extra-001.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/extra-002.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/extra-003.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/extra-004.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/extra-005.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/extra-006.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/extra-007.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/extra-008.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/extra-009.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/cont-001.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/cont-002.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/cont-003.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/cont-004.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/cont-005.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/cont-006.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/cont-007.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/cont-008.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/cont-009.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/start-001.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/start-002.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/start-003.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/start-004.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/start-005.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/start-006.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/start-007.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/start-008.png",true);
	LoadFile("cg/sys/title/title-sky/title-anime/start-009.png",true);
}


function StartUnLoad()
{
	UnloadFile("cg/sys/title/debug002.png");
	UnloadFile("cg/sys/title/title.png");
	UnloadFile("cg/sys/title/title2.png");

	UnloadFile("cg/sys/title/title-normal/menu-window.png");
	UnloadFile("cg/sys/title/title-normal/synapse.png");
	UnloadFile("cg/sys/title/title-normal/Title-back.png");
	UnloadFile("cg/sys/title/title-normal/Title-bluesky-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-bluesky-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-bluesky-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-bluesky-003.png");
	UnloadFile("cg/sys/title/title-normal/Title-caution-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-caution-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-caution-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-caution-003.png");
	UnloadFile("cg/sys/title/title-normal/Title-config-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-config-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-config-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-config-003.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-001a.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-001b.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-002a.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-002b.png");
	UnloadFile("cg/sys/title/title-normal/Title-extra-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-extra-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-extra-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-extra-003.png");
	UnloadFile("cg/sys/title/title-normal/Title-logo.png");
	UnloadFile("cg/sys/title/title-normal/Title-logo2.png");
	UnloadFile("cg/sys/title/title-normal/Title-start-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-start-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-start-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-start-003.png");

	UnloadFile("cg/sys/title/title-normal/down-menu/000-チャプター選択表示時バー.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/001-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/001-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/001-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/002-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/002-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/002-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/003-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/003-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/003-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/004-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/004-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/004-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/005-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/005-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/005-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/006-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/006-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/006-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/007-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/007-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/007-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/008-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/008-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/008-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/009-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/009-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/009-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/010-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/010-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/010-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/011-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/011-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/011-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/012-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/012-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/012-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/013-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/013-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/013-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/014-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/014-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/014-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/015-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/015-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/015-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/016-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/016-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/016-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/017-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/017-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/017-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/018-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/018-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/018-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/CHAPTERLIST-001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/CHAPTERLIST-002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LASTSAVE-001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LASTSAVE-002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LASTSAVE-003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LOADGAME-001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LOADGAME-002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LOADGAME-003.png");

	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-001.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-002.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-004.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-005.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-006.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-007.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-008.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-009.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-001.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-002.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-004.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-005.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-006.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-007.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-008.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-009.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-001.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-002.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-004.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-005.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-006.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-007.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-008.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-009.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-001.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-002.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-004.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-005.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-006.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-007.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-008.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-009.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-001.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-002.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-004.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-005.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-006.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-007.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-008.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-009.png");


	UnloadFile("cg/sys/title/title-sky/menu-window.png");
	UnloadFile("cg/sys/title/title-sky/synapse.png");
	UnloadFile("cg/sys/title/title-sky/Title-back.png");
	UnloadFile("cg/sys/title/title-sky/Title-caution-000.png");
	UnloadFile("cg/sys/title/title-sky/Title-caution-001.png");
	UnloadFile("cg/sys/title/title-sky/Title-caution-002.png");
	UnloadFile("cg/sys/title/title-sky/Title-caution-003.png");
	UnloadFile("cg/sys/title/title-sky/Title-config-000.png");
	UnloadFile("cg/sys/title/title-sky/Title-config-001.png");
	UnloadFile("cg/sys/title/title-sky/Title-config-002.png");
	UnloadFile("cg/sys/title/title-sky/Title-config-003.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-000.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-001.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-001a.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-001b.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-002.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-002a.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-002b.png");
	UnloadFile("cg/sys/title/title-sky/Title-extra-000.png");
	UnloadFile("cg/sys/title/title-sky/Title-extra-001.png");
	UnloadFile("cg/sys/title/title-sky/Title-extra-002.png");
	UnloadFile("cg/sys/title/title-sky/Title-extra-003.png");
	UnloadFile("cg/sys/title/title-sky/Title-logo.png");
	UnloadFile("cg/sys/title/title-sky/Title-logo2.png");
	UnloadFile("cg/sys/title/title-sky/Title-start-000.png");
	UnloadFile("cg/sys/title/title-sky/Title-start-001.png");
	UnloadFile("cg/sys/title/title-sky/Title-start-002.png");
	UnloadFile("cg/sys/title/title-sky/Title-start-003.png");


	UnloadFile("cg/sys/title/title-sky/down-menu/000-チャプター選択表示時バー.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/001-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/001-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/001-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/002-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/002-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/002-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/003-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/003-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/003-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/004-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/004-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/004-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/005-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/005-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/005-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/006-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/006-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/006-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/007-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/007-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/007-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/008-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/008-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/008-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/009-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/009-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/009-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/010-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/010-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/010-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/011-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/011-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/011-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/012-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/012-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/012-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/013-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/013-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/013-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/014-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/014-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/014-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/015-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/015-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/015-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/016-チャプター001 .png");
	UnloadFile("cg/sys/title/title-sky/down-menu/016-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/016-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/017-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/017-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/017-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/018-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/018-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/018-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/CHAPTERLIST-001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/CHAPTERLIST-002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LASTSAVE-001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LASTSAVE-002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LASTSAVE-003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LOADGAME-001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LOADGAME-002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LOADGAME-003.png");

	UnloadFile("cg/sys/title/title-sky/title-anime/config-001.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-002.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-003.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-004.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-005.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-006.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-007.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-008.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-009.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-001.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-002.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-003.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-004.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-005.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-006.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-007.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-008.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-009.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-001.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-002.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-003.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-004.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-005.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-006.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-007.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-008.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-009.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-001.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-002.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-003.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-004.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-005.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-006.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-007.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-008.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-009.png");
}




function StartUnLoad_common()
{
	UnloadFile("cg/sys/title/debug002.png");
	UnloadFile("cg/sys/title/title.png");
	UnloadFile("cg/sys/title/title2.png");
}

function StartUnLoad_normal()
{
	UnloadFile("cg/sys/title/title-normal/menu-window.png");
	UnloadFile("cg/sys/title/title-normal/synapse.png");
	UnloadFile("cg/sys/title/title-normal/Title-back.png");
	UnloadFile("cg/sys/title/title-normal/Title-bluesky-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-bluesky-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-bluesky-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-bluesky-003.png");
	if(#DebugMode){
		UnloadFile("cg/sys/title/title-normal/Title-caution-000.png");
		UnloadFile("cg/sys/title/title-normal/Title-caution-001.png");
		UnloadFile("cg/sys/title/title-normal/Title-caution-002.png");
		UnloadFile("cg/sys/title/title-normal/Title-caution-003.png");
	}
	UnloadFile("cg/sys/title/title-normal/Title-config-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-config-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-config-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-config-003.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-001a.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-001b.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-002a.png");
	UnloadFile("cg/sys/title/title-normal/Title-continue-002b.png");
	UnloadFile("cg/sys/title/title-normal/Title-extra-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-extra-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-extra-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-extra-003.png");
	UnloadFile("cg/sys/title/title-normal/Title-logo.png");
	UnloadFile("cg/sys/title/title-normal/Title-logo2.png");
	UnloadFile("cg/sys/title/title-normal/Title-start-000.png");
	UnloadFile("cg/sys/title/title-normal/Title-start-001.png");
	UnloadFile("cg/sys/title/title-normal/Title-start-002.png");
	UnloadFile("cg/sys/title/title-normal/Title-start-003.png");


	UnloadFile("cg/sys/title/title-normal/down-menu/000-チャプター選択表示時バー.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/001-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/001-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/001-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/002-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/002-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/002-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/003-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/003-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/003-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/004-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/004-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/004-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/005-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/005-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/005-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/006-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/006-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/006-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/007-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/007-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/007-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/008-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/008-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/008-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/009-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/009-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/009-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/010-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/010-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/010-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/011-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/011-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/011-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/012-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/012-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/012-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/013-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/013-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/013-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/014-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/014-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/014-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/015-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/015-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/015-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/016-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/016-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/016-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/017-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/017-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/017-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/018-チャプター001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/018-チャプター002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/018-チャプター003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/CHAPTERLIST-001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/CHAPTERLIST-002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LASTSAVE-001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LASTSAVE-002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LASTSAVE-003.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LOADGAME-001.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LOADGAME-002.png");
	UnloadFile("cg/sys/title/title-normal/down-menu/LOADGAME-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-001.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-002.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-004.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-005.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-006.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-007.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-008.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/bluesky-009.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-001.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-002.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-004.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-005.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-006.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-007.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-008.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/config-009.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-001.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-002.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-004.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-005.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-006.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-007.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-008.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/extra-009.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-001.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-002.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-004.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-005.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-006.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-007.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-008.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/cont-009.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-001.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-002.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-003.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-004.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-005.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-006.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-007.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-008.png");
	UnloadFile("cg/sys/title/title-normal/title-anime/start-009.png");
}


function StartUnLoad_sky()
{
	UnloadFile("cg/sys/title/title-sky/menu-window.png");
	UnloadFile("cg/sys/title/title-sky/synapse.png");
	UnloadFile("cg/sys/title/title-sky/Title-back.png");
	if(#DebugMode){
		UnloadFile("cg/sys/title/title-sky/Title-caution-000.png");
		UnloadFile("cg/sys/title/title-sky/Title-caution-001.png");
		UnloadFile("cg/sys/title/title-sky/Title-caution-002.png");
		UnloadFile("cg/sys/title/title-sky/Title-caution-003.png");
	}
	UnloadFile("cg/sys/title/title-sky/Title-config-000.png");
	UnloadFile("cg/sys/title/title-sky/Title-config-001.png");
	UnloadFile("cg/sys/title/title-sky/Title-config-002.png");
	UnloadFile("cg/sys/title/title-sky/Title-config-003.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-000.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-001.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-001a.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-001b.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-002.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-002a.png");
	UnloadFile("cg/sys/title/title-sky/Title-continue-002b.png");
	UnloadFile("cg/sys/title/title-sky/Title-extra-000.png");
	UnloadFile("cg/sys/title/title-sky/Title-extra-001.png");
	UnloadFile("cg/sys/title/title-sky/Title-extra-002.png");
	UnloadFile("cg/sys/title/title-sky/Title-extra-003.png");
	UnloadFile("cg/sys/title/title-sky/Title-logo.png");
	UnloadFile("cg/sys/title/title-sky/Title-logo2.png");
	UnloadFile("cg/sys/title/title-sky/Title-start-000.png");
	UnloadFile("cg/sys/title/title-sky/Title-start-001.png");
	UnloadFile("cg/sys/title/title-sky/Title-start-002.png");
	UnloadFile("cg/sys/title/title-sky/Title-start-003.png");


	UnloadFile("cg/sys/title/title-sky/down-menu/000-チャプター選択表示時バー.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/001-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/001-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/001-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/002-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/002-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/002-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/003-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/003-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/003-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/004-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/004-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/004-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/005-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/005-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/005-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/006-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/006-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/006-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/007-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/007-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/007-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/008-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/008-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/008-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/009-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/009-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/009-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/010-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/010-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/010-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/011-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/011-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/011-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/012-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/012-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/012-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/013-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/013-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/013-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/014-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/014-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/014-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/015-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/015-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/015-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/016-チャプター001 .png");
	UnloadFile("cg/sys/title/title-sky/down-menu/016-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/016-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/017-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/017-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/017-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/018-チャプター001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/018-チャプター002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/018-チャプター003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/CHAPTERLIST-001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/CHAPTERLIST-002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LASTSAVE-001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LASTSAVE-002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LASTSAVE-003.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LOADGAME-001.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LOADGAME-002.png");
	UnloadFile("cg/sys/title/title-sky/down-menu/LOADGAME-003.png");

	UnloadFile("cg/sys/title/title-sky/title-anime/config-001.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-002.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-003.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-004.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-005.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-006.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-007.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-008.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/config-009.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-001.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-002.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-003.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-004.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-005.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-006.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-007.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-008.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/extra-009.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-001.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-002.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-003.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-004.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-005.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-006.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-007.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-008.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/cont-009.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-001.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-002.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-003.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-004.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-005.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-006.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-007.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-008.png");
	UnloadFile("cg/sys/title/title-sky/title-anime/start-009.png");
}



function MenuLoad()
{
	//■メニュー１
	LoadFile("cg/sys/menu/Pull-down-R000.png",true);
	LoadFile("cg/sys/menu/Pull-down-R001-A.png",true);
	LoadFile("cg/sys/menu/Pull-down-R001-B.png",true);
	LoadFile("cg/sys/menu/Pull-down-R001-C.png",true);
	LoadFile("cg/sys/menu/Pull-down-R001-D.png",true);
	LoadFile("cg/sys/menu/Pull-down-R002-A.png",true);
	LoadFile("cg/sys/menu/Pull-down-R002-B.png",true);
	LoadFile("cg/sys/menu/Pull-down-R002-C.png",true);
	LoadFile("cg/sys/menu/Pull-down-R002-D.png",true);
	LoadFile("cg/sys/menu/Pull-down-R003-A.png",true);
	LoadFile("cg/sys/menu/Pull-down-R003-B.png",true);
	LoadFile("cg/sys/menu/Pull-down-R003-C.png",true);
	LoadFile("cg/sys/menu/Pull-down-R003-D.png",true);
	LoadFile("cg/sys/menu/Pull-down-R004-A.png",true);
	LoadFile("cg/sys/menu/Pull-down-R004-B.png",true);
	LoadFile("cg/sys/menu/Pull-down-R004-C.png",true);
	LoadFile("cg/sys/menu/Pull-down-R004-D.png",true);
	LoadFile("cg/sys/menu/Pull-down-R005-A.png",true);
	LoadFile("cg/sys/menu/Pull-down-R005-B.png",true);
	LoadFile("cg/sys/menu/Pull-down-R005-C.png",true);
	LoadFile("cg/sys/menu/Pull-down-R005-D.png",true);

	//■メニュー２
	LoadFile("cg/sys/menu/Pull-down-L000.png",true);
	LoadFile("cg/sys/menu/Pull-down-L001-A.png",true);
	LoadFile("cg/sys/menu/Pull-down-L001-B.png",true);
	LoadFile("cg/sys/menu/Pull-down-L001-C.png",true);
	LoadFile("cg/sys/menu/Pull-down-L001-D.png",true);
	LoadFile("cg/sys/menu/Pull-down-L002-A.png",true);
	LoadFile("cg/sys/menu/Pull-down-L002-B.png",true);
	LoadFile("cg/sys/menu/Pull-down-L002-C.png",true);
	LoadFile("cg/sys/menu/Pull-down-L002-D.png",true);
	LoadFile("cg/sys/menu/Pull-down-L003-A.png",true);
	LoadFile("cg/sys/menu/Pull-down-L003-B.png",true);
	LoadFile("cg/sys/menu/Pull-down-L003-C.png",true);
	LoadFile("cg/sys/menu/Pull-down-L003-D.png",true);
	LoadFile("cg/sys/menu/Pull-down-L004-A.png",true);
	LoadFile("cg/sys/menu/Pull-down-L004-B.png",true);
	LoadFile("cg/sys/menu/Pull-down-L004-C.png",true);
	LoadFile("cg/sys/menu/Pull-down-L004-D.png",true);
	LoadFile("cg/sys/menu/Pull-down-L005-A.png",true);
	LoadFile("cg/sys/menu/Pull-down-L005-B.png",true);
	LoadFile("cg/sys/menu/Pull-down-L005-C.png",true);
	LoadFile("cg/sys/menu/Pull-down-L005-D.png",true);
}


function DialogLoad()
{
	//■ダイアログ
	LoadFile("cg/sys/dialog/no-001.png",true);
	LoadFile("cg/sys/dialog/no-002.png",true);
	LoadFile("cg/sys/dialog/yes-001.png",true);
	LoadFile("cg/sys/dialog/yes-002.png",true);
	LoadFile("cg/sys/dialog/ダイアログkeep-out.png",true);
	LoadFile("cg/sys/dialog/ダイアログ台座.png",true);
	LoadFile("cg/sys/dialog/ダイアログ台座2.png",true);

	//■妄想トリガー用
	LoadFile("cg/data/right.png",true);
	LoadFile("cg/data/left.png",true);

	//■よく読み込むスクリプト
	LoadFile("nss/sys_menu.nss",true);
	LoadFile("nss/sys_backlog.nss",true);
	LoadFile("nss/extra_tips.nss",true);
	LoadFile("nss/sys_signout.nss",true);
	LoadFile("nss/sys_reset.nss",true);
	LoadFile("nss/sys_loststorage.nss",true);
	LoadFile("nss/sys_load.nss",true);
	LoadFile("nss/sys_config.nss",true);
	LoadFile("nss/function_system.nss",true);
	LoadFile("nss/function_title.nss",true);
	LoadFile("nss/function_stand.nss",true);
	LoadFile("nss/function_select.nss",true);
	LoadFile("nss/function_mmo.nss",true);
	LoadFile("nss/function_karte.nss",true);
	LoadFile("nss/function_Dos.nss",true);
	LoadFile("nss/function_chat.nss",true);
	LoadFile("nss/function_board.nss",true);
	LoadFile("nss/function.nss",true);
}



function MenuUnLoad()
{
	//■メニュー１
	UnloadFile("cg/sys/menu/Pull-down-R000.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R001-A.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R001-B.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R001-C.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R001-D.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R002-A.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R002-B.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R002-C.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R002-D.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R003-A.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R003-B.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R003-C.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R003-D.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R004-A.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R004-B.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R004-C.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R004-D.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R005-A.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R005-B.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R005-C.png",true);
	UnloadFile("cg/sys/menu/Pull-down-R005-D.png",true);

	//■メニュー２
	UnloadFile("cg/sys/menu/Pull-down-L000.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L001-A.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L001-B.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L001-C.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L001-D.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L002-A.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L002-B.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L002-C.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L002-D.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L003-A.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L003-B.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L003-C.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L003-D.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L004-A.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L004-B.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L004-C.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L004-D.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L005-A.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L005-B.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L005-C.png",true);
	UnloadFile("cg/sys/menu/Pull-down-L005-D.png",true);
}


function DialogUnLoad()
{
	//■ダイアログ
	UnloadFile("cg/sys/dialog/no-001.png",true);
	UnloadFile("cg/sys/dialog/no-002.png",true);
	UnloadFile("cg/sys/dialog/yes-001.png",true);
	UnloadFile("cg/sys/dialog/yes-002.png",true);
	UnloadFile("cg/sys/dialog/ダイアログkeep-out.png",true);
	UnloadFile("cg/sys/dialog/ダイアログ台座.png",true);
	UnloadFile("cg/sys/dialog/ダイアログ台座2.png",true);
}



//=============================================================================//
.//その目だれの目？
//=============================================================================//
function Eyes()
{
	if($１章エンドフラグ① == 1){#EndFlag1=true;}
	if($１章エンドフラグ② == 1){#EndFlag2=true;}
	if($２章エンドフラグ① == 1){#EndFlag3=true;}
	if($２章エンドフラグ② == 1){#EndFlag4=true;}
	if($３章エンドフラグ① == 1){#EndFlag5=true;}
	if($３章エンドフラグ② == 1){#EndFlag6=true;}
	if($４章エンドフラグ① == 1){#EndFlag7=true;}
	if($４章エンドフラグ② == 1){#EndFlag8=true;}
	if($５章エンドフラグ① == 1){#EndFlag9=true;}
	if($５章エンドフラグ② == 1){#EndFlag10=true;}
	if($６章エンドフラグ① == 1){#EndFlag11=true;}
	if($６章エンドフラグ② == 1){#EndFlag12=true;}
	if($７章エンドフラグ① == 1){#EndFlag13=true;}
	if($７章エンドフラグ② == 1){#EndFlag14=true;}
	if($８章エンドフラグ① == 1){#EndFlag15=true;}
	if($８章エンドフラグ② == 1){#EndFlag16=true;}
	if($９章エンドフラグ① == 1){#EndFlag17=true;}
	if($９章エンドフラグ② == 1){#EndFlag18=true;}

	if(#EndFlag1&&#EndFlag2&&#EndFlag3&&#EndFlag4&&#EndFlag5&&#EndFlag6&&#EndFlag7&&#EndFlag8&&#EndFlag9&&#EndFlag10&&#EndFlag11&&#EndFlag12&&#EndFlag13&&#EndFlag14&&#EndFlag15&&#EndFlag16&&#EndFlag17&&#EndFlag18){
		//○実績No.28：その目だれの目？
		XBOX360_Achieved(28);
	}
}

//=============================================================================//
.//ポジティブ人間
//=============================================================================//
function PositiveHuman()
{
	if($妄想トリガー１ == 2){#TriggerFlag_P1=true;}
	if($妄想トリガー２ == 2){#TriggerFlag_P2=true;}
	if($妄想トリガー３ == 2){#TriggerFlag_P3=true;}
	if($妄想トリガー４ == 2){#TriggerFlag_P4=true;}
	if($妄想トリガー５ == 2){#TriggerFlag_P5=true;}
	if($妄想トリガー６ == 2){#TriggerFlag_P6=true;}
	if($妄想トリガー７ == 2){#TriggerFlag_P7=true;}
	if($妄想トリガー８ == 2){#TriggerFlag_P8=true;}
	if($妄想トリガー９ == 2){#TriggerFlag_P9=true;}
	if($妄想トリガー１０ == 2){#TriggerFlag_P10=true;}
	if($妄想トリガー１１ == 2){#TriggerFlag_P11=true;}
	if($妄想トリガー１２ == 2){#TriggerFlag_P12=true;}
	if($妄想トリガー１２Ａ == 2){#TriggerFlag_P12a=true;}
	if($妄想トリガー１３ == 2){#TriggerFlag_P13=true;}
	if($妄想トリガー１４ == 2){#TriggerFlag_P14=true;}
	if($妄想トリガー１５ == 2){#TriggerFlag_P15=true;}
	if($妄想トリガー１６ == 2){#TriggerFlag_P16=true;}
	if($妄想トリガー１７ == 2){#TriggerFlag_P17=true;}
	if($妄想トリガー１８ == 2){#TriggerFlag_P18=true;}
	if($妄想トリガー１９ == 2){#TriggerFlag_P19=true;}
	if($妄想トリガー２０ == 2){#TriggerFlag_P20=true;}
	if($妄想トリガー２１ == 2){#TriggerFlag_P21=true;}
	if($妄想トリガー２２ == 2){#TriggerFlag_P22=true;}
	if($妄想トリガー２３ == 2){#TriggerFlag_P23=true;}
	if($妄想トリガー２４ == 2){#TriggerFlag_P24=true;}
	if($妄想トリガー２５ == 2){#TriggerFlag_P25=true;}
	if($妄想トリガー２６ == 2){#TriggerFlag_P26=true;}
	if($妄想トリガー２７ == 2){#TriggerFlag_P27=true;}
	if($妄想トリガー２８ == 2){#TriggerFlag_P28=true;}
	if($妄想トリガー２９ == 2){#TriggerFlag_P29=true;}
	if($妄想トリガー３０ == 2){#TriggerFlag_P30=true;}
	if($妄想トリガー３１ == 2){#TriggerFlag_P31=true;}
	if($妄想トリガー３２ == 2){#TriggerFlag_P32=true;}
	if($妄想トリガー３３ == 2){#TriggerFlag_P33=true;}
	if($妄想トリガー３４ == 2){#TriggerFlag_P34=true;}
	if($妄想トリガー３５ == 2){#TriggerFlag_P35=true;}
	if($妄想トリガー３６ == 2){#TriggerFlag_P36=true;}
	if($妄想トリガー３７ == 2){#TriggerFlag_P37=true;}
	if($妄想トリガー３８ == 2){#TriggerFlag_P38=true;}
	if($妄想トリガー３９ == 2){#TriggerFlag_P39=true;}
	if($妄想トリガー４０ == 2){#TriggerFlag_P40=true;}
	if($妄想トリガー４１ == 2){#TriggerFlag_P41=true;}
	if($妄想トリガー４２ == 2){#TriggerFlag_P42=true;}
	if($妄想トリガー４３ == 2){#TriggerFlag_P43=true;}
	if($妄想トリガー４４ == 2){#TriggerFlag_P44=true;}

	if(#TriggerFlag_P1&&#TriggerFlag_P2&&#TriggerFlag_P3&&#TriggerFlag_P4&&#TriggerFlag_P5&&#TriggerFlag_P6&&#TriggerFlag_P7&&#TriggerFlag_P8&&#TriggerFlag_P9&&#TriggerFlag_P10&&#TriggerFlag_P11&&#TriggerFlag_P12&&#TriggerFlag_P12a&&#TriggerFlag_P13&&#TriggerFlag_P14&&#TriggerFlag_P15&&#TriggerFlag_P16&&#TriggerFlag_P17&&#TriggerFlag_P18&&#TriggerFlag_P19&&#TriggerFlag_P20&&#TriggerFlag_P21&&#TriggerFlag_P22&&#TriggerFlag_P23&&#TriggerFlag_P24&&#TriggerFlag_P25&&#TriggerFlag_P26&&#TriggerFlag_P27&&#TriggerFlag_P28&&#TriggerFlag_P29&&#TriggerFlag_P30&&#TriggerFlag_P31&&#TriggerFlag_P32&&#TriggerFlag_P33&&#TriggerFlag_P34&&#TriggerFlag_P35&&#TriggerFlag_P36&&#TriggerFlag_P37&&#TriggerFlag_P38&&#TriggerFlag_P39&&#TriggerFlag_P40&&#TriggerFlag_P41&&#TriggerFlag_P42&&#TriggerFlag_P43&&#TriggerFlag_P44){
		//○実績No.29：ポジティブ人間
		XBOX360_Achieved(29);
	}
}


//=============================================================================//
.//ポジティブ人間
//=============================================================================//
function NegativeHuman()
{
	if($妄想トリガー１ == 1){#TriggerFlag_N1=true;}
	if($妄想トリガー２ == 1){#TriggerFlag_N2=true;}
	if($妄想トリガー３ == 1){#TriggerFlag_N3=true;}
	if($妄想トリガー４ == 1){#TriggerFlag_N4=true;}
	if($妄想トリガー５ == 1){#TriggerFlag_N5=true;}
	if($妄想トリガー６ == 1){#TriggerFlag_N6=true;}
	if($妄想トリガー７ == 1){#TriggerFlag_N7=true;}
	if($妄想トリガー８ == 1){#TriggerFlag_N8=true;}
	if($妄想トリガー９ == 1){#TriggerFlag_N9=true;}
	if($妄想トリガー１０ == 1){#TriggerFlag_N10=true;}
	if($妄想トリガー１１ == 1){#TriggerFlag_N11=true;}
	if($妄想トリガー１２ == 1){#TriggerFlag_N12=true;}
	if($妄想トリガー１２Ａ == 1){#TriggerFlag_N12a=true;}
	if($妄想トリガー１３ == 1){#TriggerFlag_N13=true;}
	if($妄想トリガー１４ == 1){#TriggerFlag_N14=true;}
	if($妄想トリガー１５ == 1){#TriggerFlag_N15=true;}
	if($妄想トリガー１６ == 1){#TriggerFlag_N16=true;}
	if($妄想トリガー１７ == 1){#TriggerFlag_N17=true;}
	if($妄想トリガー１８ == 1){#TriggerFlag_N18=true;}
	if($妄想トリガー１９ == 1){#TriggerFlag_N19=true;}
	if($妄想トリガー２０ == 1){#TriggerFlag_N20=true;}
	if($妄想トリガー２１ == 1){#TriggerFlag_N21=true;}
	if($妄想トリガー２２ == 1){#TriggerFlag_N22=true;}
	if($妄想トリガー２３ == 1){#TriggerFlag_N23=true;}
	if($妄想トリガー２４ == 1){#TriggerFlag_N24=true;}
	if($妄想トリガー２５ == 1){#TriggerFlag_N25=true;}
	if($妄想トリガー２６ == 1){#TriggerFlag_N26=true;}
	if($妄想トリガー２７ == 1){#TriggerFlag_N27=true;}
	if($妄想トリガー２８ == 1){#TriggerFlag_N28=true;}
	if($妄想トリガー２９ == 1){#TriggerFlag_N29=true;}
	if($妄想トリガー３０ == 1){#TriggerFlag_N30=true;}
	if($妄想トリガー３１ == 1){#TriggerFlag_N31=true;}
	if($妄想トリガー３２ == 1){#TriggerFlag_N32=true;}
	if($妄想トリガー３３ == 1){#TriggerFlag_N33=true;}
	if($妄想トリガー３４ == 1){#TriggerFlag_N34=true;}
	if($妄想トリガー３５ == 1){#TriggerFlag_N35=true;}
	if($妄想トリガー３６ == 1){#TriggerFlag_N36=true;}
	if($妄想トリガー３７ == 1){#TriggerFlag_N37=true;}
	if($妄想トリガー３８ == 1){#TriggerFlag_N38=true;}
	if($妄想トリガー３９ == 1){#TriggerFlag_N39=true;}
	if($妄想トリガー４０ == 1){#TriggerFlag_N40=true;}
	if($妄想トリガー４１ == 1){#TriggerFlag_N41=true;}
	if($妄想トリガー４２ == 1){#TriggerFlag_N42=true;}
	if($妄想トリガー４３ == 1){#TriggerFlag_N43=true;}
	if($妄想トリガー４４ == 1){#TriggerFlag_N44=true;}

	if(#TriggerFlag_N1&&#TriggerFlag_N2&&#TriggerFlag_N3&&#TriggerFlag_N4&&#TriggerFlag_N5&&#TriggerFlag_N6&&#TriggerFlag_N7&&#TriggerFlag_N8&&#TriggerFlag_N9&&#TriggerFlag_N10&&#TriggerFlag_N11&&#TriggerFlag_N12&&#TriggerFlag_N12a&&#TriggerFlag_N13&&#TriggerFlag_N14&&#TriggerFlag_N15&&#TriggerFlag_N16&&#TriggerFlag_N17&&#TriggerFlag_N18&&#TriggerFlag_N19&&#TriggerFlag_N20&&#TriggerFlag_N21&&#TriggerFlag_N22&&#TriggerFlag_N23&&#TriggerFlag_N24&&#TriggerFlag_N25&&#TriggerFlag_N26&&#TriggerFlag_N27&&#TriggerFlag_N28&&#TriggerFlag_N29&&#TriggerFlag_N30&&#TriggerFlag_N31&&#TriggerFlag_N32&&#TriggerFlag_N33&&#TriggerFlag_N34&&#TriggerFlag_N35&&#TriggerFlag_N36&&#TriggerFlag_N37&&#TriggerFlag_N38&&#TriggerFlag_N39&&#TriggerFlag_N40&&#TriggerFlag_N41&&#TriggerFlag_N42&&#TriggerFlag_N43&&#TriggerFlag_N44){
		//○実績No.30：ネガティブ人間
		XBOX360_Achieved(30);
	}
}


//=============================================================================//
.//移動系マクロ
//=============================================================================//

//■移動系マクロ
function FadeFF4("ナット名",描画時間,透過度,t,$x,$y,テンポ, 待ち)
{
	$X1 = - $x;
	$X36 = ($X1 / 36) * 1 + 5;
	$X35 = ($X1 / 36) * 2 + - 10;
	$X34 = ($X1 / 36) * 3 + - 10;
	$X33 = ($X1 / 36) * 4 + 5;
	$X32 = ($X1 / 36) * 5 + - 10;
	$X31 = ($X1 / 36) * 6 + - 10;
	$X30 = ($X1 / 36) * 7 + - 10;
	$X29 = ($X1 / 36) * 8 + 5;
	$X28 = ($X1 / 36) * 9 + 0;
	$X27 = ($X1 / 36) * 10 + 5;
	$X26 = ($X1 / 36) * 11 + 10;
	$X25 = ($X1 / 36) * 12 + 15;
	$X24 = ($X1 / 36) * 13 + 10;
	$X23 = ($X1 / 36) * 14 + 5;
	$X22 = ($X1 / 36) * 15 + 0;
	$X21 = ($X1 / 36) * 16 + - 5;
	$X20 = ($X1 / 36) * 17 + 5;
	$X19 = ($X1 / 36) * 18;
	$X18 = ($X1 / 36) * 19 + 5;
	$X17 = ($X1 / 36) * 20 + - 10;
	$X16 = ($X1 / 36) * 21 + - 10;
	$X15 = ($X1 / 36) * 22 + 5;
	$X14 = ($X1 / 36) * 23 + - 10;
	$X13 = ($X1 / 36) * 24 + - 10;
	$X12 = ($X1 / 36) * 25 + - 10;
	$X11 = ($X1 / 36) * 26 + 5;
	$X10 = ($X1 / 36) * 27 + 0;
	$X9 = ($X1 / 36) * 28 + 5;
	$X8 = ($X1 / 36) * 29 + 10;
	$X7 = ($X1 / 36) * 30 + 15;
	$X6 = ($X1 / 36) * 31 + 10;
	$X5 = ($X1 / 36) * 32 + 5;
	$X4 = ($X1 / 36) * 33 + 0;
	$X3 = ($X1 / 36) * 34 + - 5;
	$X2 = ($X1 / 36) * 35 + 5;


	$Y1 = - $y;
	$Y36 = ($Y1 / 36) * 1 + - 10;
	$Y35 = ($Y1 / 36) * 2 + 10;
	$Y34 = ($Y1 / 36) * 3 + -5;
	$Y33 = ($Y1 / 36) * 4 + -10;
	$Y32 = ($Y1 / 36) * 5 + 5;
	$Y31 = ($Y1 / 36) * 6 + 0;
	$Y30 = ($Y1 / 36) * 7 + 10;
	$Y29 = ($Y1 / 36) * 8 + -10;
	$Y28 = ($Y1 / 36) * 9 + 0;
	$Y27 = ($Y1 / 36) * 10 + -15;
	$Y26 = ($Y1 / 36) * 11 + -10;
	$Y25 = ($Y1 / 36) * 12 + -5;
	$Y24 = ($Y1 / 36) * 13 + 0;
	$Y23 = ($Y1 / 36) * 14 + 5;
	$Y22 = ($Y1 / 36) * 15 + 10;
	$Y21 = ($Y1 / 36) * 16 + 15;
	$Y20 = ($Y1 / 36) * 17 + 5;
	$Y19 = ($Y1 / 36) * 18;
	$Y18 = ($Y1 / 36) * 19 + - 10;
	$Y17 = ($Y1 / 36) * 20 + 10;
	$Y16 = ($Y1 / 36) * 21 + -5;
	$Y15 = ($Y1 / 36) * 22 + -10;
	$Y14 = ($Y1 / 36) * 23 + 5;
	$Y13 = ($Y1 / 36) * 24 + 0;
	$Y12 = ($Y1 / 36) * 25 + 10;
	$Y11 = ($Y1 / 36) * 26 + -10;
	$Y10 = ($Y1 / 36) * 27 + 0;
	$Y9 = ($Y1 / 36) * 28 + -15;
	$Y8 = ($Y1 / 36) * 29 + -10;
	$Y7 = ($Y1 / 36) * 30 + -5;
	$Y6 = ($Y1 / 36) * 31 + 0;
	$Y5 = ($Y1 / 36) * 32 + 5;
	$Y4 = ($Y1 / 36) * 33 + 10;
	$Y3 = ($Y1 / 36) * 34 + 15;
	$Y2 = ($Y1 / 36) * 35 + 5;

	Fade("ナット名",描画時間,透過度,null,false);
	BezierMove("ナット名", t, (@$X1,@$Y1){@$X2,@$Y2}{@$X3,@$Y3}(@$X4,@$Y4){@$X5,@$Y5}{@$X6,@$Y6}(@$X7,@$Y7){@$X8,@$Y8}{@$X9,@$Y9}(@$X10,@$Y10){@$X11,@$Y11}{@$X12,@$Y12}(@$X13,@$Y13){@$X14,@$Y14}{@$X15,@$Y15}(@$X16,@$Y16){@$X17,@$Y17}{@$X18,@$Y18}(@$X19,@$Y19){@$X20,@$Y20}{@$X21,@$Y21}(@$X22,@$Y22){@$X23,@$Y23}{@$X24,@$Y24}(@$X25,@$Y25){@$X26,@$Y26}{@$X27,@$Y27}(@$X28,@$Y28){@$X29,@$Y29}{@$X30,@$Y30}(@$X31,@$Y31){@$X32,@$Y32}{@$X33,@$Y33}(@$X34,@$Y34){@$X35,@$Y35}{@$X36,@$Y36}(@0,@0), テンポ, 待ち);

}

function FadePC8("ナット名",描画時間,透過度,t,$x,$y,テンポ, 待ち)
{
	$X1 = $x;
	$Y1 = $y;
	$X2 = - $x / 2;
	$Y2 = - $y / 2;
	$X3 = $x / 3;
	$Y3 = $y / 3;
	$X4 = - $x / 4;
	$Y4 = - $y / 4;
	$X5 = $x / 5;
	$Y5 = $y / 5;
	$X6 = - $x / 6;
	$Y6 = - $y / 6;
	$X7 = $x / 7;
	$Y7 = $y / 7;
	$X8 = - $x / 8;
	$Y8 = - $y / 8;

	Fade("ナット名",描画時間,透過度,null,false);
	BezierMove("ナット名", t, (@0,@0){@$X1,@$Y1}{@$X1,@$Y1}(@0,@0){@$X2,@$Y2}{@$X2,@$Y2}(@0,@0){@$X3,@$Y3}{@$X3,@$Y3}(@0,@0){@$X4,@$Y4}{@$X4,@$Y4}(@0,@0){@$X5,@$Y5}{@$X5,@$Y5}(@0,@0){@$X6,@$Y6}{@$X6,@$Y6}(@0,@0){@$X7,@$Y7}{@$X7,@$Y7}(@0,@0){@$X8,@$Y8}{@$X8,@$Y8}(@0,@0), テンポ, 待ち);
}






//=============================================================================//
.//ギャラリデバッグ
//=============================================================================//
function DebugGallery()
{
	#bg119_01_3_監視カメラ映像_a=true;
	#bg136_01_1_希ＶＩＰルーム_a=true;
	#bg136_02_1_希ＶＩＰルーム_a=true;
	#bg136_03_1_chn希ＶＩＰルーム_a=true;
	#ev001_01_1_INT01近づく梨深_a=true;
	#ev005_01_3_杭貼付け_a=true;
	#ev006_01_3_グロ画像_a=true;
	#ev006_02_3_グロ画像_a=true;
	#ev007_01_3_十字架杭拓巳_a=true;
	#ev007_02_6_十字架杭拓巳_a=true;
	#ev008_01_4_INT02あやせ歌う_a=true;
	#ev009_01_4_腕掴みミイラ_a=true;
	#ev010_01_4_腕掴み梨深_a=true;
	#ev012_01_1_星来横たわり_a=true;
	#ev013_01_1_拓巳笑い口UP_a=true;
	#ev013_02_1_拓巳笑い口UP_a=true;
	#ev013_03_1_拓巳笑い口UP_a=true;
	#ev014_01_1_スプー_a=true;
	#ev015_01_1_七海妄想エロ_a=true;
	#ev015_02_1_七海妄想エロ_a=true;
	#ev016_01_1_七海携帯萌_a=true;
	#ev017_01_2_尾道_a=true;
	#ev017_02_2_尾道_a=true;
	#ev018_01_3_優愛_a=true;
	#ev019_01_3_優愛妄想_a=true;
	#ev019_02_3_優愛妄想_a=true;
	#ev020_01_3_優愛足下_a=true;
	#ev021_01_3_十字架杭優愛_a=true;
	#ev022_01_1_星来キス妄想_a=true;
	#ev023_01_3_INT06優愛寝転がる_a=true;
	#ev024_01_3_あやせライブシーン_a=true;
	#ev025_01_3_あやせ脱ぎ妄想_a=true;
	#ev026_01_2_七海ハンバーガー_a=true;
	#ev026_02_2_七海ハンバーガー_a=true;
	#ev027_01_3_見下ろしセナ_a=true;
	#ev028_01_0_あやせライブ三住切る_a=true;
	#ev029_01_2_梨深ソファ腰掛け_a=true;
	#ev030_01_2_七海バングル_a=true;
	#ev031_01_0_梢転校_a=true;
	#ev032_01_3_梨深だきしめ_a=true;
	#ev033_01_1_INT12セナ会話意識集中_a=true;
	#ev034_01_6_梨深と将軍の出会い_a=true;
	#ev035_01_0_梢コケる_a=true;
	#ev036_01_2_セナ白い鎖_a=true;
	#ev036_02_2_セナ白い鎖_a=true;
	#ev037_01_3_INT13優愛自室でメール書く_a=true;
	#ev038_01_3_優愛ROOM37乱入_a=true;
	#ev039_01_3_あやせ白下着_a=true;
	#ev039_02_3_あやせ白下着_a=true;
	#ev040_01_3_あやせディソード出す_a=true;
	#ev040_02_3_あやせディソード出す_a=true;
	#ev041_01_2_優愛教室ドアから見ている_a=true;
	#ev042_01_2_梨深に介抱される_a=true;
	#ev042_02_2_梨深に介抱される_a=true;
	#ev043_01_2_梨深CD貸してくれたら_a=true;
	#ev044_01_2_梨深下着Yシャツ_a=true;
	#ev044_02_2_梨深下着Yシャツ_a=true;
	#ev044_03_2_梨深下着Yシャツ_a=true;
	#ev045_01_3_INT16セナ機械破壊_a=true;
	#ev050_01_1_受診小学生拓巳_a=true;
	#ev052_01_3_将軍車椅子_a=true;
	#ev052_02_3_将軍車椅子_a=true;
	#ev054_01_3_刑事二人_a=true;
	#ev055_01_1_刑事と探偵会話_a=true;
	#ev056_01_1_9歳七海拓巳に食事_a=true;
	#ev056_01_1_優愛へたりこみ電話_a=true;
	#ev056_02_1_優愛へたりこみ電話_a=true;
	#ev057_01_1_拓巳子供時代_a=true;
	#ev057_01_3_Q－FrontTVモニター_a=true;
	#ev059_01_6_あやせ拷問_a=true;
	#ev060_01_3_セナコンテナ登場_a=true;
	#ev060_02_3_セナコンテナ登場_a=true;
	#ev062_01_1_プリクラ_a=true;
	#ev062_02_1_プリクラ_a=true;
	#ev063_01_1_マジックミラー波多野_a=true;
	#ev063_02_1_マジックミラー波多野_a=true;
	#ev064_01_1_あやせ飛び降りようと_a=true;
	#ev065_01_1_あやせ投身_a=true;
	#ev065_02_1_あやせ投身_a=true;
	#ev066_01_1_あやせ花壇落ち_a=true;
	#ev067_01_6_血溜り七海_a=true;
	#ev068_01_1_七海廊下後姿_a=true;
	#ev069_01_1_七海廊下後姿髪かきあげ_a=true;
	#ev070_01_2_将軍と梨深in病院_a=true;
	#ev070_02_2_将軍と梨深in病院_a=true;
	#ev071_01_1_梢ディソード顕現_a=true;
	#ev071_02_2_梢ディソード顕現_a=true;
	#ev072_01_1_梢と波多野Roft前_a=true;
	#ev073_01_1_赤子を抱く母_a=true;
	#ev076_01_4_美愛くま抱き_a=true;
	#ev077_01_3_野呂瀬社長室_a=true;
	#ev078_01_3_葉月ナースめがね_a=true;
	#ev078_02_3_葉月ナースめがね_a=true;
	#ev079_01_3_梨深セナ対決_a=true;
	#ev080_01_1_梨深七海ハイタッチ_a=true;
	#ev081_01_3_判死_a=true;
	#ev082_01_3_七海ゾンビ_a=true;
	#ev083_01_3_優愛ディソード_a=true;
	#ev084_01_3_ノアII_a=true;
	#ev085_01_3_七海ディソード_a=true;
	#ev086_01_6_梨深スポットライト膝抱え_a=true;
	#ev087_01_3_拓巳ディソード_a=true;
	#ev087_02_3_拓巳ディソード_a=true;
	#ev088_01_4_葉月救いあれ_a=true;
	#ev088_02_4_葉月救いあれ_a=true;
	#ev089_01_1_あやせ瓦礫下_a=true;
	#ev090_01_1_優愛瓦礫下_a=true;
	#ev091_01_1_七海と将軍_a=true;
	#ev092_01_1_拓巳振り返り_a=true;
	#ev092_02_1_拓巳振り返り_a=true;
	#ev092_03_1_拓巳振り返り_a=true;
	#ev093_01_1_セナ父殺し_a=true;
	#ev093_01_1_セナ父殺し_b=true;
	#ev094_01_1_セナ父首はね_a=true;
	#ev095_01_1_拓巳ダーツ逆転_a=true;
	#ev096_01_1_星来大群_a=true;
	#ev097_01_1_梨深はりつけ_a=true;
	#ev097_02_1_梨深はりつけ_a=true;
	#ev098_01_1_野呂瀬ディソード_a=true;
	#ev099_01_1_梨深レイプ_a=true;
	#ev100_06_1_６人祈る_a=true;
	#ev101_01_1_拓巳大蛇_a=true;
	#ev102_01_1_Ａエンド1_a=true;
	#ev103_01_1_Ａエンド2_a=true;
	#ev104_01_6_野呂瀬足_a=true;
	#ev105_01_1_拓巳光と消える_a=true;
	#ev105_02_1_拓巳光と消える_a=true;
	#ev106_01_1_剣交え_a=true;
	#ev107_01_1_梨深祈る_a=true;
	#ev108_02_1_串刺し_a=true;
	#ev110_01_3_セナ足_a=true;
	#ev111_01_6_野呂瀬ラスト_a=true;
	#ev112_01_3_梨深驚愕_a=true;
	#ev113_01_2_梨深VS梢_a=true;
	#ev114_01_6_梨深キス2_a=true;
	#ev114_02_6_梨深キス2_a=true;
	#ev115_01_6_梨深瀕死_a=true;
	#ev115_02_6_梨深瀕死_a=true;
	#ev115_03_6_梨深瀕死_a=true;
	#ev115_04_6_梨深瀕死_a=true;
	#ev116_01_6_梨深抱きつき_a=true;
	#ev117_01_6_梨深殺せない_a=true;
	#ev117_02_6_梨深殺せない_a=true;
	#ev118_01_6_セナ密着_a=true;
	#ev118_02_6_セナ密着_a=true;
	#ev118_03_6_セナ密着_a=true;
	#ev118_04_6_セナ密着_a=true;
	#ev118_05_6_セナ密着_a=true;
	#ev119_01_6_セナと赤ん坊_a=true;
	#ev119_02_6_セナと赤ん坊_a=true;
	#ev119_03_6_セナと赤ん坊_a=true;
	#ev120_01_6_ノアⅡ破壊_a=true;
	#ev120_02_6_ノアⅡ破壊_a=true;
	#ev121_01_1_セナキス_a=true;
	#ev122_01_1_セナ押し倒し_a=true;
	#ev123_01_6_優愛押し倒し_a=true;
	#ev124_01_6_優愛脱ぐ_a=true;
	#ev125_01_3_優愛すがりつき_a=true;
	#ev125_01_6_楠姉妹写真_a=true;
	#ev126_01_5_優愛空見上げ_a=true;
	#ev127_01_6_あやせキス_a=true;
	#ev128_01_6_あやせしがみつき_a=true;
	#ev128_02_6_あやせしがみつき_a=true;
	#ev129_01_6_あやせ投擲_a=true;
	#ev129_02_6_あやせ投擲_a=true;
	#ev130_01_6_あやせ空見上げ_a=true;
	#ev131_01_2_あやせ指なめ_a=true;
	#ev131_02_2_あやせ指なめ_a=true;
	#ev131_03_2_あやせ指なめ_a=true;
	#ev132_01_2_あやせ殺害_a=true;
	#ev132_01_2_あやせ殺害_b=true;
	#ev133_01_6_梢ほのぼの_a=true;
	#ev133_02_6_梢ほのぼの_a=true;
	#ev133_03_6_梢ほのぼの_a=true;
	#ev133_04_6_梢ほのぼの_a=true;
	#ev134_01_1_梢うずくまり_a=true;
	#ev134_02_1_梢うずくまり_a=true;
	#ev135_01_1_セナVS梢_a=true;
	#ev136_01_1_梢空見上げ_a=true;
	#ev136_02_1_梢空見上げ_a=true;
	#ev137_01_6_梢セナ空見上げ_a=true;
	#ev138_01_1_梢ちんすこう_a=true;
	#ev138_02_1_梢ちんすこう_a=true;
	#ev138_03_1_梢ちんすこう_a=true;
	#ev138_04_1_梢ちんすこう_a=true;
	#ev139_01_3_七海うずくまり_a=true;
	#ev139_02_3_七海うずくまり_a=true;
	#ev140_01_6_七海同衾_a=true;
	#ev140_02_6_七海同衾_a=true;
	#ev140_03_6_七海同衾_a=true;
	#ev141_01_1_七海キス_a=true;
	#ev143_01_3_拓巳覚醒_a=true;
	#ev143_02_3_拓巳覚醒_a=true;
	#ev143_03_3_拓巳覚醒_a=true;
	#ev144_01_1_拓巳ベッド_a=true;
	#ev801_01_1_七海来訪_a=true;
	#ev801_02_3_七海来訪_a=true;
	#ev802_01_1_七海コーラ死_a=true;
	#ev803_01_3_優愛遭遇_a=true;
	#ev999_01_1_おめでとう=true;
	#bg001_01_1_崩壊渋谷_a=true;
	#bg001_02_5_崩壊渋谷_a=true;
	#bg001_03_6_崩壊渋谷_a=true;
	#bg004_01_1_作文用紙その目_a=true;
	#bg006_01_1_コンテナ外観_a=true;
	#bg006_01_2_コンテナ外観_a=true;
	#bg006_01_3_コンテナ外観_a=true;
	#bg009_02_1_107_a=true;
	#bg009_02_2_107_a=true;
	#bg009_02_3_107_a=true;
	#bg009_03_5_107_a=true;
	#bg011_01_1_検索欄UP_a=true;
	#bg012_01_1_ニュースサイト_a=true;
	#bg012_02_1_ニュースサイト_a=true;
	#bg015_01_0_松濤公園_a=true;
	#bg015_01_2_松濤公園_a=true;
	#bg015_01_3_松濤公園_a=true;
	#bg022_01_0_黒板その目_a=true;
	#bg026_02_3_拓巳部屋_a=true;
	#bg027_01_3_道玄坂_a=true;
	#bg027_02_2_chn道玄坂_a=true;
	#bg027_04_3_道玄坂_a=true;
	#bg037_01_2_焼却炉中_a=true;
	#bg040_01_2_優愛カバン_a=true;
	#bg041_01_2_優愛カバンぶちまけ_a=true;
	#bg065_01_2_ゲロカエルン店店内_a=true;
	#bg083_01_1_宮下公園_a=true;
	#bg083_01_3_宮下公園_a=true;
	#bg083_02_3_宮下公園_a=true;
	#bg083_03_1_宮下公園_a=true;
	#bg085_04_3_スクランブル交差点_a=true;
	#bg117_01_3_PC画面ニュージェネ_a=true;
	#bg120_01_3_PC画面その目_a=true;
	#bg125_01_3_PC画面ファンタズム公式_a=true;
	#bg127_01_2_ギョロリゲロカエルん_a=true;
	#bg128_01_3_ネットオークション_a=true;
	#bg134_01_1_武器コーナー_a=true;
	#bg141_01_3_PC画面del検索結果_a=true;
	#bg142_01_3_ミュウツベ集団ダイブ_a=true;
	#bg143_01_1_生徒手帳_a=true;
	#bg144_01_1_生徒手帳その目_a=true;
	#bg147_01_2_ディソード想像_a=true;
	#bg147_02_6_ディソード想像_a=true;
	#bg151_01_1_デッドスポット_a=true;
	#bg152_01_1_AH会HP_a=true;
	#bg153_01_1_あやせの詩_a=true;
	#bg154_01_1_渋谷の白い空_a=true;
	#bg155_01_1_Ir2_a=true;
	#bg158_03_1_ニュース地震_a=true;
	#bg159_02_1_PC画面メールソフト_a=true;
	#bg160_01_3_ダンボール箱_a=true;
	#bg160_02_3_ダンボール箱_a=true;
	#bg160_03_3_chnダンボール箱_a=true;
	#bg165_01_3_OFRONT見上げ_a=true;
	#bg165_02_3_OFRONT見上げ_a=true;
	#bg165_03_3_OFRONT見上げ_a=true;
	#bg171_01_3_カルテその目_a=true;
	#bg180_01_1_アイスその目_a=true;
	#bg181_01_3_捨てられたギョロリ_a=true;
	#bg182_01_3_手描きのクマの絵_a=true;
	#bg183_01_3_PC画面ZACO‐DQN_a=true;
	#bg183_02_3_PC画面ZACO‐DQN_a=true;
	#bg185_01_1_あやせ下着_a=true;
	#bg186_01_1_たなびくタオル_a=true;
	#bg186_02_1_たなびくタオル_a=true;
	#bg197_01_3_渋谷駅東口とプラネタリウム_a=true;
	#bg200_01_6_ノアIIのあるドーム内_a=true;
	#bg202_01_1_希グループｗｅｂサイト_a=true;
	#bg203_01_1_ゲロカエルん偽通販サイト_a=true;
	#bg205_01_3_あやせディソードリアルブート_a=true;
	#bg211_01_5_黄色いバングル_a=true;
	#bg213_01_6_ニュースDQNパズル_a=true;
	#bg213_01_6_chn渋谷駅コインロッカー_a=true;
	#bg214_01_6_chn渋谷駅ロッカー閉じ_a=true;
	#bg214_02_6_chn渋谷駅ロッカー開き_a=true;
	#bg224_01_6_chnグラジオール文庫本_a=true;
	#bg234_01_6_chnビーズコレクション_a=true;
	#bg236_01_6_chn美愛の日記_a=true;
	#bg236_02_6_chn美愛の日記内容_a=true;
	#bg239_01_6_chnディソード全体_拓巳_a=true;
	#bg240_01_6_chnディソード全体_梨深_a=true;
	#bg241_01_6_chnディソード全体_七海_a=true;
	#bg242_01_6_chnディソード全体_あやせ_a=true;
	#bg243_01_6_chnディソード全体_セナ_a=true;
	#bg244_01_6_chnディソード全体_梢_a=true;
	#bg245_01_6_chnディソード全体_優愛_a=true;
	#ev046_01_1_妊娠男現場写真_a=true;
	#ev047_01_1_張り付け死体現場写真_a=true;
	#ev048_01_1_張り付けグロ絵アップ_a=true;
	#ev049_01_1_ヴァンパイ屋現場写真_a=true;
	#ev051_01_3_清掃員_a=true;
	#ev053_01_1_集団ダイブ現場写真_a=true;
	#ev061_01_2_ニュージェネ犯人逮捕TV_a=true;
	#ev074_01_1_洗脳部隊inモニター_a=true;
	#ev142_01_1_七海その目誰の目_a=true;
	#bg168_01_3_ダーススパイダーメット_a=true;
	#bg160_03_3_ダンボール箱_a=true;
}



//=============================================================================//
.//オールスタンディング
//=============================================================================//
function AYABE()
{
	//プレイ時間
	#ALL_PLAY_TIME=100000;

	//画像
	#ClearLast=true;
	#ClearG=true;
	#ClearAll=true;

	#ClearFinal=true;
	#ClearPieceR=true;
	#ClearPieceY=true;
	#ClearPieceS=true;
	#ClearPieceK=true;
	#ClearPieceN=true;
	#ClearPieceA=true;
	#ClearRouteB=true;
	#ClearRouteA=true;

	#EndFinal=true;
	#EndPieceR=true;
	#EndPieceY=true;
	#EndPieceS=true;
	#EndPieceK=true;
	#EndPieceN=true;
	#EndPieceA=true;
	#EndRouteB=true;
	#EndRouteA=true;

	#OpMovie=true;

	//その目だれの目
	#EndFlag1=true;
	#EndFlag2=true;
	#EndFlag3=true;
	#EndFlag4=true;
	#EndFlag5=true;
	#EndFlag6=true;
	#EndFlag7=true;
	#EndFlag8=true;
	#EndFlag9=true;
	#EndFlag10=true;
	#EndFlag11=true;
	#EndFlag12=true;
	#EndFlag13=true;
	#EndFlag14=true;
	#EndFlag15=true;
	#EndFlag16=true;
	#EndFlag17=true;
	#EndFlag18=true;

	//画像
	DebugGallery();

	//実績解除
	XBOX360_Achieved(1);
	XBOX360_Achieved(2);
	XBOX360_Achieved(3);
	XBOX360_Achieved(4);
	XBOX360_Achieved(5);
	XBOX360_Achieved(6);
	XBOX360_Achieved(7);
	XBOX360_Achieved(8);
	XBOX360_Achieved(9);
	XBOX360_Achieved(10);
	XBOX360_Achieved(11);
	XBOX360_Achieved(12);
	XBOX360_Achieved(13);
	XBOX360_Achieved(14);
	XBOX360_Achieved(15);
	XBOX360_Achieved(16);
	XBOX360_Achieved(17);
	XBOX360_Achieved(18);
	XBOX360_Achieved(19);
	XBOX360_Achieved(20);
	XBOX360_Achieved(21);
	XBOX360_Achieved(22);
	XBOX360_Achieved(23);
	XBOX360_Achieved(24);
	XBOX360_Achieved(25);
	XBOX360_Achieved(26);
	XBOX360_Achieved(27);
	XBOX360_Achieved(28);
	XBOX360_Achieved(29);
	XBOX360_Achieved(30);
	XBOX360_Achieved(31);
	XBOX360_Achieved(32);
	XBOX360_Achieved(33);

	//TIPS
	#TIPS_ＭＭＯＲＰＧ=true;
	#TIPS_ＲＭＴ=true;
	#TIPS_ＳＮＳ=true;
	#TIPS_ＰＴＳＤ=true;
	#TIPS_デジャヴ／ジャメヴュ=true;
	#TIPS_アバター=true;
	#TIPS_予知=true;
	#TIPS_キャストオフ=true;
	#TIPS_星来オルジェル=true;
	#TIPS_パラディン=true;
	#TIPS_ギルド=true;
	#TIPS_中２病=true;
	#TIPS_寝オチ=true;
	#TIPS_ＲＯＭ=true;
	#TIPS_ＤＱＮ=true;
	#TIPS_厨=true;
	#TIPS_フルボッコ=true;
	#TIPS_リア充=true;
	#TIPS_死亡フラグ=true;
	#TIPS_ヤンデレ=true;
	#TIPS_空気嫁=true;
	#TIPS_ｋｔｋｒ=true;
	#TIPS_ハンドル名=true;
	#TIPS_うｐ=true;
	#TIPS_パンモロ=true;
	#TIPS_はいてない=true;
	#TIPS_リビドー=true;
	#TIPS_孔明の罠=true;
	#TIPS_ＧＪ=true;
	#TIPS_夢遊病=true;
	#TIPS_千里眼=true;
	#TIPS_ＤＩＤ=true;
	#TIPS_電磁波=true;
	#TIPS_コキュートス=true;
	#TIPS_黒ミサ=true;
	#TIPS_Ｗｉｋｉ=true;
	#TIPS_エクステ=true;
	#TIPS_目の錯覚=true;
	#TIPS_洗脳=true;
	#TIPS_祭り=true;
	#TIPS_儲=true;
	#TIPS_かまいたち現象=true;
	#TIPS_バイオリズム=true;
	#TIPS_劇場型犯罪=true;
	#TIPS_ツンデレ=true;
	#TIPS_ｋｗｓｋ=true;
	#TIPS_百合属性=true;
	#TIPS_神経パルス=true;
	#TIPS_ダウジング=true;
	#TIPS_超能力捜査官=true;
	#TIPS_万有引力=true;
	#TIPS_パンドラの箱=true;
	#TIPS_マグネタイト=true;
	#TIPS_インフォームド・コンセント=true;
	#TIPS_メンヘラ=true;
	#TIPS_転売厨=true;
	#TIPS_脳死=true;
	#TIPS_明和党=true;
	#TIPS_（ｒｙ=true;
	#TIPS_３００人委員会=true;
	#TIPS_沈黙の兵器=true;
	#TIPS_天成神光会=true;
	#TIPS_ドーパミン=true;
	#TIPS_マインドコントロール=true;
	#TIPS_パレイドリア=true;
	#TIPS_ディラックの海=true;
	#TIPS_負の物質=true;
	#TIPS_空孔理論=true;
	#TIPS_素粒子=true;
	#TIPS_対生成=true;
	#TIPS_ニューロン=true;
	#TIPS_シナプス=true;
	#TIPS_心神喪失=true;
	#TIPS_並行世界=true;
	#TIPS_ミレニアム７=true;
	#TIPS_基本相互作用=true;
	#TIPS_Ｅ＝ｍｃ＾２=true;
	#TIPS_ゾンビ=true;
	#TIPS_グラジオール記黙示録詩編=true;
	#TIPS_集団ストーカー=true;
	#TIPS_インプリンティング=true;
	#TIPS_メシア=true;
	#TIPS_永久機関=true;
	#TIPS_ｍｊｄ=true;
	#TIPS_ワクテカ=true;
	#TIPS_オタ芸=true;
	#TIPS_廃人プレイ=true;
	#TIPS_職人=true;
	#TIPS_日本語でおｋ=true;
	#TIPS_高杉=true;
	#TIPS_ゲーム脳=true;
	#TIPS_ペリカ=true;
	#TIPS_燃料投下=true;
	#TIPS_ＡＡ=true;
	#TIPS_オサレ=true;
	#TIPS_サーセン=true;

	#TIPS_ｗ = true;
	#TIPS_スク水 = true;
	#TIPS_オーバーニーソ = true;
	#TIPS_デフォ = true;
	#TIPS_属性 = true;
	#TIPS_漏れ = true;
	#TIPS_もちつけ = true;
	#TIPS_ガクブル = true;
	#TIPS_ノシ = true;
	#TIPS_ソース = true;
	#TIPS_ｕｚｅｅｅｅｅｅｅｅｅｅｅ！ = true;
	#TIPS_きんもーっ☆ = true;
	#TIPS_腐女子 = true;
	#TIPS_黒キャラ = true;
	#TIPS_ｏｒｚ = true;
	#TIPS_スネーク = true;
	#TIPS_香具師 = true;
	#TIPS_人大杉 = true;
	#TIPS_中の人 = true;
	#TIPS_釣り = true;
	#TIPS_ブラクラ = true;
	#TIPS_チート = true;
	#TIPS_霞の構え = true;
	#TIPS_ょぅι゛ょ = true;
	#TIPS_オフ会 = true;
	#TIPS_ゲシュタルト崩壊 = true;
	#TIPS_触手ゲー = true;
	#TIPS_ウォーターボーディング = true;
	#TIPS_安西先生 = true;
	#TIPS_コングロマリット = true;
	#TIPS_スニーキングミッション = true;
	#TIPS_ＮＰＣ = true;
	#TIPS_俺ＴＵＥＥＥプレイ = true;
	#TIPS_ネ申 = true;
	#TIPS_デバッガ = true;
	#TIPS_ＩＣカード = true;
	#TIPS_ストックホルム症候群 = true;
}