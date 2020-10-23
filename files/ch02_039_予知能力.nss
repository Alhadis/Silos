//<continuation number="180">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_039_予知能力";
		$GameContiune = 1;
		Reset();
	}

		ch02_039_予知能力();
}


function ch02_039_予知能力()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",500,0,false);

	ClearAll(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("背景１", 2000, 1000, null, true);

//※拓巳視点に戻る
//ＢＧ//拓巳の部屋



	CreateSE("SE05","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE05", 2000, 1000, 0, 1000, null, true);

	CreateSE("SE01","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE01", 0, 500, true);

	Wait(1500);

	CubeRoom3("ルーム", 100, 0);
	Fade("ルーム", 0, 1000, null, true);

	Wait(2000);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Wait(500);
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Wait(100);
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Wait(800);

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Wait(200);
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Wait(200);
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Wait(500);

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Wait(100);
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);


	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900010ta">
「はあ……はあ……っ……はあ……」

息が苦しい。ただＰＣで調べ物をしているだけなのに。
自分の心臓がいつも以上に激しくドクドクと脈打っているのを感じる。

“なにか”に見られている気配は相変わらず消えてくれない。
まだかろうじて振り返ることに耐えているけど、そろそろ限界だった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900020ta">
「なんなんだよっ、お前は！　コソコソしやがって！」

その“なにか”に向かって吠えてみる。
この“なにか”の正体は、まさかあの悪魔女なんじゃないだろうか？

