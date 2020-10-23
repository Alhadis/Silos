//<continuation number="300">

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_154_優愛編_インターミッションＹ１Ｂ";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_154_優愛編_インターミッションＹ１Ｂ();
}


function chy_154_優愛編_インターミッションＹ１Ｂ()
{

//※以下、優愛編オリジナル展開になります
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//ＢＧ//渋谷駅南口//夜
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg023_01_3_渋谷駅南口_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	CreateSE("SE3601","SE_はいけい_しぶ谷えき_LOOP");
	MusicStart("SE3601",2000,500,0,1000,null,true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text101]
優愛が、判や百瀬との話を終えてフリージアを出たときには、空はすっかり闇に包まれていた。

判と百瀬には、これまで優愛が調べてきた西條拓巳に関する疑惑を、すべて洗いざらい話した。

刑事と、調査会社の社長。その２人に優愛の考えを認めてもらえば、警察も西條拓巳逮捕に動いてくれるかもしれない――そんな期待があった。

西條拓巳は逮捕されるべきだ。彼の苦しみは理解できているつもりなのでできれば自首してほしかったが、本人が拒絶する以上、警察に動いてもらうしかない。それが優愛の考え。

しかし意外にも、判刑事は“西條拓巳は容疑者から外された”と言った。
優愛にとってそれは信じられないことだったし、認めたくないことだった。

なぜ自分の推察を否定するのか。西條拓巳がニュージェネ事件の犯人なのは明らかなのに。

唇を噛みながら、優愛は足早に駅へと急いだ。

早く帰って、さらに詳しく事件について調べ、決定的な証拠を手に入れるんだ。

それを判刑事に突きつけて、自分が正しいって証明するんだ――

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500010su">
「あっれ～？　楠さんのところのお嬢さんじゃないッスか！」

不意に声をかけられて、優愛はビクッと身を震わせ、立ち止まった。

――最近の渋谷は物騒だから、夜に女子１人で出歩かないように。

学校のホームルームで担任がそう言ってたことを思い出し、優愛は身を固くした。

声をかけてきたのは、人懐っこそうな、若い男だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_足_歩く");
	MusicStart("SE01",0,1000,0,1000,null,false);

	Wait(1000);

	Stand("st護_スーツ_通常","normal", 200, @-150);
	FadeStand("st護_スーツ_通常_normal", 300, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text102]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500020su">
「確か、優愛ちゃんッスよね」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500030yu">
「あの……？」

この男に、どこかで見覚えはある。だが優愛はとっさに思い出せなかった。

{	Stand("st護_スーツ_通常","sigh", 200, @-150);
	FadeStand("st護_スーツ_通常_sigh", 300, true);
	DeleteStand("st護_スーツ_通常_normal", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500040su">
「うわ、覚えてないッスか。自分、諏訪護って言いまス。ほら、こういう者ッスよ」

男は、懐から優愛にだけ見えるように警察手帳をかざし、すぐにしまった。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500050su">
「『集団ダイブ』の後、一度楠さんのお宅にうかがったこと、ありまスよ。その時に、優愛ちゃんともいろいろお話したんスけどねえ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500060yu">
「す、すいません。思い出しました。その節は、どうも……」

優愛はペコリと頭を下げた。

当時は事件直後でひどく動揺していて、諏訪の顔も実はよく覚えていない。

ただ、あの時刑事に話相手になってもらったおかげで、優愛は妹の死の不可解さについて整理することができた。そういう点ではこの刑事に感謝していた。

{	Stand("st護_スーツ_通常","normal", 200, @-150);
	FadeStand("st護_スーツ_通常_normal", 300, true);
	DeleteStand("st護_スーツ_通常_sigh", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500070su">
「さっきまで、判刑事と一緒だったんじゃないッスか？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500080yu">
「え？　判さんと、お知り合いなんですか？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500090su">
「そりゃ、同じ警視庁捜査一課ッスから。自分の先輩ッスよ、いつも怒られてまス」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500100su">
「よっぽど若い女の子と話せるのが嬉しかったんスねえ」

{	Stand("st護_スーツ_通常","hard", 200, @-150);
	FadeStand("st護_スーツ_通常_hard", 300, true);
	DeleteStand("st護_スーツ_通常_normal", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500101su">
「ここだけの話ッスけど、今日、優愛ちゃんと会うって自分に教えてくれたときの先輩、鼻の下伸ばしちゃって、どう見てもスケベオヤジって感じだったッス」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500110yu">
「あはは……」

{	Stand("st護_スーツ_通常","normal", 200, @-150);
	FadeStand("st護_スーツ_通常_normal", 300, true);
	DeleteStand("st護_スーツ_通常_hard", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500120su">
「できれば自分も同席したかったんスけど、捜査から抜け出せなくて」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500130su">
「そうそう、優愛ちゃんのご両親には連絡行ってるんスかねえ。たぶん行ってると思うんスけど。ん～、どうかな～」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500140yu">
「連絡、と言いますと……？」

{	Stand("st護_スーツ_通常","hard", 200, @-150);
	FadeStand("st護_スーツ_通常_hard", 300, true);
	DeleteStand("st護_スーツ_通常_normal", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500150su">
「ああ、いや、『集団ダイブ』のね、犯人が使ったと思われる遺留品が見つかったんスよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text103]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500160yu">
「え……、ほ、本当ですか！？」

優愛には、そんな話は初耳だった。
ついつい、諏訪に詰め寄ってしまう。

{	Stand("st護_スーツ_通常","normal", 200, @-150);
	FadeStand("st護_スーツ_通常_normal", 300, true);
	DeleteStand("st護_スーツ_通常_hard", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500170su">
「ええ。どんなものだと思うッスか？　まあ、最近別の事件でマスコミが散々取り上げてるんで、有名だと思うんスけど。なんと、ダーススパイダーのヘルメットッス！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500180yu">
「それを……『集団ダイブ』の犯人も、かぶっていたんですか？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500190su">
「そう。ネットに事件の様子を撮影したビデオが流出したッスよね？　あれを解析した結果、分かったんスよ～」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500200su">
「それにしても、ダーススパイダーと言えば、例の渋谷エスパー騒動の少年が有名ッスよね。西條拓巳くん、でしたっけ？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500210su">
「なんで彼が、『集団ダイブ』の犯人と同じように、ダーススパイダーのヘルメット、持ってたんスかねえ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 200, 1000, Axl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text104]
//◆ハッとしてブレス
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500210yu">
「…………っ」

その言葉を聞いた瞬間、優愛の中でどす黒い感情が一気に溢れ出した。

確信めいた思い。

ついさっき、判たちに否定されていただけに、余計にその情報が自分の推察を完璧にするための、残された最後のピースだという気がした。

{	FadeDelete("Black", 500, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500220su">
「さてと、それじゃ自分、フリージアに行くんで。この辺で失礼しまッス」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//おがみ：立ち絵：ここでは極悪顔見せないほうがいいかも
//	Stand("st護_スーツ_通常","cool", 200, @-150);
//	FadeStand("st護_スーツ_通常_cool", 300, true);
	DeleteStand("st護_スーツ_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text105]
//◆悪っぽい笑い
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn03/00500230su">
「フ……」

//	DeleteStand("st護_スーツ_通常_cool", 500, true);
諏訪は言うだけ言って、手をヒラヒラと振りながら去っていった。
１人残された優愛は、その場でうなだれ、立ち尽くす。

//◆以下、優愛の口調はヤンデレバージョン
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500240yu">
「彼だわ……」

ポツリと、誰にともなく小声でつぶやいていた。

//◆以下、優愛の口調はヤンデレバージョン
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500250yu">
「彼なのよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500260yu">
「やっぱり彼だった」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500270yu">
「彼しかいない」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500280yu">
「彼に間違いない」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500290yu">
「彼が、妹を、殺したのよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00500300yu">
「彼が、美愛を、殺したのよ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

//■インターミッションＹ１終了


//アイキャッチ
//※拓巳視点に戻る
	SetVolume("SE3601", 2000, 0, null);
	SetVolume360("CH*", 2000, 0, NULL);
	ClearAll(2000);
	Wait(1000);
}
