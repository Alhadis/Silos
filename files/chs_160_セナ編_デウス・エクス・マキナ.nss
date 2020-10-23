

chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "chs_160_セナ編_デウス・エクス・マキナ";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_160_セナ編_デウス・エクス・マキナ();
}


function chs_160_セナ編_デウス・エクス・マキナ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編

//▼べー：チャット表示の際に部分にとりあえず適当な背景をかぶせます。
	PrintBG(10000);
	CreateTexture360("チャット０", 100, 0, 0, "cg/bg/bg229_01_6_chn壊れたモニタ_a.jpg");
	CreateTexture360("チャットかぶせ", 110, 0, 0, "cg/bg/bg229_01_6_chn壊れたモニタ_a.jpg");
	CreateTexture360("チャットかぶせ２", 120, 0, 0, "cg/bg/bg229_01_6_chn壊れたモニタ_a.jpg");
	Request("チャットかぶせ", MulRender);
	Request("チャットかぶせ２", AddRender);
	Fade("チャットかぶせ", 0, 600, null, true);
	Fade("チャットかぶせ２", 0, 1000, null, true);
	Fade("チャット０", 0, 1000, null, true);

	CreateSE("SE01","SE_はいけい_びっぷルーム_LOOP");
	MusicStart("SE01",1000,1000,0,1000,null,true);


//	CreateColor("色１", 50, 0, 0, 1280, 720, "WHITE");
//	Fade("色１", 0, 200, null, true);

//▼ウェブＣＨＡＴに以下のようにすでに表示されている
//※「禁（０漸Ｖ・＄」は相手のハンドルネーム。「文字化けしている」という設定です


	DosMain(-200,0);
//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat001]
禁（０漸Ｖ・＄：拓巳、見えているか？　ｙ／ｎ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("0");//――――――――――――――――――――――――――――――



	FadeDelete("back*", 0, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
なんだ、これ……。

チャット……？

僕を名指ししている。
なんで？
見えているかって、なんのことだ？

薄気味悪く思えてきた。

これを書き込んだのは何者だ？
ハンドルネームは文字化けしてるみたいだけど。

どうして僕の名前を知ってる？
どうして、僕がこのビルのこの部屋にいることを知ってる？

もしかしてグリムだろうか？
今まで聞いたことはないけど、あいつは実はスーパーハッカーだったとか、そういうオチ？

それとも、例によって『将軍』なのか？
また僕は、思考を盗撮されていて、新しいクエストでも始める気か？

血まみれになった七海の姿が、脳裏でフラッシュバックした。
そうだ、七海はどこかに捕らわれているんだった。

もしも七海に関することなら……この呼びかけに答えないと、今度こそ七海は殺されるかもしれない。

モニタの近くに落ちているキーボードを膝に乗せて、僕は一度、言葉にならないうめき声をあげた。

このキーボードが、モニタと繋がっているかどうかは分からない。祈るような気持ちで、僕は『Ｎ』のキーを押した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始
	CreateSound("チャット音", SE, "sound/se/SE_日常_PC_キーたたく_長");
	Request("チャット音", Play);
	Request("チャット音", Disused);

	CreateSound("チャット音", SE, "sound/se/SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	Request("チャット音", Play);
	Request("チャット音", Disused);

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat003]
ＧＵＥＳＴ：ｎ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
入力がモニタに反映された。
このキーボードからは、ＧＵＥＳＴ――仮のハンドルネームでチャットに参加できるらしい。

ｎ、つまりＮＯと答えたのは、問いかけのテキスト内に主語がなかったからだ。

“なに”が見えているのか。

それが分からない以上、安易にｙ、つまりＹＥＳと答えるわけにはいかない。七海の命がかかっているかもしれない、と考えるとなおさらだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat005]
禁（０漸Ｖ・＄：問いかけに答えたということは、見えているな
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
相手からの返事が来た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat007]
禁（０漸Ｖ・＄：君にコンタクトを取れてよかった
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 500, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601007]
禁（０漸Ｖ・＄：こちらは３００人委員会だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了
	BGMPlay360("CH26", 1000, 1000, true);
	SetVolume360("SE01", 5000, 0, null);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801020ta">
「はぁ……？」

