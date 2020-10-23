//<continuation number="200">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_006_妄想トリガー１■";
		$GameContiune = 1;
		Reset();
	}

	ch01_006_妄想トリガー１■();
}


function ch01_006_妄想トリガー１■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("back13", 100, 0, 0,  "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Fade("back13", 0, 1000, null, true);
	Stand("bu大輔_制服_通常","normal", 200, @+100);
	FadeStand("bu大輔_制服_通常_normal", 0, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Delete("背景１");

//☆Cut-52-----------------------------
//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐３へ
//ネガティブ妄想→分岐４へ
//妄想しない→分岐５へ


if($妄想トリガー通過１ == 0)
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
			$妄想トリガー１ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー１ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー１ = 0;
		}
	}

	if($妄想トリガー１ == 2 || $妄想トリガー１ == 0)
	{
		SetChoice02("１週目","２週目以降");
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
		
			case @選択肢１:
			{
				ChoiceA02();
				#ClearG=false;
			}
			case @選択肢２:
			{
				ChoiceB02();
				#ClearG=true;
			}
		}
	}
}




//=============================================================================//

if($妄想トリガー１ == 2)
{

	DeleteStand("bu大輔_制服_通常_normal", 300, true);

	Wait(300);
//☆☆☆
//分岐３
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
血なんて見たいわけないじゃないか。そんなの怖すぎる。

おばけ屋敷とかホラー映画とかじゃない、リアルに人が殺されてて、犯人はまだ捕まってないんだぞ。

ちょっとでも危なそうな場所には絶対行きたくなかった。

それにしてもニュージェネの犯人は、いったいなにが動機なんだろう。

頭のネジが何本か外れてるような人間による愉快犯なのかな。そう考えるのが一番妥当だろうなあ。

まあ、どうでもいいけど。僕には関係ないし。

ちなみに僕も大量殺人鬼だったりする。でもたくさん殺したにもかかわらず英雄扱いされてる。エンスー内での話だけどｗｗｗ

それを比較するだけでも、二次元はリアルより断然いいってのが証明されますた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
僕は三住くんの誘いを必死に断りつつ、心の中で自分が激しくストレートパンチを連打する姿を思い浮かべる。

“殺人鬼？　そんなヤツ、出会った途端にボコボコにしてやんよ”

そうやって妄想して楽しむ分には、僕は誰でも殺せるし誰でも助けられる。

それを実行に移すヤツは、ただのバカだ。後のことをなにも考えてないから。

ニュージェネの犯人だって、どうせすぐに捕まる。そして何十年も刑務所に入れられた挙げ句に死刑執行だ。

僕はその犯人にこう言ってやりたいね。

――あーあ、妄想だけで済ませとけばよかったのに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("SE*", 200, 0, null);

	DelusionIn();

//以下、拓巳の妄想……と思わせておいて実は現実かもしれない

//ＢＧ//渋谷路地裏//夜
	CreateBG(100, 0, 0, 0, "cg/bg/bg020_01_3_渋谷路地裏_a.jpg");

	DelusionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
夕食を買いに出た。

いつも使う近所のコンビニへ向かう道。ベースからは歩いて３分程度の距離。

見慣れた風景。薄汚い路地。

だけど今日に限って、まるで異界にでも迷い込んでしまったかのような奇妙な感覚に襲われた。

風景そのものは変わっていないのに、初めてこの場所に足を踏み入れたような。

未視感――ジャメヴュって言うらしい。以前、ネットで調べたことがある。

それに、生ゴミの腐ったような匂いも漂ってくる。

肌にまとわりつくジメジメとした湿気は、雨が降ったんじゃないかって勘違いしそうなくらいだ。空気が粘ついている気がする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//死体を引きずる音
	CreateSE("SE01","SE_じん体_動作_足_引きずる_ばいのーらる_LOOP");
	MusicStart("SE01", 0, 300, 0, 1000, null, true);
//ズルリ……ズルリ……
//ＳＥは以下、しばらく続く

	Wait(1500);

	BGMPlay360("CH01",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
音が――
なにかを引きずっているかのような音が、かすかに聞こえてくる。

僕は足を止めて、耳を澄ませた。

{	SetVolume("SE01", 3000, 600, NULL);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600010ta">
「…………」

その音は、僕の立つ場所から左側へと折れている狭そうな路地の奥から聞こえてきている……そんな気がした。

街路灯はなくて、周囲の家の明かりも消えていた。

だからその道の先がどうなっているのかは、目を凝らしてもよく分からない。

現代の日本――しかも新宿と並んで“眠らない街”の代名詞である渋谷に、こんな深い闇をたたえる場所があるなんて。

これじゃちょっとしたお化け屋敷だ。<k>
いや、お化け屋敷と決定的に違う点がある。

それは、この闇は人工的なものじゃない……っていうこと。

行きたくない。
行かない方がいい。

心の中で僕は自身に対して警告を発する。

{	SetVolume("SE01", 3000, 800, NULL);
	Zoom("back*", 1500, 1500, 1500, null ,true);}
でも、さっきからずっと続いている音に吸い寄せられるように、僕の足はなぜか一歩を踏み出す。

これ以上進んだらまずい、という恐怖。
心臓が激しく高鳴り、脂汗がじっとりと額に滲む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Zoom("back*", 1500, 2000, 2000, null ,true);

//ＳＥはここで終了
	SoundStop("SE01");
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//※ここの声は梨深である必要はないと思います。
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00600020ri">
「その先に――」

誰かのキレイなノイズが――
僕の耳元でささやきを発して――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音
	CreateSE("SE01","SE_にん間_動作_手_はたく");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Shake("back*", 500, 0, 20, 0, 0, 500, null, false);

	SetVolume360("CH01", 1000, 0, NULL);
	BGMPlay360("CH06", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
いきなり二の腕をつかまれる。
あまりに突然すぎて僕はパニックになり、悲鳴をあげようとしたけどうまくいかず、のどの奥から空気を吐き出すのが精一杯だった。

恐怖で今すぐ逃げ出したいのに身体は言うことを聞かなくて、足は硬直してその場から１ミリも動かない。

僕の腕をつかむ何者かの手。それが視界に入る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//イメージＢＧ//ミイラのような手を連想させるビジュアル（子画面）
	CreateTextureEX("手", 400, 0, 0, "cg/ev/ev009_01_4_腕掴みミイラ_a.jpg");
	Fade("手", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
深い緑色をしたその手はミイラのように細くて、無数の血管が浮かび上がり、生きた人間のそれには見えなかった。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00600030ri">
「行くのは――」

ホントならその場で腰を抜かして失禁してもおかしくなかった。でも不思議とその声は僕の耳に心地よくて、破裂しそうにふくれあがっていた恐怖が徐々に治まっていく。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00600040ri">
「危険――」

低く、緊張した、その声。

ゆっくりと――
振り返ってみる――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 0, 0, 0, "cg/bg/bg020_01_3_渋谷路地裏_a.jpg");

	if(#下着パッチ==true)
	{
		CreateTexture360("梨深", 200, center, -1200, "ex/hu/hu梨深_制服_正面血まみれ_下着_lost.png");
	}else{
		CreateTexture360("梨深", 200, center, -1200, "cg/hu/hu梨深_制服_正面血まみれ_lost.png");
	}

	Move("梨深", 0, @-300, @0, Axl1, true);
	DrawTransition("手", 500, 1000, 0, 100, null, "cg/data/left2.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
まず最初に目に飛び込んできたのは、翠明学園のエンブレムだった。

それは翠明の制服の胸元に縫いつけられているもの。
スカートをはいているから、女子だと分かった。

でも、肝心の顔を見る勇気はなかった。
予想以上に“彼女”が近くに立っていたから、目をそらすことが精一杯だった。

なにかがおかしい。頭の片隅でそう感じて、改めて自分の二の腕へと視線を戻す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("手", 600, 0, 0,  "cg/ev/ev010_01_4_腕掴み梨深_a.jpg");
	Fade("手", 500, 1000, null, true);
	Delete("背景１");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
僕の腕をつかんでいるのは、女の子らしい華奢な指だった。
さっきは緑色のグロい手にしか見えなかったのに。

誰だ？
この子は誰だ？

どんな顔をしてる？
どんな顔で僕を見てる？
ここでなにをしてた？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


if(#ClearG && !$RouteON){

//※※３６０以下
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text900]
なぜだか分からないけど、僕は、この女子のことを知っているような気がする。

自分の腕と、それをつかんでいる白い手を見たまま。
僕は、妄想する。彼女の姿は――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//★梨深編_突入用分岐
//※以下のＹＥＳ／ＮＯ分岐は分岐しません。必ず全問に解答します
//全問正解で、梨深個別シナリオに分岐。以後、梨深編専用インターミッションなどが挿入されつつ７章までは通常通りに流れに

//※ＹＥＳ／ＮＯ分岐
//■選択肢開始====================================================
	StartWhich03();

//ＹＥＳ／ＮＯ選択肢１
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
“リボンで髪を結んでいる”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
				$梨深ルート無し=true;
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
	}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢２
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text902]
“メガネをかけている”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→ミス
//ＮＯ→正解
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
			}
			case @選択肢１:
			{
				YES03();
				$梨深ルート無し=true;
			}
		}
		Wait(16);
	}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢３
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text903]
“オーバーニーソックスを穿いている”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
				$梨深ルート無し=true;
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
	}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢４
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text904]
“スカートは長い”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→ミス
//ＮＯ→正解
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
			}
			case @選択肢１:
			{
				$梨深ルート無し=true;
				YES03();
			}
		}
		Wait(16);
	}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢５
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text905]
“敬礼みたいなポーズをする”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				$梨深ルート無し=true;
				NO03();
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
	}

