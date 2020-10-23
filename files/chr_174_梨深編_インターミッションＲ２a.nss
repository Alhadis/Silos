//<continuation number="980">

chapter main
{

	$PreGameName = "boot_梨深ルート";

	if($GameStart != 1)
	{
		$GameName = "chr_174_梨深編_インターミッションＲ２a";
		$GameContiune = 1;
		$梨深ルート=true;
		$RouteON=true;
		Reset();
	}

	chr_174_梨深編_インターミッションＲ２a();
}


function chr_174_梨深編_インターミッションＲ２a()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//■インターミッションＲ２
//※梨深視点

//◆以下、インターミッションＲ２はすべて回想です
//◆ボイスエフェクト、画面エフェクトも回想で
//アイキャッチ
	IntermissionIn();

	DeleteAll();

	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg209_01_5_曇り空_a.jpg");
	CreateSE("SE01","SE_自然_雨_通常_LOOP");

	CreateMovie360("雨２", 500, Center, Middle, true, false, "dx/mv雨02.avi");	
	Request("雨２", AddRender);
	Fade("雨２", 0, 1000, null, true);

	IntermissionIn2();

//ＢＧ//雨が降る曇り空
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

	Wait(1000);
//◆モノローグ
//ＶＦ//回想
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100010ri">
「あたしの最初の記憶は、落ちてくる雨と、空を覆い隠したどんよりとした雲」

それは、いつのことだろう。
あたしがまだ小学生だった頃。
今から６年ぐらい前？

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

首が吹き飛んだお父さんと、鋼鉄に挟まれて潰れているお母さんが、すぐ近くに見えた。

ついさっきまで、家族で旅行に出かけることが嬉しくて、車の中ではしゃいでいたけど。

大きなトラックが目の前に迫ってきて、気が付けばあたしが乗っていた車はぐしゃぐしゃになっていた。

身体が千切れそうなくらいに痛くて、意識はぼんやりしていて。
耳には、車の激しいブレーキ音が延々とリフレインされていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, null);

//～～Ｆ・Ｏ
	ClearAll(1000);
	Wait(1500);

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

