//<continuation number="120">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_037_画像検証";
		$GameContiune = 1;
		Reset();
	}

		ch02_037_画像検証();
}


function ch02_037_画像検証()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//アイキャッチ
//※拓巳視点に戻る
//イメージＢＧ//ＰＣ画面

	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",500,0,false);
	ClearAll(0);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("背景２", 2000, 1000, null, true);

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	CreateSE("ムービー","SE_えい像_0928_01");
	CreateSE("ムービー２","SE_えい像_0928_02");

	SoundPlay("SE01", 1000, 500, true);

	Wait(1500);

	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev006_01_3_グロ画像_a.jpg");

	SoundPlay("ムービー", 800, 1000, false);

	CreateMovie360("フォルダ開く", 100, Center, Middle, false, false, "dx/mvPC01.avi");	
	Fade("フォルダ開く", 0, 1000, null, true);
	WaitPlay("フォルダ開く", null);

	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
『将軍』から送られてきた画像ファイルは、案の定キャッシュが入っているフォルダ内にあった。
『168491』というｊｐｇファイル。

やっぱりあんまり見たくないっていう躊躇が僕の中にまだあった。

だってこの画像、グロくて気持ち悪いから。

この画像を見れば、どうしても連鎖的にリアルで見た張り付け殺人の現場の光景を思い出しちゃうんだ。

いや、でも……
優愛を論破するため、そして僕自身の安全と無実を証明するために、必要なことなんだ。

星来たんも見守ってくれているんだから、
ちょっとぐらいのグロさは耐えよう……。

{	SoundPlay("SE02", 0, 1000, false);}
勇気を振り絞り、ダブルクリックしてファイルを開く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("ムービー２", 800, 1000, false);
	CreateMovie360("ファイル開く", 100, Center, Middle, false, false, "dx/mvPC02.avi");	
	Fade("ファイル開く", 0, 1000, null, true);
	WaitPlay("ファイル開く", null);

	Fade("背景１", 500, 1000, null, true);

	Wait(500);

	Delete("フォルダ開く");
	Delete("ファイル開く");

//イメージＢＧ//グロ画像イメージ
//将軍から送られてきた画像


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700010ta">
「うえ……」

やっぱりグロい……。
でも、実際に目にしたあの『張り付け』現場に比べれば、まだそれほどでもなかった。

それにこれは合成だと思えば、かろうじて耐えることもできる。

この画像が最初に送られてきたときは、ざっと見ただけですぐに閉じてしまった。画像の隅々までチェックすることはしなかった。

今回は、吐き気をこらえながらもなんとか画像を細かく調べていくことにする。

合成写真の見抜き方なんてよく知らないけど、影の方向とか周囲の景色との違和感があるとか、その辺を見ればいいんじゃないかな……。

考えられるのは、あらかじめこの場所を撮影しておいて、張り付け死体はＣＧで作って合成したっていう可能性だ。

そして『将軍』がこの写真を僕に送りつけたその翌日、この写真の通りの殺害方法を実行した……。

写真に写っている張り付け死体は、この解像度の粗さと暗さのせいで、杭の部分しかよく見えず、人物を特定できない。

光は一応張り付け死体周辺に“だけ”当たっているけど、まるでいかにも張り付け部分を見てくれとでも言ってるみたいだ。

写真を“作った”人間の意図みたいなものを感じる。

そもそも光が遺体周辺にだけピンポイントで当たっているのは、できすぎてるもんね。

まあ、僕も実際の現場をじっくり見たわけじゃないから、なんとも言えないけど。

あの悪魔女の姿は、張り付け死体の前にはなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
でも目を皿のようにしてなおもじっくり画像を見てみると、左の端の方の暗い部分に、人物らしき姿が写っていた。

危うく見落とすところだった。

陰になっているところにこの人物が立っているのと画像の粗さで、完全に周囲の風景に溶け込んでいて、パッと見ただけじゃなかなか気付けなかった。

これは合成のはずだけど、もしかしたらこの場所をあらかじめ撮影したときにうっかり“写真を作った人間”が写り込んじゃって、

しかも写真を加工するときに消し忘れちゃったっていうのも考えられる。

その人物の服装は、どうやら翠明の制服みたいだった。
ということは、あの悪魔女だ。あの女も翠明の制服を着てたから。

でもさらに目を凝らして写っている人物を見てみると、どうやら髪は短髪のように見える。

悪魔女はロングヘアーだった。優愛も除外される。

よし、画像処理ソフトを使って、もっと見やすいように加工してみよう。

{	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);}
画像処理ソフトを起動させ、画像をドラッグ＆ドロップする。

そして、ゴクリと一度息を呑んでから、メニューにある“レベル補正”を選んで、

画像の暗い部分を、明るく――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	Wait(1000);

	CreateSE("SE02","SE_衝撃_衝撃音01");

