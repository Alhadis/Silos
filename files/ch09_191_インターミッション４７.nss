//<continuation number="490">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_191_インターミッション４７";
		$GameContiune = 1;
		Reset();
	}

		ch09_191_インターミッション４７();
}


function ch09_191_インターミッション４７()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション４７
//ＢＧ//五島プラネタリウム・ロビー
//ゲーム中にテキストで「五島プラネタリウム」という名称を使うことはありません。ＢＧ内でも名称は出さないでください
//ここではユーザーに渋谷のプラネタリウムだと明確には分からないようにしたいです。実際に五島プラネタリウムに行ったことのある人だったら分かる、ぐらいでいいかと。
//明確な場所説明は１０章で行います

	IntermissionIn();

	DeleteAll();

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg199_01_3_プラネタリウム・ロビー_a.jpg");
	Fade("back04", 0, 1000, null, true);

	Stand("st梨深_制服_武器構えB","hard", 200, @+150);
	FadeStand("st梨深_制服_武器構えB_hard", 0, true);

	IntermissionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ガラス扉を開け、ロビーのような場所に入ったところで、咲畑梨深はゾクリと身を震わせた。

{	Stand("st梨深_制服_武器構えB","sad", 200, @+150);
	FadeStand("st梨深_制服_武器構えB_sad", 300, true);
	DeleteStand("st梨深_制服_武器構えB_hard", 0, true);}
凍り付きそうになるほどの冷気が、梨深の足を伝って這い上がってくる。

人の気配はない。

それは場所が場所だけに“当然のこと”だったが、この先に待つもののことを考えると、梨深としては誰かにいてほしかったという気持ちをつい抱いてしまう。

//◆うめくようなブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100010ri">
「…………」

すぐ目の前には、映画館にあるような防音扉。
その扉の隙間から漂ってきている冷気。
そして、ドライアイスの煙のような白い靄。

{	Stand("st梨深_制服_武器構え","hard", 200, @+150);
	DeleteStand("st梨深_制服_武器構えB_sad", 500, false);
	FadeStand("st梨深_制服_武器構え_hard", 500, true);}
//※分割して持っています
梨深はきつく唇を噛んだ。
両手にはディソード。
リアルブート済みだ。

//◆小声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100020ri">
「だから大丈夫……」

//◆小声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100030ri">
「だから、怖がっちゃダメだ……」

梨深は必死で自分にそう言い聞かせると、一度ゴクリと息を呑んで、肩で押すように防音扉を開けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_ぷらねたりうむ入り口扉開く");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Wait(1000);

	CreateColor("mist", 500, 0, 0, 1280, 720, "WHITE");
	Request("mist", AddRender);
	Fade("mist", 0, 1000, null, false);
	DrawTransition("mist", 500, 0, 1000, 800, Dxl1, "cg/data/effect.png", true);

	DeleteStand("st梨深_制服_武器構え_hard", 0, true);
	Wait(2000);

