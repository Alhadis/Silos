//<continuation number="530">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_167_インターミッション３７";
		$GameContiune = 1;
		Reset();
	}

		ch08_167_インターミッション３７();
}


function ch08_167_インターミッション３７()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション３７
//ＢＧ//原宿ゲロカエルんショップ//夕方


	IntermissionIn();

	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg064_01_2_ゲロカエルン店外観_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	IntermissionIn2();

	Wait(1000);

	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ゲロカエルんの専門ショップは、『カエル家（いえ）』という名前だった。

ちょっとしたダジャレで客の印象を良くしようという狙いなのだろうが、はっきり言ってオヤジギャグレベルだ、と判はため息をついた。

『カエル家』は現在、首都圏に２０店舗ほどが展開しており、なおも拡大中だと言う。

中でも１号店であり、ゲロカエルんファンからは聖地と呼ばれている原宿のショップを、判は訪れていた。

だが、彼は早くも来たことを後悔していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","shock", 200, @240);
	FadeStand("st安二_スーツ_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【判】
<voice name="判" class="判" src="voice/ch08/16700010bn">
「うーん。なあ優愛ちゃん。か、帰っていいか……？」

同行し、店まで案内してくれた優愛に、小声でそうつぶやく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","shock", 200, @-240);
	FadeStand("st優愛_制服_通常左手下_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700020yu">
「え、でも、百瀬さんからゲロカエルんを買ってくるように、
頼まれてるんじゃ……？」

//【判】
<voice name="判" class="判" src="voice/ch08/16700030bn">
「だってよぉ、おじさんだけ明らかに浮いてるからさあ」

{	DeleteStand("st安二_スーツ_通常_shock", 500, false);
	DeleteStand("st優愛_制服_通常左手下_shock", 500, false);}
竹下通り沿いにあり、目の前の道を若者たちが楽しそうに歩いているが、ほとんどの人間がこのショップに目もくれずに通り過ぎていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 2000, 500, true);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg065_01_2_ゲロカエルン店店内_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603001]
狭い店内にはあまり人はいない。

今も客は判、優愛を含めて５人ほどで、判以外の全員が女子高生だった。

判のような冴えない風体で、優愛と一緒に竹下通りを歩けば、淫行目的の男だと周囲には映ってしまうだろう。

そして流行りのマスコットを買ってやる……。なんとステレオタイプなエロオヤジなのだろう。判は憂鬱になった。

