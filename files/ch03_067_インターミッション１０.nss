//<continuation number="220">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_067_インターミッション１０";
		$GameContiune = 1;
		Reset();
	}

		ch03_067_インターミッション１０();
}


function ch03_067_インターミッション１０()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション１０
//１０月１８日（土）//日付は表示しない
//ＢＧ//小学校
//拓巳の実家があるのは下北沢としました。小学校も同じく下北沢近辺

	IntermissionIn();

	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",500,0,false);

	ClearAll(0);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg055_01_1_下北沢街並み_a.jpg");
	
	CreateSE("SE01","SE_日常_まる山町");
	MusicStart("SE01", 2000, 700, 0, 1000, null, true);

	IntermissionIn2();

	Wait(2000);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg053_01_1_小学校外観_a.jpg");
	Fade("背景１", 1000, 1000, null, true);
	Delete("背景２");
	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//「北沢第二小学校」は架空の校名です
西條拓巳の母校である北沢第二小学校は、私鉄の駅から歩いて５分ほどの距離にあった。

判安二が、小学校の頃の西條拓巳の担任に話を聞こうと思い電話で連絡したところ、残念ながら亡くなったと言われた。

やむなく、今日学校にいると言う電話の主――教頭の神尾に代わりに話を聞こうと、判は相棒とともに足を運んだのだった。


土曜日ということで校門は閉じており、判と諏訪の２人の刑事はその前に立ち止まって校舎の方へ目を向けた。

校舎の白い外壁に、やけに目を引く色鮮やかな絵が描かれている。

それがなにをイメージしたものなのか、芸術や美術にはさっぱり疎い判には分からなかったが、螺旋のように見えるその絵は上から下へと７つの色に変化しているのを見ると、虹っぽいという印象を抱かせる。

判がうちわを扇ぎながらその絵を眺めている間に、彼の相棒である諏訪が校門横にあるインターホンを押していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
	SoundPlay("SE01", 500, 300, true);
	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 500, 0, 600, 100, Dxl3, "cg/data/lcenter2.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
