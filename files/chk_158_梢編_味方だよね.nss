//<continuation number="180">

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_158_梢編_味方だよね";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_158_梢編_味方だよね();
}


function chk_158_梢編_味方だよね()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編
//ＢＧ//神泉町並み・昼

	Wait(1000);
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg014_01_0_神泉町並み_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	CreateSE("SE3601","SE_日常_雑踏02");
	MusicStart("SE3601",2000,1000,0,1000,null,true);


	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕は急ぎ足で学校へ向かっていた。

周囲を見回して、人の姿がないかを確かめる。
誰かが僕に向かって迫ってこようものなら、全力で逃げるつもりだった。

さっきから、ずっと過呼吸状態だ。
ゼイゼイと、僕ののどがあえぐような音を出している。
拭っても拭っても、額からは汗がにじみ出てくる。

学校へ行くんだ……。
学校へ行って、意地でもこずぴぃに助けてもらうんだ。

僕に精神攻撃してくるヤツらを、こずぴぃに殺してもらいたいぐらいだ。
こずぴぃならやってくれる。だって彼女は壊れてるんだから。

殺してやりたい……。
殺してやりたい……！

『将軍』とその仲間を、殺してやりたい……！
昨日、僕のベースに来た連中だって間違いなく『将軍』とその部下だ。

あいつら、ついに本気を出してきたんだ。
僕を標的にして、僕を徹底的に消耗させた後、最後に容赦なく残酷に殺すつもりだ。

そんなのイヤだ。死にたくない……。
だから殺される前に殺すしか――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("黒幕", 100, 0, 0, 1280, 720, "Black");
	Fade("黒幕", 0, 0, null, true);

	SetVolume("SE3601", 1500, 400, null);

	CreateSE("SE3671","SE_じん体_動作_足_走る_LOOP");


//ＳＥ//車椅子の軋む音「キィ……」
	CreateSE("SE01","SE_日常_車椅す");
	CreateSE("SE02","SE_日常_車椅す");
	CreateSE("SE03","SE_日常_車椅す");
	CreateSE("SE04","SE_日常_車椅す");
	CreateSE("SE05","SE_日常_車椅す");
	CreateSE("SE06","SE_日常_車椅す");
	MusicStart("SE01", 0, 600, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
また、音……！

真後ろから、昨日さんざん聞いたあの軋むような音がした。

ビクッとして振り返る。
でも誰もいない。車椅子なんてどこにも見当たらない。

幻聴じゃない。はっきり聞こえたのに……！

また『将軍』からの攻撃か！？

{	Fade("黒幕", 0, 1000, null, true);
	MusicStart("SE3671",0,700,0,1000,null,true);}
走り出す。とにかく１人でいたくなかった。

でも――

//ＳＥ//車椅子の軋む音「キィ……」
{	MusicStart("SE02", 0, 650, 0, 1000, null, false);}
追いかけてくる。

//ＳＥ//車椅子の軋む音「キィ……」
{	MusicStart("SE03", 0, 700, 0, 1000, null, false);}
音が、僕のすぐ真後ろにぴったり張り付いている。

//ＳＥ//車椅子の軋む音「キィ……」
{	MusicStart("SE04", 0, 800, 0, 1000, null, false);}
やめろ、こっちに来るな……僕に近づくな……僕を見るな……！

//ＳＥ//車椅子の軋む音「キィ……」
{	MusicStart("SE05", 0, 900, 0, 1000, null, false);}
おかしくなりそうだった。

//ＳＥ//車椅子の軋む音「キィ……」
{	MusicStart("SE06", 0, 1000, 0, 1000, null, false);}
もう一度振り返る勇気はなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3671", 1500, 0, null);
	SetVolume("SE3601", 1500, 400, null);

//ＢＧ//学校校門

	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg016_01_0_学校校門_a.jpg");
	DrawTransition("back02", 1000, 0, 1000, 200, null, "cg/data/right3.png", true);


	CreateSE("SE02","SE_日常_校門前_朝");
	MusicStart("SE02",2000,1000,0,1000,null,true);

	Delete("back01");
	Delete("黒幕");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
校門にたどり着く。
まだ始業のチャイムは鳴っていない。

遅刻間際のはずだけど、ちらほらと登校してくる生徒の姿も見える。

人の姿を見ただけで、ひるんでしまう。
だけどここを通らないとこずぴぃに会えない。

意を決して校内に入ろうとして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE3610","SE_じん体_動作_足_走る_LOOP");

//ＳＥ//ケータイ写真のシャッター音
	CreateSE("SE03","SE_はいけい_ケータイ_しゃったー");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);


	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
