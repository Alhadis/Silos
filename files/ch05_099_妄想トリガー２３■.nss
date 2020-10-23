//<continuation number="770">




chapter main
{

	$PreGameName = "boot_第五章";

	if($GameStart != 1)
	{
		$GameName = "ch05_099_妄想トリガー２３■";
		$GameContiune = 1;
		Reset();
	}

		ch05_099_妄想トリガー２３■();
}


function ch05_099_妄想トリガー２３■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("back12", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("back12", 0, 1000, null, true);
	CreateSE("SE10","SE_日常_PC_はーどでぃすく_LOOP");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE10", 0, 1000, 0, 1000, null, true);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１３へ
//ネガティブ妄想→分岐１４へ
//妄想しない→分岐１５へ

if($妄想トリガー通過２３ == 0)
{
	SetChoice03("ポジティブ妄想","ネガティブ妄想","妄想しない");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA03();
			$妄想トリガー２３ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー２３ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー２３ = 0;
		}
	}
}



//=============================================================================//

if($妄想トリガー２３ == 2)
{
//☆☆☆
//分岐１３
//フラグ【５章梨深Ｙシャツ】ＯＮ
	$５章梨深Ｙシャツ = true;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
どうしていいか分からなくて、僕はそっと梨深の表情を窺った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//下着にＹシャツだけ着た姿でソファに座りこっちを見ている梨深
//※膝抱えて座ってる感じで
	CreateTextureEX("back03", 100, center, Middle, "cg/ev/ev044_01_2_梨深下着Yシャツ_a.jpg");
	Request("back03", Smoothing);

	Zoom("back03", 0, 500, 500, null, false);

	Fade("back03", 500, 1000, null, true);

	Delete("back12");

	Wait(500);

	BGMPlay360("CH05", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900010ta">
「…………！」

え、な、ちょ……
なんで？
なんでなんで？

頭の中が真っ白になった。

突然の、とんでもない成り行きに思考がついて行けない。<k>
指一本すら動かすことができなくなる。<k>
ビックリしすぎて、声すら出ない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900020ri">
「どうかした？」

梨深はいつの間にか、制服のジャケットを脱いでいた。
それだけじゃない、よく見ると、ス、ス、スカートも脱いでる……。

しかもそんな過激な格好なのに、さらに膝を抱えるようにして座っているから……“はいてない”ようにも見えるじゃないかぁっ！

つまり……つまりだ……。

今、すぐ隣で首を傾げながら僕を見ている梨深は――

下着の上にＹシャツを着ているだけ……。

そのとき脳裏に最初に浮かんだのは、家庭教師モノの名作エロゲだった。

『めげないエミリ先生』ってタイトルで、その第３章が今僕が現実に体験しているのとまったく同じシチュエーションだった。

ま、まさか“それなんてエロゲ”が現実になるなんて……。

これは妄想か？
幻覚か？
それとも……ガチか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//可能なら梨深の胸元をアップにする
	Zoom("back03", 3000, 1000, 1000, AxlAuto, 1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
妄想だろうがガチだろうが、とにかく目の前にエロい格好の梨深がいるのは確かで。

ついつい、目が彼女の胸へと行ってしまう。

Ｙシャツの胸元ははだけられていて、角度的に、チラチラと見えるんだ。

薄いピンク色の、ブラが。

い、意外と、む、むむ、胸大きいですね、咲畑さん。

って、ダメだダメだ！　ジロジロ見たらヘンタイだと思われる！　見るな！　見ちゃダメだ！

僕は視線を落とした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("back03", 3000, @-128, @-384, null, 1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
そしたら、今度は彼女の腰あたりを見る形になった。

やっぱスカートはいてＮＥＥＥＥ！！

パ、パパパ、パンツ見えますよ咲畑さん！

けっこうシンプルな、でもかわいらしいパンツですねハァハァ……

ま、まずい、ムスコがスタンドアップしてきた……。

さっきから、梨深の身体からいい香りが漂ってくるし、なんていうか、肌の質感みたいなものが、フィギュアや二次元とは段違いだ……。

こ、これが三次元の力なのか……
正直、エロすぎだろ……

これまでの僕の価値観が、一気に塗り替えられかねない。
僕は三次元には興味ないつもりだったのに。
二次元キャラだけを愛していたのに。

//■３６０
//そんな価値観なんて一撃で破壊されるほどの破壊力が、今の梨深にはあった。
{	Move("back03", 3000, @+80, @+320, null, false);}
そんな価値観なんて一撃でぶっ飛んでしまうほどの破壊力が、今の梨深にはあった。

少し興奮しているように聞こえるかすかな吐息。

繊細に揺れている艶やかな髪。

呼吸する度にわずかに上下する胸元。

悩ましげに太ももをもぞもぞと擦り合わせているその仕草。

濡れた瞳。半開きになった唇からのぞくピンク色の舌。

息苦しい。

頭がボーッとしてくる。
なんだこれ。

エロゲでエッチシーンに入ったときに感じるような、むずがゆいような、切ないような感覚。

冷静でいられない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back04", 100, center, Middle, "cg/ev/ev044_01_2_梨深下着Yシャツ_a.jpg");
	Request("back04", Smoothing);

	Zoom("back04", 0, 500, 500, null, false);

	Fade("back04", 500, 1000, null, true);

	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900030ri">
「ねえ、タク」

甘い声で、梨深が呼びかけてくる。

僕はもう梨深の肢体から目を離せられなくなっていた。

こんな間近で、年頃の女の子の身体を見るのは初めてだった。

梨深は、僕を誘ってるのかな……？
僕のことを、好きなのかな……？

ホントはこんなハレンチな誘われ方は好きじゃない。

やっぱり恋愛はプラトニックに想いを育んでいって、卒業式の日に伝説の木の下で、恥ずかしがりながらも勇気を振り絞って告白してもらいたい。

それでこっちがＯＫしたら嬉しさのあまり泣き出して、そのままキスして――

とか思っていたけど、目の前でこんな格好で誘われたらプラトニックもクソもなかった。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900040ri">
「あたし、のど渇いてきちゃった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900050ri">
「なにか飲み物ある？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900060ta">
「……っ」

この悶々としそうな空気に耐えられなくなって、僕は勢いよく立ち上がった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	CreateBG(100, 500, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
えーっと、飲み物……飲み物……

冷蔵庫の中になにか入ってたっけ？

僕の飲みかけのコーラならあるけど、あれはペットボトルから直接口を付けて飲んでるから、梨深にあげるのはさすがにまずいし……

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900070ri">
「ないなら、買ってこようかな。
コンビニって神泉の駅前にあったよね？」

背後で、梨深が立ち上がる気配。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900080ri">
「ちょっと行ってくる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900090ta">
「え……！？」

行ってくる！？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//拓巳の部屋の扉が開く音
	SetVolume360("CH05", 500, 0, NULL);
	CreateSE("SE05","SE_日常_扉_開ける");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 500, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
慌てて振り返ったときには、梨深はあの恥ずかしい格好のまま、扉を開けて外に出て行くところだった。

//ＳＥ//拓巳の部屋の扉が閉まる
{	CreateSE("SE05","SE_日常_扉_閉まる");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 200, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900100ta">
「ちょ…………」

パンツ丸出しで、コンビニで買い物……！？
異常だ……。

り、梨深って露出狂だったの……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	DelusionOut();

	Delete("*");

	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

	DelusionOut2();
	PositiveHuman();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆背後から聞こえてくる
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900110ri">
「ろしゅつきょう？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900120ta">
「うわあああっ！」

{	CreateSE("SE05","SE_じん体_動作_尻餅");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);}
背後から聞こえた声に、文字通り飛び上がってから尻餅をついた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","shock", 200, @+100);
	FadeStand("st梨深_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//ＣＨ//梨深
そこには、たった今出ていったはずの梨深が立っていた。

しかもちゃんと服を着ている状態で。

目を丸くして、僕を見下ろしている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900130ta">
「あ……え……？」

{	Stand("st梨深_制服_通常","normal", 200, @+100);
	FadeStand("st梨深_制服_通常_normal", 300, true);
	DeleteStand("st梨深_制服_通常_shock", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900140ri">
「ビックリしたー」

{	Stand("st梨深_制服_通常","hard", 200, @+100);
	FadeStand("st梨深_制服_通常_hard", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900150ri">
「急に大声出さないでよー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900160ta">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900170ri">
「さっきから変だよ？　ひとりでブツブツ言い出したかと思ったら急に大声あげるし」

{	Stand("st梨深_制服_通常","normal", 200, @+100);
	FadeStand("st梨深_制服_通常_normal", 300, true);
	DeleteStand("st梨深_制服_通常_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900180ri">
「どうかしたの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
なんで、ここに梨深がいるんだろう？

確かに出ていったはずなのに。

も、もしかして今見ていたあのエロい梨深は……

妄想！？

エロ梨深には、ものすごい存在感があった。

触れたわけじゃないけど、肌なんて触ったらプニプニと柔らかそうだっていうのが見ただけで伝わってきたし……ってなにを言ってるんだ僕は……！

今日はどうかしてる……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","normal", 200, @+100);
	FadeStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900190ri">
「ねえ、タク」

呼びかけられて、ギクリとした。

軽蔑されたかな……？

愛想を尽かされたらどうしよう。
梨深に一緒にいてもらわないと、僕はもうひとりじゃ外出すらできないのに――

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900200ri">
「あたし、のど渇いてきちゃった」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900210ta">
「へ……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900220ri">
「なにか飲み物ある？」

さっきとまったく同じことを問いかけられた。

ただ、さっきはやたらエロい口調だったけど、今はいたって普通だ……

僕は反射的に小さく首を振っていた。

すると梨深はこめかみに人差し指を突き立て、考えこむかのように唇をつぼめた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900230ri">
「ないなら、買ってこようかな。
コンビニって神泉の駅前にあったよね？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900240ri">
「ちょっと行ってくる」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_通常_normal", 500, true);

//ＳＥ//拓巳の部屋の扉を開けて、閉める

	CreateSE("SE01","SE_日常_扉_開ける");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");
	Fade("back04", 200, 1000, null, true);

	Wait(500);

	SoundStop2("SE01");
	CreateSE("SE02","SE_日常_扉_閉まる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back12", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("back12", 200, 1000, null, true);


//	Delete("back03");
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
にっこりと微笑んでから、僕の答えも聞かずに部屋を出て行ってしまった。

僕はただ呆然と、それを見送ることしかできない。

制服姿で、コンビニで買い物……
普通だ……。

やっぱり、エロ梨深は妄想だった……ってことだよね……。

ホッとしたような、少し残念なような、複雑な気持ちだった。

でも――

エロ梨深。分裂したあやせ。

それらを妄想によってリアルに感じられるくらい再現できたのは、いったいどんな仕組みなんだろう。

そもそも僕が再現したのかな？

僕には力があるのか、ないのか。
あるとしたら、どうやれば使えるのか。
ディソードはどうすれば手に入るのか。

問題はまだまだ山積みで、僕は途方に暮れるしかなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(1000);
	Wait(1000);
//～～Ｆ・Ｏ
//合流５へ

}

//=============================================================================//

if($妄想トリガー２３ == 1)
{
//☆☆☆
//分岐１４
//フラグ【５章梨深私服】ＯＮ
	$５章梨深私服 = true;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
どうしていいか分からなくて、僕はそっと梨深の表情を窺った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//私服姿でソファに座りこっちを見ている梨深
//※『下着にＹシャツ姿』のＣＧの服装違い

	CreateTextureEX("back03", 100, center, Middle, "cg/ev/ev044_02_2_梨深下着Yシャツ_a.jpg");
	Fade("back03", 500, 1000, null, true);

	Delete("back12");

//	Stand("bu梨深_私服_通常","normal", 200, @+100);
//	FadeStand("bu梨深_私服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900250ta">
「…………？」

あ……れ？

梨深の着ている服が、いつの間にか変わっている。

さっきまで制服を着てたはずなのに……。

僕が目をつむっているほんの短い時間でこっそり着替えた……はずはないよなあ……。

突然の変化に、思考がついて行けない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900260ri">
「どうかした？」

梨深は首を傾げている。

着ているものが変わったことについてなにも言い出さない。

どういうことなんだろう。

梨深は、自覚していないの？
それとも、とぼけてるの？

あまりジロジロ見ないようにはしながらも、彼女の服装をチェックしてみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("back03", 4000, @0, @-80, AxlDxl, 1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
これって、私服……かな？

これまで制服姿しか見たことがなかったから、すごく新鮮な感じだ。

上はデニムっぽいジャケット、下はミニスカート。
さっきまで穿いていたオーバーニーソックスは今は身に着けていない。

つまり……生足。
すべすべしていそうな、肉感的な太もも。

しかもけっこうなミニスカートなのに膝を抱えるようにして座っているから……そのぅ……パ、パンツが見えそうですよ、咲畑さん……。

っていうか、角度によっては“はいてない”ようにも見えるよっ。

ついつい、スカートの中のＶゾーンへと目が行っちゃいそうになる。
その欲情を必死に理性で抑えつけた。

この座り方は――

脳裏に浮かんだのは、名作萌えエロゲのパッケージ絵だった。

『すてあね』っていう、アニメ化もされたタイトルの初回限定版が、まさに今の梨深のような座り方をしたヒロインのイラストだった。

あのイラストは萌え萌えだったなあ。

一時期、ＰＣの壁紙として使ってたくらいだ。

これは妄想か？
幻覚か？
それとも……ガチか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	WaitAction("back03", null);
	Move("back03", 2000, 0, 0, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//おがみ：音声修正
//【拓巳】
//<voice name="拓巳" class="拓巳" src="voice/ch05/09900270ta">
<voice name="拓巳" class="拓巳" src="voice/ch01/01800650ta">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900280ri">
「…………」

ま、まずい、梨深のスカートの中身が気になって、ムスコがスタンドアップしてきた……。

さっきから、梨深の身体からいい香りが漂ってくるし、なんていうか、肌の質感みたいなものが、フィギュアや二次元とは段違いだ……。

こ、これが三次元の力なのか……

これまでの僕の価値観が、一気に塗り替えられかねない。
僕は三次元には興味ないつもりだったのに。
二次元キャラだけを愛していたのに。

//そんな価値観なんて一撃で破壊されるほどの破壊力が、今の梨深にはあった。
//■３６０
そんな価値観なんて一撃でぶっ飛んでしまうほどの破壊力が、今の梨深にはあった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back04", 100, center, Middle, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("back04", 500, 1000, null, true);
	Stand("bu梨深_私服_正面","normal", 200, @+100);
	FadeStand("bu梨深_私服_正面_normal", 500, true);
	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
//◆普通の感じで
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900290ri">
「ねえ、タク」

相変わらず梨深は、服装が変わったことを気にする素振りも見せず、無邪気な笑顔を向けてくる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900300ri">
「あたし、のど渇いてきちゃった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900310ri">
「なにか飲み物ある？」

//おがみ：音声修正
//【拓巳】
//<voice name="拓巳" class="拓巳" src="voice/ch05/09900320ta">
<voice name="拓巳" class="拓巳" src="voice/ch05/09900270ta">
「あ、え……っと……」

このままだと理性が決壊しそうだったから、これを幸いにと立ち上がり、冷蔵庫の前へ。

//ＢＧ//拓巳の部屋（冷蔵庫前）
{	DeleteStand("bu梨深_私服_正面_normal", 500, true);
	CreateSE("SE05","SE_じん体_動作_手_冷蔵庫を開ける");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);}
冷蔵庫を開けてのぞき込む。

僕の飲みかけのコーラならあるけど、あれはペットボトルから直接口を付けて飲んでるから、梨深にあげるのはさすがにまずいし……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_私服_通常","normal", 200, @+100);
	FadeStand("st梨深_私服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900330ri">
「ないなら、買ってこようかな。
コンビニって神泉の駅前にあったよね？」

背後で、梨深が立ち上がる気配。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900340ri">
「ちょっと行ってくる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900350ta">
「あ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_私服_通常_normal", 500, true);

//ＳＥ//拓巳の部屋の扉を開けて、閉める

	CreateSE("SE01","SE_日常_扉_開ける");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");
	Fade("back03", 300, 1000, null, true);

	Wait(500);

	CreateSE("SE02","SE_日常_扉_閉まる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back12", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("back12", 300, 1000, null, true);

	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
にっこりと微笑んでから、僕の答えも聞かずに部屋を出て行ってしまった。

ひとり取り残されて、考え込む。

今の現象が、いったいなんだったのか。

やっぱり、妄想……なのかな……。

梨深の服装。分裂したあやせ。

それらを妄想によってリアルに感じられるくらい再現できたのは、いったいどんな仕組みなんだろう。

そもそも僕が再現したのかな？

僕には力があるのか、ないのか。
あるとしたら、どうやれば使えるのか。
ディソードはどうすれば手に入るのか。

問題はまだまだ山積みで、僕は途方に暮れてしまう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//勢いよく拓巳の部屋の扉が開く

	CreateSE("SE01","SE_日常_扉_開ける");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");
	Fade("back04", 200, 1000, null, true);

	Wait(500);

//ＣＨ//梨深（制服）
	Stand("st梨深_制服_通常","normal", 200, @+100);
	FadeStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900360ri">
「ただいまっ」

と、たった今出て行ったばかりの梨深が戻ってきた。
しかも、その服装は――

制服……だ……。

今度は外で早着替えしてきたとでも言うの？
なんのために？

{	Stand("st梨深_制服_右向き","hurry", 200, @+100);
	FadeStand("st梨深_制服_右向き_hurry", 400, false);
	DeleteStand("st梨深_制服_通常_normal", 400, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900370ri">
「たはは、あたし財布持ってくの忘れてた」

梨深は僕の惑いに気付いてないみたいで、苦笑しながら自分のバッグから財布を取り出した。

{	Stand("st梨深_制服_通常ビシッ！","normal", 200, @+100);
	DeleteStand("st梨深_制服_右向き_hurry", 500, false);
	FadeStand("st梨深_制服_通常ビシッ！_normal", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900380ri">
「ビシッ！　それじゃ、改めて買ってくるねー」

{	DeleteStand("st梨深_制服_通常ビシッ！_normal", 500, true);
	CreateSE("SE02","SE_日常_扉_閉まる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateTextureEX("back12", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("back12", 200, 1000, null, true);
	Delete("back04");}
そして、やっぱり服装のことにはなにも触れずに、
また出て行ってしまった。

僕はこめかみを指で押さえて、思わずうめき声を上げる。

誰か、今の不思議な現象を説明してくれ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	NegativeHuman();

	ClearAll(1000);
	Wait(1000);

//～～Ｆ・Ｏ
//合流５へ

}

//=============================================================================//

if($妄想トリガー２３ == 0)
{

//☆☆☆
//分岐１５

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
どうしていいか分からなくて、僕はそっと梨深の表情を窺った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//制服姿でソファに座りこっちを見ている梨深
//※『下着にＹシャツ姿』のＣＧの服装違い

	CreateTextureEX("back03", 100, center, Middle, "cg/ev/ev044_03_2_梨深下着Yシャツ_a.jpg");
	Fade("back03", 500, 1000, null, true);

	Delete("back12");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900390ta">
「…………っ」

っていうか、そ、そ、その座り方は反則だろ……。

そんな短いスカートなのに膝を抱えるようにして座っているから……そのぅ……パ、パンツが見えそうですよ、咲畑さん……。

っていうか、角度によっては“はいてない”ようにも見えるよっ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("back03", 4000, @0, @-80, AxlDxl, 1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601020]
ついつい、太ももの付け根――Ｖゾーンへと目が行っちゃいそうになる。その欲情を必死に理性で抑えつけた。

この座り方は――

脳裏に浮かんだのは、名作萌えエロゲのパッケージ絵だった。

『すてあね』っていう、アニメ化もされたタイトルの初回限定版が、まさに今の梨深のような座り方をしたヒロインのイラストだった。

あのイラストは萌え萌えだったなあ。

一時期、ＰＣの壁紙として使ってたくらいだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	WaitAction("back03", null);
	Move("back03", 2000, 0, 0, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900400ri">
「ねえ、タク」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900410ta">
「は、はいっ？」

まずい、キョドってしまった。

だって、僕のすぐ隣で膝を抱え、首を傾げながら、僕を見つめてくる三次元女子がいるんだぞ。

そ、そんなかわいい仕草されたら……萌え死ぬ……。
二次元じゃないのに……。

そんな僕のリビドー丸出しの思考とは裏腹に、
梨深が口にした言葉は――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back04", 100, center, Middle, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("back04", 500, 1000, null, true);

	Stand("bu梨深_制服_正面","sad", 200, @+150);
	FadeStand("bu梨深_制服_正面_sad", 500, true);

	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//◆思い詰めた口調で
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900420ri">
「タクは……自分の未来を考えたことある？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900430ta">
「え……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900440ri">
「例えば――」

{	Stand("bu梨深_制服_正面","hard", 200, @+150);
	FadeStand("bu梨深_制服_正面_hard", 500, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900450ri">
「人を含めてすべての生き物は、生きてるだけで、なにかを傷つけてるんだよ」

どこか、思い詰めたような表情。
なにが言いたいんだろう？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900460ri">
「分かる？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900470ta">
「えっと……だから？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900480ri">
「だからね――」

{	Stand("bu梨深_制服_正面","normal", 200, @+150);
	FadeStand("bu梨深_制服_正面_normal", 500, true);
	DeleteStand("bu梨深_制服_正面_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900490ri">
「……無理、しないでいいからね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900500ta">
「……？」

無理に学校行かなくてもいいってことかな？

無理にエンスーで廃人プレイせずにもっと健康的な生活を送れってことかな？

それとも、無理に理性を抑えつけずに、欲情したら襲っちゃっても構わないよ、って誘ってるのかな？

さすがにそれはないか、ふひひ……。

{	DeleteStand("bu梨深_制服_正面_normal", 500, true);}
//ＢＧ//拓巳の部屋
//◆伸びをする
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900510ri">
「ん～～～」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_正面","normal", 200, @+100);
	FadeStand("st梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
梨深は大きく伸びをすると、勢いよく立ち上がった。

僕の顔の前で、彼女のスカートの裾がふわりと揺れる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900520ri">
「あたし、のど渇いちゃった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900530ri">
「なにか飲み物ある？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900540ta">
「あ、え……っと……」

僕も立ち上がり、冷蔵庫の前へ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_じん体_動作_手_冷蔵庫を開ける");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
冷蔵庫を開けてのぞき込む。

僕の飲みかけのコーラならあるけど、あれはペットボトルから直接口を付けて飲んでるから、梨深にあげるのはさすがにまずいし……

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900550ri">
「ないなら、買ってこようかな。
コンビニって神泉の駅前にあったよね？」

背後で、梨深が立ち上がる気配。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900560ri">
「ちょっと行ってくる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900570ta">
「あ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_正面_normal", 500, true);

//ＳＥ//拓巳の部屋の扉を開けて、閉める

	CreateSE("SE01","SE_日常_扉_開ける");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");
	Fade("back04", 300, 1000, null, true);

	Wait(500);

	CreateSE("SE02","SE_日常_扉_閉まる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back12", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("back12", 300, 1000, null, true);

	Delete("back04");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
にっこりと微笑んでから、僕の答えも聞かずに部屋を出て行ってしまった。

はあ……やっぱり女子とふたりきりって、緊張するなあ。

しかも梨深は、意識してるのかしてないのか――たぶんしてないんだろう――たまに僕がドキッとなるような仕草を見せてくるし。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900580ta">
「…………」

//◆匂いを嗅いでいる。わざとらしくそのまんま読んでください
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900590ta">
「くんかくんか」

部屋の空気の匂いを吸い込んでみた。

フローラルな残り香が漂っているような気がした。

//※わざと「にほひ」です
これぞ女子のにほひ。
梨深のにほひ。
すーすーはー。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900600ta">
「…………最低だ」

イスにがっくりと腰を落とし、僕は自分の下品な行為にたまらず頭を抱えてしまった。

僕は、『将軍』や優愛に怯えていたはずなのに、今やすっかり舞い上がっちゃってるよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(1000);
	Wait(1000);

//～～Ｆ・Ｏ
//合流５へ

}

//=============================================================================//

//☆☆☆
//合流５

	CreateTextureEX("back12", 2000, 0, 0, "cg/bg/bg139_02_3_特許_a.jpg");
	Fade("back12", 1000, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
梨深が買い出しに行っている間に、さらに特許のことや思考盗撮のことを詳しく調べてみようと、ＰＣ画面に向かった。

するとグリムがチャット部屋にいて、僕を呼んでいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//チャット画面
//※この時点でチャット上にグリムの書き込みがすでにたくさんあるといいです

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	ChatMain(420,-54,"001");

	Fade("背景１", 0, 1000, null, false);
	Fade("box01", 0, 1000, null, true);

//ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text027]
グリム：ナイトハルト、いるか？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text028]
グリム：おーいナイトハルト！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text029]
グリム：どうせ今日も引きこもってるんだろ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text030]
//※わざとスペース開けてます
グリム：チャット　や　ら　な　い　か
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text031]
グリム：新情報だおー！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text032]
グリム：ナイトハルトちゃ～ん？　ご飯よ～？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//ウェブＣＨＡＴ終了

	CreateSE("SE04","SE_日常_PC_マウスくりっく");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);


	FadeDelete("back12", 0, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text033]
ため息をつき、仕方なく入室する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

	ChatPerson("002");

	CreateSE("SE02","SE_日常_PC_ちゃっと_参加音");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text034]
ナイトハルトさんが入室しました
現在のメンバー：２人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text035]
グリム：やっとｷﾀｰ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text036]
グリム：来るの遅すぎだお、ナイトハルト
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text037]
グリム：おかげで漏れ、その目だれの目状態
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1000");

//ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text038]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900610ta">
「…………」

くそ、なんだよ“その目だれの目状態”って。

グリムはそれを使いたいだけちゃうんかと。

僕はその言葉を見るたびに、ビクビクさせられるって言うのに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text039]
ナイトハルト：なんだよ、新情報って
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text040]
グリム：そんなのニュージェネのことに決まってるお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text041]
グリム：起きたんだよ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text042]
グリム：第５の事件！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("500");

//ウェブＣＨＡＴ終了


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text043]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900620ta">
「また……」

僕としては、いつものように暗澹とした気分になるのはもちろんなんだけど、一方で戸惑いもあった。

『将軍』や優愛は、今度こそ僕を狙ってくると思ってた。それが先延ばしになったとも言える。
もっとも、喜んでいいのかどうか微妙だけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text044]
グリム：詳しく知りたいか？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text045]
グリム：Taboo!のトップページにも出てるから
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text046]
グリム：調べれば簡単に分かるけどな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text047]
ナイトハルト：今日のいつ頃？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text048]
グリム：遺体発見は昨日の夜
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text049]
グリム：でも被害者が死んだのは一昨日
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text050]
グリム：今回もイっちゃってるお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text051]
グリム：被害者の男の脳が取り除かれてて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("500");

//ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text052]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900630ta">
「ちょ、待て待て……！」

グリムがなんの前置きもなく事件の詳細を語り出すから、焦ってしまった。

グロいことなんてもうたくさんだ。
そんなこと聞きたくない。

聞いたら、自分が無惨に殺される場面を想像しかねない。

まだディソードを手に入れる術さえ見つかってないのに。

でもグリムはなおも続ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

	BGMPlay360("CH01", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text053]
グリム：で、マジ怖いのはさ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text054]
グリム：被害者の死因、なんだと思うよ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("4000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text055]
グリム：……衰弱死
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text056]
グリム：脳を取り除かれても生きてたってことなんだよ！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("500");


//ウェブＣＨＡＴ終了


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text057]
おぞましさに、寒気がする。
僕は自分の腕を抱きしめた。

もう聞きたくない。
勘弁してくれ。

僕のライフはとっくにゼロだよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text058]
グリム：脳死{#TIPS_脳死 = true;$TIPS_on_脳死 = true;}みたいな状態だったってことだな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text059]
グリム：もしかすると一週間以上
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text060]
グリム：脳がない状態で放置されて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text061]
グリム：当然なにも食べられないし飲めないから
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text062]
グリム：それで衰弱死したんじゃないかって
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text063]
グリム：＠ちゃんではもう事件に命名済みだお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text064]
グリム：『ノータリン』だってｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text065]
グリム：やっぱあそこの住人センスあるわ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text066]
グリム：で、傑作なんだけど
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text067]
グリム：被害者は精神科医らしい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text068]
グリム：精神科医が脳を取り除かれてるって
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text069]
グリム：すげえメッセージ性だよな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");


//ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text070]
精神科医。
その文字を見た瞬間、僕の鼓動は跳ね上がった。

考えすぎかもしれないけど、でも……

確かめたくなかった。

確かめなくちゃっていう気持ちもあった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_日常_PC_マウスくりっく");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	CreateTextureEX("back12", 2000, 0, 0, "cg/bg/bg013_01_1_Taboo_a.jpg");
	Fade("back12", 0, 1000, null, true);
	Delete("背景１");
	Delete("box01");

//▼TIPS：解除：脳死
	$TIPS_on_脳死 = false;

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601070]
僕は何度も躊躇した挙げ句、Taboo!のトップページから、今回の『ノータリン』を報じたニュースのリンクを開いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH01", 1500, 0, NULL);

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg148_01_2_PC画面ノータリン_a.jpg");
	Fade("back03", 0, 1000, null, true);


	Fade("back12", 0, 0, null, true);

	Delete("back12");

/*
//おそらくＢＧor演出表現のため一時的にコメントアウトします
//以上、ネット記事ですがＢＧ指定がないため、テキストで区切ります

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text071]
//※以下、ネットの記事の見出し
渋谷区で男性の変死遺体　第５のニュージェネか

//以下、ネットの記事
東京都渋谷区の路上で２３日未明、同区ＡＨ東京総合病院の精神科医師、高科史男さん（４１）が遺体となって倒れているのが発見され、警視庁渋谷署は、高科さんの死因は栄養失調による衰弱死と発表した。
また高科さんの頭部は、頭蓋骨がキレイに切断され、脳が取り除かれていたという。
同署では、脳が取り除かれてからも脳死に近い状態で生きていた可能性もあるとしている。

調べによると、高科さんは今月１０日から仕事を休んでいた。
渋谷区では先月から、猟奇殺人が相次ぎ、いわゆる『ニュージェネレーションの狂気』として注目を集めている。今回の事件も同一犯の可能性があるとして渋谷署で捜査している。【新山満也】


帝都西病院　脳神経外科　小宮山宗一郎名誉教授の話
「過去の事例として、脳死患者が生命維持装置なしで１０日近く心臓が動いていたという報告もある。脳が取り除かれるという状態が過去に前例のないことなのでなんとも言えないが、おそらく脳死と同じような状態にあったのではないか」



【関連記事】
◆ニュージェネ第５の事件に渋谷区民衝撃
◆「優しい先生だった」渋谷区殺人の被害者男性
◆被害者は一週間前から無断欠勤…渋谷区殺人

１４時５５分配信　買読新聞

//※以上、ネットの記事内容
//買読新聞＝読売新
//以上、ネット記事ですがＢＧ指定がないため、テキストで区切りました

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
*/

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text072]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900640ta">
「あ……あ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900650ta">
「なんてことだ……なんて……」