ふと、判は周囲を見回す。
何者かに見られているような気がした。
やけに粘着質な、不快な視線。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 2000, 700, true);
	Fade("色１", 2000, 0, null, true);
	Stand("bu安二_スーツ_通常","pride", 300, @-150);
	FadeStand("bu安二_スーツ_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【判】
<voice name="判" class="判" src="voice/ch03/06700010bn">
「俺ってそんなにカッコイイか？」

軽くポーズを取ってみた。
ダンディに、渋くキメてみる。

{	Stand("st護_スーツ_通常","sigh", 200, @150);
	Move("st護_スーツ_通常_sigh", 0, @0, @50, null, true);
	FadeStand("st護_スーツ_通常_sigh", 500, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch03/06700020su">
「先輩、なに変なポーズしてるんスか？」

{	Stand("bu安二_スーツ_通常","shock", 300, @-150);
	FadeStand("bu安二_スーツ_通常_shock", 300, true);
	DeleteStand("bu安二_スーツ_通常_pride", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch03/06700030bn">
「…………」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch03/06700040su">
「裏門の方に通用口があるんで、そっちに回ってくれって」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st護_スーツ_通常_sigh", 500, true);
	Wait(1000);
	DeleteStand("bu安二_スーツ_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603001]
判はポーズを解くと、ため息をひとつついて歩き出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Wait(500);

	MusicStart("SE01", 2000, 0, 0, 1000, null, false);

//ＢＧ//職員室
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	Delete("背景１");

	Wait(500);

//■３６０
//	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
//	MusicStart("SE01", 0, 300, 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
職員室の場所はすぐ分かった。

通用口から入ってすぐが校舎の裏側玄関になっていて、そこから通じる廊下を曲がればそこが職員室だった。

校内には当然ながら子供の気配はまったくなく、つるつるしたリノリウムの床が与える錯覚なのか、外よりもひんやりとした空気を２人の刑事に感じさせた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_日常_教室扉_開く");
	SoundPlay("SE05", 0, 1000, false);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg054_01_1_小学校職員室_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	Delete("色１");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
職員室には教師が３人いた。

そのうちのひとりが、入ってきた判たちを見て立ち上がり会釈をする。

白髪の方が多い頭髪を七三分けにして、柔和な笑みを浮かべている彼が、神尾だった。

判と諏訪はほぼ同時に警察手帳を見せ、軽く挨拶してからすぐに本題に入った。
話を聞くのは諏訪の役目だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu護_スーツ_通常","normal", 200, @-250);
	FadeStand("bu護_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch03/06700050su">
「ここの卒業生である西條拓巳くんについて教えていただきたいんでスが」

//【神尾】
<voice name="神尾" class="神尾" src="voice/ch03/06700060jo">
「彼のことは、印象に残っています。私は担任ではなかったから、詳しくとなると無理ですが、それでも構いませんか？」

諏訪はうなずいてから、手帳を開いていつでもメモを取れるようにした。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch03/06700070su">
「西條くんは、どんな子だったんスか？」

//【神尾】
<voice name="神尾" class="神尾" src="voice/ch03/06700080jo">
「難しい子だと聞いていました。特殊だ、と」

{	Stand("bu護_スーツ_通常","sigh", 200, @-250);
	FadeStand("bu護_スーツ_通常_sigh", 300, true);
	DeleteStand("bu護_スーツ_通常_normal", 0, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch03/06700090su">
「特殊？」

//【神尾】
<voice name="神尾" class="神尾" src="voice/ch03/06700100jo">
「本来なら、他の生徒に混ざって勉強するのは
とても困難な、その、病気を患っていたらしく」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch03/06700110su">
「具体的には？」

//【神尾】
<voice name="神尾" class="神尾" src="voice/ch03/06700120jo">
「そこまで私が言ってしまっていいのかどうか……。ご家族なり医師なりに聞いていただけますか」

最近の学校の対応はこのようにどこも同じ、事なかれ主義だった。

保護者などからのクレームが来そうなことは極力しない。おかげで警察の身分としてはとてもやりにくくなった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu安二_スーツ_通常","normal", 220, @250);
	FadeStand("bu安二_スーツ_通常_normal", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【判】
<voice name="判" class="判" src="voice/ch03/06700130bn">
「担任の先生はなんで亡くなったんです？」

//【神尾】
<voice name="神尾" class="神尾" src="voice/ch03/06700140jo">
「事故です。遠足の最中、乗っていたバスが陥没した道路に……」

{	Stand("bu護_スーツ_通常","normal", 200, @-250);
	FadeStand("bu護_スーツ_通常_normal", 300, true);
	DeleteStand("bu護_スーツ_通常_sigh", 0, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch03/06700150su">
「あ、自分それ知ってるッス。ニュースでやってたっスよね」

//【神尾】
<voice name="神尾" class="神尾" src="voice/ch03/06700160jo">
「子供たちはケガをしただけで、幸い命は助かったのですが……」

//【神尾】
<voice name="神尾" class="神尾" src="voice/ch03/06700170jo">
「斎藤先生だけが犠牲になってしまい……なんともやりきれない思いです」

{	Stand("bu安二_スーツ_通常","hard", 220, @250);
	FadeStand("bu安二_スーツ_通常_hard", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch03/06700180bn">
「西條くんもその事故に巻き込まれた？」

判の問いに、神尾は小さく首を振った。

//【神尾】
<voice name="神尾" class="神尾" src="voice/ch03/06700190jo">
「あの子は当日、欠席していてバスには乗っていませんでした」

//【判】
<voice name="判" class="判" src="voice/ch03/06700200bn">
「欠席の理由は？」

//【神尾】
<voice name="神尾" class="神尾" src="voice/ch03/06700210jo">
「病が悪化した、と聞いたような覚えがありますが……」

その事故のことは判の記憶にもわずかに残っていた。

事故後、唯一被害に遭わなかったという男児の家に連日のように群がっていたマスコミたちの姿をテレビでチラッと見たことがある。その男児は結局、一度もマスコミの前に姿を現すことはなかったが。

//【神尾】
<voice name="神尾" class="神尾" src="voice/ch03/06700220jo">
「あれは、悲しい、事故だったんですよ……」

{	Stand("bu護_スーツ_通常","sigh", 200, @-250);
	FadeStand("bu護_スーツ_通常_sigh", 300, true);
	DeleteStand("bu護_スーツ_通常_normal", 0, false);}
神尾はなぜか、“事故”という部分を強調して繰り返した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
//～～Ｆ・Ｏ

//■インターミッション１０終了

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*",2000,0,false);
	ClearAll(2000);
	Wait(3000);
}