//ＣＧ//グロ画像イメージ②
	CreateTextureEX("背景２", 100, 0, 0, "cg/ev/ev006_02_3_グロ画像_a.jpg");
	Fade("背景２", 0, 0, null, true);
	Fade("背景２", 0, 1000, null, true);

	SoundPlay("SE01", 500, 0, true);

	Wait(1000);

//おがみ：ズーム
//	Move("背景２", 500, @320, @-240, Dxl2, false);
	Move("背景２", 500, @512, @-384, Dxl2, false);
	Zoom("背景２", 500, 2000, 2000, Dxl2, true);

	SoundPlay("SE02", 0, 1000, false);

	Wait(1500);
	BGMPlay360("CH06",2000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700020ta">
「え……？」

{	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE02", 0, 1000, true);}
//ＳＥ//心臓の鼓動
なんだ、これ……？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700030ta">
「はあ……はあ……え？　え？　……な、え？　なんだ、これ……」

そこに写っていたのは――

そこに写っていたのは、どう見ても――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700040ta">
「僕……だ……」

なんで、僕なんだ？

こんなのおかしいよ。
だって僕はあの現場には、９月２９日以前には一度も行ったことなんてないんだ……。

これも合成だ、そうに決まってる……。
合成だっていう証拠なんてさっぱり見つけられないけど、これは絶対合成なんだ！

そうじゃなきゃおかしいんだ！

だってこの画像が『将軍』から送られてきたのは２８日なんだぞ。
そして『張り付け』殺人事件が起きたのは２９日だ。

この画像が、２９日の現場を撮ったものだとしたら、つまりこれは“未来を写した写真”っていうことになるじゃないか！

//おがみ：台本用
//ＶＦ//回想セリフ
//【優愛】
//「あなたには、予知能力がありますか？」
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	SoundPlay("SE02", 200, 0, true);

	SetVolume360("CH*", 100, 0, null);

<voice name="優愛" class="優愛" src="voice/ch02/03700050yu">

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 1000, null, true);
	Wait(300);
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 200, center, middle, Auto, Auto, "「あなたには、予知能力がありますか？」");

	CreateVOICE("優愛","ch02/03700050yu");
	SoundPlay("優愛", 0, 1000, false);

	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);

	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	SetBacklog("「あなたには、予知能力がありますか？」", "voice/ch02/03700050yu", 優愛);

	$待ち時間 = RemainTime ("優愛");
	$待ち時間 += 500;
	WaitKey($待ち時間);

	SoundStop2("優愛");

	FadeDelete("テキスト１", 0, true);

	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	CreateSE("SE03","SE_衝撃_ぺっとぼとる");
	CreateSE("SE04","SE_じん体_動作_足_蹴る_イス");
	CubeRoom3("ルーム", 100, 0);

	Fade("ルーム", 0, 1000, null, true);
	Delete("背景１");
	Delete("背景２");
	Delete("色１");


//ＢＧ//拓巳の部屋
	MoveCube("ルーム", 200, @-100, @0, @150, Dxl2, false);
	Rotate("ルーム", 400, @-5, @0, @0, AxlDxl, false);
	SoundPlay("SE02", 0, 1000, false);
	SoundPlay("SE04", 0, 1000, false);
	Wait(200);
	SoundPlay("SE03", 0, 1000, false);
	Shake("ルーム", 500, 0, 5, 0, 0, 500, null, false);
	Wait(500);

	CreateTextureEX("背景４", 150, 0, -192, "cg/bg/bg120_01_3_PC画面その目_a.jpg");
	Zoom("背景４", 0, 2000, 2000, null, true);
	CreateTextureEX("背景３", 100, 0, -80, "cg/bg/bg120_01_3_PC画面その目_a.jpg");
	CreateSE("衝撃","SE_衝撃_衝撃音02");
	CreateSE("SE05","SE_日常_物音");
	CreateSE("SE06","SE_衝撃_衝撃音03");

	CreateColor("色１", 100, 0, 0, 1280, 720, "Red");
	Fade("色１", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//ＢＧ//拓巳の部屋
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700060ta">
「うるさい！　そんなはずはないんだ！」

{	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);}
足許にあった空のペットボトルを蹴り飛ばしながら、ペイントソフトを閉じる。

このｊｐｇファイルの作成日時を確認しようと、プロパティを開いてみた。
そして……愕然となった。

作成日時は２８日だった。
でもそんなことはどうでもよくなっていた。

