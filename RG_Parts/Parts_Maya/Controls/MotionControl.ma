//Maya ASCII 2014 scene
//Name: MotionControl.ma
//Last modified: Thu, Sep 05, 2013 02:36:01 PM
//Codeset: 1252
requires maya "2014";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014 x64";
fileInfo "cutIdentifier" "201303010241-864206";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -n "grp_control";
createNode transform -n "control" -p "grp_control";
createNode nurbsCurve -n "controlShape" -p "control";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 48 0 no 3
		53 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
		 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 48 48
		51
		0 1.1092300679749059 0.0064646475054351282
		0 0.99286641287697996 0.49777785791890306
		0 0.93468458532801524 0.51717180043522482
		0 0.41751278489278665 0.59474757050050908
		0 0.35933095734382192 0.59474757050050908
		0 0.32700771981662324 0.70464657809299547
		0 0.35933095734382192 0.84686882321268353
		0 0.46276531743086835 0.87272741323444492
		0 1.1480179530075469 0.74989911063107817
		0 1.2320583705782733 0.70464657809299547
		0 1.4389270907523626 0.058181827548958141
		0 1.5100382133122063 0.051717180043517851
		0 1.8914524161331898 0.16808083514144448
		0 1.9690281861984742 0.21979801518496739
		0 1.8979170636386322 0.31676772776657308
		0 1.7880180560461429 0.57535362798418832
		0 1.7686241135298246 0.71111122559843565
		0 2.0724625462855188 1.0860607809139777
		0 2.1500383163508068 1.0860607809139777
		0 2.2340787339215296 0.99555571583781266
		0 2.1823615538780063 0.85979811822356467
		0 2.0013514237256773 0.63353545553315149
		0 2.0401393087583157 0.56242433297330685
		0 2.2534726764378514 0.21979801518496739
		0 2.285795913965051 0.10343436008704081
		0 2.2922605614704952 0.045252532538077497
		0 2.3439777415140197 0.10989900759248113
		0 2.4538767491065028 0.23919195770128845
		0 2.6801394117969131 0.23919195770128845
		0 2.8158970094111684 0.12929295010880212
		0 2.8158970094111684 -0.032323237527207262
		0 2.7577151818621974 -0.17454548264689504
		0 2.5508464616881086 -0.25858590021761962
		0 2.3439777415140197 -0.21979801518497785
		0 2.2728666189541662 -0.27151519522850148
		0 2.1758969063725657 -0.47838391540259251
		0 2.0853918412964019 -0.63353545553316215
		0 1.9754928337039184 -0.76282840564196908
		0 1.8591291786059863 -0.76282840564196908
		0 1.6393311634210139 -0.46545462039171165
		0 1.555290745850292 -0.49131321041347381
		0 1.4324624432469246 -0.54949503796243737
		0 0.87650275777905406 -0.72404052060932744
		0 0.010239992050042446 -1.0278789533650241
		0 -0.067335778015242376 -1.0149496583541437
		0 -0.14491154808052364 -0.91151529826709821
		0 -0.11905295805876559 -0.74989911063108994
		0 0.12013899964252683 -0.64646475054404351
		0 1.2126644280619505 -0.29090913774482274
		0 1.1544826005129885 -0.181010130152336
		0 1.1092300679749059 0
		;
createNode nurbsCurve -n "controlShape1" -p "control";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-1.5694800147621086 2.9211343641910243 1.5694800147621086
		-1.5694800147621086 2.9211343641910243 -1.5694800147621086
		1.5694800147621086 2.9211343641910243 -1.5694800147621086
		1.5694800147621086 2.9211343641910243 1.5694800147621086
		-1.5694800147621086 2.9211343641910243 1.5694800147621086
		-1.5694800147621086 -0.21782566533318537 1.5694800147621086
		-1.5694800147621086 -0.21782566533318537 -1.5694800147621086
		-1.5694800147621086 2.9211343641910243 -1.5694800147621086
		-1.5694800147621086 2.9211343641910243 1.5694800147621086
		-1.5694800147621086 -0.21782566533318537 1.5694800147621086
		1.5694800147621086 -0.21782566533318537 1.5694800147621086
		1.5694800147621086 2.9211343641910243 1.5694800147621086
		1.5694800147621086 2.9211343641910243 -1.5694800147621086
		1.5694800147621086 -0.21782566533318537 -1.5694800147621086
		1.5694800147621086 -0.21782566533318537 1.5694800147621086
		1.5694800147621086 -0.21782566533318537 -1.5694800147621086
		-1.5694800147621086 -0.21782566533318537 -1.5694800147621086
		;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultLightSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr ".ro" yes;
select -ne :defaultObjectSet;
	setAttr ".ro" yes;
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 0 0 0 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rp";
	setAttr -k on ".cai";
	setAttr -k on ".coi";
	setAttr -cb on ".bc";
	setAttr -av -k on ".bcb";
	setAttr -av -k on ".bcg";
	setAttr -av -k on ".bcr";
	setAttr -k on ".ei";
	setAttr -k on ".ex";
	setAttr -av -k on ".es";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bf";
	setAttr -k on ".fii";
	setAttr -av -k on ".sf";
	setAttr -k on ".gr";
	setAttr -k on ".li";
	setAttr -k on ".ls";
	setAttr -k on ".mb";
	setAttr -k on ".ti";
	setAttr -k on ".txt";
	setAttr -k on ".mpr";
	setAttr -k on ".wzd";
	setAttr ".fn" -type "string" "im";
	setAttr -k on ".if";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
	setAttr -k on ".as";
	setAttr -k on ".ds";
	setAttr -k on ".lm";
	setAttr -k on ".fir";
	setAttr -k on ".aap";
	setAttr -k on ".gh";
	setAttr -cb on ".sd";
// End of MotionControl.ma
