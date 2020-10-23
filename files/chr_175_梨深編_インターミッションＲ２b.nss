//<continuation number="980">
//■インターミッションＲ２b

chapter main
{

	$PreGameName = "boot_梨深ルート";

	if($GameStart != 1)
	{
		$GameName = "chr_175_梨深編_インターミッションＲ２b";
		$GameContiune = 1;
		$梨深ルート=true;
		$RouteON=true;
		Reset();
	}

	chr_175_梨深編_インターミッションＲ２b();
}


function chr_175_梨深編_インターミッションＲ２b()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//ＢＧ//闇の中にスポットライト
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);



	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg248_01_6_chnスポットライト_a.jpg");
	Fade("Black", 2000, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
――もう、いいよ。もうやめてくれ。

梨深の、あの笑顔の裏に、こんな悲惨な過去があったなんて。

僕は倒れている梨深の亡骸のひとつを、胸に抱き寄せた。
その亡骸はとても冷たく、魂が失われているのがはっきりと分かった。

それでも僕には、梨深が必要なんだ。
君に、いてほしいんだ……！

{	Fade("Black", 0, 1000, null, true);}
僕は願う。
僕は、妄想する。

起きて……。
起きてくれ、梨深……。

僕を助けてくれる、たった１人の人。

こんなの僕のエゴだけど、僕は、梨深に守ってもらいたいんだ……！
こんなの僕の勝手な言い分だけど、梨深と一緒なら、僕はダメな自分を変えられる気がするんだ……！

だから――

起きろ、梨深――！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE3601","SE_擬音_妄そうIN");
	MusicStart("SE3601",0,1000,0,1000,null,false);


//画面エフェクト//波紋
//▼べー：ムービーでしょうか？指示待ちとりあえず白フラッシュ
	CreateColor("White", 1100, 0, 0, 1280, 720, "White");
	Request("White", AddRender);
	Fade("White", 0, 0, null, true);
	Fade("White", 0, 1000, null, true);
//なにかＳＥ欲しい……
//▼べー：波音入れます

	Wait(2000);

	CreateSE("SE01","SE_自然_なみ音_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	Delete("Black");

//ＢＧ//海と青い空
	CreateTexture360("back06", 100, 0, 0, "cg/bg/bg113_01_6_海と青い空_a.jpg");
	Fade("back06", 0, 0, null, true);
	Fade("back06", 1000, 1000, null, true);
	Delete("back05");

	Fade("White", 1000, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
気が付くと僕は再び、青で染まった世界にいた。
水面が小刻みに波打っている。

水の下から、ゆっくりと浮き上がってくるのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：立ち絵組み込まれ次第位置調整します。
//梨深の立ち絵たくさん表示
//１０章での梢の鏡イベント時のときのような
//梨深の立ち絵はすべて服装は白いワンピース。できれば全員目を閉じてるように
	CreateTextureEX("梨深１", 300, Center, Middle, "cg/st/st梨深_白ワンピ_正面_lost_eye02.png");
	Move("梨深１", 0, @0, 0, Axl1, false);	
	Fade("梨深１", 500, 400, null, true);
	CreateTextureEX("梨深２", 300, Center, Middle, "cg/st/st梨深_白ワンピ_正面_lost_eye02.png");
	Move("梨深２", 0, @+216, 0, Axl1, false);
	Fade("梨深２", 500, 300, null, true);
	CreateTextureEX("梨深３", 300, Center, Middle, "cg/st/st梨深_白ワンピ_正面_lost_eye02.png");
	Move("梨深３", 0, @-216, 0, Axl1, false);
	Fade("梨深３", 500, 300, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
たくさんの、梨深。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("梨深４", 300, Center, Middle, "cg/st/st梨深_白ワンピ_正面_lost_eye02.png");
	Move("梨深４", 0, @+400, 0, Axl1, false);
	Fade("梨深４", 500, 200, null, true);
	CreateTextureEX("梨深５", 300, Center, Middle, "cg/st/st梨深_白ワンピ_正面_lost_eye02.png");
	Move("梨深５", 0, @-400, 0, Axl1, false);
	Fade("梨深５", 500, 200, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
みんな、目を閉じて、水の上に立ち尽くしている。

やがて、梨深たちは足を動かすこともなく、水の上を滑るように移動する。

梨深に別の梨深が重なり、その梨深がさらに別の梨深へと重なる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE360201","SE_えい像_拓巳大蛇");
	MusicStart("SE360201",0,1000,0,1000,null,false);

	FadeDelete("梨深４", 500, false);
	Move("梨深４", 500, @-400, @0, Axl1, true);

	Fade("White", 100, 1000, null, true);
	Fade("White", 800, 0, null, true);
	Fade("梨深１", 300, 500, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
――梨深が、統合されていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE360301","SE_えい像_拓巳大蛇");
	MusicStart("SE360301",0,1000,0,1000,null,false);

	FadeDelete("梨深５", 500, false);
	Move("梨深５", 500, @400, @0, Axl1, true);

	Fade("White", 100, 1000, null, true);
	Fade("White", 800, 0, null, true);
	Fade("梨深１", 300, 600, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604002]
僕はそれを、呆然と見守った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE360401","SE_えい像_拓巳大蛇");
	MusicStart("SE360401",0,1000,0,1000,null,false);

	FadeDelete("梨深２", 500, false);
	Move("梨深２", 500, @-216, @0, Axl1, true);

	Fade("White", 100, 1000, null, true);
	Fade("White", 800, 0, null, true);
	Fade("梨深１", 300, 800, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605002]
やがて梨深の数は４人となり、さらに２人に減り――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE360501","SE_えい像_拓巳大蛇");
	MusicStart("SE360501",0,1000,0,1000,null,false);

	FadeDelete("梨深３", 500, false);
	Move("梨深３", 500, @216, @0, Axl1, true);

	Fade("White", 100, 1000, null, true);
	Fade("White", 800, 0, null, true);
	Fade("梨深１", 300, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3606002]
そして、最後の２人の梨深が、ゆっくりと溶け合っていって。

１人になって。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE360601","SE_擬音_ディそーど出現");
	MusicStart("SE360601",0,1000,0,1000,null,false);

	SetVolume("SE01", 3000, 0, null);

	Fade("White", 100, 1000, null, true);

	FadeDelete("White", 2000, true);

//梨深立ち絵の目を開く
	CreateTextureEX("梨深０", 400, Center, Middle, "cg/st/st梨深_白ワンピ_正面_lost.png");
	Move("梨深０", 0, @0, 0, Axl1, false);
	Fade("梨深０", 2000, 1000, null, true);
	Delete("梨深１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3607002]
目を、開いた。

僕を、見た。

この梨深は、僕の知っている、あの梨深なんだろうか。
それとも、別の梨深なんだろうか。

分からなくて。声をかけるのが怖くて。
僕は、梨深が口を開くのを待った。

と、梨深が優しく微笑んで。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

//▼べー：立ち絵：白ワンピ登録され次第差し替え、位置も確認
//以下、“妄想エフェクト”というボイスエフェクトは４章“ch04_074_梨深の妄想世界”と同じエフェクトで
	Stand("st梨深_白ワンピ_通常","smile", 500, @Center);
	FadeDelete("梨深０", 500, false);
	FadeStand("st梨深_白ワンピ_通常_smile", 500, true);

	Stand("st梨深_白ワンピ_通常ビシッ！","smile", 500, @Center);
	DeleteStand("st梨深_白ワンピ_通常_smile", 300, false);
	FadeStand("st梨深_白ワンピ_通常ビシッ！_smile", 300, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100700ri">
「ビシィ」

いつもの、あのポーズを――
してくれたんだ。

//▼べー：立ち絵：ワンピ登録次第差し替え
//おがみ：BGM：新しいので合うのがあれば
{	BGMPlay360("CH22",0,1000,true);
	Stand("st梨深_白ワンピ_正面","normal", 500, @Center);
	DeleteStand("st梨深_白ワンピ_通常ビシッ！_smile", 300, false);
	FadeStand("st梨深_白ワンピ_正面_normal", 300, true);}
//ＶＦ//妄想エフェクト
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02100710ta">
「梨深……？　梨深なんだね……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：立ち絵：ワンピ登録次第差し替え
	DeleteStand("st梨深_白ワンピ_正面_normal", 500, true);
	Stand("bu梨深_白ワンピ_正面","normal", 500, @Center);
	FadeStand("bu梨深_白ワンピ_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100720ri">
「うん」

{	CreateSE("SE36101","SE_じん体_動作_抱く1");
	MusicStart("SE36101",0,1000,0,1000,null,false);
	DeleteStand("bu梨深_白ワンピ_正面_normal", 500, true);}
梨深がうなずく。
そして、僕を正面から抱きしめてくれた。

僕は梨深の胸元に、顔を埋める。
胸の弾力と柔らかさが、頬を通して伝わってくる。

重力が消える。
僕と梨深は、青の中を漂い始める。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("リミキス１", 600, 0, 0, "cg/ev/ev114_01_6_梨深キス2_a.jpg");
	Fade("リミキス１", 0, 0, null, true);
	Fade("リミキス１", 1500, 1000, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100730ri">
「タクの声、聞こえたよ」

//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100740ri">
「“起きろ、梨深”って」

//◆泣く
//ＶＦ//妄想エフェクト
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02100750ta">
「よかった……ぐすっ、よかった……」

寝そべるような姿勢のまま、梨深は僕を抱き、髪を繰り返し繰り返し、そっと撫でてくれる。

それがとても心地よくて、梨深の優しさに包み込まれているかのようで、まるで幼い頃の、母親に抱かれていたときに似た安心感があって。

いつまでもそうしていたかったけど、梨深が梨深であることを確かめたくて、僕は頭の向きをわずかにずらしてその顔を見つめた。

//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100760ri">
「あたしのために泣いてくれるの？」

//	Stand("bu梨深_白ワンピ_正面","smile", 500, @Center);
//	DeleteStand("bu梨深_白ワンピ_正面_normal", 300, false);
//	FadeStand("bu梨深_白ワンピ_正面_smile", 300, true);
//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100770ri">
「あは、タクって、泣き虫だなあ」

梨深は朗らかに笑った。
あんな過去があったのに。

//	Stand("bu梨深_白ワンピ_正面","normal", 500, @Center);
//	DeleteStand("bu梨深_白ワンピ_正面_smile", 300, false);
//	FadeStand("bu梨深_白ワンピ_正面_normal", 300, true);
//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100780ri">
「……あたし、全部思い出したよ」

//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100790ri">
「これまで、自分の心を自殺させることで消してきた、
たくさんのこと……」

//	Stand("bu梨深_白ワンピ_正面","sad", 500, @Center);
//	DeleteStand("bu梨深_白ワンピ_正面_normal", 300, false);
//	FadeStand("bu梨深_白ワンピ_正面_sad", 300, true);
//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100800ri">
「でも、思い出さない方が、まだ楽だったかな……」

//ＶＦ//妄想エフェクト
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02100810ta">
「りみ……？」

梨深は泣きそうな顔になり、それでも無理に笑って、僕の髪に指を絡めてくる。

//	Stand("bu梨深_白ワンピ_正面","normal", 500, @Center);
//	DeleteStand("bu梨深_白ワンピ_正面_sad", 300, false);
//	FadeStand("bu梨深_白ワンピ_正面_normal", 300, true);
//◆ささやき
//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100820ri">
「ねえ……」

//◆ささやき
//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100830ri">
「キス、しよっか」

//ＶＦ//妄想エフェクト
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02100840ta">
「え……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：ＥＶ：ダミーきたら差し替えます。
//ＣＧ//梨深とキスその２
//ＢＧは『海と青い空』梨深は白ワンピ、拓巳は制服
	CreateTexture360("リミキス２", 600, 0, 0, "cg/ev/ev114_02_6_梨深キス2_a.jpg");
	Fade("リミキス２", 0, 0, null, true);
	Fade("リミキス２", 1000, 1000, null, true);

	Wait(1500);
//	DeleteStand("bu梨深_白ワンピ_正面_normal", 500, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
気が付けば、少し強引に顎を上げられて、僕の唇に温かくて柔らかくて、とてもいい匂いがするなにかが押しつけられた。

//◆キスした
//ＶＦ//妄想エフェクト
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100850ri">
「ん……」

目の前に梨深の顔。
梨深は目を閉じている。
梨深の吐息を感じる。

これが、キス……。
とても甘美で、脳みそがとろけそうな気持ちよさで……。

このただ一度のキスで、僕の心の中は梨深への愛おしさで満たされる。
キモオタのくせに、彼女に依存してばかりなのに、彼女のすべてが欲しいって思う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 2000, 1000, null, true);
	Delete("リミキス１");
	Delete("リミキス２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
目を閉じて。
その感触を、僕は記憶に刻みつけた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(2000);

//ＢＧ//拓巳部屋地震後
	CreateTexture360("back07", 100, 0, 0, "cg/bg/bg049_01_6_拓巳部屋地震後_a.jpg");
	Stand("bu梨深_制服_正面","normal", 500, @Center);
	FadeStand("bu梨深_制服_正面_normal", 0, true);
	Fade("Black", 1000, 0, null, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
次に目を開けたときには、僕は自分の部屋にいた。
梨深は床に寝そべり、相変わらず僕を抱いてくれていて。
ゆっくりと、唇が離れていった。

//以下、ボイスエフェクトありません
//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100860ri">
「……ただいま」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02100870ta">
「う、うん……」

{	Stand("bu梨深_制服_正面","smile", 500, @Center);
	DeleteStand("bu梨深_制服_正面_normal", 300, false);
	FadeStand("bu梨深_制服_正面_smile", 300, true);}
梨深ははにかんだ。
そんな仕草が、とてもかわいい。

見つめ合う。
すごく照れくさい。

女の子の身体って、こんなに柔らかいんだなあ。
三次元最高。

僕にもついにリアルカノジョができた。
もう非モテのキモオタとは言わせないぞ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100880ri">
「……約束したもんね。タクを守るって」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02100890ta">
「ぼ、僕を、守って、くれる……？」

{	Stand("bu梨深_制服_正面","normal", 500, @Center);
	DeleteStand("bu梨深_制服_正面_smile", 300, false);
	FadeStand("bu梨深_制服_正面_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100900ri">
「……守るよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100910ri">
「タクも、タクミも、ナナちゃんも」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02100920ta">
「……？」

なにを言ってるんだ……？
僕の戸惑いをよそに、梨深は僕から目をそらし、天井を見上げた。

{	Stand("bu梨深_制服_通常","normal", 500, @Center);
	DeleteStand("bu梨深_制服_正面_normal", 300, false);
	FadeStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100930ri">
「前は、タクミに心を救ってもらって――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100940ri">
「今度は、タクに心を助けてもらって――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100950ri">
「だから、今度こそ、あたしがあなたたちを守る」

タクミとタク、ふたつの呼び方を使い分ける意味はいまいち分からないけど。ギガロマニアックスである梨深に、守るって言ってもらえたなら、もうなにも心配はない。

『将軍』がなにを言ってきたって、梨深がなんとかしてくれる。
僕は、梨深さえ一緒にいてくれれば、それでいい。

{	Stand("bu梨深_制服_通常","smile", 500, @Center);
	DeleteStand("st梨深_制服_通常_normal", 300, false);
	FadeStand("bu梨深_制服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100960ri">
「あたし、頑張るね……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100970ri">
「頑張って、罪滅ぼしもするし、
あなたたちからの恩にも、報いるから……」

罪滅ぼし……。セナとこずぴぃのことだろうか。でもあれは正当防衛だ。仕方なかった、って考えるべきなんだ。

それより違和感を覚えたのは“あなたたちからの恩”っていう部分だ。
それって、誰のことだ……？

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100980ri">
「だから今は、眠って、タク……」

梨深が喋るたびに、その振動を彼女の身体から感じる。
いまだ、彼女の指は僕の髪を撫で続けている。

{	Fade("Black", 5000, 0, null, false);}
とても心地よくて。
なんだか、すごく眠くなってきて。

梨深に抱かれながら眠れることの幸せを噛みしめながら。
僕は、目を閉じた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);

//～～Ｆ・Ｏ

	Wait(2000);
}
