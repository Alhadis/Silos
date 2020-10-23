

chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "chs_164_セナ編_襲撃";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_164_セナ編_襲撃();
}


function chs_164_セナ編_襲撃()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編

//ＢＧ//渋谷駅地下・コインロッカー付近
//ＳＥ//銃声
	CreateSE("SE001","SE_衝撃_じゅう声");
	MusicStart("SE001", 0, 1000, 0, 1000, null, false);
	SetVolume("SE05", 200, 0, null);

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 1000, null, true);

	CreateColor("黒幕", 900, 0, 0, 1280, 720, "BLACK");

	CreateTexture360("ロッカー１", 100, 0, 0, "cg/bg/bg213_01_6_chn渋谷駅コインロッカー_a.jpg");
	Delete("セナと赤ん坊*");

	FadeDelete("フラッシュ", 200, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
轟音。

なにが起こったのか理解できなくて、反射的に腰を低くしていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Fade("黒幕", 1000, 0, null, true);
	Delete("黒幕");

	Wait(500);

	CreateSE("SE06","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE06", 3000, 500, 0, 1000, null, true);
	Stand("st護_スーツ_通常","normal", 200, @-280);
	FadeStand("st護_スーツ_通常_normal", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
その姿勢で周囲を見回すと、副都心線の改札の向こうに、ひとつの人影があった。
その手に銃らしきものを握り、こっちに向けている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	DeleteStand("st護_スーツ_通常_normal", 500, true);

	Wait(300);

	Stand("buセナ_制服_通常","sad", 300, @+220);
	FadeStand("buセナ_制服_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700420sn">
「あ、あ……」

セナの、かすれた声。
見ると、セナの手が血に染まっていた。

いや、セナじゃない。セナが抱いている赤ちゃんだ。その赤ちゃんをくるんでいる白いタオルが、みるみる赤く染まっていく。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700430sn">
「し、死んじゃう……。また、私は、見殺しに……っ」

セナの身体がわなわなと震えていた。

{	DeleteStand("buセナ_制服_通常_sad", 500, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700440su">
「んー、相変わらず自分の射撃の腕、素晴らしすぎッスよねぇ」

{	CreateSE("SE01","SE_はいけい_瓦礫_踏む足音_LOOP");
	MusicStart("SE01",2000,1000,0,1000,null,false);}
そのスーツの男は、ヘラヘラとした笑みを浮かべながら
こっちに歩み寄ってきた。
背に、スーツには似合わないリュックを背負っている。

{	SetVolume("SE01", 1000, 0, null);
	Stand("st護_スーツ_通常","hard", 200, @-280);
	FadeStand("st護_スーツ_通常_hard", 300, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700450su">
「こんなところで、なんの相談してるんスか？　っていうか、
その赤ん坊、なんなんス？　もしかしてアレっスか、２人の隠し子？
できちゃった？　最近の高校生はなってないッスねぇ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700460su">
「ま、別にどうでもいいッスけど。自分は、君たちを始末しに来たんスよ。ノアⅡの近くで目障りなことされると困るんで」

こ、こいつ、希の関係者かな。前にどこかで見たような気もする。
銃を持ってるなんて、普通じゃない……。
殺される……！　逃げなきゃ……！

{	Stand("st護_スーツ_通常","normal", 200, @-280);
	FadeStand("st護_スーツ_通常_normal", 300, true);
	DeleteStand("st護_スーツ_通常_hard", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700470su">
「さて、それじゃまずそっちの、危なっかしい通り魔女子高生から始末しましょうかねえ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700480ta">
「……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_擬音_じゅうかまえる");
	MusicStart("SE01",0,1000,0,1000,null,false);


	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 0, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
男が銃を構える。
狙いはセナ。
でもセナは、赤ん坊を抱いたまま泣き崩れている。

僕はどうすれば！？

――チートコードは手に入ったんだ。

僕は、どうすればいい！？

――僕は無敵になれるはずなんだ。

僕には、セナを守ることなんてできないよ……。

――僕は無敵なんだから、無茶したって、大丈夫のはずなんだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//銃声
//ＳＥ//血が吹き出る

	CreateTextureEX("ブラー用", 100, 0, 0, "cg/bg/bg213_01_6_chn渋谷駅コインロッカー_a.jpg");

	CreateSE("SE001","SE_衝撃_じゅう声");
	CreateSE("SE002","SE_じん体_血_噴きでる");
	MusicStart("SE001", 0, 1000, 0, 1000, null, false);

	CreateMovie360("ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");
//	Request("ムービー", Play);
	MusicStart("SE002", 0, 1000, 0, 1000, null, false);

	Delete("Black");
	DeleteStand("st護_スーツ_通常_normal", 0, true);

//	WaitAction("ムービー", null);
	Wait(1000);
	Zoom("ブラー用", 0, 1000, 1000, null, true);
	Fade("ブラー用", 0, 500, null, true);
	Zoom("ブラー用", 500, 1200, 1200, Dxl2, false);
	Fade("ブラー用", 500, 0, Axl2, false);
	Fade("ムービー", 500, 0, null, true);

	Delete("ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700490ta">
「ぐぁっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――



	CreateSE("SE3601","SE_じん体_心臓_鼓動");
	CreateSE("SE3602","SE_じん体_心臓_鼓動_LOOP");
	MusicStart("SE3601",0,1000,0,1000,null,true);
	MusicStart("SE3602",0,1000,0,1000,null,true);



	Stand("buセナ_制服_横向","shy", 300, @+100);
	FadeStand("buセナ_制服_横向_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3611002]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700500sn">
「に……しじょう……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700510ta">
「う、う……」

セナをかばった僕は、胸のあたりに激しい衝撃と痛み、そして焼けるような熱さを感じた。
制服が、血に染まっていく。

撃たれた……僕が……。

{	DeleteStand("buセナ_制服_横向_shy", 500, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700520su">
「おおーっと、かっこいいッスねえ、西條拓巳くん」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700530su">
「身を挺して女を守るなんて、男の鑑ッス」

//◆保つ＝もつ
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700540su">
「でも、それもいつまで保つかな？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//◆/ＳＥ/銃声
	CreateSE("SE001","SE_衝撃_じゅう声");
	MusicStart("SE001", 0, 1000, 0, 1000, null, false);
	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, false);
	Request("血", AddRender);

	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg213_01_6_chn渋谷駅コインロッカー_a.jpg");

	Shake("ロッカー１", 500, 5, 10, 0, 5, 500, null, false);

	Zoom("ブラー用", 0, 1000, 1000, null, true);
	Fade("ブラー用", 0, 500, null, true);
	Zoom("ブラー用", 500, 1200, 1200, Dxl2, false);
	Fade("ブラー用", 500, 0, Axl2, false);

	Fade("血", 100, 800, null, true);
	FadeDelete("血", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700550ta">
「が……ふ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//銃声
	CreateSE("SE001","SE_衝撃_じゅう声");
	MusicStart("SE001", 0, 1000, 0, 1000, null, false);
	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, false);
	Request("血", AddRender);

	Shake("ロッカー１", 500, 10, 4, 5, 0, 500, null, false);

	Zoom("ブラー用", 0, 1000, 1000, null, true);
	Fade("ブラー用", 0, 500, null, true);
	Zoom("ブラー用", 500, 1200, 1200, Dxl2, false);
	Fade("ブラー用", 500, 0, Axl2, false);

	Fade("血", 100, 800, null, true);
	FadeDelete("血", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
銃声が一度響くたびに、僕の身体に穴が開く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//銃声
	CreateSE("SE001","SE_衝撃_じゅう声");
	MusicStart("SE001", 0, 1000, 0, 1000, null, false);
	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, false);
	Request("血", AddRender);

	Shake("ロッカー１", 500, 4, 13, 10, 10, 500, null, false);

	Zoom("ブラー用", 0, 1000, 1000, null, true);
	Fade("ブラー用", 0, 500, null, true);
	Zoom("ブラー用", 500, 1200, 1200, Dxl2, false);
	Fade("ブラー用", 500, 0, Axl2, false);

	Fade("血", 100, 800, null, true);
	FadeDelete("血", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700560ta">
「ぐ……が……っ」

血が飛び散り、痛みが僕の神経を侵食してくる。

セナはいまだ赤ちゃんを抱いたまま、僕を見て泣き顔のまま立ち尽くしている。

白いタオルは半分以上、赤く染まっていて。
その血は、赤ん坊のものなのか、僕のものなのか、分からなくなっている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, false);
	Request("血", AddRender);

	Fade("血", 1000, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700570sn">
「西條、血が……血が……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700580sn">
「このままじゃ、お前が……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700590ta">
「チ、チートコードを、つ、使って……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700600sn">
「で、でも……っ、私、どうしたら……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Zoom("ブラー用", 0, 1000, 1000, null, true);
	Fade("ブラー用", 0, 500, null, true);
	Fade("ブラー用", 1000, 500, Axl2, false);
	Zoom("ブラー用", 1000, 1100, 1100, Dxl2, true);
	Zoom("ブラー用", 1000, 1050, 1050, AxlDxl, true);
	Zoom("ブラー用", 1500, 1100, 1100, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
ま、まずい、意識が遠のきつつある……。

痛い！　痛い！　痛い！　痛い！　痛い！　痛い！　痛い！　痛い！

こんな痛い思いをするなんて、聞いてない……。
チートコードがあれば、無敵になるんだろうけど、セナが発動してくれないと、僕は、死ぬ……。

//ＳＥ//瓦礫を踏む足音
{	CreateSE("SE003","SE_はいけい_瓦礫_踏む足音_LOOP");
	MusicStart("SE003", 0, 1000, 0, 1000, null, true);}
背後から、気配が近づいてくる。
禍々しいまでの殺気を感じる。

{	CreateSE("SE01","SE_じん体_動作_尻餅");
	MusicStart("SE01",0,1000,0,1000,null,false);
	SetVolume("SE003", 0, 0, null);
	Fade("血", 1000, 800, null, true);}
背中に、硬い感触が押しつけられた。
火で炙られているかのように感じる傷口を、その冷たい感触で抉られる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700610ta">
「が、ああ……！」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700620su">
「よく頑張ったッスね～。でも、これで終わりッス。この至近距離で心臓をズドンとやれば……さすがのギガロマニアックスでも、死亡確定ッスから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700630ta">
「セナ、早く……」

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700640sn">
「う、うぅ……！」

セナは泣いているだけだった。
もう、ダメか。せっかくチートコードを手に入れたのに、これじゃ、意味がない――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE06", 1000, 0, null);
	SetVolume("SE3601", 1000, 0, null);
	SetVolume("SE3602", 1000, 0, null);
	Stand("bu護_スーツ_通常","cool", 200, @-200);
	FadeStand("bu護_スーツ_通常_cool", 500, true);
	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700650su">
「……くたばれ、クソガキ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_擬音_ディそーど1");
	CreateSE("SE3605","SE_擬音_ディそーど_人を切る");

//画面エフェクト//斬る
//ＳＥ//斬る
	CreateMovie360("ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");

	Delete("血");
	Delete("下敷き");
	Delete("ブラー用");
	DeleteStand("bu護_スーツ_通常_cool", 0, true);

	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//	Request("ムービー", Play);

	Wait(200);
	MusicStart("SE3605", 0, 1000, 0, 1000, null, false);

	WaitAction("ムービー", null);
	Fade("ムービー", 500, 0, null, true);
	Delete("ムービー");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
不意に背中から感触が消えた。
撃たれたのかと思ったけど、聞こえたのは銃声じゃなく、空気を震わせるような音。

{	CreateSE("SE01","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE01",0,1000,0,1000,null,false);}
//画面エフェクト//白い羽が舞う
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700660su">
「あ、あああ、お、オレの、オレの腕が……っ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE3601","SE_擬音_ディそーど出現");
	MusicStart("SE3601",0,1000,0,1000,null,false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "White");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 300, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
白い羽根――
キラキラと光り、舞っている。
この、地下の構内で。鳥なんて、どこにもいないのに。

{	SetVolume("SE3601", 2000, 0, null);}
朦朧とする意識と、全身を苛む痛みの中で、僕は、のろのろと振り返った。

そこに――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//キャラ表示//梨深（ディソード装備）
	PrintBG(3000);

	CreateTexture360("背景０", 100, 0, 0, "cg/bg/bg213_01_6_chn渋谷駅コインロッカー_a.jpg");
	Stand("bu梨深_制服_武器構えB","sad", 200, @-200);
	FadeStand("bu梨深_制服_武器構えB_sad", 0, true);

	Fade("back*", 1000, 0, null, true);
	Delete("back*");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700670ta">
「り……み……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn02/09700680ri">
「タク……」

見たこともない、流麗で美しく、
かつ禍々しいフォルムの剣を両手に持って。

そこに、梨深がいた。

僕の前からいなくなった梨深が、いた。
彼女は、僕を見て、切なそうに微笑む。

男は、腕から大量の血を流している。ばっさりと、肘から下を切断されていた。銃を握った手は、地面に転がっている。

あれを……梨深がやったの……？

{	BGMPlay360("CH28",0,1000,true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn02/09700690su">
「こ、の、アマ……！　オ、オレの、手を……よくも……！」

{	Stand("bu梨深_制服_武器構えB","hard", 200, @-200);
	FadeStand("bu梨深_制服_武器構えB_hard", 300, true);
	DeleteStand("bu梨深_制服_武器構えB_sad", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn02/09700700ri">
「ナナちゃんにひどいことしたくせに」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700710ta">
「り……み……」

呆然としている僕から、梨深は視線を外した。
僕らをかばうように、男の前に立つ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn02/09700720ri">
「早く外へ。事情は、だいたい理解してるから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn02/09700730ri">
「ノアⅡを壊して、蒼井さん、タク！」

その鋭い声で、僕は我に返った。
身体を少しでも動かせば、激痛が身体じゅうを駆け巡る。

今すぐにでもその場に倒れ込みたい。
もう動きたくない。なにも考えたくない。死にたくない。

ぼんやりしてくる意識。
血が、全身に開いた穴から溢れ出てくるのが、自分でも分かる。

絶望と死の恐怖に打ちひしがれそうになるのをこらえて、僕はセナの肩を抱いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	PrintBG(3000);

	CreateTexture360("ロッカー１", 100, 0, 0, "cg/bg/bg213_01_6_chn渋谷駅コインロッカー_a.jpg");
	Stand("buセナ_制服_通常","cry", 200, @+150);
	FadeStand("buセナ_制服_通常_cry", 0, true);
	CreateColor("黒幕", 1000, 0, 0, 1280, 720, "Black");
	Fade("黒幕", 0, 0, null, true);

	DrawTransition("back*", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700740ta">
「い、こう……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/09700750ta">
「今の、う、うちに……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700760sn">
「済まない、西條……」

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/09700770sn">
「私を、かばって、そんなに血が……ぐすっ……」

{	DeleteStand("buセナ_制服_通常_cry", 500, true);}
セナの目は潤んでいた。
セナの泣き顔なんて、初めて見る。
っていうか、セナみたいな冷徹女でも泣くんだな……。

それに、こうして肩を抱いてみて、初めて気付いた。

その身体はとても細い。
きっとセナだけが特別そうなんじゃなくて、リアルの女子はみんな、男と違ってこんな華奢なんだろうな……。

普段、あんなに強気で、偉そうで、僕のこと踏んづけてきそうな勢いなのに。セナも、やっぱり女の子なんだ。

大丈夫、セナが泣くことなんてない。僕のこんな傷ぐらい、チートコードさえ使えば、あっさりと治せる……。
治せるはずなんだ……。

そう信じて、僕は歯を食いしばり、歩を進めた。

{	CreateSE("SE01","SE_擬音_共鳴音_女性悲鳴のよう");
	CreateSE("SE02","SE_擬音_きかい_ひゅんひゅん2_LOOP");
	MusicStart("SE01",500,1000,0,1000,null,false);
	MusicStart("SE02",500,1000,0,1000,null,true);
	Fade("黒幕", 500, 1000, null, true);}
背後から、奇妙な機械音と、悲鳴のような共鳴音が錯綜するのが聞こえてきたけど、あえて振り返らなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH28", 2000, 0, null);
	SetVolume("SE*", 2000, 0, null);


	ClearAll(2000);
	Wait(1000);
}
