module SDOnlineConversionModule2(input clk, input reset,
    input [1:0] io_a,
    input  io_start,
    output[13:0] io_o
);

  wire[13:0] T637;
  wire[11:0] nextQ;
  wire[11:0] T0;
  wire[11:0] T1;
  wire[11:0] T2;
  wire[11:0] T3;
  wire[11:0] T4;
  wire[5:0] T5;
  wire[2:0] T6;
  wire[1:0] T7;
  wire T8;
  wire T9;
  wire T10;
  wire[11:0] inQM;
  reg [11:0] qm;
  wire[11:0] T638;
  wire[11:0] nextQM;
  wire[11:0] T11;
  wire[11:0] T12;
  wire[11:0] T13;
  wire[11:0] T14;
  wire[11:0] T15;
  wire[5:0] T16;
  wire[2:0] T17;
  wire[1:0] T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire[11:0] T24;
  wire[11:0] mask;
  reg [11:0] nextMask;
  wire[11:0] T639;
  wire[12:0] T640;
  wire[12:0] T25;
  wire T26;
  wire T27;
  wire T28;
  wire[11:0] T29;
  wire T30;
  wire T31;
  wire[11:0] T32;
  wire T33;
  wire T34;
  wire[11:0] T35;
  wire T36;
  wire T37;
  wire[11:0] T38;
  wire T39;
  wire T40;
  wire[11:0] T41;
  wire T42;
  wire T43;
  wire[11:0] T44;
  wire T45;
  wire T46;
  wire[11:0] T47;
  wire T48;
  wire T49;
  wire[11:0] T50;
  wire T51;
  wire T52;
  wire[11:0] T53;
  wire T54;
  wire T55;
  wire[11:0] T56;
  wire T57;
  wire[11:0] T58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  wire T63;
  wire T64;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire[2:0] T69;
  wire[1:0] T70;
  wire T71;
  wire T72;
  wire T73;
  wire T74;
  wire T75;
  wire T76;
  wire T77;
  wire T78;
  wire T79;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire T85;
  wire[5:0] T86;
  wire[2:0] T87;
  wire[1:0] T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire T94;
  wire T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire T102;
  wire T103;
  wire[2:0] T104;
  wire[1:0] T105;
  wire T106;
  wire T107;
  wire T108;
  wire T109;
  wire T110;
  wire T111;
  wire T112;
  wire T113;
  wire T114;
  wire T115;
  wire T116;
  wire T117;
  wire T118;
  wire[11:0] T119;
  wire[11:0] T120;
  wire[11:0] T121;
  wire[5:0] T122;
  wire[2:0] T123;
  wire[1:0] T124;
  wire T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire[11:0] T130;
  wire T131;
  wire T132;
  wire T133;
  wire[11:0] T134;
  wire T135;
  wire T136;
  wire[11:0] T137;
  wire T138;
  wire T139;
  wire[11:0] T140;
  wire T141;
  wire T142;
  wire[11:0] T143;
  wire T144;
  wire T145;
  wire[11:0] T146;
  wire T147;
  wire T148;
  wire[11:0] T149;
  wire T150;
  wire T151;
  wire[11:0] T152;
  wire T153;
  wire T154;
  wire[11:0] T155;
  wire T156;
  wire T157;
  wire[11:0] T158;
  wire T159;
  wire T160;
  wire[11:0] T161;
  wire T162;
  wire[11:0] T163;
  wire T164;
  wire T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  wire T172;
  wire T173;
  wire[2:0] T174;
  wire[1:0] T175;
  wire T176;
  wire T177;
  wire T178;
  wire T179;
  wire T180;
  wire T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire T186;
  wire T187;
  wire T188;
  wire T189;
  wire T190;
  wire[5:0] T191;
  wire[2:0] T192;
  wire[1:0] T193;
  wire T194;
  wire T195;
  wire T196;
  wire T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire T204;
  wire T205;
  wire T206;
  wire T207;
  wire T208;
  wire[2:0] T209;
  wire[1:0] T210;
  wire T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire T220;
  wire T221;
  wire T222;
  wire T223;
  wire[11:0] T224;
  wire[11:0] T225;
  wire[11:0] T226;
  wire[5:0] T227;
  wire[2:0] T228;
  wire[1:0] T229;
  wire T230;
  wire T231;
  wire T232;
  wire[11:0] inQ;
  reg [11:0] q;
  wire[11:0] T641;
  wire T233;
  wire T234;
  wire[11:0] T235;
  wire T236;
  wire T237;
  wire T238;
  wire[11:0] T239;
  wire T240;
  wire T241;
  wire[11:0] T242;
  wire T243;
  wire T244;
  wire[11:0] T245;
  wire T246;
  wire T247;
  wire[11:0] T248;
  wire T249;
  wire T250;
  wire[11:0] T251;
  wire T252;
  wire T253;
  wire[11:0] T254;
  wire T255;
  wire T256;
  wire[11:0] T257;
  wire T258;
  wire T259;
  wire[11:0] T260;
  wire T261;
  wire T262;
  wire[11:0] T263;
  wire T264;
  wire T265;
  wire[11:0] T266;
  wire T267;
  wire[11:0] T268;
  wire T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire T274;
  wire T275;
  wire T276;
  wire T277;
  wire T278;
  wire[2:0] T279;
  wire[1:0] T280;
  wire T281;
  wire T282;
  wire T283;
  wire T284;
  wire T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire T290;
  wire T291;
  wire T292;
  wire T293;
  wire T294;
  wire T295;
  wire[5:0] T296;
  wire[2:0] T297;
  wire[1:0] T298;
  wire T299;
  wire T300;
  wire T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire T306;
  wire T307;
  wire T308;
  wire T309;
  wire T310;
  wire T311;
  wire T312;
  wire T313;
  wire[2:0] T314;
  wire[1:0] T315;
  wire T316;
  wire T317;
  wire T318;
  wire T319;
  wire T320;
  wire T321;
  wire T322;
  wire T323;
  wire T324;
  wire T325;
  wire T326;
  wire T327;
  wire T328;
  wire T329;
  wire T330;
  wire[11:0] T331;
  wire T332;
  wire T333;
  wire T334;
  wire[11:0] T335;
  wire T336;
  wire T337;
  wire[11:0] T338;
  wire T339;
  wire T340;
  wire[11:0] T341;
  wire T342;
  wire T343;
  wire[11:0] T344;
  wire T345;
  wire T346;
  wire[11:0] T347;
  wire T348;
  wire T349;
  wire[11:0] T350;
  wire T351;
  wire T352;
  wire[11:0] T353;
  wire T354;
  wire T355;
  wire[11:0] T356;
  wire T357;
  wire T358;
  wire[11:0] T359;
  wire T360;
  wire T361;
  wire[11:0] T362;
  wire T363;
  wire[11:0] T364;
  wire T365;
  wire T366;
  wire T367;
  wire T368;
  wire T369;
  wire T370;
  wire T371;
  wire T372;
  wire T373;
  wire T374;
  wire[2:0] T375;
  wire[1:0] T376;
  wire T377;
  wire T378;
  wire T379;
  wire T380;
  wire T381;
  wire T382;
  wire T383;
  wire T384;
  wire T385;
  wire T386;
  wire T387;
  wire T388;
  wire T389;
  wire T390;
  wire T391;
  wire[5:0] T392;
  wire[2:0] T393;
  wire[1:0] T394;
  wire T395;
  wire T396;
  wire T397;
  wire T398;
  wire T399;
  wire T400;
  wire T401;
  wire T402;
  wire T403;
  wire T404;
  wire T405;
  wire T406;
  wire T407;
  wire T408;
  wire T409;
  wire[2:0] T410;
  wire[1:0] T411;
  wire T412;
  wire T413;
  wire T414;
  wire T415;
  wire T416;
  wire T417;
  wire T418;
  wire T419;
  wire T420;
  wire T421;
  wire T422;
  wire T423;
  wire T424;
  wire negOne;
  wire[11:0] T425;
  wire[11:0] T426;
  wire[11:0] T427;
  wire[5:0] T428;
  wire[2:0] T429;
  wire[1:0] T430;
  wire T431;
  wire T432;
  wire T433;
  wire T434;
  wire T435;
  wire[11:0] T436;
  wire T437;
  wire T438;
  wire T439;
  wire[11:0] T440;
  wire T441;
  wire T442;
  wire[11:0] T443;
  wire T444;
  wire T445;
  wire[11:0] T446;
  wire T447;
  wire T448;
  wire[11:0] T449;
  wire T450;
  wire T451;
  wire[11:0] T452;
  wire T453;
  wire T454;
  wire[11:0] T455;
  wire T456;
  wire T457;
  wire[11:0] T458;
  wire T459;
  wire T460;
  wire[11:0] T461;
  wire T462;
  wire T463;
  wire[11:0] T464;
  wire T465;
  wire T466;
  wire[11:0] T467;
  wire T468;
  wire[11:0] T469;
  wire T470;
  wire T471;
  wire T472;
  wire T473;
  wire T474;
  wire T475;
  wire T476;
  wire T477;
  wire T478;
  wire T479;
  wire[2:0] T480;
  wire[1:0] T481;
  wire T482;
  wire T483;
  wire T484;
  wire T485;
  wire T486;
  wire T487;
  wire T488;
  wire T489;
  wire T490;
  wire T491;
  wire T492;
  wire T493;
  wire T494;
  wire T495;
  wire T496;
  wire[5:0] T497;
  wire[2:0] T498;
  wire[1:0] T499;
  wire T500;
  wire T501;
  wire T502;
  wire T503;
  wire T504;
  wire T505;
  wire T506;
  wire T507;
  wire T508;
  wire T509;
  wire T510;
  wire T511;
  wire T512;
  wire T513;
  wire T514;
  wire[2:0] T515;
  wire[1:0] T516;
  wire T517;
  wire T518;
  wire T519;
  wire T520;
  wire T521;
  wire T522;
  wire T523;
  wire T524;
  wire T525;
  wire T526;
  wire T527;
  wire T528;
  wire T529;
  wire zero;
  wire T530;
  wire T531;
  wire[11:0] T532;
  wire[11:0] T533;
  wire[11:0] T534;
  wire[5:0] T535;
  wire[2:0] T536;
  wire[1:0] T537;
  wire T538;
  wire T539;
  wire T540;
  wire T541;
  wire T542;
  wire[11:0] T543;
  wire T544;
  wire T545;
  wire T546;
  wire[11:0] T547;
  wire T548;
  wire T549;
  wire[11:0] T550;
  wire T551;
  wire T552;
  wire[11:0] T553;
  wire T554;
  wire T555;
  wire[11:0] T556;
  wire T557;
  wire T558;
  wire[11:0] T559;
  wire T560;
  wire T561;
  wire[11:0] T562;
  wire T563;
  wire T564;
  wire[11:0] T565;
  wire T566;
  wire T567;
  wire[11:0] T568;
  wire T569;
  wire T570;
  wire[11:0] T571;
  wire T572;
  wire T573;
  wire[11:0] T574;
  wire T575;
  wire[11:0] T576;
  wire T577;
  wire T578;
  wire T579;
  wire T580;
  wire T581;
  wire T582;
  wire T583;
  wire T584;
  wire T585;
  wire T586;
  wire[2:0] T587;
  wire[1:0] T588;
  wire T589;
  wire T590;
  wire T591;
  wire T592;
  wire T593;
  wire T594;
  wire T595;
  wire T596;
  wire T597;
  wire T598;
  wire T599;
  wire T600;
  wire T601;
  wire T602;
  wire T603;
  wire[5:0] T604;
  wire[2:0] T605;
  wire[1:0] T606;
  wire T607;
  wire T608;
  wire T609;
  wire T610;
  wire T611;
  wire T612;
  wire T613;
  wire T614;
  wire T615;
  wire T616;
  wire T617;
  wire T618;
  wire T619;
  wire T620;
  wire T621;
  wire[2:0] T622;
  wire[1:0] T623;
  wire T624;
  wire T625;
  wire T626;
  wire T627;
  wire T628;
  wire T629;
  wire T630;
  wire T631;
  wire T632;
  wire T633;
  wire T634;
  wire T635;
  wire T636;
  wire one;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    qm = {1{$random}};
    nextMask = {1{$random}};
    q = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_o = T637;
  assign T637 = {2'h0, nextQ};
  assign nextQ = one ? T532 : T0;
  assign T0 = zero ? T425 : T1;
  assign T1 = negOne ? T2 : 12'h0;
  assign T2 = T3;
  assign T3 = T4;
  assign T4 = {T392, T5};
  assign T5 = {T375, T6};
  assign T6 = {T370, T7};
  assign T7 = {T365, T8};
  assign T8 = T9;
  assign T9 = T329 ? 1'h1 : T10;
  assign T10 = inQM[1'h0:1'h0];
  assign inQM = io_start ? 12'h0 : qm;
  assign T638 = reset ? 12'h0 : nextQM;
  assign nextQM = one ? T224 : T11;
  assign T11 = zero ? T119 : T12;
  assign T12 = negOne ? T13 : 12'h0;
  assign T13 = T14;
  assign T14 = T15;
  assign T15 = {T86, T16};
  assign T16 = {T69, T17};
  assign T17 = {T64, T18};
  assign T18 = {T59, T19};
  assign T19 = T20;
  assign T20 = T22 ? 1'h0 : T21;
  assign T21 = inQM[1'h0:1'h0];
  assign T22 = T26 & T23;
  assign T23 = ^ T24;
  assign T24 = mask & 12'h800;
  assign mask = io_start ? 12'h1 : nextMask;
  assign T639 = T640[4'hb:1'h0];
  assign T640 = reset ? 13'h1 : T25;
  assign T25 = mask << 1'h1;
  assign T26 = T27 ^ 1'h1;
  assign T27 = T30 | T28;
  assign T28 = ^ T29;
  assign T29 = mask & 12'h400;
  assign T30 = T33 | T31;
  assign T31 = ^ T32;
  assign T32 = mask & 12'h200;
  assign T33 = T36 | T34;
  assign T34 = ^ T35;
  assign T35 = mask & 12'h100;
  assign T36 = T39 | T37;
  assign T37 = ^ T38;
  assign T38 = mask & 12'h80;
  assign T39 = T42 | T40;
  assign T40 = ^ T41;
  assign T41 = mask & 12'h40;
  assign T42 = T45 | T43;
  assign T43 = ^ T44;
  assign T44 = mask & 12'h20;
  assign T45 = T48 | T46;
  assign T46 = ^ T47;
  assign T47 = mask & 12'h10;
  assign T48 = T51 | T49;
  assign T49 = ^ T50;
  assign T50 = mask & 12'h8;
  assign T51 = T54 | T52;
  assign T52 = ^ T53;
  assign T53 = mask & 12'h4;
  assign T54 = T57 | T55;
  assign T55 = ^ T56;
  assign T56 = mask & 12'h2;
  assign T57 = ^ T58;
  assign T58 = mask & 12'h1;
  assign T59 = T60;
  assign T60 = T62 ? 1'h0 : T61;
  assign T61 = inQM[1'h1:1'h1];
  assign T62 = T63 & T28;
  assign T63 = T30 ^ 1'h1;
  assign T64 = T65;
  assign T65 = T67 ? 1'h0 : T66;
  assign T66 = inQM[2'h2:2'h2];
  assign T67 = T68 & T31;
  assign T68 = T33 ^ 1'h1;
  assign T69 = {T81, T70};
  assign T70 = {T76, T71};
  assign T71 = T72;
  assign T72 = T74 ? 1'h0 : T73;
  assign T73 = inQM[2'h3:2'h3];
  assign T74 = T75 & T34;
  assign T75 = T36 ^ 1'h1;
  assign T76 = T77;
  assign T77 = T79 ? 1'h0 : T78;
  assign T78 = inQM[3'h4:3'h4];
  assign T79 = T80 & T37;
  assign T80 = T39 ^ 1'h1;
  assign T81 = T82;
  assign T82 = T84 ? 1'h0 : T83;
  assign T83 = inQM[3'h5:3'h5];
  assign T84 = T85 & T40;
  assign T85 = T42 ^ 1'h1;
  assign T86 = {T104, T87};
  assign T87 = {T99, T88};
  assign T88 = {T94, T89};
  assign T89 = T90;
  assign T90 = T92 ? 1'h0 : T91;
  assign T91 = inQM[3'h6:3'h6];
  assign T92 = T93 & T43;
  assign T93 = T45 ^ 1'h1;
  assign T94 = T95;
  assign T95 = T97 ? 1'h0 : T96;
  assign T96 = inQM[3'h7:3'h7];
  assign T97 = T98 & T46;
  assign T98 = T48 ^ 1'h1;
  assign T99 = T100;
  assign T100 = T102 ? 1'h0 : T101;
  assign T101 = inQM[4'h8:4'h8];
  assign T102 = T103 & T49;
  assign T103 = T51 ^ 1'h1;
  assign T104 = {T116, T105};
  assign T105 = {T111, T106};
  assign T106 = T107;
  assign T107 = T109 ? 1'h0 : T108;
  assign T108 = inQM[4'h9:4'h9];
  assign T109 = T110 & T52;
  assign T110 = T54 ^ 1'h1;
  assign T111 = T112;
  assign T112 = T114 ? 1'h0 : T113;
  assign T113 = inQM[4'ha:4'ha];
  assign T114 = T115 & T55;
  assign T115 = T57 ^ 1'h1;
  assign T116 = T117;
  assign T117 = T57 ? 1'h0 : T118;
  assign T118 = inQM[4'hb:4'hb];
  assign T119 = T120;
  assign T120 = T121;
  assign T121 = {T191, T122};
  assign T122 = {T174, T123};
  assign T123 = {T169, T124};
  assign T124 = {T164, T125};
  assign T125 = T126;
  assign T126 = T128 ? 1'h1 : T127;
  assign T127 = inQM[1'h0:1'h0];
  assign T128 = T131 & T129;
  assign T129 = ^ T130;
  assign T130 = mask & 12'h800;
  assign T131 = T132 ^ 1'h1;
  assign T132 = T135 | T133;
  assign T133 = ^ T134;
  assign T134 = mask & 12'h400;
  assign T135 = T138 | T136;
  assign T136 = ^ T137;
  assign T137 = mask & 12'h200;
  assign T138 = T141 | T139;
  assign T139 = ^ T140;
  assign T140 = mask & 12'h100;
  assign T141 = T144 | T142;
  assign T142 = ^ T143;
  assign T143 = mask & 12'h80;
  assign T144 = T147 | T145;
  assign T145 = ^ T146;
  assign T146 = mask & 12'h40;
  assign T147 = T150 | T148;
  assign T148 = ^ T149;
  assign T149 = mask & 12'h20;
  assign T150 = T153 | T151;
  assign T151 = ^ T152;
  assign T152 = mask & 12'h10;
  assign T153 = T156 | T154;
  assign T154 = ^ T155;
  assign T155 = mask & 12'h8;
  assign T156 = T159 | T157;
  assign T157 = ^ T158;
  assign T158 = mask & 12'h4;
  assign T159 = T162 | T160;
  assign T160 = ^ T161;
  assign T161 = mask & 12'h2;
  assign T162 = ^ T163;
  assign T163 = mask & 12'h1;
  assign T164 = T165;
  assign T165 = T167 ? 1'h1 : T166;
  assign T166 = inQM[1'h1:1'h1];
  assign T167 = T168 & T133;
  assign T168 = T135 ^ 1'h1;
  assign T169 = T170;
  assign T170 = T172 ? 1'h1 : T171;
  assign T171 = inQM[2'h2:2'h2];
  assign T172 = T173 & T136;
  assign T173 = T138 ^ 1'h1;
  assign T174 = {T186, T175};
  assign T175 = {T181, T176};
  assign T176 = T177;
  assign T177 = T179 ? 1'h1 : T178;
  assign T178 = inQM[2'h3:2'h3];
  assign T179 = T180 & T139;
  assign T180 = T141 ^ 1'h1;
  assign T181 = T182;
  assign T182 = T184 ? 1'h1 : T183;
  assign T183 = inQM[3'h4:3'h4];
  assign T184 = T185 & T142;
  assign T185 = T144 ^ 1'h1;
  assign T186 = T187;
  assign T187 = T189 ? 1'h1 : T188;
  assign T188 = inQM[3'h5:3'h5];
  assign T189 = T190 & T145;
  assign T190 = T147 ^ 1'h1;
  assign T191 = {T209, T192};
  assign T192 = {T204, T193};
  assign T193 = {T199, T194};
  assign T194 = T195;
  assign T195 = T197 ? 1'h1 : T196;
  assign T196 = inQM[3'h6:3'h6];
  assign T197 = T198 & T148;
  assign T198 = T150 ^ 1'h1;
  assign T199 = T200;
  assign T200 = T202 ? 1'h1 : T201;
  assign T201 = inQM[3'h7:3'h7];
  assign T202 = T203 & T151;
  assign T203 = T153 ^ 1'h1;
  assign T204 = T205;
  assign T205 = T207 ? 1'h1 : T206;
  assign T206 = inQM[4'h8:4'h8];
  assign T207 = T208 & T154;
  assign T208 = T156 ^ 1'h1;
  assign T209 = {T221, T210};
  assign T210 = {T216, T211};
  assign T211 = T212;
  assign T212 = T214 ? 1'h1 : T213;
  assign T213 = inQM[4'h9:4'h9];
  assign T214 = T215 & T157;
  assign T215 = T159 ^ 1'h1;
  assign T216 = T217;
  assign T217 = T219 ? 1'h1 : T218;
  assign T218 = inQM[4'ha:4'ha];
  assign T219 = T220 & T160;
  assign T220 = T162 ^ 1'h1;
  assign T221 = T222;
  assign T222 = T162 ? 1'h1 : T223;
  assign T223 = inQM[4'hb:4'hb];
  assign T224 = T225;
  assign T225 = T226;
  assign T226 = {T296, T227};
  assign T227 = {T279, T228};
  assign T228 = {T274, T229};
  assign T229 = {T269, T230};
  assign T230 = T231;
  assign T231 = T233 ? 1'h0 : T232;
  assign T232 = inQ[1'h0:1'h0];
  assign inQ = io_start ? 12'h0 : q;
  assign T641 = reset ? 12'h0 : nextQ;
  assign T233 = T236 & T234;
  assign T234 = ^ T235;
  assign T235 = mask & 12'h800;
  assign T236 = T237 ^ 1'h1;
  assign T237 = T240 | T238;
  assign T238 = ^ T239;
  assign T239 = mask & 12'h400;
  assign T240 = T243 | T241;
  assign T241 = ^ T242;
  assign T242 = mask & 12'h200;
  assign T243 = T246 | T244;
  assign T244 = ^ T245;
  assign T245 = mask & 12'h100;
  assign T246 = T249 | T247;
  assign T247 = ^ T248;
  assign T248 = mask & 12'h80;
  assign T249 = T252 | T250;
  assign T250 = ^ T251;
  assign T251 = mask & 12'h40;
  assign T252 = T255 | T253;
  assign T253 = ^ T254;
  assign T254 = mask & 12'h20;
  assign T255 = T258 | T256;
  assign T256 = ^ T257;
  assign T257 = mask & 12'h10;
  assign T258 = T261 | T259;
  assign T259 = ^ T260;
  assign T260 = mask & 12'h8;
  assign T261 = T264 | T262;
  assign T262 = ^ T263;
  assign T263 = mask & 12'h4;
  assign T264 = T267 | T265;
  assign T265 = ^ T266;
  assign T266 = mask & 12'h2;
  assign T267 = ^ T268;
  assign T268 = mask & 12'h1;
  assign T269 = T270;
  assign T270 = T272 ? 1'h0 : T271;
  assign T271 = inQ[1'h1:1'h1];
  assign T272 = T273 & T238;
  assign T273 = T240 ^ 1'h1;
  assign T274 = T275;
  assign T275 = T277 ? 1'h0 : T276;
  assign T276 = inQ[2'h2:2'h2];
  assign T277 = T278 & T241;
  assign T278 = T243 ^ 1'h1;
  assign T279 = {T291, T280};
  assign T280 = {T286, T281};
  assign T281 = T282;
  assign T282 = T284 ? 1'h0 : T283;
  assign T283 = inQ[2'h3:2'h3];
  assign T284 = T285 & T244;
  assign T285 = T246 ^ 1'h1;
  assign T286 = T287;
  assign T287 = T289 ? 1'h0 : T288;
  assign T288 = inQ[3'h4:3'h4];
  assign T289 = T290 & T247;
  assign T290 = T249 ^ 1'h1;
  assign T291 = T292;
  assign T292 = T294 ? 1'h0 : T293;
  assign T293 = inQ[3'h5:3'h5];
  assign T294 = T295 & T250;
  assign T295 = T252 ^ 1'h1;
  assign T296 = {T314, T297};
  assign T297 = {T309, T298};
  assign T298 = {T304, T299};
  assign T299 = T300;
  assign T300 = T302 ? 1'h0 : T301;
  assign T301 = inQ[3'h6:3'h6];
  assign T302 = T303 & T253;
  assign T303 = T255 ^ 1'h1;
  assign T304 = T305;
  assign T305 = T307 ? 1'h0 : T306;
  assign T306 = inQ[3'h7:3'h7];
  assign T307 = T308 & T256;
  assign T308 = T258 ^ 1'h1;
  assign T309 = T310;
  assign T310 = T312 ? 1'h0 : T311;
  assign T311 = inQ[4'h8:4'h8];
  assign T312 = T313 & T259;
  assign T313 = T261 ^ 1'h1;
  assign T314 = {T326, T315};
  assign T315 = {T321, T316};
  assign T316 = T317;
  assign T317 = T319 ? 1'h0 : T318;
  assign T318 = inQ[4'h9:4'h9];
  assign T319 = T320 & T262;
  assign T320 = T264 ^ 1'h1;
  assign T321 = T322;
  assign T322 = T324 ? 1'h0 : T323;
  assign T323 = inQ[4'ha:4'ha];
  assign T324 = T325 & T265;
  assign T325 = T267 ^ 1'h1;
  assign T326 = T327;
  assign T327 = T267 ? 1'h0 : T328;
  assign T328 = inQ[4'hb:4'hb];
  assign T329 = T332 & T330;
  assign T330 = ^ T331;
  assign T331 = mask & 12'h800;
  assign T332 = T333 ^ 1'h1;
  assign T333 = T336 | T334;
  assign T334 = ^ T335;
  assign T335 = mask & 12'h400;
  assign T336 = T339 | T337;
  assign T337 = ^ T338;
  assign T338 = mask & 12'h200;
  assign T339 = T342 | T340;
  assign T340 = ^ T341;
  assign T341 = mask & 12'h100;
  assign T342 = T345 | T343;
  assign T343 = ^ T344;
  assign T344 = mask & 12'h80;
  assign T345 = T348 | T346;
  assign T346 = ^ T347;
  assign T347 = mask & 12'h40;
  assign T348 = T351 | T349;
  assign T349 = ^ T350;
  assign T350 = mask & 12'h20;
  assign T351 = T354 | T352;
  assign T352 = ^ T353;
  assign T353 = mask & 12'h10;
  assign T354 = T357 | T355;
  assign T355 = ^ T356;
  assign T356 = mask & 12'h8;
  assign T357 = T360 | T358;
  assign T358 = ^ T359;
  assign T359 = mask & 12'h4;
  assign T360 = T363 | T361;
  assign T361 = ^ T362;
  assign T362 = mask & 12'h2;
  assign T363 = ^ T364;
  assign T364 = mask & 12'h1;
  assign T365 = T366;
  assign T366 = T368 ? 1'h1 : T367;
  assign T367 = inQM[1'h1:1'h1];
  assign T368 = T369 & T334;
  assign T369 = T336 ^ 1'h1;
  assign T370 = T371;
  assign T371 = T373 ? 1'h1 : T372;
  assign T372 = inQM[2'h2:2'h2];
  assign T373 = T374 & T337;
  assign T374 = T339 ^ 1'h1;
  assign T375 = {T387, T376};
  assign T376 = {T382, T377};
  assign T377 = T378;
  assign T378 = T380 ? 1'h1 : T379;
  assign T379 = inQM[2'h3:2'h3];
  assign T380 = T381 & T340;
  assign T381 = T342 ^ 1'h1;
  assign T382 = T383;
  assign T383 = T385 ? 1'h1 : T384;
  assign T384 = inQM[3'h4:3'h4];
  assign T385 = T386 & T343;
  assign T386 = T345 ^ 1'h1;
  assign T387 = T388;
  assign T388 = T390 ? 1'h1 : T389;
  assign T389 = inQM[3'h5:3'h5];
  assign T390 = T391 & T346;
  assign T391 = T348 ^ 1'h1;
  assign T392 = {T410, T393};
  assign T393 = {T405, T394};
  assign T394 = {T400, T395};
  assign T395 = T396;
  assign T396 = T398 ? 1'h1 : T397;
  assign T397 = inQM[3'h6:3'h6];
  assign T398 = T399 & T349;
  assign T399 = T351 ^ 1'h1;
  assign T400 = T401;
  assign T401 = T403 ? 1'h1 : T402;
  assign T402 = inQM[3'h7:3'h7];
  assign T403 = T404 & T352;
  assign T404 = T354 ^ 1'h1;
  assign T405 = T406;
  assign T406 = T408 ? 1'h1 : T407;
  assign T407 = inQM[4'h8:4'h8];
  assign T408 = T409 & T355;
  assign T409 = T357 ^ 1'h1;
  assign T410 = {T422, T411};
  assign T411 = {T417, T412};
  assign T412 = T413;
  assign T413 = T415 ? 1'h1 : T414;
  assign T414 = inQM[4'h9:4'h9];
  assign T415 = T416 & T358;
  assign T416 = T360 ^ 1'h1;
  assign T417 = T418;
  assign T418 = T420 ? 1'h1 : T419;
  assign T419 = inQM[4'ha:4'ha];
  assign T420 = T421 & T361;
  assign T421 = T363 ^ 1'h1;
  assign T422 = T423;
  assign T423 = T363 ? 1'h1 : T424;
  assign T424 = inQM[4'hb:4'hb];
  assign negOne = io_a == 2'h1;
  assign T425 = T426;
  assign T426 = T427;
  assign T427 = {T497, T428};
  assign T428 = {T480, T429};
  assign T429 = {T475, T430};
  assign T430 = {T470, T431};
  assign T431 = T432;
  assign T432 = T434 ? 1'h0 : T433;
  assign T433 = inQ[1'h0:1'h0];
  assign T434 = T437 & T435;
  assign T435 = ^ T436;
  assign T436 = mask & 12'h800;
  assign T437 = T438 ^ 1'h1;
  assign T438 = T441 | T439;
  assign T439 = ^ T440;
  assign T440 = mask & 12'h400;
  assign T441 = T444 | T442;
  assign T442 = ^ T443;
  assign T443 = mask & 12'h200;
  assign T444 = T447 | T445;
  assign T445 = ^ T446;
  assign T446 = mask & 12'h100;
  assign T447 = T450 | T448;
  assign T448 = ^ T449;
  assign T449 = mask & 12'h80;
  assign T450 = T453 | T451;
  assign T451 = ^ T452;
  assign T452 = mask & 12'h40;
  assign T453 = T456 | T454;
  assign T454 = ^ T455;
  assign T455 = mask & 12'h20;
  assign T456 = T459 | T457;
  assign T457 = ^ T458;
  assign T458 = mask & 12'h10;
  assign T459 = T462 | T460;
  assign T460 = ^ T461;
  assign T461 = mask & 12'h8;
  assign T462 = T465 | T463;
  assign T463 = ^ T464;
  assign T464 = mask & 12'h4;
  assign T465 = T468 | T466;
  assign T466 = ^ T467;
  assign T467 = mask & 12'h2;
  assign T468 = ^ T469;
  assign T469 = mask & 12'h1;
  assign T470 = T471;
  assign T471 = T473 ? 1'h0 : T472;
  assign T472 = inQ[1'h1:1'h1];
  assign T473 = T474 & T439;
  assign T474 = T441 ^ 1'h1;
  assign T475 = T476;
  assign T476 = T478 ? 1'h0 : T477;
  assign T477 = inQ[2'h2:2'h2];
  assign T478 = T479 & T442;
  assign T479 = T444 ^ 1'h1;
  assign T480 = {T492, T481};
  assign T481 = {T487, T482};
  assign T482 = T483;
  assign T483 = T485 ? 1'h0 : T484;
  assign T484 = inQ[2'h3:2'h3];
  assign T485 = T486 & T445;
  assign T486 = T447 ^ 1'h1;
  assign T487 = T488;
  assign T488 = T490 ? 1'h0 : T489;
  assign T489 = inQ[3'h4:3'h4];
  assign T490 = T491 & T448;
  assign T491 = T450 ^ 1'h1;
  assign T492 = T493;
  assign T493 = T495 ? 1'h0 : T494;
  assign T494 = inQ[3'h5:3'h5];
  assign T495 = T496 & T451;
  assign T496 = T453 ^ 1'h1;
  assign T497 = {T515, T498};
  assign T498 = {T510, T499};
  assign T499 = {T505, T500};
  assign T500 = T501;
  assign T501 = T503 ? 1'h0 : T502;
  assign T502 = inQ[3'h6:3'h6];
  assign T503 = T504 & T454;
  assign T504 = T456 ^ 1'h1;
  assign T505 = T506;
  assign T506 = T508 ? 1'h0 : T507;
  assign T507 = inQ[3'h7:3'h7];
  assign T508 = T509 & T457;
  assign T509 = T459 ^ 1'h1;
  assign T510 = T511;
  assign T511 = T513 ? 1'h0 : T512;
  assign T512 = inQ[4'h8:4'h8];
  assign T513 = T514 & T460;
  assign T514 = T462 ^ 1'h1;
  assign T515 = {T527, T516};
  assign T516 = {T522, T517};
  assign T517 = T518;
  assign T518 = T520 ? 1'h0 : T519;
  assign T519 = inQ[4'h9:4'h9];
  assign T520 = T521 & T463;
  assign T521 = T465 ^ 1'h1;
  assign T522 = T523;
  assign T523 = T525 ? 1'h0 : T524;
  assign T524 = inQ[4'ha:4'ha];
  assign T525 = T526 & T466;
  assign T526 = T468 ^ 1'h1;
  assign T527 = T528;
  assign T528 = T468 ? 1'h0 : T529;
  assign T529 = inQ[4'hb:4'hb];
  assign zero = T531 & T530;
  assign T530 = one ^ 1'h1;
  assign T531 = negOne ^ 1'h1;
  assign T532 = T533;
  assign T533 = T534;
  assign T534 = {T604, T535};
  assign T535 = {T587, T536};
  assign T536 = {T582, T537};
  assign T537 = {T577, T538};
  assign T538 = T539;
  assign T539 = T541 ? 1'h1 : T540;
  assign T540 = inQ[1'h0:1'h0];
  assign T541 = T544 & T542;
  assign T542 = ^ T543;
  assign T543 = mask & 12'h800;
  assign T544 = T545 ^ 1'h1;
  assign T545 = T548 | T546;
  assign T546 = ^ T547;
  assign T547 = mask & 12'h400;
  assign T548 = T551 | T549;
  assign T549 = ^ T550;
  assign T550 = mask & 12'h200;
  assign T551 = T554 | T552;
  assign T552 = ^ T553;
  assign T553 = mask & 12'h100;
  assign T554 = T557 | T555;
  assign T555 = ^ T556;
  assign T556 = mask & 12'h80;
  assign T557 = T560 | T558;
  assign T558 = ^ T559;
  assign T559 = mask & 12'h40;
  assign T560 = T563 | T561;
  assign T561 = ^ T562;
  assign T562 = mask & 12'h20;
  assign T563 = T566 | T564;
  assign T564 = ^ T565;
  assign T565 = mask & 12'h10;
  assign T566 = T569 | T567;
  assign T567 = ^ T568;
  assign T568 = mask & 12'h8;
  assign T569 = T572 | T570;
  assign T570 = ^ T571;
  assign T571 = mask & 12'h4;
  assign T572 = T575 | T573;
  assign T573 = ^ T574;
  assign T574 = mask & 12'h2;
  assign T575 = ^ T576;
  assign T576 = mask & 12'h1;
  assign T577 = T578;
  assign T578 = T580 ? 1'h1 : T579;
  assign T579 = inQ[1'h1:1'h1];
  assign T580 = T581 & T546;
  assign T581 = T548 ^ 1'h1;
  assign T582 = T583;
  assign T583 = T585 ? 1'h1 : T584;
  assign T584 = inQ[2'h2:2'h2];
  assign T585 = T586 & T549;
  assign T586 = T551 ^ 1'h1;
  assign T587 = {T599, T588};
  assign T588 = {T594, T589};
  assign T589 = T590;
  assign T590 = T592 ? 1'h1 : T591;
  assign T591 = inQ[2'h3:2'h3];
  assign T592 = T593 & T552;
  assign T593 = T554 ^ 1'h1;
  assign T594 = T595;
  assign T595 = T597 ? 1'h1 : T596;
  assign T596 = inQ[3'h4:3'h4];
  assign T597 = T598 & T555;
  assign T598 = T557 ^ 1'h1;
  assign T599 = T600;
  assign T600 = T602 ? 1'h1 : T601;
  assign T601 = inQ[3'h5:3'h5];
  assign T602 = T603 & T558;
  assign T603 = T560 ^ 1'h1;
  assign T604 = {T622, T605};
  assign T605 = {T617, T606};
  assign T606 = {T612, T607};
  assign T607 = T608;
  assign T608 = T610 ? 1'h1 : T609;
  assign T609 = inQ[3'h6:3'h6];
  assign T610 = T611 & T561;
  assign T611 = T563 ^ 1'h1;
  assign T612 = T613;
  assign T613 = T615 ? 1'h1 : T614;
  assign T614 = inQ[3'h7:3'h7];
  assign T615 = T616 & T564;
  assign T616 = T566 ^ 1'h1;
  assign T617 = T618;
  assign T618 = T620 ? 1'h1 : T619;
  assign T619 = inQ[4'h8:4'h8];
  assign T620 = T621 & T567;
  assign T621 = T569 ^ 1'h1;
  assign T622 = {T634, T623};
  assign T623 = {T629, T624};
  assign T624 = T625;
  assign T625 = T627 ? 1'h1 : T626;
  assign T626 = inQ[4'h9:4'h9];
  assign T627 = T628 & T570;
  assign T628 = T572 ^ 1'h1;
  assign T629 = T630;
  assign T630 = T632 ? 1'h1 : T631;
  assign T631 = inQ[4'ha:4'ha];
  assign T632 = T633 & T573;
  assign T633 = T575 ^ 1'h1;
  assign T634 = T635;
  assign T635 = T575 ? 1'h1 : T636;
  assign T636 = inQ[4'hb:4'hb];
  assign one = io_a == 2'h2;

  always @(posedge clk) begin
    if(reset) begin
      qm <= 12'h0;
    end else if(one) begin
      qm <= T224;
    end else if(zero) begin
      qm <= T119;
    end else if(negOne) begin
      qm <= T13;
    end else begin
      qm <= 12'h0;
    end
    nextMask <= T639;
    if(reset) begin
      q <= 12'h0;
    end else if(one) begin
      q <= T532;
    end else if(zero) begin
      q <= T425;
    end else if(negOne) begin
      q <= T2;
    end else begin
      q <= 12'h0;
    end
  end
endmodule

module FullAdderModule(
    input  io_a,
    input  io_b,
    input  io_cin,
    output io_o,
    output io_cout
);

  wire T0;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;


  assign io_cout = T0;
  assign T0 = T2 | T1;
  assign T1 = io_b & io_cin;
  assign T2 = T4 | T3;
  assign T3 = io_a & io_cin;
  assign T4 = io_a & io_b;
  assign io_o = T5;
  assign T5 = T6 ^ io_cin;
  assign T6 = io_a ^ io_b;
endmodule

module fourToTwoAdderModule(
    input [13:0] io_a,
    input [13:0] io_b,
    input [13:0] io_c,
    input [13:0] io_d,
    input  io_cin1,
    input  io_cin2,
    output[13:0] io_o,
    output[13:0] io_cout
);

  wire cT_13;
  wire T0;
  wire T1;
  wire T2;
  wire T3;
  wire cT_12;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire cT_11;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire cT_10;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire cT_9;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire cT_8;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire cT_7;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire cT_6;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire cT_5;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire cT_4;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire cT_3;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire cT_2;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire cT_1;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire cT_0;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire[13:0] T56;
  wire[13:0] T57;
  wire[13:0] T58;
  wire[6:0] T59;
  wire[3:0] T60;
  wire[1:0] T61;
  wire vcF_0;
  wire vc_0;
  wire vcF_1;
  wire vc_1;
  wire[1:0] T62;
  wire vcF_2;
  wire vc_2;
  wire vcF_3;
  wire vc_3;
  wire[2:0] T63;
  wire[1:0] T64;
  wire vcF_4;
  wire vc_4;
  wire vcF_5;
  wire vc_5;
  wire vcF_6;
  wire vc_6;
  wire[6:0] T65;
  wire[3:0] T66;
  wire[1:0] T67;
  wire vcF_7;
  wire vc_7;
  wire vcF_8;
  wire vc_8;
  wire[1:0] T68;
  wire vcF_9;
  wire vc_9;
  wire vcF_10;
  wire vc_10;
  wire[2:0] T69;
  wire[1:0] T70;
  wire vcF_11;
  wire vc_11;
  wire vcF_12;
  wire vc_12;
  wire vcF_13;
  wire vc_13;
  wire[13:0] T71;
  wire[13:0] T72;
  wire[13:0] T73;
  wire[6:0] T74;
  wire[3:0] T75;
  wire[1:0] T76;
  wire vs_0;
  wire vs_1;
  wire[1:0] T77;
  wire vs_2;
  wire vs_3;
  wire[2:0] T78;
  wire[1:0] T79;
  wire vs_4;
  wire vs_5;
  wire vs_6;
  wire[6:0] T80;
  wire[3:0] T81;
  wire[1:0] T82;
  wire vs_7;
  wire vs_8;
  wire[1:0] T83;
  wire vs_9;
  wire vs_10;
  wire[2:0] T84;
  wire[1:0] T85;
  wire vs_11;
  wire vs_12;
  wire vs_13;
  wire FullAdderModule_io_o;
  wire FullAdderModule_io_cout;
  wire FullAdderModule_1_io_o;
  wire FullAdderModule_1_io_cout;
  wire FullAdderModule_2_io_o;
  wire FullAdderModule_2_io_cout;
  wire FullAdderModule_3_io_o;
  wire FullAdderModule_3_io_cout;
  wire FullAdderModule_4_io_o;
  wire FullAdderModule_4_io_cout;
  wire FullAdderModule_5_io_o;
  wire FullAdderModule_5_io_cout;
  wire FullAdderModule_6_io_o;
  wire FullAdderModule_6_io_cout;
  wire FullAdderModule_7_io_o;
  wire FullAdderModule_7_io_cout;
  wire FullAdderModule_8_io_o;
  wire FullAdderModule_8_io_cout;
  wire FullAdderModule_9_io_o;
  wire FullAdderModule_9_io_cout;
  wire FullAdderModule_10_io_o;
  wire FullAdderModule_10_io_cout;
  wire FullAdderModule_11_io_o;
  wire FullAdderModule_11_io_cout;
  wire FullAdderModule_12_io_o;
  wire FullAdderModule_12_io_cout;
  wire FullAdderModule_13_io_o;
  wire FullAdderModule_13_io_cout;
  wire FullAdderModule_14_io_o;
  wire FullAdderModule_14_io_cout;
  wire FullAdderModule_15_io_o;
  wire FullAdderModule_15_io_cout;
  wire FullAdderModule_16_io_o;
  wire FullAdderModule_16_io_cout;
  wire FullAdderModule_17_io_o;
  wire FullAdderModule_17_io_cout;
  wire FullAdderModule_18_io_o;
  wire FullAdderModule_18_io_cout;
  wire FullAdderModule_19_io_o;
  wire FullAdderModule_19_io_cout;
  wire FullAdderModule_20_io_o;
  wire FullAdderModule_20_io_cout;
  wire FullAdderModule_21_io_o;
  wire FullAdderModule_21_io_cout;
  wire FullAdderModule_22_io_o;
  wire FullAdderModule_22_io_cout;
  wire FullAdderModule_23_io_o;
  wire FullAdderModule_23_io_cout;
  wire FullAdderModule_24_io_o;
  wire FullAdderModule_24_io_cout;
  wire FullAdderModule_25_io_o;
  wire FullAdderModule_25_io_cout;
  wire FullAdderModule_26_io_o;
  wire FullAdderModule_27_io_o;


  assign cT_13 = FullAdderModule_24_io_cout;
  assign T0 = io_d[4'hd:4'hd];
  assign T1 = io_c[4'hd:4'hd];
  assign T2 = io_b[4'hd:4'hd];
  assign T3 = io_a[4'hd:4'hd];
  assign cT_12 = FullAdderModule_22_io_cout;
  assign T4 = io_d[4'hc:4'hc];
  assign T5 = io_c[4'hc:4'hc];
  assign T6 = io_b[4'hc:4'hc];
  assign T7 = io_a[4'hc:4'hc];
  assign cT_11 = FullAdderModule_20_io_cout;
  assign T8 = io_d[4'hb:4'hb];
  assign T9 = io_c[4'hb:4'hb];
  assign T10 = io_b[4'hb:4'hb];
  assign T11 = io_a[4'hb:4'hb];
  assign cT_10 = FullAdderModule_18_io_cout;
  assign T12 = io_d[4'ha:4'ha];
  assign T13 = io_c[4'ha:4'ha];
  assign T14 = io_b[4'ha:4'ha];
  assign T15 = io_a[4'ha:4'ha];
  assign cT_9 = FullAdderModule_16_io_cout;
  assign T16 = io_d[4'h9:4'h9];
  assign T17 = io_c[4'h9:4'h9];
  assign T18 = io_b[4'h9:4'h9];
  assign T19 = io_a[4'h9:4'h9];
  assign cT_8 = FullAdderModule_14_io_cout;
  assign T20 = io_d[4'h8:4'h8];
  assign T21 = io_c[4'h8:4'h8];
  assign T22 = io_b[4'h8:4'h8];
  assign T23 = io_a[4'h8:4'h8];
  assign cT_7 = FullAdderModule_12_io_cout;
  assign T24 = io_d[3'h7:3'h7];
  assign T25 = io_c[3'h7:3'h7];
  assign T26 = io_b[3'h7:3'h7];
  assign T27 = io_a[3'h7:3'h7];
  assign cT_6 = FullAdderModule_10_io_cout;
  assign T28 = io_d[3'h6:3'h6];
  assign T29 = io_c[3'h6:3'h6];
  assign T30 = io_b[3'h6:3'h6];
  assign T31 = io_a[3'h6:3'h6];
  assign cT_5 = FullAdderModule_8_io_cout;
  assign T32 = io_d[3'h5:3'h5];
  assign T33 = io_c[3'h5:3'h5];
  assign T34 = io_b[3'h5:3'h5];
  assign T35 = io_a[3'h5:3'h5];
  assign cT_4 = FullAdderModule_6_io_cout;
  assign T36 = io_d[3'h4:3'h4];
  assign T37 = io_c[3'h4:3'h4];
  assign T38 = io_b[3'h4:3'h4];
  assign T39 = io_a[3'h4:3'h4];
  assign cT_3 = FullAdderModule_4_io_cout;
  assign T40 = io_d[2'h3:2'h3];
  assign T41 = io_c[2'h3:2'h3];
  assign T42 = io_b[2'h3:2'h3];
  assign T43 = io_a[2'h3:2'h3];
  assign cT_2 = FullAdderModule_2_io_cout;
  assign T44 = io_d[2'h2:2'h2];
  assign T45 = io_c[2'h2:2'h2];
  assign T46 = io_b[2'h2:2'h2];
  assign T47 = io_a[2'h2:2'h2];
  assign cT_1 = FullAdderModule_io_cout;
  assign T48 = io_d[1'h1:1'h1];
  assign T49 = io_c[1'h1:1'h1];
  assign T50 = io_b[1'h1:1'h1];
  assign T51 = io_a[1'h1:1'h1];
  assign cT_0 = io_cin2;
  assign T52 = io_d[1'h0:1'h0];
  assign T53 = io_c[1'h0:1'h0];
  assign T54 = io_b[1'h0:1'h0];
  assign T55 = io_a[1'h0:1'h0];
  assign io_cout = T56;
  assign T56 = T57;
  assign T57 = T58;
  assign T58 = {T65, T59};
  assign T59 = {T63, T60};
  assign T60 = {T62, T61};
  assign T61 = {vcF_1, vcF_0};
  assign vcF_0 = vc_0;
  assign vc_0 = io_cin1;
  assign vcF_1 = vc_1;
  assign vc_1 = FullAdderModule_1_io_cout;
  assign T62 = {vcF_3, vcF_2};
  assign vcF_2 = vc_2;
  assign vc_2 = FullAdderModule_3_io_cout;
  assign vcF_3 = vc_3;
  assign vc_3 = FullAdderModule_5_io_cout;
  assign T63 = {vcF_6, T64};
  assign T64 = {vcF_5, vcF_4};
  assign vcF_4 = vc_4;
  assign vc_4 = FullAdderModule_7_io_cout;
  assign vcF_5 = vc_5;
  assign vc_5 = FullAdderModule_9_io_cout;
  assign vcF_6 = vc_6;
  assign vc_6 = FullAdderModule_11_io_cout;
  assign T65 = {T69, T66};
  assign T66 = {T68, T67};
  assign T67 = {vcF_8, vcF_7};
  assign vcF_7 = vc_7;
  assign vc_7 = FullAdderModule_13_io_cout;
  assign vcF_8 = vc_8;
  assign vc_8 = FullAdderModule_15_io_cout;
  assign T68 = {vcF_10, vcF_9};
  assign vcF_9 = vc_9;
  assign vc_9 = FullAdderModule_17_io_cout;
  assign vcF_10 = vc_10;
  assign vc_10 = FullAdderModule_19_io_cout;
  assign T69 = {vcF_13, T70};
  assign T70 = {vcF_12, vcF_11};
  assign vcF_11 = vc_11;
  assign vc_11 = FullAdderModule_21_io_cout;
  assign vcF_12 = vc_12;
  assign vc_12 = FullAdderModule_23_io_cout;
  assign vcF_13 = vc_13;
  assign vc_13 = FullAdderModule_25_io_cout;
  assign io_o = T71;
  assign T71 = T72;
  assign T72 = T73;
  assign T73 = {T80, T74};
  assign T74 = {T78, T75};
  assign T75 = {T77, T76};
  assign T76 = {vs_1, vs_0};
  assign vs_0 = FullAdderModule_1_io_o;
  assign vs_1 = FullAdderModule_3_io_o;
  assign T77 = {vs_3, vs_2};
  assign vs_2 = FullAdderModule_5_io_o;
  assign vs_3 = FullAdderModule_7_io_o;
  assign T78 = {vs_6, T79};
  assign T79 = {vs_5, vs_4};
  assign vs_4 = FullAdderModule_9_io_o;
  assign vs_5 = FullAdderModule_11_io_o;
  assign vs_6 = FullAdderModule_13_io_o;
  assign T80 = {T84, T81};
  assign T81 = {T83, T82};
  assign T82 = {vs_8, vs_7};
  assign vs_7 = FullAdderModule_15_io_o;
  assign vs_8 = FullAdderModule_17_io_o;
  assign T83 = {vs_10, vs_9};
  assign vs_9 = FullAdderModule_19_io_o;
  assign vs_10 = FullAdderModule_21_io_o;
  assign T84 = {vs_13, T85};
  assign T85 = {vs_12, vs_11};
  assign vs_11 = FullAdderModule_23_io_o;
  assign vs_12 = FullAdderModule_25_io_o;
  assign vs_13 = FullAdderModule_27_io_o;
  FullAdderModule FullAdderModule(
       .io_a( T55 ),
       .io_b( T54 ),
       .io_cin( T53 ),
       .io_o( FullAdderModule_io_o ),
       .io_cout( FullAdderModule_io_cout )
  );
  FullAdderModule FullAdderModule_1(
       .io_a( FullAdderModule_io_o ),
       .io_b( T52 ),
       .io_cin( cT_0 ),
       .io_o( FullAdderModule_1_io_o ),
       .io_cout( FullAdderModule_1_io_cout )
  );
  FullAdderModule FullAdderModule_2(
       .io_a( T51 ),
       .io_b( T50 ),
       .io_cin( T49 ),
       .io_o( FullAdderModule_2_io_o ),
       .io_cout( FullAdderModule_2_io_cout )
  );
  FullAdderModule FullAdderModule_3(
       .io_a( FullAdderModule_2_io_o ),
       .io_b( T48 ),
       .io_cin( cT_1 ),
       .io_o( FullAdderModule_3_io_o ),
       .io_cout( FullAdderModule_3_io_cout )
  );
  FullAdderModule FullAdderModule_4(
       .io_a( T47 ),
       .io_b( T46 ),
       .io_cin( T45 ),
       .io_o( FullAdderModule_4_io_o ),
       .io_cout( FullAdderModule_4_io_cout )
  );
  FullAdderModule FullAdderModule_5(
       .io_a( FullAdderModule_4_io_o ),
       .io_b( T44 ),
       .io_cin( cT_2 ),
       .io_o( FullAdderModule_5_io_o ),
       .io_cout( FullAdderModule_5_io_cout )
  );
  FullAdderModule FullAdderModule_6(
       .io_a( T43 ),
       .io_b( T42 ),
       .io_cin( T41 ),
       .io_o( FullAdderModule_6_io_o ),
       .io_cout( FullAdderModule_6_io_cout )
  );
  FullAdderModule FullAdderModule_7(
       .io_a( FullAdderModule_6_io_o ),
       .io_b( T40 ),
       .io_cin( cT_3 ),
       .io_o( FullAdderModule_7_io_o ),
       .io_cout( FullAdderModule_7_io_cout )
  );
  FullAdderModule FullAdderModule_8(
       .io_a( T39 ),
       .io_b( T38 ),
       .io_cin( T37 ),
       .io_o( FullAdderModule_8_io_o ),
       .io_cout( FullAdderModule_8_io_cout )
  );
  FullAdderModule FullAdderModule_9(
       .io_a( FullAdderModule_8_io_o ),
       .io_b( T36 ),
       .io_cin( cT_4 ),
       .io_o( FullAdderModule_9_io_o ),
       .io_cout( FullAdderModule_9_io_cout )
  );
  FullAdderModule FullAdderModule_10(
       .io_a( T35 ),
       .io_b( T34 ),
       .io_cin( T33 ),
       .io_o( FullAdderModule_10_io_o ),
       .io_cout( FullAdderModule_10_io_cout )
  );
  FullAdderModule FullAdderModule_11(
       .io_a( FullAdderModule_10_io_o ),
       .io_b( T32 ),
       .io_cin( cT_5 ),
       .io_o( FullAdderModule_11_io_o ),
       .io_cout( FullAdderModule_11_io_cout )
  );
  FullAdderModule FullAdderModule_12(
       .io_a( T31 ),
       .io_b( T30 ),
       .io_cin( T29 ),
       .io_o( FullAdderModule_12_io_o ),
       .io_cout( FullAdderModule_12_io_cout )
  );
  FullAdderModule FullAdderModule_13(
       .io_a( FullAdderModule_12_io_o ),
       .io_b( T28 ),
       .io_cin( cT_6 ),
       .io_o( FullAdderModule_13_io_o ),
       .io_cout( FullAdderModule_13_io_cout )
  );
  FullAdderModule FullAdderModule_14(
       .io_a( T27 ),
       .io_b( T26 ),
       .io_cin( T25 ),
       .io_o( FullAdderModule_14_io_o ),
       .io_cout( FullAdderModule_14_io_cout )
  );
  FullAdderModule FullAdderModule_15(
       .io_a( FullAdderModule_14_io_o ),
       .io_b( T24 ),
       .io_cin( cT_7 ),
       .io_o( FullAdderModule_15_io_o ),
       .io_cout( FullAdderModule_15_io_cout )
  );
  FullAdderModule FullAdderModule_16(
       .io_a( T23 ),
       .io_b( T22 ),
       .io_cin( T21 ),
       .io_o( FullAdderModule_16_io_o ),
       .io_cout( FullAdderModule_16_io_cout )
  );
  FullAdderModule FullAdderModule_17(
       .io_a( FullAdderModule_16_io_o ),
       .io_b( T20 ),
       .io_cin( cT_8 ),
       .io_o( FullAdderModule_17_io_o ),
       .io_cout( FullAdderModule_17_io_cout )
  );
  FullAdderModule FullAdderModule_18(
       .io_a( T19 ),
       .io_b( T18 ),
       .io_cin( T17 ),
       .io_o( FullAdderModule_18_io_o ),
       .io_cout( FullAdderModule_18_io_cout )
  );
  FullAdderModule FullAdderModule_19(
       .io_a( FullAdderModule_18_io_o ),
       .io_b( T16 ),
       .io_cin( cT_9 ),
       .io_o( FullAdderModule_19_io_o ),
       .io_cout( FullAdderModule_19_io_cout )
  );
  FullAdderModule FullAdderModule_20(
       .io_a( T15 ),
       .io_b( T14 ),
       .io_cin( T13 ),
       .io_o( FullAdderModule_20_io_o ),
       .io_cout( FullAdderModule_20_io_cout )
  );
  FullAdderModule FullAdderModule_21(
       .io_a( FullAdderModule_20_io_o ),
       .io_b( T12 ),
       .io_cin( cT_10 ),
       .io_o( FullAdderModule_21_io_o ),
       .io_cout( FullAdderModule_21_io_cout )
  );
  FullAdderModule FullAdderModule_22(
       .io_a( T11 ),
       .io_b( T10 ),
       .io_cin( T9 ),
       .io_o( FullAdderModule_22_io_o ),
       .io_cout( FullAdderModule_22_io_cout )
  );
  FullAdderModule FullAdderModule_23(
       .io_a( FullAdderModule_22_io_o ),
       .io_b( T8 ),
       .io_cin( cT_11 ),
       .io_o( FullAdderModule_23_io_o ),
       .io_cout( FullAdderModule_23_io_cout )
  );
  FullAdderModule FullAdderModule_24(
       .io_a( T7 ),
       .io_b( T6 ),
       .io_cin( T5 ),
       .io_o( FullAdderModule_24_io_o ),
       .io_cout( FullAdderModule_24_io_cout )
  );
  FullAdderModule FullAdderModule_25(
       .io_a( FullAdderModule_24_io_o ),
       .io_b( T4 ),
       .io_cin( cT_12 ),
       .io_o( FullAdderModule_25_io_o ),
       .io_cout( FullAdderModule_25_io_cout )
  );
  FullAdderModule FullAdderModule_26(
       .io_a( T3 ),
       .io_b( T2 ),
       .io_cin( T1 ),
       .io_o( FullAdderModule_26_io_o )
       //.io_cout(  )
  );
  FullAdderModule FullAdderModule_27(
       .io_a( FullAdderModule_26_io_o ),
       .io_b( T0 ),
       .io_cin( cT_13 ),
       .io_o( FullAdderModule_27_io_o )
       //.io_cout(  )
  );
endmodule

module MulSEL(
    input [2:0] io_a,
    output[1:0] io_o
);

  wire[1:0] T0;
  wire[1:0] T1;
  wire T2;
  wire[1:0] T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire[1:0] T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;


  assign io_o = T0;
  assign T0 = T8 ? 2'h2 : T1;
  assign T1 = T2 ? 2'h1 : 2'h0;
  assign T2 = T3 == 2'h2;
  assign T3 = {T7, T4};
  assign T4 = T6 & T5;
  assign T5 = io_a[1'h0:1'h0];
  assign T6 = io_a[1'h1:1'h1];
  assign T7 = io_a[2'h2:2'h2];
  assign T8 = T9 == 2'h1;
  assign T9 = {T13, T10};
  assign T10 = T12 | T11;
  assign T11 = io_a[1'h0:1'h0];
  assign T12 = io_a[1'h1:1'h1];
  assign T13 = io_a[2'h2:2'h2];
endmodule

module MSDFDotProductModule(input clk, input reset,
    input [1:0] io_a_3,
    input [1:0] io_a_2,
    input [1:0] io_a_1,
    input [1:0] io_a_0,
    input [1:0] io_b_3,
    input [1:0] io_b_2,
    input [1:0] io_b_1,
    input [1:0] io_b_0,
    input  io_start,
    output[1:0] io_c
);

  wire T0;
  wire T1;
  reg  R2;
  wire T235;
  wire T3;
  wire[1:0] T4;
  wire[1:0] T5;
  wire[1:0] T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  reg  R11;
  reg  R12;
  reg  R13;
  reg  R14;
  wire T15;
  reg  R16;
  wire T236;
  reg  R17;
  wire T237;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire[1:0] T23;
  wire[1:0] T24;
  wire[1:0] T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  reg  R30;
  wire T31;
  reg  R32;
  wire T238;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  reg  R37;
  wire T239;
  wire T38;
  reg  R39;
  wire T240;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire T48;
  reg  R49;
  wire T241;
  wire T50;
  reg  R51;
  wire T242;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire[2:0] T59;
  wire[3:0] T60;
  wire[3:0] T61;
  wire[3:0] T62;
  wire T63;
  wire T64;
  wire[13:0] T65;
  reg [13:0] R66;
  wire[13:0] T243;
  wire[13:0] T244;
  wire[10:0] T67;
  wire[9:0] T68;
  wire T69;
  wire[13:0] T70;
  wire[13:0] T71;
  wire[13:0] T72;
  wire[13:0] T73;
  wire[13:0] T245;
  wire[10:0] T74;
  wire T75;
  wire[13:0] T76;
  wire T77;
  wire[13:0] T78;
  wire[13:0] T79;
  wire[13:0] T80;
  wire[13:0] T81;
  reg [13:0] R82;
  wire[13:0] T246;
  wire[13:0] T247;
  wire[10:0] T83;
  wire T84;
  wire[13:0] T85;
  wire T86;
  wire[13:0] T87;
  reg [13:0] R88;
  wire[13:0] T248;
  wire[14:0] T249;
  wire[14:0] T89;
  wire[13:0] T90;
  wire[13:0] T91;
  wire[11:0] T92;
  wire[9:0] T93;
  wire[1:0] T94;
  wire[1:0] T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire[2:0] T100;
  wire[3:0] T101;
  wire[3:0] T102;
  wire[3:0] T103;
  wire T104;
  wire T105;
  wire[13:0] T106;
  reg [13:0] R107;
  wire[13:0] T250;
  wire[13:0] T251;
  wire[10:0] T108;
  wire[9:0] T109;
  wire T110;
  wire[13:0] T111;
  wire[13:0] T112;
  wire[13:0] T113;
  wire[13:0] T114;
  wire[13:0] T252;
  wire[10:0] T115;
  wire T116;
  wire[13:0] T117;
  wire T118;
  wire[13:0] T119;
  wire[13:0] T120;
  wire[13:0] T121;
  wire[13:0] T122;
  reg [13:0] R123;
  wire[13:0] T253;
  wire[13:0] T254;
  wire[10:0] T124;
  wire T125;
  wire[13:0] T126;
  wire T127;
  wire[13:0] T128;
  reg [13:0] R129;
  wire[13:0] T255;
  wire[14:0] T256;
  wire[14:0] T130;
  wire[13:0] T131;
  wire[13:0] T132;
  wire[11:0] T133;
  wire[9:0] T134;
  wire[1:0] T135;
  wire[1:0] T136;
  wire T137;
  wire T138;
  wire T139;
  wire T140;
  wire[2:0] T141;
  wire[3:0] T142;
  wire[3:0] T143;
  wire[3:0] T144;
  wire T145;
  wire T146;
  wire[13:0] T147;
  reg [13:0] R148;
  wire[13:0] T257;
  wire[13:0] T258;
  wire[10:0] T149;
  wire[9:0] T150;
  wire T151;
  wire[13:0] T152;
  wire[13:0] T153;
  wire[13:0] T154;
  wire[13:0] T155;
  wire[13:0] T259;
  wire[10:0] T156;
  wire T157;
  wire[13:0] T158;
  wire T159;
  wire[13:0] T160;
  wire[13:0] T161;
  wire[13:0] T162;
  wire[13:0] T163;
  reg [13:0] R164;
  wire[13:0] T260;
  wire[13:0] T261;
  wire[10:0] T165;
  wire T166;
  wire[13:0] T167;
  wire T168;
  wire[13:0] T169;
  reg [13:0] R170;
  wire[13:0] T262;
  wire[14:0] T263;
  wire[14:0] T171;
  wire[13:0] T172;
  wire[13:0] T173;
  wire[11:0] T174;
  wire[9:0] T175;
  wire[1:0] T176;
  wire[1:0] T177;
  wire T178;
  wire T179;
  wire T180;
  wire T181;
  wire[2:0] T182;
  wire[3:0] T183;
  wire[3:0] T184;
  wire[3:0] T185;
  wire T186;
  wire T187;
  wire[13:0] T188;
  reg [13:0] R189;
  wire[13:0] T264;
  wire[13:0] T265;
  wire[10:0] T190;
  wire[9:0] T191;
  wire T192;
  wire[13:0] T193;
  wire[13:0] T194;
  wire[13:0] T195;
  wire[13:0] T196;
  wire[13:0] T266;
  wire[10:0] T197;
  wire T198;
  wire[13:0] T199;
  wire T200;
  wire[13:0] T201;
  wire[13:0] T202;
  wire[13:0] T203;
  wire[13:0] T204;
  reg [13:0] R205;
  wire[13:0] T267;
  wire[13:0] T268;
  wire[10:0] T206;
  wire T207;
  wire[13:0] T208;
  wire T209;
  wire[13:0] T210;
  reg [13:0] R211;
  wire[13:0] T269;
  wire[14:0] T270;
  wire[14:0] T212;
  wire[13:0] T213;
  wire[13:0] T214;
  wire[11:0] T215;
  wire[9:0] T216;
  wire[1:0] T217;
  wire[1:0] T218;
  wire T219;
  wire T220;
  wire T221;
  wire T222;
  wire[1:0] T223;
  wire[1:0] T224;
  wire[1:0] T225;
  wire T226;
  wire T227;
  wire T228;
  wire T229;
  reg  R230;
  reg  R231;
  reg  R232;
  wire T233;
  reg  R234;
  wire T271;
  wire[13:0] SDOnlineConversionModule2_io_o;
  wire[13:0] SDOnlineConversionModule2_1_io_o;
  wire[1:0] MulSEL_io_o;
  wire[13:0] SDOnlineConversionModule2_2_io_o;
  wire[13:0] SDOnlineConversionModule2_3_io_o;
  wire[1:0] MulSEL_1_io_o;
  wire[13:0] SDOnlineConversionModule2_4_io_o;
  wire[13:0] SDOnlineConversionModule2_5_io_o;
  wire[1:0] MulSEL_2_io_o;
  wire[13:0] SDOnlineConversionModule2_6_io_o;
  wire[13:0] SDOnlineConversionModule2_7_io_o;
  wire[1:0] MulSEL_3_io_o;
  wire FullAdderModule_io_o;
  wire FullAdderModule_io_cout;
  wire FullAdderModule_1_io_o;
  wire FullAdderModule_1_io_cout;
  wire FullAdderModule_2_io_o;
  wire FullAdderModule_2_io_cout;
  wire FullAdderModule_3_io_o;
  wire FullAdderModule_3_io_cout;
  wire FullAdderModule_4_io_o;
  wire FullAdderModule_4_io_cout;
  wire FullAdderModule_5_io_o;
  wire FullAdderModule_5_io_cout;
  wire[13:0] fourToTwoAdderModule_io_o;
  wire[13:0] fourToTwoAdderModule_io_cout;
  wire[13:0] fourToTwoAdderModule_1_io_o;
  wire[13:0] fourToTwoAdderModule_1_io_cout;
  wire[13:0] fourToTwoAdderModule_2_io_o;
  wire[13:0] fourToTwoAdderModule_2_io_cout;
  wire[13:0] fourToTwoAdderModule_3_io_o;
  wire[13:0] fourToTwoAdderModule_3_io_cout;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R2 = {1{$random}};
    R11 = {1{$random}};
    R12 = {1{$random}};
    R13 = {1{$random}};
    R14 = {1{$random}};
    R16 = {1{$random}};
    R17 = {1{$random}};
    R30 = {1{$random}};
    R32 = {1{$random}};
    R37 = {1{$random}};
    R39 = {1{$random}};
    R49 = {1{$random}};
    R51 = {1{$random}};
    R66 = {1{$random}};
    R82 = {1{$random}};
    R88 = {1{$random}};
    R107 = {1{$random}};
    R123 = {1{$random}};
    R129 = {1{$random}};
    R148 = {1{$random}};
    R164 = {1{$random}};
    R170 = {1{$random}};
    R189 = {1{$random}};
    R205 = {1{$random}};
    R211 = {1{$random}};
    R230 = {1{$random}};
    R231 = {1{$random}};
    R232 = {1{$random}};
    R234 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = FullAdderModule_4_io_cout;
  assign T1 = ~ R2;
  assign T235 = reset ? 1'h0 : T3;
  assign T3 = T4[1'h0:1'h0];
  assign T4 = T5;
  assign T5 = T6;
  assign T6 = {T15, T7};
  assign T7 = T8;
  assign T8 = R11 ? 1'h0 : T9;
  assign T9 = T10;
  assign T10 = ~ FullAdderModule_3_io_cout;
  assign T15 = R16;
  assign T236 = reset ? 1'h0 : FullAdderModule_3_io_o;
  assign T237 = reset ? 1'h0 : FullAdderModule_4_io_o;
  assign T18 = T19;
  assign T19 = T4[1'h1:1'h1];
  assign T20 = ~ T21;
  assign T21 = T22;
  assign T22 = T23[1'h0:1'h0];
  assign T23 = T24;
  assign T24 = T25;
  assign T25 = {T31, T26};
  assign T26 = T27;
  assign T27 = R30 ? 1'h0 : T28;
  assign T28 = T29;
  assign T29 = ~ FullAdderModule_1_io_cout;
  assign T31 = R32;
  assign T238 = reset ? 1'h0 : FullAdderModule_1_io_o;
  assign T33 = T34;
  assign T34 = T23[1'h1:1'h1];
  assign T35 = FullAdderModule_2_io_cout;
  assign T36 = ~ R37;
  assign T239 = reset ? 1'h0 : T38;
  assign T38 = MulSEL_3_io_o[1'h0:1'h0];
  assign T240 = reset ? 1'h0 : FullAdderModule_2_io_o;
  assign T40 = T41;
  assign T41 = MulSEL_3_io_o[1'h1:1'h1];
  assign T42 = ~ T43;
  assign T43 = T44;
  assign T44 = MulSEL_2_io_o[1'h0:1'h0];
  assign T45 = T46;
  assign T46 = MulSEL_2_io_o[1'h1:1'h1];
  assign T47 = FullAdderModule_io_cout;
  assign T48 = ~ R49;
  assign T241 = reset ? 1'h0 : T50;
  assign T50 = MulSEL_1_io_o[1'h0:1'h0];
  assign T242 = reset ? 1'h0 : FullAdderModule_io_o;
  assign T52 = T53;
  assign T53 = MulSEL_1_io_o[1'h1:1'h1];
  assign T54 = ~ T55;
  assign T55 = T56;
  assign T56 = MulSEL_io_o[1'h0:1'h0];
  assign T57 = T58;
  assign T58 = MulSEL_io_o[1'h1:1'h1];
  assign T59 = T60[2'h3:1'h1];
  assign T60 = T62 + T61;
  assign T61 = fourToTwoAdderModule_3_io_cout[4'hd:4'ha];
  assign T62 = fourToTwoAdderModule_3_io_o[4'hd:4'ha];
  assign T63 = io_b_3 == 2'h1;
  assign T64 = io_a_3 == 2'h1;
  assign T65 = T69 ? 14'h0 : R66;
  assign T243 = reset ? 14'h0 : T244;
  assign T244 = {3'h0, T67};
  assign T67 = T68 << 1'h1;
  assign T68 = fourToTwoAdderModule_3_io_cout[4'h9:1'h0];
  assign T69 = io_start;
  assign T70 = T71;
  assign T71 = T77 ? T76 : T72;
  assign T72 = T75 ? T73 : 14'h0;
  assign T73 = T245;
  assign T245 = {3'h0, T74};
  assign T74 = SDOnlineConversionModule2_7_io_o >> 2'h3;
  assign T75 = io_a_3 == 2'h2;
  assign T76 = ~ T73;
  assign T77 = io_a_3 == 2'h1;
  assign T78 = T79;
  assign T79 = io_start ? 14'h0 : T80;
  assign T80 = T86 ? T85 : T81;
  assign T81 = T84 ? R82 : 14'h0;
  assign T246 = reset ? 14'h0 : T247;
  assign T247 = {3'h0, T83};
  assign T83 = SDOnlineConversionModule2_6_io_o >> 2'h3;
  assign T84 = io_b_3 == 2'h2;
  assign T85 = ~ R82;
  assign T86 = io_b_3 == 2'h1;
  assign T87 = T69 ? 14'h0 : R88;
  assign T248 = T249[4'hd:1'h0];
  assign T249 = reset ? 15'h0 : T89;
  assign T89 = T90 << 1'h1;
  assign T90 = T91;
  assign T91 = {T95, T92};
  assign T92 = {T94, T93};
  assign T93 = fourToTwoAdderModule_3_io_o[4'h9:1'h0];
  assign T94 = T60[1'h1:1'h0];
  assign T95 = {1'h1, T96};
  assign T96 = T98 ^ T97;
  assign T97 = T60[2'h2:2'h2];
  assign T98 = T99 == 1'h0;
  assign T99 = MulSEL_3_io_o == 2'h0;
  assign T100 = T101[2'h3:1'h1];
  assign T101 = T103 + T102;
  assign T102 = fourToTwoAdderModule_2_io_cout[4'hd:4'ha];
  assign T103 = fourToTwoAdderModule_2_io_o[4'hd:4'ha];
  assign T104 = io_b_2 == 2'h1;
  assign T105 = io_a_2 == 2'h1;
  assign T106 = T110 ? 14'h0 : R107;
  assign T250 = reset ? 14'h0 : T251;
  assign T251 = {3'h0, T108};
  assign T108 = T109 << 1'h1;
  assign T109 = fourToTwoAdderModule_2_io_cout[4'h9:1'h0];
  assign T110 = io_start;
  assign T111 = T112;
  assign T112 = T118 ? T117 : T113;
  assign T113 = T116 ? T114 : 14'h0;
  assign T114 = T252;
  assign T252 = {3'h0, T115};
  assign T115 = SDOnlineConversionModule2_5_io_o >> 2'h3;
  assign T116 = io_a_2 == 2'h2;
  assign T117 = ~ T114;
  assign T118 = io_a_2 == 2'h1;
  assign T119 = T120;
  assign T120 = io_start ? 14'h0 : T121;
  assign T121 = T127 ? T126 : T122;
  assign T122 = T125 ? R123 : 14'h0;
  assign T253 = reset ? 14'h0 : T254;
  assign T254 = {3'h0, T124};
  assign T124 = SDOnlineConversionModule2_4_io_o >> 2'h3;
  assign T125 = io_b_2 == 2'h2;
  assign T126 = ~ R123;
  assign T127 = io_b_2 == 2'h1;
  assign T128 = T110 ? 14'h0 : R129;
  assign T255 = T256[4'hd:1'h0];
  assign T256 = reset ? 15'h0 : T130;
  assign T130 = T131 << 1'h1;
  assign T131 = T132;
  assign T132 = {T136, T133};
  assign T133 = {T135, T134};
  assign T134 = fourToTwoAdderModule_2_io_o[4'h9:1'h0];
  assign T135 = T101[1'h1:1'h0];
  assign T136 = {1'h1, T137};
  assign T137 = T139 ^ T138;
  assign T138 = T101[2'h2:2'h2];
  assign T139 = T140 == 1'h0;
  assign T140 = MulSEL_2_io_o == 2'h0;
  assign T141 = T142[2'h3:1'h1];
  assign T142 = T144 + T143;
  assign T143 = fourToTwoAdderModule_1_io_cout[4'hd:4'ha];
  assign T144 = fourToTwoAdderModule_1_io_o[4'hd:4'ha];
  assign T145 = io_b_1 == 2'h1;
  assign T146 = io_a_1 == 2'h1;
  assign T147 = T151 ? 14'h0 : R148;
  assign T257 = reset ? 14'h0 : T258;
  assign T258 = {3'h0, T149};
  assign T149 = T150 << 1'h1;
  assign T150 = fourToTwoAdderModule_1_io_cout[4'h9:1'h0];
  assign T151 = io_start;
  assign T152 = T153;
  assign T153 = T159 ? T158 : T154;
  assign T154 = T157 ? T155 : 14'h0;
  assign T155 = T259;
  assign T259 = {3'h0, T156};
  assign T156 = SDOnlineConversionModule2_3_io_o >> 2'h3;
  assign T157 = io_a_1 == 2'h2;
  assign T158 = ~ T155;
  assign T159 = io_a_1 == 2'h1;
  assign T160 = T161;
  assign T161 = io_start ? 14'h0 : T162;
  assign T162 = T168 ? T167 : T163;
  assign T163 = T166 ? R164 : 14'h0;
  assign T260 = reset ? 14'h0 : T261;
  assign T261 = {3'h0, T165};
  assign T165 = SDOnlineConversionModule2_2_io_o >> 2'h3;
  assign T166 = io_b_1 == 2'h2;
  assign T167 = ~ R164;
  assign T168 = io_b_1 == 2'h1;
  assign T169 = T151 ? 14'h0 : R170;
  assign T262 = T263[4'hd:1'h0];
  assign T263 = reset ? 15'h0 : T171;
  assign T171 = T172 << 1'h1;
  assign T172 = T173;
  assign T173 = {T177, T174};
  assign T174 = {T176, T175};
  assign T175 = fourToTwoAdderModule_1_io_o[4'h9:1'h0];
  assign T176 = T142[1'h1:1'h0];
  assign T177 = {1'h1, T178};
  assign T178 = T180 ^ T179;
  assign T179 = T142[2'h2:2'h2];
  assign T180 = T181 == 1'h0;
  assign T181 = MulSEL_1_io_o == 2'h0;
  assign T182 = T183[2'h3:1'h1];
  assign T183 = T185 + T184;
  assign T184 = fourToTwoAdderModule_io_cout[4'hd:4'ha];
  assign T185 = fourToTwoAdderModule_io_o[4'hd:4'ha];
  assign T186 = io_b_0 == 2'h1;
  assign T187 = io_a_0 == 2'h1;
  assign T188 = T192 ? 14'h0 : R189;
  assign T264 = reset ? 14'h0 : T265;
  assign T265 = {3'h0, T190};
  assign T190 = T191 << 1'h1;
  assign T191 = fourToTwoAdderModule_io_cout[4'h9:1'h0];
  assign T192 = io_start;
  assign T193 = T194;
  assign T194 = T200 ? T199 : T195;
  assign T195 = T198 ? T196 : 14'h0;
  assign T196 = T266;
  assign T266 = {3'h0, T197};
  assign T197 = SDOnlineConversionModule2_1_io_o >> 2'h3;
  assign T198 = io_a_0 == 2'h2;
  assign T199 = ~ T196;
  assign T200 = io_a_0 == 2'h1;
  assign T201 = T202;
  assign T202 = io_start ? 14'h0 : T203;
  assign T203 = T209 ? T208 : T204;
  assign T204 = T207 ? R205 : 14'h0;
  assign T267 = reset ? 14'h0 : T268;
  assign T268 = {3'h0, T206};
  assign T206 = SDOnlineConversionModule2_io_o >> 2'h3;
  assign T207 = io_b_0 == 2'h2;
  assign T208 = ~ R205;
  assign T209 = io_b_0 == 2'h1;
  assign T210 = T192 ? 14'h0 : R211;
  assign T269 = T270[4'hd:1'h0];
  assign T270 = reset ? 15'h0 : T212;
  assign T212 = T213 << 1'h1;
  assign T213 = T214;
  assign T214 = {T218, T215};
  assign T215 = {T217, T216};
  assign T216 = fourToTwoAdderModule_io_o[4'h9:1'h0];
  assign T217 = T183[1'h1:1'h0];
  assign T218 = {1'h1, T219};
  assign T219 = T221 ^ T220;
  assign T220 = T183[2'h2:2'h2];
  assign T221 = T222 == 1'h0;
  assign T222 = MulSEL_io_o == 2'h0;
  assign io_c = T223;
  assign T223 = T224;
  assign T224 = T225;
  assign T225 = {T233, T226};
  assign T226 = T227;
  assign T227 = R230 ? 1'h0 : T228;
  assign T228 = T229;
  assign T229 = ~ FullAdderModule_5_io_cout;
  assign T233 = R234;
  assign T271 = reset ? 1'h0 : FullAdderModule_5_io_o;
  SDOnlineConversionModule2 SDOnlineConversionModule2(.clk(clk), .reset(reset),
       .io_a( io_a_0 ),
       .io_start( io_start ),
       .io_o( SDOnlineConversionModule2_io_o )
  );
  SDOnlineConversionModule2 SDOnlineConversionModule2_1(.clk(clk), .reset(reset),
       .io_a( io_b_0 ),
       .io_start( io_start ),
       .io_o( SDOnlineConversionModule2_1_io_o )
  );
  fourToTwoAdderModule fourToTwoAdderModule(
       .io_a( T210 ),
       .io_b( T201 ),
       .io_c( T193 ),
       .io_d( T188 ),
       .io_cin1( T187 ),
       .io_cin2( T186 ),
       .io_o( fourToTwoAdderModule_io_o ),
       .io_cout( fourToTwoAdderModule_io_cout )
  );
  MulSEL MulSEL(
       .io_a( T182 ),
       .io_o( MulSEL_io_o )
  );
  SDOnlineConversionModule2 SDOnlineConversionModule2_2(.clk(clk), .reset(reset),
       .io_a( io_a_1 ),
       .io_start( io_start ),
       .io_o( SDOnlineConversionModule2_2_io_o )
  );
  SDOnlineConversionModule2 SDOnlineConversionModule2_3(.clk(clk), .reset(reset),
       .io_a( io_b_1 ),
       .io_start( io_start ),
       .io_o( SDOnlineConversionModule2_3_io_o )
  );
  fourToTwoAdderModule fourToTwoAdderModule_1(
       .io_a( T169 ),
       .io_b( T160 ),
       .io_c( T152 ),
       .io_d( T147 ),
       .io_cin1( T146 ),
       .io_cin2( T145 ),
       .io_o( fourToTwoAdderModule_1_io_o ),
       .io_cout( fourToTwoAdderModule_1_io_cout )
  );
  MulSEL MulSEL_1(
       .io_a( T141 ),
       .io_o( MulSEL_1_io_o )
  );
  SDOnlineConversionModule2 SDOnlineConversionModule2_4(.clk(clk), .reset(reset),
       .io_a( io_a_2 ),
       .io_start( io_start ),
       .io_o( SDOnlineConversionModule2_4_io_o )
  );
  SDOnlineConversionModule2 SDOnlineConversionModule2_5(.clk(clk), .reset(reset),
       .io_a( io_b_2 ),
       .io_start( io_start ),
       .io_o( SDOnlineConversionModule2_5_io_o )
  );
  fourToTwoAdderModule fourToTwoAdderModule_2(
       .io_a( T128 ),
       .io_b( T119 ),
       .io_c( T111 ),
       .io_d( T106 ),
       .io_cin1( T105 ),
       .io_cin2( T104 ),
       .io_o( fourToTwoAdderModule_2_io_o ),
       .io_cout( fourToTwoAdderModule_2_io_cout )
  );
  MulSEL MulSEL_2(
       .io_a( T100 ),
       .io_o( MulSEL_2_io_o )
  );
  SDOnlineConversionModule2 SDOnlineConversionModule2_6(.clk(clk), .reset(reset),
       .io_a( io_a_3 ),
       .io_start( io_start ),
       .io_o( SDOnlineConversionModule2_6_io_o )
  );
  SDOnlineConversionModule2 SDOnlineConversionModule2_7(.clk(clk), .reset(reset),
       .io_a( io_b_3 ),
       .io_start( io_start ),
       .io_o( SDOnlineConversionModule2_7_io_o )
  );
  fourToTwoAdderModule fourToTwoAdderModule_3(
       .io_a( T87 ),
       .io_b( T78 ),
       .io_c( T70 ),
       .io_d( T65 ),
       .io_cin1( T64 ),
       .io_cin2( T63 ),
       .io_o( fourToTwoAdderModule_3_io_o ),
       .io_cout( fourToTwoAdderModule_3_io_cout )
  );
  MulSEL MulSEL_3(
       .io_a( T59 ),
       .io_o( MulSEL_3_io_o )
  );
  FullAdderModule FullAdderModule(
       .io_a( T57 ),
       .io_b( T54 ),
       .io_cin( T52 ),
       .io_o( FullAdderModule_io_o ),
       .io_cout( FullAdderModule_io_cout )
  );
  FullAdderModule FullAdderModule_1(
       .io_a( R51 ),
       .io_b( T48 ),
       .io_cin( T47 ),
       .io_o( FullAdderModule_1_io_o ),
       .io_cout( FullAdderModule_1_io_cout )
  );
  FullAdderModule FullAdderModule_2(
       .io_a( T45 ),
       .io_b( T42 ),
       .io_cin( T40 ),
       .io_o( FullAdderModule_2_io_o ),
       .io_cout( FullAdderModule_2_io_cout )
  );
  FullAdderModule FullAdderModule_3(
       .io_a( R39 ),
       .io_b( T36 ),
       .io_cin( T35 ),
       .io_o( FullAdderModule_3_io_o ),
       .io_cout( FullAdderModule_3_io_cout )
  );
  FullAdderModule FullAdderModule_4(
       .io_a( T33 ),
       .io_b( T20 ),
       .io_cin( T18 ),
       .io_o( FullAdderModule_4_io_o ),
       .io_cout( FullAdderModule_4_io_cout )
  );
  FullAdderModule FullAdderModule_5(
       .io_a( R17 ),
       .io_b( T1 ),
       .io_cin( T0 ),
       .io_o( FullAdderModule_5_io_o ),
       .io_cout( FullAdderModule_5_io_cout )
  );

  always @(posedge clk) begin
    if(reset) begin
      R2 <= 1'h0;
    end else begin
      R2 <= T3;
    end
    R11 <= R12;
    R12 <= R13;
    R13 <= R14;
    R14 <= io_start;
    if(reset) begin
      R16 <= 1'h0;
    end else begin
      R16 <= FullAdderModule_3_io_o;
    end
    if(reset) begin
      R17 <= 1'h0;
    end else begin
      R17 <= FullAdderModule_4_io_o;
    end
    R30 <= R12;
    if(reset) begin
      R32 <= 1'h0;
    end else begin
      R32 <= FullAdderModule_1_io_o;
    end
    if(reset) begin
      R37 <= 1'h0;
    end else begin
      R37 <= T38;
    end
    if(reset) begin
      R39 <= 1'h0;
    end else begin
      R39 <= FullAdderModule_2_io_o;
    end
    if(reset) begin
      R49 <= 1'h0;
    end else begin
      R49 <= T50;
    end
    if(reset) begin
      R51 <= 1'h0;
    end else begin
      R51 <= FullAdderModule_io_o;
    end
    if(reset) begin
      R66 <= 14'h0;
    end else begin
      R66 <= T244;
    end
    if(reset) begin
      R82 <= 14'h0;
    end else begin
      R82 <= T247;
    end
    R88 <= T248;
    if(reset) begin
      R107 <= 14'h0;
    end else begin
      R107 <= T251;
    end
    if(reset) begin
      R123 <= 14'h0;
    end else begin
      R123 <= T254;
    end
    R129 <= T255;
    if(reset) begin
      R148 <= 14'h0;
    end else begin
      R148 <= T258;
    end
    if(reset) begin
      R164 <= 14'h0;
    end else begin
      R164 <= T261;
    end
    R170 <= T262;
    if(reset) begin
      R189 <= 14'h0;
    end else begin
      R189 <= T265;
    end
    if(reset) begin
      R205 <= 14'h0;
    end else begin
      R205 <= T268;
    end
    R211 <= T269;
    R230 <= R231;
    R231 <= R232;
    R232 <= R12;
    if(reset) begin
      R234 <= 1'h0;
    end else begin
      R234 <= FullAdderModule_5_io_o;
    end
  end
endmodule

