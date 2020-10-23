//<continuation number="2050">

chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "chs_159_セナ編_電気仕掛けの世界";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_159_セナ編_電気仕掛けの世界();
}


function chs_159_セナ編_電気仕掛けの世界()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編
//ＢＧ//黒
//倉持と猪鼻はモニタから波多野に話している
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");

	Wait(1500);

//ＳＥ//瓦礫を持ち上げたり落としたりする音
//※波多野がセナたちを生き埋めにしている瓦礫を除去中
//※拓巳が意識朦朧としている状態で聞いている（回想ボイスエフェクトで意識朦朧状態を出す）
	CreateSE("SE01","SE_はいけい_瓦礫_取り除かれる_LOOP");
	MusicStart("SE01", 5000, 500, 0, 1000, null, true);

	Wait(1000);
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//ＶＦ//回想
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800010ha">
「――私は、もう天成神光会に戻る気はない」

//ＶＦ//回想
//【倉持】
<voice name="倉持" class="倉持" src="voice/chn02/00800020kr">
「実に惜しいね。君の才能を、私は買っていたのだが」

//ＶＦ//回想
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800030ha">
「利用していた、の間違いだろう。私はもうあなたの言葉は信じない。教祖としての倉持雄大など虚像でしかないと分かった」

//ＶＦ//回想
//【倉持】
<voice name="倉持" class="倉持" src="voice/chn02/00800040kr">
「神光の救いを、君も欲していただろう？」

//ＶＦ//回想
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800050ha">
「かつての私は、欲していた。だが、今は違う」

//ＶＦ//回想
//【倉持】
<voice name="倉持" class="倉持" src="voice/chn02/00800060kr">
「では、なにを欲しているのかね？」

//ＶＦ//回想
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800070ha">
「……償いのための、死だ」

//ＶＦ//回想
//【倉持】
<voice name="倉持" class="倉持" src="voice/chn02/00800080kr">
「一度、神光に触れた者は、離れることなどできないよ。君は離れたつもりでも、神光はいかなる者をも見捨てない」

//ＶＦ//回想
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800090ha">
「神に頼る気は、もうない。神に匹敵する物を創ってしまった私には、神にすがることは許されない」

//セナはボイスエフェクトなしの普通の声です
//◆小声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800100sn">
「西條。起きろ、西條……！」

聞き慣れない男たちの、やけに仰々しいやり取り。その合間に飛び込んできたセナのささやきによって、僕は目を開けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//セナと密着して瓦礫に埋もれている
	CreateTexture360("セナ密着４", 100, 0, 0, "cg/ev/ev118_04_6_セナ密着_a.jpg");
	Fade("Black", 1000, 0, null, true);
	Delete("Black");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
相変わらず、僕とセナは密着している。
瓦礫に囲まれ、脱出もままならない。

//回想ボイスエフェクトは以下、無し
//◆瓦礫越しの声（遠くから聞こえる感じ）
//【倉持】
<voice name="倉持" class="倉持" src="voice/chn02/00800110kr">
「君は君自身の意志で、この未来を選び取ってきた。すべては君の責任だ。だが１人で背負うには重すぎるだろう？　神光の救いがもたらされれば、その重みも多少は減ろう」

//◆瓦礫越しの声（遠くから聞こえる感じ）
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800120ha">
「そうだ、私が選んだ。神光の導きに従った結果として、いや、あなたの言葉に従った結果としてだ」

//◆小声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800130sn">
「誰かいる。話し声が聞こえるだろ？」

僕はその問いかけにうなずく。

２人の男の声が聞こえてくる。
天成神光会がどうたら。
少なくとも、救助隊じゃない。

{	CreateTexture360("セナ密着１", 100, 0, 0, "cg/ev/ev118_01_6_セナ密着_a.jpg");
	Fade("セナ密着１", 0, 0, null, true);
	Fade("セナ密着１", 500, 1000, null, true);
	Delete("セナ密着４");}
//◆小声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800140sn">
「あいつだ……あいつが、近くにいる……！」

セナが歯ぎしりをする音が、僕の耳にもはっきり届いた。

//◆瓦礫越しの声（遠くから聞こえる感じ）
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800150ha">
「言葉を飾るのはやめるんだ、倉持雄大。あなたの美辞麗句は、もう私の心には響かない」

