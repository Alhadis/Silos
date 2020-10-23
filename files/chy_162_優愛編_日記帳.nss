//<continuation number="1360">

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_162_優愛編_日記帳";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_162_優愛編_日記帳();
}


function chy_162_優愛編_日記帳()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★優愛編
//ＢＧ//拓巳の部屋
	CreateTexture360("back01", 200, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 2000, 1000, null, true);

	CreateSE("SE3601","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE3601",2000,400,0,1000,null,true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
……眠れなかった。

数時間、目を閉じて寝ようと努力したけど、ダメだった。

優愛が戻ってこないかと、扉の方ばかり気にしてしまう。

強い風でも吹くのか、たまに扉がかすかに揺れて音を立てると、それに反応して顔を上げて、優愛が戻ってくるのを期待してしまう。

でも、いまだに優愛は戻ってきていない。
このコンテナハウスに、僕は縛られて１人きりだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture("back02", 195, center, middle, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("back01", 500, 0, null, true);
	Delete("back01");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
あまりにも遅いから、試しに腕の拘束を解くことに挑戦してみた。

{	CreateSE("SE01","SE_じん体_動作_手_ぱいぷいす引きずる");
	MusicStart("SE01",0,1000,0,1000,null,false);}
僕の腕をベッドの足に縛り付けているのは、ナイロン製の紐だ。力をこめれば千切れるかもしれない。腕に思い切り力を込める。

//◆力を込めている。うなる
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100010ta">
「ぐぅぅぅぅぅ、うぁぁぁぁぁ――――っ！」

//◆力尽きる
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100020ta">
「――っ、かはぁっ、はあ、はあ」

ダメだ、全然びくともしない。
というか、僕の力が弱いだけなのかも……。

そりゃ、毎日ゲームとネットしかしてないひ弱なキモオタじゃ、ハリウッド映画の主人公みたいにはいかないよ……。

力で強引に千切るのは無理だ。
他に方法はないか、考えた。

ナイフか、あるいはナイフの代わりになるようなものがあればいいんだろうけど、残念ながら見当たらない。

あるのは雑誌とか、マンガとか、ＣＤとか、コンビニ弁当の容器とか、そんなものばかり。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100030ta">
「ダメだ……」

僕は、ナイロンの紐一本すら、自力で切ることのできない、どうしようもない男なんだ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100040ta">
「ゆ、優愛は、も、戻って、くるよね……」

気付けば、自分に言い聞かせるかのように、そう声に出していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st星来_覚醒後_通常","shock", 200, @-150);
	FadeStand("st星来_覚醒後_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/01100050se">
「ねえねえ、タッキー」

//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/01100060se">
「もしかしてさ、見捨てられたんじゃない？」

見捨てられた……？
優愛が、僕を放置して出て行ったってこと？
もう、戻ってこないってこと？

戻ってきてもらわないと、困る。
こうして縛り付けられたまま、１人でどうしろって言うんだ。
僕を監禁したなら、最後まで責任持つべきだろ、常識的に考えて。

見捨てられた、なんて、考えすぎだ。

優愛はきっと戻ってくる。
まだ『将軍』の正体を暴いていないんだから、あきらめるはずがない。
優愛は僕を見捨てたりしない。

大丈夫だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st星来_覚醒後_通常","sad", 200, @-150);
	FadeStand("st星来_覚醒後_通常_sad", 300, true);
	DeleteStand("st星来_覚醒後_通常_shock", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//ＴＩＰＳ：ストックホルム症候群//内容は後日作成
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/01100070se">
「知ってる？　そういうのってさ、ストックホルム症候群って言うんよ」

もちろんその言葉の意味ぐらい僕は知ってる。

でも違う。僕は、そんなんじゃない。
別に、優愛に依存なんかしていない。

あんなメンヘラ女に、誰が親近感を感じたりするもんか――。

{	Stand("st星来_覚醒後_通常","shock", 200, @-150);
	FadeStand("st星来_覚醒後_通常_shock", 300, true);
	DeleteStand("st星来_覚醒後_通常_sad", 0, true);}
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/01100080se">
「“僕もつい最近、七海のことがあったから、優愛の気持ちは分からなくはない”とかって、脳内で妄想してなかったっけ？」

//◆図星を突かれてブレス
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100090ta">
「……っ」

僕は、自分に嘘をついている？
無理矢理、優愛は安全だって思い込もうとしている？

{#TIPS_ストックホルム症候群 = true;$TIPS_on_ストックホルム症候群 = true;}
……そうかもしれない。
<FONT incolor="#88abda" outcolor="BLACK">ストックホルム症候群</FONT>は、人が自らの生存のために自分をだます、心理的作用だから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	DeleteStand("st星来_覚醒後_通常_shock", 500, true);

//▼TIPS：解除：ストックホルム症候群
$TIPS_on_ストックホルム症候群 = false;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
でも、嘘だったらなんだって言うんだ？
今のこの状況じゃ、優愛を頼るしかないじゃないか。

梨深もバックれたし、七海だってここ最近は様子を見に来ない。両親だって、七海づてに僕のこと心配してるってよく聞かされるけど、そう言ってる割にここに来た試しがない。

他にこのコンテナハウスに僕が住んでいるのを知ってるのは、優愛ぐらいだ。

頼るのは、もう、優愛だけ。
この嘘は、やむを得ない嘘だ。
自分が助かるための。

僕は死にたくないし、優愛にひどい目に遭わされたくもないし、優愛に力尽くで抵抗する勇気もない。

だから、優愛にすがるんだ。
無抵抗を貫いて、優愛が分かってくれるのを待つんだ。
それが、無力なキモオタである僕が取れる、唯一の方法なんだ。

僕は優愛を信じる。
信じると、自分に嘘をつく。
そして穏便にこの状況から抜け出す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st星来_覚醒後_通常","angry", 200, @-150);
	FadeStand("st星来_覚醒後_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/01100100se">
「あんなストーカー眼鏡女を信じちゃダメだよぉ！
タッキー、ゆとり過ぎ！」

{	DeleteStand("st星来_覚醒後_通常_angry", 300, true);}
今回ばっかりは、星来たんの意見でも聞けないよ。

だから、早く戻ってきてくれ、優愛……。
戻ってきてくれるよね……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//コンテナハウスの扉が勢いよく開く

	SetVolume("SE3601", 200, 0, null);

	CreateSE("SE01","SE_日常_部屋の扉開く_勢いよく");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(1000);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_01_2_拓巳部屋_a.jpg");
	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Stand("st優愛_制服_冷酷","cool", 190, @+150);
	FadeStand("st優愛_制服_冷酷_cool", 0, true);
	Delete("back02");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
それはいきなりだった。

なんの前触れもなく、扉が勢いよく開く。
突然の音に僕は身をすくませてしまう。

外に見えるのは、夕陽に染まった空。
それを遮るように、優愛が入ってきた。

彼女の姿を見て、僕は心の底からホッとしていた。
見捨てられたわけじゃなかったって分かって、嬉しくて、目頭が熱くなる。

自分の流されやすさや、調子の良さに嫌悪感を抱きつつも、それ以上に安心した気持ちの方が強くて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100110ta">
「お、おか、えり……」

僕は優愛に依存するしかないから。
思わず、そんな間抜けなことまで言ってしまっていて。

でも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_足_蹴る_イス");
	CreateSE("SE02","SE_日常_拷問部屋_施錠");
	CreateSE("SE03","SE_じん体_掴む");

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Fade("背景１", 200, 0, null, true);
	Shake("背景１", 200, 3, 3, 0, 0, 500, null, false);

	DeleteStand("st優愛_制服_冷酷_cool", 300, true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

	Stand("bu優愛_制服_冷酷","cool", 500, @+150);

	MusicStart("SE01",0,1000,0,1000,null,false);
	MusicStart("SE03",0,1000,0,1000,null,false);

	Shake("背景１", 500, 5, 10, 0, 0, 500, null, false);
	FadeStand("bu優愛_制服_冷酷_cool", 100, true);


	Wait(500);
	BGMPlay360("CH06", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//◆ヤンデル口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100120yu">
「あなた、邪魔だわ。西條くん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100130ta">
「え……？」

優愛は大股に歩み寄ってくると、しゃがみ込んで目線の高さを僕と合わせ、それから――

僕の髪をつかみ、強く引っ張ってきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("痛い", 1000, 0, 0, 1280, 720, "Red");
	Fade("痛い", 0, 0, null, true);

	CreateSE("SE01","SE_擬音_服がやぶれる");
	MusicStart("SE01",0,600,0,1000,null,false);

	Shake("背景１", 500, 5, 5, 0, 0, 500, null, false);
	Fade("痛い", 100, 800, null, true);
	FadeDelete("痛い", 100,. true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100140ta">
「うぐ……！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100150yu">
「邪魔なの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100160yu">
「あなたがいなければ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100170yu">
「『将軍』は出てくるはずなのに」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100180yu">
「なんでいるの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100190yu">
「自重してよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100200yu">
「少し引っ込んでよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100210yu">
「あなたと話しても意味ないの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100220yu">
「わたしはあなたと話したいんじゃない」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100230yu">
「出して」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100240yu">
「『将軍』を出しなさいよ……！」

優愛の様子がおかしい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
焦っているのか？
『将軍』が出てこないから？
それで強引な手段に出ようっていうのか？

これじゃ僕の予想と違う。
優愛は手荒な真似はしないって信じたのに。
この女は、また僕の信頼を裏切るのか！？

――裏切られたって思っているのは僕だけだ。

現実を思い知る。
僕が勝手に優愛を信頼していただけ。
優愛は“信頼しろ”とは一言も言ってない。

僕が、甘かったって言うのか？
僕がキモオタで引きこもりだから？
リアルの人間関係に慣れていないから、騙されて当然ってこと？

だとしたら、やっぱり僕は、三次元なんて、いらない。
二次元だけに、引きこもるよ……。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100250yu">
「見て」

優愛が、僕の顔の前になにかを突きつけてくる。
それはノートのようだった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100260yu">
「妹の日記です」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100270yu">
「家に戻って取ってきたんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100280yu">
「これを読んで、あなたは知るべきです。妹は、美愛ちゃんは、『集団ダイブ』が起きるもっと前から、あなたに――いえ、『将軍』に狙われていたんです」

前から……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100290yu">
「ストーカーされていたんですよ。だから『集団ダイブ』は、５人を殺すのが目的だったんじゃない。他の４人は巻き添え。狙いは美愛ちゃん１人だった」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100300yu">
「そうでしょう？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100310yu">
「そうよね、『将軍』」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100320yu">
「答えて」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100330yu">
「出てきて、答えなさい……！」

優愛の声が、少しずつヒステリックになりつつある。
僕はまた恐怖を覚え、胸がドキドキして。
身震いする。

それでも、優愛の言い分をとうてい認めることはできない。
そんなのは妄想だし、ねつ造だ。

僕は優愛の妹になんか、会ったこともない。

だから必死で、首を左右に振ろうとした。
けれど髪を引っ張られている痛みのせいで、うまくできない。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100340yu">
「まだ出てこないつもりですか？」

{	DeleteStand("bu優愛_制服_冷酷_cool", 500, true);}
優愛の顔が近づいてくる。
耳元でささやかれる。

そして、日記をさらに僕の顔に近づけてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//美愛の日記（表紙）
//表紙には“Ｙｕａ’ｓ　ｄｉａｒｙ”とキレイな字で書かれてある。「美愛の日記」なのに“Ｙｕａ’ｓ　ｄｉａｒｙ”
	CreateTexture360("日記１", 500, center, middle, "cg/bg/bg236_01_6_chn美愛の日記_a.jpg");
	Fade("日記１", 0, 0, null, true);
	Fade("日記１", 1000, 1000, null, true);

	Delete("back*");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100350yu">
「見て。美愛ちゃんの苦しみを、見なさい」

無理矢理僕の顔を上に向かせ。
優愛は、日記を持ったままその手で器用にページをめくった。

そこに書かれてあるものを見て、
僕の背筋は凍り付いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_衝撃_衝撃音02");


//イメージＢＧ//美愛の日記
//“その目だれの目？”とびっしり書かれている
	CreateTexture360("日記２", 500, center, middle, "cg/bg/bg236_02_6_chn美愛の日記内容_a.jpg");
	Fade("日記２", 0, 0, null, true);

	MusicStart("SE01",0,1000,0,1000,null,false);
	Fade("日記２", 0, 1000, null, true);

	Delete("日記１");

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
なんだ、これ……。
なんだよ、これは……。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100360yu">
「日記の最後のページ。美愛が最後に書き残したもの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100370yu">
「“その目だれの目？”」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100380yu">
「日付は――」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100390yu">
「９月６日」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100400yu">
「『集団ダイブ』で美愛が殺された、前日です」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100410ta">
「し、『将軍』だ！
　あ、あいつに、し、思考盗撮されてたんだっ……！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100420yu">
「思考盗撮ってなに？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100430yu">
「違うでしょ？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100440yu">
「違うわ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100450yu">
「ストーカーされていたんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100460yu">
「『将軍』に」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100470yu">
「あなたに」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100480ta">
「ぼ、僕は、『将軍』じゃ……！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100490yu">
「あなたの中にいる『将軍』にです」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100500ta">
「だ、だから、言ってるじゃないかっ！
　『将軍』は、ほ、他にいるんだ！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100510yu">
「『将軍』は西條拓巳です」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100520yu">
「言い逃れしないで」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100530yu">
「“その目だれの目？”という、あなたが昔書いた作文が、その証拠です」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100540yu">
「他にもいくつもの状況証拠がある」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100550yu">
「あなたしか考えられないの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100560yu">
「考えられないのよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100570yu">
「あなたじゃなきゃおかしい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100580yu">
「妹は、あなたに殺された」

違う、違うんだ……。
僕は夢遊病でもＤＩＤでもない。
『将軍』は、いるんだ。僕じゃなくて、別に、いるんだ……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	FadeDelete("日記２", 500, true);

	Wait(300);

	Stand("bu優愛_制服_冷酷","cool", 200, @+150);
	FadeStand("bu優愛_制服_冷酷_cool", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100590yu">
「どう思う？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100600yu">
「この日記を見て、どう思うの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100610yu">
「美愛を追い詰めて、殺して、満足？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100620yu">
「こんな日記を書かせるぐらい追い詰めて、満足？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100630yu">
「どうして美愛にこんなひどいことをしたの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100640yu">
「どうして美愛を殺したの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100650yu">
「どうして？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100660ta">
「う、うぅ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100670ta">
「ゆ、優愛は、間違ってる……」

なにもかも、間違ってる……。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100680yu">
「間違ってるのは、あなたよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100690yu">
「あなたは、人を殺した」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100700yu">
「殺したじゃない」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100710yu">
「人殺し！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100720ta">
「だって……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100730ta">
「こ、こ、この日記は、優愛の日記じゃないか……っ」

{	SetVolume360("@CH*", 2000, 0, null);
	Stand("bu優愛_制服_通常左手下","worry", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu優愛_制服_冷酷_cool", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100740yu">
「…………？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100750yu">
「なんです……？」

優愛が怪訝そうな表情をする。

さっき、僕ははっきりと見た。
表紙に書かれた字。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//イメージＢＧ//美愛の日記（表紙）
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 100, 1000, null, true);

	DeleteStand("bu優愛_制服_通常左手下_worry", 0, true);

	CreateColor("回想明度", 1500, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

	CreateTexture360("日記回想", 2000, center, middle, "cg/bg/bg236_01_6_chn美愛の日記_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
そこにはＹｕａ’ｓ　ｄｉａｒｙとあった。

優愛の日記の見間違いかと思ったけど、でも優愛はさっき、この日記を書いたのが誰なのか、はっきりとこう言った。

//■３６０：ボイスエフェクト入ります。ファイル名タグ調整。
//ＶＦ//回想セリフ
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100260yu">
「妹の日記です」

だったら表紙の字はＭｉａ’ｓ　ｄｉａｒｙじゃないとおかしいはずなんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("日記回想");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100760ta">
「こ、これは、優愛の、日記だ……。表紙に、そ、そう、書いてある……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","worry", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602012]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100770yu">
「……なに言ってるの？」

優愛は表紙を見ようとはしない。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100780yu">
「これは、美愛ちゃんのよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100790yu">
「死んだ美愛ちゃんの日記」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100800yu">
「あなたに殺された美愛ちゃんの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100810yu">
「美愛ちゃんのなのよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100820yu">
「美愛ちゃんが書いた」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100830yu">
「死ぬ前に、書・い・た・の！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100840ta">
「だ、だったら、表紙を、み、見てよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

}
