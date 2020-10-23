#include "nss/function.nss"
#include "nss/function_system.nss"

//=============================================================================//
//■EXTRA [Sound Library]■
//=============================================================================//
chapter main
{

	call_scene @->extra_sound_main;

}



scene extra_sound_main
{

//絶対解除
//	$SYSTEM_backlog_lock = true;
//	$SYSTEM_menu_lock = true;
//おがみ：↓ＰＣ上のみ右クリック解除する為
	if(Platform()!=100){
	$SYSTEM_backlog_lock = true;
	$SYSTEM_menu_lock = true;
	}


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
	#FES_Sing=true;

	#ClearPieceR=false;
	#ClearPieceY=false;
	#ClearPieceS=false;
	#ClearPieceK=false;
	#ClearPieceA=false;
	#ClearPieceN=false;
	#ClearRouteA=false;
	#ClearRouteB=false;
	#ClearFinal=false;
	#FES_Sing=false;
*/


	if(!$さうんどいっかいだけ){$Sound_Play_Name=0;}

/*
	CreateText("Dt5", 15000, 50, 100, 700, 500, "");Wait(32);
	CreateText("Dt6", 15000, 50, 120, 700, 500, "");Wait(32);
	CreateText("Dt7", 15000, 50, 140, 700, 500, "");Wait(32);
	CreateText("Dt8", 15000, 50, 160, 700, 500, "");Wait(32);
	CreateText("Dt9", 15000, 50, 180, 700, 500, "");Wait(32);
	CreateText("Dt10", 15000, 50, 200, 700, 500, "");Wait(32);
	CreateText("Dt11", 15000, 50, 220, 700, 500, "");Wait(32);
	CreateText("Dt12", 15000, 50, 240, 700, 500, "");Wait(32);
*/

	//★★★★ロック
	XBOX360_LockVideo(true);

	CreateColor("BLK",1400,Center,Middle,1280,720,BLACK);
	SetAlias("BLK","BLK");

		Fade("BLK",0,0,null,false);
		//■定義「ボタン説明」
		DialogButtonON("Button_SOUND");


..//変数定義
	//リピート用変数
	$Rep_Loop=0;
	//再生用カウント

	//一時停止用変数設定
	$Once_Loop = 0;


	$Sound_Name_Call_Loop=true;
	$SoundName_Number=1;

	$SoundName_Board=53;
	$SoundName_Vertical=26;

	$Sound_Space = ($SoundName_Board * $SoundName_Vertical);

..//ロードイメージ関連
	LoadImage("icon", "cg/extra/sl/スピーカー.png");
	LoadImage("ber_fade", "cg/extra/sl/曲選択中バー表示.png");

	LoadImage("SoundName_Back1", "cg/extra/sl/曲目バー-B.png");
	LoadImage("SoundName_Back2", "cg/extra/sl/曲目バー-A.png");

	LoadImage("Repeat_All01", "cg/extra/sl/リピートボタン-001.png");
	LoadImage("Repeat_All02", "cg/extra/sl/リピートボタン-002.png");
	LoadImage("Repeat_All03", "cg/extra/sl/リピートボタン-003.png");

	LoadImage("Repeat_One01", "cg/extra/sl/一曲リピートボタン-001.png");
	LoadImage("Repeat_One02", "cg/extra/sl/一曲リピートボタン-002.png");
	LoadImage("Repeat_One03", "cg/extra/sl/一曲リピートボタン-003.png");

	LoadImage("Repeat_None01", "cg/extra/sl/リピート停止ボタン-001.png");
	LoadImage("Repeat_None02", "cg/extra/sl/リピート停止ボタン-002.png");
	LoadImage("Repeat_None03", "cg/extra/sl/リピート停止ボタン-003.png");

	LoadImage("Play01", "cg/extra/sl/再生ボタン-001.png");
	LoadImage("Play02", "cg/extra/sl/再生ボタン-002.png");
	LoadImage("Play03", "cg/extra/sl/再生ボタン-003.png");
	SetAlias("Play01","Play01");
	SetAlias("Play02","Play02");
	SetAlias("Play03","Play03");

	LoadImage("Stop01", "cg/extra/sl/停止ボタン-001.png");
	LoadImage("Stop02", "cg/extra/sl/停止ボタン-002.png");
	LoadImage("Stop03", "cg/extra/sl/停止ボタン-003.png");
	SetAlias("Stop01","Stop01");
	SetAlias("Stop02","Stop02");
	SetAlias("Stop03","Stop03");


..//実定義関連
	CreateTexture("BG",1000,0,0,"cg/extra/sl/サウンドライブラリ背景.png");
	SetAlias("BG","BG");

	CreateChoice("Once");
	CreateTexture("Once_def",1000,92,84,"cg/extra/sl/一時停止ボタン-001.png");
	CreateTexture("Once/MouseUsual/img",1000,92,84,"cg/extra/sl/一時停止ボタン-001.png");
	CreateTexture("Once/MouseOver/img",1000,92,84,"cg/extra/sl/一時停止ボタン-002.png");
	CreateTexture("Once/MouseClick/img",1000,92,84,"cg/extra/sl/一時停止ボタン-003.png");

	Rep_Select();
	Play_Select();

	CreateChoice("Fast");
	CreateTexture("Fast_def",1000,152,84,"cg/extra/sl/早送りボタン-001.png");
	CreateTexture("Fast/MouseUsual/img",1000,152,84,"cg/extra/sl/早送りボタン-001.png");
	CreateTexture("Fast/MouseOver/img",1000,152,84,"cg/extra/sl/早送りボタン-002.png");
	CreateTexture("Fast/MouseClick/img",1000,152,84,"cg/extra/sl/早送りボタン-003.png");

	CreateChoice("Ret");
	CreateTexture("Ret_def",1000,214,84,"cg/extra/sl/巻き戻しボタン-001.png");
	CreateTexture("Ret/MouseUsual/img",1000,214,84,"cg/extra/sl/巻き戻しボタン-001.png");
	CreateTexture("Ret/MouseOver/img",1000,214,84,"cg/extra/sl/巻き戻しボタン-002.png");
	CreateTexture("Ret/MouseClick/img",1000,214,84,"cg/extra/sl/巻き戻しボタン-003.png");

	Fade("*/*/*",0,0,null,true);

..//サウンドネーム定義
//	CreateWindow("WindowNAME", 1000, 100, 230, 736, 319, true);
//	CreateWindow("WindowNAME/NUMBER", 1000, 0, 0, 740, $Sound_Space, true);
	CreateWindow("WindowNAME", 1000, 80, 184, 588, 260, true);
	CreateWindow("WindowNAME/NUMBER", 1000, 0, 0, 592, $Sound_Space, true);
	SetAlias("WindowNAME","WindowNAME");
	SetAlias("WindowNAME/NUMBER","WindowNAME/NUMBER");

	while($Sound_Name_Call_Loop){
..//回数判定
		if($SoundName_Number==53){$Sound_Name_Call_Loop=false;}

		if($SoundName_Number==1){
		$END_Name1="M&.I&.L";
		$END_NAME=$END_Name1;
		}else if($SoundName_Number==2){
		$END_Name2="Silence";
		$END_NAME=$END_Name2;
		}else if($SoundName_Number==3){
		$END_Name3="Adventure";
		$END_NAME=$END_Name3;
		}else if($SoundName_Number==4){
		$END_Name4="Soliloquy";
		$END_NAME=$END_Name4;
		}else if($SoundName_Number==5){
		$END_Name5="SHIBUYA";
		$END_NAME=$END_Name5;
		}else if($SoundName_Number==6){
		$END_Name6="Delusion";
		$END_NAME=$END_Name6;
		}else if($SoundName_Number==7){
		$END_Name7="Fear";
		$END_NAME=$END_Name7;
		}else if($SoundName_Number==8){
		$END_Name8="SEIRA";
		$END_NAME=$END_Name8;
		}else if($SoundName_Number==9){
		$END_Name9="Girls";
		$END_NAME=$END_Name9;
		}else if($SoundName_Number==10){
		$END_Name10="Gradually Panic";
		$END_NAME=$END_Name10;
		}else if($SoundName_Number==11){
		$END_Name11="Tender hearts";
		$END_NAME=$END_Name11;
		$SoundName_Get=11;
		}else if($SoundName_Number==12){
		$END_Name12="Doubt";
		$END_NAME=$END_Name12;
		$SoundName_Get=12;
		}else if($SoundName_Number==13){
		$END_Name13="Mysterious";
		$END_NAME=$END_Name13;
		$SoundName_Get=13;
		}else if($SoundName_Number==14){
		$END_Name14="Virtual reality";
		$END_NAME=$END_Name14;
		$SoundName_Get=14;
		}else if($SoundName_Number==15){
		$END_Name15="I'm rounder";
		$END_NAME=$END_Name15;
		$SoundName_Get=15;
		}else if($SoundName_Number==16){
		$END_Name16="In the ward";
		$END_NAME=$END_Name16;
		$SoundName_Get=16;
		}else if($SoundName_Number==17){
		$END_Name17="Town Vanguard";
		$END_NAME=$END_Name17;
		$SoundName_Get=17;
		}else if($SoundName_Number==18){
		$END_Name18="Pity";
		$END_NAME=$END_Name18;
		$SoundName_Get=18;
		}else if($SoundName_Number==19){
		$END_Name19="Detective";
		$END_NAME=$END_Name19;
		$SoundName_Get=19;
		}else if($SoundName_Number==20){
		$END_Name20="Distorted theory";
		$END_NAME=$END_Name20;
		$SoundName_Get=20;
		}else if($SoundName_Number==21){
		$END_Name21="Truth and false";
		$END_NAME=$END_Name21;
		$SoundName_Get=21;
		}else if($SoundName_Number==22){
		$END_Name22="White out";
		$END_NAME=$END_Name22;
		$SoundName_Get=22;
		}else if($SoundName_Number==23){
		$END_Name23="Shogun";
		$END_NAME=$END_Name23;
		$SoundName_Get=23;
		}else if($SoundName_Number==24){
		$END_Name24="Last Battle";
		$END_NAME=$END_Name24;
		$SoundName_Get=24;
		}else if($SoundName_Number==25){
		$END_Name25="Convert";
		$END_NAME=$END_Name25;
		$SoundName_Get=25;
		}else if($SoundName_Number==26){
		$END_Name26="Final chapter";
		$END_NAME=$END_Name26;
		$SoundName_Get=26;
		}else if($SoundName_Number==27){
		$END_Name27="Colors";
		$END_NAME=$END_Name27;
		$SoundName_Get=27;
		}else if($SoundName_Number==28){
		$END_Name28="Real link";
		$END_NAME=$END_Name28;
		$SoundName_Get=28;
		}else if($SoundName_Number==29){
		$END_Name29="Silent sky";
		$END_NAME=$END_Name29;
		$SoundName_Get=29;
		}else if($SoundName_Number==30){
			if(#ClearFinal==true){
				$END_Name30="Find the blue";
				$END_NAME=$END_Name30;
				$SoundName_Get=30;
			}else{
			$END_Name30="？？？";
			$END_NAME=$END_Name30;
			$SoundName_Get=30;
			$SoundLoop_off_01 = true;
			}
		}else if($SoundName_Number==31){
			if(#ClearFinal==true){
				$END_Name31="Desire Blue sky";
				$END_NAME=$END_Name31;
				$SoundName_Get=31;
			}else{
				$END_Name31="？？？";
				$END_NAME=$END_Name31;
				$SoundName_Get=31;
				$SoundLoop_off_02 = true;
			}
		}else if($SoundName_Number==32){
			if(#ClearRouteB==true){
				$END_Name32="クライ";
				$END_NAME=$END_Name32;
				$SoundName_Get=32;
			}else{
				$END_Name32="？？？";
				$END_NAME=$END_Name32;
				$SoundName_Get=32;
				$SoundLoop_off_03 = true;
			}
		}else if($SoundName_Number==33){
			if(#ClearRouteB==true){
				$END_Name33="グラジオール";
				$END_NAME=$END_Name33;
				$SoundName_Get=33;
			}else{
				$END_Name33="？？？";
				$END_NAME=$END_Name33;
				$SoundName_Get=33;
				$SoundLoop_off_04 = true;
			}
		}else if($SoundName_Number==34){$END_Name34="罪過に契約の血を";$END_NAME=$END_Name34;$SoundName_Get=34;}
		else if($SoundName_Number==35){$END_Name35="罪過に契約の血を（アカペラ）";$END_NAME=$END_Name35;$SoundName_Get=35;}
		else if($SoundName_Number==36){$END_Name36="罪過に契約の血を（有線）";$END_NAME=$END_Name36;$SoundName_Get=36;}
		else if($SoundName_Number==37){
			if(#ClearPieceN==true){
			$END_Name37="Love Power";
			$END_NAME=$END_Name37;
			$SoundName_Get=37;
			}else{
				$END_Name37="？？？";
				$END_NAME=$END_Name37;
				$SoundName_Get=37;
				$SoundLoop_off_05 = true;
			}
		}else if($SoundName_Number==38){
			if(#ClearPieceR==true){
			$END_Name38="Trust in me";
			$END_NAME=$END_Name38;
			$SoundName_Get=38;
			}else{
				$END_Name38="？？？";
				$END_NAME=$END_Name38;
				$SoundName_Get=38;
				$SoundLoop_off_06 = true;
			}
		}else if($SoundName_Number==39){
			if(#ClearPieceA==true){
			$END_Name39="心の闇を切り裂いて";
			$END_NAME=$END_Name39;
			$SoundName_Get=39;
			}else{
				$END_Name39="？？？";
				$END_NAME=$END_Name39;
				$SoundName_Get=39;
				$SoundLoop_off_07 = true;
			}
		}else if($SoundName_Number==40){
			if(#ClearPieceK==true){
				$END_Name40="ちいさな声に気づいて";
				$END_NAME=$END_Name40;
				$SoundName_Get=40;
			}else{
				$END_Name40="？？？";
				$END_NAME=$END_Name40;
				$SoundName_Get=40;
				$SoundLoop_off_08 = true;
			}
		}else if($SoundName_Number==41){
			if(#ClearPieceY==true){
				$END_Name41="WHITE LILY";
				$END_NAME=$END_Name41;
				$SoundName_Get=41;
			}else{
				$END_Name41="？？？";
				$END_NAME=$END_Name41;
				$SoundName_Get=41;
				$SoundLoop_off_09 = true;
			}
		}else if($SoundName_Number==42){
			if(#ClearPieceS==true){
				$END_Name42="Calling";
				$END_NAME=$END_Name42;
				$SoundName_Get=42;
			}else{
				$END_Name42="？？？";
				$END_NAME=$END_Name42;
				$SoundName_Get=42;
				$SoundLoop_off_10 = true;
			}
		}else if($SoundName_Number==43){
				$END_Name43="fake me";
				$END_NAME=$END_Name43;
				$SoundName_Get=43;
		}else if($SoundName_Number==44){
			if(#ClearFinal==true){
				$END_Name44="A WILL";
				$END_NAME=$END_Name44;
				$SoundName_Get=44;
			}else{
				$END_Name44="？？？";
				$END_NAME=$END_Name44;
				$SoundName_Get=44;
				$SoundLoop_off_12 = true;
			}
		}else if($SoundName_Number==45){
				$END_Name45="密教の首飾り～グラジオール列王記邪心編より～";
				$END_NAME=$END_Name45;
				$SoundName_Get=45;
		}else if($SoundName_Number==46){
			if(#ClearRouteB==true){
				$END_Name46="アレルイヤの福音～使徒からの手紙第二編より～";
				$END_NAME=$END_Name46;
				$SoundName_Get=46;
			}else{
				$END_Name46="？？？";
				$END_NAME=$END_Name46;
				$SoundName_Get=46;
				$SoundLoop_off_14 = true;
			}
		}else if($SoundName_Number==47){
			if(#ClearFinal==true){
				$END_Name47="Find the blue (instrumental)";
				$END_NAME=$END_Name47;
				$SoundName_Get=47;
			}else{
				$END_Name47="？？？";
				$END_NAME=$END_Name47;
				$SoundName_Get=47;
				$SoundLoop_off_15 = true;
			}
		}else if($SoundName_Number==48){
			if(#ClearPieceN==true){
				$END_Name48="Love Power（instrumental）";
				$END_NAME=$END_Name48;
				$SoundName_Get=48;
			}else{
				$END_Name48="？？？";
				$END_NAME=$END_Name48;
				$SoundName_Get=48;
				$SoundLoop_off_16 = true;
			}
		}else if($SoundName_Number==49){
			if(#ClearPieceR==true){
				$END_Name49="Trust in me（instrumental）";
				$END_NAME=$END_Name49;
				$SoundName_Get=49;
			}else{
				$END_Name49="？？？";
				$END_NAME=$END_Name49;
				$SoundName_Get=49;
				$SoundLoop_off_17 = true;
			}
		}else if($SoundName_Number==50){
			if(#ClearPieceA==true){
				$END_Name50="心の闇を切り裂いて（instrumental）";
				$END_NAME=$END_Name50;
				$SoundName_Get=50;
			}else{
				$END_Name50="？？？";
				$END_NAME=$END_Name50;
				$SoundName_Get=50;
				$SoundLoop_off_18 = true;
			}
		}else if($SoundName_Number==51){
			if(#ClearPieceK==true){
				$END_Name51="ちいさな声に気づいて（instrumental）";
				$END_NAME=$END_Name51;
				$SoundName_Get=51;
			}else{
				$END_Name51="？？？";
				$END_NAME=$END_Name51;
				$SoundName_Get=51;
				$SoundLoop_off_19 = true;
			}
		}else if($SoundName_Number==52){
			if(#ClearPieceY==true){
				$END_Name52="WHITE LILY（instrumental）";
				$END_NAME=$END_Name52;
				$SoundName_Get=52;
			}else{
				$END_Name52="？？？";
				$END_NAME=$END_Name52;
				$SoundName_Get=52;
				$SoundLoop_off_20 = true;
			}
		}else if($SoundName_Number==53){
			if(#ClearPieceS==true){
				$END_Name53="Calling（instrumental）";
				$END_NAME=$END_Name53;
				$SoundName_Get=53;
			}else{
				$END_Name53="？？？";
				$END_NAME=$END_Name53;
				$SoundName_Get=53;
				$SoundLoop_off_21 = true;
			}
		}

..//サウンドネーム変数管理
		$SoundName_GK = $SoundName_Number%2;
		$SoundNum = "WindowNAME/NUMBER/Num_" + $SoundName_Number;
		$SoundNumY = (($SoundName_Number*32) - 42) * 4 / 5;
		$SoundNum_Back = "WindowNAME/NUMBER/Back_" + $SoundName_Number;
		$SoundNumY_Back = ($SoundName_Number*26) - 26;
		$SoundNumY_Back2 = (($SoundName_Number*32) + 197) * 4 / 5;
		$SoundNumY_Back3 = (($SoundName_Number*32) + 188) * 4 / 5;
		$SoundName_Number_Fade = String("%02d",$SoundName_Number);
		$SoundName = "WindowNAME/NUMBER/Name_" + $SoundName_Number;
		$SoundName_Kind = "WindowNAME/NUMBER/Kind_" + $SoundName_Number;
		$SoundName_icon = "WindowNAME/NUMBER/icon_" + $SoundName_Number;
		$SoundNum_icon = (($SoundName_Number*26)-27);

		$CHOICE ="WindowNAME/NUMBER/Choice_" + $SoundName_Number;
		$Sound_Name_Usual = $CHOICE + "/MouseUsual/img";
//		$Sound_Name_Usual_2 = $CHOICE + "/MouseUsual/img_2";
		$Sound_Name_Over = $CHOICE + "/MouseOver/img";
		$Sound_Name_Over_2 = $CHOICE + "/MouseOver/img_2";
		$Sound_Name_Over_3 = $CHOICE + "/MouseOver/img_3";
		$Sound_Name_Over_4 = $CHOICE + "/MouseOver/img_4";
		$Sound_Name_Click = $CHOICE + "/MouseClick/img";
		$Sound_Name_Over_N = $CHOICE + "/MouseOver/img_N";
		$SoundName_songer = "WindowNAME/NUMBER/songer_" + $SoundName_Number;

		$SoundName_A = String("%03d",$SoundName_Number);
		$SoundName_ART = "cg/extra/sl/s"+ $SoundName_A +"_1.png";
		$SoundName_OVER = "cg/extra/sl/s"+ $SoundName_A +"_2.jpg";

		$SoundName_ART2 = "cg/extra/sl/s"+ $SoundName_A +"_3.png";
		$SoundName_OVER2 = "cg/extra/sl/s"+ $SoundName_A +"_4.jpg";

		if($SoundName_GK==0){$SoundName_Back_true = "SoundName_Back1";}else{$SoundName_Back_true = "SoundName_Back2";}

	CreateTexture($SoundName_icon, 1101, 34, $SoundNum_icon, icon);
	SetAlias($SoundName_icon,$SoundName_icon);
	Fade($SoundName_icon,0,0,null, true);

//back_bar
	CreateTexture($SoundNum_Back, 1001, 0, $SoundNumY_Back, $SoundName_Back_true);

	if($SoundName_Number==30){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==31){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==32){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==33){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==37){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==38){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==39){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==40){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==41){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==42){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==44){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==46){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==47){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==48){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==49){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==50){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==51){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==52){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else if($SoundName_Number==53){if($END_NAME=="？？？"){CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART2);}else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}}
	else{CreateTexture($SoundName, 1002, 0, $SoundNumY_Back, $SoundName_ART);}

	SetAlias($SoundNum_Back,$SoundNum_Back);
	SetAlias($SoundName,$SoundName);
	CreateChoice($CHOICE);

	$SoundNumY_BackN=$SoundNumY_Back+184;

	if($SoundName_Number==30){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==31){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==32){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==33){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==37){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==38){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==39){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==40){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==41){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==42){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==44){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==46){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==47){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==48){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==49){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==50){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==51){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==52){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else if($SoundName_Number==53){if($END_NAME=="？？？"){CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER2);}else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}}
	else{CreateTexture($Sound_Name_Over_2, 1100, 80, $SoundNumY_BackN, $SoundName_OVER);}

	CreateTexture($Sound_Name_Usual, 1050, 80, $SoundNumY_Back2, ber_fade);
	Request($Sound_Name_Usual, Erase);
	Fade($Sound_Name_Over,0,0,null,true);
	Fade($Sound_Name_Over_2,0,0,null,true);
	Fade($Sound_Name_Over_3,0,0,null,true);
	Fade($Sound_Name_Over_4,0,0,null,true);

	$SoundName_Number++;

	}//while終了箇所

	$Space = $Sound_Space-256;

	$slLoop=false;
	$slExit=false;
	//$SYSTEM_script_close="";
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	$SYSTEM_XBOX360_button_lb_down=false;
	$SYSTEM_XBOX360_button_rb_down=false;
	$right_pad = XBOX360_PadTrigger(0);
	$left_pad = XBOX360_PadTrigger(1);