『将軍』じゃないのか？
３００人委員会だって？
今日はよく、その名前を聞く。

さっき殺された――と思われる――猪鼻や倉持も、３００人委員会のメンバーだって言ってた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801030sn">
「西條、どうした？」

セナが僕の後ろから、モニタをのぞき込んできた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801040sn">
「なんだ、それは」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801050ta">
「わ、分からない……。僕に、名指しで、呼びかけてきて……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat009]
禁（０漸Ｖ・＄：蒼井セナ、君がそこにいることもこちらでモニタしている
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601009]
禁（０漸Ｖ・＄：西條拓巳、蒼井セナ、波多野一成の３人だな
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
ギクリとして、僕もセナも、部屋の天井へと視線を巡らした。
監視カメラで見られている？

カメラらしきものはあった。でもどれも、地震の影響か壊れてしまっていて、動いていない。
他のモニタも完全に沈黙したままだし。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801060sn">
「そいつ、何者だ！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat011]
禁（０漸Ｖ・＄：こちらは３００人委員会だ。すでに自己紹介済みだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801070sn">
「なにをバカな。３００人委員会だと証明することはできるのか？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801080sn">
「西條、そう打ち込め」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801090ta">
「え、う、うん……」

打とうとしたら、それより先にモニタに新たな文字。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat013]
禁（０漸Ｖ・＄：キーボードによる入力は不要だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601013]
禁（０漸Ｖ・＄：君たちのことは、リアルタイムでモニタしている
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602013]
禁（０漸Ｖ・＄：監視カメラはその部屋にはない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3603013]
禁（０漸Ｖ・＄：少なくともそちらの世界のガジェットは使っていない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3604013]
禁（０漸Ｖ・＄：簡単に説明するならば、高次階層から神の視点で見ていると理解してくれ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3605013]
禁（０漸Ｖ・＄：その概念、およびシステムは君たちには絶対に確認できない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3606013]
禁（０漸Ｖ・＄：なお、残念ながらこちらが３００人委員会であると証明する術はない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3607013]
禁（０漸Ｖ・＄：信じてもらうしかない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801100sn">
「なんなんだ……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 200, 0, 0, "cg/bg/bg136_04_6_chn希ＶＩＰルーム崩壊後_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	Wait(500);
	Stand("stセナ_制服_通常","hard", 300, @+280);
	FadeStand("stセナ_制服_通常_hard", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801110sn">
「ノアⅡの攻撃？　それとも、ギガロマニアックスからの妄想攻撃か？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801120sn">
「西條、こいつが『将軍』の可能性は？」

そんなの、これだけで判断できるわけない。
泣きそうな顔で首を左右に振った僕に、セナは舌打ちで応えた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801121ta">
「さっき、猪鼻と倉持を殺した殺人鬼じゃ……？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801130sn">
「いや、むしろ可能性が一番高いのは、こいつが猪鼻か倉持のどちらかということだろう。３００人委員会を名乗ってるぐらいだしな」

それからセナは、波多野さんへとディソードの切っ先を突きつける。
あんなに巨大で鋭利な剣を、セナは片手で軽々と扱った。

{	Stand("stセナ_制服_武器構え","angry", 300, @+280);
	DeleteStand("stセナ_制服_通常_hard", 300, true);
	FadeStand("stセナ_制服_武器構え_angry", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801140sn">
「あるいは、お前の差し金による罠かもしれない」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st一成_浮浪者_通常","normal", 200, @-280);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602014]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801150ha">
「私がこのような細工をする意味はない」

モニタが床にあると腰が疲れる。ずっとしゃがみながら、暗い中でテキストを読むのはキツい。僕はテーブルの上に散乱している瓦礫を払いのけると、モニタを持ち上げてそこに置いた。

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801160ha">
「倉持と猪鼻以外の３００人委員会メンバーかもしれない。なにしろ３００人いるのだから」

{	Stand("stセナ_制服_通常","hard", 300, @+280);
	DeleteStand("stセナ_制服_武器構え_angry", 300, true);
	FadeStand("stセナ_制服_通常_hard", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801170sn">
「いずれにせよ、こいつが“本物”なら、という前提が付く」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801180sn">
「自分から名乗る黒幕は、ドラマや映画の中だけだ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801190ha">
「本物か偽物か、という判断は、今はそれほど優先されるべきことではない」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801200ha">
「重要なのは、この自称３００人委員会メンバーが、猪鼻と倉持を殺した殺人鬼なのか、そうでないか、だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_通常_hard", 500, false);
	DeleteStand("st一成_浮浪者_通常_normal", 500, false);
	Fade("背景１", 500, 0, null, true);

	Wait(500);

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat015]
禁（０漸Ｖ・＄：猪鼻と倉持はこちらで排除した
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801210ta">
「……！　こ、こいつが、犯人……！？」

やっぱりあの２人は、殺されたんだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat017]
禁（０漸Ｖ・＄：こちらを裏切ろうとしたのでね
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601017]
禁（０漸Ｖ・＄：もちろんその背信行為は以前から把握していた
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602017]
禁（０漸Ｖ・＄：排除理由は彼らが脅威だったからではない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3603017]
禁（０漸Ｖ・＄：彼らの企みが成功する確率はゼロではあったが
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3604017]
禁（０漸Ｖ・＄：エラーを持つプログラムは除去が必要だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3605017]
禁（０漸Ｖ・＄：デバッグだよ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801220ha">
「委員会メンバー同士の、内部抗争か……？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801230ha">
「倉持たちがモニタしていた部屋からコンタクトしてきているかもしれない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801240ta">
「で、でも、だったらなんで、ス、スピーカーを使わないの……？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801250ha">
「声を聞かれたくないからだろう。正体を知られたくないんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801260ta">
「ぼ、僕らの、知ってる、誰かなの……？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801270ha">
「書き込んでいる男はかなり慎重だということだよ。いや、男かどうかも不明だが」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801280sn">
「この書き込みをしているのが猪鼻か倉持で、単なる自作自演だとしたら？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801290ha">
「猪鼻と倉持の２人での、仲違いだというのか」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801300sn">
「そうかもしれないし、実は２人とも生きていて、私たちを騙しているだけかもしれない」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801310ha">
「騙す意図について推測できているのか？」

