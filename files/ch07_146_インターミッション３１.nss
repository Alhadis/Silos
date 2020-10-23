//<continuation number="420">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_146_インターミッション３１";
		$GameContiune = 1;
		Reset();
	}

		ch07_146_インターミッション３１();
}


function ch07_146_インターミッション３１()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//■インターミッション３１

//アイキャッチIN
	IntermissionIn();

	Delete("*");
//ＢＧ//黒
	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 1000, null, true);

//アイキャッチOUT
	IntermissionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//以下の梢のセリフのみ、モノローグ扱いに
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14600010ko">
「この剣が、怖くて、仕方なかった」

//以上の梢のセリフのみ、モノローグ扱いに
折原梢は、東京に出てくるまで、そう思っていた。

だが、今は違う。
今では、彼女にとってとても大切で、かけがえのないものとなった。

この剣があれば、怖くない。
この剣が、自分を守ってくれる。
この剣は、自分の心。もうひとりの、自分。

そう思うようになったのは、もう３週間ほども前――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//渋谷遠景
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg058_02_6_Ｒｏｆｔ前_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	Delete("背景１");
	
//※↑なんとなく薄暗くてどんよりしているイメージで
//ＳＥ//雨の音
	CreateSE("SE01","SE_自然_雨_通常_LOOP");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);
	Request("SE01", Lock);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
梢には、幼い頃から、他人の心の声が聞こえてしまうという力があった。

それをいつ自覚するようになったのかは、もう覚えていない。

自分がおかしくなったんだ、病気になっちゃったんだ――
梢は幼いながらに、この力は誰にも悟られちゃいけないものなんだと思った。

だから、両親にも隠していた。

力のせいで友人もできず、家族とも溝ができ、“やたらと勘のいい子”と周囲から気味悪がられた。

渋谷に来ても、彼女は学校へ行くことが怖かった。誰とも会いたくなかった。どうせまた気味悪がられるに決まってると考えていた。

本来転入するはずだった日も、その次の日も、さらに次の日も、学校へ行かずに朝から渋谷の街をさまよい歩いていた。

きっと両親には学校から連絡が行っていただろう。梢が無断欠席していることには気付いたはずだ。でも２人は梢になにも言ってこなかった。

中学生と間違われてもおかしくない容姿の梢が平日の午前中から街を歩いていても、彼女が以前住んでいた田舎とは違って、咎める人間はひとりもいなかった。

渋谷を徘徊するようになって数日。

Ｒｏｆｔ内の階段という、彼女にとっての憩いの場所を見つけ、そこに座り込んでぼんやりするのが日課になった。

その日も、夕方になるまで４時間近くもそこで過ごした後、帰ろうとＲｏｆｔを出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//あやべ：差し替え
//イメージＢＧ//雨の降る空
	CreateTextureEX("背景３", 100, 0, -80, "cg/bg/bg179_01_1_雨空_a.jpg");
	Request("背景３", Smoothing);
	Move("背景３", 1000, 0, 0, null, false);
	Fade("背景３", 500, 1000, null, true);
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
鈍色の空からは雨の雫が落ちてきていた。

梢は傘を持っていなかったが、空を見上げることもなく、濡れることも気にせず、力のない足取りで雨の中へと足を踏み出した。