しかも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu安二_スーツ_通常","hard", 250, @320);
	FadeStand("bu安二_スーツ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【判】
<voice name="判" class="判" src="voice/ch08/16700040bn">
「な～んか、誰かに見られてるような気がするんだよなあ」

//【判】
<voice name="判" class="判" src="voice/ch08/16700050bn">
「いい年して自意識過剰かもしんねえが」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常","shock", 200, @-320);
	FadeStand("bu優愛_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700060yu">
「あ、それ、わたしも、です」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700070yu">
「最近、誰かの視線を感じて……たまに、すごく、怖くなるんですよ……」

{	Stand("bu安二_スーツ_通常","normal", 250, @320);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_hard", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700080bn">
「なんだ、俺だけじゃなかったか」

//【判】
<voice name="判" class="判" src="voice/ch08/16700090bn">
「優愛ちゃんの場合は心配だな。
ストーカーに付け狙われてたりしたら……」

{	Stand("bu優愛_制服_通常左手下","sad", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_sad", 500, false);
	DeleteStand("bu優愛_制服_通常_shock", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700100yu">
「そ、そんな……！　怖いこと言わないでください……」

{	Stand("bu安二_スーツ_通常","pride", 250, @320);
	FadeStand("bu安二_スーツ_通常_pride", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700110bn">
「安心しな。そんなヤツがいたら俺が逮捕してやるから」

ニヤリと笑って話を切り上げ、判は棚に置かれている様々なカエルのマスコットをしげしげと眺めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu安二_スーツ_通常","normal", 250, @320);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_pride", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【判】
<voice name="判" class="判" src="voice/ch08/16700120bn">
「ところで、優愛ちゃんはここに来るのは何度目だい？」

{	Stand("bu優愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_sad", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700130yu">
「わ、わたしも初めてです……」

{	Stand("bu安二_スーツ_通常","hard", 250, @320);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700140bn">
「あんまり客がいねえようだが……」

//【判】
<voice name="判" class="判" src="voice/ch08/16700150bn">
「静かなブームってヤツなのか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","normal", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_normal", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700160yu">
「えっと、金曜日から日曜日にかけては、すごく、混んでるらしいです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700170yu">
「あ、つまりその、新作が発売されて、週末の間だけ、ですね」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700180yu">
「特に金曜日は、ものすごく並ぶらしくて……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700190yu">
「学生のために、１８時に販売開始なんですけど、噂だと、その行列だけで竹下通りが埋め尽くされる、とか……」

//【判】
<voice name="判" class="判" src="voice/ch08/16700200bn">
「週末だけ、ねぇ。ますます怪しいな」

判はとりあえず、先週発売されたという“涙目ゲロカエルん”をふたつ持って、レジへ向かった。

優愛は買わないらしく、判の後ろをついてくるだけだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu安二_スーツ_通常_hard", 500, false);
	DeleteStand("bu優愛_制服_通常左手下_normal", 500, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆しゃぁせぇ＝いらっしゃいませ
//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700210ss">
「しゃぁせぇ」

ショップ店員は、髪を緑色に染めた、頭の悪そうな２０代の男だった。耳にピアスまでしていて、レジにいなければとても店員には見えない。

少なくとも接客する格好ではなかった。

その店員が、判と優愛とを無遠慮にジロジロと見つめてくる。

//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700220ss">
「娘さんへのプレゼントってヤツっすか？」

{	Stand("bu安二_スーツ_通常","pride", 250, @320);
	FadeStand("bu安二_スーツ_通常_pride", 500, true);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700230bn">
「いやあ、そうなんだよねえ」

//【判】
<voice name="判" class="判" src="voice/ch08/16700240bn">
「この子がどうしてもって言うから」

//【判】
<voice name="判" class="判" src="voice/ch08/16700250bn">
「まあ、たまには父親らしいことしてやらんとねえ。はっは」

判は愛想笑いを浮かべ、自分より年下の店員にヘコヘコして見せた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","shock", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_shock", 500, true);
	Wait(300);
	Stand("bu優愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_shock", 0, false);
	Wait(200);
	DeleteStand("bu優愛_制服_通常左手下_worry", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
優愛が驚いたような顔をしてうつむいてしまったが、構わずその“父親という設定”を続ける。

{	Stand("bu安二_スーツ_通常","normal", 250, @320);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_pride", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700260bn">
「それより、このカエルに興味あるんだけど、ちょっと話聞かせてもらっていいかな？」

//【判】
<voice name="判" class="判" src="voice/ch08/16700270bn">
「ゲコカエルんて、そんなに人気あるの？」

//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700280ss">
「っていうか、ゲロカエルんすよ。バンバン人気あってぇ、ヤバいっス」

{	Stand("bu安二_スーツ_通常","pride", 250, @320);
	FadeStand("bu安二_スーツ_通常_pride", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700290bn">
「ああ、ゲプカエルんね。いつも週末に、新作が出るんでしょう？」

//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700300ss">
「ゲロカエルんだって言ってんじゃん、マジで」

//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700310ss">
「っていうか、新作とかそういう言い方、マジやめてよ。“新ガエル”だから」

//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700320ss">
「金、土、日と超並んでぇ、バンバン売れるんでぇ。マジヤバいっすよ。マジでバンバン売れるっすから」

//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700330ss">
「バンバンっすよマジで」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","worry", 200, @-320);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
優愛が、ふと眉根をひそめる。

この店員の口癖なのか、“バンバン”という言葉に違和感を覚えた。

なぜこれほど強調するのだろう。意図的ではないのだろうが、判がこの若い店員に名前を呼び捨てにされているように錯覚してしまう。

{	Stand("bu安二_スーツ_通常","normal", 250, @320);
	FadeStand("bu安二_スーツ_通常_normal", 300, true);
	DeleteStand("bu安二_スーツ_通常_pride", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700340bn">
「これ、メイドインチャイナってラベルに書いてあるだけなんだけど、メーカーとか分かる？」

//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700350ss">
「は？　メーカー？」

//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700360ss">
「っつーか、ゲロカエルんにブランドとかねーし。ゲロカエルんはゲロカエルんじゃね？　それで完結してね？」

//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700370ss">
「おっさん、マジウケんだけど」

//【ショップ店員】
<voice name="ショップ店員" class="ショップ店員" src="voice/ch08/16700380ss">
「教えとくとぉ、ゲロカエルんって作ってんじゃねぇから。マジ、バンバン産まれてっから」

{	Stand("bu安二_スーツ_通常","hard", 250, @320);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700390bn">
「…………」

{	DeleteStand("bu安二_スーツ_通常_hard", 500, false);
	DeleteStand("bu優愛_制服_通常左手下_worry", 500, true);}
さすがの判も、これ以上話していると爆発しそうだったので、そこで切り上げて代金を払い、店を出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg064_01_2_ゲロカエルン店外観_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	SoundPlay("SE01", 2000, 1000, true);
	Wait(1000);
	Stand("st安二_スーツ_通常","hard", 200, @240);
	FadeStand("st安二_スーツ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【判】
<voice name="判" class="判" src="voice/ch08/16700400bn">
「ちっ、店員の教育がなってねえな」

//【判】
<voice name="判" class="判" src="voice/ch08/16700410bn">
「今時の若い連中ときたら、ロクに会話もできやしねー」

//【判】
<voice name="判" class="判" src="voice/ch08/16700420bn">
「だいたいなんだあの格好は」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st安二_スーツ_通常_hard", 500, true);
	Stand("st優愛_制服_通常左手下","worry", 200, @-240);
	FadeStand("st優愛_制服_通常左手下_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//◆苦笑
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700430yu">
「……そ、そうですね」

{	Stand("st優愛_制服_通常","shock", 200, @-240);
	FadeStand("st優愛_制服_通常_shock", 500, false);
	DeleteStand("st優愛_制服_通常左手下_worry", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700440yu">
「あ……」

優愛が不意に足を止めた。
判のスーツの裾をつかみ、引き留める。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700450yu">
「み、見てください、判さん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","normal", 210, @240);
	FadeStand("st安二_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【判】
<voice name="判" class="判" src="voice/ch08/16700460bn">
「どしたぁ？」

優愛が指さす方向には、白い２トントラックが停まっていた。その荷台から、今まさにいくつものダンボールが下ろされている。

そしてそれは、先ほどのゲロカエルんショップの裏へと続々と運び込まれていた。

{	Stand("st安二_スーツ_通常","shock", 210, @240);
	FadeStand("st安二_スーツ_通常_shock", 300, true);
	DeleteStand("st安二_スーツ_通常_normal", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700470bn">
「おっ！　明日発売になる、ゲジカエルんの新作か」

{	Stand("st優愛_制服_通常","worry", 200, @-240);
	FadeStand("st優愛_制服_通常_worry", 300, true);
	DeleteStand("st優愛_制服_通常_shock", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700480yu">
「あ、あの、ゲロカエルんです――」

{	Stand("st安二_スーツ_通常","pride", 210, @240);
	FadeStand("st安二_スーツ_通常_pride", 300, true);
	DeleteStand("st安二_スーツ_通常_shock", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700490bn">
「優愛ちゃん、よく見つけたな。偉いぞ」

{	Stand("st優愛_制服_通常左手下","shy", 200, @-240);
	FadeStand("st優愛_制服_通常左手下_shy", 300, true);
	DeleteStand("st優愛_制服_通常_worry", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700500yu">
「え、いえそんな……」

トラックの荷台には、普通なら社名が入っていそうなものだったが、真っ白に塗られていてなにも書かれていない。

ただ、運び込まれているダンボールには、ゲロカエルんのイラストとともに一応社名が入っていた。

{	Stand("st安二_スーツ_通常","hard", 210, @240);
	FadeStand("st安二_スーツ_通常_hard", 300, true);
	DeleteStand("st安二_スーツ_通常_pride", 0, false);}
//◆※シンコー＝神光
//【判】
<voice name="判" class="判" src="voice/ch08/16700510bn">
「有限会社シンコー……聞いたことあるかい？」

{	Stand("st優愛_制服_通常左手下","worry", 200, @-240);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("st優愛_制服_通常左手下_shy", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/16700520yu">
「えと、ありません……」

{	Stand("st安二_スーツ_通常","pride", 210, @240);
	FadeStand("st安二_スーツ_通常_pride", 300, true);
	DeleteStand("st安二_スーツ_通常_hard", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/16700530bn">
「となれば、困ったときのモモちゃん頼みだな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*",2000,0,false);
	ClearAll(2000);
	Wait(2000);

//■インターミッション３７終了


}