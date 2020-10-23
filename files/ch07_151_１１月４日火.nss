//<continuation number="300">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_151_１１月４日火";
		$GameContiune = 1;
		Reset();
	}

		ch07_151_１１月４日火();
}


function ch07_151_１１月４日火()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//アイキャッチ
//※拓巳視点に戻る
//１１月４日（火）//日付は表示しない

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

校門をくぐりながら、昨日のことを思い出す。
セナは別れ際、僕に念を押した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("SE01");

//以下、回想
//ＢＧ//アジアース前//夕方
	CreateColor("黒", 300, 0, 0, 1280, 720, "Black");
	Fade("黒", 0, 0, null, true);
	Fade("黒", 0, 1000, null, true);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg079_01_2_渋谷駅前_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	CreateColor("黒１", 250, 0, 0, 1280, 720, "Black");
	Fade("黒１", 0, 300, null, true);

	Stand("buセナ_制服_通常","hard", 200, @+50);
	FadeStand("buセナ_制服_通常_hard", 0, true);
	
	Fade("黒", 1000, 0, null, true);
	Delete("背景１");
	Delete("黒");
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/15100010sn">
「お前が望むと望まないとにかかわらず、もしこれ以上踏み込んでくるようなら――」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/15100020sn">
「負を正にするぐらいの強い意識を持つんだな」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/15100030sn">
「中途半端な気持ちじゃ、妄想に食われるだけだぞ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//以上、回想
//※「負を正に～」波多野と似た言葉をわざと言わせています。父娘であることの伏線。

//ＢＧ//校門前
	CreateColor("黒", 300, 0, 0, 1280, 720, "Black");
	Fade("黒", 0, 0, null, true);
	Fade("黒", 0, 1000, null, true);

	CreateSE("SE01","SE_日常_校門前_朝");
	MusicStart("SE01", 1000, 800, 0, 1000, null, true);	
	
	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg016_01_0_学校校門_a.jpg");
	Fade("背景３", 1000, 1000, null, true);

	Delete("黒１");
	DeleteStand("buセナ_制服_通常_hard", 0, true);

	Fade("黒", 1000, 0, null, true);
	Delete("背景２");
	Delete("黒");
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
危険そうなことには巻き込まれたくなかったから、それ以上は聞けなかった。

どうせ、どれだけ頑張ったってディソードを手に入れられない。僕は、勇者じゃない。妹もろくに守れないダメなヤツでしかない。

ただ――

また『将軍』が僕の前に現れる可能性がある。

どうやらあいつは、ゲーム感覚で僕を狙っているらしい。だからあいつの気まぐれで次の“クエスト”がいつ始まるかもしれないんだ。

それが怖い。

ディソードを手に入れようとしたのだって、元はと言えば『将軍』から自分の身を守るためだったんだし。

剣のない僕が、どうすれば『将軍』の魔の手から逃れられるのか。

梨深に一緒にいてもらう？

でも梨深が学校を休んでいることが気になる。
七海みたいに、今度は梨深を人質に取られたらどうする？

誰か、僕を助けてくれそうな人はいないのか……。

候補としては、ディソードを持っている人になる。

あやせはケガをしているから無理だ。

セナが僕を助けてくれるとは思えない。

こずぴぃも、ちょっと……いや、かなり変な子だし……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
	
	SoundStop("SE01");
	
//ＢＧ//教室
	CreateSE("SE02","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE02", 2000, 800, 0, 1000, null, true);

	CreateTexture360("背景４", 50, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");
	DrawTransition("背景３", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);
	
	Delete("背景３");
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
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

会いたい……。
あの元気な顔を見たい。

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

昨日セナに聞いた話を思い出し、こずぴぃがいつもあんな調子なのにも合点がいった。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/15100040ko">
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

そこで、あの声が――
僕の名を、呼んだ。

{	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 200, 0, 1000, 200, null, "cg/data/up.png", true);}
//◆明るく
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100050ri">
「タク、おはよー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/15100060ta">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 3000, 1, null);
	DrawTransition("黒", 200, 1000, 0, 200, null, "cg/data/up.png", true);
	Delete("黒");

	Wait(500);


	Stand("bu梨深_制服_通常","happy", 600, @+100);
	FadeStand("bu梨深_制服_通常_happy", 500, True);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
ハッとして、慌てて顔を上げる。
梨深が、目の前に立っていた。

少しはにかみながら、僕に小さく手を振ってくる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100070ri">
「久しぶり」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/15100080ta">
「り……み……」

幻じゃなかった。

確かな存在感。

呼吸している。

髪が揺れている。

まばたきをしている。

そこにいた。

ここにいた。

鼻の奥が、ツンとして。
胸が締め付けられるような感覚に襲われて。
涙が、出そうになって。

僕はイスから腰を浮かせたまま、うなだれて立ち尽くす。

