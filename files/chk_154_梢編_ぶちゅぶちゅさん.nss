//<continuation number="540">

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_154_梢編_ぶちゅぶちゅさん";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_154_梢編_ぶちゅぶちゅさん();
}


function chk_154_梢編_ぶちゅぶちゅさん()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編
//ＢＧ//校門前・夕方
//ＳＥ//チャイムの音
	CreateSE("SE01","SE_日常_チャイム");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateSE("SE3601","SE_日常_雑踏01");
	MusicStart("SE3601",2000,300,0,1000,null,true);


	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg016_02_2_学校校門_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
放課後。チャイムが鳴るなり、僕は教室を出た。

//※１０月３日修正、以下
//相変わらずクラスのＤＱＮたちは僕のことをエスパーだとバカにして絡んでくる。今日だけで五回もちょっかいを出された。
//※１０月３日修正、以上
相変わらずクラスのＤＱＮたちは僕のことをエスパーだとバカにして絡んでくる。今日だけで５回もちょっかいを出された。

ホント、暇なヤツらだよ……。
他人をいじめてからかうことしか楽しみがないのか。
なにがリア充だよ。笑わせるな。

引きこもってエンスーやって、星来たんとのめくるめく妄想に浸っている僕の方が、よっぽど幸せだ。

……悔しい。ＤＱＮどもへの悔しさが溢れて、ひたすら心の中で悪態をつき続けて、帰路についた。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700010ko">
「たーくーみーしゃん♪」

