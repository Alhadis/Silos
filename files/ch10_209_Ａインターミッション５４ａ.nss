//<continuation number="620">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_209_Ａインターミッション５４ａ";
		$GameContiune = 1;
		$Ａルート = true;
		Reset();
	}

		ch10_209_Ａインターミッション５４ａ();
}


function ch10_209_Ａインターミッション５４ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション５４ａ
//ＢＧ//ノアⅡのあるドーム内
//ＳＥ//ノアⅡ稼働音

	IntermissionIn();

	DeleteAll();

	CreateTexture360("back10", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");


	IntermissionIn2();

	CreateSE("SE01","SE_擬音_のあII稼働音_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

	Wait(1000);

	Stand("st玄一_スーツ_通常","normal", 200, @0);
	FadeStand("st玄一_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
衆議院議員、猪鼻康三と、天成神光会教祖、<RUBY text="くらもち">倉持</RUBY><RUBY text="ゆうだい">雄大</RUBY>は、目の前で不気味な唸りを上げる巨大な装置――ノアⅡを見て、満足げにうなずいた。

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900010ih">
「５０００人を殺すと言い出したときは、どうなることかと思ったが」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900020kr">
「調整にはずいぶんと骨が折れたよ。特に、３００人委員会に勘付かれないようにするのはね」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900030nr">
「ご協力に感謝します」

野呂瀬が、わずかに頭を下げる。

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900040ih">
「だがこれが完成した今、５０００人などちっぽけな数字でしかなくなった」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900050kr">
「早くも影響が目に見えて出てきているよ。人々の家畜化が始まっている」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900060ih">
「これで、いよいよ我らが世界を手に入れる日も現実のものとなったわけだ」

猪鼻と倉持は、互いに顔を見合わせて、ニヤリと不穏な笑みを浮かべた。

それを、野呂瀬は眉ひとつ動かさずに見つめる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900070ih">
「しかし野呂瀬よ。貴様、なかなか興味深い趣味を持っているようじゃないか」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900080nr">
「なんのことでしょう」

猪鼻は、卑しそうな含み笑いをして、
ノアⅡの傍らに立てられている“オブジェ”へと顎をしゃくった。

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900090ih">
「なんとも芸術性に溢れるオブジェだ。ぜひワシにもひとつ、用意してもらいたいものだな」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900100kr">
「素材ならば、我が教団の信者の中から選りすぐりを提供してもよい」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900110ih">
「くく、倉持先生は気前がいい」

//◆憮然と
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900120nr">
「……あれは、餌ですよ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900130ih">
「餌？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900140nr">
「ノアⅡをより完璧なものにするための」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900150ih">
「まあ、そういうことにしておこう」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900160kr">
「それより、ノアⅡが具体的にどれほどのことができるのか、実演してもらいたいところだね」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900170ih">
「それはいい。早速やって見せたまえ」

野呂瀬は能面のように無表情を貫いたまま、小さく肩をすくめた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900180nr">
「では、このようなものはどうですか？」

野呂瀬がそう言い終えたときには、すでに“実演”は始まっていた。

ふと気付くと、猪鼻も倉持も、その手に拳銃を持っている。

ノアⅡも、野呂瀬も、まったくなんの変化も動作もしないまま、その奇跡のような出来事は現実となっていた。

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900190ih">
「ほう、本物そっくりだ」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900200kr">
「まるで手品のようだよ」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900210nr">
「手品と一緒にしてもらっては困ります」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900220nr">
「その銃の存在は、現実」

猪鼻と倉持は、銃をしげしげと眺めながら、再び満足そうにうなずく。

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900230ih">
「実に素晴らしい」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900240kr">
「いかにも。神をも超越する力だ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900250ih">
「この銃は記念にもらっておくとするか」

//◆小声
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900260nr">
「……小物ですね」

野呂瀬のそのかすかなつぶやきは、他の２人に聞こえることはなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900270ih">
「早速、今後の計画を検討しよう」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900280kr">
「まずは３００人委員会の排除を」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900290ih">
「野呂瀬。ご苦労だったな」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900300kr">
「今後のことは、追って連絡する」

２人はすっかり上機嫌で、足取りも軽くプラネタリウムから出ていこうとする。
だが――

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900310nr">
「その必要はありません」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900320ih">
「……なに？」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900330kr">
「どういうことだ？」

そこで初めて、野呂瀬の表情に変化が起きた。

{	Stand("st玄一_スーツ_通常","pride", 200, @0);
	FadeStand("st玄一_スーツ_通常_pride", 300, true);
	DeleteStand("st玄一_スーツ_通常_normal", 0, true);}
目を細め、わずかに顎をそらして、その長身から２人を見据える。それはまるで見下しているかのような態度。

いや、現実に、彼は２人を見下していた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900340nr">
「計画は私が引き継ぎましょう。ただし、あなた方の考えているような低俗な目的ではなく、より崇高な理由のために、です」

野呂瀬はあくまでも丁寧な口調を続ける。
だがその言葉の意味に気付き、当然のように猪鼻も倉持も激昂した。

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900350ih">
「貴様、裏切るのか！」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900360kr">
「神にでもなったつもりかね？」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900370ih">
「３００人委員会が黙ってはおらんぞ！」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900380nr">
「おふたりも、３００人委員会のメンバーでありながら、反旗を翻そうとしていたではありませんか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
野呂瀬の、２人を捉える瞳。
そこにある感情は――蔑み。

汚いものでも見るような冷たい視線が意味するもの。それは彼がこれまでずっと、猪鼻と倉持をただ利用してきただけだということだ。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900390nr">
「これは、すべて予定通りの行動ですよ」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900400nr">
「あなた方がここで死ぬことも含めて」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch10/20900410ih">
「ふざけるな！」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch10/20900420kr">
「戯れ言を！」

倉持と猪鼻は、揃って銃口を野呂瀬へと向ける。
引き金に手をかけた。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900430nr">
「戯れ言ではなく――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//銃声×２

	CreateColor("色１", 300, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 1000, null, true);

	CreateSE("SE02","SE_衝撃_じゅう声");
	CreateSE("SE03","SE_衝撃_じゅう声");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	MusicStart("SE03", 0, 500, 0, 1000, null, false);

	Fade("色１", 1000, 0, null, false);

	WaitAction("SE02", 300);

	Fade("色１", 0, 1000, null, true);

	CreateSE("SE03","SE_衝撃_じゅう声");
	CreateSE("SE04","SE_衝撃_じゅう声");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	MusicStart("SE04", 0, 500, 0, 1000, null, false);

	Fade("色１", 200, 0, null, true);
	Delete("色１");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
ふたつの銃が同時に火を噴き。
ドーム内に、轟音が響き渡った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//人が倒れる音×２

	CreateSE("SE04","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE04", 300, 700, 0, 1000, null, false);

	WaitAction("SE04", 300);

	CreateSE("SE05","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE05", 100, 700, 0, 1000, null, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900440nr">
「予知、だったのですが」

倒れたのは、野呂瀬ではなく、猪鼻と倉持。

なぜか彼らは、引き金を引く直前で、銃の狙いを野呂瀬から外し、お互いを撃ち合ったのだ。

即死――。

互いの額に穴を開け仲良く倒れた２人にすでに息はなく、ただの肉の塊と化していた。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900450nr">
「ノアⅡは、我が手にあります」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900460nr">
「俗物には、その意味がお分かりにはならなかったようだ」

野呂瀬が２人に見せた“実演”は、銃を出すだけではなかった。彼らに、お互いを野呂瀬だと勘違いさせ、殺し合わせる。

そこまでが“実演”。

ノアⅡの力をもってすれば、それはあまりにも造作のないことだった。

野呂瀬は“オブジェ”へと向き直る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("st玄一_スーツ_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
そこには、張り付けにされた咲畑梨深の姿があった。

梨深は七海を解放するように懇願し、野呂瀬はそれを了承する代わりに彼女を人質とした。

七海に精神攻撃を受けたせいか、梨深からはほとんど生気が失われ、今も張り付けにされて力なくうなだれている。

だが野呂瀬が近づくと、わずかに肩を震わせた。

//◆弱々しい声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20900470ri">
「自分の……手を汚さずに……卑怯なことばっかり……」

//◆弱々しい声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20900480ri">
「あなたこそ……俗物だよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 300, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);

//ＳＥ//頬を打つ
	CreateSE("SE02","SE_衝撃_びんたされる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Shake("back10", 100, 100, 0, 0, 0, 500, null, false);

	Fade("色１", 50, 1000, null, true);
	FadeDelete("色１", 100, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20900490ri">
「……っ」

野呂瀬の手の甲が、梨深の頬を打つ。
それから、野呂瀬は彼女の顎をつかみ、無理矢理自分の方を向かせた。

表情は死んでいると言うのに、梨深の薄く開かれた目だけは、今も爛々と輝き野呂瀬を射ている。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900500nr">
「なぜ、ニシジョウタクミに助けを求めないのです？」

梨深の耳元で、野呂瀬はささやく。

//◆弱々しい声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20900510ri">
「彼を……巻き込まないで……」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900520nr">
「どちらの“彼”のことを言っているのですか？」

//◆弱々しい声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20900530ri">
「２人とも……だよ……」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900540nr">
「私としては、どちらかひとりでじゅうぶんですがね」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900550nr">
「Ｉｒ２を生み出した者と、その完全なるコピー」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900560nr">
「２人とも、化け物じみた力を持っている」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900570nr">
「彼らどちらかのＣＯＤＥサンプルが手に入れば、ノアⅡはより完璧へと近づくでしょう」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900580nr">
「神をも超える力を得るのです」

//◆ブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20900590ri">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
梨深が辛そうに目を伏せる。

野呂瀬は彼女の顎をつかんでいた手を乱暴に振り払うと、ノアⅡを見上げ、唇の端に笑みを浮かべた。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900600nr">
「さあ、呼びかけなさい」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900610nr">
「どちらでもいい」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/20900620nr">
「私は、歓迎しますよ」

むしろ、彼は心待ちにしていた。
西條拓巳が、野呂瀬の出した“試験”を乗り越えて、この場にやって来るのを。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	ClearAll(1500);
	Wait(1500);
//～～Ｆ・Ｏ

//■インターミッション５４ａ終了

//アイキャッチ

}