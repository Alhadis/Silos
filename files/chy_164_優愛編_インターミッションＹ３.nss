//<continuation number="490">

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_164_優愛編_インターミッションＹ３";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_164_優愛編_インターミッションＹ３();
}


function chy_164_優愛編_インターミッションＹ３()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	$YuaVoice=true;

//★優愛編
//■インターミッションＹ３

//■アイキャッチIN
	IntermissionIn();

	Delete("*");
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");

//■アイキャッチOUT
	IntermissionIn2();

	Wait(1000);


//ＢＧ//黒
//美愛は優愛よりテンション低め

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg077_01_1_渋谷マクディ店内_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200010ma">
「あの日、わたしたちは入れ替わった――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//渋谷マクディ
	CreateSE("SE3601","SE_はいけい_まくでぃ_LOOP");
	MusicStart("SE3601", 3000, 1000, 0, 1000, null, true);
	FadeDelete("Black", 1500, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
渋谷のマクディは、夕方になって学生の姿が目立つようになった。
女子高生たちが、甲高い笑い声を上げながら、楽しそうに話している。
わたしは一度、窓の外を眺め、それからケータイを取り出した。

９月７日、１７時０２分。
待ち合わせの時間より２分過ぎている。

わたしは少し苛つきながら、チキンバーガーにかじりついた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","normal", 200, @+280);
	FadeStand("st優愛_制服_通常_normal", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//◆優愛→翠明制服、眼鏡あり、美愛→別高校制服、眼鏡なし
//◆以下、かわいいモードの優愛
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200020yu">
「ごめん、美愛ちゃん。待たせちゃった？」

{	DeleteStand("st優愛_制服_通常_normal", 300, true);}
優愛ちゃんが、トレーを片手に姿を見せた。
わたしの対面に座り、小さく息をつく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu美愛_制服_通常左手下","hard", 200, @-320);
	FadeStand("bu美愛_制服_通常左手下_hard", 300, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603001]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200030ma">
「うん、待った」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常","smile", 210, @+320);
	FadeStand("bu優愛_制服_通常_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text360401]
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200040yu">
「５分くらい、おまけしてほしいな。あ、美愛ちゃんもチキンバーガー？　わたしもだよ」

そう言って、トレーに置かれたチキンバーガーを指し示す。
双子なんだから、好みが似るのは当然。いちいち確認しなくたっていいのに、優愛ちゃんは嬉しそう。

//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200050yu">
「美愛ちゃんとこうして渋谷で会うのって、初めてだよね」

わたしは通ってる学校が渋谷じゃないし、家に帰ればいつでも会えるんだから、わざわざ学校帰りに渋谷で会う機会なんてない。ただそれだけ。

{	Stand("bu優愛_制服_通常","normal", 210, @+320);
	FadeStand("bu優愛_制服_通常_normal", 300, true);
	DeleteStand("bu優愛_制服_通常_smile", 0, true);}
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200060yu">
「わたしにお願いしたいことって、なに？　わたしにできることなら、なんでも言ってね」

わたしはチキンバーガーを平らげ、アイスティでのどを潤わせてから、優愛ちゃんの方へ身を乗り出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu美愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu美愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu美愛_制服_通常左手下_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200070ma">
「実は、これから、人と会うんだけど……」

//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200080yu">
「カレシ？」

{	Stand("bu美愛_制服_通常左手下","hard", 200, @-320);
	DeleteStand("bu美愛_制服_通常左手下_worry", 300, false);
	FadeStand("bu美愛_制服_通常左手下_hard", 300, true);}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200090ma">
「そんなんじゃない。今まで一度も会ったことない人たち」

//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200100yu">
「たち、って、何人？」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200110ma">
「４人、かな」

//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200120yu">
「どういう関係なの？」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200130ma">
「ネットで知り合った人。別にやましい関係とかじゃないから。アニメのファンサイトみたいな掲示板があるんだけど、そこで」

{	Stand("bu優愛_制服_通常","shock", 210, @+320);
	FadeStand("bu優愛_制服_通常_shock", 300, true);
	DeleteStand("bu優愛_制服_通常_normal", 0, true);}
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200140yu">
「へえ、わたし、インターネットなんてまったくやらないから、よく分からないけど、そうやってネットで知り合うことって、よくあるの？」

{	Stand("bu美愛_制服_通常左手下","shy", 200, @-320);
	DeleteStand("bu美愛_制服_通常左手下_hard", 300, false);
	FadeStand("bu美愛_制服_通常左手下_shy", 300, true);}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200150ma">
{#TIPS_オフ会 = true;$TIPS_on_オフ会 = true;}「まあね。でも、<FONT incolor="#88abda" outcolor="BLACK">オフ会</FONT>はわたしも初めてで……」

{$TIPS_on_オフ会 = false;}
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200160yu">
「美愛ちゃん、人見知りだもんね」

{	Stand("bu美愛_制服_通常左手下","hard", 200, @-320);
	FadeStand("bu美愛_制服_通常左手下_hard", 300, true);
	DeleteStand("bu美愛_制服_通常左手下_shy", 0, true);}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200170ma">
「人見知りじゃない。人に合わすのが苦手なだけ」

{	Stand("bu優愛_制服_通常","smile", 210, @+320);
	FadeStand("bu優愛_制服_通常_smile", 300, true);
	DeleteStand("bu優愛_制服_通常_shock", 0, true);}
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200180yu">
「うふふ、そういうことにしておいてあげる。で、大丈夫なの？　初めての人たち相手に、うまく話せそう？」

{	Stand("bu美愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu美愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu美愛_制服_通常左手下_hard", 0, true);}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200190ma">
「本当は、会おうと思ってたんだけど……今になって、やっぱり……」

{	Stand("bu優愛_制服_通常","normal", 210, @+320);
	FadeStand("bu優愛_制服_通常_normal", 300, true);
	DeleteStand("bu優愛_制服_通常_smile", 0, true);}
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200200yu">
「怖くなっちゃったんだ」

{	Stand("bu美愛_制服_通常左手下","hard", 200, @-320);
	FadeStand("bu美愛_制服_通常左手下_hard", 300, true);
	DeleteStand("bu美愛_制服_通常左手下_worry", 0, true);}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200210ma">
「めんどくさくなっただけ。でも、ドタキャンするのも悪いし、だから」

//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200220yu">
「わたしが代わりに行けばいいのね」

優愛ちゃんは察しがいい。わたしの言おうとしていることを、たいてい先回りして理解してしまう。その察しのよさに苛つくこともあるけど、今日に限っては説明する手間が省けて助かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu美愛_制服_通常左手下","normal", 200, @-320);
	FadeStand("bu美愛_制服_通常左手下_normal", 300, true);
	DeleteStand("bu美愛_制服_通常左手下_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200230ma">
「……そういうこと。お願い、していい？」

{	Stand("bu優愛_制服_通常左手下","worry", 210, @+320);
	DeleteStand("bu優愛_制服_通常_normal", 300, false);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);}
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200240yu">
「別にいいけど、美愛ちゃんはそれでいいの？　友達を作れるチャンスなのに」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200250ma">
「そんな、小学生みたいな扱いしないでよ。別に、友達を作りたいわけじゃないし」

//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200260yu">
「もう、美愛ちゃんは本当に意地っ張りなんだから」

{	Stand("bu美愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu美愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu美愛_制服_通常左手下_normal", 0, true);}
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200270ma">
「……行ってくれる？」

{	Stand("bu優愛_制服_通常","normal", 210, @+320);
	DeleteStand("bu優愛_制服_通常左手下_worry", 300, false);
	FadeStand("bu優愛_制服_通常_normal", 300, true);}
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200280yu">
「うん、分かった。わたしは、楠美愛になり切ればいいのよね」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200290ma">
「そこまでしなくてもいいけど……」

{	Stand("bu優愛_制服_通常","smile", 210, @+320);
	FadeStand("bu優愛_制服_通常_smile", 300, true);
	DeleteStand("bu優愛_制服_通常_normal", 0, true);}
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200300yu">
「どうせなら、とことんやった方が面白いじゃない。そうだ、制服も入れ替えようよ」

//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200310ma">
「なんでそんなにはしゃいでるの？」

//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200320yu">
「美愛ちゃんから頼み事されるなんて、滅多にないでしょ？　だから、嬉しいの」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st美愛_制服_通常左手下","sad", 200, @-280);
	DeleteStand("bu美愛_制服_通常左手下_worry", 300, true);
	FadeStand("st美愛_制服_通常左手下_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【美愛】
<voice name="優愛" class="優愛" src="voice/chn03/01200330ma">
「優愛ちゃん、バカみたい」

{	Stand("st優愛_制服_通常","normal", 200, @+280);
	DeleteStand("bu優愛_制服_通常_smile", 300, true);
	FadeStand("st優愛_制服_通常_normal", 300, true);}
//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200340yu">
「どうせバカなお姉さんですよ～だ」

//【優愛】
<voice name="美愛" class="美愛" src="voice/chn03/01200350yu">
「ほら、そうと決まれば着替えちゃおうよ」

優愛ちゃんが、わたしの手を強引に引っ張って。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume("SE01", 2000, 100, null);

//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	DeleteStand("st美愛_制服_通常左手下_sad", 0, true);
	DeleteStand("st優愛_制服_通常_normal", 0, true);

	CreateSE("SE01","SE_日常_し切り扉_開く");
	MusicStart("SE01",0,1000,0,1000,null,false);

	Wait(1000);

	CreateSE("SE02","SE_じん体_動作_のぞく");
	MusicStart("SE02",0,1000,0,1000,null,false);

	Wait(1000);

	CreateSE("SE03","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE03",0,1000,0,1000,null,false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
トイレの個室に入って、わたしたちは着ているものも、持っているものも、交換した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：「美愛_制服～メガネあり」や「優愛_別制服_」が必要だと思われますが、ダミーやリストにございません。
//とりあえず、普通の美愛を表示致します
//ＢＧ//渋谷マクディ
//優愛→別高校制服、眼鏡あり、美愛→翠明制服、眼鏡なし
	$YuaVoice=false;

	CreateSE("SE01","SE_日常_し切り扉_開く");
	MusicStart("SE01",0,1000,0,1000,null,false);

//▼べー：こっちが優愛です
	Stand("st美愛_制服_通常_メガネあり","smile", 200, @+280);
	FadeStand("st美愛_制服_通常_メガネあり_smile", 300, true);

	SetVolume("SE01", 2000, 100, null);

	Fade("Black", 1000, 0, null, true);

//おがみ：音声：class入れ替え▼ここから

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【優愛】
<voice name="優愛" class="美愛" src="voice/chn03/01200360yu">
「美愛ちゃん、翠明の制服、似合うね。きっと、お父さんやお母さんでも、どっちがどっちなのか、見分け付かないよ」

//【優愛】
<voice name="優愛" class="美愛" src="voice/chn03/01200370yu">
「あ、でも眼鏡かけてたら一発でバレちゃうかな。これも外して……いくのはちょっと難しいかも。なんにも見えなくなっちゃう」

{	Stand("st優愛_制服_通常左手下_メガネなし","sad", 200, @-280);
	FadeStand("st優愛_制服_通常左手下_メガネなし_sad", 300, true);}
//【美愛】
<voice name="美愛" class="優愛" src="voice/chn03/01200380ma">
「初対面の相手なんだから、ここまでしなくてもよかったのに」

{	Stand("st美愛_制服_通常_メガネあり","normal", 200, @+280);
	FadeStand("st美愛_制服_通常_メガネあり_normal", 300, true);
	DeleteStand("st美愛_制服_通常_メガネあり_smile", 0, true);}
//【優愛】
<voice name="優愛" class="美愛" src="voice/chn03/01200390yu">
「もう、まだ言ってるし。待ち合わせの時間、そろそろなんでしょう？　それまで打ち合わせしておこうよ。わたし、アニメのことちっとも分からないけど、なにを話せばいいの？」

{	Stand("st優愛_制服_通常左手下_メガネなし","hard", 200, @-280);
	FadeStand("st優愛_制服_通常左手下_メガネなし_hard", 300, true);
	DeleteStand("st優愛_制服_通常左手下_メガネなし_sad", 0, true);}
//【美愛】
<voice name="美愛" class="優愛" src="voice/chn03/01200400ma">
「適当に相づち打ってればいいよ。どうせ１回こっきりしか会わない人たちなんだし」

{	Stand("st美愛_制服_通常_メガネあり","hard", 200, @+280);
	FadeStand("st美愛_制服_通常_メガネあり_hard", 300, true);
	DeleteStand("st美愛_制服_通常_メガネあり_normal", 0, true);}
//【優愛】
<voice name="優愛" class="美愛" src="voice/chn03/01200410yu">
「そんなことないよ。この出会いを通して、お友達付き合いすることになるかもしれないでしょう？　もしかしたら、カレシもできちゃうかも」

//【美愛】
<voice name="美愛" class="優愛" src="voice/chn03/01200420ma">
「興味ない」

{	Stand("st美愛_制服_通常_メガネあり","smile", 200, @+280);
	FadeStand("st美愛_制服_通常_メガネあり_smile", 300, true);
	DeleteStand("st美愛_制服_通常_メガネあり_hard", 0, true);}
//◆楽しそうに
//【優愛】
<voice name="優愛" class="美愛" src="voice/chn03/01200430yu">
「あるくせに。なかったら、会う約束なんてしないもの」

//【美愛】
<voice name="美愛" class="優愛" src="voice/chn03/01200440ma">
「……うるさいなあ」

//【優愛】
<voice name="優愛" class="美愛" src="voice/chn03/01200450yu">
「頑張って、楠美愛はとってもいい子です、っていうのを印象付けてくるね」

{	Stand("st優愛_制服_通常左手下_メガネなし","sad", 200, @-280);
	FadeStand("st優愛_制服_通常左手下_メガネなし_sad", 300, true);
	DeleteStand("st優愛_制服_通常左手下_メガネなし_hard", 0, true);}
//【美愛】
<voice name="美愛" class="優愛" src="voice/chn03/01200460ma">
「本当に、そういうのはいいってば……」

そんなことされたら、ますます２回目に自分で会うことができなくなる。
わたしは、優愛ちゃんほど社交的じゃないから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：音声：class入れ替え▲ここまで

	SetVolume("SE3601", 1000, 0, null);

	Wait(1000);

	PrintBG(2000);

//ＢＧ//渋谷駅前・夕方
	CreateSE("SE3602","SE_日常_雑踏02");
	MusicStart("SE3602", 1000, 1000, 0, 1000, null, true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg079_01_2_渋谷駅前_a.jpg");

	DrawTransition("back*", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);

	Wait(500);

	Stand("st美愛_制服_通常_メガネあり","smile", 200, @+150);
	FadeStand("st美愛_制服_通常_メガネあり_smile", 500, true);

//おがみ：音声：class入れ替え▼ここから

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【優愛】
<voice name="優愛" class="美愛" src="voice/chn03/01200470yu">
「それじゃ、行ってくるね」

//【美愛】
<voice name="美愛" class="優愛" src="voice/chn03/01200480ma">
「よろしく。そこまで頑張らなくていいから」

//【優愛】
<voice name="優愛" class="美愛" src="voice/chn03/01200490yu">
「はいはい。うふふ。じゃあねー、美愛ちゃん」

{	FadeDelete("st美愛_制服_通常_メガネあり_smile", 500, true);}
優愛ちゃんはにこやかに手を振る。
わたしの制服を着て。わたしのカバンを持って。
その格好のまま、楠美愛として、渋谷の雑踏の中に消えていった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：音声：class入れ替え▲ここまで

	SetVolume("SE3602", 2000, 0, null);

//ＢＧ//黒
	Wait(500);
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);
	Delete("背景１");


	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
それが、わたしが見た優愛ちゃんの最後の姿だった。

家に帰って、優愛ちゃんの帰りを待っていたわたしは、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音
//ＢＧ//集団ダイブ現場写真
	CreateSE("SE02","SE_衝撃_衝撃音01");
	SoundPlay("SE02", 0, 1000, false);
	CreateTexture360("back02", 100, 0, 0, "cg/ev/ev053_01_1_集団ダイブ現場写真_a.jpg");
	FadeDelete("Black", 100, true);


	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
テレビのニュースで、あの事件のことを知った――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

//■インターミッションＹ３終了

//アイキャッチ
//※拓巳視点に戻る

	ClearAll(2000);
	Wait(2000);
}

