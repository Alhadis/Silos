

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_159_優愛編_食べて";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_159_優愛編_食べて();
}


function chy_159_優愛編_食べて()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★優愛編
//ＢＧ//拓巳の部屋
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("back01", 0, 0, null, true);

	Wait(1500);
	Fade("back01", 1000, 1000, null, true);

	BGMPlay360("CH25",0,1000,true);

	Wait(500);
	Stand("bu優愛_制服_冷酷","cool", 200, @-150);
	FadeStand("bu優愛_制服_冷酷_cool", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
……１時間ほどが経った。
胃が、キリキリとする。
恐怖で、叫び出したいけど、できない……。

//◆ヤンデル。ボソボソ小声で
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800540yu">
「食べて」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800550yu">
「食べてよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800560yu">
「食べてって言ってるでしょう？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800570yu">
「食べて」

優愛はいまだに僕の目の前にいて、じっと見つめてきている。
パスタを巻き付けたフォークを、いまだに僕の口元に突き出している。
ずっと、その姿勢のままで。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800580yu">
「食べて」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800590yu">
「食べて下さい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800600yu">
「食べないと」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800610yu">
「食べて」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800620yu">
「食べてほしい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800630yu">
「食べて」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800640yu">
「食べなさい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800650yu">
「食べて」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800660yu">
「食べていいの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800670yu">
「食べなよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800680yu">
「食べろ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black", 1500, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

	DeleteStand("bu優愛_制服_冷酷_cool", 0, true);
	Wait(1000);
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
ひたすら、小声でボソボソとつぶやき続けていた。
すでに、１時間近くは経っている気がする。

あまりの不気味さに、僕は指一本すら動かせなくなっていた。
蛇ににらまれたカエルの気分だ。

危害を加えられたわけじゃない。
無理矢理口にパスタを押し込まれたりしたわけでもない。

それなのに、僕の中で優愛に対する恐怖がじわじわとせり上がってくる。

優愛はただひたすら、僕が“食べるのを待ち続けている”だけ。

それなのに、こんなにも不気味で恐ろしく感じるのは、普通だったら５分もすればあきらめるはずだからだ。それを、１時間以上もひたすら待ち続けているからだ。

こんなことなら“食えよコラ！”って、髪を引っつかまれて口を無理矢理開けさせられた方が、よっぽど普通だ。

優愛がなにを考えているのか分からない。

こいつは、異常だよ……。
壊れている。
同じ人間とは思えない。

怖い。怖い。怖い。怖い。怖い。怖い。怖い。怖い。怖い。怖い。怖い。

気持ちは完全に萎えてしまっていた。
もう許してくださいって土下座したかった。

全身に、イヤな汗がじっとりとにじんで。
精神的なプレッシャーのせいで、呼吸をするのさえためらわれた。

こんなに近い距離で、しかもこんなに長時間、女子に見つめられた経験なんてない。誰にだってあるもんか！

例えば恋人同士で、甘ったるい会話とかしてるなら別にいいよ！

でも優愛は真顔で、冷たい目で、同じ言葉を延々と繰り返し続けてるんだぞ！　こんなシチュエーション、普通は存在しない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("Black", 500, 0, null, true);

	Stand("bu優愛_制服_冷酷","cool", 200, @-150);
	FadeStand("bu優愛_制服_冷酷_cool", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800690yu">
「食べて」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800700yu">
「食べなさい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800710yu">
「食べてよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800720yu">
「食べて下さい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800730yu">
「食べろ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00800740ta">
「た……」

これ以上は、視線に耐えられなくて。
思い切って声を絞り出した。
声がかすれてしまった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00800750ta">
「食べるよ……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800760yu">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("@CH*", 1000, 0, null);

//◆以上、ヤンデル口調

	CreateSE("SE3601","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE3601",2000,400,0,1000,null,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
優愛のつぶやきが止まった。
ピクリとも動かない。
まだ、同じ姿勢。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00800770ta">
「う、うぅ……」

僕は、無理矢理口を開いた。

１時間以上、差し出され続けたままのパスタを、恐る恐る食べる。

パスタはすでにパサパサで、ただでさえ乾いてしまっている口内の水分をさらに奪っていった。

味わっている余裕なんてなく、ほとんど噛まずに嚥下する。

優愛がそれを見て、何度かまばたきした。
石像みたいに止まっていたのが、ようやく動き出す。

{	Stand("bu優愛_制服_通常左手下","hard", 200, @-150);
	FadeStand("bu優愛_制服_通常左手下_hard", 300, true);
	DeleteStand("bu優愛_制服_冷酷_cool", 0, true);}
//◆普通口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800780yu">
「…………おいしい？」

おいしいわけ、ないだろ……。
そう思ったけど、言えるわけがなくて。
僕は、小さくうなずいた。

//◆普通口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800790yu">
「……よかったです」

{	DeleteStand("bu優愛_制服_通常左手下_hard", 300, true);}
優愛は、まったく嬉しそうな素振りも見せず、真顔のままでそう言って。
フォークを、持っている皿の方へ。

{	CreateSE("SE01","SE_擬音_脳みそ");
	MusicStart("SE01",0,500,0,1000,null,false);}
乾燥し、塊みたいにくっついてしまっているパスタを、またフォークで持ち上げて。再び僕の口元へ。

全部、食べろってことなの……？
食べなくちゃ、解放してくれないの……？
もう、勘弁してよ……。

涙が溢れた。
怖くて仕方がない。

でも、いくら泣いたって、優愛はパスタを全部食べきるまで、この状態を続けるつもりみたいだった。

だから、僕は泣きながら、食べる。
パサパサの、くそまずいパスタを、食べさせられ続ける。

全部完食したときには、僕は精神的にも肉体的にも疲れ果てていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","hard", 200, @-150);
	FadeStand("bu優愛_制服_通常左手下_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800800yu">
「お腹いっぱいになりましたか？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800810yu">
「なりましたよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800820yu">
「なったはず」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800830yu">
「一生懸命、作った甲斐がありました」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_のぞく");
	MusicStart("SE01",0,1000,0,1000,null,false);

	DeleteStand("bu優愛_制服_通常左手下_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
冷たくそう言い放ち、優愛はようやく僕から離れた。
皿はパソコンデスクの上に置き、またソファに戻る。

そこに腰掛け、僕の方を見て。
凝視したまま、動きを止めた。

もう、僕を見るな……見ないでください……。

心の中で、ひたすらそう訴えた。
声を出すことすら怖くて、できなくなってしまった。

２４時間、僕は見られ続けるのかな。
こんなの、精神的拷問だ……。
そう思って、暗澹たる気分になった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00800840ta">
「なんで……こんなことするんだよ……」

泣きながら、そう聞いていた。
聞かずにはいられなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/00800850ta">
「ぼ、僕に、なんの恨みが、あって……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume("SE3601", 1000, 0, null);

	Stand("st優愛_制服_通常","sad", 200, @-150);
	FadeStand("st優愛_制服_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800860yu">
「……妹が、死んだんです」

え……？
妹……？

{	BGMPlay360("CH16", 1000, 1000, true);
	Stand("st優愛_制服_通常","hard", 200, @-150);
	FadeStand("st優愛_制服_通常_hard", 300, true);
	DeleteStand("st優愛_制服_通常_sad", 0, true);}
優愛は一瞬だけ、泣き出しそうな顔をした。
でもすぐに、元の冷徹な表情に戻る。

//◆以下、普通口調
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800870yu">
「『集団ダイブ』の被害者の一人。わたしの、双子の妹。美愛、って言います」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800880yu">
「わたしは、妹を殺した犯人を許さない。許さないって、思ってました」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800890yu">
「そして、あなたにたどり着いた」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800900yu">
「あなたの苦しみを、知りました」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800910yu">
「わたしは、妹がなぜ殺されなくちゃいけなかったのか、その真実を知りたい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800920yu">
「なぜ犯人が……『将軍』が、妹を殺したのか、知りたい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800930yu">
「それと、あなたも助けたい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800940yu">
「分かってください」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800950yu">
「分かってくれますよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800960yu">
「分かるはず」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/00800970yu">
「分かるはずです」

ミュウツベにアップされていた、『集団ダイブ』の映像。
あそこに映っていた、泣き叫ぶ被害者たちの中に、優愛の妹がいたのか……。

僕もつい最近、七海のことがあったから、優愛の気持ちは分からなくはない。

でも、だからって同情するつもりはないよ……。
僕の部屋に無断で押し入って、僕を監禁しているんだぞ。
同情なんて、できるはずない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	SetVolume360("CH*", 2000, 0, NULL);
	ClearAll(2000);
	Wait(1000);
}