被害者の、名前は――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH06", 1000, 1000, true);

//イメージＢＧ//ＰＣ画面（ネット記事の「ＡＨ東京総合病院の精神科医師、高科史男さん（４１）」をアップで
/*	森島クリック音追加*/
	CreateSE("SE04","SE_日常_PC_マウスくりっく");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg148_02_2_PC画面ノータリン_a.jpg");
	Fade("back04", 0, 1000, null, true);

	Delete("back03");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text073]
//おがみ：ルビ入力
“<RUBY text="たかしな">高科</RUBY><RUBY text="ふみお">史男</RUBY>”

高科先生だ……。
高科先生が、殺された……。

これは、挑発……だ……。

明らかに『将軍』は、僕を挑発してる……。

そのために、僕が頼りにしていた高科先生を、見せしめのように殺したんだ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900660ta">
「そんな、そんな……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CubeRoom2("ルーム", 100, 0);
	Fade("ルーム", 300, 1000, null, true);
	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Rotate("ルーム", 300, 10, 0, 0, AxlDxl, false);
	MoveCube("ルーム", 300, @0, @300, @0, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text200]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900670ta">
「助けて、誰か、誰か助けてくれぇぇぇ！！」

絶叫していた。

頭の中がグチャグチャになっている。
おかしくなりそうだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900680ta">
「あああ、わああああああああ！！！」

