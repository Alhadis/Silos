//<continuation number="40">

chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_142k_★梢編_インターミッション３０Ａ";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	ch07_142k_★梢編_インターミッション３０Ａ();
}


function ch07_142k_★梢編_インターミッション３０Ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編
//２周目梢編追加インターミッション３０Ａ

//梢編突入フラグが立っている場合、“ch07_142_ＤＱＮに絡まれる”終了後にアイキャッチを入れて、以下を挿入

//※※３６０以下
//アイキャッチ
//■インターミッション３０Ａ

//ＢＧ//黒
	IntermissionIn();

	DeleteAll();

//▼べー//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");

//■アイキャッチOUT
	IntermissionIn2();

	Wait(1000);

	BGMPlay360("CH01", 3000, 1000, true);
	CreateTexture360("梢ソード", 100, 0, 80, "cg/bg/bg235_01_6_chn梢ディソードアップ_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆リアル声//◆恍惚
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00200010ko">
「はあ……はあ……」

人の気配がほとんどない、センター街の路地裏。
少女――折原梢の、かすかな息づかいが聞こえている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//梢ディソードの先端アップ。血がこびりつき、したたっている
	CreateSE("SE01","SE_じん体_手首_たれる血");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Move("梢ソード", 2000, @0, @-80, Dxl1, false);
	FadeDelete("Black", 1000, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
彼女は、巨大な剣を抱えていた。
いや、それは剣と呼べるかどうかも怪しいほどに、独特な形状をしていた。

さながらスノーボード。

けれどエッジ部分は比べものにならないほどに鋭利。
凶暴さすら感じさせるほどに表面は硬質。
人に対して振り回せば、瞬時に骨ごと叩き斬ることができるだろう。

その剣の先端には、赤黒い血がべったりとこびりつき、滴っている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//路地裏
//キャラ表示//梢武器構え
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg090_01_2_路地裏_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	Wait(500);


	Delete("梢ソード");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
梢の前では、１人の若者が這いつくばっていた。ところどころに汚水の水たまりができているにもかかわらず、彼は這ったまま梢から少しでも遠ざかろうとしている。

梢はそれを、ニコニコとした笑みで見つめていた。
いつもの、おどおどした気弱そうな態度は影もない。
とても楽しそうで。その頬は、興奮からかわずかに上気している。

彼女が持つ剣は、すでに２人の若者を、慈悲もなく血祭りに上げた後だった。

――殺しはしない。でも悪い人は痛めつけてやる。

血まみれで、顔を腫らしている３人のガラの悪い若者たち。
彼らはついさっきまで、梢のクラスメイト――西條拓巳――をいじめていた。

彼女は、人の心の声を聞くことができる。
たまたま近くを通りかかった梢の頭に、いくつかの醜悪な声が飛び込んできたのだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black", 950, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

	Wait(1000);

//――キモいキモいなめんなエスパーキモい死ね殴ってやるキモい殴る死ねエスパーうぜえ八つ当たり八つ当たり俺昨日女に振られたしマイコマジナメんな腹いせだうぜえ死ね死ねニセエスパー八つ当たり死ね。
	SetFont("ＭＳ ゴシック", 26, #ffffff, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１１", 1000, center, middle, Auto, Auto, "――キモいキモいなめんなエスパーキモい死ね殴ってやる");
	Move("テキスト１１", 0, @10, @-26, null, true);
	SetBacklog("――キモいキモいなめんなエスパーキモい死ね殴ってやる", "NULL", NULL);
	Request("テキスト１１", NoLog);
	Request("テキスト１１", Enter);
	Request("テキスト１１", NoIcon);
	WaitAction("テキスト１１", null);

	CreateText("テキスト１２", 1000, center, middle, Auto, Auto, "キモい殴る死ねエスパーうぜえ八つ当たり八つ当たり");
	Move("テキスト１２", 0, @10, @0, null, true);
	SetBacklog("キモい殴る死ねエスパーうぜえ八つ当たり八つ当たり", "NULL", NULL);
	Request("テキスト１２", NoLog);
	Request("テキスト１２", Enter);
	Request("テキスト１２", NoIcon);
	WaitAction("テキスト１２", null);

	CreateText("テキスト１３", 1000, center, middle, Auto, Auto, "俺昨日女に振られたしマイコマジナメんな腹いせだうぜえ");
	Move("テキスト１３", 0, @10, @+26, null, true);
	SetBacklog("俺昨日女に振られたしマイコマジナメんな腹いせだうぜえ", "NULL", NULL);
	Request("テキスト１３", NoLog);
	Request("テキスト１３", Enter);
	Request("テキスト１３", NoIcon);
	WaitAction("テキスト１３", null);

	CreateText("テキスト１４", 1000, center, middle, Auto, Auto, "死ね死ねニセエスパー八つ当たり死ね。");
	Move("テキスト１４", 0, @10, @+51, null, true);
	SetBacklog("死ね死ねニセエスパー八つ当たり死ね。", "NULL", NULL);
	Request("テキスト１４", NoLog);
	Request("テキスト１４", Enter);
	Request("テキスト１４", NoIcon);
	WaitAction("テキスト１４", null);


	WaitKey(1000);
	Fade("テキスト１*", 1000, 0, null, true);
	Delete("テキスト１*");

//――命令された命令された命令された金もらえるし金たくさんもらえるだから殴れ金金いたぶれ殺せ金殺せ殺せ殺せあひゃひゃひゃひゃ！
	SetFont("ＭＳ ゴシック", 26, #ffffff, #000000, 500, LIGHTDOWN);
	CreateText("テキスト２１", 1000, center, middle, Auto, Auto, "――命令された命令された命令された金もらえるし");
	Move("テキスト２１", 0, @10, @-26, null, true);
	SetBacklog("――命令された命令された命令された金もらえるし", "NULL", NULL);
	Request("テキスト２１", NoLog);
	Request("テキスト２１", Enter);
	Request("テキスト２１", NoIcon);
	WaitAction("テキスト２１", null);

	CreateText("テキスト２２", 1000, center, middle, Auto, Auto, "金たくさんもらえるだから殴れ金金いたぶれ殺せ金殺せ殺せ殺せ");
	Move("テキスト２２", 0, @10, @0, null, true);
	SetBacklog("金たくさんもらえるだから殴れ金金いたぶれ殺せ金殺せ殺せ殺せ", "NULL", NULL);
	Request("テキスト２２", NoLog);
	Request("テキスト２２", Enter);
	Request("テキスト２２", NoIcon);
	WaitAction("テキスト２２", null);

	CreateText("テキスト２３", 1000, center, middle, Auto, Auto, "あひゃひゃひゃひゃ！");
	Move("テキスト２３", 0, @10, @+26, null, true);
	SetBacklog("あひゃひゃひゃひゃ！", "NULL", NULL);
	Request("テキスト２３", NoLog);
	Request("テキスト２３", Enter);
	Request("テキスト２３", NoIcon);
	WaitAction("テキスト２３", null);


	WaitKey(1000);
	Fade("テキスト２*", 1000, 0, null, true);
	Delete("テキスト２*");

//――気持ちいい人を殴るの気持ちいい気持ちいいぜ最高マジで気持ちいいんで社会に刃向かってる俺最高ケーサツも先公も母ちゃんも誰も俺を止められない俺最高だしかっこいいし人を殴る俺かっこいい。
	SetFont("ＭＳ ゴシック", 26, #ffffff, #000000, 500, LIGHTDOWN);
	CreateText("テキスト３１", 1000, center, middle, Auto, Auto, "――気持ちいい人を殴るの気持ちいい気持ちいいぜ最高");
	Move("テキスト３１", 0, @10, @-26, null, true);
	SetBacklog("――気持ちいい人を殴るの気持ちいい気持ちいいぜ最高", "NULL", NULL);
	Request("テキスト３１", NoLog);
	Request("テキスト３１", Enter);
	Request("テキスト３１", NoIcon);
	WaitAction("テキスト３１", null);

	CreateText("テキスト３２", 1000, center, middle, Auto, Auto, "マジで気持ちいいんで社会に刃向かってる俺最高");
	Move("テキスト３２", 0, @10, @0, null, true);
	SetBacklog("マジで気持ちいいんで社会に刃向かってる俺最高", "NULL", NULL);
	Request("テキスト３２", NoLog);
	Request("テキスト３２", Enter);
	Request("テキスト３２", NoIcon);
	WaitAction("テキスト３２", null);

	CreateText("テキスト３３", 1000, center, middle, Auto, Auto, "ケーサツも先公も母ちゃんも誰も俺を止められない");
	Move("テキスト３３", 0, @10, @+26, null, true);
	SetBacklog("ケーサツも先公も母ちゃんも誰も俺を止められない", "NULL", NULL);
	Request("テキスト３３", NoLog);
	Request("テキスト３３", Enter);
	Request("テキスト３３", NoIcon);
	WaitAction("テキスト３３", null);

	CreateText("テキスト３４", 1000, center, middle, Auto, Auto, "俺最高だしかっこいいし人を殴る俺かっこいい。");
	Move("テキスト３４", 0, @10, @+51, null, true);
	SetBacklog("俺最高だしかっこいいし人を殴る俺かっこいい。", "NULL", NULL);
	Request("テキスト３４", NoLog);
	Request("テキスト３４", Enter);
	Request("テキスト３４", NoIcon);
	WaitAction("テキスト３４", null);


	WaitKey(1000);
	Fade("テキスト３*", 1000, 0, null, true);
	Delete("テキスト３*");

	Wait(1000);

//――殺してやりたい。
	SetFont("ＭＳ ゴシック", 26, #ffffff, #000000, 500, LIGHTDOWN);
	CreateText("テキスト２", 1000, center, middle, Auto, Auto, "――殺してやりたい。");
	Move("テキスト２", 0, @10, @0, null, true);
	SetBacklog("――殺してやりたい。", "NULL", NULL);
	Request("テキスト２", NoLog);
	Request("テキスト２", Enter);
	Request("テキスト２", NoIcon);
	WaitAction("テキスト２", null);
	
	WaitKey(1000);
	Fade("テキスト２", 1000, 0, null, true);
	Delete("テキスト２");
/*
――キモいキモいなめんなエスパーキモい死ね殴ってやるキモい殴る死ねエスパーうぜえ八つ当たり八つ当たり俺昨日女に振られたしマイコマジナメんな腹いせだうぜえ死ね死ねニセエスパー八つ当たり死ね。

――命令された命令された命令された金もらえるし金たくさんもらえるだから殴れ金金いたぶれ殺せ金殺せ殺せ殺せあひゃひゃひゃひゃ！

――気持ちいい人を殴るの気持ちいい気持ちいいぜ最高マジで気持ちいいんで社会に刃向かってる俺最高ケーサツも先公も母ちゃんも誰も俺を止められない俺最高だしかっこいいし人を殴る俺かっこいい。

――殺してやりたい。
*/

	Delete("レンズ*");
	FadeDelete("Black", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
いくつかの、醜い心の声の群れから、浮かび上がってくるような、とても強い、憎悪の声。

それが拓巳の心の叫びだと気付いたときには、梢はその場に駆けつけていた。

そして、悪いヤツをやっつけた。

あと１人ぶちのめせば、正義は為される。
彼女にとっても、西條拓巳にとっても、脅威は取り除かれる。

だから、這って逃げようとしている若者を、梢は、逃がさない。

――許して死ぬ殺されるぶっ殺すぞ！死ぬ死ぬ死ぬのはいやだいやだよいやだ殺すな殺してやる殺して内臓ぶちまけて殺されるいやだ俺もっと生きたいもっと楽して生きたいしもっと気持ちいいことしたい！

心の中で、見逃してもらおうと必死に懇願している若者。
梢は、笑みを崩さずに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面","mad", 200, @+180);
	FadeStand("bu梢_制服_正面_mad", 700, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆リアル声//◆含み笑い
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00200020ko">
「っ…………」

//以上、リアル声
その若者の髪を背後からつかみ、無理矢理立ち上がらせる。

彼女と若者とでは、体格差があまりにも違うにもかかわらず。
若者はもはや抵抗する気力すらなく、目に涙をためて、いたいけな少女に対して許しを懇願する。

//◆リアル声//◆含み笑い
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00200030ko">
「っ…………」

//以上、リアル声
梢の答えは、否。
声は出さずに。小さな口が“ダ・メ”という形を作る。

{	Stand("bu梢_制服_武器構え2","mad", 200, @+180);
	FadeStand("bu梢_制服_武器構え2_mad", 500, false);
	DeleteStand("bu梢_制服_正面_mad", 500, true);}
立たせた男に向けて。
巨大な剣が、うなりをあげた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	DeleteStand("bu梢_制服_武器構え2_mad", 200, true);

	XBOX360_LockVideo(true);

//ＢＧ//赤
	CreateColor("痛い", 1000, 0, 0, 1280, 720, "Red");
	Fade("痛い", 0, 0, null, true);

//ＳＥ//ディソード振る
//ＳＥ//ディソードでぶん殴って骨を砕く音と血が飛び散る音
	CreateSE("SE02","SE_擬音_ディそーど2");
	CreateSE("SE03","SE_擬音_びちゃ");
	CreateSE("SE04","SE_衝撃_顔面蹴られる");
	CreateSE("SE05","SE_衝撃_どすーん");


	XBOX360_LockVideo(false);

	CreateMovie360("ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");
//	Request("ムービー", Play);

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Wait(100);

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	Fade("痛い", 0, 1000, null, true);

	WaitAction("ムービー", null);

	Fade("ムービー", 300, 0, null, true);
	Delete("ムービー");

	Wait(500);

	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	FadeDelete("痛い", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
一撃で、若者のあごの骨が粉砕されていた。
男の悲鳴がこだまする。
もんどり打って倒れる。

血が、梢の着ている服に飛び散りそうになって。
剣を盾代わりにして、それを防いだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_擬音_ディそーど出現");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateColor("フラッシュ",2000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 200, 1000, null, true);


	FadeDelete("フラッシュ", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
満足そうにひとつうなずいて、梢は剣を“消した”。
路地の隅に倒れ込んでいる西條拓巳の姿をちらりと一瞥してから、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","mad", 250, @-50);
	FadeStand("bu梢_制服_通常_mad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆リアル声
//【梢】
<voice name="梢" class="梢" src="voice/chn04/00200040ko">
「はあ……はあ……」

{	DeleteStand("bu梢_制服_通常_mad", 300, true);}
//以上、リアル声
吐息を漏らしつつ、心の中でこうつぶやいた。

――殺してあげたかったけど、これで終わりにしとくね。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, NULL);

*/
//～～Ｆ・Ｏ
	ClearAll(2000);
	Wait(1500);

//アイキャッチ
//※拓巳視点に戻る
//※※３６０以上

//この後、“ch07_143_梢に連れられて”へ

}