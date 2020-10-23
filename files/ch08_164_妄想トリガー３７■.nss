//<continuation number="1010">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_164_妄想トリガー３７■";
		$GameContiune = 1;
		Reset();
	}

		ch08_164_妄想トリガー３７■();
}


function ch08_164_妄想トリガー３７■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Delete("背景３");

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐７へ
//ネガティブ妄想→分岐８へ
//妄想しない→分岐９へ

if($妄想トリガー通過３７ == 0)
{
	SetChoice03("ポジティブ妄想","ネガティブ妄想","妄想しない");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA03();
			$妄想トリガー３７ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー３７ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー３７ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー３７ == 2)
{
//☆☆☆
//分岐７

	BoxDelete(200);

	Stand("bu大輔_制服_通常","sigh", 250, @100);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
すれ違いざまに僕の肩に手を置き、

//◆小声//◆最後はため息
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400010mi">
「俺、外に出てるわ……はあ」

//◆小声
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400020mi">
「タク、押し倒しちまえよ。俺の読みじゃ、岸本はお前に脈アリだぜ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400030ta">
「え……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","pride", 250, @100);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 0, false);
	Wait(500);
	DeleteStand("bu大輔_制服_通常_pride", 500, false);
	Wait(500);
	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	SoundPlay("SE02", 0, 1000, false);
	Wait(2000);
	CreateSE("SE03","SE_日常_びょういんどあ_閉まる");
	SoundPlay("SE03", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
そしていたずらげに笑うと、ホントに出て行ってしまった。
後には、当然ながら僕とあやせが残される。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	SoundPlay("SE01", 2000, 500, true);

	DelusionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
沈黙。

さっきまで一方的にデンパな話をまくし立てていたのに、今はあやせはうつむき、パジャマの裾を折っては伸ばし、折っては伸ばしと繰り返している。

な、なにか、話さないとダメなんだろうか。

でもさっきのあやせの話はさっぱり理解できなかったし。

いやいや、お見舞いに来たんだから病状を気遣うようなことを言っておけばそれでいいんじゃないかな。

でも精神科に入院してることを考えると、
気軽に病状を聞けなさそうだ……。

うう、どうしたらいいんだ。
こんなことなら三住くんと一緒に出て行けばよかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE01", 2000, 0, 0, 1000, null, false);
	Stand("buあやせ_パジャマ_通常","shy", 250, @-100);
	FadeStand("buあやせ_パジャマ_通常_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400040ay">
「拓巳」

名前を呼ばれ、ビクッとしてしまう。
あやせは顔を上げると、僕の方に両手を差し延べてきた。

{	BGMPlay360("CH11", 3000, 1000, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400050ay">
「来て」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400060ta">
「……へ？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400070ay">
「……こっちに、来て」

断ったらなにをされるか分からないので、戸惑いつつもベッドの方へ一歩、近寄る。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400080ay">
「もっと」

促され、さらに一歩。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_じん体_動作_抱く1");
	MusicStart("SE05", 0, 800, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
あやせの手が僕の手に触れた。
つかまれて、さらに引き寄せられる。

あやせはまた顔を伏せて。
僕の手をじっと見つめている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400090ta">
「あ……の……」

{	Stand("buあやせ_パジャマ_通常","smile", 250, @-100);
	FadeStand("buあやせ_パジャマ_通常_smile", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_shy", 0, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400100ay">
「キミは、私を救ってくれた」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400110ay">
「命の恩人よ」

そんなことない。
あやせの命が助かったのは、たまたまだ。

そもそもホントにあの花壇は僕が“生み出した”ものなのか、それすらもよく分からないのに……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_パジャマ_泣く","cry", 250, @-100);
	DeleteStand("buあやせ_パジャマ_通常_smile", 300, false);
	FadeStand("buあやせ_パジャマ_泣く_cry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//◆涙声
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400120ay">
「ありがとう……」

{	DeleteStand("buあやせ_パジャマ_泣く_cry", 500, true);}
あやせの声が濡れている。
もしかして、泣いているのかな。

//◆拓巳の指を口にくわえる
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400130ay">
「は……む」

は……む？

指先に、温かい感触。
何事かと思って見下ろしたら、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※※３６０以下
//ＣＧ//新規ＣＧ挿入
//※※３６０以上
//おがみ：360：EV挿入予定
	CreateTexture360("指なめ１", 200, 0, 0, "cg/ev/ev131_01_2_あやせ指なめ_a.jpg");
	Fade("指なめ１", 0, 0, null, true);
	Fade("指なめ１", 1000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
なぜかあやせが僕の人差し指を口にくわえていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400140ta">
「え、ちょ……」

{	CreateTexture360("指なめ２", 200, 0, 0, "cg/ev/ev131_02_2_あやせ指なめ_a.jpg");
	Fade("指なめ２", 0, 0, null, true);
	Fade("指なめ２", 500, 1000, null, true);
	Delete("指なめ１");}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400150ay">
「ん……ふ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400160ay">
「んんっ……」

指先に、柔らかく熱いものが触れる。

それは僕の指を包み込むように蠢き、
そして爪と肉の間をほじくってくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400170ta">
「あ……あ……っ」

なんで、こんなことになってるんだ！？

困惑しつつも、その気持ちよさに抗えず、あやせの為すがままになってしまう。

ただ指を舐められているだけなのに、どうしてこんなにも――

//◆恍惚
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400180ta">
「ら、めぇ……っ」

//◆指を噛む
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400190ay">
「んっ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH11", 200, 0, false);
	CreateColor("色１", 1000, 0, 0, 1280, 720, "RED");
	Fade("色１", 0, 500, null, true);
	Fade("色１", 500, 0, null, true);

	CreateTexture360("指なめ３", 250, 0, 0, "cg/ev/ev131_03_2_あやせ指なめ_a.jpg");
	Fade("指なめ３", 0, 0, null, true);
	Fade("指なめ３", 500, 1000, null, true);
	Delete("指なめ２");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
と、いきなり快感が激痛に変わった。
あやせが僕の指をきつく噛む。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400200ta">
「い、て、ててて！　やめ、ちょっ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：360：EVここまで
	FadeDelete("指なめ３", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
骨ごと噛み千切られるかと思った。
それくらいの痛みだった。

僕が必死で手を振り払うと、ようやく指はあやせの口から抜ける。

//◆息が荒い→笑う
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400210ay">
「ふぅ、はぁ、はぁ……ふふふ」

その妖艶な笑みに恐怖を覚え、噛まれた指の傷を確かめた。

あやせのだ液でぬらぬらと光る、僕の指。
歯形がついていて、血が、にじんでいた。
その血は、赤くなくて。

ひどく、どす黒い――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_パジャマ_通常","smile", 250, @0);
	FadeStand("buあやせ_パジャマ_通常_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400220ay">
「その血の色が、黒騎士の証よ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionOut();

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");

	DeleteStand("buあやせ_パジャマ_通常_smile", 0, true);
	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	SoundPlay("SE01", 2000, 500, true);

	DelusionOut2();
	PositiveHuman();

//ＢＧ//ＡＨ総合病院・病室//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
――そんな妄想をすることで、あやせの理解不能な話をなんとかやり過ごした。

僕はまったく聞いてなかったけど、あやせはそれに気付かずに、相変わらずグラジオールがどうとか邪心がどうとかを、真面目な顔で延々と語り続けている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流４へ
}


//=============================================================================//

if($妄想トリガー３７ == 1)
{
//☆☆☆
//分岐８
//フラグ【８章エンドフラグ②】ＯＮ
	$８章エンドフラグ② = true;

	BoxDelete(200);

	Wait(200);

	Stand("bu大輔_制服_通常","worry", 250, @220);
	FadeStand("bu大輔_制服_通常_worry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
すれ違いざまに僕の肩に手を置き、

//◆小声//◆最後はため息
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400230mi">
「俺、もう付いていけねえや。後は任せた……はあ」

うんざりしたような顔でため息をつくと、
そのまま病室を出て行こうとした――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	Stand("bu大輔_制服_通常","worry", 250, @220);
	FadeStand("bu大輔_制服_通常_worry", 0, true);

	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

	DelusionIn2();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400240ay">
「待って」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_パジャマ_通常","angry", 200, @-220);
	FadeStand("stあやせ_パジャマ_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
そこで、ようやくあやせが三住くんに声をかけた。
でもなぜか、彼女の表情は険しい。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400250ay">
「逃がさないわよ」

{	Stand("bu大輔_制服_通常","pride", 250, @220);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400260mi">
「はあ？　なになに、俺の相手してくれんの？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400270ay">
「ええ。そうね」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400280ay">
「あなたが邪心王の使いだということは、分かっている」

{	Stand("bu大輔_制服_通常","worry", 250, @220);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, false);}
な、なんだそれ……。
また新しい“設定”か？

勝手にそんな“設定”を付けられた三住くんは、すごく迷惑そうだ。それがまともな反応だろう。

冗談としても面白くない。

ところが、あやせは本気だった。

{	DeleteStand("bu大輔_制服_通常_worry", 500, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400290ay">
「拓巳」

{	CreateSE("SE02","SE_日常_寝がえりをうつ");
	SoundPlay("SE02", 0, 1000, false);}
あやせは僕の名を呼びながら、シーツの下に隠し持っていたらしい果物ナイフを投げてよこす。

{	CreateSE("SE02","SE_じん体_掴む");
	SoundPlay("SE02", 0, 1000, false);}
驚き、慌てふためきつつ、それを受け取ってしまった。ナイフの刃にはカバーがついていたからよかったものの、危うく手を切るところだった。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400300ay">
「そいつを、殺すのよ」

{	DeleteStand("stあやせ_パジャマ_通常_angry", 500, true);}
――そいつ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","worry", 250, @220);
	FadeStand("bu大輔_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
あやせがそう言ったときに見ていたのは、三住くんだった。

なんだ、この超展開は……。
僕は戸惑い、ナイフを手にオロオロしてしまう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	MusicStart("SE01", 2000, 0, 0, 1000, null, false);
	BGMPlay360("CH01", 2000, 1000, true);
	Stand("bu大輔_制服_通常","sigh", 250, @220);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆苦笑
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400310mi">
「おいおい……」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400320mi">
「殺せ、と来たか。いくらなんでもそれはひどくね？」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400330mi">
「まあ、岸本に嫌われてるのは分かってたけどよ。まさか面と向かってそんなこと言われるとは思わなかったぜ」

{	Stand("bu大輔_制服_通常","worry", 250, @220);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400340mi">
「それで、えーっと、なんだっけ？　ぐらびとーん？　じゃしん？」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400350mi">
「なんのことだか、俺にはさっぱり分かんねえんだけどな」

{	Stand("bu大輔_制服_通常","sigh", 250, @220);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400360mi">
「タク、とりあえずナイフ置けよ。岸本の妄想に付き合うな」

{	DeleteStand("bu大輔_制服_通常_sigh", 500, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400370ay">
「妄想じゃないわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_パジャマ_通常","angry", 200, @-220);
	FadeStand("stあやせ_パジャマ_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400380ay">
「拓巳、そいつの言葉を信じないで」

三住くんが表情を引きつらせて、あやせから一歩、後ずさる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stあやせ_パジャマ_通常_angry", 500, false);
	Stand("bu大輔_制服_通常","worry", 250, @220);
	FadeStand("bu大輔_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400390mi">
「お前、異常だぜ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_worry", 300, false);
	Stand("stあやせ_パジャマ_通常","hard", 200, @-220);
	FadeStand("stあやせ_パジャマ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603008]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400400ay">
「拓巳、早く殺すのよ。でないとグラジオールにキミの存在が筒抜けになってしまうわ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400410ta">
「…………」

僕は、手にしたナイフを、
あやせの膝の上に、そっと返した。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400420ay">
「拓巳……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400430ta">
「き、君の、言ってることは……めちゃくちゃだよ……」

{	Stand("stあやせ_パジャマ_泣く","utsu", 200, @-220);
	DeleteStand("stあやせ_パジャマ_通常_hard", 300, false);
	FadeStand("stあやせ_パジャマ_泣く_utsu", 500, true);}
//◆ブレス
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400440ay">
「…………」

{	DeleteStand("stあやせ_パジャマ_泣く_utsu", 500, false);}
悲しそうな目で、僕を見上げてくる。
そんな目をされたって、三住くんを殺せるわけがないじゃないか。

グラジオールがどうとかは関係ない。

人を殺せば僕は犯罪者になる。そんなのゴメンだ。
ただ、それだけ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","smile", 250, @220);
	FadeStand("bu大輔_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604008]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400450mi">
「さすが親友。お前なら俺を選ぶって信じてたぜ、タク」

三住くんが、僕の肩をポンポンと叩く。

{	SetVolume360("CH01", 1000, 0, null);
	DeleteStand("bu大輔_制服_通常_smile", 500, false);}
そして何気なく、
本当に何気なく、

あやせの膝の上のナイフをつかんだ。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400460mi">
「じゃあな、デンパ女」

そのまま、流れるような動きでナイフの刃のカバーを取り、閃かせる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ナイフで首をかっ切る
//ＳＥ//血が噴き出す
//※※３６０以下
//ＣＧ//新規ＣＧ挿入このへん？
//※※３６０以上
//おがみ：360：EV挿入予定

	CreateSE("SE02","SE_じん体_動作_手_棒を振り回す");
	CreateColor("色１", 150, 0, 0, 1280, 720, "White");
	DrawTransition("色１", 200, 0, 1000, 100, null, "cg/data/lcenter.png", false);
	SoundPlay("SE02", 0, 1000, false);

	Wait(200);
	Fade("色１", 1000, 0, null, false);

	Wait(500);

	CreateSE("SE04","SE_じん体_血_噴きでる_包丁でさされ");
	SoundPlay("SE04", 0, 1000, false);
	CreateColor("色２", 1000, 0, 0, 1280, 720, "RED");
	DrawTransition("色２", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);

	Wait(1200);
	Fade("色２", 3000, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
あやせの首から、勢いよく血が噴き出して。
僕の顔にかかったそれは、とても熱くて。

愕然と見開いたあやせの目が、僕を見ていた。

その身体が、ゆっくりとベッドの上に倒れ込んでいく。
真っ白だったベッドのシーツが、紅く染まっていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH10", 2000, 800, true);

	CreateColor("下地黒", 190, 0, 0, 1280, 720, "BLACK");
	Fade("下地黒", 0, 0, null, true);
	Fade("下地黒", 300, 1000, null, true);


	CreateTextureEX("殺害", 200, 0, 0, "cg/ev/ev132_01_2_あやせ殺害_a.jpg");
	CreateTextureEX("三住ナイフ", 250, 0, 160, "cg/ev/ev132_01_2_あやせ殺害_b.png");

	Fade("三住ナイフ", 500, 1000, null, false);
	Move("三住ナイフ", 1000, @0, @-160, Dxl1, true);

	Wait(500);

	Fade("殺害", 1000, 1000, null, true);
	Delete("下地黒");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3611009]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400470mi">
「やっちまったな、タク。今のが最後のチャンスだったんだぜ。グラジオール復活を阻止するための、な」

僕は悲鳴すら上げることができなくて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：360：EV一旦消す
	Fade("三住ナイフ", 1000, 0, null, false);
	Fade("殺害", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400480mi">
「正しかったのは、岸本の方だったってわけだ」

言いながら、三住くんは横たわっているあやせの上に馬乗りになる。

{	CreateSE("SE03","SE_擬音_杭_突きささる");
	SoundPlay("SE03", 0, 1000, false);}
そしてあやせの眼球を、躊躇する素振りも見せずにナイフでえぐり出した。

そうされても、彼女の身体はもうピクリとも動かない。

僕の方を振り向いた三住くんは、残忍な笑みを浮かべ、こうつぶやいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：360：EV表示
	Fade("三住ナイフ", 100, 1000, null, false);
	Fade("殺害", 100, 1000, null, true);

	BGMPlay360("CH*", 100, 0, false);
	Wait(600);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602009]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400490mi">
「その目だれの目？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

//おがみ：実績：その目
	Eyes();

	DelusionOut();

	Delete("三住ナイフ");
	Delete("殺害");
	Delete("色*", 0, true);
	Delete("背景*", 0, true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	SoundPlay("SE01", 2000, 500, true);

	DelusionOut2();
	NegativeHuman();

//ＢＧ//ＡＨ総合病院・病室//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
我に返ると、血まみれになったはずのあやせが、
無傷でベッドの上に座っていた。
三住くんの姿はどこにもない。

妄想、だった……？

僕は深々と息を吐いた。
イヤな妄想をしちゃった……。

罪悪感を覚えて、心の中であやせに謝る。

そんな僕の想いに気付くはずもなく、あやせは相変わらずデンパな話を続けていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流４へ
}


//=============================================================================//

if($妄想トリガー３７ == 0)
{
//☆☆☆
//分岐９

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
すれ違いざまに僕の肩に手を置き、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","sigh", 250, @100);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//◆小声//◆最後はため息
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16400500mi">
「俺、もう付いていけねえや。後は任せた……はあ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_sigh", 500, true);
	CreateSE("SE02","SE_日常_扉_開ける");
	SoundPlay("SE02", 0, 1000, false);
	Wait(2000);
	CreateSE("SE03","SE_日常_扉_閉まる");
	SoundPlay("SE03", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602011]
うんざりしたような顔でため息をつくと、そのまま病室を出て行った。

ぼ、僕ひとりだけ残されても、困るんだけど……。

一方のあやせは、三住くんが出て行ったことにもまったく興味を示そうとしない。

まるで、彼など最初からこの部屋にはいなかったとでも言わんばかりの態度だ。

彼女は、いつだってそうだ。
いつも、超然としている。
普通の人とは違うものを見ているような気がする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2000, 0, null);

	Stand("buあやせ_パジャマ_通常","normal", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_normal", 500, true);

	BGMPlay360("CH12",0,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603011]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400510ay">
「キミが、生み出したんでしょう？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400520ay">
「あのときの、花壇」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400530ta">
「…………」

{	Stand("buあやせ_パジャマ_通常","hard", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_hard", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400540ay">
「それで悟ったの」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400550ay">
「キミはすでに目覚めている、と」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400560ta">
「ぼ、僕は、ギガロマニアックスじゃ……ないよ……」

{	Stand("buあやせ_パジャマ_通常","shock", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_shock", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_hard", 0, true);}
//◆首を傾げる
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400570ay">
「ギガロ……なに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400580ta">
「ギガロマニアックス、でしょ……。あ、蒼井、セナから……聞いた……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400590ay">
「蒼井……セナ」

{	Stand("buあやせ_パジャマ_通常","normal", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_normal", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_shock", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400600ay">
「そう、彼女ね……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400610ay">
「一度だけ会ったことがあるわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400620ay">
「グラジオールの黒騎士よ、彼女も」

グラジオールの黒騎士。
そしてギガロマニアックス。

どっちも同じ意味なの？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400630ta">
「と、とにかく、僕は……違うんだ……。ディソードだって……け、結局、手に、入れられなかった……」

{	Stand("buあやせ_パジャマ_通常","hard", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_hard", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400640ay">
「神罰を乗り越えて。そうすれば、剣は召喚される」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400650ta">
「神罰……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400660ay">
「苦しみ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400670ay">
「心的負荷の爆発」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400680ay">
「心の扉の向こう側」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400690ay">
「……あるいは、精神的拷問」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400700ay">
「言い方はいろいろ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400710ta">
「僕……これまでにも、たくさん……苦しんできたよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);
	DeleteStand("buあやせ_パジャマ_通常_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
そして、今も苦しみは続いている。

日本中の笑いものだし。

警察には、殺人犯と間違われてるし。
『将軍』や優愛から脅迫まがいのことをされてるし。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("色１");
	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("背景２", 1000, 0, 0, "cg/ev/ev069_01_1_七海廊下後姿髪かきあげ_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602012]
それに、七海のことだって……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("背景３");
	Delete("背景２");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(1000);
	Stand("buあやせ_パジャマ_通常","hard", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603012]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400720ay">
「私は精神病院にいたわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400730ay">
「子供の頃の話」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400740ta">
「あ、うん……」

知ってる。インターネットで見た。
でもどうしていきなりその話を……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400750ay">
「そこには５年弱、いた」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400760ay">
「私の心はとても弱くて」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400770ay">
「だから攻撃した」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400780ay">
「周囲にあるものすべてを」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400790ay">
「同時に、自分のことも」

ポツポツと、つぶやくようにあやせは語る。

パステルカラーのパジャマを着て、シーツのシワに沿ってベッドの上へそっと指を走らせている今のあやせには、

あのライブのときの力強さが、どこにも見られない。

あのときのあやせは、ＦＥＳは、果たして現実だったのかな……。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400800ay">
「私はよく、窓ガラスを割っていたの」

{	Stand("buあやせ_パジャマ_通常","smile", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_smile", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400810ay">
「問題児ね」

{	DeleteStand("buあやせ_パジャマ_通常_smile", 500, true);}
あやせは唇に、かすかな笑みを浮かべる。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400820ay">
「割れたガラスの破片。そこに、いつもぼんやりと見えていた」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400830ta">
「な、なにが……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_パジャマ_通常","hard", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400840ay">
「剣が」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400850ay">
「でも、何年も、それがなんなのか分からなかった」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400860ay">
「ようやくそれがディソードだと知ったのは――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400870ay">
「施設に入って４年ほど経った頃」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400880ay">
「それまで私は、好き放題やっていたけど」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400890ay">
「ある日、施設の職員が一斉に入れ替わって」

{	Stand("buあやせ_パジャマ_通常","angry", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_angry", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400900ay">
「私は、何ヶ月も、いろいろな拷問をされて……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400910ay">
「心が壊れてしまう間際に」

{	Stand("buあやせ_パジャマ_通常","normal", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_normal", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_angry", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400920ay">
「大いなる意志の声が聞こえて」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400930ay">
「やっと、召喚できたのよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16400940ta">
「拷問……って……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400950ay">
「それが神罰だった」

{	Stand("buあやせ_パジャマ_通常","hard", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_hard", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400960ay">
「邪心を打ち破る力を手に入れるには、純粋なる邪心が必要……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


	SetVolume360("CH12", 2000, 0, null);

	DeleteStand("buあやせ_パジャマ_通常_hard", 500, true);

	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	MusicStart("SE01", 2000, 200, 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
それはつまり――

僕に、もっと苦しめ、って言いたいの？
でないと剣は手に入らない、って？

だとしたら、そんなのごめんだ。

僕は苦しみたくなんてない。
もうすでに何度もくじけてきた。
僕のことは、放っておいてほしい。

頭を抱えて、無茶苦茶に叫びたい衝動に駆られる。

けれどあやせの声は、それを許してくれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流４へ
}


//=============================================================================//

//☆☆☆
//合流４

	Stand("buあやせ_パジャマ_通常","hard", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400970ay">
「すべてはお告げよ」

//◆集って＝つどって
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400980ay">
「すでに渋谷に集っているはずなの。７人の黒騎士は」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16400990ay">
「後は、全員が覚醒するだけ」

{	Stand("buあやせ_パジャマ_通常","angry", 250, @-50);
	FadeStand("buあやせ_パジャマ_通常_angry", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16401000ay">
「急がないと、世界は滅びるわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16401010ay">
「グラジオールの手によって」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*",2000,0,false);
	ClearAll(2000);
	Wait(2000);

}