{	MoveCube("ルーム", 300, @0, @-250, @0, Dxl2, false);
	Rotate("ルーム", 300, -40, 0, 0, AxlDxl, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900690ta">
「イヤだ！　イヤだ！　イヤだーーー！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900700ta">
「死にたくないよ！　死にたくない！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900710ta">
「梨深、助けて……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	MoveCube("ルーム", 300, 0, 0, 0, Dxl2, false);
	Rotate("ルーム", 300, 0, 180, 0, AxlDxl, true);

	Wait(200);

	Rotate("ルーム", 300, 0, -140, 0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text074]
梨深の姿を探す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Rotate("ルーム", 300, 0, 180, 0, AxlDxl, true);
	Rotate("ルーム", 300, 0, -120, 0, AxlDxl, true);
	Rotate("ルーム", 300, 0, 180, 0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601074]
部屋の中を何度も何度も必死で見回す。

いない。いない。いない。
どうしていないんだ。

――さっき買い物に出かけたからだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH06", 2000, 0, NULL);
	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Rotate("ルーム", 1000, -75, 100, 0, AxlDxl, false);
	Fade("back03", 500, 1000, null, true);
	Delete("ルーム");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602074]
僕は頭を抱えてその場に横たわる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900720ta">
「僕を、助けて、梨深……助けてよ……
どこにも行かないで……頼むよ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900730ri">
「うん……」

返事があった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Stand("st梨深_制服_通常","normal", 200, @-100);
	FadeStand("st梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603074]
ハッとして顔を上げると、梨深がコンビニ袋を持って
僕のすぐ傍らに立っていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch05/09900740ta">
「梨深……」

よかった、戻ってきてくれた。
ホッとして、手を伸ばす。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_通常_normal", 500, true);
	Stand("bu梨深_制服_通常","normal", 200, @-150);
	FadeStand("bu梨深_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text075]
梨深はしゃがみ込み、僕のその手を両手で握りしめてくれた。

前に触れたときは、ひんやりしていた梨深の手。

今は、すごく、温かい。

//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900750ri">
「ここにいる」

//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900760ri">
「あたしは、ここにいるから」

//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch05/09900770ri">
「怯えないで」

梨深は優しい微笑みを浮かべながら、僕の涙を指で拭ってくれる。

ホントに、僕は情けない男だ。

女子の前で、こんな風に、怯えて、泣いて、悲鳴を上げて。

でも梨深は、こんな僕でも一緒にいてくれるって言った。

今は、この温もりだけが、僕の心が壊れないようにするための唯一の支え。

ディソードを手に入れるまでは、この手を、離したくない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ


}