//◆悔しそうなブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801320sn">
「…………っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat019]
禁（０漸Ｖ・＄：勘違いしないでもらいたいのだが
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601019]
禁（０漸Ｖ・＄：猪鼻も倉持も、３００人委員会のメンバーではない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602019]
禁（０漸Ｖ・＄：彼らはそう思い込んでいただけであり、思い込ませたのは我々だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3603019]
禁（０漸Ｖ・＄：彼らは都合のいい駒、隠れ蓑なのだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3604019]
禁（０漸Ｖ・＄：３００人委員会の陰謀論に登場する人物も、すべて同様だと言える
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3605019]
禁（０漸Ｖ・＄：真の我らは、表舞台に出ることはない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3606019]
禁（０漸Ｖ・＄：出ようと思っても出られないのだから
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3607019]
禁（０漸Ｖ・＄：そちらの世界には、実在していないのだよ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801330sn">
「だったら、何者だって言うんだ。神だとでも言うつもりか？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801340ha">
「……このチャット相手との議論は、しない方がいいかもしれない。相手の意図が不明だ。言葉しか見えないのでは、いくらでもフェイクの情報を織り交ぜることができる」

その忠告はもっともだけど、モニタの中のテキストはどんどん更新されていく。

この『禁（０漸Ｖ・＄』ってヤツは、得体が知れない。そしてこっちの情報を、恐ろしいぐらい把握している。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat021]
禁（０漸Ｖ・＄：神という呼び方はそれなりにふさわしい
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601021]
禁（０漸Ｖ・＄：我らは３００人おり、各担当管区は決まっている
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602021]
禁（０漸Ｖ・＄：全員が、そちらの世界を管理する存在だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3603021]
禁（０漸Ｖ・＄：エラーを消して秩序を構築すること。それが管理だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801350ta">
「つ、つまり――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 200, 0, 0, "cg/bg/bg136_04_6_chn希ＶＩＰルーム崩壊後_a.jpg");
	Fade("背景１", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601022]
