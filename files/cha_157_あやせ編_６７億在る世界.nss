

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_157_あやせ編_６７億在る世界";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_157_あやせ編_６７億在る世界();
}


function cha_157_あやせ編_６７億在る世界()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編

	CreateColor("Black", 2000, 0, 0, 1280, 720, "Black");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕は慌てて目を逸らした。
病室を出て行こうかと思った。
ところが――

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700670ay">
「そこにいて」

そう言われて、身動きが取れなくなってしまう。

//ＳＥ//衣擦れ
{	CreateSE("SE01","SE_じん体_動作_服を脱ぐ");
	MusicStart("SE01", 0, 600, 0, 1000, null, false);}
静かな病室に、あやせが服を脱ぐ衣擦れの音が響く。

この病室は、それほど広くない。
僕の住んでるベースよりはマシだけど。

それでも、この狭い部屋に今、僕とあやせの２人きり。
そして僕の背後で、あやせは着替え中。

その気配が、背中越しにひしひしと伝わってくる。

{	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);}
まずい、すごく緊張してる。緊張するはずがないんだけどなあ。このシチュエーションは、“東またせま”が原画をやったエロゲ『スライム娘があらわれた！』で経験済みだろ！

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700680ay">
「なぜ目を逸らすの、拓巳」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700690ta">
「だ、だって……見ちゃ、ま、まずいし……」

声が上ずりそうになってしまった。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700700ay">
「恥ずかしいのね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700710ta">
「あ、あやせは、はず、恥ずかしく、ないの……？」

