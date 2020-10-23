//<continuation number="1230">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_195_妄想トリガー４４■";
		$GameContiune = 1;
		Reset();
	}

		ch09_195_妄想トリガー４４■();
}


function ch09_195_妄想トリガー４４■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateBG(100, 0, 0, 0, "cg/bg/bg085_04_3_スクランブル交差点_a.jpg");
	CreateSE("SE02","SE_はいけい_すくらんぶる交差点ガヤ_どよめき_LOOP");
	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん2_LOOP");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE02", 0, 1000, 0, 1000, null, true);
	MusicStart("SE03", 0, 500, 0, 1000, null, true);

//☆☆☆
//妄想トリガー
//ポジティブ妄想→分岐１３
//ネガティブ妄想→分岐１４
//妄想しない→分岐１５

if($妄想トリガー通過４４ == 0)
{
	SetChoice03("ポジティブ妄想","ネガティブ妄想","妄想しない");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA03();
			$妄想トリガー４４ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー４４ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー４４ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー４４ == 2)
{
//☆☆☆
//分岐１３

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
みんなが、僕に注目していた。

また前みたいに罵倒され、嘲笑され、屈辱感に晒されるんだって、身構えてしまう。

あのときのトラウマで、足がすくむ。

でも――

//【祭参加者１】
<voice name="祭参加者１" class="祭参加者１" src="voice/ch09/19500010m1">
「頑張れ」

//【祭参加者２】
<voice name="祭参加者２" class="祭参加者２" src="voice/ch09/19500020m2">
「応援してるね」

//【祭参加者３】
<voice name="祭参加者３" class="祭参加者３" src="voice/ch09/19500030m3">
「頑張って、西條くん」

//【祭参加者４】
<voice name="祭参加者４" class="祭参加者４" src="voice/ch09/19500040m4">
「華々しく散ってこい」

//【祭参加者５】
<voice name="祭参加者５" class="祭参加者５" src="voice/ch09/19500050m5">
「若いのに、勇気があるわね」

//【祭参加者６】
<voice name="祭参加者６" class="祭参加者６" src="voice/ch09/19500060m6">
「お前のこと忘れないからな」

//【祭参加者７】
<voice name="祭参加者７" class="祭参加者７" src="voice/ch09/19500070m7">
「最後まで見守っててやるぞ」

//◆漢＝おとこ
//【祭参加者８】
<voice name="祭参加者８" class="祭参加者８" src="voice/ch09/19500080m8">
「漢を見せてくれ」

あのときとは、野次馬連中の反応がまるで違う。
みんな、優しい言葉や励ましの言葉をかけてくる。

だから僕は、狐につままれたような気分になって、何度も目を瞬かせた。

僕を、応援してくれてるの……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);

	Stand("bu星来_覚醒後_通常","happy", 200, @0);
	FadeStand("bu星来_覚醒後_通常_happy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19500090se">
「そのための祭りだもん」

{	Stand("bu星来_覚醒後_通常","normal", 200, @0);
	FadeStand("bu星来_覚醒後_通常_normal", 500, true);
	DeleteStand("bu星来_覚醒後_通常_happy", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19500100se">
「みんなさ、タッキーを待っててくれたんだよ」

目の前に、人垣によって作られた通路。
手でアーチまで作って、僕が通るのを待っている。
まるで小学校の卒業式みたいだ。

{	DeleteStand("bu星来_覚醒後_通常_normal", 500, true);}
その先は、Ｏ－ＦＲＯＮＴの入り口へと繋がっている。
僕はおずおずとその道を進み出す。

なおも温かい言葉がたくさん投げかけられてくる。

{	SetVolume("SE02", 500, 0, NULL);
	SetVolume("SE03", 500, 0, NULL);
	Fade("back04", 500, 1000, null, true);}
さらに、Ｏ－ＦＲＯＮＴの中へと足を踏み入れると、ＴＡＴＳＵＹＡとスタバァの店員までが僕を拍手で出迎えた。

だんだん勇気が出てきた。
死ぬことへの、勇気が。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//Ｏ－ＦＲＯＮＴ屋上
//ＳＥ//ガチャ、ヒュ～（屋上の扉を開け、強い風）

	CreateSE("SE01","SE_日常_おーふろんと屋上扉開ける");
	MusicStart("SE01", 0, 700, 0, 1000, null, false);

	CreateSE("SE02","SE_自然_風音_強_LOOP");
	MusicStart("SE02", 0, 700, 0, 1000, null, true);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg089_01_3_Ｏ－ＦＲＯＮＴ屋上_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg089_01_3_Ｏ－ＦＲＯＮＴ屋上_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
Ｏ－ＦＲＯＮＴの屋上は、相変わらず薄暗かった。
ゴクリと息を呑む。

前にここに来たときの苦い経験がよみがえり、先に進むことを一瞬躊躇する。

せっかく勇気が出てきたのに。
どこまでも自分がヘタレであることを自覚する。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500110jn">
「きっと戻ってくると信じてたよ」

//ＳＥ//車椅子の軋む音「キィ……」
{	CreateSE("SE01","SE_日常_車椅す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
車椅子の、車輪が軋む音。

それとともに、前と同じように『将軍』が姿を見せた。今日もダーススパイダーのヘルメットをかぶっている。

しかも、この場にいたのは『将軍』だけじゃなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","normal", 200, @0);
	FadeStand("buセナ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆誉めている
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch09/19500120sn">
「よくもう一度挑戦する気になったな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buセナ_制服_通常_normal", 500, true);
	Stand("bu梢_制服_通常","smile", 180, @0);
	FadeStand("bu梢_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch09/19500130ko">
「拓巳しゃん、すごーいすごーいの！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梢_制服_通常_smile", 500, true);
	Stand("bu優愛_制服_通常","smile", 180, @0);
	FadeStand("bu優愛_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/19500140yu">
「西條くんのおかげで、わたしも、勇気を、もらいました」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常_smile", 500, true);
	Stand("buあやせ_制服_通常","smile", 180, @0);
	FadeStand("buあやせ_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch09/19500150ay">
「キミはとても崇高だわ、拓巳」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buあやせ_制服_通常_smile", 500, true);
	Stand("stセナ_制服_通常","normal", 190, @+300);
	Stand("st梢_制服_通常","smile", 200, @+100);
	Stand("st優愛_制服_通常","smile", 180, @-100);
	Stand("stあやせ_制服_通常","smile", 190, @-310);
	FadeStand("stセナ_制服_通常_normal", 500, false);
	FadeStand("st梢_制服_通常_smile", 500, false);
	FadeStand("st優愛_制服_通常_smile", 500, false);
	FadeStand("stあやせ_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604003]
//※梨深と七海はいません
セナや、こずぴぃや、優愛、それにあやせ。
みんなが一列に並んで、僕に微笑みかけている。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch09/19500160ay">
「一緒に飛ぶわ、私たち、あなたと」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch09/19500170ko">
「だからーね、怖くないよ♪」

{	DeleteStand("stセナ_制服_通常_normal", 500, false);
	DeleteStand("st梢_制服_通常_smile", 500, false);
	DeleteStand("st優愛_制服_通常_smile", 500, false);
	DeleteStand("stあやせ_制服_通常_smile", 500, true);}
こずぴぃとあやせが、それぞれ左右の手を握りしめてきた。
２人だけじゃない。セナも、優愛も一緒だ。５人で手を繋いで。

これは『集団ダイブ』の再現？

{	CreateSE("SE01","SE_じん体_拍手_複数");
	MusicStart("SE01", 0, 400, 0, 1000, null, true);}
下で固唾を呑んで見守っていた群衆が、一斉に拍手した。僕らを祝福するかのように。僕らを称えるように。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500180jn">
「さようなら。君のことは、忘れないよ」

将軍が、その細い手を振った。
こずぴぃとあやせが、僕を引っ張ってくる。

戯れるように。踊るように。
優しい笑みを浮かべながら。

だから僕は、恐怖なんてこれっぽっちも感じることはなくて。

すごくすんなりと、その身を空中へと踊らせることができた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);
	SetVolume("SE02", 500, 0, NULL);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	DelusionOut();

	Delete("*");

//ＢＧ//スクランブル交差点//夜
	CreateBG(100, 0, 0, 0, "cg/bg/bg085_04_3_スクランブル交差点_a.jpg");

	DelusionOut2();
	PositiveHuman();

	CreateSE("SE02","SE_はいけい_すくらんぶる交差点ガヤ_ぴりぴり_LOOP");
	MusicStart("SE02", 500, 500, 0, 1000, null, true);

	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん2_LOOP");
	MusicStart("SE03", 500, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
僕は思う。
そんな風に、気持ちよく死ねたら、どんなによかっただろう。

でも、そんなものは所詮、妄想だった。

人垣によって作られた通路は、確かに僕を導くように目の前に口を開けていた。
でも、誰も手でアーチなんて作ってない。

みんな、僕を見ている。でもその目は冷たく、鋭く。投げかけられるのは殺気に近い感情。

誰もが、殺伐としている。
誰も僕なんて待っていなかった。
僕を祝福なんてしなかった。

前に僕がＯ－ＦＲＯＮＴで醜態をさらしたときの、あのノリは、今日はまったく見られない。

気持ちよく死ぬことは、許されないらしい。
どうせ、そんなことだろうと思ったよ。
でも、いいんだ。

殺してくれるなら、それで。
僕は嗤って、その人垣の通路を進み始めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流５へ
}


//=============================================================================//

if($妄想トリガー４４ == 1)
{
//☆☆☆
//分岐１４

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
みんなが、僕に注目していた。

また前みたいに罵倒され、嘲笑され、屈辱感に晒されるんだって、身構えてしまう。

あのときのトラウマで、足がすくむ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//人とぶつかる
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	Wait(700);
	CreateColor("色１", 300, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
そんな僕の背中に、誰かがぶつかってきた。
体当たり、と言う方が正しいかもしれない。

不意を突かれた僕は、前のめりに体勢を崩し、倒れそうになるのをなんとか踏みとどまる。

振り返ると、２０代のサラリーマンらしき男だった。見たこともない顔だ。

//◆２０代男
//【祭参加者１】
<voice name="祭参加者１" class="祭参加者１" src="voice/ch09/19500190m1">
「おー、すげー。こんな感触なんだ」

自らの両手を見つめ、意味不明なことをつぶやいている。
嫌がらせかな、と思っていたら、急に腰のあたりに熱を感じた。

そして、異物感。
なにかが、腰のあたりに引っかかっているような。

{	Fade("色１", 100, 1000, null, true);
	FadeDelete("色１", 100, true);}
うずき出す。
痛み。
焼けるような。

顔をしかめながら、自分の腰を確かめてみる。

するとそこに、ナイフの柄のようなものが、突き出ていた。

違う、突き出ているんじゃない。
ナイフが、刺さっているんだ。

//◆苦痛
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500200ta">
「う……ぐ……っ」

痛みが鋭くなる。
それに、いつの間にか自分のズボンが濡れていた。
それが自分の血によるものだと気付いて、愕然となった。

//◆２０代女
//【祭参加者２】
<voice name="祭参加者２" class="祭参加者２" src="voice/ch09/19500210m2">
「次、私ねー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500220ta">
「え？」

正面から、女――女子大生風のオシャレな若い女が、
包丁を手に笑顔で駆け寄ってきた。避ける暇もなくて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで刺される
/*森島ＳＥダミー*/
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
/*森島ＥＦダミー*/
	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
その女の持つ包丁が、僕の腹に深々と突き刺さる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500230ta">
「あ……あ……」

//【祭参加者２】
<voice name="祭参加者２" class="祭参加者２" src="voice/ch09/19500240m2">
「きゃー、すっごーい、私、刺しちゃった♪」

女ははしゃいだ様子で、すぐに僕から離れていく。

気付けば、たくさんの群衆に僕は取り囲まれていた。

学生も、会社員も、若い男も中年の女も、誰も彼も、手にナイフや包丁を握りしめて、ニヤニヤしながら僕を見つめている。

４つの街頭ビジョン。そこに、派手なキャプションが躍っていた。

{#TIPS_オフ会 = true;$TIPS_on_オフ会 = true;}
“みんなで偽エスパー西條拓巳を刺し殺そう<FONT incolor="#88abda" outcolor="BLACK">オフ会</FONT>　開催中！”

{$TIPS_on_オフ会 = false;}
僕の前に、順番待ちの行列ができている。
整然と、みんな並び始める。

僕を、刺す、順番待ち――

//【祭参加者３】
<voice name="祭参加者３" class="祭参加者３" src="voice/ch09/19500250m3">
「えいっ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで刺される
/*森島ＳＥダミー*/
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
今度は太ったガングロ女子高生。
僕の脇腹にナイフを突き刺した。

僕はあまりの事態に思考が付いていかず、痛みさえも感じる余裕はなく、立っているのが精一杯。

//【祭参加者３】
<voice name="祭参加者３" class="祭参加者３" src="voice/ch09/19500260m3">
「げえっ！　手に血が付いたぁ！　マジ最悪なんだけどっ」

そのガングロ女子高生を押しのけるように、初老のサラリーマンのおっさんが包丁をきつく握って迫ってくる。

//◆５０代男
//【祭参加者４】
<voice name="祭参加者４" class="祭参加者４" src="voice/ch09/19500270m4">
「ストレス解消だ、おらっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで刺される
/*森島ＳＥダミー*/
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
そのおっさんは、一度刺した包丁を抜いて、さらにもう一度、刺し直した。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500280ta">
「ぐ、あ……」

//【祭参加者４】
<voice name="祭参加者４" class="祭参加者４" src="voice/ch09/19500290m4">
「はは、こりゃいい」

すでに、背中に１本。腹に３本。
間抜けな形で、刃物が僕の身体から突き出ている。

でもまだ終わらない。
“刺し待ち”の行列は、どんどん数が増えている。
みんな目を血走らせて、いまかいまかと僕を刺す機会を待っている。

僕は痛みが限界に達して、倒れそうになる。
ところが、最初に刺した男が、背後から僕を羽交い締めにした。

//【祭参加者１】
<voice name="祭参加者１" class="祭参加者１" src="voice/ch09/19500300m1">
「みんな並んで待ってるんだから、倒れちゃダメだろ」

そう言われた。直後に、またも背中に激痛。
硬く冷たい刃が、僕の皮膚を、肉を抉ってくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500310ta">
「うぐっ……やめ……」

やめろ、と言おうとして、必死で口をつぐんだ。
これはある意味で僕が望んでいたことじゃないのか。

殺してもらいたかったんでしょ。
それならこの展開は、願ったりかなったりじゃないか。
だから、やめろなんて言うな……。

僕は男に身体を支えられ、倒れることもできず、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで刺される
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
刺される。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで刺される
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
胸を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで刺される
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
腹を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで刺される
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, 500, 1000, null, false);

	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
背中を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで刺される
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, -500, 1000, null, false);

	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
腕を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで刺される
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, 300, 1000, null, false);

	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
太股を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで刺される
	CreateSE("SE04","SE_衝撃_せ中を押される");
	MusicStart("SE04", 0, 1000, 1000, 1000, null, false);

	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 200, 800, null, true);
	FadeDelete("色１", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
爪先を。

//◆苦痛の絶叫
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500320ta">
「あああああ、ぎゃあああああ――！」

いつの間にか、絶叫していた。

死にたかったから、無様に泣き叫ぶのは自重しようと思ったのに。

それに耐えられないぐらい、痛い。

身体に刺さっている刃物は、今いったい何本ぐらいなのか。

すぐには数えられないぐらいの数。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500330ta">
「あああ、ああああああ――！」

これだけ刺されて、痛みでもう身体をあまり動かすこともできないのに、感覚も、意識も、ちっとも麻痺してくれなくて。むしろ、やたらとクリアになっていて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500340ta">
「いいいい、ぎぎぎいいいいい――！」

いったい何度刺されればいいんだ。
早く、死にたい……。

こんなに痛いのに、どうして僕はちっとも死ねないんだよ……。

//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19500350se">
「そんなの、決まってるっしょ」

星来の声が、頭の中に響いた。

//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19500360se">
「妄想だからだよ♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	DelusionOut();

	Delete("*");

//ＢＧ//スクランブル交差点//夜
	CreateBG(100, 0, 0, 0, "cg/bg/bg085_04_3_スクランブル交差点_a.jpg");

	DelusionOut2();
	NegativeHuman();

	CreateSE("SE02","SE_はいけい_すくらんぶる交差点ガヤ_ぴりぴり_LOOP");
	MusicStart("SE02", 500, 500, 0, 1000, null, true);

	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん2_LOOP");
	MusicStart("SE03", 500, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
ため息をつきつつ、目を開ける。
痛みも、異物感も消えていた。

僕の前には、何十人もの行列の代わりに、人垣によって作られた通路ができていた。
僕を招き入れようとする、一筋の道。

さっきの妄想が現実になるといいな、って思った。
ただし、３回くらい刺されたところで死ねるなら、っていう条件付きだ。

あんな拷問みたいなのは嫌だ……。

僕はぼんやりとした頭の中でそう考えながら、人垣の通路へと足を踏み出した。

周囲の野次馬どもも、マスコミたちも、やけにピリピリした雰囲気を発している。

ざわついてはいるけど、お祭り騒ぎじゃない。

前に僕がＯ－ＦＲＯＮＴで醜態をさらしたときの、あのノリは、今日はまったく見られない。

みんな、僕を見ている。その目は冷たく、鋭く。投げかけられるのは殺気に近い感情。

僕の期待はいやでも高まる。

殺して……。<k>
殺して。<k>
コロシテ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流５へ
}


//=============================================================================//

if($妄想トリガー４４ == 0)
{
//☆☆☆
//分岐１５
//フラグ【９章エンドフラグ②】ＯＮ
	$９章エンドフラグ② = true;


//	CreateSE("SE02","SE_はいけい_すくらんぶる交差点ガヤ_ぴりぴり_LOOP");
//	MusicStart("SE02", 500, 1000, 0, 1000, null, true);
//	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん2_LOOP");
//	MusicStart("SE03", 500, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
と、すぐ前にあった人の壁が、聖書におけるモーゼの海割りのごとく、さあっと開いていった。

僕を招き入れようとする、一筋の道。

彼らが待っていたのは……僕だ。

{#TIPS_オフ会 = true;$TIPS_on_オフ会 = true;}
“第１回チキチキ　いまや日本一恥ずかしい男、自称エスパー西條拓巳を集団でリンチ死させて、渋谷の中心で『その目だれの目？』を叫ぶ<FONT incolor="#88abda" outcolor="BLACK">オフ会</FONT>”

{$TIPS_on_オフ会 = false;
//おがみ：実績：その目
	Eyes();
}
ふと頭の中にそんな長ったらしいタイトルが浮かんで、
僕は――

嗤った。

//◆狂気の笑み
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500370ta">
「ふひ……ふひひ……」

痛いのは、イヤだったけど。
死ねるなら、それくらい我慢してやんよ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500380ta">
「僕が死ぬには……ぴったりの、ま、祭り、じゃないか。ふひひ……」

リベンジっていう星来たんの言葉の意味を把握した。あのとき、死ねなかったから、僕なんかのためにまた舞台を用意してくれたんだ。

僕は口の端にだらしない笑みを浮かべて、人の壁でできた道を進み始めた。

行き着く先には、カメラとマイクをバカみたいに横並びで構えた、マスコミの姿があった。

周囲の野次馬どもも、マスコミたちも、やけにピリピリした雰囲気を発している。

ざわついてはいるけど、お祭り騒ぎじゃない。

前に僕がＯ－ＦＲＯＮＴで醜態をさらしたときの、あのノリは、今日はまったく見られない。

みんな、僕を見ている。その目は冷たく、鋭く。投げかけられるのは殺気に近い感情。

僕の期待はいやでも高まる。

殺して……。<k>
殺して。<k>
コロシテ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流５へ
}


//=============================================================================//

//☆☆☆
//合流５

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
見上げれば、巨大な４つの街頭ビジョンすべてが、人ごみの中を歩く僕の姿を捉えていた。

きっとこれも、全国中継されているんだろう。
視聴率が４０％なら、約４８００万人に見守られて、僕は死ぬ。

たかが妄想の存在である、この僕の死を。
なんの価値もない、この僕の死を。

お前たちは見たいのか。
なんておめでたいんだ。

でも、別に構わない。
僕を殺してくれるなら、どれだけでも見ちゃいなよ。

カメラとマイクの砲列の前に立つ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateColor("back03", 100, 0, 0, 1280, 720, "White");
	DrawTransition("back03", 500, 500, 1000, 100, null, "cg/data/爆発.png", false);
	CreateBG(100, 300, 0, 0, "cg/bg/bg164_01_3_スポットライト_a.jpg");
	CreateSE("SE10","SE_擬音_ふらっしゅ_大量");

	SetVolume("SE02", 1000, 0, NULL);
	SetVolume("SE03", 1000, 0, NULL);

	MusicStart("SE10", 0, 500, 0, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601019]
一斉にフラッシュがたかれた。

まばゆい光が明滅する。

僕は眼を細めて、そのまぶしさに耐えた。

テレビのワイドショーで見たことのある、初老のレポーターが口火を切った。

//【芸能レポーターＡ】
<voice name="芸能レポーターＡ" class="芸能レポーターＡ" src="voice/ch09/19500390ga">
「西條くん。今回はどんなパフォーマンスを見せてくれるんだい？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500400ta">
「…………」

//【芸能レポーターＡ】
<voice name="芸能レポーターＡ" class="芸能レポーターＡ" src="voice/ch09/19500410ga">
「ところで、実は今日の昼に逮捕された『張り付け』事件の容疑者は、実行犯に過ぎなくて、黒幕がいるっていう話があるんだけど、どう思うかな？」

このおっさんはなんでこんなに馴れ馴れしいんだろう。

それに“どう思うかな？”ってどういう意味だ？
僕に意見を求めてるのか？

まあ、犯罪心理学の教授のよくあるコメントなんて、いつもテンプレ通りの面白みもへったくれもないものばかりだから、僕みたいな素人でも代わりはできそうだけど。

とは言え、今の僕にはそんなことどうでもよかった。

ニュージェネへの興味なんて失っていた。
僕がここに来たのは、殺してもらうためであって、マスコミの質問に答えるためじゃない。答える気力もない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602019]
//【芸能レポーターＡ】
<voice name="芸能レポーターＡ" class="芸能レポーターＡ" src="voice/ch09/19500420ga">
「それでね、西條くん。ズバリ聞くけど」

//【芸能レポーターＡ】
<voice name="芸能レポーターＡ" class="芸能レポーターＡ" src="voice/ch09/19500430ga">
「真犯人と目される人物は、通称『その目だれの目？』と言われていて」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500440ta">
「…………」

//【芸能レポーターＡ】
<voice name="芸能レポーターＡ" class="芸能レポーターＡ" src="voice/ch09/19500450ga">
「それは、君なんじゃないかっていう噂があるんだよね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500460ta">
「そう……かもね……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);

//ＳＥ//野次馬たちのどよめき
	CreateSE("SE01","SE_はいけい_すくらんぶる交差点ガヤ_どよめき_LOOP");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
僕のつぶやきは街頭ビジョンのスピーカーを通して、渋谷じゅうに発信された。
どよめきがわき起こる。

この場に集まった人たちの動揺が、空気をますます殺伐としたものへと加速させていく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500470ta">
「どうでも、いい……」

早く殺して……。
早く楽になりたいんだ。
ウザいことをやらせないでよ。

そう願うのに。何本ものマイクが、さらに僕に迫ってくる。口許に押しつけられそうな勢い。

他のレポーターどもも堰を切ったように僕に質問をぶつけてくる。

//【芸能レポーターＢ】
<voice name="芸能レポーターＢ" class="芸能レポーターＢ" src="voice/ch09/19500480gb">
「それは事件への関与を認める発言と考えていいんですか？」

//【芸能レポーターＣ】
<voice name="芸能レポーターＣ" class="芸能レポーターＣ" src="voice/ch09/19500490gc">
「現実とゲームとの区別ができなくなるような経験はありますかぁ？」

//【芸能レポーターＢ】
<voice name="芸能レポーターＢ" class="芸能レポーターＢ" src="voice/ch09/19500500gb">
「逮捕された小前田容疑者との関係について聞かせてください！」

//【芸能レポーターＣ】
<voice name="芸能レポーターＣ" class="芸能レポーターＣ" src="voice/ch09/19500510gc">
「人を殺したのはやはりゲーム感覚だったりします？」

ある意味で僕はゲームキャラみたいなものだよ。
誰か僕をリセットして。
さっさとゲームオーバーにさせて……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500520ta">
「早く、殺してよ……」

{	SetVolume("SE10", 500, 0, NULL);}
僕のその言葉に。
緊張感が頂点に達していた群衆が、弾けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE10","SE_はいけい_すくらんぶる交差点ガヤ興奮_LOOP");
	MusicStart("SE10", 1000, 1000, 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601020]
//【祭参加者１】
<voice name="祭参加者１" class="祭参加者１" src="voice/ch09/19500530m1">
「死ね！」

//【祭参加者２】
<voice name="祭参加者２" class="祭参加者２" src="voice/ch09/19500540m2">
「人でなし！」

//【祭参加者３】
<voice name="祭参加者３" class="祭参加者３" src="voice/ch09/19500550m3">
「鬼畜！」

//【祭参加者４】
<voice name="祭参加者４" class="祭参加者４" src="voice/ch09/19500560m4">
「殺してやるよ！」

//【祭参加者５】
<voice name="祭参加者５" class="祭参加者５" src="voice/ch09/19500570m5">
「地獄に堕ちろ！」

//【祭参加者６】
<voice name="祭参加者６" class="祭参加者６" src="voice/ch09/19500580m6">
「死刑にしろ！」

//【祭参加者７】
<voice name="祭参加者７" class="祭参加者７" src="voice/ch09/19500590m7">
「ブチ殺せ！」

//【祭参加者８】
<voice name="祭参加者８" class="祭参加者８" src="voice/ch09/19500600m8">
「殺人鬼！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1500, 0, NULL);
	SetVolume("SE10", 1500, 0, NULL);

	CreateSE("SE11","SE_はいけい_すくらんぶる交差点ガヤ_ぼう動_LOOP");
	MusicStart("SE11", 500, 1000, 0, 1000, null, true);

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
人の波が、殺到する。
うねりに呑み込まれ。
怒号と悲鳴が交錯し。

僕も押し潰され、もみくちゃにされる。

四方から人に押され、身体が浮いてしまう。
足の裏が地面から離れ。

もがいても、どうすることもできない。
頭を叩かれ、腕を殴られ。

でも死ぬほどの痛みじゃなくて。
窒息しそうなほどの息苦しさにも、僕は抵抗せず。

この混乱状態に身を任せる。
すると圧迫感がふと消えた。
その場に倒れ込む。

星来たんが、僕の手からこぼれ落ちる。
それはアスファルトの上を転がっていく。

いくつもの足が森の木々のように林立し、蠢いていて、その隙間を僕の嫁が転がっていく。
必死に手を伸ばしても、届かない。

まぶしいほどの笑みを浮かべていた顔面が、
僕を癒してくれた笑顔が、
誰かの革靴に踏まれてしまう。

//【星来】
<voice name="星来" class="星来" src="voice/ch09/19500610se">
「タッキー！　痛いよぅ、助けて！　タッキー！」

さらにその小さな身体は蹴られて転がり、
女の赤いヒールによって、
胴体を、ぐしゃりと踏み潰された。

//◆「ぼ」＝「ぼけなす」と言おうとした
//【星来】
<voice name="星来" class="星来" src="voice/ch09/19500620se">
「タ……キー……ぼ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601021]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500630ta">
「星来……？」

呼びかけても、返事は返ってこない。

僕の唯一の味方も、いなくなった。

悲しさで、胸が潰れそうで。
この世界に生きる意味はこれで完全に消失した。

見上げれば。
夜空さえも、人の壁に囲まれ、僕の視界からは覆い隠されて。

誰も、僕がここにしゃがみ込んでいることに気付かない。

僕はここにいるのに。
殺してくれって言ってるのに。

どうしてみんな、僕を無視するんだ……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE*", 1000, 100, null);

	Wait(1200);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500640ta">
「あ……」

ふと。

うなじのあたりに、感じる。

チリチリとした――

“神の視線”の感覚。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	FadeDelete("色１", 300, true);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601022]
//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500650jn">
「君は――」

僕の頭の中に、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＣＧ管理用フラグ
	#bg165_03_3_OFRONT見上げ_a=true;

	SetVolume("SE*", 500, 0, null);
	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg165_03_3_O-FRONT見上げ_a.jpg");
	FadeDelete("色１", 200, true);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602022]
//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500660jn">
「ここで、死んじゃダメだ」

声が、響いた。

僕は息を呑み、

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500670jn">
「ディソードを、手に入れて」

奥歯をきつく噛みしめた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500680ta">
「……『将軍』……！」

林立する足の群れの中に、あの車椅子を探す。ダーススパイダーのコスプレ野郎を探す。

この“祭り”の主催者は、やっぱり、君なのか。
また悪趣味なコスプレをして、僕を脅すのか。
前と同じことを再現しようとしてるのか。

僕が望むのは、死だ。
生きたまま見せ物にされるのは、まっぴらだよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500690jn">
「あのときの、自称『将軍』は、僕じゃない」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500700jn">
「僕は、コスプレはしないよ」

それこそ、どうでもいい……。
いいから、早く、殺して……。

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500710jn">
「あいつらが、動き出しているんだ」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500720jn">
「この場は、今以上の混乱になるよ」

あいつら……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601023]
//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500730jn">
「すべての黒幕。この混乱を引き起こした者たち。混乱を利用して、利己を追求しようとする者たち」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500740jn">
「彼らを止められるのは……君だけなんだ」

身体を起こす。

怒声は相変わらず僕の頭上で渦巻いている。

誰も僕に見向きもせず。
野次馬も、マスコミも、入り乱れて。
つかみ合い、罵り合い、殴り合っていた。

なんで、この人たちは――

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500750jn">
「沈黙の兵器……」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500760jn">
「『ノアⅡ』はすでに稼働してる」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500770jn">
「この混乱が企図された一番の目的は――」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500780jn">
「無差別人体実験」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
//ＳＥ//石が頭に当たる
	CreateSE("SE10","SE_衝撃_顔面蹴られる");
	MusicStart("SE10", 0, 500, 0, 1000, null, false);

	Fade("back10", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500790ta">
「……っ」

頭に、なにか硬いものが当たった。

激痛が走る。頭蓋骨が割れたかと思うほどの痛み。たまらず頭を抱える。

涙目になりながら見ると、近くにこぶし大の石が転がっていた。血がわずかにこびりついている。

誰かが投げたあの石が、直撃したらしい。

ズキズキとした痛み。手をやると、ぬるりとしたものが指に触れた。
指先に、血がついていた。
僕の、血。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//遠くで連続して銃声
	CreateSE("SE10","SE_衝撃_じゅう声");
	MusicStart("SE10", 0, 500, 0, 1000, null, false);

	WaitAction("SE10", 200);

	CreateSE("SE11","SE_衝撃_じゅう声");
	MusicStart("SE11", 0, 500, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
//【祭参加者２】
<voice name="祭参加者２" class="祭参加者２" src="voice/ch09/19500800m2">
「きゃああああ！」

遠くで、乾いた炸裂音。
直後に女性の金切り声。

銃声……？
銃を持ってる人間が、この場所にいた……？

どうしてみんな、こんなに興奮してるんだ……。

どうしてみんな、まったく関係ない人たち同士で諍いを起こしてるんだ……。

どうして、こんなに混沌とした状態になっているんだ……。

みんなが待っていた、今日の“悪者”“生け贄”は、僕じゃないの？

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500810jn">
「渋谷のＧＥレート……バイオリズムが、あり得ないくらいに上昇してるんだよ」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500820jn">
「言ったでしょ？　無差別人体実験だって」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500830jn">
「この場にいる人たちは今、見えない“攻撃”を受けているんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//車椅子の軋む音
	CreateSE("SE10","SE_日常_車椅す");
	MusicStart("SE10", 0, 500, 0, 1000, null, true);

	CreateBG(100, 1000, 0, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
あの、音がした。
軋むような、
錆び付くような、

息も絶え絶えの、死にかけた女性の吐息のような、

車椅子の車輪の音。

これだけの人の数。
無秩序にうねっている人の壁。

にもかかわらず、車椅子に乗った『将軍』は、誰にもぶつかることなく、誰にも絡まれることなく、
僕のところへ、まっすぐに進んできた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

	SetVolume("SE10", 500, 0, null);

	Stand("st将軍_車椅子_通常","normal", 200, @0);
	FadeStand("st将軍_車椅子_通常_normal", 1000, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601026]
とても小さくて、ガリガリにやせ細った身体。
皺だらけで、触れれば折れてしまいそうなくらい弱々しい。

その瞳は、白濁していて。
なにを見ているのか、なにが見えているのか、分からない。

僕は彼から目を離せなくなる。
周囲の喧噪が、急速に遠ざかっていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE*", 1000, 0, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
//以下、将軍のセリフは普通のセリフ。ボイスエフェクト付きません
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500840jn">
「ずっと、君を見ていたよ」

初めて会ったときと同じ声音だった。
Ｏ－ＦＲＯＮＴのときのような、変な声じゃない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500850ta">
「君は、誰なの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500860jn">
「僕は、君だよ」

その一言で、僕は悟った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500870ta">
「僕を……妄想して……生み出したのも――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500880ta">
「“神の視線”の正体も――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500890ta">
「君、だったんだね……」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500900jn">
「うん」

こいつが、僕の生みの親。
僕を妄想した存在。
僕にとっては、どうしてもかなわない相手。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601027]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500910ta">
「君の、名前は……？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500920jn">
「……西條、拓巳」

本物の、僕。
僕の、オリジナル。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500930ta">
「君は……いくつ、なの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500940jn">
「君と同い年だよ。君の“設定”とね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500950ta">
「…………」

１７歳……。
こんな、小さくて、皺だらけなのに……。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500960jn">
「このままだと、世界が死んじゃう」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500970jn">
「ノアⅡに、あらゆる人の心は支配されちゃう」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19500980jn">
「だから、君に託したんだ」

託した……って、なにを……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19500990ta">
「意味が、分かんないよ……。そんなの……僕には……か、関係、ない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19501000ta">
「頼むよ……僕を、消して。今すぐに、消して……ほしい」

『将軍』の皺が、蠢動する。
表情を変えているらしいけど、ただ皺が動いているようにしか見えない。

//◆申し訳なさそう
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501010jn">
「全部、僕のせいなんだ」

//◆「Ｉｒ２」＝「あいあーるつー」
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501020jn">
「僕が『Ｉｒ２』を妄想しちゃったせいで」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	CreateSE("SE30","SE_衝撃_衝撃音01");
	MusicStart("SE30", 0, 600, 0, 1000, null, false);
	CreateTexture360("背景１", 400, 0, 0, "cg/bg/bg155_01_1_Ir2_a.jpg");
	Fade("色１", 500, 0, null, true);
	Wait(500);
	Fade("色１", 100, 1000, null, true);
	Delete("背景１");
	Fade("色１", 500, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601028]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501030jn">
「なんとか、止めようとしたけど……僕はこんな身体だから、満足に動くこともできない」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501040jn">
「それで、君を生み出した」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501050jn">
「君に、止めてもらうために」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19501060ta">
「そんなの、知らない……。
僕は、君のコピーだけど、僕は、やりたくない……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19501070ta">
「コピーだけが、苦しまなくちゃいけないなんて……そんなの、イヤだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19501080ta">
「死なせてよ……」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501090jn">
「君はコピーじゃない。もうひとりの、僕だ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19501100ta">
「つまり、コピーじゃないか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19501110ta">
「君のしてることは、すごく、残酷だ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602028]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501120jn">
「悪かったって、思ってるよ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501130jn">
「でも、他に方法はなかった」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501140jn">
「今、世界の命運は、君にかかっていると言っても過言じゃないんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501150jn">
「だから――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19501160ta">
「そんなの……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19501170ta">
「そんなの、梨深に、頼めばいいじゃないか……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19501180ta">
「知り合い、なんでしょ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
“知り合い”

意識的に、そう言ってしまった。
恋人かもしれないとか、仲がいいとか、そんなの考えたくなかった。

そして、自分の気持ちに、今さら気付いてしまった。

僕は、僕のオリジナルに、嫉妬してる。
妄想の存在のくせに。

なんて……醜怪で、見苦しいんだ。

身の程知らずもいいところだよ。

自分の感情に反吐が出る。

ますます鬱積した気分になった。

死にたい……。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501190jn">
「梨深は、七海を助けに行って……逆に、捕まっちゃったんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19501200ta">
「え……」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501210jn">
「梨深はね、僕を、救おうとしてくれていた」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501220jn">
「その理由は――」

//◆※拓巳と将軍は記憶を共有している
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19501230jn">
「君も“知っている”よね？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back10", 1000, 0, 0, 1280, 720, "White");
	Fade("back10", 0, 0, null, true);
	Fade("back10", 1000, 1000, null, true);
	DeleteStand("st将軍_車椅子_通常_normal", 0, true);
	Wait(1000);

//ホワイトアウト

}