それまでの書き込みを読んでいて、ふと思い浮かんだことがあった。
僕も以前、同じようなことを何度も考えたことがある。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801360ta">
「あなたは、ゲ、ゲームマスターっていうこと……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","hard", 300, @+280);
	FadeStand("stセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602022]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801370sn">
「ゲームマスター？　どういう意味だ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801380ta">
「エ、エンスーで言えば、か、開発者側ってこと。も、もっとわかりやすく言うなら、な、中の人だよ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801390sn">
「ちっとも分からないぞ」

セナがこめかみを揉みながら、ふてくされたような表情を浮かべる。
これだからゆとりは……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_通常_hard", 500, false);
	Fade("背景１", 500, 0, null, true);

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601023]
禁（０漸Ｖ・＄：西條拓巳の説明は的確だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602023]
禁（０漸Ｖ・＄：我らは、ＭＭＯＲＰＧの進行を管理するゲームマスター
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

#TIPS_ＮＰＣ = true;
$TIPS_on_ＮＰＣ = true;

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3603023]
禁（０漸Ｖ・＄：君たちは、プレイヤーキャラ、あるいはＮＰＣだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//▼TIPS：解除：暫定：ＮＰＣ：暫定的にここで解除します。要調整。
	$TIPS_on_ＮＰＣ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801400ta">
「ちょ、ま、マジで……？　おおお……、キター！　キタコレ！」

僕がずっと妄想していた理論は、ホントだったんだ！

僕を操作している、中の人がいる！
ナイトハルトを操作する僕がいるように。
僕を操作する、誰かがいるんだ！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801410ta">
「だ、だったら、僕の中の人に、い、言ってよ……！　キャ、キャラメイキングを、今すぐ、やり直せって！　も、もっと、僕を操作する腕を、上げろって！」

モニタに向かって叫ぶ。
セナからの、困惑したような視線を感じる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat025]
禁（０漸Ｖ・＄：こうして君たちにコンタクトを取ったのは、頼みがあるからだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601025]
禁（０漸Ｖ・＄：協力してくれるならば、君たちにチートコードを与える用意がある
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801420sn">
「チートコード？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景１", 500, 1000, null, true);
	Stand("stセナ_制服_通常","hard", 300, @+280);
	FadeStand("stセナ_制服_通常_hard", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601026]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801430ta">
「す、すごいぞ……、ふひひ……。チ、チートは、裏技みたいなものだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801440ta">
「エンスーで言えば、そのコードを入力するだけでレベル１だったキャラを一瞬でレベル５０にできたり、あ、あとは、ええと」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801450ta">
「ド、ドロップ率０・０２５％の超レアアイテムを、なんの苦労もせずにいきなり手に入れたりできるんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801460ta">
「もし、チートコードがあるなら、ぼ、僕はもう、
弱っちいキモオタじゃ、なくなるんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801470ta">
「ホントの、勇者になれるかも。さ、三次元女子とも、キョドらずに、喋られるようになる……！」

{#TIPS_俺ＴＵＥＥＥプレイ = true;$TIPS_on_俺ＴＵＥＥＥプレイ = true;}
それはまさに僕が求めていた超展開だ！
なんの苦労もせずにモテモテで最強キャラ化！
“<FONT incolor="#88abda" outcolor="BLACK">俺ＴＵＥＥＥプレイ</FONT>”ができるってこと！

//◆「ネ申」わざとです
{$TIPS_on_俺ＴＵＥＥＥプレイ = false;}
{#TIPS_ネ申 = true;$TIPS_on_ネ申 = true;}
おおお！　３００人委員会ってマジで<FONT incolor="#88abda" outcolor="BLACK">ネ申</FONT>！　いわゆるゴッド！
みｗなｗぎｗっｗてｗきｗたｗぜｗ

{$TIPS_on_ネ申 = false;}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801480sn">
「それがチートコードだとして、本当にあると思うのか？　このチャット相手は高次存在らしいが、そんな神のような存在が、私たちと同じ言葉や用語を使っているのはなぜだ？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801490sn">
「これは罠だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_通常_hard", 500, false);
	Fade("背景１", 500, 0, null, true);
//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat027]
禁（０漸Ｖ・＄：残念だがその推測は正しくはない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601027]
禁（０漸Ｖ・＄：こちらが君たちに理解できる言葉を用いているのだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602027]
禁（０漸Ｖ・＄：我らが普段使っている言語はそちらの世界には存在しない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801500sn">
「詭弁だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat029]
禁（０漸Ｖ・＄：信じる信じないは君たち次第だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601029]
禁（０漸Ｖ・＄：信じないならば、別の方法を検討する
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801510ta">
「ぼ、僕は、信じる……」