プロパティ画面の“コメント”欄に、目立たないように書かれていたひとつの文章。
そっちの方に目が釘付けになってしまっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//３秒ほどウエイト
//イメージＢＧ//ＰＣ画面（ｊｐｇファイルのプロパティ）
//その目だれの目？
//おがみ：その目だれの目画像ダミーです。適当なものをつかってます
	Fade("背景４", 10, 1000, null, true);
	Fade("背景３", 0, 1000, null, true);
	SoundPlay("衝撃", 0, 1000, false);
	Wait(1500);
	FadeDelete("背景４", 10, 0, null, true);
	Wait(2500);
	Fade("背景３", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//ＢＧ//拓巳の部屋
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700070ta">
「うう……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SoundPlay("SE06", 0, 500, false);
	Wait(300);
	Shake("ルーム", 200, 0, 3, 0, 0, 500, null, false);
	SoundPlay("SE05", 0, 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601025]
僕はキーボードに指を叩き付けるとそれをデスクの端に押しやり、頭を抱えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	Rotate("ルーム", 2000, @5, @0, @0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601035]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700080ta">
「うう……星来、助けて……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	Rotate("ルーム", 1500, @-10, @0, @0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601045]
涙がこぼれそうになるのをこらえる。

いったいここ１週間ぐらいの訳の分からない状況はなんなんだ。
どうして僕ばっかりこんな目に遭うんだ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700090ta">
「…………」

ちょっと待てよ？

僕が写っている写真をどこからか手に入れて、合成でこのグロ画像にはめ込んでいるとしたら……。

『将軍』は少なくとも、この僕を事前にどこからか盗撮したか、あるいはどこかから僕の写真を手に入れたかしているんだ。

あのチャットルームにいきなり入ってきて、グリムが退室するや話しかけてきたことを考えると、どうやら僕だけを最初から狙ってきたらしい。

僕の個人情報は……『将軍』にバレてるかも……。

だとしたら、いつ『将軍』や悪魔女がこのベースを襲撃してきてもおかしくない。そして僕は拉致られてしまうんだ……。

{	Fade("色１", 10, 700, null, true);
	Fade("色１", 500, 0, null, true);}
首筋が、チリチリとする。
またあの“視線”だ。

見られている。何者かに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//――僕を、見るな。
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "――僕を、見るな。");

	SetBacklog("――僕を、見るな。", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text106]
振り返るもんか。
“ちょっとやそっとじゃ振り向かないぞゲーム”だ。

恐怖で全身に鳥肌が立ち、扉のところまで行って施錠を確認したい気分になったけど、振り向いたら負けなんだから僕は意地になってモニタを見つめ続ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	Rotate("ルーム", 500, @10, @0, @0, AxlDxl, true);
	MoveCube("ルーム", 1000, @100, @0, @-120, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602106]
落ち着かないからワープロソフトを起ち上げて、そこに思いついたことを書き込んでみた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_キーたたく_中");
	SoundPlay("SE02", 0, 1000, false);
	Wait(1000);
	CreateSE("SE02","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	SoundPlay("SE02", 0, 1000, false);

	Wait(200);

	CreateSE("SE02","SE_日常_PC_キーたたく_中");
	SoundPlay("SE02", 0, 1000, false);
	Wait(800);
	CreateSE("SE02","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	SoundPlay("SE02", 0, 1000, false);

	Wait(200);

	CreateSE("SE02","SE_日常_PC_キーたたく_中");
	SoundPlay("SE02", 0, 1000, false);
	Wait(800);
	CreateSE("SE02","SE_き械_でん化製ひん_ぱそコン_キーボーど_エンター");
	SoundPlay("SE02", 0, 1000, false);

//イメージＢＧ//ＰＣ画面（テキストウィンド）
//悪魔女＝殺人鬼、予知能力を持っている
//将軍＝悪魔女の手下
//優愛＝将軍の手下
//おがみ：画像ダミーです。上記内容とは食い違っています。

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg044_04_1_ワープロ文章_a.jpg");
	Fade("背景１", 0, 0, null, true);
	Fade("背景１", 0, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700100ta">
「きっとそうに決まってる」

“悪魔”っていう文字をビクビクしながら見つめていると、殺害現場にいたあの女がホントに悪魔なんじゃないかって思えてきた。

そうだよ、あの女はきっと人間じゃないんだ。

だったら未来を予知する能力ぐらい持っているかもしれない。未来の光景を写真に念写するのだって朝飯前だろう。

あのおぞましい『張り付け』だって、たったひとりでやり遂げても不思議じゃない。

悪魔女は手下である『将軍』を利用して、現場を偶然目撃しちゃうことになる僕に対してデータを送りつけてきたんだ。

理由は分からない。脅迫かもしれない。もし誰かに喋ったら次はお前がこうなるぞ、っていうのを僕に思い知らせるための脅迫。

あるいは――

犯行予告。

次は、お前を殺してやる、という死刑宣告。
もし、そうだとしたら……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700110ta">
「か、勝てるわけがない……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03700120ta">
「僕は、ヤツらにいつ殺されてもおかしくないんだ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,500);//――――――――――――――――――――――――――――――

	MusicStart("@SE*", 2000, 0, 0, 0, null, false);

	Wait(3000);



//～～Ｆ・Ｏ


}

