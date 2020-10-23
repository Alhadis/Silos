#include "nss/function_system.nss"

//=============================================================================//
//■EXTRA [achievements]実績■
//=============================================================================//
chapter main
{

	call_scene @->extra_achievements_main;

}


scene extra_achievements_main{

//	$SYSTEM_backlog_lock = true;
//	$SYSTEM_menu_lock = true;

	//★★★★ロック
	XBOX360_LockVideo(true);

	CreateColor("BLK",1400,0,0,1280,720,BLACK);
	SetAlias("BLK", "BLK");

	Fade("BLK",0,0,null,false);
//	Fade("BLK",300,1000,null,true);

	//■定義「ボタン説明」
	DialogButtonON("Button_ACI");

	$icon_X = 1;
	$icon_count_33 = true;

	CreateTexture("ahie_back",1000,0,0,"cg/extra/achie/背景画像.png");
	CreateTexture("ahie_backTop",1001,0,0,"cg/extra/achie/クラウザーさん01.png");
	CreateTexture("ahie_backBottom",1001,0,InBottom,"cg/extra/achie/クラウザーさん02.png");

//	CreateWindow("WindowNAME", 1200, 135, 50, 1100, 2400, true);
	CreateName("WindowNAME");

	CreateTexture("WindowNAME/line",1000,128,2,"cg/extra/achie/LINE.png");

//	CreateColor("achi_UP", 1300, 0, 0, 1280, 70, "White");
//	CreateColor("achi_DOWN", 1300, 0, 0, 1280, 70, "White");
//	Fade("achi_UP", 0, 400, null, true);
//	Fade("achi_DOWN", 0, 400, null, true);


	while($icon_count_33){
	
		$icon_YC = ($icon_X*56)+2;

		$icon_none_name = "WindowNAME/Achi_Icon_None_"+$icon_X;
		$icon_name = "WindowNAME/Achi_Icon_"+$icon_X;

		$icon_Nat100 = String("%03d",$icon_X);
		$icon_Name1 = "cg/extra/achie/achi" + $icon_Nat100 + "_1.png";
		$icon_Name2 = "cg/extra/achie/achi" + $icon_Nat100 + "_2.png";
		$icon_Name5 = "cg/extra/achie/achi001_1.png";
		$icon_Name10 = "cg/extra/achie/achi002_1.png";

//360判定用
	if($icon_X==1){if(XBOX360_IsAchieved(1)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name5);}}
	else if($icon_X==2){if(XBOX360_IsAchieved(2)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name5);}}
	else if($icon_X==3){if(XBOX360_IsAchieved(3)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name10);}}
	else if($icon_X==4){if(XBOX360_IsAchieved(4)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name10);}}
	else if($icon_X==5){if(XBOX360_IsAchieved(5)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name10);}}
	else if($icon_X==6){if(XBOX360_IsAchieved(6)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name10);}}
	else if($icon_X==7){if(XBOX360_IsAchieved(7)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name10);}}
	else if($icon_X==8){if(XBOX360_IsAchieved(8)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name10);}}
	else if($icon_X==9){if(XBOX360_IsAchieved(9)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name10);}}
	else if($icon_X==10){if(XBOX360_IsAchieved(10)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name10);}}
	else if($icon_X==11){if(XBOX360_IsAchieved(11)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==12){if(XBOX360_IsAchieved(12)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==13){if(XBOX360_IsAchieved(13)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==14){if(XBOX360_IsAchieved(14)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==15){if(XBOX360_IsAchieved(15)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==16){if(XBOX360_IsAchieved(16)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==17){if(XBOX360_IsAchieved(17)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==18){if(XBOX360_IsAchieved(18)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==19){if(XBOX360_IsAchieved(19)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==20){if(XBOX360_IsAchieved(20)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==21){if(XBOX360_IsAchieved(21)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==22){if(XBOX360_IsAchieved(22)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==23){if(XBOX360_IsAchieved(23)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==24){if(XBOX360_IsAchieved(24)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==25){if(XBOX360_IsAchieved(25)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==26){if(XBOX360_IsAchieved(26)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==27){if(XBOX360_IsAchieved(27)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==28){if(XBOX360_IsAchieved(28)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==29){if(XBOX360_IsAchieved(29)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==30){if(XBOX360_IsAchieved(30)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==31){if(XBOX360_IsAchieved(31)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==32){if(XBOX360_IsAchieved(32)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}
	else if($icon_X==33){if(XBOX360_IsAchieved(33)){CreateTexture($icon_name,1000,128,$icon_YC,$icon_Name2);}else{CreateTexture($icon_none_name,1000,128,$icon_YC,$icon_Name1);}}

		$icon_X++;
		if($icon_X==34){$icon_count_33=false;}
	}



	CreateScrollbar("Extra_Achi_Scroll",1000,1140,71,1140,595,0,VERTICAL,"cg/extra/achie/スクロールボタン.png");

	SetScrollbar("Extra_Achi_Scroll", "Extra_Achi_Scroll");
	SetScrollSpeed("Extra_Achi_Scroll",21);
	SetAlias("Extra_Achi_Scroll","Extra_Achi_Scroll");

	CreateChoice("Achi_CLICK");
	CreateColor("Achi_CLICK/MouseUsual/img", 10, 0, 0, 1280, 720, "Black");
	SetAlias("Achi_CLICK","Achi_CLICK");

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Fade("@エキストラスクリーン",300,0,null,false);
	Request("@エキストラスクリーン", Disused);
	Fade("BLK",300,0,null,false);
	//▲描画「ボタン説明」
	DialogButtonFade("Button_ACI");

	$slExit=false;
	$Achi_PosY_01=0;
	$Achi_PosY2_01=0;
	$Achi_PosY3_01=0;

	while(!$slExit){
		select{
		$Achi_PosY_01=Integer(1400 * ScrollbarValue("@Extra_Achi_Scroll"));
		$Achi_PosY3_01=$Achi_PosY2_01 - $Achi_PosY_01;
		$Achi_PosY2_01=$Achi_PosY_01;
		Move("WindowNAME/*",0,@0,@$Achi_PosY3_01, null, true);
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){
				$slExit=true;
				break;
			}
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
				$SL_Exit=true;
				$Title_Exit=true;
				call_chapter nss/sys_close.nss;
				$SL_Exit=false;
				$Title_Exit=false;
			}
//			case Achi_CLICK{break;}
			case Extra_Achi_Scroll{}
		}
		Wait(32);
	}
	Request("BLK", Lock);
	Fade("BLK",300,1000,null,false);
	//▲描画「ボタン説明」
	DialogButtonOFF("Button_ACI");
	Delete("*");
	Request("BLK", UnLock);
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	$SYSTEM_script_close="nss/sys_close.nss";
}

