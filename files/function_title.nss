


//=============================================================================//
..//■３６０用■
//=============================================================================//
function TitleSelectionChapter()
{
	MoveCursor(0,0);

	//★★★★ロック
	XBOX360_LockVideo(true);

//	CreateColor("DebugColor01", 10000, 0, 0, 1280, 36, BLACK);
//	CreateColor("DebugColor02", 10000, 0, 684, 1280, 36, BLACK);
//	CreateColor("DebugColor03", 10000, 0, 0, 720, 64, BLACK);
//	CreateColor("DebugColor04", 10000, 1216, 0, 720, 64, BLACK);
//	CreateColor("DebugColor01", 10000, 0, 0, 1280, 40, BLACK);
//	CreateColor("DebugColor02", 10000, 0, 680, 1280, 40, BLACK);
//	CreateColor("DebugColor03", 10000, 0, 0, 64, 720, BLACK);
//	CreateColor("DebugColor04", 10000, 1216, 0, 64, 720, BLACK);
	LoadImage("DebugImage", "cg/sys/title/debug002.png");

	SetFont("ＭＳ ゴシック", 16, FFFFFF, 222222, 300, AROUND);
	CreateTexture("ChapterBack", 1000, center, middle, "cg/ev/ev004_01_1_INT01KISS_a.jpg");
	Fade("ChapterBack", 0, 0, null, true);

	$DebugName01 = " 第一章";
	$DebugName02 = " 第二章";
	$DebugName03 = " 第三章";
	$DebugName04 = " 第四章";
	$DebugName05 = " 第五章";
	$DebugName06 = " 第六章";
	$DebugName07 = " 第七章";
	$DebugName08 = " 第八章";
	$DebugName09 = " 第九章";
	$DebugName10 = " 第十章";
	$DebugName11 = " 梨深の章";
	$DebugName12 = " 優愛の章";
	$DebugName13 = " セナの章";
	$DebugName14 = " 梢の章";
	$DebugName15 = " 七海の章";
	$DebugName16 = " あやせの章";
	$DebugName17 = " オールスタンディング";
	$DebugName18 = " レイアウトテスト１";
	$DebugName19 = " レイアウトテスト２";
	$DebugName20 = " バックログ";
	$DebugName21 = " セーブ";
	$DebugName22 = " ロード";
	$DebugName23 = " タイトルに戻る";
	$DebugName24 = " メニュー";
	$DebugName25 = " 設定画面";
	$DebugName26 = " 戻る";
	$DebugName27 = " ";
	$DebugName28 = " ";
	$DebugName29 = " ";
	$DebugName30 = " ";
	$DebugName31 = " ";
	$DebugName32 = " ";
	$DebugName33 = " ";
	$DebugName34 = " ";
	$DebugName35 = " ";
	$DebugName36 = " ";
	$DebugName37 = " ";
	$DebugName38 = " ";
	$DebugName39 = " ";
	$DebugName40 = " ";

	$DebugNameX = 461;
	$DebugNameY = 26;
	$PreDebugNameX = 51;
	$PreDebugNameY = 24 - $DebugNameY;

	$DebugX = 461;
	$DebugY = 26;
	$PreDebugX = 51;
	$PreDebugY = 32 - $DebugY;

	$DebugH = 461;
	$DebugV = 26;

	$DebugNumber=0;
	$MulX=0;
	$MulY=0;

	$DebugCount=0;
	while($DebugCount<26){
		$DebugCount++;
		if($DebugCount==21){$MulX=1;$MulY=0;}
		DebugNameCount();

		$DebugNameUsual="<PRE>"+$DebugName+"</PRE>";
		$DebugNameOver="<FONT incolor=#FF1111><PRE>"+$DebugName+"</PRE></FONT>";
		$DebugNameClick="<FONT incolor=#FFFF00><PRE>"+$DebugName+"</PRE></FONT>";
	
		$DebugNumber++;
		$DebugChoice="Chapter"+$DebugNumber;
		$DebugUsualHit=$DebugChoice+"/MouseUsual/hit";
		$DebugOverHit=$DebugChoice+"/MouseOver/hit";
//		$DebugUsualImg=$DebugChoice+"/MouseUsual/img";
		$DebugUsualImg=$DebugChoice+"img";
		$DebugOverImg=$DebugChoice+"/MouseOver/img";
		$DebugClickImg=$DebugChoice+"/MouseClick/img";
	
		$MulY++;
		$DebugX_Add = ($DebugX * $MulX) + $PreDebugX;
		$DebugY01_Add = ($DebugY * $MulY) + $PreDebugY;
		$DebugNameX_Add = ($DebugNameX * $MulX) + $PreDebugNameX;
		$DebugNameY_Add = ($DebugNameY * $MulY) + $PreDebugNameY;
		CreateChoice($DebugChoice);
		CreateColor($DebugUsualHit, 1000, $DebugX_Add, $DebugY01_Add, $DebugH, $DebugV, BLACK);
		CreateTexture($DebugOverHit, 1000, $DebugX_Add, $DebugY01_Add, "DebugImage");
//		CreateColor($DebugOverHit, 1000, $DebugX_Add, $DebugY01_Add, $DebugH, $DebugV, WHITE);
		CreateText($DebugUsualImg, 1000, $DebugNameX_Add, $DebugNameY_Add, 576, Auto, $DebugNameUsual);
//		CreateText($DebugOverImg, 1000, $DebugNameX_Add, $DebugNameY_Add, 567, Auto, $DebugNameOver);
//		CreateText($DebugClickImg, 1000, $DebugNameX_Add, $DebugNameY_Add, 567, Auto, $DebugNameClick);
	}

	DebugChapterFocus();

	Request("Chapter*", PushText);
	Fade("Chapter*", 0, 0, null, false);

	Request("Chapter*/*/img", PushText);
	Request("Chapter*/MouseUsual/hit", Erase);
	Fade("Chapter*/*/*", 0, 0, null, true);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Fade("Chapter*", 300, 1000, null, true);

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	$LOCAL_debug_enable=true;
	while($LOCAL_debug_enable)
	{
		select
		{
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$LOCAL_debug_enable=false;break;}
			case Chapter1{
				$DebugChapterName=1;
				TitleSelectionScene();
			}case Chapter2{
				$DebugChapterName=2;
				TitleSelectionScene();
			}case Chapter3{
				$DebugChapterName=3;
				TitleSelectionScene();
			}case Chapter4{
				$DebugChapterName=4;
				TitleSelectionScene();
			}case Chapter5{
				$DebugChapterName=5;
				TitleSelectionScene();
			}case Chapter6{
				$DebugChapterName=6;
				TitleSelectionScene();
			}case Chapter7{
				$DebugChapterName=7;
				TitleSelectionScene();
			}case Chapter8{
				$DebugChapterName=8;
				TitleSelectionScene();
			}case Chapter9{
				$DebugChapterName=9;
				TitleSelectionScene();
			}case Chapter10{
				$DebugChapterName=10;
				TitleSelectionScene();
			}case Chapter11{
				$DebugChapterName=11;
				TitleSelectionScene();
			}case Chapter12{
				$DebugChapterName=12;
				TitleSelectionScene();
			}case Chapter13{
				$DebugChapterName=13;
				TitleSelectionScene();
			}case Chapter14{
				$DebugChapterName=14;
				TitleSelectionScene();
			}case Chapter15{
				$DebugChapterName=15;
				TitleSelectionScene();
			}case Chapter16{
				$DebugChapterName=16;
				TitleSelectionScene();
			}case Chapter17{
				$DebugChapterName=17;
				TitleSelectionAll();
					CreateColor("色", 999999, 0, 0, 1280, 720, "BLACK");
					Fade("色", 0, 0, null, true);
					Fade("色", 500, 700, null, true);
					CreateText("テキスト１", 999999, Center, Middle, Auto, Auto, "全てのルートフラグが開放されました");
					WaitKey();
					Fade("色", 500, 0, null, false);
					Fade("テキスト１", 500, 0, null, true);
					Delete("テキスト１");
					Delete("色");
			}case Chapter18{
				CreateTexture("テストレイヤー", 999999, 0, 0, "cg/test/確認用画像01.png");
				WaitKey();
				Delete("テストレイヤー");
			}case Chapter19{
				//CreateTexture("テストレイヤー", 999999, 0, 0, "cg/test/確認用画像02.png");
				//WaitKey();
				//Delete("テストレイヤー");
				$GameStart=0;
				call_chapter nss/ch00_000_TG体験版.nss;
			}case Chapter20{
				call_chapter nss/sys_backlog.nss;
			}case Chapter21{
				call_chapter nss/sys_save.nss;
			}case Chapter22{
				call_chapter nss/sys_load.nss;
			}case Chapter23{
				call_chapter nss/sys_reset.nss;
			}case Chapter24{
				call_chapter nss/sys_menu.nss;
			}case Chapter25{
				call_chapter nss/sys_config.nss;
			}case Chapter26{
				$LOCAL_debug_enable=false;
			}case Chapter27{
			}case Chapter28{
			}case Chapter29{
			}case Chapter30{
			}case Chapter31{
			}case Chapter32{
			}case Chapter33{
			}case Chapter34{
			}case Chapter35{
			}case Chapter36{
			}case Chapter37{
			}case Chapter38{
			}case Chapter39{
			}case Chapter40{
			}
			if(!$LOCAL_debug_enable){break;}
		}
	}

	if($GameName==0){
		Wait(5);

		CreateTexture("すくりーん", 2000, 0, 0, SCREEN);
		Draw();

		//★★★★ロック
		XBOX360_LockVideo(true);
		Delete("Chapter*/*/*");
		Delete("Chapter*");
		Delete("Debug*");
		//★★★★アンロック
		XBOX360_LockVideo(false);


		Fade("すくりーん", 500, 0, null, true);
		Delete("すくりーん");
	}

	MoveCursor(0,0);
}



