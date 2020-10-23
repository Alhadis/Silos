//<continuation number="770">

chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "chs_163_セナ編_チートコード";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_163_セナ編_チートコード();
}


function chs_163_セナ編_チートコード()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編
//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
渋谷駅の地下には、半蔵門線と、新しくできた副都心線の駅があって、複雑な構造になっている。ちなみに銀座線ホームは地下鉄なのに地上２階にあったりする。

案内図に描かれているのは、どう見てもダンジョンだ。

しかも地震の影響で、地下へ通じるすべての階段は崩落し、埋もれてしまっていた。

それはセナがディソードで吹っ飛ばして通れるようにしたから
問題なかったけど、照明のない暗い地下構内で、目当ての
コインロッカーを見つけ出すのにかなりの時間を要してしまった。

しかも空調設備も止まっていて空気がとても悪く、粉塵がたくさん舞っていた。

咳が止まらなくて、死にそうになった。あちこちに死体が転がっていて、腐臭もすごいし。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE3601","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE3601",3000,300,0,1000,null,true);


//ＢＧ//渋谷駅地下・コインロッカー付近
//副都心線近くのコインロッカーです。地下も瓦礫だらけで崩落寸前
	CreateTexture360("ロッカー１", 100, 0, 0, "cg/bg/bg213_01_6_chn渋谷駅コインロッカー_a.jpg");
	FadeDelete("Black", 1000. true);

	Wait(1500);

	Stand("stセナ_制服_横向剣持ち","normal_r", 200, @-150);
	FadeStand("stセナ_制服_横向剣持ち_normal_r", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700010sn">
「……これか」

ようやく見つけたコインロッカーは、特に倒れたりすることもなくそこに鎮座していた。

しかも、なぜかこのロッカーだけ電気が来ているらしく、ＩＣカードの読み取り画面が明るく光っている。

“ご利用になるボタンを押してください”とあって、
“取り出し”と“預け入れ”のふたつのボタンが表示されている。

{	Stand("stセナ_制服_通常","hard", 200, @-150);
	DeleteStand("stセナ_制服_横向剣持ち_normal_r", 300, false);
	FadeStand("stセナ_制服_通常_hard", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700020sn">
「本当に、こんななんの変哲もないロッカーに、チートコードが置いてあるのか……？」

{	DeleteStand("stセナ_制服_通常_hard", 500, true);}
このロッカーは地震が起きる前からここに設置されていた。
たくさんの地下鉄利用客が、この前を通り過ぎていったはず。

普段は誰も気にとめることすらない。

そもそも、駅にあるこういうロッカーを、果たしてどれだけの人間が利用しているだろう。
そんなにたくさんいるものなのかな？

よく観察すれば、ほぼすべてのロッカーが埋まっていたりする。

その中のひとつが開かずの扉で、
中にとんでもないものが入っている――

そんな都市伝説は、何十年も前から存在した。

別に不思議でもなんでもない。
有り得そうなこと。

日常のすぐ隣にありながら、非日常の空間となり得る、小さな容れ物。

画面の“取り出し”ボタンに触れてみると、“カードをタッチしてください”という表示に変わった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","normal", 200, @-150);
	FadeStand("stセナ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700030sn">
「箱の中に残っているのは、希望か、あるいは絶望か――」

{	DeleteStand("stセナ_制服_通常_normal", 500, true);}
セナが、ポケットからＩＣカードを取り出し、ゆっくりと画面に近づける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//電子音「ピピッ」
//ＳＥ//ロッカーのロックが外れる音
	CreateSE("SE01","SE_き械_ろっかー_でんし音");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE01", null);

	CreateSE("SE02","SE_き械_ろっかー_ろっく解除");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
電子音と同時に、ロッカーのひとつから、鍵が外れる音がした。
静まり返っているこの地下構内で、その音は異様に大きく響いた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700040sn">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700050ta">
「…………」

僕もセナも、その場で立ち尽くし、つい、周囲を見回す。

いよいよ、チートコードとご対面だ。
いったいどんな形をしているのかは、誰も知らない。

キモいのとか、グロいのとか、そういうのはぜひ勘弁してほしい。
個人的には、ええと、星来たんフィギュアなんかだと最高だね。

セナが、額の汗をそっと拭った。

//◆「１００９番」＝「せんきゅうばん」と読んでください
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700060sn">
「１００９番、だったな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//１００９番ロッカー（扉閉じている）
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);


	CreateTexture360("ロッカー２", 100, 0, 0, "cg/bg/bg214_01_6_chn渋谷駅ロッカー閉じ_a.jpg");

//	DeleteStand("stセナ_制服_通常_normal", 0, true);
	Delete("ロッカー１");

	FadeDelete("Black", 500, true);
	Wait(1000);
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
該当するロッカーは、左から２番目、下から３番目の位置にあった。
扉に大きく、番号が描かれている。

１００９番ロッカーは、わずかに扉が開いていた。
その隙間からでは、中は暗くてうかがい知ることができない。

僕とセナは、ロッカーの扉を見つめたまま、しばらく硬直した。

――お前が、扉を開けろ。

セナから、無言でそう促されているような気がした。
僕もセナに“君が開けてよ”と沈黙のプレッシャーを与えていたから、お互いさまだけど。

じゃんけんで決めようかとも思ったけど、そんな呑気なことをしていられる状況じゃない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700070ta">
「セ、セナが――」

開けるべきだ、と提案しようとしたら、それを遮るようにして――

//	DeleteStand("stセナ_制服_通常_normal", 300, true);
//	Stand("stセナ_制服_武器構え","hard", 300, @+250);
//	FadeStand("stセナ_制服_武器構え_hard", 300, true);
{	CreateSE("SE03","SE_擬音_ちを蹴る");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700080sn">
「開けろ、西條」

セナが一歩、後ずさって、剣を構えた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700090sn">
「もしもの場合は、私が援護する」

も、もしもの場合ってなんだよっ！

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700100sn">
「急げ」

今にも、剣の切っ先を僕の背中に突き刺してきそうだった。

僕は緊張から、のどがカラカラになっていて。
それでも“この試練をクリアすれば僕は勇者になれる”という希望を頼りに勇気を振り絞った。

半開きの扉に、手をかける。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700110ta">
「あ、開けるよ……？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700120sn">
「ああ……」

ゆっくりと。
扉を開けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 200, 0, null);

//ＳＥ//ロッカーを開ける
	CreateSE("SE04","SE_き械_ろっかー_開ける");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("Black", 2000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

	Delete("ロッカー２");

	DrawTransition("Black", 300, 0, 1000, 100, null, "cg/data/right3.png", true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
それは思いの外、あっけなく。

そして、中に入っていたのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＢＧ//ロッカー（扉開けてある）
	CreateTexture360("ロッカー３", 100, 0, 0, "cg/bg/bg214_02_6_chn渋谷駅ロッカー開き_a.jpg");
	DrawTransition("Black", 300, 1000, 0, 100, null, "cg/data/right3.png", true);

	Delete("Black");

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700130sn">
「なんだ、これは……？」

僕もセナもロッカーの中をのぞき込んだまま、言葉を失う。

白い包み？
思った以上に大きい。

その包みに手を伸ばそうとしたとき――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//◆/ＳＥ/赤ん坊の泣き声
	CreateSE("SE05","SE_日常_泣き声_赤ん坊");
	MusicStart("SE05", 100, 1000, 0, 1000, null, true);
	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700140ta">
「ひっ……！？」

突然の声に、僕は慌てて手を引っ込めた。

こ、これって……まさか……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700150sn">
「赤ちゃん……？」

生きている赤ちゃんが、ロッカーに入れられていた？

もう何十年も前に、コインロッカーベイビーという捨て子が社会問題になってたらしいけど。
今の時代にも、あるんだ……。

いや、あるんだ、じゃなくて！
チートコードは、どこに行った！？

扉の番号をもう一度調べてみる。
それは間違いなく１００９番だった。
ということは、つまり……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//ＣＧ//赤ん坊を抱き上げるセナ
//※セナ表情、差分あった方がいいかも……
	CreateTexture360("セナと赤ん坊３", 100, 0, 0, "cg/ev/ev119_03_6_セナと赤ん坊_a.jpg");
	Fade("セナと赤ん坊３", 0, 0, null, true);
	Fade("セナと赤ん坊３", 1000, 1000, null, true);

	Delete("ロッカー３");

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
セナは、甲高い声で泣き続ける“それ”を、壊れ物を扱うかのように、慎重に抱き上げる。

赤ん坊の泣き声が、ますます大きくなって。
顔を引きつらせたセナはその姿勢のまま固まってしまい、すがるような視線を僕に送ってきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("セナと赤ん坊１", 100, 0, 0, "cg/ev/ev119_01_6_セナと赤ん坊_a.jpg");
	Fade("セナと赤ん坊１", 0, 0, null, true);
	Fade("セナと赤ん坊１", 500, 1000, null, true);
	Delete("セナと赤ん坊３");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//◆困る
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700160sn">
「に、西條……助けろ……」

//◆困る
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700170sn">
「どうしたら、いいんだ……」

そんなこと言われたって……。
ええと、おっぱいでもあげればいいと思います。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateTexture360("セナと赤ん坊２", 100, 0, 0, "cg/ev/ev119_02_6_セナと赤ん坊_a.jpg");
	Fade("セナと赤ん坊２", 0, 0, null, true);
	Fade("セナと赤ん坊２", 300, 1000, null, true);
	Delete("セナと赤ん坊１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700180sn">
「死ね」

にらまれた。
僕の妄想はセナには筒抜けなのか？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700190ta">
「……たぶん、この赤ちゃんが……チ、チートコードだよ」

つまり、それが意味するところは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//以下、回想
//ＢＧ//壊れたモニタ
//▼ウェブＣＨＡＴ開始
	SetVolume("SE05", 500, 1, null);
	Wait(500);

	CreateSE("SE回想in","SE_衝撃_衝撃音02");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

//▼べー：背景：チャット画面の変わりです。
	CreateTexture360("回想１", 100, 0, 0, "cg/bg/bg229_01_6_chn壊れたモニタ_a.jpg");

	Delete("セナと赤ん坊２");

	DosMain(-200,0);
//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3609007]
禁（０漸Ｖ・＄：どのようなガジェットとしてそちらの世界に具現化しているかは、あまり重要ではない
</PRE>
	SetDos2($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("0");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3609008]
禁（０漸Ｖ・＄：どんな形だろうと、そのコードを入手し、ロックを解除した時点でチートは有効となる
</PRE>
	SetDos2($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("0");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3609009]
禁（０漸Ｖ・＄：ロック解除とはつまり、そのガジェットを破壊するということだ
</PRE>
	SetDos2($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("0");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3609010]
禁（０漸Ｖ・＄：標的であるノアⅡは、そのコインロッカーの真上にある
</PRE>
	SetDos2($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("0");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3609011]
禁（０漸Ｖ・＄：渋谷東口のプラネタリウムだ
</PRE>
	SetDos2($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("0");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3609012]
禁（０漸Ｖ・＄：チートコードを入手したら、そのプラネタリウムを破壊しろ
</PRE>
	SetDos2($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("0");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3609013]
禁（０漸Ｖ・＄：それですべてカタがつく
</PRE>
	SetDos2($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("0");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3609014]
禁（０漸Ｖ・＄：健闘を祈る
</PRE>
	SetDos2($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("0");//――――――――――――――――――――――――――――――

	WaitAction($SYSTEM_present_text, null);
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(2000);


	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("回想１");
	Delete("回想明度");
	Delete("box04");//これでDOS消します

//ＣＧ//赤ん坊を抱くセナ

	SetVolume("SE05", 2000, 1000, null);

	CreateColor("黒幕", 1000, 0, 0, 1280, 720, "BLACK");

	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
この赤ん坊が、チートコードなら。
壊さなきゃ、発動しない。

壊す。つまり、殺すということ。

黙り込んでしまった僕を、セナがにらみつけてきた。
赤ん坊をかばうようにする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateTexture360("セナと赤ん坊３", 100, 0, 0, "cg/ev/ev119_03_6_セナと赤ん坊_a.jpg");
	Fade("黒幕", 1000, 0, null, true);
	Delete("黒幕");

	SetVolume("SE05", 2000, 300, null);

	Wait(500);


	BGMPlay360("CH22",0,1000,true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700200sn">
「できない……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700210sn">
「できるわけないだろう……！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700220sn">
「あの地震を、こんな暗くて狭い場所で、たった１人で、生き延びたんだぞ！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700230ta">
「そ、それは、チートコードだよ……。地震が起きた後に、こ、ここに、現れたんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700240ta">
「“それ”は、に、人間じゃない。そ、そう見えてる、だけで」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700250sn">
「あの自称３００人委員会の言葉を信じればな」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700260sn">
「もし違ったら？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700270sn">
「あるいは、元々ここに置き去りにされていたこの子に、後からチートコードだけを埋め込んだかもしれないんだぞ！」

セナのあまりの剣幕に、僕はたじろいでしまう。
それでも、目を合わせないようにしながら、必死に反論した。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700280ta">
「だ、だって、し、しょうがないじゃないか、それを壊さないと、チ、チートが……」

ここでセナに負けたら、チートコードが手に入らず、僕はキモオタのまま終わってしまう……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700290sn">
「この子に、触ってみろ、西條！　この子の温もりを、感じてみろ！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700300sn">
「こんな小さい子を、お前は殺せるのか！？」

殺せるわけないだろ！
僕は、人畜無害な人間なんだ！
だから殺すのは、セナの役目だ！

……なんて、口に出せるわけもなく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700310ta">
「セナは、む、む、むむ、矛盾してる……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700320ta">
「ここに来るまでは、や、やる気、満々だったじゃないかっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700330ta">
「せ、世界は、電気仕掛けなんでしょ！？　だったら、そ、その子も、単なる、人形だ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：ここ差分が望ましいと思いますが、登録がありません。
	CreateTexture360("セナと赤ん坊１", 100, 0, 0, "cg/ev/ev119_01_6_セナと赤ん坊_a.jpg");
	Fade("セナと赤ん坊１", 0, 0, null, true);
	Fade("セナと赤ん坊１", 1000, 1000, null, true);
	Delete("セナと赤ん坊３");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700340sn">
「……でも、泣いてる」

セナは赤ちゃんを優しく抱きしめた。
いつもツンケンしていたセナとは思えない、慈しみのこもった表情で。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700350sn">
「この子は、今、泣いてるんだ、西條」

むちゃくちゃだ……。
結局セナも、単なるデンパ女だったのか？

//ＳＥ//ここらへんからヒュンヒュンという機械音
{	CreateSE("SE06","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE06", 3000, 500, 0, 1000, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700360ta">
「チートを、発動させてノアⅡを、こ、壊さなきゃ、君の、家族だって生き返らないぞ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700370ta">
「なんで、た、ためらうんだよ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700380sn">
「この子が、生きているからだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700390sn">
「殺せない、私には……」

{	SetVolume360("@CH22", 500, 0, null);
	SetVolume("SE06", 1000, 700, null);
	Wait(500);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700400su">
「だったら、自分が殺してあげるッスよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTexture360("ロッカー１", 100, 0, 0, "cg/bg/bg213_01_6_chn渋谷駅コインロッカー_a.jpg");
	Delete("セナと赤ん坊*");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700410ta">
「え……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE06", 0, 0, null);

}