ジロジロ見てもいいっていうことか？
僕は、三次元女には興味はないぞ。ないったら、ないんだ。
いや、そりゃ、見ていいっていうなら、見るけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_のぞく");
	MusicStart("SE01", 0, 600, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700720ay">
「惑わされているのよ、キミは」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700730ay">
「その感情こそが、邪心に侵食されている証拠」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700740ta">
「惑わされているって、だ、誰に……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700750ay">
「邪心王グラジオール」

僕は何気なく、目の前にあるサイドテーブルに置いてあった文庫本を手に取った。
『グラジオール記黙示録詩編』第１７巻と書かれてある。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700760ta">
「グラジオールって、な、なんなの……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700770ay">
「邪悪なる存在」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700780ay">
「負の妄想の塊」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700790ay">
「人の心の闇に遍在する無意識の集合体」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700800ay">
「世界に破滅をもたらす神」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700810ay">
「言い方は、いろいろ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700820ta">
「そ、そいつは、車椅子に、乗ってるの？　足が不自由とか」

{	CreateSE("SE01","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE01", 0, 500, 0, 1000, null, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700830ay">
「グラジオールは人の形をしているとは限らないわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700840ay">
「もういいわよ。こっちを見ても」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, null);
	SetVolume("SE02", 500, 0, null);
//あやせは以後、制服
	CreateTexture360("back", 100, 0, 0, "cg/bg/bg102_02_2_あやせの病室_a.jpg");
	Stand("stあやせ_制服_通常","normal", 250, @-50);
	FadeStand("stあやせ_制服_通常_normal", 300, true);

	CreateSE("SE3601","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE3601",2000,1000,0,1000,null,true);


	FadeDelete("Black", 2000, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
そーっとあやせの方へ向き直る。
すでに彼女は着替え終わっていた。
なぜか学校の制服姿だ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700850ta">
「なんで、制服に……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700860ay">
「迫っているから。グラジオール覚醒のときが」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700870ay">
「いつでも動けるようにしておかないと」

//おがみ：シナリオ修正
//だったら制服でもいいような気がするけど……。
だったら私服でもいいような気がするけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//おがみ：シナリオ修正
//【あやせ】
//<voice name="あやせ" class="あやせ" src="voice/chn05/00700880ay">
//「普通の服は、持ってきていないのよ」

//【あやせ】
//<voice name="あやせ" class="あやせ" src="voice/chn05/00700890ay">
//「制服でここに担ぎ込まれて、それ以来一度も外に出ていないの」

//だとしても、普通は親が着替えを持ってくるはずだけど……。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
いや、今はそんなことはどうでもいい。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700900ta">
「グ、グラジオールが、ギ、ギガロマニアックスと、どう関係して、く、くるの……？」

{	Stand("stあやせ_制服_通常","shock", 250, @-50);
	FadeStand("stあやせ_制服_通常_shock", 300, true);
	DeleteStand("stあやせ_制服_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700910ay">
「ギガロ……なに……？」

あやせはわずかに眉をひそめている。
知らないんだろうか。

あるいは、ギガロマニアックスって呼んでいるのはセナだけなのかもしれない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700920ta">
「ギ、ギガロマニアックスだよ。セ、セナは、ディ、ディソードを持つ力の持ち主のことを、そう、呼んでた……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00700930ta">
「ディソードは、ディラックの海に繋がったパイプだとかなんとか」

{	Stand("stあやせ_制服_通常","normal", 250, @-50);
	FadeStand("stあやせ_制服_通常_normal", 300, true);
	DeleteStand("stあやせ_制服_通常_shock", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700940ay">
「呼び方は人それぞれかもしれないわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700950ay">
「ディソードは、人の邪心を具現化したものよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700960ay">
「グラジオール記黙示録詩編にそう書いてある。第３巻、１１章２３節」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700970ay">
「予言書なのよ、それは」

そう言って、あやせは僕の持つ本へ視線を固定させた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("stあやせ_制服_泣く","utsu", 250, @-50);
	DeleteStand("stあやせ_制服_通常_normal", 300, false);
	FadeStand("stあやせ_制服_泣く_utsu", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700980ay">
「みんなはこう言うわ。私が歌詞によって予知を行っていると」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00700990ay">
「だけど私は、グラジオール記黙示録詩編からインスピレーションを受けているだけ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701000ay">
「その詩編こそ、予言の書なのよ。なぜ気付かないの、誰も」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701010ta">
「予言の書って……じ、冗談でしょ……？」

{	Stand("stあやせ_制服_通常","normal", 250, @-50);
	DeleteStand("stあやせ_制服_泣く_utsu", 300, false);
	FadeStand("stあやせ_制服_通常_normal", 300, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701020ay">
「事実よ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701030ay">
「この渋谷で今、まさに起きていることを、そしてこれから起きようとしていることを、ツィーグラーは予言し、物語にしている」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701040ta">
「ツィーグラー？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701050ay">
「グラジオール記黙示録詩編の作者」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701060ay">
「故人だけれど、ツィーグラーは強大な黒騎士だったと思うわ、私は」

{	DeleteStand("stあやせ_制服_通常_normal", 500, true);}
あやせが言うところの黒騎士って、もしかしてギガロマニアックスのことなんだろうか。

だとしたら、この作者がギガロマニアックスとしての力を使って、予言の書を書いたとしても不思議じゃない。

{	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);
	Wait(50);
	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);
	Wait(50);
	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);}
僕は手にしていたグラジオール記黙示録詩編第１７巻を、パラパラとめくってみた。
そして、ハッとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



//ＢＧ//グラジオール記黙示録詩編の文庫本（中を開いている状態。すべて白紙。本のみで、キャラは描かない）
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 200, 1000, null, true);

	CreateTexture360("グラ記１", 500, center, middle, "cg/bg/bg224_01_6_chnグラジオール文庫本_a.jpg");

	FadeDelete("Black", 200, true);

	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
白紙――

{	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);}
どれだけページをめくっても。
どこのページを開いてみても。

文字は、一言も書いていない。

なんだ、これ……？

{	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);}
表紙を確認してみる。

普通の文庫についているようなカバーはなく、カバー下がむき出しの状態だ。シンプルにタイトルと作者名だけが書かれてある。出版社の名前は見当たらない。

{	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);}
改めて、最初のページから読み返してみた。

でも、１ページ目からすでに白紙だ。
それはどこまでも続き、文字が書かれているページは一枚もなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateTexture360("back", 100, 0, 0, "cg/bg/bg102_02_2_あやせの病室_a.jpg");

	FadeDelete("グラ記１" 200. true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701070ta">
「こ、これ、不良品……？」

{	Stand("stあやせ_制服_通常","shock", 250, @-50);
	FadeStand("stあやせ_制服_通常_shock", 300, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701080ay">
「どういうこと？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701090ta">
「だ、だって……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701100ta">
「これ、全部白紙じゃないか……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701110ay">
「なにを言っているの？」

{	Stand("stあやせ_制服_通常","hard", 250, @-50);
	FadeStand("stあやせ_制服_通常_hard", 300, true);
	DeleteStand("stあやせ_制服_通常_shock", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701120ay">
「ちゃんと書かれているわ。何度も読んでいるのよ、私は」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701130ta">
「そ、そんなこと言ったって、ほら……」

僕はページを開いた状態で、あやせの鼻先に本を突き付けてやった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701140ta">
「どこからどう見ても、ま、真っ白だよ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701150ay">
「ちっとも、白紙なんかじゃないわ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701160ta">
「いや、白紙だって……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701170ay">
「ここに字が書いてある。見えないの、拓巳？」

僕は……担がれているのか？
あやせは本気で言ってるのか？

それとも、結局のところあやせは真性のメンヘラでしかないっていうことか？

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701180ay">
「キミには見えないのね」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701190ay">
「侵食されているからだわ。邪心王に」

{	DeleteStand("stあやせ_制服_通常_hard", 500, true);}
あやせは真面目な顔だ。冗談を言っているようには見えない。そもそも彼女が冗談を言うところを僕は見たことがない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);

	CreateTextureEX("グラ記１", 500, center, middle, "cg/bg/bg224_01_6_chnグラジオール文庫本_a.jpg");
	Fade("グラ記１", 300, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
もう一度、本の中を見てみた。
でもやっぱり、白紙だ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701200ta">
「ぼ、僕には、白紙にしか見えないよ……」

//◆「そうですか、残念です」のニュアンス
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701210ay">
「……そう」

あやせは残念そうに肩を落とすと、僕の手から文庫本をそっと抜き取った。その指先が一瞬だけ触れて、僕はドキッとする。
あやせの手はひんやりと冷たかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back", 100, 0, 0, "cg/bg/bg102_02_2_あやせの病室_a.jpg");

	FadeDelete("グラ記１" 200. true);

	Wait(300);

	Stand("stあやせ_制服_通常","normal", 250, @-50);
	FadeStand("stあやせ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701220ay">
「考えたことがある？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701230ta">
「え？　な、なにが……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701240ay">
「世界は、人によって、見える形が違うということを」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701250ay">
「その差異を確かめることはできないわ。概念や認識を他人と完璧に一致させることは、不可能だから」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701260ay">
「でもこれだけははっきりしている」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701270ay">
「キミが見ているものと、私が見ているもの。その違いは、邪心による影響よ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701280ay">
「邪心の集合体が、邪心王グラジオール」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701290ay">
「目覚めようとしている。もうすぐ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701300ay">
「もしも目覚めたら、きっと……」

{	Stand("stあやせ_制服_通常","hard", 250, @-50);
	FadeStand("stあやせ_制服_通常_hard", 300, true);
	DeleteStand("stあやせ_制服_通常_normal", 0, true);}
//■３６０
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701310ay">
//「世界に６７億ある世界は、邪心王が生む混沌によって混じり、溶け合うことになるわ」
「この世に６７億ある世界は、邪心王が生む混沌によって混じり、溶け合うことになるわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701320ay">
「境界が消え、邪心により連結された世界になるのよ。あらゆるものが規則性もなく生まれ、あらゆるものが一瞬で死ぬ。概念も認識も因果律も、すべて破壊される」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701330ay">
「すべてあるが故に、なにもない世界」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701340ay">
「あらゆる神話と同じように、予言されているわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆「詩」＝うた
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701350ay">
「終末予言。滅びの詩」

ホントに、そうなのか……？
あの白紙の文庫本は、なにを意味しているんだ？
グラジオール記黙示録詩編って、なんなんだ？

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701360ay">
「このままでは、滅びの結末に至るだけ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701370ay">
「今、止められるのは、私と、キミ。２人しかいないの」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701380ta">
「ど、どうして、僕ら２人なの……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701390ay">
「導きよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701400ay">
「他の黒騎士は、すでに邪心王に侵食されてしまった」

他の黒騎士……。
あやせはさっきまで血にまみれていて、その血は他の黒騎士の血だと言った。

この病院のどこかで、殺してきたっていうことなんだろうか。
じゃあ、その殺した黒騎士の死体はどこに……？

{	DeleteStand("stあやせ_制服_通常_hard", 500, true);}
と、あやせは僕の横をすり抜け、病室の扉に手をかけた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701410ta">
「ど、どこ行くの？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00701420ay">
「おしっこよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateSE("SE04","SE_日常_びょういんどあ_開く");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE04", null);
	CreateSE("SE05","SE_日常_びょういんどあ_閉まる");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Wait(600);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
ニコリともせずにそう答えて、僕の返事を待たずに出て行った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00701430ta">
「…………」

他にグラジオール記黙示録詩編の本が置いてないかどうか、ざっと目に付くところを探してみる。でも見当たらなかった。

全部で何巻出ているのか知らないけど、さっき僕が手に取ったのは１７巻だった。なのに１～１６巻までは、この病室のどこにも見当たらない。

もちろん、この病室にあやせが持ってきていないだけなのかもしれないけど。

白紙の文庫本をこの目で見てしまった以上、やっぱりどうしても信じられなくて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

	SetVolume("SE3601", 1500, 0, null);

	CreateSE("SE04","SE_日常_びょういんどあ_開く");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE04", null);

	Wait(500);

	CreateSE("SE05","SE_日常_びょういんどあ_閉まる");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
僕はあやせが戻ってくる前に、病室を出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	ClearAll(2000);
	Wait(500);
}