そこで、ふと彼女の視界に飛び込んできたもの。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//差分無し、以下立ち絵を表示します。
//ＣＧ//梢と波多野、雨の中の会話
//※梢の服装は私服（ピンクロリ服）
	CreateTextureEX("背景４", 200, 0, 0, "cg/bg/bg058_02_6_Ｒｏｆｔ前_a.jpg");
	Fade("背景４", 1000, 1000, null, true);
	Delete("背景３");

	Stand("bu一成_浮浪者_プラカード1","normal", 400, @+250);
	FadeStand("bu一成_浮浪者_プラカード1_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
“世界は終わる”

そう書かれたボード。
雨に濡れ、手書きの字はにじんでしまっていた。

そのボードを持っていたのは、ひとりのホームレスの男で、こんな雨の中、道端に気配を消して座り込んでいた。

うなだれ、その表情は見えない。もしかしたら、死んでいるのかもしれない。

その姿が――

さっきまでＲｏｆｔの階段にいた自分とだぶって、梢は足を止めていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu一成_浮浪者_プラカード1_normal", 500, true);
	Stand("bu梢_私服_通常","sad", 500, @-200);
	FadeStand("bu梢_私服_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//※以下のセリフのみリアルの声
//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14600020ko">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梢_私服_通常_sad", 300, true);
	Stand("st梢_私服_通常","sad", 500, @-200);
	FadeStand("st梢_私服_通常_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//※以上のセリフのみリアルの声
少しの間、躊躇した。

見ず知らずの、しかも東京に来る前には見たことがなかったホームレス。その姿に嫌悪感すら覚えた。もしここで話しかけて、恐ろしいことに巻き込まれたらどうしよう……そんな不安。

けれどそのときの梢は、その不安以上に、男を殺してやりたいという衝動が強かった。あまりにも唐突な衝動だったが、そうすることで今の自分も殺せるんじゃないかという気がした。

{	Stand("st梢_私服_通常","shy", 500, @-200);
	FadeStand("st梢_私服_通常_shy", 300, true);
	DeleteStand("st梢_私服_通常_sad", 0, true);}
だから迷った末に、男に“心の声”を送っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_私服_通常_shy", 500, true);
	Stand("bu梢_私服_通常","sad", 500, @-200);
	FadeStand("bu梢_私服_通常_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆※インターミッション中の梢はテンション低め。ほとんど鬱状態
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14600030ko">
「世界は、終わるの？」

男の肩が、ピクリと震える。
死んでいたわけではなかった。
ゆっくりと、顔を上げる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梢_私服_通常_sad", 300, true);
	Stand("bu一成_浮浪者_プラカード1","normal", 400, @+250);
	FadeStand("bu一成_浮浪者_プラカード1_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
濡れた前髪の間からのぞく濁った目が、梢を見上げてきた。

//※以下、波多野の声はすべて『心の声』なので、ボイスエフェクトかけてください
//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600040ha">
「ああ。終わるよ」

梢は驚き、わずかに目を見開いた。

世界が終わると言い切ったことにではなく。
男が、返事をしたことに対して。

返事なんて期待していなかった。

心の声を送られた相手は、戸惑って幻聴かと思い込もうとするか、恐怖に震えてその場を足早に立ち去るかのどちらかだ。

もしコミュニケーションに成功したとしても、ここまで整然と返事をよこしてくるのは難しいこと。

人の思考というものは、あまりにも脈絡がなく無秩序だから。

なのに男は、表情をなんら変えず。
梢の問いかけに、シンプルに一言だけで答えてきたのだ。

男の声を通して感じる心には、深い悲しみが満ちていた。心が、泣いていた。梢にはそう思えた。

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600050ha">
「君は、剣を持っているね？」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14600060ko">
「どうして分かるの？」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600070ha">
「君のような子を、他にも知っているから」

{	CreateColor("back10", 1500, 0, 0, 1280, 720, "White");
	Fade("back10", 0, 0, null, false);
	Request("back10", Smoothing);
	CreateSE("SE03","SE_擬音_ディそーど出現");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Fade("back10", 100, 1000, null, true);}
梢は頭上に手を掲げ、その場でディソードを取り出して見せた。男に切っ先を突きつける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＣＧ//梢と波多野、雨の中の会話//差分
//※↑梢がディソードの切っ先を波多野に突きつける
	CreateColor("黒", 1000, 0, 0, 1280, 720, "Black");
	Fade("黒", 0, 0, null, true);
	Fade("黒", 0, 1000, null, true);
	CreateTextureEX("梢過去", 800, 0, -128, "cg/ev/ev072_01_1_梢と波多野Roft前_a.jpg");
	Fade("梢過去", 0, 1000, null, true);

	Fade("back10", 100, 0, null, true);

	Move("梢過去", 2000, @0, @64, Dxl1, false);
	Fade("黒", 500, 0, null, false);

	CreateSE("SE04","SE_擬音_ディそーどかまえる");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	WaitAction("梢過去", null);

	Delete("背景４");
	Delete("黒");
	Delete("back10");
	DeleteStand("bu一成_浮浪者_プラカード1_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14600080ko">
「この剣が、見えるの？」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600090ha">
「見えないよ」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14600100ko">
「じゃあ、どうして分かるの？」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600110ha">
「おじさんが、悪い人だからだよ」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600120ha">
「……済まない」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14600130ko">
「どうして、謝るの？」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600140ha">
「おじさんの、せいなんだ」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14600150ko">
「どうして、おじさんのせいなの？」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600160ha">
「忠告しかできないから」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600170ha">
「動き出してしまったから」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600180ha">
「もう、おじさんには止める術がないから」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14600190ko">
「じゃあ、おじさんを殺せば、こずぴぃは悪くなくなるの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600200ha">
「その剣は、君を殺すものにも、守るものにもなる」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600210ha">
「思い出してごらん？」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600220ha">
「空を見れば雲が」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600230ha">
「川を見れば流れが」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600240ha">
「そこにあったはず」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600250ha">
「それと同じこと」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600260ha">
「その剣はいつも君のそばにあった」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600270ha">
「自分自身の心を見てごらん」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600280ha">
「そこにあるのが、その剣なんだよ」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14600290ko">
「でも、殺したいって願ったら、これが手許にあったんだよ」

//【梢】
<<voice name="梢" class="こずえ" src="voice/ch07/14600300ko">
「この剣は、こずぴぃと、こずぴぃの周囲にあるあらゆるものを殺すためのものじゃないの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600310ha">
「負の感情は、否定されるものじゃない」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600320ha">
「人が誰しも持つものだからね」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600330ha">
「特別じゃないんだ」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600340ha">
「どう向き合うか、だよ」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600350ha">
「目をそらしてはいけない」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600360ha">
「自分を、否定してはいけない」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600370ha">
「世界は、鏡像」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600380ha">
「君の心の中にある正は」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600390ha">
「同時に負となり得るし」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600400ha">
「その逆もまた、可能」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600410ha">
「世界が終わるのか、生き続けるのか、それを選べるのは……」

//【波多野】
<voice name="波多野" class="はたの" src="voice/ch07/14600420ha">
「君たちだけなんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//※雨の音は継続
//～～Ｆ・Ｏ
	CreateColor("黒", 30000, 0, 0, 1280, 720, "BLACK");
	Fade("黒", 0, 0, null, true);
	Fade("黒", 1000, 1000, null, true);
	
	Delete("梢過去");
	Delete("背景*");
	Delete("黒");
	
	Wait(1000);


//ＢＧ//黒
	CreateColor("背景黒", 100, 0, 0, 1280, 720, "Black");
	Fade("背景黒", 0, 1000, null, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
結局、梢は男を殺さなかった。衝動は、話しているうちにいつの間にか霧散していた。

男の言葉の意味はよく分からなかった。
それでも、必死に考えて、やがて梢はひとつの結論に至った。

この剣は、自分。
否定せずに見れば。
自分を助けてくれた。

だから梢は、純粋な気持ちで、
この剣に、依存する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥもＦ・Ｏ～～
	Request("SE01", UnLock);
	SetVolume("SE01", 2000, 0, null);
	WaitAction("SE01", null);
	
	Delete("*");
	
	
//■インターミッション３１終了

}