



chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_064a_★共通_妄想トリガー１２Ａ■";
		$GameContiune = 1;
		Reset();
	}

		ch03_064a_★共通_妄想トリガー１２Ａ■();
}


function ch03_064a_★共通_妄想トリガー１２Ａ■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev031_01_0_梢転校_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//※※３６０以下
//妄想トリガー分岐
//ポジティブ妄想→分岐１Ａへ
//ネガティブ妄想→分岐１Ｂへ
//妄想しない→分岐１Ｃへ
if($妄想トリガー通過１２Ａ == 0)
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
			$妄想トリガー１２Ａ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー１２Ａ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー１２Ａ = 0;
		}
	}

	if($妄想トリガー１２Ａ == 2)
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

if($妄想トリガー１２Ａ == 2)
{

//◆分岐１Ａ
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume360("CH*", 0, 0, null);
	MusicStart("@SE*",0,0,0,0,null,false);

	DelusionIn();

		ClearAll(0);
		BoxDelete(0);
		CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev031_01_0_梢転校_a.jpg");

	DelusionIn2();

	CreateSE("SE09","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE09", 1000, 400, true);
	Wait(1000);

//ＣＧ//梢初登場

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text101]
あの転校生が、僕を守るために悪魔を殺しに来た正義の使者だったらいいのに。

そう思ってしまうほど、梨深の存在が今の僕にとって脅威になっている。
僕の生活が、確実に侵食されているんだ。
このままじゃ、間違いなく殺される……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//教室
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg017_02_0_教室_a.jpg");
	Fade("背景２", 0, 0, null, true);
	Fade("背景２", 1000, 1000, null, true);

	Delete("背景１");


	SoundPlay("SE09", 1000, 1, true);

	Stand("st梢_制服_通常","sad", 400, @-200);
	FadeStand("st梢_制服_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601101]
//◆ここでの梢は、拓巳の妄想なので口調は普通
//◆心の声ではなく普通の声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000010ko">
「だから、私が来たの」

ふと、転校生が僕をじっと見つめて、そうつぶやく。

まさか……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
if(#ClearG && !$RouteON){
	TypeBegin();//――――――――――――――――――――――――――――――
}else{
	TypeBeginEX();//――――――――――――――――――――――――――――――
}


//※※３６０以下
if(#ClearG && !$RouteON){

//★梢編_突入用分岐
//※以下のＹＥＳ／ＮＯ分岐は分岐しません。必ず全問に解答します
//全問正解で、梢個別シナリオに分岐。以後、梢編専用インターミッションなどが挿入されつつ７章までは通常通りに流れに

//※ＹＥＳ／ＮＯ分岐
//■選択肢開始====================================================
	StartWhich03();

//ＹＥＳ／ＮＯ選択肢１
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
“僕を助けに来てくれた？”

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
				$梢ルート無し=true;
				NO03();
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
“転校生は悪魔払いのプロだ”

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
				$梢ルート無し=true;
				NO03();
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

//ＹＥＳ／ＮＯ選択肢３
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text903]
“弱そうに見えるのはカモフラージュだ”

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
				$梢ルート無し=true;
				NO03();
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
“梨深を殺してくれるんだ！”

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
				$梢ルート無し=true;
				NO03();
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
[text905]
“２人で殺し合え！”

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
				$梢ルート無し=true;
				YES03();
			}
			}
		Wait(16);
		}

//すべて正解の場合
//フラグ【梢編確定】ＯＮ
//ひとつでもミスがあった場合
//フラグ発生せず

//■選択肢終了
	EndWhich03();

	if($梢ルート無し){
	}else{
		$梢ルート=true;
		$RouteON=true;
//○実績No.15：ドカバキグシャーッ！
	XBOX360_Achieved(15);
	}

}
//※※３６０以上


//合流ＡＢ
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000020ko">
「拓巳くん。私はここに、殺すために来ました。悪魔を、滅ぼします」

転校生は、涙目なのに、その瞳に力強い感情を宿らせていた。
気弱に見えるのに、その言葉は頼もしく聞こえた。

きっと、傍目から見たら、明らかにデンパな発言。
転校早々のその奇天烈な言葉に、僕以外のクラスメイトは戸惑いの色を見せている。でも僕は、心の中で歓喜の叫びを上げていた。

――これで助かる！

