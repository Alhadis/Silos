//<continuation number="70">

chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_151a_★あやせ編_１１月４日火";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	ch07_151a_★あやせ編_１１月４日火();
}


function ch07_151a_★あやせ編_１１月４日火()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編

//アイキャッチ
//※拓巳視点に戻る
//１１月４日（火）//日付は表示しない
//ＢＧ//校門前
	CreateColor("黒", 1000, 0, 0, 1280, 720,"Black");
	
	CreateSE("SE01","SE_日常_校門前_朝");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);
	
//ＢＧ//校門前
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg016_01_0_学校校門_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	
	Fade("黒", 1000, 0, null, true);
	Delete("黒");



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
最低登校シフト表では、今日は登校する日じゃなかった。
それでも学校に来た目的は、ただひとつ。

梨深に会うため。

きっと今日も、ＤＱＮなクラスメイト連中からあれこれバカにされるだろう。

それは辛いけど、梨深に会えるかもしれないっていうことに比べればまだ耐えることができた。

また『将軍』が僕の前に現れる可能性がある。

どうやらあいつは、ゲーム感覚で僕を狙っているらしい。だからあいつの気まぐれで次の“クエスト”がいつ始まるかもしれないんだ。

それが怖い。

ディソードを手に入れようとしたのだって、元はと言えば『将軍』から自分の身を守るためだったんだし。

剣のない僕が、どうすれば『将軍』の魔の手から逃れられるのか。
梨深に一緒にいてもらう？

でも梨深が学校を休んでいることが気になる。
七海みたいに、今度は梨深を人質に取られたらどうする？

誰か、僕を助けてくれそうな人はいないのか……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundStop("SE01");
	
//ＢＧ//教室
	CreateSE("SE02","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE02", 2000, 800, 0, 1000, null, true);

	CreateTexture360("背景４", 50, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");
	DrawTransition("背景１", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);
	
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
顔を伏せたまま教室に入る。
席に着く前に、一度だけ教室内をぐるっと見回した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 500, 0, 1000, 200, null, "cg/data/left3.png", true);
	DrawTransition("黒", 500, 1000, 0, 200, null, "cg/data/right3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
まずは梨深の席。

無人。

今日も休みなのかな。
ホントに、ただ休んでるだけなんだろうか。
不安がよぎる。

次にこずぴぃの席。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 500, 0, 1000, 200, null, "cg/data/left3.png", true);
	
	Stand("st梢_制服_正面","normal", 200, @+150);
	FadeStand("st梢_制服_正面_normal", 0, true);
	
	DrawTransition("黒", 500, 1000, 0, 200, null, "cg/data/right3.png", true);
	Delete("黒");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
彼女は席について、うつむき、縮こまっている。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn05/00300010ko">
「おはーよう、拓巳しゃん」

――おはよう、こずぴぃ。

{	DeleteStand("st梢_制服_正面_normal", 500, true);}
目を合わせることはなかったけど、心の声で朝の挨拶を交わした。

ＤＱＮな女子どもがニヤニヤと僕を見ていた。

昨日の今日だ。まだ“テレビでバカやった、キモオタの自称超能力者”というレッテルは剥がれないだろう。

男子のＤＱＮ連中は、まだ来ていないらしい。あいつらはよく１限目の授業をサボる。僕にはそうしてもらった方が都合がいい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景５", 300, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Fade("背景５", 1000, 1000, null, true);
	Delete("背景４");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
席に着く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("効果０", 800, center, middle, "SCREEN");
	
	CreateSE("SE03","SE_じん体_動作_抱く1");
	MusicStart("SE03", 0, 1000, 0, 700, null, false);

	Wait(300);

	Shake("効果０", 200, 0, 10, 0, 0, 0, null, true);
	Delete("効果０");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
と、その僕の背中を誰かが叩いてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","sigh", 500, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100130mi">
「お、おう、タク」

気まずそうな顔をした三住くんだった。
背中を叩く手は、以前よりかなり遠慮がちなものだった。

この間は僕を無視したのに……。
どうしてまた声をかけてくるんだろう。

僕と話すと、きっと不幸になる。
クラスのＤＱＮ連中のイジメの標的になる。

そうだ、三住くんも、
僕みたいなキモオタの相手はしない方がいいよ――

僕が黙っていると、三住くんは無理矢理笑みを浮かべた。

{	Stand("bu大輔_制服_通常","normal", 500, @+100);
	FadeStand("bu大輔_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100140mi">
「暗いなあ、朝から辛気くさいぜ。ははは」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100150mi">
「ま、お前はそういうヤツだって分かってるけどな」

その言葉はキツイ物言いではあるけど、皮肉とか嫌味とかそういう感じはしなかった。

なぜって、前からいつもそんなようなことを彼には言われていたから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 3000, 1, null);
	BGMPlay360("CH11",3000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【三住】
<voice name="三住" class="三住" src="voice/chn05/00300020mi">
「ええと、あれだ、この前は、悪かったな」

//■３６０
//【三住】
<voice name="三住" class="三住" src="voice/chn05/00300030mi">
//「自分の立ち位置ってのを、つかみかねてててな」
「自分の立ち位置ってのを、つかみかねててな」

//【三住】
<voice name="三住" class="三住" src="voice/chn05/00300040mi">
「でもま、いろいろ考えて、やっぱ今まで通りで行くことにしたからよ」

//【三住】
<voice name="三住" class="三住" src="voice/chn05/00300050mi">
「よろしくな」

あっけらかんと、そう言ってくる。
こんな僕に、今まで通りに接するって？
僕みたいなキモオタに？　打算もなにもなく？

やばい、濡れた。
三住くんになら掘られてもいい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 0, 800, null);
	BGMPlay360("CH11",0,0,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【三住】
<voice name="三住" class="三住" src="voice/chn05/00300060mi">
「まあ、正直なところを言うと、お前に優しくしてやることで、俺は女にモテるわけだ」

//【三住】
<voice name="三住" class="三住" src="voice/chn05/00300070mi">
「あんなダメ人間にも分け隔てなく接するなんて、とってもかっこいい人だわ、キャッ。ってな」

……三住大輔は死ねばいいと思う。
せっかく惚れそうになったのに。

わざわざ言わなければ誰もそんな打算には気付かないのに。

もっとも、そこでこうして言っちゃうのが、彼らしいと言えば彼らしかった。開けっぴろげ、っていうか。

それで、吹っ切れた。
僕はつい、苦笑してしまった。

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100210mi">
「そう言えば、岸本のこと聞いたか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100220mi">
「まだ入院中らしいぜ。ケガは大したことなかったんだけど、精神的にかなり参ってるらしい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","pride", 500, @+100);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100230mi">
「いいかタク。女を落とすのに一番手っ取り早いのは、弱ってるときに優しくしてやることだ」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100240mi">
「というわけでオレ、本気で岸本の見舞いに行こうかなーと思ってんだよね」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100290mi">
「そう言えばタクって、岸本と知り合いだったよな。なあ、一緒に行ってくんねえ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/15100300ta">
「え、あ、えっと……」

三住くんらしいと言えばらしい話題だった。
っていうか、その発想はなかった。

あやせ、か……。
梨深がいない以上、他に頼れるのは、あやせぐらいかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//～～Ｆ・Ｏ
	SetVolume("SE02", 1500, 0, null);
	Wait(1000);

//以下、“ch07_152_インターミッション３２”内容は変更なし

//アイキャッチ



}