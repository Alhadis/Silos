//<continuation number="240">

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_159_あやせ編_罪過に契約のチョコを";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_159_あやせ編_罪過に契約のチョコを();
}


function cha_159_あやせ編_罪過に契約のチョコを()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();



//★あやせ編
//ＢＧ//あやせの病室・夕方

	Wait(1000);

	CreateSE("SE01","SE_日常_びょういんどあ_開く");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(800);

	CreateTexture360("back", 100, 0, 0, "cg/bg/bg102_02_2_あやせの病室_a.jpg");
	DrawTransition("back*", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);


//◆ここでのアカペラ歌は「罪過～」です。新曲ではないです
//以下、「ch01_009_インターミッション０２」よりコピペ

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
病室に戻ると――

{	Wait(300);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/00900010ay">
「杭を打て　杭を打て――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/00900020ay">
「闇夜を切り裂き　月光を浴びて――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/00900030ay">
「幾千もの鉄槌は　汝の痛みとなりて　今解き放たれる――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/00900040ay">
「やがて叫びは宙に舞い　夜空は紅く染まるだろう――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE3601","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE3601",2000,500,0,1000,null,true);


//以下、「ch01_009_インターミッション０２」よりコピペ

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
あやせがベッドに腰かけて、病院食を食べていた。
いや、食べていたんだろうか？

つまらなさそうな顔をして歌を口ずさみながら、おかずの高野豆腐を箸でつついているだけにも見える。

その歌は、ニュージェネ第３の事件『張り付け』を予言したとされる、ファンタズムの歌だった。

『罪過に契約の血を』

アルバムを買ったから、僕もその歌のことは知ってる。

今のあやせは、杭じゃなくて箸を高野豆腐に打ってる（刺してる）わけだが。

僕の姿を見ると、あやせはホッとしたように、かすかな笑みを浮かべた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_制服_通常","shy", 250, @-50);
	FadeStand("stあやせ_制服_通常_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800010ay">
「戻ってこないかと思ったわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800020ay">
「どこへ行っていたの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00800030ta">
「ちょ、ちょっと、し、調べ物を……ロビーの、ＰＣで」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stあやせ_制服_通常_shy", 500, true);
	Stand("buあやせ_制服_通常","normal", 250, @-50);
	FadeStand("buあやせ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800040ay">
「今日は、ここに泊まって」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800050ay">
「一緒にいて」

{	BGMPlay360("CH11",0,1000,true);}
ちょ、マジで！？
あやせのいきなりの大胆発言に、僕はたじろいでしまう。
いつの間にフラグが立ったんだ？

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800060ay">
「お腹、空いていない？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800070ay">
「食べてもいいわよ」

そう言うと、あやせは高野豆腐を箸でつまんで、僕の方に差し出してきた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00800080ta">
「そ、それって、あやせが、た、食べたくないだけじゃ……」

{	Stand("buあやせ_制服_通常","smile", 250, @-50);
	FadeStand("buあやせ_制服_通常_smile", 300, true);
	DeleteStand("buあやせ_制服_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800090ay">
「……そうよ」

少し唇をつぼめて微笑んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_通常","hard", 250, @-50);
	FadeStand("buあやせ_制服_通常_hard", 300, true);
	DeleteStand("buあやせ_制服_通常_smile", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800100ay">
「まずいの、病院食は。不浄な邪心に染まっているのね、きっと」

//◆わざと「ちゃうんか」です
なんでもかんでも邪心邪心って言えばいいと思ってないか？
というか、あやせは邪心って言いたいだけちゃうんかと。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00800110ta">
「じゃ、邪心に染まってるのに、僕は、食べても、いいの？」

{	Stand("buあやせ_制服_通常","normal", 250, @-50);
	FadeStand("buあやせ_制服_通常_normal", 300, true);
	DeleteStand("buあやせ_制服_通常_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800120ay">
「普段から邪心まみれでしょう、拓巳は」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800130ay">
「コンビニのお弁当やカップ麺は、不浄なる食べ物の最たる例よ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800140ay">
「黒騎士として覚醒するためには、摂取をやめるべきだわ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00800150ta">
「あ、あやせは、普段は、なにを食べてるの……？」

{	Stand("buあやせ_制服_通常","shy", 250, @-50);
	FadeStand("buあやせ_制服_通常_shy", 300, true);
	DeleteStand("buあやせ_制服_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800160ay">
「チョコレート」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00800170ta">
「チョ、チョコレートって……。じゅうぶん、邪心に染まってそうな気がするけど……」

しかもチョコレートしか食べてないってこと？
とんでもない偏食じゃないか。僕よりひどいぞ。

{	Stand("buあやせ_制服_自分抱きしめ","ero", 250, @-50);
	DeleteStand("buあやせ_制服_通常_shy", 300, false);
	FadeStand("buあやせ_制服_自分抱きしめ_ero", 300, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800180ay">
「チョコレートはいいわ。邪心を打ち払う力を持つのよ、あの甘さは」

ウソをつけ。
スイーツは別腹って言ってるのと変わらないじゃないか。

{	Stand("buあやせ_制服_通常","normal", 250, @-50);
	DeleteStand("buあやせ_制服_自分抱きしめ_ero", 300, false);
	FadeStand("buあやせ_制服_通常_normal", 300, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800190ay">
「というわけで、拓巳。さあ……」

あやせは高野豆腐をさらに僕の方へ差し出してきた。
そんなに食べたくないのか……。僕も、高野豆腐はそれほど好きじゃないんだよなあ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00800200ta">
「い、いらない……」

{	Stand("buあやせ_制服_通常","hard", 250, @-50);
	FadeStand("buあやせ_制服_通常_hard", 300, true);
	DeleteStand("buあやせ_制服_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800210ay">
「それは許されないわ」

{	DeleteStand("buあやせ_制服_通常_hard", 500, true);}
なんでだよ！　こんなのズルいぞ！

女子からの“はい、ア～ンして♪”というシチュエーションは男の夢のはずなのに、どうしてこんなにもときめかないんだろう。

あやせの残飯処理だからか。
それともあやせが三次元だからか。

僕が食べるまであきらめてくれそうにないので、やむなく高野豆腐を口に入れた。噛むと、出汁が口の中に広がる。

{	Stand("buあやせ_制服_通常","smile", 250, @-50);
	FadeStand("buあやせ_制服_通常_smile", 300, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800220ay">
「よく頑張ったわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800230ay">
「これで一歩、黒騎士に近づいたわよ、拓巳」

とてもそうは思えなかった。

{	Stand("buあやせ_制服_通常","normal", 250, @-50);
	FadeStand("buあやせ_制服_通常_normal", 300, true);
	DeleteStand("buあやせ_制服_通常_smile", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00800240ay">
「次はこのきんぴらごぼうを――」

もうやだこのあやせ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※↑日本語変ですが仕様です……

//～～Ｆ・Ｏ
	SetVolume360("@CH*", 2000, 0, null);

	ClearAll(2000);
	Wait(1000);
}
