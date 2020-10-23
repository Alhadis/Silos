

//=============================================================================//
.★【選択】スタート画面：サインインしていないよ？
//=============================================================================//
function DialogStartSignIn()
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	//■定義「メッセージウインドウ作成」
	if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}else{
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}

	$DialogText01="サインインしていません";
	$DialogText02="この状態ではデータを保存できません";
	$DialogText03="このままゲームを開始しますか？";

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
	SetFont("ＭＳ ゴシック", 18, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
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
//	Move("MSGWND/MSG_text1", 0, @15, @-45, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-60, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-30, null, true);
	Move("MSGWND/MSG_text1", 0, @12, @-56, null, true);
	Move("MSGWND/MSG_text2", 0, @12, @-35, null, true);
	Move("MSGWND/MSG_text3", 0, @12, @-16, null, true);

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

	MoveCursor(592,304);

	$DialogStartSignIn_Flag=false;
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	select{
		if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){break;}

		case MSGWND/MSG_no{
			/*
			if(XBOX360_Signin()){
			    //サインイン成功
				$DialogStartSignIn_Flag=true;
			}else{
			    //サインイン失敗
			}
			*/
		}case MSGWND/MSG_yes{
			$SignInWhile=false;//ホワイルブレイク
		}

		if($SYSTEM_menu_close_enable){
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
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;


	if($DialogStartSignIn_Flag){
		Fade("MSGWND/MSG_msg",200,0,null,false);
		Fade("MSGWND/MSG_text*",200,0,null,false);
		Fade("MSGWND/MSG_*/*/*",100,0,null,false);
		Move("MSGWND/MSG_msg",300,@0,@6,null,false);
		Move("MSGWND/MSG_text*",300,@0,@6,null,false);
		Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
		WaitAction("MSGWND/MSG_*",null);

		Delete("MSGWND/*/*/*");
		Delete("MSGWND/*/*");
		Delete("MSGWND/MSG_yes*");
		Delete("MSGWND/MSG_no*");
		Delete("MSGWND/MSG_text*");
		Delete("MSGWND/MSG_msg");
	}else{
		Fade("MSGWND/MSG_*",200,0,null,false);
		Fade("MSGWND/MSG_*/*/*",100,0,null,false);
		Move("MSGWND/MSG_msg",300,@0,@6,null,false);
		Move("MSGWND/MSG_text*",300,@0,@6,null,false);
		Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
		WaitAction("MSGWND/MSG_*",null);

		Delete("MSGWND/*/*/*");
		Delete("MSGWND/*/*");
		Delete("MSGWND/*");
		Delete("MSGWND");
	}
}

//=============================================================================//
.★【選択】スタート画面：ストレージを選択
//=============================================================================//
function DialogStartStorage()
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	//■定義「メッセージウインドウ作成」
	if(!$DialogStartSignIn_Flag){
		if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
			//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
			CreateName("MSGWND");
		}else{
			//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
			CreateName("MSGWND");
		}
	}

	$DialogCase="７";

	$DialogText01="データの保存場所を選択して下さい";
	$DialogText02="保存するには最低" + $DialogCase + "ＭＢの空き容量が必要です";
