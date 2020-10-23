//<continuation number="0">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_153_七海の手首に包帯";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch07_153_七海の手首に包帯();
}


function ch07_153_七海の手首に包帯()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($GameDebugSelect == 1)
{
	SetChoice02("梨深ルート有り","梨深ルート無し");
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
			$梨深ルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$梨深ルート=false;
		}
	}
	$GameDebugSelect = 0;
}

//アイキャッチ
//※拓巳視点に戻る

	CreateColor("黒", 1000, 0, 0, 1280, 720,"Black");
	
//ＢＧ//学校廊下
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Fade("黒", 1000, 0, null, true);
	Delete("黒");
	
//ＳＥ//チャイム
	CreateSE("SE01","SE_日常_チャイム");
	MusicStart("SE01", 0, 500, 0, 1000, null, false);

	CreateSE("SE02","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE02", 2000, 500, 0, 1000, null, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
昼休み。
僕はいつも昼食は抜いている。教室でひとりで食べるのがいやだったからだ。一緒に食べる相手もいない。

最近は梨深に、一緒に食べようって誘われたりしていたけど、さすがに恥ずかしくて結局いつも断っていた。

というわけで昼休みになると、僕は教室を出て安らげる場所に避難する。

それはあるときは図書室だったり、あるときは中庭だったりする。

けど、例の騒動以来、学校中に顔が知れ渡ってしまった今、どこへ行こうと落ち着ける場所はなかった。

容赦なく突き刺さる視線。
投げかけられる罵倒や嘲笑。

今日も、学校中を歩き回ったけど、逆にそうしたものにさらされる結果になり、しょうがなくトイレの個室に逃げ込むしかないのかと考えていたら――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＣＧ//廊下を歩く七海の後ろ姿
//七海との距離は遠め
	CreateTextureEX("七海後ろ", 200, 0, 0, "cg/ev/ev068_01_1_七海廊下後姿_a.jpg");
	Fade("七海後ろ", 300, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
１年生の教室がある校舎へと繋がる渡り廊下で、七海の後ろ姿を見かけた。
ひとりで教室の方へと歩いていくところみたいだった。

そう言えば七海とは例の事件以来、一度も話をしていない。
この一週間、顔を合わせるのを避けていた。

だって、どんな顔をして会えばいいか分からなかったんだ。

僕は、七海の命よりも自分の命を優先させた最低の兄貴。

七海が無事に解放されたのは奇跡でしかない。僕はなにもしてないんだ。

もしかしたら七海は、拉致されたのは僕のせいだって『将軍』から聞かされているかもしれない。

だとしたら絶対怒ってる。
僕のことを軽蔑して、口も利いてくれないかもしれない。

だから、会いに行く勇気がなかった。

でも、いざこうして姿を見たら、今さらになって心配になってきた。

なにかヤバいことをされなかっただろうか。
ケガをしたりしなかっただろうか。
精神的な傷を負っていないだろうか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_衝撃_ふらっしゅばっく");
	MusicStart("SE03", 0, 1000, 0, 0, null, false);
	
//イメージＢＧ//七海の切断された手首（とその手が握っているケータイ）
//フラッシュバックで一瞬表示
	CreateColor("色１", 300, 0, 0, 1280, 720, "Black");

	CreateTextureEX("手首", 500, 0, 0, "cg/bg/bg160_03_3_ダンボール箱_a.jpg");
	Fade("手首", 200, 1000, null, true);

	CreateTexture360("背景１", 300, center, middle, "SCREEN");

	Delete("色１");
	Delete("手首");
	
	CreateTextureEX("七海後ろ", 200, 0, 0, "cg/ev/ev068_01_1_七海廊下後姿_a.jpg");
	Fade("七海後ろ", 500, 1000, null, true);

	FadeDelete("背景１", 1000, true);

//あやべ：以下徐々にアップ微調整。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
一瞬、脳裏にあの“手首”の記憶がよみがえった。

でも首を振ってそれを吹き消す。

あの切断された手首も、
その手首にはめられていたバングルも、
握られていたケータイも、

全部、妄想だったんだ。
リアルな、妄想。

だって冷蔵庫からあの手首はなくなっていた。
それは消えたと考えるよりは“最初からなかった”って考えた方が自然だ。

こうして七海が元気に生きているのがその証拠だよ。

{	CreateSE("SE03","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE03", 0, 800, 0, 1000, null, true);}
僕はいつしか、走り出していた。
七海を追いかける。
その姿がだんだん大きくなってくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("七海後ろ２", 200, 0, 0, "cg/ev/ev068_01_1_七海廊下後姿_a.jpg");
	Zoom("七海後ろ２", 0, 1100, 1100, null, true);
	Move("七海後ろ２", 0, @-24, @32, null, true);
	Request("七海後ろ２", Smoothing);
	Fade("七海後ろ２", 300, 1000, null, true);
	Delete("七海後ろ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
七海はまだ僕に気付かない。
歩きながら、右手の指先で髪の先端をくるくると弄んでいる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("七海後ろ３", 200, 0, 0, "cg/ev/ev068_01_1_七海廊下後姿_a.jpg");
	Zoom("七海後ろ３", 0, 1300, 1300, null, true);
	Move("七海後ろ３", 0, @-72, @96, null, true);
	Request("七海後ろ３", Smoothing);
	Fade("七海後ろ３", 300, 1000, null, true);
	Delete("七海後ろ２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
僕は、駆け寄って声をかけようとした。

髪をいじる、妹の右手の制服の袖が、わずかにずり落ちて。

違和感を覚えた僕は、出しかけた声を呑み込み。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 500, 0, null);
	Delete("SE03");
	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	Fade("黒", 0, 0, null, true);
	Fade("黒", 250, 1000, null, true);
	BGMPlay360("CH01", 0, 1000, true);
	CreateTexture360("七海手首", 300, 0, 0, "cg/ev/ev069_01_1_七海廊下後姿髪かきあげ_a.jpg");
	Delete("七海後ろ３");
	Move("七海手首", 250, @0, @-40, Dxl2, false);
	Fade("黒", 250, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
立ち止まった。

見えたんだ。

それは、とても些細な、ホントにどうでもいいような、違和感だったけど――

でも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＣＧ//髪をいじる七海の手首のアップ（白い包帯がのぞいている）
	Fade("黒", 250, 1000, null, true);
	CreateTextureEX("七海手首アップ１", 300, 0, 0, "cg/ev/ev069_01_1_七海廊下後姿髪かきあげ_a.jpg");
	Request("七海手首アップ１", Smoothing);
	Zoom("七海手首アップ１", 0, 1500, 1500, null, true);
	Move("七海手首アップ１", 0, @-160, @-40, null true);
	Fade("七海手首アップ１", 0, 1000, null, true);
	Delete("七海手首");
	Move("七海手首アップ１", 250, @0, @-80, Dxl2, false);
	Fade("黒", 250, 0, null, false);
//ＳＥ//心臓の鼓動
	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
白い。

巻かれていた。

目立たないように。

包帯。

右手の。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("黒", 250, 1000, null, true);
	CreateTextureEX("七海手首アップ２", 300, 0, 0, "cg/ev/ev069_01_1_七海廊下後姿髪かきあげ_a.jpg");
	Request("七海手首アップ２", Smoothing);
	Zoom("七海手首アップ２", 0, 2000, 2000, null, true);
	Move("七海手首アップ２", 0, @-200, @-40, null true);
	Fade("七海手首アップ２", 0, 1000, null, true);
	Delete("七海手首アップ１");
	Move("七海手首アップ２", 250, @0, @-120, Dxl2, false);
	Fade("黒", 250, 0, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
手首に――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//	WaitKey(1000);
	Delete("SE02");
//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
	BGMPlay360("CH*", 1000, 0, false);
	
	DelusionOut();
	Delete("*");

	DelusionOut2();


//○実績No.8：第七章【psychopath】
	XBOX360_Achieved(8);

	Wat(1000);

//第７章　ＥＮＤ

//★梨深編
//梨深編突入フラグが立っている場合、７章終了後、８章から梨深編個別シナリオに入ります。
//『ch08_169_妄想トリガー３９■』までは既存の８章の内容をまるまるコピペ。（ただし『ch08_154_インターミッション３３』『ch08_159_インターミッション３５』『ch08_167_インターミッション３７』はカットします）章タイトルもそのまま。『ch08_169_妄想トリガー３９■』後に梨深編９章に入ります

}