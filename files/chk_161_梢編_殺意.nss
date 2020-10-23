//<continuation number="470">

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_161_梢編_殺意";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_161_梢編_殺意();
}


function chk_161_梢編_殺意()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編
//ＢＧ//学校廊下
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg019_02_1_学校廊下_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);
	Wait(1000);

	CreateSE("SE3601","SE_はいけい_教室ざわめき_LOOP");
	MusicStart("SE3601",2000,1000,0,1000,null,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
廊下を歩く。

外に出ようかとも思ったけど、僕らは２人とも血まみれだ。こずぴぃはまともに歩けないし、このまま外に出ても警察と鉢合わせするのがオチのような気がした。

どこか、空き教室にでも身を隠すのがいいかもしれない。

空気が張り詰めている。さっきの悲鳴をきっかけに、校内のざわめきは徐々に大きくなってきていた。

慌てた様子で何人かの教師がすれ違っていく。
生徒たちはホームルームそっちのけで教室から出て、なにが起こったのかと不安げに周囲を見回している。

まずい、人が多すぎる……。
これじゃ外に出た方がマシだったかも。

どこかに隠れなきゃ。
どこかに――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 100, 500, null);

//ＳＥ//ケータイカメラのシャッター音
	CreateSE("SE01","SE_はいけい_ケータイ_しゃったー");
	CreateSE("SE02","SE_はいけい_ケータイ_しゃったー");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(200);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	SetVolume("SE3601", 2000, 1000, null);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
……まただ。

また、あの音だ。
やめろ……やめてくれ……。
頭がおかしくなりそうだ……。

僕を遠巻きに見ている数人の生徒がいた。生徒だけじゃない、教師も何人か姿が見える。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("鏡反射", 1000, 0, 0, 1280, 720, "White");
	Request("鏡反射", AddRender);
	Fade("鏡反射", 0, 0, null, true);
	Fade("鏡反射", 0, 500, null, true);
	DrawTransition("鏡反射", 100, 0, 1000, 200, null, "cg/data/ncentern2.png", true);
	DrawTransition("鏡反射", 150, 1000, 0, 200, null, "cg/data/ncenter2.png", false);
	FadeDelete("鏡反射", 100, true);
	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
その全員が、こっちにケータイを向けていた。
なぜか空いている方の手には手鏡を持っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 200, 400, null);

