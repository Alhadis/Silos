#include "nss/function.nss"
#include "nss/function_system.nss"

//=============================================================================//
//■終了確認■
//=============================================================================//
chapter main
{
	//★定義「ストレージ番号取得」
	FlagCheck();

	//★前提変数
	$SYSTEM_menu_close_enable=true;

	//■定義「ビデオ設置」
	if((!$Title_Exit&&$PLACE_title)||(!$Title_Exit&&!$SL_Exit&&!$SYSTEM_menu_config_enable&&!$SYSTEM_menu_save_enable&&!$SYSTEM_menu_load_enable&&!$SYSTEM_menu_enable&&!$SYSTEM_backlog_enable)){
		if(!$InDialog){
			CreateTexture("video",1010000,center,middle,"VIDEO");
		}
	}

	//★尋ねない
	if(#no_ask){
//		#LOCAL_sound_volume_bgm=#SYSTEM_sound_volume_bgm;
//		#SYSTEM_sound_volume_bgm=0;
		SetVolume("<@*>", 0, 0, NULL);
		CreateSE("SE01","SE_擬音_妄そうOUT");
		SoundPlay("SE01", 0, 1000, false);
		CreateColor("BLACK",1111999,center,middle,26,26,BLACK);
		Zoom("BLACK",0,100000,100000,null,false);
		CreateMovie360("妄想out", 1112000, Center, Middle, false, false, "dx/mvout.avi");
		Request("妄想out", Play);
		WaitAction("妄想out", null);

		Wait(300);
//		#SYSTEM_sound_volume_bgm=#LOCAL_sound_volume_bgm;
		Exit();
	}

	//★終了「タイトルからの終了処理」
	if($Title_Exit&&!$SL_Exit){
		CreateColor("BLACK",1112000,center,middle,1280,720,BLACK);
		Fade("BLACK",0,0,null,true);
		Fade("BLACK",500,1000,null,true);
		
		Exit();
	}

	//■定義「メッセージウインドウ作成」
	if(!$PLACE_title&&!$SL_Exit&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable&&!$SYSTEM_menu_save_enable&&!$SYSTEM_menu_load_enable&&!$tps_close){
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}else{
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}

	$DialogText01="ゲームを終了しますか？";
//	$DialogText02="保存されていないデータは失われます";
//	$DialogText03="よろしいですか？";

	//▲画像ロード
	LoadImage("MSGWND/IMG_yes_on","cg/sys/dialog/yes-002.png");
	LoadImage("MSGWND/IMG_yes_off","cg/sys/dialog/yes-001.png");
	LoadImage("MSGWND/IMG_no_on","cg/sys/dialog/no-002.png");
	LoadImage("MSGWND/IMG_no_off","cg/sys/dialog/no-001.png");

	//■定義「背景」
	if(!$InDialog){
		CreateTexture("MSGWND/MSG_bak",1010000,center,middle,"cg/sys/dialog/ダイアログkeep-out.png");
	}

	//■定義「選択肢」
	//box
	if(!$InDialog){
		CreateTexture("MSGWND/MSG_msg",1010000,280,184,"cg/sys/dialog/ダイアログ台座.png");
	}
	//text
	SetFont("ＭＳ ゴシック", 21, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
//	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
//	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
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
	if(!$InDialog){
		Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
		Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
		Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
	}
	Request("MSGWND/MSG_text*", NoLog);
	Request("MSGWND/MSG_text*", PushText);

	//●文字位置調整
	Move("MSGWND/MSG_text1", 0, @12, @-36, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-50, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @30, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-70, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-44, null, true);
//	Move("MSGWND/MSG_text3", 0, @15, @-20, null, true);

	//★描画開始
	Fade("MSGWND/MSG_bak",200,1000,null,false);
	if(!$InDialog){
		Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
		Move("MSGWND/MSG_msg",300,@0,@6,null,false);
		Move("MSGWND/MSG_text*",300,@0,@6,null,false);
	}
	Fade("MSGWND/MSG_*",300,1000,null,false);
	Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);

	WaitAction("MSGWND/MSG_*",null);

	if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	select{
		if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
		case MSGWND/MSG_no{}
		case MSGWND/MSG_yes{
//			#LOCAL_sound_volume_bgm=#SYSTEM_sound_volume_bgm;
//			#SYSTEM_sound_volume_bgm=0;
			SetVolume("<@*>", 0, 0, NULL);
			CreateMovie360("妄想out", 1112000, Center, Middle, false, false, "dx/mvout.avi");
			Request("妄想out", Play);
			CreateSE("SE01","SE_擬音_妄そうOUT");
			SoundPlay("SE01", 0, 1000, false);
			WaitAction("妄想out", null);

			CreateColor("BLACK",1112000,center,middle,1280,720,BLACK);
			Fade("BLACK",0,0,null,true);
			Fade("BLACK",500,1000,null,true);
			
			Wait(300);
//			#SYSTEM_sound_volume_bgm=#LOCAL_sound_volume_bgm;
			Exit();
		}
		if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){break;}
		if($SYSTEM_keydown_f){
			if(!#SYSTEM_window_full_lock){
				#SYSTEM_window_full=!#SYSTEM_window_full;
				#SYSTEM_window_full_lock=false;
				#SYSTEM_video_aspect_fixed=1;
				Wait(300);
				$SYSTEM_keydown_f=false;
			}
		}
		else if(!($SYSTEM_menu_close_enable || $SYSTEM_buttondown_close || $SYSTEM_keydown_esc)){break;}
	}

	if(!$InDialog){
		Fade("MSGWND/MSG_*",200,0,null,false);
		Fade("MSGWND/MSG_*/*/*",100,0,null,false);
		Move("MSGWND/MSG_msg",300,@0,@6,null,false);
		Move("MSGWND/MSG_text*",300,@0,@6,null,false);
		Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
	}else{
		Fade("MSGWND/MSG_*",200,0,null,false);
		Fade("MSGWND/MSG_*/*/*",100,0,null,false);
	}

	WaitAction("MSGWND/MSG_*",null);

	Delete("*");

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	$SYSTEM_menu_close_enable=false;
	$SYSTEM_buttondown_close=false;
	$SYSTEM_keydown_esc=false;
}