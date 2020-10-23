//<continuation number="510">




chapter main
{

	$PreGameName = "boot_第四章";

	if($GameStart != 1)
	{
		$GameName = "ch04_079_七海とイタズラ電話確認";
		$GameContiune = 1;
		Reset();
	}

		ch04_079_七海とイタズラ電話確認();
}


function ch04_079_七海とイタズラ電話確認()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");

//ＳＥ//チャイム

	CreateSE("SE02","SE_日常_チャイム");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Wait(2000);

//ＢＧ//翠明学園廊下

	CreateSE("SE03","SE_じん体_動作_立ち上がる_生と全員");
	MusicStart("SE03", 0, 500, 0, 1000, null, false);

	WaitAction("SE03", 1000);

	CreateSE("SE04","SE_日常_教室扉_開く");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 1000, 700, 0, 1000, null, true);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
チャイムの音が、今日のすべての授業が終わったことを告げる。それと同時に、僕は荷物をまとめて教室から出た。

梨深との微妙な距離感にいたたまれなかったこともあって、一刻も早く教室からいなくなりたかった。

それに今日はまんがだらけにも寄る用があるし。

結局、梨深とは一言も話せなかった。

話すチャンスは何度かあったけど、朝と同じように僕はひたすら口をつぐみ続けてしまった。

悪いことしちゃったかもしれない。
これじゃ、次に会ったときにますます話しにくくなる。

梨深との接し方に関して、僕は泥沼にはまりつつあった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 500, 0, NULL);
	SetVolume("SE01", 2000, 0, NULL);

	CreateSE("SE03","SE_日常_校門前_朝");
	MusicStart("SE03", 1000, 1000, 0, 1000, null, true);

