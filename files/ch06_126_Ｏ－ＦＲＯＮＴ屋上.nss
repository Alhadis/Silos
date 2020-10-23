//<continuation number="1350">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_126_Ｏ－ＦＲＯＮＴ屋上";
		$GameContiune = 1;
		Reset();
	}

		ch06_126_Ｏ－ＦＲＯＮＴ屋上();
}


function ch06_126_Ｏ－ＦＲＯＮＴ屋上()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


	Delete("*");
	ClearAll(0);

	Wait(2000);

	DelusionIn();

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg161_01_6_妄想世界_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Stand("st星来_覚醒後_通常","normal", 200, @0);
	FadeStand("st星来_覚醒後_通常_normal", 0, true);

	DelusionIn2();

	BGMPlay360("CH07",4000,1000,true);
	Wait(2000);

//※拓巳視点に戻る
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
//イメージＢＧ//幻惑的なイメージ
//※拓巳の脳内

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600010se">
「タッキー」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600020se">
「ねー、タッキー」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600030se">
「聞こえてるっしょ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600040ta">
「うん……聞こえてるよ星来たん」

{	Stand("st星来_覚醒後_通常","sad", 200, @0);
	FadeStand("st星来_覚醒後_通常_sad", 300, true);
	DeleteStand("st星来_覚醒後_通常_normal", 0, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600050se">
「あのさ、もうこのゲーム、終わりにしようよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600060ta">
「ゲーム……」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600070se">
「七海っちはタッキーの大事な妹だってのは分かるけど……きっともう、手遅れだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600080ta">
「そ、そんなこと……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600090ta">
「そんなこと……ないよ……」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600100se">
「だって、腕を切り落とされちゃったらさ、
　フツー出血多量で死んじゃうっしょ。
　ゲームだったら違うかもだけど……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600110ta">
「なんで……なんで七海が……」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600120se">
「もうさ……ゲームオーバーなんだよ、きっと」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600130se">
「早くゲームをやめないと、もっと沢山人が死んじゃう」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600140ta">
「でも……でも星来たんだって、悪いヤツと戦ってるじゃないか……」

{	Stand("st星来_覚醒後_通常","normal", 200, @0);
	FadeStand("st星来_覚醒後_通常_normal", 300, true);
	DeleteStand("st星来_覚醒後_通常_sad", 0, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600150se">
「だって、あたしはぁ」

{	Stand("st星来_覚醒後_通常","happy", 200, @0);
	FadeStand("st星来_覚醒後_通常_happy", 300, true);
	DeleteStand("st星来_覚醒後_通常_normal", 0, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600160se">
「――アニメだもんっ♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ


	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionOut();

	DeleteStand("st星来_覚醒後_通常_happy", 0, true);
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg085_01_3_スクランブル交差点_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	CreateSE("SE01","SE_はいけい_すくらんぶる交差点ガヤ_ぴりぴり_LOOP");
	SoundPlay("SE01", 2000, 1000, true);

	DelusionOut2();

	Wait(1000);

//ＢＧ//スクランブル交差点//夜
//※ＳＥでサッカーの応援コールみたいな一体化した声が欲しいです……
//おがみ：SEあるか忘れた、とりあえずダミー組み込み

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
星来たんのフィギュアを、僕は制服の内ポケットに少し強引にねじ込んだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600170ta">
「助けなきゃ…………僕が…………」

星来たんを持ってきたのは、お守り代わりだ。

本来なら、絶対にフィギュアを持ち歩いたりなんかしない。
なにしろ破損しちゃう恐れがあるから。

大事な嫁を壊すなんてオタとしては一番やっちゃいけない行為だ。

でも今は、そんなポリシーを守っている余裕すらなかった。とにかく心の支えが欲しかった。

もっとも、僕は明日にはもう生きてないかもしれないけど……。

僕はもう一度だけ、ポケットの中から顔を出している星来たんをのぞき見た。それで、にじみ出しそうになる涙をなんとかこらえる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//人とぶつかる音
	CreateSE("SE02","SE_衝撃_肩にぶつかる");
	SoundPlay("SE02", 2000, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
と、背中に誰かがぶつかってきて、よろけてしまった。

振り返ると、ＤＱＮぽい男が僕に鬱陶しそうな顔を向けていた。でも文句を言われることはなく、その男はすぐに人混みの中に見えなくなった。

周囲を見回す。

渋谷、スクランブル交差点。

平日の夜９時、そして１００人以上が亡くなった地震の起きた日とは思えない、黒山の人だかりだった。

信号待ちをしているだけで窒息しそうになる。前後左右、どこも人だらけ。

//※セカンドメルトによりバイオリズム上昇でみんな興奮状態にある
//■３６０
//そして誰もが、まるでサッカーの応援コールのように一体化して声を上げている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
理由は分からないけど、どうやらマスコミまでもが殺到しているらしい。

大きなテレビカメラを構えた人が車道にまではみ出して、車の流れを止めてしまっている。あちこちでたかれている撮影用の照明がまぶしい。

報道キャスターのような人たちが、カメラに向かってなにやら熱弁している。

数人の警官が、車道にはみ出しているマスコミや通行人を注意しているけど、とても収拾できる状態じゃなかった。もはやほとんど歩行者天国みたいになってる。

こんな日のこんな時間に、イベントでもあるんだろうか。

１００人も死んだのになんて不謹慎なんだ。自重しようとは思わなかったのか。しかもマスコミまで一緒になって騒いでいるなんて。

日本終わったな。

まあ、僕には、どうでもいいことだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600180ta">
「助けなきゃ……僕が……助けなきゃ……」

//『ＴＡＴＳＵＹＡ』『スタバァ』＝ＴＳＵＴＡＹＡとスタバ
『将軍』に指定された場所『Ｏ－ＦＲＯＮＴ』はスクランブル交差点の目の前にある。ＴＡＴＳＵＹＡやスタバァが入っているビルだ。

ホントはひとりで来るつもりはなかった。
だけど梨深とはまったく連絡がつかなくて。

警察はもしかするとまだ僕をニュージェネの犯人と誤解してるかもしれないから、通報もできなくて。

そうこうしているうちに『将軍』からの指定の時間が迫っていて、七海のことが心配でいてもたってもいられなくて、やむなく星来たんを手にここまで来た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//Ｏ－ＦＲＯＮＴエスカレーター
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg162_01_3_O-FRONTエスカレータ_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	SoundPlay("SE01", 2000, 0, true);
	CreateSE("SE02","SE_はいけい_しーでーしょっぷ店内_LOOP");
	SoundPlay("SE02", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
人の海をかきわけて、なんとかＯ－ＦＲＯＮＴの中に入った。

でも中もけっこう混み合っている。
僕はうんざりする気にもなれなかった。

頭の中には、七海の無事を祈る想いしかなかった。

エスカレーターで上の階に向かう。

スタバァの窓越しに、スクランブル交差点を見下ろすことができた。見てみると、やっぱりすごい人の数だ。

しかもみんなウェーブをしたり小刻みにジャンプしたりして、無数の黒い頭がうねっている。

っていうか下にいたときより明らかにまぶしい。照明が全部こっちを向いているんじゃないかって思えてくる。

エスカレーターが僕をひとつ上のフロアへ運ぶたびに、
心臓の鼓動が激しくなっていく。

ケータイを取り出して時間を確かめると、約束の２１時を１分過ぎていた。

これで『将軍』が怒って七海を殺したら……と思うとゾッとして、前の客を押しのけながらエスカレーターの段差を駆け上った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//黒

	SoundPlay("SE02", 2000, 0, false);

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
途中でエレベーターに乗り換えて最上階へ。

そこから屋上にはどうやって上がればいいのか分からなかったけど、人目を気にしながらうろついていたらすぐに非常階段が見つかった。

誰かに咎められることもなく、あっさりと僕は屋上へ出ることに成功した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ガチャ、ヒュ～（屋上の扉を開け、強い風）
//おがみ：風の音ダミー
	CreateSE("SE02","SE_日常_おーふろんと屋上扉開ける");
	CreateSE("SE03","SE_自然_風音_LOOP");
	SoundPlay("SE02", 0, 1000, false);
	Wait(500);
	SoundPlay("SE03", 2000, 1000, true);

//ＢＧ//Ｏ－ＦＲＯＮＴ屋上

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg089_01_3_Ｏ－ＦＲＯＮＴ屋上_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Fade("色１", 2000, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
屋上は風が強かった。１０月の終わりにしてはやけに生ぬるい風。自然の風じゃなくて、エアコンの室外機が放出するものだってすぐに悟った。

星来たんが飛んでいかないように、制服の前ボタンを閉じる。

//ＶＦ//妄想セリフ（以下、星来のセリフはすべて）
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600190se">
「ありがと、ぼけなす♪」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600200ta">
「ど、どういたしまして……」

星来たんの声が僕の脳内に聞こえてきて、僕は少しだけホッとした。星来たんが一緒なら……こ、怖くない……

必死でそう自分に言い聞かせた。

それにしても、暗い。
明かりは、裏側から見た『Ｏ－ＦＲＯＮＴ』のネオンだけ。

逆に周囲の建物のネオンが眩しすぎるせいで、視界が悪かった。誰かが物陰に隠れていても、絶対に見つけられない気がする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE03", 3000, 0, false);

	Wait(1500);

//※ここでの将軍はニセモノ。諏訪がなりすましている。なので口調も大人っぽい。
//※以下、諏訪、判、三住、高科などすべてのセリフは『将軍』としてのセリフになります。声にはなんらかのエフェクトをかけてください
	CreateTextureEX("フラッシュバック", 100, 0, 0, "cg/ev/ev052_02_3_将軍車椅子_a.jpg");
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	CreateSE("フラッシュ","SE_衝撃_衝撃音01");
	CreateSE("フラッシュ用車椅子","SE_日常_車椅す");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//◆幼い感じで
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600210su">
「遅かったね」

{	CreateSE("SE01","SE_じん体_心臓_鼓動");
	SoundPlay("SE01", 0, 1000, true);}
いきなり声をかけられて、少しだけおさまりかけていた鼓動がまた早鐘を打ち始める。

周囲を見回してみたけど、暗くてどこから話しかけてきているのか分からない。

{	CreateSE("SE02","SE_日常_車椅す");
	SoundPlay("SE02", 0, 500, false);}
//ＳＥ//車椅子の軋む音「キィ……」
音が聞こえた。
以前にも何度か聞いたことのある、軋むような音。

今度はゆっくりと、暗闇の向こう側へと目を凝らしてみる。すると、逆光ではあったけど、車椅子の車輪が光っているのを見つけた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600220ta">
「あ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("フラッシュ", 0, 1000, false);
	SoundPlay("フラッシュ用車椅子", 0, 1000, false);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	Fade("フラッシュバック", 0, 1000, null, true);
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1000);

	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("フラッシュバック");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//ＳＥ//車椅子の軋む音「キィ……」
将……軍……！

//◆『将軍』になりすましている。幼い感じで
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600230su">
「ようこそ。拓巳くん」

馴れ馴れしく名前を呼ばれた。
気色悪くて、鳥肌が立つ。

『将軍』とは話したくない。怖い……。
今すぐにでもこの場から逃げ出したい……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600240se">
「じゃあ、逃げちゃおうよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600250se">
「このままじゃタッキー、殺されちゃう」

//	DeleteStand("bu星来_覚醒後_通常_sad", 200, true);
//	Fade("色１", 400, 0, null, false);
でも、七海が……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//◆幼い感じで
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600260su">
「キミはすごく勇気のある人だ。ちゃんとひとりで来てくれるとは」

//◆ニヤリとして。幼い感じで
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600270su">
「ありがとう、と言っておくよ」

っていうか、この『将軍』は変だ。

前に会ったときとなにかが違う……。
そう、声だ。声が、おかしい……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600280ta">
「そ、の、声……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//※以下の将軍の４つのセリフは、どれも「違う声に聞こえる」ようにしたいです。
//※諏訪が、声を変える機械を使って、次々といろいろな声で語りかけてくる

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//◆『将軍』になりすましている。幼い感じで
//【判】
<voice name="判" class="判" src="voice/ch06/12600290bn">
「声なんて」

//◆『将軍』になりすましている。幼い感じで
//【三住】
<voice name="三住" class="三住" src="voice/ch06/12600300mi">
「ただの、空気の振動でしかないよ」

//◆『将軍』になりすましている。幼い感じで
//【高科】
<voice name="高科" class="高科" src="voice/ch06/12600310tk">
「どう聞こえるかは、その場の条件によって変わる」

//◆『将軍』になりすましている。幼い感じで
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600320su">
「そうだろう？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
なんなんだ……声がどんどん変わっていく……。

機械でも使ってるのか？
声から正体がバレたくないとか？
どうして今さら？

それに、言ってる意味も分からない……。

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600330se">
「タッキーを混乱させようとしてるんさ！」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600340se">
「油断しちゃダメ、誰の言葉も信じちゃダッメー！」

そ、そうだ、星来たんの言う通りだ。

いつもいつも、星来たんの言うことが一番正しかった。

僕は、服の上から星来たんの身体をギュッと握りしめた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600350ta">
「な、な、なな、七海は……ど、どこ……」

恐怖のあまり、心臓が口から飛び出しそうだ。
それでも必死に、僕は声を出していた。

……こんな場面、テレビやゲームの中だけの話だと思ってた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600360ta">
「七海は……もう死んだの……？」

//◆『将軍』になりすましている。幼い感じで
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600370su">
「ううん」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600380se">
「ダウト！　だって手首ちょん切られちゃったんだよ？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600390se">
「もし生きてるにしても、もうすぐ出血多量で死んじゃうのは変わんないよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	CreateSE("SE回想in","SE_衝撃_衝撃音02");

	SoundPlay("SE回想in",0,1000,false);
	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("色１");
	CreateColor("回想明度", 300, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("フラッシュバック", 200, 0, 0, "cg/ev/ev026_02_2_七海ハンバーガー_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);
	Wait(1000);
	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("フラッシュバック");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
涙が出た。

七海のふくれっ面が脳裏に浮かぶ。

生意気なヤツだった。正直、ウザかった。

それなのに、こんなにも、悲しい。
涙が出るぐらい、悲しい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600400ta">
「七海は、七海は僕の妹なんだ……僕の……大切な……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600410ta">
「なんで……殺したんだ……ひどいよ……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600420su">
「死んだと思う？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600430su">
「もしかしたら、キミの家に送ったあの手首は、別人のものかもしれないよ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600440ta">
「え……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600450su">
「バングルとケータイは七海ちゃんのものだとしても、手首そのものは別人のものかもしれない、っていうこと」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE回想in","SE_衝撃_衝撃音02");
	SoundPlay("SE回想in",0,1000,false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 300, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("フラッシュバック", 200, 0, 0, "cg/ev/ev030_01_2_七海バングル_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
七海は……生きてるの？

<voice name="星来" class="星来" src="voice/ch06/12600460se">
「信じちゃダメだってば！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("フラッシュバック");
	Delete("色１");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600470su">
「キミが見事クエストをクリアしたら、七海ちゃんは返すよ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600480su">
「生きている七海ちゃんを、ね」

クエスト。また『将軍』はそんな言葉を使う。

ゲーム感覚のつもりなの？

でも……でも、現実の僕は勇者なんかじゃない……。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600490su">
「でも、もしクリアできなかった場合、七海ちゃんは帰ってこない」

いきなり『将軍』の声が刃物のように冷たくなった。

老人相手にビビるなんて、情けないけど、でも……

やっぱり……こいつは、異常だ……。
こいつが、ニュージェネの真犯人だ……。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600500su">
「だから、僕を失望させないよう、やり遂げてほしい」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600510su">
「キミならできるよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600520ta">
「なん、なんで……僕な……の……！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600530ta">
「僕じゃなくても……
ぼ、僕なんか……じゃなくても、イイじゃないか……！」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600540su">
「キミでなくちゃダメなんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600550ta">
「だ、だだ、だからなんで！？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600560su">
「キミは選ばれた人間だから」

選ばれた……人間……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600570se">
「勘違いしちゃダメだよ、タッキー」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600580se">
「あいつの言う“選ばれた”ってのは、次の犠牲者として選ばれたって意味なんだから」

一連のニュージェネ事件の犠牲者たちの悲惨な末路を思い出し、
僕は身震いする。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600590su">
「キミは、今日の昼間のことをもちろん覚えているよね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600600ta">
「ひ、昼……間……？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600610su">
「学校で、キミは岸本あやせを助けた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE回想in","SE_衝撃_衝撃音02");
	SoundPlay("SE回想in",0,1000,false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 300, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("フラッシュバック", 200, 0, 0, "cg/ev/ev064_01_1_あやせ飛び降りようと_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601017]
『将軍』はメールでもあやせの自殺未遂騒ぎに言及していた。
あの騒動をどこかから見ていたに違いない。

あるいは、あやせを自殺するよう
マインドコントロールした張本人かも……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 300, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("フラッシュバック", 200, Center, Middle, "cg/ev/ev066_01_1_あやせ花壇落ち_a.jpg");
	Request("フラッシュバック", Smoothing);
//	Move("フラッシュバック", 0, @-400, @-300, null, true);
	Zoom("フラッシュバック", 20000, 500, 500, Dxl2, false);
	Fade("フラッシュバック", 0, 1000, null, true);
	Fade("回想フラッシュ", 500, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602017]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600620su">
「あの花壇のおかげで、岸本あやせは一命を取り留めた。そうでしょ？」

『将軍』は、僕が持っているっていう力のことを知っている……。

あのとき、あの場にいた誰もが花壇のことを不思議に思っていなかった。

認識してたのはセナだけだ。
そしてセナは僕にこう言った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 200, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	CreateColor("色２", 400, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 0, null, true);
	Fade("回想明度", 300, 0, null, false);
	Fade("色１", 300, 1000, null, false);
	Fade("色２", 300, 500, null, false);
	Stand("buセナ_制服_通常","hard", 200, @100);
	FadeStand("buセナ_制服_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603017]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/12600630sn">
「お前が妄想したんだろう？」

{	DeleteStand("buセナ_制服_通常_hard", 200, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600640se">
「タッキー！『将軍』の言うことは全力で否定して！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("フラッシュバック");
	Delete("色１");
	Delete("色２");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604017]
そ、そうか……！
『将軍』が僕に付きまとうのは、
『将軍』が僕を殺そうとするのは、

僕がその力とやらを持ってるからかもしれないんだ。

力なんてないって主張すれば、見逃してもらえるかも……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600650ta">
「ぼ、僕には……そんな力……ない……」

//◆将軍は拓巳の力のことを知っている。あえて拓巳の言葉尻を捉えて追い詰めようとしている。
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600660su">
「力？　力ってなんのこと？　僕はそんな言葉は一言も使っていないが」

あ、しまった……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600670se">
「タッキーには力なんてないよ。ただのキモオタなんだよ。タッキーにヒーローの素質なんてないんさ。あたしにハァハァしてるだけの、無害な引きこもり予備軍。そうっしょ？」

そうだよ……。

僕に特別な力があるなんて、そんなの中２病だ。

セナとかあやせにいろいろ言われて、僕もすっかりその気になりかけてたけど。

そもそもあの２人は明らかにメンヘラだ。

メンヘラの言葉を鵜呑みにするなんてどうかしてる。

梨深だって“それこそ妄想じゃない？”って言ってたし。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600680su">
「詳しく説明してくれない？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600690su">
「あの花壇のこととか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600700ta">
「ぼ、僕がやったっていう証拠は、あ、あるの！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600710ta">
「か、花壇を、なにもないところから出現させるなんて、そ、そんなの、僕には無理――」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600720su">
「花壇が、なにもないところから出現したんだ。ふ～ん」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600730su">
「他の人は誰もが、最初からそこに花壇があったって話していたけど」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600740su">
「キミだけは、花壇は、最初はそこになかったって。そう認識しているわけだ」

うう……
また墓穴を掘ったかも……

っていうか、『将軍』は何者なの……？
“他の生徒や教師がそう話していた”って、まさか『将軍』自ら彼らに話を聞いたの？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600750ta">
「ぼ、僕は、力なんてない……。
じ、自分でも、い、いったい、どうやったのか……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12600760su">
「でも、使えた。キミが妄想したことが、現実になった」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600770se">
「惑わされないで」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	CreateColor("色２", 250, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 0, null, true);
	Fade("色１", 300, 1000, null, true);
	Fade("色２", 0, 500, null, true);
	Stand("bu星来_覚醒後_通常","angry", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_angry", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601019]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600780se">
「タッキー、ホントに力なんてあると思う？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600790se">
「そんなのアニメの世界じゃん」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600800se">
「タッキーがいるのは、現実なんだよ？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600810se">
「花壇のことも、あやせっちが２人に分裂したことも、
それらが現実だったって証明できる？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600820se">
「無理っしょ？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600830se">
「分裂したあやせっちの身体に触った？」

触ってない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu星来_覚醒後_通常","normal", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_normal", 300, true);
	DeleteStand("bu星来_覚醒後_通常_angry", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600840se">
「ただの幻かも」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600850se">
「そもそもタッキーはあのとき、警察とか優愛っちに追われて動転してたし」

じゃあ、花壇は……？

{	Stand("bu星来_覚醒後_通常","shock", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_shock", 300, true);
	DeleteStand("bu星来_覚醒後_通常_normal", 0, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600860se">
「おんなじだよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600870se">
「花壇は“最初からそこにあった”」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600880se">
「タッキーは梨深っちを探してあそこへ行ったとき、
頭が痛くてフラフラしてた」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600890se">
「あやせっちが落ちるまでにはっきりと
“そこに花壇があること”を確認した？」

{	Stand("bu星来_覚醒後_通常","normal", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_normal", 300, true);
	DeleteStand("bu星来_覚醒後_通常_shock", 0, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600900se">
「みんな誰ひとりとして花壇が“出現したこと”を疑問に思ってないってことはさ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600910se">
「逆に言えば“最初からそこにあったから”疑問に思わないってことっしょ？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600920se">
「タッキーが間違えてただけなんだよ」

{	Stand("bu星来_覚醒後_通常","angry", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_angry", 300, true);
	DeleteStand("bu星来_覚醒後_通常_normal", 0, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12600930se">
「『将軍』の言葉に惑わされちゃダメ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600940ta">
「花壇は、最初からそこにあった……」

僕は星来たんの言葉を繰り返す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu星来_覚醒後_通常_angry", 500, true);
	Fade("色２", 0, 0, null, true);
	Fade("色１", 2000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600950ta">
「さ、さい、最初は、そこにはなかったって思い込んでたけど、記憶違いだった……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600960ta">
「ぼ、僕の、脳内での妄想だよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600970ta">
「だ、だって、みんなあそこには、か、花壇があったって、い、言ってるんで、しょ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600980ta">
「力とか、そういう、わ、わけの分からないものじゃなくて……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12600990ta">
「ただの、お、思い込み……だったんだ……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601000su">
「いいや。キミには、力がある」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601010su">
「そうだろう？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12601020ta">
「し、死にたく……ない……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601030su">
「そうだろう？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12601040ta">
「わ、分からない……殺さないで……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601050su">
「キミは自分の天才的な力について、もっと自覚するべきだよ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601060su">
「その潜在能力はすごすぎる」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601070su">
「キミなら、世界を変えることだってできるんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12601080ta">
「…………」

帰りたい……。
ベースに引きこもって、延々とエンスーを廃人プレイしていたい。

星来たんのフィギュアを見てニヤニヤして、ブラチューを延々と繰り返し見続けていたい。

僕が望んでいるのは、それだけなのに……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12601090se">
「タッキー、早く逃げて……」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12601100se">
「あたしがずっと一緒にいてあげる」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12601110se">
「あたしだけがタッキーの味方なの」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12601120se">
「だから帰ろう？　三次元との繋がりなんて断ち切って、楽しいことだけして生きよう？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601130su">
「さて、前置きはこれぐらいにして、そろそろクエストを始めよう」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601140su">
「まずは下のスクランブル交差点がよく見えるところまで行ってほしい」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12601150se">
「逃げなきゃ。このままじゃホントに殺されちゃうよ……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601160su">
「聞こえなかった？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601170su">
「スクランブル交差点を見下ろせるところへ移動するんだ」

口調は柔らかいけど、声はすごく冷たい。

逆らう気力を根こそぎ奪っていきそうなくらいに研ぎ澄まされた声。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12601180ta">
「な、なにを……」

足が震えて、歩けない。
僕は自分自身を抱きしめた。

言うことを聞くべきなのか、聞かないべきなのか、
その判断能力さえ失っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601190su">
「僕の言うことが聞けない？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601200su">
「従ってもらわないと、七海ちゃんの命は保証できないよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12601210se">
「どうせもう死んじゃってるよ。タッキーが今から頑張ったって、ただの無駄死にだよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12601220ta">
「な、なな、み……の、声……聞かせて……」

かすれた声をなんとか絞り出す。
けれど僕の懇願を、『将軍』はあっさりと突っぱねた。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601230su">
「その必要はないよ。キミはもう少し今の状況を考えた方がいい」

うう……

僕は――

七海が死んじゃったなんて、思いたくなかった……。死んだ七海を、想像したくない。想像したら本当になりそうで、怖い……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
僕は観念すると、『将軍』の言う通りにスクランブル交差点を見下ろせる方へと歩を進めた。

足許は暗く、慎重に歩かないと蹴躓いちゃいそうだ。

この屋上階のスクランブル交差点側は、透明のアクリル板が壁のように上へせり出していた。高さはおよそ３階分くらいある。

その壁に近づいていくと、眼下の交差点の喧噪が聞こえてきた。

ひとりの女性の喋り声がやけに耳に付くけど、どうやらそれは隣のビルの街頭ビジョンの音声みたいだった。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601240su">
「アクリル板の壁に、１ヵ所だけ壊れて穴が開いている部分があるだろう？」

額の脂汗を拭いながら、目だけを動かして壁をざっと調べてみる。確かに１ヵ所、人がひとり立って通り抜けられそうな穴が開いていた。

叩き割られたように不自然な形。明らかに、人の手によって壊されたものだ。

もちろん穴の向こうには、なにもない。
断崖絶壁、８階下のコンクリートに真っ逆さまだ。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601250su">
「そこから顔を出して、下にいるギャラリーに挨拶してあげて」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12601260ta">
「え……！？」

今……なんて言ったの……？

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601270su">
「もう一度言おうか？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601280su">
「その穴から、身を乗り出して、下にいる人たちに手を振ってあげてほしい」

こ、こいつ……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12601290se">
「ほらぁっ！　あいつ、タッキーを殺す気なんだって！」

ゴクリ、と息を呑む。
こうやって……５人もの人間を飛び降りさせたのか……。

やっぱり星来たんの言う通りだ……。

僕も死ぬしかないんだ。
ここから、飛び降りなくちゃいけないんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12601300ta">
「そ、そんなの、イヤだ……っ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12601310su">
「拒否すれば七海ちゃんは死ぬよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12601320se">
「従えばタッキーは死んじゃうよっ」

どうしろって、言うんだよぅ……

最善の行動を考えようとしたけど、いろんなパターンの“最悪の妄想”がグルグル頭の中を回っていて、まともな思考ができない。

助けて、誰か……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(500);

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 1000, 0, false);

	SoundPlay("フラッシュ", 1000, 1000, false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 300, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("フラッシュバック", 200, 0, 0, "cg/ev/ev030_01_2_七海バングル_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
//ＶＦ//回想セリフ
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12601330na">
「おにぃのバ～カ」

パニックになった僕の耳に、七海の声がこだまする。

//ＶＦ//回想セリフ
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12601340na">
「へへ～、バ～カ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 300, 1000, null, true);
	Delete("回想明度");
	Delete("フラッシュバック");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601026]
僕の目に、笑顔を浮かべた七海の何気ない仕草がよみがえる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12601350ta">
「…………」

僕の、せいなんだ……。
七海はまったく無関係なのに、僕のせいで、『将軍』に拉致されて、腕を切り落とされて……

ごめん、七海……ごめん……

僕は涙を拭いた。
それでもなお溢れてくるけど、また拭いた。

そしてかすむ視界の中、壊された穴にそろそろと近づき、

恐る恐る、下をのぞき込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//渋谷の夜景//暗い
//※Ｏ－ＦＲＯＮＴ屋上から見た渋谷の夜景。できればパノラマで左右にスクロールするぐらい幅があるといいかも。その中に拓巳のディソードの形状が紛れ込んでいる（【夜景と剣イメージ.jpg】参照）
//※左奥に、２００７年１２月現在取り壊されて更地になっている「東急文化会館」のビルと、その屋上のプラネタリウムが建っていることにしてください。そのプラネタリウムのドームがノアⅡという設定です。

	CreateSE("SE02","SE_日常_歓声_LOOP");
	SoundPlay("SE02", 1000, 1000, true);

	CreateTextureEX("背景２", 100, -320, 0, "cg/bg/bg163_01_3_渋谷夜景暗い_a.jpg");
	Request("背景２", Smoothing);
	Zoom("背景２", 0, 2000, 2000, null, true);
	SetBlur("背景２", true, 3, 500, 200);
	Zoom("背景２", 1000, 1000, 1000, Dxl3, false);
	Fade("背景２", 1000, 1000, null, true);

	SetBlur("背景２", false, 1, 0, 0);

	Wait(1000);

	Move("背景２", 800, @320, @0, AxlDxl, true);

	Wait(500);

	Move("背景２", 1600, @-480, @0, AxlDxl, true);

	Wait(500);

	Move("背景２", 800, @80, @-80, AxlDxl, true);

	Wait(1000);

//※大歓声がわき起こる

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
いきなり、地響きにも似た大歓声がわき起こった。

駅前に集まった大群衆。そして、マスコミ。

ちょうど時を同じくして始まろうとしていた、なにかのイベントの集まり――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_はいけい_すくらんぶる交差点ガヤ_ぴりぴり_LOOP");
	SoundPlay("SE01", 2000, 1000, true);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg164_01_3_スポットライト_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, false);

//イメージＢＧ//渋谷の夜景//明るい
//※マスコミのライトがいっせいに拓巳に向けられた
	CreateSE("SE04","SE_日常_照明点灯");
	SoundPlay("SE04", 0, 1000, false);
	Wait(500);
	CreateSE("SE05","SE_日常_照明点灯");
	SoundPlay("SE05", 0, 1000, false);
	Wait(300);
	CreateSE("SE06","SE_日常_照明点灯");
	SoundPlay("SE06", 0, 1000, false);
	CreateSE("SE03","SE_擬音_ふらっしゅ_大量");
	SoundPlay("SE03", 0, 1000, false);

	Delete("回想フラッシュ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
と、まばゆい光が僕を襲った。
反射的に僕は目を細めて顔をそむける。

そしたら、隣のビルの街頭ビジョンが目に入って、
そこに映し出されていたのは、紛れもなく――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
//ＣＧ//スクランブル交差点街頭ビジョン
//※Ｑ－ＦＲＯＮＴと、隣の大盛堂書店のビルにある街頭ビジョン。どちらにも拓巳の姿が映っている

//ＣＧ管理用フラグ
	#bg165_01_3_OFRONT見上げ_a=true;

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg165_01_3_O-FRONT見上げ_a.jpg");
	Fade("背景２", 2000, 1000, null, true);

	Wait(1000);

	Fade("背景１", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
僕だった。

え……僕……？

街頭ビジョンに映っている僕は、涙で顔をぐしゃぐしゃにして、アホみたいにポカンと口を半開きにしている。しかもへっぴり腰だ。

最初は幻覚かと思った。

次に、どこかで盗撮された録画映像に思えて寒気がした。

さらに、『将軍』が思考盗撮した映像があそこに映し出されてるのかと疑った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE02", 2500, 0, false);
	CreateSE("SE04","SE_自然_風音_強_LOOP");
	SoundPlay("SE04", 1000, 1000, true);
	#ev057_01_3_Q－FrontTVモニター_a=true;
	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev057_01_3_Q-FrontTVモニター_a.jpg");
	Fade("背景１", 400, 1000, null, false);
	Move("背景１", 2500, @0, @-742, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601029]
最後に、{	Wait(1000);}これが今この瞬間の、この場所にいる、僕を映したものだって気付いた。

街頭ビジョンに映るライブ映像には、煽り文句のテロップまで入れられている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ管理用フラグ
	#bg165_01_3_OFRONT見上げ_a=true;

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg165_01_3_O-FRONT見上げ_a.jpg");
	SoundPlay("SE04", 1000, 0, false);
	Fade("背景２", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602029]
『渋谷駅前より完全生中継』
『驚異のエスパー少年ついに登場！』

画面下にも解説テロップがスクロールしていた。

//■３６０
//『世界の超能力者、ユーリ・ブライトマンが推薦する驚異のエスパー少年。緊急生出演！』
『世紀の超能力者、ユーリ・ブライトマンが推薦する驚異のエスパー少年。緊急生出演！』
『ニュージェネ犯人の正体を透視か！？』

それを読んで、ようやく理解した。

スクランブル交差点に集まっているマスコミや
野次馬が見ているのは……僕だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//――僕を、見るな。
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "――僕を、見るな。");

	SetBacklog("――僕を、見るな。", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg166_01_3_拓巳見下ろし_a.jpg");
	Fade("背景１", 1000, 1000, null, true);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603029]
なんで、僕なんかに注目するんだ。
エスパー少年？　なんだよそれ。

今日がどんな日だったか、みんな分かってるのか？

地震が起きたんだぞ。震度５だぞ。１００人以上死んだんだぞ。

なのに、
どうして、
みんな、

僕みたいなキモオタを待ち構えて、バカ騒ぎをしているんだ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("２８");
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 2000, 0, false);

	EndTrigger();
	
}