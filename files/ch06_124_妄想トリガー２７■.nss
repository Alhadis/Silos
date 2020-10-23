//<continuation number="760">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_124_妄想トリガー２７■";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch06_124_妄想トリガー２７■();
}


function ch06_124_妄想トリガー２７■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");


//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐７へ
//ネガティブ妄想→分岐８へ
//妄想しない→分岐９へ

if($妄想トリガー通過２７ == 0)
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
			$妄想トリガー２７ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー２７ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー２７ = 0;
		}
	}
}


if($GameDebugSelect == 1)
{
	SetChoice02("七海ルート有り","七海ルート無し");
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
			$七海ルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$七海ルート=false;
		}
	}
	$GameDebugSelect = 0;
}

//=============================================================================//

if($妄想トリガー２７ == 2)
{
//☆☆☆
//分岐７


	SoundPlay("SE*", 0, 0, false);

	DelusionFakeIn();

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	CreateSE("SE03","SE_日常_でんわ_呼びだし音_LOOP");
	CreateSE("SE05","SE_日常_けい帯_着信音_七海2");
	SoundPlay("SE05", 3000, 600, true);
	SoundPlay("SE03", 3000, 1000, true);

	DelusionFakeIn2();

	Wait(1500);

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//電話呼び出し音（ぷるるるるる）

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
七海はまだ出ない。
出てよ、早く出てくれよ……

{	CreateSE("SE04","SE_日常_でんわ_ぶつっと切れる");
	SoundPlay("SE03", 200, 0, false);
	SoundPlay("SE05", 200, 0, false);
	SoundPlay("SE04", 0, 600, false);
	Wait(800);
	SoundPlay("SE04", 0, 0, false);}
//ＳＥ//電話繋がる
あ、繋がった！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400010ta">
「な、七海……！？」

//ＶＦ//電話の声
//◆ブレス
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400020na">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400030ta">
「七海？　七海でしょ？　へ、返事しろよ……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400040ta">
「い、今、どこにいるんだ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400050ta">
「だ、大丈夫、なの？　なあ、なにか言って……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400060ta">
「七海！　七海！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//以下のセリフ、電話の声とリアルの声と同時に発してる感じで
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400070na">
「えっとね……」

//以下のセリフ、電話の声とリアルの声と同時に発してる感じで
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400080na">
「実は……」

ん？　あれ？
なんか、変だぞ。

電話からだけじゃなくて、まるですぐ近くからも七海の声が聞こえてくるような……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400090ta">
「お、お前……いったいどこに……いるんだ……？」

//以下のセリフ、電話の声とリアルの声と同時に発してる感じで
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400100na">
「あのね……上」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400110ta">
「上……？」

何気なく見上げてみた。

ベッドの上で、人影が動くのが見えた。あんな狭いところで、積み上がっていたエロゲの箱を崩しながら、もぞもぞとしている。

まさか……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400120ta">
「そこに、いるの……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 4000, 300, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//以下は電話の声は無しで
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400130na">
「あはは、見つかっちゃった……てへ」

{	CreateSE("SE04","SE_日常_物音");
	SoundPlay("SE04", 0, 600, false);}
申し訳なさそうな表情でひょっこり顔をのぞかせたのは、案の定七海だった。

もしかしてこいつ、隠れてたのか。
いつの間に……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400140ta">
「な、な、な、なにが、てへ、だよ……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400150ta">
「そ、それより、車椅子の、怪しい、ヤツに、
あ、会わなかったか……！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_じん体_動作_手_ぱいぷいす引きずる");
	SoundPlay("SE04", 0, 600, false);
	Wait(2000);
	SoundPlay("SE04", 500, 0, false);
	CreateSE("SE36001","SE_じん体_動作_尻餅");
	CreateSE("SE03","SE_じん体_動作_座る七海");
	SoundPlay("SE03", 0, 600, false);
	Stand("st七海_制服_通常","normal", 200, @100);
	FadeStand("st七海_制服_通常_normal", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
ベッドから降りてきた七海の全身を観察し、異常がないかどうか確かめてみる。

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400160na">
「えっと、お、おにぃ、ちょっと落ち着いてってば」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400170ta">
「き、聞いてるんだ、こた、答えろよぅ！
　お前、ほ、ホントに大丈夫なのか！？」

{	Stand("st七海_制服_拗ね","sad", 200, @100);
	FadeStand("st七海_制服_拗ね_sad", 300, false);
	DeleteStand("st七海_制服_通常_normal", 300, true);}
//◆申し訳なさそう
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400180na">
「それって、『将軍』のこと……だよね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400190ta">
「ま、まさか……あ、会ったのか！？　どこで！？　なにをされた！？」

{	DeleteStand("st七海_制服_拗ね_sad", 500, true);
	SoundPlay("SE36001", 0, 1000, false);}
七海の肩をつかみ、必死に詰め寄る。

くそぅ、確かに七海は生意気な妹だけど、もし『将軍』にキズモノにされたんだとしたら、それは僕のせいだ……。

『将軍』は僕を挑発するつもりで、七海に手を出したんだ。七海はそれの巻き添えになった……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400200ta">
「ごめん……」

自分が情けなくて、涙が出た。
周りの人間にまで迷惑をかけてしまった。

なにが“無害なオタク”だよ。

僕は、最低だ。
兄としてどころか、人間としてクズだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","shock", 200, @100);
	FadeStand("bu七海_制服_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400210na">
「おにぃ……泣いてるの？
もしかして、ナナのこと心配してくれてる？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400220ta">
「ぐすっ……ごめん……僕の、せいで……」

//◆困惑
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400230na">
「な、泣かないでよ。あはは、えーと、困ったな……」

{	Stand("bu七海_制服_拗ね","angry", 200, @100);
	FadeStand("bu七海_制服_拗ね_angry", 300, false);
	DeleteStand("bu七海_制服_通常_shock", 300, true);}
//◆申し訳なさそう
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400240na">
「じ、実は、あの『将軍』のメール……ナナのイタズラ……なんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400250ta">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400260ta">
「……はあ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 200, 0, false);
	BGMPlay360("CH05",1000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
七海の言葉が理解できなかった。
それで、僕は呆然となってしまう。

{	Stand("bu七海_制服_通常","normal", 200, @100);
	FadeStand("bu七海_制服_通常_normal", 300, false);
	DeleteStand("bu七海_制服_拗ね_angry", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400270na">
「つまり、『将軍』ってナナだったの！　最初からずーっと」

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400280na">
「おにぃがあんまりにもナナの相手してくれないから、ちょっとからかうつもりで……つい」

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400290na">
「だからね、ナナは誰にもなんにもされてないし、
　まったくピンピンしてるよ！」

{	Stand("bu七海_制服_通常","smile", 200, @100);
	FadeStand("bu七海_制服_通常_smile", 300, false);
	DeleteStand("bu七海_制服_通常_normal", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400300na">
「おにぃが泣くことなんてないの。分かった？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400310ta">
「お、おま……」

{	DeleteStand("bu七海_制服_通常_smile", 500, true);}
ホッとした。

騙されたことに、あり得ない、ふざけるなと思いつつも、安心してしまって涙がさっき以上にぽろぽろとこぼれてくる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400320ta">
「ふざ、ふざけ……んなよぅ……ぐすっ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","smile", 200, @100);
	FadeStand("bu七海_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400330na">
「ごっめーん！　ホントにごめんね、おにぃ」

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400340na">
「差し入れ持ってきたから、それで許して」

{	DeleteStand("bu七海_制服_通常_smile", 500, true);}
片手で拝むようにして僕に謝ると、七海はいそいそと部屋の隅に隠してあった紙箱を持ち出してきた。

中には、ケーキが４つ入っていた。
モンブランがふたつと、チーズケーキがふたつ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","normal", 200, @100);
	FadeStand("bu七海_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400360na">
「どう？　おいしそうでしょ？　ま、当然だよね、ナナの手作りだもん。おにぃのために作ったんだからね」

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400370na">
「ほら、一緒に食べよ？」

{	DeleteStand("bu七海_制服_通常_normal", 500, true);}
七海はＰＣデスクの上に箱を置き、どこから用意したのか紙皿にケーキをふたつずつ選り分ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","normal", 200, @100);
	FadeStand("bu七海_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400380na">
「ねえおにぃ。ナナのこと心配してくれて、ありがと」

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400390na">
「すごく嬉しかった。おにぃにもいいところあるじゃん」

//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400400na">
「泣いちゃったのは、ちょっと情けなかったけどね。あは」

黙れ、この嘘つき妹め……。

まんまと騙されて涙まで流して、僕のプライドはズタズタだ。ホント、バカみたいだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","shy", 200, @100);
	FadeStand("bu七海_制服_通常_shy", 300, false);
	DeleteStand("bu七海_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400410na">
「でも――」

{	Stand("bu七海_制服_通常","smile", 200, @100);
	FadeStand("bu七海_制服_通常_smile", 300, false);
	DeleteStand("bu七海_制服_通常_shy", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400420na">
「おにぃが、ナナのおにぃでよかった」

嬉しそうに、僕に向かって微笑む。

ちょっとだけいつもより平和な光景。

こんな光景なら……どんなによかっただろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//妄想ＯＵＴ
//画面エフェクト//妄想ＯＵＴエフェクト

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionOut();

	DeleteStand("bu七海_制服_通常_smile", 500, true);

	CreateSE("SE03","SE_日常_でんわ_呼びだし音_LOOP");
	CreateSE("SE04","SE_日常_けい帯_着信音_七海2");
	SoundPlay("SE04", 3000, 600, true);
	SoundPlay("SE03", 3000, 1000, true);

	DelusionOut2();
	PositiveHuman();

//電話の呼び出し音（ぷるるるるる）がフェードイン
//ＢＧ//拓巳の部屋

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
そう、今のは僕の都合のいい妄想でしかない。

いまだに七海は電話には出ず、部屋の中には何者かのケータイの呼び出し音が響き続けている。

僕の心理状態とはおよそ対照的な、脳天気なメロディ。
絶望的な気分になる。

やっぱり、これが意味するのは、七海のケータイ電話が、この部屋にあるっていうこと。

それ以外には考えられない。
もう、現実から目をそらすことなんてできない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//合流３へ

}


//=============================================================================//

if($妄想トリガー２７ == 1)
{
//☆☆☆
//分岐８
//ＳＥ//電話呼び出し音（ぷるるるるる）

	SoundPlay("SE*", 0, 0, false);

	DelusionFakeIn();

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	CreateSE("SE03","SE_日常_でんわ_呼びだし音_LOOP");
	SoundPlay("SE03", 0, 1000, true);

	DelusionFakeIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
七海はまだ出ない。
出てよ、早く出てくれよ……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//電話繋がる
	CreateSE("SE04","SE_日常_でんわ_ぶつっと切れる");
	SoundPlay("SE03", 200, 0, false);
	SoundPlay("SE05", 200, 0, false);
	SoundPlay("SE04", 0, 600, false);
	Wait(800);
	SoundPlay("SE04", 0, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
あ、繋がった！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400430ta">
「な、七海……！？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch06/12400440jn">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400450ta">
「七海？　七海でしょ？　へ、返事しろよ……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400460ta">
「い、今、どこにいるんだ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400470ta">
「だ、大丈夫、なの？　なあ、なにか言ってよ……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400480ta">
「七海！　七海！」

必死で電話の向こうに呼びかける。
そして返ってきた声は――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//ＶＦ//電話の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch06/12400490jn">
「少しは――」

//ＶＦ//電話の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch06/12400500jn">
「落ち着いたら？」

{	BGMPlay360("CH01",1000,1000,true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400510ta">
「…………！」

この声……。
この声は……！

『将軍』！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400520ta">
「な、んで……」

愕然となる。

七海のケータイにかけたら『将軍』が出た、というこの事実を、なかなか受け入れられない。

ただバカみたいに、同じ言葉を繰り返すことが精一杯だった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400530ta">
「なんで……」

//ＶＦ//電話の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch06/12400540jn">
「メールの意味が、分からなかったのかな？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ブツッと電話切れる
//ＳＥ//ツーツーツー
	CreateSE("SE04","SE_日常_でんわ_ぶつっと切れる");
	SoundPlay("SE04", 0, 800, false);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400550ta">
「信じない……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400560ta">
「こんなの信じない！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//妄想ＯＵＴ
//画面エフェクト//妄想ＯＵＴエフェクト

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionOut();

	CreateSE("SE03","SE_日常_でんわ_呼びだし音_LOOP");
	CreateSE("SE04","SE_日常_けい帯_着信音_七海2");
	SoundPlay("SE04", 3000, 600, true);
	SoundPlay("SE03", 3000, 1000, true);

	DelusionOut2();
	NegativeHuman();

//ＢＧ//拓巳の部屋
//電話の呼び出し音（ぷるるるるる）がフェードイン

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
そう、信じない。さっきのは妄想だ。
僕が考えた最悪の事態だ。

でも現実はそれに近い状態にある。

いまだに七海は電話には出ず、部屋の中には何者かのケータイの呼び出し音が響き続けている。

僕の心理状態とはおよそ対照的な、脳天気なメロディ。
絶望的な気分になる。

やっぱり、これが意味するのは、七海のケータイ電話が、この部屋にあるっていうこと。

それ以外には考えられない。
もう、現実から目をそらすことなんてできない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//合流３へ

}


//=============================================================================//

if($妄想トリガー２７ == 0)
{
//☆☆☆
//分岐９
//ＳＥ//電話呼び出し音（ぷるるるるる）

	CreateSE("SE03","SE_日常_でんわ_呼びだし音_LOOP");
	SoundPlay("SE03", 2000, 1000, true);

	Wait(2000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
七海はまだ出ない。
出てよ、早く出てくれよ……

こうなったら実家に電話してみよう。そうだ、そうすれば早いじゃないか。

さっきからずっと聞こえている謎の着信音のことは無視して、僕はひとまず七海への電話を切った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE03", 100, 0, false);
	CreateSE("SE02","SE_日常_けい帯ボタン押す");
	SoundPlay("SE02", 0, 1000, false);
	Wait(2000);
	SoundPlay("SE04", 100, 0, false);

	Wait(1000);

//ＳＥ//ケータイを切る「ピッ」
//ＳＥ//七海のケータイの着信音もＯＦＦ

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400570ta">
「…………」

切れた……。
謎の着信音が、途切れた。

急に自分の部屋が静かになった。
少しだけタイムラグがあったけど、確かにあのメロディが聞こえなくなったのは、

僕が、ケータイを切ったのと、

ほぼ同時だった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400580ta">
「なんで……」

ますます混乱してくる。

どうしたらいいか分からず、部屋の中をグルグルと見回すことしかできない。見回すって言っても、僕の意識はなにも見ていなかった。

ただ視界を巡らせるだけ。
頭の中は真っ白だ。

もう一度、七海に電話をしてみた。

今度はあの着信音も鳴らないかもしれない、今度は七海も電話に出てくれるかもしれない、ぼんやりした頭でそんな淡い期待を抱いてみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateTextureEX("七海携帯番号", 100, 0, 0, "cg/bg/bg188_02_3_携帯電話七海表示_a.jpg");

	CreateSE("SE03","SE_日常_けい帯操作");
	SoundPlay("SE03", 0, 1000, false);

	Wait(6000);

//ＳＥ//ケータイを操作する音「ぴっぴっぴっ」
//２秒ほどウエイト

	CreateSE("SE03","SE_日常_でんわ_呼びだし音_LOOP");
	SoundPlay("SE03", 0, 1000, true);

//ＳＥ//電話呼び出し音（ぷるるるるる）
//ＳＥ//七海のケータイの着信音

	Fade("七海携帯番号", 200, 1000, null, true);
	SetVolume360("CH01", 200, 0, null);
	Wait(2000);
	CreateSE("SE04","SE_日常_けい帯_着信音_七海2");
	SoundPlay("SE04", 0, 500, true);
	SoundPlay("SE02", 200, 0, false);
	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400590ta">
「うっ……」

期待はあっさり裏切られた。

電話の呼び出し音が始まって２秒もしないうちに、またあの脳天気なメロディが鳴り出す。

間違い……ない……。
もう、現実から目をそらすことなんてできない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	FadeDelete("七海携帯番号", 200, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400600ta">
「この部屋に……ある……」

七海のケータイ電話が、この部屋に。

どうして？
七海が忘れていったの？
それとも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//合流３へ

}


//=============================================================================//

//☆☆☆
//合流３

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg159_04_1_PC画面メールソフト_a.jpg");
	Move("背景２", 0, @0, @-640, null, true);
	Fade("背景２", 0, 1000, null, true);
	Wait(1500);

	Fade("背景２", 1500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
『Ｐ．Ｓ．　ところでプレゼントは受け取ってくれた？』

ウソだ……ウソに決まってる……
いくらなんでもそんなのは……無茶苦茶だ……。

僕は、ケータイを持つ手をのろのろと下ろした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//電話呼び出し音（ぷるるるるる）ＯＦＦ
	SoundPlay("SE03", 2000, 0, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
まばたきもできず。
のどはカラカラに渇いて。
それでも、音の出所を探す。

今度はゆっくりと、ゆっくりと、この部屋に散乱している物へひとつひとつ順に目を移していく。

部屋を片付けようとしなかったこれまでの自分を激しく恨んだ。

もっと整理しておけば、どこから聞こえてくるのかすぐに分かったのに……。

音は、いったい、どこから――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※可能ならＢＧ内に見慣れないダンボール箱が置いてあるようにして、そこをプレイヤーにクリックさせる。

//イメージＢＧ//ダンボール箱

	Wait(1000);

	SoundPlay("SE04", 1500, 800, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg160_01_3_ダンボール箱_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	Wait(2500);

	SoundPlay("SE04", 1500, 600, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
この箱……

この中から、メロディが聞こえてくる……。

エロゲーの箱をふたつ並べたくらいのサイズ。

ネット通販の箱かと思ったけど、なんのプリントもされていない。差出人などが書かれた伝票も貼られていない。

だけどしっかりとガムテープで封をしてある。

こんな大きな箱、前からここに置いてあったっけ？
地震でベッドの上から崩れ落ちてきた？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400610ta">
「……いや……」

そもそも、こんな箱、見たことがない。

通販の箱なら、届いたらすぐに開けるし。

オークションの出品物なら、封をしたらすぐに発送しちゃうし。

七海からの差し入れっていうのも考えたけど、こんなダンボール箱で七海がなにかを持ってきたなんていう記憶はない。

つまりは――

さっき、僕が学校へ行っていた、ほんの一時間ぐらいの間に……

誰かが、ここへ来た――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 1000, null, true);

	CreateSE("SE01","SE_じん体_心臓_鼓動_LOOP");
	MusicStart("SE01", 4000, 1000, 0, 1000, null, true);

//おがみ：シナリオ修正　12/18
//『蒋軍：プレゼントを贈るよ』
//『蒋軍：喜んでもらえると嬉しい』

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
『プレゼントを贈るよ』

『喜んでもらえると嬉しい』

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	Wait(500);
	Fade("色１", 500, 0, null, true);
	CreateSE("SE02","SE_日常_施錠をたしかめる");
	SoundPlay("SE02", 0, 1000, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601019]
胸の動悸が激しくなってくる。
慌てて扉の施錠を確認する。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400620ta">
「はあ……はあ……」

ゾワリと、悪寒が背中を走る。

さっき、フラフラとこのベースから外に出たとき――
僕は、この扉に鍵をかけた覚えがない。

それも当然だ。
あのときの僕は、刺すような頭痛に苛まれて、
意識が朦朧としていたんだから……。

学校から戻ってくる一時間の間、この部屋は鍵が開きっぱなしで。
誰でも出入りし放題だった。

……『将軍』が、来たの？
ここに？

{	Fade("背景２", 500, 0, null, true);}
改めて箱を見る。
メロディはいまだに鳴り続けている。
この中に、七海のケータイが入っている。

//■３６０
僕は、恐る恐るそのダンボール箱を持ち上げてみた。

//僕は、恐る恐るその段ボール箱を持ち上げてみた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――


	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	CreateSE("SE02","SE_じん体_動作_尻餅");

	Fade("背景２", 0, 1000, null, true);
	SoundPlay("SE02", 0, 600, false);
	Move("背景２", 200, @0, @8, AxlDxl, true);
	Move("背景２", 200, @0, @-8, AxlDxl, true);


	Wait(200);


if(!$七海ルート){

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text920]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400630ta">
「っ！」

重い……。
ケータイが入ってるだけとは思えない重さだ。

体感でだけど、５００ｍｌのジュースと同じくらい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX2();//――――――――――――――――――――――――――――――

}


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
この箱を開けることを、僕は躊躇した。
すごく……イヤな予感がする……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400640ta">
「こんなの……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400650ta">
「開きたくないよ……」

でも、開けずになんとかする方法が思い浮かばない。

それに、七海のことが心配だ。
あんな生意気なヤツだけど……
それでも、妹なんだ……。

その七海のケータイが、ここに入っている。

それは言い換えれば――
七海が何者かにケータイを奪われたっていうこと。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg160_01_3_ダンボール箱_a.jpg");
	Fade("背景１", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
『では七海ちゃん救出クエストを始めよう』

『将軍』のメールに、そうあった……。

時計を見る。
今は１９時半過ぎ。指定時間まであと１時間半。

七海の身が……危ない……かもしれない……。

開けるしか……ないんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400660ta">
「はあっ……はあっ……」

動悸がおさまらない。
脂汗が額からダラダラと流れ始める。

僕はその汗を手の甲で拭うと、うめき声を上げながらも、雑に貼られたガムテープをそろそろと引き剥がした。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400670ta">
「イヤだ……イヤだ……イヤだ……イヤだ……イヤだ……
イヤだ……イヤだ……イヤだ……イヤだ……イヤだ……
イヤだ……イヤだ……イヤだ……」

祈るようにつぶやきながら、フタを開く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――


	CreateSE("SE02","SE_日常_物音");
	SoundPlay("SE02", 0, 600, false);
	SoundPlay("SE04", 1500, 1000, true);

//イメージＢＧ//ダンボール箱（フタ開く。中にアルミホイルの塊）
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg160_02_3_ダンボール箱_a.jpg");
	Fade("背景２", 500, 1000, null, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
中に入っていたのは、アルミホイルに包まれた塊だった。ご丁寧に緩衝材も一緒に詰め込まれている。

恐る恐る箱の中をのぞき込んでみるけど、ケータイは見当たらない。

メロディが聞こえるのは、
アルミホイルの塊の中。

汗が目に入って、痛みが走る。
気が付けば全身汗だくだった。

うう、もうヤダ……
なんで僕ばっかりこんな目に……

泣き言を言いそうになる。

星来たんに救いの言葉を求めるけど、なにも言ってくれない。

星来たんとの妄想会話ができないくらいに、僕の頭の中はいろいろな妄想が渦巻いて爆発しそうだった。

気持ちが昂ぶり、思考回路が焼き切れそうだ……。
でもケータイの呑気なメロディが、容赦なく僕を急き立てる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400680ta">
「はあはあ……あ、開ける……ぞ……はあ……はあ……」

僕は覚悟を決めると、指でアルミホイルの端をつまみ、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE*", 1000, 0, false);

	Wait(1000);

//ＢＧ//黒
	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 1000, null, true);

	CreateSE("SE05","SE_日常_けい帯_着信音_七海1");
	SoundPlay("SE05", 0, 1, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
目を閉じ、息を止めて、

{	CreateSE("SE02","SE_衝撃_衝撃音03");
	CreateSE("SE03","SE_じん体_動作_手_すけっちぶっくやぶる");
	SoundPlay("SE02", 0, 400, false);
	SoundPlay("SE03", 0, 400, false);
	Wait(200);}
一気にアルミホイルを引き裂いた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(1000);
	SoundPlay("SE05", 3000, 600, true);
	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601023]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400690ta">
「…………」

メロディが今までよりはっきり聞こえてくる。

目を開くのが怖い……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400700ta">
「ううう……はあはあ……はあっはあっ……うううう……くはっはあっ……はあっ……」

息を整えようとするけど、ちっともうまくいかない……。

大丈夫だ、大丈夫、イヤなことなんてなにもない。

どうせ七海のイタズラだ。

そのうち七海が笑顔で“やーい、引っかかったー”とか言ってこの部屋に入ってくるに違いない。

そうだ、きっとそうだ。それしか考えられない。

もしそうなら思い切り叱ってやる。そして二度と口を利いてやらないんだ。

そうだろ、そうだって言ってよ、七海――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400710ta">
「うううう……」

これ以上、目を閉じて暗闇を見つめ続けることに耐えきれなかった。
見ないことで、逆にイヤな妄想ばかりが脳裏に浮かぶ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400720ta">
「はあっ……はあっ……」

だから、僕は――

そっと――

まぶたを――

開けて――

見た――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


if(!$七海ルート){

//イメージＢＧ//七海の切断された手首（とその手が握っているケータイ）
//※３章で拓巳が七海にあげたバングルを手首にはめています。右手。ケータイは拓巳とお揃い。『ゲロカエルん』ストラップ付き

	Wait(2000);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg160_03_3_ダンボール箱_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Fade("色１", 0, 0, null, true);
	SoundPlay("SE05", 200, 1, true);
//	DrawTransition("色１", 1000, 1000, 0, 100, null, "cg/data/lcenter2.png", true);

//	CreateSE("SE02","SE_衝撃_衝撃音02");
//	SoundPlay("SE02", 0, 1000, false);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
そこにあったのは、

手首。

キレイに切断された、か細い手。

その手が握っているのは、僕とお揃いのケータイ。

その手首にはめられているのは、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_日常_けい帯_着信音_七海1");
	CreateSE("SE06","SE_日常_けい帯_着信音_七海1");

	CreateColor("色１", 2200, 0, 0, 1280, 720, "RED");
	Fade("色１", 0, 0, null, true);

	CreateSE("SE02","SE_じん体_心臓_鼓動");
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	CreateSE("SE04","SE_じん体_心臓_鼓動");
	SoundPlay("SE02", 0, 1000, false);

//ＣＧ//バングルを身につける七海
//フラッシュバックで一瞬表示
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 50, 1000, null, true);
	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("背景２", 100, 0, 0, "cg/ev/ev030_01_2_七海バングル_a.jpg");
	Fade("回想フラッシュ", 100, 0, null, true);

	Wait(500);

	Fade("回想フラッシュ", 50, 1000, null, true);
	Fade("背景２", 1, 0, null, true);
	Fade("回想明度", 1, 0, null, true);
	Fade("回想フラッシュ", 200, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
//ＶＦ//回想セリフ
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400730na">
「へえ～、かわいいバングルじゃん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE03", 0, 1000, false);
	Fade("回想フラッシュ", 50, 1000, null, true);
	Fade("回想明度", 1, 300, null, true);
	Fade("背景２", 1, 1000, null, true);
	Fade("回想フラッシュ", 100, 0, null, true);
	Wait(500);
	Fade("回想フラッシュ", 50, 1000, null, true);
	Fade("背景２", 1, 0, null, true);
	Fade("回想明度", 1, 0, null, true);
	Fade("回想フラッシュ", 200, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601026]
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400740na">
「じゃあさ、これナナにちょうだい！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE04", 0, 1000, false);
	Fade("回想フラッシュ", 50, 1000, null, true);
	Fade("回想明度", 1, 300, null, true);
	Fade("背景２", 1, 1000, null, true);
	Fade("回想フラッシュ", 500, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602026]
//【七海】
<voice name="七海" class="七海" src="voice/ch06/12400750na">
「へっへ～。おにぃ、どう？　似合う？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(500);
	Fade("色１", 100, 1000, null, true);
	Fade("回想フラッシュ", 10, 1000, null, true);
	Delete("背景２");
	Delete("回想明度");
	Delete("回想フラッシュ");
	SoundPlay("SE05", 0, 1, true);
	SoundPlay("SE06", 0, 1, true);
	Wait(2000);
	Fade("背景２", 0, 0, null, true);
	Fade("色１", 0, 0, null, true);
	SoundPlay("SE05", 0, 1000, true);
	SoundPlay("SE06", 0, 1000, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603026]
黄色い革のバンド部分が紅く染まってしまった、

バングル――

{	SoundPlay("SE05", 100, 0, false);
	SoundPlay("SE06", 100, 0, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12400760ta">
「うわああーーーーーーーーーーーーーーーーーーー！！！！！！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionOut();

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 1000, null, true);

	DelusionOut2();


//※妄想アウトエフェクトを入れることで、プレイヤーに妄想なのか現実なのか分からなくすべきかどうか、どうしましょう……。
}else{

//※※３６０以下
//イメージＢＧ//血の付いた、七海のケータイ
//※七海の手首とバングルは無しです

	Wait(2000);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg160_03_3_chnダンボール箱_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Fade("色１", 0, 0, null, true);
	SoundPlay("SE05", 200, 1, true);

	Wait(1500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
そこにあったのは、

僕とお揃いのケータイ。

血が、べっとりと、こびり付いていて――

//◆絶叫ではなくうめくような感じ
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00200010ta">
「あ、あああぁぁぁ……！」

{	SoundPlay("SE05", 0, 1000, true);}
それがなにを意味するのかなんて、分かりきったことだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//※※３６０以上
//手首なしに変更。テキストも微調整

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);

	Fade("色１", 300, 1000, null, false);
	SetVolume360("SE05", 200, 0, null);
	DelusionOut();


//	DelusionOut2();


//この後の“ch06_125_インターミッション２６”以降の６章シナリオはカット。七海編第７章へ入ります

}

}