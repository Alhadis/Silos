//<continuation number="710">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_205_Ａインターミッション５２ａ";
		$GameContiune = 1;
		$Ａルート = true;
		Reset();
	}

		ch10_205_Ａインターミッション５２ａ();
}


function ch10_205_Ａインターミッション５２ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//Ａルート
//アイキャッチ
//■インターミッション５２ａ
//ＢＧ//崩壊渋谷・神泉駅ホーム//昼・曇り

	IntermissionIn();

	DeleteAll();

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	Fade("back04", 0, 1000, null, true);

	IntermissionIn2();

	CreateSE("SE10","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE10", 1000, 800, 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
井乃頭線の神泉駅は、渋谷から１駅。電車でわずか１分ほどで到着する駅だ。

駅自体がトンネルによってすっぽりと覆われ、ホームの端にある開口部からわずかに外光が入ってくる程度。

今は地震の影響で照明がすべて消えており、普段と比べてひどく薄暗い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","hard", 200, @+160);
	Stand("st梢_制服_通常","sad", 250, @+320);
	FadeStand("st梢_制服_通常_sad", 500, false);
	FadeStand("stセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
そのホームに、折原梢の身体を支えながら、蒼井セナは足を踏み入れた。

切符を買う必要はなかった。

駅員がどこにも見当たらなかったし、券売機も使い物にならない。

線路を見ると、レールは一目で分かるほどに歪んでしまっていた。当然、電車は昨日から運行停止になっている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_通常_sad", 500, false);
	DeleteStand("stセナ_制服_通常_hard", 500, true);
	Stand("buセナ_制服_通常","hard", 250, @-240);
	Stand("bu梢_制服_通常","sad", 200, @+240);
	FadeStand("bu梢_制服_通常_sad", 500, false);
	FadeStand("buセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//ＶＦ
//◆以下の梢のセリフはすべて心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500010ko">
「ふにゅぅ……ずっきんずっきんするの……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500020sn">
「…………」

梢の左足は、血だらけだった。

地震のとき、割れたガラスでざっくりと切ってしまったのだ。
セナがタオルを巻いて血を止めようとしたが、傷は予想以上に深く、応急処置ではどうにもならなかった。

ギガロマニアックスはその力で怪我を治すことはできない。

痛みが、否応なく怪我は現実のものだと脳に思い知らせるから。

“怪我をしていない”という周囲共通認識を作れない。
なかったことにはできない。
人間の本能が、それをさせてくれないのだ。

//ＶＦ
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500030ko">
「もう歩けないのら～」

梢が泣きそうな顔で弱音を吐いても、セナは無言だった。
ただひたすら、一心不乱という様子で、セナはこの神泉駅を目指して歩いてきたのだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梢_制服_通常_sad", 500, false);
	DeleteStand("buセナ_制服_通常_hard", 500, true);
	Stand("stセナ_制服_通常","hard", 250, @-100);
	FadeStand("stセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
無人と化したホームにたどり着いたところで、セナは不意に梢を支えていた手を離した。

{	CreateSE("SE01","SE_じん体_動作_尻餅");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
片足に力が入らない梢は、たまらずその場にへたり込んでしまう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_正面","sad", 200, @+150);
	FadeStand("st梢_制服_正面_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//※以下のセリフのみリアルの声
//【梢】
<voice name="梢" class="梢" src="voice/ch10/20500040ko">
「……？」

{	Stand("stセナ_制服_通常","angry", 250, @-100);
	FadeStand("stセナ_制服_通常_angry", 300, true);
	DeleteStand("stセナ_制服_通常_hard", 0, true);}
//※以上のセリフのみリアルの声
梢の困惑気味に見上げてくる視線は一顧だにせず。
セナは、ある一点をじっとにらみつけたまま、ギリリと歯ぎしりした。

//◆激しい憤りのブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500050sn">
「…………」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500060sn">
「やっと、見つけた……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 1000, 0, NULL);
	BGMPlay360("CH01", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
その視線の先。

薄暗いホームの奥に、座り込んでいるひとつの人影があった。

{	Stand("st梢_制服_通常","normal", 200, @+150);
	DeleteStand("st梢_制服_正面_sad", 500, false);
	FadeStand("st梢_制服_通常_normal", 500, true);}
//ＶＦ
//◆心の声
//◆パッパー＝パパ
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500070ko">
「あ……セナしゃんのパッパーなのら……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back05", 500, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	Fade("back05", 500, 1000, null, true);
	DeleteStand("stセナ_制服_通常_angry", 0, true);
	DeleteStand("st梢_制服_通常_normal", 0, true);
	Stand("st一成_浮浪者_通常","normal", 250, @+150);
	FadeStand("st一成_浮浪者_通常_normal", 0, true);
	Fade("back05", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
汚らしい服をまとったホームレス。
その手には“人の心は死滅する”と書かれたボード。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_足_歩く");
	MusicStart("SE01",0,1000,0,1000,null,false);

	DeleteStand("st一成_浮浪者_通常_normal", 500, true);
	Stand("stセナ_制服_通常","rage", 250, @-150);
	FadeStand("stセナ_制服_通常_rage", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
セナは男にゆっくりと歩み寄っていった。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500080sn">
「誰に向けたメッセージだ？」

その声は、凍り付きそうなほどに冷たく。

{	DeleteStand("stセナ_制服_通常_rage", 500, true);
	Stand("st一成_浮浪者_通常","normal", 250, @+150);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);}
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500090ha">
「負を正へと変換できる者たちへの、遺言だよ――」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500100ha">
「セナ」

ホームレスの男――波多野はうなだれたまま、娘の顔を見ずに淡々とその名を口にした。

{	DeleteStand("st一成_浮浪者_通常_normal", 500, true);
	Stand("stセナ_制服_通常","angry", 250, @-150);
	FadeStand("stセナ_制服_通常_angry", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500110sn">
「お前に馴れ馴れしく名前を呼ばれたくない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500120sn">
「……この半年、ずっと考えてきた」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500130sn">
「お前を、どうやって殺すか」

{	DeleteStand("stセナ_制服_通常_angry", 500, true);
	Stand("st一成_浮浪者_通常","normal", 250, @+150);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);}
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500140ha">
「ありがとう」

{	DeleteStand("st一成_浮浪者_通常_normal", 500, true);
	Stand("stセナ_制服_通常","angry", 250, @-150);
	FadeStand("stセナ_制服_通常_angry", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500150sn">
「どうして礼を言う」

{	DeleteStand("stセナ_制服_通常_angry", 500, true);
	Stand("st一成_浮浪者_通常","normal", 250, @+150);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);}
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500160ha">
「利己的な理由だよ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500170ha">
「お前に殺されることが、私にとって最善の贖罪かもしれない。そう思ったからだ」

{	DeleteStand("st一成_浮浪者_通常_normal", 500, true);
	Stand("stセナ_制服_通常","angry", 250, @-150);
	FadeStand("stセナ_制服_通常_angry", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500180sn">
「……それなら話は早い」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

/*森島ＥＶ・ＳＥダミー*/
	CreateSE("SE02","SE_衝撃_衝撃は_リアルぶーと");
	MusicStart("SE02", 500, 1000, 0, 1000, null, false);

	CreateColor("back03", 500, 0, 0, 1280, 720, "White");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 1000, 1000, Dxl1, true);

	DeleteStand("stセナ_制服_通常_angry", 0, false);

	Stand("buセナ_制服_武器構え","hard", 250, @-150);
	FadeStand("buセナ_制服_武器構え_hard", 0, true);

	FadeDelete("back03", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
セナはディソードをリアルブートする。

彼女が選択した“父を殺す方法”は、ディソードによる斬殺。

シンプルであることは、真理に近いということ。

殺し方に意味はない。
殺すことに、意味がある。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buセナ_制服_武器構え_hard", 500, true);
	Stand("st一成_浮浪者_通常","normal", 250, @+300);
	Stand("stセナ_制服_武器構え","hard", 250, @-300);
	FadeStand("st一成_浮浪者_通常_normal", 500, false);
	FadeStand("stセナ_制服_武器構え_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500190ha">
「済まない」

波多野はいまだ、顔を上げず。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500200sn">
「どうして謝る」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500210ha">
「お前に、父殺しの汚名を着せてしまうからだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500220sn">
「殺せさえすれば、どんな辱めだって受けてやる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500230sn">
「お前は、母さんと妹を殺した」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500240ha">
「事実だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_武器構え","sad", 250, @-300);
	FadeStand("stセナ_制服_武器構え_sad", 300, true);
	DeleteStand("stセナ_制服_武器構え_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆わずかに動揺
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500250sn">
「しかも、あんな、むごい最期を……」

それまで、感情を押し殺し冷徹さを保っていたセナの声が、かすかに揺らいだ。

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500260ha">
「お前には、見せたくはなかった」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500270ha">
「いや、今のは聞き流してくれ」

{	Stand("stセナ_制服_武器構え","angry", 250, @-300);
	FadeStand("stセナ_制服_武器構え_angry", 300, true);
	DeleteStand("stセナ_制服_武器構え_sad", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500280sn">
「なぜあんなことを！？」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500290ha">
「過程を説明することは無意味だよ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500300ha">
「お前は納得しないし、結果が改変されるわけでもない」

セナはディソードの切っ先を波多野の頭へと向ける。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500310sn">
「そうやってまた逃げるのか」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500320ha">
「間違っていたのは私だ。それがすべてなんだ」

{	Stand("stセナ_制服_武器構え","hard", 250, @-300);
	FadeStand("stセナ_制服_武器構え_hard", 300, true);
	DeleteStand("stセナ_制服_武器構え_angry", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500330sn">
「お前には……失望した……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//ヒュンヒュンという機械音

	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE03", 2000, 800, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆以下、ボイスエフェクト付きの波多野セリフは諏訪による妄想でありニセモノのセリフ
//◆ＶＦ//◆妄想セリフ
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500340ha">
「まだ、期待していたのか？　なにを？」

//◆ブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500350sn">
「…………」

//◆ＶＦ//◆妄想セリフ
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500360ha">
「人を含めて、世界はすべて電気仕掛け」

//◆ＶＦ//◆妄想セリフ
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500370ha">
「そう言ったのは、お前だ、セナ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500380sn">
「……！」

セナの肩が震える。

ここ３年近く――波多野がマナ計画を始めて以来、２人はほとんど会っていない。にもかかわらず、いともたやすく見透かされたことにセナは動揺した。

違和感を覚えつつも、心の揺れは激情へと変換され、彼女の理性を吹き飛ばそうとする。

//◆以下は本物の波多野セリフ
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500390ha">
「セナ、惑わされるな」

//◆ＶＦ//◆妄想セリフ
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500400ha">
「電気仕掛けならば、お前のその私を恨む感情もまた、ただの電気信号でしかない」

波多野がたたみかけてくる。
セナは自らに言い聞かせた。

――落ち着け。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500410sn">
「お前の言葉なんか、無効だ」

{	SetVolume("SE10", 1000, 1000, NULL);}
//◆ＶＦ//◆妄想セリフ
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500420ha">
「あまり感情的な行動を取るな。でなければ、お前は矛盾する」

//◆以下は本物の波多野
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500430ha">
「その言葉を受け取ってはいけない。精神攻撃だ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500440ha">
「判断を中止するんだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500450sn">
「話は、終わりだ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back05", 500, 1000, null, true);
	DeleteStand("st一成_浮浪者_通常_normal", 0, false);
	DeleteStand("stセナ_制服_武器構え_hard", 0, false);

	Stand("buセナ_制服_武器構え","angry", 250, @-150);
	FadeStand("buセナ_制服_武器構え_angry", 0, false);

	CreateSE("SE01","SE_擬音_ディそーどかまえる");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Fade("back05", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
セナはディソードを構えようとする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st一成_浮浪者_通常","normal", 200, @+150);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
それよりわずかに先んじて、波多野がぬっと立ち上がっていた。

ハラハラと２人のやり取りを見ていた梢は、いざこざを止めるべきかと迷ったが、足が痛かったからあきらめた。

悲しくはなかったが、胸の奥がシクシクと泣いていた。

波多野は、大股でセナへと足を踏み出す。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500460sn">
「……っ」

反応が遅れたセナは、迎え撃つ動作へと切り替える。
けれど踏ん張ろうとして、砂利に足を取られた。

{	Stand("buセナ_制服_武器構え","sad", 250, @-150);
	FadeStand("buセナ_制服_武器構え_sad", 300, true);
	DeleteStand("buセナ_制服_武器構え_angry", 0, true);}
姿勢を崩す。動揺が身体の動きに出た。
セナから鋭さが消えていた。

彼女は怯えていた。
父を恨むことで自分を保ってきた。

だがいざ対峙してみて、向き合うことが怖くなった。
それがなぜかは自分でもよく分からず。
少なくとも直前の父の言葉が原因なのは確かで。

{	DeleteStand("st一成_浮浪者_通常_normal", 200, true);
	CreateSE("SE01","SE_擬音_ちを蹴る");
	MusicStart("SE01", 0, 400, 0, 1000, null, false);
	Stand("bu一成_浮浪者_通常","normal", 250, @+250);
	FadeStand("bu一成_浮浪者_通常_normal", 200, true);}
波多野が、ものすごい勢いで飛びかかってくる。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500470sn">
「いや……っ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("buセナ_制服_武器構え_sad", 200, false);
	DeleteStand("bu一成_浮浪者_通常_normal", 200, true);

	SetVolume360("CH01", 0, 0, NULL);
	SetVolume("SE03", 0, 0, NULL);
	CreateTexture360("back30", 500, center, middle, "SCREEN");
	CreateSE("SE01","SE_衝撃_どさっ");
	MusicStart("SE01", 0, 400, 0, 1000, null, false);
	Shake("back30", 500, 0, 50, 0, 0, 500, Dxl3, false);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text100]
後ろへ倒れ込みながら。

その巨大なディソードを下から振り上げる。

重力も、遠心力も無視する剣。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_擬音_ディそーど_空を切る2");
	CreateSE("SE02","SE_擬音_ディそーど_人を切る");

	CreateColor("back10", 1000, 0, 0, 1280, 720, "White");
	Fade("back10", 0, 0, null, true);

	CreateMovie360("剣閃", 2000, Center, Middle, false, false, "dx/mv軌跡02.avi");
	Fade("剣閃", 0, 0, null, false);

//	Request("剣閃", Play);

	MusicStart("SE01", 0, 500, 0, 1000, null, false);
	Fade("剣閃", 500, 1000, null, true);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("剣閃", null);

	Fade("back10", 0, 1000, null, true);
	Delete("剣閃");

	CreateSE("SE01","SE_じん体_血_噴きでる");
	MusicStart("SE01", 0, 300, 0, 1000, null, false);
	Delete("back30");
	DeleteStand("bu一成_浮浪者_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text101]
その刃が、まずホームのタイルを抉り、次に父の肩を切り裂いた。
熱したナイフでバターを切るように、流麗に。

{	CreateSE("SE01","SE_衝撃_せ中を押される");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
セナは、父の手によって突き飛ばされる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("RedAll", 1200, 0, 0, 1280, 720, "RED");
	Fade("RedAll", 0, 0, null, false);
	Request("RedAll", AddRender);
	CreateSE("SE05","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	CreateTexture360("back03", 99, 0, 0, "cg/ev/ev093_01_1_セナ父殺し_a.jpg");
	Delete("back04");
	Delete("back05");
	DeleteStand("buセナ_制服_武器構え_sad", 0, true);
	Shake("back03", 500, 0, 50, 0, 0, 500, Dxl3, false);
	FadeDelete("back10", 500, true);
	Fade("RedAll", 300, 500, null, true);
	CreateSE("SE01","SE_じん体_血_噴きでる");
	MusicStart("SE01", 0, 300, 0, 1000, null, false);
	Fade("RedAll", 300, 0, null, true);
	CreateColor("back10", 1000, 0, 0, 1280, 720, "White");
	Delete("RedAll");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text102]
父の傷から鮮血が舞い。

安堵したような父の目。

セナは唇を噛み。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("back10", 100, 0, null, false);
	WaitAction("SE05", null);
//ＳＥ//銃声
	CreateSE("SE01","SE_衝撃_じゅう声");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateColor("white", 200, 0, 0, 1280, 720, "White");
	Request("white", Smoothing);
	Fade("white", 0, 0, null, false);
	Fade("white", 100, 1000, null, true);
	CreateTexture360("back03", 99, 0, 0, "cg/ev/ev093_01_1_セナ父殺し_a.jpg");
	CreateTexture360("レイヤー１", 100, 0, 0, "cg/ev/ev093_01_1_セナ父殺し_b.png");
	Delete("back10");
	Fade("white", 100, 0, null, true);
	Delete("white");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
直後に父の胸を、高速でなにかが貫いた。

父の背中側から飛来したそれは、セナの頬をかすめて消えていく。

{	CreateSE("SE05","SE_じん体_血_噴きでる");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);}
父は、肩だけでなく、胸からも血が噴き出し。
傷口から溢れた真紅の液体が、セナの頬にかかる。

――銃弾！？

突き飛ばされ、仰向けに倒れたセナは、とっさに顔を上げ、銃を撃った何者かの姿を探した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE03", 1000, 1000, 0, 1000, null, true);
	CreateTextureEX("back04", 300, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	Fade("back04", 500, 1000, null, true);
	Delete("レイヤー１");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//ＶＦ//トンネルで反響
//セナとの距離は１０メートルぐらい
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20500480su">
「おっとぉ！　ミスったッス！」

その男は、渋谷駅へと続くトンネルと、神泉駅のトンネルの境、そこだけぽっかりと空が見える踏切に立っていた。
手には、拳銃。

//ＶＦ//トンネルで反響
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20500490su">
「でも、ま、この距離にしてはいい腕だと思わないッスか？」

セナの横に、父が倒れ込む。
すでにその半身は血で染まり。

――まさか、かばった？　私を？

信じられない思いで、セナはタイルの上に広がっていく血だまりを見つめた。

//◆瀕死
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500500ha">
「言葉は、混沌だ……」

息も絶え絶えに、父がつぶやく。

//◆瀕死
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500510ha">
「お前は、素直すぎるんだ、セナ……」

//◆瀕死
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch10/20500520ha">
「そんなお前が……とても悲しく……そして、愛おしいよ……」

銃弾はセナを狙っていた。
それを、波多野はかばった。

父を殺そうとしていたはずが、その父に、命を救われた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH06", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500530sn">
「ふざ、けるな……」

セナはディソードを握る手に力を込める。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20500540su">
「まあ、別に構わないッスよね。波多野親子にはどっちも死んでもらうつもりだったんで」

ホームに、奇妙な音が響いていた。
セナは、その音がノアⅡの端末によるものだと瞬時に悟る。

――この音はいつから？

許せなかった。

父と自分との決着を邪魔した、銃を持ったあの男の存在が、セナにはどうしても許せなかった。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500550sn">
「よくも、邪魔を――」

立ち上がり、正面へと目を向けたとき。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＳＥ//赤ん坊の泣き声
	CreateSE("SE02","SE_日常_泣き声_赤ん坊");
	MusicStart("SE02", 500, 1000, 0, 1000, null, false);


	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500560sn">
「……！」

赤ん坊の泣き声が、薄暗いホームに響いた。
セナは、自らの手に違和感を覚える。
なぜか、剣の代わりに――

腐り、干からびた、赤ん坊を抱いていた。

//◆怯え
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500570sn">
「ひっ……」

{	SetVolume("SE02", 500, 0, NULL);
	CreateSE("SE05","SE_衝撃_落下激突");
	MusicStart("SE05", 500, 1000, 0, 1000, null, false);}
反射的に、放り捨ててしまう。

けれどすぐに、その赤ん坊が、<?>
{	CreateColor("light", 500, 0, 0, 1280, 720, "White");
	Request("light", Smoothing);
	Fade("light", 0, 0, null, false);
	Fade("light", 100, 1000, null, true);
	CreateTexture360("back10", 300, 0, 0, "cg/ev/ev073_01_1_赤子を抱く母_a.jpg");
	Fade("light", 300, 0, null, true);
	CreateSE("SE05","SE_じん体_心臓_鼓動");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	Wait(500);
	Fade("light", 0, 1000, null, true);
	Delete("back10");
	Fade("light", 300, 0, null, true);}
かつて一度だけ見た、自分の妹であることに気付く。

母にむしゃむしゃと食べられてしまった、名前すら知らない妹。

目の前にある赤ん坊にも、かじられたかのような大きな傷がある。干からびた肌の間から覗く、ピンク色の肉片がこびりついた、白い骨。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500580sn">
「う……」

セナは――<k>
また動揺する。
目が離せなくなる。

妹を投げ捨て、気持ち悪いと思ってしまった自分が許せなくなる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("light", 100, 1000, null, true);
	CreateTexture360("back10", 300, 0, 0, "cg/ev/ev063_02_1_マジックミラー波多野_a.jpg");
	Fade("light", 300, 0, null, true);
	CreateSE("SE05","SE_じん体_心臓_鼓動");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
あのときもそうだった。
母の最期を見せられたとき。
母の、狂気に支配され死んでいく姿。

その母が抱いていた、母に食いちぎられた、妹の無惨な遺体。

それを見せられて。
悲しさや、恐ろしさ以上に。
気持ち悪さを、セナは感じていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("light", 0, 1000, null, true);
	Delete("back10");
	Fade("light", 300, 0, null, true);
	Delete("light");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602011]
そのことが、彼女自身の胸の中で罪悪感として残り。
父を恨むことでその感情から目をそらしていた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500590sn">
「私は……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20500600sn">
「私、は……っ」

これが、妄想による攻撃だと頭の片隅で理解はしていても。

心の奥に封印していた感情を呼び覚まされ、金縛りに遭ったように身動きが取れなくなっていた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH06", 1000, 0, NULL);
	SetVolume("SE03", 1000, 0, NULL);

	ClearAll(1000);

	Wait(500);

//おがみ：この部分どうしたいのだろうか
	if(Platform()!=100){
//		DrawEffect("BreakBG", 1000, "Split", 0, 1000, null);
//		WaitAction("BreakBG", null);
	}
//	Delete("BreakBG");

	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE03", 1000, 1000, 0, 1000, null, true);

	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	Fade("back04", 500, 1000, null, true);

	CreateColor("back10", 200, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);

	CreateColor("back11", 500, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 0, null, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
それは、セナだけでなく梢も同様だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",0,1000,true);


	Fade("back11", 100, 1000, null, true);
	Fade("back10", 0, 1000, null, false);
	Stand("bu梢_制服_正面","sigh", 300, @0);
	FadeStand("bu梢_制服_正面_sigh", 0, false);
	Fade("back11", 300, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
へたり込んでいた梢の目の前には、大きな鏡が現れ、そこに映る、足を血で汚した自分が、問いかけてきていた。

//ＶＦ//妄想セリフ
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500610ko">
「お前は誰？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("back11", 100, 1000, null, true);
	Fade("back10", 0, 0, null, false);
	DeleteStand("bu梢_制服_正面_sigh", 0, false);
	Stand("bu梢_制服_正面","sad", 200, @0);
	FadeStand("bu梢_制服_正面_sad", 0, false);
	Fade("back11", 300, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602012]
梢は恐ろしさで凍り付く。
目から大粒の涙を溢れさせた。

忘れたかった傷。思い出したくなかった過去。

心からも、腐敗した涙が漏れ出てくる。
逃げ出したくなる。
鏡を見たくなくて、顔をそむけたくなる。

それなのに、意思に反して身体は動かず。

そして鏡の向こうの自分は、泣いていなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("back11", 100, 1000, null, true);
	Fade("back10", 0, 1000, null, false);
	Stand("bu梢_制服_正面","sigh", 300, @0);
	FadeStand("bu梢_制服_正面_sigh", 0, true);
	Fade("back11", 300, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603012]
//ＶＦ//妄想セリフ
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500620ko">
「お前は誰？」

//ＶＦ//妄想セリフ
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500630ko">
「お前は誰？　お前は誰？　お前は誰？　お前は誰？　お前は誰？
お前は誰？　お前は誰？　お前は誰？　お前は誰？　お前は誰？
お前は誰？　お前は誰？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("back11", 100, 1000, null, true);
	Fade("back10", 0, 0, null, false);
	DeleteStand("bu梢_制服_正面_sigh", 0, false);
	Fade("back11", 300, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604012]
//ＶＦ
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500640ko">
「私は誰？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("back10", 500, 1000, null, false);

	CreateColor("back12", 1000, 0, 0, 1280, 720, "Black");
	Fade("back12", 0, 0, null, false);

	Stand("bu梢_制服_拒絶","shout", 300, @-50);
	DeleteStand("bu梢_制服_正面_sad", 500, false);
	FadeStand("bu梢_制服_拒絶_shout", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text200]
//ＶＦ//２人の梢が同時に喋っているようにしたいです
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500650ko">
「私は誰？　私は誰？　私は誰？　私は誰？　私は誰？　私は誰？
私は誰？　私は誰？　私は誰？　私は誰？　私は誰？　私は誰？
私は誰？　私は誰？　私は誰？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateColor("BlackAll", 400, 0, 0, 1280, 720, "Black");
	Fade("BlackAll", 0, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
{#TIPS_ゲシュタルト崩壊 = true;$TIPS_on_ゲシュタルト崩壊 = true;}
<FONT incolor="#88abda" outcolor="BLACK">ゲシュタルト崩壊</FONT>に陥る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//▼TIPS：解除：ゲシュタルト崩壊
	$TIPS_on_ゲシュタルト崩壊 = false;

	Fade("back12", 100, 1000, null, true);
	Fade("BlackAll", 0, 200, null, false);
	DeleteStand("bu梢_制服_拒絶_shout", 0, false);
	Stand("st梢_制服_正面","sigh", 500, @+260);
	FadeStand("st梢_制服_正面_sigh", 0, false);
	Stand("hu梢_制服_正面","sigh", 300, @-440);
	Move("hu梢_制服_正面_sigh", 0, @0, @440, Axl1, true);
	FadeStand("hu梢_制服_正面_sigh", 0, true);
	Fade("back12", 100, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
かつて言葉を失ったときと同じように。
かつて心が壊れたときと同じように。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("back12", 100, 1000, null, true);
	Stand("st梢_制服_正面","sigh", 500, @-230);
	FadeStand("st梢_制服_正面_sigh", 0, false);
	Stand("hu梢_制服_正面","sigh", 300, @+350);
	Move("hu梢_制服_正面_sigh", 0, @0, @440, Axl1, true);
	FadeStand("hu梢_制服_正面_sigh", 0, true);
	Fade("back12", 100, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602013]
鏡の奥で、自分に問いかけてくる自分が、自分に見えなくなる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("back12", 100, 1000, null, true);
	Stand("st梢_制服_正面","sigh", 500, @+260);
	FadeStand("st梢_制服_正面_sigh", 0, false);
	Stand("hu梢_制服_正面","sigh", 300, @-440);
	Move("hu梢_制服_正面_sigh", 0, @0, @440, Axl1, true);
	FadeStand("hu梢_制服_正面_sigh", 0, true);
	Fade("back12", 100, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603013]
自分の声に、確信が持てない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("back12", 100, 1000, null, true);
	Stand("st梢_制服_正面","sigh", 500, @-230);
	FadeStand("st梢_制服_正面_sigh", 0, false);
	Stand("hu梢_制服_正面","sigh", 300, @+350);
	Move("hu梢_制服_正面_sigh", 0, @0, @440, Axl1, true);
	FadeStand("hu梢_制服_正面_sigh", 0, true);
	Fade("back12", 100, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604013]
自分の髪型に、確信が持てない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("back12", 100, 1000, null, true);
	Stand("st梢_制服_正面","sigh", 500, @+260);
	FadeStand("st梢_制服_正面_sigh", 0, false);
	Stand("hu梢_制服_正面","sigh", 300, @-440);
	Move("hu梢_制服_正面_sigh", 0, @0, @440, Axl1, true);
	FadeStand("hu梢_制服_正面_sigh", 0, true);
	Fade("back12", 100, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605013]
自分の鼻の形に、確信が持てない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("back12", 100, 1000, null, true);
	Stand("st梢_制服_正面","sigh", 500, @-230);
	FadeStand("st梢_制服_正面_sigh", 0, false);
	Stand("hu梢_制服_正面","sigh", 300, @+350);
	Move("hu梢_制服_正面_sigh", 0, @0, @440, Axl1, true);
	FadeStand("hu梢_制服_正面_sigh", 0, true);
	Fade("back12", 100, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3606013]
自分の瞳の色に、確信が持てない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("back12", 100, 1000, null, true);
	Stand("st梢_制服_正面","sigh", 500, @+260);
	FadeStand("st梢_制服_正面_sigh", 0, false);
	Stand("hu梢_制服_正面","sigh", 300, @-440);
	Move("hu梢_制服_正面_sigh", 0, @0, @440, Axl1, true);
	FadeStand("hu梢_制服_正面_sigh", 0, true);
	Fade("back12", 100, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3607013]
自分の唇の厚さに、確信が持てない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("back12", 100, 1000, null, true);
	Stand("st梢_制服_正面","sigh", 500, @-230);
	FadeStand("st梢_制服_正面_sigh", 0, false);
	Stand("hu梢_制服_正面","sigh", 300, @+350);
	Move("hu梢_制服_正面_sigh", 0, @0, @440, Axl1, true);
	FadeStand("hu梢_制服_正面_sigh", 0, true);
	Fade("back12", 100, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3608013]
自分の形に、確信が持てない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("back12", 100, 1000, null, true);
	Stand("st梢_制服_正面","sigh", 500, @+260);
	FadeStand("st梢_制服_正面_sigh", 0, false);
	Stand("hu梢_制服_正面","sigh", 300, @-440);
	Move("hu梢_制服_正面_sigh", 0, @0, @440, Axl1, true);
	FadeStand("hu梢_制服_正面_sigh", 0, true);
	Fade("back12", 100, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3609013]
自分の顔に、確信が持てない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTexture360("Blur", 1000, center, middle, "SCREEN");
	DeleteStand("st梢_制服_正面_sigh", 0, false);
	DeleteStand("hu梢_制服_正面_sigh", 0, true);
	Stand("hu梢_制服_正面","sigh", 500, @-440);
	Move("hu梢_制服_正面_sigh", 0, @0, @440, Axl1, true);
	Stand("st梢_制服_正面","sigh", 300, @+260);
	FadeStand("st梢_制服_正面_sigh", 0, false);
	FadeStand("hu梢_制服_正面_sigh", 0, true);

	Fade("Blur", 500, 0, null, true);
	Delete("Blur");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text201]
//ＶＦ
//◆心の声
//◆涙声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500660ko">
「私は……誰？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_正面_sigh", 500, false);
	DeleteStand("hu梢_制服_正面_sigh", 500, true);

	if(#下着パッチ==true)
	{
		CreateTextureEX("鏡梢１", 300, Center, Middle, "ex/st/st梢_制服_正面_下着_sigh.png");
	}
	else
	{
		CreateTextureEX("鏡梢１", 300, Center, Middle, "cg/st/st梢_制服_正面_sigh.png");
	}

	Move("鏡梢１", 0, @-216, 0, Axl1, false);
	Fade("鏡梢１", 500, 1000, null, true);

	if(#下着パッチ==true)
	{
		CreateTextureEX("鏡梢４", 300, Center, Middle, "ex/st/st梢_制服_正面_下着_sigh.png");
	}
	else
	{
		CreateTextureEX("鏡梢４", 300, Center, Middle, "cg/st/st梢_制服_正面_sigh.png");
	}

	Move("鏡梢４", 0, @+216, 0, Axl1, false);
	Fade("鏡梢４", 500, 1000, null, true);

	if(#下着パッチ==true)
	{
		CreateTextureEX("鏡梢２", 300, Center, Middle, "ex/st/st梢_制服_正面_下着_sigh.png");
	}
	else
	{
		CreateTextureEX("鏡梢２", 300, Center, Middle, "cg/st/st梢_制服_正面_sigh.png");
	}

	Move("鏡梢２", 0, @-80, 0, Axl1, false);
	Fade("鏡梢２", 500, 1000, null, true);

	if(#下着パッチ==true)
	{
		CreateTextureEX("鏡梢３", 300, Center, Middle, "ex/st/st梢_制服_正面_下着_sigh.png");
	}
	else
	{
		CreateTextureEX("鏡梢３", 300, Center, Middle, "cg/st/st梢_制服_正面_sigh.png");
	}

	Move("鏡梢３", 0, @+80, 0, Axl1, false);
	Fade("鏡梢３", 500, 1000, null, true);

	SetVolume360("CH01", 200, 0, NULL);

	CreateTexture360("BreakBG", 300, center, middle, "SCREEN");
	Delete("鏡梢*");
	Delete("BlackAll");
	Delete("back10");
	Delete("back11");
	Delete("back12");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//ＶＦ
//◆心の声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20500670ta">
「君は、こずぴぃだよ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面","sad", 500, @0);
	FadeStand("bu梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
//※以下のセリフのみリアルの声
//【梢】
<voice name="梢" class="梢" src="voice/ch10/20500680ko">
「……！」

//※以上のセリフのみリアルの声
無数に分裂しかかっていた、鏡の中の自分の姿が。
突然飛び込んできたその声によって、増殖を停止した。

//ＶＦ
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500690ko">
「私は……こずぴぃ……」

{	Stand("bu梢_制服_通常","normal", 500, @0);
	DeleteStand("bu梢_制服_正面_sad", 500, false);
	FadeStand("bu梢_制服_通常_normal", 500, true);}
//ＶＦ
//◆心の声
//◆※ここはあえて「私」
//【梢】
<voice name="梢" class="こずえ" src="voice/ch10/20500700ko">
「私は、こずぴぃ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE03", 500, 0, NULL);

	CreateColor("back10", 200, 0, 0, 1280, 720, "Black");
	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");


//ＳＥ//鏡が割れる
	CreateSE("SE02","SE_衝撃_ガラス_割れる_あやせディそーど");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//▼べー：演出：DrawEffect使用不可のため一時的にコメントアウト致します。
/*
	if(Platform()!=100){
		DrawEffect("BreakBG", 1000, "Split", 0, 1000, null);
		WaitAction("BreakBG", null);
	}
	Delete("BreakBG");
*/
	Fade("back10", 500, 0, null, true);
	Delete("back10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
アイデンティティが再確定される。
梢は我に返り。

目の前にそびえ立っていた巨大な鏡は砕け散った。

梢は、自分を救った声の主を探す。

改札へと続く通路。
そこに“彼”の姿を認めて。

失ったはずの――現実の――声で、
梢は“彼”の名を叫んでいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：シナリオ修正　1222
//※以下のセリフのみリアルの声
//【梢】
//<voice name="梢" class="梢" src="voice/ch10/20500710ko">
//「……拓巳しゃん！」

//※以上のセリフのみリアルの声
//失ったはずの――現実の――声で、
//梢はその名を叫んでいた。


	ClearAll(1000);
	Wait(1000);


//～～Ｆ・Ｏ

//■インターミッション５２ａ終了

}