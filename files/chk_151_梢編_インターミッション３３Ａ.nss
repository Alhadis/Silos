//<continuation number="50">

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_151_梢編_インターミッション３３Ａ";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_151_梢編_インターミッション３３Ａ();
}


function chk_151_梢編_インターミッション３３Ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編

	$SYSTEM_last_text="第８章";

	if(Platform()!=100){
		Save(9999);
	}

//章タイトルアイキャッチ
//――――――――――――――――
//■第８章【殺戮に至る病】
//アイキャッチ
	ChapterIn("dx/mvO.avi");

	DeleteAll();
//ＢＧ//夕焼け空
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg126_01_2_夕焼け空_a.jpg");

	ChapterIn2();


	CreateSE("SE3601","SE_日常_雑踏01");
	MusicStart("SE3601",2000,500,0,1000,null,true);

	Wait(1000);


//■インターミッション３３Ａ

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆以下、梢の声はすべて心の声
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00500010ko">
「また、あの車だ……」

神泉駅の前で、折原梢は立ちすくんだ。
ここ数日、渋谷駅よりもこちらの駅から帰るようにしていた。
それもすべて、以前渋谷駅前で白い車に追いかけ回されたから。

//※１０月３日修正、以下
//まるで、待ち構えているかのように。
//※１０月３日修正、以上
そのときの、白い車が。
まるで、待ち構えていたかのように。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//神泉駅・夕方
//ＢＧ“神泉駅（夕方）”に表示されている右側の白いレガシー（？）ステーションワゴンのこと
	CreateTextureEX("back360", 100, 0, 0, "cg/bg/bg032_01_2_神泉駅_a.jpg");
	CreateTexture360("back02", 120, 0, 0, "cg/bg/bg032_01_2_神泉駅_a.jpg");
	Fade("back02", 0, 0, null, true);
	Request("back02", Smoothing);
	Zoom("back02", 0, 2000, 2000, null, true);

	if(Platform()==100){
	Move("back02", 0, @-240, @-120, null, true);
	}else{
	Move("back02", 0, @-480, @-240, null, true);
	}
	Fade("back02", 500, 1000, null, true);



	Delete("back01");

	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(1500);

//ＳＥ//心臓の鼓動


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
駅の前に、停まっていた。

//※１０月３日修正、以下
//梢が立ち尽くしていると、助手席のウインドウがゆっくりと下りて、半分ぐらい開いたところで止まった。
//※１０月３日修正、以上
梢が立ち尽くしていると、助手席のウインドウがゆっくりと下がって、半分ぐらい開いたところで止まった。

その隙間から、中に乗っている人の手が、にゅっと飛び出してくる。
手鏡を、握りしめて。