//◆瓦礫越しの声（遠くから聞こえる感じ）
//【倉持】
<voice name="倉持" class="倉持" src="voice/chn02/00800160kr">
「残念だ。もっとも、君がいなくてもすでにノアⅡは完成している。後は世界に向けて我らの意志を発信するのみだ」

//◆瓦礫越しの声（遠くから聞こえる感じ）
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800170ha">
「我らの、ではなく、あなたと、猪鼻康三の、だろう？」

//◆瓦礫越しの声（遠くから聞こえる感じ）
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/chn02/00800180ih">
「いかにも。サードメルトの実験成功によりプロジェクト・ノアは試験段階を終了した」

３人目の男の声。
いったい、なにを話してる？
どこで、話してる？

少なくとも声が聞こえるっていうことは、僕らが埋もれている近くで会話をしているっていうことだ。
僕らの上に積もっている瓦礫は、それほど多くないのかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆暑い
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800190sn">
「はぁ……はぁ……」

セナが身じろぎする。
その手が、僕の制服をきつく握りしめている。
なにかに耐えるように、きつく。

視線は伏せられていた。僕を見ようとしない。

//◆瓦礫越しの声（遠くから聞こえる感じ）
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/chn02/00800200ih">
「これからの世界秩序は、３００人による統治から、２人による統治に変わるというわけだ。今日が、その夜明けだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//瓦礫が取り除かれる
	CreateColor("White", 1100, 0, 0, 1280, 720, "White");
	Reqiest("White", AddRender);
	Fade("White", 0, 0, null, false);
	Fade("White", 2000, 1000, null, true);

	Delete("Black");

	SetVolume("SE01", 500, 0, null);
	Wait(500);
	CreateSE("SE02","SE_はいけい_瓦礫_取り除かれる2");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
と、いきなり視界に光が射し込んできた。
ボロボロと、周囲の細かい瓦礫が崩れる。

セナがハッと顔を上げる。
頭の上、瓦礫の隙間から、手が伸びてきた。

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800210ha">
「無事か、セナ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800220sn">
「お……まえ……っ！」

