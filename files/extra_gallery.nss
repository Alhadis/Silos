#include "nss/function.nss";
#include "nss/function_system.nss";


//おがみ：変数変更「$page」→「$CGLIB_page」
//=============================================================================//
//■EXTRA [CG Gallery]■
//=============================================================================//
chapter main
{

	call_scene @->extra_gallery_main;

}



scene extra_gallery_main
{
//フォーカス確認用
	$SYSTEM_backlog_lock = true;
	$SYSTEM_menu_lock = true;
//	DebAll();


	//★★★★ロック
	XBOX360_LockVideo(true);

	CreateColor("BLK",1400,Center,Middle,1280,720,BLACK);
	SetAlias("BLK","BLK");

	Fade("BLK",0,1000,null,false);


	CreateTexture("BAK",1100,center,middle,"cg/extra/gallery/CGライブラリ背景.png");

	CreateTexture("BAKup",1101,center,InTop,"cg/extra/gallery/CGライブラリ帯上.png");
	CreateTexture("BAKdown",1102,center,InBottom,"cg/extra/gallery/CGライブラリ帯下.png");
	Fade("BAKup", 0, 0, null, true);
	Fade("BAKdown", 0, 0, null, true);
	Move("BAKup", 0, @0, @-56, null, true);
	Move("BAKdown", 0, @0, @+112, null, true);

//pageCount1
	CreateTexture("pageNumber01", 1110, 390, 482, "cg/extra/gallery/カウント-001.png");
	CreateTexture("pageNumber02", 1110, 390, 482, "cg/extra/gallery/カウント-002.png");
	CreateTexture("pageNumber03", 1110, 390, 482, "cg/extra/gallery/カウント-003.png");
	CreateTexture("pageNumber04", 1110, 390, 482, "cg/extra/gallery/カウント-004.png");
	CreateTexture("pageNumber05", 1110, 390, 482, "cg/extra/gallery/カウント-005.png");
	CreateTexture("pageNumber06", 1110, 390, 482, "cg/extra/gallery/カウント-006.png");
	CreateTexture("pageNumber07", 1110, 390, 482, "cg/extra/gallery/カウント-007.png");
	CreateTexture("pageNumber08", 1110, 390, 482, "cg/extra/gallery/カウント-008.png");
	CreateTexture("pageNumber09", 1110, 390, 482, "cg/extra/gallery/カウント-009.png");
	CreateTexture("pageNumber10", 1110, 390, 482, "cg/extra/gallery/カウント-010.png");
	SetAlias("pageNumber01","pageNumber01");
	SetAlias("pageNumber02","pageNumber02");
	SetAlias("pageNumber03","pageNumber03");
	SetAlias("pageNumber04","pageNumber04");
	SetAlias("pageNumber05","pageNumber05");
	SetAlias("pageNumber06","pageNumber06");
	SetAlias("pageNumber07","pageNumber07");
	SetAlias("pageNumber08","pageNumber08");
	SetAlias("pageNumber09","pageNumber09");
	SetAlias("pageNumber10","pageNumber10");

	Fade("pageNumber*", 0, 0, null, false);

	$SetPointBackX = 795;
	$SetPointNextX = 883;
	$SetPointdataAX = 546;
	$SetPointdataBX = 670;

	$SetPointY = 482;

	CreateChoice("BACK");
	CreateTexture("Def_BACK",1200,$SetPointBackX,$SetPointY,"cg/extra/gallery/back-001.png");
	CreateTexture("BACK/MouseUsual/img",1200,$SetPointBackX,$SetPointY,"cg/extra/gallery/usal-001.png");
	CreateTexture("BACK/MouseOver/img",1200,$SetPointBackX,$SetPointY,"cg/extra/gallery/back-002.png");
	CreateTexture("BACK/MouseClick/img",1200,$SetPointBackX,$SetPointY,"cg/extra/gallery/back-003.png");
	SetAlias("BACK","BACK");
	Request("BACK/MouseUsual/img", Erase);
	SetAlias("Def_BACK","Def_BACK");
	Fade("Def_BACK", 0, 0, null, true);

	CreateChoice("NEXT");
	CreateTexture("Def_NEXT",1200,$SetPointNextX,$SetPointY,"cg/extra/gallery/NEXT-001.png");
	CreateTexture("NEXT/MouseUsual/img",1200,$SetPointNextX,$SetPointY,"cg/extra/gallery/usal-001.png");
	CreateTexture("NEXT/MouseOver/img",1200,$SetPointNextX,$SetPointY,"cg/extra/gallery/NEXT-002.png");
	CreateTexture("NEXT/MouseClick/img",1200,$SetPointNextX,$SetPointY,"cg/extra/gallery/NEXT-003.png");
	SetAlias("NEXT","NEXT");
	Request("NEXT/MouseUsual/img", Erase);
	SetAlias("Def_NEXT","Def_NEXT");
	Fade("Def_NEXT", 0, 0, null, true);

	CreateChoice("DATA_A");
	CreateTexture("Def_DATA_A",1200,$SetPointdataAX,$SetPointY,"cg/extra/gallery/data-A-001.png");
	CreateTexture("DATA_A/MouseUsual/img",1200,$SetPointdataAX,$SetPointY,"cg/extra/gallery/usal-001.png");
	CreateTexture("DATA_A/MouseOver/img",1200,$SetPointdataAX,$SetPointY,"cg/extra/gallery/data-A-002.png");
	CreateTexture("DATA_A/MouseClick/img",1200,$SetPointdataAX,$SetPointY,"cg/extra/gallery/data-A-003.png");
	CreateTexture("DATA_A_icon",1200,$SetPointdataAX,$SetPointY,"cg/extra/gallery/data-A-003.png");

	Request("DATA_A/MouseUsual/img", Erase);
	SetAlias("DATA_A","DATA_A");
	Fade("Def_DATA_A", 0, 0, null, true);

	CreateChoice("DATA_B");
	CreateTexture("Def_DATA_B",1200,$SetPointdataBX,$SetPointY,"cg/extra/gallery/data-B-001.png");
	CreateTexture("DATA_B/MouseUsual/img",1200,$SetPointdataBX,$SetPointY,"cg/extra/gallery/usal-001.png");
	CreateTexture("DATA_B/MouseOver/img",1200,$SetPointdataBX,$SetPointY,"cg/extra/gallery/data-B-002.png");
	CreateTexture("DATA_B/MouseClick/img",1200,$SetPointdataBX,$SetPointY,"cg/extra/gallery/data-B-003.png");
	CreateTexture("DATA_B_icon",1200,$SetPointdataBX,$SetPointY,"cg/extra/gallery/data-B-003.png");

	Request("DATA_B/MouseUsual/img", Erase);
	SetAlias("DATA_B","DATA_B");
	Fade("Def_DATA_B", 0, 0, null, true);

	//■定義「ボタン説明」
	DialogButtonON("Button_CG");

..//前定義（デバッグ用）
//	DebAll();


..//初期設定ページ（一番最初に開くページ）
	if(!$chara){$chara=1;}
	if(!$CGLIB_page){$CGLIB_page=1;}

	cg_init($chara,$CGLIB_page);

	Fade("pageNumber*", 0, 0, null, false);
	Fade("BACK/MouseUsual/*",0,0,null,false);
	Fade("BACK/MouseOver/*",0,0,null,false);
	Fade("BACK/MouseClick/*",0,0,null,false);
	Fade("NEXT/MouseUsual/*",0,0,null,false);
	Fade("NEXT/MouseOver/*",0,0,null,false);
	Fade("NEXT/MouseClick/*",0,0,null,false);
	Fade("DATA_A/*/*",0,0,null,false);
	Fade("DATA_B/*/*",0,0,null,false);
	Fade("*/*/*",0,0,null,false);
	Fade("DATA_*",0,0,null,false);

..//この時点で$chara = $CGLIB_page = 1;

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Fade("BAKup", 1500, 1000, null, false);
	Fade("BAKdown", 1500, 1000, null, false);
	Move("BAKup", 600, @0, @+56, null, false);
	Move("BAKdown", 600, @0, @-112, null, false);
	Fade("BLK",500,0,null,false);
		Fade("@エキストラスクリーン",500,0,null,false);
		Request("@エキストラスクリーン", Disused);
	WaitAction("BLK",null);

	//▲描画「ボタン説明」
	DialogButtonFade("Button_CG");

	Wait(300);

	if($p==1){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber01",300,1000,null,false);}
	else if($p==2){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber02",300,1000,null,false);}
	else if($p==3){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber03",300,1000,null,false);}
	else if($p==4){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber04",300,1000,null,false);}
	else if($p==5){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber05",300,1000,null,false);}
	else if($p==6){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber06",300,1000,null,false);}
	else if($p==7){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber07",300,1000,null,false);}
	else if($p==8){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber08",300,1000,null,false);}
	else if($p==9){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber09",300,1000,null,false);}
	else if($p==10){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber10",300,1000,null,false);}

//	Fade("pageNumber01", 300, 1000, null, false);

..//さいしょにはＥＶから入るように設定
	if($chara==1){Fade("DATA_A_icon",300,1000,null,false);}
	else{Fade("DATA_B_icon",300,1000,null,false);}

	Fade("Def_*",300,1000,null,false);
	Fade("*/MouseUsual/*",300,1000,null,false);

	$nextcg=0;
	MoveCursor(132,94);
	while(1){
		$SYSTEM_r_button_down=false;
		$SYSTEM_XBOX360_button_b_down=false;
		$SYSTEM_XBOX360_button_rb_down=false;
		$SYSTEM_XBOX360_button_lb_down=false;
		$SYSTEM_XBOX360_button_y_down=false;
		if(!$nextcg){
		select{
			if($SYSTEM_XBOX360_button_rb_down){
				$CGMODE_act=4;
				$CGLIB_page++;
				if(($chara==1&&$CGLIB_page>7)||($chara==2&&$CGLIB_page>4)){$CGLIB_page=1;}
				cg_init($chara,$CGLIB_page);
				MoveCursor(926,487);
			}
			if($SYSTEM_XBOX360_button_lb_down){
				$CGMODE_act=3;
				$CGLIB_page--;
				if($CGLIB_page<=0){if($chara==1){$CGLIB_page=7;}else{$CGLIB_page=4;}}
				cg_init($chara,$CGLIB_page);
				MoveCursor(832,487);
			}
			if($SYSTEM_XBOX360_button_y_down){
				if($chara!=1){
					$CGMODE_act=1;
					$chara=1;
					$CGLIB_page=1;
					Fade("DATA_B_icon",0,0,null,false);
					Fade("DATA_A_icon",0,1000,null,true);
					cg_init($chara,$CGLIB_page);
					Fade("@CG_*/MouseClick/img", 0, 0, null, true);
					Fade("@CG_*/MouseOver/img", 0, 0, null, true);
					MoveCursor(164,118);
				}else if($chara==1){
					$CGMODE_act=2;
					$chara=2;
					$CGLIB_page=1;
					Fade("DATA_A_icon",0,0,null,false);
					Fade("DATA_B_icon",0,1000,null,true);
					cg_init($chara,$CGLIB_page);
					Fade("@CG_*/MouseClick/img", 0, 0, null, true);
					Fade("@CG_*/MouseOver/img", 0, 0, null, true);
					MoveCursor(164,118);
				}
			}
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){
				Request("BLK", Lock);
				Fade("BLK",300,1000,null,false);
					//▲描画「ボタン説明」
					DialogButtonOFF("Button_CG");
				WaitAction("BLK",null);
				Delete("*");
				Request("BLK", UnLock);
				$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
				return;
			}
			case DATA_A{
				if($chara!=1){$CGMODE_act=1;$chara=1;$CGLIB_page=1;
					Fade("DATA_B_icon",0,0,null,false);
					Fade("DATA_A_icon",0,1000,null,false);
					cg_init($chara,$CGLIB_page);
					MoveCursor(592,488);
				}
			}case DATA_B{
..//背景判定フラグchara=$2
				if($chara!=2){
					$CGMODE_act=2;
					$chara=2;
					$CGLIB_page=1;
					Fade("DATA_A_icon",0,0,null,false);
					Fade("DATA_B_icon",0,1000,null,false);
					cg_init($chara,$CGLIB_page);
					MoveCursor(712,488);
				}
			}case BACK{
				$CGMODE_act=3;
				$CGLIB_page--;
					if($CGLIB_page<=0){
						if($chara==1){
							$CGLIB_page=7;
						}else{$CGLIB_page=4;}
					}
				cg_init($chara,$CGLIB_page);
				MoveCursor(832,488);
			}case NEXT{
				$CGMODE_act=4;
				$CGLIB_page++;
					if(($chara==1&&$CGLIB_page>7)||($chara==2&&$CGLIB_page>4)){$CGLIB_page=1;}
				cg_init($chara,$CGLIB_page);
				MoveCursor(926,488);
			}
			case CG_1{show_pic(1);}
			case CG_2{show_pic(2);}
			case CG_3{show_pic(3);}
			case CG_4{show_pic(4);}
			case CG_5{show_pic(5);}
			case CG_6{show_pic(6);}
			case CG_7{show_pic(7);}
			case CG_8{show_pic(8);}
			case CG_9{show_pic(9);}
			case CG_10{show_pic(10);}
			case CG_11{show_pic(11);}
			case CG_12{show_pic(12);}
			case CG_13{show_pic(13);}
			case CG_14{show_pic(14);}
			case CG_15{show_pic(15);}
			case CG_16{show_pic(16);}
			case CG_17{show_pic(17);}
			case CG_18{show_pic(18);}
			case CG_19{show_pic(19);}
			case CG_20{show_pic(20);}
		$SYSTEM_XBOX360_button_rb_down=false;
		$SYSTEM_XBOX360_button_lb_down=false;
		}
//おがみ：チェック
//		Fade("@show_old",300,0,null,true);
		Fade("@show_old",300,0,null,true);
		}else{
			$picnum+=$nextcg;
			if($chara==1){
			//ＥＶ用
				if($CGLIB_page<=6 && $CGLIB_page>=2){
					if($picnum>=21){$plus=true;CGEV();}
					else if($picnum<=0){$plus=false;CGEV();}
				}else if($CGLIB_page>=7){
					if($picnum>=16){$plus=true;CGEV();}
					else if($picnum<=0){$plus=false;CGEV();}
				}else if($CGLIB_page<=1){
					if($picnum<=0){$plus=false;CGEV();}
					else if($picnum>=21){$plus=true;CGEV();}
				}

				show_pic($picnum);

				MoveCursor(164,118);
			}else{
			//背景用
				if($CGLIB_page<=3 && $CGLIB_page>=2){
					if($picnum>=21){$plus=true;CGBG();}
					else if($picnum<=0){$plus=false;CGBG();}
				}else if($CGLIB_page>=4){
					if($picnum>=9){$plus=true;CGBG();}
					else if($picnum<=0){$plus=false;CGBG();}
				}else if($CGLIB_page<=1){
					if($picnum<=0){$plus=false;CGBG();}
					else if($picnum>=21){$plus=true;CGBG();}
				}
				show_pic($picnum);
				MoveCursor(164,118);
			}
//おがみ：チェック
//		Fade("@show_old",300,0,null,true);
		Fade("@show_old",0,0,null,true);
		}

	}

	Fade("BLK",300,1000,null,false);
	WaitAction("BLK",null);
	Delete("*");
}

..//cg_init($c,$p)
function cg_init($c,$p)
{

	CreateTexture("ＣＧモードスクリーン", 1599, 0, 0, "SCREEN");
	Draw();

	//★★★★ロック
	XBOX360_LockVideo(true);

	$i=1;
..//生成しなおし
	while($i<=20){Delete($i);$nut="img_"+$i;Delete($nut);$nut=$i+"_img";Delete($nut);$i++;}

	$i=1;
	$x=80;
	$y=56;
	$pic_num1=0;
	$pic_num2=0;
	$pic_num3=0;
	$pic_num4=0;
	$pic_num5=0;
	$pic_num6=0;
	$pic_num7=0;
	$pic_num8=0;
	$pic_num9=0;
	$pic_num10=0;
	$pic_num11=0;
	$pic_num12=0;
	$pic_num13=0;
	$pic_num14=0;
	$pic_num15=0;
	$pic_num16=0;
	$pic_num17=0;
	$pic_num18=0;
	$pic_num19=0;
	$pic_num20=0;


	while($i<=20)
	{
		$thum="nopic";
		if($c==1){
			//Fade("@BACK/MouseUsual/*",200,1000,null,false);
			//Fade("@NEXT/MouseUsual/*",200,1000,null,false);
			if($p==1){
				if($i==1){
					if(#ev001_01_1_INT01近づく梨深_a){
						$thum="ev001_01_1_INT01近づく梨深_a";
						$pic_name1_1="ev/ev001_01_1_INT01近づく梨深_a";
						$pic_num1=1;
						$act1=4;
						$actCount1=0;
					}
				}else if($i==2){
..//差分あり3
					if(#ev013_01_1_拓巳笑い口UP_a){
					$thum="ev013_01_1_拓巳笑い口UP_a";
					$pic_name2_1="ev/ev013_01_1_拓巳笑い口UP_a";
					$pic_num2=1;
					$act2=0;
					$actCount2=3;
					$actCount2_name=true;
						if(#ev013_02_1_拓巳笑い口UP_a){
							if(#ev013_03_1_拓巳笑い口UP_a){
								$pic_name2_1Dif_1="ev/ev013_02_1_拓巳笑い口UP_a";
								$pic_name2_1Dif_2="ev/ev013_03_1_拓巳笑い口UP_a";
							}else{
								$pic_name2_1Dif_1="ev/ev013_02_1_拓巳笑い口UP_a";
								$pic_name2_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#ev013_03_1_拓巳笑い口UP_a){
								$pic_name2_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name2_1Dif_2="ev/ev013_03_1_拓巳笑い口UP_a";
							}else{
								$pic_name2_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name2_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#ev013_02_1_拓巳笑い口UP_a){
						$thum="ev013_02_1_拓巳笑い口UP_a";
						$pic_num2=1;
						$pic_name2_1="extra/gallery/砂嵐not-seen";
						$act2=0;
						$actCount2=3;
						$actCount2_name=true;
							if(#ev013_03_1_拓巳笑い口UP_a){
								$pic_name2_1Dif_1="ev/ev013_02_1_拓巳笑い口UP_a";
								$pic_name2_1Dif_2="ev/ev013_03_1_拓巳笑い口UP_a";
							}else{
								$pic_name2_1Dif_1="ev/ev013_02_1_拓巳笑い口UP_a";
								$pic_name2_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#ev013_03_1_拓巳笑い口UP_a){
						$thum="ev013_03_1_拓巳笑い口UP_a";
						$pic_name2_1="extra/gallery/砂嵐not-seen";
						$pic_name2_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name2_1Dif_2="ev/ev013_03_1_拓巳笑い口UP_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=3;
					}else{}
				}else if($i==3){
					if(#ev005_01_3_杭貼付け_a){
						$thum="ev005_01_3_杭貼付け_a";
						$pic_name3_1="ev/ev005_01_3_杭貼付け_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=0;
						$actCount3_name=true;
					}
				}else if($i==4){
					if(#ev006_01_3_グロ画像_a){
						$thum="ev006_01_3_グロ画像_a";
						$pic_name4_1="ev/ev006_01_3_グロ画像_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=2;
						$actCount4_name=true;
..//差分あり(?)※既存差分なし扱い2
						if(#ev006_02_3_グロ画像_a){$pic_name4_1Dif_1="ev/ev006_02_3_グロ画像_a";}
						else{$pic_name4_1Dif_1="extra/gallery/砂嵐not-seen";}
					}else if(#ev006_02_3_グロ画像_a){
						$thum="ev006_02_3_グロ画像_a";
						$pic_name4_1="extra/gallery/砂嵐not-seen";
						$pic_name4_1Dif_1="ev/ev006_02_3_グロ画像_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=2;
						$actCount4_name=true;
					}else{}
				}else if($i==5){
..//差分あり2
					if(#ev007_01_3_十字架杭拓巳_a){
						$thum="ev007_01_3_十字架杭拓巳_a";
						$pic_name5_1="ev/ev007_01_3_十字架杭拓巳_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=2;
						$actCount5_name=true;
						if(#ev007_02_6_十字架杭拓巳_a){
							$pic_name5_1Dif_1="ev/ev007_02_6_十字架杭拓巳_a";
						}else{
							$pic_name5_1Dif_1="extra/gallery/砂嵐not-seen";
						}
				}else if(#ev007_02_6_十字架杭拓巳_a){
						$thum="ev007_02_6_十字架杭拓巳_a";
						$pic_name5_1="extra/gallery/砂嵐not-seen";
						$pic_name5_1Dif_1="ev/ev007_02_6_十字架杭拓巳_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=2;
						$actCount5_name=true;
					}else{}
				}else if($i==6){
..//差分あり2
					if(#ev009_01_4_腕掴みミイラ_a){
						$thum="ev009_01_4_腕掴みミイラ_a";
						$pic_name6_1="ev/ev009_01_4_腕掴みミイラ_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=2;
						$actCount6_name=true;
						if(#ev010_01_4_腕掴み梨深_a){
							$pic_name6_1Dif_1="ev/ev010_01_4_腕掴み梨深_a";
						}else{
							$pic_name6_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev010_01_4_腕掴み梨深_a){
						$thum="ev010_01_4_腕掴み梨深_a";
						$pic_name6_1="extra/gallery/砂嵐not-seen";
						$pic_name6_1Dif_1="ev/ev010_01_4_腕掴み梨深_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=2;
						$actCount6_name=true;
					}else{}
				}else if($i==7){
					if(#ev012_01_1_星来横たわり_a){
						$thum="ev012_01_1_星来横たわり_a";
						$pic_name7_1="ev/ev012_01_1_星来横たわり_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=0;
					}
				}else if($i==8){
					if(#ev008_01_4_INT02あやせ歌う_a){
						$thum="ev008_01_4_INT02あやせ歌う_a";
						$pic_name8_1="ev/ev008_01_4_ex_INT02あやせ歌う_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=0;
					}
				}else if($i==9){
..//差分あり2
					if(#ev801_01_1_七海来訪_a){
						$thum="ev801_01_1_七海来訪_a";
						$pic_name9_1="ev/ev801_01_1_七海来訪_a";
						$pic_num9=1;
						$act9=3;
						$actCount9=2;
						$actCount9_name=true;
						if(#ev801_02_3_七海来訪_a){
							$pic_name9_1Dif_1="ev/ev801_02_3_七海来訪_a";
						}else{
							$pic_name9_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev801_02_3_七海来訪_a){
						$thum="ev801_02_3_七海来訪_a";
						$pic_name9_1="extra/gallery/砂嵐not-seen";
						$pic_name9_1Dif_1="ev/ev801_02_3_七海来訪_a";
						$pic_num9=1;
						$act9=3;
						$actCount9=2;
						$actCount9_name=true;
					}else{}
				}else if($i==10){
..//差分あり2
					if(#ev015_01_1_七海妄想エロ_a){
						$thum="ev015_01_1_七海妄想エロ_a";
						$pic_name10_1="ev/ev015_01_1_ex_七海妄想エロ_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=2;
						$actCount10_name=true;
						if(#ev015_02_1_七海妄想エロ_a){$pic_name10_1Dif_1="ev/ev015_02_1_ex_七海妄想エロ_a";}
						else{$pic_name10_1Dif_1="extra/gallery/砂嵐not-seen";}
					}else if(#ev015_02_1_七海妄想エロ_a){
						$thum="ev015_02_1_七海妄想エロ_a";
						$pic_name10_1="extra/gallery/砂嵐not-seen";
						$pic_name10_1Dif_1="ev/ev015_02_1_ex_七海妄想エロ_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=2;
						$actCount10_name=true;
					}else{}
				}else if($i==11){
					if(#ev802_01_1_七海コーラ死_a){
						$thum="ev802_01_1_七海コーラ死_a";
						$pic_name11_1="ev/ev802_01_1_七海コーラ死_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=0;
					}
				}else if($i==12){
					if(#ev016_01_1_七海携帯萌_a){
						$thum="ev016_01_1_七海携帯萌_a";
						$pic_name12_1="ev/ev016_01_1_ex_七海携帯萌_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=0;
					}
				}else if($i==13){
					if(#ev018_01_3_優愛_a){
						$thum="ev018_01_3_優愛_a";
						$pic_name13_1="ev/ev018_01_3_優愛_a";
						$pic_num13=1;
						$act13=1;
						$actCount13=0;
					}
				}else if($i==14){
					if(#ev803_01_3_優愛遭遇_a){
						$thum="ev803_01_3_優愛遭遇_a";
						$pic_name14_1="ev/ev803_01_3_優愛遭遇_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=0;
					}
				}else if($i==15){
..//差分あり2
					if(#ev019_01_3_優愛妄想_a){
						$thum="ev019_01_3_優愛妄想_a";
						$pic_name15_1="ev/ev019_01_3_ex_優愛妄想_a";
						$pic_num15=1;
						$act15=3;
						$actCount15=2;
						$actCount15_name=true;
						if(#ev019_02_3_優愛妄想_a){
							$pic_name15_1Dif_1="ev/ev019_02_3_ex_優愛妄想_a";
						}else{
							$pic_name15_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev019_02_3_優愛妄想_a){
						$thum="ev019_02_3_優愛妄想_a";
						$pic_name15_1="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_1="ev/ev019_02_3_ex_優愛妄想_a";
						$pic_num15=1;
						$act15=3;
						$actCount15=2;
						$actCount15_name=true;
					}else{}
				}else if($i==16){
..//差分あり2
					if(#ev017_01_2_尾道_a){
						$thum="ev017_01_2_尾道_a";
						$pic_name16_1="ev/ev017_01_2_ex_尾道_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=2;
						$actCount16_name=true;
						if(#ev017_02_2_尾道_a){
							$pic_name16_1Dif_1="ev/ev017_02_2_ex_尾道_a";
						}else{
							$pic_name16_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev017_02_2_尾道_a){
						$thum="ev017_02_2_尾道_a";
						$pic_name16_1="extra/gallery/砂嵐not-seen";
						$pic_name16_1Dif_1="ev/ev017_02_2_ex_尾道_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=2;
						$actCount16_name=true;
					}else{}
				}else if($i==17){
					if(#ev020_01_3_優愛足下_a){
						$thum="ev020_01_3_優愛足下_a";
						$pic_name17_1="ev/ev020_01_3_優愛足下_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=0;
					}
				}else if($i==18){
					if(#ev021_01_3_十字架杭優愛_a){
						$thum="ev021_01_3_十字架杭優愛_a";
						$pic_name18_1="ev/ev021_01_3_十字架杭優愛_a";
						$pic_num18=1;
						$act18=0;
						$actCount18=0;
					}
				}else if($i==19){
					if(#ev057_01_1_拓巳子供時代_a){
						$thum="ev057_01_1_拓巳子供時代_a";
						$pic_name19_1="ev/ev057_01_1_拓巳子供時代_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=0;
					}
				}else if($i==20){
					if(#ev050_01_1_受診小学生拓巳_a){
						$thum="ev050_01_1_受診小学生拓巳_a";
						$pic_name20_1="ev/ev050_01_1_受診小学生拓巳_a";
						$pic_num20=1;
						$act20=0;
						$actCount20=0;
					}
				}
..//ページ２
			}else if($p==2){
				if($i==1){
					if(#ev022_01_1_星来キス妄想_a){
						$thum="ev022_01_1_星来キス妄想_a";
						$pic_name1_1="ev/ev022_01_1_星来キス妄想_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=0;
					}
				}else if($i==2){
..//差分あり？（新規）※未実装【08/12/10】
					if(#ev144_01_1_拓巳ベッド_a){
						$thum="ev144_01_1_拓巳ベッド_a";
						$pic_name2_1="ev/ev144_01_1_拓巳ベッド_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=0;
					}
				}else if($i==3){
					if(#bg119_01_3_監視カメラ映像_a){
						$thum="bg119_01_3_監視カメラ映像_a";
						$pic_name3_1="bg/bg119_01_3_監視カメラ映像_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=0;
					}
				}else if($i==4){
					if(#ev037_01_3_INT13優愛自室でメール書く_a){
						$thum="ev037_01_3_INT13優愛自室でメール書く_a";
						$pic_name4_1="ev/ev037_01_3_INT13優愛自室でメール書く_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=0;
					}
				}else if($i==5){
					if(#ev023_01_3_INT06優愛寝転がる_a){
						$thum="ev023_01_3_INT06優愛寝転がる_a";
						$pic_name5_1="ev/ev023_01_3_INT06優愛寝転がる_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=0;
					}
				}else if($i==6){
					if(#ev024_01_3_あやせライブシーン_a){
						$thum="ev024_01_3_あやせライブシーン_a";
						$pic_name6_1="ev/ev024_01_3_あやせライブシーン_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=0;
					}
				}else if($i==7){
					if(#ev025_01_3_あやせ脱ぎ妄想_a){
						$thum="ev025_01_3_あやせ脱ぎ妄想_a";
						$pic_name7_1="ev/ev025_01_3_あやせ脱ぎ妄想_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=0;
					}
				}else if($i==8){
					if(#ev110_01_3_セナ足_a){
						$thum="ev110_01_3_セナ足_a";
						$pic_name8_1="ev/ev110_01_3_セナ足_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=0;
					}
				}else if($i==9){
..//差分あり2
					if(#ev026_01_2_七海ハンバーガー_a){
						$thum="ev026_01_2_七海ハンバーガー_a";
						$pic_name9_1="ev/ev026_01_2_七海ハンバーガー_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=2;
						$actCount9_name2=true;
						if(#ev026_02_2_七海ハンバーガー_a){
							$pic_name9_1Dif_1="ev/ev026_02_2_七海ハンバーガー_a";
						}else{
							$pic_name9_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev026_02_2_七海ハンバーガー_a){
						$thum="ev026_02_2_七海ハンバーガー_a";
						$pic_name9_1="extra/gallery/砂嵐not-seen";
						$pic_name9_1Dif_1="ev/ev026_02_2_七海ハンバーガー_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=2;
						$actCount9_name2=true;
					}else{}
				}else if($i==10){
					if(#ev027_01_3_見下ろしセナ_a){
						$thum="ev027_01_3_見下ろしセナ_a";
						$pic_name10_1="ev/ev027_01_3_見下ろしセナ_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=0;
					}
				}else if($i==11){
					if(#ev028_01_0_あやせライブ三住切る_a){
						$thum="ev028_01_0_あやせライブ三住切る_a";
						$pic_name11_1="ev/ev028_01_0_あやせライブ三住切る_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=0;
					}
				}else if($i==12){
					if(#ev029_01_2_梨深ソファ腰掛け_a){
						$thum="ev029_01_2_梨深ソファ腰掛け_a";
						$pic_name12_1="ev/ev029_01_2_梨深ソファ腰掛け_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=0;
					}
				}else if($i==13){
					if(#ev030_01_2_七海バングル_a){
						$thum="ev030_01_2_七海バングル_a";
						$pic_name13_1="ev/ev030_01_2_七海バングル_a";
						$pic_num13=1;
						$act13=0;
						$actCount13=0;
					}
				}else if($i==14){
..//差分あり3
					if(#bg136_01_1_希ＶＩＰルーム_a){
					$thum="bg136_01_1_希ＶＩＰルーム_a";
					$pic_name14_1="bg/bg136_01_1_希ＶＩＰルーム_a";
					$pic_num14=1;
					$act14=0;
					$actCount14=3;
					$actCount14_name3=true;
						if(#bg136_02_1_希ＶＩＰルーム_a){
							if(#bg136_03_1_chn希ＶＩＰルーム_a){
								$pic_name14_1Dif_1="bg/bg136_02_1_希ＶＩＰルーム_a";
								$pic_name14_1Dif_2="bg/bg136_03_1_chn希ＶＩＰルーム_a";
							}else{
								$pic_name14_1Dif_1="bg/bg136_02_1_希ＶＩＰルーム_a";
								$pic_name14_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#bg136_03_1_chn希ＶＩＰルーム_a){
								$pic_name14_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name14_1Dif_2="ev/bg136_03_1_chn希ＶＩＰルーム_a";
							}else{
								$pic_name14_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name14_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#bg136_02_1_希ＶＩＰルーム_a){
						$thum="bg136_02_1_chn希ＶＩＰルーム_a";
						$pic_num14=1;
						$pic_name14_1="extra/gallery/砂嵐not-seen";
						$act14=0;
						$actCount14=3;
						$actCount14_name3=true;
							if(#bg136_03_1_chn希ＶＩＰルーム_a){
								$pic_name14_1Dif_1="bg/bg136_02_1_希ＶＩＰルーム_a";
								$pic_name14_1Dif_2="bg/bg136_03_1_chn希ＶＩＰルーム_a";
							}else{
								$pic_name14_1Dif_1="bg/bg136_02_1_希ＶＩＰルーム_a";
								$pic_name14_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#bg136_03_1_chn希ＶＩＰルーム_a){
						$thum="bg136_03_1_chn希ＶＩＰルーム_a";
						$pic_name14_1="extra/gallery/砂嵐not-seen";
						$pic_name14_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name14_1Dif_2="bg/bg136_03_1_chn希ＶＩＰルーム_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=3;
						$actCount14_name3=true;
					}else{}
				}else if($i==15){
					if(#ev031_01_0_梢転校_a){
						$thum="ev031_01_0_梢転校_a";
						$pic_name15_1="ev/ev031_01_0_梢転校_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=0;
					}
				}else if($i==16){
..//差分あり2
					if(#ev052_01_3_将軍車椅子_a){
						$thum="ev052_01_3_将軍車椅子_a";
						$pic_name16_1="ev/ev052_01_3_将軍車椅子_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=2;
						$actCount16_name2=true;
						if(#ev052_02_3_将軍車椅子_a){
							$pic_name16_1Dif_1="ev/ev052_02_3_将軍車椅子_a";
						}else{
							$pic_name16_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev052_02_3_将軍車椅子_a){
						$thum="ev052_02_3_将軍車椅子_a";
						$pic_name16_1="extra/gallery/砂嵐not-seen";
						$pic_name16_1Dif_1="ev/ev052_02_3_将軍車椅子_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=2;
						$actCount16_name2=true;
					}else{}
				}else if($i==17){
					if(#ev032_01_3_梨深だきしめ_a){
						$thum="ev032_01_3_梨深だきしめ_a";
						$pic_name17_1="ev/ev032_01_3_梨深だきしめ_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=0;
					}
				}else if($i==18){
					if(#ev033_01_1_INT12セナ会話意識集中_a){
						$thum="ev033_01_1_INT12セナ会話意識集中_a";
						$pic_name18_1="ev/ev033_01_1_INT12セナ会話意識集中_a";
						$pic_num18=1;
						$act18=0;
						$actCount18=0;
					}
				}else if($i==19){
					if(#ev034_01_6_梨深と将軍の出会い_a){
						$thum="ev034_01_6_梨深と将軍の出会い_a";
						$pic_name19_1="ev/ev034_01_6_梨深と将軍の出会い_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=0;
					}
				}else if($i==20){
					if(#ev035_01_0_梢コケる_a){
						$thum="ev035_01_0_梢コケる_a";
						$pic_name20_1="ev/ev035_01_0_梢コケる_a";
						$pic_num20=1;
						$act20=0;
						$actCount20=0;
					}
				}
..//ページ３
			}else if($p==3){
				if($i==1){
..//差分あり2(一枚新規)
					if(#ev036_01_2_セナ白い鎖_a){
						$thum="ev036_01_2_セナ白い鎖_a";
						$pic_name1_1="ev/ev036_01_2_セナ白い鎖_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=2;
						$actCount1_name3=true;
						if(#ev036_02_2_セナ白い鎖_a){$pic_name1_1Dif_1="ev/ev036_02_2_セナ白い鎖_a";}
						else{$pic_name1_1Dif_1="extra/gallery/砂嵐not-seen";}
					}else if(#ev036_02_2_セナ白い鎖_a){
						$thum="ev036_02_2_セナ白い鎖_a";
						$pic_name1_1="extra/gallery/砂嵐not-seen";
						$pic_name1_1Dif_1="ev/ev036_02_2_セナ白い鎖_a";
						$pic_num1=1;
						$act1=1;
						$actCount1=2;
						$actCount1_name3=true;
					}else{}
				}else if($i==2){
					if(#ev038_01_3_優愛ROOM37乱入_a){
						$thum="ev038_01_3_優愛ROOM37乱入_a";
						$pic_name2_1="ev/ev038_01_3_優愛ROOM37乱入_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=0;
					}
				}else if($i==3){
..//差分あり2
					if(#ev040_01_3_あやせディソード出す_a){
						$thum="ev040_01_3_あやせディソード出す_a";
						$pic_name3_1="ev/ev040_01_3_あやせディソード出す_a";
						$pic_num3=1;
						$act3=1;
						$actCount3=2;
						$actCount3_name2=true;
						if(#ev040_02_3_あやせディソード出す_a){$pic_name3_1Dif_1="ev/ev040_02_3_あやせディソード出す_a";}
						else{$pic_name3_1Dif_1="extra/gallery/砂嵐not-seen";}
					}else if(#ev040_02_3_あやせディソード出す_a){
						$thum="ev040_02_3_あやせディソード出す_a";
						$pic_name3_1="extra/gallery/砂嵐not-seen";
						$pic_name3_1Dif_1="ev/ev040_02_3_あやせディソード出す_a";
						$pic_num3=1;
						$act3=1;
						$actCount3=2;
						$actCount3_name2=true;
					}else{}
				}else if($i==4){
..//差分あり2
					if(#ev039_01_3_あやせ白下着_a){
						$thum="ev039_01_3_あやせ白下着_b";
						$pic_name4_1="ev/ev039_01_3_あやせ白下着_b";
						$pic_num4=1;
						$act4=0;
						$actCount4=2;
						$actCount4_name3=true;
						if(#ev039_02_3_あやせ白下着_a){$pic_name4_1Dif_1="ev/ev039_02_3_あやせ白下着_b";}
						else{$pic_name4_1Dif_1="extra/gallery/砂嵐not-seen";}
					}else if(#ev039_02_3_あやせ白下着_a){
						$thum="ev039_02_3_あやせ白下着_b";
						$pic_name4_1="extra/gallery/砂嵐not-seen";
						$pic_name4_1Dif_1="ev/ev039_02_3_あやせ白下着_b";
						$pic_num4=1;
						$act4=0;
						$actCount4=2;
						$actCount4_name3=true;
					}else{}
				}else if($i==5){
					if(#ev054_01_3_刑事二人_a){
						$thum="ev054_01_3_刑事二人_a";
						$pic_name5_1="ev/ev054_01_3_刑事二人_a";
						$pic_num5=1;
						$actCount5=0;
						$act5=0;
					}
				}else if($i==6){
					if(#ev041_01_2_優愛教室ドアから見ている_a){
						$thum="ev041_01_2_優愛教室ドアから見ている_a";
						$pic_name6_1="ev/ev041_01_2_優愛教室ドアから見ている_a";
						$pic_num6=1;
						$actCount6=0;
						$act6=0;
					}
				}else if($i==7){
..//差分あり2
					if(#ev042_01_2_梨深に介抱される_a){
						$thum="ev042_01_2_梨深に介抱される_a";
						$pic_name7_1="ev/ev042_01_2_梨深に介抱される_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=2;
						$actCount7_name3=true;
						if(#ev042_02_2_梨深に介抱される_a){$pic_name7_1Dif_1="ev/ev042_02_2_梨深に介抱される_a";}
						else{$pic_name7_1Dif_1="extra/gallery/砂嵐not-seen";}
					}else if(#ev042_02_2_梨深に介抱される_a){
						$thum="ev042_02_2_梨深に介抱される_a";
						$pic_name7_1="extra/gallery/砂嵐not-seen";
						$pic_name7_1Dif_1="ev/ev042_02_2_梨深に介抱される_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=2;
						$actCount7_name3=true;
					}else{}
				}else if($i==8){
					if(#ev043_01_2_梨深CD貸してくれたら_a){
						$thum="ev043_01_2_梨深CD貸してくれたら_a";
						$pic_name8_1="ev/ev043_01_2_梨深CD貸してくれたら_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=0;
					}
				}else if($i==9){
..//差分あり3
					if(#ev044_01_2_梨深下着Yシャツ_a){
					$thum="ev044_01_2_梨深下着Yシャツ_a";
					$pic_name9_1="ev/ev044_01_2_ex_梨深下着Yシャツ_a";
					$pic_num9=1;
					$act9=0;
					$actCount9=3;
					$actCount9_name3=true;
						if(#ev044_02_2_梨深下着Yシャツ_a){
							if(#ev044_03_2_梨深下着Yシャツ_a){
								$pic_name9_1Dif_1="ev/ev044_02_2_梨深下着Yシャツ_a";
								$pic_name9_1Dif_2="ev/ev044_03_2_梨深下着Yシャツ_a";
							}else{
								$pic_name9_1Dif_1="ev/ev044_02_2_梨深下着Yシャツ_a";
								$pic_name9_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#ev044_03_2_梨深下着Yシャツ_a){
								$pic_name9_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name9_1Dif_2="ev/ev044_03_2_梨深下着Yシャツ_a";
							}else{
								$pic_name9_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name9_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#ev044_02_2_梨深下着Yシャツ_a){
						$thum="ev044_02_2_梨深下着Yシャツ_a";
						$pic_num9=1;
						$pic_name9_1="extra/gallery/砂嵐not-seen";
						$act9=0;
						$actCount9=3;
						$actCount9_name3=true;
							if(#ev044_03_2_梨深下着Yシャツ_a){
								$pic_name9_1Dif_1="ev/ev044_02_2_梨深下着Yシャツ_a";
								$pic_name9_1Dif_2="ev/ev044_03_2_梨深下着Yシャツ_a";
							}else{
								$pic_name9_1Dif_1="ev/ev044_02_2_梨深下着Yシャツ_a";
								$pic_name9_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#ev044_03_2_梨深下着Yシャツ_a){
						$thum="ev044_03_2_梨深下着Yシャツ_a";
						$pic_name9_1="extra/gallery/砂嵐not-seen";
						$pic_name9_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name9_1Dif_2="ev/ev044_03_2_梨深下着Yシャツ_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=3;
						$actCount9_name3=true;
					}else{}
				}else if($i==10){
					if(#ev045_01_3_INT16セナ機械破壊_a){
						$thum="ev045_01_3_INT16セナ機械破壊_a";
						$pic_name10_1="ev/ev045_01_3_INT16セナ機械破壊_a";
						$pic_num10=1;
						$act10=1;
						$actCount10=0;
					}
				}else if($i==11){
					if(#ev055_01_1_刑事と探偵会話_a){
						$thum="ev055_01_1_刑事と探偵会話_a";
						$pic_name11_1="ev/ev055_01_1_刑事と探偵会話_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=0;
					}
				}else if($i==12){
..//差分あり2
					if(#ev056_01_1_優愛へたりこみ電話_a){
						$thum="ev056_01_1_優愛へたりこみ電話_a";
						$pic_name12_1="ev/ev056_01_1_優愛へたりこみ電話_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=2;
						$actCount12_name3=true;
						if(#ev056_02_1_優愛へたりこみ電話_a){
							$pic_name12_1Dif_1="ev/ev056_02_1_優愛へたりこみ電話_a";
						}else{
							$pic_name12_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev056_02_1_優愛へたりこみ電話_a){
						$thum="ev056_02_1_優愛へたりこみ電話_a";
						$pic_name12_1="extra/gallery/砂嵐not-seen";
						$pic_name12_1Dif_1="ev/ev056_02_1_優愛へたりこみ電話_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=2;
						$actCount12_name3=true;
					}else{}
				}else if($i==13){
					if(#ev064_01_1_あやせ飛び降りようと_a){
						$thum="ev064_01_1_あやせ飛び降りようと_a";
						$pic_name13_1="ev/ev064_01_1_あやせ飛び降りようと_a";
						$pic_num13=1;
						$act13=0;
						$actCount13=0;
					}
				}else if($i==14){
..//差分あり2
					if(#ev065_01_1_あやせ投身_a){
						$thum="ev065_01_1_あやせ投身_a";
						$pic_name14_1="ev/ev065_01_1_あやせ投身_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=2;
						$actCount14_name3=true;
						if(#ev065_02_1_あやせ投身_a){
							$pic_name14_1Dif_1="ev/ev065_02_1_あやせ投身_a";
						}else{
							$pic_name14_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev065_02_1_あやせ投身_a){
						$thum="ev065_02_1_あやせ投身_a";
						$pic_name14_1="extra/gallery/砂嵐not-seen";
						$pic_name14_1Dif_1="ev/ev065_02_1_あやせ投身_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=2;
						$actCount14_name3=true;
					}else{}
				}else if($i==15){
					if(#ev066_01_1_あやせ花壇落ち_a){
						$thum="ev066_01_1_あやせ花壇落ち_a";
						$pic_name15_1="ev/ev066_01_1_ex_あやせ花壇落ち_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=0;
					}
				}else if($i==16){
..//新規
					if(#ev121_01_1_セナキス_a){
						$thum="ev121_01_1_セナキス_a";
						$pic_name16_1="ev/ev121_01_1_セナキス_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=0;
					}
				}else if($i==17){
..//新規
					if(#ev122_01_1_セナ押し倒し_a){
						$thum="ev122_01_1_セナ押し倒し_a";
						$pic_name17_1="ev/ev122_01_1_セナ押し倒し_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=0;
					}
				}else if($i==18){
					if(#ev057_01_3_Q－FrontTVモニター_a){
						$thum="ev057_01_3_Q-FrontTVモニター_a";
						$pic_name18_1="ev/ev057_01_3_Q-FrontTVモニター_a";
						$pic_num18=1;
						$act18=0;
						$actCount18=0;
					}
				}else if($i==19){
					if(#ev067_01_6_血溜り七海_a){
						$thum="ev067_01_6_血溜り七海_a";
						$pic_name19_1="ev/ev067_01_6_血溜り七海_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=0;
					}
				}else if($i==20){
					if(#ev056_01_1_9歳七海拓巳に食事_a){
						$thum="ev056_01_1_9歳七海拓巳に食事_a";
						$pic_name20_1="ev/ev056_01_1_9歳七海拓巳に食事_a";
						$pic_num20=1;
						$act20=0;
						$actCount20=0;
					}
				}
..//ページ４
			}else if($p==4){
				if($i==1){
..//差分あり4(新規)
					if(#ev138_01_1_梢ちんすこう_a){
						$thum="ev138_01_1_梢ちんすこう_a";
						$pic_name1_1="ev/ev138_01_1_梢ちんすこう_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=4;
						$actCount1_name4=4;
						if(#ev138_02_1_梢ちんすこう_a){$pic_name1_1Dif_1="ev/ev138_02_1_梢ちんすこう_a";}
						else{$pic_name1_1Dif_1="extra/gallery/砂嵐not-seen";}
						if(#ev138_04_1_梢ちんすこう_a){$pic_name1_1Dif_2="ev/ev138_04_1_梢ちんすこう_a";}
						else{$pic_name1_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#ev138_03_1_梢ちんすこう_a){$pic_name1_1Dif_3="ev/ev138_03_1_梢ちんすこう_a";}
						else{$pic_name1_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#ev138_02_1_梢ちんすこう_a){
						$thum="ev138_02_1_梢ちんすこう_a";
						$pic_name1_1="extra/gallery/砂嵐not-seen";
						$pic_num1=1;
						$act1=0;
						$actCount1=4;
						$actCount1_name4=4;
						$pic_name1_1Dif_1="ev/ev138_01_1_梢ちんすこう_a";
						if(#ev138_04_1_梢ちんすこう_a){$pic_name1_1Dif_2="ev/ev138_04_1_梢ちんすこう_a";}
						else{$pic_name1_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#ev138_03_1_梢ちんすこう_a){$pic_name1_1Dif_3="ev/ev138_03_1_梢ちんすこう_a";}
						else{$pic_name1_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#ev138_04_1_梢ちんすこう_a){
						$thum="ev138_04_1_梢ちんすこう_a";
						$pic_name1_1="extra/gallery/砂嵐not-seen";
						$pic_num1=1;
						$act1=0;
						$actCount1=4;
						$actCount1_name4=4;
						$pic_name1_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name1_1Dif_2="ev/ev138_04_1_梢ちんすこう_a";
						if(#ev138_03_1_梢ちんすこう_a){$pic_name1_1Dif_3="ev/ev138_03_1_梢ちんすこう_a";}
						else{$pic_name1_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#ev138_03_1_梢ちんすこう_a){
						$thum="ev138_03_1_梢ちんすこう_a";
						$pic_name1_1="extra/gallery/砂嵐not-seen";
						$pic_num1=1;
						$act1=0;
						$actCount1=4;
						$actCount1_name4=4;
						$pic_name1_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name1_1Dif_2="extra/gallery/砂嵐not-seen";
						$pic_name1_1Dif_3="ev/ev138_03_1_梢ちんすこう_a";
					}else{}
				}else if($i==2){
..//差分あり2
					if(#ev070_01_2_将軍と梨深in病院_a){
						$thum="ev070_01_2_将軍と梨深in病院_a";
						$pic_name2_1="ev/ev070_01_2_将軍と梨深in病院_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=2;
						$actCount2_name4=true;
						if(#ev070_02_2_将軍と梨深in病院_a){
							$pic_name2_1Dif_1="ev/ev070_02_2_将軍と梨深in病院_a";
						}else{
							$pic_name2_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev070_02_2_将軍と梨深in病院_a){
						$thum="ev070_02_2_将軍と梨深in病院_a";
						$pic_name2_1="extra/gallery/砂嵐not-seen";
						$pic_name2_1Dif_1="ev/ev070_02_2_将軍と梨深in病院_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=2;
						$actCount2_name3=true;
					}else{}
				}else if($i==3){
..//差分あり2（一枚新規）
					if(#ev071_01_1_梢ディソード顕現_a){
						$thum="ev071_01_1_梢ディソード顕現_a";
						$pic_name3_1="ev/ev071_01_1_梢ディソード顕現_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=2;
						$actCount3_name4=true;
						if(#ev071_02_2_梢ディソード顕現_a){
							$pic_name3_1Dif_1="ev/ev071_02_2_梢ディソード顕現_a";
						}else{
							$pic_name3_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev071_02_2_梢ディソード顕現_a){
						$thum="ev071_02_2_梢ディソード顕現_a";
						$pic_name3_1="extra/gallery/砂嵐not-seen";
						$pic_name3_1Dif_1="ev/ev071_02_2_梢ディソード顕現_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=2;
						$actCount3_name3=true;
					}else{}
				}else if($i==4){
					if(#ev072_01_1_梢と波多野Roft前_a){
						$thum="ev072_01_1_梢と波多野Roft前_a";
						$pic_name4_1="ev/ev072_01_1_梢と波多野Roft前_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=0;
					}
				}else if($i==5){
..//差分あり2
					if(#ev062_01_1_プリクラ_a){
						$thum="ev062_01_1_プリクラ_a";
						$pic_name5_1="ev/ev062_01_1_プリクラ_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=2;
						$actCount5_name4=true;
						if(#ev062_02_1_プリクラ_a){
							$pic_name5_1Dif_1="ev/ev062_02_1_プリクラ_a";
						}else{
							$pic_name5_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev062_02_1_プリクラ_a){
						$thum="ev062_02_1_プリクラ_a";
						$pic_name5_1="extra/gallery/砂嵐not-seen";
						$pic_name5_1Dif_1="ev/ev062_02_1_プリクラ_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=2;
						$actCount5_name4=true;
					}else{}
				}else if($i==6){
					if(#ev077_01_3_野呂瀬社長室_a){
						$thum="ev077_01_3_野呂瀬社長室_a";
						$pic_name6_1="ev/ev077_01_3_野呂瀬社長室_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=0;
					}
				}else if($i==7){
..//差分あり2
					if(#ev068_01_1_七海廊下後姿_a){
						$thum="ev068_01_1_七海廊下後姿_a";
						$pic_name7_1="ev/ev068_01_1_七海廊下後姿_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=2;
						$actCount7_name4=true;
						if(#ev069_01_1_七海廊下後姿髪かきあげ_a){
							$pic_name7_1Dif_1="ev/ev069_01_1_七海廊下後姿髪かきあげ_a";
						}else{
							$pic_name7_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev069_01_1_七海廊下後姿髪かきあげ_a){
						$thum="ev069_01_1_七海廊下後姿髪かきあげ_a";
						$pic_name7_1="extra/gallery/砂嵐not-seen";
						$pic_name7_1Dif_1="ev/ev069_01_1_七海廊下後姿髪かきあげ_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=2;
						$actCount7_name4=true;
					}else{}
				}else if($i==8){
					if(#ev076_01_4_美愛くま抱き_a){
						$thum="ev076_01_4_美愛くま抱き_a";
						$pic_name8_1="ev/ev076_01_4_美愛くま抱き_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=0;
					}
				}else if($i==9){
					if(#ev059_01_6_あやせ拷問_a){
						$thum="ev059_01_6_あやせ拷問_a";
						$pic_name9_1="ev/ev059_01_6_あやせ拷問_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=0;
					}
				}else if($i==10){
..//新規
//おがみ：いじった
					if(#ev116_01_6_梨深抱きつき_a){
						$thum="ev116_01_6_ex_梨深抱きつき_a";
						$pic_name10_1="ev/ev116_01_6_ex_梨深抱きつき_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=2;
						if(#ev116_01_6_梨深抱きつき_a){
							$pic_name10_1Dif_1="ev/ev116_01_6_梨深抱きつき_a";
						}else{
							$pic_name10_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev116_01_6_梨深抱きつき_a){
						$thum="ev116_01_6_ex_梨深抱きつき_a";
						$pic_name10_1="ev/ev116_01_6_梨深抱きつき_a";
						$pic_name10_1Dif_1="ev/ev116_01_6_梨深抱きつき_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=2;
						$actCount10_name4=true;
					}else{
							$pic_name10_1Dif_1="extra/gallery/砂嵐not-seen";
						}
				}else if($i==11){
..//差分あり2
					if(#ev078_01_3_葉月ナースめがね_a){
						$thum="ev078_01_3_葉月ナースめがね_a";
						$pic_name11_1="ev/ev078_01_3_葉月ナースめがね_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=2;
						$actCount11_name4=true;
						if(#ev078_02_3_葉月ナースめがね_a){
							$pic_name11_1Dif_1="ev/ev078_02_3_葉月ナースめがね_a";
						}else{
							$pic_name11_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev078_02_3_葉月ナースめがね_a){
						$thum="ev078_02_3_葉月ナースめがね_a";
						$pic_name11_1="extra/gallery/砂嵐not-seen";
						$pic_name11_1Dif_1="ev/ev078_02_3_葉月ナースめがね_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=2;
						$actCount11_name4=true;
					}else{}
				}else if($i==12){
..//新規3
					if(#ev131_01_2_あやせ指なめ_a){
					$thum="ev131_01_2_あやせ指なめ_a";
					$pic_name12_1="ev/ev131_01_2_あやせ指なめ_a";
					$pic_num12=1;
					$act12=0;
					$actCount12=3;
					$actCount12_name5=true;
						if(#ev131_02_2_あやせ指なめ_a){
							if(#ev131_03_2_あやせ指なめ_a){
								$pic_name12_1Dif_1="ev/ev131_02_2_あやせ指なめ_a";
								$pic_name12_1Dif_2="ev/ev131_03_2_あやせ指なめ_a";
							}else{
								$pic_name12_1Dif_1="ev/ev131_02_2_あやせ指なめ_a";
								$pic_name12_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#ev131_03_2_あやせ指なめ_a){
								$pic_name12_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name12_1Dif_2="ev/ev131_03_2_あやせ指なめ_a";
							}else{
								$pic_name12_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name12_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#ev131_02_2_あやせ指なめ_a){
						$thum="ev131_02_2_あやせ指なめ_a";
						$pic_num12=1;
						$pic_name12_1="extra/gallery/砂嵐not-seen";
						$act12=0;
						$actCount12=3;
						$actCount12_name5=true;
							if(#ev131_03_2_あやせ指なめ_a){
								$pic_name12_1Dif_1="ev/ev131_02_2_あやせ指なめ_a";
								$pic_name12_1Dif_2="ev/ev131_03_2_あやせ指なめ_a";
							}else{
								$pic_name12_1Dif_1="ev/ev131_02_2_あやせ指なめ_a";
								$pic_name12_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#ev131_03_2_あやせ指なめ_a){
						$thum="ev131_03_2_あやせ指なめ_a";
						$pic_name12_1="extra/gallery/砂嵐not-seen";
						$pic_name12_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name12_1Dif_2="ev/ev131_03_2_あやせ指なめ_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=3;
						$actCount12_name5=true;
					}else{}
				}else if($i==13){
..//新規差分追加【081219】
					if(#ev132_01_2_あやせ殺害_a){
						$thum="ev132_01_2_あやせ殺害_a";
						$pic_name13_1="ev/ev132_01_2_あやせ殺害_a";
						$pic_num13=1;
						$act13=0;
						$actCount13=2;
						$actCount13_name4=true;
						if(#ev132_01_2_あやせ殺害_b){
							$pic_name13_1Dif_1="ev/ev132_01_2_ex_あやせ殺害_a";
						}else{
							$pic_name13_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev132_01_2_あやせ殺害_b){
						$thum="ev132_03_2_ex_あやせ殺害_a";
						$pic_name13_1="extra/gallery/砂嵐not-seen";
						$pic_name13_1Dif_1="ev/ev132_01_2_ex_あやせ殺害_a";
						$pic_num13=1;
						$act13=0;
						$actCount13=2;
						$actCount13_name4=true;
					}else{}
				}else if($i==14){
					if(#ev080_01_1_梨深七海ハイタッチ_a){
						$thum="ev080_01_1_梨深七海ハイタッチ_a";
						$pic_name14_1="ev/ev080_01_1_梨深七海ハイタッチ_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=0;
					}
				}else if($i==15){
..//差分あり2
					if(#ev060_01_3_セナコンテナ登場_a){
						$thum="ev060_01_3_セナコンテナ登場_a";
						$pic_name15_1="ev/ev060_01_3_セナコンテナ登場_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=2;
						$actCount15_name4=true;
						if(#ev060_02_3_セナコンテナ登場_a){
							$pic_name15_1Dif_1="ev/ev060_02_3_セナコンテナ登場_a";
						}else{
							$pic_name15_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev060_02_3_セナコンテナ登場_a){
						$thum="ev060_02_3_セナコンテナ登場_a";
						$pic_name15_1="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_1="ev/ev060_02_3_セナコンテナ登場_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=2;
						$actCount15_name4=true;
					}else{}
				}else if($i==16){
					if(#ev079_01_3_梨深セナ対決_a){
						$thum="ev079_01_3_梨深セナ対決_a";
						$pic_name16_1="ev/ev079_01_3_ex_梨深セナ対決_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=0;
					}
				}else if($i==17){
					if(#ev073_01_1_赤子を抱く母_a){
						$thum="ev073_01_1_赤子を抱く母_a";
						$pic_name17_1="ev/ev073_01_1_赤子を抱く母_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=0;
					}
				}else if($i==18){
..//差分あり2
					if(#ev063_01_1_マジックミラー波多野_a){
						$thum="ev063_01_1_マジックミラー波多野_a";
						$pic_name18_1="ev/ev063_01_1_マジックミラー波多野_a";
						$pic_num18=1;
						$act18=0;
						$actCount18=2;
						$actCount18_name4=true;
						if(#ev063_02_1_マジックミラー波多野_a){
							$pic_name18_1Dif_1="ev/ev063_02_1_マジックミラー波多野_a";
						}else{
							$pic_name18_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev063_02_1_マジックミラー波多野_a){
						$thum="ev063_02_1_マジックミラー波多野_a";
						$pic_name18_1="extra/gallery/砂嵐not-seen";
						$pic_name18_1Dif_1="ev/ev063_02_1_マジックミラー波多野_a";
						$pic_num18=1;
						$act18=0;
						$actCount18=2;
						$actCount18_name4=true;
					}else{}
				}else if($i==19){
					if(#ev082_01_3_七海ゾンビ_a){
						$thum="ev082_01_3_七海ゾンビ_a";
						$pic_name19_1="ev/ev082_01_3_七海ゾンビ_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=0;
					}
				}else if($i==20){
					if(#ev081_01_3_判死_a){
						$thum="ev081_01_3_判死_a";
						$pic_name20_1="ev/ev081_01_3_判死_a";
						$pic_num20=1;
						$act20=0;
						$actCount20=0;
					}
				}
..//ページ５
			}else if($p==5){
				if($i==1){
					if(#ev083_01_3_優愛ディソード_a){
						$thum="ev083_01_3_優愛ディソード_a";
						$pic_name1_1="ev/ev083_01_3_優愛ディソード_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=0;
					}
				}else if($i==2){
					if(#ev084_01_3_ノアII_a){
						$thum="ev084_01_3_ノアII_a";
						$pic_name2_1="ev/ev084_01_3_ノアII_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=0;
					}
				}else if($i==3){
					if(#ev085_01_3_七海ディソード_a){
						$thum="ev085_01_3_七海ディソード_a";
						$pic_name3_1="ev/ev085_01_3_七海ディソード_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=0;
					}
				}else if($i==4){
					if(#ev086_01_6_梨深スポットライト膝抱え_a){
						$thum="ev086_01_6_梨深スポットライト膝抱え_a";
						$pic_name4_1="ev/ev086_01_6_梨深スポットライト膝抱え_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=0;
					}
				}else if($i==5){
..//差分あり3（新規）
					if(#ev143_01_3_拓巳覚醒_a){
					$thum="ev143_01_3_拓巳覚醒_a";
					$pic_name5_1="ev/ev143_01_3_ex_拓巳覚醒_a";
					$pic_num5=1;
					$act5=0;
					$actCount5=3;
					$actCount5_name5=true;
						if(#ev143_02_3_拓巳覚醒_a){
							if(#ev143_03_3_拓巳覚醒_a){
								$pic_name5_1Dif_1="ev/ev143_02_3_ex_拓巳覚醒_a";
								$pic_name5_1Dif_2="ev/ev143_03_3_ex_拓巳覚醒_a";
							}else{
								$pic_name5_1Dif_1="ev/ev143_02_3_拓巳覚醒_a";
								$pic_name5_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#ev143_02_3_拓巳覚醒_a){
								$pic_name5_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name5_1Dif_2="ev/ev143_03_3_ex_拓巳覚醒_a";
							}else{
								$pic_name5_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name5_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#ev143_02_3_拓巳覚醒_a){
						$thum="ev143_02_3_拓巳覚醒_a";
						$pic_num5=1;
						$pic_name5_1="extra/gallery/砂嵐not-seen";
						$act5=0;
						$actCount5=3;
						$actCount5_name5=true;
							if(#ev143_03_3_拓巳覚醒_a){
								$pic_name5_1Dif_1="ev/ev143_02_3_ex_拓巳覚醒_a";
								$pic_name5_1Dif_2="ev/ev143_03_3_ex_拓巳覚醒_a";
							}else{
								$pic_name5_1Dif_1="ev/ev143_02_3_ex_拓巳覚醒_a";
								$pic_name5_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#ev143_03_3_拓巳覚醒_a){
						$thum="ev143_03_3_拓巳覚醒_a";
						$pic_name5_1="extra/gallery/砂嵐not-seen";
						$pic_name5_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name5_1Dif_2="ev/ev143_03_3_ex_拓巳覚醒_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=3;
						$actCount5_name5=true;
					}else{}
				}else if($i==6){
					if(#ev087_01_3_拓巳ディソード_a){
						$thum="ev087_01_3_拓巳ディソード_a";
						$pic_name6_1="ev/ev087_01_3_拓巳ディソード_a";
						$pic_num6=1;
						$act6=1;
						$actCount6=0;
					}
				}else if($i==7){
					if(#ev087_02_3_拓巳ディソード_a){
						$thum="ev087_02_3_拓巳ディソード_a";
						$pic_name7_1="ev/ev087_02_3_拓巳ディソード_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=0;
					}
				}else if($i==8){
..//差分あり2
					if(#ev088_01_4_葉月救いあれ_a){
						$thum="ev088_01_4_葉月救いあれ_a";
						$pic_name8_1="ev/ev088_01_4_葉月救いあれ_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=2;
						$actCount8_name5=true;
						if(#ev088_02_4_葉月救いあれ_a){
							$pic_name8_1Dif_1="ev/ev088_02_4_葉月救いあれ_a";
						}else{
							$pic_name8_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev088_02_4_葉月救いあれ_a){
						$thum="ev088_02_4_葉月救いあれ_a";
						$pic_name8_1="extra/gallery/砂嵐not-seen";
						$pic_name8_1Dif_1="ev/ev088_02_4_葉月救いあれ_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=2;
						$actCount8_name5=true;
					}else{}
				}else if($i==9){
					if(#ev089_01_1_あやせ瓦礫下_a){
						$thum="ev089_01_1_あやせ瓦礫下_a";
						$pic_name9_1="ev/ev089_01_1_あやせ瓦礫下_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=0;
					}
				}else if($i==10){
					if(#ev090_01_1_優愛瓦礫下_a){
						$thum="ev090_01_1_優愛瓦礫下_a";
						$pic_name10_1="ev/ev090_01_1_優愛瓦礫下_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=0;
					}
				}else if($i==11){
					if(#ev091_01_1_七海と将軍_a){
						$thum="ev091_01_1_七海と将軍_a";
						$pic_name11_1="ev/ev091_01_1_七海と将軍_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=0;
					}
				}else if($i==12){
..//差分あり3
					if(#ev092_01_1_拓巳振り返り_a){
					$thum="ev092_01_1_拓巳振り返り_a";
					$pic_name12_1="ev/ev092_01_1_拓巳振り返り_a";
					$pic_num12=1;
					$act12=0;
					$actCount12=3;
					$actCount12_name5=true;
						if(#ev092_02_1_拓巳振り返り_a){
							if(#ev092_03_1_拓巳振り返り_a){
								$pic_name12_1Dif_1="ev/ev092_02_1_拓巳振り返り_a";
								$pic_name12_1Dif_2="ev/ev092_03_1_拓巳振り返り_a";
							}else{
								$pic_name12_1Dif_1="ev/ev092_02_1_拓巳振り返り_a";
								$pic_name12_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#ev092_03_1_拓巳振り返り_a){
								$pic_name12_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name12_1Dif_2="ev/ev092_03_1_拓巳振り返り_a";
							}else{
								$pic_name12_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name12_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#ev092_02_1_拓巳振り返り_a){
						$thum="ev092_02_1_拓巳振り返り_a";
						$pic_num12=1;
						$pic_name12_1="extra/gallery/砂嵐not-seen";
						$act12=0;
						$actCount12=3;
						$actCount12_name5=true;
							if(#ev092_03_1_拓巳振り返り_a){
								$pic_name12_1Dif_1="ev/ev092_02_1_拓巳振り返り_a";
								$pic_name12_1Dif_2="ev/ev092_03_1_拓巳振り返り_a";
							}else{
								$pic_name12_1Dif_1="ev/ev092_02_1_拓巳振り返り_a";
								$pic_name12_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#ev092_03_1_拓巳振り返り_a){
						$thum="ev092_03_1_拓巳振り返り_a";
						$pic_name12_1="extra/gallery/砂嵐not-seen";
						$pic_name12_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name12_1Dif_2="ev/ev092_03_1_拓巳振り返り_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=3;
						$actCount12_name5=true;
					}else{}
				}else if($i==13){
..//差分あり2
					if(#ev093_01_1_セナ父殺し_a){
						$thum="ev093_01_1_セナ父殺し_a";
						$pic_name13_1="ev/ev093_01_1_セナ父殺し_a";
						$pic_num13=1;
						$act13=0;
						$actCount13=2;
						$actCount13_name5=true;
						if(#ev093_01_1_セナ父殺し_b){
							$pic_name13_1Dif_1="ev/ev093_01_1_セナ父殺し_c";
						}else{
							$pic_name13_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev093_01_1_セナ父殺し_b){
						$thum="ev093_01_1_セナ父殺し_b";
						$pic_name13_1="extra/gallery/砂嵐not-seen";
						$pic_name13_1Dif_1="ev/ev093_01_1_セナ父殺し_c";
						$pic_num13=1;
						$act13=0;
						$actCount13=2;
						$actCount13_name5=true;
					}else{}
				}else if($i==14){
					if(#ev094_01_1_セナ父首はね_a){
						$thum="ev094_01_1_セナ父首はね_a";
						$pic_name14_1="ev/ev094_01_1_セナ父首はね_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=0;
					}
				}else if($i==15){
					if(#ev095_01_1_拓巳ダーツ逆転_a){
						$thum="ev095_01_1_拓巳ダーツ逆転_a";
						$pic_name15_1="ev/ev095_01_1_拓巳ダーツ逆転_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=0;
					}
				}else if($i==16){
					if(#ev096_01_1_星来大群_a){
						$thum="ev096_01_1_星来大群_b";
						$pic_name16_1="ev/ev096_01_1_星来大群_b";
						$pic_num16=1;
						$act16=0;
						$actCount16=0;
					}
				}else if($i==17){
..//差分あり2
					if(#ev097_01_1_梨深はりつけ_a){
						$thum="ev097_01_1_梨深はりつけ_a";
						$pic_name17_1="ev/ev097_01_1_梨深はりつけ_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=2;
						$actCount17_name5=true;
						if(#ev097_02_1_梨深はりつけ_a){
							$pic_name17_1Dif_1="ev/ev097_02_1_梨深はりつけ_a";
						}else{
							$pic_name17_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev097_02_1_梨深はりつけ_a){
						$thum="ev097_02_1_梨深はりつけ_a";
						$pic_name17_1="extra/gallery/砂嵐not-seen";
						$pic_name17_1Dif_1="ev/ev097_02_1_梨深はりつけ_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=2;
						$actCount17_name5=true;
					}else{}
				}else if($i==18){
					if(#ev107_01_1_梨深祈る_a){
						$thum="ev107_01_1_梨深祈る_a";
						$pic_name18_1="ev/ev107_01_1_梨深祈る_a";
						$pic_num18=1;
						$act18=0;
						$actCount18=0;
					}
				}else if($i==19){
					if(#ev106_01_1_剣交え_a){
						$thum="ev106_01_1_剣交え_a";
						$pic_name19_1="ev/ev106_01_1_剣交え_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=0;
					}
				}else if($i==20){
					if(#ev099_01_1_梨深レイプ_a){
						$thum="ev099_01_1_梨深レイプ_a";
						$pic_name20_1="ev/ev099_01_1_梨深レイプ_a";
						$pic_num20=1;
						$act20=0;
						$actCount20=0;
					}
				}
..//ページ６（これ以降新規）
			}else if($p==6){
				if($i==1){
					if(#ev098_01_1_野呂瀬ディソード_a){
						$thum="ev098_01_1_野呂瀬ディソード_a";
						$pic_name1_1="ev/ev098_01_1_野呂瀬ディソード_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=0;
					}
				}else if($i==2){
					if(#ev108_02_1_串刺し_a){
						$thum="ev108_02_1_串刺し_a";
						$pic_name2_1="ev/ev108_02_1_串刺し_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=0;
					}
				}else if($i==3){
					if(#ev100_06_1_６人祈る_a){
						$thum="ev100_06_1_６人祈る_a";
						$pic_name3_1="ev/ev100_06_1_６人祈る_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=0;
					}
				}else if($i==4){
					if(#ev101_01_1_拓巳大蛇_a){
						$thum="ev101_01_1_拓巳大蛇_a";
						$pic_name4_1="ev/ev101_01_1_拓巳大蛇_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=0;
					}
				}else if($i==5){
					if(#ev111_01_6_野呂瀬ラスト_a){
						$thum="ev111_01_6_野呂瀬ラスト_a";
						$pic_name5_1="ev/ev111_01_6_野呂瀬ラスト_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=0;
					}
				}else if($i==6){
					if(#ev104_01_6_野呂瀬足_a){
						$thum="ev104_01_6_野呂瀬足_a";
						$pic_name6_1="ev/ev104_01_6_野呂瀬足_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=0;
					}
				}else if($i==7){
..//差分あり2
					if(#ev105_01_1_拓巳光と消える_a){
						$thum="ev105_01_1_拓巳光と消える_a";
						$pic_name7_1="ev/ev105_01_1_拓巳光と消える_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=2;
						$actCount7_name5=true;
						if(#ev105_02_1_拓巳光と消える_a){
							$pic_name7_1Dif_1="ev/ev105_02_1_拓巳光と消える_a";
						}else{
							$pic_name7_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev105_02_1_拓巳光と消える_a){
						$thum="ev105_02_1_拓巳光と消える_a";
						$pic_name7_1="extra/gallery/砂嵐not-seen";
						$pic_name7_1Dif_1="ev/ev105_02_1_拓巳光と消える_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=2;
						$actCount7_name5=true;
					}else{}
				}else if($i==8){
					if(#ev102_01_1_Ａエンド1_a){
						$thum="ev102_01_1_Ａエンド1_a";
						$pic_name8_1="ev/ev102_01_1_Ａエンド1_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=0;
					}
				}else if($i==9){
					if(#ev103_01_1_Ａエンド2_a){
						$thum="ev103_01_1_Ａエンド2_a";
						$pic_name9_1="ev/ev103_01_1_Ａエンド2_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=0;
					}
				}else if($i==10){
					if(#ev112_01_3_梨深驚愕_a){
						$thum="ev112_01_3_梨深驚愕_a";
						$pic_name10_1="ev/ev112_01_3_梨深驚愕_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=0;
					}
				}else if($i==11){
..//差分あり2
					if(#ev113_01_2_梨深VS梢_a){
						$thum="ev113_01_2_梨深VS梢_a";
						$pic_name11_1="ev/ev113_02_2_梨深VS梢_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=0;
					}
				}else if($i==12){
..//差分あり2
					if(#ev114_01_6_梨深キス2_a){
						$thum="ev114_01_6_梨深キス2_a";
						$pic_name12_1="ev/ev114_01_6_梨深キス2_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=2;
						$actCount12_name6=true;
						if(#ev114_02_6_梨深キス2_a){
							$pic_name12_1Dif_1="ev/ev114_02_6_梨深キス2_a";
						}else{
							$pic_name12_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev114_02_6_梨深キス2_a){
						$thum="ev114_02_6_梨深キス2_a";
						$pic_name12_1="extra/gallery/砂嵐not-seen";
						$pic_name12_1Dif_1="ev/ev114_02_6_梨深キス2_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=2;
						$actCount12_name6=true;
					}else{}
				}else if($i==13){
..//差分あり4
					if(#ev115_01_6_梨深瀕死_a){
						$thum="ev115_01_6_梨深瀕死_a";
						$pic_name13_1="ev/ev115_01_6_梨深瀕死_a";
						$pic_num13=1;
						$act13=0;
						$actCount13=4;
						$actCount13_name5=4;
						if(#ev115_02_6_梨深瀕死_a){$pic_name13_1Dif_1="ev/ev115_02_6_梨深瀕死_a";}
						else{$pic_name13_1Dif_1="extra/gallery/砂嵐not-seen";}
						if(#ev115_03_6_梨深瀕死_a){$pic_name13_1Dif_2="ev/ev115_03_6_梨深瀕死_a";}
						else{$pic_name13_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#ev115_04_6_梨深瀕死_a){$pic_name13_1Dif_3="ev/ev115_04_6_梨深瀕死_a";}
						else{$pic_name13_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#ev115_02_6_梨深瀕死_a){
						$thum="ev115_02_6_梨深瀕死_a";
						$pic_name13_1="extra/gallery/砂嵐not-seen";
						$pic_num13=1;
						$act13=0;
						$actCount13=4;
						$actCount13_name5=4;
						$pic_name13_1Dif_1="ev/ev115_02_6_梨深瀕死_a";
						if(#ev115_03_6_梨深瀕死_a){$pic_name13_1Dif_2="ev/ev115_03_6_梨深瀕死_a";}
						else{$pic_name13_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#ev115_04_6_梨深瀕死_a){$pic_name13_1Dif_3="ev/ev115_04_6_梨深瀕死_a";}
						else{$pic_name13_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#ev115_03_6_梨深瀕死_a){
						$thum="ev115_03_6_梨深瀕死_a";
						$pic_name13_1="extra/gallery/砂嵐not-seen";
						$pic_num13=1;
						$act13=0;
						$actCount13=4;
						$actCount13_name5=4;
						$pic_name13_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name13_1Dif_2="ev/ev115_03_6_梨深瀕死_a";
						if(#ev115_04_6_梨深瀕死_a){$pic_name13_1Dif_3="ev/ev115_04_6_梨深瀕死_a";}
						else{$pic_name13_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#ev115_04_6_梨深瀕死_a){
						$thum="ev115_04_6_梨深瀕死_a";
						$pic_name13_1="extra/gallery/砂嵐not-seen";
						$pic_num13=1;
						$act13=0;
						$actCount13=4;
						$actCount13_name5=4;
						$pic_name13_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name13_1Dif_2="extra/gallery/砂嵐not-seen";
						$pic_name13_1Dif_3="ev/ev115_05_6_梨深瀕死_a";
					}else{}
				}else if($i==14){
..//差分あり2
					if(#ev117_01_6_梨深殺せない_a){
						$thum="ev117_01_6_梨深殺せない_a";
						$pic_name14_1="ev/ev117_01_6_梨深殺せない_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=2;
						$actCount14_name6=true;
						if(#ev117_02_6_梨深殺せない_a){
							$pic_name14_1Dif_1="ev/ev117_02_6_梨深殺せない_a";
						}else{
							$pic_name14_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev117_02_6_梨深殺せない_a){
						$thum="ev117_02_6_梨深殺せない_a";
						$pic_name14_1="extra/gallery/砂嵐not-seen";
						$pic_name14_1Dif_1="ev/ev117_02_6_梨深殺せない_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=2;
						$actCount14_name6=true;
					}else{}
				}else if($i==15){
..//差分あり5
					if(#ev118_01_6_セナ密着_a){
						$thum="ev118_01_6_セナ密着_a";
						$pic_name15_1="ev/ev118_01_6_セナ密着_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=5;
						$actCount15_name6=true;
						if(#ev118_02_6_セナ密着_a){
						$pic_name15_1Dif_1="ev/ev118_02_6_セナ密着_a";
						}else{
						$pic_name15_1Dif_1="extra/gallery/砂嵐not-seen";
						}
						if(#ev118_03_6_セナ密着_a){$pic_name15_1Dif_2="ev/ev118_03_6_セナ密着_a";}
						else{$pic_name15_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#ev118_04_6_セナ密着_a){$pic_name15_1Dif_3="ev/ev118_04_6_セナ密着_a";}
						else{$pic_name15_1Dif_3="extra/gallery/砂嵐not-seen";}

						if(#ev118_05_6_セナ密着_a){$pic_name15_1Dif_4="ev/ev118_05_6_セナ密着_a";}
						else{$pic_name15_1Dif_4="extra/gallery/砂嵐not-seen";}

					}else if(#ev118_02_6_セナ密着_a){
						$thum="ev118_02_6_セナ密着_a";
						$pic_name15_1="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_1="ev/ev118_02_6_セナ密着_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=5;
						$actCount15_name6=true;
						if(#ev118_03_6_セナ密着_a){$pic_name15_1Dif_2="ev/ev118_03_6_セナ密着_a";}
						else{$pic_name15_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#ev118_04_6_セナ密着_a){$pic_name15_1Dif_3="ev/ev118_04_6_セナ密着_a";}
						else{$pic_name15_1Dif_3="extra/gallery/砂嵐not-seen";}
						if(#ev118_05_6_セナ密着_a){$pic_name15_1Dif_4="ev/ev118_05_6_セナ密着_a";}
						else{$pic_name15_1Dif_4="extra/gallery/砂嵐not-seen";}
		
					}else if(#ev118_03_6_セナ密着_a){
						$thum="ev118_03_6_セナ密着_a";
						$pic_name15_1="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_1="ev/ev118_02_6_セナ密着_a";
						$pic_name15_1Dif_2="ev/ev118_03_6_セナ密着_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=5;
						$actCount15_name6=true;
						if(#ev118_04_6_セナ密着_a){$pic_name15_1Dif_3="ev/ev118_04_6_セナ密着_a";}
						else{$pic_name15_1Dif_3="extra/gallery/砂嵐not-seen";}
						if(#ev118_05_6_セナ密着_a){$pic_name15_1Dif_4="ev/ev118_05_6_セナ密着_a";}
						else{$pic_name15_1Dif_4="extra/gallery/砂嵐not-seen";}

					}else if(#ev118_04_6_セナ密着_a){
						$thum="ev118_04_6_セナ密着_a";
						$pic_name15_1="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_2="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_3="ev/ev118_04_6_セナ密着_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=5;
						$actCount15_name6=true;
						if(#ev118_05_6_セナ密着_a){$pic_name15_1Dif_4="ev/ev118_05_6_セナ密着_a";}
						else{$pic_name15_1Dif_4="extra/gallery/砂嵐not-seen";}
		
					}else if(#ev118_05_6_セナ密着_a){
						$thum="ev118_05_6_セナ密着_a";
						$pic_name15_1="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_2="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_3="extra/gallery/砂嵐not-seen";
						$pic_name15_1Dif_4="ev/ev118_05_6_セナ密着_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=5;
						$actCount15_name6=true;
					}else{}
				}else if($i==16){
..//差分あり3
					if(#ev119_01_6_セナと赤ん坊_a){
					$thum="ev119_01_6_セナと赤ん坊_a";
					$pic_name16_1="ev/ev119_01_6_セナと赤ん坊_a";
					$pic_num16=1;
					$act16=0;
					$actCount16=3;
					$actCount16_name6=true;
						if(#ev119_02_6_セナと赤ん坊_a){
							if(#ev119_03_6_セナと赤ん坊_a){
								$pic_name16_1Dif_1="ev/ev119_02_6_セナと赤ん坊_a";
								$pic_name16_1Dif_2="ev/ev119_03_6_セナと赤ん坊_a";
							}else{
								$pic_name16_1Dif_1="ev/ev119_02_6_セナと赤ん坊_a";
								$pic_name16_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#ev119_03_6_セナと赤ん坊_a){
								$pic_name16_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name16_1Dif_2="ev/ev119_03_6_セナと赤ん坊_a";
							}else{
								$pic_name16_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name16_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#ev119_02_6_セナと赤ん坊_a){
						$thum="ev119_02_6_セナと赤ん坊_a";
						$pic_num16=1;
						$pic_name16_1="extra/gallery/砂嵐not-seen";
						$act16=0;
						$actCount16=3;
						$actCount16_name6=true;
							if(#ev119_03_6_セナと赤ん坊_a){
								$pic_name16_1Dif_1="ev/ev119_02_6_セナと赤ん坊_a";
								$pic_name16_1Dif_2="ev/ev119_03_6_セナと赤ん坊_a";
							}else{
								$pic_name16_1Dif_1="ev/ev119_02_6_セナと赤ん坊_a";
								$pic_name16_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#ev119_03_6_セナと赤ん坊_a){
						$thum="ev119_03_6_セナと赤ん坊_a";
						$pic_name16_1="extra/gallery/砂嵐not-seen";
						$pic_name16_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name16_1Dif_2="ev/ev119_03_6_セナと赤ん坊_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=3;
						$actCount16_name6=true;
					}else{}
				}else if($i==17){
..//差分あり
					if(#ev120_02_6_ノアⅡ破壊_a){
						$thum="ev120_02_6_ノアⅡ破壊_a";
						$pic_name17_1="ev/ev120_02_6_ノアⅡ破壊_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=2;
						$actCount17_name6=true;
						if(#ev120_01_6_ノアⅡ破壊_a){
							$pic_name17_1Dif_1="ev/ev120_01_6_ノアⅡ破壊_a";
						}else{
							$pic_name17_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev120_01_6_ノアⅡ破壊_a){
						$thum="ev120_01_6_ノアⅡ破壊_a";
						$pic_name17_1="extra/gallery/砂嵐not-seen";
						$pic_name17_1Dif_1="ev/ev120_01_6_ノアⅡ破壊_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=2;
						$actCount17_name6=true;
					}else{}
				}else if($i==18){
					if(#ev123_01_6_優愛押し倒し_a){
						$thum="ev123_01_6_優愛押し倒し_a";
						$pic_name18_1="ev/ev123_01_6_優愛押し倒し_a";
						$pic_num18=1;
						$act18=1;
						$actCount18=0;
					}
				}else if($i==19){
					if(#ev124_01_6_優愛脱ぐ_a){
						$thum="ev124_01_6_優愛脱ぐ_a";
						$pic_name19_1="ev/ev124_01_6_優愛脱ぐ_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=0;
					}
				}else if($i==20){
					if(#ev125_01_3_優愛すがりつき_a){
						$thum="ev125_01_3_優愛すがりつき_a";
						$pic_name20_1="ev/ev125_01_3_優愛すがりつき_a";
						$pic_num20=1;
						$act20=1;
						$actCount20=0;
					}
				}
..//page7
			}else if($p==7){
				if($i==1){
					if(#ev125_01_6_楠姉妹写真_a){
						$thum="ev125_01_6_楠姉妹写真_a";
						$pic_name1_1="ev/ev125_01_6_楠姉妹写真_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=0;
					}
				}else if($i==2){
					if(#ev130_01_6_あやせ空見上げ_a){
						$thum="ev130_01_6_あやせ空見上げ_a";
						$pic_name2_1="ev/ev130_01_6_あやせ空見上げ_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=0;
					}
				}else if($i==3){
					if(#ev127_01_6_あやせキス_a){
						$thum="ev127_01_6_あやせキス_a";
						$pic_name3_1="ev/ev127_01_6_あやせキス_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=0;
					}
				}else if($i==4){
..//差分あり
					if(#ev128_01_6_あやせしがみつき_a){
						$thum="ev128_01_6_あやせしがみつき_a";
						$pic_name4_1="ev/ev128_01_6_あやせしがみつき_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=2;
						$actCount4_name6=true;
						if(#ev128_02_6_あやせしがみつき_a){
							$pic_name4_1Dif_1="ev/ev128_02_6_あやせしがみつき_a";
						}else{
							$pic_name4_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev128_02_6_あやせしがみつき_a){
						$thum="ev128_02_6_あやせしがみつき_a";
						$pic_name4_1="extra/gallery/砂嵐not-seen";
						$pic_name4_1Dif_1="ev/ev128_02_6_あやせしがみつき_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=2;
						$actCount4_name6=true;
						}else{}
				}else if($i==5){
..//差分あり
					if(#ev129_01_6_あやせ投擲_a){
						$thum="ev129_01_6_あやせ投擲_a";
						$pic_name5_1="ev/ev129_01_6_あやせ投擲_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=2;
						$actCount5_name7=true;
						if(#ev129_02_6_あやせ投擲_a){
							$pic_name5_1Dif_1="ev/ev129_02_6_あやせ投擲_a";
						}else{
							$pic_name5_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev129_02_6_あやせ投擲_a){
						$thum="ev129_02_6_あやせ投擲_a";
						$pic_name5_1="extra/gallery/砂嵐not-seen";
						$pic_name5_1Dif_1="ev/ev129_02_6_あやせ投擲_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=2;
						$actCount5_name6=true;
						}else{}
				}else if($i==6){
..//差分あり
					if(#ev133_01_6_梢ほのぼの_a){
						$thum="ev133_01_6_梢ほのぼの_a";
						$pic_name6_1="ev/ev133_01_6_梢ほのぼの_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=4;
						$actCount6_name7=4;
						if(#ev133_02_6_梢ほのぼの_a){$pic_name6_1Dif_1="ev/ev133_02_6_梢ほのぼの_a";}
						else{$pic_name6_1Dif_1="extra/gallery/砂嵐not-seen";}
						if(#ev133_03_6_梢ほのぼの_a){$pic_name6_1Dif_2="ev/ev133_03_6_梢ほのぼの_a";}
						else{$pic_name6_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#ev133_04_6_梢ほのぼの_a){$pic_name6_1Dif_3="ev/ev133_04_6_梢ほのぼの_a";}
						else{$pic_name6_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#ev133_02_6_梢ほのぼの_a){
						$thum="ev133_02_6_梢ほのぼの_a";
						$pic_name6_1="extra/gallery/砂嵐not-seen";
						$pic_num6=1;
						$act6=0;
						$actCount6=4;
						$actCount6_name7=4;
						$pic_name6_1Dif_1="ev/ev133_02_6_梢ほのぼの_a";
						if(#ev133_03_6_梢ほのぼの_a){$pic_name6_1Dif_2="ev/ev133_03_6_梢ほのぼの_a";}
						else{$pic_name6_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#ev133_04_6_梢ほのぼの_a){$pic_name6_1Dif_3="ev/ev133_04_6_梢ほのぼの_a";}
						else{$pic_name6_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#ev133_03_6_梢ほのぼの_a){
						$thum="ev133_03_6_梢ほのぼの_a";
						$pic_name6_1="extra/gallery/砂嵐not-seen";
						$pic_num6=1;
						$act6=0;
						$actCount6=4;
						$actCount6_name7=4;
						$pic_name6_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name6_1Dif_2="ev/ev133_03_6_梢ほのぼの_a";
						if(#ev133_04_6_梢ほのぼの_a){$pic_name6_1Dif_3="ev/ev133_04_6_梢ほのぼの_a";}
						else{$pic_name6_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#ev133_04_6_梢ほのぼの_a){
						$thum="ev133_04_6_梢ほのぼの_a";
						$pic_name6_1="extra/gallery/砂嵐not-seen";
						$pic_num6=1;
						$act6=0;
						$actCount6=4;
						$actCount6_name7=4;
						$pic_name6_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name6_1Dif_2="extra/gallery/砂嵐not-seen";
						$pic_name6_1Dif_3="ev/ev133_04_6_梢ほのぼの_a";
					}else{}
				}else if($i==7){
..//差分あり
					if(#ev134_01_1_梢うずくまり_a){
						$thum="ev134_01_1_梢うずくまり_a";
						$pic_name7_1="ev/ev134_01_1_梢うずくまり_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=2;
						$actCount7_name7=true;
						if(#ev134_02_1_梢うずくまり_a){
							$pic_name7_1Dif_1="ev/ev134_02_1_梢うずくまり_a";
						}else{
							$pic_name7_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev134_02_1_梢うずくまり_a){
						$thum="ev134_02_1_梢うずくまり_a";
						$pic_name7_1="extra/gallery/砂嵐not-seen";
						$pic_name7_1Dif_1="ev/ev134_02_1_梢うずくまり_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=2;
						$actCount7_name7=true;
					}else{}
				}else if($i==8){
					if(#ev135_01_1_セナVS梢_a){
						$thum="ev135_01_1_セナVS梢_a";
						$pic_name8_1="ev/ev135_01_1_セナVS梢_a";
						$pic_num8=1;
						$act8=1;
						$actCount8=0;
					}
				}else if($i==9){
..//差分あり
					if(#ev136_01_1_梢空見上げ_a){
						$thum="ev136_01_1_梢空見上げ_a";
						$pic_name9_1="ev/ev136_01_1_梢空見上げ_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=2;
						$actCount9_name7=true;
						if(#ev136_02_1_梢空見上げ_a){
							$pic_name9_1Dif_1="ev/ev136_02_1_梢空見上げ_a";
						}else{
							$pic_name9_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev136_02_1_梢空見上げ_a){
						$thum="ev136_02_1_梢空見上げ_a";
						$pic_name9_1="extra/gallery/砂嵐not-seen";
						$pic_name9_1Dif_1="ev/ev136_02_1_梢空見上げ_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=2;
						$actCount9_name7=true;
					}else{}
				}else if($i==10){
..//差分あり
					if(#ev139_01_3_七海うずくまり_a){
						$thum="ev139_01_3_七海うずくまり_a";
						$pic_name10_1="ev/ev139_01_3_七海うずくまり_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=2;
						$actCount10_name7=true;
						if(#ev139_02_3_七海うずくまり_a){
							$pic_name10_1Dif_1="ev/ev139_02_3_七海うずくまり_a";
						}else{
							$pic_name10_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#ev139_02_3_七海うずくまり_a){
						$thum="ev136_02_1_梢空見上げ_a";
						$pic_name10_1="extra/gallery/砂嵐not-seen";
						$pic_name10_1Dif_1="ev/ev139_02_3_七海うずくまり_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=2;
						$actCount10_name7=true;
					}else{}
				}else if($i==11){
..//差分あり3
					if(#ev140_01_6_七海同衾_a){
					$thum="ev140_01_6_七海同衾_a";
					$pic_name11_1="ev/ev140_01_6_七海同衾_a";
					$pic_num11=1;
					$act11=0;
					$actCount11=3;
					$actCount11_name7=true;
						if(#ev140_02_6_七海同衾_a){
							if(#ev140_03_6_七海同衾_a){
								$pic_name11_1Dif_1="ev/ev140_02_6_七海同衾_a";
								$pic_name11_1Dif_2="ev/ev140_03_6_七海同衾_a";
							}else{
								$pic_name11_1Dif_1="ev/ev140_02_6_七海同衾_a";
								$pic_name11_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#ev140_03_6_七海同衾_a){
								$pic_name11_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name11_1Dif_2="ev/ev140_03_6_七海同衾_a";
							}else{
								$pic_name11_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name11_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#ev140_02_6_七海同衾_a){
						$thum="ev140_02_6_七海同衾_a";
						$pic_num11=1;
						$pic_name11_1="extra/gallery/砂嵐not-seen";
						$act11=0;
						$actCount11=3;
						$actCount11_name7=true;
							if(#ev140_03_6_七海同衾_a){
								$pic_name11_1Dif_1="ev/ev140_02_6_七海同衾_a";
								$pic_name11_1Dif_2="ev/ev140_03_6_七海同衾_a";
							}else{
								$pic_name11_1Dif_1="ev/ev140_02_6_七海同衾_a";
								$pic_name11_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#ev140_03_6_七海同衾_a){
						$thum="ev140_03_6_七海同衾_a";
						$pic_name11_1="extra/gallery/砂嵐not-seen";
						$pic_name11_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name11_1Dif_2="ev/ev140_03_6_七海同衾_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=3;
						$actCount11_name7=true;
					}else{}
				}else if($i==12){
					if(#ev141_01_1_七海キス_a){
						$thum="ev141_01_1_七海キス_a";
						$pic_name12_1="ev/ev141_01_1_七海キス_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=0;
					}
				}else if($i==13){
					if(#ev126_01_5_優愛空見上げ_a){
						$thum="ev126_01_5_優愛空見上げ_a";
						$pic_name13_1="ev/ev126_01_5_優愛空見上げ_a";
						$pic_num13=1;
						$act13=0;
						$actCount13=0;
					}
				}else if($i==14){
					if(#ev137_01_6_梢セナ空見上げ_a){
						$thum="ev137_01_6_梢セナ空見上げ_a";
						$pic_name14_1="ev/ev137_01_6_梢セナ空見上げ_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=0;
					}
				}else if($i==15){
					if(#ev999_01_1_おめでとう){
						$thum="ev999_01_1_おめでとう";
						$pic_name15_1="ev/ev999_01_1_おめでとう";
						$pic_num15=1;
						$act15=0;
						$actCount15=0;
					}
				}else if($i==16){
						$thum="over";
						$pic_name16_1="";
						$pic_num16=0;
						$act16=0;
				}else if($i==17){
						$thum="over";
						$pic_name17_1="";
						$pic_num17=0;
						$act17=0;
				}else if($i==18){
						$thum="over";
						$pic_name18_1="";
						$pic_num18=0;
						$act18=0;
				}else if($i==19){
						$thum="over";
						$pic_name19_1="";
						$pic_num19=0;
						$act19=0;
				}else if($i==20){
						$thum="over";
						$pic_name20_1="";
						$pic_num20=0;
						$act20=0;
				}
			}
..//B part
		}else if($c==2){
			//Fade("@BACK/MouseUsual/*",200,1000,null,false);
			//Fade("@NEXT/MouseUsual/*",200,1000,null,false);
			if($p==1){
..//差分あり3
				if($i==1){
					if(#bg001_01_1_崩壊渋谷_a){
					$thum="bg001_01_1_崩壊渋谷_a";
					$pic_name1_1="bg/bg001_01_1_崩壊渋谷_a";
					$pic_num1=1;
					$act1=0;
					$actCount1=3;
					$actCount1_name=true;
						if(#bg001_02_5_崩壊渋谷_a){
							if(#bg001_03_6_崩壊渋谷_a){
								$pic_name1_1Dif_1="bg/bg001_02_5_崩壊渋谷_a";
								$pic_name1_1Dif_2="bg/bg001_03_6_崩壊渋谷_a";
							}else{
								$pic_name1_1Dif_1="bg/bg001_02_5_崩壊渋谷_a";
								$pic_name1_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#bg001_03_6_崩壊渋谷_a){
								$pic_name1_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name1_1Dif_2="bg/bg001_03_6_崩壊渋谷_a";
							}else{
								$pic_name1_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name1_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#bg001_02_5_崩壊渋谷_a){
						$thum="bg001_02_5_崩壊渋谷_a";
						$pic_num1=1;
						$pic_name1_1="extra/gallery/砂嵐not-seen";
						$act1=0;
						$actCount1=3;
						$actCount1_name=true;
							if(#bg001_03_6_崩壊渋谷_a){
								$pic_name1_1Dif_1="bg/bg001_02_5_崩壊渋谷_a";
								$pic_name1_1Dif_2="bg/bg001_03_6_崩壊渋谷_a";
							}else{
								$pic_name1_1Dif_1="bg/bg001_02_5_崩壊渋谷_a";
								$pic_name1_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#bg001_03_6_崩壊渋谷_a.jpg){
						$thum="bg001_03_6_崩壊渋谷_a";
						$pic_name1_1="extra/gallery/砂嵐not-seen";
						$pic_name1_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name1_1Dif_2="bg/bg001_03_6_崩壊渋谷_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=3;
						$actCount1_name=true;
					}else{}
				}else if($i==2){
..//差分あり4
					if(#bg009_02_1_107_a){
						$thum="bg009_02_1_107_a";
						$pic_name2_1="bg/bg009_02_1_107_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=4;
						$actCount2_name=4;
						if(#bg009_02_2_107_a){$pic_name2_1Dif_1="bg/bg009_02_2_107_a";}
						else{$pic_name2_1Dif_1="extra/gallery/砂嵐not-seen";}
						if(#bg009_02_3_107_a){$pic_name2_1Dif_2="bg/bg009_02_3_107_a";}
						else{$pic_name2_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#bg009_03_5_107_a){$pic_name2_1Dif_3="bg/bg009_03_5_107_a";}
						else{$pic_name2_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#bg009_02_2_107_a){
						$thum="bg009_02_2_107_a";
						$pic_name2_1="extra/gallery/砂嵐not-seen";
						$pic_num2=1;
						$act2=0;
						$actCount2=4;
						$actCount2_name=4;
						$pic_name2_1Dif_1="bg/bg009_02_2_107_a";
						if(#bg009_02_3_107_a){$pic_name2_1Dif_2="bg/bg009_02_3_107_a";}
						else{$pic_name2_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#bg009_03_5_107_a){$pic_name2_1Dif_3="bg/bg009_03_5_107_a";}
						else{$pic_name2_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#bg009_02_3_107_a){
						$thum="bg009_02_3_107_a";
						$pic_name2_1="extra/gallery/砂嵐not-seen";
						$pic_num2=1;
						$act2=0;
						$actCount2=4;
						$actCount2_name=4;
						$pic_name2_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name2_1Dif_2="bg/bg009_02_3_107_a";
						if(#bg009_03_5_107_a){$pic_name2_1Dif_3="bg/bg009_03_5_107_a";}
						else{$pic_name2_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#bg009_03_5_107_a){
						$thum="bg009_03_5_107_a";
						$pic_name2_1="extra/gallery/砂嵐not-seen";
						$pic_num2=1;
						$act2=0;
						$actCount2=4;
						$actCount2_name=4;
						$pic_name2_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name2_1Dif_2="extra/gallery/砂嵐not-seen";
						$pic_name2_1Dif_3="bg/bg009_03_5_107_a";
					}else{}
				}else if($i==3){
..//差分あり3
					if(#bg006_01_1_コンテナ外観_a){
					$thum="bg006_01_1_コンテナ外観_a";
					$pic_name3_1="bg/bg006_01_1_コンテナ外観_a";
					$pic_num3=1;
					$act3=0;
					$actCount3=3;
					$actCount3_name=true;
						if(#bg006_01_2_コンテナ外観_a){
							if(#bg006_01_3_コンテナ外観_a){
								$pic_name3_1Dif_1="bg/bg006_01_2_コンテナ外観_a";
								$pic_name3_1Dif_2="bg/bg006_01_3_コンテナ外観_a";
							}else{
								$pic_name3_1Dif_1="bg/bg006_01_2_コンテナ外観_a";
								$pic_name3_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#bg006_01_3_コンテナ外観_a){
								$pic_name3_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name3_1Dif_2="bg/bg006_01_3_コンテナ外観_a";
							}else{
								$pic_name3_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name3_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#bg006_01_2_コンテナ外観_a){
						$thum="bg006_01_2_コンテナ外観_a";
						$pic_num3=1;
						$pic_name3_1="extra/gallery/砂嵐not-seen";
						$act3=0;
						$actCount3=3;
						$actCount3_name=true;
							if(#bg006_01_3_コンテナ外観_a){
								$pic_name3_1Dif_1="bg/bg006_01_2_コンテナ外観_a";
								$pic_name3_1Dif_2="bg/bg006_01_3_コンテナ外観_a";
							}else{
								$pic_name3_1Dif_1="bg/bg006_01_2_コンテナ外観_a";
								$pic_name3_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#bg006_01_3_コンテナ外観_a){
						$thum="bg006_01_3_コンテナ外観_a";
						$pic_name3_1="extra/gallery/砂嵐not-seen";
						$pic_name3_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name3_1Dif_2="bg/bg006_01_3_コンテナ外観_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=3;
						$actCount3_name=true;
					}else{}

				}else if($i==4){
					if(#bg026_02_3_拓巳部屋_a){
						$thum="bg026_02_3_拓巳部屋_a";
						$pic_name4_1="bg/bg026_02_3_拓巳部屋_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=0;
					}
				}else if($i==5){
..//差分あり3
					if(#bg027_01_3_道玄坂_a){
					$thum="bg027_01_3_道玄坂_a";
					$pic_name5_1="bg/bg027_01_3_道玄坂_a";
					$pic_num5=1;
					$act5=0;
					$actCount5=3;
					$actCount5_name=true;
						if(#bg027_02_2_chn道玄坂_a){
							if(#bg027_04_3_道玄坂_a){
								$pic_name5_1Dif_1="bg/bg027_02_2_chn道玄坂_a";
								$pic_name5_1Dif_2="bg/bg027_04_3_道玄坂_a";
							}else{
								$pic_name5_1Dif_1="bg/bg027_02_2_chn道玄坂_a";
								$pic_name5_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#bg027_04_3_道玄坂_a){
								$pic_name5_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name5_1Dif_2="bg/bg027_04_3_道玄坂_a";
							}else{
								$pic_name5_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name5_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#bg027_02_2_chn道玄坂_a){
						$thum="bg027_02_2_chn道玄坂_a";
						$pic_num5=1;
						$pic_name5_1="extra/gallery/砂嵐not-seen";
						$act5=0;
						$actCount5=3;
						$actCount5_name=true;
							if(#bg027_02_2_chn道玄坂_a){
								$pic_name5_1Dif_1="bg/bg027_02_2_chn道玄坂_a";
								$pic_name5_1Dif_2="bg/bg027_04_3_道玄坂_a";
							}else{
								$pic_name5_1Dif_1="bg/bg027_02_2_chn道玄坂_a";
								$pic_name5_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#bg027_04_3_道玄坂_a){
						$thum="bg027_04_3_道玄坂_a";
						$pic_name5_1="extra/gallery/砂嵐not-seen";
						$pic_name5_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name5_1Dif_2="bg/bg027_04_3_道玄坂_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=3;
						$actCount5_name3=true;
					}else{}
				}else if($i==6){
..//差分あり3
					if(#bg015_01_0_松濤公園_a){
					$thum="bg015_01_0_松濤公園_a";
					$pic_name6_1="bg/bg015_01_0_松濤公園_a";
					$pic_num6=1;
					$act6=0;
					$actCount6=3;
					$actCount6_name=true;
						if(#bg015_01_2_松濤公園_a){
							if(#bg015_01_3_松濤公園_a){
								$pic_name6_1Dif_1="bg/bg015_01_2_松濤公園_a";
								$pic_name6_1Dif_2="bg/bg015_01_3_松濤公園_a";
							}else{
								$pic_name6_1Dif_1="bg/bg015_01_2_松濤公園_a";
								$pic_name6_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#bg015_01_3_松濤公園_a){
								$pic_name6_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name6_1Dif_2="bg/bg015_01_3_松濤公園_a";
							}else{
								$pic_name6_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name6_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#bg015_01_2_松濤公園_a){
						$thum="bg015_01_2_松濤公園_a";
						$pic_num6=1;
						$pic_name6_1="extra/gallery/砂嵐not-seen";
						$act6=0;
						$actCount6=3;
						$actCount6_name=true;
							if(#bg015_01_3_松濤公園_a){
								$pic_name6_1Dif_1="bg/bg015_01_2_松濤公園_a";
								$pic_name6_1Dif_2="bg/bg015_01_3_松濤公園_a";
							}else{
								$pic_name6_1Dif_1="bg/bg015_01_2_松濤公園_a";
								$pic_name6_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#bg015_01_3_松濤公園_a){
						$thum="bg015_01_3_松濤公園_a";
						$pic_name6_1="extra/gallery/砂嵐not-seen";
						$pic_name6_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name6_1Dif_2="bg/bg015_01_3_松濤公園_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=3;
						$actCount6_name=true;
					}else{}
				}else if($i==7){
..//差分あり4
					if(#bg083_01_1_宮下公園_a){
						$thum="bg083_01_1_宮下公園_a";
						$pic_name7_1="bg/bg083_01_1_宮下公園_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=4;
						$actCount7_name=4;
						if(#bg083_03_1_宮下公園_a){$pic_name7_1Dif_1="bg/bg083_03_1_宮下公園_a";}
						else{$pic_name7_1Dif_1="extra/gallery/砂嵐not-seen";}
						if(#bg083_01_3_宮下公園_a){$pic_name7_1Dif_2="bg/bg083_01_3_宮下公園_a";}
						else{$pic_name7_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#bg083_02_3_宮下公園_a){$pic_name7_1Dif_3="bg/bg083_02_3_宮下公園_a";}
						else{$pic_name7_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#bg083_03_1_宮下公園_a){
						$thum="bg083_03_1_宮下公園_a";
						$pic_name7_1="extra/gallery/砂嵐not-seen";
						$pic_num7=1;
						$act7=0;
						$actCount7=4;
						$actCount7_name=4;
						$pic_name7_1Dif_1="bg/bg083_03_1_宮下公園_a";
						if(#bg083_01_3_宮下公園_a){$pic_name7_1Dif_2="bg/bg083_01_3_宮下公園_a";}
						else{$pic_name7_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#bg083_02_3_宮下公園_a){$pic_name7_1Dif_3="bg/bg083_01_3_宮下公園_a";}
						else{$pic_name7_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#bg083_01_3_宮下公園_a){
						$thum="bg083_01_3_宮下公園_a";
						$pic_name7_1="extra/gallery/砂嵐not-seen";
						$pic_num7=1;
						$act7=0;
						$actCount7=4;
						$actCount7_name=4;
						$pic_name7_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name7_1Dif_2="bg/bg083_01_3_宮下公園_a";
						if(#bg083_02_3_宮下公園_a){$pic_name7_1Dif_3="bg/bg083_02_3_宮下公園_a";}
						else{$pic_name7_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#bg083_02_3_宮下公園_a){
						$thum="bg009_03_5_107_a";
						$pic_name7_1="extra/gallery/砂嵐not-seen";
						$pic_num7=1;
						$act7=0;
						$actCount7=4;
						$actCount7_name=4;
						$pic_name7_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name7_1Dif_2="extra/gallery/砂嵐not-seen";
						$pic_name7_1Dif_3="bg/bg083_02_3_宮下公園_a";
					}else{}
				}else if($i==8){
..//差分あり3
					if(#bg165_01_3_OFRONT見上げ_a){
					$thum="bg165_01_3_OFRONT見上げ_a";
					$pic_name8_1="bg/bg165_01_3_O-FRONT見上げ_a";
					$pic_num8=1;
					$act8=0;
					$actCount8=3;
					$actCount8_name=true;
						if(#bg165_02_3_OFRONT見上げ_a){
							if(#bg165_02_3_OFRONT見上げ_a){
								$pic_name8_1Dif_1="bg/bg165_02_3_O-FRONT見上げ_a";
								$pic_name8_1Dif_2="bg/bg165_03_3_O-FRONT見上げ_a";
							}else{
								$pic_name8_1Dif_1="bg/bg165_02_3_O-FRONT見上げ_a";
								$pic_name8_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#bg165_03_3_OFRONT見上げ_a){
								$pic_name8_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name8_1Dif_2="bg/bg165_03_3_O-FRONT見上げ_a";
							}else{
								$pic_name8_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name8_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#bg165_02_3_OFRONT見上げ_a){
						$thum="bg165_02_3_OFRONT見上げ_a";
						$pic_num8=1;
						$pic_name8_1="extra/gallery/砂嵐not-seen";
						$act8=0;
						$actCount8=3;
						$actCount8_name=true;
							if(#bg165_03_3_O-FRONT見上げ_a){
								$pic_name8_1Dif_1="bg/bg165_02_3_O-FRONT見上げ_a";
								$pic_name8_1Dif_2="bg/bg165_03_3_O-FRONT見上げ_a";
							}else{
								$pic_name8_1Dif_1="bg/bg165_02_3_O-FRONT見上げ_a";
								$pic_name8_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#bg165_03_3_O-FRONT見上げ_a){
						$thum="bg165_03_3_O-FRONT見上げ_a";
						$pic_name8_1="extra/gallery/砂嵐not-seen";
						$pic_name8_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name8_1Dif_2="bg/bg165_03_3_O-FRONT見上げ_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=3;
						$actCount8_name=true;
					}else{}
				}else if($i==9){
					if(#bg065_01_2_ゲロカエルン店店内_a){
						$thum="bg065_01_2_ゲロカエルン店店内_a";
						$pic_name9_1="bg/bg065_01_2_ゲロカエルン店店内_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=0;
					}
				}else if($i==10){
					if(#bg134_01_1_武器コーナー_a){
						$thum="bg134_01_1_武器コーナー_a";
						$pic_name10_1="bg/bg134_01_1_武器コーナー_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=0;
					}
				}else if($i==11){
					if(#bg154_01_1_渋谷の白い空_a){
						$thum="bg154_01_1_渋谷の白い空_a";
						$pic_name11_1="bg/bg154_01_1_渋谷の白い空_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=0;
					}
				}else if($i==12){
					if(#ev047_01_1_張り付け死体現場写真_a){
						$thum="ev047_01_1_張り付け死体現場写真_a";
						$pic_name12_1="ev/ev047_01_1_張り付け死体現場写真_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=0;
					}
				}else if($i==13){
					if(#ev048_01_1_張り付けグロ絵アップ_a){
						$thum="ev048_01_1_張り付けグロ絵アップ_a";
						$pic_name13_1="ev/ev048_01_1_張り付けグロ絵アップ_a";
						$pic_num13=1;
						$act13=0;
						$actCount13=0;
					}
				}else if($i==14){
					if(#ev053_01_1_集団ダイブ現場写真_a){
						$thum="ev053_01_1_集団ダイブ現場写真_a";
						$pic_name14_1="ev/ev053_01_1_集団ダイブ現場写真_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=0;
					}
				}else if($i==15){
					if(#bg142_01_3_ミュウツベ集団ダイブ_a){
						$thum="bg142_01_3_ミュウツベ集団ダイブ_a";
						$pic_name15_1="bg/bg142_01_3_ミュウツベ集団ダイブ_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=0;
					}
				}else if($i==16){
					if(#ev046_01_1_妊娠男現場写真_a){
						$thum="ev046_01_1_妊娠男現場写真_a";
						$pic_name16_1="ev/ev046_01_1_妊娠男現場写真_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=0;
					}
				}else if($i==17){
					if(#ev049_01_1_ヴァンパイ屋現場写真_a){
						$thum="ev049_01_1_ヴァンパイ屋現場写真_a";
						$pic_name17_1="ev/ev049_01_1_ヴァンパイ屋現場写真_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=0;
					}
				}else if($i==18){
					if(#bg011_01_1_検索欄UP_a){
						$thum="bg011_01_1_検索欄UP_a";
						$pic_name18_1="bg/bg011_01_1_検索欄UP_a";
						$pic_num18=1;
						$act18=0;
						$actCount18=0;
					}
				}else if($i==19){
..//差分あり2
					if(#bg012_01_1_ニュースサイト_a){
						$thum="bg012_01_1_ニュースサイト_a";
						$pic_name19_1="bg/bg012_01_1_ニュースサイト_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=2;
						$actCount19_name=true;
						if(#bg012_02_1_ニュースサイト_a){
							$pic_name19_1Dif_1="bg/bg012_02_1_ニュースサイト_a";
						}else{
							$pic_name19_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#bg012_02_1_ニュースサイト_a){
						$thum="bg012_02_1_ニュースサイト_a";
						$pic_name19_1="extra/gallery/砂嵐not-seen";
						$pic_name19_1Dif_1="bg/bg012_02_1_ニュースサイト_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=2;
						$actCount19_name=true;
					}else{}
				}else if($i==20){
					if(#bg117_01_3_PC画面ニュージェネ_a){
						$thum="bg117_01_3_PC画面ニュージェネ_a";
						$pic_name20_1="bg/bg117_01_3_PC画面ニュージェネ_a";
						$pic_num20=1;
						$act20=0;
						$actCount20=0;
					}
				}
			}else if($p==2){
				if($i==1){
					if(#bg120_01_3_PC画面その目_a){
						$thum="bg120_01_3_PC画面その目_a";
						$pic_name1_1="bg/bg120_01_3_PC画面その目_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=0;
					}
				}else if($i==2){
					if(#bg125_01_3_PC画面ファンタズム公式_a){
						$thum="bg125_01_3_PC画面ファンタズム公式_a";
						$pic_name2_1="bg/bg125_01_3_PC画面ファンタズム公式_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=0;
					}
				}else if($i==3){
					if(#bg128_01_3_ネットオークション_a){
						$thum="bg128_01_3_ネットオークション_a";
						$pic_name3_1="bg/bg128_01_3_ネットオークション_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=0;
					}
				}else if($i==4){
					if(#bg141_01_3_PC画面del検索結果_a){
						$thum="bg141_01_3_PC画面del検索結果_a";
						$pic_name4_1="bg/bg141_01_3_PC画面del検索結果_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=0;
					}
				}else if($i==5){
..//差分あり2
					if(#bg152_01_1_AH会HP_a){
						$thum="bg152_01_1_AH会HP_a";
						$pic_name5_1="bg/bg152_01_1_AH会HP_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=2;
						$actCount5_name2=true;
						if(#bg153_01_1_あやせの詩_a){
							$pic_name5_1Dif_1="bg/bg153_01_1_あやせの詩_a";
						}else{
							$pic_name5_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#bg153_01_1_あやせの詩_a){
						$thum="bg153_01_1_あやせの詩_a";
						$pic_name5_1="extra/gallery/砂嵐not-seen";
						$pic_name5_1Dif_1="bg/bg153_01_1_あやせの詩_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=2;
						$actCount5_name2=true;
					}else{}
				}else if($i==6){
..//差分あり2
					if(#bg183_01_3_PC画面ZACO‐DQN_a){
						$thum="bg183_01_3_PC画面ZACODQN_a";
						$pic_name6_1="bg/bg183_01_3_PC画面ZACO-DQN_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=2;
						$actCount6_name2=true;
						if(#bg183_02_3_PC画面ZACO‐DQN_a){
							$pic_name6_1Dif_1="bg/bg183_02_3_PC画面ZACO-DQN_a";
						}else{
							$pic_name6_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#bg183_02_3_PC画面ZACO‐DQN_a){
						$thum="bg183_02_3_PC画面ZACODQN_a";
						$pic_name6_1="extra/gallery/砂嵐not-seen";
						$pic_name6_1Dif_1="bg/bg183_02_3_PC画面ZACO-DQN_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=2;
						$actCount6_name2=true;
					}else{}
				}else if($i==7){
					if(#bg202_01_1_希グループｗｅｂサイト_a){
						$thum="bg202_01_1_希グループｗｅｂサイト_a";
						$pic_name7_1="bg/bg202_01_1_希グループｗｅｂサイト_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=0;
					}
				}else if($i==8){
					if(#bg203_01_1_ゲロカエルん偽通販サイト_a){
						$thum="bg203_01_1_ゲロカエルん偽通販サイト_a";
						$pic_name8_1="bg/bg203_01_1_ゲロカエルん偽通販サイト_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=0;
					}
				}else if($i==9){
					if(#ev014_01_1_スプー_a){
						$thum="ev014_01_1_スプー_a";
						$pic_name9_1="ev/ev014_01_1_スプー_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=0;
					}
				}else if($i==10){
					if(#bg155_01_1_Ir2_a){
						$thum="bg155_01_1_Ir2_a";
						$pic_name10_1="bg/bg155_01_1_Ir2_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=0;
					}
				}else if($i==11){
					if(#bg127_01_2_ギョロリゲロカエルん_a){
						$thum="bg127_01_2_ギョロリゲロカエルん_a";
						$pic_name11_1="bg/bg127_01_2_ギョロリゲロカエルん_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=0;
					}
				}else if($i==12){
					if(#bg181_01_3_捨てられたギョロリ_a){
						$thum="bg181_01_3_捨てられたギョロリ_a";
						$pic_name12_1="bg/bg181_01_3_捨てられたギョロリ_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=0;
					}
				}else if($i==13){
					if(#bg004_01_1_作文用紙その目_a){
						$thum="bg004_01_1_作文用紙その目_a";
						$pic_name13_1="bg/bg004_01_1_作文用紙その目_a";
						$pic_num13=1;
						$act13=0;
						$actCount13=0;
					}
				}else if($i==14){
					if(#bg022_01_0_黒板その目_a){
						$thum="bg022_01_0_黒板その目_a";
						$pic_name14_1="bg/bg022_01_0_黒板その目_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=0;
					}
				}else if($i==15){
					if(#bg171_01_3_カルテその目_a){
						$thum="bg171_01_3_カルテその目_a";
						$pic_name15_1="bg/bg171_01_3_カルテその目_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=0;
					}
				}else if($i==16){
..//差分あり2
					if(#bg143_01_1_生徒手帳_a){
						$thum="bg143_01_1_生徒手帳_a";
						$pic_name16_1="bg/bg143_01_1_生徒手帳_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=2;
						$actCount16_name2=true;
						if(#bg144_01_1_生徒手帳その目_a){
							$pic_name16_1Dif_1="bg/bg144_01_1_生徒手帳その目_a";
						}else{
							$pic_name16_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#bg144_01_1_生徒手帳その目_a){
						$thum="bg144_01_1_生徒手帳その目_a";
						$pic_name16_1="extra/gallery/砂嵐not-seen";
						$pic_name16_1Dif_1="bg/bg144_01_1_生徒手帳その目_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=2;
						$actCount16_name2=true;
					}else{}
				}else if($i==17){
					if(#bg159_02_1_PC画面メールソフト_a){
						$thum="bg159_02_1_PC画面メールソフト_a";
						$pic_name17_1="bg/bg159_02_1_PC画面メールソフト_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=0;
					}
				}else if($i==18){
					if(#bg168_01_3_ダーススパイダーメット_a){//徒歩修正
						$thum="bg168_01_3_ダーススパイダーメット_a";
						$pic_name18_1="bg/bg168_01_3_ダーススパイダーメット_a";
						$pic_num18=1;
						$act18=0;
						$actCount18=0;
					}
				}else if($i==19){
..//差分あり2
					if(#bg186_01_1_たなびくタオル_a){
						$thum="bg186_01_1_たなびくタオル_a";
						$pic_name19_1="bg/bg186_01_1_たなびくタオル_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=2;
						$actCount19_name2=true;
						if(#bg186_02_1_たなびくタオル_a){
							$pic_name19_1Dif_1="bg/bg186_02_1_たなびくタオル_a";
						}else{
							$pic_name19_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#bg186_02_1_たなびくタオル_a){
						$thum="bg186_02_1_たなびくタオル_a";
						$pic_name19_1="extra/gallery/砂嵐not-seen";
						$pic_name19_1Dif_1="bg/bg186_02_1_たなびくタオル_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=2;
						$actCount19_name2=true;
					}else{}
				}else if($i==20){
					if(#bg180_01_1_アイスその目_a){
						$thum="bg180_01_1_アイスその目_a";
						$pic_name20_1="bg/bg180_01_1_アイスその目_a";
						$pic_num20=1;
						$act20=0;
						$actCount20=0;
					}
				}
..//c2p3
			}else if($p==3){
				if($i==1){
					if(#ev142_01_1_七海その目誰の目_a){
						$thum="ev142_01_1_七海その目誰の目_a";
						$pic_name1_1="ev/ev142_01_1_七海その目誰の目_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=0;
					}
				}else if($i==2){
..//差分あり2
					if(#bg147_01_2_ディソード想像_a){
						$thum="bg147_01_2_ディソード想像_a";
						$pic_name2_1="bg/bg147_01_2_ディソード想像_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=2;
						$actCount2_name3=true;
						if(#bg147_02_6_ディソード想像_a){
							$pic_name2_1Dif_1="bg/bg147_02_6_ディソード想像_a";
						}else{
							$pic_name2_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#bg147_02_6_ディソード想像_a){
						$thum="bg147_02_6_ディソード想像_a";
						$pic_name2_1="extra/gallery/砂嵐not-seen";
						$pic_name2_1Dif_1="bg/bg147_02_6_ディソード想像_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=2;
						$actCount2_name3=true;
					}else{}
				}else if($i==3){
					if(#bg037_01_2_焼却炉中_a){
						$thum="bg037_01_2_焼却炉中_a";
						$pic_name3_1="bg/bg037_01_2_焼却炉中_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=0;
					}
				}else if($i==4){
..//差分あり2
					if(#bg040_01_2_優愛カバン_a){
						$thum="bg040_01_2_優愛カバン_a";
						$pic_name4_1="bg/bg040_01_2_優愛カバン_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=2;
						$actCount4_name3=true;
						if(#bg041_01_2_優愛カバンぶちまけ_a){
							$pic_name4_1Dif_1="bg/bg041_01_2_優愛カバンぶちまけ_a";
						}else{
							$pic_name4_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#bg041_01_2_優愛カバンぶちまけ_a){
						$thum="bg041_01_2_優愛カバンぶちまけ_a";
						$pic_name4_1="extra/gallery/砂嵐not-seen";
						$pic_name4_1Dif_1="bg/bg041_01_2_優愛カバンぶちまけ_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=2;
						$actCount4_name3=true;
					}else{}
				}else if($i==5){
					if(#ev051_01_3_清掃員_a){
						$thum="ev051_01_3_清掃員_a";
						$pic_name5_1="ev/ev051_01_3_清掃員_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=0;
					}
				}else if($i==6){
..//差分あり2
					if(#ev061_01_2_ニュージェネ犯人逮捕TV_a){
						$thum="ev061_01_2_ニュージェネ犯人逮捕TV_a";
						$pic_name6_1="ev/ev061_01_2_ニュージェネ犯人逮捕TV_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=2;
						$actCount6_name3=true;
						if(#bg213_01_6_ニュースDQNパズル_a){
							$pic_name6_1Dif_1="bg/bg213_01_6_ニュースDQNパズル_a";
						}else{
							$pic_name6_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#bg213_01_6_ニュースDQNパズル_a){
						$thum="bg213_01_6_ニュースDQNパズル_a";
						$pic_name6_1="extra/gallery/砂嵐not-seen";
						$pic_name6_1Dif_1="bg/bg213_01_6_ニュースDQNパズル_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=2;
						$actCount6_name3=true;
					}else{}
				}else if($i==7){
					if(#ev074_01_1_洗脳部隊inモニター_a){
						$thum="ev074_01_1_洗脳部隊inモニター_a";
						$pic_name7_1="ev/ev074_01_1_洗脳部隊inモニター_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=0;
					}
				}else if($i==8){
					if(#bg085_04_3_スクランブル交差点_a){
						$thum="bg085_04_3_スクランブル交差点_a";
						$pic_name8_1="bg/bg085_04_3_スクランブル交差点_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=0;
					}
				}else if($i==9){
					if(#bg151_01_1_デッドスポット_a){
						$thum="bg151_01_1_デッドスポット_a";
						$pic_name9_1="bg/bg151_01_1_デッドスポット_a";
						$pic_num9=1;
						$act9=0;
						$actCount9=0;
					}
				}else if($i==10){
					if(#bg158_03_1_ニュース地震_a){
						$thum="bg158_03_1_ニュース地震_a";
						$pic_name10_1="bg/bg158_03_1_ニュース地震_a";
						$pic_num10=1;
						$act10=0;
						$actCount10=0;
					}
				}else if($i==11){
..//差分あり3：４に修正【09/01/21】
					if(#bg160_01_3_ダンボール箱_a){
						$thum="bg160_01_3_ダンボール箱_a";
						$pic_name11_1="bg/bg160_01_3_ダンボール箱_a";
						$pic_num11=1;
						$act11=0;
						$actCount11=4;
						$actCount11_name3=4;
						if(#bg160_02_3_ダンボール箱_a){$pic_name11_1Dif_1="bg/bg160_02_3_ダンボール箱_a";}
						else{$pic_name11_1Dif_1="extra/gallery/砂嵐not-seen";}
						if(#bg160_03_3_ダンボール箱_a){$pic_name11_1Dif_2="bg/bg160_03_3_ダンボール箱_a";}
						else{$pic_name11_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#bg160_03_3_chnダンボール箱_a){$pic_name11_1Dif_3="bg/bg160_03_3_chnダンボール箱_a";}
						else{$pic_name11_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#bg160_02_3_ダンボール箱_a){
						$thum="bg160_02_3_ダンボール箱_a";
						$pic_name11_1="extra/gallery/砂嵐not-seen";
						$pic_num11=1;
						$act11=0;
						$actCount11=4;
						$actCount11_name=4;
						$pic_name11_1Dif_1="bg/#bg160_02_3_ダンボール箱_a";
						if(#bg160_03_3_ダンボール箱_a){$pic_name11_1Dif_2="bg/bg160_03_3_ダンボール箱_a";}
						else{$pic_name11_1Dif_2="extra/gallery/砂嵐not-seen";}
						if(#bg160_03_3_chnダンボール箱_a){$pic_name11_1Dif_3="bg/bg160_03_3_chnダンボール箱_a";}
						else{$pic_name11_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#bg160_03_3_ダンボール箱_a){
						$thum="bg160_03_3_ダンボール箱_a";
						$pic_name11_1="extra/gallery/砂嵐not-seen";
						$pic_num11=1;
						$act11=0;
						$actCount11=4;
						$actCount11_name=4;
						$pic_name11_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name11_1Dif_2="bg/bg160_03_3_ダンボール箱_a";
						if(#bg160_03_3_chnダンボール箱_a){$pic_name11_1Dif_3="bg/bg160_03_3_chnダンボール箱_a";}
						else{$pic_name11_1Dif_3="extra/gallery/砂嵐not-seen";}
					}else if(#bg160_03_3_chnダンボール箱_a){
						$thum="bg009_03_5_107_a";
						$pic_name11_1="extra/gallery/砂嵐not-seen";
						$pic_num11=1;
						$act11=0;
						$actCount11=4;
						$actCount11_name=4;
						$pic_name11_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name11_1Dif_2="extra/gallery/砂嵐not-seen";
						$pic_name11_1Dif_3="bg/bg083_02_3_宮下公園_a";
					}else{}
				}else if($i==12){
					if(#bg182_01_3_手描きのクマの絵_a){
						$thum="bg182_01_3_手描きのクマの絵_a";
						$pic_name12_1="bg/bg182_01_3_手描きのクマの絵_a";
						$pic_num12=1;
						$act12=0;
						$actCount12=0;
					}
				}else if($i==13){
					if(#bg185_01_1_あやせ下着_a){
						$thum="bg185_01_1_あやせ下着_a";
						$pic_name13_1="bg/bg185_01_1_あやせ下着_a";
						$pic_num13=1;
						$act13=0;
						$actCount13=0;
					}
				}else if($i==14){
					if(#bg197_01_3_渋谷駅東口とプラネタリウム_a){
						$thum="bg197_01_3_渋谷駅東口とプラネタリウム_a";
						$pic_name14_1="bg/bg197_01_3_渋谷駅東口とプラネタリウム_a";
						$pic_num14=1;
						$act14=0;
						$actCount14=0;
					}
				}else if($i==15){
					if(#bg200_01_6_ノアIIのあるドーム内_a){
						$thum="bg200_01_6_ノアIIのあるドーム内_a";
						$pic_name15_1="bg/bg200_01_6_ノアIIのあるドーム内_a";
						$pic_num15=1;
						$act15=0;
						$actCount15=0;
					}
				}else if($i==16){
					if(#bg211_01_5_黄色いバングル_a){
						$thum="bg211_01_5_黄色いバングル_a";
						$pic_name16_1="bg/bg211_01_5_黄色いバングル_a";
						$pic_num16=1;
						$act16=0;
						$actCount16=0;
					}
				}else if($i==17){
					if(#bg205_01_3_あやせディソードリアルブート_a){
						$thum="bg205_01_3_あやせディソードリアルブート_a";
						$pic_name17_1="bg/bg205_01_3_あやせディソードリアルブート_a";
						$pic_num17=1;
						$act17=0;
						$actCount17=0;
					}
				}else if($i==18){
..//差分あり3
					if(#bg213_01_6_chn渋谷駅コインロッカー_a){
					$thum="bg213_01_6_chn渋谷駅コインロッカー_a";
					$pic_name18_1="bg/bg213_01_6_chn渋谷駅コインロッカー_a";
					$pic_num18=1;
					$act18=0;
					$actCount18=3;
					$actCount18_name3=true;
						if(#bg214_01_6_chn渋谷駅ロッカー閉じ_a){
							if(#bg214_02_6_chn渋谷駅ロッカー開き_a){
								$pic_name18_1Dif_1="bg/bg214_01_6_chn渋谷駅ロッカー閉じ_a";
								$pic_name18_1Dif_2="bg/bg214_02_6_chn渋谷駅ロッカー開き_a";
							}else{
								$pic_name18_1Dif_1="bg/bg214_01_6_chn渋谷駅ロッカー閉じ_a";
								$pic_name18_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}else{
							if(#bg214_02_6_chn渋谷駅ロッカー開け_a){
								$pic_name18_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name18_1Dif_2="bg/bg214_02_6_chn渋谷駅ロッカー開き_a";
							}else{
								$pic_name18_1Dif_1="extra/gallery/砂嵐not-seen";
								$pic_name18_1Dif_2="extra/gallery/砂嵐not-seen";
							}
						}
					}else if(#bg214_01_6_chn渋谷駅ロッカー閉じ_a){
						$thum="bg214_01_6_chn渋谷駅ロッカー閉じ_a";
						$pic_num18=1;
						$pic_name18_1="extra/gallery/砂嵐not-seen";
						$act18=0;
						$actCount18=3;
						$actCount18_name3=true;
							if(#bg214_02_6_chn渋谷駅ロッカー開け_a){
								$pic_name18_1Dif_1="bg/bg214_01_6_chn渋谷駅ロッカー閉じ_a";
								$pic_name18_1Dif_2="bg/bg214_02_6_chn渋谷駅ロッカー開き_a";
							}else{
								$pic_name18_1Dif_1="bg/bg214_01_6_chn渋谷駅ロッカー閉じ_a";
								$pic_name18_1Dif_2="extra/gallery/砂嵐not-seen";
							}
					}else if(#bg214_02_6_chn渋谷駅ロッカー開き_a){
						$thum="bg214_02_6_chn渋谷駅ロッカー開き_a";
						$pic_name18_1="extra/gallery/砂嵐not-seen";
						$pic_name18_1Dif_1="extra/gallery/砂嵐not-seen";
						$pic_name18_1Dif_2="bg/bg214_02_6_chn渋谷駅ロッカー開き_a";
						$pic_num18=1;
						$act18=0;
						$actCount18=3;
						$actCount18_name3=true;
					}else{}
				}else if($i==19){
					if(#bg224_01_6_chnグラジオール文庫本_a){
						$thum="bg224_01_6_chnグラジオール文庫本_a";
						$pic_name19_1="bg/bg224_01_6_chnグラジオール文庫本_a";
						$pic_num19=1;
						$act19=0;
						$actCount19=0;
					}
				}else if($i==20){
					if(#bg234_01_6_chnビーズコレクション_a){
						$thum="bg234_01_6_chnビーズコレクション_a";
						$pic_name20_1="bg/bg234_01_6_chnビーズコレクション_a";
						$pic_num20=1;
						$act20=0;
						$actCount20=0;
					}
				}
..//page4
			}else if($p==4){
				if($i==1){
..//差分あり2
					if(#bg236_01_6_chn美愛の日記_a){
						$thum="bg236_01_6_chn美愛の日記_a";
						$pic_name1_1="bg/bg236_01_6_chn美愛の日記_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=2;
						$actCount1_name4=true;
						if(#bg236_02_6_chn美愛の日記内容_a){
							$pic_name1_1Dif_1="bg/bg236_02_6_chn美愛の日記内容_a";
						}else{
							$pic_name1_1Dif_1="extra/gallery/砂嵐not-seen";
						}
					}else if(#bg236_02_6_chn美愛の日記内容_a){
						$thum="bg236_02_6_chn美愛の日記内容_a";
						$pic_name1_1="extra/gallery/砂嵐not-seen";
						$pic_name1_1Dif_1="bg/bg236_02_6_chn美愛の日記内容_a";
						$pic_num1=1;
						$act1=0;
						$actCount1=2;
						$actCount1_name4=true;
					}else{}
				}else if($i==2){
					if(#bg239_01_6_chnディソード全体_拓巳_a){
						$thum="bg239_01_6_chnディソード全体_拓巳_a";
						$pic_name2_1="bg/bg239_01_6_chnディソード全体_拓巳_a";
						$pic_num2=1;
						$act2=0;
						$actCount2=0;
					}
				}else if($i==3){
					if(#bg240_01_6_chnディソード全体_梨深_a){
						$thum="bg240_01_6_chnディソード全体_梨深_a";
						$pic_name3_1="bg/bg240_01_6_chnディソード全体_梨深_a";
						$pic_num3=1;
						$act3=0;
						$actCount3=0;
					}
				}else if($i==4){
					if(#bg241_01_6_chnディソード全体_七海_a){
						$thum="bg241_01_6_chnディソード全体_七海_a";
						$pic_name4_1="bg/bg241_01_6_chnディソード全体_七海_a";
						$pic_num4=1;
						$act4=0;
						$actCount4=0;
					}
				}else if($i==5){
					if(#bg242_01_6_chnディソード全体_あやせ_a){
						$thum="bg242_01_6_chnディソード全体_あやせ_a";
						$pic_name5_1="bg/bg242_01_6_chnディソード全体_あやせ_a";
						$pic_num5=1;
						$act5=0;
						$actCount5=0;
					}
				}else if($i==6){
					if(#bg244_01_6_chnディソード全体_梢_a){
						$thum="bg244_01_6_chnディソード全体_梢_a";
						$pic_name6_1="bg/bg244_01_6_chnディソード全体_梢_a";
						$pic_num6=1;
						$act6=0;
						$actCount6=0;
					}
				}else if($i==7){
					if(#bg243_01_6_chnディソード全体_セナ_a){
						$thum="bg243_01_6_chnディソード全体_セナ_a";
						$pic_name7_1="bg/bg243_01_6_chnディソード全体_セナ_a";
						$pic_num7=1;
						$act7=0;
						$actCount7=0;
					}
				}else if($i==8){
					if(#bg245_01_6_chnディソード全体_優愛_a){
						$thum="bg245_01_6_chnディソード全体_優愛_a";
						$pic_name8_1="bg/bg245_01_6_chnディソード全体_優愛_a";
						$pic_num8=1;
						$act8=0;
						$actCount8=0;
					}
				}else if($i==9){
						$thum="over";
						$pic_name9_1="";
						$pic_num9=0;
						$act9=0;
						$actCount9=0;
				}else if($i==10){
						$thum="over";
						$pic_name10_1="";
						$pic_num10=0;
						$act10=0;
						$actCount10=0;
				}else if($i==11){
						$thum="over";
						$pic_name11_1="";
						$pic_num11=0;
						$act11=0;
						$actCount11=0;
				}else if($i==12){
						$thum="over";
						$pic_name12_1="";
						$pic_num12=0;
						$act12=0;
						$actCount12=0;
				}else if($i==13){
						$thum="over";
						$pic_name13_1="";
						$pic_num13=0;
						$act13=0;
						$actCount13=0;
				}else if($i==14){
						$thum="over";
						$pic_name14_1="";
						$pic_num14=0;
						$act14=0;
						$actCount14=0;
				}else if($i==15){
						$thum="over";
						$pic_name15_1="";
						$pic_num15=0;
						$act15=0;
						$actCount15=0;
				}else if($i==16){
						$thum="over";
						$pic_name16_1="";
						$pic_num16=0;
						$act16=0;
						$actCount16=0;
				}else if($i==17){
						$thum="over";
						$pic_name17_1="";
						$pic_num17=0;
						$act17=0;
						$actCount17=0;
				}else if($i==18){
						$thum="over";
						$pic_name18_1="";
						$pic_num18=0;
						$act18=0;
						$actCount18=0;
				}else if($i==19){
						$thum="over";
						$pic_name19_1="";
						$pic_num19=0;
						$act19=0;
						$actCount19=0;
				}else if($i==20){
						$thum="over";
						$pic_name20_1="";
						$pic_num20=0;
						$act20=0;
						$actCount20=0;
				}
			}
		}

		$z=1200;
		if($thum=="nopic"||$thum=="over"){
			if($thum=="over"){$z=0;$No_Data=true;}
			$thum="cg/extra/gallery/NONEサムネール.png";
		}else{
			$thum="cg/extra/gallery/thum/"+$thum+".jpg";
		}

		$img="img_"+$i;

		LoadImage($img,$thum);

		$nut="CG_"+$i;

		CreateChoice($nut);

		$nut=$i+"_img";
		CreateTexture($nut,$z,$x,$y,$img);
		Fade($nut, 0, 600, null, true);

		$nut="CG_"+$i+"/MouseUsual/img";
		$nut2="CG_"+$i+"/MouseOver/img";
		$nut3="Over_"+$i;
		$nut4="CG_"+$i+"/MouseClick/img";

		CreateTexture($nut,0,$x,$y,$img);
	if($No_Data==true){
	$No_Data=false;
	}else{
		CreateTexture($nut2,1399,$x,$y,$img);
		CreateTexture($nut4,1400,$x,$y,$img);
		SetAlias("$nut2", "$nut2");
		SetAlias("$nut4", "$nut4");

	}

		Fade($nut2, 0, 0, null, true);
		Fade($nut4, 0, 0, null, true);


		$x+=177;
		$i++;
		if($i==6||$i==11||$i==16){
			$x=80;$y+=102;
		}
	}

	if($p==1){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber01",0,1000,null,false);}
	else if($p==2){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber02",0,1000,null,false);}
	else if($p==3){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber03",0,1000,null,false);}
	else if($p==4){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber04",0,1000,null,false);}
	else if($p==5){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber05",0,1000,null,false);}
	else if($p==6){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber06",0,1000,null,false);}
	else if($p==7){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber07",0,1000,null,false);}
	else if($p==8){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber08",0,1000,null,false);}
	else if($p==9){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber09",0,1000,null,false);}
	else if($p==10){Fade("@pageNumber*",0,0,null,false);Fade("@pageNumber10",0,1000,null,false);}

	//★★★★アンロック
	XBOX360_LockVideo(false);
	set_focus();

	if($CGMODE_act==1){
		DrawTransition("ＣＧモードスクリーン", 300, 1000, 0, 100, null, "cg/data/細かい横ブラインド上下.png", true);
	}else if($CGMODE_act==2){
		DrawTransition("ＣＧモードスクリーン", 300, 1000, 0, 100, null, "cg/data/細かい横ブラインド上下.png", true);
	}else if($CGMODE_act==3){
		DrawTransition("ＣＧモードスクリーン", 300, 1000, 0, 100, null, "cg/data/細かい縦ブラインド左右2.png", true);
	}else if($CGMODE_act==4){
		DrawTransition("ＣＧモードスクリーン", 300, 1000, 0, 100, null, "cg/data/細かい縦ブラインド左右.png", true);
	}

	Delete("ＣＧモードスクリーン");
}

..//show_pic
function show_pic($num)
{

	$picnum=$num;
	if($num==1){
		$pic1=$pic_name1_1;
		$pic1Dif_1=$pic_name1_1Dif_1;
		$pic1Dif_2=$pic_name1_1Dif_2;
		$pic1Dif_3=$pic_name1_1Dif_3;
		$pic2=$pic_name1_2;
		$pic2Dif_1=$pic_name1_2Dif_1;
		$pic2Dif_2=$pic_name1_2Dif_2;
		$pic3=$pic_name1_3;
		$pic3Dif_1=$pic_name1_3Dif_1;
		$pic3Dif_2=$pic_name1_3Dif_2;
		$pic4=$pic_name1_4;
		$pic4Dif_1=$pic_name1_4Dif_1;
		$pic4Dif_2=$pic_name1_4Dif_2;
		$pic5=$pic_name1_5;
		$pic5Dif_1=$pic_name1_5Dif_1;
		$pic5Dif_2=$pic_name1_5Dif_2;
		$pic6=$pic_name1_6;
		$pic6Dif_1=$pic_name1_6Dif_1;
		$pic6Dif_2=$pic_name1_6Dif_2;
		$pic7=$pic_name1_7;
		$pic7Dif_1=$pic_name1_7Dif_1;
		$pic7Dif_2=$pic_name1_7Dif_2;
		$pic8=$pic_name1_8;
		$pic8Dif_1=$pic_name1_8Dif_1;
		$pic8Dif_2=$pic_name1_8Dif_2;
		$pic9=$pic_name1_9;
		$pic9Dif_1=$pic_name1_9Dif_1;
		$pic9Dif_2=$pic_name1_9Dif_2;
		$pic10=$pic_name1_10;
		$pic10Dif_1=$pic_name1_10Dif_1;
		$pic10Dif_2=$pic_name1_10Dif_2;
		$pic11=$pic_name1_11;
		$pic11Dif_1=$pic_name1_11Dif_1;
		$pic11Dif_2=$pic_name1_11Dif_2;
		$pic12=$pic_name1_12;
		$pic12Dif_1=$pic_name1_12Dif_1;
		$pic12Dif_2=$pic_name1_12Dif_2;
		$pic13=$pic_name1_13;
		$pic13Dif_1=$pic_name1_13Dif_1;
		$pic13Dif_2=$pic_name1_13Dif_2;
		$pic14=$pic_name1_14;
		$pic14Dif_1=$pic_name1_14Dif_1;
		$pic14Dif_2=$pic_name1_14Dif_2;
		$pic15=$pic_name1_15;
		$pic15Dif_1=$pic_name1_15Dif_1;
		$pic15Dif_2=$pic_name1_15Dif_2;
		$pic16=$pic_name1_16;
		$pic16Dif_1=$pic_name1_16Dif_1;
		$pic16Dif_2=$pic_name1_16Dif_2;
		$pic17=$pic_name1_17;
		$pic17Dif_1=$pic_name1_17Dif_1;
		$pic17Dif_2=$pic_name1_17Dif_2;
		$pic18=$pic_name1_18;
		$pic18Dif_1=$pic_name1_18Dif_1;
		$pic18Dif_2=$pic_name1_18Dif_2;
		$pic19=$pic_name1_19;
		$pic19Dif_1=$pic_name1_19Dif_1;
		$pic19Dif_2=$pic_name1_19Dif_2;
		$pic20=$pic_name1_20;
		$pic20Dif_1=$pic_name1_20Dif_1;
		$pic20Dif_2=$pic_name1_20Dif_2;
		$max=$pic_num1;
		$act=$act1;
		$actCount=$actCount1;
	}else if($num==2){
		$pic1=$pic_name2_1;
		$pic1Dif_1=$pic_name2_1Dif_1;
		$pic1Dif_2=$pic_name2_1Dif_2;
		$pic1Dif_3=$pic_name2_1Dif_3;
		$pic2=$pic_name2_2;
		$pic2Dif_1=$pic_name2_2Dif_1;
		$pic2Dif_2=$pic_name2_2Dif_2;
		$pic3=$pic_name2_3;
		$pic3Dif_1=$pic_name2_3Dif_1;
		$pic3Dif_2=$pic_name2_3Dif_2;
		$pic4=$pic_name2_4;
		$pic4Dif_1=$pic_name2_4Dif_1;
		$pic4Dif_2=$pic_name2_4Dif_2;
		$pic5=$pic_name2_5;
		$pic5Dif_1=$pic_name2_5Dif_1;
		$pic5Dif_2=$pic_name2_5Dif_2;
		$pic6=$pic_name2_6;
		$pic6Dif_1=$pic_name2_6Dif_1;
		$pic6Dif_2=$pic_name2_6Dif_2;
		$pic7=$pic_name2_7;
		$pic7Dif_1=$pic_name2_7Dif_1;
		$pic7Dif_2=$pic_name2_7Dif_2;
		$pic8=$pic_name2_8;
		$pic8Dif_1=$pic_name2_8Dif_1;
		$pic8Dif_2=$pic_name2_8Dif_2;
		$pic9=$pic_name2_9;
		$pic9Dif_1=$pic_name2_9Dif_1;
		$pic9Dif_2=$pic_name2_9Dif_2;
		$pic10=$pic_name2_10;
		$pic10Dif_1=$pic_name2_10Dif_1;
		$pic10Dif_2=$pic_name2_10Dif_2;
		$pic11=$pic_name2_11;
		$pic11Dif_1=$pic_name2_11Dif_1;
		$pic11Dif_2=$pic_name2_11Dif_2;
		$pic12=$pic_name2_12;
		$pic12Dif_1=$pic_name2_12Dif_1;
		$pic12Dif_2=$pic_name2_12Dif_2;
		$pic13=$pic_name2_13;
		$pic13Dif_1=$pic_name2_13Dif_1;
		$pic13Dif_2=$pic_name2_13Dif_2;
		$pic14=$pic_name2_14;
		$pic14Dif_1=$pic_name2_14Dif_1;
		$pic14Dif_2=$pic_name2_14Dif_2;
		$pic15=$pic_name2_15;
		$pic15Dif_1=$pic_name2_15Dif_1;
		$pic15Dif_2=$pic_name2_15Dif_2;
		$pic16=$pic_name2_16;
		$pic16Dif_1=$pic_name2_16Dif_1;
		$pic16Dif_2=$pic_name2_16Dif_2;
		$pic17=$pic_name2_17;
		$pic17Dif_1=$pic_name2_17Dif_1;
		$pic17Dif_2=$pic_name2_17Dif_2;
		$pic18=$pic_name2_18;
		$pic18Dif_1=$pic_name2_18Dif_1;
		$pic18Dif_2=$pic_name2_18Dif_2;
		$pic19=$pic_name2_19;
		$pic19Dif_1=$pic_name2_19Dif_1;
		$pic19Dif_2=$pic_name2_19Dif_2;
		$pic20=$pic_name2_20;
		$pic20Dif_1=$pic_name2_20Dif_1;
		$pic20Dif_2=$pic_name2_20Dif_2;
		$max=$pic_num2;
		$act=$act2;
		$actCount=$actCount2;
	}else if($num==3){
		$pic1=$pic_name3_1;
		$pic1Dif_1=$pic_name3_1Dif_1;
		$pic1Dif_2=$pic_name3_1Dif_2;
		$pic2=$pic_name3_2;
		$pic3=$pic_name3_3;
		$pic4=$pic_name3_4;
		$pic5=$pic_name3_5;
		$pic6=$pic_name3_6;
		$pic7=$pic_name3_7;
		$pic8=$pic_name3_8;
		$pic9=$pic_name3_9;
		$pic10=$pic_name3_10;
		$pic11=$pic_name3_11;
		$pic12=$pic_name3_12;
		$pic13=$pic_name3_13;
		$pic14=$pic_name3_14;
		$pic15=$pic_name3_15;
		$pic16=$pic_name3_16;
		$pic17=$pic_name3_17;
		$pic18=$pic_name3_18;
		$pic19=$pic_name3_19;
		$pic20=$pic_name3_20;
		$max=$pic_num3;
		$act=$act3;
		$actCount=$actCount3;
	}else if($num==4){
		$pic1=$pic_name4_1;
		$pic1Dif_1=$pic_name4_1Dif_1;
		$pic1Dif_2=$pic_name4_1Dif_2;
		$pic1Dif_3=$pic_name4_1Dif_3;
		$pic2=$pic_name4_2;
		$pic3=$pic_name4_3;
		$pic4=$pic_name4_4;
		$pic5=$pic_name4_5;
		$pic6=$pic_name4_6;
		$pic7=$pic_name4_7;
		$pic8=$pic_name4_8;
		$pic9=$pic_name4_9;
		$pic10=$pic_name4_10;
		$pic11=$pic_name4_11;
		$pic12=$pic_name4_12;
		$pic13=$pic_name4_13;
		$pic14=$pic_name4_14;
		$pic15=$pic_name4_15;
		$pic16=$pic_name4_16;
		$pic17=$pic_name4_17;
		$pic18=$pic_name4_18;
		$pic19=$pic_name4_19;
		$pic20=$pic_name4_20;
		$max=$pic_num4;
		$act=$act4;
		$actCount=$actCount4;
	}else if($num==5){
		$pic1=$pic_name5_1;
		$pic1Dif_1=$pic_name5_1Dif_1;
		$pic1Dif_2=$pic_name5_1Dif_2;
		$pic1Dif_3=$pic_name5_1Dif_3;
		$pic1Dif_4=$pic_name5_1Dif_4;
		$pic2=$pic_name5_2;
		$pic3=$pic_name5_3;
		$pic4=$pic_name5_4;
		$pic5=$pic_name5_5;
		$pic6=$pic_name5_6;
		$pic7=$pic_name5_7;
		$pic8=$pic_name5_8;
		$pic9=$pic_name5_9;
		$pic10=$pic_name5_10;
		$pic11=$pic_name5_11;
		$pic12=$pic_name5_12;
		$pic13=$pic_name5_13;
		$pic14=$pic_name5_14;
		$pic15=$pic_name5_15;
		$pic16=$pic_name5_16;
		$pic17=$pic_name5_17;
		$pic18=$pic_name5_18;
		$pic19=$pic_name5_19;
		$pic20=$pic_name5_20;
		$max=$pic_num5;
		$act=$act5;
		$actCount=$actCount5;
	}else if($num==6){
		$pic1=$pic_name6_1;
		$pic1Dif_1=$pic_name6_1Dif_1;
		$pic1Dif_2=$pic_name6_1Dif_2;
		$pic1Dif_3=$pic_name6_1Dif_3;
		$pic2=$pic_name6_2;
		$pic3=$pic_name6_3;
		$pic4=$pic_name6_4;
		$pic5=$pic_name6_5;
		$pic6=$pic_name6_6;
		$pic7=$pic_name6_7;
		$pic8=$pic_name6_8;
		$pic9=$pic_name6_9;
		$pic10=$pic_name6_10;
		$pic11=$pic_name6_11;
		$pic12=$pic_name6_12;
		$pic13=$pic_name6_13;
		$pic14=$pic_name6_14;
		$pic15=$pic_name6_15;
		$pic16=$pic_name6_16;
		$pic17=$pic_name6_17;
		$pic18=$pic_name6_18;
		$pic19=$pic_name6_19;
		$pic20=$pic_name6_20;
		$max=$pic_num6;
		$act=$act6;
		$actCount=$actCount6;
	}else if($num==7){
		$pic1=$pic_name7_1;
		$pic1Dif_1=$pic_name7_1Dif_1;
		$pic1Dif_2=$pic_name7_1Dif_2;
		$pic1Dif_3=$pic_name7_1Dif_3;
		$pic1Dif_4=$pic_name7_1Dif_4;
		$pic2=$pic_name7_2;
		$pic3=$pic_name7_3;
		$pic4=$pic_name7_4;
		$pic5=$pic_name7_5;
		$pic6=$pic_name7_6;
		$pic7=$pic_name7_7;
		$pic8=$pic_name7_8;
		$pic9=$pic_name7_9;
		$pic10=$pic_name7_10;
		$pic11=$pic_name7_11;
		$pic12=$pic_name7_12;
		$pic13=$pic_name7_13;
		$pic14=$pic_name7_14;
		$pic15=$pic_name7_15;
		$pic16=$pic_name7_16;
		$pic17=$pic_name7_17;
		$pic18=$pic_name7_18;
		$pic19=$pic_name7_19;
		$pic20=$pic_name7_20;
		$max=$pic_num7;
		$act=$act7;
		$actCount=$actCount7;
	}else if($num==8){
		$pic1=$pic_name8_1;
		$pic1Dif_1=$pic_name8_1Dif_1;
		$pic1Dif_2=$pic_name8_1Dif_2;
		$pic1Dif_3=$pic_name8_1Dif_3;
		$pic2=$pic_name8_2;
		$pic3=$pic_name8_3;
		$pic4=$pic_name8_4;
		$pic5=$pic_name8_5;
		$pic6=$pic_name8_6;
		$pic7=$pic_name8_7;
		$pic8=$pic_name8_8;
		$pic9=$pic_name8_9;
		$pic10=$pic_name8_10;
		$pic11=$pic_name8_11;
		$pic12=$pic_name8_12;
		$pic13=$pic_name8_13;
		$pic14=$pic_name8_14;
		$pic15=$pic_name8_15;
		$pic16=$pic_name8_16;
		$pic17=$pic_name8_17;
		$pic18=$pic_name8_18;
		$pic19=$pic_name8_19;
		$pic20=$pic_name8_20;
		$max=$pic_num8;
		$act=$act8;
		$actCount=$actCount8;
	}else if($num==9){
		$pic1=$pic_name9_1;
		$pic1Dif_1=$pic_name9_1Dif_1;
		$pic1Dif_2=$pic_name9_1Dif_2;
		$pic2=$pic_name9_2;
		$pic3=$pic_name9_3;
		$pic4=$pic_name9_4;
		$pic5=$pic_name9_5;
		$pic6=$pic_name9_6;
		$pic7=$pic_name9_7;
		$pic8=$pic_name9_8;
		$pic9=$pic_name9_9;
		$pic10=$pic_name9_10;
		$pic11=$pic_name9_11;
		$pic12=$pic_name9_12;
		$pic13=$pic_name9_13;
		$pic14=$pic_name9_14;
		$pic15=$pic_name9_15;
		$pic16=$pic_name9_16;
		$pic17=$pic_name9_17;
		$pic18=$pic_name9_18;
		$pic19=$pic_name9_19;
		$pic20=$pic_name9_20;
		$max=$pic_num9;
		$act=$act9;
		$actCount=$actCount9;
	}else if($num==10){
		$pic1=$pic_name10_1;
		$pic1Dif_1=$pic_name10_1Dif_1;
		$pic2=$pic_name10_2;
		$pic3=$pic_name10_3;
		$pic4=$pic_name10_4;
		$pic5=$pic_name10_5;
		$pic6=$pic_name10_6;
		$pic7=$pic_name10_7;
		$pic8=$pic_name10_8;
		$pic9=$pic_name10_9;
		$pic10=$pic_name10_10;
		$pic11=$pic_name10_11;
		$pic12=$pic_name10_12;
		$pic13=$pic_name10_13;
		$pic14=$pic_name10_14;
		$pic15=$pic_name10_15;
		$pic16=$pic_name10_16;
		$pic17=$pic_name10_17;
		$pic18=$pic_name10_18;
		$pic19=$pic_name10_19;
		$pic20=$pic_name10_20;
		$max=$pic_num10;
		$act=$act10;
		$actCount=$actCount10;
	}else if($num==11){
		$pic1=$pic_name11_1;
		$pic1Dif_1=$pic_name11_1Dif_1;
		$pic1Dif_2=$pic_name11_1Dif_2;
		$pic1Dif_3=$pic_name11_1Dif_3;
		$pic2=$pic_name11_2;
		$pic3=$pic_name11_3;
		$pic4=$pic_name11_4;
		$pic5=$pic_name11_5;
		$pic6=$pic_name11_6;
		$pic7=$pic_name11_7;
		$pic8=$pic_name11_8;
		$pic9=$pic_name11_9;
		$pic10=$pic_name11_10;
		$pic11=$pic_name11_11;
		$pic12=$pic_name11_12;
		$pic13=$pic_name11_13;
		$pic14=$pic_name11_14;
		$pic15=$pic_name11_15;
		$pic16=$pic_name11_16;
		$pic17=$pic_name11_17;
		$pic18=$pic_name11_18;
		$pic19=$pic_name11_19;
		$pic20=$pic_name11_20;
		$max=$pic_num11;
		$act=$act11;
		$actCount=$actCount11;
	}else if($num==12){
		$pic1=$pic_name12_1;
		$pic1Dif_1=$pic_name12_1Dif_1;
		$pic1Dif_2=$pic_name12_1Dif_2;
		$pic2=$pic_name12_2;
		$pic3=$pic_name12_3;
		$pic4=$pic_name12_4;
		$pic5=$pic_name12_5;
		$pic6=$pic_name12_6;
		$pic7=$pic_name12_7;
		$pic8=$pic_name12_8;
		$pic9=$pic_name12_9;
		$pic10=$pic_name12_10;
		$pic11=$pic_name12_11;
		$pic12=$pic_name12_12;
		$pic13=$pic_name12_13;
		$pic14=$pic_name12_14;
		$pic15=$pic_name12_15;
		$pic16=$pic_name12_16;
		$pic17=$pic_name12_17;
		$pic18=$pic_name12_18;
		$pic19=$pic_name12_19;
		$pic20=$pic_name12_20;
		$max=$pic_num12;
		$act=$act12;
		$actCount=$actCount12;
	}else if($num==13){
		$pic1=$pic_name13_1;
		$pic1Dif_1=$pic_name13_1Dif_1;
		$pic1Dif_2=$pic_name13_1Dif_2;
		$pic1Dif_3=$pic_name13_1Dif_3;
		$pic2=$pic_name13_2;
		$pic3=$pic_name13_3;
		$pic4=$pic_name13_4;
		$pic5=$pic_name13_5;
		$pic6=$pic_name13_6;
		$pic7=$pic_name13_7;
		$pic8=$pic_name13_8;
		$pic9=$pic_name13_9;
		$pic10=$pic_name13_10;
		$pic11=$pic_name13_11;
		$pic12=$pic_name13_12;
		$pic13=$pic_name13_13;
		$pic14=$pic_name13_14;
		$pic15=$pic_name13_15;
		$pic16=$pic_name13_16;
		$pic17=$pic_name13_17;
		$pic18=$pic_name13_18;
		$pic19=$pic_name13_19;
		$pic20=$pic_name13_20;
		$max=$pic_num13;
		$act=$act13;
		$actCount=$actCount13;
	}else if($num==14){
		$pic1=$pic_name14_1;
		$pic1Dif_1=$pic_name14_1Dif_1;
		$pic1Dif_2=$pic_name14_1Dif_2;
		$pic2=$pic_name14_2;
		$pic3=$pic_name14_3;
		$pic4=$pic_name14_4;
		$pic5=$pic_name14_5;
		$pic6=$pic_name14_6;
		$pic7=$pic_name14_7;
		$pic8=$pic_name14_8;
		$pic9=$pic_name14_9;
		$pic10=$pic_name14_10;
		$pic11=$pic_name14_11;
		$pic12=$pic_name14_12;
		$pic13=$pic_name14_13;
		$pic14=$pic_name14_14;
		$pic15=$pic_name14_15;
		$pic16=$pic_name14_16;
		$pic17=$pic_name14_17;
		$pic18=$pic_name14_18;
		$pic19=$pic_name14_19;
		$pic20=$pic_name14_20;
		$max=$pic_num14;
		$act=$act14;
		$actCount=$actCount14;
	}else if($num==15){
		$pic1=$pic_name15_1;
		$pic1Dif_1=$pic_name15_1Dif_1;
		$pic1Dif_2=$pic_name15_1Dif_2;
		$pic1Dif_3=$pic_name15_1Dif_3;
		$pic1Dif_4=$pic_name15_1Dif_4;
		$pic2=$pic_name15_2;
		$pic3=$pic_name15_3;
		$pic4=$pic_name15_4;
		$pic5=$pic_name15_5;
		$pic6=$pic_name15_6;
		$pic7=$pic_name15_7;
		$pic8=$pic_name15_8;
		$pic9=$pic_name15_9;
		$pic10=$pic_name15_10;
		$pic11=$pic_name15_11;
		$pic12=$pic_name15_12;
		$pic13=$pic_name15_13;
		$pic14=$pic_name15_14;
		$pic15=$pic_name15_15;
		$pic16=$pic_name15_16;
		$pic17=$pic_name15_17;
		$pic18=$pic_name15_18;
		$pic19=$pic_name15_19;
		$pic20=$pic_name15_20;
		$max=$pic_num15;
		$act=$act15;
		$actCount=$actCount15;
	}else if($num==16){
		$pic1=$pic_name16_1;
		$pic1Dif_1=$pic_name16_1Dif_1;
		$pic1Dif_2=$pic_name16_1Dif_2;
		$pic1Dif_3=$pic_name16_1Dif_3;
		$pic2=$pic_name16_2;
		$pic3=$pic_name16_3;
		$pic4=$pic_name16_4;
		$pic5=$pic_name16_5;
		$pic6=$pic_name16_6;
		$pic7=$pic_name16_7;
		$pic8=$pic_name16_8;
		$pic9=$pic_name16_9;
		$pic10=$pic_name16_10;
		$pic11=$pic_name16_11;
		$pic12=$pic_name16_12;
		$pic13=$pic_name16_13;
		$pic14=$pic_name16_14;
		$pic15=$pic_name16_15;
		$pic16=$pic_name16_16;
		$pic17=$pic_name16_17;
		$pic18=$pic_name16_18;
		$pic19=$pic_name16_19;
		$pic20=$pic_name16_20;
		$max=$pic_num16;
		$act=$act16;
		$actCount=$actCount16;
	}else if($num==17){
		$pic1=$pic_name17_1;
		$pic1Dif_1=$pic_name17_1Dif_1;
		$pic2=$pic_name17_2;
		$pic3=$pic_name17_3;
		$pic4=$pic_name17_4;
		$pic5=$pic_name17_5;
		$pic6=$pic_name17_6;
		$pic7=$pic_name17_7;
		$pic8=$pic_name17_8;
		$pic9=$pic_name17_9;
		$pic10=$pic_name17_10;
		$pic11=$pic_name17_11;
		$pic12=$pic_name17_12;
		$pic13=$pic_name17_13;
		$pic14=$pic_name17_14;
		$pic15=$pic_name17_15;
		$pic16=$pic_name17_16;
		$pic17=$pic_name17_17;
		$pic18=$pic_name17_18;
		$pic19=$pic_name17_19;
		$pic20=$pic_name17_20;
		$max=$pic_num17;
		$act=$act17;
		$actCount=$actCount17;
	}else if($num==18){
		$pic1=$pic_name18_1;
		$pic1Dif_1=$pic_name18_1Dif_1;
		$pic1Dif_2=$pic_name18_1Dif_2;
		$pic1Dif_3=$pic_name18_1Dif_3;
		$pic2=$pic_name18_2;
		$pic3=$pic_name18_3;
		$pic4=$pic_name18_4;
		$pic5=$pic_name18_5;
		$pic6=$pic_name18_6;
		$pic7=$pic_name18_7;
		$pic8=$pic_name18_8;
		$pic9=$pic_name18_9;
		$pic10=$pic_name18_10;
		$pic11=$pic_name18_11;
		$pic12=$pic_name18_12;
		$pic13=$pic_name18_13;
		$pic14=$pic_name18_14;
		$pic15=$pic_name18_15;
		$pic16=$pic_name18_16;
		$pic17=$pic_name18_17;
		$pic18=$pic_name18_18;
		$pic19=$pic_name18_19;
		$pic20=$pic_name18_20;
		$max=$pic_num18;
		$act=$act18;
		$actCount=$actCount18;
	}else if($num==19){
		$pic1=$pic_name19_1;
		$pic1Dif_1=$pic_name19_1Dif_1;
		$pic1Dif_2=$pic_name19_1Dif_2;
		$pic1Dif_3=$pic_name19_1Dif_3;
		$pic2=$pic_name19_2;
		$pic3=$pic_name19_3;
		$pic4=$pic_name19_4;
		$pic5=$pic_name19_5;
		$pic6=$pic_name19_6;
		$pic7=$pic_name19_7;
		$pic8=$pic_name19_8;
		$pic9=$pic_name19_9;
		$pic10=$pic_name19_10;
		$pic11=$pic_name19_11;
		$pic12=$pic_name19_12;
		$pic13=$pic_name19_13;
		$pic14=$pic_name19_14;
		$pic15=$pic_name19_15;
		$pic16=$pic_name19_16;
		$pic17=$pic_name19_17;
		$pic18=$pic_name19_18;
		$pic19=$pic_name19_19;
		$pic20=$pic_name19_20;
		$max=$pic_num19;
		$act=$act19;
		$actCount=$actCount19;
	}else if($num==20){
		$pic1=$pic_name20_1;
		$pic1Dif_1=$pic_name20_1Dif_1;
		$pic1Dif_2=$pic_name20_1Dif_2;
		$pic2=$pic_name20_2;
		$pic3=$pic_name20_3;
		$pic4=$pic_name20_4;
		$pic5=$pic_name20_5;
		$pic6=$pic_name20_6;
		$pic7=$pic_name20_7;
		$pic8=$pic_name20_8;
		$pic9=$pic_name20_9;
		$pic10=$pic_name2_10;
		$pic11=$pic_name20_11;
		$pic12=$pic_name20_12;
		$pic13=$pic_name20_13;
		$pic14=$pic_name20_14;
		$pic15=$pic_name20_15;
		$pic16=$pic_name20_16;
		$pic17=$pic_name20_17;
		$pic18=$pic_name20_18;
		$pic19=$pic_name20_19;
		$pic20=$pic_name20_20;
		$max=$pic_num20;
		$act=$act20;
		$pic20Dif_1=$pic_name20_20Dif_1;
		$pic20Dif_2=$pic_name20_20Dif_2;
		$actCount=$actCount20;
	}
	if(!$max){
		return;
	}

	Wait(16);

	//★★★★ロック
	XBOX360_LockVideo(true);


	if($nextcg==0){
		CreateTexture("show_old",1610,center,middle,SCREEN);
	}else{
		CreateTexture("show_old",1610,center,middle,SCREEN);
		Delete("@show_old2");
	}

	$i=1;
	while($i<=$max){
		$name="cg/";
		if($i==1){$name=$name+$pic1;}
		else if($i==2){$name=$name+$pic2;}
		else if($i==3){$name=$name+$pic3;}
		else if($i==4){$name=$name+$pic4;}
		else if($i==5){$name=$name+$pic5;}
		else if($i==6){$name=$name+$pic6;}
		else if($i==7){$name=$name+$pic7;}
		else if($i==8){$name=$name+$pic8;}
		else if($i==9){$name=$name+$pic9;}
		else if($i==10){$name=$name+$pic10;}
		else if($i==11){$name=$name+$pic11;}
		else if($i==12){$name=$name+$pic12;}
		else if($i==13){$name=$name+$pic13;}
		else if($i==14){$name=$name+$pic14;}
		else if($i==15){$name=$name+$pic15;}
		else if($i==16){$name=$name+$pic16;}
		else if($i==17){$name=$name+$pic17;}
		else if($i==18){$name=$name+$pic18;}
		else if($i==19){$name=$name+$pic19;}
		else if($i==20){$name=$name+$pic20;}
		$name=$name+".jpg";


..//画像判定
		$actold=$act;

		if(!$act){
			CreateTexture("show_img", 1600, 0, 0, $name);
			SetAlias("show_img","show_img");
			CreateScrollbar("Scroll",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
			SetAlias("Scroll","Scroll");

		}else if($act==1){
			CreateTexture("show_img", 1600, 0, Middle, $name);
			SetAlias("show_img","show_img");
			CreateScrollbar("XScroll",1600,240,160,280,160,0,HORIZON,"cg/extra/gallery/スクロール.png");
			SetAlias("XScroll","XScroll");

		}else if($act==2){
			CreateTexture("show_img", 1600, 0, Middle, $name);
			SetAlias("show_img","show_img");
			CreateScrollbar("XScroll",1600,240,160,280,160,800,HORIZON,"cg/extra/gallery/スクロール.png");
			SetAlias("XScroll","XScroll");

		}else if($act==3){
			CreateTexture("show_img", 1600, 0, 0, $name);
			SetAlias("show_img","show_img");
			CreateScrollbar("Scroll",1600,472,160,472,200,0,VERTICAL,"cg/extra/gallery/スクロール.png");
			SetAlias("Scroll","Scroll");

		}else if($act==4){
			CreateTexture("show_img", 1600, 0, 0, $name);
			SetAlias("show_img","show_img");
			CreateScrollbar("Scroll",1600,472,160,472,200,800,VERTICAL,"cg/extra/gallery/スクロール.png");
			SetAlias("Scroll","Scroll");
		}

//pageB用
		if($actCount1_name==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount3_name==true && $chara==2){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount5_name==true && $chara==2){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount6_name==true && $chara==2){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount8_name==true && $chara==2){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount19_name==true && $chara==2){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";

..//actCount
		}else if($actCount2_name==1){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount4_name==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount5_name==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount6_name==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount9_name==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount10_name==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount15_name==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount16_name==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";
//page2
		}else if($actCount9_name2==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount14_name2==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount16_name2==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";
//page3
		}else if($actCount1_name3==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount3_name3==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount4_name3==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount7_name3==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount9_name3==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount12_name3==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount14_name3==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";
//page4
		}else if($actCount2_name4==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount3_name4==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount5_name4==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount11_name4==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount12_name4==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount13_name4==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount15_name4==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount18_name4==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";
//page5
		}else if($actCount5_name5==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount8_name5==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount12_name5==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount13_name5==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount17_name5==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";
//page6
		}else if($actCount7_name6==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount11_name6==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount12_name6==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount14_name6==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount16_name6==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount9_name6==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount16_name6==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount17_name6==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";
//page7
		}else if($actCount4_name7==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount5_name7==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount6_name7==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount9_name7==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount10_name7==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount11_name7==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}
		else if($actCount12_name7==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";}

//pageB
	if($actCount2_name==4){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";$name4="cg/"+$pic1Dif_3+".jpg";}
	if($actCount7_name==4){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";$name4="cg/"+$pic1Dif_3+".jpg";}
//pageA
	if($actCount1_name4==4){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";$name4="cg/"+$pic1Dif_3+".jpg";}
	if($actCount15_name6==4){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";$name4="cg/"+$pic1Dif_3+".jpg";}
	if($actCount13_name5==4){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";$name4="cg/"+$pic1Dif_3+".jpg";}
	if($actCount11_name3==4){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";$name4="cg/"+$pic1Dif_3+".jpg";}
	if($actCount6_name7==4){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";$name4="cg/"+$pic1Dif_3+".jpg";}

//	if($actCount16_name3==true){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";$name4="cg/"+$pic1Dif_3+".jpg";}

//例外処理
		if($actCount==5){$name2="cg/"+$pic1Dif_1+".jpg";$name3="cg/"+$pic1Dif_2+".jpg";$name4="cg/"+$pic1Dif_3+".jpg";$name5="cg/"+$pic1Dif_4+".jpg";}

		if($actCount==3){
			if(!$act){
				CreateTexture("show_img2", 1600, 0, 0, $name2);
				SetAlias("show_img2","show_img2");
				CreateScrollbar("Scroll2",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll2","Scroll2");
				CreateTexture("show_img3", 1600, 0, 0, $name3);
				SetAlias("show_img3","show_img3");
				CreateScrollbar("Scroll3",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll3","Scroll3");
				Fade("show_img2", 0, 0, null, true);
				Fade("show_img3", 0, 0, null, true);
			}else if($act==2){

			}
		}else if($actCount==2){
			if(!$act){
				CreateTexture("show_img2", 1600, 0, 0, $name2);
				SetAlias("show_img2","show_img2");
				CreateScrollbar("Scroll2",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll2","Scroll2");
				Fade("show_img2", 0, 0, null, true);
			}else if($act==1){
//X
				CreateTexture("show_img2", 1600, 0, Middle, $name2);
				SetAlias("show_img2","show_img2");
				CreateScrollbar("XScroll2",1600,240,160,280,160,440,HORIZON,"cg/extra/gallery/スクロール.png");
				SetAlias("XScroll2","XScroll2");
				Fade("show_img2", 0, 0, null, true);

			}else if($act==2){
				CreateTexture("show_img2", 1600, 0, Middle, $name2);
				SetAlias("show_img2","show_img2");
				CreateScrollbar("XScroll2",1600,240,160,280,160,800,HORIZON,"cg/extra/gallery/スクロール.png");
				SetAlias("XScroll2","XScroll2");
				Fade("show_img2", 0, 0, null, true);
			}else if($act==3){
				CreateTexture("show_img2", 1600, 0, 0, $name2);
				SetAlias("show_img2","show_img2");
				CreateScrollbar("Scroll2",1600,472,160,472,200,0,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll2","Scroll2");
				Fade("show_img2", 0, 0, null, true);
			}else if($act==4){
				CreateTexture("show_img2", 1600, 0, 0, $name2);
				SetAlias("show_img2","show_img2");
				CreateScrollbar("Scroll2",1600,472,160,472,200,800,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll2","Scroll2");
				Fade("show_img2", 0, 0, null, true);
			}
		}else if($actCount==5){
//2
				CreateTexture("show_img2", 1600, 0, 0, $name2);
				SetAlias("show_img2","show_img2");
				CreateScrollbar("Scroll2",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll2","Scroll2");
//3
				CreateTexture("show_img3", 1600, 0, 0, $name3);
				SetAlias("show_img3","show_img3");
				CreateScrollbar("Scroll3",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll3","Scroll3");
//4
				CreateTexture("show_img4", 1600, 0, 0, $name4);
				SetAlias("show_img4","show_img4");
				CreateScrollbar("Scroll4",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll4","Scroll4");
//5
				CreateTexture("show_img5", 1600, 0, 0, $name5);
				SetAlias("show_img5","show_img5");
				CreateScrollbar("Scroll5",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll5","Scroll5");
				Fade("show_img2", 0, 0, null, false);
				Fade("show_img3", 0, 0, null, false);
				Fade("show_img4", 0, 0, null, false);
				Fade("show_img5", 0, 0, null, true);
		}else if($actCount==4){
				CreateTexture("show_img2", 1600, 0, 0, $name2);
				SetAlias("show_img2","show_img2");
				CreateScrollbar("Scroll2",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll2","Scroll2");
				CreateTexture("show_img3", 1600, 0, 0, $name3);
				SetAlias("show_img3","show_img3");
				CreateScrollbar("Scroll3",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll3","Scroll3");
				CreateTexture("show_img4", 1600, 0, 0, $name4);
				SetAlias("show_img4","show_img4");
				CreateScrollbar("Scroll4",1600,472,160,472,200,440,VERTICAL,"cg/extra/gallery/スクロール.png");
				SetAlias("Scroll4","Scroll4");
				Fade("show_img2", 0, 0, null, false);
				Fade("show_img3", 0, 0, null, false);
				Fade("show_img4", 0, 0, null, false);
		}

		CreateChoice("CLICK");
		CreateColor("CLICK/MouseUsual/img", 10, 0, 0, 1024, 520, "Black");
		CreateColor("CLICK/MouseOver/img", 10, 0, 0, 1024, 520, "Black");
		CreateColor("CLICK/MouseClick/img", 10, 0, 0, 1024, 520, "Black");
		SetAlias("CLICK","CLICK");

		CreateChoice("CLICK2");
		CreateColor("CLICK2/MouseUsual/img", 10, 0, 520, 512, 56, "Black");
		CreateColor("CLICK2/MouseOver/img", 10, 0, 520, 512, 56, "Black");
		CreateColor("CLICK2/MouseClick/img", 10, 0, 520, 512, 56, "Black");
		SetAlias("CLICK2","CLICK2");

		CreateChoice("CLICK3");
		CreateColor("CLICK3/MouseUsual/img", 10, 512, 520, 512, 56, "Black");
		CreateColor("CLICK3/MouseOver/img", 10, 512, 520, 512, 56, "Black");
		CreateColor("CLICK3/MouseClick/img", 10, 512, 520, 512, 56, "Black");
		SetAlias("CLICK3","CLICK3");

		//★★★★アンロック
		XBOX360_LockVideo(false);

		if($nextcg==-1){
		}else{
			Fade("show_old",0,1000,null,true);
			Fade("show_old",300,0,null,false);
		}

	$Seek_now_loop=true;

	if($actCount==0){

		if($nextcg==-1){Fade("show_old",300,0,null,false);}

			if($act==1){
				$PosX2_01=0;
				$img_X = ImageHorizon("show_img");
				$img_X2 = $img_X-1024;
				$img_X3 = $img_X2;
				SetScrollbar("XScroll", "XScroll");
				SetScrollSpeed("XScroll",10);
					while($Seek_now_loop){
					$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
						select{
							if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
								$PosX_01=Integer($img_X3 * ScrollbarValue("@XScroll"));
								$PosX3_01=$PosX2_01 - $PosX_01;
								$PosX2_01=$PosX_01;
								Move("show_img",0,@$PosX3_01,@0, null, true);
							case XScroll{}
							case CLICK{$PosX2_01=0;$nextcg=0;break;}
							case CLICK2{$PosX2_01=0;$nextcg=1;break;}
							case CLICK3{$PosX2_01=0;$nextcg=-1;break;}
							if($SYSTEM_XBOX360_button_rb_down){$GOTO_NEXTCGR=true;break;}
							if($SYSTEM_XBOX360_button_lb_down){$GOTO_NEXTCGL=true;break;}
						}
							if($GOTO_NEXTCGR==true){$GOTO_NEXTCGR=false;$PosX2_01=0;$nextcg=1;break;}
							if($GOTO_NEXTCGL==true){$GOTO_NEXTCGL=false;$PosX2_01=0;$nextcg=-1;break;}
							if($GOTO_END==true){$GOTO_END=false;$PosX2_01=0;$nextcg=0;break;}
					}
			}else if($act==2){
			$PosY2_01=0;
			$PosX2_01=0;
				$img_X = ImageHorizon("show_img");
				$img_X2 = $img_X-1024;
				$img_X3 = $img_X2/2;
				SetScrollbar("XScroll", "XScroll");
				SetScrollSpeed("XScroll",10);
					while($Seek_now_loop){
					$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
						select{
							if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
							$PosX_01=Integer($img_X3 * ScrollbarValue("@XScroll"));
							$PosX3_01=$PosX2_01 - $PosX_01;
							$PosX2_01=$PosX_01;
							Move("show_img",0,@$PosX3_01,@0, null, true);
						case XScroll{}
						case CLICK{$PosX2_01=0;$nextcg=0;break;}
						case CLICK2{$PosX2_01=0;$nextcg=1;break;}
						case CLICK3{$PosX2_01=0;$nextcg=-1;break;}
							if($SYSTEM_XBOX360_button_rb_down){$GOTO_NEXTCGR=true;break;}
							if($SYSTEM_XBOX360_button_lb_down){$GOTO_NEXTCGL=true;break;}
						}
							if($GOTO_NEXTCGR==true){$GOTO_NEXTCGR=false;$PosX2_01=0;$nextcg=1;break;}
							if($GOTO_NEXTCGL==true){$GOTO_NEXTCGL=false;$PosX2_01=0;$nextcg=-1;break;}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_01=0;$nextcg=0;break;}
					}
			}else if($act==3){
			$PosY2_01=0;
			$img_Y = ImageVertical("show_img");
			$img_Y2 = $img_Y-576;
			$img_Y3 = $img_Y2;
				SetScrollbar("Scroll", "Scroll");
				SetScrollSpeed("Scroll",10);
					while($Seek_now_loop){
					$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
						select{
							if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
							$PosY_01=Integer($img_Y3 * ScrollbarValue("@Scroll"));
							$PosY3_01=$PosY2_01 - $PosY_01;
							$PosY2_01=$PosY_01;
							Move("show_img",0,@0,@$PosY3_01, null, true);
							case Scroll{}
							case CLICK{$PosY2_01=0;$nextcg=0;break;}
							case CLICK2{$PosY2_01=0;$nextcg=1;break;}
							case CLICK3{$PosY2_01=0;$nextcg=-1;break;}
							if($SYSTEM_XBOX360_button_rb_down){$GOTO_NEXTCGR=true;break;}
							if($SYSTEM_XBOX360_button_lb_down){$GOTO_NEXTCGL=true;break;}
						}
							if($GOTO_NEXTCGR==true){$GOTO_NEXTCGR=false;$PosY2_01=0;$nextcg=1;break;}
							if($GOTO_NEXTCGL==true){$GOTO_NEXTCGL=false;$PosY2_01=0;$nextcg=-1;break;}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_01=0;$nextcg=0;break;}
					}
			}else if($act==4){
			$PosY2_01=0;
			$img_Y = ImageVertical("show_img");
			$img_Y2 = $img_Y-576;
			$img_Y3 = $img_Y2;
				SetScrollbar("Scroll", "Scroll");
				SetScrollSpeed("Scroll",10);
					while(1){
							$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
						select{
							if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
							$PosY_01=Integer($img_Y3 * ScrollbarValue("@Scroll"));
							$PosY3_01=$PosY2_01 - $PosY_01;
							$PosY2_01=$PosY_01;
							Move("show_img",0,@0,@$PosY3_01, null, true);
							case Scroll{}
							case CLICK{$PosY2_01=0;$nextcg=0;break;}
							case CLICK2{$PosY2_01=0;$nextcg=1;break;}
							case CLICK3{$PosY2_01=0;$nextcg=-1;break;}
							if($SYSTEM_XBOX360_button_rb_down){$GOTO_NEXTCGR=true;break;}
							if($SYSTEM_XBOX360_button_lb_down){$GOTO_NEXTCGL=true;break;}
						}
							if($GOTO_NEXTCGR==true){$GOTO_NEXTCGR=false;$PosY2_01=0;$nextcg=1;break;}
							if($GOTO_NEXTCGL==true){$GOTO_NEXTCGL=false;$PosY2_01=0;$nextcg=-1;break;}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_01=0;$nextcg=0;break;}
					}
			}else{
			$PosY2_01=0;
			$img_Y = ImageVertical("show_img");
			$img_Y2 = $img_Y-576;
			$img_Y3 = $img_Y2;
				SetScrollbar("Scroll", "Scroll");
				SetScrollSpeed("Scroll",10);
					while(1){
							$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
//							$SYSTEM_rb_button_down=false;$SYSTEM_XBOX360_button_lb_down=false;
						select{
							if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
							$PosY_01=Integer($img_Y3 * ScrollbarValue("@Scroll"));
							$PosY3_01=$PosY2_01 - $PosY_01;
							$PosY2_01=$PosY_01;
							Move("show_img",0,@0,@$PosY3_01, null, true);
							case Scroll{}
							case CLICK{$PosY2_01=0;$nextcg=0;break;}
							case CLICK2{$PosY2_01=0;$nextcg=1;break;}
							case CLICK3{$PosY2_01=0;$nextcg=-1;break;}
							if($SYSTEM_XBOX360_button_rb_down){$GOTO_NEXTCGR=true;break;}
							if($SYSTEM_XBOX360_button_lb_down){$GOTO_NEXTCGL=true;break;}
						}
							if($GOTO_NEXTCGR==true){$GOTO_NEXTCGR=false;$PosY2_01=0;$nextcg=1;break;}
							if($GOTO_NEXTCGL==true){$GOTO_NEXTCGL=false;$PosY2_01=0;$nextcg=-1;break;}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_01=0;$nextcg=0;break;}
					}
			}
	}else if($actCount==3){

		if($nextcg==-1){
			$img_Loop001=false;
			$img_Loop002=false;
			$img_Loop003=true;
			Fade("show_img3",0,1000,null,true);
			Fade("show_old",300,0,null,false);
		}else if($nextcg==1){
			$img_Loop001=true;
			$img_Loop002=false;
			$img_Loop003=false;
		}else{
			$img_Loop001=true;
			$img_Loop002=false;
			$img_Loop003=false;
		}

				$img_Y = ImageVertical("show_img");
				$img_Y2 = $img_Y-576;
				$img_Y3 = $img_Y2;
					SetScrollbar("Scroll", "Scroll");
					SetScrollSpeed("Scroll",15);

				$img_Y_02 = ImageVertical("show_img2");
				$img_Y2_02 = $img_Y_02-576;
				$img_Y3_02 = $img_Y2_02;
				SetScrollbar("Scroll2", "Scroll2");
				SetScrollSpeed("Scroll2",15);

				$img_Y_03 = ImageVertical("show_img3");
				$img_Y2_03 = $img_Y_03-576;
				$img_Y3_03 = $img_Y2_03;
				SetScrollbar("Scroll3", "Scroll3");
				SetScrollSpeed("Scroll3",15);

			$PosY1_01=0;
			$PosY2_01=0;
			$PosY3_01=0;
			$PosY1_02=0;
			$PosY2_02=0;
			$PosY3_02=0;
			$PosY1_03=0;
			$PosY2_03=0;
			$PosY3_03=0;

				while(1){
			if($img_Loop001==true){
					$PosY3_01=-$PosY3_01;
					Move("show_img",0,@0,@$PosY3_01, null, true);
							$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
				select{
						$PosY_01=Integer($img_Y3 * ScrollbarValue("@Scroll"));
						$PosY3_01=$PosY2_01 - $PosY_01;
						$PosY2_01=$PosY_01;
						Move("show_img",0,@0,@$PosY3_01, null, true);
			Fade("show_img", 0, 1000, null, true);
			Fade("show_img2", 300, 0, null, true);
					if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll{}
					case CLICK{$nextcg=0;$img_Loop001=false;$img_Loop002=true;}
					case CLICK2{$nextcg=0;$img_Loop001=false;$img_Loop002=true;}
					case CLICK3{$nextcg=-1;break;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop001=false;$img_Loop002=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$GOTO_NEXTCGL=true;break;}
				}
					if($GOTO_END==true){$GOTO_END=false;$PosY2_01=0;$nextcg=0;break;}
			}
			if($img_Loop002==true){
					$PosY3_02=-$PosY3_02;
					Move("show_img2",0,@0,@$PosY3_02, null, true);
						$PosY_02=Integer($img_Y3_02 * ScrollbarValue("@Scroll2"));
						$PosY3_02=$PosY2_02 - $PosY_02;
						$PosY2_02=$PosY_02;
						Move("show_img2",0,@0,@$PosY3_02, null, true);
		if($img_back==true){
			Fade("show_img2", 0, 1000, null, true);
			Fade("show_img3", 300, 0, null, true);
			$img_back=false;
		}else{
			Fade("show_img2", 300, 1000, null, true);
			Fade("show_img", 0, 0, null, true);
		}
				select{
						$PosY_02=Integer($img_Y3_02 * ScrollbarValue("@Scroll2"));
						$PosY3_02=$PosY2_02 - $PosY_02;
						$PosY2_02=$PosY_02;
						Move("show_img2",0,@0,@$PosY3_02, null, true);
						if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll2{}
					case CLICK{$nextcg=0;$img_Loop002=false;$img_Loop003=true;}
					case CLICK2{$nextcg=0;$img_Loop002=false;$img_Loop003=true;}
					case CLICK3{$nextcg=0;$img_Loop002=false;$img_Loop001=true;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop002=false;$img_Loop003=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_Loop002=false;$img_Loop001=true;break;}
				}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_02=0;$nextcg=0;break;}
			}
			if($img_Loop003==true){
					$PosY3_03=-$PosY3_03;
					Move("show_img3",0,@0,@$PosY3_03, null, true);
						$PosY_03=Integer($img_Y3_03 * ScrollbarValue("@Scroll3"));
						$PosY3_03=$PosY2_03 - $PosY_03;
						$PosY2_03=$PosY_03;
						Move("show_img3",0,@0,@$PosY3_03, null, true);
			Fade("show_img3", 300, 1000, null, true);
			Fade("show_img2", 0, 0, null, true);
				select{
						$PosY_03=Integer($img_Y3_03 * ScrollbarValue("@Scroll3"));
						$PosY3_03=$PosY2_03 - $PosY_03;
						$PosY2_03=$PosY_03;
						Move("show_img3",0,@0,@$PosY3_03, null, true);
						if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll3{}
					case CLICK{$nextcg=0;break;}
					case CLICK2{$nextcg=1;break;}
					case CLICK3{$nextcg=0;$img_Loop003=false;$img_back=true;$img_Loop002=true;}
							if($SYSTEM_XBOX360_button_rb_down){$GOTO_NEXTCGR=true;break;}
							if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_Loop003=false;$img_back=true;$img_Loop002=true;break;}
					}
			}
							if($GOTO_NEXTCGR==true){$GOTO_NEXTCGR=false;$PosY3_01=0;$PosY2_03=0;$nextcg=1;break;}
							if($GOTO_NEXTCGL==true){$GOTO_NEXTCGL=false;$PosY2_03=0;$nextcg=-1;break;}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_03=0;$nextcg=0;break;}
				}

	}else if($actCount==2){
		if($act==1||$act==2){

			if($nextcg==-1){
				$img_Loop001=false;
				$img_Loop002=true;
				Fade("show_img2",0,1000,null,true);
				Fade("show_old",300,0,null,false);
			}else if($nextcg==1){
				$img_Loop001=true;
				$img_Loop002=false;
			}else{
				$img_Loop001=true;
				$img_Loop002=false;
			}

				$img_X = ImageHorizon("show_img");
				$img_X2 = $img_X-1024;
				$img_X3 = $img_X2;
					SetScrollbar("XScroll", "XScroll");
					SetScrollSpeed("XScroll",15);

				$img_X_02 = ImageHorizon("show_img2");
				$img_X2_02 = $img_X_02-1024;
				$img_X3_02 = $img_X2_02;
					SetScrollbar("XScroll2", "XScroll2");
					SetScrollSpeed("XScroll2",15);

			$PosX_01=0;
			$PosX2_01=0;
			$PosX3_01=0;
			$PosX_02=0;
			$PosX2_02=0;
			$PosX3_02=0;

				while(1){
			if($img_Loop001==true){
					$PosX3_01=-$PosX3_01;
					Move("show_img",0,@$PosX3_01,@0, null, true);
					$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
				select{
						$PosX_01=Integer($img_X3 * ScrollbarValue("@XScroll"));
						$PosX3_01=$PosX2_01 - $PosX_01;
						$PosX2_01=$PosX_01;
						Move("show_img",0,@$PosX3_01,@0, null, true);
				Fade("show_img", 0, 1000, null, true);
				Fade("show_img2", 300, 0, null, true);
					if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case XScroll{}
					case CLICK{$nextcg=0;$img_Loop001=false;$img_Loop002=true;}
					case CLICK2{$nextcg=0;$img_Loop001=false;$img_Loop002=true;}
					case CLICK3{$nextcg=-1;break;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop001=false;$img_Loop002=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$GOTO_NEXTCGL=true;break;}
				}
							if($GOTO_END==true){$GOTO_END=false;$PosX02_01=0;$nextcg=0;break;}
			}

			if($img_Loop002==true){
					$PosX3_02=-$PosX3_02;
					Move("show_img2",0,@$PosX3_02,@0, null, true);
						$PosX_02=Integer($img_X3_02 * ScrollbarValue("@XScroll2"));
						$PosX3_02=$PosX2_02 - $PosX_02;
						$PosX2_02=$PosX_02;
						Move("show_img2",0,@$PosX3_02,@0, null, true);
			Fade("show_img2", 300, 1000, null, true);
			Fade("show_img", 0, 0, null, true);
				select{
						$PosX_02=Integer($img_X3_02 * ScrollbarValue("@XScroll2"));
						$PosX3_02=$PosX2_02 - $PosX_02;
						$PosX2_02=$PosX_02;
						Move("show_img2",0,@$PosX3_02,@0, null, true);
							if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case XScroll2{}
					case CLICK{$nextcg=0;break;}
					case CLICK2{$nextcg=1;break;}
					case CLICK3{$nextcg=0;$img_Loop002=false;$img_Loop001=true;}
							if($SYSTEM_XBOX360_button_rb_down){$GOTO_NEXTCGR=true;break;}
							if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_back=true;$img_Loop001=true;break;}
					}
			}
							if($GOTO_NEXTCGR==true){$GOTO_NEXTCGR=false;$nextcg=1;break;}
							if($GOTO_NEXTCGL==true){$GOTO_NEXTCGL=false;$nextcg=-1;break;}
							if($GOTO_END==true){$GOTO_END=false;$PosX2_02=0;$nextcg=0;break;}
				}
		}else{

			if($nextcg==-1){
				$img_Loop001=false;
				$img_Loop002=true;
				Fade("show_img2",0,1000,null,true);
				Fade("show_old",300,0,null,false);
			}else if($nextcg==1){
				$img_Loop001=true;
				$img_Loop002=false;
			}else{
				$img_Loop001=true;
				$img_Loop002=false;
			}

				$img_Y = ImageVertical("show_img");
				$img_Y2 = $img_Y-576;
				$img_Y3 = $img_Y2;
					SetScrollbar("Scroll", "Scroll");
					SetScrollSpeed("Scroll",15);

				$img_Y_02 = ImageVertical("show_img2");
				$img_Y2_02 = $img_Y_02-576;
				$img_Y3_02 = $img_Y2_02;
				SetScrollbar("Scroll2", "Scroll2");
				SetScrollSpeed("Scroll2",15);

			$PosY1_01=0;
			$PosY2_01=0;
			$PosY3_01=0;
			$PosY1_02=0;
			$PosY2_02=0;
			$PosY3_02=0;

			while(1){
			if($img_Loop001==true){
					$PosY3_01=-$PosY3_01;
					Move("show_img",0,@0,@$PosY3_01, null, true);
					$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
				select{
						if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
						$PosY_01=Integer($img_Y3 * ScrollbarValue("@Scroll"));
						$PosY3_01=$PosY2_01 - $PosY_01;
						$PosY2_01=$PosY_01;
						Move("show_img",0,@0,@$PosY3_01, null, true);
			Fade("show_img", 0, 1000, null, true);
			Fade("show_img2", 300, 0, null, true);
					case Scroll{}
					case CLICK{$nextcg=0;$img_Loop001=false;$img_Loop002=true;}
					case CLICK2{$nextcg=0;$img_Loop001=false;$img_Loop002=true;}
					case CLICK3{$nextcg=-1;break;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop001=false;$img_Loop002=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$GOTO_NEXTCGL=true;break;}
				}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_01=0;$nextcg=0;break;}
			}
			if($img_Loop002==true){
					$PosY3_02=-$PosY3_02;
					Move("show_img2",0,@0,@$PosY3_02, null, true);
						$PosY_02=Integer($img_Y3_02 * ScrollbarValue("@Scroll2"));
						$PosY3_02=$PosY2_02 - $PosY_02;
						$PosY2_02=$PosY_02;
						Move("show_img2",0,@0,@$PosY3_02, null, true);
			Fade("show_img2", 300, 1000, null, true);
			Fade("show_img", 0, 0, null, true);
				select{
						$PosY_02=Integer($img_Y3_02 * ScrollbarValue("@Scroll2"));
						$PosY3_02=$PosY2_02 - $PosY_02;
						$PosY2_02=$PosY_02;
						Move("show_img2",0,@0,@$PosY3_02, null, true);
							if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll2{}
					case CLICK{$nextcg=0;break;}
					case CLICK2{$nextcg=1;break;}
					case CLICK3{$nextcg=0;$img_Loop002=false;$img_back=true;$img_Loop001=true;}
							if($SYSTEM_XBOX360_button_rb_down){$GOTO_NEXTCGR=true;break;}
							if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_Loop002=false;$img_back=true;$img_Loop001=true;break;}
					}
			}
							if($GOTO_NEXTCGR==true){$GOTO_NEXTCGR=false;$nextcg=1;break;}
							if($GOTO_NEXTCGL==true){$GOTO_NEXTCGL=false;$nextcg=-1;break;}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_01=0;$PosY2_02=0;$nextcg=0;break;}
				}
		}
..//5Count
	}else if($actCount==5){

		if($nextcg==-1){
			$img_Loop001=false;
			$img_Loop002=false;
			$img_Loop003=false;
			$img_Loop004=false;
			$img_Loop005=true;
				Fade("show_img5",0,1000,null,true);
				Fade("show_old",300,0,null,false);
		}else if($nextcg==1){
			$img_Loop001=true;
			$img_Loop002=false;
			$img_Loop003=false;
			$img_Loop004=false;
			$img_Loop005=false;
		}else{
			$img_Loop001=true;
			$img_Loop002=false;
			$img_Loop003=false;
			$img_Loop004=false;
			$img_Loop005=false;
		}

				$img_Y = ImageVertical("show_img");
				$img_Y2 = $img_Y-576;
				$img_Y3 = $img_Y2;
					SetScrollbar("Scroll", "Scroll");
					SetScrollSpeed("Scroll",15);

				$img_Y_02 = ImageVertical("show_img2");
				$img_Y2_02 = $img_Y_02-576;
				$img_Y3_02 = $img_Y2_02;
				SetScrollbar("Scroll2", "Scroll2");
				SetScrollSpeed("Scroll2",15);

				$img_Y_03 = ImageVertical("show_img3");
				$img_Y2_03 = $img_Y_03-576;
				$img_Y3_03 = $img_Y2_03;
				SetScrollbar("Scroll3", "Scroll3");
				SetScrollSpeed("Scroll3",15);

				$img_Y_04 = ImageVertical("show_img4");
				$img_Y2_04 = $img_Y_04-576;
				$img_Y3_04 = $img_Y2_04;
				SetScrollbar("Scroll4", "Scroll4");
				SetScrollSpeed("Scroll4",15);

				$img_Y_05 = ImageVertical("show_img5");
				$img_Y2_05 = $img_Y_05-576;
				$img_Y3_05 = $img_Y2_05;
				SetScrollbar("Scroll5", "Scroll5");
				SetScrollSpeed("Scroll5",15);

			$PosY1_01=0;
			$PosY2_01=0;
			$PosY3_01=0;
			$PosY1_02=0;
			$PosY2_02=0;
			$PosY3_02=0;
			$PosY1_03=0;
			$PosY2_03=0;
			$PosY3_03=0;
			$PosY1_04=0;
			$PosY2_04=0;
			$PosY3_04=0;
			$PosY1_05=0;
			$PosY2_05=0;
			$PosY3_05=0;

				while(1){
			if($img_Loop001==true){
					$PosY3_01=-$PosY3_01;
					Move("show_img",0,@0,@$PosY3_01, null, true);
					$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
				select{
						$PosY_01=Integer($img_Y3 * ScrollbarValue("@Scroll"));
						$PosY3_01=$PosY2_01 - $PosY_01;
						$PosY2_01=$PosY_01;
						Move("show_img",0,@0,@$PosY3_01, null, true);
			Fade("show_img", 0, 1000, null, true);
			Fade("show_img2", 300, 0, null, true);
					if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll{}
					case CLICK{$nextcg=0;$img_Loop001=false;$img_Loop002=true;}
					case CLICK2{$nextcg=0;$img_Loop001=false;$img_Loop002=true;}
					case CLICK3{$nextcg=-1;break;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop001=false;$img_Loop002=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$GOTO_NEXTCGL=true;break;}
				}
					if($GOTO_END==true){$GOTO_END=false;$PosY2_01=0;$nextcg=0;break;}
			}
			if($img_Loop002==true){
					$PosY3_02=-$PosY3_02;
					Move("show_img2",0,@0,@$PosY3_02, null, true);
						$PosY_02=Integer($img_Y3_02 * ScrollbarValue("@Scroll2"));
						$PosY3_02=$PosY2_02 - $PosY_02;
						$PosY2_02=$PosY_02;
						Move("show_img2",0,@0,@$PosY3_02, null, true);
				if($img_back==true){
					Fade("show_img2", 0, 1000, null, true);
					Fade("show_img3", 300, 0, null, true);
					$img_back=false;
				}else{
					Fade("show_img2", 300, 1000, null, true);
					Fade("show_img", 0, 0, null, true);
				}
				select{
						$PosY_02=Integer($img_Y3_02 * ScrollbarValue("@Scroll2"));
						$PosY3_02=$PosY2_02 - $PosY_02;
						$PosY2_02=$PosY_02;
						Move("show_img2",0,@0,@$PosY3_02, null, true);
					if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll2{}
					case CLICK{$nextcg=0;$img_Loop002=false;$img_Loop003=true;}
					case CLICK2{$nextcg=0;$img_Loop002=false;$img_Loop003=true;}
					case CLICK3{$nextcg=0;$img_Loop002=false;$img_Loop001=true;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop002=false;$img_Loop003=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_Loop002=false;$img_Loop001=true;break;}
				}
					if($GOTO_END==true){$GOTO_END=false;$PosY2_02=0;$nextcg=0;break;}
			}
			if($img_Loop003==true){
					$PosY3_04=-$PosY3_03;
					Move("show_img3",0,@0,@$PosY3_03, null, true);
						$PosY_03=Integer($img_Y3_03 * ScrollbarValue("@Scroll3"));
						$PosY3_03=$PosY2_03 - $PosY_03;
						$PosY2_03=$PosY_03;
						Move("show_img3",0,@0,@$PosY3_03, null, true);
				select{
						$PosY_03=Integer($img_Y3_03 * ScrollbarValue("@Scroll3"));
						$PosY3_03=$PosY2_03 - $PosY_03;
						$PosY2_03=$PosY_03;
						Move("show_img3",0,@0,@$PosY3_03, null, true);
		if($img_back02==true){
			Fade("show_img3", 0, 1000, null, true);
			Fade("show_img4", 300, 0, null, true);
			$img_back02=false;
		}else{
			Fade("show_img3", 300, 1000, null, true);
			Fade("show_img2", 0, 0, null, true);
		}
							if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll3{}
					case CLICK{$nextcg=0;$img_Loop003=false;$img_Loop004=true;}
					case CLICK2{$nextcg=0;$img_Loop003=false;$img_Loop004=true;}
					case CLICK3{$nextcg=0;$img_Loop003=false;$img_Loop002=true;$img_back=true;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop003=false;$img_Loop004=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_Loop003=false;$img_back=true;$img_Loop002=true;break;}
				}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_03=0;$nextcg=0;break;}
			}
			if($img_Loop004==true){
					$PosY3_04=-$PosY3_04;
					Move("show_img4",0,@0,@$PosY3_04, null, true);
						$PosY_04=Integer($img_Y3_04 * ScrollbarValue("@Scroll4"));
						$PosY3_04=$PosY2_04 - $PosY_04;
						$PosY2_04=$PosY_04;
						Move("show_img4",0,@0,@$PosY3_04, null, true);
		if($img_back03==true){
			Fade("show_img4", 0, 1000, null, true);
			Fade("show_img5", 300, 0, null, true);
			$img_back03=false;
		}else{
			Fade("show_img4", 300, 1000, null, true);
			Fade("show_img3", 0, 0, null, true);
			$img_back02=false;
		}
				select{
						$PosY_04=Integer($img_Y3_04 * ScrollbarValue("@Scroll4"));
						$PosY3_04=$PosY2_04 - $PosY_04;
						$PosY2_04=$PosY_04;
						Move("show_img4",0,@0,@$PosY3_04, null, true);
							if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll4{}
					case CLICK{$nextcg=0;$img_Loop004=false;$img_Loop005=true;}
					case CLICK2{$nextcg=0;$img_Loop004=false;$img_Loop005=true;}
					case CLICK3{$nextcg=0;$img_Loop004=false;$img_Loop003=true;$img_back02=true;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop004=false;$img_Loop005=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_Loop004=false;$img_Loop003=true;$img_back02=true;break;}
				}
					if($GOTO_END==true){$GOTO_END=false;$PosY2_04=0;$nextcg=0;break;}
			}
			if($img_Loop005==true){
					$PosY3_05=-$PosY3_05;
					Move("show_img5",0,@0,@$PosY3_05, null, true);
						$PosY_05=Integer($img_Y3_05 * ScrollbarValue("@Scroll5"));
						$PosY3_05=$PosY2_05 - $PosY_05;
						$PosY2_05=$PosY_05;
						Move("show_img5",0,@0,@$PosY3_05, null, true);
			Fade("show_img5", 300, 1000, null, true);
			Fade("show_img4", 0, 0, null, true);
			$img_back03=false;
				select{
						$PosY_05=Integer($img_Y3_05 * ScrollbarValue("@Scroll5"));
						$PosY3_05=$PosY2_05 - $PosY_05;
						$PosY2_05=$PosY_05;
						Move("show_img5",0,@0,@$PosY3_05, null, true);
					if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll5{}
					case CLICK{$nextcg=0;break;}
					case CLICK2{$nextcg=1;break;}
					case CLICK3{$nextcg=0;$img_Loop005=false;$img_back03=true;$img_Loop004=true;}
							if($SYSTEM_XBOX360_button_rb_down){$GOTO_NEXTCGR=true;break;}
							if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_Loop005=false;$img_Loop004=true;$img_back03=true;break;}
					}
			}
							if($GOTO_NEXTCGR==true){$GOTO_NEXTCGR=false;$nextcg=1;break;}
							if($GOTO_NEXTCGL==true){$GOTO_NEXTCGL=false;$nextcg=-1;break;}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_05=0;$nextcg=0;break;}
				}
	}else if($actCount==4){

		if($nextcg==-1){
			$img_Loop001=false;
			$img_Loop002=false;
			$img_Loop003=false;
			$img_Loop004=true;
				Fade("show_img4",300,1000,null,true);
				Fade("show_old",0,0,null,false);
		}else if($nextcg==1){
			$img_Loop001=true;
			$img_Loop002=false;
			$img_Loop003=false;
			$img_Loop004=false;
		}else{
			$img_Loop001=true;
			$img_Loop002=false;
			$img_Loop003=false;
			$img_Loop004=false;
		}

				$img_Y = ImageVertical("show_img");
				$img_Y2 = $img_Y-576;
				$img_Y3 = $img_Y2;
					SetScrollbar("Scroll", "Scroll");
					SetScrollSpeed("Scroll",15);

				$img_Y_02 = ImageVertical("show_img2");
				$img_Y2_02 = $img_Y_02-576;
				$img_Y3_02 = $img_Y2_02;
				SetScrollbar("Scroll2", "Scroll2");
				SetScrollSpeed("Scroll2",15);

				$img_Y_03 = ImageVertical("show_img3");
				$img_Y2_03 = $img_Y_03-576;
				$img_Y3_03 = $img_Y2_03;
				SetScrollbar("Scroll3", "Scroll3");
				SetScrollSpeed("Scroll3",15);

				$img_Y_04 = ImageVertical("show_img4");
				$img_Y2_04 = $img_Y_04-576;
				$img_Y3_04 = $img_Y2_04;
				SetScrollbar("Scroll4", "Scroll4");
				SetScrollSpeed("Scroll4",15);

			$PosY1_01=0;
			$PosY2_01=0;
			$PosY3_01=0;
			$PosY1_02=0;
			$PosY2_02=0;
			$PosY3_02=0;
			$PosY1_03=0;
			$PosY2_03=0;
			$PosY3_03=0;
			$PosY1_04=0;
			$PosY2_04=0;
			$PosY3_04=0;

				while(1){
					$SYSTEM_r_button_down=false;
					$SYSTEM_XBOX360_button_b_down=false;
			if($img_Loop001==true){
					$PosY3_01=-$PosY3_01;
					Move("show_img",0,@0,@$PosY3_01, null, true);
				select{
						$PosY_01=Integer($img_Y3 * ScrollbarValue("@Scroll"));
						$PosY3_01=$PosY2_01 - $PosY_01;
						$PosY2_01=$PosY_01;
						Move("show_img",0,@0,@$PosY3_01, null, true);
			Fade("show_img", 0, 1000, null, true);
			Fade("show_img2", 300, 0, null, true);
					if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll{}
					case CLICK{$nextcg=0;$img_Loop001=false;$img_Loop002=true;}
					case CLICK2{$nextcg=0;$img_Loop001=false;$img_Loop002=true;}
					case CLICK3{$nextcg=-1;break;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop001=false;$img_Loop002=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$GOTO_NEXTCGL=true;break;}
				}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_01=0;$nextcg=0;break;}
			}
			if($img_Loop002==true){
					$PosY3_02=-$PosY3_02;
					Move("show_img2",0,@0,@$PosY3_02, null, true);
						$PosY_02=Integer($img_Y3_02 * ScrollbarValue("@Scroll2"));
						$PosY3_02=$PosY2_02 - $PosY_02;
						$PosY2_02=$PosY_02;
						Move("show_img2",0,@0,@$PosY3_02, null, true);
				if($img_back==true){
					Fade("show_img2", 0, 1000, null, true);
					Fade("show_img3", 300, 0, null, true);
					$img_back=false;
				}else{
					Fade("show_img2", 300, 1000, null, true);
					Fade("show_img", 0, 0, null, true);
				}
				select{
						$PosY_02=Integer($img_Y3_02 * ScrollbarValue("@Scroll2"));
						$PosY3_02=$PosY2_02 - $PosY_02;
						$PosY2_02=$PosY_02;
						Move("show_img2",0,@0,@$PosY3_02, null, true);
					if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll2{}
					case CLICK{$nextcg=0;$img_Loop002=false;$img_Loop003=true;}
					case CLICK2{$nextcg=0;$img_Loop002=false;$img_Loop003=true;}
					case CLICK3{$nextcg=0;$img_Loop002=false;$img_Loop001=true;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop002=false;$img_Loop003=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_Loop002=false;$img_Loop001=true;break;}
				}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_02=0;$nextcg=0;break;}
			}
			if($img_Loop003==true){
					$PosY3_04=-$PosY3_03;
					Move("show_img3",0,@0,@$PosY3_03, null, true);
						$PosY_03=Integer($img_Y3_03 * ScrollbarValue("@Scroll3"));
						$PosY3_03=$PosY2_03 - $PosY_03;
						$PosY2_03=$PosY_03;
						Move("show_img3",0,@0,@$PosY3_03, null, true);
				select{
						$PosY_03=Integer($img_Y3_03 * ScrollbarValue("@Scroll3"));
						$PosY3_03=$PosY2_03 - $PosY_03;
						$PosY2_03=$PosY_03;
						Move("show_img3",0,@0,@$PosY3_03, null, true);
		if($img_back02==true){
			Fade("show_img3", 0, 1000, null, true);
			Fade("show_img4", 300, 0, null, true);
			$img_back02=false;
		}else{
			Fade("show_img3", 300, 1000, null, true);
			Fade("show_img2", 0, 0, null, true);
		}
					if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll3{}
					case CLICK{$nextcg=0;$img_Loop003=false;$img_Loop004=true;}
					case CLICK2{$nextcg=0;$img_Loop003=false;$img_Loop004=true;}
					case CLICK3{$nextcg=0;$img_Loop003=false;$img_Loop002=true;$img_back=true;}
					if($SYSTEM_XBOX360_button_rb_down){$nextcg=0;$img_Loop003=false;$img_Loop004=true;break;}
					if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_Loop003=false;$img_back=true;$img_Loop002=true;break;}
				}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_03=0;$nextcg=0;break;}
			}
			if($img_Loop004==true){
					$PosY3_04=-$PosY3_04;
					Move("show_img4",0,@0,@$PosY3_04, null, true);
						$PosY_04=Integer($img_Y3_04 * ScrollbarValue("@Scroll4"));
						$PosY3_04=$PosY2_04 - $PosY_04;
						$PosY2_04=$PosY_04;
						Move("show_img4",0,@0,@$PosY3_04, null, true);
			Fade("show_img4", 300, 1000, null, true);
			Fade("show_img3", 0, 0, null, true);
			$img_back02=false;
				select{
						$PosY_04=Integer($img_Y3_04 * ScrollbarValue("@Scroll4"));
						$PosY3_04=$PosY2_04 - $PosY_04;
						$PosY2_04=$PosY_04;
						Move("show_img4",0,@0,@$PosY3_04, null, true);
					if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$GOTO_END=true;break;}
					case Scroll4{}
					case CLICK{$nextcg=0;break;}
					case CLICK2{$nextcg=1;break;}
					case CLICK3{$nextcg=0;$img_Loop004=false;$img_back02=true;$img_Loop003=true;}
							if($SYSTEM_XBOX360_button_rb_down){$GOTO_NEXTCGR=true;break;}
							if($SYSTEM_XBOX360_button_lb_down){$nextcg=0;$img_Loop004=false;$img_Loop003=true;$img_back02=true;break;}
				}
			}
							if($GOTO_NEXTCGR==true){$GOTO_NEXTCGR=false;$nextcg=1;break;}
							if($GOTO_NEXTCGL==true){$GOTO_NEXTCGL=false;$nextcg=-1;break;}
							if($GOTO_END==true){$GOTO_END=false;$PosY2_04=0;$nextcg=0;break;}
				}
	}
		$act=$actold;
		$i++;
			$SYSTEM_XBOX360_button_rb_down = false;
			$SYSTEM_XBOX360_button_lb_down = false;
	}//while終了

	Delete("show_old");
	Delete("show_old2");

		Wait(16);

	if($nextcg==0){
		CreateTexture("show_old",1610,center,middle,SCREEN);
		SetAlias("show_old","show_old");
		Wait(16);
		Delete("CLICK");
		Delete("CLICK2");
		Delete("CLICK3");
		Delete("@Scroll");
		Delete("@Scroll*");
		Delete("show_img");
		Delete("show_img*");
	}else{
		CreateTexture("show_old2",2010,center,middle,SCREEN);
		SetAlias("show_old2","show_old2");
		Wait(16);
		Delete("CLICK");
		Delete("CLICK2");
		Delete("CLICK3");
		Delete("@Scroll");
		Delete("@Scroll*");
	}
}

function wait_show($act,$x,$y)
{
	$n=3000;
	while(1){
		WaitKey();
		if(!RemainTime("show_img")){break;}else{$n=RemainTime("show_img");}
		Move("show_img",0,@0,@0,null,false);
		WaitKey();
		if($act==1){
			Move("show_img",$n,@0,$y,null,false);
		}else if($act==2){
			Move("show_img",$n,@0,0,null,false);
		}else if($act==3){
			Move("show_img",$n,0,@0,null,false);
		}else if($act==4){
			Move("show_img",$n,$x,@0,null,false);
		}
		if(!RemainTime("show_img")){break;}
	}
}

function set_focus()
{
	focus("CG_1","CG_2",RIGHT);
	focus("CG_2","CG_3",RIGHT);
	focus("CG_3","CG_4",RIGHT);
	focus("CG_4","CG_5",RIGHT);
	focus("CG_5","CG_1",RIGHT);

	if($CGLIB_page==4&&$chara==2){
	focus("CG_6","CG_7",RIGHT);
	focus("CG_7","CG_8",RIGHT);
	focus("CG_8","CG_6",RIGHT);
	}else{
	focus("CG_6","CG_7",RIGHT);
	focus("CG_7","CG_8",RIGHT);
	focus("CG_8","CG_9",RIGHT);
	focus("CG_9","CG_10",RIGHT);
	focus("CG_10","CG_6",RIGHT);
	}

	focus("CG_11","CG_12",RIGHT);
	focus("CG_12","CG_13",RIGHT);
	focus("CG_13","CG_14",RIGHT);
	focus("CG_14","CG_15",RIGHT);
	focus("CG_15","CG_11",RIGHT);

	if($CGLIB_page==7&&$chara==1){

	}else{
	focus("CG_16","CG_17",RIGHT);
	focus("CG_17","CG_18",RIGHT);
	focus("CG_18","CG_19",RIGHT);
	focus("CG_19","CG_20",RIGHT);
	focus("CG_20","CG_16",RIGHT);
	}

	focus("CG_1","CG_5",LEFT);
	focus("CG_2","CG_1",LEFT);
	focus("CG_3","CG_2",LEFT);
	focus("CG_4","CG_3",LEFT);
	focus("CG_5","CG_4",LEFT);

	if($CGLIB_page==4&&$chara==2){
	focus("CG_6","CG_8",LEFT);
	focus("CG_7","CG_6",LEFT);
	focus("CG_8","CG_7",LEFT);
	}else{
	focus("CG_6","CG_10",LEFT);
	focus("CG_7","CG_6",LEFT);
	focus("CG_8","CG_7",LEFT);
	focus("CG_9","CG_8",LEFT);
	focus("CG_10","CG_9",LEFT);
	}

	focus("CG_11","CG_15",LEFT);
	focus("CG_12","CG_11",LEFT);
	focus("CG_13","CG_12",LEFT);
	focus("CG_14","CG_13",LEFT);
	focus("CG_15","CG_14",LEFT);

	if($CGLIB_page==7&&$chara==1){
	}else{
		focus("CG_16","CG_20",LEFT);
		focus("CG_17","CG_16",LEFT);
		focus("CG_18","CG_17",LEFT);
		focus("CG_19","CG_18",LEFT);
		focus("CG_20","CG_19",LEFT);
	}

	if($CGLIB_page==4&&$chara==2){
		focus("CG_1","CG_6",DOWN);
		focus("CG_2","CG_7",DOWN);
		focus("CG_3","CG_8",DOWN);
		focus("CG_4","BACK",DOWN);
		focus("CG_5","NEXT",DOWN);
		focus("CG_6","DATA_A",DOWN);
		focus("CG_7","DATA_A",DOWN);
		focus("CG_8","DATA_B",DOWN);
	}else{
		focus("CG_1","CG_6",DOWN);
		focus("CG_2","CG_7",DOWN);
		focus("CG_3","CG_8",DOWN);
		focus("CG_4","CG_9",DOWN);
		focus("CG_5","CG_10",DOWN);
		focus("CG_6","CG_11",DOWN);
		focus("CG_7","CG_12",DOWN);
		focus("CG_8","CG_13",DOWN);
		focus("CG_9","CG_14",DOWN);
		focus("CG_10","CG_15",DOWN);
	}

	if($CGLIB_page==7&&$chara==1){
		focus("CG_11","DATA_A",DOWN);
		focus("CG_12","DATA_A",DOWN);
		focus("CG_13","DATA_B",DOWN);
		focus("CG_14","BACK",DOWN);
		focus("CG_15","NEXT",DOWN);
		focus("CG_1","DATA_A",UP);
		focus("CG_2","DATA_A",UP);
		focus("CG_3","DATA_B",UP);
		focus("CG_4","BACK",UP);
		focus("CG_5","NEXT",UP);
		focus("DATA_A","CG_11",UP);
		focus("DATA_B","CG_12",UP);
		focus("BACK","CG_14",UP);
		focus("NEXT","CG_15",UP);
	}else{
		focus("CG_11","CG_16",DOWN);
		focus("CG_12","CG_17",DOWN);
		focus("CG_13","CG_18",DOWN);
		focus("CG_14","CG_19",DOWN);
		focus("CG_15","CG_20",DOWN);
		focus("CG_16","DATA_A",DOWN);
		focus("CG_17","DATA_A",DOWN);
		focus("CG_18","DATA_B",DOWN);
		focus("CG_19","BACK",DOWN);
		focus("CG_20","NEXT",DOWN);
		focus("CG_1","DATA_A",UP);
		focus("CG_2","DATA_A",UP);
		focus("CG_3","DATA_B",UP);
		focus("CG_4","BACK",UP);
		focus("CG_5","NEXT",UP);
		focus("CG_16","CG_11",UP);
		focus("CG_17","CG_12",UP);
		focus("CG_18","CG_13",UP);
		focus("CG_19","CG_14",UP);
		focus("CG_20","CG_15",UP);
		focus("DATA_A","CG_16",UP);
		focus("DATA_B","CG_18",UP);
		focus("BACK","CG_19",UP);
		focus("NEXT","CG_20",UP);
	}

	if($CGLIB_page==4&&$chara==2){
	focus("CG_6","CG_1",UP);
	focus("CG_7","CG_2",UP);
	focus("CG_8","CG_3",UP);
	focus("BACK","CG_4",UP);
	focus("NEXT","CG_5",UP);
	focus("DATA_A","CG_6",UP);
	focus("DATA_B","CG_8",UP);
	}else{
	focus("CG_6","CG_1",UP);
	focus("CG_7","CG_2",UP);
	focus("CG_8","CG_3",UP);
	focus("CG_9","CG_4",UP);
	focus("CG_10","CG_5",UP);
	focus("CG_11","CG_6",UP);
	focus("CG_12","CG_7",UP);
	focus("CG_13","CG_8",UP);
	focus("CG_14","CG_9",UP);
	focus("CG_15","CG_10",UP);
	}

	focus("DATA_A","DATA_B",RIGHT);
	focus("DATA_B","BACK",RIGHT);
	focus("BACK","NEXT",RIGHT);

//exit→DATA_A
	focus("NEXT","DATA_A",RIGHT);
//exit→next
	focus("DATA_A","NEXT",LEFT);

	focus("DATA_B","DATA_A",LEFT);
	focus("BACK","DATA_B",LEFT);
	focus("NEXT","BACK",LEFT);
	focus("DATA_A","CG_1",DOWN);
	focus("DATA_B","CG_3",DOWN);
	focus("BACK","CG_4",DOWN);
	focus("NEXT","CG_5",DOWN);


}

function focus($a,$b,$key)
{
	$a=$a+"/MouseUsual/img";
	$b=$b+"/MouseUsual/img";
	SetNextFocus($a,$b,$key);
}


function DebAll(){

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
	//追加修正【0812/25】
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
//差分修正【08/12/25】
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
//ファイル名修正【08/12/25】
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
//差分修正【08/12/25】
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
//差分修正【08/12/25】
	#ev113_01_2_梨深VS梢_a=true;
	#ev114_01_6_梨深キス2_a=true;
	#ev114_02_6_梨深キス2_a=true;
	#ev115_01_6_梨深瀕死_a=true;
	#ev115_02_6_梨深瀕死_a=true;
	#ev115_03_6_梨深瀕死_a=true;
	#ev115_04_6_梨深瀕死_a=true;
//差分修正【08/12/25】
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
//差分修正【08/12/25】
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
//追加修正【08/12/25】
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
//追加修正【08/12/25】
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
//追加修正【08/12/25】
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
//追加修正【08/01/21】
	#bg160_03_3_ダンボール箱_a=true;
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
//追加修正【09/01/30】
	#bg168_01_3_ダーススパイダーメット_a=true;

}



function CGEV()
{
	//★★★★ロック
	XBOX360_LockVideo(true);
	
	if($plus){
		$CGLIB_page++;
	}else{
		$CGLIB_page--;
	}

	$cgwhile=true;
	while($cgwhile)
	{

		if($CGLIB_page==0){
				$CGLIB_page=7;
		}else if($CGLIB_page==8){
				$CGLIB_page=1;
		}

		if($CGLIB_page==1){
			if(!#ev001_01_1_INT01近づく梨深_a&&!#ev013_01_1_拓巳笑い口UP_a&&!#ev013_02_1_拓巳笑い口UP_a&&!#ev013_03_1_拓巳笑い口UP_a&&!#ev005_01_3_杭貼付け_a&&!#ev006_01_3_グロ画像_a&&!#ev006_02_3_グロ画像_a&&!#ev007_01_3_十字架杭拓巳_a&&!#ev007_02_6_十字架杭拓巳_a&&!#ev009_01_4_腕掴みミイラ_a&&!#ev010_01_4_腕掴み梨深_a&&!#ev012_01_1_星来横たわり_a&&!#ev008_01_4_INT02あやせ歌う_a&&!#ev801_01_1_七海来訪_a&&!#ev801_02_3_七海来訪_a&&!#ev015_01_1_七海妄想エロ_a&&!#ev015_02_1_七海妄想エロ_a&&!#ev802_01_1_七海コーラ死_a&&!#ev016_01_1_七海携帯萌_a&&!#ev018_01_3_優愛_a&&!#ev803_01_3_優愛遭遇_a&&!#ev019_01_3_優愛妄想_a&&!#ev019_02_3_優愛妄想_a&&!#ev017_01_2_尾道_a&&!#ev017_02_2_尾道_a&&!#ev020_01_3_優愛足下_a&&!#ev021_01_3_十字架杭優愛_a&&!#ev057_01_1_拓巳子供時代_a&&!#ev050_01_1_受診小学生拓巳_a){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=20;
				}
				$cgwhile=false;
			}
		}else if($CGLIB_page==2){
			if(!#ev022_01_1_星来キス妄想_a&&!#ev144_01_1_拓巳ベッド_a&&!#bg119_01_3_監視カメラ映像_a&&!#ev037_01_3_INT13優愛自室でメール書く_a&&!#ev023_01_3_INT06優愛寝転がる_a&&!#ev024_01_3_あやせライブシーン_a&&!#ev025_01_3_あやせ脱ぎ妄想_a&&!#ev110_01_3_セナ足_a&&!#ev026_01_2_七海ハンバーガー_a&&!#ev026_02_2_七海ハンバーガー_a&&!#ev027_01_3_見下ろしセナ_a&&!#ev028_01_0_あやせライブ三住切る_a&&!#ev029_01_2_梨深ソファ腰掛け_a&&!#ev030_01_2_七海バングル_a&&!#bg136_01_1_希ＶＩＰルーム_a&&!#bg136_02_1_希ＶＩＰルーム_a&&!#bg136_03_1_chn希ＶＩＰルーム_a&&!#ev031_01_0_梢転校_a&&!#ev052_01_3_将軍車椅子_a&&!#ev052_02_3_将軍車椅子_a&&!#ev032_01_3_梨深だきしめ_a&&!#ev033_01_1_INT12セナ会話意識集中_a&&!#ev034_01_6_梨深と将軍の出会い_a&&!#ev035_01_0_梢コケる_a){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=20;
				}
				$cgwhile=false;
			}
		}else if($CGLIB_page==3){
			if(!#ev036_01_2_セナ白い鎖_a&&!#ev036_02_2_セナ白い鎖_a&&!#ev038_01_3_優愛ROOM37乱入_a&&!#ev040_01_3_あやせディソード出す_a&&!#ev040_02_3_あやせディソード出す_a&&!#ev039_01_3_あやせ白下着_a&&!#ev039_02_3_あやせ白下着_a&&!#ev054_01_3_刑事二人_a&&!#ev041_01_2_優愛教室ドアから見ている_a&&!#ev042_01_2_梨深に介抱される_a&&!#ev042_02_2_梨深に介抱される_a&&!#ev043_01_2_梨深CD貸してくれたら_a&&!#ev044_01_2_梨深下着Yシャツ_a&&!#ev044_02_2_梨深下着Yシャツ_a&&!#ev044_03_2_梨深下着Yシャツ_a&&!#ev045_01_3_INT16セナ機械破壊_a&&!#ev055_01_1_刑事と探偵会話_a&&!#ev056_01_1_優愛へたりこみ電話_a&&!#ev056_02_1_優愛へたりこみ電話_a&&!#ev064_01_1_あやせ飛び降りようと_a&&!#ev065_01_1_あやせ投身_a&&!#ev065_02_1_あやせ投身_a&&!#ev066_01_1_あやせ花壇落ち_a&&!#ev121_01_1_セナキス_a&&!#ev122_01_1_セナ押し倒し_a&&!#ev057_01_3_Q－FrontTVモニター_a&&!#ev067_01_6_血溜り七海_a&&!#ev056_01_1_9歳七海拓巳に食事_a){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=20;
				}
				$cgwhile=false;
			}
		}else if($CGLIB_page==4){
			//多すぎるので分断
			if(!#ev138_01_1_梢ちんすこう_a&&!#ev138_02_1_梢ちんすこう_a&&!#ev138_04_1_梢ちんすこう_a&&!#ev138_03_1_梢ちんすこう_a&&!#ev070_01_2_将軍と梨深in病院_a&&!#ev070_02_2_将軍と梨深in病院_a&&!#ev071_01_1_梢ディソード顕現_a&&!#ev071_02_2_梢ディソード顕現_a&&!#ev072_01_1_梢と波多野Roft前_a&&!#ev062_01_1_プリクラ_a&&!#ev062_02_1_プリクラ_a&&!#ev077_01_3_野呂瀬社長室_a&&!#ev068_01_1_七海廊下後姿_a&&!#ev069_01_1_七海廊下後姿髪かきあげ_a&&!#ev076_01_4_美愛くま抱き_a&&!#ev059_01_6_あやせ拷問_a&&!#ev116_01_6_梨深抱きつき_a&&!#ev078_01_3_葉月ナースめがね_a&&!#ev078_02_3_葉月ナースめがね_a){
				$EVCG41=true;
			}else{
				$EVCG41=false;
			}

			if(!#ev131_01_2_あやせ指なめ_a&&!#ev131_02_2_あやせ指なめ_a&&!#ev131_03_2_あやせ指なめ_a&&!#ev132_01_2_あやせ殺害_a&&!#ev132_01_2_あやせ殺害_b&&!#ev080_01_1_梨深七海ハイタッチ_a&&!#ev060_01_3_セナコンテナ登場_a&&!#ev060_02_3_セナコンテナ登場_a&&!#ev079_01_3_梨深セナ対決_a&&!#ev073_01_1_赤子を抱く母_a&&!#ev063_01_1_マジックミラー波多野_a&&!#ev063_02_1_マジックミラー波多野_a&&!#ev082_01_3_七海ゾンビ_a&&!#ev081_01_3_判死_a){
				$EVCG42=true;
			}else{
				$EVCG42=false;
			}

			if($EVCG41&&$EVCG42){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=20;
				}
				$cgwhile=false;
			}
		}else if($CGLIB_page==5){
			if(!#ev083_01_3_優愛ディソード_a&&!#ev084_01_3_ノアII_a&&!#ev085_01_3_七海ディソード_a&&!#ev086_01_6_梨深スポットライト膝抱え_a&&!#ev143_01_3_拓巳覚醒_a&&!#ev143_02_3_拓巳覚醒_a&&!#ev143_03_3_拓巳覚醒_a&&!#ev087_01_3_拓巳ディソード_a&&!#ev087_02_3_拓巳ディソード_a&&!#ev088_01_4_葉月救いあれ_a&&!#ev088_02_4_葉月救いあれ_a&&!#ev089_01_1_あやせ瓦礫下_a&&!#ev090_01_1_優愛瓦礫下_a&&!#ev091_01_1_七海と将軍_a&&!#ev092_01_1_拓巳振り返り_a&&!#ev092_02_1_拓巳振り返り_a&&!#ev092_03_1_拓巳振り返り_a&&!#ev093_01_1_セナ父殺し_a&&!#ev093_01_1_セナ父殺し_b&&!#ev094_01_1_セナ父首はね_a&&!#ev095_01_1_拓巳ダーツ逆転_a&&!#ev096_01_1_星来大群_a&&!#ev097_01_1_梨深はりつけ_a&&!#ev097_02_1_梨深はりつけ_a&&!#ev107_01_1_梨深祈る_a&&!#ev106_01_1_剣交え_a&&!#ev099_01_1_梨深レイプ_a){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=20;
				}
				$cgwhile=false;
			}
		}else if($CGLIB_page==6){
			if(!#ev098_01_1_野呂瀬ディソード_a&&!#ev108_02_1_串刺し_a&&!#ev100_06_1_６人祈る_a&&!#ev101_01_1_拓巳大蛇_a&&!#ev111_01_6_野呂瀬ラスト_a&&!#ev104_01_6_野呂瀬足_a&&!#ev105_01_1_拓巳光と消える_a&&!#ev105_02_1_拓巳光と消える_a&&!#ev102_01_1_Ａエンド1_a&&!#ev103_01_1_Ａエンド2_a&&!#ev112_01_3_梨深驚愕_a&&!#ev113_01_2_梨深VS梢_a&&!#ev114_01_6_梨深キス2_a&&!#ev114_02_6_梨深キス2_a&&!#ev115_01_6_梨深瀕死_a&&!#ev115_02_6_梨深瀕死_a&&!#ev115_03_6_梨深瀕死_a&&!#ev115_04_6_梨深瀕死_a&&!#ev117_01_6_梨深殺せない_a&&!#ev117_02_6_梨深殺せない_a&&!#ev118_01_6_セナ密着_a&&!#ev118_02_6_セナ密着_a&&!#ev118_03_6_セナ密着_a&&!#ev118_04_6_セナ密着_a&&!#ev118_05_6_セナ密着_a&&!#ev119_01_6_セナと赤ん坊_a&&!#ev119_02_6_セナと赤ん坊_a&&!#ev119_03_6_セナと赤ん坊_a&&!#ev120_02_6_ノアⅡ破壊_a&&!#ev120_01_6_ノアⅡ破壊_a&&!#ev123_01_6_優愛押し倒し_a&&!#ev124_01_6_優愛脱ぐ_a&&!#ev125_01_3_優愛すがりつき_a){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=20;
				}
				$cgwhile=false;
			}
		}else if($CGLIB_page==7){
			if(!#ev125_01_6_楠姉妹写真_a&&!#ev130_01_6_あやせ空見上げ_a&&!#ev127_01_6_あやせキス_a&&!#ev128_01_6_あやせしがみつき_a&&!#ev128_02_6_あやせしがみつき_a&&!#ev129_01_6_あやせ投擲_a&&!#ev129_02_6_あやせ投擲_a&&!#ev133_01_6_梢ほのぼの_a&&!#ev133_02_6_梢ほのぼの_a&&!#ev133_03_6_梢ほのぼの_a&&!#ev133_04_6_梢ほのぼの_a&&!#ev134_01_1_梢うずくまり_a&&!#ev134_02_1_梢うずくまり_a&&!#ev135_01_1_セナVS梢_a&&!#ev136_01_1_梢空見上げ_a&&!#ev136_02_1_梢空見上げ_a&&!#ev139_01_3_七海うずくまり_a&&!#ev139_02_3_七海うずくまり_a&&!#ev140_01_6_七海同衾_a&&!#ev140_02_6_七海同衾_a&&!#ev140_03_6_七海同衾_a&&!#ev141_01_1_七海キス_a&&!#ev126_01_5_優愛空見上げ_a&&!#ev137_01_6_梢セナ空見上げ_a&&!#ev999_01_1_おめでとう){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=16;
				}
				$cgwhile=false;
			}
		}
	}

	//★★★★アンロック
	XBOX360_LockVideo(false);
}


function CGBG()
{
	//★★★★ロック
	XBOX360_LockVideo(true);
	
	if($plus){
		$CGLIB_page++;
	}else{
		$CGLIB_page--;
	}

	$cgwhile=true;
	while($cgwhile)
	{

		if($CGLIB_page==0){
				$CGLIB_page=4;
		}else if($CGLIB_page==5){
				$CGLIB_page=1;
		}

		if($CGLIB_page==1){
			//多すぎるので分断
			if(!#bg001_01_1_崩壊渋谷_a&&!#bg001_02_5_崩壊渋谷_a&&!#bg001_03_6_崩壊渋谷_a&&!#bg001_03_6_崩壊渋谷_a.jpg&&!#bg009_02_1_107_a&&!#bg009_02_2_107_a&&!#bg009_02_3_107_a&&!#bg009_03_5_107_a&&!#bg006_01_1_コンテナ外観_a&&!#bg006_01_2_コンテナ外観_a&&!#bg006_01_3_コンテナ外観_a&&!#bg026_02_3_拓巳部屋_a&&!#bg027_01_3_道玄坂_a&&!#bg027_02_2_chn道玄坂_a&&!#bg027_04_3_道玄坂_a&&!#bg015_01_0_松濤公園_a&&!#bg015_01_2_松濤公園_a&&!#bg015_01_3_松濤公園_a&&!#bg083_01_1_宮下公園_a&&!#bg083_03_1_宮下公園_a&&!#bg083_01_3_宮下公園_a&&!#bg083_02_3_宮下公園_a&&!#bg165_01_3_OFRONT見上げ_a){
				$BGCG11=true;
			}else{
				$BGCG11=false;
			}

			if(!#bg165_02_3_OFRONT見上げ_a&&!#bg165_03_3_OFRONT見上げ_a&&!#bg165_03_3_O-FRONT見上げ_a&&!#bg065_01_2_ゲロカエルン店店内_a&&!#bg134_01_1_武器コーナー_a&&!#bg154_01_1_渋谷の白い空_a&&!#ev047_01_1_張り付け死体現場写真_a&&!#ev048_01_1_張り付けグロ絵アップ_a&&!#ev053_01_1_集団ダイブ現場写真_a&&!#bg142_01_3_ミュウツベ集団ダイブ_a&&!#ev046_01_1_妊娠男現場写真_a&&!#ev049_01_1_ヴァンパイ屋現場写真_a&&!#bg011_01_1_検索欄UP_a&&!#bg012_01_1_ニュースサイト_a&&!#bg012_02_1_ニュースサイト_a&&!#bg117_01_3_PC画面ニュージェネ_a){
				$BGCG12=true;
			}else{
				$BGCG12=false;
			}

			if($BGCG11&&$BGCG12){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=20;
				}
				$cgwhile=false;
			}
		}else if($CGLIB_page==2){
			if(!#bg120_01_3_PC画面その目_a&&!#bg125_01_3_PC画面ファンタズム公式_a&&!#bg128_01_3_ネットオークション_a&&!#bg141_01_3_PC画面del検索結果_a&&!#bg152_01_1_AH会HP_a&&!#bg153_01_1_あやせの詩_a&&!#bg183_01_3_PC画面ZACO‐DQN_a&&!#bg183_02_3_PC画面ZACO‐DQN_a&&!#bg202_01_1_希グループｗｅｂサイト_a&&!#bg203_01_1_ゲロカエルん偽通販サイト_a&&!#ev014_01_1_スプー_a&&!#bg155_01_1_Ir2_a&&!#bg127_01_2_ギョロリゲロカエルん_a&&!#bg181_01_3_捨てられたギョロリ_a&&!#bg004_01_1_作文用紙その目_a&&!#bg022_01_0_黒板その目_a&&!#bg171_01_3_カルテその目_a&&!#bg143_01_1_生徒手帳_a&&!#bg144_01_1_生徒手帳その目_a&&!#bg159_02_1_PC画面メールソフト_a&&!#bg120_01_3_PC画面その目_a&&!#bg186_01_1_たなびくタオル_a&&!#bg186_02_1_たなびくタオル_a&&!#bg180_01_1_アイスその目_a){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=20;
				}
				$cgwhile=false;
			}
		}else if($CGLIB_page==3){
			if(!#ev142_01_1_七海その目誰の目_a&&!#bg147_01_2_ディソード想像_a&&!#bg147_02_6_ディソード想像_a&&!#bg037_01_2_焼却炉中_a&&!#bg040_01_2_優愛カバン_a&&!#bg041_01_2_優愛カバンぶちまけ_a&&!#ev051_01_3_清掃員_a&&!#ev061_01_2_ニュージェネ犯人逮捕TV_a&&!#bg213_01_6_ニュースDQNパズル_a&&!#ev074_01_1_洗脳部隊inモニター_a&&!#bg085_04_3_スクランブル交差点_a&&!#bg151_01_1_デッドスポット_a&&!#bg158_03_1_ニュース地震_a&&!#bg160_01_3_ダンボール箱_a&&!#bg160_02_3_ダンボール箱_a&&!#bg160_03_3_ダンボール箱_a&&!#bg160_03_3_chnダンボール箱_a&&!#bg182_01_3_手描きのクマの絵_a&&!#bg185_01_1_あやせ下着_a&&!#bg197_01_3_渋谷駅東口とプラネタリウム_a&&!#bg200_01_6_ノアIIのあるドーム内_a&&!#bg211_01_5_黄色いバングル_a&&!#bg205_01_3_あやせディソードリアルブート_a&&!#bg213_01_6_chn渋谷駅コインロッカー_a&&!#bg214_01_6_chn渋谷駅ロッカー閉じ_a&&!#bg214_02_6_chn渋谷駅ロッカー開き_a&&!#bg214_02_6_chn渋谷駅ロッカー開け_a&&!#bg224_01_6_chnグラジオール文庫本_a&&!#bg234_01_6_chnビーズコレクション_a){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=20;
				}
				$cgwhile=false;
			}
		}else if($CGLIB_page==4){
			if(!#bg236_01_6_chn美愛の日記_a&&!#bg236_02_6_chn美愛の日記内容_a&&!#bg239_01_6_chnディソード全体_拓巳_a&&!#bg240_01_6_chnディソード全体_梨深_a&&!#bg241_01_6_chnディソード全体_七海_a&&!#bg242_01_6_chnディソード全体_あやせ_a&&!#bg244_01_6_chnディソード全体_梢_a&&!#bg243_01_6_chnディソード全体_セナ_a&&!#bg245_01_6_chnディソード全体_優愛_a){
				//該当無し
				if($plus){
					$CGLIB_page++;
				}else{
					$CGLIB_page--;
				}
			}else{
				//一個でもヒット
				cg_init($chara,$CGLIB_page);
				if($plus){
					$picnum=1;
				}else{
					$picnum=8;
				}
				$cgwhile=false;
			}
		}
	}

	//★★★★アンロック
	XBOX360_LockVideo(false);
}












