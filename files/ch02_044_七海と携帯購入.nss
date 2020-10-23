//<continuation number="630">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_044_七海と携帯購入";
		$GameContiune = 1;
		Reset();
	}

		ch02_044_七海と携帯購入();
}


function ch02_044_七海と携帯購入()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateSE("SE02","SE_自然_動物_カラス_鳴き声_LOOP");
	MusicStart("SE02", 2000, 500, 0, 1000, null, true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg126_01_2_夕焼け空_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/light6.png", true);

	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 2000, 200, 0, 1000, null, true);

//イメージＢＧ//夕焼け空
//おがみ：あとで差し替え

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
結局、七海はあれだけ悩んでいたのが嘘のように
あっさりと機種を決めてしまった。

１時間ほどで契約やらいろんな手続きやらも終わり、ケータイ本体を手に入れた僕はさっさと帰ろうとしたけど、七海に止められた。

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400010na">
「ナナが初期設定してあげるから、マクディ寄ろう」

僕の意志は無視され、問答無用で襟首をつかまれて強引に最寄りのマクディまで連れて行かれる羽目になった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE02", 2000, 0, 0, 1000, null, true);

//ＢＧ//マクディ店内
//おがみ：適当に教室になってる、後で差し替え

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg077_01_1_渋谷マクディ店内_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);


	MusicStart("SE01", 1000, 0, 0, 1000, null, true);
	Wait(1000);
	CreateSE("SE01","SE_はいけい_まくでぃ_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	Wait(500);


	Stand("bu七海_制服_通常","normal", 200, @150);
	FadeStand("bu七海_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400020na">
「どうせおにぃ、ケータイ持って帰っても電源入れずにほったらかしにするに決まってるんだから」

{	Stand("bu七海_制服_通常","smile", 200, @150);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400030na">
「ナナがちゃんと使えるようにしたげる」

くそぅ、どこまで僕を縛り付ければ気が済むつもりだ……。
しかもよりによって、マクディとは……。

{	DeleteStand("bu七海_制服_通常_smile", 500, true);}
渋谷のマクディ店内はまさにカオスだ。

とにかく人が多いし、話し声がうるさい。
しかもこのＤＱＮ率の高さは異常。

すぐ隣の席にいるのは、子供連れのＤＱＮっぽい３人の茶髪母親集団。

奇声を上げて店内を走り回っている自分の子供――３人揃って髪に赤いメッシュが入っているイタいガキンチョども――を放置して、お喋りに没頭してる。

別の席では、これまたＤＱＮっぽい高校生男子が４人集まって、ギャハギャハと大声で笑っている。

茶髪にルーズソックスの女子高生２人組は向かい合わせに座って、２人ともケータイとにらめっこ中だ。会話はしていない。

その隣では、いかにも会社サボってますという感じで、中年サラリーマンがテーブルに突っ伏していびきをかいている。

少し離れた席はさらに異様で、ランドセルを床に置いた小学生らしきちびっ子男女５人が、足をブラブラさせながら楽しそうに会話をしていた。
合コンか。小学生のくせに合コンか！

とにかく、見渡す限り、関わり合いになりたくなさそうな連中ばかりだ。

こんな場所に来て、七海はよく平然としていられるなあ。僕は人の多さのせいで頭痛と吐き気がますますひどくなってきてるって言うのに……。

っていうか、なにが楽しくて妹と２人でマクディに来なくちゃいけないんだよ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_けい帯操作");
	SoundPlay("SE02", 0, 400, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400040na">
//※『着メロ』は商標登録されているのでもしかすると使用は避けました
「ねーねー、着信メロディはどうする？　なんか希望ある？」

七海は僕のケータイをいじりながら、こっちを見ずに聞いてくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400050ta">
「ア、アニソン……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE02", 200, 0, false);
	Stand("bu七海_制服_拗ね","angry", 200, @150);
	FadeStand("bu七海_制服_拗ね_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//◆きゃっか～＝却下
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400060na">
「きゃっか～」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400070na">
「そんなだからおにぃはオタクさんなんだよ」

き、希望を聞いてきたのはそっちだろ！
そもそも僕のケータイなんだから、僕の好きにさせろよ！

{	Stand("bu七海_制服_通常","normal", 200, @150);
	FadeStand("bu七海_制服_通常_normal", 500, false);
	DeleteStand("bu七海_制服_拗ね_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400080na">
「あ、そだ。大村カレラの新曲にしたら？　あれ、すごくいい曲だよ。最近のナナのお気に入り」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400090ta">
「そ、それこそ、却下だ……」

{	Stand("bu七海_制服_通常","smile", 200, @150);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, false);}
//大村カレラ＝架空の歌手
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400100na">
「んー、まあ、おにぃに大村カレラは似合わないか、あはは」

{	DeleteStand("bu七海_制服_通常_smile", 500, false);}
兄に対して気遣いの欠片もないことを言ってのけて、七海はポテトをひとつかじった。

ちなみにこいつは、夕食前だって言うのにフィッシュバーガーセットを頼んでいる。しかも代金は僕持ちだ。こっちは具合が悪くて食欲すら失せてるっていうのに、ふざけてる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_手_らんどせる漁る");

	Stand("bu七海_制服_通常","normal", 200, @150);
	FadeStand("bu七海_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400110na">
「あ、そうそう、それとねぇ――」

{	DeleteStand("bu七海_制服_通常_normal", 500, false);}
七海はなぜか自分のバッグを膝の上に乗せ、中身を漁り始めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//◆バッグの中をしばらく探して、それから目当ての物を発見
	SoundPlay("SE02", 200, 1000, false);
	Wait(1500);
	SoundPlay("SE02", 500, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601104]
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400120na">
「ん～、お、あったあった」

得意げに取り出したのは……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//『ギョロリゲロカエルん』
//※ゲロカエルんの目玉が普通のものより大きく、半分飛び出している
	MusicStart("SE01", 2000, 0, 0, 1000, null, false);
	Wait(500);
	CreateTexture360("背景１", 300, 0, 0, "cg/bg/bg127_01_2_ギョロリゲロカエルん_a.jpg");
	Wait(1000);

	BGMPlay360("CH05",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text104]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400130ta">
「ゲ、ゲロカエルん…………の、不良品？」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400140na">
「不良品じゃないよ」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400150na">
「先週出た、ギョロリゲロカエルん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400160ta">
「はあ……？」

//◆勝ち誇って
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400170na">
「知らないんだ～？　やっぱ遅れてるなぁ、おにぃは」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400180na">
「ゲロカエルんって、毎週金曜日に新作が発売されてるんだよ」

//※ゲロカエルんが毎週新作を発売しているのは伏線です
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400190na">
「もう全部で１２種類ぐらいあるんだから」

マジでか……。
毎週発売って、需要はあるのかな？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//※禁則処理08/11/17
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400200na">
「ナナがケータイに付けてるのは最初に出た、
普通のゲロカエルんでしょ」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400210na">
「で、次がデブっちょゲロカエルんで、その次がカクカクゲロカエルん」

七海はすらすらと、色々なゲロカエルんの名前を暗唱していく。

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400220na">
「第４弾がのっぺらゲロカエルんで、第５弾が輝くゲロカエルん」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400230na">
「第６弾が一番人気があって、猫ゲロカエルんって言うの」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400240na">
「その後がユーレイゲロカエルん、眠るゲロカエルん、燃えるゲロカエルん、ゾンビゲロカエルん、酔っぱらいゲロカエルん」

全部覚えてるのかよ……。
っていうか、もしかして……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400250ta">
「お、おま、コンプリートしてる……の？」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400260na">
「もっちろんだよ！　全部集めなきゃ意味ないもん」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400270na">
「毎週、買うのに行列ができるんだからね！」

こ、こんな手抜き商品にか……。
はっきり言って、僕の方が絶対うまくデザインできそうだよ。

っていうか、こいつはなんでいきなり、ゲロカエルんについてレクチャーを始めたんだろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：08/11/17ここから先、七海口パクしません
	Stand("bu七海_制服_通常","smile", 200, @150);
	FadeStand("bu七海_制服_通常_smile", 0, true);
	Fade("背景１", 500, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400280na">
「というわけで、このギョロリゲロカエルん、あげる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400290ta">
「え……？　な、なんで……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400300na">
「このストラップをケータイに付ければ、少しは女子から“お、やるな”っていう目で見てもらえるから」

そう言うと、七海は勝手に僕のケータイにストラップをつけ始める。
い、いらねええ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400310ta">
「コ、コンプしなきゃ、意味、ないんだろ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400320ta">
「ぼ、僕が、ソレもらったら、お前、揃わないぞ……」

{	Stand("bu七海_制服_通常","normal", 200, @150);
	FadeStand("bu七海_制服_通常_normal", 300, true);
	DeleteStand("bu七海_制服_通常_smile", 300, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400330na">
「心配しなくてもだいじょぶ。ふたつ買ったもん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400340ta">
「ま、毎回ふたつ、買ってるのか……」

こいつの美的センスを本気で疑うよ……。

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400350na">
「今回だけだよ。おにぃのケータイ用に余分に買ったの」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400360ta">
「……わざわざ？」

{	Stand("bu七海_制服_通常","smile", 200, @150);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400370na">
「わざわざ」

ストラップを付け終わった七海は満足そうにうなずいて、ジュースのストローを口に含む。
でもすぐに、ハッとして僕の方に身を乗り出してきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_じん体_動作_のぞく");

	Stand("bu七海_制服_通常","shy", 200, @150);
	FadeStand("bu七海_制服_通常_shy", 300, true);
	DeleteStand("bu七海_制服_通常_smile", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400380na">
「別に、並んだのはおにぃのためじゃないよっ」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400390na">
「あくまでついでなんだからっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400400ta">
「……い、いらない」

{	Stand("bu七海_制服_通常","shock", 200, @150);
	FadeStand("bu七海_制服_通常_shock", 300, true);
	DeleteStand("bu七海_制服_通常_shy", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400410na">
「はあっ？」

身を乗り出したまま、七海が目をひん剥いた。
今にも僕につかみかかってきそうな勢いだ。

{	Stand("bu七海_制服_通常","angry", 200, @150);
	FadeStand("bu七海_制服_通常_angry", 300, true);
	DeleteStand("bu七海_制服_通常_shock", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400420na">
「いらない、って。ナナがわざわざ買ってきてあげたのに！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400430ta">
「つ、ついで、だったんだろ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400440ta">
「っていうか、僕、ゲロカエルんとか、興味ないし……
　む、むしろ、キモいし……」

//◆ムッとする
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400450na">
「…………」

{	Stand("bu七海_制服_通常","pride", 200, @150);
	FadeStand("bu七海_制服_通常_pride", 300, true);
	DeleteStand("bu七海_制服_通常_angry", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400460na">
「だからおにぃは女子にモテないんだよ」

//おがみ：袋ガサガサ（ポテト食ってる音）仮組み
{	SoundPlay("SE05", 200, 1000, false);
	DeleteStand("bu七海_制服_通常_pride", 500, true);}
てっきり手でも出してくるかと思ったけど、意外にも七海は落ち着いて席に座り直し、ふてくされたようにポテトをかじり出しただけだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","angry", 200, @150);
	FadeStand("bu七海_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400470na">
「でも、抵抗しても無駄だからね。
ギョロリゲロカエルん、もうくっつけちゃったもん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400480ta">
「…………」

主導権はあくまで自分にある、とでも言いたげな態度だな……。
まあ、ケータイについては悔しいが
七海の方がよく知ってるのは事実だしな……。

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400490na">
「もし勝手に外したら、毎週並んでもらうの刑だからね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400500ta">
「な、並ぶって……なにに……？」

{	Stand("bu七海_制服_通常","pride", 200, @150);
	FadeStand("bu七海_制服_通常_pride", 300, true);
	DeleteStand("bu七海_制服_通常_angry", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400510na">
「決まってんじゃん。新作ゲロカエルんを買うための行列。２時間待ちとか普通だから」

{	DeleteStand("bu七海_制服_通常_pride", 500, false);}
無茶苦茶だ……。
どうして僕は妹に脅されなくちゃならないんだ。

//おがみ：携帯操作音ダミー
{	CreateSE("SE02","SE_日常_けい帯操作");
	SoundPlay("SE02", 200, 500, true);}
七海はそれからしばらく、口を利かずに黙々と僕のケータイをいじり続けた。
僕としてはやかましくないからその方がありがたい。

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400520na">
「なんだか、変な気分だなあ」

次に口を開いたときには、七海からはさっきまでの不機嫌さが消えていた。

こいつって一晩寝るどころか、ほんの数分でイヤなことやむかつくことを忘れちゃうのかもしれない。

なんというお手軽な性格。ある意味でうらやましい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE02", 200, 0, false);

	Stand("bu七海_制服_通常","shock", 200, @150);
	FadeStand("bu七海_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text109]
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400530na">
「うん、やっぱ変だよ」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400540na">
「おにぃとこうして２人で出かけるのって、久しぶりな気がするもん」

//※思い出せないのではなくそもそもそんな事実はない
{	Stand("bu七海_制服_通常","normal", 200, @150);
	FadeStand("bu七海_制服_通常_normal", 300, true);
	DeleteStand("bu七海_制服_通常_shock", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400550na">
「いつ以来かなぁ。よく思い出せないや」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400560na">
「おにぃはいっつも部屋にこもって、アニメ見てるかゲームしてるかだもんね」

//◆嬉しそうに
{	Stand("bu七海_制服_通常","smile", 200, @150);
	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_normal", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400570na">
「ま、たまにはこういうのもいいかな。新鮮で」

//◆言葉とは裏腹に嬉しそうに
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400580na">
「さすがに毎日はナナもイヤだけど」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_制服_通常_smile", 500, true);

	Wait(500);

	CreateTextureEX("背景１", 150, 0, 0, "cg/ev/ev026_01_2_七海ハンバーガー_a.jpg");
	CreateSE("SE02","SE_じん体_動作_すかーと裾まくり");

	SoundPlay("SE02", 0, 1000, false);
	Fade("背景１", 1000, 1000, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
七海は僕のケータイをテーブルに置くと、代わりにフィッシュバーガーを手に取った。
嬉しそうに包みを開け、豪快にかぶりつく。

そう言えばこいつって、ここのフィッシュバーガーが好物だとか前に言っていたような気がする。

//◆ボソッと
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400590ta">
「……せいぜい太るがいいさ、ふひひ」

{	SetVolume360("CH*", 100, 1, null);
	CreateSE("SE01","SE_はいけい_まくでぃ_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);}
と、七海の動きがピタリと止まった。

僕の方を恨めしげに見つめてくる。

そして少し躊躇してから、食べかけのフィッシュバーガーをおずおずと差し出してきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 1000, null);

	CreateTextureEX("背景３", 150, 0, 0, "cg/ev/ev026_02_2_七海ハンバーガー_a.jpg");
	Fade("背景３", 500, 1000, null, true);
	Delete("背景１");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400600na">
「……半分食べる？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04400610ta">
「も、もう手遅れだよ、ふひひ……」

{	Stand("bu七海_制服_通常","pride", 120, @150);
	FadeStand("bu七海_制服_通常_pride", 0, true);
	Fade("背景３", 500, 0, null, true);
	Delete("背景３");}
//◆ムッとする
//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400620na">
「んむぅ……！」

//【七海】
<voice name="七海" class="七海" src="voice/ch02/04400630na">
「そういうこと言うと女子に嫌われるって、
　覚えといた方がいいよ、バカおにぃ！」

{	DeleteStand("bu七海_制服_通常_pride", 500, true);}
結局、七海はフィッシュバーガーをひとりで完食した。
この食いしん坊め！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume360("CH*", 2000, 0, null);
	SetVolume("SE*", 2000, 0, null);

	CreateColor("フラッシュ", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("フラッシュ", 1000, 0, 1000, 100, null, "cg/data/light.png", true);

	ClearAll(1000);

	Wait(1000);

//～～Ｆ・Ｏ


}