信じたいんだ。これ以上、怯えながら生き続けるのはイヤだ。
『将軍』よりもすごい力を手に入れれば、僕のこの先の人生は安泰だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat031]
禁（０漸Ｖ・＄：協力に感謝する。西條拓巳
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601031]
禁（０漸Ｖ・＄：君には、エラーを排除してもらいたい
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602031]
禁（０漸Ｖ・＄：君たちが言うところのノアⅡだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3603031]
禁（０漸Ｖ・＄：あれはゲームバランスを大きく崩し、場合によってはゲームデータを破壊してしまう恐れがある
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text032]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801520ha">
「神ならば、なぜ自らの力を行使しない？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat033]
禁（０漸Ｖ・＄：現在、君たちの世界はノアⅡの影響で強制的に自閉症モードになっている
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601033]
禁（０漸Ｖ・＄：こちらからの干渉をほとんど受け付けない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602033]
禁（０漸Ｖ・＄：いずれにせよゲームマスターはゲームに直接介入はしない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3603033]
禁（０漸Ｖ・＄：我らはあくまで管理者だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3604033]
禁（０漸Ｖ・＄：エラー排除には、君たちの協力が必要だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text034]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801530sn">
「頭が痛くなってくる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801540sn">
「口から出任せにしか思えない。直接介入できないと言うなら、
どうやって猪鼻と倉持を排除した？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

#TIPS_デバッガ = true;
$TIPS_on_デバッガ = true;

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat035]
禁（０漸Ｖ・＄：協力者は他にもいる。デバッガと考えてもらえばいい
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//▼TIPS：解除：暫定：デバッガ：暫定的にここで解除します。要調整。
$TIPS_on_デバッガ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601035]
禁（０漸Ｖ・＄：だがノアⅡを破壊できるほどの力は持っていない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602035]
禁（０漸Ｖ・＄：ギガロマニアックスの協力が必要だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text036]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801550sn">
「協力じゃなくて、私たちを利用したいだけだろ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat037]
禁（０漸Ｖ・＄：そういう言い方もできる
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601037]
禁（０漸Ｖ・＄：否定はしない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602037]
禁（０漸Ｖ・＄：だが利害は一致しているはずだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text038]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801560sn">
「それは……確かに……」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801570ha">
「巧妙だな」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801580ha">
「一連の書き込みを見ていると、３００人委員会は実在しているとも、実在していないとも取れる」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801590ha">
「これがノアⅡによる攻撃である可能性もある」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801600ta">
「で、でも、猪鼻と倉持が、ノアⅡを使って、さ、３００人委員会を裏切ろうとしてたのは、ホ、ホントのことだったじゃないかっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801610ta">
「あいつら自身が、そ、そう、せ、説明してたよ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//▼ウェブＣＨＡＴ終了
	Fade("背景１", 500, 1000, null, true);
	Stand("stセナ_制服_通常","hard", 300, @+280);
	FadeStand("stセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601038]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801620sn">
「あの時点から妄想による攻撃が始まっていたとしたら？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801630sn">
「さっきも言っただろう。モニタやスピーカーで喋っていた猪鼻と倉持が本物である証拠は、ひとつもない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801640ta">
「さ、さっきから、セナは……う、疑って、ばかりじゃないか……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801650sn">
「この状況で、信じられるのは自分だけだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801660sn">
「世界はすべて電気仕掛けで、電気信号に細工するだけで簡単に“見ているもの”をねつ造できる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801670sn">
「ここから見える、崩壊した渋谷の光景も。この瓦礫だらけの部屋も」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801680sn">
「３００人委員会を名乗る存在からの書き込みも」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801690sn">
「今、この場でこうして話している西條や――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_横向","hard_r", 300, @+280);
	DeleteStand("stセナ_制服_通常_hard", 300, true);
	FadeStand("stセナ_制服_横向_hard_r", 300, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602038]
セナはちらりと波多野さんを一瞥した。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801700sn">
「この男ですらも、偽物かもしれないんだ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801710ha">
「セナ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	DeleteStand("stセナ_制服_横向_hard_r", 500, false);
	Fade("背景１", 500, 0, null, true);
//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat039]
禁（０漸Ｖ・＄：感情が電気仕掛けならば、父を憎む君の気持ちもプログラムされたものでしかない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601039]
禁（０漸Ｖ・＄：人の死も同様だ。君は母や妹の無残な死をなんら気に病む必要はない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602039]
禁（０漸Ｖ・＄：それについて否定する気はあるか？
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text040]
//◆悔しそうにブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801720sn">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景１", 500, 1000, null, true);
	Stand("stセナ_制服_横向","hard_r", 300, @+280);
	FadeStand("stセナ_制服_横向_hard_r", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601040]
