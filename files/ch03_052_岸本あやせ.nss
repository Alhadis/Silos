//<continuation number="270">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_052_岸本あやせ";
		$GameContiune = 1;
		Reset();
	}

		ch03_052_岸本あやせ();
}


function ch03_052_岸本あやせ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//ＢＧ//翠明学園廊下

	SoundPlay("SE*",1000,0,false);
	Wait(1000);

	ClearAll(0);
	Wait(1000);

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE01", 2000, 300, true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
学校に着くまで七海を無視し続け、まだ騒がしい廊下を自分の教室に向かって歩く。

廊下を歩くときは端を歩くこと。速すぎず遅すぎずのスピードで歩くこと。とにかく目は伏せて誰とも目を合わせず歩くこと。その３つを僕は心がけている。

学校では目立たないように、空気のような存在であれ。それが僕の処世術なんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200010mi">
「よお、タク！」

なのに、その処世術の邪魔をする人間が今日も現れた。
三住くんは後ろから僕に追いついてくると、例によって馴れ馴れしく肩をポンと叩いてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_じん体_動作_尻餅");
	Stand("bu大輔_制服_通常","normal", 200,@+100);

	Shake("背景１", 200, 2, 2, 0, 0, 500, null, false);	
	SoundPlay("SE04", 0, 500, false);
	FadeStand("bu大輔_制服_通常_normal", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200020mi">
「おいっすー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05200030ta">
「…………」

//◆苦笑
{	Stand("bu大輔_制服_通常","smile", 200, @+100);
	FadeStand("bu大輔_制服_通常_smile", 300, false);
	DeleteStand("bu大輔_制服_通常_normal", 500, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200040mi">
「挨拶ぐらいしろって。
まあ、お前がそういうヤツだってのは分かってるけどよ」

//◆話したよな＝はなししたよな
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200050mi">
「なあ、この前、Ｄ組の女子の話したよな？
滅多に学校来ねーけどすげーかわいい女子がいるって」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05200060ta">
「……？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200070mi">
「その子、<RUBY text="きしもと">岸本</RUBY>あやせって名前なんだけどよ」

{	Stand("bu大輔_制服_通常","pride", 200, @+100);
	FadeStand("bu大輔_制服_通常_pride", 300, false);
	DeleteStand("bu大輔_制服_通常_smile", 500, false);}
//小声
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200080mi">
「実は、その岸本に関してすげー発見したんだ」

三住くんは急に声を潜め、周囲を窺った。
どうせまた下ネタだろうなあ……。僕は早くもうんざりして、ため息をつきそうになった。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200090mi">
「ＦＥＳいるだろＦＥＳ」

{	SoundPlay("SE01", 1000, 1, true);}
でもその言葉で、僕はハッとしてため息を呑み込む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200100mi">
「その岸本ってのが、ＦＥＳなんだよ！」

{	SoundPlay("SE01", 2000, 300, true);
	Stand("bu大輔_制服_通常","shock", 200, @+100);
	FadeStand("bu大輔_制服_通常_shock", 300, false);
	DeleteStand("bu大輔_制服_通常_pride", 500, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200110mi">
「俺、マジビビったぜ。まさかＦＥＳがウチの学校の生徒だなんてよ！」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200120mi">
「しかも俺らとタメだってことだぜ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
なぜか三住くんは近くの窓から上半身を乗り出し、空を見上げて恍惚の表情を浮かべた。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200130mi">
「運命ってきっと、こういうこと言うんだな」

ここは３階。もしちょっとでも足を踏み外したら転落して首の骨を折りそのまま人生終了だ。
僕はハラハラしながら見守った。

と、三住くんはますます身を乗り出し、窓の下にある昇降口を見下ろした。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200140mi">
「おっ、噂をすればなんとやらだ、
タク！　岸本を発見した！　もうすぐここに来るぜ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05200150ta">
「え……」

ここまで偶然が重なると、彼が言う通りなにか運命的な繋がりがあるのかもしれないなあ。
僕は興味ないけど。

{	Stand("bu大輔_制服_通常","pride", 200, @+100);
	FadeStand("bu大輔_制服_通常_pride", 300, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200160mi">
「よし、待ち構えてやる。見てろタク、俺のナンパ術ってのを見せてやるよ」

自信満々でそう言い放つ。
やれやれ、イケメンはいいよね。ナンパなんて僕には無縁の世界だ。
してみたいとも思わないし。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE*",1000,0,false);

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);

	DeleteStand("bu大輔_制服_通常_pride", 0, true);

	Wait(2000);
	ClearAll(0);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Fade("背景２", 1000, 1000, null, true);

	CreateSE("SE02","SE_じん体_動作_足_歩く");
	SoundPlay("SE02", 1500, 1000, false);
	Wait(3000);
	SoundPlay("SE02", 500, 0, false);

	Wait(500);

//ＣＨ//あやせ//制服
	Stand("stあやせ_制服_通常","normal", 200, @-150);
	FadeStand("stあやせ_制服_通常_normal", 1000, true);

	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE01", 2000, 300, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
しばらくして、ＦＥＳ――あ、いや、本名は岸本あやせだっけ――が現れた。

確かに三住くんの言う通り、ＦＥＳ本人だ。
僕も少し離れたところでこっそり眺めながらそれを確かめた。
まさか僕らと同い年だなんて、今さらながら驚きだ。

ＦＥＳは翠明の制服を着て、アンニュイな表情でゆっくり歩いている。

ステージで歌っている姿とは、ずいぶん印象が違う。あのときは淡々とした口調をしつつも、パワフルさとか躍動感のようなものが感じられた。

でも今は、物憂げで近寄りがたい雰囲気しかない。

その雰囲気にあえて気付かないフリをしているのか、三住くんはいつも僕にする馴れ馴れしさでＦＥＳの横にさりげなく並んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st大輔_制服_通常","smile", 200, @150);
	FadeStand("st大輔_制服_通常_smile", 600, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200170mi">
「よっ、岸本さん、オッハヨー」

うわあ……。
なんて爽やかな、でも嘘くさい笑顔……。

ほぼ初対面の相手にあんな態度で接することができるなんて。

そこにしびれる。あこがれる。でもマネしたいとは思わない。

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200180mi">
「あ、俺、三住大輔。よっろしくー♪」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200190mi">
「おっと、初対面とか思ってるだろ？　でも違うんだなーこれが」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200200mi">
「俺さ、こないだファンタズムのライブ行ったんだよねー。
だから君に会うのは二度目」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200210mi">
「で、そんとき君の歌声に、こう、なんつーの？　ビビッて来ちゃったんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200220mi">
「別に俺、ミーハーとかじゃねえよ？　惹かれたのはさ、詞とか君の可愛さとかそういうところもあるけど、でもなにより一番すげえって思ったのは、やっぱバンドとしての完成度っつーか」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200230mi">
「あの音あっての君の歌声っつーの？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200240mi">
「ちなみに俺も実はバンドやりたいなーって思っててさ、よかったらああいういいバンドメンバーを見つけるコツとか、バンドの先輩としての心得みたいなもの教えてくんねーかな？」

//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200250mi">
「あ、今すぐじゃ迷惑だろうから、そうだなあ、放課後とかヒマ？　どっかでふたりきりでじっくり話さない？」

三住くんは休まず喋り続ける。
普段とは口調も違ってるし、声だって明らかに作ってる。

しかもストレートにナンパするんじゃなくて、バンド云々の話題を絡めてさりげなく誘ってる。

ちなみに三住くんがバンドやりたいなんて初耳だ。どう考えても嘘だ。そこまでしてでも好感度的なものを上げて、フラグを待つんじゃなくて“作ってる”わけか。

でも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stあやせ_制服_通常_normal", 500, true);
	Stand("st大輔_制服_通常","shock", 200, @150);
	Stand("buあやせ_制服_通常","normal", 200, @0);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
ＦＥＳは、そんな三住くんに目もくれなかった。

まるでなにも聞こえていないかのように、相変わらずトボトボとした歩調で廊下を歩き続けている。

{	FadeStand("st大輔_制服_通常_shock", 300, true);
	DeleteStand("st大輔_制服_通常_smile", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch03/05200260mi">
「な、なあ？　聞いてる？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch03/05200270ay">
「…………」

{	DeleteStand("st大輔_制服_通常_shock", 300, true);}
と、ＦＥＳはふと立ち止まった。
わずかに伏せられていた視線が、ゆっくりと上がってきて……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("１１");
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 0, 0, false);
	SetVolume360("CH*", 1000, 0, null);
	FadeStand("buあやせ_制服_通常_normal", 400, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
僕を、見た。

え？　僕！？

そう言えば、ライブのときもＦＥＳにじっと見られたような気がする。

そもそもここ２週間ぐらい、やけに三次元女に見つめられる機会が多い。
いったいなんなんだ？　モテ期か？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

}