//ＳＥ//ケータイカメラのシャッター音
	CreateSE("SE01","SE_はいけい_ケータイ_しゃったー");
	CreateSE("SE02","SE_はいけい_ケータイ_しゃったー");
	CreateSE("SE03","SE_はいけい_ケータイ_しゃったー");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(500);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Wait(200);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Wait(1000);

	CreateSE("SE3610","SE_じん体_心臓_鼓動");
	MusicStart("SE3610",0,1000,0,1000,null,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
僕の脳裏に、どす黒い怒りと殺意が芽生えた。
なにかが、壊れてしまいそうだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_拒絶_血まみれ","pinch", 200, @-150);
	FadeStand("bu梢_制服_拒絶_血まみれ_pinch", 0, true);

	Fade("Black", 500, 0, null, true);
	Delete("Black");
	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300010ko">
「殺してやる――」

僕の殺意と連動したのか、こずぴぃの心の声も強烈な殺気を放った。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300020ko">
「殺してやる殺してやる殺してやる――」

こずぴぃは鏡に反応していた。
歩くのも辛そうなのに、その手に持つディソードを振り上げる。

こずぴぃ、ダメだ！

彼女の小さな身体を抱き留め、僕はその場から離れようとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3610", 1000, 0, null);


	DeleteStand("bu梢_制服_拒絶_血まみれ_pinch", 300, true);

	CreateSE("SE3602","SE_衝撃_ひととぶつかる");
	MusicStart("SE3602", 0, 1000, 0, 1000, null, false);

	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg019_02_1_学校廊下_a.jpg");

	Shake("back01", 500, 10, 0, 0, 0, 500, null, false);

	CreateSE("SE02","SE_擬音_ちを蹴る");
	CreateSE("SE3612","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	MusicStart("SE3612", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300030ko">
「殺してやる――！」

でも、できなかった。

こずぴぃの身体が、すごい勢いで僕の手を振り払う。
剣に引っ張られるようにして、こずぴぃが鏡を持った集団へ突進する。

足がもつれていた。
ほとんど転びそうだった。

にもかかわらずあの巨大なディソードを振り回し――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3612", 500, 0, null);

	CreateSE("SE3601","SE_擬音_ディそーど_人を切る");
	CreateSE("SE3602","SE_擬音_ディそーど_人を切る");
	CreateSE("SE3603","SE_擬音_ディそーど_人を切る");
	CreateSE("SE3604","SE_擬音_ディそーど_人を切る");


//ＳＥ//斬る
//ＳＥ//血が飛び散る
	CreateSE("SE01","SE_擬音_ディそーど2");
	CreateSE("SE02","SE_じん体_血_噴きでる");
	CreateColor("下地赤", 1000, 0, 0, 1280, 720, "Red");

	CreateMovie360("斬ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");
//	Request("斬ムービー", Play);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Wait(200);
	MusicStart("SE3601",0,1000,0,1000,null,false);
	Wait(100);
	MusicStart("SE3602",0,1000,0,1000,null,false);
	Wait(100);
	MusicStart("SE3603",0,1000,0,1000,null,false);
	Wait(100);
	MusicStart("SE3604",0,1000,0,1000,null,false);

	WaitAction("斬ムービー", null);
//	Fade("斬ムービー", 500, 0, null, true);
//	Delete("斬ムービー");

	CreateMovie360("血ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");
//	Request("血ムービー", Play);
	Delete("斬ムービー");

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("血ムービー", null);

	FadeDelete("下地赤", 500, false);

	Fade("血ムービー", 500, 0, null, true);
	Delete("血ムービー");

	BGMPlay360("CH26",0,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300040ko">
「死ね、死ね、死ね――」

たった一振りで、４人ほどの人間の命を奪った。

圧倒的な破壊の暴風。

身体の動きや構えはまるでド素人。というよりほとんどへっぴり腰。
それなのに剣の軌跡は異常なほどに速く、正確だ。
敵への狙いを外さず、全員、一撃で命を奪っている。

まるで――

剣を振り回しているのではなく。
剣に、振り回されているかのようだ。

大量の返り血を浴びながら、こずぴぃはうずくまり。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("st梢_制服_正面_血まみれ","sigh", 200, @-150);
	FadeStand("st梢_制服_正面_血まみれ_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300050ko">
「死ねばいいのら……みんな……」

{	Stand("st梢_制服_拒絶_血まみれ","pinch", 200, @-50);
	FadeStand("st梢_制服_拒絶_血まみれ_pinch", 300, false);
	DeleteStand("st梢_制服_正面_血まみれ_sigh", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300060ko">
「殺したくない……剣が勝手に……」

{	Stand("st梢_制服_正面_血まみれ","sigh", 200, @+50);
	FadeStand("st梢_制服_正面_血まみれ_sigh", 300, false);
	DeleteStand("st梢_制服_拒絶_血まみれ_pinch", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300070ko">
「剣に、依存しちゃえばいいのら……」

{	Stand("st梢_制服_通常_血まみれ","sad", 200, @+150);
	FadeStand("st梢_制服_通常_血まみれ_sad", 300, false);
	DeleteStand("st梢_制服_正面_血まみれ_sigh", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300080ko">
「これが、こずぴぃの本性なのかな……？」

{	DeleteStand("st梢_制服_通常_血まみれ_sad", 500, true);}
こずぴぃの精神状態が僕にも伝わってくる。
その思考はぐちゃぐちゃだ。完全に混乱している。

//※１０月３日修正、以下
//こずぴぃの心が壊れかけている。
//あるいは最初から壊れていたのが、表層に出てきただけ？
//※１０月３日修正、以上
僕はまたこずぴぃに肩を貸し、階段を上った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//学校階段
	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg052_01_1_学校階段_a.jpg");
	DrawTransition("back02", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg052_01_1_学校階段_a.jpg");

	Delete("back01");

	Wait(500);
	CreateSE("SE03","SE_じん体_掴む");

	Stand("st大輔_制服_怒り","shock", 190, @-80);
	FadeStand("st大輔_制服_怒り_shock", 300, true);

//	BGMPlay360("CH21", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
そこへ、上から三住くんとＤＱＮが降りてきて、鉢合わせになった。

またこいつらに会うなんて……。
僕は唇を噛む。

{	DeleteStand("st大輔_制服_怒り_shock", 300, true);}
//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300090ec">
「おいおい、こいつら、血まみれじゃねえか……」

{	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Shake("back02", 500, 5, 5, 0, 0, 500, null, false);}
ＤＱＮが一瞬、鼻白んだ。
と、三住くんが僕の胸ぐらをつかんでくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_腕上げ","angry", 190, @-80);
	FadeStand("bu大輔_制服_腕上げ_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
彼の表情は怒りに震えていた。

//◆「殺したのかよ」と言っている
//【三住】
<voice name="三住" class="三住" src="voice/chn04/01300100mi">
「……たのかよ」

//【三住】
<voice name="三住" class="三住" src="voice/chn04/01300110mi">
「お前らが殺したのかよ、ミナコを！」

だからミナコって誰だよ？
僕が戸惑っていると、ＤＱＮが三住くんを止めた。

{	DeleteStand("bu大輔_制服_腕上げ_angry", 300, true);}
//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300120ec">
「まあ待てよ三住。まだそうと決まったわけじゃねえだろ」

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300130ec">
「だいたい、あんなこと、よりによってこの２人ができるわけねえって」

あんなこと。それが、屋上の惨状を意味しているのは間違いない。

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300140ec">
「それよりよー、エスパー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01300150ta">
「ぼ、僕は……エスパーじゃ……」

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300160ec">
「うるせえよ、口答えすんなカス」

エスパーじゃない、って言おうとしたらあっさりと遮られた。
すごまれて、たじろいでしまう。こんな自分が情けなくて、このＤＱＮを殺したいって願えばこずぴぃは殺してくれるのかなって思った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_正面_血まみれ","sigh", 200, @-50);
	FadeStand("st梢_制服_正面_血まみれ_sigh", 500, true);

	CreateSE("SE04","SE_じん体_心臓_鼓動");
//	CreateSE("SE05","SE_じん体_心臓_鼓動");
	CreateSE("SE06","SE_じん体_心臓_鼓動");
	CreateSE("SE07","SE_衝撃_肩にぶつかる");
//	CreateSE("SE08","SE_じん体_心臓_鼓動");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300170ko">
「殺しても……いいよ……」

{	Stand("st梢_制服_拒絶_血まみれ","pinch", 200, @+50);
	FadeStand("st梢_制服_拒絶_血まみれ_pinch", 300, false);
	DeleteStand("st梢_制服_正面_血まみれ_sigh", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300180ko">
「やだ、殺したくない……」

こずぴぃの心の中には、相反する矛盾した感情が入り乱れている。

{	Stand("st梢_制服_通常_血まみれ","sad", 200, @+50);
	FadeStand("st梢_制服_通常_血まみれ_sad", 300, false);
	DeleteStand("st梢_制服_拒絶_血まみれ_pinch", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300190ko">
「殺せない……」

{	Stand("st梢_制服_正面_血まみれ","sigh", 200, @-50);
	FadeStand("st梢_制服_正面_血まみれ_sigh", 300, false);
	DeleteStand("st梢_制服_通常_血まみれ_sad", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300200ko">
「殺すことも、受け入れるべきなの」

{	DeleteStand("st梢_制服_正面_血まみれ_sigh", 500, true);}
殺すことを、受け入れるべき……か。
でも僕には無理だよ……。

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300210ec">
「でよ、エスパー」

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300220ec">
「お前の妹って、お前に似合わずかわいいんだな。七海、だっけ？」

//ＳＥ//心臓の鼓動
{	SetVolume360("@CH26", 500, 500, null);
	MusicStart("SE04", 0, 1000, 0, 1000, null, true);
//	MusicStart("SE05", 0, 1000, 0, 1000, null, true);
	MusicStart("SE06", 0, 1, 0, 1000, null, true);
//	MusicStart("SE08", 0, 1000, 0, 1000, null, true);
	Wait(500);
//	SetVolume("SE05", 500, 1, null);
}
なに……？

七海のこと、なんでこのＤＱＮが知ってるんだ？

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300230ec">
「だからよ、ちょっとかわいがってやったんだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01300240ta">
「な、なにを……言って……」

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300250ec">
「分かんねえの？」

{	MusicStart("SE07", 0, 1000, 0, 1000, null, false);}
ＤＱＮがなれなれしく僕の肩に手を回してくる。
男のくせに香水をつけていて、それが吐きそうなくらい臭かった。

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300260ec">
「俺のツレ、だいたい１０人くらいでいつもツルんでるんだけどな、ちょっとヒマしてたわけよ。で、女ナンパするかって話になったときによ、“提供”してくれたんだよね。お前の妹」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01300270ta">
「提供って……」

七海は物じゃないんだぞ……！　提供ってなんだよ！
それで、なにをしたんだよ。いや、それより誰がこいつらに七海を……

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300280ec">
「ダーススパイダーだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("血", 1100, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, true);
	Request("血", AddRender);

	Fade("血", 0, 1000, null, true);
	Wait(100);
	Fade("血", 0, 0, null, true);

	Wait(500);
	SetVolume("SE06", 1000, 1000, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
絶句した。

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300290ec">
「わざわざ向こうから声かけてきてよ、お前の妹を『好きにしていい』とか言って渡してきたんだよね、マジでウケるだろ？」

{	Fade("血", 0, 1000, null, true);
	Wait(50);
	Fade("血", 0, 0, null, true);
	Wait(50);
	Fade("血", 0, 1000, null, true);
	Wait(50);
	Fade("血", 0, 0, null, true);}
視界が真っ赤になる。
全身の血が沸騰し、頭に上っていくような錯覚を覚える。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01300300ta">
「な、七海に、なにを……」

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300310ec">
「あ？　だからかわいがってやったっつってんだろ。そうそう、妹さ、片手なかったぜ。痛そうだったな、へへへ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Delete("@text006");
//フラッシュバック
//ＣＧ//七海の手首
	CreateSE("SE回想in","SE_衝撃_ふらっしゅばっく");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "White");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateTexture360("回想背景", 1000, 0, 0, "cg/bg/bg160_03_3_ダンボール箱_a.jpg");

	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1500);

	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("回想背景");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
あれは……本物だった！？
だって、あの後、帰ってきてから確かめたら僕の部屋のどこにもなかったのに……！

//※１０月３日修正、以下
//＠生徒Ｃ「だからよ、試しに血まみれの手首の傷口に、俺のをぶちこんでやったらさあ」
//ぶちこんだって、なにを……？
//考えるまでもないことだった。
//＠生徒Ｃ「よがってたぜ、お前の妹。ありゃ痛みもあるけど、ぜってー感じてたな。ギャハハ」
//――殺してやる。
//※１０月３日修正、以上
//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300340ec">
「なあ三住。お前も教えてやれよ。お前だってあの場にいたんだからよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("st大輔_制服_怒り","angry", 190, @-80);
	FadeStand("st大輔_制服_怒り_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【三住】
<voice name="三住" class="三住" src="voice/chn04/01300350mi">
「それより、ミナコを――」

{	DeleteStand("st大輔_制服_怒り_angry", 300, true);
	Fade("血", 0, 1000, null, true);
	Wait(50);
	Fade("血", 500, 0, null, true);}
――それより、じゃねえよ。それよりってなんだよ。僕の、妹だぞ。ミナコとかいうクソ女と比べるな。僕の、大事な妹だ……！

//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300360ec">
「お、そうそう！　記念に写真撮っといたぜ。なあ、エスパーも見てえか？　見せてやるよ」

{	Fade("血", 0, 1000, null, true);
	Wait(50);
	Fade("血", 500, 0, null, true);}
――殺してやる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ケータイ操作音
	CreateSE("SE77","SE_衝撃_ひととぶつかる");
	CreateSE("SE05","SE_日常_けい帯操作");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300370ec">
「えーと、画像画像っと……お、あった、これこれ。ほれ、見ろよエスパー」

{	MusicStart("SE77",0,1000,0,1000,null,false);}
ＤＱＮが僕の顎をつかんで、無理矢理ケータイの画面を見させられる。

{	Fade("血", 0, 1000, null, true);
	Wait(50);
	Fade("血", 100, 0, null, true);}
そこに写っていたのは、確かに七海で――

{	Fade("血", 0, 1000, null, true);
	Wait(50);
	Fade("血", 200, 0, null, true);}
血まみれで、

{	Fade("血", 0, 1000, null, true);
	Wait(50);
	Fade("血", 300, 0, null, true);}
目が虚ろで、

{	Fade("血", 0, 1000, null, true);
	Wait(50);
	Fade("血", 400, 0, null, true);}
裸に剥かれていた。

{	Fade("血", 0, 1000, null, true);
	Wait(100);
	Fade("血", 500, 0, null, true);}
殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる
{	Fade("血", 0, 1000, null, true);
	Wait(200);
	Fade("血", 800, 0, null, true);}
殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる
{	Fade("血", 0, 1000, null, true);
	Wait(300);
	Fade("血", 1000, 0, null, true);}
殺してやる殺してやる殺してやる殺してやる殺してやる殺してやる

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE*", 200, 0, null);
	SetVolume360("@CH*", 200, 0, null);

	Fade("血", 500, 1000, null, true);

	Wait(500);

//ＳＥ//ナイフで刺す
	CreateSE("SE06","SE_擬音_ないふ_しゅっ血");
	MusicStart("SE06", 0, 1000, 0, 1000, null, false);

	CreateColor("痛い", 2000, 0, 0, 1280, 720, "Red");
	Fade("痛い", 0, 0, null, true);
	Fade("痛い", 0, 1000, null, true);

	Shake("back02", 500, 20, 5, 0, 0, 500, null, false);

	Fade("血", 1000, 0, null, false);
	Fade("痛い", 500, 0, null, true);

	CreateSE("SE07","SE_擬音_ないふ_しゅっ血");
	CreateSE("SE08","SE_擬音_ないふ_しゅっ血");
	CreateSE("SE09","SE_擬音_ないふ_しゅっ血");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【生徒Ｃ】
<voice name="生徒Ｃ" class="生徒Ｃ" src="voice/chn04/01300380ec">
「な……ん……」

僕の握りしめたナイフが、ＤＱＮの胸に突き刺さっていた。
どうやら、僕が、刺したらしい。
それは今日、念のために家から持ってきたもので。

{	MusicStart("SE07", 0, 1000, 0, 1000, null, false);
	Fade("痛い", 0, 1000, null, true);
	Shake("back02", 500, 5, 5, 0, 0, 500, null, false);
	Fade("痛い", 500, 0, null, true);}
引き抜き、もう一度、刺す。
さらに、もう一突き。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("st大輔_制服_怒り","shock", 190, @-80);
	FadeStand("st大輔_制服_怒り_shock", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//【三住】
<voice name="三住" class="三住" src="voice/chn04/01300390mi">
「おいやめろタク！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01300400ta">
「うるさい！」

{
	DeleteStand("st大輔_制服_怒り_shock", 300, true);
	MusicStart("SE08", 0, 1000, 0, 1000, null, false);
	Fade("痛い", 0, 1000, null, true);
	Shake("back02", 500, 5, 5, 0, 0, 500, null, false);
	Fade("痛い", 500, 0, null, true);}
抜いて、刺す。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01300410ta">
「三住……お前も、お前も死ねばいいんだ……よくも七海を……世界中の全員が、死ねばいいんだ……僕が殺してやんよ……」

{	MusicStart("SE09", 0, 1000, 0, 1000, null, false);
	Fade("痛い", 0, 1000, null, true);
	Shake("back02", 500, 5, 5, 0, 0, 500, null, false);
	Fade("痛い", 500, 0, null, true);}
抜いて、刺す。
何度も。何度も。

ＤＱＮは、もう動かない。目を開けたまま、血とよだれを口から垂らし、死んでいる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01300420ta">
「ねえ、こずぴぃ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01300430ta">
「全員……ぶち殺してよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 5000, 0, NULL);

	Stand("st梢_制服_正面_血まみれ","sad", 200, @-50);
	FadeStand("st梢_制服_正面_血まみれ_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//※１０月３日修正、以下
//こずぴぃはにっこり笑って、うなずいた。
//※１０月３日修正、以上
こずぴぃは、悲しそうにうなずいた。
その手に、ディソードが浮かび上がる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//女性の悲鳴のような共鳴音
	CreateSE("SE07","SE_擬音_共鳴音_女性悲鳴のよう");
	CreateColor("White", 1000, 0, 0, 1280, 720, "White");
	Fade("White", 0, 0, null, true);

	Stand("st梢_制服_武器構え2_血まみれ","sad", 200, @-50);

	MusicStart("SE07", 0, 1000, 0, 1000, null, false);
	Fade("White", 200, 1000, null, true);
	FadeStand("st梢_制服_武器構え2_血まみれ_sad", 300, false);
	DeleteStand("st梢_制服_正面_血まみれ_sad", 300, true);	
	FadeDelete("White", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
激しい共鳴音とともにリアルブート。
いきなり現れた暴力の塊に、三住くんは目を丸くして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_武器構え2_血まみれ_sad", 300, true);

	Stand("bu大輔_制服_怒り","shock", 190, @-80);
	FadeStand("bu大輔_制服_怒り_shock", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602010]
//【三住】
<voice name="三住" class="三住" src="voice/chn04/01300440mi">
「は……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//斬る
//ＳＥ//血が噴き出す
	CreateSE("SE01","SE_擬音_ディそーど2");
	CreateSE("SE02","SE_じん体_血_噴きでる");
	CreateSE("SE3601","SE_擬音_ディそーど_人を切る");

	CreateColor("下地赤", 1000, 0, 0, 1280, 720, "Red");

	CreateMovie360("斬ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");

//	Request("斬ムービー", Play);
	DeleteStand("bu大輔_制服_怒り_shock", 0, true);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Wait(300);
	MusicStart("SE3601", 0, 1000, 0, 1000, null, false);

	WaitAction("斬ムービー", null);
//	Fade("斬ムービー", 500, 0, null, true);
	Delete("斬ムービー");

	CreateMovie360("血ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");
//	Request("血ムービー", Play);

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("血ムービー", null);
	Fade("血ムービー", 500, 0, null, true);
	FadeDelete("下地赤", 500, false);

	Delete("血ムービー");

	CreateSE("SE3602","SE_衝撃_落下激突");
	CreateSE("SE3603","SE_擬音_びちゃ");
	CreateSE("SE3604","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE3602",0,1000,0,1000,null,false);
	MusicStart("SE3603",0,1000,0,1000,null,false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
一瞬だった。

三住くんの首が、飛んでいた。

こずぴぃはあまりの勢いで剣を振り回したせいか、バランスを崩し、尻餅をついてしまっている。

{	MusicStart("SE3603",0,1000,0,1000,null,false);}
倒れてきた三住の身体にのしかかられ、その服がさらに血に染まる。
鬱陶しそうにその死体を押しのけると、僕に向かって微笑んだ。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300450ko">
「拓巳しゃんも殺しちゃったね……」

//※１０月３日修正、以下
//微笑んだまま――
//※１０月３日修正、以上
泣いているのか、苦しんでいるのか、微笑んでいるのか。
いろんな感情がない交ぜになった切なげな笑みを浮かべたまま――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01300460ko">
「なんで、敵だらけなんだろ……もうやだ……」

心は泣いていた。

でもこずぴぃの言う通り、敵だらけなんだ。
だから、殺すしかない。殺したって敵の自業自得だ。
悪いのは僕じゃない。僕を攻撃してきたヤツらなんだ。

七海にひどいことした報いだ。

七海は……生きているんだろうか……。
たぶん、死んでる……。あんな、血まみれになってて……。
手も切断されて……。

生きてるはずがない……。

//◆泣く
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01300470ta">
「う、うぅぅ……」

絶対に許さない。絶対にだ……！

これまで怯えるだけだったけど、もう、やめた……。
全員、殺してやる。殺してやるんだ……！

七海の無残な画像を見せられたあの瞬間に、僕の中でなにかが壊れて。
もう歯止めは利かないような気がした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

//アイキャッチ


}

