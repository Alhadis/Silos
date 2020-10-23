//<continuation number="230">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_036_インターミッション０５";
		$GameContiune = 1;
		Reset();
	}

		ch02_036_インターミッション０５();
}


function ch02_036_インターミッション０５()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション０５

	IntermissionIn();

	ClearAll(0);
	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg095_01_1_警察署大会議室_a.jpg");

	CreateSE("SE02","SE_はいけい_けいさつ署_LOOP");
	MusicStart("SE02", 2000, 500, 0, 1000, null, true);

	IntermissionIn2();

	Wait(1000);

//ＢＧ//渋谷警察署大会議室
//おがみ：ルビ入力「判安二」

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
<RUBY text="ばん">判</RUBY><RUBY text="やすじ">安二</RUBY>が、渋谷警察署の大会議室に入るのは３日ぶりだった。

『円山町張り付け殺人事件』の捜査会議はすでに始まっており、遅刻してきた判に対して一斉に批難する眼差しが注がれた。

//■３６０
判は愛想笑いを浮かべつつ腰を低くし、席に着く。腹を下してトイレに籠もっていた、という遅刻の理由はとても言い出せる雰囲気ではなかった。

//判は愛想笑いを浮かべつつ腰を低くし、上座に並ぶテーブルの端に並ぶ。腹を下してトイレに籠もっていた、という遅刻の理由はとても言い出せる雰囲気ではなかった。

『円山町張り付け殺人事件』捜査本部がこの渋谷署に置かれたのは、事件翌日の早朝。

ただでさえ『コーネリアスタワー集団投身自殺事件』と『渋谷駅ガード下大学生・胎児殺人事件』の方に人手を取られている影響で、

警視庁捜査一課内では窓際族的な扱いになっている判のような三流警部補までが本庁から駆り出されている。

しかもすべてがこの渋谷署の管轄内で起きたので、ひとつの所轄警察署に特別捜査本部が３つもあるという異常事態だった。

おかげで、渋谷署の大会議室はその３つの捜査本部が日替わりで使っているという困った状況だ。

マスコミが『ニュージェネ』とはやし立ててることもあり、人手不足の解消も含めて、やがて３つが統合して『ニュージェネ事件捜査本部』とかになるかもしれないとの噂もあった。

だとしたらギャグだ、アホらしい、と刑事たち誰もが思っている。

//◆判に対して呼びかけている
//松永＝警視庁刑事部捜査一課警部。判の上司。捜査本部の責任者的ポジション。
//【松永】
<voice name="松永" class="松永" src="voice/ch02/03600010mn">
「警部補、君の報告を」

判の上司で、この捜査本部の責任者的ポジションにいる松永警部が、鋭い視線とともに判へ呼びかけた。

だが判はそれに気付かず、うちわで顔を扇いで一息ついてしまっていた。

//【松永】
<voice name="松永" class="松永" src="voice/ch02/03600020mn">
「警部補。判警部補。聞いているのか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(500,200);//――――――――――――――――――――――――――――――

	Stand("bu護_スーツ_通常","sigh", 200, @300);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//ＣＨ//諏訪
//◆小声
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600030su">
「呼ばれてるッスよ……！　判さんの報告待ちなんスから……！　ちょっと！」

