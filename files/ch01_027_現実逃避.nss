//<continuation number="100">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_027_現実逃避";
		$GameContiune = 1;
		Reset();
	}

	ch01_027_現実逃避();
}


function ch01_027_現実逃避()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//☆Cut-99----------------------------- 
//ＢＧ//黒
//以下の拓巳のセリフ、ナレーション（音声）付きでもいいかもしれないです。
	CreateColor("色１", 300, 0, 0, 1280, 720, "Black");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02700010ta">
「なにも見たくない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02700020ta">
「なにも聞きたくない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02700030ta">
「時間は一定じゃない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02700040ta">
「記憶には矛盾がある」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02700050ta">
「視界にはエラーがある」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02700060ta">
「地球は回ってない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02700070ta">
「これはきっとゲームなんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ＰＣが起動する、ハードディスクがカリカリと動き出す音
	CreateSE("SE01","SE_日常_PC_起動");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//ＣＧ//自室でＰＣの前に立ってモニタを見下ろす拓巳
//	CubeRoom("ルーム", 100, 0);

//	Move("ルーム", 0, @0, @+200, null, false);
//	Rotate("ルーム", 0, @-35, @0, @0, Dxl2, false);
//	Fade("ルーム", 0, 1000, null, true);
//	FadeDelete("色１", 0, 0, null, false);

	CreateMovie360("起動画面", 100, Center, Middle, true, false, "dx/mvPC03.avi");
//	Request("起動画面", Play);

	FadeDelete("色１", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
ＰＣの電源を入れながら、魚肉ソーセージを頬張る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02700080ta">
「僕は……僕じゃない」

やがてモニタに星来たんの壁紙が表示される。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02700090ta">
「僕がいるべき世界は、」

僕は迷うことなく、真っ先にエンスーを起動させた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02700100ta">
「ここじゃないんだ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
	
//ＳＥ//起動4secF/out
	SetVolume("SE01",2400,0,null);
//～～Ｆ・Ｏ

	WaitAction("SE01", null);
	
	ClearAll(2000);
	
	if(#ClearG == true){
		CreateMovie360("ＯＰ２", 100, 0, 0, false, false, "dx/mvChaosLogic.avi");
		Zoom("ＯＰ２", 0, 800, 800, null, false);
		Move("ＯＰ２", 0, @-128, @-72, null, false);

		$MovieTime=RemainTime("ＯＰ２");
		WaitKey($MovieTime);

		Delete("ＯＰ２");
	}

//○実績No.2：第一章【Eyes in eyes】
	XBOX360_Achieved(2);

//プロットにあったインターミッション（拓巳が小学生時代に遭遇したバス事故）は２章冒頭に移動してあります

//第１章　ＥＮＤ


}


 