#include "nss/function_system.nss"
$Revision: 10 $

//=============================================================================//
//■バックログ■
//=============================================================================//

chapter main
{
	CursorPosition($LogPosX,$LogPosY);

	//★定義「ストレージ番号取得」
	FlagCheck();

	//■フラグ関係
	//バックログ関係システム変数
	//※一行あたりの文字数はシステムの都合上「System.ini」の「バックログ」セクションで設定してください。
	$SYSTEM_backlog_row_max=10;			//バックログ表示の最大行数
	$SYSTEM_backlog_voice_icon_x=48;	//バックログ表示の音声リピートアイコンＸ座標
	$SYSTEM_backlog_position_x=72;		//バックログ表示の文章開始位置Ｘ座標
	$SYSTEM_backlog_position_y=56;		//バックログ表示の文章開始位置Ｙ座標
	$SYSTEM_backlog_row_interval=34;	//バックログ表示の行間サイズ
	$SYSTEM_backlog_character_width=26;	//バックログ表示の各文字幅

	//■準備「スクリーン」//※右クリックから来ていなければ
	if(!$SYSTEM_menu_enable){
		if(Platform()==100){
			CreateTexture("video",10000,center,middle,SCREEN);
			CreateTexture("bk背景２",10100,center,middle,SCREEN);
		}else{
			CreateTexture("video",10000,center,middle,VIDEO);
			CreateTexture("bk背景２",10100,center,middle,VIDEO);
		}
	}else if($SYSTEM_menu_enable){
		CreateTexture("video",10000,center,middle,SCREEN);
		CreateTexture("bk背景２",10100,center,middle,SCREEN);
	}


	//■準備「フォント」
	LoadFont("bkフォント01", "ＭＳ ゴシック", 26, #303030, #FFFFFF, 500, AROUND, "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをんがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽぁぃぅぇぉっゃゅょアイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポァィゥェォッャュョ、。ー…！？―「」『』１２３４５６７８９０");
	LoadFont("bkフォント02", "ＭＳ ゴシック", 26, #303030, #FFFFFF, 500, AROUND, "一今日敵味方思分行時言聞見何人終好急");
	LoadFont("bkフォント03", "ＭＳ ゴシック", 26, #303030, #FFFFFF, 500, AROUND, "渋谷西條拓巳将軍梨深美優愛梢七海星来判諏訪波多野呂瀬猪鼻倉持百瀬葉月三住目死体貼付ＤＱＮ");

	SetFont("ＭＳ　ゴシック",26,#303030,#FFFFFF,500,AROUND);
//	SetFont("ＭＳ　ゴシック",32,#FFFFFF,#303030,500,AROUND);

	//▼定義「背景」
	CreateTexture("bk背景",10010,0,0,"cg/sys/backlog/new-back-log地紋.png");
	SetAlias("bk背景", "bk背景");


	//▼定義「バックログ」
	CreateScrollbar("bkスクロールバー",10050,922,443,922,56,0,VERTICAL,"cg/sys/backlog/new-back-logスライドバー.png");
	SetAlias("bkスクロールバー", "bkスクロールバー");

	CreateBacklog("bkバックログ",10010);
	SetScrollbar("bkスクロールバー","bkバックログ");

	//■定義「ボタン説明」
	DialogButtonON("Button_LOG");

	//●準備
	Fade("@bk*", 0, 0, null, false);
	Fade("@bk*/*", 0, 0, null, false);
	Fade("@bk*/*/*", 0, 0, null, false);

	Fade("bk背景２", 0, 1000, null, false);


	//●描画
	Fade("bk背景", 0, 1000, null, false);
	Fade("bkスクロールバー", 0, 1000, null, false);

	//▲描画「ボタン説明」
	DialogButtonFade3("Button_LOG");
	DrawTransition("bk背景２", 500, 1000, 0, 100, null, "cg/data/モザイク.png", true);

		Fade("bk背景２", 0, 0, null, true);
		DrawTransition("bk背景２", 0, 0, 1000, 100, null, "cg/data/モザイク.png", true);

	//★選択肢
	$SYSTEM_backlog_enable=true;
	$SYSTEM_menu_close_enable=false;
	$SYSTEM_buttondown_close=false;
	$SYSTEM_keydown_esc=false;
	$BackLogMove=0;
	$PreBackLogPositionY=372;

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	while(EnableBacklog()&&$SYSTEM_backlog_enable)
	{
		if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
		select
		{
			if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
			if(!EnableBacklog()||!$SYSTEM_backlog_enable)){break;}
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$SYSTEM_backlog_enable=false;break;}

			case bkスクロールバー{
			}case bk出口{
				break;
			}case bk矢印{
			}

			if(!EnableBacklog()||!$SYSTEM_backlog_enable)){
				break;
			else if($SYSTEM_keydown_f){
				if(!#SYSTEM_window_full_lock){
					#SYSTEM_window_full=!#SYSTEM_window_full;
					#SYSTEM_window_full_lock=false;
					#SYSTEM_video_aspect_fixed=1;
					Wait(300);
					$SYSTEM_keydown_f=false;
				}
			}
			}else if($SYSTEM_menu_close_enable || $SYSTEM_buttondown_close || $SYSTEM_keydown_esc){
				call_chapter nss/sys_close.nss;
			}
		}

		if(!EnableBacklog()||!$SYSTEM_backlog_enable)){break;}
		Wait(8);
	}
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;

//case bk上ライン{Request("BAR",Decrement);}
//case bk上ページ{Request("BAR",Prev);}
//case bk下ライン{Request("BAR",Increment);}
//case bk下ページ{Request("BAR",Next);}

		Wait(100);

			//▲描画「ボタン説明」
			DialogButtonOFF3("Button_LOG");

	//●終了動作「描画」
	if(!$SYSTEM_menu_enable){
		Fade("bk背景２", 0, 1000, null, false);
		DrawTransition("bk背景２", 300, 0, 1000, 100, null, "cg/data/モザイク.png", true);
		Delete("bk*/*/*");
		Delete("bk*");
	}else if($SYSTEM_menu_enable){
		Fade("bk背景２", 0, 1000, null, false);
		DrawTransition("bk背景２", 300, 0, 1000, 100, null, "cg/data/モザイク.png", true);
		Delete("bk*/*/*");
		Delete("bk*");
	}

	MoveCursor($LogPosX,$LogPosY);
	$SYSTEM_backlog_enable=false;
}