//ＢＧ//手術台上
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");

	CreateSE("SE02","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

	BGMPlay360("CH16",0,1000,true);

	Fade("Black", 1000, 0, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆モノローグ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100020ri">
「次の記憶は、手術台の上から見たまぶしい光と、男の人の声」

それは、いつのことだろう。
事故で両親を失ってすぐ。
今から５年ぐらい前？

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100030nr">
「――担当医に、剣のようなものが見えた、と言ったそうですね」

//ＶＦ//回想とノイズ
//◆↓『※△＃＋％』部分にのみノイズのＳＥを入れて聞こえないようにしてください
//◆台本用。名前は適当。「ひしい・かえ」
//◆「聞こえていますか？　菱井香絵さん」
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100040nr">
「聞こえていますか？　※△＃＋％さん」

名前を呼ばれたような気がした。
けれど、今はもう、その名前を思い出すことはできない。
すでに“死んだ名前”だから。

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100050nr">
「まだ傷が癒えていないようですね。ご両親が目の前で亡くなったのもショックでしたか」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100060nr">
「では、聞いているだけで結構」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100070nr">
「私は、このＡＨ東京総合病院の名誉院長でありスポンサーでもある、野呂瀬と言います」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100080nr">
「君はギガロマニアックスである可能性があります」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100090nr">
「ぜひその力に覚醒していただきたい」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100100nr">
「幸いにも君は天涯孤独になったので、親族などの煩わしい連中も湧いてはこない」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100110nr">
「というわけで、君は今日をもって死亡扱いとなりました。以後、この地下室で過ごしてもらいます」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100120nr">
「なんの心配もいりません。ここは私しか知らない部屋ですから」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100130nr">
「頑張って、目覚めて下さい。期待していますよ」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100140nr">
「君は実験台です。力を持つ非覚醒者を目覚めさせるためにはなにが必要か、いろいろと試させてもらいます。明日からね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//ＳＥ//靴音が遠ざかっていく
//ＳＥ//重々しい扉が閉まる音
//ＳＥ//扉の鍵が閉まる
	CreateSE("SE03","SE_じん体_動作_足_足音遠ざかる");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);
	SetVolume("SE03", 2500, 0, null);
	Wait(2000);

	CreateSE("SE04","SE_日常_拷問部屋_閉まる");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE04", null);

	CreateSE("SE05","SE_日常_拷問部屋_施錠");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
あたしはじっと、天井からつり下がっている、照明の光の奥を見つめ続けていた。
暗いのは、嫌いだったから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(1500);
	Wait(1000);

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");

//ＢＧ//手術台上
	CreateSE("SE02","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

	Fade("Black", 1500, 0, null, true);

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "RED");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	Wait(500);
	CreateSE("SE06","SE_擬音_ムチ");
	CreateSE("SE07","SE_擬音_ムチ");
	CreateSE("SE08","SE_擬音_ムチ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆モノローグ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100150ri">
「次の記憶も、手術台の上から見たまぶしい光と、男の人の声」

それは、いつのことだろう。
地下室に閉じ込められて、日付の感覚は失われた。

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//◆/ＳＥ/鞭で叩く
{	MusicStart("SE06", 0, 500, 0, 1000, null, false);
	Shake("back05", 300, 0, 5, 0, 0, 500, null, false);
	Fade("攻撃フラッシュ", 100, 1000, null, true);
	Fade("攻撃フラッシュ", 300, 0, null, true);}
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100160ri">
「っ……！」

//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//◆/ＳＥ/鞭で叩く
{	MusicStart("SE07", 0, 500, 0, 1000, null, false);
	Shake("back05", 300, 0, 5, 0, 0, 500, null, false);
	Fade("攻撃フラッシュ", 100, 1000, null, true);
	Fade("攻撃フラッシュ", 300, 0, null, true);}
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100170ri">
「ひぐっ……！」

//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//◆/ＳＥ/鞭で叩く
{	MusicStart("SE08", 0, 500, 0, 1000, null, false);
	Shake("back05", 300, 0, 5, 0, 0, 500, null, false);
	Fade("攻撃フラッシュ", 100, 1000, null, true);
	Fade("攻撃フラッシュ", 300, 0, null, true);}
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100180ri">
「がっ……！」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100190nr">
「実に我慢強いお嬢さんですね、君は」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100200nr">
「背中の皮膚がただれて、血が出ているのに、なぜ耐えようとするのです？」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100210nr">
「早く目覚めれば、楽になると言うのに」

//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//◆/ＳＥ/鞭で叩く
{	CreateSE("SE06","SE_擬音_ムチ");
	MusicStart("SE06", 0, 500, 0, 1000, null, false);
	Shake("back05", 300, 0, 5, 0, 0, 500, null, false);
	Fade("攻撃フラッシュ", 100, 1000, null, true);
	Fade("攻撃フラッシュ", 300, 0, null, true);}
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100220ri">
「うっ……！」

//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//◆/ＳＥ/鞭で叩く
{	CreateSE("SE06","SE_擬音_ムチ");
	MusicStart("SE06", 0, 500, 0, 1000, null, false);
	Shake("back05", 300, 0, 5, 0, 0, 500, null, false);
	Fade("攻撃フラッシュ", 100, 1000, null, true);
	Fade("攻撃フラッシュ", 500, 0, null, true);}
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100230ri">
「かはっ……！」

あたしはじっと、天井からつり下がっている、照明の光の奥を見つめ続けていた。

そうすることで、視界が麻痺して、他のなにも目に入れなくて済んだから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//ＳＥ//靴音が遠ざかっていく
//ＳＥ//重々しい扉が閉まる音
	CreateSE("SE03","SE_じん体_動作_足_足音遠ざかる");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);
	SetVolume("SE03", 2500, 0, null);
	Wait(1500);
	CreateSE("SE04","SE_日常_拷問部屋_閉まる");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE04", null);

//～～Ｆ・Ｏ
	ClearAll(1000);
	Wait(1000);

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

//ＢＧ//手術台上
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "RED");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	CreateSE("SE02","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

	Fade("Black", 1000, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆モノローグ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100150ri">
「次の記憶も、手術台の上から見たまぶしい光と、男の人の声」

それは、いつのことだろう。
地下室に閉じ込められて、日付の感覚は失われた。

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100240ri">
「う、く……う……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//焼いたばかりのソーセージ（腸詰め）を割ったときの音みたいな……
//◆/ＳＥ/プツッ、と皮膚を切る音
//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
	CreateSE("SE07","SE_擬音_ないふ_皮膚切");
	MusicStart("SE07", 0, 500, 0, 1000, null, false);

	Fade("攻撃フラッシュ", 0, 1000, null, true);
	Wait(50);
	Fade("攻撃フラッシュ", 0, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100250nr">
「痛いですか？　皮膚の表面を切るだけですよ。血はたくさん出ますが、死ぬほどではありません」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100260nr">
「３日も放置すれば化膿してかゆみがひどいことになるでしょう。そこからが今回の実験の本番です」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100270nr">
「安心してください。私は医者なのでね、メスの扱いには慣れています」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100280nr">
「そうですね、１０カ所ほど切り刻みましょうか」

//◆/ＳＥ/プツッ、と皮膚を切る音
//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
{	CreateSE("SE07","SE_擬音_ないふ_皮膚切");
	MusicStart("SE07", 0, 500, 0, 1000, null, false);
	Fade("攻撃フラッシュ", 0, 1000, null, true);
	Wait(50);
	Fade("攻撃フラッシュ", 0, 0, null, true);}
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100290ri">
「ぁっ……！」

あたしはじっと、天井からつり下がっている、照明の光の奥を見つめ続けていた。

そうすることで、視界が麻痺して、他のなにも目に入れなくて済んだから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(1000);
	Wait(1000);

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");
//おがみ：SetShadeぼかし画像差し替え
	CreateTextureEX("もや効果", 500, 0, 0, "cg/bg/bg191_02_4_手術台上_a.jpg");
//	SetShade("もや効果", NOMORE);

	CreateSE("SE02","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

	Fade("Black", 1500, 0, null, true);

	Wait(1000);

//おがみ：function　move　使えないのか？
//	FadeF4("もや効果", 2000, 1000, 1000, 0, 0, Dxl3, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//ＢＧ//手術台上
//◆モノローグ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100150ri">
「次の記憶も、手術台の上から見たまぶしい光と、男の人の声」

それは、いつのことだろう。
地下室に閉じ込められて、日付の感覚は失われた。

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Shake("もや効果", 2000, 2, 2, 0, 0, 500, null, false);
	Fade("もや効果", 500, 700, null, true);
	Fade("もや効果", 1000, 0, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100300ri">
「あ、あああああ、はあ、はあ、かゆい、
かゆぃぃぃ、かゆいよぉぉぉぉ、はあ、ああ、ああああ……」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100310nr">
「そうですか。かゆいですか。しかし引っ掻くことは許しませんよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Shake("もや効果", 2000, 2, 2, 0, 0, 500, null, false);
	Fade("もや効果", 500, 700, null, true);
	Fade("もや効果", 1000, 0, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100320ri">
「う、ぁ、あああああ、かゆ、か……あああ、はあ、はあ、かゆぃ……」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100330nr">
「人というのは実に不思議なものでしてね。痛みは意外と我慢することができるのですが、かゆみはそうでもないのです」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100340nr">
「痛みよりもかゆみの方が、精神をおかしくさせるには効果的かもしれませんね」

//◆途中で急に言葉を切る
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100350ri">
「はあっ、はあっ、あ、うう、かゆいかゆいかゆいかゆいかゆいか――」

//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100360ri">
「…………」

あたしはじっと、天井からつり下がっている、照明の光の奥を見つめ続けていた。

そうすることで、視界が麻痺して、他のなにも目に入れなくて済んだから。

そして、あたしはあたしを殺した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(1500);
	Wait(1000);

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

//ＢＧ//手術台上
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");
	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "RED");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	CreateSE("SE02","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

	Fade("Black", 1500, 0, null, true);

	CreateSE("SE08","SE_擬音_はんまー打ちつけ");
	CreateSE("SE09","SE_擬音_はんまー打ちつけ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆モノローグ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100150ri">
「次の記憶も、手術台の上から見たまぶしい光と、男の人の声」

それは、いつのことだろう。
地下室に閉じ込められて、日付の感覚は失われた。

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//◆/ＳＥ/ドン！と大きなハンマーを鉄製のテーブルに打ち付ける音
{	Fade("攻撃フラッシュ", 0, 1000, null, true);
	MusicStart("SE08", 0, 1000, 0, 1000, null, false);
	Shake("back05", 600, 5, 10, 0, 0, 500, null, false);
	Wait(150);
	Fade("攻撃フラッシュ", 0, 0, null, false);}
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100370ri">
「はか……っ！」

//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//◆/ＳＥ/ドン！と大きなハンマーを鉄製のテーブルに打ち付ける音
{	Fade("攻撃フラッシュ", 0, 1000, null, true);
	MusicStart("SE09", 0, 1000, 0, 1000, null, false);
	Shake("back05", 600, 7, 11, 0, 0, 500, null, false);
	Wait(150);
	Fade("攻撃フラッシュ", 0, 0, null, false);}
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100380ri">
「あ、ぎ……！」

//ＶＦ//回想
//◆左上腕＝ひだりじょうわん
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100390nr">
「ふむ。左上腕はこれで粉砕骨折、というところですか」

//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100400ri">
「う、ぁ、あぁぁぁっ……うぁぁぁ……っ！」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100410nr">
「まだ、目覚めないとは。いったい、なにが足りないのでしょうね」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100420nr">
「しょうがない。今日の実験はこれぐらいにしておきましょう。ゆっくり休んでください」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//靴音が遠ざかっていく
//ＳＥ//重々しい扉が閉まる音
//ＳＥ//扉の鍵が閉まる
	CreateSE("SE03","SE_じん体_動作_足_足音遠ざかる");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);
	SetVolume("SE03", 2500, 0, null);
	Wait(2000);

	CreateSE("SE04","SE_日常_拷問部屋_閉まる");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE04", null);

	CreateSE("SE05","SE_日常_拷問部屋_施錠");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
あたしはじっと、天井からつり下がっている、照明の光の奥を見つめ続けていた。

そうすることで、視界が麻痺して、他のなにも目に入れなくて済んだから。
そして、あたしは、あたしを殺した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(1000);
	Wait(500);

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

//ＢＧ//手術台上
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");
	CreateTextureEX("もや効果", 500, 0, 0, "cg/bg/bg191_02_4_手術台上_a.jpg");
	Fade("もや効果", 0, 0, null, true);
//	SetShade("もや効果", NOMORE);

	CreateSE("SE02","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

	Fade("Black", 1500, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆モノローグ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100150ri">
「次の記憶も、手術台の上から見たまぶしい光と、男の人の声」

それは、いつのことだろう。
地下室に閉じ込められて、日付の感覚は失われた。

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("もや効果", 2000, 1000, null, false);

	Wait(500);

//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//◆/ＳＥ/水が口に注がれる
	CreateSE("SE09","SE_擬音_水攻め_LOOP");
	MusicStart("SE09", 0, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100430ri">
「がっ、はっ……げっ……」

{	SetVolume360("SE09", 500, 0, null);
	Fade("もや効果", 300, 0, null, true);}
//ＳＥ終了
//	SetVolume("SE09", 500, 0, NULL);
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100440ri">
「かはぁっ、はぁっ、はぁっ……
げほっ、がっはっ、はぁっ……はぁっ……」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100450nr">
{#TIPS_ウォーターボーディング = true;$TIPS_on_ウォーターボーディング = true;}「<FONT incolor="#88abda" outcolor="BLACK">ウォーターボーディング</FONT>はアメリカＣＩＡがつい最近まで拷問方法として用いていた、最も安易で最も効果的で、最も苦しませることができる技術です」

{$TIPS_on_ウォーターボーディング = false;}
//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100460nr">
「いわゆる水責めというものですね。わずかな水の量だけで、あなたに溺死した錯覚を味わわせることができるのですよ」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100470nr">
「２１世紀において、いまだにこのような古典的な拷問を行っている」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100480nr">
「実に面白いではありませんか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//◆/ＳＥ/水が口に注がれる
//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
//◆/ＳＥ/水が口に注がれる
	CreateSE("SE09","SE_擬音_水攻め_LOOP");
	MusicStart("SE09", 0, 500, 0, 1000, null, true);

	Fade("もや効果", 3000, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100490ri">
「うっ、うぶっ……ごっ……」

あたしはじっと、天井からつり下がっている、照明の光の奥を見つめ続けていた。

そうすることで、視界が麻痺して、他のなにも目に入れなくて済んだから。

そして、あたしはあたしを殺した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
//▼べー：ＳＥ：ダミー入りましたので解放。適宜調整
	SetVolume("SE09", 1000, 0, NULL);

	ClearAll(1500);
	Wait(1000);

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

//ＢＧ//手術台上
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");

	CreateSE("SE02","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);


	Fade("Black", 1500, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//◆モノローグ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100150ri">
「次の記憶も、手術台の上から見たまぶしい光と、男の人の声」

それは、いつのことだろう。
地下室に閉じ込められて、日付の感覚は失われた。

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

//画面エフェクト//妄想エフェクト
//画面ゆらゆらしている
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100500ri">
「ぅ……う……」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100510nr">
「私は麻酔を扱うのは、これが初めてなのですが」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100520nr">
「どうやらうまくいったようですね」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100530nr">
「気分はいかがですか？　君は今、首から下が麻痺している状態です」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100540nr">
「自分の身体を思うままに動かせないというのは、ストレスのたまることだと思いませんか？」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100550nr">
「とりあえず、その状態で１年ほど過ごしてみましょう」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100560nr">
「一日に一度、点滴で栄養は与えますから、心配はいりません」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100570nr">
「では、よいお年を」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//靴音が遠ざかっていく
//ＳＥ//重々しい扉が閉まる音
//ＳＥ//扉の鍵が閉まる
	CreateSE("SE03","SE_じん体_動作_足_足音遠ざかる");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);
	SetVolume("SE03", 2500, 0, null);
	SetVolume("SE03", 2500, 0, null);
	Wait(2000);

	CreateSE("SE04","SE_日常_拷問部屋_閉まる");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE04", null);

	CreateSE("SE05","SE_日常_拷問部屋_施錠");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
あたしはじっと、天井からつり下がっている、照明の光の奥を見つめ続けていた。

そうすることで、視界が麻痺して、他のなにも目に入れなくて済んだから。

その白い光の中に、翼のようなものがチラチラと見えたような気がした。

そして、あたしはあたしを殺した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(1500);
	Wait(1000);

	Delete("レンズ*");

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

//ＢＧ//手術台上
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");

	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

	CreateSE("SE02","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

	Fade("Black", 1500, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//◆モノローグ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100580ri">
「次の記憶は、手術台の上から見たまぶしい光だけ」

それは、いつのことだろう。
地下室に閉じ込められて、日付の感覚は失われた。

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面エフェクト//妄想エフェクト
//画面ゆらゆらしている

	Fade("Black", 1000, 500, Dxl2, true);
	Fade("Black", 1000, 0, Axl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100590ri">
「ぁぁ……」

どれだけ呼びかけても、誰も来なくて。
なにも動かず。なにも動かせず。
指の一本さえ、ピクリともしなくて。

あたしはぼんやりと、天井からつり下がっている、照明の光の奥を見つめ続けていた。

他に、やることがなかった。

その白い光の中に、羽根のような影がいくつも、ユラユラと舞っているのが見えたような気がした。

そして、あたしはあたしを殺した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(1500);
	Wait(1000);

	Delete("レンズ*");

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

//ＢＧ//手術台上
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");

	CreateSE("SE02","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

	Fade("Black", 1500, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//◆モノローグ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100600ri">
「次の記憶も、手術台の上から見たまぶしい光だけ」

それは、いつのことだろう。
地下室に閉じ込められて、日付の感覚は失われた。

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面エフェクト//妄想エフェクト
//画面ゆらゆらしている

	Fade("Black", 1000, 500, Dxl2, true);
	Fade("Black", 1000, 0, Axl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//以下、丸々コピペ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100590ri">
「ぁぁ……」

どれだけ呼びかけても、誰も来なくて。
なにも動かず。なにも動かせず。
指の一本さえ、ピクリともしなくて。

あたしはぼんやりと、天井からつり下がっている、照明の光の奥を見つめ続けていた。

他に、やることがなかった。

その白い光の中に、羽根のような影がいくつも、ユラユラと舞っているのが見えたような気がした。

そして、あたしはあたしを殺した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(1000);
	Wait(500);

	CreateColor("Black", 200, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

//ＢＧ//手術台上
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");

	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

	CreateSE("SE02","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE02", 500, 300, 0, 1000, null, true);

	Fade("Black", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//◆モノローグ
//ＶＦ//回想
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02100020ri">
「次の記憶は、手術台の上から見たまぶしい光と、男の人の声」

それは、いつのことだろう。
地下室に閉じ込められて、日付の感覚は失われた。

……いつだったかなんて、どうでもいいこと。
あたしの記憶は、連続していないから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面エフェクト//妄想エフェクト
//画面ゆらゆらしている

	Fade("Black", 1000, 500, Dxl2, true);
	Fade("Black", 1000, 0, Axl1, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100610nr">
「実に醜い姿ですね」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100620nr">
「１年もの間、そこで横たわっていた気分はどうですか？」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100630nr">
「己の糞便にまみれ、骨と皮だけの姿となり、尊厳を奪われた気分はどうだったのかと、聞いているのです」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100640nr">
「ですが安心してください。殺しはしませんよ」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100650nr">
「この実験が始まって、そろそろ３年になりますか」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100660nr">
「私はね、君のことが愛おしくてたまらない。かけがえのない存在ですよ、君は」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100670nr">
「ギガロマニアックスを強制的に覚醒させることは、とても難しく、時間がかかる」

//ＶＦ//回想
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100680nr">
「ですが、君には早く目覚めてもらいたいのです」

//ＶＦ//回想とノイズ
//◆↓『＄＠＊＄＆』という部分にのみＳＥでノイズを入れて聞こえないようにしてください
//◆「期待していますよ、菱井香絵さん」
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02100690nr">
「期待していますよ、＄＠＊＄＆さん」

あたしはじっと、天井からつり下がっている、照明の光の奥を見つめ続けていた。

そうすることで、視界が麻痺して、他のなにも目に入れなくて済んだから。

その白い光の中に、舞い散る羽根と、一対の翼が見えたような気がした。

そして、あたしはあたしを殺した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//白
	SetVolume("SE02", 1000, 0, NULL);
	CreateColor("White", 1100, 0, 0, 1280, 720, "White");
	Request("white", AddRender);
	Fade("White", 0, 0, null, true);
	Fade("White", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602012]
今のあたしは、何番目のあたし？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	SetVolume360("CH*", 2000, 0, null);

	ClearAll(2000);
	Wait(1000);
}