//<continuation number="290">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_216_Ｂインターミッション５２ｂ";
		$GameContiune = 1;
		$Ｂルート = true;
		Reset();
	}

		ch10_216_Ｂインターミッション５２ｂ();
}


function ch10_216_Ｂインターミッション５２ｂ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//Ｂルート
//アイキャッチ
//■インターミッション５２ｂ
//ＳＥ//ヒュンヒュンという機械音
//↑すごく小さい音量で

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");

	CreateSE("SE01","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE01", 1000, 400, 0, 1000, null, true);

	CreateSE("SE10","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE10", 1000, 600, 0, 1000, null, true);

	Fade("back03", 1000, 1000, null, true);

	Delete("back10");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
井乃頭線の神泉駅は、渋谷から１駅。電車でわずか１分ほどで到着する駅だ。

駅自体がトンネルによってすっぽりと覆われ、ホームの端にある開口部からわずかに外光が入ってくる程度。

今は地震の影響で照明がすべて消えており、普段と比べてひどく薄暗い。

そのホームに、折原梢の身体を背負いながら、蒼井セナは足を踏み入れた。

切符を買う必要はなかった。

駅員がどこにも見当たらなかったし、券売機も使い物にならない。

線路を見ると、レールは一目で分かるほどに歪んでしまっていた。当然、電車は昨日から運行停止になっている。

梢は、ときおり苦しげな息遣いをするものの、その意識はなかった。

額には、乾いた血がべったりとこびりついている。

地震のとき、ビルの崩落に巻き込まれた梢は、それ以来ずっと目覚めずにいる。

ギガロマニアックスはその力で怪我を治すことはできない。

痛みが、否応なく怪我は現実のものだと脳に思い知らされるから。

“怪我をしていない”という周囲共通認識を作れない。
なかったことにはできない。

人間の本能が、それをさせてくれないのだ。