セナが、ギリリと歯ぎしりした。
ますますその表情が険しくなる。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801730sn">
「これは妄想だ……っ！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801740sn">
「私の心への攻撃だ……！　惑わされないぞ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_横向_hard_r", 500, false);
	Fade("背景１", 500, 0, null, true);
//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat041]
禁（０漸Ｖ・＄：ではこうしよう
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601041]
禁（０漸Ｖ・＄：ノアⅡ破壊に成功したら、君の母と妹を復活させる
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602041]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801750sn">
「な……に……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景１", 500, 1000, null, true);
	Stand("stセナ_制服_横向","think", 300, @+280);
	Stand("st一成_浮浪者_通常","normal", 290, @-280);
	FadeStand("st一成_浮浪者_通常_normal", 500, false);
	FadeStand("stセナ_制服_横向_think", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601042]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801760ha">
「セナ、言葉に流されるな。
この書き込みが精神攻撃かもしれないと言ったのは、お前自身だ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801770sn">
「で、でも……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00801780ta">
「チートコードなら、か、可能かも……。
なにしろ、相手は、神だし……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_横向_think", 500, false);
	DeleteStand("st一成_浮浪者_通常_normal", 500, false);
	Fade("背景１", 500, 0, null, true);
//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat043]
禁（０漸Ｖ・＄：世界を構成するあらゆるものは電気仕掛け。そう言ったのは君だ、蒼井セナ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601043]
禁（０漸Ｖ・＄：電気仕掛けとは、突き詰めればデジタルなデータだということ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602043]
禁（０漸Ｖ・＄：生や死という概念はまやかしでしかない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3603043]
禁（０漸Ｖ・＄：死んだ人間をそっくりそのまま、記憶も含めて完璧に復元させることなど、造作もない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3604043]
禁（０漸Ｖ・＄：ゲームマスターの我らならば
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text044]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801790sn">
「本当なのか……？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801800ha">
「判断を誤るな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE構え","SE_擬音_ディそーどかまえる");

	Fade("背景１", 500, 1000, null, true);
	Stand("stセナ_制服_通常","sad", 300, @+280);
	Stand("st一成_浮浪者_焦り","hurry", 290, @-280);
	FadeStand("st一成_浮浪者_焦り_hurry", 500, false);
	FadeStand("stセナ_制服_通常_sad", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601044]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801810ha">
「お前はそう信じたいだけだ。現実によみがえることなどない」