よかった。
また会えた……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH11",0,1000,true);

	Stand("bu梨深_制服_正面","sad", 600, @+100);
	DeleteStand("bu梨深_制服_通常_happy", 500, false);
	FadeStand("bu梨深_制服_正面_sad", 500, True);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100090ri">
「ちょ、ちょっとタク、どうしたの？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100100ri">
「もしかして、泣いてるの……？」

僕は必死に首を振った。
ここで泣いてるなんて周囲のＤＱＮクラスメイトに知られたら、またバカにされる。

泣いちゃダメだって自分に言い聞かせる。
でも涙はどんどん溢れてきて。

{	DeleteStand("bu梨深_制服_正面_sad", 300, true);
	Stand("bu梨深_制服_通常","happy", 600, @+100);
	FadeStand("bu梨深_制服_通常_happy", 300, True);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100110ri">
「あ、分かった。あたしに再会できて嬉しいんだ。そうでしょ？」

{	Stand("bu梨深_制服_通常","smile", 600, @+100);
	FadeStand("bu梨深_制服_通常_smile", 500, True);
	DeleteStand("bu梨深_制服_通常_happy", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100120ri">
「たはは、なんてね。ちょっと自意識過剰だったかな」

冗談めかして、明るくそう言う梨深に対して、僕はなおも首を振り続けることしかできない。

ましてや顔なんて、まともに見られない。
それをしたらきっと号泣しちゃうよ……。

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
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_通常_smile", 500, true);
	Stand("bu梨深_制服_通常","normal", 600, @+336);
	FadeStand("bu梨深_制服_通常_normal", 500, false);
	Stand("bu大輔_制服_通常","sigh", 500, @-310);
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

そうだ、梨深も三住くんも、
僕みたいなキモオタの相手はしない方がいいよ――

僕が黙っていると、三住くんは無理矢理笑みを浮かべた。

{	Stand("bu大輔_制服_通常","normal", 500, @-310);
	FadeStand("bu大輔_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 300);}
//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100140mi">
「暗いなあ、朝から辛気くさいぜ。ははは」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100150mi">
「ま、お前はそういうヤツだって分かってるけどな」

その言葉はキツイ物言いではあるけど、皮肉とか嫌味とかそういう感じはしなかった。

なぜって、前からいつもそんなようなことを彼には言われていたから。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100160ri">
「そういう大ちんは朝から無駄に爽やかだねー」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100170mi">
「無駄にとか言うな。久々に学校来たと思ったらいきなりそれか」

{	Stand("bu梨深_制服_通常","smile", 600, @+336);
	FadeStand("bu梨深_制服_通常_smile", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 300);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100180ri">
「じゃあ……嘘くさい爽やかさ！」

{	Stand("bu大輔_制服_通常","worry", 500, @-310);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 300);}
//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100190mi">
「なあタク、この言い草どう思うよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/15100200ta">
「う、うん……」

{	Stand("bu梨深_制服_通常","normal", 600, @+336);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_smile", 300);}
曖昧にうなずく。涙はなんとか止まってくれた。

いつもの光景が目の前にあった。

ふたりとも、僕が今クラス内でまずい立場になりつつあることを、まったく気にしていない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 2000, 800, null);
	SetVolume360("CH11", 3000, 0, null);


	Stand("bu大輔_制服_通常","normal", 500, @-310);
	FadeStand("bu大輔_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 300);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100210mi">
「そう言えば、岸本のこと聞いたか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100220mi">
「まだ入院中らしいぜ。ケガは大したことなかったんだけど、精神的にかなり参ってるらしい」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100230mi">
「いいかタク。女を落とすのに一番手っ取り早いのは、弱ってるときに優しくしてやることだ」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100240mi">
「というわけでオレ、本気で岸本の見舞いに行こうかなーと思ってんだよね」

{	Stand("bu梨深_制服_通常","rage", 600, @+336);
	FadeStand("bu梨深_制服_通常_rage", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 300);}
//◆ぶーぶー＝ブーイング
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100250ri">
「大ちんサイテー。ぶーぶー」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100260ri">
「今度こそカノジョさんに刺されるよ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100270mi">
「お見舞いに行くだけだろ。別にやましいことじゃねえよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/15100280ri">
「ほんの数秒前と言ってることが違うし」

//【三住】
<voice name="三住" class="三住" src="voice/ch07/15100290mi">
「そう言えばタクって、岸本と知り合いだったよな。なあ、一緒に行ってくんねえ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/15100300ta">
「え、あ、えっと……」

三住くんらしいと言えばらしい話題だった。
てっきり超能力のこととかを聞いてくるだろうって思ってたから、僕は逆に驚いた。

その後も三住くんのトークは続いた。

今まで通り、三住くんひとりが喋り続けて、たまに梨深が鋭いツッコミを入れて、僕は曖昧な相づちを打つだけだったけど。

今まで通りであることが、嬉しかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	SetVolume("SE02", 1500, 0, null);
	Wait(1500);
	PrintBG("1000");

}