セナがその手によって引っ張り出されていく。
セナがどいたことで、隙間が広がり、重しもなくなって、僕はさっきよりずっと自由に動けるようになった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//希ＶＩＰルーム（崩壊後）
//モニタのいくつかが落下し、モニタ画面内はブラックアウト。壁もところどころ崩壊して夜空が見えている。
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg136_04_6_chn希ＶＩＰルーム崩壊後_a.jpg");

	Fade("White", 1000, 0, null, true);
	Delete("White");
	Delete("セナ密着１");

	CreateSE("SE3601","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE3601",2000,200,0,1000,null,true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
開けられた隙間から這い出る。
希ビルの一室。僕らが閉じ込められていた部屋だ。

//ＶＦ//スピーカーからの声
//【倉持】
<voice name="倉持" class="倉持" src="voice/chn02/00800230kr">
「君も野呂瀬同様に、我らが使ってやろうと言っているのに、それを拒否するとは。統治側ではなく、家畜として生きるのが望みかね？」

つり下げられていたいくつものモニタは、今はほとんどが落下して、画面が割れてしまっている。当然ながら画面にはなにも映っていない。

壁なども崩れかけていた。
でも思ったほどの崩れ方じゃない。

僕らは生き埋めになってはいたけど、瓦礫の量はそれほどじゃなく、
やろうと思えば、自力で脱出することだってできたわけか。
押し潰される恐怖で身動きが取れなかったのがバカみたいだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","angry", 300, @+280);
	Stand("st一成_浮浪者_通常","normal", 200, @-280);
	FadeStand("stセナ_制服_通常_angry", 500, false);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//◆憎しみのブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800240sn">
「…………っ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800250ha">
「セナ……」

セナは、見知らぬ男と向かい合っていた。
薄汚れたコートを身にまとった、濁った目をした男。
その身なりはホームレスにしか見えない。

どこかで会ったような気がするけど、どこだったのかは思い出せなかった。もしかしたら、渋谷の街のどこかですれ違っただけなのかもしれない。

その２人以外に、人影はない。

僕らを罠にはめた、天成神光会の教祖と、衆議院議員、その２人の声は、きっと室内のどこかにあるスピーカーから聞こえてくるものだろう。

//ＶＦ//スピーカーからの声
//【倉持】
<voice name="倉持" class="倉持" src="voice/chn02/00800260kr">
「おや、波多野よ、どうやら親子で感動の対面を果たしたようだね」

親子……。
セナと、この男が、親子？
確かに“波多野”って名前は、前にセナから聞いたことがある。

//ＶＦ//スピーカーからの声
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/chn02/00800270ih">
「せいぜい、再会の喜びでも語っているがいい。そしてそこから眺めているのだな。世界が、変革していく様を」

//ＶＦ//スピーカーからの声
//【倉持】
<voice name="倉持" class="倉持" src="voice/chn02/00800280kr">
「ノアⅡをフル稼働させれば、渋谷だけでなく、世界中のすべての人間に作用を及ぼすことが可能だ。そのネットワークはすでに構築さ――」

{	SetVolume("SE3601", 500, 0, null);}
不意に、スピーカーからの声が途切れた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_通常_angry", 300, false);
	DeleteStand("st一成_浮浪者_通常_normal", 300, true);

//ＳＥ//ガサガサ、というスピーカーからの物音
	CreateSE("SE03","SE_き械_でん化製ひん_すぴーかー_物音");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
奇妙な物音。
スピーカーの電源が切れているわけじゃない。
なにかが、変だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//スピーカーの向こうから何発かの銃声
	CreateSE("SE04","SE_衝撃_じゅう声_すぴーかーごし");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00800290ta">
「あ……！　い、今のって……」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800300ha">
「銃声……」

その銃声の後に、荒い息をつく男の、しゃがれた声が聞こえてくる。

//ＶＦ//スピーカーからの声
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/chn02/00800310ih">
「バ、バカな……。こんなはずでは……。私は、これから統治者に――」

//ＶＦ//スピーカーからの声
//◆のどをかききられ死亡
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/chn02/00800320ih">
「ぎゃああぁっ！」

断末魔の叫びだった。
それもすぐにブツンと切れて、それきりスピーカーは沈黙する。

異様な静けさ。
なにが起きた……？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00800330ta">
「こ、殺されたんじゃ……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","hard", 300, @+280);
	FadeStand("stセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800340sn">
「殺された？　誰に？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00800350ta">
「し、知らないよ……っ」

あの２人は、どこから、スピーカーで語りかけていたんだろう。
僕らがいるこの部屋の近くだろうか。
少なくとも、このビルの一室なのは間違いない。

ということは、あの２人を殺した犯人が、
すぐ近くにいるっていうこと……。


//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00800360ta">
「に、にげ、逃げようよ……。殺人鬼が、ここに来るかも……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800370sn">
「だから、殺人鬼って誰だ？　なんであの２人は殺された？　いや、殺されたと判断した根拠は！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st一成_浮浪者_通常","normal", 200, @-280);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800380ha">
「落ち着け、セナ」

{	Stand("stセナ_制服_通常","angry", 300, @+280);
	FadeStand("stセナ_制服_通常_angry", 300, true);
	DeleteStand("stセナ_制服_通常_hard", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800390sn">
「お前には聞いてないっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00800400ta">
「悲鳴、き、聞いたでしょ……っ。
こ、殺されたとしか、思え、ないよ……！」

殺したのは誰だ？『将軍』か？
でも『将軍』も希の人間のはず……。

いやいや、希の人間だっていうのは、単なる僕の推測だ。なんの根拠もない。

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800410ha">
「逃げるのは、少し面倒だ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800420ha">
「このビルは、崩れかかっている。あちこちに歪みが生じている」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800430ha">
「私がこの部屋に入ってきた直後に、入り口が瓦礫で塞がれてしまった」

波多野さんの言う通りだった。

でも、壁などの崩れ方に比べて、瓦礫がやけに多いような気もする。

違和感がある。

とは言え、そもそも廃墟なんかに行った経験はないから、壁の崩れ方と瓦礫の量の関係なんて分かるわけがないんだけど……。

はっきりしているのは、生き埋め状態からは脱出できたけど、結局のところ閉じ込められてることに変わりはないっていう状況。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800440sn">
「ディソードで壊せばいい」

{	DeleteStand("st一成_浮浪者_通常_normal", 300, false);
	DeleteStand("stセナ_制服_通常_angry", 300, true);}
この部屋に閉じ込めれたときに聞こえていた、あの奇妙な共鳴音がやんでいることに、僕はようやく気付いた。

地震のせいでその音を出す装置――ポート、だっけ？――も壊れちゃったのかも。

それなら、セナがなんとかしてくれるかも。
僕はホッとして、セナが脱出路を作ってくれるのを待った。

でも彼女は、剣を出そうともせず、じっと波多野さんをにらみつけたままだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH01", 0, 1000, true);

	Stand("st一成_浮浪者_通常","normal", 200, @-280);
	Stand("stセナ_制服_通常","angry", 300, @+280);
	FadeStand("stセナ_制服_通常_angry", 500, false);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800450sn">
「あの２人となにを話していた？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800460ha">
「昔話だ。互いに分かり合うことのできない、ね」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800470sn">
「分かり合うことのできない……？　本当にそうか？　今でも繋がりがあるんじゃないのか？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800480sn">
「この半年、どこでなにをしていた……！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800490sn">
「今になってこの場所に都合よく現れたのはなぜだ！？　このビルのどこかで、私たちをモニタしていたからじゃないのか！？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800500ha">
「私はこの半年、渋谷を徘徊していただけの、死にたがりだ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800510ha">
「天成神光会にも希テクノロジーにも、戻るつもりはない……」

{	Stand("stセナ_制服_通常","hard", 300, @+280);
	FadeStand("stセナ_制服_通常_hard", 200, true);
	DeleteStand("stセナ_制服_通常_angry", 0, true);}
セナは小さく舌打ちして、今度は僕の方を見た。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800520sn">
「あの２人が殺されたと思う根拠は？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00800530ta">
「え、そ、それは、だから……」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800540ha">
「彼らは、敵が多い」

波多野さんが割り込んでくる。

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800550ha">
「誰に殺されても納得できる」

{	Stand("stセナ_制服_通常","angry", 300, @+280);
	FadeStand("stセナ_制服_通常_angry", 300, true);
	DeleteStand("stセナ_制服_通常_hard", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800560sn">
「お前には聞いてないと言っているだろ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00800570ta">
「で、でも、ほら、悲鳴とか、銃声が、聞こえて……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800580sn">
「本当に、そうか？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800590sn">
「単なる演技の可能性は？　そもそもスピーカーから聞こえていたあの２人の声は、リアルタイムのものか？」

ど、どういうことだ……？

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800600sn">
「地震対策がしっかりしてる日本で、希グループという日本を代表する巨大企業の本社ビルが、これほどの地震被害を受けている……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800610sn">
「それだけ、とんでもない地震が起きたということだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800620sn">
「そんな状況で、なぜあの２人は、この部屋のスピーカーで、ベラベラと、裏事情を話してくれたんだ？」

セナは確認するかのように、一語一語をはっきり区切って、そう言った。

裏事情……か。ノアⅡがどうとか、サードメルトがどうとか。僕にはほとんど理解できなかったけど。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800630sn">
「これ見よがしに感じる。ヤツらは裏事情を、私たちに意図的に聞かせる必要があったのかもしれない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800640sn">
「あの２人は、実在しているのか？　地震が起きる前に、すでに死んでいた可能性は？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800650sn">
「西條、私もお前も、このビルに乗り込んでから
あの２人とは一度も会っていない。そうだな？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00800660ta">
「で、でも、モニタで喋ってた……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800670sn">
「モニタの中で、だろう。実際に会ったわけじゃない。あんなもの、いくらでも細工できる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800680sn">
「スピーカーについても、言うまでもない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800690sn">
「なにか変だ。不可解だ。それに私は――」

セナの言葉を遮って、波多野さんが見開いた目を僕に向けていた。

{	Stand("st一成_浮浪者_焦り","worry", 200, @-280);
	DeleteStand("st一成_浮浪者_通常_normal", 500, false);
	FadeStand("st一成_浮浪者_焦り_worry", 500, true);}
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800700ha">
「西條、拓巳くん。君が、そうなのか」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800710ha">
「そうか。君が」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800720sn">
「動くな」

無視されたセナが、その波多野さんに鋭い声で呼びかける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","hard", 300, @+280);
	FadeStand("stセナ_制服_通常_hard", 300, true);
	DeleteStand("stセナ_制服_通常_angry", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800730sn">
「もう一度聞く。お前は、なぜここにいる？」

{	Stand("st一成_浮浪者_通常","normal", 200, @-280);
	DeleteStand("st一成_浮浪者_焦り_worry", 500, false);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);}
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800740ha">
「……お前たちを助けに来た。いや……殺されに来た、というのが本心かもしれない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800750sn">
「心配しなくても、すぐに殺してやる。でもその前に、質問に答えろ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800760sn">
「私たちがここにいることを、どうして知っていた？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800770ha">
「強い、心の呼びかけを感じた」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800780sn">
「ギガロマニアックスでもないお前が、どうしてそれを感じることができるんだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800790sn">
「いや、ギガロマニアックスでさえ“心の呼びかけ”なんていう曖昧な妄想を感知できるのは、ごく一部だけだ」

例えば、こずぴぃとか。
そう言えば、こずぴぃはどうしてるんだろう。地震に巻き込まれたんだろうか。無事ならいいけど……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800800sn">
「本当に、感じたのか？　最初から、知っていたんじゃないのか？　私たちが、この部屋におびき寄せられたことを」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800810ha">
「冷静になれ、セナ。憎しみに心を支配されているぞ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800820sn">
「冷静になれだと？　ずっと殺したいと思っていた人間を目の前にして、冷静でいられるはずがないだろ……！」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800830ha">
「考え過ぎてはいけない。物事は陰謀論ほど複雑ではなく、もっとシンプルだ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","angry", 300, @80);
	DeleteStand("st一成_浮浪者_通常_normal", 150, false);
	DeleteStand("stセナ_制服_通常_hard", 150, true);
	FadeStand("buセナ_制服_通常_angry", 150, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800840sn">
「この場に、お前が現れるのは、都合が良すぎるんだっ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800850sn">
「最初から仕組まれたことじゃないのか？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800860sn">
「この部屋におびき出されて監禁された私たち。地震。直後に現れたお前という存在。スピーカーからの、これ見よがしの陰謀論風な演説と、その不可解な中断」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800870sn">
「そもそも、この部屋が希のビルである確証もない。私たちが気絶している間に、別の場所に運び込まれていたとしたら？」

//■３６０
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800880sn">
//「希のビルに内装だけ模してあるだけの部屋。地震など起きていなくて、散乱している瓦礫も人為的に配置したもの」
「希のビルに内装だけ模してある部屋。地震など起きていなくて、散乱している瓦礫も人為的に配置したもの」

セナが言葉を紡げば紡ぐほど、僕はなにを信じればいいのか分からなくなる。

自分の存在に対する拠り所が、ひとつずつ、ガラガラと崩れていくような感覚。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buセナ_制服_通常_angry", 300, true);
	Stand("st一成_浮浪者_通常","normal", 200, @-280);
	Stand("stセナ_制服_通常","angry", 300, @+280);
	FadeStand("stセナ_制服_通常_angry", 300, false);
	FadeStand("st一成_浮浪者_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800890ha">
「疑心暗鬼は己を滅ぼす。気をしっかり持て、セナ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800900sn">
「お前に名前を呼ばれたくはない。会話をするつもりもない。質問に答えろ！」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800910ha">
「地震は起きた。確実にだ。渋谷のあらゆる建物は、崩壊しかかっている。死傷者は４桁以上だろう」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800920sn">
「それを証明する方法を持っているのか？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800930ha">
「その壁を崩してみるといい。お前の、ディソードで」

{	SetVolume360("@CH01", 2000, 0, null);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800940sn">
「…………」

{	DeleteStand("stセナ_制服_通常_angry", 300, true);}
セナは右手を振り払うような仕草をした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//ＳＥ//ディソード顕現
	CreateSE("SE04","SE_擬音_ディそーど出現");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 200, 1000, null, true);
	DeleteStand("st一成_浮浪者_通常_normal", 0, true);

	Stand("stセナ_制服_武器構え","hard", 300, @+280);
	FadeStand("stセナ_制服_武器構え_hard", 0, true);

	CreateSE("SE01","SE_擬音_ディそーどかまえる");
	MusicStart("SE01",0,1000,0,1000,null,false);


	Fade("フラッシュ", 500, 0, null, true);

	Wait(500);

	CreateSE("SE02","SE_擬音_ディそーど2");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
一瞬にして、そこにディソードが姿を現す。

{	MusicStart("SE02",0,1000,0,1000,null,false);
	Fade("フラッシュ", 0, 1000, null, true);
	DrawTransition("フラッシュ", 200, 0, 200, 100, Dxl2, "cg/data/ncenter1.png", true);
	Fade("フラッシュ", 300, 0, null, false);
	DeleteStand("stセナ_制服_武器構え_hard", 300, false);}
セナは剣を構えると、躊躇なく壁に向かって振り下ろした。
ディソードは滑らかに壁をスライスした。まるで熱したバターをナイフで切ったかのよう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//壁が崩れる
	CreateSE("SE01","SE_衝撃_瓦礫砕く");
	CreateSE("SE08","SE_擬音_ディそーど_コンクリート砕く");
	MusicStart("SE08", 0, 1000, 0, 1000, null, false);
	MusicStart("SE01",0,1000,0,1000,null,false);

	CreateColor("黒幕", 1000, 0, 0, 1280, 720, "Black");
	Fade("黒幕", 0, 1000, null, true);
	Delete("フラッシュ");
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
壁が崩れる。
最初に、強い、冷たい風が吹き込んできた。
崩れた壁の向こうにある光景が、僕らの前に露わになる。

そこに見えたのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE3601","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE3601",4000,400,0,1000,null,true);

//ＢＧ//崩壊渋谷（１０７前）
	CreateTexture360("back02", 600, 0, 0, "cg/bg/bg215_02_1_chn希本社ビル見下ろし_a.jpg");
	Fade("back02", 0, 1000, null, true);
	Fade("黒幕", 1000, 0, null, true);

	Delete("back01");
	Wait(500);

	Move("back02", 3000, @0, -480, Dxl1, true);

	Wait(1000);

	Move("back02", 3000, @-480, @0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602011]
文字通り、死の廃墟と化した渋谷。

ほんの数時間前まで、あれだけの人を呑み込み、きらびやかな装飾で溢れ、街灯ビジョンから大音量でおしゃれな映像を垂れ流していた、若者の街。

それが今や、象徴的な建物のほとんどは崩壊し、それを免れたものも傾き、あるいはいくつもの致命的な亀裂に侵食され。

道を走る車は一台もなく。アスファルトはある場所で陥没し、別の場所では隆起し、黒々とした煙があちこちから立ち上って、濁った空へと消えていっている。

それが、ビルの高層階から見下ろした、今の渋谷だった。

セナは疑心暗鬼になっているだけだ。それに僕も引きずられている。

間違いなく、ここは希本社ビルの３１階で、地震も起きたんだ。

このビルも、いつ崩れるか分からない。
もし崩れたら、僕なんてひとたまりもない。

大量の瓦礫に押し潰されて終わりだ。死体すら発見されることなく、永久に埋もれたままにされてしまうかも。

早く脱出した方がいい。
僕は身を震わせつつ、部屋の中を見回した。

……ん？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 3000, 0, null);

	CreateSE("SE3602","SE_戦闘_でん撃_でん気火花");
	MusicStart("SE3602",4000,300,0,1000,null,true);

	SetVolume360("CH*", 5000, 0, NULL);

//ＢＧ//壊れたモニタ
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg136_04_6_chn希ＶＩＰルーム崩壊後_a.jpg");
	FadeDelete("back02", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
本能的に、それを目に留めていた。
床に転がっている、モニタ。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800950sn">
「単なる地震で、ここまで被害が大きくなるはずがない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800960sn">
「ノアⅡか？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800970ha">
「そうだ。サードメルト。ノアⅡの最終稼働実験だ」

液晶画面は半分ほどが割れてしまっていて、なにも表示されない。
残り半分の画面は、粘り強く点灯していた。

さっき見たときは、点いてなかったような気がするけど、あまり自信はない。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00800980sn">
「サードメルト……。お前もかかわっているのか？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00800990ha">
「言っただろう。私は、もう半年以上前に、希から逃げ出した人間だよ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00801000sn">
「希だけじゃない。
　お前は、私や、母さんや、妹からも逃げたんだ……！」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/00801010ha">
「……ああ。認める」

セナと波多野さんのギスギスしたやり取りを半分聞き流し、僕はモニタの前にしゃがみ込んだ。
文字だ。テキストが表示されている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("SE3602", 1000, 0, null);
	Wait(1000);

}