//※１０月３日修正、以下
//梢に、見せつけるかのようで。
//※１０月３日修正、以上
梢に、見せつけるかのように。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1000, 0, null);


	Fade("back360", 0, 1000, null, true);
	Fade("back02", 500, 0, null, true);
	Delete("back02");

	Stand("st梢_制服_正面","sad", 200, @-180);
	FadeStand("st梢_制服_正面_sad", 500, true);

	BGMPlay360("CH01",0,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//◆リアル声//◆怯えるブレス
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00500020ko">
「……っ」

//以上、リアル声
{	DeleteStand("st梢_制服_正面_sad", 500, true);
	CreateSE("SE走","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE走", 1000, 1000, 0, 1000, null, true);}
息が止まりそうなほどの恐怖。
とっさに梢はその場からきびすを返して、逃げ出していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//夜空

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg206_01_3_夜空_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	SetVolume("SE走", 2000, 0, null);

	Delete("back360");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
無我夢中であちこちを走り続け、途中、何度も転んで膝を擦りむきながら、なんとか宮下公園に逃げ込み、夜になるまでベンチに座って震え続けた。

けれど、いつまでもここで膝を抱えているわけにもいかない。
怯えながらも、梢は頃合いを見計らって、渋谷駅へと向かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//渋谷駅南口・夜
//ＢＧ“渋谷駅南口（夜）”に表示されている右側の白いレガシー（？）ステーションワゴンのこと
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("Black", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg023_01_3_渋谷駅南口_a.jpg");
	CreateTextureEX("back360", 100, 0, 0, "cg/bg/bg023_01_3_渋谷駅南口_a.jpg");

	Delete("back03");
	DrawTransition("Black", 500, 1000, 0, 100, null, "cg/data/left3.png", true);

	Delete("Black");

	Wait(1000);

//ＳＥ//心臓の鼓動
	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Request("back360", Smoothing);
	Zoom("back360", 0, 2000, 2000, null, true);

	if(Platform()==100){
	Move("back360", 0, @-192, @-120, null, true);
	}else{
	Move("back360", 0, @-320, @-240, null, true);
	}

	Fade("back360", 500, 1000, null, true);

	Wait(1500);

	Fade("back360", 500, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
そこにも、停まっていた。
さっきと同じ、白い車。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_拒絶","pinch", 200, @-180);
	FadeStand("st梢_制服_拒絶_pinch", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00500030ko">
「や、やだ……。やだよぅ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_拒絶_pinch", 500, true);
	CreateSE("SE走","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE走", 1000, 1000, 0, 1000, null, true);
//ＢＧ//円山町の町並み・夜
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg024_02_3_円山町_a.jpg");
	DrawTransition("back05", 500, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("back04");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
どこへ向かうあてもなく、走り続ける。
涙がとめどなく溢れてくる。
脳裏をよぎるのは、疑問。

あの白い車に乗っているのは何者なのか。
なぜ梢に嫌がらせをしてくるのか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//神泉の町並み・夜
	CreateTexture360("back06", 100, 0, 0, "cg/bg/bg014_02_3_神泉町並み_a.jpg");
	DrawTransition("back06", 500, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("back05");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
いつの間にか、神泉の駅の近くまで来ていた。
さっき駅前であの車が待ち構えていたことを考えると、駅には行きたくなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE走", 2000, 0, null);

//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("Black", 500, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("back06");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
普段は行かない細い路地を入る。
街灯もなく、薄暗い。
それが梢の恐怖をより増幅させる。

{	CreateSE("SE歩","SE_じん体_動作_足_歩く");
	MusicStart("SE歩", 0, 500, 0, 1000, null, false);}
梢はすでに疲れ切っていた。もう走る体力はない。
涙を拭いながら、それでも必死に歩き続け――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//山手通り・夜
	CreateTexture360("back07", 100, 0, 0, "cg/bg/bg196_01_3_山手通り_a.jpg");
	DrawTransition("Black", 500, 1000, 0, 100, null, "cg/data/right3.png", true);

	Fade("Black", 0, 0, null, true);
	DrawTransition("Black", 0, 0, 1000, 100, null, "cg/data/right3.png", true);


	SetVolume("SE歩", 500, 0, null);
	CreateSE("SE01","SE_じん体_動作_尻餅");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
大きな通りに出たと思ったら――
その瞬間に、目の前をあの白い車が通り過ぎていった。

{	Fade("Black", 500, 1000, null, true);}
梢は、愕然としてその車の行方を追う。
白い車は、５０メートルほど先でハザードランプを点灯させて、路肩に停止した。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00500040ko">
「やだ……やだ……」

逃げる気力も失われる。
どこへ逃げても、追いかけ回してくる。
梢の心を読んでいるかのように、先回りしてくる。

{	MusicStart("SE01",0,1000,0,1000,null,false);}
梢はその場にへたり込み、頭を抱え。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00500050ko">
「助けて、誰か、助けて……！」

心の中で、救いを求めた。
けれど、結局誰も、梢を助けに来てはくれなくて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＢＧ//黒

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
白い車は、梢が泣きながら立ち去るまで、そこに停車していた。
乗っている人間は、最後まで姿を見せようとはしなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//アイキャッチ
//※拓巳視点に戻る

	SetVolume360("@CH01", 2000, 0, null);
	SetVolume("SE*", 2000, 0, null);

	ClearAll(2000);
	Wait(1000);
}
