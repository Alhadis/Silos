#include "nss/function_system.nss";

//=============================================================================//
//■EXTRA [Menu]■
//=============================================================================//
chapter main
{


//絶対解除
//	$SYSTEM_backlog_lock = true;
//	$SYSTEM_menu_lock = true;


	//★★★★ロック
	XBOX360_LockVideo(true);

	CreateColor("ext_BLK",1100,0,0,1280,720,BLACK);
	Fade("ext_BLK",0,1000,null,true);

	//■定義「ボタン説明」
	DialogButtonON("Button_EX");

	CreateSound("extSND_A",SE,"sound/se/SE_日常_PC_起動.ogg");
	CreateSound("extSND_B",SE,"sound/se/SE_日常_PC_起動_LOOP.ogg");
	SetVolume("extSND_B",0,0,null);
	Request("extSND_A",Play);
	Request("extSND_B",Play);
	$extFade=DurationTime("extSND_A");
	SetVolume("extSND_B",$extFade,1000,null);
	SetLoop("extSND_B",true);
	CreateTexture("ext_BAK",1000,0,0,"cg/extra/背景画像.png");

	CreateTexture("menu_Res",1000,488,483,"cg/extra/メニューに戻る.png");
	Fade("menu_Res",0,0,null,false);
	Request("menu_Res", Smoothing);

//確認用

/*
	#ClearPieceR=true;
	#ClearPieceY=true;
	#ClearPieceS=true;
	#ClearPieceK=true;
	#ClearPieceA=true;
	#ClearPieceN=true;
	#ClearRouteA=true;
	#ClearRouteB=true;
	#ClearFinal=true;

	#ClearPieceR=false;
	#ClearPieceY=false;
	#ClearPieceS=false;
	#ClearPieceK=false;
	#ClearPieceA=false;
	#ClearPieceN=false;
	#ClearRouteA=false;
	#ClearRouteB=false;
	#ClearFinal=false;
*/

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #FFFFFF, 500, NULL);

	LoadImage("btn_OFF","cg/extra/enter-001.png");
	LoadImage("btn_OVER","cg/extra/enter-002.png");
	LoadImage("btn_ON","cg/extra/enter-003.png");

	CreateTexture("CG_PAS1",1000,762,138,"cg/extra/CGメニューボタンOK.png");
	CreateTexture("CG_PAS2",1000,762,138,"cg/extra/CGメニューボタンNO.png");
	CreateTexture("SOUND_PAS1",1000,762,170,"cg/extra/SOUNDメニューボタンOK.png");
	CreateTexture("SOUND_PAS2",1000,762,170,"cg/extra/SOUNDメニューボタンNO.png");
	CreateTexture("TIPS_PAS",1000,762,202,"cg/extra/TIPSメニューボタン.png");
	CreateTexture("ACH_PAS",1000,762,202,"cg/extra/ACHメニューボタン.png");
	Fade("CG_PAS*", 0, 0, null, false);
	Fade("SOUND_PAS*", 0, 0, null, true);

	CreateChoice("ext_CG");
	CreateTexture("ext_CG_btn",1000,893,138,"btn_OFF");
	CreateTexture("ext_CG/MouseUsual/img",1000,893,138,"btn_OFF");
	CreateTexture("ext_CG/MouseOver/img",1000,893,138,"btn_OVER");
	CreateTexture("ext_CG/MouseClick/img",1000,893,138,"btn_ON");

	CreateTexture("ext_CG_text",1000,504,138,"cg/extra/CG-001.png");
	CreateTexture("ext_CG/MouseUsual/img2",1000,504,138,"cg/extra/CG-001.png");
	CreateTexture("ext_CG/MouseOver/img2",1000,504,138,"cg/extra/CG-002.png");
	CreateTexture("ext_CG/MouseClick/img2",1000,504,138,"cg/extra/CG-003.png");

	CreateChoice("ext_SOUNDLIBRARY");
	CreateTexture("ext_SOUNDLIBRARY_btn",1000,893,170,"btn_OFF");
	CreateTexture("ext_SOUNDLIBRARY/MouseUsual/img",1000,893,170,"btn_OFF");
	CreateTexture("ext_SOUNDLIBRARY/MouseOver/img",1000,893,170,"btn_OVER");
	CreateTexture("ext_SOUNDLIBRARY/MouseClick/img",1000,893,170,"btn_ON");

	CreateTexture("ext_SOUNDLIBRARY_text",1000,504,170,"cg/extra/SOUND-001.png");
	CreateTexture("ext_SOUNDLIBRARY/MouseUsual/img2",1000,504,170,"cg/extra/SOUND-001.png");
	CreateTexture("ext_SOUNDLIBRARY/MouseOver/img2",1000,504,170,"cg/extra/SOUND-002.png");
	CreateTexture("ext_SOUNDLIBRARY/MouseClick/img2",1000,504,170,"cg/extra/SOUND-003.png");

	if(#ClearPieceR==true||#ClearPieceY==true||#ClearPieceS==true||#ClearPieceK==true||#ClearPieceA==true||#ClearPieceN==true||#ClearRouteA==true||#ClearRouteB==true||#ClearFinal==true){
	Fade("CG_PAS1", 0, 1000, null, false);
	Fade("SOUND_PAS1", 0, 1000, null, false);
	}else{
		Request("ext_CG_btn",Erase);
		Request("ext_CG/*/*",Erase);
		Request("ext_SOUNDLIBRARY_btn",Erase);
		Request("ext_SOUNDLIBRARY/*/*",Erase);
		CreateTexture("ext_CG_btn1",1000,893,138,"btn_OFF");
		CreateTexture("ext_CG_btn2",1000,504,138,"cg/extra/CG-001.png");
		CreateTexture("CG_PAS",1000,762,138,"cg/extra/CGメニューボタンNO.png");
		CreateTexture("ext_SOUNDLIBRARY_btn1",1000,893,170,"btn_OFF");
		CreateTexture("ext_SOUNDLIBRARY_btn2",1000,504,170,"cg/extra/SOUND-001.png");
		CreateTexture("SOUND_PAS",1000,762,170,"cg/extra/SOUNDメニューボタンNO.png");
		Fade("ext_CG_btn*", 0, 500, null, false);
		Fade("ext_SOUNDLIBRARY_btn*", 0, 500, null, false);
		Fade("CG_PAS2", 0, 1000, null, false);
		Fade("SOUND_PAS2", 0, 1000, null, false);
	}

	CreateChoice("ext_TIPS");
	CreateTexture("ext_TIPS_btn",1000,893,202,"btn_OFF");
	CreateTexture("ext_TIPS/MouseUsual/img",1000,893,202,"btn_OFF");
	CreateTexture("ext_TIPS/MouseOver/img",1000,893,202,"btn_OVER");
	CreateTexture("ext_TIPS/MouseClick/img",1000,893,202,"btn_ON");

	CreateTexture("ext_TIPS_text",1000,504,202,"cg/extra/TIPS-001.png");
	CreateTexture("ext_TIPS/MouseUsual/img2",1000,504,202,"cg/extra/TIPS-001.png");
	CreateTexture("ext_TIPS/MouseOver/img2",1000,504,202,"cg/extra/TIPS-002.png");
	CreateTexture("ext_TIPS/MouseClick/img2",1000,504,202,"cg/extra/TIPS-003.png");

	CreateChoice("ext_ACHI");
	CreateTexture("ext_ACHI_btn",1000,893,234,"btn_OFF");
	CreateTexture("ext_ACHI/MouseUsual/img",1000,893,234,"btn_OFF");
	CreateTexture("ext_ACHI/MouseOver/img",1000,893,234,"btn_OVER");
	CreateTexture("ext_ACHI/MouseClick/img",1000,893,234,"btn_ON");

	CreateTexture("ext_ACHI_text",1000,504,234,"cg/extra/ACH-001.png");
	CreateTexture("ext_ACHI/MouseUsual/img2",1000,504,234,"cg/extra/ACH-001.png");
	CreateTexture("ext_ACHI/MouseOver/img2",1000,504,234,"cg/extra/ACH-002.png");
	CreateTexture("ext_ACHI/MouseClick/img2",1000,504,234,"cg/extra/ACH-003.png");

/*
	CreateChoice("ext_DOWN");
	CreateTexture("ext_DOWN_btn",1000,893,266,"btn_OFF");
	CreateTexture("ext_DOWN/MouseUsual/img",1000,893,266,"btn_OFF");
	CreateTexture("ext_DOWN/MouseOver/img",1000,893,266,"btn_OVER");
	CreateTexture("ext_DOWN/MouseClick/img",1000,893,266,"btn_ON");

	CreateTexture("ext_DOWN/MouseUsual/img2",1000,504,266,"cg/extra/DOWN-001.png");
	CreateTexture("ext_DOWN/MouseOver/img2",1000,504,266,"cg/extra/DOWN-002.png");
	CreateTexture("ext_DOWN/MouseClick/img2",1000,504,266,"cg/extra/DOWN-003.png");
	CreateTexture("DOWN_PAS",1000,762,266,"cg/extra/DOWNメニューボタン.png");
*/

	CreateChoice("ext_EXIT");
	CreateTexture("ext_EXIT_btn",1000,854,483,"cg/extra/exit-001.png");
	CreateTexture("ext_EXIT/MouseUsual/img",1000,854,483,"cg/extra/exit-001.png");
	CreateTexture("ext_EXIT/MouseOver/img",1000,854,483,"cg/extra/exit-002.png");
	CreateTexture("ext_EXIT/MouseClick/img",1000,854,483,"cg/extra/exit-003.png");
	Fade("*/*/*",0,0,null,false);

	Fade("*/MouseUsual/*",0,1000,null,false);

	exmnu_maketexture();
	CreateProcess("ext_PROC",1000,0,0,"exmnu_animproc");

	Ending_Count();

//スクロール用
	LoadImage("ECTex", "cg/extra/gallery/usal-001.png");
	$Ending_Count = 0;
	$Ending_RollCount = true;

	while($Ending_RollCount){
	if($Ending_Count==7){$Ending_RollCount=false;}

	$Ending_CountY = ($Ending_Count*23)+296;
	$Ending_CountName = "ext_EndingC" + $Ending_Count;
	$Ending_CountUsual = $Ending_CountName + "/MouseUsual/img";
	$Ending_CountOver = $Ending_CountName + "/MouseOver/img";
	$Ending_CountClick = $Ending_CountName + "/MouseClick/img";

	CreateChoice($Ending_CountName);
	CreateTexture($Ending_CountUsual,1,888,$Ending_CountY,"ECTex");
	CreateTexture($Ending_CountOver,1,888,$Ending_CountY,"ECTex");
	CreateTexture($Ending_CountClick,1,888,$Ending_CountY,"ECTex");
	SetAlias("$Ending_CountUsual","$Ending_CountUsual");
	SetAlias("$Ending_CountOver","$Ending_CountOver");
	SetAlias("$Ending_CountClick","$Ending_CountClick");

	$Ending_Count++;

	}

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Request("ext_PROC",Start);

	Wait(100);
	Fade("ext_BLK",500,0,null,false);
	Wait(400);

	Fade("menu_Res",500,1000,null,false);
	BezierMove("menu_Res", 2600, (@0,@0){516,@0}{556,@0}(596,@0){556,@0}{516,@0}{556,@0}{564,@0}{580,@0}(596,@0){584,@0}{570,@0}{556,@0}{570,@0}{584,@0}(596,@0), Dxl1, false);

	//▲描画「ボタン説明」
	DialogButtonFade("Button_EX");

	$extExit=false;
	$SYSTEM_r_button_down=false;
	$SYSTEM_XBOX360_button_b_down=false;

	$Window_POS = $WindowEXY-(153);
	$Ex_MOVE=0;

//PC用
//	SetEXTRA_Focus();

//endCountDef
		$End_move_one = false;
		$End_move_t = false;
		$End_move_th = false;
		$End_move_fo = false;
		$End_move_fi = false;
		$End_move_si = false;
		$End_move_se = false;
		$End_move_ei = false;

	if(#ClearPieceR==true||#ClearPieceY==true||#ClearPieceS==true||#ClearPieceK==true||#ClearPieceA==true||#ClearPieceN==true||#ClearRouteA==true||#ClearRouteB==true||#ClearFinal==true){
		MoveCursor(918,154);
	}else{
		MoveCursor(918,218);
	}

	while(!$extExit){
				Fade("@WindowMAIN",0,1000,null,false);
				Fade("@WindowMAIN/TEXT/*",0,1000,null,false);

		select{
			CursorPosition($EndC_CsrX,$EndC_CsrY);

			$Ending_Y = ImageHorizon("@ext_EndingC0/MouseUsual/img");
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){
				$extExit=true;
				break;
			}

//xbox
			if(Platform()==100){
				if($SYSTEM_XBOX360_button_up_down||$SYSTEM_XBOX360_button_left_down){
					break;
				}else if($SYSTEM_XBOX360_button_down_down||$SYSTEM_XBOX360_button_right_down){
					break;
				}
			}else{

			}

			if(Platform()!=100){
				if($EndC_$CsrX<=880&&$$EndC_CsrX>=960&&$$EndC_CsrY>=280&&$CsrY<=298){
					break;
				}else if($CsrX<=218&&$CsrX>=200&&$CsrY<=520&&$CsrY>=510){
					break;
				}
			}

			case ext_CG{
	if(#ClearPieceR==true||#ClearPieceY==true||#ClearPieceS==true||#ClearPieceK==true||#ClearPieceA==true||#ClearPieceN==true||#ClearRouteA==true||#ClearRouteB==true||#ClearFinal==true){
					CreateTexture("エキストラスクリーン", 1401, 0, 0, "SCREEN");
					SetAlias("エキストラスクリーン", "エキストラスクリーン");
					Draw();
				SetVolume("extSND_A",300,0,null);
				SetVolume("extSND_B",300,0,null);
				Fade("ext_BLK",300,0,null,true);
				Request("ext_PROC",Pause);
				Fade("@WindowMAIN",0,0,null,false);
				Fade("@WindowMAIN/TEXT/*",0,0,null,false);
				//▲描画「ボタン説明」
				DialogButtonOFF2("Button_EX");
				$SYSTEM_XBOX360_rich_presence_mode=3;
				XBOX360_Presence(3);//徒歩：今ＣＧへいくよ？
				call_scene nss/extra_gallery.nss->extra_gallery_main;
				$SYSTEM_XBOX360_rich_presence_mode=1;
				XBOX360_Presence(1);
				//▲描画「ボタン説明」
				DialogButtonFade2("Button_EX");
				MoveCursor(918,154);
				Request("ext_PROC",Resume);
				Fade("*/*/*",0,0,null,false);
				Fade("*/MouseUsual/*",0,1000,null,false);
					Fade("@WindowMAIN",0,1000,null,false);
					Fade("@WindowMAIN/TEXT/*",0,1000,null,false);
				Request("extSND_B",Play);
				SetVolume("extSND_B",300,1000,null);
					Fade("@BLK",300,0,null,true);
					Delete("@BLK");
	}else{
	}
			}case ext_SOUNDLIBRARY{
	if(#ClearPieceR==true||#ClearPieceY==true||#ClearPieceS==true||#ClearPieceK==true||#ClearPieceA==true||#ClearPieceN==true||#ClearRouteA==true||#ClearRouteB==true||#ClearFinal==true){
					CreateTexture("エキストラスクリーン", 1401, 0, 0, "SCREEN");
					SetAlias("エキストラスクリーン", "エキストラスクリーン");
					Draw();
				SetVolume("extSND_A",300,0,null);
				SetVolume("extSND_B",300,1,null);
				Fade("ext_BLK",300,0,null,true);
				Request("ext_PROC",Pause);
				//▲描画「ボタン説明」
				DialogButtonOFF2("Button_EX");
				$SYSTEM_XBOX360_rich_presence_mode=4;
				XBOX360_Presence(4);//徒歩：今サウンドへいくよ？
				call_scene nss/extra_sound.nss->extra_sound_main;
				$SYSTEM_XBOX360_rich_presence_mode=1;
				//おがみ：↓サウンドライブラリで鳴っていたかどうか判別してる
				if($Play_now == true){$さうんどいっかいだけ=true;}
				XBOX360_Presence(1);
				//▲描画「ボタン説明」
				DialogButtonFade2("Button_EX");
				MoveCursor(918,186);
				Request("ext_PROC",Resume);
				Fade("*/*/*",0,0,null,false);
				Fade("*/MouseUsual/*",0,1000,null,false);
					Fade("@WindowMAIN",0,1000,null,false);
					Fade("@WindowMAIN/TEXT/*",0,1000,null,false);
				Request("extSND_B",Play);
				SetVolume("extSND_B",300,1000,null);
					Fade("@BLK",300,0,null,true);
					Delete("@BLK");
	}else{
	}
			}case ext_TIPS{
					CreateTexture("エキストラスクリーン", 2401, 0, 0, "SCREEN");
					SetAlias("エキストラスクリーン", "エキストラスクリーン");
					Draw();
				SetVolume("extSND_A",300,0,null);
				SetVolume("extSND_B",300,1,null);
				Fade("ext_BLK",300,0,null,true);
				Request("ext_PROC",Pause);
				//▲描画「ボタン説明」
				DialogButtonOFF2("Button_EX");
				$SYSTEM_XBOX360_rich_presence_mode=5;
				XBOX360_Presence(5);//徒歩：今ＴＩＰＳへいくよ？
				call_scene nss/extra_tips.nss->extra_tips_main;
				$SYSTEM_XBOX360_rich_presence_mode=1;
				XBOX360_Presence(1);
				//▲描画「ボタン説明」
				DialogButtonFade2("Button_EX");
				MoveCursor(918,218);
				Request("ext_PROC",Resume);
				Fade("*/*/*",0,0,null,false);
				Fade("*/MouseUsual/*",0,1000,null,false);
					Fade("@WindowMAIN",0,1000,null,false);
					Fade("@WindowMAIN/TEXT/*",0,1000,null,false);
				Request("extSND_B",Play);
				SetVolume("extSND_B",300,1000,null);
					Fade("@BLK",300,0,null,true);
					Delete("@BLK");
			}case ext_ACHI{
					CreateTexture("エキストラスクリーン", 1401, 0, 0, "SCREEN");
					SetAlias("エキストラスクリーン", "エキストラスクリーン");
					Draw();
				SetVolume("extSND_A",300,0,null);
				SetVolume("extSND_B",300,1,null);
				Fade("ext_BLK",300,0,null,true);
				Request("ext_PROC",Pause);
				//▲描画「ボタン説明」
				DialogButtonOFF2("Button_EX");
				$SYSTEM_XBOX360_rich_presence_mode=6;
				XBOX360_Presence(6);//徒歩：今実績へいくよ？
				call_scene nss/extra_achievements.nss->extra_achievements_main;
				$SYSTEM_XBOX360_rich_presence_mode=1;
				XBOX360_Presence(1);
				//▲描画「ボタン説明」
				DialogButtonFade2("Button_EX");
				MoveCursor(918,250);
				Request("ext_PROC",Resume);
				Fade("*/*/*",0,0,null,false);
				Fade("*/MouseUsual/*",0,1000,null,false);
					Fade("@WindowMAIN",0,1000,null,false);
					Fade("@WindowMAIN/TEXT/*",0,1000,null,false);
				Request("extSND_B",Play);
				SetVolume("extSND_B",300,1000,null);
					Fade("@BLK",300,0,null,true);
					Delete("@BLK");
//			}case ext_DOWN{
			}case ext_EXIT{$extExit=true;
			}case ext_EndingC0{}
			if($END_Count>2){case ext_EndingC1{}}
			if($END_Count>3){case ext_EndingC2{}}
			if($END_Count>4){case ext_EndingC3{}}
			if($END_Count>5){case ext_EndingC4{}}
			if($END_Count>6){case ext_EndingC5{}}
			if($END_Count>7){case ext_EndingC6{}}
			if($END_Count>8){case ext_EndingC7{}}
		}//select_end

		if(Platform()==100){
			//▽廻す
			PaperMoveStart();
		}

		CursorPosition($EndC_CsrX,$EndC_CsrY);
		if($EndC_CsrX>=888&&$EndC_CsrX<=958&&$EndC_CsrY>=296&&$EndC_CsrY<=442){
			Fade("ExtraColor", 0, 1000, null, false);
		}else{
			Fade("ExtraColor", 0, 0, null, false);
		}

		$SYSTEM_XBOX360_button_left_down=false;$SYSTEM_XBOX360_button_right_down=false;
		$SYSTEM_XBOX360_button_up_down=false;$SYSTEM_XBOX360_button_down_down=false;
	}//while_end

	SetVolume("extSND_B",300,0,null);
	Fade("ext_BLK",300,1000,null,false);

	//▲描画「ボタン説明」
	DialogButtonOFF("Button_EX");


	//★★★★ロック
	XBOX360_LockVideo(true);
	Delete("*");
	$SYSTEM_r_button_down=false;
	$SYSTEM_XBOX360_button_b_down=false;
	$さうんどいっかいだけ=false;
	//★★★★アンロック
	XBOX360_LockVideo(false);

}