//ＢＧ//ノアⅡ
//ＳＥ//ノアⅡ稼働音
	CreateSE("SE01","SE_擬音_のあII稼働音_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	CreateBG2(100, 0, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("mist", 2000, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
そこに広がる光景に、梨深は目を見開いた。
あまりにも巨大な、怪物を思わせる『装置』。
それが、ドーム状の部屋の中央に鎮座していた。

広い室内には、不気味な音がかすかに響いている。
それは低く、獣がうなるような音。
『装置』が稼働していることを意味する音。

//◆忌々しげに
//◆「ノアⅡ」＝のあ・つー
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100040ri">
「ノアⅡ……」

//◆忌々しげに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100050ri">
「もう、動いてるんだ……」

//◆野呂瀬は誰に対しても敬語
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch09/19100060nr">
「君のおかげですよ」

忌々しげに独語した梨深に答えた、声。

//◆戦く＝おののく
その声を耳にした瞬間、梨深は、自らの魂が戦くのを感じた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

	Stand("st玄一_スーツ_通常","normal", 200, @+150);
	FadeStand("st玄一_スーツ_通常_normal", 500, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch09/19100070nr">
「咲畑梨深。１年半ぶりですね」

//◆うめくようなブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100080ri">
「…………」

梨深の本能が、恐怖を抱いている。
心の底からわき上がってくる震え。

忌まわしい記憶が襲いかかってくる。
暗い過去がよみがえりそうになる。

軽く首を振り、ディソードを強く握りしめることでそれに耐えると、梨深は声のした方へと視線を巡らせた。

巨大な装置――ノアⅡ。その傍らに。
スーツに身を包んだ長身の男の姿。
そして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//野呂瀬ディソードに囚われた七海
//こっちの七海が本物。拓巳と一緒にいる七海は、こっっちの七海が妄想した残留思念のようなもの
//七海の服装はダメージバージョンの制服（上着は着ていなくてブラウスのみ）。
	CreateTextureEX("back12", 500, 0, 0, "cg/ev/ev084_01_3_ノアII_a.jpg");
	Fade("back12", 500, 1000, null, true);
	DeleteStand("st玄一_スーツ_通常_normal", 0, true);

	CreateTextureEX("back10", 100, 0, 0, "cg/ev/ev084_01_3_ノアII_a.jpg");
	Fade("back10", 0, 1000, null, true);
	Fade("back12", 0, 0, null, false);
	Delete("back12");
	Move("back10", 2000, @0, -832, Dxl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100090ri">
「ナナちゃん……！」

西條七海が、そこに囚われていた。

破れかけた制服、血がにじんだ右手の包帯、力なく垂れた頭。ひどく青ざめた顔色。

その痛々しい姿に、梨深は言葉を失う。

磔にされたナザレのイエスのごとく。

いや、七海を捕らえているのは、十字架と呼べる代物ではない。
それとはかけ離れた、あまりにも悪意に満ちた形状。

この世のすべての邪悪――<k>
この世のすべての混沌――<k>
この世のすべての背徳――

それらを形として表象させたものと言っても過言ではなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("back10", null);
	Wait(500);

	Stand("st玄一_スーツ_通常","normal", 200, @+150);
	FadeStand("st玄一_スーツ_通常_normal", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch09/19100100nr">
「君がこの１年半、どこでなにをしていたかについて興味はありませんが」

{	Stand("st玄一_スーツ_通常","hard", 200, @+150);
	FadeStand("st玄一_スーツ_通常_hard", 300, true);
	DeleteStand("st玄一_スーツ_通常_normal", 0, true);}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch09/19100110nr">
「困りますね。あまりウロチョロされると」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100120ri">
「…………」

その男――野呂瀬玄一は、口振りこそ穏やかだが、その声には刃物のような鋭さが込められていた。

へたり込みそうになるのを必死でこらえ、梨深は野呂瀬をにらみつける。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100130ri">
「ナナちゃんを離して」

{	Stand("st玄一_スーツ_通常","normal", 200, @+150);
	FadeStand("st玄一_スーツ_通常_normal", 300, true);
	DeleteStand("st玄一_スーツ_通常_hard", 0, true);}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch09/19100140nr">
「ほう。まさかここに来たのは、お友達を助けに来た、という理由ですか？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100150ri">
「……ナナちゃんを、離して」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100160ri">
「その子は、なにも関係ないでしょ」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch09/19100170nr">
「では、直接話してみてはどうですか？」

野呂瀬の申し出に、梨深は戸惑う。

強がってはいるが、野呂瀬の顔を見た途端に梨深の心は怖じ気付き、足が震えてしまっていた。その場から動けないまま、張り付けにされた七海へと呼びかける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100180ri">
「ナナちゃん？」

ピクリと、七海の頭が動いた。

閉じていた目がうっすらと開き、
顔を上げて、
虚ろな瞳が、梨深を捉える。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100190na">
「梨深さん……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100200ri">
「大丈夫？　今、助けてあげるから……」

梨深の言葉の途中で、七海は苦痛に顔を歪めた。
その表情は青ざめ、荒い息をつく。

//◆苦痛
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100210na">
「う……うう……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100220na">
「痛い、よぅ……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100230na">
「右手が……痛いの……」

ずるり、と。
七海の身体が、十字架から滑り落ちた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateTextureEX("back12", 500, 0, 0, "cg/ev/ev084_01_3_ノアII_a.jpg");

	CreateSE("SE10","SE_衝撃_どさっ");
	MusicStart("SE10", 0, 1000, 0, 1000, null, false);

	Fade("back12", 300, 1000, null, true);
	DeleteStand("st玄一_スーツ_通常_normal", 0, true);

	CreateTextureEX("back10", 200, 0, 0, "cg/ev/ev084_01_3_ノアII_a.jpg");
	Fade("back10", 0, 1000, null, true);
	Fade("back12", 0, 0, null, false);
	Delete("back12");

//ＳＥ//人が倒れる音

	CreateTextureEX("back13", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("back13", 300, 1000, null, true);

	Stand("bu梨深_制服_武器構え","hard", 200, @+150);
	FadeStand("bu梨深_制服_武器構え_hard", 0, true);

	Delete("back10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100240ri">
「ナナちゃん……！」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100250na">
「ねえ、梨深……さん……」

横たわったまま、頭だけを上げた七海は、視線を泳がせる。
なにかを、探しているかのように――

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100260na">
「ナナの……バングル、知らない……かな……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100270na">
「見つから、なくて……」

//七海のバングルは、七海の手首と同じ場所にあります。七海の手首は「拓巳の部屋→梨深が持ち出す→将軍が預かる」という経緯を辿って、将軍が持っています。
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100280na">
「ナナのバングル……、どこにも、なくて……」

よろめきながらも起き上がり、今度は左手で周囲を探り出した。

{	Stand("bu梨深_制服_武器構え","sad", 200, @+150);
	FadeStand("bu梨深_制服_武器構え_sad", 300, true);
	DeleteStand("bu梨深_制服_武器構え_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100290ri">
「バングル……。バングル、だね？　分かった。あたし知ってるから。だからあたしと一緒にここを出よう？　病院に行こう？　ね？」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100300na">
「手……手が、痛いよぅ……うう……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100310na">
「ナナは……なんで、梨深さんのこと……知ってるんだっけ……？　前に、どこで、会ったんだっけ……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100320na">
「梨深さん……梨深さん、なの……？　梨深さんが、ナナの、バングル……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100330na">
「ウソ……どうして……ひどい……よ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_武器構え","hard", 250, @+150);
	FadeStand("bu梨深_制服_武器構え_hard", 300, true);
	DeleteStand("bu梨深_制服_武器構え_sad", 0, true);
	Wait(500);
	DeleteStand("bu梨深_制服_武器構え_hard", 300, true);
	Stand("st玄一_スーツ_通常","normal", 200, @0);
	FadeStand("st玄一_スーツ_通常_normal", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
七海の様子がおかしいことに気付いた梨深は、とっさに野呂瀬へと目をやった。

彼は嘲るような笑みを浮かべたまま、梨深と七海のやり取りを黙って見つめている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100340ri">
「ナナちゃんに、なにを“見せて”るの！？」

{	Stand("st玄一_スーツ_通常","pride", 200, @0);
	FadeStand("st玄一_スーツ_通常_pride", 300, true);
	DeleteStand("st玄一_スーツ_通常_normal", 0, true);}
//◆鼻で笑う
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch09/19100350nr">
「…………」

{	DeleteStand("st玄一_スーツ_通常_pride", 500, true);}
七海が、その視線を梨深へと固定した。
ゆっくりと、生まれたての子鹿のように震えながら立ち上がり、

右手を――その掌を差し延べるように――梨深の方へと伸ばす。

血に染まった、包帯。
手首は繋がっているように見える。

だが、紅い雫が、一滴、また一滴と、途切れることなくしたたり落ちていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//雫が落ちる音「ピチャン」
	CreateSE("SE10","SE_じん体_手首_たれる血");
	MusicStart("SE10", 0, 1000, 0, 1000, null, false);

	Stand("bu梨深_制服_武器構えB","sad", 250, @+150);
	FadeStand("bu梨深_制服_武器構えB_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
七海の足許に、血だまりができていく。

早く手当をさせなくちゃ――

その焦りとは裏腹に、梨深はそれ以上近づけない。七海に近づくことはすなわち、あの男に近づくことでもあるから。

それが悔しくて、梨深は泣きそうになる。

{	CreateSE("SE10","SE_じん体_手首_たれる血");
	MusicStart("SE10", 0, 1000, 0, 1000, null, false);}
//ＳＥ//雫が落ちる音「ピチャン」
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100360na">
「梨深さんが、持ってたの……？」

{	Stand("bu梨深_制服_武器構えB","hard", 250, @+150);
	FadeStand("bu梨深_制服_武器構えB_hard", 300, true);
	DeleteStand("bu梨深_制服_武器構えB_sad", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100370ri">
「ナナちゃん、帰ろう？　こっちに、来て」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100380na">
「どうして、持ってくの……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100390na">
「返して……ナナのバングル、返して……っ」

{//ＳＥ//雫が落ちる音「ピチャン」
	CreateSE("SE10","SE_じん体_手首_たれる血");
	MusicStart("SE10", 0, 1000, 0, 1000, null, false);
	Stand("bu梨深_制服_武器構え","hard", 250, @+150);
	DeleteStand("bu梨深_制服_武器構えB_hard", 500, false);
	FadeStand("bu梨深_制服_武器構え_hard", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100400ri">
「落ち着いて、ナナちゃん！」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100410na">
「おにぃから……もらった……ナナの、大切な……」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100420na">
「あれは、誰にも、渡したくないの……っ」

{	CreateSE("SE10","SE_じん体_手首_たれる血");
	MusicStart("SE10", 0, 1000, 0, 1000, null, false);}
//ＳＥ//雫が落ちる音「ピチャン」
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100430na">
「返して……返してよ……っ」

{	Stand("bu梨深_制服_武器構え","sad", 250, @+150);
	FadeStand("bu梨深_制服_武器構え_sad", 300, true);
	DeleteStand("bu梨深_制服_武器構え_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100440ri">
「ナナちゃん！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＣＧ//七海ディソード顕現

	CreateColor("色１", 1000, 0, 0, 1280, 720, "White");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);

	CreateSE("SE05","SE_擬音_ディそーど_具現化直前_Loop");
	MusicStart("SE05", 0, 700, 0, 1000, null, false);

	Fade("色１", 500, 1000, null, true);
	DeleteStand("bu梨深_制服_武器構え_sad", 0, true);
	Delete("back*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100450na">
「返してぇっ！」

悲痛な叫びとともに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ベキベキベキ！（結晶化）

	CreateSE("SE01","SE_擬音_七海_リアルぶーと");
	MusicStart("SE01", 500, 800, 0, 1000, null, false);

	CreateTextureEX("back05", 500, 0, -552, "cg/ev/ev085_01_3_七海ディソード_a.jpg");
	CreateTextureEX("七海剣", 500, center, middle, "cg/bg/bg241_01_6_chnディソード全体_七海_a.jpg");
	Request("色１", Smoothing);
	Fade("back05", 0, 1000, null, true);

	FadeDelete("色１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
七海の手首からこぼれ落ちた一滴の血が。

床へ落ちる前に、急速に結晶化する。

雫を中心として、なにもないところから鉱物のようなものが飛び出してくる。

まるで、無機質な甲殻が、空間の裂け目を突き破ってきたようで。

{	Move("back05", 6000, 0, 0, Axl1, false);}
それは、瞬く間にひとつの姿を形作っていく。

{	Fade("七海剣", 200, 1000, null, true);
	Fade("七海剣", 500, 0, null, false);}
さっきまで七海を捕らえていた“もの”よりも、ずっと十字架らしく見える。

あるいは――

{	Fade("七海剣", 200, 1000, null, true);
	Fade("七海剣", 500, 0, null, false);}
垂直に突き刺さった、すべてを拒絶しているかのような――剣。

//◆愕然
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100460ri">
「これは……ディソード……！」

{	Fade("七海剣", 200, 1000, null, true);
	Fade("七海剣", 1000, 0, null, false);}
//◆涙声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100470na">
「かえ……してよ……お願い……」

{	WaitAction("back05", null);}
七海が、その剣を抱擁するように、胸に抱く。
悲しげにこぼした涙が剣へと落ち。
ディソードは、彼女の鼓動のごとく緋色に明滅した。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100480na">
「でないと、梨深さんのこと……許さない……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/19100490ri">
「そんな……ナナちゃんも、ギガロマニアックスだったの……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	ClearAll(2000);
	Wait(2000);

//～～Ｆ・Ｏ

//■インターミッション４７終了

}