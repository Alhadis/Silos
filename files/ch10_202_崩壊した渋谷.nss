//<continuation number="500">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_202_崩壊した渋谷";
		$GameContiune = 1;
		Reset();
	}

		ch10_202_崩壊した渋谷();
}


function ch10_202_崩壊した渋谷()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//※拓巳視点に戻る

//イメージＢＧ//曇り空//昼
//時間はお昼頃
	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg209_01_5_曇り空_a.jpg");
	Fade("back04", 1000, 1000, null, true);

	CreateSE("SE01","SE_日常_消ぼうきゅう急車_サイレン遠く_LOOP");
	MusicStart("SE01", 1000, 300, 0, 1000, null, true);

	CreateSE("SE02","SE_はいけい_崩壊しぶ谷_107前_LOOP");
	MusicStart("SE02", 1000, 100, 0, 1000, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200010ta">
「…………っ」

気が付くと、頭上にはどんよりとした雲。
いつの間にか夜は明けていた。

でも、青空なんて、どこにも見えない。
気分が滅入ってくるような。
重苦しい空。

遠くで、いくつもの救急車や消防車のサイレンが、うるさいくらいに鳴っていた。

視界に、上空を旋回するヘリの姿が飛び込んでくる。やけにたくさん飛んでいて、まるでハエみたいだ。

頭がズキズキする。
頭蓋骨の内側で道路工事でもされてるみたいだった。
前に起きた地震のときよりもひどい痛みだった。

記憶を失う直前のことを思い出してみる。
空の白さ。
『将軍』が叫んだ“サードメルト”という言葉。

僕は頭痛をこらえて身体を起こし、
絶句した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, NULL);
	SetVolume("SE02", 3000, 400, NULL);

//ＢＧ//崩壊渋谷・１０９前//昼・曇り
//ＳＥ//複数のヘリの音
//ＳＥ//遠くで複数の救急車のサイレン

	CreateTextureEX("back05", 200, 0, 0, "cg/bg/bg001_02_5_崩壊渋谷_a.jpg");
	Move("back05", 4000, 0, -520, AxlAuto, false);
	Fade("back05", 2000, 1000, null, true);

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg009_03_5_107_a.jpg");
	Fade("back03", 0, 1000, null, true);

	WaitAction("back05", 1500);

	Fade("back05", 1000, 0, null, true);
	Delete("back04");
	Delete("back05");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
見慣れた風景は、そこにはなかった。

まるで１０年くらい前に流行った“世紀末”の光景。
渋谷が、崩壊していた。

信号も、街路樹も、いくつかのビルも、倒れている。
スクランブル交差点の名物だった大きな街頭モニターはひび割れ、今は沈黙していた。

地下鉄の入り口である下り階段は、屋根が崩れて埋まっている。
山手線のガードが崩落し、線路のレールが寸断されている。

そして、あちこちに横たわっている、たくさんの人々。
瓦礫にこびりついている、血や、肉片。

ピクリとも動かない人。
苦しそうにうめき声を上げる人。
“助けて！”と絶叫している人。

砂埃にまみれ、全身真っ白な状態で這っている人。
動かない人を抱き起こして、泣いている人。

血の匂いと。
焦げ付くような匂いと。

粉塵の匂いとが漂っている。
遠くで、幾筋もの黒い煙が狼煙のように上がっている。

これが、ノアⅡの威力……。

戦慄した。
これはもう、大量破壊兵器だ。
『将軍』が必死に止めようとしていた理由を、ようやく実感した。

そう言えば『将軍』は……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
我に返り、周囲を見回す。
すぐそばに、歪んだ車椅子が転がっていた。
その傍らに、彼の小さな身体が横たわっている。

慌てて駆け寄り、抱き起こした。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200020ta">
「ねえ！　おい、しっかりして！」

呼びかけても、反応はない。
心の声も、聞こえない。

まさか死んじゃったんだろうか。

口許に耳を寄せてみる。
かすかにだけど、呼吸はしていた。

でも意識はなかった。
頬を軽く叩いてみたりしたけど、目を覚ましてはくれない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200030ta">
「ノアⅡは……どこにあるの……？」

それが分からないんじゃ、梨深や七海を助けに行くことすらできない。

『将軍』にあらかじめ聞いておくべきだった。

僕はたまらず舌打ちし、ポケットからケータイを取り出す。

