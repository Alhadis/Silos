//<continuation number="130">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_002_西條拓巳";
		$GameContiune = 1;
		Reset();
	}
	ch01_002_西條拓巳();
}


function ch01_002_西條拓巳()
{
	$SYSTEM_last_text="第１章";

	if(Platform()!=100){
		Save(9999);
	}

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//ギガロマニアックス　シナリオ
//☆Cut-3------------------------------
//■第１章【Eyes in eyes】/
// OP終了後　BGアイキャッチ第１章（地味に）
	$SYSTEM_XBOX360_rich_presence_mode=7;
	XBOX360_Presence(7);

	CreateTextureEX("アイキャッチ１", 100, 0, 0, "cg/bg/bg003_01_1_アイキャッチ第１章_a.jpg");
	Fade("アイキャッチ１", 1000, 1000, null, true);

	Wait(3000);

	FadeDelete("アイキャッチ１", 1000, true);

	Wait(2000);

//９月２８日（日）//日付は表示しない
//ＢＧ//黒
//以下、画面黒で文章のみ画面中央にカットイン
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");

//ＳＥ//ハードデスク
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

	Wait(2000);

//ENTER_reset
//”視線”は見えない。
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, Middle, Auto, Auto, "“視線”は見えない。");
	Move("テキスト１", 0, @8, @0, null, true);
	SetBacklog("“視線”は見えない。", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(2000);

	FadeDelete("テキスト１", 500, true);

//wait_1sec_reset & ENTER_reset
//見ているのに見えないなんて、変な話だ
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト２", 100, center, middle, Auto, Auto, "見えているのに見えないなんて、変な話だ。");
	Move("テキスト２", 0, @10, @0, null, true);
	SetBacklog("見えているのに見えないなんて、変な話だ。", "NULL", NULL);
	Request("テキスト２", NoLog);
	Request("テキスト２", Erase);
	Request("テキスト２", Enter);
	WaitAction("テキスト２", null);

	Wait(2000);

	FadeDelete("テキスト２", 500, true);

//wait_1sec_reset & ENTER_reset
//物心ついた頃から、僕はどこからかの“視線”を感じることが何度かあった。
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト３", 100, center, middle, Auto, Auto, "物心ついた頃から、僕はどこからかの“視線”を感じることが何度かあった。");
	Move("テキスト３", 0, @24, @0, null, false);
	SetBacklog("物心ついた頃から、僕はどこからかの“視線”を感じることが何度かあった。", "NULL", NULL);
	Request("テキスト３", NoLog);
	Request("テキスト３", Erase);
	Request("テキスト３", Enter);
	WaitAction("テキスト３", null);

	Wait(2000);

	FadeDelete("テキスト３", 500, true);

//wait_1sec_reset & ENTER_reset
//振り返っても、誰もいない。でも見られていたっていう確信があった。
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト５", 100, center, middle, Auto, Auto, "振り返っても、誰もいない。");
	Move("テキスト５", 0, @16, @-15, null, false);
	SetBacklog("振り返っても、誰もいない。", "NULL", NULL);
	Request("テキスト５", NoLog);
	Request("テキスト５", Erase);
	Request("テキスト５", Enter);
	WaitAction("テキスト５", null);

	Wait(500);

	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト６", 100, center, middle, Auto, Auto, "でも見られていたっていう確信があった。");
	Move("テキスト６", 0, @16, @+15, null, true);
	SetBacklog("でも見られていたっていう確信があった。", "NULL", NULL);
	Request("テキスト６", NoLog);
	Request("テキスト６", Erase);
	Request("テキスト６", Enter);
	WaitAction("テキスト６", null);

	Wait(2000);

	FadeDelete("テキスト５", 500, false);
	FadeDelete("テキスト６", 500, true);

//wait_1sec_reset & ENTER_reset
//首筋あたりが、ゾワゾワとするような感覚。
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト７", 100, center, middle, Auto, Auto, "首筋あたりが、ゾワゾワとするような感覚。");
	Move("テキスト７", 0, @16, @0, null, true);
	SetBacklog("首筋あたりが、ゾワゾワとするような感覚。", "NULL", NULL);
	Request("テキスト７", NoLog);
	Request("テキスト７", Erase);
	Request("テキスト７", Enter);
	WaitAction("テキスト７", null);

	Wait(2000);

	FadeDelete("テキスト７", 500, true);


//wait_1sec_reset & ENTER_reset
//それって、ただの自意識過剰？
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト８", 100, center, middle, Auto, Auto, "それって、ただの自意識過剰？");
	Move("テキスト８", 0, @16, @0, null, true);
	SetBacklog("それって、ただの自意識過剰？", "NULL", NULL);
	Request("テキスト８", NoLog);
	Request("テキスト８", Erase);
	Request("テキスト８", Enter);
	WaitAction("テキスト８", null);

	Wait(2000);

	FadeDelete("テキスト８", 500, true);

//wait_1sec_reset & ENTER_reset
//それとも、視線恐怖症？
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト９", 100, center, middle, Auto, Auto, "それとも、視線恐怖症？");
	Move("テキスト９", 0, @16, @0, null, true);
	SetBacklog("それとも、視線恐怖症？", "NULL", NULL);
	Request("テキスト９", NoLog);
	Request("テキスト９", Erase);
	Request("テキスト９", Enter);
	WaitAction("テキスト９", null);

	Wait(2000);

	FadeDelete("テキスト９", 500, true);



//wait_1sec_reset & ENTER_reset
//小学生くらいまで"きっと神様が僕の事を見つめてくれているんだろう"なんて本気で思ってた。
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１０", 100, center, middle, Auto, Auto, "小学生くらいまで");
	Move("テキスト１０", 0, @10, @-30, null, false);
	SetBacklog("小学生くらいまで", "NULL", NULL);
	Request("テキスト１０", NoLog);
	Request("テキスト１０", Erase);
	Request("テキスト１０", Enter);
	WaitAction("テキスト１０", null);

	Wait(500);

	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１１", 100, center, middle, Auto, Auto, "“きっと神様が僕の事を見つめてくれているんだろう”");
	Move("テキスト１１", 0, @16, @0, null, false);
	SetBacklog("“きっと神様が僕の事を見つめてくれているんだろう”", "NULL", NULL);
	Request("テキスト１１", NoLog);
	Request("テキスト１１", Erase);
	Request("テキスト１１", Enter);
	WaitAction("テキスト１１", null);

	Wait(500);

	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１２", 100, center, middle, Auto, Auto, "なんて本気で思ってた。");
	Move("テキスト１２", 0, @16, @30, null, true);
	SetBacklog("なんて本気で思ってた。", "NULL", NULL);
	Request("テキスト１２", NoLog);
	Request("テキスト１２", Erase);
	Request("テキスト１２", Enter);
	WaitAction("テキスト１２", null);

	Wait(2000);

	FadeDelete("テキスト１０", 500, false);
	FadeDelete("テキスト１１", 500, false);
	FadeDelete("テキスト１２", 500, true);

//wait_1sec_reset & ENTER_reset
//その頃書いた作文でも、そんなようなことをテーマにしてた。
//もちろん今思えばそんなの、どう考えても中２病だ。
//イタいったらないよ。
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１３", 100, center, middle, Auto, Auto, "その頃書いた作文でも、そんなようなことをテーマにしてた。");
	Move("テキスト１３", 0, @16, @0, null, false);
	SetBacklog("その頃書いた作文でも、そんなようなことをテーマにしてた。", "NULL", NULL);
	Request("テキスト１３", NoLog);
	Request("テキスト１３", Erase);
	Request("テキスト１３", Enter);
	WaitAction("テキスト１３", null);

	Wait(2000);

	FadeDelete("テキスト１３", 500, true);

	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１４", 100, center, middle, Auto, Auto, "もちろん今思えばそんなの、どう考えても中２病だ。");
	#TIPS_中２病 = true;$TIPS_on_中２病 = true;
	Move("テキスト１４", 0, @16, @-15, null, false);
	SetBacklog("もちろん今思えばそんなの、どう考えても中２病だ。", "NULL", NULL);
	Request("テキスト１４", NoLog);
	Request("テキスト１４", Erase);
	Request("テキスト１４", Enter);
	WaitAction("テキスト１４", null);

	Wait(500);

	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１５", 100, center, middle, Auto, Auto, "イタいったらないよ。");
	Move("テキスト１５", 0, @12, @15, null, true);
	SetBacklog("イタいったらないよ。", "NULL", NULL);
	Request("テキスト１５", NoLog);
	Request("テキスト１５", Erase);
	Request("テキスト１５", Enter);
	WaitAction("テキスト１５", null);

	Wait(2000);

	FadeDelete("テキスト１４", 500, false);
	FadeDelete("テキスト１５", 500, true);

//▼TIPS：中２病解除
	$TIPS_on_中２病 = false;

//wait_1sec_reset & ENTER_reset
//今誰かに読まれるなんてことになったら、僕は一生引きこもるね。
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１６", 100, center, middle, Auto, Auto, "今誰かに読まれるなんてことになったら、僕は一生引きこもるね。");
	Move("テキスト１６", 0, @24, @0, null, false);
	SetBacklog("今誰かに読まれるなんてことになったら、僕は一生引きこもるね。", "NULL", NULL);
	Request("テキスト１６", NoLog);
	Request("テキスト１６", Erase);
	Request("テキスト１６", Enter);
	WaitAction("テキスト１６", null);

	Wait(2000);

	FadeDelete("テキスト１６", 500, true);

//wait_1sec_reset & ENTER_reset
//ふひひ。

	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１８", 100, center, middle, Auto, Auto, "ふひひ。");
	Move("テキスト１８", 0, @18, @0, null, false);
	SetBacklog("ふひひ。", "NULL", NULL);
	Request("テキスト１８", NoLog);
	Request("テキスト１８", Erase);
	Request("テキスト１８", Enter);
	WaitAction("テキスト１８", null);

	Wait(1000);

	FadeDelete("テキスト１８", 500, true);


//wait_1sec_reset & ENTER_reset
//あの作文のタイトルは、今でもよく覚えてる。
	SetFont("ＭＳ ゴシック", 21, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１９", 100, center, middle, Auto, Auto, "あの作文のタイトルは、今でもよく覚えてる。");
	Move("テキスト１９", 0, @10, @0, null, false);
	SetBacklog("あの作文のタイトルは、今でもよく覚えてる。", "NULL", NULL);
	Request("テキスト１９", NoLog);
	Request("テキスト１９", Erase);
	Request("テキスト１９", Enter);
	WaitAction("テキスト１９", null);

	Wait(1000);

	CreateTextureEX("back03", 100, 0, -40, "cg/bg/bg004_01_1_作文用紙その目_a.jpg");
	CreateSE("SE02","SE_衝撃_衝撃音01");

	FadeDelete("テキスト１９", 500, false);
	FadeDelete("色*", 500, true);

//wait_0.5sec_reset & ENTER_reset
//B/out 
//bg作文用紙『その目だれの目？』
//0.5sec F/in 1.5secWait 2sec F/out
//イメージＢＧ//作文用紙に小学生の拓巳のつたない文字で書かれたタイトル『その目だれの目？』
	//800*600



	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Move("back03", 1200, 0, 0, Dxl3, false);
	Fade("back03", 1000, 1000, null, true);

	Wait(3000);

	FadeDelete("back*", 1000, true);
	
//しばらくウェイトしてＦ・Ｏ～～
	CubeRoom3("ルーム", 100, 0);

//ＢＧ//拓巳の部屋
	Fade("ルーム", 500, 1000, null, false);

	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Rotate("ルーム", 2000, @60, @0, @0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
// ENTER_reset wait_0.5sec SEイス軋 & VR拓巳部屋天井 F/in 1sec
背中を預けていたイスの背もたれが、しわがれた声みたいな音をたてて軋んだ。

// ENTER 
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200010ta">
「僕を、見るな」

// ENTER_reset
うんざりした気分になって、薄暗い天井を見上げたままつぶやいてみる。
もちろん返事はない。

// ENTER_reset
ここは僕の部屋。
僕はひとり暮らし。

この部屋には僕という人間以外には誰もいない。

// ENTER
試しに振り返ってみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//イス軋
	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	SoundPlay("SE02",0,1000,false);

// VR拓巳部屋後ろPan時計回
	Rotate("ルーム", 2000, @-60, @-180, @0, AxlDxl, true);

//ＢＧ//拓巳の部屋
//スクロール＆画面切り替え//ＰＣ画面の青い光が部屋に落ちるも、暗い部屋。棚にはマンガ本やフィギュアなどオタクアイテムがずらり
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
// ENTER_reset
部屋は縦長の間取りで、少し薄暗い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//イス軋
	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	MusicStart("SE02",0,1000,0,1000,null,false);

// ENTER_reset VR拓巳部屋正面Pan時計回 Setしたらネーム
	Rotate("ルーム", 2000, @0, @+180, @0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600003]
ＰＣデスクに置いてあるデスクライトが、この部屋の唯一の照明だ。

// ENTER_reset
そもそも部屋には窓がひとつもないんだから、暗いに決まってる。

// ENTER_reset
外の様子がまったくうかがい知れないから、今が昼か夜かも分からない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//イス軋
	CreateSE("SE03","SE_日常_家具_イス_きしむ");
	MusicStart("SE03",0,1000,0,1000,null,false);
	Rotate("ルーム", 2000, @50, @-25, @0, Dxl1, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
// ENTER_reset　VR拓巳部屋左上隅 Setしたらネーム
部屋の隅の方の暗闇に向かって、僕はわざとらしく声を出した。

//おがみ：ルビ入力
// ENTER_reset　
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200020ta">
「僕の名前は<RUBY text="にしじょう">西條</RUBY><RUBY text="たくみ">拓巳</RUBY>。１７歳。翠明学園２年。<k>
<voice name="拓巳" class="拓巳" src="voice/ch01/00200021ta">
と言っても学校にはほとんど行ってないけど」

// ENTER_reset　
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200030ta">
「ま、それでも勉強はできる方だよ。<k><?>
<voice name="拓巳" class="拓巳" src="voice/ch01/00200031ta">
定期テストはちゃんと受けてる。しかもそれなりに上位の点数を取ってるからね。<k><?>
<voice name="拓巳" class="拓巳" src="voice/ch01/00200032ta">
頭はいいんだ」

// ENTER_reset　
呼びかけたって、なにが起こるわけじゃない。
誰かがぬっと姿を現すわけでもない。

// ENTER　 
暗闇は暗闇のままそこにあり続けているだけ。

// ENTER_reset　
でも闇は、人の妄想をかきたてる。

// ENTER_reset　
見えないっていうのは、つまり未知ってこと。

// ENTER_reset　
あり得ないって理性では分かってても、そこになにかとんでもないものが潜んでいるんじゃないかって、ついつい考えちゃうんだ。

// ENTER_reset　
ったく、すぐこうやって自分で勝手に恐い系妄想を膨らませちゃうんだよなあ……。

// ENTER_reset　
それを吹っ切るように、僕は独り言を続ける。

// ENTER_reset　
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200040ta">
「僕は現在アウェイ……じゃなかった、渋谷でひとり暮らしをしてる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("ルーム", null);

	SetVolume("SE01", 2000, 500, null);


	Fade("ルーム", 1000, 0, null, true);
	CreateTextureEX("背景１", 100, 0, 40, "cg/bg/bg005_01_1_KURENAI見上げ_a.jpg");
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg006_01_1_コンテナ外観_a.jpg");
	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg007_01_1_神泉町坂_a.jpg");
	CreateTextureEX("背景４", 100, 0, 0, "cg/bg/bg008_01_1_ラブホ街_a.jpg");
	Move("背景１", 1000, 0, -80, Dxl2, false);
	Fade("背景１", 1000, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
// ENTER_reset（以下、文章の途中で絵が変わるよ）
<voice name="拓巳" class="拓巳" src="voice/ch01/00200041ta">
この// bgKURENAI会館見上げ_昼cut / in
ＫＵＲＥＮＡＩ会館ビルは、父さんの経営するビル会社の管理下にあるんだけど、

// ENTER_reset　
<voice name="拓巳" class="拓巳" src="voice/ch01/00200042ta">
その屋上に設置された// bgコンテナ外観_昼cut / in
{	Fade("背景２", 300, 1000, null, true);
	Delete("背景１");}
コンテナハウスを格安で借りてるんだ」

// ENTER_reset　
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200050ta">
「街の環境は最悪。僕が住んでる//bg神泉町坂_昼Cut / in
{	Wait(3000);
	Fade("背景３", 300, 1000, null, true);
	Delete("背景２");}
神泉町は、小さな坂が多いから疲れるし。すぐ近くに//bgラブホ街_昼Cut / in
{	Wait(3000);
	Fade("背景４", 300, 1000, null, true);
	Delete("背景３");
	Delete("背景２");
	Delete("背景１");}
ラブホ街もあるし」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景５", 100, 0, -80, "cg/bg/bg009_01_1_107_a.jpg");
	Fade("背景５", 1000, 1000, null, true);
	Move("背景５", 1500, 0, @-640, Axl2, true);
	Move("背景５", 500, 0, @-96, Dxl2, true);
	Delete("背景４");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600001]
// ENTER_reset bg渋谷107前_昼Cut / in
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200060ta">
「ここがアキバなら最高だったのに」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2000, 1000, null);

	FadeDelete("背景５", 500);
	Fade("ルーム", 500, 1000, null, false);
	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	MusicStart("SE02", 0, 700, 0, 1000, null, false);
	Rotate("ルーム", 2000, @-50, @+25, @0, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600002]
// ENTER_reset　VR拓巳部屋正面Cut / in
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200070ta">
「ホント、渋谷ってひどい街だ。『エンスー』で言うとディーンズヴァレーくらいひどい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Fade("ルーム", 200, 0, null, false);

	CreateMovie360("ナイトハルト", 100, Center, Middle, true, false, "dx/mvNH01.avi");	
	Fade("ナイトハルト", 20, 1000, null, true);
//	Request("ナイトハルト", Play);	



	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
// ENTER_reset mpgエンスー（NHの腕あたりにUP低画質）
{#TIPS_ＭＭＯＲＰＧ = true;$TIPS_on_ＭＭＯＲＰＧ = true;}
エンスーっていうのは、僕がライフワークにしてる<FONT incolor="#88abda" outcolor="BLACK">ＭＭＯＲＰＧ</FONT>の略称。

// ENTER
{$TIPS_on_ＭＭＯＲＰＧ = false;}
正式なタイトルは『エンパイア・スウィーパー・オンライン』。

// ENTER_reset
ほぼ毎日、寝る間を惜しんで
バゼラード――エンスー内の世界の名前――に潜っている。

// ENTER_reset
ディーンズヴァレーはそのエンスーに登場するエリア名で、むかつくモンスターばかり出る場所だ。

// ENTER
いやらしい特殊攻撃をしてくるくせに、ろくなアイテムをドロップしない。

// ENTER_reset
ディーンズヴァレーで狩りをしてるヤツはバカだね。

// ENTER
上級者ならあんなところはすぐに見限って隣のリーエイトの森に行く。

// ENTER_reset
もちろん僕もそうした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Fade("ルーム", 500, 1000, null, false);
	Delete("ナイトハルト");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//ＤＱＮ←ネットスラング
//【拓巳】
{#TIPS_ＤＱＮ = true;$TIPS_on_ＤＱＮ = true;}
<voice name="拓巳" class="拓巳" src="voice/ch01/00200080ta">
「というわけで、<FONT incolor="#88abda" outcolor="BLACK">ＤＱＮ</FONT>と恋愛資本主義者が集まるこんな街は、即刻滅ぶべきだね」

// ENTER_reset　
{$TIPS_on_ＤＱＮ = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200090ta">
「でもこの部屋の住み心地はまあまあ我慢できるレベル。

// ENTER_reset　
<voice name="拓巳" class="拓巳" src="voice/ch01/00200091ta">
ＰＣとネット環境は最高水準クラスがそろってるからね。

// ENTER
<voice name="拓巳" class="拓巳" src="voice/ch01/00200092ta">
まぁ、学生にしては上等の基地じゃないかな。
あ、だから僕はこの部屋のことをベースって呼んでる」

// ENTER_reset　
相変わらず部屋の中には僕以外に動くものはなにもない。

// ENTER
いい加減、ひとりで喋ってるのもバカバカしくなってきたから、"僕を見ている誰か"への自己紹介はもうやめることにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//イス軋回転
	CreateTextureEX("ふひひ", 100, 0, 0,"cg/ev/ev013_01_1_拓巳笑い口UP_a.jpg");
	CreateSE("SE02","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE02", 0, 700, 0, 1000, null, false);
	Rotate("ルーム", 1500, @-50, @180, @0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
// ENTER_reset　VR拓巳部屋右斜め下Pan ゆっくり
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200100ta">
「うは、それにしてもきったない部屋だなあ」

// ENTER_reset
すえたような匂いが部屋には充満している。
空気がよどんでいるのを肌で感じる。

// ENTER_reset
空のペットボトルや食べ終わったまま放置してあるコンビニ弁当の容器が、床に散乱していた。

// ENTER
ベッドの上はエロゲパッケージが積み上げてあるし。
おかげでいつもソファで寝る羽目になる。

// ENTER_reset
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200110ta">
「片付けろよなあ。誰だよ散らかしっぱなしにしたのは――って、

// reset
<voice name="拓巳" class="拓巳" src="voice/ch01/00200111ta">
僕か。

{	Fade("ルーム", 0, 0, null, false);
	Fade("ふひひ", 200, 1000, null, ture);}
// ev拓巳笑い口UP
<voice name="拓巳" class="拓巳" src="voice/ch01/00200112ta">
ふひひ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	FadeDelete("ふひひ", 0, false);
	Fade("ルーム", 0, 1000, Null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//できれば、SEペットボトル蹴る×3　カメラ跳ねる様にPan?フィギアへPan （これができれば、テキスト省略希望）
// ENTER_reset　VR拓巳部屋左下ペットボトルCut / in
自分のキモイ笑い方に少しイラッと来たから、足許にあるペットボトルを蹴飛ばしてやった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

// reset　
//それは、鉄板むき出しの寒々しさを感じさせる壁にぶつかって派手な音を立てる。
	CreateSE("SE02","SE_じん体_動作_足_蹴る_ぺっとぼとる");
	CreateSE("SE03","SE_じん体_動作_足_蹴る_ぺっとぼとる");
	CreateSE("SE04","SE_じん体_動作_足_蹴る_ぺっとぼとる");
	CreateSE("SE3601","SE_にん間_動作_手_はたく");

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Rotate("ルーム", 500, @+70, @0, @0, Dxl2, true);
	SoundStop2("SE02");
	MusicStart("SE03", 0, 500, 0, 1000, null, false);
	Rotate("ルーム", 500, @+10, @-45, @0, Dxl2, true);
	SoundStop2("SE03");
	MusicStart("SE04", 0, 800, 800, 1000, null, false);
	Rotate("ルーム", 500, @0, @+155, @+0, Dxl2, true);
	SoundStop2("SE04");
	MusicStart("SE3601",0,700,0,1000,null,false);


// ENTER_reset

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600004]
さらに跳ね返って、僕のフィギュアたちが並んでいる棚に飛んでいきそうだったので、悲鳴をあげつつあわてて身体を張ってペットボトルを受け止めた。

// ENTER_reset　
１００人に達しようっていう僕の嫁や姉や娘たちを傷つけるわけにはいかない。この子たちは僕の心を癒してくれる大事な存在なんだからね。

// ENTER_reset　
棚だけは週に一度は整頓してる。

// ENTER_reset
僕の嫁たちが一番かわいく見える角度とか立ち位置ってのを日々研究してるし、大事な姉や娘たちを埃まみれにしたくないから身体を拭いてあげることも欠かさない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
//あえて「１００人」です
//ちなみに「僕の妹」は除外してあります。拓巳は実妹がいるので妹萌えではないという設定です。

	CreateSE("SE03","SE_衝撃_ぺっとぼとる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	WaitAction("SE03", 300);
//ＳＥ//イス軋回転
	CreateSE("SE02","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Rotate("ルーム", 800, 0, 360, 0, Dxl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
// ENTER_reset　VR拓巳部屋正面Pan
僕はホッと息をついてから、空のペットボトルを部屋の隅に放り捨てて、ＰＣに向き直った。

//イメージＢＧ//ＰＣデスクトップ画面
//星来フィギュアが置いてある
// ENTER_reset　
部屋の一番奥に鎮座しているのが僕のマイＰＣ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Rotate("ルーム", 500, @-10, @0, @0, Null, true);
//アニメタイトルは仮
//※ＴＩＰＳあるなら、星来のキャラ設定をここで見られるようにしちゃってもいいかも。"星来"の読み方（せいら）もそこで紹介する
// ENTER_reset

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600005]
//※テキストオーバー08/11/04
//おがみ：テキスト：3行に収まらないので修正（林さん確認済み）
//モニタの横には、今一番お気に入りのアニメ、ブラチュー――『ブラッドチューン　ＴＨＥ　ＡＮＩＭＡＴＩＯＮ』の<FONT incolor="#88abda" outcolor="BLACK"><RUBY text="せいら">星来</RUBY>たん（１／８スケール・覚醒前ｖｅｒ）</FONT>が、萌えるポーズを取って僕に微笑みかけてくれている。

{#TIPS_星来オルジェル = true;$TIPS_on_星来オルジェル = true;}
モニタの横にいるのは、今一番お気に入りのアニメ、
ブラチュー――『ブラッドチューン　ＴＨＥ　ＡＮＩＭＡＴＩＯＮ』の
<FONT incolor="#88abda" outcolor="BLACK"><RUBY text="せいら">星来</RUBY>たん（１／８スケール・覚醒前ｖｅｒ）</FONT>だ。

萌えるポーズを取って僕に微笑みかけてくれている。


// ENTER_reset　
{$TIPS_on_星来オルジェル = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200120ta">
「星来かわいいよ星来」

// ENTER_reset　
星来たんとしばらく見つめ合ってそうつぶやき、パソコンの横に置いてあったコーラのペットボトルを手にとって、ラッパ飲みでのどを潤した。

// ENTER_reset　
コーラはぬるかったけど、まあ別に気にしない。

// ENTER_reset　
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00200130ta">
「さてと、エンスらないと」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_家具_イス_きしむ_回転");

	CreateMovie360("ナイトハルト", 100, Center, Middle, true, false, "dx/mvNH01.avi");

//ＳＥ//イス軋回転
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//VR拓巳部屋左モニターPan
	Rotate("ルーム", 500, @10, @20, @0, Null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
// ENTER_reset　
イスに腰を落ち着けて、キーボードに両手を添えた。
こうするだけで気分が落ち着く。

{	Fade("ルーム", 0, 0, false);}
// ENTER_reset
{#TIPS_パラディン = true;$TIPS_on_パラディン = true;}
エンスーでの僕のキャラである『ナイトハルト』は、すでに２回転生済みの<FONT incolor="#88abda" outcolor="BLACK">パラディン</FONT>。

// ENTER_reset　
{$TIPS_on_パラディン = false;}
レベルは当然マックスの５０。これは稼働中のサーバ内でも最高ランクだ。

"<RUBY text="しっぷうじんらい">疾風迅雷</RUBY>のナイトハルト"っていう異名だけでほとんどのプレイヤーには通じる。

// ENTER_reset　
みんなは僕を神扱いだ。

// ENTER
レア武器、レア防具、レア魔法についてはコンプリート。
レアアイテムのコンプ率は９５％……まぁ、ちと苦戦中。

// ENTER_reset　
{#TIPS_ＲＭＴ = true;$TIPS_on_ＲＭＴ = true;}
マネーポイントは使い切れないほどある。
<FONT incolor="#88abda" outcolor="BLACK">ＲＭＴ</FONT>――リアルマネートレードで小遣い稼ぎもしてるからバイトしなくても半年は生きていける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	$TIPS_on_ＲＭＴ = false;

	Fade("ルーム", 200, 1000, null, false);
	Delete("ナイトハルト");
//イメージＢＧ//ＰＣ画面（チャットウインドウ、//【ちゃんねる、ＳＮＳを表示したブラウザウインドなどが開かれている）
// ENTER_VR拓巳部屋正面Pan  _reset　

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
チャットは大得意だ。

// ENTER_reset　
基本的なコミュニケーションは全部これで済ます。

// ENTER
巨大匿名掲示板『＠ちゃんねる』で人助けしたことだってある。祭にもよく参加する。

// ENTER_reset　
{#TIPS_ＳＮＳ = true;$TIPS_on_ＳＮＳ = true;}
あ、そうそう、『フレパラ』――<FONT incolor="#88abda" outcolor="BLACK">ＳＮＳ</FONT>のことだね――のマイフレンドリストも、とっくに１００人を超えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	$TIPS_on_ＳＮＳ = false;

//wait_1sec_reset & ENTER_reset
//// ENTER_reset　黒Backで画面センター表示
//尊敬も、
//信頼も、
//全部ここにある。
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１０", 100, 300, middle, Auto, Auto, "尊敬も、");
	Move("テキスト１０", 0, @160, @-30, null, false);
	Request("テキスト１０", NoLog);
	Request("テキスト１０", Erase);
	Request("テキスト１０", Enter);
	WaitAction("テキスト１０", null);

	SetBacklog("尊敬も、", "null", null);

	Wait(500);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１１", 100, 300, middle, Auto, Auto, "信頼も、");
	Move("テキスト１１", 0, @160, @0, null, false);
	Request("テキスト１１", NoLog);
	Request("テキスト１１", Erase);
	Request("テキスト１１", Enter);
	WaitAction("テキスト１１", null);

	SetBacklog("信頼も、", "null", null);

	Wait(500);

	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１２", 100, 300, middle, Auto, Auto, "全部ここにある。");
	Move("テキスト１２", 0, @160, @30, null, true);
	Request("テキスト１２", NoLog);
	Request("テキスト１２", Erase);
	Request("テキスト１２", Enter);
	WaitAction("テキスト１２", null);

	SetBacklog("全部ここにある。", "null", null);

	Wait(1000);

	FadeDelete("テキスト１０", 1000, false);
	FadeDelete("テキスト１１", 1000, false);
	FadeDelete("テキスト１２", 1000, false);
	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
// ENTER_VR拓巳部屋正面
僕は学校には行かない。

// ENTER
行きたくないんじゃなくて、行く意味がないんだ。

// ENTER_reset　
勉強はネットオンリー。
家でも十分にできる。

// ENTER_reset　
だけど卒業単位ってヤツはどうやら必要らしいから最低限は登校する。<K>
// ENTER
これが学生にとっての一番賢い生き方ってもんさ。

// ENTER_reset　
親もウルサイしね。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	FadeDelete("ルーム", 0, false);

	//bg最低登校シフト表Cut / in
	//イメージＢＧ//最低登校シフト表
	CreateTexture360("登校シフト", 2000, 0, 0,"cg/bg/bg010_01_1_最低登校シフト表_a.jpg");
	Fade("登校シフト", 0, 0, null, false);

	Fade("登校シフト", 500, 1000, null, false);
	Move("登校シフト", 3000, @0, @-48, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
// ENTER_reset　
で、理想的とも言える『最低登校シフト表』を自分で作った。

// ENTER_reset　
この表によると週に２．５回行けばいい計算になる。

// ENTER_reset　
毎日学校に行ってるヤツは僕のことをキモオタってバカにするけど、僕からしてみれば思考停止して毎日言われるがままに登校してるあいつらの方がバカさ。

// ENTER_reset
――とにかく、ここでの生活はまあまあ悪くないよ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH04", 3000, 0, null);

}
