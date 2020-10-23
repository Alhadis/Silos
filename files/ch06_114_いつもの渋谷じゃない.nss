//<continuation number="100">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_114_いつもの渋谷じゃない";
		$GameContiune = 1;
		Reset();
	}

		ch06_114_いつもの渋谷じゃない();
}


function ch06_114_いつもの渋谷じゃない()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	ClearAll(0);
	Delete("*");

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg014_02_0_神泉町並み_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	CreateSE("SE01","SE_日常_消ぼうきゅう急車_サイレン遠く_LOOP");
	SoundPlay("SE01", 0, 1000, true);

	Wait(500);
//ＢＧ//神泉町の街並み//昼
//ＳＥ//遠くで消防車や救急車のサイレンが聞こえている

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
外の冷たい空気に当たると、頭痛が少しやわらいだ。

街にはいつもよりも落ち着かない雰囲気が漂っている。やっぱりさっきの地震の影響なのかな……。

遠くでサイレンの音が途切れることなく響き続けている。消防車のものなのか、救急車のものなのかは判断がつかない。たぶん両方だろう。

僕が今歩いている道を一本隔てて走っている山手通りは、すごく渋滞していた。

何台かの車が正面衝突の事故を起こしていて、そのまま道路に放置されている。運転手の姿は見当たらなかった。

渋滞が起きているのはその放置された車のせいで、他のドライバーたちはみんな狂ったようにクラクションを鳴らし続けている。

学校に向けてフラフラと歩いていたら、目の前を一匹の犬が吠えながら横切っていく。

そのチワワは目を血走らせ、リードを引きずりながら小さい身体で全力疾走をしていた。

開いた口から大量のよだれが垂れている。
飼い主とはぐれたんだろうか。

それを呆然と見送っていたら、つまずいて転びそうになった。

アスファルトにひび割れがあって、わずかに段差ができていた。

これ、地震のせいでできたものなのかな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg002_01_1_青空_a.jpg");
	Fade("背景２", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
その場に立ち止まり、空を見上げてみる。

今はくすんだ水色の中に小さな雲がいくつか、のんびりと漂っているだけだ。

地震の直後は、まるでオーロラみたいに白く染まっていたらしいけど、その痕跡はもうどこにも見ることができない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景２", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
――いつもの渋谷じゃない。

ひどく、落ち着かない気分だ。

地震の影響……だけじゃない。
頭痛のせい……だけでもない。

それだけじゃなくて、
衝動に襲われそうになる。

こうして歩いているだけで、なぜか、とても、

誰かを、殺してしまいたくなるような――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 2000, 0, false);

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

//～～Ｆ・Ｏ

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg016_02_0_学校校門_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Fade("色１", 0, 0, null, true);

	CreateSE("SE10","SE_はいけい_生と_悲鳴とどよめき");
	MusicStart("SE10",1000,200,0,1000,null,true);

//ＢＧ//翠明学園校門//昼

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
校門の前まで辿り着いた頃には、不安や恐怖心はますます強くなっていた。

寒気がする。
身体の震えが止まらない。
頭痛がまたぶり返す。

よく見ると、３年生の校舎のあたりに人だかりができている。

そこに梨深の姿を探した。

不思議なことに、みんながみんな、倣ったように校舎の上の方を仰ぎ見ている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE10", 2000, 400, null);

	CreateTexture360("背景３", 100, 0, 0, "cg/bg/bg043_01_1_学校中庭_a.jpg");
	DrawTransition("背景３", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Stand("st大輔_制服_通常","sigh", 200, @+100);
	FadeStand("st大輔_制服_通常_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【三住】
<voice name="三住" class="三住" src="voice/ch06/11400010mi">
「お、タク！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_足_走る_LOOP");
	DeleteStand("st大輔_制服_通常_sigh", 500, false);
	SoundPlay("SE01", 0, 800, true);
	Wait(1000);
	SoundPlay("SE01", 500, 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
僕に駆け寄ってきたのは、三住くんだった。

ちょうどいい、梨深がどこにいるか、彼に聞けば……

{	Stand("bu大輔_制服_通常","sigh", 200, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 400, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch06/11400020mi">
「お前今日学校来てたんだな」

//【三住】
<voice name="三住" class="三住" src="voice/ch06/11400030mi">
「いや、そんなん今はどうでもいいか……」

やけに深刻そうで、表情も青ざめている。
こんなに動揺している三住くんは珍しい。

いったいどうしたんだろう。

//【三住】
<voice name="三住" class="三住" src="voice/ch06/11400040mi">
「マジで……やばいよな、あれ……」

やばい？
なにが？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateTextureEX("背景１", 300, 0, 0, "cg/ev/ev064_01_1_あやせ飛び降りようと_a.jpg");
	Move("背景１", 0, @0, @-1536, null, true);
	Fade("背景１", 500, 1000, null, true);

	DeleteStand("bu大輔_制服_通常_sigh", 0, true);

	SetVolume("SE10", 2000, 600, null);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆以下の会話は小声で
//【生徒Ａ】
<voice name="生徒Ａ" class="生徒Ａ" src="voice/ch06/11400050ea">
「病気だったんだろ？」

//【生徒Ｂ】
<voice name="生徒Ｂ" class="生徒Ｂ" src="voice/ch06/11400060eb">
「精神病のことがバレて、余計におかしくなっちゃったらしいぜ」

//【生徒Ａ】
<voice name="生徒Ａ" class="生徒Ａ" src="voice/ch06/11400070ea">
「さっき飛べるとか言ってたぜ。ヤベーよ、やばすぎる……へへへ」

//【生徒Ｂ】
<voice name="生徒Ｂ" class="生徒Ｂ" src="voice/ch06/11400080eb">
「俺、人が死ぬとこマジで見てぇんだけど」

//【生徒Ａ】
<voice name="生徒Ａ" class="生徒Ａ" src="voice/ch06/11400090ea">
「きっとグロすぎて最高だぜ……」

//【生徒Ｂ】
<voice name="生徒Ｂ" class="生徒Ｂ" src="voice/ch06/11400100eb">
「早く落ちてこねえかな……」

周囲からも、そんな話し声が僕の耳に入ってくる。

もしかして……

イヤな予感がした。

周囲の生徒たちの視線を追って、僕も恐る恐る、校舎を見上げる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);
	Move("背景１", 2000, @0, @1536, AxlDxl, true);

	SoundPlay("SE*", 2000, 0, false);

//ＣＧ//飛び降りようとしているあやせ
//※下から見た光景

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
屋上の縁に――

ひとりの女子が立っていた。

手には、ライブのときと同じ、あのディソードを持って。
天上の神に祈りを捧げるかのような姿勢で。

岸本あやせが、立っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);

	Wait(2000);

}