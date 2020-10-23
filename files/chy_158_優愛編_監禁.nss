//<continuation number="970">

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_158_優愛編_監禁";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_158_優愛編_監禁();
}


function chy_158_優愛編_監禁()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★優愛編

//ＢＧ//拓巳の部屋
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 2000, 1000, null, true);

	CreateSE("SE3601","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE3601",2000,400,0,1000,null,true);


	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
優愛の襲撃から、そろそろ１８時間が経とうとしている……。

僕はロフトベッドの足の部分に、後ろ手で縛り付けられていた。

幸い、座った状態で縛られたからそれほど疲れることはないけど、それでも紐が手首に食い込んで、かなり痛む。

途中、３時間ほどウトウトとしたけど、まともには寝られなかったせいか、目がショボショボする。

くそぅ……僕にはＳＭの趣味はないんだぞ……。
こんなプレイはお断りだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_キレ","cool", 110, @-150);
	FadeStand("st優愛_制服_キレ_cool", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800010yu">
「…………」

優愛が、ソファに腰掛けてじっと僕を見ている。
しかも徹夜でだ。

ひたすら、僕をこうしてにらみ続けている。
眠くならないんだろうか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 2000, 1, null);


	CreateColor("Black", 150, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);
	DeleteStand("st優愛_制服_キレ_cool", 0, true);
	CreateColor("明度調整", 19000, 0, 0, 1280, 720, "Black");
	Fade("明度調整", 0, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
そもそもこんなことしてどうなるんだ。
優愛は僕のことをＤＩＤだと思い込んでいるけど、それは間違いだ。
だからいくら待ったって、『将軍』は出てこない。

こうして縛られた直後、自由に喋る機会を与えられたので、その主張を散々繰り返した。でも優愛は聞く耳を持たなくて。

あまりにも頑固だったから、数時間後には説得をあきらめざるを得なかった。

その後は――

{	Stand("st優愛_制服_キレ","cool", 200, @-150);
	FadeStand("st優愛_制服_キレ_cool", 500, true);}
//◆以下、ヤンデル口調。ボソボソと小声でつぶやいている感じ
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800020yu">
「あなたが『将軍』を生み出したんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800030yu">
「あなたが『将軍』なんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800040yu">
「現実逃避の手段」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800050yu">
「『将軍』はあなた自身であり」

{	Stand("st優愛_制服_冷酷","cool", 200, @150);
	DeleteStand("st優愛_制服_キレ_cool", 500, false);
	FadeStand("st優愛_制服_冷酷_cool", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800060yu">
「同時にあなたではない別の存在」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800070yu">
「もう１人のあなた」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800080yu">
「あなたの負の側面」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800090yu">
「あなたの弱い心を守るための存在」

{	Stand("bu優愛_制服_キレ","cool", 200, @0);
	DeleteStand("st優愛_制服_冷酷_cool", 500, false);
	FadeStand("bu優愛_制服_キレ_cool", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800100yu">
「あなたの狂気」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800110yu">
「快楽殺人者」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800120yu">
「手段は選ばない」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800130yu">
「殺す相手も選ばない」

{	Stand("st優愛_制服_冷酷","cool", 200, @-150);
	DeleteStand("bu優愛_制服_キレ_cool", 300, false);
	FadeStand("st優愛_制服_冷酷_cool", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800140yu">
「殺すことが存在理由」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800150yu">
「誰でもよかったんですか？」

{	Stand("st優愛_制服_キレ","cool", 200, @150);
	DeleteStand("st優愛_制服_冷酷_cool", 300, false);
	FadeStand("st優愛_制服_キレ_cool", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800160yu">
「本当に？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800170yu">
「美愛は、なぜ選ばれたんですか？」

{	Stand("bu優愛_制服_冷酷","cool", 200, @0);
	DeleteStand("st優愛_制服_キレ_cool", 300, false);
	FadeStand("bu優愛_制服_冷酷_cool", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800180yu">
「答えて」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800190yu">
「答えてよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800200yu">
「答えてください」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800210yu">
「答えてほしい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800220yu">
「答えないと許しません」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_冷酷_cool", 300, true);

	SetVolume("SE3601", 2000, 400, null);

	FadeDelete("明度調整", 1000, false);
	FadeDelete("Black", 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
優愛の、病的とも言えるつぶやきを延々と聞かされていた。
この狭い部屋じゃ、耳を塞ぐ手段を封じられている僕は、強制的に聞かされてしまう。

頭がどうにかなりそうだった。

逃げ出す方法はないかも考えた。
トイレに行きたいと訴えて、逃げるチャンスを窺ってもみた。

でもダメだった。トイレに行くこと自体は許されて拘束も解かれたけど、優愛はぴったりとついてきた。用を足しているときも、すぐ後ろで見張られていた。

しかもそのときだって、この女は背後でブツブツとつぶやいていたんだ。

こんなこと、いつまで続けるつもりだ？

例えば優愛の気が変わって、いきなり殺されるっていう可能性もあるかもしれないから、僕としてもおちおち寝ていられない。もっとも、起きていたとしても自分の身を守れる自信なんてないけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_冷酷","cool", 110, @-150);
	FadeStand("st優愛_制服_冷酷_cool", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆以下、ヤンデル口調//◆
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800230yu">
「なにがきっかけ？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800240yu">
「どうすれば出てくるんですか？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800250yu">
「肉体的苦痛？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800260yu">
「精神的苦痛？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800270yu">
「性的衝動？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800280yu">
「トラウマ？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800290yu">
「偶然？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800300yu">
「…………」

つぶやき続けていた優愛が、不意に黙り込んだ。

相変わらず、じっと僕を見てはいるけど。
静まり返ったこの部屋。
沈黙が、逆に緊張感をかき立てる。

と、きゅるるる、とお腹が鳴る音がした。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800310yu">
「…………」

飲まず食わずだから僕だって腹は減ってるけど、今のは僕じゃない。

……つまり優愛も腹ぺこっていうことか。

もっとも、お腹が鳴る音を僕に聞かれたはずなのに、優愛はまったく表情を変えなかった。

普通の女の子なら――例えば星来たんなら、もっとかわいらしい反応をするのに。
そうだな、きっとこう言うに違いない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 500, 1, null);

	CreateColor("Black", 1500, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

	Delete("back*");
	CreateTexture360("妄想背景", 110, 0, 0, "cg/bg/bg161_01_6_妄想世界_a.jpg");
	DeleteStand("st優愛_制服_冷酷_cool", 0, true);

	BGMPlay360("CH07",1000,1000,true);


	Fade("Black", 500, 0, null, true);

	Stand("st星来_覚醒後_通常","angry", 1200, @-50);
	FadeStand("st星来_覚醒後_通常_angry", 500, true);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/00800320se">
「な、なにさ。しょうがないっしょ、食べたいけど、すごく我慢してるんだから」

{	Stand("st星来_覚醒後_通常","shock", 1200, @-50);
	FadeStand("st星来_覚醒後_通常_shock", 300, true);
	DeleteStand("st星来_覚醒後_通常_angry", 0, true);}
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/00800330se">
「え、なんでって、それは……。前に、あなたに太ってるって言われたから……」

{	Stand("st星来_覚醒後_通常","angry", 1200, @-50);
	FadeStand("st星来_覚醒後_通常_angry", 300, true);
	DeleteStand("st星来_覚醒後_通常_shock", 0, true);}
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/chn03/00800340se">
「で、でも別にさ、あなたに言われたからダイエットしてるわけじゃないよっ。勘違いしないでよねっ！　このぼけなす！」

これはなんという分かりやすいツンデレ。
照れながら怒る星来かわいいよ星来。

くそぅ。こんな状況じゃ、妄想にも逃げたくなるさ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume360("@CH*", 1000, 0, null);

	Fade("Black", 500, 1000, null, true);

	Delete("妄想背景");
	DeleteStand("st星来_覚醒後_通常_angry", 0, true);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

	SetVolume("SE3601", 1000, 500, null);
	FadeDelete("Black", 500, true);

	Wait(300);

	Stand("st優愛_制服_通常左手下","hard", 200, @-150);
	FadeStand("st優愛_制服_通常左手下_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆普通の口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800350yu">
「食べないんですか？」

優愛が口を開いた。相変わらずその口調は冷徹で。
視線は、座っている僕の足許へ向けられている。

そこに、皿が置いてあった。

盛りつけられているのは、パスタだ。たらこスパゲティ。ご丁寧に刻み海苔まで乗せてある。

とはいえ、すでに２時間ほど放置されているから、麺はすっかり伸びきってしまっているだろう。

それは優愛が作った。

僕を縛ったままなにも言わずに出て行って、３０分くらいして戻ってきたと思ったらこのパスタを持ってきてくれた。

わざわざスーパーへ行って食材を買ってきて、このコンテナハウスの外で作ったらしい。

手作り、というのがなにを意図しているのか、僕には理解しかねた。
コンビニで出来合いのものを買ってくればいいだけなのに。

毒でも入れられているかもしれない。
そう思って、手を付けなかった。

そもそも手を縛られている状態で足許にそれを置かれても、食べようがない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00800360ta">
「あんたが、食べればいい……」

お腹を鳴らした優愛に、皮肉を込めてそう言い返してやった。

{	Stand("st優愛_制服_通常左手下","worry", 200, @-150);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("st優愛_制服_通常左手下_hard", 0, true);}
//◆以下、普通の口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800370yu">
「あなたを肉体的にいたぶろうとか、そんなつもりはないんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800380yu">
「わたしはただ、『将軍』が出てくるのを、待っているだけ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800390yu">
「だから、食べてください。食べてくれなきゃ困ります。食べて」

//◆以上、普通口調
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00800400ta">
「こ、この状態で、たべ、食べられると、思ってるの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00800410ta">
「む、無茶言わないでよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE01",0,1000,0,1000,null,false);


	DeleteStand("st優愛_制服_通常左手下_worry", 500, true);
	Stand("bu優愛_制服_通常左手下","hard", 200, @-150);
	FadeStand("bu優愛_制服_通常左手下_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆普通口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800420yu">
「…………」

優愛は立ち上がって近寄ってくると、僕のすぐ横にしゃがみ込んだ。

僕は怖くて顔をそらしつつも、縄をほどいてくれる気になったんだろうかと内心期待した。

でもそうじゃなかった。

優愛は皿を引き寄せ、すっかり伸びきって水気を失っているパスタを、苦労しながらフォークで巻き取って僕の口へと差し出してきた。

//◆普通口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800430yu">
「どうぞ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00800440ta">
「イ、イヤだ……。た、食べないぞ……」

“はい、ア～ンして♪”とか、エロゲ内でしか体験できないイベントだけど。

この殺伐とした状況でそんなことやられたって、逆に殺意が湧くだけなんだよ。

そういうことは、僕の拘束を解いてからやれよな……！

そうしたら、仕方なく食べてやるフリをしつつ、“やっぱりまずそうだからイラネ”って言ってやんよ。

//◆普通口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800450yu">
「レンジで、チンしましょうか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00800460ta">
「い、いらないって、言ってるじゃないか……」

優愛の持っている皿を、膝で蹴り上げてやろうかと思った。
でも、それをして怒らせたりしたら、なにをされるか分からない。ついビビってしまい、結局は自重した。

{	Stand("bu優愛_制服_通常左手下","worry", 200, @-150);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_hard", 0, true);}
//◆以下、普通口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800470yu">
「分かってください。わたしが西條くんにこんなことするのは、あなたを救うためでもあるんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800480yu">
「決して、あなたを傷つけるためじゃないんですよ」

//◆以上、普通口調
なにそれ？　優愛ってバカなの？　死ぬの？
何様のつもりだよ。僕を救うだって？

確かに僕はニュージェネ事件や『将軍』に怯えてた。
必死で、誰かに助けを求めてた。

でもその誰かには、優愛は含まれない。
僕は、メンヘラ女の妄想に付き合うつもりはないんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_冷酷","cool", 200, @-150);
	FadeStand("bu優愛_制服_冷酷_cool", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆以下、ヤンデル口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800490yu">
「食べて」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800500yu">
「無理にでも食べて」

フォークに巻き付けた、冷めたパスタ。それを僕の口元に添える。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800510yu">
「食べられますよね？」

優愛自身もさらに顔を寄せてくる。
じっと、僕を凝視したまま。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800520yu">
「食べてください」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800530yu">
「食べて」

//◆以上、ヤンデル口調
そのまま、優愛は動きを止めた。
なんで、この女は、キレると、いちいちこんな近くなるんだ。

僕は目をそらしたまま、口をきつく引き結んだ。

こんな女の作ったものなんて、気持ち悪くて食べられるもんか……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	ClearAll(2000);
	Wait(1000);
}
