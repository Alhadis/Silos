#include "nss/function.nss"

//=============================================================================//
//■ユーザ情報■
//=============================================================================//
chapter main
{
	//■定義「ビデオ設置」
	if(!$DialogChangeState_Flag&&!$SYSTEM_menu_config_enable&&!$SYSTEM_menu_save_enable&&!$SYSTEM_menu_load_enable&&!$SYSTEM_menu_enable&&!$SYSTEM_backlog_enable){
		CreateTexture("video", 1010000, center, middle, "VIDEO");
	}

	//■定義「メッセージウインドウ作成」
	if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}else{
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}

	$DialogText01="ユーザー情報が変更されました";
	if($Logo){
		$DialogText02="タイトルに戻ります";
	}else{
		$DialogText02="ゲーム起動直後まで戻ります";
	}
//	$DialogText03="　";

	//■定義「背景」
	if(!$DialogChangeState_Flag){
		CreateTexture("MSGWND/MSG_bak",1010000,0,0,"cg/sys/dialog/ダイアログkeep-out.png");
	}

	//■定義「選択肢」
	//box
	CreateTexture("MSGWND/MSG_msg",1010000,280,184,"cg/sys/dialog/ダイアログ台座2.png");
	//text
	SetFont("ＭＳ ゴシック", 21, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
//	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);

	//●最終準備
	Fade("MSGWND/MSG_*",0,0,null,false);
	Fade("MSGWND/MSG_*/*/*",0,0,null,false);
	Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
	Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
	Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
	Request("MSGWND/MSG_text*", NoLog);
	Request("MSGWND/MSG_text*", PushText);

	//●文字位置調整
//	Move("MSGWND/MSG_text1", 0, @15, @-25, null, true);
	Move("MSGWND/MSG_text1", 0, @12, @-30, null, true);
	Move("MSGWND/MSG_text2", 0, @12, @-6, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-50, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-24, null, true);
//	Move("MSGWND/MSG_text3", 0, @15, @0, null, true);

	//★描画開始
	Fade("MSGWND/MSG_bak",200,1000,null,false);
	Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
	Move("MSGWND/MSG_msg",300,@0,@6,null,false);
	Move("MSGWND/MSG_text*",300,@0,@6,null,false);
	Fade("MSGWND/MSG_*",300,1000,null,false);
	Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);

	WaitAction("MSGWND/MSG_*",null);

	$SYSTEM_XBOX360_button_a_down=false;
	if(Platform()==100){
		select{
			if($SYSTEM_XBOX360_button_a_down){break;}
		}
	}else{
		WaitKey();
	}
	$SYSTEM_XBOX360_button_a_down=false;

//			#LOCAL_sound_volume_bgm=#SYSTEM_sound_volume_bgm;
//			#SYSTEM_sound_volume_bgm=0;
			SetVolume("<@*>", 0, 0, NULL);
			CreateSE("SE01","SE_擬音_妄そうOUT");
			SoundPlay("SE01", 0, 1000, false);
			CreateColor("BLACK",1111999,center,middle,26,26,BLACK);
			Zoom("BLACK",0,100000,100000,null,false);
			CreateMovie360("妄想out", 1112000, Center, Middle, false, false, "dx/mvout.avi");
			//Request("妄想out", Play);
			WaitAction("妄想out", null);

			if($Logo){#Logo2=true;}
			else{#Logo2=false;}
			ClearScore(LOCAL);

			if(#Logo2){$Logo=true;}
			ClearScore(GLOBAL);

			$SYSTEM_low_thread_priority=false;
			$SYSTEM_save_lock=false;
			$SYSTEM_load_lock=false;
			$SYSTEM_text_auto=false;
			Reset();
		}
	}
}
