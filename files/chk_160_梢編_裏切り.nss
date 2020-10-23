

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_160_梢編_裏切り";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_160_梢編_裏切り();
}


function chk_160_梢編_裏切り()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編

//※１０月３日追加、以上
//ＢＧ//昇降口
//梨深立ち絵は表示しないでください
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg051_02_1_昇降口_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);
	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg051_02_1_昇降口_a.jpg");

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
梨深に引っ張られるようにして、渋々、階下へ。
でも昇降口の前で、僕は立ち止まった。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200180ri">
「タク？」

少し強めに引っ張ってくる梨深の手を、そっと振り払う。

ここで廊下を左に曲がれば職員室、さらにその先が保健室だ。
昇降口からそのまま外へ出ればグラウンド。そして校門。

できれば今日は誰とも会いたくない。
校内を歩き回りたくない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3602", 1000, 0, null);

//ＳＥ//心臓の鼓動
	CreateSE("SE02","SE_じん体_心臓_鼓動");
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
//ＢＧ//赤
//少しだけフラッシュバック
	CreateSE("SE回想in","SE_衝撃_ふらっしゅばっく");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "White");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateTexture360("回想背景", 1000, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");

	CreateColor("血", 1100, 0, 0, 1280, 720, "Red");
	Request("血", AddRender);

	CreateColor("血２", 1100, 0, 0, 1280, 720, "Red");
	DrawTransition("血２", 2200, 0, 1000, 100, Axl2, "cg/data/effect.png", false);


	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1500);

	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Delete("回想背景");
	Delete("血");
	Delete("血２");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	SetVolume("SE02", 1000, 0, null);
	SetVolume("SE03", 1000, 0, null);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
屋上のあの惨状はすぐに発見されるだろう。
そうなれば大パニックになる。
僕も服に血をこびりつかせているから犯人扱いされるかも。

だから今すぐにでも学校から逃げ出したかった。
保健室には行かずに、このまま昇降口から出て行くべきだ――

あの屋上のこと、こずぴぃのことを梨深に伝えようと、僕は背後を振り返った――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//梨深ディソード持ちの立ち絵表示
	Stand("bu梨深_制服_武器構え","sad", 200, @+50);
	FadeStand("bu梨深_制服_武器構え_sad", 0, true);

	CreateSE("SE01","SE_じん体_掴む");

	Fade("Black", 250, 0, null, true);
	Delete("Black");

	Wait(1200);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200190ta">
「……え？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200200ri">
「あ……」

梨深が、手になにかを持っていた。
鋭い切っ先。鋼鉄の翼のようにも見える。
これってまさか、ディソード……？

梨深はその先端を――

今にも、僕の背中に突き立てようとしていて――

見つめ合う。

{	DeleteStand("bu梨深_制服_武器構え_sad", 500, true);}
梨深の瞳は悲しさをたたえていた。
先に目をそらしたのは梨深だった。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200210ri">
「ごめんね」

ぽつりとそうつぶやくと同時に、剣を振りかぶった――

殺そうとしている。
梨深が、僕を、殺そうとしている……！