//すべて正解の場合
//フラグ【梨深編確定】ＯＮ
//ひとつでもミスがあった場合
//フラグ発生せず

//■選択肢終了
	EndWhich03();

	if($梨深ルート無し){
	}else{
		$梨深ルート=true;
		$RouteON=true;
//○実績No.11：ビシィ！
		XBOX360_Achieved(11);
	}

//この後、“いろんな疑問が頭の中を駆け巡って、でも結局声をかけることなんてできなくて、ただうなだれた。”というテキストの部分に戻る

//※※３６０以上
}



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
いろんな疑問が頭の中を駆け巡って、でも結局声をかけることなんてできなくて、ただうなだれた。

いつの間にか、なにかを引きずるような音は消えていて――

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00600050ri">
「もう帰って」

その代わりに、彼女の身体から――

//※ここはあえて「タク」でなく「拓巳君」
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch01/00600060ri">
「ね、拓巳君」

{	SoundStop("@CH06");}
血の匂いが――した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DelusionOut();

	Delete("*");
//ＢＧ//＠カフェ・ＲＯＯＭ３７
	CreateBG(100, 0, 0, 0, "cg/bg/bg034_01_3_ネットカフェ37_a.jpg");
//教室に戻るのではなく、別の場所から始まる事によって、プレイヤーは手前のシーンが本当に妄想だったのか、もしくは未来ｏｒ過去のシーンが投げ込まれたものなのか怪しんでいます。

	DelusionOut2();

	PositiveHuman();
