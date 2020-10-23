//<continuation number="1360">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_197_覚醒";
		$GameContiune = 1;
		Reset();
	}

		ch09_197_覚醒();
}


function ch09_197_覚醒()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//	CreateColor("back10", 1000, 0, 0, 1280, 720, "White");

//ＢＧ//スクランブル交差点//夜
	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");
	Fade("back03", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
梨深の、過去。<k>
梨深の、想い。<k>
梨深の、覚悟。

それを思い出して、僕の胸は締め付けられる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700010ta">
「なんで、梨深は、僕に近づいてきたの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700020jn">
「彼女は君の近くにいることで、君の行動、君に接触してくる人間のことを監視して、君を覚醒させないようにしていたんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700030jn">
「彼女を恨まないであげて。彼女はただ、お節介なだけなんだ」

『将軍』の声に、悲しげな響きが宿る。

//◆悲しそうに
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700040jn">
「巻き込みたくなかったのに、
彼女は僕がどれだけ止めても、聞いてくれなかった」

//◆悲しそうに
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700050jn">
「勝手に、僕に恩義なんか感じて……」

//◆悲しそうに
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700060jn">
「本当に、お節介だよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700070ta">
「梨深と七海は、誰に捕まってるの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700080jn">
「プロジェクト・ノアの責任者……すべての黒幕、野呂瀬玄一」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700090jn">
「かつて、梨深を捕らえて、拷問していた男でもある」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700100jn">
「それなのに、梨深は、七海と、僕と、そして君を、助けるために、あの男のところへたったひとりで乗り込んでいっちゃった」

頭の中に、声が、よみがえってきた。<k>
それは僕の知らない梨深の言葉。<k>
『将軍』が聞いた、梨深の言葉。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(1000);

//ＢＧ//黒
	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

	Wait(1000);

//ＳＥ//ケータイ着信音（将軍のケータイ）
//ＳＥ//ケータイが繋がる

	CreateSE("SE01","SE_日常_けい帯_着信音_七海2");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	WaitAction("SE01", 5000);

	SetVolume("SE01", 0, 0, null);

	CreateSE("SE02","SE_日常_けい帯ボタン押す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg108_01_3_chn将軍病室_a.jpg");
	Fade("back04", 500, 1000, null, true);

	Delete("back03");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700110jn">
「梨深？」

//ＶＦ//以下、梨深のセリフはすべて電話の声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700120ri">
「あ、うん。あたし」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700130ri">
「実は、ちょっとした報告がありまーす」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700140ri">
「……ナナちゃんを、これから助けに行こうと思って」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700150jn">
「……やめるんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700160jn">
「君は、あの男……野呂瀬とは、もう会いたくないでしょ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700170ri">
「たはは。あたしって信用されてないなあ。平気だってば」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700180ri">
「昔の話だしね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700190ri">
「そもそも、あたしの感情と、ナナちゃんを助けることと、どっちを優先させるかなんて、決まり切ってることだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700200jn">
「七海を助けるのも、プロジェクト・ノアを止めるのも、僕のやるべきことだ。君は、そこまでしなくていいんだよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700210ri">
「言ったでしょ。あたしは、あなたの力になりたいって」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700220ri">
「それに……タクには、関わらせたくないの」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700230jn">
「……お節介、だね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700240ri">
「そうかもね。あなたにしか言われたことはないけど」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700250ri">
「ねえ、ちょっとだけ、語っちゃっていいかな？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700260ri">
「タクにね、いろいろ、ひどいこと、言っちゃったんだ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700270ri">
「しかも、そんなことしておいて、すごく自分勝手なんだけど……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700280ri">
「あたし、彼と一緒に過ごした時間は、とっても楽しかったって、思っちゃってるんだ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700290ri">
「なにもかもが、妄想でまみれたまやかしでしかなかったのに」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700300ri">
「学生生活も」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700310ri">
「あの学校にあたしやタクが通っていることも」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700320ri">
「大ちんと友達だっていうことも」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700330ri">
「あたしがタクと一緒にいようとしたことも」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700340ri">
「タクの存在そのものも」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700350ri">
「タクって、どうしようもないくらい情けなくて。どうしようもないくらい弱くて。きっと普通の女だったら、見向きもしないような男の子なんだよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700360ri">
「なのに、あたしの心には――楽しかった、っていう気持ちがあるの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700370ri">
「なのに、あたしの心には――もっと一緒にいたかった、っていう気持ちがあるの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700380ri">
「この気持ちって、なんなのかな？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605003]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700390jn">
{#TIPS_インプリンティング = true;$TIPS_on_インプリンティング = true;}「<FONT incolor="#88abda" outcolor="BLACK">インプリンティング</FONT>のようなもの、かもしれないね」

{$TIPS_on_インプリンティング = false;}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700400ri">
「本能、っていうことかな。それって意外とロマンチックかも」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700410jn">
「君が楽しかったなら、きっと、彼も楽しかったと思うよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700420ri">
「そうだと、いいな……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700430ri">
「あたしは、タクと、似たようなものだから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3606003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700440ri">
「肉体が妄想から作られた存在と」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700450ri">
「人格が妄想から作られた存在と」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700460ri">
「どっちも、変わらないでしょ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700470ri">
「だから、タクのこと、消したくなかった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700480ri">
「消さなくちゃダメだって、思ってたんだけどね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3607003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700490ri">
「でも、いつの間にか、感情移入しちゃったみたい」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700500ri">
「タクには、ごく普通に、暮らしていってもらいたいの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700510ri">
「あたしは、タクミも、タクも、助けたい」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700520ri">
「ねえ、タクのことは、そっとしておいてあげて」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3608003]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700530jn">
「そういうわけにはいかない。ノアⅡを破壊するために、彼は必要だよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700540ri">
「あたしがなんとかするから」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700550jn">
「君はそんなことしなくていい」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700560jn">
「君こそ、ごく普通に、暮らしていくべきだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3609003]
//◆かすかに微笑むブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700570ri">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700580ri">
「さてと、そろそろ切るね」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700590jn">
「梨深、やめて」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700600ri">
「あはは。本当に大丈夫だって。あなたはなにも心配しないで。あたしが全部、決着をつけてくるから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700610ri">
「ね――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700620ri">
「タクミ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Wait(500);
//ＳＥ//ツーツーツー
	CreateSE("SE03","SE_日常_でんわ_つーつーつー_LOOP");
	MusicStart("SE03", 0, 500, 0, 1000, null, false);

	WaitAction("SE03", 2000);

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);

	SetVolume("SE03", 2000, 0, null);

	Fade("back03", 2000, 1000, null, true);

