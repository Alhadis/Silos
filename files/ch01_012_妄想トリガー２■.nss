//<continuation number="1010">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_012_妄想トリガー２■";
		$GameContiune = 1;
		Reset();
	}

	ch01_012_妄想トリガー２■();
}


function ch01_012_妄想トリガー２■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Delete("背景２");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	BGMPlay360("CH08", 2000, 1000, true);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐６へ
//ネガティブ妄想→分岐７へ
//妄想しない→分岐８へ

if($妄想トリガー通過２ == 0)
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
			$妄想トリガー２ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー２ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー２ = 0;
		}
	}

	if($妄想トリガー２ == 2)
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

if($妄想トリガー２ == 2)
{
//☆☆☆
//分岐６

	DelusionIn();

	BoxDelete(0);

	CreateTextureEX("背景０", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("背景０", 0, 1000, null, false);



	DelusionIn2();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
七海の白いのどが、艶めかしく上下している。
コクリ、コクリ、という音が聞こえてくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200010ta">
「せ、せめて……コップ、使えよ……」

女のくせにラッパ飲みなんて。なんてはしたないんだ。
これだから三次元はクソなんだよ、まったく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH08", 5000, 0, NULL);

	Stand("st七海_制服_通常","angry", 200, @+100);
	FadeStand("st七海_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200020na">
「…………」

と、七海は飲むのをやめて、ムッとした表情になった。
こころなしかその顔が赤く見えるのは気のせいかな？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH05", 3000, 1000, true);

	Stand("st七海_制服_拗ね","angry", 200, @+100);
	DeleteStand("st七海_制服_通常_angry", 300, false);
	FadeStand("st七海_制服_拗ね_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//ちょっと拗ねるように
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200030na">
「だって、ナナはおにぃと間接キスしたかったんだもん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200040ta">
「……へ？」

いきなりの爆弾発言だった。

拗ねるような態度で、でも上目遣いで僕を見つめてくる。

僕の全身に電撃が走った。妹の潤んだ瞳から目を離せない。

こ……これは……なんというエロゲ的フラグ……！
実妹攻略可ですか！

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200050na">
「軽蔑した？」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200060na">
「だとしたら……ナナ、悲しくなっちゃうな……」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200070na">
「言っとくけど、おにぃ相手じゃなきゃ、こんなこと、しないんだからね」

七海の声はだんだん小さくなっていく。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200080na">
「おにぃのバカ……」

{	DeleteStand("st七海_制服_拗ね_angry", 300, false);}
いつもの生意気な態度はどこへやら、蚊が鳴くようにささやいて、ついにはうなだれてしまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 2000, Center, Middle, "cg/ev/ev015_01_1_七海妄想エロ_a.jpg");
	Request("背景１", Smoothing);
	Zoom("背景１", 0, 500, 500, null, false);
	Fade("背景１", 300, 1000, null, true);

	Delete("背景０");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//ウィスパー
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200090na">
「ねえ、おにぃ……」

//ウィスパー
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200100na">
「間接だけじゃ……ヤダな……」

僕は息を呑もうとした。でも唾がのどにからんで、うまく行かない。

それほど、僕は追い込まれていた。
七海の言葉の意味が、よく分からなかった。

//ウィスパー
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200110na">
「おにぃと……キス、したいよぅ……」

//ウィスパー
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200120na">
「おにぃが……ほしいよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("背景１", 1000, @-160, @0, null, false);
	Zoom("背景１", 1000, 700, 700, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
立ち尽くしている僕に、一歩、七海がにじり寄ってくる。

どうしてだろう。相手はしょんべんくさいガキンチョだとばかり思ってた七海なのに、

僕は今、すごく、ドキドキしてしまっている……

//ウィスパー
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200130na">
「いいじゃん……」

//ウィスパー
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200140na">
「１６年間も、我慢してきたんだよ……？」

七海は、伸ばした両手を僕の首に絡みつけてくる。

//ウィスパー
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200150na">
「キス……して……」

せがむように。
顎を少しだけそらして。
{	CreateTextureEX("背景２", 2000, Center, Middle, "cg/ev/ev015_02_1_七海妄想エロ_a.jpg");
	Request("背景２", Smoothing);
	Move("背景２", 0, @-160, @0, null, false);
	Zoom("背景２", 0, 700, 700, null, false);
	Fade("背景２", 500, 1000, null, true);
	Delete("背景１");}
七海はそっと目を閉じた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200160ta">
「…………」

僕の、答えは……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);

if(#ClearG && !$RouteON){
	TypeBegin();//――――――――――――――――――――――――――――――
}else{
	TypeBeginEX();//――――――――――――――――――――――――――――――
}



//※※３６０以下
if(#ClearG && !$RouteON){

//★七海編_突入用分岐
//※以下のＹＥＳ／ＮＯ分岐は分岐しません。必ず全問に解答します
//全問正解で、七海個別シナリオに分岐。以後、七海編専用インターミッションなどが挿入されつつ７章までは通常通りに流れに

//※ＹＥＳ／ＮＯ分岐
//■選択肢開始====================================================
	StartWhich03();

//ＹＥＳ／ＮＯ選択肢１
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
“僕は姉の方が好きです。”

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
				$七海ルート無し=true;
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
“ひんぬーは好きです。”

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
				$七海ルート無し=true;
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
“七海以外でも３次元での相手はいる”

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
				$七海ルート無し=true;
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
“七海はかわいい。それは認める”

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
				$七海ルート無し=true;
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
“七海たんとチュッチュしたいよぉ”

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
				$七海ルート無し=true;
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
//フラグ【七海編確定】ＯＮ
//ひとつでもミスがあった場合
//フラグ発生せず

//■選択肢終了
	EndWhich03();

	if($七海ルート無し){
	}else{
		$七海ルート=true;
		$RouteON=true;
//○実績No.12：おにぃのバカ！
		XBOX360_Achieved(12);
	}

//※※３６０以上

if($七海ルート){

//二週目：フラグ成功
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text997]
よ、よし、わかった。七海がそこまで言うなら、キスしてやる。僕も、お、男だからな。七海には色気はないけど、せめて一生に一度ぐらい、僕も、リアル女子と、キ、キス、したいし……。

{	SetVolume360("CH05", 500, 0, NULL);}
この際、妹でもいい……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



}else if(!$七海ルート){


//二週目：フラグ失敗
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text998]
そうだ、僕の答えは……

{	SetVolume360("CH05", 500, 0, NULL);}
//※わざとすべてひらがなです
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200170ta">
「いや、そのりくつはおかしい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



}
}else{



//一週目
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text999]
{	SetVolume360("CH05", 500, 0, NULL);}
//※わざとすべてひらがなです
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200170ta">
「いや、そのりくつはおかしい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

}

	DelusionOut();

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Delete("背景２");

	DelusionOut2();
	PositiveHuman();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//わざとスペース開けてます
