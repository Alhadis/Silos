//<continuation number="150">




chapter main
{

	$PreGameName = "boot_第五章";

	if($GameStart != 1)
	{
		$GameName = "ch05_100_インターミッション１６";
		$GameContiune = 1;
		Reset();
	}

		ch05_100_インターミッション１６();
}


function ch05_100_インターミッション１６()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション１６

	IntermissionIn();

	Delete("*");

//ＢＧ//宮下公園//夜
	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg083_01_3_宮下公園_a.jpg");
	Fade("back03", 0, 1000, null, false);

	IntermissionIn2();
//ＳＥ//ヒュンヒュンという機械的な音
	CreateSE("SE01","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
夜の宮下公園は、異様な雰囲気に包まれていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateSE("SE10","SE_はいけい_その目だれの目_大にん数");
	MusicStart("SE10", 0, 500, 0, 1000, null, true);

	Wait(500);

	CreateSE("SE11","SE_はいけい_その目だれの目");
	MusicStart("SE11", 0, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆※人数は１００人を想定しているのでそう聞こえるようにしていただけると助かります。延々と虚ろな声で繰り返し。以下指定解除があるまで続く。セリフではなくＳＥ扱いにして、テキストでは表示しないようにしたいです。
//【人々】
<voice name="人々" class="人々" src="voice/ch05/10000010hb">
「その目だれの目その目だれの目その目だれの目その目だれの目その目だれの目その目だれの目その目だれの目その目だれの目その目だれの目その目だれの目その目だれの目その目だれの目――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
公園の真ん中に、寄り添うように集まっている大集団がいた。

その数は１００人はくだらないだろう。

ほとんどが１０代と思われる男女ばかりで、高校の制服を着ている者がいたり、おしゃれな私服の少女もいたりする。

オタクっぽい眼鏡をかけた少年や、今の時代には珍しいガングロの女子高生もいた。

傍目からは、なにかのイベントでも行っているかと思われそうなものだが、よく観察してみると彼らの様子が尋常ではないのがよく分かるだろう。

誰も彼もうつむき気味で、目は焦点が定まっておらず虚ろだ。

これだけの人数が集まっていながら、互いに会話を交わすこともなく、その場にたたずんで一歩も動こうとしない。

口元にはいずれもかすかに笑みを浮かべ、ブツブツとなにかをつぶやいている。

彼らが一心不乱に繰り返しつぶやいているその言葉は、

――その目だれの目？

感情も、抑揚もなく、つぶやく程度の声で１００人の口から発せられるその言葉は、公園内にお経のように響き渡っていた。

当然ながら、彼らの奇異な姿のせいか、宮下公園には他にほとんど人影はなかった。

公園内を通り抜けようとした会社帰りのＯＬの女性も、散歩中なのか犬を連れて入ってきた中年女性も、異様な光景を前にギョッとして来た道を引き返していく。

唯一、彼ら異様な集団に注目している男がひとりだけいた。
どうやら彼もまた集団の関係者のようだが、集団の中には入らず少し離れた場所にポツンとひとりで立っている。

秋葉原なら問題なく溶け込めそうなそのファッション――チェックのシャツにジーパン、ボロボロのスニーカー、指出し手袋、赤いバンダナ、そして背中には緑色の大きなリュックサック。

かなりの肥満体型で、シャツのボタンは今にもはち切れそうだ。
もう１０月も下旬に入りかなり涼しいはずなのに、額からは常に汗が流れていて、しきりにハンドタオルでそれを拭っている。

周囲をキョロキョロと見回し落ち着かない様子だが、肩を揺らしながらニヤニヤと笑っているようでもある。

さっきから、集団が唱えるお経のような合唱とは別に、公園内には謎の機械音が響いていたが、その音は彼のリュックサックの中から発せられていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_食事減る","sigh", 200, @+150);
	FadeStand("buセナ_制服_食事減る_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
そこへまたひとり、今度はブレザーを着崩した女子高生が入ってきた。

彼女は、異様な集団を見てもひるむどころか、そのまま彼らを見据えてどんどん近づいていく。

長い黒髪を風になびかせながら歩く姿は、凛々しさに満ちていた。
それとは対照的に、なぜか手には半分ほど食べかけの棒アイスが握られている。

集団はそんな彼女にまったく注意を向けようとしない。
完全に自分の世界に入り込み、ただひたすら同じ言葉を連呼し続けるのみ。

彼女もまた、無視されていることに眉をひそめようともしない。

{	DeleteStand("buセナ_制服_食事減る_sigh", 500, true);
	Stand("stセナ_制服_食事減る","sigh", 200, @+150);
	FadeStand("stセナ_制服_食事減る_sigh", 500, true);}
そして集団の近くまで来ると、彼女は不意に立ち止まった。

{	Stand("stセナ_制服_食事かじる","sigh", 200, @+150);
	FadeStand("stセナ_制服_食事かじる_sigh", 300, true);
	DeleteStand("stセナ_制服_食事減る_sigh", 0, true);}
ひどく余裕のある態度で棒アイスをかじる。

{	Stand("stセナ_制服_食事棒","normal", 200, @+150);
	FadeStand("stセナ_制服_食事棒_normal", 300, true);
	DeleteStand("stセナ_制服_食事かじる_sigh", 500, true);}
咀嚼すると、シャリシャリという音が彼女の口から漏れ出た。

{	Stand("stセナ_制服_食事棒","sigh", 200, @+150);
	FadeStand("stセナ_制服_食事棒_sigh", 300, true);
	DeleteStand("stセナ_制服_食事棒_normal", 0, true);}
食べ終わって手に残った棒を眺めた少女は、小さく舌打ちをして足許に放り捨てる。

{	DeleteStand("stセナ_制服_食事棒_sigh", 500, true);
	Stand("stセナ_制服_通常","hard", 200, @+150);
	FadeStand("stセナ_制服_通常_hard", 500, true);}
相変わらずその眼差しは鋭く、視線はゆっくりと集団のひとりひとりの顔を移動していった。

//【リュック男】
<voice name="リュック男" class="リュック男" src="voice/ch05/10000020rm">
「おい、な、なんだよ、お前！」

リュック男が、我慢の限界とばかりに声を上げた。

さっきからこの男にだけ観察されていたことに、
当然ながら少女――蒼井セナ――は気付いていた。

{	DeleteStand("stセナ_制服_通常_hard", 500, true);}
彼女は嘲るように鼻を鳴らすと、唐突に両手を交差させながらまっすぐ前へと伸ばした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 500, 0, NULL);
	SetVolume("SE11", 500, 0, NULL);

//※可能ならセナのディソード顕現シーンはアニメーションがいいです！
//セナ・ディソード顕現パターン
//①胸の前へ両手を交差させるように伸ばし、手の平を開く
//②手許に最初はぼんやりと、剣の柄部分が水平状態で出現。それを両手で握る
//③ガラスラインの発光部分のうち、鍔部分の光だけが最初に空間に出現
//④鍔部分の中央がなにもないところから浮き上がってきて実体化し合体
//⑤鍔部分の両翼がなにもないところから浮き上がってきて実体化し合体
//⑥鍔部分の外周部がなにもないところから浮き上がってきて実体化し合体
//⑦剣部分のガラスライン発光部が、伸びていくように発光
//⑧衝撃波とともに剣部分が実体化（剣は水平状態）

	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Request("back14", AddRender);
	Fade("back14", 0, 0, null, false);
	Fade("back14", 300, 1000, null, true);

	CreateSE("SE02","SE_擬音_ディそーど出現");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
と、その手許の空間がかすかに歪み、ぼんやりと金属製の棒が浮かび上がってくる。

それは鍬か、スコップのように見えたが、いずれも形が微妙に違う。
先端が二股に分かれた鋭利な刃物だった。

やがてはっきりとした形となったそれを、セナは両手で握りしめる。

けれどそれだけでは終わらない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("back13", 500, 0, 0, 1280, 720, "BLUE");
	Fade("back13", 0, 300, null, false);
	Fade("back13", 300, 0, null, true);
	Delete("back13");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
直後に、セナが持った刃物の両端、そして向かって右側の空間に、青い光が灯る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_ディそーどかまえる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Stand("stセナ_制服_武器構え青","hard", 200, @+150);
	FadeStand("stセナ_制服_武器構え青_hard", 500, true);
	FadeDelete("back14", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
その青く光った空間に、さっきと同様に金属製のパーツが浮かび上がってきた。

形を為したそれは、物々しい音を立てながら最初の刃物状の棒に合体していく。

最終的にリングを形成し、そこからさらに右側に長い光の軌跡が伸びる。

その軌跡をなぞりながら、最後は二股に分かれた長い刃が浮かび上がった。

鍬かスコップだと思ったそれは、
気付けば巨大な剣へと形を変えていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_武器構え青_hard", 300, true);
	Stand("buセナ_制服_武器構え青","hard", 200, @+150);
	FadeStand("buセナ_制服_武器構え青_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603005]
――鋭利にして、流麗。
――清冽にして、破壊的。
――禍々しくも、美しく。

圧倒的な存在感を持って、その剣はセナの手に収まっていた。

リュック男はなんの反応も示さない。
ただ唇を尖らせてセナを眺めている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buセナ_制服_武器構え青_hard", 500, true);
	Stand("stセナ_制服_横向剣持ち青","hard_r", 200, @+150);
	FadeStand("stセナ_制服_横向剣持ち青_hard_r", 500, true);

	CreateSE("SE10","SE_はいけい_その目だれの目_大にん数");
	MusicStart("SE10", 2000, 500, 0, 1000, null, true);

	Wait(500);

	CreateSE("SE11","SE_はいけい_その目だれの目");
	MusicStart("SE11", 2000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【リュック男】
<voice name="リュック男" class="リュック男" src="voice/ch05/10000030rm">
「関係者じゃないだろ。あっち、行けよ」

口調はあくまで威圧的だ。男性にしては甲高い声で、セナとは距離を開けたまま手振りで去るように要求する。

対してセナも、顔色ひとつ変えずに静かに口を開いた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch05/10000040sn">
「……お前が責任者か？」

それは質問というよりは確認のための問いかけのようだった。

瞳が、リュック男へと向けられ、固定される。

それでリュック男は、それまでとは逆に明らかにうろたえ始めた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch05/10000050sn">
「答えろ。“<RUBY text="はたの">波多野</RUBY>”はどこだ？」

鼻白み、腰も引けているが、リュック男はその問いには答えなかった。

そんな２人のやり取りを、“その目だれの目”とつぶやきつづける集団はまったく意に介そうとしない。
というよりも、目に入っていないと言うべきだった。

セナとリュック男の間で、視線がぶつかり合う。

最初にそれをそらしたのは、リュック男だった。

//【リュック男】
<voice name="リュック男" class="リュック男" src="voice/ch05/10000060rm">
「だ、誰だよ、それ……」

//【リュック男】
<voice name="リュック男" class="リュック男" src="voice/ch05/10000070rm">
「例え知ってても、教えないけどな」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch05/10000080sn">
「…………」

{	CreateSE("SE03","SE_擬音_ディそーどかまえる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Stand("stセナ_制服_武器構え青","hard", 200, @+150);
	DeleteStand("stセナ_制服_横向剣持ち青_hard_r", 300, false);
	FadeStand("stセナ_制服_武器構え青_hard", 400, true);}
//■３６０
//セナは押し黙ると、持っている大剣を両手で軽々と振り回し、居合いのような構えを取った。
//グッと腰を落とし、上半身を前のめりにする。
{#TIPS_霞の構え = true;$TIPS_on_霞の構え = true;}
セナは押し黙ると、持っている大剣を両手で軽々と振り回し、<FONT incolor="#88abda" outcolor="BLACK">霞の構え</FONT>を取った。
グッと腰を落とし、上半身を前のめりにする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼TIPS：解除：霞の構え
	$TIPS_on_霞の構え = false;

//ＣＧ//セナ・ディソードリアルブート

	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Fade("back14", 0, 0, null, false);
	Fade("back14", 300, 1000, null, true);

	CreateSE("SE03","SE_衝撃_衝撃は_リアルぶーと");
	MusicStart("SE03", 500, 1000, 0, 1000, null, false);

	Stand("stセナ_制服_武器構え","hard", 200, @+150);
	FadeStand("stセナ_制服_武器構え_hard", 0, true);
	DeleteStand("stセナ_制服_武器構え青_hard", 0, true);

	Fade("back14", 300, 0, null, true);

	Delete("back14");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch05/10000090sn">
「誤解するな」

剣が再び発光する。

だがその色は最初のような青ではなく、紫がかった赤い光だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面エフェクト//ぼかしのようなもの。振動しているイメージ
//ＳＥ//女性の悲鳴のような共鳴音
//※リアルブート完了まで続く

	CreateTextureEX("Blur", 1000, Center, Middle, "SCREEN");
	Request("Blur", Smoothing);
	SetAlias("Blur", "Blur");

	Fade("Blur", 0, 300, null, true);

	CreateColor("back13", 1500, 0, 0, 1280, 720, "RED");
	Fade("back13", 500, 300, null, false);

	CreateSE("SE02","SE_擬音_共鳴音_女性悲鳴のよう");
	MusicStart("SE02", 500, 1000, 0, 1000, null, false);

	CreateProcess("プロセス１", 1000, 0, 0, "Blur3");
	Request("プロセス１", Start);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
突如鳴り響く、女性の甲高い悲鳴のような音。

空気が震える。

それは感覚的な意味ではなく。

物理的な意味においてだった。

セナが持つ大剣を中心として、空間そのものが振動する。

剣の赤い輝きがまぶしいほど強烈になっていく。

セナは小さく息をつき――
奥歯を、ギリリと噛みしめた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 0, 0, NULL);

//ＳＥ//衝撃波
//画面エフェクト//衝撃波
	CreateColor("back14", 2000, 0, 0, 1280, 720, "White");
	Fade("back14", 0, 0, null, false);
	Request("back14", AddRender);

	CreateSE("SE03","SE_衝撃_衝撃は_リアルぶーと");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Fade("back14", 1000, 1000, null, true);

	Delete("プロセス１");
	Delete("Blur");
	Delete("back13");
	DeleteStand("stセナ_制服_武器構え_hard", 0, true);
	
	Stand("buセナ_制服_武器構え","hard", 200, @+150);
	FadeStand("buセナ_制服_武器構え_hard", 0, true);

	Wait(500);

	Fade("back14", 500, 0, null, false);
	CreateColor("back13", 1500, 0, 0, 1280, 720, "RED");
	Request("back13", AddRender);
	Fade("back13", 0, 800, null, true);
	DrawTransition("back13", 200, 0, 1000, 100, null, "cg/data/lightn7.png", true);
	DrawTransition("back13", 200, 1000, 0, 100, null, "cg/data/zoom1.png", true);

	Delete("back14");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
衝撃音が轟く。

幾筋もの電撃が迸る。

振動する空気を吹き飛ばすかのようなソニックウェーブが放出される。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 2000, 0, NULL);
	SetVolume("SE11", 2000, 0, NULL);

//※リアルブート完了。この時点で周囲の人たちにもセナの持つ剣が見えるようになる
//ＢＧ//宮下公園//夜
	CreateBG(100, 500, 0, 0, "cg/bg/bg083_01_3_宮下公園_a.jpg");
	CreateSE("逃げ出す","SE_はいけい_生と_悲鳴とどよめき_2");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
空間の振動はすぐに収まった。

だが剣は赤い輝きを明滅させ続けており、それはさながら血の脈動を思わせる。

セナは剣の切っ先を、ゆっくりとリュック男へ向けた。

{	MusicStart("逃げ出す", 800, 400, 0, 1000, null, true);}
さすがに、ひたすら無関心だった集団も動揺を見せた。みんな我に返ったように驚き、訳も分からないまま我先にと逃げ出していく。

セナはそんな彼らには目もくらず、ひたすらリュック男だけを見据えていた。

{	MusicStart("逃げ出す", 3000, 0, 0, 1000, null, false);}
//【リュック男】
<voice name="リュック男" class="リュック男" src="voice/ch05/10000100rm">
「ひいいぃぃっ」

それまで明確な怯えを見せなかったリュック男もまた、激しくうろたえ始める。

顔色を青くしながら、一歩ずつ後ずさっていく。

イヤイヤをするように首を振った。

//【リュック男】
<voice name="リュック男" class="リュック男" src="voice/ch05/10000110rm">
「ま、まま、待って！　俺は、波多野なんてヤツ、本当に、し、しし、知らないんだっ！　ただ、し、指示されただけ――」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch05/10000120sn">
「……誤解するな、と言ったはず」

男の懇願を、セナは一顧だにしようとしなかった。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch05/10000130sn">
「質問したのはただの挨拶代わりだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch05/10000140sn">
「お前がなにを答えたって、“それ”を壊すことに、変わりはない」

彼女の瞳に、ギラリとした輝きが宿る。

リュック男は情けない声を上げながら、踵を返して逃げ出そうとした。

ところが男が振り返ったその先には、逃げ惑う集団がいた。

逃げ道を塞がれてしまい、焦った男はつんのめるようにして立ち止まる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_武器構え","angry", 200, @+150);
	FadeStand("buセナ_制服_武器構え_angry", 300, true);
	DeleteStand("buセナ_制服_武器構え_hard", 0, true);
	Wait(500);
	DeleteStand("buセナ_制服_武器構え_angry", 300, true);
	CreateSE("SE05","SE_擬音_ちを蹴る");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
そのときには、セナが地面を蹴って一気に距離を詰め、男のすぐ背後まで迫っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ディソードを振り回す
//画面エフェクト//斬るエフェクト（なぎ払い）
//ＳＥ//機械が破壊される音
	CreateTextureEX("セナ剣エフェクト", 200, center, Middle, "cg/bg/bg250_02_6_斬撃汎用横_a.jpg");
	Zoom("セナ剣エフェクト", 0, 1500, 1500, null, true);
	Rotate("セナ剣エフェクト", 1, @0, @0, @30, null,true);
	Request("セナ剣エフェクト", AddRender);

	CreateSE("SE03","SE_擬音_きかい切る音");

//	CreateTexture360("back03", 100, -350, Middle, "cg/ev/ev045_01_3_INT16セナ機械破壊_a.jpg");
//	CreateTextureEX("back09", 100, -350, Middle, "cg/ev/ev045_01_3_INT16セナ機械破壊_a.jpg");
	CreateTexture360("back03", 100, -448, Middle, "cg/ev/ev045_01_3_INT16セナ機械破壊_a.jpg");
	CreateTextureEX("back09", 100, -448, Middle, "cg/ev/ev045_01_3_INT16セナ機械破壊_a.jpg");
	CreateColor("色１", 200, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, true);


	CreateMovie360("ムービー１", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");
//	Request("ムービー１", Play);

	SetVolume("SE01", 0, 0, NULL);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Fade("色１", 0, 1000, null, true);
	Fade("セナ剣エフェクト", 0, 1000, null, true);

	WaitAction("ムービー１", 1500);

//	Move("back03", 2000, @350, 0, Dxl2, false);
	Fade("セナ剣エフェクト", 1000, 0, Axl1, false);
	Move("back03", 2000, @448, 0, Dxl2, false);
	Fade("ムービー１", 300, 0, null, false);
	Fade("色１", 300, 0, null, true);

	Fade("色１", 100, 800, null, true);
	Fade("色１", 300, 0, null, true);
	Wait(300);
	Fade("色１", 100, 300, null, true);
	Fade("色１", 100, 0, null, true);
	Fade("色１", 100, 300, null, true);
	Fade("色１", 100, 0, null, true);
	Wait(100);
	Fade("色１", 100, 500, null, true);
	Fade("色１", 200, 0, null, true);
	Fade("色１", 100, 700, null, true);
	Fade("色１", 300, 0, null, true);

	Fade("back09", 1000, 1000, null, true);
	Delete("セナ剣エフェクト");
	Delete("ムービー１");
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
それは、

セナの細腕からは想像できないほどの、

//疾く＝はやく
あまりに疾く破壊的な一撃。

水平になぎ払われた刃は、男が背負っていたリュックを中身ごと破砕した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//▼べー：ムービー：停止位置調整
	CreateSE("SE05","SE_衝撃_どさっ");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 0, 0, 0, "cg/bg/bg083_01_3_宮下公園_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
衝撃で男も吹っ飛ばされる。

地面に倒れ込んだ男は、全身を震わせながら、頭を抱えて丸くなってしまう。
もはや逃げる気力すら喪失したようだった。

恐怖のあまり失禁し、男のズボンの股間部分がジワジワと湿っていく。

セナはそこに歩み寄ると、男の方には関心を示さず、ボロボロに引きちぎられたリュックと、その切り口からのぞく中身に視線を落とした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("サウンド１","SE_戦闘_でん撃_でん気火花");
	Request("サウンド１", Lock);
	SoundPlay("サウンド１",0,800,true);
	CreateBG(100, 500, 0, 0, "cg/bg/bg149_01_2_リュック_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602011]
リュックの中では、スパーク音とともに小さな火花が散っている。

中には機器が入っていた。

元はモデムを一回り大きくしたような形だったと思われるが、ディソードに抉られていまやメチャメチャに破壊されてしまっている。もう使い物にはならないだろう。

数秒前までこのリュックの中から聞こえていた耳障りな機械音は、今は聞こえない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//リュックの開口部を拡大
//※機器にはNOZOMIの文字が刻印されている
	Request("back*", Smoothing);

//	Move("back*", 4000, -800, -130, null, true);
	Move("back*", 2000, -1024, -166, Axl2, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch05/10000150sn">
「ＮＯＺＯＭＩ……」

誰にともなくつぶやいたセナの口振りからは、憎悪の感情がにじみ出ていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(1000);
	Request("サウンド１", UnLock);
	SetVolume("サウンド１", 3000, 0, NULL);
	Wait(1500);
//～～Ｆ・Ｏ




//■インターミッション１６終了
//アイキャッチ

}

..//振動用
function Blur3()
{
	Shake("@Blur", 1000, 0, 0, 5, 5, 1000, null, true);
	while(1)
	{
	Shake("@Blur", 500, 5, 5, 5, 5, 1000, null, true);
	}

}