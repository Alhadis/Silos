//<continuation number="100">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_041_ファンタズムライブ";
		$GameContiune = 1;
		Reset();
	}

		ch02_041_ファンタズムライブ();
}


function ch02_041_ファンタズムライブ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	Wait(1500);

	CreateTexture360("背景２", 100, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg062_01_3_ライブハウス店内_a.jpg");

	CreateSE("SE01","SE_日常_歓声_LOOP");
	MusicStart("SE01", 200, 1000, 0, 0, null, true);

	BGMPlay360("CH13", 2000, 1000, true);

	Request("背景２", Smoothing);
	Zoom("背景２", 0, 2000, 2000, null, true);
	Move("背景２", 0, @400, @-256, null, true);

	Move("背景２", 2500, @0, @400, Dxl1, false);
	Shake("背景２", 2500, 0, 50, 0, 0, 500, Dxl2, false);
	DrawTransition("背景２", 200, 0, 1000, 100, null, "cg/data/light6.png", false);

	Wait(2000);

	SetVolume("SE01", 1000, 400, NULL);

//イメージＢＧ//ファンタズムのライブ
//ＢＧＭ//パンク風ギターソロ

	Fade("背景１", 500, 1000, null, true);
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
中に入ると、いきなり爆音が耳をつんざいた。
こんな大きな音、これまで経験したことがない。

腹の底を無理矢理震わされ、振動で全身を粉砕されてしまうんじゃないかと錯覚しそうになった。

客席にはイスはひとつもなくて、みんな立ち見だ。

{#TIPS_オタ芸 = true;$TIPS_on_オタ芸 = true;}
誰もがリズムに合わせて身体を揺らし、タイミングよく“ＦＥＳ！！”“フェス！！”というかけ声とともに拳が振り上げられている。さすがに<FONT incolor="#88abda" outcolor="BLACK">オタ芸</FONT>ってほどじゃないけど。

{$TIPS_on_オタ芸 = false;}
ものすごい熱気。人いきれで吐きそうになる。

僕はオタだけど、アイドルオタや声優オタじゃない。だからこういう客席のノリなんかははっきり言って嫌いだ。

誰も僕になんて目もくれないのがせめてもの救いだけど、自分がこの場ですごく浮いているのは否定できない。

観客に遮られて、奥にあるステージはよく見えなかった。
ステージに当てられたライトだけがやけに目にまぶしく、その光の中に４人ほど立っているのがかろうじて認識できる。

雰囲気に圧倒されていると、三住くんがプラスチックカップに入ったジュースを手渡してくれた。

入場料は三住くんが払ってくれたらしい。後できちんと返さなくちゃ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧＭ//終了
	SetVolume360("CH*", 3000, 0, NULL);

//ＳＥ//歓声
//歓声ダミー
	SetVolume("SE01", 1000, 1000, NULL);
	CreateSE("SE02","SE_はいけい_らいぶ_曲の間_LOOP");

	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
と、そのとき演奏が終わった。
客席から拍手や歓声が上がる。

{	SetVolume("SE01", 5000, 0, null);
	SoundPlay("SE02",3000,800,true);}
それで少し落ち着いたのか、誰もが振り上げていた拳を下ろした。
そのおかげで、ステージに向かって道が開けるかのように、
視界がクリアになった。

ステージ中央に立つ、ショートカットの女の顔がはっきり見えるようになる。
確かにあの悪魔女とは別人だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2000, 0, NULL);

	CreateTextureEX("ステージ側", 100, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	Request("ステージ側", Smoothing);
	Zoom("ステージ側", 0, 2500, 2500, null, true);
	Move("ステージ側", 0, @400, @480, null, true);
	Fade("ステージ側", 1000, 1000, null, true);

	Stand("buあやせ_ステージ衣装_通常","normal", 200, @0);
	FadeStand("buあやせ_ステージ衣装_通常_normal", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//ＶＦ//マイク
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04100010ay">
「今日は……いつもより調子いいわ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04100020ay">
「声が、クリアに聞こえる」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04100030ay">
「世界が、とても澄んでいる」

アンプを通して聞こえてくる声も、あのとき僕に謎の言葉を投げかけた悪魔女の声とは似ても似つかない。

ＦＥＳは、三住くんが言う通り、アンニュイな雰囲気を持っていた。

ボーイッシュっていう感じはしない。可愛さと妖艶さの両方を兼ね備えていて、かつ孤高さも持っている、そんな不思議なオーラをまとっていた。

身につけているいくつものシルバーアクセサリーが、照明に反射してキラキラと輝いているのがまた幻想的だ。

＠ちゃんでＦＥＳのスレが立つのもなんとなく分かる気がする。

普通、こういうライブではバンドの人はもっと弾けてるって勝手にイメージしてたけど、ＦＥＳはやけに淡々としたＭＣを入れる。客席の盛り上がりとはまるで正反対だ。そういう性格なのかもしれない。

ただ、客もわきまえたもので、ＭＣ中はシーンと静まり返り、ＦＥＳの言葉に耳を傾けている。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04100040ay">
{#TIPS_コキュートス = true;$TIPS_on_コキュートス = true;}「<FONT incolor="#88abda" outcolor="BLACK">コキュートス</FONT>への門が閉じているからかもしれない」

{$TIPS_on_コキュートス = false;}
な、なんだって……？
コキュートス？　何語だ？


//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04100050ay">
「世界の均衡は、“大いなる意志”が生まれてから数千年間保たれていた」

{	Stand("buあやせ_ステージ衣装_通常","hard", 200, @0);
	FadeStand("buあやせ_ステージ衣装_通常_hard", 300, true);
	DeleteStand("buあやせ_ステージ衣装_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04100060ay">
「でも今、それは崩れつつある。とても、不安定……」

{	Stand("buあやせ_ステージ衣装_通常","normal", 200, @0);
	FadeStand("buあやせ_ステージ衣装_通常_normal", 300, true);
	DeleteStand("buあやせ_ステージ衣装_通常_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04100070ay">
「だから、私は歌うわ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04100080ay">
「キミたちのカオスを、受け入れてあげる……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("ステージ側２", 300, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	Request("ステージ側２", Smoothing);
	Zoom("ステージ側２", 0, 2500, 2500, null, true);
	Move("ステージ側２", 0, @336, @-560, null, true);
	Fade("ステージ側２", 1000, 1000, null, true);

	Delete("ステージ側");
	DeleteStand("buあやせ_ステージ衣装_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text103]
なるほど、これはゴシックパンクバンドとしてのキャラ付けかもしれない。

確かに普通の人にはちょっと理解できないような、でも思わせぶりなことを言っておけば、神秘性のようなものが出てファンの心をつかみやすいのかも。

実際、ＦＥＳはその手に妙なものを持っている。左手には普通のマイク。だけど右手に握りしめているのは、剣のような不思議な形をしたマイクスタンドなんだ。

禍々しさすら感じさせる流麗なフォルム、少しでも触れれば瞬時に指を切断してしまいそうなほどの鋭利さ。
すごく大きくて、ＦＥＳの身の丈と同じぐらいの長さがあった。

しかもライン状に埋め込まれたガラス部分が、妖しく青色に発光している。

それがホントにマイクスタンドなのかどうか、よく分からないけど、キャラ付けの為のアイテムとしては申し分なかった。

僕は不思議とそれに目が釘付けになっていた。

するとＦＥＳは、その巨大なマイクスタンドを右手だけで軽々と持ち上げ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//大歓声
	CreateSE("SE01","SE_日常_歓声_LOOP");
	SoundPlay("SE01", 1000, 1000, false);

//	CreateSE("SE03","SE_擬音_ディそーど_空を切る2");
//	SoundPlay("SE03", 0, 1000, false);

	CreateColor("色１", 500, 0, 0, 1280, 720, "white");
	DrawTransition("色１", 100, 0, 1000, 300, null, "cg/data/lightn7.png", true);

	Fade("色１", 1000, 0, null, true);
	Delete("色１");

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
逆手に持ったまま、大きく横なぎに振り払った。
ガラス部分の青い光が弧を描く。

なんて危ないことするんだ……！
客に当たったらどうする。

あれってマイクスタンドじゃなくて、もしかして剣だったりして……。

そして悪魔女に捧げる生き血を調達するために、毎晩、あの剣によって客の中のひとりが首をかっ切られる……とか……。

だとしたらこのライブは、さながら魔女たちによる黒ミサか……。

ブルルと寒気が走り、全身に鳥肌が立っていた。
早くここを立ち去った方がいいかもしれない……そう思い始めたとき、ＦＥＳが静かにつぶやいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2000, 0, NULL);
	SetVolume("SE02", 2000, 0, NULL);
	Fade("ステージ側２", 2000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/04100090ay">
「次は３曲目……」

//■３６０
//挿入歌タイトルはこれで確定です
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch02/ayase_akapera1">
//「“罪過に契約の血を”」
//ayase_akapera1
「“密教の首飾り”」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_歓声_LOOP");
	SoundPlay("SE02", 300, 800, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//ＳＥ//大歓声
//歓声ダミー
一際大きな歓声が、客席から上がる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("ステージ側２");

	Wait(1000);

//ＢＧＭ//あやせの歌
	BGMPlay360("CHN_INS_PHANTASM",0,1000,true);

//	$杭打ち = 1;
//	CreateSound("杭を打て１", SE, "sound/bgm/CHN_INS_PHANTASM");
//▼べー：演出：SetStream使用不可のため一時的にコメントアウト致します。
//	SetStream("杭を打て１", 11900);

//	SoundPlay("杭を打て１",16,10,false);
//	Wait(100);
//	SetVolume("杭を打て１", 1000, 1000, NULL);

	Wait(1000);

	CreateSE("SE04","SE_日常_歓声_LOOP");

//ＣＧ//剣を持って歌うあやせ
	CreateTextureEX("背景３", 100, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	Request("背景３", Smoothing);
	Zoom("背景３", 0, 2000, 2000, null, true);
	Move("背景３", 0, @512, @-64, null, true);

	CreateTextureEX("背景２", 100, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	Request("背景２", Smoothing);
	Zoom("背景２", 0, 2000, 2000, null, true);
	Move("背景２", 0, @-512, @-64, null, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	SetBlur("背景１", true, 2, 300, 100);
	Zoom("背景１", 0, 2000, 2000, null, true);
	Fade("背景１", 20, 0, null, true);

	Fade("背景３", 1000, 1000, null, false);
	Move("背景３", 4000, @0, @256, null, false);
	Wait(3000);

	Fade("背景２", 1000, 1000, null, false);
	Move("背景２", 3500, @0, @256, null, false);
	Wait(3000);

	SoundPlay("SE04", 200, 1000, false);
	SetVolume("SE02", 200, 1000, null);

	Move("背景３", 0, @0, @-480, null, true);
	FadeDelete("背景２", 500, false);

	Move("背景３", 1000, @-640, @0, Dxl2, false);

	Wait(500);

	Zoom("背景１", 1000, 1000, 1000, Dxl2, false);
	Fade("背景１", 500, 1000, null, true);
	Wait(800);

	Delete("色１");
	Delete("背景２");
	Delete("背景３");

	SoundPlay("SE04", 5000, 0, false);
	SoundPlay("SE02", 5000, 0, false);

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
直後、ファンタズムのメンバーたちが一斉に動き出し、再び僕の耳に音の洪水が流れ込んでくる。

この轟音で鼓膜を破壊されそうだよ……！
みんなこんなところにいて耳がおかしくならないのか？

隣を見ると、三住くんはすっかりノリノリで、他の客と同じようにリズムを取りながら拳を振り上げている。

イントロが終わり、ＦＥＳが歌い出したところで、
僕はその歌詞にギクリとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※以下、歌詞
//歓喜極まる天地の夢　とこしえの窓　主（あるじ）が見下ろす
//虐（しいた）げられている　囚われの民は　それに気付かないまま逝った
//
//慈（いつく）しみに命じられ　そうすれば僕は　罪を超えて行けるの
//全ての悲しみがほら　目の前で　消えたり　現れたり
//
//杭を打て　杭を打て　闇夜を切り裂き　月光（げっこう）を浴びて
//幾千もの　鉄槌（てっつい）は　　汝（なんじ）の痛みとなりて　今解き放たれる
//
//やがて叫びは宙に舞い　夜空は紅く染まるだろう
//十字の杭は力となり　やがて聖域へと辿り着く
//※以上、歌詞

//■360歌詞
//月夜の光が　示された従者よ
//この場所へ繋がる　幻の道
//叫びはいつしか　沈黙に変わって
//落ちてゆく安息　風に手と手を繋いで
//■360歌詞

//▼べー：演出：SetStreamコマンドが使用不可ですので一時コメントアウト致します。
//演出相談項目
/*
	$杭打 = PassageTime("杭を打て１");

	if($杭打 < 31000)
	{
		$杭打ち = 2;
		CreateSound("杭を打て２", SE, "sound/bgm/CHN_INS_PHANTASM");
		SetStream("杭を打て２", 30900);

		SetVolume("杭を打て１", 1500, 0, NULL);

		SoundPlay("杭を打て２",16,10,false);
		Wait(100);
		SetVolume("杭を打て２", 1000, 1000, NULL);
	}

*/
//	BGMPlay360("CHN_INS_PHANTASM_trim",2000,1000,false);
	CreateSound("月夜の", BGM, "sound/bgm/CHN_INS_PHANTASM_trim");
	SetVolume("月夜の", 0, 0, NULL);

	SetVolume360("CHN_INS_PHANTASM", 3000, 0, null);
	Wait(500);

	MusicStart("月夜の",2000,1000,0,1000,null,false);
//	SoundPlay("月夜の",2000,1000,false);


	Wait(3000);
	CreateTextureEX("背景２", 100, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	Request("背景２", Smoothing);
	Zoom("背景２", 0, 2000, 2000, null, true);
	Move("背景２", 0, @-256, @0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text905]
＠ちゃんねるに貼ってあった、例の“予言歌”だ。

暗くて、一握りの救いも感じられないような曲。歌詞のせいもあってか、そのメロディーはとても宗教的にさえ感じられた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景２", 1000, 1000, null, false);
	Move("背景２", 5000, @240, @0, null, false);
	Wait(3000);
	Fade("背景２", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601905]
最初は盛り上がっていた客席も、曲が進むにつれて徐々にテンションを落とし、ついには一言も発することなく誰もが立ち尽くす状態になった。

でも、それはむしろ聞き入っているっていう状況で、中には恍惚感に浸りきった顔でＦＥＳを見つめる者までいる。

確かにＦＥＳの歌声には、人を惹きつけるなにかがあるかもしれない。僕も、この人混みに対する恐怖や吐き気と戦いながらも、ＦＥＳの歌を聞き逃すまいとただじっと耳を傾けていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("背景２", 0, @80, @0, null, true);
	Fade("背景２", 1000, 1000, null, false);
	Zoom("背景２", 4000, 1800, 1800, AxlDxl, false);
	Wait(3000);

//▼べー：挿入歌変更につき、BGM挿入歌含め丸ごとカットします。調整をお願い致します。
//■３６０カット
/*
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602905]
最後はサビの部分が何度も繰り返される。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
*/
//■３６０カットここまで

	Fade("背景２", 1000, 0, null, false);
	Wait(500);

/*
	if($杭打ち == 1)
	{
		$杭打 = PassageTime("杭を打て１");
	}else if($杭打ち == 2){
		$杭打 = PassageTime("杭を打て２");
	}

	if($杭打 < 284000)
	{
		CreateSound("杭を打て３", SE, "sound/bgm/CHN_INS_PHANTASM");
		SetStream("杭を打て３", 285900);

		SetVolume("杭を打て１", 1500, 0, NULL);
		SetVolume("杭を打て２", 1500, 0, NULL);

		SoundPlay("杭を打て３",16,10,false);
		Wait(100);
		SetVolume("杭を打て３", 1000, 1000, NULL);
	}
*/

//▼べー：挿入歌変更につき、BGM挿入歌含め丸ごとカットします。調整をお願い致します。
//■３６０カット
/*
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text805]
――杭を打て　杭を打て　闇夜を切り裂き　月光を浴びて

そのフレーズを聴いて。

あの悪魔女が張り付け死体を前にして、返り血に染まりながらゆっくり僕を振り返った光景がよみがえった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

*/
//■３６０カットここまで

//ＢＧＭ//終了
	SetVolume("月夜の", 6000, 0, NULL);

//■３６０調整につきボックス分けます
//おがみ：シナリオ修正
//鳥肌が立つ。瞬間的に、周囲の空気が数度落ちたように思えた。
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601805]
鳥肌が立つ。周囲の温度が、瞬間的に氷点下まで落ちたように思えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 2000, 1000, null, true);
	Delete("背景１");
	Delete("背景２");

	Wait(2000);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg062_01_3_ライブハウス店内_a.jpg");
	Fade("色１", 1000, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
曲が終わった。

ＦＥＳは下を向いてユラユラと身体を左右に揺らしながら、ステージの最後の余韻に浸っている。

と、唐突にＦＥＳは顔を上げ――
視線をさまよわせることもなく、いきなり――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	Stand("buあやせ_ステージ衣装_通常","hard", 200, @0);
	CreateTextureEX("ステージ側", 100, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	Request("ステージ側", Smoothing);
	Zoom("ステージ側", 0, 2500, 2500, null, true);
	Move("ステージ側", 0, @400, @480, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("ステージ側", 0, 1000, null, true);
	FadeStand("buあやせ_ステージ衣装_通常_hard", 0, true);

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text906]
僕を、見た。

それは目の方向が合ったとか、一瞬だけ目が合ったとか、そういうレベルじゃなかった。

ＦＥＳは、明らかに僕を見ていた。

しかも、ジッと。凝視するように。僕という存在を確かめるかのように。僕の心を探ろうとするかのように。

その視線はとても強烈なもので――
なぜか、切なそうで――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("８");
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――


	EndTrigger();

	DeleteStand("buあやせ_ステージ衣装_通常_hard", 200, false);
	Fade("ステージ側", 200, 0, null, true);
	Delete("ステージ側");

}

