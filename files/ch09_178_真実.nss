//<continuation number="430">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_178_真実";
		$GameContiune = 1;
		Reset();
	}

		ch09_178_真実();
}


function ch09_178_真実()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//※拓巳視点に戻る


//ＢＧ//黒
	CreateColor("back03", 500, 0, 0, 1280, 720, "Black");


//「あなたは……妄想の存在なんだよ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 1000, center, middle, Auto, Auto, "「あなたは……妄想の存在なんだよ」");
	Move("テキスト１", 0, @10, @0, null, true);
	CreateVOICE("梨深","ch09/17800010ri");
	SoundPlay("梨深",0,1000,false);

	SetBacklog("「あなたは……妄想の存在なんだよ」", "voice/ch09/17800010ri", null);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);

	Request("テキスト１", Enter);
	$待ち時間 = RemainTime ("梨深");
	$待ち時間 += 2000;
	WaitKey($待ち時間);

	FadeDelete("テキスト１", 500, true);

	SetVolume("梨深", 0, 0, NULL);

//森島ボイス、ＳＥ化かも
/*
//↓画面中央に表示
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800010ri">
「あなたは……妄想の存在なんだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
*/

//ＢＧ//下北沢住宅街//夕方
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg056_01_2_下北沢住宅街_a.jpg");

//森島BGMダミー（仮
	BGMPlay360("CH01", 2000, 1000, true);

	FadeDelete("back03", 1000, true);

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
梨深が、意味不明な言葉をつぶやく。

僕はそれを無視して、周囲の家並みへと視線を巡らし続けた。

記憶にある、この場所。
見覚えのない、この場所。

ここにあるはずの家が、なくて。
ここにないはずの家が、ある。

自分の記憶と、現実の風景との“ずれ”が、夕焼けに照らされてじわじわと浮き上がってくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800020ta">
「ズ、ズレてなんかない！」

僕はそう声に出して、心の中の絶望的な気持ちを必死に否定した。

そうだ。ズレてなんていないんだ。<k>
入る道を一本間違えただけだ。

僕が勘違いしてるんだ。<k>
世界はなにも間違ってないんだ。<k>
そうでなきゃおかしい。

{	CreateSE("SE01","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE01", 0, 800, 0, 1000, null, true);
	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("back10", 300, 0, 1000, 100, null, "cg/data/right2.png", false);}
僕は転がるようにして来た道を引き返し、隣の細い路地に駆け込んだ。

でも、やっぱり記憶と風景に、違和感。

気が付けば、全身にイヤな汗をかいていた。

目がグルグル回っているような。
地に足が付いていないような。

