//<continuation number="500">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_177_インターミッション４２";
		$GameContiune = 1;
		Reset();
	}

		ch09_177_インターミッション４２();
}


function ch09_177_インターミッション４２()
{

	$SYSTEM_last_text="第９章";

	if(Platform()!=100){
		Save(9999);
	}

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//Ｃｈａｏｓ；Ｈｅａｄ　第９章

//――――――――――――――――
//■第９章【giga-lo-maniac】


//１１月６日（木）//日付は表示しない

//■インターミッション４２
//ＢＧ//山手線内//夕方

	ChapterIn("dx/mvH.avi");

		DeleteAll();

		CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg112_01_2_山手線車内_a.jpg");
		Fade("back04", 0, 1000, null, true);

		Stand("st優愛_制服_通常左手下","worry", 200, @+150);
		FadeStand("st優愛_制服_通常左手下_worry", 0, false);
		Stand("st安二_スーツ_通常","hard", 210, @-150);
		FadeStand("st安二_スーツ_通常_hard", 0, true);

	ChapterIn2();

	CreateSE("SE01","SE_はいけい_山手線でん車内_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
車窓の外に見える空は、藍色に染まりつつあった。

仕事帰りのサラリーマンや下校する学生で、山手線の車内は混雑し始めている。

楠優愛と判安二は、肩を並べてつり革を握りながら、電車に揺られていた。

この奇妙な組み合わせは人目を引くのか、優愛はさっきからしきりに周囲の視線を感じていた。

{	Stand("st優愛_制服_通常","worry", 200, @+150);
	DeleteStand("st優愛_制服_通常左手下_worry", 300, false);
	FadeStand("st優愛_制服_通常_worry", 300, true);}
そのせいか、落ち着きなく髪をいじったりメガネの位置を直したりを繰り返している。

数日前に会ったばかりの刑事――判と親しげに世間話をできるほどの心の余裕もない。

{	Stand("st優愛_制服_通常左手下","worry", 200, @+150);
	DeleteStand("st優愛_制服_通常_worry", 300, false);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);}
原宿から渋谷までは一駅。ほんの３分ほどのその時間を、実際より長く感じずにはいられなかった。

判はただ黙って、窓の外を眺めている。
優愛に会話を振ろうとはしない。

優愛の判に対する評は、悪い人じゃなさそうだけどちょっと怖い、というものだった。

刑事という職業の人には、妹の事件に絡んで何度か会っているが、あまりいい印象はない。<k>
そのせいで判にも苦手意識があるのかもしれない。

優愛はそう自己分析した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆オタク１の「番人」のイントネーションについて。「番」を強調してください
//【オタク１】
<voice name="オタク１" class="オタク１" src="voice/ch09/17700010o1">
「だから地下１５階の番人倒せば隠しダンジョン行けるだろ、常識的に考えて」

//【オタク２】
<voice name="オタク２" class="オタク２" src="voice/ch09/17700020o2">
「番人どこにいるか分からんなりー」

原宿駅で電車に乗り込んだときから、ドアの近くに立つ２人の男がやたらと大きな声で話し続けている。

周囲の迷惑も顧みないその声は、聞きたくなくても優愛の耳に入ってくる。

//◆オタク１の「番人」のイントネーションについて。「番」を強調してください
//【オタク１】
<voice name="オタク１" class="オタク１" src="voice/ch09/17700030o1">
「マップの左端の方だよ。一目で分かるだろ、番人！」

//【オタク２】
<voice name="オタク２" class="オタク２" src="voice/ch09/17700040o2">
「っていうか番人と警官の区別付かないぞなもしー」

//◆オタク１の「番人」のイントネーションについて。「番」を強調してください
//【オタク１】
<voice name="オタク１" class="オタク１" src="voice/ch09/17700050o1">
「いやいや、どう見ても番人だろ。どこが警官なんだよ。番人は銃持ってねえよ」

その２人は、かなり地味な服装をしていて、額にはバンダナ、手には指出しの手袋を付け、背中にパンパンに膨らんだリュックを背負っていた。

いわゆるオタクという人種である。

優愛はアニメやマンガを好んで見ていることもあり、彼らの外見にあまり抵抗はない。ただ、秋葉原に行ったことは一度もなく、オタクとしてステレオタイプな格好をしている人間を見るのは初めてだった。

珍しがってついチラチラと見つめてしまった自分の無礼さに気付き、慌てて目を伏せる。

目の前の座席に座っているのは、紺色のブレザーを着崩した、茶髪の女子高生だった。

派手なネイルチップをした指で、ケータイのメールを打っている。彼女が指を動かすたびに、拳銃を模したストラップがゆらゆらと揺れる。

自然と、そのメールの内容が優愛の目に入った。
なぜなら、女子高生は妙にケータイを寝かした状態でメールを打っているからだ。

まるで、優愛に見せつけているかのようだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

//以下、座っている女子高生のメール文の内容
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
昨日ケ→サツの人と合コンＵたωだけど、超つまんなかったヨ★ＫＹなォヤジがひとりぃτゥザかった★死ねっτ感じ＼（￣ε￣）／

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
//以上、座っている女子高生のメール文の内容
//※↑ギャル文字です
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
同じ女子高生でありながら、優愛にはその文章がまったく読めなかった。いわゆるギャル文字というものだと思われるが、なにかの暗号にしか見えない。

//【子供１】
<voice name="子供１" class="子供１" src="voice/ch09/17700060co">
「バーン！」

{	Stand("st優愛_制服_通常左手下","shock", 200, @+150);
	FadeStand("st優愛_制服_通常左手下_shock", 300, true);
	DeleteStand("st優愛_制服_通常左手下_worry", 0, true);}
いきなり、車内に子供の声が響き渡る。
優愛はギョッとして、声のした方へと振り返った。

５歳くらいの男児が、判のすぐ傍らに立っていた。

{	Stand("st優愛_制服_通常左手下","worry", 200, @+150);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("st優愛_制服_通常左手下_shock", 0, true);}
手にはオモチャの水鉄砲を持ち、その銃口を判に向けている。引き金を実際に引いてはいるが、水は出なかった。

//【子供１】
<voice name="子供１" class="子供１" src="voice/ch09/17700070co">
「バーン！」

{	Stand("st安二_スーツ_通常","pride", 210, @-150);
	FadeStand("st安二_スーツ_通常_pride", 500, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, true);}
判はその子供ににっこりと笑顔を向ける。
目は笑っていなかったが、それでも子供はひるもうとしなかった。

//◆のぶくん＝子供の名前
//【母親１】
<voice name="母親１" class="母親１" src="voice/ch09/17700080hx">
「のぶくん、やめなさい」

すぐに母親らしき女性が子供に駆け寄ってくる。
彼女は判に向かって小さく頭を下げた。

//【母親１】
<voice name="母親１" class="母親１" src="voice/ch09/17700090hx">
「すいません」

//【子供１】
<voice name="子供１" class="子供１" src="voice/ch09/17700100co">
「バーン！　バーン！」

//【母親１】
<voice name="母親１" class="母親１" src="voice/ch09/17700110hx">
「のぶくん！　やめなさいって！」

母親はかなり強い口調で子供を止めようとしている。
ただし、あくまでも口だけの注意。
水鉄砲を取り上げたり、子供の手を下げさせたりはしない。

//【子供１】
<voice name="子供１" class="子供１" src="voice/ch09/17700120co">
「バーン！　バーン！　バーン！」

//【母親１】
<voice name="母親１" class="母親１" src="voice/ch09/17700130hx">
「本当にすみません」

//【判】
<voice name="判" class="判" src="voice/ch09/17700140bn">
「いや、構いませんよ」

//【子供１】
<voice name="子供１" class="子供１" src="voice/ch09/17700150co">
「バーン！　バーン！　バーン！」

//【母親１】
<voice name="母親１" class="母親１" src="voice/ch09/17700160hx">
「おじさんが困ってるでしょう？　のぶくん！」

優愛には、それがとても不自然な光景に見えた。

母親は子供に対し怒った表情を向け、判には申し訳なさそうな顔をする。
でもただそれだけだ。

//【子供１】
<voice name="子供１" class="子供１" src="voice/ch09/17700170co">
「バーン！　バーン！　バーン！」

//【母親１】
<voice name="母親１" class="母親１" src="voice/ch09/17700180hx">
「やめなさい！　怒るわよ！」

//【子供１】
<voice name="子供１" class="子供１" src="voice/ch09/17700190co">
「バーン！　バーン！　バーン！」

子供は悪びれることなく、壊れたオモチャのように同じフレーズを繰り返し続ける。それでもなお、母親は言葉とは裏腹にまったく止めようとしていない。

//【母親１】
<voice name="母親１" class="母親１" src="voice/ch09/17700200hx">
「本当に、本当にすみません……」

//【子供１】
<voice name="子供１" class="子供１" src="voice/ch09/17700210co">
「バーン！　バーン！　バーン！」

{	Stand("st安二_スーツ_通常","normal", 210, @-150);
	FadeStand("st安二_スーツ_通常_normal", 300, true);
	DeleteStand("st安二_スーツ_通常_pride", 0, true);}
判も判で、なぜか子供がするがままにして放置していた。

//【子供１】
<voice name="子供１" class="子供１" src="voice/ch09/17700220co">
「バーン！　バーン！　バーン！」

結局、渋谷駅に着くまでそれは続いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);

	WaitAction("SE01", null);

	PrintBG(100);

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 1000, 1000, null, true);

	Wait(1000);

