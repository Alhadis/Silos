//<continuation number="590">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_061_七海とバングル";
		$GameContiune = 1;
		Reset();
	}

		ch03_061_七海とバングル();
}


function ch03_061_七海とバングル()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",500,0,false);

	ClearAll(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg005_01_2_KURENAI見上げ_a.jpg");
	Fade("背景１", 2000, 1000, null, true);

	CreateSE("SE02","SE_自然_動物_カラス_鳴き声_LOOP");
	MusicStart("SE02", 2000, 200, 0, 1000, null, true);

	Wait(1500);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	Fade("背景２", 1000, 1000, null, true);

	Wait(1500);

//ＢＧ//拓巳の部屋・外観//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
はあ、はあ、やっと帰ってこられた……。

途中からずっと走ってきたから、ベースに辿り着いたときには息が上がってしまっていた。
ホント、通行人の冷たい視線が痛かった……。

セナはよくこんな恥ずかしさに耐えられたな。ある意味尊敬するよ。僕にはとてもマネできない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//物音
//おがみ：SE仮組み

	MusicStart("SE02", 2000, 0, 0, 1000, null, false);

	CreateSE("SE01","SE_衝撃_どんがらがっしゃーん");
	SoundPlay("SE01", 0, 500, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100010ta">
「ん！？」

ふと、ベースの陰になってここからは死角になっているところから物音がした。

誰かいる……？

{	CreateSE("SE01","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE01", 0, 1000, true);}
僕はその場で硬直し、息を呑んだ。

思い浮かぶのは、梨深と名乗った悪魔女の白々しい笑顔。

またあいつが来たのかもしれない。
今度こそ殺しに来たのかもしれない。

ど、どうしよう、逃げるべきだろうか。

気配を感じる。
夕焼けによって、何者かの影が地面に描き出されている。
どう見てもそのシルエットは女。

僕はとっさに、ディソードを構えた。

実際にこうして持ってみると、ディソードは思ってた以上に頼りなく感じられる。

セナが持っていたあの剣には、不思議なすごみや何者をも寄せ付けないような圧迫感があった。

でも僕が手に入れたディソードにはそれがないように思える。やっぱり偽物なのかもしれない……。

こんなんで戦えるのか？

た、戦えるわけがない……。例え本物だったとしても無理だ……。

しかもこうして持ってみて分かったけど、けっこう重く感じる。構え方が悪いせいかもしれない。

とにかくこんなのまともに振り回すことすら不可能だ。

影が不意に揺れる。
こっちに近づいてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//黒
	CreateColor("色１", 2000, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 500, 0, 1000, 100, null, "cg/data/lcenter2.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100020ta">
「く、来るなっ……」

//おがみ：SE欲しい
{	CreateSE("SE03","SE_じん体_動作_手_棒を振り回す");
	SoundPlay("SE03", 100, 1000, false);}
僕はきつく目を閉じて、構えた剣ででたらめに前方を突いた。
それで相手を倒せるとは自分でも思えない。

それでもこの剣なら、この剣ならなんとかしてくれる、そんな淡い期待があった。

でも、なんの手応えもない。
敵はなにも言ってこない。

まさか一撃のもとにディソードが悪魔女を消滅させちゃったのかな。
だとしたらすごすぎるぞ――

{	SoundPlay("SE01", 500, 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100030na">
「おにぃ、その剣、なに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100040ta">
「え……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Stand("st七海_制服_通常","pride", 200, @-150);
	FadeStand("st七海_制服_通常_pride", 200, true);

//ＢＧ//拓巳の部屋・外観
//ＣＨ//七海

	DrawTransition("色１", 1000, 1000, 0, 100, null, "cg/data/lcenter2.png", true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
目を開くと、そこに立っていたのは悪魔女ではなく、七海だった。

僕に対して蔑んだような目を向けている。

{	BGMPlay360("CH03",0,1000,true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100050ta">
「な、な、な……」

一気に力が抜けた。僕はその場にへたり込む。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100060ta">
「お、お前……脅かすな……よ……」

最悪だ。最悪の妹だ。
兄を脅かして楽しむなんて、趣味が悪すぎる。

何様のつもりだ。そんなんだから三次元は二次元に永遠に勝てないんだよっ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_制服_通常_pride", 500, true);
	Wait(700);
	Stand("bu七海_制服_通常","angry", 200, @-150);
	FadeStand("bu七海_制服_通常_angry", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100070na">
「別に脅かしてないよ。いつもみたいにおにぃの生存確認しに来てあげたんじゃん。なのにおにぃ、いないんだもん」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100080na">
「なんでナナが、３０分もおにぃのこと心配しながら待ってなくちゃいけないわけ？　ナナの貴重な時間が無駄に消えてっちゃったじゃん。おにぃのバカ」

心配……？
こいつが僕のことを心配してたって？
そんな見え透いた嘘に騙されるもんか。

{	Stand("bu七海_制服_通常","normal", 200, @-150);
	FadeStand("bu七海_制服_通常_normal", 300, true);
	DeleteStand("bu七海_制服_通常_angry", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100090na">
「で、どこ行ってたの？　出かけるなんて珍しいじゃん。ケータイにかけても繋がんないし」

ケータイはベースに置きっぱなしだ。
どうせ持ち歩いてたって誰からもかかってこないんだから意味がない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","shock", 200, @-150);
	FadeStand("bu七海_制服_通常_shock", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100100na">
「そもそも、その剣なんなの？」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100110na">
「もしかして買ってきたの？」

七海は不思議そうに剣を眺めている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","normal", 200, @-150);
	FadeStand("bu七海_制服_通常_normal", 300, true);
	DeleteStand("bu七海_制服_通常_shock", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100120na">
「あ、分かった。アニメのおもちゃかなんかでしょ？　ホント、おにぃってオタクさんだね」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100130na">
「しかもこのおもちゃ、ちっとも似合ってないよ」

{	Stand("bu七海_制服_通常","smile", 200, @-150);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100140na">
「さっきだって、へっぴり腰で構えちゃってて……ぷぷっ、思い出したら笑えてきた」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100150ta">
「…………」

{	DeleteStand("bu七海_制服_通常_smile", 300, true);}
僕は七海を無視してコンテナハウスの扉にかけておいた南京錠を外すと、中に入ろうとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","pride", 200, @-150);
	FadeStand("bu七海_制服_通常_pride", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100160na">
「ちょ、ちょっと！　無視すんなー！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100170ta">
「か、帰れ……」

生存確認に来たなら、もう用は済んだだろうが。

こいつ、いつも僕のことバカにしてるし、ここに来る度に文句ばっかりだけど、そんなにイヤなら来なければいいんだ。こっちだって迷惑なんだし。

{	Stand("bu七海_制服_拗ね","angry", 200, @-150);
	FadeStand("bu七海_制服_拗ね_angry", 500, false);
	DeleteStand("bu七海_制服_通常_pride", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100180na">
「あのねぇ、わざわざ様子見に来てあげてんだから、もっとありがたがってよ」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100190na">
//◆拗ねた口調
「せっかくお土産まで持ってきたのに……」

拗ねたような口調で、七海は唇を尖らせる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100200ta">
「お土産……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","normal", 200, @-150);
	FadeStand("bu七海_制服_通常_normal", 500, false);
	DeleteStand("bu七海_制服_拗ね_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100210na">
「そ！　お母さんが持ってけって。ほら」

七海が差し出してきたのは、みかんだった。
赤いネットの中に、１０個近く入っている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100220ta">
「…………」

微妙すぎだろ……。
みかんはあれば食べるけど、大好物ってわけじゃないし。

{	Stand("bu七海_制服_通常","smile", 200, @-150);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100230na">
//◆「食べたげる」＝「食べてあげる」
「というわけでナナもちょっと一服したいから、一緒に食べたげる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100240ta">
「帰れ……」

{	Stand("bu七海_制服_通常","angry", 200, @-150);
	FadeStand("bu七海_制服_通常_angry", 300, true);
	DeleteStand("bu七海_制服_通常_smile", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100250na">
「もー！　妹がお土産持ってきてしかも一緒に食べてあげるって言ってるんだよ！？　もっと喜びなよ！」

七海と一緒にみかんを食べることのどこに喜ぶ要素があるって言うんだ。

そもそもこいつはただ単純にみかんを食べたいだけに違いない。昔から食いしん坊だからな。僕の分までよく勝手に食べてくれたもんだ。それで何度ケンカしたか分からない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_制服_通常_angry", 500, true);
	CreateSE("SE01","SE_日常_扉_開ける");
	SoundPlay("SE01", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
七海は空気も読まずに、先にベースの中に入っていった。仕方なく僕も続く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

	CreateSE("SE01","SE_日常_扉_閉まる");
	SoundPlay("SE01", 0, 1000, false);

	Wait(1000);

	Stand("bu七海_制服_通常","smile", 200, @-150);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_angry", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100260na">
「お茶ある？　あったかいのがいいな」

あるわけないだろ……。僕は基本的にコーラしか飲まないんだから。

{	DeleteStand("bu七海_制服_通常_smile", 500, false);
	CreateSE("SE01","SE_じん体_動作_座る七海");
	SoundPlay("SE01", 0, 1000, false);}
七海はソファに座って、さっそくみかんを取り出し始める。僕はため息をつくと、ディソードをＰＣデスクの横に立て掛けた。ポケットに入れてあったバングルは不要だからポイ。

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100270na">
「あれ？　それなに？」

僕が床に放り捨てたバングルを、七海がめざとく見つけて拾い上げた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＣＧ//雪の結晶をモチーフにした黄色いバングル
//※このバングルは６章での伏線となります

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg211_01_5_黄色いバングル_a.jpg");
	Fade("背景２", 1000, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100280na">
「へえ～、かわいいバングルじゃん」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100290na">
「これも買ってきたの？　おにぃにしてはいいセンス」

かわいい、だって？
どこがだよ。どう見ても５００円くらいで買える安物じゃないか。
七海ってセンス悪すぎだな。

僕は七海を無視して、みかんをひとつ持ってＰＣの前に座った。

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100300na">
「ねえねえ。なんでこれ、捨てちゃうの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100310ta">
「だ、だって、いらないし……」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100320na">
「ふーん……」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100330na">
「じゃあさ、これナナにちょうだい！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100340ta">
「はあ……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100350na">
「いいじゃん。どうせ捨てるならさ」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100360na">
「たまにはお兄ちゃんらしく、妹にプレゼントのひとつでもしてよ」

//※禁則処理
プレゼントっていうか、不要品をお前が勝手に欲しがってるだけだろ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100370ta">
「か、勝手に持ってけば……」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100380na">
「ホント！？　やったー」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//バングルを身につける七海
//はめたのは右手
	CreateTexture360("背景３", 100, 0, 0, "cg/ev/ev030_01_2_七海バングル_a.jpg");
	DrawTransition("背景３", 500, 0, 1000, 100, null, "cg/data/light5.png", true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
現金なヤツめ。
僕が許可するなり、さっそくバングルを腕にはめている。そんな安物で喜べるなんて安っぽい妹だ、ふひひ。

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100390na">
//◆嬉しそう
「へっへ～。おにぃ、どう？　似合う？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100400ta">
「ぜ、全然……」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100410na">
「あっそ」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100420na">
//◆嬉しそうに
「おにぃのバ～カ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100430ta">
「…………」

僕は七海にプレゼントをあげたはずだよね……。
なのにこの扱いはなんなんだ？
妹の分際で兄をバカ呼ばわりなんて……。

どんな教育受けてきたんだ！
エロゲ１００本プレイしてこい！

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100440na">
//◆嬉しそうに
「へへ～、バ～カ」

やたらとニヤニヤしてるし。
すごいムカついてきた……。

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100450na">
//◆嬉しそう
「これ気に入っちゃったから、もう返さないもんね」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100460na">
「っていうか、おにぃからプレゼントもらうなんて初めてのような気がする」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100470na">
「しょうがないから大事にしてあげるよっ」

知らんがな。
大事にしろ、なんて誰も頼んでない。
そもそも七海のために手に入れた物じゃないし。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100480ta">
「も、もう、用は済んだんだから、帰れ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100490ta">
「ぼ、僕は暇じゃない……んだ……。じ、邪魔、するな……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	Fade("背景２", 0, 0, null, true);
	Fade("背景３", 1000, 0, null, true);

	Wait(500);

	Stand("bu七海_制服_通常","pride", 200, @-150);
	FadeStand("bu七海_制服_通常_pride", 400, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100500na">
「…………」

と、七海は途端に唇を尖らせた。

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100510na">
「そんな言い方しなくてもいいじゃん」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100520na">
「それにみかんまだ食べてないし、お茶もまだ出してもらってないよっ」

//◆※わざとこんなセリフです
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100530ta">
「お、おめぇに飲ませるお茶はねぇ」

{	Stand("bu七海_制服_通常","angry", 200, @-150);
	FadeStand("bu七海_制服_通常_angry", 300, true);
	DeleteStand("bu七海_制服_通常_pride", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100540na">
「むっか～」

七海は肩を怒らせ、僕をじっとにらみつけてくる。その瞳がやがてじわじわと潤んできて――

{	Stand("bu七海_制服_拗ね","sad", 200, @-150);
	FadeStand("bu七海_制服_拗ね_sad", 500, false);
	DeleteStand("bu七海_制服_通常_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100550na">
「分かったよ！　そんなに邪魔なら帰るっ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06100560ta">
「ああ、さっさと、頼む……」

//◆不満げにうなる
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100570na">
「うむう～～～」

{	Stand("bu七海_制服_キレ","mad", 200, @-150);
	FadeStand("bu七海_制服_キレ_mad", 400, false);
	DeleteStand("bu七海_制服_拗ね_sad", 400, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100580na">
「おにぃのバカ！
おにぃなんて、みかんの皮で目つぶし食らって失明しちゃえー！」

//【七海】
<voice name="七海" class="七海" src="voice/ch03/06100590na">
「あとバングルは返さないかんね！　バーカ！」

{	CreateSE("SE01","SE_じん体_動作_足_走る_LOOP");
	CreateSE("SE02","SE_日常_扉_開ける");
	CreateSE("SE02","SE_日常_部屋の扉開く_勢いよく");
	DeleteStand("bu七海_制服_キレ_mad", 200, false);
	SoundPlay("SE01", 0, 1000, false);
	Wait(500);
	Shake("背景１", 200, 2, 2, 0, 0, 500, null, false);
	SoundPlay("SE02", 0, 1000, false);
	SoundPlay("SE03", 0, 1000, false);
	SoundPlay("SE01", 3000, 0, false);
	SetVolume360("CH*", 2000, 0, null);
	Wait(1500);
	CreateSE("SE05","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE05", 1500, 500, 0, 1000, null, true);
	Wait(500);}
室内に響き渡るキンキンした声で叫ぶと、七海は自分のカバンを持ってものすごい勢いで飛び出していった。

はあ、やっと嵐のような時間が終わったよ……。

//※わざと「嫁」です。
七海の相手は毎度疲れる。なんであいつ、僕がこんなに嫌がってるのに毎週来るんだろう。もっと空気嫁。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);

	Wait(2000);

}