//<continuation number="210">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_011_西條七海";
		$GameContiune = 1;
		Reset();
	}

	ch01_011_西條七海();
}


function ch01_011_西條七海()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


	CreateSE("SE01","SE_日常_扉_開ける");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateColor("背景１", 1600, 0, 0, 1280, 720, "White");
	Request("背景１", Lock);
	Request("SE01", Lock);
	Request("背景１", AddRender);
	Fade("背景１", 0, 0, null, true);

	Fade("背景１", 300, 1000, null, false);
	DrawTransition("背景１", 300, 0, 1000, 500, null, "cg/data/爆発２.png", true);

	Delete("*", 0, true);

	CreateTexture360("背景２", 100, 0, -848, "cg/ev/ev801_01_1_七海来訪_a.jpg");

	Fade("背景１", 2000, 0, null, true);
	Request("SE01", UnLock);
	Request("背景１", UnLock);
	Delete("背景１");


//☆Cut-64-----------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100010na">
「あ、やっと出てきた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH08", 2000, 1000, true);
	Move("背景２", 1500, @0, @+880, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100020na">
「生存かくに～ん☆」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01100030ta">
「…………」

この幼児体型のちんまいのが、僕の妹。年齢はひとつ下。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100040na">
「呼んでるんだから、返事ぐらいしてよね。おにぃ死んじゃったかもって思ったじゃん」

顔を合わせるなり文句を言い出す。

両手を腰に当てふんぞり返るようにして立っている姿からも分かる通り、クソ生意気なヤツなんだ。

僕にとってこいつの存在は、百害あって一利なし。

//きたなっ＝汚い
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100050na">
「うわっ、相変わらず部屋の中きたなっ。ちょっとは片付けなよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01100060ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_01_1_拓巳部屋_a.jpg");
	Fade("背景１", 500, 1000, null, true);
	FadeDelete("背景２", 0, false);

	Stand("st七海_制服_通常","normal", 200, @-150);
	FadeStand("st七海_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]

七海は僕の了承も取らずに、ズカズカと勝手に部屋の中に入ってくる。

妹だからって調子に乗りやがって……。

妹萌えとか言ってる連中に、僕は声を大にして教えてやりたいね。

"戦わなきゃ、現実と"って。

ま、我が妹ながら顔は悪くないとは思うけど。ロリ好きにはこういう童顔女はストライクゾーンど真ん中なのかもしれない。

でも実の兄としてはそんなの関係なくて、まったくハァハァしない。むしろションベン臭いって思っちゃうぐらいだ。

あ、ちなみにロリキャラは嫌いじゃないけどね。二次元限定で。ふひひ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st七海_制服_通常","pride", 200, @-150);
	FadeStand("st七海_制服_通常_pride", 300, false);
	DeleteStand("st七海_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100070na">
「カビくさ～。おにぃの部屋って相変わらず不潔。掃除しろっていつも言ってるじゃん。どうしてしないの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01100080ta">
「…………」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100090na">
「ま、どうせ掃除してくれるカノジョなんかいないだろうし、おにぃってずぼらだから、こうなるのは目に見えてるけどさ～」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01100100ta">
「…………」

{	Stand("st七海_制服_通常","smile", 200, @-150);
	FadeStand("st七海_制服_通常_smile", 300, true);
	DeleteStand("st七海_制服_通常_pride", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100110na">
「こうなったらやっぱりナナが掃除しに来てあげるしかないかなぁ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01100120ta">
「だ、だが断る……」

{	Stand("st七海_制服_通常","shock", 200, @-150);
	DeleteStand("st七海_制服_通常_smile", 300, false);
	FadeStand("st七海_制服_通常_shock", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100130na">
「なんでよぉ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01100140ta">
「お、お前に……部屋……荒らされたくない……」

//「ひっど」＝「ひどい」
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100150na">
「ひっど……。それがわざわざ生存確認しに来てあげてる妹に言うセリフ？」

お前だって兄に対して敬意の欠片もない態度を取ってるじゃないか。それに、誰も生存確認しに来てくれだなんて頼んでない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_通常","angry", 200, @-150);
	FadeStand("st七海_制服_通常_angry", 300, true);
	DeleteStand("st七海_制服_通常_shock", 0, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100160na">
「まったく……なんでこんな面倒ばっかりかけさせる兄弟と血繋がってるんだろ。たまにやんなっちゃうよ」

{	Stand("st七海_制服_通常","normal", 200, @-150);
	FadeStand("st七海_制服_通常_normal", 300, true);
	DeleteStand("st七海_制服_通常_angry", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100170na">
「はあ、なんかのど渇いちゃった。飲み物もらうね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_制服_通常_normal", 200, false);
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	Delete("背景１");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600005]
//「兄弟」＝伏線です
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01100180ta">
「…………」

{	CreateSE("SE01","SE_じん体_動作_手_冷蔵庫を開ける");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
七海はどんどん部屋の奥まで歩いていき、冷蔵庫を勝手に開いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH08", 1000, 500, NULL);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	Stand("bu七海_制服_通常","pride", 200, @+150);
	Stand("bu七海_制服_通常","smile", 200, @+150);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	FadeStand("bu七海_制服_通常_pride", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600006]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100190na">
「コーラしかないじゃーん。ミルクティとか用意しといてよぉ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01100200ta">
「し、知らんがな……」

{	FadeStand("bu七海_制服_通常_smile", 300, true);
	DeleteStand("bu七海_制服_通常_pride", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01100210na">
「しょうがないなぁ、じゃあコーラもらうね」

相変わらず七海は兄の了解を得るつもりはないらしい。

ペットボトルのコーラ――ちなみに僕の飲みかけだ――を冷蔵庫から取り出すと、蓋を開いてから、一瞬だけ躊躇して、それからラッパ飲みでコーラをあおった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("２");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

	SetVolume360("CH08", 1000, 1000, NULL);

	DeleteStand("bu七海_制服_通常_smile", 300, true);


}

