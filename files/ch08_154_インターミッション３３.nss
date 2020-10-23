//<continuation number="900">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_154_インターミッション３３";
		$GameContiune = 1;
		Reset();
	}

		ch08_154_インターミッション３３();
}


function ch08_154_インターミッション３３()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($PreGameName!="boot_優愛ルート"){

	$SYSTEM_last_text="第８章";

	if(Platform()!=100){
		Save(9999);
	}

//Ｃｈａｏｓ；Ｈｅａｄ　第８章
//――――――――――――――――
//■第８章【Ir2】
	ChapterIn("dx/mvG.avi");

		Delete("*");

		CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg069_01_1_フリージア社内_a.jpg");
		Fade("背景１", 0, 1000, null, true);

	ChapterIn2();

	CreateSE("SE01","SE_はいけい_ふりーじあ社内_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

	Wait(1000);
}


//１１月４日（火）//日付は表示しない
//■インターミッション３３
//ＢＧ//信用調査会社フリージア・社内//昼
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
百瀬に呼び出されて、判が信用調査会社フリージアに顔を出したのは、約束の時間から３０分ほど遅れたときだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_扉_開ける");
	CreateSE("SE03","SE_日常_扉_閉まる");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);
	Wait(2000);
	MusicStart("SE03", 0, 500, 0, 1000, null, false);
	Wait(1500);
	Stand("st克子_スーツ_通常","angry", 200, @-100);
	FadeStand("st克子_スーツ_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400010mm">
「ちょっとバンちゃん、遅いじゃないの！」

事務所に入るなり、百瀬の怒声が飛んできた。判は首をすくめつつ、愛想笑いを浮かべてフリージア社長のデスクに歩み寄った。

今日は差し入れを持ってきていないのだが、その判断は失敗だったかもしれないと少し後悔した。

{	Stand("st克子_スーツ_通常","normal", 200, @-100);
	FadeStand("st克子_スーツ_通常_normal", 200, true);
	DeleteStand("st克子_スーツ_通常_angry", 300, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400020mm">
「あら、諏訪ちゃんは？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("st克子_スーツ_通常_normal", 300, @-100, @0, Dxl1, true);
	Stand("st安二_スーツ_通常","normal", 200, @200);
	FadeStand("st安二_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【判】
<voice name="判" class="判" src="voice/ch08/15400030bn">
「今日は別行動」

{	Stand("st克子_スーツ_通常","hard", 200, @-200);
	FadeStand("st克子_スーツ_通常_hard", 200, true);
	DeleteStand("st克子_スーツ_通常_normal", 200, false);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400040mm">
「若い子をこき使って、バンちゃんは楽してるわけね」

//◆徹夜でセナやあやせのことを調べていた
//【判】
<voice name="判" class="判" src="voice/ch08/15400050bn">
「……いやいや、俺もちゃんとやってるよ？　昨日だって徹夜でいろいろ調べてたんだぜ」

//【判】
<voice name="判" class="判" src="voice/ch08/15400060bn">
「おかげで最近の女子高生の生態については、かなり詳しくなった」

{	Stand("st克子_スーツ_通常","sigh", 200, @-200);
	FadeStand("st克子_スーツ_通常_sigh", 200, true);
	DeleteStand("st克子_スーツ_通常_hard", 200, false);}
//ため息
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400070mm">
「はあ……あんたねえ……呆れて物も言えないわ」

//【判】
<voice name="判" class="判" src="voice/ch08/15400080bn">
「で、こうして俺を呼びつけたってことは、
　“あの子”と連絡取れたってこと？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603001]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400090mm">
「今来てるわ」

//【判】
<voice name="判" class="判" src="voice/ch08/15400100bn">
「さすがモモちゃん」

{	Stand("st安二_スーツ_通常","pride", 200, @200);
	FadeStand("st安二_スーツ_通常_pride", 200, true);
	DeleteStand("st安二_スーツ_通常_normal", 200, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15400110bn">
「ちなみに、カワイイ子かい？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_衝撃_びんたされる");
	Stand("st克子_スーツ_通常","angry", 200, @-200);
	FadeStand("st克子_スーツ_通常_angry", 200, false);
	DeleteStand("st克子_スーツ_通常_sigh", 200, false);
	SoundPlay("SE03", 0, 1000, false);
	Shake("背景１", 200, 5, 5, 0, 0, 500, null, false);
	Move("st克子_スーツ_通常_angry", 100, @0, @-10, Dxl1, true);
	Move("st克子_スーツ_通常_angry", 100, @0, @10, Axl1, false);
	DeleteStand("st安二_スーツ_通常_pride", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604001]
百瀬はニヤけて鼻の下を伸ばしている判の頭をはたいた。
手首のスナップを利かせたそれはなかなか強烈だ。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400120mm">
「いつまでもバカなこと言ってんじゃないわよ、エロオヤジ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","shock", 200, @200);
	FadeStand("st安二_スーツ_通常_shock", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605001]
//【判】
<voice name="判" class="判" src="voice/ch08/15400130bn">
「じょ、冗談だって」

判には、百瀬に個人的に頼んでいたことがあった。

ニュージェネ事件のとある関係者と個人的に話がしたいから、会えるようセッティングしてくれないか、というものだ。

あくまで個人的な都合であり、ニュージェネ事件の捜査とも今のところ関係ない話をするつもりだった。

なので立場上、捜査本部の刑事たちを出し抜いて、判だけで会いに行くというわけにはいかなかったのだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	DeleteStand("st克子_スーツ_通常_angry", 0, true);
	DeleteStand("st安二_スーツ_通常_shock", 0, true);

	DrawTransition("色１", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
百瀬は判を促して事務所の隅へと向かった。そこには、ファイルでいっぱいの棚で囲まれた、狭い空間があった。

応接室として使われているスペースであり、２人がけのソファがふたつ、無理矢理並べられている。

判が百瀬に続いて入っていくと、ひとりの少女が座っていた。着ている制服は翠明学園のものだ。

うなだれ、肩を落としていて、ひどく憔悴しているように見える。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400140mm">
「ごめんねぇ、お待たせしちゃって」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","shock", 200, @-50);
	FadeStand("st優愛_制服_通常_shock", 100, false);
	MusicStart("SE01", 2000, 300, 0, 1000, null, true);
	Move("st優愛_制服_通常_shock", 50, @0, @5, null, true);
	Move("st優愛_制服_通常_shock", 50, @0, @-5, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
百瀬が声をかけると、少女は驚いたように顔を上げた。眼鏡が少しズレかけ、指で位置を直した。

{	Stand("st優愛_制服_通常","worry", 200, @-50);
	FadeStand("st優愛_制服_通常_worry", 200, true);
	DeleteStand("st優愛_制服_通常_shock", 200, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400150yu">
「あ、いえ。平気……です……」

判を見て、少し怯えた表情をしつつコクリと会釈をする。

判としては傷つく態度だった。彼なりに“怖く見られない態度や格好”を心がけているつもりだ。だがやはり、刑事特有の殺伐として高圧的な雰囲気がにじみ出てしまっていたのだと思い知らされる。

まだまだ修行が足りねえな、と判は心の中で苦笑しつつ、優愛の向かいに腰を落ち着ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","normal", 200, @300);
	FadeStand("st安二_スーツ_通常_normal", 200, false);
	Move("st優愛_制服_通常_worry", 500, @-150, @0, Dxl1, false);
	Move("st安二_スーツ_通常_normal", 500, @-100, @0, Dxl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【判】
<voice name="判" class="判" src="voice/ch08/15400160bn">
「楠優愛さん、だね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400170yu">
「は、はい……」

//◆美愛＝みあ
//【判】
<voice name="判" class="判" src="voice/ch08/15400180bn">
「亡くなった美愛さんの、双子の姉。それで間違いないかな？」

優愛はわずかに顎を引くようにして、うなずきを返してくる。

ニュージェネ第１の事件『集団ダイブ』。
その飛び降りて亡くなった５人の高校生の中に、楠美愛という少女がいた。

{	Stand("st安二_スーツ_通常","pride", 200, @200);
	FadeStand("st安二_スーツ_通常_pride", 200, true);
	DeleteStand("st安二_スーツ_通常_normal", 200, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15400190bn">
「まあ、そんな緊張しなさんな」

//【判】
<voice name="判" class="判" src="voice/ch08/15400200bn">
「君を取り調べようなんて思っちゃねえんだ。雑談程度に思ってよ」

//◆本題＝判は「セナと剣のこと」を聞くために、偶然同級生でニュージェネ事件の関係者である優愛を呼び出した。インターミッション３５で描きます。
//【判】
<voice name="判" class="判" src="voice/ch08/15400210bn">
「本題に入る前に……ちょっと聞いていいかい？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","hard", 200, @200);
	FadeStand("st安二_スーツ_通常_hard", 200, true);
	DeleteStand("st安二_スーツ_通常_pride", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【判】
<voice name="判" class="判" src="voice/ch08/15400220bn">
「優愛ちゃんは、妹さんが亡くなったことについて、どう思う？」

//◆ブレス
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400230yu">
「…………」

//◆小声でたしなめる
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400240mm">
「ちょっとバンちゃん……！」

{	Stand("st安二_スーツ_通常","pride", 200, @200);
	FadeStand("st安二_スーツ_通常_pride", 200, true);
	DeleteStand("st安二_スーツ_通常_hard", 200, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15400250bn">
「いや、悪いね。職業病ってヤツか」

//【判】
<voice name="判" class="判" src="voice/ch08/15400260bn">
「気を遣うような言い方できなくてな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","hard", 200, @200);
	FadeStand("st安二_スーツ_通常_hard", 300, true);
	DeleteStand("st安二_スーツ_通常_pride", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【判】
<voice name="判" class="判" src="voice/ch08/15400270bn">
「ただ、気になってたんだ。捜査本部でも話題になってたんだが、
楠美愛さんの遺族は……奇妙だって」

{	Stand("st克子_スーツ_通常","angry", 200, @200);
	DeleteStand("st安二_スーツ_通常_hard", 300, false);
	FadeStand("st克子_スーツ_通常_angry", 300, false);}
//◆怒る
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400280mm">
「バンちゃん！」

{	Stand("st優愛_制服_通常左手下","hard", 190, @-200);
	FadeStand("st優愛_制服_通常左手下_hard", 300, false);
	DeleteStand("st優愛_制服_通常_worry", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400290yu">
「いえ、いいんです……」

判の無神経な発言に腰を浮かせかけた百瀬を、優愛自身が制した。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400300yu">
「……わたしも、おかしい、って思いますから」

{	Stand("st克子_スーツ_通常","sigh", 200, @200);
	FadeStand("st克子_スーツ_通常_sigh", 300, true);
	DeleteStand("st克子_スーツ_通常_angry", 0, false);}
//◆ため息
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400310mm">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st克子_スーツ_通常_sigh", 400, true);
	Stand("st安二_スーツ_通常","hard", 200, @200);
	FadeStand("st安二_スーツ_通常_hard", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//【判】
<voice name="判" class="判" src="voice/ch08/15400320bn">
「『集団ダイブ』で飛び降りた５人には
自殺する理由なんてなかった……
家族や友人はみんなそう主張している」

//【判】
<voice name="判" class="判" src="voice/ch08/15400330bn">
「だが……美愛さんの家族だけは違った」

{	DeleteStand("st安二_スーツ_通常_hard", 400, true);}
判は、腰のベルトに差していたうちわを取り出し、扇ぎ始めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","hard", 210, @200);
	FadeStand("st安二_スーツ_通常_hard", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【判】
<voice name="判" class="判" src="voice/ch08/15400340bn">
「なにも主張しなかった。あっさり受け入れたって聞いてる。あまりになにも言わなさすぎて、奇妙だったってな」

//【判】
<voice name="判" class="判" src="voice/ch08/15400350bn">
「なんでだい？」

{	Stand("st優愛_制服_通常左手下","sad", 200, @-200);
	FadeStand("st優愛_制服_通常左手下_sad", 300, true);
	DeleteStand("st優愛_制服_通常左手下_hard", 0, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400360yu">
「……お父さんもお母さんも、美愛ちゃんが死んでから……
おかしくなっちゃったんです」

優愛の声には、苦しみがにじんでいた。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400370yu">
「最初は……美愛ちゃんの事件の報せを受けた日は、それでも泣いていたんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400380yu">
「お父さんもお母さんも、とても辛そうでした」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400390yu">
「でも次の日の朝、なぜか２人は……楽しそうに笑っていたんです。美愛ちゃんが死ぬ前とまったく同じに戻ってたんです」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400400yu">
「たった、一日で……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400410yu">
「わたし、訳が分からなくて……っ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400420yu">
「２人は、美愛ちゃんのこと
忘れようとしてるんじゃないかって思って……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400430yu">
「そうしたらお父さんが……笑いながら……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400440yu">
「お前に妹なんていないよって……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400450yu">
「美愛ちゃんが残した洋服とか、靴とかを見せても、全然取り合ってくれないんです……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400460yu">
「それはお前のために予備で買ってあったものだって」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400470yu">
「そうやってお父さんたちは、ニュースからも警察の話からも目を背けて……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400480yu">
「記憶から、美愛ちゃんのことを消し去ろうとしてるんです……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400490mm">
「つまり、双子じゃなかったことに……」

{	Stand("st安二_スーツ_通常","normal", 210, @200);
	FadeStand("st安二_スーツ_通常_normal", 200, true);
	DeleteStand("st安二_スーツ_通常_hard", 200, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15400500bn">
「それで警察にも、ウチは一人っ子だって言って追い返してたわけか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","worry", 200, @-200);
	FadeStand("st優愛_制服_通常左手下_worry", 200, true);
	DeleteStand("st優愛_制服_通常左手下_sad", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400510yu">
「わたしと美愛ちゃんは一卵性で、見た目はうり二つなんですけど……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400520yu">
「あの子は、妹は、親から嫌われていました……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400530yu">
「あの子はいつも自分の気持ちを押し殺して、わたしのことを一番に考えてくれていたんです……」

優愛は話しながら、かつて美愛が生きていた頃の記憶を思い出していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//黒
	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);

	DeleteStand("st優愛_制服_通常左手下_worry", 0, true);
	DeleteStand("st安二_スーツ_通常_normal", 0, true);

	Wait(1000);

	MusicStart("SE01", 2000, 0, 0, 1000, null, false);
	BGMPlay360("CH22", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
それは、まだ小学生の頃。

ある日、親戚が大きなクマのぬいぐるみをひとつだけプレゼントとして持ってきてくれた。

喜ぶ優愛とは対照的に、美愛はぬいぐるみが嫌いだと言って、見向きもしなかった。

親戚も両親もそんな子供らしくない美愛を嫌った。

優愛はそれでも、妹にこっそりと、ぬいぐるみは２人のものとして大切にしようと言ったのだが、美愛は“ぬいぐるみなんていらないからお姉ちゃんにあげる”としか答えなかった。

それから１ヶ月ほどが経って、優愛がそのぬいぐるみに飽きてきた頃、深夜にふと目を覚ました優愛は、ある光景を目撃する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 200, 1000, null, true);

//ＣＧ//深夜にクマのぬいぐるみを抱きしめる美愛
	CreateTexture360("背景２", 1000, 0, 0, "cg/ev/ev076_01_4_美愛くま抱き_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
美愛が、とても幸せそうな顔をしながら、クマのぬいぐるみを抱き、話しかけていたのだ。

優愛は、あれほど嬉しそうな妹の表情を見たのは初めてだった。

ぬいぐるみは嫌いと言った妹の言葉は嘘だったんだと、そのとき初めて優愛は気付いた。

妹は、姉のためにずっと我慢していたのだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 200, 1000, null, true);

//イメージＢＧ//色鉛筆で描いた手書きのクマの絵
	CreateTexture360("背景２", 1000, 0, 0, "cg/bg/bg182_01_3_手描きのクマの絵_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
次の日、優愛は美愛の枕の下から、美愛自身が描いたかわいらしいクマのイラストを見つけた。

美愛は姉が飽きるまで、ぬいぐるみの代わりにそれを抱いて寝ていたのだった。

この１８年間、ずっとそんなことの繰り返しだった。

誕生日のお祝いでは、ケーキのろうそくを吹き消すのはいつも優愛だった。美愛は“そんなバカバカしいことやってられないよ”と言って両親を怒らせた。

優愛は私立の翠明学園に進学したが、美愛はわざと学校で素行不良な態度を取って内申点を下げ、結果的に公立高校へ進んだ。学費の問題で、両親はどちらかひとりにしか私立へ通わせられなかったのだ。

優愛がどれだけ妹に譲ろうとしても、それを制して妹の方が姉を優先させる。しかもわざと嫌われるような態度を取って。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＢＧ//信用調査会社フリージア・社内
	Fade("回想フラッシュ", 200, 1000, null, true);
	Delete("背景２");
	Fade("色１", 0, 1000, null, true);
	Fade("回想フラッシュ", 1500, 0, null, true);
	Stand("st優愛_制服_通常左手下","sad", 200, @-200);
	Stand("st安二_スーツ_通常","hard", 210, @200);
	FadeStand("st優愛_制服_通常左手下_sad", 0, true);
	FadeStand("st安二_スーツ_通常_hard", 0, true);
	Fade("色１", 2000, 0, null, true);
	Delete("回想フラッシュ");
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆泣き
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400540yu">
「わたしは結局……美愛ちゃんの優しさに甘えて……今まで、自分だけいい思いを……してきました……」

//◆泣き
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400550yu">
「美愛ちゃんがいなくなって初めて、もっとあの子のためになにかできることがあったはずだって……すごく……後悔して……」

//◆泣き
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400560yu">
「わたしが、代わりに……死んであげればよかった……」

//◆泣き
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400570yu">
「しかも、挙げ句に……
親に存在そのものを忘れられてしまうなんて……」

//◆泣き
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch08/15400580yu">
「こんなの、あんまりです……。
あんまりにも……悲しいです……ううう……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常左手下_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
そこまで言葉を絞り出すのが限界だった。
優愛は眼鏡を取り、目頭を押さえて泣き崩れる。
百瀬が隣に座り、その背中を優しくさすってあげた。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400590mm">
「それで優愛ちゃんは、ひとりで事件のことを調べていたらしいの」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400600mm">
「美愛ちゃんにいったいなにがあったのか、知るためにね」

//【判】
<voice name="判" class="判" src="voice/ch08/15400610bn">
「そりゃ大変だったろう」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400620mm">
「そして、ひとりの人物を突き止めた」

//【判】
<voice name="判" class="判" src="voice/ch08/15400630bn">
「……？」

百瀬は優愛の肩を抱いたまま、判へと視線をやった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_はいけい_ふりーじあ社内_LOOP");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch08/15400640mm">
「……西條拓巳くんよ」

//【判】
<voice name="判" class="判" src="voice/ch08/15400650bn">
「なるほどね」

{	BGMPlay360("CH*", 2000, 0, false);
	MusicStart("SE01", 2000, 300, 0, 1000, null, true);}
判は顎の無精ひげをさすりつつ、ソファから身を乗り出した。

{	Stand("st安二_スーツ_通常","normal", 210, @200);
	FadeStand("st安二_スーツ_通常_normal", 200, true);
	DeleteStand("st安二_スーツ_通常_hard", 200, false);}
//【判】
<voice name="判" class="判" src="voice/ch08/15400660bn">
「いつだったか西條と追跡劇をしてたっていう女子高生の話を、ショカツの刑事から聞いたんだが」

//【判】
<voice name="判" class="判" src="voice/ch08/15400670bn">
「もしかして優愛ちゃんだったりする？」

優愛は申し訳なさそうにうなずく。

//【判】
<voice name="判" class="判" src="voice/ch08/15400680bn">
「興味あるな。詳しく聞かせてもら――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//判のケータイ着信音
	CreateSE("SE02","SE_日常_けい帯_着信音_判");
	SoundPlay("SE02", 0, 500, true);

	Wait(200);

	Stand("st安二_スーツ_通常","pride", 210, @200);
	FadeStand("st安二_スーツ_通常_pride", 200, true);
	DeleteStand("st安二_スーツ_通常_normal", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【判】
<voice name="判" class="判" src="voice/ch08/15400690bn">
「……おうと思ったけど、ちょっとゴメンよ」

{	DeleteStand("st安二_スーツ_通常_pride", 500, false);}
判は苦笑しつつ、優愛と百瀬に軽く頭を下げる。

彼の言葉を遮ったのは、スーツの内ポケットに入っているケータイだった。

{	SoundPlay("SE02", 1500, 1000, true);}
すぐにケータイを取り出して液晶画面をチェック。諏訪の名が表示されていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//ケータイ受ける
	CreateSE("SE03","SE_日常_けい帯ボタン押す");
	SoundPlay("SE02", 0, 0, false);
	SoundPlay("SE03", 0, 1000, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【判】
<voice name="判" class="判" src="voice/ch08/15400700bn">
「もしもし。どうしたぁ？」

//ＶＦ//電話の声
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400710su">
「先輩！　７番目ッス！」

//【判】
<voice name="判" class="判" src="voice/ch08/15400720bn">
「なんだと？」

諏訪の声は緊迫していた。

彼の背後で他の捜査員たちが慌てふためいている様子までが、電話を通して伝わってくる。

諏訪は捜査本部にいるらしい。

{	SoundPlay("SE01", 1000, 0, false);
	Wait(500);}
//ＶＦ//電話の声
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400730su">
「ニュージェネ第７の事件が起きたんスよ！」

{	BGMPlay360("CH01", 3000, 1000, true);}
//【判】
<voice name="判" class="判" src="voice/ch08/15400740bn">
「……！」

判は目を見開くと、やがて苦々しい表情で唇を噛んだ。
その態度に、百瀬と優愛も事態の深刻さを察し、不安げな表情で判を見守る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//◆ガイシャ＝被害者
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400750su">
「ガイシャは３人。友人同士らしいッス」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400760su">
「……３人とも、胴体から身体が切断されてて」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400770su">
「それぞれの上半身と下半身を別々に入れ替えて、テグス……釣り糸ッスね、それで縫いつけられてたッス」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400780su">
「それと、額にそれぞれ“Ｑ”“Ｄ”“Ｎ”って読める傷が」

//【判】
<voice name="判" class="判" src="voice/ch08/15400790bn">
「……なにかのメッセージか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400800su">
「さあ、そこまでは。それと気になることが」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400810su">
「司法解剖の結果、分かったんスけど」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400820su">
「ガイシャの胴体の切断部は、のこぎりとか包丁とか、そういう刃物で切断されたものじゃないって」

//【判】
<voice name="判" class="判" src="voice/ch08/15400830bn">
「どういう意味だ？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400840su">
「なんか強い力で、“引きちぎられた”そうッス」

//【判】
<voice name="判" class="判" src="voice/ch08/15400850bn">
「引きちぎられた……」

判はうめくように諏訪の言葉を繰り返し、それからうちわの柄の部分でガシガシと頭を掻きむしった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602011]
//【判】
<voice name="判" class="判" src="voice/ch08/15400860bn">
「まるで怪獣だな。あるいは、最近流行りの魔法使いとかな……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400870su">
「あの、先輩、それマジで言ってんスか？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15400880su">
「映画オタクの自分でも、さすがにその意見には同意しかねるッス」

//【判】
<voice name="判" class="判" src="voice/ch08/15400890bn">
「単なる例えだ！　バカが！」

//【判】
<voice name="判" class="判" src="voice/ch08/15400900bn">
「いいからさっさと捜査に戻れ」

{	CreateSE("SE03","SE_日常_けい帯ボタン押す");
	SoundPlay("SE03", 0, 1000, false);}
判はそれだけ告げると、通話を切った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

//■インターミッション３３終了

	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*",2000,0,false);
	ClearAll(2000);
	Wait(2000);


}