隣から相棒である新人の<RUBY text="す">諏</RUBY><RUBY text="わ">訪</RUBY>に耳打ちされ、判はようやく自分が呼ばれていることに気付いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu安二_スーツ_通常","normal", 200, @-300);
	FadeStand("bu安二_スーツ_通常_normal", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【判】
<voice name="判" class="判" src="voice/ch02/03600040bn">
「ああ、すんません。報告は諏訪から」

//◆小声
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600050su">
「じ、自分ッスか……」

{	Stand("bu安二_スーツ_通常","shock", 200, @-300);
	FadeStand("bu安二_スーツ_通常_shock", 300, true);
	DeleteStand("bu安二_スーツ_通常_normal", 0, true);}
//【判】
<voice name="判" class="判" src="voice/ch02/03600060bn">
「俺がいなくても報告しとけって言っといたろうが」

//【判】
<voice name="判" class="判" src="voice/ch02/03600070bn">
「早くしろ」

{	DeleteStand("bu安二_スーツ_通常_shock", 500, true);}
先輩警部補から肘を小突かれた諏訪は一瞬ため息をついた後、姿勢良く立ち上がった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu護_スーツ_通常_sigh", 300, true);
	Wait(500);

	CreateSE("SE03","SE_じん体_動作_席を立つ_勢いよく");
	SoundPlay("SE03", 0, 500, false);

	Stand("st護_スーツ_通常","hard", 120, @+220);
	FadeStand("st護_スーツ_通常_hard", 500, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600080su">
「犯行現場近くの監視カメラの解析がようやく出たッス……出ました。犯行時間に、不審な人物が映ってました」

{	CreateSE("SE03","SE_はいけい_けいさつ署_LOOP");
	MusicStart("SE03", 200, 1000, 0, 1000, null, true);
	Wait(500);}
会議室内がざわめく。
弛緩していた空気が一変した。

{	MusicStart("SE03", 2000, 0, 0, 1000, null, false);}
//■３６０
所轄の刑事たちが、諏訪の報告を聞き逃すまいと必死にメモを取り始める。

//判たち本庁組と正対するように下座に並べられたテーブルに座っている渋谷署の刑事たちが、諏訪の報告を聞き逃すまいと必死にメモを取り始める。
彼らにしてみれば必死だった。

なにしろ管轄内で１ヶ月のうちにふたつも凶悪殺人事件――集団自殺事件はまだ殺人事件とは認定されていない――が起きれば、面子に賭けても犯人を見つけ出すという覚悟が強く出るのは当然だった。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600090su">
「プロジェクターに映像出します」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

//イメージＢＧ//監視カメラの映像

	CreateColor("色１", 300, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 300, 1000, null, true);
	DeleteStand("st護_スーツ_通常_hard", 0, true);
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg119_01_3_監視カメラ映像_a.jpg");
	Request("背景２", Smoothing);
//	SetTone("背景２", Monochrome);
	Zoom("背景２", 0, 1500, 1500, null, true);
//	Move("背景２", 0, @-100, @0, null, true);
	Move("背景２", 0, @-200, @0, null, true);
	Fade("背景２", 0, 1000, null, true);
	Wait(500);

	CreateColor("色２", 150, 0, 0, 1280, 720, "Black");
	DrawTransition("色２", 0, 0, 500, 200, null, "cg/data/ランダム.png", true);
	Request("色２", MulRender);
	Fade("色２", 0, 300, null, true);
	Fade("色１", 300, 300, null, false);

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
判があらかじめ指示しておいた通り、諏訪はプロジェクターの映像をスクリーンに投影させた。

//おがみ：シナリオ修正　1223
//画面に、円山町の狭くて汚らしい路地裏のモノクロ映像が映し出される。
画面に、円山町の狭くて汚らしい路地裏が映し出される。
夜で、しかも街灯があまりないせいで、ほとんどなにも見えない。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600100su">
「犯行現場から約５０メートル離れたところにあるコインパーキングの監視カメラです」

コインパーキングはたった二台分の、狭い駐車場だった。ビルとビルの隙間の猫の額のような土地に、申し訳なさそうに作られていた。

この映像からは犯行現場は見えない。現場の前の道すら見えていなかった。

映っているのは、現場から一本逸れたところにある道だ。
ちなみに映像に音声はない。

画面右下にはご丁寧に録画時間が表示されてる。
その時間は、２１時３４分を示していた。

//※たった３０分しか釘を打ち付ける音がしていない＝伏線
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600110su">
「犯行現場近隣の住民の証言により、２１時過ぎから２１時半頃まで、釘を打ち付ける音がしていたというのはご承知の通りだと思いますが」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600120su">
「この映像は２１時３４分、つまりまさに犯行時間直後ということになります」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600130su">
「不審人物が映っているのは、２１時３４分５３秒からおよそ６秒間です。駐車場の前の道を、奥から手前へと走り抜けていきます」

{	Fade("色１", 100, 1000, null, false);
	DrawTransition("色２", 100, 500, 1000, 200, null, "cg/data/ランダム.png", true);
//	Move("背景２", 0, @300, @0, null, true);
	Move("背景２", 0, @440, @0, null, true);
	Wait(100);
	Fade("色１", 100, 300, null, false);
	DrawTransition("色２", 100, 1000, 500, 100, null, "cg/data/ランダム.png", true);}
諏訪が説明した直後、映像の中に人影が現れた。かなり慌てた様子で、画面奥から手前側へと走り抜けていった。

解像度が粗いせいか、パッと見ただけでは男か女かの判別も付かない。
だがその点は、判がすでに科学捜査研究所に頼んで解析済みだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 300, 1000, null, true);
	Delete("色２");
	Delete("背景２");
	CreateTexture360("背景１", 200, 0, 0, "cg/bg/bg095_01_1_警察署大会議室_a.jpg");
	Fade("色１", 500, 0, null, true);
	Delete("色１");

	Stand("st護_スーツ_通常","hard", 250, @+220);
	FadeStand("st護_スーツ_通常_hard", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600140su">
「科捜研で解析した結果、映っている人物は男、年齢は１０代後半から２０代とのことッス……で、です」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600150su">
「人相の判別までは無理でした。服装がかなり特徴的ですが、これは松濤にある私立翠明学園の男子制服と分かりました」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600160su">
「それと、右手に注目してもらいたいんですが――」

画像が、不審人物の右手を拡大したものに変わる。
右手は、なにかを握りしめているように見えた。

{	Stand("st安二_スーツ_通常","normal", 250, @-220);
	FadeStand("st安二_スーツ_通常_normal", 200, false);}
//【判】
<voice name="判" class="判" src="voice/ch02/03600170bn">
「スローで再生すると分かるが、走りながら腕を振っている際、この
“握りしめているなにか”が駐車場の照明に反射して光を放ってるんだな、これが」

{	Stand("st護_スーツ_通常","sigh", 200, @220);
	FadeStand("st護_スーツ_通常_sigh", 200, true);
	DeleteStand("st護_スーツ_通常_hard", 500, true);}
おいしいところだけ、判が諏訪の説明を引き継いだ。

//【判】
<voice name="判" class="判" src="voice/ch02/03600180bn">
「形状からして……犯行に使われた十字架型の杭である可能性がある」

{	CreateSE("SE03","SE_はいけい_けいさつ署_LOOP");
	MusicStart("SE03", 0, 1000, 0, 1000, null, true);}
またも刑事達の中からザワと声が上がる。

もしかすると張り付け殺人の犯人は高校生かもしれない……それはちょっとした衝撃だった。

『ニュージェネレーションの狂気』というマスコミの煽り文句が現実になるかもしれないのだ。

{	MusicStart("SE03", 2000, 0, 0, 1000, null, false);}
//【松永】
<voice name="松永" class="松永" src="voice/ch02/03600190mn">
「最も犯人に近い人物が、この少年だということか」

{	Stand("st安二_スーツ_通常","pride", 250, @-220);
	FadeStand("st安二_スーツ_通常_pride", 200, false);
	DeleteStand("st安二_スーツ_通常_normal", 200, true);}
//【判】
<voice name="判" class="判" src="voice/ch02/03600200bn">
「そういうことになりますね」

判は顎の無精ひげを撫でた。
それは判の癖で、犯人を一歩追い詰めたと実感したとき、
決まってそのジョリジョリとした感触を確かめて悦に入るのだ。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600210su">
「以上です」

{	DeleteStand("st護_スーツ_通常_sigh", 500, true);}
諏訪はため息をついて腰を下ろす。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st安二_スーツ_通常_pride", 500, true);

	Wait(1000);

	Stand("bu護_スーツ_通常","sigh", 200, @300);
	FadeStand("bu護_スーツ_通常_sigh", 400, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆小声
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch02/03600220su">
「ひどいッスよ、先輩。おいしいところ持ってって」

諏訪の愚痴を無視して、判は改めてプロジェクターに映し出された男子高校生の姿を目に焼き付けた。

//◆小声
//【判】
{	Stand("bu安二_スーツ_通常","normal", 300, @-300);
	FadeStand("bu安二_スーツ_通常_normal", 500, true);}
<voice name="判" class="判" src="voice/ch02/03600230bn">
「ようやくシッポを出したんだ。
そいつをつかんで離さねえようにしないとな……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE*", 2000, 0, 0, 1000, null, true);
	SetVolume360("CH*", 2000, 0, null);

	ClearAll(2000);
	Wait(2000);
//～～Ｆ・Ｏ

//■インターミッション０５終了


}
