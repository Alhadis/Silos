//<continuation number="400">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_203_インターミッション５１";
		$GameContiune = 1;
		Reset();
	}

		ch10_203_インターミッション５１();
}


function ch10_203_インターミッション５１()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション５１

//イメージＢＧ//サイケデリックなイメージ？？
//※七海の混乱をイメージ画像で見せたいですがいいアイデア浮かびません

	IntermissionIn();

	DeleteAll();

	CreateSE("SE100","SE_じん体_心臓_鼓動_LOOP");
	CreateTexture360("360修正", 100, 0, 0, "cg/bg/bg110_01_2_AH隠し廊下_a.jpg");
//	CreateBG(100, 0, 0, 0, "cg/bg/bg110_01_2_AH隠し廊下_a.jpg");
	Stand("bu七海_私服_通常","shock", 200, @+150);

	CreateMovie360("サイケ", 500, Center, Middle, true, false, "dx/mvイメージ02.avi");
	Fade("サイケ", 0, 0, null, false);

//	Request("サイケ", Play);
	Fade("サイケ", 500, 1000, null, true);

//	CreateTexture360("back10", 100, 0, 0, "cg/bg/bg210_01_6_サイケデリックなイメージ_a.jpg");


	IntermissionIn2();

	MusicStart("SE100", 500, 1000, 0, 1000, AxlDxl, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
――記憶が、混濁している。

西條七海は、そう感じた。

兄の言葉を引き金として、七海の心に兆した、兄が２人いる、という感覚。

“２人いるような”ではなく、

“２人いる”

フラッシュバックする、２人の兄の顔。

ひとりは、情けなさそうな。
ひとりは、しわくちゃの。

一方で、自分には兄弟はひとりしかいないという確信もある。

ズレていく。
記憶と、認識が。

なにが現実だったのか。
なにが幻だったのか。

分からなくなって、怖くなって、
頭の中を空っぽにしようとしたら、

ふと、自分自身の声がさざ波のように聞こえてきた。

――ナナが、しっかり、しなくちゃ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE100", 1000, 0, NULL);
//	CreateBG(100, 0, 0, 0, "cg/bg/bg110_01_2_AH隠し廊下_a.jpg");
//	Stand("bu七海_私服_通常","shock", 200, @+150);

	FadeStand("bu七海_私服_通常_shock", 0, true);
	Fade("サイケ", 2000, 0, null, true);
	Delete("サイケ");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
気が付けば、七海は夕焼けが射し込む廊下に立っていた。

鼻につく消毒液の匂い。
目の前には、飾り気のないドア。

その取っ手を、七海は握りしめている。
そして彼女の意志に関係なく、

彼女の手は、ドアを開いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back03", 1000, 0, 0, 1280, 720, "White");
	Fade("back03", 0, 0, null, false);
	Request("back03", AddRender);
	Fade("back03", 500, 1000, null, true);
	DeleteStand("bu七海_私服_通常_shock", 0, true);
//ＳＥ//病室のドア開く
	CreateSE("SE01","SE_日常_びょういんどあ_開く");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg108_01_2_将軍病室_a.jpg");
//おがみ：あとで直す
//	CreateMovie360("回想", 900, Center, Middle, true, false, "dx/mvふりっかー.avi");
//	Request("回想", AddRender);
//	Zoom("回想", 0, 4000, 4000, null, false);
//	Fade("回想", 0, 150, null, false);
	CreateTextureEX("ふりっかー360", 900, center, middle, "cg/bg/ふりっかー.jpg");
	SetAlias("ふりっかー360","ふりっかー360");
	Request("ふりっかー360", AddRender);
	Zoom("ふりっかー360", 0, 3000, 3000, null, true);

	CreateProcess("プロセス１", 1000, 0, 0, "Flicker");
	Request("プロセス１", Start);

	Fade("back04", 0, 1000, null, true);
	FadeDelete("back03", 1000, null);

	BGMPlay360("CH16", 2000, 1000, true);

//以下、回想
//ＢＧ//病室//夕方
//七海は私服

	Wait(1000);

	Stand("st七海_私服_拗ね","angry", 200, @+150);
	FadeStand("st七海_私服_拗ね_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆※本編の１年半前。拓巳１５歳。七海１４歳
//ＶＦ//回想中は回想セリフ
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300010na">
「あー！　おにぃ、またご飯食べないつもりー？」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300020na">
「ちゃんと食べてって、いっつも言ってるじゃん。
でないと元気になんないよ？」

{	Stand("st七海_私服_通常","shock", 200, @+150);
	DeleteStand("st七海_私服_拗ね_angry", 500, false);
	FadeStand("st七海_私服_通常_shock", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300030na">
「あ、もしかしてグリーンピースが入ってるから？」

{	Stand("st七海_私服_通常","angry", 200, @+150);
	FadeStand("st七海_私服_通常_angry", 300, true);
	DeleteStand("st七海_私服_通常_shock", 0, true);}
//◆ため息混じりに
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300040na">
「子供じゃないんだし、いい加減好き嫌いやめたらー？」

{	Stand("st七海_私服_通常","shy", 200, @+150);
	FadeStand("st七海_私服_通常_shy", 300, true);
	DeleteStand("st七海_私服_通常_angry", 0, true);}
//◆ちょっと恥ずかしそうに
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300050na">
「そ、そりゃ、ナナだってグリーンピース嫌いだから、残したくなる気持ちは分かるけど……」

{	Stand("st七海_私服_拗ね","angry", 200, @+150);
	DeleteStand("st七海_私服_通常_shy", 500, false);
	FadeStand("st七海_私服_拗ね_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300060na">
「ちゃんと食べてくんないと、ナナが怒られるんだからねっ。あのこわーい看護師長さんに――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20300070jn">
「七海」

{	Stand("st七海_私服_通常","shock", 200, @+150);
	DeleteStand("st七海_私服_拗ね_angry", 500, false);
	FadeStand("st七海_私服_通常_shock", 500, true);
	Wait(500);}
//◆いきなり声をかけられてビックリ
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300080na">
「な、なに……？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20300090jn">
「今まで辛く当たってゴメン」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300100na">
「……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300110na">
「おにぃが謝るなんて、珍しいじゃん」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20300120jn">
「もう、僕のために無理をする必要はないんだ」

{	Stand("st七海_私服_通常","angry", 200, @+150);
	FadeStand("st七海_私服_通常_angry", 300, true);
	DeleteStand("st七海_私服_通常_shock", 0, true);}
//◆戸惑い
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300130na">
「…………え、っと」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//◆戸惑い
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300140na">
「なに、言ってるの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20300150jn">
「僕は、身を隠さなくちゃならなくなった」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20300160jn">
「だから、お前は――」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20300170jn">
「もう、ここには来なくていい」

{	Stand("st七海_私服_通常","shock", 200, @+150);
	FadeStand("st七海_私服_通常_shock", 300, true);
	DeleteStand("st七海_私服_通常_angry", 0, true);}
//◆ショック
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300180na">
「……っ」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300190na">
「なんのつもり――」

//◆（前のセリフを）遮って悲しそうに
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20300200jn">
「さようなら」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH16", 0, 0, NULL);

	DelusionFakeIn();

//以上、回想
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
//妄想『ＩＮ』なのは、将軍の妄想能力が発動したから、というのを意味してます

	Delete("プロセス１");
	DeleteAll();

//ＢＧ//白
	CreateColor("back03", 300, 0, 0, 1280, 720, "White");
	Request("back03", AddRender);

	DelusionFakeIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
そこで、記憶は途絶えていた。

本当の兄がいること。

重い病に冒されたその兄を、七海は何年もの間、献身的に看病してきたこと。兄を世話するために、自分がしっかりしなくちゃと気を張り続けていたこと。

それらが、今の今まで、１年半もの間、すっぽりと記憶から抜け落ちてしまっていた。

その記憶が、なかったことにされていた。

そして、その代わりに。
兄は健康で。渋谷でひとり暮らしをしていて。

自分はその兄の様子を定期的に見に行くようにと母から頼まれていて、学校帰りにたまに兄の部屋に寄る――

それが、過去から続く当たり前の習慣であり、家族の関係であると思い込んでいた。

なんの疑問も、抱くことはなかった。

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300210na">
「どうして、ナナは……」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300220na">
「忘れちゃってたんだろ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＢＧ//崩壊渋谷・道玄坂//昼・曇り
/*森島ＢＧダミー*/
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");

	FadeDelete("back03", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
生き埋め状態から助け出されて、３０分ほど。
七海は、ようやく本当の兄と再会した。

兄は、路上に横たえられていた。
呼吸はしているが、意識はない。

その姿は、相変わらずしわくちゃで、小さくて、ガリガリで、とても弱々しく見える。
七海がずっと昔から知っている、兄の姿だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 1000, 0, 0, "cg/ev/ev091_01_1_七海と将軍_a.jpg");

	BGMPlay360("CH22", 1000, 1000, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//◆※七海は腕切断のケガのせいですごく弱っています
//◆弱々しく
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300230na">
「こんなの、ひどいよ……」

//◆弱々しく
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300240na">
「ナナは、おにぃに、文句ばっかり、言ってたけど……言ってた、けど……」

返事をしない兄の小さな身体にすがりつくようにして、彼女は涙をこぼした。

//◆泣く
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300250na">
「おにぃのこと、一度だって、忘れたいなんて、思ったことなかった……のに……」

//◆泣く
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300260na">
「勝手だよ……わがまますぎだよぅ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＳＥ//バングルのチェーンが擦れる音
	CreateSE("SE01","SE_衝撃_ガラス_割れる_あやせディそーど");
	MusicStart("SE01", 500, 500, 0, 1000, null, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
その兄の服から、金属が擦れるような音がした。
胸ポケットから、なにかが滑り落ちてくる。

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300270na">
「あ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//雪の結晶をモチーフにした黄色いバングル
	CreateTextureEX("back05", 100, 0, 0, "cg/bg/bg211_01_5_黄色いバングル_a.jpg");
	Fade("back05", 500, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
それは、ずっと七海が探していたもの。
右手を失ったときに、一緒に手許から離れてしまったもの。

雪の結晶をかたどった、安っぽいバングル。

困惑し、実の兄の顔をじっと見つめる。
けれど、皺に埋もれた目は閉じられたまま。

七海はバングルを左手で拾い上げた。
覚えのある手触り。

“兄”からもらった、初めてのプレゼント。
これは、七海にとっての宝物だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
七海は視線を上げ、もうひとりの兄の姿を無意識に探していた。

彼は、長い剣を手にして、七海に背中を向けていた。

歩き出している。
この場を、去ろうとしている。
それが、七海には直感として分かった。

彼は自分になにも言わずに行ってしまうつもりなのだろうかと、寂しくなる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//ＶＦ
//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20300280jn">
「行っておいで」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300290na">
「……？」

七海は眉をひそめ、そっと周囲を見回した。

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300300na">
「今、声が……」

それは記憶の中にある、兄の声だった。
意識のないはずの兄からの、心に届いてくる声。

//ＶＦ
//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20300310jn">
「彼は、僕と一心同体。もうひとりの、おにぃなんだから」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300320na">
「…………」

それが、兄の発した声だったのか、あるいはただの幻聴だったのかは、七海には分からない。
ただ、それでも――

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300330na">
「うん、分かった……」

横たわる兄に向かってつぶやいて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/ev/ev092_01_1_拓巳振り返り_a.jpg");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604005]
立ち上がった七海は、もうひとりの兄の背中へと、歩み寄る。
身体に力は入らない。

もう何日も、真っ暗な部屋で、不気味なオブジェに張り付けにされ、ひどい苦痛を味わわされた。

何度死のうと思ったか、分からない。

特に右手は、大きなノミを骨に打ち込まれ削られているような、強い痛みが延々と続いている。

そこに自分の手がないという感覚と、手があるという幻覚とで混乱し、おかしくなりそうだった。

精神的にも、肉体的にも、疲れ切っていた。

油断すれば、その場にしゃがみ込んでしまい、もう一歩も歩けなくなってしまうだろう。

だから七海は、手を伸ばすのにも必死の努力をしなければならなかった。

その努力をしてでも、もうひとりの兄を引き止めたかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/ev/ev092_02_1_拓巳振り返り_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300340na">
「……ま……って……」

かろうじて声を絞り出すと、それに彼は気付いてくれた。立ち止まり、七海へと振り返る。

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300350na">
「…………」

引き止めることには成功したものの、七海はどう声をかけるべきか迷う。

この人は兄じゃないという現実。
この人は兄だっていう思い込み。

そのふたつの感覚がぐちゃぐちゃに入り混じり、おいそれとは心の中で整理できない。

ただ――

七海が左手で握りしめている、バングル。
冷たい手触りだけど、心は温かくなる、彼からの贈り物。

このバングルの存在が、七海と、彼を、繋いでくれている。そんな気がした。

答えは、それだけで、よかった。
迷いは、すぐに消えていた。

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300360na">
「おにぃは……ホントのおにぃじゃないかもしれないけど……」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300370na">
「頼りにならなくて……オタクさんで……アニメキャラの、お人形さんばっかり、集めてて……」

//◆元気ない
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300380na">
「口が悪くて……愛想もなくて……
意地悪なこと、ばっかり言うけど――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/ev/ev092_03_1_拓巳振り返り_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//◆泣き笑い
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20300390na">
「おにぃも、ナナのおにぃだよ」

泣きそうになるのをぐっとこらえて、七海は精一杯微笑んだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20300400ta">
「……あ、え、ありがとう、七海」

もうひとりの兄の、照れくさそうな表情を見て。
安心した途端、七海の意識はゆっくりと遠のいていった――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH22", 2500, 0, null);

	ClearAll(2000);

	Wait(1000);

//～～Ｆ・Ｏ
//■インターミッション５１終了
}

function Flicker()
{
	while(1)
	{

	Wait(100);

	Fade("@ふりっかー360", 100, 150, null, true);
	Fade("@ふりっかー360", 100, 50, null, true);

	Wait(200);
	Fade("@ふりっかー360", 50, 200, null, true);
	Fade("@ふりっかー360", 100, 50, null, true);
	Fade("@ふりっかー360", 80, 150, null, true);
	Fade("@ふりっかー360", 100, 80, null, true);
	Fade("@ふりっかー360", 50, 150, null, true);
	Fade("@ふりっかー360", 100, 50, null, true);
	Fade("@ふりっかー360", 50, 100, null, true);
	Fade("@ふりっかー360", 100, 50, null, true);

	Wait(500);

	Fade("@ふりっかー360", 50, 150, null, true);
	Fade("@ふりっかー360", 100, 50, null, true);
	Fade("@ふりっかー360", 80, 150, null, true);
	Fade("@ふりっかー360", 100, 80, null, true);
	Fade("@ふりっかー360", 50, 100, null, true);
	Fade("@ふりっかー360", 100, 50, null, true);

	}

}