//ＢＧ//渋谷駅・山手線ホーム//夕方
	CreateBG(100, 1000, 0, 0, "cg/bg/bg111_01_2_渋谷駅山手線ホーム_a.jpg");

	CreateSE("SE01","SE_はいけい_山手線ほーむ_LOOP");
	MusicStart("SE01", 500, 600, 0, 1000, null, true);

	Stand("st優愛_制服_通常左手下","worry", 200, @+150);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
渋谷駅に電車が到着し、扉が開く。
水鉄砲の親子は降りようとはしなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","pride", 210, @-150);
	FadeStand("st安二_スーツ_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
優愛はホッとして、判とともにホームへと降りる。
判の表情を窺うと、苦笑していた。

//ＶＦ//駅のアナウンス
//【駅員】
<voice name="駅員" class="駅員" src="voice/ch09/17700230ei">
「お急ぎ中のお客様にお知らせいたします」

//◆バンゴウモン＝「判・拷問」とかけてます……
//【駅員】
<voice name="駅員" class="駅員" src="voice/ch09/17700240ei">
「地下鉄バンゴウモン線――」

//【駅員】
<voice name="駅員" class="駅員" src="voice/ch09/17700250ei">
「失礼しました。半蔵門線は、人身事故の影響でただいま振り替え運転を行っております」

//【駅員】
<voice name="駅員" class="駅員" src="voice/ch09/17700260ei">
「お客様には大変ご迷惑を――」

//【判】
<voice name="判" class="判" src="voice/ch09/17700270bn">
「最近よく感じるんだが」

ホーム上の人の流れがうねる。
その人ごみの中をハチ公口改札へ向かって歩きながら、判がふと優愛に向かってつぶやいた。

{	Stand("st安二_スーツ_通常","hard", 210, @-150);
	FadeStand("st安二_スーツ_通常_hard", 300, true);
	DeleteStand("st安二_スーツ_通常_pride", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/17700280bn">
「まるで不特定多数の人間にストーカーされてるような気がするんだよな」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/17700290yu">
「どういう、ことですか？」

//【判】
<voice name="判" class="判" src="voice/ch09/17700300bn">
「さっきみたいなことがよくあるって話さ」

//【判】
<voice name="判" class="判" src="voice/ch09/17700310bn">
「周囲の人間の何気ない行動が、まるで自分への嫌がらせじゃねえかって思えてくるわけよ」

だから判は、さっきの子供の悪戯にもあえて黙っていたのだった。

あのような、トラブルとも呼べないトラブルが日常茶飯事になっている。
いちいち気にしていたら神経が保たなくなる。

{	Stand("st安二_スーツ_通常","normal", 210, @-150);
	FadeStand("st安二_スーツ_通常_normal", 300, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/17700320bn">
「ま、考えすぎだろうが。俺みたいな地味なおっさんに興味があるヤツなんて、そうそういねえだろうし」

{	Stand("st優愛_制服_通常","worry", 200, @+150);
	DeleteStand("st優愛_制服_通常左手下_worry", 500, false);
	FadeStand("st優愛_制服_通常_worry", 500, true);}
//◆不安なブレス
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/17700330yu">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","hard", 210, @-150);
	FadeStand("st安二_スーツ_通常_hard", 300, true);
	DeleteStand("st安二_スーツ_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【判】
<voice name="判" class="判" src="voice/ch09/17700340bn">
{#TIPS_集団ストーカー = true;$TIPS_on_集団ストーカー = true;}「ただ、<FONT incolor="#88abda" outcolor="BLACK">集団ストーカー</FONT>ってのは確かに存在するんだよな」

{	Stand("st優愛_制服_通常左手下","shock", 200, @+150);
	DeleteStand("st優愛_制服_通常_worry", 500, false);
	FadeStand("st優愛_制服_通常左手下_shock", 500, true);}
{$TIPS_on_集団ストーカー = false;}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/17700350yu">
「普通のストーカー行為とは、なにが違うんですか？」

//【判】
<voice name="判" class="判" src="voice/ch09/17700360bn">
「被害を受けてる側からすると相手の意図や目的、正体すらまったく分かんねえんだ」

//【判】
<voice name="判" class="判" src="voice/ch09/17700370bn">
「ただ、誰かに、行く先々で、毎日のように、様々な嫌がらせを受けていると感じる」

//【判】
<voice name="判" class="判" src="voice/ch09/17700380bn">
「集団ストーカーってのはそういうもんだ」

{	Stand("st優愛_制服_通常左手下","worry", 200, @+150);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("st優愛_制服_通常左手下_shock", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/17700390yu">
「ただの、考えすぎ、っていう可能性は……」

{	Stand("st安二_スーツ_通常","normal", 210, @-150);
	FadeStand("st安二_スーツ_通常_normal", 300, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/17700400bn">
「じゅうぶんにあり得るだろうな。強迫観念と紙一重だ」

//【判】
<voice name="判" class="判" src="voice/ch09/17700410bn">
「俺の場合はそうでもなさそうなんだけどな。ここ数日は、相手もかなり直接的な手段に出てきてやがる」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/17700420yu">
「と、言いますと……？」

//【判】
<voice name="判" class="判" src="voice/ch09/17700430bn">
「手を引けって脅迫する匿名の電話が、何度かかかってきてなあ」

判はなぜかヘラヘラと笑いながらそう言う。
優愛の方が逆に怯えてしまい、自らの二の腕を抱きしめた。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/17700440yu">
「あの、それ、だ、大丈夫、なんですか？」

//【判】
<voice name="判" class="判" src="voice/ch09/17700450bn">
「ま、刑事にゃよくあることさ」

{	Stand("st安二_スーツ_通常","hard", 210, @-150);
	FadeStand("st安二_スーツ_通常_hard", 300, true);
	DeleteStand("st安二_スーツ_通常_normal", 0, true);}
判は平然とそう答えてから、すぐに表情を引き締めて優愛を見た。

//【判】
<voice name="判" class="判" src="voice/ch09/17700460bn">
「優愛ちゃんは、最近そんなようなことはないかい？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/17700470yu">
「は、はい。ない、と思います……」

//【判】
<voice name="判" class="判" src="voice/ch09/17700480bn">
「身の回りでちょっとでも違和感を覚えることがあったら、すぐにおじさんに言ってくれ」

{	Stand("st安二_スーツ_通常","normal", 210, @-150);
	FadeStand("st安二_スーツ_通常_normal", 300, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/17700490bn">
「優愛ちゃんの身の安全を守るのは、警察の仕事だからな」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/17700500yu">
「はい……」

彼女はその話を聞いて、今自分が関わっていることが予想以上に危険なものであることを自覚した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2000, 0, NULL);

	ClearAll(1000);
	
	Wait(3000);
//～～Ｆ・Ｏ

//■インターミッション４２終了

//アイキャッチ

}