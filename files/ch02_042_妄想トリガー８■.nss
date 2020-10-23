//<continuation number="250">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_042_妄想トリガー８■";
		$GameContiune = 1;
		Reset();
	}

		ch02_042_妄想トリガー８■();
}


function ch02_042_妄想トリガー８■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg062_01_3_ライブハウス店内_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//妄想トリガー分岐
//ポジティブ妄想→分岐７へ
//ネガティブ妄想→分岐８へ
//妄想しない→分岐９へ

if($妄想トリガー通過８ == 0)
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
			$妄想トリガー８ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー８ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー８ = 0;
		}
	}

	if($妄想トリガー８ == 1)
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

if($妄想トリガー８ == 2)
{
//分岐７
//=============================================================================//
//フラグ【２章エンドフラグ①】ＯＮ
	$２章エンドフラグ① = true;

//※エンドフラグ→各章に２～３個設定します。妄想トリガー分岐において「その目だれの目？」というキーワードが出てくる分岐を選んだ場合に発生。１０章でのエンディング分岐に影響します。
//画面エフェクト//妄想ＩＮ用エフェクト
//ＳＥ//妄想ＩＮ


	DelusionIn();

	ClearAll(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	Request("背景１", Smoothing);
//	Zoom("背景１", 0, 2500, 2500, null, true);
//	Move("背景１", 0, @200, @-250, null, true);
	Zoom("背景１", 0, 2000, 2000, null, true);
	Move("背景１", 0, @320, @-400, null, true);
	Fade("背景１", 1000, 1000, null, true);

	DelusionIn2();

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕が目を離せないでいると、なにを思ったのか彼女はステージから客席へと降りてきた。

//ＳＥ//大歓声
{	CreateSE("SE02","SE_日常_歓声_LOOP");
	MusicStart("SE02", 2000, 1000, 0, 1000, null, true);
	BGMPlay360("CH13",2000,1000,true);
	Wait(500);}
ファンタズムのメンバーたちが、演奏を再開する。

でもＦＥＳは歌わない。
客席の中をゆらゆらとさまよいながら、だるそうに上着を脱ぎ捨てた。セクシーな肩を露出させる。

静かだったファンが再び興奮し始めた。
全員が拳を突き上げ、激しくジャンプする。そのせいで地震でも起きたかのように床が揺れていた。

ただ、誰もＦＥＳに触れようとはしなかった。
神聖なる存在に畏敬を示すかのように。

普通だったら、彼女ほどのカリスマが客席に降りてきたら、もみくちゃにされていておかしくない。

//※わざと「儲」
暗黙の了解、ひとつのルールとして、ファンタズム儲たちは“ＦＥＳの身体に触れること”を自らに律している。

それでも、

至近距離でＦＥＳの存在を感じ。
ＦＥＳが放つ汗の香りを味わい。
ＦＥＳと同じ空気に触れている。

そのことが信者たちには至上の喜びなんだ。

これは恒例のパフォーマンスなのかもしれない――そう思っていた僕は、ＦＥＳがこの後取った行動に目を疑った。

彼女は、無造作に腰のベルトを外し始めたんだ。
それを放り投げると、信者たちがみんな一斉に手を伸ばし、自分の物にしようと争う。

そんな彼らを尻目に、ＦＥＳは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE02", 1000, 500, 0, 1000, null, true);

	CreateTextureEX("背景２", 100, 0, 0, "cg/ev/ev025_01_3_あやせ脱ぎ妄想_a.jpg");
	Move("背景２", 0, @0, @-480, null, true);
	Fade("背景２", 1000, 1000, null, true);

	SetVolume360("CH13", 2000, 0, null);
	MusicStart("SE02", 2000, 0, 0, 1000, null, false);

	BGMPlay360("CH01",1000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
ミニスカートのチャックを下ろした。
{	CreateSE("SE02","SE_じん体_動作_すかーと裾まくり");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Wait(1000);
	CreateSE("SE03","SE_衝撃_鞄_落ちる");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);}
パサリと、スカートが足許に落ちる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("背景２", 3000, @0, @240, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
黒い、扇情的な下着が露わになった。

ＦＥＳは自分のそのあられもない格好を信者に見られることを、まったく気にしていないらしい。

雰囲気に酔っているのか、それもまたパフォーマンスなのか、あるいは……ただの露出狂なのか。

分からないけど、彼女のあまりのエロさに、僕は目が釘付けになった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("背景２", 3000, @0, @240, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
ＦＥＳが、再び僕を見る。
艶めかしい笑みを浮かべる。

//【三住】
<voice name="三住" class="三住" src="voice/ch02/04200010mi">
「お、おい、こっち来るぞ……」

ＦＥＳは僕だけを見つめ、目を離さない。
狙いを定めたように、ゆっくりと近づいてくる。

そして僕の目の前に来ると――

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04200020ay">
「……ふふふ」

甘い吐息を僕の顔に放ち、
まるで恋人にするように、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//下着姿で拓巳に抱きつくあやせ（拓巳妄想）

	CreateSE("SE03","SE_じん体_動作_のぞく");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg062_01_3_ライブハウス店内_a.jpg");
	Fade("背景１", 1000, 1000, null, true);
	Fade("背景２", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
抱きしめてきた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200030ta">
「……！」

彼女の肌は汗でしっとりと湿っていた。その匂いと温もりは、目眩を起こさせるくらい僕には蠱惑的で。

//おがみ：シナリオ修正：早い＞速い
僕の身体に密着した彼女の胸が速いペースで上下していた。歌は体力を使うって言うけど、彼女の荒い息づかいが皮膚を通してダイレクトに伝わってきて。

彼女の腕が、僕の背中をかき抱く。
彼女の爪が、僕のうなじに食い込む。
彼女の太ももが、僕の足にからみつく。

電撃が走ったように僕の全身は震え。
押しのけることも、抱きしめ返すこともできず。
ただ棒立ちのまま、目を白黒させることしかできない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//大歓声
	CreateSE("SE02","SE_日常_歓声_LOOP");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);
	CreateTextureEX("背景２", 100, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
//	Zoom("背景２", 0, 2500, 2500, null, true);
//	Move("背景２", 0, @200, @-250, null, true);
	Zoom("背景２", 0, 2000, 2000, null, true);
	Move("背景２", 0, @320, @-400, null, true);
	Fade("背景２", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601703]
と、再び信者たちから歓声があがる。それはほとんど悲鳴に近かった。
ファンタズムの演奏は激しさを増す。

ＦＥＳコールがこの狭いライブハウスに反響する。
さらには“やれ！　やれ！”というかけ声までが混ざり始めた。

やれ、って、なにをやるんだ。
僕は状況がさっぱり理解できない。
ＦＥＳは僕に抱きついたまま、なにも言わない。

助けを求めて、三住くんの姿を探した。

すると彼は、驚いたことに見ず知らずの女性客と濃厚なキスを交わしていた。

いや……三住くんだけじゃない。

他の信者たちも、男も女も関係なく服を脱ぎ捨て、生まれたままの姿で抱き合ったり、唇を重ねたり、挙げ句の果てにはすでに行為を始めてしまっている連中までいる。

阿鼻叫喚、酒池肉林。
嬌声と歓声と、肉と肉が擦れ合う卑猥な音。それらがファンタズムの演奏に乗ってこのライブハウスを支配していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
――黒ミサだ。

//おがみ：360：倫理テキスト削除
//僕はようやく理解した。
//これは、ＦＥＳという魔女による淫靡なる宴。
//信者はＦＥＳと悪魔に忠誠を誓い、乱交に耽る。
僕はようやく理解した。
これは、ＦＥＳという魔女による淫靡なる宴。

そして……
今日の魔女への生け贄は、この僕。
僕は、ＦＥＳの相手に選ばれたんだ。

これが、ファンタズムのライブなのか……。

僕も雰囲気に呑まれつつあった。
頭の中にうっすらと靄がかかったような感じ。

これから起こることへの期待と恐怖。
ＦＥＳに選ばれたことへの優越感と恍惚感。
頭がどうにかなりそうだった。


</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg062_01_3_ライブハウス店内_a.jpg");
	Fade("背景２", 0, 0, null, true);
	Fade("背景１", 0, 1000, null, true);
	Fade("色１", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04200040ay">
「ふふふ……」

僕の耳元で、ＦＥＳがまた笑う。

その声は、これだけ音が洪水のように溢れている中でもはっきりと聞こえてくる。

なんて、セクシーな声なんだ。
僕はその声を聞くだけで失神しそうになった。

でもＦＥＳは、さらに僕を快楽のるつぼへと誘おうとする。

僕の耳たぶをそっと噛み、
吐息を耳に吹きかけ、
そして、

ささやいた――

{	Wait(500);
	SetVolume360("CH*", 200, 0, null);
	MusicStart("SE02", 200, 0, 0, 1000, null, false);
	Wait(300);}
//ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04200050ay">
「その目だれの目？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	SetVolume360("CH*", 100, 0, null);

	DelusionOut();

	ClearAll(0);

//おがみ：実績：その目
	Eyes();

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

	DelusionOut2();
	PositiveHuman();

	Wait(2000);


//ＢＧ//拓巳の部屋

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200060ta">
「……ふひひ、ＦＥＳエロいよＦＥＳ」

僕はＰＣの前に座って、妄想にふけっていた。

今日行ったライブはなかなかいい刺激になったんだ。
ＦＥＳも三次元女子としてはかなりいい女だったし。

//※「人大杉」＝人が多過ぎ
{#TIPS_人大杉 = true;$TIPS_on_人大杉 = true;}
まあ、<FONT incolor="#88abda" outcolor="BLACK">人大杉</FONT>だから二度と行かないけど。
結局、あの後は人ごみのせいで気持ち悪くなって、すぐにライブハウスを飛び出してきたよ。

{$TIPS_on_人大杉 = false;}
今日の妄想は出来がいい。
ＦＥＳとファンタズムなら案外、ホントにそういうことをしてるかもしれないし。

今日はたまたまやらなかっただけで。

さてと、エンスーでもやろうかな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流３へ
}
//=============================================================================//







if($妄想トリガー８ == 1)
{
//=============================================================================//
//分岐８
//画面エフェクト//妄想ＩＮ用エフェクト
//ＳＥ//妄想ＩＮ


	DelusionIn();

	ClearAll(0);

//ＢＧ//翠明学園屋上//雨
//※ＦＥＳの服装はライブ衣装です
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg050_01_6_学校屋上_a.jpg");
	CreateTextureEX("雨１", 110, 0, 0, "cg/bg/bg179_01_1_雨空_a.jpg");
	Request("雨１", AddRender);
	Fade("背景１", 0, 1000, null, true);
	Fade("雨１", 0, 500, null, true);

	CreateSE("SE02","SE_自然_雨_通常_LOOP");
	MusicStart("SE02", 2000, 1000, 0, 1000, null, true);
	Stand("stあやせ_私服_通常","normal", 200, @0);


//	CreateMovie360("雨１", 500, Center, Middle, true, false, "dx/mv雨02.avi");	
//	Request("雨１", AddRender);

	DelusionIn2();

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
ふと気が付くと、
僕は、どこかの屋上をひとりでゆっくりと歩いていた。風がやけに強く、横から殴るような雨が吹き付けてくる。

でも、不思議と冷たさは感じない。
この場所は見覚えがある。何度か来たことがある気がする。そうだ、このフェンスに囲まれた殺風景な景色は、学校の屋上だ。

目を周囲に向ける。

雨で煙っているせいで景色はまったく見えない。どこか現実離れした感じ。世界そのものが霞んでいるかのような。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	FadeStand("stあやせ_私服_通常_normal", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04200070ay">
「…………」

{	DeleteStand("stあやせ_私服_通常_normal", 500, true);}
僕の視線の先――フェンスの向こう側に、ＦＥＳがいた。
びしょ濡れになって、フェンス越しに僕の方を向き、立っている。

ライブのときと同じ目をして、まっすぐに僕を見ている。
その右手には、やっぱり剣みたいなマイクスタンドを握りしめていた。

下から吹き付ける風によって、ＦＥＳの湿った髪が激しくなびいている。

少しでもバランスを失えば、間違いなく落下するだろう。この高さから落ちれば即死だ。
見ているだけで僕の方が足がすくんでしまう。

でもＦＥＳは、その場に姿勢良く立ち、怖がっている様子もない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_私服_通常","normal", 200, @0);
	FadeStand("stあやせ_私服_通常_normal", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04200080ay">
「…………」

{	DeleteStand("stあやせ_私服_通常_normal", 500, true);}
ＦＥＳが、今にも泣き出しそうな表情のまま、マイクスタンドを持っていない左手を僕の方へそっと差し出してくる。

一緒に飛ぼう――

まるでそう誘っているように見えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);

if(#ClearG && !$RouteON){
	TypeBegin();//――――――――――――――――――――――――――――――
}else{
	TypeBeginEX();//――――――――――――――――――――――――――――――
}

	Stand("stあやせ_私服_通常","normal", 200, @0);
	FadeStand("stあやせ_私服_通常_normal", 500, true);

//※※３６０以下
if(#ClearG && !$RouteON){

//★あやせ編_突入用分岐
//※以下のＹＥＳ／ＮＯ分岐は分岐しません。必ず全問に解答します
//全問正解で、あやせ個別シナリオに分岐。以後、あやせ編専用インターミッションなどが挿入されつつ７章までは通常通りに流れに

//※ＹＥＳ／ＮＯ分岐
//■選択肢開始====================================================
	StartWhich03();

//ＹＥＳ／ＮＯ選択肢１
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
“きっとＦＥＳは僕に救いを求めてる”

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
				$あやせルート無し=true;
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
“ＦＥＳの誘惑に乗ってみたい”

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
				$あやせルート無し=true;
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
“飛び降りたら、きっと気持ちいい”

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
				$あやせルート無し=true;
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
“ＦＥＳと一緒なら死んでもいい”

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
				$あやせルート無し=true;
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
“すべてから解放されたい”

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
				$あやせルート無し=true;
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
		}

//すべて正解の場合
//フラグ【あやせ編確定】ＯＮ
//ひとつでもミスがあった場合
//フラグ発生せず

//■選択肢終了
	EndWhich03();

	if($あやせルート無し){
	}else{
		$あやせルート=true;
		$RouteON=true;
//○実績No.13：杭を打て
		XBOX360_Achieved(13);
	}

}
//※※３６０以上



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200090ta">
「…………」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04200100ay">
「…………」

{	DeleteStand("stあやせ_私服_通常_normal", 500, true);}
僕はなにも答えなかった。
どうしたらいいか分からなかった。

ＦＥＳもなにも語らなかった。
今度は両手を左右に広げ、十字架に張り付けにされたような姿勢になる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);
	MusicStart("SE02", 2000, 0, 0, 1000, null, true);
	Fade("雨１", 1000, 0, null, true);
	Delete("雨１");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
雨が、風が、不意に止んだ。

僕は声をあげようとしたけど、出なかった。出せなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_衝撃_衝撃音01");
	CreateSE("SE03","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE04", 0, 1000, false);
	MusicStart("SE03", 2000, 1000, 0, 1000, null, true);
	SetFrequency("SE03", 0, 700, null);
	CreateTexture360("背景２", 120, 0, 0, "cg/bg/bg050_01_6_学校屋上_a.jpg");
	CreateTexture360("背景３", 110, 0, 0, "cg/bg/bg050_01_6_学校屋上_a.jpg");
	Zoom("背景２", 800, 1200, 1200, Dxl2, false);
	Fade("背景２", 800, 0, null, false);
	Wait(400);
	Zoom("背景３", 800, 1200, 1200, Dxl2, false);
	Fade("背景３", 800, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603007]
ゆっくりと、ＦＥＳの身体が後ろ側へと傾いていく。
すべてがスローモーションになっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景２", 120, 0, 0, "cg/bg/bg050_01_6_学校屋上_a.jpg");
	CreateTexture360("背景３", 110, 0, 0, "cg/bg/bg050_01_6_学校屋上_a.jpg");
	Zoom("背景２", 800, 1200, 1200, Dxl2, false);
	Fade("背景２", 800, 0, null, false);
	Wait(400);
	Zoom("背景３", 800, 1200, 1200, Dxl2, false);
	Fade("背景３", 800, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604007]
僕はなんとかＦＥＳに向かって手を伸ばそうとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景２", 120, 0, 0, "cg/bg/bg050_01_6_学校屋上_a.jpg");
	CreateTexture360("背景３", 110, 0, 0, "cg/bg/bg050_01_6_学校屋上_a.jpg");
	Zoom("背景２", 800, 1200, 1200, Dxl2, false);
	Fade("背景２", 800, 0, null, false);
	Wait(400);
	Zoom("背景３", 800, 1200, 1200, Dxl2, false);
	Fade("背景３", 800, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605007]
でも自分の動きさえスローモーションになっていて、僕の腕がゆっくりと前に差し出されるのを、もどかしく見ていることしかできなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景２", 120, 0, 0, "cg/bg/bg050_01_6_学校屋上_a.jpg");
	CreateTexture360("背景３", 110, 0, 0, "cg/bg/bg050_01_6_学校屋上_a.jpg");
	Zoom("背景２", 800, 1200, 1200, Dxl2, false);
	Fade("背景２", 800, 0, null, false);
	Wait(400);
	Zoom("背景３", 800, 1200, 1200, Dxl2, false);
	Fade("背景３", 800, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3606007]
それに、ＦＥＳはもう目を閉じていた。

やがて彼女の姿が僕の視界から消えて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//ＳＥ//ドーン！
	CreateSE("SE03","SE_衝撃_どすーん");
	CreateSE("SE04","SE_衝撃_落下激突");


	CreateColor("色１", 150, 0, 0, 1280, 720, "RED");
	Fade("色１", 0, 0, null, true);

	SoundPlay("SE03", 0, 1000, false);
	SoundPlay("SE04", 0, 1000, false);

	Fade("色１", 0, 1000, null, true);
	DrawTransition("色１", 200, 0, 1000, 100, null, "cg/data/zoom1.png", true);

	Delete("背景１");

	CreateColor("色２", 150, 0, 0, 1280, 720, "Black");
	DrawTransition("色２", 3000, 0, 1000, 100, null, "cg/data/effect.png", false);
	Fade("色１", 3000, 0, null, false);
	Wait(1500);

//画面エフェクト//妄想ＯＵＴ用エフェクト
//ＳＥ//妄想ＯＵＴ

	SetVolume360("CH*", 100, 0, null);

	DelusionOut();

	ClearAll(0);

//ＢＧ//拓巳の部屋
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

	DelusionOut2();
	NegativeHuman();

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200110ta">
「……鬱だ」

自分で妄想しておいてなんだけど、鬱な展開になってしまった。
でも、それだけＦＥＳが身に纏っていたオーラがすごかったんだ。

彼女にはどこか、破滅的な美しさがある。

//※「サーセン」＝すいません
まあもっとも、破滅的な美しさってなんやねんって話になると、僕にもさっぱり分からないんですけどねｗｗｗサーセンｗｗｗ

結局、ライブ自体はあの後、人ごみのせいで気持ち悪くなり、すぐにライブハウスを飛び出してきた。

だからほとんど見ていない。
っていうか二度と行きたくないね。

さてと、この鬱な気分を吹き飛ばすために、エンスーでもやろうっと。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――




}
//合流３へ
//=============================================================================//




if($妄想トリガー８ == 0)
{
//=============================================================================//
//分岐９
//ＢＧ//ギガンティス外観//夜
//おがみ：階段を駆け下りる音仮組み

	CreateSE("SE01","SE_じん体_心臓_鼓動_LOOP");
	CreateSE("SE02","SE_じん体_動作_足_走る_LOOP");

	SoundPlay("SE01", 0, 800, true);
	SetFrequency("SE01", 1000, 1200, null);

	SoundPlay("SE02", 0, 1000, true);

	CreateSE("SE04","SE_衝撃_衝撃音03");
	SoundPlay("SE04", 0, 1000, false);

	Wait(200);

	CreateSE("SE05","SE_日常_扉_開ける");
	SoundPlay("SE05", 0, 1000, false);

	CreateTexture360("背景３", 400, 0, 0, "cg/bg/bg063_01_3_ライブハウス外観_a.jpg");
	DrawTransition("背景３", 500, 0, 1000, 100, null, "cg/data/left3.png", true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg063_01_3_ライブハウス外観_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Fade("背景３", 0, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
気付けば僕は外へ飛び出していた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200120ta">
「はあ、はあ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetFrequency("SE02", 1000, 700, Dxl3);
	Wait(2000);
	CreateSE("SE03","SE_じん体_動作_尻餅");
	SoundPlay("SE03", 0, 1000, false);
	SoundPlay("SE02", 0, 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//■３６０
ＧＩＧＡＮＴＥＳの外階段を駆け下り、一番下の段にしゃがみ込む。

//ＧＩＧ－ＡＮＴＩＳの外階段を駆け下り、一番下の段にしゃがみ込む。

なんとか息を整えようとしたけど、うまくいかない。
やっぱり中に入るんじゃなかった……。

すごくドキドキしている。全身にびっしょりと汗もかいていた。

{	SetFrequency("SE02", 1000, 1000, Dxl3);
	SoundPlay("SE01", 1000, 500, true);
	Stand("bu大輔_制服_通常","worry", 200, @+100);
	FadeStand("bu大輔_制服_通常_worry", 300, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch02/04200130mi">
「おい、どうしたんだよタク。いきなり飛び出して」

三住くんが追ってきた。
その声は不満そうだ。

{	Stand("bu大輔_制服_通常","sigh", 200, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);
	DeleteStand("bu大輔_制服_通常_worry", 200, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch02/04200140mi">
「もう出ちまうのかよ。これからさらに盛り上がりそうだったのに」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200150ta">
「…………」

{	Stand("bu大輔_制服_通常","pride", 200, @+100);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 200, false);}
//【三住】
<voice name="三住" class="三住" src="voice/ch02/04200160mi">
「で、どうだよＦＥＳは。かわいかったろ？」

僕は顔を上げずに首を振った。

そんなことはどうでもいいんだ……。
確かにかわいかったけど、三次元に興味はないんだ。
それより、あの歌詞だ……。

//■３６０
//全ての歌詞が聞き取れたわけじゃなかったけど、やっぱりあの歌は『張り付け』事件のことを歌っているとしか思えない。
全ての歌詞が聞き取れたわけじゃなかったけど、やっぱりあの歌はニュージェネ事件のことを歌っているとしか思えない。

もちろん確信はない。

でもＦＥＳはきっとなにか知ってる。そんな気がする。
悪魔女の手下か、そうじゃないのかは結局分からなかったけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 250, 0, 1000, 100, null, "cg/data/effect.png", true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);

	SoundPlay("SE01", 1000, 0, true);

	CreateSE("SE04","SE_衝撃_衝撃音01");
//――少女は紅く染まり　満月の下で振り返る

	SoundPlay("SE04", 0, 1000, false);
	SetFont("ＭＳ ゴシック", 26, #FF0000, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 600, center, middle, Auto, Auto, "――少女は紅く染まり　満月の下で振り返る");
	SetBacklog("――少女は紅く染まり　満月の下で振り返る", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(2000);

	FadeDelete("テキスト１", 1500, true);

	DrawTransition("色１", 1500, 1000, 0, 100, null, "cg/data/effect.png", true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
それに、僕を見た。

あれは妄想じゃないし勘違いでもない。

確かにＦＥＳは、この僕を見ていた。
あの瞳に宿っていた彼女の感情は、いったいなにを意味していたんだろう。

どうしてあんなに切なそうだったんだろう。

分からない……。

ＦＥＳ本人に直接聞ければいいんだろうけど、僕には無理だ。
あのライブハウスにもう一度入ることも、ＦＥＳに話しかけることだって、無理なんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200170ta">
「もう二度と……来るもんか……」

絞り出すように僕はそうつぶやき、額の汗を拭った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 1000, 0, false);

	ClearAll(2000);

	Wait(2000);


//～～Ｆ・Ｏ

//ＢＧ//拓巳の部屋

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("背景１", 0, 0, null, true);
	Fade("背景１", 2000, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
ファンタズムのライブから帰ってくると、僕はすぐにエンスーを起動させた。

手近にあった食べかけのポテチはすでに湿気っていたけど気にしない。意外にイケる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流３へ

}
//=============================================================================//







//=============================================================================//
//合流３

	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");
	SoundPlay("SE02", 2000, 500, true);

	CubeRoom3("ルーム", 100, 0);
	MoveCube("ルーム", 0, @0, @0, @150, null, true);
	CreateSE("SE03","SE_日常_家具_イス_きしむ");
	SoundPlay("SE03", 0, 1000, false);
	Fade("ルーム", 500, 1000, null, false);
	MoveCube("ルーム", 500, @0, @0, @-150, Dxl2, true);

	Wait(1000);

	BGMPlay360("CH02",3000,500,true);

	CreateSE("SE04","SE_日常_PC_キーたたく_長");
	SoundPlay("SE04", 0, 500, false);

	Wait(500);
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
僕にとってエンスーは日常であり、心地よい世界であり、現実を忘れるための清涼剤だ。

エンスーに潜ってさえいれば、イヤなことは全部忘れられる。僕は僕でなくなり、ナイトハルトとしてバゼラードを駆け回る。

でも、今日はあまりナイトハルトの調子がよくなかった。もちろんそれが自分のキーさばきと判断力の問題なのは分かってる。

でも、いつもはできることがうまくいかず、清涼剤のはずなのにプレイしていてどんどんイライラしてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	CreateSE("SE04","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	CreateSE("SE05","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");

	SoundPlay("SE03", 0, 500, false);
	Wait(100);
	SoundPlay("SE04", 0, 500, false);
	Wait(100);
	SoundPlay("SE03", 0, 500, false);
	Wait(200);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200180ta">
「なんだよコイツ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	CreateSE("SE04","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	CreateSE("SE05","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	CreateSE("SE06","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	CreateSE("SE07","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	CreateSE("SE08","SE_衝撃_衝撃音03");

	SoundPlay("SE03", 0, 500, false);
	Wait(100);
	SoundPlay("SE04", 0, 500, false);
	Wait(100);
	SoundPlay("SE05", 0, 500, false);
	Wait(100);
	SoundPlay("SE06", 0, 500, false);
	Wait(100);
	SoundPlay("SE07", 0, 500, false);
	Wait(100);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200190ta">
「捨てるぞお前！」

自分のせいだと分かっていながらナイトハルトに八つ当たりする。

{	SoundPlay("SE08", 0, 1000, false);
	Shake("ルーム", 200, 5, 5, 0, 0, 200, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200200ta">
「あーもー！　ムカつく！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_じん体_動作_足_蹴る_イス");
	CreateSE("SE06","SE_日常_家具_イス_きしむ");

	Shake("ルーム", 400, 5, 10, 0, 0, 400, null, false);
	SoundPlay("SE05", 0, 1000, false);
	Wait(500);	

	SoundPlay("SE06", 0, 1000, false);
	Rotate("ルーム", 400, @15, @0, @0, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602013]
髪の毛を掻きむしり、足で鉄板むき出しの壁を蹴る。
怒りをさんざん発散してから、ため息をついてイスに背中を預けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);

	CreateTextureEX("背景引継ぎ", 150, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	CreateMovie360("ナイトハルト", 100, Center, Middle, true, false, "dx/mvNH01.avi");	
	Fade("ナイトハルト", 0, 0, null, true);
	Fade("ナイトハルト", 600, 1000, null, true);
	Delete("ルーム");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
ぼんやりとモニタを眺める。
ナイトハルトは僕の操作を離れ、今はシャングリルの街の入り口にあさっての方向を向いたまま突っ立っていた。

いつもこうしてナイトハルトの背中をみながら敵と戦ってきた。ナイトハルトの経験値はもちろんＭＡＸだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200210ta">
「僕の経験値っていくつなんだろ……」

西條拓巳という人間は、エンスーを始めてから――いや、そもそも生まれてから少しは成長してるんだろうか。

成長してるなら、どうして人と話すのが苦手なんだろう。どうして引きこもり一歩手前の生活をしてるんだろう。

ナイトハルトも、僕が何週間もログインしなければ、
引きこもりになっちゃうってことなのかな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//――その目だれの目？
	Fade("色１", 0, 1000, null, true);
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 600, center, middle, Auto, Auto, "――その目だれの目？");

	SetBacklog("――その目だれの目？", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, false);
	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
ナイトハルトの背中を見ていたら、ふとその言葉を思い出していた。

ナイトハルトは僕が操作をしていないとき、なにをしているのか少し興味が出てきた。

そのままキーボードを触らないようにして、ポテチを食べつつしばらく観察してみる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200220ta">
「もしナイトハルトに自我があるとしたら……」

きっとシャングリルの街を肩で風をきって歩いていることだろう。彼は皆が崇拝する勇者なんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Fade("背景引継ぎ", 500, 1000, null, true);
	Delete("ナイトハルト");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200230ta">
「ねえ、ナイトハルト。僕はいつでもお前を見てるんだぞ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/04200240ta">
「お前はそれに気付いてるの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("９");
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);

	EndTrigger();

//～～Ｆ・Ｏ

}

//おがみ：以下、テキストダブりです。妄想トリガー９にて同じ記述あり。

//と、そのとき――

//キーボードに触れていないにもかかわらず、それまで背中を向けて棒立ちしていたナイトハルトの顔だけが、

//突然、
//こちらへ振り返った――

//ような気がしたｗｗｗ

//【拓巳】
//<voice name="拓巳" class="拓巳" src="voice/ch02/04200250ta">
//「なんつって。ふひひ」

//結局その後１時間以上、ボケーッとモニタを眺めていたけど、ナイトハルトは延々とその場に立ち続けているだけだった。

