//Maya ASCII 2011 scene
//Name: PivotControl.ma
//Last modified: Mon, Aug 19, 2013 01:43:48 PM
//Codeset: 1252
requires maya "2011";
requires "stereoCamera" "10.0";
currentUnit -l foot -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2011";
fileInfo "version" "2011 x64";
fileInfo "cutIdentifier" "201003190311-771506";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -n "curve4";
	setAttr ".ove" yes;
	setAttr ".ovc" 21;
createNode nurbsCurve -n "curveShape10" -p "curve4";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 25 0 no 3
		26 0 0.37689 0.75376699999999996 1.130657 1.5075460000000001 1.884423 2.2613129999999999
		 2.6382029999999999 3.0150800000000002 3.3919700000000002 3.768859 4.1457369999999996
		 4.5226249999999997 4.8995129999999998 5.2763910000000003 5.6532799999999996 6.0301710000000002
		 6.4070470000000004 6.7839369999999999 7.1608270000000003 7.5377039999999997 7.9145940000000001
		 8.2914840000000005 8.6683610000000009 9.0452510000000004 19.157319000000001
		26
		3.3679952160525775e-015 -2.2453301440350516e-015 10.112068000000001
		3.3848114311396666e-015 0.37349299999999774 10.162557
		3.4328480058576359e-015 0.72168199999999771 10.306782
		3.5089198213711371e-015 1.0214819999999978 10.53518
		3.6087732802059233e-015 1.2498799999999979 10.83498
		3.724743513622286e-015 1.3941049999999973 11.183168999999999
		3.8491416720631826e-015 1.4445939999999975 11.556661999999999
		3.9735398305040801e-015 1.3941049999999973 11.930154999999999
		4.0895097308535354e-015 1.2498799999999974 12.278343
		4.1893635227552293e-015 1.0214819999999973 12.578144
		4.2654350052018224e-015 0.72168199999999727 12.806540999999999
		4.3134722460536072e-015 0.37349299999999713 12.950768
		4.3302841312709005e-015 -2.8868560875139329e-015 13.001244
		4.3134722460536072e-015 -0.37349300000000285 12.950768
		4.2654350052018224e-015 -0.72168200000000293 12.806540999999999
		4.1893635227552293e-015 -1.0214820000000029 12.578144
		4.0895097308535354e-015 -1.249880000000003 12.278343
		3.9735398305040801e-015 -1.3941050000000024 11.930154999999999
		3.8491416720631826e-015 -1.4445940000000026 11.556661999999999
		3.724743513622286e-015 -1.3941050000000024 11.183168999999999
		3.6087732802059233e-015 -1.2498800000000025 10.83498
		3.5089198213711371e-015 -1.0214820000000024 10.53518
		3.4328480058576359e-015 -0.72168200000000238 10.306782
		3.3848114311396666e-015 -0.3734930000000023 10.162557
		3.3679952160525775e-015 -2.2453301440350516e-015 10.112068000000001
		0 0 0
		;
createNode nurbsCurve -n "curveShape13" -p "curve4";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 2 no 3
		5 0 2.4000000000000004 2.7000000000000002 5.1000000000000005 5.4000000000000004
		
		5
		2.7148687907481759e-016 -0.063158359643586903 11.002589987121848
		-7.1067498908774449e-017 -0.063158359643587139 12.031075166482539
		-7.1067498908774449e-017 0.065402287776499243 12.031075166482539
		2.7148687907481759e-016 0.065402287776499479 11.002589987121848
		2.7148687907481759e-016 -0.063158359643586903 11.002589987121848
		;
createNode nurbsCurve -n "curveShape14" -p "curve4";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 17 0 no 3
		20 0 0 2.5465972262240446 2.5465972262240446 2.862220938744072 2.862220938744072
		 4.7243703845511344 4.7243703845511344 5.7243703845511344 5.7243703845511344 6.7243703845511344
		 6.7243703845511344 8.5870430250484198 8.5870430250484198 8.9026682634706376 8.9026682634706376
		 11.449788410853126 11.449788410853126 11.876351316170895 11.876351316170895
		19
		2.6999894413600935e-016 0.54449416001409923 11.007057362612496
		9.8721755144213459e-017 0.36203194118351278 11.521299952292841
		-7.2555433847582968e-017 0.17956972235292629 12.035542541973188
		-7.2555433847582968e-017 0.24719770372410302 12.035542541973188
		-7.2555433847582968e-017 0.31482568509527908 12.035542541973188
		5.2668659541504799e-017 0.44840830943449894 11.659569755089919
		1.7789275293059138e-016 0.58199093377371858 11.283596968206652
		2.0800009512922339e-016 0.61480052907547977 11.193202691468736
		2.3431608753262033e-016 0.63622763059711651 11.114191562414188
		2.0599290994351134e-016 0.65899327206061098 11.199229063771694
		1.778927529305919e-016 0.68979473049796325 11.283596968206648
		5.2668659541505292e-017 0.82371182634683704 11.659569755089917
		-7.255543384758245e-017 0.95762892219571039 12.035542541973186
		-7.255543384758245e-017 1.0252572305185095 12.035542541973186
		-7.255543384758245e-017 1.0928855388413079 12.035542541973186
		9.8721755144213311e-017 0.91008852154944631 11.521299952292839
		2.699989441360099e-016 0.72729150425758271 11.007057362612494
		2.6999894413600935e-016 0.63589283213584114 11.007057362612496
		2.6999894413600935e-016 0.54449416001409923 11.007057362612496
		;
