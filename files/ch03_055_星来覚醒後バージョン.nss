//<continuation number="140">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_055_星来覚醒後バージョン";
		$GameContiune = 1;
		Reset();
	}

		ch03_055_星来覚醒後バージョン();
}


function ch03_055_星来覚醒後バージョン()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("背景１", 2000, 1000, null, true);

	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE02", 0, 500, 0, 1000, null, true);

	Wait(1000);

//ＣＧ//星来覚醒後バージョン
//上からも下からも、いろんな角度からなめまわすように。もちろんパンツも見える
//※以下の拓巳によるレビューは仮。絵に合わせて後日修正


//おがみ：修正部分を外へ　ここから
//【拓巳】
//<voice name="拓巳" class="拓巳" src="voice/ch03/05500010ta">
//「うは、四つん這いエロすぎ。後ろから見たらパンツ丸出しじゃんか。ふひひ、だがそれがいい」
//【拓巳】
//<voice name="拓巳" class="拓巳" src="voice/ch03/05500020ta">
//{#TIPS_ＧＪ = true;}「ふひひ。テラエロ顔。やっぱこの泣きそうっつーかイキそうにしか見えない顔がキジマヨシオのいいとこだよな。マジでキジマ<FONT incolor="#88abda" outcolor="BLACK">ＧＪ</FONT>」
//【拓巳】
//<voice name="拓巳" class="拓巳" src="voice/ch03/05500030ta">
//「半脱ぎイイ！　ヘタに隠してる方がエロいし！　この左手の位置とか、ヤバすぎ」
//おがみ：修正部分を外へ　ここまで

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//※※３６０以下
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn00/00200010ta">
「うは、覚醒バージョンのコス、エロすぎ。パンもろじゃんか。ふひひ、だがそれがいい」

//◆「ＧＪ」＝グッジョブ、と読んでください
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn00/00200020ta">
{#TIPS_ＧＪ = true;$TIPS_on_ＧＪ = true;}「ふひひ。顔かわいいよ顔、原作再現度はいまいちだけど、ぷんぷんと漂うエロスがキジマヨシオらしさだよな。これはこれで<FONT incolor="#88abda" outcolor="BLACK">ＧＪ</FONT>」

//※※３６０以上
{$TIPS_on_ＧＪ = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500040ta">
「上着キャストオフとか！　この角度からじゃほとんど全裸にしか見えん！　ひょーほぅ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500050ta">
「髪の動きがいいよなー。覚醒バージョンは髪が命って持論があるわけだが間違ってなかったな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500060ta">
「さーて、それではお待ちかね、パンツ行ってみようかー。
どれどれ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500070ta">
{#TIPS_高杉 = true;$TIPS_on_高杉 = true;}「ふむふむ、Ｖゾーンの作り込みいいよー。シワの付き方リアルだし……って、お、おおー、こ、これ……ス、スージーさん……？　すげっ、ふひひ、マジでスゲーッ！　クオリティ<FONT incolor="#88abda" outcolor="BLACK">高杉</FONT>！」

{$TIPS_on_高杉 = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500080ta">
「これ星来たん５作目にして早くも最高傑作爆誕じゃね？　これ以上すごいのなんて出せないってマジで。やっぱキジマは神！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//拓巳の部屋・ＰＣ付近（星来覚醒バージョンあり）

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	Fade("背景２", 1000, 1000, null, true);
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
新しい星来たんを慎重にＰＣモニタの横に立たせる。
ふひひ、星来エロいよ星来。

眺めているだけでニヤニヤ笑いが止まらない。まさに至福のとき。

さっそく星来たんフィギュアの感想を＠ちゃんのフィギュアスレに書き込んでみる。

それが終わったら、メールチェックやフレパラでフレンドの更新があるかどうか確認。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500090ta">
「おっと、マイフレ申請来てるじゃん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500100ta">
「誰これ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500110ta">
「星来コミュの人か」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500120ta">
「ハイハイ、ＯＫですよ」

さてそろそろエンスーを始めようかな、と思った矢先、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	CreateSE("SE01","SE_じん体_心臓_鼓動");
	SoundPlay("SE01", 0, 1000, false);
	Fade("色１", 0, 700, null, true);
	Fade("色１", 500, 0, null, true);
	Wait(500);
	SetVolume("SE02", 1000, 300, NULL);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
首筋にチリチリとした感覚を感じた。

いつもの、強烈な気配を放ってくる“視線”だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//――その目だれの目？
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "――その目だれの目？");

	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
くそ、ウザい……。

この“視線”を感じるようになったのはいつ頃だろう。
もうすっかり忘れちゃったよ。

いちいち僕を邪魔しやがって。僕の平穏な日常をかき乱す要素はたくさんあるけど、この“視線”は七海と双璧を為す鬱陶しさだ。

よし、またアレをやるか……。
“ちょっとやそっとじゃ振り向かないぞゲーム”。

僕はＰＣモニタを凝視したまま、マンガっぽいセリフを考えてみた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500130ta">
「キサマ……出てこい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05500140ta">
「僕の目をごまかせるとでも思ったか。甘いな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("１２");
	TypeBegin();//――――――――――――――――――――――――――――――
	
	EndTrigger();

}