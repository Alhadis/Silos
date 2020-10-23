//<continuation number="430">




chapter main
{

	$PreGameName = "boot_第五章";

	if($GameStart != 1)
	{
		$GameName = "ch05_102_あやせのヒント";
		$GameContiune = 1;
		Reset();
	}

		ch05_102_あやせのヒント();
}


function ch05_102_あやせのヒント()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//ＢＧ//黒
	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
学校に着くと、梨深を先に行かせてトイレに寄った。

これは僕の処世術の一環だ。

せっかく迎えに来てくれた梨深には悪いけど、“女子と一緒に登校する”なんて行動は目立ちすぎる。

特にクラスのＤＱＮ連中に見られたりしたら、どんな因縁を付けられるか分からない。

だからあくまでひとりで登校してきたのを装うために、トイレに寄って時間を稼いだんだ。

ところがこれが失敗だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//学校の喧噪
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 1000, 300, 0, 1000, null, true);

	CreateBG(100, 500, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
何食わぬ顔でトイレを出て、うつむいたまま廊下の端を歩いて教室へ向かう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//廊下

	Stand("stあやせ_制服_通常","normal", 200, @-150);
	FadeStand("stあやせ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
その途中で、あやせが向こうから歩いてくるのが見えた。

{	Stand("stあやせ_制服_通常","smile", 200, @-150);
	FadeStand("stあやせ_制服_通常_smile", 300, true);
	DeleteStand("stあやせ_制服_通常_normal", 0, true);}
僕と目が合うなり、あやせは唇を歪めるようにして薄い笑みを浮かべる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stあやせ_制服_通常_smile", 500, true);

	Wait(500);

	Stand("buあやせ_制服_通常","normal", 200, @0);
	FadeStand("buあやせ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//ＣＨ//あやせ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/10200010ay">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/10200020ta">
「…………」

あやせは有名人だ。

目立つから、校内では話しかけるのは自重しようかと思ったけど、あやせが僕の行く手を遮るようにして立ち止まったから、僕もそれにならうしかなかった。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/10200030ay">
「拓巳、あれから警察はどう？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/10200040ta">
「……っ」

悲鳴を上げそうになって、自分の口を手で覆った。

こ、こんな人がたくさんいる場で、なんでそんな危険な話題を振ってくるんだ！

慌てて周囲を見回す。
かなりまずい状況だった。

やっぱりあやせはみんなから注目の的だ。

そもそも学校に来ること自体珍しい上に、あの『ファンタズム』のボーカルで、しかも見ての通り中性的美人と来ている。

男子、女子問わずあやせには興味津々だろう。

そんな彼女が、僕みたいなキモオタと話してるなんて、本来だったらあり得ない。

周囲の視線が痛い。
逃げ出したい……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_通常","hard", 200, @0);
	FadeStand("buあやせ_制服_通常_hard", 300, true);
	DeleteStand("buあやせ_制服_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/10200050ay">
「剣を探して」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/10200060ay">
「キミはそうしなくちゃいけないのよ」

……いつもいつも、会う度に同じことを言ってくる。

あやせは僕の味方側にいるのかもしれないけど、こうもバカのひとつ覚えみたいに繰り返されるとうんざりしてくる。

僕だって手に入れたいさ。だけど、方法が分からないんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/10200070ta">
「ヒ、ヒントが、ほしい……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/10200080ta">
「き、君は、どうやって、あ、あれを、手に、入れた……？」

{	Stand("buあやせ_制服_通常","normal", 200, @0);
	FadeStand("buあやせ_制服_通常_normal", 300, true);
	DeleteStand("buあやせ_制服_通常_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/10200090ay">
「……いつの間にか、そこにあった」

またそれですか……！
やっぱりはぐらかされてるのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/10200100ay">
「気付かなかったわ、最初は」

{	Stand("buあやせ_制服_通常","hard", 200, @0);
	FadeStand("buあやせ_制服_通常_hard", 300, true);
	DeleteStand("buあやせ_制服_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/10200110ay">
「でもちょっとだけ見方を変えたら、分かった」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/10200120ay">
「もしかしたら、拓巳にももう見えているのかも」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch05/10200130ay">
「“見ていない”だけで」

訳が分からない……。

あやせとの会話はいつも疲れる。
禅問答もどきは勘弁してよ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/10200140ta">
「剣は……ちゃんと探してるよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/10200150ta">
「僕だって……絶対、て、手に、入れたいから……」

{	DeleteStand("buあやせ_制服_通常_hard", 500, true);}
それだけ答えてため息をつくと、周りから突き刺さる視線に耐えきれなくなり、僕はあやせの横をすり抜けて教室に入った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 500, NULL);

//ＢＧ//翠明学園教室
	CreateBG(100, 500, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
そこでまた、暗鬱な気分にさせられる。

三住くんをはじめとした何人かの男子が、僕を呆然と見つめていたんだ。

くそぅ、あやせと話しているのを目撃された……。

まずいぞ、なにを言われるか分からない。

冷やかされるだけならまだしも、“あやせと話して生意気だ”みたいな、どこかのガキ大将レベルの因縁を付けられでもしたらと思うと、ゾッとする。

僕は視線を落として、身をできるだけ縮こまらせながら、自分の席へと向かった。

頼むから、誰にも絡まれませんように……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st大輔_制服_通常","shock", 200, @+240);
	FadeStand("st大輔_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200160mi">
「おいおいおいっ」

僕の祈りは通じなかった。

//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200170mi">
「タク、てめーいつの間に！？　今、岸本と話してたよな！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/10200180ta">
「…………」

黙り込むしかない。
顔を上げられない。

//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200190mi">
「岸本が誰かとまともに会話してるとこ、初めて見たぜ！　いったいどんな手使ったんだよ！？」

頼むから、教室中に響き渡るような大声を出さないでよ。

僕のことはそっとしておいてくれ。

あやせに手を出すつもりなんてないんだ。

そもそもそんな甲斐性は僕にはないんだから。

だからそんなに騒がないで……。

//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200200mi">
「なあタク！　教えろって――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","angry", 200, @-240);
	FadeStand("st梨深_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//◆とがめるように
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/10200210ri">
「大ちん！」

そこへ梨深が割って入ってきた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/10200220ri">
「落ち着けー。タクが困ってるでしょ」

{	Stand("st大輔_制服_通常","sigh", 200, @+240);
	FadeStand("st大輔_制服_通常_sigh", 300, true);
	DeleteStand("st大輔_制服_通常_shock", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200230mi">
「お？　ああ、わりーわりー」

三住くんは声を小さくすると、僕の背中を軽くポンポンと叩く。

{	Stand("st梨深_制服_通常","normal", 200, @-240);
	FadeStand("st梨深_制服_通常_normal", 300, true);
	DeleteStand("st梨深_制服_通常_angry", 0, true);}
僕はうなだれたまま、小さく息をついた。
また梨深に助けてもらっちゃった……。

{	DeleteStand("st大輔_制服_通常_sigh", 500, true);
	Stand("bu大輔_制服_通常","pride", 200, @+200);
	FadeStand("bu大輔_制服_通常_pride", 500, true);}
//◆声をひそめて
//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200240mi">
「で、実際のところどうやったんだ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/10200250ta">
「…………」

{	DeleteStand("bu大輔_制服_通常_pride", 500, true);
	Stand("st大輔_制服_通常","pride", 200, @+240);
	FadeStand("st大輔_制服_通常_pride", 500, true);}
さすが、下半身だけで生きている男。

{	Stand("st梨深_制服_通常","hard", 200, @-240);
	FadeStand("st梨深_制服_通常_hard", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/10200260ri">
「もー。大ちんってホント、節操ないよね」

//◆いたずらげに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/10200270ri">
「そのうちカノジョさんに刺されるんじゃない？」

//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200280mi">
「心配すんなって。俺、こう見えても各種ケアは欠かさねーから」

{	Stand("st梨深_制服_通常","normal", 200, @-240);
	FadeStand("st梨深_制服_通常_normal", 300, true);
	DeleteStand("st梨深_制服_通常_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/10200290ri">
「たはは……なにそれ」

{	DeleteStand("st大輔_制服_通常_pride", 500, true);
	Stand("bu大輔_制服_通常","pride", 200, @+200);
	FadeStand("bu大輔_制服_通常_pride", 500, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200300mi">
「なあ、タク。教えろよー。岸本とはどんな感じなんだ？」

三住くんは僕の肩を揉みながら、しつこく聞いてくる。

やむなく、僕は恐る恐る顔を上げた。

{	DeleteStand("st梨深_制服_通常_normal", 500, false);
	DeleteStand("bu大輔_制服_通常_pride", 500, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/10200310ta">
「……っ」

なおも半数ぐらいの男子が、チラチラと僕の様子を窺いながらヒソヒソとささやき合っている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","normal", 200, @-240);
	Stand("st大輔_制服_通常","pride", 200, @+240);
	FadeStand("st梨深_制服_通常_normal", 500, false);
	FadeStand("st大輔_制服_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
まずい……まだ注目されてる……。

――僕を、見るな。

うなじのあたりがチリチリする。
ＤＱＮに目を付けられたら終わりだ。
待っているのはイジメ地獄。

どうしよう……逃げるか？
授業をサボってさっさと帰るか？

でもひとりじゃ帰れない。
『将軍』や優愛に遭遇するかもしれないって思ったら足がすくむ。

梨深に一緒に付き合ってもらう？

さっき“尽くすタイプ”って言ってたし、その言葉がウソじゃないなら一緒に授業をサボってくれるはず。

とにかく一刻も早くこの教室から出ていきたい――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 200, 200, NULL);

//ＳＥ//ドアに人が激しく激突する音
	CreateSE("SE02","SE_衝撃_どあに激突");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);


/*森島shock差分ほしいなぁ*/
	Stand("st梨深_制服_通常","shock", 200, @-240);
	Stand("st大輔_制服_通常","shock", 200, @+240);
	FadeStand("st梨深_制服_通常_shock", 300, false);
	FadeStand("st大輔_制服_通常_shock", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, false);
	DeleteStand("st大輔_制服_通常_pride", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
と、いきなり入り口の方から激しい物音がした。

みんなが、何事かとそっちに目を向ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back04", 1000, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Fade("back04", 300, 1000, null, true);
	Stand("st梢_制服_正面","sad", 1200, @+100);
	FadeStand("st梢_制服_正面_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//【梢】
<voice name="梢" class="梢" src="voice/ch05/10200320ko">
「……っ」

転校生だった。

涙目になっておでこをさすりながら、相変わらず無言で周囲に頭を下げている。

教室内は突然の出来事にシンと静まりかえってしまった。

いったいなにが……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_正面_sad", 200, false);
	FadeDelete("back04", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602011]
//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200330mi">
「今の、見たか？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/10200340ri">
「見た。ひとりで勝手に扉に激突してたね……」

{	Stand("st大輔_制服_通常","smile", 200, @+240);
	FadeStand("st大輔_制服_通常_smile", 300, true);
	DeleteStand("st大輔_制服_通常_shock", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200350mi">
「ん～、やっぱ梢ちゃんはかわいいなあ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/10200360ta">
「…………」

な、なんというリアルドジっ娘……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back04", 1000, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Fade("back04", 300, 1000, null, true);
	Stand("st梢_制服_正面","sad", 1200, @+100);
	FadeStand("st梢_制服_正面_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//◆泣く
//【梢】
<voice name="梢" class="梢" src="voice/ch05/10200370ko">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_正面_sad", 200, false);
	FadeDelete("back04", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/10200380ri">
「あ、また泣いた……」

{	Stand("st梨深_制服_正面","sad", 200, @-240);
	DeleteStand("st梨深_制服_通常_shock", 500, false);
	FadeStand("st梨深_制服_正面_sad", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/10200390ri">
「大丈夫かな？　すごい音してたけど」

{	DeleteStand("st梨深_制服_正面_sad", 500, true);}
梨深は心配そうにつぶやくと、誰よりも早く転校生に駆け寄っていった。

彼女はかなりのお節介らしい。
優しい、というべきか。

{	Stand("st大輔_制服_通常","shock", 200, @+240);
	FadeStand("st大輔_制服_通常_shock", 300, true);
	DeleteStand("st大輔_制服_通常_smile", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch05/10200400mi">
「うお、梨深に先越された！
待て待て、梢ちゃんを介抱するのは俺だー！」

{	DeleteStand("st大輔_制服_通常_shock", 500, true);}
しなくていいのに力強く宣言して、三住くんも遅れて転校生に駆け寄っていく。

転校生の起こしたアクシデントは、僕にとっては幸運に作用した。

さっきまで僕に冷たい視線を浴びせていた男子連中も、今は全員が彼女へと注意を移している。

これは転校生ＧＪと言わざるを得ない。

ただ――
僕の席の近くにいた女子のグループの言葉が、ふと、耳に入ってしまった。

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch05/10200410wa">
「ウザ……」

//【女子Ｂ】
<voice name="女子Ｂ" class="女子Ｂ" src="voice/ch05/10200420wb">
「なにあれ」

//【女子Ｃ】
<voice name="女子Ｃ" class="女子Ｃ" src="voice/ch05/10200430wc">
「狙ってやってんじゃん？」

そんな、かすかなつぶやきが。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//チャイムの音
	CreateSE("SE02","SE_日常_チャイム");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 5000);

	SetVolume("SE02", 1000, 0, NULL);

	Wait(1500);
//～～Ｆ・Ｏ


}