{	Stand("stセナ_制服_通常","rage", 300, @+280);
	FadeStand("stセナ_制服_通常_rage", 300, true);
	DeleteStand("stセナ_制服_通常_sad", 0, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801820sn">
「うるさい！　お前は黙ってろ！」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801830ha">
「心の負い目につけ込まれているぞ。相手は巧妙だ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801840ha">
「こいつは神などではない。
今、確信した。ただの詐欺師だ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801850ha">
「神は自己完結した存在でなければならない。生死の概念そのものを持ち合わせていないし、理解できない、そういう存在だ」

{	Stand("stセナ_制服_武器構え","sad", 300, @+280);
	DeleteStand("stセナ_制服_通常_rage", 300, true);
	MusicStart("SE構え",0,1000,0,1000,null,false);
	FadeStand("stセナ_制服_武器構え_sad", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801860sn">
「黙れと言ってるだろ！　お前の宗教観は聞いてない！」

セナが再びディソードを波多野さんに突きつける。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801870sn">
「元はと言えばお前がいけないんだ！
お前が、母さんを殺しさえしなければ……っ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st一成_浮浪者_通常","normal", 290, @-280);
	DeleteStand("st一成_浮浪者_焦り_hurry", 300, true);
	FadeStand("st一成_浮浪者_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602044]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801880ha">
「その償いはするつもりだ。私を殺しても構わない。むしろ私はそれを望む」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801890ha">
「だから、母さんをよみがえらせようなどという虚言を信じるな」

{	Stand("stセナ_制服_武器構え","angry", 300, @+280);
	FadeStand("stセナ_制服_武器構え_angry", 300, true);
	DeleteStand("stセナ_制服_武器構え_sad", 0, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801900sn">
「そうやって逃げようとするのが、一番許せないんだっ！」

うぅ、親子ゲンカしてる場合じゃないだろ。
あの２人は放っておいて、
僕だけでチートコードを手に入れようかな……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801910sn">
「今、決めた。お前は殺さない。ノアⅡを破壊して、母さんが生き返っても、お前には会わせない！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801920sn">
「そして一生、後悔し続けろ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st一成_浮浪者_焦り","worry", 290, @-280);
	DeleteStand("st一成_浮浪者_通常_normal", 300, true);
	FadeStand("st一成_浮浪者_焦り_worry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603044]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801930ha">
「……どこまでも純粋だな、セナ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801940ha">
「感情に突き動かされながら、電気仕掛けの世界を願うか。お前は、矛盾している」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801950ha">
「すまない。私が、お前をそうさせてしまった……」

{	Stand("stセナ_制服_横向","hard_r", 300, @+280);
	DeleteStand("stセナ_制服_武器構え_angry", 300, true);
	FadeStand("stセナ_制服_横向_hard_r", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801960sn">
「父親面をするな……！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801970sn">
「今さらそんな顔をしても、私はお前を認めない！」

{	Stand("stセナ_制服_通常","angry", 300, @+280);
	DeleteStand("stセナ_制服_横向_hard_r", 300, true);
	FadeStand("stセナ_制服_通常_angry", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801980sn">
「おい、私たちを見ているお前！」

セナは天井を見上げてそう呼びかける。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801990sn">
「チートコードの入手方法を教えろ！」

波多野さんはもうなにも言わなかった。
悲しそうな表情を浮かべて、肩を落としているだけ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_通常_angry", 500, false);
	DeleteStand("st一成_浮浪者_焦り_worry", 500, false);
	Fade("背景１", 500, 0, null, true);
//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat045]
禁（０漸Ｖ・＄：話はついたようだな
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601045]
禁（０漸Ｖ・＄：チートコードはすでにそちらの世界に送り込んである
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602045]
禁（０漸Ｖ・＄：だがすでに言った通り、こちらからの自由な干渉は阻害されている
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3603045]
禁（０漸Ｖ・＄：場所は選べなかった。君たちに取りに行ってもらいたい
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3604045]
禁（０漸Ｖ・＄：渋谷駅の地下だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3605045]
禁（０漸Ｖ・＄：副都心線の改札近くにあるコインロッカー
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3606045]
禁（０漸Ｖ・＄：１００９番ロッカーの中に入っている
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text046]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00802000ta">
「か、鍵は……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

#TIPS_ＩＣカード = true;
$TIPS_on_ＩＣカード = true;

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat047]
禁（０漸Ｖ・＄：蒼井セナは公共交通機関で使用するＩＣカードを持っているな？
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼TIPS：解除：暫定：ＩＣカード：暫定的にここで解除します。要調整。
$TIPS_on_ＩＣカード = false;

//※ＩＣカード＝Ｓｕｉｃａのこと

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601047]
禁（０漸Ｖ・＄：コインロッカーはＩＣカードでロック、認証、および決済ができるタイプだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602047]
禁（０漸Ｖ・＄：蒼井セナのカードにすでにその情報を送ってある
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text048]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00802010ta">
「さ、さすが神……。用意がいい……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00802020ta">
「あ、あの……、チートコードって、どんな形を、し、してるの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat049]
禁（０漸Ｖ・＄：それはこちらからは把握できない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1000");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3601049]
禁（０漸Ｖ・＄：どのようなガジェットとしてそちらの世界に具現化しているかは、あまり重要ではない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3602049]
禁（０漸Ｖ・＄：どんな形だろうと、そのコードを入手し、ロックを解除した時点でチートは有効となる
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3603049]
禁（０漸Ｖ・＄：ロック解除とはつまり、そのガジェットを破壊するということだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3604049]
禁（０漸Ｖ・＄：標的であるノアⅡは、そのコインロッカーの真上にある
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3605049]
禁（０漸Ｖ・＄：渋谷東口のプラネタリウムだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3606049]
禁（０漸Ｖ・＄：チートコードを入手したら、そのプラネタリウムを破壊しろ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3607049]
禁（０漸Ｖ・＄：それですべてカタがつく
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[chat3608049]
禁（０漸Ｖ・＄：健闘を祈る
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("1500");//――――――――――――――――――――――――――――――

	WaitKey();