..//文字ロール
	CreateWindow("WindowText", 1000, 261, 85, 225, 96, false);

//	CreateWindow("WindowText", 1000, 0, 0, 1280, 760, false);


	SetAlias("WindowText","WindowText");
	CreateTexture("WindowText/Bokenas001",1000,520,87,"cg/extra/sl/Flowing message.png");
	SetAlias("WindowText/Bokenas001","Bokenas001");

	CreateTexture("WindowText/Bokenas002",1000,520,87,"cg/extra/sl/Flowing message.png");
	SetAlias("WindowText/Bokenas002","Bokenas002");


	CreateProcess("TSP",0,0,0,"TextScroll_Process");
	Request("TSP",Start);

..//サウンドタイム判定用
	CreateTexture("SoundTimebar",1000,270,100,"cg/extra/sl/調整つまみ-01.png");
	SetAlias("SoundTimebar","SoundTimebar");
	CreateProcess("PSP",0,0,0,"PlaySound_Process");

//test
//#SYSTEM_sound_volume_bgm=911;

..//サウンドタイム判定用


	$SoundVCS = #SYSTEM_sound_volume_bgm;
	$SoundVCS2 = $SoundVCS/100;
	$SoundVCS3=(($SoundVCS2*11)+686) * 4 / 5;

	CreateTexture("Sound_Volume",1000,$SoundVCS3,103,"cg/extra/sl/調整つまみ-01.png");
	SetAlias("Sound_Volume","Sound_Volume");

		CreateChoice("CLICK2");
		CreateColor("CLICK2/MouseUsual/img", 1, 0, 520, 512, 56, "Black");
		CreateColor("CLICK2/MouseOver/img", 1, 0, 520, 512, 56, "Black");
		CreateColor("CLICK2/MouseClick/img", 1, 0, 520, 512, 56, "Black");
		SetAlias("CLICK2","CLICK2");

		CreateChoice("CLICK3");
		CreateColor("CLICK3/MouseUsual/img", 1, 512, 520, 512, 56, "Black");
		CreateColor("CLICK3/MouseOver/img", 1, 512, 520, 512, 56, "Black");
		CreateColor("CLICK3/MouseClick/img", 1, 512, 520, 512, 56, "Black");
		SetAlias("CLICK3","CLICK3");

		CreateChoice("CLICK4");
		CreateColor("CLICK4/MouseUsual/img", 1, 0, 0, 512, 40, "Black");
		CreateColor("CLICK4/MouseOver/img", 1, 0, 0, 512, 40, "Black");
		CreateColor("CLICK4/MouseClick/img", 1, 0, 0, 512, 40, "Black");
		SetAlias("CLICK4","CLICK4");

		CreateChoice("CLICK5");
		CreateColor("CLICK5/MouseUsual/img", 1, 512, 0, 512, 40, "Black");
		CreateColor("CLICK5/MouseOver/img", 1, 512, 0, 512, 40, "Black");
		CreateColor("CLICK5/MouseClick/img", 1, 512, 0, 512, 40, "Black");
		SetAlias("CLICK5","CLICK5");

	//★★★★アンロック
	XBOX360_LockVideo(false);

