#include "nss/function.nss";
#include "nss/function_system.nss";

//=============================================================================//
//■EXTRA [TIPS]■
//=============================================================================//

chapter main
{
	call_scene @->extra_tips_main;
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
}

scene extra_tips_main
{

	//★定義「ストレージ番号取得」
	FlagCheck();

//フォーカス確認用
//	$SYSTEM_backlog_lock = true;
//	$SYSTEM_menu_lock = true;

	//★★★★ロック
	XBOX360_LockVideo(true);

	CursorPosition($TipPosX,$TipPosY);

	if(!$PLACE_title){
		CreateTexture("エキストラスクリーン", 20000, 0, 0, SCREEN);
		SetAlias("エキストラスクリーン", "エキストラスクリーン");
	}

	TipsClickedClear();

//デバッグ用
/*
	#TIPS_ＭＭＯＲＰＧ=true;
	#TIPS_ＲＭＴ=true;
	#TIPS_ＳＮＳ=true;
	#TIPS_ＰＴＳＤ=true;
	#TIPS_デジャヴ／ジャメヴュ=true;
	#TIPS_アバター=true;
	#TIPS_予知=true;
	#TIPS_キャストオフ=true;
	#TIPS_星来オルジェル=true;
	#TIPS_パラディン=true;
	#TIPS_ギルド=true;
	#TIPS_中２病=true;
	#TIPS_寝オチ=true;
	#TIPS_ＲＯＭ=true;
	#TIPS_ＤＱＮ=true;
	#TIPS_厨=true;
	#TIPS_フルボッコ=true;
	#TIPS_リア充=true;
	#TIPS_死亡フラグ=true;
	#TIPS_ヤンデレ=true;
	#TIPS_空気嫁=true;
	#TIPS_ｋｔｋｒ=true;
	#TIPS_ハンドル名=true;
	#TIPS_うｐ=true;
	#TIPS_パンモロ=true;
	#TIPS_はいてない=true;
	#TIPS_リビドー=true;
	#TIPS_孔明の罠=true;
	#TIPS_ＧＪ=true;
	#TIPS_夢遊病=true;
	#TIPS_千里眼=true;
	#TIPS_ＤＩＤ=true;
	#TIPS_電磁波=true;
	#TIPS_コキュートス=true;
	#TIPS_黒ミサ=true;
	#TIPS_Ｗｉｋｉ=true;
	#TIPS_エクステ=true;
	#TIPS_目の錯覚=true;
	#TIPS_洗脳=true;
	#TIPS_祭り=true;
	#TIPS_儲=true;
	#TIPS_かまいたち現象=true;
	#TIPS_バイオリズム=true;
	#TIPS_劇場型犯罪=true;
	#TIPS_ツンデレ=true;
	#TIPS_ｋｗｓｋ=true;
	#TIPS_百合属性=true;
	#TIPS_神経パルス=true;
	#TIPS_ダウジング=true;
	#TIPS_超能力捜査官=true;
	#TIPS_万有引力=true;
	#TIPS_パンドラの箱=true;
	#TIPS_マグネタイト=true;
	#TIPS_インフォームド・コンセント=true;
	#TIPS_メンヘラ=true;
	#TIPS_転売厨=true;
	#TIPS_脳死=true;
	#TIPS_明和党=true;
	#TIPS_（ｒｙ=true;
	#TIPS_３００人委員会=true;
	#TIPS_沈黙の兵器=true;
	#TIPS_天成神光会=true;
	#TIPS_ドーパミン=true;
	#TIPS_マインドコントロール=true;
	#TIPS_パレイドリア=true;
	#TIPS_ディラックの海=true;
	#TIPS_負の物質=true;
	#TIPS_空孔理論=true;
	#TIPS_素粒子=true;
	#TIPS_対生成=true;
	#TIPS_ニューロン=true;
	#TIPS_シナプス=true;
	#TIPS_心神喪失=true;
	#TIPS_並行世界=true;
	#TIPS_ミレニアム７=true;
	#TIPS_基本相互作用=true;
	#TIPS_Ｅ＝ｍｃ＾２=true;
	#TIPS_ゾンビ=true;
	#TIPS_グラジオール記黙示録詩編=true;
	#TIPS_集団ストーカー=true;
	#TIPS_インプリンティング=true;
	#TIPS_メシア=true;
	#TIPS_永久機関=true;
	#TIPS_ｍｊｄ=true;
	#TIPS_ワクテカ=true;
	#TIPS_オタ芸=true;
	#TIPS_廃人プレイ=true;
	#TIPS_職人=true;
	#TIPS_日本語でおｋ=true;
	#TIPS_高杉=true;
	#TIPS_ゲーム脳=true;
	#TIPS_ペリカ=true;
	#TIPS_燃料投下=true;
	#TIPS_ＡＡ=true;
	#TIPS_オサレ=true;
	#TIPS_サーセン=true;

	#TIPS_ｗ = true;
	#TIPS_スク水 = true;
	#TIPS_オーバーニーソ = true;
	#TIPS_デフォ = true;
	#TIPS_属性 = true;
	#TIPS_漏れ = true;
	#TIPS_もちつけ = true;
	#TIPS_ガクブル = true;
	#TIPS_ノシ = true;
	#TIPS_ソース = true;
	#TIPS_ｕｚｅｅｅｅｅｅｅｅｅｅｅ！ = true;
	#TIPS_きんもーっ☆ = true;
	#TIPS_腐女子 = true;
	#TIPS_黒キャラ = true;
	#TIPS_ｏｒｚ = true;
	#TIPS_スネーク = true;
	#TIPS_香具師 = true;
	#TIPS_人大杉 = true;
	#TIPS_中の人 = true;
	#TIPS_釣り = true;
	#TIPS_ブラクラ = true;
	#TIPS_チート = true;
	#TIPS_霞の構え = true;
	#TIPS_ょぅι゛ょ = true;
	#TIPS_オフ会 = true;
	#TIPS_ゲシュタルト崩壊 = true;
	#TIPS_触手ゲー = true;
	#TIPS_ウォーターボーディング = true;
	#TIPS_安西先生 = true;
	#TIPS_コングロマリット = true;
	#TIPS_スニーキングミッション = true;
	#TIPS_ＮＰＣ = true;
	#TIPS_俺ＴＵＥＥＥプレイ = true;
	#TIPS_ネ申 = true;
	#TIPS_デバッガ = true;
	#TIPS_ＩＣカード = true;
	#TIPS_ストックホルム症候群 = true;
	#ClearG=true;
	#ClearAll=true;
*/

	CreateColor("BLK",2400,Center,Middle,1024,576,BLACK);
	SetAlias("BLK","BLK");
	Fade("BLK", 0, 0, null, true);

	LoadImage("tipbar", "cg/extra/tips/TIP選択表示バー.png");

	CreateTexture("tps_BAK",2000,0,0,"cg/extra/tips/new-TIP-log背景.png");

	$SetPointBackX = 40;
	$SetPointNextX = 136;

	$SetPointY = 520;

..//初期設定ページ（一番最初に開くページ）
	if(!$page){$page=9;}

//	CreateWindow("WND_title",2000,90,90,340,510,false);
	CreateName("WND_title");
	SetAlias("WND_title","WND_title");

	CreateWindow("WND_comment",2000,384,24,544,504,false);
	SetAlias("WND_comment","WND_comment");

	//■定義「ボタン説明」
	DialogButtonON("Button_TIPS");


	if($予備兵装){
		//★★★★アンロック
		XBOX360_LockVideo(false);

		Fade("BAKup", 1500, 1000, null, false);
		Fade("BAKdown", 1500, 1000, null, false);
		Move("BAKup", 600, @0, @+56, null, false);
		Move("BAKdown", 600, @0, @-112, null, false);
	//	Fade("BLK",500,0,null,false);
			Fade("@エキストラスクリーン",500,0,null,false);
			Request("@エキストラスクリーン", Disused);
			//▲描画「ボタン説明」
			DialogButtonFade("Button_TIPS");
		WaitAction("@エキストラスクリーン",null);
	}

	MoveCursor(210,88);

//ＴＩＰＳカウンター
	if($TIPS_on_アバター==true){$page = 1;tips_init($page);$tip_num1=1;$TIPS_CLICKED_1=true;show_tip(1);MoveCursor(263,110);}
	else if($TIPS_on_安西先生==true){$page = 1;tips_init($page);$tip_num2=1;$TIPS_CLICKED_2=true;show_tip(2);MoveCursor(263,142);}
	else if($TIPS_on_インフォームド・コンセント==true){$page = 1;tips_init($page);$tip_num3=1;$TIPS_CLICKED_3=true;show_tip(3);MoveCursor(263,174);}
	else if($TIPS_on_インプリンティング==true){$page = 1;tips_init($page);$tip_num4=1;$TIPS_CLICKED_4=true;show_tip(4);MoveCursor(263,206);}
	else if($TIPS_on_ウォーターボーディング==true){$page = 1;tips_init($page);$tip_num5=1;$TIPS_CLICKED_5=true;show_tip(5);MoveCursor(263,238);}
	else if($TIPS_on_うｐ==true){$page = 1;tips_init($page);$tip_num6=1;$TIPS_CLICKED_6=true;show_tip(6);MoveCursor(263,270);}
	else if($TIPS_on_永久機関==true){$page = 1;tips_init($page);$tip_num7=1;$TIPS_CLICKED_7=true;show_tip(7);MoveCursor(263,302);}
	else if($TIPS_on_エクステ==true){$page = 1;tips_init($page);$tip_num8=1;$TIPS_CLICKED_8=true;show_tip(8);MoveCursor(263,334);}
	else if($TIPS_on_オサレ==true){$page = 1;tips_init($page);$tip_num9=1;$TIPS_CLICKED_9=true;show_tip(9);MoveCursor(263,366);}
	else if($TIPS_on_オタ芸==true){$page = 1;tips_init($page);$tip_num10=1;$TIPS_CLICKED_10=true;show_tip(10);MoveCursor(263,398);}
	else if($TIPS_on_オーバーニーソ==true){$page = 1;tips_init($page);$tip_num11=1;$TIPS_CLICKED_11=true;show_tip(11);MoveCursor(263,430);}
	else if($TIPS_on_オフ会==true){$page = 1;tips_init($page);$tip_num12=1;$TIPS_CLICKED_12=true;show_tip(12);MoveCursor(263,462);}
	else if($TIPS_on_俺ＴＵＥＥＥプレイ==true){$page = 1;tips_init($page);$tip_num13=1;$TIPS_CLICKED_13=true;show_tip(13);MoveCursor(263,494);}
	else if($TIPS_on_ガクブル==true){$page = 1;tips_init($page);$tip_num14=1;$TIPS_CLICKED_14=true;show_tip(14);MoveCursor(263,526);}
	else if($TIPS_on_霞の構え==true){$page = 1;tips_init($page);$tip_num15=1;$TIPS_CLICKED_15=true;show_tip(15);MoveCursor(263,558);}
	else if($TIPS_on_かまいたち現象==true){$page = 1;tips_init($page);$tip_num16=1;$TIPS_CLICKED_16=true;show_tip(16);MoveCursor(263,590);}
	else if($TIPS_on_ネ申==true){$page = 2;tips_init($page);$tip_num1=2;$TIPS_CLICKED_17=true;show_tip(1);MoveCursor(263,110);}
	else if($TIPS_on_基本相互作用==true){$page = 2;tips_init($page);$tip_num2=2;$TIPS_CLICKED_18=true;show_tip(2);MoveCursor(263,142);}
	else if($TIPS_on_キャストオフ==true){$page = 2;tips_init($page);$tip_num3=2;$TIPS_CLICKED_19=true;show_tip(3);MoveCursor(263,174);}
	else if($TIPS_on_ギルド==true){$page = 2;tips_init($page);$tip_num4=2;$TIPS_CLICKED_20=true;show_tip(4);MoveCursor(263,206);}
	else if($TIPS_on_きんもーっ☆==true){$page = 2;tips_init($page);$tip_num5=2;$TIPS_CLICKED_21=true;show_tip(5);MoveCursor(263,238);}
	else if($TIPS_on_空気嫁==true){$page = 2;tips_init($page);$tip_num6=2;$TIPS_CLICKED_22=true;show_tip(6);MoveCursor(263,270);}
	else if($TIPS_on_空孔理論==true){$page = 2;tips_init($page);$tip_num7=2;$TIPS_CLICKED_23=true;show_tip(7);MoveCursor(263,302);}
	else if($TIPS_on_黒キャラ==true){$page = 2;tips_init($page);$tip_num8=2;$TIPS_CLICKED_24=true;show_tip(8);MoveCursor(263,334);}
	else if($TIPS_on_黒ミサ==true){$page = 2;tips_init($page);$tip_num9=2;$TIPS_CLICKED_25=true;show_tip(9);MoveCursor(263,366);}
	else if($TIPS_on_劇場型犯罪==true){$page = 2;tips_init($page);$tip_num10=2;$TIPS_CLICKED_26=true;show_tip(10);MoveCursor(263,398);}
	else if($TIPS_on_グラジオール記黙示録詩編==true){$page = 2;tips_init($page);$tip_num11=2;$TIPS_CLICKED_27=true;show_tip(11);MoveCursor(263,430);}
	else if($TIPS_on_ゲシュタルト崩壊==true){$page = 2;tips_init($page);$tip_num12=2;$TIPS_CLICKED_28=true;show_tip(12);MoveCursor(263,462);}
	else if($TIPS_on_ゲーム脳==true){$page = 2;tips_init($page);$tip_num13=2;$TIPS_CLICKED_29=true;show_tip(13);MoveCursor(263,494);}
	else if($TIPS_on_孔明の罠==true){$page = 2;tips_init($page);$tip_num14=2;$TIPS_CLICKED_30=true;show_tip(14);MoveCursor(263,526);}
	else if($TIPS_on_コキュートス==true){$page = 2;tips_init($page);$tip_num15=2;$TIPS_CLICKED_31=true;show_tip(15);MoveCursor(263,558);}
	else if($TIPS_on_コングロマリット==true){$page = 2;tips_init($page);$tip_num16=2;$TIPS_CLICKED_32=true;show_tip(16);MoveCursor(263,590);}
	else if($TIPS_on_サーセン==true){$page = 3;tips_init($page);$tip_num1=3;$TIPS_CLICKED_33=true;show_tip(1);MoveCursor(263,110);}
	else if($TIPS_on_シナプス==true){$page = 3;tips_init($page);$tip_num2=3;$TIPS_CLICKED_34=true;show_tip(2);MoveCursor(263,142);}
	else if($TIPS_on_死亡フラグ==true){$page = 3;tips_init($page);$tip_num3=3;$TIPS_CLICKED_35=true;show_tip(3);MoveCursor(263,174);}
	else if($TIPS_on_集団ストーカー==true){$page = 3;tips_init($page);$tip_num4=3;$TIPS_CLICKED_36=true;show_tip(4);MoveCursor(263,206);}
	else if($TIPS_on_触手ゲー==true){$page = 3;tips_init($page);$tip_num5=3;$TIPS_CLICKED_37=true;show_tip(5);MoveCursor(263,238);}
	else if($TIPS_on_職人==true){$page = 3;tips_init($page);$tip_num6=3;$TIPS_CLICKED_38=true;show_tip(6);MoveCursor(263,270);}
	else if($TIPS_on_神経パルス==true){$page = 3;tips_init($page);$tip_num7=3;$TIPS_CLICKED_39=true;show_tip(7);MoveCursor(263,302);}
	else if($TIPS_on_心神喪失==true){$page = 3;tips_init($page);$tip_num8=3;$TIPS_CLICKED_40=true;show_tip(8);MoveCursor(263,334);}
	else if($TIPS_on_儲==true){$page = 3;tips_init($page);$tip_num9=3;$TIPS_CLICKED_41=true;show_tip(9);MoveCursor(263,366);}
	else if($TIPS_on_スク水==true){$page = 3;tips_init($page);$tip_num10=3;$TIPS_CLICKED_42=true;show_tip(10);MoveCursor(263,398);}
	else if($TIPS_on_ストックホルム症候群==true){$page = 3;tips_init($page);$tip_num11=3;$TIPS_CLICKED_43=true;show_tip(11);MoveCursor(263,430);}
	else if($TIPS_on_スニーキングミッション==true){$page = 3;tips_init($page);$tip_num12=3;$TIPS_CLICKED_44=true;show_tip(12);MoveCursor(263,462);}
	else if($TIPS_on_スネーク==true){$page = 3;tips_init($page);$tip_num13=3;$TIPS_CLICKED_45=true;show_tip(13);MoveCursor(263,494);}
	else if($TIPS_on_星来オルジェル==true){$page = 3;tips_init($page);$tip_num14=3;$TIPS_CLICKED_46=true;show_tip(14);MoveCursor(263,526);}
	else if($TIPS_on_千里眼==true){$page = 3;tips_init($page);$tip_num15=3;$TIPS_CLICKED_47=true;show_tip(15);MoveCursor(263,558);}
	else if($TIPS_on_洗脳==true){$page = 3;tips_init($page);$tip_num16=3;$TIPS_CLICKED_48=true;show_tip(16);MoveCursor(263,590);}
	else if($TIPS_on_属性==true){$page = 4;tips_init($page);$tip_num1=4;$TIPS_CLICKED_49=true;show_tip(1);MoveCursor(263,110);}
	else if($TIPS_on_素粒子==true){$page = 4;tips_init($page);$tip_num2=4;$TIPS_CLICKED_50=true;show_tip(2);MoveCursor(263,142);}
	else if($TIPS_on_ソース==true){$page = 4;tips_init($page);$tip_num3=4;$TIPS_CLICKED_51=true;show_tip(3);MoveCursor(263,174);}
	else if($TIPS_on_ゾンビ==true){$page = 4;tips_init($page);$tip_num4=4;$TIPS_CLICKED_52=true;show_tip(4);MoveCursor(263,206);}
	else if($TIPS_on_ダウジング==true){$page = 4;tips_init($page);$tip_num5=4;$TIPS_CLICKED_53=true;show_tip(5);MoveCursor(263,238);}
	else if($TIPS_on_高杉==true){$page = 4;tips_init($page);$tip_num6=4;$TIPS_CLICKED_54=true;show_tip(6);MoveCursor(263,270);}
	else if($TIPS_on_チート==true){$page = 4;tips_init($page);$tip_num7=4;$TIPS_CLICKED_55=true;show_tip(7);MoveCursor(263,302);}
	else if($TIPS_on_厨==true){$page = 4;tips_init($page);$tip_num8=4;$TIPS_CLICKED_56=true;show_tip(8);MoveCursor(263,334);}
	else if($TIPS_on_中２病==true){$page = 4;tips_init($page);$tip_num9=4;$TIPS_CLICKED_57=true;show_tip(9);MoveCursor(263,366);}
	else if($TIPS_on_超能力捜査官==true){$page = 4;tips_init($page);$tip_num10=4;$TIPS_CLICKED_58=true;show_tip(10);MoveCursor(263,398);}
	else if($TIPS_on_沈黙の兵器==true){$page = 4;tips_init($page);$tip_num11=4;$TIPS_CLICKED_59=true;show_tip(11);MoveCursor(263,430);}
	else if($TIPS_on_対生成==true){$page = 4;tips_init($page);$tip_num12=4;$TIPS_CLICKED_60=true;show_tip(12);MoveCursor(263,462);}
	else if($TIPS_on_釣り==true){$page = 4;tips_init($page);$tip_num13=4;$TIPS_CLICKED_61=true;show_tip(13);MoveCursor(263,494);}
	else if($TIPS_on_ツンデレ==true){$page = 4;tips_init($page);$tip_num14=4;$TIPS_CLICKED_62=true;show_tip(14);MoveCursor(263,526);}
	else if($TIPS_on_電磁波==true){$page = 4;tips_init($page);$tip_num15=4;$TIPS_CLICKED_63=true;show_tip(15);MoveCursor(263,558);}
	else if($TIPS_on_天成神光会==true){$page = 4;tips_init($page);$tip_num16=4;$TIPS_CLICKED_64=true;show_tip(16);MoveCursor(263,590);}
	else if($TIPS_on_転売厨==true){$page = 5;tips_init($page);$tip_num1=5;$TIPS_CLICKED_65=true;show_tip(1);MoveCursor(263,110);}
	else if($TIPS_on_ディラックの海==true){$page = 5;tips_init($page);$tip_num2=5;$TIPS_CLICKED_66=true;show_tip(2);MoveCursor(263,142);}
	else if($TIPS_on_デジャヴ／ジャメヴュ==true){$page = 5;tips_init($page);$tip_num3=5;$TIPS_CLICKED_67=true;show_tip(3);MoveCursor(263,174);}
	else if($TIPS_on_デバッガ==true){$page = 5;tips_init($page);$tip_num4=5;$TIPS_CLICKED_68=true;show_tip(4);MoveCursor(263,206);}
	else if($TIPS_on_デフォ==true){$page = 5;tips_init($page);$tip_num5=5;$TIPS_CLICKED_69=true;show_tip(5);MoveCursor(263,238);}
	else if($TIPS_on_ドーパミン==true){$page = 5;tips_init($page);$tip_num6=5;$TIPS_CLICKED_70=true;show_tip(6);MoveCursor(263,270);}
	else if($TIPS_on_中の人==true){$page = 5;tips_init($page);$tip_num7=5;$TIPS_CLICKED_71=true;show_tip(7);MoveCursor(263,302);}
	else if($TIPS_on_日本語でおｋ==true){$page = 5;tips_init($page);$tip_num8=5;$TIPS_CLICKED_72=true;show_tip(8);MoveCursor(263,334);}
	else if($TIPS_on_ニューロン==true){$page = 5;tips_init($page);$tip_num9=5;$TIPS_CLICKED_73=true;show_tip(9);MoveCursor(263,366);}
	else if($TIPS_on_寝オチ==true){$page = 5;tips_init($page);$tip_num10=5;$TIPS_CLICKED_74=true;show_tip(10);MoveCursor(263,398);}
	else if($TIPS_on_燃料投下==true){$page = 5;tips_init($page);$tip_num11=5;$TIPS_CLICKED_75=true;show_tip(11);MoveCursor(263,430);}
	else if($TIPS_on_脳死==true){$page = 5;tips_init($page);$tip_num12=5;$TIPS_CLICKED_76=true;show_tip(12);MoveCursor(263,462);}
	else if($TIPS_on_ノシ==true){$page = 5;tips_init($page);$tip_num13=5;$TIPS_CLICKED_77=true;show_tip(13);MoveCursor(263,494);}
	else if($TIPS_on_廃人プレイ==true){$page = 5;tips_init($page);$tip_num14=5;$TIPS_CLICKED_78=true;show_tip(14);MoveCursor(263,526);}
	else if($TIPS_on_バイオリズム==true){$page = 5;tips_init($page);$tip_num15=5;$TIPS_CLICKED_79=true;show_tip(15);MoveCursor(263,558);}
	else if($TIPS_on_はいてない==true){$page = 5;tips_init($page);$tip_num16=5;$TIPS_CLICKED_80=true;show_tip(16);MoveCursor(263,590);}
	else if($TIPS_on_パラディン==true){$page = 6;tips_init($page);$tip_num1=6;$TIPS_CLICKED_81=true;show_tip(1);MoveCursor(263,110);}
	else if($TIPS_on_パレイドリア==true){$page = 6;tips_init($page);$tip_num2=6;$TIPS_CLICKED_82=true;show_tip(2);MoveCursor(263,142);}
	else if($TIPS_on_パンドラの箱==true){$page = 6;tips_init($page);$tip_num3=6;$TIPS_CLICKED_83=true;show_tip(3);MoveCursor(263,174);}
	else if($TIPS_on_ハンドル名==true){$page = 6;tips_init($page);$tip_num4=6;$TIPS_CLICKED_84=true;show_tip(4);MoveCursor(263,206);}
	else if($TIPS_on_パンモロ==true){$page = 6;tips_init($page);$tip_num5=6;$TIPS_CLICKED_85=true;show_tip(5);MoveCursor(263,238);}
	else if($TIPS_on_万有引力==true){$page = 6;tips_init($page);$tip_num6=6;$TIPS_CLICKED_86=true;show_tip(6);MoveCursor(263,270);}
	else if($TIPS_on_人大杉==true){$page = 6;tips_init($page);$tip_num7=6;$TIPS_CLICKED_87=true;show_tip(7);MoveCursor(263,302);}
	else if($TIPS_on_腐女子==true){$page = 6;tips_init($page);$tip_num8=6;$TIPS_CLICKED_88=true;show_tip(8);MoveCursor(263,334);}
	else if($TIPS_on_負の物質==true){$page = 6;tips_init($page);$tip_num9=6;$TIPS_CLICKED_89=true;show_tip(9);MoveCursor(263,366);}
	else if($TIPS_on_ブラクラ==true){$page = 6;tips_init($page);$tip_num10=6;$TIPS_CLICKED_90=true;show_tip(10);MoveCursor(263,398);}
	else if($TIPS_on_フルボッコ==true){$page = 6;tips_init($page);$tip_num11=6;$TIPS_CLICKED_91=true;show_tip(11);MoveCursor(263,430);}
	else if($TIPS_on_並行世界==true){$page = 6;tips_init($page);$tip_num12=6;$TIPS_CLICKED_92=true;show_tip(12);MoveCursor(263,462);}
	else if($TIPS_on_ペリカ==true){$page = 6;tips_init($page);$tip_num13=6;$TIPS_CLICKED_93=true;show_tip(13);MoveCursor(263,494);}
	else if($TIPS_on_マインドコントロール==true){$page = 6;tips_init($page);$tip_num14=6;$TIPS_CLICKED_94=true;show_tip(14);MoveCursor(263,526);}
	else if($TIPS_on_マグネタイト==true){$page = 6;tips_init($page);$tip_num15=6;$TIPS_CLICKED_95=true;show_tip(15);MoveCursor(263,558);}
	else if($TIPS_on_祭り==true){$page = 6;tips_init($page);$tip_num16=6;$TIPS_CLICKED_96=true;show_tip(16);MoveCursor(263,590);}
	else if($TIPS_on_明和党==true){$page = 7;tips_init($page);$tip_num1=7;$TIPS_CLICKED_97=true;show_tip(1);MoveCursor(263,110);}
	else if($TIPS_on_ミレニアム７==true){$page = 7;tips_init($page);$tip_num2=7;$TIPS_CLICKED_98=true;show_tip(2);MoveCursor(263,142);}
	else if($TIPS_on_夢遊病==true){$page = 7;tips_init($page);$tip_num3=7;$TIPS_CLICKED_99=true;show_tip(3);MoveCursor(263,174);}
	else if($TIPS_on_メシア==true){$page = 7;tips_init($page);$tip_num4=7;$TIPS_CLICKED_100=true;show_tip(4);MoveCursor(263,206);}
	else if($TIPS_on_目の錯覚==true){$page = 7;tips_init($page);$tip_num5=7;$TIPS_CLICKED_101=true;show_tip(5);MoveCursor(263,238);}
	else if($TIPS_on_メンヘラ==true){$page = 7;tips_init($page);$tip_num6=7;$TIPS_CLICKED_102=true;show_tip(6);MoveCursor(263,270);}
	else if($TIPS_on_もちつけ==true){$page = 7;tips_init($page);$tip_num7=7;$TIPS_CLICKED_103=true;show_tip(7);MoveCursor(263,302);}
	else if($TIPS_on_漏れ==true){$page = 7;tips_init($page);$tip_num8=7;$TIPS_CLICKED_104=true;show_tip(8);MoveCursor(263,334);}
	else if($TIPS_on_香具師==true){$page = 7;tips_init($page);$tip_num9=7;$TIPS_CLICKED_105=true;show_tip(9);MoveCursor(263,366);}
	else if($TIPS_on_ヤンデレ==true){$page = 7;tips_init($page);$tip_num10=7;$TIPS_CLICKED_106=true;show_tip(10);MoveCursor(263,398);}
	else if($TIPS_on_百合属性==true){$page = 7;tips_init($page);$tip_num11=7;$TIPS_CLICKED_107=true;show_tip(11);MoveCursor(263,430);}
	else if($TIPS_on_ょぅι゛ょ==true){$page = 7;tips_init($page);$tip_num12=7;$TIPS_CLICKED_108=true;show_tip(12);MoveCursor(263,462);}
	else if($TIPS_on_予知==true){$page = 7;tips_init($page);$tip_num13=7;$TIPS_CLICKED_109=true;show_tip(13);MoveCursor(263,494);}
	else if($TIPS_on_リア充==true){$page = 7;tips_init($page);$tip_num14=7;$TIPS_CLICKED_110=true;show_tip(14);MoveCursor(263,526);}
	else if($TIPS_on_リビドー==true){$page = 7;tips_init($page);$tip_num15=7;$TIPS_CLICKED_111=true;show_tip(15);MoveCursor(263,558);}
	else if($TIPS_on_ワクテカ==true){$page = 7;tips_init($page);$tip_num16=7;$TIPS_CLICKED_112=true;show_tip(16);MoveCursor(263,590);}
	else if($TIPS_on_ＡＡ==true){$page = 8;tips_init($page);$tip_num1=8;$TIPS_CLICKED_113=true;show_tip(1);MoveCursor(263,110);}
	else if($TIPS_on_ＤＩＤ==true){$page = 8;tips_init($page);$tip_num2=8;$TIPS_CLICKED_114=true;show_tip(2);MoveCursor(263,142);}
	else if($TIPS_on_ＤＱＮ==true){$page = 8;tips_init($page);$tip_num3=8;$TIPS_CLICKED_115=true;show_tip(3);MoveCursor(263,174);}
	else if($TIPS_on_Ｅ＝ｍｃ＾２==true){$page = 8;tips_init($page);$tip_num4=8;$TIPS_CLICKED_116=true;show_tip(4);MoveCursor(263,206);}
	else if($TIPS_on_ＧＪ==true){$page = 8;tips_init($page);$tip_num5=8;$TIPS_CLICKED_117=true;show_tip(5);MoveCursor(263,238);}
	else if($TIPS_on_ＩＣカード==true){$page = 8;tips_init($page);$tip_num6=8;$TIPS_CLICKED_118=true;show_tip(6);MoveCursor(263,270);}
	else if($TIPS_on_ｋｔｋｒ==true){$page = 8;tips_init($page);$tip_num7=8;$TIPS_CLICKED_119=true;show_tip(7);MoveCursor(263,302);}
	else if($TIPS_on_ｋｗｓｋ==true){$page = 8;tips_init($page);$tip_num8=8;$TIPS_CLICKED_120=true;show_tip(8);MoveCursor(263,334);}
	else if($TIPS_on_ｍｊｄ==true){$page = 8;tips_init($page);$tip_num9=8;$TIPS_CLICKED_121=true;show_tip(9);MoveCursor(263,366);}
	else if($TIPS_on_ＭＭＯＲＰＧ==true){$page = 8;tips_init($page);$tip_num10=8;$TIPS_CLICKED_122=true;show_tip(10);MoveCursor(263,398);}
	else if($TIPS_on_ＮＰＣ==true){$page = 8;tips_init($page);$tip_num11=8;$TIPS_CLICKED_123=true;show_tip(11);MoveCursor(263,430);}
	else if($TIPS_on_ｏｒｚ==true){$page = 8;tips_init($page);$tip_num12=8;$TIPS_CLICKED_124=true;show_tip(12);MoveCursor(263,462);}
	else if($TIPS_on_ＰＴＳＤ==true){$page = 8;tips_init($page);$tip_num13=8;$TIPS_CLICKED_125=true;show_tip(13);MoveCursor(263,494);}
	else if($TIPS_on_ＲＭＴ==true){$page = 8;tips_init($page);$tip_num14=8;$TIPS_CLICKED_126=true;show_tip(14);MoveCursor(263,526);}
	else if($TIPS_on_ＲＯＭ==true){$page = 8;tips_init($page);$tip_num15=8;$TIPS_CLICKED_127=true;show_tip(15);MoveCursor(263,558);}
	else if($TIPS_on_ＳＮＳ==true){$page = 8;tips_init($page);$tip_num16=8;$TIPS_CLICKED_128=true;show_tip(16);MoveCursor(263,590);}
	else if($TIPS_on_ｕｚｅｅｅｅｅｅｅｅｅｅｅ！==true){$page = 9;tips_init($page);$tip_num1=9;$TIPS_CLICKED_129=true;show_tip(1);MoveCursor(263,110);}
	else if($TIPS_on_ｗ==true){$page = 9;tips_init($page);$tip_num2=9;$TIPS_CLICKED_130=true;show_tip(2);MoveCursor(263,142);}
	else if($TIPS_on_Ｗｉｋｉ==true){$page = 9;tips_init($page);$tip_num3=9;$TIPS_CLICKED_131=true;show_tip(3);MoveCursor(263,174);}
	else if($TIPS_on_３００人委員会==true){$page = 9;tips_init($page);$tip_num4=9;$TIPS_CLICKED_132=true;show_tip(4);MoveCursor(263,206);}
	else if($TIPS_on_（ｒｙ==true){$page = 9;tips_init($page);$tip_num5=9;$TIPS_CLICKED_133=true;show_tip(5);MoveCursor(263,238);}
	else{$page = 1;tips_init($page);}

	Fade("*/MouseUsual/*",0,1000,null,false);


		//★★★★アンロック
		XBOX360_LockVideo(false);

		Fade("BAKup", 1500, 1000, null, false);
		Fade("BAKdown", 1500, 1000, null, false);
		Move("BAKup", 600, @0, @+56, null, false);
		Move("BAKdown", 600, @0, @-112, null, false);
	//	Fade("BLK",500,0,null,false);
			Fade("@エキストラスクリーン",500,0,null,false);
			if($PLACE_title){
				Request("@エキストラスクリーン", Disused);
			}
			//▲描画「ボタン説明」
			DialogButtonFade("Button_TIPS");
		WaitAction("@エキストラスクリーン",null);


	$SYSTEM_XBOX360_button_rb_down=false;
	$SYSTEM_XBOX360_button_lb_down=false;

	while(!$slExit2){
		if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
		$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
		select{
			if($SYSTEM_XBOX360_change_user_state){DialogChangeState();}
			if($SYSTEM_r_button_down||$SYSTEM_XBOX360_button_b_down){
				if($PLACE_title){
					Request("BLK", Lock);
					Fade("BLK",300,1000,null,false);
						//▲描画「ボタン説明」
						DialogButtonOFF("Button_TIPS");
					WaitAction("BLK",null);
					Delete("*");
					Request("BLK", UnLock);
					$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	//				$slExit2=true;
				}else{
					Request("@エキストラスクリーン", Lock);
					Fade("@エキストラスクリーン",300,1000,null,false);
						//▲描画「ボタン説明」
						DialogButtonOFF("Button_TIPS");
					WaitAction("@エキストラスクリーン",null);
					Delete("*");
					Request("@エキストラスクリーン", UnLock);
					$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
				}
				MoveCursor($TipPosX,$TipPosY);
				return;
			}
			if($SYSTEM_XBOX360_button_rb_down || $SYSTEM_keydown_c){$page++;if($page>9){$page=1;}TipsClickedClear();tips_init($page);}
			if($SYSTEM_XBOX360_button_lb_down || $SYSTEM_keydown_z){$page--;if($page<=0){$page=9;}TipsClickedClear();tips_init($page);}
//Cursor
			if($page==9){
			CursorPosition($TipsX,$TipsCsrY);
				if($TipsCsrY>=412 && $TipsCsrY<=456){
					MoveCursor(204,472);
				}
			}
			case @WND_title/tips_1{show_tip(1);}
			case @WND_title/tips_2{show_tip(2);}
			case @WND_title/tips_3{show_tip(3);}
			case @WND_title/tips_4{show_tip(4);}
			case @WND_title/tips_5{show_tip(5);}
			case @WND_title/tips_6{show_tip(6);}
			case @WND_title/tips_7{show_tip(7);}
			case @WND_title/tips_8{show_tip(8);}
			case @WND_title/tips_9{show_tip(9);}
			case @WND_title/tips_10{show_tip(10);}
			case @WND_title/tips_11{show_tip(11);}
			case @WND_title/tips_12{show_tip(12);}
			case @WND_title/tips_13{show_tip(13);}
			case @WND_title/tips_14{show_tip(14);}
			case @WND_title/tips_15{show_tip(15);}
			case @WND_title/tips_16{show_tip(16);}
		}
	}

	Fade("BLK",300,1000,null,false);
	WaitAction("BLK",null);
	$SYSTEM_r_button_down=false;$SYSTEM_XBOX360_button_b_down=false;
	Delete("*");
//	$SYSTEM_script_close="nss/sys_close.nss";

}

