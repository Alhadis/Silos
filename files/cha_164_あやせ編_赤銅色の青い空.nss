//<continuation number="1200">
//ＢＧ//道玄坂・昼・崩壊後

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_164_あやせ編_赤銅色の青い空";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_164_あやせ編_赤銅色の青い空();
}


function cha_164_あやせ編_赤銅色の青い空()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");

	CreateSE("SE3699","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE3699",2000,400,0,1000,null,true);


	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
セナとこずぴぃは放置した。助けてあげたいけど今の僕にとてもそんな余裕はなかったし、あやせも興味がないようだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	FadeDelete("Black", 1000, true);
	Wait(500);
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
渋谷駅の方へと戻る。

途中にも、ケガをした人たちが何人もうずくまっていた。そしていくつもの死体が横たわっていた。

あやせは空を見上げて、険しい表情をしている。
僕は吐き気をこらえて、そのあやせに問いかけた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300010ta">
「あやせは、ど、どんな結末を、望むの……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_制服_通常","shock", 250, @-50);
	FadeStand("stあやせ_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300020ay">
「結末……？」

//おがみ：↓優愛＞リミの間違い
優愛は行方不明。
セナもこずぴぃも、心を破壊されていた。

ギガロマニアックスである彼女たちから、あやせはディソードをかすめ取った。盗んだ、と言った方がいい。

そういう因果を作ったのはあやせだ。あやせじゃないと言い切れるのか？運良く、たまたま、ディソードを持つギガロマニアックスが精神崩壊を起こしてへたり込んでいるのを見つけたって？

そんなわけあるか。

そしてこの因果があやせによるものなら、地震を起こしたのもあやせだ。グラジオールはあやせの創作した神話だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300030ta">
「こ、この、じ、地震が、あやせの妄想じゃないって、言い切れる？　あ、あやせだって、の、望んでたんでしょ？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300040ay">
「……そうね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300050ta">
「な、なんでこんなことを……」

{	Stand("stあやせ_制服_通常","hard", 250, @-50);
	FadeStand("stあやせ_制服_通常_hard", 300, true);
	DeleteStand("stあやせ_制服_通常_shock", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300060ay">
「拓巳、結論を急がないで」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300070ay">
「すでに予言されていたの。ツィーグラーによって」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300080ay">
「私はそれを知っていた。ただそれだけ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300090ta">
「グ、グ、グラジオール記は、あやせの妄想じゃないか！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300100ta">
「そ、そんな本、ど、どこにも存在しないよ！」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300110ay">
「拓巳も見たはずよ、私の病室で」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300120ta">
「ああ、見たよ、で、でもあれは白紙だった！」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300130ay">
「拓巳に見えていなかっただけよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300140ta">
「そんなの、き、詭弁だ！　ウソだ！
　ぼ、僕を騙そうって言うのか！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("stあやせ_制服_通常","normal", 250, @-50);
	FadeStand("stあやせ_制服_通常_normal", 300, true);
	DeleteStand("stあやせ_制服_通常_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300150ay">
「……世界は約６７億ある」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300160ay">
「つまり人類の全人口よ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300170ay">
「異なっているの、それぞれの見ている世界は」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300180ay">
「まったく同一であることはないわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300190ay">
「拓巳と、私も、そう」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300200ta">
「そ、それがホントだって言うなら、ソ、ソースを出してよ！　どうせ、む、無理なんでしょ！？」

あやせは、僕をじっと見つめて。
眉をひそめた。

戸惑いの表情、と言うよりは。
まるで、感情を表に出すことをこらえているようで。

{	Stand("stあやせ_制服_通常","hard", 250, @-50);
	FadeStand("stあやせ_制服_通常_hard", 300, true);
	DeleteStand("stあやせ_制服_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300210ay">
「見たいの？　私が見ている世界を」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300220ta">
「できるなら、や、やってみてよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300230ta">
「例え見せられても、し、信じないだろうけど」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300240ay">
「違うわ、拓巳」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300250ay">
「キミは、もう、すでに、見ている」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300260ay">
「私の世界と、キミは少しずつ、同期し始めているのよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300270ta">
「な、なにを――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3699", 1000, 0, null);

//ＳＥ//衝撃音
//ＢＧ//道玄坂・崩壊後・錆び付いた世界
//ＢＧ「おどろおどろしいイメージ」で代用してもＯＫです

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("Red", 1000, 0, 0, 1280, 720, "Red");
	Fade("Red", 0, 0, null, true);
	Request("Red", AddRender);

	CreateSE("SE02","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
	CreateSE("SEおど","SE_衝撃_衝撃音02");

	CreateSE("SE3601","SE_じん体_血_噴きでる_包丁でさされ");
	CreateSE("SE3602","SE_衝撃_顔面蹴られる");

	CreateTextureEX("背景１", 150, 0, 0, "cg/bg/bg027_05_6_chn道玄坂_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	BGMPlay360("CH26", 2000, 1000, true);


	CreateMovie360("砂嵐", 500, Center, Middle, true, false, "dx/mv砂嵐.avi");	


//ＳＥ//衝撃音
//ＢＧ//おどろおどろしいイメージ


	MusicStart("SE02",0,1000,0,1000,null,true);
	Fade("砂嵐", 0, 1000, null, true);
	Wait(200);
	SetVolume("SE02", 0, 1, null);
	Fade("砂嵐", 0, 0, null, true);
	Wait(500);
	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);

	Fade("Red", 200, 1000, null, true);
	DeleteStand("stあやせ_制服_通常_hard", 0, true);

	Fade("背景１", 0, 1000, null, true);


	MusicStart("SEおど", 0, 700, 0, 1000, null, false);
	SetVolume("SE02", 1500, 300, null);

	FadeDelete("Red", 1000, false);
	Fade("砂嵐", 1000, 300, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
世界がまたも錆び付いた。

うずくまっている人たちが、黒い靄に包まれる。

瓦礫の下敷きになり、隙間から頭だけを出している子供がいた。
それを、父親らしき男が助けようとしている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);
	Fade("おど２", 0, 0, null, false);
	Fade("おど", 0, 0, null, true);
	Wait(300);
	SetVolume("SE02", 0, 300, null);
	Fade("おど２", 0, 500, null, false);
	Fade("おど", 0, 500, null, true);
	Fade("砂嵐", 0, 300, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
ノイズが走り。

{	MusicStart("SE3601",0,1000,0,1000,null,false);
	MusicStart("SE3602",0,1000,0,1000,null,false);}
父親は、なにを思ったのか子供の頭を踏み付ける。
子供の頭がスイカのように割れ、潰された。
血と脳漿が、ぶちまかれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 0, 0, null);
	SetVolume("SE3602", 0, 0, null);

	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);
	Fade("おど２", 0, 0, null, false);
	Fade("おど", 0, 0, null, true);

	Fade("背景１", 0, 0, null, true);


	Wait(300);
	SetVolume("SE02", 0, 1, null);
	Fade("砂嵐", 0, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
またノイズ。
子供の頭は無傷でそこにあり。
父親が「頑張れ、今助けるからな！」と声をかけている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE3603","SE_じん体_血_噴きでる_包丁でさされ");
	CreateSE("SE3604","SE_じん体_血_噴きでる_包丁でさされ");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);

	Fade("背景１", 0, 1000, null, true);

	Wait(100);
	SetVolume("SE02", 0, 300, null);
	Fade("おど２", 0, 500, null, false);
	Fade("おど", 0, 500, null, true);
	Fade("砂嵐", 0, 300, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
ノイズ。

{	MusicStart("SE3603",0,1000,0,1000,null,false);
	Wait(300);
	MusicStart("SE3604",0,1000,0,1000,null,false);}
子供が、瓦礫の中から外へと移動している。
「もたもたしてんじゃねえよ、クソオヤジ」という罵声と浴びせ、父親をナイフで滅多刺しにする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3603", 0, 0, null);
	SetVolume("SE3604", 0, 0, null);

	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);
	Fade("おど２", 0, 0, null, false);
	Fade("おど", 0, 0, null, true);

	Fade("背景１", 0, 0, null, true);

	Wait(300);
	SetVolume("SE02", 0, 1, null);
	Fade("砂嵐", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604004]
少し離れた場所に、若い男女が座り込んでいる。
２人で一枚の毛布に身を包み、肩を寄せ合っている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);

	Fade("背景１", 0, 1000, null, true);

	Wait(300);
	SetVolume("SE02", 0, 300, null);
	Fade("おど２", 0, 500, null, false);
	Fade("おど", 0, 500, null, true);
	Fade("砂嵐", 0, 300, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605004]
ノイズがそのカップルを包むと、男が女を犯していた。
女の悲鳴が周囲に響き渡る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);
	Fade("おど２", 0, 0, null, false);
	Fade("おど", 0, 0, null, true);

	Fade("背景１", 0, 0, null, true);

	Wait(300);
	SetVolume("SE02", 0, 1, null);
	Fade("砂嵐", 0, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3606004]
その悲鳴も再びのノイズとともに消える。
２人は何事もなかったようにうずくまっている。

２人の、中年の女がフラフラと歩いている。
姉妹のようにも見える。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE3605","SE_擬音_服がやぶれる");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);

	Fade("背景１", 0, 1000, null, true);

	Wait(300);
	SetVolume("SE02", 0, 300, null);
	Fade("おど２", 0, 500, null, false);
	Fade("おど", 0, 500, null, true);
	Fade("砂嵐", 0, 300, null, true);
	MusicStart("SE3605",0,1000,0,1000,null,false);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3607004]
ノイズが走り、片方の女の手が瞬時にもう１人の女の髪をつかんでいた。強引に引っ張るようにして、ブチブチと大量の髪を引っこ抜く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3605", 0, 0, null);
	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);
	Fade("おど２", 0, 0, null, false);
	Fade("おど", 0, 0, null, true);

	Fade("背景１", 0, 0, null, true);

	Wait(300);
	SetVolume("SE02", 500, 1, null);
	Fade("砂嵐", 0, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3608004]
すぐにノイズによってその髪は元に戻る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300280ta">
「なんだよ……これ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 0, 1000, null);
	Fade("砂嵐", 0, 1000, null, true);

	Fade("背景１", 0, 1000, null, true);

	Wait(300);
	SetVolume("SE02", 0, 300, null);
	Fade("砂嵐", 1000, 0, null, true);
	Delete("砂嵐");

	Wait(500);

	Stand("stあやせ_制服_通常","normal", 250, @-50);
	FadeStand("stあやせ_制服_通常_normal", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300290ay">
「私の世界よ」

これが？
僕の妄想じゃなくて、あやせの妄想だったの？
……そもそも、妄想なの？　それとも、現実？

あやせの胸のあたりにも、黒い靄が漂っていた。
本能的に、その靄を視界に入れたくないって思って、僕は目を背ける。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300300ay">
「拓巳の見ていた空は、どんな色をしていた？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300310ta">
「どんなって、青い……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300320ay">
「あんな色？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 200, 1000, null, true);

	Delete("背景１");

	CreateTexture360("赤い空", 800, 0, 0, "cg/bg/bg216_01_6_chn赤い空_a.jpg");

	DeleteStand("stあやせ_制服_通常_normal", 0, true);
	FadeDelete("Black", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【拓巳】
あやせは天を指差した。
空は赤い。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300330ta">
「あれは、赤銅色だ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300340ay">
「赤銅色……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300350ay">
「あの色は、青じゃないのね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300360ta">
「ど、どこからどう見ても、青空じゃ、ないよ。常識的に考えて」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300370ay">
「でも、私にとっては、あの色が、青なのよ」

なにを……言ってるんだ？


</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg027_05_6_chn道玄坂_a.jpg");
	Fade("赤い空", 1000, 0, null, true);
	Delete("赤い空");

	Stand("stあやせ_制服_通常","normal", 250, @-50);
	FadeStand("stあやせ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300380ay">
「拓巳は説明できるの？　青色って、どんな色？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300390ta">
「ど、どんなって、だから、空の色……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300400ay">
「あの色の空しか知らないのよ、私は」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01300410ta">
「み、みんな、青がどんな色かぐらい、し、知ってるでしょ！？」

{	Stand("stあやせ_制服_通常","hard", 250, @-50);
	FadeStand("stあやせ_制服_通常_hard", 300, true);
	DeleteStand("stあやせ_制服_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300420ay">
「だから、説明して。例えを使わずに。青が、どんな色なのか」

例えを、使わずに……？

考えてみる。でも、ダメだ。
青色について説明する言葉が、浮かんでこない。

そんな僕の態度を見て、あやせは悲しそうに目を細めた。

{	Stand("stあやせ_制服_自分抱きしめ","sad", 250, @-50);
	DeleteStand("stあやせ_制服_通常_hard", 300, false);
	FadeStand("stあやせ_制服_自分抱きしめ_sad", 300, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300430ay">
「世界は、約６７億ある。そう言ったはずよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300440ay">
「空の色も、６７億通りある」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01300450ay">
「みんな、見ているものが同じだとは限らないわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 500, 0, NULL);

}
