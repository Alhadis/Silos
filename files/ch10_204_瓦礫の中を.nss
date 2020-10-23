//<continuation number="470">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_204_瓦礫の中を";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch10_204_瓦礫の中を();
}


function ch10_204_瓦礫の中を()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//■
//ポジティブ妄想→分岐１３
//ネガティブ妄想→分岐１４
//妄想しない→分岐１５

if($GameDebugSelect == 1)
{
	SetChoice02("ルートＡ","ルートＢ");
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
		}
		case @選択肢２:
		{
			ChoiceB02();
			$１章エンドフラグ① = true;
			$１章エンドフラグ② = true;
			$２章エンドフラグ① = true;
			$２章エンドフラグ② = true;
			$３章エンドフラグ① = true;
			$３章エンドフラグ② = true;
			$４章エンドフラグ① = true;
			$４章エンドフラグ② = true;
			$５章エンドフラグ① = true;
			$５章エンドフラグ② = true;
			$６章エンドフラグ① = true;
			$６章エンドフラグ② = true;
			$７章エンドフラグ① = true;
			$７章エンドフラグ② = true;
			$８章エンドフラグ① = true;
			$８章エンドフラグ② = true;
			$９章エンドフラグ① = true;
			$９章エンドフラグ② = true;
			#ClearRouteA = true;
		}
	}

	$GameDebugSelect = 0;
}


	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");

//※拓巳視点に戻る
//ＢＧ//崩壊渋谷・道玄坂//昼・曇り

