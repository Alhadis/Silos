#include "nss/function_system.nss"

//=============================================================================//
//■セーブ■
//=============================================================================//
chapter main
{
	//★定義「ストレージ番号取得」
	FlagCheck();

	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;

	$save_next=true;
	#SYSTEM_save_thumbnail_width=128;
	#SYSTEM_save_thumbnail_height=72;

	$SaveButton=true;

//	CreateWindow("WND",10100,0,0,1280,720,true);
	CreateName("WND");
	SetAlias("WND","WND");

	LoadColor("col_black",1280,720,BLACK);
	CreateTexture("WND/fade_black",20000,center,middle,"col_black");
	SetAlias("WND/fade_black","fade_black");
	Fade("@fade_black",0,0,null,false);

	if(!$SYSTEM_menu_enable){
		CreateTexture("video",20000,center,middle,"VIDEO");
		SetAlias("video","save-video");
	}else{
		CreateTexture("video",20000,center,middle,SCREEN);
		SetAlias("video","save-video");
	}

	//■確認：サインインしていません
	//★ダイアログ：サインイン確認
	if(Platform()==100){
		if(XBOX360_IsSignin()){
			if(XBOX360_CheckStorage()){
			}else{
				DialogCautionLoad();
				return;
			}
		}else{
			DialogCautionSignIn();
			return;
		}
	}

	//★★★★ロック
	XBOX360_LockVideo(true);

	SetFont("ＭＳ ゴシック",18,#FFFFFF,#000000,500,null);

/*
	LoadFont("フォント１Ａ", "ＭＳ ゴシック", 18, #FFFFFF, #000000, 500, null, "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをんがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽぁぃぅぇぉっゃゅょアイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポァィゥェォッャュョ、。ー…！？―「」『』１２３４５６７８９０");
	LoadFont("フォント１Ｂ", "ＭＳ ゴシック", 18, #FFFFFF, #000000, 500, null, "一今日敵味方思分行時言聞見何人終好急");
	LoadFont("フォント１Ｃ", "ＭＳ ゴシック", 18, #FFFFFF, #000000, 500, null, "渋谷西條拓巳将軍梨深美優愛梢七海星来判諏訪波多野呂瀬猪鼻倉持百瀬葉月三住目死体貼付ＤＱＮ");
*/

	CreateTexture("BAK00",9999,center,middle,"cg/sys/save/背景.png");
	CreateTexture("LOGO1",10000,Center,OutTop,"cg/sys/save/上帯.png");
	CreateTexture("LOGO2",10000,Center,400,"cg/sys/save/下帯SAVE.png");
	Fade("LOGO*",0,0,null,false);

	//■定義「ボタン説明」
	DialogButtonON("Button_SAVE");

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Fade("@save-video",300,0,null,true);

	Wait(300);

	Fade("LOGO*",500,1000,null,false);
	Move("LOGO1",500,0,0,Dxl2,false);
	Move("LOGO2",500,0,0,Dxl2,false);
	WaitAction("LOGO*",null);

	CreateTexture("BAK0",10000,center,middle,SCREEN);
	Draw();
	Delete("LOGO*");
	Delete("BAK00");

//	CreateTexture("LOGO",10001,58,13,"cg/sys/save/セーブタイトル.png");
//	Fade("LOGO",0,0,null,false);
//	Fade("LOGO",1000,1000,null,false);

	//★★★★ロック
	XBOX360_LockVideo(true);

	if(#save_page==1){
		CreateTexture("BAK1",10001,center,middle,"cg/sys/save/NO-001.png");
		SetAlias("BAK1","save-bak1");
	}else if(#save_page==2){
		CreateTexture("BAK2",10000,center,middle,"cg/sys/save/NO-002.png");
		SetAlias("BAK2","save-bak2");
	}else if(#save_page==3){
		CreateTexture("BAK3",10000,center,middle,"cg/sys/save/NO-003.png");
		SetAlias("BAK3","save-bak3");
	}else if(#save_page==4){
		CreateTexture("BAK4",10000,center,middle,"cg/sys/save/NO-004.png");
		SetAlias("BAK4","save-bak4");
	}else if(#save_page==5){
		CreateTexture("BAK5",10000,center,middle,"cg/sys/save/NO-005.png");
		SetAlias("BAK5","save-bak5");
	}else if(#save_page==6){
		CreateTexture("BAK6",10000,center,middle,"cg/sys/save/NO-006.png");
		SetAlias("BAK6","save-bak6");
	}else if(#save_page==7){
		CreateTexture("BAK7",10000,center,middle,"cg/sys/save/NO-007.png");
		SetAlias("BAK7","save-bak7");
	}else if(#save_page==8){
		CreateTexture("BAK8",10000,center,middle,"cg/sys/save/NO-008.png");
		SetAlias("BAK8","save-bak8");
	}else if(#save_page==9){
		CreateTexture("BAK9",10000,center,middle,"cg/sys/save/NO-009.png");
		SetAlias("BAK9","save-bak9");
	}else if(#save_page==10){
		CreateTexture("BAK10",10000,center,middle,"cg/sys/save/NO-010.png");
		SetAlias("BAK10","save-bak10");
	}else{
		CreateTexture("BAK1",10001,center,middle,"cg/sys/save/NO-001.png");
		SetAlias("BAK1","save-bak1");
	}
	Fade("@save-bak*",0,0,null,false);

	LoadImage("no-data","cg/sys/save/サムネールNONE.png");
	SetAlias("no-data","no-data");

	LoadImage("no-data2","cg/sys/save/選択サムネールNONE2.png");
	SetAlias("no-data2","no-data2");

	LoadImage("h-text","cg/sys/save/文章先頭▲.png");
	SetAlias("h-text","h-text");

//	LoadImage("waku","cg/sys/save/サムネール選択中ワク.png");
//	SetAlias("waku","waku");

	CreateChoice("NEXT");
	LoadImage("NEXT_img","cg/sys/save/NEXT-002.png");
	CreateTexture("NEXT_btn",10010,883,482,"NEXT_img");
	CreateTexture("NEXT/MouseUsual/icon",10010,883,482,"cg/sys/save/NEXT-000.png");
	CreateTexture("NEXT/MouseOver/icon",10050,883,482,"cg/sys/save/NEXT-001.png");
	CreateTexture("NEXT/MouseClick/icon",10050,883,482,"cg/sys/save/NEXT-003.png");
	CreateChoice("BACK");
	LoadImage("BACK_img","cg/sys/save/BACK-002.png");
	CreateTexture("BACK_btn",10010,795,482,"BACK_img");
	CreateTexture("BACK/MouseUsual/icon",10010,795,482,"cg/sys/save/BACK-000.png");
	CreateTexture("BACK/MouseOver/icon",10050,795,482,"cg/sys/save/BACK-001.png");
	CreateTexture("BACK/MouseClick/icon",10050,795,482,"cg/sys/save/BACK-003.png");
//	CreateChoice("EXIT");
//	LoadImage("EXIT_img","cg/sys/save/エグジット01.png");
//	CreateTexture("EXIT_btn",10010,651,535,"EXIT_img");
//	CreateTexture("EXIT/MouseUsual/icon",10010,651,535,"EXIT_img");
//	CreateTexture("EXIT/MouseOver/icon",10050,651,535,"cg/sys/save/エグジット02.png");
//	CreateTexture("EXIT/MouseClick/icon",10050,651,535,"cg/sys/save/エグジット03.png");
	Request("NEXT/MouseUsual/icon", Erase);
	Request("BACK/MouseUsual/icon", Erase);

	CreateTexture("NEXTicon",10050,883,482,"cg/sys/save/NEXT-003.png");
	CreateTexture("BACKicon",10050,795,482,"cg/sys/save/BACK-003.png");

	CreateTexture("NEW",10050,1024,576,"cg/sys/save/NEW.png");
	Fade("NEW",0,0,null,false);
	
	Fade("NEXT*",0,0,null,false);
	Fade("BACK*",0,0,null,false);
	Fade("EXIT*",0,0,null,false);

	Fade("NEXT*/*/*",0,0,null,false);
	Fade("BACK*/*/*",0,0,null,false);
	Fade("EXIT*/*/*",0,0,null,false);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Fade("NEXT*",1000,1000,null,false);
	Fade("BACK*",1000,1000,null,false);
	Fade("EXIT*",1000,1000,null,false);

	Fade("NEXT*/*/*",1000,1000,null,false);
	Fade("BACK*/*/*",1000,1000,null,false);
	Fade("EXIT*/*/*",1000,1000,null,false);

	Fade("NEXTicon",0,0,null,false);
	Fade("BACKicon",0,0,null,false);

	if(#save_page!=1&&#save_page!=2&&#save_page!=3&&#save_page!=4&&#save_page!=5&&#save_page!=6&&#save_page!=7&&#save_page!=8&&#save_page!=9&&#save_page!=10){#save_page=1;}

	$SYSTEM_menu_save_enable=true;
	while($SYSTEM_menu_save_enable){
		savemanage();
	}

	//▲描画「ボタン説明」
	DialogButtonOFF3("Button_SAVE");

	Fade("@save-video",300,1000,null,true);

	$SYSTEM_menu_save_enable=false;
	$SYSTEM_r_button_down=false;
	$SYSTEM_XBOX360_button_b_down=false;
}


function savemanage()
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	Delete("@WND/savenum_*");

	$DialogSaveCheck_Flag=false;

	//★ZOOMバグ回避
	$zoombug10=false;
	$zoombug11=false;
	$zoombug12=false;

	if(#save_page==1){
		$i=1;$max=12;
	}else if(#save_page==2){
		$i=13;$max=24;
	}else if(#save_page==3){
		$i=25;$max=36;
	}else if(#save_page==4){
		$i=37;$max=48;
	}else if(#save_page==5){
		$i=49;$max=60;
	}else if(#save_page==6){
		$i=61;$max=72;
	}else if(#save_page==7){
		$i=73;$max=84;
	}else if(#save_page==8){
		$i=85;$max=96;
	}else if(#save_page==9){
		$i=97;$max=108;
	}else{
		$i=109;$max=120;
	}
	$x=80;
	$y=72;
	$j=1;
	Move("NEW",0,1024,1024,null,false);
	Fade("NEW",0,0,null,false);

	while($i<=$max){
		$name="savenum_"+$j;
		
		CreateChoice($name);
		SetAlias($name,$name);

		if($save_next){
			$save_move=1024;
			$save_move2=-1024;
		}else{
			$save_move=-1024;
			$save_move2=1024;
		}

		$num=$i;
		//★セーブデータチェック
		ExistDataCheck();
		if($SaveON){
			//1210
			if(Platform()==100){
				$save_zoom=1250;
				$save_zoom2=1500;
				$save_move3=9;
				$save_move+=16;
			}else{
				$save_zoom=1000;
				$save_zoom2=1212;
				$save_move3=0;
				$save_move+=0;
			}

			$no=String("%03d",$num); //ナンバー

			$img_data="@WND/"+$name+"_img";
			LoadImage($img_data,$img);
			
			$nut="@WND/"+$name+"_btn";
			CreateTexture($nut,10011,$x,$y,$img_data);
			Zoom($nut,0,$save_zoom,$save_zoom,null,false);
			$name="savenum_"+$j+"_btn";
			SetAlias($nut,$name);
			Move($nut,0,@$save_move,@$save_move3,null,false);
			Request($nut,Smoothing);
			
			$name="savenum_"+$j;
			$nut=$name+"/MouseUsual/icon";
			CreateTexture($nut,10010,$x,$y,$img_data);
			Zoom($nut,0,$save_zoom,$save_zoom,null,false);
			Move($nut,0,@$save_move,@$save_move3,null,false);
			Request($nut,Smoothing);
			$nut=$name+"/MouseOver/icon";
			CreateTexture($nut,10010,$x,$y,$img_data);
			Zoom($nut,0,$save_zoom,$save_zoom,null,false);
			Move($nut,0,@$save_move,@$save_move3,null,false);
			Request($nut,Smoothing);
			$nut=$name+"/MouseOver/PIC";
			if(Platform()==100){
				CreateTexture($nut,10010,106,430,$img_data);
				Zoom($nut,0,$save_zoom2,$save_zoom2,null,false);
			}else{
				CreateTexture($nut,10010,93,423,$img_data);
				Zoom($nut,0,$save_zoom2,$save_zoom2,null,false);
			}
			Request($nut,Smoothing);
				$nut=$name+"/MouseClick/icon";
				CreateTexture($nut,10010,$x,$y,$img_data);
				Zoom($nut,0,$save_zoom,$save_zoom,null,false);
				Move($nut,0,@$save_move,@$save_move3,null,false);
				Request($nut,Smoothing);
				$nut=$name+"/MouseClick/PIC";
				if(Platform()==100){
					CreateTexture($nut,10010,106,430,$img_data);
					Zoom($nut,0,$save_zoom2,$save_zoom2,null,false);
				}else{
					CreateTexture($nut,10010,93,423,$img_data);
					Zoom($nut,0,$save_zoom2,$save_zoom2,null,false);
				}
				Request($nut,Smoothing);

			$no="<FONT size=18>NO\."+$no+"</FONT>";
			$date="<FONT size=18>"+$date+"</FONT>";
			$cmt="<FONT size=18>"+$cmt+"</FONT>";
			$tm="<FONT size=18>"+$tm+"</FONT>";

			$nut=$name+"/MouseOver/head";
			CreateTexture($nut,10010,267,427,"@h-text");
			$nut=$name+"/MouseOver/no";
			CreateText($nut,10010,269,470,auto,auto,$no);
			$nut=$name+"/MouseOver/date";
			CreateText($nut,10010,345,470,auto,auto,$date);
			$nut=$name+"/MouseOver/cmt";
			CreateText($nut,10010,267,418,464,48,$cmt);
			$nut=$name+"/MouseOver/tm";
			CreateText($nut,10010,565,470,auto,auto,$tm);
				$nut=$name+"/MouseClick/head";
				CreateTexture($nut,10010,267,427,"@h-text");
				$nut=$name+"/MouseClick/no";
				CreateText($nut,10010,269,470,auto,auto,$no);
				$nut=$name+"/MouseClick/date";
				CreateText($nut,10010,345,470,auto,auto,$date);
				$nut=$name+"/MouseClick/cmt";
				CreateText($nut,10010,267,418,464,48,$cmt);
				$nut=$name+"/MouseClick/tm";
				CreateText($nut,10010,565,470,auto,auto,$tm);

			if($i==#LATEST_SAVE_NUM){
				$new_Y=$y+78;
				Move("NEW",0,$x,$new_Y,null,false);
			}
		}else{
			$no=String("%03d",$num); //ナンバー

			$nut="savenum_empty_"+$j;
			CreateTexture($nut,10010,$x,$y,"@no-data");
			SetAlias($nut,$nut);
			Move($nut,0,@$save_move,@0,null,false);

			$nut=$name+"/MouseUsual/icon";
			CreateTexture($nut,0,$x,$y,"@no-data");
			Move($nut,0,@$save_move,@0,null,false);
			$nut=$name+"/MouseOver/icon";
			CreateTexture($nut,10010,$x,$y,"@no-data");
			Move($nut,0,@$save_move,@0,null,false);
			$nut=$name+"/MouseOver/PIC";
			CreateTexture($nut,10010,80,416,"@no-data2");
				$nut=$name+"/MouseClick/icon";
				CreateTexture($nut,10010,$x,$y,"@no-data");
				Move($nut,0,@$save_move,@0,null,false);
				$nut=$name+"/MouseClick/PIC";
				CreateTexture($nut,10010,80,416,"@no-data2");


			$no="<FONT size=18>NO\."+$no+"</FONT>";
			$cmt="<FONT size=18>"+"　NO DATA"+"</FONT>";

			$nut=$name+"/MouseOver/head";
			CreateTexture($nut,10010,267,427,"@h-text");
			$nut=$name+"/MouseOver/no";
			CreateText($nut,10010,269,470,auto,auto,$no);
			$nut=$name+"/MouseOver/cmt";
			CreateText($nut,10010,267,420,464,48,$cmt);
				$nut=$name+"/MouseClick/head";
				CreateTexture($nut,10010,267,427,"@h-text");
				$nut=$name+"/MouseClick/no";
				CreateText($nut,10010,272,465,auto,auto,$no);
				$nut=$name+"/MouseClick/cmt";
				CreateText($nut,10010,267,420,464,48,$cmt);

			//★ZOOMバグ回避
			if($j==10){
				$zoombug10=true;
			}else if($j==11){
				$zoombug11=true;
			}else if($j==12){
				$zoombug12=true;
			}
		}
		
		if($j==4||$j==7){
			$x=80;
			if($j==4){
				$y=184;
			}else{
				$y=296;
			}
		}else{
			$x+=136;
		}
		$i++;
		$j++;
	}
	Request("savenum_*/*/*",PushText);
	Request("savenum_*/MouseUsual/*", Erase);
	Delete("savenum_*/MouseLeave");
//	Delete("savenum_*/MouseClick");
	
	Fade("*/MouseOver/*",0,0,null,false);
	Fade("*/MouseLeave/*",0,0,null,false);
	Fade("*/MouseClick/*",0,0,null,false);
	Fade("savenum_empty_*",0,0,null,false);
	
	Fade("@save-bak*",0,0,null,false);
	Fade("@savenum_*/*/*",0,0,null,false);
	Fade("@savenum_*",0,0,null,false);
	
	set_focus();

	//★★★★アンロック
	XBOX360_LockVideo(false);

	if($DialogSaveCheck_Flag){
		Fade("MSGWND/MSG_*",200,0,null,false);
		Fade("MSGWND/MSG_*/*/*",100,0,null,false);
		Move("MSGWND/MSG_msg",240,@0,@6,null,false);
		Move("MSGWND/MSG_text*",240,@0,@6,null,false);
		Move("MSGWND/MSG_*/*/*",240,@0,@6,null,false);
		WaitAction("MSGWND/MSG_*",null);

		Delete("MSGWND/*/*/*");
		Delete("MSGWND/*/*");
		Delete("MSGWND/*");
		Delete("MSGWND");
	}

	Fade("@save-video",200,0,null,true);
	Fade("@fade_black",200,0,null,true);
	
	Fade("@savenum_*/MouseUsual/*",1000,1000,null,false);
	Fade("@savenum_*",1000,1000,null,false);
	Fade("@savenum_empty_*",1000,1000,null,false);
	Fade("@savenum_*", 1000, 500, null, false);
	
	$name="@save-bak"+#save_page;
	Fade($name,1000,1000,null,false);

	$i=1;
	$j=400;
	$x=80;
	while($i<=12){
		$name="@savenum_"+$i+"/MouseUsual/icon";
		Move($name,$j,@$save_move2,@0,null,false);
			$name="@savenum_"+$i+"/MouseOver/icon";
			Move($name,$j,@$save_move2,@0,null,false);
			$name="@savenum_"+$i+"/MouseClick/icon";
			Move($name,$j,@$save_move2,@0,null,false);
		$name="@savenum_"+$i+"_btn";
		Move($name,$j,@$save_move2,@0,null,false);
		$name="@savenum_"+$i;
		Move($name,$j,@$save_move2,@0,null,false);
		$name="@savenum_empty_"+$i;
		Move($name,$j,@$save_move2,@0,null,false);
		if($i==4||$i==7){
			$j=400+$x;
			$x+=40;
		}else{
			$j+=80;
		}
		$i++;
	}

	if($SaveButton){
		//▲描画「ボタン説明」
		DialogButtonFade3("Button_SAVE");
		$SaveButton=false;
		MoveCursor(144,108);
	}

	Fade("NEW",500,1000,null,false);

	WaitMove("@savenum_*/MouseUsual/*");
	WaitMove("@savenum_empty_*");

	$SYSTEM_menu_close_enable=false;
	$SYSTEM_buttondown_close=false;
	$SYSTEM_keydown_esc=false;
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	while($SYSTEM_menu_save_enable)
	{
		if($SYSTEM_XBOX360_change_user_state){DialogChangeState2();}
		select{
			if($SYSTEM_XBOX360_change_user_state){DialogChangeState2();}
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$SYSTEM_menu_save_enable=false;break;}
			if($SYSTEM_XBOX360_button_lb_down){break;}
			if($SYSTEM_XBOX360_button_rb_down){break;}
			case @savenum_1{do_save(1);MoveCursor(144,108);}
			case @savenum_2{do_save(2);MoveCursor(280,108);}
			case @savenum_3{do_save(3);MoveCursor(416,108);}
			case @savenum_4{do_save(4);MoveCursor(552,108);}
			case @savenum_5{do_save(5);MoveCursor(144,220);}
			case @savenum_6{do_save(6);MoveCursor(280,220);}
			case @savenum_7{do_save(7);MoveCursor(416,220);}
			case @savenum_8{do_save(8);MoveCursor(144,332);}
			case @savenum_9{do_save(9);MoveCursor(280,332);}
			case @savenum_10{do_save(10);MoveCursor(416,332);}
			case @savenum_11{do_save(11);MoveCursor(552,332);}
			case @savenum_12{do_save(12);MoveCursor(688,332);}
			case NEXT{
				$save_next=true;
				Fade("@savenum_*/MouseUsual/*",400,0,null,false);
				Fade("@savenum_*",400,0,null,false);
				Fade("@savenum_empty_*",400,0,null,false);
				Move("@savenum_*/MouseUsual/*",400,-160,@0,Axl1,false);
				Move("@savenum_*",400,-160,@0,Axl1,false);
				Move("@savenum_empty_*",400,-160,@0,Axl1,false);
				$name="@save-bak"+#save_page;
				Fade($name,400,0,null,false);
				Fade("NEW",200,0,null,false);
				WaitMove("@savenum_*/MouseUsual/*");
				WaitMove("@savenum_empty_*");
				Delete($name);
				
				CreateTexture("@WND/fade_black",20000,center,middle,SCREEN);
				SetAlias("@WND/fade_black","fade_black");
					$name="@savenum_empty_*";
					Delete($name);
				#save_page++;
				if(#save_page>=11){#save_page=1;}
				SaveBAK();
				return;
			}case BACK{
				$save_next=false;
				Fade("@savenum_*/MouseUsual/*",400,0,null,false);
				Fade("@savenum_*",400,0,null,false);
				Fade("@savenum_empty_*",400,0,null,false);
				Move("@savenum_*/MouseUsual/*",400,1024,@0,Axl1,false);
				Move("@savenum_*",400,1024,@0,Axl1,false);
				Move("@savenum_empty_*",400,1024,@0,Axl1,false);
				$name="@save-bak"+#save_page;
				Fade($name,400,0,null,false);
				Fade("NEW",200,0,null,false);
				WaitMove("@savenum_*/MouseUsual/*");
				WaitMove("@savenum_empty_*");
				Delete($name);
				
				CreateTexture("@WND/fade_black",20000,center,middle,SCREEN);
				SetAlias("@WND/fade_black","fade_black");
					$name="@savenum_empty_*";
					Delete($name);
				#save_page--;
				if(#save_page<1){#save_page=10;}
				SaveBAK();
				return;
			}
			case EXIT{$SYSTEM_menu_save_enable=false;}
			if(!$SYSTEM_menu_save_enable){break;}
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

		if($SYSTEM_XBOX360_button_rb_down){
				Fade("NEXTicon", 0, 1000, null, true);
				$save_next=true;
				Fade("@savenum_*/MouseUsual/*",400,0,null,false);
					Fade("@savenum_*/MouseOver/*",400,0,null,false);
					Fade("@savenum_*/MouseClick/*",400,0,null,false);
				Fade("@savenum_*",400,0,null,false);
				Fade("@savenum_empty_*",400,0,null,false);
				Move("@savenum_*/MouseUsual/*",400,-160,@0,Axl1,false);
					Move("@savenum_*/MouseOver/*",400,-160,@0,Axl1,false);
					Move("@savenum_*/MouseClick/*",400,-160,@0,Axl1,false);
				Move("@savenum_*",400,-160,@0,Axl1,false);
				Move("@savenum_empty_*",400,-160,@0,Axl1,false);

				Move("*/MouseOver/PIC",0,@0,@0,null,false);
				Move("*/MouseOver/cmt",0,@0,@0,null,false);
				Move("*/MouseOver/head",0,@0,@0,null,false);
				Move("*/MouseOver/no",0,@0,@0,null,false);
				Move("*/MouseOver/date",0,@0,@0,null,false);
				Move("*/MouseOver/tm",0,@0,@0,null,false);
				Move("*/MouseClick/PIC",0,@0,@0,null,false);
				Move("*/MouseClick/cmt",0,@0,@0,null,false);
				Move("*/MouseClick/head",0,@0,@0,null,false);
				Move("*/MouseClick/no",0,@0,@0,null,false);
				Move("*/MouseClick/date",0,@0,@0,null,false);
				Move("*/MouseClick/tm",0,@0,@0,null,false);

				$name="@save-bak"+#save_page;
				Fade($name,400,0,null,false);
				Fade("NEW",200,0,null,false);
				WaitMove("@savenum_*/MouseUsual/*");
				WaitMove("@savenum_empty_*");
				Delete($name);
				
				CreateTexture("@WND/fade_black",20000,center,middle,SCREEN);
				SetAlias("@WND/fade_black","fade_black");
					$name="@savenum_empty_*";
					Delete($name);
				#save_page++;
				if(#save_page>=11){#save_page=1;}
				SaveBAK();
				Fade("NEXTicon", 0, 0, null, true);
				return;
		}else if($SYSTEM_XBOX360_button_lb_down){
				Fade("BACKicon", 0, 1000, null, true);
				$save_next=false;
				Fade("@savenum_*/MouseUsual/*",400,0,null,false);
					Fade("@savenum_*/MouseOver/*",400,0,null,false);
					Fade("@savenum_*/MouseClick/*",400,0,null,false);
				Fade("@savenum_*",400,0,null,false);
				Fade("@savenum_empty_*",400,0,null,false);
				Move("@savenum_*/MouseUsual/*",400,1024,@0,Axl1,false);
					Move("@savenum_*/MouseOver/*",400,1024,@0,Axl1,false);
					Move("@savenum_*/MouseClick/*",400,1024,@0,Axl1,false);
				Move("@savenum_*",400,1024,@0,Axl1,false);
				Move("@savenum_empty_*",400,1024,@0,Axl1,false);

				Move("*/MouseOver/PIC",0,@0,@0,null,false);
				Move("*/MouseOver/cmt",0,@0,@0,null,false);
				Move("*/MouseOver/head",0,@0,@0,null,false);
				Move("*/MouseOver/no",0,@0,@0,null,false);
				Move("*/MouseOver/date",0,@0,@0,null,false);
				Move("*/MouseOver/tm",0,@0,@0,null,false);
				Move("*/MouseClick/PIC",0,@0,@0,null,false);
				Move("*/MouseClick/cmt",0,@0,@0,null,false);
				Move("*/MouseClick/head",0,@0,@0,null,false);
				Move("*/MouseClick/no",0,@0,@0,null,false);
				Move("*/MouseClick/date",0,@0,@0,null,false);
				Move("*/MouseClick/tm",0,@0,@0,null,false);

				$name="@save-bak"+#save_page;
				Fade($name,400,0,null,false);
				Fade("NEW",200,0,null,false);
				WaitMove("@savenum_*/MouseUsual/*");
				WaitMove("@savenum_empty_*");
				Delete($name);
				
				CreateTexture("@WND/fade_black",20000,center,middle,SCREEN);
				SetAlias("@WND/fade_black","fade_black");
					$name="@savenum_empty_*";
					Delete($name);
				#save_page--;
				if(#save_page<1){#save_page=10;}
				SaveBAK();
				Fade("BACKicon", 0, 0, null, true);
				return;
		}
	}
}



function do_save($num)
{
	$i=$num;
	$num+=((#save_page-1)*12);
	$save=true;
	$save_check=false;
	ExistSaveNumber();
	if(!$SaveON){
		$name="@savenum_"+$i+"/MouseUsual/icon";
		Fade($name,0,0,null,false);
	}else{
		$name="@savenum_"+$i+"/MouseOver/*";
		Fade($name,0,0,null,false);
		
		if(!#donot_ask_overwrite_savedata){
			//★★★★ロック
			XBOX360_LockVideo(true);

			//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
			CreateName("MSGWND");

			$DialogText01="上書きしてよろしいですか？";
	//		$DialogText02="この状態ではデータを保存できません";
	//		$DialogText03="このままゲームを開始しますか？";
		
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
			//CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
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
			Move("MSGWND/MSG_text1", 0, @12, @-36, null, true);
		//	Move("MSGWND/MSG_text1", 0, @12, @-48, null, true);
		//	Move("MSGWND/MSG_text2", 0, @12, @-24, null, true);
		//	Move("MSGWND/MSG_text1", 0, @12, @-56, null, true);
		//	Move("MSGWND/MSG_text2", 0, @12, @-35, null, true);
		//	Move("MSGWND/MSG_text3", 0, @12, @-16, null, true);

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
			$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
			select{
				if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
				if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){
					$save=false;
					break;
				}
				case MSGWND/MSG_no{
					//所定の動作
					Wait(200);
					$save=false;
				}case MSGWND/MSG_yes{
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
			$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
			$save_check=true;
		}
	}
	
	if($save){
		if($save_check){
			Fade("MSGWND/MSG_msg",200,0,null,false);
			Fade("MSGWND/MSG_text*",200,0,null,false);
			Fade("MSGWND/MSG_*/*/*",100,0,null,false);
			Move("MSGWND/MSG_msg",300,@0,@6,null,false);
			Move("MSGWND/MSG_text*",300,@0,@6,null,false);
			Move("MSGWND/MSG_*/*/*",300,@0,@6,null,false);
			WaitAction("MSGWND/MSG_*",null);
		
			Delete("MSGWND/*/*");
			Delete("MSGWND/MSG_msg");
			Delete("MSGWND/MSG_text*");
		}else{
			//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
			CreateName("MSGWND");

			//■定義「背景」
			CreateTexture("MSGWND/MSG_bak",1010000,0,0,"cg/sys/dialog/ダイアログkeep-out.png");
		
			//■定義「選択肢」
			//box
			CreateTexture("MSGWND/MSG_msg",1010000,280,184,"cg/sys/dialog/ダイアログ台座.png");
		}

		//★★★★ロック
		XBOX360_LockVideo(true);

		$DialogText01="保存しています";
		$DialogText02="本体の電源を切らないで下さい";
	//	$DialogText03="このままゲームを開始しますか？";
	
		//■定義「選択肢」
		//box
		CreateTexture("MSGWND/MSG_msg",1010000,280,184,"cg/sys/dialog/ダイアログ台座2.png");
		//text
		SetFont("ＭＳ ゴシック", 21, FFFFFF, 000000, MEDIUM, NULL);
		CreateText("MSGWND/MSG_text1", 1010000, center, middle, Auto, Auto, $DialogText01);
		CreateText("MSGWND/MSG_text2", 1010000, center, middle, Auto, Auto, $DialogText02);
	//	CreateText("MSGWND/MSG_text3", 1010000, center, middle, Auto, Auto, $DialogText03);
	
		//●最終準備
		if($save_check){
			Fade("MSGWND/MSG_text*",0,0,null,false);
			Fade("MSGWND/MSG_msg",0,0,null,false);
		}else{
			Fade("MSGWND/MSG_*",0,0,null,false);
		}
		Fade("MSGWND/MSG_*/*/*",0,0,null,false);
		Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
		Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
		Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
		Request("MSGWND/MSG_text*", NoLog);
		Request("MSGWND/MSG_text*", PushText);
	
		//●文字位置調整
	//	Move("MSGWND/MSG_text1", 0, @12, @-20, null, true);
		Move("MSGWND/MSG_text1", 0, @12, @-32, null, true);
		Move("MSGWND/MSG_text2", 0, @12, @-8, null, true);
	//	Move("MSGWND/MSG_text1", 0, @12, @-40, null, true);
	//	Move("MSGWND/MSG_text2", 0, @12, @-19, null, true);
	//	Move("MSGWND/MSG_text3", 0, @12, @0, null, true);
	
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


		if(!#PRELATEST_SAVE_NUM){
			#LATEST_SAVE_NUM=$num;
		}
		#PRELATEST_SAVE_NUM=#LATEST_SAVE_NUM;
		#LATEST_SAVE_NUM=$num;

		$PLAY_TIME+=(Time()-#START_TIME);
		#START_TIME=Time();

		//●データ取得「日付」
		DateTime($SaveThumYyyy,$mm,$dd,$hh24,$mi,$ss);
		if($mm<10){$mm="<PRE>0</PRE>"+$mm;}
		if($dd<10){$dd="<PRE>0</PRE>"+$dd;}
		if($hh24<10){$hh24="<PRE>0</PRE>"+$hh24;}
		if($mi<10){$mi="<PRE>0</PRE>"+$mi;}
		if($ss<10){$ss="<PRE>0</PRE>"+$ss;}
		$date_str=$SaveThumYyyy+"<PRE>-</PRE>"+$mm+"<PRE>-</PRE>"+$dd+" "+$hh24+"<PRE>:</PRE>"+$mi+"<PRE>:</PRE>"+$ss;

		$cmt_str="　"+$SYSTEM_last_text;

		//●データ取得「プレイ時間」
		$tm_str=String("%03d:%02d:%02d",$PLAY_TIME/3600,Integer($PLAY_TIME-(3600*Integer($PLAY_TIME/3600)))/60,$PLAY_TIME%60);
		$tm_str="PLAY TIME  "+$tm_str;

		SavePath();
		SaveNumber();
		Save($num);
		GetTime();
		Save(0);

		Wait(2500);
		thumbnail($num);

	}

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Wait(300);

	Fade("MSGWND/MSG_*",200,0,null,false);
	Fade("MSGWND/MSG_*/*/*",100,0,null,false);
	Move("MSGWND/MSG_msg",300,@0,@6,null,false);
	Move("MSGWND/MSG_text*",300,@0,@6,null,false);
	WaitAction("MSGWND/MSG_*",null);

	Delete("MSGWND/*/*/*");
	Delete("MSGWND/*/*");
	Delete("MSGWND/*");
	Delete("MSGWND");
	$save_check=false;

	$SYSTEM_r_button_down=false;
	$SYSTEM_XBOX360_button_b_down=false;
}

function thumbnail($num)
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	$thumbnail=true;

	//★セーブデータチェック
	$DialogSaveCheck_Flag=false;
	ExistDataCheck();

	$no=String("%03d",$num); //ナンバー情報

	$i=$num;
	if($num>=13){$i-=12;}
	if($num>=25){$i-=12;}
	if($num>=37){$i-=12;}
	if($num>=49){$i-=12;}
	if($num>=61){$i-=12;}
	if($num>=73){$i-=12;}
	if($num>=85){$i-=12;}
	if($num>=97){$i-=12;}
	if($num>=109){$i-=12;}
	if($num>=121){$i-=12;}

	$x=-136+80;
	if($i<=4){
		$y=72;
		$x+=(136*$i);
	}else if($i<=7){
		$y=184;
		$x+=(136*($i-4));
	}else{
		$y=296;
		$x+=(136*($i-7));
	}

	//★ZOOMバグ回避
	if($i==10){
		$zoombug10=false;
	}else if($i==11){
		$zoombug11=false;
	}else if($i==12){
		$zoombug12=false;
	}

	$name="@savenum_"+$i+"/MouseUsual/*";
	Delete($name);
	$name="@savenum_"+$i+"/MouseOver/*";
	Delete($name);
	$name="@savenum_"+$i+"/MouseClick/*";
	Delete($name);
	$name="@WND/savenum_"+$i+"_btn";
	Delete($name);
	$name="@WND/savenum_"+$i+"_img";
	Delete($name);

//	WaitKey();

	if($SaveON){
		//1210
		$xNEW=$x;
		$yNEW=$y;

		if(Platform()==100){
			$save_zoom=1250;
			$save_zoom2=1500;
			$y+=9;
			$x+=16;
		}else{
			$save_zoom=1000;
			$save_zoom2=1212;
			$y+=0;
			$x+=0;
		}

		$img_data="@WND/savenum_"+$i+"_img";
		LoadImage($img_data,$img);
		
		$nut="@WND/savenum_"+$i+"_btn";
		CreateTexture($nut,10011,$x,$y,$img_data);
		Zoom($nut,0,$save_zoom,$save_zoom,null,false);
		$name="savenum_"+$i+"_btn";
		SetAlias($nut,$name);
		Request($nut,Smoothing);
		
		$name="savenum_"+$i;
		$nut=$name+"/MouseUsual/icon";
		CreateTexture($nut,10010,$x,$y,$img_data);
		Zoom($nut,0,$save_zoom,$save_zoom,null,false);
		Request($nut,Smoothing);
		$nut=$name+"/MouseOver/icon";
		CreateTexture($nut,10010,$x,$y,$img_data);
		Zoom($nut,0,$save_zoom,$save_zoom,null,false);
		Request($nut,Smoothing);
		$nut=$name+"/MouseOver/PIC";
		if(Platform()==100){
			CreateTexture($nut,10010,105,430,$img_data);
			Zoom($nut,0,$save_zoom2,$save_zoom2,null,false);
		}else{
			CreateTexture($nut,10010,93,423,$img_data);
			Zoom($nut,0,$save_zoom2,$save_zoom2,null,false);
		}
		Request($nut,Smoothing);
					$nut=$name+"/MouseClick/icon";
					CreateTexture($nut,10010,$x,$y,$img_data);
					Zoom($nut,0,$save_zoom,$save_zoom,null,false);
					Request($nut,Smoothing);
					$nut=$name+"/MouseClick/PIC";
					if(Platform()==100){
						CreateTexture($nut,10010,105,430,$img_data);
						Zoom($nut,0,$save_zoom2,$save_zoom2,null,false);
					}else{
						CreateTexture($nut,10010,93,423,$img_data);
						Zoom($nut,0,$save_zoom2,$save_zoom2,null,false);
					}
					Request($nut,Smoothing);


		//★ZOOMバグ回避
		if($zoombug10){
			Zoom("@savenum_10/*/PIC",0,1000,1000,null,false);
			Zoom("@savenum_10/*/icon",0,1000,1000,null,false);
		}
		if($zoombug11){
			Zoom("@savenum_11/*/PIC",0,1000,1000,null,false);
			Zoom("@savenum_11/*/icon",0,1000,1000,null,false);
		}
		if($zoombug12){
			Zoom("@savenum_12/*/PIC",0,1000,1000,null,false);
			Zoom("@savenum_12/*/icon",0,1000,1000,null,false);
		}


		$no="<FONT size=18>NO\."+$no+"</FONT>";
		$date="<FONT size=18>"+$date+"</FONT>";
		$cmt="<FONT size=18>"+$cmt+"</FONT>";
		$tm="<FONT size=18>"+$tm+"</FONT>";
	
			$nut=$name+"/MouseOver/head";
			CreateTexture($nut,10010,267,427,"@h-text");
			$nut=$name+"/MouseOver/no";
			CreateText($nut,10010,269,470,auto,auto,$no);
			$nut=$name+"/MouseOver/date";
			CreateText($nut,10010,345,470,auto,auto,$date);
			$nut=$name+"/MouseOver/cmt";
			CreateText($nut,10010,267,418,464,48,$cmt);
			$nut=$name+"/MouseOver/tm";
			CreateText($nut,10010,565,470,auto,auto,$tm);
				$nut=$name+"/MouseClick/head";
				CreateTexture($nut,10010,267,427,"@h-text");
				$nut=$name+"/MouseClick/no";
				CreateText($nut,10010,269,470,auto,auto,$no);
				$nut=$name+"/MouseClick/date";
				CreateText($nut,10010,345,470,auto,auto,$date);
				$nut=$name+"/MouseClick/cmt";
				CreateText($nut,10010,267,418,464,48,$cmt);
				$nut=$name+"/MouseClick/tm";
				CreateText($nut,10010,565,470,auto,auto,$tm);
	
		$nut=$name+"/*/*";
		Request($nut,PushText);
		Request("savenum_*/MouseUsual/*", Erase);
		set_focus();
	
		Fade("@savenum_*", 0, 500, null, false);
	
		//★★★★アンロック
		XBOX360_LockVideo(false);
	
		$yNEW+=78;
		Move("NEW",0,$xNEW,$yNEW,null,false);
		Fade("NEW",200,1000,null,false);
	
			$name="@savenum_"+$i+"/MouseClick/*";
			Fade($name,0,0,null,false);
	
			$name="@savenum_empty_"+$i;
			Delete($name);
	}else{
		$nut="savenum_empty_"+$i;
		CreateTexture($nut,10010,$x,$y,"@no-data");
		SetAlias($nut,$nut);

		$name="savenum_"+$i;
		$nut=$name+"/MouseUsual/icon";
		CreateTexture($nut,0,$x,$y,"@no-data");
		$nut=$name+"/MouseOver/icon";
		CreateTexture($nut,10010,$x,$y,"@no-data");
		$nut=$name+"/MouseOver/PIC";
		CreateTexture($nut,10010,80,416,"@no-data2");
			$nut=$name+"/MouseClick/icon";
			CreateTexture($nut,10010,$x,$y,"@no-data");
			$nut=$name+"/MouseClick/PIC";
			CreateTexture($nut,10010,80,416,"@no-data2");


		$no="<FONT size=18>NO\."+$no+"</FONT>";
		$cmt="<FONT size=18>"+"　NO DATA"+"</FONT>";
	
		$nut=$name+"/MouseOver/head";
		CreateTexture($nut,10010,268,427,"@h-text");
		$nut=$name+"/MouseOver/no";
		CreateText($nut,10010,272,464,auto,auto,$no);
		$nut=$name+"/MouseOver/cmt";
		CreateText($nut,10010,268,413,464,48,$cmt);
			$nut=$name+"/MouseClick/head";
			CreateTexture($nut,10010,268,427,"@h-text");
			$nut=$name+"/MouseClick/no";
			CreateText($nut,10010,272,464,auto,auto,$no);
			$nut=$name+"/MouseClick/cmt";
			CreateText($nut,10010,268,413,464,48,$cmt);

		$nut=$name+"/*/*";
		Request($nut,PushText);
		Request("savenum_*/MouseUsual/*", Erase);
		set_focus();
	
		Fade("@savenum_*", 0, 500, null, false);

		//★ZOOMバグ回避
		if($i==10){
			$zoombug10=true;
		}else if($i==11){
			$zoombug11=true;
		}else if($i==12){
			$zoombug12=true;
		}

		//★★★★アンロック
		XBOX360_LockVideo(false);
	
			$name="@savenum_"+$i+"/MouseClick/*";
			Fade($name,0,0,null,false);
	}

	$thumbnail=false;
}


function set_focus()
{
	SetNextFocus("@savenum_1/MouseUsual/icon","@savenum_2/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_2/MouseUsual/icon","@savenum_3/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_3/MouseUsual/icon","@savenum_4/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_4/MouseUsual/icon","@savenum_1/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_5/MouseUsual/icon","@savenum_6/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_6/MouseUsual/icon","@savenum_7/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_7/MouseUsual/icon","@savenum_5/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_8/MouseUsual/icon","@savenum_9/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_9/MouseUsual/icon","@savenum_10/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_10/MouseUsual/icon","@savenum_11/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_11/MouseUsual/icon","@savenum_12/MouseUsual/icon",RIGHT);
	SetNextFocus("@savenum_12/MouseUsual/icon","@savenum_8/MouseUsual/icon",RIGHT);
	SetNextFocus("BACK/MouseUsual/icon","NEXT/MouseUsual/icon",RIGHT);
	SetNextFocus("NEXT/MouseUsual/icon","BACK/MouseUsual/icon",RIGHT);
	
	SetNextFocus("@savenum_1/MouseUsual/icon","@savenum_4/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_2/MouseUsual/icon","@savenum_1/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_3/MouseUsual/icon","@savenum_2/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_4/MouseUsual/icon","@savenum_3/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_5/MouseUsual/icon","@savenum_7/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_6/MouseUsual/icon","@savenum_5/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_7/MouseUsual/icon","@savenum_6/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_8/MouseUsual/icon","@savenum_12/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_9/MouseUsual/icon","@savenum_8/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_10/MouseUsual/icon","@savenum_9/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_11/MouseUsual/icon","@savenum_10/MouseUsual/icon",LEFT);
	SetNextFocus("@savenum_12/MouseUsual/icon","@savenum_11/MouseUsual/icon",LEFT);
	SetNextFocus("BACK/MouseUsual/icon","NEXT/MouseUsual/icon",LEFT);
	SetNextFocus("NEXT/MouseUsual/icon","BACK/MouseUsual/icon",LEFT);

	SetNextFocus("@savenum_1/MouseUsual/icon","@savenum_5/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_2/MouseUsual/icon","@savenum_6/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_3/MouseUsual/icon","@savenum_7/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_4/MouseUsual/icon","@savenum_11/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_5/MouseUsual/icon","@savenum_8/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_6/MouseUsual/icon","@savenum_9/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_7/MouseUsual/icon","@savenum_10/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_8/MouseUsual/icon","NEXT/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_9/MouseUsual/icon","NEXT/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_10/MouseUsual/icon","NEXT/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_11/MouseUsual/icon","NEXT/MouseUsual/icon",DOWN);
	SetNextFocus("@savenum_12/MouseUsual/icon","NEXT/MouseUsual/icon",DOWN);
	SetNextFocus("BACK/MouseUsual/icon","@savenum_1/MouseUsual/icon",DOWN);
	SetNextFocus("NEXT/MouseUsual/icon","@savenum_1/MouseUsual/icon",DOWN);

	SetNextFocus("@savenum_1/MouseUsual/icon","NEXT/MouseUsual/icon",UP);
	SetNextFocus("@savenum_2/MouseUsual/icon","NEXT/MouseUsual/icon",UP);
	SetNextFocus("@savenum_3/MouseUsual/icon","NEXT/MouseUsual/icon",UP);
	SetNextFocus("@savenum_4/MouseUsual/icon","NEXT/MouseUsual/icon",UP);
	SetNextFocus("@savenum_5/MouseUsual/icon","@savenum_1/MouseUsual/icon",UP);
	SetNextFocus("@savenum_6/MouseUsual/icon","@savenum_2/MouseUsual/icon",UP);
	SetNextFocus("@savenum_7/MouseUsual/icon","@savenum_3/MouseUsual/icon",UP);
	SetNextFocus("@savenum_8/MouseUsual/icon","@savenum_5/MouseUsual/icon",UP);
	SetNextFocus("@savenum_9/MouseUsual/icon","@savenum_6/MouseUsual/icon",UP);
	SetNextFocus("@savenum_10/MouseUsual/icon","@savenum_7/MouseUsual/icon",UP);
	SetNextFocus("@savenum_11/MouseUsual/icon","@savenum_4/MouseUsual/icon",UP);
	SetNextFocus("@savenum_12/MouseUsual/icon","@savenum_7/MouseUsual/icon",UP);
	SetNextFocus("BACK/MouseUsual/icon","@savenum_12/MouseUsual/icon",UP);
	SetNextFocus("NEXT/MouseUsual/icon","@savenum_12/MouseUsual/icon",UP);
}



//セーブファイル判定
function DialogDataCheck()
{
	$img=String("%s/%04d/thum.npf",#SYSTEM_save_path,$num); //サムネイル情報
//	$name1=String("%s/%04d/bklg.npf",#SYSTEM_save_path,$num); //バックログ情報
//	$name2=String("%s/%04d/frames.npf",#SYSTEM_save_path,$num); //ナット情報
//	$name3=String("%s/%04d/script.npf",#SYSTEM_save_path,$num); //スクリプト情報
//	$name4=String("%s/%04d/val.npf",#SYSTEM_save_path,$num); //ローカル変数情報

	if(Platform()==100){
		if(AvailableFile($img)==1){
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
			if(!$thumbnail){
				Fade("*/MouseOver/*",0,0,null,false);
				Fade("*/MouseLeave/*",0,0,null,false);
				Fade("*/MouseClick/*",0,0,null,false);
				Fade("savenum_empty_*",0,0,null,false);
				
				Fade("@save-bak*",0,0,null,false);
				Fade("@savenum_*/*/*",0,0,null,false);
				Fade("@savenum_*",0,0,null,false);
			}else if($thumbnail){
				$DialogSaveCheck_Flag=true;
			}

			//★★★★アンロック
			XBOX360_LockVideo(false);
			if($DialogSaveCheck_Flag){
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
			}
	
			//★★★★ロック
			XBOX360_LockVideo(true);
	
			//■定義「メッセージウインドウ作成」
			if(!$DialogSaveCheck_Flag){
				if(!$PLACE_badend&&!$SYSTEM_menu_config_enable&&!$SYSTEM_backlog_enable){
					//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
					CreateName("MSGWND");
				}else{
					//CreateWindow("MSGWND",1010000,0,0,1280,720,false);
					CreateName("MSGWND");
				}
			}
	
			$DialogText01="ＮＯ "+$num+" のデータが破損しており使用不可能です";
			$DialogText02="また、このままではセーブ画面を開けません";
			$DialogText03="破損したセーブデータを削除してもよろしいですか？";
		
			//▲画像ロード
			LoadImage("MSGWND/IMG_yes_on","cg/sys/dialog/yes-002.png");
			LoadImage("MSGWND/IMG_yes_off","cg/sys/dialog/yes-001.png");
			LoadImage("MSGWND/IMG_no_on","cg/sys/dialog/no-002.png");
			LoadImage("MSGWND/IMG_no_off","cg/sys/dialog/no-001.png");
		
			//■定義「背景」
			if(!$DialogSaveCheck_Flag){
				CreateTexture("MSGWND/MSG_bak",1010000,0,0,"cg/sys/dialog/ダイアログkeep-out.png");
			}
	
			//■定義「選択肢」
			//box
			CreateTexture("MSGWND/MSG_msg",1010000,280,184,"cg/sys/dialog/ダイアログ台座.png");
			//text
			SetFont("ＭＳ ゴシック", 23, FFFFFF, 000000, MEDIUM, NULL);
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
			if($DialogSaveCheck_Flag){
				Fade("MSGWND/MSG_*/*/*",0,0,null,false);
				Fade("MSGWND/MSG_msg",0,0,null,false);
				Fade("MSGWND/MSG_text*",0,0,null,false);
				Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
				Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
				Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
				Request("MSGWND/MSG_text*", NoLog);
				Request("MSGWND/MSG_text*", PushText);
			}else{
				Fade("MSGWND/MSG_*",0,0,null,false);
				Fade("MSGWND/MSG_*/*/*",0,0,null,false);
				Move("MSGWND/MSG_*/*/*",0,@0,@-6,null,false);
				Move("MSGWND/MSG_msg",0,@0,@-6,null,false);
				Move("MSGWND/MSG_text*", 0, @0, @-6, null, true);
				Request("MSGWND/MSG_text*", NoLog);
				Request("MSGWND/MSG_text*", PushText);
			}
		
			//●文字位置調整
		//	Move("MSGWND/MSG_text1", 0, @12, @-36, null, true);
		//	Move("MSGWND/MSG_text1", 0, @12, @-48, null, true);
		//	Move("MSGWND/MSG_text2", 0, @12, @-24, null, true);
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
			$DialogSaveCheck_Flag=true;
		
			$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
			select{
				if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$savedelete=false;break;}
		
				case MSGWND/MSG_no{
					$savedelete=false;
				}case MSGWND/MSG_yes{
					$savedelete=true;
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
			$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	
			if($savedelete){
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
	
				$DialogText01="消去しています";
				$DialogText02="本体の電源を切らないで下さい";
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
			//	Move("MSGWND/MSG_text1", 0, @12, @-20, null, true);
				Move("MSGWND/MSG_text1", 0, @12, @-32, null, true);
				Move("MSGWND/MSG_text2", 0, @12, @-8, null, true);
			//	Move("MSGWND/MSG_text1", 0, @12, @-40, null, true);
			//	Move("MSGWND/MSG_text2", 0, @12, @-19, null, true);
			//	Move("MSGWND/MSG_text3", 0, @12, @0, null, true);
			
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
	
				//★個別ファイル削除
				if($thumbnail){
					if(#LATEST_SAVE_NUM==#PRELATEST_SAVE_NUM){
						#PRELATEST_SAVE_NUM=false;
						#LATEST_SAVE_NUM=false;
						Move("NEW",0,1024,1024,null,false);
					}else{
						#LATEST_SAVE_NUM=#PRELATEST_SAVE_NUM;
					}
				}else if(#LATEST_SAVE_NUM==$num){
					#LATEST_SAVE_NUM=false;
					Move("NEW",0,1024,1024,null,false);
				}

				$SaveON=false;
				SaveDataDelete();
				DeleteSaveFile($num);
				GetTime();
				Save(0);
				$savedelete=false;
				Wait(1500);
			}else{
				//★削除しなかった場合
				Fade("MSGWND/MSG_*",200,0,null,false);
				Fade("MSGWND/MSG_*/*/*",100,0,null,false);
				Move("MSGWND/MSG_msg",300,@0,@6,null,false);
				Move("MSGWND/MSG_text*",300,@0,@6,null,false);
				WaitAction("MSGWND/MSG_*",null);
			
				Delete("MSGWND/*/*/*");
				Delete("MSGWND/*/*");
				Delete("MSGWND/*");
				Delete("MSGWND");

				$SYSTEM_menu_save_enable=false;
				Escape(3);
			}
	
			//★★★★ロック
			XBOX360_LockVideo(true);
		}
	}
}

function SaveNumber()
{
	if($num==1){
		#SaveNumber1=true;
	}else if($num==2){
		#SaveNumber2=true;
	}else if($num==3){
		#SaveNumber3=true;
	}else if($num==4){
		#SaveNumber4=true;
	}else if($num==5){
		#SaveNumber5=true;
	}else if($num==6){
		#SaveNumber6=true;
	}else if($num==7){
		#SaveNumber7=true;
	}else if($num==8){
		#SaveNumber8=true;
	}else if($num==9){
		#SaveNumber9=true;
	}else if($num==10){
		#SaveNumber10=true;
	}else if($num==11){
		#SaveNumber11=true;
	}else if($num==12){
		#SaveNumber12=true;
	}else if($num==13){
		#SaveNumber13=true;
	}else if($num==14){
		#SaveNumber14=true;
	}else if($num==15){
		#SaveNumber15=true;
	}else if($num==16){
		#SaveNumber16=true;
	}else if($num==17){
		#SaveNumber17=true;
	}else if($num==18){
		#SaveNumber18=true;
	}else if($num==19){
		#SaveNumber19=true;
	}else if($num==20){
		#SaveNumber20=true;
	}else if($num==21){
		#SaveNumber21=true;
	}else if($num==22){
		#SaveNumber22=true;
	}else if($num==23){
		#SaveNumber23=true;
	}else if($num==24){
		#SaveNumber24=true;
	}else if($num==25){
		#SaveNumber25=true;
	}else if($num==26){
		#SaveNumber26=true;
	}else if($num==27){
		#SaveNumber27=true;
	}else if($num==28){
		#SaveNumber28=true;
	}else if($num==29){
		#SaveNumber29=true;
	}else if($num==30){
		#SaveNumber30=true;
	}else if($num==31){
		#SaveNumber31=true;
	}else if($num==32){
		#SaveNumber32=true;
	}else if($num==33){
		#SaveNumber33=true;
	}else if($num==34){
		#SaveNumber34=true;
	}else if($num==35){
		#SaveNumber35=true;
	}else if($num==36){
		#SaveNumber36=true;
	}else if($num==37){
		#SaveNumber37=true;
	}else if($num==38){
		#SaveNumber38=true;
	}else if($num==39){
		#SaveNumber39=true;
	}else if($num==40){
		#SaveNumber40=true;
	}else if($num==41){
		#SaveNumber41=true;
	}else if($num==42){
		#SaveNumber42=true;
	}else if($num==43){
		#SaveNumber43=true;
	}else if($num==44){
		#SaveNumber44=true;
	}else if($num==45){
		#SaveNumber45=true;
	}else if($num==46){
		#SaveNumber46=true;
	}else if($num==47){
		#SaveNumber47=true;
	}else if($num==48){
		#SaveNumber48=true;
	}else if($num==49){
		#SaveNumber49=true;
	}else if($num==50){
		#SaveNumber50=true;
	}else if($num==51){
		#SaveNumber51=true;
	}else if($num==52){
		#SaveNumber52=true;
	}else if($num==53){
		#SaveNumber53=true;
	}else if($num==54){
		#SaveNumber54=true;
	}else if($num==55){
		#SaveNumber55=true;
	}else if($num==56){
		#SaveNumber56=true;
	}else if($num==57){
		#SaveNumber57=true;
	}else if($num==58){
		#SaveNumber58=true;
	}else if($num==59){
		#SaveNumber59=true;
	}else if($num==60){
		#SaveNumber60=true;
	}else if($num==61){
		#SaveNumber61=true;
	}else if($num==62){
		#SaveNumber62=true;
	}else if($num==63){
		#SaveNumber63=true;
	}else if($num==64){
		#SaveNumber64=true;
	}else if($num==65){
		#SaveNumber65=true;
	}else if($num==66){
		#SaveNumber66=true;
	}else if($num==67){
		#SaveNumber67=true;
	}else if($num==68){
		#SaveNumber68=true;
	}else if($num==69){
		#SaveNumber69=true;
	}else if($num==70){
		#SaveNumber70=true;
	}else if($num==71){
		#SaveNumber71=true;
	}else if($num==72){
		#SaveNumber72=true;
	}else if($num==73){
		#SaveNumber73=true;
	}else if($num==74){
		#SaveNumber74=true;
	}else if($num==75){
		#SaveNumber75=true;
	}else if($num==76){
		#SaveNumber76=true;
	}else if($num==77){
		#SaveNumber77=true;
	}else if($num==78){
		#SaveNumber78=true;
	}else if($num==79){
		#SaveNumber79=true;
	}else if($num==80){
		#SaveNumber80=true;
	}else if($num==81){
		#SaveNumber81=true;
	}else if($num==82){
		#SaveNumber82=true;
	}else if($num==83){
		#SaveNumber83=true;
	}else if($num==84){
		#SaveNumber84=true;
	}else if($num==85){
		#SaveNumber85=true;
	}else if($num==86){
		#SaveNumber86=true;
	}else if($num==87){
		#SaveNumber87=true;
	}else if($num==88){
		#SaveNumber88=true;
	}else if($num==89){
		#SaveNumber89=true;
	}else if($num==90){
		#SaveNumber90=true;
	}else if($num==91){
		#SaveNumber91=true;
	}else if($num==92){
		#SaveNumber92=true;
	}else if($num==93){
		#SaveNumber93=true;
	}else if($num==94){
		#SaveNumber94=true;
	}else if($num==95){
		#SaveNumber95=true;
	}else if($num==96){
		#SaveNumber96=true;
	}else if($num==97){
		#SaveNumber97=true;
	}else if($num==98){
		#SaveNumber98=true;
	}else if($num==99){
		#SaveNumber99=true;
	}else if($num==100){
		#SaveNumber100=true;
	}else if($num==101){
		#SaveNumber101=true;
	}else if($num==102){
		#SaveNumber102=true;
	}else if($num==103){
		#SaveNumber103=true;
	}else if($num==104){
		#SaveNumber104=true;
	}else if($num==105){
		#SaveNumber105=true;
	}else if($num==106){
		#SaveNumber106=true;
	}else if($num==107){
		#SaveNumber107=true;
	}else if($num==108){
		#SaveNumber108=true;
	}else if($num==109){
		#SaveNumber109=true;
	}else if($num==110){
		#SaveNumber110=true;
	}else if($num==111){
		#SaveNumber111=true;
	}else if($num==112){
		#SaveNumber112=true;
	}else if($num==113){
		#SaveNumber113=true;
	}else if($num==114){
		#SaveNumber114=true;
	}else if($num==115){
		#SaveNumber115=true;
	}else if($num==116){
		#SaveNumber116=true;
	}else if($num==117){
		#SaveNumber117=true;
	}else if($num==118){
		#SaveNumber118=true;
	}else if($num==119){
		#SaveNumber119=true;
	}else if($num==120){
		#SaveNumber120=true;
	}
}


//★セーブ破損チェック
function ExistDataCheck()
{
	if($num==1){
		if(#SaveNumber1){
			$date=#Savedate1;
			$cmt=#Savecmt1;
			$tm=#Savetm1;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==2){
		if(#SaveNumber2){
			$date=#Savedate2;
			$cmt=#Savecmt2;
			$tm=#Savetm2;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==3){
		if(#SaveNumber3){
			$date=#Savedate3;
			$cmt=#Savecmt3;
			$tm=#Savetm3;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==4){
		if(#SaveNumber4){
			$date=#Savedate4;
			$cmt=#Savecmt4;
			$tm=#Savetm4;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==5){
		if(#SaveNumber5){
			$date=#Savedate5;
			$cmt=#Savecmt5;
			$tm=#Savetm5;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==6){
		if(#SaveNumber6){
			$date=#Savedate6;
			$cmt=#Savecmt6;
			$tm=#Savetm6;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==7){
		if(#SaveNumber7){
			$date=#Savedate7;
			$cmt=#Savecmt7;
			$tm=#Savetm7;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==8){
		if(#SaveNumber8){
			$date=#Savedate8;
			$cmt=#Savecmt8;
			$tm=#Savetm8;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==9){
		if(#SaveNumber9){
			$date=#Savedate9;
			$cmt=#Savecmt9;
			$tm=#Savetm9;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==10){
		if(#SaveNumber10){
			$date=#Savedate10;
			$cmt=#Savecmt10;
			$tm=#Savetm10;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==11){
		if(#SaveNumber11){
			$date=#Savedate11;
			$cmt=#Savecmt11;
			$tm=#Savetm11;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==12){
		if(#SaveNumber12){
			$date=#Savedate12;
			$cmt=#Savecmt12;
			$tm=#Savetm12;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==13){
		if(#SaveNumber13){
			$date=#Savedate13;
			$cmt=#Savecmt13;
			$tm=#Savetm13;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==14){
		if(#SaveNumber14){
			$date=#Savedate14;
			$cmt=#Savecmt14;
			$tm=#Savetm14;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==15){
		if(#SaveNumber15){
			$date=#Savedate15;
			$cmt=#Savecmt15;
			$tm=#Savetm15;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==16){
		if(#SaveNumber16){
			$date=#Savedate16;
			$cmt=#Savecmt16;
			$tm=#Savetm16;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==17){
		if(#SaveNumber17){
			$date=#Savedate17;
			$cmt=#Savecmt17;
			$tm=#Savetm17;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==18){
		if(#SaveNumber18){
			$date=#Savedate18;
			$cmt=#Savecmt18;
			$tm=#Savetm18;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==19){
		if(#SaveNumber19){
			$date=#Savedate19;
			$cmt=#Savecmt19;
			$tm=#Savetm19;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==20){
		if(#SaveNumber20){
			$date=#Savedate20;
			$cmt=#Savecmt20;
			$tm=#Savetm20;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==21){
		if(#SaveNumber21){
			$date=#Savedate21;
			$cmt=#Savecmt21;
			$tm=#Savetm21;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==22){
		if(#SaveNumber22){
			$date=#Savedate22;
			$cmt=#Savecmt22;
			$tm=#Savetm22;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==23){
		if(#SaveNumber23){
			$date=#Savedate23;
			$cmt=#Savecmt23;
			$tm=#Savetm23;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==24){
		if(#SaveNumber24){
			$date=#Savedate24;
			$cmt=#Savecmt24;
			$tm=#Savetm24;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==25){
		if(#SaveNumber25){
			$date=#Savedate25;
			$cmt=#Savecmt25;
			$tm=#Savetm25;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==26){
		if(#SaveNumber26){
			$date=#Savedate26;
			$cmt=#Savecmt26;
			$tm=#Savetm26;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==27){
		if(#SaveNumber27){
			$date=#Savedate27;
			$cmt=#Savecmt27;
			$tm=#Savetm27;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==28){
		if(#SaveNumber28){
			$date=#Savedate28;
			$cmt=#Savecmt28;
			$tm=#Savetm28;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==29){
		if(#SaveNumber29){
			$date=#Savedate29;
			$cmt=#Savecmt29;
			$tm=#Savetm29;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==30){
		if(#SaveNumber30){
			$date=#Savedate30;
			$cmt=#Savecmt30;
			$tm=#Savetm30;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==31){
		if(#SaveNumber31){
			$date=#Savedate31;
			$cmt=#Savecmt31;
			$tm=#Savetm31;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==32){
		if(#SaveNumber32){
			$date=#Savedate32;
			$cmt=#Savecmt32;
			$tm=#Savetm32;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==33){
		if(#SaveNumber33){
			$date=#Savedate33;
			$cmt=#Savecmt33;
			$tm=#Savetm33;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==34){
		if(#SaveNumber34){
			$date=#Savedate34;
			$cmt=#Savecmt34;
			$tm=#Savetm34;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==35){
		if(#SaveNumber35){
			$date=#Savedate35;
			$cmt=#Savecmt35;
			$tm=#Savetm35;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==36){
		if(#SaveNumber36){
			$date=#Savedate36;
			$cmt=#Savecmt36;
			$tm=#Savetm36;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==37){
		if(#SaveNumber37){
			$date=#Savedate37;
			$cmt=#Savecmt37;
			$tm=#Savetm37;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==38){
		if(#SaveNumber38){
			$date=#Savedate38;
			$cmt=#Savecmt38;
			$tm=#Savetm38;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==39){
		if(#SaveNumber39){
			$date=#Savedate39;
			$cmt=#Savecmt39;
			$tm=#Savetm39;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==40){
		if(#SaveNumber40){
			$date=#Savedate40;
			$cmt=#Savecmt40;
			$tm=#Savetm40;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==41){
		if(#SaveNumber41){
			$date=#Savedate41;
			$cmt=#Savecmt41;
			$tm=#Savetm41;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==42){
		if(#SaveNumber42){
			$date=#Savedate42;
			$cmt=#Savecmt42;
			$tm=#Savetm42;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==43){
		if(#SaveNumber43){
			$date=#Savedate43;
			$cmt=#Savecmt43;
			$tm=#Savetm43;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==44){
		if(#SaveNumber44){
			$date=#Savedate44;
			$cmt=#Savecmt44;
			$tm=#Savetm44;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==45){
		if(#SaveNumber45){
			$date=#Savedate45;
			$cmt=#Savecmt45;
			$tm=#Savetm45;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==46){
		if(#SaveNumber46){
			$date=#Savedate46;
			$cmt=#Savecmt46;
			$tm=#Savetm46;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==47){
		if(#SaveNumber47){
			$date=#Savedate47;
			$cmt=#Savecmt47;
			$tm=#Savetm47;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==48){
		if(#SaveNumber48){
			$date=#Savedate48;
			$cmt=#Savecmt48;
			$tm=#Savetm48;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==49){
		if(#SaveNumber49){
			$date=#Savedate49;
			$cmt=#Savecmt49;
			$tm=#Savetm49;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==50){
		if(#SaveNumber50){
			$date=#Savedate50;
			$cmt=#Savecmt50;
			$tm=#Savetm50;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==51){
		if(#SaveNumber51){
			$date=#Savedate51;
			$cmt=#Savecmt51;
			$tm=#Savetm51;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==52){
		if(#SaveNumber52){
			$date=#Savedate52;
			$cmt=#Savecmt52;
			$tm=#Savetm52;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==53){
		if(#SaveNumber53){
			$date=#Savedate53;
			$cmt=#Savecmt53;
			$tm=#Savetm53;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==54){
		if(#SaveNumber54){
			$date=#Savedate54;
			$cmt=#Savecmt54;
			$tm=#Savetm54;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==55){
		if(#SaveNumber55){
			$date=#Savedate55;
			$cmt=#Savecmt55;
			$tm=#Savetm55;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==56){
		if(#SaveNumber56){
			$date=#Savedate56;
			$cmt=#Savecmt56;
			$tm=#Savetm56;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==57){
		if(#SaveNumber57){
			$date=#Savedate57;
			$cmt=#Savecmt57;
			$tm=#Savetm57;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==58){
		if(#SaveNumber58){
			$date=#Savedate58;
			$cmt=#Savecmt58;
			$tm=#Savetm58;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==59){
		if(#SaveNumber59){
			$date=#Savedate59;
			$cmt=#Savecmt59;
			$tm=#Savetm59;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==60){
		if(#SaveNumber60){
			$date=#Savedate60;
			$cmt=#Savecmt60;
			$tm=#Savetm60;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==61){
		if(#SaveNumber61){
			$date=#Savedate61;
			$cmt=#Savecmt61;
			$tm=#Savetm61;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==62){
		if(#SaveNumber62){
			$date=#Savedate62;
			$cmt=#Savecmt62;
			$tm=#Savetm62;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==63){
		if(#SaveNumber63){
			$date=#Savedate63;
			$cmt=#Savecmt63;
			$tm=#Savetm63;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==64){
		if(#SaveNumber64){
			$date=#Savedate64;
			$cmt=#Savecmt64;
			$tm=#Savetm64;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==65){
		if(#SaveNumber65){
			$date=#Savedate65;
			$cmt=#Savecmt65;
			$tm=#Savetm65;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==66){
		if(#SaveNumber66){
			$date=#Savedate66;
			$cmt=#Savecmt66;
			$tm=#Savetm66;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==67){
		if(#SaveNumber67){
			$date=#Savedate67;
			$cmt=#Savecmt67;
			$tm=#Savetm67;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==68){
		if(#SaveNumber68){
			$date=#Savedate68;
			$cmt=#Savecmt68;
			$tm=#Savetm68;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==69){
		if(#SaveNumber69){
			$date=#Savedate69;
			$cmt=#Savecmt69;
			$tm=#Savetm69;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==70){
		if(#SaveNumber70){
			$date=#Savedate70;
			$cmt=#Savecmt70;
			$tm=#Savetm70;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==71){
		if(#SaveNumber71){
			$date=#Savedate71;
			$cmt=#Savecmt71;
			$tm=#Savetm71;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==72){
		if(#SaveNumber72){
			$date=#Savedate72;
			$cmt=#Savecmt72;
			$tm=#Savetm72;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==73){
		if(#SaveNumber73){
			$date=#Savedate73;
			$cmt=#Savecmt73;
			$tm=#Savetm73;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==74){
		if(#SaveNumber74){
			$date=#Savedate74;
			$cmt=#Savecmt74;
			$tm=#Savetm74;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==75){
		if(#SaveNumber75){
			$date=#Savedate75;
			$cmt=#Savecmt75;
			$tm=#Savetm75;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==76){
		if(#SaveNumber76){
			$date=#Savedate76;
			$cmt=#Savecmt76;
			$tm=#Savetm76;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==77){
		if(#SaveNumber77){
			$date=#Savedate77;
			$cmt=#Savecmt77;
			$tm=#Savetm77;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==78){
		if(#SaveNumber78){
			$date=#Savedate78;
			$cmt=#Savecmt78;
			$tm=#Savetm78;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==79){
		if(#SaveNumber79){
			$date=#Savedate79;
			$cmt=#Savecmt79;
			$tm=#Savetm79;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==80){
		if(#SaveNumber80){
			$date=#Savedate80;
			$cmt=#Savecmt80;
			$tm=#Savetm80;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==81){
		if(#SaveNumber81){
			$date=#Savedate81;
			$cmt=#Savecmt81;
			$tm=#Savetm81;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==82){
		if(#SaveNumber82){
			$date=#Savedate82;
			$cmt=#Savecmt82;
			$tm=#Savetm82;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==83){
		if(#SaveNumber83){
			$date=#Savedate83;
			$cmt=#Savecmt83;
			$tm=#Savetm83;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==84){
		if(#SaveNumber84){
			$date=#Savedate84;
			$cmt=#Savecmt84;
			$tm=#Savetm84;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==85){
		if(#SaveNumber85){
			$date=#Savedate85;
			$cmt=#Savecmt85;
			$tm=#Savetm85;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==86){
		if(#SaveNumber86){
			$date=#Savedate86;
			$cmt=#Savecmt86;
			$tm=#Savetm86;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==87){
		if(#SaveNumber87){
			$date=#Savedate87;
			$cmt=#Savecmt87;
			$tm=#Savetm87;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==88){
		if(#SaveNumber88){
			$date=#Savedate88;
			$cmt=#Savecmt88;
			$tm=#Savetm88;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==89){
		if(#SaveNumber89){
			$date=#Savedate89;
			$cmt=#Savecmt89;
			$tm=#Savetm89;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==90){
		if(#SaveNumber90){
			$date=#Savedate90;
			$cmt=#Savecmt90;
			$tm=#Savetm90;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==91){
		if(#SaveNumber91){
			$date=#Savedate91;
			$cmt=#Savecmt91;
			$tm=#Savetm91;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==92){
		if(#SaveNumber92){
			$date=#Savedate92;
			$cmt=#Savecmt92;
			$tm=#Savetm92;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==93){
		if(#SaveNumber93){
			$date=#Savedate93;
			$cmt=#Savecmt93;
			$tm=#Savetm93;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==94){
		if(#SaveNumber94){
			$date=#Savedate94;
			$cmt=#Savecmt94;
			$tm=#Savetm94;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==95){
		if(#SaveNumber95){
			$date=#Savedate95;
			$cmt=#Savecmt95;
			$tm=#Savetm95;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==96){
		if(#SaveNumber96){
			$date=#Savedate96;
			$cmt=#Savecmt96;
			$tm=#Savetm96;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==97){
		if(#SaveNumber97){
			$date=#Savedate97;
			$cmt=#Savecmt97;
			$tm=#Savetm97;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==98){
		if(#SaveNumber98){
			$date=#Savedate98;
			$cmt=#Savecmt98;
			$tm=#Savetm98;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==99){
		if(#SaveNumber99){
			$date=#Savedate99;
			$cmt=#Savecmt99;
			$tm=#Savetm99;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==100){
		if(#SaveNumber100){
			$date=#Savedate100;
			$cmt=#Savecmt100;
			$tm=#Savetm100;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==101){
		if(#SaveNumber101){
			$date=#Savedate101;
			$cmt=#Savecmt101;
			$tm=#Savetm101;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==102){
		if(#SaveNumber102){
			$date=#Savedate102;
			$cmt=#Savecmt102;
			$tm=#Savetm102;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==103){
		if(#SaveNumber103){
			$date=#Savedate103;
			$cmt=#Savecmt103;
			$tm=#Savetm103;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==104){
		if(#SaveNumber104){
			$date=#Savedate104;
			$cmt=#Savecmt104;
			$tm=#Savetm104;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==105){
		if(#SaveNumber105){
			$date=#Savedate105;
			$cmt=#Savecmt105;
			$tm=#Savetm105;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==106){
		if(#SaveNumber106){
			$date=#Savedate106;
			$cmt=#Savecmt106;
			$tm=#Savetm106;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==107){
		if(#SaveNumber107){
			$date=#Savedate107;
			$cmt=#Savecmt107;
			$tm=#Savetm107;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==108){
		if(#SaveNumber108){
			$date=#Savedate108;
			$cmt=#Savecmt108;
			$tm=#Savetm108;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==109){
		if(#SaveNumber109){
			$date=#Savedate109;
			$cmt=#Savecmt109;
			$tm=#Savetm109;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==110){
		if(#SaveNumber110){
			$date=#Savedate110;
			$cmt=#Savecmt110;
			$tm=#Savetm110;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==111){
		if(#SaveNumber111){
			$date=#Savedate111;
			$cmt=#Savecmt111;
			$tm=#Savetm111;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==112){
		if(#SaveNumber112){
			$date=#Savedate112;
			$cmt=#Savecmt112;
			$tm=#Savetm112;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==113){
		if(#SaveNumber113){
			$date=#Savedate113;
			$cmt=#Savecmt113;
			$tm=#Savetm113;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==114){
		if(#SaveNumber114){
			$date=#Savedate114;
			$cmt=#Savecmt114;
			$tm=#Savetm114;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==115){
		if(#SaveNumber115){
			$date=#Savedate115;
			$cmt=#Savecmt115;
			$tm=#Savetm115;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==116){
		if(#SaveNumber116){
			$date=#Savedate116;
			$cmt=#Savecmt116;
			$tm=#Savetm116;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==117){
		if(#SaveNumber117){
			$date=#Savedate117;
			$cmt=#Savecmt117;
			$tm=#Savetm117;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==118){
		if(#SaveNumber118){
			$date=#Savedate118;
			$cmt=#Savecmt118;
			$tm=#Savetm118;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==119){
		if(#SaveNumber119){
			$date=#Savedate119;
			$cmt=#Savecmt119;
			$tm=#Savetm119;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}else if($num==120){
		if(#SaveNumber120){
			$date=#Savedate120;
			$cmt=#Savecmt120;
			$tm=#Savetm120;
			$SaveON=true;DialogDataCheck();
		}else{$SaveON=false;}
	}
}


function ExistSaveNumber()
{
	if($num==1){
		if(#SaveNumber1){$SaveON=true;}else{$SaveON=false;}
	}else if($num==2){
		if(#SaveNumber2){$SaveON=true;}else{$SaveON=false;}
	}else if($num==3){
		if(#SaveNumber3){$SaveON=true;}else{$SaveON=false;}
	}else if($num==4){
		if(#SaveNumber4){$SaveON=true;}else{$SaveON=false;}
	}else if($num==5){
		if(#SaveNumber5){$SaveON=true;}else{$SaveON=false;}
	}else if($num==6){
		if(#SaveNumber6){$SaveON=true;}else{$SaveON=false;}
	}else if($num==7){
		if(#SaveNumber7){$SaveON=true;}else{$SaveON=false;}
	}else if($num==8){
		if(#SaveNumber8){$SaveON=true;}else{$SaveON=false;}
	}else if($num==9){
		if(#SaveNumber9){$SaveON=true;}else{$SaveON=false;}
	}else if($num==10){
		if(#SaveNumber10){$SaveON=true;}else{$SaveON=false;}
	}else if($num==11){
		if(#SaveNumber11){$SaveON=true;}else{$SaveON=false;}
	}else if($num==12){
		if(#SaveNumber12){$SaveON=true;}else{$SaveON=false;}
	}else if($num==13){
		if(#SaveNumber13){$SaveON=true;}else{$SaveON=false;}
	}else if($num==14){
		if(#SaveNumber14){$SaveON=true;}else{$SaveON=false;}
	}else if($num==15){
		if(#SaveNumber15){$SaveON=true;}else{$SaveON=false;}
	}else if($num==16){
		if(#SaveNumber16){$SaveON=true;}else{$SaveON=false;}
	}else if($num==17){
		if(#SaveNumber17){$SaveON=true;}else{$SaveON=false;}
	}else if($num==18){
		if(#SaveNumber18){$SaveON=true;}else{$SaveON=false;}
	}else if($num==19){
		if(#SaveNumber19){$SaveON=true;}else{$SaveON=false;}
	}else if($num==20){
		if(#SaveNumber20){$SaveON=true;}else{$SaveON=false;}
	}else if($num==21){
		if(#SaveNumber21){$SaveON=true;}else{$SaveON=false;}
	}else if($num==22){
		if(#SaveNumber22){$SaveON=true;}else{$SaveON=false;}
	}else if($num==23){
		if(#SaveNumber23){$SaveON=true;}else{$SaveON=false;}
	}else if($num==24){
		if(#SaveNumber24){$SaveON=true;}else{$SaveON=false;}
	}else if($num==25){
		if(#SaveNumber25){$SaveON=true;}else{$SaveON=false;}
	}else if($num==26){
		if(#SaveNumber26){$SaveON=true;}else{$SaveON=false;}
	}else if($num==27){
		if(#SaveNumber27){$SaveON=true;}else{$SaveON=false;}
	}else if($num==28){
		if(#SaveNumber28){$SaveON=true;}else{$SaveON=false;}
	}else if($num==29){
		if(#SaveNumber29){$SaveON=true;}else{$SaveON=false;}
	}else if($num==30){
		if(#SaveNumber30){$SaveON=true;}else{$SaveON=false;}
	}else if($num==31){
		if(#SaveNumber31){$SaveON=true;}else{$SaveON=false;}
	}else if($num==32){
		if(#SaveNumber32){$SaveON=true;}else{$SaveON=false;}
	}else if($num==33){
		if(#SaveNumber33){$SaveON=true;}else{$SaveON=false;}
	}else if($num==34){
		if(#SaveNumber34){$SaveON=true;}else{$SaveON=false;}
	}else if($num==35){
		if(#SaveNumber35){$SaveON=true;}else{$SaveON=false;}
	}else if($num==36){
		if(#SaveNumber36){$SaveON=true;}else{$SaveON=false;}
	}else if($num==37){
		if(#SaveNumber37){$SaveON=true;}else{$SaveON=false;}
	}else if($num==38){
		if(#SaveNumber38){$SaveON=true;}else{$SaveON=false;}
	}else if($num==39){
		if(#SaveNumber39){$SaveON=true;}else{$SaveON=false;}
	}else if($num==40){
		if(#SaveNumber40){$SaveON=true;}else{$SaveON=false;}
	}else if($num==41){
		if(#SaveNumber41){$SaveON=true;}else{$SaveON=false;}
	}else if($num==42){
		if(#SaveNumber42){$SaveON=true;}else{$SaveON=false;}
	}else if($num==43){
		if(#SaveNumber43){$SaveON=true;}else{$SaveON=false;}
	}else if($num==44){
		if(#SaveNumber44){$SaveON=true;}else{$SaveON=false;}
	}else if($num==45){
		if(#SaveNumber45){$SaveON=true;}else{$SaveON=false;}
	}else if($num==46){
		if(#SaveNumber46){$SaveON=true;}else{$SaveON=false;}
	}else if($num==47){
		if(#SaveNumber47){$SaveON=true;}else{$SaveON=false;}
	}else if($num==48){
		if(#SaveNumber48){$SaveON=true;}else{$SaveON=false;}
	}else if($num==49){
		if(#SaveNumber49){$SaveON=true;}else{$SaveON=false;}
	}else if($num==50){
		if(#SaveNumber50){$SaveON=true;}else{$SaveON=false;}
	}else if($num==51){
		if(#SaveNumber51){$SaveON=true;}else{$SaveON=false;}
	}else if($num==52){
		if(#SaveNumber52){$SaveON=true;}else{$SaveON=false;}
	}else if($num==53){
		if(#SaveNumber53){$SaveON=true;}else{$SaveON=false;}
	}else if($num==54){
		if(#SaveNumber54){$SaveON=true;}else{$SaveON=false;}
	}else if($num==55){
		if(#SaveNumber55){$SaveON=true;}else{$SaveON=false;}
	}else if($num==56){
		if(#SaveNumber56){$SaveON=true;}else{$SaveON=false;}
	}else if($num==57){
		if(#SaveNumber57){$SaveON=true;}else{$SaveON=false;}
	}else if($num==58){
		if(#SaveNumber58){$SaveON=true;}else{$SaveON=false;}
	}else if($num==59){
		if(#SaveNumber59){$SaveON=true;}else{$SaveON=false;}
	}else if($num==60){
		if(#SaveNumber60){$SaveON=true;}else{$SaveON=false;}
	}else if($num==61){
		if(#SaveNumber61){$SaveON=true;}else{$SaveON=false;}
	}else if($num==62){
		if(#SaveNumber62){$SaveON=true;}else{$SaveON=false;}
	}else if($num==63){
		if(#SaveNumber63){$SaveON=true;}else{$SaveON=false;}
	}else if($num==64){
		if(#SaveNumber64){$SaveON=true;}else{$SaveON=false;}
	}else if($num==65){
		if(#SaveNumber65){$SaveON=true;}else{$SaveON=false;}
	}else if($num==66){
		if(#SaveNumber66){$SaveON=true;}else{$SaveON=false;}
	}else if($num==67){
		if(#SaveNumber67){$SaveON=true;}else{$SaveON=false;}
	}else if($num==68){
		if(#SaveNumber68){$SaveON=true;}else{$SaveON=false;}
	}else if($num==69){
		if(#SaveNumber69){$SaveON=true;}else{$SaveON=false;}
	}else if($num==70){
		if(#SaveNumber70){$SaveON=true;}else{$SaveON=false;}
	}else if($num==71){
		if(#SaveNumber71){$SaveON=true;}else{$SaveON=false;}
	}else if($num==72){
		if(#SaveNumber72){$SaveON=true;}else{$SaveON=false;}
	}else if($num==73){
		if(#SaveNumber73){$SaveON=true;}else{$SaveON=false;}
	}else if($num==74){
		if(#SaveNumber74){$SaveON=true;}else{$SaveON=false;}
	}else if($num==75){
		if(#SaveNumber75){$SaveON=true;}else{$SaveON=false;}
	}else if($num==76){
		if(#SaveNumber76){$SaveON=true;}else{$SaveON=false;}
	}else if($num==77){
		if(#SaveNumber77){$SaveON=true;}else{$SaveON=false;}
	}else if($num==78){
		if(#SaveNumber78){$SaveON=true;}else{$SaveON=false;}
	}else if($num==79){
		if(#SaveNumber79){$SaveON=true;}else{$SaveON=false;}
	}else if($num==80){
		if(#SaveNumber80){$SaveON=true;}else{$SaveON=false;}
	}else if($num==81){
		if(#SaveNumber81){$SaveON=true;}else{$SaveON=false;}
	}else if($num==82){
		if(#SaveNumber82){$SaveON=true;}else{$SaveON=false;}
	}else if($num==83){
		if(#SaveNumber83){$SaveON=true;}else{$SaveON=false;}
	}else if($num==84){
		if(#SaveNumber84){$SaveON=true;}else{$SaveON=false;}
	}else if($num==85){
		if(#SaveNumber85){$SaveON=true;}else{$SaveON=false;}
	}else if($num==86){
		if(#SaveNumber86){$SaveON=true;}else{$SaveON=false;}
	}else if($num==87){
		if(#SaveNumber87){$SaveON=true;}else{$SaveON=false;}
	}else if($num==88){
		if(#SaveNumber88){$SaveON=true;}else{$SaveON=false;}
	}else if($num==89){
		if(#SaveNumber89){$SaveON=true;}else{$SaveON=false;}
	}else if($num==90){
		if(#SaveNumber90){$SaveON=true;}else{$SaveON=false;}
	}else if($num==91){
		if(#SaveNumber91){$SaveON=true;}else{$SaveON=false;}
	}else if($num==92){
		if(#SaveNumber92){$SaveON=true;}else{$SaveON=false;}
	}else if($num==93){
		if(#SaveNumber93){$SaveON=true;}else{$SaveON=false;}
	}else if($num==94){
		if(#SaveNumber94){$SaveON=true;}else{$SaveON=false;}
	}else if($num==95){
		if(#SaveNumber95){$SaveON=true;}else{$SaveON=false;}
	}else if($num==96){
		if(#SaveNumber96){$SaveON=true;}else{$SaveON=false;}
	}else if($num==97){
		if(#SaveNumber97){$SaveON=true;}else{$SaveON=false;}
	}else if($num==98){
		if(#SaveNumber98){$SaveON=true;}else{$SaveON=false;}
	}else if($num==99){
		if(#SaveNumber99){$SaveON=true;}else{$SaveON=false;}
	}else if($num==100){
		if(#SaveNumber100){$SaveON=true;}else{$SaveON=false;}
	}else if($num==101){
		if(#SaveNumber101){$SaveON=true;}else{$SaveON=false;}
	}else if($num==102){
		if(#SaveNumber102){$SaveON=true;}else{$SaveON=false;}
	}else if($num==103){
		if(#SaveNumber103){$SaveON=true;}else{$SaveON=false;}
	}else if($num==104){
		if(#SaveNumber104){$SaveON=true;}else{$SaveON=false;}
	}else if($num==105){
		if(#SaveNumber105){$SaveON=true;}else{$SaveON=false;}
	}else if($num==106){
		if(#SaveNumber106){$SaveON=true;}else{$SaveON=false;}
	}else if($num==107){
		if(#SaveNumber107){$SaveON=true;}else{$SaveON=false;}
	}else if($num==108){
		if(#SaveNumber108){$SaveON=true;}else{$SaveON=false;}
	}else if($num==109){
		if(#SaveNumber109){$SaveON=true;}else{$SaveON=false;}
	}else if($num==110){
		if(#SaveNumber110){$SaveON=true;}else{$SaveON=false;}
	}else if($num==111){
		if(#SaveNumber111){$SaveON=true;}else{$SaveON=false;}
	}else if($num==112){
		if(#SaveNumber112){$SaveON=true;}else{$SaveON=false;}
	}else if($num==113){
		if(#SaveNumber113){$SaveON=true;}else{$SaveON=false;}
	}else if($num==114){
		if(#SaveNumber114){$SaveON=true;}else{$SaveON=false;}
	}else if($num==115){
		if(#SaveNumber115){$SaveON=true;}else{$SaveON=false;}
	}else if($num==116){
		if(#SaveNumber116){$SaveON=true;}else{$SaveON=false;}
	}else if($num==117){
		if(#SaveNumber117){$SaveON=true;}else{$SaveON=false;}
	}else if($num==118){
		if(#SaveNumber118){$SaveON=true;}else{$SaveON=false;}
	}else if($num==119){
		if(#SaveNumber119){$SaveON=true;}else{$SaveON=false;}
	}else if($num==120){
		if(#SaveNumber120){$SaveON=true;}else{$SaveON=false;}
	}
}


function SaveBAK()
{
	if(#save_page==1){
		CreateTexture("BAK1",10001,center,middle,"cg/sys/save/NO-001.png");
		SetAlias("BAK1","save-bak1");
	}else if(#save_page==2){
		CreateTexture("BAK2",10000,center,middle,"cg/sys/save/NO-002.png");
		SetAlias("BAK2","save-bak2");
	}else if(#save_page==3){
		CreateTexture("BAK3",10000,center,middle,"cg/sys/save/NO-003.png");
		SetAlias("BAK3","save-bak3");
	}else if(#save_page==4){
		CreateTexture("BAK4",10000,center,middle,"cg/sys/save/NO-004.png");
		SetAlias("BAK4","save-bak4");
	}else if(#save_page==5){
		CreateTexture("BAK5",10000,center,middle,"cg/sys/save/NO-005.png");
		SetAlias("BAK5","save-bak5");
	}else if(#save_page==6){
		CreateTexture("BAK6",10000,center,middle,"cg/sys/save/NO-006.png");
		SetAlias("BAK6","save-bak6");
	}else if(#save_page==7){
		CreateTexture("BAK7",10000,center,middle,"cg/sys/save/NO-007.png");
		SetAlias("BAK7","save-bak7");
	}else if(#save_page==8){
		CreateTexture("BAK8",10000,center,middle,"cg/sys/save/NO-008.png");
		SetAlias("BAK8","save-bak8");
	}else if(#save_page==9){
		CreateTexture("BAK9",10000,center,middle,"cg/sys/save/NO-009.png");
		SetAlias("BAK9","save-bak9");
	}else if(#save_page==10){
		CreateTexture("BAK10",10000,center,middle,"cg/sys/save/NO-010.png");
		SetAlias("BAK10","save-bak10");
	}else{
		CreateTexture("BAK1",10001,center,middle,"cg/sys/save/NO-001.png");
		SetAlias("BAK1","save-bak1");
	}
}



function LoadPath()
{
	if($num==1){
		$date=#Savedate1;
		$cmt=#Savecmt1;
		$tm=#Savetm1;
	}else if($num==2){
		$date=#Savedate2;
		$cmt=#Savecmt2;
		$tm=#Savetm2;
	}else if($num==3){
		$date=#Savedate3;
		$cmt=#Savecmt3;
		$tm=#Savetm3;
	}else if($num==4){
		$date=#Savedate4;
		$cmt=#Savecmt4;
		$tm=#Savetm4;
	}else if($num==5){
		$date=#Savedate5;
		$cmt=#Savecmt5;
		$tm=#Savetm5;
	}else if($num==6){
		$date=#Savedate6;
		$cmt=#Savecmt6;
		$tm=#Savetm6;
	}else if($num==7){
		$date=#Savedate7;
		$cmt=#Savecmt7;
		$tm=#Savetm7;
	}else if($num==8){
		$date=#Savedate8;
		$cmt=#Savecmt8;
		$tm=#Savetm8;
	}else if($num==9){
		$date=#Savedate9;
		$cmt=#Savecmt9;
		$tm=#Savetm9;
	}else if($num==10){
		$date=#Savedate10;
		$cmt=#Savecmt10;
		$tm=#Savetm10;
	}else if($num==11){
		$date=#Savedate11;
		$cmt=#Savecmt11;
		$tm=#Savetm11;
	}else if($num==12){
		$date=#Savedate12;
		$cmt=#Savecmt12;
		$tm=#Savetm12;
	}else if($num==13){
		$date=#Savedate13;
		$cmt=#Savecmt13;
		$tm=#Savetm13;
	}else if($num==14){
		$date=#Savedate14;
		$cmt=#Savecmt14;
		$tm=#Savetm14;
	}else if($num==15){
		$date=#Savedate15;
		$cmt=#Savecmt15;
		$tm=#Savetm15;
	}else if($num==16){
		$date=#Savedate16;
		$cmt=#Savecmt16;
		$tm=#Savetm16;
	}else if($num==17){
		$date=#Savedate17;
		$cmt=#Savecmt17;
		$tm=#Savetm17;
	}else if($num==18){
		$date=#Savedate18;
		$cmt=#Savecmt18;
		$tm=#Savetm18;
	}else if($num==19){
		$date=#Savedate19;
		$cmt=#Savecmt19;
		$tm=#Savetm19;
	}else if($num==20){
		$date=#Savedate20;
		$cmt=#Savecmt20;
		$tm=#Savetm20;
	}else if($num==21){
		$date=#Savedate21;
		$cmt=#Savecmt21;
		$tm=#Savetm21;
	}else if($num==22){
		$date=#Savedate22;
		$cmt=#Savecmt22;
		$tm=#Savetm22;
	}else if($num==23){
		$date=#Savedate23;
		$cmt=#Savecmt23;
		$tm=#Savetm23;
	}else if($num==24){
		$date=#Savedate24;
		$cmt=#Savecmt24;
		$tm=#Savetm24;
	}else if($num==25){
		$date=#Savedate25;
		$cmt=#Savecmt25;
		$tm=#Savetm25;
	}else if($num==26){
		$date=#Savedate26;
		$cmt=#Savecmt26;
		$tm=#Savetm26;
	}else if($num==27){
		$date=#Savedate27;
		$cmt=#Savecmt27;
		$tm=#Savetm27;
	}else if($num==28){
		$date=#Savedate28;
		$cmt=#Savecmt28;
		$tm=#Savetm28;
	}else if($num==29){
		$date=#Savedate29;
		$cmt=#Savecmt29;
		$tm=#Savetm29;
	}else if($num==30){
		$date=#Savedate30;
		$cmt=#Savecmt30;
		$tm=#Savetm30;
	}else if($num==31){
		$date=#Savedate31;
		$cmt=#Savecmt31;
		$tm=#Savetm31;
	}else if($num==32){
		$date=#Savedate32;
		$cmt=#Savecmt32;
		$tm=#Savetm32;
	}else if($num==33){
		$date=#Savedate33;
		$cmt=#Savecmt33;
		$tm=#Savetm33;
	}else if($num==34){
		$date=#Savedate34;
		$cmt=#Savecmt34;
		$tm=#Savetm34;
	}else if($num==35){
		$date=#Savedate35;
		$cmt=#Savecmt35;
		$tm=#Savetm35;
	}else if($num==36){
		$date=#Savedate36;
		$cmt=#Savecmt36;
		$tm=#Savetm36;
	}else if($num==37){
		$date=#Savedate37;
		$cmt=#Savecmt37;
		$tm=#Savetm37;
	}else if($num==38){
		$date=#Savedate38;
		$cmt=#Savecmt38;
		$tm=#Savetm38;
	}else if($num==39){
		$date=#Savedate39;
		$cmt=#Savecmt39;
		$tm=#Savetm39;
	}else if($num==40){
		$date=#Savedate40;
		$cmt=#Savecmt40;
		$tm=#Savetm40;
	}else if($num==41){
		$date=#Savedate41;
		$cmt=#Savecmt41;
		$tm=#Savetm41;
	}else if($num==42){
		$date=#Savedate42;
		$cmt=#Savecmt42;
		$tm=#Savetm42;
	}else if($num==43){
		$date=#Savedate43;
		$cmt=#Savecmt43;
		$tm=#Savetm43;
	}else if($num==44){
		$date=#Savedate44;
		$cmt=#Savecmt44;
		$tm=#Savetm44;
	}else if($num==45){
		$date=#Savedate45;
		$cmt=#Savecmt45;
		$tm=#Savetm45;
	}else if($num==46){
		$date=#Savedate46;
		$cmt=#Savecmt46;
		$tm=#Savetm46;
	}else if($num==47){
		$date=#Savedate47;
		$cmt=#Savecmt47;
		$tm=#Savetm47;
	}else if($num==48){
		$date=#Savedate48;
		$cmt=#Savecmt48;
		$tm=#Savetm48;
	}else if($num==49){
		$date=#Savedate49;
		$cmt=#Savecmt49;
		$tm=#Savetm49;
	}else if($num==50){
		$date=#Savedate50;
		$cmt=#Savecmt50;
		$tm=#Savetm50;
	}else if($num==51){
		$date=#Savedate51;
		$cmt=#Savecmt51;
		$tm=#Savetm51;
	}else if($num==52){
		$date=#Savedate52;
		$cmt=#Savecmt52;
		$tm=#Savetm52;
	}else if($num==53){
		$date=#Savedate53;
		$cmt=#Savecmt53;
		$tm=#Savetm53;
	}else if($num==54){
		$date=#Savedate54;
		$cmt=#Savecmt54;
		$tm=#Savetm54;
	}else if($num==55){
		$date=#Savedate55;
		$cmt=#Savecmt55;
		$tm=#Savetm55;
	}else if($num==56){
		$date=#Savedate56;
		$cmt=#Savecmt56;
		$tm=#Savetm56;
	}else if($num==57){
		$date=#Savedate57;
		$cmt=#Savecmt57;
		$tm=#Savetm57;
	}else if($num==58){
		$date=#Savedate58;
		$cmt=#Savecmt58;
		$tm=#Savetm58;
	}else if($num==59){
		$date=#Savedate59;
		$cmt=#Savecmt59;
		$tm=#Savetm59;
	}else if($num==60){
		$date=#Savedate60;
		$cmt=#Savecmt60;
		$tm=#Savetm60;
	}else if($num==61){
		$date=#Savedate61;
		$cmt=#Savecmt61;
		$tm=#Savetm61;
	}else if($num==62){
		$date=#Savedate62;
		$cmt=#Savecmt62;
		$tm=#Savetm62;
	}else if($num==63){
		$date=#Savedate63;
		$cmt=#Savecmt63;
		$tm=#Savetm63;
	}else if($num==64){
		$date=#Savedate64;
		$cmt=#Savecmt64;
		$tm=#Savetm64;
	}else if($num==65){
		$date=#Savedate65;
		$cmt=#Savecmt65;
		$tm=#Savetm65;
	}else if($num==66){
		$date=#Savedate66;
		$cmt=#Savecmt66;
		$tm=#Savetm66;
	}else if($num==67){
		$date=#Savedate67;
		$cmt=#Savecmt67;
		$tm=#Savetm67;
	}else if($num==68){
		$date=#Savedate68;
		$cmt=#Savecmt68;
		$tm=#Savetm68;
	}else if($num==69){
		$date=#Savedate69;
		$cmt=#Savecmt69;
		$tm=#Savetm69;
	}else if($num==70){
		$date=#Savedate70;
		$cmt=#Savecmt70;
		$tm=#Savetm70;
	}else if($num==71){
		$date=#Savedate71;
		$cmt=#Savecmt71;
		$tm=#Savetm71;
	}else if($num==72){
		$date=#Savedate72;
		$cmt=#Savecmt72;
		$tm=#Savetm72;
	}else if($num==73){
		$date=#Savedate73;
		$cmt=#Savecmt73;
		$tm=#Savetm73;
	}else if($num==74){
		$date=#Savedate74;
		$cmt=#Savecmt74;
		$tm=#Savetm74;
	}else if($num==75){
		$date=#Savedate75;
		$cmt=#Savecmt75;
		$tm=#Savetm75;
	}else if($num==76){
		$date=#Savedate76;
		$cmt=#Savecmt76;
		$tm=#Savetm76;
	}else if($num==77){
		$date=#Savedate77;
		$cmt=#Savecmt77;
		$tm=#Savetm77;
	}else if($num==78){
		$date=#Savedate78;
		$cmt=#Savecmt78;
		$tm=#Savetm78;
	}else if($num==79){
		$date=#Savedate79;
		$cmt=#Savecmt79;
		$tm=#Savetm79;
	}else if($num==80){
		$date=#Savedate80;
		$cmt=#Savecmt80;
		$tm=#Savetm80;
	}else if($num==81){
		$date=#Savedate81;
		$cmt=#Savecmt81;
		$tm=#Savetm81;
	}else if($num==82){
		$date=#Savedate82;
		$cmt=#Savecmt82;
		$tm=#Savetm82;
	}else if($num==83){
		$date=#Savedate83;
		$cmt=#Savecmt83;
		$tm=#Savetm83;
	}else if($num==84){
		$date=#Savedate84;
		$cmt=#Savecmt84;
		$tm=#Savetm84;
	}else if($num==85){
		$date=#Savedate85;
		$cmt=#Savecmt85;
		$tm=#Savetm85;
	}else if($num==86){
		$date=#Savedate86;
		$cmt=#Savecmt86;
		$tm=#Savetm86;
	}else if($num==87){
		$date=#Savedate87;
		$cmt=#Savecmt87;
		$tm=#Savetm87;
	}else if($num==88){
		$date=#Savedate88;
		$cmt=#Savecmt88;
		$tm=#Savetm88;
	}else if($num==89){
		$date=#Savedate89;
		$cmt=#Savecmt89;
		$tm=#Savetm89;
	}else if($num==90){
		$date=#Savedate90;
		$cmt=#Savecmt90;
		$tm=#Savetm90;
	}else if($num==91){
		$date=#Savedate91;
		$cmt=#Savecmt91;
		$tm=#Savetm91;
	}else if($num==92){
		$date=#Savedate92;
		$cmt=#Savecmt92;
		$tm=#Savetm92;
	}else if($num==93){
		$date=#Savedate93;
		$cmt=#Savecmt93;
		$tm=#Savetm93;
	}else if($num==94){
		$date=#Savedate94;
		$cmt=#Savecmt94;
		$tm=#Savetm94;
	}else if($num==95){
		$date=#Savedate95;
		$cmt=#Savecmt95;
		$tm=#Savetm95;
	}else if($num==96){
		$date=#Savedate96;
		$cmt=#Savecmt96;
		$tm=#Savetm96;
	}else if($num==97){
		$date=#Savedate97;
		$cmt=#Savecmt97;
		$tm=#Savetm97;
	}else if($num==98){
		$date=#Savedate98;
		$cmt=#Savecmt98;
		$tm=#Savetm98;
	}else if($num==99){
		$date=#Savedate99;
		$cmt=#Savecmt99;
		$tm=#Savetm99;
	}else if($num==100){
		$date=#Savedate100;
		$cmt=#Savecmt100;
		$tm=#Savetm100;
	}else if($num==101){
		$date=#Savedate101;
		$cmt=#Savecmt101;
		$tm=#Savetm101;
	}else if($num==102){
		$date=#Savedate102;
		$cmt=#Savecmt102;
		$tm=#Savetm102;
	}else if($num==103){
		$date=#Savedate103;
		$cmt=#Savecmt103;
		$tm=#Savetm103;
	}else if($num==104){
		$date=#Savedate104;
		$cmt=#Savecmt104;
		$tm=#Savetm104;
	}else if($num==105){
		$date=#Savedate105;
		$cmt=#Savecmt105;
		$tm=#Savetm105;
	}else if($num==106){
		$date=#Savedate106;
		$cmt=#Savecmt106;
		$tm=#Savetm106;
	}else if($num==107){
		$date=#Savedate107;
		$cmt=#Savecmt107;
		$tm=#Savetm107;
	}else if($num==108){
		$date=#Savedate108;
		$cmt=#Savecmt108;
		$tm=#Savetm108;
	}else if($num==109){
		$date=#Savedate109;
		$cmt=#Savecmt109;
		$tm=#Savetm109;
	}else if($num==110){
		$date=#Savedate110;
		$cmt=#Savecmt110;
		$tm=#Savetm110;
	}else if($num==111){
		$date=#Savedate111;
		$cmt=#Savecmt111;
		$tm=#Savetm111;
	}else if($num==112){
		$date=#Savedate112;
		$cmt=#Savecmt112;
		$tm=#Savetm112;
	}else if($num==113){
		$date=#Savedate113;
		$cmt=#Savecmt113;
		$tm=#Savetm113;
	}else if($num==114){
		$date=#Savedate114;
		$cmt=#Savecmt114;
		$tm=#Savetm114;
	}else if($num==115){
		$date=#Savedate115;
		$cmt=#Savecmt115;
		$tm=#Savetm115;
	}else if($num==116){
		$date=#Savedate116;
		$cmt=#Savecmt116;
		$tm=#Savetm116;
	}else if($num==117){
		$date=#Savedate117;
		$cmt=#Savecmt117;
		$tm=#Savetm117;
	}else if($num==118){
		$date=#Savedate118;
		$cmt=#Savecmt118;
		$tm=#Savetm118;
	}else if($num==119){
		$date=#Savedate119;
		$cmt=#Savecmt119;
		$tm=#Savetm119;
	}else if($num==120){
		$date=#Savedate120;
		$cmt=#Savecmt120;
		$tm=#Savetm120;
	}
}

function SavePath()
{
	if($num==1){
		#Savedate1=$date_str;
		#Savecmt1=$cmt_str;
		#Savetm1=$tm_str;
	}else if($num==2){
		#Savedate2=$date_str;
		#Savecmt2=$cmt_str;
		#Savetm2=$tm_str;
	}else if($num==3){
		#Savedate3=$date_str;
		#Savecmt3=$cmt_str;
		#Savetm3=$tm_str;
	}else if($num==4){
		#Savedate4=$date_str;
		#Savecmt4=$cmt_str;
		#Savetm4=$tm_str;
	}else if($num==5){
		#Savedate5=$date_str;
		#Savecmt5=$cmt_str;
		#Savetm5=$tm_str;
	}else if($num==6){
		#Savedate6=$date_str;
		#Savecmt6=$cmt_str;
		#Savetm6=$tm_str;
	}else if($num==7){
		#Savedate7=$date_str;
		#Savecmt7=$cmt_str;
		#Savetm7=$tm_str;
	}else if($num==8){
		#Savedate8=$date_str;
		#Savecmt8=$cmt_str;
		#Savetm8=$tm_str;
	}else if($num==9){
		#Savedate9=$date_str;
		#Savecmt9=$cmt_str;
		#Savetm9=$tm_str;
	}else if($num==10){
		#Savedate10=$date_str;
		#Savecmt10=$cmt_str;
		#Savetm10=$tm_str;
	}else if($num==11){
		#Savedate11=$date_str;
		#Savecmt11=$cmt_str;
		#Savetm11=$tm_str;
	}else if($num==12){
		#Savedate12=$date_str;
		#Savecmt12=$cmt_str;
		#Savetm12=$tm_str;
	}else if($num==13){
		#Savedate13=$date_str;
		#Savecmt13=$cmt_str;
		#Savetm13=$tm_str;
	}else if($num==14){
		#Savedate14=$date_str;
		#Savecmt14=$cmt_str;
		#Savetm14=$tm_str;
	}else if($num==15){
		#Savedate15=$date_str;
		#Savecmt15=$cmt_str;
		#Savetm15=$tm_str;
	}else if($num==16){
		#Savedate16=$date_str;
		#Savecmt16=$cmt_str;
		#Savetm16=$tm_str;
	}else if($num==17){
		#Savedate17=$date_str;
		#Savecmt17=$cmt_str;
		#Savetm17=$tm_str;
	}else if($num==18){
		#Savedate18=$date_str;
		#Savecmt18=$cmt_str;
		#Savetm18=$tm_str;
	}else if($num==19){
		#Savedate19=$date_str;
		#Savecmt19=$cmt_str;
		#Savetm19=$tm_str;
	}else if($num==20){
		#Savedate20=$date_str;
		#Savecmt20=$cmt_str;
		#Savetm20=$tm_str;
	}else if($num==21){
		#Savedate21=$date_str;
		#Savecmt21=$cmt_str;
		#Savetm21=$tm_str;
	}else if($num==22){
		#Savedate22=$date_str;
		#Savecmt22=$cmt_str;
		#Savetm22=$tm_str;
	}else if($num==23){
		#Savedate23=$date_str;
		#Savecmt23=$cmt_str;
		#Savetm23=$tm_str;
	}else if($num==24){
		#Savedate24=$date_str;
		#Savecmt24=$cmt_str;
		#Savetm24=$tm_str;
	}else if($num==25){
		#Savedate25=$date_str;
		#Savecmt25=$cmt_str;
		#Savetm25=$tm_str;
	}else if($num==26){
		#Savedate26=$date_str;
		#Savecmt26=$cmt_str;
		#Savetm26=$tm_str;
	}else if($num==27){
		#Savedate27=$date_str;
		#Savecmt27=$cmt_str;
		#Savetm27=$tm_str;
	}else if($num==28){
		#Savedate28=$date_str;
		#Savecmt28=$cmt_str;
		#Savetm28=$tm_str;
	}else if($num==29){
		#Savedate29=$date_str;
		#Savecmt29=$cmt_str;
		#Savetm29=$tm_str;
	}else if($num==30){
		#Savedate30=$date_str;
		#Savecmt30=$cmt_str;
		#Savetm30=$tm_str;
	}else if($num==31){
		#Savedate31=$date_str;
		#Savecmt31=$cmt_str;
		#Savetm31=$tm_str;
	}else if($num==32){
		#Savedate32=$date_str;
		#Savecmt32=$cmt_str;
		#Savetm32=$tm_str;
	}else if($num==33){
		#Savedate33=$date_str;
		#Savecmt33=$cmt_str;
		#Savetm33=$tm_str;
	}else if($num==34){
		#Savedate34=$date_str;
		#Savecmt34=$cmt_str;
		#Savetm34=$tm_str;
	}else if($num==35){
		#Savedate35=$date_str;
		#Savecmt35=$cmt_str;
		#Savetm35=$tm_str;
	}else if($num==36){
		#Savedate36=$date_str;
		#Savecmt36=$cmt_str;
		#Savetm36=$tm_str;
	}else if($num==37){
		#Savedate37=$date_str;
		#Savecmt37=$cmt_str;
		#Savetm37=$tm_str;
	}else if($num==38){
		#Savedate38=$date_str;
		#Savecmt38=$cmt_str;
		#Savetm38=$tm_str;
	}else if($num==39){
		#Savedate39=$date_str;
		#Savecmt39=$cmt_str;
		#Savetm39=$tm_str;
	}else if($num==40){
		#Savedate40=$date_str;
		#Savecmt40=$cmt_str;
		#Savetm40=$tm_str;
	}else if($num==41){
		#Savedate41=$date_str;
		#Savecmt41=$cmt_str;
		#Savetm41=$tm_str;
	}else if($num==42){
		#Savedate42=$date_str;
		#Savecmt42=$cmt_str;
		#Savetm42=$tm_str;
	}else if($num==43){
		#Savedate43=$date_str;
		#Savecmt43=$cmt_str;
		#Savetm43=$tm_str;
	}else if($num==44){
		#Savedate44=$date_str;
		#Savecmt44=$cmt_str;
		#Savetm44=$tm_str;
	}else if($num==45){
		#Savedate45=$date_str;
		#Savecmt45=$cmt_str;
		#Savetm45=$tm_str;
	}else if($num==46){
		#Savedate46=$date_str;
		#Savecmt46=$cmt_str;
		#Savetm46=$tm_str;
	}else if($num==47){
		#Savedate47=$date_str;
		#Savecmt47=$cmt_str;
		#Savetm47=$tm_str;
	}else if($num==48){
		#Savedate48=$date_str;
		#Savecmt48=$cmt_str;
		#Savetm48=$tm_str;
	}else if($num==49){
		#Savedate49=$date_str;
		#Savecmt49=$cmt_str;
		#Savetm49=$tm_str;
	}else if($num==50){
		#Savedate50=$date_str;
		#Savecmt50=$cmt_str;
		#Savetm50=$tm_str;
	}else if($num==51){
		#Savedate51=$date_str;
		#Savecmt51=$cmt_str;
		#Savetm51=$tm_str;
	}else if($num==52){
		#Savedate52=$date_str;
		#Savecmt52=$cmt_str;
		#Savetm52=$tm_str;
	}else if($num==53){
		#Savedate53=$date_str;
		#Savecmt53=$cmt_str;
		#Savetm53=$tm_str;
	}else if($num==54){
		#Savedate54=$date_str;
		#Savecmt54=$cmt_str;
		#Savetm54=$tm_str;
	}else if($num==55){
		#Savedate55=$date_str;
		#Savecmt55=$cmt_str;
		#Savetm55=$tm_str;
	}else if($num==56){
		#Savedate56=$date_str;
		#Savecmt56=$cmt_str;
		#Savetm56=$tm_str;
	}else if($num==57){
		#Savedate57=$date_str;
		#Savecmt57=$cmt_str;
		#Savetm57=$tm_str;
	}else if($num==58){
		#Savedate58=$date_str;
		#Savecmt58=$cmt_str;
		#Savetm58=$tm_str;
	}else if($num==59){
		#Savedate59=$date_str;
		#Savecmt59=$cmt_str;
		#Savetm59=$tm_str;
	}else if($num==60){
		#Savedate60=$date_str;
		#Savecmt60=$cmt_str;
		#Savetm60=$tm_str;
	}else if($num==61){
		#Savedate61=$date_str;
		#Savecmt61=$cmt_str;
		#Savetm61=$tm_str;
	}else if($num==62){
		#Savedate62=$date_str;
		#Savecmt62=$cmt_str;
		#Savetm62=$tm_str;
	}else if($num==63){
		#Savedate63=$date_str;
		#Savecmt63=$cmt_str;
		#Savetm63=$tm_str;
	}else if($num==64){
		#Savedate64=$date_str;
		#Savecmt64=$cmt_str;
		#Savetm64=$tm_str;
	}else if($num==65){
		#Savedate65=$date_str;
		#Savecmt65=$cmt_str;
		#Savetm65=$tm_str;
	}else if($num==66){
		#Savedate66=$date_str;
		#Savecmt66=$cmt_str;
		#Savetm66=$tm_str;
	}else if($num==67){
		#Savedate67=$date_str;
		#Savecmt67=$cmt_str;
		#Savetm67=$tm_str;
	}else if($num==68){
		#Savedate68=$date_str;
		#Savecmt68=$cmt_str;
		#Savetm68=$tm_str;
	}else if($num==69){
		#Savedate69=$date_str;
		#Savecmt69=$cmt_str;
		#Savetm69=$tm_str;
	}else if($num==70){
		#Savedate70=$date_str;
		#Savecmt70=$cmt_str;
		#Savetm70=$tm_str;
	}else if($num==71){
		#Savedate71=$date_str;
		#Savecmt71=$cmt_str;
		#Savetm71=$tm_str;
	}else if($num==72){
		#Savedate72=$date_str;
		#Savecmt72=$cmt_str;
		#Savetm72=$tm_str;
	}else if($num==73){
		#Savedate73=$date_str;
		#Savecmt73=$cmt_str;
		#Savetm73=$tm_str;
	}else if($num==74){
		#Savedate74=$date_str;
		#Savecmt74=$cmt_str;
		#Savetm74=$tm_str;
	}else if($num==75){
		#Savedate75=$date_str;
		#Savecmt75=$cmt_str;
		#Savetm75=$tm_str;
	}else if($num==76){
		#Savedate76=$date_str;
		#Savecmt76=$cmt_str;
		#Savetm76=$tm_str;
	}else if($num==77){
		#Savedate77=$date_str;
		#Savecmt77=$cmt_str;
		#Savetm77=$tm_str;
	}else if($num==78){
		#Savedate78=$date_str;
		#Savecmt78=$cmt_str;
		#Savetm78=$tm_str;
	}else if($num==79){
		#Savedate79=$date_str;
		#Savecmt79=$cmt_str;
		#Savetm79=$tm_str;
	}else if($num==80){
		#Savedate80=$date_str;
		#Savecmt80=$cmt_str;
		#Savetm80=$tm_str;
	}else if($num==81){
		#Savedate81=$date_str;
		#Savecmt81=$cmt_str;
		#Savetm81=$tm_str;
	}else if($num==82){
		#Savedate82=$date_str;
		#Savecmt82=$cmt_str;
		#Savetm82=$tm_str;
	}else if($num==83){
		#Savedate83=$date_str;
		#Savecmt83=$cmt_str;
		#Savetm83=$tm_str;
	}else if($num==84){
		#Savedate84=$date_str;
		#Savecmt84=$cmt_str;
		#Savetm84=$tm_str;
	}else if($num==85){
		#Savedate85=$date_str;
		#Savecmt85=$cmt_str;
		#Savetm85=$tm_str;
	}else if($num==86){
		#Savedate86=$date_str;
		#Savecmt86=$cmt_str;
		#Savetm86=$tm_str;
	}else if($num==87){
		#Savedate87=$date_str;
		#Savecmt87=$cmt_str;
		#Savetm87=$tm_str;
	}else if($num==88){
		#Savedate88=$date_str;
		#Savecmt88=$cmt_str;
		#Savetm88=$tm_str;
	}else if($num==89){
		#Savedate89=$date_str;
		#Savecmt89=$cmt_str;
		#Savetm89=$tm_str;
	}else if($num==90){
		#Savedate90=$date_str;
		#Savecmt90=$cmt_str;
		#Savetm90=$tm_str;
	}else if($num==91){
		#Savedate91=$date_str;
		#Savecmt91=$cmt_str;
		#Savetm91=$tm_str;
	}else if($num==92){
		#Savedate92=$date_str;
		#Savecmt92=$cmt_str;
		#Savetm92=$tm_str;
	}else if($num==93){
		#Savedate93=$date_str;
		#Savecmt93=$cmt_str;
		#Savetm93=$tm_str;
	}else if($num==94){
		#Savedate94=$date_str;
		#Savecmt94=$cmt_str;
		#Savetm94=$tm_str;
	}else if($num==95){
		#Savedate95=$date_str;
		#Savecmt95=$cmt_str;
		#Savetm95=$tm_str;
	}else if($num==96){
		#Savedate96=$date_str;
		#Savecmt96=$cmt_str;
		#Savetm96=$tm_str;
	}else if($num==97){
		#Savedate97=$date_str;
		#Savecmt97=$cmt_str;
		#Savetm97=$tm_str;
	}else if($num==98){
		#Savedate98=$date_str;
		#Savecmt98=$cmt_str;
		#Savetm98=$tm_str;
	}else if($num==99){
		#Savedate99=$date_str;
		#Savecmt99=$cmt_str;
		#Savetm99=$tm_str;
	}else if($num==100){
		#Savedate100=$date_str;
		#Savecmt100=$cmt_str;
		#Savetm100=$tm_str;
	}else if($num==101){
		#Savedate101=$date_str;
		#Savecmt101=$cmt_str;
		#Savetm101=$tm_str;
	}else if($num==102){
		#Savedate102=$date_str;
		#Savecmt102=$cmt_str;
		#Savetm102=$tm_str;
	}else if($num==103){
		#Savedate103=$date_str;
		#Savecmt103=$cmt_str;
		#Savetm103=$tm_str;
	}else if($num==104){
		#Savedate104=$date_str;
		#Savecmt104=$cmt_str;
		#Savetm104=$tm_str;
	}else if($num==105){
		#Savedate105=$date_str;
		#Savecmt105=$cmt_str;
		#Savetm105=$tm_str;
	}else if($num==106){
		#Savedate106=$date_str;
		#Savecmt106=$cmt_str;
		#Savetm106=$tm_str;
	}else if($num==107){
		#Savedate107=$date_str;
		#Savecmt107=$cmt_str;
		#Savetm107=$tm_str;
	}else if($num==108){
		#Savedate108=$date_str;
		#Savecmt108=$cmt_str;
		#Savetm108=$tm_str;
	}else if($num==109){
		#Savedate109=$date_str;
		#Savecmt109=$cmt_str;
		#Savetm109=$tm_str;
	}else if($num==110){
		#Savedate110=$date_str;
		#Savecmt110=$cmt_str;
		#Savetm110=$tm_str;
	}else if($num==111){
		#Savedate111=$date_str;
		#Savecmt111=$cmt_str;
		#Savetm111=$tm_str;
	}else if($num==112){
		#Savedate112=$date_str;
		#Savecmt112=$cmt_str;
		#Savetm112=$tm_str;
	}else if($num==113){
		#Savedate113=$date_str;
		#Savecmt113=$cmt_str;
		#Savetm113=$tm_str;
	}else if($num==114){
		#Savedate114=$date_str;
		#Savecmt114=$cmt_str;
		#Savetm114=$tm_str;
	}else if($num==115){
		#Savedate115=$date_str;
		#Savecmt115=$cmt_str;
		#Savetm115=$tm_str;
	}else if($num==116){
		#Savedate116=$date_str;
		#Savecmt116=$cmt_str;
		#Savetm116=$tm_str;
	}else if($num==117){
		#Savedate117=$date_str;
		#Savecmt117=$cmt_str;
		#Savetm117=$tm_str;
	}else if($num==118){
		#Savedate118=$date_str;
		#Savecmt118=$cmt_str;
		#Savetm118=$tm_str;
	}else if($num==119){
		#Savedate119=$date_str;
		#Savecmt119=$cmt_str;
		#Savetm119=$tm_str;
	}else if($num==120){
		#Savedate120=$date_str;
		#Savecmt120=$cmt_str;
		#Savetm120=$tm_str;
	}
}

function SaveDataCheck()
{
	if($num==1){
		if(#SaveNumber1){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==2){
		if(#SaveNumber2){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==3){
		if(#SaveNumber3){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==4){
		if(#SaveNumber4){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==5){
		if(#SaveNumber5){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==6){
		if(#SaveNumber6){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==7){
		if(#SaveNumber7){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==8){
		if(#SaveNumber8){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==9){
		if(#SaveNumber9){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==10){
		if(#SaveNumber10){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==11){
		if(#SaveNumber11){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==12){
		if(#SaveNumber12){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==13){
		if(#SaveNumber13){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==14){
		if(#SaveNumber14){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==15){
		if(#SaveNumber15){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==16){
		if(#SaveNumber16){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==17){
		if(#SaveNumber17){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==18){
		if(#SaveNumber18){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==19){
		if(#SaveNumber19){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==20){
		if(#SaveNumber20){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==21){
		if(#SaveNumber21){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==22){
		if(#SaveNumber22){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==23){
		if(#SaveNumber23){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==24){
		if(#SaveNumber24){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==25){
		if(#SaveNumber25){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==26){
		if(#SaveNumber26){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==27){
		if(#SaveNumber27){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==28){
		if(#SaveNumber28){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==29){
		if(#SaveNumber29){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==30){
		if(#SaveNumber30){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==31){
		if(#SaveNumber31){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==32){
		if(#SaveNumber32){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==33){
		if(#SaveNumber33){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==34){
		if(#SaveNumber34){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==35){
		if(#SaveNumber35){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==36){
		if(#SaveNumber36){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==37){
		if(#SaveNumber37){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==38){
		if(#SaveNumber38){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==39){
		if(#SaveNumber39){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==40){
		if(#SaveNumber40){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==41){
		if(#SaveNumber41){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==42){
		if(#SaveNumber42){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==43){
		if(#SaveNumber43){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==44){
		if(#SaveNumber44){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==45){
		if(#SaveNumber45){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==46){
		if(#SaveNumber46){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==47){
		if(#SaveNumber47){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==48){
		if(#SaveNumber48){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==49){
		if(#SaveNumber49){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==50){
		if(#SaveNumber50){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==51){
		if(#SaveNumber51){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==52){
		if(#SaveNumber52){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==53){
		if(#SaveNumber53){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==54){
		if(#SaveNumber54){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==55){
		if(#SaveNumber55){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==56){
		if(#SaveNumber56){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==57){
		if(#SaveNumber57){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==58){
		if(#SaveNumber58){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==59){
		if(#SaveNumber59){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==60){
		if(#SaveNumber60){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==61){
		if(#SaveNumber61){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==62){
		if(#SaveNumber62){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==63){
		if(#SaveNumber63){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==64){
		if(#SaveNumber64){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==65){
		if(#SaveNumber65){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==66){
		if(#SaveNumber66){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==67){
		if(#SaveNumber67){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==68){
		if(#SaveNumber68){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==69){
		if(#SaveNumber69){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==70){
		if(#SaveNumber70){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==71){
		if(#SaveNumber71){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==72){
		if(#SaveNumber72){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==73){
		if(#SaveNumber73){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==74){
		if(#SaveNumber74){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==75){
		if(#SaveNumber75){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==76){
		if(#SaveNumber76){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==77){
		if(#SaveNumber77){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==78){
		if(#SaveNumber78){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==79){
		if(#SaveNumber79){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==80){
		if(#SaveNumber80){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==81){
		if(#SaveNumber81){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==82){
		if(#SaveNumber82){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==83){
		if(#SaveNumber83){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==84){
		if(#SaveNumber84){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==85){
		if(#SaveNumber85){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==86){
		if(#SaveNumber86){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==87){
		if(#SaveNumber87){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==88){
		if(#SaveNumber88){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==89){
		if(#SaveNumber89){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==90){
		if(#SaveNumber90){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==91){
		if(#SaveNumber91){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==92){
		if(#SaveNumber92){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==93){
		if(#SaveNumber93){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==94){
		if(#SaveNumber94){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==95){
		if(#SaveNumber95){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==96){
		if(#SaveNumber96){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==97){
		if(#SaveNumber97){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==98){
		if(#SaveNumber98){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==99){
		if(#SaveNumber99){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==100){
		if(#SaveNumber100){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==101){
		if(#SaveNumber101){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==102){
		if(#SaveNumber102){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==103){
		if(#SaveNumber103){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==104){
		if(#SaveNumber104){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==105){
		if(#SaveNumber105){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==106){
		if(#SaveNumber106){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==107){
		if(#SaveNumber107){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==108){
		if(#SaveNumber108){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==109){
		if(#SaveNumber109){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==110){
		if(#SaveNumber110){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==111){
		if(#SaveNumber111){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==112){
		if(#SaveNumber112){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==113){
		if(#SaveNumber113){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==114){
		if(#SaveNumber114){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==115){
		if(#SaveNumber115){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==116){
		if(#SaveNumber116){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==117){
		if(#SaveNumber117){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==118){
		if(#SaveNumber118){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==119){
		if(#SaveNumber119){$savecheck=true;}
		else{$savecheck=false;}
	}else if($num==120){
		if(#SaveNumber120){$savecheck=true;}
		else{$savecheck=false;}
	}
}


function SaveDataDelete()
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