function TitleSelectionScene()
{
	//★★★★ロック
	XBOX360_LockVideo(true);
	DebugFormat();

	if($DebugChapterName==1){
		$DebugCountLimit = 33;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_第一章";
		$DebugName01 = "ch00_001_インターミッション０１";
		$GameDebugSelect01=false;
		$GameDebugRoute01=false;
		$DebugName02 = "ch01_002_西條拓巳";
		$GameDebugSelect02=false;
		$GameDebugRoute02=false;
		$DebugName03 = "ch01_003_チャット■";
		$GameDebugSelect03=1;
		$GameDebugRoute03=false;
		$DebugName04 = "ch01_003a_★共通_インターミッション０１Ａ";
		$GameDebugSelect04=false;
		$GameDebugRoute04="共通";
		$DebugName05 = "ch01_004_９月２９日月";
		$GameDebugSelect05=false;
		$GameDebugRoute05=false;
		$DebugName06 = "ch01_005_登校";
		$GameDebugSelect06=false;
		$GameDebugRoute06=false;
		$DebugName07 = "ch01_006_妄想トリガー１■";
		$GameDebugSelect07=false;
		$GameDebugRoute07=false;
		$DebugName08 = "ch01_006r_★梨深編_インターミッション０１Ｂ";
		$GameDebugSelect08=false;
		$GameDebugRoute08="梨深";
		$DebugName09 = "ch01_007_円山町殺人現場";
		$GameDebugSelect09=1;
		$GameDebugRoute09=false;
		$DebugName10 = "ch01_008_星来たん";
		$GameDebugSelect10=1;
		$GameDebugRoute10=false;
		$DebugName11 = "ch01_009_インターミッション０２";
		$GameDebugSelect11=false;
		$GameDebugRoute11=false;
		$DebugName12 = "ch01_009r_★梨深編_インターミッション０２Ａ";
		$GameDebugSelect12=false;
		$GameDebugRoute12="梨深";
		$DebugName13 = "ch01_009y_★優愛編_インターミッション０２Ｂ";
		$GameDebugSelect13=false;
		$GameDebugRoute13="優愛";
		$DebugName14 = "ch01_010_９月３０日火";
		$GameDebugSelect14=false;
		$GameDebugRoute14=false;
		$DebugName15 = "ch01_011_西條七海";
		$GameDebugSelect15=false;
		$GameDebugRoute15=false;
		$DebugName16 = "ch01_012_妄想トリガー２■";
		$GameDebugSelect16=false;
		$GameDebugRoute16=false;
		$DebugName17 = "ch01_013_１０月１日水";
		$GameDebugSelect17=false;
		$GameDebugRoute17=false;
		$DebugName18 = "ch01_014_女子Ａ";
		$GameDebugSelect18=false;
		$GameDebugRoute18=false;
		$DebugName19 = "ch01_015_楠優愛";
		$GameDebugSelect19=false;
		$GameDebugRoute19=false;
		$DebugName20 = "ch01_016_妄想トリガー３■";
		$GameDebugSelect20=false;
		$GameDebugRoute20=false;
		$DebugName21 = "ch01_017_帰宅";
		$GameDebugSelect21=false;
		$GameDebugRoute21=false;
		$DebugName22 = "ch01_018_妄想トリガー４■";
		$GameDebugSelect22=false;
		$GameDebugRoute22=false;
		$DebugName23 = "ch01_019_１０月２日木";
		$GameDebugSelect23=false;
		$GameDebugRoute23=false;
		$DebugName24 = "ch01_020_アドレス交換";
		$GameDebugSelect24=false;
		$GameDebugRoute24=false;
		$DebugName25 = "ch01_021_グリムに相談";
		$GameDebugSelect25=1;
		$GameDebugRoute25=false;
		$DebugName26 = "ch01_022_インターミッション０３";
		$GameDebugSelect26=false;
		$GameDebugRoute26=false;
		$DebugName27 = "ch01_022y_★優愛編_インターミッション０３Ａ";
		$GameDebugSelect27=false;
		$GameDebugRoute27="優愛";
		$DebugName28 = "ch01_023_１０月６日月";
		$GameDebugSelect28=false;
		$GameDebugRoute28=false;
		$DebugName29 = "ch01_024_女子Ｂ";
		$GameDebugSelect29=false;
		$GameDebugRoute29=false;
		$DebugName30 = "ch01_025_松濤公園";
		$GameDebugSelect30=false;
		$GameDebugRoute30=false;
		$DebugName31 = "ch01_026_妄想トリガー５■";
		$GameDebugSelect31=false;
		$GameDebugRoute31=false;
		$DebugName32 = "ch01_027_現実逃避";
		$GameDebugSelect32=false;
		$GameDebugRoute32=false;
		$DebugName33 = " 戻る";
	}else if($DebugChapterName==2){
		$DebugCountLimit = 21;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_第二章";
		$DebugName01 = "ch02_028_インターミッション０４";
		$GameDebugSelect01=false;
		$GameDebugRoute01=false;
		$DebugName02 = "ch02_029_拓巳疑惑";
		$GameDebugSelect02=false;
		$GameDebugRoute02=false;
		$DebugName03 = "ch02_030_１０月７日火";
		$GameDebugSelect03=false;
		$GameDebugRoute03=false;
		$DebugName04 = "ch02_031_妄想トリガー６■";
		$GameDebugSelect04=false;
		$GameDebugRoute04=false;
		$DebugName05 = "ch02_032_妄想トリガー７■";
		$GameDebugSelect05=false;
		$GameDebugRoute05=false;
		$DebugName06 = "ch02_033_葉月志乃■";
		$GameDebugSelect06=false;
		$GameDebugRoute06=false;
		$DebugName07 = "ch02_034_NOZOMI";
		$GameDebugSelect07=false;
		$GameDebugRoute07=false;
		$DebugName08 = "ch02_035_グリムとニュージェネ考察";
		$GameDebugSelect08=false;
		$GameDebugRoute08=false;
		$DebugName09 = "ch02_036_インターミッション０５";
		$GameDebugSelect09=false;
		$GameDebugRoute09=false;
		$DebugName10 = "ch02_037_画像検証";
		$GameDebugSelect10=false;
		$GameDebugRoute10=false;
		$DebugName11 = "ch02_038_インターミッション０６";
		$GameDebugSelect11=false;
		$GameDebugRoute11=false;
		$DebugName12 = "ch02_039_予知能力";
		$GameDebugSelect12=false;
		$GameDebugRoute12=false;
		$DebugName13 = "ch02_040_１０月９日木";
		$GameDebugSelect13=false;
		$GameDebugRoute13=false;
		$DebugName14 = "ch02_041_ファンタズムライブ";
		$GameDebugSelect14=false;
		$GameDebugRoute14=false;
		$DebugName15 = "ch02_042_妄想トリガー８■";
		$GameDebugSelect15=false;
		$GameDebugRoute15=false;
		$DebugName16 = "ch02_043_妄想トリガー９■";
		$GameDebugSelect16=false;
		$GameDebugRoute16=false;
		$DebugName17 = "ch02_044_七海と携帯購入";
		$GameDebugSelect17=false;
		$GameDebugRoute17=false;
		$DebugName18 = "ch02_045_ショップからの帰路";
		$GameDebugSelect18=1;
		$GameDebugRoute18=false;
		$DebugName19 = "ch02_045n_★七海編_インターミッション０６Ａ";
		$GameDebugSelect19=false;
		$GameDebugRoute19="七海";
		$DebugName20 = "ch02_046_ヴァンパイ屋事件";
		$GameDebugSelect20=false;
		$GameDebugRoute20=false;
		$DebugName21 = " 戻る";
		$GameDebugSelect21=false;
		$GameDebugRoute21=false;
	}else if($DebugChapterName==3){
		$DebugCountLimit = 30;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_第三章";
		$DebugName01 = "ch03_047_インターミッション０７";
		$GameDebugSelect01=false;
		$GameDebugRoute01=false;
		$DebugName02 = "ch03_048_１０月１３日月";
		$GameDebugSelect02=1;
		$GameDebugRoute02=false;
		$DebugName03 = "ch03_049_蒼井セナ";
		$GameDebugSelect03=false;
		$GameDebugRoute03=false;
		$DebugName04 = "ch03_050_妄想トリガー１０■";
		$GameDebugSelect04=false;
		$GameDebugRoute04=false;
		$DebugName05 = "ch03_051_１０月１５日水";
		$GameDebugSelect05=1;
		$GameDebugRoute05=false;
		$DebugName06 = "ch03_051a_★あやせ編_インターミッション０７Ａ";
		$GameDebugSelect06=false;
		$GameDebugRoute06="あやせ";
		$DebugName07 = "ch03_052_岸本あやせ";
		$GameDebugSelect07=false;
		$GameDebugRoute07=false;
		$DebugName08 = "ch03_053_妄想トリガー１１■";
		$GameDebugSelect08=false;
		$GameDebugRoute08=false;
		$DebugName09 = "ch03_054_判と諏訪と拓巳";
		$GameDebugSelect09=false;
		$GameDebugRoute09=false;
		$DebugName10 = "ch03_055_星来覚醒後バージョン";
		$GameDebugSelect10=false;
		$GameDebugRoute10=false;
		$DebugName11 = "ch03_056_妄想トリガー１２■";
		$GameDebugSelect11=false;
		$GameDebugRoute11=false;
		$DebugName12 = "ch03_057_インターミッション０８";
		$GameDebugSelect12=false;
		$GameDebugRoute12=false;
		$DebugName13 = "ch03_058_１０月１６日木";
		$GameDebugSelect13=false;
		$GameDebugRoute13=false;
		$DebugName14 = "ch03_059_ディソード調査";
		$GameDebugSelect14=1;
		$GameDebugRoute14=false;
		$DebugName15 = "ch03_060_ディソード購入";
		$GameDebugSelect15=1;
		$GameDebugRoute15=false;
		$DebugName16 = "ch03_061_七海とバングル";
		$GameDebugSelect16=false;
		$GameDebugRoute16=false;
		$DebugName17 = "ch03_062_インターミッション０９";
		$GameDebugSelect17=false;
		$GameDebugRoute17=false;
		$DebugName18 = "ch03_063_１０月１７日金";
		$GameDebugSelect18=1;
		$GameDebugRoute18=false;
		$DebugName19 = "ch03_063r_★梨深編_インターミッション０９Ａ";
		$GameDebugSelect19=false;
		$GameDebugRoute19="梨深";
		$DebugName20 = "ch03_064_折原梢";
		$GameDebugSelect20=false;
		$GameDebugRoute20=false;
		$DebugName21 = "ch03_064a_★共通_妄想トリガー１２Ａ■";
		$GameDebugSelect21=false;
		$GameDebugRoute21=false;
		$DebugName22 = "ch03_065_無人の屋上にて";
		$GameDebugSelect22=false;
		$GameDebugRoute22=false;
		$DebugName23 = "ch03_066_妄想トリガー１３■";
		$GameDebugSelect23=false;
		$GameDebugRoute23=false;
		$DebugName24 = "ch03_067_インターミッション１０";
		$GameDebugSelect24=false;
		$GameDebugRoute24=false;
		$DebugName25 = "ch03_068_グリムとイタズラ電話考察";
		$GameDebugSelect25=false;
		$GameDebugRoute25=false;
		$DebugName26 = "ch03_069_無人の街";
		$GameDebugSelect26=false;
		$GameDebugRoute26=false;
		$DebugName27 = "ch03_070_妄想トリガー１４■";
		$GameDebugSelect27=false;
		$GameDebugRoute27=false;
		$DebugName28 = "ch03_071_スクランブル交差点";
		$GameDebugSelect28=false;
		$GameDebugRoute28=false;
		$DebugName29 = "ch03_072_インターミッション１１";
		$GameDebugSelect29=false;
		$GameDebugRoute29=false;
		$DebugName30 = " 戻る";
		$GameDebugSelect30=false;
		$GameDebugRoute30=false;
	}else if($DebugChapterName==4){
		$DebugCountLimit = 24;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_第四章";
		$DebugName01 = "ch04_073_インターミッション１２";
		$GameDebugSelect01=false;
		$GameDebugRoute01=false;
		$DebugName02 = "ch04_074_梨深の妄想世界";
		$GameDebugSelect02=false;
		$GameDebugRoute02=false;
		$DebugName03 = "ch04_075_１０月２０日月";
		$GameDebugSelect03=false;
		$GameDebugRoute03=false;
		$DebugName04 = "ch04_076_梨深のことを考える";
		$GameDebugSelect04=false;
		$GameDebugRoute04=false;
		$DebugName05 = "ch04_077_梨深と三住の刑事の話";
		$GameDebugSelect05=false;
		$GameDebugRoute05=false;
		$DebugName06 = "ch04_078_妄想トリガー１５■";
		$GameDebugSelect06=false;
		$GameDebugRoute06=false;
		$DebugName07 = "ch04_079_七海とイタズラ電話確認";
		$GameDebugSelect07=false;
		$GameDebugRoute07=false;
		$DebugName08 = "ch04_080_白い鎖とセナ";
		$GameDebugSelect08=false;
		$GameDebugRoute08=false;
		$DebugName09 = "ch04_081_妄想トリガー１６■";
		$GameDebugSelect09=false;
		$GameDebugRoute09=false;
		$DebugName10 = "ch04_082_グリムとＶＲ技術考察";
		$GameDebugSelect10=1;
		$GameDebugRoute10=false;
		$DebugName11 = "ch04_083_インターミッション１３";
		$GameDebugSelect11=false;
		$GameDebugRoute11=false;
		$DebugName12 = "ch04_083k_★梢編_インターミッション１３Ａ";
		$GameDebugSelect12=false;
		$GameDebugRoute12="梢";
		$DebugName13 = "ch04_083s_★セナ編_インターミッション１３Ｂ";
		$GameDebugSelect13=false;
		$GameDebugRoute13="セナ";
		$DebugName14 = "ch04_084_１０月２２日水";
		$GameDebugSelect14=false;
		$GameDebugRoute14=false;
		$DebugName15 = "ch04_085_妄想トリガー１７■";
		$GameDebugSelect15=1;
		$GameDebugRoute15=false;
		$DebugName16 = "ch04_086_優愛から逃走";
		$GameDebugSelect16=false;
		$GameDebugRoute16=false;
		$DebugName17 = "ch04_087_妄想トリガー１８■";
		$GameDebugSelect17=false;
		$GameDebugRoute17=false;
		$DebugName18 = "ch04_088_妄想トリガー１９■";
		$GameDebugSelect18=false;
		$GameDebugRoute18=false;
		$DebugName19 = "ch04_089_インターミッション１４";
		$GameDebugSelect19=false;
		$GameDebugRoute19=false;
		$DebugName20 = "ch04_090_２人のあやせ";
		$GameDebugSelect20=1;
		$GameDebugRoute20=false;
		$DebugName21 = "ch04_091_インターミッション１５";
		$GameDebugSelect21=false;
		$GameDebugRoute21=false;
		$DebugName22 = "ch04_092_ディソードとは";
		$GameDebugSelect22=false;
		$GameDebugRoute22=false;
		$DebugName23 = "ch04_093_集団ダイブの映像";
		$GameDebugSelect23=false;
		$GameDebugRoute23=false;
		$DebugName24 = " 戻る";
		$GameDebugSelect24=false;
		$GameDebugRoute24=false;
	}else if($DebugChapterName==5){
		$DebugCountLimit = 16;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_第五章";
		$DebugName01 = "ch05_094_１０月２２日水";
		$GameDebugSelect01=false;
		$GameDebugRoute01=false;
		$DebugName02 = "ch05_095_１０月２３日木";
		$GameDebugSelect02=false;
		$GameDebugRoute02=false;
		$DebugName03 = "ch05_096_妄想トリガー２０■";
		$GameDebugSelect03=false;
		$GameDebugRoute03=false;
		$DebugName04 = "ch05_097_妄想トリガー２１■";
		$GameDebugSelect04=1;
		$GameDebugRoute04=false;
		$DebugName05 = "ch05_098_妄想トリガー２２■";
		$GameDebugSelect05=false;
		$GameDebugRoute05=false;
		$DebugName06 = "ch05_099_妄想トリガー２３■";
		$GameDebugSelect06=false;
		$GameDebugRoute06=false;
		$DebugName07 = "ch05_100_インターミッション１６";
		$GameDebugSelect07=false;
		$GameDebugRoute07=false;
		$DebugName08 = "ch05_101_１０月２４日金";
		$GameDebugSelect08=1;
		$GameDebugRoute08=false;
		$DebugName09 = "ch05_102_あやせのヒント";
		$GameDebugSelect09=false;
		$GameDebugRoute09=false;
		$DebugName10 = "ch05_103_インターミッション１７";
		$GameDebugSelect10=false;
		$GameDebugRoute10=false;
		$DebugName11 = "ch05_104_放課後に梨深を待つ";
		$GameDebugSelect11=false;
		$GameDebugRoute11=false;
		$DebugName12 = "ch05_105_妄想トリガー２４■";
		$GameDebugSelect12=false;
		$GameDebugRoute12=false;
		$DebugName13 = "ch05_106_インターミッション１８";
		$GameDebugSelect13=false;
		$GameDebugRoute13=false;
		$DebugName14 = "ch05_107_１０月２７日月";
		$GameDebugSelect14=false;
		$GameDebugRoute14=false;
		$DebugName15 = "ch05_108_インターミッション１９";
		$GameDebugSelect15=false;
		$GameDebugRoute15=false;
		$DebugName16 = " 戻る";
		$GameDebugSelect16=false;
		$GameDebugRoute16=false;
	}else if($DebugChapterName==6){
		$DebugCountLimit = 21;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_第六章";
		$DebugName01 = "ch06_109_インターミッション２０";
		$GameDebugSelect01=false;
		$GameDebugRoute01=false;
		$DebugName02 = "ch06_110_地震でＨＤＤ破損";
		$GameDebugSelect02=false;
		$GameDebugRoute02=false;
		$DebugName03 = "ch06_111_インターミッション２１";
		$GameDebugSelect03=false;
		$GameDebugRoute03=false;
		$DebugName04 = "ch06_112_ナイトハルトの生存確認";
		$GameDebugSelect04=false;
		$GameDebugRoute04=false;
		$DebugName05 = "ch06_113_妄想トリガー２５■";
		$GameDebugSelect05=false;
		$GameDebugRoute05=false;
		$DebugName06 = "ch06_114_いつもの渋谷じゃない";
		$GameDebugSelect06=false;
		$GameDebugRoute06=false;
		$DebugName07 = "ch06_115_インターミッション２２";
		$GameDebugSelect07=false;
		$GameDebugRoute07=false;
		$DebugName08 = "ch06_116_飛び降りるあやせ";
		$GameDebugSelect08=false;
		$GameDebugRoute08=false;
		$DebugName09 = "ch06_117_インターミッション２３";
		$GameDebugSelect09=false;
		$GameDebugRoute09=false;
		$DebugName10 = "ch06_118_花壇の出現";
		$GameDebugSelect10=false;
		$GameDebugRoute10=false;
		$DebugName11 = "ch06_119_妄想トリガー２６■";
		$GameDebugSelect11=false;
		$GameDebugRoute11=false;
		$DebugName12 = "ch06_120_インターミッション２４";
		$GameDebugSelect12=1;
		$GameDebugRoute12=false;
		$DebugName13 = "ch06_121_マグネタイトヴァレイ";
		$GameDebugSelect13=false;
		$GameDebugRoute13=false;
		$DebugName14 = "ch06_122_インターミッション２５";
		$GameDebugSelect14=false;
		$GameDebugRoute14=false;
		$DebugName15 = "ch06_123_将軍からのメール";
		$GameDebugSelect15=false;
		$GameDebugRoute15=false;
		$DebugName16 = "ch06_124_妄想トリガー２７■";
		$GameDebugSelect16=1;
		$GameDebugRoute16=false;
		$DebugName17 = "ch06_125_インターミッション２６";
		$GameDebugSelect17=false;
		$GameDebugRoute17=false;
		$DebugName18 = "ch06_126_Ｏ－ＦＲＯＮＴ屋上";
		$GameDebugSelect18=false;
		$GameDebugRoute18=false;
		$DebugName19 = "ch06_127_妄想トリガー２８■";
		$GameDebugSelect19=false;
		$GameDebugRoute19=false;
		$DebugName20 = "ch06_128_妄想トリガー２９■";
		$GameDebugSelect20=1;
		$GameDebugRoute20=false;
		$DebugName21 = " 戻る";
		$GameDebugSelect21=false;
		$GameDebugRoute21=false;
	}else if($DebugChapterName==7){
		$DebugCountLimit = 29;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_第七章";
		$DebugName01 = "ch07_129_インターミッション２７";
		$GameDebugSelect01=false;
		$GameDebugRoute01=false;
		$DebugName02 = "ch07_129r_★梨深編_インターミッション２７Ａ";
		$GameDebugSelect02=false;
		$GameDebugRoute02="梨深";
		$DebugName03 = "ch07_130_１０月２８日火";
		$GameDebugSelect03=false;
		$GameDebugRoute03=false;
		$DebugName04 = "ch07_131_妄想トリガー３０■";
		$GameDebugSelect04=false;
		$GameDebugRoute04=false;
		$DebugName05 = "ch07_132_インターミッション２７ｂ";
		$GameDebugSelect05=false;
		$GameDebugRoute05=false;
		$DebugName06 = "ch07_133_消えた手首";
		$GameDebugSelect06=false;
		$GameDebugRoute06=false;
		$DebugName07 = "ch07_134_エスパー少年祭り";
		$GameDebugSelect07=false;
		$GameDebugRoute07=false;
		$DebugName08 = "ch07_135_インターミッション２８";
		$GameDebugSelect08=false;
		$GameDebugRoute08=false;
		$DebugName09 = "ch07_136_１１月３日月";
		$GameDebugSelect09=1;
		$GameDebugRoute09=false;
		$DebugName10 = "ch07_137_騒動後の教室";
		$GameDebugSelect10=false;
		$GameDebugRoute10=false;
		$DebugName11 = "ch07_138_妄想トリガー３１■";
		$GameDebugSelect11=false;
		$GameDebugRoute11=false;
		$DebugName12 = "ch07_139_インターミッション２９";
		$GameDebugSelect12=false;
		$GameDebugRoute12=false;
		$DebugName13 = "ch07_140_梨深のハンカチ";
		$GameDebugSelect13=false;
		$GameDebugRoute13=false;
		$DebugName14 = "ch07_141_ＤＱＮに絡まれる";
		$GameDebugSelect14=1;
		$GameDebugRoute14=false;
		$DebugName15 = "ch07_142_インターミッション３０";
		$GameDebugSelect15=false;
		$GameDebugRoute15=false;
		$DebugName16 = "ch07_142k_★梢編_インターミッション３０Ａ";
		$GameDebugSelect16=false;
		$GameDebugRoute16="梢";
		$DebugName17 = "ch07_143_梢に連れられて";
		$GameDebugSelect17=false;
		$GameDebugRoute17=false;
		$DebugName18 = "ch07_144_妄想トリガー３２■";
		$GameDebugSelect18=false;
		$GameDebugRoute18=false;
		$DebugName19 = "ch07_145_妄想トリガー３３■";
		$GameDebugSelect19=false;
		$GameDebugRoute19=false;
		$DebugName20 = "ch07_146_インターミッション３１";
		$GameDebugSelect20=false;
		$GameDebugRoute20=false;
		$DebugName21 = "ch07_147_ギガロマニアックスとは";
		$GameDebugSelect21=false;
		$GameDebugRoute21=false;
		$DebugName22 = "ch07_148_妄想トリガー３４■";
		$GameDebugSelect22=false;
		$GameDebugRoute22=false;
		$DebugName23 = "ch07_149_心の声の仕組み";
		$GameDebugSelect23=1;
		$GameDebugRoute23=false;
		$DebugName24 = "ch07_150_インターミッション３１ｂ";
		$GameDebugSelect24=1;
		$GameDebugRoute24=false;
		$DebugName25 = "ch07_151_１１月４日火";
		$GameDebugSelect25=false;
		$GameDebugRoute25=false;
		$DebugName26 = "ch07_151a_★あやせ編_１１月４日火";
		$GameDebugSelect26=false;
		$GameDebugRoute26="あやせ";
		$DebugName27 = "ch07_152_インターミッション３２";
		$GameDebugSelect27=false;
		$GameDebugRoute27=false;
		$DebugName28 = "ch07_153_七海の手首に包帯";
		$GameDebugSelect28=1;
		$GameDebugRoute28=false;
		$DebugName29 = " 戻る";
		$GameDebugSelect29=false;
		$GameDebugRoute29=false;
	}else if($DebugChapterName==8){
		$DebugCountLimit = 24;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_第八章";
		$DebugName01 = "ch08_154_インターミッション３３";
		$GameDebugSelect01=false;
		$GameDebugRoute01=false;
		$DebugName02 = "ch08_155_七海のことを考える";
		$GameDebugSelect02=1;
		$GameDebugRoute02=false;
		$DebugName03 = "ch08_156_妄想トリガー３５■";
		$GameDebugSelect03=false;
		$GameDebugRoute03=false;
		$DebugName04 = "ch08_157_インターミッション３４";
		$GameDebugSelect04=false;
		$GameDebugRoute04=false;
		$DebugName05 = "ch08_158_作文と落書き";
		$GameDebugSelect05=1;
		$GameDebugRoute05=false;
		$DebugName06 = "ch08_159_インターミッション３５";
		$GameDebugSelect06=false;
		$GameDebugRoute06=false;
		$DebugName07 = "ch08_160_１１月６日木";
		$GameDebugSelect07=false;
		$GameDebugRoute07=false;
		$DebugName08 = "ch08_161_妄想トリガー３６■";
		$GameDebugSelect08=1;
		$GameDebugRoute08=false;
		$DebugName09 = "ch08_162_インターミッション３６";
		$GameDebugSelect09=false;
		$GameDebugRoute09=false;
		$DebugName10 = "ch08_163_あやせのお見舞い";
		$GameDebugSelect10=false;
		$GameDebugRoute10=false;
		$DebugName11 = "ch08_164_妄想トリガー３７■";
		$GameDebugSelect11=false;
		$GameDebugRoute11=false;
		$DebugName12 = "ch08_165_三住くん空気嫁";
		$GameDebugSelect12=false;
		$GameDebugRoute12=false;
		$DebugName13 = "ch08_166_妄想トリガー３８■";
		$GameDebugSelect13=1;
		$GameDebugRoute13=false;
		$DebugName14 = "ch08_167_インターミッション３７";
		$GameDebugSelect14=false;
		$GameDebugRoute14=false;
		$DebugName15 = "ch08_168_梨深に頼みごと";
		$GameDebugSelect15=false;
		$GameDebugRoute15=false;
		$DebugName16 = "ch08_169_妄想トリガー３９■";
		$GameDebugSelect16=1;
		$GameDebugRoute16=false;
		$DebugName17 = "ch08_170_インターミッション３８";
		$GameDebugSelect17=false;
		$GameDebugRoute17=false;
		$DebugName18 = "ch08_171_セナＶＳ梨深の結末";
		$GameDebugSelect18=false;
		$GameDebugRoute18=false;
		$DebugName19 = "ch08_172_インターミッション３９";
		$GameDebugSelect19=false;
		$GameDebugRoute19=false;
		$DebugName20 = "ch08_173_公式Ｉｒ２";
		$GameDebugSelect20=false;
		$GameDebugRoute20=false;
		$DebugName21 = "ch08_174_インターミッション４０";
		$GameDebugSelect21=false;
		$GameDebugRoute21=false;
		$DebugName22 = "ch08_175_実家に帰る";
		$GameDebugSelect22=false;
		$GameDebugRoute22=false;
		$DebugName23 = "ch08_176_インターミッション４１";
		$GameDebugSelect23=false;
		$GameDebugRoute23=false;
		$DebugName24 = " 戻る";
		$GameDebugSelect24=false;
		$GameDebugRoute24=false;
	}else if($DebugChapterName==9){
		$DebugCountLimit = 24;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_第九章";
		$DebugName01 = "ch09_177_インターミッション４２";
		$GameDebugSelect01=false;
		$GameDebugRoute01=false;
		$DebugName02 = "ch09_178_真実";
		$GameDebugSelect02=false;
		$GameDebugRoute02=false;
		$DebugName03 = "ch09_179_妄想トリガー４０■";
		$GameDebugSelect03=false;
		$GameDebugRoute03=false;
		$DebugName04 = "ch09_180_インターミッション４３";
		$GameDebugSelect04=false;
		$GameDebugRoute04=false;
		$DebugName05 = "ch09_181_存在の証明";
		$GameDebugSelect05=false;
		$GameDebugRoute05=false;
		$DebugName06 = "ch09_182_妄想トリガー４１■";
		$GameDebugSelect06=false;
		$GameDebugRoute06=false;
		$DebugName07 = "ch09_183_インターミッション４４";
		$GameDebugSelect07=false;
		$GameDebugRoute07=false;
		$DebugName08 = "ch09_184_消えてしまいたい";
		$GameDebugSelect08=false;
		$GameDebugRoute08=false;
		$DebugName09 = "ch09_185_妄想トリガー４２■";
		$GameDebugSelect09=false;
		$GameDebugRoute09=false;
		$DebugName10 = "ch09_186_インターミッション４５";
		$GameDebugSelect10=false;
		$GameDebugRoute10=false;
		$DebugName11 = "ch09_187_僕を殺して";
		$GameDebugSelect11=false;
		$GameDebugRoute11=false;
		$DebugName12 = "ch09_188_妄想トリガー４３■";
		$GameDebugSelect12=false;
		$GameDebugRoute12=false;
		$DebugName13 = "ch09_189_インターミッション４６";
		$GameDebugSelect13=false;
		$GameDebugRoute13=false;
		$DebugName14 = "ch09_190_僕は妄想じゃない";
		$GameDebugSelect14=false;
		$GameDebugRoute14=false;
		$DebugName15 = "ch09_191_インターミッション４７";
		$GameDebugSelect15=false;
		$GameDebugRoute15=false;
		$DebugName16 = "ch09_192_消える七海";
		$GameDebugSelect16=false;
		$GameDebugRoute16=false;
		$DebugName17 = "ch09_193_インターミッション４８";
		$GameDebugSelect17=false;
		$GameDebugRoute17=false;
		$DebugName18 = "ch09_194_壊れた現実";
		$GameDebugSelect18=false;
		$GameDebugRoute18=false;
		$DebugName19 = "ch09_195_妄想トリガー４４■";
		$GameDebugSelect19=false;
		$GameDebugRoute19=false;
		$DebugName20 = "ch09_196_梨深と将軍の過去";
		$GameDebugSelect20=false;
		$GameDebugRoute20=false;
		$DebugName21 = "ch09_197_覚醒";
		$GameDebugSelect21=false;
		$GameDebugRoute21=false;
		$DebugName22 = "ch09_198_インターミッション４９";
		$GameDebugSelect22=false;
		$GameDebugRoute22=false;
		$DebugName23 = "ch09_199_サードメルト";
		$GameDebugSelect23=false;
		$GameDebugRoute23=false;
		$DebugName24 = " 戻る";
		$GameDebugSelect24=false;
		$GameDebugRoute24=false;
	}else if($DebugChapterName==10){
		$DebugCountLimit = 29;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_第十章";
		$DebugName01 = "ch10_200_１１月７日金";
		$GameDebugSelect01=false;
		$GameDebugRoute01=false;
		$DebugName02 = "ch10_201_インターミッション５０";
		$GameDebugSelect02=false;
		$GameDebugRoute02=false;
		$DebugName03 = "ch10_202_崩壊した渋谷";
		$GameDebugSelect03=false;
		$GameDebugRoute03=false;
		$DebugName04 = "ch10_203_インターミッション５１";
		$GameDebugSelect04=false;
		$GameDebugRoute04=false;
		$DebugName05 = "ch10_204_瓦礫の中を";
		$GameDebugSelect05=1;
		$GameDebugRoute05=false;
		$DebugName06 = "ch10_205_Ａインターミッション５２ａ";
		$GameDebugSelect06=false;
		$GameDebugRoute06="Ａ";
		$DebugName07 = "ch10_206_Ａ諏訪との対峙";
		$GameDebugSelect07=false;
		$GameDebugRoute07="Ａ";
		$DebugName08 = "ch10_207_Ａインターミッション５３ａ";
		$GameDebugSelect08=false;
		$GameDebugRoute08="Ａ";
		$DebugName09 = "ch10_208_Ａセナの想い";
		$GameDebugSelect09=false;
		$GameDebugRoute09="Ａ";
		$DebugName10 = "ch10_209_Ａインターミッション５４ａ";
		$GameDebugSelect10=false;
		$GameDebugRoute10="Ａ";
		$DebugName11 = "ch10_210_Ａ地下トンネルの星来達";
		$GameDebugSelect11=false;
		$GameDebugRoute11="Ａ";
		$DebugName12 = "ch10_211_Ａ野呂瀬と対決";
		$GameDebugSelect12=1;
		$GameDebugRoute12="Ａ";
		$DebugName13 = "ch10_212_Ａ僕は";
		$GameDebugSelect13=false;
		$GameDebugRoute13="Ａ";
		$DebugName14 = "ch10_213_Ａインターミッション５５ａ";
		$GameDebugSelect14=false;
		$GameDebugRoute14="Ａ";
		$DebugName15 = "ch10_214_Ａ鈍色の空の下";
		$GameDebugSelect15=1;
		$GameDebugRoute15="Ａ";
		$DebugName16 = "ch10_215_ＡＡルートグッドエンド";
		$GameDebugSelect16=false;
		$GameDebugRoute16="Ａ２";
		$DebugName17 = "ch10_216_Ｂインターミッション５２ｂ";
		$GameDebugSelect17=false;
		$GameDebugRoute17="Ｂ";
		$DebugName18 = "ch10_217_Ｂ諏訪の本質";
		$GameDebugSelect18=false;
		$GameDebugRoute18="Ｂ";
		$DebugName19 = "ch10_218_Ｂインターミッション５３ｂ";
		$GameDebugSelect19=false;
		$GameDebugRoute19="Ｂ";
		$DebugName20 = "ch10_219_Ｂ決着";
		$GameDebugSelect20=false;
		$GameDebugRoute20="Ｂ";
		$DebugName21 = "ch10_220_Ｂ幸せな夢";
		$GameDebugSelect21=false;
		$GameDebugRoute21="Ｂ";
		$DebugName22 = "ch10_221_Ｂインターミッション５４ｂ";
		$GameDebugSelect22=false;
		$GameDebugRoute22="Ｂ";
		$DebugName23 = "chz_212_青空編_pray";
		$GameDebugSelect23=1;
		$GameDebugRoute23="Ａ";
		$DebugName24 = "chz_213_青空編_findtheblue";
		$GameDebugSelect24=false;
		$GameDebugRoute24="Ａ２";
		$DebugName25 = "chz_214_青空編_lastbattle";
		$GameDebugSelect25=false;
		$GameDebugRoute25="Ａ２";
		$DebugName26 = "chz_215_青空編_title";
		$GameDebugSelect26=false;
		$GameDebugRoute26="Ａ２";
		$DebugName27 = "chz_216_青空編_bluesky";
		$GameDebugSelect27=false;
		$GameDebugRoute27="Ａ２";
		$DebugName28 = "chz_222_エンドクレジット";
		$GameDebugSelect28=1;
		$GameDebugRoute28=false;
		$DebugName29 = " 戻る";
		$GameDebugSelect29=false;
		$GameDebugRoute29=false;
	}else if($DebugChapterName==11){
		$DebugCountLimit = 10;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_梨深ルート";
		$DebugName01 = "chr_170_梨深編_インターミッションＲ１";
		$GameDebugSelect01=false;
		$GameDebugRoute01="梨深";
		$DebugName02 = "chr_171_梨深編_壊れた心";
		$GameDebugSelect02=false;
		$GameDebugRoute02="梨深";
		$DebugName03 = "chr_172_梨深編_偽りの日常";
		$GameDebugSelect03=false;
		$GameDebugRoute03="梨深";
		$DebugName04 = "chr_173_梨深編_梨深の心象風景";
		$GameDebugSelect04=false;
		$GameDebugRoute04="梨深";
		$DebugName05 = "chr_174_梨深編_インターミッションＲ２a";
		$GameDebugSelect05=false;
		$GameDebugRoute05="梨深";
		$DebugName06 = "chr_175_梨深編_インターミッションＲ２b";
		$GameDebugSelect06=false;
		$GameDebugRoute06="梨深";
		$DebugName07 = "chr_176_梨深編_インターミッションＲ３a";
		$GameDebugSelect07=false;
		$GameDebugRoute07="梨深";
		$DebugName08 = "chr_177_梨深編_インターミッションＲ３b";
		$GameDebugSelect08=false;
		$GameDebugRoute08="梨深";
		$DebugName09 = "chr_178_梨深編_エピローグ";
		$GameDebugSelect09=false;
		$GameDebugRoute09="梨深";
		$DebugName10 = " 戻る";
		$GameDebugSelect10=false;
		$GameDebugRoute10=false;
	}else if($DebugChapterName==12){
		$DebugCountLimit = 16;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_優愛ルート";
		$DebugName01 = "chy_153_優愛編_インターミッションＹ１Ａ";
		$GameDebugSelect01=false;
		$GameDebugRoute01="優愛";
		$DebugName02 = "chy_154_優愛編_インターミッションＹ１Ｂ";
		$GameDebugSelect02=false;
		$GameDebugRoute02="優愛";
		$DebugName03 = "chy_155_優愛編_第７の事件";
		$GameDebugSelect03=false;
		$GameDebugRoute03="優愛";
		$DebugName04 = "chy_156_優愛編_訪問者";
		$GameDebugSelect04=false;
		$GameDebugRoute04="優愛";
		$DebugName05 = "chy_157_優愛編_インターミッションＹ２";
		$GameDebugSelect05=false;
		$GameDebugRoute05="優愛";
		$DebugName06 = "chy_158_優愛編_監禁";
		$GameDebugSelect06=false;
		$GameDebugRoute06="優愛";
		$DebugName07 = "chy_159_優愛編_食べて";
		$GameDebugSelect07=false;
		$GameDebugRoute07="優愛";
		$DebugName08 = "chy_160_優愛編_逆監禁できるかも";
		$GameDebugSelect08=false;
		$GameDebugRoute08="優愛";
		$DebugName09 = "chy_161_優愛編_消えた優愛";
		$GameDebugSelect09=false;
		$GameDebugRoute09="優愛";
		$DebugName10 = "chy_162_優愛編_日記帳";
		$GameDebugSelect10=false;
		$GameDebugRoute10="優愛";
		$DebugName11 = "chy_163_優愛編_君は誰";
		$GameDebugSelect11=false;
		$GameDebugRoute11="優愛";
		$DebugName12 = "chy_164_優愛編_インターミッションＹ３";
		$GameDebugSelect12=false;
		$GameDebugRoute12="優愛";
		$DebugName13 = "chy_165_優愛編_楠美愛";
		$GameDebugSelect13=false;
		$GameDebugRoute13="優愛";
		$DebugName14 = "chy_166_優愛編_さよなら";
		$GameDebugSelect14=false;
		$GameDebugRoute14="優愛";
		$DebugName15 = "chy_167_優愛編_インターミッションＹ４";
		$GameDebugSelect15=false;
		$GameDebugRoute15="優愛";
		$DebugName16 = " 戻る";
		$GameDebugSelect16=false;
		$GameDebugRoute16="false";
	}else if($DebugChapterName==13){
		$DebugCountLimit = 15;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_セナルート";
		$DebugName01 = "chs_153_セナ編_第７の事件";
		$GameDebugSelect01=false;
		$GameDebugRoute01="セナ";
		$DebugName02 = "chs_154_セナ編_１１月５日水";
		$GameDebugSelect02=false;
		$GameDebugRoute02="セナ";
		$DebugName03 = "chs_155_セナ編_希本社ビル";
		$GameDebugSelect03=false;
		$GameDebugRoute03="セナ";
		$DebugName04 = "chs_156_セナ編_罠";
		$GameDebugSelect04=false;
		$GameDebugRoute04="セナ";
		$DebugName05 = "chs_157_セナ編_渋谷崩壊";
		$GameDebugSelect05=false;
		$GameDebugRoute05="セナ";
		$DebugName06 = "chs_158_セナ編_理性崩壊";
		$GameDebugSelect06=false;
		$GameDebugRoute06="セナ";
		$DebugName07 = "chs_159_セナ編_電気仕掛けの世界";
		$GameDebugSelect07=false;
		$GameDebugRoute07="セナ";
		$DebugName08 = "chs_160_セナ編_デウス・エクス・マキナ";
		$GameDebugSelect08=false;
		$GameDebugRoute08="セナ";
		$DebugName09 = "chs_161_セナ編_インターミッションＳ１";
		$GameDebugSelect09=false;
		$GameDebugRoute09="セナ";
		$DebugName10 = "chs_162_セナ編_死の街";
		$GameDebugSelect10=false;
		$GameDebugRoute10="セナ";
		$DebugName11 = "chs_163_セナ編_チートコード";
		$GameDebugSelect11=false;
		$GameDebugRoute11="セナ";
		$DebugName12 = "chs_164_セナ編_襲撃";
		$GameDebugSelect12=false;
		$GameDebugRoute12="セナ";
		$DebugName13 = "chs_165_セナ編_月まで届け赤き刃";
		$GameDebugSelect13=false;
		$GameDebugRoute13="セナ";
		$DebugName14 = "chs_166_セナ編_エピローグ";
		$GameDebugSelect14=false;
		$GameDebugRoute14="セナ";
		$DebugName15 = " 戻る";
		$GameDebugSelect15=false;
		$GameDebugRoute15=false;
	}else if($DebugChapterName==14){
		$DebugCountLimit = 15;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_梢ルート";
		$DebugName01 = "chk_151_梢編_インターミッション３３Ａ";
		$GameDebugSelect01=false;
		$GameDebugRoute01="梢";
		$DebugName02 = "chk_152_梢編_第７の事件";
		$GameDebugSelect02=false;
		$GameDebugRoute02="梢";
		$DebugName03 = "chk_153_梢編_１１月５日水";
		$GameDebugSelect03=false;
		$GameDebugRoute03="梢";
		$DebugName04 = "chk_154_梢編_ぶちゅぶちゅさん";
		$GameDebugSelect04=false;
		$GameDebugRoute04="梢";
		$DebugName05 = "chk_155_梢編_僕を撮るな";
		$GameDebugSelect05=false;
		$GameDebugRoute05="梢";
		$DebugName06 = "chk_156_梢編_こちらスパイダー";
		$GameDebugSelect06=false;
		$GameDebugRoute06="梢";
		$DebugName07 = "chk_157_梢編_インターミッションＫ１";
		$GameDebugSelect07=false;
		$GameDebugRoute07="梢";
		$DebugName08 = "chk_158_梢編_味方だよね";
		$GameDebugSelect08=false;
		$GameDebugRoute08="梢";
		$DebugName09 = "chk_159_梢編_惨劇の後";
		$GameDebugSelect09=false;
		$GameDebugRoute09="梢";
		$DebugName10 = "chk_160_梢編_裏切り";
		$GameDebugSelect10=false;
		$GameDebugRoute10="梢";
		$DebugName11 = "chk_161_梢編_殺意";
		$GameDebugSelect11=false;
		$GameDebugRoute11="梢";
		$DebugName12 = "chk_162_梢編_インターミッションＫ２";
		$GameDebugSelect12=false;
		$GameDebugRoute12="梢";
		$DebugName13 = "chk_163_梢編_たった１人の友達";
		$GameDebugSelect13=false;
		$GameDebugRoute13="梢";
		$DebugName14 = "chk_164_梢編_星は永遠に";
		$GameDebugSelect14=false;
		$GameDebugRoute14="梢";
		$DebugName15 = " 戻る";
		$GameDebugSelect15=false;
		$GameDebugRoute15=false;
	}else if($DebugChapterName==15){
		$DebugCountLimit = 13;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_七海ルート";
		$DebugName01 = "chn_125_七海編_七海帰還";
		$GameDebugSelect01=false;
		$GameDebugRoute01="七海";
		$DebugName02 = "chn_126_七海編_現実と妄想の境界";
		$GameDebugSelect02=false;
		$GameDebugRoute02="七海";
		$DebugName03 = "chn_127_七海編_いたずら";
		$GameDebugSelect03=false;
		$GameDebugRoute03="七海";
		$DebugName04 = "chn_128_七海編_朝餉の準備";
		$GameDebugSelect04=false;
		$GameDebugRoute04="七海";
		$DebugName05 = "chn_129_七海編_朝食";
		$GameDebugSelect05=false;
		$GameDebugRoute05="七海";
		$DebugName06 = "chn_130_七海編_理想の妹";
		$GameDebugSelect06=false;
		$GameDebugRoute06="七海";
		$DebugName07 = "chn_131_七海編_噛み合わない会話";
		$GameDebugSelect07=false;
		$GameDebugRoute07="七海";
		$DebugName08 = "chn_132_七海編_混乱";
		$GameDebugSelect08=false;
		$GameDebugRoute08="七海";
		$DebugName09 = "chn_133_七海編_同衾";
		$GameDebugSelect09=false;
		$GameDebugRoute09="七海";
		$DebugName10 = "chn_134_七海編_七海帰還２";
		$GameDebugSelect10=false;
		$GameDebugRoute10="七海";
		$DebugName11 = "chn_135_七海編_二人のナナ";
		$GameDebugSelect11=false;
		$GameDebugRoute11="七海";
		$DebugName12 = "chn_136_七海編_僕は妹とキスをする";
		$GameDebugSelect12=false;
		$GameDebugRoute12="七海";
		$DebugName13 = " 戻る";
		$GameDebugSelect13=false;
		$GameDebugRoute13=false;
	}else if($DebugChapterName==16){
		$DebugCountLimit = 18;
		$DebugSceneImage="cg/ev/ev020_01_3_優愛足下_a.jpg";
		$PreGameName = "boot_あやせルート";
		$DebugName01 = "cha_153_あやせ編_第７の事件";
		$GameDebugSelect01=false;
		$GameDebugRoute01="あやせ";
		$DebugName02 = "cha_154_あやせ編_インターミッション３４";
		$GameDebugSelect02=false;
		$GameDebugRoute02="あやせ";
		$DebugName03 = "cha_155_あやせ編_１１月６日木";
		$GameDebugSelect03=false;
		$GameDebugRoute03="あやせ";
		$DebugName04 = "cha_156_あやせ編_血塗られた黒騎士";
		$GameDebugSelect04=false;
		$GameDebugRoute04="あやせ";
		$DebugName05 = "cha_157_あやせ編_６７億在る世界";
		$GameDebugSelect05=false;
		$GameDebugRoute05="あやせ";
		$DebugName06 = "cha_158_あやせ編_黙示録詩編";
		$GameDebugSelect06=false;
		$GameDebugRoute06="あやせ";
		$DebugName07 = "cha_159_あやせ編_罪過に契約のチョコを";
		$GameDebugSelect07=false;
		$GameDebugRoute07="あやせ";
		$DebugName08 = "cha_160_あやせ編_邪心昇華の儀式";
		$GameDebugSelect08=false;
		$GameDebugRoute08="あやせ";
		$DebugName09 = "cha_161_あやせ編_グラジオール覚醒";
		$GameDebugSelect09=false;
		$GameDebugRoute09="あやせ";
		$DebugName10 = "cha_162_あやせ編_相克世界";
		$GameDebugSelect10=false;
		$GameDebugRoute10="あやせ";
		$DebugName11 = "cha_163_あやせ編_黒い霞と虚ろな瞳";
		$GameDebugSelect11=false;
		$GameDebugRoute11="あやせ";
		$DebugName12 = "cha_164_あやせ編_赤銅色の青い空";
		$GameDebugSelect12=false;
		$GameDebugRoute12="あやせ";
		$DebugName13 = "cha_165_あやせ編_小さな世界の希望となって";
		$GameDebugSelect13=false;
		$GameDebugRoute13="あやせ";
		$DebugName14 = "cha_166_あやせ編_顕現する邪心";
		$GameDebugSelect14=false;
		$GameDebugRoute14="あやせ";
		$DebugName15 = "cha_167_あやせ編_罪過に契約の血を";
		$GameDebugSelect15=false;
		$GameDebugRoute15="あやせ";
		$DebugName16 = "cha_168_あやせ編_開け天国の扉";
		$GameDebugSelect16=false;
		$GameDebugRoute16="あやせ";
		$DebugName17 = "cha_169_あやせ編_エピローグ";
		$GameDebugSelect17=false;
		$GameDebugRoute17="あやせ";
		$DebugName18 = " 戻る";
		$GameDebugSelect18=false;
		$GameDebugRoute18=false;
	}

	//■章の何か
	CreateTexture("SceneBack", 1001, center, middle, $DebugSceneImage);
	Fade("SceneBack", 0, 0, null, true);

	$DebugNumber=0;
	$MulX=0;
	$MulY=0;

	$DebugCount=0;
	while($DebugCount<$DebugCountLimit){
		$DebugCount++;
		if($DebugCount==21){$MulX=1;$MulY=0;}
		DebugNameCount();

		$DebugNameUsual="<PRE>"+$DebugName+"</PRE>";
		$DebugNameOver="<FONT incolor=#FF1111><PRE>"+$DebugName+"</PRE></FONT>";
		$DebugNameClick="<FONT incolor=#FFFF00><PRE>"+$DebugName+"</PRE></FONT>";
	
		$DebugNumber++;
		$DebugChoice="Scene"+$DebugNumber;
		$DebugUsualHit=$DebugChoice+"/MouseUsual/hit";
		$DebugOverHit=$DebugChoice+"/MouseOver/hit";
//		$DebugUsualImg=$DebugChoice+"/MouseUsual/img";
		$DebugUsualImg=$DebugChoice+"img";
		$DebugOverImg=$DebugChoice+"/MouseOver/img";
		$DebugClickImg=$DebugChoice+"/MouseClick/img";
	
		$MulY++;
		$DebugX_Add = ($DebugX * $MulX) + $PreDebugX;
		$DebugY01_Add = ($DebugY * $MulY) + $PreDebugY;
		$DebugNameX_Add = ($DebugNameX * $MulX) + $PreDebugNameX;
		$DebugNameY_Add = ($DebugNameY * $MulY) + $PreDebugNameY;
		CreateChoice($DebugChoice);
		CreateColor($DebugUsualHit, 1001, $DebugX_Add, $DebugY01_Add, $DebugH, $DebugV, BLACK);
		CreateTexture($DebugOverHit, 1001, $DebugX_Add, $DebugY01_Add, "DebugImage");
		//CreateColor($DebugOverHit, 1001, $DebugX_Add, $DebugY01_Add, $DebugH, $DebugV, WHITE);
		CreateText($DebugUsualImg, 1001, $DebugNameX_Add, $DebugNameY_Add, 576, Auto, $DebugNameUsual);
		//CreateText($DebugOverImg, 1001, $DebugNameX_Add, $DebugNameY_Add, 567, Auto, $DebugNameOver);
		//CreateText($DebugClickImg, 1001, $DebugNameX_Add, $DebugNameY_Add, 567, Auto, $DebugNameClick);
	}

	Request("Scene*", PushText);
	Fade("Scene*", 0, 0, null, false);

	Request("Scene*/*/img", PushText);
	Request("Scene*/MouseUsual/hit", Erase);
	Fade("Scene*/*/*", 0, 0, null, true);

	DebugSceneFocus();

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Fade("Scene*", 300, 1000, null, true);

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	select
	{
		if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){break;}
		case Scene1{
			$GameName=$DebugName01;
			$GameDebugSelect=$GameDebugSelect01;
			$GameDebugRoute=$GameDebugRoute01;
		}case Scene2{
			$GameName=$DebugName02;
			$GameDebugSelect=$GameDebugSelect02;
			$GameDebugRoute=$GameDebugRoute02;
		}case Scene3{
			$GameName=$DebugName03;
			$GameDebugSelect=$GameDebugSelect03;
			$GameDebugRoute=$GameDebugRoute03;
		}case Scene4{
			$GameName=$DebugName04;
			$GameDebugSelect=$GameDebugSelect04;
			$GameDebugRoute=$GameDebugRoute04;
		}case Scene5{
			$GameName=$DebugName05;
			$GameDebugSelect=$GameDebugSelect05;
			$GameDebugRoute=$GameDebugRoute05;
		}case Scene6{
			$GameName=$DebugName06;
			$GameDebugSelect=$GameDebugSelect06;
			$GameDebugRoute=$GameDebugRoute06;
		}case Scene7{
			$GameName=$DebugName07;
			$GameDebugSelect=$GameDebugSelect07;
			$GameDebugRoute=$GameDebugRoute07;
		}case Scene8{
			$GameName=$DebugName08;
			$GameDebugSelect=$GameDebugSelect08;
			$GameDebugRoute=$GameDebugRoute08;
		}case Scene9{
			$GameName=$DebugName09;
			$GameDebugSelect=$GameDebugSelect09;
			$GameDebugRoute=$GameDebugRoute09;
		}case Scene10{
			$GameName=$DebugName10;
			$GameDebugSelect=$GameDebugSelect10;
			$GameDebugRoute=$GameDebugRoute10;
		}case Scene11{
			$GameName=$DebugName11;
			$GameDebugSelect=$GameDebugSelect11;
			$GameDebugRoute=$GameDebugRoute11;
		}case Scene12{
			$GameName=$DebugName12;
			$GameDebugSelect=$GameDebugSelect12;
			$GameDebugRoute=$GameDebugRoute12;
		}case Scene13{
			$GameName=$DebugName13;
			$GameDebugSelect=$GameDebugSelect13;
			$GameDebugRoute=$GameDebugRoute13;
		}case Scene14{
			$GameName=$DebugName14;
			$GameDebugSelect=$GameDebugSelect14;
			$GameDebugRoute=$GameDebugRoute14;
		}case Scene15{
			$GameName=$DebugName15;
			$GameDebugSelect=$GameDebugSelect15;
			$GameDebugRoute=$GameDebugRoute15;
		}case Scene16{
			$GameName=$DebugName16;
			$GameDebugSelect=$GameDebugSelect16;
			$GameDebugRoute=$GameDebugRoute16;
		}case Scene17{
			$GameName=$DebugName17;
			$GameDebugSelect=$GameDebugSelect17;
			$GameDebugRoute=$GameDebugRoute17;
		}case Scene18{
			$GameName=$DebugName18;
			$GameDebugSelect=$GameDebugSelect18;
			$GameDebugRoute=$GameDebugRoute18;
		}case Scene19{
			$GameName=$DebugName19;
			$GameDebugSelect=$GameDebugSelect19;
			$GameDebugRoute=$GameDebugRoute19;
		}case Scene20{
			$GameName=$DebugName20;
			$GameDebugSelect=$GameDebugSelect20;
			$GameDebugRoute=$GameDebugRoute20;
		}case Scene21{
			$GameName=$DebugName21;
			$GameDebugSelect=$GameDebugSelect21;
			$GameDebugRoute=$GameDebugRoute21;
		}case Scene22{
			$GameName=$DebugName22;
			$GameDebugSelect=$GameDebugSelect22;
			$GameDebugRoute=$GameDebugRoute22;
		}case Scene23{
			$GameName=$DebugName23;
			$GameDebugSelect=$GameDebugSelect23;
			$GameDebugRoute=$GameDebugRoute23;
		}case Scene24{
			$GameName=$DebugName24;
			$GameDebugSelect=$GameDebugSelect24;
			$GameDebugRoute=$GameDebugRoute24;
		}case Scene25{
			$GameName=$DebugName25;
			$GameDebugSelect=$GameDebugSelect25;
			$GameDebugRoute=$GameDebugRoute25;
		}case Scene26{
			$GameName=$DebugName26;
			$GameDebugSelect=$GameDebugSelect26;
			$GameDebugRoute=$GameDebugRoute26;
		}case Scene27{
			$GameName=$DebugName27;
			$GameDebugSelect=$GameDebugSelect27;
			$GameDebugRoute=$GameDebugRoute27;
		}case Scene28{
			$GameName=$DebugName28;
			$GameDebugSelect=$GameDebugSelect28;
			$GameDebugRoute=$GameDebugRoute28;
		}case Scene29{
			$GameName=$DebugName29;
			$GameDebugSelect=$GameDebugSelect29;
			$GameDebugRoute=$GameDebugRoute29;
		}case Scene30{
			$GameName=$DebugName30;
			$GameDebugSelect=$GameDebugSelect30;
			$GameDebugRoute=$GameDebugRoute30;
		}case Scene31{
			$GameName=$DebugName31;
			$GameDebugSelect=$GameDebugSelect31;
			$GameDebugRoute=$GameDebugRoute31;
		}case Scene32{
			$GameName=$DebugName32;
			$GameDebugSelect=$GameDebugSelect32;
			$GameDebugRoute=$GameDebugRoute32;
		}case Scene33{
			$GameName=$DebugName33;
			$GameDebugSelect=$GameDebugSelect33;
			$GameDebugRoute=$GameDebugRoute33;
		}case Scene34{
			$GameName=$DebugName34;
			$GameDebugSelect=$GameDebugSelect34;
			$GameDebugRoute=$GameDebugRoute34;
		}case Scene35{
			$GameName=$DebugName35;
			$GameDebugSelect=$GameDebugSelect35;
			$GameDebugRoute=$GameDebugRoute35;
		}case Scene36{
			$GameName=$DebugName36;
			$GameDebugSelect=$GameDebugSelect36;
			$GameDebugRoute=$GameDebugRoute36;
		}case Scene37{
			$GameName=$DebugName37;
			$GameDebugSelect=$GameDebugSelect37;
			$GameDebugRoute=$GameDebugRoute37;
		}case Scene38{
			$GameName=$DebugName38;
			$GameDebugSelect=$GameDebugSelect38;
			$GameDebugRoute=$GameDebugRoute38;
		}case Scene39{
			$GameName=$DebugName39;
			$GameDebugSelect=$GameDebugSelect39;
			$GameDebugRoute=$GameDebugRoute39;
		}case Scene40{
			$GameName=$DebugName40;
			$GameDebugSelect=$GameDebugSelect40;
			$GameDebugRoute=$GameDebugRoute40;
		}
	}

		if($GameName==" 戻る"){$GameName=0;}
		Wait(5);

	if($GameName==0){
		Fade("Chapter*/MouseUsual/img", 0, 0, null, true);
		Fade("Chapter*/MouseClick/img", 0, 0, null, true);

		CreateTexture("すくりーん", 10000, 0, 0, SCREEN);
		Draw();

		//★★★★ロック
		XBOX360_LockVideo(true);
		Delete("Scene*");
		Delete("Scene*/*/*");
		//★★★★アンロック
		XBOX360_LockVideo(false);

		Fade("すくりーん", 500, 0, null, true);
		Delete("すくりーん");

		Fade("Chapter*/MouseUsual/img", 300, 1000, null, true);
	}else{
		$LOCAL_debug_enable=false;
		CreateTexture("すくりーん", 1000, 0, 0, SCREEN);
		Draw();

		//★★★★ロック
		XBOX360_LockVideo(true);
		Delete("Chapter*");
		Delete("Chapter*/*/*");
		Delete("Scene*");
		Delete("Scene*/*/*");
		Delete("Debug*");

//		Fade("すくりーん", 1000, 0, null, true);
//		Delete("すくりーん");

		//★★★★アンロック
		XBOX360_LockVideo(false);
	}

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
}