//	$DialogText03="";

	//■定義「背景」
	if(!$DialogStartSignIn_Flag){
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
	if(!$DialogStartSignIn_Flag){
		Fade("MSGWND/MSG_*",0,0,null,false);
		Fade("MSGWND/MSG_*/*/*",0,0,null,false);
		Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
		Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
		Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
		Request("MSGWND/MSG_text*", NoLog);
		Request("MSGWND/MSG_text*", PushText);
	}else{
		Fade("MSGWND/MSG_*/*/*",0,0,null,false);
		Fade("MSGWND/MSG_msg",0,0,null,false);
		Fade("MSGWND/MSG_text*",0,0,null,false);
		Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
		Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
		Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
		Request("MSGWND/MSG_text*", NoLog);
		Request("MSGWND/MSG_text*", PushText);
	}

	//●文字位置調整
//	Move("MSGWND/MSG_text1", 0, @15, @-25, null, true);
	Move("MSGWND/MSG_text1", 0, @12, @-32, null, true);
	Move("MSGWND/MSG_text2", 0, @12, @-8, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-50, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-24, null, true);
//	Move("MSGWND/MSG_text3", 0, @15, @0, null, true);

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

	$SYSTEM_XBOX360_button_a_down=false;
	if(Platform()==100){
		select{
			if($SYSTEM_XBOX360_button_a_down){break;}
		}
	}else{
		WaitKey();
	}
	$SYSTEM_XBOX360_button_a_down=false;

	$DialogStorageSize_Flag=true;
	while($DialogStorageSize_Flag){
		$DialogStorageSize_Flag=false;
	    //★ストレージ選択
		if(XBOX360_SelectStorage(7208960)){
			//▼7MBの空き容量を持つストレージ選択成功
			$SignInWhile=false;
			//▼ユーザゲームデータの有無を確認する
			if(XBOX360_ExistContent()){
				//▼データ破損チェック
				DialogSystemCheck();
				if($DialogSystemCheck_Flag){
					//▼グローバル変数データのロード
					//●総プレイ時間の保持
					$BEGIN_TIME_LOCAL=#BEGIN_TIME;
					Load(0);
					#BEGIN_TIME=$BEGIN_TIME_LOCAL;
				}else{
					$SignInWhile=true;
				}
			}else{
				//▼空き容量判定//
				if(XBOX360_StorageSize()>=7208960){
					//▼グローバル変数データのセーブ（ついでにコンテントが作成される）
					GetTime();
					Save(0);
				}else{
					//▼空き容量が足りなかった場合
					DialogStorageSize();
				}
			}
		}else{
			//★ストレージ選択失敗このまま始めるか【選択】
			Fade("MSGWND/MSG_msg",200,0,null,false);
			Fade("MSGWND/MSG_text*",200,0,null,false);
			Fade("MSGWND/MSG_*/*/*",100,0,null,false);
			Move("MSGWND/MSG_msg",300,@0,@6,null,false);
			Move("MSGWND/MSG_text*",300,@0,@6,null,false);
			Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
			WaitAction("MSGWND/MSG_*",null);
		
			Delete("MSGWND/*/*/*");
			Delete("MSGWND/*/*");
			Delete("MSGWND/MSG_yes*");
			Delete("MSGWND/MSG_no*");
			Delete("MSGWND/MSG_text*");
			Delete("MSGWND/MSG_msg");
		
			//★★★★ロック
			XBOX360_LockVideo(true);
		
			$DialogText01="ストレージが選択されませんでした";
			$DialogText02="この状態ではゲームが保存されません";
			$DialogText03="このままゲームを開始しますか？";
			
			//▲画像ロード
			LoadImage("MSGWND/IMG_yes_on","cg/sys/dialog/yes-002.png");
			LoadImage("MSGWND/IMG_yes_off","cg/sys/dialog/yes-001.png");
			LoadImage("MSGWND/IMG_no_on","cg/sys/dialog/no-002.png");
			LoadImage("MSGWND/IMG_no_off","cg/sys/dialog/no-001.png");
		
			//■定義「選択肢」
			//box
			CreateTexture("MSGWND/MSG_msg",1010000,280,184,"cg/sys/dialog/ダイアログ台座.png");
			//text
			SetFont("ＭＳ ゴシック", 18, FFFFFF, 000000, MEDIUM, NULL);
			CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
			CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
			CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
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
			Fade("MSGWND/MSG_*/*/*",0,0,null,false);
			Fade("MSGWND/MSG_msg",0,0,null,false);
			Fade("MSGWND/MSG_text*",0,0,null,false);
			Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
			Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
			Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
			Request("MSGWND/MSG_text*", NoLog);
			Request("MSGWND/MSG_text*", PushText);
			
			//●文字位置調整
			//	Move("MSGWND/MSG_text1", 0, @15, @-45, null, true);
			//	Move("MSGWND/MSG_text1", 0, @15, @-60, null, true);
			//	Move("MSGWND/MSG_text2", 0, @15, @-30, null, true);
			Move("MSGWND/MSG_text1", 0, @12, @-56, null, true);
			Move("MSGWND/MSG_text2", 0, @12, @-35, null, true);
			Move("MSGWND/MSG_text3", 0, @12, @-16, null, true);
			
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
		
			MoveCursor(592,304);
			
			$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
			select{
				if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){break;}
			
				case MSGWND/MSG_no{
				}case MSGWND/MSG_yes{
					$SignInWhile=false;
				}
			
				if($SYSTEM_menu_close_enable){
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
			$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
		}
	}

	Fade("MSGWND/MSG_*",200,0,null,false);
	Fade("MSGWND/MSG_*/*/*",100,0,null,false);
	Move("MSGWND/MSG_msg",300,@0,@6,null,false);
	Move("MSGWND/MSG_text*",300,@0,@6,null,false);
	Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
	WaitAction("MSGWND/MSG_*",null);

	Delete("MSGWND/*/*/*");
	Delete("MSGWND/*/*");
	Delete("MSGWND/*");
	Delete("MSGWND");
}


//=============================================================================//
.★【選択】コンフィグ：ストレージ変更
//=============================================================================//
function DialogConfigStorage()
{
	//★定義「ストレージ番号取得」
	FlagCheck();

	//★★★★ロック
	XBOX360_LockVideo(true);

	//■定義「ビデオ設置」
	if(!$SYSTEM_menu_config_enable&&!$SYSTEM_menu_save_enable&&!$SYSTEM_menu_load_enable&&!$SYSTEM_menu_enable&&!$SYSTEM_backlog_enable){
//		CreateTexture("video", 1010000, center, middle, "VIDEO");
	}

	//■定義「メッセージウインドウ作成」
	if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
//		CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}else{
//		CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}

	$DialogText01="保存場所の変更を行うとタイトル画面に戻ります";
	$DialogText02="現在プレイ中のデータは保存されません";
	$DialogText03="データの保存場所を変更しますか？";

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
	SetFont("ＭＳ ゴシック", 18, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
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
//	Move("MSGWND/MSG_text1", 0, @15, @-45, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-60, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-30, null, true);
	Move("MSGWND/MSG_text1", 0, @12, @-56, null, true);
	Move("MSGWND/MSG_text2", 0, @12, @-35, null, true);
	Move("MSGWND/MSG_text3", 0, @12, @-16, null, true);

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

	MoveCursor(592,304);

	if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
	$DialogConfigStorage_Flag=false;
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	select{
		if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
		if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){break;}
		case MSGWND/MSG_no{
		}case MSGWND/MSG_yes{
			$DialogConfigStorage_Flag=true;
		}

		if($SYSTEM_menu_close_enable){
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
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;

	if(!$DialogConfigStorage_Flag){
		Fade("MSGWND/MSG_*",200,0,null,false);
		Fade("MSGWND/MSG_*/*/*",100,0,null,false);
		Move("MSGWND/MSG_msg",300,@0,@6,null,false);
		Move("MSGWND/MSG_text*",300,@0,@6,null,false);
		Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
		WaitAction("MSGWND/MSG_*",null);

		Delete("MSGWND/*/*/*");
		Delete("MSGWND/*/*");
		Delete("MSGWND/*");
		Delete("MSGWND");

	}else{

		$DialogStorageSize_Flag=false;

		while($DialogConfigStorage_Flag){
			if(!$DialogStorageSize_Flag){
				Fade("MSGWND/MSG_msg",200,0,null,false);
				Fade("MSGWND/MSG_text*",200,0,null,false);
				Fade("MSGWND/MSG_*/*/*",100,0,null,false);
				Move("MSGWND/MSG_msg",300,@0,@6,null,false);
				Move("MSGWND/MSG_text*",300,@0,@6,null,false);
				Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
				WaitAction("MSGWND/MSG_*",null);
		
				Delete("MSGWND/*/*/*");
				Delete("MSGWND/*/*");
				Delete("MSGWND/MSG_yes*");
				Delete("MSGWND/MSG_no*");
				Delete("MSGWND/MSG_text*");
				Delete("MSGWND/MSG_msg");

				//★★★★ロック
				XBOX360_LockVideo(true);

				//☆【警告】空き容量確認
				$DialogCase="７";
			
				$DialogText01="データの保存場所を選択して下さい";
				$DialogText02="保存するには最低" + $DialogCase + "ＭＢの空き容量が必要です";
			//	$DialogText03="";
			
				//■定義「選択肢」
				//box
				CreateTexture("MSGWND/MSG_msg",1010000,280,184,"cg/sys/dialog/ダイアログ台座2.png");
				//text
				SetFont("ＭＳ ゴシック", 21, FFFFFF, 000000, MEDIUM, NULL);
				CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
				CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
			//	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
			
				//●最終準備
				Fade("MSGWND/MSG_*/*/*",0,0,null,false);
				Fade("MSGWND/MSG_msg",0,0,null,false);
				Fade("MSGWND/MSG_text*",0,0,null,false);
				Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
				Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
				Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
				Request("MSGWND/MSG_text*", NoLog);
				Request("MSGWND/MSG_text*", PushText);
			
				//●文字位置調整
			//	Move("MSGWND/MSG_text1", 0, @15, @-25, null, true);
				Move("MSGWND/MSG_text1", 0, @12, @-32, null, true);
				Move("MSGWND/MSG_text2", 0, @12, @-8, null, true);
			//	Move("MSGWND/MSG_text1", 0, @15, @-50, null, true);
			//	Move("MSGWND/MSG_text2", 0, @15, @-24, null, true);
			//	Move("MSGWND/MSG_text3", 0, @15, @0, null, true);
			
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
	
				if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
				$SYSTEM_XBOX360_button_a_down=false;
				if(Platform()==100){
					select{
						if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
						if($SYSTEM_XBOX360_button_a_down){break;}
					}
				}else{
					WaitKey();
				}
				$SYSTEM_XBOX360_button_a_down=false;
			}

			$DialogStorageSize_Flag=false;

			//▼既存ストレージ場所保存
			$CurrentStorage_Flag=XBOX360_CurrentStorage();
			//★ストレージ選択
			if(XBOX360_SelectStorage(7208960)){
				//▼10MBの空き容量を持つストレージ選択成功
				//▼ストレージに変更はあった？
				if($CurrentStorage_Flag!=XBOX360_CurrentStorage()){
				//●あった場合
					//▼ユーザゲームデータの有無を確認する
					if(XBOX360_ExistContent()){
						//▼データ破損チェック
						DialogSystemCheck();
						if($DialogSystemCheck_Flag){
							//▼グローバル変数データのロード
							//#LOCAL_sound_volume_bgm=#SYSTEM_sound_volume_bgm;
							//#SYSTEM_sound_volume_bgm=0;
							SetVolume("<@*>", 0, 0, NULL);

							CreateSE("SE01","SE_擬音_妄そうOUT");
							SoundPlay("SE01", 0, 1000, false);
							CreateColor("BLACK",1111999,center,middle,32,32,BLACK);
							Zoom("BLACK",0,100000,100000,null,false);
							CreateMovie("妄想out", 1112000, Center, Middle, false, false, "dx/mvout.avi");
							//Request("妄想out", Play);
							WaitAction("妄想out", null);

							ClearScore(LOCAL);
							$Logo=true;
							$PressKey=true;
							$SYSTEM_low_thread_priority=false;
							$SYSTEM_save_lock=false;
							$SYSTEM_load_lock=false;
							$SYSTEM_text_auto=false;
							Load(0);

							//●総プレイ時間：計測開始
							#BEGIN_TIME = Time();
							//CreateColor("色", 9999999, 0, 0, 800, 600, "RED");
							//WaitKey();
							Reset();
						}
					}else{
						//▼空き容量判定//
						if(XBOX360_StorageSize()>=7208960){
						    //▼グローバル変数データのセーブ（ついでにコンテントが作成される）
							//#LOCAL_sound_volume_bgm=#SYSTEM_sound_volume_bgm;
							//#SYSTEM_sound_volume_bgm=0;
							SetVolume("<@*>", 0, 0, NULL);

							CreateSE("SE01","SE_擬音_妄そうOUT");
							SoundPlay("SE01", 0, 1000, false);
							CreateColor("BLACK",1111999,center,middle,32,32,BLACK);
							Zoom("BLACK",0,100000,100000,null,false);
							CreateMovie("妄想out", 1112000, Center, Middle, false, false, "dx/mvout.avi");
							//Request("妄想out", Play);
							WaitAction("妄想out", null);

							ClearScore(GLOBAL);
							ClearScore(LOCAL);
							//ConfigFormat();
							$Logo=true;
							$PressKey=true;
							$SYSTEM_low_thread_priority=false;
							$SYSTEM_save_lock=false;
							$SYSTEM_load_lock=false;
							$SYSTEM_text_auto=false;
							//Save(0);
							$ConfigSave=true;
							//CreateColor("色", 9999999, 0, 0, 800, 600, "RED");
							//WaitKey();
							Reset();
						}else{
							//▼空き容量が足りなかった場合
							DialogStorageSize();
						}
					}
				}else{
				//●なかった場合
					//▼ユーザゲームデータの有無を確認する
					if(XBOX360_ExistContent()){
						//▼データ破損チェック
						DialogSystemCheck();
					}else{
						//▼空き容量判定//
						if(XBOX360_StorageSize()>=7208960){
							$DialogSystemCheck_Flag=true;
						}else{
							//▼空き容量が足りなかった場合
							DialogStorageSize();
						}
					}
				}
			}else{
			//▼10MBの空き容量を持つストレージ選択失敗
				//▼ユーザゲームデータの有無を確認する
				if(XBOX360_ExistContent()){
					//▼データ破損チェック
					DialogSystemCheck();
				}else{
					$DialogSystemCheck_Flag=true;
				}
			}

			if($DialogConfigStorage_Flag&&$DialogSystemCheck_Flag&&!$DialogStorageSize_Flag){
				//▼10MBの空き容量を持つストレージ選択失敗
				//▼ストレージに変更はあった？
			    //●無かった場合
			    //★ストレージ変更なし、このまま始めるか【選択】
				Fade("MSGWND/MSG_msg",200,0,null,false);
				Fade("MSGWND/MSG_text*",200,0,null,false);
				Fade("MSGWND/MSG_*/*/*",100,0,null,false);
				Move("MSGWND/MSG_msg",300,@0,@6,null,false);
				Move("MSGWND/MSG_text*",300,@0,@6,null,false);
				Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
				WaitAction("MSGWND/MSG_*",null);
		
				Delete("MSGWND/*/*/*");
				Delete("MSGWND/*/*");
				Delete("MSGWND/MSG_yes*");
				Delete("MSGWND/MSG_no*");
				Delete("MSGWND/MSG_text*");
				Delete("MSGWND/MSG_msg");
		
				//★★★★ロック
				XBOX360_LockVideo(true);
		
				$DialogText01="ストレージ情報が変更されませんでした";
				$DialogText02="このままゲームを続けますか？";
//					$DialogText03="";
				
				//▲画像ロード
				LoadImage("MSGWND/IMG_yes_on","cg/sys/dialog/yes-002.png");
				LoadImage("MSGWND/IMG_yes_off","cg/sys/dialog/yes-001.png");
				LoadImage("MSGWND/IMG_no_on","cg/sys/dialog/no-002.png");
				LoadImage("MSGWND/IMG_no_off","cg/sys/dialog/no-001.png");
				
				//■定義「選択肢」
				//box
				CreateTexture("MSGWND/MSG_msg",1010000,280,184,"cg/sys/dialog/ダイアログ台座.png");
				//text
				SetFont("ＭＳ ゴシック", 18, FFFFFF, 000000, MEDIUM, NULL);
				CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
				CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
//				CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
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
				Fade("MSGWND/MSG_*/*/*",0,0,null,false);
				Fade("MSGWND/MSG_msg",0,0,null,false);
				Fade("MSGWND/MSG_text*",0,0,null,false);
				Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
				Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
				Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
				Request("MSGWND/MSG_text*", NoLog);
				Request("MSGWND/MSG_text*", PushText);
				
				//●文字位置調整
				//	Move("MSGWND/MSG_text1", 0, @15, @-45, null, true);
				Move("MSGWND/MSG_text1", 0, @12, @-48, null, true);
				Move("MSGWND/MSG_text2", 0, @12, @-24, null, true);
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
				
				MoveCursor(432,304);
				
				if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
				$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
				select{
					if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
					if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$DialogConfigStorage_Flag=true;break;}
				
					case MSGWND/MSG_no{
						$DialogConfigStorage_Flag=true;
					}case MSGWND/MSG_yes{
						$DialogConfigStorage_Flag=false;
					}
				
					if($SYSTEM_menu_close_enable){
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
				$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
			}
		}

		Fade("MSGWND/MSG_*",200,0,null,false);
		Fade("MSGWND/MSG_*/*/*",100,0,null,false);
		Move("MSGWND/MSG_msg",300,@0,@6,null,false);
		Move("MSGWND/MSG_text*",300,@0,@6,null,false);
		Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
		WaitAction("MSGWND/MSG_*",null);
	
		Delete("MSGWND/*/*/*");
		Delete("MSGWND/*/*");
		Delete("MSGWND/*");
		Delete("MSGWND");
	}
}

function DialogStorageSize()
{
	$DialogStorageSize_Flag=true;
	Fade("MSGWND/MSG_msg",200,0,null,false);
	Fade("MSGWND/MSG_text*",200,0,null,false);
	Fade("MSGWND/MSG_*/*/*",100,0,null,false);
	Move("MSGWND/MSG_msg",300,@0,@6,null,false);
	Move("MSGWND/MSG_text*",300,@0,@6,null,false);
	Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
	WaitAction("MSGWND/MSG_*",null);

	Delete("MSGWND/*/*/*");
	Delete("MSGWND/*/*");
	Delete("MSGWND/MSG_yes*");
	Delete("MSGWND/MSG_no*");
	Delete("MSGWND/MSG_text*");
	Delete("MSGWND/MSG_msg");

	//★★★★ロック
	XBOX360_LockVideo(true);

	$DialogText01="<SPAN value=24>選択した保存場所に必要な空き容量がありません</SPAN>";
	$DialogText02="<SPAN value=24>別の保存場所を選択して下さい</SPAN>";
	$DialogText03="<SPAN value=24>保存するには最低" + $DialogCase + "ＭＢの空き容量が必要です</SPAN>";

	//■定義「選択肢」
	//box
	CreateTexture("MSGWND/MSG_msg",1010000,350,230,"cg/sys/dialog/ダイアログ台座2.png");
	//text
	SetFont("ＭＳ ゴシック", 21, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);

	//●最終準備
	Fade("MSGWND/MSG_*/*/*",0,0,null,false);
	Fade("MSGWND/MSG_msg",0,0,null,false);
	Fade("MSGWND/MSG_text*",0,0,null,false);
	Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
	Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
	Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
	Request("MSGWND/MSG_text*", NoLog);
	Request("MSGWND/MSG_text*", PushText);

	//●文字位置調整
//	Move("MSGWND/MSG_text1", 0, @15, @-25, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-40, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-10, null, true);
	Move("MSGWND/MSG_text1", 0, @12, @-40, null, true);
	Move("MSGWND/MSG_text2", 0, @12, @-16, null, true);
	Move("MSGWND/MSG_text3", 0, @12, @8, null, true);

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

	$SYSTEM_XBOX360_button_a_down=false;
	if(Platform()==100){
		select{
			if($SYSTEM_XBOX360_button_a_down){break;}
		}
	}else{
		WaitKey();
	}
	$SYSTEM_XBOX360_button_a_down=false;
}

function ConfigFormat()
{
	//ＡＤＶのゲームスピード
	#SYSTEM_play_speed=3;
	#play_speed_plus=#SYSTEM_play_speed;
	if($Title_Config){
		//タイトルにおいてのコンフィグのゲームスピード
		#SYSTEM_play_speed=3;
	}
	#SYSTEM_text_speed=498;//テキスト表示速度
	#SYSTEM_break_play_movie=false;//ムービーをキャンセルできるようにする
	#keep_auto_and_skip=false;//選択肢後もスキップとオートモードを継続する
	#no_ask=false;//確認ダイアログは出す？
	#SYSTEM_skip_absolute=false;//未読でもスキップする
	#SYSTEM_click_break_voice=false;//クリックで飛ばしたら音声もストップする
	#SYSTEM_sound_bgm=true;//ＢＧＭを再生する
	#SYSTEM_sound_se=true;//ＳＥを再生する
	#SYSTEM_sound_voice=true;//音声を再生する
	#SYSTEM_auto_wait_per_character=100;//自動文字送りスピード
	#SYSTEM_auto_text_break_voice=false;//オートモード時にテキストが飛ばされたら音声も飛ばす
	#SYSTEM_auto_ignore_key_cancel=false;//オートモード時にクリックを押すとテキストが飛ぶだけ
	#SYSTEM_sound_volume_bgm=#SYSTEM_sound_volume_bgm_default;//ＢＧＭのボリューム
	#SYSTEM_sound_volume_se=#SYSTEM_sound_volume_se_default;//ＳＥのボリューム
	#SYSTEM_sound_volume_voice=#SYSTEM_sound_volume_voice_default;//音声のボリューム
	#donot_ask_overwrite_savedata=false;//今はもう使用されていないようだ
	#donot_ask_load_savedata=false;//今はもう使用されていないようだ
	#LOCAL_window_fade=602;//ボックス透明度

	#voice_skip_拓巳=false;
	#voice_skip_梨深=false;
	#voice_skip_セナ=false;
	#voice_skip_優愛=false;
	#voice_skip_梢=false;
	#voice_skip_あやせ=false;
	#voice_skip_七海=false;
	#voice_skip_星来=false;
	#voice_skip_葉月=false;
	#voice_skip_三住=false;
	#voice_skip_諏訪=false;
	#voice_skip_百瀬=false;
	#voice_skip_高科=false;
	#voice_skip_将軍=false;
	#voice_skip_判=false;
	#voice_skip_野呂瀬=false;

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

	#SYSTEM_voice_enable_another=true;

	#SYSTEM_video_aspect_fixed=0;
}


//=============================================================================//
.★【選択】ラストセーブ：読み込み確認
//=============================================================================//
function DialogLoadLast()
{
	//★タイトルフラッシュ停止
	$FlashFade = 0;
	Request("タイトル背景プロセス", Stop);

	//★★★★ロック
	XBOX360_LockVideo(true);

	//■定義「メッセージウインドウ作成」
	//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
	CreateName("MSGWND");

	$DialogText01="最後にセーブしたポイントをロードします";
	$DialogText02="動作を続行してよろしいですか？";
//	$DialogText03="このままゲームを開始しますか？";

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
	SetFont("ＭＳ ゴシック", 19, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
	//CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
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
//	Move("MSGWND/MSG_text1", 0, @15, @-45, null, true);
	Move("MSGWND/MSG_text1", 0, @12, @-48, null, true);
	Move("MSGWND/MSG_text2", 0, @12, @-24, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-70, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-44, null, true);
//	Move("MSGWND/MSG_text3", 0, @15, @-20, null, true);

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

	MoveCursor(432,304);

	//★タイトルフラッシュ再開
	Request("タイトル背景プロセス", Start);

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	select{
		if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){
			$load=false;
			break;
		}
		case MSGWND/MSG_no{
			//所定の動作
			Wait(200);
			$load=false;
		}case MSGWND/MSG_yes{
		}

		if($SYSTEM_menu_close_enable){
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
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;

	Fade("MSGWND/MSG_*",200,0,null,false);
	Fade("MSGWND/MSG_*/*/*",100,0,null,false);
	Move("MSGWND/MSG_msg",300,@0,@6,null,false);
	Move("MSGWND/MSG_text*",300,@0,@6,null,false);
	Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
	WaitAction("MSGWND/MSG_*",null);

	Delete("MSGWND/*/*/*");
	Delete("MSGWND/*/*");
	Delete("MSGWND/*");
	Delete("MSGWND");

	MoveCursor(152,71);

	if($load){
		//★読込「マウント」
		if(MountSavedata(#LATEST_SAVE_NUM)){
			$SYSTEM_menu_enable=FALSE;
			$SYSTEM_menu_load_enable=FALSE;

			if(Platform()!=100){
				DeleteSaveFile(9999);
			}
			#START_TIME=Time();
		}else{
			$load=false;
		}
	}

	if($load){
		CreateSE("タイトル選択サウンド","SE_擬音_YESNO選択_クリック");
		SoundPlay("タイトル選択サウンド",0,1000,false);
		SetVolume360("@CH*", 300, 0, NULL);
		SetVolume360("@ch*", 3000, 0, NULL);

		AllPause();
		Fade("タイトル詩織/MouseClick/タイトル詩織３",300,0,null,true);

		$FlashFade = 0;
		Request("タイトル背景プロセス", Stop);

		CreateTexture("タイトルブラー１", 200, 0, 0, "SCREEN");
		CreateTexture("タイトルブラー２", 200, 0, 0, "SCREEN");

		Move("タイトルブラー１", 300, @-24, @0, null, false);
		Move("タイトルブラー２", 300, @24, @0, null, false);
		Fade("タイトルブラー１", 300, 0, null, false);
		Fade("タイトルブラー２", 300, 0, null, false);
		Fade("タイトルカラー", 300, 1000, null, true);

		WaitPlay("タイトル選択サウンド", null);

		//★対策「アンロードメモリ」
		if(Platform()==100){
			Delete("*");
			StartUnLoad();
			//MenuLoad();
		}
		MoveCursor(0,0);
		Load(#LATEST_SAVE_NUM);
	}
}


//=============================================================================//
.★【選択】章選択：読み込み確認
//=============================================================================//
function DialogLoadChapter()
{
	//★タイトルフラッシュ停止
	$FlashFade = 0;
	Request("タイトル背景プロセス", Stop);

	//★★★★ロック
	XBOX360_LockVideo(true);

	//■定義「メッセージウインドウ作成」
	//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
	CreateName("MSGWND");

	$DialogText01="章の先頭から開始します";
	$DialogText02="動作を続行してよろしいですか？";
//	$DialogText03="このままゲームを開始しますか？";

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
	SetFont("ＭＳ ゴシック", 19, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
	//CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
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
//	Move("MSGWND/MSG_text1", 0, @15, @-45, null, true);
	Move("MSGWND/MSG_text1", 0, @12, @-36, null, true);
	Move("MSGWND/MSG_text2", 0, @12, @-17, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-70, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-44, null, true);
//	Move("MSGWND/MSG_text3", 0, @15, @-20, null, true);

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

	MoveCursor(540,380);

	//★タイトルフラッシュ再開
	Request("タイトル背景プロセス", Start);

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	select{
		if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){
			$load=false;
			break;
		}
		case MSGWND/MSG_no{
			//所定の動作
			Wait(200);
			$load=false;
		}case MSGWND/MSG_yes{
		}

		if($SYSTEM_menu_close_enable){
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
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;

	Fade("MSGWND/MSG_*",200,0,null,false);
	Fade("MSGWND/MSG_*/*/*",100,0,null,false);
	Move("MSGWND/MSG_msg",300,@0,@6,null,false);
	Move("MSGWND/MSG_text*",300,@0,@6,null,false);
	Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
	WaitAction("MSGWND/MSG_*",null);

	Delete("MSGWND/*/*/*");
	Delete("MSGWND/*/*");
	Delete("MSGWND/*");
	Delete("MSGWND");

	if($load){
		if(#TitleChapterNum==18){
			CreateSE("タイトル選択サウンド","SE_衝撃_衝撃音01");
			Request("タイトル選択サウンド", Lock);

			SoundPlay("タイトル選択サウンド",0,1000,false);
			SetVolume360("CH*", 10, 0, NULL);
			SetVolume360("CH*", 10, 0, NULL);

			$FlashFade = 0;
			Request("タイトル背景プロセス", Stop);

			//AllPause();
			//Fade("タイトル青空/MouseClick/タイトル青空３",300,0,null,true);

			//★★★★ロック
			XBOX360_LockVideo(true);
			CreateTexture("タイトルブラー１", 1000, 0, 0, "SCREEN");
			CreateTexture("タイトル１", 500, 0, 0, "タイトルイメージ２");
			CreateTexture("タイトル２", 500, 0, 0, "cg/bg/bg209_01_5_曇り空_a.jpg");
			CreateMovie360("タイトルムービー", 1000, Center, Middle, true, false, "dx/mv雨01.avi");
			Request("タイトルムービー", AddRender);

			Fade("*", 0, 0, null, false);
			Fade("*/*", 0, 0, null, false);
			Fade("*/*/*", 0, 0, null, false);
			Fade("*/*/*/*", 0, 0, null, false);
			Fade("タイトルブラー１", 0, 1000, null, false);
			Fade("タイトル１", 0, 1000, null, true);
			//★★★★アンロック
			XBOX360_LockVideo(false);

			Fade("タイトルブラー１", 2000, 0, null, true);

			Wait(1000);
			Fade("タイトルムービー", 2000, 1000, null, false);
			Fade("タイトル２", 2000, 1000, null, true);
			Wait(3000);
			IntermissionIn();
				Fade("*", 0, 0, null, true);
				Request("インターミッション色", UnLock);
				Request("インターミッションムービー１", UnLock);
				FadeDelete("インターミッション色", 100, false);
				FadeDelete("インターミッションムービー１", 100, true);
				Fade("タイトルカラー", 0, 1000, null, true);
		}else{
			CreateSE("タイトル選択サウンド","SE_擬音_YESNO選択_クリック");
			Request("タイトル選択サウンド", Lock);

			SoundPlay("タイトル選択サウンド",0,1000,false);
			SetVolume360("@CH*", 300, 0, NULL);
			SetVolume360("@ch*", 3000, 0, NULL);
	
			AllPause();
			Fade("@タイトル*/MouseClick/*",300,0,null,true);
	
			$FlashFade = 0;
			Request("タイトル背景プロセス", Stop);
	
			CreateTexture("タイトルブラー１", 200, 0, 0, "SCREEN");
			CreateTexture("タイトルブラー２", 200, 0, 0, "SCREEN");
	
			Move("タイトルブラー１", 300, @-24, @0, null, false);
			Move("タイトルブラー２", 300, @24, @0, null, false);
			Fade("タイトルブラー１", 300, 0, null, false);
			Fade("タイトルブラー２", 300, 0, null, false);
			Fade("タイトルカラー", 300, 1000, null, true);
		}

		$TitleSelect=4;
		$TitleSelect2=false;
		$TitleSelect3=false;
		Escape(5);
	}

	if($CsrX<=240&&$CsrX>=56&&$CsrY<=208&&$CsrY>=160){
	//▽１項目
		MoveCursor(151,190);//1
	}else if($CsrX<=240&&$CsrX>=56&&$CsrY<=250&&$CsrY>=211){
	//▽２項目
		MoveCursor(151,233);//2
	}else if($CsrX<=240&&$CsrX>=56&&$CsrY<=294&&$CsrY>=256){
	//▽３項目
		MoveCursor(151,276);//3
	}else if($CsrX<=240&&$CsrX>=56&&$CsrY<=339&&$CsrY>=298){
	//▽４項目
		MoveCursor(151,256);//4
	}
}

//=============================================================================//
.★【選択】システムセーブファイル：壊れてるよ？
//=============================================================================//
function DialogSystemCheck()
{
	$DialogSystemCheck_Flag=true;

	$name1=String("%s/common/val.npf",#SYSTEM_save_path); //グローバル情報
	$name2=String("%s/common/cqst.npf",#SYSTEM_save_path); //既読情報

	if(Platform()==100){
		if(AvailableFile($name1)==1&&AvailableFile($name2)){
			//有効である
		}else{
			//破損している
			//ユーザへメッセージを表示
			//メッセージ内容はTCR#030により以下の内容を必ず含める必要があります
			//１）データが破損していること
			//２）ゲームの進行が不可能であること
			//３）新規に作成しなおす必要があること
			//４）その場合、全てのセーブデータ、現在の保存していないデータが失われること
			//５）作成後はタイトルに戻る必要があること
			//６）ユーザにＹＥＳ、ＮＯの選択権を与えること
		
			//ユーザが同意した場合
			//メッセージ表示後タイトルにシステムセーブデータを削除し初期インタラクティブ状態へ
			//リセットの仕方は、sys/signout.nssおよびsys/loststorage.nssと同じように
			//XBOX360_InitUserコマンドを使用してください

			if($DialogSystemCheck_Flag){
				Fade("MSGWND/MSG_msg",200,0,null,false);
				Fade("MSGWND/MSG_text*",200,0,null,false);
				Fade("MSGWND/MSG_*/*/*",100,0,null,false);
				Move("MSGWND/MSG_msg",300,@0,@8,null,false);
				Move("MSGWND/MSG_text*",300,@0,@8,null,false);
				Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
				WaitAction("MSGWND/MSG_*",null);
		
				Delete("MSGWND/*/*/*");
				Delete("MSGWND/*/*");
				Delete("MSGWND/MSG_yes*");
				Delete("MSGWND/MSG_no*");
				Delete("MSGWND/MSG_text*");
				Delete("MSGWND/MSG_msg");
			}
	
			//★★★★ロック
			XBOX360_LockVideo(true);
	
			//■定義「メッセージウインドウ作成」
			if(!$DialogSystemCheck_Flag){
				if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
					//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
					CreateName("MSGWND");
				}else{
					//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
					CreateName("MSGWND");
				}
			}

			$DialogText01="<SPAN value=20>選択したデータは破損しておりゲームの進行が不可能です</SPAN>";
			$DialogText02="<SPAN value=20>全てのセーブデータを破棄して新規に作成する必要があります</SPAN>";
			$DialogText03="<SPAN value=20>上記動作を行いタイトル画面に戻りますがよろしいですか？</SPAN>";
		
			//▲画像ロード
			LoadImage("MSGWND/IMG_yes_on","cg/sys/dialog/yes-002.png");
			LoadImage("MSGWND/IMG_yes_off","cg/sys/dialog/yes-001.png");
			LoadImage("MSGWND/IMG_no_on","cg/sys/dialog/no-002.png");
			LoadImage("MSGWND/IMG_no_off","cg/sys/dialog/no-001.png");
		
			//■定義「背景」
			if(!$DialogSystemCheck_Flag){
				CreateTexture("MSGWND/MSG_bak",1010000,0,0,"cg/sys/dialog/ダイアログkeep-out.png");
			}
	
			//■定義「選択肢」
			//box
			CreateTexture("MSGWND/MSG_msg",1010000,350,230,"cg/sys/dialog/ダイアログ台座.png");
			//text
			SetFont("ＭＳ ゴシック", 18, FFFFFF, 000000, MEDIUM, NULL);
			CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
			CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
			CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
			//YES
			CreateChoice("MSGWND/MSG_yes");
			CreateTexture("MSGWND/MSG_yes/MouseUsual/img",1012000,450,360,"MSGWND/IMG_yes_off");
			CreateTexture("MSGWND/MSG_yes/MouseOver/img",1011000,450,360,"MSGWND/IMG_yes_on");
			CreateTexture("MSGWND/MSG_yes/MouseClick/img",1011000,450,360,"MSGWND/IMG_yes_on");
			//NO
			CreateChoice("MSGWND/MSG_no");
			CreateTexture("MSGWND/MSG_no/MouseUsual/img",1012000,650,360,"MSGWND/IMG_no_off");
			CreateTexture("MSGWND/MSG_no/MouseOver/img",1011000,650,360,"MSGWND/IMG_no_on");
			CreateTexture("MSGWND/MSG_no/MouseClick/img",1011000,650,360,"MSGWND/IMG_no_on");
		
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
			if($DialogSystemCheck_Flag){
				Fade("MSGWND/MSG_*/*/*",0,0,null,false);
				Fade("MSGWND/MSG_msg",0,0,null,false);
				Fade("MSGWND/MSG_text*",0,0,null,false);
				Move("MSGWND/MSG_*/*/*",0,@0,@-8,null,false);
				Move("MSGWND/MSG_msg",0,@0,@-8,null,false);
				Move("MSGWND/MSG_text*", 0, @0, @-8, null, true);
				Request("MSGWND/MSG_text*", NoLog);
				Request("MSGWND/MSG_text*", PushText);
			}else{
				Fade("MSGWND/MSG_*",0,0,null,false);
				Fade("MSGWND/MSG_*/*/*",0,0,null,false);
				Move("MSGWND/MSG_*/*/*",0,@0,@-8,null,false);
				Move("MSGWND/MSG_msg",0,@0,@-8,null,false);
				Move("MSGWND/MSG_text*", 0, @0, @-8, null, true);
				Request("MSGWND/MSG_text*", NoLog);
				Request("MSGWND/MSG_text*", PushText);
			}
		
			//●文字位置調整
		//	Move("MSGWND/MSG_text1", 0, @15, @-45, null, true);
		//	Move("MSGWND/MSG_text1", 0, @15, @-60, null, true);
		//	Move("MSGWND/MSG_text2", 0, @15, @-30, null, true);
		Move("MSGWND/MSG_text1", 0, @12, @-49, null, true);
		Move("MSGWND/MSG_text2", 0, @12, @-28, null, true);
		Move("MSGWND/MSG_text3", 0, @12, @-9, null, true);
		
			//★★★★アンロック
			XBOX360_LockVideo(false);
		
			//★描画開始
			Fade("MSGWND/MSG_bak",200,1000,null,false);
			Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
			Move("MSGWND/MSG_msg",300,@0,@8,null,false);
			Move("MSGWND/MSG_text*",300,@0,@8,null,false);
			Fade("MSGWND/MSG_*",300,1000,null,false);
			Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);
		
			WaitAction("MSGWND/MSG_*",null);
		
			MoveCursor(740,380);
		
			$DialogSystemCheck_Flag=false;
			$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
			select{
				if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){break;}
				case MSGWND/MSG_no{
				}case MSGWND/MSG_yes{
					//★システム全飛ばし
					DeleteSaveFile(0);
		//			#LOCAL_sound_volume_bgm=#SYSTEM_sound_volume_bgm;
		//			#SYSTEM_sound_volume_bgm=0;
					SetVolume("<@*>", 0, 0, NULL);
					CreateSE("SE01","SE_擬音_妄そうOUT");
					SoundPlay("SE01", 0, 1000, false);
					CreateColor("BLACK",1111999,center,middle,32,32,BLACK);
					Zoom("BLACK",0,100000,100000,null,false);
					CreateMovie360("妄想out", 1112000, Center, Middle, false, false, "dx/mvout.avi");
					//Request("妄想out", Play);
					WaitAction("妄想out", null);
					XBOX360_LockVideo(true);
					
					if($Logo){#Logo2=true;}
					else{#Logo2=false;}
					ClearScore(LOCAL);
		
					if(#Logo2){$Logo=true;}
					ClearScore(GLOBAL);
		
					$SYSTEM_low_thread_priority=false;
					$SYSTEM_save_lock=false;
					$SYSTEM_load_lock=false;
					$SYSTEM_text_auto=false;
					XBOX360_InitUser();
					Reset();
				}
		
				if($SYSTEM_menu_close_enable){
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
			$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
		}
	}
}

function garakuta()
{
		if($DialogSystemCheck_Flag){
			Fade("MSGWND/MSG_msg",200,0,null,false);
			Fade("MSGWND/MSG_text*",200,0,null,false);
			Fade("MSGWND/MSG_*/*/*",100,0,null,false);
			Move("MSGWND/MSG_msg",300,@0,@8,null,false);
			Move("MSGWND/MSG_text*",300,@0,@8,null,false);
			Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
			WaitAction("MSGWND/MSG_*",null);
	
			Delete("MSGWND/*/*/*");
			Delete("MSGWND/*/*");
			Delete("MSGWND/MSG_yes*");
			Delete("MSGWND/MSG_no*");
			Delete("MSGWND/MSG_text*");
			Delete("MSGWND/MSG_msg");
		}else{
			Fade("MSGWND/MSG_*",200,0,null,false);
			Fade("MSGWND/MSG_*/*/*",100,0,null,false);
			Move("MSGWND/MSG_msg",300,@0,@8,null,false);
			Move("MSGWND/MSG_text*",300,@0,@8,null,false);
			Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
			WaitAction("MSGWND/MSG_*",null);
	
			Delete("MSGWND/*/*/*");
			Delete("MSGWND/*/*");
			Delete("MSGWND/*");
			Delete("MSGWND");
		}
}


//=============================================================================//
.★【選択】個別セーブファイル：壊れてるよ？
//=============================================================================//
function DialogLoadCheck()
{
	$loadbreak=false;
	$DialogLoadCheck_Flag=false;

	$img=String("%s/%04d/thum.npf",#SYSTEM_save_path,$num); //サムネイル情報
	$name1=String("%s/%04d/bklg.npf",#SYSTEM_save_path,$num); //バックログ情報
	$name2=String("%s/%04d/frames.npf",#SYSTEM_save_path,$num); //ナット情報
	$name3=String("%s/%04d/script.npf",#SYSTEM_save_path,$num); //スクリプト情報
	$name4=String("%s/%04d/val.npf",#SYSTEM_save_path,$num); //ローカル変数情報

	if(Platform()==100){
		if(AvailableFile($img)==1&&AvailableFile($name1)==1&&AvailableFile($name2)==1&&AvailableFile($name3)==1&&AvailableFile($name4)==1){
			//有効である
		}else{
			//破損している
			//ユーザへメッセージを表示
			//メッセージ内容はTCR#030により以下の内容を必ず含める必要があります
			//１）データが破損していること
			//２）該当するセーブデータは使用できないこと
			//３）該当するセーブデータを削除する必要があること
			//４）ユーザにＹＥＳ、ＮＯの選択権を与えること
	
			//ユーザが同意した場合
			//該当するセーブデータを削除する
			//$DialogLoadCheck_Flag=true;
	
			//★★★★アンロック
			XBOX360_LockVideo(false);
			if($DialogLoadCheck_Flag){
				Fade("MSGWND/MSG_msg",200,0,null,false);
				Fade("MSGWND/MSG_text*",200,0,null,false);
				Fade("MSGWND/MSG_*/*/*",100,0,null,false);
				Move("MSGWND/MSG_msg",300,@0,@8,null,false);
				Move("MSGWND/MSG_text*",300,@0,@8,null,false);
				Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
				WaitAction("MSGWND/MSG_*",null);
		
				Delete("MSGWND/*/*/*");
				Delete("MSGWND/*/*");
				Delete("MSGWND/MSG_yes*");
				Delete("MSGWND/MSG_no*");
				Delete("MSGWND/MSG_text*");
				Delete("MSGWND/MSG_msg");
			}
	
			//★★★★ロック
			XBOX360_LockVideo(true);
	
			//■定義「メッセージウインドウ作成」
			if(!$DialogLoadCheck_Flag){
				if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
					//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
					CreateName("MSGWND");
				}else{
					//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
					CreateName("MSGWND");
				}
			}
	
			$DialogText01="ＮＯ "+$num+" のデータが破損しています";
			$DialogText02="該当のセーブデータは使用不可能です";
			$DialogText03="削除してもよろしいですか？";

			//▲画像ロード
			LoadImage("MSGWND/IMG_yes_on","cg/sys/dialog/yes-002.png");
			LoadImage("MSGWND/IMG_yes_off","cg/sys/dialog/yes-001.png");
			LoadImage("MSGWND/IMG_no_on","cg/sys/dialog/no-002.png");
			LoadImage("MSGWND/IMG_no_off","cg/sys/dialog/no-001.png");
		
			//■定義「背景」
			if(!$DialogLoadCheck_Flag){
				CreateTexture("MSGWND/MSG_bak",1010000,0,0,"cg/sys/dialog/ダイアログkeep-out.png");
			}
	
			//■定義「選択肢」
			//box
			CreateTexture("MSGWND/MSG_msg",1010000,350,230,"cg/sys/dialog/ダイアログ台座.png");
			//text
			SetFont("ＭＳ ゴシック", 18, FFFFFF, 000000, MEDIUM, NULL);
			CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
			CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
			CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
			//YES
			CreateChoice("MSGWND/MSG_yes");
			CreateTexture("MSGWND/MSG_yes/MouseUsual/img",1012000,450,360,"MSGWND/IMG_yes_off");
			CreateTexture("MSGWND/MSG_yes/MouseOver/img",1011000,450,360,"MSGWND/IMG_yes_on");
			CreateTexture("MSGWND/MSG_yes/MouseClick/img",1011000,450,360,"MSGWND/IMG_yes_on");
			//NO
			CreateChoice("MSGWND/MSG_no");
			CreateTexture("MSGWND/MSG_no/MouseUsual/img",1012000,650,360,"MSGWND/IMG_no_off");
			CreateTexture("MSGWND/MSG_no/MouseOver/img",1011000,650,360,"MSGWND/IMG_no_on");
			CreateTexture("MSGWND/MSG_no/MouseClick/img",1011000,650,360,"MSGWND/IMG_no_on");
		
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
			if($DialogLoadCheck_Flag){
				Fade("MSGWND/MSG_*/*/*",0,0,null,false);
				Fade("MSGWND/MSG_msg",0,0,null,false);
				Fade("MSGWND/MSG_text*",0,0,null,false);
				Move("MSGWND/MSG_*/*/*",0,@0,@-8,null,false);
				Move("MSGWND/MSG_msg",0,@0,@-8,null,false);
				Move("MSGWND/MSG_text*", 0, @0, @-8, null, true);
				Request("MSGWND/MSG_text*", NoLog);
				Request("MSGWND/MSG_text*", PushText);
			}else{
				Fade("MSGWND/MSG_*",0,0,null,false);
				Fade("MSGWND/MSG_*/*/*",0,0,null,false);
				Move("MSGWND/MSG_*/*/*",0,@0,@-8,null,false);
				Move("MSGWND/MSG_msg",0,@0,@-8,null,false);
				Move("MSGWND/MSG_text*", 0, @0, @-8, null, true);
				Request("MSGWND/MSG_text*", NoLog);
				Request("MSGWND/MSG_text*", PushText);
			}

			//●文字位置調整
		//	Move("MSGWND/MSG_text1", 0, @15, @-45, null, true);
		//	Move("MSGWND/MSG_text1", 0, @15, @-60, null, true);
		//	Move("MSGWND/MSG_text2", 0, @15, @-30, null, true);
			Move("MSGWND/MSG_text1", 0, @12, @-49, null, true);
			Move("MSGWND/MSG_text2", 0, @12, @-28, null, true);
			Move("MSGWND/MSG_text3", 0, @12, @-9, null, true);
	
			//★★★★アンロック
			XBOX360_LockVideo(false);
	
			//★描画開始
			Fade("MSGWND/MSG_bak",200,1000,null,false);
			Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
			Move("MSGWND/MSG_msg",300,@0,@8,null,false);
			Move("MSGWND/MSG_text*",300,@0,@8,null,false);
			Fade("MSGWND/MSG_*",300,1000,null,false);
			Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);
	
			WaitAction("MSGWND/MSG_*",null);
		
			MoveCursor(740,380);
			$DialogLoadCheck_Flag=true;
		
			$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
			select{
				if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){break;}
		
				case MSGWND/MSG_no{
					$savedelete=false
				}case MSGWND/MSG_yes{
					$savedelete=true;
				}
		
				if($SYSTEM_menu_close_enable){
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
			$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	
			if($savedelete){
				Fade("MSGWND/MSG_msg",200,0,null,false);
				Fade("MSGWND/MSG_text*",200,0,null,false);
				Fade("MSGWND/MSG_*/*/*",100,0,null,false);
				Move("MSGWND/MSG_msg",300,@0,@8,null,false);
				Move("MSGWND/MSG_text*",300,@0,@8,null,false);
				Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
				WaitAction("MSGWND/MSG_*",null);
		
				Delete("MSGWND/*/*/*");
				Delete("MSGWND/*/*");
				Delete("MSGWND/MSG_yes*");
				Delete("MSGWND/MSG_no*");
				Delete("MSGWND/MSG_text*");
				Delete("MSGWND/MSG_msg");
	
				//★★★★ロック
				XBOX360_LockVideo(true);
	
				$DialogText01="消去しています";
				$DialogText02="本体の電源を切らないで下さい";
			//	$DialogText03="";
			
				//■定義「選択肢」
				//box
				CreateTexture("MSGWND/MSG_msg",1010000,350,230,"cg/sys/dialog/ダイアログ台座2.png");
				//text
				SetFont("ＭＳ ゴシック", 21, FFFFFF, 000000, MEDIUM, NULL);
				CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
				CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
			//	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
			
				//●最終準備
				Fade("MSGWND/MSG_*/*/*",0,0,null,false);
				Fade("MSGWND/MSG_msg",0,0,null,false);
				Fade("MSGWND/MSG_text*",0,0,null,false);
				Move("MSGWND/MSG_*/*/*",0,@0,@-8,null,false);
				Move("MSGWND/MSG_msg",0,@0,@-8,null,false);
				Move("MSGWND/MSG_text*", 0, @0, @-8, null, true);
				Request("MSGWND/MSG_text*", NoLog);
				Request("MSGWND/MSG_text*", PushText);
			
				//●文字位置調整
			//	Move("MSGWND/MSG_text1", 0, @15, @-25, null, true);
				Move("MSGWND/MSG_text1", 0, @12, @-30, null, true);
				Move("MSGWND/MSG_text2", 0, @12, @-6, null, true);
			//	Move("MSGWND/MSG_text1", 0, @15, @-50, null, true);
			//	Move("MSGWND/MSG_text2", 0, @15, @-24, null, true);
			//	Move("MSGWND/MSG_text3", 0, @15, @0, null, true);
			
				//★★★★アンロック
				XBOX360_LockVideo(false);
			
				//★描画開始
				Fade("MSGWND/MSG_bak",200,1000,null,false);
				Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
				Move("MSGWND/MSG_msg",300,@0,@8,null,false);
				Move("MSGWND/MSG_text*",300,@0,@8,null,false);
				Fade("MSGWND/MSG_*",300,1000,null,false);
				Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);
			
				WaitAction("MSGWND/MSG_*",null);
	
				if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
	
				//★個別ファイル削除
				if(#LATEST_SAVE_NUM==$num){
					#LATEST_SAVE_NUM=false;
					Move("NEW",0,1280,1280,null,false);
				}

				$SaveON=false;
				SaveDataDelete2();
				DeleteSaveFile($num);
				GetTime();
				Save(0);
				$savedelete=false;
				$loadbreak=true;
				Wait(1500);
			}
			$load=false;
		}
	}
}


function SaveDataDelete2()
{
	if($num==1){
		#SaveNumber1=false;
	}else if($num==2){
		#SaveNumber2=false;
	}else if($num==3){
		#SaveNumber3=false;
	}else if($num==4){
		#SaveNumber4=false;
	}else if($num==5){
		#SaveNumber5=false;
	}else if($num==6){
		#SaveNumber6=false;
	}else if($num==7){
		#SaveNumber7=false;
	}else if($num==8){
		#SaveNumber8=false;
	}else if($num==9){
		#SaveNumber9=false;
	}else if($num==10){
		#SaveNumber10=false;
	}else if($num==11){
		#SaveNumber11=false;
	}else if($num==12){
		#SaveNumber12=false;
	}else if($num==13){
		#SaveNumber13=false;
	}else if($num==14){
		#SaveNumber14=false;
	}else if($num==15){
		#SaveNumber15=false;
	}else if($num==16){
		#SaveNumber16=false;
	}else if($num==17){
		#SaveNumber17=false;
	}else if($num==18){
		#SaveNumber18=false;
	}else if($num==19){
		#SaveNumber19=false;
	}else if($num==20){
		#SaveNumber20=false;
	}else if($num==21){
		#SaveNumber21=false;
	}else if($num==22){
		#SaveNumber22=false;
	}else if($num==23){
		#SaveNumber23=false;
	}else if($num==24){
		#SaveNumber24=false;
	}else if($num==25){
		#SaveNumber25=false;
	}else if($num==26){
		#SaveNumber26=false;
	}else if($num==27){
		#SaveNumber27=false;
	}else if($num==28){
		#SaveNumber28=false;
	}else if($num==29){
		#SaveNumber29=false;
	}else if($num==30){
		#SaveNumber30=false;
	}else if($num==31){
		#SaveNumber31=false;
	}else if($num==32){
		#SaveNumber32=false;
	}else if($num==33){
		#SaveNumber33=false;
	}else if($num==34){
		#SaveNumber34=false;
	}else if($num==35){
		#SaveNumber35=false;
	}else if($num==36){
		#SaveNumber36=false;
	}else if($num==37){
		#SaveNumber37=false;
	}else if($num==38){
		#SaveNumber38=false;
	}else if($num==39){
		#SaveNumber39=false;
	}else if($num==40){
		#SaveNumber40=false;
	}else if($num==41){
		#SaveNumber41=false;
	}else if($num==42){
		#SaveNumber42=false;
	}else if($num==43){
		#SaveNumber43=false;
	}else if($num==44){
		#SaveNumber44=false;
	}else if($num==45){
		#SaveNumber45=false;
	}else if($num==46){
		#SaveNumber46=false;
	}else if($num==47){
		#SaveNumber47=false;
	}else if($num==48){
		#SaveNumber48=false;
	}else if($num==49){
		#SaveNumber49=false;
	}else if($num==50){
		#SaveNumber50=false;
	}else if($num==51){
		#SaveNumber51=false;
	}else if($num==52){
		#SaveNumber52=false;
	}else if($num==53){
		#SaveNumber53=false;
	}else if($num==54){
		#SaveNumber54=false;
	}else if($num==55){
		#SaveNumber55=false;
	}else if($num==56){
		#SaveNumber56=false;
	}else if($num==57){
		#SaveNumber57=false;
	}else if($num==58){
		#SaveNumber58=false;
	}else if($num==59){
		#SaveNumber59=false;
	}else if($num==60){
		#SaveNumber60=false;
	}else if($num==61){
		#SaveNumber61=false;
	}else if($num==62){
		#SaveNumber62=false;
	}else if($num==63){
		#SaveNumber63=false;
	}else if($num==64){
		#SaveNumber64=false;
	}else if($num==65){
		#SaveNumber65=false;
	}else if($num==66){
		#SaveNumber66=false;
	}else if($num==67){
		#SaveNumber67=false;
	}else if($num==68){
		#SaveNumber68=false;
	}else if($num==69){
		#SaveNumber69=false;
	}else if($num==70){
		#SaveNumber70=false;
	}else if($num==71){
		#SaveNumber71=false;
	}else if($num==72){
		#SaveNumber72=false;
	}else if($num==73){
		#SaveNumber73=false;
	}else if($num==74){
		#SaveNumber74=false;
	}else if($num==75){
		#SaveNumber75=false;
	}else if($num==76){
		#SaveNumber76=false;
	}else if($num==77){
		#SaveNumber77=false;
	}else if($num==78){
		#SaveNumber78=false;
	}else if($num==79){
		#SaveNumber79=false;
	}else if($num==80){
		#SaveNumber80=false;
	}else if($num==81){
		#SaveNumber81=false;
	}else if($num==82){
		#SaveNumber82=false;
	}else if($num==83){
		#SaveNumber83=false;
	}else if($num==84){
		#SaveNumber84=false;
	}else if($num==85){
		#SaveNumber85=false;
	}else if($num==86){
		#SaveNumber86=false;
	}else if($num==87){
		#SaveNumber87=false;
	}else if($num==88){
		#SaveNumber88=false;
	}else if($num==89){
		#SaveNumber89=false;
	}else if($num==90){
		#SaveNumber90=false;
	}else if($num==91){
		#SaveNumber91=false;
	}else if($num==92){
		#SaveNumber92=false;
	}else if($num==93){
		#SaveNumber93=false;
	}else if($num==94){
		#SaveNumber94=false;
	}else if($num==95){
		#SaveNumber95=false;
	}else if($num==96){
		#SaveNumber96=false;
	}else if($num==97){
		#SaveNumber97=false;
	}else if($num==98){
		#SaveNumber98=false;
	}else if($num==99){
		#SaveNumber99=false;
	}else if($num==100){
		#SaveNumber100=false;
	}else if($num==101){
		#SaveNumber101=false;
	}else if($num==102){
		#SaveNumber102=false;
	}else if($num==103){
		#SaveNumber103=false;
	}else if($num==104){
		#SaveNumber104=false;
	}else if($num==105){
		#SaveNumber105=false;
	}else if($num==106){
		#SaveNumber106=false;
	}else if($num==107){
		#SaveNumber107=false;
	}else if($num==108){
		#SaveNumber108=false;
	}else if($num==109){
		#SaveNumber109=false;
	}else if($num==110){
		#SaveNumber110=false;
	}else if($num==111){
		#SaveNumber111=false;
	}else if($num==112){
		#SaveNumber112=false;
	}else if($num==113){
		#SaveNumber113=false;
	}else if($num==114){
		#SaveNumber114=false;
	}else if($num==115){
		#SaveNumber115=false;
	}else if($num==116){
		#SaveNumber116=false;
	}else if($num==117){
		#SaveNumber117=false;
	}else if($num==118){
		#SaveNumber118=false;
	}else if($num==119){
		#SaveNumber119=false;
	}else if($num==120){
		#SaveNumber120=false;
	}
}

//=============================================================================//
.☆【警告】タイトルラストセーブ：セーブデータがありません
//=============================================================================//
function DialogLoadLastNo()
{
	//★タイトルフラッシュ停止
	$FlashFade = 0;
	Request("タイトル背景プロセス", Stop);

	//★★★★ロック
	XBOX360_LockVideo(true);

	//■定義「メッセージウインドウ作成」
	if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}else{
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}

	$DialogCase="７";

	$DialogText01="セーブデータが存在しません";
//	$DialogText02="保存するには最低" + $DialogCase + "ＭＢの空き容量が必要です";
//	$DialogText03="";

	//■定義「背景」
	CreateTexture("MSGWND/MSG_bak",1010000,0,0,"cg/sys/dialog/ダイアログkeep-out.png");

	//■定義「選択肢」
	//box
	CreateTexture("MSGWND/MSG_msg",1010000,350,230,"cg/sys/dialog/ダイアログ台座2.png");
	//text
	SetFont("ＭＳ ゴシック", 21, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
//	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
//	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);

	//●最終準備
	Fade("MSGWND/MSG_*",0,0,null,false);
	Fade("MSGWND/MSG_*/*/*",0,0,null,false);
	Move("MSGWND/MSG_*/*/*",0,@0,@-8,null,false);
	Move("MSGWND/MSG_msg",0,@0,@-8,null,false);
	Move("MSGWND/MSG_text*", 0, @0, @-8, null, true);
	Request("MSGWND/MSG_text*", NoLog);
	Request("MSGWND/MSG_text*", PushText);

	//●文字位置調整
	Move("MSGWND/MSG_text1", 0, @12, @-18, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-40, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-10, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-50, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-24, null, true);
//	Move("MSGWND/MSG_text3", 0, @15, @0, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	//★描画開始
	Fade("MSGWND/MSG_bak",200,1000,null,false);
	Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
	Move("MSGWND/MSG_msg",300,@0,@8,null,false);
	Move("MSGWND/MSG_text*",300,@0,@8,null,false);
	Fade("MSGWND/MSG_*",300,1000,null,false);
	Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);

	WaitAction("MSGWND/MSG_*",null);

	//★タイトルフラッシュ再開
	Request("タイトル背景プロセス", Start);

	$SYSTEM_XBOX360_button_a_down=false;
	if(Platform()==100){
		select{
			if($SYSTEM_XBOX360_button_a_down){break;}
		}
	}else{
		WaitKey();
	}
	$SYSTEM_XBOX360_button_a_down=false;

	Fade("MSGWND/MSG_*",200,0,null,false);
	Fade("MSGWND/MSG_*/*/*",100,0,null,false);
	Move("MSGWND/MSG_msg",300,@0,@8,null,false);
	Move("MSGWND/MSG_text*",300,@0,@8,null,false);
	WaitAction("MSGWND/MSG_*",null);

	Delete("MSGWND/*/*/*");
	Delete("MSGWND/*/*");
	Delete("MSGWND/*");
	Delete("MSGWND");
}

//=============================================================================//
.☆【警告】汎用：データの保存場所を選択して下さい
//=============================================================================//
function DialogCautionStorage()
{
	//★定義「ストレージ番号取得」
	FlagCheck();

	//★★★★ロック
	XBOX360_LockVideo(true);

	//■定義「ビデオ設置」
	if(!$SYSTEM_menu_config_enable&&!$SYSTEM_menu_save_enable&&!$SYSTEM_menu_load_enable&&!$SYSTEM_menu_enable&&!$SYSTEM_backlog_enable){
//		CreateTexture("video", 1010000, center, middle, "VIDEO");
	}

	//■定義「メッセージウインドウ作成」
	if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}else{
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}

	$DialogCase="７";

	$DialogText01="データの保存場所を選択して下さい";
	$DialogText02="保存するには最低" + $DialogCase + "ＭＢの空き容量が必要です";
//	$DialogText03="";

	//■定義「背景」
	CreateTexture("MSGWND/MSG_bak",1010000,0,0,"cg/sys/dialog/ダイアログkeep-out.png");

	//■定義「選択肢」
	//box
	CreateTexture("MSGWND/MSG_msg",1010000,350,230,"cg/sys/dialog/ダイアログ台座2.png");
	//text
	SetFont("ＭＳ ゴシック", 21, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
//	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);

	//●最終準備
	Fade("MSGWND/MSG_*",0,0,null,false);
	Fade("MSGWND/MSG_*/*/*",0,0,null,false);
	Move("MSGWND/MSG_*/*/*",0,@0,@-8,null,false);
	Move("MSGWND/MSG_msg",0,@0,@-8,null,false);
	Move("MSGWND/MSG_text*", 0, @0, @-8, null, true);
	Request("MSGWND/MSG_text*", NoLog);
	Request("MSGWND/MSG_text*", PushText);

	//●文字位置調整
//	Move("MSGWND/MSG_text1", 0, @15, @-25, null, true);
	Move("MSGWND/MSG_text1", 0, @12, @-30, null, true);
	Move("MSGWND/MSG_text2", 0, @12, @-6, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-50, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-24, null, true);
//	Move("MSGWND/MSG_text3", 0, @15, @0, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	//★描画開始
	Fade("MSGWND/MSG_bak",200,1000,null,false);
	Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
	Move("MSGWND/MSG_msg",300,@0,@8,null,false);
	Move("MSGWND/MSG_text*",300,@0,@8,null,false);
	Fade("MSGWND/MSG_*",300,1000,null,false);
	Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);

	WaitAction("MSGWND/MSG_*",null);

	if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
	$SYSTEM_XBOX360_button_a_down=false;
	if(Platform()==100){
		select{
			if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
			if($SYSTEM_XBOX360_button_a_down){break;}
		}
	}else{
		WaitKey();
	}
	$SYSTEM_XBOX360_button_a_down=false;

	Fade("MSGWND/MSG_*",200,0,null,false);
	Fade("MSGWND/MSG_*/*/*",100,0,null,false);
	Move("MSGWND/MSG_msg",300,@0,@8,null,false);
	Move("MSGWND/MSG_text*",300,@0,@8,null,false);
	WaitAction("MSGWND/MSG_*",null);

	Delete("MSGWND/*/*/*");
	Delete("MSGWND/*/*");
	Delete("MSGWND/*");
	Delete("MSGWND");
}



//=============================================================================//
.☆【警告】汎用：サインインしていない
//=============================================================================//
function DialogCautionSignIn()
{
	if($PLACE_title){
		//★タイトルフラッシュ停止
		$FlashFade = 0;
		Request("タイトル背景プロセス", Stop);
	}

	//★定義「ストレージ番号取得」
	FlagCheck();

	//★★★★ロック
	XBOX360_LockVideo(true);

	//■定義「ビデオ設置」
	if(!$SYSTEM_menu_config_enable&&!$SYSTEM_menu_save_enable&&!$SYSTEM_menu_load_enable&&!$SYSTEM_menu_enable&&!$SYSTEM_backlog_enable){
//		CreateTexture("video", 1010000, center, middle, "VIDEO");
	}

	//■定義「メッセージウインドウ作成」
	if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}else{
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}


	$DialogText01="サインインしていません";
//	$DialogText02="この状態ではデータを保存できません";
//	$DialogText03="このままゲームを開始しますか？";


	//■定義「背景」
	CreateTexture("MSGWND/MSG_bak",1010000,0,0,"cg/sys/dialog/ダイアログkeep-out.png");

	//■定義「選択肢」
	//box
	CreateTexture("MSGWND/MSG_msg",1010000,350,230,"cg/sys/dialog/ダイアログ台座2.png");
	//text
	SetFont("ＭＳ ゴシック", 21, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
//	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
//	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);

	//●最終準備
	Fade("MSGWND/MSG_*",0,0,null,false);
	Fade("MSGWND/MSG_*/*/*",0,0,null,false);
	Move("MSGWND/MSG_*/*/*",0,@0,@-8,null,false);
	Move("MSGWND/MSG_msg",0,@0,@-8,null,false);
	Move("MSGWND/MSG_text*", 0, @0, @-8, null, true);
	Request("MSGWND/MSG_text*", NoLog);
	Request("MSGWND/MSG_text*", PushText);

	//●文字位置調整
	Move("MSGWND/MSG_text1", 0, @12, @-18, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-40, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-10, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-50, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-24, null, true);
//	Move("MSGWND/MSG_text3", 0, @15, @0, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	//★描画開始
	Fade("MSGWND/MSG_bak",200,1000,null,false);
	Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
	Move("MSGWND/MSG_msg",300,@0,@8,null,false);
	Move("MSGWND/MSG_text*",300,@0,@8,null,false);
	Fade("MSGWND/MSG_*",300,1000,null,false);
	Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);

	WaitAction("MSGWND/MSG_*",null);

	if($PLACE_title){
		//★タイトルフラッシュ再開
		Request("タイトル背景プロセス", Start);
	}

	if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
	$SYSTEM_XBOX360_button_a_down=false;
	if(Platform()==100){
		select{
			if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
			if($SYSTEM_XBOX360_button_a_down){break;}
		}
	}else{
		WaitKey();
	}
	$SYSTEM_XBOX360_button_a_down=false;

	Fade("MSGWND/MSG_*",200,0,null,false);
	Fade("MSGWND/MSG_*/*/*",100,0,null,false);
	Move("MSGWND/MSG_msg",300,@0,@8,null,false);
	Move("MSGWND/MSG_text*",300,@0,@8,null,false);
	WaitAction("MSGWND/MSG_*",null);

	Delete("MSGWND/*/*/*");
	Delete("MSGWND/*/*");
	Delete("MSGWND/*");
	Delete("MSGWND");
}


//=============================================================================//
.☆【警告】汎用：ストレージ機器が選択されてない
//=============================================================================//
function DialogCautionLoad()
{
	if($PLACE_title){
		//★タイトルフラッシュ停止
		$FlashFade = 0;
		Request("タイトル背景プロセス", Stop);
	}

	//★定義「ストレージ番号取得」
	FlagCheck();

	//★★★★ロック
	XBOX360_LockVideo(true);

	//■定義「ビデオ設置」
	if(!$SYSTEM_menu_config_enable&&!$SYSTEM_menu_save_enable&&!$SYSTEM_menu_load_enable&&!$SYSTEM_menu_enable&&!$SYSTEM_backlog_enable){
//		CreateTexture("video", 1010000, center, middle, "VIDEO");
	}

	//■定義「メッセージウインドウ作成」
	if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}else{
		//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
		CreateName("MSGWND");
	}

	$DialogText01="データの保存場所が選択されていません";
	$DialogText02="ＣＯＮＦＩＧからストレージ変更を選択して下さい";
//	$DialogText03="環境設定からストレージ機器を選択して下さい";

	//■定義「背景」
	CreateTexture("MSGWND/MSG_bak",1010000,0,0,"cg/sys/dialog/ダイアログkeep-out.png");

	//■定義「選択肢」
	//box
	CreateTexture("MSGWND/MSG_msg",1010000,350,230,"cg/sys/dialog/ダイアログ台座2.png");
	//text
	SetFont("ＭＳ ゴシック", 24, FFFFFF, 000000, MEDIUM, NULL);
	CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
	CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
//	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);

	//●最終準備
	Fade("MSGWND/MSG_*",0,0,null,false);
	Fade("MSGWND/MSG_*/*/*",0,0,null,false);
	Move("MSGWND/MSG_*/*/*",0,@0,@-8,null,false);
	Move("MSGWND/MSG_msg",0,@0,@-8,null,false);
	Move("MSGWND/MSG_text*", 0, @0, @-8, null, true);
	Request("MSGWND/MSG_text*", NoLog);
	Request("MSGWND/MSG_text*", PushText);

	//●文字位置調整
//	Move("MSGWND/MSG_text1", 0, @15, @-25, null, true);
	Move("MSGWND/MSG_text1", 0, @12, @-30, null, true);
	Move("MSGWND/MSG_text2", 0, @12, @-6, null, true);
//	Move("MSGWND/MSG_text1", 0, @15, @-50, null, true);
//	Move("MSGWND/MSG_text2", 0, @15, @-24, null, true);
//	Move("MSGWND/MSG_text3", 0, @15, @0, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	//★描画開始
	Fade("MSGWND/MSG_bak",200,1000,null,false);
	Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
	Move("MSGWND/MSG_msg",300,@0,@8,null,false);
	Move("MSGWND/MSG_text*",300,@0,@8,null,false);
	Fade("MSGWND/MSG_*",300,1000,null,false);
	Fade("MSGWND/MSG_*/MouseUsual/*",200,1000,null,false);

	WaitAction("MSGWND/MSG_*",null);

	if($PLACE_title){
		//★タイトルフラッシュ許可
		Request("タイトル背景プロセス", Start);
	}

	if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
	$SYSTEM_XBOX360_button_a_down=false;
	if(Platform()==100){
		select{
			if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
			if($SYSTEM_XBOX360_button_a_down){break;}
		}
	}else{
		WaitKey();
	}
	$SYSTEM_XBOX360_button_a_down=false;

	Fade("MSGWND/MSG_*",200,0,null,false);
	Fade("MSGWND/MSG_*/*/*",100,0,null,false);
	Move("MSGWND/MSG_msg",300,@0,@8,null,false);
	Move("MSGWND/MSG_text*",300,@0,@8,null,false);
	WaitAction("MSGWND/MSG_*",null);

	Delete("MSGWND/*/*/*");
	Delete("MSGWND/*/*");
	Delete("MSGWND/*");
	Delete("MSGWND");
}

//=============================================================================//
.☆【警告】汎用：ユーザー情報異常有り
//=============================================================================//
function DialogChangeState()
{
	if(!$PLACE_title){
		$SYSTEM_XBOX360_change_user_state=false;
		if(XBOX360_CurrentStorage()!=$StrageFlag){
		    //ストレージ情報
			$DialogChangeState_Flag=true;
			Fade("MSGWND/MSG_*/*/*", 100, 0, null, false);
			Fade("MSGWND/MSG_msg", 200, 0, null, false);
			Fade("MSGWND/MSG_text*", 200, 0, null, false);
			Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
			Move("MSGWND/MSG_msg",300,@0,@8,null,false);
			Move("MSGWND/MSG_text*", 300, @0, @8, null, true);
			WaitAction("MSGWND/MSG_*",null);

			call_chapter nss/sys_loststorage.nss;
		}else if(XBOX360_IsSignin()!=$SigninFlag){
		    //サインイン情報
			$DialogChangeState_Flag=true;
			Fade("MSGWND/MSG_*/*/*", 100, 0, null, false);
			Fade("MSGWND/MSG_msg", 200, 0, null, false);
			Fade("MSGWND/MSG_text*", 200, 0, null, false);
			Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
			Move("MSGWND/MSG_msg",300,@0,@8,null,false);
			Move("MSGWND/MSG_text*", 300, @0, @8, null, true);
			WaitAction("MSGWND/MSG_*",null);
	
			call_chapter nss/sys_signout.nss;
		}else if(XBOX360_UserIndex()!=$UserFlag){
		    //違うユーザーでサインインしました
			$DialogChangeState_Flag=true;
			Fade("MSGWND/MSG_*/*/*", 100, 0, null, false);
			Fade("MSGWND/MSG_msg", 200, 0, null, false);
			Fade("MSGWND/MSG_text*", 200, 0, null, false);
			Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
			Move("MSGWND/MSG_msg",300,@0,@8,null,false);
			Move("MSGWND/MSG_text*", 300, @0, @8, null, true);
			WaitAction("MSGWND/MSG_*",null);
	
			call_chapter nss/sys_signout.nss;
		}else{
		    //ユーザー情報
			$DialogChangeState_Flag=true;
			Fade("MSGWND/MSG_*/*/*", 100, 0, null, false);
			Fade("MSGWND/MSG_msg", 200, 0, null, false);
			Fade("MSGWND/MSG_text*", 200, 0, null, false);
			Move("MSGWND/MSG_*/*/*",300,@0,@8,null,false);
			Move("MSGWND/MSG_msg",300,@0,@8,null,false);
			Move("MSGWND/MSG_text*", 300, @0, @8, null, true);
			WaitAction("MSGWND/MSG_*",null);
	
			call_chapter nss/sys_information.nss;
		}
	}
}

function DialogChangeState2()
{
	if(!$PLACE_title){

		$SYSTEM_XBOX360_change_user_state=false;
		if(XBOX360_CurrentStorage()!=$StrageFlag){
		    //ストレージ情報
			$DialogChangeState_Flag2=true;
			call_chapter nss/sys_loststorage.nss;
		}else if(XBOX360_IsSignin()!=$SigninFlag){
		    //サインイン情報
			$DialogChangeState_Flag2=true;
			call_chapter nss/sys_signout.nss;
		}else if(XBOX360_UserIndex()!=$UserFlag){
		    //違うユーザーでサインインしました
			$DialogChangeState_Flag2=true;
			call_chapter nss/sys_signout.nss;
		}else{
		    //その他ユーザー情報
			$DialogChangeState_Flag2=true;
			call_chapter nss/sys_information.nss;
		}
	}
}

function FlagCheck()
{
	$StrageFlag=XBOX360_CurrentStorage();
	$SigninFlag=XBOX360_IsSignin();
	$UserFlag=XBOX360_UserIndex();
}


//=============================================================================//
.☆【警告】汎用：ロード中
//=============================================================================//
function LoadingStart()
{
	CreateTexture("ローディングスクリーン", 9999999, 0, 0, SCREEN);
	Fade("ローディングスクリーン", 0, 0, null, true);

//	CreateColor("ローディング色", 9999999, 0, 0, 1280, 720, "BLACK");
//	Fade("ローディング色", 0, 0, null, true);

	CreateTexture("ローディング画面", 9999999, 0, 593, "cg/sys/360/now-loding.png");
	SetAlias("ローディング画面", "ローディング画面");
	Fade("ローディング画面", 0, 0, null, true);
//	Request("ローディング画面", AddRender);

	Fade("ローディングスクリーン", 100, 1000, null, true);
//	Fade("ローディング色", 300, 600, null, true);

	CreateProcess("ローディングプロセス", 100, 0, 0, "LoadingProcess");
	Request("ローディングプロセス", Start);
}

function LoadingProcess()
{
	while(1){
		Fade("@ローディング画面", 1000, 1000, null, true);
		Wait(1000);
		Fade("@ローディング画面", 1000, 0, null, true);
	}
}

function LoadingEnd()
{
	Request("ローディングプロセス", Stop);
	WaitAction("ローディングプロセス", null);

	Fade("ローディング画面", 200, 0, null, true);

	Fade("ローディングスクリーン", 300, 0, null, false);
	Fade("ローディング色", 300, 0, null, true);

	Delete("ローディング*");
}


//=============================================================================//
.☆【警告】汎用：セーブ中
//=============================================================================//
function SavingStart()
{
	if(XBOX360_IsSignin()){
	    //サインインしている
		if(XBOX360_CheckStorage()){
		    //ストレージ選択済み
			CreateTexture("読み込み中", 9999999, 0, 605, "cg/sys/360/now-saving.png");
			Fade("読み込み中", 0, 0, null, true);
			Fade("読み込み中", 500, 1000, null, false);
			GetTime();
			Save(0);
			Wait(1300);
			Fade("読み込み中", 500, 0, null, true);
			Delete("読み込み中");
			Wait(32);
		}else if($ConfigSave){
		    //ユーザーコンテント作成
			CreateTexture("読み込み中", 9999999, 0, 605, "cg/sys/360/now-saving.png");
			Fade("読み込み中", 0, 0, null, true);
			Fade("読み込み中", 500, 1000, null, false);
			GetTime();
			Save(0);
			Wait(1300);
			Fade("読み込み中", 500, 0, null, true);
			Delete("読み込み中");
			Wait(32);
		}
		$ConfigSave=false;
	}
}

function GetTime()
{
	//●総プレイ時間：合計
	#ALL_PLAY_TIME+=(Time()-#BEGIN_TIME);
	//●総プレイ時間：計測開始
	#BEGIN_TIME = Time();
}


//=============================================================================//
.▲【解説】汎用：定義
//=============================================================================//
function DialogButtonON($ButtonName)
{
	if($ButtonName=="Button_CG"){
		$ButtonData="cg/sys/button/ＣＧライブラリ.png";
		$画像優先度=1300;
	}else if($ButtonName=="Button_SOUND"){
		$ButtonData="cg/sys/button/サウンドライブラリ.png";
		$画像優先度=1300;
	}else if($ButtonName=="Button_TIPS"){
		$ButtonData="cg/sys/button/ＴＩＰＳ.png";
		$画像優先度=3001;
	}else if($ButtonName=="Button_ACI"){
		$ButtonData="cg/sys/button/実績.png";
		$画像優先度=1300;
	}else if($ButtonName=="Button_EX"){
		$ButtonData="cg/sys/button/エキストラメイン.png";
		$画像優先度=1300;
	}else if($ButtonName=="Button_KRT"){
		$ButtonData="cg/sys/button/カルテ.png";
		$画像優先度=10100;
	}else if($ButtonName=="Button_SAVE"){
		$ButtonData="cg/sys/button/セーブロード.png";
		$画像優先度=10100;
	}else if($ButtonName=="Button_LOG"){
		$ButtonData="cg/sys/button/バックログ.png";
		$画像優先度=10100;
	}else if($ButtonName=="Button_CONFIG"){
		$ButtonData="cg/sys/button/コンフィグ.png";
		$画像優先度=10100;
	}



	CreateTexture($ButtonName, $画像優先度, 0, 720, $ButtonData);
	Fade($ButtonName, 0, 0, null, true);
}

//=============================================================================//
.▲【解説】汎用：出現
//=============================================================================//
function DialogButtonFade($ButtonName)
{
	Move($ButtonName, 300, @0, @-85, null, false);
	Fade($ButtonName, 300, 1000, null, true);
}

function DialogButtonFade2($ButtonName)
{
	Move($ButtonName, 0, @0, @-85, null, false);
	Fade($ButtonName, 0, 1000, null, true);
}

function DialogButtonFade3($ButtonName)
{
	Move($ButtonName, 300, @0, @-85, null, false);
	Fade($ButtonName, 300, 1000, null, false);
}

//=============================================================================//
.▲【解説】汎用：退去
//=============================================================================//
function DialogButtonOFF($ButtonName)
{
	Move($ButtonName, 300, @0, @85, null, false);
	Fade($ButtonName, 300, 0, null, true);
}

function DialogButtonOFF2($ButtonName)
{
	Move($ButtonName, 0, @0, @85, null, false);
	Fade($ButtonName, 0, 0, null, true);
}

function DialogButtonOFF3($ButtonName)
{
	Move($ButtonName, 300, @0, @85, null, false);
	Fade($ButtonName, 300, 0, null, false);
}