きっとどこかの悪魔払い組織が、梨深を退治するためにエージェントを派遣してくれたんだ！　やった！　早く退治してくれ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ガタッと椅子を蹴って立ち上がる音
	CreateSE("SE001","SE_じん体_動作_席を立つ_勢いよく");
	SoundPlay("SE001", 0, 500, false);

	Wait(300);

	Stand("st梨深_制服_正面","hard", 500, @+200);
	FadeStand("st梨深_制服_正面_hard", 500, true);

	BGMPlay360("CH13", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000030ri">
「タク、だまされないで！」

背後から、梨深の焦ったような声が響いた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000040ri">
「その転校生の狙いは、あたしじゃない！　タクだよ！　その子の言うことを聞いちゃダメ！」

{	Stand("st梢_制服_通常","angry", 400, @-200);
	FadeStand("st梢_制服_通常_angry", 300, true);
	DeleteStand("st梢_制服_通常_sad", 0, true);}
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000050ko">
「悪魔さん、惑わすのはやめなさい。あなたはここで終わりです」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000060ri">
「悪魔はあなたでしょ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/00000070ta">
「う、うるさいな……」

この際、どっちが悪魔だとか、どっちが味方だとか、そんなのどうでもいいよ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/00000080ta">
「ぼ、僕は、ブラチューとエンスーをして毎日を平穏に過ごせれば、そ、そ、それでいいんだ。お前たちがどうなろうが、し、知ったことじゃない……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/00000090ta">
「と、とりあえず、２人で、殺し合ってくれると、た、助かる。で、相打ちで２人とも死亡ってエンディングを、き、希望」

僕の言葉をきっかけに、教室内に緊張が走る。

名前も知らない転校生と、つい一昨日までこの教室に存在しなかった悪魔女。

２人が、教室の前と後ろとでにらみ合い、一触即発の雰囲気を発している。

担任も、他のクラスメイトも、ただオロオロと成り行きを見守っているだけだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_通常","angry", 500, @+200);
	DeleteStand("st梨深_制服_正面_hard", 300, false);
	FadeStand("st梨深_制服_通常_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text103]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000100ri">
「……いいよ。タクの言う通りにしてあげる」

//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000110ko">
「私も、異論はないです」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000120ri">
「殺してあげるわ……暗殺者」

//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000130ko">
「あなたを殺します、悪魔さん」

{
	Move("st梨深_制服_通常_angry*", 300, @-200, @0, Axl3, true);
	Move("st梢_制服_通常_angry*", 300, @200, @0, Axl3, true);
	DeleteStand("st梨深_制服_通常_angry", 300, false);
	DeleteStand("st梢_制服_通常_angry", 300, false);}
そして２人は互いに飛びかかった――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//妄想ＯＵＴエフェクト
//妄想終了
	SetVolume360("CH*", 100, 0, null);
	MusicStart("@SE*", 100, 0, 0, 0, null, false);

	DelusionOut();

	Delete("背景*");
	Delete("色*");

	//ＣＧ//梢初登場
	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev031_01_0_梢転校_a.jpg");

	DelusionOut2();

	CreateSE("SE09","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE09", 1000, 800, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text104]
もちろんそんな展開になんてなるはずがなく。

転校生は相変わらずおどおどとしたまま、一言も発さず。
梨深もまた、わめき散らしたりしない。そもそも梨深がまだこの教室にいるのかどうか、僕は確認できずにいて――

なにも言おうとしない転校生に、クラスのざわつきはさらに大きくなる。担任が気遣うように転校生の肩をポンポンと叩く。

//【担任】
<voice name="担任" class="担任" src="voice/ch03/06400230tn">
「あー、どうやら折原は緊張しているようだな。よし、挨拶はいい」

//【担任】
<voice name="担任" class="担任" src="voice/ch03/06400240tn">
「みんな、この子は<RUBY text="おりはらこずえ">折原梢</RUBY>だ。仲良くしてやってくれ」

//【担任】
<voice name="担任" class="担任" src="voice/ch03/06400250tn">
「折原、席は一番後ろだ。席についていいぞ」

//【梢】
<voice name="梢" class="梢" src="voice/ch03/06400260ko">
//◆梢が無口なのはそういう性格です
「…………」

転校生は結局一言も喋ろうとしないままペコリと頭を下げると、こっちに歩いてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("SE09", 2000, 500, null);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg018_03_0_教室席視線_a.jpg");
	Fade("背景２", 1000, 1000, null, true);
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text105]
//ＢＧ//翠明学園教室
席は僕の４列後ろか。転校生が後ろに歩いていくのを見ていると装って、後列の人間の顔を確かめてみるべきだろうか。

だけどそれだってけっこう目立つ行為だ。

ＤＱＮに“転校生がかわいいからっていきなり目付けてんじゃねえぞ”とか意味不明な因縁を付けられちゃう恐れもある。

どうしよう。
振り返るべきか、それともホームルームが終わるまで待つべきか……。

うなだれたまま、拳をぎゅっと握りしめる。
ダメだ、勇気がない……。
もし振り返って、あの女と目が合ったらと思うと……ゾッとする。

//◆心の声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000140ko">
「その人って」

え……！？

//◆心の声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000150ko">
「悪い人なの？　だった～らね、ホントに、殺してあげてもいいよ」

僕の席のすぐ横を、転校生が通り過ぎていく。
ハッとして、僕は転校生の顔を見上げた。

目が合った。
と思ったら、すぐに彼女は顔をそむけ、僕の席から遠ざかっていってしまう。

今の声は……？

きっと、妄想、だろうな……。
追い詰められすぎて、現実と妄想がごっちゃになりつつあるのかも……。

僕はやっぱり背後を振り返る勇気を持てず、座ったままで身を縮こまらせた。僕を見ているであろう梨深への恐怖を、必死で押さえ込むことに集中した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	MusicStart("@SE*", 2000, 0, 0, 0, null, false);
	ClearAll(2000);
	Wait(1000);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg018_03_0_教室席視線_a.jpg");
	Fade("背景２", 1000, 1000, null, true);
	Delete("背景１");

//合流ＡＡへ

}

