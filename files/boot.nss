#include "nss/function.nss"
#include "nss/function_select.nss"
#include "nss/function_system.nss"
#include "nss/function_title.nss"

//=============================================================================//
//◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆
.//★遊戯円環★バージョン1.00
//◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆
//=============================================================================//
chapter main
{
//	CreateColor("色", 9999999, 0, 0, 800, 600, "BLUE");
//	WaitKey();

	//★：私はアイドル状態です
	$SYSTEM_XBOX360_rich_presence_mode=24;
	XBOX360_Presence(24);

	//★★★★ロック
	XBOX360_LockVideo(true);

	$SYSTEM_menu_lock = true;
	$PHome2=100;

	//■：最初のお約束
	if(!#N2Start){
		//●設定リセット
		ConfigFormat();
		//●総プレイ時間：計測開始
		#BEGIN_TIME = Time();
		#N2Start=true;
		if(Platform()==100){
			//★対策「オンロードメモリ」
			DialogLoad();
		}
		if(Message("フルスクリーンにしますか？","「Ｆ」キーで切り換えが可能です",YESNO,QUESTION)==2){
			#SYSTEM_window_full=true;
			#SYSTEM_video_aspect_fixed=1;
		}
	}

	#GameNumber=0;
	#SYSTEM_product_code="GIRU_KURA";
	#SCRIPT_VERSION="TRIAL";
//	#SYSTEM_loading_image="cg/sys/save/loading.jpg";
	#SYSTEM_loading_image_x=298;
	#SYSTEM_loading_image_y=213;
	#LOCAL_sys_platform=Platform();



	while(1)
	{
		$ChapterName = "boot";
		

		//★：アイドル状態です
		$SYSTEM_XBOX360_rich_presence_mode=24;
		XBOX360_Presence(24);

		ClearBacklog();

		//★対策「ロードオンメモリ」
		if(!$ExtraTitle&&Platform()==100&&$PressKey){
			CreateProcess("タイトルメモリプロセス", 150, 0, 0, "TitleMemPro");
			SetAlias("タイトルメモリプロセス", "タイトルメモリプロセス");
			Request("タイトルメモリプロセス", Start);
		}
		
		
	
		




		$GameStart = 1;

//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
		//デバッグ用
//★納品時にはこれをはずす★★★
		$DebugModeStart=false;
		if($PressKey&&$DebugModeStart){
			//AYABE();
		}
//★★★★★★★★★★★★★★★
		if($DebugModeStart){
			//$GameContiune = 1;
			//$PreGameName = "boot_第一章";
			//$GameName = "ch01_000_体験版";
		}

		if($DebugModeStart){
			#DebugMode=true;
		}else{
			#DebugMode=false;
		}
		//$Logo=true;
		//$PressKey=true;
		//#ClearLast=false;
		//$FirstBlue=false;
		//$ClearL=true;
		//#ClearG=true;
		//#ClearAll=false;
			//#ClearFinal=true;
			//#ClearPieceR=true;
			//#ClearPieceY=true;
			//#ClearPieceS=true;
			//#ClearPieceK=true;
			//#ClearPieceN=true;
			//#ClearPieceA=true;
			//#ClearRouteB=true;
			//#ClearRouteA=true;

//		#下着パッチ=false;
//		DebugSound();
//		DebugGallery();
//▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

		//★：定義
		SystemInit();
		//★：下着用初期化フラグ
		#下着パッチ=false;
		//★：フラグ初期化
		if(!#DebugMode){
			InitTrigger();
		}

		if($GameContiune == 1)
		{
			//★★★★アンロック
			XBOX360_LockVideo(false);

			#play_speed_plus = 3;
			$GameContiune = 0;
			Delete("*");
			call_chapter nss/boot_開始スクリプト.nss;
		}

		//★：システム変数系のクリア
		#play_speed_plus += 0;
		if(#play_speed_plus != 0){
			/*初回起動時ではないときは、プレイ速度をバックアップ*/
			#play_speed_plus = #SYSTEM_play_speed;
		}else{
			/*初回起動時は、プレイ速度のバックアップを３に固定*/
			#play_speed_plus = 3;
		}

		$GameName = 0;

		$PLACE_badend = 0;
		$PLACE_title = true;

		$SYSTEM_skip=false;
		$SYSTEM_text_auto=false;
		#SYSTEM_play_speed = 3;
		$SYSTEM_menu_lock = true;

		//★タイトルで何を選択したかのリセット
		$TitleSelect = 0;

		CreateColor("タイトルカラー", 1000, Center, Middle, 16, 9, "BLACK");
		Zoom("タイトルカラー", 0, 90000, 90000, null, false);
		Fade("タイトルカラー", 0, 0, null, true);
		Fade("@box11",0,0,null,false);
		Fade("@box12",0,0,null,true);

		//■フルスクプロセス
		TitleScreen();
		//■：コングラ判定
		TitleCongratulations();
		//■：青空判定
		TitleBlueSky();

		//★★★★アンロック
		XBOX360_LockVideo(false);
		//■：保存中
		SavingStart();
		//★★★★ロック
		XBOX360_LockVideo(true);

		$ClearL=false;

		//■：ロゴとエキストラBGM判定
		TitleLogo();
		//■：タイトル定義
		TitleSet();

		//★：タイトルです
		$SYSTEM_XBOX360_rich_presence_mode=24;
		XBOX360_Presence(1);

		//■：タイトル動作
		TitleFade();
		//■：タイトルセレクト
		TitleSelect();

		Request("タイトルサウンド開始音１", UnLock);
		Request("タイトルサウンド読込音１", UnLock);
		Request("タイトルサウンド設定音１", UnLock);
		Request("タイトルサウンド特別音１", UnLock);
		Request("タイトルサウンド出口音１", UnLock);
		Request("タイトルサウンド戸口音１", UnLock);
		Request("タイトルサウンド青空音１", UnLock);

		//★：結果
		if($TitleSelect == 1)
		{
			Delete("*");
			Request("タイトル選択サウンド", UnLock);
			Request("タイトル選択サウンド２", UnLock);
			SetVolume("タイトル選択サウンド２", 5000, 0, NULL);
//			Wait(3000);
			call_chapter nss/boot_開始スクリプト.nss;
		}

		if($TitleSelect == 2)
		{
			$ExtraTitle = true;
			//$エキストラＢＧＭ = "@CH05";
			Delete("タイトル*");
			Request("タイトル選択サウンド", UnLock);
			call_chapter nss/extra_menu.nss;
			MoveCursor(356,162);
		}

		if($TitleSelect == 3)
		{
			Delete("*");
			Request("タイトル選択サウンド", UnLock);
			Request("タイトル選択サウンド２", UnLock);
			SetVolume("タイトル選択サウンド２", 5000, 0, NULL);
//			Wait(1000);
			call_chapter nss/boot_開始スクリプト.nss;
		}

		if($TitleSelect == 4)
		{
			$GameName = 1;
			Delete("*");
			Request("タイトル選択サウンド", UnLock);
			Request("タイトル選択サウンド２", UnLock);
			SetVolume("タイトル選択サウンド２", 5000, 0, NULL);
//			Wait(1000);
			call_chapter nss/boot_開始スクリプト.nss;
		}

		if($TitleSelect == 5)
		{
			$GameName = 1;
			Delete("*");
			Request("タイトル選択サウンド", UnLock);
			Request("タイトル選択サウンド２", UnLock);
			SetVolume("タイトル選択サウンド２", 5000, 0, NULL);
//			Wait(1000);
			call_chapter nss/boot_開始スクリプト.nss;
		}
		
	}
	//->end while

}
//->end chapter main
//=============================================================================//



//============================================================================//
..//■タイトルフルスクプロセス■
//============================================================================//
function TitleScreen()
{
	CreateProcess("タイトルフルスクプロセス", 150, 0, 0, "TitleFull");
	SetAlias("タイトルフルスクプロセス", "タイトルフルスクプロセス");
	Request("タイトルフルスクプロセス", Start);
}
function TitleFull(){
	select{
		//★キーダウン系
		if($SYSTEM_keydown_f){
			if(!#SYSTEM_window_full_lock){
				#SYSTEM_window_full=!#SYSTEM_window_full;
				#SYSTEM_window_full_lock=false;
				#SYSTEM_video_aspect_fixed=1;
				Wait(300);
				$SYSTEM_keydown_f=false;
			}
		}
	}
}
//============================================================================//