その僕の肩を、背後からこずぴぃがつんつんとつついてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","normal", 200, @-150);
	FadeStand("bu梢_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700020ko">
「一緒にい～っしょに、帰りましょー」

僕を守ってくれる気になったの？

{	Stand("bu梢_制服_通常","smile", 200, @-150);
	FadeStand("bu梢_制服_通常_smile", 300, true);
	DeleteStand("bu梢_制服_通常_normal", 0, true);}
//◆「んーん」＝「ううん、そんなことないよ」というニュアンス
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700030ko">
「んーん。でもね、拓巳しゃんにプレゼントがあるのれ～す♪」

プレゼント……だって……？
フラグが立ったっていうことかな。

{	Stand("bu梢_制服_正面","normal", 200, @-150);
	DeleteStand("bu梢_制服_通常_smile", 300, false);
	FadeStand("bu梢_制服_正面_normal", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700040ko">
「うぴ？　ふらぐってな～に？」

いや、なんでもない……。

{	Stand("bu梢_制服_通常","smile", 200, @-150);
	DeleteStand("bu梢_制服_正面_normal", 300, false);
	FadeStand("bu梢_制服_通常_smile", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700050ko">
「というわけでね、この間の、憩いの場所にれっつごーなのら！」

{	DeleteStand("bu梢_制服_正面_normal", 500, true);}
憩いの場所って、まさか――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, null);
	SetVolume("SE3601", 1000, 0, null);


//ＢＧ//Ｒｏｆｔ店内階段

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	Wait(500);

	CreateSE("SE03","SE_はいけい_しーでーしょっぷ店内_LOOP");
	MusicStart("SE03", 3000, 500, 0, 1000, null, true);

	DeleteStand("bu梢_制服_通常_smile", 0, true);
	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg061_01_2_Ｒｏｆｔ店内階段_a.jpg");
	Delete("back01");

	FadeDelete("Black", 1000, true);
	Wait(800);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
やっぱりここか……。
確かにここは人がほとんど通らないけど、所詮は階段だからなあ。
なんとなく落ち着かない。

店員にマークされそうな気もするし。

しかも僕とこずぴぃだと、テレパシーもどきの会話をしてるから声を出すことがない。傍目からは無言のまま表情だけコロコロと変えているキモい男女に見えるだろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","sad", 200, @-150);
	FadeStand("bu梢_制服_通常_sad", 500, true);
	CreateSE("SE01","SE_じん体_動作_手_らんどせる漁る");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700060ko">
「うぷぅ。こずぴぃ、キモいかな？」

さすがに、ずっと無言だからね……。

{	Stand("bu梢_制服_正面","normal", 200, @-150);
	DeleteStand("bu梢_制服_通常_sad", 300, false);
	FadeStand("bu梢_制服_正面_normal", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700070ko">
「でもナイショ話を聞かれることは、な～いよ？」

ナイショ話をするつもりなの？

{	Stand("bu梢_制服_通常","smile", 200, @-150);
	DeleteStand("bu梢_制服_正面_normal", 300, false);
	FadeStand("bu梢_制服_通常_smile", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700080ko">
「しないつもりなの～♪」

……こずぴぃのテンションは、相変わらず疲れる。

//■３６０
{	Stand("bu梢_制服_通常","sad", 200, @-150);
	FadeStand("bu梢_制服_通常_sad", 300, true);
	DeleteStand("bu梢_制服_通常_smile", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700090ko">
//「うぴょ、ご、ごめんなさいなのら……。こずぴぃ、疲れるかな？　なるべくね、疲れないよ～うにするの……」
「うぴょ、ご、ごめんなさいなのら……。こずぴぃ、疲れるかな？　なるべくね、疲れないようにするの」

いいから話を進めて。
僕にプレゼントって？

{	Stand("bu梢_制服_通常","normal", 200, @-150);
	FadeStand("bu梢_制服_通常_normal", 300, true);
	DeleteStand("bu梢_制服_通常_sad", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700100ko">
「そ～そ～！　えっとね、こずぴぃはいっつも、お友達になった人に～人に～、プレゼントしてるのれ～す」

{	MusicStart("SE01",0,1000,0,1000,null,false);}
言いながら、バッグの中をごそごそと漁り出す。

{	DeleteStand("bu梢_制服_通常_norma", 500, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700110ko">
「セナしゃんにもあげたんだよ。ん～と、ん～と～」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梢_制服_通常_normal", 500, true);

	SetVolume("SE01", 1000, 0, null);
	SetVolume("SE03", 1000, 0, null);

	CreateTexture360("梢あめちゃん", 300, 0, 96, "cg/ev/ev133_02_6_梢ほのぼの_a.jpg");
	Fade("梢あめちゃん", 0, 0, null, true);
	Move("梢あめちゃん", 1000, @0, @-96, Dxl1, false);
	Fade("梢あめちゃん", 1000, 1000, null, true);

	Delete("back*");

	BGMPlay360("CH05", 0, 1000, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700120ko">
「そだ！　拓巳しゃんは、キャンディさん、なめなめするかな？」

キャンディを一個、差し出される。
バッグの中になにを入れてるんだよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("梢ビーズ手だけ", 300, 0, 0, "cg/ev/ev133_04_6_梢ほのぼの_a.jpg");
	Fade("梢ビーズ手だけ", 0, 0, null, true);
	Fade("梢ビーズ手だけ", 300, 1000, null, true);
	Delete("梢あめちゃん");

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
とりあえず受け取り、包みをほどいて口の中に放り込んだ。
レモン味だった。爽やかな酸味が広がる。

こずぴぃのプレゼントって、これ？

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700130ko">
「ち～がうよ。それはね、こずぴぃがいっつもなめなめしてるキャンディさんなのら」

知らんがな……。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700140ko">
「プレゼントは～、こ～れなの～！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_のぞく");
	MusicStart("SE01",0,1000,0,1000,null,false);

//ＢＧ//こずぴぃビーズコレクション
//※↑なくても可
	CreateTexture360("梢ビーズコレクション", 300, 0, 0, "cg/bg/bg234_01_6_chnビーズコレクション_a.jpg");
	Fade("梢ビーズコレクション", 0, 0, null, true);
	Fade("梢ビーズコレクション", 500, 1000, null, true);

	Wait(1000);

	Delete("梢ビーズ手だけ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
嬉しそうに取り出したのは、色とりどりのビーズで作られた、ファンシーな小物の数々だった。

な、なんぞこれ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("梢ビーズ", 300, 0, 0, "cg/ev/ev133_03_6_梢ほのぼの_a.jpg");
	Fade("梢ビーズ", 0, 0, null, true);
	Move("梢ビーズ", 1000, @0, @-96, Dxl1, false);
	Fade("梢ビーズ", 500, 1000, null, true);

	Delete("梢ビーズコレクション");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700150ko">
「“ぶちゅぶちゅさん”でーす」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700160ko">
「ブレスとかぁ、ケータイのストラップとかぁ、指輪もあるし、ヘアピンも、チャームもあるよ～」

これ、こずぴぃの手作り？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Move("梢ビーズ", 1000, @0, @96, Dxl1, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700170ko">
「んとね、ちがうよ」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700180ko">
「こずぴぃが手芸をやろうとすると、ぐちゃぐちゃどっかーんってなっちゃうのら」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700190ko">
「これはね、ママが作ってくれるんだよ～。こずぴぃがビーズだ～い好きだから、全部ぶちゅぶちゅさんなのら」

こずぴぃはいきなり、僕の手を取った。
その温かさ、柔らかさに、ドキッとしてしまう。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700200ko">
「うぴょ？　拓巳しゃん、ドキッてしたね～」

だって、不意打ちだったし……。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700210ko">
「拓巳しゃんがドキッてすると、こずぴぃもドキンドキンってしちゃうの～」

それでも笑顔を崩さず、こずぴぃは僕の手にビーズアクセサリーを乗せてきた。どうやらケータイストラップみたいだ。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700220ko">
「はい、これ、あげまーすね♪」

いらないし……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg061_01_2_Ｒｏｆｔ店内階段_a.jpg");
	FadeDelete("梢ビーズ", 500, true);

	Stand("bu梢_制服_通常","sad", 200, @-150);
	FadeStand("bu梢_制服_通常_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700230ko">
「ふぇう……！？　もしかしてこずぴぃ、迷惑だった？　だった？」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700240ko">
「お友達には～、みんなにね、ぶちゅぶちゅさんあげてるんだよ……」

一転して涙ぐんでいる。
くぅ、すぐ泣くな、この子……。

だってこれ、どれも女の子が身に付けるようなものじゃないか。僕が持ってたって、気色悪いだけだよ……。

{	Stand("bu梢_制服_正面","sad", 200, @-150);
	DeleteStand("bu梢_制服_通常_sad", 300, false);
	FadeStand("bu梢_制服_正面_sad", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700250ko">
「うぷぅ、そうだったのら……。んじゃ、拓巳しゃんはプレゼントされても困っちゃうだけだね～……」

//※１０月３日修正、以下（セリフ部分ではありますがテキストのみ修正で音声に影響無し）
//「これあげる人、二人目だった～のに、グッスンなのら……」
//※１０月３日修正、以上
//◆心の声
//【梢】
//ＶＦ//心の声
<voice name="梢" class="こずえ" src="voice/chn04/00700260ko">
「これあげる人、２人目だった～のに、グッスンなのら……」

しゅんとして、こずぴぃは僕の手に乗せたストラップを回収しようとした。でも僕はその手を引っ込め、自分の上着のポケットにねじ込む。

{	Stand("bu梢_制服_正面","normal", 200, @-150);
	FadeStand("bu梢_制服_正面_normal", 300, true);
	DeleteStand("bu梢_制服_正面_sad", 0, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700270ko">
「拓巳しゃん……？」

やっぱり……もらっとくよ……。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700280ko">
「うぴ？　なんでなんで？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//※１０月３日修正、以下
//“お友達みんなにあげている”なんて言っておきながら、こうして実際に誰かにプレゼントするのは僕で二人目って。
//※１０月３日修正、以上
“お友達みんなにあげている”なんて言っておきながら、こうして実際に誰かにプレゼントするのは僕で２人目って。

//※１０月３日修正、以下
//きっと一人目はセナだろう。間違いない。
//※１０月３日修正、以上
つまりこずぴぃには友達がいないってこと。
きっと１人目はセナだろう。間違いない。

だから――

{	Stand("bu梢_制服_正面","sad", 200, @-150);
	FadeStand("bu梢_制服_正面_sad", 300, true);
	DeleteStand("bu梢_制服_正面_normal", 0, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700290ko">
「同情したのれすね」

しまった、こずぴぃには思考を全部読まれるんだった……。

正直なことを言うと、同情であると同時に、こずぴぃは僕と似てるって思ったんだ。

{	Stand("bu梢_制服_通常","normal", 200, @-150);
	DeleteStand("bu梢_制服_正面_sad", 300, false);
	FadeStand("bu梢_制服_通常_normal", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700300ko">
「うん♪　あのねあのね、こずぴぃもおんな～じこと思ったよ」

//◆「がっこ～」＝学校
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700310ko">
「こずぴぃが初めてがっこ～行ったとき、拓巳しゃんを見てね、すんごく辛そうだな～って思ったのら」

{	Stand("bu梢_制服_通常","smile", 200, @-150);
	FadeStand("bu梢_制服_通常_smile", 300, true);
	DeleteStand("bu梢_制服_通常_normal", 0, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700320ko">
「こずぴぃも辛かったから、一緒だ～♪　って、ホッとしたの～」

一緒、か……。

セナが話してくれた、こずぴぃの転校前の話を思い出す。

僕らは、周囲の悪意に翻弄されて心を閉ざした、似た者同士。
人混みを避けて、人との接触を避けて、人に怯えて、こんな薄暗い階段で縮こまっている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("@CH*", 5000, 0, null);

	CreateTexture360("梢ほのぼの", 300, 0, 96, "cg/ev/ev133_01_6_梢ほのぼの_a.jpg");
	Fade("梢ほのぼの", 0, 0, null, true);
	Move("梢ビーズ", 1000, @0, @-96, Dxl1, false);
	Fade("梢ほのぼの", 500, 1000, null, true);

	DeleteStand("bu梢_制服_通常_smile", 0, true);
	Delete("back*");
	CreateColor("下敷き", 50, 0, 0, 1280, 720, "BLACK");

	CreateSE("SE3603","SE_はいけい_しーでーしょっぷ店内_LOOP");
	MusicStart("SE3603", 3000, 500, 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700330ko">
「ただ普通にね、生きたいだけなのにね……」

ぶちゅぶちゅさんのアクセを手の中で弄びながら、こずぴぃは遠い目をした。

//■３６０
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700340ko">
//「お友達作って、一緒に遊んだりして、一緒にお弁当食べたり、一緒にお勉強したり、文化祭とかの行事を一緒に頑張ったり、一緒に恋のお話したり」
「お友達作って、一緒に遊んだりして、一緒にお弁当食べたり、一緒にお勉強したり、文化祭とかの行事を一緒に頑張ったり、一緒に恋のお話をしたり」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700350ko">
「そんなね、普通の生活で、じゅ～ぶんだったのら」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700360ko">
「特別なことなんて、な～んにも望んでなかったよ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Fade("梢ほのぼの", 300, 0, null, true);

//おがみ：SE：ビーズぶちまけ
	CreateSE("SE01","SE_擬音_服がやぶれる");
	MusicStart("SE01",0,1000,0,1000,null,false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
ふと、こずぴぃの顔から表情が消えた。
弄んでいたぶちゅぶちゅさんを、引きちぎる。
ビーズが、階段にぶちまかれて、転がっていく。

僕も、同じことをいつも考えている。
なんで自分だけが、こんな目にあわなくちゃいけないのかって。
僕がなにか悪いことをしたのかよ、って。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700370ko">
「こずぴぃはね、悪いこと、したよ」

小さく舌を出して、こずぴぃは笑顔を取り戻す。

悪いこと……？
同級生の腕をぶった切ったこと？
それとも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("梢ほのぼの", 500, 1000, null, true);
	Delete("下敷き");
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700380ko">
「殺したいって願ったもん」

//■３６０
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700390ko">
//「こずぴぃにいじわるする人たち全員、ぶち殺したいって、願っちゃったも～ん♪」
「こずぴぃにいじわるする人たち全員、ぶち殺したいーって、願っちゃったも～ん♪」

……やっぱりこずぴぃは、歪んでる。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700400ko">
「でもでもぉ、悪いことを願うのは、悪いことじゃないよ？」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700410ko">
「ん？　あれれ？　悪いことを願うのが、悪い？　悪いから、悪いことを願うのかな？　わる？　悪い？　わるわるで～すね」

//■３６０
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700420ko">
//「とにか～く！“負の感情は、否定されるものじゃない”って、ヘンテコボードを持ったおじしゃんが言ってたのら」
「とにか～く！“負の感情は、否定されるものじゃない”って、ヘンテコなボードを持ったおじしゃんが言ってたのら」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700430ko">
「悪いことを願ったから、ディソードがこずぴぃの力になってくれるのら。ディソードがこずぴぃを守ってくれるのら」

//■３６０
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700440ko">
//「だからね、も～う、普通なんていらないの」
「だからね、もう、普通なんていらないの」

ホントに……？
こずぴぃはホントにもう、普通の人生を送ることを放棄したの？
それでいいの？　後悔しないの？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 5000, 0, NULL);

	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg061_01_2_Ｒｏｆｔ店内階段_a.jpg");
	FadeDelete("梢ほのぼの", 500, true);

	Stand("bu梢_制服_通常","angry", 200, @-150);
	FadeStand("bu梢_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700450ko">
「めんどくさいのはイヤなの～」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700460ko">
「世界には悪い人ば～っかりだし」

セナも？　彼女も悪い人だって思ってる？

{	Stand("bu梢_制服_通常","smile", 200, @-150);
	FadeStand("bu梢_制服_通常_smile", 300, true);
	DeleteStand("bu梢_制服_通常_angry", 0, false);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700470ko">
「セナしゃんは、お友達れ～す♪」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700480ko">
「悪い人じゃないよ」

届いてくるこずぴぃの心の声は、すごく嬉しそうだ。

{	Stand("bu梢_制服_通常","normal", 200, @-150);
	FadeStand("bu梢_制服_通常_normal", 300, true);
	DeleteStand("bu梢_制服_通常_smile", 0, false);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700490ko">
「あとね、拓巳しゃんもだよ」

{	Stand("bu梢_制服_通常","smile", 200, @-150);
	FadeStand("bu梢_制服_通常_smile", 300, true);
	DeleteStand("bu梢_制服_通常_normal", 0, false);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700500ko">
「ぶちゅぶちゅ友達なのら♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu梢_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
こずぴぃみたいな考え方ができたら、きっと楽なんだろうな……。
それとも、一度壊れちゃったこそ、こずぴぃはそういう考え方をするようになったんだろうか。

僕は、そこまで割り切れない。
普段、さんざん周囲に対して――脳内で――文句ばっかり言ってるけど、結局のところ、誰かに助けてほしいって期待ばかりしてるんだ。

似てると思ったけど、僕は、やっぱりこずぴぃとは、違う……。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700510ko">
「ううん。一緒なのら」

なぜかこずぴぃは、確信に満ちた態度だった。
そして勢いよく立ち上がる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_擬音_ちを蹴る");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

//	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
//	Fade("Black", 0, 0, null, true);
//	Fade("Black", 500, 1000, null, true);
//	FadeDelete("Black", 500, true);

	Stand("st梢_制服_通常","normal", 200, @-150);
	FadeStand("st梢_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700520ko">
「ほいじゃ、帰りましょ～う」

{	DeleteStand("st梢_制服_通常_normal", 500, true);}
そしてさっさと階段を駆け下りていった。

{	CreateSE("SE05","SE_衝撃_せ中を押される");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);}
最後の一段、というところで足を滑らせ、べしゃっと転ぶところが、いかにもこずぴぃらしかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//Ｒｏｆｔ店内
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg059_01_2_Ｒｏｆｔ店内_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);

	Wait(500);

	Delete("back02");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//※１０月３日修正、以下
//こずぴぃは膝を少し引きずりながら、涙目で歩く。
//※１０月３日修正、以上
Ｒｏｆｔの店内は、相変わらず混み合っている。
こずぴぃは片足を少し引きずりながら、涙目で歩く。

――大丈夫？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_通常","shy2", 200, @-150);
	FadeStand("st梢_制服_通常_shy2", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700530ko">
「えへへ。転ぶのは～慣れてるよ」

気丈な笑み。

{	Stand("st梢_制服_正面","sigh", 200, @-150);
	DeleteStand("st梢_制服_通常_shy2", 300, false);
	FadeStand("st梢_制服_正面_sigh", 300, true);}
けれど、その笑みがすぐに凍り付いた。
立ち止まった彼女の視線は、僕の背後へと向けられている。

{	DeleteStand("st梢_制服_正面_sigh", 500, true);}
僕もつられてそっちを見ると、そこにはたくさんの鏡が売られていた。
手鏡から姿見まで、様々な種類が置かれている。
ちょうど大きな姿見に、僕とこずぴぃが映り込んでいた。

こずぴぃは表情を引きつらせたまま、その鏡から目をそらし、足早に立ち去ってしまう。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00700540ko">
「拓巳しゃん、また明日ね……」

心の声にも、さっきまでの元気はなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE36*", 2000, 0, null);

//～～Ｆ・Ｏ

	ClearAll(2000);
	Wait(1000);
}
