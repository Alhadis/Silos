//<continuation number="830">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_017_帰宅";
		$GameContiune = 1;
		Reset();
	}

	ch01_017_帰宅();
}


function ch01_017_帰宅()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//☆Cut-67-----------------------------
//ＢＧ//ＫＵＲＥＮＡＩ会館前//夜
	CreateBG(100, 1000, 0, 0, "cg/bg/bg005_01_3_KURENAI見上げ_a.jpg");

	CreateSE("SE04","SE_日常_雑踏02");
	MusicStart("SE04", 2000, 600, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕のベースのあるビルまで、僕も優愛も無言だった。

女子とまともな会話なんてできるわけがない。

アニメやゲーム、フィギュアの話題を振ったって、三次元女は理解しようともせずにただ"キモい"って条件反射のように言うに決まってる。

僕にしてみれば、そんなクソ女どもとは話す価値もなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700010ta">
「こ、ここで、もう、いいから……」

なんとかそれだけつぶやいて、相手の反応を窺う。
優愛は小さくうなずくと、僕を支えていた手を離した。

{	Stand("bu優愛_制服_通常左手下","worry", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);}
まだ少しふらつく。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700020yu">
「やっぱり、その……お部屋までついていきましょうか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700030ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常左手下_worry", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
その申し出を無視して、僕はビルのエントランスに向かう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//※※３６０以下
//このビル――ＫＵＲＥＮＡＩ会館っていう８階建ての雑居ビルは、築２２年っていうオンボロだ。

//薄汚いし、エレベーターホール――ホールっていうほど広くないけど――は照明が切れていて暗いし、階段は急だし、エレベーターは一応ついてるけど三人乗ったらもういっぱいだし昇降スピードもイライラするぐらい遅い。

//ここの屋上にあるコンテナハウスが、僕のベースだ。

//ここに決めたのは、単純に親のコネ。どうやらこのビルのオーナーとは知り合いらしく、家賃をかなり安くしてくれたんだ。学校まで徒歩１０分っていうのも好条件だった。

//ホントは秋葉原に住みたかったけど、親がここじゃないとひとり暮らしは認めてくれなかったから、しょうがなくここに決めた。

//ま、住めば都っていう言葉もある通り、実際に住んでみるとなかなか悪くなかったのは幸いだったけど。

//１階はテナントみたいだけど、僕がここに住むようになってからずっとシャッターが閉じたままだ。

//その１階テナントのすぐ脇に狭い入り口があって、その奥がエレベーターホールだった。入る部分が少し階段状になっていて、そこを登ろうと足を上げた途端、激痛が走ってまたよろけそうになった。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
エントランスと言っても、エレベーターホールへ通じる狭い入り口だ。少し階段状になっていて、そこを登ろうと足を上げた途端、激痛が走ってまたよろけそうになった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※※３６０以上

	Stand("bu優愛_制服_通常左手下","worry", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700040yu">
「だ、大丈夫ですか？」

優愛が飛んできて僕を支えてくれる。
くそう、まだいたのかこの女……。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700050yu">
「やっぱり部屋まで送ります。ぜ、絶対、送りますからっ」

なぜか必死な様子でそう宣言した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("SE04", 3000, 0, null);

//ＢＧ//拓巳の部屋・外観
	CreateTexture360("back04", 100, center, middle, "SCREEN");

	Waitkey();
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, true);
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg006_01_3_コンテナ外観_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg006_01_3_コンテナ外観_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
正直なことを言えば、優愛にここまでついてきてもらったことでかなり助かった。

僕のベースがある屋上へは、エレベーターで８階まで上がってからさらに、急勾配の非常階段を登らなくちゃいけないんだけど、今の僕じゃとてもひとりで登れなかったんだ。

優愛は見た目にもそれほど体力があるようには見えない。
なのに一生懸命僕を支えて、息を切らしながら登らせてくれた。

{	Stand("bu優愛_制服_通常左手下","shock", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_shock", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700060yu">
「こ、こんなところに……住んでるんですね……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700070ta">
「…………」

コンテナハウスを見て、優愛は絶句している。
まあ、普通の人から見たらコンテナに住んでるなんて信じられないんだろう。

{	Stand("bu優愛_制服_通常左手下","normal", 200, @+150);
	DeleteStand("bu優愛_制服_通常左手下_shock", 300, false);
	FadeStand("bu優愛_制服_通常左手下_normal", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700080yu">
「なんか……その、憧れます」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700090ta">
「え……？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700100yu">
「アウトローな感じがして、いいですよね。こういうのって」

まさかそう言われるとは思わなかった。
僕に媚びでも売ってるつもりか？
騙されないぞ。三次元女には絶対騙されないからな。

僕は優愛に支えられたまま、扉にかけておいた南京錠を外して中に入った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常左手下_normal", 300, false);

	SetVolume("SE04", 500, 0, NULL);

	CreateSE("SE01","SE_日常_扉_開ける");
	MusicStart("SE01",0,1000,0,1000,null,false);


//ＢＧ//黒
	CreateBG(100, 1500, 0, 0, "cg/bg/bg026_03_4_拓巳部屋_a.jpg");
	Wait(2000);

	CreateSE("SE02","SE_日常_扉_閉まる");
	MusicStart("SE02",0,1000,0,1000,null,false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
はあ、やっと戻ってこられた……。
今日も災難だった。やっぱり引きこもっているのが一番いいよ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700110yu">
「真っ暗ですね……あの、電気のスイッチは、どこに……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700120ta">
「…………」

この女……図々しく部屋の中にまで入ってきたぞ。
いや、まあ、僕にずっと肩を貸してくれていたからっていうのはあるんだけど……。

できれば部屋の中をあんまり見られたくなかったのに。
なにしろ、棚にはフィギュアがたくさん並んでるし、ベッドの上はエロゲのパッケージが積み上げられてるし、床はゴミだらけだし。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700130ta">
「も、もう、いいから……は、離して」

そう伝えて、優愛の手が離れるのを待つ。
でもなかなか離してくれなかった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700140yu">
「床、すごく散らかって――じゃなくて、えっと、歩きにくいと思うんですけど……。絶対危ないです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700150yu">
「ソファまで、行きましょう。そこで離しますから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700160ta">
「…………」

{	CreateTextureEX("背景１", 200, 0, 0, "cg/bg/bg026_03_4_拓巳部屋_a.jpg");
	Fade("背景１", 1000, 1000, null, true);}
結局、言われるままにしてしまう。
ソファの上にもＣＤや雑誌が散乱していたけど、優愛は僕を支えたまま手早くそれらを片付けて、僕を座らせてくれる。

優しいし、よく気が付く人だな……。
って、騙されないぞ！　騙されないからな！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700170yu">
「平気ですか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700180ta">
「う、うん……」

部屋の中に、僕と彼女のふたりきり。
扉は開けっ放しにしてあるから、かろうじて外からの月明かりが入ってくるけど、室内はほとんど真っ暗だ。

だから優愛がどんな表情をしているか確かめることはできない。でも、よく見えないことで、逆に優愛の息づかいがやけに淫靡なものに聞こえてくる。

考えてみたら、この部屋に人が訪ねてくるなんて、妹以外じゃ初めてだ。しかもほぼ初対面の女子……。

ゲームならすでにフラグが立った状態だよね。
この後、いい雰囲気になって、
キスとかしちゃうようなシチュエーション。

でも僕はそんなもの期待してない。
現実はどこまでも残酷だ。二次元とは違う。
それにこの女は普通じゃない。ストーカー女なんだ。

っていうか優愛は、いつまで僕の目の前に突っ立ってるつもりだろう？
用は済んだんだからさっさと帰ればいいのに。

そこまで考えて、ハッとした。
まさかこの女、ふたりきりになったことでなにか恐ろしいことを企んでいるんじゃ――

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700190yu">
「あの、明かりのスイッチは……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700200ta">
「え、えっと、パソコンの……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700210yu">
「パソコン？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700220ta">
「…………」

この部屋の照明は、ＰＣの横に置いてあるデスクライトだけだ。
それを点ければいいよ、って言おうとしたけど、できなかった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700230yu">
「あ、そうか。あのデスクライトですね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700240ta">
「え、う、うん……」

優愛は足許のゴミを慎重に避けながら、ヨロヨロとした足取りでＰＣデスクまで行き、デスクライトを灯した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	CreateBG(100, 0, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	FadeDelete("背景１", 500, true);

	Stand("st優愛_制服_通常","normal", 200, @+100);
	FadeStand("st優愛_制服_通常_normal", 500, true);


	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
部屋がようやく闇から解放される。

真っ暗だったときは、見えないせいで逆にいろいろ妄想をかき立てられたけど、はっきり相手の顔が見えたら見えたで、目のやり場に困るし恥ずかしさは倍増する。

僕は完全になにも言えなくなって、慌ててうなだれた。

{	Stand("st優愛_制服_通常","shock", 200, @+100);
	FadeStand("st優愛_制服_通常_shock", 300, true);
	DeleteStand("st優愛_制服_通常_normal", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700250yu">
「あ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700260ta">
「！？」

急に声を上げられて、僕はビクリと身を震わせてしまった。優愛の視線は、ＰＣモニタの横でいつものように萌えポーズを決めている星来たんフィギュアへと向けられていた。

{	Stand("st優愛_制服_通常左手下","normal", 200, @+100);
	DeleteStand("st優愛_制服_通常_shock", 300, false);
	FadeStand("st優愛_制服_通常左手下_normal", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700270yu">
「これって、ブラチューの星来ちゃん……ですよね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700280ta">
「え……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700290ta">
「……し、知ってる……の？」

{	Stand("st優愛_制服_通常","smile", 200, @+100);
	DeleteStand("st優愛_制服_通常左手下_normal", 300, false);
	FadeStand("st優愛_制服_通常_smile", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700300yu">
「は、はい。ブラチューは大好きで、毎週見てます」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700310ta">
「へ、へえ……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700320yu">
「星来ちゃんがお好きなんですね。わたしもヒロインの中では彼女が一番好きなんですよ。衣装もかわいいですし」

声が弾んでる。お世辞で言ってるわけじゃなさそう。
意外だ。もしかして優愛って……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700330ta">
{#TIPS_腐女子 = true;$TIPS_on_腐女子 = true;}「<FONT incolor="#88abda" outcolor="BLACK">腐……女子</FONT>？」

{	Stand("st優愛_制服_通常左手下","normal", 200, @+100);
	DeleteStand("st優愛_制服_通常_smile", 300, false);
	FadeStand("st優愛_制服_通常左手下_normal", 300, true);}
{$TIPS_on_腐女子 = false;}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700340yu">
「？？？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700350ta">
「あ、ううん……」

単なるアニメ好きか。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700360yu">
「あれ、フィギュア……って言うんですよね？
ちょっと、見せてもらってもいいですか？」

{	Stand("st優愛_制服_通常左手下","worry", 200, @+100);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("st優愛_制服_通常左手下_normal", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700370yu">
「あ、すみません。図々しいこと言っちゃって……。もう、帰った方がいいですよね……」

慌てて何度も頭を下げている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700380ta">
「……み、見て、いいよ」

まあ、僕の嫁が誉められて悪い気はしない。だから少しは親切にしてやろうと思った。

{	Stand("st優愛_制服_通常","smile", 200, @+100);
	DeleteStand("st優愛_制服_通常左手下_worry", 300, false);
	FadeStand("st優愛_制服_通常_smile", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700390yu">
「本当ですか？　ありがとうございます」

優愛は星来を手に持つと、しげしげとそれを眺め始めた。

//山陽堂＝架空のフィギュアメーカー
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700400ta">
「そ、それは山陽堂版の覚醒前バージョンなんだ。星来フィギュアはいくつか種類が出てるけど、さ、最初に出たヤツ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","shock", 200, @+100);
	FadeStand("st優愛_制服_通常_shock", 300, true);
	DeleteStand("st優愛_制服_通常_smile", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//☆☆☆☆071011
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700410yu">
「へえ……」

//【拓巳】
{#TIPS_キャストオフ=true;$TIPS_on_キャストオフ = true;}
<voice name="拓巳" class="拓巳" src="voice/ch01/01700420ta">
「あんまりクオリティは高くないよ。顔とか、微妙に崩れてるし。ポーズも平凡すぎてあんまりエロくないし……。でも服の胸元部分を<FONT incolor="#88abda" outcolor="BLACK">キャストオフ</FONT>できるのは、い、今のところそれだけなんだ」

{	Stand("st優愛_制服_通常左手下","shy", 200, @+100);
	DeleteStand("st優愛_制服_通常_shock", 300, false);
	FadeStand("st優愛_制服_通常左手下_shy", 300, true);}
{$TIPS_on_キャストオフ = false;}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700430yu">
「む、胸元……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700440ta">
「あ、ちなみに僕は、星来フィギュアは４種類全部そろえてるよ。そ、そっちの棚に制服バージョンと、メイドバージョン、あと水着バージョンが、あ、ある」

{	Stand("st優愛_制服_通常","shock", 200, @+100);
	DeleteStand("st優愛_制服_通常左手下_shy", 300, false);
	FadeStand("st優愛_制服_通常_shock", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700450yu">
「そんなに種類が……すごいですね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700460ta">
「一番評価が高いのは、メイドバージョンなんだけど、個人的には、み、水着バージョンも悪くないよ」

{	Stand("st優愛_制服_通常左手下","worry", 200, @+100);
	DeleteStand("st優愛_制服_通常_shock", 300, false);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700470yu">
「そうなんですか。見てみたいですねえ。でもちょっと暗くて……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700480_1ta">
「もうすぐ、アルファから待望の覚醒後バージョンが、で、出るんだけど、これはかなりクオリティ高そうなんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700480_2ta">
「キャストオフも、胸元だけじゃなくてほぼ全身可能だって言うし、ひ、表情もポーズも質感も、言うことなしだね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700480_3ta">
「あとはカラーさえバッチリなら、今年発売されたフィギュアの中でもＭＶＰ候補だよ」

{	Stand("st優愛_制服_通常","shock", 200, @+100);
	DeleteStand("st優愛_制服_通常左手下_worry", 300, false);
	FadeStand("st優愛_制服_通常_shock", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700490yu">
「アルファ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700500ta">
「メ、メーカーだよ。フィギュアの」

{	Stand("st優愛_制服_通常","normal", 200, @+100);
	FadeStand("st優愛_制服_通常_normal", 300, true);
	DeleteStand("st優愛_制服_通常_shock", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700510yu">
「ああ、なるほど」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700520ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常_normal", 500, false);


//☆☆☆☆071011

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
ハッとして、僕は口をつぐんだ。
自分が、喋りすぎだって気付いたんだ。

しかも美少女フィギュアのことをペラペラと……。
服がキャストオフできるとか、ポーズがエロいとか、
アホなことを言っちゃった気がする……。

優愛がどんな表情をしているか確かめたいけど、その勇気はなかった。
絶対に、汚物でも見るような目を僕に向けているに違いない……。

だから必死で顔をあらぬ方向へ向けてドキドキしていたら、

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700530yu">
「あの」

呼びかけられて、僕は反射的に優愛へと顔を向けてしまった。

彼女の表情は、僕が恐れていたような、
軽蔑の混じったものではなくて――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","normal", 200, @+100);
	FadeStand("st優愛_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//笑顔
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700540yu">
「さっき言っていた、戦闘バージョンとか、メイドバージョンも、見せてもらっていいですか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700550ta">
「え……う、うん……。そ、そっちの棚に……」

僕は完全に戸惑ってしまった。
だって優愛は、すごく楽しそうに微笑んでいたから。

{	Stand("st優愛_制服_通常","smile", 200, @+100);
	FadeStand("st優愛_制服_通常_smile", 300, true);
	DeleteStand("st優愛_制服_通常_normal", 300, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700560yu">
「わあ、すごいですね！　こんなにたくさん！」

フィギュアが並んだ棚を見ても、むしろ目を輝かせている。まさか、これを見てひかない三次元女がいるなんて。

世界は広い、っていうことなのかな？

{	Stand("st優愛_制服_通常左手下","normal", 200, @+100);
	DeleteStand("st優愛_制服_通常_smile", 300, false);
	FadeStand("st優愛_制服_通常左手下_normal", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700570yu">
「あ、メイド星来ちゃんってこれですね。ふむふむ、アニメの印象とはちょっと違うけど、すごくかわいいです！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700580yu">
「うふふっ。下着までちゃんと作り込んであるんだ……。こういうの実物で見たのは初めてですけど、いいですねぇ。わたしも買ってみようかな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700590ta">
「だ、だったら……覚醒後バージョンを、よ、予約した方がいいよ。あれは、絶対オススメ、だから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","smile", 200, @+100);
	DeleteStand("st優愛_制服_通常左手下_normal", 300, false);

	FadeStand("st優愛_制服_通常_smile", 300, true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700600yu">
「そうですね。あなたの話を聞いていたら、その覚醒後バージョンは本気で欲しくなりました」

{	Stand("st優愛_制服_通常","normal", 200, @+100);
	FadeStand("st優愛_制服_通常_normal", 300, true);
	DeleteStand("st優愛_制服_通常_smile", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700610yu">
「覚醒後って、１２話のあのシーンのことですよね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700620ta">
「よく知ってますなあ、おぬし、かなりのマニアですな？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700630yu">
「はい。好きですから。特にあのときの覚醒シーンは毎日録画したものを見返してます」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700640ta">
「あのシーンって、演出と作画が宮地なんだ。だからクオリティ高くて当然」

{	Stand("st優愛_制服_通常","shock", 200, @+100);
	FadeStand("st優愛_制服_通常_shock", 300, true);
	DeleteStand("st優愛_制服_通常_normal", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700650yu">
「宮地？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700660ta">
「そういう神クリエーターがいるんだ。あの人の演出はマジで神だよ。＠ちゃんの実況板でも神キターってなるし」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700670yu">
「そうなんですかぁ」

{	Stand("st優愛_制服_通常左手下","normal", 200, @+100);
	FadeStand("st優愛_制服_通常左手下_normal", 300, true);
	DeleteStand("st優愛_制服_通常_shock", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700680yu">
「すごく知識が豊富なんですね。わたし、スタッフが誰かなんて、まるで気にしてませんでした」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700690ta">
「監督と演出と脚本は、チェックしとくといいよ。特に新作なんかは、それを調べるだけで内容の良し悪しがだいたい予測できるし」

{	Stand("st優愛_制服_通常","smile", 200, @+100);
	DeleteStand("st優愛_制服_通常左手下_normal", 300, false);
	FadeStand("st優愛_制服_通常_smile", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700700yu">
「分かりました。今度からそうしてみますね」

そう答えて、優愛はまた僕に向かって愛らしい笑みを浮かべた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700710ta">
「…………」

女の子に、笑いかけてもらうなんて……こんなエロゲ的な会話シーンがリアルに存在したとは！　しかも僕自身が実際にそれを体験できるとは！

三次元の女は、妹も含めて、バカにしたような笑みを向けてくるのが普通だったのに。
なにか裏がある。そうに違いない。

星来たんの言葉を忘れるな。
"誰も信じちゃ駄目。誰の言葉にも耳を傾けちゃ駄目"

{	Stand("st優愛_制服_通常左手下","shy", 200, @+100);
	DeleteStand("st優愛_制服_通常_smile", 300, false);
	FadeStand("st優愛_制服_通常左手下_shy", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700720yu">
「あの……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700730ta">
「え？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700740yu">
「こ、こんなこと聞いていいかどうか、分からないんですけど……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700750ta">
「な、なに……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH11", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
優愛は急にモジモジし始めた。うつむきがちで、視線を合わせようとしない。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700760yu">
「聞かせてもらっても、いいでしょうか？　あなたの、お名前」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700770ta">
「名前……」

そう言えば、優愛は自己紹介してくれたけど、僕はしてないっけ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700780ta">
「に、西條……拓巳……」

なんだか気恥ずかしくて、ついぼそぼそとつぶやくように言ってしまった。

{	Stand("st優愛_制服_通常","normal", 200, @+100);
	DeleteStand("st優愛_制服_通常左手下_shy", 300, false);
	FadeStand("st優愛_制服_通常_normal", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700790yu">
「西條拓巳、くんですね。何年生？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700800ta">
「あ、に、２年……」

{	Stand("st優愛_制服_通常","smile", 200, @+100);
	FadeStand("st優愛_制服_通常_smile", 300, true);
	DeleteStand("st優愛_制服_通常_normal", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700810yu">
「わたしは３年。わたしの方が年上さんですね♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","worry", 200, @+100);

	SetVolume360("CH11", 1000, 600, NULL);
	SetVolume("SE01", 1000, 0, NULL);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01700820ta">
「…………」

やばい、今の萌え仕草にはクラッと来そうになった。

{#TIPS_属性 = true;$TIPS_on_属性 = true;}
優愛って"おっとりお姉さん"<FONT incolor="#88abda" outcolor="BLACK">属性</FONT>か？
僕を誘惑するなんて、この女危険だ。絶対なにか企んでる！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("４");
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常_smile", 300, false);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);

//▼TIPS：解除：属性
	$TIPS_on_属性 = false;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01700830yu">
「それであの、西條くんに、お願いがあるんです……」

お、お願い……？
まさか……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH11", 1000, 1000, NULL);

	EndTrigger();

}


