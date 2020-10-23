//<continuation number="220">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_155_七海のことを考える";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch08_155_七海のことを考える();
}


function ch08_155_七海のことを考える()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($GameDebugSelect == 1)
{
	SetChoice02("梨深ルート有り","梨深ルート無し");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA02();
			$梨深ルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$梨深ルート=false;
		}
	}
	$GameDebugSelect = 0;
}

//アイキャッチ
//※拓巳視点に戻る

	if($梨深ルート){
	//Ｃｈａｏｓ；Ｈｅａｄ　第８章
	//――――――――――――――――
	//■第８章【Ir2】
		$SYSTEM_last_text="第８章";

		if(Platform()!=100){
			Save(9999);
		}
	
		ChapterIn("dx/mvG.avi");
			Delete("*");
	
			CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg015_01_2_松濤公園_a.jpg");
			Fade("背景１", 0, 1000, null, true);
	
		ChapterIn2();
	
		CreateSE("SE01","SE_日常_松濤公園");
		MusicStart("SE01", 2000, 1000, 0, 1000, null, true);
	
		Wait(1000);

	}else{
		Delete("背景*");
		Delete("色*");
		BGMPlay360("CH*", 0, 0, false);
		SoundPlay("SE*",0,0,false);
	
		CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg015_01_2_松濤公園_a.jpg");
		Fade("背景１", 2000, 1000, null, true);
	
		Wait(1000);
	
		CreateSE("SE01","SE_日常_松濤公園");
		MusicStart("SE01", 2000, 1000, 0, 1000, null, true);
	}

//ＢＧ//松濤公園//夕方
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
１１月になって、日が暮れるのがずいぶん早くなってきた気がする。

