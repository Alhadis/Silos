//<continuation number="1110">

chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "chs_155_セナ編_希本社ビル";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_155_セナ編_希本社ビル();
}


function chs_155_セナ編_希本社ビル()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編
//ＢＧ//キャットストリート
//※ＢＧは適当です。渋谷から原宿方面か、六本木方面のどっちかに歩いて向かっている感じを出したい
	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg076_01_1_Ｂｕｎｋａｍａｃｈｉ前_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
希の本社ビルは渋谷駅から歩いて行ける場所にあるらしい。
でも、僕の精神力はそのビルにたどり着く前に根こそぎ奪い取られそうだった。

なにしろセナは、本気で僕を鎖でぐるぐる巻きにしたまま、渋谷のど真ん中を練り歩いているんだから。

大量のケータイカメラが僕に向けられたのは言うまでもない。
これでまた僕の黒歴史がひとつ増えたよ……。

きっともうすでに、＠ちゃんではこんなスレが立っているに違いない。

【エスパー】西條が渋谷で黒髪美人にわんわんプレイされてた

うう、またＤＱＮどもにいじめられる……。

僕が何度懇願しても、セナは鎖を外してはくれなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","normal", 200, @+150);
	FadeStand("buセナ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600010sn">
「今のお前にとって必要なのは、目立つことだ。今のところ、その目的は達成されてるだろう？」

{	DeleteStand("stセナ_制服_通常_normal", 300, true);}
などと、意味不明の理屈を振りかざしてくる。
いったいどういう理屈なんだ。

{#TIPS_安西先生 = true;$TIPS_on_安西先生 = true;}
“<FONT incolor="#88abda" outcolor="BLACK">安西先生</FONT>、目立つ男になりたいです……”
なんて頼んだ覚えは、これっぽっちもないのに！

{$TIPS_on_安西先生 = false;}
//ＴＩＰＳ：安西先生//作成予定
しかも敵の本拠地に乗り込むなんて、いつ殺されてもおかしくないんだぞ！

そんな僕の訴えを、セナはことごとく無視した。
鎖を引いたまま、おしゃれなビルへと入っていく。
引っ張られ、僕もその後に付いていかざるを得なかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//希本社ビルロビー
	SetVolume("SE01", 1000, 0, null);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

	Delete("back01");

	Wait(1000);

	CreateTexture360("back01", 200, 0, 0, "cg/bg/bg217_01_1_chn希本社ロビー_a.jpg");
	Fade("back01", 0, 1000, null, true);


	CreateSE("SE360110","SE_はいけい_ふりーじあ社内_LOOP");
	MusicStart("SE360110",2000,400,0,1000,null,false);


	FadeDelete("Black", 1000, true);

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
目の前に広がる受付ロビーの豪華さに、僕は息を呑む。

希グループ。

{#TIPS_コングロマリット = true;$TIPS_on_コングロマリット = true;}
いまや日本を代表する<FONT incolor="#88abda" outcolor="BLACK">コングロマリット</FONT>って聞いた。
僕みたいなヘタレ学生の日常とは、あまりにもかけ離れた世界。

{$TIPS_on_コングロマリット = false;}
こんなビルに足を踏み入れた経験なんてないから、ロビーの広さとか、受付のおねいさんたちがリアルに鎮座していることに、僕はたじろいでしまう。

//「おねいさん」はわざとです
そもそも、ここって会社だろ……。
関係者以外立ち入り禁止なんじゃないの？

僕もセナも、翠明の制服を着ている。どう見ても高校生。
しかも１人は鎖を巻かれてるっていう不審者丸出しの格好。
にもかかわらず正面から堂々と入っていけるセナの神経を疑う。

案の定、正面玄関の自動ドアをくぐった瞬間に、受付のおねいさんと目が合った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600020ta">
「か、帰ろうよ……」

これ以上進むのを躊躇した。
だけどセナは止まらない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","hard", 200, @+150);
	FadeStand("stセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600030sn">
「心配するな」

{	DeleteStand("stセナ_制服_通常_hard", 300, true);}
受付を通り過ぎて、さらに奥のエレベーターホールへ。
誰にもなにも言われなかった……。いったい、なんで……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE360110", 500, 0, null);
	Wait(600);

//ＢＧ//希ビル非常階段
//※階段のある場所は窓のない密閉空間です。ビルの外にあるのではなく内部にある。
	PrintBG(1000);
	CreateSE("SE01","SE_日常_屋上扉_開く");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateTexture360("背景０", 100, 0, 0, "cg/bg/bg218_01_6_chn非常階段_a.jpg");

	DrawTransition("back*", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);
	Delete("back*");

	CreateSE("SE360110","SE_はいけい_ふりーじあ社内_LOOP");
	MusicStart("SE360110",2000,300,0,1000,null,false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
セナはエレベーターには乗ろうとしなかった。
ホールの近くにあった防火扉を開けて入っていく。
中は薄暗い非常階段で、そこでセナはようやく足を止めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：立ち絵：階段の画像きたら位置調整
	Stand("stセナ_制服_横向剣持ち青","normal", 200, @+150);
	FadeStand("stセナ_制服_横向剣持ち青_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600040sn">
「周囲は、私たちを希の社員だと思い込んでる」

いつの間にか、身体を圧迫するような感触がなくなっていた。
見ると、ぐるぐるに巻き付いていた鎖がきれいさっぱり消滅している。
そしてセナの手には、ディソード。

//※ディソードはリアルブート済み
やっぱりあの鎖は、ギガロマニアックスの力でリアルブートされた妄想……だったのか？

で、セナが僕の目のデッドスポットに反粒子を送り込んだことで、そのリアルブートされた鎖が今度は一瞬で消えた……？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600050ta">
「の、希の社員と思ってるって、ど、どういう……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600060sn">
「そう思い込ませた。肉眼で私たちを見た人間全員にな」

思い込ませた、だって……？
そんなこともできるのか？

と、セナは階段の上を振り仰いだ。
そこには、監視カメラらしきものが設置されている。
赤いランプが付いていて、不気味な音を立てながら首を振っていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600070ta">
「か、監視カメラにも……思い込ませることって、で、できるの？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600080sn">
「やろうと思えばできるかもな。試したことはない。それにやる必要もない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600090ta">
「な、なんで！？　ば、ば、バレちゃうじゃないか！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600100ta">
{#TIPS_スニーキングミッション = true;$TIPS_on_スニーキングミッション = true;}「あ、あり得ない……。す、す、<FONT incolor="#88abda" outcolor="BLACK">スニーキングミッション</FONT>では、監視カメラは最初に壊すでしょ、常識的に考えて……」

{$TIPS_on_スニーキングミッション = false;}
ゲームの知識だけど。

{	DeleteStand("stセナ_制服_横向剣持ち青_normal", 300, true);
	Stand("stセナ_制服_通常","hard", 200, @+150);
	FadeStand("stセナ_制服_通常_hard", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600110sn">
「言っただろう。お前が目立つことが必要なんだ」

だから、意味が分からないってば。

矛盾してるじゃないか。“希の社員だと思い込ませた”っていうカモフラージュ方法を取りながら、“目立つことが必要”なんてさ。
結局どっちなんだ？　なにがしたいんだ？

誰も彼も、思わせぶりなことしか言おうとしない。
僕を、バカにしてるのか！？　どうせ言ったって西條拓巳は理解できないだろうとか、思ってるのか！？

うう、くそぅ、僕は、頭はいいんだぞ……。
絶対に、ＩＱじゃセナより上だね。間違いない。

{	DeleteStand("stセナ_制服_通常_hard", 300, true);}
唇を噛んで、悔しさを我慢している僕を差し置いて、セナはさっさと１人で階段を上っていった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//階段を上っていく足音
	CreateSE("SE02","SE_じん体_動作_足_階だん歩く");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
この女、ホントに僕を守る気があるんだろうか。
いや、きっとないね。このビルに乗り込むとか言い出した時点で、僕は危険にさらされてるんだから。

っていうか勝手に先に行かないでほしい。
せめてどこへ行って、なにをしようとしているのか
説明ぐらいしてくれ……。

だいたい、なんでエレベーターじゃなくて階段なんだ。
僕は運動は苦手なのに。

//◆少し遠くから
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600120sn">
「エレベーターに乗るのは自殺行為だ」

セナの声が上から響いてくる。
また心を読まれた？
僕はため息をつき、セナを追って階段に足を踏み出す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("黒幕１", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("黒幕１", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

	Stand("stセナ_制服_通常","normal", 200, @+150);
	FadeStand("stセナ_制服_通常_normal", 500, true);

	DrawTransition("黒幕１", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);
	Delete("黒幕１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
２階まで上がるとそこでセナが待っていた。
僕が追いついてきたのを見てから、また上っていく。

{	DeleteStand("stセナ_制服_通常_normal", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600130sn">
「敵の本拠地でエレベーターに乗ったら、閉じ込められて身動きが取れなくなるのがオチだろ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600140ta">
「そ、それは、そうだけど……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600150sn">
「それより西條。『将軍』について教えろ。そいつはいつからお前を攻撃するようになった？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600160ta">
「１ヶ月ぐらい、ま、前から……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600170sn">
「話したことがあるんだな？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 500, 0, null);

	Stand("stセナ_制服_通常","hard", 200, @+150);
	FadeStand("stセナ_制服_通常_hard", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
うなずくと、セナは一度立ち止まり、上から僕を振り返った。
パンツ見えそうな角度ですぞ、セナさん……。
僕は反射的に目をそらした。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600180sn">
「どんなことを言っていた？」

どんなことって……。
とりあえずこれまでの『将軍』の発言や、狂言誘拐で脅されたことについて、セナに話してみた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600190sn">
「……波多野、という名前に聞き覚えは？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600200ta">
「……ないけど」

{	Stand("stセナ_制服_通常","angry", 200, @+150);
	FadeStand("stセナ_制服_通常_angry", 300, true);
	DeleteStand("stセナ_制服_通常_hard", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600210sn">
「『将軍』が言っていたかもしれないだろ。よく思い出せ」

波多野……？
分からない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600220ta">
「だ、誰？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600230sn">
「プロジェクト・ノアにかかわっていた男だ」

知らない。プロジェクト・ノアっていう言葉さえ、僕は分からないのに。

{	Stand("stセナ_制服_横向","hard_r", 200, @+150);
	FadeStand("stセナ_制服_横向_hard_r", 300, true);
	DeleteStand("stセナ_制服_通常_angry", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600240sn">
「……そうか。知らないなら別にいい」

{	DeleteStand("stセナ_制服_横向_hard_r", 300, true);}
セナはプイと顔をそらし、今度は黙って階段を上り始めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※しばらく足音ＳＥだけ聞かせる
	CreateSE("SE02","SE_じん体_動作_足_階だん歩く");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	Wait(4000);

	FadeDelete("Black", 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600250ta">
「はあ、はあ……ま、まだ……？」

ほぼ休みなしで２０階ぐらいまで来た。
こんなに階段をたくさん上ったのは、初めてかもしれない。

疲れた……もう上りたくない……。
額から汗が垂れて、目に入りそうになる。手で拭いても拭いても、汗はにじんでくる。足がだるくて、息も苦しくて窒息しそう。

{	SetVolume("SE02", 0, 0, null);}
その場で膝に手を突き、息を整えようとしてみた。
垂れた汗が、床に染みを作る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600260ta">
「あ、あと、どれ、ぐらい、登るの……？」

{	Stand("stセナ_制服_横向","normal_r", 200, @+150);
	FadeStand("stセナ_制服_横向_normal_r", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600270sn">
「社長室は最上階にあるらしい。３１階だ」

あと１０階以上も登るのか……。

って言うか、なんで僕はこんなことをしてるんだ。
セナに“守ってくれ”って頼んだはずなのに、意味が分からないぞ。
僕の脳裏にポルナ○フの顔が浮かんだ。

ハァハァ、という僕の荒い息が、静かな非常階段に響いている。
セナは今度は意外にも先に行こうとはしなかった。
壁に背を預け、僕を無表情で眺めている。

どうやら少し休んでもいいってことらしい。

そのセナの頭上には、例によって監視カメラ。

すべての階に設置されていた。
きっと僕らがこの階段にいることは、とっくにバレているはずだ。
そのうち、守衛が来るかもしれない。

{	Stand("stセナ_制服_通常","hard", 200, @+150);
	DeleteStand("stセナ_制服_横向_normal_r", 300, false);
	FadeStand("stセナ_制服_通常_hard", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600280sn">
「監視カメラに細工をしなかったのは――」

不意にセナがつぶやく。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600290sn">
「『将軍』がもし希の人間で、このビル内にいるなら、おびき寄せることができるかもしれないと思ったからだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600300ta">
「つ、つまり、ぼ、僕はおとりってわけ……？」

{	Stand("stセナ_制服_通常","normal", 200, @+150);
	FadeStand("stセナ_制服_通常_normal", 300, true);
	DeleteStand("stセナ_制服_通常_hard", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600310sn">
「そういうことになる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600320sn">
「もともと希になんか、興味はなかったんだけどな。このビルに乗り込むことにしたのだって、イレギュラーだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600330sn">
「もちろん、いつかはプロジェクト・ノアを潰そうとは思っていたが、それは今じゃない。それよりも優先しなくちゃいけないことがあった」

急に饒舌になったけど……これってもしかして、ここに乗り込んだ理由について、説明してくれているんだろうか。

セナは“優先しなくちゃいけないこと”については話さなかった。

{	Stand("stセナ_制服_通常","angry", 200, @+150);
	FadeStand("stセナ_制服_通常_angry", 300, true);
	DeleteStand("stセナ_制服_通常_normal", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600340sn">
「お前の話を聞く限り、その『将軍』はなにかを知ってる。あるいは、波多野のことも……」

その名前を口にするとき、セナの表情は一瞬だけ険しくなる。
よっぽどの極悪人なのかな？

{	Stand("stセナ_制服_横向剣持ち青","normal", 200, @+150);
	DeleteStand("stセナ_制服_通常_angry", 300, false);
	FadeStand("stセナ_制服_横向剣持ち青_normal", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600350sn">
「……安心しろ、西條。これは交換条件だ。お前におとりになってもらう代わりに、私はお前を守る」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600360sn">
「それにお前だって、『将軍』の正体を知りたいだろ？　脅威を排除するにはこちらから攻撃――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE360110", 1000, 0, null);


//ＳＥ//ヒュンヒュンという機械的な音
//ＳＥは以後、ずっと続く
	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE03", 2000, 500, 0, 1000, null, true);

	DeleteStand("stセナ_制服_横向剣持ち青_normal", 500, true);

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
不意にセナは口をつぐんだ。
不思議そうに眉根を寄せる。壁に預けていた背中を離し、この狭い踊り場で、長大なディソードを構える。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600370ta">
「ど、どうしたの……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_武器構え青","hard", 200, @+150);
	FadeStand("stセナ_制服_武器構え青_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600380sn">
「…………」

セナは答えてくれない。
階段の下の方をのぞき込み、それから上を見上げ――
そこで動きが止まった。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600390sn">
「この声……どこから……？」

声……？

{	Stand("stセナ_制服_武器構え青","angry", 200, @+150);
	FadeStand("stセナ_制服_武器構え青_angry", 300, true);
	DeleteStand("stセナ_制服_武器構え青_hard", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600400sn">
「お前、何者だっ！」

いきなり叫ぶ。
てっきり監視カメラに対して吠えているのかと思ったけど、視線はもっと上……天井に向いていた。

まさか――

イヤな予感がした。
僕も釣られて天井を見上げた。
当然ながらなにもない。

それに僕には“声”は聞こえない。
でも、なんとなく予想はついた。

『将軍』だ……！
ヤツが、はるか上空の人工衛星から思考盗撮をしていて、“声”を聞かせているんだ！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600410ta">
「セ、セナ！　その声を、聞いちゃ、ダメだ……っ！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600420sn">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_武器構え青_angry", 300, true);
	CreateSE("SE04","SE_衝撃_肩にぶつかる");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	Stand("buセナ_制服_武器構え青","angry", 200, @+150);
	FadeStand("buセナ_制服_武器構え青_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600430ta">
「セナ！」

とっさに肩をつかみ、揺さぶる。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600440sn">
「……『将軍』は、希の人間じゃないらしい」

やっぱりだ……！
『将軍』の声をセナは聞いたんだ！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600450ta">
「だ、だ、騙されてるっ！　あいつは、て、敵だよっ！　し、信じちゃ、ダメだ……っ！」

{	SetVolume("SE03", 3000, 1000, null);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600460sn">
「音だ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600470ta">
「……え？」

セナの肩にかけていた僕の手。
その手首を、逆にきつくつかまれた。
爪が食い込んで、走る痛み。

僕は顔をしかめ――

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600480sn">
「西條、音がしている！　気を付けろ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
	SetVolume("SE03", 0, 0, true);
	DelusionIn();

	CreateTexture360("背景１", 500, 0, 0, "cg/ev/ev084_01_3_ノアII_a.jpg");
	Move("背景１", 0, @0, -832, null, true);

	DelusionIn2();


	CreateSE("SE360201","SE_じん体_心臓_鼓動");
	MusicStart("SE360201",500,1000,0,1000,null,true);

	Wait(2000);

//ここで野呂瀬ディソードに張り付けにされたセナのＣＧが欲しいです
//ev077_野呂瀬社長室の差分（野呂瀬がいなくて、七海がいるもの）を使うか、ev084_ノアⅡの七海のみ、どちらかを使いたい
//以後、無音

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
頭の中で、閃光が爆ぜた。
浮かび上がったのは、映像。

暗い部屋。
床にできた、血溜まり。
十字架のようなオブジェ。

そこに拘束され、力なくうなだれているのは――
服を血に染めた――
右の手首を無残に切断された――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//七海の姿をアップに
	CreateTexture360("ズーム背景１", 600, 0, 815, "cg/ev/ev084_01_3_ノアII_a.jpg");
	Fade("ズーム背景１", 0, 0, null, true);
//おがみ：バーテックス修正　//コメントアウト済み
//	SetVertex("ズーム背景１", 300, 500);//コメントアウト済み
	Zoom("ズーム背景１", 0, 1800, 1800, null, true);
	Move("ズーム背景１", 0, 160, -1072, null, true);
//	Move("ズーム背景１", 0, 200, -1640, null, true);

	Fade("ズーム背景１", 300, 1000, null, true);

	Wait(1000);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
	SetVolume("SE360201", 0, 0, null);
	DelusionOut();

//ＢＧ//希ビル非常階段
	Delete("背景１");
	Delete("ズーム背景１");

	DelusionOut2();

	BGMPlay360("CH06",0,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600490ta">
「――わああああっ！」

見えた――

はっきり、見えた。
今のは、間違いなく。

七海だ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600500ta">
「な、な、七海がっ！　なな、七海が、こ、このビルの、どこかに！」

やっぱり『将軍』に連れ去られていたんだ！
手首だって、妄想なんかじゃなくて、ホントだったんだ！

探さないと……。

あのとき、僕が助けてあげられなかったせいで、今もセナは苦しんでるんだ……。

だから、探さないと。
今度こそ、僕がなんとかしないと……。

{	Stand("buセナ_制服_通常","angry", 200, @+150);
	DeleteStand("buセナ_制服_武器構え青_angry", 300, true);
	FadeStand("buセナ_制服_通常_angry", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600510sn">
「落ち着け、西條！　これは罠の可能性が――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00600520ta">
「さ、さっき、君だって、し、『将軍』の言葉を信じたじゃないか！」

{	CreateSE("SE04","SE_じん体_動作_手_梨深を振り払う");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	DeleteStand("buセナ_制服_通常_angry", 300, true);}
僕はセナの手を強引に振り払った。
社長室は、３１階だったよな……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00600530sn">
「違う、音を聞け！『将軍』の干渉とは別の妄想だ！」

//ＳＥ//階段を駆け上がる足音
{	CreateSE("SE05","SE_じん体_動作_足_階だん走る_拓巳_LOOP");
	MusicStart("SE05", 0, 1000, 0, 1000, null, true);}
無視して、駆け上がる。

疲れただなんて弱音を吐いてる場合じゃなかった。
必死だった。

七海が苦しんでいる。
僕のせいだ。全部、僕のせいなんだ。
あのときはダメだった。僕は逃げた。

七海に恨まれる。
許して……。
僕は最低の兄貴だ……。

ちくしょう、力がほしい。セナみたいに、ディソードがほしい。
なんで僕は、ディソードを手に入れられないんだ。
こんなに求めてるのに……。

七海、死ぬな……。
頼むから……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE05", 1000, 0, null);
	SetVolume360("@CH06", 1000, 0, null);

	ClearAll(2000);
	Wait(1000);

}

