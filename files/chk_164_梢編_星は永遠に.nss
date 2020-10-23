

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_164_梢編_星は永遠に";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_164_梢編_星は永遠に();
}


function chk_164_梢編_星は永遠に()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg043_01_1_学校中庭_a.jpg");

	Wait(1000);

	CreateSE("SE360101","SE_自然_風音_LOOP");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500730ko">
「……死んだの？」

//ＢＧ//学校中庭
{	FadeDelete("Black", 3000, false);
	MusicStart("SE360101",2000,700,0,1000,null,true);}
死んだ――

セナも、死んだ――

味方だったのに。
セナなら、僕とこずぴぃのこと、助けてくれるかもしれなかったのに。

こずぴぃが、殺した。

//※１０月３日修正、以下
//ディソードを、セナの胸に突き立てたまま。
//関節の外れた腕を、力なくぶら下げたまま。
//こずぴぃは、僕を見て――
//嬉しそうに、笑う。
//笑っているけど、心は――
友達の亡骸にディソードを突き立てたまま。
関節の外れた腕を、力なくぶら下げたまま。

こずぴぃは、泣き笑いの表情を浮かべた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Stand("st梢_制服_通常_血まみれ","shy2", 300, @+80);
	FadeStand("st梢_制服_通常_血まみれ_shy2", 500, true);

	CreateSE("SE01","SE_じん体_動作_尻餅");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//※１０月３日修正、以上
//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500740ko">
「セナしゃん、セナしゃん……返事して……一緒にガルガリ君……食べに行こうよ……
拓巳しゃんと３人で……また……写真撮って……また……」

心は、泣いていた。

//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500750ko">
「ねえ、拓巳しゃん……」

//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500760ko">
「セナしゃん、どうして返事してくれないのかな……どうして……」

セナは……死んだんだ……。

//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500770ko">
「殺しちゃった……殺しちゃったよぅ……」

{	MusicStart("SE01",0,1000,0,1000,null,false);
	DeleteStand("st梢_制服_通常_血まみれ_shy2", 500, true);}
こずぴぃはその場にしゃがみ込んだ。
息絶えたセナの遺体を、片手でそっと抱き起こして。

かつて、とてもキレイだった――今は血にまみれてしまっている――長い黒髪に、顔を埋めて。

//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500780ko">
「なんで……こんな……こずぴぃね、こんなこと……
望んでないのに……望んでなかったのに……！」

//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500790ko">
「セナしゃんのこと、好きだったのに……大好きだったのに……
お姉ちゃんみたいだなって思ってたのに……」

//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500800ko">
「なんで……？」

//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500810ko">
「なんで、こずぴぃは、セナしゃんのこと、殺したんだろ……？」

//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500820ko">
「なんで……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE360101", 1000, 0, null);

//ＳＥ//ヒュンヒュンという機械的な音
	CreateSE("SE01","SE_擬音_きかい_ひゅんひゅん2_LOOP");
	MusicStart("SE01",3000,1000,0,1000,null,true);

	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg043_01_1_学校中庭_a.jpg");
	CreateTextureEX("スパイダー", 200, 0, 0, "cg/bg/bg192_01_1_ダーススパイダーＵＰ_a.jpg");

	Wait(500);

//おがみ：音声：↓ダーススパイダー加工は必要なしか

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn04/01500830su">
「神光の救いッスよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Fade("スパイダー", 500, 1000, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3611003]
いつの間にか、ダーススパイダーのヘルメットをかぶった男が立っていた。手には拳銃。僕たちに向けていて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01500840ta">
「お……前……」

ダーススパイダー。
さっき殺したＤＱＮの言葉を思い出す。

ダーススパイダーに七海を“提供”してもらった、って……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01500850ta">
「お前……か……？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn04/01500860su">
「さあ、なんのことッスか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("スパイダー");