//ＢＧ//拓巳の部屋
こ　れ　は　酷　い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
自分で妄想しておいてなんだけど、ドン引きだ。すごく自己嫌悪だよ。

//※「きんもーっ」＝「気持ち悪い」
{#TIPS_きんもーっ☆ = true;$TIPS_on_きんもーっ☆ = true;}
っていうか、<FONT incolor="#88abda" outcolor="BLACK">きんもーっ☆</FONT>　僕かなりきんもーっ☆

{$TIPS_on_きんもーっ☆ = false;}
つくづく思う。

七海が義妹で、もっと妹らしいかわいらしさを持ち合わせていたなら、僕は人生における勝ち組だったかもしれないのに、って。

{	BGMPlay360("CH08", 2000, 1000, true);
	Stand("st七海_制服_通常","pride", 200, @+100);
	FadeStand("st七海_制服_通常_pride", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200180na">
「？？」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200190na">
「どしたの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200200ta">
「…………」

コーラを飲み終えた七海が、僕を不思議そうに見ていた。

いかんいかん。今の妄想のせいで、変に意識しちゃうじゃないか。
深呼吸して、キモい妄想を頭の中から振り払った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//合流３へ


}


//=============================================================================//

if($妄想トリガー２ == 1)
{

//☆☆☆
//分岐７

	SetVolume360("CH08", 5000, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
くそぅ、七海のヤツ、何様のつもりだよ……。

お前なんて、コーラの飲み過ぎで腹を壊して病院に担ぎ込まれればいいんだ。
そうすれば僕の平穏な時間も脅かされずに済むし。

はあ、ホントにそうならないかな……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	BoxDelete(0);

	DelusionIn();

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	DelusionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//飲んでいる途中で苦痛のうめき声
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200210na">
「う……っ」

と、七海が急にうめき声を上げたかと思うと――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ペットボトルを落とす七海、コーラが床にぶちまかれる
	CreateSE("SE01","SE_衝撃_ぺっとぼとる");
	CreateSE("SE02","SE_じん体_動作_おうと");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	MusicStart("SE02", 0, 400, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
その手からペットボトルが滑り落ち、床にコーラがぶちまかれる。
置かれてあったマンガ雑誌やＣＤにそれがかかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200220ta">
「ちょ、おま……！」

僕の部屋を汚すな、と言おうとして、ハッとした。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200230na">
「うう……う……」

{	BGMPlay360("CH06", 800, 1000, true);}
七海が苦しそうに自分の首を押さえ、目を剥いている。
鯉みたいに口をパクパクとさせていた。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200240na">
「かはっ……ああ……ご……う……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200250ta">
「な、七海……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200260na">
「げほっ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//吐血
	CreateSE("SE01","SE_じん体_動作_と血");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
血を吐いた。赤い――というよりは赤黒い血が、床のコーラと混じり合う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//倒れる七海
	CreateSE("SE01","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE01", 400, 700, 0, 1000, null, false);

	CreateTextureEX("背景３", 200, 0, 40, "cg/ev/ev802_01_1_七海コーラ死_a.jpg");
	Fade("背景３", 200, 1000, null, true);

	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
その上に、七海は力なく倒れ込んだ。

全身を痙攣させ、もがき苦しみ出す。
自らの首に爪を立て、かきむしるようにしている。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200270na">
「はあっ、はあっ、がああああああ――」

スカートがまくれ、パンツが見えてしまうのも構わず、七海は足をばたつかせてのたうち回っていた。

こんな例えは不謹慎だけど……まな板の上に乗せられた魚みたいだって、ぼんやりと思った。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200280na">
「ああっ、あああああ……」

僕は――
なにをすればいいのか分からず、ただ耳を塞いだ。

でも、それでも妹の断末魔は聞こえてくる。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200290na">
「げぼっ、がっ、はっ、げっ、う゛ぁっ、あ……お……はっ……あ……」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200300na">
「でぃ…………い……」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200310na">
「…………」

やがて涙とよだれと血で顔をぐしょぐしょにして、七海の身体の震えは止まった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200320ta">
「七海……？」

恐る恐る呼びかけてみる。反応はない。あられもない格好で横たわっている。

アンモニアの匂いが鼻をついた。
失禁したのは、七海なのか、僕なのか……

そっと、七海の肩を指でつついてみた。ピクリとも動かない。
少し気持ち悪かったけど、思い切って口元に顔を近づけてみた。

呼吸を、していなかった。

死んでる。

七海が、死んだ。

ドラマでよくある、毒殺みたいだった。

そうか、と合点がいく。
僕が、七海を殺すためにコーラに毒を入れたんだ。そうに違いない。

{	SetVolume360("CH06", 500, 0, NULL);}
//※わざとこういうセリフです
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200330ta">
「何故殺した」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DelusionOut();

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	Delete("背景３");
	DelusionOut2();
	NegativeHuman();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200340ta">
「うえ……」

これはさすがに、自分で妄想しておいてなんだけど、気分が悪くなった。

っていうかさすがにやり過ぎだ。

{#TIPS_フルボッコ = true;$TIPS_on_フルボッコ = true;}
いくら七海が生意気だからって、あんなリアルな死に方を妄想しなくてもよかった。せめて<FONT incolor="#88abda" outcolor="BLACK">フルボッコ</FONT>ぐらいで止めておくべきだった。

{	BGMPlay360("CH08", 2000, 1000, true);
	Stand("st七海_制服_通常","pride", 200, @+100);
	FadeStand("st七海_制服_通常_pride", 500, true);}
{$TIPS_on_フルボッコ = false;}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200350na">
「？？」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200360na">
「どしたの？」

コーラを飲み終えた七海が、僕を不思議そうに見ている。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200370na">
「なんか顔色悪いけど」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200380ta">
「…………」

僕は小さく首を振り、

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200390ta">
「ご、ごめん……」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200400na">
「なにが？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200410ta">
「と、とにかく、ご、ごめん」

妄想の中でとは言え、お前にひどいマネをしちゃったよ。ごめんな。

でもそれだけ僕の中で、お前の生意気さに対する鬱憤が溜まってるってことなんだ。
それは理解してほしい。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200420na">
「別に謝らなくてもいいのに。ミルクティがないくらいで、ナナ怒んないよ」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200430na">
「それになんだかんだ言って、コーラも好きだし」

あ、っていうかこいつ、僕のコーラを、の、の、飲み干しやがった……！

前言撤回。七海になんて謝る必要ないね。
こいつは腹を切って死ぬべきだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//合流３へ


}


//=============================================================================//

if($妄想トリガー２ == 0)
{


//☆☆☆
//分岐８


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
ばっちいなあ。直接口をつけやがって。
女のくせになんてだらしないんだ。

これだから三次元はクソなんだよ、まったく。
あのコーラは七海が帰ったら捨てよう。

//飲む
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200440na">
「んくっ、んくっ」

って、ちょ、おま……

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200450na">
「ぷはっ……」

//飲み終えて一息つく
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200460na">
「ふう」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_通常","smile", 200, @+100);
	FadeStand("st七海_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200470na">
「おいしかったぁ」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200480na">
「やっぱ運動の後の一杯って格別。学校からここまで走ってきたんだー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200490ta">
「……ぜ、全部、飲んだのか……し、しかも一気で……」

そのコーラは僕が自分の金で買ってきたものなのに。<k>
こいつは妹っていうだけで、遠慮もなしですかそうですか……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_通常","shock", 200, @+100);
	FadeStand("st七海_制服_通常_shock", 300, true);
	DeleteStand("st七海_制服_通常_smile", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200500na">
「あ……し、しまった……」

七海は空になったペットボトルを見て、青ざめている。どうやら自分が兄に対して失礼なことをしたって、ようやく気付いたらしい――

{	Stand("st七海_制服_通常","angry", 200, @+100);
	DeleteStand("st七海_制服_通常_shock", 300, false);
	FadeStand("st七海_制服_通常_angry", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200510na">
「どうしよう、また太っちゃうじゃんっ！」

はあ？(　ﾟдﾟ)

{	Stand("st七海_制服_拗ね","angry", 200, @+100);
	DeleteStand("st七海_制服_通常_angry", 300, false);
	FadeStand("st七海_制服_拗ね_angry", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200520na">
「おにぃのせいだからねー」

//おがみ：テキスト削除　12/17
//七海の矛先は、なぜか僕に向けられた。
意味が分からない。

//コーラ好きなせい＝こーらずきなせい
//大好きっ娘＝だいすきっこ
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200530na">
「おにぃがコーラ好きなせいで、ナナまでコーラ大好きっ娘に
なっちゃったんだからぁ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200540ta">
「ひ、人のせいに……するなよ……」

{	Stand("st七海_制服_通常","pride", 200, @+100);
	DeleteStand("st七海_制服_拗ね_angry", 300, false);
	FadeStand("st七海_制服_通常_pride", 300, true);}
//家＝ウチ
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200550na">
「だって家の冷蔵庫に入ってるの、いっつもコーラだったじゃん」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200560na">
「お母さんがおにぃのこと甘やかすからだ」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200570na">
「知ってる？　コーラってカロリーすっごく高いの。だからおにぃもあんまり飲み過ぎない方がいいよ」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200580na">
「今度からミルクティにすべき」

ミルクティもコーラもカロリーは似たようなものだろ……。
だいたい、お前に僕の食生活まで管理される覚えはないぞ、くそぅ。

勝手に僕のコーラを飲み干しておいて、なんて言い草だ。こんなこと言うためにここに来たのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//合流３へ


}


//=============================================================================//

//☆☆☆
//合流３

	BGMPlay360("CH08", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200590ta">
「も、もう……帰れよ……」

生存確認できたんだから、もう用はないはずだろ。
なんでいちいち部屋に上がり込んでくるんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_拗ね","angry", 200, @+100);
	DeleteStand("st七海_制服_通常_pride", 300, false);
	FadeStand("st七海_制服_拗ね_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200600na">
「おにぃ……冷たい」

//☆☆☆
七海は僕の言葉にカチンと来たみたいだった。
唇を尖らせてにらみつけてくる。面倒くさいので、僕は目をそらした。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200610na">
「せっかく、心配して様子を見に来てあげてるのに……」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200620na">
「おにぃって、ずっとここに引きこもって誰とも喋らずに１日を終えちゃうことだってあるんでしょ？」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200630na">
「女の子と話す機会だって、どうせまったくないんだよね？」

う、うるさいな、バカにしやがって……。
三次元女になんて興味ないんだから、話す必要もないんだよ。

{	Stand("st七海_制服_通常","normal", 200, @+100);
	DeleteStand("st七海_制服_拗ね_angry", 300, false);
	FadeStand("st七海_制服_通常_normal", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200640na">
「言ってみればおにぃと話す女の子はナナだけってことじゃん？」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200650na">
「だからさ、もっとナナのこと大事にしてよ。そしたら女の子との接し方もちょっとは分かってくるはずだし」

{	DeleteStand("st七海_制服_通常_normal", 300, false);}
//『光へのスーサイド』＝アニメのタイトル。適当。
七海は語りながら、フィギュアのひとつ――『光へのスーサイド』のヒカルたんだ――を手に取り、しげしげと眺める。

くそう、僕の嫁のひとりを勝手に触るな……。
指紋とかつけたらマジでぶっ飛ばしてやる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_通常","pride", 200, @+100);
	FadeStand("st七海_制服_通常_pride", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200660na">
「あと、おにぃは自分のことにもっと気を遣って」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200670na">
「こんなお人形さんにうつつを抜かしてる場合じゃないよ。ナナは、おにぃの死体の第一発見者になんかなりたくないからね？」

この妹はいったいなにが言いたいんだ？
なんか最近こいつ、母さんに似てきたような気がする。
つまり結論としては――

やっぱりｕｚｅｅｅｅｅ！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200680ta">
「い、いいから、帰れ……よ」

{	Stand("st七海_制服_キレ","mad", 200, @+100);
	DeleteStand("st七海_制服_通常_pride", 200, false);
	FadeStand("st七海_制服_キレ_mad", 200, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200690na">
「そんなに帰れ帰れ言わないでよぉ、おにぃのバカ！」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200700na">
「まだこっちには用事が残ってるの！」

う……だんだんヒステリックになってきた。
これ以上怒らせると、手が付けられなくなる。
自重しろ、僕……。

{	Stand("st七海_制服_通常","angry", 200, @+100);
	DeleteStand("st七海_制服_キレ_mad", 500, false);
	FadeStand("st七海_制服_通常_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200710na">
「ケータイ買いに行こう」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200720ta">
「は……？」

なにを言ってるんだ？

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200730na">
「お父さんがそうしろって。おにぃがケータイ持てば、いつでも生存確認できるじゃん？」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200740na">
「お金はナナが預かってきたから、今から買いに行こうよ。今どきケータイ持ってない人なんていないよ？　時代に取り残されちゃうよ？」

黙れ、ミーハー女子高生が。
僕よりもお前の方がよっぽど情報弱者だ。
僕にはネットがあるんだよ。

確かに今どきの高校生なら、ケータイなんて持ってて当たり前なんだろう。
でも僕は持ってない。

僕には、ケータイなんて使う機会はないんだ。電話もメールも、する相手がいない。使いもしないものにお金を払いたくはない。

{	Stand("st七海_制服_通常","normal", 200, @+100);
	FadeStand("st七海_制服_通常_normal", 300, true);
	DeleteStand("st七海_制服_通常_angry", 0, false);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200750na">
「だから行こう？」

{	DeleteStand("st七海_制服_通常_normal", 300, true);}
七海がフィギュアを棚に戻して、僕の顔をのぞき込んできた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","smile", 200, @+150);
	FadeStand("bu七海_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200760na">
「どうせおにぃは機種とか分かんないだろうから、ナナと同じ機種にしちゃいなよ」

言いながら、七海はバッグから自らのケータイを取り出し、印籠みたいに僕に向かって差し出してくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu七海_制服_通常_smile", 500, false);

//ＣＧ//ケータイを見せてくる七海
//七海のケータイにはヘンテコなキャラのストラップが付けられている→後の伏線です
	//1600*1200
	CreateTextureEX("携帯", 300, center, Middle, "cg/ev/ev016_01_1_七海携帯萌_a.jpg");
	Zoom("携帯", 0, 500, 500, null, false);
	Fade("携帯", 500, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200770na">
「ほら！　これがナナの。色がかわいいでしょ？」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200780na">
「ついでだから、ストラップもおんなじのあげるよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200790ta">
「うわ……な、なんという手抜きキャラ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Zoom("携帯", 1000, 1000, 1000, null, false);
	Move("携帯", 1000, @-512, @-56, null,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
ストラップとしてぶら下がっているのは、およそかわいいとは思えないヘンテコなキャラクターだった。しかもまるで素人がデザインしたようなヘタクソっぷりだ。

//※わざと「レベルじゃねーぞ！」です
"ゆるキャラ"とか"キモカワイイ"とかってレベルじゃねーぞ！

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200800na">
「手抜きじゃないもん！　『ゲロカエルん』はこういうデザインなのっ。今すごく流行ってるんだからね！」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200810na">
「はあ、女子高生の流行なんておにぃが知ってるわけないかー」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200820na">
「そういうとこを直せば、少しは女子と会話成立すると思うよ、きっと」

だから黙れって言ってるんだミーハーめ！
なにが『ゲロカエルん』だよ、こんなのどう見ても流行るわけないだろ、常識的に考えて。

メディアに踊らされてることに気付いてないなんて、悲しいヤツだ……。

{	Move("携帯", 300, @+512, @+56, Dxl2,false);
	Zoom("携帯", 300, 500, 500, Dxl2, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200830na">
「っていうか、今は『ゲロカエルん』の話じゃなくて！」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200840na">
「いいからケータイ買いに行こうよっ」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200850na">
「あ、別にお揃いがいいとか言ってるわけじゃないからね？　家族で同じ機種だと基本料金が割引されるサービスがあるからだよっ」

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200860na">
「家族で持ってないのはおにぃだけなんだからね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200870ta">
「い、いらない……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","shock", 200, @+150);
	FadeStand("bu七海_制服_通常_shock", 0, false);
	FadeDelete("携帯", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600100]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200880na">
「な、なんで！？　お金はお父さんが出してくれるんだよ！？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200890ta">
「必要……ない……」

それどころか邪魔になるだけだ。
ケータイなんて持ったら、毎日のように母さんから電話がかかってくるに違いない。

それを無視したら無視したで、七海がまた刺客として送り込まれて来るに決まってる。

つまり今まで以上に面倒になるし気も遣わなくちゃいけなくなるっていうこと。
そんなのやってられないよ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st七海_制服_拗ね","angry", 200, @+100);
	DeleteStand("bu七海_制服_通常_shock", 300, true);
	FadeStand("st七海_制服_拗ね_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200900na">
「もー！　信じらんないよ、このバカおにぃ！　もう帰る！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200910ta">
「ああ……そうしてくれ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_扉_開ける");
	CreateTextureEX("ドア開き",100, 0, 0, "cg/bg/bg026_01_1_拓巳部屋_a.jpg");

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	DeleteStand("st七海_制服_拗ね_angry", 300, false);
	Fade("ドア開き", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600101]
僕は、七海が外に出て行けるように扉を開けてやった。
でも七海はその場から動こうとしない。肩を怒らせて、ブスッとふくれている。

{	Stand("st七海_制服_通常","angry", 200, @100);
	Fade("ドア開き", 500, 0, null, false);
	FadeStand("st七海_制服_通常_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200920na">
「ホント、バカ！　アホバカおにぃ！
　駅まで送ってくれるとかしてよ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200930ta">
「イ、イヤだね……」

今まで七海が訪ねてきたって、一度としてそんなことしてなかったんだ、どうして今日に限って送って行かなくちゃいけないんだ。

//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200940na">
「だって、最近殺人事件とかで物騒じゃんか！　こういう場合、心配するのが兄妹ってもんでしょ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200950ta">
「…………」

一瞬、昨日のことが脳裏によみがえりそうになって、
僕は必死で首を振った。
そうすることであの凄惨な光景をなんとか吹き飛ばす。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01200960ta">
「ど、どうでもいいし……」

七海みたいなションベン臭いヤツを襲うほど、『ニュージェネ』の犯人も物好きじゃないさ……。

{	Stand("st七海_制服_通常","shock", 200, @100);
	DeleteStand("st七海_制服_通常_angry", 300, false);
	FadeStand("st七海_制服_通常_shock", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200970na">
「あ、あり得ない……」

{	Stand("st七海_制服_拗ね","cry", 200, @100);
	DeleteStand("st七海_制服_通常_shock", 300, false);
	FadeStand("st七海_制服_拗ね_cry", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200980na">
「ナナが死んでもいいって言うんだ……」

七海は涙ぐんでいる。どうやら本気で僕の言葉にヘコんだらしい。

ふひひ、いい気味だ。僕の平穏を乱すからいけないんだぞ。これは僕からのささやかな復讐だ。ざまあみろ。

//泣く
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01200990na">
「…………ぐすっ」

{	Stand("st七海_制服_キレ","mad", 200, @0);
	DeleteStand("st七海_制服_拗ね_cry", 200, false);
	FadeStand("st七海_制服_キレ_mad", 200, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch01/01201000na">
「バカ！　死んじゃえ！　おにぃなんか、猟奇的に殺されちゃえー！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH08", 2000, 0, NULL);

	DeleteStand("st七海_制服_キレ_mad", 100, true);

	CreateSE("SE02","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE02", 0, 700, 0, 1000, null, false);

	CreateSE("SE01","SE_衝撃_衝撃音03");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateTexture360("ドア開き",100, 0, 0, "cg/bg/bg026_01_1_拓巳部屋_a.jpg");
	DrawTransition("ドア開き", 500, 0, 1000, 100, null, "cg/data/left.png", true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
七海は捨て台詞を吐くと、僕を突き飛ばして勢いよく部屋から出ていった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 1000, 0, NULL);
	Wait(500);
	CreateSE("SE03","SE_日常_扉_閉まる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Wait(1200);
	FadeDelete("ドア開き", 500, true);
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600102]
はあ……嵐のような時間がようやく過ぎ去ってくれたよ……。
七海がいなくなった途端、部屋は静かになる。

やっぱりこうでなくちゃ。ここは僕のベースなんだ。僕の気に入らないことは起きちゃいけないんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――


	CreateTextureEX("PC前",100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Fade("PC前", 500, 1000, null, true);

//	CubeRoom("ルーム", 100, 0);
//	Fade("ルーム", 500, 1000, null, true);
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
//☆☆☆
ＰＣの前に座り、マウスをわずかに動かしてモニタに出ている星来たんスクリーンセーバーを消した。
テーブルに置いてあったコーラをラッパ飲みする。でも空だった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01201010ta">
「あ……し、しし、しまった、これ七海がさっき飲んだヤツだ……」

うげええ、最悪だ……。妹と間接キスしちゃったよ……。

七海がもう少しかわいげのある妹なら、エロゲみたいなシチュエーションだからハァハァできたかもしれないけど。あの性格じゃ、萎えるだけだ……。

コーラの蓋を閉めて、部屋の隅に置いてある大きなゴミ袋へとペットボトルを投げ捨てた。

//ＳＥ//ペットボトル投げる
{	CreateSE("SE02","SE_じん体_動作_足_蹴る_ぺっとぼとる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
袋には入らず、壁に跳ね返ってベッドの下に転がっていっちゃったけど、まあいいや。

さて。早くエンスーに潜り直そう。
ウザい現実を一刻も早く忘れるんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

//	FadeDelete("ルーム２", 0, false);

	SetVolume("SE*", 2000, 0, NULL);

//ＢＧ//黒
	CreateColor("背景１", 100, 0, 0, 1280, 720, "BLACK");
	Fade("背景１", 0, 0, null, false);
	Fade("背景１", 500, 1000, null, true);

	Delete("PC前");
//	FadeDelete("ルーム", 0, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
でも、実際にはたった１日でバゼラードに潜り続けるのを中断しなくちゃいけなくなった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	ClearAll(1000);

}