{	BGMPlay360("CH10", 1000, 1000, true);
	Shake("bu梨深_制服_武器構え_sad*", 500, 5, 10, 0, 0, 500, null, false);
	Shake("back01", 500, 5, 10, 0, 0, 500, null, false);
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
無我夢中だった。
とっさに、梨深の手首をつかみ、その剣が振り下ろされるのを防ぐ。

僕はヘタレだし運動もからしきだけど、力は梨深よりはまだマシだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_武器構え","hard", 200, @+50);
	FadeStand("bu梨深_制服_武器構え_hard", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200220ri">
「く……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200230ta">
「な、なんで……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200240ta">
「なんでだよぉっ！」

こいつも……梨深も結局は敵だったの？
ずっと僕を騙してたの？　優愛のときみたいに、僕を欺いて、僕をハメようとしてたの？

梨深も『将軍』の手下？
梨深がニュージェネの真犯人だっていう、最初の僕の推理は、正しかったの？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200250ta">
「な、なんでこんな……！」

{	Stand("bu梨深_制服_武器構え","sad", 200, @+50);
	FadeStand("bu梨深_制服_武器構え_sad", 300, true);
	DeleteStand("bu梨深_制服_武器構え_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200260ri">
「ごめん……。でも、タクには消えてもらうしかないの」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
決定的だった。
僕の勘違いじゃなくて、梨深が敵なのは事実。
本性を現しただけだ。僕を守るなんてウソだったんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200270ta">
「ウソだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200280ta">
「こ、こんなのウソだぁっ！」

//◆ささやき。泣きそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200290ri">
「ウソついてて、ごめん」

//◆ささやき。泣きそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200300ri">
「でもお願い、タク……」

//◆ささやき。泣きそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200310ri">
「消えて……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200320ta">
「ふ、ふざ、ふざけるな、ふざけるなよっ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200330ta">
「ぼ、僕がっ、どれだけ梨深のことを信用してたと思ってるんだ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200340ta">
「ど、ど、どれだけ、梨深を頼りにしてたと思ってるんだ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200350ta">
「なんでそんな簡単に、ひ、人を、裏切れるんだよっ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200360ta">
「こ、こ、この、悪魔女め！」

//◆ささやき。泣きそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200370ri">
「タク……ごめん……」

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200380ta">
「ごめんで済むかよ！　な、何様だよ！」

気が付けば僕は泣いていた。
こんな裏切りは、ないよ……。

優愛のときとは比べものにならない怒りと悔しさ。
梨深は、僕の気持ちを踏みにじったんだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(500);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");

	Wait(500);

//おがみ：SE：締める音きたら差し替え
	CreateSE("SE01","SE_擬音_服がやぶれる");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
許せない……！　許せない……！　許せない……！　許せない……！
許せない……！　許せない……！　殺したい……！　許せない……！
殺したい……！　許せない……！　許せない……！　殺したい……！

{	MusicStart("SE01",0,1000,0,1000,null,false);}
手首をきつく握りしめてやると、梨深は苦痛に顔を歪めた。
でも僕の方が苦痛なんだ。僕はお前に心をズタズタにされたんだ。

許せない、許せるもんか、殺してやりたい、殺してやりたい、殺してやりたい、殺してやり――

{	SetVolume360("CH*", 0, 0, NULL);
	Wait(200);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200390ko">
「殺してやる……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_擬音_ディそーど落ちる");
	CreateSE("SE02","SE_擬音_ディそーど_空を切る2");
	CreateSE("SE03","SE_擬音_ディそーど_衝撃は");


	MusicStart("SE02",0,1000,0,1000,null,false);

//▼べー：殴るエフェクトがありませんのでフラッシュで代用します。
//斬るエフェクト
//ＳＥ//斬る
//※斬るのではなく（剣での）殴りに変更
	CreateColor("White", 1500, 0, 0, 1280, 720, "White");
	Fade("White", 0, 0, null, true);
	Fade("White", 200, 1000, null, true);

	Delete("Black");
	Wait(200);
	MusicStart("SE01",0,1000,0,1000,null,false);
	MusicStart("SE03",0,1000,0,1000,null,false);
	DeleteStand("bu梨深_制服_武器構え_sad", 0, true);

	FadeDelete("White", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/01200400ri">
「がはっ――」

いきなり。

//※１０月３日修正、以下
//目の前で、梨深の胴体が真っ二つにされた。
//ＳＥ//血がぶちまかれる
//ＳＥ//人が倒れる音
//呆然とした顔をして。
//僕に視線を向けたまま。
//大量の血をぶちまけて。
//ふたつに分断された梨深がその場に倒れ伏す。
梨深の身体が目の前から消えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("White", 1500, 0, 0, 1280, 720, "White");
	Fade("White", 0, 0, null, true);
	Fade("White", 0, 1000, null, true);

//ＳＥ//梨深が下駄箱に叩き付けられる
//ＳＥ//下駄箱壊れる。倒れる
	CreateSE("SE02","SE_衝撃_巨大杭_突きやぶる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Shake("back01", 600, 15, 5, 0, 0, 500, null, false);
	CreateSE("SE03","SE_じん体_動作_棚にぶつかり倒れる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
すぐ横の下駄箱へと、彼女の身体は吹っ飛び。
叩き付けられ。下駄箱を破壊しながら倒し。
残骸の中にめり込んで、見えなくなった。

もうもうとした粉塵が立ちこめる。

//※１０月３日修正、以上。
なにが起きたのか、最初、僕にはよく分からなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(1000);

	Stand("st梢_制服_武器構え2_血まみれ","sad", 200, @-50);
	FadeStand("st梢_制服_武器構え2_血まみれ_sad", 0, true);
	FadeDelete("White", 2000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//◆心の声//◆悲しげ
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200410ko">
「……拓巳しゃんの心の叫びね、聞～こえたよ」

ディソードを構えたこずぴぃが、立っていて。
その表情は苦しげ。額には汗もにじんでいる。
にもかかわらず、無理に笑って。

//◆心の声//◆悲しげ
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200420ko">
「殺したい、って。許せない、って。だから」

//◆心の声//◆悲しげ
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200430ko">
「――殺してあげたのら」

そんな心の声を飛ばしてきた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200440ta">
「こ……ろした……ホントに……ころ……し……」

{	DeleteStand("st梢_制服_武器構え2_血まみれ_sad", 500, true);}
//※１０月３日修正、以下
//信じられない思いで、足下に転がっている“梨深だったもの”を見つめる。当然ながらそれはもうぴくりとも動かない。彼女のディソードが無数の黒い粒子に包まれて、ゆっくりと消滅していく。
//梨深が、死んだ。
//こんなにも、あっさりと。
信じられない思いで、破壊された下駄箱の方へ歩み寄った。

その僕のつま先に、梨深が持っていたディソードが触れる。
持ち主の手から離れ、床に転がっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("血２", 1100, 0, 0, 1280, 720, "Red");
	DrawTransition("血２", 2500, 0, 1000, 100, Axl2, "cg/data/effect.png", false);
	Wait(1500);
	FadeDelete("血２", 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
剣の下に、ゆっくりと広がっていく液体。

それは、血。

誰の血なのか。
そんなの、考えなくたって分かった。

やがてディソードが、無数の黒い粒子に包まれて消滅していく。

梨深が……死んだ……？
こんなにも、あっさりと？

きちんと確認する気は起きなかった。

//※１０月３日修正、以上
悲しくて、同時に、やり場のない悔しさがまだ残っていて。

そんな自分自身の感情を、僕は殺した。
感覚を麻痺させたのか、感覚が麻痺したのか。どっちでもいい。
涙は止まっていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200450ta">
「こずぴぃ……僕を、助けて……」

もう、頼れるのはこずぴぃだけになってしまった。

梨深に裏切られたのに。
いまだに僕は、誰かを信じたいって思ってる。
いや、誰かに一緒にいてもらいたいだけかもしれない。

守ってほしいなんていうのは口実で。
僕はただ、１人になるのがイヤなだけ。

裏切られるかもしれないって思っていても、そして実際に裏切られても、それでも、１人はイヤだった。１人じゃ、このくそったれな状況にとても耐えられないんだ。

今１人にされたらきっと、僕は僕でなくなるだろう。
自分が消えてしまうだろう。

僕はすがるようにこずぴぃに歩み寄った。
こずぴぃはとても悲しそうで、とても苦しそうに見える。
もう笑顔はなかった。

その細い肩を、思い切って抱きしめてみた。
こずぴぃは抵抗しなくて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_通常_血まみれ","sad", 200, @-50);
	FadeStand("st梢_制服_通常_血まみれ_sad", 500, true);

	BGMPlay360("CH22", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200460ko">
「さっきは、こずぴぃから逃げたのに」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200470ta">
「ご、ごめん、ごめんなさい……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200480ta">
「そ、それでも、助けてくれ……」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200490ko">
「拓巳しゃんは、こずぴぃの味方？」

こずぴぃはすでに何人殺したんだろう。
警察に捕まったらどうなるんだろう。

そのこずぴぃと一緒に行動してもいいんだろうか。
そんなことを自問したけど、すぐに思い直した。

僕は、こずぴぃと一緒にいる。こずぴぃと一緒がいい。
警察よりも厄介な敵がいるんだ。そいつを相手に１人でいるのは危険すぎる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200500ta">
「ぼ、僕には、こずぴぃが必要だ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/01200510ta">
「一緒に……いたい……」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200520ko">
「……拓巳しゃんは、身勝手な人なの」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_通常_血まみれ_sad", 500, true);

	CreateSE("SE01","SE_じん体_動作_抱く1");
	MusicStart("SE01",0,1000,0,1000,null,false);

	CreateTexture360("梢抱きしめ", 1000, 0, 0, "cg/ev/ev134_02_1_梢うずくまり_a.jpg");
	Fade("梢抱きしめ", 0, 0, null, true);
	Fade("梢抱きしめ", 1000, 1000, null, true);

	Wait(500);
	Delete("back*");

	CreateSE("SE悲鳴","SE_はいけい_生と_悲鳴とどよめき_2");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
そう答えて、こずぴぃの手が僕の背に回された。
かすかな力で、こずぴぃの方からも抱きしめてくる。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200530ko">
「でもね、こずぴぃのこと必要って言ってくれたから、こずぴぃも拓巳しゃん、一生懸命守る」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200540ko">
「あのね、前に汚いおじしゃんが言ってたのら」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200550ko">
「我慢することないって。負の感情を否定しちゃダメーって」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200560ko">
「だから、こずぴぃは、こずぴぃをいじめる人みんな、殺すね」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200570ko">
「それと、拓巳しゃんをいじめる人も！」

氷のように冷たくて、同時に、太陽のように温かい感情が、こずぴぃから送られてくる。彼女に宿る、矛盾する感情。狂気と、優しさと。

心の声を飛ばすのと同じ仕組みなのか、それとも僕のただの錯覚なのかは分からないけど。

{	MusicStart("SE悲鳴",0,300,0,1000,null,false);
	Wait(500);
	SetVolume("SE悲鳴", 1000, 0, null);}
そのとき、校内に女子の悲鳴が響き渡った。
校舎の上の方からだった。

屋上の惨状が見つかったんだろうか。

逃げなきゃ。

こずぴぃ、ここにいたら警察に捕まっちゃうよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 3000, 0, NULL);
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg051_02_1_昇降口_a.jpg");
	FadeDelete("梢抱きしめ", 1000, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
彼女の身体を離すと、なぜかこずぴぃはすとんとその場にへたり込んだ。

//以下、リアル声
//◆リアル声//◆苦しげ
//【梢】
<voice name="梢" class="梢" src="voice/chn04/01200580ko">
「はぁ……ぁ……ぅ……」

//以上、リアル声
//おがみ：シナリオ修正：テキスト削除
//やけに息が荒い。顔色も蒼白だ。脂汗がにじみ、髪が額にへばりついている。
ど、どうしたの？

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200590ko">
「すごく……疲れてるのら……。身体、だるいの……」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200600ko">
「ねえ、拓巳しゃん……。こずぴぃね、心の中に、まっくろくろな……妄想がどんどん生まれてくるよ……」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/01200610ko">
「押し潰されちゃいそうなの……」

まっくろくろな妄想って、なんだ？

いずれにしてもここにとどまっているのはまずい。
梨深の死体が転がってるんだ、もし誰かに見られたら、確実に僕らの仕業だってバレてしまう。

とにかくこずぴぃに肩を貸して、その場を離れた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(2000);
	Wait(1000);
}