そんな感じがして、吐き気がこみ上げる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, NULL);
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg057_01_2_下北沢拓巳の家_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg057_01_2_下北沢拓巳の家_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800030ta">
「なん、なんで、だよぅ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800040ta">
「ここに、ぼ、僕の、家があるのは、間違いないんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800050ta">
「僕は、いつも、ここから、小学校にも、ちゅ、中学校にも、通ってたんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800060ta">
「小学校には、七海と、手を繋いで、と、登校、してたし……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800070ta">
「中学は、じ、自転車で……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","hard", 200, @+150);
	FadeStand("st梨深_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆悲しそうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800020ri">
「どこの、中学校？」

追いかけてきた梨深が、静かにそう聞いてくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800090ta">
「ど、どこって……」

//◆悲しそうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800100ri">
「なんていう学校？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800110ta">
「そ、そんなの、決まってるじゃないか……、地元の……」

学校名は、えーと……。

{	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01", 0, 500, 0, 1000, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800120ta">
「……あ……れ？　え？」

思い出せない……。

中学に、通っていた。その記憶はある。
でも、細かい部分が、頭に靄がかかったようにぼんやりとして、はっきりしない。

中学校の校名とか。
クラスは何組だったとか。
担任の名前とか。

具体的な名前が、出てこない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800130ta">
「そ、そんなはず、ないんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800140ta">
「ただ、わ、忘れてる、だけで……」

{	Stand("st梨深_制服_正面","sad", 200, @+150);
	DeleteStand("st梨深_制服_通常_hard", 500, false);
	FadeStand("st梨深_制服_正面_sad", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800150ri">
「タク……聞いて」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800160ri">
「あなたの記憶にあるのは」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800170ri">
「“この場所に家がある”じゃなくて――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800180ri">
「“この場所に家があるはず”っていう、思い込み」

//◆悲しそうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800190ri">
「そう、でしょ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800200ta">
「…………」

気が、狂いそうだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800210ta">
「だ、だって！　ぼ、僕は、僕は！　ここに来るまでの道は、お、覚えてるんだぞっ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800220ta">
「おかしいじゃないかっ！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800230ri">
「それは、作られた記憶だから」

そんな顔を、しないでよ……！

目を伏せた梨深が、いかにも悲しそうな顔をして、僕を惑わす言葉を投げかけてくる。またも意味不明。理解不能。僕は考えることを放棄する。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800240ri">
「タクは、中学には通ってないの」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800250ta">
「分かった……ぞ、これ、ド、ドッキリ、でしょ？　そうなんでしょ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800260ta">
「きっと、アレだ、そう、梨深と、な、七海が、実は知り合いとかで、ぼ、僕を、２人して騙そうとしてるんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800270ta">
「ふひひ、なんだ、そうかそうか、は～、ビビったぁ」

なんとか笑い飛ばそうとしているのに。
梨深はクスリともしない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800280ri">
「ごめん。あたし、これからあなたを傷つけることを言わなくちゃ」

{	Stand("st梨深_制服_正面","hard", 200, @+150);
	FadeStand("st梨深_制服_正面_hard", 500, true);
	DeleteStand("st梨深_制服_正面_sad", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800290ri">
「タク……あなたはね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800300ri">
「本来、いちゃいけない存在なんだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800310ta">
「ウソを、つ、つ、つくなぁっ！」

梨深は僕を騙している！
梨深も敵だったんだ！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800320ta">
「『張り付け』は、り、梨深の、仕業、だな……！」

最初に会ったあの『張り付け』現場での出来事は妄想なんかじゃなかったっていうことだ。

ニュージェネ事件の真犯人は、さっき病院のテレビで見たあの男なんかじゃない。

梨深なんだ。

目撃してしまった僕が誰かに真相を喋らないかどうか、監視していたんだ。
一緒にいるっていうのもそれが目的だったんだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//	CreateVOICE("拓巳","ch09/17800330ta");
//	SoundPlay("拓巳",0,1000,false);
//	SetBacklog("「き、君は、あの、あのとき、血まみれだった……！　だから君が犯人だ……！」", "voice/ch09/17800330ta", 拓巳);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text100]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800330ta">
「き、君は、あの、あのとき、血まみれだった……！　だから君が犯人だ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//</PRE>
//	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin10();//――――――――――――――――――――――――――――――
//おがみ：↑テキストボックスの演出あわせの為コメントアウト
//	SoundStop2("拓巳");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800340ri">
「あれは、あなたの望んだ妄想」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800350ri">
「ギガロマニアックスの妄想はね、強すぎる場合、ときに混じり合うの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800360ri">
「妄想が、シンクロするんだ」

静かに。<k>
言い聞かせるように。<k>
梨深は語る。

その余裕ぶった態度が、僕の神経を逆なでする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH01", 500, 0, NULL);
	CreateSE("SE05","SE_じん体_動作_抱く1");
	CreateColor("back10", 500, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800370ri">
「少なくともあのとき、あの場所では４つの妄想がシンクロしてた」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800380ri">
「タクと」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800390ri">
「あたしと」

//◆もうひとりは将軍
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/17800400ri">
「ニュージェネの犯人と――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800410ta">
「信じるもんか！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("４０");
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Fade("back10", 200, 1000, null, true);
//	DrawTransition("back10", 300, 0, 1000, 100, null, "cg/data/lcenter2.png", true);

	Delete("back0*");
	DeleteStand("st梨深_制服_正面_hard", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
なおも続けようとする梨深の言葉を遮った。<k>
耳を塞いだ。<k>
目を閉じた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800420ta">
「これは妄想だ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/17800430ta">
「そうだよ、妄想なんだ。いつもしているみたいな――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

}

//■TypeBegin10