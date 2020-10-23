#include "nss/function_system.nss"

//======================================================================//
//■カルテ
//======================================================================//
//定義

function SetKarte()
{
	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_backlog_lock = 1;
	$SYSTEM_text_erase_lock = true;
	$SYSTEM_skip_lock = true;
	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
	$SYSTEM_show_cursor = true;
	$KarteSelect = 0;
	$KarteNow = 1;

	$SYSTEM_menu_lock = true;

	$Flag=100;

	//★★★★ロック
	XBOX360_LockVideo(true);

	//■定義「ボタン説明」
	DialogButtonON("Button_KRT");


//■ラインとチェックボックスはいっぱい使うのでここでロードです
	LoadImage("カルテイメージLine", "cg/sys/karte/Clinic-ct.png");
	if(Platform()!=$Flag){
		LoadImage("カルテイメージLine2", "cg/sys/karte/コンフィグ座標選択バー.png");
		LoadImage("カルテイメージin", "cg/sys/karte/カルテチェックワク2.png");
	}
	LoadImage("カルテイメージoff", "cg/sys/karte/カルテチェックワク.png");
	LoadImage("カルテイメージon", "cg/sys/karte/カルテチェック.png");

//■色々なパーツをクリエイト
	$KarteKeeper = -18;
	CreateTexture("カルテ背景", 10000, center, middle, "cg/sys/karte/背景.png");
	CreateTexture("カルテ上", 10000, 112, 48, "cg/sys/karte/Clinic-hd.png");
//	CreateWindow("カルテキーパー", 10000, 140, 237, 1000, 3, true);//一番上のライン
//	CreateTexture("カルテキーパー/カルテ中", 10000, 0, $KarteKeeper, "カルテイメージLine");
	if(Platform()==100){
		CreateTexture("カルテ下", 10000, 112, 403, "cg/sys/karte/Clinic-ft.png");
	}else{
		CreateTexture("カルテ下", 10000, 112, 404, "cg/sys/karte/Clinic-ft.png");
	}
	CreateTexture("カルテEXIT0", 10000, 440, 468, "cg/sys/karte/ok-001.png");
//	CreateTexture("カルテナンバー", 10000, 98, 146, "cg/sys/karte/001.png");

//■チョイス関連とラインをクリエイト
	if(Platform()==$Flag){
		CreateTexture("カルテスクロール", 10001, 882, 54, "cg/sys/karte/つまみデフォ.png");
		$KarteScrollLineP=(417+160-48)/20;
		$KarteScrollLineM=-((417+160-48)/20);
	}else{
		CreateScrollbar("カルテスクロール", 10001, 882, 54, 882, 405, 0, VERTICAL, "cg/sys/karte/つまみデフォ.png");
//		CreateScrollbar("カルテスクロール",10050,922,443,922,56,0,VERTICAL,"cg/sys/backlog/new-back-logスライドバー.png");
		SetAlias("カルテスクロール", "カルテスクロール");
		SetScrollbar("カルテスクロール","カルテスクロール");
		SetScrollSpeed("カルテスクロール",10);
	}

	CreateChoice("カルテEXIT");
	CreateTexture("カルテEXIT/MouseUsual/画像１", 10000, 440, 468, "cg/sys/karte/ok-001.png");
	CreateTexture("カルテEXIT/MouseOver/画像２", 10000, 440, 468, "cg/sys/karte/ok-002.png");
	CreateTexture("カルテEXIT/MouseClick/画像３", 10000, 440, 468, "cg/sys/karte/ok-003.png");

	$KarteWindowY = $KarteKeeper + 190;//カルテウィンドウ位置
	$KarteWindowVertical = 263 + 5 - $KarteKeeper;//カルテウィンドウ全体幅
	if(Platform()==100){
		$KarteWindowVertical = 210 + 1 - $KarteKeeper;//カルテウィンドウ全体幅
	}else{
		$KarteWindowVertical = 263 + 5 - $KarteKeeper;//カルテウィンドウ全体幅
	}

	$KarteCount=0;
	$KarteLine=0;
	$KarteBoard=25;//質問の数
	$KarteVertical=30;//中縦幅
	$KarteBox=2;
	$KarteBox2=$KarteWindowY+2;

	$KarteSpace = $KarteBoard * $KarteVertical - $KarteKeeper;
	$カルテ縦幅 = $KarteSpace - $KarteWindowVertical;

	SetFont("ＭＳ ゴシック", 18, #555555, #000000, 500, NULL);
	$KarteTextX = 76;
	$KarteTextY = 0;
	$KarteText1 = "用事があれば電話よりメールだ";
	$KarteText2 = "時々、耳鳴りがする";
	$KarteText3 = "誰かの視線を感じて振り返った経験がある";
	$KarteText4 = "止まっているはずの物が、一瞬動いているように見えることがある";
	$KarteText5 = "虫の知らせのような経験をしたことがある";
	$KarteText6 = "何気なくデジタル時計を見たとき、偶然にも同じ数字が並んでいることがある";
	$KarteText7 = "ひと月以内に涙を流した経験がある";
	$KarteText8 = "想像力だけで自慰行為ができる";
	$KarteText9 = "自慰行為中の映像に邪魔が入らない";
	$KarteText10 = "目を閉じなくてもなにかを空想することができる";
	$KarteText11 = "車のフロントビューが時々人の顔に見える";
	$KarteText12 = "ホラー映画を見た後はトイレに行きづらい";
	$KarteText13 = "お化け屋敷は苦手だ";
	$KarteText14 = "本を読み始めると時間を忘れて没頭する";
	$KarteText15 = "宇宙には地球以外にも人類のような生物が住む星があると思う";
	$KarteText16 = "血液型性格判断は自分の性格とことごとく当てはまる";
	$KarteText17 = "乗り物酔いをしやすい";
	$KarteText18 = "神様はいると思う";
	$KarteText19 = "霊感は強い方だ";
	$KarteText20 = "寝ているとき、カラーの夢を見たことがある";
	$KarteText21 = "寝ているとき、夢の中でこれが夢だと解ったことがある";
	$KarteText22 = "記憶の一部が欠落してしまった経験がある";
	$KarteText23 = "人と目を合わせるのが苦手だ";
	$KarteText24 = "梅干しを見ただけで口の中に唾液が充満してしまう";
	$KarteText25 = "人のアクビがうつりやすい気がする";

	CreateWindow("カルテベース", 10000, 112, $KarteWindowY, 800, $KarteWindowVertical, true);
	CreateWindow("カルテベース/カルテウィンドウ", 10000, 0, 0, 800, $KarteSpace, true);

		$KarteTextY -= $KarteKeeper;
		$KarteBox -= $KarteKeeper;
		$KarteBox2 -= $KarteKeeper;
		$KarteLine -= $KarteKeeper;

	while($KarteCount < $KarteBoard)
	{
		$KarteCount += 1;

		//●ラインクリエイト
		$KarteLineName = "カルテベース/カルテウィンドウ/カルテライン" + $KarteCount;
		CreateTexture("$KarteLineName", 10000, 0, $KarteLine, "カルテイメージLine");

		//●テキストクリエイト
		$KarteTextName = "カルテベース/カルテウィンドウ/テキスト" + $KarteCount;
		if($KarteCount==1){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText1");}
		else if($KarteCount==2){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText2");}
		else if($KarteCount==3){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText3");}
		else if($KarteCount==4){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText4");}
		else if($KarteCount==5){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText5");}
		else if($KarteCount==6){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText6");}
		else if($KarteCount==7){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText7");}
		else if($KarteCount==8){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText8");}
		else if($KarteCount==9){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText9");}
		else if($KarteCount==10){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText10");}
		else if($KarteCount==11){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText11");}
		else if($KarteCount==12){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText12");}
		else if($KarteCount==13){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText13");}
		else if($KarteCount==14){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText14");}
		else if($KarteCount==15){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText15");}
		else if($KarteCount==16){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText16");}
		else if($KarteCount==17){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText17");}
		else if($KarteCount==18){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText18");}
		else if($KarteCount==19){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText19");}
		else if($KarteCount==20){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText20");}
		else if($KarteCount==21){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText21");}
		else if($KarteCount==22){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText22");}
		else if($KarteCount==23){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText23");}
		else if($KarteCount==24){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText24");}
		else if($KarteCount==25){CreateText("$KarteTextName", 10001, $KarteTextX, $KarteTextY, Auto, Auto, "$KarteText25");}
		Request("$KarteTextName", NoLog);
		Request("$KarteTextName", PushText);

		//●チョイスクリエイト
		$KarteChoiceName = "カルテベース/カルテウィンドウ/カルテチョイス" + $KarteCount;
		$KarteChoiceUsual = $KarteChoiceName + "/MouseUsual/１";
		$KarteChoiceOver = $KarteChoiceName + "/MouseOver/２";
		$KarteChoiceOver2 = $KarteChoiceName + "/MouseOver/４";
		$KarteChoiceClic = $KarteChoiceName + "/MouseClick/３";
		$KarteChoiceClic2 = $KarteChoiceName + "/MouseClick/５";
		CreateChoice("$KarteChoiceName");
		CreateTexture("$KarteChoiceUsual", 10000, 160, $KarteBox2, "カルテイメージoff");

		if(Platform()==$Flag){
		}else{
			CreateTexture("$KarteChoiceOver", 10001, 160, $KarteBox2, "カルテイメージin");
			CreateTexture("$KarteChoiceOver2", 10000, 160, $KarteBox2, "カルテイメージLine2");
			CreateTexture("$KarteChoiceClic", 10001, 160, $KarteBox2, "カルテイメージin");
			CreateTexture("$KarteChoiceClic2", 10000, 160, $KarteBox2, "カルテイメージLine2");
		}

		Request("$KarteChoiceUsual", Erase);
//		Request("$KarteChoiceOver", Erase);
//		Request("$KarteChoiceClick", Erase);

		//●ラジオボックスクリエイト
		$KarteChoiceBefore = "カルテベース/カルテウィンドウ/選択前" + $KarteCount;
		$KarteChoiceAfter = "カルテベース/カルテウィンドウ/選択後" + $KarteCount;
		CreateTexture("$KarteChoiceBefore", 10000, 48, $KarteBox, "カルテイメージoff");
		CreateTexture("$KarteChoiceAfter", 10001, 48, $KarteBox, "カルテイメージon");

		$KarteTextY += $KarteVertical;
		$KarteBox += $KarteVertical;
		$KarteBox2 += $KarteVertical;
		$KarteLine += $KarteVertical;
	}

//■３６０用ライン
	if(Platform()==$Flag){
		CreateTexture("カルテオーバー", 10000, 160, 191, "cg/sys/Karte/コンフィグ座標選択バー2.png");
	}

//■最後に一気に消します。
	Fade("カルテ*", 0, 0, null, false);
	Fade("カルテ*/*", 0, 0, null, false);
	Fade("カルテ*/*/*", 0, 0, null, false);
	Fade("カルテ*/*/*/*", 0, 0, null, false);
	Fade("カルテ*/*/*/*/*", 0, 0, null, true);
	Request("カルテEXIT/MouseUsual/画像１", Erase);

	//★★★★アンロック
	XBOX360_LockVideo(false);

//■上記までが定義。ここから描画を開始します
	Fade("カルテ背景", 1000, 1000, null, true);

	$FadeKarte=500;

	Fade("カルテベース/カルテウィンドウ/カルテライン*", $FadeKarte, 1000, null, false);
	Fade("カルテ上", $FadeKarte, 1000, null, false);
	Fade("カルテキーパー/カルテ中", $FadeKarte, 1000, null, false);
	Fade("カルテ下", $FadeKarte, 1000, null, true);

	//▲描画「ボタン説明」
	DialogButtonFade3("Button_KRT");

	Fade("カルテベース/カルテウィンドウ/テキスト*", $FadeKarte, 1000, null, false);
	Fade("カルテベース/カルテウィンドウ/選択前*", $FadeKarte, 1000, null, false);
	Fade("カルテナンバー", $FadeKarte, 1000, null, false);
	Fade("カルテEXIT0", $FadeKarte, 1000, null, false);
	Fade("カルテオーバー", $FadeKarte, 1000, null, false);
	Fade("カルテスクロール", $FadeKarte, 1000, null, true);


//■ここから選択肢が回り始めます。

		$PaperOverPlus=30;
//		$PaperOverPlus=30;
		$PaperOver1=191;
//		$PaperOver1=191;
		$PaperOver2=$PaperOver1+($PaperOverPlus*1);
		$PaperOver3=$PaperOver1+($PaperOverPlus*2);
		$PaperOver4=$PaperOver1+($PaperOverPlus*3);
		$PaperOver5=$PaperOver1+($PaperOverPlus*4);
		$PaperOver6=$PaperOver1+($PaperOverPlus*5);
		$PaperOver7=$PaperOver1+($PaperOverPlus*6);

		$PaperTop=1;
		$PaperBottom=6;
		MoveCursor(168,202);//1

		$SYSTEM_XBOX360_button_left_down=false;$SYSTEM_XBOX360_button_right_down=false;
		$SYSTEM_XBOX360_button_up_down=false;$SYSTEM_XBOX360_button_down_down=false;

	$KarteUpSelect=true;
	while($KarteUpSelect)
	{
		select
		{
			CursorPosition($CsrX,$CsrY);

			if(Platform()==$Flag){
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
				case カルテスクロール
				{
				}
			}


			if(Platform()!=100){
				if($CsrX<=218&&$CsrX>=200&&$CsrY<=220&&$CsrY>=168){
					break;
				}else if($CsrX<=218&&$CsrX>=200&&$CsrY<=520&&$CsrY>=408){
					break;
				}
			}

			case カルテEXIT
			{
				$KarteUpSelect=false;
			}
			case カルテベース/カルテウィンドウ/カルテチョイス1
			{
				if($KarteChoiceClick1 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後1", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick1 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後1", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick1 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス2
			{
				if($KarteChoiceClick2 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後2", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick2 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後2", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick2 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス3
			{
				if($KarteChoiceClick3 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後3", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick3 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後3", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick3 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス4
			{
				if($KarteChoiceClick4 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後4", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick4 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後4", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick4 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス5
			{
				if($KarteChoiceClick5 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後5", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick5 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後5", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick5 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス6
			{
				if($KarteChoiceClick6 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後6", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick6 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後6", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick6 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス7
			{
				if($KarteChoiceClick7 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後7", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick7 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後7", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick7 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス8
			{
				if($KarteChoiceClick8 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後8", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick8 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後8", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick8 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス9
			{
				if($KarteChoiceClick9 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後9", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick9 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後9", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick9 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス10
			{
				if($KarteChoiceClick10 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後10", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick10 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後10", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick10 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス11
			{
				if($KarteChoiceClick11 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後11", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick11 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後11", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick11 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス12
			{
				if($KarteChoiceClick12 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後12", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick12 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後12", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick12 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス13
			{
				if($KarteChoiceClick13 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後13", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick13 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後13", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick13 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス14
			{
				if($KarteChoiceClick14 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後14", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick14 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後14", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick14 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス15
			{
				if($KarteChoiceClick15 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後15", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick15 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後15", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick15 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス16
			{
				if($KarteChoiceClick16 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後16", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick16 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後16", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick16 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス17
			{
				if($KarteChoiceClick17 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後17", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick17 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後17", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick17 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス18
			{
				if($KarteChoiceClick18 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後18", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick18 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後18", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick18 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス19
			{
				if($KarteChoiceClick19 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後19", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick19 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後19", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick19 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス20
			{
				if($KarteChoiceClick20 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後20", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick20 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後20", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick20 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス21
			{
				if($KarteChoiceClick21 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後21", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick21 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後21", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick21 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス22
			{
				if($KarteChoiceClick22 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後22", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick22 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後22", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick22 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス23
			{
				if($KarteChoiceClick23 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後23", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick23 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後23", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick23 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス24
			{
				if($KarteChoiceClick24 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後24", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick24 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後24", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick24 = 0;
				}
			}
			case カルテベース/カルテウィンドウ/カルテチョイス25
			{
				if($KarteChoiceClick25 == 0)
				{
					Fade("カルテベース/カルテウィンドウ/選択後25", 0, 1000, null, true);
					$KarteSelect += 1;
					$KarteChoiceClick25 = 1;
				}
				else
				{
					Fade("カルテベース/カルテウィンドウ/選択後25", 0, 0, null, true);
					$KarteSelect -= 1;
					$KarteChoiceClick25 = 0;
				}
			}

		}

		if(Platform()==$Flag){
			//▽廻す
			PaperMoveStart();
		}

		$SYSTEM_XBOX360_button_left_down=false;$SYSTEM_XBOX360_button_right_down=false;
		$SYSTEM_XBOX360_button_up_down=false;$SYSTEM_XBOX360_button_down_down=false;
		Wait(16);
	}

//■終わりにプリントスクリーンしてそれを本編で消しています。
	//▲描画「ボタン説明」
	DialogButtonOFF("Button_KRT");

	Wait(16);
	CreateTexture("背景９", 20000, 0, 0, "SCREEN");
	Draw();

	Delete("カルテ*");

	$KarteNow = 0;
	#KartePoint = $KarteSelect;

	$SYSTEM_menu_lock = false;

	$SYSTEM_backlog_lock = 0;
	$SYSTEM_skip_lock=false;

	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}
//	$SYSTEM_backselect_lock =false;
	$SYSTEM_show_cursor = false;
	$SYSTEM_text_erase_lock = false;
}








function PaperMoveStart()
{
	//★★★★ロック
	XBOX360_LockVideo(true);
	if($CsrX<=218&&$CsrX>=200&&$CsrY<=265&&$CsrY>=198){
	//▽１項目
		if($SYSTEM_XBOX360_button_up_down&&$PaperTop==1){
			MoveCursor(168,202);//1
			Move("カルテオーバー", 0, 160, $PaperOver1, null, false);
		}else if($SYSTEM_XBOX360_button_left_down&&$PaperTop==1){
			MoveCursor(168,202);//1
			Move("カルテオーバー", 0, 160, $PaperOver1, null, false);
		}else if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(168,172);//0
			Move("カルテオーバー", 0, 160, $PaperOver1, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(168,172);//0
			Move("カルテオーバー", 0, 160, $PaperOver1, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(168,231);//2
			Move("カルテオーバー", 0, 160, $PaperOver2, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(168,231);//2
			Move("カルテオーバー", 0, 160, $PaperOver2, null, false);
		}
	}else if($CsrX<=218&&$CsrX>=200&&$CsrY<=302&&$CsrY>=227){
	//▽２項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(168,202);//1
			Move("カルテオーバー", 0, 160, $PaperOver1, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(168,202);//1
			Move("カルテオーバー", 0, 160, $PaperOver1, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(168,262);//3
			Move("カルテオーバー", 0, 160, $PaperOver3, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(168,262);//3
			Move("カルテオーバー", 0, 160, $PaperOver3, null, false);
		}
	}else if($CsrX<=218&&$CsrX>=200&&$CsrY<=340&&$CsrY>=258){
	//▽３項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(168,231);//2
			Move("カルテオーバー", 0, 160, $PaperOver2, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(168,231);//2
			Move("カルテオーバー", 0, 160, $PaperOver2, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(168,291);//4
			Move("カルテオーバー", 0, 160, $PaperOver4, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(168,291);//4
			Move("カルテオーバー", 0, 160, $PaperOver4, null, false);
		}
	}else if($CsrX<=218&&$CsrX>=200&&$CsrY<=378&&$CsrY>=288){
	//▽４項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(168,262);//3
			Move("カルテオーバー", 0, 160, $PaperOver3, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(168,262);//3
			Move("カルテオーバー", 0, 160, $PaperOver3, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(168,322);//5
			Move("カルテオーバー", 0, 160, $PaperOver5, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(168,322);//5
			Move("カルテオーバー", 0, 160, $PaperOver5, null, false);
		}
	}else if($CsrX<=218&&$CsrX>=200&&$CsrY<=416&&$CsrY>=318){
	//▽５項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(168,291);//4
			Move("カルテオーバー", 0, 160, $PaperOver4, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(168,291);//4
			Move("カルテオーバー", 0, 160, $PaperOver4, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(168,354);//6
			Move("カルテオーバー", 0, 160, $PaperOver6, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(168,354);//6
			Move("カルテオーバー", 0, 160, $PaperOver6, null, false);
		}
	}else if($CsrX<=218&&$CsrX>=200&&$CsrY<=454&&$CsrY>=349){
	//▽６項目
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(168,322);//5
			Move("カルテオーバー", 0, 160, $PaperOver5, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(168,322);//5
			Move("カルテオーバー", 0, 160, $PaperOver5, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(168,383);//7
			Move("カルテオーバー", 0, 160, $PaperOver7, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(168,383);//7
			Move("カルテオーバー", 0, 160, $PaperOver7, null, false);
		}
	}else if($CsrX<=218&&$CsrX>=200&&$CsrY<=493&&$CsrY>=380){
	//▽７項目
		if($SYSTEM_XBOX360_button_right_down&&$PaperBottom==20){
			MoveCursor(512,480);//OK
			Fade("カルテオーバー", 0, 0, null, false);
			Move("カルテオーバー", 0, 160, $PaperOver7, null, false);
		}else if($SYSTEM_XBOX360_button_down_down&&$PaperBottom==20){
			MoveCursor(512,480);//OK
			Fade("カルテオーバー", 0, 0, null, false);
			Move("カルテオーバー", 0, 160, $PaperOver7, null, false);
		}else if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(168,354);//6
			Move("カルテオーバー", 0, 160, $PaperOver6, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(168,354);//6
			Move("カルテオーバー", 0, 160, $PaperOver6, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
			MoveCursor(168,413);//8
			Move("カルテオーバー", 0, 160, $PaperOver7, null, false);
		}else if($SYSTEM_XBOX360_button_down_down){
			MoveCursor(168,413);//8
			Move("カルテオーバー", 0, 160, $PaperOver7, null, false);
		}
	}else if($CsrX<=727&&$CsrX>=550&&$CsrY<=631&&$CsrY>=470){
	//▽OK
		if($SYSTEM_XBOX360_button_up_down){
			MoveCursor(168,383);//7
			Fade("カルテオーバー", 0, 1000, null, false);
			Move("カルテオーバー", 0, 160, $PaperOver7, null, false);
		}else if($SYSTEM_XBOX360_button_left_down){
			MoveCursor(168,383);//7
			Fade("カルテオーバー", 0, 1000, null, false);
			Move("カルテオーバー", 0, 160, $PaperOver7, null, false);
		}else if($SYSTEM_XBOX360_button_right_down){
		}else if($SYSTEM_XBOX360_button_down_down){
		}
	}

	//★★★★アンロック
	XBOX360_LockVideo(false);

	CursorPosition($CsrX,$CsrY);
	if($CsrX<=218&&$CsrX>=200&&$CsrY<=220&&$CsrY>=168){
		PaperBackStart();
		Wait(50);
		while($SYSTEM_XBOX360_button_up_down||$SYSTEM_XBOX360_button_left_down){
			if($PaperTop==1){break;}
			PaperBackStart2();
			Wait(50);
		}
		MoveCursor(168,202);//1
	}else if($CsrX<=218&&$CsrX>=200&&$CsrY<=520&&$CsrY>=408){
		PaperNextStart();
		Wait(50);
		while($SYSTEM_XBOX360_button_down_down||$SYSTEM_XBOX360_button_right_down){
			if($PaperBottom==25){break;}
			PaperNextStart2();
			Wait(50);
		}

		if($PaperBottom==25&&($SYSTEM_XBOX360_button_down_down||$SYSTEM_XBOX360_button_right_down)){
			Fade("カルテオーバー", 0, 0, null, true);
			MoveCursor(512,480);//OK
		}else{
			MoveCursor(168,383);//7
		}
	}
}


function PaperNextStart()
{
	$PaperMove=80;

	Fade("カルテオーバー", 0, 0, null, false);

	Move("カルテスクロール", $PaperMove, @0, @$KarteScrollLineP, null, false);
	Move("カルテベース/カルテウィンドウ*", $PaperMove, @0, @-100, null, false);
	Move("カルテベース/カルテウィンドウ/カルテチョイス*/*/*", $PaperMove, @0, @-100, null, true);

	Fade("カルテオーバー", 0, 1000, null, true);

//	$SYSTEM_XBOX360_button_left_down=false;$SYSTEM_XBOX360_button_right_down=false;
//	$SYSTEM_XBOX360_button_up_down=false;$SYSTEM_XBOX360_button_down_down=false;

	$PaperTop++;
	$PaperBottom++;
}


function PaperBackStart()
{
	$PaperMove=80;

	Fade("カルテオーバー", 0, 0, null, false);

	Move("カルテスクロール", $PaperMove, @0, @$KarteScrollLineM, null, false);
	Move("カルテベース/カルテウィンドウ*", $PaperMove, @0, @127, null, false);
	Move("カルテベース/カルテウィンドウ/カルテチョイス*/*/*", $PaperMove, @0, @100, null, true);

	Fade("カルテオーバー", 0, 1000, null, true);

//	$SYSTEM_XBOX360_button_left_down=false;$SYSTEM_XBOX360_button_right_down=false;
//	$SYSTEM_XBOX360_button_up_down=false;$SYSTEM_XBOX360_button_down_down=false;

	$PaperTop--;
	$PaperBottom--;
}


function PaperNextStart2()
{
	$PaperMove=0;

	//★★★★ロック
	XBOX360_LockVideo(true);

	Move("カルテスクロール", $PaperMove, @0, @$KarteScrollLineP, null, false);
	Move("カルテベース/カルテウィンドウ*", $PaperMove, @0, @-100, null, false);
	Move("カルテベース/カルテウィンドウ/カルテチョイス*/*/*", $PaperMove, @0, @-100, null, true);

//	Fade("カルテベース/カルテウィンドウ/カルテチョイス/MouseOver/*", 0, 0, null, false);
	Move("カルテオーバー", 0, 160, $PaperOver7, null, false);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	$PaperTop++;
	$PaperBottom++;
}


function PaperBackStart2()
{
	$PaperMove=0;

	//★★★★ロック
	XBOX360_LockVideo(true);

	Move("カルテスクロール", $PaperMove, @0, @$KarteScrollLineM, null, false);
	Move("カルテベース/カルテウィンドウ*", $PaperMove, @0, @100, null, false);
	Move("カルテベース/カルテウィンドウ/カルテチョイス*/*/*", $PaperMove, @0, @100, null, true);

//	Fade("カルテベース/カルテウィンドウ/カルテチョイス/MouseOver/*", 0, 0, null, false);
	Move("カルテオーバー", 0, 160, $PaperOver1, null, false);

	//★★★★アンロック
	XBOX360_LockVideo(false);

	$PaperTop--;
	$PaperBottom--;
}