function DebugChapterFocus()
{
	//18
	DebugChapterFocusPlus(1,2,DOWN);
	DebugChapterFocusPlus(2,3,DOWN);
	DebugChapterFocusPlus(3,4,DOWN);
	DebugChapterFocusPlus(4,5,DOWN);
	DebugChapterFocusPlus(5,6,DOWN);
	DebugChapterFocusPlus(6,7,DOWN);
	DebugChapterFocusPlus(7,8,DOWN);
	DebugChapterFocusPlus(8,9,DOWN);
	DebugChapterFocusPlus(9,10,DOWN);
	DebugChapterFocusPlus(10,11,DOWN);
	DebugChapterFocusPlus(11,12,DOWN);
	DebugChapterFocusPlus(12,13,DOWN);
	DebugChapterFocusPlus(13,14,DOWN);
	DebugChapterFocusPlus(14,15,DOWN);
	DebugChapterFocusPlus(15,16,DOWN);
	DebugChapterFocusPlus(16,17,DOWN);
	DebugChapterFocusPlus(17,18,DOWN);
	DebugChapterFocusPlus(18,19,DOWN);
	DebugChapterFocusPlus(19,20,DOWN);
	DebugChapterFocusPlus(20,1,DOWN);
	DebugChapterFocusPlus(21,22,DOWN);
	DebugChapterFocusPlus(22,23,DOWN);
	DebugChapterFocusPlus(23,24,DOWN);
	DebugChapterFocusPlus(24,25,DOWN);
	DebugChapterFocusPlus(25,26,DOWN);
	DebugChapterFocusPlus(26,21,DOWN);

	DebugChapterFocusPlus(1,20,UP);
	DebugChapterFocusPlus(2,1,UP);
	DebugChapterFocusPlus(3,2,UP);
	DebugChapterFocusPlus(4,3,UP);
	DebugChapterFocusPlus(5,4,UP);
	DebugChapterFocusPlus(6,5,UP);
	DebugChapterFocusPlus(7,6,UP);
	DebugChapterFocusPlus(8,7,UP);
	DebugChapterFocusPlus(9,8,UP);
	DebugChapterFocusPlus(10,9,UP);
	DebugChapterFocusPlus(11,10,UP);
	DebugChapterFocusPlus(12,11,UP);
	DebugChapterFocusPlus(13,12,UP);
	DebugChapterFocusPlus(14,13,UP);
	DebugChapterFocusPlus(15,14,UP);
	DebugChapterFocusPlus(16,15,UP);
	DebugChapterFocusPlus(17,16,UP);
	DebugChapterFocusPlus(18,17,UP);
	DebugChapterFocusPlus(19,18,UP);
	DebugChapterFocusPlus(20,19,UP);
	DebugChapterFocusPlus(21,26,UP);
	DebugChapterFocusPlus(22,21,UP);
	DebugChapterFocusPlus(23,22,UP);
	DebugChapterFocusPlus(24,23,UP);
	DebugChapterFocusPlus(25,24,UP);
	DebugChapterFocusPlus(26,25,UP);

	DebugChapterFocusPlus(1,21,RIGHT);
	DebugChapterFocusPlus(2,22,RIGHT);
	DebugChapterFocusPlus(3,23,RIGHT);
	DebugChapterFocusPlus(4,24,RIGHT);
	DebugChapterFocusPlus(5,25,RIGHT);
	DebugChapterFocusPlus(6,26,RIGHT);
	DebugChapterFocusPlus(21,1,RIGHT);
	DebugChapterFocusPlus(22,2,RIGHT);
	DebugChapterFocusPlus(23,3,RIGHT);
	DebugChapterFocusPlus(24,4,RIGHT);
	DebugChapterFocusPlus(25,5,RIGHT);
	DebugChapterFocusPlus(26,6,RIGHT);

	DebugChapterFocusPlus(1,21,LEFT);
	DebugChapterFocusPlus(2,22,LEFT);
	DebugChapterFocusPlus(3,23,LEFT);
	DebugChapterFocusPlus(4,24,LEFT);
	DebugChapterFocusPlus(5,25,LEFT);
	DebugChapterFocusPlus(6,26,LEFT);
	DebugChapterFocusPlus(21,1,LEFT);
	DebugChapterFocusPlus(22,2,LEFT);
	DebugChapterFocusPlus(23,3,LEFT);
	DebugChapterFocusPlus(24,4,LEFT);
	DebugChapterFocusPlus(25,5,LEFT);
	DebugChapterFocusPlus(26,6,LEFT);
}