createNode nurbsCurve -n "curveShape12" -p "curve4";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 13 0 no 3
		16 0 0 0.5750011444266423 0.5750011444266423 1.5750011444266423 2.5750011444266425
		 2.5750011444266425 3.5750011444266425 4.5750011444266425 4.5750011444266425 5.5750011444266425
		 5.5750011444266425 6.1437521934843975 6.1437521934843975 6.9437521934843973 6.9437521934843973
		
		15
		8.4448656061561065e-017 -0.75764691766825776 11.564153501432871
		8.4448656061561065e-017 -0.63444271867695812 11.564153501432871
		8.4448656061561065e-017 -0.51123851968565814 11.564153501432871
		8.4448656061561583e-017 -0.3887042445685322 11.56415350143287
		5.3895272710549273e-017 -0.28625787712794043 11.655886972015889
		2.6241156850010779e-017 -0.28625787712794043 11.738915682605739
		6.169522786413154e-018 -0.28625787712794054 11.7991787517321
		-2.2376675378886781e-017 -0.34652029235105469 11.884885850012157
		-2.6837086902693193e-017 -0.39606981071659481 11.898277788463181
		-2.9736136599636037e-017 -0.42820980909580536 11.9069818945531
		-2.9736136599636554e-017 -0.51391690737586293 11.906981894553102
		-2.9736136599635882e-017 -0.6357819125220604 11.906981894553102
		-2.9736136599635882e-017 -0.75764691766825765 11.906981894553102
		2.7356259730961917e-017 -0.75764691766825776 11.735567697992987
		8.4448656061561065e-017 -0.75764691766825776 11.564153501432871
		;
createNode nurbsCurve -n "curveShape11" -p "curve4";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		2 18 0 no 3
		21 0 0 2.4000000000000004 2.4000000000000004 3.2406256198977648 3.2406256198977648
		 4.2406256198977648 4.2406256198977648 5.2406256198977648 6.2406256198977648 7.2406256198977648
		 7.2406256198977648 8.2406256198977648 9.2406256198977648 9.2406256198977648 9.8093766689555206
		 9.8093766689555206 10.809376668955521 10.809376668955521 11.109376668955521 11.109376668955521
		
		20
		2.6999894413600684e-016 -0.88620756508834408 11.007057362612498
		9.8721755144210278e-017 -0.88620756508834397 11.521299952292841
		-7.2555433847585445e-017 -0.88620756508834408 12.035542541973189
		-7.2555433847585655e-017 -0.70608860853506406 12.035542541973188
		-7.2555433847585655e-017 -0.52596965198178347 12.035542541973188
		-7.2555433847584977e-017 -0.43088819678600998 12.035542541973188
		-6.9433363574451541e-017 -0.38066908149791834 12.026168838960716
		-6.5195972626835364e-017 -0.3103627124365374 12.013446497432241
		-4.2002268290104603e-017 -0.21595085416331469 11.943809725293415
		-2.9807392310715901e-019 -0.15769722970785421 11.818597062486083
		2.490303339286961e-017 -0.15769722970785421 11.742933264141046
		6.7722330640817517e-017 -0.15769722970785413 11.614372616720962
		1.2726795330951069e-016 -0.31237150320419066 11.435592854012784
		1.2726795330951017e-016 -0.51391690737586293 11.435592854012784
		1.2726795330951017e-016 -0.6357819125220604 11.435592854012784
		1.2726795330951017e-016 -0.75764691766825776 11.435592854012784
		1.9863344872275901e-016 -0.75764691766825742 11.221325108312639
		2.6999894413600684e-016 -0.75764691766825765 11.007057362612498
		2.6999894413600684e-016 -0.82192724137830109 11.007057362612498
		2.6999894413600684e-016 -0.88620756508834408 11.007057362612498
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
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 96 ".u";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
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
	setAttr -k off ".enpt";
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
select -ne :ikSystem;
	setAttr -av ".gsn";
	setAttr -s 3 ".sol";
// End of PivotControl.ma