放課後、梨深と一緒に帰ろうとしたら、空にはもう薄いオレンジ色がにじんでいた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500010ri">
「ごめんね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 200, @100);
	FadeStand("bu梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
それまで黙っていた梨深が、不意に謝ってくる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500020ri">
「タク、いろいろ大変だったんでしょ？」

梨深とこうして帰るのは久しぶりだ。
彼女が戻ってきたことは素直に嬉しい。
今日も、梨深の方から“一緒に帰ろう”と言ってきてくれたし。

僕らが一緒に帰ったことなんてそもそも２回しかないんだから、なかったことにされるんじゃないかって密かに恐れてたけど、全然そんなことはなかった。

//◆申し訳なさそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500030ri">
「一緒にいてあげられなくて、ごめん」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500040ri">
「知り合いが、例の地震で……怪我しちゃって」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500050ri">
「ずっと面倒見てたから」

聞いてもいないのに、梨深は自分からそう話してくれた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15500060ta">
「うん……」

でも、正直な話、今の僕には梨深の言葉がほとんど頭に入ってこなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("背景２", 1000, 0, 0, "cg/ev/ev069_01_1_七海廊下後姿髪かきあげ_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
昼休みに見た、七海の、手首の包帯。
それが目に焼き付いて離れない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("背景３");
	Delete("背景２");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆おずおずと
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500070ri">
「もしかして、怒ってる？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
あの後、結局七海に声をかけ損なった。
声をかけるのが怖い、って思ってしまった。

七海は僕の妹なのに。
僕は七海の兄なのに。

なんだか、得体が知れなかったんだ……。

看護師さんは、七海はケガをしていなかった、って言ってた。

『将軍』から僕のベースに送られてきた例の手首は、冷蔵庫の中から消えていた。

あれは、妄想だったはずなんだ。

なのに、どうして今日、七海は右手に包帯を巻いていたんだろう……。

単に僕の考えすぎで、火傷したとか虫に刺されたとか、そういうどうでもいいような理由でしかないのかな……。

そう……だよね。それが一番もっともな答えだよね。

でも……やっぱり、確かめるのが怖い……。

僕は七海を助けてあげられなかったのに、なおもこうしてウダウダとして、妹と話そうともしない。

ホント、最低の兄だ……。

{	Stand("bu梨深_制服_正面","hard", 200, @100);
	FadeStand("bu梨深_制服_正面_hard", 200, true);
	DeleteStand("bu梨深_制服_正面_sad", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500080ri">
「ねえ、タク？　おーい、もしもーし？」

{	Stand("bu梨深_制服_正面","sad", 200, @100);
	FadeStand("bu梨深_制服_正面_sad", 200, true);
	DeleteStand("bu梨深_制服_正面_hard", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500090ri">
「怒ってるならそう言ってよ。無視されるのって、けっこう……傷ついちゃうな……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15500100ta">
「え……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
梨深の方を見ると、シュンとしてしまっていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15500110ta">
「あ、え、と……え？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500120ri">
「……もしかして、あたしの話聞いてなかった？」

少し迷ってから、うなずいてみる。
{	Stand("bu梨深_制服_正面","hard", 200, @100);
	FadeStand("bu梨深_制服_正面_hard", 300, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, false);}
すると人差し指で頬をグリグリと突っつかれた。

//◆ビシィッ！とは言ってますが敬礼はしてません
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500130ri">
「ビシィッ！　てっきり無視されたかと思ったよー」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500140ri">
「まぎらわしいことしない！」

あう……爪が、爪が頬に食い込んで痛いんだけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 200, @100);
	FadeStand("bu梨深_制服_正面_sad", 300, true);
	DeleteStand("bu梨深_制服_正面_hard", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500150ri">
「……大丈夫？」

ようやくグリグリをやめた梨深が、いつもの言葉をつぶやく。
そう、いつも、梨深はその言葉で僕のことを案じてくれる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500160ri">
「お昼ぐらいから、顔色よくないよ？　元気もないみたいだし」

{	Stand("bu梨深_制服_正面","hard", 200, @100);
	FadeStand("bu梨深_制服_正面_hard", 300, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500170ri">
「もしかして誰かにひどいこと言われた？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500180ri">
「だったらあたしに教えて。怒ってきてあげるから」

まるで姉か保護者みたいだ……。

梨深ってかなりお節介な性格だよね。

まあ、僕みたいなキモオタの相手をしてくれる時点で、そんなこと分かりきってたことだけど。

心配してくれるのはありがたい。
今まで、悩みがあってもひとりで抱え込むか、＠ちゃんで匿名で書き込むことしかできなかったから。

七海の件について話してみようかな……。

でも、以前にディソードの話をしたとき、梨深はちっとも信じてくれなかった。

常識人なら当然の反応をした。

だから、今回も話したところで、一笑に付されるか、ドン引きされるかのどっちかっていうのがオチかも……。

だとしたら、相談しても無駄だよね……。

梨深は僕と一緒にいてくれるだけでいい。

この問題は、こずぴぃかセナに聞いてみた方がよさそうだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_日常_扉_開ける");
	CreateSE("SE360103","SE_日常_扉_閉まる");

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 2000, 1000, null, true);

//	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE01",2000,0,false);

	DeleteStand("bu梨深_制服_正面_hard", 0, true);
	Wait(500);

	SoundPlay("SE03", 0, 1000, false);
	Wait(2200);
	SoundPlay("SE360103", 0, 1000, false);


//ＢＧ//拓巳の部屋
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("色１", 2000, 0, null, true);

	Wait(1000);

	CreateSE("SE04","SE_日常_PC_起動");
	CreateSE("SE02","SE_じん体_動作_座る七海");

	Stand("bu梨深_制服_通常","happy", 1100, @100);
	FadeStand("bu梨深_制服_通常_happy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500190ri">
「相変わらず汚いね、あはは」

梨深はベースの中に足を踏み入れて早々、呆れたようにそうつぶやいた。
でもその割りには、ニコニコと嬉しそうだったりするからよく分からない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500200ri">
「変わってないなあ。この部屋の汚さが、まさにタクって感じ」

そんなに言うなら掃除してくれればいいのに……。
{	SoundPlay("SE04",0,500,false);}
ため息をつきながら、ＰＣの電源を入れる。

{	Stand("bu梨深_制服_通常","hard", 1100, @100);
	FadeStand("bu梨深_制服_通常_hard", 200, true);
	DeleteStand("bu梨深_制服_通常_happy", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500210ri">
「ちょっとちょっとー、帰ってくるなりパソコン？　友達が来てるんだから、少しはおもてなししてあげようっていう気持ちにはならないのかなあ？」

{	DeleteStand("bu梨深_制服_通常_hard", 300, true);
	SoundPlay("SE02", 0, 1000, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15500220ri">
「ねえ、お話、しようよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
ソファに座って、梨深がそんな無茶な要求をしてくる。

僕が三次元女子とマンツーマンで会話なんてしたら、すぐに話題が途切れちゃうよ。

最近は梨深と話す機会が増えてだいぶ慣れてきたとはいえ、それでもきっと５分ももたない。

それに、今は七海のことで頭がいっぱいで、とても楽しい会話をする気分にもならない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("３５");
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 1000, 500, true);
	SoundPlay("SE02", 0, 1000, false);
	Fade("背景１", 200, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
だから梨深を無視するような形になってしまう。
自分のダメさを痛感しながら、イスに腰を下ろした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	EndTrigger();
	
}