function DebugChapterFocusPlus($FocusNumberA,$FocusNumberB,$FocusTarget)
{
	$FocusNameA = "Chapter" + $FocusNumberA + "/MouseUsual/hit";
	$FocusNameB = "Chapter" + $FocusNumberB + "/MouseUsual/hit";
	SetNextFocus($FocusNameA, $FocusNameB, $FocusTarget);
}

//ここ
function DebugSceneFocus()
{
	if($DebugChapterName==1){
		//33
		DebugSceneFocusPlus(1,20,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(1,21,RIGHT);
		DebugSceneFocusPlus(1,21,LEFT);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(2,22,RIGHT);
		DebugSceneFocusPlus(2,22,LEFT);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(3,23,RIGHT);
		DebugSceneFocusPlus(3,23,LEFT);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(4,24,RIGHT);
		DebugSceneFocusPlus(4,24,LEFT);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(5,25,RIGHT);
		DebugSceneFocusPlus(5,25,LEFT);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(6,26,RIGHT);
		DebugSceneFocusPlus(6,26,LEFT);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(7,27,RIGHT);
		DebugSceneFocusPlus(7,27,LEFT);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(8,28,RIGHT);
		DebugSceneFocusPlus(8,28,LEFT);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(9,29,RIGHT);
		DebugSceneFocusPlus(9,29,LEFT);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(10,30,RIGHT);
		DebugSceneFocusPlus(10,30,LEFT);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(11,31,RIGHT);
		DebugSceneFocusPlus(11,31,LEFT);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(12,32,RIGHT);
		DebugSceneFocusPlus(12,32,LEFT);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(13,33,RIGHT);
		DebugSceneFocusPlus(13,33,LEFT);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,17,DOWN);
		DebugSceneFocusPlus(17,16,UP);
		DebugSceneFocusPlus(17,18,DOWN);
		DebugSceneFocusPlus(18,17,UP);
		DebugSceneFocusPlus(18,19,DOWN);
		DebugSceneFocusPlus(19,18,UP);
		DebugSceneFocusPlus(19,20,DOWN);
		DebugSceneFocusPlus(20,19,UP);
		DebugSceneFocusPlus(20,1,DOWN);
		DebugSceneFocusPlus(21,33,UP);
		DebugSceneFocusPlus(21,22,DOWN);
		DebugSceneFocusPlus(21,1,RIGHT);
		DebugSceneFocusPlus(21,1,LEFT);
		DebugSceneFocusPlus(22,21,UP);
		DebugSceneFocusPlus(22,23,DOWN);
		DebugSceneFocusPlus(22,2,RIGHT);
		DebugSceneFocusPlus(22,2,LEFT);
		DebugSceneFocusPlus(23,22,UP);
		DebugSceneFocusPlus(23,24,DOWN);
		DebugSceneFocusPlus(23,3,RIGHT);
		DebugSceneFocusPlus(23,3,LEFT);
		DebugSceneFocusPlus(24,23,UP);
		DebugSceneFocusPlus(24,25,DOWN);
		DebugSceneFocusPlus(24,4,RIGHT);
		DebugSceneFocusPlus(24,4,LEFT);
		DebugSceneFocusPlus(25,24,UP);
		DebugSceneFocusPlus(25,26,DOWN);
		DebugSceneFocusPlus(25,5,RIGHT);
		DebugSceneFocusPlus(25,5,LEFT);
		DebugSceneFocusPlus(26,25,UP);
		DebugSceneFocusPlus(26,27,DOWN);
		DebugSceneFocusPlus(26,6,RIGHT);
		DebugSceneFocusPlus(26,6,LEFT);
		DebugSceneFocusPlus(27,26,UP);
		DebugSceneFocusPlus(27,28,DOWN);
		DebugSceneFocusPlus(27,7,RIGHT);
		DebugSceneFocusPlus(27,7,LEFT);
		DebugSceneFocusPlus(28,27,UP);
		DebugSceneFocusPlus(28,29,DOWN);
		DebugSceneFocusPlus(28,8,RIGHT);
		DebugSceneFocusPlus(28,8,LEFT);
		DebugSceneFocusPlus(29,28,UP);
		DebugSceneFocusPlus(29,30,DOWN);
		DebugSceneFocusPlus(29,9,RIGHT);
		DebugSceneFocusPlus(29,9,LEFT);
		DebugSceneFocusPlus(30,29,UP);
		DebugSceneFocusPlus(30,31,DOWN);
		DebugSceneFocusPlus(30,10,RIGHT);
		DebugSceneFocusPlus(30,10,LEFT);
		DebugSceneFocusPlus(31,30,UP);
		DebugSceneFocusPlus(31,32,DOWN);
		DebugSceneFocusPlus(31,11,RIGHT);
		DebugSceneFocusPlus(31,11,LEFT);
		DebugSceneFocusPlus(32,31,UP);
		DebugSceneFocusPlus(32,33,DOWN);
		DebugSceneFocusPlus(32,12,RIGHT);
		DebugSceneFocusPlus(32,12,LEFT);
		DebugSceneFocusPlus(33,32,UP);
		DebugSceneFocusPlus(33,21,DOWN);
		DebugSceneFocusPlus(33,13,RIGHT);
		DebugSceneFocusPlus(33,13,LEFT);
	}else if($DebugChapterName==2){
		//21
		DebugSceneFocusPlus(1,20,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(1,21,RIGHT);
		DebugSceneFocusPlus(1,21,LEFT);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,17,DOWN);
		DebugSceneFocusPlus(17,16,UP);
		DebugSceneFocusPlus(17,18,DOWN);
		DebugSceneFocusPlus(18,17,UP);
		DebugSceneFocusPlus(18,19,DOWN);
		DebugSceneFocusPlus(19,18,UP);
		DebugSceneFocusPlus(19,20,DOWN);
		DebugSceneFocusPlus(20,19,UP);
		DebugSceneFocusPlus(20,1,DOWN);
		DebugSceneFocusPlus(21,1,RIGHT);
		DebugSceneFocusPlus(21,1,LEFT);
	}else if($DebugChapterName==3){
		//30
		DebugSceneFocusPlus(1,20,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(1,21,RIGHT);
		DebugSceneFocusPlus(1,21,LEFT);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(2,22,RIGHT);
		DebugSceneFocusPlus(2,22,LEFT);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(3,23,RIGHT);
		DebugSceneFocusPlus(3,23,LEFT);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(4,24,RIGHT);
		DebugSceneFocusPlus(4,24,LEFT);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(5,25,RIGHT);
		DebugSceneFocusPlus(5,25,LEFT);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(6,26,RIGHT);
		DebugSceneFocusPlus(6,26,LEFT);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(7,27,RIGHT);
		DebugSceneFocusPlus(7,27,LEFT);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(8,28,RIGHT);
		DebugSceneFocusPlus(8,28,LEFT);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(9,29,RIGHT);
		DebugSceneFocusPlus(9,29,LEFT);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(10,30,RIGHT);
		DebugSceneFocusPlus(10,30,LEFT);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,17,DOWN);
		DebugSceneFocusPlus(17,16,UP);
		DebugSceneFocusPlus(17,18,DOWN);
		DebugSceneFocusPlus(18,17,UP);
		DebugSceneFocusPlus(18,19,DOWN);
		DebugSceneFocusPlus(19,18,UP);
		DebugSceneFocusPlus(19,20,DOWN);
		DebugSceneFocusPlus(20,19,UP);
		DebugSceneFocusPlus(20,1,DOWN);
		DebugSceneFocusPlus(21,30,UP);
		DebugSceneFocusPlus(21,22,DOWN);
		DebugSceneFocusPlus(21,1,RIGHT);
		DebugSceneFocusPlus(21,1,LEFT);
		DebugSceneFocusPlus(22,21,UP);
		DebugSceneFocusPlus(22,23,DOWN);
		DebugSceneFocusPlus(22,2,RIGHT);
		DebugSceneFocusPlus(22,2,LEFT);
		DebugSceneFocusPlus(23,22,UP);
		DebugSceneFocusPlus(23,24,DOWN);
		DebugSceneFocusPlus(23,3,RIGHT);
		DebugSceneFocusPlus(23,3,LEFT);
		DebugSceneFocusPlus(24,23,UP);
		DebugSceneFocusPlus(24,25,DOWN);
		DebugSceneFocusPlus(24,4,RIGHT);
		DebugSceneFocusPlus(24,4,LEFT);
		DebugSceneFocusPlus(25,24,UP);
		DebugSceneFocusPlus(25,26,DOWN);
		DebugSceneFocusPlus(25,5,RIGHT);
		DebugSceneFocusPlus(25,5,LEFT);
		DebugSceneFocusPlus(26,25,UP);
		DebugSceneFocusPlus(26,27,DOWN);
		DebugSceneFocusPlus(26,6,RIGHT);
		DebugSceneFocusPlus(26,6,LEFT);
		DebugSceneFocusPlus(27,26,UP);
		DebugSceneFocusPlus(27,28,DOWN);
		DebugSceneFocusPlus(27,7,RIGHT);
		DebugSceneFocusPlus(27,7,LEFT);
		DebugSceneFocusPlus(28,27,UP);
		DebugSceneFocusPlus(28,29,DOWN);
		DebugSceneFocusPlus(28,8,RIGHT);
		DebugSceneFocusPlus(28,8,LEFT);
		DebugSceneFocusPlus(29,28,UP);
		DebugSceneFocusPlus(29,30,DOWN);
		DebugSceneFocusPlus(29,9,RIGHT);
		DebugSceneFocusPlus(29,9,LEFT);
		DebugSceneFocusPlus(30,29,UP);
		DebugSceneFocusPlus(30,21,DOWN);
		DebugSceneFocusPlus(30,10,RIGHT);
		DebugSceneFocusPlus(30,10,LEFT);
	}else if($DebugChapterName==4){
		//24
		DebugSceneFocusPlus(1,20,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(1,21,RIGHT);
		DebugSceneFocusPlus(1,21,LEFT);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(2,22,RIGHT);
		DebugSceneFocusPlus(2,22,LEFT);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(3,23,RIGHT);
		DebugSceneFocusPlus(3,23,LEFT);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(4,24,RIGHT);
		DebugSceneFocusPlus(4,24,LEFT);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,17,DOWN);
		DebugSceneFocusPlus(17,16,UP);
		DebugSceneFocusPlus(17,18,DOWN);
		DebugSceneFocusPlus(18,17,UP);
		DebugSceneFocusPlus(18,19,DOWN);
		DebugSceneFocusPlus(19,18,UP);
		DebugSceneFocusPlus(19,20,DOWN);
		DebugSceneFocusPlus(20,19,UP);
		DebugSceneFocusPlus(20,1,DOWN);
		DebugSceneFocusPlus(21,24,UP);
		DebugSceneFocusPlus(21,22,DOWN);
		DebugSceneFocusPlus(21,1,RIGHT);
		DebugSceneFocusPlus(21,1,LEFT);
		DebugSceneFocusPlus(22,21,UP);
		DebugSceneFocusPlus(22,23,DOWN);
		DebugSceneFocusPlus(22,2,RIGHT);
		DebugSceneFocusPlus(22,2,LEFT);
		DebugSceneFocusPlus(23,22,UP);
		DebugSceneFocusPlus(23,24,DOWN);
		DebugSceneFocusPlus(23,3,RIGHT);
		DebugSceneFocusPlus(23,3,LEFT);
		DebugSceneFocusPlus(24,23,UP);
		DebugSceneFocusPlus(24,21,DOWN);
		DebugSceneFocusPlus(24,4,RIGHT);
		DebugSceneFocusPlus(24,4,LEFT);
	}else if($DebugChapterName==5){
		//16
		DebugSceneFocusPlus(1,16,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,1,DOWN);
	}else if($DebugChapterName==6){
		//21
		DebugSceneFocusPlus(1,20,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(1,21,RIGHT);
		DebugSceneFocusPlus(1,21,LEFT);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,17,DOWN);
		DebugSceneFocusPlus(17,16,UP);
		DebugSceneFocusPlus(17,18,DOWN);
		DebugSceneFocusPlus(18,17,UP);
		DebugSceneFocusPlus(18,19,DOWN);
		DebugSceneFocusPlus(19,18,UP);
		DebugSceneFocusPlus(19,20,DOWN);
		DebugSceneFocusPlus(20,19,UP);
		DebugSceneFocusPlus(20,1,DOWN);
		DebugSceneFocusPlus(21,1,RIGHT);
		DebugSceneFocusPlus(21,1,LEFT);
	}else if($DebugChapterName==7){
		//29
		DebugSceneFocusPlus(1,20,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(1,21,RIGHT);
		DebugSceneFocusPlus(1,21,LEFT);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(2,22,RIGHT);
		DebugSceneFocusPlus(2,22,LEFT);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(3,23,RIGHT);
		DebugSceneFocusPlus(3,23,LEFT);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(4,24,RIGHT);
		DebugSceneFocusPlus(4,24,LEFT);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(5,25,RIGHT);
		DebugSceneFocusPlus(5,25,LEFT);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(6,26,RIGHT);
		DebugSceneFocusPlus(6,26,LEFT);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(7,27,RIGHT);
		DebugSceneFocusPlus(7,27,LEFT);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(8,28,RIGHT);
		DebugSceneFocusPlus(8,28,LEFT);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(9,29,RIGHT);
		DebugSceneFocusPlus(9,29,LEFT);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,17,DOWN);
		DebugSceneFocusPlus(17,16,UP);
		DebugSceneFocusPlus(17,18,DOWN);
		DebugSceneFocusPlus(18,17,UP);
		DebugSceneFocusPlus(18,19,DOWN);
		DebugSceneFocusPlus(19,18,UP);
		DebugSceneFocusPlus(19,20,DOWN);
		DebugSceneFocusPlus(20,19,UP);
		DebugSceneFocusPlus(20,1,DOWN);
		DebugSceneFocusPlus(21,29,UP);
		DebugSceneFocusPlus(21,22,DOWN);
		DebugSceneFocusPlus(21,1,RIGHT);
		DebugSceneFocusPlus(21,1,LEFT);
		DebugSceneFocusPlus(22,21,UP);
		DebugSceneFocusPlus(22,23,DOWN);
		DebugSceneFocusPlus(22,2,RIGHT);
		DebugSceneFocusPlus(22,2,LEFT);
		DebugSceneFocusPlus(23,22,UP);
		DebugSceneFocusPlus(23,24,DOWN);
		DebugSceneFocusPlus(23,3,RIGHT);
		DebugSceneFocusPlus(23,3,LEFT);
		DebugSceneFocusPlus(24,23,UP);
		DebugSceneFocusPlus(24,25,DOWN);
		DebugSceneFocusPlus(24,4,RIGHT);
		DebugSceneFocusPlus(24,4,LEFT);
		DebugSceneFocusPlus(25,24,UP);
		DebugSceneFocusPlus(25,26,DOWN);
		DebugSceneFocusPlus(25,5,RIGHT);
		DebugSceneFocusPlus(25,5,LEFT);
		DebugSceneFocusPlus(26,25,UP);
		DebugSceneFocusPlus(26,27,DOWN);
		DebugSceneFocusPlus(26,6,RIGHT);
		DebugSceneFocusPlus(26,6,LEFT);
		DebugSceneFocusPlus(27,26,UP);
		DebugSceneFocusPlus(27,28,DOWN);
		DebugSceneFocusPlus(27,7,RIGHT);
		DebugSceneFocusPlus(27,7,LEFT);
		DebugSceneFocusPlus(28,27,UP);
		DebugSceneFocusPlus(28,29,DOWN);
		DebugSceneFocusPlus(28,8,RIGHT);
		DebugSceneFocusPlus(28,8,LEFT);
		DebugSceneFocusPlus(29,28,UP);
		DebugSceneFocusPlus(29,21,DOWN);
		DebugSceneFocusPlus(29,9,RIGHT);
		DebugSceneFocusPlus(29,9,LEFT);
	}else if($DebugChapterName==8){
		//24
		DebugSceneFocusPlus(1,20,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(1,21,RIGHT);
		DebugSceneFocusPlus(1,21,LEFT);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(2,22,RIGHT);
		DebugSceneFocusPlus(2,22,LEFT);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(3,23,RIGHT);
		DebugSceneFocusPlus(3,23,LEFT);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(4,24,RIGHT);
		DebugSceneFocusPlus(4,24,LEFT);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,17,DOWN);
		DebugSceneFocusPlus(17,16,UP);
		DebugSceneFocusPlus(17,18,DOWN);
		DebugSceneFocusPlus(18,17,UP);
		DebugSceneFocusPlus(18,19,DOWN);
		DebugSceneFocusPlus(19,18,UP);
		DebugSceneFocusPlus(19,20,DOWN);
		DebugSceneFocusPlus(20,19,UP);
		DebugSceneFocusPlus(20,1,DOWN);
		DebugSceneFocusPlus(21,24,UP);
		DebugSceneFocusPlus(21,22,DOWN);
		DebugSceneFocusPlus(21,1,RIGHT);
		DebugSceneFocusPlus(21,1,LEFT);
		DebugSceneFocusPlus(22,21,UP);
		DebugSceneFocusPlus(22,23,DOWN);
		DebugSceneFocusPlus(22,2,RIGHT);
		DebugSceneFocusPlus(22,2,LEFT);
		DebugSceneFocusPlus(23,22,UP);
		DebugSceneFocusPlus(23,24,DOWN);
		DebugSceneFocusPlus(23,3,RIGHT);
		DebugSceneFocusPlus(23,3,LEFT);
		DebugSceneFocusPlus(24,23,UP);
		DebugSceneFocusPlus(24,21,DOWN);
		DebugSceneFocusPlus(24,4,RIGHT);
		DebugSceneFocusPlus(24,4,LEFT);
	}else if($DebugChapterName==9){
		//24
		DebugSceneFocusPlus(1,20,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(1,21,RIGHT);
		DebugSceneFocusPlus(1,21,LEFT);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(2,22,RIGHT);
		DebugSceneFocusPlus(2,22,LEFT);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(3,23,RIGHT);
		DebugSceneFocusPlus(3,23,LEFT);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(4,24,RIGHT);
		DebugSceneFocusPlus(4,24,LEFT);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,17,DOWN);
		DebugSceneFocusPlus(17,16,UP);
		DebugSceneFocusPlus(17,18,DOWN);
		DebugSceneFocusPlus(18,17,UP);
		DebugSceneFocusPlus(18,19,DOWN);
		DebugSceneFocusPlus(19,18,UP);
		DebugSceneFocusPlus(19,20,DOWN);
		DebugSceneFocusPlus(20,19,UP);
		DebugSceneFocusPlus(20,1,DOWN);
		DebugSceneFocusPlus(21,24,UP);
		DebugSceneFocusPlus(21,22,DOWN);
		DebugSceneFocusPlus(21,1,RIGHT);
		DebugSceneFocusPlus(21,1,LEFT);
		DebugSceneFocusPlus(22,21,UP);
		DebugSceneFocusPlus(22,23,DOWN);
		DebugSceneFocusPlus(22,2,RIGHT);
		DebugSceneFocusPlus(22,2,LEFT);
		DebugSceneFocusPlus(23,22,UP);
		DebugSceneFocusPlus(23,24,DOWN);
		DebugSceneFocusPlus(23,3,RIGHT);
		DebugSceneFocusPlus(23,3,LEFT);
		DebugSceneFocusPlus(24,23,UP);
		DebugSceneFocusPlus(24,21,DOWN);
		DebugSceneFocusPlus(24,4,RIGHT);
		DebugSceneFocusPlus(24,4,LEFT);
	}else if($DebugChapterName==10){
		//24
		DebugSceneFocusPlus(1,20,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(1,21,RIGHT);
		DebugSceneFocusPlus(1,21,LEFT);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(2,22,RIGHT);
		DebugSceneFocusPlus(2,22,LEFT);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(3,23,RIGHT);
		DebugSceneFocusPlus(3,23,LEFT);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(4,24,RIGHT);
		DebugSceneFocusPlus(4,24,LEFT);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(5,25,RIGHT);
		DebugSceneFocusPlus(5,25,LEFT);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(6,26,RIGHT);
		DebugSceneFocusPlus(6,26,LEFT);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(7,27,RIGHT);
		DebugSceneFocusPlus(7,27,LEFT);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(8,28,RIGHT);
		DebugSceneFocusPlus(8,28,LEFT);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(9,29,RIGHT);
		DebugSceneFocusPlus(9,29,LEFT);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,17,DOWN);
		DebugSceneFocusPlus(17,16,UP);
		DebugSceneFocusPlus(17,18,DOWN);
		DebugSceneFocusPlus(18,17,UP);
		DebugSceneFocusPlus(18,19,DOWN);
		DebugSceneFocusPlus(19,18,UP);
		DebugSceneFocusPlus(19,20,DOWN);
		DebugSceneFocusPlus(20,19,UP);
		DebugSceneFocusPlus(20,1,DOWN);
		DebugSceneFocusPlus(21,24,UP);
		DebugSceneFocusPlus(21,22,DOWN);
		DebugSceneFocusPlus(21,1,RIGHT);
		DebugSceneFocusPlus(21,1,LEFT);
		DebugSceneFocusPlus(22,21,UP);
		DebugSceneFocusPlus(22,23,DOWN);
		DebugSceneFocusPlus(22,2,RIGHT);
		DebugSceneFocusPlus(22,2,LEFT);
		DebugSceneFocusPlus(23,22,UP);
		DebugSceneFocusPlus(23,24,DOWN);
		DebugSceneFocusPlus(23,3,RIGHT);
		DebugSceneFocusPlus(23,3,LEFT);
		DebugSceneFocusPlus(24,23,UP);
		DebugSceneFocusPlus(24,25,DOWN);
		DebugSceneFocusPlus(24,4,RIGHT);
		DebugSceneFocusPlus(24,4,LEFT);
		DebugSceneFocusPlus(25,24,UP);
		DebugSceneFocusPlus(25,26,DOWN);
		DebugSceneFocusPlus(25,5,RIGHT);
		DebugSceneFocusPlus(25,5,LEFT);
		DebugSceneFocusPlus(26,25,UP);
		DebugSceneFocusPlus(26,27,DOWN);
		DebugSceneFocusPlus(26,6,RIGHT);
		DebugSceneFocusPlus(26,6,LEFT);
		DebugSceneFocusPlus(27,26,UP);
		DebugSceneFocusPlus(27,28,DOWN);
		DebugSceneFocusPlus(27,7,RIGHT);
		DebugSceneFocusPlus(27,7,LEFT);
		DebugSceneFocusPlus(28,27,UP);
		DebugSceneFocusPlus(28,29,DOWN);
		DebugSceneFocusPlus(28,8,RIGHT);
		DebugSceneFocusPlus(28,8,LEFT);
		DebugSceneFocusPlus(29,28,UP);
		DebugSceneFocusPlus(29,21,DOWN);
		DebugSceneFocusPlus(29,9,RIGHT);
		DebugSceneFocusPlus(29,9,LEFT);
	}else if($DebugChapterName==11){
		//10
		DebugSceneFocusPlus(1,10,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,1,DOWN);
	}else if($DebugChapterName==12){
		//16
		DebugSceneFocusPlus(1,16,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,1,DOWN);
	}else if($DebugChapterName==13){
		//15
		DebugSceneFocusPlus(1,15,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,1,DOWN);
	}else if($DebugChapterName==14){
		//15
		DebugSceneFocusPlus(1,15,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,1,DOWN);
	}else if($DebugChapterName==15){
		//13
		DebugSceneFocusPlus(1,13,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,1,DOWN);
	}else if($DebugChapterName==16){
		//18
		DebugSceneFocusPlus(1,18,UP);
		DebugSceneFocusPlus(1,2,DOWN);
		DebugSceneFocusPlus(2,1,UP);
		DebugSceneFocusPlus(2,3,DOWN);
		DebugSceneFocusPlus(3,2,UP);
		DebugSceneFocusPlus(3,4,DOWN);
		DebugSceneFocusPlus(4,3,UP);
		DebugSceneFocusPlus(4,5,DOWN);
		DebugSceneFocusPlus(5,4,UP);
		DebugSceneFocusPlus(5,6,DOWN);
		DebugSceneFocusPlus(6,5,UP);
		DebugSceneFocusPlus(6,7,DOWN);
		DebugSceneFocusPlus(7,6,UP);
		DebugSceneFocusPlus(7,8,DOWN);
		DebugSceneFocusPlus(8,7,UP);
		DebugSceneFocusPlus(8,9,DOWN);
		DebugSceneFocusPlus(9,8,UP);
		DebugSceneFocusPlus(9,10,DOWN);
		DebugSceneFocusPlus(10,9,UP);
		DebugSceneFocusPlus(10,11,DOWN);
		DebugSceneFocusPlus(11,10,UP);
		DebugSceneFocusPlus(11,12,DOWN);
		DebugSceneFocusPlus(12,11,UP);
		DebugSceneFocusPlus(12,13,DOWN);
		DebugSceneFocusPlus(13,12,UP);
		DebugSceneFocusPlus(13,14,DOWN);
		DebugSceneFocusPlus(14,13,UP);
		DebugSceneFocusPlus(14,15,DOWN);
		DebugSceneFocusPlus(15,14,UP);
		DebugSceneFocusPlus(15,16,DOWN);
		DebugSceneFocusPlus(16,15,UP);
		DebugSceneFocusPlus(16,17,DOWN);
		DebugSceneFocusPlus(17,16,UP);
		DebugSceneFocusPlus(17,18,DOWN);
		DebugSceneFocusPlus(18,17,UP);
		DebugSceneFocusPlus(18,1,DOWN);
	}
}

