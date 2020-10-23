//<continuation number="240">

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_160_優愛編_逆監禁できるかも";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_160_優愛編_逆監禁できるかも();
}


function chy_160_優愛編_逆監禁できるかも()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★優愛編
//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
時間の感覚が、完全に失われてしまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	FadeDelete("Black", 1000, true);
	CreateSE("SE3601","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE3601",2000,400,0,1000,null,true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
この部屋には窓がない。
だから今が何時なのかも分からない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_キレ","cool", 200, @-150);
	FadeStand("st優愛_制服_キレ_cool", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900010yu">
「“その目だれの目？”ってどういう意味？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900020yu">
「どうしてこれから殺す相手に言わせたの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900030yu">
「どうしてダイイングメッセージとして残したの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900040yu">
「あなたはなにを訴えたいの？」

時計は、ＰＣを見るかケータイを見ることでしか確認できない。
僕はいまだベッドの足に縛られたままで、そのどちらも不可能だ。

トイレに行くときは外に出るから、かろうじて時間を確認できた。

でも、この状態が長くなればなるほど、トイレに立つのも億劫になって。
水分を取っていないせいなのか、尿意をもよおすこともほとんどなくて。

まるで、もう丸１日以上、生理現象に見舞われていないような気がする。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900050yu">
「どうしてダーススパイダーなの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900060yu">
「それをかぶることでなにを訴えたかったの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900070yu">
「宗教的な意味があるの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900080yu">
「ダークヒーロー願望？」

//◆世論＝せろん
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900090yu">
「それとも世論をバカにしたいだけ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
優愛はほとんど動かない。

ソファに座り続け、たまに座り直したり、立ち上がったりする程度。

その間も、つぶやきは止まらない。よくそれだけ喋り続けることができるよ……。

ＰＣで暇つぶしをしたり、どこかに電話やメールをしたりもせず、そして眠ることもせずに、ひたすら僕を質問責めにしてくる。優愛の声がまるで念仏のように思えてきた。

見られ続けるのは、嫌いだ。

それでも、『将軍』からの思考盗撮は、ごくたまに視線を感じるぐらいだった。イヤだったけど、まだ耐えられた。

でも、優愛による完璧な監視は――しかも眼鏡の奥のその瞳はひたすら感情のない冷徹なもの――僕という存在を絶えず否定され続けている感じがした。

とにかく、ここでこうして縛られて動けない――動かない――限り、目に見えた変化をどこからも確認できないから。

時間の感覚は、失われた。

こうして拘束されてから何日経っているのか、分からない。

まだ２日ぐらいしか経ってない気もするし、もう１ヶ月ぐらいこうしているような錯覚もある。

自分で自由に動き回ることができないのは、かなりのストレスだ。
ここ何時間かは、ひたすら“時計が見たい”と思い続けている。それ以外のことをなにも考えられない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	FadeDelete("Black", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900100yu">
「それとも……」

{	Stand("st優愛_制服_キレ","hard", 200, @-150);
	Shake("st優愛_制服_キレ*", 300, 0, 5, 0, 0, 200, null, false);
	FadeStand("st優愛_制服_キレ_hard", 300, true);
	DeleteStand("st優愛_制服_キレ_cool", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900110yu">
「っ……」

優愛の頭が、かくんと揺れた。

眼鏡を外し、目をしょぼしょぼさせながら、まぶたをこすっている。
さすがに一睡もしてない疲れが出始めたみたいだ。

後先考えずに無茶するからだ。
優愛のしていることはあまりに無駄で、不毛な努力。
僕の話をちゃんと聞いてくれたなら、こんなことせずに済んだのに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//	Stand("st優愛_制服_通常","sad", 200, @-150);
//	FadeStand("st優愛_制服_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900120yu">
「いつ、出てきてくれるんですか……」

そのささやきは、うわごとのようだった。
出てくるって、『将軍』のことか。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900130yu">
「どうしたら、出てきてくれるんですか……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900140yu">
「出てきてよ……」

出てこないよ、残念ながら。
最初から、いないんだから。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900150yu">
「待ってるから……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900160yu">
「待っ……て……」

{	Move("st優愛_制服_キレ_hard*", 300, @0, @50, Axl1, false);
	DeleteStand("st優愛_制服_キレ_hard", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900170yu">
「…………」

再び沈黙したかと思うと、優愛の身体がゆっくりと傾き。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ソファにボフッと倒れ込む
	CreateSE("SE01","SE_衝撃_ひととぶつかる");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	DeleteStand("st優愛_制服_通常_sad", 500, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
力なく、ソファに横たわってしまった。

……寝たの？
ついに耐えられなくなったの？

僕はホッと一息ついて、身体の緊張を解いた。
見つめられている間、気持ちが安らぐ時間がなかったけど、やっと少し休める。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
//	Fade("Black", 0, 0, null, true);
//	Fade("Black", 1000, 1000, null, true);

//	Delete("back*");

	Stand("st星来_覚醒後_通常","angry", 200, @-150);
	FadeStand("st星来_覚醒後_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/00900180se">
「タッキー、なに呑気なこと言ってんの！？」

ＰＣモニタの横に立っている星来たんから、声がした。

//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/00900190se">
「逃げるなら今がチャンスなんよ！？」

//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/00900200se">
「それどころかさ、今なら無防備な優愛っちを逆監禁できるかも！」

{	Stand("st星来_覚醒後_通常","happy", 200, @-150);
	FadeStand("st星来_覚醒後_通常_happy", 300, true);
	DeleteStand("st星来_覚醒後_通常_angry", 0, true);}
//◆うれしそうに
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/00900210se">
「そしたらぁ、やりたい放題じゃん、ぼけなすぅ♪」

{	DeleteStand("st星来_覚醒後_通常_happy", 500, true);}
なるほど、陵辱したり調教したりするんですね。分かります。

ソファに横たわっている優愛の顔を、恐る恐るのぞき込む。

その寝顔だけを見る限り、けっこうかわいい。
初めて会ったときの、あの柔らかな笑みの印象がよみがえる。

当たり前のことだけど、優愛は優愛で思うことがあって、僕を敵視してきたんだろうな。

僕だって、優愛を勝手に『将軍』の手下、敵だと思ってきた。

でも、そう思わせたのは優愛だ。
僕を裏切ったのは、騙していたのは、優愛の方なんだ。
だからこいつは、僕に陵辱されたり調教されたって文句は言えない。

もう一度、優愛の寝顔をうかがう。
まぶたが、ピクピクと痙攣していた。
苦しそうに表情を歪めている。

と、彼女の目尻から、涙が一筋、こぼれ落ちた。

//◆言葉にならないうわごと
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00900220yu">
「ぅ……」

もしかすると、死んだ妹の夢でも見ているんだろうか……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st星来_覚醒後_通常","shock", 200, @-150);
	FadeStand("st星来_覚醒後_通常_shock", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//ＶＦ//妄想ボイス
//【星来】
<voice name="星来" class="星来" src="voice/chn03/00900230se">
「タッキー、調教しないの？」

……涙なんか流されたら、とてもそんな気分にはなれないよ。

{	Stand("st星来_覚醒後_通常","sad", 200, @-150);
	FadeStand("st星来_覚醒後_通常_sad", 300, true);
	DeleteStand("st星来_覚醒後_通常_ahock", 0, true);}
//ＶＦ//妄想ボイス
//【星来】
<voice name="星来" class="星来" src="voice/chn03/00900240se">
「監禁されて、緊縛されてるのに？　タッキーって聖人君子だねぇ。優しい。優しすぎる！　そこはタッキーのいいところだけど、時と場合によるよ？」

{	DeleteStand("st星来_覚醒後_通常_sad", 500, true);}
そんなんじゃなくて……。

もちろん優愛を許せない気持ちもあるけど。
なんだか、怒りとか、抵抗する気力とか、そんなものも消えてしまった。

緊張から解放されたせいだろうか。
それとも、妹の話を聞いたから？

なんとなく、優愛は僕に危害を加えるつもりはないんだ、っていう気がして。

強烈な眠気が襲ってくる。
縛られた腕の痛みも忘れて、少しだけ、この眠気に身を委ねて。
この状況からどう脱出するかは、その後で考えよう……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	SetVolume("SE3601", 2000, 0, null);

	ClearAll(2000);
	Wait(1500);
}
