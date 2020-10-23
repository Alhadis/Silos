//<continuation number="140">
//１１月５日（水）

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_153_梢編_１１月５日水";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_153_梢編_１１月５日水();
}


function chk_153_梢編_１１月５日水()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編
//ＢＧ//教室
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 2000, 800, 0, 1000, null, true);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
教室に入って最初にしたことは、梨深の席を見ること。
でもそこはやっぱり空席だった。

次にこずぴぃを探す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 500, 0, 1000, 200, null, "cg/data/left3.png", true);
	
	
	DrawTransition("黒", 500, 1000, 0, 200, null, "cg/data/right3.png", true);
	Delete("黒");

	Wait(500);

	Stand("st梢_制服_正面","normal", 200, @+150);
	FadeStand("st梢_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
彼女は自分の席について、うつむき、縮こまっていた。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600010ko">
「おはーよう、拓巳しゃん」

――おはよう、こずぴぃ。

{	DeleteStand("st梢_制服_正面_normal", 500, true);}
目を合わせることはなかったけど、心の声で朝の挨拶を交わした。

ＤＱＮな女子どもがニヤニヤと僕を見ていた。

昨日の今日だ。まだ“テレビでバカやった、キモオタの自称超能力者”というレッテルは剥がれないだろう。

男子のＤＱＮ連中は、まだ来ていないらしい。あいつらはよく１限目の授業をサボる。僕にはそうしてもらった方が都合がいい。

三住くんは僕を一瞥しただけで、寄ってこなかった。
彼との縁ももう切れたと言っていいかもね。
そもそも僕と彼が友達だったっていうのがおかしな話だったし。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Fade("back02", 0, 0, null, true);
	Fade("back02", 1000, 1000, null, true);

	Delete("back01");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
僕は自分の席に座って、寝たふりをした。
そして、心の中で呼びかける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, null);
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	Delete("back02");
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603001]
――こずぴぃ。聞こえる？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_正面","normal", 1200, @-50);
	FadeStand("st梢_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600020ko">
「はいはーい？　なんでしょー？」

僕を、助けて。このままじゃ、僕は、殺される。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600030ko">
「殺されちゃうのー？」

だから、守ってほしい。こずぴぃの、ディソードで。

{	Stand("st梢_制服_通常","sad", 1200, @-50);
	DeleteStand("st梢_制服_正面_normal", 300, false);
	FadeStand("st梢_制服_通常_sad", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600040ko">
「うーん？」

{	Stand("st梢_制服_通常","angry", 1200, @-50);
	FadeStand("st梢_制服_通常_angry", 300, true);
	DeleteStand("st梢_制服_通常_sad", 0, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600050ko">
「それよりそーれーよーりー」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600060ko">
「拓巳しゃん、こずぴぃのこと、バカそうって思ってるでーしょ？　でーしょ？」

う……。バレてる……。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600070ko">
「うぷー。やっぱーり！　拓巳しゃん、ひどいのー」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600080ko">
「それにそーれーに、
こずぴぃはね、誰でもドカバキーッてするわけじゃ、ないよー？」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600090ko">
「あのね、こずぴぃは、こずぴぃに悪ーいことしようとする人だけ――」

{	Stand("st梢_制服_通常","smile", 1200, @-50);
	FadeStand("st梢_制服_通常_smile", 300, true);
	DeleteStand("st梢_制服_通常_angry", 0, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600100ko">
「ドカグシャベキーッてしてあげるのー♪」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
だって、周りが僕のことバカにしてくるんだ！

僕は、単なる善良なるオタクで、なにも悪いことなんてしてないのに！
ただ静かに引きこもって、生きていきたいだけなのに！
周りの方からちょっかいをかけてくるんだ！

なんなんだよ、くそっ！　なんで僕が、こんな目に合わなくちゃいけないんだ！

僕は悪くない。なにも悪くない。悪いのは周りのバカなＤＱＮどもだ。そして『将軍』だ。

その悪い連中から、僕を守ってくれって、こずぴぃに頼んでるんだよ。

この前、こずぴぃだって言ったじゃないか。僕よりも、僕にひどいことを言うゴキブリ野郎どもの方が、価値がないって。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_通常","normal", 1200, @-50);
	FadeStand("st梢_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600110ko">
「ん～、言ったかもかも！」

{	Stand("st梢_制服_正面","normal", 1200, @-50);
	DeleteStand("st梢_制服_通常_normal", 300, false);
	FadeStand("st梢_制服_正面_normal", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600120ko">
「でもね、こずぴぃは、その『将軍』さんって人、知～らないよ？」

僕はそいつを知ってる。車椅子に乗ってるじいさんみたいな子供だよ。近いうちに、間違いなく僕の前に現れる。僕を、殺そうとしてるんだ。

七海をさらったのだってあいつだし！

{	Stand("st梢_制服_正面","sad", 1200, @-50);
	FadeStand("st梢_制服_正面_sad", 300, true);
	DeleteStand("st梢_制服_正面_normal", 0, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600130ko">
「そっかぁ。拓巳しゃん、た～いへんなのね」

ちょ、そ、それだけ……？

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn04/00600140ko">
「殺したいけど、殺しちゃダ～メって、セナしゃんに言われてるのら～」

{	DeleteStand("st梢_制服_正面_sad", 500, true);}
くそっ、こずぴぃは僕よりもセナと仲がいいんだった。

机に突っ伏したまま、僕は歯噛みし、拳を握りしめる。

――でも、こずぴぃ以外に、頼れる人はいないんだ。セナは、なんだか怖いし、僕なんかのために、動いてくれなさそうな気がするんだ。

こずぴぃだけが、頼りなんだよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	ClearAll(2000);
	Wait(1000);
}