//ＳＥ//空調
	CreateSE("SE02","SE_日常_ねっとかふぇ_空調_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600070ta">
「………………これはいい」

僕はパソコンモニタの前に座っている。

興奮を抑えるために、コーラを口の中に流し込んで、リクライニングシートの上で大きく伸びをした。

我ながらリアルな妄想だったなあ。

ミステリアスな感じの女子高生も出てきたし。
彼女に名前を付けて、妄想内で育てていってみようかな。

僕はよくそういう遊びをする。既存のキャラ――例えば星来たんをキャスティングしたり。うーん、でも星来たんとは属性がちょっと違う気がする。

いずれにせよ妄想だと二次元でも三次元でもごっちゃにできるからいいよね。そして妄想内で起きるすべての事象は、神である僕の思うがまま。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600080ta">
「次はちょっとエロ要素も……ふひひ」

ついつい自分のベースにいる感覚でつぶやいちゃってから、ここがネットカフェだっていうことを思い出して口を塞いだ。

そっと周囲をうかがってみる。
ま、聞かれちゃいないだろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆☆☆
//合流２へ

}


//=============================================================================//

if($妄想トリガー１ == 1)
{

//☆☆☆
//分岐４

	DeleteStand("bu大輔_制服_通常_normal", 300, true);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
血なんて見たいわけないじゃないか。そんなの怖すぎる。

おばけ屋敷とかホラー映画とかじゃない、リアルに人が殺されてて、犯人はまだ捕まってないんだぞ。

ちょっとでも危なそうな場所には絶対行きたくなかった。

それにしてもニュージェネの犯人は、いったいなにが動機なんだろう。

頭のネジが何本か外れてるような人間による愉快犯なのかな。そう考えるのが一番妥当だろうなあ。

まあ、どうでもいいけど。僕には関係ないし。

ちなみに僕も大量殺人鬼だったりする。でもたくさん殺したにもかかわらず英雄扱いされてる。エンスー内での話だけどｗｗｗ

それを比較するだけでも、二次元はリアルより断然いいってのが証明されますた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
僕は三住くんの誘いを必死に断りつつ、心の中で自分が激しくストレートパンチを連打する姿を思い浮かべる。

“殺人鬼？　そんなヤツ、出会った途端にボコボコにしてやんよ”

そうやって妄想して楽しむ分には、僕は誰でも殺せるし誰でも助けられる。

それを実行に移すヤツは、ただのバカだ。後のことをなにも考えてないから。

ニュージェネの犯人だって、どうせすぐに捕まる。そして何十年も刑務所に入れられた挙げ句に死刑執行だ。

僕はその犯人にこう言ってやりたいね。

――あーあ、妄想だけで済ませとけばよかったのに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("SE*", 200, 0, null);

	DelusionIn();

//ＢＧ//渋谷路地裏//夜
	CreateBG(100, 0, Center, Middle, "cg/bg/bg021_01_3_渋谷路地裏猫死体_a.jpg");

	DelusionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
夕食を買いに出た。

いつも使う近所のコンビニへ向かう道。ベースからは歩いて３分程度の距離。

見慣れた風景。薄汚い路地。

だけど今日に限って、まるで異界にでも迷い込んでしまったかのような奇妙な感覚に襲われた。

風景そのものは変わっていないのに、初めてこの場所に足を踏み入れたような。

それに、生ゴミの腐ったような匂いも漂ってくる。

肌にまとわりつくジメジメとした湿気は、雨が降ったんじゃないかって勘違いしそうなくらいだ。空気が粘ついている気がする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//釘をコンクリートに打ち付ける音
	CreateSE("SE01","SE_衝撃_杭_打つ_LOOP");
	MusicStart("SE01", 0, 100, 0, 1000, null, true);

//※以下、ＳＥはずっと続く。最初はかすかに聞こえる程度

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
ふと見ると、薄暗い道の先になにかが落ちていた。

{	Zoom("back*", 3000, 2000, 2000, Dxl1, false);
	Move("back*", 3000, @0, @-200, Dxl1, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600090ta">
「…………」

それは最初、ゴミでも入っているただのコンビニ袋のように見えた。だから僕は何気なくそのまま歩いていった。

{	SetVolume("SE01", 3000, 200, NULL);}
そして数メートルのところまで近づいたところで――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back10", 100, 0, 0, "cg/bg/bg021_02_3_渋谷路地裏猫死体_a.jpg");
	Fade("back10", 500, 1000, null, true);

	CreateSE("SE20","SE_日常_寝がえりをうつ");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600010]
それが、猫の死体だと分かった。

{	FadeDelete("back10", 300, true);
	Zoom("back*", 500, 1000, 1000, null, false);
	Move("back*", 500, @0, @+200, Axl1, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600100ta">
「うげ……」

血と糞尿を垂れ流して地面に横たわっているそれから、僕は慌てて目をそらす。

{	CreateBG(100, 300, Center, Middle, "cg/bg/bg020_02_3_渋谷路地裏_a.jpg");
	Move("back*", 2000, -1200, 0, AxlDxl, false);}
気持ち悪さでゾワゾワと鳥肌が立ち、その場で踵を返した。

そこにも、猫がいた。
生きている、黒猫。
闇の中に浮かび上がる黄金の瞳が、僕を見つめていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600110ta">
「……な、なん、だよ……」

{	MusicStart("SE20", 0, 500, 0, 1000, null, false);
	CreateBG(100, 100, Center, Middle, "cg/bg/bg021_01_3_渋谷路地裏猫死体_a.jpg");}
僕が声を出すと、猫は素早い身のこなしで物陰へと姿を消す。
なんだかイヤな感じだった。

さっさとコンビニへ行こう。でもこの道は使えない。猫の死体があるから通れない。迂回するしかなかった。

……歩き出そうとして、気付く。
さっきから、妙な音が聞こえているような……

僕はゴクリと息を呑んでから、じっと耳を澄ました。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2500, 1000, NULL);
//５秒ほどウエイト

	Wait(3000);

//ＳＥ//杭を打つ音停止
	SoundStop2("SE01");

	Wait(1000);
//ＳＥ//猫の狂ったような断末魔
	CreateSE("SE02","SE_自然_動物_猫_だんまつま");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Wait(1000);

	SetVolume("SE02", 1000, 0, NULL);
	DelusionOut();

//ＢＧ//＠カフェ・ＲＯＯＭ３７
//教室に戻るのではなく、別の場所から始まる事によって、プレイヤーは手前のシーンが本当に妄想だったのか、もしくは未来ｏｒ過去のシーンが投げ込まれたものなのか怪しんでいます。
	CreateBG(100, 0, 0, 0, "cg/bg/bg034_01_3_ネットカフェ37_a.jpg");

	DelusionOut2();
	NegativeHuman();

//ＳＥ//空調
	CreateSE("SE01","SE_日常_ねっとかふぇ_空調_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600120ta">
「………………最悪だ」

僕はパソコンモニタの前に座っている。

のどの渇きを潤すために、コーラを口の中に流し込んで、リクライニングシートの上でため息をついた。

イヤな妄想をしちゃったよ……。

昨日から今日にかけて、いろいろとグロい話ばっかり聞かされてたせいだ。

僕は周囲に影響されて、よく自分でも思ってもみないような妄想をしちゃうことがあった。たいていは、自分の妄想にもかかわらずすごくイヤな気分になるんだ。

想像力がありすぎるのかな、僕って。

断片的な情報しかないときほど、そういう妄想が頭の中に浮かんでくる確率が高い。
あまりの怖さに悲鳴を上げちゃったりもする。

ベースでならともかく、学校とか、今僕がいるこのネットカフェみたいな場所でそんなマネをしたら、目もあてられない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流２へ

}


//=============================================================================//

if($妄想トリガー１ == 0)
{

//☆☆☆
//分岐５
//フラグ【１章エンドフラグ①】ＯＮ
	$１章エンドフラグ① = true;


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//ＳＥ//教室
	CreateTextureEX("back14", 100, 0, 0,  "cg/bg/bg018_02_0_教室席視線_a.jpg");
	Fade("back14", 0, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Delete("back13");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600130ta">
「ぼ、僕は、引きこもりじゃ――」

三住くんのあまりの言いように、抗議の声を上げようとした。

でもそれを言うことで彼に嫌われていじめられたりしたらどうしよう、と思うと、結局言葉を呑み込むしかない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("SE01", 2000, 0, null);

	CreateSE("SE02","SE_衝撃_衝撃音01");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
僕は唇を噛んで、三住くんから顔をそむけた。
何気なく視線をさまよわせ、黒板に書いてある文字をぼんやりと眺める。

最初は――
そこになんて書いてあるのかに興味はなかった。ただ“文字が描かれている”としか認識していなかった。

でも眺めているうちに、奇妙な違和感がむくむくとわき上がってきて。

{	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600140ta">
「え……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_席を立つ_勢いよく");
	MusicStart("SE01",0,1000,0,1000,null,false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
ついには、イスから腰を浮かしてしまっていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600150ta">
「ちょ、ちょっとどいて……！」

{	Stand("bu大輔_制服_通常","shock", 200, @+100);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00600160mi">
「イテテ、おい、どうしたんだよ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("bu大輔_制服_通常_shock", 300, @50, @0, Axl1, false);
	DeleteStand("bu大輔_制服_通常_shock", 300, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
三住くんを押しのけて、黒板に歩み寄る。
そこに書かれている文字を見て、僕は――
自分の心臓が、一瞬キュッと縮み上がったような錯覚に陥った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――
	
//ＳＥ//衝撃音
	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//イメージＢＧ//黒板に描かれた『その目だれの目？(;゜Д゜)』
//※それほど大きな文字ではないです。一文字が７×７センチぐらい
	CreateTextureEX("back02", 100, 0, 0, "cg/bg/bg022_01_0_黒板その目_a.jpg");
	Zoom("back02", 0, 1200, 1200, null, false);
	Fade("back02", 500, 1000, null, false);
	Zoom("back02", 500, 1000, 1000, null, true);

	Delete("back14");

	Wait(600);

//おがみ：実績：その目
	Eyes();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
――その目だれの目？

それは、僕がよく“神の視線”を感じたときに心の中でつぶやく言葉。

口外したことなんてない。

話す相手なんていない。

三住くんにだって話したことはない。
このクラスで、僕がその言葉をよく使っていることを知っている人間が、いるはずない。

どうして……
誰が……
なんのために……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//翠明学園・教室
	CreateBG(100, 0, 0, 0, "cg/bg/bg018_02_0_教室席視線_a.jpg");
	DrawTransition("back*", 300, 0, 1000, 100, null, "cg/data/right2.png", true);

//ＳＥ//教室
	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 500, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text800]
とっさに振り返り、教室内を見渡す。

僕の行動に注目しているのは、三住くんだけだ。

他は、みんな思い思いに親しい友達とだべっていたり、持ち込み禁止のマンガを読んでいたり、机に突っ伏して寝ていたりとさまざま。

誰だ……？
誰が、これを書いた？
いつ、書かれたんだ？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
if(#ClearG && !$RouteON){

	TypeBegin();//――――――――――――――――――――――――――――――

}else{

	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

}




//※※３６０以下
if(#ClearG && !$RouteON){

//イメージＢＧ//黒板に描かれた『その目だれの目？(;゜Д゜)』
	CreateBG(100, 300, 0, 0, "cg/bg/bg022_01_0_黒板その目_a.jpg");


//★優愛編_突入用分岐
//※以下のＹＥＳ／ＮＯ分岐は分岐しません。必ず全問に解答します
//全問正解で、優愛個別シナリオに分岐。以後、優愛編専用インターミッションなどが挿入されつつ７章までは通常通りに流れに

//※ＹＥＳ／ＮＯ分岐
//■選択肢開始====================================================
	StartWhich03();

//ＹＥＳ／ＮＯ選択肢１
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text801]
“こんなのただの偶然だ”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→ミス
//ＮＯ→正解
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
			}
			case @選択肢１:
			{
				YES03();
				$優愛ルート無し=true;
			}
		}
		Wait(16);
	}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢２
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text802]
“これはきっと目の錯覚だ”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→ミス
//ＮＯ→正解
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
			}
			case @選択肢１:
			{
				YES03();
				$優愛ルート無し=true;
			}
		}
		Wait(16);
		}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢３
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text803]
“犯人はこの学園内にいる”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
				$優愛ルート無し=true;
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
		}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢４
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text804]
“僕を挑発しているんだ”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
				$優愛ルート無し=true;
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
		}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢５
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text805]
“今すぐあれを消したい”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ＮＯ
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				$優愛ルート無し=true;
				NO03();
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
		}