//	Fade("BLK",300,0,null,false);
	Wait(100);

	Fade("@エキストラスクリーン",300,0,null,true);
	//▲描画「ボタン説明」
	DialogButtonFade("Button_SOUND");
	Request("@エキストラスクリーン", Disused);

//CursorSet


//page用
		$MusicTop=0;
//末尾用
		$MusicBottom=53;
		$MRM1=243;
		$MRM2=276;
		$MRM3=307;
		$MRM4=340;
		$MRM5=373;
		$MRM6=406;
		$MRM7=439;
		$MRM8=472;
		$MRM9=505;
		$MRM10=533;

		$SYSTEM_XBOX360_button_left_down=false;
		$SYSTEM_XBOX360_button_right_down=false;
		$SYSTEM_XBOX360_button_up_down=false;
		$SYSTEM_XBOX360_button_down_down=false;

	while(!$slExit){

		select{

			CursorPosition($MusicCsrX,$MusicCsrY);
			

			if(Platform()==100){
				if($SYSTEM_XBOX360_button_up_down||$SYSTEM_XBOX360_button_left_down){
					break;
				}else if($SYSTEM_XBOX360_button_down_down||$SYSTEM_XBOX360_button_right_down){
					break;
				}
			}else{
				$カルテ位置 = Integer($カルテ縦幅 * ScrollbarValue("@カルテスクロール"));
				$カルテ位置３ = $カルテ位置２ - $カルテ位置;
				$カルテ位置２ = $カルテ位置;
				Move("カルテベース/カルテウィンドウ/カルテチョイス*/*/*", 0, @0, @$カルテ位置３, null, false);
				Move("カルテベース/カルテウィンドウ*", 0, @0, @$カルテ位置３, null, true);
			}

			if(Platform()!=100){
				if($CsrX<=174&&$CsrX>=160&&$CsrY<=176&&$CsrY>=168){
					break;
				}else if($CsrX<=218&&$CsrX>=200&&$CsrY<=520&&$CsrY>=510){
					break;
				}
			}

..//Sound_Stop
			if($Play_now==false){Request("@CH*",Stop);}

..//Menu_back(B)
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$slExit=true;break;}

..//Next_Music(LB)
			if($SYSTEM_XBOX360_button_rb_down){
				Request("PSP",Stop);
				$Play_NowMusic++;

		if($Play_NowMusic==30){if($SoundLoop_off_01 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==31){if($SoundLoop_off_02 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==32){if($SoundLoop_off_03 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==33){if($SoundLoop_off_04 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==37){if($SoundLoop_off_05 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==38){if($SoundLoop_off_06 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==39){if($SoundLoop_off_07 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==40){if($SoundLoop_off_08 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==41){if($SoundLoop_off_09 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==42){if($SoundLoop_off_10 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==43){if($SoundLoop_off_11 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==44){if($SoundLoop_off_12 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==45){if($SoundLoop_off_13 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==46){if($SoundLoop_off_14 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==47){if($SoundLoop_off_15 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==48){if($SoundLoop_off_16 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==49){if($SoundLoop_off_17 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==50){if($SoundLoop_off_18 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==51){if($SoundLoop_off_19 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==52){if($SoundLoop_off_20 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==53){if($SoundLoop_off_21 == true){$Play_NowMusic++;}else{}}

				if($Play_NowMusic >=53){
					$Play_NowMusic=1;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now1=true;
					$SPSOn=true;
					Request("PSP",Start);

				}else{
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now1=true;
					$SPSOn=true;
					Request("PSP",Start);
				}
			}
..//Back_Music(LB)
			if($SYSTEM_XBOX360_button_lb_down){
				Request("PSP",Stop);
				$Play_NowMusic--;
				if($Play_NowMusic==53){if($SoundLoop_off_21 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==52){if($SoundLoop_off_20 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==51){if($SoundLoop_off_19 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==50){if($SoundLoop_off_18 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==49){if($SoundLoop_off_17 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==48){if($SoundLoop_off_16 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==47){if($SoundLoop_off_15 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==46){if($SoundLoop_off_14 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==45){if($SoundLoop_off_13 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==44){if($SoundLoop_off_12 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==43){if($SoundLoop_off_11 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==42){if($SoundLoop_off_10 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==41){if($SoundLoop_off_09 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==40){if($SoundLoop_off_08 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==39){if($SoundLoop_off_07 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==38){if($SoundLoop_off_06 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==37){if($SoundLoop_off_05 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==33){if($SoundLoop_off_04 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==32){if($SoundLoop_off_03 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==31){if($SoundLoop_off_02 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==30){if($SoundLoop_off_01 == true){$Play_NowMusic--;}else{}}

			if($Play_NowMusic <=0){
					$Play_NowMusic=53;
				if($Play_NowMusic==53){if($SoundLoop_off_21 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==52){if($SoundLoop_off_20 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==51){if($SoundLoop_off_19 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==50){if($SoundLoop_off_18 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==49){if($SoundLoop_off_17 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==48){if($SoundLoop_off_16 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==47){if($SoundLoop_off_15 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==46){if($SoundLoop_off_14 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==45){if($SoundLoop_off_13 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==44){if($SoundLoop_off_12 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==43){if($SoundLoop_off_11 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==42){if($SoundLoop_off_10 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==41){if($SoundLoop_off_09 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==40){if($SoundLoop_off_08 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==39){if($SoundLoop_off_07 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==38){if($SoundLoop_off_06 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==37){if($SoundLoop_off_05 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==33){if($SoundLoop_off_04 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==32){if($SoundLoop_off_03 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==31){if($SoundLoop_off_02 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==30){if($SoundLoop_off_01 == true){$Play_NowMusic--;}else{}}

					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now1=true;
					$SPSOn=true;
					Request("PSP",Start);

				}else{
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now1=true;
					$SPSOn=true;
					Request("PSP",Start);
				}
			}
			case Once:{
				$Once_Loop++;
				if($Once_Loop==1){
					Request("PSP",Stop);
					Move("@SoundTimebar",0,270,@0,null,true);
					Request($Sound_Play_Name, Pause);
				}else if($Once_Loop>=2){
					$Once_Loop = 0;
					Request("PSP",Start);
					Request($Sound_Play_Name, Resume);
				}
			}
			case Rep:{
				$Rep_Loop++;
				Rep_Select();
//				$Text001 = "Rep_Loop=" + $Rep_Loop;
//				$Text002 = "Repeat_Music=" + $Repeat_Music;
//				$Text003 = "One_Repeat_Music=" + $One_Repeat_Music;
//				SetFont("ＭＳ ゴシック", 22, #000000, #000000, NORMAL, NONE);
//				CreateText("テキスト１", 20000, 0, 20, 700, 500, $Text001);
//				Wait(16);
//				CreateText("テキスト２", 20000, 0, 50, 700, 500, $Text002);
//				Wait(16);
//				CreateText("テキスト３", 20000, 0, 80, 700, 500, $Text003);
//				Wait(16);
			}
			case Fast:{
				Request("PSP",Stop);
				$Play_NowMusic++;

				if($Play_NowMusic==30){if($SoundLoop_off_01 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==31){if($SoundLoop_off_02 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==32){if($SoundLoop_off_03 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==33){if($SoundLoop_off_04 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==37){if($SoundLoop_off_05 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==38){if($SoundLoop_off_06 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==39){if($SoundLoop_off_07 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==40){if($SoundLoop_off_08 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==41){if($SoundLoop_off_09 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==42){if($SoundLoop_off_10 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==43){if($SoundLoop_off_11 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==44){if($SoundLoop_off_12 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==45){if($SoundLoop_off_13 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==46){if($SoundLoop_off_14 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==47){if($SoundLoop_off_15 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==48){if($SoundLoop_off_16 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==49){if($SoundLoop_off_17 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==50){if($SoundLoop_off_18 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==51){if($SoundLoop_off_19 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==52){if($SoundLoop_off_20 == true){$Play_NowMusic++;}else{}}
				if($Play_NowMusic==53){if($SoundLoop_off_21 == true){$Play_NowMusic++;}else{}}

				if($Play_NowMusic >=53){
					$Play_NowMusic=1;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now1=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now1=true;
					$SPSOn=true;
					Request("PSP",Start);
				}
			}
			case Ret:{
				Request("PSP",Stop);
				$Play_NowMusic--;

				if($Play_NowMusic==53){if($SoundLoop_off_21 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==52){if($SoundLoop_off_20 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==51){if($SoundLoop_off_19 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==50){if($SoundLoop_off_18 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==49){if($SoundLoop_off_17 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==48){if($SoundLoop_off_16 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==47){if($SoundLoop_off_15 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==46){if($SoundLoop_off_14 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==45){if($SoundLoop_off_13 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==44){if($SoundLoop_off_12 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==43){if($SoundLoop_off_11 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==42){if($SoundLoop_off_10 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==41){if($SoundLoop_off_09 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==40){if($SoundLoop_off_08 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==39){if($SoundLoop_off_07 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==38){if($SoundLoop_off_06 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==37){if($SoundLoop_off_05 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==33){if($SoundLoop_off_04 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==32){if($SoundLoop_off_03 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==31){if($SoundLoop_off_02 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==30){if($SoundLoop_off_01 == true){$Play_NowMusic--;}else{}}

				if($Play_NowMusic <=0){
					$Play_NowMusic=53;

				if($Play_NowMusic==53){if($SoundLoop_off_21 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==52){if($SoundLoop_off_20 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==51){if($SoundLoop_off_19 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==50){if($SoundLoop_off_18 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==49){if($SoundLoop_off_17 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==48){if($SoundLoop_off_16 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==47){if($SoundLoop_off_15 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==46){if($SoundLoop_off_14 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==45){if($SoundLoop_off_13 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==44){if($SoundLoop_off_12 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==43){if($SoundLoop_off_11 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==42){if($SoundLoop_off_10 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==41){if($SoundLoop_off_09 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==40){if($SoundLoop_off_08 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==39){if($SoundLoop_off_07 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==38){if($SoundLoop_off_06 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==37){if($SoundLoop_off_05 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==33){if($SoundLoop_off_04 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==32){if($SoundLoop_off_03 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==31){if($SoundLoop_off_02 == true){$Play_NowMusic--;}else{}}
				if($Play_NowMusic==30){if($SoundLoop_off_01 == true){$Play_NowMusic--;}else{}}
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now1=true;
					$SPSOn=true;
					Request("PSP",Start);

				}else{
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now1=true;
					$SPSOn=true;
					Request("PSP",Start);
				}
			}
			case Play:{
				if($Play_now == true){
					Request("PSP",Stop);
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Move("@SoundTimebar",0,270,@0,null,true);
					$Play_Count=0;
					Play_Select();
				}
			}
			case WindowNAME/NUMBER/Choice_1:
			{
				Request("PSP",Stop);
//曲指定用ナンバー
				$Play_NowMusic=1;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);

				Play_Sound_GO();
//同じ曲が押された時用
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now1=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_2:
			{
				Request("PSP",Stop);
				$Play_NowMusic=2;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now2=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_3:
			{
				Request("PSP",Stop);
				$Play_NowMusic=3;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now3=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_4:
			{
				Request("PSP",Stop);
				$Play_NowMusic=4;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now4=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_5:
			{
				Request("PSP",Stop);
				$Play_NowMusic=5;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now5=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_6:
			{
				Request("PSP",Stop);
				$Play_NowMusic=6;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now6=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_7:
			{
				Request("PSP",Stop);
				$Play_NowMusic=7;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now7=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_8:
			{
				Request("PSP",Stop);
				$Play_NowMusic=8;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now8=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_9:
			{
				Request("PSP",Stop);
				$Play_NowMusic=9;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now9=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_10:
			{
				Request("PSP",Stop);
				$Play_NowMusic=10;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now10=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_11:
			{
				Request("PSP",Stop);
				$Play_NowMusic=11;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now11=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_12:
			{
				Request("PSP",Stop);
				$Play_NowMusic=12;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now12=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_13:
			{
				Request("PSP",Stop);
				$Play_NowMusic=13;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now13=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_14:
			{
				Request("PSP",Stop);
				$Play_NowMusic=14;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now14=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_15:
			{
				Request("PSP",Stop);
				$Play_NowMusic=15;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now15=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_16:
			{
				Request("PSP",Stop);
				$Play_NowMusic=16;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now16=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_17:
			{
				Request("PSP",Stop);
				$Play_NowMusic=17;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now17=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_18:
			{
				Request("PSP",Stop);
				$Play_NowMusic=18;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now18=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_19:
			{
				Request("PSP",Stop);
				$Play_NowMusic=19;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now19=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_20:
			{
				Request("PSP",Stop);
				$Play_NowMusic=20;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now20=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_21:
			{
				Request("PSP",Stop);
				$Play_NowMusic=21;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now21=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_22:
			{
				Request("PSP",Stop);
				$Play_NowMusic=22;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now22=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_23:
			{
				Request("PSP",Stop);
				$Play_NowMusic=23;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now23=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_24:
			{
				Request("PSP",Stop);
				$Play_NowMusic=24;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now24=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_25:
			{
				Request("PSP",Stop);
				$Play_NowMusic=25;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now25=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_26:
			{
				Request("PSP",Stop);
				$Play_NowMusic=26;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now26=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_27:
			{
				Request("PSP",Stop);
				$Play_NowMusic=27;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now27=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_28:
			{
				Request("PSP",Stop);
				$Play_NowMusic=28;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now28=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_29:
			{
				Request("PSP",Stop);
				$Play_NowMusic=29;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now29=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_30:
			{
				if(#ClearFinal==true){
					Request("PSP",Stop);
					$Play_NowMusic=30;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now30=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{
				}
			}
			case WindowNAME/NUMBER/Choice_31:
			{
				if(#ClearFinal==true){
					Request("PSP",Stop);
					$Play_NowMusic=31;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now31=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_32:
			{
				if(#ClearRouteB==true){
					Request("PSP",Stop);
					$Play_NowMusic=32;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now32=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_33:
			{
				if(#ClearRouteB==true){
					Request("PSP",Stop);
					$Play_NowMusic=33;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now33=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_34:
			{
				Request("PSP",Stop);
				$Play_NowMusic=34;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now34=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_35:
			{
				Request("PSP",Stop);
				$Play_NowMusic=35;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now35=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_36:
			{
				Request("PSP",Stop);
				$Play_NowMusic=36;
				$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Play_Count=2;
				Play_Select();
				$Sound_Play_now36=true;
				$SPSOn=true;
				Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_37:
			{
				if(#ClearPieceN==true){
					Request("PSP",Stop);
					$Play_NowMusic=37;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now37=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_38:
			{
				if(#ClearPieceR==true){
					Request("PSP",Stop);
					$Play_NowMusic=38;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now38=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_39:
			{
				if(#ClearPieceA==true){
					Request("PSP",Stop);
					$Play_NowMusic=39;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now39=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_40:
			{
				if(#ClearPieceK==true){
					Request("PSP",Stop);
					$Play_NowMusic=40;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now40=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_41:
			{
				if(#ClearPieceY==true){
					Request("PSP",Stop);
					$Play_NowMusic=41;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now41=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_42:
			{
				if(#ClearPieceS==true){
					Request("PSP",Stop);
					$Play_NowMusic=42;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now42=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_43:
			{
					Request("PSP",Stop);
					$Play_NowMusic=43;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now43=true;
					$SPSOn=true;
					Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_44:
			{
				if(#ClearFinal==true){
					Request("PSP",Stop);
					$Play_NowMusic=44;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now44=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_45:
			{
					Request("PSP",Stop);
					$Play_NowMusic=45;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now45=true;
					$SPSOn=true;
					Request("PSP",Start);
			}
			case WindowNAME/NUMBER/Choice_46:
			{
//おがみ：謎のフラグ判定　ルートBフラグに変更　#FES_Sing==true
				if(#ClearRouteB==true){
					Request("PSP",Stop);
					$Play_NowMusic=46;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now46=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_47:
			{
				if(#ClearFinal==true){
					Request("PSP",Stop);
					$Play_NowMusic=47;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now47=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_48:
			{
				if(#ClearPieceN==true){
					Request("PSP",Stop);
					$Play_NowMusic=48;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now48=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_49:
			{
				if(#ClearPieceR==true){
					Request("PSP",Stop);
					$Play_NowMusic=49;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now49=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_50:
			{
				if(#ClearPieceA==true){
					Request("PSP",Stop);
					$Play_NowMusic=50;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now50=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_51:
			{
				if(#ClearPieceK==true){
					Request("PSP",Stop);
					$Play_NowMusic=51;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now51=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_52:
			{
				if(#ClearPieceY==true){
					Request("PSP",Stop);
					$Play_NowMusic=52;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now52=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case WindowNAME/NUMBER/Choice_53:
			{
				if(#ClearPieceS==true){
					Request("PSP",Stop);
					$Play_NowMusic=53;
					$iconNatC = "WindowNAME/NUMBER/icon_" + $Play_NowMusic;
					Fade("WindowNAME/NUMBER/icon_*", 0,0,null,true);
					Fade($iconNatC, 100,1000,null,true);
					Play_Sound_GO();
					Sound_Play_Name_before();
					$Play_Count=2;
					Play_Select();
					$Sound_Play_now53=true;
					$SPSOn=true;
					Request("PSP",Start);
				}else{}
			}
			case CLICK2{

			Move("@WindowNAME/NUMBER*", 0, @0, @-52, null, false);
			Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @-52, null, false);
			Move("@WindowNAME/NUMBER/*/*", 0, @0, @-52, null, true);
			}
			case CLICK3{
			Move("@WindowNAME/NUMBER*", 0, @0, @+26, null, false);
			Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @+26, null, false);
			Move("@WindowNAME/NUMBER/*/*", 0, @0, @+26, null, true);
			}
			case CLICK4{
				$SoundVCS = $SoundVCS - 100;

				if($SoundVCS<=0){
				$SoundVCS = 0;
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				Move("Sound_Volume", 50, 548, @0, null, false);
				}else{
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				$SoundVCS2 = $SoundVCS/100;
				$SoundVCS3=(($SoundVCS2*11)+686) * 4 / 5;
				Move("Sound_Volume", 50, $SoundVCS3, @0, null, false);
				}
//			CreateText("テキスト１", 20000, 0, 20, 700, 500, #SYSTEM_sound_volume_bgm);
//			Wait(16);
			}
			case CLICK5{
				$SoundVCS = $SoundVCS + 100;

				if($SoundVCS>=1000){
				$SoundVCS = 1000;
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				Move("Sound_Volume", 50, 636, @0, null, false);
				}else{
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				$SoundVCS2 = $SoundVCS/100;
				$SoundVCS3=(($SoundVCS2*11)+686) * 4 / 5;
				Move("Sound_Volume", 50, $SoundVCS3, @0, null, false);
				}
//			CreateText("テキスト１", 20000, 0, 20, 700, 500, #SYSTEM_sound_volume_bgm);
//			Wait(16);
			}
			if(XBOX360_PadTrigger(0) > 0 && XBOX360_PadTrigger(0) <= 0.5){
				$SoundVCS = $SoundVCS - 50;
				if($SoundVCS<=0){
				$SoundVCS = 0;
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				Move("Sound_Volume", 64, 548, @0, null, true);
				}else{
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				$SoundVCS2 = $SoundVCS/100;
				$SoundVCS3=(($SoundVCS2*11)+686) * 4 / 5;
				Move("Sound_Volume", 64, $SoundVCS3, @0, null, true);
				}
			}else if(XBOX360_PadTrigger(0) > 0.6){
				$SoundVCS = $SoundVCS - 100;
				if($SoundVCS<=0){
				$SoundVCS = 0;
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				Move("Sound_Volume", 64, 548, @0, null, true);
				}else{
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				$SoundVCS2 = $SoundVCS/100;
				$SoundVCS3=(($SoundVCS2*11)+686) * 4 / 5;
				Move("Sound_Volume", 64, $SoundVCS3, @0, null, true);
				}
			}
			if(XBOX360_PadTrigger(1) > 0 && XBOX360_PadTrigger(1) <= 0.5){
				$SoundVCS = $SoundVCS + 50;
				if($SoundVCS>=1000){
				$SoundVCS = 1000;
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				Move("Sound_Volume", 64, 636, @0, null, true);
				}else{
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				$SoundVCS2 = $SoundVCS/100;
				$SoundVCS3=(($SoundVCS2*11)+686) * 4 / 5;
				Move("Sound_Volume", 64, $SoundVCS3, @0, null, true);
				}
			}else if(XBOX360_PadTrigger(1) > 0.5){
				$SoundVCS = $SoundVCS + 100;

				if($SoundVCS>=1000){
				$SoundVCS = 1000;
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				Move("Sound_Volume", 64, 636, @0, null, true);
				}else{
				#SYSTEM_sound_volume_bgm = $SoundVCS;
				$SoundVCS2 = $SoundVCS/100;
				$SoundVCS3=(($SoundVCS2*11)+686) * 4 / 5;
				Move("Sound_Volume", 64, $SoundVCS3, @0, null, true);
				}
			}
		}
		Wait(32);

		if(Platform()==100){
			//▽廻す
			MusicMoveStart();
		}

		$SYSTEM_XBOX360_button_left_down=false;
		$SYSTEM_XBOX360_button_right_down=false;
		$SYSTEM_XBOX360_button_up_down=false;
		$SYSTEM_XBOX360_button_down_down=false;

	}

		Request("BLK", Lock);
		Fade("BLK",300,1000,null,false);
		//▲描画「ボタン説明」
		DialogButtonOFF("Button_SOUND");
		WaitAction("BLK",null);
		Delete("*");
		Request("BLK", UnLock);
//	$SYSTEM_script_close="nss/sys_close.nss";
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	#SYSTEM_sound_volume_bgm=$SoundVCS;
}

..//Play_Sound_GO
function Play_Sound_GO(){

	if($Play_NowMusic==1){$slSongName="CH00";}
	else if($Play_NowMusic==2){$slSongName="CH01";}
	else if($Play_NowMusic==3){$slSongName="CH02";}
	else if($Play_NowMusic==4){$slSongName="CH03";}
	else if($Play_NowMusic==5){$slSongName="CH04";}
	else if($Play_NowMusic==6){$slSongName="CH05";}
	else if($Play_NowMusic==7){$slSongName="CH06";}
	else if($Play_NowMusic==8){$slSongName="CH07";}
	else if($Play_NowMusic==9){$slSongName="CH08";}
	else if($Play_NowMusic==10){$slSongName="CH10";}
	else if($Play_NowMusic==11){$slSongName="CH11";}
	else if($Play_NowMusic==12){$slSongName="CH12";}
	else if($Play_NowMusic==13){$slSongName="CH13";}
	else if($Play_NowMusic==14){$slSongName="CH14";}
	else if($Play_NowMusic==15){$slSongName="CH15";}
	else if($Play_NowMusic==16){$slSongName="CH20";}
	else if($Play_NowMusic==17){$slSongName="CH21";}
	else if($Play_NowMusic==18){$slSongName="CH22";}
	else if($Play_NowMusic==19){$slSongName="CH23";}
	else if($Play_NowMusic==20){$slSongName="CH24";}
	else if($Play_NowMusic==21){$slSongName="CH25";}
	else if($Play_NowMusic==22){$slSongName="CH26";}
	else if($Play_NowMusic==23){$slSongName="CH28";}
	else if($Play_NowMusic==24){$slSongName="CH29";}
	else if($Play_NowMusic==25){$slSongName="chn01";}
	else if($Play_NowMusic==26){$slSongName="chn02";}
	else if($Play_NowMusic==27){$slSongName="chn03";}
	else if($Play_NowMusic==28){$slSongName="chn04";}
	else if($Play_NowMusic==29){$slSongName="chn05";}
	else if($Play_NowMusic==30){$slSongName="CH_OP";}
	else if($Play_NowMusic==31){$slSongName="CH_ED_A";}
	else if($Play_NowMusic==32){$slSongName="CH_ED_B";}
	else if($Play_NowMusic==33){$slSongName="CH_ED_C";}
	else if($Play_NowMusic==34){$slSongName="CH_INS_FES_ライヴ";}
	else if($Play_NowMusic==35){$slSongName="CH_INS_FES_あかぺら";}
	else if($Play_NowMusic==36){$slSongName="CH09";}
	else if($Play_NowMusic==37){$slSongName="CHN_ED_nanami";}
	else if($Play_NowMusic==38){$slSongName="CHN_ED_rimi";}
	else if($Play_NowMusic==39){$slSongName="CHN_ED_ayase";}
	else if($Play_NowMusic==40){$slSongName="CHN_ED_kozue";}
	else if($Play_NowMusic==41){$slSongName="CHN_ED_yua";}
	else if($Play_NowMusic==42){$slSongName="CHN_ED_sena";}
	else if($Play_NowMusic==43){$slSongName="CHN_OP";}
	else if($Play_NowMusic==44){$slSongName="CHN_ED_A";}
	else if($Play_NowMusic==45){$slSongName="CHN_INS_PHANTASM";}
	else if($Play_NowMusic==46){$slSongName="CHN_ED_B";}
	else if($Play_NowMusic==47){$slSongName="CH_OP_Instrumental";}
	else if($Play_NowMusic==48){$slSongName="CHN_ED_nanami_inst";}
	else if($Play_NowMusic==49){$slSongName="CHN_ED_rimi_inst";}
	else if($Play_NowMusic==50){$slSongName="CHN_ED_ayase_inst";}
	else if($Play_NowMusic==51){$slSongName="CHN_ED_kozue_inst";}
	else if($Play_NowMusic==52){$slSongName="CHN_ED_yua_inst";}
	else if($Play_NowMusic==53){$slSongName="CHN_ED_sena_inst";}

//	CreateText("テキスト10", 20000, 0, 200, 700, 500, $slSongName);

	Wait(16);

	$slSongName_J = "@"+$slSongName;

	if($slSongName_J==$Sound_Play_Name){

		Request($slSongName, Stop);
		Request($slSongName, Play);

//おがみ：試行錯誤の結果、ボリューム設定で修正
//		CreateBGM360($slSongName);
//		Request($Sound_Play_Name, Stop);
//		Request($Sound_Play_Name, Play);
//		$Rep_J = RemainTime($slSongName_J);

		$Rep_J = RemainTime(@$slSongName);
		SetVolume($slSongName, 0, 1000, null);
		Move("@SoundTimebar",0,270,@0,null,true);
	}else{
		SetVolume($Sound_Play_Name, 500, 0, null);
		Request($Sound_Play_Name, UnLock);
		Request($Sound_Play_Name, Disused);

		CreateBGM360($slSongName);
		SetLoop($slSongName, true);
		SetVolume($slSongName, 1000, 1000, null);
		Request($slSongName, Play);
		$Rep_J = RemainTime($slSongName);
		Move("@SoundTimebar",0,270,@0,null,true);
	}

}

..//Sound_Play_Name_before
function Sound_Play_Name_before(){

	if($Play_NowMusic==1){$Sound_Play_Name1="@CH00";$Sound_Play_Name=$Sound_Play_Name1;}
	else if($Play_NowMusic==2){$Sound_Play_Name2="@CH01";$Sound_Play_Name=$Sound_Play_Name2;}
	else if($Play_NowMusic==3){$Sound_Play_Name3="@CH02";$Sound_Play_Name=$Sound_Play_Name3;}
	else if($Play_NowMusic==4){$Sound_Play_Name4="@CH03";$Sound_Play_Name=$Sound_Play_Name4;}
	else if($Play_NowMusic==5){$Sound_Play_Name5="@CH04";$Sound_Play_Name=$Sound_Play_Name5;}
	else if($Play_NowMusic==6){$Sound_Play_Name6="@CH05";$Sound_Play_Name=$Sound_Play_Name6;}
	else if($Play_NowMusic==7){$Sound_Play_Name7="@CH06";$Sound_Play_Name=$Sound_Play_Name7;}
	else if($Play_NowMusic==8){$Sound_Play_Name8="@CH07";$Sound_Play_Name=$Sound_Play_Name8;}
	else if($Play_NowMusic==9){$Sound_Play_Name9="@CH08";$Sound_Play_Name=$Sound_Play_Name9;}
	else if($Play_NowMusic==10){$Sound_Play_Name10="@CH10";$Sound_Play_Name=$Sound_Play_Name10;}
	else if($Play_NowMusic==11){$Sound_Play_Name11="@CH11";$Sound_Play_Name=$Sound_Play_Name11;}
	else if($Play_NowMusic==12){$Sound_Play_Name12="@CH12";$Sound_Play_Name=$Sound_Play_Name12;}
	else if($Play_NowMusic==13){$Sound_Play_Name13="@CH13";$Sound_Play_Name=$Sound_Play_Name13;}
	else if($Play_NowMusic==14){$Sound_Play_Name14="@CH14";$Sound_Play_Name=$Sound_Play_Name14;}
	else if($Play_NowMusic==15){$Sound_Play_Name15="@CH15";$Sound_Play_Name=$Sound_Play_Name15;}
	else if($Play_NowMusic==16){$Sound_Play_Name16="@CH20";$Sound_Play_Name=$Sound_Play_Name16;}
	else if($Play_NowMusic==17){$Sound_Play_Name17="@CH21";$Sound_Play_Name=$Sound_Play_Name17;}
	else if($Play_NowMusic==18){$Sound_Play_Name18="@CH22";$Sound_Play_Name=$Sound_Play_Name18;}
	else if($Play_NowMusic==19){$Sound_Play_Name19="@CH23";$Sound_Play_Name=$Sound_Play_Name19;}
	else if($Play_NowMusic==20){$Sound_Play_Name20="@CH24";$Sound_Play_Name=$Sound_Play_Name20;}
	else if($Play_NowMusic==21){$Sound_Play_Name21="@CH25";$Sound_Play_Name=$Sound_Play_Name21;}
	else if($Play_NowMusic==22){$Sound_Play_Name22="@CH26";$Sound_Play_Name=$Sound_Play_Name22;}
	else if($Play_NowMusic==23){$Sound_Play_Name23="@CH28";$Sound_Play_Name=$Sound_Play_Name23;}
	else if($Play_NowMusic==24){$Sound_Play_Name24="@CH29";$Sound_Play_Name=$Sound_Play_Name24;}
	else if($Play_NowMusic==25){$Sound_Play_Name25="@chn01";$Sound_Play_Name=$Sound_Play_Name25;}
	else if($Play_NowMusic==26){$Sound_Play_Name26="@chn02";$Sound_Play_Name=$Sound_Play_Name26;}
	else if($Play_NowMusic==27){$Sound_Play_Name27="@chn03";$Sound_Play_Name=$Sound_Play_Name27;}
	else if($Play_NowMusic==28){$Sound_Play_Name28="@chn04";$Sound_Play_Name=$Sound_Play_Name28;}
	else if($Play_NowMusic==29){$Sound_Play_Name29="@chn05";$Sound_Play_Name=$Sound_Play_Name29;}
	else if($Play_NowMusic==30){$Sound_Play_Name30="@CH_OP";$Sound_Play_Name=$Sound_Play_Name30;}
	else if($Play_NowMusic==31){$Sound_Play_Name31="@CH_ED_A";$Sound_Play_Name=$Sound_Play_Name31;}
	else if($Play_NowMusic==32){$Sound_Play_Name32="@CH_ED_B";$Sound_Play_Name=$Sound_Play_Name32;}
	else if($Play_NowMusic==33){$Sound_Play_Name33="@CH_ED_C";$Sound_Play_Name=$Sound_Play_Name33;}
	else if($Play_NowMusic==34){$Sound_Play_Name34="@CH_INS_FES_ライヴ";$Sound_Play_Name=$Sound_Play_Name34;}
	else if($Play_NowMusic==35){$Sound_Play_Name35="@CH_INS_FES_あかぺら";$Sound_Play_Name=$Sound_Play_Name35;}
	else if($Play_NowMusic==36){$Sound_Play_Name36="@CH09";$Sound_Play_Name=$Sound_Play_Name36;}
	else if($Play_NowMusic==37){$Sound_Play_Name37="@CHN_ED_nanami";$Sound_Play_Name=$Sound_Play_Name37;}
	else if($Play_NowMusic==38){$Sound_Play_Name38="@CHN_ED_rimi";$Sound_Play_Name=$Sound_Play_Name38;}
	else if($Play_NowMusic==39){$Sound_Play_Name39="@CHN_ED_ayase";$Sound_Play_Name=$Sound_Play_Name39;}
	else if($Play_NowMusic==40){$Sound_Play_Name40="@CHN_ED_kozue";$Sound_Play_Name=$Sound_Play_Name40;}
	else if($Play_NowMusic==41){$Sound_Play_Name41="@CHN_ED_yua";$Sound_Play_Name=$Sound_Play_Name41;}
	else if($Play_NowMusic==42){$Sound_Play_Name42="@CHN_ED_sena";$Sound_Play_Name=$Sound_Play_Name42;}
	else if($Play_NowMusic==43){$Sound_Play_Name43="@CHN_OP";$Sound_Play_Name=$Sound_Play_Name43;}
	else if($Play_NowMusic==44){$Sound_Play_Name44="@CHN_ED_A";$Sound_Play_Name=$Sound_Play_Name44;}
	else if($Play_NowMusic==45){$Sound_Play_Name45="@CHN_INS_PHANTASM";$Sound_Play_Name=$Sound_Play_Name45;}
	else if($Play_NowMusic==46){$Sound_Play_Name46="@CHN_ED_B";$Sound_Play_Name=$Sound_Play_Name46;}
	else if($Play_NowMusic==47){$Sound_Play_Name47="@CH_OP_Instrumental";$Sound_Play_Name=$Sound_Play_Name47;}
	else if($Play_NowMusic==48){$Sound_Play_Name48="@CHN_ED_nanami_inst";$Sound_Play_Name=$Sound_Play_Name48;}
	else if($Play_NowMusic==49){$Sound_Play_Name49="@CHN_ED_rimi_inst";$Sound_Play_Name=$Sound_Play_Name49;}
	else if($Play_NowMusic==50){$Sound_Play_Name50="@CHN_ED_ayase_inst";$Sound_Play_Name=$Sound_Play_Name50;}
	else if($Play_NowMusic==51){$Sound_Play_Name51="@CHN_ED_kozue_inst";$Sound_Play_Name=$Sound_Play_Name51;}
	else if($Play_NowMusic==52){$Sound_Play_Name52="@CHN_ED_yua_inst";$Sound_Play_Name=$Sound_Play_Name52;}
	else if($Play_NowMusic==53){$Sound_Play_Name53="@CHN_ED_sena_inst";$Sound_Play_Name=$Sound_Play_Name53;}
	else{return;}


}

..//PlaySound_Process
function PlaySound_Process(){

	while(1){

		$Rep_J = $Rep_J-2000;
		Wait($Rep_J);
..//リピート判定

		if($Repeat_Music==true){
			Wait(1000);

			SetVolume360($slSongName_J,1000,0,null);
			$Play_NowMusic++;

		if($Play_NowMusic==30){if($SoundLoop_off_01 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==31){if($SoundLoop_off_02 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==32){if($SoundLoop_off_03 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==33){if($SoundLoop_off_04 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==37){if($SoundLoop_off_05 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==38){if($SoundLoop_off_06 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==39){if($SoundLoop_off_07 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==40){if($SoundLoop_off_08 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==41){if($SoundLoop_off_09 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==42){if($SoundLoop_off_10 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==43){if($SoundLoop_off_11 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==44){if($SoundLoop_off_12 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==45){if($SoundLoop_off_13 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==46){if($SoundLoop_off_14 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==47){if($SoundLoop_off_15 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==48){if($SoundLoop_off_16 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==49){if($SoundLoop_off_17 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==50){if($SoundLoop_off_18 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==51){if($SoundLoop_off_19 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==52){if($SoundLoop_off_20 == true){$Play_NowMusic++;}else{}}
		if($Play_NowMusic==53){if($SoundLoop_off_21 == true){$Play_NowMusic++;}else{}}

			if($Play_NowMusic >=53){
				$Play_NowMusic=1;
				$iconNatC = "@WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("@WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Sound_Play_now1=true;
			}else{
				$iconNatC = "@WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("@WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Fade($iconNatC, 100,1000,null,true);
				Play_Sound_GO();
				Sound_Play_Name_before();
				$Sound_Play_now1=true;
			}

		}else if($One_Repeat_Music==true){
..//カウントなし
				if($Rep_J > 0){
				Move("@SoundTimebar",$Rep_J,471,@0,null,false);
				}
				Wait($Rep_J);
				$iconNatC = "@WindowNAME/NUMBER/icon_" + $Play_NowMusic;
				Fade("@WindowNAME/NUMBER/icon_*", 0,0,null,true);
				Move("@SoundTimebar",0,270,@0,null,true);
		}else{

			if($SPSOn==true){
					if($Rep_J > 0){
					Move("@SoundTimebar",$Rep_J,471,@0,null,false);
					}
						Wait(1000);

						Move("@SoundTimebar",0,270,@0,null,true);
						SetVolume360($slSongName_J,1000,0,null);
						$SPSOn=false;

						$iconNatC = "@WindowNAME/NUMBER/icon_" + $Play_NowMusic;
						Fade("@WindowNAME/NUMBER/icon_*", 0,0,null,true);

						CreateChoice("Play");
						CreateTexture("Play_def",1000,180,82,"@Play01");
						CreateTexture("Play/MouseUsual/img",1000,180,82,"@Play01");
						CreateTexture("Play/MouseOver/img",1000,180,82,"@Play02");
						CreateTexture("Play/MouseClick/img",1000,180,82,"@Play03");
						SetAlias("Play_def","Play_def");
						SetAlias("Play/MouseUsual/img","Play/MouseUsual/img");
						SetAlias("Play/MouseOver/img","Play/Play/MouseOver/img");
						SetAlias("Play/MouseClick/img","Play/MouseClick/img");
						Fade("Play/MouseUsual/img",0,0,null,true);
						Fade("Play/MouseOver/img",0,0,null,true);
						Fade("Play/MouseClick/img",0,0,null,true);


//					$Play_now = false;
//					$Play_Count=1;
//					おがみ：チェック
//					Request($slSongName_J, UnLock);
//					Request($slSongName_J, Disused);
//					$Sound_Play_Name=$slSongName_J;
			}else{
					Move("@SoundTimebar",0,270,@0,null,true);
			}
		}
	}

}


..//TextScroll_Process
function TextScroll_Process()
{

		$MTextRollSpeed=18400;

		Move("@Bokenas001", $MTextRollSpeed, 0, @0, null, false);

	while(1){
		Position("@Bokenas001", $Bx1, $By1);
		Position("@Bokenas002", $Bx2, $By2);

		if($Bx1 <= 340 && $YMusicFlag2==0)
		{
			Move("@Bokenas002", $MTextRollSpeed, 0, @0, null, false);
			$YMusicFlag2=1;
		}

		if($Bx1 <= 20)
		{
			Move("@Bokenas001", 0, 520, @0, null, false);
			$YMusicFlag1=0;
		}

		if($Bx2 <= 345 && $YMusicFlag1==0)
		{
			Move("@Bokenas001", $MTextRollSpeed, 0, @0, null, false);
			$YMusicFlag1=1;
		}

		if($Bx2 <= 20)
		{
			Move("@Bokenas002", 0, 520, @0, null, false);
			$YMusicFlag2=0;
		}

		Wait(100);
	}

}

..//procAutoSelect
function procAutoSelect()
{
	while(1){
		WaitPlay($Sound_Play_Name,true);
		$tm=DurationTime($Sound_Play_Name)-500;
		Move("@SoundTimebar",$tm,473,@0,null,false);
//		CreateText("テキスト１", 20000, 0, 20, 700, 500, $tm);
		Wait(32);

	}

}

..//Rep_Select
function Rep_Select(){

	if($Rep_Loop==1){
		$Repeat_Music=true;
		$One_Repeat_Music=false;
	}else if($Rep_Loop==2){
		$One_Repeat_Music=true;
		$Repeat_Music=false;
	}else if($Rep_Loop>=3){
		$Rep_Loop=0;$One_Repeat_Music=false;
		$Repeat_Music=false;
	}

			if($Repeat_Music==true){
	CreateChoice("Rep");
				CreateTexture("Rep_def",1000,122,84,Repeat_All01);
				CreateTexture("Rep/MouseUsual/img",1000,122,84,Repeat_All01);
				CreateTexture("Rep/MouseOver/img",1000,122,84,Repeat_All02);
				CreateTexture("Rep/MouseClick/img",1000,122,84,Repeat_All03);
			}else if($One_Repeat_Music==true){
	CreateChoice("Rep");
				CreateTexture("Rep_def",1000,122,84,Repeat_One01);
				CreateTexture("Rep/MouseUsual/img",1000,122,84,Repeat_One01);
				CreateTexture("Rep/MouseOver/img",1000,122,84,Repeat_One02);
				CreateTexture("Rep/MouseClick/img",1000,122,84,Repeat_One03);
			}else{
	CreateChoice("Rep");
				CreateTexture("Rep_def",1000,122,84,Repeat_None01);
				CreateTexture("Rep/MouseUsual/img",1000,122,84,Repeat_None01);
				CreateTexture("Rep/MouseOver/img",1000,122,84,Repeat_None02);
				CreateTexture("Rep/MouseClick/img",1000,122,84,Repeat_None03);
			}

}

..//Play_Select
function Play_Select(){

	if($Play_Count==1){
		$Play_now = false;

	}else if($Play_Count>=2){
		$Play_Count = 0;
		$Play_now = true;

		//一時停止対策
		$Once_Loop = 0;

	}else{
		$Play_now = false;

	}

	if($Play_now){
		CreateChoice("Play");
		CreateTexture("Play_def",1000,180,82,"Stop01");
		CreateTexture("Play/MouseUsual/img",1000,180,82,"Stop01");
		CreateTexture("Play/MouseOver/img",1000,180,82,"Stop02");
		CreateTexture("Play/MouseClick/img",1000,180,82,"Stop03");
		SetAlias("Play_def","Play_def");
		SetAlias("Play/MouseUsual/img","Play/MouseUsual/img");
		SetAlias("Play/MouseOver/img","Play/MouseOver/img");
		SetAlias("Play/MouseClick/img","Play/MouseClick/img");
		Fade("Play/MouseUsual/img",0,0,null,true);
		Fade("Play/MouseOver/img",0,0,null,true);
		Fade("Play/MouseClick/img",0,1000,null,true);
		Wait(100);
		Fade("Play/MouseClick/img",200,0,null,true);
	}else{
		CreateChoice("Play");
		CreateTexture("Play_def",1000,180,82,"Play01");
		CreateTexture("Play/MouseUsual/img",1000,180,82,"Play01");
		CreateTexture("Play/MouseOver/img",1000,180,82,"Play02");
		CreateTexture("Play/MouseClick/img",1000,180,82,"Play03");
		SetAlias("Play_def","Play_def");
		SetAlias("Play/MouseUsual/img","Play/MouseUsual/img");
		SetAlias("Play/MouseOver/img","Play/Play/MouseOver/img");
		SetAlias("Play/MouseClick/img","Play/MouseClick/img");
		Fade("Play/MouseUsual/img",0,0,null,true);
		Fade("Play/MouseOver/img",0,0,null,true);
		Fade("Play/MouseClick/img",0,0,null,true);
	}

}

//おがみ：一時停止？
..//Sound_Once
function Sound_Once(){

	if($Once_Loop==1){
		Request("PSP",Stop);
		Move("@SoundTimebar",0,270,@0,null,true);
		Request($Sound_Play_Name, Pause);
	}else if($Once_Loop>=2){
		$Once_Loop = 0;
		Request("PSP",Start);
		Request($Sound_Play_Name, Resume);
	}

}

..//MusicMoveStart
function MusicMoveStart()
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	CursorPosition($MusicoldX,$MusicoldY);
	$AABBCCold = ImageVertical("@WindowNAME/NUMBER/Name_1");

	if($MusicCsrX>=117 && $MusicCsrX<=144 && $MusicCsrY>=107 && $MusicCsrY<=135){
	//▽Stop
		if($SYSTEM_XBOX360_button_up_down){

			if($MusicTop==53){
				;//53
			}else{
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img", 0, 0, null, false);
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img*", 0, 0, null, false);
				Move("@WindowNAME/NUMBER*", 0, @0, @-1100, null, false);
				Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @-1100, null, false);
				Move("@WindowNAME/NUMBER/*/*", 0, @0, @-1100, null, false);
				$MusicTop=53;
				;//53
			}

		}else if($SYSTEM_XBOX360_button_left_down){

			if($MusicTop==53){
				;//53
			}else{
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img", 0, 0, null, false);
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img*", 0, 0, null, false);
				Move("@WindowNAME/NUMBER*", 0, @0, @-1100, null, false);
				Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @-1100, null, false);
				Move("@WindowNAME/NUMBER/*/*", 0, @0, @-1100, null, false);
				;//53
				$MusicTop=53;
				$MMGOTO053=true;
			}

		}else if($SYSTEM_XBOX360_button_right_down){
			;//re
		}else if($SYSTEM_XBOX360_button_down_down){
			;//re
		}
	}else if($MusicCsrX>=155&&$MusicCsrX<=181&&$MusicCsrY>=108&&$MusicCsrY<=134){
	//▽repeat
		if($SYSTEM_XBOX360_button_up_down){
			;//stop
		}else if($SYSTEM_XBOX360_button_left_down){
			;//stop
		}else if($SYSTEM_XBOX360_button_right_down){
			;//next
		}else if($SYSTEM_XBOX360_button_down_down){
			;//next
		}
	}else if($MusicCsrX>=195&&$MusicCsrX<=217&&$MusicCsrY>=108&&$MusicCsrY<=134){
	//▽next
		if($SYSTEM_XBOX360_button_up_down){
			;//repeat
		}else if($SYSTEM_XBOX360_button_left_down){
			;//repeat
		}else if($SYSTEM_XBOX360_button_right_down){
			;//play
		}else if($SYSTEM_XBOX360_button_down_down){
			;//play
		}
	}else if($MusicCsrX>=228&&$MusicCsrX<=260&&$MusicCsrY>=108&&$MusicCsrY<=134){
	//▽play
		if($SYSTEM_XBOX360_button_up_down){
			;//next
		}else if($SYSTEM_XBOX360_button_left_down){
			;//next
		}else if($SYSTEM_XBOX360_button_right_down){
			;//return
		}else if($SYSTEM_XBOX360_button_down_down){
			;//return
		}
	}else if($MusicCsrX>=272&&$MusicCsrX<=296&&$MusicCsrY>=108&&$MusicCsrY<=134){
	//▽return
		if($SYSTEM_XBOX360_button_up_down){
			;//play
		}else if($SYSTEM_XBOX360_button_left_down){
			;//play
		}else if($SYSTEM_XBOX360_button_right_down){

			if($MusicTop==53){
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img", 0, 0, null, false);
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img*", 0, 0, null, false);
				Move("@WindowNAME/NUMBER*", 0, @0, @+1100, null, false);
				Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @+1100, null, false);
				Move("@WindowNAME/NUMBER/*/*", 0, @0, @+1100, null, false);
				;//53
				$MusicTop=0;
//おがみ：ここのフラグ101で合ってるのかな？
//				$MMGOTO001=true;
				$MMGOTO101=true;
			}else{
				;//No.1
			}

		}else if($SYSTEM_XBOX360_button_down_down){

			if($MusicTop==53){
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img", 0, 0, null, false);
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img*", 0, 0, null, false);
				Move("@WindowNAME/NUMBER*", 0, @0, @+1100, null, false);
				Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @+1100, null, false);
				Move("@WindowNAME/NUMBER/*/*", 0, @0, @+1100, null, false);
				;//53
				$MusicTop=0;
//おがみ：ここのフラグ101で合ってるのかな？
//				$MMGOTO001=true;
				$MMGOTO101=true;
			}else{
			;//No.1
			}

		}
	}else if($MusicCsrX>=458 && $MusicCsrX<=478 && $MusicCsrY>=230 && $MusicCsrY<=261){
	//▽No.01
		if($SYSTEM_XBOX360_button_up_down){
			if($MusicTop==1){
				;//Stop
			}else{
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img", 0, 0, null, false);
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img*", 0, 0, null, false);
				Move("@WindowNAME/NUMBER*", 0, @0, @+25, null, false);
				Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @+25, null, false);
				Move("@WindowNAME/NUMBER/*/*", 0, @0, @+25, null, true);
				$MMGOTO001=true;
			}

		}else if($SYSTEM_XBOX360_button_left_down){
			if($MusicTop==1){
				;//Stop

			}else{
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img", 0, 0, null, false);
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img*", 0, 0, null, false);

				Move("@WindowNAME/NUMBER*", 0, @0, @+25, null, false);
				Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @+25, null, false);
				Move("@WindowNAME/NUMBER/*/*", 0, @0, @+25, null, true);
				$MMGOTO001=true;
			}

		}else if($SYSTEM_XBOX360_button_right_down){
			;//No.02
		}else if($SYSTEM_XBOX360_button_down_down){
			;//No.02
		}
	}else if($MusicCsrX>=448 && $MusicCsrX<=488 && $MusicCsrY>=263 && $MusicCsrY<=294){
	//▽No.02
		if($SYSTEM_XBOX360_button_up_down){
			;//No.01
		}else if($SYSTEM_XBOX360_button_left_down){
			;//No.01
		}else if($SYSTEM_XBOX360_button_right_down){
			;//No.03
		}else if($SYSTEM_XBOX360_button_down_down){
			;//No.03
		}
	}else if($MusicCsrX>=458&&$MusicCsrX<=478&&$MusicCsrY>=296&&$MusicCsrY<=327){
	//▽No.03
		if($SYSTEM_XBOX360_button_up_down){
			;//No.02
		}else if($SYSTEM_XBOX360_button_left_down){
			;//No.02
		}else if($SYSTEM_XBOX360_button_right_down){
			;//No.04
		}else if($SYSTEM_XBOX360_button_down_down){
			;//No.04
		}
	}else if($MusicCsrX>=458&&$MusicCsrX<=478&&$MusicCsrY>=329&&$MusicCsrY<=350){
	//▽No.04
		if($SYSTEM_XBOX360_button_up_down){
			;//No.03
		}else if($SYSTEM_XBOX360_button_left_down){
			;//No.03
		}else if($SYSTEM_XBOX360_button_right_down){
			;//No.05
		}else if($SYSTEM_XBOX360_button_down_down){
			;//No.05
		}
		Wait(10);
	}else if($MusicCsrX>=458&&$MusicCsrX<=478&&$MusicCsrY>=352&&$MusicCsrY<=383){
	//▽No.05
		if($SYSTEM_XBOX360_button_up_down){
			;//No.04
		}else if($SYSTEM_XBOX360_button_left_down){
			;//No.04
		}else if($SYSTEM_XBOX360_button_right_down){
			;//No.06
		}else if($SYSTEM_XBOX360_button_down_down){
			;//No.06
		}
	}else if($MusicCsrX>=458&&$MusicCsrX<=478&&$MusicCsrY>=385&&$MusicCsrY<=416){
	//▽No.06
		if($SYSTEM_XBOX360_button_up_down){
			;//No.05
		}else if($SYSTEM_XBOX360_button_left_down){
			;//No.05
		}else if($SYSTEM_XBOX360_button_right_down){
			;//No.07
		}else if($SYSTEM_XBOX360_button_down_down){
			;//No.07
		}
	}else if($MusicCsrX>=458&&$MusicCsrX<=478&&$MusicCsrY>=418&&$MusicCsrY<=449){
	//▽No.07
		if($SYSTEM_XBOX360_button_up_down){
			;//No.06
		}else if($SYSTEM_XBOX360_button_left_down){
			;//No.06
		}else if($SYSTEM_XBOX360_button_right_down){
			;//No.08
		}else if($SYSTEM_XBOX360_button_down_down){
			;//No.08
		}
	}else if($MusicCsrX>=458&&$MusicCsrX<=478&&$MusicCsrY>=451&&$MusicCsrY<=482){
	//▽No.08
		if($SYSTEM_XBOX360_button_up_down){
			;//No.07
		}else if($SYSTEM_XBOX360_button_left_down){
			;//No.07
		}else if($SYSTEM_XBOX360_button_right_down){
			;//No.09
		}else if($SYSTEM_XBOX360_button_down_down){
			;//No.09
		}
	}else if($MusicCsrX>=458&&$MusicCsrX<=478&&$MusicCsrY>=484&&$MusicCsrY<=516){
	//▽No.09
		if($SYSTEM_XBOX360_button_up_down){
			;//No.08
		}else if($SYSTEM_XBOX360_button_left_down){
			;//No.08
		}else if($SYSTEM_XBOX360_button_right_down){
			;//No.10
		}else if($SYSTEM_XBOX360_button_down_down){
			;//No.10
		}
	}else if($MusicCsrX>=458&&$MusicCsrX<=478&&$MusicCsrY>=518&&$MusicCsrY<=547){
	//▽No.09
		if($SYSTEM_XBOX360_button_up_down){
			;//No.08
		}else if($SYSTEM_XBOX360_button_left_down){
			;//No.08
		}else if($SYSTEM_XBOX360_button_right_down){
			if($MusicTop==53){

//おがみ：変数入力
//				$MusicTop=0;
//				$MMGOTO101=true;
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img", 0, 0, null, false);
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img*", 0, 0, null, false);
				Move("@WindowNAME/NUMBER*", 0, @0, @1100, null, false);
				Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @1100, null, false);
				Move("@WindowNAME/NUMBER/*/*", 0, @0, @1100, null, false);
				$MusicTop=0;
				$MMGOTO101=true;
				;//Stop

			}else{
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img", 0, 0, null, false);
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img*", 0, 0, null, false);
				Move("@WindowNAME/NUMBER*", 0, @0, @-25, null, false);
				Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @-25, null, false);
				Move("@WindowNAME/NUMBER/*/*", 0, @0, @-25, null, false);
				;
				$MMGOTO=true;
			}
		}else if($SYSTEM_XBOX360_button_down_down){
			if($MusicTop==53){
				;//Stop

//おがみ：変数入力
//				$MusicTop=0;
//				$MMGOTO101=true;
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img", 0, 0, null, false);
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img*", 0, 0, null, false);
				Move("@WindowNAME/NUMBER*", 0, @0, @1100, null, false);
				Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @1100, null, false);
				Move("@WindowNAME/NUMBER/*/*", 0, @0, @1100, null, false);
				$MusicTop=0;
				$MMGOTO101=true;
				;//Stop

			}else{
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img", 0, 0, null, false);
				Fade("@WindowNAME/NUMBER/Choice_*/MouseOver/img*", 0, 0, null, false);
				Move("@WindowNAME/NUMBER*", 0, @0, @-25, null, false);
				Move("@WindowNAME/NUMBER/Choice_*/*/*", 0, @0, @-25, null, false);
				Move("@WindowNAME/NUMBER/*/*", 0, @0, @-25, null, false);
				;
				$MMGOTO=true;
			}
		}
	}

	//★★★★アンロック
	XBOX360_LockVideo(false);

	CursorPosition($MusicCsrX,$MusicCsrY);
	$AABBCCnew = ImageVertical("@WindowNAME/NUMBER/Name_1");

	if($MusicoldX==283){
		if($MusicCsrY==$MRM1){$MusicTop++;}
	}else if($MusicoldY==$MRM1){
		if($MusicCsrY==120){$MusicTop--;
		}else if($MusicCsrY==$MRM1){
			if($MMGOTO001==true){$MusicTop--;$MMGOTO001=false;}
		}else if($MusicCsrY==$MRM2){
			$MusicTop++;
		}
	}else if($MusicoldY==$MRM2){
		if($MusicCsrY==$MRM1){$MusicTop--;}
		else if($MusicCsrY==$MRM3){$MusicTop++;}
	}else if($MusicoldY==$MRM3){
		if($MusicCsrY==$MRM2){$MusicTop--;}
		else if($MusicCsrY==$MRM4){$MusicTop++;}
	}else if($MusicoldY==$MRM4){
		if($MusicCsrY==$MRM3){$MusicTop--;}
		else if($MusicCsrY==$MRM5){$MusicTop++;}
	}else if($MusicoldY==$MRM5){
		if($MusicCsrY==$MRM4){$MusicTop--;}
		else if($MusicCsrY==$MRM6){$MusicTop++;}
	}else if($MusicoldY==$MRM6){
		if($MusicCsrY==$MRM5){$MusicTop--;}
		else if($MusicCsrY==$MRM7){$MusicTop++;}
	}else if($MusicoldY==$MRM7){
		if($MusicCsrY==$MRM6){$MusicTop--;}
		else if($MusicCsrY==$MRM8){$MusicTop++;}
	}else if($MusicoldY==$MRM8){
		if($MusicCsrY==$MRM7){$MusicTop--;}
		else if($MusicCsrY==$MRM9){$MusicTop++;}
	}else if($MusicoldY==$MRM9){
		if($MusicCsrY==$MRM8){$MusicTop--;}
		else if($MusicCsrY==$MRM10){$MusicTop++;}
	}else if($MusicoldY==$MRM10){
		if($MusicCsrY==$MRM9){$MusicTop--;
		}else if($MusicCsrY==$MRM10){
			if($MMGOTO==true){$MusicTop++;$MMGOTO=false;}else{}
		}
	}else if($MusicoldX==131){
		if($MusicCsrY==$MRM10){
				$MusicTop=53;
		}
	}

//	Wait(10);

//	CreateText("Dt1", 15000, 50, 20, 700, 500, $MusicTop);

/*
	if($MusicCsrX>=458&&$MusicCsrX<=478&&$MusicCsrY>=230&&$MusicCsrY<=261){
		MusicBackStart();
		Wait(50);
		while($SYSTEM_XBOX360_button_up_down||$SYSTEM_XBOX360_button_left_down){
			if($MusicTop==1){break;}
			MusicBackStart2();
			Wait(50);
		}
		;//1
	}else if($MusicCsrX>=458&&$MusicCsrX<=478&&$MusicCsrY>=484&&$MusicCsrY<=516){
		MusicNextStart();
		Wait(50);
		while($SYSTEM_XBOX360_button_down_down||$SYSTEM_XBOX360_button_right_down){
			if($MusicBottom==53){break;}
			MusicNextStart2();
			Wait(50);
		}

		if($MusicBottom==25&&($SYSTEM_XBOX360_button_down_down||$SYSTEM_XBOX360_button_right_down)){
			Fade("カルテオーバー", 0, 0, null, true);
			;//OK
		}else{
			;//7
		}
	}
*/


}


..//MusicNextStart
function MusicNextStart()
{
	$MMMove=100;

//	;//No.09
	Move("WindowNAME/NUMBER*", $MMMove, @0, @-25, null, false);
	Move("WindowNAME/NUMBER*/*/*", $MMMove, @0, @-25, null, true);
//	;//No.09

	$MusicTop++;
	$MusicBottom++;
}

..//MusicBackStart
function MusicBackStart()
{
	$MusicMove=100;

//	;//No.01

	Move("WindowNAME/NUMBER*", $MusicMove, @0, @+25, null, false);
	Move("WindowNAME/NUMBER*/*/*", $MusicMove, @0, @+25, null, true);

//	;//No.01

//	$SYSTEM_XBOX360_button_left_down=false;$SYSTEM_XBOX360_button_right_down=false;
//	$SYSTEM_XBOX360_button_up_down=false;$SYSTEM_XBOX360_button_down_down=false;

	$MusicTop--;
	$MusicBottom--;
}

..//MusicNextStart2
function MusicNextStart2()
{
	$MusicMove=100;

	//★★★★ロック
	XBOX360_LockVideo(true);

	Move("WindowNAME/NUMBER*", 100, @0, @-25, null, false);
	Move("WindowNAME/NUMBER*/*/*", 100, @0, @-25, null, false);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	$MusicTop++;
	$MusicBottom++;
}

..//MusicBackStart2
function MusicBackStart2()
{
	$MusicMove=0;

	//★★★★ロック
	XBOX360_LockVideo(true);

	Move("WindowNAME/NUMBER*", 100, @0, @+25, null, false);
	Move("WindowNAME/NUMBER*/*/*", 100, @0, @+25, null, false);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	$MusicTop--;
	$MusicBottom--;
}