またも、音。

今度は車椅子じゃなくて、ケータイカメラのシャッター音。

周囲へ視線を巡らせる。

誰だ？　誰が撮った？

誰も僕を見ていない。
ケータイを取り出しているヤツもいない。

なんなんだ、なんなんだよっ！

{	MusicStart("SE3610",500,1000,0,1000,null,true);}
僕は耳を塞ぐと、周りに目もくれずに走った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1000, 0, null);

//ＢＧ//廊下
	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 500, 0, 1000, 200, null, "cg/data/right3.png", true);

	CreateSE("SE04","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE04", 1500, 500, 0, 1000, null, true);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Delete("back02");

	DrawTransition("黒", 500, 1000, 0, 200, null, "cg/data/left3.png", true);
	Delete("黒");

	SetVolume("SE3610", 1000, 0, null);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
教室まで一気にたどり着く。

中に駆け込もうとして、慌てて立ち止まり、その場で回れ右。

クラスのＤＱＮどもがたむろしていた。
目が合いそうになったから、入るのをやめた。

ちくしょう……。

この世界は敵だらけだ。
全員敵なんだ。死ね。どいつもこいつも死ねよっ。

脳内でＤＱＮどもを惨殺する妄想をしつつ、廊下を引き返す。

チラッと見ただけだけど、こずぴぃの姿はなかった。
と言うか、教室には女子が１人もいなかった。

それはすごく奇妙な気がしたけど、どうでもよかった。
こずぴぃがどこにいるのかだけが気になった。

どうしてこういうときに限って、すぐに見つからないんだ……。

まだ、僕ののどはゼイゼイという荒い呼吸を繰り返している。
その僕を見て、廊下を歩く生徒たちがギョッとして振り返ってくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE04", 1000, 200, null);

