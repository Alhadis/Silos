//<continuation number="500">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_023_１０月６日月";
		$GameContiune = 1;
		Reset();
	}

	ch01_023_１０月６日月();
}


function ch01_023_１０月６日月()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 1000, null, true);

//☆Cut-93-----------------------------
//※拓巳視点に戻る
//ＢＧ//校門前//朝
	CreateBG(100, 500, 0, 0, "cg/bg/bg016_01_0_学校校門_a.jpg");

	CreateSE("SE01","SE_日常_校門前_朝");
	MusicStart("SE01", 1000, 700, 0, 1000, null, true);

	Delete("色１");

//１０月６日（月）//日付は表示しない

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
翌週の"登校日"。
相変わらず憂鬱な気分で、足許だけを見つめながら学校へ向かった。

季節はそろそろ本格的な秋を迎えつつある。

松濤公園の木々は少しずつ色づいてきたし、もう半袖だと肌寒く感じるようになった。

普段、ずっと部屋の中にいる身としては、この季節の変化には戸惑うしかない。

まだ夏の気分でいたっていうのに。

週末は延々とエンスっていた。
グリムからは何度か優愛のことについて聞かれたけど、徹底的に無視した。

優愛からはあれ以来、メールはない。
僕が返事を出さなかったことで、ようやくあきらめてくれたのかもしれない。

だとしたら助かった。

優愛と話していると、気持ちが揺らいじゃうんだ。
希望を見出してしまいそうになるんだ。

でも、僕みたいなキモオタが希望を抱いたって無駄さ。
ここまで生きてきて一度も報われなかったせいで、三次元に興味を失ったんだから。

僕に、期待させないでくれ。
僕に、期待しないでくれ。

