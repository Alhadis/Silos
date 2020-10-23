#include "nss/function.nss"
#include "nss/function_select.nss"

//============================================================================//
..//■ゲームモード判別■
//============================================================================//
chapter main
{

	if($GameStart != 1)
	{
		$GameName = 0;
		$GameContiune = 1;
		Reset();
	}

	call_scene @->SelectStoryMode;

}
//=============================================================================//



//============================================================================//
..//■ゲーム開始■
//============================================================================//

// ---------- 頭から ---------- //
//本番用初期化用フラグ
scene SelectStoryMode
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	if($GameName == 0){
		ClearScore(LOCAL);
		ClearBacklog();
	}else if($TitleSelect==5){
		ClearScore(LOCAL);
		ClearBacklog();
		$PreGameName="boot_第十章";
		$GameName="chz_212_青空編_pray";
		$ClearPreAll=true;
		$BlueSky=true;
	}else if($TitleSelect==4){
		ClearScore(LOCAL);
		ClearBacklog();
		if(#TitleChapterNum==1){
			$PreGameName="boot_第一章";
			$GameName="ch01_002_西條拓巳";
		}else if(#TitleChapterNum==2){
			$PreGameName="boot_第二章";
			$GameName="ch02_028_インターミッション０４";
		}else if(#TitleChapterNum==3){
			$PreGameName="boot_第三章";
			$GameName="ch03_047_インターミッション０７";
		}else if(#TitleChapterNum==4){
			$PreGameName="boot_第四章";
			$GameName="ch04_073_インターミッション１２";
		}else if(#TitleChapterNum==5){
			$PreGameName="boot_第五章";
			$GameName="ch05_094_１０月２２日水";
		}else if(#TitleChapterNum==6){
			$PreGameName="boot_第六章";
			$GameName="ch06_109_インターミッション２０";
		}else if(#TitleChapterNum==7){
			$PreGameName="boot_第七章";
			$GameName="ch07_129_インターミッション２７";
		}else if(#TitleChapterNum==8){
			$PreGameName="boot_第八章";
			$GameName="ch08_154_インターミッション３３";
		}else if(#TitleChapterNum==9){
			$PreGameName="boot_第九章";
			$GameName="ch09_177_インターミッション４２";
		}else if(#TitleChapterNum==10){
			$PreGameName="boot_第十章";
			$GameName="ch10_200_１１月７日金";
		}else if(#TitleChapterNum==11){
			$PreGameName="boot_第十章";
			$GameName="ch10_200_１１月７日金";
			$ChapterJump=true;
		}else if(#TitleChapterNum==12){
			$PreGameName="boot_梨深ルート";
			$GameName="chr_170_梨深編_インターミッションＲ１";
			$梨深ルート=true;
		}else if(#TitleChapterNum==13){
			$PreGameName="boot_セナルート";
			$GameName="chs_153_セナ編_第７の事件";
			$セナルート=true;
		}else if(#TitleChapterNum==14){
			$PreGameName="boot_優愛ルート";
			$GameName="chy_153_優愛編_インターミッションＹ１Ａ";
			$優愛ルート=true;
		}else if(#TitleChapterNum==15){
			$PreGameName="boot_梢ルート";
			$GameName="chk_151_梢編_インターミッション３３Ａ";
			$梢ルート=true;
		}else if(#TitleChapterNum==16){
			$PreGameName="boot_あやせルート";
			$GameName="cha_153_あやせ編_第７の事件";
			$あやせルート=true;
		}else if(#TitleChapterNum==17){
			$PreGameName="boot_七海ルート";
			$GameName="chn_125_七海編_七海帰還";
			$七海ルート=true;
		}else if(#TitleChapterNum==18){
			$PreGameName="boot_第十章";
			$GameName="chz_212_青空編_pray";
			$ClearPreAll=true;
			$BlueSky=true;
		}
	}else if($TitleSelect==3){
		#NextPreGameName=$PreGameName;
		#NextGameName=$GameName;
		#NextGameDebugSelect=$GameDebugSelect;
		#NextGameDebugRoute=$GameDebugRoute;
			ClearScore(LOCAL);
			ClearBacklog();
		$PreGameName=#NextPreGameName;
		$GameName=#NextGameName;
		$GameDebugSelect=#NextGameDebugSelect;
		if($GameName=="chz_212_青空編_pray"){$ClearPreAll=true;}
		if(#NextGameDebugRoute=="Ａ"){$Ａルート=true;}
		if(#NextGameDebugRoute=="Ｂ"){$Ｂルート=true;}
		if(#NextGameDebugRoute=="梨深"){$梨深ルート=true;#ClearG=true;$RouteON=true;}
		if(#NextGameDebugRoute=="優愛"){$優愛ルート=true;#ClearG=true;$RouteON=true;}
		if(#NextGameDebugRoute=="セナ"){$セナルート=true;#ClearG=true;$RouteON=true;}
		if(#NextGameDebugRoute=="梢"){$梢ルート=true;#ClearG=true;$RouteON=true;}
		if(#NextGameDebugRoute=="七海"){$七海ルート=true;#ClearG=true;$RouteON=true;}
		if(#NextGameDebugRoute=="あやせ"){$あやせルート=true;#ClearG=true;$RouteON=true;}
		if(#NextGameDebugRoute=="共通"){#ClearG=true;}
		if(#NextGameDebugRoute=="Ａ２"){
			$Ａルート=true;
			$Ａ２ルート=true;
			$ClearPreAll=true;
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
		}
	}else{
		if($梨深ルート){#ClearG=true;}
		if($優愛ルート){#ClearG=true;}
		if($セナルート){#ClearG=true;}
		if($梢ルート){#ClearG=true;}
		if($七海ルート){#ClearG=true;}
		if($あやせルート){#ClearG=true;}
		if($Ａ２ルート){#ClearG=true;}
	}

	if(#ClearFinal){$ClearPreAll=true;}
	if($GameName=="ch10_212_Ａ僕は"){$ClearPreAll=false;}

	Zoom("@box360", 0, $DefoZoomOut, 0, null, true);

	$PHome2=100;

	//★対策「アンロードメモリ」
	if(Platform()==100){
		StartUnLoad();
	}

	if(Platform()==100){
		//★対策「オンロードメモリ」
		//MenuLoad();
	}

	//スクリプト的なもの
	//★：フラグ初期化
	if(!#DebugMode){
		InitTrigger();
	}
	$InitFlag = true;
	$Logo = true;
	$PressKey = true;
	$GameStart = 1;

	//システム的なもの
	#START_TIME = Time();
	$PLAY_TIME = 0;

	$PLACE_title = false;
	#SYSTEM_play_speed = #play_speed_plus;
	$SYSTEM_menu_lock = false;
	$SYSTEM_skip_lock = false;
	$SYSTEM_text_erase_lock = false;
	$SYSTEM_backlog_lock = false;
	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
	$SYSTEM_text_auto_lock=false;

	//★★★★アンロック
	XBOX360_LockVideo(false);

	if(Platform()==100){
		WaitAction("@タイトルメニュープロセス", null);
	}

	if($PreGameName == "boot_第一章" || $GameName == 0)
	{
		$SYSTEM_XBOX360_rich_presence_mode=25;
		XBOX360_Presence(25);
		call_chapter nss/boot_第一章.nss;
	}

	if($PreGameName == "boot_第二章" || $GameName == 0)
	{
		$SYSTEM_XBOX360_rich_presence_mode=8;
		XBOX360_Presence(8);
		call_chapter nss/boot_第二章.nss;
	}

	if($PreGameName == "boot_第三章" || $GameName == 0)
	{
		$SYSTEM_XBOX360_rich_presence_mode=9;
		XBOX360_Presence(9);
		call_chapter nss/boot_第三章.nss;
	}
	
	if($PreGameName == "boot_第四章" || $GameName == 0)
	{
		$SYSTEM_XBOX360_rich_presence_mode=10;
		XBOX360_Presence(10);
		call_chapter nss/boot_第四章.nss;
	}

	if($PreGameName == "boot_第五章" || $GameName == 0)
	{
		$SYSTEM_XBOX360_rich_presence_mode=11;
		XBOX360_Presence(11);
		call_chapter nss/boot_第五章.nss;
	}
		
	if($PreGameName == "boot_第六章" || $GameName == 0)
	{
		$SYSTEM_XBOX360_rich_presence_mode=12;
		XBOX360_Presence(12);
		call_chapter nss/boot_第六章.nss;
	}
	
	if(($PreGameName == "boot_第七章" || $GameName == 0) && !$七海ルート)
	{
		$SYSTEM_XBOX360_rich_presence_mode=13;
		XBOX360_Presence(13);
		call_chapter nss/boot_第七章.nss;
	}
	
	if(($PreGameName == "boot_第八章" || $GameName == 0) && !$七海ルート && !$セナルート && !$優愛ルート && !$梢ルート && !$あやせルート)
	{
		$SYSTEM_XBOX360_rich_presence_mode=14;
		XBOX360_Presence(14);
		call_chapter nss/boot_第八章.nss;
	}

	if(($PreGameName == "boot_第九章" || $GameName == 0) && !$梨深ルート && !$七海ルート && !$セナルート && !$優愛ルート && !$梢ルート && !$あやせルート)
	{
		$SYSTEM_XBOX360_rich_presence_mode=15;
		XBOX360_Presence(15);
		call_chapter nss/boot_第九章.nss;
	}

	if(($PreGameName == "boot_第十章" || $GameName == 0) && !$梨深ルート && !$七海ルート && !$セナルート && !$優愛ルート && !$梢ルート && !$あやせルート)
	{
		$SYSTEM_XBOX360_rich_presence_mode=16;
		XBOX360_Presence(16);
		call_chapter nss/boot_第十章.nss;
	}



	if(($PreGameName == "boot_梨深ルート" || $GameName == 0) && $梨深ルート)
	{
		$SYSTEM_XBOX360_rich_presence_mode=17;
		XBOX360_Presence(17);
		call_chapter nss/boot_梨深ルート.nss;
	}
	if(($PreGameName == "boot_七海ルート" || $GameName == 0) && $七海ルート)
	{
		$SYSTEM_XBOX360_rich_presence_mode=18;
		XBOX360_Presence(18);
		call_chapter nss/boot_七海ルート.nss;
	}
	if(($PreGameName == "boot_セナルート" || $GameName == 0) && $セナルート)
	{
		$SYSTEM_XBOX360_rich_presence_mode=19;
		XBOX360_Presence(19);
		call_chapter nss/boot_セナルート.nss;
	}
	if(($PreGameName == "boot_優愛ルート" || $GameName == 0) && $優愛ルート)
	{
		$SYSTEM_XBOX360_rich_presence_mode=22;
		XBOX360_Presence(22);
		call_chapter nss/boot_優愛ルート.nss;
	}
	if(($PreGameName == "boot_梢ルート" || $GameName == 0) && $梢ルート)
	{
		$SYSTEM_XBOX360_rich_presence_mode=21;
		XBOX360_Presence(21);
		call_chapter nss/boot_梢ルート.nss;
	}
	if(($PreGameName == "boot_あやせルート" || $GameName == 0) && $あやせルート)
	{
		$SYSTEM_XBOX360_rich_presence_mode=20;
		XBOX360_Presence(20);
		call_chapter nss/boot_あやせルート.nss;
	}



}
//=============================================================================//