//▼ウェブＣＨＡＴ終了
	CreateSE("SE01","SE_き械_もにたー_消える");
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);

	MusicStart("SE01",0,1000,0,1000,null,false);
	Fade("Black", 0, 1000, null, true);

	Delete("box04");//これでDOS消します
	Delete("チャット*");
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg136_04_6_chn希ＶＩＰルーム崩壊後_a.jpg");

	Stand("st一成_浮浪者_通常","normal", 200, @-280);
	FadeStand("st一成_浮浪者_通常_normal", 0, false);
	DeleteStand("stセナ_制服_通常_hard", 0, true);
	Stand("stセナ_制服_武器構え","hard", 300, @+280);
	FadeStand("stセナ_制服_武器構え_hard", 0, true);


	FadeDelete("Black", 200, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text050]
直後に、いきなりモニタはブラックアウトした。
ブツンと、切れてしまう。
こっちから操作なんかしてないのに。

僕は興奮していた。
神に会ったんだ。僕の中の人に。

世界は多層構造になっていて、上位にいる人と対話できた。
僕はチートコードを手に入れることができる。
こんなクソな人生とはおさらばできるんだ。

僕は無敵になる。もう誰にも、僕をおびやかすことはできないぞ。
『将軍』も優愛も希テクノロジーも、敵じゃない。
僕の勝ちだ！　僕は勝ち組になるんだ！

一刻も早く、渋谷駅へ行きたい。
そしてチートコードを手に入れたい。

それなのにセナは、ぐずぐずしていた。
波多野さんに剣を突きつけたまま、うなだれている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00802030ta">
「セ、セナ……い、行かないの……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_武器構え_hard", 300, false);
	DeleteStand("st一成_浮浪者_通常_normal", 300, true);

	Stand("stセナ_制服_横向剣持ち","hard_l", 300, @+80);
	FadeStand("stセナ_制服_横向剣持ち_hard_l", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601050]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00802040sn">
「…………」

セナは僕に呼びかけられて小さくため息をつくと、剣を下ろした。
もう波多野さんを見ようとはせず、その横をすり抜けて、ディソードを無造作に振る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：ムービー：停止位置調整：剣閃が入るので一度BOX消します。
//ＳＥ//剣を振る
//ＳＥ//瓦礫を砕く
	CreateSE("SE08","SE_擬音_ディそーど_コンクリート砕く");
	CreateSE("SE09","SE_衝撃_瓦礫砕く");

	CreateMovie360("ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");
	MusicStart("SE08", 0, 1000, 0, 1000, null, false);

	WaitAction("ムービー", null);

	MusicStart("SE09",0,1000,0,1000,null,false);
	Fade("ムービー", 300, 0, null, true);
	Delete("ムービー");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3062050]
それで、道を塞いでいた瓦礫はあっさりと砕け散った。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00802050sn">
「行こう」

さっきまでの激昂ぶりとは全然違う、押し殺したような声だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//～～Ｆ・Ｏ
	SetVolume360("CH*", 1000, 0, NULL);
	SetVolume360("chn*", 1000, 0, NULL);
//	ClearAll(1000);
	Wait(1000);

}
