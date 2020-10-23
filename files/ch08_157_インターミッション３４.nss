//<continuation number="1110">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_157_インターミッション３４";
		$GameContiune = 1;
		Reset();
	}

		ch08_157_インターミッション３４();
}


function ch08_157_インターミッション３４()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//アイキャッチ
//■インターミッション３４

	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*", 2000, 0, false);

	IntermissionIn();


	DeleteStand("bu梨深_制服_通常_smile", 0, true);
	Delete("*");

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	IntermissionIn2();

	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	SoundPlay("SE01", 2000, 300, true);

//おがみ：SE病院ガヤまだ
//ＢＧ//ＡＨ総合病院・病室//夕方

	Wait(1000);

	Stand("buあやせ_パジャマ_通常","normal", 200, @-100);
	FadeStand("buあやせ_パジャマ_通常_normal", 500, true);

	Wait(1500);

	DeleteStand("buあやせ_パジャマ_通常_normal", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
岸本あやせは、ベッドの上でぼんやりと窓の外を眺めている。

この病室の窓には、あやせが昔いたアークハートメディカル会のような鉄格子はなかった。

窓の外には新宿の高層ビル群、そして夕焼け空が広がっている。ハトが数羽、翼を激しく羽ばたかせて横切っていった。

あやせはときおり苦しそうに眉根を寄せる。

その瞳はわずかに眠たげで、なにも映しておらず。
その唇が、渋谷の若者を魅了したあの美声を口ずさむこともない。

自殺未遂騒動を起こしたあやせが収容されたのは、代々木にある大きな総合病院の精神科だった。

すでにケガはほとんど治っていた。

あの高さから落ちたにもかかわらず、ほんのかすり傷程度で済んだのは奇跡的なことだと医師は言った。

それでも、頭を強く打ったこともあり、様子を見るためにすでに一週間以上、ここに入院させられている。

もっとも、様子を見ると言っても２日に一度ほどの割合で簡単な検査をするだけで、後は基本的にほったらかしだった。

病室は個室で、他にベッドはない。

窓際には、彼女のディソードが立て掛けてあった。青い光を明滅させている。それはもうずっとそこに置いてあるが、この病室を訪れた人間で気付いた者はひとりもいない。

見舞客はあまり来ない。

ファンタズムのファンたちは、毎日のように押し寄せているらしいが、周囲の迷惑になるからという理由で病院が面会を禁止していた。

家族とは疎遠になっているあやせには、他に見舞いに来る人間はほとんどいない。

バンドの仲間は一度顔を出したが、そのときにあやせの口からバンド解散の話が出て、それ以来ぱったりと連絡が付かなくなった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_手_のっく_LOOP");
	SoundPlay("SE02", 0, 1000, false);

	Wait(2000);

//ＳＥ//病室のドアが開く音
	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	SoundPlay("SE02", 0, 1000, false);

	SoundPlay("SE01", 1000, 500, true);

	Wait(1000);

	Stand("st志乃_白衣_通常","smile", 200, @150);
	FadeStand("st志乃_白衣_通常_smile", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch08/15700010hd">
「岸本さーん、体温計、ピピッて鳴りました？」

{	SoundPlay("SE01", 1000, 300, true);
	CreateSE("SE02","SE_日常_びょういんどあ_閉まる");
	SoundPlay("SE02", 0, 1000, false);}
病室のドアが開いて、白衣を着た看護師が入ってくる。

あやせは彼女の方にのろのろと顔を向け、それから今この瞬間に思い出したかのように、腋に挟んでいた体温計を抜き取った。

看護師はそこに表示されたデジタルの数字を見て、持っていたボードに書き込む。

{	Stand("st志乃_白衣_通常","normal", 200, @150);
	FadeStand("st志乃_白衣_通常_normal", 200, true);
	DeleteStand("st志乃_白衣_通常_smile", 200, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch08/15700020hd">
「３７度１分、と……」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch08/15700030hd">
「ちょっと熱っぽいかしら」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700040ay">
「ズキズキするわ……頭」

あやせはまた苦しそうに顔をしかめた。

{	Stand("st志乃_白衣_通常","worry", 200, @150);
	FadeStand("st志乃_白衣_通常_worry", 200, true);
	DeleteStand("st志乃_白衣_通常_normal", 200, false);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch08/15700050hd">
「あら、また頭痛？」

{	Stand("st志乃_白衣_通常","smile", 200, @150);
	FadeStand("st志乃_白衣_通常_smile", 500, true);
	DeleteStand("st志乃_白衣_通常_worry", 200, false);}
//◆笑顔
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch08/15700060hd">
「でもそれは薬の副作用よ。気にしなくてもそのうちよくなりますよ」

あやせから体温計を返してもらった看護師が、笑顔でそう答える。
その表情は柔らかで、患者を安心させる優しさがある。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);
	DeleteStand("st志乃_白衣_通常_smile", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
だがあやせは、手で額を押さえて首を振った。

入院して以来、あやせはずっと鈍い頭痛に悩まされている。
痛い、というほどのものではなかった。

だが、頭の中で脳が脈動しているかのような不快な感覚が常にあって、それがあやせの思考能力を鈍麻させている。

それに、身体も鉛のように重い。

あやせには、こんな症状になったことが過去にもあった。
アークハートメディカル会にいた頃だ。

あの頃は頭痛に２４時間３６５日蝕まれ、まともに眠ることもできず、感情が不安定になっていた。

思い出したくない思い出。
封印した過去。
２年ほど前の記憶。

頭の痛みを引き金にして、脳裏にフラッシュバックする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//以下、回想
	SoundPlay("SE01", 2000, 0, false);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	Delete("色１");
	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev059_01_6_あやせ拷問_a.jpg");
	CreateSE("SE36001","SE_自然_水滴の音_LOOP");
	CreateSE("SE36002","SE_日常_家具_イス_きしむ");
	MusicStart("SE36001",0,1000,0,1000,null,true);
	MusicStart("SE36002",5000,400,0,1000,null,true);
	Fade("回想フラッシュ", 5000, 0, null, true);


	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
暗い部屋。
鉄格子がはめられた小さな窓。

その窓以外の壁全面には、鏡が張られている。
あやせは部屋の真ん中に固定された、鋼鉄製の無骨なイスに座らされている。

頭には、たくさんのコードがついたヘッドギアのようなものを被らされ、

手は背もたれに回すようにして後ろ手に縛られ、

顔はわずかに顎をそらすような向きで固定されている。

//※頭にかぶせられているのはＮＡシナプスのＣＯＤＥサンプルを採取するためのヘッドギア
部屋の中に他に人影はなく。

あやせの荒い息づかいと、イスが軋む音だけが響き続けていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//ＶＦ//回想セリフ
//◆※あやせ１４歳くらいなのでちょっと幼めで
//◆狂ったようなうめき声
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700070ay">
「ああ……ああああああ」

あやせは口の端からよだれを垂らし、まだ年端もいかぬ少女のものとは思えない、獣のようなうめき声をあげていた。

//ＶＦ//回想セリフ
//◆※あやせ１４歳くらいなのでちょっと幼めで
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700080ay">
「殺して――」

//◆※あやせ１４歳くらいなのでちょっと幼めで
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700090ay">
「殺してぇぇぇっ」

それは、とても、静かな、拷問だった。

されていることはたったひとつ。

彼女の額に、上から、正確に、狂いなく、５秒ほどの間隔で、水滴が落ちてくる。

ただ、それだけ。

その状態が、２日ほど休みなく続けられた結果、

あやせは“次に落ちてくる水滴”のことしか考えられなくなり、

感覚は極限にまで研ぎ澄まされ、

その水滴が額に当たるたびに、

全身の神経を引きちぎられるような錯覚、

全身の骨が粉々に砕かれるかのような錯覚、

長く鋭利な千枚通しで頭を貫かれたような錯覚、

血も含めた体内のあらゆる水分が凍り付くような錯覚、

全身の皮膚がぐずぐずに腐ってずる剥けるような錯覚、

それらに襲われ、まともな精神ではいられなくなった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ホワイトアウト
//回想終了
	SetVolume("SE36001", 2000, 0, null);
	SetVolume("SE36002", 2000, 0, null);

	Fade("回想フラッシュ", 200, 1000, null, true);
	Delete("背景３");
	Delete("ルーム");
	Delete("回想明度");
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg102_01_2_あやせの病室_a.jpg");
	Stand("buあやせ_パジャマ_自分抱きしめ","ero", 250, @-50);
	FadeStand("buあやせ_パジャマ_自分抱きしめ_ero", 0, true);
	Fade("回想フラッシュ", 2000, 0, null, true);
	Delete("回想フラッシュ");

	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	SoundPlay("SE01", 0, 300, true);

//ＢＧ//ＡＨ総合病院病室

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700100ay">
「っ……はあっ……は……あ……」

我に返り、荒い呼吸を繰り返しながらシーツをきつく握りしめる。
暗い記憶がよみがえってしまったことに、彼女は身を震わせる。

病室に、先ほどの看護師の姿はすでにない。
ちょうど夕食時で、廊下の外はバタバタとしていた。

あやせはさっきの看護師の言葉を心の中で反すうする。

この頭痛が本当に薬の副作用なのか、
あるいは自分が飛び降りたときに頭を打ったせいなのか、
過去の記憶の影響による錯覚なのか、それは分からなかった。

{	Stand("buあやせ_パジャマ_自分抱きしめ","sad", 250, @-50);
	FadeStand("buあやせ_パジャマ_自分抱きしめ_sad", 300, true);
	DeleteStand("buあやせ_パジャマ_自分抱きしめ_ero", 0, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700110ay">
「ふ、ふふ……」

額ににじむ汗を拭い、あやせは自嘲気味な笑みを浮かべる。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700120ay">
「構わないわ……今さら、なにをされたって……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700130ay">
「あれを、あの神罰を、耐え抜いたんだから……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700140ay">
「もう、迷わない、私は」

{	DeleteStand("buあやせ_パジャマ_自分抱きしめ_sad", 500, true);}
浮かされたようにつぶやいてから、あやせはふと、廊下から響く音に気付く。

心地よささえ感じさせる、リノリウムを蹴る靴の音。

看護師のものではなかった。
靴音は、あやせがいる病室へと大股で近づいてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ドアをノックする音
	CreateSE("SE02","SE_じん体_動作_手_のっく_LOOP");
	SoundPlay("SE02", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
ドアがノックされ、あやせは唇を引き結んだ。

{	SoundPlay("SE01", 1000, 500, true);
	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	SoundPlay("SE02", 0, 1000, false);}
//ＳＥ//病室のドアを開ける音
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700150su">
「失礼しまッス」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st護_スーツ_通常","normal", 200, @150);
	Move("st護_スーツ_通常_normal*", 0, @0, @100, null, true);
	FadeStand("st護_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
現れたのは、ひとりの男。その手には、たくさんのフルーツが入ったお見舞い用のバスケット。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_パジャマ_通常","angry", 250, @-150);
	FadeStand("buあやせ_パジャマ_通常_angry", 500, true);
	SoundPlay("SE01", 1000, 300, true);
	CreateSE("SE02","SE_日常_びょういんどあ_閉まる");
	SoundPlay("SE02", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700160ay">
「…………」

あやせはこの男に見覚えがある。故に、警戒の目で男を見つめた。

{	Stand("st護_スーツ_通常","sigh", 200, @150);
	Move("st護_スーツ_通常_sigh*", 0, @0, @100, null, true);
	FadeStand("st護_スーツ_通常_sigh", 500, true);
	DeleteStand("st護_スーツ_通常_normal", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700170su">
「どうも。あ、別に怪しいもんじゃないッスよ？　自分は――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700180ay">
「知ってるわ」

この男は警視庁の刑事。
かつてあやせを、ニュージェネ事件の重要参考人としてつけ回してきたことがある。

{	Stand("st護_スーツ_通常","normal", 200, @150);
	Move("st護_スーツ_通常_normal*", 0, @0, @100, null, true);
	FadeStand("st護_スーツ_通常_normal", 500, true);
	DeleteStand("st護_スーツ_通常_sigh", 200, false);}
刑事は嬉しそうに頭を掻いている。
ずいぶんと呑気な態度だった。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700190su">
「いやー、嬉しいッス。キミみたいな美人に覚えててもらえて」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700200su">
「記憶力、いいんスね」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700210ay">
「…………」

{	DeleteStand("st護_スーツ_通常_normal", 500, false);}
刑事はベッドに歩み寄った。

あやせはチラリと、窓際に立て掛けられたディソードへと目をやる。
手を伸ばしただけでは届かない位置に、それはある。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Move("buあやせ_パジャマ_通常_angry*", 1000, @-170, @0, AxlDxl, true);

	Wait(500);

	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 500, true);

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700220su">
「今日はお見舞いに来たんスよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700230ay">
「……そうは思えないわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700240ay">
「目的は？」

{	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700250su">
「す、鋭いッスね」

//■３６０
//刑事はあからさまにたじろいて見せた。

刑事はあからさまにたじろいで見せた。
どこか芝居がかったような態度。

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700260su">
「まあ、ちょっとあやせちゃんに聞きたいことがあって」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700270ay">
「…………」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700280su">
「あ、これ、よかったら食べてほしいッス」

無邪気な笑顔で、刑事は持っていたバスケットを差し出し、半ば一方的にあやせの足許に置いた。

{	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700290su">
「うまいッスよ。あと……高かった……トホホ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700300ay">
「……いらない」

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700310su">
「まあそう言わず。せっかく買ってきたんで」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700320su">
「後でお母さんが来たときにでも、切ってもらって」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700330ay">
「…………」

{	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700340su">
「あ、し、しまった。あやせちゃんは、もう何年も両親に会ってないんだったッスね……」

刑事の白々しい態度にも、あやせは特になにも感じない。

幼い頃に、彼女は親から縁を切られた。

両親は体面を気にする人間で、当時問題ばかり起こしていたあやせの存在は彼らにとって都合が悪かったのだ。

一応、まだ繋がりはある。生活費だけは毎月、口座に振り込まれてくるのだ。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700350su">
「申し訳ないッス」

{	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
刑事はペコリと頭を下げた。

あやせは先ほどのフラッシュバックによる動揺がようやくおさまりつつあったものの、あまりこの刑事と話したくないと思い、自分から話を促した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700360ay">
「聞きたいことって、なに？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700370ay">
「アリバイ？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700380su">
「違うッスよ。それは前に散々聞いたし」

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700390su">
「もうあやせちゃんの容疑は晴れたッス。キミは白。真っ白」

{	Stand("buあやせ_パジャマ_通常","hard", 250, @-320);
	FadeStand("buあやせ_パジャマ_通常_hard", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_angry", 0, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700400ay">
「目星は付いたの？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700410ay">
「――犯人の」

{	Stand("bu護_スーツ_通常","hard", 210, @320);
	FadeStand("bu護_スーツ_通常_hard", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700420su">
「それは教えられないんスよ。捜査上の秘密ッス」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700430ay">
「……拓巳？」

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_hard", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700440su">
「秘密ッス」

刑事はニコニコとしている。
笑ってごまかしているのだった。

そうやって笑うと、まだ垢抜けていない部分が垣間見えてくる。

{	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700450su">
「しかし西條くんは、不思議な少年ッスねえ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700460su">
「彼を見ていると、殺人の容疑者にはとても見えない」

{	Stand("bu護_スーツ_通常","hard", 210, @320);
	FadeStand("bu護_スーツ_通常_hard", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700470su">
「もしあれで本当に犯人だったとしたら……
まさに人の皮をかぶった悪魔ッス！」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700480ay">
「まだ容疑者なのね、彼」

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_hard", 200, false);}
//◆軽いノリで否定
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700490su">
「いや、そういうわけじゃないッスよ？」

あやせがしつこく指摘しても、刑事は笑いながらあっさり否定した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu護_スーツ_通常","hard", 210, @320);
	FadeStand("bu護_スーツ_通常_hard", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700500su">
「あ、今の話、誰にも言っちゃダメッスからね」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700510ay">
「…………」

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_hard", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700520su">
「情報漏洩すると、上司に怒られるんスよ。まあ当然なんスけど」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700530su">
「この前も先輩のとばっちりで怒られたばっかで」

{	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700540su">
「あやせちゃんも一度会ってると思うんスけど、覚えてるかなあ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700550su">
「判さんっていう、髪がぼさぼさで無精ヒゲ生やしたおっさん刑事」

あやせは覚えていた。

話を聞かれたときも、今ここにいる若い刑事より、むしろそのおじさん刑事の方が口数は多かった。

そしてその話し方はかなりねちっこかった。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700560su">
「あの人がすぐ、“このバカ”って怒鳴るんスよ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700570su">
「そのくせ自分は本来の捜査をせずに、なんだか訳の分からないことばっか調べてて」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700580su">
「挙げ句の果てに自分まで無理矢理付き合わされて……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700590su">
「最近、胃が痛いんスよね～」

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700600su">
「いや、まあ、根はいい人ッスし、勘が異常に鋭い人で、過去にも難事件をいくつか解決に導いたらしいんスけどね……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700610ay">
「その話をするため？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700620ay">
「ここに来たのは」

あやせに話を遮えぎられ、刑事は苦笑した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700630su">
「あ、いや。申し訳ないッス。つい愚痴入っちゃったッスね」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700640su">
「今の話は全面的に内緒にしてほしいッス。諏訪護、一生のお願いッスよ！」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700650ay">
「それで？」

{	SoundPlay("SE01", 2000, 0, false);
	Stand("bu護_スーツ_通常","hard", 210, @320);
	FadeStand("bu護_スーツ_通常_hard", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700660su">
「えーっと、ひとつめは」

{	BGMPlay360("CH12", 3000, 1000, true);
	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_hard", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700670su">
「なんで、あんなことを？」

それが、学校の屋上から飛び降りたことを指しているのは、あやせにも分かった。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700680ay">
「もう何度も話したわ。他の、刑事さんに」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700690su">
「邪心王グラジオールの復活を阻止するため、ッスか？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700700ay">
「死ぬつもりなんてなかった」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700710ay">
「魂を、ひとつ上のステージに持っていこうとしただけよ」

{	Stand("bu護_スーツ_通常","hard", 210, @320);
	FadeStand("bu護_スーツ_通常_hard", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700720su">
「例の、若者の間で話題になったキミの歌についても、似たようなこと言ってたッスよね？」

それが２個目の質問だった。
あやせは小さく息をつく。

{	Stand("buあやせ_パジャマ_通常","normal", 250, @-320);
	FadeStand("buあやせ_パジャマ_通常_normal", 200, true);
	DeleteStand("buあやせ_パジャマ_通常_hard", 100, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700730ay">
「ニュージェネのことを歌ったものなんかじゃないわ、あの詞は」

//■３６０以下
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn00/00700010ay">
{#TIPS_グラジオール記黙示録詩編 = true;$TIPS_on_グラジオール記黙示録詩編 = true;}「<FONT incolor="#88abda" outcolor="BLACK">グラジオール記黙示録詩編</FONT>のインスピレーションを受けて作った。第３章１０２節よ」

//■３６０以上
//【あやせ】
//<voice name="あやせ" class="あやせ" src="voice/ch08/15700740ay">
//{#TIPS_グラジオール・サーガ = true;}「<FONT incolor="#88abda" outcolor="BLACK">グラジオール・サーガ</FONT>のインスピレーションを受けて作った。第３章１０２節よ」
{$TIPS_on_グラジオール記黙示録詩編 = false;}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700750ay">
「世界に、邪心王グラジオールが現れようとしている」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700760ay">
「復活を阻止するには、グラジオールが流した黒い血によって作られた、七つの杭が必要」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700770ay">
「杭は剣へと形を変え、神罰を乗り越えた七人の黒騎士の手に渡る」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700780ay">
「目には目を。歯には歯を」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700790ay">
「邪心を背負いし人間だけが、邪心王を滅ぼせるのよ」

{	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_hard", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700800su">
「な、なんか映画みたいッスねえ」

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700810su">
「そういう壮大な設定は好きッス！」

{	Stand("buあやせ_パジャマ_通常","angry", 250, @-320);
	FadeStand("buあやせ_パジャマ_通常_angry", 200, true);
	DeleteStand("buあやせ_パジャマ_通常_normal", 100, false);}
刑事の感想に、あやせは目を細めた。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700820ay">
「“設定”じゃないわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700830ay">
「現実よ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu護_スーツ_通常","hard", 210, @320);
	FadeStand("bu護_スーツ_通常_hard", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700840su">
「じゃあ、最後の質問ッス」

刑事があやせの反論をあっさりと受け流す。
だがそういう反応をされることに、彼女は慣れていた。

あやせの話を信じる者など、これまでにも誰ひとりとしていなかった。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700850su">
「キミや西條くんの他にも、翠明の生徒について何人か洗ったんスけどね」

{	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_hard", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700860su">
「ん～…………」

刑事は腕を組んでうなり出す。

それもまた芝居がかっているが、あやせはそれについてなにか言うつもりはなかった。

{	Stand("buあやせ_パジャマ_通常","hard", 250, @-320);
	FadeStand("buあやせ_パジャマ_通常_hard", 200, true);
	DeleteStand("buあやせ_パジャマ_通常_angry", 100, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700870ay">
「……なに？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700880su">
「そのぉ、すごくバカバカしい質問なんスけど……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700890su">
「刑事が質問するようなことじゃないんスよねえ、ホントは……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700900su">
「子供じみてるって言うか……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700910ay">
「そう……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700920ay">
「質問する気がないなら、出て行って」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700930ay">
「頭が……痛いの」

{	Stand("bu護_スーツ_通常","hard", 210, @320);
	FadeStand("bu護_スーツ_通常_hard", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700940su">
「ああ、いや、実はね、判さんが妙なこと言い出してるんスよ」

{	BGMPlay360("CH*", 1000, 0, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700950su">
「キミたちは魔法使い、なんじゃないかって」

{	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	SoundPlay("SE01", 2000, 300, true);
	Stand("buあやせ_パジャマ_通常","angry", 250, @-320);
	FadeStand("buあやせ_パジャマ_通常_angry", 200, true);
	DeleteStand("buあやせ_パジャマ_通常_hard", 100, false);}
“キミたち”という言葉に、あやせはわずかに眉をひそめた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 2000, 0, true);

	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_hard", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//◆バカにしたように
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700960su">
「違いまスよねえ？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700970ay">
「…………」

{	Stand("buあやせ_パジャマ_通常","hard", 250, @-320);
	FadeStand("buあやせ_パジャマ_通常_hard", 200, true);
	DeleteStand("buあやせ_パジャマ_通常_angry", 100, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15700980ay">
「使えるわ」

刑事の方は見ず、シーツの上に置いた自身の手を眺めたまま、あやせは答えた。

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//◆愛想笑い
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15700990su">
「ははは、あやせちゃんって面白い子ッスね」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15701000ay">
「でも」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch08/15701010ay">
「ニュージェネは、グラジオールの騎士とは無関係」

{	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);}
//◆信じてないような素振り
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15701020su">
「はあ、そうッスか」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15701030su">
「まあ、どうでもいいんスけどね」

{	DeleteStand("bu護_スーツ_通常_sigh", 400, false);}
刑事はあやせの言葉を興味なさげに受け流し、大きく伸びをした。

{	CreateSE("SE02","SE_日常_けい帯_着信音_ダースすぱいだー");
	SoundPlay("SE02", 0, 300, true);}
//ＳＥ//ダーススパイダーのテーマ
と、静かだった病室に、唐突に電子音が響き渡った。
刑事が慌てた様子で、スーツのポケットからケータイを取り出す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE02", 1000, 400, true);
	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15701040su">
「まずったぁ、病院ってケータイ禁止なんスよね。電源ＯＦＦにしておくの、忘れてた」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15701050su">
「うわ、しかも女からだし」

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//カノジョ＝葉月
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15701060su">
「へへ、付き合って４年になるラブラブのカノジョがいるんスよ～」

{	CreateSE("SE03","SE_日常_けい帯ボタン押す");
	SoundPlay("SE02", 100, 0, false);
	SoundPlay("SE03", 0, 1000, false);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);}
ニヤけながら通話ＯＦＦボタンを押して、相手からの着信を強制的に切ってしまった。
それから、改めてあやせに向き直ってくる。

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15701070su">
「あやせちゃんは映画見るッスか？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15701080su">
「『スパークウォーズ』って知らない？　それに出てくるダーススパイダー伯爵のテーマなんス、今のメロディ」

彼女は映画になど興味はなかった。

{	DeleteStand("buあやせ_パジャマ_通常_hard", 500, false);}
もうすでに、この刑事の質問に答える義務も必要性もないと判断し、黙って窓の外へと視線を移す。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15701090su">
「実は自分、『スパークウォーズ』オタクなんスよ～」

{	Stand("bu護_スーツ_通常","sigh", 210, @320);
	FadeStand("bu護_スーツ_通常_sigh", 200, true);
	DeleteStand("bu護_スーツ_通常_normal", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15701100su">
「あ、興味ないッスか。そりゃ失礼したッス」

{	Stand("bu護_スーツ_通常","normal", 210, @320);
	FadeStand("bu護_スーツ_通常_normal", 200, true);
	DeleteStand("bu護_スーツ_通常_sigh", 200, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch08/15701110su">
「んじゃ、自分はこれで」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu護_スーツ_通常_normal", 500, false);

	Wait(500);

	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	SoundPlay("SE02", 0, 1000, false);

	Wait(2000);

//ＳＥ//病室のドアが閉まる音
	CreateSE("SE02","SE_日常_びょういんどあ_閉まる");
	SoundPlay("SE02", 0, 1000, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
最後は一方的に話して、刑事は病室を出ていった。

あやせの目はその後ろ姿を見送ろうともせず。

黄昏色から藍色へと変わりつつある空だけを映していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

//■インターミッション３４終了

	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*",2000,0,false);
	ClearAll(2000);
	Wait(2000);
}