と、誰かが僕の肩を背後からトントンと叩いた。
七海か三住くんかと思って振り返ってみて、驚いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","worry", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);

	SetVolume("SE01", 2000, 0, NULL);

	BGMPlay360("CH11", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300010yu">
「西條くん……ふう、はあ……」

優愛が、少し頬を上気させて、僕に笑顔を向けていた。
なぜか息を切らしている。

//少し息切れ気味
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300020yu">
「後ろ姿が、見えたから……。もしかしたら西條くんかなって、思って……走って追いかけちゃいました……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200030ta">
「…………」

まさか、あきらめてないの……？
まだ、僕に期待してるの？

{	Stand("bu優愛_制服_通常左手下","normal", 200, @+150);
	DeleteStand("bu優愛_制服_通常左手下_worry", 300, false);
	FadeStand("bu優愛_制服_通常左手下_normal", 300, true);}
//嬉しそう
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300040yu">
「おはようございます、西條くん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200050ta">
「あ、う、うん……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300060yu">
「はあ、やっと言えました。土日を含めて４日もかかってしまいましたけど」

{	Stand("bu優愛_制服_通常","worry", 200, @+150);
	DeleteStand("bu優愛_制服_通常左手下_normal", 500, false);
	FadeStand("bu優愛_制服_通常_worry", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300070yu">
「あ、先週、メールを送ったんですけど、
　よ、読んで……もらってます？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200080ta">
「…………」

つい、反射的にうなずいてしまった。

{	Stand("bu優愛_制服_通常左手下", "smile", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_smile", 500, false);
	DeleteStand("bu優愛_制服_通常_worry", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300090yu">
「よかった。返事がなかったから、てっきり届いていないかと思って、何度か送り直そうとしたんですけど。我慢しておいて正解でした」

優愛は、いったい僕になにを期待してるんだろう？

僕も君を好きになればいいの？
僕が君のカレシになればいいの？
それで仲良くラブラブな恋人生活を送ればいいの？

……無理だ。
僕にはそんな健全なマネはできない。
したいけど、できるわけがない。

そもそも優愛が僕に好意を寄せる理由が分からない。
優愛を信じることができない。

だから、無理だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","shock", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_shock", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_smile", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300100yu">
「あの、西條くん、どうしたんですか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200110ta">
「え……？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300120yu">
「えっと、ずっと立ち止まってるので……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200130ta">
「…………」

{	DeleteStand("bu優愛_制服_通常左手下_shock", 500, true);}
優愛を置いて、僕はさっさと足早に歩き出した。
でも優愛は小走りでついてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","normal", 200, @+150);
	FadeStand("st優愛_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300140yu">
「昨日、西條くんのクラスに行ったんですけど、いませんでしたよね？
もしかして風邪でもひいて休んでるんじゃないかと思って、心配だったんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300150yu">
「でも、元気そうでよかった」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200160ta">
「た、たまにしか……」

{	Stand("st優愛_制服_通常","shock", 200, @+150);
	FadeStand("st優愛_制服_通常_shock", 300, true);
	DeleteStand("st優愛_制服_通常_normal", 0, false);}

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300170yu">
「はい？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200180ta">
「僕、たまに、しか……学校、来ない……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200190ta">
「み、みんなから、引きこもり、って……思われてる……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300200yu">
「…………」

幻滅したでしょ？　現実を知って僕への好意なんてあっさり吹き飛んだでしょ？

別にいいよ。期待してなかったから。

勝手にキモいと思えばいい。それでもう僕には付きまとわないでくれ。

{	Stand("st優愛_制服_通常","smile", 200, @+150);
	FadeStand("st優愛_制服_通常_smile", 300, true);
	DeleteStand("st優愛_制服_通常_shock", 0, false);}
//笑顔
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300210yu">
「そうですか。でも今日は会えてよかったです」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200220ta">
「……っ」

あっけにとられた。

思わずまじまじと優愛の笑顔を見つめた。目が合っちゃって、慌てて顔を伏せる羽目になった。

なんで、気持ち悪がらないんだろう……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","normal", 200, @+150);
	FadeStand("st優愛_制服_通常_normal", 300, true);
	DeleteStand("st優愛_制服_通常_smile", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300230yu">
「っていうか、たまにでも学校に来てるなら、西條くんは引きこもりじゃないと、思います……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300240yu">
「す、すいません、分かったようなこと言っちゃって……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200250ta">
「で、でも……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200260ta">
「……く、苦痛……だよ……」

{	Stand("st優愛_制服_通常","smile", 200, @+150);
	FadeStand("st優愛_制服_通常_smile", 300, true);
	DeleteStand("st優愛_制服_通常_normal", 0, false);}

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300270yu">
「だとしたら、偉いです」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200280ta">
「え……？」

まさかそんな言葉が返ってくるなんて、思いもよらなかった。僕みたいなダメ人間の、どこが偉いんだろう？

優愛は優しく微笑んでいる。
人を癒すことのできる笑顔だ。
素直に、そう思う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300290yu">
「だって、西條くんは、辛いのに頑張って学校に来ていますから」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300300yu">
「苦痛なら、普通は来られないですよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200310ta">
「で、でも……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200320ta">
「僕は、オタだし、キモいし……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300330yu">
「わたし、西條くんの話を聞くの、好きですよ」

なんだ……？
なんなんだ、この全肯定は……。
どうして、こんなに心地がいいんだ……。

優愛なら、すべてを包み込んでくれるような気がする。

{	SetVolume360("CH11", 2000, 0, NULL);
	CreateSE("SE02","SE_日常_校門前_朝");
	MusicStart("SE02", 2000, 500, 0, 1000, null, true);}
優愛なら、僕がここにいていいんだって言ってくれる気がする。
優愛と一緒なら、僕は普通の人間に戻れるかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//チャイムの音
	CreateSE("SE01","SE_日常_チャイム");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Stand("st優愛_制服_通常","shock", 200, @+150);
	FadeStand("st優愛_制服_通常_shock", 300, true);
	DeleteStand("st優愛_制服_通常_smile", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300340yu">
「あ、た、大変！　予鈴ですよっ」

気が付けば、周囲に生徒はほとんどいなかった。
もうみんな校舎の中だ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300350yu">
「西條くん、それじゃわたし、失礼しますっ」

{	Stand("st優愛_制服_通常","normal", 200, @+150);
	FadeStand("st優愛_制服_通常_normal", 300, true);
	DeleteStand("st優愛_制服_通常_shock", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300360yu">
「あ、今日の放課後、時間ありますか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200370ta">
「え……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","shy", 200, @+150);
	DeleteStand("st優愛_制服_通常_normal", 300, false);
	FadeStand("st優愛_制服_通常左手下_shy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300380yu">
「も、もし、よかったら、えと、その……い、一緒に帰りましょう……」

少し頬を染めて、優愛は恥ずかしそうにそうつぶやく。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300390yu">
「ほ、放課後、中庭で待ってます……っ。もし気が向いたら、来て……くださいっ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300400yu">
「あ、無理に来なくても、全然平気ですから……っ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02300410yu">
「失礼しますっ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 2000, 0, NULL);

	DeleteStand("st優愛_制服_通常左手下_shy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
優愛は律儀に頭を下げると、３年生の教室がある棟へと走り去っていった。

それを見送りながら、僕はまたもや頬をつねっていた。

やっぱり夢でも妄想でもない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);

//～～Ｆ・Ｏ
	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);
	Fade("back04", 500, 1000, null, true);

//ＢＧ//教室//昼
	CreateBG(100, 1000, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");

	CreateSE("SE02","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE02", 0, 800, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
その日はずっとぼんやりした気分のまま授業を受けた。

というより、授業なんてまったく聞いてなかった。
頬杖をついて、窓の外の秋空を眺め続けた。

クラスメイトも教師も、僕のことなんて気にも留めていなかった。

でも、優愛は僕を見てくれている。
優愛は、他のクソなヤツらとは違う。

そんなことを思いつつあれこれ妄想していたら、あっという間に放課後になっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","pride", 200, @+150);
	FadeStand("bu大輔_制服_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/02300420mi">
「よおタク、今日もデートか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/02300430mi">
「この前の眼鏡の子とはうまく行ってるんだろーなぁ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200440ta">
「…………」

{	Stand("bu大輔_制服_通常","smile", 200, @+150);
	FadeStand("bu大輔_制服_通常_smile", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/02300450mi">
「おいおい、ニートだからって躊躇してんなよ？　向こうがお前のこと気に入ってくれてんなら、付き合うか付き合わないかはともかく、やっちまうのが礼儀――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200460ta">
「そ、そんなことしないよっ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","sigh", 200, @+150);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);
	DeleteStand("bu大輔_制服_通常_smile", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/02300470mi">
「お、おい、なんだよいきなり大声出して……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200480ta">
「優愛とは、そんなことしない」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/02300490mi">
「はあ？　お前、まだ言ってんの？　なんで最初からあきらめるんだよ。そろそろ引きこもりから卒業しようぜ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02200500ta">
「ぼ、僕は、引き、引きこもりじゃ、ない……」

そもそもそういうことを言ってるんじゃない。

下半身で生きている三住くんには分からないさ。

僕は戸惑ったような顔をしている三住くんを無視して、急いで教室を出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	ClearAll(1000);

}