//すべて正解の場合
//フラグ【優愛編確定】ＯＮ
//ひとつでもミスがあった場合
//フラグ発生せず

//■選択肢終了
	EndWhich03();

		if($優愛ルート無し){
		}else{
			$優愛ルート=true;
			$RouteON=true;
//○実績No.16：知・っ・て・る・よ・ね？
			XBOX360_Achieved(16);
		}

	}else{
	}

	if($優愛ルート==true){

	SetVolume("SE01", 3000, 700, NULL);

	CreateSE("SE03","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text806]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00600170mi">
「なあ？　どうしたんだ？」

歩み寄ってきた三住くんが、僕の肩をつかんで揺すってくる。

//【三住】
<voice name="三住" class="三住" src="voice/chn03/00000010mi">
「聞いてる？」

//【三住】
<voice name="三住" class="三住" src="voice/chn03/00000020mi">
「おーーい、タク？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00000030ta">
「…………」

こんなの、よくある言葉だ……。
下らない、どうでもいい落書きなんだ……。

そう思おうとしたけど、薄気味悪さを覚えて、結局、周囲の目に怯えながら、急いでその落書きを消した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//教室_3secF/out
	SetVolume("SE01", 3000, 0, null);

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, false);
	Fade("色１", 2000, 1000, null, true);

	Wait(3000);

//～～Ｆ・Ｏ

//※※３６０以上

//～～Ｆ・Ｏ

//この後、合流２へ


	}else{


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
僕が教室に入ってきたときには、もうすでに書かれてたっけ？
思い出せない……。黒板になにが書いてあるかなんて、普段はまったく意識していないし。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//黒板に描かれた『その目だれの目？(;゜Д゜)』
	CreateBG(100, 300, 0, 0, "cg/bg/bg022_01_0_黒板その目_a.jpg");

	SetVolume("SE01", 3000, 700, NULL);

	CreateSE("SE03","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00600170mi">
「なあ？　どうしたんだ？」

歩み寄ってきた三住くんが、僕の肩をつかんで揺すってくる。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00600180mi">
「聞いてる？」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00600190mi">
「おーーい、タク？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00600200ta">
「…………」

だ、誰が書いたものだろうと、僕にはきっと関係ないさ。
ただの偶然に決まってる……。
こんなの、よくある言葉だ……。

下らない、どうでもいい落書きなんだ……。
きっと、そうだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//教室_3secF/out
	SetVolume("SE01", 3000, 0, null);

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, false);
	Fade("色１", 1000, 1000, null, true);

//～～Ｆ・Ｏ



//イメージＢＧ//くすんだ青空
	CreateBG(100, 500, 0, 0, "cg/bg/bg018_03_0_教室席視線_a.jpg");

	BGMPlay360("CH01", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
そう思い込もうとしたけど、やっぱりどうしてもソワソワしてしまう。

誰があれを書いたのかは、結局分からずじまいだった。できればクラスの全員に聞いて回りたかったけど、そんな勇気もなかった。

そうこうしているうちにホームルームが始まっちゃって、あの落書きは“誰だ～、落書きしたヤツは～”という担任の言葉とともにあっさりと消されてしまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH01", 1000, 0, NULL);

	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

	Wait(500);

//ＢＧ//センター街
	CreateBG(100, 0, 0, 0, "cg/bg/bg009_02_2_107_a.jpg");
	DrawTransition("back*", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

//ＳＥ//センター街
	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 1500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
なんとなく薄気味悪さみたいなものを感じたけど、あえていつも通りを心がけることにする。

ヘタに怯えたりしたら、あれが僕と関係があるなんらかのメッセージだって認めちゃうことになるから。

そんなわけはないんだ。あれは単なる偶然だ。

何度も何度も自分にそう言い聞かせながら、僕は予定通り、学校帰りに行きつけのネットカフェへと向かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, NULL);

	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 0, null, false);
	Fade("背景１", 1000, 1000, null, true);


	}
}


