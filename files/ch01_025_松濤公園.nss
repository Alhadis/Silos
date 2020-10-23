//<continuation number="170">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_025_松濤公園";
		$GameContiune = 1;
		Reset();
	}

	ch01_025_松濤公園();
}


function ch01_025_松濤公園()
{


	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

//☆Cut-95-----------------------------

//ＢＧ//松濤公園//夕方
	CreateBG(100, 1000, 0, 0, "cg/bg/bg015_01_2_松濤公園_a.jpg");

	CreateSE("SE02","SE_日常_松濤公園");
	MusicStart("SE02", 1000, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
一緒に帰るって言っても、僕のベースまでは学校から１０分ほど。
優愛が使っている神泉駅の方が遠いから、僕が送ってもらう、っていう形になる。

ついいつものくせで、僕は松濤公園に入った。
ここを斜めに横切ると、ほんの１分ぐらいだけどショートカットになるんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(500,200);//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","normal", 200, @100);
	FadeStand("st優愛_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500010yu">
「西條くんって、朝、よくこの公園でパンを食べてませんか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02500020ta">
「あ、うん……」

どうして知ってるんだろう？

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500030yu">
「やっぱり。よく見かけたんです。でも、いるときといないときがあって」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500040yu">
「今日、ようやくその謎が解けました。
学校にたまにしか来ないからだったんですね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02500050ta">
「…………」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500060yu">
「あ、別にそれがダメって言ってるわけじゃなくてですね、素朴な疑問だったので……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02500070ta">
「う、うん……」

優愛はふと立ち止まり、いつも僕が朝食を食べるときに腰掛けるベンチへとその視線を向けた。
今、そこには誰も座っていない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","worry", 200, @100);
	DeleteStand("st優愛_制服_通常_normal", 300, false);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500080yu">
「なんだかここに座っているあなたの背中は、すごく、その、辛そうに見えて……」

優愛はわずかに腰をかがめて、ベンチの背もたれ部分を指先でそっと撫でる。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500090yu">
「何度も見かけるうちに、だんだん気になってきて……」

このベンチは、池の柵のすぐ前に設置してある。
しかも池側に向かって座る形になるから、誰かの視線を気にしてビクビクする必要もない。

すぐ横にある水車小屋が遮蔽物になって目立たないっていうのも、僕が気に入っている理由だ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500100yu">
「ここ最近は、姿を見かけなかった日は心配でご飯ものどを通らなかったりしてたんです……」

そ、そうだったのか。
見られてたなんて、全然気付かなかった。

{	Stand("st優愛_制服_通常左手下","sad", 200, @100);
	FadeStand("st優愛_制服_通常左手下_sad", 300, true);
	DeleteStand("st優愛_制服_通常左手下_worry", 0, false);}
//苦笑
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500110yu">
「バカみたいですよね、
一度も話したこともない人の心配してるなんて……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500120yu">
「でも、話しかける勇気もなかったので……」

最初のストーカーっぽい行為も、その延長線上にあったわけだ。
ストーカーというより、僕のことを心配して見守っていたっていうのが正しいのかもしれない。

{	Stand("st優愛_制服_通常","normal", 200, @100);
	DeleteStand("st優愛_制服_通常左手下_sad", 300, false);
	FadeStand("st優愛_制服_通常_normal", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500130yu">
「ちょっと、座ってみてもいいですか？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500140yu">
「西條くんがどんな景色を見ていたのか、わたしも、その、知りたいから……」

特に断る理由なんてなかった。
僕は池の方を向いたままうなずきを返した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常_normal", 500, true);

	CreateTexture360("背景１", 300, center, middle, "SCREEN");

	CreateBG(100, 0, center, 0, "cg/bg/bg015_02_2_松濤公園_a.jpg");

	Stand("bu優愛_制服_通常","smile", 200, @100);
	FadeStand("bu優愛_制服_通常_smile", 0, true);

	FadeDelete("背景１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
持っていたカバンをベンチの上に置いてから、優愛はそっと腰掛けた。
背筋をピンと伸ばして池を見つめる。

とても静かで。
とても穏やかで。
すぐ横に優愛がいて。

そよ風が、池に波紋を作り、彼女の髪を揺らす。

これが、リア充ってことなのかな。

こんな何気ない風景、何気ないシチュエーションなのに、涙が出そうになるのはどうしてだろう……。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500150yu">
「ここで朝食を取るのって、気持ちよさそうですよね」

そうつぶやく優愛の横顔を、僕は窺う。

エロゲなら、間違いなく今が告白するタイミングだ。そしてふたりは結ばれて、キスをしてグッドエンディングだ。場合によってはそのまま屋外プレイに突入……なんてね、ふひひ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02500160yu">
「わたしも、今度やってみようかな……」

優愛が首を巡らせて僕を見上げてきた。
僕はなにも言い出すことができないまま、視線を落として優愛のカバンへと移す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 300, center, middle, "SCREEN");

//☆Cut-96-----------------------------
//イメージＢＧ//ベンチに置かれた優愛のカバン
	CreateBG(100, 0, 0, 0, "cg/bg/bg040_01_2_優愛カバン_a.jpg");
	DeleteStand("bu優愛_制服_通常_smile", 0, true);

	FadeDelete("背景１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
そのカバンにつけられた３つの『ゲロカエルん』ストラップを見ながら、女子と目を合わせることができない自分の情けなさを呪う。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02500170ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//心臓の鼓動「ドクン」
	CreateSE("SE01","SE_じん体_心臓_鼓動");
	SetVolume("SE02", 0, 0, NULL);

	SetVolume360("CH11", 0, 0, NULL);
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
ちょっと、

待て――

今、僕の視界に、気になるものが、映ったような――

僕が今、見ているもの――

ゲロカエルん。
女子高生の間で流行っているっていうキャラクター。

前にも、どこかでこれを――
どこで――？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("５");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

}

