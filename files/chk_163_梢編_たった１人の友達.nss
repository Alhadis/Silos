//<continuation number="1030">

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_163_梢編_たった１人の友達";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_163_梢編_たった１人の友達();
}


function chk_163_梢編_たった１人の友達()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編
//ＢＧ//学校中庭

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg043_01_1_学校中庭_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕はこずぴぃに肩を貸して、中庭に出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_武器構え","hard", 200, @-120);
	FadeStand("stセナ_制服_武器構え_hard", 500, true);

	Wait(500);
	BGMPlay360("CH01", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
そこに、セナが待ち構えていた。

僕らを見ると、表情を険しくしてにらみつけてくる。
手にはディソード。すでにリアルブートされていて、赤い光を放っている。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500010sn">
「お前たちは、バカだ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500020sn">
「罠にはめられているんだ。すべて精神攻撃だ。その影響でみんなおかしくなっているにすぎない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500030sn">
「真の悪に気付け。元凶を叩かなければ、悪夢は終わらない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500040sn">
「ポーターだ。リュックを背負っているヤツらがどこかにいるはず。そいつらが妄想攻撃を――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面_血まみれ","sigh", 300, @+250);
	FadeStand("bu梢_制服_正面_血まみれ_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500050ko">
「セナしゃんは、こずぴぃの味方？　味方だよね？」

{	Stand("stセナ_制服_武器構え","sad", 200, @-120);
	FadeStand("stセナ_制服_武器構え_sad", 300, true);
	DeleteStand("stセナ_制服_武器構え_hard", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500060sn">
「梢……」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500070ko">
「真の悪って、な～に？　その影響があるから、なんなのかな？」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500080ko">
「こずぴぃと拓巳しゃんを攻撃してきたゴキさんたちはね、自動的に敵だよ～。だから、殺すの」

{	Stand("bu梢_制服_正面_血まみれ","sad", 300, @+250);
	FadeStand("bu梢_制服_正面_血まみれ_sad", 300, true);
	DeleteStand("bu梢_制服_正面_血まみれ_sigh", 0, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500090ko">
「殺したくない……」

こずぴぃの心の声がまた矛盾している。
混乱しているんだ……。

{	Stand("stセナ_制服_武器構え","angry", 200, @-120);
	FadeStand("stセナ_制服_武器構え_angry", 300, true);
	DeleteStand("stセナ_制服_武器構え_sad", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500100sn">
「それが敵の思う壺なんだ！」

{	Stand("bu梢_制服_拒絶_血まみれ","pinch", 300, @+250);
	FadeStand("bu梢_制服_拒絶_血まみれ_pinch", 500, false);
	DeleteStand("bu梢_制服_正面_血まみれ_sad", 500, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500110ko">
「みんなでストーカーしてくるんだもん……怖いんだもん……こずぴぃが、こずぴぃでなくなっちゃいそうになるんだもん……」

僕だってそうだ。

あのケータイのシャッター音。そして車椅子が軋む音。その音を聞くだけで僕の心は砕けそうになる。

我を失い、殺意に身を委ねたくなる。
と言うか、すでに我を失ってしまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_武器構え","hard", 200, @-120);
	FadeStand("stセナ_制服_武器構え_hard", 300, true);
	DeleteStand("stセナ_制服_武器構え_angry", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500120sn">
「お前たちは、なにと戦っているのか把握しているのか？」

敵が誰なのかは分からない。分からなくなってしまった。『将軍』なのか、それ以外の何者かなのか。自分が誰から攻撃されているのかさえ分からない。

唯一はっきりしているのは、この世のすべてが敵になったっていうことだけ。

{	Stand("stセナ_制服_武器構え","angry", 200, @-120);
	FadeStand("stセナ_制服_武器構え_angry", 300, true);
	DeleteStand("stセナ_制服_武器構え_hard", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500130sn">
「妄想に惑わされるな！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500140sn">
「お前たちは自分の妄想によって殺されようとしている」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500150sn">
「梢、それ以上ディソードを使うんじゃない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500160sn">
「負の物質がお前の心と身体を侵食しているんだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500170sn">
「まともに歩けなくなっているんだろ？　このままだとお前という存在が崩壊する」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//※１０月３日修正、以下
//【セナ】
//<voice name="セナ" class="セナ" src="voice/chn04/01500180sn">
//「負の妄想に、食われているんだ……！」
//このセリフカットします。
//※１０月３日修正、以上

	Stand("bu梢_制服_正面_血まみれ","sad", 300, @+250);
	FadeStand("bu梢_制服_正面_血まみれ_sad", 300, false);
	DeleteStand("bu梢_制服_拒絶_血まみれ_pinch", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500190ko">
「セナしゃんは、こずぴぃたちの味方？」

もう一度、こずぴぃは同じことを聞いた。
救いを求めるような声音。
僕も固唾を呑んで、セナの答えを待った。

期待なんかしてない。
してないけど、それでも――

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500200sn">
「私は」

{	Stand("stセナ_制服_武器構え","hard", 200, @-120);
	FadeStand("stセナ_制服_武器構え_hard", 300, true);
	DeleteStand("stセナ_制服_武器構え_angry", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500210sn">
「お前たちの味方だ」

きっぱりと。セナは答えた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500220sn">
「お前たちを攻撃している敵は、私が倒す」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500230sn">
「だから、もう妄想するな……！」

助かった……。
こずぴぃの他にも、味方がいてくれたんだ……。

こずぴぃはのろのろと剣を下ろした。

{	SetVolume360("CH*", 2000, 0, NULL);
	Stand("bu梢_制服_通常_血まみれ","sad", 300, @+250);
	FadeStand("bu梢_制服_通常_血まみれ_sad", 300, false);
	DeleteStand("bu梢_制服_正面_血まみれ_sad", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500240ko">
「よかった……」

{	Stand("bu梢_制服_通常_血まみれ","shy", 300, @+250);
	FadeStand("bu梢_制服_通常_血まみれ_shy", 300, true);
	DeleteStand("bu梢_制服_通常_血まみれ_sad", 0, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500250ko">
「セナしゃん、大好きなのら……」

//※１０月３日修正、以下
//こずぴぃはセナに向けて嬉しそうな笑みを浮かべ。
//※１０月３日修正、以上
目尻に涙を浮かべて。
こずぴぃはセナにすがるような視線を向け。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg043_01_1_学校中庭_a.jpg");

//以下のセナＶＳ梢のどこかにＣＧ一枚使ってください
//ＳＥ//斬る
	CreateSE("SE01","SE_擬音_ディそーど2");

	CreateMovie360("斬ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");
//	Request("斬ムービー", Play);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	DeleteStand("bu梢_制服_通常_血まみれ_shy", 0, true);
	DeleteStand("stセナ_制服_武器構え_hard", 0, true);

	WaitAction("斬ムービー", null);

	Fade("斬ムービー", 500, 0, null, true);
	Delete("斬ムービー");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
いきなりディソードで斬りつけた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//剣戟の音
	CreateSE("SE02","SE_擬音_ディそーど同士ぶつかる");
	CreateSE("SE03","SE_衝撃_どさっ");
	CreateColor("フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Fade("フラッシュ", 0, 1000, null, false);
	Wait(500);
	Shake("back01", 500, 50, 50, 0, 0, 500, null, false);
	FadeDelete("フラッシュ", 500, true);

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3701005]
とっさにセナはその一撃を剣で受け止める。
だが衝撃が強すぎたのか、あっけなく吹っ飛ばされた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500260sn">
「……！？　梢、なにを……！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01500270ta">
「こずぴぃ！？」

セナは味方だって言ってくれたのに！
なんで殺そうとしてるんだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH26", 0, 1000, true);
	CreateSE("SE03","SE_擬音_ちを蹴る");

	Stand("st梢_制服_武器構え2_血まみれ","sad", 300, @+250);
	FadeStand("st梢_制服_武器構え2_血まみれ_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//◆心の//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500280ko">
「違う、こずぴぃじゃない……！」

そんな心の声を発しながら、倒れ込んでいるセナに向けて剣を振りかぶる。

{	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Move("st梢_制服_武器構え2_血まみれ_sad*", 300, @-200, @50, Axl2, false);
	DeleteStand("st梢_制服_武器構え2_血まみれ_sad", 300, true);}
//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500290ko">
「こずぴぃじゃないよぉ！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500300sn">
「くっ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//斬る
	CreateSE("SE01","SE_擬音_ディそーど2");
	CreateSE("SE02","SE_擬音_ディそーど_コンクリート砕く");
	CreateColor("下地白", 1000, 0, 0, 1280, 720, "Whited");

	CreateMovie360("斬ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");
	Rotate("斬ムービー", 0, @0, @0, @180, null,true);

//	Request("斬ムービー", Play);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Shake("back01", 2000, 0, 50, 0, 0, 500, null, false);

	WaitAction("斬ムービー", null);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	FadeDelete("下地白", 500, false);
	Fade("斬ムービー", 500, 0, null, true);
	Delete("斬ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
振り下ろされた強烈な一撃。
セナは間一髪で地面を転がり、それをかわす。

素早く立ち上がると、ディソードを構えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_武器構え","hard", 200, @-280);
	Move("stセナ_制服_武器構え_hard*", 0, @0, @50, null, true);
	Move("stセナ_制服_武器構え_hard*", 500, @0, @-50, Dxl1, false);
	FadeStand("stセナ_制服_武器構え_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603005]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500310sn">
「私を……殺すつもりか、梢」

//※１０月３日修正、以下
//こずぴぃはとても楽しそうに、ニコニコしたままで。
//でも涙を流していて。
//※１０月３日修正、以上
こずぴぃは涙を流しながら、いやいやをするように首を左右に振る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_武器構え2_血まみれ","sad", 300, @+280);
	FadeStand("st梢_制服_武器構え2_血まみれ_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604005]
//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500320ko">
「違うよ……手が、勝手に……
　助けて……セナしゃん、拓巳しゃん……！」

なんだよそれ、いったいどういうことだ！？

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500330sn">
「負の妄想に取り憑かれてしまっている……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500340sn">
「自分でディソードを制御できていないのか……！」

じゃあ、こずぴぃの意志に関係なく、殺人マシーンにでもなっちゃってるっていうの！？

{	Stand("stセナ_制服_武器構え","angry", 200, @-280);
	FadeStand("stセナ_制服_武器構え_angry", 300, true);
	DeleteStand("stセナ_制服_武器構え_hard", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500350sn">
「梢、ディソードを消せ！」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500360ko">
「で、できない……できないのら！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//斬る
//ＳＥ//剣戟
	CreateSE("SE01","SE_擬音_ディそーど2");
	CreateSE("SE02","SE_擬音_ディそーど同士ぶつかる");

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateColor("下地白", 1000, 0, 0, 1280, 720, "White");
	Fade("下地白", 0, 0, null, true);
	Request("下地白", AddRender);
	Fade("下地白", 0, 1000, null, true);
	DrawTransition("下地白", 100, 0, 1000, 100, null, "cg/data/lcenter.png", true);

	DeleteStand("stセナ_制服_武器構え_angry", 0, true);
	DeleteStand("st梢_制服_武器構え2_血まみれ_sad", 0, true);

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Wait(500);
	FadeDelete("下地白", 500, false);
	Shake("back01", 1000, 0, 50, 0, 0, 500, null, false);

	Wait(600);

	Stand("stセナ_制服_武器構え","angry", 200, @-280);
	Move("stセナ_制服_武器構え_angry*", 0, @100, @50, null, true);
	Move("stセナ_制服_武器構え_angry*", 300, @-100, @-50, Dxl2, false);
	FadeStand("stセナ_制服_武器構え_angry", 300, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500370sn">
「こいつ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("st梢_制服_武器構え2_血まみれ","mad", 300, @+280);
	Move("st梢_制服_武器構え2_血まみれ_mad*", 0, @-100, @50, null, true);
	Move("st梢_制服_武器構え2_血まみれ_mad*", 300, @100, @-50, Dxl2, false);
	FadeStand("st梢_制服_武器構え2_血まみれ_mad", 500, true);

	CreateSE("SE03","SE_擬音_ちを蹴る");
	CreateSE("SE04","SE_擬音_ちを蹴る");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//以下、リアル声
//◆リアル声//◆小声でぶつぶつと
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500380ko">
「殺す殺す殺す殺す殺す殺す殺す殺す殺す――」

//以上、リアル声
声が、する。

心の声じゃなくて。

こずぴぃの、生の声。

“殺す”って連呼している。
心の声とは裏腹に。

{	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	DeleteStand("st梢_制服_武器構え2_血まみれ_mad", 300, true);}
//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500390ko">
「助けて……！　こんなのやだぁ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01500400ta">
「セナ、こずぴぃを、た、助けてあげてよ！」

僕にはそう訴えるしか能がない。
あの戦いに入っていけるはずがない。

{	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	DeleteStand("stセナ_制服_武器構え_angry", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500410sn">
「妄想を見せて無力化を――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//剣戟
	CreateSE("SE01","SE_擬音_ディそーど2");
	CreateSE("SE02","SE_擬音_ディそーど同士ぶつかる");
	CreateSE("SE03","SE_擬音_ディそーど落ちる");

	CreateColor("下地白", 1000, 0, 0, 1280, 720, "Whited");
	CreateColor("フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);

	CreateMovie360("斬ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");
	Rotate("斬ムービー", 0, @0, @0, @180, null,true);

//	Request("斬ムービー", Play);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	FadeDelete("下地白", 500, false);

	Fade("斬ムービー", 500, 0, null, true);
	Delete("斬ムービー");

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Fade("フラッシュ", 200, 1000, null, false);
	Wait(500);
	Shake("back01", 500, 0, 10, 0, 0, 700, null, false);

	FadeDelete("フラッシュ", 500, true);

	Stand("stセナ_制服_武器構え","angry", 200, @-280);
	Move("stセナ_制服_武器構え_angry*", 0, @0, @50, null, true);
	Shake("stセナ_制服_武器構え_angry*", 300, 10, 0, 0, 0, 500, null, false);
	Move("stセナ_制服_武器構え_angry*", 300, @0, @-50, Dxl2, false);
	FadeStand("stセナ_制服_武器構え_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500420sn">
「くっ――！」

こずぴぃの攻撃は圧倒的だった。

ただひたすら、ディソードを振り回す。
あまりに愚直で、バカの一つ覚えのような攻撃。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Stand("st梢_制服_武器構え2_血まみれ","sad", 300, @+280);
	FadeStand("st梢_制服_武器構え2_血まみれ_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500430ko">
「殺したくないのに……セナしゃんのこと殺したくないのに！」

身体がよろけても、足がもつれても、顔がセナの方を向いていなくても、こずぴぃの持つディソードは正確に、セナの身体を両断しようと閃く。

//以下、リアル声
//◆リアル声//◆小声でぶつぶつと
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500440ko">
「殺す殺すぶち殺すぶち殺してやる――」

//以上、リアル声
むちゃくちゃな体勢から繰り出される、でたらめな攻撃。
その一振り一振りが、ことごとく重く、鋭い。

セナは押されている。
その顔には焦り。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500450sn">
「この――！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//剣戟
	CreateSE("SE01","SE_擬音_ディそーど2");
	CreateSE("SE02","SE_擬音_ディそーど同士ぶつかる");

	CreateColor("フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);
	CreateColor("下地白", 1000, 0, 0, 1280, 720, "White");
	Fade("下地白", 0, 0, null, true);
	CreateColor("下地白２", 1000, 0, 0, 1280, 720, "White");
	Fade("下地白２", 0, 0, null, true);

	Move("stセナ_制服_武器構え_angry*", 300, @300, @0, Axl2, false);
	Move("st梢_制服_武器構え2_血まみれ_sad*", 300, @-300, @0, Axl2, false);
	DeleteStand("stセナ_制服_武器構え_angry", 300, false);
	DeleteStand("st梢_制服_武器構え2_血まみれ_sad", 300, true);


	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Zoom("back01", 300, 1500, 1500, Dxl2, false);
	Fade("back01", 300, 0, null, true);


	Fade("下地白２", 0, 1000, null, true);
	DrawTransition("下地白２", 100, 0, 200, 100, null, "cg/data/ncenter1.png", true);
	FadeDelete("下地白２", 200, false);
	Wait(100);
	Fade("下地白", 0, 1000, null, true);
	DrawTransition("下地白", 100, 0, 500, 100, null, "cg/data/ncenter2.png", true);
	FadeDelete("下地白", 200, true);

	Wait(100);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Zoom("back01", 0, 1000, 1000, null, true);
	Fade("back01", 0, 1000, null, true);
	Shake("back01", 500, 10, 0, 0, 0, 700, null, false);

	Fade("フラッシュ", 0, 1000, null, true);
	Wait(100);
	FadeDelete("フラッシュ", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
互いのディソードが激突した。

弾かれたのはセナの方。

ガードを崩される。

こずぴぃのディソードは物理法則を無視した切り返しを見せた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//斬る
	CreateColor("下地赤", 1000, 0, 0, 1280, 720, "Red");

	CreateSE("SE01","SE_擬音_ディそーど2");
//	Request("斬ムービー", Play);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateColor("下地白", 1000, 0, 0, 1280, 720, "Whited");
	Request("下地白", AddRender);
	Fade("下地白", 0, 1000, null, true);
	DrawTransition("下地白", 100, 0, 500, 100, Dxl2, "cg/data/ncenter2.png", true);
	DrawTransition("下地白", 100, 500, 0, 100, Axl2, "cg/data/ncenter2.png", false);
	FadeDelete("下地白", 200, true);

	Delete("back*");

	CreateSE("SE03","SE_じん体_血_噴きでる");

	CreateMovie360("血ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");
//	Request("血ムービー", Play);

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	WaitAction("血ムービー", null);

	FadeDelete("下地赤", 500, false);

	Fade("血ムービー", 500, 0, null, true);
	Delete("血ムービー");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//※１０月３日修正、以下
//内臓を飛び散らせて斬り伏せられる。
彼女のスレンダーな身体から血しぶきが噴き上がり――

//こずぴぃがニヤリと唇を歪め――
//※１０月３日修正、以上
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500460sn">
「それは妄想だっ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CreateSE("SE01","SE_衝撃_肩にぶつかる");
	CreateSE("SE02","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE01",0,1000,0,1000,null,false);

	CreateTexture360("羽交い絞め", 500, -1024, 0, "cg/ev/ev135_01_1_セナVS梢_a.jpg");
	CreateTexture360("ブラー用１", 600, -1024, 0, "cg/ev/ev135_01_1_セナVS梢_a.jpg");
	CreateTexture360("ブラー用２", 700, -1024, 0, "cg/ev/ev135_01_1_セナVS梢_a.jpg");
	CreateTexture360("下敷き", 40, 0, 0, "cg/ev/ev135_01_1_セナVS梢_a.jpg");
	Request("羽交い絞め", Smoothing);

	Shake("ブラー用２", 1000, 0, 5, 0, 0, 700, null, false);
	Move("ブラー用２", 500, @+1024, @0, Dxl2, false);
	Wait(300);
	FadeDelete("ブラー用２", 300, false);

	MusicStart("SE02",0,1000,0,1000,null,false);

	Shake("ブラー用１", 1000, 0, 5, 0, 0, 700, null, false);
	Move("ブラー用１", 500, @+1024, @0, Dxl2, false);
	Wait(300);
	FadeDelete("ブラー用１", 300, false);


	Shake("羽交い絞め", 1000, 0, 5, 0, 0, 700, null, false);
	Move("羽交い絞め", 1000, @+1024, @0, Dxl2, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
セナはこずぴぃの背後に回り込んでいた。

斬られたセナの死体が消失。

ハッとするこずぴぃを、セナは羽交い締めにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_衝撃_どさっ");
	CreateSE("SE02","SE_じん体_動作_のぞく");
	CreateSE("SE03","SE_擬音_ディそーど_空を切る1");
	MusicStart("SE01",0,1000,0,1000,null,false);

	MusicStart("SE02",0,1000,0,1000,null,false);

	CreateTexture360("羽交い絞め２", 600, 0, 0, "cg/ev/ev135_01_1_セナVS梢_a.jpg");
	Fade("羽交い絞め２", 0, 0, null, true);
	Request("羽交い絞め２", Smoothing);
	Shake("羽交い絞め２", 1000, 2, 5, 0, 0, 700, null, false);
	Fade("羽交い絞め２", 500, 1000, null, true);

	Delete("羽交い絞め");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500470sn">
「ディソードを捨てろ、梢！」

//以下、リアル声
//◆リアル声//◆小声でぶつぶつと
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500480ko">
「離せ離せ離せ離せ離せ離せぇっ」

//以上、リアル声
//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500490ko">
「殺して……こずぴぃのこと殺して、セナしゃん……」

//以下、リアル声
//◆リアル声//◆小声でぶつぶつと
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500500ko">
「こずぴぃは悪くない、こずぴぃは悪くない、みんなが悪いんだ……」

//以上、リアル声
//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500510ko">
「こんな自分、もう見たくない……セナしゃんも殺したくない……だから……」

こずぴぃの心と身体が――

矛盾してしまっている。
分断されてしまっている。

セナの拘束から逃れようと、その小さな身体を暴れさせ。
心の中で、泣いている。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500520sn">
「頼む、剣を捨ててくれ、梢……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500530sn">
「元に戻ってくれ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500540sn">
「私はお前を見捨てたりしない……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500550sn">
「お前は、私の、たった１人の友達で――」

セナの瞳が濡れていた。
あのセナが泣いていて――

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500560ko">
「ダメっ」

{	MusicStart("SE03",0,1000,0,1000,null,false);
	Move("羽交い絞め２", 300, @-544, 0, AxlDxl, true);}
そのとき、こずぴぃの腕がおかしな動きをした。

本来曲がるはずのない方へと――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("@CH*", 500, 0, null);

//ＳＥ//関節外れる音
	Shake("羽交い絞め２", 700, 7, 5, 0, 0, 700, null, false);
	Zoom("羽交い絞め２", 0, 2000, 2000, null, true);
	Rotate("羽交い絞め２", 0, @0, @0, @-20, null,true);
	Move("羽交い絞め２", 0, @-80, @80, null, true);
	CreateSE("SE04","SE_擬音_間接外れ");
	CreateSE("SE05","SE_擬音_間接外れ");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500570ko">
「ぁ――――っ！」

//以上、リアル声
関節が外れた鈍い音。
こずぴぃの声にならない絶叫。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500580sn">
「……！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――



//※１０月３日修正、以下
//ＳＥ//斬る
//ＳＥ//血が出る

	CreateSE("SE01","SE_擬音_ディそーど2");
	CreateSE("SE02","SE_擬音_ディそーど_人を切る");
	CreateSE("SE03","SE_じん体_血_噴きでる");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateColor("下地赤", 1000, 0, 0, 1280, 720, "Red");
	CreateMovie360("血ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");

//	Request("血ムービー", Play);

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	WaitAction("血ムービー", null);

	Fade("血ムービー", 500, 0, null, true);
	Delete("血ムービー");
	Delete("羽交い絞め２");

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg043_01_1_学校中庭_a.jpg");
	FadeDelete("下地赤", 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//気が付いたときには、こずぴぃの無骨なディソードが、羽交い締めにしているセナの足を、太ももから切断していた。
気が付いたときには、こずぴぃの無骨なディソードが、羽交い締めにしているセナの背に添えられて。

のこぎりで挽くように、刃が食い込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//血が出る
	CreateSE("SE05","SE_擬音_肉手を突っ込む");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	CreateColor("痛い", 1000, 0, 0, 1280, 720, "Red");
	Fade("痛い", 0, 0, null, true);
	Fade("痛い", 100, 800, null, true);
	FadeDelete("痛い", 100,. true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602009]
セナの服がみるみるうちに赤くにじんでいく。
歯噛みし、こずぴぃを突き飛ばしてセナは身を離した。

でも遅かった。

振り向きざまに、こずぴぃがディソードを横凪ぎに払った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//斬る
//ＳＥ//血が出る
	CreateSE("SE01","SE_擬音_ディそーど2");
	CreateSE("SE02","SE_じん体_動作_滑って転ぶ");
	CreateSE("SE03","SE_じん体_血_噴きでる");

	CreateColor("下地赤", 1000, 0, 0, 1280, 720, "Red");
	CreateMovie360("斬ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");

//	Request("斬ムービー", Play);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	WaitAction("斬ムービー", null);
	Delete("斬ムービー");

	CreateMovie360("血ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");
//	Request("血ムービー", Play);

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	WaitAction("血ムービー", null);

	FadeDelete("下地赤", 500, false);
	Fade("血ムービー", 500, 0, null, true);

	Delete("血ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603009]
セナの脇腹が切り裂かれる。

//※１０月３日修正、以上
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500590sn">
「あ、ああ、ああああ――っ！」

{	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
激痛にのたうち回るセナに向けて。
こずぴぃはディソードを突き付ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, NULL);

	Stand("st梢_制服_正面_血まみれ","sigh", 300, @+100);
	FadeStand("st梢_制服_正面_血まみれ_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//◆心の声//◆心の声も泣きそうです
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01500600ko">
「セナしゃん……逃げて……」

//以下、リアル声
//◆リアル声//◆小声でぶつぶつと
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500610ko">
「死んじゃえ死んじゃえ死んじゃえ死んじゃえ死んじゃえ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH22", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600010]
//以上、リアル声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500620sn">
「梢……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500630sn">
「済まない……済ま……ない……」

//以下、リアル声
//◆リアル声//◆小声でぶつぶつと
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500640ko">
「死んじゃえ死んじゃえ死んじゃえ死んじゃえ死んじゃえ」

//以上、リアル声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500650sn">
「お前のこと、助けて……やれなくて……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500660sn">
「私のこと、慕ってくれたのに……
　私は、お前の力に……なれなくて……」

//以下、リアル声
//◆リアル声//◆小声でぶつぶつと
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500670ko">
「死んじゃえ死んじゃえ死んじゃえ死んじゃえ死んじゃえ」

//以上、リアル声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500680sn">
「お前のＳＯＳに……もっと……早く、気付いて……あげられたら……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500690sn">
「梢と話している……時間が、私にとって……唯一……ホッとできる時間……だった……」

//以下、リアル声
//◆リアル声//◆小声でぶつぶつと
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500700ko">
「死んじゃえ死んじゃえ死んじゃえ死んじゃえ死んじゃえ」

//以上、リアル声
//◆「ありがとう」と言おうとした
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn04/01500710sn">
「慕ってくれて……ありが……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 0, 0, NULL);
//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//以下、リアル声
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01500720ko">
「死ね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_正面_血まみれ_sigh", 0, true);

//以上、リアル声
//ＳＥ//斬る
//ＳＥ//血が噴き出す

	CreateSE("SE01","SE_擬音_ディそーど_さす");
	CreateSE("SE03","SE_擬音_とどめ_ディそーど");

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(1000);

	CreateColor("下地赤", 2200, 0, 0, 1280, 720, "Red");
	Fade("下地赤", 0, 0, null, true);

	CreateMovie360("血ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Fade("下地赤", 0, 1000, null, true);
	DrawTransition("下地赤", 3000, 0, 1000, 100, Dxl1, "cg/data/effect.png", false);

//	Request("血ムービー", Play);

	WaitAction("下地赤", null);
	Delete("血ムービー");
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602010]
//※１０月３日追加、以下
――直視できなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	FadeDelete("下地赤", 4000, true);

//※１０月３日追加、以上
//しばらく間を置いて
	
	Wait(2000);
}

