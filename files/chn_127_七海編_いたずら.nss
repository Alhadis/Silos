//<continuation number="80">

chapter main
{

	$PreGameName = "boot_七海ルート";

	if($GameStart != 1)
	{
		$GameName = "chn_127_七海編_いたずら";
		$GameContiune = 1;
		$七海ルート=true;
		$RouteON=true;
		Reset();
	}

	chn_127_七海編_いたずら();
}


function chn_127_七海編_いたずら()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★七海編

//以下、七海編チャプター２。このパートは「現実」です。ただし妄想エフェクトをあえて付けます

//画面エフェクト//以下、妄想エフェクト有り

//ＢＧ//黒
//ＳＥ//拓巳のケータイのバイブ音
	CreateSE("SE01","SE_日常_けい帯_ばいぶ_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

	CreateColor("Black", 4000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
なにかの音がする……。
僕はまどろみの中で、その音をぼんやりと認識する。

いったいなんの音だろう？
どこかで聞いたことがあるような……。

ああ、そっか。ケータイのバイブ音だ。

誰かから電話でもかかってきたのかな？
僕のケータイに？　そんな珍しいことがあるのか？
また例の『通りゃんせ』のいたずら電話だろうか。

だとしたら、出たくない。
薄気味悪いし、この前はあの電話のせいで１時間以上気絶する羽目になったし。

無視して、深い眠りに再び落ちていこうとした。
でも、一度気になり出した音は、なかなか意識の外に追いやることができない。

しかも相手もしつこくて、延々とコールし続けてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	FadeDelete("Black", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00400010ta">
「う……」

目を開ける。僕は床に寝ていた。

ソファには七海が眠っているはず……と思ったら、姿がなかった。

どこ行ったんだろう。トイレ？　それとも、やっぱり泊まるのはやめて実家に帰ったのかな……。

寝起きで、ボーッとしている間も、ケータイは振動し続けていた。

もう３分以上経つ。留守番電話になりそうなものだけど、もしかすると設定し忘れちゃったのかも。

あまりのしつこさにしびれを切らし、僕はＰＣデスクの上にあるケータイを手に取った。

着信表示を見ると――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳のケータイ着信画面
//１０月２８日（火）の午前４時あたり。着信表示は『非通知着信』
//▼べー：ＢＧ：要差し替え
//	CreateTexture360("着信画面１", 100, 0, 0, "cg/bg/bg129_03_1_謎の電話番号_a.jpg");
	CreateTexture360("着信画面１", 100, 0, 0, "cg/bg/bg226_01_6_chn携帯電話非通知_a.jpg");
	Fade("着信画面１", 0, 0, null, true);
	Fade("着信画面１", 500, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
非通知着信……。
これじゃ、誰からなのか分からない。

あんまり出たくないなあ……。

//ＳＥ//ケータイの通話ボタンを押す
{	CreateSE("SE02","SE_日常_けい帯ボタン押す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	SetVolume("SE01", 0, 0, null);
	Wait(500);}
//◆寝起きでテンション低い
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00400020ta">
「もしもし」

//◆苦しげな息
//ＶＦ//電話の声
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00400030na">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00400040ta">
「だ、誰……？」

//◆弱々しい
//ＶＦ//電話の声
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00400050na">
「おにぃ……」

七海だった。
僕はホッとして、ため息をついた。

あいつ、どこからかけてるんだ？
つい数時間前に“外には出たくない”ってヘロヘロ声で言ってたくせに。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00400060ta">
「七海か。ど、どこにいるんだ？」

//◆弱々しい
//ＶＦ//電話の声
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00400070na">
「右手を……返して……」

//◆弱々しい
//ＶＦ//電話の声
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00400080na">
「ナナの……右手――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ブツッとケータイ切れる
//ＳＥ//ツーツーツー
	CreateSE("SE03","SE_日常_でんわ_ぶつっと切れる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE03", null);
	CreateSE("SE04","SE_日常_でんわ_つーつーつー_LOOP");
	MusicStart("SE04", 0, 1000, 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
切れた。
意味不明なことを言うだけ言って。

ＵＺＥＥＥＥＥ！

いったいどんないたずらだよ！　ふざけるな！

はあ、心配して損した。どうやら元気になったみたいだし、探しに行く必要もないよな。どうせ下の階にある共同トイレとかから、かけてきているに違いない。

{	CreateSE("SE02","SE_日常_けい帯ボタン押す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	waitPlay("SE02", null);
	SetVolume("SE04", 0, 0, null);}
すごく眠いし、こんないたずらに付き合いきれない。

{	CreateSE("SE05","SE_日常_寝がえりをうつ");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);}
僕はケータイを放り出すと、またその場に横になって、目を閉じた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	ClearAll(2000);
	Wait(1000);
}