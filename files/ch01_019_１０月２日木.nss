//<continuation number="530">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_019_１０月２日木";
		$GameContiune = 1;
		Reset();
	}

	ch01_019_１０月２日木();
}


function ch01_019_１０月２日木()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();
	
//☆Cut-70-----------------------------

//ＢＧ//教室//夕方
	CreateBG(100, 1000, 0, 0, "cg/bg/bg018_03_0_教室席視線_a.jpg");

//１０月２日（木）//日付は表示しない
//ＳＥ//チャイム
	CreateSE("SE01","SE_日常_チャイム");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);


	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//数学教師＝男
//【数学教師】
<voice name="数学教師" class="数学教師" src="voice/ch01/019000010mt">
「おっと、時間か。今のところ、テストに出るからな。ちゃんとノート書いておけよ。今日はここまで」

//日直は三住でいいかも
//【日直】
<voice name="日直" class="日直" src="voice/ch01/019000020ni">
「きりーつ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//生徒がみんな立ち上がる
	CreateSE("SE02","SE_じん体_動作_立ち上がる_生と全員");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 1000, 0, 0, "cg/bg/bg018_04_0_教室席視線_a.jpg");

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【日直】
<voice name="日直" class="日直" src="voice/ch01/019000030ni">
「礼」

{	CreateSE("SE03","SE_日常_がっ校_教室_LOOP");
	CreateBG(100, 1000, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	MusicStart("SE03", 500, 500, 0, 1000, null, true);}
数学の教師――あの先生、なんて名前だったっけ？　まあどうでもいいや――が教室から出て行くと、これでようやく今日のすべての授業が終了した。

みんなは、これからどこかへ寄っていく相談をしたり、部活がある生徒は同じ部員同士で集まってそれぞれ部室へ向かい、さっさと帰り支度を始めるヤツも多い。

僕も、いつもは終業のチャイムが鳴るなり真っ先に荷物をまとめて帰るところだけど。

他のクラスメイトとはなるべく視線を合わせないようにしながら、自分の席についたまま悶々としていた。

今日はこの後、優愛と約束があるんだなあ。

{#TIPS_ワクテカ = true;$TIPS_on_ワクテカ = true;}
普通だったら、女の子とデートの待ち合わせなんて、<FONT incolor="#88abda" outcolor="BLACK">ワクテカ</FONT>するシチュエーションなんだろうけど。

{$TIPS_on_ワクテカ = false;}
今の僕にはひたすら憂鬱だった。

落ち着かない。胃が痛い。

女子と待ち合わせの約束をするのなんて初めてだから、どうしたらいいかさっぱり分からない。

そもそも、ホントに優愛は来るのか？
昨日のことが全部イタズラで、こうして待っている僕を陰からのぞき見てクスクスと笑っているんじゃないかって思ってしまう。

ある意味、優愛がホントに来るよりそっちの方がまだマシかも……。

っていうか、わざわざ律儀に優愛を待ってる必要なんてないんだ。このままあの女をほったらかしにしてさっさと帰ればいい話じゃないか。

よし、帰ろう。どうせ学年も違うし、今日ドタキャンしちゃえばもう今後一生会うこともないさ。

そう覚悟を決めて立ち上がった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



	CreateBG(100, 500, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");

	Stand("bu大輔_制服_通常","normal", 200, @+100);

	CreateSE("SE00","SE_じん体_掴む");
	MusicStart("SE00", 0, 500, 0, 700, null, false);

	Shake("back0*", 200, 0, 30, 0, 0, 0, null, false);
	FadeStand("bu大輔_制服_通常_normal", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900040mi">
「タク！　なにしてんだ？」

背中を思い切り叩かれた。
誰の仕業かは、顔を見なくても分かった。
クラスで僕に話しかけてくる物好きは、三住くんしかいない。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900050mi">
「お前、帰らないのか？　いつもならチャイムが鳴ると同時に消えるのによ。俺、密かに"拓巳の音速直帰"って名付けてたんだぜ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900060ta">
「も、もう、帰るよ……」

{	Stand("bu大輔_制服_通常","pride", 200, @+100);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, true);}

//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900070mi">
「誰か待ってるとか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900080ta">
「え……！？」

どうして分かったんだろう……！？

{	Stand("bu大輔_制服_通常","sigh", 200, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900090mi">
「なんだよ、図星かよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900100ta">
「どうして……」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900110mi">
「なんだかやけにソワソワしてたからな。教室の入り口をさっきから何度も気にしてるし」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900120ta">
「…………」

鋭い……。

でもここはヘタなことを言わない方がいい。

忘れちゃいけないぞ、拓巳。僕はこの学校では、極力目立たないようにしなくちゃいけないんだ。空気のような存在にならなくちゃダメなんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900130ta">
「別に、誰も待ってないよ……」

{	Stand("bu大輔_制服_通常","pride", 200, @+100);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900140mi">
「そうかあ？　だったら今の間はなんだよ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900150ta">
「そ、それは……」

//わざと「空気嫁」です。
{#TIPS_空気嫁=true;$TIPS_on_空気嫁 = true;}
くそぅ。三住くんは悪いヤツじゃないけど、こういうときはホントにウザい。<FONT incolor="#88abda" outcolor="BLACK">空気嫁</FONT>。

{$TIPS_on_空気嫁 = false;}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900160yu">
「西條くん」

ギクリとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(201, 500, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Stand("st優愛_制服_通常左手下","worry", 250, @-150);
	FadeStand("st優愛_制服_通常左手下_worry", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
恐る恐る声のした方を見ると、
教室の入り口に優愛が恐縮した様子で立っていた。

なんてことだ……。三住くんのせいで逃げるタイミングを失っちゃった……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","shock", 200, @+100);
	FadeStand("bu大輔_制服_通常_shock", 0, true);

//おがみ：スクリーン描画崩れ
	CreateTexture360("背景１", 1000, center, middle, "SCREEN");

	DeleteStand("st優愛_制服_通常左手下_worry", 0, false);
	CreateBG(100, 0, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");

	FadeDelete("背景１", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900170mi">
「ちょっ、おい、な、なんだありゃ！？　どういうことだ！？」

三住くんが珍しく動揺してあたふたしている。
僕の肩に腕を回してきて、据わった目を向けてくる。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900180mi">
「おいタク。どういうことか説明しろよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900190mi">
「お前のカノジョか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900200ta">
「ち、違うよ……」

僕は三次元に興味はないって、三住くんには何度も言ってるのに。

{	Stand("bu大輔_制服_通常","pride", 200, @+100);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_shock", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900210mi">
「だったらなんなんだよ～。言っとくがタクの姉ちゃんとかそういうオチは期待してねーからな」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900220mi">
「引きこもりのくせに、なにをどーやったらあんないい女と知り合えるんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900230ta">
「き、昨日、急に付きまとわれて……」

{	Stand("bu大輔_制服_通常","shock", 200, @+100);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900240mi">
「そりゃつまりアレか？
　逆ナンされたってことか？　ええ、このこの！」

顎をつかまれてガクガクとされる。
それでようやく、三住くんは僕を解放した。

{	Stand("bu大輔_制服_通常","normal", 200, @+100);
	FadeStand("bu大輔_制服_通常_normal", 500, true);
	DeleteStand("bu大輔_制服_通常_shock", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900250mi">
「そうかぁ、世の中には物好きってのもいるんだな。けどタクがまともな性癖を持ってたみたいで、少し安心したぜ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900260ta">
「せ、性癖って……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900270ta">
「それに彼女とは、別になにも……」

{	Stand("bu大輔_制服_通常","smile", 200, @+100);
	FadeStand("bu大輔_制服_通常_smile", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900280mi">
「へへへ、そうかそうか。頑張れよ、タク！」

{	CreateSE("SE05","SE_衝撃_衝撃音03");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);}
三住くんは僕の言葉を聞いていなかった。ひとりで勝手に盛り上がって、さっきよりも強烈に、僕の背中を平手で叩いてくる。
うう、絶対からかってるに違いない。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900290mi">
「安心しろって。お前の女を寝取ったりしねえから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900300ta">
「だ、だから、そういう関係じゃ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：スクリーン描画崩れ
	CreateTexture360("背景１", 1000, center, middle, "SCREEN");

	SetVolume("SE01", 1000, 500, NULL);

	DeleteStand("bu大輔_制服_通常_smile", 300, false);

	Stand("st優愛_制服_通常左手下","worry", 200, @-150);
	FadeStand("st優愛_制服_通常左手下_worry", 500, false);

	CreateBG(100, 500, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	FadeDelete("背景１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/01900310mi">
「ははは。ほら、さっさと行けよ。彼女、お待ちかねみたいだぜ」

三住くんに追いやられて、僕はよろけながら優愛に歩み寄った。結局、逃げられなかった……。

{	Stand("bu優愛_制服_通常","worry", 200, @-150);
	FadeStand("bu優愛_制服_通常_worry", 500, false);
	DeleteStand("st優愛_制服_通常左手下_worry", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900320yu">
「あの、迎えに来たの……迷惑でした？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900330ta">
「あ、いや……」

すごく迷惑だよ。

三住くんの方を振り返ると、ニヤニヤしながら中指を立ててきた。ケンカを売られてるのか励まされてるのか、よく分からない。

これ以上ヤツの相手をしているのも面倒だから、さっさと学校を出よう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//教室停止
	SoundStop("SE03");

	CreateColor("色１", 1000, 0, 0, 1280, 720, "BLACK");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	DeleteStand("bu優愛_制服_通常_worry", 0, false);

	Wait(1000);

	BGMPlay360("CH11", 3000, 1000, true);

//ＢＧ//校門前//昼
	CreateBG(100, 0, 0, 0, "cg/bg/bg016_01_2_学校校門_a.jpg");

	Stand("bu優愛_制服_通常左手下","worry", 200, @+100);
	FadeStand("bu優愛_制服_通常左手下_worry", 0, true);

	DrawTransition("色１", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900340yu">
「すいません。昨日会ったばかりなのに、
こんなお願いをしてしまって……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900350ta">
「いや……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900360yu">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900370ta">
「…………」

き、緊張する……。

//リア充＝「リアルが、充実している人」
{#TIPS_リア充=true;$TIPS_on_リア充 = true;}
三次元の女子と一緒に学校から帰るなんて、こんなの<FONT incolor="#88abda" outcolor="BLACK">リア充</FONT>じゃないか。僕とは無縁の世界と思ってた。

{$TIPS_on_リア充 = false;}
まさか体験できるなんて……。

でも今の僕は、優愛からの無言のプレッシャーにさらされていた。
無言で肩を並べて歩いているだけなのに、この緊張感はいったいなんなんだ……。

それに優愛の正体や目的がさっぱり分からない。
僕みたいなキモオタに、なにを期待してるんだろう……。

{	Stand("bu優愛_制服_通常","normal", 200, @+100);
	DeleteStand("bu優愛_制服_通常左手下_worry", 300, false);
	FadeStand("bu優愛_制服_通常_normal", 300, true);}
//おととい
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900380yu">
「一昨日の」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900390ta">
「へ！？」

{	Stand("bu優愛_制服_通常","shock", 200, @+100);
	FadeStand("bu優愛_制服_通常_shock", 300, true);
	DeleteStand("bu優愛_制服_通常_normal", 300, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900400yu">
「はい！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900410ta">
「あ、いや……」

いきなり話しかけてきたから、
意表を突かれて変な声を出しちゃったよ……。

優愛もまた緊張しているようだった。表情が引きつっている。僕より年上なのにけっこう初々しいな。意外と萌える……。

と言っても、横目でチラチラと見るのが精一杯なんだけど。顔をまともに見るなんて、とてもじゃないけど恥ずかしくて無理だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常","normal", 200, @+100);
	FadeStand("bu優愛_制服_通常_normal", 300, true);
	DeleteStand("bu優愛_制服_通常_shock", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900420yu">
「一昨日のブラチュー、見ましたよね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900430ta">
「え、う、うん……」

{	Stand("bu優愛_制服_通常","worry", 200, @+100);
	FadeStand("bu優愛_制服_通常_worry", 300, true);
	DeleteStand("bu優愛_制服_通常_normal", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900440yu">
「わたし、１ヵ所だけいまいちよく分からないところがあったんですけど」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900450yu">
「ススムくんが、星来ちゃんのピンチに駆けつけてきて、助けてくれますよね？　でもどうしてススムくんは、星来ちゃんが危ないって分かったのかなあって」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900460ta">
「あ、あれは、えっと、先週の回に伏線があったんだ。星来のケータイが鳴ってるシーンが、一瞬だけ挿入されてて、着信表示でススムの名前が、出てる……」

{	Stand("bu優愛_制服_通常","shock", 200, @+100);
	FadeStand("bu優愛_制服_通常_shock", 300, true);
	DeleteStand("bu優愛_制服_通常_worry", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900470yu">
「あ、ああ～！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900480yu">
「そう言えばそんなシーンありましたね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900490ta">
「ヤマタクはそういう細かい伏線をあちこちに張るのが好きなんだ。金ゴルでも似たようなことやってた」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900500yu">
「ヤマタク？　金ゴル？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900510ta">
「ヤ、ヤマタクっていうのは、ブラチューの監督の愛称だよ。で、ヤマタクがブラチューの前に監督やってたアニメが金ゴル」

{	Stand("bu優愛_制服_通常","normal", 200, @+100);
	FadeStand("bu優愛_制服_通常_normal", 300, true);
	DeleteStand("bu優愛_制服_通常_shock", 0, false);}

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01900520yu">
「へえ。じゃあ、ヤマタクさんって、有名な監督さんなんですね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01900530ta">
「まあ、僕は好きな方かな。なんでかって言うと――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH11", 500, 0, NULL);


	ClearAll(1000);

//～～Ｆ・Ｏ

}