//=============================================================================//

//☆Cut-55-----------------------------

//ＢＧ//＠カフェ・ＲＯＯＭ３７
	CreateBG(100, 500, 0, 0, "cg/bg/bg034_01_3_ネットカフェ37_a.jpg");

//ＳＥ//空調
	CreateSE("SE01","SE_日常_ねっとかふぇ_空調_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);

	FadeDelete("背景*", 0, false);


//☆☆☆
//合流２

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
『＠カフェ』は、外出嫌いの僕が唯一来るアミューズメントスポットだ。

渋谷のセンター街沿いにあって、ＤＱＮっぽい三次元女とか冴えないサラリーマンなどの客が多いけど、全室個室だから無問題。

//※３７＝素数
ちなみに今いる個室――ＲＯＯＭ３７――は僕の指定席と化していて、店内でも一番奥まったところにある。

飲み放題のジュースを取りに行くには不便だけど、近くの席にあまり人が入らないから比較的静かなんだ。


週に一度か二度、学校帰りにわざわざここに寄る理由は、エンスーに別のＩＤでログインするため。

要するに息抜きかな。ナイトハルトは名前が知られすぎちゃってるんだよね。

悪い気分じゃないけど、さすがに毎日毎日英雄として模範的行動を繰り返しているのもストレスがたまるものなのさ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 0, null, false);

	CreateMovie360("リーゼロッテ", 100, Center, Middle, true, false, "dx/mvNH03.avi");