function DebugSceneFocusPlus($FocusNumberA,$FocusNumberB,$FocusTarget)
{
	$FocusNameA = "Scene" + $FocusNumberA + "/MouseUsual/hit";
	$FocusNameB = "Scene" + $FocusNumberB + "/MouseUsual/hit";
	SetNextFocus($FocusNameA, $FocusNameB, $FocusTarget);
}


function DebugNameCount()
{
	if($DebugCount==1){
		$DebugName=$DebugName01;
	}else if($DebugCount==2){
		$DebugName=$DebugName02;
	}else if($DebugCount==3){
		$DebugName=$DebugName03;
	}else if($DebugCount==4){
		$DebugName=$DebugName04;
	}else if($DebugCount==5){
		$DebugName=$DebugName05;
	}else if($DebugCount==6){
		$DebugName=$DebugName06;
	}else if($DebugCount==7){
		$DebugName=$DebugName07;
	}else if($DebugCount==8){
		$DebugName=$DebugName08;
	}else if($DebugCount==9){
		$DebugName=$DebugName09;
	}else if($DebugCount==10){
		$DebugName=$DebugName10;
	}else if($DebugCount==11){
		$DebugName=$DebugName11;
	}else if($DebugCount==12){
		$DebugName=$DebugName12;
	}else if($DebugCount==13){
		$DebugName=$DebugName13;
	}else if($DebugCount==14){
		$DebugName=$DebugName14;
	}else if($DebugCount==15){
		$DebugName=$DebugName15;
	}else if($DebugCount==16){
		$DebugName=$DebugName16;
	}else if($DebugCount==17){
		$DebugName=$DebugName17;
	}else if($DebugCount==18){
		$DebugName=$DebugName18;
	}else if($DebugCount==19){
		$DebugName=$DebugName19;
	}else if($DebugCount==20){
		$DebugName=$DebugName20;
	}else if($DebugCount==21){
		$DebugName=$DebugName21;
	}else if($DebugCount==22){
		$DebugName=$DebugName22;
	}else if($DebugCount==23){
		$DebugName=$DebugName23;
	}else if($DebugCount==24){
		$DebugName=$DebugName24;
	}else if($DebugCount==25){
		$DebugName=$DebugName25;
	}else if($DebugCount==26){
		$DebugName=$DebugName26;
	}else if($DebugCount==27){
		$DebugName=$DebugName27;
	}else if($DebugCount==28){
		$DebugName=$DebugName28;
	}else if($DebugCount==29){
		$DebugName=$DebugName29;
	}else if($DebugCount==30){
		$DebugName=$DebugName30;
	}else if($DebugCount==31){
		$DebugName=$DebugName31;
	}else if($DebugCount==32){
		$DebugName=$DebugName32;
	}else if($DebugCount==33){
		$DebugName=$DebugName33;
	}else if($DebugCount==34){
		$DebugName=$DebugName34;
	}else if($DebugCount==35){
		$DebugName=$DebugName35;
	}else if($DebugCount==36){
		$DebugName=$DebugName36;
	}else if($DebugCount==37){
		$DebugName=$DebugName37;
	}else if($DebugCount==38){
		$DebugName=$DebugName38;
	}else if($DebugCount==39){
		$DebugName=$DebugName39;
	}else if($DebugCount==40){
		$DebugName=$DebugName40;
	}
}


