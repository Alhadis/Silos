//<continuation number="1640">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_180_インターミッション４３";
		$GameContiune = 1;
		Reset();
	}

		ch09_180_インターミッション４３();
}


function ch09_180_インターミッション４３()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//アイキャッチ
//■インターミッション４３
//ＢＧ//信用調査会社フリージア・社内//夜
	IntermissionIn();

	DeleteAll();

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg069_01_3_フリージア社内_a.jpg");
	Fade("back03", 0, 1000, null, true);

	Stand("st克子_スーツ_通常","sigh", 200, @-400);
	FadeStand("st克子_スーツ_通常_sigh", 0, true);

	IntermissionIn2();


	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000010mm">
「これが新作？　またヘンテコねえ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH25", 2000, 1000, true);
	Stand("st安二_スーツ_通常","normal", 200, @0);
	FadeStand("st安二_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
百瀬は、判が買ってきたゲロカエルんのキーホルダーをまじまじと眺めて、微笑んだ。

{	Stand("st克子_スーツ_通常","normal", 200, @-400);
	FadeStand("st克子_スーツ_通常_normal", 300, true);
	DeleteStand("st克子_スーツ_通常_sigh", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000020mm">
「でもかわいいじゃない」

//【判】
<voice name="判" class="判" src="voice/ch09/18000030bn">
「そりゃ新作じゃねえよ。先週出た、{	Stand("st安二_スーツ_通常","shock", 210, @0);
	FadeStand("st安二_スーツ_通常_shock", 300, true);	
	DeleteStand("st安二_スーツ_通常_normal", 0, true);}えーと、なんだっけ？」

判は救いを求めるように、優愛の顔を見る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","worry", 180, @+400);
	FadeStand("st優愛_制服_通常左手下_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000040yu">
「な、涙目ゲロカエルん、です」

{	Stand("st安二_スーツ_通常","normal", 210, @0);
	FadeStand("st安二_スーツ_通常_normal", 300, true);	
	DeleteStand("st安二_スーツ_通常_shock", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18000050bn">
「そうそう、それ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000060mm">
「ごめんね、優愛ちゃん。こんなむさ苦しいおじさんに付き合わされて、大変だったでしょ？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000070yu">
「あ、いえ……」

//【判】
<voice name="判" class="判" src="voice/ch09/18000080bn">
「ひでえなモモちゃん。こんなダンディな中年はなかなかいねえぜ？」

だが百瀬は判の冗談めかした抗議を聞いておらず、社長自ら優愛にお茶を出していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常左手下_worry", 500, false);
	DeleteStand("st安二_スーツ_通常_normal", 500, false);	
	DeleteStand("st克子_スーツ_通常_normal", 500, true);
	Stand("bu安二_スーツ_通常","normal", 200, @+250);
	FadeStand("bu安二_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
判はため息をつきつつイスに座り、オフィス内を見回す。

いつもは夜遅くまで作業しているフリージアの社員は、今日に限って珍しく定時で帰ったらしい。ホワイトボードに書かれている各社員の予定ではそうなっている。

おかげで日が暮れたばかりだと言うのに、
オフィス内は深夜のように静まり返っていた。

//【判】
<voice name="判" class="判" src="voice/ch09/18000090bn">
「で、モモちゃん。シンコーのこと、調べてくれたかい？」

原宿で電車に乗る前に、判はあらかじめ百瀬に電話してシンコーのことを調べるよう頼んでいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu克子_スーツ_通常","normal", 190, @-400);
	FadeStand("bu克子_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000100mm">
「その前に……」

百瀬は満面の笑みのまま、湯飲みを傾ける優愛の方をチラリと窺った。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000110mm">
「優愛ちゃん、お茶を飲んだら帰った方がいいわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu安二_スーツ_通常_normal", 500, true);
	Stand("bu優愛_制服_通常","worry", 200, @+400);
	FadeStand("bu優愛_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000120yu">
「え……？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000130mm">
「日も暮れたし、ご両親が心配するでしょう？」

//◆ブレス
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000140yu">
「…………」

優愛は百瀬のその態度の裏にある意図に気付いた。
これからする話は、一般人である優愛がおいそれと聞いていいものではないのだ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000150yu">
「わたしのこと、心配してくれているんですか？」

{	Stand("bu克子_スーツ_通常","hard", 190, @-400);
	FadeStand("bu克子_スーツ_通常_hard", 300, true);
	DeleteStand("bu克子_スーツ_通常_normal", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000160mm">
「ええ、そうよ」

百瀬は真顔になってうなずく。
その心遣いに感謝しつつも、優愛はきっぱりと首を振った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","hard", 200, @+400);
	DeleteStand("bu優愛_制服_通常_worry", 500, false);
	FadeStand("bu優愛_制服_通常左手下_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000170yu">
「わたし、帰りません。美愛ちゃんの、死の真相に近づくためなら、なんだって、するつもりです」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000180mm">
「あなたはこれ以上関わるべきじゃないわ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000190yu">
「わたしも、とっくに当事者のひとりです」

優愛の言葉には、絶対に譲ろうとしない凛とした強さがあった。

百瀬は思わぬ反発を食らって困惑する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu克子_スーツ_通常","sigh", 190, @-400);
	FadeStand("bu克子_スーツ_通常_sigh", 300, true);
	DeleteStand("bu克子_スーツ_通常_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000200mm">
「意外と頑固ね……」

//【判】
<voice name="判" class="判" src="voice/ch09/18000210bn">
「ま、ここでのけ者にするのも酷ってもんだろ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常左手下_hard", 500, true);
	Stand("bu安二_スーツ_通常","normal", 200, @+400);
	FadeStand("bu安二_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【判】
<voice name="判" class="判" src="voice/ch09/18000220bn">
「いざとなったら警察で保護するさ」

判の呑気な態度に、百瀬は逆に深々とため息を吐かざるを得ない。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000230mm">
「バンちゃんにそんな権力があるのかしらね」

//【判】
<voice name="判" class="判" src="voice/ch09/18000240bn">
「ま、こう見えても一応、天下の警視庁捜査一課所属だからな」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000250mm">
「あら、そう」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu安二_スーツ_通常_normal", 500, true);
	Stand("bu優愛_制服_通常左手下","hard", 200, @+400);
	FadeStand("bu優愛_制服_通常左手下_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
判のことは適当にあしらい、百瀬はじっと優愛の顔を見据えた。

{	Stand("bu克子_スーツ_通常","hard", 190, @-400);
	FadeStand("bu克子_スーツ_通常_hard", 300, true);
	DeleteStand("bu克子_スーツ_通常_sigh", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000260mm">
「これから聞くことは、絶対に口外しちゃダメよ？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000270mm">
「これはあなたの命にも関わることだから。それを肝に銘じてね」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000280yu">
「は、はい……っ」

優愛は、表情を引きつらせつつうなずいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back10", 500, 0, 0, "cg/bg/bg069_01_3_フリージア社内_a.jpg");
	Fade("back10", 500, 1000, null, true);
	DeleteStand("bu優愛_制服_通常左手下_hard", 0, false);
	DeleteStand("bu克子_スーツ_通常_hard", 0, true);
	Fade("back10", 100, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
それを見てもう一度ため息をつき、百瀬は自分の席につく。

そのふっくらとした身体をさらに丸めて、ノートパソコンに繋げたマウスを操作し始めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu安二_スーツ_通常","hard", 200, @+400);
	FadeStand("bu安二_スーツ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604003]
//【判】
<voice name="判" class="判" src="voice/ch09/18000290bn">
「で？　シンコーからなにが出たんだい？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu克子_スーツ_通常","hard", 190, @-400);
	FadeStand("bu克子_スーツ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605003]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000300mm">
「バンちゃんの予感的中、って感じね」

判と優愛が、百瀬の後ろからモニタをのぞき込む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back05", 500, 0, 0, "cg/bg/bg202_01_1_希グループｗｅｂサイト_a.jpg");
	Fade("back05", 500, 1000, null, true);
	DeleteStand("bu克子_スーツ_通常_hard", 0, false);
	DeleteStand("bu安二_スーツ_通常_hard", 0, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3606003]
//◆「希」＝「のぞみ」
//イメージＢＧ//希グループｗｅｂサイト
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000310mm">
「有限会社シンコーの親会社は、希テクノロジーよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000320yu">
「希……テクノロジー？」

//【判】
<voice name="判" class="判" src="voice/ch09/18000330bn">
「希グループか。こいつは驚きだな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back06", 500, 0, 0, "cg/bg/bg203_01_1_ゲロカエルん偽通販サイト_a.jpg");
	CreateSE("SE01","SE_日常_PC_マウスくりっく");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Fade("back06", 500, 1000, null, true);
	Delete("back05");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3607003]
//イメージＢＧ//ゲロカエルん偽通販サイト
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000340mm">
「シンコーは、５年前に希グループに吸収合併されたんだけど、それ以降、発売した商品が次々と大ヒットしてるのよ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000350mm">
「ゲロカエルんだけじゃないの。中国製バッグとか、タイ製のエコバッグとか、美脚パンツとか」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000360mm">
「で、この会社は商品の売り出し方が独特なの。いつも、週末に新製品を一斉に投入するのよ」

“週末”

そのキーワードに、判が敏感に反応した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back06", 300, 0, null, true);

	Stand("bu安二_スーツ_通常","hard", 200, @+400);
	FadeStand("bu安二_スーツ_通常_hard", 500, true);

	Delete("back06");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【判】
<voice name="判" class="判" src="voice/ch09/18000370bn">
「ＧＥレートとの関係は？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000380mm">
「必然にしろ偶然にしろ、シンコーの商品がヒットしてるのはＧＥレートの変動の影響ね。それは確かよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu克子_スーツ_通常","normal", 190, @-400);
	FadeStand("bu克子_スーツ_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000390mm">
「前に見せた、ＧＥレートのグラフ、覚えてる？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000400mm">
「５年ぐらい前からずっと、毎週末に値が上がってるって言ったわよね。シンコーが希グループに合併された時期とぴったり一致するわ」

//【判】
<voice name="判" class="判" src="voice/ch09/18000410bn">
「シンコーがレートを操作してると思うか？」

{	Stand("bu克子_スーツ_通常","hard", 190, @-400);
	FadeStand("bu克子_スーツ_通常_hard", 300, true);
	DeleteStand("bu克子_スーツ_通常_normal", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000420mm">
「シンコー自体はそんなに大きな会社じゃないから、それは無理よ」

{	Stand("bu安二_スーツ_通常","normal", 200, @+400);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_hard", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18000430bn">
「となると、親会社……希が怪しいな。グループ総出で取り組めば、レート操作だってできそうじゃねえか」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000440mm">
「待って。希の方はもちろんだけど、シンコーが興味深いのはそこだけじゃないの」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000450mm">
「設立当初の資料にまで遡ってみたら、すごい大物が出てきたのよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu安二_スーツ_通常","shock", 200, @+400);
	FadeStand("bu安二_スーツ_通常_shock", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【判】
<voice name="判" class="判" src="voice/ch09/18000460bn">
「大物？」

//◆「いのはな・こうぞう」
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000470mm">
「<RUBY text="いのはな">猪鼻</RUBY><RUBY text="こうぞう">康三</RUBY>」

{	Stand("bu安二_スーツ_通常","normal", 200, @+400);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_shock", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18000480bn">
「ははあ、明和党の重鎮じゃねえの」

//◆「民自党」＝「みんじとう」
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000490mm">
「シンコー設立当時は、まだ民自党在籍時代だけどね」

//【判】
<voice name="判" class="判" src="voice/ch09/18000500bn">
「繋がってきたな」

{	Stand("bu安二_スーツ_通常","hard", 200, @+400);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18000510bn">
「太田教授のとき、それとこの前の地震のとき。明和党はＧＥレートに関係ありそうな件について報道規制の圧力をかけてきてる」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000520mm">
「ＧＥレートのグラフのことだけど」

{	Stand("bu克子_スーツ_通常","normal", 190, @-400);
	FadeStand("bu克子_スーツ_通常_normal", 300, true);
	DeleteStand("bu克子_スーツ_通常_hard", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000530mm">
「いろいろ調べてたら、他にも面白いパターンを見つけたわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back06", 500, 0, 0, "cg/bg/bg177_01_1_GEレート折れ線グラフ_a.jpg");
	CreateSE("SE01","SE_日常_PC_マウスくりっく");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Fade("back06", 500, 1000, null, true);
	DeleteStand("bu安二_スーツ_通常_hard", 0, false);
	DeleteStand("bu克子_スーツ_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
この５年のＧＥレートで百瀬が注目したのは、今のところふたつ。

毎週末に定期的に上がる部分。これは最大値自体は大したことはないが、年末年始とゴールデンウィーク、そしてお盆以外は必ず上がっている。

第二に、地震が起きたときの急激な上昇。２ヶ月前に８人の死者を出したときと、一週間ほど前に１００名以上が亡くなった地震のときに、ＧＥレートは一時的にすさまじいまでの上昇を見せた。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000540mm">
「で、３つめのパターン」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000550mm">
「この５年で４回だけ起きてるわ。時期はどれもまちまち。上昇値は、地震のときほどじゃないけどけっこう高いの」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000560mm">
「最初はこれがなにを意味してるのか分からなかったんだけど、調べていくうちにこの“５年で４回”と符合するイベントに行き着いた」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000570yu">
「イベント……？」

//【判】
<voice name="判" class="判" src="voice/ch09/18000580bn">
「もったいぶらずに教えろよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3612005]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000590mm">
「選挙よ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000600mm">
「衆参合わせて４度行われた選挙日と、その４回のＧＥレート上昇の日は完全に同じだったわ」

判は渋い表情のまま、顎の無精ヒゲを手でさする。

//【判】
<voice name="判" class="判" src="voice/ch09/18000610bn">
「野党だった明和党が大躍進を遂げて、与党になった選挙は……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000620yu">
「４年前、ですね」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000630mm">
「そして、猪鼻康三が民自党を電撃的に離党して、明和党に移ったのは５年前」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back06", 500, 0, null, true);
	Delete("back06");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3611005]
//【判】
<voice name="判" class="判" src="voice/ch09/18000640bn">
「…………」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000650mm">
「…………」

ふと、重苦しい沈黙が３人の間に漂う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","worry", 180, @+400);
	FadeStand("st優愛_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000660yu">
「な、なんだか、わたし、お話を聞いていたら……怖くなってきました」

つぶやく優愛の声はわずかに震えていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st克子_スーツ_通常","hard", 190, @-400);
	FadeStand("st克子_スーツ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000670mm">
「私もびっくりだわ。ここまでキーワードがぴったり当てはまるなんてね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","normal", 200, @-10);
	FadeStand("st安二_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603005]
//【判】
<voice name="判" class="判" src="voice/ch09/18000680bn">
「まだ状況証拠でしかないがな」

{	Stand("st安二_スーツ_通常","hard", 200, @-10);
	FadeStand("st安二_スーツ_通常_hard", 300, true);
	DeleteStand("st安二_スーツ_通常_normal", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18000690bn">
「それでも、ＧＥレートのことを知っていたからこそ、気付けたわけだ」

//【判】
<voice name="判" class="判" src="voice/ch09/18000700bn">
「知らなかったら、さっぱりだったろう」

そう言って判は愛用のうちわを手にすると、呑気にあおぎ始めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","normal", 200, @-10);
	FadeStand("st安二_スーツ_通常_normal", 300, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【判】
<voice name="判" class="判" src="voice/ch09/18000710bn">
「ところで、俺が調べた女子高生の生態について話していいかい？」

突然話題を変えようとする判に、百瀬は呆れ、鋭い視線を投げつける。

{	Stand("st克子_スーツ_通常","sigh", 190, @-400);
	FadeStand("st克子_スーツ_通常_sigh", 300, true);
	DeleteStand("st克子_スーツ_通常_hard", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000720mm">
「あのねえ。いきなりそんな下らないこと言い出すんじゃないわよ。優愛ちゃんがいるんだから少しは考えなさい」

{	Stand("st安二_スーツ_通常","pride", 200, @-10);
	FadeStand("st安二_スーツ_通常_pride", 300, true);
	DeleteStand("st安二_スーツ_通常_normal", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18000730bn">
「まあそう言うなって」

判の顔にはニヤニヤとした笑みが浮かんでいるが、その目は笑っていない。

//【判】
<voice name="判" class="判" src="voice/ch09/18000740bn">
「蒼井セナについてだ」

//【判】
<voice name="判" class="判" src="voice/ch09/18000750bn">
「いや、正しくは、<RUBY text="はたの">波多野</RUBY>セナ、と言うべきか。なぜか最近になって母親の旧姓を使い始めたんだよな」

{	Stand("st安二_スーツ_通常","normal", 200, @-10);
	FadeStand("st安二_スーツ_通常_normal", 300, true);
	DeleteStand("st安二_スーツ_通常_pride", 0, true);}
//◆「波多野一成」＝はたの・いっせい
//【判】
<voice name="判" class="判" src="voice/ch09/18000760bn">
「その波多野セナの父親……<RUBY text="はたの">波多野</RUBY><RUBY text="いっせい">一成</RUBY>は今、失踪して行方不明らしいんだが、希テクノロジーの元社員なんだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","shock", 180, @+400);
	FadeStand("st優愛_制服_通常_shock", 300, true);
	DeleteStand("st優愛_制服_通常_worry", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000770yu">
「え……」

{	Stand("st克子_スーツ_通常","hard", 190, @-400);
	FadeStand("st克子_スーツ_通常_hard", 300, true);
	DeleteStand("st克子_スーツ_通常_sigh", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000780mm">
「どういうこと？」

//【判】
<voice name="判" class="判" src="voice/ch09/18000790bn">
「どういうこともなにも、そのまんまさ」

希テクノロジー社は、主に医療機器に関するソフトウェアを開発している企業だ。希グループは元々、この希テクノロジー社を出発点としてＭ＆Ａを繰り返し、日本でも有数の複合企業体へと成長した。

{	Stand("st安二_スーツ_通常","hard", 200, @-10);
	FadeStand("st安二_スーツ_通常_hard", 300, true);
	DeleteStand("st安二_スーツ_通常_normal", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18000800bn">
「半年前、波多野セナの母親と生後１年の妹が謎の死を遂げている。父親の失踪はその直後だ」

//【判】
<voice name="判" class="判" src="voice/ch09/18000810bn">
「波多野セナ本人も、それと前後して、当時預けられていたとある施設を脱走するって騒ぎを起こした」

{	Stand("st優愛_制服_通常","worry", 180, @+400);
	FadeStand("st優愛_制服_通常_worry", 300, true);
	DeleteStand("st優愛_制服_通常_shock", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000820yu">
「施設、ですか？」

{	Stand("st安二_スーツ_通常","normal", 200, @-10);
	FadeStand("st安二_スーツ_通常_normal", 300, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, true);}
//◆「天神寮」＝「てんじんりょう」
//【判】
<voice name="判" class="判" src="voice/ch09/18000830bn">
「天神寮、っていう、非営利の自立更生支援施設だ。表向きはな」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000840mm">
「表向きって、じゃあ裏があるの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【判】
<voice name="判" class="判" src="voice/ch09/18000850bn">
「スポンサーがいるのさ。これが天成神光会だったりする」

{	Stand("st克子_スーツ_通常","sigh", 190, @-400);
	FadeStand("st克子_スーツ_通常_sigh", 300, true);
	DeleteStand("st克子_スーツ_通常_hard", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000860mm">
「天成神光会……」

百瀬は顔をしかめた。
あからさまにうんざりとした声を出す。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000870mm">
「また面倒な名前が出てきたわね」

{	Stand("st安二_スーツ_通常","hard", 200, @-10);
	FadeStand("st安二_スーツ_通常_hard", 300, true);	
	DeleteStand("st安二_スーツ_通常_normal", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18000880bn">
「ちなみにその天神寮は、２年前まで別の名前だった」

//【判】
<voice name="判" class="判" src="voice/ch09/18000890bn">
「アークハートメディカル会」

//【判】
<voice name="判" class="判" src="voice/ch09/18000900bn">
「どんな偶然か、今や渋谷の若者のカリスマ的存在であるＦＥＳ……岸本あやせも、ここに入れられていたんだな」

//【判】
<voice name="判" class="判" src="voice/ch09/18000910bn">
「波多野セナとは入れ違いだったみてえだが」

判はそこで、百瀬たちの方へと身を乗り出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back10", 500, 1000, null, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, false);
	DeleteStand("st優愛_制服_通常_worry", 0, false);
	DeleteStand("st克子_スーツ_通常_sigh", 0, true);

	Stand("bu安二_スーツ_通常","normal", 200, @+400);
	FadeStand("bu安二_スーツ_通常_normal", 0, true);	

	Fade("back10", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【判】
<voice name="判" class="判" src="voice/ch09/18000920bn">
「で、だ。ここからが興味深いんだが」

//【判】
<voice name="判" class="判" src="voice/ch09/18000930bn">
「アークハートメディカル会は、天神寮と違ってメンタルケア施設だった。精神病患者を治療してたんだ」

{	Stand("bu安二_スーツ_通常","hard", 200, @+400);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);	
	DeleteStand("bu安二_スーツ_通常_normal", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18000940bn">
「ところが２年前、アークハートメディカル会は突然、非営利団体の自立更生支援施設、天神寮へと姿を変えた」

//◆「ＡＨ東京総合病院」＝「エー・エッチとうきょうそうごうびょういん」
//【判】
<voice name="判" class="判" src="voice/ch09/18000950bn">
「それによって、精神科医が一斉に解雇されたんだが、その医師たちを丸ごと雇い入れたのが、代々木にあるＡＨ東京総合病院だった」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常","hard", 190, @-400);
	FadeStand("bu優愛_制服_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18000960yu">
「『ノータリン』事件で殺された人が勤めていたのって、そこの病院……でしたよね？」

//【判】
<voice name="判" class="判" src="voice/ch09/18000970bn">
「ああ。高科史男。確かにＡＨ東京総合病院の精神科医だ」

{	Stand("bu安二_スーツ_通常","normal", 200, @+400);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);	
	DeleteStand("bu安二_スーツ_通常_hard", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18000980bn">
「ついでに言うと、そこの病院長は、猪鼻と懇意らしいぜ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常_hard", 500, true);
	Stand("bu克子_スーツ_通常","hard", 190, @-400);
	FadeStand("bu克子_スーツ_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18000990mm">
「……また、猪鼻議員ね」

//【判】
<voice name="判" class="判" src="voice/ch09/18001000bn">
「優愛ちゃん、君が追ってた西條拓巳も、実はＡＨ東京総合病院をこの１ヶ月で３回訪れてる」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_hard", 500, true);
	Stand("bu優愛_制服_通常左手下","worry", 190, @-400);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603007]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18001010yu">
「そう、なんですか……？」

//【判】
<voice name="判" class="判" src="voice/ch09/18001020bn">
「警察がずっと尾行してたんでね。確かだ」

//【判】
<voice name="判" class="判" src="voice/ch09/18001030bn">
「しかも西條には、数年前にその病院に入院した記録まであった。彼の主治医は……高科史男だ」

{	Stand("bu優愛_制服_通常左手下","shock", 190, @-400);
	DeleteStand("bu優愛_制服_通常左手下_worry", 500, false);
	FadeStand("bu優愛_制服_通常左手下_shock", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18001040yu">
「……っ！」

//【判】
<voice name="判" class="判" src="voice/ch09/18001050bn">
「不思議なのは、西條の入院記録なんだよな。彼は１０歳で入院して、約２年後にその記録が途切れてるんだが――」

{	Stand("bu安二_スーツ_通常","hard", 200, @+400);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18001060bn">
「退院した記録はなかった」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常左手下_shock", 500, true);
	Stand("bu克子_スーツ_通常","hard", 190, @-400);
	FadeStand("bu克子_スーツ_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604007]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001070mm">
「誰かが改ざんしたのかしら」

//【判】
<voice name="判" class="判" src="voice/ch09/18001080bn">
「どうだかな。そこまでは調べが回らなくてね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【判】
<voice name="判" class="判" src="voice/ch09/18001090bn">
「ああ、それと波多野セナに関してもうひとつ」

//【判】
<voice name="判" class="判" src="voice/ch09/18001100bn">
「最近、彼女がよく行動をともにしている折原梢って生徒がいる。１ヶ月ほど前に転校してきた、西條のクラスメイトなんだが」

//【判】
<voice name="判" class="判" src="voice/ch09/18001110bn">
「この子もけっこうないわく付きなんだ」

//【判】
<voice name="判" class="判" src="voice/ch09/18001120bn">
「折原の父親が、希グループの系列会社社員なわけよ」

//【判】
<voice name="判" class="判" src="voice/ch09/18001130bn">
「元は広島の方に住んでてな。折原梢の同級生３人が何者かに襲われて重傷を負うって事件が起きてる」

//【判】
<voice name="判" class="判" src="voice/ch09/18001140bn">
「３人ともが、右腕を鋭利な刃物で切断されて、ひどい有様だったらしい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【判】
<voice name="判" class="判" src="voice/ch09/18001150bn">
「折原もその場に居合わせていた。彼女が犯人じゃねえかって疑いがかかったんだが、凶器が“存在しない”って理由で逮捕はされてない」

//【判】
<voice name="判" class="判" src="voice/ch09/18001160bn">
「それで地元に居づらくなって引っ越したって噂もある」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001170mm">
「凶器が、存在しない？　見つからない、じゃなくて？」

//【判】
<voice name="判" class="判" src="voice/ch09/18001180bn">
「存在しない、だ。なにで斬られたのかさえ分かってない」

//【判】
<voice name="判" class="判" src="voice/ch09/18001190bn">
「犯行は折原以外には実行できない状況だった。だが、例え折原が犯人だとしても、凶器をどこからか取り出すことも、どこかに隠すことも、不可能だった」

{	Stand("bu安二_スーツ_通常","normal", 200, @+400);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);	
	DeleteStand("bu安二_スーツ_通常_hard", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch09/18001200bn">
「かまいたち現象じゃないか、なんて本気で議論されたぐらいだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001210mm">
「なにもないところから、剣を取り出す手品……」

//【判】
<voice name="判" class="判" src="voice/ch09/18001220bn">
「かもしれねえな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_hard", 500, true);
	Stand("bu優愛_制服_通常左手下","worry", 190, @-400);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603008]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18001230yu">
「……気味が、悪いです」

優愛は身体の震えを止めようとするかのように、身を縮こまらせ、自身の二の腕をさすった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch09/18001240yu">
「なにか、とても大きな意志が、働いているような……」

//【判】
<voice name="判" class="判" src="voice/ch09/18001250bn">
「職業柄、俺は陰謀論なんざ信じちゃいねえんだが、今回ばかりはその存在を信じそうになるね」

//【判】
<voice name="判" class="判" src="voice/ch09/18001260bn">
「明和党、そして希グループ」

//【判】
<voice name="判" class="判" src="voice/ch09/18001270bn">
「ＧＥレートに関係してると思われるのは、そのふたつか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常左手下_worry", 500, true);
	Stand("bu克子_スーツ_通常","sigh", 190, @-400);
	FadeStand("bu克子_スーツ_通常_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604008]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001280mm">
「天成神光会も、叩けば埃が出てきそうね。元々、あまりいい噂は聞かないし」

百瀬はお茶を一口すすり、肩をすくめた。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001290mm">
「バンちゃんには呆れるわ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001300mm">
「本来の仕事をほったらかしにして、こんなことを調べてたなんて」

//【判】
<voice name="判" class="判" src="voice/ch09/18001310bn">
「元はと言えば、モモちゃんがＧＥレートのことを教えてくれたのがいけないんだぜ？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001320mm">
「そうだけど……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001330mm">
「それで捜査本部から外されちゃったら世話ないわ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001340mm">
「本当に不器用なんだから。あんたって人は」

その言葉は、呆れているわけでも、責めているわけでもなく、判という刑事への遠回しの賞賛。
百瀬は口ではなんだかんだ言いつつも、判を認めていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH25", 2000, 500, NULL);

//ＳＥ//判のケータイ着信音
	CreateSE("SE01","SE_日常_けい帯_着信音_判");
	MusicStart("SE01", 0, 500, 0, 1000, null, true);

	Wait(500);

	Stand("bu安二_スーツ_通常","shock", 200, @+400);
	FadeStand("bu安二_スーツ_通常_shock", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【判】
<voice name="判" class="判" src="voice/ch09/18001350bn">
「おっと、電話だ」

判のケータイが電子音を奏でる。
液晶画面を見ると、相手は非通知だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_sigh", 500, false);
	DeleteStand("bu安二_スーツ_通常_shock", 500, true);
	CreateSE("SE03","SE_日常_けい帯_のいず");
	CreateSE("SE02","SE_日常_けい帯ボタン押す");
	SetVolume("SE01", 0, 0, NULL);
	MusicStart("SE02", 0, 500, 0, 1000, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//ＳＥ//ケータイ受ける
//【判】
<voice name="判" class="判" src="voice/ch09/18001360bn">
「もしもし」

{	MusicStart("SE03", 500, 500, 0, 1000, null, false);}
//ＳＥ//電話から聞こえてくるノイズ
電話の向こうから、激しいノイズが聞こえてくる。

判はケータイを耳から離し、改めて液晶画面を見た。
だが電波の状況は良好だった。
問題があるのは相手の方のようだ。

よほど電波が遠い場所なのかと判は首を傾げる。

//【判】
<voice name="判" class="判" src="voice/ch09/18001370bn">
「おい、誰だ？」

//ＶＦ//電話の声//ボイスチェンジャー使用している感じを出してください
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18001380su">
「……手を引け」

それは、ここ最近、判によくかかってくる正体不明の脅迫電話だった。
機械のような声は、おそらくボイスチェンジャーを使ったものだろう。
判は苦笑してそれに答える。

//【判】
<voice name="判" class="判" src="voice/ch09/18001390bn">
「ああ、あんたか。いい加減、名乗ってくんねえかな」

//【判】
<voice name="判" class="判" src="voice/ch09/18001400bn">
「手を引けって言われてもなあ。そもそも、なにから手を引きゃいいんだ？　そこを具体的に言ってもらわねえと」

//ＶＦ//電話の声//ボイスチェンジャー使用している感じを出してください
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18001410su">
「手を、引け」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602009]
いつもはここで切れてしまう。
“手を引け”と２回言って切る。
パターンは必ずと言っていいほど同じ。

判がどれだけ呼びかけても、なにも答えない。

ところが、この日は違った。

//ＶＦ//電話の声//ボイスチェンジャー使用している感じを出してください
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18001420su">
「さもなければ――」

//【判】
<voice name="判" class="判" src="voice/ch09/18001430bn">
「あん？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH25", 1000, 0, NULL);

//ＳＥ//電話から聞こえてくるノイズ
	CreateSE("SE01","SE_日常_けい帯_のいず");
	MusicStart("SE01", 500, 500, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//ＶＦ//以下、諏訪の声は電話の声
//◆弱々しい
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18001440su">
「……せん、ぱい」

//【判】
<voice name="判" class="判" src="voice/ch09/18001450bn">
「……誰だ？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18001460su">
「す、んません……ポカ、したッス……」

そこまで聞いて、ようやく電話の向こうの苦しげな声が誰のものかを判は理解した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//【判】
<voice name="判" class="判" src="voice/ch09/18001470bn">
「諏訪か……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18001480su">
「はい……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18001490su">
「いきなり……拉致、されて……」

//【判】
<voice name="判" class="判" src="voice/ch09/18001500bn">
「誰にやられた？　今どこにいる？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18001510su">
「犯人……分からない、ッス……。黒い目出し帽……で……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602010]
//【判】
<voice name="判" class="判" src="voice/ch09/18001520bn">
「相手はひとりなんだな？」

//◆苦しげな吐息
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18001530su">
「はあ……はあ……」

//【判】
<voice name="判" class="判" src="voice/ch09/18001540bn">
「おい、大丈夫なのか！？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch09/18001550su">
「た、助けて……っ！　先輩、自分はＡＨと――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ブツッと電話が切れる
	CreateSE("SE03","SE_日常_でんわ_ぶつっと切れる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Wait(300);

//「ＡＨ東京総合病院にいる」と言おうとして電話が切られた（ように聞こえる）

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【判】
<voice name="判" class="判" src="voice/ch09/18001560bn">
「諏訪！　おい、諏訪！」

判がどれだけ呼びかけても、電話の向こうからはもうなにも返ってこなかった。

//【判】
<voice name="判" class="判" src="voice/ch09/18001570bn">
「……チッ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SetVolume("SE03", 0, 0, NULL);
	CreateSE("SE01","SE_日常_けい帯ボタン押す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Stand("st優愛_制服_通常","worry", 200, @+400);
	Stand("st克子_スーツ_通常","hard", 190, @-400);
	Stand("st安二_スーツ_通常","hard", 200, @-10);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//ＳＥ//ケータイを切る
舌打ちしてケータイを切る。
{	FadeStand("st克子_スーツ_通常_hard", 500, false);
	FadeStand("st優愛_制服_通常_worry", 500, false);
	FadeStand("st安二_スーツ_通常_hard", 500, true);}
百瀬と優愛が不安げに判を見つめていた。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001580mm">
「諏訪ちゃんになにかあったの？」

判は立ち上がり、自らの頬を軽く二度、叩いた。

//【判】
<voice name="判" class="判" src="voice/ch09/18001590bn">
「諏訪が人質に取られた。どうやら、ＡＨ東京総合病院にいるみてえだ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001600mm">
「まさか、明和党……？」

//【判】
<voice name="判" class="判" src="voice/ch09/18001610bn">
「分かんねえが……このままじゃまずい気がする」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch09/18001620mm">
「応援を頼んだ方がいいわ」

//◆「大事」＝おおごと
//【判】
<voice name="判" class="判" src="voice/ch09/18001630bn">
「大事にしたらそれこそ諏訪の命はねえよ。俺ひとりで様子を見てくる」

判は愛用のうちわをデスクの上、百瀬の手許に置いた。
それから、２人の女性へ順に視線を巡らせる。

いつもの、頼りなさげな中年刑事とはまるで別人のような精悍さだった。

//【判】
<voice name="判" class="判" src="voice/ch09/18001640bn">
「モモちゃんと優愛ちゃんも、どこかに身を隠せ。分かったな？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH01", 2000, 0, NULL);

	ClearAll(1000);

	Wait(3000);

//～～Ｆ・Ｏ

//■インターミッション４３終了

}