..//tips_init($p2)
function tips_init($p2)
{
	//★★★★ロック
	XBOX360_LockVideo(true);

	CreateTexture("ページ移動用", 20000, 0, 0, SCREEN);
	SetAlias("ページ移動用", "ページ移動用");

	$i=1;
..//生成しなおし
	while($i<=16){Delete($i);$nut="img_"+$i;Delete($nut);$nut=$i+"_img";Delete($nut);$i++;}

	$i=1;
	if($p2==1){
		$Tip_Count=1;
	}else if($p2==2){
		$Tip_Count=17;
	}else if($p2==3){
		$Tip_Count=33;
	}else if($p2==4){
		$Tip_Count=49;
	}else if($p2==5){
		$Tip_Count=65;
	}else if($p2==6){
		$Tip_Count=81;
	}else if($p2==7){
		$Tip_Count=97;
	}else if($p2==8){
		$Tip_Count=113;
	}else if($p2==9){
		$Tip_Count=129;
	}

	$x=80;
	$y=56;
	$tip_num1=0;
	$tip_num2=0;
	$tip_num3=0;
	$tip_num4=0;
	$tip_num5=0;
	$tip_num6=0;
	$tip_num7=0;
	$tip_num8=0;
	$tip_num9=0;
	$tip_num10=0;
	$tip_num11=0;
	$tip_num12=0;
	$tip_num13=0;
	$tip_num14=0;
	$tip_num15=0;
	$tip_num16=0;

	while($i<=16)
	{

	$tip_Title="かおすへっど";

..//page=1
		if($p2==1){
			if($i==1){if(#TIPS_アバター){$tip_Title="アバター";$tip_name1="アバター";$tip_num1=1;$tip_act1=0;$TIPS_CLICKED_1=true;}}
			else if($i==2){if(#TIPS_安西先生){$tip_Title="安西先生";$tip_name2="安西先生";$tip_num2=1;$tip_act2=0;$TIPS_CLICKED_2=true;}}
			else if($i==3){if(#TIPS_インフォームド・コンセント){$tip_Title="インフォームド・コンセント";$tip_name3="インフォームド・コンセント";$tip_num3=1;$tip_act3=0;$TIPS_CLICKED_3=true;}}
			else if($i==4){if(#TIPS_インプリンティング){$tip_Title="インプリンティング";$tip_name4="インプリンティング";$tip_num4=1;$tip_act4=0;$TIPS_CLICKED_4=true;}}
			else if($i==5){if(#TIPS_ウォーターボーディング){$tip_Title="ウォーターボーディング";$tip_name5="ウォーターボーディング";$tip_num5=1;$tip_act5=0;$TIPS_CLICKED_5=true;}}
			else if($i==6){if(#TIPS_うｐ){$tip_Title="うｐ";$tip_name6="うｐ";$tip_num6=1;$tip_act6=0;$TIPS_CLICKED_6=true;}}
			else if($i==7){if(#TIPS_永久機関){$tip_Title="永久機関";$tip_name7="永久機関";$tip_num7=1;$tip_act7=0;$TIPS_CLICKED_7=true;}}
			else if($i==8){if(#TIPS_エクステ){$tip_Title="エクステ";$tip_name8="エクステ";$tip_num8=1;$tip_act8=0;$TIPS_CLICKED_8=true;}}
			else if($i==9){if(#TIPS_オサレ){$tip_Title="オサレ";$tip_name9="オサレ";$tip_num9=1;$tip_act9=0;$TIPS_CLICKED_9=true;}}
			else if($i==10){if(#TIPS_オタ芸){$tip_Title="オタ芸";$tip_name10="オタ芸";$tip_num10=1;$tip_act10=0;$TIPS_CLICKED_10=true;}}
			else if($i==11){if(#TIPS_オーバーニーソ){$tip_Title="オーバーニーソ ";$tip_name11="オーバーニーソ";$tip_num11=1;$tip_act11=0;$TIPS_CLICKED_11=true;}}
			else if($i==12){if(#TIPS_オフ会){$tip_Title="オフ会";$tip_name12="オフ会";$tip_num12=1;$tip_act12=0;$TIPS_CLICKED_12=true;}}
			else if($i==13){if(#TIPS_俺ＴＵＥＥＥプレイ){$tip_Title="俺ＴＵＥＥＥプレイ";$tip_name13="俺ＴＵＥＥＥプレイ";$tip_num13=1;$tip_act13=0;$TIPS_CLICKED_13=true;}}
			else if($i==14){if(#TIPS_ガクブル){$tip_Title="ガクブル";$tip_name14="ガクブル";$tip_num14=1;$tip_act14=0;$TIPS_CLICKED_14=true;}}
			else if($i==15){if(#TIPS_霞の構え){$tip_Title="霞の構え";$tip_name15="霞の構え";$tip_num15=1;$tip_act15=0;$TIPS_CLICKED_15=true;}}
			else if($i==16){if(#TIPS_かまいたち現象){$tip_Title="かまいたち現象";$tip_name16="かまいたち現象";$tip_num16=1;$tip_act16=0;$TIPS_CLICKED_16=true;}}
..//page=2
		}else if($p2==2){
			if($i==1){if(#TIPS_ネ申){$tip_Title="ネ申 ";$tip_name1="ネ申";$tip_num1=2;$tip_act1=0;$TIPS_CLICKED_17=true;}}
			else if($i==2){if(#TIPS_基本相互作用){$tip_Title="基本相互作用";$tip_name2="基本相互作用";$tip_num2=2;$tip_act2=0;$TIPS_CLICKED_18=true;}}
			else if($i==3){if(#TIPS_キャストオフ){$tip_Title="キャストオフ";$tip_name3="キャストオフ";$tip_num3=2;$tip_act3=0;$TIPS_CLICKED_19=true;}}
			else if($i==4){if(#TIPS_ギルド){$tip_Title="ギルド";$tip_name4="ギルド";$tip_num4=2;$tip_act4=0;$TIPS_CLICKED_20=true;}}
			else if($i==5){if(#TIPS_きんもーっ☆){$tip_Title="きんもーっ☆";$tip_name5="きんもーっ☆";$tip_num5=2;$tip_act5=0;$TIPS_CLICKED_21=true;}}
			else if($i==6){if(#TIPS_空気嫁){$tip_Title="空気嫁";$tip_name6="空気嫁";$tip_num6=2;$tip_act6=0;$TIPS_CLICKED_22=true;}}
			else if($i==7){if(#TIPS_空孔理論){$tip_Title="空孔理論";$tip_name7="空孔理論";$tip_num7=2;$tip_act7=0;$TIPS_CLICKED_23=true;}}
			else if($i==8){if(#TIPS_黒キャラ){$tip_Title="黒キャラ";$tip_name8="黒キャラ";$tip_num8=2;$tip_act8=0;$TIPS_CLICKED_24=true;}}
			else if($i==9){if(#TIPS_黒ミサ){$tip_Title="黒ミサ";$tip_name9="黒ミサ";$tip_num9=2;$tip_act9=0;$TIPS_CLICKED_25=true;}}
			else if($i==10){if(#TIPS_劇場型犯罪){$tip_Title="劇場型犯罪";$tip_name10="劇場型犯罪";$tip_num10=2;$tip_act10=0;$TIPS_CLICKED_26=true;}}
			else if($i==11){if(#TIPS_グラジオール記黙示録詩編){$tip_Title="グラジオール記黙示録詩編";$tip_name11="グラジオール記黙示録詩編";$tip_num11=2;$tip_act11=0;$TIPS_CLICKED_27=true;}}
			else if($i==12){if(#TIPS_ゲシュタルト崩壊){$tip_Title="ゲシュタルト崩壊";$tip_name12="ゲシュタルト崩壊";$tip_num12=2;$tip_act12=0;$TIPS_CLICKED_28=true;}}
			else if($i==13){if(#TIPS_ゲーム脳){$tip_Title="ゲーム脳";$tip_name13="ゲーム脳";$tip_num13=2;$tip_act13=0;$TIPS_CLICKED_29=true;}}
			else if($i==14){if(#TIPS_孔明の罠){$tip_Title="孔明の罠";$tip_name14="孔明の罠";$tip_num14=2;$tip_act14=0;$TIPS_CLICKED_30=true;}}
			else if($i==15){if(#TIPS_コキュートス){$tip_Title="コキュートス";$tip_name15="コキュートス";$tip_num15=2;$tip_act15=0;$TIPS_CLICKED_31=true;}}
			else if($i==16){if(#TIPS_コングロマリット){$tip_Title="コングロマリット";$tip_name16="コングロマリット";$tip_num16=2;$tip_act16=0;$TIPS_CLICKED_32=true;}}
..//page=3
		}else if($p2==3){

			if($i==1){if(#TIPS_サーセン){$tip_Title="サーセン";$tip_name1="サーセン";$tip_num1=3;$tip_act1=0;$TIPS_CLICKED_33=true;}}
			else if($i==2){if(#TIPS_シナプス){$tip_Title="シナプス";$tip_name2="シナプス";$tip_num2=3;$tip_act2=0;$TIPS_CLICKED_34=true;}}
			else if($i==3){if(#TIPS_死亡フラグ){$tip_Title="死亡フラグ";$tip_name3="死亡フラグ";$tip_num3=3;$tip_act3=0;$TIPS_CLICKED_35=true;}}
			else if($i==4){if(#TIPS_集団ストーカー){$tip_Title="集団ストーカー";$tip_name4="集団ストーカー";$tip_num4=3;$tip_act4=0;$TIPS_CLICKED_36=true;}}
			else if($i==5){if(#TIPS_触手ゲー){$tip_Title="触手ゲー";$tip_name5="触手ゲー";$tip_num5=3;$tip_act5=0;$TIPS_CLICKED_37=true;}}
			else if($i==6){if(#TIPS_職人){$tip_Title="職人";$tip_name6="職人";$tip_num6=3;$tip_act6=0;$TIPS_CLICKED_38=true;}}
			else if($i==7){if(#TIPS_神経パルス){$tip_Title="神経パルス";$tip_name7="神経パルス";$tip_num7=3;$tip_act7=0;$TIPS_CLICKED_39=true;}}
			else if($i==8){if(#TIPS_心神喪失){$tip_Title="心神喪失";$tip_name8="心神喪失";$tip_num8=3;$tip_act8=0;$TIPS_CLICKED_40=true;}}
			else if($i==9){if(#TIPS_儲){$tip_Title="儲";$tip_name9="儲";$tip_num9=3;$tip_act9=0;$TIPS_CLICKED_41=true;}}
			else if($i==10){if(#TIPS_スク水){$tip_Title="スク水";$tip_name10="スク水";$tip_num10=3;$tip_act10=0;$TIPS_CLICKED_42=true;}}
			else if($i==11){if(#TIPS_ストックホルム症候群){$tip_Title="ストックホルム症候群";$tip_name11="ストックホルム症候群";$tip_num11=3;$tip_act11=0;$TIPS_CLICKED_43=true;}}
			else if($i==12){if(#TIPS_スニーキングミッション){$tip_Title="スニーキングミッション";$tip_name12="スニーキングミッション";$tip_num12=3;$tip_act12=0;$TIPS_CLICKED_44=true;}}
			else if($i==13){if(#TIPS_スネーク){$tip_Title="スネーク";$tip_name13="スネーク";$tip_num13=3;$tip_act13=0;$TIPS_CLICKED_45=true;}}
			else if($i==14){if(#TIPS_星来オルジェル){$tip_Title="星来オルジェル";$tip_name14="星来オルジェル";$tip_num14=3;$tip_act14=0;$TIPS_CLICKED_46=true;}}
			else if($i==15){if(#TIPS_千里眼){$tip_Title="千里眼";$tip_name15="千里眼";$tip_num15=3;$tip_act15=0;$TIPS_CLICKED_47=true;}}
			else if($i==16){if(#TIPS_洗脳){$tip_Title="洗脳";$tip_name16="洗脳";$tip_num16=3;$tip_act16=0;$TIPS_CLICKED_48=true;}}
..//page=4
		}else if($p2==4){

			if($i==1){if(#TIPS_属性){$tip_Title="属性";$tip_name1="属性";$tip_num1=4;$tip_act1=0;$TIPS_CLICKED_49=true;}}
			else if($i==2){if(#TIPS_素粒子){$tip_Title="素粒子";$tip_name2="素粒子";$tip_num2=4;$tip_act2=0;$TIPS_CLICKED_50=true;}}
			else if($i==3){if(#TIPS_ソース){$tip_Title="ソース";$tip_name3="ソース";$tip_num3=4;$tip_act3=0;$TIPS_CLICKED_51=true;}}
			else if($i==4){if(#TIPS_ゾンビ){$tip_Title="ゾンビ";$tip_name4="ゾンビ";$tip_num4=4;$tip_act4=0;$TIPS_CLICKED_52=true;}}
			else if($i==5){if(#TIPS_ダウジング){$tip_Title="ダウジング";$tip_name5="ダウジング";$tip_num5=4;$tip_act5=0;$TIPS_CLICKED_53=true;}}
			else if($i==6){if(#TIPS_高杉){$tip_Title="高杉";$tip_name6="高杉";$tip_num6=4;$tip_act6=0;$TIPS_CLICKED_54=true;}}
			else if($i==7){if(#TIPS_チート){$tip_Title="チート";$tip_name7="チート";$tip_num7=4;$tip_act7=0;$TIPS_CLICKED_55=true;}}
			else if($i==8){if(#TIPS_厨){$tip_Title="厨";$tip_name8="厨";$tip_num8=4;$tip_act8=0;$TIPS_CLICKED_56=true;}}
			else if($i==9){if(#TIPS_中２病){$tip_Title="中２病";$tip_name9="中２病";$tip_num9=4;$tip_act9=0;$TIPS_CLICKED_57=true;}}
			else if($i==10){if(#TIPS_超能力捜査官){$tip_Title="超能力捜査官";$tip_name10="超能力捜査官";$tip_num10=4;$tip_act10=0;$TIPS_CLICKED_58=true;}}
			else if($i==11){if(#TIPS_沈黙の兵器){$tip_Title="沈黙の兵器";$tip_name11="沈黙の兵器";$tip_num11=4;$tip_act11=0;$TIPS_CLICKED_59=true;}}
			else if($i==12){if(#TIPS_対生成){$tip_Title="対生成";$tip_name12="対生成";$tip_num12=4;$tip_act12=0;$TIPS_CLICKED_60=true;}}
			else if($i==13){if(#TIPS_釣り){$tip_Title="釣り";$tip_name13="釣り";$tip_num13=4;$tip_act13=0;$TIPS_CLICKED_61=true;}}
			else if($i==14){if(#TIPS_ツンデレ){$tip_Title="ツンデレ";$tip_name14="ツンデレ";$tip_num14=4;$tip_act14=0;$TIPS_CLICKED_62=true;}}
			else if($i==15){if(#TIPS_電磁波){$tip_Title="電磁波";$tip_name15="電磁波";$tip_num15=4;$tip_act15=0;$TIPS_CLICKED_63=true;}}
			else if($i==16){if(#TIPS_天成神光会){$tip_Title="天成神光会";$tip_name16="天成神光会";$tip_num16=4;$tip_act16=0;$TIPS_CLICKED_64=true;}}

..//page=5
		}else if($p2==5){

			if($i==1){if(#TIPS_転売厨){$tip_Title="転売厨";$tip_name1="転売厨";$tip_num1=5;$tip_act1=0;$TIPS_CLICKED_65=true;}}
			else if($i==2){if(#TIPS_ディラックの海){$tip_Title="ディラックの海";$tip_name2="ディラックの海";$tip_num2=5;$tip_act2=0;$TIPS_CLICKED_66=true;}}
			else if($i==3){if(#TIPS_デジャヴ／ジャメヴュ){$tip_Title="デジャヴ／ジャメヴュ";$tip_name3="デジャヴ／ジャメヴュ";$tip_num3=5;$tip_act3=0;$TIPS_CLICKED_67=true;}}
			else if($i==4){if(#TIPS_デバッガ){$tip_Title="デバッガ";$tip_name4="デバッガ";$tip_num4=5;$tip_act4=0;$TIPS_CLICKED_68=true;}}
			else if($i==5){if(#TIPS_デフォ){$tip_Title="デフォ";$tip_name5="デフォ";$tip_num5=5;$tip_act5=0;$TIPS_CLICKED_69=true;}}
			else if($i==6){if(#TIPS_ドーパミン){$tip_Title="ドーパミン";$tip_name6="ドーパミン";$tip_num6=5;$tip_act6=0;$TIPS_CLICKED_70=true;}}
			else if($i==7){if(#TIPS_中の人){$tip_Title="中の人";$tip_name7="中の人";$tip_num7=5;$tip_act7=0;$TIPS_CLICKED_71=true;}}
			else if($i==8){if(#TIPS_日本語でおｋ){$tip_Title="日本語でおｋ";$tip_name8="日本語でおｋ";$tip_num8=5;$tip_act8=0;$TIPS_CLICKED_72=true;}}
			else if($i==9){if(#TIPS_ニューロン){$tip_Title="ニューロン";$tip_name9="ニューロン";$tip_num9=5;$tip_act9=0;$TIPS_CLICKED_73=true;}}
			else if($i==10){if(#TIPS_寝オチ){$tip_Title="寝オチ";$tip_name10="寝オチ";$tip_num10=5;$tip_act10=0;$TIPS_CLICKED_74=true;}}
			else if($i==11){if(#TIPS_燃料投下){$tip_Title="燃料投下";$tip_name11="燃料投下";$tip_num11=5;$tip_act11=0;$TIPS_CLICKED_75=true;}}
			else if($i==12){if(#TIPS_脳死){$tip_Title="脳死";$tip_name12="脳死";$tip_num12=5;$tip_act12=0;$TIPS_CLICKED_76=true;}}
			else if($i==13){if(#TIPS_ノシ){$tip_Title="ノシ";$tip_name13="ノシ";$tip_num13=5;$tip_act13=0;$TIPS_CLICKED_77=true;}}
			else if($i==14){if(#TIPS_廃人プレイ){$tip_Title="廃人プレイ";$tip_name14="廃人プレイ";$tip_num14=5;$tip_act14=0;$TIPS_CLICKED_78=true;}}
			else if($i==15){if(#TIPS_バイオリズム){$tip_Title="バイオリズム";$tip_name15="バイオリズム";$tip_num15=5;$tip_act15=0;$TIPS_CLICKED_79=true;}}
			else if($i==16){if(#TIPS_はいてない){$tip_Title="はいてない";$tip_name16="はいてない";$tip_num16=5;$tip_act16=0;$TIPS_CLICKED_80=true;}}

..//page=6
		}else if($p2==6){

			if($i==1){if(#TIPS_パラディン){$tip_Title="パラディン";$tip_name1="パラディン";$tip_num1=6;$tip_act1=0;$TIPS_CLICKED_81=true;}}
			else if($i==2){if(#TIPS_パレイドリア){$tip_Title="パレイドリア";$tip_name2="パレイドリア";$tip_num2=6;$tip_act2=0;$TIPS_CLICKED_82=true;}}
			else if($i==3){if(#TIPS_パンドラの箱){$tip_Title="パンドラの箱";$tip_name3="パンドラの箱";$tip_num3=6;$tip_act3=0;$TIPS_CLICKED_83=true;}}
			else if($i==4){if(#TIPS_ハンドル名){$tip_Title="ハンドル名";$tip_name4="ハンドル名";$tip_num4=6;$tip_act4=0;$TIPS_CLICKED_84=true;}}
			else if($i==5){if(#TIPS_パンモロ){$tip_Title="パンモロ";$tip_name5="パンモロ";$tip_num5=6;$tip_act5=0;$TIPS_CLICKED_85=true;}}
			else if($i==6){if(#TIPS_万有引力){$tip_Title="万有引力";$tip_name6="万有引力";$tip_num6=6;$tip_act6=0;$TIPS_CLICKED_86=true;}}
			else if($i==7){if(#TIPS_人大杉){$tip_Title="人大杉";$tip_name7="人大杉";$tip_num7=6;$tip_act7=0;$TIPS_CLICKED_87=true;}}
			else if($i==8){if(#TIPS_腐女子){$tip_Title="腐女子";$tip_name8="腐女子";$tip_num8=6;$tip_act8=0;$TIPS_CLICKED_88=true;}}
			else if($i==9){if(#TIPS_負の物質){$tip_Title="負の物質";$tip_name9="負の物質";$tip_num9=6;$tip_act9=0;$TIPS_CLICKED_89=true;}}
			else if($i==10){if(#TIPS_ブラクラ){$tip_Title="ブラクラ";$tip_name10="ブラクラ";$tip_num10=6;$tip_act10=0;$TIPS_CLICKED_90=true;}}
			else if($i==11){if(#TIPS_フルボッコ){$tip_Title="フルボッコ";$tip_name11="フルボッコ";$tip_num11=6;$tip_act11=0;$TIPS_CLICKED_91=true;}}
			else if($i==12){if(#TIPS_並行世界){$tip_Title="並行世界";$tip_name12="並行世界";$tip_num12=6;$tip_act12=0;$TIPS_CLICKED_92=true;}}
			else if($i==13){if(#TIPS_ペリカ){$tip_Title="ペリカ";$tip_name13="ペリカ";$tip_num13=6;$tip_act13=0;$TIPS_CLICKED_93=true;}}
			else if($i==14){if(#TIPS_マインドコントロール){$tip_Title="マインドコントロール";$tip_name14="マインドコントロール";$tip_num14=6;$tip_act14=0;$TIPS_CLICKED_94=true;}}
			else if($i==15){if(#TIPS_マグネタイト){$tip_Title="マグネタイト";$tip_name15="マグネタイト";$tip_num15=6;$tip_act15=0;$TIPS_CLICKED_95=true;}}
			else if($i==16){if(#TIPS_祭り){$tip_Title="祭り";$tip_name16="祭り";$tip_num16=6;$tip_act16=0;$TIPS_CLICKED_96=true;}}

..//page=7
		}else if($p2==7){

			if($i==1){if(#TIPS_明和党){$tip_Title="明和党";$tip_name1="明和党";$tip_num1=7;$tip_act1=0;$TIPS_CLICKED_97=true;}}
			else if($i==2){if(#TIPS_ミレニアム７){$tip_Title="ミレニアム７";$tip_name2="ミレニアム７";$tip_num2=7;$tip_act2=0;$TIPS_CLICKED_98=true;}}
			else if($i==3){if(#TIPS_夢遊病){$tip_Title="夢遊病";$tip_name3="夢遊病";$tip_num3=7;$tip_act3=0;$TIPS_CLICKED_99=true;}}
			else if($i==4){if(#TIPS_メシア){$tip_Title="メシア";$tip_name4="メシア";$tip_num4=7;$tip_act4=0;$TIPS_CLICKED_100=true;}}
			else if($i==5){if(#TIPS_目の錯覚){$tip_Title="目の錯覚";$tip_name5="目の錯覚";$tip_num5=7;$tip_act5=0;$TIPS_CLICKED_101=true;}}
			else if($i==6){if(#TIPS_メンヘラ){$tip_Title="メンヘラ";$tip_name6="メンヘラ";$tip_num6=7;$tip_act6=0;$TIPS_CLICKED_102=true;}}
			else if($i==7){if(#TIPS_もちつけ){$tip_Title="もちつけ";$tip_name7="もちつけ";$tip_num7=7;$tip_act7=0;$TIPS_CLICKED_103=true;}}
			else if($i==8){if(#TIPS_漏れ){$tip_Title="漏れ";$tip_name8="漏れ";$tip_num8=7;$tip_act8=0;$TIPS_CLICKED_104=true;}}
			else if($i==9){if(#TIPS_香具師){$tip_Title="香具師";$tip_name9="香具師";$tip_num9=7;$tip_act9=0;$TIPS_CLICKED_105=true;}}
			else if($i==10){if(#TIPS_ヤンデレ){$tip_Title="ヤンデレ";$tip_name10="ヤンデレ";$tip_num10=7;$tip_act10=0;$TIPS_CLICKED_106=true;}}
			else if($i==11){if(#TIPS_百合属性){$tip_Title="百合属性";$tip_name11="百合属性";$tip_num11=7;$tip_act11=0;$TIPS_CLICKED_107=true;}}
			else if($i==12){if(#TIPS_ょぅι゛ょ){$tip_Title="ょぅι゛ょ";$tip_name12="ょぅι゛ょ";$tip_num12=7;$tip_act12=0;$TIPS_CLICKED_108=true;}}
			else if($i==13){if(#TIPS_予知){$tip_Title="予知";$tip_name13="予知";$tip_num13=7;$tip_act13=0;$TIPS_CLICKED_109=true;}}
			else if($i==14){if(#TIPS_リア充){$tip_Title="リア充";$tip_name14="リア充";$tip_num14=7;$tip_act14=0;$TIPS_CLICKED_110=true;}}
			else if($i==15){if(#TIPS_リビドー){$tip_Title="リビドー";$tip_name15="リビドー";$tip_num15=7;$tip_act15=0;$TIPS_CLICKED_111=true;}}
			else if($i==16){if(#TIPS_ワクテカ){$tip_Title="ワクテカ";$tip_name16="ワクテカ";$tip_num16=7;$tip_act16=0;$TIPS_CLICKED_112=true;}}

..//page=8
		}else if($p2==8){

			if($i==1){if(#TIPS_ＡＡ){$tip_Title="ＡＡ";$tip_name1="ＡＡ";$tip_num1=8;$tip_act1=0;$TIPS_CLICKED_113=true;}}
			else if($i==2){if(#TIPS_ＤＩＤ){$tip_Title="ＤＩＤ";$tip_name2="ＤＩＤ";$tip_num2=8;$tip_act2=0;$TIPS_CLICKED_114=true;}}
			else if($i==3){if(#TIPS_ＤＱＮ){$tip_Title="ＤＱＮ";$tip_name3="ＤＱＮ";$tip_num3=8;$tip_act3=0;$TIPS_CLICKED_115=true;}}
			else if($i==4){if(#TIPS_Ｅ＝ｍｃ＾２){$tip_Title="Ｅ＝ｍｃ＾２";$tip_name4="Ｅ＝ｍｃ＾２";$tip_num4=8;$tip_act4=0;$TIPS_CLICKED_116=true;}}
			else if($i==5){if(#TIPS_ＧＪ){$tip_Title="ＧＪ";$tip_name5="ＧＪ";$tip_num5=8;$tip_act5=0;$TIPS_CLICKED_117=true;}}
			else if($i==6){if(#TIPS_ＩＣカード){$tip_Title="ＩＣカード";$tip_name6="ＩＣカード";$tip_num6=8;$tip_act6=0;$TIPS_CLICKED_118=true;}}
			else if($i==7){if(#TIPS_ｋｔｋｒ){$tip_Title="ｋｔｋｒ";$tip_name7="ｋｔｋｒ";$tip_num7=8;$tip_act7=0;$TIPS_CLICKED_119=true;}}
			else if($i==8){if(#TIPS_ｋｗｓｋ){$tip_Title="ｋｗｓｋ";$tip_name8="ｋｗｓｋ";$tip_num8=8;$tip_act8=0;$TIPS_CLICKED_120=true;}}
			else if($i==9){if(#TIPS_ｍｊｄ){$tip_Title="ｍｊｄ";$tip_name9="ｍｊｄ";$tip_num9=8;$tip_act9=0;$TIPS_CLICKED_121=true;}}
			else if($i==10){if(#TIPS_ＭＭＯＲＰＧ){$tip_Title="ＭＭＯＲＰＧ";$tip_name10="ＭＭＯＲＰＧ";$tip_num10=8;$tip_act10=0;$TIPS_CLICKED_122=true;}}
			else if($i==11){if(#TIPS_ＮＰＣ){$tip_Title="ＮＰＣ";$tip_name11="ＮＰＣ";$tip_num11=8;$tip_act11=0;$TIPS_CLICKED_123=true;}}
			else if($i==12){if(#TIPS_ｏｒｚ){$tip_Title="ｏｒｚ";$tip_name12="ｏｒｚ";$tip_num12=8;$tip_act12=0;$TIPS_CLICKED_124=true;}}
			else if($i==13){if(#TIPS_ＰＴＳＤ){$tip_Title="ＰＴＳＤ";$tip_name13="ＰＴＳＤ";$tip_num13=8;$tip_act13=0;$TIPS_CLICKED_125=true;}}
			else if($i==14){if(#TIPS_ＲＭＴ){$tip_Title="ＲＭＴ";$tip_name14="ＲＭＴ";$tip_num14=8;$tip_act14=0;$TIPS_CLICKED_126=true;}}
			else if($i==15){if(#TIPS_ＲＯＭ){$tip_Title="ＲＯＭ";$tip_name15="ＲＯＭ";$tip_num15=8;$tip_act15=0;$TIPS_CLICKED_127=true;}}
			else if($i==16){if(#TIPS_ＳＮＳ){$tip_Title="ＳＮＳ";$tip_name16="ＳＮＳ";$tip_num16=8;$tip_act16=0;$TIPS_CLICKED_128=true;}}

..//page=9
		}else if($p2==9){
			if($i==1){if(#TIPS_ｕｚｅｅｅｅｅｅｅｅｅｅｅ！){$tip_Title="ｕｚｅｅｅｅｅｅｅｅｅｅｅ！";$tip_name1="ｕｚｅｅｅｅｅｅｅｅｅｅｅ！";$tip_num1=9;$tip_act1=0;$TIPS_CLICKED_129=true;}}
			else if($i==2){if(#TIPS_ｗ){$tip_Title="ｗ";$tip_name2="ｗ";$tip_num2=9;$tip_act2=0;$TIPS_CLICKED_130=true;}}
			else if($i==3){if(#TIPS_Ｗｉｋｉ){$tip_Title="Ｗｉｋｉ";$tip_name3="Ｗｉｋｉ";$tip_num3=9;$tip_act3=0;$TIPS_CLICKED_131=true;}}
			else if($i==4){if(#TIPS_３００人委員会){$tip_Title="３００人委員会";$tip_name4="３００人委員会";$tip_num4=9;$tip_act4=0;$TIPS_CLICKED_132=true;}}
			else if($i==5){if(#TIPS_（ｒｙ){$tip_Title="（ｒｙ";$tip_name5="（ｒｙ";$tip_num5=9;$tip_act5=0;$TIPS_CLICKED_133=true;}}
			else if($i==6){
				if(#ClearAll){
					$tip_Title="キキョウ";
					$tip_name6="キキョウ";
					$tip_num6=9;
					$tip_act6=0;
					$TIPS_CLICKED_135=true;
				}
			}else if($i==7){
				if(#ClearAll){
					$tip_Title="グラジオラス";
					$tip_name7="グラジオラス";
					$tip_num7=9;
					$tip_act7=0;
					$TIPS_CLICKED_136=true;
				}
			}else if($i==8){
				if(#ClearAll){
					$tip_Title="スイレン";
					$tip_name8="スイレン";
					$tip_num8=9;
					$tip_act8=0;
					$TIPS_CLICKED_137=true;
				}
			}else if($i==9){
				if(#ClearAll){
					$tip_Title="スノウドロップ";
					$tip_name9="スノウドロップ";
					$tip_num9=9;
					$tip_act9=0;
					$TIPS_CLICKED_138=true;
				}
			}else if($i==10){
				if(#ClearAll){
					$tip_Title="ダリア";
					$tip_name10="ダリア";
					$tip_num10=9;
					$tip_act10=0;
					$TIPS_CLICKED_139=true;
				}
			}else if($i==11){
				if(#ClearAll){
					$tip_Title="トリカブト";
					$tip_name11="トリカブト";
					$tip_num11=9;
					$tip_act11=0;
					$TIPS_CLICKED_140=true;
				}
			}else if($i==12){
				if(#ClearAll){
					$tip_Title="バラ";
					$tip_name12="バラ";
					$tip_num12=9;
					$tip_act12=0;
					$TIPS_CLICKED_141=true;
				}
			}else if($i==13){
				if(#ClearAll){
					$tip_Title="リンドウ";
					$tip_name13="リンドウ";
					$tip_num13=9;
					$tip_act13=0;
					$TIPS_CLICKED_142=true;
				}
			}else if($i==14){$tip_Title="　";
			}else if($i==15){
					$tip_Title="―――――――――――――― ";
					$tip_num15=0;
					$tip_act15=999;
			}else if($i==16){
	..//カルテ診断
				if(#ClearG&&!$KarteNow){
					$j=#KartePoint*4;
					$title="カルテ診断結果……"+$j+"点";
					$tip_Title=$title;
					$TIPS_CLICKED_134=true;
					$tip_num16=9;
					}
			}

		}

		$tip_nut="WND_title/tips_"+$i;

		CreateChoice($tip_nut);

		$tips_nutB="WND_title/tips_before_" +$i;
		$tips_nutA="WND_title/tips_affter_" +$i;
		$tips_nutBA="tips_before_" +$i;
		$tips_nutAA="tips_affter_" +$i;
		$tips_nutus="WND_title/tips_" +$i+ "/MouseUsual/_img";
		$tips_nut2="WND_title/tips_" +$i+ "/MouseOver/_img";


	if($tip_Title=="かおすへっど"){
		$Tip_Count2 = String("%03d", $Tip_Count);
		$tip_Title = $Tip_Count2 + ":";
		$Tip_Count++;
	}else if($tip_Title=="―――――――――――――― "){
	}else if($tip_Title=="　"){

	}else{
		$Tip_Count2 = String("%03d", $Tip_Count);
		$tip_Title = $Tip_Count2 + ":" + $tip_Title;
		$Tip_Count++;
	}

		$tips_title_y=($i*25)+50;
		$tips_title_y2=($i*25)+50;

		SetFont("ＭＳ ゴシック",16,#FFFFFF,#000000,500,LEFTDOWN);
		CreateText($tips_nutB,2200,76,$tips_title_y,auto,auto,$tip_Title);
		Request($tips_nutB,PushText);
		Request($tips_nutB,NoLog);
	SetAlias($tips_nutB,$tips_nutBA);
		SetFont("ＭＳ ゴシック",16,#3CA0A0,#000000,500,LEFTDOWN);
		CreateText($tips_nutA,2200,76,$tips_title_y,auto,auto,$tip_Title);
		Request($tips_nutA,PushText);
		Request($tips_nutA,NoLog);
	SetAlias($tips_nutA,$tips_nutAA);

		CreateTexture($tips_nut2,2300,67,$tips_title_y2,tipbar);

		CreateTexture($tips_nutus,2100,67,$tips_title_y2,tipbar);
		Fade($tips_nutB, 0, 1000, null, true);
		Fade($tips_nutA, 0, 0, null, true);
		Fade($tips_nut2, 0, 0, null, true);
		Request($tips_nutus, Erase);


	if($tip_act15==999){if(!#CLICKED_999){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_999=false;}
	if($TIPS_CLICKED_1==true){if(!#CLICKED_1){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_1=false;}
	else if($TIPS_CLICKED_2==true){if(!#CLICKED_2){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_2=false;}
	else if($TIPS_CLICKED_3==true){if(!#CLICKED_3){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_3=false;}
	else if($TIPS_CLICKED_4==true){if(!#CLICKED_4){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_4=false;}
	else if($TIPS_CLICKED_5==true){if(!#CLICKED_5){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_5=false;}
	else if($TIPS_CLICKED_6==true){if(!#CLICKED_6){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_6=false;}
	else if($TIPS_CLICKED_7==true){if(!#CLICKED_7){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_7=false;}
	else if($TIPS_CLICKED_8==true){if(!#CLICKED_8){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_8=false;}
	else if($TIPS_CLICKED_9==true){if(!#CLICKED_9){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_9=false;}
	else if($TIPS_CLICKED_10==true){if(!#CLICKED_10){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_10=false;}
	else if($TIPS_CLICKED_11==true){if(!#CLICKED_11){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_11=false;}
	else if($TIPS_CLICKED_12==true){if(!#CLICKED_12){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_12=false;}
	else if($TIPS_CLICKED_13==true){if(!#CLICKED_13){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_13=false;}
	else if($TIPS_CLICKED_14==true){if(!#CLICKED_14){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_14=false;}
	else if($TIPS_CLICKED_15==true){if(!#CLICKED_15){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_15=false;}
	else if($TIPS_CLICKED_16==true){if(!#CLICKED_16){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_16=false;}
	else if($TIPS_CLICKED_17==true){if(!#CLICKED_17){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_17=false;}
	else if($TIPS_CLICKED_18==true){if(!#CLICKED_18){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_18=false;}
	else if($TIPS_CLICKED_19==true){if(!#CLICKED_19){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_19=false;}
	else if($TIPS_CLICKED_20==true){if(!#CLICKED_20){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_20=false;}
	else if($TIPS_CLICKED_21==true){if(!#CLICKED_21){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_21=false;}
	else if($TIPS_CLICKED_22==true){if(!#CLICKED_22){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_22=false;}
	else if($TIPS_CLICKED_23==true){if(!#CLICKED_23){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_23=false;}
	else if($TIPS_CLICKED_24==true){if(!#CLICKED_24){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_24=false;}
	else if($TIPS_CLICKED_25==true){if(!#CLICKED_25){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_25=false;}
	else if($TIPS_CLICKED_26==true){if(!#CLICKED_26){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_26=false;}
	else if($TIPS_CLICKED_27==true){if(!#CLICKED_27){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_27=false;}
	else if($TIPS_CLICKED_28==true){if(!#CLICKED_28){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_28=false;}
	else if($TIPS_CLICKED_29==true){if(!#CLICKED_29){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_29=false;}
	else if($TIPS_CLICKED_30==true){if(!#CLICKED_30){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_30=false;}
	else if($TIPS_CLICKED_31==true){if(!#CLICKED_31){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_31=false;}
	else if($TIPS_CLICKED_32==true){if(!#CLICKED_32){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_32=false;}
	else if($TIPS_CLICKED_33==true){if(!#CLICKED_33){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_33=false;}
	else if($TIPS_CLICKED_34==true){if(!#CLICKED_34){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_34=false;}
	else if($TIPS_CLICKED_35==true){if(!#CLICKED_35){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_35=false;}
	else if($TIPS_CLICKED_36==true){if(!#CLICKED_36){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_36=false;}
	else if($TIPS_CLICKED_37==true){if(!#CLICKED_37){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_37=false;}
	else if($TIPS_CLICKED_38==true){if(!#CLICKED_38){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_38=false;}
	else if($TIPS_CLICKED_39==true){if(!#CLICKED_39){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_39=false;}
	else if($TIPS_CLICKED_40==true){if(!#CLICKED_40){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_40=false;}
	else if($TIPS_CLICKED_41==true){if(!#CLICKED_41){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_41=false;}
	else if($TIPS_CLICKED_42==true){if(!#CLICKED_42){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_42=false;}
	else if($TIPS_CLICKED_43==true){if(!#CLICKED_43){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_43=false;}
	else if($TIPS_CLICKED_44==true){if(!#CLICKED_44){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_44=false;}
	else if($TIPS_CLICKED_45==true){if(!#CLICKED_45){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_45=false;}
	else if($TIPS_CLICKED_46==true){if(!#CLICKED_46){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_46=false;}
	else if($TIPS_CLICKED_47==true){if(!#CLICKED_47){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_47=false;}
	else if($TIPS_CLICKED_48==true){if(!#CLICKED_48){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_48=false;}
	else if($TIPS_CLICKED_49==true){if(!#CLICKED_49){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_49=false;}
	else if($TIPS_CLICKED_50==true){if(!#CLICKED_50){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_50=false;}
	else if($TIPS_CLICKED_51==true){if(!#CLICKED_51){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_51=false;}
	else if($TIPS_CLICKED_52==true){if(!#CLICKED_52){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_52=false;}
	else if($TIPS_CLICKED_53==true){if(!#CLICKED_53){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_53=false;}
	else if($TIPS_CLICKED_54==true){if(!#CLICKED_54){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_54=false;}
	else if($TIPS_CLICKED_55==true){if(!#CLICKED_55){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_55=false;}
	else if($TIPS_CLICKED_56==true){if(!#CLICKED_56){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_56=false;}
	else if($TIPS_CLICKED_57==true){if(!#CLICKED_57){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_57=false;}
	else if($TIPS_CLICKED_58==true){if(!#CLICKED_58){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_58=false;}
	else if($TIPS_CLICKED_59==true){if(!#CLICKED_59){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_59=false;}
	else if($TIPS_CLICKED_60==true){if(!#CLICKED_60){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_60=false;}
	else if($TIPS_CLICKED_61==true){if(!#CLICKED_61){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_61=false;}
	else if($TIPS_CLICKED_62==true){if(!#CLICKED_62){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_62=false;}
	else if($TIPS_CLICKED_63==true){if(!#CLICKED_63){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_63=false;}
	else if($TIPS_CLICKED_64==true){if(!#CLICKED_64){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_64=false;}
	else if($TIPS_CLICKED_65==true){if(!#CLICKED_65){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_65=false;}
	else if($TIPS_CLICKED_66==true){if(!#CLICKED_66){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_66=false;}
	else if($TIPS_CLICKED_67==true){if(!#CLICKED_67){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_67=false;}
	else if($TIPS_CLICKED_68==true){if(!#CLICKED_68){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_68=false;}
	else if($TIPS_CLICKED_69==true){if(!#CLICKED_69){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_69=false;}
	else if($TIPS_CLICKED_70==true){if(!#CLICKED_70){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_70=false;}
	else if($TIPS_CLICKED_71==true){if(!#CLICKED_71){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_71=false;}
	else if($TIPS_CLICKED_72==true){if(!#CLICKED_72){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_72=false;}
	else if($TIPS_CLICKED_73==true){if(!#CLICKED_73){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_73=false;}
	else if($TIPS_CLICKED_74==true){if(!#CLICKED_74){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_74=false;}
	else if($TIPS_CLICKED_75==true){if(!#CLICKED_75){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_75=false;}
	else if($TIPS_CLICKED_76==true){if(!#CLICKED_76){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_76=false;}
	else if($TIPS_CLICKED_77==true){if(!#CLICKED_77){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_77=false;}
	else if($TIPS_CLICKED_78==true){if(!#CLICKED_78){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_78=false;}
	else if($TIPS_CLICKED_79==true){if(!#CLICKED_79){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_79=false;}
	else if($TIPS_CLICKED_80==true){if(!#CLICKED_80){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_80=false;}
	else if($TIPS_CLICKED_81==true){if(!#CLICKED_81){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_81=false;}
	else if($TIPS_CLICKED_82==true){if(!#CLICKED_82){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_82=false;}
	else if($TIPS_CLICKED_83==true){if(!#CLICKED_83){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_83=false;}
	else if($TIPS_CLICKED_84==true){if(!#CLICKED_84){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_84=false;}
	else if($TIPS_CLICKED_85==true){if(!#CLICKED_85){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_85=false;}
	else if($TIPS_CLICKED_86==true){if(!#CLICKED_86){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_86=false;}
	else if($TIPS_CLICKED_87==true){if(!#CLICKED_87){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_87=false;}
	else if($TIPS_CLICKED_88==true){if(!#CLICKED_88){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_88=false;}
	else if($TIPS_CLICKED_89==true){if(!#CLICKED_89){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_89=false;}
	else if($TIPS_CLICKED_90==true){if(!#CLICKED_90){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_90=false;}
	else if($TIPS_CLICKED_91==true){if(!#CLICKED_91){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_91=false;}
	else if($TIPS_CLICKED_92==true){if(!#CLICKED_92){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_92=false;}
	else if($TIPS_CLICKED_93==true){if(!#CLICKED_93){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_93=false;}
	else if($TIPS_CLICKED_94==true){if(!#CLICKED_94){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_94=false;}
	else if($TIPS_CLICKED_95==true){if(!#CLICKED_95){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_95=false;}
	else if($TIPS_CLICKED_96==true){if(!#CLICKED_96){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_96=false;}
	else if($TIPS_CLICKED_97==true){if(!#CLICKED_97){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_97=false;}
	else if($TIPS_CLICKED_98==true){if(!#CLICKED_98){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_98=false;}
	else if($TIPS_CLICKED_99==true){if(!#CLICKED_99){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_99=false;}
	else if($TIPS_CLICKED_100==true){if(!#CLICKED_100){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_100=false;}
	else if($TIPS_CLICKED_101==true){if(!#CLICKED_101){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_101=false;}
	else if($TIPS_CLICKED_102==true){if(!#CLICKED_102){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_102=false;}
	else if($TIPS_CLICKED_103==true){if(!#CLICKED_103){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_103=false;}
	else if($TIPS_CLICKED_104==true){if(!#CLICKED_104){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_104=false;}
	else if($TIPS_CLICKED_105==true){if(!#CLICKED_105){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_105=false;}
	else if($TIPS_CLICKED_106==true){if(!#CLICKED_106){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_106=false;}
	else if($TIPS_CLICKED_107==true){if(!#CLICKED_107){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_107=false;}
	else if($TIPS_CLICKED_108==true){if(!#CLICKED_108){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_108=false;}
	else if($TIPS_CLICKED_109==true){if(!#CLICKED_109){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_109=false;}
	else if($TIPS_CLICKED_110==true){if(!#CLICKED_110){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_110=false;}
	else if($TIPS_CLICKED_111==true){if(!#CLICKED_111){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_111=false;}
	else if($TIPS_CLICKED_112==true){if(!#CLICKED_112){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_112=false;}
	else if($TIPS_CLICKED_113==true){if(!#CLICKED_113){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_113=false;}
	else if($TIPS_CLICKED_114==true){if(!#CLICKED_114){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_114=false;}
	else if($TIPS_CLICKED_115==true){if(!#CLICKED_115){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_115=false;}
	else if($TIPS_CLICKED_116==true){if(!#CLICKED_116){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_116=false;}
	else if($TIPS_CLICKED_117==true){if(!#CLICKED_117){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_117=false;}
	else if($TIPS_CLICKED_118==true){if(!#CLICKED_118){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_118=false;}
	else if($TIPS_CLICKED_119==true){if(!#CLICKED_119){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_119=false;}
	else if($TIPS_CLICKED_120==true){if(!#CLICKED_120){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_120=false;}
	else if($TIPS_CLICKED_121==true){if(!#CLICKED_121){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_121=false;}
	else if($TIPS_CLICKED_122==true){if(!#CLICKED_122){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_122=false;}
	else if($TIPS_CLICKED_123==true){if(!#CLICKED_123){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_123=false;}
	else if($TIPS_CLICKED_124==true){if(!#CLICKED_124){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_124=false;}
	else if($TIPS_CLICKED_125==true){if(!#CLICKED_125){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_125=false;}
	else if($TIPS_CLICKED_126==true){if(!#CLICKED_126){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_126=false;}
	else if($TIPS_CLICKED_127==true){if(!#CLICKED_127){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_127=false;}
	else if($TIPS_CLICKED_128==true){if(!#CLICKED_128){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_128=false;}
	else if($TIPS_CLICKED_129==true){if(!#CLICKED_129){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_129=false;}
	else if($TIPS_CLICKED_130==true){if(!#CLICKED_130){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_130=false;}
	else if($TIPS_CLICKED_131==true){if(!#CLICKED_131){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_131=false;}
	else if($TIPS_CLICKED_132==true){if(!#CLICKED_132){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_132=false;}
	else if($TIPS_CLICKED_133==true){if(!#CLICKED_133){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_133=false;}
	else if($TIPS_CLICKED_134==true){if(!#CLICKED_134){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_134=false;}
	else if($TIPS_CLICKED_135==true){if(!#CLICKED_135){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_135=false;}
	else if($TIPS_CLICKED_136==true){if(!#CLICKED_136){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_136=false;}
	else if($TIPS_CLICKED_137==true){if(!#CLICKED_137){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_137=false;}
	else if($TIPS_CLICKED_138==true){if(!#CLICKED_138){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_138=false;}
	else if($TIPS_CLICKED_139==true){if(!#CLICKED_139){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_139=false;}
	else if($TIPS_CLICKED_140==true){if(!#CLICKED_140){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_140=false;}
	else if($TIPS_CLICKED_141==true){if(!#CLICKED_141){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_141=false;}
	else if($TIPS_CLICKED_142==true){if(!#CLICKED_142){Fade($tips_nutB,0,1000,null,true);}else{Fade($tips_nutA,0,1000,null,true);}$TIPS_CLICKED_142=false;}
	else{Fade($tips_nutB,0,1000,null,true);}

		$i++;
	}

	set_focus();

	//★★★★アンロック
	XBOX360_LockVideo(false);

	$SYSTEM_r_button_down=false;
	$SYSTEM_XBOX360_button_b_down=false;
	Fade("ページ移動用", 200, 0, null, false);
}

function show_tip($Page_Count)
{
	Fade("@ディソード", 100, 0, null, true);
	Delete("@ディソード");

	if($Page_Count==1){
		if($tip_num1==1){
			extTips_item_1();
			if(!#CLICKED_1){Fade("@WND_title/tips_affter_1",100,1000, null,true);Fade("@WND_title/tips_before_1",0,0, null,true);#CLICKED_1=true;}
		}else if($tip_num1==2){
			extTips_item_17();
			if(!#CLICKED_17){Fade("@WND_title/tips_affter_1",100,1000,null,true);Fade("@WND_title/tips_before_1",0,0,null,true);#CLICKED_17=true;}
		}else if($tip_num1==3){
			extTips_item_33();
			if(!#CLICKED_33){Fade("@WND_title/tips_affter_1",100,1000,null,true);Fade("@WND_title/tips_before_1",0,0,null,true);#CLICKED_33=true;}
		}else if($tip_num1==4){
			extTips_item_49();
			if(!#CLICKED_49){Fade("@WND_title/tips_affter_1",100,1000,null,true);Fade("@WND_title/tips_before_1",0,0,null,true);#CLICKED_49=true;}
		}else if($tip_num1==5){
			extTips_item_65();
			if(!#CLICKED_65){Fade("@WND_title/tips_affter_1",100,1000,null,true);Fade("@WND_title/tips_before_1",0,0,null,true);#CLICKED_65=true;}
		}else if($tip_num1==6){
			extTips_item_81();
			if(!#CLICKED_81){Fade("@WND_title/tips_affter_1",100,1000,null,true);Fade("@WND_title/tips_before_1",0,0,null,true);#CLICKED_81=true;}
		}else if($tip_num1==7){
			extTips_item_97();
			if(!#CLICKED_97){Fade("@WND_title/tips_affter_1",100,1000,null,true);Fade("@WND_title/tips_before_1",0,0,null,true);#CLICKED_97=true;}
		}else if($tip_num1==8){
			extTips_item_113();
			if(!#CLICKED_113){Fade("@WND_title/tips_affter_1",100,1000,null,true);Fade("@WND_title/tips_before_1",0,0,null,true);#CLICKED_113=true;}
		}else if($tip_num1==9){
			extTips_item_129();
			if(!#CLICKED_129){Fade("@WND_title/tips_affter_1",100,1000,null,true);Fade("@WND_title/tips_before_1",0,0,null,true);#CLICKED_129=true;}
		}
	}else if($Page_Count==2){
		if($tip_num2==1){
			extTips_item_2();
			if(!#CLICKED_2){Fade("@WND_title/tips_affter_2",100,1000,null,true);Fade("@WND_title/tips_before_2",0,0,null,true);#CLICKED_2=true;}
		}else if($tip_num2==2){
			extTips_item_18();
			if(!#CLICKED_18){Fade("@WND_title/tips_affter_2",100,1000,null,true);Fade("@WND_title/tips_before_2",0,0,null,true);#CLICKED_18=true;}
		}else if($tip_num2==3){
			extTips_item_34();
			if(!#CLICKED_34){Fade("@WND_title/tips_affter_2",100,1000,null,true);Fade("@WND_title/tips_before_2",0,0,null,true);#CLICKED_34=true;}
		}else if($tip_num2==4){
			extTips_item_50();
			if(!#CLICKED_50){Fade("@WND_title/tips_affter_2",100,1000,null,true);Fade("@WND_title/tips_before_2",0,0,null,true);#CLICKED_50=true;}
		}else if($tip_num2==5){
			extTips_item_66();
			if(!#CLICKED_66){Fade("@WND_title/tips_affter_2",100,1000,null,true);Fade("@WND_title/tips_before_2",0,0,null,true);#CLICKED_66=true;}
		}else if($tip_num2==6){
			extTips_item_82();
			if(!#CLICKED_82){Fade("@WND_title/tips_affter_2",100,1000,null,true);Fade("@WND_title/tips_before_2",0,0,null,true);#CLICKED_82=true;}
		}else if($tip_num2==7){
			extTips_item_98();
			if(!#CLICKED_98){Fade("@WND_title/tips_affter_2",100,1000,null,true);Fade("@WND_title/tips_before_2",0,0,null,true);#CLICKED_98=true;}
		}else if($tip_num2==8){
			extTips_item_114();
			if(!#CLICKED_114){Fade("@WND_title/tips_affter_2",100,1000,null,true);Fade("@WND_title/tips_before_2",0,0,null,true);#CLICKED_114=true;}
		}else if($tip_num2==9){
			extTips_item_130();
			if(!#CLICKED_130){Fade("@WND_title/tips_affter_2",100,1000,null,true);Fade("@WND_title/tips_before_2",0,0,null,true);#CLICKED_130=true;}
		}
	}else if($Page_Count==3){
		if($tip_num3==1){
			extTips_item_3();
			if(!#CLICKED_3){Fade("@WND_title/tips_affter_3",100,1000,null,true);Fade("@WND_title/tips_before_3",0,0,null,true);#CLICKED_3=true;}
		}else if($tip_num3==2){
			extTips_item_19();
			if(!#CLICKED_19){Fade("@WND_title/tips_affter_3",100,1000,null,true);Fade("@WND_title/tips_before_3",0,0,null,true);#CLICKED_19=true;}
		}else if($tip_num3==3){
			extTips_item_35();
			if(!#CLICKED_35){Fade("@WND_title/tips_affter_3",100,1000,null,true);Fade("@WND_title/tips_before_3",0,0,null,true);#CLICKED_35=true;}
		}else if($tip_num3==4){
			extTips_item_51();
			if(!#CLICKED_51){Fade("@WND_title/tips_affter_3",100,1000,null,true);Fade("@WND_title/tips_before_3",0,0,null,true);#CLICKED_51=true;}
		}else if($tip_num3==5){
			extTips_item_67();
			if(!#CLICKED_67){Fade("@WND_title/tips_affter_3",100,1000,null,true);Fade("@WND_title/tips_before_3",0,0,null,true);#CLICKED_67=true;}
		}else if($tip_num3==6){
			extTips_item_83();
			if(!#CLICKED_83){Fade("@WND_title/tips_affter_3",100,1000,null,true);Fade("@WND_title/tips_before_3",0,0,null,true);#CLICKED_83=true;}
		}else if($tip_num3==7){
			extTips_item_99();
			if(!#CLICKED_99){Fade("@WND_title/tips_affter_3",100,1000,null,true);Fade("@WND_title/tips_before_3",0,0,null,true);#CLICKED_99=true;}
		}else if($tip_num3==8){
			extTips_item_115();
			if(!#CLICKED_115){Fade("@WND_title/tips_affter_3",100,1000,null,true);Fade("@WND_title/tips_before_3",0,0,null,true);#CLICKED_115=true;}
		}else if($tip_num3==9){
			extTips_item_131();
			if(!#CLICKED_131){Fade("@WND_title/tips_affter_3",100,1000,null,true);Fade("@WND_title/tips_before_3",0,0,null,true);#CLICKED_131=true;}
		}
	}else if($Page_Count==4){
		if($tip_num4==1){
			extTips_item_4();
			if(!#CLICKED_4){Fade("@WND_title/tips_affter_4",100,1000,null,true);Fade("@WND_title/tips_before_4",0,0,null,true);#CLICKED_4=true;}
		}else if($tip_num4==2){
			extTips_item_20();
			if(!#CLICKED_20){Fade("@WND_title/tips_affter_4",100,1000,null,true);Fade("@WND_title/tips_before_4",0,0,null,true);#CLICKED_20=true;}
		}else if($tip_num4==3){
			extTips_item_36();
			if(!#CLICKED_36){Fade("@WND_title/tips_affter_4",100,1000,null,true);Fade("@WND_title/tips_before_4",0,0,null,true);#CLICKED_36=true;}
		}else if($tip_num4==4){
			extTips_item_52();
			if(!#CLICKED_52){Fade("@WND_title/tips_affter_4",100,1000,null,true);Fade("@WND_title/tips_before_4",0,0,null,true);#CLICKED_52=true;}
		}else if($tip_num4==5){
			extTips_item_68();
			if(!#CLICKED_68){Fade("@WND_title/tips_affter_4",100,1000,null,true);Fade("@WND_title/tips_before_4",0,0,null,true);#CLICKED_68=true;}
		}else if($tip_num4==6){
			extTips_item_84();
			if(!#CLICKED_84){Fade("@WND_title/tips_affter_4",100,1000,null,true);Fade("@WND_title/tips_before_4",0,0,null,true);#CLICKED_84=true;}
		}else if($tip_num4==7){
			extTips_item_100();
			if(!#CLICKED_100){Fade("@WND_title/tips_affter_4",100,1000,null,true);Fade("@WND_title/tips_before_4",0,0,null,true);#CLICKED_100=true;}
		}else if($tip_num4==8){
			extTips_item_116();
			if(!#CLICKED_116){Fade("@WND_title/tips_affter_4",100,1000,null,true);Fade("@WND_title/tips_before_4",0,0,null,true);#CLICKED_116=true;}
		}else if($tip_num4==9){
			extTips_item_132();
			if(!#CLICKED_132){Fade("@WND_title/tips_affter_4",100,1000,null,true);Fade("@WND_title/tips_before_4",0,0,null,true);#CLICKED_132=true;}
		}
	}else if($Page_Count==5){
		if($tip_num5==1){
			extTips_item_5();
			if(!#CLICKED_5){Fade("@WND_title/tips_affter_5",100,1000,null,true);Fade("@WND_title/tips_before_5",0,0,null,true);#CLICKED_5=true;}
		}else if($tip_num5==2){
			extTips_item_21();
			if(!#CLICKED_21){Fade("@WND_title/tips_affter_5",100,1000,null,true);Fade("@WND_title/tips_before_5",0,0,null,true);#CLICKED_21=true;}
		}else if($tip_num5==3){
			extTips_item_37();
			if(!#CLICKED_37){Fade("@WND_title/tips_affter_5",100,1000,null,true);Fade("@WND_title/tips_before_5",0,0,null,true);#CLICKED_37=true;}
		}else if($tip_num5==4){
			extTips_item_53();
			if(!#CLICKED_53){Fade("@WND_title/tips_affter_5",100,1000,null,true);Fade("@WND_title/tips_before_5",0,0,null,true);#CLICKED_53=true;}
		}else if($tip_num5==5){
			extTips_item_69();
			if(!#CLICKED_69){Fade("@WND_title/tips_affter_5",100,1000,null,true);Fade("@WND_title/tips_before_5",0,0,null,true);#CLICKED_69=true;}
		}else if($tip_num5==6){
			extTips_item_85();
			if(!#CLICKED_85){Fade("@WND_title/tips_affter_5",100,1000,null,true);Fade("@WND_title/tips_before_5",0,0,null,true);#CLICKED_85=true;}
		}else if($tip_num5==7){
			extTips_item_101();
			if(!#CLICKED_101){Fade("@WND_title/tips_affter_5",100,1000,null,true);Fade("@WND_title/tips_before_5",0,0,null,true);#CLICKED_101=true;}
		}else if($tip_num5==8){
			extTips_item_117();
			if(!#CLICKED_117){Fade("@WND_title/tips_affter_5",100,1000,null,true);Fade("@WND_title/tips_before_5",0,0,null,true);#CLICKED_117=true;}
		}else if($tip_num5==9){
			extTips_item_133();
			if(!#CLICKED_133){Fade("@WND_title/tips_affter_5",100,1000,null,true);Fade("@WND_title/tips_before_5",0,0,null,true);#CLICKED_133=true;}
		}
	}else if($Page_Count==6){
		if($tip_num6==1){
			extTips_item_6();
			if(!#CLICKED_6){Fade("@WND_title/tips_affter_6",100,1000,null,true);Fade("@WND_title/tips_before_6",0,0,null,true);#CLICKED_6=true;}
		}else if($tip_num6==2){
			extTips_item_22();
			if(!#CLICKED_22){Fade("@WND_title/tips_affter_6",100,1000,null,true);Fade("@WND_title/tips_before_6",0,0,null,true);#CLICKED_22=true;}
		}else if($tip_num6==3){
			extTips_item_38();
			if(!#CLICKED_38){Fade("@WND_title/tips_affter_6",100,1000,null,true);Fade("@WND_title/tips_before_6",0,0,null,true);#CLICKED_38=true;}
		}else if($tip_num6==4){
			extTips_item_54();
			if(!#CLICKED_54){Fade("@WND_title/tips_affter_6",100,1000,null,true);Fade("@WND_title/tips_before_6",0,0,null,true);#CLICKED_54=true;}
		}else if($tip_num6==5){
			extTips_item_70();
			if(!#CLICKED_70){Fade("@WND_title/tips_affter_6",100,1000,null,true);Fade("@WND_title/tips_before_6",0,0,null,true);#CLICKED_70=true;}
		}else if($tip_num6==6){
			extTips_item_86();
			if(!#CLICKED_86){Fade("@WND_title/tips_affter_6",100,1000,null,true);Fade("@WND_title/tips_before_6",0,0,null,true);#CLICKED_86=true;}
		}else if($tip_num6==7){
			extTips_item_102();
			if(!#CLICKED_102){Fade("@WND_title/tips_affter_6",100,1000,null,true);Fade("@WND_title/tips_before_6",0,0,null,true);#CLICKED_102=true;}
		}else if($tip_num6==8){
			extTips_item_118();
			if(!#CLICKED_118){Fade("@WND_title/tips_affter_6",100,1000,null,true);Fade("@WND_title/tips_before_6",0,0,null,true);#CLICKED_118=true;}
		}else if($tip_num6==9){
			extTips_item_135();
			if(!#CLICKED_135){Fade("@WND_title/tips_affter_6",100,1000,null,true);Fade("@WND_title/tips_before_6",0,0,null,true);#CLICKED_135=true;}
		}
	}else if($Page_Count==7){
		if($tip_num7==1){
			extTips_item_7();
			if(!#CLICKED_7){Fade("@WND_title/tips_affter_7",100,1000,null,true);Fade("@WND_title/tips_before_7",0,0,null,true);#CLICKED_7=true;}
		}else if($tip_num7==2){
			extTips_item_23();
			if(!#CLICKED_23){Fade("@WND_title/tips_affter_7",100,1000,null,true);Fade("@WND_title/tips_before_7",0,0,null,true);#CLICKED_23=true;}
		}else if($tip_num7==3){
			extTips_item_39();
			if(!#CLICKED_39){Fade("@WND_title/tips_affter_7",100,1000,null,true);Fade("@WND_title/tips_before_7",0,0,null,true);#CLICKED_39=true;}
		}else if($tip_num7==4){
			extTips_item_55();
			if(!#CLICKED_55){Fade("@WND_title/tips_affter_7",100,1000,null,true);Fade("@WND_title/tips_before_7",0,0,null,true);#CLICKED_55=true;}
		}else if($tip_num7==5){
			extTips_item_71();
			if(!#CLICKED_71){Fade("@WND_title/tips_affter_7",100,1000,null,true);Fade("@WND_title/tips_before_7",0,0,null,true);#CLICKED_71=true;}
		}else if($tip_num7==6){
			extTips_item_87();
			if(!#CLICKED_87){Fade("@WND_title/tips_affter_7",100,1000,null,true);Fade("@WND_title/tips_before_7",0,0,null,true);#CLICKED_87=true;}
		}else if($tip_num7==7){
			extTips_item_103();
			if(!#CLICKED_103){Fade("@WND_title/tips_affter_7",100,1000,null,true);Fade("@WND_title/tips_before_7",0,0,null,true);#CLICKED_103=true;}
		}else if($tip_num7==8){
			extTips_item_119();
			if(!#CLICKED_119){Fade("@WND_title/tips_affter_7",100,1000,null,true);Fade("@WND_title/tips_before_7",0,0,null,true);#CLICKED_119=true;}
		}else if($tip_num7==9){
			extTips_item_136();
			if(!#CLICKED_136){Fade("@WND_title/tips_affter_7",100,1000,null,true);Fade("@WND_title/tips_before_7",0,0,null,true);#CLICKED_136=true;}
		}
	}else if($Page_Count==8){
		if($tip_num8==1){
			extTips_item_8();
			if(!#CLICKED_8){Fade("@WND_title/tips_affter_8",100,1000,null,true);Fade("@WND_title/tips_before_8",0,0,null,true);#CLICKED_8=true;}
		}else if($tip_num8==2){
			extTips_item_24();
			if(!#CLICKED_24){Fade("@WND_title/tips_affter_8",100,1000,null,true);Fade("@WND_title/tips_before_8",0,0,null,true);#CLICKED_24=true;}
		}else if($tip_num8==3){
			extTips_item_40();
			if(!#CLICKED_40){Fade("@WND_title/tips_affter_8",100,1000,null,true);Fade("@WND_title/tips_before_8",0,0,null,true);#CLICKED_40=true;}
		}else if($tip_num8==4){
			extTips_item_56();
			if(!#CLICKED_56){Fade("@WND_title/tips_affter_8",100,1000,null,true);Fade("@WND_title/tips_before_8",0,0,null,true);#CLICKED_56=true;}
		}else if($tip_num8==5){
			extTips_item_72();
			if(!#CLICKED_72){Fade("@WND_title/tips_affter_8",100,1000,null,true);Fade("@WND_title/tips_before_8",0,0,null,true);#CLICKED_72=true;}
		}else if($tip_num8==6){
			extTips_item_88();
			if(!#CLICKED_88){Fade("@WND_title/tips_affter_8",100,1000,null,true);Fade("@WND_title/tips_before_8",0,0,null,true);#CLICKED_88=true;}
		}else if($tip_num8==7){
			extTips_item_104();
			if(!#CLICKED_104){Fade("@WND_title/tips_affter_8",100,1000,null,true);Fade("@WND_title/tips_before_8",0,0,null,true);#CLICKED_104=true;}
		}else if($tip_num8==8){
			extTips_item_120();
			if(!#CLICKED_120){Fade("@WND_title/tips_affter_8",100,1000,null,true);Fade("@WND_title/tips_before_8",0,0,null,true);#CLICKED_120=true;}
		}else if($tip_num8==9){
			extTips_item_137();
			if(!#CLICKED_137){Fade("@WND_title/tips_affter_8",100,1000,null,true);Fade("@WND_title/tips_before_8",0,0,null,true);#CLICKED_137=true;}
		}
	}else if($Page_Count==9){
		if($tip_num9==1){
			extTips_item_9();
			if(!#CLICKED_9){Fade("@WND_title/tips_affter_9",100,1000,null,true);Fade("@WND_title/tips_before_9",0,0,null,true);#CLICKED_9=true;}
		}else if($tip_num9==2){
			extTips_item_25();
			if(!#CLICKED_25){Fade("@WND_title/tips_affter_9",100,1000,null,true);Fade("@WND_title/tips_before_9",0,0,null,true);#CLICKED_25=true;}
		}else if($tip_num9==3){
			extTips_item_41();
			if(!#CLICKED_41){Fade("@WND_title/tips_affter_9",100,1000,null,true);Fade("@WND_title/tips_before_9",0,0,null,true);#CLICKED_41=true;}
		}else if($tip_num9==4){
			extTips_item_57();
			if(!#CLICKED_57){Fade("@WND_title/tips_affter_9",100,1000,null,true);Fade("@WND_title/tips_before_9",0,0,null,true);#CLICKED_57=true;}
		}else if($tip_num9==5){
			extTips_item_73();
			if(!#CLICKED_73){Fade("@WND_title/tips_affter_9",100,1000,null,true);Fade("@WND_title/tips_before_9",0,0,null,true);#CLICKED_73=true;}
		}else if($tip_num9==6){
			extTips_item_89();
			if(!#CLICKED_89){Fade("@WND_title/tips_affter_9",100,1000,null,true);Fade("@WND_title/tips_before_9",0,0,null,true);#CLICKED_89=true;}
		}else if($tip_num9==7){
			extTips_item_105();
			if(!#CLICKED_105){Fade("@WND_title/tips_affter_9",100,1000,null,true);Fade("@WND_title/tips_before_9",0,0,null,true);#CLICKED_105=true;}
		}else if($tip_num9==8){
			extTips_item_121();
			if(!#CLICKED_121){Fade("@WND_title/tips_affter_9",100,1000,null,true);Fade("@WND_title/tips_before_9",0,0,null,true);#CLICKED_121=true;}
		}else if($tip_num9==9){
			extTips_item_138();
			if(!#CLICKED_138){Fade("@WND_title/tips_affter_9",100,1000,null,true);Fade("@WND_title/tips_before_9",0,0,null,true);#CLICKED_138=true;}
		}
	}else if($Page_Count==10){
		if($tip_num10==1){
			extTips_item_10();
			if(!#CLICKED_10){Fade("@WND_title/tips_affter_10",100,1000,null,true);Fade("@WND_title/tips_before_10",0,0,null,true);#CLICKED_10=true;}
		}else if($tip_num10==2){
			extTips_item_26();
			if(!#CLICKED_26){Fade("@WND_title/tips_affter_10",100,1000,null,true);Fade("@WND_title/tips_before_10",0,0,null,true);#CLICKED_26=true;}
		}else if($tip_num10==3){
			extTips_item_42();
			if(!#CLICKED_42){Fade("@WND_title/tips_affter_10",100,1000,null,true);Fade("@WND_title/tips_before_10",0,0,null,true);#CLICKED_42=true;}
		}else if($tip_num10==4){
			extTips_item_58();
			if(!#CLICKED_58){Fade("@WND_title/tips_affter_10",100,1000,null,true);Fade("@WND_title/tips_before_10",0,0,null,true);#CLICKED_58=true;}
		}else if($tip_num10==5){
			extTips_item_74();
			if(!#CLICKED_74){Fade("@WND_title/tips_affter_10",100,1000,null,true);Fade("@WND_title/tips_before_10",0,0,null,true);#CLICKED_74=true;}
		}else if($tip_num10==6){
			extTips_item_90();
			if(!#CLICKED_90){Fade("@WND_title/tips_affter_10",100,1000,null,true);Fade("@WND_title/tips_before_10",0,0,null,true);#CLICKED_90=true;}
		}else if($tip_num10==7){
			extTips_item_106();
			if(!#CLICKED_106){Fade("@WND_title/tips_affter_10",100,1000,null,true);Fade("@WND_title/tips_before_10",0,0,null,true);#CLICKED_106=true;}
		}else if($tip_num10==8){
			extTips_item_122();
			if(!#CLICKED_122){Fade("@WND_title/tips_affter_10",100,1000,null,true);Fade("@WND_title/tips_before_10",0,0,null,true);#CLICKED_122=true;}
		}else if($tip_num10==9){
			extTips_item_139();
			if(!#CLICKED_139){Fade("@WND_title/tips_affter_10",100,1000,null,true);Fade("@WND_title/tips_before_10",0,0,null,true);#CLICKED_139=true;}
		}
	}else if($Page_Count==11){
		if($tip_num11==1){
			extTips_item_11();
			if(!#CLICKED_11){Fade("@WND_title/tips_affter_11",100,1000,null,true);Fade("@WND_title/tips_before_11",0,0,null,true);#CLICKED_11=true;}
		}else if($tip_num11==2){
			extTips_item_27();
			if(!#CLICKED_27){Fade("@WND_title/tips_affter_11",100,1000,null,true);Fade("@WND_title/tips_before_11",0,0,null,true);#CLICKED_27=true;}
		}else if($tip_num11==3){
			extTips_item_43();
			if(!#CLICKED_43){Fade("@WND_title/tips_affter_11",100,1000,null,true);Fade("@WND_title/tips_before_11",0,0,null,true);#CLICKED_43=true;}
		}else if($tip_num11==4){
			extTips_item_59();
			if(!#CLICKED_59){Fade("@WND_title/tips_affter_11",100,1000,null,true);Fade("@WND_title/tips_before_11",0,0,null,true);#CLICKED_59=true;}
		}else if($tip_num11==5){
			extTips_item_75();
			if(!#CLICKED_75){Fade("@WND_title/tips_affter_11",100,1000,null,true);Fade("@WND_title/tips_before_11",0,0,null,true);#CLICKED_75=true;}
		}else if($tip_num11==6){
			extTips_item_91();
			if(!#CLICKED_91){Fade("@WND_title/tips_affter_11",100,1000,null,true);Fade("@WND_title/tips_before_11",0,0,null,true);#CLICKED_91=true;}
		}else if($tip_num11==7){
			extTips_item_107();
			if(!#CLICKED_107){Fade("@WND_title/tips_affter_11",100,1000,null,true);Fade("@WND_title/tips_before_11",0,0,null,true);#CLICKED_107=true;}
		}else if($tip_num11==8){
			extTips_item_123();
			if(!#CLICKED_123){Fade("@WND_title/tips_affter_11",100,1000,null,true);Fade("@WND_title/tips_before_11",0,0,null,true);#CLICKED_123=true;}
		}else if($tip_num11==9){
			extTips_item_140();
			if(!#CLICKED_140){Fade("@WND_title/tips_affter_11",100,1000,null,true);Fade("@WND_title/tips_before_11",0,0,null,true);#CLICKED_140=true;}
		}
	}else if($Page_Count==12){
		if($tip_num12==1){
			extTips_item_12();
			if(!#CLICKED_12){Fade("@WND_title/tips_affter_12",100,1000,null,true);Fade("@WND_title/tips_before_12",0,0,null,true);#CLICKED_12=true;}
		}else if($tip_num12==2){
			extTips_item_28();
			if(!#CLICKED_28){Fade("@WND_title/tips_affter_12",100,1000,null,true);Fade("@WND_title/tips_before_12",0,0,null,true);#CLICKED_28=true;}
		}else if($tip_num12==3){
			extTips_item_44();
			if(!#CLICKED_44){Fade("@WND_title/tips_affter_12",100,1000,null,true);Fade("@WND_title/tips_before_12",0,0,null,true);#CLICKED_44=true;}
		}else if($tip_num12==4){
			extTips_item_60();
			if(!#CLICKED_60){Fade("@WND_title/tips_affter_12",100,1000,null,true);Fade("@WND_title/tips_before_12",0,0,null,true);#CLICKED_60=true;}
		}else if($tip_num12==5){
			extTips_item_76();
			if(!#CLICKED_76){Fade("@WND_title/tips_affter_12",100,1000,null,true);Fade("@WND_title/tips_before_12",0,0,null,true);#CLICKED_76=true;}
		}else if($tip_num12==6){
			extTips_item_92();
			if(!#CLICKED_92){Fade("@WND_title/tips_affter_12",100,1000,null,true);Fade("@WND_title/tips_before_12",0,0,null,true);#CLICKED_92=true;}
		}else if($tip_num12==7){
			extTips_item_108();
			if(!#CLICKED_108){Fade("@WND_title/tips_affter_12",100,1000,null,true);Fade("@WND_title/tips_before_12",0,0,null,true);#CLICKED_108=true;}
		}else if($tip_num12==8){
			extTips_item_124();
			if(!#CLICKED_124){Fade("@WND_title/tips_affter_12",100,1000,null,true);Fade("@WND_title/tips_before_12",0,0,null,true);#CLICKED_124=true;}
		}else if($tip_num12==9){
			extTips_item_141();
			if(!#CLICKED_141){Fade("@WND_title/tips_affter_12",100,1000,null,true);Fade("@WND_title/tips_before_12",0,0,null,true);#CLICKED_141=true;}
		}
	}else if($Page_Count==13){
		if($tip_num13==1){
			extTips_item_13();
			if(!#CLICKED_13){Fade("@WND_title/tips_affter_13",100,1000,null,true);Fade("@WND_title/tips_before_13",0,0,null,true);#CLICKED_13=true;}
		}else if($tip_num13==2){
			extTips_item_29();
			if(!#CLICKED_29){Fade("@WND_title/tips_affter_13",100,1000,null,true);Fade("@WND_title/tips_before_13",0,0,null,true);#CLICKED_29=true;}
		}else if($tip_num13==3){
			extTips_item_45();
			if(!#CLICKED_45){Fade("@WND_title/tips_affter_13",100,1000,null,true);Fade("@WND_title/tips_before_13",0,0,null,true);#CLICKED_45=true;}
		}else if($tip_num13==4){
			extTips_item_61();
			if(!#CLICKED_61){Fade("@WND_title/tips_affter_13",100,1000,null,true);Fade("@WND_title/tips_before_13",0,0,null,true);#CLICKED_61=true;}
		}else if($tip_num13==5){
			extTips_item_77();
			if(!#CLICKED_77){Fade("@WND_title/tips_affter_13",100,1000,null,true);Fade("@WND_title/tips_before_13",0,0,null,true);#CLICKED_77=true;}
		}else if($tip_num13==6){
			extTips_item_93();
			if(!#CLICKED_93){Fade("@WND_title/tips_affter_13",100,1000,null,true);Fade("@WND_title/tips_before_13",0,0,null,true);#CLICKED_93=true;}
		}else if($tip_num13==7){
			extTips_item_109();
			if(!#CLICKED_109){Fade("@WND_title/tips_affter_13",100,1000,null,true);Fade("@WND_title/tips_before_13",0,0,null,true);#CLICKED_109=true;}
		}else if($tip_num13==8){
			extTips_item_125();
			if(!#CLICKED_125){Fade("@WND_title/tips_affter_13",100,1000,null,true);Fade("@WND_title/tips_before_13",0,0,null,true);#CLICKED_125=true;}
		}else if($tip_num13==9){
			extTips_item_142();
			if(!#CLICKED_142){Fade("@WND_title/tips_affter_13",100,1000,null,true);Fade("@WND_title/tips_before_13",0,0,null,true);#CLICKED_142=true;}
		}
	}else if($Page_Count==14){
		if($tip_num14==1){
			extTips_item_14();
			if(!#CLICKED_14){Fade("@WND_title/tips_affter_14",100,1000,null,true);Fade("@WND_title/tips_before_14",0,0,null,true);#CLICKED_14=true;}
		}else if($tip_num14==2){
			extTips_item_30();
			if(!#CLICKED_30){Fade("@WND_title/tips_affter_14",100,1000,null,true);Fade("@WND_title/tips_before_14",0,0,null,true);#CLICKED_30=true;}
		}else if($tip_num14==3){
			extTips_item_46();
			if(!#CLICKED_46){Fade("@WND_title/tips_affter_14",100,1000,null,true);Fade("@WND_title/tips_before_14",0,0,null,true);#CLICKED_46=true;}
		}else if($tip_num14==4){
			extTips_item_62();
			if(!#CLICKED_62){Fade("@WND_title/tips_affter_14",100,1000,null,true);Fade("@WND_title/tips_before_14",0,0,null,true);#CLICKED_62=true;}
		}else if($tip_num14==5){
			extTips_item_78();
			if(!#CLICKED_78){Fade("@WND_title/tips_affter_14",100,1000,null,true);Fade("@WND_title/tips_before_14",0,0,null,true);#CLICKED_78=true;}
		}else if($tip_num14==6){
			extTips_item_94();
			if(!#CLICKED_94){Fade("@WND_title/tips_affter_14",100,1000,null,true);Fade("@WND_title/tips_before_14",0,0,null,true);#CLICKED_94=true;}
		}else if($tip_num14==7){
			extTips_item_110();
			if(!#CLICKED_110){Fade("@WND_title/tips_affter_14",100,1000,null,true);Fade("@WND_title/tips_before_14",0,0,null,true);#CLICKED_110=true;}
		}else if($tip_num14==8){
			extTips_item_126();
			if(!#CLICKED_126){Fade("@WND_title/tips_affter_14",100,1000,null,true);Fade("@WND_title/tips_before_14",0,0,null,true);#CLICKED_126=true;}
		}else if($tip_num14==9){

		}
	}else if($Page_Count==15){
		if($tip_num15==1){
			extTips_item_15();
			if(!#CLICKED_15){Fade("@WND_title/tips_affter_15",100,1000,null,true);Fade("@WND_title/tips_before_15",0,0,null,true);#CLICKED_15=true;}
		}else if($tip_num15==2){
			extTips_item_31();
			if(!#CLICKED_31){Fade("@WND_title/tips_affter_15",100,1000,null,true);Fade("@WND_title/tips_before_15",0,0,null,true);#CLICKED_31=true;}
		}else if($tip_num15==3){
			extTips_item_47();
			if(!#CLICKED_47){Fade("@WND_title/tips_affter_15",100,1000,null,true);Fade("@WND_title/tips_before_15",0,0,null,true);#CLICKED_47=true;}
		}else if($tip_num15==4){
			extTips_item_63();
			if(!#CLICKED_63){Fade("@WND_title/tips_affter_15",100,1000,null,true);Fade("@WND_title/tips_before_15",0,0,null,true);#CLICKED_63=true;}
		}else if($tip_num15==5){
			extTips_item_79();
			if(!#CLICKED_79){Fade("@WND_title/tips_affter_15",100,1000,null,true);Fade("@WND_title/tips_before_15",0,0,null,true);#CLICKED_79=true;}
		}else if($tip_num15==6){
			extTips_item_95();
			if(!#CLICKED_95){Fade("@WND_title/tips_affter_15",100,1000,null,true);Fade("@WND_title/tips_before_15",0,0,null,true);#CLICKED_95=true;}
		}else if($tip_num15==7){
			extTips_item_111();
			if(!#CLICKED_111){Fade("@WND_title/tips_affter_15",100,1000,null,true);Fade("@WND_title/tips_before_15",0,0,null,true);#CLICKED_111=true;}
		}else if($tip_num15==8){
			extTips_item_127();
			if(!#CLICKED_127){Fade("@WND_title/tips_affter_15",100,1000,null,true);Fade("@WND_title/tips_before_15",0,0,null,true);#CLICKED_127=true;}
		}else if($tip_num15==9){

		}
	}else if($Page_Count==16){
		if($tip_num16==1){
			extTips_item_16();
			if(!#CLICKED_16){Fade("@WND_title/tips_affter_16",100,1000,null,true);Fade("@WND_title/tips_before_16",0,0,null,true);#CLICKED_16=true;}
		}else if($tip_num16==2){
			extTips_item_32();
			if(!#CLICKED_32){Fade("@WND_title/tips_affter_16",100,1000,null,true);Fade("@WND_title/tips_before_16",0,0,null,true);#CLICKED_32=true;}
		}else if($tip_num16==3){
			extTips_item_48();
			if(!#CLICKED_48){Fade("@WND_title/tips_affter_16",100,1000,null,true);Fade("@WND_title/tips_before_16",0,0,null,true);#CLICKED_48=true;}
		}else if($tip_num16==4){
			extTips_item_64();
			if(!#CLICKED_64){Fade("@WND_title/tips_affter_16",100,1000,null,true);Fade("@WND_title/tips_before_16",0,0,null,true);#CLICKED_64=true;}
		}else if($tip_num16==5){
			extTips_item_80();
			if(!#CLICKED_80){Fade("@WND_title/tips_affter_16",100,1000,null,true);Fade("@WND_title/tips_before_16",0,0,null,true);#CLICKED_80=true;}
		}else if($tip_num16==6){
			extTips_item_96();
			if(!#CLICKED_96){Fade("@WND_title/tips_affter_16",100,1000,null,true);Fade("@WND_title/tips_before_16",0,0,null,true);#CLICKED_96=true;}
		}else if($tip_num16==7){
			extTips_item_112();
			if(!#CLICKED_112){Fade("@WND_title/tips_affter_16",100,1000,null,true);Fade("@WND_title/tips_before_16",0,0,null,true);#CLICKED_112=true;}
		}else if($tip_num16==8){
			extTips_item_128();
			if(!#CLICKED_128){Fade("@WND_title/tips_affter_16",100,1000,null,true);Fade("@WND_title/tips_before_16",0,0,null,true);#CLICKED_128=true;}
		}else if($tip_num16==9){
				$KarteResult=(#KartePoint/25)*100;
				if(!$KarteResult){
				//○実績No.32：リア充
					XBOX360_Achieved(32);
					extTips_item_134_1();
				}else if($KarteResult>=1&&$KarteResult<=33){
					extTips_item_134_2();
				}else if($KarteResult>=34&&$KarteResult<=66){
					extTips_item_134_3();
				}else if($KarteResult>=67&&$KarteResult<=99){
					extTips_item_134_4();
				}else if($KarteResult>=100){
				//○実績No.31：誇大妄想家
					XBOX360_Achieved(31);
					extTips_item_134_5();
				}
		}
	}


}


function set_focus()
{

if($p2==9){
	focus("@WND_title/tips_1","@WND_title/tips_2",DOWN);
	focus("@WND_title/tips_2","@WND_title/tips_3",DOWN);
	focus("@WND_title/tips_3","@WND_title/tips_4",DOWN);
	focus("@WND_title/tips_4","@WND_title/tips_5",DOWN);
	focus("@WND_title/tips_5","@WND_title/tips_6",DOWN);
	focus("@WND_title/tips_6","@WND_title/tips_7",DOWN);
	focus("@WND_title/tips_7","@WND_title/tips_8",DOWN);
	focus("@WND_title/tips_8","@WND_title/tips_9",DOWN);
	focus("@WND_title/tips_9","@WND_title/tips_10",DOWN);
	focus("@WND_title/tips_10","@WND_title/tips_11",DOWN);
	focus("@WND_title/tips_11","@WND_title/tips_12",DOWN);
	focus("@WND_title/tips_12","@WND_title/tips_13",DOWN);
	focus("@WND_title/tips_13","@WND_title/tips_16",DOWN);
	focus("@WND_title/tips_16","@WND_title/tips_1",DOWN);

	focus("@WND_title/tips_16","@WND_title/tips_13",UP);
	focus("@WND_title/tips_13","@WND_title/tips_12",UP);
	focus("@WND_title/tips_12","@WND_title/tips_11",UP);
	focus("@WND_title/tips_11","@WND_title/tips_10",UP);
	focus("@WND_title/tips_10","@WND_title/tips_9",UP);
	focus("@WND_title/tips_9","@WND_title/tips_8",UP);
	focus("@WND_title/tips_8","@WND_title/tips_7",UP);
	focus("@WND_title/tips_7","@WND_title/tips_6",UP);
	focus("@WND_title/tips_6","@WND_title/tips_5",UP);
	focus("@WND_title/tips_5","@WND_title/tips_4",UP);
	focus("@WND_title/tips_4","@WND_title/tips_3",UP);
	focus("@WND_title/tips_3","@WND_title/tips_2",UP);
	focus("@WND_title/tips_2","@WND_title/tips_1",UP);
	focus("@WND_title/tips_1","@WND_title/tips_16",UP);

//	focus("@WND_title/tips_1","@WND_title/tips_2",RIGHT);
//	focus("@WND_title/tips_2","@WND_title/tips_3",RIGHT);
//	focus("@WND_title/tips_3","@WND_title/tips_4",RIGHT);
//	focus("@WND_title/tips_4","@WND_title/tips_5",RIGHT);
//	focus("@WND_title/tips_5","@WND_title/tips_6",RIGHT);
//	focus("@WND_title/tips_6","@WND_title/tips_7",RIGHT);
//	focus("@WND_title/tips_7","@WND_title/tips_8",RIGHT);
//	focus("@WND_title/tips_8","@WND_title/tips_9",RIGHT);
//	focus("@WND_title/tips_9","@WND_title/tips_10",RIGHT);
//	focus("@WND_title/tips_10","@WND_title/tips_11",RIGHT);
//	focus("@WND_title/tips_11","@WND_title/tips_12",RIGHT);
//	focus("@WND_title/tips_12","@WND_title/tips_13",RIGHT);
//	focus("@WND_title/tips_13","@WND_title/tips_16",RIGHT);
//	focus("@WND_title/tips_16","@WND_title/tips_1",RIGHT);

//	focus("@WND_title/tips_16","@WND_title/tips_13",LEFT);
//	focus("@WND_title/tips_13","@WND_title/tips_12",LEFT);
//	focus("@WND_title/tips_12","@WND_title/tips_11",LEFT);
//	focus("@WND_title/tips_11","@WND_title/tips_10",LEFT);
//	focus("@WND_title/tips_10","@WND_title/tips_9",LEFT);
//	focus("@WND_title/tips_9","@WND_title/tips_8",LEFT);
//	focus("@WND_title/tips_8","@WND_title/tips_7",LEFT);
//	focus("@WND_title/tips_7","@WND_title/tips_6",LEFT);
//	focus("@WND_title/tips_6","@WND_title/tips_5",LEFT);
//	focus("@WND_title/tips_5","@WND_title/tips_4",LEFT);
//	focus("@WND_title/tips_4","@WND_title/tips_3",LEFT);
//	focus("@WND_title/tips_3","@WND_title/tips_2",LEFT);
//	focus("@WND_title/tips_2","@WND_title/tips_1",LEFT);
//	focus("@WND_title/tips_1","@WND_title/tips_16",LEFT);

	}else{

	focus("@WND_title/tips_1","@WND_title/tips_2",DOWN);
	focus("@WND_title/tips_2","@WND_title/tips_3",DOWN);
	focus("@WND_title/tips_3","@WND_title/tips_4",DOWN);
	focus("@WND_title/tips_4","@WND_title/tips_5",DOWN);
	focus("@WND_title/tips_5","@WND_title/tips_6",DOWN);
	focus("@WND_title/tips_6","@WND_title/tips_7",DOWN);
	focus("@WND_title/tips_7","@WND_title/tips_8",DOWN);
	focus("@WND_title/tips_8","@WND_title/tips_9",DOWN);
	focus("@WND_title/tips_9","@WND_title/tips_10",DOWN);
	focus("@WND_title/tips_10","@WND_title/tips_11",DOWN);
	focus("@WND_title/tips_11","@WND_title/tips_12",DOWN);
	focus("@WND_title/tips_12","@WND_title/tips_13",DOWN);
	focus("@WND_title/tips_13","@WND_title/tips_14",DOWN);
	focus("@WND_title/tips_14","@WND_title/tips_15",DOWN);
	focus("@WND_title/tips_15","@WND_title/tips_16",DOWN);
	focus("@WND_title/tips_16","@WND_title/tips_1",DOWN);

	focus("@WND_title/tips_16","@WND_title/tips_15",UP);
	focus("@WND_title/tips_15","@WND_title/tips_14",UP);
	focus("@WND_title/tips_14","@WND_title/tips_13",UP);
	focus("@WND_title/tips_13","@WND_title/tips_12",UP);
	focus("@WND_title/tips_12","@WND_title/tips_11",UP);
	focus("@WND_title/tips_11","@WND_title/tips_10",UP);
	focus("@WND_title/tips_10","@WND_title/tips_9",UP);
	focus("@WND_title/tips_9","@WND_title/tips_8",UP);
	focus("@WND_title/tips_8","@WND_title/tips_7",UP);
	focus("@WND_title/tips_7","@WND_title/tips_6",UP);
	focus("@WND_title/tips_6","@WND_title/tips_5",UP);
	focus("@WND_title/tips_5","@WND_title/tips_4",UP);
	focus("@WND_title/tips_4","@WND_title/tips_3",UP);
	focus("@WND_title/tips_3","@WND_title/tips_2",UP);
	focus("@WND_title/tips_2","@WND_title/tips_1",UP);
	focus("@WND_title/tips_1","@WND_title/tips_16",UP);

//	focus("@WND_title/tips_1","@WND_title/tips_2",RIGHT);
//	focus("@WND_title/tips_2","@WND_title/tips_3",RIGHT);
//	focus("@WND_title/tips_3","@WND_title/tips_4",RIGHT);
//	focus("@WND_title/tips_4","@WND_title/tips_5",RIGHT);
//	focus("@WND_title/tips_5","@WND_title/tips_6",RIGHT);
//	focus("@WND_title/tips_6","@WND_title/tips_7",RIGHT);
//	focus("@WND_title/tips_7","@WND_title/tips_8",RIGHT);
//	focus("@WND_title/tips_8","@WND_title/tips_9",RIGHT);
//	focus("@WND_title/tips_9","@WND_title/tips_10",RIGHT);
//	focus("@WND_title/tips_10","@WND_title/tips_11",RIGHT);
//	focus("@WND_title/tips_11","@WND_title/tips_12",RIGHT);
//	focus("@WND_title/tips_12","@WND_title/tips_13",RIGHT);
//	focus("@WND_title/tips_13","@WND_title/tips_14",RIGHT);
//	focus("@WND_title/tips_14","@WND_title/tips_15",RIGHT);
//	focus("@WND_title/tips_15","@WND_title/tips_16",RIGHT);
//	focus("@WND_title/tips_16","@WND_title/tips_1",RIGHT);

//	focus("@WND_title/tips_16","@WND_title/tips_15",LEFT);
//	focus("@WND_title/tips_15","@WND_title/tips_14",LEFT);
//	focus("@WND_title/tips_14","@WND_title/tips_13",LEFT);
//	focus("@WND_title/tips_13","@WND_title/tips_12",LEFT);
//	focus("@WND_title/tips_12","@WND_title/tips_11",LEFT);
//	focus("@WND_title/tips_11","@WND_title/tips_10",LEFT);
//	focus("@WND_title/tips_10","@WND_title/tips_9",LEFT);
//	focus("@WND_title/tips_9","@WND_title/tips_8",LEFT);
//	focus("@WND_title/tips_8","@WND_title/tips_7",LEFT);
//	focus("@WND_title/tips_7","@WND_title/tips_6",LEFT);
//	focus("@WND_title/tips_6","@WND_title/tips_5",LEFT);
//	focus("@WND_title/tips_5","@WND_title/tips_4",LEFT);
//	focus("@WND_title/tips_4","@WND_title/tips_3",LEFT);
//	focus("@WND_title/tips_3","@WND_title/tips_2",LEFT);
//	focus("@WND_title/tips_2","@WND_title/tips_1",LEFT);
//	focus("@WND_title/tips_1","@WND_title/tips_16",LEFT);
	}

}

function focus($a,$b,$key)
{
	$a=$a+"/MouseUsual/_img";
	$b=$b+"/MouseUsual/_img";
	SetNextFocus($a,$b,$key);
}


function extTips_item_set($itemfunc)
{
	//★★★★ロック
	XBOX360_LockVideo(true);
	SetFont("ＭＳ ゴシック",21,#FFFFFF,#000000,500,LEFTDOWN);
	LoadText($itemfunc,"@WND_comment","text",520,760,0,30);
	Move("@WND_comment/*",0,400,20,null,false);//徒歩修正
	Request("@WND_comment/*", Enter);
	Request("@WND_comment/*",NoLog);
	Request("@WND_comment/*",PushText);
	if(ImageVertical("@WND_comment/text")>=344){
		$itemcursor=true;
		$tpsItemPosOld=0;
		$itemvertical=ImageVertical("@WND_comment/text")-344;
	}else{
		$itemcursor=false;
		Fade("tps_ITEM_BAR",0,0,null,false);
	}
	//★★★★アンロック
	XBOX360_LockVideo(false);
}

..//■1アバター
function extTips_item_1()
{
	//■アバター
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■アバター（あばたー）
ｗｅｂサイトやチャット、オンラインゲームなどのコミュニティ内において用いられる、自分の分身となるキャラクター。
</PRE>

}

..//■安西先生
function extTips_item_2()
{
	//■安西先生
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■安西先生（あんざいせんせい）
某マンガに登場する顧問の先生。ネット上では、なにかにすがりたい気持ちになったときなどに、そのマンガ内でのセリフをパロディとして「安西先生、○○がしたいです……」というような使われ方をする。
</PRE>

}

..//■インフォームド・コンセント
function extTips_item_3()
{
	//■インフォームド・コンセント
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■インフォームド・コンセント（いんふぉーむど・こんせんと）
あらゆる契約について、正しい情報を伝えられた上で合意すること。
ただし日本では、主に医療関係にのみ使われる。
医師が患者に対して、治療内容（意味、効果、成功率、危険性、費用、代替治療法など）を詳細に、正しく、分かりやすく説明をする。そうして患者に理解してもらった上で治療について同意を得ること。
</PRE>
}

..//■インプリンティング
function extTips_item_4()
{
	//■インプリンティング
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■インプリンティング（いんぷりんてぃんぐ）
刷り込み、とも言う。
一部の動物において、生まれたばかりの子供が初めて目にしたものを自らの親だと自動的に思い込むこと。それがたとえ自らとは違う種の生物であったとしても刷り込みは起こり得る。
刷り込み後にも、別の親代わりのものを提示すれば、覚え直しをさせることは可能である。
</PRE>
}
..//■ウォーターボーディング
function extTips_item_5()
{

	//■ウォーターボーディング
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ウォーターボーディング（うぉーたーぼーでぃんぐ）
拷問方法のひとつ。足を頭より高い位置に固定して仰向けに寝かせた相手の口や鼻に、上から水を直接注ぎ込む。これにより窒息状態にして、溺死する錯覚を効果的に与えることができる。この溺死の錯覚は痛覚ではないので、肉体的損傷を与えないという意味において、アメリカはウォーターボーディングをジュネーヴ条約が禁止する強度の拷問には含まれないと主張している。
</PRE>

}

..//■うｐ
function extTips_item_6()
{
	//■うｐ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■うｐ（うぷ）
アップロードの略。
</PRE>

}


..//■永久機関
function extTips_item_7()
{
	//■永久機関
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■永久機関（えいきゅうきかん）
外部からなんらのエネルギーを受け取らなくても動き続けることのできる装置。
</PRE>
}

..//■エクステ
function extTips_item_8()
{
	//■エクステ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■エクステ（えくすて）
ヘアーエクステンションの略。付け毛、かつらの一種。主に女性がおしゃれを目的に身に付けるものを指す。
</PRE>
}

..//■オサレ
function extTips_item_9()
{
	//■オサレ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■オサレ（おされ）
『おしゃれ』をもじったもの。
</PRE>
}

..//■オタ芸
function extTips_item_10()
{
	//■オタ芸
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■オタ芸（おたげい）
アイドルのコンサートなどにおいて、一部のファンが客席で見せる、独特なかけ声やパフォーマンスのこと。身体を激しく動かすようなパフォーマンスもあり、それぞれの動きには名称が付けられている。客席でファンが一糸乱れぬオタ芸を披露する姿は圧巻。
</PRE>
}

..//■オーバーニーソ
function extTips_item_11()
{
	//■オーバーニーソ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■オーバーニーソ（おーばーにーそ）
膝上まである靴下「オーバーニーソックス」の略。
</PRE>
}

..//■オフ会
function extTips_item_12()
{
	//■オフ会
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■オフ会（おふかい）
チャットや匿名掲示板など、ネット上で知り合った者同士が、実際に同じ場所に集まって、直接会うこと。
</PRE>
}

..//13
..//■俺ＴＵＥＥＥプレイ
function extTips_item_13()
{
	//■俺ＴＵＥＥＥプレイ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■俺ＴＵＥＥＥプレイ（おれつえええプレイ）
コンピュータゲーム用語。「ＴＵＥＥＥ」は「強い」を意味する。自分がとても強い状態で、なおかつ敵がとても弱い状態。なんの苦労もせずに敵を倒していくことができるため、とても爽快。
</PRE>
}


..//■ガクブル
function extTips_item_14()
{
	//■ガクブル
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ガクブル（がくぶる）
「ガクガクブルブルと恐怖で身体が震える」の略。
</PRE>
}


..//■霞の構え
function extTips_item_15()
{
	//■■霞の構え
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■霞の構え（かすみのかまえ）
殺陣において使われる構えの一種。切先を相手に向け、刀身を水平にして、顔の横で柄を握る。古流剣術によく見られた構えであり、目の高さに剣を構えることで相手の両目を横薙ぎに切り払うことを目的としている。目潰しされた相手の視界が「霞がかかったようになる」ことが名の由来と言われている。
</PRE>
}



..//■かまいたち現象
function extTips_item_16()
{
	//■かまいたち現象
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■かまいたち現象（かまいたちげんしょう）
ごく稀に、身体に突然鋭い刃物で切ったような傷が付く現象のこと。
かまいたち（鎌鼬）とは、日本の甲信越地方に伝えられる風の妖怪である。かまいたちは両手に鎌のような鋭い爪を持ち、それで人に切りつけることで上記のような現象が発生すると伝承されていた。
実際になぜかまいたち現象が発生するのか、その原因は完全には解明されていない。
</PRE>
}


..//■ネ申
function extTips_item_17()
{
	//■ネ申
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ネ申（かみ）
「神」という漢字のパーツを分解してもじったもの。同様の用例としては「儲（信者）」などがある。
</PRE>
}


..//■基本相互作用
function extTips_item_18()
{
	//■基本相互作用
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■基本相互作用（きほんそうごさよう）
物理学において、素粒子間に相互に作用する、４つの力。電磁相互作用、弱い相互作用、強い相互作用、重力相互作用の４種類。
すべての素粒子と４種の基本相互作用を統一的に記述できる理論は完成されていない。
もしその理論が完成した場合、それは超極小世界から全宇宙規模の世界までを一貫して説明できる理論になることが予想されている。
</PRE>
}


..//■キャストオフ
function extTips_item_19()
{
	//■キャストオフ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■キャストオフ（きゃすとおふ）
２００６年頃から、美少女フィギュアにおいて増えてきた仕様で、服などのパーツをあらかじめ簡易に取り外しできるように作ることで、ヌード（あるいはそれに近い状態）にできること。
</PRE>
}


..//■ギルド
function extTips_item_20()
{
	//■ギルド
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ギルド（ぎるど）
オンラインゲームにおいて、あるプレイヤーを中心とした固定メンバーによる集まり。ともに冒険したり、チャットで会話したりする小さなコミュニティのようなもので、ゲーム上だけでなく実際に
会ってオフ会を開くようなギルドもある。
</PRE>
}


..//■きんもーっ☆
function extTips_item_21()
{
	//■きんもーっ☆
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■きんもーっ☆（きんもーっ）
気持ち悪い。
</PRE>
}


..//■空気嫁
function extTips_item_22()
{
	//■空気嫁
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■空気嫁（くうきよめ）
その場の空気を読むことを強制する発言。罵倒に近い意味で用いられることが多い。「空気を読め」
</PRE>
}


..//■空孔理論
function extTips_item_23()
{
	//■空孔理論
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■空孔理論（くうこうりろん）
ディラックが導き出したディラック方程式は、それまで存在しなかった『負のエネルギー』を持つ電子という不可解な答えを生み出した。
これを解釈するために、ディラックの海の存在を指摘したものが空孔理論である。
ディラックの海は本来、観測不可能である。なぜなら『無限に崩壊し続ける物質で満たされた空間』は目で見ることなど誰にもできないからである。
だが、真空との境界面に高いエネルギーを与えると、一時的に真空が崩壊し、負エネルギー電子が正エネルギーに変わり境界面を突き抜けてくる。
この正エネルギーを観測することでディラックの海の存在が実証できる。
</PRE>
}


..//■黒キャラ
function extTips_item_24()
{
	//■黒キャラ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■黒キャラ（くろきゃら）
「腹黒い性格の人（キャラクター）」という意味。心の中ではよからぬことを考えている人、表面的な印象と実際の性格に大きなギャップがある人、他人に対して悪意を持っている人などを指す。そのような、本来であればネガティブな要素に対して魅力を感じる人もいるようだ。
</PRE>
}


..//■黒ミサ
function extTips_item_25()
{
	//■黒ミサ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■黒ミサ（くろみさ）
サタン崇拝者が行う儀式。サバトとも呼ばれる。カトリック教会のミサとは真逆のことを行う。
黒ミサが始まると巨大な山羊の姿をした魔王が現れる。魔女たちはその山羊の尻に接吻し、葡萄酒の代わりに幼児の血を飲み、魔道書が読み上げられ、淫靡な行為を繰り広げると言われている。
一説には、性欲を抑圧された神父や神学者たちが、異端者を弾圧するために妄想で作り上げた概念だとする説もある。
</PRE>
}


..//■劇場型犯罪
function extTips_item_26()
{
	//■劇場型犯罪
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■劇場型犯罪（げきじょうがたはんざい）
国民注視の中で行われる犯罪。マスコミによって犯罪やその捜査がドラマのように逐一報道され、犯人が犯行声明などを送ることもある。犯人を英雄視する人や模倣犯が現れたりするなどの混乱が起きやすい。
</PRE>
}


..//■グラジオール記黙示録詩編
function extTips_item_27()
{
	//■グラジオール記黙示録詩編
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■グラジオール記黙示録詩編（ぐらじおーるきもくしろくしへん）
東欧に伝わる邪心王グラジオールの神話を元にした小説（架空）。
七人の黒騎士とグラジオールとの戦いを描いた全２３巻のハイ・ファンタジー作品。著者はＲ・Ｃ・Ｏ・ツィーグラー。１９２９年～１９５１年に渡って書かれ、いくつかの言語に翻訳されたが、その難解な文章のせいで一般にはあまり浸透しなかった。
ツィーグラーのグラジオール神話関連の著作には他に『グラジオール列王記邪心編』や『使徒からの手紙』などがあり、それらをまとめてグラジオール・サーガと呼ぶ。
</PRE>
}


..//■ゲシュタルト崩壊
function extTips_item_28()
{
	//■ゲシュタルト崩壊
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ゲシュタルト崩壊（げしゅたるとほうかい）
自明性の喪失。認識力の低下。心理学における概念のひとつ。ゲシュタルトはドイツ語で「形態」を意味する。人の脳は、視覚で捉えたものに対して、経験による環境、境遇、知識などのアイデンティティと照らし合わせて「それはＡである」となんの疑問もなく認識している。だがなんらかのきっかけによりそのアイデンティティが否定されることで、当たり前が当たり前ではなくなり、「Ａを見ているがそれをＡだと認識できない」という状態に陥ることを言う。
</PRE>
}


..//■ゲーム脳
function extTips_item_29()
{
	//■ゲーム脳
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ゲーム脳（げーむのう）
ゲームをプレイ中の人間は、脳のβ波の放出が通常に比べ極端に少なくなるという測定結果により、認知症と似たような状態になり情動抑制や判断力などが慢性的に低下する、という説。
マスコミによって大々的に喧伝され一時期社会問題にもなったが、脳波の測定方法などに曖昧な点が多く、その信憑性を疑う声もある。
</PRE>
}


..//■孔明の罠
function extTips_item_30()
{
	//■孔明の罠
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■孔明の罠（こうめいのわな）
稀代の戦略家であった諸葛孔明の策を恐れるあまり、疑心暗鬼になってしまう者たちの戸惑いなどをネタにした言葉。
</PRE>
}


..//■コキュートス
function extTips_item_31()
{
	//■コキュートス
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■コキュートス（こきゅーとす）
ギリシア神話において、冥界の入り口にある２つの川のうちのひとつ。『嘆きの川』を意味する。死者はこの川を渡り、冥界へと入る。
</PRE>
}

..//32
..//■コングロマリット
function extTips_item_32()
{
	//■コングロマリット
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■コングロマリット（こんぐろまりっと）
直接の関連性を持たない異業種企業が合併を繰り返すことで形成される、巨大な企業体。複合企業とも言われる。コングロマリットが扱う業種は多岐に渡る。
</PRE>
}

..//■サーセン
function extTips_item_33()
{
	//■サーセン
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■サーセン（さーせん）
『すいません』をもじったもの。
『フヒヒｗｗｗサーセンｗｗｗ』とワンセットで使われることが多い。謝罪の言葉ではあるが意味通りに使われることはなく、相手に対して挑発したりからかったりする際に使われる。
</PRE>
}

..//■シナプス
function extTips_item_34()
{
	//■シナプス
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■シナプス（しなぷす）
神経細胞間、あるいは神経細胞と他の細胞との間に形成される、神経伝達物質を放出し受け止める部位。
手を繋いでいるような形状をしているが、シナプス同士には２０ナノメートルほどの隙間が空いている。この間隙を、神経伝達物質が浮遊するように移動していく。
</PRE>
}

..//■死亡フラグ
function extTips_item_35()
{
	//■死亡フラグ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■死亡フラグ（しぼうふらぐ）
死ぬことへの伏線。コンピュータゲーム用語。ポピュラーな例としては「オレ、この戦争が終わったら結婚するんだ」がある。
</PRE>
}


..//■集団ストーカー
function extTips_item_36()
{
	//■集団ストーカー
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■集団ストーカー（しゅうだんすとーかー）
組織的なストーカー行為のこと。
ただし被害者の後を集団が付きまとう、というわけではない。個人に対して、ごく些細な犯行（嫌がらせの類）を数人単位で何度も繰り返すことであり、場合によってはその嫌がらせのひとつひとつに被害者が関連性を見出すことすらできない巧妙さを持って行われる。
嫌がらせの具体的な例としては『被害者があちこちで、面識のない人にしょっちゅうぶつかられる』『深夜、被害者の家の前で車が何度もクラクションを鳴らす』『外出先で見ず知らずの人間が、被害者しか知らないはずの個人情報をほのめかし去っていく』などである。ひとつひとつだけを見ればそれほど気にならないものでも、１日に何度も、それを何ヶ月も続けられれば、被害者は精神的に追い詰められ、やがては意図的な嫌がらせ以外の、単なる日常的な風景にさえも怯え、誰も信用できなくなってしまう。
ただし、集団ストーカーは被害妄想と紙一重であり、その見極めは慎重に行われるべきである。
</PRE>
}

..//■触手ゲー
function extTips_item_37()
{
	//■触手ゲー
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■触手ゲー（しょくしゅげー）
触手状のモンスターにいろいろひどいことをされてしまう美少女を描いたゲームのこと。１８歳未満の人はプレイしてはいけない。
</PRE>
}


..//■職人
function extTips_item_38()
{
	//■職人
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■職人（しょくにん）
プロ顔負けのクオリティの高い画像や動画を、趣味として匿名で作り披露する人たちのこと。
</PRE>
}


..//■神経パルス
function extTips_item_39()
{
	//■神経パルス
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■神経パルス（しんけいぱるす）
生物の神経細胞を流れる刺激、電気信号。
素早く組織間で情報を伝えることができる。
</PRE>
}


..//■心神喪失
function extTips_item_40()
{
	//■心神喪失
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■心神喪失（しんしんそうしつ）
精神になんらかの障害を負い、自らの行動についての善悪などを判断する能力が失われた状態。
刑法第３９条１項では『心神喪失者の行為は、罰しない』と定められているため、責任能力を問われず無罪になることがある。
</PRE>
}


..//■儲
function extTips_item_41()
{
	//■儲（しんじゃ）
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■儲（しんじゃ）
信者。ある事柄について盲目的に崇拝していること。宗教の信者ではなく、ゲーム作品やアニメキャラクターが対象となる。
</PRE>
}


..//■スク水
function extTips_item_42()
{
	//■スク水
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■スク水（すくみず）
すくみず。スクール水着の略。主に小中高校までの学校の体育の授業において着用される、学校指定の水着。この場合、女児用のみに限定される。色やタイプによりさらに細かく分類される場合もある。ただし競泳用水着についてはスク水のカテゴリーに含まれるのかどうか、今現在もなお激しい議論が続けられている。
</PRE>
}


..//■ストックホルム症候群
function extTips_item_43()
{
	//■ストックホルム症候群
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ストックホルム症候群（すとっくほるむしょうこうぐん）
精神医学用語。立てこもり事件などにおいて、人質は閉鎖空間で犯人と長時間行動をともにせざるを得なくなる。その結果、自分に対してひどいことをしているはずの犯人に、逆に好意的な感情を抱くようになること。
これは、犯人に抵抗するよりも信頼関係を築いた方が生存確率が上がるという予測による、自己欺瞞のような状態とも言える。
１９７３年に実際に発生した、ストックホルムでの人質立てこもり事件からこの名前が付けられた。
</PRE>
}


..//■スニーキングミッション
function extTips_item_44()
{
	//■スニーキングミッション
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■スニーキングミッション（すにーきんぐみっしょん）
隠密作戦。コンシューマーゲームにおいて近年見られるようになったアクションゲームのジャンルの一つでもある。誰にも見つからないように敵地に潜入し目的を達成、脱出すること。
</PRE>
}


..//■スネーク
function extTips_item_45()
{
	//■スネーク
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■スネーク（すねーく）
某ゲームにおける、隠密行動のプロである主人公の名前。ネット上では、匿名調査や極秘調査を行う一般人の有志のことを指す。「スネークする」という使い方もある。
</PRE>
}


..//■星来オルジェル
function extTips_item_46()
{
	//■星来オルジェル
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■星来オルジェル（せいらおるじぇる）
ＴＶアニメ『ブラッドチューンＴＨＥ　ＡＮＩＭＡＴＩＯＮ』（架空）に登場するメインヒロイン。口癖は「ぼけなす」。
いわゆる典型的な幼なじみ系ツンデレキャラである。謎の使い魔『ナニカ』を連れている。
１７歳。流星学園２年生で、☆の力により魔法少女に変身できる。
魔法少女と言うだけあり、魔法のステッキ『サムライ☆コンデンサ』を持っている。その外観はステッキと呼ぶにはあまりにも凶悪で、はっきり言って巨大な金棒であり、星来は時にその魔法ステッキを物理的攻撃（端的に言えばぶん殴ること）にも使用する。
『ブラッドチューン』は元々はコミックで、メディアミックス展開によりアニメ化された。全２６話予定で現在も放映中。
</PRE>
}

..//■千里眼
function extTips_item_47()
{
	//■千里眼
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■千里眼（せんりがん）
透視とも言う。
その場にいながら千里（現在の単位でおよそ４０００ｋｍ）の先まで見通せるとされる超能力。
距離、角度、遮蔽物などの都合により、本来であれば肉眼で捉えることのできないものを、視覚的な感覚、あるいはイメージなどで見ることができる。
</PRE>
}

..//■洗脳
function extTips_item_48()
{
	//■洗脳
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■洗脳（せんのう）
暴力的な方法を用いて、強制的に相手の思想や主義を改造すること。
物理的方法（監禁、脅迫、暴力、薬物の使用など）あるいは精神的方法（罪の意識の植え付け、言葉による暴力）による暴力により外圧を与える。
マインドコントロールよりも強い人格改造方法である。
</PRE>
}


..//■属性
function extTips_item_49()
{
	//■属性
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■属性（ぞくせい）
趣味の傾向のこと。主に異性のタイプや、魅力を感じるフェチシズム的要素に対して使われる。メガネをかけた女性に魅力を感じるならば「メガネっ娘属性」であったり、ドジでおっちょこちょいな性格の女性に魅力を感じるならば「ドジっ娘属性」など。
同時に、そのようなフェチシズム的要素を持つ人のことを「属性持ち」略して「属性」と呼ぶ場合もある。おっとりした性格の年上の女性ならば「おっとりお姉さん属性（持ち）」であったり、年齢に比して容姿が幼く見える女性を「ロリ属性（持ち）」と呼んだりする。
</PRE>
}


..//■素粒子
function extTips_item_50()
{
	//■素粒子
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■素粒子（そりゅうし）
物質を形作っている最小単位。ただし明確な定義はない。
ある素粒子と対になっていて電荷が逆になっているものを反粒子と呼ぶ。
ディラックは空孔理論で、真空との境界面にできた空孔に対生成により反粒子（陽電子）が発生することを予想した。
</PRE>
}

..//■ソース
function extTips_item_51()
{
	//■ソース
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ソース（そーす）
出展元、資料、史料、ニュースソースのこと。その情報をどこから入手したか。
インターネットの匿名掲示板では、ウソの情報、誤報が大量に出回っているため、ソースを提示することは相手に信用してもらうためには大切なことである。
</PRE>
}


..//52
..//■ゾンビ
function extTips_item_52()
{
	//■ゾンビ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ゾンビ（ぞんび）
死体のままよみがえった人間のこと。元々の人格は失われており、ゆっくりした動きしかできないが凶暴で人を襲う。
ブードゥー教での刑罰で、テトロドトキシンから作った粉末『ゾンビパウダー』によって仮死状態にされた者が誤って埋葬されてしまい、酸欠によって脳に障害を負った状態だという説がある。
</PRE>
}

..//■ダウジング
function extTips_item_53()
{
	//■ダウジング
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ダウジング（だうじんぐ）
地下水脈や鉱脈などを、棒や振り子などの動きを頼りにして見つける技術。最もポピュラーなものとして、アングル・ロッド（Ｌ字型の針金）を２本使用する方法がある。ダウジングをする人のことはダウザーと呼ぶ。
人体にはいわゆる体内磁石のような物質があるとされ、地下水脈などにその体内磁石が反応して無意識に筋肉を動かしてしまう。これにより、あたかもロッドがひとりでに反応したように見える、という説が有力である。
</PRE>
}


..//■高杉
function extTips_item_54()
{
	//■高杉
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■高杉（たかすぎ）
『（値段等が）高すぎる』をもじったもの。
</PRE>
}

..//■チート
function extTips_item_55()
{
	//■チート
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■チート（ちーと）
コンピュータゲーム用語。直訳すると「ズルする」という意味。改造ツールなどを用いてゲームデータを勝手に改変すること。近年では制作者側が意図的にチートモードを搭載させたゲームも存在している。「隠しコマンド」と呼ばれるようなものもチートモードの一種である。
</PRE>
}

..//■厨
function extTips_item_56()
{
	//■厨
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■厨（ちゅう）
幼稚な発言や行動をする人。中学生の
『中』をもじったものでもある。
</PRE>
}


..//■中２病
function extTips_item_57()
{
	//■中２病
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■中２病（ちゅうにびょう）
日本の思春期の少年によく見られる、少し特殊な言動、行動を指す言葉。あるいは、思春期を過ぎたにもかかわらず思春期のような痛々しい言動をする人間に対して使われるからかいの言葉。
厭世的、反社会的、空想的な行動、子供として見られたくなくて背伸びした行動を取ることなどを指す。
本人はそれがいかにもかっこいいことと考えて行動しているが、大人から見るととても滑稽な姿に映る。
なお中２病をさらにカテゴライズしたものとして、アニメ的な設定のようなものが自分にあると思い込む『邪気眼』がある。
</PRE>
}

..//■超能力捜査官
function extTips_item_58()
{
	//■超能力捜査官
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■超能力捜査官（ちょうのうりょくそうさかん）
主にアメリカで、透視などの超能力を
使って犯罪などの捜査に協力する捜査官。日本のメディアにもしばしば登場する。だが実際はアメリカにはそのような役職は存在せず、また超能力による捜査の実効性についても極めて低いという見方が主流である。
</PRE>
}


..//■沈黙の兵器
function extTips_item_59()
{
	//■沈黙の兵器
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■沈黙の兵器（ちんもくのへいき）
世界規模で実施されるマインドコントールのためのシステム。これにより社会のオートメーション化、一部エリートをのぞくすべての人間を奴隷化できる。
アメリカで発見された極秘文書『SILENT WEAPONS FOR QUIET WARS』を元にしている。
</PRE>
}

..//■対生成
function extTips_item_60()
{
	//■対生成
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■対生成（ついせいせい）
高いエネルギーが原子核などに衝突することで、粒子と反粒子が生成される現象。
ディラックの空孔理論においては『真空の崩壊』を意味する。
逆に、粒子と反粒子が衝突すると、対消滅となる。
</PRE>
}

..//■釣り
function extTips_item_61()
{
	//■釣り
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■釣り（つり）
漁法の一つ。餌を付けた釣り糸を垂らして魚がかかるのを待つ。そこから転じて、ネット上の匿名掲示板では、他人を挑発するような意見、あるいはウソの情報等を書き込むことによって、それに騙され過剰に反応する人たちを見て楽しんだりする行為のことを言う。
</PRE>
}

..//■ツンデレ
function extTips_item_62()
{
	//■ツンデレ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ツンデレ（つんでれ）
普段はツンツンと生意気、二人っきりになるとデレデレといちゃつくヒロインのこと。だが近年、その定義は曖昧になりつつある。
</PRE>
}

..//■電磁波
function extTips_item_63()
{
	//■電磁波
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■電磁波（でんじは）
１８６４年にマクスウェルが理論的に予測した、電気と磁気のどちらもの性質を持つ波動のこと。両者がお互いに影響し合うことで、空間そのものが振動する状態が発生し、波となって周囲に伝播する。そのため、電磁放射とも呼ばれる。
周波数の違いによって、電波、赤外線、可視光線、紫外線、Ｘ線、ガンマ線と呼び分けられる。
電磁波が人体に与える悪影響については、世界保健機構（ＷＨＯ）が『因果関係があることを説明する科学的根拠はみられない』と発表しているが、逆に『因果関係がない』ことも証明されていない。
</PRE>
}

..//■天成神光会
function extTips_item_64()
{
	//■天成神光会
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■天成神光会（てんせいしんこうかい）
新興宗教（架空）。発会は１９３０年で、公称の信者数は約５００万人と言われているが、実数は２００万人ほどだと思われる。
強引で熱烈な布教活動が特徴で、そのためにトラブルも多発している。
２代目教祖である倉持雄大は絶対的なカリスマ性を持ち、信者からは絶対的な尊敬を得ている。
</PRE>
}

..//■転売厨
function extTips_item_65()
{
	//■転売厨
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■転売厨（てんばいちゅう）
手に入りにくい商品などを、ネットオークションで高額で販売する為だけに入手する人のことを指す蔑称。
</PRE>
}

..//■ディラックの海
function extTips_item_66()
{
	//■ディラックの海
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ディラックの海（でぃらっくのうみ）
世界に一様に分布しているとされる、観測不能の『あらゆる素粒子のスープ』。
物理学者ポール・ディラックが定義した、量子力学における概念。量子論と相対論を結びつけた波動方程式（ディラック方程式）の空孔理論に登場する。
ディラックは、真空状態について『負エネルギーの素粒子がびっしりと隙間なく埋まっていて、これ以上新たな負エネルギーの素粒子が生まれることのできない状態』だと定義した。これがディラックの海である。
</PRE>
}


..//■デジャヴ／ジャメヴュ
function extTips_item_67()
{
	//■デジャヴ／ジャメヴュ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■デジャヴ／ジャメヴュ（でじゃぶ／じゃめびゅ）
既視感（仏：Deja vu）のこと。
実際は一度も体験したことがないにもかかわらず、以前にもどこかで体験したように感じること。
単なる錯覚ではなく、夢や物忘れで済ませられないほどのリアルな『過去の実体験』としての感覚が伴う。ただし、その『過去』とはいつ、どこだったのかは当然ながら思い出すことはできず、結果強い違和感をもたらす。
原因はいまだ解明されていない。
記憶の『回復』と『既知』の機能の同期がズレるという、非常に稀で一時的な異常の際に起きる生理現象だとする説。脳の海馬傍回（空間処理と『慣れ』の感覚処理を受け持つ）に、痙攣のようなかすかな発作が起きるのが原因だとする説などがある。<BR>
既視感とは逆に、普段見慣れたもののはずなのに、それが初めて見るもののように感じられることを『未視感（仏：Jamais vu）』という。
</PRE>
}

..//■デバッガ
function extTips_item_68()
{
	//■デバッガ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■デバッガ（でばっが）
プログラムのバグを取り除き、修正する作業のことをデバッグと呼び、それを行うための専用のソフトウェア、あるいはデバッグ作業を行う人のことをデバッガと呼ぶ。
</PRE>
}

..//■デフォ
function extTips_item_69()
{
	//■デフォ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■デフォ（でふぉ）
「デフォルト（Default）」の略。コンピュータ・ソフトウェア用語で「初期状態」を指す。転じて「それが普通だ」「当たり前のことだ」という意味において一般会話で使われる。
</PRE>
}


..//70
..//■ドーパミン
function extTips_item_70()
{
	//■ドーパミン
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ドーパミン（どーぱみん）
脳内に存在する神経伝達物質。脳幹内のＡ９神経、及びＡ１０神経で主に産生され、ニューロンのシナプスから放出される。
人は普段の生活の中で様々な体験をすることで『学習』していく。ドーパミンはその『体験中の行動』の際に多く放出され、人がより学習しやすいよう感情をコントロールしている。
一方で、ドーパミンの過剰放出が原因ではないかとされる症状が多くある。幻覚、妄想、パラノイア、強迫性障害、注意欠陥多動性障害（ＡＤＨＤ）、薬物依存、煙草をやめられない、などである。
</PRE>
}


..//■中の人
function extTips_item_71()
{
	//■中の人
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■中の人（なかのひと）
最も一般的な使い方としては、アニメなどにおいてキャラクターを演じる声優のことを指す。他には、ある企業や組織の関係者を指す場合などもある。「中の人などいない！」という某マンガのセリフが語源だと言われている。
</PRE>
}

..//■日本語でおｋ
function extTips_item_72()
{
	//■日本語でおｋ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■日本語でおｋ（にほんごでおけ）
『おｋ』は『ＯＫ』を意味する。ネット掲示板等で、意味不明なことを書き込む人間に対して「ちゃんと相手に意味が通じるように書いてください」というような意味で使われる、からかいの言葉。
</PRE>
}


..//■ニューロン
function extTips_item_73()
{
	//■ニューロン
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ニューロン（にゅーろん）
脳細胞、神経細胞とも言う。情報処理のために特化した細胞。内部を神経パルスが流れ、様々な情報を伝える、言わば伝達装置のようなもの。
</PRE>
}


..//■寝オチ
function extTips_item_74()
{
	//■寝オチ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■寝オチ（ねおち）
ネットゲームやチャット中にモニタに向かったまま寝てしまい、無反応になっている状態。
</PRE>
}


..//■燃料投下
function extTips_item_75()
{
	//■燃料投下
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■燃料投下（ねんりょうとうか）
ブログやネット掲示板にて発生する『祭り』において、火に油を注ぐような行為をすること、あるいは新たな情報などがもたらされること。燃料投下が段階的に行われると、『祭り』はさらに盛り上がりを加速していく。
</PRE>
}

..//■脳死
function extTips_item_76()
{
	//■脳死
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■脳死（のうし）
脳の機能が停止しているが、人工呼吸器等により呼吸が保たれることで心臓機能が維持されている状態。
脳死には、大脳、小脳、脳幹のすべてが機能を停止した『全脳死』と、脳幹のみが機能を停止した『脳幹死』とがある。
誤解されがちなものとして『植物状態』があるが、これは大脳の機能（一部、または全て）が失われて意識はないものの、脳幹や小脳の機能は維持されており自発呼吸ができる状態を言う。植物状態の場合は、ごく稀に回復の可能性もある。
日本では、脳死かどうかを判定するための法令が定められており、以下の５項目を時間を開けて計２回確認する。
１：深い昏睡状態である
２：瞳孔の散大と固定が見られる
３：脳幹反射がない
４：脳波が平坦である
５：自発呼吸が停止している
</PRE>
}


..//■ノシ
function extTips_item_77()
{
	//■ノシ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ノシ（のし）
手を振っている仕草を表現した絵文字。「さよなら。またね」という別れの挨拶であったり、挙手、同意の意味などに使われる。読み方としては「のし」と呼ぶ人が多いようだ。
</PRE>
}

..//■廃人プレイ
function extTips_item_78()
{
	//■廃人プレイ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■廃人プレイ（はいじんぷれい）
部屋に引きこもり、食事や睡眠などの日常生活までも犠牲にして長時間にわたりゲームをプレイし続けること。主にＭＭＯＲＰＧにて使われる。
</PRE>
}

..//■バイオリズム
function extTips_item_79()
{
	//■バイオリズム
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■バイオリズム（ばいおりずむ）
生命体の生理状態（Physical）、感情の揺れ（Sensitivity）、知性（Intellectual）が周期的に変化していることを示したグラフのこと。
『バイオリズムが高い日は調子が良く、低い日は調子が悪い』というような使われ方をする場合が多い。
</PRE>
}


..//■はいてない
function extTips_item_80()
{
	//■はいてない
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■はいてない（はいてない）
イラストなどで構図上パンツが見えているべきであるのに、あたかもそれが見えていないかのような描き方。「もしかしたらパンツをはいてないのか？」という妄想をかき立てる。
</PRE>
}


..//■パラディン
function extTips_item_81()
{
	//■パラディン
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■パラディン（ぱらでぃん）
聖騎士。エンスー（エンパイア・スウィーパー・オンライン）でプレイヤーキャラクターがなることのできるクラスのひとつ。防御力の高さ、戦士系クラスでありながら回復魔法が使えること、闇属性への耐性が高いことが特徴。ただしある特定の条件を達成しなければクラスチェンジはできない。現在のエンスーでは最強と言われているクラス。
</PRE>
}

..//■パレイドリア
function extTips_item_82()
{
	//■パレイドリア
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■パレイドリア（ぱれいどりあ）
変像症とも言う。
壁の染みの形が人の顔に見えたり、空に浮かぶ雲の形が動物のものに見えたりするという、目の錯覚の一種。
心霊写真のほとんどはこのパレイドリアによる単なる錯覚である。
</PRE>
}

..//■パンドラの箱
function extTips_item_83()
{
	//■パンドラの箱
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■パンドラの箱（ぱんどらのはこ）
ギリシア神話に登場する、神々が授けた箱。決して開けてはならないと言われていたが、パンドラという女性が好奇心に負けて開けた結果、中に入っていた様々な災厄が世に解き放たれてしまった。箱の中に残ったのは唯一『希望』のみだったと言われている。
</PRE>
}


..//■ハンドル名
function extTips_item_84()
{
	//■ハンドル名
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ハンドル名（はんどるめい）
ネットワーク上で活動するときに使用する別名。
</PRE>
}


..//■パンモロ
function extTips_item_85()
{
	//■パンモロ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■パンモロ（ぱんもろ）
パンツがまともに見えている状態。パンチラの発展系。
</PRE>
}


..//■万有引力
function extTips_item_86()
{
	//■万有引力
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■万有引力（ばんゆういんりょく）
ニュートンによって発見された、質量を持つすべての物質・エネルギーなどは互いに引き合う力を持つという法則。
地球などの惑星の引力（重力）もこの法則に当てはまる。
引き合う力は、二つの物質が重くなるほど強くなり、距離が離れるほど弱まる。
『ニュートンは木からリンゴが落ちるのをヒントにして万有引力を発見した』という有名なエピソードについては、単なる作り話だと言われている。
</PRE>
}

..//■人大杉
function extTips_item_87()
{
	//■人大杉
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■人大杉（ひとおおすぎ）
「人が多すぎる」をもじったもの。
</PRE>
}


..//■腐女子
function extTips_item_88()
{
	//■■腐女子
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■腐女子（ふじょし）
主に男性同士の恋愛が描かれたアニメやゲーム、同人誌など（いわゆる「やおい」）が好きな女性のことを指す。単なるオタクの女性の場合は該当しない。
</PRE>
}


..//■負の物質
function extTips_item_89()
{
	//■負の物質
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■負の物質（ふのぶっしつ）
『重さがゼロ』よりも『軽い』物質のこと。その観測は不可能である。
世界のあらゆる物質はそれぞれに、安定して存在するための最低限のエネルギー量が決まっている。その量がゼロを下回るということは、無限に崩壊し続けていることを意味する。
</PRE>
}

..//■ブラクラ
function extTips_item_90()
{
	//■ブラクラ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ブラクラ（ぶらくら）
「ブラウザクラッシャー」の略。ｗｅｂブラウザに過度の負荷をかけたり、システムを異常動作させる悪質なｗｅｂページのことで、匿名掲示板にはそのようなページであるとは知らせずにリンクが書き込まれていることが多い。最悪の場合、このｗｅｂページを見た人のＰＣに深刻な影響をもたらすこともある。
また、見る人に不快感を与えるような画像、映像のことを「精神的ブラクラ」と呼ぶ。こちらの場合、ＰＣのシステムに異常が起きることはない。
</PRE>
}

..//■フルボッコ
function extTips_item_91()
{
	//■フルボッコ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■フルボッコ（ふるぼっこ）
『フルパワーでボッコボコ』の略。容赦なく一方的に叩きのめすこと。
</PRE>
}

..//■並行世界
function extTips_item_92()
{
	//■並行世界
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■並行世界（へいこうせかい）
別の時空に、並行して存在する異世界。
我々が住む世界と同じ次元を持ち、時にはそこに暮らす人やあらゆる物の位置などまでが完全に一致している場合もある。
</PRE>
}


..//93
..//■ペリカ
function extTips_item_93()
{
	//■ペリカ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ペリカ（ぺりか）
某マンガに登場する、架空の通貨の単位。
</PRE>
}

..//■マインドコントロール
function extTips_item_94()
{
	//■マインドコントロール
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■マインドコントロール（まいんどこんとろーる）
強制されたわけではなく、自分の意思で選択したかのように見せかけて、実はあらかじめ決められた結論へと誘導する技術。洗脳と違い『明確な強制力はないように思える』ものである。
道端で『手相の勉強をしています』と話しかけられ、その後話しているうちに宗教に勧誘され断れない雰囲気になった、などという例もマインドコントロールの一種である。
</PRE>
}

..//■マグネタイト
function extTips_item_95()
{
	//■マグネタイト
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■マグネタイト（まぐねたいと）
磁鉄鉱とも言う。鉱物の一種で、磁石の原料となる。
黒色で金属光沢がある。結晶は正八面体をしている。
</PRE>
}

..//■祭り
function extTips_item_96()
{
	//■祭り
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■祭り（まつり）
＠ちゃんねる内のスレッドが爆発的に盛り上がっている状態。
</PRE>
}


..//■明和党
function extTips_item_97()
{
	//■明和党
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■明和党（めいわとう）
日本の政党（架空）。日本における二大政党のひとつ。現在、衆参両議院で過半数を占めている与党である。４年前までは野党だったが、その年の総選挙で大躍進を遂げた。キャッチコピーは『国民に明るい平和を』。
</PRE>
}


..//■ミレニアム７
function extTips_item_98()
{
	//■ミレニアム７
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ミレニアム７（みれにあむせぶん）
ミレニアム懸賞問題の通称。
アメリカのクレイ数学研究所によって、西暦２０００年に発表された７つの数学問題。この７つは過去に誰１人として解いたことのない未解決の難問であり、解答できた者に対して１００万ドルの懸賞金が与えられる。
２００７年の時点で、うち１問が解決され残りは６問となっている。
</PRE>
}

..//■夢遊病
function extTips_item_99()
{
	//■夢遊病
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■夢遊病（むゆうびょう）
睡眠時遊行症、夢中遊行症などとも言う。
睡眠中（特にノンレム睡眠時）まるで意識があるかのように起き出し、徘徊、食事、入浴など（会話は簡易なもの以外は不可能）の行動をする。個人差はあるがおよそ数分から３０分ほどその状態が持続し、最終的には元の眠っていた場所に戻り、再び眠りに付く。
本人は完全に無意識であり、自分の行動についてまったく記憶していない。
精神的な問題を抱えている者にこの症状が出ることが多く、ストレスが無意識に行動に出てしまうのが原因だといわれている。
</PRE>
}


..//■メシア
function extTips_item_100()
{
	//■メシア
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■メシア（めしあ）
救世主。
ユダヤ教、キリスト教において、世界に平和をもたらす存在とされる。
キリスト教においてはイエス・キリストがメシアであったと考えられている。
</PRE>
}

..//■目の錯覚
function extTips_item_101()
{
	//■目の錯覚
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■目の錯覚（めのさっかく）
錯視とも言う。
正常な状態の人が見た情報が、理性として間違っていると理解していながら、なおも間違ったまま知覚される現象。
有名なものに『ミュラー・リヤー錯視』がある。
原因としては、脳が、これまでの経験を踏まえて『推測した結果』と現実との間に誤差が生じているためという説がある。
目が受容した光情報は、刺激として視神経を経由し大脳に送られる。これによりはじめて視覚として認識されるが、視覚とはそもそも『光情報を元に外界の構造を推定する過程』であり、そこには経験則によるフィルターが働く。
人間は受け取る知覚の９９％を遮断している、という説もある。
もし人が受け取った知覚の１００％すべてを処理しようと思ったら正気を保てないだろう、と言われている。
</PRE>
}

..//■メンヘラ
function extTips_item_102()
{
	//■メンヘラ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■メンヘラ（めんへら）
夢見がちな言動をあからさまにする人。
『メンタルヘルス』を略した『メンヘル』を、『～する人』を意味する『er』を付けて変形させた造語。
</PRE>
}


..//■もちつけ
function extTips_item_103()
{
	//■もちつけ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■もちつけ（もちつけ）
「落ち着け」をもじったもの。
</PRE>
}

..//104
..//■漏れ
function extTips_item_104()
{
	//■漏れ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■漏れ（もれ）
「俺」をもじったもの。元は「俺も俺も」の誤変換「俺漏れも」が発祥であるが、現在は誤変換ではなく意識的に使われている。
</PRE>
}

..//■香具師
function extTips_item_105()
{
	//■香具師
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■香具師（やし）
「やし」。
「奴（ヤツ）」をもじった「ヤシ」を漢字に変換すると「香具師」となることが由来。「かぐし」と読む場合もある。
</PRE>
}

..//■ヤンデレ
function extTips_item_106()
{
	//■ヤンデレ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ヤンデレ（やんでれ）
好きな男性（基本的には主人公）への想いが募るあまり、嫉妬などの強い感情によりやがて病的な行動に及んでしまうヒロインのこと。
</PRE>
}


..//■百合属性
function extTips_item_107()
{
	//■百合属性
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■百合属性（ゆりぞくせい）
女性のことを恋愛対象として見ている女性のこと。
</PRE>
}

..//■ょぅι゛ょ
function extTips_item_108()
{
	//■ょぅι゛ょ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ょぅι゛ょ（ようじょ）
「幼女」をもじったもの。
</PRE>
}



..//■予知
function extTips_item_109()
{
	//■予知
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■予知（よち）
【予知】　音：よ-ち
［名］スル　なにが起こるかを前もって知ること。「異変を―する」「―能力」
　
未来に起こる出来事についてあらかじめ知ること。経験からくる予測、あるいは情報や統計による予測とは違い、人の本来の知覚を超越した特殊な感覚を指す。科学的には証明されていない。
その発現の仕方は人によって違い、フラッシュバック現象としてであったり、夢（予知夢）として表れたりする。霊能力者や占い師、古代の巫女にはこの力を有する者がいたと言われているが、一方でこの力を騙って行われる詐欺行為も多い。
</PRE>
}


..//■リア充
function extTips_item_110()
{
	//■リア充
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■リア充（りあじゅう）
現実（リアル）世界の生活が充実している人。『友人が多い』『恋人がいる』『サークル活動に精を出す』『コンパに出る』などの例がある。
</PRE>
}


..//■リビドー
function extTips_item_111()
{
	//■リビドー
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■リビドー（りびどー）
フロイトによれば『性的衝動を起こさせる力』。ユングは『すべての本能のエネルギーの本体』と定義している。
</PRE>
}

..//112
..//■ワクテカ
function extTips_item_112()
{
	//■ワクテカ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ワクテカ（わくてか）
ワクワクテカテカの略。期待してワクワクしていること。さらに省略して『ｗｋｔｋ』とも。
</PRE>
}

..//■ＡＡ
function extTips_item_113()
{
	//■ＡＡ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＡＡ（あすきあーと／えーえー）
『アスキーアート』の略。ネット掲示板等において、アスキー（ASCII）コードに含まれている文字や記号のみで描かれる絵のこと。文字絵などとも呼ばれる。
</PRE>
}

..//■ＤＩＤ
function extTips_item_114()
{
	//■ＤＩＤ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＤＩＤ（でぃーあいでぃー）
解離性同一性障害
（Dissociative Identity Disorder）、いわゆる多重人格のこと。１人の人間に複数の人格が存在する状態。
人格とは『自我や環境を認知し、そこに関与し、思考することの持続的様式』と定義される。つまり人間は連続した時間を認識することで自我を有し、行動・情報が一貫していることを確認し、それを『自分』として形成している。障害における人格の交代は突然で、心理的・社会的ストレスや環境的要因が誘因となる。別人格時の記憶を持っていない例が多いのが特徴。発症年齢は小児期であるが、臨床的に露見しない場合もある。慢性化しやすく、小児期に受けた虐待や心的外傷が、解離性同一性障害より先に見られる。
なお『多重人格障害』という名称はＤＳＭ－Ⅲ（アメリカ精神医学会の定めた
『精神障害の診断と統計の手引き』第３版・１９８０年発行）での旧称で、ＤＳＭ－Ⅳ（１９９４年）以降は使われていない。
</PRE>
}

..//■ＤＱＮ
function extTips_item_115()
{
	//■ＤＱＮ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＤＱＮ（どきゅん）
ドキュン。反社会的な人。常識のない人。
</PRE>
}

..//■Ｅ＝ｍｃ＾２
function extTips_item_116()
{
	//■Ｅ＝ｍｃ＾２
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■Ｅ＝ｍｃ＾２（いーいこーるえむしーすくえあ）
アインシュタインが導き出した、特殊相対性理論の関係式。<BR>
エネルギー（Ｅ）＝質量（ｍ）×光速度（ｃ）の２乗<BR>
『質量とエネルギーは等価である』ことを示している。
</PRE>
}

..//■ＧＪ
function extTips_item_117()
{
	//■ＧＪ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＧＪ（ぐっじょぶ／じーじぇい）
『ＧｏｏｄＪｏｂ』を省略したもの。よくやったぞ、と誉めている。
</PRE>
}


..//■ＩＣカード
function extTips_item_118()
{
	//■ＩＣカード
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＩＣカード（あいしーかーど）
ＩＣチップ（集積回路）を組み込んだカードのこと。テレフォンカードや電子マネーサービスをはじめとして、近年では公共交通機関（鉄道）において、乗車券に代わるものとして非接触型ＩＣカードの導入が進んでいる。
</PRE>
}


..//■ｋｔｋｒ
function extTips_item_119()
{
	//■ｋｔｋｒ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ｋｔｋｒ（きたこれ／けーてぃーけーあーる）
『キタコレ』を省略したもの。
物事が思い通りに進み興奮しているさまを表している。
</PRE>
}

..//■ｋｗｓｋ
function extTips_item_120()
{
	//■ｋｗｓｋ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ｋｗｓｋ（くわしく／けーたぶりゅーえすけー）
『詳しく』を省略したもの。もっと詳細に教えてもらいたいときに用いる。
</PRE>
}

..//■ｍｊｄ
function extTips_item_121()
{
	//■ｍｊｄ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ｍｊｄ（まじで／えむじぇいでぃ）
『マジで？』を省略したもの。信じられない気持ちの表れ。
</PRE>
}

..//■ＭＭＯＲＰＧ
function extTips_item_122()
{
	//■ＭＭＯＲＰＧ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＭＭＯＲＰＧ（えむえむおーあーるぴーじー）
多人数同時参加型のオンラインＲＰＧ
（Massively Multiplayer Online
Role-Playing Game）の略。サーバ内に構築されたゲーム世界に対し、不特定多数のプレイヤーが接続して同時にプレイする。
</PRE>
}

..//■ＮＰＣ
function extTips_item_123()
{
	//■ＮＰＣ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＮＰＣ（えぬぴーしー）
ノン・プレイヤー・キャラクターの略。テーブルトークＲＰＧの用語。現在はオンラインゲームでも使われる。プレイヤーが操作していないキャラクターのこと。
</PRE>
}


..//■ｏｒｚ
function extTips_item_124()
{
	//■ｏｒｚ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ｏｒｚ（おーあーるぜっと／おるず）
人が四つん這いの状態で落ち込んでいる様子を描いた絵文字。「ｏ」が頭、「ｒ」が手と胴体、「ｚ」が足である。失意や落胆、挫折の気持ちを表現したいときに用いるのが一般的。読み方は厳密には決まっておらず人それぞれで、「オルツ」「オルズ」「オアズ」あるいは「失意体前屈」などという呼び方がある。
</PRE>
}

..//■ＰＴＳＤ
function extTips_item_125()
{
	//■ＰＴＳＤ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＰＴＳＤ（ぴーてぃーえすでぃ）
心的外傷後ストレス障害（Post-traumatic stress disorder)の略。ＤＳＭ－Ⅳ（アメリカ精神医学会の定めた『精神障害の診断と統計の手引き』第４版・１９９４年発行）より。
事故、災害、犯罪等に遭遇し心に強いショックを受けたことが原因となり、様々なストレス障害を引き起こす精神疾患。
精神的に不安定になり、不眠や混乱、記憶の錯乱などの現象が１ヶ月以上持続している場合に当てはまる。
</PRE>
}

..//■ＲＭＴ
function extTips_item_126()
{
	//■ＲＭＴ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＲＭＴ（あーるえむてぃー）
リアルマネートレーディング（Real-Money Trading）の略。ＭＭＯＲＰＧなどのオンラインゲームにおいて登場する架空のアイテムなどを、現実の通貨と交換する行為。ゲーム内でアイテムの受け渡しなどができるシステムが存在する場合にはじめて成立する。詐欺行為などのトラブルも多く、この行為には賛否両論ある。
</PRE>
}

..//■ＲＯＭ
function extTips_item_127()
{
	//■ＲＯＭ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＲＯＭ（ろむ）
リードオンリーメンバーの略。掲示板を読むだけで書き込まない人のこと。
</PRE>
}

..//■ＳＮＳ
function extTips_item_128()
{
	//■ＳＮＳ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ＳＮＳ（えすえぬえす）
ソーシャル・ネットワーキング・サービス（Social Network Service）の略。コミュニティ型のｗｅｂサイトで、招待制や登録制などのさまざまな形態がある。他者とのコミュニケーションをネット上でより容易に行えるような機能が構築されている。
</PRE>
}

..//■ｕｚｅｅｅｅｅｅｅｅｅｅｅ！
function extTips_item_129()
{
	//■ｕｚｅｅｅｅｅｅｅｅｅｅｅ！
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ｕｚｅｅｅｅｅｅｅｅｅｅｅ！（うぜえええええええええええ）
うざい。すごく鬱陶しい。
</PRE>
}

..//■ｗ
function extTips_item_130()
{
	//■ｗ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ｗ（わらい／わら）
（笑）のローマ字（ｗａｒａｉ）を省略したもの。発祥は海外製オンラインゲームだと言われている。語尾、あるいは文章の途中にこれを付けることで、笑っていること、おかしいことを表現する。ネットの匿名掲示板では「ｗｗｗｗｗ」といくつも繰り返すことで、より高い感情の度合いを表現したり、相手への嘲笑の意味としても使われる。用例としては「うはｗｗｗｗｗおｋｗｗｗｗｗ」であったり「みｗなｗぎｗっｗてｗきｗたｗ」というような表現が使われ、その見た目から「草を生やす」という言い方をする場合もある。
</PRE>
}


..//■Ｗｉｋｉ
function extTips_item_131()
{
	//■Ｗｉｋｉ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■Ｗｉｋｉ（うぃき）
ウェブブラウザを使って、ｗｅｂサーバ上のハイパーテキスト文書を作成、編集できるシステム。
</PRE>
}

..//■３００人委員会
function extTips_item_132()
{
	//■３００人委員会
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■３００人委員会（さんびゃくにんいいんかい）
わずか３００人のみで構成されている、世界を陰で動かしていると噂される謎の秘密組織。『見えざる支配者』。
各国の王族、情報機関、銀行を中心とした大企業、さらには陰謀論によく出てくるような秘密結社なども、すべて３００人委員会の下位組織に過ぎず、また世界のほぼすべての企業、警察、研究機関等がその影響下にあると言われている。
ただしその実在はあくまで噂でしかない。
３００人委員会の最終目的、それは一説には『世界人間牧場計画』いわゆる世界の新秩序の構築であるという。
一部のエリート以外の人間は、１０億人を残してすべて抹殺し、その１０億人は支配者たちの管理下で奴隷として扱われる、というものである。
</PRE>
}

..//133
..//■（ｒｙ
function extTips_item_133()
{
	//■（ｒｙ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■（ｒｙ（いかりゃく）
『以下略』をさらに省略したもの。
</PRE>
}

..//■診断結果
function extTips_item_134_1()
{
	//■診断結果 0%
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■診断結果
あなたには妄想レベルがまったくありません。性格的にちょっと現実的すぎるところがあるかもしれませんが、あなたはリアルがとても充実し、人付き合いが得意で友人も多く、恋愛も数多くこなし、仕事や学業も順調そのもので、妄想なんてする必要のない人生を送ってきたのでしょう。そんなあなたがなぜこんなゲームをプレイしてみようと思ったのか、とうてい理解できません。今後も、三次元の中で楽しく前向きに生きていってください。あなたの人生には楽しいことがたくさん待っているはずです。
【三住の一言】
妄想してニヤニヤしてるヤツを見かけても「キモい」なんて言わないようにしろよ。むしろ親しげに接してやれ。そうすれば周囲の女子から「優しい人」と思われてさらに好感度アップだ。
</PRE>

}

function extTips_item_134_2()
{
	//■診断結果 1～33%
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■診断結果
あなたの妄想レベルは低いです。決してリアルでの生活のすべてが順調というわけでもないのでしょうが、打ち込めることがひとつ以上ちゃんとあり、それに向かって毎日を頑張っているため、妄想なんてしている暇はあまりないのかもしれません。今後もその調子で頑張っていけば、さらに充実した人生を送れることでしょう。でも気をつけてください。もしもなんらかのきっかけで失敗したり打ち込めることを失ってしまったりすると、一気に心がすさみ、妄想へと逃げ込んでしまいたいという誘惑に駆られるかもしれません。
【七海の一言】
やっぱりおにぃにするなら、頼りがいのある人の方がいいもんね。流行にも敏感だったりすると、さらに最高かも！　あ、それと家族にも色々気を遣ってくれると嬉しいな。
【セナの一言】
お前の目指すものに向かってがむしゃらに突き進め。だが、休むときはきちんと休めよ。頑張りすぎて燃え尽きたら危険だ。適度な散歩を日課にするのを勧める。
</PRE>
}

function extTips_item_134_3()
{
	//■診断結果 34～66%
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■診断結果
あなたの妄想レベルは一般的なレベルです。リアルでの生活に比較的ゆとりがあり、友人と遊ぶ時間も、ひとりでテレビやゲームを楽しむ時間も同じくらい持つことができているのでしょう。人間は適度に妄想が必要な生き物です。だからこそ心も豊かになるというもの。あなたには、妄想を楽しみつつそれをリアルに活かすことだってできるはずです。今後もリアルと妄想の時間をバランスよく保つことが大切です。妄想に走りすぎると、あっと言う間にキモい人になってしまう恐れがあります。
【あやせの一言】
　歌えばいいのよ。歌を。歌うことは現実的行為。歌に込められた想いは妄想的行為。ふたつを両立させているから。そして多くの人と、行為を共有できるから。
【優愛の一言】
　アニメを楽しむことだって、決して気持ち悪いことじゃないと思います。ただ、普段の会話でアニメの話題ばかりにはならないようにしてくださいね。
</PRE>
}

function extTips_item_134_4()
{
	//■診断結果 67～99%
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■診断結果
あなたの妄想レベルは高いです。おそらくリアルでの生活では辛いことばかりなのでしょう。そんな現実から目を逸らしたくなる気持ちをお察しします。でも、あなたは妄想に完全に没頭するにはまだ覚悟が足りない状態です。いつかまた充実したリアルに戻れると思っているはずです。現実と妄想の区別が付かなくなることはありませんか？　妄想が現実に影響してきているようだと危険です。覚悟を決めて妄想一筋に生きるか、かすかな希望に向けて努力し現実へと戻るか、決断の時は迫っています。
【梨深の一言】
あなたには、これ以上妄想してほしくないな。現実は確かに辛いばっかりだけど、だからこそ嬉しいことや楽しいことが、かけがえのないものになるんだよ。だから戻って。現実に。ね？
【梢の一言】
ふみゅ～、妄想一筋になるにはーねー？　まず誰とも喋らないようにすると～す～る～と～、いいよ～。そしたらね、必然的に妄想するしかなくなるのら！
</PRE>
}

function extTips_item_134_5()
{
	//■診断結果 100%
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■診断結果
あなたの妄想レベルは飛び抜けて高いです。もう妄想なしでは生きていけないでしょう。二次元キャラに恋をし、モニターの中に入っていきたいとさえ考えているはずです。リアルが充実することは今後もありません。手遅れです。でもそれを後ろめたいと思うことはありません。己の妄想に没頭し想像力の中に生きることを周囲にどう思われようと、あなたが幸せならばそれでいいのです。食事や病気など自分の健康にだけ注意し、今後も辛い現実など気にせず、幸せで甘美な妄想ライフを続けていきましょう。妄想は、あなたを裏切りません。<BR>
【拓巳の一言】
し、知ってる？　３０歳まで童貞でいると、魔法を使えるようになるんだ。三次元なんか汚れてて価値がないってことだよ、ふひひ……。脳内彼女が一番でしょ、常考。
</PRE>

}


..//135
..//■キキョウ
function extTips_item_135()
{
	//■キキョウ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■キキョウ（梨深）
青い空に憧れ、青い空を見たいと願った梨深の心が、その空を飛ぶための翼を模して具現化したディソード。他のディソードと違い分割・変形が可能なのは、咲畑梨深という存在が“いくつにも分裂し生まれた中の１人”であることを暗示している。リアルブート時には無数の白い羽根が剣から放出され舞い散るが、それもまたディソードのパーツに含まれている。
</PRE>
	CreateTexture("ディソード", 3000, 464, 304, "cg/extra/tips/rimi.jpg");
	SetAlias("ディソード","ディソード");
	Fade("ディソード", 0, 0, null, true);
	Fade("ディソード", 500, 1000, null, false);
}

..//■グラジオラス
function extTips_item_136()
{
	//■グラジオラス
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■グラジオラス（セナ）
特徴的な二股に分かれた剣身部分は、セナ自身の脆い精神を表している。威圧的で攻撃的なデザインでありながら、二股に分かれているせいで構造としては実は脆弱なのである。もちろんディソードには普通の物理法則は適用されないので、実際にこの剣が脆いというわけではない。
</PRE>
	CreateTexture("ディソード", 3000, 464, 304, "cg/extra/tips/sena.jpg");
	SetAlias("ディソード","ディソード");
	Fade("ディソード", 0, 0, null, true);
	Fade("ディソード", 500, 1000, null, false);
}

..//■スイレン
function extTips_item_137()
{
	//■スイレン
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■スイレン（拓巳）
拓巳のディソードの形状は、彼の純粋な精神を表す。長大で余計な装飾がないデザインは、それまで逃げるだけだった拓巳が、己の存在を賭けて前を向き歩き出したことを意味している。刃が存在しないこの剣は、その軌跡上で触れたものすべてをすさまじい熱により一瞬で蒸発させることにより、あらゆるものを断絶する。
</PRE>
	CreateTexture("ディソード", 3000, 464, 304, "cg/extra/tips/takumi.jpg");
	SetAlias("ディソード","ディソード");
	Fade("ディソード", 0, 0, null, true);
	Fade("ディソード", 500, 1000, null, false);
}

..//■スノウドロップ
function extTips_item_138()
{
	//■スノウドロップ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■スノウドロップ（梢）
梢の持つディソードのあまりにも暴力的なデザインは、自らに危害を与える者には容赦しない梢の精神そのものである。小柄で力も弱い彼女が己を守るための力を欲した結果、自らの体格とは正反対の巨大武器として具現化した。しかも純粋な格闘戦用に特化しており、梢の意志を受けてターゲットを自動的に補足、最も効率的に“破壊”できる軌跡を描く。故に梢がこの剣を操るとき“剣に振り回されている”ように見えるのである。
</PRE>
	CreateTexture("ディソード", 3000, 464, 304, "cg/extra/tips/kozue.jpg");
	SetAlias("ディソード","ディソード");
	Fade("ディソード", 0, 0, null, true);
	Fade("ディソード", 500, 1000, null, false);
}

..//■ダリア
function extTips_item_139()
{
	//■ダリア
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■ダリア（あやせ）
直線部分がまったく存在しないあやせのディソードはまさに混沌を表している。彼女はこの剣を具現化するにあたり、神話上の生物である竜をかたどったため、他のディソードよりも生物的な形状になったのである。竜はグラジオールサーガの１つである『黒騎士断章』の中に登場し、黒騎士の１人が竜を倒してその骨からディソードを作り出すという記述が存在する。
</PRE>
	CreateTexture("ディソード", 3000, 464, 304, "cg/extra/tips/ayase.jpg");
	SetAlias("ディソード","ディソード");
	Fade("ディソード", 0, 0, null, true);
	Fade("ディソード", 500, 1000, null, false);
}

..//■トリカブト
function extTips_item_140()
{
	//■トリカブト
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■トリカブト（七海）
兄への想いの象徴であるバングルの記憶が剣として形を為したもの。それが七海のディソードである。他の誰にも渡したくないという強い感情の影響により、柄の部分までもが刃で構成されている。これにより、例え他のギガロマニアックスであろうともこの剣を握って扱うことはできないのである。
</PRE>
	CreateTexture("ディソード", 3000, 464, 304, "cg/extra/tips/nanami.jpg");
	SetAlias("ディソード","ディソード");
	Fade("ディソード", 0, 0, null, true);
	Fade("ディソード", 500, 1000, null, false);
}

..//■バラ
function extTips_item_141()
{
	//■バラ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■バラ（優愛）
正確には楠優愛ではなく楠美愛が手にしたこのディソードは、リアルブート時に赤い花びらが舞うのが特徴である。それは姉の優愛に対するコンプレックスであり、自分には欠けていると感じていたもの――上品さ、女性らしさ、優しさ――の象徴であると同時に、“散華”という言葉もある通り、姉の死（そして楠美愛という存在を自ら抹消したこと）への悼み、鎮魂を意味している。
</PRE>
	CreateTexture("ディソード", 3000, 464, 304, "cg/extra/tips/yua.jpg");
	SetAlias("ディソード","ディソード");
	Fade("ディソード", 0, 0, null, true);
	Fade("ディソード", 500, 1000, null, false);
}

..//■リンドウ
function extTips_item_142()
{
	//■リンドウ
	extTips_item_set($SYSTEM_present_process);
<PRE @WND_comment>
[text]
■リンドウ（野呂瀬）
他の７人のギガロマニアックスの少年少女たちよりも２倍以上もの人生を生きてきた野呂瀬のディソードは、その時間に比例してより凶暴で歪んだ形へと進化してきた。ディソードにはなんら必要のない“張り付け”が可能な醜悪な形状に至ったのはすべて野呂瀬の負の感情の発露であり、根底にあるものは、歪んだ正義感や信念、弱き者を支配せんとする欲求、そして世界への憎悪である。
</PRE>
	CreateTexture("ディソード", 3000, 464, 304, "cg/extra/tips/norose.jpg");
	SetAlias("ディソード","ディソード");
	Fade("ディソード", 0, 0, null, true);
	Fade("ディソード", 500, 1000, null, false);
}


function TipsClickedClear()
{
	$TIPS_CLICKED_999=false;
	$TIPS_CLICKED_1=false;
	$TIPS_CLICKED_2=false;
	$TIPS_CLICKED_3=false;
	$TIPS_CLICKED_4=false;
	$TIPS_CLICKED_5=false;
	$TIPS_CLICKED_6=false;
	$TIPS_CLICKED_7=false;
	$TIPS_CLICKED_8=false;
	$TIPS_CLICKED_9=false;
	$TIPS_CLICKED_10=false;
	$TIPS_CLICKED_11=false;
	$TIPS_CLICKED_12=false;
	$TIPS_CLICKED_13=false;
	$TIPS_CLICKED_14=false;
	$TIPS_CLICKED_15=false;
	$TIPS_CLICKED_16=false;
	$TIPS_CLICKED_17=false;
	$TIPS_CLICKED_18=false;
	$TIPS_CLICKED_19=false;
	$TIPS_CLICKED_20=false;
	$TIPS_CLICKED_21=false;
	$TIPS_CLICKED_22=false;
	$TIPS_CLICKED_23=false;
	$TIPS_CLICKED_24=false;
	$TIPS_CLICKED_25=false;
	$TIPS_CLICKED_26=false;
	$TIPS_CLICKED_27=false;
	$TIPS_CLICKED_28=false;
	$TIPS_CLICKED_29=false;
	$TIPS_CLICKED_30=false;
	$TIPS_CLICKED_31=false;
	$TIPS_CLICKED_32=false;
	$TIPS_CLICKED_33=false;
	$TIPS_CLICKED_34=false;
	$TIPS_CLICKED_35=false;
	$TIPS_CLICKED_36=false;
	$TIPS_CLICKED_37=false;
	$TIPS_CLICKED_38=false;
	$TIPS_CLICKED_39=false;
	$TIPS_CLICKED_40=false;
	$TIPS_CLICKED_41=false;
	$TIPS_CLICKED_42=false;
	$TIPS_CLICKED_43=false;
	$TIPS_CLICKED_44=false;
	$TIPS_CLICKED_45=false;
	$TIPS_CLICKED_46=false;
	$TIPS_CLICKED_47=false;
	$TIPS_CLICKED_48=false;
	$TIPS_CLICKED_49=false;
	$TIPS_CLICKED_50=false;
	$TIPS_CLICKED_51=false;
	$TIPS_CLICKED_52=false;
	$TIPS_CLICKED_53=false;
	$TIPS_CLICKED_54=false;
	$TIPS_CLICKED_55=false;
	$TIPS_CLICKED_56=false;
	$TIPS_CLICKED_57=false;
	$TIPS_CLICKED_58=false;
	$TIPS_CLICKED_59=false;
	$TIPS_CLICKED_60=false;
	$TIPS_CLICKED_61=false;
	$TIPS_CLICKED_62=false;
	$TIPS_CLICKED_63=false;
	$TIPS_CLICKED_64=false;
	$TIPS_CLICKED_65=false;
	$TIPS_CLICKED_66=false;
	$TIPS_CLICKED_67=false;
	$TIPS_CLICKED_68=false;
	$TIPS_CLICKED_69=false;
	$TIPS_CLICKED_70=false;
	$TIPS_CLICKED_71=false;
	$TIPS_CLICKED_72=false;
	$TIPS_CLICKED_73=false;
	$TIPS_CLICKED_74=false;
	$TIPS_CLICKED_75=false;
	$TIPS_CLICKED_76=false;
	$TIPS_CLICKED_77=false;
	$TIPS_CLICKED_78=false;
	$TIPS_CLICKED_79=false;
	$TIPS_CLICKED_80=false;
	$TIPS_CLICKED_81=false;
	$TIPS_CLICKED_82=false;
	$TIPS_CLICKED_83=false;
	$TIPS_CLICKED_84=false;
	$TIPS_CLICKED_85=false;
	$TIPS_CLICKED_86=false;
	$TIPS_CLICKED_87=false;
	$TIPS_CLICKED_88=false;
	$TIPS_CLICKED_89=false;
	$TIPS_CLICKED_90=false;
	$TIPS_CLICKED_91=false;
	$TIPS_CLICKED_92=false;
	$TIPS_CLICKED_93=false;
	$TIPS_CLICKED_94=false;
	$TIPS_CLICKED_95=false;
	$TIPS_CLICKED_96=false;
	$TIPS_CLICKED_97=false;
	$TIPS_CLICKED_98=false;
	$TIPS_CLICKED_99=false;
	$TIPS_CLICKED_100=false;
	$TIPS_CLICKED_101=false;
	$TIPS_CLICKED_102=false;
	$TIPS_CLICKED_103=false;
	$TIPS_CLICKED_104=false;
	$TIPS_CLICKED_105=false;
	$TIPS_CLICKED_106=false;
	$TIPS_CLICKED_107=false;
	$TIPS_CLICKED_108=false;
	$TIPS_CLICKED_109=false;
	$TIPS_CLICKED_110=false;
	$TIPS_CLICKED_111=false;
	$TIPS_CLICKED_112=false;
	$TIPS_CLICKED_113=false;
	$TIPS_CLICKED_114=false;
	$TIPS_CLICKED_115=false;
	$TIPS_CLICKED_116=false;
	$TIPS_CLICKED_117=false;
	$TIPS_CLICKED_118=false;
	$TIPS_CLICKED_119=false;
	$TIPS_CLICKED_120=false;
	$TIPS_CLICKED_121=false;
	$TIPS_CLICKED_122=false;
	$TIPS_CLICKED_123=false;
	$TIPS_CLICKED_124=false;
	$TIPS_CLICKED_125=false;
	$TIPS_CLICKED_126=false;
	$TIPS_CLICKED_127=false;
	$TIPS_CLICKED_128=false;
	$TIPS_CLICKED_129=false;
	$TIPS_CLICKED_130=false;
	$TIPS_CLICKED_131=false;
	$TIPS_CLICKED_132=false;
	$TIPS_CLICKED_133=false;
	$TIPS_CLICKED_134=false;
	$TIPS_CLICKED_135=false;
	$TIPS_CLICKED_136=false;
	$TIPS_CLICKED_137=false;
	$TIPS_CLICKED_138=false;
	$TIPS_CLICKED_139=false;
	$TIPS_CLICKED_140=false;
	$TIPS_CLICKED_141=false;
	$TIPS_CLICKED_142=false;
}