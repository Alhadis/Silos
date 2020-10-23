//<continuation number="670">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_196_梨深と将軍の過去";
		$GameContiune = 1;
		Reset();
	}

		ch09_196_梨深と将軍の過去();
}


function ch09_196_梨深と将軍の過去()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("back10", 1000, 0, 0, 1280, 720, "White");

	CreateSE("SE01","SE_自然_なみ音_LOOP");
	MusicStart("SE01", 1000, 300, 0, 1000, null, true);

//※以下、回想。４章冒頭の回想の詳細版
//ＢＧ//白
//ＳＥ//波の音

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆梨深はテンション低め
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600010ri">
「……あれは、空？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600020ri">
「あの空は――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600030ri">
「どうして、あんなに泣きたくなるくらい青いのかな？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//海と青い空
	CreateTextureEX("back03", 100, 0, 48, "cg/bg/bg113_01_6_海と青い空_a.jpg");
	Fade("back03", 0, 1000, null, true);
	FadeDelete("back10", 1000, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600040jn">
「それを望んだから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600050ri">
「あたしは、望んでない……」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600060jn">
「僕が、望んだんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600070jn">
「ここは、君の心象世界であると同時に、僕の心象世界でもあるから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateMovie360("movie01", 200, Center, Middle, true, false, "dx/mv海.avi");
	Fade("movie01", 0, 0, null, false);
//	Request("movie01", Play);
//	Move("movie01", 3000, @+0, -40, null, false);
	Fade("movie01", 2000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
梨深がこっちを振り向く。
怪訝な顔で、見つめてくる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600080ri">
「あなた、誰？　ここには、あたし以外はいないはずなのに」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600090ri">
「あなたは、別のあたし？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600100jn">
「違うよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600110ri">
「だったら、誰？　どうやってここに来たの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600120ri">
「あたしの心の中だよ？　ずっと、暗闇しかなかった。光は、あたしに当たるスポットライトだけ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600130ri">
「それなのに、あなたが来た途端に、暗闇がなくなって、空ができた」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600140jn">
「妄想が、シンクロしたんだ。君の力が、とても強かったから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600150ri">
「そう……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
梨深は、改めて空を見上げる。
透き通るような、紺碧の、空。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600160ri">
「あたし、本物の空、見たことないんだ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600170ri">
「あたしっていう人格が生まれたときにはね、もう、暗い部屋に閉じこめられてた」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600180ri">
「心の中も、外も、闇しかなかった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600190ri">
「そこからは、絶対に出してもらえないの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600200ri">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600210ri">
「あたし、今、死のうとしてたんだ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600220ri">
「心を、自殺させるの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600230ri">
「きっと、これまでのあたしも、そうしてきたと思うし」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600240ri">
「でも、せっかくあなたが空を持ってきてくれたから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600250ri">
「この光景を、記憶に刻んでおいて、いいかな？　次のあたしが、またこうして想像できるように」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600260jn">
「死にたいの？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600270ri">
「うん……」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600280jn">
「本当の空を、見てみたいとは思わないの？」

//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600290ri">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600300ri">
「……ねえ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600310ri">
「空って、本当にあるのかな？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600320jn">
「あるよ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600330jn">
「でも、現実の空は、この空よりも、汚れてる」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600340ri">
「どこにある？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600350ri">
「あの空は、どこにあるの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600360jn">
「君が、望めば、どこにでも」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600370ri">
「望んで、いいの……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604003]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600380jn">
「もちろんだよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600390ri">
「どうやって、望むの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600400jn">
「光は電磁場の波。その振動現象を人の視覚は色として捉えるんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600410jn">
「自分のデッドスポットに、望む色を当てはめてごらん。そうすれば――」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600420jn">
「君の望む世界の色を、作り出せる」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600430jn">
「世界は、君の望みに応えてくれるよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, null);
//～～Ｆ・Ｏ
	ClearAll(1000);

	Wait(500);

//ＢＧ//黒

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
その出会いから、何日か、あるいは何ヶ月か経って。僕の病室に、梨深がやってきた。

僕と彼女は、同じ病院に入院していた者同士。

ギガロマニアックスという、誇るべきなのか、忌むべきなのか分からない、人智を超越した力の持ち主同士。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＢＧ//病室

	CreateBG(100, 1000, 0, 0, "cg/bg/bg190_01_1_病室青空_a.jpg");


	BGMPlay360("CH16", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19600440na">
「おにぃ、お客さんだよ」

//◆からかうように。小声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19600450na">
「ねえねえ、誰？　カノジョさん？　いつの間に？」

//◆からかうように。小声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19600460na">
「やるねえ、おにぃってば」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600470jn">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600480ri">
「……また、会えたね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
彼女は、とてもやつれていた。

肌も病的なくらいに青白かったし。
髪はパサパサで、伸び放題で。
手の爪は割れていて。

常に、眩しそうに目を細めていた。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600490jn">
「本物の空は、見られた？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600500ri">
「うん」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19600510na">
「あ、そだ」

僕たちの様子を窺っていた七海が、なにかを思い出したかのように手を叩いた。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19600520na">
「ナナ、お洗濯してこなくちゃ。
梨深さん、でしたっけ？　どうぞごゆっくり～」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ドア閉める

	CreateSE("SE01","SE_日常_びょういんどあ_閉まる");
	MusicStart("SE01", 0, 500, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
七海が出ていく。
それを僕と梨深は２人してぼんやりと見送った。

梨深が、僕に向き直る。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600530ri">
「タクミは、いつから入院してるの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600540jn">
「５年ぐらい」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600550ri">
「退院の予定は？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600560jn">
「ないよ。僕の余命は……あと、２年ぐらいだと思うし」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600570ri">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600580ri">
「あたしは、あなたのおかげで……頑張ることができた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600590ri">
「終わりなんて、絶対にないと思ってた。でもあなたが教えてくれた空を見るまで、頑張ろうと思った」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600600ri">
「そしたら、急に、外に出してもらえた。用済みになった、って言った方が正しいかもしれないけど」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600610jn">
「そう」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600620ri">
「あたしは、あなたに救われたの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600630ri">
「だから、今度はあたしが、あなたの力になりたい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600640jn">
「そんなの、気にしなくていい」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600650jn">
「わざわざ、僕に会いに来なくてもいいよ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19600660jn">
「君には、これから普通に生きてほしい」

//◆切ない笑みを浮かべる
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19600670ri">
「普通の生き方なんて……分からないから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH16", 1000, 0, NULL);

	CreateColor("back10", 1000, 0, 0, 1280, 720, "White");
	Fade("back10", 0, 0, null, true);
	Fade("back10", 1000, 1000, null, true);
	Wait(1000);

}