//ＳＥ//銃声
	CreateSE("SE02","SE_衝撃_じゅう声");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, false);
	Request("血", AddRender);

	Shake("back01", 500, 4, 13, 10, 10, 500, null, false);

	Fade("血", 100, 800, null, true);
	FadeDelete("血", 200, true);

	Wait(500);

	CreateSE("SE3601","SE_じん体_動作_尻餅");
	CreateSE("SE鼓動","SE_じん体_心臓_鼓動");
	MusicStart("SE鼓動", 0, 1000, 0, 1000, null, true);
	MusicStart("SE3601",0,1000,0,1000,null,false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01500870ta">
「がぁ……っ！」

撃たれた……！
足に激痛が走る。
たまらずその場に膝を突いた。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500880ko">
「拓巳しゃん！」

こずぴぃのディソードがうなる――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//斬る
//ＳＥ//ヘルメット壊れる
	CreateSE("SE001","SE_擬音_ディそーど_衝突2");
	CreateSE("SE002","SE_衝撃_すぱいだーめっと");

	CreateColor("フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);
	CreateColor("下地白", 1000, 0, 0, 1280, 720, "Whited");
	Fade("下地白", 0, 0, null, true);

	MusicStart("SE001", 0, 1000, 0, 1000, null, false);

	Fade("下地白", 0, 1000, null, true);
	FadeDelete("下地白", 500, true);

	MusicStart("SE002", 0, 1000, 0, 1000, null, false);

	Fade("フラッシュ", 0, 1000, null, true);
	Wait(500);
	Shake("back01", 500, 5, 0, 10, 10, 500, null, false);
	FadeDelete("フラッシュ", 500, true);

	CreateSE("SE02","SE_衝撃_じゅう声");
	CreateSE("SE03","SE_衝撃_せ中を押される");

	CreateColor("赤フラ", 2100, 0, 0, 1280, 720, "RED");
	Fade("赤フラ", 0, 0, null, true);
	Request("赤フラ", AddRender);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
ダーススパイダーのヘルメットが、まるで紙のように切り裂かれた。
中から出てきた顔は『将軍』ではなく端正な男の顔。

//ＳＥ//銃声
{	Fade("赤フラ", 0, 1000, null, true);
	Fade("赤フラ", 500, 0, null, false);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Wait(300);}
//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500890ko">
「……っ！」

{	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
//以上、リアル声
男が反撃し、こずぴぃは足から血を噴き出してくずおれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("血ループ", 1000, 0, 0, 1280, 720, "Red");
	Fade("血ループ", 0, 0, null, false);
	Request("血ループ", AddRender);

	Stand("st護_スーツ_通常","normal", 200, @-80);
	FadeStand("st護_スーツ_通常_normal", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn04/01500900su">
「おーっと、殺しはしないッスよ。ＣＯＤＥサンプルを取らせてもらわないといけないんで」

誰だこいつ？　何者だよ？
前にどこかで会ったような気もするけど、思い出せない。
そもそもなんで銃を持ってるんだ……。

でも、こいつだ……。
こいつが、セナの言ってた元凶だ……。

『将軍』の手先か？　それ以外の敵か？
どうだろうと知ったことじゃない。
とにかくこいつが元凶なんだ……！

こいつを、殺してやりたい……！

{	Fade("血ループ", 0, 1000, null, true);
	Fade("血ループ", 300, 0, null, true);}
だけど、足の痛みは尋常じゃなくて、立つことさえできなくて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//銃声
	CreateSE("SE02","SE_衝撃_じゅう声");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, false);
	Request("血", AddRender);

	Shake("back01", 500, 4, 13, 10, 10, 500, null, false);
	Fade("血ループ", 0, 200, null, true);
	DrawTransition("血ループ", 0, 250, 250, 100, null, "cg/data/effect.png", false);

	Fade("血", 100, 800, null, true);
	FadeDelete("血", 200, true);

	Wait(500);

	CreateSE("SE3601","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE3601",0,1000,0,1000,null,false);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
今度は肩。
衝撃を受けて地面に這いつくばる。
肉を弾丸に抉られ、熱と痛みで僕は悲鳴を上げてしまう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//銃声
	CreateSE("SE02","SE_衝撃_じゅう声");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, false);
	Request("血", AddRender);

	Shake("back01", 500, 4, 13, 10, 10, 500, null, false);
	Fade("血ループ", 0, 400, null, true);
	DrawTransition("血ループ", 0, 350, 350, 100, null, "cg/data/effect.png", false);

	Fade("血", 100, 800, null, true);
	FadeDelete("血", 200, true);

	Wait(500);

	CreateSE("SE3601","SE_衝撃_杭_落ちる_壁");
	MusicStart("SE3601",0,1000,0,1000,null,false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
さらに、腕。
握りしめていたナイフを取り落とす。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//銃声
	CreateSE("SE02","SE_衝撃_じゅう声");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, false);
	Request("血", AddRender);

	Shake("back01", 500, 4, 13, 10, 10, 500, null, false);
	Fade("血ループ", 0, 600, null, true);
	DrawTransition("血ループ", 0, 500, 500, 100, null, "cg/data/effect.png", false);

	Fade("血", 100, 800, null, true);
	FadeDelete("血", 200, true);

	DeleteStand("st護_スーツ_通常_normal", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604004]
全身から痛みの信号が脳を直撃し、もうどこを撃たれたのか分からない。
死ぬ……。こんな痛み、耐えられない……。

男が近づいてきた。

僕の顔をのぞき込んでから、背負っているリュックから奇妙なものを取り出す。それはヘッドギアのようなもので、コードがたくさん付いていて――。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2000, 300, null);


	FadeDelete("血ループ", 2000, false);

	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, false);

	Stand("bu梢_制服_武器構え2_血まみれ","angry", 300, @+320);
	Move("bu梢_制服_武器構え2_血まみれ_angry*", 0, @0, @100, null, true);
	Move("bu梢_制服_武器構え2_血まみれ_angry*", 500, @0, @-100, Dxl2, false);
	FadeStand("bu梢_制服_武器構え2_血まみれ_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500910ko">
「殺す――」

//以上、リアル声
{	Stand("st護_スーツ_通常","hard", 200, @-280);
	FadeStand("st護_スーツ_通常_hard", 300, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn04/01500920su">
「なに！？」

//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500930ko">
「殺してやる――」

//以上、リアル声
ゆらりと、こずぴぃが立ち上がっていた。
片足は引きずったまま。
ほとんど無理矢理、剣を構えて。

{	Stand("st護_スーツ_通常","cool", 200, @-280);
	FadeStand("st護_スーツ_通常_cool", 300, true);
	DeleteStand("st護_スーツ_通常_hard", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn04/01500940su">
「こいつ……！　化け物かよ……！」

{	Fade("血", 0, 1000, null, true);}
//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500950ko">
「殺してやる――！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//以上、リアル声
//ＳＥ//斬る
//ＳＥ//銃声
	SetVolume360("CH*", 2000, 0, NULL);
	SetVolume("SE01", 0, 0, null);
	SetVolume("SE鼓動", 0, 0, null);

	CreateSE("SE001","SE_擬音_ディそーど2");
	CreateSE("SE004","SE_擬音_梢ディそーど_振り回す");
	CreateSE("SE005","SE_擬音_ディそーど_コンクリート砕く");
	CreateSE("SE006","SE_じん体_血_噴きでる");
	CreateSE("SE007","SE_擬音_とどめ_ディそーど");
	CreateSE("SE02","SE_衝撃_じゅう声");

	MusicStart("SE001", 0, 800, 0, 1000, null, false);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateColor("フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 0, 1000, null, true);
	Fade("血", 0, 0, null, true);

	DeleteStand("bu梢_制服_武器構え2_血まみれ_angry", 0, true);
	DeleteStand("st護_スーツ_通常_cool", 0, true);

	MusicStart("SE003", 0, 800, 0, 1000, null, false);

	Wait(2000);
	FadeDelete("フラッシュ", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
剣が風を切る音と。
銃声が交錯して。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	MusicStart("SE004", 0, 800, 0, 1000, null, false);
	MusicStart("SE005", 0, 800, 0, 1000, null, false);
	MusicStart("SE006", 0, 800, 0, 1000, null, false);
	MusicStart("SE007", 0, 800, 0, 1000, null, false);

	Fade("血", 0, 1000, null, true);
	DrawTransition("血", 100, 0, 1000, 100, null, "cg/data/zoom1.png", true);

	Wait(2000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
男の身体がディソードによって叩き潰された。

//※１０月３日修正、以下
//文字通り、ぺしゃんこになった。
//※１０月３日修正、以上
断末魔を上げる間もなく、男は砕け散っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0.0);//――――――――――――――――――――――――――――――

	FadeDelete("血", 3000, true);


	Stand("bu梢_制服_通常_血まみれ","sad", 190, @+280);
	FadeStand("bu梢_制服_通常_血まみれ_sad", 800, true);

	Wait(500);
	CreateSE("SE03","SE_衝撃_どさっ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500960ko">
「う……う……」

//以上、リアル声
こずぴぃがうめき、血を吐く。
男が最期に放った銃弾は、こずぴぃの胸を朱色に染めていた。

{	Move("bu梢_制服_通常_血まみれ_sad*", 500, @0, @100, Axl2, false);
	DeleteStand("bu梢_制服_通常_血まみれ_sad", 500, true);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
力尽きたように、こずぴぃは花壇の花の中に仰向けに倒れ込む。

彼女のディソードを、無数の黒い粒子が包み込んでいた。
畏怖さえ感じさせた暴力の塊――美しくも残酷な剣の姿が、徐々に揺らいでいく。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500970ko">
「拓巳しゃん……こずぴぃね……もう……ダメみたい……」

僕は全身の痛みをこらえて、
こずぴぃが倒れているところへと這っていった。

さっきまで、あんなに全身が熱かったのに、今はひどく寒い。
真冬に水の中に飛び込んだかのような寒さ。身体の震えが止まらない。

指先の感覚が、失われつつある。
視界もぼやけてきた。

それでも必死に、色鮮やかな花の中に倒れているこずぴぃへと、手を伸ばす。

冷たくなった自分の指先に、こずぴぃの柔らかくて温かい指が触れた。
すがるように、求めるように、その指を握りしめる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＣＧ//花壇に横たわって空を見上げる梢と拓巳
	CreateTexture360("梢空見上げ２", 100, -240, 0, "cg/ev/ev136_01_1_梢空見上げ_a.jpg");
	Fade("梢空見上げ２", 0, 0, null, true);
	Fade("梢空見上げ２", 1000, 1000, null, true);

	BGMPlay360("chn04", 1000, 1000, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
こずぴぃにならって、僕も仰向けに横たわった。

血の匂いは、花の甘い香りにかき消された。
とても寒かったけど、こずぴぃの指の温かさと、背中越しに感じる土の温もりで、いくぶん楽になった。

空は高くて。とても広くて。

そしてなぜか――

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500980ko">
「ねえねえ……空が、とってもキレイだよ……」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500990ko">
「まるで、ぶちゅぶちゅさんをたーくさん散りばめたみたいで……」

そう、空の色が、次々と変わって、こずぴぃが言う通り、まるで色とりどりのビーズが空一面を覆っているように見えた。

服のポケットに、以前こずぴぃからもらったビーズのストラップが
入れっぱなしになっていたことを思い出す。

{	Move("梢空見上げ２", 2000, 0, @0, null, false);}
それを取り出して、こずぴぃと２人で、握りしめた。
もう、握力もほとんどなくなっていたけど、気にしなかった。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01501000ko">
「こずぴぃも、あんな風に空に浮かぶ、
ぶちゅぶちゅさんになりたいな……」

――なれるよ。

こんなくそったれな身体は捨てて。
こんなくそったれな世界は捨てて。

星になればいいんだ。

そうすれば、苦しみも、悲しみも、味わうことはなくなるから。
そうすれば、平穏な時間が訪れるから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("梢空見上げ１", 100, 0, 0, "cg/ev/ev136_02_1_梢空見上げ_a.jpg");
	Request("梢空見上げ１", Smoothing);
	Zoom("梢空見上げ１", 0, 1500, 1500, null, true);

	Fade("梢空見上げ１", 2000, 1000, null, false);
	Zoom("梢空見上げ１", 30000, 1000, 1000, Dxl2, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01501010ko">
「拓巳しゃんも、一緒に来てくれる……？」

――もちろん。

ずっと一緒だ。

こずぴぃだけは、僕を裏切らないでくれたから。

こずぴぃだけは、僕のために最後まで頑張ってくれたから。

だから僕も、こずぴぃを裏切らない。

だから僕も、こずぴぃのために最後まで付き合う。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01501020ko">
「ありがと……」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01501030ko">
「あのね、こずぴぃ……拓巳しゃんのこと、好きになっても……いいかなぁ？」

――いいよ。

薄れゆく意識の中で。
僕はそう答える。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg002_01_1_青空_a.jpg");
	Fade("back03", 1000, 1000, null, true);
	Delete("梢空見上げ２");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
握りしめたこずぴぃの手が、徐々に温もりを失っていくのが分かる。
僕の手を握っていた彼女の指から、力が抜けていくのが分かる。

それでも僕は、最後までその手を離さずに。
涙を、必死でこらえて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);

	CreateTexture360("back04", 200, 0, 0, "cg/bg/bg154_01_1_渋谷の白い空_a.jpg");
	Fade("back04", 0, 0, null, false);
	Fade("back04", 5000, 1000, null, false);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
見上げていた空が白くなっていく。
ぶちゅぶちゅさんがかき消されていく。

なにかが起こってるみたいだけど、そんなのもうどうでもいい。

ホッとしていた。
ぶちゅぶちゅさんが消えるところをこずぴぃが見なくて、よかった。

そっと目を閉じた。

それで、時間は止まる。
世界は、止まる。

{	Fade("フラッシュ", 6000, 1000, null, false);
	SetVolume360("chn04", 5000, 0, NULL);
	Wait(500);}
僕とこずぴぃの中で、{	Wait(2000);}空に浮かんでいた、
{	Wait(2000);}あのビーズのような色とりどりの星は、{	Wait(2000);}永遠になった――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,1000);//――――――――――――――――――――――――――――――

	Wait(1000);

	BGMPlay360Suspend("CHN_ED_kozue", 0, 1000, true);

	CreateTextureEX("back01", 200, 0, 0, "cg/bg/bg234_01_6_chnビーズコレクション_a.jpg");
	Fade("back01", 3000, 1000, null, true);

//エンディングへ

//	ClearAll(5000);
}