//	Request("リーゼロッテ", Play);
	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
{#TIPS_アバター=true;$TIPS_on_アバター = true;}
というわけでこうして別<FONT incolor="#88abda" outcolor="BLACK">アバター</FONT>を作ってプレイしてるんだ。

{$TIPS_on_アバター = false;}
こっちで使ってるのは『リーゼロッテ』っていう女キャラ。
ただ、リーゼロッテの戦歴は今ひとつパッとしない。徹底して引き立て役をやらせているからね。


{#TIPS_ギルド=true;$TIPS_on_ギルド = true;}
今日も３時間ほどまったりプレイしてストレスを発散した。その後しばらく、<FONT incolor="#88abda" outcolor="BLACK">ギルド</FONT>の仲間とチャットで下らない話やエロい話で盛り上がった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


$TIPS_on_ギルド = false;

//ＳＥ//空調停止
	SetVolume("SE01", 500, 0, NULL);
	SetVolume("SE02", 500, 0, NULL);

//～～Ｆ・Ｏ


	Fade("背景１", 300, 1000, null, true);

	Delete("リーゼロッテ");
	Wait(500);

//ＢＧ//センター街//夜
	CreateBG(100, 0, 0, 0, "cg/bg/bg009_02_3_107_a.jpg");
	DrawTransition("back*", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("背景*");

	CreateSE("SE02","SE_日常_雑踏01");
	MusicStart("SE02", 1500, 1000, 0, 1000, null, true);

//	CreateSE("SE03","SE_日常_のいず");
//	MusicStart("SE03", 0, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
店を出たときには、夜の９時になろうとしていた。

この時間帯のセンター街は、特にＤＱＮが多い。

道のあちこちに我が物顔で座り込み、下品な笑い声をあげながらファーストフードのハンバーガーを食べている連中を見ると、反吐が出そうになる。

ヘタに目を合わしたら、あのバカどもはすぐに反応して攻撃してくるし。とことん野蛮だ。

あんなの人間じゃない。雄と雌だよ。社会的知性の欠片もないね。
あんな連中は死ね。氏ねじゃなくて死ね。

とは思いつつも、結局のところ相手をするだけ無駄なんだよね。僕は無駄なことはしない。だから急いでセンター街を離脱する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆☆☆
//ＢＧ//渋谷駅南口//夜

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg023_01_3_渋谷駅南口_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg023_01_3_渋谷駅南口_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
『＠カフェ』を出たら、近くにある『まんがだらけ』か、少し遠回りになるけど『アニメエイト』のどちらかに寄るのが僕の定番コースだ。

今日は『アニメエイト』に行くことに決め、駅の南口へ向かった。

こっち側に来るとＤＱＮの数は一気に減る。

ホント、センター街はカオスだ。あそこを歩くだけで息苦しささえ覚える。可能なら一歩たりとも近づきたくない。

『＠カフェ』と『まんがだらけ』だけ残して滅びてほしいよ。

さてと、今日もコミックや同人誌を物色していこう。

あ、そういえばブラチューのＤＶＤ５巻って予約受付がそろそろ始まるんじゃなかったっけ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//★梨深編
if(!$梨深ルート){
	SetVolume("SE02", 500, 0, null);
	
	ClearAll(1000);
	
	Wait(500);

}else{
	Wait(3000);
	SetVolume("SE02", 1000, 0, null);
	Wait(1000);
}



//～～Ｆ・Ｏ


}