function DebugFormat()
{
	$DebugName01="xxx";
	$GameDebugSelect01=false;
	$GameDebugRoute01="xxx";

	$DebugName02="xxx";
	$GameDebugSelect02=false;
	$GameDebugRoute02="xxx";

	$DebugName03="xxx";
	$GameDebugSelect03=false;
	$GameDebugRoute03="xxx";

	$DebugName04="xxx";
	$GameDebugSelect04=false;
	$GameDebugRoute04="xxx";

	$DebugName05="xxx";
	$GameDebugSelect05=false;
	$GameDebugRoute05="xxx";

	$DebugName06="xxx";
	$GameDebugSelect06=false;
	$GameDebugRoute06="xxx";

	$DebugName07="xxx";
	$GameDebugSelect07=false;
	$GameDebugRoute07="xxx";

	$DebugName08="xxx";
	$GameDebugSelect08=false;
	$GameDebugRoute08="xxx";

	$DebugName09="xxx";
	$GameDebugSelect09=false;
	$GameDebugRoute09="xxx";

	$DebugName10="xxx";
	$GameDebugSelect10=false;
	$GameDebugRoute10="xxx";

	$DebugName11="xxx";
	$GameDebugSelect11=false;
	$GameDebugRoute11="xxx";

	$DebugName12="xxx";
	$GameDebugSelect12=false;
	$GameDebugRoute12="xxx";

	$DebugName13="xxx";
	$GameDebugSelect13=false;
	$GameDebugRoute13="xxx";

	$DebugName14="xxx";
	$GameDebugSelect14=false;
	$GameDebugRoute14="xxx";

	$DebugName15="xxx";
	$GameDebugSelect15=false;
	$GameDebugRoute15="xxx";

	$DebugName16="xxx";
	$GameDebugSelect16=false;
	$GameDebugRoute16="xxx";

	$DebugName17="xxx";
	$GameDebugSelect17=false;
	$GameDebugRoute17="xxx";

	$DebugName18="xxx";
	$GameDebugSelect18=false;
	$GameDebugRoute18="xxx";

	$DebugName19="xxx";
	$GameDebugSelect19=false;
	$GameDebugRoute19="xxx";

	$DebugName20="xxx";
	$GameDebugSelect20=false;
	$GameDebugRoute20="xxx";

	$DebugName21="xxx";
	$GameDebugSelect21=false;
	$GameDebugRoute21="xxx";

	$DebugName22="xxx";
	$GameDebugSelect22=false;
	$GameDebugRoute22="xxx";

	$DebugName23="xxx";
	$GameDebugSelect23=false;
	$GameDebugRoute23="xxx";

	$DebugName24="xxx";
	$GameDebugSelect24=false;
	$GameDebugRoute24="xxx";

	$DebugName25="xxx";
	$GameDebugSelect25=false;
	$GameDebugRoute25="xxx";

	$DebugName26="xxx";
	$GameDebugSelect26=false;
	$GameDebugRoute26="xxx";

	$DebugName27="xxx";
	$GameDebugSelect27=false;
	$GameDebugRoute27="xxx";

	$DebugName28="xxx";
	$GameDebugSelect28=false;
	$GameDebugRoute28="xxx";

	$DebugName29="xxx";
	$GameDebugSelect29=false;
	$GameDebugRoute29="xxx";

	$DebugName30="xxx";
	$GameDebugSelect30=false;
	$GameDebugRoute30="xxx";

	$DebugName31="xxx";
	$GameDebugSelect31=false;
	$GameDebugRoute31="xxx";

	$DebugName32="xxx";
	$GameDebugSelect32=false;
	$GameDebugRoute32="xxx";

	$DebugName33="xxx";
	$GameDebugSelect33=false;
	$GameDebugRoute33="xxx";

	$DebugName34="xxx";
	$GameDebugSelect34=false;
	$GameDebugRoute34="xxx";

	$DebugName35="xxx";
	$GameDebugSelect35=false;
	$GameDebugRoute35="xxx";

	$DebugName36="xxx";
	$GameDebugSelect36=false;
	$GameDebugRoute36="xxx";

	$DebugName37="xxx";
	$GameDebugSelect37=false;
	$GameDebugRoute37="xxx";

	$DebugName38="xxx";
	$GameDebugSelect38=false;
	$GameDebugRoute38="xxx";

	$DebugName39="xxx";
	$GameDebugSelect39=false;
	$GameDebugRoute39="xxx";

	$DebugName40="xxx";
	$GameDebugSelect40=false;
	$GameDebugRoute40="xxx";
}


function TitleSelectionAll()
{
	#ClearG=true;
	#ClearPieceR=true;
	#ClearPieceY=true;
	#ClearPieceS=true;
	#ClearPieceK=true;
	#ClearPieceN=true;
	#ClearPieceA=true;
	#ClearRouteB=true;
	#ClearRouteA=true;
	#ClearFinal=true;
	#EndPieceR=true;
	#EndPieceY=true;
	#EndPieceS=true;
	#EndPieceK=true;
	#EndPieceN=true;
	#EndPieceA=true;
	#EndRouteB=true;
	#EndRouteA=true;
	#EndFinal=true;
}