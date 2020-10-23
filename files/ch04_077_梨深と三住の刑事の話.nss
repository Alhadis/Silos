//<continuation number="500">




chapter main
{

	$PreGameName = "boot_第四章";

	if($GameStart != 1)
	{
		$GameName = "ch04_077_梨深と三住の刑事の話";
		$GameContiune = 1;
		Reset();
	}

		ch04_077_梨深と三住の刑事の話();
}


function ch04_077_梨深と三住の刑事の話()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 1000, 500, 0, 1000, null, true);

//ＢＧ//翠明学園階段
	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg051_01_1_昇降口_a.jpg");
	Fade("back04", 1000, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
校舎内に入って、僕はなおいっそう顔をうつむかせる。

{	CreateTextureEX("back05", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Fade("back05", 500, 1000, null, true);}
いつもの処世術として、廊下の端をゆっくり歩きながら階段へ向かう。

僕のクラスは３階だ。

そこまで上るのがけっこうめんどくさい。
エスカレーターでもあればいいのにと思う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 40, "cg/bg/bg052_01_1_学校階段_a.jpg");
	Stand("st梢_制服_通常","sad", 200, @+100);
	FadeStand("st梢_制服_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
階段の前まで来て、前方をよろよろとした足取りで上っている女子の姿を発見した。

右足を少し引きずるような歩き方だ。

ひねったのかな。
小柄な身体が左右にフラフラと揺れ、やけに危なっかしい。

他の生徒にどんどん横から追い抜かれていく中、その女子はホントに一段一段ゆっくりゆっくりと上っていく。

下から見ていると、今にもパンツが見えそうだった。

ま、まずい。
これじゃ僕はヘンタイになってしまう。ミラーマンって呼ばれたくない。

そう思って、その女子を追い抜くべく階段に足を踏み出した――そのとき。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

/*森島ＳＥダミー*/
	CreateSE("SE02","SE_衝撃_せ中を押される");
	MusicStart("SE02", 0, 400, 0, 1000, null, false);

	DeleteStand("st梢_制服_通常_sad", 300, true);
	Wait(300);

	Request("SE01", Lock);
	PrintBG(50);
	Request("SE01", UnLock);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【梢】
<voice name="梢" class="梢" src="voice/ch04/07700010ko">
「っ！」

女子が、つま先を段差に引っかけたらしく、急によろめいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back04", 100, 0, 0, "cg/ev/ev035_01_0_梢コケる_a.jpg");
	CreateSE("SE02","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Shake("back04", 500, 10, 10, 0, 0, 500, null, false);
	Fade("back04", 500, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
そして、ベチャッという効果音が聞こえてきそうなほど勢いよく転んでしまった。

幸い転んだ先が踊り場だったから、階段を転がり落ちてくるっていうことはなかったけど、女子は痛そうに膝をついたまましばらく動かない。

これってフラグ発生イベントかな？

そんなわけないよな。
そうだとしても、ここで声をかけるなんて僕には無理だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
だから僕はそそくさと女子の横をすり抜けた。

悪いけど、三住くんみたいな、三次元に興味のある女好きにでも助けてもらいなよ。

僕を当てにしないでくれ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07700020ta">
「…………」

でも女子があまりにじっとうずくまっているから、ちょっと心配になった。
階段を途中まで上ってから、そっと振り返って様子を窺ってみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/bg/bg052_01_1_学校階段_a.jpg");
	Stand("st梢_制服_正面","sad", 200, @+100);
	FadeStand("st梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
その女子は、手すりにつかまって一生懸命な様子で立ち上がろうとしていた。

膝がぷるぷると震えている。
産まれたばかりの子鹿みたいだ。

膝には血が滲んでいた。
もしかしてすりむいたのかな。

//ＣＨ//梢　//◆泣く
//【梢】
<voice name="梢" class="梢" src="voice/ch04/07700030ko">
「っ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07700040ta">
「あ……」

あの顔……見たことあるぞ……。
もしかして先週僕のクラスに転校してきた子じゃないか？

名前は……なんだっけ？　覚えてない……。

しかもあの子、泣いてるし……。

そんなに痛かったのかな。
確かに倒れ方は派手だったものの、泣くほどの衝撃じゃなかったようにも見えたけど……。

他の誰も、彼女に手を貸そうっていう人間はいない。

{/*森島ＳＥダミー*/
	CreateSE("SE02","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
彼女はかろうじて立ち上がると、今度は前屈みになって自分の膝をのぞき込み始める。
どうやら傷の状態を調べているらしい。

//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch04/07700050ko">
「…………」

{/*森島ＳＥダミー*/
	CreateSE("SE02","SE_じん体_動作_のぞく");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	DeleteStand("st梢_制服_正面_sad", 500, false);}
転校生は涙を拭うと、その場に自身のカバンを置いて中をガサゴソと引っかき回し始めた。

なにを探してるんだろう……と思ったら。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 100, 0, NULL);
	Stand("st梢_制服_通常","smile", 200, @+100);
	Move("st梢_制服_通常_smile*", 0, @0, @100, null, true);
	Move("st梢_制服_通常_smile*", 300, @0, @-100, Dxl2, false);
	FadeStand("st梢_制服_通常_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
いきなり、勝ち誇ったようにカバンから抜いた手を頭上に掲げた。

その指につままれていたのは……ばんそうこう。

{	Stand("st梢_制服_通常","normal", 200, @+100);
	FadeStand("st梢_制服_通常_normal", 300, true);
	DeleteStand("st梢_制服_通常_smile", 0, true);}
//【梢】
<voice name="梢" class="梢" src="voice/ch04/07700060ko">
「……っ」

目が合った。

{	Stand("st梢_制服_通常","shy", 200, @+100);
	FadeStand("st梢_制服_通常_shy", 300, true);
	DeleteStand("st梢_制服_通常_normal", 300, false);
	Wait(300);
	DeleteStand("st梢_制服_通常_shy", 500, false);}
転校生はすぐにハッとして頬を染め、うなだれてしまう。

と、とりあえず……大丈夫みたいだし、
僕がここで見てないでも平気だよね……。

そう思って、そそくさと教室に向かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Request("SE01", Lock);
//ＢＧ//教室
	PrintBG(50);

	Request("SE01", UnLock);

	CreateSE("SE02","SE_日常_教室扉_開く");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");
	Request("back03", Smoothing);

	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

	SetVolume("SE01", 2000, 1000, NULL);

	CreateBG(100, 0, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");

	Wait(500);

	CreateBG(100, 500, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
いつものように顔は伏せ、視線は自分のつま先に固定。

無言のまま自分の席に着く。

そう言えばさっきの転校生、転校してきた日に僕になにか言ってきたような覚えがある。

//おがみ：テキスト修正
//同じクラスになれてよかったとかなんとか。
梨深のことがあってすっかり忘れてたけど、あれってどういう意味だったんだろう……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","normal", 250, @-160);
	FadeStand("bu大輔_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700070mi">
「よう、タク」

また例によって三住くんが声をかけてくる。
彼って実は僕の他に友達がいなかったりして。

そう疑いたくなるぐらい、彼はいつも僕にばかり話しかけてくる。

{	Stand("bu大輔_制服_通常","pride", 250, @-160);
	FadeStand("bu大輔_制服_通常_pride", 500, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700080mi">
「聞いてくれよ、昨日さ、怪しいおっさん２人が、校長室に入ってくのを見たんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07700090ta">
「……？」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700100mi">
「で、俺と梨深とで、こっそり盗み聞きしてみたら、びっくりしたぜ」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700110mi">
「その２人、刑事だったんだぜ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07700120ta">
「え……！？」

刑事が……！？

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700130mi">
「なんか深刻そうに全校生徒の名簿とか見ててよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700140mi">
「もしかしてニュージェネと関係あんのかな」

ニュージェネの真犯人は、
この学校の生徒っていうことなんだろうか……。

どうしても思い浮かべてしまうのは……梨深の顔。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_pride", 500, true);

	Stand("bu大輔_制服_通常","pride", 250, @-300);
	Stand("bu梨深_制服_右向き","hurry", 200, @300);
	FadeStand("bu梨深_制服_右向き_hurry", 500, false);
	FadeStand("bu大輔_制服_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700150ri">
「まあ、盗み聞きしてたら見事にバレちゃったんだけどね。たはは」

ギクリとする。<k>
噂をすればなんとやら、乱入してきた梨深の声を聞いて、自分の心拍数が跳ね上がるのを感じた。

顔を上げられない。緊張する。
この緊張は先週までのものとはまったく別の種類のものではあるけど。

{	Stand("bu大輔_制服_通常","worry", 250, @-300);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700160mi">
「あれはお前が、ドア勝手に開けたせいだぞ。分かってんのか？」

{	Stand("bu梨深_制服_通常","hard", 200, @300);
	DeleteStand("bu梨深_制服_右向き_hurry", 500, false);
	FadeStand("bu梨深_制服_通常_hard", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700170ri">
「しょうがないでしょ。本物の刑事さんって見るの初めてだったから、ちょっと興奮しちゃって、つい……」

{	Stand("bu大輔_制服_通常","sigh", 250, @-300);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700180mi">
「なにをどうやったら、ついドアを開けるんだよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700190mi">
「おかげで俺らまで刑事から話を聞かれる羽目になったんだからな」

{	Stand("bu梨深_制服_通常","normal", 200, @300);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700200ri">
「ふぅ～ん、大ちんってば、刑事さんに聞かれちゃまずいことでもあったの？」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700210mi">
「そういうお前はどうなんだ？」

{	Stand("bu梨深_制服_通常","happy", 200, @300);
	FadeStand("bu梨深_制服_通常_happy", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, true);}
//◆いたずらげに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700220ri">
「さぁねぇ、あはは」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※刑事が名簿を見に来たのを梨深が盗み聞きしていた→梨深がその場で名簿を改ざんし、翠明学園の生徒として本来在籍していない拓巳と梨深の名前を加えた

	DeleteStand("bu大輔_制服_通常_sigh", 500, false);
	DeleteStand("bu梨深_制服_通常_happy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
僕の机を挟んで、三住くんと梨深が会話をしている。

僕の存在はスルーだ。

でも正直、その方がありがたい。
もし梨深に話しかけられても言葉を返せる自信がない。

このまま話しかけられずにチャイムが鳴ってくれないかと期待したけど、時計をチラッと見るとまだ予鈴まで５分くらいある。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","normal", 250, @-160);
	FadeStand("bu大輔_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700230mi">
「そういやタク。ここに来る途中で梢ちゃん見なかったか？」

梢ちゃん？　って誰？

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700240mi">
「ああ、そっか。どうせお前のことだから覚えてねえとは思ったけど、マジでそうだったんだな」

{	Stand("bu大輔_制服_通常","pride", 250, @-160);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700250mi">
「先週転校してきた子のことだよ。折原梢ちゃん」

そうか、あの転校生は折原梢って言うのか。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07700260ta">
「か、階段で……」

{	Stand("bu大輔_制服_通常","shock", 250, @-160);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700270mi">
「階段？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07700280ta">
「見た……」

{	Stand("bu大輔_制服_通常","pride", 250, @-160);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_shock", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700290mi">
「お、そっか。じゃあもうすぐ来るな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07700300ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
三住くんの声からは、やる気満々、という雰囲気が伝わってくる。

こんなに生き生きしている彼は、数日前にＦＥＳが隣のクラスの女子だと知ったとき以来だ。

要するに女絡み以外のことで頑張っているのを見たことがない、っていう意味。

そう言えば三住くんは先週も、
あの転校生がやってくるなり口説きに行ってたっけ。

ホント、たくましいなあ。
カノジョだっているくせによくやるよ。

{	Stand("bu大輔_制服_通常","normal", 250, @-160);
	FadeStand("bu大輔_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700310mi">
「なあ、梢ちゃんってマジかわいいと思わねえ？」

返答に困るようなことを聞いてくる。

僕は曖昧にうなずいた。
どうやらそれを彼は肯定だと受け取ったらしい。

{	Stand("bu大輔_制服_通常","smile", 250, @-160);
	FadeStand("bu大輔_制服_通常_smile", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700320mi">
「だろー？　俺、一目で気にいっちまったよ。なんか守ってやりたくなるんだよなー」

{	Stand("bu大輔_制服_通常","worry", 250, @-160);
	FadeStand("bu大輔_制服_通常_worry", 300, true);
	DeleteStand("bu大輔_制服_通常_smile", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700330mi">
「男子みんなも同じ意見でよ、どいつもかわいいって言ってんだ。けどよ、女子の間じゃあんま評判よくねーんだよな」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700340mi">
「まだ転校してきたばっかだぜ？　それなのに早くも“ウザい”みてーな意見まで出てきてんだよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700350mi">
「このクラスの女子って性格悪いヤツ多すぎだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_worry", 500, true);
	Stand("bu大輔_制服_通常","worry", 200, @-300);
	Stand("bu梨深_制服_通常","hard", 200, @300);
	FadeStand("bu梨深_制服_通常_hard", 500, false);
	FadeStand("bu大輔_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700360ri">
「それって大ちんのせいじゃないの？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700370ri">
「だいたいその“ウザい”って言ったの、
どうせ大ちんのカノジョでしょ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700380mi">
「ん？　ああ、そうだけど」

{	Stand("bu梨深_制服_通常","rage", 200, @300);
	FadeStand("bu梨深_制服_通常_rage", 300, true);
	DeleteStand("bu梨深_制服_通常_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700390ri">
「そりゃカノジョにしてみればウザいに決まってるよー。自分のカレシが目の前で折原さんを口説きに行っちゃってたらさ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700400ri">
「あたしでさえよくケンカ売られるんだから。“大輔くんに近寄らないで”って。しかもひとりじゃなくて何人かから言われた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","shock", 250, @-300);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700410mi">
「マジ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700420ri">
「はあ、自覚なしかー。少しは反省したら？」

{	Stand("bu大輔_制服_通常","pride", 250, @-300);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_shock", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700430mi">
「いやー、モテる男はつらいぜ。フッ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700440ri">
「これだよ……。さすが女の敵。もうあたし、フォローしてあげないからね」

{	Stand("bu梨深_制服_通常","normal", 200, @300);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_rage", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700450ri">
「あ、折原さん、来た」

{	Stand("bu大輔_制服_通常","shock", 250, @-300);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700460mi">
「なんかケガしてるみたいじゃねぇ？」

{	Stand("bu梨深_制服_正面","sad", 200, @300);
	DeleteStand("bu梨深_制服_通常_normal", 500, false);
	FadeStand("bu梨深_制服_正面_sad", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700470ri">
「ホントだ、どうしたんだろ……」

そのケガはさっき階段でこけたときのものだよ。

もちろんその事実を２人に伝える気はない。
今はとにかく梨深と話すことを少しでも避けたいんだ。


//【三住】
<voice name="三住" class="三住" src="voice/ch04/07700480mi">
「俺ちょっと行ってくる」

{	DeleteStand("bu大輔_制服_通常_shock", 500, false);}
三住くんが転校生のところへ駆け寄っていってしまう。
おかげで僕の席の近くには梨深だけが残る形になった。

ああ、三住くん行かないでくれよぅ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch04/07700490ri">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/07700500ta">
「…………」

{	DeleteStand("bu梨深_制服_正面_sad", 500, true);}
梨深はなにも言わない。
そのくせ僕の席からも離れようとしない。

僕はうつむいて自分の机にかじりついているような格好だから、彼女がどんな顔をしているのか分からない。

彼女の腰のあたりしか見えない。
でもそれによって、梨深が僕の方に身体を向けているのは分かる。
つまり……見られている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("１５");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

}