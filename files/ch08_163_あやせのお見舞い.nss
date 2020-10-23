//<continuation number="410">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_163_あやせのお見舞い";
		$GameContiune = 1;
		Reset();
	}

		ch08_163_あやせのお見舞い();
}


function ch08_163_あやせのお見舞い()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg105_01_2_AH階段_a.jpg");
	Fade("背景１", 2000, 1000, null, true);

	Wait(1000);

//おがみ：病院ガヤ
	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	MusicStart("SE01", 2000, 200, 0, 1000, null, true);


//アイキャッチ
//※拓巳視点に戻る

//ＢＧ//ＡＨ東京総合病院・階段//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16300010ta">
「はあ……はあ……」

頭の中に靄がかかったような思考状態のまま、僕はナースステーションを出て病院内をさまよっていた。さっき見たことは考えないようにする。

気が付いたら階段の踊り場にいて、そこにある窓の前で三住くんが外を眺めていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st大輔_制服_通常","shock", 250, @210);
	FadeStand("st大輔_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300020mi">
「どうしたタク。汗びっしょりじゃねえか。顔色も悪いし」

{	Stand("st大輔_制服_通常","normal", 250, @210);
	FadeStand("st大輔_制服_通常_normal", 300, true);
	DeleteStand("st大輔_制服_通常_shock", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300030mi">
「あ、顔色悪いのはいつもか。ははっ」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300040mi">
「もしかして走って探してたのか？
そりゃあバテもするぜ。無茶するね、お前って」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16300050ta">
「…………」

汗を手で拭い、必死で平静を装う。

{	Stand("st大輔_制服_通常","pride", 250, @210);
	FadeStand("st大輔_制服_通常_pride", 300, true);
	DeleteStand("st大輔_制服_通常_normal", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300060mi">
「梨深と岸本、見つけたぜ」

そう言っているけど、この場のどこにもその２人はいない。
すると彼は、なにを思ったか窓の外を指差した。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300070mi">
「あそこだ」

{	DeleteStand("st大輔_制服_通常_pride", 500, true);}
息を整えてから、僕は窓に歩み寄った。
そこから見えるのは、隣にある外来棟。

外来棟と病棟は別の建物だ。渡り廊下で行き来できるようになっているけど、両者は少しだけ離れて建っている。

病棟の方が階数があって、この踊り場からは外来棟の屋上をわずかに見下ろす形になる。庭園のようになっているそこには赤い花を咲かせる植え込みがあって、患者の憩いの場になってるみたいだ。

梨深と、パジャマ姿のあやせは、庭園の真ん中あたりに向かい合って立っていた。なにかを話しているように見える。

２人って知り合い……じゃないはずだよね。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300080mi">
「なんか、妙にシリアスに見えねぇか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16300090ta">
「う、うん……」

まるで、にらみ合っているかのような――

と、あやせが梨深に一歩詰め寄ると、
{	Wait(500);
	CreateSE("SE03","SE_衝撃_びんたされる");
	SoundPlay("SE03", 0, 200, false);
	Wait(500);}
唐突にその頬を引っぱたいた。

ここから見ていても、今のが全力の一撃だというのが感じ取れた。

あやせは梨深から離れていく。渡り廊下の方へ歩いていったから、病室に戻るのかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st大輔_制服_通常","shock", 250, @200);
	FadeStand("st大輔_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆呆然
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300100mi">
「…………」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300110mi">
「今、ビンタした……よな？」

僕はコクコクとうなずいた。
ひとり残された梨深は、いまだにその場に立ち尽くして動こうとしない。

{	Stand("st大輔_制服_通常","sigh", 250, @200);
	FadeStand("st大輔_制服_通常_sigh", 300, true);
	DeleteStand("st大輔_制服_通常_shock", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300120mi">
「あの２人って、トラブル抱えてんのか？」

そんな話は聞いたことがないよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st大輔_制服_通常_sigh", 500, true);

//ＢＧ//ＡＨ東京総合病院・廊下
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg099_02_2_AH廊下_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	MusicStart("SE01", 2000, 400, 0, 1000, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
とりあえず今のは見なかったことにしよう、という三住くんの提案を僕はあっさり受け入れた。梨深のことはそっとしておくことにして、あやせの病室に戻ってみる。

さっきまでの身体の不調は、だいぶ治まっていた。
もう“神の視線”の気配も消えてしまった。

あの気分の悪さが、まるでウソだったみたいに思える。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300130mi">
「お……」

先を歩いていた三住くんが小さく声を漏らした。

それに反応して顔を上げると、正面からあやせが歩いてくるところだった。

少しうつむきがちで、視線は伏せられている。足取りには力がなく、顔色もあまりよくない。そして表情は、やっぱり物憂げなものだ。

あやせと僕たちは、ちょうど病室の前で鉢合わせする形になった。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300140mi">
「よっ。岸本さん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_パジャマ_通常","shock", 250, @-200);
	FadeStand("stあやせ_パジャマ_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
三住くんの爽やかさ全開の挨拶に、あやせはハッとして顔を上げ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_パジャマ_泣く","utsu", 250, @-200);
	DeleteStand("stあやせ_パジャマ_通常_shock", 300, false);
	FadeStand("stあやせ_パジャマ_泣く_utsu", 300, true);
	DeleteStand("stあやせ_パジャマ_泣く_utsu", 800, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
それから僕を見て、泣き出しそうにも見える微笑みを浮かべた。

どうして今、笑ったんだろう。

Ｏ－ＦＲＯＮＴの騒動を聞いて、僕の醜態を知ったからかな。それとも、単純に好意を寄せられてるのかな。

前者だったら、激しく鬱だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st大輔_制服_通常","smile", 250, @210);
	FadeStand("st大輔_制服_通常_smile", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300150mi">
「俺たち、君のお見舞いに来たんだよねー」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300160mi">
「っつーか、岸本さん、パジャマ姿もかわいいじゃん」

早くもナンパ話術のスキルが発動している。
なんという対応の早さ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_パジャマ_通常","normal", 250, @-200);
	FadeStand("stあやせ_パジャマ_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//◆優しく
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300170ay">
「入って」

{	DeleteStand("stあやせ_パジャマ_通常_normal", 500, true);}
一方のあやせも、以前のように三住くんを冷たくあしらうことなく、病室のドアを開けて僕らを招き入れる。
さっき、屋上で梨深をビンタしていたことは、おくびにも出さない。

うまく隠しているのか、単純に梨深とのことをこの短い時間ですっかり吹っ切ったのか。
相変わらず、あやせがなにを考えているのか読めなかった。

{	Stand("st大輔_制服_通常","pride", 250, @210);
	FadeStand("st大輔_制服_通常_pride", 300, true);
	DeleteStand("st大輔_制服_通常_smile", 0, false);}
//◆小声
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300180mi">
「タク、やっぱ見舞いに来たのは正解だったぜっ。今日は好感触だ！」

三住くんはあやせに見えないようにして、小さくガッツポーズ。鼻息を荒くして病室に入っていく。僕もやむなくそれに続いた。ホントは、梨深と一緒に早く帰りたいんだけど……。

もっとも、今梨深に声をかける勇気は僕にはない。

理由は分からないけど、他人にあんなに強烈にぶたれたんだからきっと落ち込んでるはずで、僕は彼女を励ます言葉を持ち合わせていない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//ＡＨ東京総合病院・病室//夕方
	SoundPlay("SE01", 2000, 0, true);
	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	SoundPlay("SE02", 0, 1000, false);

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	DeleteStand("st大輔_制服_通常_pride", 0, true);
	Wait(1000);
	CreateTexture360("背景３", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	DrawTransition("色１", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);

	Delete("背景２");
	Delete("色*", 0, true);

	CreateSE("SE02","SE_日常_びょういんどあ_閉まる");
	SoundPlay("SE02", 0, 1000, false);
	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	SoundPlay("SE01", 2000, 500, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
あやせはベッドに腰掛ける。
三住くんも、いかにもさりげなく、その隣に座った。

なんという大胆な行動だ。僕は三住くんの攻めの姿勢に、思わずのけぞってしまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_パジャマ_通常","normal", 250, @-320);
	FadeStand("buあやせ_パジャマ_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
あやせは三住くんを一瞥し、それから僕へと視線を固定する。

まっすぐに見つめられ、どんな顔をしていいのか分からなくなる。僕は結局うなだれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","smile", 250, @320);
	FadeStand("bu大輔_制服_通常_smile", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300190mi">
「ケガ、どう？　もうだいぶよくなってるみたいだけど」

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300200mi">
「なんか必要なものあるなら、遠慮なく言ってよ。俺がすぐ買ってきてやるぜ」

彼はあやせの手にひたすら注目している。
そのしなやかでほっそりとした手を握ろうと企んでいるらしい。

えーと、僕、ここから出てっていいかな……。

//※※３６０以下
//【三住】
<voice name="三住" class="三住" src="voice/chn00/00900010mi">
「あ、小説とか読む？　俺さ、グラジオール記黙示録詩編ってのが好きなんだけど。岸本さん知ってる？」

//※※３６０以上
//【三住】
//<voice name="三住" class="三住" src="voice/ch08/16300210mi">
//「あ、小説とか読む？　俺さ、グラジオール・サーガってのが好きなんだけど。岸本さん知ってる？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300220ay">
「拓巳」

あやせが、三住くんの問いには答えず、僕の名を呼んだ。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300230ay">
「キミは、グラジオールの七騎士のひとりよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","worry", 250, @320);
//	Move("bu大輔_制服_通常_smile", 500, @50, @0, AxlDxl, false);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_smile", 0, true);

	Move("bu大輔_制服_通常_worry", 300, @30, @0, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300240mi">
「は？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16300250ta">
「え……」

い、いきなりデンパな話か……。
あの自殺未遂騒動があっても、やっぱり本質は変わっていないらしい。

{	DeleteStand("bu大輔_制服_通常_worry", 500, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300260ay">
「やっぱり、導きだったんだわ。キミと私が出会ったのは」

静かに。
淡々と。
あやせは語る。

その、中２病としか思えない“設定”を。

{	Stand("buあやせ_パジャマ_通常","hard", 250, @-320);
	FadeStand("buあやせ_パジャマ_通常_hard", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_normal", 500, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300270ay">
「キミの邪心は、とても強大」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300280ay">
「だからこそ、言うことなしなのよ。黒騎士としての素質は」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300290ay">
「キミが今経験している苦しみは、すべて神罰。大いなる意志による試練なの」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300300ay">
「それを乗り越えたときに、ディソードは召喚されるわ。キミの手に、必ず」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300310ay">
「そして、現れるのよ――」

//大蛇＝だいじゃ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300320ay">
「邪心の黒き大蛇。あらゆる崩壊を呑み込み、邪心王の身を砕くことのできる、同質にして異質なるものが」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300330ay">
「現実なの。グラジオールもディソードも」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300340ay">
「“かまいたち”が、その証よ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300350ay">
「実在しない現象は、後世に言葉として残ることはないわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300360ay">
「知っている？　語源を」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300370ay">
「“構え太刀”」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300380ay">
「それはディソードを意味しているの」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300390ay">
「信じて。拓巳」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/16300400ay">
「グラジオールを倒すのよ。一緒に」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buあやせ_パジャマ_通常_hard", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
グラジオール……。
今、思い出した。

ディソードについて最初調べたときに見た。ディソードはもともと、グラジオール伝説について語られた偽典や文献に出てきた剣のこと……らしいって。

//【三住】
<voice name="三住" class="三住" src="voice/ch08/16300410mi">
「…………」

と、三住くんが静かに立ち上がると、こっちに歩み寄ってきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("３７");
	TypeBegin();//――――――――――――――――――――――――――――――


	EndTrigger();

}