ましてや、意識を失っている相手との間に、周囲共通認識は築けない。
セナでは今の梢に手の施しようはなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","hard", 200, @+200);
	FadeStand("buセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
無人と化したホームにたどり着いたところで梢を背から下ろしたセナは、ホームの壁にそっともたせかけた。

その表情は厳しい。

下ろした梢を一瞥しただけで、すぐにその視線を駅構内へと戻す。そして、ある一点をじっとにらみつけて、ギリリと歯ぎしりした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buセナ_制服_通常_hard", 500, true);

	Stand("stセナ_制服_通常","hard", 200, @+250);
	FadeStand("stセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆激しい憤りのブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600010sn">
「…………」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600020sn">
「やっと、見つけた……！」

その視線の先。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back05", 500, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	Fade("back05", 500, 1000, null, true);
	DeleteStand("stセナ_制服_通常_hard", 0, true);
	Stand("st一成_浮浪者_通常","normal", 250, @-320);
	Stand("st玄一_スーツ_通常","normal", 200, @+320);
	FadeStand("st玄一_スーツ_通常_normal", 0, false);
	FadeStand("st一成_浮浪者_通常_normal", 0, true);
	FadeDelete("back05", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
薄暗いホームの奥に、並んで立つふたつの人影があった。

ひとりは、高級そうなスーツを着た長身の男。
全身から気品のある雰囲気を漂わせている。
背筋をピンと伸ばし、余裕のある笑みを唇に浮かべていた。

ひとりは、汚らしい服をまとったホームレス。
髪はボサボサで、髭も伸び放題だ。
うなだれているため、その表情をはっきりと確かめることができない。

あまりにも対照的な身なりの２人。

その２人が、ただ静かに、この無人と化した暗い駅のホームに立っていた。

そのどちらも、セナにとっては憎悪の対象だ。
野呂瀬玄一と、波多野一成。
忘れたくても忘れられない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back05", 500, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	Fade("back05", 300, 1000, null, true);
	DeleteStand("st玄一_スーツ_通常_normal", 0, false);
	DeleteStand("st一成_浮浪者_通常_normal", 0, true);
	Stand("stセナ_制服_通常","hard", 200, @+320);
	FadeStand("stセナ_制服_通常_hard", 0, true);
	Fade("back05", 300, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600030sn">
「母さんと、妹を殺した……その２人が、揃ってお出迎えか……」

かつて、セナの目の前で凄惨な最期を遂げた、彼女の母と妹。セナの家族を殺した張本人たち。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st一成_浮浪者_通常","normal", 250, @-320);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/21600040ha">
「私の本意ではなかったんだ、セナ」

ホームレスの男――波多野が、うなだれたまま寂しそうにつぶやいた。

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/21600050ha">
「あの実験を、止めようとした。だが、私ひとりでは、動き出した歯車は止められなかった」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/21600060ha">
「この男が――」

波多野が、チラリと野呂瀬の顔色を窺った。

野呂瀬はなにも言わない。あくまで余裕のある態度を崩さない。

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/21600070ha">
「この男が、実験の継続を、指示した」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/21600080ha">
「私は、あの結果を、望んではいなかった……」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/21600090ha">
「悪いのは、この男……野呂瀬なんだ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/21600100ha">
「分かってくれ、セナ」

その懺悔の言葉を、セナは反吐が出そうな想いで聞いていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","angry", 200, @+320);
	FadeStand("stセナ_制服_通常_angry", 300, true);
	DeleteStand("stセナ_制服_通常_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600110sn">
「お前は、母さんと妹を見殺しにした」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600120sn">
「それが、厳然とした事実だ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600130sn">
「悔いているなら、どうして逃げた？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/21600140ha">
「世界を、守るためだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600150sn">
「デタラメを……！」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21600160nr">
「親に逆らうのは感心しませんね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st一成_浮浪者_通常_normal", 500, true);
	Stand("st玄一_スーツ_通常","normal", 200, @-320);
	FadeStand("st玄一_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
そこで初めて、野呂瀬が声を発した。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21600170nr">
「確かに、君の家族が悲劇的な結末を迎えたのは、私が指示した結果です」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21600180nr">
「もう、じゅうぶんデータは取れていたのでね」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21600190nr">
「実に有意義な実験でした」

{	Stand("stセナ_制服_通常","rage", 200, @+320);
	FadeStand("stセナ_制服_通常_rage", 300, true);
	DeleteStand("stセナ_制服_通常_angry", 0, true);}
//◆押し殺した怒り
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600200sn">
「有意義……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//ＳＥ//共鳴音
//画面エフェクト//赤い光
	CreateSE("SE05","SE_衝撃_衝撃は_リアルぶーと");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Stand("stセナ_制服_武器構え","angry", 200, @+320);
	CreateColor("リアルブートフラッシュ", 500, 0, 0, 1280, 720, "RED");
	Request("リアルブートフラッシュ", AddRender);
	CreateColor("back10", 500, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);

	Fade("リアルブートフラッシュ", 100, 1000, null, true);
	Fade("back10", 0, 1000, null, false);



	DeleteStand("stセナ_制服_通常_rage", 0, false);
	FadeStand("stセナ_制服_武器構え_angry", 0, true);

	Fade("リアルブートフラッシュ", 600, 0, null, false);
	Fade("back10", 300, 0, null, true);
	Delete("back10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
手にしたディソードを、素早くリアルブートする。
衝撃波が、彼女の長い黒髪を揺らす。

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/21600210ha">
「この男を殺せ、セナ！」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/21600220ha">
「こいつが、元凶だ！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600230sn">
「言われなくても――！」

{	DeleteStand("stセナ_制服_武器構え_angry", 200, false);
	CreateSE("SE02","SE_擬音_ちを蹴る");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
セナはすでに、ホームの床を、強く蹴っていた。
剣を構えることなく、間合いを詰める。
驚異的な瞬発力。

狙いは、野呂瀬玄一。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("リアルブートフラッシュ");

	CreateSE("SE02","SE_擬音_ディそーど_人を切る");

//ＳＥ//ディソードを振る
//ＳＥ//首を切断
	CreateMovie360("ムービー", 500, Center, Middle, false, false, "dx/mv軌跡02.avi");

//	Request("ムービー", Play);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	DeleteStand("st玄一_スーツ_通常_normal", 0, true);

	WaitAction("ムービー", null);

	Delete("ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
ディソードが、なぎ払われた。
空気すらも切り裂き。
野呂瀬の首が飛んだ。

セナはそれを目で追う。

野呂瀬の飛んだ頭が。
空中で不意に歪み。
自分の父の顔へと変化するのを見た。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600240sn">
「……！？」

ハッとして。
目の前の首なしの身体を見る。

一瞬前までスーツを着ていたはずが、ホームレスのボロボロの格好だった。力を失って、ぐにゃりと背中から倒れ込んでいく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//人が倒れる音
	CreateSE("SE05","SE_衝撃_どさっ");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back05", 500, 0, 0, "cg/ev/ev094_01_1_セナ父首はね_a.jpg");
	Fade("back05", 500, 1000, null, true);

	CreateTextureEX("波多野", 200, Center, @0, "cg/st/st一成_浮浪者_通常_normal.png");
	Move("波多野", 0, @+160, @0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
セナは目を見開き、横に立っている波多野へ視線をやった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("波多野", 0, 1000, null, false);
	DrawTransition("波多野", 0, 0, 500, 500, null, "cg/data/random.png", true);
	Fade("back05", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
彼もまた、セナに向き直り。
髭で覆われた口に、嘲笑が浮かんだ。
モザイクがかかったように、顔が歪み。身体も歪み。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st護_スーツ_通常","normal", 200, @+200);
	DrawTransition("波多野", 500, 400, 0, 500, null, "cg/data/random.png", true);
	Delete("波多野");
	FadeStand("st護_スーツ_通常_normal", 500, true);

	BGMPlay360("CH01",0,1000,true);


	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//※セナの見知らぬ男＝諏訪
次の瞬間には、波多野が、セナの見知らぬ男の顔になっていた。

年齢も、顔つきも、雰囲気も、まるで父とは別人。

{	Fade("back05", 500, 1000, null, true);}
セナは混乱する。
たった今自分が飛ばした首を、もう一度まじまじと見やった。

弧を描いて飛んだ首はすでに落下し、血を床にぶちまけていた。

父の顔だった。
父の首だった。
セナは、目を離せなくなる。

――妄想による幻惑。

そう悟って。
セナの吐息が、浅く、荒くなっていく。

{	Stand("st護_スーツ_通常","normal", 200, @+200);
	FadeStand("st護_スーツ_通常_normal", 0, true);
	Fade("back05", 500, 0, null, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/21600250su">
「セナちゃんさあ」

さっきまで父だったはずの、今は別人である男が、セナの名を馴れ馴れしく呼んだ。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/21600260su">
「キミが今やったことって、結局お父さんと同じッスよね？」

//◆愕然としてブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600270sn">
「…………」

{	Fade("back05", 500, 1000, null, true);}
セナがこの半年、ずっと願ってきた結果。<k>
そのはずだった。<k>
そのはずなのに、セナは動揺に襲われてしまっている。

首だけになった父の目が、セナの方を向いていた。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/21600280su">
「父親の首跳ねて殺すって、エグいなあ」

//◆ショック
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/21600290sn">
「父……さ……ん……」

なぜ自分がこれほど精神的なショックを受けているのか。その理由が分からないまま、セナは自分の耳の奥で、ブチンとなにかが千切れる音を聞いた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume360("CH01", 2000, 0, null);

	ClearAll(1000);
	Wait(2000);

//～～Ｆ・Ｏ

//■インターミッション５２ｂ終了

//アイキャッチ

}