//<continuation number="60">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_009_インターミッション０２";
		$GameContiune = 1;
		Reset();
	}

	ch01_009_インターミッション０２();
}


function ch01_009_インターミッション０２()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//☆Cut-60-----------------------------
//■インターミッション０２
//ＢＧ//黒
//以下、あやせのセリフは歌。アカペラで。

	IntermissionIn();

	FadeDelete("*", 0, true);
	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	Request("レンズ１", UnLock);
	Delete("レンズ１");
	Request("レンズプロセス１", UnLock);
	Delete("レンズプロセス１");

	IntermissionIn2();

//ＳＥ//明治通り（音量小さく）
	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 0, 700, 0, 1000, null, true);


	Wait(2000);

//名前表示なし

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/ayase_akapera2">
//■３６０
//「杭を打て　杭を打て――」
//ayase_akapera2
//【あやせ】
「Fly and cross Fly and cross 約束は今――」

//ayase_akapera3
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/ayase_akapera3">
「Fly and cross Fly and cross 果たされるから――」

//ayase_akapera4
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/ayase_akapera4">
「Fly and cross Fly and cross 解き放たれた――」

//ayase_akapera5
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/ayase_akapera5">
「Fly and cross Fly and cross 終末――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
深夜の宮下公園に、澄んだ歌声が響く。

//ＣＧ//深夜の宮下公園で空を見上げながら歌うあやせ
{	CreateTextureEX("ズーム", 100, @-400, @-240, "cg/ev/ev008_01_4_INT02あやせ歌う_a.jpg");
	Request("ズーム", Smoothing);
	Fade("ズーム", 300, 1000, null, false);
	Move("ズーム", 2000, @+400, @0, Dxl1, false);
	Delete("背景１");}
明治通りにかかる歩道橋。
橋の下ではひっきりなしに車が通りすぎていく。

その雑音を気にする素振りすら見せず、橋の手すりにもたれかかって、人々からＦＥＳと呼ばれている少女は歌う。

{	CreateTextureEX("あやせ", 200, Center, Middle, "cg/ev/ev008_01_4_INT02あやせ歌う_a.jpg");
	Zoom("あやせ", 0, 500, 500, null, false);
	Fade("あやせ", 300, 1000, null, true);}
//名前表示なし
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/ayase_akapera6">
//「闇夜を切り裂き　月光を浴びて――」
//ayase_akapera6
//【あやせ】
「月夜の光が　示された従者よ――」

ギャラリーは誰もいなかった。
彼女がストリートで歌えばおそらく１００人以上が立ち止まり、その歌声を聴きたがるだろう。

だがＦＥＳは今、意識的に、密やかな夜のとばりの中へと自らの存在を溶け込ませていた。

{	FadeDelete("あやせ", 500, true);}
//名前表示なし
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/ayase_akapera7">
//「幾千もの鉄槌は　汝の痛みとなりて　今解き放たれる――」
//ayase_akapera7
//【あやせ】
「この場所へ繋がる　幻の道――」

ただ静かにこの場にたたずむだけでいい。

そうすることで、闇と一体化して、この渋谷という街の汚れきった空気から一瞬でも解放される気がする。
ＦＥＳはそう感じていた。

//名前表示なし
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/ayase_akapera8">
//「やがて叫びは宙に舞い　夜空は紅く染まるだろう――」
//ayase_akapera8
//【あやせ】
「叫びはいつしか　沈黙に変わって――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Move("ズーム", 2000, @-525, @+160, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
ふとＦＥＳは、夜空を見上げる。

さっきまで一面を覆っていた雲は少しずつ晴れてきて、わずかに月明かりも射し込むようになった。

だが、渋谷の煌々とした街の灯に照らされ、星のためらいがちな瞬きはかき消されてしまっている。

//名前表示なし
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/ayase_akapera9">
//「十字の杭は力となり　やがて聖域へと辿り着く……」
//ayase_akapera9
//【あやせ】
「落ちてゆく安息　風に手と手を繋いで……」

ＦＥＳは口を閉ざし、ゆっくりと手を空へと掲げる。

//以下のセリフは普通のセリフ。歌じゃないです
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/00900060ay">
「その目だれの目？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundStop("SE01");

	ClearAll(1000);
	Wait(3000);
//～～Ｆ・Ｏ
//■インターミッション０２終了

}