でも電源が切れていて、どんな操作をしても沈黙したままだった。使い物にならない。

『将軍』の他に、知っていそうな人は誰がいるだろう……。
考えろ……。考えるんだ……。

のんびりしている暇はない。

こうしてオロオロしている間にも、捕らえられた梨深が野呂瀬とかいう男の気まぐれで殺されちゃうかもしれないんだ……！

誰だ？
僕の味方になってくれそうな人で、
ノアⅡのことに精通しているのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 500, 0, NULL);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	CreateTexture360("背景１", 200, 0, 0, "cg/bg/bg058_02_6_Ｒｏｆｔ前_a.jpg");

	CreateColor("色２", 400, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 300, null, true);

	Stand("st梢_私服_通常","sad", 300, @-150);
	FadeStand("st梢_私服_通常_sad", 0, true);

	Stand("st一成_浮浪者_通常","normal", 300, @+150);
	FadeStand("st一成_浮浪者_通常_normal", 0, true);

	Fade("色１", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//ＶＦ//回想セリフ
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20200040ha">
「君たちは特別な存在だ」

//ＶＦ//回想セリフ
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20200050ha">
「中でも一番特別なのは」

//ＶＦ//回想セリフ
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20200060ha">
「“その目だれの目？”を産み落とした少年」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("色１", 100, 1000, null, true);
	Delete("背景１");
	DeleteStand("st梢_私服_通常_sad", 0, true);
	DeleteStand("st一成_浮浪者_通常_normal", 0, true);
	Delete("色２");
	CreateSE("SE02","SE_はいけい_崩壊しぶ谷_107前_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);
	Fade("色１", 500, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//◆「一成」＝「いっせい」
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200070ta">
「……波多野……一成」

セナの父親。
プロジェクト・ノアの初期メンバー。
今は行方不明。

会ったことはない。
いや、ニアミスはしているのかも。

こずぴぃの話によれば、ホームレスの格好をして渋谷のあちこちに現れるらしい。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200080ta">
「……見つけるしか、ない」

僕は『将軍』のビックリするぐらい軽い身体を背負うと、瓦礫の中を慎重に歩き出した。

波多野さんがどこにいるかは分からない。
それでも、とにかく探すしかないんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 1000, 0, NULL);

//～～Ｆ・Ｏ
	ClearAll(1000);
	Wait(500);

//ＢＧ//崩壊渋谷・道玄坂//昼・曇り

	CreateSE("SE10","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE10", 1000, 700, 0, 1000, null, true);

	CreateTextureEX("back10", 100, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");
	Fade("back10", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
『将軍』の身体がいくら軽いって言っても、それでも２０キロ弱はある。

彼を背負ったまま渋谷を――ましてやデコボコの道を歩き回るほどの体力は、僕にはなかった。

なにしろ運動なんてまともにした試しがない。ＰＣの前に座っているのが僕の日常だったから。

『将軍』を病院に連れて行くべきだろうかと思ったけど、今の渋谷の状況じゃ救急車なんて呼べそうにない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200090ta">
「はあ、はあ……っ」

道玄坂の緩い坂道を上がってくるだけで、力尽きてしまった。息は切れ、全身から大量の汗が噴き出してくる。

額の汗を拭いながら、僕は息を整えるために立ち止まった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("鼻歌背景", 100, 0, 0, "cg/bg/bg209_01_5_曇り空_a.jpg");

//■３６０追加修正ここから
//■３６０：以下あやせ歌詞すべて差し替え。音声ファイル名要確認
//	BGMPlay360("CH_INS_FES_あかぺら", 1000, 500, true);
//森島ＳＥ化のため退避
	CreateVOICE("あやせ１","ch10/ayase_akapera10");
	SoundPlay("あやせ１",0,1000,false);

//■３６０追加
//	SetBacklog("「砂を咬め　砂を咬め　子を宿すような　苦しみを帯びて」", "voice/ch10/20200100ay", あやせ);
	SetBacklog("「空へと突き出た　戒めの祭壇」", "voice/ch10/ayase_akapera10", あやせ);

	Fade("鼻歌背景", 1000, 1000, null, false);

//◆※あやせが歌を口ずさむ声が聞こえてくる。ＳＥ扱いでもいいかもです
//◆※挿入歌の２番を口ずさむ

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【あやせ】
//<voice name="あやせ" class="あやせ" src="voice/ch10/ayase_akapera10">
//「砂を咬め　砂を咬め　子を宿すような　苦しみを帯びて」
//ayase_akapera10
//【あやせ】
「空へと突き出た　戒めの祭壇」

{	SoundStop2("あやせ１");
	CreateVOICE("あやせ２","ch10/ayase_akapera11");
	SoundPlay("あやせ２",0,1000,false);
//	SetBacklog("「弧を描く　針の跡は　虚ろを快楽に変え　今天を仰いだ」", "voice/ch10/20200110ay", あやせ);
	SetBacklog("「主への冒涜　報いの責め苦」", "voice/ch10/ayase_akapera11", あやせ);}
//【あやせ】
//<voice name="あやせ" class="あやせ" src="voice/ch10/ayase_akapera11">
//「弧を描く　針の跡は　虚ろを快楽に変え　今天を仰いだ」
//ayase_akapera11
//【あやせ】
「主への冒涜　報いの責め苦」

{	SoundStop2("あやせ２");
	CreateVOICE("あやせ３","ch10/ayase_akapera12");
	SoundPlay("あやせ３",0,1000,false);
//	SetBacklog("「来るべき世の罪を断ち　羊の群れを飼い慣らして」", "voice/ch10/20200120ay", あやせ);
	SetBacklog("「その目に習って　歩み続くがいい」", "voice/ch10/ayase_akapera12", あやせ);}
//【あやせ】
//<voice name="あやせ" class="あやせ" src="voice/ch10/ayase_akapera12">
//「来るべき世の罪を断ち　羊の群れを飼い慣らして」
//ayase_akapera12
//【あやせ】
「その目に習って　歩み続くがいい」

{	SoundStop2("あやせ３");
	CreateVOICE("あやせ４","ch10/ayase_akapera13");
	SoundPlay("あやせ４",0,1000,false);
//	SetBacklog("「感謝の詩が報われたら　ハレルヤ。主を賛美賜え」", "voice/ch10/20200130ay", あやせ);
	SetBacklog("「一つまた一つと　闇に手と手を繋いで」", "voice/ch10/ayase_akapera13", あやせ);}
//【あやせ】
//<voice name="あやせ" class="あやせ" src="voice/ch10/ayase_akapera13">
//「感謝の詩が報われたら　ハレルヤ。主を賛美賜え」
//ayase_akapera13
//【あやせ】
「一つまた一つと　闇に手と手を繋いで」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin10();//――――――――――――――――――――――――――――――

//■３６０：以上あやせ歌詞すべて差し替え。音声ファイル名要確認
//■３６０追加修正ここまで

	SoundStop2("あやせ４");

//▼べー：演出：アカペラしている歌が違いますのでコメントアウト致します。
	BGMPlay360("CH_INS_FES_あかぺら", 1000, 800, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
すると、かすかに聞こえてきた、誰かの声。

それはとても寂しげで、けれど決して絶望に瀕している風じゃなく、聞いていて心地がいいと思える、歌声。

この歌声を、僕は以前にも、聞いたことがある。

そのときは、ライブハウスのステージだった。視覚を刺激する過剰な照明と、密閉した空間そのものを揺さぶるような爆音の中で、それを聞いた。

でも今は。
人の気配がどこにもない、道の真ん中。
死によって支配された、この崩壊した街の中で聞いている。

{	Fade("鼻歌背景", 1000, 1000, null, true);
	Delete("鼻歌背景");}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200140ta">
「あやせ……？」

『将軍』をその場に寝かせ、周囲を見回す。
でも、人の姿と言えば倒れているいくつかの遺体ぐらいだ。

それらはなるべく見ないようにして、あやせの姿を探す。彼女の歌声は、いったいどこから聞こえるんだろう。

目の前にあるのは、陥没した道路。
大きな穴が口を開けている。
この道の下には、確か地下鉄が通っていたはずだ。

まさかとは思いつつ、恐る恐る穴の縁から下をのぞき込んでみた。
深さは５メートルぐらい。
細かい瓦礫が大量に積み重なっている。

そこに、あやせが倒れていた。

{	SoundStop2("@CH_INS_FES_あかぺら");
	Wait(500);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20200150ay">
「……拓巳」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200160ta">
「今、助けるよ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 3000, 400, NULL);
	CreateSE("SE11","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE11", 3000, 300, 0, 1000, null, true);

	CreateColor("back20", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("back20", 300, 0, 1000, 100, null, "cg/data/down2.png", true);

	CreateSE("SE02","SE_衝撃_どさっ");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
僕は、急いでその穴へと飛び降りた。
{	CreateSE("SE02","SE_衝撃_どんがらがっしゃーん");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);}
着地に失敗して、ほとんどもんどり打つように瓦礫の上に倒れ込む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/ev/ev089_01_1_あやせ瓦礫下_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
あやせは、足を大きなコンクリートの塊に挟まれ、動けないでいた。
なんとかそれを取り除こうとしてみたけど、重くてとてもひとりじゃ無理だ。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20200170ay">
「私だけじゃない」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20200180ay">
「他に３人いるわ。キミの妹も」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200190ta">
「七海が……！？」

どうしてここに？
野呂瀬っていう男に捕らえられたんじゃなかったの？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200200ta">
「七海！　七海っ！」

身体の痛みに耐えて立ち上がり叫んでみたけど、返事はない。

周囲を見ると、あやせ以外にひとりだけ、恰幅のいい女の人がうつぶせに倒れているのは確認できた。動かないけど、外傷はなさそうだから、気を失っているだけか……。

七海ともうひとりの姿はなかった。
もしかしたら、生き埋めになっているかもしれない。

早くなんとかしないと……！

チラリと、穴の上を見上げた。
咳き込みそうなほどに舞っている粉塵。
その向こうに、空が円形に切り取られている。

路上に寝かせてきた『将軍』のことを想う。
梨深の言葉を思い返す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 500, 0, NULL);
	SetVolume("SE11", 500, 0, NULL);
	CreateColor("back10", 400, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);
	Fade("back10", 0, 0, null, false);
	Fade("back10", 200, 1000, null, true);
	CreateColor("back11", 300, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 300, null, false);
	CreateTexture360("back03", 200, 0, 0, "cg/bg/bg056_01_2_下北沢住宅街_a.jpg");
	Stand("bu梨深_制服_通常","normal", 200, @+150);
	FadeStand("bu梨深_制服_通常_normal", 0, false);
	Fade("back10", 300, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20200210ri">
「妄想すればするほど、本物のあなたの命が、削られていっちゃうんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("back10", 100, 1000, null, true);
	Delete("back03");
	Delete("back11");
	DeleteStand("bu梨深_制服_通常_normal", 0, false);
	Fade("back10", 500, 0, null, true);
	CreateSE("SE10","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE10", 500, 400, 0, 1000, null, true);
	CreateSE("SE11","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE11", 500, 300, 0, 1000, null, true);
	Delete("back10");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603008]
でも躊躇してはいられない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面エフェクト//青い光
//ＳＥ//ディソード出現
	CreateSE("SE01","SE_衝撃_衝撃は_リアルぶーと");
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "BLUE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);

	CreateTextureEX("拓巳剣エフェクト", 100, 0, 96, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");

	MusicStart("SE01", 0, 500, 0, 1000, null, false);
	Move("拓巳剣エフェクト", 1000, @0, @-96, Dxl1, false);
	Fade("拓巳剣エフェクト", 1000, 1000, null, false);
	Fade("回想フラッシュ", 500, 1000, null, true);
	Fade("回想フラッシュ", 1000, 0, null, true);
	Delete("回想フラッシュ");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
僕は、ディソードを見えない空間から引っ張り出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg201_01_6_瓦礫の下の空洞_a.jpg");
	Fade("back03", 500, 1000, null, true);
	Delete("拓巳剣エフェクト");

	Stand("buあやせ_制服_通常","hard", 200, @0);
	FadeStand("buあやせ_制服_通常_hard", 500, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
あやせの傍らに座り込み、彼女の足の方は見ないようにして、顔をのぞき込む。

彼女の目だけを見つめる。

――それで、じゅうぶんだった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200220ta">
「妄想するんだ」

強く。強く。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200230ta">
「あやせの足の上にある瓦礫は、大きなものじゃない。数は多いけど、ひとつひとつは小さい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200240ta">
「重くない。簡単に足を引っ張り出せる――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200250ta">
「他の２人も、助け出せる――」

僕と、あやせ。
２人のギガロマニアックスの間で、その妄想を共通の認識とすれば。

おのずと、妄想は、現実にできるはず――！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 0, 0, NULL);
	SetVolume("SE10", 0, 0, NULL);
	DelusionFakeIn();
	DeleteStand("buあやせ_制服_通常_hard", 10, true);
	Stand("buあやせ_制服_通常","smile", 200, @0);
	FadeStand("buあやせ_制服_通常_smile", 10, true);
	DelusionFakeIn2();
	CreateSE("SE10","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE10", 500, 400, 0, 1000, null, true);
	CreateSE("SE11","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE11", 500, 300, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text200]
ふと、あやせがホッとしたように微笑んだ。
彼女の指が、僕の頬を優しく撫でてくる。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20200260ay">
「グラジオールの導きね。キミが、ここに来てくれたのは」

僕は目を瞬かせ、恐る恐る顔を上げた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200270ta">
「は、はは……」

{	DeleteStand("buあやせ_制服_通常_smile", 500, true);}
あやせの足の上にあった大きなコンクリート片が、妄想通りに細かい瓦礫に変わっていた。

それをいくつかどかすと、あやせの足が抜けた。
まさかここまでうまく行くとは思わなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_通常","normal", 200, @+200);
	FadeStand("buあやせ_制服_通常_normal", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
彼女は身を起こし、足首をさする。
幸い、大した怪我はないみたいだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200280ta">
「あやせの歌が、聞こえたんだ。それに、導かれたんだよ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20200290ay">
「そう……。よかった。歌い続けてきて」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buあやせ_制服_通常_normal", 500, true);
	Stand("stあやせ_制服_通常","normal", 200, @+150);
	FadeStand("stあやせ_制服_通常_normal", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602010]
あやせに手を貸し、立ち上がらせながら、周囲を見回した。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200300ta">
「七海は……？」

{	DeleteStand("stあやせ_制服_通常_normal", 500, true);}
妹の姿は相変わらずどこにも見えない。

妄想が失敗したんだろうか。
あるいは、七海はもう……。
不安になる。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20200310yu">
「だ、誰か……」

声がした。
その声がした方を見ると、瓦礫の間から手が伸びているのを発見した。

その手を――ほっそりとした指をつかみ、隙間をのぞき込んでみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/ev/ev090_01_1_優愛瓦礫下_a.jpg");
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603010]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20200320yu">
「あ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200330ta">
「あ……」

トンネルのようになった隙間。その奥で生き埋めになっていたのは、見覚えのある、眼鏡をかけた女子。

優愛と会うのはずいぶん久しぶりな気がする。

//◆ブレス
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20200340yu">
「…………」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20200350yu">
「あの……なぜか、急に……この隙間ができて……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20200360yu">
「ついさっきまで、まったく身動きが、取れなかったんですけど……」

彼女は僕から目をそらし、申し訳なさそうな声でそう言った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200370ta">
「手を、しっかりつかんでて……！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20200380yu">
「え……」

僕は、優愛の手を握る力を強める。
そして、彼女を隙間から引きずり出そうと、思い切り引っ張る。

あやせも手伝ってくれた。
{	CreateSE("SE01","SE_衝撃_どすーん");
	MusicStart("SE01", 0, 300, 0, 1000, null, false);
	CreateSE("SE02","SE_衝撃_どんがらがっしゃーん");
	MusicStart("SE02", 0, 200, 0, 1000, null, false);}
２人で思い切り優愛の手を引っ張ると、彼女はかなりあっさりと瓦礫の間から脱出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg201_01_6_瓦礫の下の空洞_a.jpg");
	Fade("back03", 500, 1000, null, true);
	Stand("stあやせ_制服_通常","normal", 200, @-200);
	Stand("st優愛_制服_通常","sad", 200, @+200);
	FadeStand("stあやせ_制服_通常_normal", 500, false);
	FadeStand("st優愛_制服_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//◆咳き込んでいる
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20200390yu">
「けほ、けほっ……」

//◆咳き込んでいる
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20200400yu">
「あ、ありがとう……ござい……けほっ……」

全身、埃まみれだ。長い髪にはコンクリートの破片がからみついてしまっている。

でも、優愛にも怪我はないみたいだった。

後は、七海を……

{	DeleteStand("stあやせ_制服_通常_normal", 500, false);
	DeleteStand("st優愛_制服_通常_sad", 500, true);}
優愛のことはあやせに任せ、七海を探す。

優愛が脱出できたことを考えると、僕の妄想はうまく作用したはずだ。それなら、七海だって優愛みたいに、隙間から助け出せるはず。

案の定、いくつかの瓦礫の間を探していくと、その隙間のひとつに七海の顔を見つけた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200410ta">
「七海！」

呼びかけたけど、七海は反応しない。
気を失っているみたいだ。

手を伸ばして、七海の肩に触れようとして、一瞬躊躇した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("黒幕", 2100, 0, 0, 1280, 720, "BLACK");
//	CreateColor("黒幕２", 7100, 0, 0, 1280, 720, "BLACK");
	Fade("黒幕", 0, 0, null, true);
	Fade("黒幕", 0, 1000, null, true);
//	Fade("黒幕２", 0, 300, null, true);
	CreateMovie360("消滅", 5000, Center, Middle, false, false, "dx/mv消える01.avi");
	Fade("消滅", 0, 0, null, false);
//	Request("消滅", Play);
	Wait(1000);
	Fade("消滅", 500, 500, null, true);
	WaitAction("消滅", null);
//	FadeDelete("消滅", 500, true);
	Fade("消滅", 500, 0, null, true);
	Delete("消滅");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
昨日、僕の目の前で粒子になって消えた七海の姿が脳裏をよぎる。

――いや、この七海は本物の七海のはずだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("黒幕", 1000, 0, null, true);
	Delete("黒幕");
	CreateSE("SE01","SE_じん体_動作_のぞく");
	MusicStart("SE01", 0, 500, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
思い切って、七海の肩――ブラウスをつかむ。
きちんと触れることができた。
温もりが、そこにあった。

{	CreateSE("SE01","SE_衝撃_どんがらがっしゃーん");
	MusicStart("SE01", 1000, 500, 0, 1000, null, false);}
さっきの優愛と同じように全力で引っ張り出す。

{
//	CreateTextureEX("七海", 200, Center, InBottom, "cg/bu/bu七海_制服_拗ね_sad_eye02.png");
//	Fade("七海", 500, 1000, null, true);
}
七海はあやせや優愛と違い、その服を血にまみれさせていた。
特に腕は真っ赤だ。

とにかく仰向けに寝かせ、息を確認する。
苦しそうにではあるけど、かすかな吐息があった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200420ta">
「よかった……」

こうなると、血に染まった右手の状態が心配だ。
調べる為に握ろうとしたら、僕の手は、すり抜けてしまった。

……妄想の手？

やっぱり、七海の右手は……。

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200430ta">
「ごめん……ごめん、巻き込んで……」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20200440na">
「う……う……」

七海の口から、うめき声が漏れる。
埃まみれの顔。その頬をそっと撫でると、七海はうっすらと瞼を開いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

/*	Stand("bu七海_制服_拗ね","sad", 200, @0);
	FadeStand("bu七海_制服_拗ね_sad", 500, true);
	Delete("七海");*/

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20200450na">
「お……にぃ……？」

わずかに視線をさまよわせてから、その目が僕を捉えた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200460ta">
「七海……」

//◆泣く
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20200470na">
「う、うう……」

{/*	Stand("bu七海_制服_拗ね","cry", 200, @0);
	FadeStand("bu七海_制服_拗ね_cry", 300, true);
	DeleteStand("bu七海_制服_拗ね_sad", 0, true);*/}
途端に、七海の表情がくしゃくしゃに歪んでいく。
涙がポロポロとこぼれ出す。
僕の手を、左手で強く握ってくる。

//◆泣く
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20200480na">
「おにぃ……、お、にぃ……」

僕に対する、すがるようなつぶやき。
でも僕は、それに小さく首を振って応えた。

{	Wait(500);}
//◆優しく
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20200490ta">
「七海のホントのおにぃは……僕じゃないよ」

{/*	Stand("bu七海_制服_拗ね","sad", 200, @0);
	FadeStand("bu七海_制服_拗ね_sad", 300, true);
	DeleteStand("bu七海_制服_拗ね_cry", 0, true);*/}
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20200500na">
「…………え？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 500, 0, NULL);
	SetVolume("SE11", 500, 0, NULL);
//～～Ｆ・Ｏ

}

//■TypeBegin10