//ＢＧ//スクランブル交差点//夜
	CreateBG(100, 1000, 0, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
今さら――

{	BGMPlay360("CH16", 2000, 1000, true);}
梨深の言葉が、心に染みる。

彼女は、ホントにお節介だ。
どうして、そこまで頑張れる？
どうして、そこまで他人のために行動できる？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("white12", 1000, 0, 0, 1280, 720, "WHITE");
	Request("white12", AddRender);
	Fade("white12", 0, 0, null, true);
	Fade("white12", 300, 1000, null, true);
	CreateColor("whiteAll", 500, 0, 0, 1280, 720, "White");
	Fade("whiteAll", 0, 300, null, false);
	CreateTextureEX("back220", 100, 0, 0, "cg/bg/bg043_01_2_学校中庭_a.jpg");
	Stand("bu梨深_制服_正面","normal", 200, @+150);
	Fade("back220", 0, 1000, null, false);
	FadeStand("bu梨深_制服_正面_normal", 0, true);
	FadeDelete("white12", 300, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700630ri">
「あたしは、タクの味方だから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("white", 500, 0, 0, 1280, 720, "White");
	Request("white", AddRender);
	Fade("white", 0, 0, null, false);
	Fade("white", 300, 1000, null, true);
	Delete("back220");
	Delete("whiteAll");
	Delete("white12");
	DeleteStand("bu梨深_制服_正面_normal", 0, true);
	FadeDelete("white", 300, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
梨深との想い出が、よみがえってくる。

これまでに一緒に過ごした、ほんの短い時間。

彼女が発した、ひとつひとつの言葉の裏に隠れていた、想い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("white12", 1000, 0, 0, 1280, 720, "WHITE");
	Request("white12", AddRender);
	Fade("white12", 0, 0, null, true);
	Fade("white12", 300, 1000, null, true);
	CreateTextureEX("back220", 100, 0, 0, "cg/bg/bg043_01_2_学校中庭_a.jpg");
	CreateColor("whiteAll", 500, 0, 0, 1280, 720, "White");
	Fade("whiteAll", 0, 300, null, false);
	Stand("bu梨深_制服_通常","smile", 200, @+150);
	Fade("back220", 0, 1000, null, false);
	FadeStand("bu梨深_制服_通常_smile", 0, true);
	Delete("back210");
	FadeDelete("white12", 300, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700640ri">
「あたしが、一緒にいてあげる」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("white", 1000, 0, 0, 1280, 720, "White");
	Request("white", AddRender);
	Fade("white", 0, 0, null, false);
	Fade("white", 300, 1000, null, true);
	Delete("back220");
	Delete("whiteAll");
	Delete("white12");
	DeleteStand("bu梨深_制服_通常_smile", 0, true);
	FadeDelete("white", 300, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604004]
この１年半。
僕がしたことと言ったら、エンスーとか、ＲＭＴとか、エロゲーとかぐらいのものだ。

それらに没頭して、ベースに引きこもっていた。学校には滅多に行かなくて、誰とも話そうとしなかった。

この世に生み出されて、死んだように過ごしていた。

でも、この１ヶ月ぐらいは、違った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("BlackAll", 500, 0, 0, 1280, 720, "White");
	Fade("BlackAll", 0, 0, null, true);
	Fade("BlackAll", 100, 300, null, true);

//ＣＧ//梨深のこれまでのＣＧをいろいろと
/*森島追記殺人現場（出会い*/
	CreateColor("white01", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white01", 0, 0, null, true);
	Request("white01", AddRender);
	Fade("white01", 200, 1000, null, true);
	CreateTextureEX("back110", 300, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");

	if(#下着パッチ==true)
	{
		CreateTextureEX("back111", 400, center, -352, "ex/hu/hu梨深_制服_正面血まみれ_下着_lost_eye01.png");
	}else{
		CreateTextureEX("back111", 400, center, -352, "cg/hu/hu梨深_制服_正面血まみれ_lost_eye01.png");
	}

	Move("back111", 0, @80, @0, null, false);
	Fade("back110", 0, 1000, null, false);
	Fade("back111", 0, 1000, null, true);
	FadeDelete("white01", 100, null);

	Wait(200);

/*森島追記出会い*/
	CreateColor("white02", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white02", 0, 0, null, true);
	Request("white02", AddRender);
	Fade("white02", 200, 1000, null, true);
	CreateTextureEX("back120", 100, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");
	Stand("bu梨深_制服_通常","normal", 200, @150);
	Fade("back120", 0, 1000, null, false);
	FadeStand("bu梨深_制服_通常_normal", 0, true);
	Delete("back110");
	Delete("back111");
	FadeDelete("white02", 100, null);

	Wait(200);

/*森島追記中*/
	CreateColor("white03", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white03", 0, 0, null, true);
	Request("white03", AddRender);
	Fade("white03", 200, 1000, null, true);
	CreateTexture360("back130", 100, 0, 0, "cg/ev/ev032_01_3_梨深だきしめ_a.jpg");
	DeleteStand("bu梨深_制服_通常_normal", 0, false);
	Delete("back120");
	FadeDelete("white03", 100, null);

	Wait(200);

/*森島追記教室*/
	CreateColor("white04", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white04", 0, 0, null, true);
	Request("white04", AddRender);
	Fade("white04", 200, 1000, null, true);
	CreateTextureEX("back140", 300, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Stand("bu梨深_制服_通常","happy", 350, @0);
	Fade("back140", 0, 1000, null, false);
	FadeStand("bu梨深_制服_通常_happy", 0, true);
	Delete("back130");
	FadeDelete("white04", 100, null);

	Wait(200);

/*森島追記介抱*/
	CreateColor("white05", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white05", 0, 0, null, true);
	Request("white05", AddRender);
	Fade("white05", 200, 1000, null, true);
	CreateTexture360("back150", 100, 0, 0, "cg/ev/ev042_01_2_梨深に介抱される_a.jpg");
	DeleteStand("bu梨深_制服_通常_happy", 0, true);
	Delete("back140");
	FadeDelete("white05", 100, null);

	Wait(200);

/*森島追記帰り道*/
	CreateColor("white06", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white06", 0, 0, null, true);
	Request("white06", AddRender);
	Fade("white06", 200, 1000, null, true);
	CreateTextureEX("back160", 300, 0, 0, "cg/bg/bg039_03_2_松濤_a.jpg");
	Stand("st梨深_制服_正面","sad", 350, @+150);
	Fade("back160", 0, 1000, null, false);
	FadeStand("st梨深_制服_正面_sad", 0, true);
	Delete("back150");
	FadeDelete("white06", 100, null);

	Wait(200);

/*森島追記放課後待ち合わせ*/
	CreateColor("white07", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white07", 0, 0, null, true);
	Request("white07", AddRender);
	Fade("white07", 200, 1000, null, true);
	CreateTextureEX("back170", 300, 0, 0, "cg/bg/bg075_01_1_ＭＨＶ店内_a.jpg");
	Stand("bu梨深_制服_通常ビシッ！","happy", 350, @+150);
	Fade("back170", 0, 1000, null, false);
	FadeStand("bu梨深_制服_通常ビシッ！_happy", 0, true);
	DeleteStand("st梨深_制服_正面_sad", 0, true);
	Delete("back160");
	FadeDelete("white07", 100, null);

	Wait(200);

/*森島追記朝迎え*/
	CreateColor("white08", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white08", 0, 0, null, true);
	Request("white08", AddRender);
	Fade("white08", 200, 1000, null, true);
	CreateTextureEX("back180", 300, 0, 0, "cg/bg/bg006_01_1_コンテナ外観_a.jpg");
	Stand("st梨深_制服_通常","normal", 350, @0);
	Fade("back180", 0, 1000, null, false);
	FadeStand("st梨深_制服_通常_normal", 0, true);
	DeleteStand("bu梨深_制服_通常ビシッ！_happy", 0, true);
	Delete("back170");
	FadeDelete("white08", 100, null);

	Wait(200);

/*森島追記最後*/
	CreateColor("white09", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white09", 0, 0, null, true);
	Request("white09", AddRender);
	Fade("white09", 200, 1000, null, true);
	CreateTextureEX("back190", 300, 0, 0, "cg/bg/bg056_01_2_下北沢住宅街_a.jpg");
	Stand("bu梨深_制服_通常","hard", 350, @+150);
	Fade("back190", 0, 1000, null, false);
	FadeStand("bu梨深_制服_通常_hard", 0, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);
	Delete("back180");
	FadeDelete("white09", 100, null);

	Wait(200);

/*森島追記最後2*/
	CreateColor("white10", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white10", 0, 0, null, true);
	Request("white10", AddRender);
	Fade("white10", 200, 1000, null, true);
	CreateTextureEX("back200", 300, 0, 0, "cg/bg/bg056_01_2_下北沢住宅街_a.jpg");
	Stand("st梨深_制服_通常ビシッ！","smile", 350, @+150);
	Fade("back200", 0, 1000, null, false);
	FadeStand("st梨深_制服_通常ビシッ！_smile", 0, true);
	DeleteStand("bu梨深_制服_通常_hard", 0, true);
	Delete("back190");
	FadeDelete("white10", 100, null);

	Wait(500);

/*森島追記ラスト*/
	CreateColor("white11", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white11", 0, 0, null, true);
	Request("white11", AddRender);
	Fade("white11", 1000, 1000, null, true);
	CreateTexture360("back210", 100, 0, 0, "cg/ev/ev032_01_3_梨深だきしめ_a.jpg");
	DeleteStand("st梨深_制服_通常ビシッ！_smile", 0, true);
	Delete("back200");
	FadeDelete("white11", 1500, null);

	Wait(2000);

	SetVolume360("CH16", 1000, 0, NULL);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
結果的にウソをつかれていたけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH11", 2000, 1000, true);
	CreateColor("white12", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white12", 0, 0, null, true);
	Fade("white12", 500, 1000, null, true);
	CreateTextureEX("back220", 100, 0, 0, "cg/bg/bg043_01_2_学校中庭_a.jpg");
	Stand("bu梨深_制服_正面","normal", 200, @+150);
	Fade("back220", 0, 1000, null, false);
	FadeStand("bu梨深_制服_正面_normal", 0, true);
	Delete("back210");
	FadeDelete("white12", 500, null);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700650ri">
「朝、一緒に学校行って」

僕なんかと一緒にいてくれた。

//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700660ri">
「学校では休み時間にどうでもいいこと話して」

恐怖に震えていた僕を、安心させてくれた。

{	Stand("bu梨深_制服_通常","normal", 200, @+150);
	DeleteStand("bu梨深_制服_正面_normal", 500, false);
	FadeStand("bu梨深_制服_通常_normal", 500, true);}
//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700670ri">
「お昼休みは、一緒にご飯食べて」

ダメ人間の僕を、支えてくれた。励ましてくれた。

//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700680ri">
「夕方、一緒に帰って」

僕なんかを、抱きしめてくれた。

//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700690ri">
「帰るついでにたまにどこかのお店に寄ったりして」

僕みたいな妄想の存在に、人の温もりを教えてくれた。

//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700700ri">
「タクの部屋で、ちょっとだけお喋りして」

僕を消すことだってできたのに、守ろうとしてくれた。

//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700710ri">
「それで、また明日ねって、手を振って別れて」

僕に、想い出を作ってくれた。

{	Stand("bu梨深_制服_通常","smile", 200, @+150);
	FadeStand("bu梨深_制服_通常_smile", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, true);}
//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700720ri">
「そんなのでいいなら、あたし、いくらでもしてあげるよ」

僕の１年半しかない人生の中で、梨深といた時間は、今も鮮明に思い返せた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19700730ri">
「……そういうの、結構、憧れなんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH11", 1000, 0, NULL);
	CreateColor("white", 1000, 0, 0, 1280, 720, "White");
	Fade("white", 0, 0, null, false);
	Fade("white", 3000, 1000, DxlAuto, true);
	DeleteStand("bu梨深_制服_通常_smile", 0, true);
	Delete("back*");
	Delete("BlackAll");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
梨深の、ささいな仕草。<k>
梨深の、髪から漂う香り。

梨深の、吐息の音。<k>
梨深の、瞳の輝き。

梨深の、明るい声。<k>
梨深の、優しい温もり。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");
	Fade("back04", 0, 1000, null, true);

	FadeDelete("white", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
ああ、そっか。

僕は、<k>
梨深が、<k>
好きなんだ。

なんていう、キモさ。<k>
自分のキモさに、苦笑してしまう。

妄想の存在が、恋だって？

人を恋する気持ちは、妄想の存在でも抱けるものなのかな。
それとも錯覚なのかな。

分からないけど、

僕は、

この気持ちに素直でありたい。

梨深は僕を友達として見ている。
きっと異性として意識してくれてはいない。
そもそも僕みたいなキモオタじゃ、梨深とは釣り合わない。

でも……たとえ片想いでも、自己満足でも、自分が妄想の存在だとしても、せめて、誰かのために……梨深のためになにかをして、消えていきたい。

キモオタが、恋をするのは、キモイ。
妄想の存在が、恋をするのは、キモイ。

だから、どうした？

キモくても、<k>
報われなくても、<k>
僕は、

この気持ちを、錯覚や妄想として片付けたくない。

この１ヶ月の想い出は、僕と、梨深、２人の周囲共通認識。

他がすべてまやかしだったとしても。
この想い出と。
それを積み重ねて生まれた気持ちは。

本物だ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu将軍_車椅子_通常","normal", 200, @0);
	FadeStand("bu将軍_車椅子_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700740jn">
「世界を救ってほしい」

『将軍』が、言う。
僕は、首を振る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700750ta">
「僕は勇者じゃない。人間でもない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700760ta">
「そんな僕に、世界を救えとか……なにを考えてるの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700770jn">
「君には本当に悪いと思ってるけど、君にやってもらうしかないんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700780ta">
「自分に謝るなんて、バカみたいだ」

僕は、本物の僕を、にらみつけた。
本物の僕は、ニセモノの僕の視線を、受け止めた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700790ta">
「僕は、君が嫌いだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700800jn">
「僕は、君が羨ましいよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700810ta">
「僕は世界のためになんか頑張らない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700820ta">
「世界を救うとか、そんなことどうでもいい」

自分が生まれた意味は、自分で決める。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700830ta">
「ただ……僕は、梨深を……助ける」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700840jn">
「……ありがとう」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu将軍_車椅子_通常_normal", 500, true);

//ＣＧ管理用フラグ
	#bg165_02_3_OFRONT見上げ_a=true;

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg165_02_3_O-FRONT見上げ_a.jpg");
	Fade("back03", 1000, 1000, null, true);
	Delete("back04");

//ＳＥ//ヒュンヒュンという機械音
	CreateSE("SE01","SE_擬音_きかい_ひゅんひゅん2_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	CreateSE("SE02","SE_はいけい_すくらんぶる交差点ガヤ_ぼう動_LOOP");
	MusicStart("SE02", 2000, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
周囲の音が、戻ってくる。
混乱にますます拍車がかかっている。

もう、これは暴動だ。

僕の周囲は、血の匂いと、怒号と、悲鳴と、うめき声、そして……ハウリングしているかのような機械音。それらで溢れかえっている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700850ta">
「ディソードを手に入れる方法を教えて」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st将軍_車椅子_通常","normal", 200, @0);
	FadeStand("st将軍_車椅子_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700860jn">
「君は、すでにそれを知っているはずだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700870ta">
「…………」

視線を上げる。
この景色の中に溶け込んでいる、剣の姿を探す。

石が飛び交い、
催涙弾の煙が立ちのぼり、
周囲の人が何度も身体をぶつけてくる。

その状況で、僕は意識を集中させて、かつてＯ－ＦＲＯＮＴの屋上から一瞬だけ見えたあの剣を、求める。

見えているはず。
どこかに、必ず、ある。

景色の一部。
紛れ込んでいる。

捉えろ。
ディソードは、いつも、そばにある。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume("SE01", 500, 0, null);
	SetVolume("SE02", 500, 0, null);

	CreateTextureEX("たくディソード", 500, 0, -96, "cg/bg/bg147_02_6_ディソード想像_a.jpg");
	Move("たくディソード", 1000, 0, -96, Dxl1, false);
	Fade("たくディソード", 500, 1000, null, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700880ta">
「……見つけた」

{	DeleteStand("st将軍_車椅子_通常_normal", 0, true);}
１０７のすぐ右にあるビル。そこに縦に設置されたカラフルな看板。
それが、剣の形に見えた。

緊張。
ゴクリと息を呑む。

前にＯ－ＦＲＯＮＴの屋上から見たときも、剣の形を捉えることはできた。

でもあのときは、結局この手につかむことはできなかったんだ。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700890jn">
「自分の意志を強く持つんだ。迷っちゃダメだからね」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700900jn">
「君にはもう、剣を手に入れる資格はじゅうぶんにある」

その場に立ったまま、手を、伸ばす。

大切な人を、助け出すために。
その剣は、どうしても必要なんだ。

どうしても――！

奥歯を噛みしめる。

前とは違う。

心は、自分でも驚くぐらい穏やか。

怯えはない。怯えてるわけにはいかない。

でも冷静ってわけじゃなくて。

沸々と、煮えたぎっている感情がある。

僕には、どうしても、やらなくちゃいけないことが、<k>ある――！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateTexture360("たくディソード２", 100, 0, 0, "cg/bg/bg147_02_6_ディソード想像_a.jpg");
	Fade("たくディソード", 0, 0, null, true);
	Delete("たくディソード");
	CreateSE("SE10","SE_擬音_ディそーどかまえる");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700910jn">
「つかむんだ」

１０７までの距離はおよそ１００メートル。
掌を、剣に重なって見えるようにして。

握りしめる。

{	MusicStart("SE10", 0, 1000, 0, 1000, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700920ta">
「……！」

なにもないところを握ったはずなのに。
手応えが、あった。

それは、
冷たくもなく、熱くもなく。
硬くもなく、柔らかくもなく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("拓巳剣", 300, 0, 0, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.png");
	Request("拓巳剣", Smoothing);
	Zoom("拓巳剣", 0, 2000, 2000, null, true);
	Move("拓巳剣", 0, @-960, @480, null, true);

	CreateSE("SE10","SE_擬音_ディそーど_具現化直前_Loop");
	CreateSE("SE360110","SE_擬音_ディそーど_衝撃は");

	CreateColor("back20", 500, 0, 0, 1280, 720, "White");
	Fade("back20", 0, 0, null, false);
	Request("back20", AddRender);

	Zoom("たくディソード２", 300, 3000, 3000, Axl2, false);
	Fade("back20", 300, 1000, null, true);


	MusicStart("SE10", 0, 1000, 0, 1000, null, false);
	MusicStart("SE360110",0,1000,0,1000,null,false);

	Fade("拓巳剣", 500, 1000, null, false);
	Move("拓巳剣", 10000, @320, @-160, Dxl1, false);

	Fade("back20", 1000, 400, null, true);
	Fade("back20", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
つかんだまま、ゆっくりと引き寄せた。

空間に浮かび上がる、波紋。
その波紋の中から、ずるりと、せり出してくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE360101","SE_擬音_ディそーど2");
	CreateSE("SE360102","SE_擬音_ディそーど_投擲");
	CreateSE("SE360103","SE_擬音_ディそーど同士ぶつかる");

	MusicStart("SE360101",0,1000,0,1000,null,false);

	Move("拓巳剣", 1000, @640, @-320, Axl2, false);
	Fade("back20", 1000, 1000, null, true);

	Delete("たくディソード２");
	Delete("拓巳剣");

	XBOX360_LockVideo(true);

	CreateTextureEX("覚醒１", 300, 0, -2066, "cg/ev/ev143_01_3_拓巳覚醒_a.jpg");
	CreateTextureEX("覚醒２", 310, 0, -2066, "cg/ev/ev143_02_3_拓巳覚醒_a.jpg");
	CreateTextureEX("覚醒３", 320, 0, -2066, "cg/ev/ev143_03_3_拓巳覚醒_a.jpg");
	CreateTextureEX("back10", 100, -480, Middle, "cg/ev/ev087_01_3_拓巳ディソード_a.jpg");

	XBOX360_LockVideo(false);

	SetAlias("覚醒１", "覚醒１");
	SetAlias("覚醒２", "覚醒２");
	SetAlias("覚醒３", "覚醒３");

//おがみ：EV：演出追加予定

	FadeDelete("back20", 1500, false);


	Fade("覚醒１", 0, 1000, null, true);

	CreateProcess("プロセス１", 1000, 0, 0, "Sword");
	Request("プロセス１", Start);

	Delete("back0*");

	Move("覚醒*", 1500, -527, -200, AxlDxl, false);
	FadeDelete("back20", 1500, false);

	Wait(2500);



	Move("覚醒*", 1000, -527, -800, AxlDxl, true);



	MusicStart("SE360102",0,1000,0,1000,null,false);
	CreateMovie360("剣ムービー", 500, Center, Middle, false, false, "dx/mvたくみけんげき.avi");	
	Fade("剣ムービー", 0, 0, null, true);
	Move("覚醒*", 600, 80, -1600, Axl3, false);
	Fade("剣ムービー", 500, 1000, null, true);

	Delete("プロセス１");

	Fade("back10", 0, 1000, null, true);
	Wait(1200);
	MusicStart("SE360103",0,1000,0,1000,null,false);
	Wait(800);


	Delete("覚醒*");
	Fade("剣ムービー", 1000, 0, null, false);

	Shake("back10", 700, 0, 10, 0, 0, 500, null, false);
	Move("back10", 16000, 0, 0, AxlDxl, false);

	Wait(2000);
	Delete("剣ムービー");

	BGMPlay360("CH_OP_Instrumental", 0, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text100]
剣と呼ぶには、あまりに長く。

今にも折れそうなほどの繊細さと。

夢幻なる気品に満ちて。

絢爛さは露ほどもなく。

魂が吸い取られるかのような、清純なる悪意と。

畏怖を感じさせるかのような流麗さを持ち合わせ。

僕の高揚する心とリンクして、柄の部分に宿る禍々しい炎の意匠が揺らめく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE10","SE_擬音_ディそーど出現");
	MusicStart("SE10", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
重さは欠片も感じない。

むしろ、手と完全に一体化したかのような。
初めから、そこにあったかのような。
僕の身体の一部であるかのような。

剣を持っているという実感が湧かない。

これが……ディソード……！

両手で、きつく握りしめて。
今の僕なら、これをリアルブートすることだってできるはず。

周囲と共通の認識にすれば、この剣は、現実に姿を浮かび上がらせる。

やり方なんて、分からない。
ただ、念じる。

現実になれと、心の中で叫ぶ。
迷いは、もうない。

{//ＳＥ//衝撃波
	CreateSE("SE10","SE_衝撃_衝撃は_リアルぶーと");
	MusicStart("SE10", 0, 1000, 0, 1000, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700930ta">
「ああああ――っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE360101","SE_擬音_ディそーど1");
	MusicStart("SE360101",0,1000,0,1000,null,false);

	CreateColor("赤い光", 500, 0, 0, 1280, 720, "RED");
	Request("赤い光", AddRender);
	Fade("赤い光", 0, 0, null, false);
	Fade("赤い光", 200, 500, null, true);
	Fade("赤い光", 500, 0, null, true);

	Delete("赤い光");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
ディソードが、僕のその叫びに応えるように、淡く輝き始めた。

柄の部分にある炎の意匠が、現実の炎となって剣を包み込む。熱さは感じない。

その炎はやがて、剣全体に吸い込まれていき――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("back14", 100, 1000, null, true);

	CreateSE("SE360201","SE_擬音_ディそーど同士ぶつかる");
	CreateSE("SE360301","SE_擬音_ディそーどかまえる");
	MusicStart("SE360201",0,1000,0,1000,null,false);

	CreateColor("赤い光", 500, 0, 0, 1280, 720, "RED");
	Request("赤い光", AddRender);
	Fade("赤い光", 0, 0, null, false);
	Fade("赤い光", 200, 800, null, true);
	Fade("赤い光", 2000, 0, null, false);


	CreateTexture360("back10", 100, Center, Middle, "cg/ev/ev087_02_3_拓巳ディソード_a.jpg");
	CreateTextureEX("back11", 100, Center, Middle, "cg/ev/ev087_02_3_拓巳ディソード_a.jpg");
	Zoom("back11", 0, 2000, 2000, null, false);
	SetBlur("back11", true, 2, 400, 100);
	Fade("back11", 0, 500, null, false);
	Fade("back14", 1000, 0, null, false);
	MusicStart("SE360301",0,1000,0,1000,null,false);
	Zoom("back11", 1500, 1000, 1000, Dxl2, true);

	Fade("back11", 0, 0, null, true);

	Delete("back11");
	Delete("back14");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//リアルブート完了
激しい衝撃とともに、ディソードは紅い光を帯びた。

周りにいた一部の人たちが、僕の剣を目にして驚き、呆然としている。

でも一部だけだ。
他の人たちは、殴り合い、罵り合うことに夢中。
暴動は収まりそうにない。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700940jn">
「この暴動を引き起こしているポーターたちを探すんだ。彼らの持つ機械を破壊すれば、バイオリズムの高騰も収まる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19700950ta">
「ポーター？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700960jn">
「ノアⅡの端末としての存在」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700970jn">
「君は、すでにそのヒントを“見てきた”はずだよ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19700980jn">
「君の頭の中に、それは記憶として刻まれている」

呼び覚ます。
僕が“見てきた”ものを。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("赤い光");

//※以下、これまでのインターミッションの回想。インターミッションはすべて「拓巳が思考盗撮していた」ことをプレイヤーに提示する。

//アイキャッチ
	IntermissionIn();

	DeleteAll();

	CreateColor("white12", 1500, 0, 0, 1280, 720, "BLUE");
//	Request("white12", AddRender);
	Fade("white12", 0, 0, null, true);
	Fade("white12", 0, 150, null, true);

	CreateTextureEX("back03", 200, Center, Middle, "cg/ev/ev008_01_4_INT02あやせ歌う_a.jpg");
	Zoom("back03", 0, 500, 500, null, false);
	Fade("back03", 300, 1000, null, true);

	IntermissionIn2();

	Wait(300);

//ＣＧ//深夜の宮下公園で空を見上げながら歌うあやせ
//※インターミッション０２回想
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch09/ayase_akapera2_efx">
//「杭を打て、杭を打て――」
//■３６０
//ayase_akapera2_efx
//【あやせ】
「Fly and cross Fly and cross　約束は今――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("梢２", 200, Center, Middle, "cg/ev/ev017_02_2_尾道_a.jpg");

	CreateMovie360("砂", 2000, Center, Middle, true, false, "dx/mv砂嵐.avi");	
//	Request("砂", Play);
	Fade("砂", 0, 0, null, false);
	Fade("砂", 300, 1000, null, true);
	Delete("back03");

//画面エフェクト//一瞬ノイズで場面切り替え
//ＣＧ//家庭用焼却炉の前にたたずみ手で両耳を押さえている梢
//※インターミッション０３回想


	Fade("梢２", 0, 1000, null, true);

	Fade("砂", 300, 0, null, true);
	Request("砂", Stop);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//ＶＦ//回想セリフ
//【梢】
<voice name="梢" class="梢" src="voice/ch09/19701000ko">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg095_01_1_警察署大会議室_a.jpg");
	Stand("bu護_スーツ_通常","sigh", 200, @300);
	Stand("bu安二_スーツ_通常","normal", 200, @-300);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Request("砂", Play);
	Fade("砂", 300, 1000, null, true);
	Delete("梢２");

	Fade("背景１", 0, 1000, null, true);

	FadeStand("bu安二_スーツ_通常_normal", 0, true);
	FadeStand("bu護_スーツ_通常_sigh", 0, true);

	Fade("砂", 300, 0, null, true);
	Request("砂", Stop);

	Wait(300);

//画面エフェクト//一瞬ノイズで場面切り替え
//ＢＧ//渋谷警察署大会議室
//※インターミッション０５回想
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//ＶＦ//回想セリフ
//【判】
<voice name="判" class="判" src="voice/ch09/19701010bn">
「ようやくシッポを出したんだ。
そいつをつかんで離さねえようにしないとな……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景３", 100, 0, 0, "cg/ev/ev037_01_3_INT13優愛自室でメール書く_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Request("砂", Play);
	Fade("砂", 0, 0, null, false);
	Fade("砂", 300, 1000, null, true);
	Delete("背景１");
	DeleteStand("bu安二_スーツ_通常_normal", 0, true);
	DeleteStand("bu護_スーツ_通常_sigh", 0, true);

//	Request("砂", UnLock);

	Fade("背景３", 0, 1000, null, true);

	Fade("砂", 300, 0, null, true);
	Request("砂", Stop);

	Wait(300);

//画面エフェクト//一瞬ノイズで場面切り替え
//ＣＧ//自宅でＰＣに向かっている優愛
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//※インターミッション０６回想
//ＶＦ//回想セリフ
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/19701020yu">
「辛いんですね……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg064_01_2_ゲロカエルン店外観_a.jpg");
	Stand("st優愛_制服_通常左手下","worry", 200, @-150);
	Stand("st安二_スーツ_通常","normal", 200, @+150);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Request("砂", Play);
	Fade("砂", 0, 0, null, false);
	Fade("砂", 300, 1000, null, true);
	Delete("背景３");

	Fade("背景２", 0, 1000, null, true);
	FadeStand("st優愛_制服_通常左手下_worry", 0, false);
	FadeStand("st安二_スーツ_通常_normal", 0, true);

	Fade("砂", 300, 0, null, true);
	Request("砂", Stop);

	Wait(300);

//画面エフェクト//一瞬ノイズで場面切り替え
//ＢＧ//原宿ゲロカエルんショップ//夕方
//※インターミッション３７回想
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//ＶＦ//回想セリフ
//【判】
<voice name="判" class="判" src="voice/ch09/19701030bn">
「有限会社シンコー……聞いたことあるかい？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev085_01_3_七海ディソード_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Request("砂", Play);
	Fade("砂", 0, 0, null, false);
	Fade("砂", 300, 1000, null, true);
	Delete("背景２");
	DeleteStand("st優愛_制服_通常左手下_worry", 0, false);
	DeleteStand("st安二_スーツ_通常_normal", 0, true);

	Fade("背景１", 0, 1000, null, true);

	Fade("砂", 300, 0, null, true);
	Request("砂", Stop);

	Wait(300);

//画面エフェクト//一瞬ノイズで場面切り替え
//ＣＧ//野呂瀬ディソードに囚われた七海
//※インターミッション４７回想
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//ＶＦ//回想セリフ
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19701040na">
「返して……ナナのバングル、返して……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景２", 100, 0, 0, "cg/ev/ev051_01_3_清掃員_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Request("砂", Play);
	Fade("砂", 0, 0, null, false);
	Fade("砂", 300, 1000, null, true);
	Delete("背景１");

	Fade("背景２", 0, 1000, null, true);

	Fade("砂", 300, 0, null, true);
	Request("砂", Stop);

	Wait(300);

//画面エフェクト//一瞬ノイズで場面切り替え
//ＢＧ//スクランブル交差点
//※インターミッション０７回想
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//ＶＦ//回想セリフ
//【清掃員Ａ】
<voice name="清掃員Ａ" class="清掃員Ａ" src="voice/ch09/19701050sa">
「地点Ｌ２－８、０．６２メガＧＥ。ハイスコアです」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev075_01_3_半蔵門駅構内ビデオ_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Request("砂", Play);
	Fade("砂", 0, 0, null, false);
	Fade("砂", 300, 1000, null, true);
	Delete("背景２");

	Fade("背景１", 0, 1000, null, true);

	Fade("砂", 300, 0, null, true);
	Request("砂", Stop);

	Wait(300);

//画面エフェクト//一瞬ノイズで場面切り替え
//ＣＧ//半蔵門線渋谷駅構内で対峙するセナとリュック男（を映した監視カメラ）
//※インターミッション２７回想
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//ＶＦ//回想セリフ
//【判】
<voice name="判" class="判" src="voice/ch09/19701060bn">
「どんな手品だ、こりゃ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景２", 100, @-966, @-83, "cg/bg/bg149_01_2_リュック_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Request("砂", Play);
	Fade("砂", 0, 0, null, false);
	Fade("砂", 300, 1000, null, true);
	Delete("背景１");

	Fade("背景２", 0, 1000, null, true);

	Fade("砂", 300, 0, null, true);
	Request("砂", Stop);

	Wait(300);

//画面エフェクト//一瞬ノイズで場面切り替え
//イメージＢＧ//リュックの開口部を拡大
//※インターミッション１６回想
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch09/19701070sn">
「ＮＯＺＯＭＩ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景２", 100, 0, 0, "cg/ev/ev074_01_1_洗脳部隊inモニター_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Request("砂", Play);
	Fade("砂", 0, 0, null, false);
	Fade("砂", 300, 1000, null, true);
	Delete("背景１");

	Fade("背景２", 0, 1000, null, true);

	Fade("砂", 300, 0, null, true);
	Request("砂", Stop);
	Delete("砂");

	Wait(300);

//画面エフェクト//一瞬ノイズで場面切り替え
//ＣＧ//天成神光会大講堂に集まる洗脳部隊を映すモニター
//※インターミッション２６回想
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//ＶＦ//回想セリフ
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch09/19701080nr">
「我が社では『ポーター』と呼んでいます」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch09/19701090nr">
「言い換えれば、マインドコントロールのための部隊、といったところでしょうか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//アイキャッチ
//ＢＧ//スクランブル交差点//夜
//ＳＥ//ヒュンヒュンという機械音

	IntermissionIn();

	DeleteAll();

//ＣＧ管理用フラグ
	#bg165_02_3_OFRONT見上げ_a=true;

	CreateTextureEX("back03", 100, Center, Middle, "cg/bg/bg165_02_3_O-FRONT見上げ_a.jpg");
	Fade("back03", 0, 1000, null, true);

	IntermissionIn2();

	CreateSE("SE10","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE10", 500, 500, 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
僕が、ずっと、無意識のうちに見てきたもの。
無意識のうちに、思考盗撮していたもの。

//◆自嘲気味に笑う
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19701100ta">
「僕は盗撮野郎ってことか。お似合いだね」

自嘲気味に笑う僕に、『将軍』が冷静に指示してくる。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701110jn">
「チャネルを開放して、ポーターたちの心を読むんだ。“こずぴぃ”のようにね」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701120jn">
「彼らはこのスクランブル交差点の、どこかにいる。居場所を探り当てて」

チャネルを開放する。

どうやればいいか、なんて考えるまでもなかった。

意識しなくても、感覚で僕はそれを実行していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//画面エフェクト//ドクン
//ＳＥ//共鳴音

	CreateTextureEX("Blur", 200, Center, Middle, "cg/bg/bg165_02_3_O-FRONT見上げ_a.jpg");
	Fade("Blur", 0, 0, null, true);
	SetBlur("Blur", true, 2, 400, 100);

	Fade("Blur", 300, 500, null, false);
	Zoom("Blur", 3000, 1200, 1200, null, true);
	FadeDelete("Blur", 1000, false);

	CreateSE("SE01","SE_擬音_共鳴音_激しい_LOOP");
	MusicStart("SE01", 500, 500, 0, 1000, null, true);

	SetVolume360("CH_OP_Instrumental", 1000, 0, null);

	BGMPlay360("CH10", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
直後、この場にいるたくさんの人たちの心が。
負の感情が。

見えるようになって。
一気に僕に流れ込んできた。

//◆声にならない悲鳴
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19701130ta">
「――――っ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//おどろおどろしいイメージ
	CreateMovie360("おどおど", 100, Center, Middle, true, false, "dx/mvイメージ01.avi");
	Fade("おどおど", 0, 0, null, false);

//	Request("おどおど", Play);
	Fade("おどおど", 500, 800, null, true);




//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
悪意。憎悪。嫉妬。淫欲。卑屈。臆病。軽薄。汚濁。狡猾。卑猥。醜悪。下劣。情欲。狂気。殺意。

言葉を通すよりも、よりダイレクトで、より残虐で、よりおぞましい、人が他人に隠している、醜い感情の発露。

人の抱く、あらゆる負の感情が、イメージの奔流となって、僕の心を呑み込み、砕き、犯してくる。

蔑むような視線を浴び、<k>
侮蔑の言葉で罵られ、<k>
唾を吐きかけられ、

爪をはがされ、<k>
頬を拳で何度も殴られ、<k>
尻を蹴られ、

髪の毛をむしり取られ、<k>
鼻を噛み千切られ、<k>
目玉をえぐり出され、

舌を引っ張り出され、<k>
血を吸い取られ、<k>
熱湯を浴びて火傷させられ、

肛門を犯され、<k>
性器を叩き潰され、<k>
全身の皮を剥がされ、

腕を斬られ、<k>
あらゆる箇所の骨を折られ、<k>
鈍器で殴られ、

刃物で刺され、<k>
内臓をえぐり取られ、<k>
首をきつく絞められ、

巨大な獣に肉を食われ、<k>
高所から突き落とされ、<k>
水の中で窒息させられ、

炎で全身を焼かれ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
同調してしまったら、僕の心が壊れる。気が狂いそうになる。

歯を食いしばって、自分の意識を必死で保つ。

こずぴぃはこんな状態でずっと生きてきたって言うの？

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701140jn">
「見るべき妄想をコントロールするんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701150jn">
「すべてを受信しちゃダメだ。標的を絞り込んで」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701160jn">
「“音”を頼りにするんだ」

音――

押し寄せる負の妄想に耐えながら、必死で耳を澄ます。

聞こえてくるのは、声ばかり。
それらを遮断し。
音を探す。

聞こえてくる、機械音。
“僕を殺してくれる音”って星来たんが言っていた。

思考盗撮した記憶の中にも、この音がある。
セナがこの音を発するポーターのリュックを、ディソードで破壊していた。

その音に意識を向ければ――

聞こえてくる妄想は、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//おがみ：演出：↓同時じゃなくてもいいか
//以下の３つのセリフ、同時でお願いします
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
//【ポーターＢ】
<voice name="ポーターＢ" class="ポーターＢ" src="voice/ch09/19701170pb">
「神光の救いあれ。神光の救いあれ……」

//【ポーターＣ】
<voice name="ポーターＣ" class="ポーターＣ" src="voice/ch09/19701180pc">
「神光の救いあれ。神光の救いあれ……」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19701190hd">
「神光の救いあれ。神光の救いあれ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――
//以下の３つのセリフ、同時でお願いします


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
声は、複数あった。
この場にいるポーターは、ひとりじゃない。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701200jn">
「３人いるみたいだね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH10", 500, 0, NULL);
	SetVolume("SE01", 500, 0, NULL);
	Fade("おどおど", 500, 0, null, true);
	Delete("おどおど");

	BGMPlay360("CH_OP_Instrumental", 0, 1000, true);

//ＢＧ//スクランブル交差点//夜

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
息を殺して、僕は一歩を踏み出す。

混沌とした人の群れ。秩序の欠片もなく、それぞれが好き勝手に歩き回り、殴り合っている、このスクランブル交差点。まっすぐ進むことは困難。

僕は標的の方向にいる人々の妄想をハックした。

僕の視界の先にいた人たちが、少しずつ立つ場所をずらしていく。
そこに、一筋の道ができた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("Black", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("Black", 1000, 0, 500, 300, null, "cg/data/lcenter2.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601029]
５０メートルほど先に、ひとりの男。
僕とその男との間にあるあらゆる障害物が、今、除かれた。

目が合う。

小太りで、スーツ姿で、リュックを背負っている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19701210ta">
「１人目……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＣＧ管理用フラグ
	#bg165_02_3_OFRONT見上げ_a=true;

	CreateTextureEX("走り", 300, Center, Middle, "cg/bg/bg165_02_3_O-FRONT見上げ_a.jpg");
	Fade("走り", 0, 1000, null, true);

	Zoom("走り", 1000, 2000, 2000, Dxl2, false);
	FadeDelete("走り", 1000, false);

	DrawTransition("Black", 1000, 500, 0, 300, null, "cg/data/lcenter2.png", true);
	CreateSE("SE05","SE_擬音_ちを蹴る");
	CreateSE("SE06","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602029]
走る。

{	MusicStart("SE06", 0, 1000, 0, 1000, null, true);}
この人ごみの中を。

誰にもぶつかることなく。

まっすぐに。

最短距離で。

ディソードを引きずりながら。

//【ポーターＢ】
<voice name="ポーターＢ" class="ポーターＢ" src="voice/ch09/19701220pb">
「な、なんで――」

僕に気付いたポーターの男は、慌てた様子で背を向け、逃げ出そうとする。
でも僕はそれを許さない。

セナと同じように。
僕の背丈よりも長いディソードを、横凪ぎに払う。

相変わらず、重さを感じない。
自分の手の一部のように操れる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_ディそーど_空を切る1");
	CreateSE("SE04","SE_擬音_きかい切る音");

	CreateColor("色１", 300, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, true);

	CreateTextureEX("ポーター爆破", 300, -1024, Middle, "cg/bg/bg149_01_2_リュック_a.jpg");

	SetVolume("SE06", 0, 0, NULL);

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Fade("色１", 100, 1000, null, true);

	Wait(200);
//ＳＥ//剣を振る
//ＳＥ//モデムが壊れる
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	Move("ポーター爆破", 1200, 0, @0, Dxl2, false);
	Fade("ポーター爆破", 200, 1000, null, true);
	FadeDelete("ポーター爆破", 1000, false);
	Fade("色１", 500, 0, null, true);

	Delete("剣閃");
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
ディソードの先端が、リュックを抉った。
高温で溶かされたように。
リュックは中身ごと蒸発した。

男はその場にへたり込み、頭を抱えて震えている。

そいつには目もくれず、２人目へ。

{	CreateSE("SE05","SE_擬音_ちを蹴る");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	DrawTransition("Black", 300, 0, 1000, 300, null, "cg/data/left2.png", true);}
Ｏ－ＦＲＯＮＴの下。

再びそこに至る障害物が消えていく。
道が築かれていく。

{	DrawTransition("Black", 500, 1000, 0, 300, null, "cg/data/lcenter2.png", true);}
その先に立つ男。
痩せぎすで、チェックのシャツにジーパンという格好。

長髪で、病的に肌が白い。
バッグを大事そうに胸に抱えていた。

そいつは僕に気付くなり、人ごみの中に紛れ込もうとした。
それよりも先に、{	CreateSE("SE03","SE_擬音_ディそーどかまえる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	WaitAction("SE03", 500);
	CreateSE("SE04","SE_擬音_ディそーど_空を切る2");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}ディソードを、投擲する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("拓巳剣", 600, Center, Middle, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");
	Zoom("拓巳剣", 0, 2000, 2000, null, true);
	Move("拓巳剣", 0, @512, @-192, null, true);

	CreateColor("Black", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("Black", 400, 0, 1000, 500, null, "cg/data/爆発.png", true);
//ＳＥ//ディソードが飛んでいく
	CreateSE("SE03","SE_擬音_ディそーど_空を切る1");
	MusicStart("SE03", 0, 500, 0, 1000, null, false);

	Fade("拓巳剣", 200, 1000, null, false);
	Move("拓巳剣", 700, @-512, @192, Axl2, 500);

	FadeDelete("拓巳剣", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text031]
――飛べ。

妄想した。

それは物理法則を無視し、
地面と並行に、
加速しながら飛翔する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_擬音_きかい切る音");

	CreateColor("色１", 1000, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 1000, null, true);
	Delete("Black");
	MusicStart("SE04", 0, 500, 0, 1000, null, false);
	Fade("色１", 1000, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601031]
微妙に軌道を修正し、
正確無比に、ポーター男のバッグを貫く。

かすかな閃光を発して。
男はその場に倒れた。

あと、ひとり――

{	CreateSE("SE05","SE_擬音_ちを蹴る");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	CreateColor("Black", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("Black", 300, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateSE("SE03","SE_擬音_ディそーどかまえる");
	MusicStart("SE03", 0, 600, 0, 1000, null, false);}
倒れた男のところへ駆け寄り、ディソードを回収。
３人目は、ハチ公の前。

そのポーターとは、
僕は、何度か会ったことがある。

いや、もっと正確に言うなら、

ほぼ毎日のように、話をしていた。

人の波が分かれて。
三度、一直線に道が現れる。

その道の先に。
とても目立つ、白い服を着た女。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH_OP_Instrumental", 1000, 0, null);
//フラグ【葉月メガネ】ＯＮだった場合は、葉月はメガネをかけています。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text032]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19701230ta">
「あなたが、３人目です」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19701240ta">
「葉月さん……いや……グリム」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu志乃_白衣_通常","cool", 200, @150);
	FadeStand("bu志乃_白衣_通常_cool", 1, true);
	Fade("Black", 1000, 0, null, true);
	Delete("Black");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601032]
病院で、優しい笑みを浮かべていた看護師。

今、彼女は刺すような眼差しで僕をにらんでいる。
手には、大きめのハンドバッグ。
おそらくあの中に、ノアⅡの端末がある。

{	DeleteStand("bu志乃_白衣_通常_cool", 300, true);
	Stand("st志乃_白衣_通常","cool", 200, @150);
	FadeStand("st志乃_白衣_通常_cool", 300, true);}
//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701250jn">
「真実を、暴くんだ」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701260jn">
「彼女がしてきたことを、この場にいる人たちに提示すれば――」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701270jn">
「この熱病のような混乱は収まる」

してきたこと？

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701280jn">
「彼女が“グリム”なら、これまでの不自然な言動に、君は気付いているはず」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701290jn">
「僕が最初に君に接触したときのことを、思い出して」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701300jn">
「僕は君に、『張り付け』事件の予言をした。君への警鐘だった」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701310jn">
「でも、僕よりも、先に――」

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19701320jn">
「『張り付け』を予言した人間が、いる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19701330ta">
「……！」

思い出す。
あのときのチャットでのやり取りを。

『将軍』が僕に語りかけてくる直前。
グリムは退室した。
ひとつのネタ画像を添付して。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音
//イメージＢＧ//スプーのようなイラスト
//フラッシュバックで一瞬表示
	CreateSE("SE03","SE_衝撃_ふらっしゅばっく");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);

	CreateColor("white10", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white10", 0, 0, null, true);
	Request("white10", AddRender);
	Fade("white10", 200, 1000, null, true);
	CreateTextureEX("back200", 300, 0, 0, "cg/ev/ev014_01_1_スプー_a.jpg");
	Fade("back200", 0, 1000, null, false);
	CreateColor("WhiteAll", 400, 0, 0, 1280, 720, "White");
	Fade("WhiteAll", 0, 300, null, false);
	Delete("back190");
	FadeDelete("white10", 100, null);

	Wait(300);

	CreateColor("white", 1000, 0, 0, 1280, 720, "White");
	Fade("white", 0, 0, null, false);
	Fade("white", 200, 1000, null, true);
	Delete("back200");
	Delete("WhiteAll");

	Fade("white", 300, 0, null, true);
	Delete("white");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text033]
葉月さんがカルテにも落書きしていた、あの絵。
稚拙な絵だけど、それが表しているのは――
『張り付け』だ。

それにグリムは、ニュージェネ事件について
僕に最初に説明したとき、こう言った。

“全部おまいん家の近所だぞｗ”

僕が渋谷に住んでいることは、一言も教えていなかったのに。

つい数時間前のチャットでも、グリムは僕が西條拓巳だと把握しているかのような言葉を漏らした。

“おまいは有名人だから祭り会場で注目の的だお”

二度目に僕が病院に行ったとき。
葉月さんは、こう言った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("white10", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("white10", 0, 0, null, true);
	Request("white10", AddRender);
	Fade("white10", 200, 1000, null, true);
	CreateColor("BlackAll", 400, 0, 0, 1280, 720, "Black");
	Fade("BlackAll", 100, 400, null, true);
	CreateTexture360("背景１", 200, 0, 0, "cg/bg/bg100_01_1_AH診察室_a.jpg");
	Stand("st志乃_白衣_通常","worry", 300, @150);
	FadeStand("st志乃_白衣_通常_worry", 500, true);
	Fade("white10", 200, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601033]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19701340hd">
「高科先生は、もういません……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("white10", 200, 1000, null, true);
	FadeStand("st志乃_白衣_通常_worry", 500, true);
	Delete("背景１");
	Delete("BlackAll");
	Fade("white10", 200, 0, null, true);
	Delete("white10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602033]
その１週間後、高科先生は遺体となって発見された。

ゴクリと、息を呑む。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19701350ta">
「あの人が……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19701360ta">
「真犯人……？」

“見れば”分かることだ。
あの人の、心を――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

}


function Sword()
{

	while(1)
	{

	Fade("@覚醒２", 50, 1000, null, true);
	Fade("@覚醒３", 50, 1000, null, true);
	Fade("@覚醒３", 100, 0, null, false);
	Fade("@覚醒２", 100, 0, null, true);
	Fade("@覚醒２", 150, 1000, null, true);
	Fade("@覚醒３", 150, 1000, null, true);
	Fade("@覚醒３", 200, 0, null, false);
	Fade("@覚醒２", 250, 0, null, true);

	}
}