//ＢＧ//翠明学園昇降口
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg052_01_1_学校階段_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg052_01_1_学校階段_a.jpg");

	Wait(500);

	Stand("st七海_制服_通常","shock", 200, @+100);
	FadeStand("st七海_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900010na">
「あ、おにぃ！」

校舎から出ようとしたところで、鬱陶しいヤツに声をかけられた。

{	DeleteStand("st七海_制服_通常_shock", 300, true);}
七海が、ゴミ箱を抱えて走り寄ってくる。
どうやら掃除でゴミを捨てに行く最中らしい。

めざとく僕を見つけやがって。
無視してさっさと帰ろうとしたけど、七海は例によって僕を見逃そうとしてくれなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_掴む");
	Shake("back*", 200, 0, 5, 0, 0, 500, null, false);
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Stand("bu七海_制服_通常","angry", 200, @+150);
	FadeStand("bu七海_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
制服の裾を後ろからぐいっと引っ張られてしまう。

{	BGMPlay360("CH08", 0, 1000, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900020na">
「妹見て逃げるなーって、何度言えば分かるのっ！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900030ta">
「な、なんだよぅ……」

//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900040na">
「なんだよぅじゃないよぅ！」

//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900050na">
「おにぃが逃げるからナナもつい追いかけちゃうんじゃん！」

用がないなら追いかけてくるなよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_制服_通常_angry", 500, true);
	Stand("st七海_制服_通常","angry", 200, @+100);
	FadeStand("st七海_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900060na">
「相変わらず家に電話かけてこないし。まあ、ナナはもうあきらめたけど。どうせおにぃがマジメに連絡入れてくるとは思えないもんね」

//■３６０
よく分かってるじゃないか。さすが、仮にも僕の妹だな。
三次元妹なんてまったく必要ないけど。

//よく分かってるじゃないか。仮にも僕の妹だな。
//三次元妹なんてまったく必要ないけど。

{	Stand("st七海_制服_通常","normal", 200, @+100);
	FadeStand("st七海_制服_通常_normal", 300, true);
	DeleteStand("st七海_制服_通常_angry", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900070na">
「というわけで、これからも定期的にナナがおにぃの部屋に様子見に行くから」

{	Stand("st七海_制服_通常","smile", 200, @+100);
	FadeStand("st七海_制服_通常_smile", 300, true);
	DeleteStand("st七海_制服_通常_normal", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900080na">
「感謝してよねっ」

くそ、結局そうなるのか。
この鬱陶しい妹の呪縛からなんとか逃れたい。

いや、それは無理だとしてもせめて一矢報いたい。

そんなことを常日頃から考えている僕だった。

あ、そうだ！
以前に計画したことを実行に移すチャンスだぞ。
ささやかな復讐になるかもしれないし。

僕は周囲を見回すと、七海に手招きしつつ中庭に向かって歩き出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_通常","normal", 200, @+100);
	FadeStand("st七海_制服_通常_normal", 300, true);
	DeleteStand("st七海_制服_通常_smile", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900090na">
「ん？　なに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900100ta">
「ちょ、ちょっと……来てくれ……」

//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900110na">
「なんで？　なんかあるの？」

いちいちうるさいヤツだな。

素直についてくるっていうことができないのか、このバカ妹は。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900120ta">
「な、七海に……だ、大事な頼みが、ある」

{	Stand("st七海_制服_通常","shock", 200, @+100);
	FadeStand("st七海_制服_通常_shock", 300, true);
	DeleteStand("st七海_制服_通常_normal", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900130na">
「え、頼み？　おにぃが、ナナに？」

七海は目を丸くしている。

//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900140na">
「珍しいじゃん。おにぃが頼み事なんて」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900150ta">
「と、とにかく、黙って、ついてこい、って……」

//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900160na">
「あ、ちょっと待ってよ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Request("SE03", Lock);
	SetVolume360("CH08", 2000, 0, NULL);

	PrintBG(100);

	Request("SE03", UnLock);
	SetVolume("SE03", 1000, 500, NULL);

//ＢＧ//中庭

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg043_01_1_学校中庭_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg043_01_1_学校中庭_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
中庭にはそれほど人がいない。

昼休みは弁当を食べる生徒たちで賑わうけど、放課後にわざわざここに足を運ぶのは園芸部ぐらいだろう。

{	BGMPlay360("CH14", 2000, 1000, true);
	Stand("st七海_制服_通常","shy", 200, @-100);
	FadeStand("st七海_制服_通常_shy", 500, true);}
//◆ちょっと嬉しそう
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900170na">
「で、頼みって？」

七海は抱えていたゴミ箱を地面に下ろすと、ニコニコしながら胸を張った。

{	Stand("st七海_制服_通常","normal", 200, @-100);
	FadeStand("st七海_制服_通常_normal", 300, true);
	DeleteStand("st七海_制服_通常_shy", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900180na">
「あ、条件はマクディおごりね。その条件呑んでくれるんなら、ホントはイヤだけどおにぃの頼み聞いてあげる」

くっ、いちいちムカつく妹だ……。
まさか対価を求められるなんて。

しかもマクディならこの前おごっただろっ。
……まあいいさ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900190ta">
「わ、分かった。おごる」

{	Stand("st七海_制服_通常","smile", 200, @-100);
	FadeStand("st七海_制服_通常_smile", 300, true);
	DeleteStand("st七海_制服_通常_normal", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900200na">
「えっ、ホント！？　今日のおにぃ、いつもと違うね！」

{#TIPS_サーセン = true;$TIPS_on_サーセン = true;}
ま、嘘ですけどね！
ふひひ、嘘つきで<FONT incolor="#88abda" outcolor="BLACK">サーセン</FONT>ｗｗｗ

{	DeleteStand("st七海_制服_通常_smile", 500, true);}
{$TIPS_on_サーセン = false;}
というわけで、七海に僕のケータイを手渡した。

着信履歴にある例のイタズラ電話の番号『03-X733-X991』にかけるように頼む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","shock", 200, @-150);
	FadeStand("bu七海_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900210na">
「着歴の、番号にかける……？　相手は誰？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900220ta">
「ネ、ネットの、知り合い……」

いぶかしそうな表情で首をひねっている七海に対して、とっさにもっともらしい嘘をついた。

//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900230na">
「どうしてナナがかけるの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900240ta">
「か、かければ、分かる……」

{	Stand("bu七海_制服_通常","pride", 200, @-150);
	FadeStand("bu七海_制服_通常_pride", 300, true);
	DeleteStand("bu七海_制服_通常_shock", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900250na">
「な～んか、企んでない……？」

あーもう、ｕｚｅｅｅｅｅｅ！

お前は黙って言うことを聞けばそれでいいんだよ！

それができないなら帰れ！　お前に用はない！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900260ta">
「じゃ、じゃあ、もう……お前には、た、頼まない……」

ケータイを奪い返そうとした。
でも七海は手を引っ込めて僕から逃れる。

{	Stand("bu七海_制服_通常","shock", 200, @-150);
	FadeStand("bu七海_制服_通常_shock", 300, true);
	DeleteStand("bu七海_制服_通常_pride", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900270na">
「わ、分かったって。かけるよ、かければいーんでしょ」

{	Stand("bu七海_制服_通常","pride", 200, @-150);
	FadeStand("bu七海_制服_通常_pride", 300, true);
	DeleteStand("bu七海_制服_通常_shock", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900280na">
「ホント、ワガママなおにぃだなぁ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH14", 2000, 500, NULL);

	DeleteStand("bu七海_制服_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
お前に言われたくはない。

僕は怒りをグッとこらえつつ、
七海が例の番号にかけるのを固唾を呑んで見守った。

{	CreateSE("SE01","SE_日常_けい帯操作");
	MusicStart("SE01", 0, 500, 0, 1000, null, false);}
なにも知らない七海は、呑気な顔をしてケータイを耳に当て、相手が出るのを待っている。

ケータイを持っている方の手首に、黄色いバングルをしているのが見えた。

あれって、僕があげた――というより七海が勝手に欲しがった――バングルだよね。

学校に来るときまで身につけてるのか。
そんなに気に入ったのかな。

あんな安っぽい、おまけのバングルを？

やっぱり七海はセンスないなあ。
まあ、僕もあんまり人のこと言えないけど。

って、今はそんなことどうでもいいんだ。

さて、誰が電話に出るだろう……。
怖そうなＤＱＮ野郎だろうか。

できればただのイタズラで、『将軍』とか優愛とはまったく無関係でいてくれるといいんだけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆電話に向かって話している
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900290na">
「あ、もしもし……？」

どうやら繋がったらしい。
七海は電話の送話口を手で覆うようにして呼びかけた。

でもすぐに眉根を寄せる。
そしてケータイを僕の方に突き出してきた。

{	Stand("bu七海_制服_通常","angry", 200, @-150);
	FadeStand("bu七海_制服_通常_angry", 500, true);}
//◆文句を言うように
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900300na">
「おにぃ～～～！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900310ta">
「な、な、な、なんだ……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900320na">
「なんだ、じゃないよっ。現在使われてませんって言ってるよ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900330ta">
「え……」

{	DeleteStand("bu七海_制服_通常_angry", 300, true);}
僕は七海からケータイをひったくるように受け取り、耳に添えてみた。
聞こえてきたのは――

//ＶＦ//ケータイのアナウンスメッセージ
//↓「あなたがおかけになった電話番号は、現在使われておりません。番号をご確認の上、もう一度お掛け直しください」//途中から聞いて途中で切った
//【ケータイアナウンス】
<voice name="ケータイアナウンス" class="ケータイアナウンス" src="voice/ch04/07900340ia">
「――かけになった電話番号は、現在使われておりません。番号をご確認の上、もう一度――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Delete("@text008");

//ＳＥ//ケータイ切る
	CreateSE("SE02","SE_日常_けい帯ボタン押す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
ホントだ……。
ということは、やっぱりただのイタズラだったのかな。

何日間か限定で一斉にいろんな番号にランダムでかけて、
そのイタズラが終わったら番号とケータイを破棄する……ってことだったのかも。

それにしてもやけに大がかりなイタズラだなあ。

ま、別にどうでもいいけど。

謎の電話の正体がイタズラだったって分かったんだ、それだけで無問題だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_拗ね","angry", 200, @-100);
	FadeStand("st七海_制服_拗ね_angry", 500, true);

	SetVolume360("CH14", 2000, 1000, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900350na">
「ねえ、いったいなんなの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900360ta">
「も、もう、お前、用ナシ……」

{	Stand("st七海_制服_通常","shock", 200, @-100);
	DeleteStand("st七海_制服_拗ね_angry", 500, false);
	FadeStand("st七海_制服_通常_shock", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900370na">
「ええっ？」

{	DeleteStand("st七海_制服_通常_shock", 300, true);}
僕は七海をその場に残して歩き出した。
でもすぐに七海は追いかけてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_通常","angry", 200, @-100);
	FadeStand("st七海_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900380na">
「どういうことか説明してよっ」

うるさいなあ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900390ta">
「お前、そ、掃除中だろ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900400ta">
「ゴミ箱、置きっぱなしだぞ」

{	Stand("st七海_制服_通常","shock", 200, @-100);
	FadeStand("st七海_制服_通常_shock", 300, true);
	DeleteStand("st七海_制服_通常_angry", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900410na">
「あ……」

{	Stand("st七海_制服_拗ね","angry", 200, @-100);
	DeleteStand("st七海_制服_通常_shock", 500, false);
	FadeStand("st七海_制服_拗ね_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900420na">
「で、でも説明聞いてないもんっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900430ta">
「僕は、か、帰る」

追いすがる七海の相手はせず、僕は足早に校門へ向かう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Request("SE03", Lock);
	SetVolume360("CH14", 2000, 0, NULL);

//ＢＧ//校門

	PrintBG(100);

	SetVolume("SE03", 1000, 1000, NULL);

	Request("SE03", UnLock);

	CreateTexture360("back03", 100, 0, 40, "cg/bg/bg016_02_0_学校校門_a.jpg");
	Request("back03", Smoothing);
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);

//	CreateBG(100, 0, 0, 50, "cg/bg/bg016_02_0_学校校門_a.jpg");

	Stand("st七海_制服_拗ね","angry", 200, @+100);
	FadeStand("st七海_制服_拗ね_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900440na">
「おにぃ、じゃあマクディおごる約束だからね！　ちゃんと覚えといてよ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900450ta">
「知るか……」

{	Stand("st七海_制服_通常","shock", 200, @+100);
	DeleteStand("st七海_制服_拗ね_angry", 500, false);
	FadeStand("st七海_制服_通常_shock", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900460na">
「ちょっと！　嘘ついたの！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07900470ta">
「まあな……」

{	Stand("st七海_制服_拗ね","angry", 200, @+100);
	DeleteStand("st七海_制服_通常_shock", 500, false);
	FadeStand("st七海_制服_拗ね_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900480na">
「うう……」

七海はムッとした様子でその場に立ち止まった。

{	DeleteStand("st七海_制服_拗ね_angry", 300, true);}
でも僕はそのまま進み続ける。

//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900490na">
「おにぃのバカ！」

周囲に響き渡るほどの大声で、叫ばれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_通常","angry", 200, @+100);
	FadeStand("st七海_制服_通常_angry", 300, true);

	BGMPlay360("CH05",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
うんざりして振り返ると、七海は肩を怒らせて僕をにらみつけている。

{	Stand("st七海_制服_キレ","mad", 200, @+100);
	DeleteStand("st七海_制服_通常_angry", 500, false);
	FadeStand("st七海_制服_キレ_mad", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900500na">
「おにぃなんて、ケータイの電磁波の影響で脳ミソスカスカにされて死んじゃえ！」

まずい、七海の大声のせいで僕まで注目を浴びつつある。
学校ではできるだけ目立たないようにするのが僕の処世術なのに。

とことんウザい妹だ！

{	SetVolume("SE03", 500, 0, NULL);
	CreateColor("back10", 200, 0, 0, 1280, 720, "Black");
	DrawTransition("back10", 500, 0, 1000, 100, null, "cg/data/right2.png", true);}
僕は七海に構わず、小走りで校門へ向かった。

こういうときは逃げるのが一番だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	if(#下着パッチ==true)
	{
		CreateTextureEX("bu七海", 500, -96, -80, "ex/bu/bu七海_制服_キレ_下着_mad_lip02.png");
	}else{
		CreateTextureEX("bu七海", 500, -96, -80, "cg/bu/bu七海_制服_キレ_mad_lip02.png");
	}

	Fade("bu七海", 500, 500, null, true);

	Wait(200);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【七海】
<voice name="七海" class="七海" src="voice/ch04/07900510na">
「バカ～～～～～！」

七海の声は校門をくぐり校外に出てもなお聞こえてきて、僕を脱力させた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 1500, 0, null);
	ClearAll(1500);

	Wait(1000);

//～～Ｆ・Ｏ

}