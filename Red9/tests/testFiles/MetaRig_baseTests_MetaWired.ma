//Maya ASCII 2013 scene
//Name: MetaRig_baseTests_MetaWired.ma
//Last modified: Tue, May 14, 2013 04:38:36 PM
//Codeset: 1252
requires maya "2013";
requires "mayaHIK" "1.0_HIK_2013.0";
requires "Mayatomr" "2013.0 - 3.10.1.9 ";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2013";
fileInfo "version" "2013 x64";
fileInfo "cutIdentifier" "201207040403-835994";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 66.757382870363628 175.11922528260584 441.17201981327247 ;
	setAttr ".r" -type "double3" -9.0000000000001048 6.4000000000007109 2.0003127869067967e-016 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 408.40133075605678;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -71.449746275714389 145.3093879387506 1.7791873042983051 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -78.099656981061855 167.74020897140306 0.6230172920855388 ;
	setAttr ".r" -type "double3" -90 -0.00088826972870459028 0 ;
	setAttr ".rp" -type "double3" 0 0 -2.8421709430404007e-014 ;
	setAttr ".rpt" -type "double3" -7.2285524143189739e-015 -2.9003228327862686e-014 
		2.7983327666872842e-014 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 22.879071391530516;
	setAttr ".ow" 25.522279157194511;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".tp" -type "double3" -78.989536006204631 144.86113757987255 1.5727014749031578 ;
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -73.960482208559995 144.2562251306118 165.39505660020566 ;
	setAttr ".rpt" -type "double3" -1.0389125165235445e-015 1.0864463865210303e-014 
		-7.5544084399283256e-015 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 165.39505660020566;
	setAttr ".ow" 57.804585898574508;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" 0.0063036563340676212 84.339646727852212 0 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 22.40870044244248 4.923316490697923 -5.8160401849307366 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".rpt" -type "double3" 6.1136720154628429e-030 -1.3999358302038876e-016 
		3.6116365438121856e-017 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 22.408451164993604;
	setAttr ".ow" 64.003223262105919;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" 0.00024927744887648373 4.923316490697923 -5.8160401849307419 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "World_Ctrl";
	addAttr -ci true -sn "RED_Rig" -ln "RED_Rig" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" -0.20748645528617704 0.80187713757770496 0 ;
	setAttr ".sp" -type "double3" -0.20748645528617704 0.80187713757770496 0 ;
	setAttr ".mirrorIndex" 1;
createNode nurbsCurve -n "World_CtrlShape" -p "World_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "COG__Ctrl" -p "World_Ctrl";
	addAttr -ci true -sn "SpineSystem" -ln "SpineSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr ".ro" 2;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 0 100 1.3683285221464905 ;
	setAttr ".sp" -type "double3" 0 100 1.3683285221464905 ;
	setAttr ".mirrorIndex" 2;
createNode nurbsCurve -n "COG__CtrlShape" -p "COG__Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		18.543272935812677 100.61055715311406 -18.750759391098793
		-0.20748645528618009 95.970830854886074 -26.517578235686631
		-18.958245846384997 100.61055715311406 -18.750759391098807
		-26.725064690972815 100.61055715311406 4.0901359218409069e-015
		-18.958245846385005 100.61055715311406 18.750759391098832
		-0.20748645528618503 95.970830854886074 26.517578235686653
		18.543272935812631 100.61055715311406 18.750759391098839
		26.310091780400462 100.61055715311406 2.6016909676257161e-014
		18.543272935812677 100.61055715311406 -18.750759391098793
		-0.20748645528618009 95.970830854886074 -26.517578235686631
		-18.958245846384997 100.61055715311406 -18.750759391098807
		;
createNode transform -n "Hips_Ctrl" -p "COG__Ctrl";
	addAttr -ci true -sn "SpineSystem" -ln "SpineSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 0 100 1.3683285221464905 ;
	setAttr ".sp" -type "double3" 0 100 1.3683285221464905 ;
	setAttr ".mirrorIndex" 3;
createNode nurbsCurve -n "Hips_CtrlShape" -p "Hips_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-14.462421054665471 101.52575730347908 10.893576864326164
		-14.462421054665471 94.197661404080122 10.893576864326164
		13.304482867510108 94.197661404080122 10.893576864326164
		13.304482867510108 101.52575730347908 10.893576864326164
		-14.462421054665471 101.52575730347908 10.893576864326164
		-14.462421054665471 101.52575730347908 -9.0582032646159334
		-14.462421054665471 94.197661404080122 -9.0582032646159352
		-14.462421054665471 94.197661404080122 10.893576864326164
		13.304482867510108 94.197661404080122 10.893576864326164
		13.304482867510108 94.197661404080122 -9.0582032646159352
		-14.462421054665471 94.197661404080122 -9.0582032646159352
		-14.462421054665471 101.52575730347908 -9.0582032646159334
		13.304482867510108 101.52575730347908 -9.0582032646159334
		13.304482867510108 94.197661404080122 -9.0582032646159352
		13.304482867510108 94.197661404080122 10.893576864326164
		13.304482867510108 101.52575730347908 10.893576864326164
		13.304482867510108 101.52575730347908 -9.0582032646159334
		;
createNode transform -n "Chest_Ctrl" -p "COG__Ctrl";
	addAttr -ci true -sn "SpineSystem" -ln "SpineSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 0 132.33332824707031 1.3683285221464905 ;
	setAttr ".sp" -type "double3" 0 132.33332824707031 1.3683285221464905 ;
	setAttr ".mirrorIndex" 4;
createNode nurbsCurve -n "Chest_CtrlShape" -p "Chest_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		18.543272935812677 126.22115167127018 -18.750759391098789
		-0.20748645528618001 143.1563620169841 -26.517578235686621
		-18.958245846384997 126.22115167127018 -18.750759391098804
		-26.725064690972815 126.22115167127018 1.1521195184952829e-014
		-18.958245846385005 126.22115167127018 18.750759391098835
		-0.20748645528618495 143.1563620169841 26.517578235686663
		18.543272935812631 126.22115167127018 18.750759391098843
		26.310091780400462 126.22115167127018 3.3447968939369077e-014
		18.543272935812677 126.22115167127018 -18.750759391098789
		-0.20748645528618001 143.1563620169841 -26.517578235686621
		-18.958245846384997 126.22115167127018 -18.750759391098804
		;
createNode transform -n "R_Clav_Ctrl" -p "Chest_Ctrl";
	addAttr -ci true -sn "R_ArmSystem" -ln "R_ArmSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -2.9203133449028762 0.92513433288817748 1.3683285221464585 ;
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" -4.0796861782599656 145.66341242004151 3.219646771412954e-014 ;
	setAttr ".sp" -type "double3" -4.0796861782599656 145.66341242004151 3.219646771412954e-014 ;
	setAttr ".mirrorSide" 2;
	setAttr ".mirrorIndex" 3;
createNode nurbsCurve -n "R_Clav_CtrlShape" -p "R_Clav_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-20.141032190364967 150.0125285024491 3.6572374355173496
		-20.141032190364967 141.94845046581116 3.6572374355173478
		-12.076954153727067 141.94845046581116 3.6572374355173478
		-12.076954153727067 150.0125285024491 3.6572374355173496
		-20.141032190364967 150.0125285024491 3.6572374355173496
		-20.141032190364967 150.0125285024491 -4.4068406011205496
		-20.141032190364967 141.94845046581116 -4.4068406011205514
		-20.141032190364967 141.94845046581116 3.6572374355173478
		-12.076954153727067 141.94845046581116 3.6572374355173478
		-12.076954153727067 141.94845046581116 -4.4068406011205514
		-20.141032190364967 141.94845046581116 -4.4068406011205514
		-20.141032190364967 150.0125285024491 -4.4068406011205496
		-12.076954153727067 150.0125285024491 -4.4068406011205496
		-12.076954153727067 141.94845046581116 -4.4068406011205514
		-12.076954153727067 141.94845046581116 3.6572374355173478
		-12.076954153727067 150.0125285024491 3.6572374355173496
		-12.076954153727067 150.0125285024491 -4.4068406011205496
		;
createNode transform -n "L_Clav_Ctrl" -p "Chest_Ctrl";
	addAttr -ci true -sn "L_ArmSystem" -ln "L_ArmSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 4.2486303597482458 0.92484441589593291 1.3683285221464585 ;
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 2.7513701170889124 145.66370233703375 3.219646771412954e-014 ;
	setAttr ".sp" -type "double3" 2.7513701170889124 145.66370233703375 3.219646771412954e-014 ;
	setAttr ".mirrorSide" 1;
	setAttr ".mirrorIndex" 3;
createNode nurbsCurve -n "L_Clav_CtrlShape" -p "L_Clav_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		10.255273664641294 150.01249938523631 3.6572374355173487
		10.255273664641294 141.94842134859837 3.6572374355173474
		18.319351701279192 141.94842134859837 3.6572374355173474
		18.319351701279192 150.01249938523631 3.6572374355173487
		10.255273664641294 150.01249938523631 3.6572374355173487
		10.255273664641294 150.01249938523631 -4.4068406011205505
		10.255273664641294 141.94842134859837 -4.4068406011205523
		10.255273664641294 141.94842134859837 3.6572374355173474
		18.319351701279192 141.94842134859837 3.6572374355173474
		18.319351701279192 141.94842134859837 -4.4068406011205523
		10.255273664641294 141.94842134859837 -4.4068406011205523
		10.255273664641294 150.01249938523631 -4.4068406011205505
		18.319351701279192 150.01249938523631 -4.4068406011205505
		18.319351701279192 141.94842134859837 -4.4068406011205523
		18.319351701279192 141.94842134859837 3.6572374355173474
		18.319351701279192 150.01249938523631 3.6572374355173487
		18.319351701279192 150.01249938523631 -4.4068406011205505
		;
createNode ikHandle -n "ikHandle4" -p "Chest_Ctrl";
	addAttr -ci true -sn "SpineSupport" -ln "SpineSupport" -at "message";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 132.33332824707034 1.3683285221464907 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".hsh" no;
	setAttr ".roc" yes;
createNode transform -n "Head_grp" -p "Chest_Ctrl";
	addAttr -ci true -sn "SpineSystem" -ln "SpineSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -0.89873123680194122 7.2974370837630724 -2.9068935652228891 ;
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 0.89873123680194122 146.57011158175257 4.2752220873693796 ;
	setAttr ".sp" -type "double3" 0.89873123680194122 146.57011158175257 4.2752220873693796 ;
	setAttr ".mirrorIndex" 5;
createNode transform -n "Head_Ctrl" -p "Head_grp";
	addAttr -ci true -sn "SpineSystem" -ln "SpineSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 0.89873123680194122 146.57011158175257 4.2752220873693796 ;
	setAttr ".sp" -type "double3" 0.89873123680194122 146.57011158175257 4.2752220873693796 ;
	setAttr ".mirrorIndex" 5;
createNode nurbsCurve -n "Head_CtrlShape" -p "Head_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-6.6210338646281919 169.4507891578634 10.777815756699102
		-6.6210338646281919 150.70016848746985 13.539753751100108
		7.6110435580106914 150.70016848746985 13.539753751100108
		7.6110435580106914 169.4507891578634 10.777815756699102
		-6.6210338646281919 169.4507891578634 10.777815756699102
		-6.6210338646281919 169.4507891578634 -3.4542616659397782
		-6.6210338646281919 150.70016848746985 -3.4542616659397827
		-6.6210338646281919 150.70016848746985 13.539753751100108
		7.6110435580106914 150.70016848746985 13.539753751100108
		7.6110435580106914 150.70016848746985 -3.4542616659397827
		-6.6210338646281919 150.70016848746985 -3.4542616659397827
		-6.6210338646281919 169.4507891578634 -3.4542616659397782
		7.6110435580106914 169.4507891578634 -3.4542616659397782
		7.6110435580106914 150.70016848746985 -3.4542616659397827
		7.6110435580106914 150.70016848746985 13.539753751100108
		7.6110435580106914 169.4507891578634 10.777815756699102
		7.6110435580106914 169.4507891578634 -3.4542616659397782
		;
createNode ikHandle -n "ikHandle3" -p "Head_Ctrl";
	addAttr -ci true -sn "SpineSupport" -ln "SpineSupport" -at "message";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0.89873123680194122 152.05405135855924 4.2752220873693796 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".hsh" no;
	setAttr ".roc" yes;
createNode transform -n "L_Elbow_Ctrl" -p "COG__Ctrl";
	addAttr -ci true -sn "L_ArmSystem" -ln "L_ArmSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 42.21837 145.04758968275161 -4.2417787805836262 ;
	setAttr ".sp" -type "double3" 42.21837 145.04758968275161 -4.2417787805836262 ;
	setAttr ".mirrorSide" 1;
	setAttr ".mirrorIndex" 2;
createNode nurbsCurve -n "L_Elbow_CtrlShape" -p "L_Elbow_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		45.354095405326781 148.18331508807839 -4.2417787805836262
		42.21837 149.48217507884263 -4.2417787805836262
		39.082644594673219 148.18331508807839 -4.2417787805836262
		37.783784603908991 145.04758968275161 -4.2417787805836262
		39.082644594673219 141.91186427742485 -4.2417787805836262
		42.21837 140.61300428666061 -4.2417787805836262
		45.354095405326781 141.91186427742485 -4.2417787805836262
		46.652955396091009 145.04758968275161 -4.2417787805836262
		45.354095405326781 148.18331508807839 -4.2417787805836262
		42.21837 149.48217507884263 -4.2417787805836262
		39.082644594673219 148.18331508807839 -4.2417787805836262
		;
createNode nurbsCurve -n "L_Elbow_Ctrl1Shape" -p "L_Elbow_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		45.354095405326781 145.04758968275161 -1.1060533752568471
		42.21837 145.04758968275161 0.1928066155073811
		39.082644594673219 145.04758968275161 -1.1060533752568471
		37.783784603908991 145.04758968275161 -4.241778780583628
		39.082644594673219 145.04758968275161 -7.3775041859104098
		42.21837 145.04758968275161 -8.6763641766746371
		45.354095405326781 145.04758968275161 -7.3775041859104098
		46.652955396091009 145.04758968275161 -4.241778780583628
		45.354095405326781 145.04758968275161 -1.1060533752568471
		42.21837 145.04758968275161 0.1928066155073811
		39.082644594673219 145.04758968275161 -1.1060533752568471
		;
createNode transform -n "R_Elbow_Ctrl" -p "COG__Ctrl";
	addAttr -ci true -sn "R_ArmSystem" -ln "R_ArmSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" -42.159232445547389 145.04758968275161 -4.2417787805836262 ;
	setAttr ".sp" -type "double3" -42.159232445547389 145.04758968275161 -4.2417787805836262 ;
	setAttr ".mirrorSide" 2;
	setAttr ".mirrorIndex" 2;
createNode nurbsCurve -n "R_Elbow_CtrlShape" -p "R_Elbow_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-39.023507040220608 148.18331508807839 -4.2417787805836262
		-42.159232445547389 149.48217507884263 -4.2417787805836262
		-45.294957850874184 148.18331508807839 -4.2417787805836262
		-46.593817841638405 145.04758968275161 -4.2417787805836262
		-45.294957850874184 141.91186427742485 -4.2417787805836262
		-42.159232445547389 140.61300428666061 -4.2417787805836262
		-39.023507040220615 141.91186427742485 -4.2417787805836262
		-37.724647049456387 145.04758968275161 -4.2417787805836262
		-39.023507040220608 148.18331508807839 -4.2417787805836262
		-42.159232445547389 149.48217507884263 -4.2417787805836262
		-45.294957850874184 148.18331508807839 -4.2417787805836262
		;
createNode nurbsCurve -n "R_Elbow_Ctrl1Shape" -p "R_Elbow_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-39.023507040220608 145.04758968275161 -1.1060533752568471
		-42.159232445547389 145.04758968275161 0.1928066155073811
		-45.294957850874184 145.04758968275161 -1.1060533752568471
		-46.593817841638405 145.04758968275161 -4.241778780583628
		-45.294957850874184 145.04758968275161 -7.3775041859104098
		-42.159232445547389 145.04758968275161 -8.6763641766746371
		-39.023507040220615 145.04758968275161 -7.3775041859104098
		-37.724647049456387 145.04758968275161 -4.241778780583628
		-39.023507040220608 145.04758968275161 -1.1060533752568471
		-42.159232445547389 145.04758968275161 0.1928066155073811
		-45.294957850874184 145.04758968275161 -1.1060533752568471
		;
createNode transform -n "L_Wrist_Ctrl" -p "World_Ctrl";
	addAttr -ci true -sn "L_ArmSystem" -ln "L_ArmSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr ".ro" 2;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 73.006420972769334 145.24822978367615 1.445585507326189 ;
	setAttr ".sp" -type "double3" 73.006420972769334 145.24822978367615 1.445585507326189 ;
	setAttr ".mirrorSide" 1;
	setAttr ".mirrorIndex" 1;
createNode nurbsCurve -n "L_Wrist_CtrlShape" -p "L_Wrist_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		68.153890305033912 141.10051493736063 6.3774346392777286
		68.153890305033912 141.10051493736063 -2.7681285854623496
		77.299453529773999 141.10051493736066 -2.7681285854623408
		77.299453529773999 141.10051493736066 6.3774346392777375
		68.153890305033912 141.10051493736063 6.3774346392777286
		68.153890305033912 150.24607816210076 6.3774346392777304
		68.153890305033912 150.2460781621007 -2.7681285854623479
		68.153890305033912 141.10051493736063 -2.7681285854623496
		77.299453529773999 141.10051493736066 -2.7681285854623408
		77.299453529773999 150.24607816210076 -2.768128585462339
		68.153890305033912 150.2460781621007 -2.7681285854623479
		68.153890305033912 150.24607816210076 6.3774346392777304
		77.299453529773999 150.24607816210076 6.3774346392777375
		77.299453529773999 150.24607816210076 -2.768128585462339
		77.299453529773999 141.10051493736066 -2.7681285854623408
		77.299453529773999 141.10051493736066 6.3774346392777375
		77.299453529773999 150.24607816210076 6.3774346392777375
		;
createNode ikHandle -n "ikHandle1" -p "L_Wrist_Ctrl";
	addAttr -ci true -sn "L_ArmSupport" -ln "L_ArmSupport" -at "message";
	setAttr -l on -k off ".v";
	setAttr ".r" -type "double3" 0.13773773936826594 6.0182351407845323 0.28635467095359279 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 73.17349937916488 144.90316444637247 8.8196703113414365 ;
	setAttr ".rpt" -type "double3" -0.16708395678126953 0.34506532331571416 -7.3740845089483757 ;
	setAttr ".sp" -type "double3" 73.17349937916488 144.90316444637247 8.8196703113414365 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ikHandle1_poleVectorConstraint1" -p "ikHandle1";
	addAttr -ci true -k true -sn "w0" -ln "L_Elbow_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 73.173499379164895 144.90316444637247 8.8196703113414365 ;
	setAttr ".sp" -type "double3" 73.173499379164895 144.90316444637247 8.8196703113414365 ;
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 23.794787556370306 -1.4086991316787305 -8.1527236112153876 ;
	setAttr -k on ".w0";
createNode transform -n "R_Wrist_Ctrl" -p "World_Ctrl";
	addAttr -ci true -sn "R_ArmSystem" -ln "R_ArmSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr ".ro" 2;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" -73.981885781213663 145.24822978367615 1.3803928258986966 ;
	setAttr ".sp" -type "double3" -73.981885781213663 145.24822978367615 1.3803928258986966 ;
	setAttr ".mirrorSide" 2;
	setAttr ".mirrorIndex" 1;
createNode nurbsCurve -n "R_Wrist_CtrlShape" -p "R_Wrist_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-78.834416448949113 150.18007891562769 5.5281076722142144
		-78.834416448949113 141.03451569088762 5.5281076722142126
		-69.688853224209041 141.03451569088762 5.5281076722142126
		-69.688853224209041 150.18007891562769 5.5281076722142144
		-78.834416448949113 150.18007891562769 5.5281076722142144
		-78.834416448949113 150.18007891562769 -3.6174555525258656
		-78.834416448949113 141.03451569088762 -3.6174555525258674
		-78.834416448949113 141.03451569088762 5.5281076722142126
		-69.688853224209041 141.03451569088762 5.5281076722142126
		-69.688853224209041 141.03451569088762 -3.6174555525258674
		-78.834416448949113 141.03451569088762 -3.6174555525258674
		-78.834416448949113 150.18007891562769 -3.6174555525258656
		-69.688853224209041 150.18007891562769 -3.6174555525258656
		-69.688853224209041 141.03451569088762 -3.6174555525258674
		-69.688853224209041 141.03451569088762 5.5281076722142126
		-69.688853224209041 150.18007891562769 5.5281076722142144
		-69.688853224209041 150.18007891562769 -3.6174555525258656
		;
createNode ikHandle -n "ikHandle2" -p "R_Wrist_Ctrl";
	addAttr -ci true -sn "R_ArmSupport" -ln "R_ArmSupport" -at "message";
	setAttr -l on -k off ".v";
	setAttr ".r" -type "double3" 0 -3.789539618674497 0 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" -73.765720773446347 145.24822978367612 6.2681701849791569 ;
	setAttr ".rpt" -type "double3" -0.25298925324243332 0 -4.889009324572096 ;
	setAttr ".sp" -type "double3" -73.765720773446347 145.24822978367612 6.2681701849791569 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ikHandle2_poleVectorConstraint1" -p "ikHandle2";
	addAttr -ci true -k true -sn "w0" -ln "R_Elbow_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -73.765720773446333 145.24822978367612 6.268170184979156 ;
	setAttr ".sp" -type "double3" -73.765720773446333 145.24822978367612 6.268170184979156 ;
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -24.027712390238268 -1.5413843162718592 -7.2139132969495492 ;
	setAttr -k on ".w0";
createNode transform -n "L_Knee_Ctrl" -p "World_Ctrl";
	addAttr -ci true -sn "L_LegSystem" -ln "L_LegSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 9.21837 48.851354599999986 9.4000352924302479 ;
	setAttr ".sp" -type "double3" 9.21837 48.851354599999986 9.4000352924302479 ;
	setAttr ".mirrorSide" 1;
	setAttr ".mirrorIndex" 5;
createNode nurbsCurve -n "L_Knee_CtrlShape" -p "L_Knee_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		12.354095405326786 51.987080005326767 9.4000352924302479
		9.2183700000000002 53.285939996090995 9.4000352924302479
		6.0826445946732166 51.987080005326767 9.4000352924302479
		4.783784603908992 48.851354599999986 9.4000352924302479
		6.0826445946732157 45.715629194673205 9.4000352924302479
		9.2183699999999984 44.416769203908977 9.4000352924302479
		12.354095405326779 45.715629194673205 9.4000352924302479
		13.652955396091008 48.851354599999986 9.4000352924302479
		12.354095405326786 51.987080005326767 9.4000352924302479
		9.2183700000000002 53.285939996090995 9.4000352924302479
		6.0826445946732166 51.987080005326767 9.4000352924302479
		;
createNode nurbsCurve -n "L_Knee_Ctrl1Shape" -p "L_Knee_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		12.354095405326786 48.851354599999979 12.535760697757029
		9.2183700000000002 48.851354599999979 13.834620688521255
		6.0826445946732166 48.851354599999979 12.535760697757029
		4.783784603908992 48.851354599999979 9.4000352924302462
		6.0826445946732157 48.851354599999979 6.2643098871034653
		9.2183699999999984 48.851354599999979 4.9654498963392371
		12.354095405326779 48.851354599999979 6.2643098871034653
		13.652955396091008 48.851354599999979 9.4000352924302462
		12.354095405326786 48.851354599999979 12.535760697757029
		9.2183700000000002 48.851354599999979 13.834620688521255
		6.0826445946732166 48.851354599999979 12.535760697757029
		;
createNode transform -n "R_Knee_Ctrl" -p "World_Ctrl";
	addAttr -ci true -sn "R_LegSystem" -ln "R_LegSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" -9.1592324455473957 48.851354599999986 9.4000352924302479 ;
	setAttr ".sp" -type "double3" -9.1592324455473957 48.851354599999986 9.4000352924302479 ;
	setAttr ".mirrorSide" 2;
	setAttr ".mirrorIndex" 5;
createNode nurbsCurve -n "R_Knee_CtrlShape" -p "R_Knee_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-6.0235070402206095 51.987080005326767 9.4000352924302479
		-9.1592324455473957 53.285939996090995 9.4000352924302479
		-12.29495785087418 51.987080005326767 9.4000352924302479
		-13.593817841638405 48.851354599999986 9.4000352924302479
		-12.29495785087418 45.715629194673205 9.4000352924302479
		-9.1592324455473975 44.416769203908977 9.4000352924302479
		-6.0235070402206148 45.715629194673205 9.4000352924302479
		-4.7246470494563866 48.851354599999986 9.4000352924302479
		-6.0235070402206095 51.987080005326767 9.4000352924302479
		-9.1592324455473957 53.285939996090995 9.4000352924302479
		-12.29495785087418 51.987080005326767 9.4000352924302479
		;
createNode nurbsCurve -n "R_Knee_Ctrl1Shape" -p "R_Knee_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-6.0235070402206095 48.851354599999979 12.535760697757029
		-9.1592324455473957 48.851354599999979 13.834620688521255
		-12.29495785087418 48.851354599999979 12.535760697757029
		-13.593817841638405 48.851354599999979 9.4000352924302462
		-12.29495785087418 48.851354599999979 6.2643098871034653
		-9.1592324455473975 48.851354599999979 4.9654498963392371
		-6.0235070402206148 48.851354599999979 6.2643098871034653
		-4.7246470494563866 48.851354599999979 9.4000352924302462
		-6.0235070402206095 48.851354599999979 12.535760697757029
		-9.1592324455473957 48.851354599999979 13.834620688521255
		-12.29495785087418 48.851354599999979 12.535760697757029
		;
createNode transform -n "L_Foot_grp" -p "World_Ctrl";
	addAttr -ci true -sn "L_LegSystem" -ln "L_LegSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -2.6463185313423025 4.6560043162446387 -8.2911793656991577 ;
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr ".r" -type "double3" 2.0817417912804572 0 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 11.556319332428728 4.2653359704033722 1.7752220873693432 ;
	setAttr ".sp" -type "double3" 11.556319332428728 4.2653359704033722 1.7752220873693432 ;
	setAttr ".mirrorSide" 1;
	setAttr ".mirrorIndex" 4;
createNode transform -n "L_Foot_Ctrl" -p "L_Foot_grp";
	addAttr -ci true -sn "L_LegSystem" -ln "L_LegSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr ".ro" 2;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 11.556319332428728 4.2653359704033722 1.7752220873693441 ;
	setAttr ".sp" -type "double3" 11.556319332428728 4.2653359704033722 1.7752220873693441 ;
	setAttr ".mirrorSide" 1;
	setAttr ".mirrorIndex" 4;
createNode nurbsCurve -n "L_Foot_CtrlShape" -p "L_Foot_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		5.8761903660509986 -0.52025729324039105 25.964616904833537
		5.8761903660509986 -3.7722638552275889 25.805557348308035
		16.581527878307838 -3.7722638552275889 25.805557348308035
		16.581527878307838 -0.52025729324039105 25.964616904833537
		5.8761903660509986 -0.52025729324039105 25.964616904833537
		5.8761903660509986 6.3497198938210966 0.75731476489912353
		5.8761903660509986 -3.7722638552275849 0.84797369078788587
		5.8761903660509986 -3.7722638552275889 25.805557348308035
		16.581527878307838 -3.7722638552275889 25.805557348308035
		16.581527878307838 -3.7722638552275849 0.84797369078788587
		5.8761903660509986 -3.7722638552275849 0.84797369078788587
		5.8761903660509986 6.3497198938210966 0.75731476489912353
		16.581527878307838 6.3497198938210966 0.75731476489912353
		16.581527878307838 -3.7722638552275849 0.84797369078788587
		16.581527878307838 -3.7722638552275889 25.805557348308035
		16.581527878307838 -0.52025729324039105 25.964616904833537
		16.581527878307838 6.3497198938210966 0.75731476489912353
		;
createNode ikHandle -n "ikHandle5" -p "L_Foot_Ctrl";
	addAttr -ci true -sn "L_LegSupport" -ln "L_LegSupport" -at "message";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 11.556319332428728 3.9351750887033177 4.372426319569664 ;
	setAttr ".r" -type "double3" -2.0817417912804572 0 0 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 0 -0.013497422390337022 -0.00049062111038278289 ;
	setAttr ".rpt" -type "double3" 0 -8.9139099749314756e-006 0.00049062111038260963 ;
	setAttr ".sp" -type "double3" 0 -0.013497422390337022 -0.00049062111038278289 ;
	setAttr ".hsh" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ikHandle5_poleVectorConstraint1" -p "ikHandle5";
	addAttr -ci true -k true -sn "w0" -ln "L_Knee_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -0.013497422390337022 -0.00049062111038367107 ;
	setAttr ".sp" -type "double3" 0 -0.013497422390337022 -0.00049062111038367107 ;
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0.30836919891357617 -44.557268331526899 9.6566340890899447 ;
	setAttr -k on ".w0";
createNode transform -n "R_Foot_grp" -p "World_Ctrl";
	addAttr -ci true -sn "R_LegSystem" -ln "R_LegSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0.84885415038978351 4.6560043162446387 -8.2907403416926755 ;
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr ".r" -type "double3" 2.0817417912804572 0 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" -9.7588568588248421 4.2653359704033722 1.7752220873693432 ;
	setAttr ".sp" -type "double3" -9.7588568588248421 4.2653359704033722 1.7752220873693432 ;
	setAttr ".mirrorSide" 2;
	setAttr ".mirrorIndex" 4;
createNode transform -n "R_Foot_Ctrl" -p "R_Foot_grp";
	addAttr -ci true -sn "R_LegSystem" -ln "R_LegSystem" -at "message";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "mirrorIndex" -ln "mirrorIndex" -at "long";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -1.1102230246251563e-016 0 0 ;
	setAttr ".ro" 2;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" -9.7588568588248421 4.2653359704033713 1.7752220873693432 ;
	setAttr ".sp" -type "double3" -9.7588568588248421 4.2653359704033713 1.7752220873693432 ;
	setAttr ".mirrorSide" 2;
	setAttr ".mirrorIndex" 4;
createNode nurbsCurve -n "R_Foot_CtrlShape" -p "R_Foot_Ctrl";
	setAttr -l on -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-15.43898582520257 -0.52025729324039105 25.964779525595251
		-15.43898582520257 -3.7722638552275889 25.805719969069749
		-4.7336483129457303 -3.7722638552275889 25.805719969069749
		-4.7336483129457303 -0.52025729324039105 25.964779525595251
		-15.43898582520257 -0.52025729324039105 25.964779525595251
		-15.43898582520257 6.3497198938210966 0.75747738566081213
		-15.43898582520257 -3.7722638552275849 0.84813631154957458
		-15.43898582520257 -3.7722638552275889 25.805719969069749
		-4.7336483129457303 -3.7722638552275889 25.805719969069749
		-4.7336483129457303 -3.7722638552275849 0.84813631154957458
		-15.43898582520257 -3.7722638552275849 0.84813631154957458
		-15.43898582520257 6.3497198938210966 0.75747738566081213
		-4.7336483129457303 6.3497198938210966 0.75747738566081213
		-4.7336483129457303 -3.7722638552275849 0.84813631154957458
		-4.7336483129457303 -3.7722638552275889 25.805719969069749
		-4.7336483129457303 -0.52025729324039105 25.964779525595251
		-4.7336483129457303 6.3497198938210966 0.75747738566081213
		;
createNode ikHandle -n "ikHandle6" -p "R_Foot_Ctrl";
	addAttr -ci true -sn "R_LegSupport" -ln "R_LegSupport" -at "message";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -9.7588568588248403 3.9351752727420655 4.3724243732133719 ;
	setAttr ".r" -type "double3" -2.0817417912804572 0 0 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".rp" -type "double3" 1.7763568394002505e-015 -0.013497414866582956 -0.00049062083690021296 ;
	setAttr ".rpt" -type "double3" 0 -8.9139050061334738e-006 0.00049062083689983165 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-015 -0.013497414866582956 -0.00049062083690021296 ;
	setAttr ".hsh" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ikHandle6_poleVectorConstraint1" -p "ikHandle6";
	addAttr -ci true -k true -sn "w0" -ln "R_Knee_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.7763568394002505e-015 -0.013497414866582956 -0.00049062083690110114 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-015 -0.013497414866582956 -0.00049062083690110114 ;
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -0.24923164446097168 -44.557268331526899 9.6566340890899447 ;
	setAttr -k on ".w0";
createNode joint -n "Character1_Pelvis";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "RED_Rig" -ln "RED_Rig" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".typ" 1;
	setAttr ".radi" 3;
createNode joint -n "Character1_LeftUpLeg" -p "Character1_Pelvis";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 8.9100029253966628 -6.2700057673468024 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0.1357771471236478 1.6320885585384577 0.10152333658834904 ;
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 2;
	setAttr ".radi" 3;
createNode joint -n "Character1_LeftLeg" -p "Character1_LeftUpLeg";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 0 -44.878649921095338 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 7.2003122188390671 0 0 ;
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" 100.95743378979577 0 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 3;
	setAttr ".radi" 3;
createNode joint -n "Character1_LeftFoot" -p "Character1_LeftLeg";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 0 -40.700969863169178 0 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" -98.875691998515293 0 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 4;
	setAttr ".radi" 3;
createNode joint -n "Character1_LeftToeBase" -p "Character1_LeftFoot";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 8.583070894019329e-006 -6.2623186736866652 12.954723585778138 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 5;
	setAttr ".radi" 3;
createNode orientConstraint -n "Character1_LeftFoot_orientConstraint1" -p "Character1_LeftFoot";
	addAttr -ci true -k true -sn "w0" -ln "L_Foot_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -5.2544355115651928 -1.6316911726886796 0.10772333607386461 ;
	setAttr ".rsrr" -type "double3" -9.0877809608762981 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "Character1_LeftFoot_LowProxy" -p "Character1_LeftFoot";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -3.5527136788005009e-015 0 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 115.79914175852851 5.5467786393121089e-005 -3.6215995217843023e-005 ;
	setAttr ".s" -type "double3" 8.0555574761501187 13.381711098624947 8.0555574761501276 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftFoot_LowProxyShape" -p "Character1_LeftFoot_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  6.099919e-007 0.53345907 
		0.64936852 6.099919e-007 0.53345907 0.64936852 -4.9724099e-007 0.70147532 -0.30047783 
		-4.9724099e-007 0.70147532 -0.30047783 3.6014249e-008 0.48065126 0.017004412 3.6014249e-008 
		0.48065126 0.017004412 7.961998e-007 0.14885247 0.45258442 7.961998e-007 0.14885247 
		0.45258442;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode ikEffector -n "effector5" -p "Character1_LeftLeg";
	setAttr ".v" no;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".hd" yes;
createNode transform -n "Character1_LeftLeg_LowProxy" -p "Character1_LeftLeg";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -3.5527136788005009e-015 0 -1.7763568394002505e-015 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0 1.6455513801694155 -179.99999999999997 ;
	setAttr ".s" -type "double3" 8.0555574761501294 37.851901972747349 8.0555574761501223 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftLeg_LowProxyShape" -p "Character1_LeftLeg_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftUpLeg_LowProxy" -p "Character1_LeftUpLeg";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 2.8588253411666133e-016 1.6320931387751785 179.99999999999898 ;
	setAttr ".s" -type "double3" 8.0555574761501276 41.737144426618663 8.0555574761501205 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftUpLeg_LowProxyShape" -p "Character1_LeftUpLeg_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode joint -n "Character1_RightUpLeg" -p "Character1_Pelvis";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -8.9100029253966628 -6.2700057673468024 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0.13526497367250026 -1.3192410944013944 -0.082039375523036237 ;
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 2;
	setAttr ".typ" 2;
	setAttr ".radi" 3;
createNode joint -n "Character1_RightLeg" -p "Character1_RightUpLeg";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -2.8610236313397763e-006 -44.878649921095338 0.00043902411115371849 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 7.2003371515292098 4.4733998739168701e-006 -1.8321896398024943e-005 ;
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" 100.95743654195257 0 0 ;
	setAttr ".sd" 2;
	setAttr ".typ" 3;
	setAttr ".radi" 3;
createNode joint -n "Character1_RightFoot" -p "Character1_RightLeg";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 9.5367454377992544e-007 -40.700969863169178 -5.4210108624275222e-020 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" -98.875694750672096 0 0 ;
	setAttr ".sd" 2;
	setAttr ".typ" 4;
	setAttr ".radi" 3;
createNode joint -n "Character1_RightToeBase" -p "Character1_RightFoot";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -0.0010852816308215552 -6.2623186736866652 12.954751862193437 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" 0 1.4622811973002442e-006 0 ;
	setAttr ".sd" 2;
	setAttr ".typ" 5;
	setAttr ".radi" 3;
createNode orientConstraint -n "Character1_RightFoot_orientConstraint1" -p "Character1_RightFoot";
	addAttr -ci true -k true -sn "w0" -ln "R_Foot_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -5.2539181420956469 1.3189157421495348 -0.087063350067915546 ;
	setAttr ".rsrr" -type "double3" -9.0877809608762981 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "Character1_RightFoot_LowProxy" -p "Character1_RightFoot";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 -1.7763568394002505e-015 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 115.79909220454249 -0.0070135740471500433 0.0045793030658510614 ;
	setAttr ".s" -type "double3" 8.0555574761501241 13.381734812604725 8.0555574761501241 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightFoot_LowProxyShape" -p "Character1_RightFoot_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  -7.7129895e-005 0.53345859 
		0.6493687 -7.7129895e-005 0.53345859 0.6493687 6.2873267e-005 0.70147508 -0.30047804 
		6.2873267e-005 0.70147508 -0.30047804 -4.5537681e-006 0.48065096 0.017004527 -4.5537681e-006 
		0.48065096 0.017004527 -0.0001006747 0.14885269 0.45258373 -0.0001006747 0.14885269 
		0.45258373;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode ikEffector -n "effector6" -p "Character1_RightLeg";
	setAttr ".v" no;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".hd" yes;
createNode transform -n "Character1_RightLeg_LowProxy" -p "Character1_RightLeg";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 0 -1.7763568394002505e-015 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 1.3447829096640157e-015 -1.3301195211631849 -179.99999865748839 ;
	setAttr ".s" -type "double3" 8.0555574761501241 37.851901972747363 8.0555574761501276 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightLeg_LowProxyShape" -p "Character1_RightLeg_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightUpLeg_LowProxy" -p "Character1_RightUpLeg";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 -2.8421709430404007e-014 4.4408920985006262e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0.00056064293455218713 -1.3192447304090298 179.99998343962687 ;
	setAttr ".s" -type "double3" 8.0555574761501205 41.737144428615821 8.0555574761501294 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightUpLeg_LowProxyShape" -p "Character1_RightUpLeg_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode joint -n "Character1_Spine" -p "Character1_Pelvis";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 0 7.0000016689304516 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 4.9520035868531036e-047 -2.5444437451708134e-014 -2.2301841508488997e-031 ;
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" 3.2357823266255665e-033 -2.0567998291869544e-007 -1.8027682432466325e-024 ;
	setAttr ".typ" 6;
	setAttr ".radi" 3;
createNode joint -n "Character1_Spine2" -p "Character1_Spine";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 0 25.333334287007901 2.2204460492503131e-016 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".is" -type "double3" 0.99999976158142068 0.99999976158142068 0.99999976158142068 ;
	setAttr ".typ" 6;
	setAttr ".radi" 3;
createNode joint -n "Character1_LeftShoulder" -p "Character1_Spine2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 7.0000021457677235 14.255221904569112 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 9;
	setAttr ".radi" 3;
createNode joint -n "Character1_LeftArm" -p "Character1_LeftShoulder";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 10.707252671063586 0.00013732913430430926 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 170.47906226228181 -0.080585563437296698 -1.3900819329637835 ;
	setAttr ".s" -type "double3" 0.99999976158142112 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" 171.96627436729682 15.275605622435256 -3.946171877276361 ;
	setAttr ".sd" 1;
	setAttr ".typ" 10;
	setAttr ".radi" 3;
createNode joint -n "Character1_LeftForeArm" -p "Character1_LeftArm";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 27.305474115723161 0 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -1.9826179977503648e-016 -0.0006195893242094872 -0.0031835747633051814 ;
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" 0 36.000325796512946 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 11;
	setAttr ".radi" 3;
createNode joint -n "Character1_LeftHand" -p "Character1_LeftForeArm";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 26.697149919784053 0 0 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" -172.05821617431096 -14.40715748011942 -0.73359829345434091 ;
	setAttr ".sd" 1;
	setAttr ".typ" 12;
	setAttr ".radi" 3;
createNode joint -n "Character1_LeftHandThumb1" -p "Character1_LeftHand";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "L_Fingers_System" -ln "L_Fingers_System" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 4.3487635490330376 -0.7985078808088133 4.2824350076758879 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142068 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 14;
createNode joint -n "Character1_LeftHandThumb2" -p "Character1_LeftHandThumb1";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 2.5125891000245133 -0.53608716394595035 0.70745437322959237 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 14;
createNode joint -n "Character1_LeftHandThumb3" -p "Character1_LeftHandThumb2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 2.543137203010815 -1.5258792728900517e-005 9.536745436911076e-006 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142068 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 14;
createNode joint -n "Character1_LeftHandThumb4" -p "Character1_LeftHandThumb3";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 2.6667486826774365 2.8421709430404007e-014 -8.1062336221293663e-006 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 14;
createNode transform -n "Character1_LeftHandThumb3_LowProxy" -p "Character1_LeftHandThumb3";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -0.00017416450875341015 -0.00017416450876134079 -89.999999999470006 ;
	setAttr ".s" -type "double3" 1.6111114952300245 2.4800762749014691 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandThumb3_LowProxyShape" -p "Character1_LeftHandThumb3_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftHandThumb2_LowProxy" -p "Character1_LeftHandThumb2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0.00021485874341637055 0.00021486003255369174 -90.000343772153116 ;
	setAttr ".s" -type "double3" 1.6111114952300234 2.3651175988592605 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandThumb2_LowProxyShape" -p "Character1_LeftHandThumb2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftHandThumb1_LowProxy" -p "Character1_LeftHandThumb1";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 15.395742531921002 -7.1476968480912906e-015 -102.0440616733738 ;
	setAttr ".s" -type "double3" 1.6111114952300245 2.4782336518131109 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandThumb1_LowProxyShape" -p "Character1_LeftHandThumb1_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode joint -n "Character1_LeftHandIndex1" -p "Character1_LeftHand";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "L_Fingers_System" -ln "L_Fingers_System" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 8.8219778113312088 0.19972233765656713 3.4716702632117897 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0 -0.00060923486399865458 0 ;
	setAttr ".s" -type "double3" 0.99999976163795268 0.99999976158142079 0.99999976163795279 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" 0 -0.00060923486399865458 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 19;
createNode joint -n "Character1_LeftHandIndex2" -p "Character1_LeftHandIndex1";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 4.2227580036242358 -1.5258792672057098e-005 0.14715404933912837 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0 -0.00060923483500426219 0 ;
	setAttr ".s" -type "double3" 0.99999976163795301 0.99999976158142112 0.99999976163795301 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" 0 0.00060923483500415594 0 ;
	setAttr ".pa" -type "double3" 0 -0.00060923483500426219 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 19;
createNode joint -n "Character1_LeftHandIndex3" -p "Character1_LeftHandIndex2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 2.6523301063757998 -1.5258792757322226e-005 0.092427921779210553 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0 -0.00060923483500391719 0 ;
	setAttr ".s" -type "double3" 0.99999976163795279 0.99999976158142079 0.99999976163795301 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" 0 0.00060923483500415594 0 ;
	setAttr ".pa" -type "double3" 0 -0.00060923483500391719 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 19;
createNode joint -n "Character1_LeftHandIndex4" -p "Character1_LeftHandIndex3";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 1.9570324417542224 -1.5258792672057098e-005 0.068198153293664188 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0 -0.00060923483500431477 0 ;
	setAttr ".s" -type "double3" 0.99999976163795301 0.99999976158142079 0.99999976163795301 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" 0 0.00060923483500415594 0 ;
	setAttr ".pa" -type "double3" 0 -0.00060923483500431477 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 19;
createNode transform -n "Character1_LeftHandIndex3_LowProxy" -p "Character1_LeftHandIndex3";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -2.8421709430404007e-014 5.6843418860808015e-014 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 1.9958206750336402 -4.7501347600574842e-009 -90.000446728079552 ;
	setAttr ".s" -type "double3" 1.6111114952300245 1.8211449319755155 1.6111114951389442 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandIndex3_LowProxyShape" -p "Character1_LeftHandIndex3_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftHandIndex2_LowProxy" -p "Character1_LeftHandIndex2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 2.8421709430404007e-014 5.6843418860808015e-014 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 1.9958253745760097 -3.5049114535671441e-009 -90.000329620448966 ;
	setAttr ".s" -type "double3" 1.6111114952300241 2.4681642684278096 1.6111114951389447 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandIndex2_LowProxyShape" -p "Character1_LeftHandIndex2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftHandIndex1_LowProxy" -p "Character1_LeftHandIndex1";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 2.8421709430404007e-014 0 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 1.9958272594090856 -2.2014527040198158e-009 -90.00020703605739 ;
	setAttr ".s" -type "double3" 1.6111114952300247 3.9295487411436198 1.6111114951389447 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandIndex1_LowProxyShape" -p "Character1_LeftHandIndex1_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode joint -n "Character1_LeftHandMiddle1" -p "Character1_LeftHand";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "L_Fingers_System" -ln "L_Fingers_System" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 8.8098852181160794 0.50088512918591732 1.3046847116195468 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142068 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 20;
createNode joint -n "Character1_LeftHandMiddle2" -p "Character1_LeftHandMiddle1";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 4.8632518919114887 2.8421709430404007e-014 0.00030243403969620886 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 20;
createNode joint -n "Character1_LeftHandMiddle3" -p "Character1_LeftHandMiddle2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 2.7652365601627058 2.8421709430404007e-014 0.00017178062719835907 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142112 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 20;
createNode joint -n "Character1_LeftHandMiddle4" -p "Character1_LeftHandMiddle3";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 2.0056309713437201 -2.8421709430404007e-014 0.00012362006273747284 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142112 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 20;
createNode transform -n "Character1_LeftHandMiddle3_LowProxy" -p "Character1_LeftHandMiddle3";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0.003531511005881411 -6.3611108795340045e-015 -90.000000000000796 ;
	setAttr ".s" -type "double3" 1.6111114952300241 1.8652368068927301 1.6111114952300241 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandMiddle3_LowProxyShape" -p "Character1_LeftHandMiddle3_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftHandMiddle2_LowProxy" -p "Character1_LeftHandMiddle2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0.0035592994356134465 -6.361110879534081e-015 -89.999999999999417 ;
	setAttr ".s" -type "double3" 1.6111114952300241 2.5716700059134552 1.6111114952300247 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandMiddle2_LowProxyShape" -p "Character1_LeftHandMiddle2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftHandMiddle1_LowProxy" -p "Character1_LeftHandMiddle1";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0.0035630879128805784 -6.3611108795340668e-015 -89.999999999999673 ;
	setAttr ".s" -type "double3" 1.6111114952300234 4.5228242682232462 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandMiddle1_LowProxyShape" -p "Character1_LeftHandMiddle1_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode joint -n "Character1_LeftHandRing1" -p "Character1_LeftHand";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "L_Fingers_System" -ln "L_Fingers_System" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 8.8937628015906114 0.37991342065652134 -0.79315907792069373 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142068 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 21;
createNode joint -n "Character1_LeftHandRing2" -p "Character1_LeftHandRing1";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 4.537758955421225 2.8421709430404007e-014 5.960465898624534e-008 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142112 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 21;
createNode joint -n "Character1_LeftHandRing3" -p "Character1_LeftHandRing2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 2.3045278321570919 0 -1.1920931786146838e-007 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 21;
createNode joint -n "Character1_LeftHandRing4" -p "Character1_LeftHandRing3";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 1.9233479317064308 0 -8.3446522602947937e-007 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142112 0.99999976158142068 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 21;
createNode transform -n "Character1_LeftHandRing3_LowProxy" -p "Character1_LeftHandRing3";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 0 -8.8817841970012523e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -2.4858391360376277e-005 -2.4858391369913228e-005 -89.999999999989228 ;
	setAttr ".s" -type "double3" 1.6111114952300256 1.7887135764871445 1.6111114952300247 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandRing3_LowProxyShape" -p "Character1_LeftHandRing3_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftHandRing2_LowProxy" -p "Character1_LeftHandRing2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 -5.6843418860808015e-014 8.8817841970012523e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -2.963813539511142e-006 -2.9638135490527988e-006 -89.999999999999844 ;
	setAttr ".s" -type "double3" 1.6111114952300247 2.143210883906101 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandRing2_LowProxyShape" -p "Character1_LeftHandRing2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftHandRing1_LowProxy" -p "Character1_LeftHandRing1";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 -5.6843418860808015e-014 -8.8817841970012523e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 3.1805554397669837e-015 -6.3611108795340676e-015 -89.999999999999631 ;
	setAttr ".s" -type "double3" 1.6111114952300241 4.2201158285417417 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandRing1_LowProxyShape" -p "Character1_LeftHandRing1_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode joint -n "Character1_LeftHandPinky1" -p "Character1_LeftHand";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "L_Fingers_System" -ln "L_Fingers_System" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 8.8822805600835011 -0.31303413225035115 -2.4903570390598868 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142068 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 22;
createNode joint -n "Character1_LeftHandPinky2" -p "Character1_LeftHandPinky1";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 3.04409862616032 4.5776378073014712e-005 -4.4408920985006262e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142068 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 22;
createNode joint -n "Character1_LeftHandPinky3" -p "Character1_LeftHandPinky2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 1.9745030342347576 3.0517585429379324e-005 -2.3841863594498136e-007 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 22;
createNode joint -n "Character1_LeftHandPinky4" -p "Character1_LeftHandPinky3";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 1.6666111151244962 1.5258792700478807e-005 9.5367454422401465e-007 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142068 0.99999976158142112 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 22;
createNode transform -n "Character1_LeftHandPinky3_LowProxy" -p "Character1_LeftHandPinky3";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 0 2.2204460492503131e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 3.2786008633857166e-005 3.2785708449354199e-005 -89.999475421441943 ;
	setAttr ".s" -type "double3" 1.6111114952300245 1.5499483371309923 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandPinky3_LowProxyShape" -p "Character1_LeftHandPinky3_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftHandPinky2_LowProxy" -p "Character1_LeftHandPinky2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 0 2.2204460492503131e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -6.9183897712561537e-006 -6.9182828521600854e-006 -89.999114446107583 ;
	setAttr ".s" -type "double3" 1.6111114952300241 1.8362878220576655 1.6111114952300241 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandPinky2_LowProxyShape" -p "Character1_LeftHandPinky2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftHandPinky1_LowProxy" -p "Character1_LeftHandPinky1";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 3.1804597826458151e-015 -6.3611587071956165e-015 -89.999138400693653 ;
	setAttr ".s" -type "double3" 1.6111114952300238 2.8310117226491927 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHandPinky1_LowProxyShape" -p "Character1_LeftHandPinky1_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode orientConstraint -n "Character1_LeftHand_orientConstraint1" -p "Character1_LeftHand";
	addAttr -ci true -k true -sn "w0" -ln "L_Wrist_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -170.47991718233038 0.15107562031227001 -1.3810808440366893 ;
	setAttr ".rsrr" -type "double3" -9.628632336461818e-017 -3.9758389460683533e-015 
		-9.7062825972397335e-017 ;
	setAttr -k on ".w0";
createNode transform -n "Character1_LeftHand_LowProxy" -p "Character1_LeftHand";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -2.8380358994484515e-014 -1.9864081429226761 -6.6764276146276144e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -6.3611108795340494e-015 -3.1805554397670247e-015 1.192708289912635e-015 ;
	setAttr ".s" -type "double3" 8.5407664022916254 3.8694322668195511 8.5407664022916272 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftHand_LowProxyShape" -p "Character1_LeftHand_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.75000012 -0.93301266
		 0.25000006 -0.93301272 0 -0.50000006 0.24999994 -0.066987306 0.75 -0.066987276 1
		 -0.5 0 0 0.16666667 0 0.33333334 0 0.5 0 0.66666669 0 0.83333337 0 1 0 0 1 0.16666667
		 1 0.33333334 1 0.5 1 0.66666669 1 0.83333337 1 1 1 0.75000012 1.066987276 0.25000006
		 1.066987276 0 1.5 0.24999994 1.93301272 0.75 1.93301272 1 1.5 0.5 -0.5 0.5 1.5;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".pt[0:13]" -type "float3"  0.42634091 0.48486277 5.5511151e-017 
		0.42634091 0.48486277 5.5511151e-017 0.42634091 0.48486277 5.5511151e-017 0.42634091 
		0.48486277 5.5511151e-017 0.42634091 0.48486277 5.5511151e-017 0.42634091 0.48486277 
		5.5511151e-017 0.42634091 0.30339864 5.5511151e-017 0.42634091 0.30339864 5.5511151e-017 
		0.42634091 0.30339864 5.5511151e-017 0.42634091 0.30339864 5.5511151e-017 0.42634091 
		0.30339864 5.5511151e-017 0.42634091 0.30339864 5.5511151e-017 0.42634091 0.48486277 
		5.5511151e-017 0.42634091 0.30339864 5.5511151e-017;
	setAttr -s 14 ".vt[0:13]"  0.25000012 -0.5 -0.43301266 -0.24999993 -0.5 -0.43301275
		 -0.5 -0.5 -7.4505806e-008 -0.25000006 -0.5 0.43301269 0.24999999 -0.5 0.43301272
		 0.5 -0.5 0 0.25000012 0.5 -0.43301266 -0.24999993 0.5 -0.43301275 -0.5 0.5 -7.4505806e-008
		 -0.25000006 0.5 0.43301269 0.24999999 0.5 0.43301272 0.5 0.5 0 0 -0.5 0 0 0.5 0;
	setAttr -s 30 ".ed[0:29]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 6 0 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 12 0 1 12 1 1
		 12 2 1 12 3 1 12 4 1 12 5 1 6 13 1 7 13 1 8 13 1 9 13 1 10 13 1 11 13 1;
	setAttr -s 18 -ch 60 ".fc[0:17]" -type "polyFaces" 
		f 4 0 13 -7 -13
		mu 0 4 6 7 14 13
		f 4 1 14 -8 -14
		mu 0 4 7 8 15 14
		f 4 2 15 -9 -15
		mu 0 4 8 9 16 15
		f 4 3 16 -10 -16
		mu 0 4 9 10 17 16
		f 4 4 17 -11 -17
		mu 0 4 10 11 18 17
		f 4 5 12 -12 -18
		mu 0 4 11 12 19 18
		f 3 -1 -19 19
		mu 0 3 1 0 26
		f 3 -2 -20 20
		mu 0 3 2 1 26
		f 3 -3 -21 21
		mu 0 3 3 2 26
		f 3 -4 -22 22
		mu 0 3 4 3 26
		f 3 -5 -23 23
		mu 0 3 5 4 26
		f 3 -6 -24 18
		mu 0 3 0 5 26
		f 3 6 25 -25
		mu 0 3 24 23 27
		f 3 7 26 -26
		mu 0 3 23 22 27
		f 3 8 27 -27
		mu 0 3 22 21 27
		f 3 9 28 -28
		mu 0 3 21 20 27
		f 3 10 29 -29
		mu 0 3 20 25 27
		f 3 11 24 -30
		mu 0 3 25 24 27;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode ikEffector -n "effector1" -p "Character1_LeftForeArm";
	setAttr ".v" no;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".hd" yes;
createNode transform -n "Character1_LeftForeArm_LowProxy" -p "Character1_LeftForeArm";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 0 -7.4384942649885488e-015 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 180 -8.2692399695052359 90.000000000000028 ;
	setAttr ".s" -type "double3" 6.4444459809201016 24.828349425399175 6.4444459809200962 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftForeArm_LowProxyShape" -p "Character1_LeftForeArm_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_LeftArm_LowProxy" -p "Character1_LeftArm";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 8.8817841970012523e-016 0 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -180 -8.0337251588180099 90 ;
	setAttr ".s" -type "double3" 6.4444459809201016 25.394090927622543 6.4444459809201033 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_LeftArm_LowProxyShape" -p "Character1_LeftArm_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  -0.094686508 0.39690354 0.083187863 
		0.072402038 0.39690354 0.083187863 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 -0.094686508 0.39690354 
		-0.083900683 0.072402038 0.39690354 -0.083900683;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode orientConstraint -n "Character1_LeftShoulder_orientConstraint1" -p "Character1_LeftShoulder";
	addAttr -ci true -k true -sn "w0" -ln "L_Clav_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "Character1_RightShoulder" -p "Character1_Spine2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -7.0000011920931797 14.255221904569112 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 2;
	setAttr ".typ" 9;
	setAttr ".radi" 3;
createNode joint -n "Character1_RightArm" -p "Character1_RightShoulder";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -10.707278420276264 0.00042724619567025002 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -9.6917399397697821 0.012338404594698487 1.3676025356627879 ;
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142068 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" -8.0412976642016396 -19.300800127093598 4.5328426473799501 ;
	setAttr ".sd" 2;
	setAttr ".typ" 10;
	setAttr ".radi" 3;
createNode joint -n "Character1_RightForeArm" -p "Character1_RightArm";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -27.305605722810199 -5.6843418860808015e-014 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 1.422941255811535e-016 -0.0013787345079232817 -0.0077857106932481684 ;
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142112 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" 1.0360395724949911e-027 44.352402348201281 -6.3729328882127809e-012 ;
	setAttr ".sd" 2;
	setAttr ".typ" 11;
	setAttr ".radi" 3;
createNode joint -n "Character1_RightHand" -p "Character1_RightForeArm";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -26.696993517158887 0 0 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142112 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" 8.2053358327015324 -20.864854833087477 -1.4328496998634297 ;
	setAttr ".sd" 2;
	setAttr ".typ" 12;
	setAttr ".radi" 3;
createNode joint -n "Character1_RightHandThumb1" -p "Character1_RightHand";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "R_Fingers_System" -ln "R_Fingers_System" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -4.560411889158118 -1.0786949024659409 3.990887428306285 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142068 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" -168.52276145816086 -0.61781472605853927 -7.1007700743876709 ;
	setAttr ".is" -type "double3" 0.99999976158142068 0.99999976158142068 0.99999976158142068 ;
	setAttr ".sd" 1;
	setAttr ".typ" 14;
createNode joint -n "Character1_RightHandThumb2" -p "Character1_RightHandThumb1";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -2.5126005990506659 0.53600012779239137 -0.70745016866926491 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 14;
createNode joint -n "Character1_RightHandThumb3" -p "Character1_RightHandThumb2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -2.5430906063200496 0 -1.0000002387045015e-005 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142068 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 14;
createNode joint -n "Character1_RightHandThumb4" -p "Character1_RightHandThumb3";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -2.6667506358028974 0 1.0000002387045015e-005 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 14;
createNode transform -n "Character1_RightHandThumb3_LowProxy" -p "Character1_RightHandThumb3";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -0.013717923351208585 0.00056422746823159287 0.017617857545220161 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -179.21003931779282 6.9359110487006506e-006 -89.999672033420609 ;
	setAttr ".s" -type "double3" 1.6111114952300234 2.4800780071419588 1.6111114952300247 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandThumb3_LowProxyShape" -p "Character1_RightHandThumb3_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHandThumb2_LowProxy" -p "Character1_RightHandThumb2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -0.013910287421040834 0.00059474505363255048 0.0526704118696113 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -179.21003166800517 1.4546027453262846e-005 -89.999312186844094 ;
	setAttr ".s" -type "double3" 1.6111114952300247 2.365120162422933 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandThumb2_LowProxyShape" -p "Character1_RightHandThumb2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHandThumb1_LowProxy" -p "Character1_RightHandThumb1";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0.00041827395905613685 0.00049245010737308803 -0.00038453160001772346 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -165.78417843596961 -0.25279587883883153 -102.04206454970485 ;
	setAttr ".s" -type "double3" 1.6111114952300241 2.4782379754050736 1.6111114952300247 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandThumb1_LowProxyShape" -p "Character1_RightHandThumb1_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode joint -n "Character1_RightHandIndex1" -p "Character1_RightHand";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "R_Fingers_System" -ln "R_Fingers_System" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -8.8518267246130051 0.60406383607940484 3.3467117531584747 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0 -0.00060923486399865458 0 ;
	setAttr ".s" -type "double3" 0.99999976163795268 0.99999976158142079 0.99999976163795279 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" -168.52276145816086 -0.61781472605853927 -7.1007700743876709 ;
	setAttr ".is" -type "double3" 0.99999976158142068 0.99999976158142068 0.99999976158142068 ;
	setAttr ".pa" -type "double3" 0 -0.00060923486399865458 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 19;
createNode joint -n "Character1_RightHandIndex2" -p "Character1_RightHandIndex1";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -4.2227325715007726 0 -0.1471551341282451 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0 -0.00060923483500426219 0 ;
	setAttr ".s" -type "double3" 0.99999976163795301 0.99999976158142112 0.99999976163795301 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" 0 0.0006092355493909743 0 ;
	setAttr ".pa" -type "double3" 0 -0.00060923483500426219 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 19;
createNode joint -n "Character1_RightHandIndex3" -p "Character1_RightHandIndex2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -2.6523316152055454 2.8421709430404007e-014 -0.092431819425950579 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0 -0.00060923483500391719 0 ;
	setAttr ".s" -type "double3" 0.99999976163795279 0.99999976158142079 0.99999976163795301 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" 0 0.00060923435292409864 0 ;
	setAttr ".pa" -type "double3" 0 -0.00060923483500391719 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 19;
createNode joint -n "Character1_RightHandIndex4" -p "Character1_RightHandIndex3";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -1.957031191764836 -2.8421709430404007e-014 -0.068199206858230887 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0 -0.00060923483500431477 0 ;
	setAttr ".s" -type "double3" 0.99999976163795301 0.99999976158142079 0.99999976163795301 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" 0 0.0006092355493909743 0 ;
	setAttr ".pa" -type "double3" 0 -0.00060923483500431477 0 ;
	setAttr ".sd" 1;
	setAttr ".typ" 19;
createNode transform -n "Character1_RightHandIndex3_LowProxy" -p "Character1_RightHandIndex3";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -0.0012334966838949413 0.00026246958375963914 0.048384555929567696 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -178.41287065046146 1.5994522659869143e-015 -89.999999999999133 ;
	setAttr ".s" -type "double3" 1.6111114952300238 1.8211472427314108 1.6111114951389447 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandIndex3_LowProxyShape" -p "Character1_RightHandIndex3_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHandIndex2_LowProxy" -p "Character1_RightHandIndex2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -0.00064668455814853587 0.00026246958375963914 0.029430873768678367 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -178.41347888083291 1.5775373594480169e-015 -90.000000000001194 ;
	setAttr ".s" -type "double3" 1.6111114952300227 2.4681602919343191 1.6111114951389445 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandIndex2_LowProxyShape" -p "Character1_RightHandIndex2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHandIndex1_LowProxy" -p "Character1_RightHandIndex1";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0.00032877585177004676 0.00026246958373121743 -0.00078432835837194403 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -178.41408229378624 1.6942451745709679e-015 -89.999999999999574 ;
	setAttr ".s" -type "double3" 1.6111114952300247 3.9295536950640466 1.6111114951389447 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandIndex1_LowProxyShape" -p "Character1_RightHandIndex1_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode joint -n "Character1_RightHandMiddle1" -p "Character1_RightHand";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "R_Fingers_System" -ln "R_Fingers_System" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -8.7279734115003862 1.320411964232477 1.283205579451161 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142068 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" -168.52276145816086 -0.61781472605853927 -7.1007700743876709 ;
	setAttr ".is" -type "double3" 0.99999976158142068 0.99999976158142068 0.99999976158142068 ;
	setAttr ".sd" 1;
	setAttr ".typ" 20;
createNode joint -n "Character1_RightHandMiddle2" -p "Character1_RightHandMiddle1";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -4.863241159487047 0 -0.0003000000715269735 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 20;
createNode joint -n "Character1_RightHandMiddle3" -p "Character1_RightHandMiddle2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -2.7652306592823637 0 -0.00017000004053180362 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142112 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 20;
createNode joint -n "Character1_RightHandMiddle4" -p "Character1_RightHandMiddle3";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -2.0056324781800452 0 -0.00013000003099516988 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142112 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 20;
createNode transform -n "Character1_RightHandMiddle3_LowProxy" -p "Character1_RightHandMiddle3";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0.00011888659211933827 9.9749818502914422e-005 -0.010161768866780996 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -179.92599496948617 1.5840656990211002e-015 -89.999999999999204 ;
	setAttr ".s" -type "double3" 1.6111114952300247 1.8652361111509488 1.6111114952300247 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandMiddle3_LowProxyShape" -p "Character1_RightHandMiddle3_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHandMiddle2_LowProxy" -p "Character1_RightHandMiddle2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0.00012601583782156922 9.9749818531336132e-005 -0.0067600243646168678 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -179.9259934263755 1.590277719883506e-015 -89.999999999999972 ;
	setAttr ".s" -type "double3" 1.6111114952300234 2.5716732885966449 1.6111114952300236 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandMiddle2_LowProxyShape" -p "Character1_RightHandMiddle2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHandMiddle1_LowProxy" -p "Character1_RightHandMiddle1";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0.00013063961313264372 9.9749818502914422e-005 -0.00077845545339805255 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -179.92599444746926 1.5840656990213475e-015 -90.000000000000298 ;
	setAttr ".s" -type "double3" 1.6111114952300227 4.5228223512256838 1.6111114952300247 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandMiddle1_LowProxyShape" -p "Character1_RightHandMiddle1_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode joint -n "Character1_RightHandRing1" -p "Character1_RightHand";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "R_Fingers_System" -ln "R_Fingers_System" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -8.7520277974358862 1.6245631382865613 -0.79754631212690852 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142068 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" -168.52276145816086 -0.61781472605853927 -7.1007700743876709 ;
	setAttr ".is" -type "double3" 0.99999976158142068 0.99999976158142068 0.99999976158142068 ;
	setAttr ".sd" 1;
	setAttr ".typ" 21;
createNode joint -n "Character1_RightHandRing2" -p "Character1_RightHandRing1";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -4.5377210818770113 0 -8.8817841970012523e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142112 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 21;
createNode joint -n "Character1_RightHandRing3" -p "Character1_RightHandRing2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -2.3045305494428994 0 -8.8817841970012523e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 21;
createNode joint -n "Character1_RightHandRing4" -p "Character1_RightHandRing3";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -1.9233504585624821 2.8421709430404007e-014 -8.8817841970012523e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142112 0.99999976158142068 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 21;
createNode transform -n "Character1_RightHandRing3_LowProxy" -p "Character1_RightHandRing3";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 4.9530585982893172e-005 7.1429499172381838e-005 -0.041074287442329549 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -179.66260558158393 1.5902777198833234e-015 -89.999999999999147 ;
	setAttr ".s" -type "double3" 1.6111114952300238 1.7887159997826771 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandRing3_LowProxyShape" -p "Character1_RightHandRing3_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHandRing2_LowProxy" -p "Character1_RightHandRing2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 4.8197334621136179e-006 7.1429499200803548e-005 -0.027504155037701317 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -179.66261353635758 1.5902777198836686e-015 -90.000000000000711 ;
	setAttr ".s" -type "double3" 1.6111114952300225 2.1432089871176396 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandRing2_LowProxyShape" -p "Character1_RightHandRing2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHandRing1_LowProxy" -p "Character1_RightHandRing1";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -3.0029370506667874e-005 7.1429499172381838e-005 -0.00078327231093267002 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -179.66260864446252 1.5902777198835033e-015 -89.999999999999957 ;
	setAttr ".s" -type "double3" 1.6111114952300227 4.2201213636607822 1.6111114952300247 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandRing1_LowProxyShape" -p "Character1_RightHandRing1_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode joint -n "Character1_RightHandPinky1" -p "Character1_RightHand";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	addAttr -ci true -sn "R_Fingers_System" -ln "R_Fingers_System" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -8.763550852188061 1.2819236057279395 -2.5984737001488742 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142068 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".jo" -type "double3" -168.52276145816086 -0.61781472605853927 -7.1007700743876709 ;
	setAttr ".is" -type "double3" 0.99999976158142068 0.99999976158142068 0.99999976158142068 ;
	setAttr ".sd" 1;
	setAttr ".typ" 22;
createNode joint -n "Character1_RightHandPinky2" -p "Character1_RightHandPinky1";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -3.0440807257654026 0 -1.2212453270876722e-015 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142068 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 22;
createNode joint -n "Character1_RightHandPinky3" -p "Character1_RightHandPinky2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -1.9745004707575955 0 -6.6613381477509392e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 22;
createNode joint -n "Character1_RightHandPinky4" -p "Character1_RightHandPinky3";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" -1.6666103973508828 0 -1.0000002389487506e-006 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142068 0.99999976158142112 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".sd" 1;
	setAttr ".typ" 22;
createNode transform -n "Character1_RightHandPinky3_LowProxy" -p "Character1_RightHandPinky3";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -0.0062391896613007702 0.00012562873087063053 0.026575612987671415 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 179.68798959990593 4.6271021168315932e-005 -90.001572090043069 ;
	setAttr ".s" -type "double3" 1.6111114952300245 1.5518359449157253 1.6111114952300247 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandPinky3_LowProxyShape" -p "Character1_RightHandPinky3_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHandPinky2_LowProxy" -p "Character1_RightHandPinky2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -0.0038656461185269109 9.5111145412829501e-005 0.015810353613155859 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 179.68799335411009 2.6037258233562844e-005 -90.0008846339108 ;
	setAttr ".s" -type "double3" 1.6111114952300236 1.8385200931345511 1.6111114952300245 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandPinky2_LowProxyShape" -p "Character1_RightHandPinky2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHandPinky1_LowProxy" -p "Character1_RightHandPinky1";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -0.00019274913586286857 1.881718199570059e-005 -0.00078683502540255468 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 179.68798676731384 4.2221571789363607e-005 -90.00143450719122 ;
	setAttr ".s" -type "double3" 1.6111114952300241 2.8344528980645118 1.6111114952300247 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHandPinky1_LowProxyShape" -p "Character1_RightHandPinky1_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightHand_LowProxy" -p "Character1_RightHand";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" -5.513391455934088e-017 -1.9864081429226756 1.0260132060984777e-015 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 11.832713961352722 1.281554196876431 -6.6277931907835397 ;
	setAttr ".s" -type "double3" 8.540766402291629 3.8694280361868238 8.540766402291629 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightHand_LowProxyShape" -p "Character1_RightHand_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.75000012 -0.93301266
		 0.25000006 -0.93301272 0 -0.50000006 0.24999994 -0.066987306 0.75 -0.066987276 1
		 -0.5 0 0 0.16666667 0 0.33333334 0 0.5 0 0.66666669 0 0.83333337 0 1 0 0 1 0.16666667
		 1 0.33333334 1 0.5 1 0.66666669 1 0.83333337 1 1 1 0.75000012 1.066987276 0.25000006
		 1.066987276 0 1.5 0.24999994 1.93301272 0.75 1.93301272 1 1.5 0.5 -0.5 0.5 1.5;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".pt[0:13]" -type "float3"  -0.4450531 0.56401688 -7.7715612e-016 
		-0.4450531 0.56401688 -7.7715612e-016 -0.4450531 0.56401688 -6.6613381e-016 -0.4450531 
		0.56401688 -7.7715612e-016 -0.4450531 0.56401688 -7.7715612e-016 -0.4450531 0.56401688 
		-6.6613381e-016 -0.4450531 0.33710617 -7.7715612e-016 -0.4450531 0.33710617 -7.7715612e-016 
		-0.4450531 0.33710617 -6.6613381e-016 -0.4450531 0.33710617 -7.7715612e-016 -0.4450531 
		0.33710617 -7.7715612e-016 -0.4450531 0.33710617 -6.6613381e-016 -0.4450531 0.56401688 
		-6.6613381e-016 -0.4450531 0.33710617 -6.6613381e-016;
	setAttr -s 14 ".vt[0:13]"  0.25000012 -0.5 -0.43301266 -0.24999993 -0.5 -0.43301275
		 -0.5 -0.5 -7.4505806e-008 -0.25000006 -0.5 0.43301269 0.24999999 -0.5 0.43301272
		 0.5 -0.5 0 0.25000012 0.5 -0.43301266 -0.24999993 0.5 -0.43301275 -0.5 0.5 -7.4505806e-008
		 -0.25000006 0.5 0.43301269 0.24999999 0.5 0.43301272 0.5 0.5 0 0 -0.5 0 0 0.5 0;
	setAttr -s 30 ".ed[0:29]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 6 0 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 12 0 1 12 1 1
		 12 2 1 12 3 1 12 4 1 12 5 1 6 13 1 7 13 1 8 13 1 9 13 1 10 13 1 11 13 1;
	setAttr -s 18 -ch 60 ".fc[0:17]" -type "polyFaces" 
		f 4 0 13 -7 -13
		mu 0 4 6 7 14 13
		f 4 1 14 -8 -14
		mu 0 4 7 8 15 14
		f 4 2 15 -9 -15
		mu 0 4 8 9 16 15
		f 4 3 16 -10 -16
		mu 0 4 9 10 17 16
		f 4 4 17 -11 -17
		mu 0 4 10 11 18 17
		f 4 5 12 -12 -18
		mu 0 4 11 12 19 18
		f 3 -1 -19 19
		mu 0 3 1 0 26
		f 3 -2 -20 20
		mu 0 3 2 1 26
		f 3 -3 -21 21
		mu 0 3 3 2 26
		f 3 -4 -22 22
		mu 0 3 4 3 26
		f 3 -5 -23 23
		mu 0 3 5 4 26
		f 3 -6 -24 18
		mu 0 3 0 5 26
		f 3 6 25 -25
		mu 0 3 24 23 27
		f 3 7 26 -26
		mu 0 3 23 22 27
		f 3 8 27 -27
		mu 0 3 22 21 27
		f 3 9 28 -28
		mu 0 3 21 20 27
		f 3 10 29 -29
		mu 0 3 20 25 27
		f 3 11 24 -30
		mu 0 3 25 24 27;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode orientConstraint -n "Character1_RightHand_orientConstraint1" -p "Character1_RightHand";
	addAttr -ci true -k true -sn "w0" -ln "R_Wrist_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lo" yes;
	setAttr ".lr" -type "double3" 9.689285596643046 0.21943033622242511 -1.3423814534337581 ;
	setAttr ".o" -type "double3" -11.784298697934032 2.3193974931764387 6.8077048711782373 ;
	setAttr ".rsrr" -type "double3" -2.1349171594721414 1.3613700970844551 5.7573619053971621 ;
	setAttr -k on ".w0";
createNode ikEffector -n "effector2" -p "Character1_RightForeArm";
	setAttr ".v" no;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".hd" yes;
createNode transform -n "Character1_RightForeArm_LowProxy" -p "Character1_RightForeArm";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 -5.6843418860808015e-014 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 4.1432290023374819e-015 -8.3527473042401503 90 ;
	setAttr ".s" -type "double3" 6.444445980920098 24.82820397095777 6.4444459809201007 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightForeArm_LowProxyShape" -p "Character1_RightForeArm_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Character1_RightArm_LowProxy" -p "Character1_RightArm";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 2.6645352591003757e-015 0 7.1054273576010019e-015 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" -2.0238624793830485e-015 -8.0427730896263885 90.000000000000071 ;
	setAttr ".s" -type "double3" 6.4444459809200962 25.394213322213485 6.444445980920098 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_RightArm_LowProxyShape" -p "Character1_RightArm_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.33000001 0 0.66333336
		 0 0.33000001 0.25 0.66333336 0.25 0.33000001 0.5 0.66333336 0.5 0.33000001 0.75 0.66333336
		 0.75 0.33000001 1 0.66333336 1 1 0 1 0.25 0 0 0 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  -0.072587833 0.39692152 0.083760858 
		0.094500765 0.39692152 0.083760858 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 -0.072587833 0.39692152 
		-0.0833278 0.094500765 0.39692152 -0.0833278;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode orientConstraint -n "Character1_RightShoulder_orientConstraint1" -p "Character1_RightShoulder";
	addAttr -ci true -k true -sn "w0" -ln "R_Clav_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "Character1_Neck" -p "Character1_Spine2";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 0 12.666674772900279 0 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".r" -type "double3" 0 -2.5444437451708134e-014 0 ;
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".pa" -type "double3" 0 -2.0567998291869544e-007 0 ;
	setAttr ".typ" 7;
	setAttr ".radi" 3;
createNode joint -n "Character1_Head" -p "Character1_Neck";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 0 14 0 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".typ" 8;
	setAttr ".radi" 3;
createNode joint -n "Character1_Head_top" -p "Character1_Head";
	addAttr -ci true -sn "ch" -ln "Character" -at "message";
	setAttr -k off -cb on ".v";
	setAttr ".t" -type "double3" 0 18 4.4408926278963424e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 0.99999976158142079 0.99999976158142079 0.99999976158142079 ;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".is" -type "double3" 0.99999976158142068 0.99999976158142068 0.99999976158142068 ;
	setAttr ".typ" 8;
	setAttr ".radi" 3;
createNode orientConstraint -n "Character1_Head_orientConstraint1" -p "Character1_Head";
	addAttr -ci true -k true -sn "w0" -ln "Head_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "Character1_Head_LowProxy" -p "Character1_Head";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 0.66919091915063122 4.4408920985006262e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 18.673489246859837 23.654994319484373 21.898910116771987 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_Head_LowProxyShape" -p "Character1_Head_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 23 ".uvst[0].uvsp[0:22]" -type "float2" 0 0.25 0.16666667
		 0.25 0.33333334 0.25 0.5 0.25 0.66666669 0.25 0.83333337 0.25 1 0.25 0 0.5 0.16666667
		 0.5 0.33333334 0.5 0.5 0.5 0.66666669 0.5 0.83333337 0.5 1 0.5 0 0.75 0.16666667
		 0.75 0.33333334 0.75 0.5 0.75 0.66666669 0.75 0.83333337 0.75 1 0.75 0.5 0 0.5 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 20 ".pt[0:19]" -type "float3"  0.019136831 0.30000001 0 
		-0.019136813 0.30000001 0 -0.03827364 0.30000001 0 -0.019136824 0.15857866 0 0.019136818 
		0.15857866 0 0.03827364 0.30000001 0 0.027063563 0.30000001 0 -0.027063543 0.30000001 
		0 -0.054127101 0.30000001 0 -0.027063558 0.30000001 0 0.027063547 0.30000001 0 0.054127101 
		0.30000001 0 0.019136831 0.30000001 0 -0.019136813 0.30000001 0 -0.03827364 0.30000001 
		0 -0.019136824 0.30000001 0 0.019136818 0.30000001 0 0.03827364 0.30000001 0 0 0.30000001 
		0 0 0.30000001 0;
	setAttr -s 20 ".vt[0:19]"  0.17677678 -0.35355338 -0.3061862 -0.17677663 -0.35355338 -0.30618626
		 -0.35355338 -0.35355338 -5.2683561e-008 -0.17677674 -0.35355338 0.3061862 0.17677668 -0.35355338 0.30618623
		 0.35355338 -0.35355338 0 0.25000012 0 -0.43301266 -0.24999993 0 -0.43301275 -0.5 0 -7.4505806e-008
		 -0.25000006 0 0.43301269 0.24999999 0 0.43301272 0.5 0 0 0.17677678 0.35355338 -0.3061862
		 -0.17677663 0.35355338 -0.30618626 -0.35355338 0.35355338 -5.2683561e-008 -0.17677674 0.35355338 0.3061862
		 0.17677668 0.35355338 0.30618623 0.35355338 0.35355338 0 0 -0.5 0 0 0.5 0;
	setAttr -s 42 ".ed[0:41]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 6 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 12 0
		 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 6 12 0 7 13 0 8 14 0 9 15 0 10 16 0 11 17 0
		 18 0 0 18 1 0 18 2 0 18 3 0 18 4 0 18 5 0 12 19 0 13 19 0 14 19 0 15 19 0 16 19 0
		 17 19 0;
	setAttr -s 24 -ch 84 ".fc[0:23]" -type "polyFaces" 
		f 4 0 19 -7 -19
		mu 0 4 0 1 8 7
		f 4 1 20 -8 -20
		mu 0 4 1 2 9 8
		f 4 2 21 -9 -21
		mu 0 4 2 3 10 9
		f 4 3 22 -10 -22
		mu 0 4 3 4 11 10
		f 4 4 23 -11 -23
		mu 0 4 4 5 12 11
		f 4 5 18 -12 -24
		mu 0 4 5 6 13 12
		f 4 6 25 -13 -25
		mu 0 4 7 8 15 14
		f 4 7 26 -14 -26
		mu 0 4 8 9 16 15
		f 4 8 27 -15 -27
		mu 0 4 9 10 17 16
		f 4 9 28 -16 -28
		mu 0 4 10 11 18 17
		f 4 10 29 -17 -29
		mu 0 4 11 12 19 18
		f 4 11 24 -18 -30
		mu 0 4 12 13 20 19
		f 3 -1 -31 31
		mu 0 3 1 0 21
		f 3 -2 -32 32
		mu 0 3 2 1 21
		f 3 -3 -33 33
		mu 0 3 3 2 21
		f 3 -4 -34 34
		mu 0 3 4 3 21
		f 3 -5 -35 35
		mu 0 3 5 4 21
		f 3 -6 -36 30
		mu 0 3 6 5 21
		f 3 12 37 -37
		mu 0 3 14 15 22
		f 3 13 38 -38
		mu 0 3 15 16 22
		f 3 14 39 -39
		mu 0 3 16 17 22
		f 3 15 40 -40
		mu 0 3 17 18 22
		f 3 16 41 -41
		mu 0 3 18 19 22
		f 3 17 36 -42
		mu 0 3 19 20 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode ikEffector -n "effector3" -p "Character1_Neck";
	setAttr ".v" no;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".hd" yes;
createNode transform -n "Character1_Neck_LowProxy" -p "Character1_Neck";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 5.6843418860808015e-014 4.4408920985006262e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 8.0555574761501241 14.000000000000004 8.0555574761501241 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_Neck_LowProxyShape" -p "Character1_Neck_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.75000012 -0.93301266
		 0.25000006 -0.93301272 0 -0.50000006 0.24999994 -0.066987306 0.75 -0.066987276 1
		 -0.5 0 0 0.16666667 0 0.33333334 0 0.5 0 0.66666669 0 0.83333337 0 1 0 0 1 0.16666667
		 1 0.33333334 1 0.5 1 0.66666669 1 0.83333337 1 1 1 0.75000012 1.066987276 0.25000006
		 1.066987276 0 1.5 0.24999994 1.93301272 0.75 1.93301272 1 1.5 0.5 -0.5 0.5 1.5;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".pt[0:13]" -type "float3"  0.04707589 0.63243979 -0.081537776 
		-0.047075853 0.63243979 -0.081537798 -0.09415172 0.63243979 -1.122376e-008 -0.047075875 
		0.63243979 0.081537783 0.04707586 0.63243979 0.081537798 0.09415172 0.63243979 2.8059399e-009 
		0.04707589 0.40615773 -0.081537776 -0.047075853 0.40615773 -0.081537798 -0.09415172 
		0.40615773 -1.122376e-008 -0.047075875 0.40615773 0.081537783 0.04707586 0.40615773 
		0.081537798 0.09415172 0.40615773 2.8059399e-009 0 0.63243979 2.8059399e-009 0 0.40615773 
		2.8059399e-009;
	setAttr -s 14 ".vt[0:13]"  0.25000012 -0.5 -0.43301266 -0.24999993 -0.5 -0.43301275
		 -0.5 -0.5 -7.4505806e-008 -0.25000006 -0.5 0.43301269 0.24999999 -0.5 0.43301272
		 0.5 -0.5 0 0.25000012 0.5 -0.43301266 -0.24999993 0.5 -0.43301275 -0.5 0.5 -7.4505806e-008
		 -0.25000006 0.5 0.43301269 0.24999999 0.5 0.43301272 0.5 0.5 0 0 -0.5 0 0 0.5 0;
	setAttr -s 30 ".ed[0:29]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 6 0 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 12 0 1 12 1 1
		 12 2 1 12 3 1 12 4 1 12 5 1 6 13 1 7 13 1 8 13 1 9 13 1 10 13 1 11 13 1;
	setAttr -s 18 -ch 60 ".fc[0:17]" -type "polyFaces" 
		f 4 0 13 -7 -13
		mu 0 4 6 7 14 13
		f 4 1 14 -8 -14
		mu 0 4 7 8 15 14
		f 4 2 15 -9 -15
		mu 0 4 8 9 16 15
		f 4 3 16 -10 -16
		mu 0 4 9 10 17 16
		f 4 4 17 -11 -17
		mu 0 4 10 11 18 17
		f 4 5 12 -12 -18
		mu 0 4 11 12 19 18
		f 3 -1 -19 19
		mu 0 3 1 0 26
		f 3 -2 -20 20
		mu 0 3 2 1 26
		f 3 -3 -21 21
		mu 0 3 3 2 26
		f 3 -4 -22 22
		mu 0 3 4 3 26
		f 3 -5 -23 23
		mu 0 3 5 4 26
		f 3 -6 -24 18
		mu 0 3 0 5 26
		f 3 6 25 -25
		mu 0 3 24 23 27
		f 3 7 26 -26
		mu 0 3 23 22 27
		f 3 8 27 -27
		mu 0 3 22 21 27
		f 3 9 28 -28
		mu 0 3 21 20 27
		f 3 10 29 -29
		mu 0 3 20 25 27
		f 3 11 24 -30
		mu 0 3 25 24 27;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode orientConstraint -n "Character1_Spine2_orientConstraint1" -p "Character1_Spine2";
	addAttr -ci true -k true -sn "w0" -ln "Chest_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "Character1_Spine2_LowProxy" -p "Character1_Spine2";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 -1.8339501083624601 4.4408920985006262e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 24.166672428450376 19.797884182392242 16.111114952300248 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_Spine2_LowProxyShape" -p "Character1_Spine2_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.75000012 -0.93301266
		 0.25000006 -0.93301272 0 -0.50000006 0.24999994 -0.066987306 0.75 -0.066987276 1
		 -0.5 0 0 0.16666667 0 0.33333334 0 0.5 0 0.66666669 0 0.83333337 0 1 0 0 1 0.16666667
		 1 0.33333334 1 0.5 1 0.66666669 1 0.83333337 1 1 1 0.75000012 1.066987276 0.25000006
		 1.066987276 0 1.5 0.24999994 1.93301272 0.75 1.93301272 1 1.5 0.5 -0.5 0.5 1.5;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".pt[0:13]" -type "float3"  0 0.5 -0.092312209 0 0.5 
		-0.092312224 0 0.5 -1.2553334e-008 0 0.5 0.092312217 0 0.5 0.092312224 0 0.5 3.3302565e-009 
		0.15299295 0.29314333 -0.22662188 -0.15299283 0.29314333 -0.22662194 -0.30598578 
		0.29314333 -3.034279e-008 -0.15299292 0.29314333 0.22662193 0.15299287 0.29314333 
		0.22662194 0.30598578 0.29314333 8.6506331e-009 0 0.5 3.3302565e-009 0 0.60471433 
		3.023545e-009;
	setAttr -s 14 ".vt[0:13]"  0.25000012 -0.5 -0.43301266 -0.24999993 -0.5 -0.43301275
		 -0.5 -0.5 -7.4505806e-008 -0.25000006 -0.5 0.43301269 0.24999999 -0.5 0.43301272
		 0.5 -0.5 0 0.25000012 0.5 -0.43301266 -0.24999993 0.5 -0.43301275 -0.5 0.5 -7.4505806e-008
		 -0.25000006 0.5 0.43301269 0.24999999 0.5 0.43301272 0.5 0.5 0 0 -0.5 0 0 0.5 0;
	setAttr -s 30 ".ed[0:29]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 6 0 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 12 0 1 12 1 1
		 12 2 1 12 3 1 12 4 1 12 5 1 6 13 1 7 13 1 8 13 1 9 13 1 10 13 1 11 13 1;
	setAttr -s 18 -ch 60 ".fc[0:17]" -type "polyFaces" 
		f 4 0 13 -7 -13
		mu 0 4 6 7 14 13
		f 4 1 14 -8 -14
		mu 0 4 7 8 15 14
		f 4 2 15 -9 -15
		mu 0 4 8 9 16 15
		f 4 3 16 -10 -16
		mu 0 4 9 10 17 16
		f 4 4 17 -11 -17
		mu 0 4 10 11 18 17
		f 4 5 12 -12 -18
		mu 0 4 11 12 19 18
		f 3 -1 -19 19
		mu 0 3 1 0 26
		f 3 -2 -20 20
		mu 0 3 2 1 26
		f 3 -3 -21 21
		mu 0 3 3 2 26
		f 3 -4 -22 22
		mu 0 3 4 3 26
		f 3 -5 -23 23
		mu 0 3 5 4 26
		f 3 -6 -24 18
		mu 0 3 0 5 26
		f 3 6 25 -25
		mu 0 3 24 23 27
		f 3 7 26 -26
		mu 0 3 23 22 27
		f 3 8 27 -27
		mu 0 3 22 21 27
		f 3 9 28 -28
		mu 0 3 21 20 27
		f 3 10 29 -29
		mu 0 3 20 25 27
		f 3 11 24 -30
		mu 0 3 25 24 27;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode ikEffector -n "effector4" -p "Character1_Spine";
	setAttr ".v" no;
	setAttr -l on -k off ".sz";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sx";
	setAttr ".hd" yes;
createNode transform -n "Character1_Spine_LowProxy" -p "Character1_Spine";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 2.8421709430404007e-014 4.4408920985006262e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 24.166672428450376 22.800000858307119 16.111114952300248 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_Spine_LowProxyShape" -p "Character1_Spine_LowProxy";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.75000012 -0.93301266
		 0.25000006 -0.93301272 0 -0.50000006 0.24999994 -0.066987306 0.75 -0.066987276 1
		 -0.5 0 0 0.16666667 0 0.33333334 0 0.5 0 0.66666669 0 0.83333337 0 1 0 0 1 0.16666667
		 1 0.33333334 1 0.5 1 0.66666669 1 0.83333337 1 1 1 0.75000012 1.066987276 0.25000006
		 1.066987276 0 1.5 0.24999994 1.93301272 0.75 1.93301272 1 1.5 0.5 -0.5 0.5 1.5;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".pt[0:13]" -type "float3"  0 0.5 -0.1029373 0 0.5 -0.10293732 
		0 0.5 -1.4314171e-008 0 0.5 0.10293732 0 0.5 0.10293733 0 0.5 3.3976135e-009 0 0.5 
		-0.092312209 0 0.5 -0.092312224 0 0.5 -1.2553334e-008 0 0.5 0.092312217 0 0.5 0.092312224 
		0 0.5 3.3302565e-009 0 0.5 3.3976135e-009 0 0.5 3.3302565e-009;
	setAttr -s 14 ".vt[0:13]"  0.25000012 -0.5 -0.43301266 -0.24999993 -0.5 -0.43301275
		 -0.5 -0.5 -7.4505806e-008 -0.25000006 -0.5 0.43301269 0.24999999 -0.5 0.43301272
		 0.5 -0.5 0 0.25000012 0.5 -0.43301266 -0.24999993 0.5 -0.43301275 -0.5 0.5 -7.4505806e-008
		 -0.25000006 0.5 0.43301269 0.24999999 0.5 0.43301272 0.5 0.5 0 0 -0.5 0 0 0.5 0;
	setAttr -s 30 ".ed[0:29]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 6 0 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 12 0 1 12 1 1
		 12 2 1 12 3 1 12 4 1 12 5 1 6 13 1 7 13 1 8 13 1 9 13 1 10 13 1 11 13 1;
	setAttr -s 18 -ch 60 ".fc[0:17]" -type "polyFaces" 
		f 4 0 13 -7 -13
		mu 0 4 6 7 14 13
		f 4 1 14 -8 -14
		mu 0 4 7 8 15 14
		f 4 2 15 -9 -15
		mu 0 4 8 9 16 15
		f 4 3 16 -10 -16
		mu 0 4 9 10 17 16
		f 4 4 17 -11 -17
		mu 0 4 10 11 18 17
		f 4 5 12 -12 -18
		mu 0 4 11 12 19 18
		f 3 -1 -19 19
		mu 0 3 1 0 26
		f 3 -2 -20 20
		mu 0 3 2 1 26
		f 3 -3 -21 21
		mu 0 3 3 2 26
		f 3 -4 -22 22
		mu 0 3 4 3 26
		f 3 -5 -23 23
		mu 0 3 5 4 26
		f 3 -6 -24 18
		mu 0 3 0 5 26
		f 3 6 25 -25
		mu 0 3 24 23 27
		f 3 7 26 -26
		mu 0 3 23 22 27
		f 3 8 27 -27
		mu 0 3 22 21 27
		f 3 9 28 -28
		mu 0 3 21 20 27
		f 3 10 29 -29
		mu 0 3 20 25 27
		f 3 11 24 -30
		mu 0 3 25 24 27;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode orientConstraint -n "Character1_Hips_orientConstraint1" -p "Character1_Pelvis";
	addAttr -ci true -k true -sn "w0" -ln "Hips_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode pointConstraint -n "Character1_Hips_pointConstraint1" -p "Character1_Pelvis";
	addAttr -ci true -k true -sn "w0" -ln "Hips_CtrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0 100 1.3683285221464905 ;
	setAttr -k on ".w0";
createNode transform -n "Character1_Spine2_LowProxy1" -p "Character1_Pelvis";
	addAttr -ci true -sn "LowProxyMesh" -ln "LowProxyMesh" -dt "string";
	setAttr ".t" -type "double3" 0 0 8.8817841970012523e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr ".s" -type "double3" 24.166672428450379 13.933342250190323 16.111114952300248 ;
	setAttr -l on ".LowProxyMesh" -type "string" "LowProxyMesh ";
createNode mesh -n "Character1_Spine2_LowProxy1Shape" -p "Character1_Spine2_LowProxy1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 28 ".uvst[0].uvsp[0:27]" -type "float2" 0.75000012 -0.93301266
		 0.25000006 -0.93301272 0 -0.50000006 0.24999994 -0.066987306 0.75 -0.066987276 1
		 -0.5 0 0 0.16666667 0 0.33333334 0 0.5 0 0.66666669 0 0.83333337 0 1 0 0 1 0.16666667
		 1 0.33333334 1 0.5 1 0.66666669 1 0.83333337 1 1 1 0.75000012 1.066987276 0.25000006
		 1.066987276 0 1.5 0.24999994 1.93301272 0.75 1.93301272 1 1.5 0.5 -0.5 0.5 1.5;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".pt[0:13]" -type "float3"  0.084394135 0.14359902 -0.24033332 
		-0.084394075 0.14359902 -0.24033335 -0.16878824 0.043871619 -4.1877087e-008 0.09060768 
		-0.012909714 0.14414753 -0.090607688 -0.012909714 0.14414756 0.16878824 0.043871619 
		1.2021134e-008 0.0034596114 -0.019533364 -0.091928676 -0.0034596152 -0.019533364 
		-0.091928661 -0.0069192257 -0.019533364 -9.409205e-009 -0.0034596317 -0.019533364 
		0.091928676 0.0034596168 -0.019533364 0.091928691 0.0069192257 -0.019533364 6.4083925e-009 
		0 -0.36337042 1.2021134e-008 0 -0.036694784 3.3976135e-009;
	setAttr -s 14 ".vt[0:13]"  0.25000012 -0.5 -0.43301266 -0.24999993 -0.5 -0.43301275
		 -0.5 -0.5 -7.4505806e-008 -0.25000006 -0.5 0.43301269 0.24999999 -0.5 0.43301272
		 0.5 -0.5 0 0.25000012 0.5 -0.43301266 -0.24999993 0.5 -0.43301275 -0.5 0.5 -7.4505806e-008
		 -0.25000006 0.5 0.43301269 0.24999999 0.5 0.43301272 0.5 0.5 0 0 -0.5 0 0 0.5 0;
	setAttr -s 30 ".ed[0:29]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 6 0 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 12 0 1 12 1 1
		 12 2 1 12 3 1 12 4 1 12 5 1 6 13 1 7 13 1 8 13 1 9 13 1 10 13 1 11 13 1;
	setAttr -s 18 -ch 60 ".fc[0:17]" -type "polyFaces" 
		f 4 0 13 -7 -13
		mu 0 4 6 7 14 13
		f 4 1 14 -8 -14
		mu 0 4 7 8 15 14
		f 4 2 15 -9 -15
		mu 0 4 8 9 16 15
		f 4 3 16 -10 -16
		mu 0 4 9 10 17 16
		f 4 4 17 -11 -17
		mu 0 4 10 11 18 17
		f 4 5 12 -12 -18
		mu 0 4 11 12 19 18
		f 3 -1 -19 19
		mu 0 3 1 0 26
		f 3 -2 -20 20
		mu 0 3 2 1 26
		f 3 -3 -21 21
		mu 0 3 3 2 26
		f 3 -4 -22 22
		mu 0 3 4 3 26
		f 3 -5 -23 23
		mu 0 3 5 4 26
		f 3 -6 -24 18
		mu 0 3 0 5 26
		f 3 6 25 -25
		mu 0 3 24 23 27
		f 3 7 26 -26
		mu 0 3 23 22 27
		f 3 8 27 -27
		mu 0 3 22 21 27
		f 3 9 28 -28
		mu 0 3 21 20 27
		f 3 10 29 -29
		mu 0 3 20 25 27
		f 3 11 24 -30
		mu 0 3 25 24 27;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 8 ".lnk";
	setAttr -s 8 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 2;
	setAttr -s 3 ".dli[1:2]"  1 2;
	setAttr -s 2 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode HIKSkeletonGeneratorNode -n "HIKSkeletonGeneratorNode1";
	setAttr ".ihi" 0;
	setAttr ".WantIndexFinger" yes;
	setAttr ".WantMiddleFinger" yes;
	setAttr ".WantRingFinger" yes;
	setAttr ".WantPinkyFinger" yes;
	setAttr ".WantThumb" yes;
	setAttr ".WantToeBase" yes;
	setAttr ".HipsTy" 100;
	setAttr ".LeftUpLegTx" 8.9100008010000007;
	setAttr ".LeftUpLegTy" 93.729999539999994;
	setAttr ".LeftLegTx" 8.9100008010000007;
	setAttr ".LeftLegTy" 48.851354600000001;
	setAttr ".LeftFootTx" 8.9100008010000007;
	setAttr ".LeftFootTy" 8.1503963469999992;
	setAttr ".RightUpLegTx" -8.9100008010000007;
	setAttr ".RightUpLegTy" 93.729999539999994;
	setAttr ".RightLegTx" -8.9100035169999998;
	setAttr ".RightLegTy" 48.851354600000001;
	setAttr ".RightLegTz" 0.00043902399999999999;
	setAttr ".RightFootTx" -8.9100025980000002;
	setAttr ".RightFootTy" 8.1503963509999995;
	setAttr ".RightFootTz" 0.00043902399999999999;
	setAttr ".RightFootRy" -0.0048003860000000002;
	setAttr ".SpineTy" 107;
	setAttr ".LeftArmTx" 17.707251070000002;
	setAttr ".LeftArmTy" 146.58868419999999;
	setAttr ".LeftForeArmTx" 45.012716769999997;
	setAttr ".LeftForeArmTy" 146.58868419999999;
	setAttr ".LeftHandTx" 71.709864139999993;
	setAttr ".LeftHandTy" 146.58868419999999;
	setAttr ".RightArmTx" -17.707274909999999;
	setAttr ".RightArmTy" 146.58898;
	setAttr ".RightForeArmTx" -45.012873159999998;
	setAttr ".RightForeArmTy" 146.58898;
	setAttr ".RightHandTx" -71.709861270000005;
	setAttr ".RightHandTy" 146.58897870000001;
	setAttr ".HeadTy" 165;
	setAttr ".LeftToeBaseTx" 8.9100092279999998;
	setAttr ".LeftToeBaseTy" 1.8880791539999999;
	setAttr ".LeftToeBaseTz" 12.9547209;
	setAttr ".RightToeBaseTx" -8.9110879789999995;
	setAttr ".RightToeBaseTy" 1.888079171;
	setAttr ".RightToeBaseTz" 12.95518809;
	setAttr ".RightToeBaseRx" 0.0029125930000000002;
	setAttr ".RightToeBaseRy" -0.0048003860000000002;
	setAttr ".LeftShoulderTx" 7.0000004770000004;
	setAttr ".LeftShoulderTy" 146.58854679999999;
	setAttr ".LeftShoulderRz" 0.00073528199999999997;
	setAttr ".RightShoulderTx" -6.9999995229999996;
	setAttr ".RightShoulderTy" 146.58854679999999;
	setAttr ".RightShoulderRz" -0.0023183610000000001;
	setAttr ".NeckTy" 145;
	setAttr ".LeftFingerBaseTx" 80.519743439999999;
	setAttr ".LeftFingerBaseTy" 147.08957459999999;
	setAttr ".LeftFingerBaseTz" 1.304684401;
	setAttr ".LeftFingerBaseRy" -0.0035633340000000005;
	setAttr ".RightFingerBaseTx" -80.519626680000002;
	setAttr ".RightFingerBaseTy" 147.0898718;
	setAttr ".RightFingerBaseTz" 1.305458317;
	setAttr ".RightFingerBaseRy" -2.0000646359999998;
	setAttr ".Spine1Ty" 111;
	setAttr ".Spine2Ty" 115;
	setAttr ".Spine3Ty" 119;
	setAttr ".Spine4Ty" 123;
	setAttr ".Spine5Ty" 127;
	setAttr ".Spine6Ty" 131;
	setAttr ".Spine7Ty" 135;
	setAttr ".Spine8Ty" 139;
	setAttr ".Spine9Ty" 143;
	setAttr ".Neck1Ty" 147;
	setAttr ".Neck2Ty" 149;
	setAttr ".Neck3Ty" 151;
	setAttr ".Neck4Ty" 153;
	setAttr ".Neck5Ty" 155;
	setAttr ".Neck6Ty" 157;
	setAttr ".Neck7Ty" 159;
	setAttr ".Neck8Ty" 161;
	setAttr ".Neck9Ty" 163;
	setAttr ".LeftUpLegRollTx" 8.9100008010000007;
	setAttr ".LeftUpLegRollTy" 70.997711179999996;
	setAttr ".LeftLegRollTx" 8.9100008010000007;
	setAttr ".LeftLegRollTy" 26.759407039999999;
	setAttr ".RightUpLegRollTx" -8.9100035169999998;
	setAttr ".RightUpLegRollTy" 70.997711179999996;
	setAttr ".RightUpLegRollRx" -0.0011371;
	setAttr ".RightLegRollTx" -8.9100025980000002;
	setAttr ".RightLegRollTy" 26.75940705;
	setAttr ".RightLegRollTz" 0.00043902399999999999;
	setAttr ".LeftArmRollTx" 32.968441489999996;
	setAttr ".LeftArmRollTy" 146.58868419999999;
	setAttr ".LeftForeArmRollTx" 61.340445039999999;
	setAttr ".LeftForeArmRollTy" 146.58868419999999;
	setAttr ".RightArmRollTx" -32.968521590000002;
	setAttr ".RightArmRollTy" 146.58898;
	setAttr ".RightForeArmRollTx" -61.340504160000002;
	setAttr ".RightForeArmRollTy" 146.58898;
	setAttr ".HipsTranslationTy" 100;
	setAttr ".LeftHandThumb1Tx" 76.058620989999994;
	setAttr ".LeftHandThumb1Ty" 145.79018170000001;
	setAttr ".LeftHandThumb1Tz" 4.2824339670000002;
	setAttr ".LeftHandThumb2Tx" 78.571210930000007;
	setAttr ".LeftHandThumb2Ty" 145.25408229999999;
	setAttr ".LeftHandThumb2Tz" 4.9898882909999998;
	setAttr ".LeftHandThumb2Rz" -0.00029786199999999997;
	setAttr ".LeftHandThumb3Tx" 81.114351339999999;
	setAttr ".LeftHandThumb3Ty" 145.25406910000001;
	setAttr ".LeftHandThumb3Tz" 4.989897633;
	setAttr ".LeftHandThumb4Tx" 83.78109748;
	setAttr ".LeftHandThumb4Ty" 145.254072;
	setAttr ".LeftHandThumb4Tz" 4.9898894220000001;
	setAttr ".LeftHandIndex1Tx" 80.531840860000003;
	setAttr ".LeftHandIndex1Ty" 146.7884134;
	setAttr ".LeftHandIndex1Tz" 3.4716694160000001;
	setAttr ".LeftHandIndex1Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex1Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex2Tx" 84.754595460000004;
	setAttr ".LeftHandIndex2Ty" 146.7883913;
	setAttr ".LeftHandIndex2Tz" 3.618868435;
	setAttr ".LeftHandIndex2Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex2Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex3Tx" 87.406920909999997;
	setAttr ".LeftHandIndex3Ty" 146.7883775;
	setAttr ".LeftHandIndex3Tz" 3.711324415;
	setAttr ".LeftHandIndex3Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex3Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex4Tx" 89.363955140000002;
	setAttr ".LeftHandIndex4Ty" 146.7883673;
	setAttr ".LeftHandIndex4Tz" 3.7795433150000002;
	setAttr ".LeftHandIndex4Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex4Rz" -0.00029934100000000001;
	setAttr ".LeftHandMiddle1Tx" 80.519743500000004;
	setAttr ".LeftHandMiddle1Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle1Tz" 1.3046843809999999;
	setAttr ".LeftHandMiddle1Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle2Tx" 85.382995179999995;
	setAttr ".LeftHandMiddle2Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle2Tz" 1.3049868360000001;
	setAttr ".LeftHandMiddle2Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle3Tx" 88.148231789999997;
	setAttr ".LeftHandMiddle3Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle3Tz" 1.305158619;
	setAttr ".LeftHandMiddle3Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle4Tx" 90.153863950000002;
	setAttr ".LeftHandMiddle4Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle4Tz" 1.3052822150000001;
	setAttr ".LeftHandMiddle4Ry" -0.0035633340000000005;
	setAttr ".LeftHandRing1Tx" 80.603623929999998;
	setAttr ".LeftHandRing1Ty" 146.96860380000001;
	setAttr ".LeftHandRing1Tz" -0.79315890899999997;
	setAttr ".LeftHandRing1Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing2Tx" 85.141382759999999;
	setAttr ".LeftHandRing2Ty" 146.96860380000001;
	setAttr ".LeftHandRing2Tz" -0.79315882000000004;
	setAttr ".LeftHandRing2Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing3Tx" 87.445908619999997;
	setAttr ".LeftHandRing3Ty" 146.96860380000001;
	setAttr ".LeftHandRing3Tz" -0.79315893699999995;
	setAttr ".LeftHandRing3Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing4Tx" 89.369255980000005;
	setAttr ".LeftHandRing4Ty" 146.96860380000001;
	setAttr ".LeftHandRing4Tz" -0.79315975400000005;
	setAttr ".LeftHandRing4Ry" -0.0035635290000000002;
	setAttr ".LeftHandPinky1Tx" 80.592138829999996;
	setAttr ".LeftHandPinky1Ty" 146.27565720000001;
	setAttr ".LeftHandPinky1Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky1Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky2Tx" 83.636238160000005;
	setAttr ".LeftHandPinky2Ty" 146.27569779999999;
	setAttr ".LeftHandPinky2Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky2Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky3Tx" 85.610739649999999;
	setAttr ".LeftHandPinky3Ty" 146.27572409999999;
	setAttr ".LeftHandPinky3Tz" -2.4903566079999999;
	setAttr ".LeftHandPinky3Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky4Tx" 87.277354299999999;
	setAttr ".LeftHandPinky4Ty" 146.27574630000001;
	setAttr ".LeftHandPinky4Tz" -2.4903558170000002;
	setAttr ".LeftHandPinky4Rz" 0.00076302599999999998;
	setAttr ".LeftHandExtraFinger1Tx" 80.592138829999996;
	setAttr ".LeftHandExtraFinger1Ty" 146.7884134;
	setAttr ".LeftHandExtraFinger1Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger1Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger1Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger2Tx" 82.636238160000005;
	setAttr ".LeftHandExtraFinger2Ty" 146.7883913;
	setAttr ".LeftHandExtraFinger2Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger2Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger2Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger3Tx" 84.610739649999999;
	setAttr ".LeftHandExtraFinger3Ty" 146.7883775;
	setAttr ".LeftHandExtraFinger3Tz" -4.4903566079999999;
	setAttr ".LeftHandExtraFinger3Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger3Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger4Tx" 86.277354299999999;
	setAttr ".LeftHandExtraFinger4Ty" 146.7883673;
	setAttr ".LeftHandExtraFinger4Tz" -4.4903558170000002;
	setAttr ".LeftHandExtraFinger4Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger4Rz" -0.00029934100000000001;
	setAttr ".RightHandThumb1Tx" -76.058242059999998;
	setAttr ".RightHandThumb1Ty" 145.7904806;
	setAttr ".RightHandThumb1Tz" 4.2828147379999999;
	setAttr ".RightHandThumb2Tx" -78.570769569999996;
	setAttr ".RightHandThumb2Ty" 145.25438170000001;
	setAttr ".RightHandThumb2Tz" 4.9904913879999997;
	setAttr ".RightHandThumb2Rz" -0.00060208600000000005;
	setAttr ".RightHandThumb3Tx" -81.112358929999999;
	setAttr ".RightHandThumb3Ty" 145.25440850000001;
	setAttr ".RightHandThumb3Tz" 5.0793117030000001;
	setAttr ".RightHandThumb3Rz" -0.00039149399999999999;
	setAttr ".RightHandThumb4Tx" -83.777478689999995;
	setAttr ".RightHandThumb4Ty" 145.2544268;
	setAttr ".RightHandThumb4Tz" 5.1724490200000002;
	setAttr ".RightHandThumb4Rz" -0.00039149399999999999;
	setAttr ".RightHandIndex1Tx" -80.531533929999995;
	setAttr ".RightHandIndex1Ty" 146.78871240000001;
	setAttr ".RightHandIndex1Tz" 3.4724442959999999;
	setAttr ".RightHandIndex1Ry" -2.0000646579999999;
	setAttr ".RightHandIndex2Tx" -84.754284150000004;
	setAttr ".RightHandIndex2Ty" 146.7887121;
	setAttr ".RightHandIndex2Tz" 3.325092508;
	setAttr ".RightHandIndex2Ry" -2.0000646359999998;
	setAttr ".RightHandIndex3Tx" -87.406606949999997;
	setAttr ".RightHandIndex3Ty" 146.78871179999999;
	setAttr ".RightHandIndex3Tz" 3.2325403669999999;
	setAttr ".RightHandIndex3Ry" -2.0000646359999998;
	setAttr ".RightHandIndex4Tx" -89.363639169999999;
	setAttr ".RightHandIndex4Ty" 146.78871169999999;
	setAttr ".RightHandIndex4Tz" 3.164250215;
	setAttr ".RightHandIndex4Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle1Tx" -80.519627299999996;
	setAttr ".RightHandMiddle1Ty" 147.0898718;
	setAttr ".RightHandMiddle1Tz" 1.305458427;
	setAttr ".RightHandMiddle1Ry" -2.0000646579999999;
	setAttr ".RightHandMiddle2Tx" -85.379921789999997;
	setAttr ".RightHandMiddle2Ty" 147.08987139999999;
	setAttr ".RightHandMiddle2Tz" 1.1358596750000001;
	setAttr ".RightHandMiddle2Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle3Tx" -88.143476890000002;
	setAttr ".RightHandMiddle3Ty" 147.0898712;
	setAttr ".RightHandMiddle3Tz" 1.039426113;
	setAttr ".RightHandMiddle3Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle4Tx" -90.147889570000004;
	setAttr ".RightHandMiddle4Ty" 147.089871;
	setAttr ".RightHandMiddle4Tz" 0.96948263800000001;
	setAttr ".RightHandMiddle4Ry" -2.0000646359999998;
	setAttr ".RightHandRing1Tx" -80.603693699999994;
	setAttr ".RightHandRing1Ty" 146.968899;
	setAttr ".RightHandRing1Tz" -0.79237675600000002;
	setAttr ".RightHandRing1Ry" -2.0000646579999999;
	setAttr ".RightHandRing2Tx" -85.138693309999994;
	setAttr ".RightHandRing2Ty" 146.96889859999999;
	setAttr ".RightHandRing2Tz" -0.95062442800000002;
	setAttr ".RightHandRing2Ry" -2.0000646359999998;
	setAttr ".RightHandRing3Tx" -87.441817880000002;
	setAttr ".RightHandRing3Ty" 146.9688984;
	setAttr ".RightHandRing3Tz" -1.0309913799999999;
	setAttr ".RightHandRing3Ry" -2.0000646359999998;
	setAttr ".RightHandRing4Tx" -89.363995799999998;
	setAttr ".RightHandRing4Ty" 146.96889830000001;
	setAttr ".RightHandRing4Tz" -1.0980652959999999;
	setAttr ".RightHandRing4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky1Tx" -80.592357370000002;
	setAttr ".RightHandPinky1Ty" 146.2759509;
	setAttr ".RightHandPinky1Tz" -2.4895741939999998;
	setAttr ".RightHandPinky1Ry" -2.0000646579999999;
	setAttr ".RightHandPinky1Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky2Tx" -83.638299989999993;
	setAttr ".RightHandPinky2Ty" 146.27588489999999;
	setAttr ".RightHandPinky2Tz" -2.5958615950000001;
	setAttr ".RightHandPinky2Ry" -2.0000646359999998;
	setAttr ".RightHandPinky2Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky3Tx" -85.613997130000001;
	setAttr ".RightHandPinky3Ty" 146.27584210000001;
	setAttr ".RightHandPinky3Tz" -2.6648030450000002;
	setAttr ".RightHandPinky3Ry" -2.0000646359999998;
	setAttr ".RightHandPinky3Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky4Tx" -87.28162098;
	setAttr ".RightHandPinky4Ty" 146.27580589999999;
	setAttr ".RightHandPinky4Tz" -2.7229943639999998;
	setAttr ".RightHandPinky4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky4Rz" 0.0012412149999999999;
	setAttr ".RightHandExtraFinger1Tx" -80.592357370000002;
	setAttr ".RightHandExtraFinger1Ty" 146.78871240000001;
	setAttr ".RightHandExtraFinger1Tz" -4.4895741940000002;
	setAttr ".RightHandExtraFinger1Ry" -2.0000646579999999;
	setAttr ".RightHandExtraFinger2Tx" -82.638299989999993;
	setAttr ".RightHandExtraFinger2Ty" 146.7887121;
	setAttr ".RightHandExtraFinger2Tz" -4.5958615949999997;
	setAttr ".RightHandExtraFinger2Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger3Tx" -84.613997130000001;
	setAttr ".RightHandExtraFinger3Ty" 146.78871179999999;
	setAttr ".RightHandExtraFinger3Tz" -4.6648030450000002;
	setAttr ".RightHandExtraFinger3Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger4Tx" -86.28162098;
	setAttr ".RightHandExtraFinger4Ty" 146.78871169999999;
	setAttr ".RightHandExtraFinger4Tz" -4.7229943639999998;
	setAttr ".RightHandExtraFinger4Ry" -2.0000646359999998;
	setAttr ".LeftFootThumb1Tx" 6.18422217;
	setAttr ".LeftFootThumb1Ty" 4.9992492679999998;
	setAttr ".LeftFootThumb1Tz" 1.930123209;
	setAttr ".LeftFootThumb2Tx" 4.551409713;
	setAttr ".LeftFootThumb2Ty" 2.6643834059999998;
	setAttr ".LeftFootThumb2Tz" 3.591937658;
	setAttr ".LeftFootThumb3Tx" 3.4619466889999999;
	setAttr ".LeftFootThumb3Ty" 1.8880788850000001;
	setAttr ".LeftFootThumb3Tz" 6.4001420700000002;
	setAttr ".LeftFootThumb4Tx" 3.4619466999999999;
	setAttr ".LeftFootThumb4Ty" 1.8880788550000001;
	setAttr ".LeftFootThumb4Tz" 9.6971958839999992;
	setAttr ".LeftFootIndex1Tx" 7.1105199680000002;
	setAttr ".LeftFootIndex1Ty" 1.888079117;
	setAttr ".LeftFootIndex1Tz" 12.9547209;
	setAttr ".LeftFootIndex2Tx" 7.1105199749999999;
	setAttr ".LeftFootIndex2Ty" 1.8880790999999999;
	setAttr ".LeftFootIndex2Tz" 14.82972745;
	setAttr ".LeftFootIndex3Tx" 7.1105199810000004;
	setAttr ".LeftFootIndex3Ty" 1.888079083;
	setAttr ".LeftFootIndex3Tz" 16.76314442;
	setAttr ".LeftFootIndex4Tx" 7.1105199880000001;
	setAttr ".LeftFootIndex4Ty" 1.8880790649999999;
	setAttr ".LeftFootIndex4Tz" 18.850666449999999;
	setAttr ".LeftFootMiddle1Tx" 8.9167242489999996;
	setAttr ".LeftFootMiddle1Ty" 1.888079163;
	setAttr ".LeftFootMiddle1Tz" 12.9547209;
	setAttr ".LeftFootMiddle2Tx" 8.9167242550000001;
	setAttr ".LeftFootMiddle2Ty" 1.888079147;
	setAttr ".LeftFootMiddle2Tz" 14.82860045;
	setAttr ".LeftFootMiddle3Tx" 8.9167242610000006;
	setAttr ".LeftFootMiddle3Ty" 1.888079131;
	setAttr ".LeftFootMiddle3Tz" 16.64971237;
	setAttr ".LeftFootMiddle4Tx" 8.9167242669999993;
	setAttr ".LeftFootMiddle4Ty" 1.8880791139999999;
	setAttr ".LeftFootMiddle4Tz" 18.565581959999999;
	setAttr ".LeftFootRing1Tx" 10.723903740000001;
	setAttr ".LeftFootRing1Ty" 1.888079211;
	setAttr ".LeftFootRing1Tz" 12.9547209;
	setAttr ".LeftFootRing2Tx" 10.723903740000001;
	setAttr ".LeftFootRing2Ty" 1.888079195;
	setAttr ".LeftFootRing2Tz" 14.71345226;
	setAttr ".LeftFootRing3Tx" 10.72390375;
	setAttr ".LeftFootRing3Ty" 1.8880791800000001;
	setAttr ".LeftFootRing3Tz" 16.472174209999999;
	setAttr ".LeftFootRing4Tx" 10.723903760000001;
	setAttr ".LeftFootRing4Ty" 1.8880791640000001;
	setAttr ".LeftFootRing4Tz" 18.27484922;
	setAttr ".LeftFootPinky1Tx" 12.52979668;
	setAttr ".LeftFootPinky1Ty" 1.888079257;
	setAttr ".LeftFootPinky1Tz" 12.9547209;
	setAttr ".LeftFootPinky2Tx" 12.52979669;
	setAttr ".LeftFootPinky2Ty" 1.8880792420000001;
	setAttr ".LeftFootPinky2Tz" 14.5796458;
	setAttr ".LeftFootPinky3Tx" 12.52979669;
	setAttr ".LeftFootPinky3Ty" 1.8880792289999999;
	setAttr ".LeftFootPinky3Tz" 16.143599309999999;
	setAttr ".LeftFootPinky4Tx" 12.5297967;
	setAttr ".LeftFootPinky4Ty" 1.8880792129999999;
	setAttr ".LeftFootPinky4Tz" 17.861196199999998;
	setAttr ".LeftFootExtraFinger1Tx" 5.0860939849999998;
	setAttr ".LeftFootExtraFinger1Ty" 1.888079254;
	setAttr ".LeftFootExtraFinger1Tz" 12.9547209;
	setAttr ".LeftFootExtraFinger2Tx" 5.0860939910000003;
	setAttr ".LeftFootExtraFinger2Ty" 1.888079236;
	setAttr ".LeftFootExtraFinger2Tz" 14.94401483;
	setAttr ".LeftFootExtraFinger3Tx" 5.0860939979999999;
	setAttr ".LeftFootExtraFinger3Ty" 1.8880792179999999;
	setAttr ".LeftFootExtraFinger3Tz" 16.99182682;
	setAttr ".LeftFootExtraFinger4Tx" 5.0860940049999996;
	setAttr ".LeftFootExtraFinger4Ty" 1.8880791990000001;
	setAttr ".LeftFootExtraFinger4Tz" 19.0793827;
	setAttr ".RightFootThumb1Tx" -6.180000014;
	setAttr ".RightFootThumb1Ty" 4.9992496019999999;
	setAttr ".RightFootThumb1Tz" 1.930123112;
	setAttr ".RightFootThumb2Tx" -4.5499999820000001;
	setAttr ".RightFootThumb2Ty" 2.6643838419999999;
	setAttr ".RightFootThumb2Tz" 3.5919375690000002;
	setAttr ".RightFootThumb3Tx" -3.4599999860000001;
	setAttr ".RightFootThumb3Ty" 1.888079335;
	setAttr ".RightFootThumb3Tz" 6.4001419850000003;
	setAttr ".RightFootThumb4Tx" -3.4599999860000001;
	setAttr ".RightFootThumb4Ty" 1.8880793090000001;
	setAttr ".RightFootThumb4Tz" 9.6971957989999993;
	setAttr ".RightFootIndex1Tx" -7.1099999839999999;
	setAttr ".RightFootIndex1Ty" 1.888079262;
	setAttr ".RightFootIndex1Tz" 12.95472064;
	setAttr ".RightFootIndex2Tx" -7.1099999839999999;
	setAttr ".RightFootIndex2Ty" 1.8880792479999999;
	setAttr ".RightFootIndex2Tz" 14.82972719;
	setAttr ".RightFootIndex3Tx" -7.1099999839999999;
	setAttr ".RightFootIndex3Ty" 1.8880792340000001;
	setAttr ".RightFootIndex3Tz" 16.76314416;
	setAttr ".RightFootIndex4Tx" -7.1099999839999999;
	setAttr ".RightFootIndex4Ty" 1.8880792179999999;
	setAttr ".RightFootIndex4Tz" 18.850666189999998;
	setAttr ".RightFootMiddle1Tx" -8.92;
	setAttr ".RightFootMiddle1Ty" 1.8880792049999999;
	setAttr ".RightFootMiddle1Tz" 12.954720630000001;
	setAttr ".RightFootMiddle2Tx" -8.92;
	setAttr ".RightFootMiddle2Ty" 1.8880791910000001;
	setAttr ".RightFootMiddle2Tz" 14.82860018;
	setAttr ".RightFootMiddle3Tx" -8.92;
	setAttr ".RightFootMiddle3Ty" 1.8880791770000001;
	setAttr ".RightFootMiddle3Tz" 16.649712099999999;
	setAttr ".RightFootMiddle4Tx" -8.92;
	setAttr ".RightFootMiddle4Ty" 1.8880791619999999;
	setAttr ".RightFootMiddle4Tz" 18.565581689999998;
	setAttr ".RightFootRing1Tx" -10.72;
	setAttr ".RightFootRing1Ty" 1.8880791610000001;
	setAttr ".RightFootRing1Tz" 12.95472062;
	setAttr ".RightFootRing2Tx" -10.72;
	setAttr ".RightFootRing2Ty" 1.888079147;
	setAttr ".RightFootRing2Tz" 14.713451989999999;
	setAttr ".RightFootRing3Tx" -10.72;
	setAttr ".RightFootRing3Ty" 1.888079134;
	setAttr ".RightFootRing3Tz" 16.472173940000001;
	setAttr ".RightFootRing4Tx" -10.72;
	setAttr ".RightFootRing4Ty" 1.88807912;
	setAttr ".RightFootRing4Tz" 18.274848949999999;
	setAttr ".RightFootPinky1Tx" -12.530000060000001;
	setAttr ".RightFootPinky1Ty" 1.8880791029999999;
	setAttr ".RightFootPinky1Tz" 12.95472062;
	setAttr ".RightFootPinky2Tx" -12.530000060000001;
	setAttr ".RightFootPinky2Ty" 1.888079091;
	setAttr ".RightFootPinky2Tz" 14.57964552;
	setAttr ".RightFootPinky3Tx" -12.530000060000001;
	setAttr ".RightFootPinky3Ty" 1.8880790789999999;
	setAttr ".RightFootPinky3Tz" 16.143599040000002;
	setAttr ".RightFootPinky4Tx" -12.530000060000001;
	setAttr ".RightFootPinky4Ty" 1.888079066;
	setAttr ".RightFootPinky4Tz" 17.86119592;
	setAttr ".RightFootExtraFinger1Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger1Ty" 1.8880791260000001;
	setAttr ".RightFootExtraFinger1Tz" 12.95472064;
	setAttr ".RightFootExtraFinger2Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger2Ty" 1.8880791109999999;
	setAttr ".RightFootExtraFinger2Tz" 14.944014579999999;
	setAttr ".RightFootExtraFinger3Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger3Ty" 1.888079096;
	setAttr ".RightFootExtraFinger3Tz" 16.99182656;
	setAttr ".RightFootExtraFinger4Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger4Ty" 1.88807908;
	setAttr ".RightFootExtraFinger4Tz" 19.079382450000001;
	setAttr ".LeftInHandThumbTx" 71.709864199999998;
	setAttr ".LeftInHandThumbTy" 146.58868419999999;
	setAttr ".LeftInHandIndexTx" 71.709864199999998;
	setAttr ".LeftInHandIndexTy" 146.58868419999999;
	setAttr ".LeftInHandMiddleTx" 71.709864199999998;
	setAttr ".LeftInHandMiddleTy" 146.58868419999999;
	setAttr ".LeftInHandRingTx" 71.709864199999998;
	setAttr ".LeftInHandRingTy" 146.58868419999999;
	setAttr ".LeftInHandPinkyTx" 71.709864199999998;
	setAttr ".LeftInHandPinkyTy" 146.58868419999999;
	setAttr ".LeftInHandExtraFingerTx" 71.709864199999998;
	setAttr ".LeftInHandExtraFingerTy" 146.58868419999999;
	setAttr ".RightInHandThumbTx" -71.709861489999994;
	setAttr ".RightInHandThumbTy" 146.58897870000001;
	setAttr ".RightInHandIndexTx" -71.709861489999994;
	setAttr ".RightInHandIndexTy" 146.58897870000001;
	setAttr ".RightInHandMiddleTx" -71.709861489999994;
	setAttr ".RightInHandMiddleTy" 146.58897870000001;
	setAttr ".RightInHandRingTx" -71.709861489999994;
	setAttr ".RightInHandRingTy" 146.58897870000001;
	setAttr ".RightInHandPinkyTx" -71.709861489999994;
	setAttr ".RightInHandPinkyTy" 146.58897870000001;
	setAttr ".RightInHandExtraFingerTx" -71.709861489999994;
	setAttr ".RightInHandExtraFingerTy" 146.58897870000001;
	setAttr ".LeftInFootThumbTx" 8.9100008010000007;
	setAttr ".LeftInFootThumbTy" 8.15039625;
	setAttr ".LeftInFootIndexTx" 8.9100008010000007;
	setAttr ".LeftInFootIndexTy" 8.1503963469999992;
	setAttr ".LeftInFootMiddleTx" 8.9100008010000007;
	setAttr ".LeftInFootMiddleTy" 8.1503963469999992;
	setAttr ".LeftInFootRingTx" 8.9100008010000007;
	setAttr ".LeftInFootRingTy" 8.1503963469999992;
	setAttr ".LeftInFootPinkyTx" 8.9100008010000007;
	setAttr ".LeftInFootPinkyTy" 8.1503963469999992;
	setAttr ".LeftInFootExtraFingerTx" 8.9100008010000007;
	setAttr ".LeftInFootExtraFingerTy" 8.1503963469999992;
	setAttr ".RightInFootThumbTx" -8.9100025980000002;
	setAttr ".RightInFootThumbTy" 8.1503963929999994;
	setAttr ".RightInFootThumbTz" 0.00043882099999999999;
	setAttr ".RightInFootIndexTx" -8.9100026190000001;
	setAttr ".RightInFootIndexTy" 8.1503963939999995;
	setAttr ".RightInFootIndexTz" 0.00043882099999999999;
	setAttr ".RightInFootMiddleTx" -8.9100026190000001;
	setAttr ".RightInFootMiddleTy" 8.1503963939999995;
	setAttr ".RightInFootMiddleTz" 0.00043882099999999999;
	setAttr ".RightInFootRingTx" -8.9100026190000001;
	setAttr ".RightInFootRingTy" 8.1503963939999995;
	setAttr ".RightInFootRingTz" 0.00043882099999999999;
	setAttr ".RightInFootPinkyTx" -8.9100026190000001;
	setAttr ".RightInFootPinkyTy" 8.1503963939999995;
	setAttr ".RightInFootPinkyTz" 0.00043882099999999999;
	setAttr ".RightInFootExtraFingerTx" -8.9100026190000001;
	setAttr ".RightInFootExtraFingerTy" 8.1503963939999995;
	setAttr ".RightInFootExtraFingerTz" 0.00043882099999999999;
	setAttr ".LeftShoulderExtraTx" 12.353625535000001;
	setAttr ".LeftShoulderExtraTy" 146.58868419999999;
	setAttr ".RightShoulderExtraTx" -12.353637216499999;
	setAttr ".RightShoulderExtraTy" 146.58898;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n"
		+ "            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n"
		+ "                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n"
		+ "                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n"
		+ "            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n"
		+ "            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n"
		+ "                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n"
		+ "                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n"
		+ "                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n"
		+ "            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n"
		+ "            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n"
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 0.5\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n"
		+ "                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n"
		+ "                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n"
		+ "                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 0.5\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n"
		+ "                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n"
		+ "                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n"
		+ "                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n"
		+ "                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n"
		+ "                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n"
		+ "                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n"
		+ "                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\nstereoCameraView -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n"
		+ "            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n"
		+ "                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\nstereoCameraView -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n"
		+ "        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 20 100 -ps 2 80 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n\t\t\t\t\t\"outlinerPanel\"\n\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showReferenceNodes 0\\n    -showReferenceMembers 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showReferenceNodes 0\\n    -showReferenceMembers 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 100 -size 1000 -divisions 2 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 24 -ast 0 -aet 48 ";
	setAttr ".st" 6;
createNode hyperGraphInfo -n "nodeEditorPanel2Info";
createNode hyperView -n "hyperView1";
	setAttr ".vl" -type "double2" -329.08596316797485 -43018.745359349661 ;
	setAttr ".vh" -type "double2" 904.52748221017634 -42280.089897164791 ;
	setAttr ".dag" no;
createNode script -n "sceneReviewData";
	setAttr ".b" -type "string" "try:\r\timport Red9.core.Red9_Tools as r9Tools;\r\tr9Tools.SceneReviewerUI.show();\rexcept:\r\tpass";
	setAttr ".st" 1;
	setAttr ".stp" 1;
createNode lambert -n "LeftProxy";
	setAttr ".c" -type "float3" 0.43439499 0.815 0.44162649 ;
createNode shadingEngine -n "LeftProxySG";
	setAttr ".ihi" 0;
	setAttr -s 21 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode lambert -n "RightProxy";
	setAttr ".c" -type "float3" 0.54777408 0.49995402 0.93800002 ;
createNode shadingEngine -n "RightProxySG";
	setAttr ".ihi" 0;
	setAttr -s 6 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode lambert -n "CentreProxy";
	setAttr ".c" -type "float3" 0.48751998 0.67741489 0.88 ;
createNode shadingEngine -n "CentreProxySG";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
createNode HIKSkeletonGeneratorNode -n "HIKSkeletonGeneratorNode2";
	setAttr ".ihi" 0;
	setAttr ".WantIndexFinger" yes;
	setAttr ".WantMiddleFinger" yes;
	setAttr ".WantRingFinger" yes;
	setAttr ".WantPinkyFinger" yes;
	setAttr ".WantThumb" yes;
	setAttr ".WantToeBase" yes;
	setAttr ".HipsTy" 100;
	setAttr ".LeftUpLegTx" 8.9100008010000007;
	setAttr ".LeftUpLegTy" 93.729999539999994;
	setAttr ".LeftLegTx" 8.9100008010000007;
	setAttr ".LeftLegTy" 48.851354600000001;
	setAttr ".LeftFootTx" 8.9100008010000007;
	setAttr ".LeftFootTy" 8.1503963469999992;
	setAttr ".RightUpLegTx" -8.9100008010000007;
	setAttr ".RightUpLegTy" 93.729999539999994;
	setAttr ".RightLegTx" -8.9100035169999998;
	setAttr ".RightLegTy" 48.851354600000001;
	setAttr ".RightLegTz" 0.00043902399999999999;
	setAttr ".RightFootTx" -8.9100025980000002;
	setAttr ".RightFootTy" 8.1503963509999995;
	setAttr ".RightFootTz" 0.00043902399999999999;
	setAttr ".RightFootRy" -0.0048003860000000002;
	setAttr ".SpineTy" 107;
	setAttr ".LeftArmTx" 17.707251070000002;
	setAttr ".LeftArmTy" 146.58868419999999;
	setAttr ".LeftForeArmTx" 45.012716769999997;
	setAttr ".LeftForeArmTy" 146.58868419999999;
	setAttr ".LeftHandTx" 71.709864139999993;
	setAttr ".LeftHandTy" 146.58868419999999;
	setAttr ".RightArmTx" -17.707274909999999;
	setAttr ".RightArmTy" 146.58898;
	setAttr ".RightForeArmTx" -45.012873159999998;
	setAttr ".RightForeArmTy" 146.58898;
	setAttr ".RightHandTx" -71.709861270000005;
	setAttr ".RightHandTy" 146.58897870000001;
	setAttr ".HeadTy" 165;
	setAttr ".LeftToeBaseTx" 8.9100092279999998;
	setAttr ".LeftToeBaseTy" 1.8880791539999999;
	setAttr ".LeftToeBaseTz" 12.9547209;
	setAttr ".RightToeBaseTx" -8.9110879789999995;
	setAttr ".RightToeBaseTy" 1.888079171;
	setAttr ".RightToeBaseTz" 12.95518809;
	setAttr ".RightToeBaseRx" 0.0029125930000000002;
	setAttr ".RightToeBaseRy" -0.0048003860000000002;
	setAttr ".LeftShoulderTx" 7.0000004770000004;
	setAttr ".LeftShoulderTy" 146.58854679999999;
	setAttr ".LeftShoulderRz" 0.00073528199999999997;
	setAttr ".RightShoulderTx" -6.9999995229999996;
	setAttr ".RightShoulderTy" 146.58854679999999;
	setAttr ".RightShoulderRz" -0.0023183610000000001;
	setAttr ".NeckTy" 145;
	setAttr ".LeftFingerBaseTx" 80.519743439999999;
	setAttr ".LeftFingerBaseTy" 147.08957459999999;
	setAttr ".LeftFingerBaseTz" 1.304684401;
	setAttr ".LeftFingerBaseRy" -0.0035633340000000005;
	setAttr ".RightFingerBaseTx" -80.519626680000002;
	setAttr ".RightFingerBaseTy" 147.0898718;
	setAttr ".RightFingerBaseTz" 1.305458317;
	setAttr ".RightFingerBaseRy" -2.0000646359999998;
	setAttr ".Spine1Ty" 111;
	setAttr ".Spine2Ty" 115;
	setAttr ".Spine3Ty" 119;
	setAttr ".Spine4Ty" 123;
	setAttr ".Spine5Ty" 127;
	setAttr ".Spine6Ty" 131;
	setAttr ".Spine7Ty" 135;
	setAttr ".Spine8Ty" 139;
	setAttr ".Spine9Ty" 143;
	setAttr ".Neck1Ty" 147;
	setAttr ".Neck2Ty" 149;
	setAttr ".Neck3Ty" 151;
	setAttr ".Neck4Ty" 153;
	setAttr ".Neck5Ty" 155;
	setAttr ".Neck6Ty" 157;
	setAttr ".Neck7Ty" 159;
	setAttr ".Neck8Ty" 161;
	setAttr ".Neck9Ty" 163;
	setAttr ".LeftUpLegRollTx" 8.9100008010000007;
	setAttr ".LeftUpLegRollTy" 70.997711179999996;
	setAttr ".LeftLegRollTx" 8.9100008010000007;
	setAttr ".LeftLegRollTy" 26.759407039999999;
	setAttr ".RightUpLegRollTx" -8.9100035169999998;
	setAttr ".RightUpLegRollTy" 70.997711179999996;
	setAttr ".RightUpLegRollRx" -0.0011371;
	setAttr ".RightLegRollTx" -8.9100025980000002;
	setAttr ".RightLegRollTy" 26.75940705;
	setAttr ".RightLegRollTz" 0.00043902399999999999;
	setAttr ".LeftArmRollTx" 32.968441489999996;
	setAttr ".LeftArmRollTy" 146.58868419999999;
	setAttr ".LeftForeArmRollTx" 61.340445039999999;
	setAttr ".LeftForeArmRollTy" 146.58868419999999;
	setAttr ".RightArmRollTx" -32.968521590000002;
	setAttr ".RightArmRollTy" 146.58898;
	setAttr ".RightForeArmRollTx" -61.340504160000002;
	setAttr ".RightForeArmRollTy" 146.58898;
	setAttr ".HipsTranslationTy" 100;
	setAttr ".LeftHandThumb1Tx" 76.058620989999994;
	setAttr ".LeftHandThumb1Ty" 145.79018170000001;
	setAttr ".LeftHandThumb1Tz" 4.2824339670000002;
	setAttr ".LeftHandThumb2Tx" 78.571210930000007;
	setAttr ".LeftHandThumb2Ty" 145.25408229999999;
	setAttr ".LeftHandThumb2Tz" 4.9898882909999998;
	setAttr ".LeftHandThumb2Rz" -0.00029786199999999997;
	setAttr ".LeftHandThumb3Tx" 81.114351339999999;
	setAttr ".LeftHandThumb3Ty" 145.25406910000001;
	setAttr ".LeftHandThumb3Tz" 4.989897633;
	setAttr ".LeftHandThumb4Tx" 83.78109748;
	setAttr ".LeftHandThumb4Ty" 145.254072;
	setAttr ".LeftHandThumb4Tz" 4.9898894220000001;
	setAttr ".LeftHandIndex1Tx" 80.531840860000003;
	setAttr ".LeftHandIndex1Ty" 146.7884134;
	setAttr ".LeftHandIndex1Tz" 3.4716694160000001;
	setAttr ".LeftHandIndex1Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex1Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex2Tx" 84.754595460000004;
	setAttr ".LeftHandIndex2Ty" 146.7883913;
	setAttr ".LeftHandIndex2Tz" 3.618868435;
	setAttr ".LeftHandIndex2Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex2Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex3Tx" 87.406920909999997;
	setAttr ".LeftHandIndex3Ty" 146.7883775;
	setAttr ".LeftHandIndex3Tz" 3.711324415;
	setAttr ".LeftHandIndex3Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex3Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex4Tx" 89.363955140000002;
	setAttr ".LeftHandIndex4Ty" 146.7883673;
	setAttr ".LeftHandIndex4Tz" 3.7795433150000002;
	setAttr ".LeftHandIndex4Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex4Rz" -0.00029934100000000001;
	setAttr ".LeftHandMiddle1Tx" 80.519743500000004;
	setAttr ".LeftHandMiddle1Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle1Tz" 1.3046843809999999;
	setAttr ".LeftHandMiddle1Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle2Tx" 85.382995179999995;
	setAttr ".LeftHandMiddle2Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle2Tz" 1.3049868360000001;
	setAttr ".LeftHandMiddle2Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle3Tx" 88.148231789999997;
	setAttr ".LeftHandMiddle3Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle3Tz" 1.305158619;
	setAttr ".LeftHandMiddle3Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle4Tx" 90.153863950000002;
	setAttr ".LeftHandMiddle4Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle4Tz" 1.3052822150000001;
	setAttr ".LeftHandMiddle4Ry" -0.0035633340000000005;
	setAttr ".LeftHandRing1Tx" 80.603623929999998;
	setAttr ".LeftHandRing1Ty" 146.96860380000001;
	setAttr ".LeftHandRing1Tz" -0.79315890899999997;
	setAttr ".LeftHandRing1Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing2Tx" 85.141382759999999;
	setAttr ".LeftHandRing2Ty" 146.96860380000001;
	setAttr ".LeftHandRing2Tz" -0.79315882000000004;
	setAttr ".LeftHandRing2Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing3Tx" 87.445908619999997;
	setAttr ".LeftHandRing3Ty" 146.96860380000001;
	setAttr ".LeftHandRing3Tz" -0.79315893699999995;
	setAttr ".LeftHandRing3Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing4Tx" 89.369255980000005;
	setAttr ".LeftHandRing4Ty" 146.96860380000001;
	setAttr ".LeftHandRing4Tz" -0.79315975400000005;
	setAttr ".LeftHandRing4Ry" -0.0035635290000000002;
	setAttr ".LeftHandPinky1Tx" 80.592138829999996;
	setAttr ".LeftHandPinky1Ty" 146.27565720000001;
	setAttr ".LeftHandPinky1Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky1Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky2Tx" 83.636238160000005;
	setAttr ".LeftHandPinky2Ty" 146.27569779999999;
	setAttr ".LeftHandPinky2Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky2Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky3Tx" 85.610739649999999;
	setAttr ".LeftHandPinky3Ty" 146.27572409999999;
	setAttr ".LeftHandPinky3Tz" -2.4903566079999999;
	setAttr ".LeftHandPinky3Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky4Tx" 87.277354299999999;
	setAttr ".LeftHandPinky4Ty" 146.27574630000001;
	setAttr ".LeftHandPinky4Tz" -2.4903558170000002;
	setAttr ".LeftHandPinky4Rz" 0.00076302599999999998;
	setAttr ".LeftHandExtraFinger1Tx" 80.592138829999996;
	setAttr ".LeftHandExtraFinger1Ty" 146.7884134;
	setAttr ".LeftHandExtraFinger1Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger1Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger1Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger2Tx" 82.636238160000005;
	setAttr ".LeftHandExtraFinger2Ty" 146.7883913;
	setAttr ".LeftHandExtraFinger2Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger2Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger2Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger3Tx" 84.610739649999999;
	setAttr ".LeftHandExtraFinger3Ty" 146.7883775;
	setAttr ".LeftHandExtraFinger3Tz" -4.4903566079999999;
	setAttr ".LeftHandExtraFinger3Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger3Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger4Tx" 86.277354299999999;
	setAttr ".LeftHandExtraFinger4Ty" 146.7883673;
	setAttr ".LeftHandExtraFinger4Tz" -4.4903558170000002;
	setAttr ".LeftHandExtraFinger4Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger4Rz" -0.00029934100000000001;
	setAttr ".RightHandThumb1Tx" -76.058242059999998;
	setAttr ".RightHandThumb1Ty" 145.7904806;
	setAttr ".RightHandThumb1Tz" 4.2828147379999999;
	setAttr ".RightHandThumb2Tx" -78.570769569999996;
	setAttr ".RightHandThumb2Ty" 145.25438170000001;
	setAttr ".RightHandThumb2Tz" 4.9904913879999997;
	setAttr ".RightHandThumb2Rz" -0.00060208600000000005;
	setAttr ".RightHandThumb3Tx" -81.112358929999999;
	setAttr ".RightHandThumb3Ty" 145.25440850000001;
	setAttr ".RightHandThumb3Tz" 5.0793117030000001;
	setAttr ".RightHandThumb3Rz" -0.00039149399999999999;
	setAttr ".RightHandThumb4Tx" -83.777478689999995;
	setAttr ".RightHandThumb4Ty" 145.2544268;
	setAttr ".RightHandThumb4Tz" 5.1724490200000002;
	setAttr ".RightHandThumb4Rz" -0.00039149399999999999;
	setAttr ".RightHandIndex1Tx" -80.531533929999995;
	setAttr ".RightHandIndex1Ty" 146.78871240000001;
	setAttr ".RightHandIndex1Tz" 3.4724442959999999;
	setAttr ".RightHandIndex1Ry" -2.0000646579999999;
	setAttr ".RightHandIndex2Tx" -84.754284150000004;
	setAttr ".RightHandIndex2Ty" 146.7887121;
	setAttr ".RightHandIndex2Tz" 3.325092508;
	setAttr ".RightHandIndex2Ry" -2.0000646359999998;
	setAttr ".RightHandIndex3Tx" -87.406606949999997;
	setAttr ".RightHandIndex3Ty" 146.78871179999999;
	setAttr ".RightHandIndex3Tz" 3.2325403669999999;
	setAttr ".RightHandIndex3Ry" -2.0000646359999998;
	setAttr ".RightHandIndex4Tx" -89.363639169999999;
	setAttr ".RightHandIndex4Ty" 146.78871169999999;
	setAttr ".RightHandIndex4Tz" 3.164250215;
	setAttr ".RightHandIndex4Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle1Tx" -80.519627299999996;
	setAttr ".RightHandMiddle1Ty" 147.0898718;
	setAttr ".RightHandMiddle1Tz" 1.305458427;
	setAttr ".RightHandMiddle1Ry" -2.0000646579999999;
	setAttr ".RightHandMiddle2Tx" -85.379921789999997;
	setAttr ".RightHandMiddle2Ty" 147.08987139999999;
	setAttr ".RightHandMiddle2Tz" 1.1358596750000001;
	setAttr ".RightHandMiddle2Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle3Tx" -88.143476890000002;
	setAttr ".RightHandMiddle3Ty" 147.0898712;
	setAttr ".RightHandMiddle3Tz" 1.039426113;
	setAttr ".RightHandMiddle3Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle4Tx" -90.147889570000004;
	setAttr ".RightHandMiddle4Ty" 147.089871;
	setAttr ".RightHandMiddle4Tz" 0.96948263800000001;
	setAttr ".RightHandMiddle4Ry" -2.0000646359999998;
	setAttr ".RightHandRing1Tx" -80.603693699999994;
	setAttr ".RightHandRing1Ty" 146.968899;
	setAttr ".RightHandRing1Tz" -0.79237675600000002;
	setAttr ".RightHandRing1Ry" -2.0000646579999999;
	setAttr ".RightHandRing2Tx" -85.138693309999994;
	setAttr ".RightHandRing2Ty" 146.96889859999999;
	setAttr ".RightHandRing2Tz" -0.95062442800000002;
	setAttr ".RightHandRing2Ry" -2.0000646359999998;
	setAttr ".RightHandRing3Tx" -87.441817880000002;
	setAttr ".RightHandRing3Ty" 146.9688984;
	setAttr ".RightHandRing3Tz" -1.0309913799999999;
	setAttr ".RightHandRing3Ry" -2.0000646359999998;
	setAttr ".RightHandRing4Tx" -89.363995799999998;
	setAttr ".RightHandRing4Ty" 146.96889830000001;
	setAttr ".RightHandRing4Tz" -1.0980652959999999;
	setAttr ".RightHandRing4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky1Tx" -80.592357370000002;
	setAttr ".RightHandPinky1Ty" 146.2759509;
	setAttr ".RightHandPinky1Tz" -2.4895741939999998;
	setAttr ".RightHandPinky1Ry" -2.0000646579999999;
	setAttr ".RightHandPinky1Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky2Tx" -83.638299989999993;
	setAttr ".RightHandPinky2Ty" 146.27588489999999;
	setAttr ".RightHandPinky2Tz" -2.5958615950000001;
	setAttr ".RightHandPinky2Ry" -2.0000646359999998;
	setAttr ".RightHandPinky2Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky3Tx" -85.613997130000001;
	setAttr ".RightHandPinky3Ty" 146.27584210000001;
	setAttr ".RightHandPinky3Tz" -2.6648030450000002;
	setAttr ".RightHandPinky3Ry" -2.0000646359999998;
	setAttr ".RightHandPinky3Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky4Tx" -87.28162098;
	setAttr ".RightHandPinky4Ty" 146.27580589999999;
	setAttr ".RightHandPinky4Tz" -2.7229943639999998;
	setAttr ".RightHandPinky4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky4Rz" 0.0012412149999999999;
	setAttr ".RightHandExtraFinger1Tx" -80.592357370000002;
	setAttr ".RightHandExtraFinger1Ty" 146.78871240000001;
	setAttr ".RightHandExtraFinger1Tz" -4.4895741940000002;
	setAttr ".RightHandExtraFinger1Ry" -2.0000646579999999;
	setAttr ".RightHandExtraFinger2Tx" -82.638299989999993;
	setAttr ".RightHandExtraFinger2Ty" 146.7887121;
	setAttr ".RightHandExtraFinger2Tz" -4.5958615949999997;
	setAttr ".RightHandExtraFinger2Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger3Tx" -84.613997130000001;
	setAttr ".RightHandExtraFinger3Ty" 146.78871179999999;
	setAttr ".RightHandExtraFinger3Tz" -4.6648030450000002;
	setAttr ".RightHandExtraFinger3Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger4Tx" -86.28162098;
	setAttr ".RightHandExtraFinger4Ty" 146.78871169999999;
	setAttr ".RightHandExtraFinger4Tz" -4.7229943639999998;
	setAttr ".RightHandExtraFinger4Ry" -2.0000646359999998;
	setAttr ".LeftFootThumb1Tx" 6.18422217;
	setAttr ".LeftFootThumb1Ty" 4.9992492679999998;
	setAttr ".LeftFootThumb1Tz" 1.930123209;
	setAttr ".LeftFootThumb2Tx" 4.551409713;
	setAttr ".LeftFootThumb2Ty" 2.6643834059999998;
	setAttr ".LeftFootThumb2Tz" 3.591937658;
	setAttr ".LeftFootThumb3Tx" 3.4619466889999999;
	setAttr ".LeftFootThumb3Ty" 1.8880788850000001;
	setAttr ".LeftFootThumb3Tz" 6.4001420700000002;
	setAttr ".LeftFootThumb4Tx" 3.4619466999999999;
	setAttr ".LeftFootThumb4Ty" 1.8880788550000001;
	setAttr ".LeftFootThumb4Tz" 9.6971958839999992;
	setAttr ".LeftFootIndex1Tx" 7.1105199680000002;
	setAttr ".LeftFootIndex1Ty" 1.888079117;
	setAttr ".LeftFootIndex1Tz" 12.9547209;
	setAttr ".LeftFootIndex2Tx" 7.1105199749999999;
	setAttr ".LeftFootIndex2Ty" 1.8880790999999999;
	setAttr ".LeftFootIndex2Tz" 14.82972745;
	setAttr ".LeftFootIndex3Tx" 7.1105199810000004;
	setAttr ".LeftFootIndex3Ty" 1.888079083;
	setAttr ".LeftFootIndex3Tz" 16.76314442;
	setAttr ".LeftFootIndex4Tx" 7.1105199880000001;
	setAttr ".LeftFootIndex4Ty" 1.8880790649999999;
	setAttr ".LeftFootIndex4Tz" 18.850666449999999;
	setAttr ".LeftFootMiddle1Tx" 8.9167242489999996;
	setAttr ".LeftFootMiddle1Ty" 1.888079163;
	setAttr ".LeftFootMiddle1Tz" 12.9547209;
	setAttr ".LeftFootMiddle2Tx" 8.9167242550000001;
	setAttr ".LeftFootMiddle2Ty" 1.888079147;
	setAttr ".LeftFootMiddle2Tz" 14.82860045;
	setAttr ".LeftFootMiddle3Tx" 8.9167242610000006;
	setAttr ".LeftFootMiddle3Ty" 1.888079131;
	setAttr ".LeftFootMiddle3Tz" 16.64971237;
	setAttr ".LeftFootMiddle4Tx" 8.9167242669999993;
	setAttr ".LeftFootMiddle4Ty" 1.8880791139999999;
	setAttr ".LeftFootMiddle4Tz" 18.565581959999999;
	setAttr ".LeftFootRing1Tx" 10.723903740000001;
	setAttr ".LeftFootRing1Ty" 1.888079211;
	setAttr ".LeftFootRing1Tz" 12.9547209;
	setAttr ".LeftFootRing2Tx" 10.723903740000001;
	setAttr ".LeftFootRing2Ty" 1.888079195;
	setAttr ".LeftFootRing2Tz" 14.71345226;
	setAttr ".LeftFootRing3Tx" 10.72390375;
	setAttr ".LeftFootRing3Ty" 1.8880791800000001;
	setAttr ".LeftFootRing3Tz" 16.472174209999999;
	setAttr ".LeftFootRing4Tx" 10.723903760000001;
	setAttr ".LeftFootRing4Ty" 1.8880791640000001;
	setAttr ".LeftFootRing4Tz" 18.27484922;
	setAttr ".LeftFootPinky1Tx" 12.52979668;
	setAttr ".LeftFootPinky1Ty" 1.888079257;
	setAttr ".LeftFootPinky1Tz" 12.9547209;
	setAttr ".LeftFootPinky2Tx" 12.52979669;
	setAttr ".LeftFootPinky2Ty" 1.8880792420000001;
	setAttr ".LeftFootPinky2Tz" 14.5796458;
	setAttr ".LeftFootPinky3Tx" 12.52979669;
	setAttr ".LeftFootPinky3Ty" 1.8880792289999999;
	setAttr ".LeftFootPinky3Tz" 16.143599309999999;
	setAttr ".LeftFootPinky4Tx" 12.5297967;
	setAttr ".LeftFootPinky4Ty" 1.8880792129999999;
	setAttr ".LeftFootPinky4Tz" 17.861196199999998;
	setAttr ".LeftFootExtraFinger1Tx" 5.0860939849999998;
	setAttr ".LeftFootExtraFinger1Ty" 1.888079254;
	setAttr ".LeftFootExtraFinger1Tz" 12.9547209;
	setAttr ".LeftFootExtraFinger2Tx" 5.0860939910000003;
	setAttr ".LeftFootExtraFinger2Ty" 1.888079236;
	setAttr ".LeftFootExtraFinger2Tz" 14.94401483;
	setAttr ".LeftFootExtraFinger3Tx" 5.0860939979999999;
	setAttr ".LeftFootExtraFinger3Ty" 1.8880792179999999;
	setAttr ".LeftFootExtraFinger3Tz" 16.99182682;
	setAttr ".LeftFootExtraFinger4Tx" 5.0860940049999996;
	setAttr ".LeftFootExtraFinger4Ty" 1.8880791990000001;
	setAttr ".LeftFootExtraFinger4Tz" 19.0793827;
	setAttr ".RightFootThumb1Tx" -6.180000014;
	setAttr ".RightFootThumb1Ty" 4.9992496019999999;
	setAttr ".RightFootThumb1Tz" 1.930123112;
	setAttr ".RightFootThumb2Tx" -4.5499999820000001;
	setAttr ".RightFootThumb2Ty" 2.6643838419999999;
	setAttr ".RightFootThumb2Tz" 3.5919375690000002;
	setAttr ".RightFootThumb3Tx" -3.4599999860000001;
	setAttr ".RightFootThumb3Ty" 1.888079335;
	setAttr ".RightFootThumb3Tz" 6.4001419850000003;
	setAttr ".RightFootThumb4Tx" -3.4599999860000001;
	setAttr ".RightFootThumb4Ty" 1.8880793090000001;
	setAttr ".RightFootThumb4Tz" 9.6971957989999993;
	setAttr ".RightFootIndex1Tx" -7.1099999839999999;
	setAttr ".RightFootIndex1Ty" 1.888079262;
	setAttr ".RightFootIndex1Tz" 12.95472064;
	setAttr ".RightFootIndex2Tx" -7.1099999839999999;
	setAttr ".RightFootIndex2Ty" 1.8880792479999999;
	setAttr ".RightFootIndex2Tz" 14.82972719;
	setAttr ".RightFootIndex3Tx" -7.1099999839999999;
	setAttr ".RightFootIndex3Ty" 1.8880792340000001;
	setAttr ".RightFootIndex3Tz" 16.76314416;
	setAttr ".RightFootIndex4Tx" -7.1099999839999999;
	setAttr ".RightFootIndex4Ty" 1.8880792179999999;
	setAttr ".RightFootIndex4Tz" 18.850666189999998;
	setAttr ".RightFootMiddle1Tx" -8.92;
	setAttr ".RightFootMiddle1Ty" 1.8880792049999999;
	setAttr ".RightFootMiddle1Tz" 12.954720630000001;
	setAttr ".RightFootMiddle2Tx" -8.92;
	setAttr ".RightFootMiddle2Ty" 1.8880791910000001;
	setAttr ".RightFootMiddle2Tz" 14.82860018;
	setAttr ".RightFootMiddle3Tx" -8.92;
	setAttr ".RightFootMiddle3Ty" 1.8880791770000001;
	setAttr ".RightFootMiddle3Tz" 16.649712099999999;
	setAttr ".RightFootMiddle4Tx" -8.92;
	setAttr ".RightFootMiddle4Ty" 1.8880791619999999;
	setAttr ".RightFootMiddle4Tz" 18.565581689999998;
	setAttr ".RightFootRing1Tx" -10.72;
	setAttr ".RightFootRing1Ty" 1.8880791610000001;
	setAttr ".RightFootRing1Tz" 12.95472062;
	setAttr ".RightFootRing2Tx" -10.72;
	setAttr ".RightFootRing2Ty" 1.888079147;
	setAttr ".RightFootRing2Tz" 14.713451989999999;
	setAttr ".RightFootRing3Tx" -10.72;
	setAttr ".RightFootRing3Ty" 1.888079134;
	setAttr ".RightFootRing3Tz" 16.472173940000001;
	setAttr ".RightFootRing4Tx" -10.72;
	setAttr ".RightFootRing4Ty" 1.88807912;
	setAttr ".RightFootRing4Tz" 18.274848949999999;
	setAttr ".RightFootPinky1Tx" -12.530000060000001;
	setAttr ".RightFootPinky1Ty" 1.8880791029999999;
	setAttr ".RightFootPinky1Tz" 12.95472062;
	setAttr ".RightFootPinky2Tx" -12.530000060000001;
	setAttr ".RightFootPinky2Ty" 1.888079091;
	setAttr ".RightFootPinky2Tz" 14.57964552;
	setAttr ".RightFootPinky3Tx" -12.530000060000001;
	setAttr ".RightFootPinky3Ty" 1.8880790789999999;
	setAttr ".RightFootPinky3Tz" 16.143599040000002;
	setAttr ".RightFootPinky4Tx" -12.530000060000001;
	setAttr ".RightFootPinky4Ty" 1.888079066;
	setAttr ".RightFootPinky4Tz" 17.86119592;
	setAttr ".RightFootExtraFinger1Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger1Ty" 1.8880791260000001;
	setAttr ".RightFootExtraFinger1Tz" 12.95472064;
	setAttr ".RightFootExtraFinger2Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger2Ty" 1.8880791109999999;
	setAttr ".RightFootExtraFinger2Tz" 14.944014579999999;
	setAttr ".RightFootExtraFinger3Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger3Ty" 1.888079096;
	setAttr ".RightFootExtraFinger3Tz" 16.99182656;
	setAttr ".RightFootExtraFinger4Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger4Ty" 1.88807908;
	setAttr ".RightFootExtraFinger4Tz" 19.079382450000001;
	setAttr ".LeftInHandThumbTx" 71.709864199999998;
	setAttr ".LeftInHandThumbTy" 146.58868419999999;
	setAttr ".LeftInHandIndexTx" 71.709864199999998;
	setAttr ".LeftInHandIndexTy" 146.58868419999999;
	setAttr ".LeftInHandMiddleTx" 71.709864199999998;
	setAttr ".LeftInHandMiddleTy" 146.58868419999999;
	setAttr ".LeftInHandRingTx" 71.709864199999998;
	setAttr ".LeftInHandRingTy" 146.58868419999999;
	setAttr ".LeftInHandPinkyTx" 71.709864199999998;
	setAttr ".LeftInHandPinkyTy" 146.58868419999999;
	setAttr ".LeftInHandExtraFingerTx" 71.709864199999998;
	setAttr ".LeftInHandExtraFingerTy" 146.58868419999999;
	setAttr ".RightInHandThumbTx" -71.709861489999994;
	setAttr ".RightInHandThumbTy" 146.58897870000001;
	setAttr ".RightInHandIndexTx" -71.709861489999994;
	setAttr ".RightInHandIndexTy" 146.58897870000001;
	setAttr ".RightInHandMiddleTx" -71.709861489999994;
	setAttr ".RightInHandMiddleTy" 146.58897870000001;
	setAttr ".RightInHandRingTx" -71.709861489999994;
	setAttr ".RightInHandRingTy" 146.58897870000001;
	setAttr ".RightInHandPinkyTx" -71.709861489999994;
	setAttr ".RightInHandPinkyTy" 146.58897870000001;
	setAttr ".RightInHandExtraFingerTx" -71.709861489999994;
	setAttr ".RightInHandExtraFingerTy" 146.58897870000001;
	setAttr ".LeftInFootThumbTx" 8.9100008010000007;
	setAttr ".LeftInFootThumbTy" 8.15039625;
	setAttr ".LeftInFootIndexTx" 8.9100008010000007;
	setAttr ".LeftInFootIndexTy" 8.1503963469999992;
	setAttr ".LeftInFootMiddleTx" 8.9100008010000007;
	setAttr ".LeftInFootMiddleTy" 8.1503963469999992;
	setAttr ".LeftInFootRingTx" 8.9100008010000007;
	setAttr ".LeftInFootRingTy" 8.1503963469999992;
	setAttr ".LeftInFootPinkyTx" 8.9100008010000007;
	setAttr ".LeftInFootPinkyTy" 8.1503963469999992;
	setAttr ".LeftInFootExtraFingerTx" 8.9100008010000007;
	setAttr ".LeftInFootExtraFingerTy" 8.1503963469999992;
	setAttr ".RightInFootThumbTx" -8.9100025980000002;
	setAttr ".RightInFootThumbTy" 8.1503963929999994;
	setAttr ".RightInFootThumbTz" 0.00043882099999999999;
	setAttr ".RightInFootIndexTx" -8.9100026190000001;
	setAttr ".RightInFootIndexTy" 8.1503963939999995;
	setAttr ".RightInFootIndexTz" 0.00043882099999999999;
	setAttr ".RightInFootMiddleTx" -8.9100026190000001;
	setAttr ".RightInFootMiddleTy" 8.1503963939999995;
	setAttr ".RightInFootMiddleTz" 0.00043882099999999999;
	setAttr ".RightInFootRingTx" -8.9100026190000001;
	setAttr ".RightInFootRingTy" 8.1503963939999995;
	setAttr ".RightInFootRingTz" 0.00043882099999999999;
	setAttr ".RightInFootPinkyTx" -8.9100026190000001;
	setAttr ".RightInFootPinkyTy" 8.1503963939999995;
	setAttr ".RightInFootPinkyTz" 0.00043882099999999999;
	setAttr ".RightInFootExtraFingerTx" -8.9100026190000001;
	setAttr ".RightInFootExtraFingerTy" 8.1503963939999995;
	setAttr ".RightInFootExtraFingerTz" 0.00043882099999999999;
	setAttr ".LeftShoulderExtraTx" 12.353625535000001;
	setAttr ".LeftShoulderExtraTy" 146.58868419999999;
	setAttr ".RightShoulderExtraTx" -12.353637216499999;
	setAttr ".RightShoulderExtraTy" 146.58898;
createNode hyperGraphInfo -n "nodeEditorPanel2Info1";
createNode hyperView -n "hyperView2";
	setAttr ".vl" -type "double2" -329.08596316797485 -43018.745359349661 ;
	setAttr ".vh" -type "double2" 904.52748221017634 -42280.089897164791 ;
	setAttr ".dag" no;
createNode makeNurbCircle -n "makeNurbCircle1";
	setAttr ".r" 6.3529021483193331;
createNode HIKSkeletonGeneratorNode -n "HIKSkeletonGeneratorNode3";
	setAttr ".ihi" 0;
	setAttr ".WantIndexFinger" yes;
	setAttr ".WantMiddleFinger" yes;
	setAttr ".WantRingFinger" yes;
	setAttr ".WantPinkyFinger" yes;
	setAttr ".WantThumb" yes;
	setAttr ".WantToeBase" yes;
	setAttr ".HipsTy" 100;
	setAttr ".LeftUpLegTx" 8.9100008010000007;
	setAttr ".LeftUpLegTy" 93.729999539999994;
	setAttr ".LeftLegTx" 8.9100008010000007;
	setAttr ".LeftLegTy" 48.851354600000001;
	setAttr ".LeftFootTx" 8.9100008010000007;
	setAttr ".LeftFootTy" 8.1503963469999992;
	setAttr ".RightUpLegTx" -8.9100008010000007;
	setAttr ".RightUpLegTy" 93.729999539999994;
	setAttr ".RightLegTx" -8.9100035169999998;
	setAttr ".RightLegTy" 48.851354600000001;
	setAttr ".RightLegTz" 0.00043902399999999999;
	setAttr ".RightFootTx" -8.9100025980000002;
	setAttr ".RightFootTy" 8.1503963509999995;
	setAttr ".RightFootTz" 0.00043902399999999999;
	setAttr ".RightFootRy" -0.0048003860000000002;
	setAttr ".SpineTy" 107;
	setAttr ".LeftArmTx" 17.707251070000002;
	setAttr ".LeftArmTy" 146.58868419999999;
	setAttr ".LeftForeArmTx" 45.012716769999997;
	setAttr ".LeftForeArmTy" 146.58868419999999;
	setAttr ".LeftHandTx" 71.709864139999993;
	setAttr ".LeftHandTy" 146.58868419999999;
	setAttr ".RightArmTx" -17.707274909999999;
	setAttr ".RightArmTy" 146.58898;
	setAttr ".RightForeArmTx" -45.012873159999998;
	setAttr ".RightForeArmTy" 146.58898;
	setAttr ".RightHandTx" -71.709861270000005;
	setAttr ".RightHandTy" 146.58897870000001;
	setAttr ".HeadTy" 165;
	setAttr ".LeftToeBaseTx" 8.9100092279999998;
	setAttr ".LeftToeBaseTy" 1.8880791539999999;
	setAttr ".LeftToeBaseTz" 12.9547209;
	setAttr ".RightToeBaseTx" -8.9110879789999995;
	setAttr ".RightToeBaseTy" 1.888079171;
	setAttr ".RightToeBaseTz" 12.95518809;
	setAttr ".RightToeBaseRx" 0.0029125930000000002;
	setAttr ".RightToeBaseRy" -0.0048003860000000002;
	setAttr ".LeftShoulderTx" 7.0000004770000004;
	setAttr ".LeftShoulderTy" 146.58854679999999;
	setAttr ".LeftShoulderRz" 0.00073528199999999997;
	setAttr ".RightShoulderTx" -6.9999995229999996;
	setAttr ".RightShoulderTy" 146.58854679999999;
	setAttr ".RightShoulderRz" -0.0023183610000000001;
	setAttr ".NeckTy" 145;
	setAttr ".LeftFingerBaseTx" 80.519743439999999;
	setAttr ".LeftFingerBaseTy" 147.08957459999999;
	setAttr ".LeftFingerBaseTz" 1.304684401;
	setAttr ".LeftFingerBaseRy" -0.0035633340000000005;
	setAttr ".RightFingerBaseTx" -80.519626680000002;
	setAttr ".RightFingerBaseTy" 147.0898718;
	setAttr ".RightFingerBaseTz" 1.305458317;
	setAttr ".RightFingerBaseRy" -2.0000646359999998;
	setAttr ".Spine1Ty" 111;
	setAttr ".Spine2Ty" 115;
	setAttr ".Spine3Ty" 119;
	setAttr ".Spine4Ty" 123;
	setAttr ".Spine5Ty" 127;
	setAttr ".Spine6Ty" 131;
	setAttr ".Spine7Ty" 135;
	setAttr ".Spine8Ty" 139;
	setAttr ".Spine9Ty" 143;
	setAttr ".Neck1Ty" 147;
	setAttr ".Neck2Ty" 149;
	setAttr ".Neck3Ty" 151;
	setAttr ".Neck4Ty" 153;
	setAttr ".Neck5Ty" 155;
	setAttr ".Neck6Ty" 157;
	setAttr ".Neck7Ty" 159;
	setAttr ".Neck8Ty" 161;
	setAttr ".Neck9Ty" 163;
	setAttr ".LeftUpLegRollTx" 8.9100008010000007;
	setAttr ".LeftUpLegRollTy" 70.997711179999996;
	setAttr ".LeftLegRollTx" 8.9100008010000007;
	setAttr ".LeftLegRollTy" 26.759407039999999;
	setAttr ".RightUpLegRollTx" -8.9100035169999998;
	setAttr ".RightUpLegRollTy" 70.997711179999996;
	setAttr ".RightUpLegRollRx" -0.0011371;
	setAttr ".RightLegRollTx" -8.9100025980000002;
	setAttr ".RightLegRollTy" 26.75940705;
	setAttr ".RightLegRollTz" 0.00043902399999999999;
	setAttr ".LeftArmRollTx" 32.968441489999996;
	setAttr ".LeftArmRollTy" 146.58868419999999;
	setAttr ".LeftForeArmRollTx" 61.340445039999999;
	setAttr ".LeftForeArmRollTy" 146.58868419999999;
	setAttr ".RightArmRollTx" -32.968521590000002;
	setAttr ".RightArmRollTy" 146.58898;
	setAttr ".RightForeArmRollTx" -61.340504160000002;
	setAttr ".RightForeArmRollTy" 146.58898;
	setAttr ".HipsTranslationTy" 100;
	setAttr ".LeftHandThumb1Tx" 76.058620989999994;
	setAttr ".LeftHandThumb1Ty" 145.79018170000001;
	setAttr ".LeftHandThumb1Tz" 4.2824339670000002;
	setAttr ".LeftHandThumb2Tx" 78.571210930000007;
	setAttr ".LeftHandThumb2Ty" 145.25408229999999;
	setAttr ".LeftHandThumb2Tz" 4.9898882909999998;
	setAttr ".LeftHandThumb2Rz" -0.00029786199999999997;
	setAttr ".LeftHandThumb3Tx" 81.114351339999999;
	setAttr ".LeftHandThumb3Ty" 145.25406910000001;
	setAttr ".LeftHandThumb3Tz" 4.989897633;
	setAttr ".LeftHandThumb4Tx" 83.78109748;
	setAttr ".LeftHandThumb4Ty" 145.254072;
	setAttr ".LeftHandThumb4Tz" 4.9898894220000001;
	setAttr ".LeftHandIndex1Tx" 80.531840860000003;
	setAttr ".LeftHandIndex1Ty" 146.7884134;
	setAttr ".LeftHandIndex1Tz" 3.4716694160000001;
	setAttr ".LeftHandIndex1Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex1Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex2Tx" 84.754595460000004;
	setAttr ".LeftHandIndex2Ty" 146.7883913;
	setAttr ".LeftHandIndex2Tz" 3.618868435;
	setAttr ".LeftHandIndex2Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex2Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex3Tx" 87.406920909999997;
	setAttr ".LeftHandIndex3Ty" 146.7883775;
	setAttr ".LeftHandIndex3Tz" 3.711324415;
	setAttr ".LeftHandIndex3Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex3Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex4Tx" 89.363955140000002;
	setAttr ".LeftHandIndex4Ty" 146.7883673;
	setAttr ".LeftHandIndex4Tz" 3.7795433150000002;
	setAttr ".LeftHandIndex4Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex4Rz" -0.00029934100000000001;
	setAttr ".LeftHandMiddle1Tx" 80.519743500000004;
	setAttr ".LeftHandMiddle1Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle1Tz" 1.3046843809999999;
	setAttr ".LeftHandMiddle1Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle2Tx" 85.382995179999995;
	setAttr ".LeftHandMiddle2Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle2Tz" 1.3049868360000001;
	setAttr ".LeftHandMiddle2Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle3Tx" 88.148231789999997;
	setAttr ".LeftHandMiddle3Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle3Tz" 1.305158619;
	setAttr ".LeftHandMiddle3Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle4Tx" 90.153863950000002;
	setAttr ".LeftHandMiddle4Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle4Tz" 1.3052822150000001;
	setAttr ".LeftHandMiddle4Ry" -0.0035633340000000005;
	setAttr ".LeftHandRing1Tx" 80.603623929999998;
	setAttr ".LeftHandRing1Ty" 146.96860380000001;
	setAttr ".LeftHandRing1Tz" -0.79315890899999997;
	setAttr ".LeftHandRing1Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing2Tx" 85.141382759999999;
	setAttr ".LeftHandRing2Ty" 146.96860380000001;
	setAttr ".LeftHandRing2Tz" -0.79315882000000004;
	setAttr ".LeftHandRing2Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing3Tx" 87.445908619999997;
	setAttr ".LeftHandRing3Ty" 146.96860380000001;
	setAttr ".LeftHandRing3Tz" -0.79315893699999995;
	setAttr ".LeftHandRing3Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing4Tx" 89.369255980000005;
	setAttr ".LeftHandRing4Ty" 146.96860380000001;
	setAttr ".LeftHandRing4Tz" -0.79315975400000005;
	setAttr ".LeftHandRing4Ry" -0.0035635290000000002;
	setAttr ".LeftHandPinky1Tx" 80.592138829999996;
	setAttr ".LeftHandPinky1Ty" 146.27565720000001;
	setAttr ".LeftHandPinky1Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky1Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky2Tx" 83.636238160000005;
	setAttr ".LeftHandPinky2Ty" 146.27569779999999;
	setAttr ".LeftHandPinky2Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky2Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky3Tx" 85.610739649999999;
	setAttr ".LeftHandPinky3Ty" 146.27572409999999;
	setAttr ".LeftHandPinky3Tz" -2.4903566079999999;
	setAttr ".LeftHandPinky3Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky4Tx" 87.277354299999999;
	setAttr ".LeftHandPinky4Ty" 146.27574630000001;
	setAttr ".LeftHandPinky4Tz" -2.4903558170000002;
	setAttr ".LeftHandPinky4Rz" 0.00076302599999999998;
	setAttr ".LeftHandExtraFinger1Tx" 80.592138829999996;
	setAttr ".LeftHandExtraFinger1Ty" 146.7884134;
	setAttr ".LeftHandExtraFinger1Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger1Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger1Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger2Tx" 82.636238160000005;
	setAttr ".LeftHandExtraFinger2Ty" 146.7883913;
	setAttr ".LeftHandExtraFinger2Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger2Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger2Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger3Tx" 84.610739649999999;
	setAttr ".LeftHandExtraFinger3Ty" 146.7883775;
	setAttr ".LeftHandExtraFinger3Tz" -4.4903566079999999;
	setAttr ".LeftHandExtraFinger3Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger3Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger4Tx" 86.277354299999999;
	setAttr ".LeftHandExtraFinger4Ty" 146.7883673;
	setAttr ".LeftHandExtraFinger4Tz" -4.4903558170000002;
	setAttr ".LeftHandExtraFinger4Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger4Rz" -0.00029934100000000001;
	setAttr ".RightHandThumb1Tx" -76.058242059999998;
	setAttr ".RightHandThumb1Ty" 145.7904806;
	setAttr ".RightHandThumb1Tz" 4.2828147379999999;
	setAttr ".RightHandThumb2Tx" -78.570769569999996;
	setAttr ".RightHandThumb2Ty" 145.25438170000001;
	setAttr ".RightHandThumb2Tz" 4.9904913879999997;
	setAttr ".RightHandThumb2Rz" -0.00060208600000000005;
	setAttr ".RightHandThumb3Tx" -81.112358929999999;
	setAttr ".RightHandThumb3Ty" 145.25440850000001;
	setAttr ".RightHandThumb3Tz" 5.0793117030000001;
	setAttr ".RightHandThumb3Rz" -0.00039149399999999999;
	setAttr ".RightHandThumb4Tx" -83.777478689999995;
	setAttr ".RightHandThumb4Ty" 145.2544268;
	setAttr ".RightHandThumb4Tz" 5.1724490200000002;
	setAttr ".RightHandThumb4Rz" -0.00039149399999999999;
	setAttr ".RightHandIndex1Tx" -80.531533929999995;
	setAttr ".RightHandIndex1Ty" 146.78871240000001;
	setAttr ".RightHandIndex1Tz" 3.4724442959999999;
	setAttr ".RightHandIndex1Ry" -2.0000646579999999;
	setAttr ".RightHandIndex2Tx" -84.754284150000004;
	setAttr ".RightHandIndex2Ty" 146.7887121;
	setAttr ".RightHandIndex2Tz" 3.325092508;
	setAttr ".RightHandIndex2Ry" -2.0000646359999998;
	setAttr ".RightHandIndex3Tx" -87.406606949999997;
	setAttr ".RightHandIndex3Ty" 146.78871179999999;
	setAttr ".RightHandIndex3Tz" 3.2325403669999999;
	setAttr ".RightHandIndex3Ry" -2.0000646359999998;
	setAttr ".RightHandIndex4Tx" -89.363639169999999;
	setAttr ".RightHandIndex4Ty" 146.78871169999999;
	setAttr ".RightHandIndex4Tz" 3.164250215;
	setAttr ".RightHandIndex4Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle1Tx" -80.519627299999996;
	setAttr ".RightHandMiddle1Ty" 147.0898718;
	setAttr ".RightHandMiddle1Tz" 1.305458427;
	setAttr ".RightHandMiddle1Ry" -2.0000646579999999;
	setAttr ".RightHandMiddle2Tx" -85.379921789999997;
	setAttr ".RightHandMiddle2Ty" 147.08987139999999;
	setAttr ".RightHandMiddle2Tz" 1.1358596750000001;
	setAttr ".RightHandMiddle2Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle3Tx" -88.143476890000002;
	setAttr ".RightHandMiddle3Ty" 147.0898712;
	setAttr ".RightHandMiddle3Tz" 1.039426113;
	setAttr ".RightHandMiddle3Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle4Tx" -90.147889570000004;
	setAttr ".RightHandMiddle4Ty" 147.089871;
	setAttr ".RightHandMiddle4Tz" 0.96948263800000001;
	setAttr ".RightHandMiddle4Ry" -2.0000646359999998;
	setAttr ".RightHandRing1Tx" -80.603693699999994;
	setAttr ".RightHandRing1Ty" 146.968899;
	setAttr ".RightHandRing1Tz" -0.79237675600000002;
	setAttr ".RightHandRing1Ry" -2.0000646579999999;
	setAttr ".RightHandRing2Tx" -85.138693309999994;
	setAttr ".RightHandRing2Ty" 146.96889859999999;
	setAttr ".RightHandRing2Tz" -0.95062442800000002;
	setAttr ".RightHandRing2Ry" -2.0000646359999998;
	setAttr ".RightHandRing3Tx" -87.441817880000002;
	setAttr ".RightHandRing3Ty" 146.9688984;
	setAttr ".RightHandRing3Tz" -1.0309913799999999;
	setAttr ".RightHandRing3Ry" -2.0000646359999998;
	setAttr ".RightHandRing4Tx" -89.363995799999998;
	setAttr ".RightHandRing4Ty" 146.96889830000001;
	setAttr ".RightHandRing4Tz" -1.0980652959999999;
	setAttr ".RightHandRing4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky1Tx" -80.592357370000002;
	setAttr ".RightHandPinky1Ty" 146.2759509;
	setAttr ".RightHandPinky1Tz" -2.4895741939999998;
	setAttr ".RightHandPinky1Ry" -2.0000646579999999;
	setAttr ".RightHandPinky1Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky2Tx" -83.638299989999993;
	setAttr ".RightHandPinky2Ty" 146.27588489999999;
	setAttr ".RightHandPinky2Tz" -2.5958615950000001;
	setAttr ".RightHandPinky2Ry" -2.0000646359999998;
	setAttr ".RightHandPinky2Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky3Tx" -85.613997130000001;
	setAttr ".RightHandPinky3Ty" 146.27584210000001;
	setAttr ".RightHandPinky3Tz" -2.6648030450000002;
	setAttr ".RightHandPinky3Ry" -2.0000646359999998;
	setAttr ".RightHandPinky3Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky4Tx" -87.28162098;
	setAttr ".RightHandPinky4Ty" 146.27580589999999;
	setAttr ".RightHandPinky4Tz" -2.7229943639999998;
	setAttr ".RightHandPinky4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky4Rz" 0.0012412149999999999;
	setAttr ".RightHandExtraFinger1Tx" -80.592357370000002;
	setAttr ".RightHandExtraFinger1Ty" 146.78871240000001;
	setAttr ".RightHandExtraFinger1Tz" -4.4895741940000002;
	setAttr ".RightHandExtraFinger1Ry" -2.0000646579999999;
	setAttr ".RightHandExtraFinger2Tx" -82.638299989999993;
	setAttr ".RightHandExtraFinger2Ty" 146.7887121;
	setAttr ".RightHandExtraFinger2Tz" -4.5958615949999997;
	setAttr ".RightHandExtraFinger2Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger3Tx" -84.613997130000001;
	setAttr ".RightHandExtraFinger3Ty" 146.78871179999999;
	setAttr ".RightHandExtraFinger3Tz" -4.6648030450000002;
	setAttr ".RightHandExtraFinger3Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger4Tx" -86.28162098;
	setAttr ".RightHandExtraFinger4Ty" 146.78871169999999;
	setAttr ".RightHandExtraFinger4Tz" -4.7229943639999998;
	setAttr ".RightHandExtraFinger4Ry" -2.0000646359999998;
	setAttr ".LeftFootThumb1Tx" 6.18422217;
	setAttr ".LeftFootThumb1Ty" 4.9992492679999998;
	setAttr ".LeftFootThumb1Tz" 1.930123209;
	setAttr ".LeftFootThumb2Tx" 4.551409713;
	setAttr ".LeftFootThumb2Ty" 2.6643834059999998;
	setAttr ".LeftFootThumb2Tz" 3.591937658;
	setAttr ".LeftFootThumb3Tx" 3.4619466889999999;
	setAttr ".LeftFootThumb3Ty" 1.8880788850000001;
	setAttr ".LeftFootThumb3Tz" 6.4001420700000002;
	setAttr ".LeftFootThumb4Tx" 3.4619466999999999;
	setAttr ".LeftFootThumb4Ty" 1.8880788550000001;
	setAttr ".LeftFootThumb4Tz" 9.6971958839999992;
	setAttr ".LeftFootIndex1Tx" 7.1105199680000002;
	setAttr ".LeftFootIndex1Ty" 1.888079117;
	setAttr ".LeftFootIndex1Tz" 12.9547209;
	setAttr ".LeftFootIndex2Tx" 7.1105199749999999;
	setAttr ".LeftFootIndex2Ty" 1.8880790999999999;
	setAttr ".LeftFootIndex2Tz" 14.82972745;
	setAttr ".LeftFootIndex3Tx" 7.1105199810000004;
	setAttr ".LeftFootIndex3Ty" 1.888079083;
	setAttr ".LeftFootIndex3Tz" 16.76314442;
	setAttr ".LeftFootIndex4Tx" 7.1105199880000001;
	setAttr ".LeftFootIndex4Ty" 1.8880790649999999;
	setAttr ".LeftFootIndex4Tz" 18.850666449999999;
	setAttr ".LeftFootMiddle1Tx" 8.9167242489999996;
	setAttr ".LeftFootMiddle1Ty" 1.888079163;
	setAttr ".LeftFootMiddle1Tz" 12.9547209;
	setAttr ".LeftFootMiddle2Tx" 8.9167242550000001;
	setAttr ".LeftFootMiddle2Ty" 1.888079147;
	setAttr ".LeftFootMiddle2Tz" 14.82860045;
	setAttr ".LeftFootMiddle3Tx" 8.9167242610000006;
	setAttr ".LeftFootMiddle3Ty" 1.888079131;
	setAttr ".LeftFootMiddle3Tz" 16.64971237;
	setAttr ".LeftFootMiddle4Tx" 8.9167242669999993;
	setAttr ".LeftFootMiddle4Ty" 1.8880791139999999;
	setAttr ".LeftFootMiddle4Tz" 18.565581959999999;
	setAttr ".LeftFootRing1Tx" 10.723903740000001;
	setAttr ".LeftFootRing1Ty" 1.888079211;
	setAttr ".LeftFootRing1Tz" 12.9547209;
	setAttr ".LeftFootRing2Tx" 10.723903740000001;
	setAttr ".LeftFootRing2Ty" 1.888079195;
	setAttr ".LeftFootRing2Tz" 14.71345226;
	setAttr ".LeftFootRing3Tx" 10.72390375;
	setAttr ".LeftFootRing3Ty" 1.8880791800000001;
	setAttr ".LeftFootRing3Tz" 16.472174209999999;
	setAttr ".LeftFootRing4Tx" 10.723903760000001;
	setAttr ".LeftFootRing4Ty" 1.8880791640000001;
	setAttr ".LeftFootRing4Tz" 18.27484922;
	setAttr ".LeftFootPinky1Tx" 12.52979668;
	setAttr ".LeftFootPinky1Ty" 1.888079257;
	setAttr ".LeftFootPinky1Tz" 12.9547209;
	setAttr ".LeftFootPinky2Tx" 12.52979669;
	setAttr ".LeftFootPinky2Ty" 1.8880792420000001;
	setAttr ".LeftFootPinky2Tz" 14.5796458;
	setAttr ".LeftFootPinky3Tx" 12.52979669;
	setAttr ".LeftFootPinky3Ty" 1.8880792289999999;
	setAttr ".LeftFootPinky3Tz" 16.143599309999999;
	setAttr ".LeftFootPinky4Tx" 12.5297967;
	setAttr ".LeftFootPinky4Ty" 1.8880792129999999;
	setAttr ".LeftFootPinky4Tz" 17.861196199999998;
	setAttr ".LeftFootExtraFinger1Tx" 5.0860939849999998;
	setAttr ".LeftFootExtraFinger1Ty" 1.888079254;
	setAttr ".LeftFootExtraFinger1Tz" 12.9547209;
	setAttr ".LeftFootExtraFinger2Tx" 5.0860939910000003;
	setAttr ".LeftFootExtraFinger2Ty" 1.888079236;
	setAttr ".LeftFootExtraFinger2Tz" 14.94401483;
	setAttr ".LeftFootExtraFinger3Tx" 5.0860939979999999;
	setAttr ".LeftFootExtraFinger3Ty" 1.8880792179999999;
	setAttr ".LeftFootExtraFinger3Tz" 16.99182682;
	setAttr ".LeftFootExtraFinger4Tx" 5.0860940049999996;
	setAttr ".LeftFootExtraFinger4Ty" 1.8880791990000001;
	setAttr ".LeftFootExtraFinger4Tz" 19.0793827;
	setAttr ".RightFootThumb1Tx" -6.180000014;
	setAttr ".RightFootThumb1Ty" 4.9992496019999999;
	setAttr ".RightFootThumb1Tz" 1.930123112;
	setAttr ".RightFootThumb2Tx" -4.5499999820000001;
	setAttr ".RightFootThumb2Ty" 2.6643838419999999;
	setAttr ".RightFootThumb2Tz" 3.5919375690000002;
	setAttr ".RightFootThumb3Tx" -3.4599999860000001;
	setAttr ".RightFootThumb3Ty" 1.888079335;
	setAttr ".RightFootThumb3Tz" 6.4001419850000003;
	setAttr ".RightFootThumb4Tx" -3.4599999860000001;
	setAttr ".RightFootThumb4Ty" 1.8880793090000001;
	setAttr ".RightFootThumb4Tz" 9.6971957989999993;
	setAttr ".RightFootIndex1Tx" -7.1099999839999999;
	setAttr ".RightFootIndex1Ty" 1.888079262;
	setAttr ".RightFootIndex1Tz" 12.95472064;
	setAttr ".RightFootIndex2Tx" -7.1099999839999999;
	setAttr ".RightFootIndex2Ty" 1.8880792479999999;
	setAttr ".RightFootIndex2Tz" 14.82972719;
	setAttr ".RightFootIndex3Tx" -7.1099999839999999;
	setAttr ".RightFootIndex3Ty" 1.8880792340000001;
	setAttr ".RightFootIndex3Tz" 16.76314416;
	setAttr ".RightFootIndex4Tx" -7.1099999839999999;
	setAttr ".RightFootIndex4Ty" 1.8880792179999999;
	setAttr ".RightFootIndex4Tz" 18.850666189999998;
	setAttr ".RightFootMiddle1Tx" -8.92;
	setAttr ".RightFootMiddle1Ty" 1.8880792049999999;
	setAttr ".RightFootMiddle1Tz" 12.954720630000001;
	setAttr ".RightFootMiddle2Tx" -8.92;
	setAttr ".RightFootMiddle2Ty" 1.8880791910000001;
	setAttr ".RightFootMiddle2Tz" 14.82860018;
	setAttr ".RightFootMiddle3Tx" -8.92;
	setAttr ".RightFootMiddle3Ty" 1.8880791770000001;
	setAttr ".RightFootMiddle3Tz" 16.649712099999999;
	setAttr ".RightFootMiddle4Tx" -8.92;
	setAttr ".RightFootMiddle4Ty" 1.8880791619999999;
	setAttr ".RightFootMiddle4Tz" 18.565581689999998;
	setAttr ".RightFootRing1Tx" -10.72;
	setAttr ".RightFootRing1Ty" 1.8880791610000001;
	setAttr ".RightFootRing1Tz" 12.95472062;
	setAttr ".RightFootRing2Tx" -10.72;
	setAttr ".RightFootRing2Ty" 1.888079147;
	setAttr ".RightFootRing2Tz" 14.713451989999999;
	setAttr ".RightFootRing3Tx" -10.72;
	setAttr ".RightFootRing3Ty" 1.888079134;
	setAttr ".RightFootRing3Tz" 16.472173940000001;
	setAttr ".RightFootRing4Tx" -10.72;
	setAttr ".RightFootRing4Ty" 1.88807912;
	setAttr ".RightFootRing4Tz" 18.274848949999999;
	setAttr ".RightFootPinky1Tx" -12.530000060000001;
	setAttr ".RightFootPinky1Ty" 1.8880791029999999;
	setAttr ".RightFootPinky1Tz" 12.95472062;
	setAttr ".RightFootPinky2Tx" -12.530000060000001;
	setAttr ".RightFootPinky2Ty" 1.888079091;
	setAttr ".RightFootPinky2Tz" 14.57964552;
	setAttr ".RightFootPinky3Tx" -12.530000060000001;
	setAttr ".RightFootPinky3Ty" 1.8880790789999999;
	setAttr ".RightFootPinky3Tz" 16.143599040000002;
	setAttr ".RightFootPinky4Tx" -12.530000060000001;
	setAttr ".RightFootPinky4Ty" 1.888079066;
	setAttr ".RightFootPinky4Tz" 17.86119592;
	setAttr ".RightFootExtraFinger1Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger1Ty" 1.8880791260000001;
	setAttr ".RightFootExtraFinger1Tz" 12.95472064;
	setAttr ".RightFootExtraFinger2Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger2Ty" 1.8880791109999999;
	setAttr ".RightFootExtraFinger2Tz" 14.944014579999999;
	setAttr ".RightFootExtraFinger3Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger3Ty" 1.888079096;
	setAttr ".RightFootExtraFinger3Tz" 16.99182656;
	setAttr ".RightFootExtraFinger4Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger4Ty" 1.88807908;
	setAttr ".RightFootExtraFinger4Tz" 19.079382450000001;
	setAttr ".LeftInHandThumbTx" 71.709864199999998;
	setAttr ".LeftInHandThumbTy" 146.58868419999999;
	setAttr ".LeftInHandIndexTx" 71.709864199999998;
	setAttr ".LeftInHandIndexTy" 146.58868419999999;
	setAttr ".LeftInHandMiddleTx" 71.709864199999998;
	setAttr ".LeftInHandMiddleTy" 146.58868419999999;
	setAttr ".LeftInHandRingTx" 71.709864199999998;
	setAttr ".LeftInHandRingTy" 146.58868419999999;
	setAttr ".LeftInHandPinkyTx" 71.709864199999998;
	setAttr ".LeftInHandPinkyTy" 146.58868419999999;
	setAttr ".LeftInHandExtraFingerTx" 71.709864199999998;
	setAttr ".LeftInHandExtraFingerTy" 146.58868419999999;
	setAttr ".RightInHandThumbTx" -71.709861489999994;
	setAttr ".RightInHandThumbTy" 146.58897870000001;
	setAttr ".RightInHandIndexTx" -71.709861489999994;
	setAttr ".RightInHandIndexTy" 146.58897870000001;
	setAttr ".RightInHandMiddleTx" -71.709861489999994;
	setAttr ".RightInHandMiddleTy" 146.58897870000001;
	setAttr ".RightInHandRingTx" -71.709861489999994;
	setAttr ".RightInHandRingTy" 146.58897870000001;
	setAttr ".RightInHandPinkyTx" -71.709861489999994;
	setAttr ".RightInHandPinkyTy" 146.58897870000001;
	setAttr ".RightInHandExtraFingerTx" -71.709861489999994;
	setAttr ".RightInHandExtraFingerTy" 146.58897870000001;
	setAttr ".LeftInFootThumbTx" 8.9100008010000007;
	setAttr ".LeftInFootThumbTy" 8.15039625;
	setAttr ".LeftInFootIndexTx" 8.9100008010000007;
	setAttr ".LeftInFootIndexTy" 8.1503963469999992;
	setAttr ".LeftInFootMiddleTx" 8.9100008010000007;
	setAttr ".LeftInFootMiddleTy" 8.1503963469999992;
	setAttr ".LeftInFootRingTx" 8.9100008010000007;
	setAttr ".LeftInFootRingTy" 8.1503963469999992;
	setAttr ".LeftInFootPinkyTx" 8.9100008010000007;
	setAttr ".LeftInFootPinkyTy" 8.1503963469999992;
	setAttr ".LeftInFootExtraFingerTx" 8.9100008010000007;
	setAttr ".LeftInFootExtraFingerTy" 8.1503963469999992;
	setAttr ".RightInFootThumbTx" -8.9100025980000002;
	setAttr ".RightInFootThumbTy" 8.1503963929999994;
	setAttr ".RightInFootThumbTz" 0.00043882099999999999;
	setAttr ".RightInFootIndexTx" -8.9100026190000001;
	setAttr ".RightInFootIndexTy" 8.1503963939999995;
	setAttr ".RightInFootIndexTz" 0.00043882099999999999;
	setAttr ".RightInFootMiddleTx" -8.9100026190000001;
	setAttr ".RightInFootMiddleTy" 8.1503963939999995;
	setAttr ".RightInFootMiddleTz" 0.00043882099999999999;
	setAttr ".RightInFootRingTx" -8.9100026190000001;
	setAttr ".RightInFootRingTy" 8.1503963939999995;
	setAttr ".RightInFootRingTz" 0.00043882099999999999;
	setAttr ".RightInFootPinkyTx" -8.9100026190000001;
	setAttr ".RightInFootPinkyTy" 8.1503963939999995;
	setAttr ".RightInFootPinkyTz" 0.00043882099999999999;
	setAttr ".RightInFootExtraFingerTx" -8.9100026190000001;
	setAttr ".RightInFootExtraFingerTy" 8.1503963939999995;
	setAttr ".RightInFootExtraFingerTz" 0.00043882099999999999;
	setAttr ".LeftShoulderExtraTx" 12.353625535000001;
	setAttr ".LeftShoulderExtraTy" 146.58868419999999;
	setAttr ".RightShoulderExtraTx" -12.353637216499999;
	setAttr ".RightShoulderExtraTy" 146.58898;
createNode transformGeometry -n "transformGeometry1";
	setAttr ".txf" -type "matrix" 5.331517619125357 0 0 0 0 5.331517619125357 0 0 0 0 5.331517619125357 0
		 0 0 0 1;
createNode transformGeometry -n "transformGeometry2";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 2.2204460492503131e-016 -1 0 0 1 2.2204460492503131e-016 0
		 -0.20748645528617704 0.80187713757770496 0 1;
createNode hyperGraphInfo -n "nodeEditorPanel2Info2";
createNode hyperView -n "hyperView3";
	setAttr ".vl" -type "double2" -329.08596316797485 -43018.745359349661 ;
	setAttr ".vh" -type "double2" 904.52748221017634 -42280.089897164791 ;
	setAttr ".dag" no;
createNode ikRPsolver -n "ikRPsolver2";
createNode ikSCsolver -n "ikSCsolver2";
createNode HIKSkeletonGeneratorNode -n "HIKSkeletonGeneratorNode4";
	setAttr ".ihi" 0;
	setAttr ".WantIndexFinger" yes;
	setAttr ".WantMiddleFinger" yes;
	setAttr ".WantRingFinger" yes;
	setAttr ".WantPinkyFinger" yes;
	setAttr ".WantThumb" yes;
	setAttr ".WantToeBase" yes;
	setAttr ".HipsTy" 100;
	setAttr ".LeftUpLegTx" 8.9100008010000007;
	setAttr ".LeftUpLegTy" 93.729999539999994;
	setAttr ".LeftLegTx" 8.9100008010000007;
	setAttr ".LeftLegTy" 48.851354600000001;
	setAttr ".LeftFootTx" 8.9100008010000007;
	setAttr ".LeftFootTy" 8.1503963469999992;
	setAttr ".RightUpLegTx" -8.9100008010000007;
	setAttr ".RightUpLegTy" 93.729999539999994;
	setAttr ".RightLegTx" -8.9100035169999998;
	setAttr ".RightLegTy" 48.851354600000001;
	setAttr ".RightLegTz" 0.00043902399999999999;
	setAttr ".RightFootTx" -8.9100025980000002;
	setAttr ".RightFootTy" 8.1503963509999995;
	setAttr ".RightFootTz" 0.00043902399999999999;
	setAttr ".RightFootRy" -0.0048003860000000002;
	setAttr ".SpineTy" 107;
	setAttr ".LeftArmTx" 17.707251070000002;
	setAttr ".LeftArmTy" 146.58868419999999;
	setAttr ".LeftForeArmTx" 45.012716769999997;
	setAttr ".LeftForeArmTy" 146.58868419999999;
	setAttr ".LeftHandTx" 71.709864139999993;
	setAttr ".LeftHandTy" 146.58868419999999;
	setAttr ".RightArmTx" -17.707274909999999;
	setAttr ".RightArmTy" 146.58898;
	setAttr ".RightForeArmTx" -45.012873159999998;
	setAttr ".RightForeArmTy" 146.58898;
	setAttr ".RightHandTx" -71.709861270000005;
	setAttr ".RightHandTy" 146.58897870000001;
	setAttr ".HeadTy" 165;
	setAttr ".LeftToeBaseTx" 8.9100092279999998;
	setAttr ".LeftToeBaseTy" 1.8880791539999999;
	setAttr ".LeftToeBaseTz" 12.9547209;
	setAttr ".RightToeBaseTx" -8.9110879789999995;
	setAttr ".RightToeBaseTy" 1.888079171;
	setAttr ".RightToeBaseTz" 12.95518809;
	setAttr ".RightToeBaseRx" 0.0029125930000000002;
	setAttr ".RightToeBaseRy" -0.0048003860000000002;
	setAttr ".LeftShoulderTx" 7.0000004770000004;
	setAttr ".LeftShoulderTy" 146.58854679999999;
	setAttr ".LeftShoulderRz" 0.00073528199999999997;
	setAttr ".RightShoulderTx" -6.9999995229999996;
	setAttr ".RightShoulderTy" 146.58854679999999;
	setAttr ".RightShoulderRz" -0.0023183610000000001;
	setAttr ".NeckTy" 145;
	setAttr ".LeftFingerBaseTx" 80.519743439999999;
	setAttr ".LeftFingerBaseTy" 147.08957459999999;
	setAttr ".LeftFingerBaseTz" 1.304684401;
	setAttr ".LeftFingerBaseRy" -0.0035633340000000005;
	setAttr ".RightFingerBaseTx" -80.519626680000002;
	setAttr ".RightFingerBaseTy" 147.0898718;
	setAttr ".RightFingerBaseTz" 1.305458317;
	setAttr ".RightFingerBaseRy" -2.0000646359999998;
	setAttr ".Spine1Ty" 111;
	setAttr ".Spine2Ty" 115;
	setAttr ".Spine3Ty" 119;
	setAttr ".Spine4Ty" 123;
	setAttr ".Spine5Ty" 127;
	setAttr ".Spine6Ty" 131;
	setAttr ".Spine7Ty" 135;
	setAttr ".Spine8Ty" 139;
	setAttr ".Spine9Ty" 143;
	setAttr ".Neck1Ty" 147;
	setAttr ".Neck2Ty" 149;
	setAttr ".Neck3Ty" 151;
	setAttr ".Neck4Ty" 153;
	setAttr ".Neck5Ty" 155;
	setAttr ".Neck6Ty" 157;
	setAttr ".Neck7Ty" 159;
	setAttr ".Neck8Ty" 161;
	setAttr ".Neck9Ty" 163;
	setAttr ".LeftUpLegRollTx" 8.9100008010000007;
	setAttr ".LeftUpLegRollTy" 70.997711179999996;
	setAttr ".LeftLegRollTx" 8.9100008010000007;
	setAttr ".LeftLegRollTy" 26.759407039999999;
	setAttr ".RightUpLegRollTx" -8.9100035169999998;
	setAttr ".RightUpLegRollTy" 70.997711179999996;
	setAttr ".RightUpLegRollRx" -0.0011371;
	setAttr ".RightLegRollTx" -8.9100025980000002;
	setAttr ".RightLegRollTy" 26.75940705;
	setAttr ".RightLegRollTz" 0.00043902399999999999;
	setAttr ".LeftArmRollTx" 32.968441489999996;
	setAttr ".LeftArmRollTy" 146.58868419999999;
	setAttr ".LeftForeArmRollTx" 61.340445039999999;
	setAttr ".LeftForeArmRollTy" 146.58868419999999;
	setAttr ".RightArmRollTx" -32.968521590000002;
	setAttr ".RightArmRollTy" 146.58898;
	setAttr ".RightForeArmRollTx" -61.340504160000002;
	setAttr ".RightForeArmRollTy" 146.58898;
	setAttr ".HipsTranslationTy" 100;
	setAttr ".LeftHandThumb1Tx" 76.058620989999994;
	setAttr ".LeftHandThumb1Ty" 145.79018170000001;
	setAttr ".LeftHandThumb1Tz" 4.2824339670000002;
	setAttr ".LeftHandThumb2Tx" 78.571210930000007;
	setAttr ".LeftHandThumb2Ty" 145.25408229999999;
	setAttr ".LeftHandThumb2Tz" 4.9898882909999998;
	setAttr ".LeftHandThumb2Rz" -0.00029786199999999997;
	setAttr ".LeftHandThumb3Tx" 81.114351339999999;
	setAttr ".LeftHandThumb3Ty" 145.25406910000001;
	setAttr ".LeftHandThumb3Tz" 4.989897633;
	setAttr ".LeftHandThumb4Tx" 83.78109748;
	setAttr ".LeftHandThumb4Ty" 145.254072;
	setAttr ".LeftHandThumb4Tz" 4.9898894220000001;
	setAttr ".LeftHandIndex1Tx" 80.531840860000003;
	setAttr ".LeftHandIndex1Ty" 146.7884134;
	setAttr ".LeftHandIndex1Tz" 3.4716694160000001;
	setAttr ".LeftHandIndex1Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex1Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex2Tx" 84.754595460000004;
	setAttr ".LeftHandIndex2Ty" 146.7883913;
	setAttr ".LeftHandIndex2Tz" 3.618868435;
	setAttr ".LeftHandIndex2Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex2Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex3Tx" 87.406920909999997;
	setAttr ".LeftHandIndex3Ty" 146.7883775;
	setAttr ".LeftHandIndex3Tz" 3.711324415;
	setAttr ".LeftHandIndex3Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex3Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex4Tx" 89.363955140000002;
	setAttr ".LeftHandIndex4Ty" 146.7883673;
	setAttr ".LeftHandIndex4Tz" 3.7795433150000002;
	setAttr ".LeftHandIndex4Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex4Rz" -0.00029934100000000001;
	setAttr ".LeftHandMiddle1Tx" 80.519743500000004;
	setAttr ".LeftHandMiddle1Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle1Tz" 1.3046843809999999;
	setAttr ".LeftHandMiddle1Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle2Tx" 85.382995179999995;
	setAttr ".LeftHandMiddle2Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle2Tz" 1.3049868360000001;
	setAttr ".LeftHandMiddle2Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle3Tx" 88.148231789999997;
	setAttr ".LeftHandMiddle3Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle3Tz" 1.305158619;
	setAttr ".LeftHandMiddle3Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle4Tx" 90.153863950000002;
	setAttr ".LeftHandMiddle4Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle4Tz" 1.3052822150000001;
	setAttr ".LeftHandMiddle4Ry" -0.0035633340000000005;
	setAttr ".LeftHandRing1Tx" 80.603623929999998;
	setAttr ".LeftHandRing1Ty" 146.96860380000001;
	setAttr ".LeftHandRing1Tz" -0.79315890899999997;
	setAttr ".LeftHandRing1Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing2Tx" 85.141382759999999;
	setAttr ".LeftHandRing2Ty" 146.96860380000001;
	setAttr ".LeftHandRing2Tz" -0.79315882000000004;
	setAttr ".LeftHandRing2Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing3Tx" 87.445908619999997;
	setAttr ".LeftHandRing3Ty" 146.96860380000001;
	setAttr ".LeftHandRing3Tz" -0.79315893699999995;
	setAttr ".LeftHandRing3Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing4Tx" 89.369255980000005;
	setAttr ".LeftHandRing4Ty" 146.96860380000001;
	setAttr ".LeftHandRing4Tz" -0.79315975400000005;
	setAttr ".LeftHandRing4Ry" -0.0035635290000000002;
	setAttr ".LeftHandPinky1Tx" 80.592138829999996;
	setAttr ".LeftHandPinky1Ty" 146.27565720000001;
	setAttr ".LeftHandPinky1Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky1Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky2Tx" 83.636238160000005;
	setAttr ".LeftHandPinky2Ty" 146.27569779999999;
	setAttr ".LeftHandPinky2Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky2Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky3Tx" 85.610739649999999;
	setAttr ".LeftHandPinky3Ty" 146.27572409999999;
	setAttr ".LeftHandPinky3Tz" -2.4903566079999999;
	setAttr ".LeftHandPinky3Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky4Tx" 87.277354299999999;
	setAttr ".LeftHandPinky4Ty" 146.27574630000001;
	setAttr ".LeftHandPinky4Tz" -2.4903558170000002;
	setAttr ".LeftHandPinky4Rz" 0.00076302599999999998;
	setAttr ".LeftHandExtraFinger1Tx" 80.592138829999996;
	setAttr ".LeftHandExtraFinger1Ty" 146.7884134;
	setAttr ".LeftHandExtraFinger1Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger1Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger1Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger2Tx" 82.636238160000005;
	setAttr ".LeftHandExtraFinger2Ty" 146.7883913;
	setAttr ".LeftHandExtraFinger2Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger2Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger2Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger3Tx" 84.610739649999999;
	setAttr ".LeftHandExtraFinger3Ty" 146.7883775;
	setAttr ".LeftHandExtraFinger3Tz" -4.4903566079999999;
	setAttr ".LeftHandExtraFinger3Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger3Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger4Tx" 86.277354299999999;
	setAttr ".LeftHandExtraFinger4Ty" 146.7883673;
	setAttr ".LeftHandExtraFinger4Tz" -4.4903558170000002;
	setAttr ".LeftHandExtraFinger4Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger4Rz" -0.00029934100000000001;
	setAttr ".RightHandThumb1Tx" -76.058242059999998;
	setAttr ".RightHandThumb1Ty" 145.7904806;
	setAttr ".RightHandThumb1Tz" 4.2828147379999999;
	setAttr ".RightHandThumb2Tx" -78.570769569999996;
	setAttr ".RightHandThumb2Ty" 145.25438170000001;
	setAttr ".RightHandThumb2Tz" 4.9904913879999997;
	setAttr ".RightHandThumb2Rz" -0.00060208600000000005;
	setAttr ".RightHandThumb3Tx" -81.112358929999999;
	setAttr ".RightHandThumb3Ty" 145.25440850000001;
	setAttr ".RightHandThumb3Tz" 5.0793117030000001;
	setAttr ".RightHandThumb3Rz" -0.00039149399999999999;
	setAttr ".RightHandThumb4Tx" -83.777478689999995;
	setAttr ".RightHandThumb4Ty" 145.2544268;
	setAttr ".RightHandThumb4Tz" 5.1724490200000002;
	setAttr ".RightHandThumb4Rz" -0.00039149399999999999;
	setAttr ".RightHandIndex1Tx" -80.531533929999995;
	setAttr ".RightHandIndex1Ty" 146.78871240000001;
	setAttr ".RightHandIndex1Tz" 3.4724442959999999;
	setAttr ".RightHandIndex1Ry" -2.0000646579999999;
	setAttr ".RightHandIndex2Tx" -84.754284150000004;
	setAttr ".RightHandIndex2Ty" 146.7887121;
	setAttr ".RightHandIndex2Tz" 3.325092508;
	setAttr ".RightHandIndex2Ry" -2.0000646359999998;
	setAttr ".RightHandIndex3Tx" -87.406606949999997;
	setAttr ".RightHandIndex3Ty" 146.78871179999999;
	setAttr ".RightHandIndex3Tz" 3.2325403669999999;
	setAttr ".RightHandIndex3Ry" -2.0000646359999998;
	setAttr ".RightHandIndex4Tx" -89.363639169999999;
	setAttr ".RightHandIndex4Ty" 146.78871169999999;
	setAttr ".RightHandIndex4Tz" 3.164250215;
	setAttr ".RightHandIndex4Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle1Tx" -80.519627299999996;
	setAttr ".RightHandMiddle1Ty" 147.0898718;
	setAttr ".RightHandMiddle1Tz" 1.305458427;
	setAttr ".RightHandMiddle1Ry" -2.0000646579999999;
	setAttr ".RightHandMiddle2Tx" -85.379921789999997;
	setAttr ".RightHandMiddle2Ty" 147.08987139999999;
	setAttr ".RightHandMiddle2Tz" 1.1358596750000001;
	setAttr ".RightHandMiddle2Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle3Tx" -88.143476890000002;
	setAttr ".RightHandMiddle3Ty" 147.0898712;
	setAttr ".RightHandMiddle3Tz" 1.039426113;
	setAttr ".RightHandMiddle3Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle4Tx" -90.147889570000004;
	setAttr ".RightHandMiddle4Ty" 147.089871;
	setAttr ".RightHandMiddle4Tz" 0.96948263800000001;
	setAttr ".RightHandMiddle4Ry" -2.0000646359999998;
	setAttr ".RightHandRing1Tx" -80.603693699999994;
	setAttr ".RightHandRing1Ty" 146.968899;
	setAttr ".RightHandRing1Tz" -0.79237675600000002;
	setAttr ".RightHandRing1Ry" -2.0000646579999999;
	setAttr ".RightHandRing2Tx" -85.138693309999994;
	setAttr ".RightHandRing2Ty" 146.96889859999999;
	setAttr ".RightHandRing2Tz" -0.95062442800000002;
	setAttr ".RightHandRing2Ry" -2.0000646359999998;
	setAttr ".RightHandRing3Tx" -87.441817880000002;
	setAttr ".RightHandRing3Ty" 146.9688984;
	setAttr ".RightHandRing3Tz" -1.0309913799999999;
	setAttr ".RightHandRing3Ry" -2.0000646359999998;
	setAttr ".RightHandRing4Tx" -89.363995799999998;
	setAttr ".RightHandRing4Ty" 146.96889830000001;
	setAttr ".RightHandRing4Tz" -1.0980652959999999;
	setAttr ".RightHandRing4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky1Tx" -80.592357370000002;
	setAttr ".RightHandPinky1Ty" 146.2759509;
	setAttr ".RightHandPinky1Tz" -2.4895741939999998;
	setAttr ".RightHandPinky1Ry" -2.0000646579999999;
	setAttr ".RightHandPinky1Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky2Tx" -83.638299989999993;
	setAttr ".RightHandPinky2Ty" 146.27588489999999;
	setAttr ".RightHandPinky2Tz" -2.5958615950000001;
	setAttr ".RightHandPinky2Ry" -2.0000646359999998;
	setAttr ".RightHandPinky2Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky3Tx" -85.613997130000001;
	setAttr ".RightHandPinky3Ty" 146.27584210000001;
	setAttr ".RightHandPinky3Tz" -2.6648030450000002;
	setAttr ".RightHandPinky3Ry" -2.0000646359999998;
	setAttr ".RightHandPinky3Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky4Tx" -87.28162098;
	setAttr ".RightHandPinky4Ty" 146.27580589999999;
	setAttr ".RightHandPinky4Tz" -2.7229943639999998;
	setAttr ".RightHandPinky4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky4Rz" 0.0012412149999999999;
	setAttr ".RightHandExtraFinger1Tx" -80.592357370000002;
	setAttr ".RightHandExtraFinger1Ty" 146.78871240000001;
	setAttr ".RightHandExtraFinger1Tz" -4.4895741940000002;
	setAttr ".RightHandExtraFinger1Ry" -2.0000646579999999;
	setAttr ".RightHandExtraFinger2Tx" -82.638299989999993;
	setAttr ".RightHandExtraFinger2Ty" 146.7887121;
	setAttr ".RightHandExtraFinger2Tz" -4.5958615949999997;
	setAttr ".RightHandExtraFinger2Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger3Tx" -84.613997130000001;
	setAttr ".RightHandExtraFinger3Ty" 146.78871179999999;
	setAttr ".RightHandExtraFinger3Tz" -4.6648030450000002;
	setAttr ".RightHandExtraFinger3Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger4Tx" -86.28162098;
	setAttr ".RightHandExtraFinger4Ty" 146.78871169999999;
	setAttr ".RightHandExtraFinger4Tz" -4.7229943639999998;
	setAttr ".RightHandExtraFinger4Ry" -2.0000646359999998;
	setAttr ".LeftFootThumb1Tx" 6.18422217;
	setAttr ".LeftFootThumb1Ty" 4.9992492679999998;
	setAttr ".LeftFootThumb1Tz" 1.930123209;
	setAttr ".LeftFootThumb2Tx" 4.551409713;
	setAttr ".LeftFootThumb2Ty" 2.6643834059999998;
	setAttr ".LeftFootThumb2Tz" 3.591937658;
	setAttr ".LeftFootThumb3Tx" 3.4619466889999999;
	setAttr ".LeftFootThumb3Ty" 1.8880788850000001;
	setAttr ".LeftFootThumb3Tz" 6.4001420700000002;
	setAttr ".LeftFootThumb4Tx" 3.4619466999999999;
	setAttr ".LeftFootThumb4Ty" 1.8880788550000001;
	setAttr ".LeftFootThumb4Tz" 9.6971958839999992;
	setAttr ".LeftFootIndex1Tx" 7.1105199680000002;
	setAttr ".LeftFootIndex1Ty" 1.888079117;
	setAttr ".LeftFootIndex1Tz" 12.9547209;
	setAttr ".LeftFootIndex2Tx" 7.1105199749999999;
	setAttr ".LeftFootIndex2Ty" 1.8880790999999999;
	setAttr ".LeftFootIndex2Tz" 14.82972745;
	setAttr ".LeftFootIndex3Tx" 7.1105199810000004;
	setAttr ".LeftFootIndex3Ty" 1.888079083;
	setAttr ".LeftFootIndex3Tz" 16.76314442;
	setAttr ".LeftFootIndex4Tx" 7.1105199880000001;
	setAttr ".LeftFootIndex4Ty" 1.8880790649999999;
	setAttr ".LeftFootIndex4Tz" 18.850666449999999;
	setAttr ".LeftFootMiddle1Tx" 8.9167242489999996;
	setAttr ".LeftFootMiddle1Ty" 1.888079163;
	setAttr ".LeftFootMiddle1Tz" 12.9547209;
	setAttr ".LeftFootMiddle2Tx" 8.9167242550000001;
	setAttr ".LeftFootMiddle2Ty" 1.888079147;
	setAttr ".LeftFootMiddle2Tz" 14.82860045;
	setAttr ".LeftFootMiddle3Tx" 8.9167242610000006;
	setAttr ".LeftFootMiddle3Ty" 1.888079131;
	setAttr ".LeftFootMiddle3Tz" 16.64971237;
	setAttr ".LeftFootMiddle4Tx" 8.9167242669999993;
	setAttr ".LeftFootMiddle4Ty" 1.8880791139999999;
	setAttr ".LeftFootMiddle4Tz" 18.565581959999999;
	setAttr ".LeftFootRing1Tx" 10.723903740000001;
	setAttr ".LeftFootRing1Ty" 1.888079211;
	setAttr ".LeftFootRing1Tz" 12.9547209;
	setAttr ".LeftFootRing2Tx" 10.723903740000001;
	setAttr ".LeftFootRing2Ty" 1.888079195;
	setAttr ".LeftFootRing2Tz" 14.71345226;
	setAttr ".LeftFootRing3Tx" 10.72390375;
	setAttr ".LeftFootRing3Ty" 1.8880791800000001;
	setAttr ".LeftFootRing3Tz" 16.472174209999999;
	setAttr ".LeftFootRing4Tx" 10.723903760000001;
	setAttr ".LeftFootRing4Ty" 1.8880791640000001;
	setAttr ".LeftFootRing4Tz" 18.27484922;
	setAttr ".LeftFootPinky1Tx" 12.52979668;
	setAttr ".LeftFootPinky1Ty" 1.888079257;
	setAttr ".LeftFootPinky1Tz" 12.9547209;
	setAttr ".LeftFootPinky2Tx" 12.52979669;
	setAttr ".LeftFootPinky2Ty" 1.8880792420000001;
	setAttr ".LeftFootPinky2Tz" 14.5796458;
	setAttr ".LeftFootPinky3Tx" 12.52979669;
	setAttr ".LeftFootPinky3Ty" 1.8880792289999999;
	setAttr ".LeftFootPinky3Tz" 16.143599309999999;
	setAttr ".LeftFootPinky4Tx" 12.5297967;
	setAttr ".LeftFootPinky4Ty" 1.8880792129999999;
	setAttr ".LeftFootPinky4Tz" 17.861196199999998;
	setAttr ".LeftFootExtraFinger1Tx" 5.0860939849999998;
	setAttr ".LeftFootExtraFinger1Ty" 1.888079254;
	setAttr ".LeftFootExtraFinger1Tz" 12.9547209;
	setAttr ".LeftFootExtraFinger2Tx" 5.0860939910000003;
	setAttr ".LeftFootExtraFinger2Ty" 1.888079236;
	setAttr ".LeftFootExtraFinger2Tz" 14.94401483;
	setAttr ".LeftFootExtraFinger3Tx" 5.0860939979999999;
	setAttr ".LeftFootExtraFinger3Ty" 1.8880792179999999;
	setAttr ".LeftFootExtraFinger3Tz" 16.99182682;
	setAttr ".LeftFootExtraFinger4Tx" 5.0860940049999996;
	setAttr ".LeftFootExtraFinger4Ty" 1.8880791990000001;
	setAttr ".LeftFootExtraFinger4Tz" 19.0793827;
	setAttr ".RightFootThumb1Tx" -6.180000014;
	setAttr ".RightFootThumb1Ty" 4.9992496019999999;
	setAttr ".RightFootThumb1Tz" 1.930123112;
	setAttr ".RightFootThumb2Tx" -4.5499999820000001;
	setAttr ".RightFootThumb2Ty" 2.6643838419999999;
	setAttr ".RightFootThumb2Tz" 3.5919375690000002;
	setAttr ".RightFootThumb3Tx" -3.4599999860000001;
	setAttr ".RightFootThumb3Ty" 1.888079335;
	setAttr ".RightFootThumb3Tz" 6.4001419850000003;
	setAttr ".RightFootThumb4Tx" -3.4599999860000001;
	setAttr ".RightFootThumb4Ty" 1.8880793090000001;
	setAttr ".RightFootThumb4Tz" 9.6971957989999993;
	setAttr ".RightFootIndex1Tx" -7.1099999839999999;
	setAttr ".RightFootIndex1Ty" 1.888079262;
	setAttr ".RightFootIndex1Tz" 12.95472064;
	setAttr ".RightFootIndex2Tx" -7.1099999839999999;
	setAttr ".RightFootIndex2Ty" 1.8880792479999999;
	setAttr ".RightFootIndex2Tz" 14.82972719;
	setAttr ".RightFootIndex3Tx" -7.1099999839999999;
	setAttr ".RightFootIndex3Ty" 1.8880792340000001;
	setAttr ".RightFootIndex3Tz" 16.76314416;
	setAttr ".RightFootIndex4Tx" -7.1099999839999999;
	setAttr ".RightFootIndex4Ty" 1.8880792179999999;
	setAttr ".RightFootIndex4Tz" 18.850666189999998;
	setAttr ".RightFootMiddle1Tx" -8.92;
	setAttr ".RightFootMiddle1Ty" 1.8880792049999999;
	setAttr ".RightFootMiddle1Tz" 12.954720630000001;
	setAttr ".RightFootMiddle2Tx" -8.92;
	setAttr ".RightFootMiddle2Ty" 1.8880791910000001;
	setAttr ".RightFootMiddle2Tz" 14.82860018;
	setAttr ".RightFootMiddle3Tx" -8.92;
	setAttr ".RightFootMiddle3Ty" 1.8880791770000001;
	setAttr ".RightFootMiddle3Tz" 16.649712099999999;
	setAttr ".RightFootMiddle4Tx" -8.92;
	setAttr ".RightFootMiddle4Ty" 1.8880791619999999;
	setAttr ".RightFootMiddle4Tz" 18.565581689999998;
	setAttr ".RightFootRing1Tx" -10.72;
	setAttr ".RightFootRing1Ty" 1.8880791610000001;
	setAttr ".RightFootRing1Tz" 12.95472062;
	setAttr ".RightFootRing2Tx" -10.72;
	setAttr ".RightFootRing2Ty" 1.888079147;
	setAttr ".RightFootRing2Tz" 14.713451989999999;
	setAttr ".RightFootRing3Tx" -10.72;
	setAttr ".RightFootRing3Ty" 1.888079134;
	setAttr ".RightFootRing3Tz" 16.472173940000001;
	setAttr ".RightFootRing4Tx" -10.72;
	setAttr ".RightFootRing4Ty" 1.88807912;
	setAttr ".RightFootRing4Tz" 18.274848949999999;
	setAttr ".RightFootPinky1Tx" -12.530000060000001;
	setAttr ".RightFootPinky1Ty" 1.8880791029999999;
	setAttr ".RightFootPinky1Tz" 12.95472062;
	setAttr ".RightFootPinky2Tx" -12.530000060000001;
	setAttr ".RightFootPinky2Ty" 1.888079091;
	setAttr ".RightFootPinky2Tz" 14.57964552;
	setAttr ".RightFootPinky3Tx" -12.530000060000001;
	setAttr ".RightFootPinky3Ty" 1.8880790789999999;
	setAttr ".RightFootPinky3Tz" 16.143599040000002;
	setAttr ".RightFootPinky4Tx" -12.530000060000001;
	setAttr ".RightFootPinky4Ty" 1.888079066;
	setAttr ".RightFootPinky4Tz" 17.86119592;
	setAttr ".RightFootExtraFinger1Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger1Ty" 1.8880791260000001;
	setAttr ".RightFootExtraFinger1Tz" 12.95472064;
	setAttr ".RightFootExtraFinger2Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger2Ty" 1.8880791109999999;
	setAttr ".RightFootExtraFinger2Tz" 14.944014579999999;
	setAttr ".RightFootExtraFinger3Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger3Ty" 1.888079096;
	setAttr ".RightFootExtraFinger3Tz" 16.99182656;
	setAttr ".RightFootExtraFinger4Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger4Ty" 1.88807908;
	setAttr ".RightFootExtraFinger4Tz" 19.079382450000001;
	setAttr ".LeftInHandThumbTx" 71.709864199999998;
	setAttr ".LeftInHandThumbTy" 146.58868419999999;
	setAttr ".LeftInHandIndexTx" 71.709864199999998;
	setAttr ".LeftInHandIndexTy" 146.58868419999999;
	setAttr ".LeftInHandMiddleTx" 71.709864199999998;
	setAttr ".LeftInHandMiddleTy" 146.58868419999999;
	setAttr ".LeftInHandRingTx" 71.709864199999998;
	setAttr ".LeftInHandRingTy" 146.58868419999999;
	setAttr ".LeftInHandPinkyTx" 71.709864199999998;
	setAttr ".LeftInHandPinkyTy" 146.58868419999999;
	setAttr ".LeftInHandExtraFingerTx" 71.709864199999998;
	setAttr ".LeftInHandExtraFingerTy" 146.58868419999999;
	setAttr ".RightInHandThumbTx" -71.709861489999994;
	setAttr ".RightInHandThumbTy" 146.58897870000001;
	setAttr ".RightInHandIndexTx" -71.709861489999994;
	setAttr ".RightInHandIndexTy" 146.58897870000001;
	setAttr ".RightInHandMiddleTx" -71.709861489999994;
	setAttr ".RightInHandMiddleTy" 146.58897870000001;
	setAttr ".RightInHandRingTx" -71.709861489999994;
	setAttr ".RightInHandRingTy" 146.58897870000001;
	setAttr ".RightInHandPinkyTx" -71.709861489999994;
	setAttr ".RightInHandPinkyTy" 146.58897870000001;
	setAttr ".RightInHandExtraFingerTx" -71.709861489999994;
	setAttr ".RightInHandExtraFingerTy" 146.58897870000001;
	setAttr ".LeftInFootThumbTx" 8.9100008010000007;
	setAttr ".LeftInFootThumbTy" 8.15039625;
	setAttr ".LeftInFootIndexTx" 8.9100008010000007;
	setAttr ".LeftInFootIndexTy" 8.1503963469999992;
	setAttr ".LeftInFootMiddleTx" 8.9100008010000007;
	setAttr ".LeftInFootMiddleTy" 8.1503963469999992;
	setAttr ".LeftInFootRingTx" 8.9100008010000007;
	setAttr ".LeftInFootRingTy" 8.1503963469999992;
	setAttr ".LeftInFootPinkyTx" 8.9100008010000007;
	setAttr ".LeftInFootPinkyTy" 8.1503963469999992;
	setAttr ".LeftInFootExtraFingerTx" 8.9100008010000007;
	setAttr ".LeftInFootExtraFingerTy" 8.1503963469999992;
	setAttr ".RightInFootThumbTx" -8.9100025980000002;
	setAttr ".RightInFootThumbTy" 8.1503963929999994;
	setAttr ".RightInFootThumbTz" 0.00043882099999999999;
	setAttr ".RightInFootIndexTx" -8.9100026190000001;
	setAttr ".RightInFootIndexTy" 8.1503963939999995;
	setAttr ".RightInFootIndexTz" 0.00043882099999999999;
	setAttr ".RightInFootMiddleTx" -8.9100026190000001;
	setAttr ".RightInFootMiddleTy" 8.1503963939999995;
	setAttr ".RightInFootMiddleTz" 0.00043882099999999999;
	setAttr ".RightInFootRingTx" -8.9100026190000001;
	setAttr ".RightInFootRingTy" 8.1503963939999995;
	setAttr ".RightInFootRingTz" 0.00043882099999999999;
	setAttr ".RightInFootPinkyTx" -8.9100026190000001;
	setAttr ".RightInFootPinkyTy" 8.1503963939999995;
	setAttr ".RightInFootPinkyTz" 0.00043882099999999999;
	setAttr ".RightInFootExtraFingerTx" -8.9100026190000001;
	setAttr ".RightInFootExtraFingerTy" 8.1503963939999995;
	setAttr ".RightInFootExtraFingerTz" 0.00043882099999999999;
	setAttr ".LeftShoulderExtraTx" 12.353625535000001;
	setAttr ".LeftShoulderExtraTy" 146.58868419999999;
	setAttr ".RightShoulderExtraTx" -12.353637216499999;
	setAttr ".RightShoulderExtraTy" 146.58898;
createNode hyperGraphInfo -n "nodeEditorPanel2Info3";
createNode hyperView -n "hyperView4";
	setAttr ".vl" -type "double2" -329.08596316797485 -43018.745359349661 ;
	setAttr ".vh" -type "double2" 904.52748221017634 -42280.089897164791 ;
	setAttr ".dag" no;
createNode lambert -n "LeftProxy1";
	setAttr ".c" -type "float3" 0.43439499 0.815 0.44162649 ;
createNode shadingEngine -n "LeftProxySG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
createNode lambert -n "RightProxy1";
	setAttr ".c" -type "float3" 0.54777408 0.49995402 0.93800002 ;
createNode shadingEngine -n "RightProxySG1";
	setAttr ".ihi" 0;
	setAttr -s 15 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
createNode lambert -n "CentreProxy1";
	setAttr ".c" -type "float3" 0.48751998 0.67741489 0.88 ;
createNode shadingEngine -n "CentreProxySG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo6";
createNode HIKSkeletonGeneratorNode -n "HIKSkeletonGeneratorNode5";
	setAttr ".ihi" 0;
	setAttr ".WantIndexFinger" yes;
	setAttr ".WantMiddleFinger" yes;
	setAttr ".WantRingFinger" yes;
	setAttr ".WantPinkyFinger" yes;
	setAttr ".WantThumb" yes;
	setAttr ".WantToeBase" yes;
	setAttr ".HipsTy" 100;
	setAttr ".LeftUpLegTx" 8.9100008010000007;
	setAttr ".LeftUpLegTy" 93.729999539999994;
	setAttr ".LeftLegTx" 8.9100008010000007;
	setAttr ".LeftLegTy" 48.851354600000001;
	setAttr ".LeftFootTx" 8.9100008010000007;
	setAttr ".LeftFootTy" 8.1503963469999992;
	setAttr ".RightUpLegTx" -8.9100008010000007;
	setAttr ".RightUpLegTy" 93.729999539999994;
	setAttr ".RightLegTx" -8.9100035169999998;
	setAttr ".RightLegTy" 48.851354600000001;
	setAttr ".RightLegTz" 0.00043902399999999999;
	setAttr ".RightFootTx" -8.9100025980000002;
	setAttr ".RightFootTy" 8.1503963509999995;
	setAttr ".RightFootTz" 0.00043902399999999999;
	setAttr ".RightFootRy" -0.0048003860000000002;
	setAttr ".SpineTy" 107;
	setAttr ".LeftArmTx" 17.707251070000002;
	setAttr ".LeftArmTy" 146.58868419999999;
	setAttr ".LeftForeArmTx" 45.012716769999997;
	setAttr ".LeftForeArmTy" 146.58868419999999;
	setAttr ".LeftHandTx" 71.709864139999993;
	setAttr ".LeftHandTy" 146.58868419999999;
	setAttr ".RightArmTx" -17.707274909999999;
	setAttr ".RightArmTy" 146.58898;
	setAttr ".RightForeArmTx" -45.012873159999998;
	setAttr ".RightForeArmTy" 146.58898;
	setAttr ".RightHandTx" -71.709861270000005;
	setAttr ".RightHandTy" 146.58897870000001;
	setAttr ".HeadTy" 165;
	setAttr ".LeftToeBaseTx" 8.9100092279999998;
	setAttr ".LeftToeBaseTy" 1.8880791539999999;
	setAttr ".LeftToeBaseTz" 12.9547209;
	setAttr ".RightToeBaseTx" -8.9110879789999995;
	setAttr ".RightToeBaseTy" 1.888079171;
	setAttr ".RightToeBaseTz" 12.95518809;
	setAttr ".RightToeBaseRx" 0.0029125930000000002;
	setAttr ".RightToeBaseRy" -0.0048003860000000002;
	setAttr ".LeftShoulderTx" 7.0000004770000004;
	setAttr ".LeftShoulderTy" 146.58854679999999;
	setAttr ".LeftShoulderRz" 0.00073528199999999997;
	setAttr ".RightShoulderTx" -6.9999995229999996;
	setAttr ".RightShoulderTy" 146.58854679999999;
	setAttr ".RightShoulderRz" -0.0023183610000000001;
	setAttr ".NeckTy" 145;
	setAttr ".LeftFingerBaseTx" 80.519743439999999;
	setAttr ".LeftFingerBaseTy" 147.08957459999999;
	setAttr ".LeftFingerBaseTz" 1.304684401;
	setAttr ".LeftFingerBaseRy" -0.0035633340000000005;
	setAttr ".RightFingerBaseTx" -80.519626680000002;
	setAttr ".RightFingerBaseTy" 147.0898718;
	setAttr ".RightFingerBaseTz" 1.305458317;
	setAttr ".RightFingerBaseRy" -2.0000646359999998;
	setAttr ".Spine1Ty" 111;
	setAttr ".Spine2Ty" 115;
	setAttr ".Spine3Ty" 119;
	setAttr ".Spine4Ty" 123;
	setAttr ".Spine5Ty" 127;
	setAttr ".Spine6Ty" 131;
	setAttr ".Spine7Ty" 135;
	setAttr ".Spine8Ty" 139;
	setAttr ".Spine9Ty" 143;
	setAttr ".Neck1Ty" 147;
	setAttr ".Neck2Ty" 149;
	setAttr ".Neck3Ty" 151;
	setAttr ".Neck4Ty" 153;
	setAttr ".Neck5Ty" 155;
	setAttr ".Neck6Ty" 157;
	setAttr ".Neck7Ty" 159;
	setAttr ".Neck8Ty" 161;
	setAttr ".Neck9Ty" 163;
	setAttr ".LeftUpLegRollTx" 8.9100008010000007;
	setAttr ".LeftUpLegRollTy" 70.997711179999996;
	setAttr ".LeftLegRollTx" 8.9100008010000007;
	setAttr ".LeftLegRollTy" 26.759407039999999;
	setAttr ".RightUpLegRollTx" -8.9100035169999998;
	setAttr ".RightUpLegRollTy" 70.997711179999996;
	setAttr ".RightUpLegRollRx" -0.0011371;
	setAttr ".RightLegRollTx" -8.9100025980000002;
	setAttr ".RightLegRollTy" 26.75940705;
	setAttr ".RightLegRollTz" 0.00043902399999999999;
	setAttr ".LeftArmRollTx" 32.968441489999996;
	setAttr ".LeftArmRollTy" 146.58868419999999;
	setAttr ".LeftForeArmRollTx" 61.340445039999999;
	setAttr ".LeftForeArmRollTy" 146.58868419999999;
	setAttr ".RightArmRollTx" -32.968521590000002;
	setAttr ".RightArmRollTy" 146.58898;
	setAttr ".RightForeArmRollTx" -61.340504160000002;
	setAttr ".RightForeArmRollTy" 146.58898;
	setAttr ".HipsTranslationTy" 100;
	setAttr ".LeftHandThumb1Tx" 76.058620989999994;
	setAttr ".LeftHandThumb1Ty" 145.79018170000001;
	setAttr ".LeftHandThumb1Tz" 4.2824339670000002;
	setAttr ".LeftHandThumb2Tx" 78.571210930000007;
	setAttr ".LeftHandThumb2Ty" 145.25408229999999;
	setAttr ".LeftHandThumb2Tz" 4.9898882909999998;
	setAttr ".LeftHandThumb2Rz" -0.00029786199999999997;
	setAttr ".LeftHandThumb3Tx" 81.114351339999999;
	setAttr ".LeftHandThumb3Ty" 145.25406910000001;
	setAttr ".LeftHandThumb3Tz" 4.989897633;
	setAttr ".LeftHandThumb4Tx" 83.78109748;
	setAttr ".LeftHandThumb4Ty" 145.254072;
	setAttr ".LeftHandThumb4Tz" 4.9898894220000001;
	setAttr ".LeftHandIndex1Tx" 80.531840860000003;
	setAttr ".LeftHandIndex1Ty" 146.7884134;
	setAttr ".LeftHandIndex1Tz" 3.4716694160000001;
	setAttr ".LeftHandIndex1Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex1Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex2Tx" 84.754595460000004;
	setAttr ".LeftHandIndex2Ty" 146.7883913;
	setAttr ".LeftHandIndex2Tz" 3.618868435;
	setAttr ".LeftHandIndex2Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex2Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex3Tx" 87.406920909999997;
	setAttr ".LeftHandIndex3Ty" 146.7883775;
	setAttr ".LeftHandIndex3Tz" 3.711324415;
	setAttr ".LeftHandIndex3Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex3Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex4Tx" 89.363955140000002;
	setAttr ".LeftHandIndex4Ty" 146.7883673;
	setAttr ".LeftHandIndex4Tz" 3.7795433150000002;
	setAttr ".LeftHandIndex4Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex4Rz" -0.00029934100000000001;
	setAttr ".LeftHandMiddle1Tx" 80.519743500000004;
	setAttr ".LeftHandMiddle1Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle1Tz" 1.3046843809999999;
	setAttr ".LeftHandMiddle1Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle2Tx" 85.382995179999995;
	setAttr ".LeftHandMiddle2Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle2Tz" 1.3049868360000001;
	setAttr ".LeftHandMiddle2Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle3Tx" 88.148231789999997;
	setAttr ".LeftHandMiddle3Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle3Tz" 1.305158619;
	setAttr ".LeftHandMiddle3Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle4Tx" 90.153863950000002;
	setAttr ".LeftHandMiddle4Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle4Tz" 1.3052822150000001;
	setAttr ".LeftHandMiddle4Ry" -0.0035633340000000005;
	setAttr ".LeftHandRing1Tx" 80.603623929999998;
	setAttr ".LeftHandRing1Ty" 146.96860380000001;
	setAttr ".LeftHandRing1Tz" -0.79315890899999997;
	setAttr ".LeftHandRing1Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing2Tx" 85.141382759999999;
	setAttr ".LeftHandRing2Ty" 146.96860380000001;
	setAttr ".LeftHandRing2Tz" -0.79315882000000004;
	setAttr ".LeftHandRing2Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing3Tx" 87.445908619999997;
	setAttr ".LeftHandRing3Ty" 146.96860380000001;
	setAttr ".LeftHandRing3Tz" -0.79315893699999995;
	setAttr ".LeftHandRing3Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing4Tx" 89.369255980000005;
	setAttr ".LeftHandRing4Ty" 146.96860380000001;
	setAttr ".LeftHandRing4Tz" -0.79315975400000005;
	setAttr ".LeftHandRing4Ry" -0.0035635290000000002;
	setAttr ".LeftHandPinky1Tx" 80.592138829999996;
	setAttr ".LeftHandPinky1Ty" 146.27565720000001;
	setAttr ".LeftHandPinky1Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky1Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky2Tx" 83.636238160000005;
	setAttr ".LeftHandPinky2Ty" 146.27569779999999;
	setAttr ".LeftHandPinky2Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky2Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky3Tx" 85.610739649999999;
	setAttr ".LeftHandPinky3Ty" 146.27572409999999;
	setAttr ".LeftHandPinky3Tz" -2.4903566079999999;
	setAttr ".LeftHandPinky3Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky4Tx" 87.277354299999999;
	setAttr ".LeftHandPinky4Ty" 146.27574630000001;
	setAttr ".LeftHandPinky4Tz" -2.4903558170000002;
	setAttr ".LeftHandPinky4Rz" 0.00076302599999999998;
	setAttr ".LeftHandExtraFinger1Tx" 80.592138829999996;
	setAttr ".LeftHandExtraFinger1Ty" 146.7884134;
	setAttr ".LeftHandExtraFinger1Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger1Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger1Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger2Tx" 82.636238160000005;
	setAttr ".LeftHandExtraFinger2Ty" 146.7883913;
	setAttr ".LeftHandExtraFinger2Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger2Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger2Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger3Tx" 84.610739649999999;
	setAttr ".LeftHandExtraFinger3Ty" 146.7883775;
	setAttr ".LeftHandExtraFinger3Tz" -4.4903566079999999;
	setAttr ".LeftHandExtraFinger3Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger3Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger4Tx" 86.277354299999999;
	setAttr ".LeftHandExtraFinger4Ty" 146.7883673;
	setAttr ".LeftHandExtraFinger4Tz" -4.4903558170000002;
	setAttr ".LeftHandExtraFinger4Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger4Rz" -0.00029934100000000001;
	setAttr ".RightHandThumb1Tx" -76.058242059999998;
	setAttr ".RightHandThumb1Ty" 145.7904806;
	setAttr ".RightHandThumb1Tz" 4.2828147379999999;
	setAttr ".RightHandThumb2Tx" -78.570769569999996;
	setAttr ".RightHandThumb2Ty" 145.25438170000001;
	setAttr ".RightHandThumb2Tz" 4.9904913879999997;
	setAttr ".RightHandThumb2Rz" -0.00060208600000000005;
	setAttr ".RightHandThumb3Tx" -81.112358929999999;
	setAttr ".RightHandThumb3Ty" 145.25440850000001;
	setAttr ".RightHandThumb3Tz" 5.0793117030000001;
	setAttr ".RightHandThumb3Rz" -0.00039149399999999999;
	setAttr ".RightHandThumb4Tx" -83.777478689999995;
	setAttr ".RightHandThumb4Ty" 145.2544268;
	setAttr ".RightHandThumb4Tz" 5.1724490200000002;
	setAttr ".RightHandThumb4Rz" -0.00039149399999999999;
	setAttr ".RightHandIndex1Tx" -80.531533929999995;
	setAttr ".RightHandIndex1Ty" 146.78871240000001;
	setAttr ".RightHandIndex1Tz" 3.4724442959999999;
	setAttr ".RightHandIndex1Ry" -2.0000646579999999;
	setAttr ".RightHandIndex2Tx" -84.754284150000004;
	setAttr ".RightHandIndex2Ty" 146.7887121;
	setAttr ".RightHandIndex2Tz" 3.325092508;
	setAttr ".RightHandIndex2Ry" -2.0000646359999998;
	setAttr ".RightHandIndex3Tx" -87.406606949999997;
	setAttr ".RightHandIndex3Ty" 146.78871179999999;
	setAttr ".RightHandIndex3Tz" 3.2325403669999999;
	setAttr ".RightHandIndex3Ry" -2.0000646359999998;
	setAttr ".RightHandIndex4Tx" -89.363639169999999;
	setAttr ".RightHandIndex4Ty" 146.78871169999999;
	setAttr ".RightHandIndex4Tz" 3.164250215;
	setAttr ".RightHandIndex4Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle1Tx" -80.519627299999996;
	setAttr ".RightHandMiddle1Ty" 147.0898718;
	setAttr ".RightHandMiddle1Tz" 1.305458427;
	setAttr ".RightHandMiddle1Ry" -2.0000646579999999;
	setAttr ".RightHandMiddle2Tx" -85.379921789999997;
	setAttr ".RightHandMiddle2Ty" 147.08987139999999;
	setAttr ".RightHandMiddle2Tz" 1.1358596750000001;
	setAttr ".RightHandMiddle2Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle3Tx" -88.143476890000002;
	setAttr ".RightHandMiddle3Ty" 147.0898712;
	setAttr ".RightHandMiddle3Tz" 1.039426113;
	setAttr ".RightHandMiddle3Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle4Tx" -90.147889570000004;
	setAttr ".RightHandMiddle4Ty" 147.089871;
	setAttr ".RightHandMiddle4Tz" 0.96948263800000001;
	setAttr ".RightHandMiddle4Ry" -2.0000646359999998;
	setAttr ".RightHandRing1Tx" -80.603693699999994;
	setAttr ".RightHandRing1Ty" 146.968899;
	setAttr ".RightHandRing1Tz" -0.79237675600000002;
	setAttr ".RightHandRing1Ry" -2.0000646579999999;
	setAttr ".RightHandRing2Tx" -85.138693309999994;
	setAttr ".RightHandRing2Ty" 146.96889859999999;
	setAttr ".RightHandRing2Tz" -0.95062442800000002;
	setAttr ".RightHandRing2Ry" -2.0000646359999998;
	setAttr ".RightHandRing3Tx" -87.441817880000002;
	setAttr ".RightHandRing3Ty" 146.9688984;
	setAttr ".RightHandRing3Tz" -1.0309913799999999;
	setAttr ".RightHandRing3Ry" -2.0000646359999998;
	setAttr ".RightHandRing4Tx" -89.363995799999998;
	setAttr ".RightHandRing4Ty" 146.96889830000001;
	setAttr ".RightHandRing4Tz" -1.0980652959999999;
	setAttr ".RightHandRing4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky1Tx" -80.592357370000002;
	setAttr ".RightHandPinky1Ty" 146.2759509;
	setAttr ".RightHandPinky1Tz" -2.4895741939999998;
	setAttr ".RightHandPinky1Ry" -2.0000646579999999;
	setAttr ".RightHandPinky1Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky2Tx" -83.638299989999993;
	setAttr ".RightHandPinky2Ty" 146.27588489999999;
	setAttr ".RightHandPinky2Tz" -2.5958615950000001;
	setAttr ".RightHandPinky2Ry" -2.0000646359999998;
	setAttr ".RightHandPinky2Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky3Tx" -85.613997130000001;
	setAttr ".RightHandPinky3Ty" 146.27584210000001;
	setAttr ".RightHandPinky3Tz" -2.6648030450000002;
	setAttr ".RightHandPinky3Ry" -2.0000646359999998;
	setAttr ".RightHandPinky3Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky4Tx" -87.28162098;
	setAttr ".RightHandPinky4Ty" 146.27580589999999;
	setAttr ".RightHandPinky4Tz" -2.7229943639999998;
	setAttr ".RightHandPinky4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky4Rz" 0.0012412149999999999;
	setAttr ".RightHandExtraFinger1Tx" -80.592357370000002;
	setAttr ".RightHandExtraFinger1Ty" 146.78871240000001;
	setAttr ".RightHandExtraFinger1Tz" -4.4895741940000002;
	setAttr ".RightHandExtraFinger1Ry" -2.0000646579999999;
	setAttr ".RightHandExtraFinger2Tx" -82.638299989999993;
	setAttr ".RightHandExtraFinger2Ty" 146.7887121;
	setAttr ".RightHandExtraFinger2Tz" -4.5958615949999997;
	setAttr ".RightHandExtraFinger2Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger3Tx" -84.613997130000001;
	setAttr ".RightHandExtraFinger3Ty" 146.78871179999999;
	setAttr ".RightHandExtraFinger3Tz" -4.6648030450000002;
	setAttr ".RightHandExtraFinger3Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger4Tx" -86.28162098;
	setAttr ".RightHandExtraFinger4Ty" 146.78871169999999;
	setAttr ".RightHandExtraFinger4Tz" -4.7229943639999998;
	setAttr ".RightHandExtraFinger4Ry" -2.0000646359999998;
	setAttr ".LeftFootThumb1Tx" 6.18422217;
	setAttr ".LeftFootThumb1Ty" 4.9992492679999998;
	setAttr ".LeftFootThumb1Tz" 1.930123209;
	setAttr ".LeftFootThumb2Tx" 4.551409713;
	setAttr ".LeftFootThumb2Ty" 2.6643834059999998;
	setAttr ".LeftFootThumb2Tz" 3.591937658;
	setAttr ".LeftFootThumb3Tx" 3.4619466889999999;
	setAttr ".LeftFootThumb3Ty" 1.8880788850000001;
	setAttr ".LeftFootThumb3Tz" 6.4001420700000002;
	setAttr ".LeftFootThumb4Tx" 3.4619466999999999;
	setAttr ".LeftFootThumb4Ty" 1.8880788550000001;
	setAttr ".LeftFootThumb4Tz" 9.6971958839999992;
	setAttr ".LeftFootIndex1Tx" 7.1105199680000002;
	setAttr ".LeftFootIndex1Ty" 1.888079117;
	setAttr ".LeftFootIndex1Tz" 12.9547209;
	setAttr ".LeftFootIndex2Tx" 7.1105199749999999;
	setAttr ".LeftFootIndex2Ty" 1.8880790999999999;
	setAttr ".LeftFootIndex2Tz" 14.82972745;
	setAttr ".LeftFootIndex3Tx" 7.1105199810000004;
	setAttr ".LeftFootIndex3Ty" 1.888079083;
	setAttr ".LeftFootIndex3Tz" 16.76314442;
	setAttr ".LeftFootIndex4Tx" 7.1105199880000001;
	setAttr ".LeftFootIndex4Ty" 1.8880790649999999;
	setAttr ".LeftFootIndex4Tz" 18.850666449999999;
	setAttr ".LeftFootMiddle1Tx" 8.9167242489999996;
	setAttr ".LeftFootMiddle1Ty" 1.888079163;
	setAttr ".LeftFootMiddle1Tz" 12.9547209;
	setAttr ".LeftFootMiddle2Tx" 8.9167242550000001;
	setAttr ".LeftFootMiddle2Ty" 1.888079147;
	setAttr ".LeftFootMiddle2Tz" 14.82860045;
	setAttr ".LeftFootMiddle3Tx" 8.9167242610000006;
	setAttr ".LeftFootMiddle3Ty" 1.888079131;
	setAttr ".LeftFootMiddle3Tz" 16.64971237;
	setAttr ".LeftFootMiddle4Tx" 8.9167242669999993;
	setAttr ".LeftFootMiddle4Ty" 1.8880791139999999;
	setAttr ".LeftFootMiddle4Tz" 18.565581959999999;
	setAttr ".LeftFootRing1Tx" 10.723903740000001;
	setAttr ".LeftFootRing1Ty" 1.888079211;
	setAttr ".LeftFootRing1Tz" 12.9547209;
	setAttr ".LeftFootRing2Tx" 10.723903740000001;
	setAttr ".LeftFootRing2Ty" 1.888079195;
	setAttr ".LeftFootRing2Tz" 14.71345226;
	setAttr ".LeftFootRing3Tx" 10.72390375;
	setAttr ".LeftFootRing3Ty" 1.8880791800000001;
	setAttr ".LeftFootRing3Tz" 16.472174209999999;
	setAttr ".LeftFootRing4Tx" 10.723903760000001;
	setAttr ".LeftFootRing4Ty" 1.8880791640000001;
	setAttr ".LeftFootRing4Tz" 18.27484922;
	setAttr ".LeftFootPinky1Tx" 12.52979668;
	setAttr ".LeftFootPinky1Ty" 1.888079257;
	setAttr ".LeftFootPinky1Tz" 12.9547209;
	setAttr ".LeftFootPinky2Tx" 12.52979669;
	setAttr ".LeftFootPinky2Ty" 1.8880792420000001;
	setAttr ".LeftFootPinky2Tz" 14.5796458;
	setAttr ".LeftFootPinky3Tx" 12.52979669;
	setAttr ".LeftFootPinky3Ty" 1.8880792289999999;
	setAttr ".LeftFootPinky3Tz" 16.143599309999999;
	setAttr ".LeftFootPinky4Tx" 12.5297967;
	setAttr ".LeftFootPinky4Ty" 1.8880792129999999;
	setAttr ".LeftFootPinky4Tz" 17.861196199999998;
	setAttr ".LeftFootExtraFinger1Tx" 5.0860939849999998;
	setAttr ".LeftFootExtraFinger1Ty" 1.888079254;
	setAttr ".LeftFootExtraFinger1Tz" 12.9547209;
	setAttr ".LeftFootExtraFinger2Tx" 5.0860939910000003;
	setAttr ".LeftFootExtraFinger2Ty" 1.888079236;
	setAttr ".LeftFootExtraFinger2Tz" 14.94401483;
	setAttr ".LeftFootExtraFinger3Tx" 5.0860939979999999;
	setAttr ".LeftFootExtraFinger3Ty" 1.8880792179999999;
	setAttr ".LeftFootExtraFinger3Tz" 16.99182682;
	setAttr ".LeftFootExtraFinger4Tx" 5.0860940049999996;
	setAttr ".LeftFootExtraFinger4Ty" 1.8880791990000001;
	setAttr ".LeftFootExtraFinger4Tz" 19.0793827;
	setAttr ".RightFootThumb1Tx" -6.180000014;
	setAttr ".RightFootThumb1Ty" 4.9992496019999999;
	setAttr ".RightFootThumb1Tz" 1.930123112;
	setAttr ".RightFootThumb2Tx" -4.5499999820000001;
	setAttr ".RightFootThumb2Ty" 2.6643838419999999;
	setAttr ".RightFootThumb2Tz" 3.5919375690000002;
	setAttr ".RightFootThumb3Tx" -3.4599999860000001;
	setAttr ".RightFootThumb3Ty" 1.888079335;
	setAttr ".RightFootThumb3Tz" 6.4001419850000003;
	setAttr ".RightFootThumb4Tx" -3.4599999860000001;
	setAttr ".RightFootThumb4Ty" 1.8880793090000001;
	setAttr ".RightFootThumb4Tz" 9.6971957989999993;
	setAttr ".RightFootIndex1Tx" -7.1099999839999999;
	setAttr ".RightFootIndex1Ty" 1.888079262;
	setAttr ".RightFootIndex1Tz" 12.95472064;
	setAttr ".RightFootIndex2Tx" -7.1099999839999999;
	setAttr ".RightFootIndex2Ty" 1.8880792479999999;
	setAttr ".RightFootIndex2Tz" 14.82972719;
	setAttr ".RightFootIndex3Tx" -7.1099999839999999;
	setAttr ".RightFootIndex3Ty" 1.8880792340000001;
	setAttr ".RightFootIndex3Tz" 16.76314416;
	setAttr ".RightFootIndex4Tx" -7.1099999839999999;
	setAttr ".RightFootIndex4Ty" 1.8880792179999999;
	setAttr ".RightFootIndex4Tz" 18.850666189999998;
	setAttr ".RightFootMiddle1Tx" -8.92;
	setAttr ".RightFootMiddle1Ty" 1.8880792049999999;
	setAttr ".RightFootMiddle1Tz" 12.954720630000001;
	setAttr ".RightFootMiddle2Tx" -8.92;
	setAttr ".RightFootMiddle2Ty" 1.8880791910000001;
	setAttr ".RightFootMiddle2Tz" 14.82860018;
	setAttr ".RightFootMiddle3Tx" -8.92;
	setAttr ".RightFootMiddle3Ty" 1.8880791770000001;
	setAttr ".RightFootMiddle3Tz" 16.649712099999999;
	setAttr ".RightFootMiddle4Tx" -8.92;
	setAttr ".RightFootMiddle4Ty" 1.8880791619999999;
	setAttr ".RightFootMiddle4Tz" 18.565581689999998;
	setAttr ".RightFootRing1Tx" -10.72;
	setAttr ".RightFootRing1Ty" 1.8880791610000001;
	setAttr ".RightFootRing1Tz" 12.95472062;
	setAttr ".RightFootRing2Tx" -10.72;
	setAttr ".RightFootRing2Ty" 1.888079147;
	setAttr ".RightFootRing2Tz" 14.713451989999999;
	setAttr ".RightFootRing3Tx" -10.72;
	setAttr ".RightFootRing3Ty" 1.888079134;
	setAttr ".RightFootRing3Tz" 16.472173940000001;
	setAttr ".RightFootRing4Tx" -10.72;
	setAttr ".RightFootRing4Ty" 1.88807912;
	setAttr ".RightFootRing4Tz" 18.274848949999999;
	setAttr ".RightFootPinky1Tx" -12.530000060000001;
	setAttr ".RightFootPinky1Ty" 1.8880791029999999;
	setAttr ".RightFootPinky1Tz" 12.95472062;
	setAttr ".RightFootPinky2Tx" -12.530000060000001;
	setAttr ".RightFootPinky2Ty" 1.888079091;
	setAttr ".RightFootPinky2Tz" 14.57964552;
	setAttr ".RightFootPinky3Tx" -12.530000060000001;
	setAttr ".RightFootPinky3Ty" 1.8880790789999999;
	setAttr ".RightFootPinky3Tz" 16.143599040000002;
	setAttr ".RightFootPinky4Tx" -12.530000060000001;
	setAttr ".RightFootPinky4Ty" 1.888079066;
	setAttr ".RightFootPinky4Tz" 17.86119592;
	setAttr ".RightFootExtraFinger1Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger1Ty" 1.8880791260000001;
	setAttr ".RightFootExtraFinger1Tz" 12.95472064;
	setAttr ".RightFootExtraFinger2Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger2Ty" 1.8880791109999999;
	setAttr ".RightFootExtraFinger2Tz" 14.944014579999999;
	setAttr ".RightFootExtraFinger3Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger3Ty" 1.888079096;
	setAttr ".RightFootExtraFinger3Tz" 16.99182656;
	setAttr ".RightFootExtraFinger4Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger4Ty" 1.88807908;
	setAttr ".RightFootExtraFinger4Tz" 19.079382450000001;
	setAttr ".LeftInHandThumbTx" 71.709864199999998;
	setAttr ".LeftInHandThumbTy" 146.58868419999999;
	setAttr ".LeftInHandIndexTx" 71.709864199999998;
	setAttr ".LeftInHandIndexTy" 146.58868419999999;
	setAttr ".LeftInHandMiddleTx" 71.709864199999998;
	setAttr ".LeftInHandMiddleTy" 146.58868419999999;
	setAttr ".LeftInHandRingTx" 71.709864199999998;
	setAttr ".LeftInHandRingTy" 146.58868419999999;
	setAttr ".LeftInHandPinkyTx" 71.709864199999998;
	setAttr ".LeftInHandPinkyTy" 146.58868419999999;
	setAttr ".LeftInHandExtraFingerTx" 71.709864199999998;
	setAttr ".LeftInHandExtraFingerTy" 146.58868419999999;
	setAttr ".RightInHandThumbTx" -71.709861489999994;
	setAttr ".RightInHandThumbTy" 146.58897870000001;
	setAttr ".RightInHandIndexTx" -71.709861489999994;
	setAttr ".RightInHandIndexTy" 146.58897870000001;
	setAttr ".RightInHandMiddleTx" -71.709861489999994;
	setAttr ".RightInHandMiddleTy" 146.58897870000001;
	setAttr ".RightInHandRingTx" -71.709861489999994;
	setAttr ".RightInHandRingTy" 146.58897870000001;
	setAttr ".RightInHandPinkyTx" -71.709861489999994;
	setAttr ".RightInHandPinkyTy" 146.58897870000001;
	setAttr ".RightInHandExtraFingerTx" -71.709861489999994;
	setAttr ".RightInHandExtraFingerTy" 146.58897870000001;
	setAttr ".LeftInFootThumbTx" 8.9100008010000007;
	setAttr ".LeftInFootThumbTy" 8.15039625;
	setAttr ".LeftInFootIndexTx" 8.9100008010000007;
	setAttr ".LeftInFootIndexTy" 8.1503963469999992;
	setAttr ".LeftInFootMiddleTx" 8.9100008010000007;
	setAttr ".LeftInFootMiddleTy" 8.1503963469999992;
	setAttr ".LeftInFootRingTx" 8.9100008010000007;
	setAttr ".LeftInFootRingTy" 8.1503963469999992;
	setAttr ".LeftInFootPinkyTx" 8.9100008010000007;
	setAttr ".LeftInFootPinkyTy" 8.1503963469999992;
	setAttr ".LeftInFootExtraFingerTx" 8.9100008010000007;
	setAttr ".LeftInFootExtraFingerTy" 8.1503963469999992;
	setAttr ".RightInFootThumbTx" -8.9100025980000002;
	setAttr ".RightInFootThumbTy" 8.1503963929999994;
	setAttr ".RightInFootThumbTz" 0.00043882099999999999;
	setAttr ".RightInFootIndexTx" -8.9100026190000001;
	setAttr ".RightInFootIndexTy" 8.1503963939999995;
	setAttr ".RightInFootIndexTz" 0.00043882099999999999;
	setAttr ".RightInFootMiddleTx" -8.9100026190000001;
	setAttr ".RightInFootMiddleTy" 8.1503963939999995;
	setAttr ".RightInFootMiddleTz" 0.00043882099999999999;
	setAttr ".RightInFootRingTx" -8.9100026190000001;
	setAttr ".RightInFootRingTy" 8.1503963939999995;
	setAttr ".RightInFootRingTz" 0.00043882099999999999;
	setAttr ".RightInFootPinkyTx" -8.9100026190000001;
	setAttr ".RightInFootPinkyTy" 8.1503963939999995;
	setAttr ".RightInFootPinkyTz" 0.00043882099999999999;
	setAttr ".RightInFootExtraFingerTx" -8.9100026190000001;
	setAttr ".RightInFootExtraFingerTy" 8.1503963939999995;
	setAttr ".RightInFootExtraFingerTz" 0.00043882099999999999;
	setAttr ".LeftShoulderExtraTx" 12.353625535000001;
	setAttr ".LeftShoulderExtraTy" 146.58868419999999;
	setAttr ".RightShoulderExtraTx" -12.353637216499999;
	setAttr ".RightShoulderExtraTy" 146.58898;
createNode hyperGraphInfo -n "nodeEditorPanel2Info4";
createNode hyperView -n "hyperView5";
	setAttr ".vl" -type "double2" -329.08596316797485 -43018.745359349661 ;
	setAttr ".vh" -type "double2" 904.52748221017634 -42280.089897164791 ;
	setAttr ".dag" no;
createNode HIKSkeletonGeneratorNode -n "HIKSkeletonGeneratorNode6";
	setAttr ".ihi" 0;
	setAttr ".WantIndexFinger" yes;
	setAttr ".WantMiddleFinger" yes;
	setAttr ".WantRingFinger" yes;
	setAttr ".WantPinkyFinger" yes;
	setAttr ".WantThumb" yes;
	setAttr ".WantToeBase" yes;
	setAttr ".HipsTy" 100;
	setAttr ".LeftUpLegTx" 8.9100008010000007;
	setAttr ".LeftUpLegTy" 93.729999539999994;
	setAttr ".LeftLegTx" 8.9100008010000007;
	setAttr ".LeftLegTy" 48.851354600000001;
	setAttr ".LeftFootTx" 8.9100008010000007;
	setAttr ".LeftFootTy" 8.1503963469999992;
	setAttr ".RightUpLegTx" -8.9100008010000007;
	setAttr ".RightUpLegTy" 93.729999539999994;
	setAttr ".RightLegTx" -8.9100035169999998;
	setAttr ".RightLegTy" 48.851354600000001;
	setAttr ".RightLegTz" 0.00043902399999999999;
	setAttr ".RightFootTx" -8.9100025980000002;
	setAttr ".RightFootTy" 8.1503963509999995;
	setAttr ".RightFootTz" 0.00043902399999999999;
	setAttr ".RightFootRy" -0.0048003860000000002;
	setAttr ".SpineTy" 107;
	setAttr ".LeftArmTx" 17.707251070000002;
	setAttr ".LeftArmTy" 146.58868419999999;
	setAttr ".LeftForeArmTx" 45.012716769999997;
	setAttr ".LeftForeArmTy" 146.58868419999999;
	setAttr ".LeftHandTx" 71.709864139999993;
	setAttr ".LeftHandTy" 146.58868419999999;
	setAttr ".RightArmTx" -17.707274909999999;
	setAttr ".RightArmTy" 146.58898;
	setAttr ".RightForeArmTx" -45.012873159999998;
	setAttr ".RightForeArmTy" 146.58898;
	setAttr ".RightHandTx" -71.709861270000005;
	setAttr ".RightHandTy" 146.58897870000001;
	setAttr ".HeadTy" 165;
	setAttr ".LeftToeBaseTx" 8.9100092279999998;
	setAttr ".LeftToeBaseTy" 1.8880791539999999;
	setAttr ".LeftToeBaseTz" 12.9547209;
	setAttr ".RightToeBaseTx" -8.9110879789999995;
	setAttr ".RightToeBaseTy" 1.888079171;
	setAttr ".RightToeBaseTz" 12.95518809;
	setAttr ".RightToeBaseRx" 0.0029125930000000002;
	setAttr ".RightToeBaseRy" -0.0048003860000000002;
	setAttr ".LeftShoulderTx" 7.0000004770000004;
	setAttr ".LeftShoulderTy" 146.58854679999999;
	setAttr ".LeftShoulderRz" 0.00073528199999999997;
	setAttr ".RightShoulderTx" -6.9999995229999996;
	setAttr ".RightShoulderTy" 146.58854679999999;
	setAttr ".RightShoulderRz" -0.0023183610000000001;
	setAttr ".NeckTy" 145;
	setAttr ".LeftFingerBaseTx" 80.519743439999999;
	setAttr ".LeftFingerBaseTy" 147.08957459999999;
	setAttr ".LeftFingerBaseTz" 1.304684401;
	setAttr ".LeftFingerBaseRy" -0.0035633340000000005;
	setAttr ".RightFingerBaseTx" -80.519626680000002;
	setAttr ".RightFingerBaseTy" 147.0898718;
	setAttr ".RightFingerBaseTz" 1.305458317;
	setAttr ".RightFingerBaseRy" -2.0000646359999998;
	setAttr ".Spine1Ty" 111;
	setAttr ".Spine2Ty" 115;
	setAttr ".Spine3Ty" 119;
	setAttr ".Spine4Ty" 123;
	setAttr ".Spine5Ty" 127;
	setAttr ".Spine6Ty" 131;
	setAttr ".Spine7Ty" 135;
	setAttr ".Spine8Ty" 139;
	setAttr ".Spine9Ty" 143;
	setAttr ".Neck1Ty" 147;
	setAttr ".Neck2Ty" 149;
	setAttr ".Neck3Ty" 151;
	setAttr ".Neck4Ty" 153;
	setAttr ".Neck5Ty" 155;
	setAttr ".Neck6Ty" 157;
	setAttr ".Neck7Ty" 159;
	setAttr ".Neck8Ty" 161;
	setAttr ".Neck9Ty" 163;
	setAttr ".LeftUpLegRollTx" 8.9100008010000007;
	setAttr ".LeftUpLegRollTy" 70.997711179999996;
	setAttr ".LeftLegRollTx" 8.9100008010000007;
	setAttr ".LeftLegRollTy" 26.759407039999999;
	setAttr ".RightUpLegRollTx" -8.9100035169999998;
	setAttr ".RightUpLegRollTy" 70.997711179999996;
	setAttr ".RightUpLegRollRx" -0.0011371;
	setAttr ".RightLegRollTx" -8.9100025980000002;
	setAttr ".RightLegRollTy" 26.75940705;
	setAttr ".RightLegRollTz" 0.00043902399999999999;
	setAttr ".LeftArmRollTx" 32.968441489999996;
	setAttr ".LeftArmRollTy" 146.58868419999999;
	setAttr ".LeftForeArmRollTx" 61.340445039999999;
	setAttr ".LeftForeArmRollTy" 146.58868419999999;
	setAttr ".RightArmRollTx" -32.968521590000002;
	setAttr ".RightArmRollTy" 146.58898;
	setAttr ".RightForeArmRollTx" -61.340504160000002;
	setAttr ".RightForeArmRollTy" 146.58898;
	setAttr ".HipsTranslationTy" 100;
	setAttr ".LeftHandThumb1Tx" 76.058620989999994;
	setAttr ".LeftHandThumb1Ty" 145.79018170000001;
	setAttr ".LeftHandThumb1Tz" 4.2824339670000002;
	setAttr ".LeftHandThumb2Tx" 78.571210930000007;
	setAttr ".LeftHandThumb2Ty" 145.25408229999999;
	setAttr ".LeftHandThumb2Tz" 4.9898882909999998;
	setAttr ".LeftHandThumb2Rz" -0.00029786199999999997;
	setAttr ".LeftHandThumb3Tx" 81.114351339999999;
	setAttr ".LeftHandThumb3Ty" 145.25406910000001;
	setAttr ".LeftHandThumb3Tz" 4.989897633;
	setAttr ".LeftHandThumb4Tx" 83.78109748;
	setAttr ".LeftHandThumb4Ty" 145.254072;
	setAttr ".LeftHandThumb4Tz" 4.9898894220000001;
	setAttr ".LeftHandIndex1Tx" 80.531840860000003;
	setAttr ".LeftHandIndex1Ty" 146.7884134;
	setAttr ".LeftHandIndex1Tz" 3.4716694160000001;
	setAttr ".LeftHandIndex1Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex1Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex2Tx" 84.754595460000004;
	setAttr ".LeftHandIndex2Ty" 146.7883913;
	setAttr ".LeftHandIndex2Tz" 3.618868435;
	setAttr ".LeftHandIndex2Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex2Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex3Tx" 87.406920909999997;
	setAttr ".LeftHandIndex3Ty" 146.7883775;
	setAttr ".LeftHandIndex3Tz" 3.711324415;
	setAttr ".LeftHandIndex3Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex3Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex4Tx" 89.363955140000002;
	setAttr ".LeftHandIndex4Ty" 146.7883673;
	setAttr ".LeftHandIndex4Tz" 3.7795433150000002;
	setAttr ".LeftHandIndex4Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex4Rz" -0.00029934100000000001;
	setAttr ".LeftHandMiddle1Tx" 80.519743500000004;
	setAttr ".LeftHandMiddle1Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle1Tz" 1.3046843809999999;
	setAttr ".LeftHandMiddle1Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle2Tx" 85.382995179999995;
	setAttr ".LeftHandMiddle2Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle2Tz" 1.3049868360000001;
	setAttr ".LeftHandMiddle2Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle3Tx" 88.148231789999997;
	setAttr ".LeftHandMiddle3Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle3Tz" 1.305158619;
	setAttr ".LeftHandMiddle3Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle4Tx" 90.153863950000002;
	setAttr ".LeftHandMiddle4Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle4Tz" 1.3052822150000001;
	setAttr ".LeftHandMiddle4Ry" -0.0035633340000000005;
	setAttr ".LeftHandRing1Tx" 80.603623929999998;
	setAttr ".LeftHandRing1Ty" 146.96860380000001;
	setAttr ".LeftHandRing1Tz" -0.79315890899999997;
	setAttr ".LeftHandRing1Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing2Tx" 85.141382759999999;
	setAttr ".LeftHandRing2Ty" 146.96860380000001;
	setAttr ".LeftHandRing2Tz" -0.79315882000000004;
	setAttr ".LeftHandRing2Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing3Tx" 87.445908619999997;
	setAttr ".LeftHandRing3Ty" 146.96860380000001;
	setAttr ".LeftHandRing3Tz" -0.79315893699999995;
	setAttr ".LeftHandRing3Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing4Tx" 89.369255980000005;
	setAttr ".LeftHandRing4Ty" 146.96860380000001;
	setAttr ".LeftHandRing4Tz" -0.79315975400000005;
	setAttr ".LeftHandRing4Ry" -0.0035635290000000002;
	setAttr ".LeftHandPinky1Tx" 80.592138829999996;
	setAttr ".LeftHandPinky1Ty" 146.27565720000001;
	setAttr ".LeftHandPinky1Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky1Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky2Tx" 83.636238160000005;
	setAttr ".LeftHandPinky2Ty" 146.27569779999999;
	setAttr ".LeftHandPinky2Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky2Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky3Tx" 85.610739649999999;
	setAttr ".LeftHandPinky3Ty" 146.27572409999999;
	setAttr ".LeftHandPinky3Tz" -2.4903566079999999;
	setAttr ".LeftHandPinky3Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky4Tx" 87.277354299999999;
	setAttr ".LeftHandPinky4Ty" 146.27574630000001;
	setAttr ".LeftHandPinky4Tz" -2.4903558170000002;
	setAttr ".LeftHandPinky4Rz" 0.00076302599999999998;
	setAttr ".LeftHandExtraFinger1Tx" 80.592138829999996;
	setAttr ".LeftHandExtraFinger1Ty" 146.7884134;
	setAttr ".LeftHandExtraFinger1Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger1Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger1Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger2Tx" 82.636238160000005;
	setAttr ".LeftHandExtraFinger2Ty" 146.7883913;
	setAttr ".LeftHandExtraFinger2Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger2Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger2Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger3Tx" 84.610739649999999;
	setAttr ".LeftHandExtraFinger3Ty" 146.7883775;
	setAttr ".LeftHandExtraFinger3Tz" -4.4903566079999999;
	setAttr ".LeftHandExtraFinger3Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger3Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger4Tx" 86.277354299999999;
	setAttr ".LeftHandExtraFinger4Ty" 146.7883673;
	setAttr ".LeftHandExtraFinger4Tz" -4.4903558170000002;
	setAttr ".LeftHandExtraFinger4Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger4Rz" -0.00029934100000000001;
	setAttr ".RightHandThumb1Tx" -76.058242059999998;
	setAttr ".RightHandThumb1Ty" 145.7904806;
	setAttr ".RightHandThumb1Tz" 4.2828147379999999;
	setAttr ".RightHandThumb2Tx" -78.570769569999996;
	setAttr ".RightHandThumb2Ty" 145.25438170000001;
	setAttr ".RightHandThumb2Tz" 4.9904913879999997;
	setAttr ".RightHandThumb2Rz" -0.00060208600000000005;
	setAttr ".RightHandThumb3Tx" -81.112358929999999;
	setAttr ".RightHandThumb3Ty" 145.25440850000001;
	setAttr ".RightHandThumb3Tz" 5.0793117030000001;
	setAttr ".RightHandThumb3Rz" -0.00039149399999999999;
	setAttr ".RightHandThumb4Tx" -83.777478689999995;
	setAttr ".RightHandThumb4Ty" 145.2544268;
	setAttr ".RightHandThumb4Tz" 5.1724490200000002;
	setAttr ".RightHandThumb4Rz" -0.00039149399999999999;
	setAttr ".RightHandIndex1Tx" -80.531533929999995;
	setAttr ".RightHandIndex1Ty" 146.78871240000001;
	setAttr ".RightHandIndex1Tz" 3.4724442959999999;
	setAttr ".RightHandIndex1Ry" -2.0000646579999999;
	setAttr ".RightHandIndex2Tx" -84.754284150000004;
	setAttr ".RightHandIndex2Ty" 146.7887121;
	setAttr ".RightHandIndex2Tz" 3.325092508;
	setAttr ".RightHandIndex2Ry" -2.0000646359999998;
	setAttr ".RightHandIndex3Tx" -87.406606949999997;
	setAttr ".RightHandIndex3Ty" 146.78871179999999;
	setAttr ".RightHandIndex3Tz" 3.2325403669999999;
	setAttr ".RightHandIndex3Ry" -2.0000646359999998;
	setAttr ".RightHandIndex4Tx" -89.363639169999999;
	setAttr ".RightHandIndex4Ty" 146.78871169999999;
	setAttr ".RightHandIndex4Tz" 3.164250215;
	setAttr ".RightHandIndex4Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle1Tx" -80.519627299999996;
	setAttr ".RightHandMiddle1Ty" 147.0898718;
	setAttr ".RightHandMiddle1Tz" 1.305458427;
	setAttr ".RightHandMiddle1Ry" -2.0000646579999999;
	setAttr ".RightHandMiddle2Tx" -85.379921789999997;
	setAttr ".RightHandMiddle2Ty" 147.08987139999999;
	setAttr ".RightHandMiddle2Tz" 1.1358596750000001;
	setAttr ".RightHandMiddle2Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle3Tx" -88.143476890000002;
	setAttr ".RightHandMiddle3Ty" 147.0898712;
	setAttr ".RightHandMiddle3Tz" 1.039426113;
	setAttr ".RightHandMiddle3Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle4Tx" -90.147889570000004;
	setAttr ".RightHandMiddle4Ty" 147.089871;
	setAttr ".RightHandMiddle4Tz" 0.96948263800000001;
	setAttr ".RightHandMiddle4Ry" -2.0000646359999998;
	setAttr ".RightHandRing1Tx" -80.603693699999994;
	setAttr ".RightHandRing1Ty" 146.968899;
	setAttr ".RightHandRing1Tz" -0.79237675600000002;
	setAttr ".RightHandRing1Ry" -2.0000646579999999;
	setAttr ".RightHandRing2Tx" -85.138693309999994;
	setAttr ".RightHandRing2Ty" 146.96889859999999;
	setAttr ".RightHandRing2Tz" -0.95062442800000002;
	setAttr ".RightHandRing2Ry" -2.0000646359999998;
	setAttr ".RightHandRing3Tx" -87.441817880000002;
	setAttr ".RightHandRing3Ty" 146.9688984;
	setAttr ".RightHandRing3Tz" -1.0309913799999999;
	setAttr ".RightHandRing3Ry" -2.0000646359999998;
	setAttr ".RightHandRing4Tx" -89.363995799999998;
	setAttr ".RightHandRing4Ty" 146.96889830000001;
	setAttr ".RightHandRing4Tz" -1.0980652959999999;
	setAttr ".RightHandRing4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky1Tx" -80.592357370000002;
	setAttr ".RightHandPinky1Ty" 146.2759509;
	setAttr ".RightHandPinky1Tz" -2.4895741939999998;
	setAttr ".RightHandPinky1Ry" -2.0000646579999999;
	setAttr ".RightHandPinky1Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky2Tx" -83.638299989999993;
	setAttr ".RightHandPinky2Ty" 146.27588489999999;
	setAttr ".RightHandPinky2Tz" -2.5958615950000001;
	setAttr ".RightHandPinky2Ry" -2.0000646359999998;
	setAttr ".RightHandPinky2Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky3Tx" -85.613997130000001;
	setAttr ".RightHandPinky3Ty" 146.27584210000001;
	setAttr ".RightHandPinky3Tz" -2.6648030450000002;
	setAttr ".RightHandPinky3Ry" -2.0000646359999998;
	setAttr ".RightHandPinky3Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky4Tx" -87.28162098;
	setAttr ".RightHandPinky4Ty" 146.27580589999999;
	setAttr ".RightHandPinky4Tz" -2.7229943639999998;
	setAttr ".RightHandPinky4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky4Rz" 0.0012412149999999999;
	setAttr ".RightHandExtraFinger1Tx" -80.592357370000002;
	setAttr ".RightHandExtraFinger1Ty" 146.78871240000001;
	setAttr ".RightHandExtraFinger1Tz" -4.4895741940000002;
	setAttr ".RightHandExtraFinger1Ry" -2.0000646579999999;
	setAttr ".RightHandExtraFinger2Tx" -82.638299989999993;
	setAttr ".RightHandExtraFinger2Ty" 146.7887121;
	setAttr ".RightHandExtraFinger2Tz" -4.5958615949999997;
	setAttr ".RightHandExtraFinger2Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger3Tx" -84.613997130000001;
	setAttr ".RightHandExtraFinger3Ty" 146.78871179999999;
	setAttr ".RightHandExtraFinger3Tz" -4.6648030450000002;
	setAttr ".RightHandExtraFinger3Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger4Tx" -86.28162098;
	setAttr ".RightHandExtraFinger4Ty" 146.78871169999999;
	setAttr ".RightHandExtraFinger4Tz" -4.7229943639999998;
	setAttr ".RightHandExtraFinger4Ry" -2.0000646359999998;
	setAttr ".LeftFootThumb1Tx" 6.18422217;
	setAttr ".LeftFootThumb1Ty" 4.9992492679999998;
	setAttr ".LeftFootThumb1Tz" 1.930123209;
	setAttr ".LeftFootThumb2Tx" 4.551409713;
	setAttr ".LeftFootThumb2Ty" 2.6643834059999998;
	setAttr ".LeftFootThumb2Tz" 3.591937658;
	setAttr ".LeftFootThumb3Tx" 3.4619466889999999;
	setAttr ".LeftFootThumb3Ty" 1.8880788850000001;
	setAttr ".LeftFootThumb3Tz" 6.4001420700000002;
	setAttr ".LeftFootThumb4Tx" 3.4619466999999999;
	setAttr ".LeftFootThumb4Ty" 1.8880788550000001;
	setAttr ".LeftFootThumb4Tz" 9.6971958839999992;
	setAttr ".LeftFootIndex1Tx" 7.1105199680000002;
	setAttr ".LeftFootIndex1Ty" 1.888079117;
	setAttr ".LeftFootIndex1Tz" 12.9547209;
	setAttr ".LeftFootIndex2Tx" 7.1105199749999999;
	setAttr ".LeftFootIndex2Ty" 1.8880790999999999;
	setAttr ".LeftFootIndex2Tz" 14.82972745;
	setAttr ".LeftFootIndex3Tx" 7.1105199810000004;
	setAttr ".LeftFootIndex3Ty" 1.888079083;
	setAttr ".LeftFootIndex3Tz" 16.76314442;
	setAttr ".LeftFootIndex4Tx" 7.1105199880000001;
	setAttr ".LeftFootIndex4Ty" 1.8880790649999999;
	setAttr ".LeftFootIndex4Tz" 18.850666449999999;
	setAttr ".LeftFootMiddle1Tx" 8.9167242489999996;
	setAttr ".LeftFootMiddle1Ty" 1.888079163;
	setAttr ".LeftFootMiddle1Tz" 12.9547209;
	setAttr ".LeftFootMiddle2Tx" 8.9167242550000001;
	setAttr ".LeftFootMiddle2Ty" 1.888079147;
	setAttr ".LeftFootMiddle2Tz" 14.82860045;
	setAttr ".LeftFootMiddle3Tx" 8.9167242610000006;
	setAttr ".LeftFootMiddle3Ty" 1.888079131;
	setAttr ".LeftFootMiddle3Tz" 16.64971237;
	setAttr ".LeftFootMiddle4Tx" 8.9167242669999993;
	setAttr ".LeftFootMiddle4Ty" 1.8880791139999999;
	setAttr ".LeftFootMiddle4Tz" 18.565581959999999;
	setAttr ".LeftFootRing1Tx" 10.723903740000001;
	setAttr ".LeftFootRing1Ty" 1.888079211;
	setAttr ".LeftFootRing1Tz" 12.9547209;
	setAttr ".LeftFootRing2Tx" 10.723903740000001;
	setAttr ".LeftFootRing2Ty" 1.888079195;
	setAttr ".LeftFootRing2Tz" 14.71345226;
	setAttr ".LeftFootRing3Tx" 10.72390375;
	setAttr ".LeftFootRing3Ty" 1.8880791800000001;
	setAttr ".LeftFootRing3Tz" 16.472174209999999;
	setAttr ".LeftFootRing4Tx" 10.723903760000001;
	setAttr ".LeftFootRing4Ty" 1.8880791640000001;
	setAttr ".LeftFootRing4Tz" 18.27484922;
	setAttr ".LeftFootPinky1Tx" 12.52979668;
	setAttr ".LeftFootPinky1Ty" 1.888079257;
	setAttr ".LeftFootPinky1Tz" 12.9547209;
	setAttr ".LeftFootPinky2Tx" 12.52979669;
	setAttr ".LeftFootPinky2Ty" 1.8880792420000001;
	setAttr ".LeftFootPinky2Tz" 14.5796458;
	setAttr ".LeftFootPinky3Tx" 12.52979669;
	setAttr ".LeftFootPinky3Ty" 1.8880792289999999;
	setAttr ".LeftFootPinky3Tz" 16.143599309999999;
	setAttr ".LeftFootPinky4Tx" 12.5297967;
	setAttr ".LeftFootPinky4Ty" 1.8880792129999999;
	setAttr ".LeftFootPinky4Tz" 17.861196199999998;
	setAttr ".LeftFootExtraFinger1Tx" 5.0860939849999998;
	setAttr ".LeftFootExtraFinger1Ty" 1.888079254;
	setAttr ".LeftFootExtraFinger1Tz" 12.9547209;
	setAttr ".LeftFootExtraFinger2Tx" 5.0860939910000003;
	setAttr ".LeftFootExtraFinger2Ty" 1.888079236;
	setAttr ".LeftFootExtraFinger2Tz" 14.94401483;
	setAttr ".LeftFootExtraFinger3Tx" 5.0860939979999999;
	setAttr ".LeftFootExtraFinger3Ty" 1.8880792179999999;
	setAttr ".LeftFootExtraFinger3Tz" 16.99182682;
	setAttr ".LeftFootExtraFinger4Tx" 5.0860940049999996;
	setAttr ".LeftFootExtraFinger4Ty" 1.8880791990000001;
	setAttr ".LeftFootExtraFinger4Tz" 19.0793827;
	setAttr ".RightFootThumb1Tx" -6.180000014;
	setAttr ".RightFootThumb1Ty" 4.9992496019999999;
	setAttr ".RightFootThumb1Tz" 1.930123112;
	setAttr ".RightFootThumb2Tx" -4.5499999820000001;
	setAttr ".RightFootThumb2Ty" 2.6643838419999999;
	setAttr ".RightFootThumb2Tz" 3.5919375690000002;
	setAttr ".RightFootThumb3Tx" -3.4599999860000001;
	setAttr ".RightFootThumb3Ty" 1.888079335;
	setAttr ".RightFootThumb3Tz" 6.4001419850000003;
	setAttr ".RightFootThumb4Tx" -3.4599999860000001;
	setAttr ".RightFootThumb4Ty" 1.8880793090000001;
	setAttr ".RightFootThumb4Tz" 9.6971957989999993;
	setAttr ".RightFootIndex1Tx" -7.1099999839999999;
	setAttr ".RightFootIndex1Ty" 1.888079262;
	setAttr ".RightFootIndex1Tz" 12.95472064;
	setAttr ".RightFootIndex2Tx" -7.1099999839999999;
	setAttr ".RightFootIndex2Ty" 1.8880792479999999;
	setAttr ".RightFootIndex2Tz" 14.82972719;
	setAttr ".RightFootIndex3Tx" -7.1099999839999999;
	setAttr ".RightFootIndex3Ty" 1.8880792340000001;
	setAttr ".RightFootIndex3Tz" 16.76314416;
	setAttr ".RightFootIndex4Tx" -7.1099999839999999;
	setAttr ".RightFootIndex4Ty" 1.8880792179999999;
	setAttr ".RightFootIndex4Tz" 18.850666189999998;
	setAttr ".RightFootMiddle1Tx" -8.92;
	setAttr ".RightFootMiddle1Ty" 1.8880792049999999;
	setAttr ".RightFootMiddle1Tz" 12.954720630000001;
	setAttr ".RightFootMiddle2Tx" -8.92;
	setAttr ".RightFootMiddle2Ty" 1.8880791910000001;
	setAttr ".RightFootMiddle2Tz" 14.82860018;
	setAttr ".RightFootMiddle3Tx" -8.92;
	setAttr ".RightFootMiddle3Ty" 1.8880791770000001;
	setAttr ".RightFootMiddle3Tz" 16.649712099999999;
	setAttr ".RightFootMiddle4Tx" -8.92;
	setAttr ".RightFootMiddle4Ty" 1.8880791619999999;
	setAttr ".RightFootMiddle4Tz" 18.565581689999998;
	setAttr ".RightFootRing1Tx" -10.72;
	setAttr ".RightFootRing1Ty" 1.8880791610000001;
	setAttr ".RightFootRing1Tz" 12.95472062;
	setAttr ".RightFootRing2Tx" -10.72;
	setAttr ".RightFootRing2Ty" 1.888079147;
	setAttr ".RightFootRing2Tz" 14.713451989999999;
	setAttr ".RightFootRing3Tx" -10.72;
	setAttr ".RightFootRing3Ty" 1.888079134;
	setAttr ".RightFootRing3Tz" 16.472173940000001;
	setAttr ".RightFootRing4Tx" -10.72;
	setAttr ".RightFootRing4Ty" 1.88807912;
	setAttr ".RightFootRing4Tz" 18.274848949999999;
	setAttr ".RightFootPinky1Tx" -12.530000060000001;
	setAttr ".RightFootPinky1Ty" 1.8880791029999999;
	setAttr ".RightFootPinky1Tz" 12.95472062;
	setAttr ".RightFootPinky2Tx" -12.530000060000001;
	setAttr ".RightFootPinky2Ty" 1.888079091;
	setAttr ".RightFootPinky2Tz" 14.57964552;
	setAttr ".RightFootPinky3Tx" -12.530000060000001;
	setAttr ".RightFootPinky3Ty" 1.8880790789999999;
	setAttr ".RightFootPinky3Tz" 16.143599040000002;
	setAttr ".RightFootPinky4Tx" -12.530000060000001;
	setAttr ".RightFootPinky4Ty" 1.888079066;
	setAttr ".RightFootPinky4Tz" 17.86119592;
	setAttr ".RightFootExtraFinger1Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger1Ty" 1.8880791260000001;
	setAttr ".RightFootExtraFinger1Tz" 12.95472064;
	setAttr ".RightFootExtraFinger2Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger2Ty" 1.8880791109999999;
	setAttr ".RightFootExtraFinger2Tz" 14.944014579999999;
	setAttr ".RightFootExtraFinger3Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger3Ty" 1.888079096;
	setAttr ".RightFootExtraFinger3Tz" 16.99182656;
	setAttr ".RightFootExtraFinger4Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger4Ty" 1.88807908;
	setAttr ".RightFootExtraFinger4Tz" 19.079382450000001;
	setAttr ".LeftInHandThumbTx" 71.709864199999998;
	setAttr ".LeftInHandThumbTy" 146.58868419999999;
	setAttr ".LeftInHandIndexTx" 71.709864199999998;
	setAttr ".LeftInHandIndexTy" 146.58868419999999;
	setAttr ".LeftInHandMiddleTx" 71.709864199999998;
	setAttr ".LeftInHandMiddleTy" 146.58868419999999;
	setAttr ".LeftInHandRingTx" 71.709864199999998;
	setAttr ".LeftInHandRingTy" 146.58868419999999;
	setAttr ".LeftInHandPinkyTx" 71.709864199999998;
	setAttr ".LeftInHandPinkyTy" 146.58868419999999;
	setAttr ".LeftInHandExtraFingerTx" 71.709864199999998;
	setAttr ".LeftInHandExtraFingerTy" 146.58868419999999;
	setAttr ".RightInHandThumbTx" -71.709861489999994;
	setAttr ".RightInHandThumbTy" 146.58897870000001;
	setAttr ".RightInHandIndexTx" -71.709861489999994;
	setAttr ".RightInHandIndexTy" 146.58897870000001;
	setAttr ".RightInHandMiddleTx" -71.709861489999994;
	setAttr ".RightInHandMiddleTy" 146.58897870000001;
	setAttr ".RightInHandRingTx" -71.709861489999994;
	setAttr ".RightInHandRingTy" 146.58897870000001;
	setAttr ".RightInHandPinkyTx" -71.709861489999994;
	setAttr ".RightInHandPinkyTy" 146.58897870000001;
	setAttr ".RightInHandExtraFingerTx" -71.709861489999994;
	setAttr ".RightInHandExtraFingerTy" 146.58897870000001;
	setAttr ".LeftInFootThumbTx" 8.9100008010000007;
	setAttr ".LeftInFootThumbTy" 8.15039625;
	setAttr ".LeftInFootIndexTx" 8.9100008010000007;
	setAttr ".LeftInFootIndexTy" 8.1503963469999992;
	setAttr ".LeftInFootMiddleTx" 8.9100008010000007;
	setAttr ".LeftInFootMiddleTy" 8.1503963469999992;
	setAttr ".LeftInFootRingTx" 8.9100008010000007;
	setAttr ".LeftInFootRingTy" 8.1503963469999992;
	setAttr ".LeftInFootPinkyTx" 8.9100008010000007;
	setAttr ".LeftInFootPinkyTy" 8.1503963469999992;
	setAttr ".LeftInFootExtraFingerTx" 8.9100008010000007;
	setAttr ".LeftInFootExtraFingerTy" 8.1503963469999992;
	setAttr ".RightInFootThumbTx" -8.9100025980000002;
	setAttr ".RightInFootThumbTy" 8.1503963929999994;
	setAttr ".RightInFootThumbTz" 0.00043882099999999999;
	setAttr ".RightInFootIndexTx" -8.9100026190000001;
	setAttr ".RightInFootIndexTy" 8.1503963939999995;
	setAttr ".RightInFootIndexTz" 0.00043882099999999999;
	setAttr ".RightInFootMiddleTx" -8.9100026190000001;
	setAttr ".RightInFootMiddleTy" 8.1503963939999995;
	setAttr ".RightInFootMiddleTz" 0.00043882099999999999;
	setAttr ".RightInFootRingTx" -8.9100026190000001;
	setAttr ".RightInFootRingTy" 8.1503963939999995;
	setAttr ".RightInFootRingTz" 0.00043882099999999999;
	setAttr ".RightInFootPinkyTx" -8.9100026190000001;
	setAttr ".RightInFootPinkyTy" 8.1503963939999995;
	setAttr ".RightInFootPinkyTz" 0.00043882099999999999;
	setAttr ".RightInFootExtraFingerTx" -8.9100026190000001;
	setAttr ".RightInFootExtraFingerTy" 8.1503963939999995;
	setAttr ".RightInFootExtraFingerTz" 0.00043882099999999999;
	setAttr ".LeftShoulderExtraTx" 12.353625535000001;
	setAttr ".LeftShoulderExtraTy" 146.58868419999999;
	setAttr ".RightShoulderExtraTx" -12.353637216499999;
	setAttr ".RightShoulderExtraTy" 146.58898;
createNode hyperGraphInfo -n "nodeEditorPanel2Info5";
createNode hyperView -n "hyperView6";
	setAttr ".vl" -type "double2" -329.08596316797485 -43018.745359349661 ;
	setAttr ".vh" -type "double2" 904.52748221017634 -42280.089897164791 ;
	setAttr ".dag" no;
createNode displayLayer -n "Skeleton";
	setAttr ".do" 1;
createNode network -n "RED_Rig";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "version" -ln "version" -at "double";
	addAttr -ci true -sn "rigType" -ln "rigType" -dt "string";
	addAttr -ci true -m -sn "renderMeshes" -ln "renderMeshes" -at "message";
	addAttr -ci true -sn "exportSkeletonRoot" -ln "exportSkeletonRoot" -at "message";
	addAttr -ci true -sn "CTRL_Main" -ln "CTRL_Main" -at "message";
	addAttr -ci true -sn "L_ArmSystem" -ln "L_ArmSystem" -at "message";
	addAttr -ci true -sn "L_Leg_System" -ln "L_Leg_System" -at "message";
	addAttr -ci true -sn "R_ArmSystem" -ln "R_ArmSystem" -at "message";
	addAttr -ci true -sn "R_LegSystem" -ln "R_LegSystem" -at "message";
	addAttr -ci true -sn "SpineSystem" -ln "SpineSystem" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRig";
	setAttr -l on ".mNodeID" -type "string" "RED_Rig";
	setAttr -k on ".version" 1;
lockNode -l 1 ;
createNode network -n "L_ArmSystem";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "systemType" -ln "systemType" -dt "string";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "RED_Rig" -ln "RED_Rig" -at "message";
	addAttr -ci true -sn "CTRL_L_Wrist" -ln "CTRL_L_Wrist" -at "message";
	addAttr -ci true -sn "CTRL_L_Elbow" -ln "CTRL_L_Elbow" -at "message";
	addAttr -ci true -sn "CTRL_L_Clav" -ln "CTRL_L_Clav" -at "message";
	addAttr -ci true -sn "L_Fingers_System" -ln "L_Fingers_System" -at "message";
	addAttr -ci true -sn "L_ArmSupport" -ln "L_ArmSupport" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSubSystem";
	setAttr -l on ".mNodeID" -type "string" "L_ArmSystem";
	setAttr ".systemType" -type "string" "Arm";
	setAttr -k on ".mirrorSide" 1;
lockNode -l 1 ;
createNode network -n "L_Fingers_System";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "systemType" -ln "systemType" -dt "string";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "L_ArmSystem" -ln "L_ArmSystem" -at "message";
	addAttr -ci true -sn "CTRL_ThumbRoot" -ln "CTRL_ThumbRoot" -at "message";
	addAttr -ci true -sn "CTRL_IndexRoot" -ln "CTRL_IndexRoot" -at "message";
	addAttr -ci true -sn "CTRL_MiddleRoot" -ln "CTRL_MiddleRoot" -at "message";
	addAttr -ci true -sn "CTRL_RingRoot" -ln "CTRL_RingRoot" -at "message";
	addAttr -ci true -sn "CTRL_PinkyRoot" -ln "CTRL_PinkyRoot" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSubSystem";
	setAttr -l on ".mNodeID" -type "string" "L_Fingers_System";
	setAttr ".systemType" -type "string" "Fingers";
	setAttr -k on ".mirrorSide" 1;
lockNode -l 1 ;
createNode network -n "L_LegSystem";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "systemType" -ln "systemType" -dt "string";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "RED_Rig" -ln "RED_Rig" -at "message";
	addAttr -ci true -sn "CTRL_L_Foot" -ln "CTRL_L_Foot" -at "message";
	addAttr -ci true -sn "CTRL_L_Knee" -ln "CTRL_L_Knee" -at "message";
	addAttr -ci true -sn "L_LegSupport" -ln "L_LegSupport" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSubSystem";
	setAttr -l on ".mNodeID" -type "string" "L_LegSystem";
	setAttr ".systemType" -type "string" "Leg";
	setAttr -k on ".mirrorSide" 1;
lockNode -l 1 ;
createNode network -n "R_ArmSystem";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "systemType" -ln "systemType" -dt "string";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "RED_Rig" -ln "RED_Rig" -at "message";
	addAttr -ci true -sn "CTRL_R_Wrist" -ln "CTRL_R_Wrist" -at "message";
	addAttr -ci true -sn "CTRL_R_Elbow" -ln "CTRL_R_Elbow" -at "message";
	addAttr -ci true -sn "CTRL_R_Clav" -ln "CTRL_R_Clav" -at "message";
	addAttr -ci true -sn "R_Fingers_System" -ln "R_Fingers_System" -at "message";
	addAttr -ci true -sn "R_ArmSupport" -ln "R_ArmSupport" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSubSystem";
	setAttr -l on ".mNodeID" -type "string" "R_ArmSystem";
	setAttr ".systemType" -type "string" "Arm";
	setAttr -k on ".mirrorSide" 2;
lockNode -l 1 ;
createNode network -n "R_Fingers_System";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "systemType" -ln "systemType" -dt "string";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "R_ArmSystem" -ln "R_ArmSystem" -at "message";
	addAttr -ci true -sn "CTRL_ThumbRoot" -ln "CTRL_ThumbRoot" -at "message";
	addAttr -ci true -sn "CTRL_IndexRoot" -ln "CTRL_IndexRoot" -at "message";
	addAttr -ci true -sn "CTRL_MiddleRoot" -ln "CTRL_MiddleRoot" -at "message";
	addAttr -ci true -sn "CTRL_RingRoot" -ln "CTRL_RingRoot" -at "message";
	addAttr -ci true -sn "CTRL_PinkyRoot" -ln "CTRL_PinkyRoot" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSubSystem";
	setAttr -l on ".mNodeID" -type "string" "R_Fingers_System";
	setAttr ".systemType" -type "string" "Fingers";
	setAttr -k on ".mirrorSide" 2;
lockNode -l 1 ;
createNode network -n "R_LegSystem";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "systemType" -ln "systemType" -dt "string";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "RED_Rig" -ln "RED_Rig" -at "message";
	addAttr -ci true -sn "CTRL_R_Foot" -ln "CTRL_R_Foot" -at "message";
	addAttr -ci true -sn "CTRL_R_Knee" -ln "CTRL_R_Knee" -at "message";
	addAttr -ci true -sn "R_LegSupport" -ln "R_LegSupport" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSubSystem";
	setAttr -l on ".mNodeID" -type "string" "R_LegSystem";
	setAttr ".systemType" -type "string" "Leg";
	setAttr -k on ".mirrorSide" 2;
lockNode -l 1 ;
createNode network -n "SpineSystem";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "systemType" -ln "systemType" -dt "string";
	addAttr -ci true -sn "mirrorSide" -ln "mirrorSide" -min 0 -max 2 -en "Centre:Left:Right" 
		-at "enum";
	addAttr -ci true -sn "RED_Rig" -ln "RED_Rig" -at "message";
	addAttr -ci true -sn "CTRL_Root" -ln "CTRL_Root" -at "message";
	addAttr -ci true -sn "CTRL_Hips" -ln "CTRL_Hips" -at "message";
	addAttr -ci true -sn "CTRL_Chest" -ln "CTRL_Chest" -at "message";
	addAttr -ci true -sn "CTRL_Head" -ln "CTRL_Head" -at "message";
	addAttr -ci true -sn "SpineSupport" -ln "SpineSupport" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSubSystem";
	setAttr -l on ".mNodeID" -type "string" "SpineSystem";
	setAttr ".systemType" -type "string" "Spine";
	setAttr -k on ".mirrorSide";
lockNode -l 1 ;
createNode network -n "L_ArmSupport";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "L_ArmSystem" -ln "L_ArmSystem" -at "message";
	addAttr -ci true -sn "SUP_IKHandle" -ln "SUP_IKHandle" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSupport";
	setAttr -l on ".mNodeID" -type "string" "L_ArmSupport";
createNode network -n "R_ArmSupport";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "R_ArmSystem" -ln "R_ArmSystem" -at "message";
	addAttr -ci true -sn "SUP_IKHandle" -ln "SUP_IKHandle" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSupport";
	setAttr -l on ".mNodeID" -type "string" "R_ArmSupport";
createNode network -n "L_LegSupport";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "L_LegSystem" -ln "L_LegSystem" -at "message";
	addAttr -ci true -sn "SUP_IKHandle" -ln "SUP_IKHandle" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSupport";
	setAttr -l on ".mNodeID" -type "string" "L_LegSupport";
createNode network -n "R_LegSupport";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "R_LegSystem" -ln "R_LegSystem" -at "message";
	addAttr -ci true -sn "SUP_IKHandle" -ln "SUP_IKHandle" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSupport";
	setAttr -l on ".mNodeID" -type "string" "R_LegSupport";
createNode network -n "SpineSupport";
	addAttr -ci true -sn "mClass" -ln "mClass" -dt "string";
	addAttr -ci true -sn "mNodeID" -ln "mNodeID" -dt "string";
	addAttr -ci true -sn "SpineSystem" -ln "SpineSystem" -at "message";
	addAttr -ci true -sn "SUP_NeckIK" -ln "SUP_NeckIK" -at "message";
	addAttr -ci true -sn "SUP_SpineIK" -ln "SUP_SpineIK" -at "message";
	setAttr -l on ".mClass" -type "string" "MetaRigSupport";
	setAttr -l on ".mNodeID" -type "string" "SpineSupport";
select -ne :time1;
	addAttr -ci true -sn "sceneReport" -ln "sceneReport" -dt "string";
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 0;
	setAttr ".sceneReport" -type "string" "{\"date\": \"Sun Nov 25 20:40:27 2012\", \"comment\": \"This is a test rig only\\n========================\\nDesigned to be run in the Red9 unittests as well \\nas showing how the MetaRig wiring is designed to run.\\nTo see the calls that wire the setup see here:\\n\\nP:\\\\Red9_Pipeline\\\\RedNine\\\\Red9\\\\tests\\\\Red9_MetaTests.py\\n\\nTest_MetaRig().addMetaRig()\\n\\nThere's a second file that goes with this,\\nMetaRig_baseTests_MetaWired.ma which has the setup \\nalready added. I suggest you load that file, open the\\nMetaNodeUI and explore!\\n\\nRed\", \"author\": \"Red\", \"history\": \"\"}";
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 8 ".st";
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
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -cb on ".mica";
	setAttr -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :initialParticleSE;
	setAttr -k on ".cch";
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
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -cb on ".micc";
	setAttr -cb on ".mica";
	setAttr -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 8 ".s";
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
select -ne :defaultRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".macc";
	setAttr -k on ".macd";
	setAttr -k on ".macq";
	setAttr ".mcfr" 30;
	setAttr -cb on ".ifg";
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr -k on ".edl";
	setAttr -cb on ".ren";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -k on ".outf";
	setAttr -cb on ".imfkey";
	setAttr -k on ".gama";
	setAttr -cb on ".ar";
	setAttr ".fs" 1;
	setAttr ".ef" 10;
	setAttr -av ".bfs";
	setAttr -cb on ".me";
	setAttr -cb on ".se";
	setAttr -k on ".be";
	setAttr -cb on ".ep";
	setAttr -k on ".fec";
	setAttr -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -cb on ".peie";
	setAttr -cb on ".ifp";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -k on ".sp";
	setAttr -k on ".shs";
	setAttr -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -av -k on ".mbf";
	setAttr -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -cb on ".prm";
	setAttr -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -k on ".bls";
	setAttr -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -k on ".ope";
	setAttr -k on ".oppf";
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
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off ".eeaa";
	setAttr -k off ".engm";
	setAttr -k off ".mes";
	setAttr -k off ".emb";
	setAttr -k off ".mbbf";
	setAttr -k off ".mbs";
	setAttr -k off ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off ".twa";
	setAttr -k off ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr ".hwfr" 30;
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
	setAttr -av -k on ".mb";
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
select -ne :ikSystem;
	setAttr -av ".gsn";
	setAttr -s 2 ".sol";
connectAttr "RED_Rig.CTRL_Main" "World_Ctrl.RED_Rig";
connectAttr "transformGeometry2.og" "World_CtrlShape.cr";
connectAttr "SpineSystem.CTRL_Root" "COG__Ctrl.SpineSystem";
connectAttr "SpineSystem.CTRL_Hips" "Hips_Ctrl.SpineSystem";
connectAttr "SpineSystem.CTRL_Chest" "Chest_Ctrl.SpineSystem";
connectAttr "R_ArmSystem.CTRL_R_Clav" "R_Clav_Ctrl.R_ArmSystem";
connectAttr "L_ArmSystem.CTRL_L_Clav" "L_Clav_Ctrl.L_ArmSystem";
connectAttr "Character1_Spine.msg" "ikHandle4.hsj";
connectAttr "effector4.hp" "ikHandle4.hee";
connectAttr "ikSCsolver2.msg" "ikHandle4.hsv";
connectAttr "SpineSupport.SUP_SpineIK" "ikHandle4.SpineSupport";
connectAttr "SpineSystem.CTRL_Head" "Head_Ctrl.SpineSystem";
connectAttr "Character1_Neck.msg" "ikHandle3.hsj";
connectAttr "effector3.hp" "ikHandle3.hee";
connectAttr "ikSCsolver2.msg" "ikHandle3.hsv";
connectAttr "SpineSupport.SUP_NeckIK" "ikHandle3.SpineSupport";
connectAttr "L_ArmSystem.CTRL_L_Elbow" "L_Elbow_Ctrl.L_ArmSystem";
connectAttr "R_ArmSystem.CTRL_R_Elbow" "R_Elbow_Ctrl.R_ArmSystem";
connectAttr "L_ArmSystem.CTRL_L_Wrist" "L_Wrist_Ctrl.L_ArmSystem";
connectAttr "Character1_LeftArm.msg" "ikHandle1.hsj";
connectAttr "effector1.hp" "ikHandle1.hee";
connectAttr "ikRPsolver2.msg" "ikHandle1.hsv";
connectAttr "ikHandle1_poleVectorConstraint1.ctx" "ikHandle1.pvx";
connectAttr "ikHandle1_poleVectorConstraint1.cty" "ikHandle1.pvy";
connectAttr "ikHandle1_poleVectorConstraint1.ctz" "ikHandle1.pvz";
connectAttr "L_ArmSupport.SUP_IKHandle" "ikHandle1.L_ArmSupport";
connectAttr "ikHandle1.pim" "ikHandle1_poleVectorConstraint1.cpim";
connectAttr "Character1_LeftArm.pm" "ikHandle1_poleVectorConstraint1.ps";
connectAttr "Character1_LeftArm.t" "ikHandle1_poleVectorConstraint1.crp";
connectAttr "L_Elbow_Ctrl.t" "ikHandle1_poleVectorConstraint1.tg[0].tt";
connectAttr "L_Elbow_Ctrl.rp" "ikHandle1_poleVectorConstraint1.tg[0].trp";
connectAttr "L_Elbow_Ctrl.rpt" "ikHandle1_poleVectorConstraint1.tg[0].trt";
connectAttr "L_Elbow_Ctrl.pm" "ikHandle1_poleVectorConstraint1.tg[0].tpm";
connectAttr "ikHandle1_poleVectorConstraint1.w0" "ikHandle1_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "R_ArmSystem.CTRL_R_Wrist" "R_Wrist_Ctrl.R_ArmSystem";
connectAttr "Character1_RightArm.msg" "ikHandle2.hsj";
connectAttr "effector2.hp" "ikHandle2.hee";
connectAttr "ikRPsolver2.msg" "ikHandle2.hsv";
connectAttr "ikHandle2_poleVectorConstraint1.ctx" "ikHandle2.pvx";
connectAttr "ikHandle2_poleVectorConstraint1.cty" "ikHandle2.pvy";
connectAttr "ikHandle2_poleVectorConstraint1.ctz" "ikHandle2.pvz";
connectAttr "R_ArmSupport.SUP_IKHandle" "ikHandle2.R_ArmSupport";
connectAttr "ikHandle2.pim" "ikHandle2_poleVectorConstraint1.cpim";
connectAttr "Character1_RightArm.pm" "ikHandle2_poleVectorConstraint1.ps";
connectAttr "Character1_RightArm.t" "ikHandle2_poleVectorConstraint1.crp";
connectAttr "R_Elbow_Ctrl.t" "ikHandle2_poleVectorConstraint1.tg[0].tt";
connectAttr "R_Elbow_Ctrl.rp" "ikHandle2_poleVectorConstraint1.tg[0].trp";
connectAttr "R_Elbow_Ctrl.rpt" "ikHandle2_poleVectorConstraint1.tg[0].trt";
connectAttr "R_Elbow_Ctrl.pm" "ikHandle2_poleVectorConstraint1.tg[0].tpm";
connectAttr "ikHandle2_poleVectorConstraint1.w0" "ikHandle2_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "L_LegSystem.CTRL_L_Knee" "L_Knee_Ctrl.L_LegSystem";
connectAttr "R_LegSystem.CTRL_R_Knee" "R_Knee_Ctrl.R_LegSystem";
connectAttr "L_LegSystem.CTRL_L_Foot" "L_Foot_Ctrl.L_LegSystem";
connectAttr "Character1_LeftUpLeg.msg" "ikHandle5.hsj";
connectAttr "effector5.hp" "ikHandle5.hee";
connectAttr "ikRPsolver2.msg" "ikHandle5.hsv";
connectAttr "ikHandle5_poleVectorConstraint1.ctx" "ikHandle5.pvx";
connectAttr "ikHandle5_poleVectorConstraint1.cty" "ikHandle5.pvy";
connectAttr "ikHandle5_poleVectorConstraint1.ctz" "ikHandle5.pvz";
connectAttr "L_LegSupport.SUP_IKHandle" "ikHandle5.L_LegSupport";
connectAttr "ikHandle5.pim" "ikHandle5_poleVectorConstraint1.cpim";
connectAttr "Character1_LeftUpLeg.pm" "ikHandle5_poleVectorConstraint1.ps";
connectAttr "Character1_LeftUpLeg.t" "ikHandle5_poleVectorConstraint1.crp";
connectAttr "L_Knee_Ctrl.t" "ikHandle5_poleVectorConstraint1.tg[0].tt";
connectAttr "L_Knee_Ctrl.rp" "ikHandle5_poleVectorConstraint1.tg[0].trp";
connectAttr "L_Knee_Ctrl.rpt" "ikHandle5_poleVectorConstraint1.tg[0].trt";
connectAttr "L_Knee_Ctrl.pm" "ikHandle5_poleVectorConstraint1.tg[0].tpm";
connectAttr "ikHandle5_poleVectorConstraint1.w0" "ikHandle5_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "R_LegSystem.CTRL_R_Foot" "R_Foot_Ctrl.R_LegSystem";
connectAttr "Character1_RightUpLeg.msg" "ikHandle6.hsj";
connectAttr "effector6.hp" "ikHandle6.hee";
connectAttr "ikRPsolver2.msg" "ikHandle6.hsv";
connectAttr "ikHandle6_poleVectorConstraint1.ctx" "ikHandle6.pvx";
connectAttr "ikHandle6_poleVectorConstraint1.cty" "ikHandle6.pvy";
connectAttr "ikHandle6_poleVectorConstraint1.ctz" "ikHandle6.pvz";
connectAttr "R_LegSupport.SUP_IKHandle" "ikHandle6.R_LegSupport";
connectAttr "ikHandle6.pim" "ikHandle6_poleVectorConstraint1.cpim";
connectAttr "Character1_RightUpLeg.pm" "ikHandle6_poleVectorConstraint1.ps";
connectAttr "Character1_RightUpLeg.t" "ikHandle6_poleVectorConstraint1.crp";
connectAttr "R_Knee_Ctrl.t" "ikHandle6_poleVectorConstraint1.tg[0].tt";
connectAttr "R_Knee_Ctrl.rp" "ikHandle6_poleVectorConstraint1.tg[0].trp";
connectAttr "R_Knee_Ctrl.rpt" "ikHandle6_poleVectorConstraint1.tg[0].trt";
connectAttr "R_Knee_Ctrl.pm" "ikHandle6_poleVectorConstraint1.tg[0].tpm";
connectAttr "ikHandle6_poleVectorConstraint1.w0" "ikHandle6_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "Character1_Hips_orientConstraint1.crx" "Character1_Pelvis.rx";
connectAttr "Character1_Hips_orientConstraint1.cry" "Character1_Pelvis.ry";
connectAttr "Character1_Hips_orientConstraint1.crz" "Character1_Pelvis.rz";
connectAttr "Character1_Hips_pointConstraint1.ctx" "Character1_Pelvis.tx";
connectAttr "Character1_Hips_pointConstraint1.cty" "Character1_Pelvis.ty";
connectAttr "Character1_Hips_pointConstraint1.ctz" "Character1_Pelvis.tz";
connectAttr "Skeleton.di" "Character1_Pelvis.do";
connectAttr "RED_Rig.exportSkeletonRoot" "Character1_Pelvis.RED_Rig";
connectAttr "Character1_Pelvis.s" "Character1_LeftUpLeg.is";
connectAttr "Character1_LeftUpLeg.s" "Character1_LeftLeg.is";
connectAttr "Character1_LeftLeg.s" "Character1_LeftFoot.is";
connectAttr "Character1_LeftFoot_orientConstraint1.crx" "Character1_LeftFoot.rx"
		;
connectAttr "Character1_LeftFoot_orientConstraint1.cry" "Character1_LeftFoot.ry"
		;
connectAttr "Character1_LeftFoot_orientConstraint1.crz" "Character1_LeftFoot.rz"
		;
connectAttr "Character1_LeftFoot.s" "Character1_LeftToeBase.is";
connectAttr "Character1_LeftFoot.ro" "Character1_LeftFoot_orientConstraint1.cro"
		;
connectAttr "Character1_LeftFoot.pim" "Character1_LeftFoot_orientConstraint1.cpim"
		;
connectAttr "Character1_LeftFoot.jo" "Character1_LeftFoot_orientConstraint1.cjo"
		;
connectAttr "L_Foot_Ctrl.r" "Character1_LeftFoot_orientConstraint1.tg[0].tr";
connectAttr "L_Foot_Ctrl.ro" "Character1_LeftFoot_orientConstraint1.tg[0].tro";
connectAttr "L_Foot_Ctrl.pm" "Character1_LeftFoot_orientConstraint1.tg[0].tpm";
connectAttr "Character1_LeftFoot_orientConstraint1.w0" "Character1_LeftFoot_orientConstraint1.tg[0].tw"
		;
connectAttr "Character1_LeftFoot.tx" "effector5.tx" -l on;
connectAttr "Character1_LeftFoot.ty" "effector5.ty" -l on;
connectAttr "Character1_LeftFoot.tz" "effector5.tz" -l on;
connectAttr "Character1_Pelvis.s" "Character1_RightUpLeg.is";
connectAttr "Character1_RightUpLeg.s" "Character1_RightLeg.is";
connectAttr "Character1_RightLeg.s" "Character1_RightFoot.is";
connectAttr "Character1_RightFoot_orientConstraint1.crx" "Character1_RightFoot.rx"
		;
connectAttr "Character1_RightFoot_orientConstraint1.cry" "Character1_RightFoot.ry"
		;
connectAttr "Character1_RightFoot_orientConstraint1.crz" "Character1_RightFoot.rz"
		;
connectAttr "Character1_RightFoot.s" "Character1_RightToeBase.is";
connectAttr "Character1_RightFoot.ro" "Character1_RightFoot_orientConstraint1.cro"
		;
connectAttr "Character1_RightFoot.pim" "Character1_RightFoot_orientConstraint1.cpim"
		;
connectAttr "Character1_RightFoot.jo" "Character1_RightFoot_orientConstraint1.cjo"
		;
connectAttr "R_Foot_Ctrl.r" "Character1_RightFoot_orientConstraint1.tg[0].tr";
connectAttr "R_Foot_Ctrl.ro" "Character1_RightFoot_orientConstraint1.tg[0].tro";
connectAttr "R_Foot_Ctrl.pm" "Character1_RightFoot_orientConstraint1.tg[0].tpm";
connectAttr "Character1_RightFoot_orientConstraint1.w0" "Character1_RightFoot_orientConstraint1.tg[0].tw"
		;
connectAttr "Character1_RightFoot.tx" "effector6.tx" -l on;
connectAttr "Character1_RightFoot.ty" "effector6.ty" -l on;
connectAttr "Character1_RightFoot.tz" "effector6.tz" -l on;
connectAttr "Character1_Pelvis.s" "Character1_Spine.is";
connectAttr "Character1_Spine2_orientConstraint1.crx" "Character1_Spine2.rx";
connectAttr "Character1_Spine2_orientConstraint1.cry" "Character1_Spine2.ry";
connectAttr "Character1_Spine2_orientConstraint1.crz" "Character1_Spine2.rz";
connectAttr "Character1_Spine2.s" "Character1_LeftShoulder.is";
connectAttr "Character1_LeftShoulder_orientConstraint1.crx" "Character1_LeftShoulder.rx"
		;
connectAttr "Character1_LeftShoulder_orientConstraint1.cry" "Character1_LeftShoulder.ry"
		;
connectAttr "Character1_LeftShoulder_orientConstraint1.crz" "Character1_LeftShoulder.rz"
		;
connectAttr "Character1_LeftShoulder.s" "Character1_LeftArm.is";
connectAttr "Character1_LeftArm.s" "Character1_LeftForeArm.is";
connectAttr "Character1_LeftForeArm.s" "Character1_LeftHand.is";
connectAttr "Character1_LeftHand_orientConstraint1.crx" "Character1_LeftHand.rx"
		;
connectAttr "Character1_LeftHand_orientConstraint1.cry" "Character1_LeftHand.ry"
		;
connectAttr "Character1_LeftHand_orientConstraint1.crz" "Character1_LeftHand.rz"
		;
connectAttr "Character1_LeftHand.s" "Character1_LeftHandThumb1.is";
connectAttr "L_Fingers_System.CTRL_ThumbRoot" "Character1_LeftHandThumb1.L_Fingers_System"
		;
connectAttr "Character1_LeftHandThumb1.s" "Character1_LeftHandThumb2.is";
connectAttr "Character1_LeftHandThumb2.s" "Character1_LeftHandThumb3.is";
connectAttr "Character1_LeftHandThumb3.s" "Character1_LeftHandThumb4.is";
connectAttr "Character1_LeftHand.s" "Character1_LeftHandIndex1.is";
connectAttr "L_Fingers_System.CTRL_IndexRoot" "Character1_LeftHandIndex1.L_Fingers_System"
		;
connectAttr "Character1_LeftHandIndex1.s" "Character1_LeftHandIndex2.is";
connectAttr "Character1_LeftHandIndex2.s" "Character1_LeftHandIndex3.is";
connectAttr "Character1_LeftHandIndex3.s" "Character1_LeftHandIndex4.is";
connectAttr "Character1_LeftHand.s" "Character1_LeftHandMiddle1.is";
connectAttr "L_Fingers_System.CTRL_MiddleRoot" "Character1_LeftHandMiddle1.L_Fingers_System"
		;
connectAttr "Character1_LeftHandMiddle1.s" "Character1_LeftHandMiddle2.is";
connectAttr "Character1_LeftHandMiddle2.s" "Character1_LeftHandMiddle3.is";
connectAttr "Character1_LeftHandMiddle3.s" "Character1_LeftHandMiddle4.is";
connectAttr "Character1_LeftHand.s" "Character1_LeftHandRing1.is";
connectAttr "L_Fingers_System.CTRL_RingRoot" "Character1_LeftHandRing1.L_Fingers_System"
		;
connectAttr "Character1_LeftHandRing1.s" "Character1_LeftHandRing2.is";
connectAttr "Character1_LeftHandRing2.s" "Character1_LeftHandRing3.is";
connectAttr "Character1_LeftHandRing3.s" "Character1_LeftHandRing4.is";
connectAttr "Character1_LeftHand.s" "Character1_LeftHandPinky1.is";
connectAttr "L_Fingers_System.CTRL_PinkyRoot" "Character1_LeftHandPinky1.L_Fingers_System"
		;
connectAttr "Character1_LeftHandPinky1.s" "Character1_LeftHandPinky2.is";
connectAttr "Character1_LeftHandPinky2.s" "Character1_LeftHandPinky3.is";
connectAttr "Character1_LeftHandPinky3.s" "Character1_LeftHandPinky4.is";
connectAttr "Character1_LeftHand.ro" "Character1_LeftHand_orientConstraint1.cro"
		;
connectAttr "Character1_LeftHand.pim" "Character1_LeftHand_orientConstraint1.cpim"
		;
connectAttr "Character1_LeftHand.jo" "Character1_LeftHand_orientConstraint1.cjo"
		;
connectAttr "L_Wrist_Ctrl.r" "Character1_LeftHand_orientConstraint1.tg[0].tr";
connectAttr "L_Wrist_Ctrl.ro" "Character1_LeftHand_orientConstraint1.tg[0].tro";
connectAttr "L_Wrist_Ctrl.pm" "Character1_LeftHand_orientConstraint1.tg[0].tpm";
connectAttr "Character1_LeftHand_orientConstraint1.w0" "Character1_LeftHand_orientConstraint1.tg[0].tw"
		;
connectAttr "Character1_LeftHand.tx" "effector1.tx" -l on;
connectAttr "Character1_LeftHand.ty" "effector1.ty" -l on;
connectAttr "Character1_LeftHand.tz" "effector1.tz" -l on;
connectAttr "Character1_LeftShoulder.ro" "Character1_LeftShoulder_orientConstraint1.cro"
		;
connectAttr "Character1_LeftShoulder.pim" "Character1_LeftShoulder_orientConstraint1.cpim"
		;
connectAttr "Character1_LeftShoulder.jo" "Character1_LeftShoulder_orientConstraint1.cjo"
		;
connectAttr "L_Clav_Ctrl.r" "Character1_LeftShoulder_orientConstraint1.tg[0].tr"
		;
connectAttr "L_Clav_Ctrl.ro" "Character1_LeftShoulder_orientConstraint1.tg[0].tro"
		;
connectAttr "L_Clav_Ctrl.pm" "Character1_LeftShoulder_orientConstraint1.tg[0].tpm"
		;
connectAttr "Character1_LeftShoulder_orientConstraint1.w0" "Character1_LeftShoulder_orientConstraint1.tg[0].tw"
		;
connectAttr "Character1_Spine2.s" "Character1_RightShoulder.is";
connectAttr "Character1_RightShoulder_orientConstraint1.crx" "Character1_RightShoulder.rx"
		;
connectAttr "Character1_RightShoulder_orientConstraint1.cry" "Character1_RightShoulder.ry"
		;
connectAttr "Character1_RightShoulder_orientConstraint1.crz" "Character1_RightShoulder.rz"
		;
connectAttr "Character1_RightShoulder.s" "Character1_RightArm.is";
connectAttr "Character1_RightArm.s" "Character1_RightForeArm.is";
connectAttr "Character1_RightForeArm.s" "Character1_RightHand.is";
connectAttr "Character1_RightHand_orientConstraint1.crx" "Character1_RightHand.rx"
		;
connectAttr "Character1_RightHand_orientConstraint1.cry" "Character1_RightHand.ry"
		;
connectAttr "Character1_RightHand_orientConstraint1.crz" "Character1_RightHand.rz"
		;
connectAttr "R_Fingers_System.CTRL_ThumbRoot" "Character1_RightHandThumb1.R_Fingers_System"
		;
connectAttr "Character1_RightHandThumb1.s" "Character1_RightHandThumb2.is";
connectAttr "Character1_RightHandThumb2.s" "Character1_RightHandThumb3.is";
connectAttr "Character1_RightHandThumb3.s" "Character1_RightHandThumb4.is";
connectAttr "R_Fingers_System.CTRL_IndexRoot" "Character1_RightHandIndex1.R_Fingers_System"
		;
connectAttr "Character1_RightHandIndex1.s" "Character1_RightHandIndex2.is";
connectAttr "Character1_RightHandIndex2.s" "Character1_RightHandIndex3.is";
connectAttr "Character1_RightHandIndex3.s" "Character1_RightHandIndex4.is";
connectAttr "R_Fingers_System.CTRL_MiddleRoot" "Character1_RightHandMiddle1.R_Fingers_System"
		;
connectAttr "Character1_RightHandMiddle1.s" "Character1_RightHandMiddle2.is";
connectAttr "Character1_RightHandMiddle2.s" "Character1_RightHandMiddle3.is";
connectAttr "Character1_RightHandMiddle3.s" "Character1_RightHandMiddle4.is";
connectAttr "R_Fingers_System.CTRL_RingRoot" "Character1_RightHandRing1.R_Fingers_System"
		;
connectAttr "Character1_RightHandRing1.s" "Character1_RightHandRing2.is";
connectAttr "Character1_RightHandRing2.s" "Character1_RightHandRing3.is";
connectAttr "Character1_RightHandRing3.s" "Character1_RightHandRing4.is";
connectAttr "R_Fingers_System.CTRL_PinkyRoot" "Character1_RightHandPinky1.R_Fingers_System"
		;
connectAttr "Character1_RightHandPinky1.s" "Character1_RightHandPinky2.is";
connectAttr "Character1_RightHandPinky2.s" "Character1_RightHandPinky3.is";
connectAttr "Character1_RightHandPinky3.s" "Character1_RightHandPinky4.is";
connectAttr "Character1_RightHand.ro" "Character1_RightHand_orientConstraint1.cro"
		;
connectAttr "Character1_RightHand.pim" "Character1_RightHand_orientConstraint1.cpim"
		;
connectAttr "Character1_RightHand.jo" "Character1_RightHand_orientConstraint1.cjo"
		;
connectAttr "R_Wrist_Ctrl.r" "Character1_RightHand_orientConstraint1.tg[0].tr";
connectAttr "R_Wrist_Ctrl.ro" "Character1_RightHand_orientConstraint1.tg[0].tro"
		;
connectAttr "R_Wrist_Ctrl.pm" "Character1_RightHand_orientConstraint1.tg[0].tpm"
		;
connectAttr "Character1_RightHand_orientConstraint1.w0" "Character1_RightHand_orientConstraint1.tg[0].tw"
		;
connectAttr "Character1_RightHand.tx" "effector2.tx" -l on;
connectAttr "Character1_RightHand.ty" "effector2.ty" -l on;
connectAttr "Character1_RightHand.tz" "effector2.tz" -l on;
connectAttr "Character1_RightShoulder.ro" "Character1_RightShoulder_orientConstraint1.cro"
		;
connectAttr "Character1_RightShoulder.pim" "Character1_RightShoulder_orientConstraint1.cpim"
		;
connectAttr "Character1_RightShoulder.jo" "Character1_RightShoulder_orientConstraint1.cjo"
		;
connectAttr "R_Clav_Ctrl.r" "Character1_RightShoulder_orientConstraint1.tg[0].tr"
		;
connectAttr "R_Clav_Ctrl.ro" "Character1_RightShoulder_orientConstraint1.tg[0].tro"
		;
connectAttr "R_Clav_Ctrl.pm" "Character1_RightShoulder_orientConstraint1.tg[0].tpm"
		;
connectAttr "Character1_RightShoulder_orientConstraint1.w0" "Character1_RightShoulder_orientConstraint1.tg[0].tw"
		;
connectAttr "Character1_Spine2.s" "Character1_Neck.is";
connectAttr "Character1_Neck.s" "Character1_Head.is";
connectAttr "Character1_Head_orientConstraint1.crx" "Character1_Head.rx";
connectAttr "Character1_Head_orientConstraint1.cry" "Character1_Head.ry";
connectAttr "Character1_Head_orientConstraint1.crz" "Character1_Head.rz";
connectAttr "Character1_Head.ro" "Character1_Head_orientConstraint1.cro";
connectAttr "Character1_Head.pim" "Character1_Head_orientConstraint1.cpim";
connectAttr "Character1_Head.jo" "Character1_Head_orientConstraint1.cjo";
connectAttr "Head_Ctrl.r" "Character1_Head_orientConstraint1.tg[0].tr";
connectAttr "Head_Ctrl.ro" "Character1_Head_orientConstraint1.tg[0].tro";
connectAttr "Head_Ctrl.pm" "Character1_Head_orientConstraint1.tg[0].tpm";
connectAttr "Character1_Head_orientConstraint1.w0" "Character1_Head_orientConstraint1.tg[0].tw"
		;
connectAttr "Character1_Head.tx" "effector3.tx" -l on;
connectAttr "Character1_Head.ty" "effector3.ty" -l on;
connectAttr "Character1_Head.tz" "effector3.tz" -l on;
connectAttr "Character1_Spine2.ro" "Character1_Spine2_orientConstraint1.cro";
connectAttr "Character1_Spine2.pim" "Character1_Spine2_orientConstraint1.cpim";
connectAttr "Character1_Spine2.jo" "Character1_Spine2_orientConstraint1.cjo";
connectAttr "Chest_Ctrl.r" "Character1_Spine2_orientConstraint1.tg[0].tr";
connectAttr "Chest_Ctrl.ro" "Character1_Spine2_orientConstraint1.tg[0].tro";
connectAttr "Chest_Ctrl.pm" "Character1_Spine2_orientConstraint1.tg[0].tpm";
connectAttr "Character1_Spine2_orientConstraint1.w0" "Character1_Spine2_orientConstraint1.tg[0].tw"
		;
connectAttr "Character1_Spine2.tx" "effector4.tx" -l on;
connectAttr "Character1_Spine2.ty" "effector4.ty" -l on;
connectAttr "Character1_Spine2.tz" "effector4.tz" -l on;
connectAttr "Character1_Pelvis.ro" "Character1_Hips_orientConstraint1.cro";
connectAttr "Character1_Pelvis.pim" "Character1_Hips_orientConstraint1.cpim";
connectAttr "Character1_Pelvis.jo" "Character1_Hips_orientConstraint1.cjo";
connectAttr "Hips_Ctrl.r" "Character1_Hips_orientConstraint1.tg[0].tr";
connectAttr "Hips_Ctrl.ro" "Character1_Hips_orientConstraint1.tg[0].tro";
connectAttr "Hips_Ctrl.pm" "Character1_Hips_orientConstraint1.tg[0].tpm";
connectAttr "Character1_Hips_orientConstraint1.w0" "Character1_Hips_orientConstraint1.tg[0].tw"
		;
connectAttr "Character1_Pelvis.pim" "Character1_Hips_pointConstraint1.cpim";
connectAttr "Character1_Pelvis.rp" "Character1_Hips_pointConstraint1.crp";
connectAttr "Character1_Pelvis.rpt" "Character1_Hips_pointConstraint1.crt";
connectAttr "Hips_Ctrl.t" "Character1_Hips_pointConstraint1.tg[0].tt";
connectAttr "Hips_Ctrl.rp" "Character1_Hips_pointConstraint1.tg[0].trp";
connectAttr "Hips_Ctrl.rpt" "Character1_Hips_pointConstraint1.tg[0].trt";
connectAttr "Hips_Ctrl.pm" "Character1_Hips_pointConstraint1.tg[0].tpm";
connectAttr "Character1_Hips_pointConstraint1.w0" "Character1_Hips_pointConstraint1.tg[0].tw"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LeftProxySG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "RightProxySG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "CentreProxySG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LeftProxySG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "RightProxySG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "CentreProxySG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LeftProxySG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "RightProxySG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "CentreProxySG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LeftProxySG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "RightProxySG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "CentreProxySG1.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "hyperView1.msg" "nodeEditorPanel2Info.b[0]";
connectAttr "LeftProxy.oc" "LeftProxySG.ss";
connectAttr "Character1_LeftFoot_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftLeg_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftUpLeg_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHand_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandThumb2_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandThumb3_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandThumb1_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandIndex2_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandIndex3_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandIndex1_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandMiddle2_LowProxyShape.iog" "LeftProxySG.dsm" -na
		;
connectAttr "Character1_LeftHandMiddle3_LowProxyShape.iog" "LeftProxySG.dsm" -na
		;
connectAttr "Character1_LeftHandMiddle1_LowProxyShape.iog" "LeftProxySG.dsm" -na
		;
connectAttr "Character1_LeftHandRing2_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandRing3_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandRing1_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandPinky2_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandPinky3_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftHandPinky1_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftForeArm_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "Character1_LeftArm_LowProxyShape.iog" "LeftProxySG.dsm" -na;
connectAttr "LeftProxySG.msg" "materialInfo1.sg";
connectAttr "LeftProxy.msg" "materialInfo1.m";
connectAttr "RightProxy.oc" "RightProxySG.ss";
connectAttr "Character1_RightFoot_LowProxyShape.iog" "RightProxySG.dsm" -na;
connectAttr "Character1_RightLeg_LowProxyShape.iog" "RightProxySG.dsm" -na;
connectAttr "Character1_RightUpLeg_LowProxyShape.iog" "RightProxySG.dsm" -na;
connectAttr "Character1_RightHand_LowProxyShape.iog" "RightProxySG.dsm" -na;
connectAttr "Character1_RightForeArm_LowProxyShape.iog" "RightProxySG.dsm" -na;
connectAttr "Character1_RightArm_LowProxyShape.iog" "RightProxySG.dsm" -na;
connectAttr "RightProxySG.msg" "materialInfo2.sg";
connectAttr "RightProxy.msg" "materialInfo2.m";
connectAttr "CentreProxy.oc" "CentreProxySG.ss";
connectAttr "Character1_Spine2_LowProxyShape.iog" "CentreProxySG.dsm" -na;
connectAttr "Character1_Neck_LowProxyShape.iog" "CentreProxySG.dsm" -na;
connectAttr "Character1_Head_LowProxyShape.iog" "CentreProxySG.dsm" -na;
connectAttr "Character1_Spine_LowProxyShape.iog" "CentreProxySG.dsm" -na;
connectAttr "Character1_Spine2_LowProxy1Shape.iog" "CentreProxySG.dsm" -na;
connectAttr "CentreProxySG.msg" "materialInfo3.sg";
connectAttr "CentreProxy.msg" "materialInfo3.m";
connectAttr "hyperView2.msg" "nodeEditorPanel2Info1.b[0]";
connectAttr "makeNurbCircle1.oc" "transformGeometry1.ig";
connectAttr "transformGeometry1.og" "transformGeometry2.ig";
connectAttr "hyperView3.msg" "nodeEditorPanel2Info2.b[0]";
connectAttr "hyperView4.msg" "nodeEditorPanel2Info3.b[0]";
connectAttr "LeftProxy1.oc" "LeftProxySG1.ss";
connectAttr "LeftProxySG1.msg" "materialInfo4.sg";
connectAttr "LeftProxy1.msg" "materialInfo4.m";
connectAttr "RightProxy1.oc" "RightProxySG1.ss";
connectAttr "Character1_RightHandThumb2_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandThumb3_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandThumb1_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandIndex2_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandIndex3_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandIndex1_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandMiddle2_LowProxyShape.iog" "RightProxySG1.dsm" 
		-na;
connectAttr "Character1_RightHandMiddle3_LowProxyShape.iog" "RightProxySG1.dsm" 
		-na;
connectAttr "Character1_RightHandMiddle1_LowProxyShape.iog" "RightProxySG1.dsm" 
		-na;
connectAttr "Character1_RightHandRing2_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandRing3_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandRing1_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandPinky2_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandPinky3_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "Character1_RightHandPinky1_LowProxyShape.iog" "RightProxySG1.dsm" -na
		;
connectAttr "RightProxySG1.msg" "materialInfo5.sg";
connectAttr "RightProxy1.msg" "materialInfo5.m";
connectAttr "CentreProxy1.oc" "CentreProxySG1.ss";
connectAttr "CentreProxySG1.msg" "materialInfo6.sg";
connectAttr "CentreProxy1.msg" "materialInfo6.m";
connectAttr "hyperView5.msg" "nodeEditorPanel2Info4.b[0]";
connectAttr "hyperView6.msg" "nodeEditorPanel2Info5.b[0]";
connectAttr "layerManager.dli[2]" "Skeleton.id";
connectAttr "RED_Rig.L_ArmSystem" "L_ArmSystem.RED_Rig";
connectAttr "L_ArmSystem.L_Fingers_System" "L_Fingers_System.L_ArmSystem";
connectAttr "RED_Rig.L_Leg_System" "L_LegSystem.RED_Rig";
connectAttr "RED_Rig.R_ArmSystem" "R_ArmSystem.RED_Rig";
connectAttr "R_ArmSystem.R_Fingers_System" "R_Fingers_System.R_ArmSystem";
connectAttr "RED_Rig.R_LegSystem" "R_LegSystem.RED_Rig";
connectAttr "RED_Rig.SpineSystem" "SpineSystem.RED_Rig";
connectAttr "L_ArmSystem.L_ArmSupport" "L_ArmSupport.L_ArmSystem";
connectAttr "R_ArmSystem.R_ArmSupport" "R_ArmSupport.R_ArmSystem";
connectAttr "L_LegSystem.L_LegSupport" "L_LegSupport.L_LegSystem";
connectAttr "R_LegSystem.R_LegSupport" "R_LegSupport.R_LegSystem";
connectAttr "SpineSystem.SpineSupport" "SpineSupport.SpineSystem";
connectAttr "LeftProxySG.pa" ":renderPartition.st" -na;
connectAttr "RightProxySG.pa" ":renderPartition.st" -na;
connectAttr "CentreProxySG.pa" ":renderPartition.st" -na;
connectAttr "LeftProxySG1.pa" ":renderPartition.st" -na;
connectAttr "RightProxySG1.pa" ":renderPartition.st" -na;
connectAttr "CentreProxySG1.pa" ":renderPartition.st" -na;
connectAttr "LeftProxy.msg" ":defaultShaderList1.s" -na;
connectAttr "RightProxy.msg" ":defaultShaderList1.s" -na;
connectAttr "CentreProxy.msg" ":defaultShaderList1.s" -na;
connectAttr "LeftProxy1.msg" ":defaultShaderList1.s" -na;
connectAttr "RightProxy1.msg" ":defaultShaderList1.s" -na;
connectAttr "CentreProxy1.msg" ":defaultShaderList1.s" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "ikRPsolver2.msg" ":ikSystem.sol" -na;
connectAttr "ikSCsolver2.msg" ":ikSystem.sol" -na;
// End of MetaRig_baseTests_MetaWired.ma
