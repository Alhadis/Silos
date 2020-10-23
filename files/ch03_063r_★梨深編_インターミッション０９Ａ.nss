//<continuation number="150">

chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_063r_★梨深編_インターミッション０９Ａ";
		$GameContiune = 1;
		$梨深ルート=true;
		$RouteON=true;
		Reset();
	}

	ch03_063r_★梨深編_インターミッション０９Ａ();
}


function ch03_063r_★梨深編_インターミッション０９Ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梨深編
//２周目梨深編追加インターミッション０９Ａ

//梨深編突入フラグが立っている場合、“ch03_063_１０月１７日金”終了後にアイキャッチを入れて、以下を挿入

//※※３６０以下
//アイキャッチ
//■インターミッション０９Ａ

//■アイキャッチIN
	IntermissionIn();

	DeleteAll();

//ＢＧ//学校廊下
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Fade("back01", 0, 1000, null, true);

	IntermissionIn2();

	CreateSE("SE10","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE10", 500, 350, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
咲畑梨深は、無表情のまま、歩を進めていた。

翠明学園校舎、その２年生の教室が並ぶ廊下。
着慣れない制服。初めての場所。

登校してきた他の生徒たちには一切、目もくれない。

実はかなり緊張していたが、それが態度に出ないよう必死で冷静さを装っていた。どこかギクシャクした歩き方で、けれど視線はまっすぐに前を向き、ひとつの教室を目指す。

立ち止まったのは、２年Ｃ組。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00400010ri">
「……ここかぁ」

彼女はすでに知っていた。

そのクラスに、西條拓巳が所属していることを――

閉まっているドアに手をかける。
そこで初めて、自分の指先が震えていることに気付いた。

――普通に、ここに通いたかったな。

そんな願望が頭をよぎったが、それ以上の妄想はしなかった。
一度、小さく息をつき、勢いよくドアを開けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//教室のドア開ける
	CreateSE("SE01","SE_日常_教室扉_開く");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
//ＢＧ//学校教室
	CreateTexture360("back02", 100, center, middle, "cg/bg/bg017_01_0_教室_a.jpg");
	Fade("back02", 0, 0, null, true);
	Fade("back02", 1000, 1000, null, true);


	Delete("back01");

	Stand("bu梨深_制服_通常ビシッ！","smile", 500, @+200);
	FadeStand("bu梨深_制服_通常ビシッ！_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00400020ri">
「みんな、おっはよー！」

ついさっきまでの無表情が、ウソのように。
周囲が驚くほどの大声で、元気よく。
右手を額に添え、敬礼のようなポーズを決めて。

梨深は、教室の中に向かって挨拶をした。

教室は――

{	SetVolume("SE10", 100, 0, null);}
シンと、静まり返った。
始業前の教室には、すでに半分ほどの生徒たちがやってきていた。その全員が、梨深の方を見て、怪訝な顔をしている。

それも当然だ。

このクラスで、いや、この学校で、梨深のことを知っている人間など、誰１人として存在しないのだから。

それゆえに、梨深には、最初に全員からの注目を浴びなければならない理由があった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE10","SE_日常_がっ校_教室_LOOP");

//ＳＥ//ディソードを出す
	CreateSE("SE02","SE_擬音_ディそーど出現.ogg");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);

	Fade("フラッシュ", 200, 1000, null, true);
	DeleteStand("bu梨深_制服_通常ビシッ！_smile", 0, true);
	CreateColor("透過度", 150, 0, 0, 1280, 720, "White");
	Fade("透過度", 0, 600, null, true);
	CreateTexture360("リミ剣", 200, center, middle, "cg/bg/bg240_01_6_chnディソード全体_梨深_a.png");

	FadeDelete("フラッシュ", 200, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
手に、ディソード。
けれど誰もなんの反応もしない。

硬質な羽を思わせるその剣はまだ妄想の段階であり、誰にも見えてはいない。

今は、それでじゅうぶんだった。

――妄想する。

想いは、梨深に向けられているいくつもの瞳へと放たれる。
まるで示し合わせたかのように、全員が目をしばたたかせた。

そして――

梨深の元気すぎる挨拶によって凍り付いていた教室の空気が、ふと弛緩した。
改めて、梨深は笑顔を浮かべ、室内を見回す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	FadeDelete("透過度", 1000, false);
	FadeDelete("リミ剣", 1000, false);
	MusicStart("SE10", 1000, 500, 0, 1000, null, true);

	Stand("bu梨深_制服_通常","normal", 500, @+200);
	FadeStand("bu梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00400030ri">
「おはよう」

//【女子Ｄ】
<voice name="女子Ｄ" class="女子Ｄ" src="voice/chn01/00400040wd">
「おはよー、咲畑」

//【男子Ｄ】
<voice name="男子Ｄ" class="男子Ｄ" src="voice/chn01/00400050dd">
「おーっす」

//【女子Ｅ】
<voice name="女子Ｅ" class="女子Ｅ" src="voice/chn01/00400060we">
「梨深、朝っぱらから声大きすぎ」

//【男子Ｅ】
<voice name="男子Ｅ" class="男子Ｅ" src="voice/chn01/00400070de">
「もっと静かに入ってこいよなー」

まるで最初から知り合いだったかのように、次々と梨深に声をかけてくる生徒たち。

つい数秒前まで、梨深のことなど知らなかった彼ら。

だが今は違う。

梨深の妄想が彼らに送り込まれ。
周囲共通認識が生まれた。

“咲畑梨深は翠明学園２年Ｃ組のクラスメイトである”という認識が。

２日前、西條拓巳――タク――に試してみて、いまいち効きが弱かったから、梨深としてはうまくいくかどうか、少し不安だった。

だがどうやらその不安は杞憂だったらしい。次々に声をかけてくる“クラスメイト”たちの笑顔を見て、ほっと安堵の息をついた。

{	DeleteStand("bu梨深_制服_通常_normal", 500, true);}
ディソードを消し、教室の最後列にある、誰も座っていない机に向かう。
その机も、たった今、妄想から作り出したもの。

梨深はそこにカバンを置きつつ、すぐには座らず、歩み寄ってきた１人の男子生徒へと向き直った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//キャラ表示//三住
	Stand("bu大輔_制服_通常","normal", 400, @+320);
	FadeStand("bu大輔_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【三住】
<voice name="三住" class="三住" src="voice/chn01/00400080mi">
「よ、梨深」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_通常","normal", 500, @-320);
	FadeStand("bu梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00400090ri">
「よ、みすみだいすけ。ミスミダイスケ。三住大輔」

梨深は、３回、確かめるようにその名を口にした。

{	Stand("bu大輔_制服_通常","sigh", 400, @+320);
	FadeStand("bu大輔_制服_通常_sigh", 300, false);
	DeleteStand("bu大輔_制服_通常_normal", 300, true);}
//【三住】
<voice name="三住" class="三住" src="voice/chn01/00400100mi">
「なんで３回言った？　しかもフルネーム」

{	Stand("bu梨深_制服_通常","smile", 500, @-320);
	FadeStand("bu梨深_制服_通常_smile", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00400110ri">
「たはは。そういう気分だったからだよ。ええと……大ちん」

三住は、タクの友人だ。
端正な顔立ち、小ぎれいな身なり。

彼がどういう経緯でタクと友人になったのかまでは、梨深は知らなかった。

あるいは“タクミ”の妄想によって繋ぎ止められているだけの、虚構の人間関係かもしれない。

あるいは、三住は本当になんの干渉も受けずに、純粋にタクと友達になったのかもしれない。

どちらでもよかった。

重要なのは、彼がタクの友人であると言うこと。
そしてすでに、梨深の“妄想”は、彼に新たな記憶を植え付けていた。

{	Stand("bu梨深_制服_通常","normal", 500, @-320);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00400120ri">
「タクは？」

{	Stand("bu大輔_制服_通常","normal", 400, @+320);
	FadeStand("bu大輔_制服_通常_normal", 300, false);
	DeleteStand("bu大輔_制服_通常_sigh", 300, true);}
//【三住】
<voice name="三住" class="三住" src="voice/chn01/00400130mi">
「まだ来てねぇな。っていうか今日はあいつ、来る日か？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00400140ri">
「たぶんね」

{	Stand("bu大輔_制服_通常","pride", 400, @+320);
	FadeStand("bu大輔_制服_通常_pride", 300, false);
	DeleteStand("bu大輔_制服_通常_normal", 300, true);}
//【三住】
<voice name="三住" class="三住" src="voice/chn01/00400150mi">
「さすが、タクの保護者だな。あいつのスケジュールをちゃんと把握してるなんてよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_pride", 500, true);

	DeleteStand("bu梨深_制服_通常_normal", 300, true);
	Stand("bu梨深_制服_右向き","hurry", 500, @-30);
	FadeStand("bu梨深_制服_右向き_hurry", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
梨深はたまらず苦笑した。

それは罪悪感から来るものだった。
人の記憶を、妄想によって変えさせる。
変えたという事実は、梨深以外、誰も知らない。

{	Stand("bu梨深_制服_右向き","worry", 500, @-30);
	FadeStand("bu梨深_制服_右向き_worry", 300, false);
	DeleteStand("bu梨深_制服_右向き_hurry", 300, true);}
みんなが親しげに接してきてくれる。
だがそれは所詮、偽りの関係。

孤独には慣れているはずだった。
けれどこの教室に身を置くことで、梨深はこれまでに感じたことのない寂しさを味わっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_右向き_worry", 500, true);

	SetVolume("SE*", 2000, 0, null);

	ClearAll(2000);
	Wait(1000);


//～～Ｆ・Ｏ

//アイキャッチ
//※拓巳視点に戻る
//※※３６０以上

//この後、“ch03_064_折原梢”へ

}