/*森島ＳＥ・ＢＧダミー*/
	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");
	Fade("back03", 1000, 1000, null, true);

	Delete("back04");

	CreateSE("SE01","SE_衝撃_どさっ");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateSE("SE10","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE10", 1000, 600, 0, 1000, null, true);

	CreateTextureEX("back10", 500, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ふらつき、倒れそうになった七海を、僕は慌てて抱き留めた。

//◆浅く苦しそうな呼吸
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20400010na">
「……っ、ぁ……」

意識を失っている。
顔色は真っ青だ。呼吸も苦しそう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st克子_スーツ_通常","angry", 200, @+200);
	FadeStand("st克子_スーツ_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400020mm">
「早く病院に運ばないと。このままじゃ危ないわ」

百瀬、と名乗った恰幅のいい女の人が、七海の顔をのぞき込んで深刻そうにつぶやいた。
それから『将軍』の方へ目を向ける。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400030mm">
「そっちに寝かせてる子もね」

{	Fade("back10", 500, 1000, null, true);
	DeleteStand("st克子_スーツ_通常_angry", 0, false);
	Fade("back10", 300, 0, null, true);}
僕は百瀬さんに七海を預けた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400040ta">
「２人を、頼みます……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st克子_スーツ_通常","hard", 200, @+100);
	FadeStand("st克子_スーツ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400050mm">
「あなたはどうするの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400060ta">
「探さなくちゃ、いけない、人がいて……」

ノアⅡの居場所。

七海にも聞いてみたけど、自分がどこに捕らえられていたのかはよく分からないと言っていた。

やっぱり、波多野っていう人を探すしかない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st克子_スーツ_通常_hard", 500, true);
	Stand("stあやせ_制服_通常","normal", 200, @+150);
	FadeStand("stあやせ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603001]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20400070ay">
「必要なことなのね？　グラジオールを倒すために」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400080ta">
「グラジオール、か……」

ノアⅡ、と置き換えるのなら――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400090ta">
「うん。そうだよ」

{	Stand("stあやせ_制服_通常","hard", 200, @+150);
	FadeStand("stあやせ_制服_通常_hard", 300, true);
	DeleteStand("stあやせ_制服_通常_normal", 0, true);}
あやせが表情を引き締めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stあやせ_制服_通常_hard", 500, true);
	Stand("buあやせ_制服_通常","hard", 200, @+200);
	FadeStand("buあやせ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
僕に一歩、詰め寄ってくる。その足を、わずかに引きずっていた。やっぱり怪我をしているみたいだ。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20400100ay">
「一緒に行くわ。私も」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400110ta">
「その、必要はないよ」

僕がそう言っても、あやせは拒絶するように首を振った。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20400120ay">
「７人、集まらないと」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400130ta">
「あやせも、それに、優愛も、波多野、っていう人を、探してほしい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back10", 500, 1000, null, true);
	DeleteStand("buあやせ_制服_通常_hard", 0, false);
	Stand("st克子_スーツ_通常","hard", 250, @+100);
	Stand("st優愛_制服_通常左手下","worry", 200, @+350);
	FadeStand("st優愛_制服_通常左手下_worry", 0, false);
	FadeStand("st克子_スーツ_通常_hard", 0, true);
	Fade("back10", 300, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
優愛の名を僕が口にしたら、百瀬さんの後ろで縮こまっていた当の本人が、ビクリと肩を震わせるのが見えた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400140ta">
「その人が、ノアⅡの場所……知ってるから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400150ta">
「一緒に、行動しなくても、僕は、みんなの、見聞きしたことが分かる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400160ta">
「だから、今は、手分けして、探して」

それが今は最善の策だと思う。
急がなくちゃならない。

もしまたあの地震が起きたら、次も自分が無事でいられる保証はない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back10", 500, 1000, null, true);
	DeleteStand("st優愛_制服_通常左手下_worry", 0, false);
	DeleteStand("st克子_スーツ_通常_hard", 0, true);

	Stand("buあやせ_制服_通常","angry", 200, @+200);
	FadeStand("buあやせ_制服_通常_angry", 0, true);

	Fade("back10", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆渋々
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20400170ay">
「……分かったわ」

残念そうに目を伏せながらも、あやせはそう言ってくれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buあやせ_制服_通常_angry", 500, true);
	Stand("st克子_スーツ_通常","sigh", 250, @+100);
	FadeStand("st克子_スーツ_通常_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400180mm">
「なんだかよく分からないけど」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400190ta">
「野呂瀬玄一が、すべての、黒幕です」

{	Stand("st克子_スーツ_通常","hard", 250, @+100);
	FadeStand("st克子_スーツ_通常_hard", 300, true);
	DeleteStand("st克子_スーツ_通常_sigh", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400200mm">
「……！」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400210mm">
「そういうこと……」

{	Stand("st克子_スーツ_通常","normal", 250, @+100);
	FadeStand("st克子_スーツ_通常_normal", 300, true);
	DeleteStand("st克子_スーツ_通常_hard", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400220mm">
「それなら、妹さんたちのことは、私に任せなさいな」

百瀬さんは、胸を張って見せた。
そして、僕を勇気付けるかのようにうなずく。

{	Stand("st克子_スーツ_通常","hard", 250, @+100);
	FadeStand("st克子_スーツ_通常_hard", 300, true);
	DeleteStand("st克子_スーツ_通常_normal", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400230mm">
「ただし、無茶しちゃダメよ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400240mm">
「それと、ひとつ頼まれてほしいんだけど」

{	Stand("st克子_スーツ_通常","normal", 250, @+100);
	FadeStand("st克子_スーツ_通常_normal", 300, true);
	DeleteStand("st克子_スーツ_通常_hard", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400250mm">
「バンちゃん……ええと、ヘラヘラ笑ってるうさんくさそうな中年刑事を見たら、私に連絡するように伝えてくれる？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 0, 1, NULL);

//※フラッシュバックで判の死の瞬間を一瞬回想
	CreateColor("色１", 400, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	CreateTexture360("背景１", 300, 0, 0, "cg/ev/ev081_01_3_判死_a.jpg");
	Fade("色１", 500, 0, null, true);

	Wait(500);

	Fade("色１", 100, 1000, null, true);
	Delete("背景１");
	Fade("色１", 500, 0, null, true);
	SetVolume("SE10", 500, 600, NULL);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
判安二のことを言っているんだろうか。

彼が死んだことを、僕は“知っている”。
相棒に、銃で撃たれて殺された。
その瞬間を、無意識のうちに見ていたから。

そのことを、百瀬さんに伝えようとした。
でも――

{	Stand("st克子_スーツ_通常","sigh", 250, @+100);
	FadeStand("st克子_スーツ_通常_sigh", 300, true);
	DeleteStand("st克子_スーツ_通常_normal", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400260mm">
「まったく。あの人はこんなときにどこをほっつき歩いてるんだか」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400270mm">
「ま、案外どこかで、怪我人を助けてるのかもしれないけどね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400280ta">
「…………」

百瀬さんが、そんなことを言うから。
伝えたくても、できなかった。

{	Stand("st克子_スーツ_通常","normal", 250, @+100);
	FadeStand("st克子_スーツ_通常_normal", 300, true);
	DeleteStand("st克子_スーツ_通常_sigh", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20400290mm">
「というわけで、よろしく」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400300ta">
「はい……」

つい、うなずいてしまう。
達成が１００％不可能な約束。

でも、他にどう答えればいいのか、僕には思いつかなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st克子_スーツ_通常_normal", 500, true);

	Stand("bu優愛_制服_通常左手下","worry", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400310yu">
「あの……に、西條くん……！」

優愛が、うなだれたまま、蚊の鳴くような声を上げた。

さっきからずっと、僕の方をオドオドと窺いながら、声をかけたそうにしているのは気付いていた。

{	Stand("bu優愛_制服_通常左手下","sad", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_sad", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400320yu">
「……あなたのこと、疑って、ごめんなさい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400330ta">
「…………」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400340yu">
「わたし、西條くんを、傷つけるようなこと、言って……」

埃でずいぶん汚れてしまっているメガネのレンズ。
きっとその奥の瞳は、涙で潤んでいるんだろう。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400350yu">
「謝っても、許してもらえるとは、思って、ないです……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400360yu">
「それでも、謝らせて、ください」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400370yu">
「ごめんなさい……」

深々と頭を下げてくる。
{	DeleteStand("bu優愛_制服_通常左手下_sad", 500, true);
	Stand("st優愛_制服_通常左手下","sad", 200, @+150);
	FadeStand("st優愛_制服_通常左手下_sad", 500, true);}
僕はなにも答えず、彼女に背を向けた。

//◆切ないブレス
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400380yu">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400390ta">
「僕のベースにある、星来のフィギュア……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400400yu">
「はい……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400410ta">
「よかったら、もらってくれる？」

{	Stand("st優愛_制服_通常左手下","shock", 200, @+150);
	FadeStand("st優愛_制服_通常左手下_shock", 300, true);
	DeleteStand("st優愛_制服_通常左手下_sad", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400420yu">
「……あ」

騙されたのはショックだったけど、彼女の事情も今は理解してる。

だからって“許すよ”なんて言うのは、逆に自分がおこがましく思えた。

優愛のことを、ずっと敵だと思ってた。
そんな僕には、頭を下げられる資格も、許す資格もない。

{	Stand("st優愛_制服_通常左手下","worry", 200, @+150);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("st優愛_制服_通常左手下_shock", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400430yu">
「あの、いいんですか……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20400440ta">
「もらって、ほしい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400450yu">
「は、はい……」

{	Stand("st優愛_制服_通常左手下","normal", 200, @+150);
	FadeStand("st優愛_制服_通常左手下_normal", 300, true);
	DeleteStand("st優愛_制服_通常左手下_worry", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400460yu">
「はいっ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20400470yu">
「また、一緒に……フィギュア、買いに、行きましょうね」

ようやく優愛に、初めて会ったときのような優しそうな笑みが戻った。

僕は優愛の言葉にうなずいて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back10", 300, 1000, null, true);
	DeleteStand("st優愛_制服_通常左手下_normal", 0, true);
	Stand("st克子_スーツ_通常","normal", 200, @+150);
	Stand("stあやせ_制服_通常","angry", 200, @-150);
	FadeStand("stあやせ_制服_通常_angry", 0, false);
	FadeStand("st克子_スーツ_通常_normal", 0, true);
	Fade("back10", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
あやせと百瀬さんにも目配せして。
もう一度だけ、七海と『将軍』の姿をこの目に焼き付けて。

{	Fade("back10", 500, 1000, null, true);
	DeleteStand("stあやせ_制服_通常_angry", 0, false);
	DeleteStand("st克子_スーツ_通常_normal", 0, true);
	Fade("back10", 500, 0, null, true);}
ひとり、瓦礫の山の中を再び歩き出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 1500, 0, NULL);

	Wait(1000);

//～～Ｆ・Ｏ

//▼べー：仕様変更_081122▼
//エンドフラグ１０以上でＢルート確定。
//Ｂルートへ
//べー：インターミッション５２ｂへ
//ch10_216_インターミッション５２ｂ.nss

//９以下ならＡルート確定です。
//べー：インターミッション５２ａへ
//ch10_205_インターミッション５２ａ.nss

//================================================
//※以下、旧仕様となります
//フラグによる自動分岐です。ＡエンドｏｒＢエンドへ分岐
//フラグ判定
//１～９章のエンドフラグ①②すべてＯＮの場合
//Ｂルートへ
//べー：インターミッション５２ｂへ
//ch10_216_インターミッション５２ｂ.nss

//エンドフラグのどれかひとつでもＯＦＦの場合
//Ａルートへ
//べー：インターミッション５２ａへ
//ch10_205_インターミッション５２ａ.nss

}