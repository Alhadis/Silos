//<continuation number="700">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_054_判と諏訪と拓巳";
		$GameContiune = 1;
		Reset();
	}

		ch03_054_判と諏訪と拓巳();
}


function ch03_054_判と諏訪と拓巳()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg031_01_1_アニメエイト_a.jpg");
	Fade("背景１", 2000, 1000, null, true);
	
	CreateSE("SE01","SE_日常_雑踏02");
	SoundPlay("SE01", 2000, 500, true);

	Wait(1000);

//ＢＧ//神泉の街並み//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
今日は＠カフェには寄らず、アニメエイトに行ってきた。

理由はもちろん、待望のブラチュー星来たん覚醒後バージョンをゲットするためさ！

買うときに一瞬、優愛の顔が脳裏をよぎったけど、すぐに思考を停止させた。

店内に目玉商品としてディスプレイされてた星来たんを見たけど、原型師はキジマヨシオだけに出来はさすがの一言だよね。

早く帰って舐めるように隅々まで鑑賞しないと。ふひひ。

星来たんの笑顔をたまに眺めながらエンスーさえやっていれば、僕は幸せなんだ。

なのに、どうして三次元はことごとく僕に厄介事を運んでくるのか。
このときもそうだった。

ＦＥＳのことやら剣のことやらを忘れて、ウキウキした気分でベースに向かっていたら――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg014_01_2_神泉町並み_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Wait(1000);