//おがみ：演出のため
//――僕を見るな。

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "――僕を見るな。");

	SetBacklog("――僕を、見るな。", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

//ＳＥ//ケータイ写真のシャッター音
	CreateSE("SE3603","SE_はいけい_ケータイ_しゃったー");
	CreateSE("SE3604","SE_はいけい_ケータイ_しゃったー");
	CreateSE("SE3605","SE_はいけい_ケータイ_しゃったー");

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, true);


	SetVolume("SE04", 1000, 500, null);

	MusicStart("SE3603", 0, 1000, 0, 1000, null, false);
	Wait(500);
	MusicStart("SE3604", 0, 1000, 0, 1000, null, false);
	Wait(200);
	MusicStart("SE3605", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
また音。

振り返ると、見たこともないＤＱＮ男子が４人ほど、僕を見てニヤニヤしていた。ケータイをこっちに向けている。

――僕を見るな！

ＤＱＮは無視。
後でこずぴぃに殺してもらえばいい。

そんな妄想をする。とても甘美で爽快な妄想。
どいつもこいつも死ねばいい。
こんな世界、もううんざりだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateSE("SE3610","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE3610",500,1000,0,1000,null,true);

	SetVolume("SE04", 1000, 0, null);
	SetVolume("SE02", 1000, 0, null);

//ＢＧ//昇降口・昼
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg051_02_1_昇降口_a.jpg");
	Fade("back04", 0, 0, null, true);
	Fade("back04", 500, 1000, null, true);

	Delete("back03");

	CreateSE("SE3601","SE_日常_校門前_朝");
	MusicStart("SE3601",2000,700,0,1000,null,true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
こずぴぃは見当たらない。
どこにいるのかさっぱり分からない。

もしかしたら今日は学校に来てないんだろうか。

だとしたらどうしよう……。
明日まで１人で『将軍』からの精神攻撃に耐えきれる自信はなかった。

心の中では強がっているけど、今でさえ膝が震えて、気を抜くとその場にへたり込んでしまいそうなんだ。

こずぴぃ……どこなの……？
どこにいるんだよ……！
僕を助けてよ……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3610", 1000, 0, null);
	SetVolume("SE3601", 1000, 0, null);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//◆心の声//◆心の中でも泣いてます
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100010ko">
「助けて……」

ハッとして立ち止まった。

声が聞こえた。
しかも頭の中に直接響いてきた、心の声。

//◆心の声//◆心の中でも泣いてます
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100020ko">
「こずぴぃのせいじゃない……こずぴぃのせいじゃないもん……」

//◆心の声//◆心の中でも泣いてます
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100030ko">
「助けて……」

こずぴぃ、どこだ！？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1000, 0, null);

	CreateColor("黒幕", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("黒幕", 200, 0, 1000, 200, null, "cg/data/right3.png", true);

	Wait(1000);

	Delete("back*");

//おがみ：テキスト修正退避
//周囲を見回すと、昇降口の隅にうずくまり頭を抱えているこずぴぃの姿を見つけた。
//その手が、血で濡れている。
//こずぴぃ？　いったいどうしたの？　ケガしたのか！？

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//※１０月３日修正、以下
//周囲を見回すと、昇降口の隅で膝を抱えているこずぴぃの姿を見つけた。
//※１０月３日修正、以上
周囲を見回すと、昇降口の隅にうずくまり頭を抱えているこずぴぃの姿を見つけた。
その姿を見て、僕は思わず息を呑んだ。

彼女の全身が、大量の血を浴びたかのように真っ赤だった。

いや、“ような”じゃなくて。
これは、血そのものだ。

悲鳴をあげそうになった。でも声にならなかった。

こずぴぃ！　しっかりして！　こずぴぃ！

心の中で呼びかけてみると、こずぴぃがそれに気付いてのろのろと顔を上げた。目は涙で濡れて、赤く充血している。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_抱く1");
	MusicStart("SE01",0,1000,0,1000,null,false);

	CreateTexture360("梢うずくまり２", 100, 0, 0, "cg/ev/ev134_01_1_梢うずくまり_a.jpg");
	Fade("黒幕", 1000, 0, null, true);

	BGMPlay360("CH22",0,1000,true);


	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//◆心の声//◆心の中でも泣いてます
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100040ko">
「うぅ……拓巳しゃん……」

そのまま、すがるように僕の腰にしがみついてきた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01100050ta">
「ちょっ、な、なにを……！」

//おがみ：シナリオ修正：テキスト削除
//こんなところで女子に抱きつかれたりしたら、目立ちすぎてＤＱＮに目を付けられちゃうだろ……！
//でもこずぴぃの身体がブルブルと震えていることに気付いてしまい、振り払うことはできなくて。
//◆心の声//◆心の中でも泣いてます
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100060ko">
「拓巳しゃんは、こずぴぃの敵？　味方？」

ど、どういう意味……？

//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01100070ko">
「……っ」

//おがみ：シナリオ修正退避
//聞き直してみたけど、こずぴぃは僕の胸に顔を埋めて首を左右に振るだけだ。彼女の手にこびりついた赤黒い血が、僕の制服を汚していく。
//以上、リアル声
聞き直してみたけど、こずぴぃは僕の胸に顔を埋めて首を左右に振るだけだ。彼女の全身にこびりついた赤黒い血が、僕の制服を汚していく。

こずぴぃって、こんなに小さいんだな。
身体も折れちゃいそうなくらいに細い。
こうして抱きつかれて、初めて気付いた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01100080ta">
「ぼ、僕は、こ、こずぴぃの味方だ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01100090ta">
「だ、だから、こずぴぃに助けてもらいたい……」

ありのまま、僕が思ってることを言った。
言ってることはかなり自分に都合のいいことだけど。
こずぴぃしか、いないんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("梢うずくまり１", 100, 0, 0, "cg/ev/ev134_02_1_梢うずくまり_a.jpg");
	Fade("梢うずくまり１", 0, 0, null, true);
	Fade("梢うずくまり１", 500, 1000, null, true);
	Delete("梢うずくまり２");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//◆心の声//◆心の中でも泣いてます
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100100ko">
「こずぴぃのこと、いじめない？」

いじめないよ……。
それより、僕をいじめる連中から守ってほしいんだ。

//◆心の声//◆心の中でも泣いてます
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100110ko">
「こずぴぃは、守れないよぉ……」

でもディソードを持ってるじゃないか！

//◆心の声//◆心の中でも泣いてます
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100120ko">
「だってだって、あの子のこと、うまく、扱えないぷぅ……」

あの子って、ディソードのこと？

その僕の問いにこずぴぃはうなずいて。
それから、ますます身を縮こまらせた。

//◆心の声//◆心の中でも泣いてます
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100130ko">
「だからね、さっきのドカバキグシャーッは、こずぴぃのせいじゃ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("@CH*", 0, 0, null);

	Delete("@text3602005");

//ＳＥ//衝撃音（妄想ＩＮでもいいかも）
//ＢＧ//赤
//他になにかふさわしいものがあれば変更してＯＫです
	DelusionIn();

	BoxDelete(0);

	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");

	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Request("血", AddRender);

	CreateColor("血２", 1000, 0, 0, 1280, 720, "Red");
	DrawTransition("血２", 1000, 500, 500, 100, null, "cg/data/effect.png", true);

	Stand("st梢_制服_武器構え2_血まみれ","sad", 200, @+150);
	FadeStand("st梢_制服_武器構え2_血まみれ_sad", 0, true);


	Delete("梢うずくまり*");

	DelusionIn2();

	BGMPlay360("CH06", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
その衝撃は、いきなりやって来た。

脳内に、フラッシュバックのようにとある映像が炸裂する。

学校。屋上。赤。血の海。強烈な血の匂い。倒れているたくさんの肉片。それが元々なんだったのか理解できないくらいバラバラ。血の海の中に立ち荒い息をつくこずぴぃ。手にはディソード――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音（妄想ＯＵＴでもいいかも）

	SetVolume360("@CH06", 200, 1, null);

	DelusionOut();
	DeleteStand("st梢_制服_武器構え2_血まみれ_sad", 0, true);
	Delete("*");

//ＢＧ//昇降口・昼
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg051_02_1_昇降口_a.jpg");

	DelusionOut2();

	SetVolume360("@CH06", 2000, 1000, null);

	Delete("back05");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
ハッと我に返る。
今のは、なんだ！？

見えていたのは学校の屋上だった。
あの映像はなんなんだ？　ただの妄想？
それにしてはいつもと少し違った。

もしかして、僕の妄想じゃなくて、こずぴぃの妄想？
“他人の負の妄想が見えるのがギガロマニアックスだ”とかなんとか、セナが言っていたような気がする。

それに――

//おがみ：シナリオ修正：テキスト退避
//今、僕にしがみついているこずぴぃの手には、どす黒い血。まだ乾いていない。痛がっている素振りを見せないから、こずぴぃがケガしてるわけじゃない。この血はこずぴぃ自身のものじゃない。
//じゃあ、誰の血だ？
今、僕にしがみついているこずぴぃの全身には、どす黒い血。まだ乾いていない。痛がっている素振りを見せないから、こずぴぃがケガしてるわけじゃない。この血はこずぴぃ自身のものじゃない。

これほどの量の血を浴びるような状況について、想像を巡らせてみる。
こんなの普通じゃない。異常だ。

いったい、誰の血だ？

こずぴぃ、誰の血なんだ！？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_日常_チャイム");

//おがみ：演出：ここ梢の立ち絵、血まみれだと変な気がする　手だけだと
	Stand("bu梢_制服_正面_血まみれ","sad", 200, @+150);
	FadeStand("bu梢_制服_正面_血まみれ_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100140ko">
「んとぉ、こずぴぃをね、いじめた人たち……」

//おがみ：演出：ここ梢の立ち絵、血まみれだと変な気がする
{	Stand("bu梢_制服_通常_血まみれ","sad", 200, @+150);
	DeleteStand("bu梢_制服_正面_血まみれ_sad", 300, false);
	FadeStand("bu梢_制服_通常_血まみれ_sad", 300, true);}
こずぴぃはうなだれていた。
僕からそっと身を離し、バツが悪そうに顔をそむけてしまう。

人差し指を唇に添えて。
拗ねているようにも見えた。
手にこびりついた血を舐めているようにも見えた。

その血は、他人の血じゃないの？

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100150ko">
「他人の血だよ……」

イヤな予感がする。
こずぴぃ、もしそれが事実なら……やり過ぎじゃないか……？

//ＳＥ//チャイムの音
{	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}
始業ベルが鳴った。ホームルームが始まる時間だ。
すでに周囲に生徒の姿はない。

僕は意を決して、教室へ向かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：演出：ここ梢の立ち絵、血まみれだと変な気がする
//ＢＧ//学校廊下・昼//モブなし
	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 200, 0, 1000, 200, null, "cg/data/right3.png", true);

	CreateTexture360("back06", 100, 0, 0, "cg/bg/bg019_02_1_学校廊下_a.jpg");
	DeleteStand("bu梢_制服_通常_血まみれ_sad", 0, true);
	Delete("back04");

	DrawTransition("黒", 200, 1000, 0, 200, null, "cg/data/left3.png", true);
	Delete("黒");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
誰にもバレないように、窓の外からそっと中をのぞいてみる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01100160ta">
「これって……！」

愕然としてしまった。

すでにホームルームは始まっていて、担任も来てるっていうのに。

教室内には、さっき見たときと同様、女子が一人もいない。

嘘だろ……。

確かめなきゃ。それがただの妄想だって、確かめなきゃ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("@CH*", 2000, 0, null);

	CreateSE("SE3601","SE_じん体_動作_足_階だん走る_拓巳_LOOP");
	CreateSE("SE3602","SE_じん体_心臓_鼓動");
	CreateSE("SE05","SE_日常_部屋の扉開く_勢いよく");

	MusicStart("SE3601",0,1000,0,1000,null,true);


//ＢＧ//学校屋上

	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 200, 0, 1000, 200, null, "cg/data/right3.png", true);

	CreateTexture360("back06", 100, 0, 0, "cg/bg/bg052_01_1_学校階段_a.jpg");
	Delete("back04");

	Wait(1000);

	DrawTransition("黒", 200, 1000, 0, 200, null, "cg/data/left3.png", true);

	Wait(1500);

	DrawTransition("黒", 200, 0, 1000, 200, null, "cg/data/right3.png", true);

	CreateTexture360("back06", 100, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");

	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	SetVolume("SE3601", 1000, 0, null);

	Wait(1000);

	DrawTransition("黒", 1000, 1000, 0, 200, null, "cg/data/left3.png", true);
	Delete("黒");

	Wait(500);

	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
屋上まで駆け上がり、勢いよく扉を開けた。

最初に目に飛び込んできたのは、くすんだ青空。
そしてその後から――

//ＢＧ//赤
{	MusicStart("SE3602",0,1000,0,1000,null,true);
	Fade("血", 0, 1000, null, true);
	Wait(500);}
鮮烈な赤。

文字通りの血の海。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CreateSE("SE01","SE_じん体_動作_おうと");
	MusicStart("SE01",0,1000,0,1000,null,false);

	Wait(1500);

//※１０月３日修正、以下
//肉片とか、髪とか、血に染まった制服の断片とかが散らばっていて。
//※１０月３日修正、以上

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
そのあまりの惨状と、生理的な嫌悪感と、おぞましさと、強烈な異臭に、たまらず嘔吐していた。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01100170ko">
「拓巳しゃんは、こずぴぃの味方だよね……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：演出：ここ梢の立ち絵、血まみれだと変な気がする
//ＢＧ//学校屋上
	FadeDelete("血", 500, true);

	Wait(500);
	Stand("bu梢_制服_通常_血まみれ","sad", 200, @+50);
	FadeStand("bu梢_制服_通常_血まみれ_sad", 500, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602009]
ハッとする。
振り向くと、背後にこずぴぃが立っていた。

彼女は目尻に涙を浮かべながらも。

//おがみ：演出：ここ梢の立ち絵、血まみれだと変な気がする
僕に向かって――

//おがみ：シナリオ修正：テキスト追加
血まみれのままで――

{	Stand("bu梢_制服_通常_血まみれ","shy", 200, @+50);
	DeleteStand("bu梢_制服_正面_血まみれ_sad", 500, false);
	FadeStand("bu梢_制服_通常_血まみれ_shy", 500, true);}
無邪気に笑った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01100180ta">
「うわあああ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 500, 0, NULL);
	SetVolume("SE*", 500, 0, null);

	ClearAll(500);
	Wait(1000);
}
