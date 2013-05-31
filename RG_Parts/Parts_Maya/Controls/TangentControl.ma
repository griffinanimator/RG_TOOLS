//Maya ASCII 2012 scene
//Name: TangentControl.ma
//Last modified: Tue, Jul 03, 2012 09:32:30 PM
//Codeset: 1252
requires maya "2012";
requires "Mayatomr" "2012.0m - 3.9.1.36 ";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 x64";
fileInfo "cutIdentifier" "001200000000-796618";
fileInfo "osv" "Microsoft Windows 7 Home Premium Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -n "grp_control";
createNode transform -n "control_tanA" -p "grp_control";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".t" -type "double3" 0 1.0317461224268953 7.9378130519953931 ;
	setAttr ".s" -type "double3" 0.61501561178890762 0.61501561178890762 0.61501561178890762 ;
createNode nurbsCurve -n "control_tanAShape" -p "control_tanA";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 25 0 no 3
		26 0 0.37689 0.75376699999999996 1.130657 1.5075460000000001 1.884423 2.2613129999999999
		 2.6382029999999999 3.0150800000000002 3.3919700000000002 3.768859 4.1457369999999996
		 4.5226249999999997 4.8995129999999998 5.2763910000000003 5.6532799999999996 6.0301710000000002
		 6.4070470000000004 6.7839369999999999 7.1608270000000003 7.5377039999999997 7.9145940000000001
		 8.2914840000000005 8.6683610000000009 9.0452510000000004 19.157319000000001
		26
		0 10.112068000000001 0
		-0.37349300000000002 10.162557 0
		-0.72168200000000005 10.306782 0
		-1.021482 10.53518 0
		-1.2498800000000001 10.83498 0
		-1.3941049999999999 11.183168999999999 0
		-1.4445939999999999 11.556661999999999 0
		-1.3941049999999999 11.930154999999999 0
		-1.2498800000000001 12.278343 0
		-1.021482 12.578144 0
		-0.72168200000000005 12.806540999999999 0
		-0.37349300000000002 12.950768 0
		0 13.001244 0
		0.37349300000000002 12.950768 0
		0.72168200000000005 12.806540999999999 0
		1.021482 12.578144 0
		1.2498800000000001 12.278343 0
		1.3941049999999999 11.930154999999999 0
		1.4445939999999999 11.556661999999999 0
		1.3941049999999999 11.183168999999999 0
		1.2498800000000001 10.83498 0
		1.021482 10.53518 0
		0.72168200000000005 10.306782 0
		0.37349300000000002 10.162557 0
		0 10.112068000000001 0
		0 0 0
		;
createNode transform -n "curve1" -p "grp_control";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".t" -type "double3" -3.8822913064503284e-008 0.034859754752525118 7.9389389974842235 ;
	setAttr ".r" -type "double3" -6.4751654299238208e-006 -1.4828390171840298e-006 5.1772620119054642e-007 ;
createNode nurbsCurve -n "curveShape1" -p "curve1";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 52 0 no 3
		53 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52
		53
		0 1 0
		0 0.92388000000000003 0.382683
		0 0.70710700000000004 0.70710700000000004
		0 0.382683 0.92388000000000003
		0 0 1
		0 -0.382683 0.92388000000000003
		0 -0.70710700000000004 0.70710700000000004
		0 -0.92388000000000003 0.382683
		0 -1 0
		0 -0.92388000000000003 -0.382683
		0 -0.70710700000000004 -0.70710700000000004
		0 -0.382683 -0.92388000000000003
		0 0 -1
		0 0.382683 -0.92388000000000003
		0 0.70710700000000004 -0.70710700000000004
		0 0.92388000000000003 -0.382683
		0 1 0
		0.382683 0.92388000000000003 0
		0.70710700000000004 0.70710700000000004 0
		0.92388000000000003 0.382683 0
		1 0 0
		0.92388000000000003 -0.382683 0
		0.70710700000000004 -0.70710700000000004 0
		0.382683 -0.92388000000000003 0
		0 -1 0
		-0.382683 -0.92388000000000003 0
		-0.70710700000000004 -0.70710700000000004 0
		-0.92388000000000003 -0.382683 0
		-1 0 0
		-0.92388000000000003 0.382683 0
		-0.70710700000000004 0.70710700000000004 0
		-0.382683 0.92388000000000003 0
		0 1 0
		0 0.92388000000000003 -0.382683
		0 0.70710700000000004 -0.70710700000000004
		0 0.382683 -0.92388000000000003
		0 0 -1
		-0.382683 0 -0.92388000000000003
		-0.70710700000000004 0 -0.70710700000000004
		-0.92388000000000003 0 -0.382683
		-1 0 0
		-0.92388000000000003 0 0.382683
		-0.70710700000000004 0 0.70710700000000004
		-0.382683 0 0.92388000000000003
		0 0 1
		0.382683 0 0.92388000000000003
		0.70710700000000004 0 0.70710700000000004
		0.92388000000000003 0 0.382683
		1 0 0
		0.92388000000000003 0 -0.382683
		0.70710700000000004 0 -0.70710700000000004
		0.382683 0 -0.92388000000000003
		0 0 -1
		;
createNode transform -n "control_tanA1" -p "grp_control";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".t" -type "double3" -3.205936995358393e-016 -0.96577311658141163 7.9388571142265052 ;
	setAttr ".r" -type "double3" 0 0 180 ;
	setAttr ".s" -type "double3" 0.61501561178890762 0.61501561178890762 0.61501561178890762 ;
createNode nurbsCurve -n "control_tanAShape1" -p "control_tanA1";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 25 0 no 3
		26 0 0.37689 0.75376699999999996 1.130657 1.5075460000000001 1.884423 2.2613129999999999
		 2.6382029999999999 3.0150800000000002 3.3919700000000002 3.768859 4.1457369999999996
		 4.5226249999999997 4.8995129999999998 5.2763910000000003 5.6532799999999996 6.0301710000000002
		 6.4070470000000004 6.7839369999999999 7.1608270000000003 7.5377039999999997 7.9145940000000001
		 8.2914840000000005 8.6683610000000009 9.0452510000000004 19.157319000000001
		26
		0 10.112068000000001 0
		-0.37349300000000002 10.162557 0
		-0.72168200000000005 10.306782 0
		-1.021482 10.53518 0
		-1.2498800000000001 10.83498 0
		-1.3941049999999999 11.183168999999999 0
		-1.4445939999999999 11.556661999999999 0
		-1.3941049999999999 11.930154999999999 0
		-1.2498800000000001 12.278343 0
		-1.021482 12.578144 0
		-0.72168200000000005 12.806540999999999 0
		-0.37349300000000002 12.950768 0
		0 13.001244 0
		0.37349300000000002 12.950768 0
		0.72168200000000005 12.806540999999999 0
		1.021482 12.578144 0
		1.2498800000000001 12.278343 0
		1.3941049999999999 11.930154999999999 0
		1.4445939999999999 11.556661999999999 0
		1.3941049999999999 11.183168999999999 0
		1.2498800000000001 10.83498 0
		1.021482 10.53518 0
		0.72168200000000005 10.306782 0
		0.37349300000000002 10.162557 0
		0 10.112068000000001 0
		0 0 0
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
	setAttr -s 4 ".st";
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
	setAttr -s 4 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 19 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultLightSet;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -k on ".mwc";
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
	setAttr -k on ".es";
	setAttr -av -k on ".ef";
	setAttr -k on ".bf";
	setAttr -k on ".fii";
	setAttr -k on ".sf";
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
	setAttr -s 4 ".sol";
// End of TangentControl.ma
