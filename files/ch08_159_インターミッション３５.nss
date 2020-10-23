//<continuation number="1170">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_159_インターミッション３５";
		$GameContiune = 1;
		Reset();
	}

		ch08_159_インターミッション３５();
}


function ch08_159_インターミッション３５()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション３５
//ＢＧ//信用調査会社フリージア・社内//夜

	IntermissionIn();

	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg069_01_1_フリージア社内_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	IntermissionIn2();

	Wait(1000);

	CreateSE("SE01","SE_はいけい_ふりーじあ社内_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

	Stand("bu安二_スーツ_通常","normal", 210, @320);
	FadeStand("bu安二_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆感心している
//【判】
<voice name="判" class="判" src="voice/ch08/15900010bn">
「ふぅ～ん」

フリージアの応接室――とは名ばかりの、棚で仕切られた狭い空間――で、判は食い入るようにファイルを読んでいた。

{	Stand("bu優愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);}
//◆おどおど
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900020yu">
「…………」

その向かいには、優愛が身を縮こまらせるようにして座っている。さっきからしきりに判の顔色をチラチラと窺っていた。その姿はさながら、通信簿を親に見せているときの子供のようだ。

判が読んでいるのは、優愛がこれまでに調べた、ニュージェネ事件と西條拓巳に関するレポートだった。

『張り付け』事件前日、拓巳と『将軍』が交わしたチャットのログなども含まれている。

結論として優愛は、やはり拓巳こそがニュージェネ事件の真犯人だと考えていた。

{	DeleteStand("bu安二_スーツ_通常_normal", 500, true);
	Stand("bu克子_スーツ_通常","normal", 150, @220);
	FadeStand("bu克子_スーツ_通常_normal", 500, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900030mm">
「すごいわねぇ。これ、全部ひとりで調べたの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900040yu">
「はい、一応……」

{	DeleteStand("bu優愛_制服_通常左手下_worry", 500, false);}
百瀬の感心したような言葉にも、優愛は申し訳なさそうに顔を伏せる。足許に置いてある自身のカバン、そこにぶら下がっているゲロカエルんのマスコットを見つめるような形になった。

相手は刑事と調査会社の社長。
“調べること”に関してはプロ中のプロだ。

その２人に対して、ごく普通の女子高生でしかない優愛が独力で調べたような情報など、子供の遊びと見られても仕方がない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_normal", 500, true);

	Stand("bu優愛_制服_通常左手下","worry", 200, @-320);
	Stand("bu安二_スーツ_通常","normal", 210, @320);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, false);
	FadeStand("bu安二_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
だが、判もまた百瀬と同様に、レポートの出来の良さにうならされていた。

//【判】
<voice name="判" class="判" src="voice/ch08/15900050bn">
「なかなかいい着眼点だ。よく調べたな」

//【判】
<voice name="判" class="判" src="voice/ch08/15900060bn">
「とりわけこの、西條拓巳の多重性ってのが興味深い」

{	Stand("bu安二_スーツ_通常","hard", 210, @320);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15900070bn">
「“西條拓巳は多重人格であり、オリジナルとなった西條拓巳の人格が眠っているとき、つまり他の人格が活動中に事件を起こしている”」

//【判】
<voice name="判" class="判" src="voice/ch08/15900080bn">
「いや、本当に面白いわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu安二_スーツ_通常","normal", 210, @320);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_hard", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【判】
<voice name="判" class="判" src="voice/ch08/15900090bn">
「まあでも、ちょっとばかり現実離れしすぎてるかな」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900100yu">
「刑事さんは、その……西條くんのこと、犯人だって、考えてないんですか？」

{	Stand("bu安二_スーツ_通常","hard", 210, @320);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15900110bn">
「……はっきり言っていいかい？」

優愛は少し顔を強張らせて、うなずく。

//【判】
<voice name="判" class="判" src="voice/ch08/15900120bn">
「警察じゃ、西條拓巳は――」

//【判】
<voice name="判" class="判" src="voice/ch08/15900130bn">
「容疑者として見ていない」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","shock", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_shock", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, false);
	Wait(500);
	DeleteStand("bu優愛_制服_通常左手下_shock", 500, true);
	Stand("bu克子_スーツ_通常","sigh", 150, @-320);
	FadeStand("bu克子_スーツ_通常_sigh", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900140mm">
「へえ。そうなの」

優愛だけでなく、百瀬もまた目を丸くした。

{	Stand("bu安二_スーツ_通常","normal", 210, @320);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_hard", 0, false);}
判は、苦笑を浮かべる。背もたれに身を預け、頭の後ろで手を組んだ。

//【判】
<voice name="判" class="判" src="voice/ch08/15900150bn">
「少なくとも『張り付け』事件じゃ、西條はシロだ」

//【判】
<voice name="判" class="判" src="voice/ch08/15900160bn">
「遺体を張り付けていた杭には指紋がべったり付着しててな」

//【判】
<voice name="判" class="判" src="voice/ch08/15900170bn">
「西條の指紋を手に入れて照合してみたんだが、まったく合致しなかった」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu安二_スーツ_通常_normal", 500, false);
	DeleteStand("bu克子_スーツ_通常_sigh", 500, true);
	Stand("bu優愛_制服_通常左手下","shock", 200, @-50);
	FadeStand("bu優愛_制服_通常左手下_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆呆然
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900180yu">
「そん……な……」

{	DeleteStand("bu優愛_制服_通常左手下_shock", 500, true);}
優愛はみるみる蒼白になり、唇を震わせた。

自分の信じていたことがガラガラと崩壊した今、彼女の心に押し寄せてきたのは、拓巳にひどいことを言ってしまったという罪悪感。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu安二_スーツ_通常","normal", 210, @320);
	FadeStand("bu安二_スーツ_通常_normal", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【判】
<voice name="判" class="判" src="voice/ch08/15900190bn">
「杭にあった指紋から、容疑者についてはほぼ固まってんだ」

//【判】
<voice name="判" class="判" src="voice/ch08/15900200bn">
「まだマスコミにも公表してねえけどな」

//【判】
<voice name="判" class="判" src="voice/ch08/15900210bn">
「ちなみにそれ、諏訪のお手柄だったりする」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu克子_スーツ_通常","sigh", 150, @-320);
	FadeStand("bu克子_スーツ_通常_sigh", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900220mm">
「諏訪ちゃんは頑張ってるって言うのに、バンちゃんはよくここでのんびりしていられるわね……」

//【判】
<voice name="判" class="判" src="voice/ch08/15900230bn">
「実は俺、捜査本部から外されたんだわ」

{	Stand("bu克子_スーツ_通常","hard", 150, @-320);
	FadeStand("bu克子_スーツ_通常_hard", 300, true);
	DeleteStand("bu克子_スーツ_通常_sigh", 0, false);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900240mm">
「はあ！？」

{	Stand("bu安二_スーツ_通常","pride", 210, @320);
	FadeStand("bu安二_スーツ_通常_pride", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
//◆はっは＝笑う
//【判】
<voice name="判" class="判" src="voice/ch08/15900250bn">
「本来の捜査サボって、ＧＥレートのこととか調べてんの、上司にバレちゃってな、はっは」

だから判にしてみれば、わざわざ第７の事件発生を電話で伝えてくる必要などないのだと、後輩である諏訪に言ってやりたかった。

{	Stand("bu克子_スーツ_通常","sigh", 150, @-320);
	FadeStand("bu克子_スーツ_通常_sigh", 300, true);
	DeleteStand("bu克子_スーツ_通常_hard", 0, false);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900260mm">
「あんたねえ……もっとうまく立ち回りなさいよ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900270mm">
「まあ、バンちゃんにＧＥレートのこと教えた
私にも責任はあるけど……」

//【判】
<voice name="判" class="判" src="voice/ch08/15900280bn">
「気にすんなって」

{	Stand("bu安二_スーツ_通常","normal", 210, @320);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_pride", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15900290bn">
「それにＧＥレートの件は、個人的にも気になってんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_sigh", 300, true);
	Stand("bu優愛_制服_通常左手下","sad", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900300yu">
「…………」

//【判】
<voice name="判" class="判" src="voice/ch08/15900310bn">
「まあ、西條にしても『張り付け』以外の事件じゃまだ捜査線上にいる」

//【判】
<voice name="判" class="判" src="voice/ch08/15900320bn">
「もしかすると、優愛ちゃんの推理が正しいかもしれん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu克子_スーツ_通常","hard", 150, @-320);
	DeleteStand("bu優愛_制服_通常左手下_sad", 300, true);
	FadeStand("bu克子_スーツ_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604003]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900330mm">
「ニュージェネは同一犯による連続殺人事件じゃないって、
警察は考えてるの？」

{	Stand("bu安二_スーツ_通常","hard", 210, @320);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15900340bn">
「まだなんとも」

//【判】
<voice name="判" class="判" src="voice/ch08/15900350bn">
「ただ、ついさっき第７の事件が起きたようだしな」

//【判】
<voice name="判" class="判" src="voice/ch08/15900360bn">
「個人的には、犯人は複数いると思ってる」

{	Stand("bu安二_スーツ_通常","pride", 210, @320);
	FadeStand("bu安二_スーツ_通常_pride", 300, true);
	DeleteStand("bu安二_スーツ_通常_hard", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15900370bn">
「おっと、いろいろ喋っちまった。
口外したって知られたら、クビになっちまう。今のはオフレコな」

いたずらげに判は自身の唇に人差し指を添えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_hard", 300, true);

	Stand("bu安二_スーツ_通常","hard", 210, @320);
	Stand("bu優愛_制服_通常左手下","sad", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_sad", 300, false);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【判】
<voice name="判" class="判" src="voice/ch08/15900380bn">
「で、本題なんだが」

{	Stand("bu優愛_制服_通常左手下","shock", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_shock", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_sad", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900390yu">
「え……？」

てっきり今の話が、自分がここに呼び出された理由だと思っていたので、優愛は意外そうに首を傾げた。

//【判】
<voice name="判" class="判" src="voice/ch08/15900400bn">
「聞きたいことってのは、学校のことなんだよ」

//【判】
<voice name="判" class="判" src="voice/ch08/15900410bn">
「優愛ちゃんは、蒼井セナって子を知ってるかい？」

//【判】
<voice name="判" class="判" src="voice/ch08/15900420bn">
「君の同級生のはずなんだが」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_shock", 0, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
優愛は少し考えてから、申し訳なさそうに首を横に振った。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900430yu">
「名前は、聞いたことがあるような気がしますけど……話したことは、ありません」

//【判】
<voice name="判" class="判" src="voice/ch08/15900440bn">
「あー、そうか……」

{	Stand("bu優愛_制服_通常左手下","hard", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_hard", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900450yu">
「そ、その人が……犯人……なんですか？」

{	Stand("bu安二_スーツ_通常","normal", 210, @320);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_hard", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15900460bn">
「いや、まったくの別件だ。
　昨日徹夜したのも、その子のこと調べてたからでな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常左手下_hard", 300, true);
	Stand("bu克子_スーツ_通常","sigh", 150, @-320);
	FadeStand("bu克子_スーツ_通常_sigh", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900470mm">
「あんた、さっき女子高生の生態がどうとかって……」

{	Stand("bu安二_スーツ_通常","pride", 210, @320);
	FadeStand("bu安二_スーツ_通常_pride", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
戸惑う百瀬に、判はニヤリと笑い片目をつむって見せた。そしてすぐに優愛へと向き直る。

{	DeleteStand("bu克子_スーツ_通常_sigh", 500, true);
	Stand("bu優愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);}
//【判】
<voice name="判" class="判" src="voice/ch08/15900480bn">
「例えば、学校でものすごい手品を使う女生徒がいるって噂を聞いたことは？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900490yu">
「いえ……ありません……けど……」

{	DeleteStand("bu優愛_制服_通常左手下_worry", 500, true);
	Stand("bu克子_スーツ_通常","sigh", 150, @-320);
	FadeStand("bu克子_スーツ_通常_sigh", 500, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900500mm">
「さっぱり話が見えないわね」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900510mm">
「なんのこと？」

{	Stand("bu安二_スーツ_通常","hard", 210, @320);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_pride", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15900520bn">
「例えば――」

//【判】
<voice name="判" class="判" src="voice/ch08/15900530bn">
「なにもない空間から、剣を取り出すような手品、とか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu安二_スーツ_通常_hard", 300, false);
	DeleteStand("bu克子_スーツ_通常_sigh", 300, true);

	MusicStart("SE01",500,0,0,1000,null,false);

	Stand("bu優愛_制服_通常","shock", 200, @-50);
	Move("bu優愛_制服_通常左手下_shock", 0, @0, @20, null, true);
	FadeStand("bu優愛_制服_通常_shock", 300, false);
	Move("bu優愛_制服_通常左手下_shock", 300, @0, @-20, Dxl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900540yu">
「……っ！」

と、弾かれたように優愛が顔を上げる。
その表情は驚きに満ちていた。

//驚き
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900550yu">
「ど、どうして、それ……っ」

対して判も、自ら質問しておきながら、優愛の反応に意外そうな顔をする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常_shock", 300, true);
	Stand("bu安二_スーツ_通常","hard", 210, @320);
	Stand("bu優愛_制服_通常左手下","shock", 200, @-320);
	FadeStand("bu安二_スーツ_通常_hard", 300, false);
	FadeStand("bu優愛_制服_通常左手下_shock", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【判】
<voice name="判" class="判" src="voice/ch08/15900560bn">
「心当たりがあるのかい？」

{	Stand("bu優愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_shock", 0, false);}
優愛は少し躊躇してから、はっきりとうなずいた。

//【判】
<voice name="判" class="判" src="voice/ch08/15900570bn">
「どこで、見た？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900580yu">
「……駅の近くの、地下道です」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900590yu">
「西條くんと……岸本……さんが――」

//【判】
<voice name="判" class="判" src="voice/ch08/15900600bn">
「ＦＥＳだな。それで？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH01", 2000, 1000, true);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 350, 0, 0, 1280, 720, "Black");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("背景２", 250, 0, 0, "cg/bg/bg092_01_3_玉川通り地下道_a.jpg");
	Fade("回想フラッシュ", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
優愛は、２週間ほど前に起きた追跡劇について簡潔に話し出した。

西條拓巳に会うために漫画喫茶へ出向いたこと。

そこで少し強引に声をかけたら逃げられてしまったこと。

渋谷中を必死で追いかけたこと。しかし結局撒かれてしまい、あきらめかけていたところでたまたま、地下道へと入っていく拓巳とあやせの姿を見つけたこと。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900610yu">
「だ、だからわたし、その、階段の上から……２人の様子を、こっそり窺っていたんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900620yu">
「２人は階段の一番下で、なにか話していて……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900630yu">
「あ、えっと、どんなことを話していたかは、
聞き取れなかったんですけど……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900640yu">
「そしたら、突然――」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900650yu">
「岸本さんが、剣を、なにもないところから、取り出したんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900660yu">
「すごく大きな剣で……バッグにも入らないような……」

//苦笑
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900670mm">
「まさか……」

//【判】
<voice name="判" class="判" src="voice/ch08/15900680bn">
「……俺が見たものと同じだな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 200, 1000, null, true);
	Delete("色*");
	Delete("背景２");
	Delete("回想明度");
	Stand("bu安二_スーツ_通常","hard", 210, @320);
	Stand("bu優愛_制服_通常左手下","shock", 200, @-320);
	FadeStand("bu安二_スーツ_通常_hard", 0, true);
	FadeStand("bu優愛_制服_通常左手下_shock", 0, true);
	Fade("回想フラッシュ", 500, 0, null, true);
	Delete("回想フラッシュ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900690yu">
「えっ？」

//【判】
<voice name="判" class="判" src="voice/ch08/15900700bn">
「俺が見たのは、岸本じゃなかったがな」

//【判】
<voice name="判" class="判" src="voice/ch08/15900710bn">
「さっき名前を出した、蒼井セナっていう少女だ」

//【判】
<voice name="判" class="判" src="voice/ch08/15900720bn">
「実は、蒼井が剣を振り回してたっていう目撃証言が、渋谷のあちこちから出てる」

{	DeleteStand("bu安二_スーツ_通常_hard", 400, true);
	Stand("bu克子_スーツ_通常","sigh", 150, @220);
	FadeStand("bu克子_スーツ_通常_sigh", 400, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900730mm">
「その手品、渋谷の若い子たちの間で流行ってるのかしら」

{	Stand("bu優愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_shock", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900740yu">
「でも、わたしが見たあれは……手品にはとても見えませんでした……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900750yu">
「それに……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900760mm">
「他にもなにか見たの？」

{	Stand("bu優愛_制服_通常左手下","sad", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_sad", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900770yu">
「……信じてもらえるかどうか、分からなくて、誰にも、話したことは、ないんですけど……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900780yu">
「あのとき、岸本さんは……剣を出しただけじゃなくて……」

優愛は一度言葉を切り、ゆっくりと唇を舐めた。

言うべきかどうか迷っているようだ。目が泳いでいる。

{	DeleteStand("bu克子_スーツ_通常_sigh", 400, true);
	Stand("bu安二_スーツ_通常","hard", 210, @320);
	FadeStand("bu安二_スーツ_通常_hard", 400, true);}
だがやがて、意を決したように判へ視線を据えた。

{	BGMPlay360("CH*", 1000, 0, false);
	Wait(1000);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900790yu">
「２人に、分身、したんです……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900800yu">
「まるで、本当にその場に２人いるみたいでした……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900810yu">
「わたし、訳が分からなくて……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_はいけい_ふりーじあ社内_LOOP");
	MusicStart("SE01", 5000, 500, 0, 1000, null, true);
	DeleteStand("bu優愛_制服_通常左手下_sad", 500, true);
	Stand("bu安二_スーツ_通常","shock", 210, @320);
	FadeStand("bu安二_スーツ_通常_shock", 500, true);
	DeleteStand("bu安二_スーツ_通常_hard", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【判】
<voice name="判" class="判" src="voice/ch08/15900820bn">
「…………」

{	Stand("bu克子_スーツ_通常","sigh", 200, @-320);
	FadeStand("bu克子_スーツ_通常_sigh", 500, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900830mm">
「…………」

{	DeleteStand("bu安二_スーツ_通常_shock", 400, false);
	DeleteStand("bu克子_スーツ_通常_sigh", 400, true);}
重苦しい沈黙が、応接室に漂う。
３人とも、なんと言えばいいか分からず困惑していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu安二_スーツ_通常","hard", 210, @320);
	FadeStand("bu安二_スーツ_通常_hard", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【判】
<voice name="判" class="判" src="voice/ch08/15900840bn">
「とにかく、いったいどんなタネがあるのか分かんねえが、そんな手品みてぇなマネができる連中がこの渋谷には何人かいるらしい」

//【判】
<voice name="判" class="判" src="voice/ch08/15900850bn">
「それと……」

//【判】
<voice name="判" class="判" src="voice/ch08/15900860bn">
「岸本あやせも蒼井セナも、西條拓巳と接触したことは確認済みだ」

{	Stand("bu安二_スーツ_通常","pride", 210, @320);
	FadeStand("bu安二_スーツ_通常_pride", 300, true);
	DeleteStand("bu安二_スーツ_通常_hard", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15900870bn">
「これが偶然とは思えねえわけよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900880yu">
「西條くん……」

{	Stand("bu安二_スーツ_通常","normal", 210, @320);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_pride", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15900890bn">
「あの少年の周囲では、どうも現実離れしたことばかりが起きているような気がする――」

{	DeleteStand("bu優愛_制服_通常左手下_worry", 500, true);}
そう話しながら、判はふと、さっき電話中に自らの口をついて出た言葉を思い出す。

{	Stand("bu安二_スーツ_通常","hard", 210, @320);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
//◆小声で独り言
//【判】
<voice name="判" class="判" src="voice/ch08/15900900bn">
「怪獣か魔法使いで済ませられるなら、よっぽどいいけどな……」

{	DeleteStand("bu安二_スーツ_通常_hard", 500, true);}
判のつぶやきは、他の２人には届かなかった。

重苦しい雰囲気を嫌った百瀬が、部下に持ってきてもらったお茶をすすって一息ついた。それから笑顔を繕い、無理に話題を変えようとする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu克子_スーツ_通常","normal", 210, @320);
	FadeStand("bu克子_スーツ_通常_normal", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900910mm">
「ところで優愛ちゃん、そのカバンにぶら下がってるカエル、
最近流行ってるんでしょう？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","shock", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_shock", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900920yu">
「あ、はい……」

優愛も、救われたような顔でホッと吐息を漏らす。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900930mm">
「なんて言うんだっけ？」

{	Stand("bu優愛_制服_通常左手下","shy", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_shy", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_shock", 0, false);}
//◆恥ずかしそう
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900940yu">
「ゲロカエルん……です」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900950mm">
「いろいろ種類が出てるんじゃなかった？　１０種類ぐらい」

{	Stand("bu優愛_制服_通常左手下","normal", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_normal", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_shy", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900960yu">
「はい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15900970yu">
「わたしは、その、友達から、もらっただけなので、詳しくは、知らないんですけど」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_normal", 400, true);
	Stand("bu安二_スーツ_通常","pride", 210, @320);
	FadeStand("bu安二_スーツ_通常_pride", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3691008]
//【判】
<voice name="判" class="判" src="voice/ch08/15900980bn">
「なんだってこんな手抜き商品が流行るんだろうなあ？　見た目だって、俺の方がずっとカワイイぞ」

{	DeleteStand("bu優愛_制服_通常左手下_normal", 400, true);
	Stand("bu克子_スーツ_通常","hard", 200, @-320);
	FadeStand("bu克子_スーツ_通常_hard", 400, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15900990mm">
「バンちゃん、寝言は寝てから言いなさい」

{	Stand("bu安二_スーツ_通常","shock", 210, @320);
	FadeStand("bu安二_スーツ_通常_shock", 300, true);
	DeleteStand("bu安二_スーツ_通常_pride", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15901000bn">
「じょ、冗談だって……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_hard", 400, false);
	DeleteStand("bu安二_スーツ_通常_shock", 400, true);
	Stand("bu優愛_制服_通常","normal", 200, @-320);
	Stand("bu克子_スーツ_通常","normal", 210, @320);
	FadeStand("bu克子_スーツ_通常_normal", 400, false);
	FadeStand("bu優愛_制服_通常_normal", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15901010yu">
「わたしも、実はその、どうして流行っているのか、よく分からないんです」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15901020mm">
「あら、けっこうカワイイと思うけどねえ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_normal", 400, false);
	DeleteStand("bu優愛_制服_通常_normal", 400, true);
	Stand("bu克子_スーツ_通常","normal", 200, @-320);
	Stand("bu安二_スーツ_通常","pride", 210, @320);
	FadeStand("bu克子_スーツ_通常_normal", 400, false);
	FadeStand("bu安二_スーツ_通常_pride", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603008]
//【判】
<voice name="判" class="判" src="voice/ch08/15901030bn">
「モモちゃんの見る目も、衰えたな」

{	Stand("bu克子_スーツ_通常","sigh", 300, @-320);
	FadeStand("bu克子_スーツ_通常_sigh", 300, true);
	DeleteStand("bu克子_スーツ_通常_normal", 0, false);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15901040mm">
「世論は私の方が正しいって証明してるじゃない」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15901050mm">
「バンちゃんも買いに行った方がいいわよ」

{	Stand("bu安二_スーツ_通常","normal", 210, @320);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_pride", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15901060bn">
「いったいどこへ行けば買えるものなんだ？」

{	DeleteStand("bu克子_スーツ_通常_sigh", 400, true);
	Stand("bu優愛_制服_通常左手下","shy", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_shy", 400, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15901070yu">
「えっと、ゲロカエルんの、専門ショップが、あちこちにあって……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu安二_スーツ_通常","shock", 210, @320);
	FadeStand("bu安二_スーツ_通常_shock", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//◆ビックリ
//【判】
<voice name="判" class="判" src="voice/ch08/15901080bn">
「専門ショップだあ？」

{	Stand("bu優愛_制服_通常左手下","normal", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_normal", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_shy", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15901090yu">
「そこで、金曜日に、行列に並べば、買えると思います」

{	Stand("bu安二_スーツ_通常","hard", 210, @320);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_shock", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15901100bn">
「金曜日……？」

{	DeleteStand("bu優愛_制服_通常左手下_normal", 400, false);
	DeleteStand("bu安二_スーツ_通常_hard", 400, true);
	Stand("bu優愛_制服_通常左手下","normal", 200, @-50);
	FadeStand("bu優愛_制服_通常左手下_normal", 400, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15901110yu">
「毎週金曜日に、新しいデザインのものが発売になるんです。
　好きな子は、えっと、コンプリートとか言って、
　全部集めてるみたいで……」

{	Stand("bu優愛_制服_通常左手下","worry", 200, @-50);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_normal", 0, false);}
//◆判と百瀬が顔を見合わせて考え込んだので困惑している
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15901120yu">
「あの……？」

優愛が喋っている途中だったが、
判は百瀬と顔を見合わせ、顎の無精ヒゲをさすった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常左手下_worry", 400, true);
	Stand("bu克子_スーツ_通常","hard", 200, @-320);
	Stand("bu安二_スーツ_通常","hard", 210, @320);
	FadeStand("bu克子_スーツ_通常_hard", 500, false);
	FadeStand("bu安二_スーツ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//【判】
<voice name="判" class="判" src="voice/ch08/15901130bn">
「金曜、か」

//【判】
<voice name="判" class="判" src="voice/ch08/15901140bn">
「流行るとは思えないものが流行ってて」

//【判】
<voice name="判" class="判" src="voice/ch08/15901150bn">
「ＧＥレートは毎週末に上昇する」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15901160mm">
「まさかバンちゃん……」

//【判】
<voice name="判" class="判" src="voice/ch08/15901170bn">
「当たってみる価値はあるかもな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*",2000,0,false);
	ClearAll(2000);
	Wait(2000);

//■インターミッション３５終了


}