//ＣＨ//バン
//ＣＨ//諏訪

	Stand("st安二_スーツ_通常","normal", 200, @-200);
	Stand("st護_スーツ_通常","hard", 200, @200);
	FadeStand("st安二_スーツ_通常_normal", 500, false);
	FadeStand("st護_スーツ_通常_hard", 500, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
あと５０メートルというところで、どう見ても普通とは違う雰囲気を漂わせた男２人組に遭遇してしまった。

目が合わないようにしてやり過ごそうと思ったけど、明らかに向こうは僕を見ている。

//【判】
<voice name="判" class="判" src="voice/ch03/05400010bn">
「そこの君、ちょっといいかい？」

２人組のうち最初に声をかけてきたのは、競輪場にいそうな冴えないおっさんだった。

髪はボサボサだし無精ヒゲは生えてるし、服装もよれよれスーツ、だらしなく結んだネクタイ、手入れされた形跡すらない革靴と、うだつのあがらなさと言ったらない。

なぜかうちわを持っていてパタパタと扇いでいるのも情けなさを強調させている。表情もユルい。ヘラヘラした笑みを浮かべている。

でも、一瞬だけ交わした目は、笑っていなかった。

逃げ場はなかった。僕がどう答えようか迷っているうちに、２人は僕のすぐそばまで歩み寄ってきていた。

//【判】
<voice name="判" class="判" src="voice/ch03/05400020bn">
「おじさん、こういう者なんだけどさ」

おっさんは懐から黒い手帳を取り出して、僕の方に掲げて見せる。
それはドラマなんかでよく見る警察手帳で、もちろん本物を見たのは初めてだった。

――ついに、来た。
思い当たる節はひとつしかない。『張り付け』だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【判】
<voice name="判" class="判" src="voice/ch03/05400030bn">
「ちょっと話を聞かせてもらっていいかい？」

{	Stand("st安二_スーツ_通常","pride", 200, @-200);
	FadeStand("st安二_スーツ_通常_pride", 200, false);
	DeleteStand("st安二_スーツ_通常_normal", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400040bn">
「もちろん強制じゃないんだけどね。あ、いやいや、そんな身構えなくていいよ。ホント、話聞くだけだから」

しゃべり方に威圧感はゼロだ。
ただ、もうひとりの若い方の刑事は、厳しい表情をしたままさりげなく僕の進行方向を遮るように立ち位置を変えていた。

汗がじわりとにじみ出してきた。ヘタな行動を取れば僕が犯人だと疑われて連行されちゃうかもしれない。そんなのイヤだ。

僕は観念して、小さくうなずいた。

{	Stand("st安二_スーツ_通常","normal", 200, @-200);
	FadeStand("st安二_スーツ_通常_normal", 200, false);
	DeleteStand("st安二_スーツ_通常_pride", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400050bn">
「えーっと、君さ、
俗に言うニュージェネレーションの狂気って知ってるかな？」

やっぱりだ……。
額の汗を拭いつつ、僕はそれにもうなずきを返す。

//【判】
<voice name="判" class="判" src="voice/ch03/05400060bn">
「じゃ、３番目に起きた通称『張り付け』殺人事件も当然知ってるよね？　この近所で起きたわけなんだけども」

//【判】
<voice name="判" class="判" src="voice/ch03/05400070bn">
「その目撃者を探してるわけよ」

//【判】
<voice name="判" class="判" src="voice/ch03/05400080bn">
「あ、ちなみに君、名前聞かせてくれる？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
たまらずゴクリと息を呑んだ。

もしかしてこれって、孔明の罠じゃないだろうか……。

警察を装って話を聞かせてって言っておきつつ、僕の個人情報を引き出して悪用しようと考えてる詐欺グループとか。あるいは例の悪魔女の手下とか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【判】
<voice name="判" class="判" src="voice/ch03/05400090bn">
「ん？　あれ、答えてくんないのかな？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400100ta">
「…………」

疑い出したらキリがない。
どうしよう。もし嘘の名前を言ったらそれだけで逮捕されちゃうかもしれないし……。

//【判】
<voice name="判" class="判" src="voice/ch03/05400110bn">
「ああ、個人情報保護法とか気にしてる？　おじさん、そんなに信用なさそうに見えるかな」

見えるよ……。

どうせその人の良さそうな喋り方だって演技だろ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400120ta">
「に、西條、拓巳……」

結局、どうすべきか思いつかなかったので、正直に答えるしかなかった。

//【判】
<voice name="判" class="判" src="voice/ch03/05400130bn">
「ニシジョウタクミ、クンでいいかい？」

僕はうなずく。

{	Stand("st安二_スーツ_通常","hard", 200, @-200);
	FadeStand("st安二_スーツ_通常_hard", 200, false);
	DeleteStand("st安二_スーツ_通常_normal", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400140bn">
「ホントに？」

はあ？

//※禁則処理08/11/17
ホントに、ってどういう意味だよ……。
せっかく人が正直に名乗ったのに、
そのリアクションはなんなんだよ……。

{	Stand("st安二_スーツ_通常","pride", 200, @-200);
	FadeStand("st安二_スーツ_通常_pride", 200, false);
	DeleteStand("st安二_スーツ_通常_hard", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400150bn">
//◆はっは＝笑い声
「はっは。いや、こりゃ失礼。今のは気にしないでくれ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400160ta">
「…………」

刑事のわざとらしい笑い声が、静かな住宅街に響いた。

うう、早く解放されたい……。

{	Stand("st安二_スーツ_通常","normal", 200, @-200);
	FadeStand("st安二_スーツ_通常_normal", 200, false);
	DeleteStand("st安二_スーツ_通常_pride", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400170bn">
「その制服、翠明だよね？　何年生？」

そんなことまで答えなくちゃいけないのか……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400180ta">
「２……」

//【判】
<voice name="判" class="判" src="voice/ch03/05400190bn">
「ん？　悪いね、聞き取れなかった。おじさん、もう歳だから耳遠くてさ。もう一度言ってくれる？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400200ta">
「に、２年生……」

//【判】
<voice name="判" class="判" src="voice/ch03/05400210bn">
「２年生ね。どうも」

{	SoundPlay("SE01", 2000, 300, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400220bn">
「で、ニシジョウさん。聞きたいことってのは、先月の２９日の午後６時から１０時頃にかけて、どこでなにしてたかなんだわ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400230ta">
「っ……！」

これって、アリバイってヤツ？
もしかして僕が疑われてるの……？
そんなバカな！

//【判】
<voice name="判" class="判" src="voice/ch03/05400240bn">
「いや、別に君を疑ってるわけじゃなくてさ。その時間にこの近くにいたなら、怪しい人物を見かけたとか、なにか音を聞いたとか、ないかと思ってね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400250ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//※禁則処理08/11/17
なんだかこの刑事の喋り方を聞いていると、すごくイライラしてくる……。

もしかしたら、相手を怒らせる喋り方っていうテクニックがあるのかもしれない。

ただ、怪しい人物なら、見た。この目で、はっきりと。

それをこのうさんくさそうなおっさんに言っていいのかどうか迷う。

もしそれを話して、悪魔女が報復に動いたらどうする？

今はどうやら悪魔女に見逃してもらってるみたいだけど、予知能力を持つ『将軍』を部下に持ってるんだぞ。悪魔女だってきっととんでもない力を使えるはずだ。そうとしか考えられない。

だったら、僕が悪魔女のことを警察に話したとして、それだって千里眼かなにかですぐバレちゃうかもしれない。そして僕のことを殺しに来るかもしれない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【判】
<voice name="判" class="判" src="voice/ch03/05400260bn">
「なあ、ニシジョウくん。今日はそんなに暑いか？」

{	CreateSE("SE02","SE_じん体_心臓_鼓動");
	SoundPlay("SE02", 0, 1000, false);}
言われて、鼓動が跳ね上がる。

このままなにも答えないままじゃ、絶対犯人だと思われる。でも“なにも見てない”って嘘をついても、見破られそうで怖い……。

おっさんは、持っていたうちわで僕の顔を扇いでくれた。涼やかな風が僕の髪を揺らす。

//【判】
<voice name="判" class="判" src="voice/ch03/05400270bn">
「もうすっかり秋だ。汗かくほど暑いとは思えんけどなあ。まあ、体質ってのは人それぞれだしな。はっは」

この季節にうちわを持ち歩いてる人間に言われたくないけど、確かに今日はそんなに暑くない。ちょうど過ごしやすいぐらいの気温だ。

僕は制服の袖で何度も汗を拭った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE02", 0, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400280ta">
「ぼ、僕はやってない……」

{	BGMPlay360("CH13",2000,1000,true);
	Stand("st安二_スーツ_通常","hard", 200, @-200);
	FadeStand("st安二_スーツ_通常_hard", 200, false);
	DeleteStand("st安二_スーツ_通常_normal", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400290bn">
「ほう」

刑事の目の色が変わった。
僕は自分の失言に気付いたけど、そもそも今のなにが失言なのか分からない。

//【判】
<voice name="判" class="判" src="voice/ch03/05400300bn">
「なにを、やっていないんだ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400310ta">
「…………」

絶対、疑われてる……。
正直に答えるしかない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 1000, 0, false);
	CreateColor("back05", 300, 0, 0, 1280, 720, "Black");
	Move("st安二_スーツ_通常_hard", 800, @0, @-150, Axl1, false);
	Move("st護_スーツ_通常_hard", 800, @0, @-150, Axl1, false);
	Move("背景２", 800, @0, @-150, Axl1, false);
	DrawTransition("back05", 500, 0, 1000, 100, null, "cg/data/center.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
ちょうど足許にあったマンホールの柄をじっと見つめたまま、僕は叫んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","shock", 200, @-200);
	Stand("st護_スーツ_通常","sigh", 200, @200);
	FadeStand("st安二_スーツ_通常_shock", 0, true);
	FadeStand("st護_スーツ_通常_sigh", 0, true);
	Move("st安二_スーツ_通常_shock", 0, @0, @-150, null, true);
	Move("st護_スーツ_通常_sigh", 0, @0, @-150, null, true);

	DeleteStand("st安二_スーツ_通常_hard", 0, true);
	DeleteStand("st護_スーツ_通常_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400320ta">
「み、見たっ……んです！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400330ta">
「『張り付け』の現場……そこに、女が、いたんです……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400340ta">
「手、血まみれにして……死体の、前に……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400350ta">
「杭が、たくさん、死体に突き刺さってて……
　あれ、５００本は絶対、こ、超え、超えてた……異常だ……」

//おがみ：音声結合されているためテキスト修正
//【拓巳】
//<voice name="拓巳" class="拓巳" src="voice/ch03/05400360ta">
//「あれ、５００本は絶対、こ、越え、越えてた……異常だ……」
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400370ta">
「死体が、ハリネズミ、み、みたいに、なってて……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400380ta">
「お、女は、僕を見て、“よかった”って、わ、笑ってた……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400390ta">
「あの女は、悪魔だ……っ。人間じゃないっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400400ta">
「ニュージェネの、は、犯人はっ……！
　人を、こ、超えた、存在なんだ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400410ta">
「予知とか、すごい超能力とか、使う――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("st安二_スーツ_通常_shock", 800, @0, @150, Dxl1, false);
	Move("st護_スーツ_通常_sigh", 800, @0, @150, Dxl1, false);
	Move("背景２", 800, @0, @150, Dxl1, false);
	Wait(200);
	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE02", 1000, 0, false);
	DrawTransition("back05", 1000, 1000, 0, 100, null, "cg/data/center.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
そこまで説明して、２人の刑事がポカンとしているのに気付いた。

もしかして、信じてもらえていないのかもしれない。
そう思って、僕もまた押し黙った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_雑踏02");
	SoundPlay("SE02", 5000, 500, true);

	Stand("st安二_スーツ_通常","hard", 200, @-200);
	FadeStand("st安二_スーツ_通常_hard", 200, false);
	DeleteStand("st安二_スーツ_通常_shock", 200, true);

	Stand("st護_スーツ_通常","hard", 200, @200);
	FadeStand("st護_スーツ_通常_hard", 200, false);
	DeleteStand("st護_スーツ_通常_sigh", 200, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【判】
<voice name="判" class="判" src="voice/ch03/05400420bn">
「悪魔か。なるほどねえ。そいつは参考になったよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400430ta">
「ほ、ホント……です……」

//【判】
<voice name="判" class="判" src="voice/ch03/05400440bn">
「ああ、分かってる分かってる。貴重な情報だよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400450ta">
「ぼ、僕を……警察で、ま、守って……ください……」

//【判】
<voice name="判" class="判" src="voice/ch03/05400460bn">
「その前に、その女の歳は分かる？　服装とか、顔の特徴とか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400470ta">
「……す、翠明……」

//【判】
<voice name="判" class="判" src="voice/ch03/05400480bn">
「翠明って、翠明学園？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400490ta">
「その制服……着てた……」

//【判】
<voice name="判" class="判" src="voice/ch03/05400500bn">
「つまり、ニシジョウくんと同じ学校の生徒かあ」

おっさんはしばらく考え込んでから、ニヤリと笑った。
それから、独り言とも質問ともつかないことをつぶやく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","pride", 200, @-200);
	FadeStand("st安二_スーツ_通常_pride", 200, false);
	DeleteStand("st安二_スーツ_通常_hard", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【判】
<voice name="判" class="判" src="voice/ch03/05400510bn">
「何年生だろうな、その女子高生は」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400520ta">
「…………」

//【判】
<voice name="判" class="判" src="voice/ch03/05400530bn">
「何年生だと思う、ニシジョウくん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400540ta">
「……わ、分からない……」

//【判】
<voice name="判" class="判" src="voice/ch03/05400550bn">
「じゃあ、なんて名前だと思う？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400560ta">
「わ、わ、わ、分からないよ……っ。ぼ、僕はっ、あの悪魔の名前なんて……し、知らない……っ」

//【判】
<voice name="判" class="判" src="voice/ch03/05400570bn">
「その女の身長、体重、あとついでにスリーサイズについては？」

なんだ、このおっさんは……？

僕をバカにしてるのか？　そんなのどれひとつとして分かる訳じゃないかっ！

僕には一目見ただけで相手の身長体重スリーサイズを見分けるなんていう、ラブコメマンガみたいなアホ能力はないんだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","normal", 200, @-200);
	FadeStand("st安二_スーツ_通常_normal", 200, false);
	DeleteStand("st安二_スーツ_通常_pride", 200, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【判】
<voice name="判" class="判" src="voice/ch03/05400580bn">
「なるほど、黙ってるってことは分からないってことだね？　結構結構。参考になったよ」

//【判】
<voice name="判" class="判" src="voice/ch03/05400590bn">
「こりゃ本部に戻って検討しないといかんなあ」

{	Stand("st護_スーツ_通常","sigh", 200, @200);
	FadeStand("st護_スーツ_通常_sigh", 200, false);
	DeleteStand("st護_スーツ_通常_hard", 200, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch03/05400600su">
「先輩、マジッスか……？」

あ然とする若い方の刑事を手で制して、おっさんはなにやら目で合図を送っていた。

{	Stand("st安二_スーツ_通常","pride", 200, @-200);
	Stand("st護_スーツ_通常","hard", 200, @200);
	FadeStand("st安二_スーツ_通常_pride", 200, false);
	FadeStand("st護_スーツ_通常_hard", 200, false);
	DeleteStand("st安二_スーツ_通常_normal", 200, true);
	DeleteStand("st護_スーツ_通常_sigh", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400610bn">
「あ、ニシジョウくん、ちなみに連絡先とか教えてもらえる？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400620ta">
「え……な、なんで……」

やっぱり、信じてもらえてないんだ。
僕に異常者っていうレッテルを貼って、冤罪に仕立て上げる気だ……。

{	Stand("st安二_スーツ_通常","normal", 200, @-200);
	FadeStand("st安二_スーツ_通常_normal", 200, false);
	DeleteStand("st安二_スーツ_通常_pride", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400630bn">
「いや、だって悪魔、だっけ？　そいつから君を守らなくちゃならないだろ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400640ta">
「…………」

そ、そっか。なるほど。
よかった、信じてもらえて。

警察に警備してもらえるなら、こんなに心強いことはない。もちろん相手は悪魔だから、警察でも太刀打ちできないかもしれないけど。丸腰よりはいい。

僕は少しだけホッとして、先日買ったばかりのケータイを取り出し、その番号を刑事に見せた。

若い方の刑事が、それを手帳にメモする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","pride", 200, @-200);
	FadeStand("st安二_スーツ_通常_pride", 200, false);
	DeleteStand("st安二_スーツ_通常_normal", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【判】
<voice name="判" class="判" src="voice/ch03/05400650bn">
「いや、忙しいところありがとさん。君の身の安全は警察が保証するから、なんの心配もしなさんな」

//【判】
<voice name="判" class="判" src="voice/ch03/05400660bn">
「んじゃ、またなにか聞きたいことができたら電話するかもしんないんで、そんときはよろしくな」

{	Stand("st安二_スーツ_通常","normal", 200, @-200);
	FadeStand("st安二_スーツ_通常_normal", 200, false);
	DeleteStand("st安二_スーツ_通常_pride", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400670bn">
「居留守とか使わないでくれよ？　今のところ、警察にとっては君は重要な人物だからな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05400680ta">
「え……」

//【判】
<voice name="判" class="判" src="voice/ch03/05400690bn">
「君の目撃証言は、事件解決の重要な手がかりになりそうだ」

{	Stand("st安二_スーツ_通常","pride", 200, @-200);
	FadeStand("st安二_スーツ_通常_pride", 200, false);
	DeleteStand("st安二_スーツ_通常_normal", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch03/05400700bn">
「じゃあな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st護_スーツ_通常_hard", 500, false);
	DeleteStand("st安二_スーツ_通常_pride", 500, true);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
２人の刑事はペコリと頭を下げると、足早に歩き去っていく。

若い方の刑事が、チラリと僕の方を振り返りつつ、声を潜めておっさん刑事になにか話しかけていた。

おっさんの方は相手にせずにさっさと歩いていく。

僕は深々と息をついた。

はああ、緊張したー……。

本物の刑事から聞き込みされるなんて、初めての体験だった。かなりキョドっちゃったけど、なんとか信じてもらえた……のかなあ。

警察が悪魔女を捕まえてくれるといいな……。

でも、警察って無能だから、あんまり期待するのはよくないかもしれない……。

いつの間にか口の中がカラカラに渇いていることに今さら気付き、僕は近くの自販機でペットボトルのコーラを買った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",500,0,false);

	ClearAll(2000);

	Wait(2000);


//～～Ｆ・Ｏ
//この拓巳の話をバンと諏訪はまったく信用していない。なぜなら張り付け事件の内容が全然違うから。


}