function Ending_Count()
{

//	$EXTRA_COUNT_TIME = Time();
//	$FULL_TIME = $EXTRA_COUNT_TIME-#BEGIN_TIME;

//	$Full_PlayTime_Hour = ($FULL_TIME) / (60*60);
//	$Full_PlayTime_Minute = (($FULL_TIME) % (60*60)) / 60;

//プレイ時間（秒）
//	$Full_PlayTime_second = (($FULL_TIME) % (60*60)) % 60;

//結果
//	$text_time="総プレイ時間 " + $Full_PlayTime_Hour + "時間" + $Full_PlayTime_Minute + "分" + $Full_PlayTime_second + "秒";
//	$text_time="総プレイ時間   "+$tm_str;

	//●時間計測
	#EXTRA_PLAY_TIME=#ALL_PLAY_TIME+(Time()-#BEGIN_TIME);
	$tm_str=String("%d:%02d:%02d",#EXTRA_PLAY_TIME/3600,Integer(#EXTRA_PLAY_TIME-(3600*Integer(#EXTRA_PLAY_TIME/3600)))/60,#EXTRA_PLAY_TIME%60);
	$text_time=$tm_str;

	LoadImage("TextLine","cg/extra/ウィンドウ内LINE.png");

	$CGLI_Count=0;

	if(#bg119_01_3_監視カメラ映像_a){$CGLI_Count++;}
	if(#bg136_01_1_希ＶＩＰルーム_a){$CGLI_Count++;}
	if(#bg136_02_1_希ＶＩＰルーム_a){$CGLI_Count++;}
	if(#bg136_03_1_chn希ＶＩＰルーム_a){$CGLI_Count++;}
	if(#ev001_01_1_INT01近づく梨深_a){$CGLI_Count++;}
	if(#ev005_01_3_杭貼付け_a){$CGLI_Count++;}
	if(#ev006_01_3_グロ画像_a){$CGLI_Count++;}
	if(#ev006_02_3_グロ画像_a){$CGLI_Count++;}
	if(#ev007_01_3_十字架杭拓巳_a){$CGLI_Count++;}
	if(#ev007_02_6_十字架杭拓巳_a){$CGLI_Count++;}
	if(#ev008_01_4_INT02あやせ歌う_a){$CGLI_Count++;}
	if(#ev009_01_4_腕掴みミイラ_a){$CGLI_Count++;}
	if(#ev010_01_4_腕掴み梨深_a){$CGLI_Count++;}
	if(#ev012_01_1_星来横たわり_a){$CGLI_Count++;}
	if(#ev013_01_1_拓巳笑い口UP_a){$CGLI_Count++;}
	if(#ev013_02_1_拓巳笑い口UP_a){$CGLI_Count++;}
	if(#ev013_03_1_拓巳笑い口UP_a){$CGLI_Count++;}
	if(#ev014_01_1_スプー_a){$CGLI_Count++;}
	if(#ev015_01_1_七海妄想エロ_a){$CGLI_Count++;}
	if(#ev015_02_1_七海妄想エロ_a){$CGLI_Count++;}
	if(#ev016_01_1_七海携帯萌_a){$CGLI_Count++;}
	if(#ev017_01_2_尾道_a){$CGLI_Count++;}
	if(#ev017_02_2_尾道_a){$CGLI_Count++;}
	if(#ev018_01_3_優愛_a){$CGLI_Count++;}
	if(#ev019_01_3_優愛妄想_a){$CGLI_Count++;}
	if(#ev019_02_3_優愛妄想_a){$CGLI_Count++;}
	if(#ev020_01_3_優愛足下_a){$CGLI_Count++;}
	if(#ev021_01_3_十字架杭優愛_a){$CGLI_Count++;}
	if(#ev022_01_1_星来キス妄想_a){$CGLI_Count++;}
	if(#ev023_01_3_INT06優愛寝転がる_a){$CGLI_Count++;}
	if(#ev024_01_3_あやせライブシーン_a){$CGLI_Count++;}
	if(#ev025_01_3_あやせ脱ぎ妄想_a){$CGLI_Count++;}
	if(#ev026_01_2_七海ハンバーガー_a){$CGLI_Count++;}
	if(#ev026_02_2_七海ハンバーガー_a){$CGLI_Count++;}
	if(#ev027_01_3_見下ろしセナ_a){$CGLI_Count++;}
	if(#ev028_01_0_あやせライブ三住切る_a){$CGLI_Count++;}
	if(#ev029_01_2_梨深ソファ腰掛け_a){$CGLI_Count++;}
	if(#ev030_01_2_七海バングル_a){$CGLI_Count++;}
	if(#ev031_01_0_梢転校_a){$CGLI_Count++;}
	if(#ev032_01_3_梨深だきしめ_a){$CGLI_Count++;}
	if(#ev033_01_1_INT12セナ会話意識集中_a){$CGLI_Count++;}
	if(#ev034_01_6_梨深と将軍の出会い_a){$CGLI_Count++;}
	if(#ev035_01_0_梢コケる_a){$CGLI_Count++;}
	if(#ev036_01_2_セナ白い鎖_a){$CGLI_Count++;}
	if(#ev036_02_2_セナ白い鎖_a){$CGLI_Count++;}
	if(#ev037_01_3_INT13優愛自室でメール書く_a){$CGLI_Count++;}
	if(#ev038_01_3_優愛ROOM37乱入_a){$CGLI_Count++;}
	if(#ev039_01_3_あやせ白下着_a){$CGLI_Count++;}
	if(#ev039_02_3_あやせ白下着_a){$CGLI_Count++;}
	if(#ev040_01_3_あやせディソード出す_a){$CGLI_Count++;}
	if(#ev040_02_3_あやせディソード出す_a){$CGLI_Count++;}
	if(#ev041_01_2_優愛教室ドアから見ている_a){$CGLI_Count++;}
	if(#ev042_01_2_梨深に介抱される_a){$CGLI_Count++;}
	if(#ev042_02_2_梨深に介抱される_a){$CGLI_Count++;}
	if(#ev043_01_2_梨深CD貸してくれたら_a){$CGLI_Count++;}
	if(#ev044_01_2_梨深下着Yシャツ_a){$CGLI_Count++;}
	if(#ev044_02_2_梨深下着Yシャツ_a){$CGLI_Count++;}
	if(#ev044_03_2_梨深下着Yシャツ_a){$CGLI_Count++;}
	if(#ev045_01_3_INT16セナ機械破壊_a){$CGLI_Count++;}
	if(#ev050_01_1_受診小学生拓巳_a){$CGLI_Count++;}
	if(#ev052_01_3_将軍車椅子_a){$CGLI_Count++;}
	if(#ev052_02_3_将軍車椅子_a){$CGLI_Count++;}
	if(#ev054_01_3_刑事二人_a){$CGLI_Count++;}
	if(#ev055_01_1_刑事と探偵会話_a){$CGLI_Count++;}
	if(#ev056_01_1_9歳七海拓巳に食事_a){$CGLI_Count++;}
	if(#ev056_01_1_優愛へたりこみ電話_a){$CGLI_Count++;}
	if(#ev056_02_1_優愛へたりこみ電話_a){$CGLI_Count++;}
	if(#ev057_01_1_拓巳子供時代_a){$CGLI_Count++;}
	if(#ev057_01_3_Q－FrontTVモニター_a){$CGLI_Count++;}
	if(#ev059_01_6_あやせ拷問_a){$CGLI_Count++;}
	if(#ev060_01_3_セナコンテナ登場_a){$CGLI_Count++;}
	if(#ev060_02_3_セナコンテナ登場_a){$CGLI_Count++;}
	if(#ev062_01_1_プリクラ_a){$CGLI_Count++;}
	if(#ev062_02_1_プリクラ_a){$CGLI_Count++;}
	if(#ev063_01_1_マジックミラー波多野_a){$CGLI_Count++;}
	if(#ev063_02_1_マジックミラー波多野_a){$CGLI_Count++;}
	if(#ev064_01_1_あやせ飛び降りようと_a){$CGLI_Count++;}
	if(#ev065_01_1_あやせ投身_a){$CGLI_Count++;}
	if(#ev065_02_1_あやせ投身_a){$CGLI_Count++;}
	if(#ev066_01_1_あやせ花壇落ち_a){$CGLI_Count++;}
	if(#ev067_01_6_血溜り七海_a){$CGLI_Count++;}
	if(#ev068_01_1_七海廊下後姿_a){$CGLI_Count++;}
	if(#ev069_01_1_七海廊下後姿髪かきあげ_a){$CGLI_Count++;}
	if(#ev070_01_2_将軍と梨深in病院_a){$CGLI_Count++;}
	if(#ev070_02_2_将軍と梨深in病院_a){$CGLI_Count++;}
	if(#ev071_01_1_梢ディソード顕現_a){$CGLI_Count++;}
	if(#ev071_02_2_梢ディソード顕現_a){$CGLI_Count++;}
	if(#ev072_01_1_梢と波多野Roft前_a){$CGLI_Count++;}
	if(#ev073_01_1_赤子を抱く母_a){$CGLI_Count++;}
	if(#ev076_01_4_美愛くま抱き_a){$CGLI_Count++;}
	if(#ev077_01_3_野呂瀬社長室_a){$CGLI_Count++;}
	if(#ev078_01_3_葉月ナースめがね_a){$CGLI_Count++;}
	if(#ev078_02_3_葉月ナースめがね_a){$CGLI_Count++;}
	if(#ev079_01_3_梨深セナ対決_a){$CGLI_Count++;}
	if(#ev080_01_1_梨深七海ハイタッチ_a){$CGLI_Count++;}
	if(#ev081_01_3_判死_a){$CGLI_Count++;}
	if(#ev082_01_3_七海ゾンビ_a){$CGLI_Count++;}
	if(#ev083_01_3_優愛ディソード_a){$CGLI_Count++;}
	if(#ev084_01_3_ノアII_a){$CGLI_Count++;}
	if(#ev085_01_3_七海ディソード_a){$CGLI_Count++;}
	if(#ev086_01_6_梨深スポットライト膝抱え_a){$CGLI_Count++;}
	if(#ev087_01_3_拓巳ディソード_a){$CGLI_Count++;}
	if(#ev087_02_3_拓巳ディソード_a){$CGLI_Count++;}
	if(#ev088_01_4_葉月救いあれ_a){$CGLI_Count++;}
	if(#ev088_02_4_葉月救いあれ_a){$CGLI_Count++;}
	if(#ev089_01_1_あやせ瓦礫下_a){$CGLI_Count++;}
	if(#ev090_01_1_優愛瓦礫下_a){$CGLI_Count++;}
	if(#ev091_01_1_七海と将軍_a){$CGLI_Count++;}
	if(#ev092_01_1_拓巳振り返り_a){$CGLI_Count++;}
	if(#ev092_02_1_拓巳振り返り_a){$CGLI_Count++;}
	if(#ev092_03_1_拓巳振り返り_a){$CGLI_Count++;}
	if(#ev093_01_1_セナ父殺し_a){$CGLI_Count++;}
	if(#ev093_01_1_セナ父殺し_b){$CGLI_Count++;}
	if(#ev094_01_1_セナ父首はね_a){$CGLI_Count++;}
	if(#ev095_01_1_拓巳ダーツ逆転_a){$CGLI_Count++;}
	if(#ev096_01_1_星来大群_a){$CGLI_Count++;}
	if(#ev097_01_1_梨深はりつけ_a){$CGLI_Count++;}
	if(#ev097_02_1_梨深はりつけ_a){$CGLI_Count++;}
	if(#ev098_01_1_野呂瀬ディソード_a){$CGLI_Count++;}
	if(#ev099_01_1_梨深レイプ_a){$CGLI_Count++;}
	if(#ev100_06_1_６人祈る_a){$CGLI_Count++;}
	if(#ev101_01_1_拓巳大蛇_a){$CGLI_Count++;}
	if(#ev102_01_1_Ａエンド1_a){$CGLI_Count++;}
	if(#ev103_01_1_Ａエンド2_a){$CGLI_Count++;}
	if(#ev104_01_6_野呂瀬足_a){$CGLI_Count++;}
	if(#ev105_01_1_拓巳光と消える_a){$CGLI_Count++;}
	if(#ev105_02_1_拓巳光と消える_a){$CGLI_Count++;}
	if(#ev106_01_1_剣交え_a){$CGLI_Count++;}
	if(#ev107_01_1_梨深祈る_a){$CGLI_Count++;}
	if(#ev108_02_1_串刺し_a){$CGLI_Count++;}
	if(#ev110_01_3_セナ足_a){$CGLI_Count++;}
	if(#ev111_01_6_野呂瀬ラスト_a){$CGLI_Count++;}
	if(#ev112_01_3_梨深驚愕_a){$CGLI_Count++;}
	if(#ev113_01_2_梨深VS梢_a){$CGLI_Count++;}
	if(#ev114_01_6_梨深キス2_a){$CGLI_Count++;}
	if(#ev114_02_6_梨深キス2_a){$CGLI_Count++;}
	if(#ev115_01_6_梨深瀕死_a){$CGLI_Count++;}
	if(#ev115_02_6_梨深瀕死_a){$CGLI_Count++;}
	if(#ev115_03_6_梨深瀕死_a){$CGLI_Count++;}
	if(#ev115_04_6_梨深瀕死_a){$CGLI_Count++;}
	if(#ev116_01_6_梨深抱きつき_a){$CGLI_Count++;}
	if(#ev117_01_6_梨深殺せない_a){$CGLI_Count++;}
	if(#ev117_02_6_梨深殺せない_a){$CGLI_Count++;}
	if(#ev118_01_6_セナ密着_a){$CGLI_Count++;}
	if(#ev118_02_6_セナ密着_a){$CGLI_Count++;}
	if(#ev118_03_6_セナ密着_a){$CGLI_Count++;}
	if(#ev118_04_6_セナ密着_a){$CGLI_Count++;}
	if(#ev118_05_6_セナ密着_a){$CGLI_Count++;}
	if(#ev119_01_6_セナと赤ん坊_a){$CGLI_Count++;}
	if(#ev119_02_6_セナと赤ん坊_a){$CGLI_Count++;}
	if(#ev119_03_6_セナと赤ん坊_a){$CGLI_Count++;}
	if(#ev120_01_6_ノアⅡ破壊_a){$CGLI_Count++;}
	if(#ev120_02_6_ノアⅡ破壊_a){$CGLI_Count++;}
	if(#ev121_01_1_セナキス_a){$CGLI_Count++;}
	if(#ev122_01_1_セナ押し倒し_a){$CGLI_Count++;}
	if(#ev123_01_6_優愛押し倒し_a){$CGLI_Count++;}
	if(#ev124_01_6_優愛脱ぐ_a){$CGLI_Count++;}
	if(#ev125_01_3_優愛すがりつき_a){$CGLI_Count++;}
	if(#ev125_01_6_楠姉妹写真_a){$CGLI_Count++;}
	if(#ev126_01_5_優愛空見上げ_a){$CGLI_Count++;}
	if(#ev127_01_6_あやせキス_a){$CGLI_Count++;}
	if(#ev128_01_6_あやせしがみつき_a){$CGLI_Count++;}
	if(#ev128_02_6_あやせしがみつき_a){$CGLI_Count++;}
	if(#ev129_01_6_あやせ投擲_a){$CGLI_Count++;}
	if(#ev129_02_6_あやせ投擲_a){$CGLI_Count++;}
	if(#ev130_01_6_あやせ空見上げ_a){$CGLI_Count++;}
	if(#ev131_01_2_あやせ指なめ_a){$CGLI_Count++;}
	if(#ev131_02_2_あやせ指なめ_a){$CGLI_Count++;}
	if(#ev131_03_2_あやせ指なめ_a){$CGLI_Count++;}
	if(#ev132_01_2_あやせ殺害_a){$CGLI_Count++;}
	if(#ev132_01_2_あやせ殺害_b){$CGLI_Count++;}
	if(#ev133_01_6_梢ほのぼの_a){$CGLI_Count++;}
	if(#ev133_02_6_梢ほのぼの_a){$CGLI_Count++;}
	if(#ev133_03_6_梢ほのぼの_a){$CGLI_Count++;}
	if(#ev133_04_6_梢ほのぼの_a){$CGLI_Count++;}
	if(#ev134_01_1_梢うずくまり_a){$CGLI_Count++;}
	if(#ev134_02_1_梢うずくまり_a){$CGLI_Count++;}
	if(#ev135_01_1_セナVS梢_a){$CGLI_Count++;}
	if(#ev136_01_1_梢空見上げ_a){$CGLI_Count++;}
	if(#ev136_02_1_梢空見上げ_a){$CGLI_Count++;}
	if(#ev137_01_6_梢セナ空見上げ_a){$CGLI_Count++;}
	if(#ev138_01_1_梢ちんすこう_a){$CGLI_Count++;}
	if(#ev138_02_1_梢ちんすこう_a){$CGLI_Count++;}
	if(#ev138_03_1_梢ちんすこう_a){$CGLI_Count++;}
	if(#ev138_04_1_梢ちんすこう_a){$CGLI_Count++;}
	if(#ev139_01_3_七海うずくまり_a){$CGLI_Count++;}
	if(#ev139_02_3_七海うずくまり_a){$CGLI_Count++;}
	if(#ev140_01_6_七海同衾_a){$CGLI_Count++;}
	if(#ev140_02_6_七海同衾_a){$CGLI_Count++;}
	if(#ev140_03_6_七海同衾_a){$CGLI_Count++;}
	if(#ev141_01_1_七海キス_a){$CGLI_Count++;}
	if(#ev143_01_3_拓巳覚醒_a){$CGLI_Count++;}
	if(#ev143_02_3_拓巳覚醒_a){$CGLI_Count++;}
	if(#ev143_03_3_拓巳覚醒_a){$CGLI_Count++;}
	if(#ev144_01_1_拓巳ベッド_a){$CGLI_Count++;}
	if(#ev801_01_1_七海来訪_a){$CGLI_Count++;}
	if(#ev801_02_3_七海来訪_a){$CGLI_Count++;}
	if(#ev802_01_1_七海コーラ死_a){$CGLI_Count++;}
	if(#ev803_01_3_優愛遭遇_a){$CGLI_Count++;}
	if(#ev999_01_1_おめでとう){$CGLI_Count++;}
	if(#bg001_01_1_崩壊渋谷_a){$CGLI_Count++;}
	if(#bg001_02_5_崩壊渋谷_a){$CGLI_Count++;}
	if(#bg001_03_6_崩壊渋谷_a){$CGLI_Count++;}
	if(#bg004_01_1_作文用紙その目_a){$CGLI_Count++;}
	if(#bg006_01_1_コンテナ外観_a){$CGLI_Count++;}
	if(#bg006_01_2_コンテナ外観_a){$CGLI_Count++;}
	if(#bg006_01_3_コンテナ外観_a){$CGLI_Count++;}
	if(#bg009_02_1_107_a){$CGLI_Count++;}
	if(#bg009_02_2_107_a){$CGLI_Count++;}
	if(#bg009_02_3_107_a){$CGLI_Count++;}
	if(#bg009_03_5_107_a){$CGLI_Count++;}
	if(#bg011_01_1_検索欄UP_a){$CGLI_Count++;}
	if(#bg012_01_1_ニュースサイト_a){$CGLI_Count++;}
	if(#bg012_02_1_ニュースサイト_a){$CGLI_Count++;}
	if(#bg015_01_0_松濤公園_a){$CGLI_Count++;}
	if(#bg015_01_2_松濤公園_a){$CGLI_Count++;}
	if(#bg015_01_3_松濤公園_a){$CGLI_Count++;}
	if(#bg022_01_0_黒板その目_a){$CGLI_Count++;}
	if(#bg026_02_3_拓巳部屋_a){$CGLI_Count++;}
	if(#bg027_01_3_道玄坂_a){$CGLI_Count++;}
	if(#bg027_02_2_chn道玄坂_a){$CGLI_Count++;}
	if(#bg027_04_3_道玄坂_a){$CGLI_Count++;}
	if(#bg037_01_2_焼却炉中_a){$CGLI_Count++;}
	if(#bg040_01_2_優愛カバン_a){$CGLI_Count++;}
	if(#bg041_01_2_優愛カバンぶちまけ_a){$CGLI_Count++;}
	if(#bg065_01_2_ゲロカエルン店店内_a){$CGLI_Count++;}
	if(#bg083_01_1_宮下公園_a){$CGLI_Count++;}
	if(#bg083_01_3_宮下公園_a){$CGLI_Count++;}
	if(#bg083_02_3_宮下公園_a){$CGLI_Count++;}
	if(#bg083_03_1_宮下公園_a){$CGLI_Count++;}
	if(#bg085_04_3_スクランブル交差点_a){$CGLI_Count++;}
	if(#bg117_01_3_PC画面ニュージェネ_a){$CGLI_Count++;}
	if(#bg120_01_3_PC画面その目_a){$CGLI_Count++;}
	if(#bg125_01_3_PC画面ファンタズム公式_a){$CGLI_Count++;}
	if(#bg127_01_2_ギョロリゲロカエルん_a){$CGLI_Count++;}
	if(#bg128_01_3_ネットオークション_a){$CGLI_Count++;}
	if(#bg134_01_1_武器コーナー_a){$CGLI_Count++;}
	if(#bg141_01_3_PC画面del検索結果_a){$CGLI_Count++;}
	if(#bg142_01_3_ミュウツベ集団ダイブ_a){$CGLI_Count++;}
	if(#bg143_01_1_生徒手帳_a){$CGLI_Count++;}
	if(#bg144_01_1_生徒手帳その目_a){$CGLI_Count++;}
	if(#bg147_01_2_ディソード想像_a){$CGLI_Count++;}
	if(#bg147_02_6_ディソード想像_a){$CGLI_Count++;}
	if(#bg151_01_1_デッドスポット_a){$CGLI_Count++;}
	if(#bg152_01_1_AH会HP_a){$CGLI_Count++;}
	if(#bg153_01_1_あやせの詩_a){$CGLI_Count++;}
	if(#bg154_01_1_渋谷の白い空_a){$CGLI_Count++;}
	if(#bg155_01_1_Ir2_a){$CGLI_Count++;}
	if(#bg158_03_1_ニュース地震_a){$CGLI_Count++;}
	if(#bg159_02_1_PC画面メールソフト_a){$CGLI_Count++;}
	if(#bg160_01_3_ダンボール箱_a){$CGLI_Count++;}
	if(#bg160_02_3_ダンボール箱_a){$CGLI_Count++;}
	if(#bg160_03_3_ダンボール箱_a){$CGLI_Count++;}
	if(#bg160_03_3_chnダンボール箱_a){$CGLI_Count++;}
	if(#bg165_01_3_OFRONT見上げ_a){$CGLI_Count++;}
	if(#bg165_02_3_OFRONT見上げ_a){$CGLI_Count++;}
	if(#bg165_03_3_OFRONT見上げ_a){$CGLI_Count++;}
	if(#bg171_01_3_カルテその目_a){$CGLI_Count++;}
	if(#bg180_01_1_アイスその目_a){$CGLI_Count++;}
	if(#bg181_01_3_捨てられたギョロリ_a){$CGLI_Count++;}
	if(#bg182_01_3_手描きのクマの絵_a){$CGLI_Count++;}
	if(#bg183_01_3_PC画面ZACO‐DQN_a){$CGLI_Count++;}
	if(#bg183_02_3_PC画面ZACO‐DQN_a){$CGLI_Count++;}
	if(#bg185_01_1_あやせ下着_a){$CGLI_Count++;}
	if(#bg186_01_1_たなびくタオル_a){$CGLI_Count++;}
	if(#bg186_02_1_たなびくタオル_a){$CGLI_Count++;}
	if(#bg197_01_3_渋谷駅東口とプラネタリウム_a){$CGLI_Count++;}
	if(#bg200_01_6_ノアIIのあるドーム内_a){$CGLI_Count++;}
	if(#bg202_01_1_希グループｗｅｂサイト_a){$CGLI_Count++;}
	if(#bg203_01_1_ゲロカエルん偽通販サイト_a){$CGLI_Count++;}
	if(#bg205_01_3_あやせディソードリアルブート_a){$CGLI_Count++;}
	if(#bg211_01_5_黄色いバングル_a){$CGLI_Count++;}
	if(#bg213_01_6_ニュースDQNパズル_a){$CGLI_Count++;}
	if(#bg213_01_6_chn渋谷駅コインロッカー_a){$CGLI_Count++;}
	if(#bg214_01_6_chn渋谷駅ロッカー閉じ_a){$CGLI_Count++;}
	if(#bg214_02_6_chn渋谷駅ロッカー開き_a){$CGLI_Count++;}
	if(#bg224_01_6_chnグラジオール文庫本_a){$CGLI_Count++;}
	if(#bg234_01_6_chnビーズコレクション_a){$CGLI_Count++;}
	if(#bg236_01_6_chn美愛の日記_a){$CGLI_Count++;}
	if(#bg236_02_6_chn美愛の日記内容_a){$CGLI_Count++;}
	if(#bg239_01_6_chnディソード全体_拓巳_a){$CGLI_Count++;}
	if(#bg240_01_6_chnディソード全体_梨深_a){$CGLI_Count++;}
	if(#bg241_01_6_chnディソード全体_七海_a){$CGLI_Count++;}
	if(#bg242_01_6_chnディソード全体_あやせ_a){$CGLI_Count++;}
	if(#bg243_01_6_chnディソード全体_セナ_a){$CGLI_Count++;}
	if(#bg244_01_6_chnディソード全体_梢_a){$CGLI_Count++;}
	if(#bg245_01_6_chnディソード全体_優愛_a){$CGLI_Count++;}
	if(#ev046_01_1_妊娠男現場写真_a){$CGLI_Count++;}
	if(#ev047_01_1_張り付け死体現場写真_a){$CGLI_Count++;}
	if(#ev048_01_1_張り付けグロ絵アップ_a){$CGLI_Count++;}
	if(#ev049_01_1_ヴァンパイ屋現場写真_a){$CGLI_Count++;}
	if(#ev051_01_3_清掃員_a){$CGLI_Count++;}
	if(#ev053_01_1_集団ダイブ現場写真_a){$CGLI_Count++;}
	if(#ev061_01_2_ニュージェネ犯人逮捕TV_a){$CGLI_Count++;}
	if(#ev074_01_1_洗脳部隊inモニター_a){$CGLI_Count++;}
	if(#ev142_01_1_七海その目誰の目_a){$CGLI_Count++;}
	if(#bg168_01_3_ダーススパイダーメット_a){$CGLI_Count++;}

	if(#ClearPieceR==true||#ClearPieceY==true||#ClearPieceS==true||#ClearPieceK==true||#ClearPieceA==true||#ClearPieceN==true||#ClearRouteA==true||#ClearRouteB==true||#ClearFinal==true){
		//$CGLI_Count = $CGLI_Count*340;
		//$CGLI_Count = $CGLI_Count/1000;
		$CGLI_Count = $CGLI_Count/297;
		$CGLI_Count = $CGLI_Count*100;
	}else{
		$CGLI_Count = 1000;
	}


	if($CGLI_Count < 10){
		$text_CGLI = "イベントＣＧ数　　　　　　　　　　　　 " + $CGLI_Count + "％";
	}else if($CGLI_Count == 100){
		$text_CGLI = "イベントＣＧ数　　　　　　　　　　　 " + $CGLI_Count + "％";
	}else if($CGLI_Count == 1000){
		$text_CGLI = "イベントＣＧ数　　　　　　　　　　　　‐％";
	}else{
		$text_CGLI = "イベントＣＧ数　　　　　　　　　　　　" + $CGLI_Count + "％";
	}



	$END_CountLoopPoint=0;

	if(#ClearPieceR==true){$END_CountLoopPoint++;}
	if(#ClearPieceY==true){$END_CountLoopPoint++;}
	if(#ClearPieceS==true){$END_CountLoopPoint++;}
	if(#ClearPieceK==true){$END_CountLoopPoint++;}
	if(#ClearPieceA==true){$END_CountLoopPoint++;}
	if(#ClearPieceN==true){$END_CountLoopPoint++;}
	if(#ClearRouteA==true){$END_CountLoopPoint++;}
	if(#ClearRouteB==true){$END_CountLoopPoint++;}
	if(#ClearFinal==true){$END_CountLoopPoint++;}


	if($END_CountLoopPoint==1){
			$END_CountLoopPointDAI = "１";
	}else if($END_CountLoopPoint==2){
			$END_CountLoopPointDAI = "２";
	}else if($END_CountLoopPoint==3){
			$END_CountLoopPointDAI = "３";
	}else if($END_CountLoopPoint==4){
			$END_CountLoopPointDAI = "４";
	}else if($END_CountLoopPoint==5){
			$END_CountLoopPointDAI = "５";
	}else if($END_CountLoopPoint==6){
			$END_CountLoopPointDAI = "６";
	}else if($END_CountLoopPoint==7){
			$END_CountLoopPointDAI = "７";
	}else if($END_CountLoopPoint==8){
			$END_CountLoopPointDAI = "８";
	}else if($END_CountLoopPoint==9){
			$END_CountLoopPointDAI = "９";
	}else if($END_CountLoopPoint==0){
			$END_CountLoopPointDAI = "０";
	}


	$text_ending ="エンディング総数　　　　　　　　　　" + $END_CountLoopPointDAI + "／９";

	if($END_CountLoopPoint<=2){
		$WindowEXY= 104;
	}else if($END_CountLoopPoint<=8){
		$WindowEXY= 104 + ($END_CountLoopPoint*26);
	}else{
		$WindowEXY= 104 + ($END_CountLoopPoint*26);
	}

	$Eye_Count = 0;

	if(#EndFlag1==true){$Eye_Count++;}
	if(#EndFlag2==true){$Eye_Count++;}
	if(#EndFlag3==true){$Eye_Count++;}
	if(#EndFlag4==true){$Eye_Count++;}
	if(#EndFlag5==true){$Eye_Count++;}
	if(#EndFlag6==true){$Eye_Count++;}
	if(#EndFlag7==true){$Eye_Count++;}
	if(#EndFlag8==true){$Eye_Count++;}
	if(#EndFlag9==true){$Eye_Count++;}
	if(#EndFlag10==true){$Eye_Count++;}
	if(#EndFlag11==true){$Eye_Count++;}
	if(#EndFlag12==true){$Eye_Count++;}
	if(#EndFlag13==true){$Eye_Count++;}
	if(#EndFlag14==true){$Eye_Count++;}
	if(#EndFlag15==true){$Eye_Count++;}
	if(#EndFlag16==true){$Eye_Count++;}
	if(#EndFlag17==true){$Eye_Count++;}
	if(#EndFlag18==true){$Eye_Count++;}


	$Eyes_Colect = $Eye_Count*56;
	$Eyes_Colect = $Eyes_Colect/10;
	if($Eye_Count == 1 || $Eye_Count == 0){
		$text_Eyes = "その目だれの目　　　　　　　　　　　　 " + $Eyes_Colect + "％";
	}else if($Eye_Count == 18){
		$text_Eyes = "その目だれの目　　　　　　　　　　　 " + $Eyes_Colect + "％";
	}else{
		$text_Eyes = "その目だれの目　　　　　　　　　　　　" + $Eyes_Colect + "％";
	}

	$TEXT_LineLoop=true;
	$TEXT_Line= 4 + ($END_CountLoopPoint);
	$TEXT_LinePoint = 1;
	$WindowLineY = 0;

//	CreateWindow("WindowMAIN", 1000, 640, 375, 440, 153, true);
//	CreateWindow("WindowMAIN", 2000, 640, 370, 440, 153, true);
	CreateWindow("WindowMAIN", 2000, 512, 296, 352, 129, true);
//	CreateWindow("WindowMAIN/TEXT", 1000, 0, 0, 440, $WindowEXY, true);
	CreateName("WindowMAIN/TEXT");
//	CreateWindow("WindowMAIN/TEXT", 2000, 0, 0, 440, 5000, true);
	SetAlias("WindowMAIN","WindowMAIN");
	SetAlias("WindowMAIN/TEXT","WindowMAIN/TEXT");


	while($TEXT_LineLoop){
		$WindowLineY = ($TEXT_LinePoint*20)+279;
		if($TEXT_LinePoint==$TEXT_Line){$TEXT_LineLoop=false;}
		$TextLineNat = "WindowMAIN/TEXT/Line_" + $TEXT_LinePoint;
		CreateTexture($TextLineNat,1000,512,$WindowLineY,TextLine);
		SetAlias($TextLineNat,$TextLineNat);
		$TEXT_LinePoint++;
	}

	CreateColor("ExtraColor", 1000, 480, 280, 400, 160, #95dcdc);
	Request("ExtraColor", MulRender);
	Fade("ExtraColor", 0, 0, null, true);

	SetFont("ＭＳ ゴシック", 16, #330066, #330066, 500, NULL);

//	CreateText("WindowMAIN/TEXT/プレイ時間", 1000, 640, -12, 440, 50, $text_time);
//	CreateText("WindowMAIN/TEXT/イベントＣＧ数", 1000, 640, 14, 440, 50, "イベントＣＧ数　％");
//	CreateText("WindowMAIN/TEXT/その目だれの目", 1000, 640, 40, 440, 50, $text_Eyes);
//	CreateText("WindowMAIN/TEXT/エンディング到達", 1000, 640, 66, 440, 50, $text_ending);

//	CreateText("WindowMAIN/TEXT/プレイ時間", 1000, 640, 363, 440, 50, $text_time);
	CreateText("WindowMAIN/TEXT/プレイ時間タイトル", 1000, 513, 293, Auto, 40, "総プレイ時間");
	CreateText("WindowMAIN/TEXT/プレイ時間", 1000, 874, 293, Auto, 40, $text_time);
	$TimeHorizon=ImageHorizon("WindowMAIN/TEXT/プレイ時間");
	$TimeHorizon=-$TimeHorizon;
	Move("WindowMAIN/TEXT/プレイ時間", 0, @$TimeHorizon, @0, null, false);

	CreateText("WindowMAIN/TEXT/イベントＣＧ数", 1000, 512, 314, 352, 40, $text_CGLI);
	CreateText("WindowMAIN/TEXT/その目だれの目", 1000, 512, 335, 352, 40, $text_Eyes);
	CreateText("WindowMAIN/TEXT/エンディング到達", 1000, 512, 356, 352, 40, $text_ending);

	Request("WindowMAIN/TEXT/*", NoLog);
	Request("WindowMAIN/TEXT/*", PushText);
	SetAlias("WindowMAIN/TEXT/プレイ時間","WindowMAIN/TEXT/プレイ時間");
	SetAlias("WindowMAIN/TEXT/イベントＣＧ数","WindowMAIN/TEXT/イベントＣＧ数");
	SetAlias("WindowMAIN/TEXT/その目だれの目","WindowMAIN/TEXT/その目だれの目");
	SetAlias("WindowMAIN/TEXT/エンディング到達","WindowMAIN/TEXT/エンディング到達");

	$END_Count=0;
	$END_CountLoop=true;
	$GetCount==false;
	$GetCount1 = false;
	$GetCount2 = false;
	$GetCount3 = false;
	$GetCount4 = false;
	$GetCount5 = false;
	$GetCount6 = false;
	$GetCount7 = false;
	$GetCount8 = false;
	$GetCount9 = false;

	if($END_CountLoopPoint>=1){
		while($END_CountLoop){
			if($END_Count==$END_CountLoopPoint){$END_CountLoop=false;}
			if(#ClearPieceR==true && $GetCount1==false){
				$END_Count++;
				$END_Name1="　　　　　　　　　　　　　　　　アニマの像";
				$END_NAME = $END_Name1;
				$GetCount1=true;
			}else if(#ClearPieceY==true && $GetCount2==false){
				$END_Count++;
				$END_Name2="　　　　　　　　　　　　　　　　　月と太陽";
				$END_NAME = $END_Name2;
				$GetCount2=true;
			}else if(#ClearPieceS==true && $GetCount3==false){
				$END_Count++;
				$END_Name3="　　　　　　　　　　デウス・エクス・マキナ";
				$END_NAME = $END_Name3;
				$GetCount3=true;
			}else if(#ClearPieceK==true && $GetCount4==false){
				$END_Count++;
				$END_Name4="　　　　　　　　　　　　　　　殺戮の至る病";
				$END_NAME = $END_Name4;
				$GetCount4=true;
			}else if(#ClearPieceA==true && $GetCount5==false){
				$END_Count++;
				$END_Name5="　　　　　　　　　　　　　罪過に契約の血を";
				$END_NAME = $END_Name5;
				$GetCount5=true;
			}else if(#ClearPieceN==true && $GetCount6==false){
				$END_Count++;
				$END_Name6="　　　　　　　　　　　　　　　　　daydream";
				$END_NAME = $END_Name6;
				$GetCount6=true;
			}else if(#ClearRouteA==true && $GetCount7==false){
				$END_Count++;
				$END_Name7="　　　　　　　　　　　　　　　　silent sky";
				$END_NAME = $END_Name7;
				$GetCount7=true;
			}else if(#ClearRouteB==true && $GetCount8==false){
				$END_Count++;
				$END_Name8="　　　　　　　　　　　　　　　　crying sky";
				$END_NAME = $END_Name8;
				$GetCount8=true;
			}else if(#ClearFinal==true && $GetCount9==false){
				$END_Count++;
				$END_Name9="　　　　　　　　　　　　　　　　　blue sky";
				$END_NAME = $END_Name9;
				$GetCount9=true;
			}

			$END_NAT_NAME = "WindowMAIN/TEXT/Ending_" + $END_Count;
			$TEXT01Y = 353 + ($END_Count*26);
			CreateText($END_NAT_NAME, 1000, 512, $TEXT01Y, 560, 400, "$END_NAME");
			Request("WindowMAIN/TEXT/*", Enter);
			Request("WindowMAIN/TEXT/*", NoLog);
			Request("WindowMAIN/TEXT/*", PushText);
		SetAlias("$END_NAT_NAME","$END_NAT_NAME");
	
		}//while_End

	}else{}

}

function exmnu_animproc()
{
	$anim=1;
	begin:

	Fade("@anim_1",0,1000,null,false);
	while(1){
		Wait(40);
		$animnxt=$anim+1;
		$animold=$anim;
		$anim++;
		if($anim>56){$anim=1;$animnxt=1;}
		$anim_nut="@anim_"+$animnxt;
		Fade($anim_nut,0,1000,null,false);
		$anim_nut="@anim_"+$animold;
		Fade($anim_nut,0,0,null,false);
	}
}

function exmnu_maketexture()
{
	CreateTexture("anim_1",1000,125,346,"cg/extra/anim/001.png");
	SetAlias("anim_1","anim_1");
	CreateTexture("anim_2",1000,125,346,"cg/extra/anim/002.png");
	SetAlias("anim_2","anim_2");
	CreateTexture("anim_3",1000,125,346,"cg/extra/anim/003.png");
	SetAlias("anim_3","anim_3");
	CreateTexture("anim_4",1000,125,346,"cg/extra/anim/004.png");
	SetAlias("anim_4","anim_4");
	CreateTexture("anim_5",1000,125,346,"cg/extra/anim/005.png");
	SetAlias("anim_5","anim_5");
	CreateTexture("anim_6",1000,125,346,"cg/extra/anim/006.png");
	SetAlias("anim_6","anim_6");
	CreateTexture("anim_7",1000,125,346,"cg/extra/anim/007.png");
	SetAlias("anim_7","anim_7");
	CreateTexture("anim_8",1000,125,346,"cg/extra/anim/008.png");
	SetAlias("anim_8","anim_8");
	CreateTexture("anim_9",1000,125,346,"cg/extra/anim/009.png");
	SetAlias("anim_9","anim_9");
	CreateTexture("anim_10",1000,125,346,"cg/extra/anim/010.png");
	SetAlias("anim_10","anim_10");
	CreateTexture("anim_11",1000,125,346,"cg/extra/anim/011.png");
	SetAlias("anim_11","anim_11");
	CreateTexture("anim_12",1000,125,346,"cg/extra/anim/012.png");
	SetAlias("anim_12","anim_12");
	CreateTexture("anim_13",1000,125,346,"cg/extra/anim/013.png");
	SetAlias("anim_13","anim_13");
	CreateTexture("anim_14",1000,125,346,"cg/extra/anim/014.png");
	SetAlias("anim_14","anim_14");
	CreateTexture("anim_15",1000,125,346,"cg/extra/anim/015.png");
	SetAlias("anim_15","anim_15");
	CreateTexture("anim_16",1000,125,346,"cg/extra/anim/016.png");
	SetAlias("anim_16","anim_16");
	CreateTexture("anim_17",1000,125,346,"cg/extra/anim/017.png");
	SetAlias("anim_17","anim_17");
	CreateTexture("anim_18",1000,125,346,"cg/extra/anim/018.png");
	SetAlias("anim_18","anim_18");
	CreateTexture("anim_19",1000,125,346,"cg/extra/anim/019.png");
	SetAlias("anim_19","anim_19");
	CreateTexture("anim_20",1000,125,346,"cg/extra/anim/020.png");
	SetAlias("anim_20","anim_20");
	CreateTexture("anim_21",1000,125,346,"cg/extra/anim/021.png");
	SetAlias("anim_21","anim_21");
	CreateTexture("anim_22",1000,125,346,"cg/extra/anim/022.png");
	SetAlias("anim_22","anim_22");
	CreateTexture("anim_23",1000,125,346,"cg/extra/anim/023.png");
	SetAlias("anim_23","anim_23");
	CreateTexture("anim_24",1000,125,346,"cg/extra/anim/024.png");
	SetAlias("anim_24","anim_24");
	CreateTexture("anim_25",1000,125,346,"cg/extra/anim/025.png");
	SetAlias("anim_25","anim_25");
	CreateTexture("anim_26",1000,125,346,"cg/extra/anim/026.png");
	SetAlias("anim_26","anim_26");
	CreateTexture("anim_27",1000,125,346,"cg/extra/anim/027.png");
	SetAlias("anim_27","anim_27");
	CreateTexture("anim_28",1000,125,346,"cg/extra/anim/028.png");
	SetAlias("anim_28","anim_28");
	CreateTexture("anim_29",1000,125,346,"cg/extra/anim/029.png");
	SetAlias("anim_29","anim_29");
	CreateTexture("anim_30",1000,125,346,"cg/extra/anim/030.png");
	SetAlias("anim_30","anim_30");
	CreateTexture("anim_31",1000,125,346,"cg/extra/anim/031.png");
	SetAlias("anim_31","anim_31");
	CreateTexture("anim_32",1000,125,346,"cg/extra/anim/032.png");
	SetAlias("anim_32","anim_32");
	CreateTexture("anim_33",1000,125,346,"cg/extra/anim/033.png");
	SetAlias("anim_33","anim_33");
	CreateTexture("anim_34",1000,125,346,"cg/extra/anim/034.png");
	SetAlias("anim_34","anim_34");
	CreateTexture("anim_35",1000,125,346,"cg/extra/anim/035.png");
	SetAlias("anim_35","anim_35");
	CreateTexture("anim_36",1000,125,346,"cg/extra/anim/036.png");
	SetAlias("anim_36","anim_36");
	CreateTexture("anim_37",1000,125,346,"cg/extra/anim/037.png");
	SetAlias("anim_37","anim_37");
	CreateTexture("anim_38",1000,125,346,"cg/extra/anim/038.png");
	SetAlias("anim_38","anim_38");
	CreateTexture("anim_39",1000,125,346,"cg/extra/anim/039.png");
	SetAlias("anim_39","anim_39");
	CreateTexture("anim_40",1000,125,346,"cg/extra/anim/040.png");
	SetAlias("anim_40","anim_40");
	CreateTexture("anim_41",1000,125,346,"cg/extra/anim/041.png");
	SetAlias("anim_41","anim_41");
	CreateTexture("anim_42",1000,125,346,"cg/extra/anim/042.png");
	SetAlias("anim_42","anim_42");
	CreateTexture("anim_43",1000,125,346,"cg/extra/anim/043.png");
	SetAlias("anim_43","anim_43");
	CreateTexture("anim_44",1000,125,346,"cg/extra/anim/044.png");
	SetAlias("anim_44","anim_44");
	CreateTexture("anim_45",1000,125,346,"cg/extra/anim/045.png");
	SetAlias("anim_45","anim_45");
	CreateTexture("anim_46",1000,125,346,"cg/extra/anim/046.png");
	SetAlias("anim_46","anim_46");
	CreateTexture("anim_47",1000,125,346,"cg/extra/anim/047.png");
	SetAlias("anim_47","anim_47");
	CreateTexture("anim_48",1000,125,346,"cg/extra/anim/048.png");
	SetAlias("anim_48","anim_48");
	CreateTexture("anim_49",1000,125,346,"cg/extra/anim/049.png");
	SetAlias("anim_49","anim_49");
	CreateTexture("anim_50",1000,125,346,"cg/extra/anim/050.png");
	SetAlias("anim_50","anim_50");
	CreateTexture("anim_51",1000,125,346,"cg/extra/anim/051.png");
	SetAlias("anim_51","anim_51");
	CreateTexture("anim_52",1000,125,346,"cg/extra/anim/052.png");
	SetAlias("anim_52","anim_52");
	CreateTexture("anim_53",1000,125,346,"cg/extra/anim/053.png");
	SetAlias("anim_53","anim_53");
	CreateTexture("anim_54",1000,125,346,"cg/extra/anim/054.png");
	SetAlias("anim_54","anim_54");
	CreateTexture("anim_55",1000,125,346,"cg/extra/anim/055.png");
	SetAlias("anim_55","anim_55");
	CreateTexture("anim_56",1000,125,346,"cg/extra/anim/056.png");
	SetAlias("anim_56","anim_56");
	Fade("anim_*",0,0,null,false);
}

function SetEXTRA_Focus(){

	SetNextFocus("ext_CG/MouseUsual/img","ext_EXIT/MouseUsual/img",LEFT);
	SetNextFocus("ext_SOUNDLIBRARY/MouseUsual/img","ext_CG/MouseUsual/img",LEFT);
	SetNextFocus("ext_TIPS/MouseUsual/img","ext_SOUNDLIBRARY/MouseUsual/img",LEFT);
	SetNextFocus("ext_ACHI/MouseUsual/img","ext_TIPS/MouseUsual/img",LEFT);

	SetNextFocus("ext_EndingC0/MouseUsual/img","ext_ACHI/MouseUsual/img",LEFT);
	SetNextFocus("ext_EndingC1/MouseUsual/img","ext_EndingC0/MouseUsual/img",LEFT);
	SetNextFocus("ext_EndingC2/MouseUsual/img","ext_EndingC1/MouseUsual/img",LEFT);
	SetNextFocus("ext_EndingC3/MouseUsual/img","ext_EndingC2/MouseUsual/img",LEFT);
	SetNextFocus("ext_EndingC4/MouseUsual/img","ext_EndingC3/MouseUsual/img",LEFT);
	SetNextFocus("ext_EndingC5/MouseUsual/img","ext_EndingC4/MouseUsual/img",LEFT);
	SetNextFocus("ext_EndingC6/MouseUsual/img","ext_EndingC5/MouseUsual/img",LEFT);
	SetNextFocus("ext_EndingC7/MouseUsual/img","ext_EndingC6/MouseUsual/img",LEFT);
	SetNextFocus("ext_EXIT/MouseUsual/img","ext_EndingC7/MouseUsual/img",LEFT);

	SetNextFocus("ext_CG/MouseUsual/img","ext_EXIT/MouseUsual/img",UP);
	SetNextFocus("ext_SOUNDLIBRARY/MouseUsual/img","ext_CG/MouseUsual/img",UP);
	SetNextFocus("ext_TIPS/MouseUsual/img","ext_SOUNDLIBRARY/MouseUsual/img",UP);
	SetNextFocus("ext_ACHI/MouseUsual/img","ext_TIPS/MouseUsual/img",UP);

	SetNextFocus("ext_EndingC0/MouseUsual/img","ext_ACHI/MouseUsual/img",UP);
	SetNextFocus("ext_EndingC1/MouseUsual/img","ext_EndingC0/MouseUsual/img",UP);
	SetNextFocus("ext_EndingC2/MouseUsual/img","ext_EndingC1/MouseUsual/img",UP);
	SetNextFocus("ext_EndingC3/MouseUsual/img","ext_EndingC2/MouseUsual/img",UP);
	SetNextFocus("ext_EndingC4/MouseUsual/img","ext_EndingC3/MouseUsual/img",UP);
	SetNextFocus("ext_EndingC5/MouseUsual/img","ext_EndingC4/MouseUsual/img",UP);
	SetNextFocus("ext_EndingC6/MouseUsual/img","ext_EndingC5/MouseUsual/img",UP);
	SetNextFocus("ext_EndingC7/MouseUsual/img","ext_EndingC6/MouseUsual/img",UP);
	SetNextFocus("ext_EXIT/MouseUsual/img","ext_EndingC7/MouseUsual/img",UP);


	SetNextFocus("ext_CG/MouseUsual/img","ext_SOUNDLIBRARY/MouseUsual/img",RIGHT);
	SetNextFocus("ext_SOUNDLIBRARY/MouseUsual/img","ext_TIPS/MouseUsual/img",RIGHT);
	SetNextFocus("ext_TIPS/MouseUsual/img","ext_ACHI/MouseUsual/img",RIGHT);
	SetNextFocus("ext_ACHI/MouseUsual/img","ext_EndingC0/MouseUsual/img",RIGHT);

	SetNextFocus("ext_EndingC0/MouseUsual/img","ext_EndingC1/MouseUsual/img",RIGHT);
	SetNextFocus("ext_EndingC1/MouseUsual/img","ext_EndingC2/MouseUsual/img",RIGHT);
	SetNextFocus("ext_EndingC2/MouseUsual/img","ext_EndingC3/MouseUsual/img",RIGHT);
	SetNextFocus("ext_EndingC3/MouseUsual/img","ext_EndingC4/MouseUsual/img",RIGHT);
	SetNextFocus("ext_EndingC4/MouseUsual/img","ext_EndingC5/MouseUsual/img",RIGHT);
	SetNextFocus("ext_EndingC5/MouseUsual/img","ext_EndingC6/MouseUsual/img",RIGHT);
	SetNextFocus("ext_EndingC6/MouseUsual/img","ext_EndingC7/MouseUsual/img",RIGHT);
	SetNextFocus("ext_EndingC7/MouseUsual/img","ext_EXIT/MouseUsual/img",RIGHT);
	SetNextFocus("ext_EXIT/MouseUsual/img","ext_CG/MouseUsual/img",RIGHT);


	SetNextFocus("ext_CG/MouseUsual/img","ext_SOUNDLIBRARY/MouseUsual/img",DOWN);
	SetNextFocus("ext_SOUNDLIBRARY/MouseUsual/img","ext_TIPS/MouseUsual/img",DOWN);
	SetNextFocus("ext_TIPS/MouseUsual/img","ext_ACHI/MouseUsual/img",DOWN);
	SetNextFocus("ext_ACHI/MouseUsual/img","ext_EndingC0/MouseUsual/img",DOWN);

	SetNextFocus("ext_EndingC0/MouseUsual/img","ext_EndingC1/MouseUsual/img",DOWN);
	SetNextFocus("ext_EndingC1/MouseUsual/img","ext_EndingC2/MouseUsual/img",DOWN);
	SetNextFocus("ext_EndingC2/MouseUsual/img","ext_EndingC3/MouseUsual/img",DOWN);
	SetNextFocus("ext_EndingC3/MouseUsual/img","ext_EndingC4/MouseUsual/img",DOWN);
	SetNextFocus("ext_EndingC4/MouseUsual/img","ext_EndingC5/MouseUsual/img",DOWN);
	SetNextFocus("ext_EndingC5/MouseUsual/img","ext_EndingC6/MouseUsual/img",DOWN);
	SetNextFocus("ext_EndingC6/MouseUsual/img","ext_EndingC7/MouseUsual/img",DOWN);
	SetNextFocus("ext_EndingC7/MouseUsual/img","ext_EXIT/MouseUsual/img",DOWN);
	SetNextFocus("ext_EXIT/MouseUsual/img","ext_CG/MouseUsual/img",DOWN);

}

function PaperMoveStart()
{

	//★★★★ロック
	XBOX360_LockVideo(true);


	if($End_move_t || $End_move_th || $End_move_fo || $End_move_fi || $End_move_si || $End_move_se){
		$End_move_on=false;
	}else{
		$End_move_on=true;
	}

	if($EndC_CsrX>=892&&$EndC_CsrX<=944&&$EndC_CsrY>=136&&$EndC_CsrY<=164){
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(899,496);
		Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(918,182);
		Wait(10);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(918,182);
		Wait(10);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(899,496);
		Wait(10);
		}
	}else if($EndC_CsrX>=1115&&$EndC_CsrX<=1180&&$EndC_CsrY>=213&&$EndC_CsrY<=244){
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(918,150);
		Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(918,214);
		Wait(10);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(918,214);
		Wait(10);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(918,150);
		Wait(10);
		}
	}else if($EndC_CsrX>=1115&&$EndC_CsrX<=1180&&$EndC_CsrY>=253&&$EndC_CsrY<=284){
		if($SYSTEM_XBOX360_button_up_down){
			if(#ClearPieceR==true||#ClearPieceY==true||#ClearPieceS==true||#ClearPieceK==true||#ClearPieceA==true||#ClearPieceN==true||#ClearRouteA==true||#ClearRouteB==true||#ClearFinal==true){
				MoveCursor(918,182);
			}else{
				MoveCursor(918,496);
			}
		Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(918,246);
		Wait(10);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(918,246);
		Wait(10);
		}else if($SYSTEM_XBOX360_button_left_down){
			if(#ClearPieceR==true||#ClearPieceY==true||#ClearPieceS==true||#ClearPieceK==true||#ClearPieceA==true||#ClearPieceN==true||#ClearRouteA==true||#ClearRouteB==true||#ClearFinal==true){
				MoveCursor(918,182);
			}else{
				MoveCursor(918,496);
			}
		Wait(10);
		}
	}else if($EndC_CsrX>=1115&&$EndC_CsrX<=1180&&$EndC_CsrY>=293&&$EndC_CsrY<=324){
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(918,214);
		Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(924,301);
			if($End_move_ei){Move("@WindowMAIN/TEXT/*", 0, @0, @+182, null, false);$End_move_ei=false;}
			else if($End_move_se){Move("@WindowMAIN/TEXT/*", 0, @0, @+156, null, false);$End_move_se=false;}
			else if($End_move_si){Move("@WindowMAIN/TEXT/*", 0, @0, @+130, null, false);$End_move_si=false;}
			else if($End_move_fi){Move("@WindowMAIN/TEXT/*", 0, @0, @+104, null, false);$End_move_fi=false;}
			else if($End_move_fo){Move("@WindowMAIN/TEXT/*", 0, @0, @+78, null, false);$End_move_fo=false;}
			else if($End_move_th){Move("@WindowMAIN/TEXT/*", 0, @0, @+52, null, false);$End_move_th=false;}
			else if($End_move_t){Move("@WindowMAIN/TEXT/*", 0, @0, @+26, null, false);$End_move_t=false;}
		Wait(10);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(924,301);
			if($End_move_ei){Move("@WindowMAIN/TEXT/*", 0, @0, @+182, null, false);$End_move_ei=false;}
			else if($End_move_se){Move("@WindowMAIN/TEXT/*", 0, @0, @+156, null, false);$End_move_se=false;}
			else if($End_move_si){Move("@WindowMAIN/TEXT/*", 0, @0, @+130, null, false);$End_move_si=false;}
			else if($End_move_fi){Move("@WindowMAIN/TEXT/*", 0, @0, @+104, null, false);$End_move_fi=false;}
			else if($End_move_fo){Move("@WindowMAIN/TEXT/*", 0, @0, @+78, null, false);$End_move_fo=false;}
			else if($End_move_th){Move("@WindowMAIN/TEXT/*", 0, @0, @+52, null, false);$End_move_th=false;}
			else if($End_move_t){Move("@WindowMAIN/TEXT/*", 0, @0, @+26, null, false);$End_move_t=false;}
		Wait(10);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(918,214);
		Wait(10);
		}
		$End_move_one=false;
		Wait(10);

	}else if($EndC_CsrX>=880 && $EndC_CsrX<=960 && $EndC_CsrY>=296 && $EndC_CsrY<=314){

	//▽１項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(918,246);
			Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			if($END_Count>2){
				MoveCursor(924,319);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_down_down){
			if($END_Count>2){
				MoveCursor(924,319);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(918,246);
			Wait(10);
		}
		$End_move_t=false;
		$End_move_one=true;
		Wait(10);
	}else if($EndC_CsrX>=880&&$EndC_CsrY<=960&&$EndC_CsrY>=314&&$EndC_CsrY<=330){
	//▽２項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(924,301);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			if($END_Count>3){
				MoveCursor(924,338);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_down_down){
			if($END_Count>3){
				MoveCursor(924,338);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(924,301);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}

		$End_move_one = false;
		$End_move_th = false;
		$End_move_t=true;
		Wait(10);
	}else if($EndC_CsrX>=880&&$EndC_CsrY<=960&&$EndC_CsrY>=334&&$EndC_CsrY<=351){
	//▽３項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(924,319);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			if($END_Count>4){
				MoveCursor(924,356);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_down_down){
			if($END_Count>4){
				MoveCursor(924,356);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(924,319);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}

		$End_move_t = false;
		$End_move_fo = false;
		$End_move_th = true;
		Wait(10);
	}else if($EndC_CsrX>=880&&$EndC_CsrY<=960&&$EndC_CsrY>=353&&$EndC_CsrY<=370){
	//▽４項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(924,338);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			if($END_Count>5){
				MoveCursor(924,374);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_down_down){
			if($END_Count>5){
				MoveCursor(924,374);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(924,338);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}
		$End_move_th = false;
		$End_move_fi = false;
		$End_move_fo = true;
		Wait(10);
	}else if($EndC_CsrX>=880&&$EndC_CsrY<=960&&$EndC_CsrY>=371&&$EndC_CsrY<=386){
	//▽５項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(924,223);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			if($END_Count>6){
				MoveCursor(924,393);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_down_down){
			if($END_Count>6){
				MoveCursor(924,393);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(924,364);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}

		$End_move_fo = false;
		$End_move_si = false;
		$End_move_fi = true;
		Wait(10);
	}else if($EndC_CsrX>=880&&$EndC_CsrY<=960&&$EndC_CsrY>=388&&$EndC_CsrY<=406){
	//▽６項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(924,374);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			if($END_Count>7){
				MoveCursor(924,410);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_down_down){
			if($END_Count>7){
				MoveCursor(924,410);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(924,374);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}
		$End_move_se = false;
		$End_move_fi = false;
		$End_move_si = true;
		Wait(10);
	}else if($EndC_CsrX>=880&&$EndC_CsrY<=960&&$EndC_CsrY>=408&&$EndC_CsrY<=424){
	//▽７項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(924,393);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			if($END_Count>8){
				MoveCursor(924,430);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_down_down){
			if($END_Count>8){
				MoveCursor(924,430);
				Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);
				Wait(10);
			}else{
				MoveCursor(899,496);
				Wait(10);
			}
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(924,393);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}
		$End_move_si = false;
		$End_move_ei = false;
		$End_move_se = true;
		Wait(10);
	}else if($EndC_CsrX>=880&&$EndC_CsrY<=960&&$EndC_CsrY>=425&&$EndC_CsrY<=442){
	//▽８項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(924,410);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(899,496);
			Wait(10);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(899,496);
			Wait(10);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(924,410);
			Move("@WindowMAIN/TEXT/*", 0, @0, @+21, null, false);
			Wait(10);
		}
		$End_move_se = false;
		$End_move_ei = true;
		Wait(10);
	}else if($EndC_CsrX>=854&&$EndC_CsrX<=944&&$EndC_CsrY>=484&&$EndC_CsrY<=508){
		if($SYSTEM_XBOX360_button_up_down){
			if($End_move_ei == false && $End_move_on==true && $END_Count==9){MoveCursor(924,430);Move("@WindowMAIN/TEXT/*", 0, @0, @-146, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_se == false && $End_move_on==true && $END_Count==8){MoveCursor(924,418);Move("@WindowMAIN/TEXT/*", 0, @0, @-125, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_si == false && $End_move_on==true && $END_Count==7){MoveCursor(924,393);Move("@WindowMAIN/TEXT/*", 0, @0, @-104, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_fi == false && $End_move_on==true && $END_Count==6){MoveCursor(924,374);Move("@WindowMAIN/TEXT/*", 0, @0, @-83, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_fo == false && $End_move_on==true && $END_Count==5){MoveCursor(924,354);Move("@WindowMAIN/TEXT/*", 0, @0, @-62, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_th == false && $End_move_on==true && $END_Count==4){MoveCursor(924,338);Move("@WindowMAIN/TEXT/*", 0, @0, @-42, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_t == false && $End_move_on==true && $END_Count==3){MoveCursor(924,319);Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_ei == false&&$End_move_on==false && $End_move_one==false && $END_Count==9){MoveCursor(924,430);}
			else if($End_move_se == false&&$End_move_on==false && $End_move_one==false && $END_Count==8){MoveCursor(924,418);}
			else if($End_move_si == false&&$End_move_on==false && $End_move_one==false && $END_Count==7){MoveCursor(924,393);}
			else if($End_move_fi == false&&$End_move_on==false && $End_move_one==false && $END_Count==6){MoveCursor(924,374);}
			else if($End_move_fo == false&&$End_move_on==false && $End_move_one==false && $END_Count==5){MoveCursor(924,354);}
			else if($End_move_th == false&&$End_move_on==false && $End_move_one==false && $END_Count==4){MoveCursor(924,338);}
			else if($End_move_t == false&&$End_move_on==false && $End_move_one==false && $END_Count==3){MoveCursor(924,319);}
			else if($End_move_ei == false && $End_move_one==true && $END_Count==9){MoveCursor(924,430);Move("@WindowMAIN/TEXT/*", 0, @0, @-146, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_se == false && $End_move_one==true && $END_Count==8){MoveCursor(924,418);Move("@WindowMAIN/TEXT/*", 0, @0, @-125, null, false);$End_move_one=false;}
			else if($End_move_si == false && $End_move_one==true && $END_Count==7){MoveCursor(924,393);Move("@WindowMAIN/TEXT/*", 0, @0, @-104, null, false);$End_move_one=false;}
			else if($End_move_fi == false && $End_move_one==true && $END_Count==6){MoveCursor(924,374);Move("@WindowMAIN/TEXT/*", 0, @0, @-83, null, false);$End_move_one=false;}
			else if($End_move_fo == false && $End_move_one==true && $END_Count==5){MoveCursor(924,354);Move("@WindowMAIN/TEXT/*", 0, @0, @-62, null, false);$End_move_one=false;}
			else if($End_move_th == false && $End_move_one==true && $END_Count==4){MoveCursor(924,338);Move("@WindowMAIN/TEXT/*", 0, @0, @-42, null, false);$End_move_one=false;}
			else if($End_move_t == false && $End_move_one==true && $END_Count==3){MoveCursor(924,319);Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);$End_move_one=false;}
			else if($End_move_ei == true){MoveCursor(924,430);}
			else if($End_move_se == true){MoveCursor(924,418);}
			else if($End_move_si == true){MoveCursor(924,393);}
			else if($End_move_fi == true){MoveCursor(924,374);}
			else if($End_move_fo == true){MoveCursor(924,354);}
			else if($End_move_th == true){MoveCursor(924,338);}
			else if($End_move_t == true){MoveCursor(924,319);}
			else{MoveCursor(924,301);}
		Wait(10);
		}else if($SYSTEM_XBOX360_button_right_down){
			if(#ClearPieceR==true||#ClearPieceY==true||#ClearPieceS==true||#ClearPieceK==true||#ClearPieceA==true||#ClearPieceN==true||#ClearRouteA==true||#ClearRouteB==true||#ClearFinal==true){
				MoveCursor(918,154);
			}else{
				MoveCursor(918,218);
			}
		Wait(10);
		}else if($SYSTEM_XBOX360_button_down_down){
			if(#ClearPieceR==true||#ClearPieceY==true||#ClearPieceS==true||#ClearPieceK==true||#ClearPieceA==true||#ClearPieceN==true||#ClearRouteA==true||#ClearRouteB==true||#ClearFinal==true){
				MoveCursor(918,154));
			}else{
				MoveCursor(918,218);
			}
		Wait(10);
		}else if($SYSTEM_XBOX360_button_left_down){
			if($End_move_ei == false && $End_move_on==true && $END_Count==9){MoveCursor(924,430);Move("@WindowMAIN/TEXT/*", 0, @0, @-146, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_se == false && $End_move_on==true && $END_Count==8){MoveCursor(924,418);Move("@WindowMAIN/TEXT/*", 0, @0, @-125, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_si == false && $End_move_on==true && $END_Count==7){MoveCursor(924,393);Move("@WindowMAIN/TEXT/*", 0, @0, @-104, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_fi == false && $End_move_on==true && $END_Count==6){MoveCursor(924,374);Move("@WindowMAIN/TEXT/*", 0, @0, @-83, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_fo == false && $End_move_on==true && $END_Count==5){MoveCursor(924,354);Move("@WindowMAIN/TEXT/*", 0, @0, @-62, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_th == false && $End_move_on==true && $END_Count==4){MoveCursor(924,338);Move("@WindowMAIN/TEXT/*", 0, @0, @-42, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_t == false && $End_move_on==true && $END_Count==3){MoveCursor(924,319);Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_ei == false&&$End_move_on==false && $End_move_one==false && $END_Count==9){MoveCursor(924,430);}
			else if($End_move_se == false&&$End_move_on==false && $End_move_one==false && $END_Count==8){MoveCursor(924,418);}
			else if($End_move_si == false&&$End_move_on==false && $End_move_one==false && $END_Count==7){MoveCursor(924,393);}
			else if($End_move_fi == false&&$End_move_on==false && $End_move_one==false && $END_Count==6){MoveCursor(924,374);}
			else if($End_move_fo == false&&$End_move_on==false && $End_move_one==false && $END_Count==5){MoveCursor(924,354);}
			else if($End_move_th == false&&$End_move_on==false && $End_move_one==false && $END_Count==4){MoveCursor(924,338);}
			else if($End_move_t == false&&$End_move_on==false && $End_move_one==false && $END_Count==3){MoveCursor(924,319);}
			else if($End_move_ei == false && $End_move_one==true && $END_Count==9){MoveCursor(924,430);Move("@WindowMAIN/TEXT/*", 0, @0, @-146, null, false);$End_move_on=false;$End_move_one=false;}
			else if($End_move_se == false && $End_move_one==true && $END_Count==8){MoveCursor(924,418);Move("@WindowMAIN/TEXT/*", 0, @0, @-125, null, false);$End_move_one=false;}
			else if($End_move_si == false && $End_move_one==true && $END_Count==7){MoveCursor(924,393);Move("@WindowMAIN/TEXT/*", 0, @0, @-104, null, false);$End_move_one=false;}
			else if($End_move_fi == false && $End_move_one==true && $END_Count==6){MoveCursor(924,374);Move("@WindowMAIN/TEXT/*", 0, @0, @-83, null, false);$End_move_one=false;}
			else if($End_move_fo == false && $End_move_one==true && $END_Count==5){MoveCursor(924,354);Move("@WindowMAIN/TEXT/*", 0, @0, @-62, null, false);$End_move_one=false;}
			else if($End_move_th == false && $End_move_one==true && $END_Count==4){MoveCursor(924,338);Move("@WindowMAIN/TEXT/*", 0, @0, @-42, null, false);$End_move_one=false;}
			else if($End_move_t == false && $End_move_one==true && $END_Count==3){MoveCursor(924,319);Move("@WindowMAIN/TEXT/*", 0, @0, @-21, null, false);$End_move_one=false;}
			else if($End_move_ei == true){MoveCursor(924,430);}
			else if($End_move_se == true){MoveCursor(924,418);}
			else if($End_move_si == true){MoveCursor(924,393);}
			else if($End_move_fi == true){MoveCursor(924,374);}
			else if($End_move_fo == true){MoveCursor(924,354);}
			else if($End_move_th == true){MoveCursor(924,338);}
			else if($End_move_t == true){MoveCursor(924,319);}
			else{MoveCursor(924,301);}
		Wait(10);
		}
		Wait(10);
	}

	//★★★★アンロック
	XBOX360_LockVideo(false);

}