//============================================================================//
..//■コングラチュレーション！判定■
//============================================================================//
function TitleCongratulations()
{
	if(#ClearFinal&&$ClearL&&!#ClearAll)
	{
		if(#bg119_01_3_監視カメラ映像_a&&#bg136_01_1_希ＶＩＰルーム_a&&#bg136_02_1_希ＶＩＰルーム_a&&#bg136_03_1_chn希ＶＩＰルーム_a&&#ev001_01_1_INT01近づく梨深_a&&#ev005_01_3_杭貼付け_a&&#ev006_01_3_グロ画像_a&&#ev006_02_3_グロ画像_a&&#ev007_01_3_十字架杭拓巳_a&&#ev007_02_6_十字架杭拓巳_a&&#ev008_01_4_INT02あやせ歌う_a&&#ev009_01_4_腕掴みミイラ_a&&#ev010_01_4_腕掴み梨深_a&&#ev012_01_1_星来横たわり_a&&#ev013_01_1_拓巳笑い口UP_a&&#ev013_02_1_拓巳笑い口UP_a&&#ev013_03_1_拓巳笑い口UP_a&&#ev014_01_1_スプー_a&&#ev015_01_1_七海妄想エロ_a&&#ev015_02_1_七海妄想エロ_a&&#ev016_01_1_七海携帯萌_a&&#ev017_01_2_尾道_a&&#ev017_02_2_尾道_a&&#ev018_01_3_優愛_a&&#ev019_01_3_優愛妄想_a&&#ev019_02_3_優愛妄想_a&&#ev020_01_3_優愛足下_a&&#ev021_01_3_十字架杭優愛_a&&#ev022_01_1_星来キス妄想_a&&#ev023_01_3_INT06優愛寝転がる_a){
			$GalleryList01=true;
		}else{
			//CreateText("テキスト１", 999999, 50, 50, 700, 500, "×チェック１");
		}

		if(#ev024_01_3_あやせライブシーン_a&&#ev025_01_3_あやせ脱ぎ妄想_a&&#ev026_01_2_七海ハンバーガー_a&&#ev026_02_2_七海ハンバーガー_a&&#ev027_01_3_見下ろしセナ_a&&#ev028_01_0_あやせライブ三住切る_a&&#ev029_01_2_梨深ソファ腰掛け_a&&#ev030_01_2_七海バングル_a&&#ev031_01_0_梢転校_a&&#ev032_01_3_梨深だきしめ_a&&#ev033_01_1_INT12セナ会話意識集中_a&&#ev034_01_6_梨深と将軍の出会い_a&&#ev035_01_0_梢コケる_a&&#ev036_01_2_セナ白い鎖_a&&#ev036_02_2_セナ白い鎖_a&&#ev037_01_3_INT13優愛自室でメール書く_a&&#ev038_01_3_優愛ROOM37乱入_a&&#ev039_01_3_あやせ白下着_a&&#ev039_02_3_あやせ白下着_a&&#ev040_01_3_あやせディソード出す_a&&#ev040_02_3_あやせディソード出す_a&&#ev041_01_2_優愛教室ドアから見ている_a&&#ev042_01_2_梨深に介抱される_a&&#ev042_02_2_梨深に介抱される_a&&#ev043_01_2_梨深CD貸してくれたら_a){
			$GalleryList02=true;
		}else{
			//CreateText("テキスト２", 999999, 50, 100, 700, 500, "×チェック２");
		}

		if(#ev044_01_2_梨深下着Yシャツ_a&&#ev044_02_2_梨深下着Yシャツ_a&&#ev044_03_2_梨深下着Yシャツ_a&&#ev045_01_3_INT16セナ機械破壊_a&&#ev050_01_1_受診小学生拓巳_a&&#ev052_01_3_将軍車椅子_a&&#ev052_02_3_将軍車椅子_a&&#ev054_01_3_刑事二人_a&&#ev055_01_1_刑事と探偵会話_a&&#ev056_01_1_9歳七海拓巳に食事_a&&#ev056_01_1_優愛へたりこみ電話_a&&#ev056_02_1_優愛へたりこみ電話_a&&#ev057_01_1_拓巳子供時代_a&&#ev057_01_3_Q－FrontTVモニター_a&&#ev059_01_6_あやせ拷問_a&&#ev060_01_3_セナコンテナ登場_a&&#ev060_02_3_セナコンテナ登場_a&&#ev062_01_1_プリクラ_a&&#ev062_02_1_プリクラ_a&&#ev063_01_1_マジックミラー波多野_a&&#ev063_02_1_マジックミラー波多野_a&&#ev064_01_1_あやせ飛び降りようと_a&&#ev065_01_1_あやせ投身_a&&#ev065_02_1_あやせ投身_a&&#ev066_01_1_あやせ花壇落ち_a&&#ev067_01_6_血溜り七海_a&&#ev068_01_1_七海廊下後姿_a){
			$GalleryList03=true;
		}else{
			//CreateText("テキスト３", 999999, 50, 150, 700, 500, "×チェック３");
		}

		if(#ev069_01_1_七海廊下後姿髪かきあげ_a&&#ev070_01_2_将軍と梨深in病院_a&&#ev070_02_2_将軍と梨深in病院_a&&#ev071_01_1_梢ディソード顕現_a&&#ev071_02_2_梢ディソード顕現_a&&#ev072_01_1_梢と波多野Roft前_a&&#ev073_01_1_赤子を抱く母_a&&#ev076_01_4_美愛くま抱き_a&&#ev077_01_3_野呂瀬社長室_a&&#ev078_01_3_葉月ナースめがね_a&&#ev078_02_3_葉月ナースめがね_a&&#ev079_01_3_梨深セナ対決_a&&#ev080_01_1_梨深七海ハイタッチ_a&&#ev081_01_3_判死_a&&#ev082_01_3_七海ゾンビ_a&&#ev083_01_3_優愛ディソード_a&&#ev084_01_3_ノアII_a&&#ev085_01_3_七海ディソード_a&&#ev086_01_6_梨深スポットライト膝抱え_a&&#ev087_01_3_拓巳ディソード_a&&#ev087_02_3_拓巳ディソード_a&&#ev088_01_4_葉月救いあれ_a&&#ev088_02_4_葉月救いあれ_a&&#ev089_01_1_あやせ瓦礫下_a&&#ev090_01_1_優愛瓦礫下_a&&#ev091_01_1_七海と将軍_a&&#ev092_01_1_拓巳振り返り_a){
			$GalleryList04=true;
		}else{
			//CreateText("テキスト４", 999999, 50, 200, 700, 500, "×チェック４");
		}

		if(#ev092_02_1_拓巳振り返り_a&&#ev092_03_1_拓巳振り返り_a&&#ev093_01_1_セナ父殺し_a&&#ev093_01_1_セナ父殺し_b&&#ev094_01_1_セナ父首はね_a&&#ev095_01_1_拓巳ダーツ逆転_a&&#ev096_01_1_星来大群_a&&#ev097_01_1_梨深はりつけ_a&&#ev097_02_1_梨深はりつけ_a&&#ev098_01_1_野呂瀬ディソード_a&&#ev099_01_1_梨深レイプ_a&&#ev100_06_1_６人祈る_a&&#ev101_01_1_拓巳大蛇_a&&#ev102_01_1_Ａエンド1_a&&#ev103_01_1_Ａエンド2_a&&#ev104_01_6_野呂瀬足_a&&#ev105_01_1_拓巳光と消える_a&&#ev105_02_1_拓巳光と消える_a&&#ev106_01_1_剣交え_a&&#ev107_01_1_梨深祈る_a&&#ev108_02_1_串刺し_a&&#ev110_01_3_セナ足_a&&#ev111_01_6_野呂瀬ラスト_a&&#ev112_01_3_梨深驚愕_a&&#ev113_01_2_梨深VS梢_a&&#ev114_01_6_梨深キス2_a&&#ev114_02_6_梨深キス2_a&&#ev115_01_6_梨深瀕死_a&&#ev115_02_6_梨深瀕死_a&&#ev115_03_6_梨深瀕死_a&&#ev115_04_6_梨深瀕死_a){
			$GalleryList05=true;
		}else{
			//CreateText("テキスト４", 999999, 50, 200, 700, 500, "×チェック５");
		}

		if(#ev116_01_6_梨深抱きつき_a&&#ev117_01_6_梨深殺せない_a&&#ev117_02_6_梨深殺せない_a&&#ev118_01_6_セナ密着_a&&#ev118_02_6_セナ密着_a&&#ev118_03_6_セナ密着_a&&#ev118_04_6_セナ密着_a&&#ev118_05_6_セナ密着_a&&#ev119_01_6_セナと赤ん坊_a&&#ev119_02_6_セナと赤ん坊_a&&#ev119_03_6_セナと赤ん坊_a&&#ev120_01_6_ノアⅡ破壊_a&&#ev120_02_6_ノアⅡ破壊_a&&#ev121_01_1_セナキス_a&&#ev122_01_1_セナ押し倒し_a&&#ev123_01_6_優愛押し倒し_a&&#ev124_01_6_優愛脱ぐ_a&&#ev125_01_3_優愛すがりつき_a&&#ev125_01_6_楠姉妹写真_a&&#ev126_01_5_優愛空見上げ_a&&#ev127_01_6_あやせキス_a&&#ev128_01_6_あやせしがみつき_a&&#ev128_02_6_あやせしがみつき_a&&#ev129_01_6_あやせ投擲_a&&#ev129_02_6_あやせ投擲_a&&#ev130_01_6_あやせ空見上げ_a&&#ev131_01_2_あやせ指なめ_a&&#ev131_02_2_あやせ指なめ_a&&#ev131_03_2_あやせ指なめ_a&&#ev132_01_2_あやせ殺害_a){
			$GalleryList06=true;
		}else{
			//CreateText("テキスト６", 999999, 50, 300, 700, 500, "×チェック６");
		}

		if(#ev132_01_2_あやせ殺害_b&&#ev133_01_6_梢ほのぼの_a&&#ev133_02_6_梢ほのぼの_a&&#ev133_03_6_梢ほのぼの_a&&#ev133_04_6_梢ほのぼの_a&&#ev134_01_1_梢うずくまり_a&&#ev134_02_1_梢うずくまり_a&&#ev135_01_1_セナVS梢_a&&#ev136_01_1_梢空見上げ_a&&#ev136_02_1_梢空見上げ_a&&#ev137_01_6_梢セナ空見上げ_a&&#ev138_01_1_梢ちんすこう_a&&#ev138_02_1_梢ちんすこう_a&&#ev138_03_1_梢ちんすこう_a&&#ev138_04_1_梢ちんすこう_a&&#ev139_01_3_七海うずくまり_a&&#ev139_02_3_七海うずくまり_a&&#ev140_01_6_七海同衾_a&&#ev140_02_6_七海同衾_a&&#ev140_03_6_七海同衾_a&&#ev141_01_1_七海キス_a&&#ev143_01_3_拓巳覚醒_a&&#ev143_02_3_拓巳覚醒_a&&#ev143_03_3_拓巳覚醒_a&&#ev144_01_1_拓巳ベッド_a&&#ev801_01_1_七海来訪_a&&#ev801_02_3_七海来訪_a&&#ev802_01_1_七海コーラ死_a&&#ev803_01_3_優愛遭遇_a&&#bg001_01_1_崩壊渋谷_a){
			$GalleryList07=true;
		}else{
			//CreateText("テキスト７", 999999, 50, 350, 700, 500, "×チェック７");
		}

		if(#bg001_02_5_崩壊渋谷_a&&#bg001_03_6_崩壊渋谷_a&&#bg004_01_1_作文用紙その目_a&&#bg006_01_1_コンテナ外観_a&&#bg006_01_2_コンテナ外観_a&&#bg006_01_3_コンテナ外観_a&&#bg009_02_1_107_a&&#bg009_02_2_107_a&&#bg009_02_3_107_a&&#bg009_03_5_107_a&&#bg011_01_1_検索欄UP_a&&#bg012_01_1_ニュースサイト_a&&#bg012_02_1_ニュースサイト_a&&#bg015_01_0_松濤公園_a&&#bg015_01_2_松濤公園_a&&#bg015_01_3_松濤公園_a&&#bg022_01_0_黒板その目_a&&#bg026_02_3_拓巳部屋_a&&#bg027_01_3_道玄坂_a&&#bg027_02_2_chn道玄坂_a&&#bg027_04_3_道玄坂_a&&#bg037_01_2_焼却炉中_a&&#bg040_01_2_優愛カバン_a&&#bg041_01_2_優愛カバンぶちまけ_a&&#bg065_01_2_ゲロカエルン店店内_a&&#bg083_01_1_宮下公園_a&&#bg083_01_3_宮下公園_a&&#bg083_02_3_宮下公園_a&&#bg083_03_1_宮下公園_a&&#bg085_04_3_スクランブル交差点_a&&#bg117_01_3_PC画面ニュージェネ_a){
			$GalleryList08=true;
		}else{
			//CreateText("テキスト８", 999999, 50, 400, 700, 500, "×チェック８");
		}

		if(#bg120_01_3_PC画面その目_a&&#bg125_01_3_PC画面ファンタズム公式_a&&#bg127_01_2_ギョロリゲロカエルん_a&&#bg128_01_3_ネットオークション_a&&#bg134_01_1_武器コーナー_a&&#bg141_01_3_PC画面del検索結果_a&&#bg142_01_3_ミュウツベ集団ダイブ_a&&#bg143_01_1_生徒手帳_a&&#bg144_01_1_生徒手帳その目_a&&#bg147_01_2_ディソード想像_a&&#bg147_02_6_ディソード想像_a&&#bg151_01_1_デッドスポット_a&&#bg152_01_1_AH会HP_a&&#bg153_01_1_あやせの詩_a&&#bg154_01_1_渋谷の白い空_a&&#bg155_01_1_Ir2_a&&#bg158_03_1_ニュース地震_a&&#bg159_02_1_PC画面メールソフト_a&&#bg160_01_3_ダンボール箱_a&&#bg160_02_3_ダンボール箱_a&&#bg160_03_3_chnダンボール箱_a&&#bg165_01_3_OFRONT見上げ_a&&#bg165_02_3_OFRONT見上げ_a&&#bg165_03_3_OFRONT見上げ_a&&#bg171_01_3_カルテその目_a&&#bg180_01_1_アイスその目_a&&#bg181_01_3_捨てられたギョロリ_a){
			$GalleryList09=true;
		}else{
			//CreateText("テキスト９", 999999, 50, 450, 700, 500, "×チェック９");
		}

		if(#bg182_01_3_手描きのクマの絵_a&&#bg183_01_3_PC画面ZACO‐DQN_a&&#bg183_02_3_PC画面ZACO‐DQN_a&&#bg185_01_1_あやせ下着_a&&#bg186_01_1_たなびくタオル_a&&#bg186_02_1_たなびくタオル_a&&#bg197_01_3_渋谷駅東口とプラネタリウム_a&&#bg200_01_6_ノアIIのあるドーム内_a&&#bg202_01_1_希グループｗｅｂサイト_a&&#bg203_01_1_ゲロカエルん偽通販サイト_a&&#bg205_01_3_あやせディソードリアルブート_a&&#bg211_01_5_黄色いバングル_a&&#bg213_01_6_ニュースDQNパズル_a&&#bg213_01_6_chn渋谷駅コインロッカー_a&&#bg214_01_6_chn渋谷駅ロッカー閉じ_a&&#bg214_02_6_chn渋谷駅ロッカー開き_a&&#bg224_01_6_chnグラジオール文庫本_a&&#bg234_01_6_chnビーズコレクション_a&&#bg236_01_6_chn美愛の日記_a&&#bg236_02_6_chn美愛の日記内容_a&&#bg239_01_6_chnディソード全体_拓巳_a&&#bg240_01_6_chnディソード全体_梨深_a&&#bg241_01_6_chnディソード全体_七海_a){
			$GalleryList10=true;
		}else{
			//CreateText("テキスト１０", 999999, 50, 500, 700, 500, "×チェック１０");
		}

		if(#bg242_01_6_chnディソード全体_あやせ_a&&#bg243_01_6_chnディソード全体_セナ_a&&#bg244_01_6_chnディソード全体_梢_a&&#bg245_01_6_chnディソード全体_優愛_a&&#ev046_01_1_妊娠男現場写真_a&&#ev047_01_1_張り付け死体現場写真_a&&#ev048_01_1_張り付けグロ絵アップ_a&&#ev049_01_1_ヴァンパイ屋現場写真_a&&#ev051_01_3_清掃員_a&&#ev053_01_1_集団ダイブ現場写真_a&&#ev061_01_2_ニュージェネ犯人逮捕TV_a&&#ev074_01_1_洗脳部隊inモニター_a&&#ev142_01_1_七海その目誰の目_a){
			$GalleryList11=true;
		}else{
			//CreateText("テキスト１１", 999999, 50, 550, 700, 500, "×チェック１１");
		}


		if($GalleryList01&&$GalleryList02&&$GalleryList03&&$GalleryList04&&$GalleryList05&&$GalleryList06&&$GalleryList07&&$GalleryList08&&$GalleryList09&&$GalleryList10&&$GalleryList11)
		{
			//★★★★アンロック
			XBOX360_LockVideo(false);

			CreateBGM360("CH08");
			SoundPlay("CH08",0,1000,true);

			CreateColor("おめでとう色", 150, 0, 0, 1280, 720, "White");
			Fade("おめでとう色", 0, 0, null, true);
			Request("おめでとう色", AddRender);
	
			Fade("おめでとう色", 2000, 1000, null, true);
			CreateTexture("おめでとう", 100, 0, middle, "cg/ev/ev999_01_1_おめでとう.jpg");
			Fade("おめでとう色", 1000, 0, null, true);

			//■ゲーマーズアイコン追加
			XBOX360_AwardGameIcon();

			WaitKey();
	
			#ClearAll=true;
	
			SetVolume360("CH08", 4000, 0, NULL);
	
			Fade("おめでとう",4000,0,null,true);
			Delete("おめでとう*");

			//○実績No.27：ＣＧコンプリート
			XBOX360_Achieved(27);

			//★★★★ロック
			XBOX360_LockVideo(true);
		}
	}
}
//============================================================================//


//============================================================================//
..//■青空判定■
//============================================================================//
function TitleBlueSky()
{
	if(#ClearFinal){
		$FirstBlue=false;//青空初見のみ
		if($ClearL&&!#ClearLast){
			$FirstBlue=true;
			#ClearLast=true;//一度見たら二度と見れない変数
		}
	}
}
//============================================================================//


//============================================================================//
..//■ロゴ判定■
//============================================================================//
function TitleLogo()
{
//★：一度観たらゲーム中は出さないようにする判定

	if(!$Logo)
	{
//		CreateTexture("タイトルメディア１", 100, 0, 0, "cg/sys/title/media_a.jpg");
//		CreateTexture("タイトルメディア２", 100, 0, 0, "cg/sys/title/media_b.jpg");

		//★★★★ロック
		XBOX360_LockVideo(true);
		CreateTexture("タイトルニトロプラス", 100, 0, 0, "cg/sys/title/boot_nitroplus.jpg");
		SetAlias("タイトルニトロプラス", "タイトルニトロプラス");
		CreateTexture("タイトル5pb", 100, 0, 0, "cg/sys/title/boot_5gk.jpg");
		SetAlias("タイトル5pb", "タイトル5pb");
		CreateTexture("タイトルADX", 100, 0, 0, "cg/sys/title/criware1280x720sb.jpg");
		SetAlias("タイトルADX", "タイトルADX");
		CreateTexture("タイトル注意事項", 100, 0, 0, "cg/sys/title/attention.jpg");
		SetAlias("タイトル注意事項", "タイトル注意事項");
		Fade("タイトル*", 0, 0, null, true);

		CreateProcess("ロゴプロセス１", 150, 0, 0, "LogoProcess1");
		CreateProcess("ロゴプロセス２", 150, 0, 0, "LogoProcess2");
		CreateProcess("ロゴプロセス３", 150, 0, 0, "LogoProcess3");
		CreateProcess("ロゴプロセス４", 150, 0, 0, "LogoProcess4");
		$LogoCount1=false;
		$LogoCount2=false;
		$LogoCount3=false;
		$LogoCount4=false;
		//★★★★アンロック
		XBOX360_LockVideo(false);

//		Fade("タイトルメディア１", 500, 1000, null, true);
//		WaitKey(2000);
//		Fade("タイトルメディア２", 500, 1000, null, true);
//		Fade("タイトルメディア１", 0, 0, null, true);
//		WaitKey(2000);
//		Fade("タイトルメディア２",500,0,null,true);
//		Wait(500);
//		WaitKey(1000);

		//●５ＰＢ
		Fade("タイトル5pb", 200, 1000, null, true);
		Request("ロゴプロセス１", Start);
		$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;
		if(Platform()==100){
			while(1){
				if($SYSTEM_XBOX360_button_start_down){break;}
				if($SYSTEM_XBOX360_button_a_down){break;}
				if($LogoCount1){break;}
				Wait(100);
			}
		}else{
			WaitKey(2000);
		}
		$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;
		Request("ロゴプロセス１", Stop);
		Fade("タイトル5pb", 0, 0, null, true);

		//●ニトロ
		Fade("タイトルニトロプラス", 200, 1000, null, true);
		Request("ロゴプロセス２", Start);
		$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;
		if(Platform()==100){
			while(1){
				if($SYSTEM_XBOX360_button_start_down){break;}
				if($SYSTEM_XBOX360_button_a_down){break;}
				if($LogoCount2){break;}
				Wait(100);
			}
		}else{
			WaitKey(2000);
		}
		$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;
		Request("ロゴプロセス２", Stop);
		Fade("タイトルニトロプラス", 0, 0, null, true);

		//●ＡＤＸ
		Fade("タイトルADX", 200, 1000, null, true);
		Request("ロゴプロセス３", Start);
		$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;
		if(Platform()==100){
			while(1){
				if($SYSTEM_XBOX360_button_start_down){break;}
				if($SYSTEM_XBOX360_button_a_down){break;}
				if($LogoCount3){break;}
				Wait(100);
			}
		}else{
			WaitKey(2000);
		}
		$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;
		Request("ロゴプロセス３", Stop);
		Fade("タイトルADX", 0, 0, null, true);

		Wait(200);

		CreateSE("タイトル前サウンド１","SE_日常_PC_はーどでぃすく_LOOP");
		SoundPlay("タイトル前サウンド１",0,1000,true);

		//●注意
		Fade("タイトル注意事項", 400, 1000, null, true);
		Request("ロゴプロセス４", Start);
		$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;
		if(Platform()==100){
			while(1){
				if($SYSTEM_XBOX360_button_start_down){break;}
				if($SYSTEM_XBOX360_button_a_down){break;}
				if($LogoCount4){break;}
				Wait(100);
			}
		}else{
			WaitKey(2000);
		}
		$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;
		Request("ロゴプロセス４", Stop);
		CreateSE("タイトル前サウンド２","SE_日常_PC_マウスくりっく");
		SoundPlay("タイトル前サウンド２",0,1000,false);
		SetVolume("タイトル前サウンド１", 100, 0, NULL);

		Fade("タイトル注意事項", 1, 0, null, true);

		Delete("タイトルニトロプラス");
		Delete("タイトル5pb");
		Delete("タイトルadx");
		Delete("タイトル注意事項");
		Delete("ロゴプロセス*");
	}

	//★★★★ロック
	XBOX360_LockVideo(true);

	$Logo=true;
	//TitleMem();
	TitleSound();

	//★★★★アンロック
	XBOX360_LockVideo(false);

}
//=============================================================================//


//============================================================================//
..//■タイトルメモリ■
//============================================================================//
function TitleMem()
{
	//★対策「ロードオンメモリ」
	if(!$ExtraTitle){
		if(Platform()==100){
			if(!$PressKey){
				//何もしない
			}else if(#ClearFinal){
				StartLoad_common();
				StartLoad_sky();
			}else{
				StartLoad_common();
				StartLoad_normal();
			}
		}
	}
}

function TitleMemFirst()
{
	StartLoad_common();
	StartLoad_normal();
	StartLoad_sky();
	MenuLoad();
}

function TitleMemPro()
{
	if(#ClearFinal){
		StartLoad_common();
		StartLoad_sky();
	}else{
		StartLoad_common();
		StartLoad_normal();
	}
}

//=============================================================================//


//============================================================================//
..//■音■
//============================================================================//
function TitleSound()
{
	if($ExtraTitle)
	{
		if($エキストラＢＧＭ != "@CH01")
		{
			//★ＢＧＭプレイ
			SetVolume360("CH*", 1000, 0, NULL);
			SetVolume360("chn*", 1000, 0, NULL);

			if(#ClearFinal){
//				CreateBGM360("chn04");
//				SoundPlay("chn04",0,1000,true);
			}else{
				CreateBGM360("CH01");
				SoundPlay("CH01",3000,1000,true);
			}
		}
		$ExtraTitle=false;
	}else if(#ClearFinal&&!$FirstBlue&&$PressKey){
		//★ＢＧＭプレイ
//		CreateBGM360("chn04");
//		SoundPlay("chn04",0,1000,true);
	}else{
		//★ＢＧＭプレイ
		CreateBGM360("CH01");
		SoundPlay("CH01",0,1000,true);
	}

}



//=============================================================================//
..//■タイトル定義■
//=============================================================================//
function TitleSet()
{
	//■サインイン
	if(!$PressKey){
		//★★★★ロック
		XBOX360_LockVideo(true);

		if(#LOCAL_sys_platform==100){
			CreateProcess("タイトルメモリー", 1, 0, 0, "TitleMemFirst");
		}

		//★起動時
		LoadImage("タイトルイメージ１", "cg/sys/title/title-normal/Title-logo.png");
		LoadImage("タイトルイメージ２", "cg/sys/title/title-normal/Title-back.png");
		LoadImage("タイトルイメージボタン", "cg/sys/title/button.png");
		LoadImage("タイトルイメージ著作", "cg/sys/title/title-normal/Title-logo2.png");

		//▼背景とかロゴとか
		CreateTexture("タイトル背景", 100, center, middle, "タイトルイメージ２");
		SetAlias("タイトル背景", "タイトル背景");
		CreateTexture("タイトル背景２", 100, center, middle, "タイトルイメージ２");
		SetAlias("タイトル背景２", "タイトル背景２");
		CreateTexture("タイトルボタン", 100, center, 480, "タイトルイメージボタン");
		SetAlias("タイトルボタン", "タイトルボタン");
	
		CreateTexture("タイトルロゴ１", 500, 420, 248, "タイトルイメージ１");
		SetAlias("タイトルロゴ１", "タイトルロゴ１");
		CreateTexture("タイトルロゴ２", 500, 420, 248, "タイトルイメージ１");
		SetAlias("タイトルロゴ２", "タイトルロゴ２");
	
		CreateTexture("タイトル著作", 500, 366, 526, "タイトルイメージ著作");
		SetAlias("タイトル著作", "タイトル著作");

		Fade("タイトル*",0,0,null,false);
		Fade("タイトル*/*",0,0,null,false);
		Fade("タイトル*/*/*",0,0,null,true);

		//▼起動時の動作
		Move("タイトルロゴ１", 0, @0, @-50, null, true);
		Move("タイトルロゴ２", 0, @0, @20, null, true);

		//★★★★アンロック
		XBOX360_LockVideo(false);

		if(#LOCAL_sys_platform==100){
			Request("タイトルメモリー", Start);
		}

		Fade("タイトル背景",100,1000,null,false);
		DrawTransition("タイトル背景", 5000, 0, 1000, 100, null, "cg/data/モザイク.png", 2000);

		Move("タイトルロゴ１", 3000, @0, @50, Dxl1, false);
		Move("タイトルロゴ２", 3000, @0, @-50, Dxl1, false);
		Fade("タイトルロゴ１",3000,1000,null,false);
		Fade("タイトルロゴ２",3000,1000,null,2000);

		Fade("タイトルロゴ２",500,0,null,false);
		Fade("タイトル著作",1000,1000,null,true);

		//★サインイン
		SignIN();

		if(Platform()==100){
			if(#ClearFinal){
			//	StartLoad_sky();
			}else{
			//	StartLoad_normal();
			}
			WaitAction("タイトルメモリー", null);
		}
	}

	//■青空初見
	if(#ClearFinal&&$FirstBlue){
		Fade("タイトルロゴ*", 300, 0, null, false);
		Fade("タイトル著作", 300, 0, null, true);

		if($PressKey){
			//★★★★ロック
			XBOX360_LockVideo(true);

			LoadImage("タイトルイメージ２", "cg/sys/title/title-normal/Title-back.png");

			CreateTexture("タイトル背景", 100, center, middle, "タイトルイメージ２");
			SetAlias("タイトル背景", "タイトル背景");
			CreateTexture("タイトル背景２", 100, center, middle, "タイトルイメージ２");
			SetAlias("タイトル背景２", "タイトル背景２");

			Fade("タイトル背景*",0,0,null,true);

			//★★★★アンロック
			XBOX360_LockVideo(false);

			DrawTransition("タイトル背景", 5000, 0, 1000, 100, null, "cg/data/モザイク.png", false);
			Fade("タイトル背景",0,1000,null,false);

			Wait(5000);
		}

		//▼定義
		//★★★★ロック
		XBOX360_LockVideo(true);

		LoadImage("タイトルイメージ３", "cg/sys/title/title-normal/synapse.png");

		CreateTexture("タイトル背景３", 100, center, middle, "タイトルイメージ３");
		SetAlias("タイトル背景３", "タイトル背景３");
		CreateTexture("タイトル背景４", 100, center, middle, "タイトルイメージ３");
		SetAlias("タイトル背景４", "タイトル背景４");
		Request("タイトル背景４", AddRender);

		Request("タイトル背景２", AddRender);

		if(Platform()==101){
			CreateTexture("タイトル背景２Ａ", 100, center, middle, "タイトルイメージ２");
			SetAlias("タイトル背景２Ａ", "タイトル背景２Ａ");
			Request("タイトル背景２Ａ", AddRender);
			CreateTexture("タイトル背景２Ｂ", 100, center, middle, "タイトルイメージ２");
			SetAlias("タイトル背景２Ｂ", "タイトル背景２Ｂ");
			Request("タイトル背景２Ｂ", AddRender);
			CreateTexture("タイトル背景２Ｃ", 100, center, middle, "タイトルイメージ２");
			SetAlias("タイトル背景２Ｃ", "タイトル背景２ＡＣ");
			Request("タイトル背景２Ｃ", AddRender);
		}else{
			SetBlur("タイトル背景２", true, 3, 500, 200, true);
		}

		$TitleMaskMoveX=-(1280*1.5);
		$TitleMaskMoveY=-(720*1.5);
		CreateMask("タイトルマスク", 400, 1280, 720, "cg/sys/title/title.png", false);
		SetAlias("タイトルマスク", "タイトルマスク");
		CreateTexture("タイトルマスク/タイトルフラッシュ", 400, center, middle, "タイトルイメージ３");
		Request("タイトルマスク/タイトルフラッシュ", AddRender);
		SetAlias("タイトルマスク/タイトルフラッシュ", "タイトルフラッシュ");
	
		CreateColor("色", 1000, 0, 0, 1280, 720, "WHITE");
		Request("色", AddRender);
		Fade("色", 0, 0, null, true);

		CreateProcess("タイトル終空プロセス１", 100, 0, 0, "Flashsky1");

		Fade("タイトル*/*", 0, 0, null, false);
		Fade("タイトル*", 0, 0, null, false);
		Fade("タイトル背景", 0, 1000, null, true);
		Fade("タイトルマスク", 0, 1000, null, true);

		CreateSound("サウンド１", SE, "sound/se/SE_擬音_ディそーど出現");
		CreateSound("サウンド２", SE, "sound/se/SE_衝撃_衝撃は_リアルぶーと");

		//★★★★アンロック
		XBOX360_LockVideo(false);

		//▼動作
		Request("サウンド１", Play);
		Wait(500);
		Request("タイトル終空プロセス１", Start);
		Fade("タイトル背景３", 500, 1000, null, false);
		Fade("タイトル背景２", 3000, 1000, Axl3, false);
		Fade("タイトル背景４", 3000, 1000, Axl3, false);
		Fade("色", 3000, 1000, Axl3, false);
		if(Platform()==101){
			Fade("タイトル背景２Ａ", 3000, 500, Axl3, false);
			Fade("タイトル背景２Ｂ", 3000, 500, Axl3, false);
			Fade("タイトル背景２Ｃ", 3000, 500, Axl3, false);
			Zoom("タイトル背景２Ａ", 4600, 1300, 1300, Axl3, false);
			Zoom("タイトル背景２Ｂ", 4400, 1300, 1300, Axl3, false);
			Zoom("タイトル背景２Ｃ", 4200, 1300, 1300, Axl3, false);
		}
		Zoom("タイトル背景２", 4000, 1300, 1300, Axl3, false);
		Zoom("タイトル背景４", 4000, 1300, 1300, Axl3, 500);
		Request("サウンド２", Play);

		Wait(500);
		if(Platform()==101){
			FadeFF4("タイトル背景２",1000,1000,2300,0,0,Axl3, false);
			FadeFF4("タイトル背景２Ａ",1000,1000,2900,0,0,Axl3, false);
			FadeFF4("タイトル背景２Ｂ",1000,1000,2700,0,0,Axl3, false);
			FadeFF4("タイトル背景２Ｃ",1000,1000,2500,0,0,Axl3, false);
		}else{
			FadeFF4("タイトル背景２",1000,1000,2000,0,0,Axl3, false);
		}
		Wait(3000);


		Request("タイトル終空プロセス１", Stop);
		Request("サウンド１", Disused);
		Request("サウンド２", Disused);
		Delete("タイトル背景*");
		Delete("タイトル終空プロセス１");
	}

	//★ＴＣＲ対策
	//LoadingStart();
	//★★★★ロック
	XBOX360_LockVideo(true);

	if($PressKey){
		WaitAction("タイトルメモリプロセス", null);
	}

	//■通常定義
	//▼通常時の青空
	if(#ClearFinal){
		LoadImage("TitleImageStart0", "cg/sys/title/title-sky/Title-start-000.png");
		LoadImage("TitleImageStart1", "cg/sys/title/title-sky/Title-start-001.png");
		LoadImage("TitleImageStart2", "cg/sys/title/title-sky/Title-start-002.png");
		LoadImage("TitleImageStart3", "cg/sys/title/title-sky/Title-start-003.png");
		LoadImage("TitleImageStartAnime1", "cg/sys/title/title-sky/title-anime/start-001.png");
		LoadImage("TitleImageStartAnime2", "cg/sys/title/title-sky/title-anime/start-002.png");
		LoadImage("TitleImageStartAnime3", "cg/sys/title/title-sky/title-anime/start-003.png");
		LoadImage("TitleImageStartAnime4", "cg/sys/title/title-sky/title-anime/start-004.png");
		LoadImage("TitleImageStartAnime5", "cg/sys/title/title-sky/title-anime/start-005.png");
		LoadImage("TitleImageStartAnime6", "cg/sys/title/title-sky/title-anime/start-006.png");
		LoadImage("TitleImageStartAnime7", "cg/sys/title/title-sky/title-anime/start-007.png");
		LoadImage("TitleImageStartAnime8", "cg/sys/title/title-sky/title-anime/start-008.png");
		LoadImage("TitleImageStartAnime9", "cg/sys/title/title-sky/title-anime/start-009.png");

		LoadImage("TitleImageLoad0", "cg/sys/title/title-sky/Title-continue-000.png");
		LoadImage("TitleImageLoad1", "cg/sys/title/title-sky/Title-continue-001.png");
		LoadImage("TitleImageLoad1a", "cg/sys/title/title-sky/Title-continue-001a.png");
		LoadImage("TitleImageLoad1b", "cg/sys/title/title-sky/Title-continue-001b.png");
		LoadImage("TitleImageLoad2", "cg/sys/title/title-sky/Title-continue-002.png");
		LoadImage("TitleImageLoad2a", "cg/sys/title/title-sky/Title-continue-002a.png");
		LoadImage("TitleImageLoad2b", "cg/sys/title/title-sky/Title-continue-002b.png");
		LoadImage("TitleImageLoadAnime1", "cg/sys/title/title-sky/title-anime/cont-001.png");
		LoadImage("TitleImageLoadAnime2", "cg/sys/title/title-sky/title-anime/cont-002.png");
		LoadImage("TitleImageLoadAnime3", "cg/sys/title/title-sky/title-anime/cont-003.png");
		LoadImage("TitleImageLoadAnime4", "cg/sys/title/title-sky/title-anime/cont-004.png");
		LoadImage("TitleImageLoadAnime5", "cg/sys/title/title-sky/title-anime/cont-005.png");
		LoadImage("TitleImageLoadAnime6", "cg/sys/title/title-sky/title-anime/cont-006.png");
		LoadImage("TitleImageLoadAnime7", "cg/sys/title/title-sky/title-anime/cont-007.png");
		LoadImage("TitleImageLoadAnime8", "cg/sys/title/title-sky/title-anime/cont-008.png");
		LoadImage("TitleImageLoadAnime9", "cg/sys/title/title-sky/title-anime/cont-009.png");

		LoadImage("TitleImageConfig0", "cg/sys/title/title-sky/Title-config-000.png");
		LoadImage("TitleImageConfig1", "cg/sys/title/title-sky/Title-config-001.png");
		LoadImage("TitleImageConfig2", "cg/sys/title/title-sky/Title-config-002.png");
		LoadImage("TitleImageConfig3", "cg/sys/title/title-sky/Title-config-003.png");
		LoadImage("TitleImageConfigAnime1", "cg/sys/title/title-sky/title-anime/config-001.png");
		LoadImage("TitleImageConfigAnime2", "cg/sys/title/title-sky/title-anime/config-002.png");
		LoadImage("TitleImageConfigAnime3", "cg/sys/title/title-sky/title-anime/config-003.png");
		LoadImage("TitleImageConfigAnime4", "cg/sys/title/title-sky/title-anime/config-004.png");
		LoadImage("TitleImageConfigAnime5", "cg/sys/title/title-sky/title-anime/config-005.png");
		LoadImage("TitleImageConfigAnime6", "cg/sys/title/title-sky/title-anime/config-006.png");
		LoadImage("TitleImageConfigAnime7", "cg/sys/title/title-sky/title-anime/config-007.png");
		LoadImage("TitleImageConfigAnime8", "cg/sys/title/title-sky/title-anime/config-008.png");
		LoadImage("TitleImageConfigAnime9", "cg/sys/title/title-sky/title-anime/config-009.png");

		LoadImage("TitleImageExtra0", "cg/sys/title/title-sky/Title-extra-000.png");
		LoadImage("TitleImageExtra1", "cg/sys/title/title-sky/Title-extra-001.png");
		LoadImage("TitleImageExtra2", "cg/sys/title/title-sky/Title-extra-002.png");
		LoadImage("TitleImageExtra3", "cg/sys/title/title-sky/Title-extra-003.png");
		LoadImage("TitleImageExtraAnime1", "cg/sys/title/title-sky/title-anime/extra-001.png");
		LoadImage("TitleImageExtraAnime2", "cg/sys/title/title-sky/title-anime/extra-002.png");
		LoadImage("TitleImageExtraAnime3", "cg/sys/title/title-sky/title-anime/extra-003.png");
		LoadImage("TitleImageExtraAnime4", "cg/sys/title/title-sky/title-anime/extra-004.png");
		LoadImage("TitleImageExtraAnime5", "cg/sys/title/title-sky/title-anime/extra-005.png");
		LoadImage("TitleImageExtraAnime6", "cg/sys/title/title-sky/title-anime/extra-006.png");
		LoadImage("TitleImageExtraAnime7", "cg/sys/title/title-sky/title-anime/extra-007.png");
		LoadImage("TitleImageExtraAnime8", "cg/sys/title/title-sky/title-anime/extra-008.png");
		LoadImage("TitleImageExtraAnime9", "cg/sys/title/title-sky/title-anime/extra-009.png");

		LoadImage("TitleImageDoor0", "cg/sys/title/title-sky/Title-caution-000.png");
		LoadImage("TitleImageDoor1", "cg/sys/title/title-sky/Title-caution-001.png");
		LoadImage("TitleImageDoor2", "cg/sys/title/title-sky/Title-caution-002.png");
		LoadImage("TitleImageDoor3", "cg/sys/title/title-sky/Title-caution-003.png");
		LoadImage("TitleImageDoorAnime1", "cg/sys/title/title-sky/title-anime/config-001.png");
		LoadImage("TitleImageDoorAnime2", "cg/sys/title/title-sky/title-anime/config-002.png");
		LoadImage("TitleImageDoorAnime3", "cg/sys/title/title-sky/title-anime/config-003.png");
		LoadImage("TitleImageDoorAnime4", "cg/sys/title/title-sky/title-anime/config-004.png");
		LoadImage("TitleImageDoorAnime5", "cg/sys/title/title-sky/title-anime/config-005.png");
		LoadImage("TitleImageDoorAnime6", "cg/sys/title/title-sky/title-anime/config-006.png");
		LoadImage("TitleImageDoorAnime7", "cg/sys/title/title-sky/title-anime/config-007.png");
		LoadImage("TitleImageDoorAnime8", "cg/sys/title/title-sky/title-anime/config-008.png");
		LoadImage("TitleImageDoorAnime9", "cg/sys/title/title-sky/title-anime/config-009.png");

		LoadImage("TitleImageList1", "cg/sys/title/title-sky/down-menu/CHAPTERLIST-001.png");
		LoadImage("TitleImageList2", "cg/sys/title/title-sky/down-menu/CHAPTERLIST-002.png");
		LoadImage("TitleImageLast1", "cg/sys/title/title-sky/down-menu/LASTSAVE-001.png");
		LoadImage("TitleImageLast2", "cg/sys/title/title-sky/down-menu/LASTSAVE-002.png");
		LoadImage("TitleImageLast3", "cg/sys/title/title-sky/down-menu/LASTSAVE-003.png");
		LoadImage("TitleImageBook1", "cg/sys/title/title-sky/down-menu/LOADGAME-001.png");
		LoadImage("TitleImageBook2", "cg/sys/title/title-sky/down-menu/LOADGAME-002.png");
		LoadImage("TitleImageBook3", "cg/sys/title/title-sky/down-menu/LOADGAME-003.png");


		LoadImage("TitleImageWindow", "cg/sys/title/title-sky/menu-window.png");
		LoadImage("TitleImageBar", "cg/sys/title/title-sky/down-menu/000-チャプター選択表示時バー.png");
		LoadImage("TitleImageChapter01_1", "cg/sys/title/title-sky/down-menu/001-チャプター001.png");
		LoadImage("TitleImageChapter01_2", "cg/sys/title/title-sky/down-menu/001-チャプター002.png");
		LoadImage("TitleImageChapter01_3", "cg/sys/title/title-sky/down-menu/001-チャプター003.png");
		LoadImage("TitleImageChapter02_1", "cg/sys/title/title-sky/down-menu/002-チャプター001.png");
		LoadImage("TitleImageChapter02_2", "cg/sys/title/title-sky/down-menu/002-チャプター002.png");
		LoadImage("TitleImageChapter02_3", "cg/sys/title/title-sky/down-menu/002-チャプター003.png");
		LoadImage("TitleImageChapter03_1", "cg/sys/title/title-sky/down-menu/003-チャプター001.png");
		LoadImage("TitleImageChapter03_2", "cg/sys/title/title-sky/down-menu/003-チャプター002.png");
		LoadImage("TitleImageChapter03_3", "cg/sys/title/title-sky/down-menu/003-チャプター003.png");
		LoadImage("TitleImageChapter04_1", "cg/sys/title/title-sky/down-menu/004-チャプター001.png");
		LoadImage("TitleImageChapter04_2", "cg/sys/title/title-sky/down-menu/004-チャプター002.png");
		LoadImage("TitleImageChapter04_3", "cg/sys/title/title-sky/down-menu/004-チャプター003.png");
		LoadImage("TitleImageChapter05_1", "cg/sys/title/title-sky/down-menu/005-チャプター001.png");
		LoadImage("TitleImageChapter05_2", "cg/sys/title/title-sky/down-menu/005-チャプター002.png");
		LoadImage("TitleImageChapter05_3", "cg/sys/title/title-sky/down-menu/005-チャプター003.png");
		LoadImage("TitleImageChapter06_1", "cg/sys/title/title-sky/down-menu/006-チャプター001.png");
		LoadImage("TitleImageChapter06_2", "cg/sys/title/title-sky/down-menu/006-チャプター002.png");
		LoadImage("TitleImageChapter06_3", "cg/sys/title/title-sky/down-menu/006-チャプター003.png");
		LoadImage("TitleImageChapter07_1", "cg/sys/title/title-sky/down-menu/007-チャプター001.png");
		LoadImage("TitleImageChapter07_2", "cg/sys/title/title-sky/down-menu/007-チャプター002.png");
		LoadImage("TitleImageChapter07_3", "cg/sys/title/title-sky/down-menu/007-チャプター003.png");
		LoadImage("TitleImageChapter08_1", "cg/sys/title/title-sky/down-menu/008-チャプター001.png");
		LoadImage("TitleImageChapter08_2", "cg/sys/title/title-sky/down-menu/008-チャプター002.png");
		LoadImage("TitleImageChapter08_3", "cg/sys/title/title-sky/down-menu/008-チャプター003.png");
		LoadImage("TitleImageChapter09_1", "cg/sys/title/title-sky/down-menu/009-チャプター001.png");
		LoadImage("TitleImageChapter09_2", "cg/sys/title/title-sky/down-menu/009-チャプター002.png");
		LoadImage("TitleImageChapter09_3", "cg/sys/title/title-sky/down-menu/009-チャプター003.png");
		LoadImage("TitleImageChapter10_1", "cg/sys/title/title-sky/down-menu/010-チャプター001.png");
		LoadImage("TitleImageChapter10_2", "cg/sys/title/title-sky/down-menu/010-チャプター002.png");
		LoadImage("TitleImageChapter10_3", "cg/sys/title/title-sky/down-menu/010-チャプター003.png");
		LoadImage("TitleImageChapter11_1", "cg/sys/title/title-sky/down-menu/011-チャプター001.png");
		LoadImage("TitleImageChapter11_2", "cg/sys/title/title-sky/down-menu/011-チャプター002.png");
		LoadImage("TitleImageChapter11_3", "cg/sys/title/title-sky/down-menu/011-チャプター003.png");
		LoadImage("TitleImageChapter12_1", "cg/sys/title/title-sky/down-menu/012-チャプター001.png");
		LoadImage("TitleImageChapter12_2", "cg/sys/title/title-sky/down-menu/012-チャプター002.png");
		LoadImage("TitleImageChapter12_3", "cg/sys/title/title-sky/down-menu/012-チャプター003.png");
		LoadImage("TitleImageChapter13_1", "cg/sys/title/title-sky/down-menu/013-チャプター001.png");
		LoadImage("TitleImageChapter13_2", "cg/sys/title/title-sky/down-menu/013-チャプター002.png");
		LoadImage("TitleImageChapter13_3", "cg/sys/title/title-sky/down-menu/013-チャプター003.png");
		LoadImage("TitleImageChapter14_1", "cg/sys/title/title-sky/down-menu/014-チャプター001.png");
		LoadImage("TitleImageChapter14_2", "cg/sys/title/title-sky/down-menu/014-チャプター002.png");
		LoadImage("TitleImageChapter14_3", "cg/sys/title/title-sky/down-menu/014-チャプター003.png");
		LoadImage("TitleImageChapter15_1", "cg/sys/title/title-sky/down-menu/015-チャプター001.png");
		LoadImage("TitleImageChapter15_2", "cg/sys/title/title-sky/down-menu/015-チャプター002.png");
		LoadImage("TitleImageChapter15_3", "cg/sys/title/title-sky/down-menu/015-チャプター003.png");
		LoadImage("TitleImageChapter16_1", "cg/sys/title/title-sky/down-menu/016-チャプター001.png");
		LoadImage("TitleImageChapter16_2", "cg/sys/title/title-sky/down-menu/016-チャプター002.png");
		LoadImage("TitleImageChapter16_3", "cg/sys/title/title-sky/down-menu/016-チャプター003.png");
		LoadImage("TitleImageChapter17_1", "cg/sys/title/title-sky/down-menu/017-チャプター001.png");
		LoadImage("TitleImageChapter17_2", "cg/sys/title/title-sky/down-menu/017-チャプター002.png");
		LoadImage("TitleImageChapter17_3", "cg/sys/title/title-sky/down-menu/017-チャプター003.png");
		LoadImage("TitleImageChapter18_1", "cg/sys/title/title-sky/down-menu/018-チャプター001.png");
		LoadImage("TitleImageChapter18_2", "cg/sys/title/title-sky/down-menu/018-チャプター002.png");
		LoadImage("TitleImageChapter18_3", "cg/sys/title/title-sky/down-menu/018-チャプター003.png");



		if(!$PressKey&&!(#ClearFinal&&$FirstBlue)){
			//★★★★アンロック
			XBOX360_LockVideo(false);

			Fade("タイトルロゴ*", 300, 0, null, false);
			Fade("タイトル著作", 300, 0, null, true);

			//★★★★ロック
			XBOX360_LockVideo(true);

			CreateTexture("タイトルブルー１", 100, center, middle, SCREEN);
			CreateTexture("タイトルブルー２", 100, center, middle, SCREEN);
		}

		LoadImage("タイトルイメージ１", "cg/sys/title/title-sky/Title-logo.png");
		LoadImage("タイトルイメージ２", "cg/sys/title/title-sky/Title-back.png");
		LoadImage("タイトルイメージ著作", "cg/sys/title/title-sky/Title-logo2.png");

		LoadImage("タイトルイメージ３", "cg/sys/title/title-sky/synapse.png");

	}else{
	//▼ノーマル
		if($PressKey){
			LoadImage("タイトルイメージ１", "cg/sys/title/title-normal/Title-logo.png");
			LoadImage("タイトルイメージ２", "cg/sys/title/title-normal/Title-back.png");
			LoadImage("タイトルイメージ著作", "cg/sys/title/title-normal/Title-logo2.png");
		}

		LoadImage("タイトルイメージ３", "cg/sys/title/title-normal/synapse.png");

		LoadImage("TitleImageStart0", "cg/sys/title/title-normal/Title-start-000.png");
		LoadImage("TitleImageStart1", "cg/sys/title/title-normal/Title-start-001.png");
		LoadImage("TitleImageStart2", "cg/sys/title/title-normal/Title-start-002.png");
		LoadImage("TitleImageStart3", "cg/sys/title/title-normal/Title-start-003.png");
		LoadImage("TitleImageStartAnime1", "cg/sys/title/title-normal/title-anime/start-001.png");
		LoadImage("TitleImageStartAnime2", "cg/sys/title/title-normal/title-anime/start-002.png");
		LoadImage("TitleImageStartAnime3", "cg/sys/title/title-normal/title-anime/start-003.png");
		LoadImage("TitleImageStartAnime4", "cg/sys/title/title-normal/title-anime/start-004.png");
		LoadImage("TitleImageStartAnime5", "cg/sys/title/title-normal/title-anime/start-005.png");
		LoadImage("TitleImageStartAnime6", "cg/sys/title/title-normal/title-anime/start-006.png");
		LoadImage("TitleImageStartAnime7", "cg/sys/title/title-normal/title-anime/start-007.png");
		LoadImage("TitleImageStartAnime8", "cg/sys/title/title-normal/title-anime/start-008.png");
		LoadImage("TitleImageStartAnime9", "cg/sys/title/title-normal/title-anime/start-009.png");

		LoadImage("TitleImageLoad0", "cg/sys/title/title-normal/Title-continue-000.png");
		LoadImage("TitleImageLoad1", "cg/sys/title/title-normal/Title-continue-001.png");
		LoadImage("TitleImageLoad1a", "cg/sys/title/title-normal/Title-continue-001a.png");
		LoadImage("TitleImageLoad1b", "cg/sys/title/title-normal/Title-continue-001b.png");
		LoadImage("TitleImageLoad2", "cg/sys/title/title-normal/Title-continue-002.png");
		LoadImage("TitleImageLoad2a", "cg/sys/title/title-normal/Title-continue-002a.png");
		LoadImage("TitleImageLoad2b", "cg/sys/title/title-normal/Title-continue-002b.png");
		LoadImage("TitleImageLoadAnime1", "cg/sys/title/title-normal/title-anime/cont-001.png");
		LoadImage("TitleImageLoadAnime2", "cg/sys/title/title-normal/title-anime/cont-002.png");
		LoadImage("TitleImageLoadAnime3", "cg/sys/title/title-normal/title-anime/cont-003.png");
		LoadImage("TitleImageLoadAnime4", "cg/sys/title/title-normal/title-anime/cont-004.png");
		LoadImage("TitleImageLoadAnime5", "cg/sys/title/title-normal/title-anime/cont-005.png");
		LoadImage("TitleImageLoadAnime6", "cg/sys/title/title-normal/title-anime/cont-006.png");
		LoadImage("TitleImageLoadAnime7", "cg/sys/title/title-normal/title-anime/cont-007.png");
		LoadImage("TitleImageLoadAnime8", "cg/sys/title/title-normal/title-anime/cont-008.png");
		LoadImage("TitleImageLoadAnime9", "cg/sys/title/title-normal/title-anime/cont-009.png");

		LoadImage("TitleImageConfig0", "cg/sys/title/title-normal/Title-config-000.png");
		LoadImage("TitleImageConfig1", "cg/sys/title/title-normal/Title-config-001.png");
		LoadImage("TitleImageConfig2", "cg/sys/title/title-normal/Title-config-002.png");
		LoadImage("TitleImageConfig3", "cg/sys/title/title-normal/Title-config-003.png");
		LoadImage("TitleImageConfigAnime1", "cg/sys/title/title-normal/title-anime/config-001.png");
		LoadImage("TitleImageConfigAnime2", "cg/sys/title/title-normal/title-anime/config-002.png");
		LoadImage("TitleImageConfigAnime3", "cg/sys/title/title-normal/title-anime/config-003.png");
		LoadImage("TitleImageConfigAnime4", "cg/sys/title/title-normal/title-anime/config-004.png");
		LoadImage("TitleImageConfigAnime5", "cg/sys/title/title-normal/title-anime/config-005.png");
		LoadImage("TitleImageConfigAnime6", "cg/sys/title/title-normal/title-anime/config-006.png");
		LoadImage("TitleImageConfigAnime7", "cg/sys/title/title-normal/title-anime/config-007.png");
		LoadImage("TitleImageConfigAnime8", "cg/sys/title/title-normal/title-anime/config-008.png");
		LoadImage("TitleImageConfigAnime9", "cg/sys/title/title-normal/title-anime/config-009.png");

		LoadImage("TitleImageExtra0", "cg/sys/title/title-normal/Title-extra-000.png");
		LoadImage("TitleImageExtra1", "cg/sys/title/title-normal/Title-extra-001.png");
		LoadImage("TitleImageExtra2", "cg/sys/title/title-normal/Title-extra-002.png");
		LoadImage("TitleImageExtra3", "cg/sys/title/title-normal/Title-extra-003.png");
		LoadImage("TitleImageExtraAnime1", "cg/sys/title/title-normal/title-anime/extra-001.png");
		LoadImage("TitleImageExtraAnime2", "cg/sys/title/title-normal/title-anime/extra-002.png");
		LoadImage("TitleImageExtraAnime3", "cg/sys/title/title-normal/title-anime/extra-003.png");
		LoadImage("TitleImageExtraAnime4", "cg/sys/title/title-normal/title-anime/extra-004.png");
		LoadImage("TitleImageExtraAnime5", "cg/sys/title/title-normal/title-anime/extra-005.png");
		LoadImage("TitleImageExtraAnime6", "cg/sys/title/title-normal/title-anime/extra-006.png");
		LoadImage("TitleImageExtraAnime7", "cg/sys/title/title-normal/title-anime/extra-007.png");
		LoadImage("TitleImageExtraAnime8", "cg/sys/title/title-normal/title-anime/extra-008.png");
		LoadImage("TitleImageExtraAnime9", "cg/sys/title/title-normal/title-anime/extra-009.png");

		LoadImage("TitleImageBlue0", "cg/sys/title/title-normal/Title-bluesky-000.png");
		LoadImage("TitleImageBlue1", "cg/sys/title/title-normal/Title-bluesky-001.png");
		LoadImage("TitleImageBlue2", "cg/sys/title/title-normal/Title-bluesky-002.png");
		LoadImage("TitleImageBlue3", "cg/sys/title/title-normal/Title-bluesky-003.png");
		LoadImage("TitleImageBlueAnime1", "cg/sys/title/title-normal/title-anime/bluesky-001.png");
		LoadImage("TitleImageBlueAnime2", "cg/sys/title/title-normal/title-anime/bluesky-002.png");
		LoadImage("TitleImageBlueAnime3", "cg/sys/title/title-normal/title-anime/bluesky-003.png");
		LoadImage("TitleImageBlueAnime4", "cg/sys/title/title-normal/title-anime/bluesky-004.png");
		LoadImage("TitleImageBlueAnime5", "cg/sys/title/title-normal/title-anime/bluesky-005.png");
		LoadImage("TitleImageBlueAnime6", "cg/sys/title/title-normal/title-anime/bluesky-006.png");
		LoadImage("TitleImageBlueAnime7", "cg/sys/title/title-normal/title-anime/bluesky-007.png");
		LoadImage("TitleImageBlueAnime8", "cg/sys/title/title-normal/title-anime/bluesky-008.png");
		LoadImage("TitleImageBlueAnime9", "cg/sys/title/title-normal/title-anime/bluesky-009.png");

		LoadImage("TitleImageDoor0", "cg/sys/title/title-normal/Title-caution-000.png");
		LoadImage("TitleImageDoor1", "cg/sys/title/title-normal/Title-caution-001.png");
		LoadImage("TitleImageDoor2", "cg/sys/title/title-normal/Title-caution-002.png");
		LoadImage("TitleImageDoor3", "cg/sys/title/title-normal/Title-caution-003.png");
		LoadImage("TitleImageDoorAnime1", "cg/sys/title/title-normal/title-anime/config-001.png");
		LoadImage("TitleImageDoorAnime2", "cg/sys/title/title-normal/title-anime/config-002.png");
		LoadImage("TitleImageDoorAnime3", "cg/sys/title/title-normal/title-anime/config-003.png");
		LoadImage("TitleImageDoorAnime4", "cg/sys/title/title-normal/title-anime/config-004.png");
		LoadImage("TitleImageDoorAnime5", "cg/sys/title/title-normal/title-anime/config-005.png");
		LoadImage("TitleImageDoorAnime6", "cg/sys/title/title-normal/title-anime/config-006.png");
		LoadImage("TitleImageDoorAnime7", "cg/sys/title/title-normal/title-anime/config-007.png");
		LoadImage("TitleImageDoorAnime8", "cg/sys/title/title-normal/title-anime/config-008.png");
		LoadImage("TitleImageDoorAnime9", "cg/sys/title/title-normal/title-anime/config-009.png");

		LoadImage("TitleImageList1", "cg/sys/title/title-normal/down-menu/CHAPTERLIST-001.png");
		LoadImage("TitleImageList2", "cg/sys/title/title-normal/down-menu/CHAPTERLIST-002.png");
		LoadImage("TitleImageLast1", "cg/sys/title/title-normal/down-menu/LASTSAVE-001.png");
		LoadImage("TitleImageLast2", "cg/sys/title/title-normal/down-menu/LASTSAVE-002.png");
		LoadImage("TitleImageLast3", "cg/sys/title/title-normal/down-menu/LASTSAVE-003.png");
		LoadImage("TitleImageBook1", "cg/sys/title/title-normal/down-menu/LOADGAME-001.png");
		LoadImage("TitleImageBook2", "cg/sys/title/title-normal/down-menu/LOADGAME-002.png");
		LoadImage("TitleImageBook3", "cg/sys/title/title-normal/down-menu/LOADGAME-003.png");


		LoadImage("TitleImageWindow", "cg/sys/title/title-normal/menu-window.png");
		LoadImage("TitleImageBar", "cg/sys/title/title-normal/down-menu/000-チャプター選択表示時バー.png");
		LoadImage("TitleImageChapter01_1", "cg/sys/title/title-normal/down-menu/001-チャプター001.png");
		LoadImage("TitleImageChapter01_2", "cg/sys/title/title-normal/down-menu/001-チャプター002.png");
		LoadImage("TitleImageChapter01_3", "cg/sys/title/title-normal/down-menu/001-チャプター003.png");
		LoadImage("TitleImageChapter02_1", "cg/sys/title/title-normal/down-menu/002-チャプター001.png");
		LoadImage("TitleImageChapter02_2", "cg/sys/title/title-normal/down-menu/002-チャプター002.png");
		LoadImage("TitleImageChapter02_3", "cg/sys/title/title-normal/down-menu/002-チャプター003.png");
		LoadImage("TitleImageChapter03_1", "cg/sys/title/title-normal/down-menu/003-チャプター001.png");
		LoadImage("TitleImageChapter03_2", "cg/sys/title/title-normal/down-menu/003-チャプター002.png");
		LoadImage("TitleImageChapter03_3", "cg/sys/title/title-normal/down-menu/003-チャプター003.png");
		LoadImage("TitleImageChapter04_1", "cg/sys/title/title-normal/down-menu/004-チャプター001.png");
		LoadImage("TitleImageChapter04_2", "cg/sys/title/title-normal/down-menu/004-チャプター002.png");
		LoadImage("TitleImageChapter04_3", "cg/sys/title/title-normal/down-menu/004-チャプター003.png");
		LoadImage("TitleImageChapter05_1", "cg/sys/title/title-normal/down-menu/005-チャプター001.png");
		LoadImage("TitleImageChapter05_2", "cg/sys/title/title-normal/down-menu/005-チャプター002.png");
		LoadImage("TitleImageChapter05_3", "cg/sys/title/title-normal/down-menu/005-チャプター003.png");
		LoadImage("TitleImageChapter06_1", "cg/sys/title/title-normal/down-menu/006-チャプター001.png");
		LoadImage("TitleImageChapter06_2", "cg/sys/title/title-normal/down-menu/006-チャプター002.png");
		LoadImage("TitleImageChapter06_3", "cg/sys/title/title-normal/down-menu/006-チャプター003.png");
		LoadImage("TitleImageChapter07_1", "cg/sys/title/title-normal/down-menu/007-チャプター001.png");
		LoadImage("TitleImageChapter07_2", "cg/sys/title/title-normal/down-menu/007-チャプター002.png");
		LoadImage("TitleImageChapter07_3", "cg/sys/title/title-normal/down-menu/007-チャプター003.png");
		LoadImage("TitleImageChapter08_1", "cg/sys/title/title-normal/down-menu/008-チャプター001.png");
		LoadImage("TitleImageChapter08_2", "cg/sys/title/title-normal/down-menu/008-チャプター002.png");
		LoadImage("TitleImageChapter08_3", "cg/sys/title/title-normal/down-menu/008-チャプター003.png");
		LoadImage("TitleImageChapter09_1", "cg/sys/title/title-normal/down-menu/009-チャプター001.png");
		LoadImage("TitleImageChapter09_2", "cg/sys/title/title-normal/down-menu/009-チャプター002.png");
		LoadImage("TitleImageChapter09_3", "cg/sys/title/title-normal/down-menu/009-チャプター003.png");
		LoadImage("TitleImageChapter10_1", "cg/sys/title/title-normal/down-menu/010-チャプター001.png");
		LoadImage("TitleImageChapter10_2", "cg/sys/title/title-normal/down-menu/010-チャプター002.png");
		LoadImage("TitleImageChapter10_3", "cg/sys/title/title-normal/down-menu/010-チャプター003.png");
		LoadImage("TitleImageChapter11_1", "cg/sys/title/title-normal/down-menu/011-チャプター001.png");
		LoadImage("TitleImageChapter11_2", "cg/sys/title/title-normal/down-menu/011-チャプター002.png");
		LoadImage("TitleImageChapter11_3", "cg/sys/title/title-normal/down-menu/011-チャプター003.png");
		LoadImage("TitleImageChapter12_1", "cg/sys/title/title-normal/down-menu/012-チャプター001.png");
		LoadImage("TitleImageChapter12_2", "cg/sys/title/title-normal/down-menu/012-チャプター002.png");
		LoadImage("TitleImageChapter12_3", "cg/sys/title/title-normal/down-menu/012-チャプター003.png");
		LoadImage("TitleImageChapter13_1", "cg/sys/title/title-normal/down-menu/013-チャプター001.png");
		LoadImage("TitleImageChapter13_2", "cg/sys/title/title-normal/down-menu/013-チャプター002.png");
		LoadImage("TitleImageChapter13_3", "cg/sys/title/title-normal/down-menu/013-チャプター003.png");
		LoadImage("TitleImageChapter14_1", "cg/sys/title/title-normal/down-menu/014-チャプター001.png");
		LoadImage("TitleImageChapter14_2", "cg/sys/title/title-normal/down-menu/014-チャプター002.png");
		LoadImage("TitleImageChapter14_3", "cg/sys/title/title-normal/down-menu/014-チャプター003.png");
		LoadImage("TitleImageChapter15_1", "cg/sys/title/title-normal/down-menu/015-チャプター001.png");
		LoadImage("TitleImageChapter15_2", "cg/sys/title/title-normal/down-menu/015-チャプター002.png");
		LoadImage("TitleImageChapter15_3", "cg/sys/title/title-normal/down-menu/015-チャプター003.png");
		LoadImage("TitleImageChapter16_1", "cg/sys/title/title-normal/down-menu/016-チャプター001.png");
		LoadImage("TitleImageChapter16_2", "cg/sys/title/title-normal/down-menu/016-チャプター002.png");
		LoadImage("TitleImageChapter16_3", "cg/sys/title/title-normal/down-menu/016-チャプター003.png");
		LoadImage("TitleImageChapter17_1", "cg/sys/title/title-normal/down-menu/017-チャプター001.png");
		LoadImage("TitleImageChapter17_2", "cg/sys/title/title-normal/down-menu/017-チャプター002.png");
		LoadImage("TitleImageChapter17_3", "cg/sys/title/title-normal/down-menu/017-チャプター003.png");
		LoadImage("TitleImageChapter18_1", "cg/sys/title/title-normal/down-menu/018-チャプター001.png");
		LoadImage("TitleImageChapter18_2", "cg/sys/title/title-normal/down-menu/018-チャプター002.png");
		LoadImage("TitleImageChapter18_3", "cg/sys/title/title-normal/down-menu/018-チャプター003.png");
	}



	if($PressKey||#ClearFinal){
		//■背景とかロゴとか
		CreateTexture("タイトル背景", 100, center, middle, "タイトルイメージ２");
		SetAlias("タイトル背景", "タイトル背景");
		CreateTexture("タイトル背景２", 100, center, middle, "タイトルイメージ２");
		SetAlias("タイトル背景２", "タイトル背景２");
	
		CreateTexture("タイトルロゴ１", 500, 420, 248, "タイトルイメージ１");
		SetAlias("タイトルロゴ１", "タイトルロゴ１");
		CreateTexture("タイトルロゴ２", 500, 420, 248, "タイトルイメージ１");
		SetAlias("タイトルロゴ２", "タイトルロゴ２");
	
		CreateTexture("タイトル著作", 500, 366, 526, "タイトルイメージ著作");
		SetAlias("タイトル著作", "タイトル著作");
	}

	CreateTexture("タイトル背景３", 100, center, middle, "タイトルイメージ３");
	SetAlias("タイトル背景３", "タイトル背景３");

	$TitleMaskMoveX=-(1024*1.5);
	$TitleMaskMoveY=-(576*1.5);

	CreateMask("タイトルマスク", 400, 1024, 576, "cg/sys/title/title.png", false);
	SetAlias("タイトルマスク", "タイトルマスク");
	CreateTexture("タイトルマスク/タイトルフラッシュ", 400, center, middle, "タイトルイメージ３");
	Request("タイトルマスク/タイトルフラッシュ", AddRender);
	SetAlias("タイトルマスク/タイトルフラッシュ", "タイトルフラッシュ");

	CreateMask("タイトルマスク２", 400, 1024, 576, "cg/sys/title/title2.png", false);
	SetAlias("タイトルマスク２", "タイトルマスク２");
	CreateTexture("タイトルマスク２/タイトルフラッシュ２", 400, center, middle, "タイトルイメージ３");
	Request("タイトルマスク２/タイトルフラッシュ２", AddRender);
	SetAlias("タイトルマスク２/タイトルフラッシュ２", "タイトルフラッシュ２");

	CreateProcess("タイトル背景プロセス", 100, 0, 0, "FlashStart");
	SetAlias("タイトル背景プロセス", "タイトル背景プロセス");

//	CreateProcess("タイトルメニュープロセス", 100, 0, 0, "TitleMemMenu");
//	SetAlias("タイトルメニュープロセス", "タイトルメニュープロセス");
//	Request("タイトルメニュープロセス", Lock);

	//■開始
	CreateChoice("タイトル開始");
	SetAlias("タイトル開始", "タイトル開始");

	$startX = 0;
	$startY = 0;
	$startX2 = 326;
	$startY2 = 99;
	$startoptionX = 77+245;
	$startoptionY = 97;

	CreateTexture("タイトル開始/MouseUsual/タイトル開始０", 200, $startX2, $startY2, "TitleImageStart0");
	SetAlias("タイトル開始/MouseUsual/タイトル開始０", "タイトル開始/MouseUsual/タイトル開始０");
	Request("タイトル開始/MouseUsual/タイトル開始０", Erase);

	CreateTexture("タイトル開始１", 200, $startX, $startY, "TitleImageStart1");
	SetAlias("タイトル開始１", "タイトル開始１");

	CreateTexture("タイトル開始/MouseOver/タイトル開始２", 200, $startX, $startY, "TitleImageStart2");
	SetAlias("タイトル開始/MouseOver/タイトル開始２", "タイトル開始/MouseOver/タイトル開始２");

	CreateProcess("タイトル開始/MouseOver/タイトル開始プロセス２", 100, 0, 0, "StartOpen");
	SetAlias("タイトル開始/MouseOver/タイトル開始プロセス２", "タイトル開始/MouseOver/タイトル開始プロセス２");
	CreateProcess("タイトル開始/MouseLeave/タイトル開始プロセス３", 100, 0, 0, "StartPause");
	SetAlias("タイトル開始/MouseLeave/タイトル開始プロセス３", "タイトル開始/MouseLeave/タイトル開始プロセス３");

	CreateTexture("タイトル開始/MouseClick/タイトル開始３", 200, $startX, $startY, "TitleImageStart3");
	SetAlias("タイトル開始/MouseClick/タイトル開始３", "タイトル開始/MouseClick/タイトル開始３");

	CreateSound("タイトル開始/MouseOver/タイトル開始音１", SE, "sound/se/SE_日常_照明点灯");

	CreateTexture("タイトル開始オプション１", 200, $startoptionX, $startoptionY, "TitleImageStartAnime1");
	SetAlias("タイトル開始オプション１", "タイトル開始オプション１");
	CreateTexture("タイトル開始オプション２", 200, $startoptionX, $startoptionY, "TitleImageStartAnime2");
	SetAlias("タイトル開始オプション２", "タイトル開始オプション２");
	CreateTexture("タイトル開始オプション３", 200, $startoptionX, $startoptionY, "TitleImageStartAnime3");
	SetAlias("タイトル開始オプション３", "タイトル開始オプション３");
	CreateTexture("タイトル開始オプション４", 200, $startoptionX, $startoptionY, "TitleImageStartAnime4");
	SetAlias("タイトル開始オプション４", "タイトル開始オプション４");
	CreateTexture("タイトル開始オプション５", 200, $startoptionX, $startoptionY, "TitleImageStartAnime5");
	SetAlias("タイトル開始オプション５", "タイトル開始オプション５");
	CreateTexture("タイトル開始オプション６", 200, $startoptionX, $startoptionY, "TitleImageStartAnime6");
	SetAlias("タイトル開始オプション６", "タイトル開始オプション６");
	CreateTexture("タイトル開始オプション７", 200, $startoptionX, $startoptionY, "TitleImageStartAnime7");
	SetAlias("タイトル開始オプション７", "タイトル開始オプション７");
	CreateTexture("タイトル開始オプション８", 200, $startoptionX, $startoptionY, "TitleImageStartAnime8");
	SetAlias("タイトル開始オプション８", "タイトル開始オプション８");
	CreateTexture("タイトル開始オプション９", 200, $startoptionX, $startoptionY, "TitleImageStartAnime9");
	SetAlias("タイトル開始オプション９", "タイトル開始オプション９");
	Request("タイトル開始オプション*", AddRender);

	//■ＬＯＡＤ
	CreateChoice("タイトル読込");
	SetAlias("タイトル読込", "タイトル読込");

	$loadX = 0;
	$loadY = 0;
	$loadX2 = 326;
	$loadY2 = 118;
	$loadoptionX = 77+245;
	$loadoptionY = 116;

	CreateTexture("タイトル読込/MouseUsual/タイトル読込０", 200, $loadX2, $loadY2, "TitleImageLoad0");
	SetAlias("タイトル読込/MouseUsual/タイトル読込０", "タイトル読込/MouseUsual/タイトル読込０");
	Request("タイトル読込/MouseUsual/タイトル読込０", Erase);

	CreateTexture("タイトル読込１", 200, $loadX, $loadY, "TitleImageLoad1a");
	SetAlias("タイトル読込１", "タイトル読込１");

	CreateTexture("タイトル読込/MouseOver/タイトル読込２", 200, $loadX, $loadY, "TitleImageLoad2a");
	SetAlias("タイトル読込/MouseOver/タイトル読込２", "タイトル読込/MouseOver/タイトル読込２");

	CreateProcess("タイトル読込/MouseOver/タイトル読込プロセス２", 100, 0, 0, "LoadOpen");
	SetAlias("タイトル読込/MouseOver/タイトル読込プロセス２", "タイトル読込/MouseOver/タイトル読込プロセス２");
	CreateProcess("タイトル読込/MouseLeave/タイトル読込プロセス３", 100, 0, 0, "LoadPause");
	SetAlias("タイトル読込/MouseLeave/タイトル読込プロセス３", "タイトル読込/MouseLeave/タイトル読込プロセス３");

	CreateTexture("タイトル読込/MouseClick/タイトル読込３", 200, $loadX, $loadY, "TitleImageLoad2a");
	SetAlias("タイトル読込/MouseClick/タイトル読込３", "タイトル読込/MouseClick/タイトル読込３");

	CreateSound("タイトル読込/MouseOver/タイトル読込音１", SE, "sound/se/SE_日常_照明点灯");

	CreateTexture("タイトル読込オプション１", 200, $loadoptionX, $loadoptionY, "TitleImageLoadAnime1");
	SetAlias("タイトル読込オプション１", "タイトル読込オプション１");
	CreateTexture("タイトル読込オプション２", 200, $loadoptionX, $loadoptionY, "TitleImageLoadAnime2");
	SetAlias("タイトル読込オプション２", "タイトル読込オプション２");
	CreateTexture("タイトル読込オプション３", 200, $loadoptionX, $loadoptionY, "TitleImageLoadAnime3");
	SetAlias("タイトル読込オプション３", "タイトル読込オプション３");
	CreateTexture("タイトル読込オプション４", 200, $loadoptionX, $loadoptionY, "TitleImageLoadAnime4");
	SetAlias("タイトル読込オプション４", "タイトル読込オプション４");
	CreateTexture("タイトル読込オプション５", 200, $loadoptionX, $loadoptionY, "TitleImageLoadAnime5");
	SetAlias("タイトル読込オプション５", "タイトル読込オプション５");
	CreateTexture("タイトル読込オプション６", 200, $loadoptionX, $loadoptionY, "TitleImageLoadAnime6");
	SetAlias("タイトル読込オプション６", "タイトル読込オプション６");
	CreateTexture("タイトル読込オプション７", 200, $loadoptionX, $loadoptionY, "TitleImageLoadAnime7");
	SetAlias("タイトル読込オプション７", "タイトル読込オプション７");
	CreateTexture("タイトル読込オプション８", 200, $loadoptionX, $loadoptionY, "TitleImageLoadAnime8");
	SetAlias("タイトル読込オプション８", "タイトル読込オプション８");
	CreateTexture("タイトル読込オプション９", 200, $loadoptionX, $loadoptionY, "TitleImageLoadAnime9");
	SetAlias("タイトル読込オプション９", "タイトル読込オプション９");
	Request("タイトル読込オプション*", AddRender);

	//■ＣＯＮＦＩＧ
	CreateChoice("タイトル設定");
	SetAlias("タイトル設定", "タイトル設定");

	$configX = 0;
	$configY = 0;
	$configX2 = 326;
	$configY2 = 137;
	$configoptionX = 77+245;
	$configoptionY = 135;

	CreateTexture("タイトル設定/MouseUsual/タイトル設定０", 200, $configX2, $configY2, "TitleImageConfig0");
	SetAlias("タイトル設定/MouseUsual/タイトル設定０", "タイトル設定/MouseUsual/タイトル設定０");
	Request("タイトル設定/MouseUsual/タイトル設定０", Erase);

	CreateTexture("タイトル設定１", 200, $configX, $configY, "TitleImageConfig1");
	SetAlias("タイトル設定１", "タイトル設定１");

	CreateTexture("タイトル設定/MouseOver/タイトル設定２", 200, $configX, $configY, "TitleImageConfig2");
	SetAlias("タイトル設定/MouseOver/タイトル設定２", "タイトル設定/MouseOver/タイトル設定２");

	CreateProcess("タイトル設定/MouseOver/タイトル設定プロセス２", 100, 0, 0, "ConfigOpen");
	SetAlias("タイトル設定/MouseOver/タイトル設定プロセス２", "タイトル設定/MouseOver/タイトル設定プロセス２");
	CreateProcess("タイトル設定/MouseLeave/タイトル設定プロセス３", 100, 0, 0, "ConfigPause");
	SetAlias("タイトル設定/MouseLeave/タイトル設定プロセス３", "タイトル設定/MouseLeave/タイトル設定プロセス３");

	CreateTexture("タイトル設定/MouseClick/タイトル設定３", 200, $configX, $configY, "TitleImageConfig3");
	SetAlias("タイトル設定/MouseClick/タイトル設定３", "タイトル設定/MouseClick/タイトル設定３");

	CreateSound("タイトル設定/MouseOver/タイトル設定音１", SE, "sound/se/SE_日常_照明点灯");

	CreateTexture("タイトル設定オプション１", 200, $configoptionX, $configoptionY, "TitleImageConfigAnime1");
	SetAlias("タイトル設定オプション１", "タイトル設定オプション１");
	CreateTexture("タイトル設定オプション２", 200, $configoptionX, $configoptionY, "TitleImageConfigAnime2");
	SetAlias("タイトル設定オプション２", "タイトル設定オプション２");
	CreateTexture("タイトル設定オプション３", 200, $configoptionX, $configoptionY, "TitleImageConfigAnime3");
	SetAlias("タイトル設定オプション３", "タイトル設定オプション３");
	CreateTexture("タイトル設定オプション４", 200, $configoptionX, $configoptionY, "TitleImageConfigAnime4");
	SetAlias("タイトル設定オプション４", "タイトル設定オプション４");
	CreateTexture("タイトル設定オプション５", 200, $configoptionX, $configoptionY, "TitleImageConfigAnime5");
	SetAlias("タイトル設定オプション５", "タイトル設定オプション５");
	CreateTexture("タイトル設定オプション６", 200, $configoptionX, $configoptionY, "TitleImageConfigAnime6");
	SetAlias("タイトル設定オプション６", "タイトル設定オプション６");
	CreateTexture("タイトル設定オプション７", 200, $configoptionX, $configoptionY, "TitleImageConfigAnime7");
	SetAlias("タイトル設定オプション７", "タイトル設定オプション７");
	CreateTexture("タイトル設定オプション８", 200, $configoptionX, $configoptionY, "TitleImageConfigAnime8");
	SetAlias("タイトル設定オプション８", "タイトル設定オプション８");
	CreateTexture("タイトル設定オプション９", 200, $configoptionX, $configoptionY, "TitleImageConfigAnime9");
	SetAlias("タイトル設定オプション９", "タイトル設定オプション９");
	Request("タイトル設定オプション*", AddRender);

	//■ＥＸＴＲＡ
	CreateChoice("タイトル特別");
	SetAlias("タイトル特別", "タイトル特別");

	$extraX = 0;
	$extraY = 0;
	$extraX2 = 326;
	$extraY2 = 155;
	$extraoptionX = 77+245;
	$extraoptionY = 154;

	CreateTexture("タイトル特別/MouseUsual/タイトル特別０", 200, $extraX2, $extraY2, "TitleImageExtra0");
	SetAlias("タイトル特別/MouseUsual/タイトル特別０", "タイトル特別/MouseUsual/タイトル特別０");
	Request("タイトル特別/MouseUsual/タイトル特別０", Erase);

	CreateTexture("タイトル特別１", 200, $extraX, $extraY, "TitleImageExtra1");
	SetAlias("タイトル特別１", "タイトル特別１");

	CreateTexture("タイトル特別/MouseOver/タイトル特別２", 200, $extraX, $extraY, "TitleImageExtra2");
	SetAlias("タイトル特別/MouseOver/タイトル特別２", "タイトル特別/MouseOver/タイトル特別２");

	CreateProcess("タイトル特別/MouseOver/タイトル特別プロセス２", 100, 0, 0, "ExtraOpen");
	SetAlias("タイトル特別/MouseOver/タイトル特別プロセス２", "タイトル特別/MouseOver/タイトル特別プロセス２");
	CreateProcess("タイトル特別/MouseLeave/タイトル特別プロセス３", 100, 0, 0, "ExtraPause");
	SetAlias("タイトル特別/MouseLeave/タイトル特別プロセス３", "タイトル特別/MouseLeave/タイトル特別プロセス３");

	CreateTexture("タイトル特別/MouseClick/タイトル特別３", 200, $extraX, $extraY, "TitleImageExtra3");
	SetAlias("タイトル特別/MouseClick/タイトル特別３", "タイトル特別/MouseClick/タイトル特別３");

	CreateSound("タイトル特別/MouseOver/タイトル特別音１", SE, "sound/se/SE_日常_照明点灯");

	CreateTexture("タイトル特別オプション１", 200, $extraoptionX, $extraoptionY, "TitleImageExtraAnime1");
	SetAlias("タイトル特別オプション１", "タイトル特別オプション１");
	CreateTexture("タイトル特別オプション２", 200, $extraoptionX, $extraoptionY, "TitleImageExtraAnime2");
	SetAlias("タイトル特別オプション２", "タイトル特別オプション２");
	CreateTexture("タイトル特別オプション３", 200, $extraoptionX, $extraoptionY, "TitleImageExtraAnime3");
	SetAlias("タイトル特別オプション３", "タイトル特別オプション３");
	CreateTexture("タイトル特別オプション４", 200, $extraoptionX, $extraoptionY, "TitleImageExtraAnime4");
	SetAlias("タイトル特別オプション４", "タイトル特別オプション４");
	CreateTexture("タイトル特別オプション５", 200, $extraoptionX, $extraoptionY, "TitleImageExtraAnime5");
	SetAlias("タイトル特別オプション５", "タイトル特別オプション５");
	CreateTexture("タイトル特別オプション６", 200, $extraoptionX, $extraoptionY, "TitleImageExtraAnime6");
	SetAlias("タイトル特別オプション６", "タイトル特別オプション６");
	CreateTexture("タイトル特別オプション７", 200, $extraoptionX, $extraoptionY, "TitleImageExtraAnime7");
	SetAlias("タイトル特別オプション７", "タイトル特別オプション７");
	CreateTexture("タイトル特別オプション８", 200, $extraoptionX, $extraoptionY, "TitleImageExtraAnime8");
	SetAlias("タイトル特別オプション８", "タイトル特別オプション８");
	CreateTexture("タイトル特別オプション９", 200, $extraoptionX, $extraoptionY, "TitleImageExtraAnime9");
	SetAlias("タイトル特別オプション９", "タイトル特別オプション９");
	Request("タイトル特別オプション*", AddRender);

	//■ＢＬＵＥＳＫＹ
	if(#ClearPieceR&&#ClearPieceY&&#ClearPieceS&&#ClearPieceK&&#ClearPieceA&&#ClearPieceN&&#ClearRouteA&&#ClearRouteB&&!#ClearFinal){
		CreateChoice("タイトル青空");
		SetAlias("タイトル青空", "タイトル青空");
	
		$blueX = 0;
		$blueY = 0;
		$blueX2 = 326;
		$blueY2 = 78;
		$blueoptionX = 77+245;
		$blueoptionY = 76;
	
		CreateTexture("タイトル青空/MouseUsual/タイトル青空０", 200, $blueX2, $blueY2, "TitleImageBlue0");
		SetAlias("タイトル青空/MouseUsual/タイトル青空０", "タイトル青空/MouseUsual/タイトル青空０");
		Request("タイトル青空/MouseUsual/タイトル青空０", Erase);
	
		CreateTexture("タイトル青空１", 200, $blueX, $blueY, "TitleImageBlue1");
		SetAlias("タイトル青空１", "タイトル青空１");
	
		CreateTexture("タイトル青空/MouseOver/タイトル青空２", 200, $blueX, $blueY, "TitleImageBlue2");
		SetAlias("タイトル青空/MouseOver/タイトル青空２", "タイトル青空/MouseOver/タイトル青空２");
	
		CreateProcess("タイトル青空/MouseOver/タイトル青空プロセス２", 100, 0, 0, "BlueOpen");
		SetAlias("タイトル青空/MouseOver/タイトル青空プロセス２", "タイトル青空/MouseOver/タイトル青空プロセス２");
		CreateProcess("タイトル青空/MouseLeave/タイトル青空プロセス３", 100, 0, 0, "BluePause");
		SetAlias("タイトル青空/MouseLeave/タイトル青空プロセス３", "タイトル青空/MouseLeave/タイトル青空プロセス３");
	
		CreateTexture("タイトル青空/MouseClick/タイトル青空３", 200, $blueX, $blueY, "TitleImageBlue3");
		SetAlias("タイトル青空/MouseClick/タイトル青空３", "タイトル青空/MouseClick/タイトル青空３");
	
		CreateSound("タイトル青空/MouseOver/タイトル青空音１", SE, "sound/se/SE_日常_照明点灯");

		CreateTexture("タイトル青空オプション１", 200, $blueoptionX, $blueoptionY, "TitleImageBlueAnime1");
		SetAlias("タイトル青空オプション１", "タイトル青空オプション１");
		CreateTexture("タイトル青空オプション２", 200, $blueoptionX, $blueoptionY, "TitleImageBlueAnime2");
		SetAlias("タイトル青空オプション２", "タイトル青空オプション２");
		CreateTexture("タイトル青空オプション３", 200, $blueoptionX, $blueoptionY, "TitleImageBlueAnime3");
		SetAlias("タイトル青空オプション３", "タイトル青空オプション３");
		CreateTexture("タイトル青空オプション４", 200, $blueoptionX, $blueoptionY, "TitleImageBlueAnime4");
		SetAlias("タイトル青空オプション４", "タイトル青空オプション４");
		CreateTexture("タイトル青空オプション５", 200, $blueoptionX, $blueoptionY, "TitleImageBlueAnime5");
		SetAlias("タイトル青空オプション５", "タイトル青空オプション５");
		CreateTexture("タイトル青空オプション６", 200, $blueoptionX, $blueoptionY, "TitleImageBlueAnime6");
		SetAlias("タイトル青空オプション６", "タイトル青空オプション６");
		CreateTexture("タイトル青空オプション７", 200, $blueoptionX, $blueoptionY, "TitleImageBlueAnime7");
		SetAlias("タイトル青空オプション７", "タイトル青空オプション７");
		CreateTexture("タイトル青空オプション８", 200, $blueoptionX, $blueoptionY, "TitleImageBlueAnime8");
		SetAlias("タイトル青空オプション８", "タイトル青空オプション８");
		CreateTexture("タイトル青空オプション９", 200, $blueoptionX, $blueoptionY, "TitleImageBlueAnime9");
		SetAlias("タイトル青空オプション９", "タイトル青空オプション９");
		Request("タイトル青空オプション*", AddRender);
	}


	if(#DebugMode)
	{
		//■チャプター
		CreateChoice("タイトル戸口");
		SetAlias("タイトル戸口", "タイトル戸口");
	
		$cautionX = -272;
		$cautionY = -28;
		$cautionX2 = -272+326;
		$cautionY2 = -28+58;
		$cautionoptionX = 64;
		$cautionoptionY = 28;
	
		CreateTexture("タイトル戸口/MouseUsual/タイトル戸口０", 200, $cautionX2, $cautionY2, "TitleImageDoor0");
		SetAlias("タイトル戸口/MouseUsual/タイトル戸口０", "タイトル戸口/MouseUsual/タイトル戸口０");
		Request("タイトル戸口/MouseUsual/タイトル戸口０", Erase);
	
		CreateTexture("タイトル戸口１", 200, $cautionX, $cautionY, "TitleImageDoor1");
		SetAlias("タイトル戸口１", "タイトル戸口１");
	
		CreateTexture("タイトル戸口/MouseOver/タイトル戸口２", 200, $cautionX, $cautionY, "TitleImageDoor2");
		SetAlias("タイトル戸口/MouseOver/タイトル戸口２", "タイトル戸口/MouseOver/タイトル戸口２");
	
		CreateProcess("タイトル戸口/MouseOver/タイトル戸口プロセス２", 100, 0, 0, "CautionOpen");
		SetAlias("タイトル戸口/MouseOver/タイトル戸口プロセス２", "タイトル戸口/MouseOver/タイトル戸口プロセス２");
		CreateProcess("タイトル戸口/MouseLeave/タイトル戸口プロセス３", 100, 0, 0, "CautionPause");
		SetAlias("タイトル戸口/MouseLeave/タイトル戸口プロセス３", "タイトル戸口/MouseLeave/タイトル戸口プロセス３");
	
		CreateTexture("タイトル戸口/MouseClick/タイトル戸口３", 200, $cautionX, $cautionY, "TitleImageDoor3");
		SetAlias("タイトル戸口/MouseClick/タイトル戸口３", "タイトル戸口/MouseClick/タイトル戸口３");
	
		CreateSound("タイトル戸口/MouseOver/タイトル戸口音１", SE, "sound/se/SE_日常_照明点灯");

		CreateTexture("タイトル戸口オプション１", 200, $cautionoptionX, $cautionoptionY, "TitleImageDoorAnime1");
		SetAlias("タイトル戸口オプション１", "タイトル戸口オプション１");
		CreateTexture("タイトル戸口オプション２", 200, $cautionoptionX, $cautionoptionY, "TitleImageDoorAnime2");
		SetAlias("タイトル戸口オプション２", "タイトル戸口オプション２");
		CreateTexture("タイトル戸口オプション３", 200, $cautionoptionX, $cautionoptionY, "TitleImageDoorAnime3");
		SetAlias("タイトル戸口オプション３", "タイトル戸口オプション３");
		CreateTexture("タイトル戸口オプション４", 200, $cautionoptionX, $cautionoptionY, "TitleImageDoorAnime4");
		SetAlias("タイトル戸口オプション４", "タイトル戸口オプション４");
		CreateTexture("タイトル戸口オプション５", 200, $cautionoptionX, $cautionoptionY, "TitleImageDoorAnime5");
		SetAlias("タイトル戸口オプション５", "タイトル戸口オプション５");
		CreateTexture("タイトル戸口オプション６", 200, $cautionoptionX, $cautionoptionY, "TitleImageDoorAnime6");
		SetAlias("タイトル戸口オプション６", "タイトル戸口オプション６");
		CreateTexture("タイトル戸口オプション７", 200, $cautionoptionX, $cautionoptionY, "TitleImageDoorAnime7");
		SetAlias("タイトル戸口オプション７", "タイトル戸口オプション７");
		CreateTexture("タイトル戸口オプション８", 200, $cautionoptionX, $cautionoptionY, "TitleImageDoorAnime8");
		SetAlias("タイトル戸口オプション８", "タイトル戸口オプション８");
		CreateTexture("タイトル戸口オプション９", 200, $cautionoptionX, $cautionoptionY, "TitleImageDoorAnime9");
		SetAlias("タイトル戸口オプション９", "タイトル戸口オプション９");
		Request("タイトル戸口オプション*", AddRender);
	}

		//▼セレクト２
		CreateWindow("タイトルウィンドウ１", 150, 408, 149, 800, 600, false);
		CreateTexture("タイトルウィンドウ１/ベース１", 150, 0, 0, "TitleImageLoad1b");
		CreateTexture("タイトルウィンドウ１/ベース２", 150, 0, 0, "TitleImageLoad2b");

		//▼ＬＡＳＴ
		CreateChoice("タイトル最後");
		SetAlias("タイトル最後", "タイトル最後");

		if(#ClearG){
			$lastX = 59;
			$lastY = 61;
		}else{
			$lastX = 59;
			$lastY = 61+8;
		}
		$lastX2 = $lastX;
		$lastY2 = $lastY;

		CreateTexture("タイトル最後/MouseUsual/タイトル最後０", 200, $lastX2, $lastY2, "TitleImageLast1");
		SetAlias("タイトル最後/MouseUsual/タイトル最後０", "タイトル最後/MouseUsual/タイトル最後０");
		Request("タイトル最後/MouseUsual/タイトル最後０", Erase);

		CreateTexture("タイトル最後１", 200, $lastX, $lastY, "TitleImageLast1");
		SetAlias("タイトル最後１", "タイトル最後１");
	
		CreateTexture("タイトル最後/MouseOver/タイトル最後２", 200, $lastX, $lastY, "TitleImageLast2");
		SetAlias("タイトル最後/MouseOver/タイトル最後２", "タイトル最後/MouseOver/タイトル最後２");
	
//		CreateProcess("タイトル最後/MouseOver/タイトル最後プロセス２", 100, 0, 0, "LastOpen");
//		SetAlias("タイトル最後/MouseOver/タイトル最後プロセス２", "タイトル最後/MouseOver/タイトル最後プロセス２");
//		CreateProcess("タイトル最後/MouseLeave/タイトル最後プロセス３", 100, 0, 0, "LastPause");
//		SetAlias("タイトル最後/MouseLeave/タイトル最後プロセス３", "タイトル最後/MouseLeave/タイトル最後プロセス３");
	
		CreateTexture("タイトル最後/MouseClick/タイトル最後３", 200, $lastX, $lastY, "TitleImageLast3");
		SetAlias("タイトル最後/MouseClick/タイトル最後３", "タイトル最後/MouseClick/タイトル最後３");
	
		CreateSound("タイトル最後/MouseOver/タイトル最後音１", SE, "sound/se/SE_日常_照明点灯");

		//▼ＢＯＯＫ
		CreateChoice("タイトル詩織");
		SetAlias("タイトル詩織", "タイトル詩織");

		if(#ClearG){
			$bookX = 59;
			$bookY = 83;
		}else{
			$bookX = 59;
			$bookY = 83+16;
		}
		$bookX2 = $bookX;
		$bookY2 = $bookY;

		CreateTexture("タイトル詩織/MouseUsual/タイトル詩織０", 200, $bookX2, $bookY2, "TitleImageBook1");
		SetAlias("タイトル詩織/MouseUsual/タイトル詩織０", "タイトル詩織/MouseUsual/タイトル詩織０");
		Request("タイトル詩織/MouseUsual/タイトル詩織０", Erase);

		CreateTexture("タイトル詩織１", 200, $bookX, $bookY, "TitleImageBook1");
		SetAlias("タイトル詩織１", "タイトル詩織１");
	
		CreateTexture("タイトル詩織/MouseOver/タイトル詩織２", 200, $bookX, $bookY, "TitleImageBook2");
		SetAlias("タイトル詩織/MouseOver/タイトル詩織２", "タイトル詩織/MouseOver/タイトル詩織２");
	
//		CreateProcess("タイトル詩織/MouseOver/タイトル詩織プロセス２", 100, 0, 0, "BookOpen");
//		SetAlias("タイトル詩織/MouseOver/タイトル詩織プロセス２", "タイトル詩織/MouseOver/タイトル詩織プロセス２");
//		CreateProcess("タイトル詩織/MouseLeave/タイトル詩織プロセス３", 100, 0, 0, "BookPause");
//		SetAlias("タイトル詩織/MouseLeave/タイトル詩織プロセス３", "タイトル詩織/MouseLeave/タイトル詩織プロセス３");
	
		CreateTexture("タイトル詩織/MouseClick/タイトル詩織３", 200, $bookX, $bookY, "TitleImageBook3");
		SetAlias("タイトル詩織/MouseClick/タイトル詩織３", "タイトル詩織/MouseClick/タイトル詩織３");
	
		CreateSound("タイトル詩織/MouseOver/タイトル詩織音１", SE, "sound/se/SE_日常_照明点灯");

	if(#ClearG){
		//▼ＬＩＳＴ
		CreateChoice("タイトル目録");
		SetAlias("タイトル目録", "タイトル目録");
	
		$listX = 59;
		$listY = 106;
		$listX2 = $listX;
		$listY2 = $listY;

		CreateTexture("タイトル目録/MouseUsual/タイトル目録０", 200, $listX2, $listY2, "TitleImageList1");
		SetAlias("タイトル目録/MouseUsual/タイトル目録０", "タイトル目録/MouseUsual/タイトル目録０");
		Request("タイトル目録/MouseUsual/タイトル目録０", Erase);

		CreateTexture("タイトル目録１", 200, $listX, $listY, "TitleImageList1");
		SetAlias("タイトル目録１", "タイトル目録１");
	
		CreateTexture("タイトル目録/MouseOver/タイトル目録２", 200, $listX, $listY, "TitleImageList2");
		SetAlias("タイトル目録/MouseOver/タイトル目録２", "タイトル目録/MouseOver/タイトル目録２");
	
//		CreateProcess("タイトル目録/MouseOver/タイトル目録プロセス２", 100, 0, 0, "ListOpen");
//		SetAlias("タイトル目録/MouseOver/タイトル目録プロセス２", "タイトル目録/MouseOver/タイトル目録プロセス２");
//		CreateProcess("タイトル目録/MouseLeave/タイトル目録プロセス３", 100, 0, 0, "ListPause");
//		SetAlias("タイトル目録/MouseLeave/タイトル目録プロセス３", "タイトル目録/MouseLeave/タイトル目録プロセス３");
	
		CreateTexture("タイトル目録/MouseClick/タイトル目録３", 200, $listX, $listY, "TitleImageList2");
		SetAlias("タイトル目録/MouseClick/タイトル目録３", "タイトル目録/MouseClick/タイトル目録３");
	
		CreateSound("タイトル目録/MouseOver/タイトル目録音１", SE, "sound/se/SE_日常_照明点灯");
	}

	//●セレクト３
	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, NULL);
	CreateWindow("タイトルウィンドウ２", 100, 0, 133, 640, 480, false);
	CreateTexture("タイトルウィンドウ２/ベース１", 100, 0, -240, "TitleImageWindow");

	CreateWindow("タイトルウィンドウ３", 100, 0, 167, 640, 172, false);//260

	$listX = 59;
	$listY = 168;
	$titlenum=1;
	while($titlenum<=18){
		$chapterok=true;
		if($titlenum==10&&!#ClearRouteA){
			$chapterok=false;
		}else if($titlenum==11&&!#ClearRouteB){
			$chapterok=false;
		}else if($titlenum==12&&!#ClearPieceR){
			$chapterok=false;
		}else if($titlenum==13&&!#ClearPieceS){
			$chapterok=false;
		}else if($titlenum==14&&!#ClearPieceY){
			$chapterok=false;
		}else if($titlenum==15&&!#ClearPieceK){
			$chapterok=false;
		}else if($titlenum==16&&!#ClearPieceA){
			$chapterok=false;
		}else if($titlenum==17&&!#ClearPieceN){
			$chapterok=false;
		}else if($titlenum==18&&!#ClearFinal){
			$chapterok=false;
		}

		$titlebase=String("タイトルウィンドウ３/タイトル章%02d",$titlenum);
		$titlename=String("タイトル章%02d",$titlenum);
		$titlenameA="@"+$titlename;
		$titleimage1=String("TitleImageChapter%02d_1",$titlenum);
		$titleimage2=String("TitleImageChapter%02d_2",$titlenum);
		$titleimage3=String("TitleImageChapter%02d_3",$titlenum);

		CreateChoice($titlebase);
		SetAlias($titlebase, $titlename);

		$name="タイトルウィンドウ３/"+$titlename+"_tex";
		$nameA=$titlename+"_tex";
		$name2=$titlenameA+"/MouseOver/音";
		if($chapterok){
			CreateTexture($name, 100, $listX, $listY, $titleimage1);
			SetAlias($name, $nameA);
//			CreateSound($name2, SE, "sound/se/SE_日常_照明点灯");
		}else{
			CreateText($name, 100, $listX, $listY, Auto, Auto, "ＮＯＮＥ");
			SetAlias($name, $nameA);
			Move($name, 0, @61, @0, null, true);
		}

//		$name="タイトルウィンドウ３/"+$titlename+"_pro";
//		$name2=String("ChapterStart%02d",$titlenum);
//		$nameA=$titlename+"_pro";
//		CreateProcess($name, 100, 0, 0, $name2);
//		SetAlias($name, $nameA);


		$name=$titlenameA+"/MouseUsual/hit";
		CreateTexture($name, 200, $listX, $listY, "TitleImageBar");
		Request($name, Erase);

		$name=$titlenameA+"/MouseOver/img2";
		if(Platform()!=100){CreateTexture($name, 100, $listX, $listY, "TitleImageBar");}
		$name=$titlenameA+"/MouseClick/img2";
		if(Platform()!=100){CreateTexture($name, 100, $listX, $listY, "TitleImageBar");}

		if($chapterok){
			$name=$titlenameA+"/MouseOver/img";
			CreateTexture($name, 100, $listX, $listY, $titleimage2);
			$name=$titlenameA+"/MouseClick/img";
			CreateTexture($name, 100, $listX, $listY, $titleimage3);
		}else{
			$name=$titlenameA+"/MouseOver/img";
			if(#ClearFinal){
				CreateText($name, 100, $listX, $listY, Auto, Auto, "<FONT incolor=#1b6499>ＮＯＮＥ</FONT>");
			}else{
				CreateText($name, 100, $listX, $listY, Auto, Auto, "<FONT incolor=#ffff33>ＮＯＮＥ</FONT>");
			}
			Move($name, 0, @61, @0, null, true);
			$name=$titlenameA+"/MouseClick/img";
			if(#ClearFinal){
				CreateText($name, 100, $listX, $listY, Auto, Auto, "<FONT incolor=#1b6499>ＮＯＮＥ</FONT>");
			}else{
				CreateText($name, 100, $listX, $listY, Auto, Auto, "<FONT incolor=#ffff33>ＮＯＮＥ</FONT>");
			}
			Move($name, 0, @61, @0, null, true);
		}

//		$name=$titlenameA+"/MouseOver/pro";
//		$name2=String("ChapterOpen%02d",$titlenum);
//		CreateProcess($name, 100, 0, 0, $name2);

//		$name=$titlenameA+"/MouseLeave/pro";
//		$name2=String("ChapterPause%02d",$titlenum);
//		CreateProcess($name, 100, 0, 0, $name2);


		if(!$chapterok){
//			$name=$titlenameA+"/*/*";
//			Request($name, Erase);

			if(Platform()==100){
//				$name=$titlenameA+"/MouseOver/img";
//				Request($name, Enter);
			}else{
//				$name=$titlenameA+"/MouseOver/img";
//				Request($name, Enter);
//				$name=$titlenameA+"/MouseOver/img2";
//				Request($name, Enter);
			}
		}


		$listY=$listY+43;
		$titlenum++;
	}
	Move("@タイトル章18*", 0, @0, 125, null, false);
	Move("@タイトル章18/*/*", 0, @0, 125, null, false);

	if(Platform()==100){
		CreateTexture("タイトル章オーバー", 100, 74, 210, "TitleImageBar");
	}

	$ChapterTop=1;
	$ChapterBottom=4;


/*
	CreateSE("タイトルサウンド開始音１","SE_シスてム_タイとル_ルーぷ");
	Request("タイトルサウンド開始音１", Lock);
	CreateSE("タイトルサウンド読込音１","SE_シスてム_タイとル_ルーぷ");
	Request("タイトルサウンド読込音１", Lock);
	CreateSE("タイトルサウンド設定音１","SE_シスてム_タイとル_ルーぷ");
	Request("タイトルサウンド設定音１", Lock);
	CreateSE("タイトルサウンド特別音１","SE_シスてム_タイとル_ルーぷ");
	Request("タイトルサウンド特別音１", Lock);
	CreateSE("タイトルサウンド青空音１","SE_シスてム_タイとル_ルーぷ");
	Request("タイトルサウンド青空音１", Lock);
	CreateSE("タイトルサウンド出口音１","SE_シスてム_タイとル_ルーぷ");
	Request("タイトルサウンド出口音１", Lock);
	CreateSE("タイトルサウンド戸口音１","SE_シスてム_タイとル_ルーぷ");
	Request("タイトルサウンド戸口音１", Lock);
*/

	$OpenFade=30;
	$OpenWait=30;
	$PauseFade=300;

	if(!$PressKey&&!#ClearFinal){
		Fade("タイトル*",0,0,null,false);
		Fade("タイトル*/*",0,0,null,false);
		Fade("タイトル*/*/*",0,0,null,false);
	
		Fade("@タイトル*",0,0,null,false);
		Fade("@タイトル*/*/*",0,0,null,false);

		Fade("タイトル背景",0,1000,null,false);
		Fade("タイトルロゴ１",0,1000,null,false);
		Fade("タイトル著作",0,1000,null,true);
		Fade("タイトルマスク*",0,1000,null,true); //add sentence
	}else if(!$PressKey&&!(#ClearFinal&&$FirstBlue)){
		Fade("タイトル*",0,0,null,false);
		Fade("タイトル*/*",0,0,null,false);
		Fade("タイトル*/*/*",0,0,null,false);
	
		Fade("@タイトル*",0,0,null,false);
		Fade("@タイトル*/*/*",0,0,null,false);

		Fade("タイトルブルー*", 0, 1000, null, true);
		Fade("タイトルマスク*",0,1000,null,true); //add sentence
	}else{
		Fade("タイトル*",0,0,null,false);
		Fade("タイトル*/*",0,0,null,false);
		Fade("タイトル*/*/*",0,0,null,false);
	
		Fade("@タイトル*",0,0,null,false);
		Fade("@タイトル*/*/*",0,0,null,true);
		Fade("タイトルマスク*",0,1000,null,true); //add sentence
	}

	//★★★★アンロック
	XBOX360_LockVideo(false);

//	WaitAction("タイトル*/*/*", null);

	//★ＴＣＲ対策
	//LoadingEnd();
}
//============================================================================//







//=============================================================================//
..//■タイトル動作■
//=============================================================================//
function TitleFade()
{
	if(#ClearFinal&&$FirstBlue){
	//■青空初見
		Move("タイトルロゴ１", 0, @0, @-50, null, true);
		Move("タイトルロゴ２", 0, @0, @20, null, true);

		SetVolume360("CH01", 1000, 0, NULL);
		Fade("色", 1000, 1000, Axl3, true);

		Fade("タイトル背景",0,1000,null,false);

		CreateBGM360("chn04");
		SoundPlay("chn04",0,1000,true);

		Fade("色", 2000, 0, null, true);
		Delete("色");

		Wait(2000);

		Move("タイトルロゴ１", 3000, @0, @50, Dxl1, false);
		Move("タイトルロゴ２", 3000, @0, @-50, Dxl1, false);
		Fade("タイトルロゴ１",3000,1000,null,false);
		Fade("タイトルロゴ２",3000,1000,null,2000);

		Fade("タイトルロゴ２",500,0,null,false);
		Fade("タイトルマスク/タイトルフラッシュ", 0, 1000, null, false);
		Fade("タイトル背景３",500,1000,Axl2,false);
		Move("タイトルマスク", 1000, $TitleMaskMoveX, $TitleMaskMoveY, null, 500);

		Fade("タイトル開始１",500,1000,null,false);
		Fade("タイトル読込１",500,1000,null,false);
		Fade("タイトル設定１",500,1000,null,false);
		Fade("タイトル特別１",500,1000,null,false);
//			Fade("タイトル出口１",500,1000,null,false);

		Fade("タイトル著作",1000,1000,null,true);

		Move("タイトルマスク", 0, 1280, 720, Axl1, true);
		Request("タイトル背景プロセス", Start);

		$Logo = true;
		$PressKey=true;
		$FirstBlue=false;
	}else if(!$PressKey&&!#ClearFinal){
	//■サインインから：ノーマル
		Fade("タイトルマスク/タイトルフラッシュ", 0, 1000, null, false);
		Fade("タイトル背景３",500,1000,Axl2,false);
		Move("タイトルマスク", 1000, $TitleMaskMoveX, $TitleMaskMoveY, null, 500);

		Fade("タイトル開始１",500,1000,null,false);
		Fade("タイトル読込１",500,1000,null,false);
		Fade("タイトル設定１",500,1000,null,false);
		Fade("タイトル特別１",500,1000,null,true);
//			Fade("タイトル出口１",500,1000,null,false);

		Fadesky();

		Move("タイトルマスク", 0, 1280, 720, Axl1, true);
		Request("タイトル背景プロセス", Start);

		$Logo = true;
		$PressKey=true;
	}else if(!$PressKey&&#ClearFinal){
	//■サインインから：青空
		Move("タイトルロゴ１", 0, @0, @-50, null, true);
		Move("タイトルロゴ２", 0, @0, @20, null, true);

		CreateColor("色", 1000, 0, 0, 1280, 720, "WHITE");
		Request("色", AddRender);
		Fade("色", 0, 0, null, true);

		SetVolume360("CH01", 1000, 0, NULL);

		Fade("タイトルブルー*",1000,500,null,false);
		Move("タイトルブルー１", 1000, @-20, @0, Axl3, false);
		Move("タイトルブルー２", 1000, @20, @0, Axl3, false);
		Fade("色", 1000, 1000, Axl3, true);

		Fade("タイトル背景",0,1000,null,false);
		Delete("タイトルブルー*");

		CreateBGM360("chn04");
		SoundPlay("chn04",0,1000,true);

		Fade("色", 2000, 0, null, true);
		Delete("色");

		Move("タイトルロゴ１", 3000, @0, @50, Dxl1, false);
		Move("タイトルロゴ２", 3000, @0, @-50, Dxl1, false);
		Fade("タイトルロゴ１",3000,1000,null,false);
		Fade("タイトルロゴ２",3000,1000,null,2000);

		Fade("タイトルロゴ２",500,0,null,false);
		Fade("タイトルマスク/タイトルフラッシュ", 0, 1000, null, false);
		Fade("タイトル背景３",500,1000,Axl2,false);
		Move("タイトルマスク", 1000, $TitleMaskMoveX, $TitleMaskMoveY, null, 500);

		Fade("タイトル開始１",500,1000,null,false);
		Fade("タイトル読込１",500,1000,null,false);
		Fade("タイトル設定１",500,1000,null,false);
		Fade("タイトル特別１",500,1000,null,false);
//			Fade("タイトル出口１",500,1000,null,false);

		Fade("タイトル著作",1000,1000,null,true);

		Move("タイトルマスク", 0, 1280, 720, Axl1, true);
		Request("タイトル背景プロセス", Start);

		$Logo = true;
		$PressKey=true;
	}else{
	//■通常
		if(#ClearFinal&&!$FirstBlue&&$PressKey){
			//★ＢＧＭプレイ
			CreateBGM360("chn04");
			SoundPlay("chn04",0,1000,true);
		}

		//★★★★ロック
		XBOX360_LockVideo(true);
		Fade("タイトル背景",0,1000,null,false);
		Fade("タイトル背景２",0,1000,null,false);
		Zoom("タイトル背景２", 0, 1100, 1100, null, false);
		Fade("タイトルカラー", 0, 1000, null, true);
		//★★★★アンロック
		XBOX360_LockVideo(false);

		Fade("タイトルカラー", 1000, 0, null, false);
		Zoom("タイトル背景２", 1000, 1000, 1000, Axl2, false);
		Fade("タイトル背景２",1000,0,null,true);
		Delete("タイトル背景２");

		Fade("タイトルロゴ１",500,1000,null,false);
		Fade("タイトルマスク/タイトルフラッシュ", 0, 1000, null, false);
		Fade("タイトルロゴ２",500,0,null,false);
		Move("タイトルマスク", 1000, $TitleMaskMoveX, $TitleMaskMoveY, null, false);
		Fade("タイトル背景３",1000,1000,null,500);

		Fade("タイトル開始１",500,1000,null,false);
		Fade("タイトル読込１",500,1000,null,false);
		Fade("タイトル設定１",500,1000,null,false);
		Fade("タイトル特別１",500,1000,null,false);
//			Fade("タイトル出口１",500,1000,null,false);
		Fade("タイトル著作",500,1000,null,true);

		Fadesky();

		Move("タイトルマスク", 0, 1280, 720, Axl1, true);
		Request("タイトル背景プロセス", Start);
	}

	if(#DebugMode)
	{
		Fade("タイトル戸口１",300,1000,null,true);
	}

	//★★★★ロック
	XBOX360_LockVideo(true);

	if(#ClearPieceR&&#ClearPieceY&&#ClearPieceS&&#ClearPieceK&&#ClearPieceA&&#ClearPieceN&&#ClearRouteA&&#ClearRouteB&&!#ClearFinal){
		SetNextFocus("タイトル青空/MouseUsual/タイトル青空０", "タイトル特別/MouseUsual/タイトル特別０", UP);
		SetNextFocus("タイトル青空/MouseUsual/タイトル青空０", "タイトル特別/MouseUsual/タイトル特別０", LEFT);
		SetNextFocus("タイトル青空/MouseUsual/タイトル青空０", "タイトル開始/MouseUsual/タイトル開始０", DOWN);
		SetNextFocus("タイトル青空/MouseUsual/タイトル青空０", "タイトル開始/MouseUsual/タイトル開始０", RIGHT);

		SetNextFocus("タイトル開始/MouseUsual/タイトル開始０", "タイトル青空/MouseUsual/タイトル青空０", UP);
		SetNextFocus("タイトル開始/MouseUsual/タイトル開始０", "タイトル青空/MouseUsual/タイトル青空０", LEFT);
		SetNextFocus("タイトル開始/MouseUsual/タイトル開始０", "タイトル読込/MouseUsual/タイトル読込０", DOWN);
		SetNextFocus("タイトル開始/MouseUsual/タイトル開始０", "タイトル読込/MouseUsual/タイトル読込０", RIGHT);

		SetNextFocus("タイトル読込/MouseUsual/タイトル読込０", "タイトル開始/MouseUsual/タイトル開始０", UP);
		SetNextFocus("タイトル読込/MouseUsual/タイトル読込０", "タイトル開始/MouseUsual/タイトル開始０", LEFT);
		SetNextFocus("タイトル読込/MouseUsual/タイトル読込０", "タイトル設定/MouseUsual/タイトル設定０", DOWN);
		SetNextFocus("タイトル読込/MouseUsual/タイトル読込０", "タイトル設定/MouseUsual/タイトル設定０", RIGHT);

		SetNextFocus("タイトル設定/MouseUsual/タイトル設定０", "タイトル読込/MouseUsual/タイトル読込０", UP);
		SetNextFocus("タイトル設定/MouseUsual/タイトル設定０", "タイトル読込/MouseUsual/タイトル読込０", LEFT);
		SetNextFocus("タイトル設定/MouseUsual/タイトル設定０", "タイトル特別/MouseUsual/タイトル特別０", DOWN);
		SetNextFocus("タイトル設定/MouseUsual/タイトル設定０", "タイトル特別/MouseUsual/タイトル特別０", RIGHT);

		SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル設定/MouseUsual/タイトル設定０", UP);
		SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル設定/MouseUsual/タイトル設定０", LEFT);
		SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル青空/MouseUsual/タイトル青空０", DOWN);
		SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル青空/MouseUsual/タイトル青空０", RIGHT);

		if(#DebugMode){
			SetNextFocus("タイトル青空/MouseUsual/タイトル青空０", "タイトル戸口/MouseUsual/タイトル戸口０", UP);
			SetNextFocus("タイトル青空/MouseUsual/タイトル青空０", "タイトル戸口/MouseUsual/タイトル戸口０", LEFT);

			SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル戸口/MouseUsual/タイトル戸口０", DOWN);
			SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル戸口/MouseUsual/タイトル戸口０", RIGHT);
	
			SetNextFocus("タイトル戸口/MouseUsual/タイトル戸口０", "タイトル特別/MouseUsual/タイトル特別０", UP);
			SetNextFocus("タイトル戸口/MouseUsual/タイトル戸口０", "タイトル特別/MouseUsual/タイトル特別０", LEFT);
			SetNextFocus("タイトル戸口/MouseUsual/タイトル戸口０", "タイトル青空/MouseUsual/タイトル青空０", DOWN);
			SetNextFocus("タイトル戸口/MouseUsual/タイトル戸口０", "タイトル青空/MouseUsual/タイトル青空０", RIGHT);
		}
	}else{
		SetNextFocus("タイトル開始/MouseUsual/タイトル開始０", "タイトル特別/MouseUsual/タイトル特別０", UP);
		SetNextFocus("タイトル開始/MouseUsual/タイトル開始０", "タイトル特別/MouseUsual/タイトル特別０", LEFT);
		SetNextFocus("タイトル開始/MouseUsual/タイトル開始０", "タイトル読込/MouseUsual/タイトル読込０", DOWN);
		SetNextFocus("タイトル開始/MouseUsual/タイトル開始０", "タイトル読込/MouseUsual/タイトル読込０", RIGHT);

		SetNextFocus("タイトル読込/MouseUsual/タイトル読込０", "タイトル開始/MouseUsual/タイトル開始０", UP);
		SetNextFocus("タイトル読込/MouseUsual/タイトル読込０", "タイトル開始/MouseUsual/タイトル開始０", LEFT);
		SetNextFocus("タイトル読込/MouseUsual/タイトル読込０", "タイトル設定/MouseUsual/タイトル設定０", DOWN);
		SetNextFocus("タイトル読込/MouseUsual/タイトル読込０", "タイトル設定/MouseUsual/タイトル設定０", RIGHT);

		SetNextFocus("タイトル設定/MouseUsual/タイトル設定０", "タイトル読込/MouseUsual/タイトル読込０", UP);
		SetNextFocus("タイトル設定/MouseUsual/タイトル設定０", "タイトル読込/MouseUsual/タイトル読込０", LEFT);
		SetNextFocus("タイトル設定/MouseUsual/タイトル設定０", "タイトル特別/MouseUsual/タイトル特別０", DOWN);
		SetNextFocus("タイトル設定/MouseUsual/タイトル設定０", "タイトル特別/MouseUsual/タイトル特別０", RIGHT);

		SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル設定/MouseUsual/タイトル設定０", UP);
		SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル設定/MouseUsual/タイトル設定０", LEFT);
		SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル開始/MouseUsual/タイトル開始０", DOWN);
		SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル開始/MouseUsual/タイトル開始０", RIGHT);

		if(#DebugMode){
			SetNextFocus("タイトル開始/MouseUsual/タイトル開始０", "タイトル戸口/MouseUsual/タイトル戸口０", UP);
			SetNextFocus("タイトル開始/MouseUsual/タイトル開始０", "タイトル戸口/MouseUsual/タイトル戸口０", LEFT);

			SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル戸口/MouseUsual/タイトル戸口０", DOWN);
			SetNextFocus("タイトル特別/MouseUsual/タイトル特別０", "タイトル戸口/MouseUsual/タイトル戸口０", RIGHT);
	
			SetNextFocus("タイトル戸口/MouseUsual/タイトル戸口０", "タイトル特別/MouseUsual/タイトル特別０", UP);
			SetNextFocus("タイトル戸口/MouseUsual/タイトル戸口０", "タイトル特別/MouseUsual/タイトル特別０", LEFT);
			SetNextFocus("タイトル戸口/MouseUsual/タイトル戸口０", "タイトル開始/MouseUsual/タイトル開始０", DOWN);
			SetNextFocus("タイトル戸口/MouseUsual/タイトル戸口０", "タイトル開始/MouseUsual/タイトル開始０", RIGHT);
		}
	}

	if(#ClearG){
		SetNextFocus("タイトル最後/MouseUsual/タイトル最後０", "タイトル目録/MouseUsual/タイトル目録０", UP);
		SetNextFocus("タイトル最後/MouseUsual/タイトル最後０", "タイトル目録/MouseUsual/タイトル目録０", LEFT);
		SetNextFocus("タイトル最後/MouseUsual/タイトル最後０", "タイトル詩織/MouseUsual/タイトル詩織０", DOWN);
		SetNextFocus("タイトル最後/MouseUsual/タイトル最後０", "タイトル詩織/MouseUsual/タイトル詩織０", RIGHT);

		SetNextFocus("タイトル詩織/MouseUsual/タイトル詩織０", "タイトル最後/MouseUsual/タイトル最後０", UP);
		SetNextFocus("タイトル詩織/MouseUsual/タイトル詩織０", "タイトル最後/MouseUsual/タイトル最後０", LEFT);
		SetNextFocus("タイトル詩織/MouseUsual/タイトル詩織０", "タイトル目録/MouseUsual/タイトル目録０", DOWN);
		SetNextFocus("タイトル詩織/MouseUsual/タイトル詩織０", "タイトル目録/MouseUsual/タイトル目録０", RIGHT);

		SetNextFocus("タイトル目録/MouseUsual/タイトル目録０", "タイトル詩織/MouseUsual/タイトル詩織０", UP);
		SetNextFocus("タイトル目録/MouseUsual/タイトル目録０", "タイトル詩織/MouseUsual/タイトル詩織０", LEFT);
		SetNextFocus("タイトル目録/MouseUsual/タイトル目録０", "タイトル最後/MouseUsual/タイトル最後０", DOWN);
		SetNextFocus("タイトル目録/MouseUsual/タイトル目録０", "タイトル最後/MouseUsual/タイトル最後０", RIGHT);
	}else{
		SetNextFocus("タイトル最後/MouseUsual/タイトル最後０", "タイトル詩織/MouseUsual/タイトル詩織０", UP);
		SetNextFocus("タイトル最後/MouseUsual/タイトル最後０", "タイトル詩織/MouseUsual/タイトル詩織０", LEFT);
		SetNextFocus("タイトル最後/MouseUsual/タイトル最後０", "タイトル詩織/MouseUsual/タイトル詩織０", DOWN);
		SetNextFocus("タイトル最後/MouseUsual/タイトル最後０", "タイトル詩織/MouseUsual/タイトル詩織０", RIGHT);

		SetNextFocus("タイトル詩織/MouseUsual/タイトル詩織０", "タイトル最後/MouseUsual/タイトル最後０", UP);
		SetNextFocus("タイトル詩織/MouseUsual/タイトル詩織０", "タイトル最後/MouseUsual/タイトル最後０", LEFT);
		SetNextFocus("タイトル詩織/MouseUsual/タイトル詩織０", "タイトル最後/MouseUsual/タイトル最後０", DOWN);
		SetNextFocus("タイトル詩織/MouseUsual/タイトル詩織０", "タイトル最後/MouseUsual/タイトル最後０", RIGHT);
	}


	if(Platform()!=100){
		SetNextFocus("@タイトル章01/MouseUsual/hit", "@タイトル章18/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章01/MouseUsual/hit", "@タイトル章18/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章01/MouseUsual/hit", "@タイトル章02/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章01/MouseUsual/hit", "@タイトル章02/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章02/MouseUsual/hit", "@タイトル章01/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章02/MouseUsual/hit", "@タイトル章01/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章02/MouseUsual/hit", "@タイトル章03/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章02/MouseUsual/hit", "@タイトル章03/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章03/MouseUsual/hit", "@タイトル章02/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章03/MouseUsual/hit", "@タイトル章02/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章03/MouseUsual/hit", "@タイトル章04/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章03/MouseUsual/hit", "@タイトル章04/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章04/MouseUsual/hit", "@タイトル章03/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章04/MouseUsual/hit", "@タイトル章03/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章04/MouseUsual/hit", "@タイトル章05/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章04/MouseUsual/hit", "@タイトル章05/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章05/MouseUsual/hit", "@タイトル章04/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章05/MouseUsual/hit", "@タイトル章04/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章05/MouseUsual/hit", "@タイトル章06/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章05/MouseUsual/hit", "@タイトル章06/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章06/MouseUsual/hit", "@タイトル章05/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章06/MouseUsual/hit", "@タイトル章05/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章06/MouseUsual/hit", "@タイトル章07/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章06/MouseUsual/hit", "@タイトル章07/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章07/MouseUsual/hit", "@タイトル章06/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章07/MouseUsual/hit", "@タイトル章06/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章07/MouseUsual/hit", "@タイトル章08/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章07/MouseUsual/hit", "@タイトル章08/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章08/MouseUsual/hit", "@タイトル章07/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章08/MouseUsual/hit", "@タイトル章07/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章08/MouseUsual/hit", "@タイトル章09/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章08/MouseUsual/hit", "@タイトル章09/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章09/MouseUsual/hit", "@タイトル章08/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章09/MouseUsual/hit", "@タイトル章08/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章09/MouseUsual/hit", "@タイトル章10/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章09/MouseUsual/hit", "@タイトル章10/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章10/MouseUsual/hit", "@タイトル章09/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章10/MouseUsual/hit", "@タイトル章09/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章10/MouseUsual/hit", "@タイトル章11/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章10/MouseUsual/hit", "@タイトル章11/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章11/MouseUsual/hit", "@タイトル章10/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章11/MouseUsual/hit", "@タイトル章10/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章11/MouseUsual/hit", "@タイトル章12/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章11/MouseUsual/hit", "@タイトル章12/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章12/MouseUsual/hit", "@タイトル章11/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章12/MouseUsual/hit", "@タイトル章11/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章12/MouseUsual/hit", "@タイトル章13/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章12/MouseUsual/hit", "@タイトル章13/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章13/MouseUsual/hit", "@タイトル章12/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章13/MouseUsual/hit", "@タイトル章12/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章13/MouseUsual/hit", "@タイトル章14/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章13/MouseUsual/hit", "@タイトル章14/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章14/MouseUsual/hit", "@タイトル章13/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章14/MouseUsual/hit", "@タイトル章13/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章14/MouseUsual/hit", "@タイトル章15/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章14/MouseUsual/hit", "@タイトル章15/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章15/MouseUsual/hit", "@タイトル章14/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章15/MouseUsual/hit", "@タイトル章14/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章15/MouseUsual/hit", "@タイトル章16/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章15/MouseUsual/hit", "@タイトル章16/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章16/MouseUsual/hit", "@タイトル章15/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章16/MouseUsual/hit", "@タイトル章15/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章16/MouseUsual/hit", "@タイトル章17/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章16/MouseUsual/hit", "@タイトル章17/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章17/MouseUsual/hit", "@タイトル章16/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章17/MouseUsual/hit", "@タイトル章16/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章17/MouseUsual/hit", "@タイトル章18/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章17/MouseUsual/hit", "@タイトル章18/MouseUsual/hit", RIGHT);
	
		SetNextFocus("@タイトル章18/MouseUsual/hit", "@タイトル章17/MouseUsual/hit", UP);
		SetNextFocus("@タイトル章18/MouseUsual/hit", "@タイトル章17/MouseUsual/hit", LEFT);
		SetNextFocus("@タイトル章18/MouseUsual/hit", "@タイトル章01/MouseUsual/hit", DOWN);
		SetNextFocus("@タイトル章18/MouseUsual/hit", "@タイトル章01/MouseUsual/hit", RIGHT);
	}

	//★対策「アンロードメモリ」
	if(Platform()==100){
		if(#ClearFinal){
			StartUnLoad_normal();
		}else{
			StartUnLoad_sky();
		}
	}

	//★★★★アンロック
	XBOX360_LockVideo(false);

	if(#ClearFinal){
		//○実績No.26：エンディングコンプリート
		XBOX360_Achieved(26);
	}

	//▼デモプロセス
	//CreateProcess("タイトルプロセス", 150, 0, 0, "TitleProcess");
	//SetAlias("タイトルプロセス", "タイトルプロセス");
	//■プロセススタート
	//Request("タイトルプロセス", Start);
}
//============================================================================//







//=============================================================================//
..//■ファンクション各種■
//=============================================================================//

//■サインイン
function SignIN()
{
	if(!$PressKey){
		//★★★★ロック
		XBOX360_LockVideo(true);
		//CreateProcess("タイトルメモリー", 1, 0, 0, "TitleMemFirst");
		CreateProcess("サインインプロセス１", 100, 0, 0, "PressKey");
		CreateProcess("サインインプロセス２", 150, 0, 0, "TitleMovie");
		CreateProcess("サインインプロセス３", 150, 0, 0, "TitleMoviePlay");
		//★★★★アンロック
		XBOX360_LockVideo(false);

		$SignInWhile=true;
		while($SignInWhile){
			$DialogStartSignIn_Flag=false;

			Request("サインインプロセス１", Start);
			Request("サインインプロセス２", Start);

			if(#LOCAL_sys_platform==100){
				SignIN_Macro01();
			}else{
				SignIN_Macro01();
			}

			Request("サインインプロセス１", Stop);
			Request("サインインプロセス２", Stop);
			WaitAction("サインインプロセス１", null);
			Fade("タイトルボタン", 100, 0, null, true);
	
			if(#LOCAL_sys_platform==100){
				//★サインインしているか？
				if(XBOX360_IsSignin()){
				}else{
					//▼していない場合サインイン【選択】画面を出す
					DialogStartSignIn();
				}
				//★サインインしているか？
				if(XBOX360_IsSignin()){
					//▼ストレージ【警告】画面を出す
					DialogStartStorage();
				}
			}
			else{
				$SignInWhile=false;
			}
		}
		Delete("タイトルボタン");
		Delete("サインインプロセス*");
	}

//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
	//デバッグ用
	if($DebugModeStart){
		#DebugMode=true;
	}else{
		#DebugMode=false;
	}
//▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
}

//■タイトルムービーマクロ１
function SignIN_Macro01()
{
	if(#LOCAL_sys_platform==100){
//		Request("タイトルメモリー", Start);
	}
	$TitleMovieCount=false;
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;

	//★：ユーザ情報初期化
	XBOX360_InitUser();
	while(1){
		if($SYSTEM_XBOX360_button_start_down||$SYSTEM_r_button_down){break;}
		if($TitleMovieCount){SignIN_Macro02();XBOX360_InitUser();}
		Wait(100);
	}
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;
}

//■タイトルムービーマクロ２
function SignIN_Macro02()
{
	$TitleBGM="CH01";

	Request("サインインプロセス１", Stop);
	Request("サインインプロセス２", Stop);
	WaitAction("サインインプロセス１", null);
	Fade("タイトルボタン", 100, 0, null, true);
	$TitleMovieCount=false;

	SetVolume360($TitleBGM, 2000, 0, NULL);
	Fade("タイトルカラー", 1300, 1000, null, true);

	if($DemoPattern==1){
		$DemoMovie="dx/mvDEMO.avi";
	}else if($DemoPattern==2){
		$DemoMovie="dx/mvOP.avi";
	}else{
		$DemoMovie="dx/mvDEMO.avi";
	}

	CreateMovie360("ＯＰムービー", 10000, Center, Middle, false, false, $DemoMovie);
	SetAlias("ＯＰムービー", "ＯＰムービー");
	Request("サインインプロセス３", Start);

	if($DemoPattern==1){
		$DemoPattern=2;
	}else if($DemoPattern==2){
		$DemoPattern=1;
	}else{
		$DemoPattern=2;
	}

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;
	WaitPlay("@ＯＰムービー", null);
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_start_down=false;$SYSTEM_XBOX360_button_a_down=false;

	Fade("ＯＰムービー", 0, 0, null, true);
	Delete("ＯＰムービー");
	Request("サインインプロセス３", Stop);

	CreateBGM360($TitleBGM);
	SoundPlay($TitleBGM,0,1000,true);

	Fade("タイトルカラー", 700, 0, null, true);
	Request("サインインプロセス１", Start);
	Request("サインインプロセス２", Start);
}


//■プレスAorSTRAT
function PressKey()
{
	while(1){
		Fade("@タイトルボタン", 1000, 1000, null, true);
		Fade("@タイトルボタン", 1000, 0, null, true);
	}
}

//■タイトルムービーカウント
function TitleMovie()
{
	while(1){
		Wait(30000);
		$TitleMovieCount=true;
	}
}

//■タイトルムービー
function TitleMoviePlay()
{
	while(1){
		XBOX360_InitUser();
		select{
			XBOX360_InitUser();
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_start_down||$SYSTEM_XBOX360_button_a_down){
				Delete("@ＯＰムービー");
			}
		}
	}
}

//■ロゴ
function LogoProcess1()
{
	Wait(2000);
	Fade("@タイトル5pb", 300, 0, null, true);
	$LogoCount1=true;
}

function LogoProcess2()
{
	Wait(2000);
	Fade("@タイトルニトロプラス", 300, 0, null, true);
	$LogoCount2=true;
}

function LogoProcess3()
{
	Wait(2000);
	Fade("@タイトルADX", 300, 0, null, true);
	$LogoCount3=true;
}

function LogoProcess4()
{
	Wait(5000);
	$LogoCount4=true;
}


//■タイトルムービー（保管用）
function TitleProcess2()
{
	while(1){
		Wait(35000);

		SetVolume($TitleBGM, 2000, 0, NULL);
		Fade("@タイトルカラー", 1300, 1000, null, true);

		CreateMovie360("ＯＰムービー", 100, Center, Middle, false, false, "dx/mvDEMO.avi");
		WaitKey();

		SoundPlay($TitleBGM,1000,1000,true);
		SetStream($TitleBGM, 2000);
		Fade("@タイトルカラー", 700, 0, null, true);
	}
}


//■青空
function Flashsky1()
{
	while(1)
	{
		if(Random(10)>= 0)
		{
			Fade("@タイトルフラッシュ", 0, 1000, null, false);
			Move("@タイトルマスク", 1500, $TitleMaskMoveX, $TitleMaskMoveY, null, true);
			Move("@タイトルマスク", 0, 1280, 720, Axl1, true);
		}
		Wait(100);
	}
}


//■青空アイコン
function Fadesky()
{
	if(#ClearPieceR&&#ClearPieceY&&#ClearPieceS&&#ClearPieceK&&#ClearPieceA&&#ClearPieceN&&#ClearRouteA&&#ClearRouteB&&!#ClearFinal){
		CreateWindow("タイトルウィンドウ４", 100, 0, -600, 352, 600, false);
		CreateTexture("タイトルウィンドウ４/ベース１", 100, 0, 0, "TitleImageBlue1");
		CreateWindow("タイトルウィンドウ５", 100, 408, 78, 200, 150, false);
		CreateTexture("タイトルウィンドウ５/ベース１", 100, 0, 0, "TitleImageBlue1");
		Fade("タイトルウィンドウ５/ベース１", 0, 0, null, true);

		Move("タイトルウィンドウ４", 200, @0, @115, null, true);
		Move("タイトルウィンドウ４", 300, @52, @0, null, true);

		FadePC8("タイトルウィンドウ５",0,1000,200,10,0,Dxl1, false);
		FadePC8("タイトルウィンドウ５/ベース１",0,1000,200,10,0,Dxl1, true);

		Fade("タイトル青空１", 0, 1000, null, true);
		Fade("タイトルウィンドウ４/ベース１", 0, 0, null, false);
		Fade("タイトルウィンドウ５/ベース１", 0, 0, null, true);

		Delete("タイトルウィンドウ４/ベース１");
		Delete("タイトルウィンドウ５/ベース１");
		Delete("タイトルウィンドウ４");
		Delete("タイトルウィンドウ５");
	}
}


//■背景
function FlashStart()
{
	Wait(3000);

	$FlashFade = 1;
	while($FlashFade==1)
	{
		if(Random(10)>= 6)
		{

			$ランダム = Random(3);

//			CreateText("テキスト１", 10000, 300, 300, 300, 300, "$ランダム");

			if($ランダム == 0)
			{
				Fade("@タイトルフラッシュ２", 0, 1000, null, false);
				Move("@タイトルマスク２", 1000, $TitleMaskMoveX, $TitleMaskMoveY, null, true);
				Move("@タイトルマスク２", 0, 1280, 720, Axl1, true);
			}
			else if($ランダム == 1)
			{
				Fade("@タイトルフラッシュ", 0, 1000, null, false);
				Move("@タイトルマスク", 1000, $TitleMaskMoveX, $TitleMaskMoveY, null, true);
				Move("@タイトルマスク", 0, 1280, 720, Axl1, true);
			}
			else if($ランダム == 2)
			{
				Fade("@タイトルフラッシュ", 0, 1000, null, false);
				Move("@タイトルマスク", 800, $TitleMaskMoveX, $TitleMaskMoveY, null, true);
				Move("@タイトルマスク", 0, 1280, 720, Axl1, true);
				Move("@タイトルマスク", 800, $TitleMaskMoveX, $TitleMaskMoveY, null, true);
				Move("@タイトルマスク", 0, 1280, 720, Axl1, true);
			}
		}

		Wait(2000);
	}
}


//■スタート
function StartOpen()
{
	$StartFade = 0;
	$LoadFade = 0;
	$ConfigFade = 0;
	$ExtraFade = 0;
	$ExitFade = 0;
	$CautionFade = 0;
	$BlueFade = 0;
	SetVolume("@タイトルサウンド開始音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド読込音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド設定音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド特別音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド出口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド戸口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド青空音１", 500, 0, NULL);

	$StartFade = 1;
	while($StartFade == 1)
	{
		Request("@タイトルサウンド開始音１", Play);
		SetLoop("@タイトルサウンド開始音１", true);
		SetVolume("@タイトルサウンド開始音１", 0, 1000, null);
		Request("@タイトルサウンド開始音１", Disused);

		Fade("@タイトル開始オプション１", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル開始オプション１", $OpenFade, 0, null, false);
		Fade("@タイトル開始オプション２", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル開始オプション２", $OpenFade, 0, null, false);
		Fade("@タイトル開始オプション３", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル開始オプション３", $OpenFade, 0, null, false);
		Fade("@タイトル開始オプション４", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル開始オプション４", $OpenFade, 0, null, false);
		Fade("@タイトル開始オプション５", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル開始オプション５", $OpenFade, 0, null, false);
		Fade("@タイトル開始オプション６", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル開始オプション６", $OpenFade, 0, null, false);
		Fade("@タイトル開始オプション７", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル開始オプション７", $OpenFade, 0, null, false);
		Fade("@タイトル開始オプション８", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル開始オプション８", $OpenFade, 0, null, false);
		Fade("@タイトル開始オプション９", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル開始オプション９", $OpenFade, 0, null, false);
	}
	SetVolume("@タイトルサウンド開始音１", 500, 0, NULL);
}

function StartPause()
{
	$StartFade = 0;
	Request("@タイトル開始/MouseOver/タイトル開始プロセス２", Stop);
	Fade("@タイトル開始オプション*", $PauseFade, 0, null, true);

	SetVolume("@タイトルサウンド開始音１", 500, 0, NULL);
}


//■ロード
function LoadOpen()
{
	$StartFade = 0;
	$LoadFade = 0;
	$ConfigFade = 0;
	$ExtraFade = 0;
	$ExitFade = 0;
	$CautionFade = 0;
	$BlueFade = 0;
	SetVolume("@タイトルサウンド開始音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド読込音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド設定音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド特別音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド出口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド戸口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド青空音１", 500, 0, NULL);

	$LoadFade = 1;
	while($LoadFade == 1)
	{
		Request("@タイトルサウンド読込音１", Play);
		SetLoop("@タイトルサウンド読込音１", true);
		SetVolume("@タイトルサウンド読込音１", 0, 1000, null);
		Request("@タイトルサウンド読込音１", Disused);

		Fade("@タイトル読込オプション１", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル読込オプション１", $OpenFade, 0, null, false);
		Fade("@タイトル読込オプション２", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル読込オプション２", $OpenFade, 0, null, false);
		Fade("@タイトル読込オプション３", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル読込オプション３", $OpenFade, 0, null, false);
		Fade("@タイトル読込オプション４", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル読込オプション４", $OpenFade, 0, null, false);
		Fade("@タイトル読込オプション５", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル読込オプション５", $OpenFade, 0, null, false);
		Fade("@タイトル読込オプション６", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル読込オプション６", $OpenFade, 0, null, false);
		Fade("@タイトル読込オプション７", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル読込オプション７", $OpenFade, 0, null, false);
		Fade("@タイトル読込オプション８", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル読込オプション８", $OpenFade, 0, null, false);
		Fade("@タイトル読込オプション９", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル読込オプション９", $OpenFade, 0, null, false);
	}
	SetVolume("@タイトルサウンド読込音１", 500, 0, NULL);
}

function LoadPause()
{
	$LoadFade = 0;
	Request("@タイトル読込/MouseOver/タイトル読込プロセス２", Stop);
	Fade("@タイトル読込オプション*", $PauseFade, 0, null, true);

	SetVolume("@タイトルサウンド読込音１", 500, 0, NULL);
}


//■コンフィグ
function ConfigOpen()
{
	$StartFade = 0;
	$LoadFade = 0;
	$ConfigFade = 0;
	$ExtraFade = 0;
	$ExitFade = 0;
	$CautionFade = 0;
	$BlueFade = 0;
	SetVolume("@タイトルサウンド開始音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド読込音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド設定音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド特別音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド出口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド戸口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド青空音１", 500, 0, NULL);

	$ConfigFade = 1;
	while($ConfigFade == 1)
	{
		Request("@タイトルサウンド設定音１", Play);
		SetLoop("@タイトルサウンド設定音１", true);
		SetVolume("@タイトルサウンド設定音１", 0, 1000, null);
		Request("@タイトルサウンド設定音１", Disused);

		Fade("@タイトル設定オプション１", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル設定オプション１", $OpenFade, 0, null, false);
		Fade("@タイトル設定オプション２", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル設定オプション２", $OpenFade, 0, null, false);
		Fade("@タイトル設定オプション３", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル設定オプション３", $OpenFade, 0, null, false);
		Fade("@タイトル設定オプション４", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル設定オプション４", $OpenFade, 0, null, false);
		Fade("@タイトル設定オプション５", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル設定オプション５", $OpenFade, 0, null, false);
		Fade("@タイトル設定オプション６", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル設定オプション６", $OpenFade, 0, null, false);
		Fade("@タイトル設定オプション７", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル設定オプション７", $OpenFade, 0, null, false);
		Fade("@タイトル設定オプション８", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル設定オプション８", $OpenFade, 0, null, false);
		Fade("@タイトル設定オプション９", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル設定オプション９", $OpenFade, 0, null, false);
	}
	SetVolume("@タイトルサウンド設定音１", 500, 0, NULL);
}

function ConfigPause()
{
	$ConfigFade = 0;
	Request("@タイトル設定/MouseOver/タイトル設定プロセス２", Stop);
	Fade("@タイトル設定オプション*", $PauseFade, 0, null, true);

	SetVolume("@タイトルサウンド設定音１", 500, 0, NULL);
}


//■エキストラ
function ExtraOpen()
{
	$StartFade = 0;
	$LoadFade = 0;
	$ConfigFade = 0;
	$ExtraFade = 0;
	$ExitFade = 0;
	$CautionFade = 0;
	$BlueFade = 0;
	SetVolume("@タイトルサウンド開始音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド読込音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド設定音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド特別音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド出口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド戸口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド青空音１", 500, 0, NULL);

	$ExtraFade = 1;
	while($ExtraFade == 1)
	{
		Request("@タイトルサウンド特別音１", Play);
		SetLoop("@タイトルサウンド特別音１", true);
		SetVolume("@タイトルサウンド特別音１", 0, 1000, null);
		Request("@タイトルサウンド特別音１", Disused);

		Fade("@タイトル特別オプション１", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル特別オプション１", $OpenFade, 0, null, false);
		Fade("@タイトル特別オプション２", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル特別オプション２", $OpenFade, 0, null, false);
		Fade("@タイトル特別オプション３", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル特別オプション３", $OpenFade, 0, null, false);
		Fade("@タイトル特別オプション４", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル特別オプション４", $OpenFade, 0, null, false);
		Fade("@タイトル特別オプション５", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル特別オプション５", $OpenFade, 0, null, false);
		Fade("@タイトル特別オプション６", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル特別オプション６", $OpenFade, 0, null, false);
		Fade("@タイトル特別オプション７", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル特別オプション７", $OpenFade, 0, null, false);
		Fade("@タイトル特別オプション８", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル特別オプション８", $OpenFade, 0, null, false);
		Fade("@タイトル特別オプション９", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル特別オプション９", $OpenFade, 0, null, false);
	}
	SetVolume("@タイトルサウンド特別音１", 500, 0, NULL);
}

function ExtraPause()
{
	$ExtraFade = 0;
	Request("@タイトル特別/MouseOver/タイトル特別プロセス２", Stop);
	Fade("@タイトル特別オプション*", $PauseFade, 0, null, true);

	SetVolume("@タイトルサウンド特別音１", 500, 0, NULL);
}


//■ブルー
function BlueOpen()
{
	$StartFade = 0;
	$LoadFade = 0;
	$ConfigFade = 0;
	$ExtraFade = 0;
	$ExitFade = 0;
	$CautionFade = 0;
	$BlueFade = 0;
	SetVolume("@タイトルサウンド開始音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド読込音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド設定音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド特別音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド出口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド戸口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド青空音１", 500, 0, NULL);

	$BlueFade = 1;
	while($BlueFade == 1)
	{
		Request("@タイトルサウンド青空音１", Play);
		SetLoop("@タイトルサウンド青空音１", true);
		SetVolume("@タイトルサウンド青空音１", 0, 1000, null);
		Request("@タイトルサウンド青空音１", Disused);

		Fade("@タイトル青空オプション１", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル青空オプション１", $OpenFade, 0, null, false);
		Fade("@タイトル青空オプション２", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル青空オプション２", $OpenFade, 0, null, false);
		Fade("@タイトル青空オプション３", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル青空オプション３", $OpenFade, 0, null, false);
		Fade("@タイトル青空オプション４", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル青空オプション４", $OpenFade, 0, null, false);
		Fade("@タイトル青空オプション５", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル青空オプション５", $OpenFade, 0, null, false);
		Fade("@タイトル青空オプション６", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル青空オプション６", $OpenFade, 0, null, false);
		Fade("@タイトル青空オプション７", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル青空オプション７", $OpenFade, 0, null, false);
		Fade("@タイトル青空オプション８", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル青空オプション８", $OpenFade, 0, null, false);
		Fade("@タイトル青空オプション９", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル青空オプション９", $OpenFade, 0, null, false);
	}
	SetVolume("@タイトルサウンド青空音１", 500, 0, NULL);
}


function BluePause()
{
	$BlueFade = 0;
	Request("@タイトル青空/MouseOver/タイトル青空プロセス２", Stop);
	Fade("@タイトル青空オプション*", $PauseFade, 0, null, true);

	SetVolume("@タイトルサウンド青空音１", 500, 0, NULL);
}


//■イグジット
function ExitOpen()
{
	$StartFade = 0;
	$LoadFade = 0;
	$ConfigFade = 0;
	$ExtraFade = 0;
	$ExitFade = 0;
	$CautionFade = 0;
	$BlueFade = 0;
	SetVolume("@タイトルサウンド開始音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド読込音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド設定音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド特別音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド出口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド戸口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド青空音１", 500, 0, NULL);

	$ExitFade = 1;
	while($ExitFade == 1)
	{
		Request("@タイトルサウンド出口音１", Play);
		SetLoop("@タイトルサウンド出口音１", true);
		SetVolume("@タイトルサウンド出口音１", 0, 1000, null);
		Request("@タイトルサウンド出口音１", Disused);

		Fade("@タイトル出口オプション１", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル出口オプション１", $OpenFade, 0, null, false);
		Fade("@タイトル出口オプション２", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル出口オプション２", $OpenFade, 0, null, false);
		Fade("@タイトル出口オプション３", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル出口オプション３", $OpenFade, 0, null, false);
		Fade("@タイトル出口オプション４", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル出口オプション４", $OpenFade, 0, null, false);
		Fade("@タイトル出口オプション５", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル出口オプション５", $OpenFade, 0, null, false);
		Fade("@タイトル出口オプション６", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル出口オプション６", $OpenFade, 0, null, false);
		Fade("@タイトル出口オプション７", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル出口オプション７", $OpenFade, 0, null, false);
		Fade("@タイトル出口オプション８", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル出口オプション８", $OpenFade, 0, null, false);
		Fade("@タイトル出口オプション９", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル出口オプション９", $OpenFade, 0, null, false);
	}
	SetVolume("@タイトルサウンド出口音１", 500, 0, NULL);
}

function ExitPause()
{
	$ExitFade = 0;
	Request("@タイトル出口/MouseOver/タイトル出口プロセス２", Stop);
	Fade("@タイトル出口オプション*", $PauseFade, 0, null, true);

	SetVolume("@タイトルサウンド出口音１", 500, 0, NULL);
}


//■ドア
function CautionOpen()
{
	$StartFade = 0;
	$LoadFade = 0;
	$ConfigFade = 0;
	$ExtraFade = 0;
	$ExitFade = 0;
	$CautionFade = 0;
	$BlueFade = 0;
	SetVolume("@タイトルサウンド開始音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド読込音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド設定音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド特別音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド出口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド戸口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド青空音１", 500, 0, NULL);

	$CautionFade = 1;
	while($CautionFade == 1)
	{
		Request("@タイトルサウンド戸口音１", Play);
		SetLoop("@タイトルサウンド戸口音１", true);
		SetVolume("@タイトルサウンド戸口音１", 0, 1000, null);
		Request("@タイトルサウンド戸口音１", Disused);

		Fade("@タイトル戸口オプション１", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル戸口オプション１", $OpenFade, 0, null, false);
		Fade("@タイトル戸口オプション２", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル戸口オプション２", $OpenFade, 0, null, false);
		Fade("@タイトル戸口オプション３", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル戸口オプション３", $OpenFade, 0, null, false);
		Fade("@タイトル戸口オプション４", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル戸口オプション４", $OpenFade, 0, null, false);
		Fade("@タイトル戸口オプション５", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル戸口オプション５", $OpenFade, 0, null, false);
		Fade("@タイトル戸口オプション６", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル戸口オプション６", $OpenFade, 0, null, false);
		Fade("@タイトル戸口オプション７", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル戸口オプション７", $OpenFade, 0, null, false);
		Fade("@タイトル戸口オプション８", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル戸口オプション８", $OpenFade, 0, null, false);
		Fade("@タイトル戸口オプション９", $OpenFade, 1000, null, false);
		Wait($OpenWait);
		Fade("@タイトル戸口オプション９", $OpenFade, 0, null, false);
	}
	SetVolume("@タイトルサウンド戸口音１", 500, 0, NULL);
}

function CautionPause()
{
	$CautionFade = 0;
	Request("@タイトル戸口/MouseOver/タイトル戸口プロセス２", Stop);
	Fade("@タイトル戸口オプション*", $PauseFade, 0, null, true);

	SetVolume("@タイトルサウンド戸口音１", 500, 0, NULL);
}


function AllPause()
{
	$StartFade = 0;
	$LoadFade = 0;
	$ConfigFade = 0;
	$ExtraFade = 0;
	$ExitFade = 0;
	$CautionFade = 0;
	$BlueFade = 0;
	Request("@タイトル開始/MouseOver/タイトル開始プロセス２", Stop);
	Request("@タイトル読込/MouseOver/タイトル読込プロセス２", Stop);
	Request("@タイトル設定/MouseOver/タイトル設定プロセス２", Stop);
	Request("@タイトル特別/MouseOver/タイトル特別プロセス２", Stop);
	Request("@タイトル出口/MouseOver/タイトル出口プロセス２", Stop);
	Request("@タイトル戸口/MouseOver/タイトル戸口プロセス２", Stop);
	Request("@タイトル青空/MouseOver/タイトル青空プロセス２", Stop);
	Fade("@タイトル開始オプション*", $PauseFade, 0, null, false);
	Fade("@タイトル読込オプション*", $PauseFade, 0, null, false);
	Fade("@タイトル設定オプション*", $PauseFade, 0, null, false);
	Fade("@タイトル特別オプション*", $PauseFade, 0, null, false);
	Fade("@タイトル出口オプション*", $PauseFade, 0, null, false);
	Fade("@タイトル戸口オプション*", $PauseFade, 0, null, false);
	Fade("@タイトル青空オプション*", $PauseFade, 0, null, false);
	SetVolume("@タイトルサウンド開始音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド読込音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド設定音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド特別音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド出口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド戸口音１", 500, 0, NULL);
	SetVolume("@タイトルサウンド青空音１", 500, 0, NULL);
}


function ChapterNextStart_noha()
{
//	$ChapterMove=50;
	$ChapterY=125;

	$ChapterBottomCount=$ChapterBottom+1;
	if($ChapterBottomCount>18){$ChapterBottomCount=1;}
	$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
	$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
	Move($ChapterBottomTexA, 0, @0, 341, null, false);
	Move($ChapterBottomTexB, 0, @0, 341, null, true);

	$ChapterBottomCount=$ChapterBottomCount+1;
	if($ChapterBottomCount>18){$ChapterBottomCount=1;}
	$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
	$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
	Move($ChapterBottomTexA, 0, @0, 384, null, false);
	Move($ChapterBottomTexB, 0, @0, 384, null, true);

	Move("@タイトル章0*", $ChapterMove, @0, @-43, null, false);
	Move("@タイトル章0*/*/*", $ChapterMove, @0, @-43, null, false);
	Move("@タイトル章1*", $ChapterMove, @0, @-43, null, false);
	Move("@タイトル章1*/*/*", $ChapterMove, @0, @-43, null, false);

	WaitAction("@タイトル章1*/*/*", null);

	$ChapterTop++;
	$ChapterBottom++;
	if($ChapterTop>18){$ChapterTop=1;}
	if($ChapterBottom>18){$ChapterBottom=1;}
}


function ChapterNextStart()
{
	$FlashFade = 0;
	Request("タイトル背景プロセス", Stop);

	//★★★★ロック
	XBOX360_LockVideo(true);

	$ChapterMove=24;
	$ChapterY=125;

	$ChapterBottomCount=$ChapterBottom+1;
	if($ChapterBottomCount>18){$ChapterBottomCount=1;}
	$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
	$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
	Move($ChapterBottomTexA, 0, @0, 341, null, false);
	Move($ChapterBottomTexB, 0, @0, 341, null, true);

	$ChapterBottomCount=$ChapterBottomCount+1;
	if($ChapterBottomCount>18){$ChapterBottomCount=1;}
	$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
	$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
	Move($ChapterBottomTexA, 0, @0, 341, null, false);
	Move($ChapterBottomTexB, 0, @0, 341, null, true);

	$ChapterTopCount=$ChapterTop;
	$ChapterTopNum=1;
	while($ChapterTopNum<=5){
		$ChapterTopTexA=String("@タイトル章%02d*",$ChapterTopCount);
		$ChapterTopTexB=String("@タイトル章%02d/*/*",$ChapterTopCount);

		if($ChapterTopNum==1){
			$ChapterTopNum01_TexA=$ChapterTopTexA;
			$ChapterTopNum01_TexB=$ChapterTopTexB;
			$ChapterTopNum01_Y=$ChapterY;
		}else if($ChapterTopNum==2){
			$ChapterTopNum02_TexA=$ChapterTopTexA;
			$ChapterTopNum02_TexB=$ChapterTopTexB;
			$ChapterTopNum02_Y=$ChapterY;
		}else if($ChapterTopNum==3){
			$ChapterTopNum03_TexA=$ChapterTopTexA;
			$ChapterTopNum03_TexB=$ChapterTopTexB;
			$ChapterTopNum03_Y=$ChapterY;
		}else if($ChapterTopNum==4){
			$ChapterTopNum04_TexA=$ChapterTopTexA;
			$ChapterTopNum04_TexB=$ChapterTopTexB;
			$ChapterTopNum04_Y=$ChapterY;
		}else if($ChapterTopNum==5){
			$ChapterTopNum05_TexA=$ChapterTopTexA;
			$ChapterTopNum05_TexB=$ChapterTopTexB;
			$ChapterTopNum05_Y=$ChapterY;
		}

		$ChapterTopCount++;
		$ChapterTopNum++;
		$ChapterY=$ChapterY+43;
		if($ChapterTopCount>18){
			$ChapterTopCount=1;
		}
	}

//	Fade("@タイトル章*/MouseOver/*", 0, 0, null, false);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Move($ChapterTopNum01_TexA, $ChapterMove, @0, $ChapterTopNum01_Y, null, false);
	Move($ChapterTopNum01_TexB, $ChapterMove, @0, $ChapterTopNum01_Y, null, false);
	Move($ChapterTopNum02_TexA, $ChapterMove, @0, $ChapterTopNum02_Y, null, false);
	Move($ChapterTopNum02_TexB, $ChapterMove, @0, $ChapterTopNum02_Y, null, false);
	Move($ChapterTopNum03_TexA, $ChapterMove, @0, $ChapterTopNum03_Y, null, false);
	Move($ChapterTopNum03_TexB, $ChapterMove, @0, $ChapterTopNum03_Y, null, false);
	Move($ChapterTopNum04_TexA, $ChapterMove, @0, $ChapterTopNum04_Y, null, false);
	Move($ChapterTopNum04_TexB, $ChapterMove, @0, $ChapterTopNum04_Y, null, false);
	Move($ChapterTopNum05_TexA, $ChapterMove, @0, $ChapterTopNum05_Y, null, false);
	Move($ChapterTopNum05_TexB, $ChapterMove, @0, $ChapterTopNum05_Y, null, true);

	$ChapterTop++;
	$ChapterBottom++;
	if($ChapterTop>18){$ChapterTop=1;}
	if($ChapterBottom>18){$ChapterBottom=1;}

	Request("タイトル背景プロセス", Start);
}


function ChapterBackStart()
{
	$FlashFade = 0;
	Request("タイトル背景プロセス", Stop);

	//★★★★ロック
	XBOX360_LockVideo(true);

	$ChapterMove=24;
	$ChapterY=341;

	$ChapterTopCount=$ChapterTop-1;
	if($ChapterTopCount<1){$ChapterTopCount=18;}
	$ChapterTopTexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopTexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	Move($ChapterTopTexA, 0, @0, 125, null, false);
	Move($ChapterTopTexB, 0, @0, 125, null, true);

	$ChapterTopCount=$ChapterTopCount-1;
	if($ChapterTopCount<1){$ChapterTopCount=18;}
	$ChapterTopTexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopTexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	Move($ChapterTopTexA, 0, @0, 125, null, false);
	Move($ChapterTopTexB, 0, @0, 125, null, true);


	$ChapterBottomCount=$ChapterBottom;
	$ChapterBottomNum=1;
	while($ChapterBottomNum<=5){
		$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
		$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);

		if($ChapterBottomNum==1){
			$ChapterBottomNum01_TexA=$ChapterBottomTexA;
			$ChapterBottomNum01_TexB=$ChapterBottomTexB;
			$ChapterBottomNum01_Y=$ChapterY;
		}else if($ChapterBottomNum==2){
			$ChapterBottomNum02_TexA=$ChapterBottomTexA;
			$ChapterBottomNum02_TexB=$ChapterBottomTexB;
			$ChapterBottomNum02_Y=$ChapterY;
		}else if($ChapterBottomNum==3){
			$ChapterBottomNum03_TexA=$ChapterBottomTexA;
			$ChapterBottomNum03_TexB=$ChapterBottomTexB;
			$ChapterBottomNum03_Y=$ChapterY;
		}else if($ChapterBottomNum==4){
			$ChapterBottomNum04_TexA=$ChapterBottomTexA;
			$ChapterBottomNum04_TexB=$ChapterBottomTexB;
			$ChapterBottomNum04_Y=$ChapterY;
		}else if($ChapterBottomNum==5){
			$ChapterBottomNum05_TexA=$ChapterBottomTexA;
			$ChapterBottomNum05_TexB=$ChapterBottomTexB;
			$ChapterBottomNum05_Y=$ChapterY;
		}

		$ChapterBottomCount--;
		$ChapterBottomNum++;
		$ChapterY=$ChapterY-43;
		if($ChapterBottomCount<1){
			$ChapterBottomCount=18;
		}
	}

//	Fade("@タイトル章*/MouseOver/*", 0, 0, null, false);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	Move($ChapterBottomNum01_TexA, $ChapterMove, @0, $ChapterBottomNum01_Y, null, false);
	Move($ChapterBottomNum01_TexB, $ChapterMove, @0, $ChapterBottomNum01_Y, null, false);
	Move($ChapterBottomNum02_TexA, $ChapterMove, @0, $ChapterBottomNum02_Y, null, false);
	Move($ChapterBottomNum02_TexB, $ChapterMove, @0, $ChapterBottomNum02_Y, null, false);
	Move($ChapterBottomNum03_TexA, $ChapterMove, @0, $ChapterBottomNum03_Y, null, false);
	Move($ChapterBottomNum03_TexB, $ChapterMove, @0, $ChapterBottomNum03_Y, null, false);
	Move($ChapterBottomNum04_TexA, $ChapterMove, @0, $ChapterBottomNum04_Y, null, false);
	Move($ChapterBottomNum04_TexB, $ChapterMove, @0, $ChapterBottomNum04_Y, null, false);
	Move($ChapterBottomNum05_TexA, $ChapterMove, @0, $ChapterBottomNum05_Y, null, false);
	Move($ChapterBottomNum05_TexB, $ChapterMove, @0, $ChapterBottomNum05_Y, null, true);

	$ChapterTop--;
	$ChapterBottom--;
	if($ChapterTop<1){$ChapterTop=18;}
	if($ChapterBottom<1){$ChapterBottom=18;}

	Request("タイトル背景プロセス", Start);
}


function ChapterNextStart2()
{
	$FlashFade = 0;
	Request("タイトル背景プロセス", Stop);

	//★★★★ロック
	XBOX360_LockVideo(true);

	$ChapterMove=0;
	$ChapterY=125;

	$ChapterBottomCount=$ChapterBottom+1;
	if($ChapterBottomCount>18){$ChapterBottomCount=1;}
	$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
	$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
	Move($ChapterBottomTexA, 0, @0, 341, null, false);
	Move($ChapterBottomTexB, 0, @0, 341, null, true);

	$ChapterBottomCount=$ChapterBottomCount+1;
	if($ChapterBottomCount>18){$ChapterBottomCount=1;}
	$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
	$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
	Move($ChapterBottomTexA, 0, @0, 341, null, false);
	Move($ChapterBottomTexB, 0, @0, 341, null, true);

	$ChapterTopCount=$ChapterTop;
	$ChapterTopNum=1;
	while($ChapterTopNum<=5){
		$ChapterTopTexA=String("@タイトル章%02d*",$ChapterTopCount);
		$ChapterTopTexB=String("@タイトル章%02d/*/*",$ChapterTopCount);

		if($ChapterTopNum==1){
			$ChapterTopNum01_TexA=$ChapterTopTexA;
			$ChapterTopNum01_TexB=$ChapterTopTexB;
			$ChapterTopNum01_Y=$ChapterY;
		}else if($ChapterTopNum==2){
			$ChapterTopNum02_TexA=$ChapterTopTexA;
			$ChapterTopNum02_TexB=$ChapterTopTexB;
			$ChapterTopNum02_Y=$ChapterY;
		}else if($ChapterTopNum==3){
			$ChapterTopNum03_TexA=$ChapterTopTexA;
			$ChapterTopNum03_TexB=$ChapterTopTexB;
			$ChapterTopNum03_Y=$ChapterY;
		}else if($ChapterTopNum==4){
			$ChapterTopNum04_TexA=$ChapterTopTexA;
			$ChapterTopNum04_TexB=$ChapterTopTexB;
			$ChapterTopNum04_Y=$ChapterY;
		}else if($ChapterTopNum==5){
			$ChapterTopNum05_TexA=$ChapterTopTexA;
			$ChapterTopNum05_TexB=$ChapterTopTexB;
			$ChapterTopNum05_Y=$ChapterY;
		}

		$ChapterTopCount++;
		$ChapterTopNum++;
		$ChapterY=$ChapterY+43;
		if($ChapterTopCount>18){
			$ChapterTopCount=1;
		}
	}

	Move($ChapterTopNum01_TexA, $ChapterMove, @0, $ChapterTopNum01_Y, null, false);
	Move($ChapterTopNum01_TexB, $ChapterMove, @0, $ChapterTopNum01_Y, null, false);
	Move($ChapterTopNum02_TexA, $ChapterMove, @0, $ChapterTopNum02_Y, null, false);
	Move($ChapterTopNum02_TexB, $ChapterMove, @0, $ChapterTopNum02_Y, null, false);
	Move($ChapterTopNum03_TexA, $ChapterMove, @0, $ChapterTopNum03_Y, null, false);
	Move($ChapterTopNum03_TexB, $ChapterMove, @0, $ChapterTopNum03_Y, null, false);
	Move($ChapterTopNum04_TexA, $ChapterMove, @0, $ChapterTopNum04_Y, null, false);
	Move($ChapterTopNum04_TexB, $ChapterMove, @0, $ChapterTopNum04_Y, null, false);
	Move($ChapterTopNum05_TexA, $ChapterMove, @0, $ChapterTopNum05_Y, null, false);
	Move($ChapterTopNum05_TexB, $ChapterMove, @0, $ChapterTopNum05_Y, null, false);

	$ChapterTop++;
	$ChapterBottom++;
	if($ChapterTop>18){$ChapterTop=1;}
	if($ChapterBottom>18){$ChapterBottom=1;}

	Fade("@タイトル章*/MouseOver/*", 0, 0, null, false);
	Move("タイトル章オーバー", 0, 59, 298, null, false);

	//★★★★アンロック
	XBOX360_LockVideo(false);
	Request("タイトル背景プロセス", Start);
}


function ChapterBackStart2()
{
	$FlashFade = 0;
	Request("タイトル背景プロセス", Stop);

	//★★★★ロック
	XBOX360_LockVideo(true);

	$ChapterMove=0;
	$ChapterY=341;

	$ChapterTopCount=$ChapterTop-1;
	if($ChapterTopCount<1){$ChapterTopCount=18;}
	$ChapterTopTexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopTexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	Move($ChapterTopTexA, 0, @0, 125, null, false);
	Move($ChapterTopTexB, 0, @0, 125, null, true);

	$ChapterTopCount=$ChapterTopCount-1;
	if($ChapterTopCount<1){$ChapterTopCount=18;}
	$ChapterTopTexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopTexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	Move($ChapterTopTexA, 0, @0, 125, null, false);
	Move($ChapterTopTexB, 0, @0, 125, null, true);


	$ChapterBottomCount=$ChapterBottom;
	$ChapterBottomNum=1;
	while($ChapterBottomNum<=5){
		$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
		$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);

		if($ChapterBottomNum==1){
			$ChapterBottomNum01_TexA=$ChapterBottomTexA;
			$ChapterBottomNum01_TexB=$ChapterBottomTexB;
			$ChapterBottomNum01_Y=$ChapterY;
		}else if($ChapterBottomNum==2){
			$ChapterBottomNum02_TexA=$ChapterBottomTexA;
			$ChapterBottomNum02_TexB=$ChapterBottomTexB;
			$ChapterBottomNum02_Y=$ChapterY;
		}else if($ChapterBottomNum==3){
			$ChapterBottomNum03_TexA=$ChapterBottomTexA;
			$ChapterBottomNum03_TexB=$ChapterBottomTexB;
			$ChapterBottomNum03_Y=$ChapterY;
		}else if($ChapterBottomNum==4){
			$ChapterBottomNum04_TexA=$ChapterBottomTexA;
			$ChapterBottomNum04_TexB=$ChapterBottomTexB;
			$ChapterBottomNum04_Y=$ChapterY;
		}else if($ChapterBottomNum==5){
			$ChapterBottomNum05_TexA=$ChapterBottomTexA;
			$ChapterBottomNum05_TexB=$ChapterBottomTexB;
			$ChapterBottomNum05_Y=$ChapterY;
		}

		$ChapterBottomCount--;
		$ChapterBottomNum++;
		$ChapterY=$ChapterY-43;
		if($ChapterBottomCount<1){
			$ChapterBottomCount=14;
		}
	}

	Move($ChapterBottomNum01_TexA, $ChapterMove, @0, $ChapterBottomNum01_Y, null, false);
	Move($ChapterBottomNum01_TexB, $ChapterMove, @0, $ChapterBottomNum01_Y, null, false);
	Move($ChapterBottomNum02_TexA, $ChapterMove, @0, $ChapterBottomNum02_Y, null, false);
	Move($ChapterBottomNum02_TexB, $ChapterMove, @0, $ChapterBottomNum02_Y, null, false);
	Move($ChapterBottomNum03_TexA, $ChapterMove, @0, $ChapterBottomNum03_Y, null, false);
	Move($ChapterBottomNum03_TexB, $ChapterMove, @0, $ChapterBottomNum03_Y, null, false);
	Move($ChapterBottomNum04_TexA, $ChapterMove, @0, $ChapterBottomNum04_Y, null, false);
	Move($ChapterBottomNum04_TexB, $ChapterMove, @0, $ChapterBottomNum04_Y, null, false);
	Move($ChapterBottomNum05_TexA, $ChapterMove, @0, $ChapterBottomNum05_Y, null, false);
	Move($ChapterBottomNum05_TexB, $ChapterMove, @0, $ChapterBottomNum05_Y, null, false);

	$ChapterTop--;
	$ChapterBottom--;
	if($ChapterTop<1){$ChapterTop=18;}
	if($ChapterBottom<1){$ChapterBottom=18;}

	Fade("@タイトル章*/MouseOver/*", 0, 0, null, false);
	Move("タイトル章オーバー", 0, 59, 168, null, false);

	//★★★★アンロック
	XBOX360_LockVideo(false);
	Request("タイトル背景プロセス", Start);
}













//=============================================================================//
..//■セレクト■
//=============================================================================//
function TitleSelect()
{
	while($TitleSelect == 0)
	{
		select
		{
			case タイトル開始{
				CreateSE("タイトル選択サウンド","SE_衝撃_衝撃音01");
				Request("タイトル選択サウンド", Lock);
				CreateSE("タイトル選択サウンド２","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
				Request("タイトル選択サウンド２", Lock);

				SoundPlay("タイトル選択サウンド",0,1000,false);
				SetVolume360("@CH*", 1000, 0, NULL);
				SetVolume360("@ch*", 3000, 0, NULL);

				AllPause();
				Fade("タイトル開始/MouseClick/タイトル開始３",300,0,null,true);

				$FlashFade = 0;
				Request("タイトル背景プロセス", Stop);

				//★★★★ロック
				XBOX360_LockVideo(true);
				CreateTexture("タイトルブラー１", 1000, 0, 0, "SCREEN");
				Fade("タイトルカラー", 0, 1000, null, true);
				CreateMovie360("タイトルムービー", 1000, Center, Middle, true, false, "dx/mv砂嵐.avi");
				Fade("タイトルムービー", 0, 0, null, true);
				CreateColor("タイトルカラー２", 1000, 0, 0, 1280, 720, "BLACK");
				Fade("タイトルカラー２", 0, 0, null, true);
				//★★★★アンロック
				XBOX360_LockVideo(false);

				SoundPlay("タイトル選択サウンド２",1000,300,true);

				DrawTransition("タイトルブラー１", 1000, 1000, 0, 100, null, "cg/data/モザイク.png", false);
				Fade("タイトルムービー", 1000, 1000, null, 500);
				Fade("タイトルカラー２", 1500, 1000, null, true);
	
				$TitleSelect = 1;
			}case タイトル読込{
				AllPause();
//				Fade("タイトル読込/MouseClick/タイトル読込３",300,0,null,true);

				//★ダイアログ：サインイン確認
				$DialogCautionSignIn_Flag=false;
				if(Platform()==100){
					if(XBOX360_IsSignin()){
						if(XBOX360_CheckStorage()){
							$DialogCautionSignIn_Flag=false;
						}else{
							DialogCautionLoad();
							$DialogCautionSignIn_Flag=true;
						}
					}else{
						DialogCautionSignIn();
						$DialogCautionSignIn_Flag=true;
					}
				}

				if(!$DialogCautionSignIn_Flag){
					TitleSelect2();
					MoveCursor(372,124);
				}else{
					$TitleSelect = 0;
				}
			}case タイトル設定{
				CreateSE("タイトル選択サウンド","SE_擬音_YESNO選択_クリック");
				SoundPlay("タイトル選択サウンド",0,1000,false);

				AllPause();
				Fade("タイトル設定/MouseClick/タイトル設定３",300,0,null,true);

				$FlashFade = 0;
				Request("タイトル背景プロセス", Stop);

				CreateTexture("タイトルブラー１", 200, 0, 0, "SCREEN");
				CreateTexture("タイトルブラー２", 200, 0, 0, "SCREEN");

				Move("タイトルブラー１", 300, @-30, @0, null, false);
				Move("タイトルブラー２", 300, @30, @0, null, false);
				Fade("タイトルブラー１", 300, 0, null, false);
				Fade("タイトルブラー２", 300, 0, null, false);
				Fade("タイトルカラー", 300, 1000, null, true);

				$SYSTEM_XBOX360_rich_presence_mode=2;
				XBOX360_Presence(2);
				$Title_Config=true;
				call_chapter nss/sys_config.nss;
				$Title_Config=false;
				$SYSTEM_XBOX360_rich_presence_mode=1;
				XBOX360_Presence(1);
				MoveCursor(360,144);

				CreateSE("タイトル選択サウンド","SE_擬音_YESNO選択_IN");
				SoundPlay("タイトル選択サウンド",0,1000,false);

				Move("タイトルブラー１", 1000, @30, @0, null, false);
				Move("タイトルブラー２", 1000, @-30, @0, null, false);
				Fade("タイトルブラー１", 1000, 1000, null, false);
				Fade("タイトルブラー２", 1000, 1000, null, false);
				Fade("タイトルカラー",1000,0,null,true);
				Delete("タイトルブラー*");

				Request("タイトル背景プロセス", Start);
			}case タイトル特別{
				CreateSE("タイトル選択サウンド","SE_擬音_YESNO選択_クリック");
				Request("タイトル選択サウンド", Lock);
				SoundPlay("タイトル選択サウンド",0,1000,false);
				SetVolume360("CH*", 1000, 0, NULL);
				SetVolume360("chn*", 1000, 0, NULL);

				AllPause();
				Fade("タイトル特別/MouseClick/タイトル特別３",300,0,null,true);

				$FlashFade = 0;
				Request("タイトル背景プロセス", Stop);

				CreateTexture("タイトルブラー１", 200, 0, 0, "SCREEN");

				Zoom("タイトルブラー１", 500, 1100, 1100, null, false);
				Fade("タイトルブラー１", 500, 0, null, false);
				Fade("タイトルカラー", 500, 1000, null, true);

				$TitleSelect = 2;
			}case タイトル出口{
//				Fade("タイトル出口/MouseClick/タイトル出口３",300,0,null,true);
				CreateSE("SE01","SE_擬音_妄そうOUT");
				SoundPlay("SE01", 0, 1000, false);
				CreateColor("BLACK",1111999,center,middle,32,32,BLACK);
				Zoom("BLACK",0,100000,100000,null,false);
				CreateMovie360("妄想out", 21000, Center, Middle, false, false, "dx/mvout.avi");
//				Request("妄想out", Play);
				WaitAction("妄想out", null);

				$Title_Exit = 1;
				call_chapter nss/sys_close.nss;

//				$Title_Exit = 0;

//				CreateSE("タイトル選択サウンド","SE_擬音_YESNO選択_IN");
//				SoundPlay("タイトル選択サウンド",0,1000,false);
			}case タイトル青空{
				CreateSE("タイトル選択サウンド","SE_衝撃_衝撃音01");
				Request("タイトル選択サウンド", Lock);
//				CreateSE("タイトル選択サウンド２","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
//				Request("タイトル選択サウンド２", Lock);

				SoundPlay("タイトル選択サウンド",0,1000,false);
				SetVolume360("@CH*", 10, 0, NULL);
				SetVolume360("@ch*", 10, 0, NULL);

				$FlashFade = 0;
				Request("タイトル背景プロセス", Stop);

				AllPause();
				Fade("タイトル青空/MouseClick/タイトル青空３",300,0,null,true);

				//★★★★ロック
				XBOX360_LockVideo(true);
				CreateTexture("タイトルブラー１", 1000, 0, 0, "SCREEN");
				CreateTexture("タイトル１", 500, 0, 0, "タイトルイメージ２");
//				CreateTexture("タイトル２", 500, 0, 0, "cg/sys/title/title-sky/Title-back.png");
//				CreateTexture("タイトル２", 500, 0, 0, "cg/bg/bg002_01_1_青空_a.jpg");
				CreateTexture("タイトル２", 500, 0, 0, "cg/bg/bg209_01_5_曇り空_a.jpg");
				CreateMovie360("タイトルムービー", 1000, Center, Middle, true, false, "dx/mv雨01.avi");
				Request("タイトルムービー", AddRender);

//				Request("タイトル２", AddRender);

				Fade("*", 0, 0, null, false);
				Fade("*/*", 0, 0, null, false);
				Fade("*/*/*", 0, 0, null, false);
				Fade("*/*/*/*", 0, 0, null, false);
				Fade("タイトルブラー１", 0, 1000, null, false);
				Fade("タイトル１", 0, 1000, null, true);
				//★★★★アンロック
				XBOX360_LockVideo(false);

				Fade("タイトルブラー１", 2000, 0, null, true);

//				CreateTexture("タイトルブラー１", 1000, 0, 0, "SCREEN");
//				Fade("タイトルカラー", 0, 1000, null, true);
//				CreateMovie360("タイトルムービー", 1000, Center, Middle, true, false, "dx/mv砂嵐.avi");
//				Fade("タイトルムービー", 0, 0, null, true);
//				CreateColor("タイトルカラー２", 1000, 0, 0, 1280, 720, "BLACK");
//				Fade("タイトルカラー２", 0, 0, null, true);

//				SoundPlay("タイトル選択サウンド２",1000,300,true);

//				DrawTransition("タイトルブラー１", 1000, 1000, 0, 100, null, "cg/data/モザイク.png", false);
//				Fade("タイトルムービー", 1000, 1000, null, 500);
//				Fade("タイトルカラー２", 1500, 1000, null, true);

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
//				Wait(1000);
				$TitleSelect = 5;
			}

			if(#DebugMode)
			{
				case タイトル戸口:
				{
					CreateSE("タイトル選択サウンド","SE_擬音_YESNO選択_クリック");
					SoundPlay("タイトル選択サウンド",0,1000,false);
	
					AllPause();
					Fade("タイトル戸口/MouseClick/タイトル戸口３",300,0,null,true);
	
					$FlashFade = 0;
					Request("タイトル背景プロセス", Stop);

					CreateTexture("タイトルブラー１", 200, 0, 0, "SCREEN");
					CreateTexture("タイトルブラー２", 200, 0, 0, "SCREEN");
	
					Move("タイトルブラー１", 300, @-24, @0, null, false);
					Move("タイトルブラー２", 300, @24, @0, null, false);
					Fade("タイトルブラー１", 300, 0, null, false);
					Fade("タイトルブラー２", 300, 0, null, false);
					Fade("タイトルカラー", 300, 1000, null, true);
	
					TitleSelectionChapter();


					if($GameName==0){
						CreateSE("タイトル選択サウンド","SE_擬音_YESNO選択_IN");
						SoundPlay("タイトル選択サウンド",0,1000,false);
		
						Move("タイトルブラー１", 1000, @30, @0, null, false);
						Move("タイトルブラー２", 1000, @-30, @0, null, false);
						Fade("タイトルブラー１", 1000, 1000, null, false);
						Fade("タイトルブラー２", 1000, 1000, null, false);
						Fade("タイトルカラー",1000,0,null,true);
						Delete("タイトルブラー*");
		
						Request("タイトル背景プロセス", Start);
					}else{
						Fade("タイトルカラー", 300, 0, null, true);

						CreateSE("タイトル選択サウンド","SE_衝撃_衝撃音01");
						Request("タイトル選択サウンド", Lock);
						CreateSE("タイトル選択サウンド２","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
						Request("タイトル選択サウンド２", Lock);
			
						SoundPlay("タイトル選択サウンド",0,1000,false);
						SetVolume360("CH*", 1000, 0, NULL);
						SetVolume360("chn*", 1000, 0, NULL);

						//★★★★ロック
						XBOX360_LockVideo(true);
						CreateTexture("タイトルブラー１", 10000, 0, 0, "SCREEN");
						Fade("タイトルカラー", 0, 1000, null, true);
						CreateMovie360("タイトルムービー", 10000, Center, Middle, true, false, "dx/mv砂嵐.avi");
						Zoom("タイトルムービー", 0, 1600, 1600, null, false);
						Fade("タイトルムービー", 0, 0, null, true);
						CreateColor("タイトルカラー２", 10000, 0, 0, 1280, 720, "BLACK");
						Fade("タイトルカラー２", 0, 0, null, true);

						Fade("すくりーん", 0, 0, null, true);

						//★★★★アンロック
						XBOX360_LockVideo(false);

						SoundPlay("タイトル選択サウンド２",1000,300,true);

						DrawTransition("タイトルブラー１", 1000, 1000, 0, 100, null, "cg/data/モザイク.png", false);
						Fade("タイトルムービー", 1000, 1000, null, false);
						Fade("タイトルカラー２", 1000, 1000, null, true);
			
						$TitleSelect = 3;
					}
				}
			}
		}
	}

}//============================================================================//




//=============================================================================//
..//■セレクト２■
//=============================================================================//
function TitleSelect2()
{
	Fade("タイトルウィンドウ１/ベース２", 0, 1000, null, true);

	Move("タイトルウィンドウ１", 100, @-110, @0, null, true);
	Move("タイトルウィンドウ１", 100, @0, @-112, null, true);
	Move("タイトルウィンドウ１", 200, @-325, @0, null, 200);

	Fade("タイトル読込/MouseClick/タイトル読込３",300,0,null,false);
	Fade("タイトルウィンドウ１/ベース１", 200, 1000, null, false);
	Fade("タイトルウィンドウ１/ベース２", 200, 0, null, false);
	Fade("タイトル目録１", 200, 1000, null, false);
	Fade("タイトル最後１", 200, 1000, null, false);
	Fade("タイトル詩織１", 200, 1000, null, true);

	MoveCursor(152,70);
	Fade("タイトル最後/MouseOver/タイトル最後２", 0, 1000, null, true);

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	$TitleSelect2=true;
	while($TitleSelect2)
	{
		select
		{
			case タイトル最後
			{
				if(!#LATEST_SAVE_NUM){
					DialogLoadLastNo();
				}else{
					$load=true;
					$num=#LATEST_SAVE_NUM;
					DialogLoadCheck();
					if($load){
						DialogLoadLast();
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
						MoveCursor(152,70);
					}
				}
			}

			case タイトル詩織
			{
				CreateSE("タイトル選択サウンド","SE_擬音_YESNO選択_クリック");
				SoundPlay("タイトル選択サウンド",0,1000,false);

				AllPause();
				Fade("タイトル詩織/MouseClick/タイトル詩織３",300,0,null,true);

				$FlashFade = 0;
				Request("タイトル背景プロセス", Stop);

				CreateTexture("タイトルブラー１", 200, 0, 0, "SCREEN");
				CreateTexture("タイトルブラー２", 200, 0, 0, "SCREEN");

				Move("タイトルブラー１", 300, @-30, @0, null, false);
				Move("タイトルブラー２", 300, @30, @0, null, false);
				Fade("タイトルブラー１", 300, 0, null, false);
				Fade("タイトルブラー２", 300, 0, null, false);
				Fade("タイトルカラー", 300, 1000, null, true);

				$load=false;
				call_chapter nss/sys_load.nss;
				if(Platform()==100){
					if($load){
						Delete("*");
						StartUnLoad();
						//MenuLoad();
						MoveCursor(0,0);
						Load($num);
					}
				}
				MoveCursor(152,100);

				CreateSE("タイトル選択サウンド","SE_擬音_YESNO選択_IN");
				SoundPlay("タイトル選択サウンド",0,1000,false);

				Move("タイトルブラー１", 1000, @30, @0, null, false);
				Move("タイトルブラー２", 1000, @-30, @0, null, false);
				Fade("タイトルブラー１", 1000, 1000, null, false);
				Fade("タイトルブラー２", 1000, 1000, null, false);
				Fade("タイトルカラー",1000,0,null,true);
				Delete("タイトルブラー*");

				Request("タイトル背景プロセス", Start);
			}

			case タイトル目録
			{
				if(#ClearG){
					TitleSelect3();
					MoveCursor(152,116);
				}
			}

			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$TitleSelect2=false;break;}
		}
	}

	Fade("タイトル読込/MouseClick/タイトル読込３",200,1000,null,false);
	Fade("タイトルウィンドウ１/ベース１", 200, 0, null, false);
	Fade("タイトルウィンドウ１/ベース２", 200, 1000, null, false);
	Fade("タイトル目録/*/*", 200, 0, null, false);
	Fade("タイトル最後/*/*", 200, 0, null, false);
	Fade("タイトル詩織/*/*", 200, 0, null, false);
	Fade("タイトル目録１", 200, 0, null, false);
	Fade("タイトル最後１", 200, 0, null, false);
	Fade("タイトル詩織１", 200, 0, null, true);

	Move("タイトルウィンドウ１", 200, @325, @0, null, true);
	Move("タイトルウィンドウ１", 100, @0, @112, null, true);
	Move("タイトルウィンドウ１", 100, @110, @0, null, true);

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
}//============================================================================//


//=============================================================================//
..//■セレクト３■
//=============================================================================//
function TitleSelect3()
{
	Fade("タイトル目録/MouseClick/タイトル目録３",0,1000,null,true);

	Move("タイトル章オーバー", 0, 60, 210, null, false);
	Fade("タイトルウィンドウ２/ベース１",0,1000,null,true);
	Move("タイトルウィンドウ２/ベース１", 300, @0, @240, null, true);

	Fade("タイトル章オーバー", 200, 1000, null, false);
	Move("タイトルウィンドウ２", 200, @0, @-8, null, false);
	Fade("タイトル目録/MouseClick/タイトル目録３",200,0,null,false);
	Fade("@タイトル章*", 200, 1000, null, true);

	$ChapterBackStart_Flag=false;
	$ChapterNextStart_Flag=false;

	$TitleChapterNum=0;

	MoveCursor(152,189);
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	$SYSTEM_XBOX360_button_left_down=false;$SYSTEM_XBOX360_button_right_down=false;
	$SYSTEM_XBOX360_button_up_down=false;$SYSTEM_XBOX360_button_down_down=false;
	$TitleSelect3=true;
	while($TitleSelect3)
	{
		select
		{
			CursorPosition($CsrX,$CsrY);

			if(Platform()==100){
				if($SYSTEM_XBOX360_button_up_down||$SYSTEM_XBOX360_button_left_down){
					break;
				}else if($SYSTEM_XBOX360_button_down_down||$SYSTEM_XBOX360_button_right_down){
					break;
				}
			}else{
				if($CsrX<=160&&$CsrX>=144&&$CsrY<=152&&$CsrY>=136){
					$ChapterBackStart_Flag=true;
					break;
				}else if($CsrX<=160&&$CsrX>=144&&$CsrY<=368&&$CsrY>=352){
					$ChapterNextStart_Flag=true;
					break;
				}
			}

			case @タイトル章01{
				#TitleChapterNum=1;
				TitleChapterLoad();
			}case @タイトル章02{
				#TitleChapterNum=2;
				TitleChapterLoad();
			}case @タイトル章03{
				#TitleChapterNum=3;
				TitleChapterLoad();
			}case @タイトル章04{
				#TitleChapterNum=4;
				TitleChapterLoad();
			}case @タイトル章05{
				#TitleChapterNum=5;
				TitleChapterLoad();
			}case @タイトル章06{
				#TitleChapterNum=6;
				TitleChapterLoad();
			}case @タイトル章07{
				#TitleChapterNum=7;
				TitleChapterLoad();
			}case @タイトル章08{
				#TitleChapterNum=8;
				TitleChapterLoad();
			}case @タイトル章09{
				#TitleChapterNum=9;
				TitleChapterLoad();
			}case @タイトル章10{
				#TitleChapterNum=10;
				TitleChapterLoad();
			}case @タイトル章11{
				#TitleChapterNum=11;
				TitleChapterLoad();
			}case @タイトル章12{
				#TitleChapterNum=12;
				TitleChapterLoad();
			}case @タイトル章13{
				#TitleChapterNum=13;
				TitleChapterLoad();
			}case @タイトル章14{
				#TitleChapterNum=14;
				TitleChapterLoad();
			}case @タイトル章15{
				#TitleChapterNum=15;
				TitleChapterLoad();
			}case @タイトル章16{
				#TitleChapterNum=16;
				TitleChapterLoad();
			}case @タイトル章17{
				#TitleChapterNum=17;
				TitleChapterLoad();
			}case @タイトル章18{
				#TitleChapterNum=18;
				TitleChapterLoad();
			}
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){$TitleSelect3=false;break;}
		}

		if(Platform()==100){
			//▽廻す
			ChapterMoveStart();
		}else{
			if($ChapterBackStart_Flag){
				ChapterBackStart();
				MoveCursor(152,189);
			}else if($ChapterNextStart_Flag){
				ChapterNextStart();
				MoveCursor(152,320);
			}
		}

		$SYSTEM_XBOX360_button_left_down=false;$SYSTEM_XBOX360_button_right_down=false;
		$SYSTEM_XBOX360_button_up_down=false;$SYSTEM_XBOX360_button_down_down=false;

		$ChapterBackStart_Flag=false;
		$ChapterNextStart_Flag=false;
	}

	Move("タイトルウィンドウ２", 200, @0, @8, null, false);
	Fade("タイトル章オーバー", 200, 0, null, false);
	Fade("@タイトル章*/*/*", 200, 0, null, false);
	Fade("@タイトル章*", 200, 0, null, false);
	Fade("タイトル目録/MouseClick/タイトル目録３",200,1000,null,true);

	Move("タイトルウィンドウ２/ベース１", 300, @0, @-240, null, true);
	Fade("タイトルウィンドウ２/ベース１",0,0,null,true);

	Fade("タイトル目録/MouseClick/タイトル目録３",200,0,null,false);

	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
}//============================================================================//


function TitleChapterLoad()
{
	$load=true;

	if(#TitleChapterNum==10&&!#ClearRouteA){
		$load=false;
	}else if(#TitleChapterNum==11&&!#ClearRouteB){
		$load=false;
	}else if(#TitleChapterNum==12&&!#ClearPieceR){
		$load=false;
	}else if(#TitleChapterNum==13&&!#ClearPieceS){
		$load=false;
	}else if(#TitleChapterNum==14&&!#ClearPieceY){
		$load=false;
	}else if(#TitleChapterNum==15&&!#ClearPieceK){
		$load=false;
	}else if(#TitleChapterNum==16&&!#ClearPieceA){
		$load=false;
	}else if(#TitleChapterNum==17&&!#ClearPieceN){
		$load=false;
	}else if(#TitleChapterNum==18&&!#ClearFinal){
		$load=false;
	}
	if($load){
		DialogLoadChapter();
	}
}


function ChapterMoveStart()
{
	//★★★★ロック
	XBOX360_LockVideo(true);
	if($CsrX<=300&&$CsrX>=70&&$CsrY<=260&&$CsrY>=210){
	//▽１項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(152,146);//0
			Move("タイトル章オーバー", 0, 74, 210, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(152,146);//0
			Move("タイトル章オーバー", 0, 74, 210, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(152,232);//2
			Move("タイトル章オーバー", 0, 74, 264, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(152,232);//2
			Move("タイトル章オーバー", 0, 74, 264, null, false);
		}
	}else if($CsrX<=300&&$CsrX>=70&&$CsrY<=313&&$CsrY>=264){
	//▽２項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(152,189);//1
			Move("タイトル章オーバー", 0, 74, 210, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(152,189);//1
			Move("タイトル章オーバー", 0, 74, 210, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(152,276);//3
			Move("タイトル章オーバー", 0, 74, 318, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(152,276);//3
			Move("タイトル章オーバー", 0, 74, 318, null, false);
		}
	}else if($CsrX<=300&&$CsrX>=70&&$CsrY<=367&&$CsrY>=320){
	//▽３項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(152,232);//2
			Move("タイトル章オーバー", 0, 74, 264, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(152,232);//2
			Move("タイトル章オーバー", 0, 74, 264, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(152,320);//4
			Move("タイトル章オーバー", 0, 74, 372, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(152,320);//4
			Move("タイトル章オーバー", 0, 74, 372, null, false);
		}
	}else if($CsrX<=300&&$CsrX>=70&&$CsrY<=424&&$CsrY>=373){
	//▽４項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(152,276);//3
			Move("タイトル章オーバー", 0, 74, 318, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(152,276);//3
			Move("タイトル章オーバー", 0, 74, 318, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(152,362);//5
			Move("タイトル章オーバー", 0, 74, 372, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(152,362);//5
			Move("タイトル章オーバー", 0, 74, 372, null, false);
		}
	}
	//★★★★アンロック
	XBOX360_LockVideo(false);

	CursorPosition($CsrX,$CsrY);
	if($CsrX<=200&&$CsrX>=180&&$CsrY<=190&&$CsrY>=170){
		ChapterBackStart();
		while($SYSTEM_XBOX360_button_up_down||$SYSTEM_XBOX360_button_left_down){
			ChapterBackStart2();
			Wait(50);
		}
		MoveCursor(152,189);
	}else if($CsrX<=200&&$CsrX>=180&&$CsrY<=460&&$CsrY>=440){
		ChapterNextStart();
		while($SYSTEM_XBOX360_button_down_down||$SYSTEM_XBOX360_button_right_down){
			ChapterNextStart2();
			Wait(50);
		}
		MoveCursor(152,320);
	}
}


//=============================================================================//
..//■デバッグ用■
//=============================================================================//
function DebugSound()
{
	$テストナット="@CH08";

	SoundPlay("$テストナット",0,1000,true);
	SetStream("$テストナット", 215000);

	CreateProcess("プロセス１", 150, 0, 0, "DebugSound2");
	WaitKey();
	Request("プロセス１", Start);
	WaitKey();

//	BGMPlay360("CH02",0,1000,true);
//	BGMPlay360("CH03",0,1000,true);
//	BGMPlay360("CH04",0,1000,true);
//	BGMPlay360("CH05",0,1000,true);
//	BGMPlay360("CH07",0,1000,true);
//	BGMPlay360("CH08",0,1000,true);
//	BGMPlay360("CH11",0,1000,true);
//	BGMPlay360("CH12",0,1000,true);
//	BGMPlay360("CH14",0,1000,true);
//	BGMPlay360("CH15",0,1000,true);
//	BGMPlay360("CH20",0,1000,true);
//	BGMPlay360("CH22",0,1000,true);
//	BGMPlay360("CH23",0,1000,true);
//	BGMPlay360("CH24",0,1000,true);
//	BGMPlay360("CH25",0,1000,true);
}

function DebugSound2()
{
	while(1)
	{
		$テスト数値=PassageTime("$テストナット");
		CreateText("テキスト１", 200, 50, 50, 700, 500, $テスト数値);
		Request("テキスト１", PushText);
		Wait(5);
	}
}









//=============================================================================//
..//■過去の遺物■
//=============================================================================//
function ChapterNextStart_new()
{
	$ChapterMove=50;
	$ChapterY=156;

	$ChapterBottomCount=$ChapterBottom+1;
	if($ChapterBottomCount>18){$ChapterBottomCount=1;}
	$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
	$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
	Move($ChapterBottomTexA, 0, @0, 426, null, false);
	Move($ChapterBottomTexB, 0, @0, 426, null, true);

	$ChapterBottomCount=$ChapterBottomCount+1;
	if($ChapterBottomCount>18){$ChapterBottomCount=1;}
	$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
	$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
	Move($ChapterBottomTexA, 0, @0, 426, null, false);
	Move($ChapterBottomTexB, 0, @0, 426, null, true);

	$ChapterTopCount=$ChapterTop;
	$ChapterTopNum01_TexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopNum01_TexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	$ChapterTopNum01_Y=$ChapterY;

	$ChapterTopCount++;
	if($ChapterTopCount>18){$ChapterTopCount=1;}
	$ChapterTopNum02_TexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopNum02_TexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	$ChapterTopNum02_Y=$ChapterY+54;

	$ChapterTopCount++;
	if($ChapterTopCount>18){$ChapterTopCount=1;}
	$ChapterTopNum03_TexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopNum03_TexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	$ChapterTopNum03_Y=$ChapterY+108;

	$ChapterTopCount++;
	if($ChapterTopCount>18){$ChapterTopCount=1;}
	$ChapterTopNum04_TexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopNum04_TexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	$ChapterTopNum04_Y=$ChapterY+162;

	$ChapterTopCount++;
	if($ChapterTopCount>18){$ChapterTopCount=1;}
	$ChapterTopNum05_TexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopNum05_TexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	$ChapterTopNum05_Y=$ChapterY+216;

	Move($ChapterTopNum01_TexA, $ChapterMove, @0, $ChapterTopNum01_Y, null, false);
	Move($ChapterTopNum01_TexB, $ChapterMove, @0, $ChapterTopNum01_Y, null, false);
	Move($ChapterTopNum02_TexA, $ChapterMove, @0, $ChapterTopNum02_Y, null, false);
	Move($ChapterTopNum02_TexB, $ChapterMove, @0, $ChapterTopNum02_Y, null, false);
	Move($ChapterTopNum03_TexA, $ChapterMove, @0, $ChapterTopNum03_Y, null, false);
	Move($ChapterTopNum03_TexB, $ChapterMove, @0, $ChapterTopNum03_Y, null, false);
	Move($ChapterTopNum04_TexA, $ChapterMove, @0, $ChapterTopNum04_Y, null, false);
	Move($ChapterTopNum04_TexB, $ChapterMove, @0, $ChapterTopNum04_Y, null, false);
	Move($ChapterTopNum05_TexA, $ChapterMove, @0, $ChapterTopNum05_Y, null, false);
	Move($ChapterTopNum05_TexB, $ChapterMove, @0, $ChapterTopNum05_Y, null, true);

	$ChapterTop++;
	$ChapterBottom++;
	if($ChapterTop>18){$ChapterTop=1;}
	if($ChapterBottom>18){$ChapterBottom=1;}
}





function ChapterBackStart_old2()
{
	$ChapterMove=0;
	$ChapterY=426;

	$ChapterTopCount=$ChapterTop-1;
	if($ChapterTopCount<1){$ChapterTopCount=18;}
	$ChapterTopTexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopTexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	Move($ChapterTopTexA, 0, @0, 156, null, false);
	Move($ChapterTopTexB, 0, @0, 156, null, true);

	$ChapterBottomCount=$ChapterBottom;
	$ChapterBottomNum=1;
	while($ChapterBottomNum<=18){
		$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
		$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
		Move($ChapterBottomTexA, $ChapterMove, @0, $ChapterY, null, false);
		Move($ChapterBottomTexB, $ChapterMove, @0, $ChapterY, null, false);
		$ChapterBottomCount--;
		$ChapterBottomNum++;
		$ChapterY=$ChapterY-54;
		if($ChapterBottomCount<1){
			$ChapterBottomCount=18;
		}
	}
//	WaitAction("@タイトル章*/*/*", null);

	$ChapterTop--;
	$ChapterBottom--;
	if($ChapterTop<1){$ChapterTop=18;}
	if($ChapterBottom<1){$ChapterBottom=18;}

	MoveCursor(152,189);
}

function ChapterNextStart_old()
{
	MoveCursor(0,0);
	$ChapterMove=0;
	$ChapterY=156;

	$ChapterBottomCount=$ChapterBottom;
	if($ChapterBottomCount>18){$ChapterBottomCount=1;}
	$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
	$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
	Move($ChapterBottomTexA, 0, @0, 426, null, false);
	Move($ChapterBottomTexB, 0, @0, 426, null, true);

	$ChapterTopCount=$ChapterTop;
	$ChapterTopNum=1;
	while($ChapterTopNum<=5){
		$ChapterTopTexA=String("@タイトル章%02d*",$ChapterTopCount);
		$ChapterTopTexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
		Move($ChapterTopTexA, $ChapterMove, @0, $ChapterY, null, false);
		Move($ChapterTopTexB, $ChapterMove, @0, $ChapterY, null, false);
		$ChapterTopCount++;
		$ChapterTopNum++;
		$ChapterY=$ChapterY+54;
		if($ChapterTopCount>18){
			$ChapterTopCount=1;
		}
	}
	WaitAction("@タイトル章*/*/*", null);

	$ChapterTop++;
	$ChapterBottom++;
	if($ChapterTop>18){$ChapterTop=1;}
	if($ChapterBottom>18){$ChapterBottom=1;}

	MoveCursor(152,320);
//	MoveCursor(152,189);
}


function ChapterBackStart_old()
{
	MoveCursor(0,0);
	$ChapterMove=0;
	$ChapterY=426;

	$ChapterTopCount=$ChapterTop-1;
	if($ChapterTopCount<1){$ChapterTopCount=18;}
	$ChapterTopTexA=String("@タイトル章%02d*",$ChapterTopCount);
	$ChapterTopTexB=String("@タイトル章%02d/*/*",$ChapterTopCount);
	Move($ChapterTopTexA, 0, @0, 156, null, false);
	Move($ChapterTopTexB, 0, @0, 156, null, true);

	$ChapterBottomCount=$ChapterBottom;
	$ChapterBottomNum=1;
	while($ChapterBottomNum<=5){
		$ChapterBottomTexA=String("@タイトル章%02d*",$ChapterBottomCount);
		$ChapterBottomTexB=String("@タイトル章%02d/*/*",$ChapterBottomCount);
		Move($ChapterBottomTexA, $ChapterMove, @0, $ChapterY, null, false);
		Move($ChapterBottomTexB, $ChapterMove, @0, $ChapterY, null, false);
		$ChapterBottomCount--;
		$ChapterBottomNum++;
		$ChapterY=$ChapterY-54;
		if($ChapterBottomCount<1){
			$ChapterBottomCount=18;
		}
	}
	WaitAction("@タイトル章*/*/*", null);

	$ChapterTop--;
	$ChapterBottom--;
	if($ChapterTop<1){$ChapterTop=18;}
	if($ChapterBottom<1){$ChapterBottom=18;}

//	MoveCursor(152,320);
	MoveCursor(152,189);
}
