//<continuation number="470">

chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "chs_157_セナ編_渋谷崩壊";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_157_セナ編_渋谷崩壊();
}


function chs_157_セナ編_渋谷崩壊()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編
//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
閉じ込められてから、２８時間が経過していた。
途中、何度もウトウトして、意識を失ったりした。

自分でも制御できない感情の波が押し寄せてきて、鬱になったり、躁になったりして、精神的にもどんどん消耗させられていた。

僕とセナの間に、会話なんてひとつもなくて。
そもそも、セナは部屋に閉じ込められてからは、ちっとも使い物にならなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE3601","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	CreateSE("SE3602","SE_はいけい_びっぷルーム_LOOP");
	MusicStart("SE3601", 2000, 500, 0, 1000, null, true);
	MusicStart("SE3602", 2000, 500, 0, 1000, null, true);

//ＢＧ//希ＶＩＰルーム
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg136_02_1_希ＶＩＰルーム_a.jpg");
	FadeDelete("Black", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
唯一の救いは、部屋にはＰＣがあったこと。
例の国会議員と新興宗教教祖の汚い顔が映っていたモニタの他に、部屋にはいくつものモニタがあった。

そのモニタが、ＰＣのものだったんだ。
しかもネットに繋がっていたから、ＳＯＳをあちこちの掲示板に貼ってみたりした。

結果は、無残なものだったけど。

そもそも書き込むこと自体ができなかった。
受信はできるけど送信は一切が規制されていたんだ。
だからチャットもできないし、メールも送れなかった。

どこかで、あの２人のおっさんに指示された誰かが、
僕らを見張ってるっていうわけだ。

なんで情報を与えてくれるのか。
その理由はしばらくして分かった。

ネットで情報を集め始めて数時間、何気なくＴａｂｏｏ！のトピックスを見たら。

“渋谷スクランブル交差点で暴動発生”
というニュースが目に入って。

直後に、それは、起こった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1000, 0, null);
	SetVolume("SE3602", 1000, 0, null);

	Wait(1000);

//ＳＥ//地響き
	CreateSE("SE01","SE_自然_じ鳴り_ふぇーどいん_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

	CreateSE("SE02","SE_自然_じ鳴り_LOOP");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);

	CreateTexture360("shake01", 110, 0, 0, "cg/bg/bg136_02_1_希ＶＩＰルーム_a.jpg");
	Request("shake01", Smoothing);
	SetAlias("shake01", "shake01");
	Fade("shake01", 0, 1000, null, true);

	CreateProcess("プロセス１", 1000, 0, 0, "Shaker");
	Request("プロセス１", Start);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
まず最初に、地響きがした。
床が、いや、建物そのものが、激しく揺れ出す。

//ＳＥ//共鳴音
{	CreateSE("SE03","SE_擬音_共鳴音_激しい_LOOP");
	MusicStart("SE03", 500, 1000, 0, 1000, null, true);}
次に、激しい耳鳴りに襲われた。
頭が割れるほどの、甲高い共鳴音。
セナを見ると、苦悶の表情で耳を押さえている。

そして――

//ＳＥ//衝撃音
{	CreateSE("SE3605","SE_衝撃_道路陥ぼつ");
	MusicStart("SE3605",0,1000,0,1000,null,false);}
激しい轟音。

ビルそのものが、シェイクでもされているように大きく揺れる。
まともに立っていられなくて、僕は転げるように壁に背中をぶつける。

セナも部屋の中央でしゃがみ込み、丸くなっている。

そのセナの頭の上。
天井に固定されていたモニタが振り子のように揺れていて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 0, null);
	SetVolume("SE02", 1000, 0, null);
	SetVolume("SE03", 1000, 0, null);
	SetVolume("SE3605", 1000, 0, null);


	CreateColor("フラッシュバック", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("フラッシュバック", 0, 0, null, true);
	Request("フラッシュバック", AddRender);

	Fade("フラッシュバック", 200, 500, null, true);

	Delete("プロセス１");
	Delete("shake01");


	CreateSE("SE3601","SE_じん体_心臓_鼓動");
	MusicStart("SE3601",0,1000,0,1000,null,true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
僕の見ている世界はスローモーションになった。

揺れているモニタの動きが緩やかになり。
鈍い音を立てて、モニタをつり下げているアルミ製の棒が折れるのが見えた。

落下する。
ゆっくりと。
真下にいるセナに。

以前にも経験したことがある、この感覚。

そうだ、あやせが校舎の屋上から飛び降りたときと同じだ。

死ぬ。
あの巨大なモニタが頭の上に落ちたら、セナは死ぬ。

僕はとっさには動けない。

セナとの間には、５メートルほどの距離があるし。
それに僕には、身を挺して三次元女子を助けるなんていう、勇気ある行動は取れない。

だけど、頭の中で妄想だけは浮かんでいて。
その妄想の中で、僕は揺れる床を蹴って、セナに駆け寄り、抱きつくような形で華麗に助け出していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("フラッシュバック", 300, 0, null, true);

	Wait(500);

//▼べー：演出：暫定飛び出す効果
	CreateTexture360("背景１", 110, center, middle, "cg/bg/bg136_02_1_希ＶＩＰルーム_a.jpg");
//	SetBlur("背景１", true, 2, 300, 100);

	CreateSE("SE3602","SE_擬音_ディそーど2");
	MusicStart("SE3602",0,1000,0,1000,null,false);

	Zoom("背景１", 1000, 1500, 1500, Dxl2, false);
	Fade("フラッシュバック", 500, 700, null, false);
	Fade("背景１", 500, 1000, null, true);

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00700010ta">
「……っ！」

すべては一瞬で起きた――

まばたきをした、その刹那の間に、
僕の身体はセナのところへ瞬間移動し、
うずくまっているセナを抱いて、床を転がった。

//ＢＧ//白
モニタが落下した音が耳のすぐ横で響く。
あれだけ部屋が薄暗かったのに、視界は白く染まって。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("フラッシュバック", 1000, 1000, null, false);

//ＳＥ//爆発音
	CreateSE("SE04","SE_衝撃_爆発音");
	CreateSE("SE05","SE_衝撃_爆発音");
	CreateSE("SE360104","SE_衝撃_道路陥ぼつ");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	MusicStart("SE360104", 0, 1000, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
耳をつんざく爆発音とともに、それまで以上の衝撃が僕を襲い、
意識はそこで途切れた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	SetVolume("SE*", 2000, 0, null);

	ClearAll(2000);
	Wait(1000);
}

//shake用function
function Shaker()
{
	Shake("@shake01", 1000, 0, 0, 10, 10, 1000, null, true);
	while(1)
	{
	Shake("@shake01", 500, 10, 10, 10, 10, 1000, null, true);
	Shake("@shake01", 500, 20, 20, 10, 10, 1000, null, true);
	Shake("@shake01", 500, 10, 10, 20, 20, 1000, null, true);
	}

}



