//<continuation number="630">

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_160_あやせ編_邪心昇華の儀式";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_160_あやせ編_邪心昇華の儀式();
}


function cha_160_あやせ編_邪心昇華の儀式()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編
//ＢＧ//あやせの病室・夜
//※↑夜差分、新規作成お願いします……。電気は点いていない
//▼べー：ＢＧ：夜差分ダミーありません。とりあえず代替、必要であれば発注お願いします
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg102_02_3_chnあやせ病室_a.jpg");
	Fade("back01", 0, 0, null, true);

	CreateSE("SE3601","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE3601",2000,1000,0,1000,null,true);

	Fade("back01", 1000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
食事の後、あやせは日が暮れたことにも気付いていない様子で、延々とグラジオール記黙示録詩編について語り続けた。窓の外が暗くなっても部屋の明かりを点けるのを忘れるくらい、一生懸命に。

もっとも、その内容はこれまでに話してもらったことをより詳しくしただけで、大まかなことはほとんどすでに聞かされたものだった。

あやせの語り口は常に淡々としているから、すごく眠くなる。

将軍の存在を考えると居眠りしてる場合じゃないんだけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_通常","normal", 250, @-50);
	FadeStand("buあやせ_制服_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900010ay">
「……というわけなのよ。理解できた？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900020ta">
「え？　あ、う、うん……」

ちっとも聞いてなかったけど、ひとまずうなずいておく。
するとあやせは目を細め、僕の方に詰め寄ってくる。

{	Stand("buあやせ_制服_通常","hard", 250, @-50);
	FadeStand("buあやせ_制服_通常_hard", 300, true);
	DeleteStand("buあやせ_制服_通常_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900030ay">
「聞いてなかったのね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900040ta">
「う……」

あやせでも、怒ることってあるんだろうか。
いつもマイペースで感情に起伏があるように見えないんだけど。
もし怒らせちゃったのなら、謝るべきかも……。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900050ay">
「それも、邪心に染まっているせいよ」

ま　た　邪　心　か。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//※↑わざとスペース入れてます



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900060ay">
「先に取り除かなくてはならないようね。キミを侵食した邪心を」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900070ay">
「でなければ、純粋なる邪心は培養されない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900080ta">
「と、取り除く……？」

それって、なにをされるんだろう……。
外科手術的なものを連想して、僕は身を震わせた。

でもどうやら違うらしい。
あやせはなぜか少し切なげな表情をして、唇を舐めた。かすかに見えたピンク色な舌が、すごく色っぽかった。

{	Stand("buあやせ_制服_通常","shy", 250, @-50);
	FadeStand("buあやせ_制服_通常_shy", 300, true);
	DeleteStand("buあやせ_制服_通常_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900090ay">
「キミの邪心を取り除くためなら、なんでもするわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900100ay">
「望みがあったら言って」

な、なんでもするのか……。
邪心を取り除くっていうのが、なにを意味するのかは分からないけど。

そ、そうだな、じゃあ、とりあえず……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900110ta">
「キ、キ、キスでもしてもらおうか」

{	Stand("buあやせ_制服_通常","hard", 250, @-50);
	FadeStand("buあやせ_制服_通常_hard", 300, true);
	DeleteStand("buあやせ_制服_通常_shy", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900120ay">
「…………」

あやせが表情を厳しくしたのが、この暗い中でも分かった。

うっ、調子に乗りすぎたかも……。
嫌われて見捨てられるかもしれないって思って、慌てて謝ろうとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	CreateSE("SE01","SE_じん体_掴む");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 200, 1000, null, true);
	DeleteStand("buあやせ_制服_通常_hard", 0, true);
	Delete("back*");

	Wait(700);

	CreateSE("SE03","SE_じん体_動作_のぞく");
	CreateSE("SE02","SE_日常_ふりーじあどあ閉まる");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
でもその余裕も与えてもらえず、僕はあやせに胸ぐらをつかまれる。
引っ張られ、クローゼットに強引に押し込まれた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900130ta">
「ちょ、なにを……っ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900140ay">
「シッ」

{	SetVolume("SE3601", 1000, 500, null);
	MusicStart("SE03",0,1000,0,1000,null,false);
	Wait(300);
	MusicStart("SE02",0,1000,0,1000,null,false);}
と、あやせは僕の身体に密着してきた。
ぴたっと引っ付いた状態で、クローゼットの扉を閉めてしまう。

//◆息を殺しているブレス
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900150ay">
「…………はぁ。…………はぁ」

狭い。そもそも人が入るべき場所じゃない。
そこに２人も入ったら、イヤでもくっつくしかない。

しかもあやせの押し殺したような吐息が耳に届いてくるし。
暗いせいか、すごく興奮してしまう。

//◆小声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900160ta">
「ど、ど、ど、どうしたの……？」

//◆小声
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900170ay">
「看護師の見回りよ」

なるほど、だからこうして隠れたのか。
夜の面会は禁止されてるし、部外者が勝手に泊まるなんて許されないから、もし見つかったら僕は締め出されるだろう。

でも、あやせも一緒に隠れちゃ意味がないじゃないか……！

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900180ay">
「この病院にも、敵は多いわ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900190ta">
「て、敵……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900200ay">
「グラジオールの使い。私たちの心を支配しようと、虎視眈々と狙っているのよ」

看護師が、敵だって言うの？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900210ta">
「そ、それって、ただの被害妄想――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900220ay">
「静かに……！」

なにを思ったのか、あやせはいきなり僕の唇を塞いできた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1000, 0, null);

//ＣＧ//あやせと密着状態でキスする
	CreateTexture360("アヤキス１", 100, 0, 0, "cg/ev/ev127_01_6_あやせキス_a.jpg");
	Zoom("アヤキス１", 0, 1500, 1500, null, true);


	BGMPlay360("CH12",0,1000,true);

	Zoom("アヤキス１", 1000, 1000, 1000, Dxl1, false);
	Fade("Black", 500, 0, null, true);

	Wait(500);

	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900230ta">
「……！？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900240ay">
「ん……ふぅ……ふぁ……ぅ……」

あやせの柔らかい唇の感触。

その衝撃に僕は完全に頭が真っ白になった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：演出：のぞき演出後で
//ＳＥ//病室のドアを開ける
//ＳＥ//ヒュンヒュンという機械的な音
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	MusicStart("SE03", 500, 500, 0, 1000, null, true);


	Fade("Black", 200, 1000, null, true);

	CreateTexture360("のぞき", 90, 0, 0, "cg/ev/ev127_01_7_あやせキス_a.png");
	CreateTexture360("病室背景", 80, 0, 0, "cg/bg/bg102_02_3_chnあやせ病室_a.jpg");
	Fade("アヤキス１", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
そのとき、病室のドアが開く音がした。
と同時に、奇妙な機械音も聞こえ出す。
足音を殺しながら、何者かが入ってきて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("Black", 500, 0, null, true);
	Stand("bu志乃_白衣_通常","cool", 85, @450);
	Move("bu志乃_白衣_通常_cool*", 0, @0, @25, null, true);
	FadeStand("bu志乃_白衣_通常_cool", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//◆葉月は諏訪と電話中です
//【葉月】
<voice name="葉月" class="葉月" src="voice/chn05/00900250hd">
「……いないわ」

女性の声がした。
どこかで聞いたことがあるような気もするけど、はっきりとは思い出せない。

//【葉月】
<voice name="葉月" class="葉月" src="voice/chn05/00900260hd">
「逃げられたのかしら」

//【葉月】
<voice name="葉月" class="葉月" src="voice/chn05/00900270hd">
「まさか私たちの正体に気付かれた？」

//【葉月】
<voice name="葉月" class="葉月" src="voice/chn05/00900280hd">
「……ええ。不用意に接触しすぎたのかもしれない」

誰かと話しているように思えるけど、相手の声は聞こえてこない。
ということはケータイで話しているのか。

あやせの唇は、いまだに僕の唇から離れようとしない。
甘い香りが漂う。あやせはとてもいい匂いがする。

それに唇だけじゃなくて、押しつけられた胸も、肩も、腰も、太ももも、それに髪も。とても柔らかい。

クローゼットの扉を一枚隔てた向こう側に、危険な人物がいるかもしれないっていうのに、僕の意識はぼうっとしていて、いつまでもこの快感に身を委ねていたいって思った。

//【葉月】
<voice name="葉月" class="葉月" src="voice/chn05/00900290hd">
「……そっちの処理は済んだ？」

//【葉月】
<voice name="葉月" class="葉月" src="voice/chn05/00900300hd">
「そう、これからなのね。分かったわ。私はスクランブル交差点に向かうから」

//【葉月】
<voice name="葉月" class="葉月" src="voice/chn05/00900310hd">
「それじゃあね」

//◆護＝まもる。諏訪護のこと
//【葉月】
<voice name="葉月" class="葉月" src="voice/chn05/00900320hd">
「……護。……あなたに、神光の救いあれ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_日常_けい帯ボタン押す");
	CreateSE("SE05","SE_日常_びょういんどあ_閉まる");
	CreateSE("SE06","SE_じん体_動作_足_すりっぱ足音");

	Fade("Black", 500, 1000, null, true);
	Delete("のぞき");
	Delete("病室背景");
	DeleteStand("bu志乃_白衣_通常_cool", 0, true);

//ＳＥ//ケータイを切る「ピ」
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	Wait(500);

	MusicStart("SE06", 0, 1000, 0, 1000, null, false);

//おがみ：SE位置変えます
//ＳＥ//病室の扉が閉まる
	SetVolume("SE03", 500, 0, null);
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	SetVolume("SE06", 3000, 0, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
どうやら会話は終わったみたいだった。
やがてその不審な女は無言のまま病室を出て行った。

外の気配は完全に、消えた。
もう出ても平気のはずだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("アヤキス１", 0, 1000, null, true);
	FadeDelete("Black", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
だけどあやせは、なおも僕を解放してくれない。

一瞬だけ、唇を離した。
とろんとして潤んだ瞳で、僕を見て。

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900330ay">
「拓巳……」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900340ay">
「私は導き手。キミが、救世主」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900350ay">
「そう決まっているの」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900360ay">
「だから、なにをしてもいいのよ。私に」

//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900370ay">
「かなえてあげるわ。キミの、どんな望みでも……」

言っていることの意味はよく分からなかった。
これはいつもの妄想なのかなって思ったけど、別にどっちでもよかった。


//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900380ay">
「拓巳……拓巳……」

再びあやせにキスされる。しかも今度はぬるぬるとした舌が僕の歯をかき分けるように口内に押し入ってきて。僕の舌に、ねっとりと絡み付いてくる。

なにもかもどうでもよくなった。
僕はあやせの細くてしなやかな腰を抱き寄せ、快楽に身を委ねる。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900390ay">
「んっ……ふ……ぅ……ぅん……ぁ……」

少し息苦しかった。
あやせの熱い吐息を吸う。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900400ay">
「ぅっ……ぁ……ん……んぁ……ふ……」

あやせの唾液が注ぎ込まれてくる。とても甘い。
こくりと、僕は音を立ててそれを飲む。

頭の芯が、麻痺したように痺れている。
三次元のあまりの気持ちよさに僕は圧倒されていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("@CH12", 200, 0, null);

	Wait(200);
//ＳＥ//遠くで銃声
	CreateSE("SE06","SE_はいけい_じゅう声_遠");

	CreateColor("Black", 100, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 0, 1000, null, true);

	MusicStart("SE06", 0, 1000, 0, 1000, null, false);

	Delete("アヤキス１");

	Wait(600);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900410ay">
「……っ！？」

/PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_ふりーじあどあ開ける");
	MusicStart("SE01",0,1000,0,1000,null,false);


//ＢＧ//あやせの病室・夜
	CreateTexture360("back", 90, 0, 0, "cg/bg/bg102_01_3_chnあやせ病室_a.jpg");
	CreateTexture360("下敷き", 80, 0, 0, "cg/bg/bg102_01_3_chnあやせ病室_a.jpg");
	DrawTransition("アヤキス１", 500, 1000, 0, 100, null, "cg/data/right3.png", true);
	Delete("アヤキス１");

	CreateSE("SE3601","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE3601",2000,1000,0,1000,null,true);

	Delete("Black");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
遠くで、乾いた音がしたような気がした。
あやせがハッとした様子で身を離す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_通常","hard", 250, @-50);
	FadeStand("buあやせ_制服_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//◆ささやき
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900420ay">
「今の音は……？」

あやせの唇は、僕と彼女の唾液が混じり合ってぬらぬらと濡れている。暗い部屋でもそれがはっきりと分かった。

音なんてどうでもいいから、もっとあやせたんとチュッチュしたいよぉ。できればそのさらに先まで……。うは、ついに僕も脱童貞ｋｔｋｒ！

でも待てよ？　あやせって過去に男とそういうことしたことあるのかな。もし非処女だったらドン引きじゃね？　……と感じてしまうのは僕がエロゲ的思考回路に冒されてるせいかな？

いいや、きっとあやせに経験はないはずだ！
こんなデンパな女を相手にするリア充なんていないさ。
なにしろあの三住君でさえ逃げ出すぐらいだし。

{	Stand("buあやせ_制服_通常","angry", 250, @-50);
	FadeStand("buあやせ_制服_通常_angry", 300, true);
	DeleteStand("buあやせ_制服_通常_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900430ay">
「ヘラヘラしていないで、拓巳」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900440ta">
「サーセン、ふひひ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ビンタする
	CreateSE("SE07","SE_衝撃_びんたされる");

	CreateColor("痛い", 1000, 0, 0, 1280, 720, "White");
	Fade("痛い", 0, 0, null, true);

	MusicStart("SE07", 0, 1000, 0, 1000, null, false);
	Fade("痛い", 100, 800, null, true);
	Shake("back", 500, 5, 10, 0, 0, 500, null, false);
	FadeDelete("痛い", 200,. true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆ビンタされた
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900450ta">
「……っ！？」

いきなり引っぱたかれた。
僕の浮かれた気分は一発で吹き飛んでしまった。

逆に、不安になってくる。
泣きそうな気分。

厳しい表情を向けてくるあやせに、たまらずすがりついた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900460ta">
「ご、ご、ごめん……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900470ta">
「き、嫌わないで……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900480ay">
「邪心に支配されるのではなく、邪心を己に取り込むのよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900490ay">
「でなければ、黒騎士として目覚めることはできない」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900500ay">
「それを忘れないで」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900510ta">
「う、うん……」

相変わらず邪心っていう概念はよく分からないけど、僕が浮かれたのはあやせがキスしてきたからじゃないかって思った。でも、それを口にするのはやめておいた。

{	Stand("buあやせ_制服_通常","hard", 250, @-50);
	FadeStand("buあやせ_制服_通常_hard", 300, true);
	DeleteStand("buあやせ_制服_通常_angry", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900520ay">
「行くわよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900530ta">
「ど、どこへ……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900540ay">
「銃声だったわ、さっきの音」

銃声……！？
この日本の、しかも病院で、銃声だって？

確かに、そう聞こえなくもなかったけど……。
銃声なんて、ゲームや映画でしか聞いたことがないから、まるで実感がわかない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900550ta">
「じゅ、銃声だったとして、なにをしに行くの……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900560ay">
「これもまた、予言にあったわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900570ay">
「すでに邪心王との戦いは始まっているのよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900580ay">
「黒騎士の心が殺されていく」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900590ay">
「だから回収するの。ディソードを」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900600ay">
「私たちにできるのは、それだけ」

黒騎士が……殺されていくって……？
さっきの銃声で、誰かが撃たれたって言うの？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/00900610ta">
「け、警察に……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900620ay">
「ダメよ。警察も邪心に支配されてしまっている」

デンパだ。いや、デンパで片付けられることじゃない。
あやせの言っていることは、めちゃくちゃだ……。

グラジオール記黙示録詩編はあやせの妄想。
あやせが語ることはすべて、妄想。

あやせはどんな結末を望んでいるんだ……。
僕は、どうすればいいんだ。

{	DeleteStand("buあやせ_制服_通常_hard", 500, true);
	CreateSE("SE02","SE_日常_びょういんどあ_開く");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/00900630ay">
「付いてきて、拓巳」

あやせは１人でさっさと病室を出て行った。
僕は、後に続くことをためらう。

そこでふと、気付いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1000, 500, null);

	Request("back", Smoothing);
	Zoom("back", 500, 2000, 2000, AxlDxl, false);
	Move("back", 500, @-512, @-56, AxlDxl, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
さっきまで窓際に立てかけてあった３本のディソードが、消えている。

あやせが持って行ったんだろうか。

僕は唇を噛み、なおも少し逡巡した後、やむなく彼女の後を追った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 2000, 0, null);

	ClearAll(2000);
	Wait(1000);
}