//=============================================================================//

if($妄想トリガー１２Ａ == 1)
{
//◆分岐１Ｂ
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
	SetVolume360("CH*", 0, 0, null);
	MusicStart("@SE*",0,0,0,0,null,false);

	DelusionIn();

		ClearAll(0);
		BoxDelete(0);
		CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev031_01_0_梢転校_a.jpg");

	DelusionIn2();

	CreateSE("SE09","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE09", 1000, 400, true);

	Wait(1000);

//ＢＧ//教室

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg017_02_0_教室_a.jpg");
	Fade("背景２", 0, 0, null, true);
	Fade("背景２", 1000, 1000, null, true);

	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text106]
あんな貧弱そうな転校生なんて、どうでもいい。
それより、今は梨深だ……。あの女を、なんとかしないと……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH05", 3000, 1000, true);
	Stand("st梨深_制服_通常","shock", 500, @+200);
	FadeStand("st梨深_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600106]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000160ri">
「あれれ？」

教室の後ろの方から、声がした。
梨深だ！　あの女がなにか喋り出した！

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000170ri">
「梢ちゃん、転校してきたの！？」

梢ちゃん？　誰だそれ？　梨深は、いったい誰に話しかけている！？

//【担任】
<voice name="担任" class="担任" src="voice/chn04/00000180tn">
「なんだ、咲畑。折原とは知り合いなのか？」

{	Stand("st梨深_制服_通常","smile", 500, @+200);
	FadeStand("st梨深_制服_通常_smile", 300, true);
	DeleteStand("st梨深_制服_通常_shock", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000190ri">
「はい、そうでーす」

勝手に話が進んでいる。僕はますます混乱する。
まともに思考が働かない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_通常","smile", 400, @-200);
	FadeStand("st梢_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601106]
//◆ここでの梢は、拓巳の妄想なので口調は普通
//◆心の声ではなく普通の声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000200ko">
「えへへ」

そこで転校生が、無邪気そうな笑みを浮かべた。

{	Stand("st梢_制服_通常","shy", 400, @-200);
	FadeStand("st梢_制服_通常_shy", 300, true);
	DeleteStand("st梢_制服_通常_smile", 0, true);}
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000210ko">
「梨深さんを追いかけて、私も来ちゃったの」

{	Stand("st梨深_制服_通常","normal", 500, @+200);
	FadeStand("st梨深_制服_通常_normal", 300, true);
	DeleteStand("st梨深_制服_通常_smile", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000220ri">
「そうなの？　やることがダイタンだなあ」

なんだ？　転校生と、梨深が、会話をしているのか！？
こいつら、知り合いだって！？
まさかこの転校生も……悪魔女の手下か！？

僕はただ凍り付いて、２人の呑気な会話を聞いているしかない。

{	Stand("st梢_制服_通常","smile", 400, @-200);
	FadeStand("st梢_制服_通常_smile", 300, true);
	DeleteStand("st梢_制服_通常_shy", 0, true);}
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000230ko">
「梨深さん、よろしくねっ」

{	Stand("st梨深_制服_通常","smile", 500, @+200);
	FadeStand("st梨深_制服_通常_smile", 300, true);
	DeleteStand("st梨深_制服_通常_normal", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000240ri">
「こちらこそ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 1000, 0, null);
	BGMPlay360("CH01", 1000, 1000, true);
	SoundPlay("SE09", 1000, 200, true);

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 10000, 800, null, false);

	Stand("st梨深_制服_正面","lost", 500, @+200);
	DeleteStand("st梨深_制服_通常_smile", 300, false);
	FadeStand("st梨深_制服_正面_lost", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text107]
//◆以下、梢も梨深もだんだん邪悪な口調に
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000250ri">
「これから楽しくなりそうだね、ふふ……」

{	Stand("st梢_制服_通常","mad", 400, @-200);
	FadeStand("st梢_制服_通常_mad", 300, true);
	DeleteStand("st梢_制服_通常_smile", 0, true);}
//■３６０
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000260ko">
//「うん。すごく、楽しくなるかも」
「うん。すっごく、楽しくなるかも」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000270ri">
「だよね。楽しみ」

//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000280ko">
「楽しみ～」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn04/00000290ri">
「ねえ、そう思わない？」

//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000300ko">
「思うよね？」

{	CreateVOICE("梨深","chn04/00000310ri");
	SoundPlay("梨深",0,1000,false);}

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
	


	SetVolume360("CH*", 0, 0, null);
	Fade("Black", 0, 1000, null, true);
	SoundPlay("SE09", 0, 1, true);

//▼べー：音声の関係上全然同期しないですが大丈夫でしょうか…？
//◆以下、同時
//	CreateVOICE("梨深","chn04/00000310ri");
//	SoundPlay("梨深",0,1000,false);

	SetBacklog("「ニシジョウタクミ」", "voice/chn04/00000310ri", 梨深);
	

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601107]
//【梨深】
//<voice name="梨深" class="梨深" src="voice/chn04/00000310ri">
//「ニシジョウタクミ」
//【梢】



<voice name="梢" class="梢" src="voice/chn04/00000320ko">
「ニシジョウタクミ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//◆以上、同時
//妄想ＯＵＴエフェクト
//妄想終了
	SetVolume360("CH*", 100, 0, null);
	MusicStart("@SE*", 100, 0, 0, 0, null, false);

	DelusionOut();

	DeleteStand("st梨深_制服_正面_lost", 0, true);
	DeleteStand("st梢_制服_通常_mad", 0, true);
	Delete("Black");
	Delete("背景*");
	Delete("色*");

	//ＣＧ//梢初登場
	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev031_01_0_梢転校_a.jpg");

	DelusionOut2();

	CreateSE("SE09","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE09", 1000, 800, true);

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text108]
//【担任】
<voice name="担任" class="担任" src="voice/ch03/06400230tn">
「あー、どうやら折原は緊張しているようだな。よし、挨拶はいい」

担任の声で、我に返る。
今のが単なる妄想だったことに、心の底から安堵した。
転校生は相変わらずおどおどとしたまま、一言も発していない。

//【担任】
<voice name="担任" class="担任" src="voice/ch03/06400240tn">
「みんな、この子は<RUBY text="おりはらこずえ">折原梢</RUBY>だ。仲良くしてやってくれ」

//【担任】
<voice name="担任" class="担任" src="voice/ch03/06400250tn">
「折原、席は一番後ろだ。席についていいぞ」

//【梢】
<voice name="梢" class="梢" src="voice/ch03/06400260ko">
//◆梢が無口なのはそういう性格です
「…………」

転校生は結局一言も喋ろうとしないままペコリと頭を下げると、こっちに歩いてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("SE09", 2000, 500, null);

//ＢＧ//翠明学園教室

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg018_03_0_教室席視線_a.jpg");
	Fade("背景２", 1000, 1000, null, true);
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text109]
席は僕の４列後ろか。転校生が後ろに歩いていくのを見ていると装って、後列の人間の顔を確かめてみるべきだろうか。

だけどそれだってけっこう目立つ行為だ。
ＤＱＮに“転校生がかわいいからっていきなり目付けてんじゃねえぞ”とか意味不明な因縁を付けられちゃう恐れもある。

どうしよう。
振り返るべきか、それともホームルームが終わるまで待つべきか……。

うなだれたまま、拳をぎゅっと握りしめる。
ダメだ、勇気がない……。
もし振り返って、あの女と目が合ったらと思うと……ゾッとする。

//◆心の声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000140ko">
「その人って」

え……！？

//◆心の声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00000150ko">
「悪い人なの？　だった～らね、ホントに、殺してあげてもいいよ」

僕の席のすぐ横を、転校生が通り過ぎていく。
ハッとして、僕は転校生の顔を見上げた。

目が合った。
と思ったら、すぐに彼女は顔をそむけ、僕の席から遠ざかっていってしまう。

今の声は……？

きっと、妄想、だろうな……。
追い詰められすぎて、現実と妄想がごっちゃになりつつあるのかも……。

僕はやっぱり背後を振り返る勇気を持てず、座ったままで身を縮こまらせた。

僕を見ているであろう梨深への恐怖を、必死で押さえ込むことに集中した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	MusicStart("@SE*", 2000, 0, 0, 0, null, false);
	ClearAll(2000);
	Wait(1000);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg018_03_0_教室席視線_a.jpg");
	Fade("背景２", 1000, 1000, null, true);
	Delete("背景１");

//合流ＡＡへ
}


//=============================================================================//

if($妄想トリガー１２Ａ == 0)
{


	CreateSE("SE09","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE09", 1000, 800, true);
	SetVolume("SE09", 5000, 0, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
なにも言おうとしない転校生に、クラスのざわつきはさらに大きくなる。担任が気遣うように転校生の肩をポンポンと叩く。

//【担任】
<voice name="担任" class="担任" src="voice/ch03/06400230tn">
「あー、どうやら折原は緊張しているようだな。よし、挨拶はいい」

//【担任】
<voice name="担任" class="担任" src="voice/ch03/06400240tn">
「みんな、この子は<RUBY text="おりはらこずえ">折原梢</RUBY>だ。仲良くしてやってくれ」

//【担任】
<voice name="担任" class="担任" src="voice/ch03/06400250tn">
「折原、席は一番後ろだ。席についていいぞ」

//【梢】
<voice name="梢" class="梢" src="voice/ch03/06400260ko">
//◆梢が無口なのはそういう性格です
「…………」

転校生は結局一言も喋ろうとしないままペコリと頭を下げると、こっちに歩いてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("SE09", 2000, 500, null);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg018_03_0_教室席視線_a.jpg");
	Fade("背景２", 1000, 1000, null, true);
	Delete("背景１");

	SetVolume360("CH03", 3000, 0, null);

//ＢＧ//翠明学園教室

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
席は僕の４列後ろか。転校生が後ろに歩いていくのを見ていると装って、後列の人間の顔を確かめてみるべきだろうか。

だけどそれだってけっこう目立つ行為だ。

ＤＱＮに“転校生がかわいいからっていきなり目付けてんじゃねえぞ”とか意味不明な因縁を付けられちゃう恐れもある。

どうしよう。
振り返るべきか、それともホームルームが終わるまで待つべきか……。

うなだれたまま、拳をぎゅっと握りしめる。

ダメだ、勇気がない……。

もし振り返って、あの女と目が合ったらと思うと……ゾッとする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE*", 1000, 0, true);


	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//テレパシーみたいなものです。梢は実際には喋っていない
//ＶＦ//心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch03/06400270ko">
「この人……似てる……」

その声は、僕の耳に確かに聞こえた。
僕の席のすぐ横を、転校生が通り過ぎていく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06400280ta">
「え？」

気が付けば、自分でも意識しないままに顔を上げていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("まばたき", 1000, 0, 0, 1280, 720, "BLACK");
	Fade("まばたき", 0, 0, null, true);


	Stand("bu梢_制服_武器構え青","sad", 500, @200);
	Stand("bu梢_制服_正面","sad", 500, @200);
	FadeStand("bu梢_制服_武器構え青_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
//キャラ表示//梢（ディソード持ち）
転校生は一瞬だけ、僕の席のすぐ横で足を止めた。でもこっちを振り返ろうとはしない。
彼女は、いつの間にか、巨大な鉄板のようなものを持っていて……。

{	Fade("まばたき", 0, 1000, null, true);
	DeleteStand("bu梢_制服_武器構え青_sad", 0, true);
	FadeStand("bu梢_制服_正面_sad", 0, true);
	Fade("まばたき", 200, 0, null, true);}
//キャラ表示//梢（ディソードなし）
あ……れ……？

まばたきをした瞬間に、その鉄板は消えていた。
なんだ、今の……？
目の錯覚……？

//ＶＦ//心の声
//すごく小声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch03/06400290ko">
「同じクラスでよかった」

{	DeleteStand("bu梢_制服_正面_sad", 500, true);
	CreateSE("SE09","SE_日常_がっ校_教室_LOOP");
	SoundPlay("SE09", 2000, 200, true);}
//それだけだった。
転校生はすぐに、僕の席から遠ざかっていってしまう。

今のは、
僕に言ったのか？

どうしていきなり、僕に話しかけてくるんだ？

似ている？
同じクラスでよかった？

前に一度会ったことがあるんだろうか。
いや、あの顔にまったく見覚えはない。

どこかのエロゲみたいに、昔一緒に遊んでいた幼なじみがいたっていう設定も僕にはない。

やっぱりモテ期なんだろうか。

それとも――

あの転校生も、悪魔女の手下か？
だとしたらまた包囲網は狭まってしまった。
ますます逃げ場がなくなりつつある――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("まばたき");

}


//=============================================================================//
//合流ＡＡ
//※※３６０以上

//ＳＥ//チャイム

	SoundPlay("SE09", 2000, 500, true);
	CreateSE("SE04","SE_日常_チャイム");
	SoundPlay("SE04", 0, 1000, false);

	Wait(3000);


	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Fade("背景３", 1000, 1000, null, true);

	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
頭の中で新たに浮かんできた疑問を必死に考えている間に、
ホームルームはあっさり終わっていた。

一限目の授業が始まるまで５分ほどの時間がある。

三住くんはさっそく転校生の席に突撃していった。いきなりナンパを仕掛けるつもりらしい。

他のクラスメイトも転校生には興味津々みたいで、いつもより教室内はざわつきが激しい。

一見すると脳天気で平和な光景。

でも僕にとっては、敵陣まっただ中にいるにも等しい。
さっきからずっと鼓動が治まらない。
全身が緊張し、指の一本を動かすにもすごい勇気がいる。

振り返りたい衝動と、そうしてはいけないっていう理性がせめぎ合っていた。

{	Wait(500);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400300ri">
「タク」

{	CreateColor("色１", 150, 0, 0, 1280, 720, "White");
	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE04", 2000, 0, false);
	SoundPlay("SE09", 2000, 0, false);
	Fade("色１", 0, 500, null, true);
	Fade("色１", 2000, 0, null, false);
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06400310ta">
「……！」

呼吸が止まりそうになった。
頭の中が真っ白になる。
声はすぐ背後から聞こえる。

やっぱり、いるんだ。
この場に、あの女は存在しているんだ……！

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400320ri">
「具合悪そうだけど」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400330ri">
「平気？」

逃げろ――
逃げるんだ――

そうは思っていても、足が震えてうまく立ち上がれそうにない。

僕が固まっている間に、
悪魔女が、
咲畑梨深が、

僕の席の正面に回り込んできた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",0,800,true);

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 2000, 0, 770, 100, Dxl2, "cg/data/center.png", true);

	Stand("bu梨深_制服_正面","sad", 200, @0);
	FadeStand("bu梨深_制服_正面_sad", 500, true);

	Wait(500);

//ＣＨ//梨深
//※例えばここでの梨深の立ち絵表示方法として「口から上はあえて画面内に表示しない」（つまり口から上が見切れている）というのも面白いかもです。拓巳が「視線を合わせられない」ことをビジュアル的に表現させられます

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400340ri">
「汗びっしょり。風邪でもひいたんじゃない？」

一昨日と同じように、僕に心配そうな声をかけてくる。
一昨日と同じように、フローラルな香りがするハンカチを差し出してくる。

それは受け取らずに、手で慌てて汗を拭った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06400350ta">
「な、んで……」

{	Stand("bu梨深_制服_正面","normal", 200, @0);
	FadeStand("bu梨深_制服_正面_normal", 300, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400360ri">
//◆笑顔
「ん？　なに？」

目を合わせられない。
どうやら向こうは笑顔を浮かべているらしいことは、声の調子から分かるけど。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400370ri">
「ねえねえ。さっき、なに話してたの？」

梨深は僕に目線を合わせようとして、その場にしゃがみ込み机に頬杖を突いた。こっちの顔をのぞき込んでくる。

必死で僕は目をそらした。
くそ、どうしても僕を逃がさないつもりか。
緊張感で心臓が張り裂けそうだ。誰か助けてくれ……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400380ri">
「すっごく気になるー」

こいつ、さっきからなにが言いたいんだ。
話してたって、なんのことだよ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400390ri">
「転校生」

//梢の声は心の声であり、本来は他人に聞こえるはずのない声です。なのに梨深は聞こえていた＝伏線
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400400ri">
「あの子がタクの机の横を通るときに、小声でさ。ボソボソーっと」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//おがみ：整合性統合のため削除　12/18
/*
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 200, 1000, null, true);
	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	Fade("色１", 0, 0, null, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg018_03_0_教室席視線_a.jpg");
	Stand("bu梢_制服_通常","sad", 100, @200);
	FadeStand("bu梢_制服_通常_sad", 0, true);
	Fade("回想フラッシュ", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//ＶＦ//回想セリフ
//【梢】
<voice name="梢" class="こずえ" src="voice/ch03/06400410ko">
「この人……似てる……」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch03/06400420ko">
「同じクラスでよかった」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 500, 1000, null, true);
	DeleteStand("bu梢_制服_通常_sad", 0, true);
	Stand("bu梨深_制服_正面","normal", 200, @0);
	FadeStand("bu梨深_制服_正面_normal", 0, true);
	Delete("背景２");
	Delete("回想明度");
	Fade("色１", 0, 1000, null, true);
	Fade("回想フラッシュ", 500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(500);

*/
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400430ri">
「もしかしてあの子と知り合い？」

梨深は笑顔のまま。でも声が少し詰問口調に変化しているように感じるのは僕の気のせい？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400440ri">
「タクってリアルの女の子に興味ないんじゃなかったっけ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400450ri">
「もしかしてホントは興味あるの？」

それを聞いてどうするつもりなんだ……。

こいつ、僕の個人情報を聞き出して悪用でもするつもりか？

結論から言えば三次元女に興味はない。
それはいつも僕が口を酸っぱくして言っていることだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400460ri">
「じゃあさ、じゃあさ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400470ri">
//◆照れくさそう
「あたしにも実は興味……あったりする？　たはは……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06400480ta">
「…………」

背筋に悪寒が走った。

拭ったばかりなのに、早くも額から新たな汗が噴き出してくる。

今のは、殺害予告……？
それとも、悪魔女の仲間になれって誘ってるのか？
あるいは、萌える仕草を演じて誘惑し罠にはめるつもりか？

頭の中に危険信号が鳴り響く。
悪魔とこれ以上喋るな。
でないと僕は破滅する！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//勢いよく席を立つ
	DrawTransition("色１", 200, 770, 1000, 100, Dxl3, "cg/data/center.png", true);
	DeleteStand("bu梨深_制服_正面_normal", 0, true);
	CreateSE("SE09","SE_じん体_動作_席を立つ_勢いよく");
	SoundPlay("SE09", 0, 500, false);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/06400490ri">
「あ、タク……！？」

{	CreateSE("SE09","SE_じん体_動作_足_走る_LOOP");
	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	SoundPlay("SE09", 0, 1000, false);
	Wait(500);
	SoundPlay("SE02", 0, 500, false);
	SoundPlay("SE09", 2000, 0, false);}
夢中だった。
とにかく慌てて立ち上がり、あちこちの机に足をぶつけながらも急いで教室を飛び出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 1000, 0, false);

	ClearAll(2000);

	Wait(2000);
}