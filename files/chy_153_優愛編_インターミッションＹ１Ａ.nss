//<continuation number="300">

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_153_優愛編_インターミッションＹ１Ａ";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_153_優愛編_インターミッションＹ１Ａ();
}


function chy_153_優愛編_インターミッションＹ１Ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	$SYSTEM_last_text="第８章";

	if(Platform()!=100){
		Save(9999);
	}

//★優愛編

//章タイトルアイキャッチ
//――――――――――――――――
//■第８章【月と太陽】
	ChapterIn("dx/mvN.avi");

		Delete("*");
		CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg069_01_1_フリージア社内_a.jpg");
		Fade("背景１", 0, 1000, null, true);

	ChapterIn2();

	CreateSE("SE01","SE_はいけい_ふりーじあ社内_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

	Wait(1000);

//１１月４日（火）//日付は表示しない
//以下のインターミッションＹ１は、途中まで“ch08_154_インターミッション３３”をそのまま流用。その後に新規追加部分あり


//■インターミッションＹ１
	ch08_154_インターミッション３３();

}