{#TIPS_千里眼 = true;$TIPS_on_千里眼 = true;}
透視とか<FONT incolor="#88abda" outcolor="BLACK">千里眼</FONT>とか、そういう悪魔的な力を使って僕を監視してるのかもしれない……。

{$TIPS_on_千里眼 = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900030ta">
「かはあっ……はあっ……はあっ……」

{	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	Fade("色１", 0, 700, null, true);
	Fade("色１", 500, 0, null, true);}
首筋のチリチリした感覚はますます強くなり、まるで電流が走るかのようなかすかな痛みに変わりつつあった。

さっきから汗がやけにたくさん出る。着ているＴシャツの首もとはそのせいですっかり濡れていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900040ta">
「……くそぅ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("背景１", 300, 0, null, true);
	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	CreateSE("SE03","SE_じん体_動作_足_蹴る_イス");
	SoundPlay("SE02",0,1000,false);
	SoundPlay("SE03",0,1000,false);
	SoundPlay("SE05", 500, 300, true);
	Rotate("ルーム", 300, @0, @-180, @0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
ついにこらえきれなくなり、僕は勢いよく振り返った。
そこにあるのはいつもの自分の部屋でしかなく、変わった様子はどこにも見受けられない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900050ta">
「なんでいないんだよぅ！　誰なんだ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_物音");
	MoveCube("ルーム", 300, @-10, @0, @60, AxlDxl, true);
	SoundPlay("SE02",0,500,false);
	MoveCube("ルーム", 300, @-10, @0, @60, AxlDxl, true);
	MoveCube("ルーム", 300, @-10, @0, @60, AxlDxl, true);
	MoveCube("ルーム", 300, @-10, @0, @50, AxlDxl, true);
	CreateSE("SE03","SE_日常_施錠をたしかめる");
	SoundPlay("SE03",0,700,false);
	Wait(900);
	SoundPlay("SE03",500,0,false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
悲鳴にも似た叫び声を上げながら立ち上がり、扉まで行って施錠されているかを確かめた。
それで少しだけ安心し、シャツの袖で額の汗を拭う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Rotate("ルーム", 1000, @0, @-180, @0, AxlDxl, false);
	MoveCube("ルーム", 2000, @40, @20, @-230, AxlDxl, true);
	Wait(300);
	MoveCube("ルーム", 500, @0, @-20, @0, AxlDxl, true);
	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	SoundPlay("SE02",0,1000,false);
	SoundPlay("SE05", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603001]
ＰＣの前に戻り、改めてモニタを凝視する。
さっきから調べていたのは、予知能力についてだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ＰＣ画面（予知に関する説明）
//以下、ＰＣ画面上のテキスト

//よ‐ち【予知】

//［名］スル　なにが起こるかを前もって知ること。「異変を―する」「―能力」

//未来に起こる出来事についてあらかじめ知ること。経験からくる予測、あるいは情報や統計による予測とは違い、人の本来の知覚を超越した特殊な感覚を指す。科学的には証明されていない。
//その発現の仕方は人によって違い、フラッシュバック現象としてであったり、夢（予知夢）として表れたりする。霊能力者や占い師、古代の巫女にはこの力を有する者がいたと言われているが、一方でこの力を騙って行われる詐欺行為も多い。

//以上、ＰＣ画面上のテキスト
	CreateSE("SE10","SE_日常_PC_マウスくりっく");
	SoundPlay("SE10", 0, 1000, false);
	Wait(500);

	CreateTextureEX("背景３", 100, 0, 40, "cg/bg/bg123_01_3_PC画面予知_a.jpg");
	Fade("背景３", 0, 1000, null, true);
	Delete("ルーム");

	Wait(2000);

	Move("背景３", 5000, @0, @-72, null, false);

	CreateTextureEX("検索画面", 100, 0, 0, "cg/bg/bg011_01_1_検索欄UP_a.jpg");
	CreateSE("SE03","SE_日常_PC_キーたたく_長");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
子供の頃、僕は本気で予知能力の実在を信じていた。
ぶっちゃけて言ってしまえば、今でも少し信じてる。

だから、悪魔女や『将軍』の送ってきた画像が
未来予知写真だって直感的に思ったわけで、
なおさら調べずにはいられなかったんだ。

もしかしたら僕が知らないだけで、
予知能力者は世界中にたくさんいるかもしれないじゃないか。

僕自身、子供の頃にあったバス事故のとき、予知能力に近いことをやって見せた。
それがあるから、一概には否定できないんだ。

ただ、どれだけ調べてもほとんどはオカルトとかマジックとか、
うさんくさそうなものばかりだった。

能力が“存在すること”あるいは“存在しないこと”を科学的に証明したものはまったくない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900060ta">
「ひとつぐらいあってもいいだろっ、はあ、はあ……」

{	Fade("検索画面", 500, 1000, null, false);
	SoundPlay("SE03", 0, 1000, false);}
ますます苛立って、僕はキーボードを乱暴に叩く。
曖昧なままにするのは不安で耐えられなかった。

このまま、来るかどうかはっきり分からない悪魔たちを怯えて待ち続けろって言うのか。

そんなんじゃ、僕の精神が持たない。もちろん“ない”ということが証明されるなら最高なんだけど、とにかく白黒はっきり付けたかった。

こうなったら、＠ちゃんねるのオカルト板をのぞいてみるしかない。

あそこはノイズ――嘘やデマ――が多いけど、逆にビックリするようなすごい情報も転がってる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

//イメージＢＧ//ＰＣ画面（＠ちゃんねる）
	CreateTextureEX("モニター前", 100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Fade("モニター前", 500, 1000, null, true);
	Delete("検索画面");
	Delete("背景３");

	CreateTextureEX("背景１", 100, 0, 0,"cg/bg/bg124_01_3_PC画面掲示板一覧_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
僕は焦る気持ちを抑えつつ、＠ちゃんねるのページを開いた。

オカルト板に飛び、“予知”で検索をかけてみる。

すると――

{	SoundPlay("SE03",500,0,false);
	SoundPlay("SE01", 500, 0, true);
	SoundPlay("SE05", 1000, 500, true);
	Wait(500);
	Fade("背景１", 0, 1000, null, true);}
//TIPS：定義：香具師：画像内の単語より
{#TIPS_香具師 = true;$TIPS_on_香具師 = true;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900070ta">
「ん……？」

やけに多くのスレがヒットした。その数はおよそ３０。
予知能力って＠ちゃんでは流行ってるんだろうか。

ゴクリと息を呑みつつ、スレタイをひとつひとつ確認していく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼【予知予言】ファンタズム総合【ニュージェネ】４３(83)
//日本の未来を適当に予知しまくるスレその６(182)
//ＦＥＳたんに足蹴にされたい香具師の数→(967)
//予知姫ＦＥＳたんに足蹴にされたい香具師の数→(967)
//▼【救世主】ＦＥＳの予知を語る【ファンタズム】(277)
//▼【なにが】ファンタズムアンチスレ１１【予知だ】(431)
//おまいらファンタズムの予知歌はどう思う？(59)
//ファンタズムは予知と称した人殺しバンド　その５(601)
//マジで予知夢を見た奴ちょっと来い(134)
//ＦＥＳの予知・予言を聞きに行くＯＦＦ　ｐａｒｔ３


//※「日本の未来を適当に予知しまくるスレその６」と「マジで予知夢を見た奴ちょっと来い」スレ以外の数字はすべて素数にしてます。
//※香具師＝やし。「奴」のネットスラング。


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900080ta">
「ファンタズム？　ＦＥＳ？」

ヒットしたスレのほとんどに、『ファンタズム』そして『ＦＥＳ』という単語があった。

しかも『ニュージェネ』と同列で並べられているし、予言歌詞とか人殺しとか、不穏な単語が多い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼TIPS：解除：香具師
$TIPS_on_香具師 = false;

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	CreateSE("SE03","SE_日常_PC_キーたたく_長");

	SoundPlay("SE02", 0, 1000, false);
	CreateTextureEX("検索", 100, 0, 0,"cg/bg/bg011_01_1_検索欄UP_a.jpg");
	Fade("検索", 0, 1000, null, true);
	Wait(500);
	SoundPlay("SE03", 0, 1000, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
ググってみると、ファンタズムっていうのは、渋谷を拠点にライブ活動を行っている４人組のゴシックパンクバンドらしい。

インディーズミュージックシーンで話題を独占している程の人気バンドで、ボーカルの女が『ＦＥＳ』って名前みたいだ。

とりあえず予知となんの関係があるのか、
一番上の『【予知予言】ファンタズム総合【ニュージェネ】４３』
をざっと流し読んでみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE03", 500, 0, false);
	Wait(500);


//イメージＢＧ//ＰＣ画面（＠ちゃんねる）
	CreateTexture360("背景９", 2000, center, middle, "SCREEN");
	CreateBoard(0,0);

//おがみ：フォントサイズ修正
//<FONT size="34" incolor="#ff0000"><SPAN value=32>

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text900]
　　　<FONT size="32" incolor="#ff0000"><SPAN value=30>【予知予言】ファンタズム総合【ニュージェネ】４３</SPAN></FONT>
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TitleBoard("【1:538】");
	TypeBoard(500,null);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text901]
<FONT incolor="#0000ff"><U>525</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［sage］：200X/10/7(火) 10:24:27  <FONT incolor="#0000ff"><U>ID:</U></FONT>O983t+Tt
おまいらもちつけ(-_-)
とりあえず日曜日はライブへＧＯだ
そしてＦＥＳ様の黒ミサをあますところなく享受するのだ
そうでなければおまいらも張り付けの刑ｗｗｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//ＴＩＰＳ//黒ミサフラグ
	#TIPS_黒ミサ = true;
	$TIPS_on_黒ミサ = true;

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text902]
<FONT incolor="#0000ff"><U>526</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［sage］：200X/10/7(火) 10:25:27  <FONT incolor="#0000ff"><U>ID:</U></FONT>O983t+Tt
歌詞読んだけど、なんか受け付けなかったなあ
言い回しが遠回しすぎて予言もクソもねえ
でも張り付け殺人勘弁ｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text903]
<FONT incolor="#0000ff"><U>527</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［sage］：200X/10/7(日) 10:40:24  <FONT incolor="#0000ff"><U>ID:</U></FONT>e7dNY8Ks
予知とか予言とか大袈裟過ぎｗｗｗ
ノストラダムスじゃあるまいし、素直に音楽を楽しめや
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

	FadeDelete("背景９", 0, true);
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text904]
<FONT incolor="#0000ff"><U>528</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［sage］：200X/10/7(日) 10:49:59  <FONT incolor="#0000ff"><U>ID:</U></FONT>RiFvdjz1
ＦＥＳの歌詞は嫌いでない
まさにニュージェネ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text905]
<FONT incolor="#0000ff"><U>529</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［sage］：200X/10/7(日) 11:54:33  <FONT incolor="#0000ff"><U>ID:</U></FONT>yTZXOh31
ＦＥＳばっか話題になってて
作曲のＲＹＯスルーされすぎ（´・ω・） ｶﾜｲｿｽ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text906]
<FONT incolor="#0000ff"><U>530</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［age］：200X/10/7(日) 13:17:24  <FONT incolor="#0000ff"><U>ID:</U></FONT>5fW1O7Mv
ＦＥＳたん(;´Д`)ﾊｧﾊｧ 
ＦＥＳたんの詞で生きる意味を知った罠
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//ＴＩＰＳ//儲フラグ
	#TIPS_儲 = true;
	$TIPS_on_儲 = true;

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text907]
<FONT incolor="#0000ff"><U>531</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［sage］：200X/10/7(日) 14:04:05  <FONT incolor="#0000ff"><U>ID:</U></FONT>LGuS9tPg
ＦＥＳ儲きめえｗｗｗｗｗｗｗｗｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text908]
<FONT incolor="#0000ff"><U>532</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［age］：200X/10/7(日) 14:17:38  <FONT incolor="#0000ff"><U>ID:</U></FONT>Zxe5HzC7
それはそれとして、ＦＥＳ様にあのクールな声で
ののしられながらブーツでケツをグリグリ踏まれ
目が飛び出るぐらいの苦痛を与えられたい
だ液を上から顔に垂らされるか垂らされないかという
れつ情と寸止め感に酔いしれてるときに
のどをナイフでゆっくりとかっ切られたい
目障りなのよ、って言われながら息絶えたい
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text909]
<FONT incolor="#0000ff"><U>533</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［sage］：200X/10/7(日) 14:59:09  <FONT incolor="#0000ff"><U>ID:</U></FONT>i05H9ght
ＦＥＳたんは俺の嫁ノシ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text910]
<FONT incolor="#0000ff"><U>534</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［age］：200X/10/7(日) 15:39:40  <FONT incolor="#0000ff"><U>ID:</U></FONT>PxKlJxQv
<FONT incolor="#0000ff"><U><PRE>>>532</PRE></U></FONT>
　
足蹴にされたいスレでやれ
あとＦＥＳは俺の嫁
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text911]
<FONT incolor="#0000ff"><U>535</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［sage］：200X/10/7(日) 15:41:00  <FONT incolor="#0000ff"><U>ID:</U></FONT>RwNCA7t0
ageんなカス
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//ＴＩＰＳ//洗脳フラグ
	#TIPS_洗脳 = true;
	$TIPS_on_洗脳 = true;

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text912]
<FONT incolor="#0000ff"><U>536</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［age］：200X/10/7(日) 16:00:52  <FONT incolor="#0000ff"><U>ID:</U></FONT>otG3PXDG
<FONT incolor="#0000ff"><U><PRE>>>510</PRE></U></FONT>
ニュージェネ予言ってコレのことか？
　
　
//※※３６０以下カット
//杭を打て　杭を打て　闇夜を切り裂き　月光を浴びて
//幾千もの鉄槌は　汝の痛みとなりて　今解き放たれる
//やがて叫びは宙に舞い　夜空は紅く染まるだろう
//十字の杭は力となり　やがて聖域へと辿り着く
//※※３６０以上カット
//■３６０
//※※３６０以下追加
月夜の光が　示された従者よ
この場所へ繋がる　幻の道
叫びはいつしか　沈黙に変わって
落ちてゆく安息　風に手と手を繋いで
//※※３６０以上追加
　
ちなみに漏れはアンチファンタでつ凸(-_-#)
ファン怖いしｗｗｗ
なんかみんな洗脳されてんじゃね？
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text913]
<FONT incolor="#0000ff"><U>537</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［sage］：200X/10/7(日) 16:12:43  <FONT incolor="#0000ff"><U>ID:</U></FONT>EfryPhhD
<FONT incolor="#0000ff"><U><PRE>>>536</PRE></U></FONT>
　
バカおまえ消されるぞｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text914]
<FONT incolor="#0000ff"><U>538</U></FONT>  名前：<FONT incolor="#228b22">名無しの予言者さん</FONT>［sage］：200X/10/7(日) 16:38:01  <FONT incolor="#0000ff"><U>ID:</U></FONT>c4TD+zP9
<FONT incolor="#0000ff"><U><PRE>>>536</PRE></U></FONT>
　
歌詞さらすなボケ
厨はマジ空気嫁
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――


//※200X年にしてます
//>>532は縦読みです。気付く人は気付きます。


//※※３６０以下カット
//【拓巳】
//<voice name="拓巳" class="拓巳" src="voice/ch02/03900090ta">
//「十字の杭……」

//この歌詞は……

//どう見ても僕がこの目で見たあの『張り付け』のことを意味しているとしか思えない。

//しかもこの詞は、２ヶ月前に発表された歌のものだ。
//つまり『張り付け』殺人事件が起こってから書かれたものじゃない……。

//【拓巳】
//<voice name="拓巳" class="拓巳" src="voice/ch02/03900100ta">
//「これが、予知ってこと……？」

//こんなの、ただの偶然の一致じゃないの？
//それとも、ファンタズムもあの悪魔女の手下なのか？
//※※３６０以上カット

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//■３６０
この歌詞は……

解釈次第では、『集団ダイブ』のことを意味していると見えなくもない。

しかもこの詞は、２ヶ月前に発表された歌のものだ。
つまり『集団ダイブ』事件が起こってから書かれたものじゃない……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900100ta">
「これが、予知ってこと……？」

こんなの、ただの偶然の一致じゃないの？
それとも、ファンタズムもあの悪魔女の手下なのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
//■３６０

	Fade("背景１", 0, 0, null, true);
	Fade("検索", 0, 0, null, true);
	CreateTexture360("背景９", 100, center, middle, "SCREEN");

	EndBoard();
	FadeDelete("背景９", 500, true);

//※※３６０以下カット
//さらに詳しくログを読んでいくと、驚くべきことに『ニュージェネ』の３つの事件すべてが事前に歌詞によって“予言”されていたという。

//ただ、＠ちゃんには『集団ダイブ』と『妊娠男』について予言したとされる歌の歌詞は載ってなかった。
//※※３６０以上カット

//▼べー：TIPS：掲示板の長さが不明ですので掲示板消去と同時に致します。可能であれば調整をお願い致します。
//▼TIPS：解除：黒ミサ
	$TIPS_on_黒ミサ = false;
//▼TIPS：解除：儲
	$TIPS_on_儲 = false;
//▼TIPS：解除：洗脳
	$TIPS_on_洗脳 = false;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text907]
//■３６０
さらに詳しくログを読んでいくと、驚くべきことに『ニュージェネ』の３つの事件すべてが事前に歌詞によって“予言”されていたという。

ただ、＠ちゃんには『妊娠男』と『張り付け』について予言したとされる歌の歌詞は載ってなかった。

//■３６０
どうやら、ネットにうｐするなっていう空気が広がってるみたいだ。
どうしても知りたいならライブに行ってアルバム買え、ということらしい。

いずれにせよいまやネット上では、次の『ニュージェネ』事件はどのような殺し方になるのか、ということをファンタズムのこれまでの曲から予測しようという運動が盛んに行われていた。

インディーズで出したアルバムも『ニュージェネ』事件以降、売れているらしくて、

一部のマスコミもこれに注目して“渋谷の若者の間でカルト的な人気を誇るゴスパンバンド”として取り上げる機会も増えているとか。

{	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Fade("背景１", 0, 1000, null, true);}
詞を書いているのは、ＦＥＳ。“フェス”と読むらしい。本名は未公表。

もしかするとこいつがあの悪魔女かもしれない。

だとしたら数ヶ月前に事件を予言できていてもおかしくない。なにしろあの女が犯人なんだから。

{	CreateTextureEX("検索", 100, 0, 0,"cg/bg/bg011_01_1_検索欄UP_a.jpg");
	Fade("検索", 0, 1000, null, true);
	Wait(500);}
イメージ検索をかけてみたけど、ＦＥＳの顔写真はなかなか見つからなかった。ライブの様子を写したものもケータイで撮ったものばかりで、ぶれまくっていて顔の判別がつかない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900110ta">
「はあはあ……くそっ……」

額からにじみ出る汗をＴシャツの裾で拭く。

苛立ちと恐怖と、なにも信じられないっていう気持ちと、なにも見たくないっていう気持ち。

いろんな感情がない交ぜになって、息苦しい。呼吸だってずっと荒いままだ。

{	CreateSE("SE02","SE_日常_PC_キーたたく_中");
	SoundPlay("SE02", 0, 1000, false);}
とにかくＦＥＳの顔を確認したかった。僕は震える指でキーボードを打ち、ファンタズムの公式サイトに飛んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
//イメージＢＧ//ＰＣ画面（ファンタズム公式サイト）
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg125_01_3_PC画面ファンタズム公式_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
表示されたのは、黒を基調とした飾り気のないサイトだった。文字はすべて真紅で統一され、異様というかおどろおどろしい雰囲気を醸し出している。

サイトに存在する情報はほとんどなくて、写真らしいものは一枚もなく、ただ淡々とライブ情報やディスコグラフィが書かれているだけだった。

バンドメンバーのプロフィールや、曲の歌詞情報はいっさいなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900120ta">
「はぁ……はぁ、やっぱり犯人だけあってネットに顔写真が流出しないようにしてるのか……」

用意周到だ……。

ライブの日程を見ると、どうやら隔週ぐらいのペースでやっているみたいだった。次のライブは……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900130ta">
「明後日……」

それを見に行けば、ＦＥＳが悪魔女かどうか確認できる。
でも、確認できたとして、だからなんなんだ？

ＦＥＳを警察に突き出す？
僕を巻き込まないでくれって泣いて懇願する？
十字架でも持って行って悪魔払いのまねごとでもする？

どれも無理だ……。

相手は悪魔女なんだぞ。僕みたいなキモオタじゃ勝てるわけがないよ。

そして悪魔女に負けることは死を意味する。
僕の死体は無惨なオブジェと化し、『ニュージェネ』事件のひとつとしてまとめサイトに載せられる。

{	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Fade("背景１", 0, 1000, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900140ta">
「そ、そんなのいやだぁっ！」

いや、だけどこのままじゃ、『将軍』からの画像データに僕が写っていたことについて分からないままだ。

でもＦＥＳが悪魔女とは無関係なら、逆に助けを求めれば、悪魔女に対抗できるかもしれない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900150ta">
「だけど、やっぱり無理だ……ライブなんて行けるわけがない……」

これまで生きてきて一度も行ったことはない、完全にアウェイエリアなんだよ？

ましてライブハウスって狭いし、暗いし、うるさいし、人だらけだし。想像しただけで吐き気がした。

どうしたらいいんだろう、と頭を抱える。

{	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	Fade("色１", 0, 700, null, true);
	Fade("色１", 500, 0, null, true);}
首筋のチリチリした感覚はまだ続いていて、痺れのような痛みからついには肌が焦げるような痛みへと変わっていた。
そして振り返ってみても、やっぱり誰もいない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900160ta">
「うぅ……もう、やめてよぉ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//黒
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/center.png", true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
目をぎゅっと閉じて、“視線”の感覚が消えてくれるのをひたすら待ち続けた。

この感覚に今後一生悩まされるなんてゴメンだ。
視線だけでいつか殺されるかもしれないし。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900170ta">
「はぁ、はぁ……か、考えろ、拓巳……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03900180ta">
「僕にできることを、考えろ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,500);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);
	MusicStart("SE*", 2000, 0, 0, 1000, null, false);

	ClearAll(2000);
	Wait(3000);

//～～Ｆ・Ｏ

}