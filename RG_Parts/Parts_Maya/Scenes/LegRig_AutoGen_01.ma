//Maya ASCII 2012 scene
//Name: LegRig_AutoGen_01.ma
//Last modified: Wed, Jul 04, 2012 02:08:07 PM
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
createNode transform -s -n "persp";
	setAttr ".t" -type "double3" 156.10075136284138 21.300847083144632 120.15500439381033 ;
	setAttr ".r" -type "double3" 5.6616472699570233 57.000000000395644 -7.2996849220731622e-016 ;
	setAttr ".rp" -type "double3" 3.5527136788005009e-015 8.8817841970012523e-016 0 ;
	setAttr ".rpt" -type "double3" -1.4034594723835312e-015 -4.3326854788214838e-018 
		-2.8302223345622453e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v";
	setAttr ".ovr" 1.3;
	setAttr ".fl" 34.999999999999979;
	setAttr ".coi" 272.99756696632056;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -50.971584727992145 -1.06615029920945e-014 -64.01514090240623 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".dr" yes;
createNode transform -s -n "top";
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".t" -type "double3" 100.18268001973311 3.6086036155469285 -1.8191798535256816 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 22.107214632762496;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "grp_leg";
createNode transform -n "grp_bendy" -p "grp_leg";
createNode joint -n "joint1" -p "grp_bendy";
	setAttr ".t" -type "double3" -1.5612285073766756 26.245321142593511 -14.206444353095558 ;
	setAttr ".r" -type "double3" -12.667606289688297 -11.523207170236605 95.457015402507224 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999986 -19.65843100167136 -89.999999999999986 ;
	setAttr ".radi" 1.0874853077782873;
createNode joint -n "joint5" -p "joint1";
	setAttr ".t" -type "double3" 2.3320029790974708 -1.301002641085347e-005 4.9709061846659111e-016 ;
	setAttr ".r" -type "double3" 0.56942775590166927 5.0399465225678028 12.884007339057394 ;
	setAttr ".radi" 1.0874853077782873;
createNode joint -n "joint6" -p "joint5";
	setAttr ".t" -type "double3" 3.933778739734425 -6.1985711905521157e-006 8.3852262567770526e-016 ;
	setAttr ".r" -type "double3" 0.92464805407119832 6.3904999079665066 16.449764960459802 ;
	setAttr ".radi" 1.0874853077782873;
createNode joint -n "joint7" -p "joint6";
	setAttr ".t" -type "double3" 3.7759885381737064 1.3484557655374374e-005 8.0489162587682368e-016 ;
	setAttr ".r" -type "double3" 0.21766961242015229 3.1314385821065023 7.9507260685677004 ;
	setAttr ".radi" 1.0874853077782873;
createNode joint -n "joint2" -p "joint7";
	setAttr ".t" -type "double3" 2.4611413106823905 5.7240399438107659e-006 5.2461763584707989e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -70.341568998328611 89.999999999999986 0 ;
	setAttr ".radi" 1.0874853077782873;
createNode ikEffector -n "effector9" -p "joint7";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode transform -n "curve1" -p "grp_bendy";
createNode nurbsCurve -n "curveShape1" -p "curve1";
	setAttr -k off ".v";
	setAttr -s 8 ".iog[0].og";
	setAttr ".tw" yes;
createNode nurbsCurve -n "curveShape1Orig" -p "curve1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		3 2 0 no 3
		7 0 0 0 6.2514557838799494 12.502911567759899 12.502911567759899 12.502911567759899
		
		5
		4.9993955492966169e-015 25.891286247309665 -2.757631809472838
		4.99939554929662e-015 23.928919032290402 -2.0566219211827361
		5.0549869313485241e-015 20.004187474228051 -0.65459413671265909
		5.1104771028883005e-015 16.079470230983251 0.74747371982312261
		5.1104771028883005e-015 14.11710856856587 1.4484991512555265
		;
createNode joint -n "joint8" -p "grp_bendy";
	setAttr ".t" -type "double3" -1.1294570039190195 47.300658242823658 8.996592128785867 ;
	setAttr ".r" -type "double3" 5.0358353021956077 -0.85741036105561275 -160.68679402323912 ;
	setAttr ".jo" -type "double3" -90.000000007447809 27.340109666636778 -90.000000003420581 ;
	setAttr ".radi" 0.98412771591051906;
createNode joint -n "joint9" -p "joint8";
	setAttr ".t" -type "double3" 2.9060055979281678 -1.5302183534515734e-005 -2.5947993673217766e-016 ;
	setAttr ".r" -type "double3" 0.027188545163954986 -0.46156650560988027 -6.7421601358014414 ;
	setAttr ".radi" 0.98412771591051906;
createNode joint -n "joint10" -p "joint9";
	setAttr ".t" -type "double3" 3.3590505051904094 2.0109502463228068e-006 -7.8693403456467777e-016 ;
	setAttr ".r" -type "double3" 0.061715180407308709 -0.6938606363039076 -10.165339577389959 ;
	setAttr ".radi" 0.98412771591051906;
createNode joint -n "joint11" -p "joint10";
	setAttr ".t" -type "double3" 3.3134046924465252 8.5645785725674273e-006 2.258788729843632e-016 ;
	setAttr ".r" -type "double3" 0.031303445267040653 -0.49513281166175227 -7.2349357665336651 ;
	setAttr ".radi" 0.98412771591051906;
createNode joint -n "joint4" -p "joint11";
	setAttr ".t" -type "double3" 2.4781659566840197 9.4158892078866888e-006 4.6078667779845561e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 62.659890333363215 -89.999999999999972 0 ;
	setAttr ".radi" 0.98412771591051906;
createNode ikEffector -n "effector10" -p "joint11";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode transform -n "curve2" -p "grp_bendy";
createNode nurbsCurve -n "curveShape2" -p "curve2";
	setAttr -k off ".v";
	setAttr -s 8 ".iog[0].og";
	setAttr ".tw" yes;
createNode nurbsCurve -n "curveShape2Orig" -p "curve2";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		3 2 0 no 3
		7 0 0 0 6.0283133761594847 12.056626752318969 12.056626752318969 12.056626752318969
		
		5
		5.1104799999111247e-015 14.117099999999999 1.4484999999999999
		-1.0655725424086523e-010 12.332118455479508 0.52563427869046242
		-3.1968523591979401e-010 8.7621641310948899 -1.3201140938175706
		-5.3281357673668498e-010 5.1922212595643611 -3.1658846181164995
		-6.3937768587366573e-010 3.4072495682837256 -4.0887693968541869
		;
createNode transform -n "grp_ctrl_bend" -p "grp_leg";
createNode transform -n "group2" -p "grp_ctrl_bend";
	setAttr ".rp" -type "double3" -3.1968177984504663e-010 8.7621641280683544 -1.3201140973055669 ;
	setAttr ".sp" -type "double3" -3.1968177984504663e-010 8.7621641280683544 -1.3201140973055669 ;
createNode transform -n "curve4" -p "group2";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".r" -type "double3" 33.290952388150153 0 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -3.1968177984504663e-010 8.7621641280683544 -1.3201140973055669 ;
	setAttr ".sp" -type "double3" -3.1968177984504663e-010 8.7621641280683544 -1.3201140973055669 ;
createNode nurbsCurve -n "curveShape4" -p "|grp_leg|grp_ctrl_bend|group2|curve4";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		0.56080310887865026 9.8097902581007066 1.2630118963970711
		-0.56080294006585696 9.8097902579244618 1.2630119156347728
		-0.56080294006585696 8.6882312741222805 1.2527369518133082
		0.56080310887865026 8.6882312742985235 1.2527369325756075
		0.56080310887865026 9.8097902581007066 1.2630118963970711
		0.56080312811715882 9.7995152942792352 2.3845708801992505
		-0.56080292082734839 9.7995152941029939 2.3845708994369517
		-0.56080294006585696 9.8097902579244618 1.2630119156347728
		0.56080310887865026 9.8097902581007066 1.2630118963970711
		0.56080312811715882 9.7995152942792352 2.3845708801992505
		0.56080312811715882 8.6779563104770592 2.3742959163777861
		0.56080310887865026 8.6882312742985235 1.2527369325756075
		-0.56080294006585696 8.6882312741222805 1.2527369518133082
		-0.56080292082734839 8.6779563103008144 2.3742959356154882
		0.56080312811715882 8.6779563104770592 2.3742959163777861
		-0.56080292082734839 8.6779563103008144 2.3742959356154882
		-0.56080292082734839 9.7995152941029939 2.3845708994369517
		;
createNode pointConstraint -n "group2_pointConstraint1" -p "group2";
	addAttr -ci true -k true -sn "w0" -ln "rig_kneeW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "rig_ankleW1" -dv 1 -min 0 -at "double";
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
	setAttr -s 2 ".tg";
	setAttr ".o" -type "double3" 3.1731966098624831e-006 -1.4938878273085265e-005 2.0802480480419661e-005 ;
	setAttr ".rst" -type "double3" 0.30516385430102294 8.8817841970012523e-015 -0.64978691174528747 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode orientConstraint -n "group2_orientConstraint1" -p "group2";
	addAttr -ci true -k true -sn "w0" -ln "rig_kneeW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 91.696754407173515 -40.859499086214235 89.075715449776581 ;
	setAttr ".o" -type "double3" 34.893087993573843 269.99999893570686 27.761885425027497 ;
	setAttr ".rsrr" -type "double3" 2.1955145796505719e-007 368.6722675444995 1.2388353699323386e-014 ;
	setAttr -k on ".w0";
createNode transform -n "group3" -p "grp_ctrl_bend";
	setAttr ".rp" -type "double3" -3.1968177984504663e-010 8.7621641280683544 -1.3201140973055669 ;
	setAttr ".sp" -type "double3" -3.1968177984504663e-010 8.7621641280683544 -1.3201140973055669 ;
createNode transform -n "curve4" -p "group3";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".r" -type "double3" 26.08697477262637 0 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -3.1968177984504668e-010 8.7621641280683544 -1.3201140973055683 ;
	setAttr ".sp" -type "double3" -3.1968177984504668e-010 8.7621641280683544 -1.3201140973055683 ;
createNode nurbsCurve -n "curveShape4" -p "|grp_leg|grp_ctrl_bend|group3|curve4";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		0.56080310887865026 10.29663570067374 2.9635411931915332
		-0.56080294006585696 10.296635700747283 2.9635412124299019
		-0.56080294006585696 9.1750378471671237 2.9678288543553144
		0.56080310887865026 9.1750378470935789 2.9678288351169448
		0.56080310887865026 10.29663570067374 2.9635411931915332
		0.56080312811715882 10.300923342599171 4.0851390467716939
		-0.56080292082734839 10.300923342672707 4.0851390660100595
		-0.56080294006585696 10.296635700747283 2.9635412124299019
		0.56080310887865026 10.29663570067374 2.9635411931915332
		0.56080312811715882 10.300923342599171 4.0851390467716939
		0.56080312811715882 9.1793254890189946 4.0894266886971096
		0.56080310887865026 9.1750378470935789 2.9678288351169448
		-0.56080294006585696 9.1750378471671237 2.9678288543553144
		-0.56080292082734839 9.1793254890925358 4.0894267079354805
		0.56080312811715882 9.1793254890189946 4.0894266886971096
		-0.56080292082734839 9.1793254890925358 4.0894267079354805
		-0.56080292082734839 10.300923342672707 4.0851390660100595
		;
createNode parentConstraint -n "group3_parentConstraint1" -p "group3";
	addAttr -ci true -k true -sn "w0" -ln "rig_hipW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 6.2514425448882838 -0.01286565303387377 4.4408920979836383e-016 ;
	setAttr ".tg[0].tor" -type "double3" -121.3326810776951 89.999999999999986 0 ;
	setAttr ".lr" -type "double3" 9.3407623710741081 178.71679757873261 180.1859295889692 ;
	setAttr ".rst" -type "double3" 3.1968772110791458e-010 11.242023346159703 0.66551996059289475 ;
	setAttr ".rsrr" -type "double3" -51.108757680334328 8.7337079367405869e-015 -1.1226794168920365e-014 ;
	setAttr -k on ".w0";
createNode transform -n "group1" -p "grp_ctrl_bend";
	setAttr ".rp" -type "double3" 4.7769861368662203e-015 13.871076585527561 1.5363879240196674 ;
	setAttr ".sp" -type "double3" 4.7769861368662203e-015 13.871076585527561 1.5363879240196674 ;
createNode transform -n "curve3" -p "group1";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".r" -type "double3" 5.6361349493629712e-008 -3.5495181610560687e-015 -6.0343489706855321e-015 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999978 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 4.7769861368662195e-015 13.871076585527558 1.536387924019667 ;
	setAttr ".sp" -type "double3" 4.7769861368662203e-015 13.871076585527561 1.5363879240196674 ;
	setAttr ".spt" -type "double3" -7.8886090522101172e-031 -3.5527136788005005e-015 
		-4.4408920985006252e-016 ;
createNode nurbsCurve -n "curveShape3" -p "curve3";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 16 0 no 3
		17 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		17
		-0.99999999999999067 15.117108566513913 6.0695807746679753
		-0.99999999999999134 15.117108567768067 4.0695807746679753
		1.0000000000000087 15.117108567768067 4.0695807746679744
		1.0000000000000091 15.117108566513913 6.0695807746679744
		-0.99999999999999067 15.117108566513913 6.0695807746679753
		-0.99999999999999123 13.117108566513913 6.0695807734138203
		-0.99999999999999178 13.117108567768067 4.0695807734138203
		-0.99999999999999134 15.117108567768067 4.0695807746679753
		-0.99999999999999067 15.117108566513913 6.0695807746679753
		-0.99999999999999123 13.117108566513913 6.0695807734138203
		1.0000000000000087 13.117108566513913 6.0695807734138194
		1.0000000000000091 15.117108566513913 6.0695807746679744
		1.0000000000000087 15.117108567768067 4.0695807746679744
		1.000000000000008 13.117108567768067 4.0695807734138194
		1.0000000000000087 13.117108566513913 6.0695807734138194
		1.000000000000008 13.117108567768067 4.0695807734138194
		-0.99999999999999178 13.117108567768067 4.0695807734138203
		;
createNode pointConstraint -n "group1_pointConstraint1" -p "group1";
	addAttr -ci true -k true -sn "w0" -ln "rig_kneeW0" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" -3.3349096602208413e-016 -0.24603198303830176 0.087888772764141088 ;
	setAttr -k on ".w0";
createNode transform -n "ctrl_root" -p "grp_leg";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -4.1322209243878696 25.752639770507813 -3.6573102474212646 ;
	setAttr ".sp" -type "double3" -4.1322209243878696 25.752639770507813 -3.6573102474212646 ;
createNode nurbsCurve -n "ctrl_rootShape" -p "ctrl_root";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 24 0 no 3
		25 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
		25
		-9.34928969458743 28.238541733751209 -4.0887694199742892
		-7.3492896945874282 28.238541733751209 -6.0887694199742892
		-7.3492896945874282 28.238541733751209 -5.0887694199742892
		-5.3492896945874282 28.238541733751209 -5.0887694199742892
		-5.3492896945874282 28.238541733751209 -7.0887694199742892
		-6.3492896945874282 28.238541733751209 -7.0887694199742892
		-4.3492896945874291 28.238541733751209 -9.0887694199742892
		-2.3492896945874286 28.238541733751209 -7.0887694199742892
		-3.3492896945874286 28.238541733751209 -7.0887694199742892
		-3.3492896945874286 28.238541733751209 -5.0887694199742892
		-1.3492896945874286 28.238541733751209 -5.0887694199742892
		-1.3492896945874286 28.238541733751209 -6.0887694199742892
		0.65071030541257091 28.238541733751209 -4.0887694199742892
		-1.3492896945874286 28.238541733751209 -2.0887694199742892
		-1.3492896945874286 28.238541733751209 -3.0887694199742892
		-3.3492896945874286 28.238541733751209 -3.0887694199742892
		-3.3492896945874286 28.238541733751209 -1.0887694199742892
		-2.3492896945874286 28.238541733751209 -1.0887694199742892
		-4.3492896945874291 28.238541733751209 0.91123058002571078
		-6.3492896945874282 28.238541733751209 -1.0887694199742892
		-5.3492896945874282 28.238541733751209 -1.0887694199742892
		-5.3492896945874282 28.238541733751209 -3.0887694199742892
		-7.3492896945874282 28.238541733751209 -3.0887694199742892
		-7.3492896945874282 28.238541733751209 -2.0887694199742892
		-9.34928969458743 28.238541733751209 -4.0887694199742892
		;
createNode joint -n "ikj_hip" -p "ctrl_root";
	setAttr ".t" -type "double3" 4.9993955799897795e-015 25.891286247309655 -2.7576318094728376 ;
	setAttr ".r" -type "double3" -5.4875621994618387 -4.9592771602386536 95.797774071067465 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999986 -19.658437158320684 -89.999999999999986 ;
createNode joint -n "ikj_knee" -p "ikj_hip";
	setAttr ".t" -type "double3" 35.348129272460938 -1.3322676295501878e-015 -1.1108156877189595e-016 ;
	setAttr ".r" -type "double3" -8.7790525192833508e-010 1.929615472874387e-009 -46.922627300147134 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999868464 0 -46.922665250148697 ;
createNode joint -n "ikj_ankle" -p "ikj_knee";
	setAttr ".t" -type "double3" 34.173992156982422 -2.0659576890981164e-036 -6.3938293570101392e-010 ;
	setAttr ".r" -type "double3" 6.9249271165526505 -2.5904814308120083 -32.209448632517862 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 10.40118274189293 ;
createNode joint -n "ikj_heel" -p "ikj_ankle";
	setAttr ".t" -type "double3" 4.3832736456044366 1.3322676295501878e-015 5.5919460967951649e-010 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 52.334589166279059 -89.999999998684672 0 ;
createNode joint -n "ikj_ball" -p "ikj_ankle";
	setAttr ".t" -type "double3" -1.2059522429899725 -7.0242361609952049 -1.6548512778043141e-010 ;
	setAttr ".r" -type "double3" -1.1208424026084576e-007 -3.2643934679132577e-007 2.400992760565023e-005 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 179.99999999963455 52.334589166278995 ;
createNode joint -n "ikj_toe" -p "ikj_ball";
	setAttr ".t" -type "double3" 5.7304787134270567 3.3111138467200437e-016 -8.9295658337549562e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 89.999999998434362 0 ;
createNode ikEffector -n "effector8" -p "ikj_ball";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector7" -p "ikj_ankle";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector6" -p "ikj_knee";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode transform -n "pv_l1_leg" -p "ctrl_root";
	setAttr ".t" -type "double3" 4.9993955799897795e-015 25.891286247309655 -2.7576318094728376 ;
createNode locator -n "pv_l1_legShape" -p "pv_l1_leg";
	setAttr -k off ".v";
createNode transform -n "lctrDis_Root_l1_leg" -p "ctrl_root";
	setAttr ".t" -type "double3" 4.9993955799897795e-015 25.891286247309655 -2.7576318094728376 ;
createNode locator -n "lctrDis_Root_l1_legShape" -p "lctrDis_Root_l1_leg";
	setAttr -k off ".v";
createNode joint -n "jnt_leg1" -p "grp_leg";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999986 -19.216459949495576 -89.999999999999986 ;
	setAttr ".bps" -type "matrix" 2.2204460492503131e-016 -0.94428185435575496 0.32913793390379148 0
		 5.5511151231257827e-017 0.32913793390379154 0.94428185435575496 0 -1 -5.5511151231257827e-017 2.2204460492503131e-016 0
		 4.9993962629648278e-015 25.891286247309658 -2.7576318094728394 1;
	setAttr ".radi" 0.55371586200953071;
createNode joint -n "jnt_leg2" -p "jnt_leg1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 0.051214522331744762 ;
	setAttr ".bps" -type "matrix" 2.2208625094955168e-016 -0.94403428767202435 0.3298473339282485 0
		 5.5344300759026407e-017 0.32984733392824855 0.94403428767202435 0 -1 -5.5511151231257827e-017 2.2204460492503131e-016 0
		 4.6394291999493061e-015 23.649311027378062 -1.9567369206897092 1;
	setAttr ".radi" 0.65226517166340425;
createNode joint -n "jnt_leg3" -p "jnt_leg2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -1.1115350273497728 ;
	setAttr ".bps" -type "matrix" 2.2093797874815677e-016 -0.95042661766604386 0.31094894184075245 0
		 5.9763735107603859e-017 0.3109489418407525 0.95042661766604386 0 -1 -5.5511151231257827e-017 2.2204460492503131e-016 0
		 4.6926003821117157e-015 19.867209948191899 -0.60625793097050429 1;
	setAttr ".radi" 0.65804152459377807;
createNode joint -n "jnt_leg4" -p "jnt_leg3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 3.0943660626557041 ;
	setAttr ".bps" -type "matrix" 2.2386891667279156e-016 -0.9320507737305922 0.36232769034149759 0
		 4.7623551264931121e-017 0.36232769034149764 0.9320507737305922 0 -1 -5.5511151231257827e-017 2.2204460492503131e-016 0
		 4.7435250744580597e-015 16.236106873664362 0.68806620706802102 1;
	setAttr ".radi" 0.57295731126246585;
createNode joint -n "jnt_leg5" -p "jnt_leg4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 0 -50.110153074823081 ;
	setAttr ".bps" -type "matrix" 1.0702965633686087e-016 -0.87574326641507128 -0.48277710315285405 0
		 -3.2477619009580801e-016 0.48277710315285405 -0.87574326641507128 0 1 1.1463429463903524e-016 -3.2929222373403776e-016 0
		 2.9425487779061695e-011 14.115921771190612 1.4451740540746849 1;
	setAttr ".radi" 0.65559180268286155;
createNode joint -n "jnt_leg6" -p "jnt_leg5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 1.376428623166547 ;
	setAttr ".bps" -type "matrix" -4.0140366419196769e-008 -0.86389383553003829 -0.50367394307547575 0
		 -3.2725342680252806e-016 0.50367394307547619 -0.86389383553003884 0 0.99999999999999922 -3.4677015076522765e-008 -2.0217657010106618e-008 0
		 -2.2842752519503406e-010 11.534683014126784 0.11021452020880851 1;
	setAttr ".radi" 0.61173262901087377;
createNode joint -n "jnt_leg7" -p "jnt_leg6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -1.1017839936302085 ;
	setAttr ".bps" -type "matrix" -4.0132945016888479e-008 -0.8734190448542265 -0.48696937489531011 0
		 -7.7184230176014967e-010 0.48696937489531056 -0.87341904485422706 0 0.99999999999999922 -3.4677015076522765e-008 -2.0217657010106618e-008 0
		 -1.3541337188889474e-007 8.5510477734559451 -1.4328801130082658 1;
	setAttr ".radi" 0.61734139239195751;
createNode joint -n "jnt_leg8" -p "jnt_leg7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -2.9952240967912673 ;
	setAttr ".bps" -type "matrix" -4.0037788294455774e-008 -0.89767133363781326 -0.44066560651463171 0
		 -2.8678432236997218e-009 0.44066560651463216 -0.89767133363781382 0 0.99999999999999922 -3.4677015076522765e-008 -2.0217657010106618e-008 0
		 -2.6876130112094983e-007 5.6079616606221681 -2.9550150572379046 1;
	setAttr ".radi" 0.54535741609861998;
	setAttr ".liw" yes;
createNode joint -n "jnt_leg9" -p "jnt_leg8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 63.860931899565159 -89.999999999999972 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999999756 -3.4671859776520524e-008 -6.0746072280297287e-008 0
		 3.4679587156373751e-008 0.99999999190777455 0.0001272181181867782 0 6.0741660828892241e-008 -0.00012721811818879421 0.99999999190777322 0
		 -4.8552710624761263e-007 3.4067662244772801 -4.0934548496070349 1;
	setAttr ".radi" 0.54535741609861998;
createNode joint -n "jnt_leg10" -p "jnt_leg9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90.000000000002217 -89.341650439632943 90.000000000002217 ;
	setAttr ".bps" -type "matrix" 2.9284098026124499e-008 0.011362904803333981 0.99993544011322533 0
		 -1.5695074970660757e-008 0.99993544011322566 -0.011362904803333435 0 -0.99999999999999956 -1.5361308939026744e-008 2.9460549193159769e-008 0
		 -1.5512561653815965e-007 0.034859117396688788 2.2084603374899112 1;
	setAttr ".radi" 0.73234767373553089;
createNode joint -n "jnt_leg11" -p "jnt_leg10";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.65106038022947432 89.999999999999986 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999999956 1.536130894281135e-008 -2.9460548860114365e-008 0
		 -1.5361309345732251e-008 1 -2.0746403154442428e-009 0 2.9460548725908341e-008 2.0746408549432388e-009 0.99999999999999956 0
		 -1.346367418665123e-007 0.03485977685715258 7.9389390509169333 1;
	setAttr ".radi" 0.73234767373553089;
createNode parentConstraint -n "joint23_parentConstraint1" -p "jnt_leg11";
	addAttr -ci true -k true -sn "w0" -ln "rig_toeW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 1.2973333967670195e-015 2.0400348077487251e-015 
		4.4408920985006262e-015 ;
	setAttr ".tg[0].tor" -type "double3" 6.5169327411084578e-006 1.4828390828378294e-006 
		-4.2358668992842429e-007 ;
	setAttr ".lr" -type "double3" 6.1722639006847362e-014 -5.3196463658080995e-007 6.0380842494375965e-014 ;
	setAttr ".rst" -type "double3" 5.7301087618640327 -0.065114224633739254 1.481506280598525e-007 ;
	setAttr ".rsrr" -type "double3" 2.3357198441997706e-014 1.2721442223246291e-014 
		-1.9878466759146726e-016 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "joint22_parentConstraint1" -p "jnt_leg10";
	addAttr -ci true -k true -sn "w0" -ln "rig_ballW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 4.4408920985006262e-015 2.6784130469081902e-015 
		-1.5489688594763634e-015 ;
	setAttr ".tg[0].tor" -type "double3" -4.0047780136501123e-007 1.4859199331021461e-006 
		0.6510538632967563 ;
	setAttr ".lr" -type "double3" 1.0935669991051607e-006 -5.3382536796914713e-007 2.4328929136366381e-005 ;
	setAttr ".rst" -type "double3" 1.0996708940558985e-007 -3.3711053619423796 6.302344103803712 ;
	setAttr ".rsrr" -type "double3" 1.0943719197993907e-006 -5.3383405986317249e-007 
		3.4012663113976238e-014 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "joint20_parentConstraint1" -p "jnt_leg9";
	addAttr -ci true -k true -sn "w0" -ln "rig_ankleW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 4.8914458444712683e-011 -0.00048334232521707321 
		-0.0046854761065882045 ;
	setAttr ".tg[0].tor" -type "double3" 0.0072903931542566093 -5.2591494130757556e-007 
		6.9991537198721449e-007 ;
	setAttr ".lr" -type "double3" -13.592454016074397 -3.7918110725735921 1.3960286520195004 ;
	setAttr ".rst" -type "double3" 2.477621303732723 0.051953674037926056 -1.3142188949579815e-010 ;
	setAttr ".rsrr" -type "double3" 3.2113194645486882e-014 -3.4718699859864762e-007 
		-1.1513062577186702e-006 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "joint19_parentConstraint1" -p "jnt_leg8";
	addAttr -ci true -k true -sn "w0" -ln "joint11W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0.0025812838657142123 0.0036271910499330318 
		5.0893095952232073e-013 ;
	setAttr ".tg[0].tor" -type "double3" 5.9388494824469894e-009 -2.9153986056699811e-009 
		-1.1937622864164457 ;
	setAttr ".lr" -type "double3" 0.041612291780166719 -0.49437318153585064 -7.2349800339295216 ;
	setAttr ".rst" -type "double3" 3.3117805635596125 -0.10373116614010769 -1.7571617757291062e-010 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "joint18_parentConstraint1" -p "jnt_leg7";
	addAttr -ci true -k true -sn "w0" -ln "joint10W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0.0025813117689885701 0.0032056590661140305 
		4.6569589462240794e-013 ;
	setAttr ".tg[0].tor" -type "double3" 5.7783988904869402e-009 -3.221736871242379e-009 
		1.8014618103748206 ;
	setAttr ".lr" -type "double3" 0.039871233326763844 -0.69545777926206398 -10.165274661249086 ;
	setAttr ".rst" -type "double3" 3.3547606496928557 -0.16970939778441707 -1.7813679212974054e-010 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "joint17_parentConstraint1" -p "jnt_leg6";
	addAttr -ci true -k true -sn "w0" -ln "joint9W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0.0025813354706798464 0.0027783230224827093 
		4.2186514746471336e-013 ;
	setAttr ".tg[0].tor" -type "double3" 5.7153811415127093e-009 -3.3322515829907289e-009 
		2.9033126005400907 ;
	setAttr ".lr" -type "double3" 0.0037744822529368412 -0.46235115841857677 -6.7420089548013946 ;
	setAttr ".rst" -type "double3" 2.9049903569390221 -0.077081152992852786 -1.5410442807187738e-010 ;
	setAttr ".rsrr" -type "double3" 0 0 -3.1805546814635168e-015 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "joint16_parentConstraint1" -p "jnt_leg5";
	addAttr -ci true -k true -sn "w0" -ln "joint8W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0.0025741426955967484 0.0024133191729864834 
		3.7938112823631202e-013 ;
	setAttr ".tg[0].tor" -type "double3" 5.7937629725394733e-009 -3.1940011413342262e-009 
		1.5268270811905544 ;
	setAttr ".lr" -type "double3" 20.462925861999214 6.3883706298911731 -30.381107614037838 ;
	setAttr ".rst" -type "double3" 2.2504413023344565 -0.062538832251854082 -1.2540391401148435e-015 ;
	setAttr ".rsrr" -type "double3" -5.7937405052186466e-009 3.1939926731316303e-009 
		6.3609478749005078e-015 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "joint15_parentConstraint1" -p "jnt_leg4";
	addAttr -ci true -k true -sn "w0" -ln "joint7W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -9.2555985098385918e-007 -0.0032441473362672113 
		-7.2590694777435256e-019 ;
	setAttr ".tg[0].tor" -type "double3" 1.281639875011365e-014 -3.2991365880011742e-016 
		1.584729277229334 ;
	setAttr ".lr" -type "double3" 0.30427211468247911 3.1242200186072764 7.9853750388123963 ;
	setAttr ".rst" -type "double3" 3.853565734639945 0.101072453940378 8.0651480065226302e-016 ;
	setAttr ".rsrr" -type "double3" 0 0 0.03242291660839447 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "joint14_parentConstraint1" -p "jnt_leg3";
	addAttr -ci true -k true -sn "w0" -ln "joint6W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -3.9328050149833871e-008 -0.00057229623509691407 
		-1.2805644904579681e-019 ;
	setAttr ".tg[0].tor" -type "double3" 1.2815358232420245e-014 3.6964702746173585e-016 
		-1.5419377527895171 ;
	setAttr ".lr" -type "double3" 0.75165156722859794 6.4130566863737091 16.408773977610068 ;
	setAttr ".rst" -type "double3" 4.0158849924772539 0.027382513458889868 8.4021712612202743e-016 ;
	setAttr ".rsrr" -type "double3" 0 0 -0.031547172488396162 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "joint13_parentConstraint1" -p "jnt_leg2";
	addAttr -ci true -k true -sn "w0" -ln "joint5W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 -1.7763568394002505e-015 4.7331654313260708e-030 ;
	setAttr ".tg[0].tor" -type "double3" 1.2819986774669837e-014 1.1392129325816655e-016 
		-0.39892145410154667 ;
	setAttr ".lr" -type "double3" 0.53423438799394052 5.043788598750929 12.874311458252672 ;
	setAttr ".rst" -type "double3" 2.3806614070648457 0.018351418972398115 8.8959879300138966e-016 ;
	setAttr ".rsrr" -type "double3" 0 0 -0.0081649242575032119 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "joint12_parentConstraint1" -p "jnt_leg1";
	addAttr -ci true -k true -sn "w0" -ln "joint1W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -3.5527136788005009e-015 8.8817841970012523e-016 
		-3.915015603967685e-016 ;
	setAttr ".tg[0].tor" -type "double3" 1.2819881907418569e-014 1.2304889930905554e-016 
		-0.44197105217578858 ;
	setAttr ".lr" -type "double3" -12.579298772226528 -11.619797197264742 95.458751287401512 ;
	setAttr ".rst" -type "double3" 4.9993955799897795e-015 25.891286247309655 -2.7576318094728385 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635176e-015 6.3611093629270335e-015 
		-9.5416640443905503e-015 ;
	setAttr -k on ".w0";
createNode transform -n "leg_geo" -p "grp_leg";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "leg_geoShape" -p "leg_geo";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "leg_geoShapeOrig" -p "leg_geo";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 726 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.375 0 0.625 0 0.375 0.25
		 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0 0.875
		 0.25 0.125 0 0.125 0.25 0.625 0.66503358 0.875 0.084966436 0.125 0.084966436 0.375
		 0.66503358 0.37703419 0.090595298 0.62809259 0.090595298 0.625 0.53503621 0.875 0.21496379
		 0.125 0.21496379 0.375 0.53503621 0.37703419 0.20309365 0.62809259 0.20309365 0.51538032
		 0.6594047 0.51538032 0.54690635 0.51538032 0.50437951 0.51538032 0.24562047 0.51538032
		 0.20309365 0.51538032 0.090595298 0.5205071 0 0.5205071 1 0.51538032 0.73937917 0.51538032
		 0.2661542 0.60177934 0.27871856 0.60177934 0.47316301 0.51538032 0.4849042 0.40733492
		 0.27871856 0.40733492 0.47316301 0.51538032 0.76509583 0.60177934 0.77683699 0.60177934
		 0.97128141 0.51538032 0.98384583 0.40733492 0.77683699 0.40733492 0.97128141 0.75317514
		 0.090595298 0.75317514 0.20309365 0.625 0.37923354 0.75423354 0.25 0.61193836 0.37817514
		 0.51538032 0.37817514 0.39318839 0.37817514 0.24576646 0.25 0.375 0.37923354 0.24682485
		 0.20309365 0.24682485 0.090595298 0.24576646 0 0.375 0.87076646 0.39318839 0.87182486
		 0.51538032 0.87182486 0.61193836 0.87182486 0.625 0.87076646 0.75423354 0 0.51538032
		 0.20309365 0.62809259 0.20309365 0.625 0.25 0.51538032 0.24562047 0.51538032 0.2661542
		 0.60177934 0.27871856 0.61193836 0.37817514 0.51538032 0.37817514 0.51538032 0.50437951
		 0.625 0.5 0.625 0.53503621 0.51538032 0.54690635 0.51538032 0.87182486 0.61193836
		 0.87182486 0.60177934 0.97128141 0.51538032 0.98384583 0.75317514 0.20309365 0.75423354
		 0.25 0.24682485 0.20309365 0.37703419 0.20309365 0.375 0.25 0.24576646 0.25 0.51538032
		 0.73937917 0.51538032 0.6594047 0.625 0.66503358 0.625 0.75 0.24576646 0 0.375 0
		 0.37703419 0.090595298 0.24682485 0.090595298 0.5205071 0 0.625 0 0.62809259 0.090595298
		 0.51538032 0.090595298 0.75423354 0 0.75317514 0.090595298 0.375 0.53503621 0.375
		 0.66503358 0.375 0.5 0.40733492 0.27871856 0.39318839 0.37817514 0.39318839 0.87182486
		 0.40733492 0.97128141 0.375 0.75 0.625 0.37923354 0.51538032 0.4849042 0.60177934
		 0.47316301 0.40733492 0.47316301 0.375 0.37923354 0.60177934 0.77683699 0.51538032
		 0.76509583 0.625 0.87076646 0.625 1 0.5205071 1 0.40733492 0.77683699 0.375 1 0.375
		 0.87076646 0.875 0.084966436 0.875 0.21496379 0.875 0.25 0.125 0.21496379 0.125 0.25
		 0.125 0.084966436 0.125 0 0.875 0 0.49890652 0.069370486 0.61985892 0.069370486 0.625
		 0.25 0.49890652 0.23576957 0.625 0.33532929 0.49890649 0.33516353 0.49890649 0.51481318
		 0.625 0.5 0.625 0.69917274 0.49890652 0.68062955 0.49890652 0.91483647 0.625 0.91467071
		 0.625 1 0.49854201 1 0.71016347 0.069370486 0.71032929 0.25 0.28983647 0.069370486
		 0.3797766 0.069370486 0.375 0.25 0.28967074 0.25 0.49890652 0.41891557 0.625 0.41933256
		 0.20608442 0.069370486 0.20566744 0.25 0.49890652 0.83108437 0.625 0.83066744 0.79391551
		 0.069370486 0.79433256 0.25 0.125 0.050827309 0.125 0.25 0.49890652 0.75373006 0.625
		 0.75 0.875 0.050827309 0.875 0.25 0.375 0.33532929 0.375 0.91467071 0.375 1 0.375
		 0.83066744 0.375 0.75 0.375 0.5 0.375 0.69917274 0.375 0.41933256 0.125 0 0.20566744
		 0 0.28967074 0 0.375 0 0.49854201 0 0.625 0 0.71032923 0 0.7943325 0 0.875 0 0.375
		 0 0.43743914 0 0.43815875 0.12359916 0.3515549 0.12359916 0.375 0.25 0.43815875 0.26539153
		 0.43815875 0.48460847 0.375 0.5 0.375 0.62686777 0.43815875 0.62640083 0.43815875
		 0.76585847 0.375 0.75 0.43743914 1 0.375 1 0.625 0 0.875 0 0.875 0.1231322 0.64132941
		 0.12359916 0.125 0 0.125 0.1231322 0.51203132 0.26539153 0.625 0.25 0.625 0.5 0.51203132
		 0.48460847 0.51203132 0.76585847 0.51203132 0.62640083 0.625 0.62686777 0.625 0.75
		 0.5056352 1 0.625 1 0.51203132 0.12359916 0.5056352 0 0.125 0.25 0.875 0.25 0.57275355
		 0.2324819 0.57275355 0.31461677 0.57275355 0.5175181 0.57275355 0.9353832 0.6896168
		 0.2324819 0.31038323 0.2324819 0.57275355 0.70751679 0.31038323 0.042483218 0.57275355
		 0.042483218 0.6896168 0.042483218 0.57275355 0.60003489 0.31038323 0.14996511 0.57275355
		 0.14996511 0.6896168 0.14996511 0.44775355 0.60003489 0.44775355 0.5175181 0.44775355
		 0.31461677 0.44775355 0.2324819 0.44775355 0.14996511 0.44775355 0.042483218 0.44775355
		 0.9353832 0.44775355 0.70751679 0.57275355 0.25 0.625 0.31461677 0.57275355 0.5 0.44775355
		 0.25 0.44775355 0.5 0.375 0.31461677 0.57275355 0.75 0.625 0.9353832 0.57275355 1
		 0.44775355 0.75 0.44775355 1 0.375 0.9353832 0.8146168 0.14996511;
	setAttr ".uvst[0].uvsp[250:499]" 0.8146168 0.2324819 0.625 0.43961677 0.57275355
		 0.43961677 0.44775355 0.43961677 0.375 0.43961677 0.18538323 0.2324819 0.18538323
		 0.14996511 0.18538323 0.042483218 0.375 0.8103832 0.44775355 0.8103832 0.57275355
		 0.8103832 0.625 0.8103832 0.8146168 0.042483218 0.57275355 0.2324819 0.57275355 0.31461677
		 0.57275355 0.5175181 0.57275355 0.9353832 0.6896168 0.2324819 0.31038323 0.2324819
		 0.57275355 0.70751679 0.31038323 0.042483218 0.57275355 0.042483218 0.6896168 0.042483218
		 0.57275355 0.60003489 0.31038323 0.14996511 0.57275355 0.14996511 0.6896168 0.14996511
		 0.44775355 0.60003489 0.44775355 0.5175181 0.44775355 0.31461677 0.44775355 0.2324819
		 0.44775355 0.14996511 0.44775355 0.042483218 0.44775355 0.9353832 0.44775355 0.70751679
		 0.57275355 0.25 0.625 0.31461677 0.57275355 0.5 0.44775355 0.25 0.44775355 0.5 0.375
		 0.31461677 0.57275355 0.75 0.625 0.9353832 0.57275355 1 0.44775355 0.75 0.44775355
		 1 0.375 0.9353832 0.8146168 0.14996511 0.8146168 0.2324819 0.625 0.43961677 0.57275355
		 0.43961677 0.44775355 0.43961677 0.375 0.43961677 0.18538323 0.2324819 0.18538323
		 0.14996511 0.18538323 0.042483218 0.375 0.8103832 0.44775355 0.8103832 0.57275355
		 0.8103832 0.625 0.8103832 0.8146168 0.042483218 0.56177104 0.15041366 0.56177104
		 0.29266465 0.56177104 0.59958637 0.56177104 0.95733535 0.66766465 0.15041366 0.33233535
		 0.15041366 0.56177104 0.3773309 0.24766909 0.15041366 0.56177104 0.87266904 0.7523309
		 0.15041366 0.56177104 0.45966628 0.16533372 0.15041366 0.56177104 0.79033375 0.83466625
		 0.15041366 0.43677101 0.29266465 0.43677101 0.15041366 0.43677101 0.95733535 0.43677101
		 0.87266904 0.43677101 0.79033375 0.43677101 0.59958637 0.43677101 0.45966628 0.43677101
		 0.3773309 0.56177104 0.72458637 0.43677101 0.72458637 0.16533372 0.025413655 0.24766909
		 0.025413655 0.33233535 0.025413655 0.43677101 0.025413655 0.56177104 0.025413655
		 0.66766465 0.025413655 0.7523309 0.025413655 0.83466625 0.025413655 0.40621957 0.061566107
		 0.40621957 0.375 0.40621957 0.68843389 0.40621957 0.875 0.75 0.0615661 0.25 0.0615661
		 0.56531763 0.375 0.56531763 0.68843389 0.56531763 0.875 0.56531763 0.061566103 0.25
		 0.1865661 0.40621957 0.56343389 0.56531763 0.56343389 0.75 0.1865661 0.56531763 0.1865661
		 0.40621957 0.18656611 0.47153717 0.375 0.47153717 0.56343389 0.47153717 0.68843389
		 0.47153717 0.875 0.47153717 0.061566107 0.47153717 0.18656611 0.57275355 0.20309365
		 0.62809259 0.2324819 0.57275355 0.24562047 0.51538032 0.2324819 0.57275355 0.2661542
		 0.61193836 0.31461677 0.57275355 0.37817517 0.51538032 0.31461677 0.57275355 0.50437951
		 0.625 0.5175181 0.57275355 0.54690635 0.51538032 0.5175181 0.57275355 0.87182486
		 0.61193836 0.9353832 0.57275355 0.98384583 0.51538032 0.9353832 0.6896168 0.20309365
		 0.75317514 0.2324819 0.6896168 0.25 0.31038323 0.20309365 0.37703419 0.2324819 0.31038323
		 0.25 0.24682483 0.2324819 0.51538032 0.70751679 0.57275355 0.65940475 0.625 0.70751679
		 0.57275355 0.73937917 0.31038323 0 0.37703419 0.042483218 0.31038323 0.090595298
		 0.24682483 0.042483218 0.57275355 0 0.62809259 0.042483218 0.57275355 0.090595298
		 0.51538032 0.042483218 0.6896168 0 0.75317514 0.042483218 0.6896168 0.090595298 0.625
		 0.60003489 0.51538032 0.60003489 0.37703419 0.14996511 0.24682483 0.14996511 0.62809259
		 0.14996511 0.51538032 0.14996511 0.75317514 0.14996511 0.44775355 0.54690635 0.44775355
		 0.65940475 0.375 0.60003489 0.44775355 0.50437951 0.375 0.5175181 0.44775355 0.2661542
		 0.44775355 0.37817517 0.39318839 0.31461677 0.44775355 0.20309365 0.44775355 0.24562047
		 0.44775355 0.090595298 0.44775355 0 0.44775355 0.87182486 0.44775355 0.98384583 0.39318839
		 0.9353832 0.44775355 0.73937917 0.375 0.70751679 0.61193836 0.2661542 0.51538032
		 0.25 0.625 0.31461677 0.625 0.37817517 0.51538032 0.5 0.57275355 0.4849042 0.61193836
		 0.4849042 0.39318839 0.2661542 0.39318839 0.4849042 0.44775355 0.4849042 0.375 0.31461677
		 0.375 0.37817517 0.61193836 0.76509583 0.57275355 0.76509583 0.51538032 0.75 0.625
		 0.9353832 0.61193836 0.98384583 0.625 0.87182486 0.57275355 1 0.51538032 1 0.44775355
		 0.76509583 0.39318839 0.76509583 0.44775355 1 0.39318839 0.98384583 0.375 0.9353832
		 0.375 0.87182486 0.8146168 0.090595298 0.875 0.14996511 0.8146168 0.20309365 0.875
		 0.2324819 0.8146168 0.25 0.625 0.43961677 0.61193836 0.43961677 0.51538032 0.43961677
		 0.39318839 0.43961677 0.375 0.43961677 0.18538323 0.20309365 0.18538323 0.25 0.125
		 0.2324819 0.18538323 0.090595298 0.125 0.14996511 0.18538323 0 0.125 0.042483218
		 0.375 0.8103832 0.39318839 0.8103832 0.51538032 0.8103832 0.61193836 0.8103832 0.625
		 0.8103832 0.8146168 0 0.875 0.042483218 0.57275355 0.20309365 0.62809259 0.2324819
		 0.57275355 0.24562047 0.51538032 0.2324819 0.57275355 0.2661542 0.61193836 0.31461677
		 0.57275355 0.37817517 0.51538032 0.31461677 0.57275355 0.50437951 0.625 0.5175181
		 0.57275355 0.54690635 0.51538032 0.5175181 0.57275355 0.87182486 0.61193836 0.9353832
		 0.57275355 0.98384583 0.51538032 0.9353832 0.6896168 0.20309365 0.75317514 0.2324819
		 0.6896168 0.25 0.31038323 0.20309365 0.37703419 0.2324819 0.31038323 0.25 0.24682483
		 0.2324819;
	setAttr ".uvst[0].uvsp[500:725]" 0.51538032 0.70751679 0.57275355 0.65940475
		 0.625 0.70751679 0.57275355 0.73937917 0.31038323 0 0.37703419 0.042483218 0.31038323
		 0.090595298 0.24682483 0.042483218 0.57275355 0 0.62809259 0.042483218 0.57275355
		 0.090595298 0.51538032 0.042483218 0.6896168 0 0.75317514 0.042483218 0.6896168 0.090595298
		 0.625 0.60003489 0.51538032 0.60003489 0.37703419 0.14996511 0.24682483 0.14996511
		 0.62809259 0.14996511 0.51538032 0.14996511 0.75317514 0.14996511 0.44775355 0.54690635
		 0.44775355 0.65940475 0.375 0.60003489 0.44775355 0.50437951 0.375 0.5175181 0.44775355
		 0.2661542 0.44775355 0.37817517 0.39318839 0.31461677 0.44775355 0.20309365 0.44775355
		 0.24562047 0.44775355 0.090595298 0.44775355 0 0.44775355 0.87182486 0.44775355 0.98384583
		 0.39318839 0.9353832 0.44775355 0.73937917 0.375 0.70751679 0.61193836 0.2661542
		 0.51538032 0.25 0.625 0.31461677 0.625 0.37817517 0.51538032 0.5 0.57275355 0.4849042
		 0.61193836 0.4849042 0.39318839 0.2661542 0.39318839 0.4849042 0.44775355 0.4849042
		 0.375 0.31461677 0.375 0.37817517 0.61193836 0.76509583 0.57275355 0.76509583 0.51538032
		 0.75 0.625 0.9353832 0.61193836 0.98384583 0.625 0.87182486 0.57275355 1 0.51538032
		 1 0.44775355 0.76509583 0.39318839 0.76509583 0.44775355 1 0.39318839 0.98384583
		 0.375 0.9353832 0.375 0.87182486 0.8146168 0.090595298 0.875 0.14996511 0.8146168
		 0.20309365 0.875 0.2324819 0.8146168 0.25 0.625 0.43961677 0.61193836 0.43961677
		 0.51538032 0.43961677 0.39318839 0.43961677 0.375 0.43961677 0.18538323 0.20309365
		 0.18538323 0.25 0.125 0.2324819 0.18538323 0.090595298 0.125 0.14996511 0.18538323
		 0 0.125 0.042483218 0.375 0.8103832 0.39318839 0.8103832 0.51538032 0.8103832 0.61193836
		 0.8103832 0.625 0.8103832 0.8146168 0 0.875 0.042483218 0.56177104 0.069370486 0.61985892
		 0.15041366 0.56177104 0.23576957 0.49890652 0.15041366 0.625 0.29266465 0.56177104
		 0.33516353 0.49890652 0.29266465 0.56177104 0.51481318 0.625 0.59958637 0.56177104
		 0.68062955 0.49890652 0.59958637 0.56177104 0.91483647 0.625 0.95733535 0.56177104
		 1 0.49890652 0.95733535 0.66766465 0.069370486 0.71016347 0.15041366 0.66766465 0.25
		 0.33233535 0.069370486 0.3797766 0.15041366 0.33233535 0.25 0.28983647 0.15041366
		 0.49890652 0.37733093 0.625 0.37733093 0.56177104 0.41891557 0.24766909 0.069370486
		 0.24766909 0.25 0.20608443 0.15041366 0.56177104 0.83108443 0.625 0.8726691 0.49890652
		 0.87266904 0.7523309 0.069370486 0.79391551 0.15041366 0.7523309 0.25 0.625 0.45966628
		 0.49890652 0.45966628 0.16533372 0.069370486 0.16533372 0.25 0.125 0.15041366 0.56177104
		 0.75373006 0.625 0.79033375 0.49890652 0.79033375 0.83466625 0.069370486 0.875 0.15041366
		 0.83466625 0.25 0.43677101 0.23576957 0.43677101 0.33516353 0.375 0.29266465 0.43677101
		 0.069370486 0.43677101 0.91483647 0.43677101 1 0.375 0.95733535 0.43677101 0.83108443
		 0.375 0.8726691 0.43677101 0.75373006 0.375 0.79033375 0.43677101 0.51481318 0.43677101
		 0.68062955 0.375 0.59958637 0.43677101 0.41891557 0.375 0.45966628 0.375 0.37733093
		 0.625 0.72458637 0.49890652 0.72458637 0.375 0.72458637 0.16533372 0 0.20608443 0.025413655
		 0.125 0.025413655 0.24766909 0 0.28983647 0.025413655 0.33233535 0 0.3797766 0.025413655
		 0.43677101 0 0.49890652 0.025413655 0.56177104 0 0.61985892 0.025413655 0.66766465
		 0 0.71016347 0.025413655 0.7523309 0 0.79391551 0.025413655 0.83466625 0 0.875 0.025413655
		 0.40621957 0 0.43815875 0.061566107 0.40621957 0.12359916 0.3515549 0.061566107 0.40621957
		 0.26539153 0.43815875 0.375 0.40621957 0.48460847 0.375 0.375 0.40621957 0.62640083
		 0.43815875 0.68843389 0.40621957 0.76585847 0.375 0.68843389 0.43815875 0.875 0.40621957
		 1 0.375 0.875 0.75 0 0.875 0.0615661 0.75 0.12359916 0.64132941 0.061566103 0.25
		 0 0.25 0.12359916 0.125 0.0615661 0.56531763 0.26539153 0.625 0.375 0.56531763 0.48460847
		 0.51203132 0.375 0.51203132 0.68843389 0.56531763 0.62640083 0.625 0.68843389 0.56531763
		 0.76585847 0.51203132 0.875 0.625 0.875 0.56531763 1 0.51203132 0.061566103 0.56531763
		 0 0.56531763 0.12359916 0.3515549 0.1865661 0.25 0.25 0.125 0.1865661 0.43815875
		 0.56343389 0.375 0.56343389 0.51203132 0.56343389 0.625 0.56343389 0.875 0.1865661
		 0.75 0.25 0.64132941 0.1865661 0.51203132 0.18656611 0.43815875 0.18656611 0.47153717
		 0.26539153 0.47153717 0.48460847 0.47153717 0.62640083 0.47153717 0.76585847 0.47153717
		 1 0.47153717 0 0.47153717 0.12359916;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 608 ".vt";
	setAttr ".vt[0:165]"  1.39611936 15.71637535 2.95004272 -1.56719184 15.80503082 2.90917873
		 1.98249221 25.88155365 -1.68953753 -0.93004304 25.88155365 -1.68953753 1.98249221 24.40309525 -4.89711857
		 -0.93004304 24.40309715 -4.89711857 1.39611948 14.26721382 -0.19398275 -1.56719184 14.35587025 -0.2348468
		 -1.83359516 18.25216675 -2.21643734 1.89338613 17.7202301 -1.97125292 1.89338624 19.2816925 1.41641617
		 -1.83359516 19.81363106 1.17123234 -1.10869861 22.58739471 -4.13970852 2.019718647 22.49874115 -4.098844528
		 2.019718647 24.031713486 -0.77298963 -1.10869861 24.12036896 -0.81385362 -0.18512613 17.57983017 -3.057464361
		 0.26747796 22.25318718 -4.76185226 0.34938523 24.14503288 -5.45699787 0.34938523 26.14645576 -1.11481178
		 0.26747796 24.35488892 -0.20211318 -0.18512613 19.85248184 1.87316155 -0.25452501 16.0050601959 3.49731493
		 -0.25452504 14.016815186 -0.81627572 0.39599055 26.46690369 -2.04557848 -0.57709038 26.26790619 -2.33008337
		 -0.57709038 25.13778877 -4.78192806 0.39599052 25.054344177 -5.11019516 1.61439359 26.26790619 -2.33008337
		 1.61439359 25.13778687 -4.78192806 -0.19058803 13.33305645 0.66838002 -1.0085252523 13.60522366 0.79261541
		 -1.0085252523 14.54061031 2.82198143 -0.19058803 14.46139336 3.11635709 0.80791819 13.60522366 0.79261529
		 0.80791819 14.54061031 2.82198143 -2.23360395 19.064083099 -0.53849316 -1.40674579 23.34435463 -2.511379
		 -1.19860876 25.12521744 -3.33044195 -0.6956166 25.74679375 -3.60789347 0.43686736 25.81630135 -3.64639163
		 1.85416305 25.74679375 -3.60789347 2.41411757 25.12521744 -3.33044195 2.47376204 23.24303246 -2.46467733
		 2.38936663 18.45615578 -0.25828278 1.78059459 14.97446632 1.34957838 0.9294889 14.018568039 1.8072989
		 -0.19621308 13.7816925 1.91332889 -1.10724175 14.018568039 1.8072989 -1.89511442 15.075786591 1.30287671
		 1.8412962 3.96453953 -2.068042278 -1.17220569 3.79857016 -2.14856672 1.39280331 14.0057182312 2.84994888
		 -1.5601064 13.75664616 2.72910428 1.39280319 15.5474453 -0.32770643 -1.5601064 15.29837227 -0.44855088
		 1.8412962 5.47571659 -5.18273497 -1.17220569 5.30974674 -5.26325941 -1.85002172 9.27329636 -3.52767229
		 1.98329759 9.067344666 -3.62759566 1.98329759 7.43906069 -0.27153182 -1.85002172 7.64501238 -0.17160864
		 -1.55772591 13.55350685 -1.37536001 1.62317085 13.73359585 -1.28798497 1.62317085 12.13502312 2.0068407059
		 -1.55772591 11.95493317 1.91946578 -0.15456764 9.63893318 -4.51203775 -0.15845001 13.94029808 -1.97119701
		 -0.26294237 15.67689133 -0.95012248 -0.26294237 13.58981705 3.35155296 -0.15845001 11.74865818 2.54600096
		 -0.1545677 7.2690258 0.37258703 0.16468155 3.58331537 -1.56626177 0.16468158 5.65664387 -5.83960819
		 -0.2792235 14.51392746 3.009469986 -1.26004076 14.52465248 2.63490152 -1.26004076 15.70313263 0.20593242
		 -0.2792235 15.98693657 -0.02655416 0.96182239 14.71206284 2.72582865 0.96182233 15.89054298 0.29685959
		 0.34547782 4.08554554 -5.42136097 -0.50201547 4.091442585 -5.16646528 -0.50201547 3.11602712 -3.15603209
		 0.34547779 2.90892482 -2.99622297 1.33960819 4.24678087 -5.091098785 1.33960819 3.27136517 -3.080666065
		 -2.25884008 8.45687675 -1.85227644 -1.8604486 12.74940968 0.23036194 -1.83239543 14.52238083 1.092365861
		 -1.38596296 15.17150307 1.41643965 -0.24517654 15.34189224 1.49258733 1.1991626 15.38955498 1.52223289
		 1.83041215 14.83133221 1.24226213 2.084266186 12.9813242 0.34288108 2.49069953 8.25259399 -1.95138979
		 2.23145866 4.76402378 -3.64087343 1.46747136 3.73518705 -4.12275696 0.35038751 3.4077096 -4.28482342
		 -0.59749329 3.5610106 -4.20726347 -1.50561857 4.54962397 -3.7448957 -0.95936882 0.093443669 1.39576483
		 2.28017712 0.093443669 1.39576483 -1.7126596 1.95463037 1.26119542 2.15146852 1.45990455 1.37599695
		 -1.07850647 3.29780912 -5.66828346 1.9952035 3.29780912 -5.66828346 -1.56152582 0.18425448 -6.017647743
		 2.24328709 0.18425448 -6.01764822 2.43383741 2.39409184 -1.42401886 -1.10363162 3.36427593 -1.81147432
		 -1.26945114 0.096345849 -1.35321391 2.52446699 0.096345849 -1.35321391 2.32322693 3.45302248 -3.99061012
		 -1.2589016 3.60639238 -4.055186272 -1.75610912 0.10364315 -4.019635677 2.76635623 0.10364315 -4.019635677
		 0.6903007 3.57308006 -1.75970531 0.14388071 1.8622992 1.89686298 0.69266236 0.045264766 1.97434235
		 0.80667508 0 -1.29474354 0.65261692 0 -4.14902639 0.22510777 0.10364315 -6.49451065
		 0.58562315 3.60639238 -5.98718643 0.66412157 3.97758031 -4.14245558 2.50498652 1.12225163 -6.28784561
		 0.53171343 1.12225163 -6.93841839 -1.69719303 1.12225163 -6.28784513 -2.11759615 1.12225163 -4.075127125
		 -1.64612198 1.044922352 -1.39621174 -1.52697825 0.58094609 1.82713842 0.48826337 0.49528918 2.65675259
		 2.54052973 0.50541902 1.83790112 2.83858681 0.88322484 -1.33163595 3.08214879 1.096689939 -4.064364433
		 -2.86355901 0.20998004 6.77240467 2.27206659 0.1600765 6.0010290146 -2.50839901 1.31262493 6.77240419
		 2.074444532 0.94666415 6.0010290146 -2.50839925 1.31797671 3.71173477 2.074444532 0.94666415 3.51523805
		 -2.86355901 0.21533182 3.71173477 2.27206659 0.1600765 3.51523829 0.13845357 1.30651593 7.18772697
		 0.13845357 1.30952632 3.5332222 0.14589678 0.14235994 3.5332222 0.14589678 0.13934955 7.18772697
		 -2.95213866 0.74583375 7.39303017 -2.95213866 0.76389611 3.066529274 0.15617234 0.73237312 2.80502725
		 2.56127596 0.5221625 2.93349123 2.5612762 0.5221625 6.35031605 0.15617236 0.71431077 7.9326539
		 -1.42514133 1.46812606 7.31317568 -1.42514133 1.48618817 3.38607025 -1.62451947 0.8692596 2.60232258
		 -1.65952921 0.16142197 3.38607025 -1.65952921 0.14335966 7.31317568 -1.62451947 0.76088572 8.11243534
		 0.64318705 15.92277336 3.370399 1.23171437 26.082271576 -1.25406647 1.23171437 24.20921898 -5.31774378
		 0.64318699 14.071260452 -0.64654863 1.68020403 17.21974945 2.3668189 -1.80735099 17.57437515 2.20336294
		 2.3363893 25.53613853 -2.43893194 -1.15934873 25.53613663 -2.4389317;
	setAttr ".vt[166:331]" 2.029472351 23.74755478 -4.65946627 -0.97923201 23.74755859 -4.65946627
		 1.72338128 14.58663177 0.50815719 -1.83329988 14.68795395 0.46145546 -1.80735099 16.024309158 -1.15958118
		 1.68020415 15.66968346 -0.99612498 -1.14299834 17.85403061 -2.82956338 1.99045706 21.79317474 0.25881028
		 2.31243992 18.045804977 -1.14855814 -1.49709868 22.14779663 0.095354363 0.94393313 19.62172699 1.80510736
		 -2.16082835 19.48857307 0.38245386 -1.49709868 20.59773254 -3.26758933 1.99045706 20.24310684 -3.10413313
		 -0.53655732 22.35414314 -4.60399151 2.029472351 25.27482986 -1.34597421 2.39410233 22.83268166 -3.35495281
		 -0.97923201 25.27482986 -1.34597421 1.21520686 24.26117325 -0.3333329 -1.36074579 23.76884079 -1.59043217
		 0.94393313 17.55006599 -2.68945789 1.21520686 22.30348015 -4.58064032 0.041633636 20.060646057 -4.021062851
		 -0.39916617 24.20921898 -5.31774378 0.34275937 23.48097229 -5.23783302 -0.39916617 26.082271576 -1.25406647
		 -0.53655732 24.31183624 -0.35668373 0.34275937 25.54848289 -0.75227153 -1.14299834 19.9256916 1.66500235
		 0.041633666 22.26491547 0.76120806 -1.016125798 15.97343445 3.34704828 -0.263154 17.69149208 2.86921644
		 -1.016125798 14.12192154 -0.66989946 -0.263154 15.48722076 -1.91305459 0.36926275 26.44957352 -1.51527882
		 -0.78247619 26.21090889 -2.033073664 -0.21458322 26.42181206 -2.14340806 -0.78247619 24.87890434 -4.9229207
		 -0.67264462 26.088851929 -2.86578369 0.36926275 24.64640427 -5.42734051 -0.21458322 25.099855423 -5.011458874
		 0.42316696 25.43811035 -4.46689796 1.84155118 26.21090889 -2.033073902 1.11568332 26.42181206 -2.14340806
		 1.84155118 24.87890434 -4.9229207 1.11568332 25.099855423 -5.011458874 1.79456735 26.088851929 -2.86578369
		 -0.22131422 13.40260506 0.004430607 -1.26194358 13.68856812 0.41994017 -0.67459941 13.42392731 0.72209603
		 -1.26194358 14.88060188 3.0061120987 -1.070940375 13.75670433 1.23917115 -0.22131422 15.016290665 3.50539923
		 -0.67459941 14.47989082 3.013058662 -0.18941289 14.076568604 2.55307603 1.086340666 13.68856812 0.41994014
		 0.37992468 13.42392731 0.72209603 1.086340666 14.88060188 3.0061120987 0.37992468 14.47989082 3.013058662
		 0.89983636 13.75670433 1.23917115 -2.16082835 18.65373421 -1.42876875 -1.36074579 22.93400192 -3.40165448
		 -1.8522234 21.38766479 -1.60949111 -1.15934873 24.72798538 -4.19226074 -1.25825322 24.49352264 -3.041059732
		 -0.67264462 25.41612816 -4.32528687 -1.019675374 25.52949524 -3.51143479 0.42316696 26.20752335 -2.7976172
		 -0.20059621 25.81755638 -3.64367199 1.79456735 25.41612816 -4.32528687 1.18825555 25.81755447 -3.64367199
		 2.3363893 24.72798347 -4.19226074 2.23518419 25.52949524 -3.51143456 2.39410233 23.66752052 -1.54373038
		 2.47376204 24.49352074 -3.041059732 2.31243968 18.88064384 0.66266412 2.47376204 20.98237991 -1.42268419
		 1.72338128 15.37565899 2.21998811 2.13617992 16.40895462 0.68532419 0.89983636 14.28945541 2.3949995
		 1.38900399 14.28637123 1.67592156 -0.18941289 13.4966383 1.29488814 0.37013128 13.84495449 1.88665569
		 -1.070940375 14.28945541 2.39499974 -0.67668813 13.84495449 1.88665569 -1.83329988 15.47698021 2.1732862
		 -1.52382207 14.28637123 1.67592168 -2.18980455 16.81424141 0.49851722 1.076854348 3.70608306 -1.67309356
		 0.63161796 13.73220444 3.25020599 0.6316179 15.68541336 -0.77555811 1.076854467 5.63683033 -5.65256453
		 1.97908831 5.38704205 -1.2671237 -1.59326136 5.43857765 -1.24211979 1.75160623 14.39618111 2.12222981
		 -1.79259086 14.097232819 1.9771874 1.50529146 14.95463085 -0.68043679 -1.54512072 14.69733429 -0.80527139
		 2.17345214 5.16356039 -4.47681856 -1.44294715 4.95933962 -4.57590199 -1.59326136 7.054977417 -4.57368898
		 1.97908831 7.0034418106 -4.59869289 -1.1400578 9.55417919 -4.19553471 1.82358241 9.9245491 0.93436956
		 2.41270614 8.6739254 -2.83655095 -1.74876785 9.97608376 0.95937359 1.007045269 7.27252007 0.19822484
		 -2.18505549 8.020446777 -0.93690217 -1.74876797 11.59248352 -2.37219501 1.82358241 11.54094791 -2.39719868
		 -0.97602099 13.813447 -1.82642412 1.50529146 13.36199951 2.60214138 2.0035021305 13.4024229 -0.54239357
		 -1.54512072 13.104702 2.47730708 0.80523372 11.87181473 2.42969656 -1.81381106 12.31068993 1.14462531
		 1.007045269 9.43283367 -4.25440788 0.80523372 13.9132843 -1.7779851 -0.17261629 11.96651173 -3.20118308
		 -1.021870494 15.54594421 -0.84322524 -0.2048035 15.08837986 -1.32339132 -1.021870375 13.59273529 3.18253922
		 -0.97602105 11.77197647 2.38125753 -0.2048035 12.93239212 3.12032175 -1.1400578 7.39386415 0.2570985
		 -0.17261635 9.66791153 1.53647113 -0.61066735 3.61415172 -1.71769655 -0.011569291 5.1308732 -0.66479558
		 -0.61066735 5.54489851 -5.6971674 -0.011569232 7.42947245 -5.40245008 -0.28413218 14.091638565 3.33181596
		 -1.45183682 14.24202347 2.77106476 -0.89826119 14.50873566 2.88721967 -1.45183706 15.63102913 -0.091820218
		 -1.36267233 14.81677246 2.15257835 -0.28413221 15.97197342 -0.54374713 -0.89826125 15.88726425 0.04592742
		 -0.25906688 15.73509789 0.67916751 1.20856559 14.46642303 2.87993884 0.45044586 14.62249565 2.94241381
		 1.20856559 15.8554306 0.017053723 0.45044586 16.0010261536 0.10112166 1.13874078 15.027762413 2.25494576
		 0.28248748 4.63895655 -5.79070282 -0.78057367 4.40982437 -5.34940052 -0.15084741 4.060037613 -5.3372364
		 -0.78057367 3.16677976 -2.78735685 -0.56068873 3.83718586 -4.76858425 0.28248745 2.95621514 -2.32239699
		 -0.15084742 2.95888567 -3.067647696 0.35728195 3.10079622 -3.65076303 1.60026348 4.61064434 -5.25196743
		 0.91829491 4.15021801 -5.29348326 1.60026348 3.36759949 -2.689924 0.91829491 3.049066067 -3.02389431
		 1.43740773 4.0057220459 -4.68681431 -2.18505573 8.89101124 -2.73122644 -1.81381106 13.18125534 -0.64969891
		 -2.11099195 10.78134346 -0.72449857 -1.79259086 14.93997192 0.24021631 -1.82801008 13.89558411 0.78645915
		 -1.36267245 15.51828384 0.70669204 -1.6923244 14.93231297 1.29665506 -0.25906685 14.93275833 2.33287406
		 -0.89147687 15.28607178 1.46883249 1.13874078 15.7292738 0.8090595;
	setAttr ".vt[332:497]" 0.51662761 15.40484333 1.52645755 1.75160611 15.2389183 0.38525856
		 1.60765517 15.21066093 1.43170297 2.0035021305 12.53185844 1.25193071 1.95574021 14.21473789 0.94130474
		 2.41270614 7.80336189 -1.042226791 2.31661797 10.75153923 -0.7389589 2.17345214 4.34076834 -2.78095865
		 2.44441557 6.21169615 -2.94158649 1.43740761 3.4501729 -3.5417695 1.90552115 4.044754505 -3.98057699
		 0.35728201 3.70554495 -4.89721203 0.9181779 3.51662207 -4.22947264 -0.56068873 3.28163624 -3.62353945
		 -0.14315292 3.42710066 -4.27290678 -1.44294715 4.13654757 -2.88004208 -1.047683597 3.7956562 -4.10143375
		 -1.98319316 6.24150038 -2.92712617 -0.32786697 0.045264766 1.85163295 -1.20687819 1.9378264 1.7641046
		 -0.40047142 3.60639238 -5.88814354 -0.91650259 0.10364315 -6.36725807 -1.25634551 0.21024825 1.77107489
		 2.51303244 0.21024826 1.77107489 -1.65115392 2.63792706 0.011425823 2.40641785 1.82458627 0.26972944
		 -1.44748127 2.41614342 -6.026697159 2.29033899 2.41614342 -6.026697159 -1.79295194 0.10364315 -5.25565052
		 2.62151575 0.10364315 -5.25565052 2.40653372 2.99291301 -2.81915712 -1.089535475 3.60639238 -3.077460766
		 1.671929 3.0879879 -1.58980536 -1.14244199 0.074453957 0.31420726 -1.51011121 2.25277185 -1.60625911
		 2.46741271 0.074453957 0.31420723 -0.3372429 0 -1.32096422 2.81275606 0.3853834 -1.34507978
		 2.18263626 3.60639238 -5.013303757 -1.2617662 3.60639238 -5.013303757 1.58055878 3.90089512 -4.067146301
		 -1.52780795 0.10364315 -2.75832558 -1.83144379 2.41614342 -4.062236786 2.67906094 0.10364315 -2.75832558
		 -0.68764317 0 -4.091001987 3.11646008 0.4145726 -4.037635326 -0.30252355 3.73477745 -1.84810901
		 1.43050659 1.63571823 1.80715525 0.39130086 2.79412675 0.18023778 1.70290208 0.045264766 1.85163295
		 0.25333911 1.075861335 2.57631779 1.8081758 0 -1.32096422 0.76691794 0 0.4901548
		 1.87451267 0 -4.091001987 0.77860117 0 -2.79885197 1.46608186 0.10364315 -6.36725807
		 0.39864296 0 -5.4721241 1.44548202 3.60639238 -5.88814354 0.34044009 0.4145726 -6.94255257
		 -0.35470584 4.00314188 -4.11019707 0.61289936 4.00314188 -5.13419533 0.73558158 3.90089512 -3.10911417
		 2.50728369 0.4145726 -6.28252125 0.58600116 2.41614342 -6.60427856 1.64902425 1.12225175 -6.79995489
		 -1.76716745 0.4145726 -6.28252125 -0.69948477 1.12225175 -6.79995441 -2.16262245 0.4145726 -4.037635326
		 -2.11403418 1.12225163 -5.30537176 -1.63582313 0.3853834 -1.34507978 -1.87546718 1.12225163 -2.81970596
		 -1.91670704 1.27254319 1.72802436 -1.68803453 0.81293416 0.33825183 0.61724097 0.18105906 2.57631779
		 -0.68872613 0.50361675 2.51390171 2.45928669 0.97043496 1.77107489 1.66553164 0.47030646 2.51390171
		 2.76750183 1.60598254 -1.3479557 2.81070876 0.67737734 0.38130242 2.82074738 2.31389689 -4.019186497
		 2.98668242 1.020005107 -2.77665567 2.95213914 1.12225163 -5.30537176 -2.43962383 0.14335966 7.29925871
		 -2.094291687 1.42598057 7.29925823 -2.094291687 1.43802214 3.26058245 -2.43962383 0.1554012 3.26058269
		 -3.012459755 0.4003239 7.34654999 2.57798529 0.28804097 6.32605505 -2.58880734 1.36577296 5.22862959
		 2.29468346 0.95141578 4.67093754 -2.76865053 1.1091671 3.11224318 2.42976856 0.76385498 2.98203993
		 -3.011600494 0.14335966 5.22863007 2.548769 0.11127883 4.67093754 1.30256855 1.11670327 6.73802996
		 1.30256855 1.11670327 3.3133111 0.13512248 1.39160943 5.35880089 1.45078516 0.12731925 3.3133111
		 0.14844686 1.063277245 2.85631371 1.45078516 0.12731925 6.73802996 0.14362901 0.057704926 5.35880089
		 0.15270013 0.38428348 7.8746748 -2.76865053 1.09712553 7.34654999 -3.012459755 0.41236544 3.11224318
		 -3.13933301 0.74282336 5.21178818 0.15270013 0.39632502 2.85631371 -2.39055586 0.82711416 2.45042586
		 2.57798505 0.28804097 2.98204017 1.46095109 0.61673141 2.61258984 2.42976856 0.76385498 6.32605457
		 2.92805099 0.49063951 4.51747227 0.14844689 1.051235676 7.8746748 1.46095121 0.61673141 7.41780472
		 -0.82396394 0.75486493 8.10757828 -0.72583801 1.42598057 7.32771969 -0.72583807 1.43802214 3.51721263
		 -1.39196265 1.5717237 5.34807158 -0.82396394 0.82711416 2.76106405 -1.52467787 1.22958243 2.65792847
		 -0.84428173 0.1554012 3.51721287 -1.65861368 0.47257313 2.65792847 -0.84428173 0.14335966 7.32772017
		 -1.65983427 0.057704926 5.34807205 -2.39055586 0.75486493 8.1170826 -1.65861368 0.4003239 8.050624847
		 -1.52467787 1.15733325 8.050624847 -0.43050849 25.48217583 -0.8961243 -0.19365408 26.1836834 -2.84933829
		 -0.43050849 23.54727745 -5.093980312 -0.65432906 14.12091637 2.48536921 -1.21706176 24.9180088 -2.12011266
		 2.39410233 24.9180088 -2.12011266 -1.15949094 15.69212532 -1.71316969 2.067451715 16.83344269 1.60627127
		 -1.15949094 17.71819687 2.68249273 -2.1184473 17.23872948 1.41946435 -0.8547039 20.26554871 -3.82117796
		 2.39410233 21.40686798 -0.50173724 -0.85470384 22.29162216 0.57448435 -1.79179788 21.81215286 -0.68854409
		 1.098160744 20.062906265 -3.72777438 1.25422227 23.54727554 -5.093980312 1.15022349 26.18368149 -2.84933853
		 1.25422227 25.48217583 -0.8961243 1.098160744 22.088977814 0.66788769 0.79337323 17.51555443 2.77589607
		 0.35859194 14.12091637 2.48536921 0.79337323 15.48948097 -1.61976612 -0.30513915 26.39174652 -1.6407392
		 -0.98620957 25.8997097 -2.70823503 -0.30513915 24.70423317 -5.30187988 1.16419077 26.39174461 -1.6407392
		 1.16419077 24.70423317 -5.30187988 2.16324997 25.89971161 -2.70823526 -0.8248468 13.48551369 0.10234562
		 -1.47403073 14.61768341 2.39471841 -0.8248468 14.99569893 3.37876105 0.49008024 13.48551369 0.10234562
		 0.49008024 14.99569893 3.37876081 1.34447122 14.61768341 2.39471841 -1.79179788 20.977314 -2.49976659
		 -1.21706176 24.083171844 -3.93133521 -0.98620957 25.17160988 -4.28788471 -0.19365409 25.46362114 -4.411551
		 1.15022349 25.46362114 -4.411551 2.16324997 25.17160988 -4.28788424;
	setAttr ".vt[498:607]" 2.39410233 24.083169937 -3.93133521 2.39410233 20.57202911 -2.31295967
		 2.067451954 15.99860477 -0.20495138 1.34447122 13.96609306 0.98106378 0.35859194 13.57818222 1.30788195
		 -0.65432906 13.57818222 1.30788195 -1.47403073 13.96609306 0.98106384 -2.1184473 16.40389061 -0.39175841
		 -0.98879063 12.93540668 2.94572711 -0.88443846 14.90486908 2.25604296 -0.98879063 14.95310879 -1.21296442
		 -0.12048392 3.1412406 -3.67885137 -1.78624749 13.45645332 1.70052314 1.87497592 13.76527214 1.85035443
		 -0.92989129 7.32787991 -5.15463877 2.37473488 5.76316547 -2.032083035 -0.92989135 5.21510363 -0.79998606
		 -1.91084671 5.80494881 -2.011810541 -1.090938807 11.86491871 -2.95337176 2.23585367 10.30207443 0.17009073
		 -1.090938926 9.75214195 1.40128064 -2.049728632 10.34385681 0.19036338 0.90982491 11.83204651 -2.9693203
		 0.71929443 15.097183228 -1.14306307 0.47806835 15.01979351 2.31180215 0.71929443 13.079481125 3.015628338
		 0.90982491 9.71927071 1.38533187 1.070872068 5.1822319 -0.81593466 0.90647852 3.22786331 -3.63682413
		 1.070872068 7.29500818 -5.17058754 -0.96788287 14.094267845 3.17954421 -1.65839458 14.54911613 2.093749523
		 -0.96788293 15.85399723 -0.44743881 0.52181542 14.21992111 3.24050832 0.52181542 15.9796505 -0.38647461
		 1.534724 14.81845093 2.22442436 -0.33261395 4.56411076 -5.68960381 -0.99720216 3.45442438 -3.38727713
		 -0.33261397 2.98930073 -2.44375658 1.00054109097 4.6765604 -5.63504648 1.00054109097 3.10175037 -2.38919878
		 1.86037099 3.69545603 -3.27033424 -2.04972887 11.21442223 -1.60396087 -1.78624749 14.32701874 -0.09380129
		 -1.65839458 15.30837727 0.5288381 -0.88443851 15.65574646 0.70840591 0.47806835 15.77067184 0.76416481
		 1.53472388 15.57771111 0.65951288 1.87497592 14.6358366 0.056030095 2.23585367 11.17263794 -1.62423348
		 2.37473488 6.63372993 -3.82640743 1.86037099 4.3749299 -4.67079973 0.90647864 3.79382277 -4.80332565
		 -0.12048391 3.70720053 -4.84535313 -0.99720216 4.13389778 -4.78774261 -1.91084671 6.67551374 -3.80613494
		 1.52439451 0.97593051 2.43584108 1.53662777 2.38745642 0.23334104 1.55954671 2.41614366 -6.48134995
		 1.74238884 0 0.41125208 2.76060486 1.22043037 0.33868375 -1.83905387 1.76265752 0.16648138
		 1.66558075 3.59415579 -2.96648788 -1.61648071 2.41614342 -2.94766879 1.88882041 0 -2.78067827
		 2.81913018 2.0071573257 -2.77546644 1.47983932 4.00314188 -5.062220573 -1.8282814 2.41614342 -5.1544528
		 1.655442 0 -5.37504768 2.67761135 2.41614342 -5.1544528 -0.78949767 2.92968345 0.06113863
		 -1.056468725 1.10917163 2.43584108 -0.28525883 0 0.41125208 -0.49477899 0 -2.78067827
		 -0.84561157 0 -5.37504768 -0.529531 2.41614366 -6.48134995 -0.37450424 4.00314188 -5.062220573
		 -0.24415261 4.00314188 -3.13869047 1.54090595 0.4145726 -6.80207586 -0.84813446 0.4145726 -6.80207539
		 -2.1590085 0.4145726 -5.28576469 -1.91697347 0.4145726 -2.76396322 -1.53293228 0.29781583 0.33868381
		 -0.45410746 0.18105906 2.43584108 1.70115864 0.18105906 2.43584108 2.7682488 0.29781583 0.33868378
		 2.99250364 0.4145726 -2.76396322 2.99359417 0.4145726 -5.28576469 -2.4397831 0.4003239 8.05517292
		 -2.044905424 1.52355742 5.27915335 -2.4397831 0.44849005 2.50926852 -2.4395709 0.057704926 5.27915382
		 2.94745064 0.27200055 4.53226805 -3.20335221 0.4003239 5.21178818 1.27512681 1.18842959 5.027764797
		 1.46958899 0.33616221 2.66797686 1.44451714 0.057704926 5.027765274 1.46958899 0.33616221 7.37079668
		 -2.94405079 1.085083961 5.21178818 -2.24245024 1.18141627 2.50926876 1.38489377 0.90152454 2.66797686
		 2.7780602 0.71796519 4.53226757 1.38489389 0.90152454 7.37079668 -2.24245024 1.13325012 8.05517292
		 -0.70959699 1.52355742 5.42009544 -0.77456123 1.18141627 2.81328726 -0.84224337 0.44849005 2.81328726
		 -0.84496117 0.057704926 5.42009544 -0.84224337 0.4003239 8.045870781 -0.77456123 1.13325012 8.045870781;
	setAttr -s 1200 ".ed";
	setAttr ".ed[0:165]"  0 158 1 158 22 1 2 159 1 159 19 1 4 160 1 160 18 1
		 6 161 1 161 23 1 0 162 1 162 10 1 1 163 1 163 11 1 2 164 1 164 42 1 3 165 1 165 38 1
		 4 166 1 166 13 1 5 167 1 167 12 1 6 168 1 168 45 1 7 169 1 169 49 1 8 170 1 170 7 1
		 9 171 1 171 6 1 8 172 1 172 16 1 10 173 1 173 14 1 9 174 1 174 44 1 11 175 1 175 15 1
		 10 176 1 176 21 1 11 177 1 177 36 1 12 178 1 178 8 1 13 179 1 179 9 1 12 180 1 180 17 1
		 14 181 1 181 2 1 13 182 1 182 43 1 15 183 1 183 3 1 14 184 1 184 20 1 15 185 1 185 37 1
		 16 186 1 186 9 1 17 187 1 187 13 1 16 188 1 188 17 1 18 189 1 189 5 1 17 190 1 190 18 1
		 19 191 1 191 3 1 20 192 1 192 15 1 19 193 1 193 20 1 21 194 1 194 11 1 20 195 1 195 21 1
		 22 196 1 196 1 1 21 197 1 197 22 1 23 198 1 198 7 1 23 199 1 199 16 1 19 200 1 200 24 1
		 3 201 1 201 25 1 24 202 1 202 25 1 5 203 1 203 26 1 25 204 1 204 39 1 18 205 1 205 27 1
		 27 206 1 206 26 1 27 207 1 207 40 1 2 208 1 208 28 1 28 209 1 209 24 1 4 210 1 210 29 1
		 29 211 1 211 27 1 28 212 1 212 41 1 23 213 1 213 30 1 7 214 1 214 31 1 30 215 1 215 31 1
		 1 216 1 216 32 1 31 217 1 217 48 1 22 218 1 218 33 1 33 219 1 219 32 1 33 220 1 220 47 1
		 6 221 1 221 34 1 34 222 1 222 30 1 0 223 1 223 35 1 35 224 1 224 33 1 34 225 1 225 46 1
		 36 226 1 226 8 1 37 227 1 227 12 1 36 228 1 228 37 1 38 229 1 229 5 1 37 230 1 230 38 1
		 39 231 1 231 26 1 38 232 1 232 39 1 40 233 1 233 24 1 39 234 1 234 40 1 41 235 1
		 235 29 1 40 236 1 236 41 1 42 237 1 237 4 1 41 238 1 238 42 1 43 239 1 239 14 1 42 240 1
		 240 43 1;
	setAttr ".ed[166:331]" 44 241 1 241 10 1 43 242 1 242 44 1 45 243 1 243 0 1
		 44 244 1 244 45 1 46 245 1 245 35 1 45 246 1 246 46 1 47 247 1 247 30 1 46 248 1
		 248 47 1 48 249 1 249 32 1 47 250 1 250 48 1 49 251 1 251 1 1 48 252 1 252 49 1 49 253 1
		 253 36 1 50 254 1 254 72 1 52 255 1 255 69 1 54 256 1 256 68 1 56 257 1 257 73 1
		 50 258 1 258 60 1 51 259 1 259 61 1 52 260 1 260 92 1 53 261 1 261 88 1 54 262 1
		 262 63 1 55 263 1 263 62 1 56 264 1 264 95 1 57 265 1 265 99 1 58 266 1 266 57 1
		 59 267 1 267 56 1 58 268 1 268 66 1 60 269 1 269 64 1 59 270 1 270 94 1 61 271 1
		 271 65 1 60 272 1 272 71 1 61 273 1 273 86 1 62 274 1 274 58 1 63 275 1 275 59 1
		 62 276 1 276 67 1 64 277 1 277 52 1 63 278 1 278 93 1 65 279 1 279 53 1 64 280 1
		 280 70 1 65 281 1 281 87 1 66 282 1 282 59 1 67 283 1 283 63 1 66 284 1 284 67 1
		 68 285 1 285 55 1 67 286 1 286 68 1 69 287 1 287 53 1 70 288 1 288 65 1 69 289 1
		 289 70 1 71 290 1 290 61 1 70 291 1 291 71 1 72 292 1 292 51 1 71 293 1 293 72 1
		 73 294 1 294 57 1 73 295 1 295 66 1 69 296 1 296 74 1 53 297 1 297 75 1 74 298 1
		 298 75 1 55 299 1 299 76 1 75 300 1 300 89 1 68 301 1 301 77 1 77 302 1 302 76 1
		 77 303 1 303 90 1 52 304 1 304 78 1 78 305 1 305 74 1 54 306 1 306 79 1 79 307 1
		 307 77 1 78 308 1 308 91 1 73 309 1 309 80 1 57 310 1 310 81 1 80 311 1 311 81 1
		 51 312 1 312 82 1 81 313 1 313 98 1 72 314 1 314 83 1 83 315 1 315 82 1 83 316 1
		 316 97 1 56 317 1 317 84 1 84 318 1 318 80 1 50 319 1 319 85 1 85 320 1 320 83 1
		 84 321 1 321 96 1 86 322 1 322 58 1 87 323 1 323 62 1;
	setAttr ".ed[332:497]" 86 324 1 324 87 1 88 325 1 325 55 1 87 326 1 326 88 1
		 89 327 1 327 76 1 88 328 1 328 89 1 90 329 1 329 74 1 89 330 1 330 90 1 91 331 1
		 331 79 1 90 332 1 332 91 1 92 333 1 333 54 1 91 334 1 334 92 1 93 335 1 335 64 1
		 92 336 1 336 93 1 94 337 1 337 60 1 93 338 1 338 94 1 95 339 1 339 50 1 94 340 1
		 340 95 1 96 341 1 341 85 1 95 342 1 342 96 1 97 343 1 343 80 1 96 344 1 344 97 1
		 98 345 1 345 82 1 97 346 1 346 98 1 99 347 1 347 51 1 98 348 1 348 99 1 99 349 1
		 349 86 1 100 350 1 350 118 1 102 351 1 351 117 1 104 352 1 352 122 1 106 353 1 353 121 1
		 100 354 1 354 129 1 101 355 1 355 131 1 102 356 1 356 109 1 103 357 1 357 108 1 104 358 1
		 358 126 1 105 359 1 359 124 1 106 360 1 360 114 1 107 361 1 361 115 1 108 362 1 362 112 1
		 109 363 1 363 113 1 108 364 1 364 116 1 110 365 1 365 100 1 109 366 1 366 128 1 111 367 1
		 367 101 1 110 368 1 368 119 1 111 369 1 369 132 1 112 370 1 370 105 1 113 371 1 371 104 1
		 112 372 1 372 123 1 114 373 1 373 110 1 113 374 1 374 127 1 115 375 1 375 111 1 114 376 1
		 376 120 1 115 377 1 377 133 1 116 378 1 378 109 1 117 379 1 379 103 1 116 380 1 380 117 1
		 118 381 1 381 101 1 117 382 1 382 130 1 119 383 1 383 111 1 118 384 1 384 119 1 120 385 1
		 385 115 1 119 386 1 386 120 1 121 387 1 387 107 1 120 388 1 388 121 1 122 389 1 389 105 1
		 121 390 1 390 125 1 123 391 1 391 113 1 122 392 1 392 123 1 123 393 1 393 116 1 124 394 1
		 394 107 1 125 395 1 395 122 1 124 396 1 396 125 1 126 397 1 397 106 1 125 398 1 398 126 1
		 127 399 1 399 114 1 126 400 1 400 127 1 128 401 1 401 110 1 127 402 1 402 128 1 129 403 1
		 403 102 1 128 404 1 404 129 1 130 405 1 405 118 1 129 406 1 406 130 1;
	setAttr ".ed[498:663]" 131 407 1 407 103 1 130 408 1 408 131 1 132 409 1 409 108 1
		 131 410 1 410 132 1 133 411 1 411 112 1 132 412 1 412 133 1 133 413 1 413 124 1 134 414 1
		 414 156 1 136 415 1 415 152 1 138 416 1 416 153 1 140 417 1 417 155 1 134 418 1 418 146 1
		 135 419 1 419 150 1 136 420 1 420 138 1 137 421 1 421 139 1 138 422 1 422 147 1 139 423 1
		 423 149 1 140 424 1 424 134 1 141 425 1 425 135 1 142 426 1 426 137 1 143 427 1 427 139 1
		 142 428 1 428 143 1 144 429 1 429 141 1 143 430 1 430 148 1 145 431 1 431 135 1 144 432 1
		 432 145 1 145 433 1 433 151 1 146 434 1 434 136 1 147 435 1 435 140 1 146 436 1 436 147 1
		 148 437 1 437 144 1 147 438 1 438 154 1 149 439 1 439 141 1 148 440 1 440 149 1 150 441 1
		 441 137 1 149 442 1 442 150 1 151 443 1 443 142 1 150 444 1 444 151 1 151 445 1 445 157 1
		 152 446 1 446 142 1 153 447 1 447 143 1 152 448 1 448 153 1 154 449 1 449 148 1 153 450 1
		 450 154 1 155 451 1 451 144 1 154 452 1 452 155 1 156 453 1 453 145 1 155 454 1 454 156 1
		 157 455 1 455 146 1 156 456 1 456 157 1 157 457 1 457 152 1 458 192 1 458 183 1 458 191 1
		 458 193 1 459 202 1 459 204 1 459 234 1 459 233 1 460 189 1 460 167 1 460 180 1 460 190 1
		 461 250 1 461 249 1 461 219 1 461 220 1 462 185 1 462 230 1 462 165 1 462 183 1 463 239 1
		 463 181 1 463 164 1 463 240 1 464 199 1 464 172 1 464 170 1 464 198 1 465 243 1 465 162 1
		 465 241 1 465 244 1 466 196 1 466 163 1 466 194 1 466 197 1 467 251 1 467 253 1 467 177 1
		 467 163 1 468 180 1 468 178 1 468 172 1 468 188 1 469 241 1 469 173 1 469 239 1 469 242 1
		 470 194 1 470 175 1 470 192 1 470 195 1 471 177 1 471 228 1 471 185 1 471 175 1 472 187 1
		 472 188 1 472 186 1 472 179 1 473 160 1 473 190 1 473 187 1 473 166 1;
	setAttr ".ed[664:829]" 474 209 1 474 233 1 474 236 1 474 212 1 475 184 1 475 193 1
		 475 159 1 475 181 1 476 176 1 476 195 1 476 184 1 476 173 1 477 158 1 477 197 1 477 176 1
		 477 162 1 478 248 1 478 220 1 478 224 1 478 245 1 479 186 1 479 199 1 479 161 1 479 171 1
		 480 191 1 480 201 1 480 202 1 480 200 1 481 165 1 481 232 1 481 204 1 481 201 1 482 189 1
		 482 205 1 482 206 1 482 203 1 483 159 1 483 200 1 483 209 1 483 208 1 484 160 1 484 210 1
		 484 211 1 484 205 1 485 164 1 485 208 1 485 212 1 485 238 1 486 198 1 486 214 1 486 215 1
		 486 213 1 487 251 1 487 216 1 487 249 1 487 252 1 488 196 1 488 218 1 488 219 1 488 216 1
		 489 161 1 489 213 1 489 222 1 489 221 1 490 158 1 490 223 1 490 224 1 490 218 1 491 243 1
		 491 246 1 491 245 1 491 223 1 492 226 1 492 178 1 492 227 1 492 228 1 493 230 1 493 227 1
		 493 167 1 493 229 1 494 232 1 494 229 1 494 203 1 494 231 1 495 234 1 495 231 1 495 206 1
		 495 207 1 496 236 1 496 207 1 496 211 1 496 235 1 497 237 1 497 238 1 497 235 1 497 210 1
		 498 182 1 498 240 1 498 237 1 498 166 1 499 174 1 499 242 1 499 182 1 499 179 1 500 168 1
		 500 244 1 500 174 1 500 171 1 501 246 1 501 168 1 501 221 1 501 225 1 502 222 1 502 247 1
		 502 248 1 502 225 1 503 215 1 503 217 1 503 250 1 503 247 1 504 169 1 504 252 1 504 217 1
		 504 214 1 505 253 1 505 169 1 505 170 1 505 226 1 506 288 1 506 279 1 506 287 1 506 289 1
		 507 298 1 507 300 1 507 330 1 507 329 1 508 285 1 508 263 1 508 276 1 508 286 1 509 346 1
		 509 345 1 509 315 1 509 316 1 510 281 1 510 326 1 510 261 1 510 279 1 511 335 1 511 277 1
		 511 260 1 511 336 1 512 295 1 512 268 1 512 266 1 512 294 1 513 339 1 513 258 1 513 337 1
		 513 340 1 514 292 1 514 259 1 514 290 1 514 293 1 515 347 1 515 349 1;
	setAttr ".ed[830:995]" 515 273 1 515 259 1 516 276 1 516 274 1 516 268 1 516 284 1
		 517 337 1 517 269 1 517 335 1 517 338 1 518 290 1 518 271 1 518 288 1 518 291 1 519 273 1
		 519 324 1 519 281 1 519 271 1 520 283 1 520 284 1 520 282 1 520 275 1 521 256 1 521 286 1
		 521 283 1 521 262 1 522 305 1 522 329 1 522 332 1 522 308 1 523 280 1 523 289 1 523 255 1
		 523 277 1 524 272 1 524 291 1 524 280 1 524 269 1 525 254 1 525 293 1 525 272 1 525 258 1
		 526 344 1 526 316 1 526 320 1 526 341 1 527 282 1 527 295 1 527 257 1 527 267 1 528 287 1
		 528 297 1 528 298 1 528 296 1 529 261 1 529 328 1 529 300 1 529 297 1 530 285 1 530 301 1
		 530 302 1 530 299 1 531 255 1 531 296 1 531 305 1 531 304 1 532 256 1 532 306 1 532 307 1
		 532 301 1 533 260 1 533 304 1 533 308 1 533 334 1 534 294 1 534 310 1 534 311 1 534 309 1
		 535 347 1 535 312 1 535 345 1 535 348 1 536 292 1 536 314 1 536 315 1 536 312 1 537 257 1
		 537 309 1 537 318 1 537 317 1 538 254 1 538 319 1 538 320 1 538 314 1 539 339 1 539 342 1
		 539 341 1 539 319 1 540 322 1 540 274 1 540 323 1 540 324 1 541 326 1 541 323 1 541 263 1
		 541 325 1 542 328 1 542 325 1 542 299 1 542 327 1 543 330 1 543 327 1 543 302 1 543 303 1
		 544 332 1 544 303 1 544 307 1 544 331 1 545 333 1 545 334 1 545 331 1 545 306 1 546 278 1
		 546 336 1 546 333 1 546 262 1 547 270 1 547 338 1 547 278 1 547 275 1 548 264 1 548 340 1
		 548 270 1 548 267 1 549 342 1 549 264 1 549 317 1 549 321 1 550 318 1 550 343 1 550 344 1
		 550 321 1 551 311 1 551 313 1 551 346 1 551 343 1 552 265 1 552 348 1 552 313 1 552 310 1
		 553 349 1 553 265 1 553 266 1 553 322 1 554 408 1 554 407 1 554 379 1 554 382 1 555 379 1
		 555 357 1 555 364 1 555 380 1 556 389 1 556 359 1 556 396 1 556 395 1;
	setAttr ".ed[996:1161]" 557 383 1 557 367 1 557 381 1 557 384 1 558 410 1 558 409 1
		 558 357 1 558 407 1 559 404 1 559 403 1 559 356 1 559 366 1 560 393 1 560 364 1 560 362 1
		 560 372 1 561 402 1 561 366 1 561 363 1 561 374 1 562 385 1 562 375 1 562 383 1 562 386 1
		 563 409 1 563 412 1 563 411 1 563 362 1 564 372 1 564 370 1 564 389 1 564 392 1 565 400 1
		 565 374 1 565 371 1 565 358 1 566 387 1 566 361 1 566 385 1 566 388 1 567 411 1 567 413 1
		 567 359 1 567 370 1 568 351 1 568 380 1 568 378 1 568 356 1 569 406 1 569 382 1 569 351 1
		 569 403 1 570 368 1 570 384 1 570 350 1 570 365 1 571 376 1 571 386 1 571 368 1 571 373 1
		 572 353 1 572 388 1 572 376 1 572 360 1 573 352 1 573 395 1 573 398 1 573 358 1 574 391 1
		 574 392 1 574 352 1 574 371 1 575 378 1 575 393 1 575 391 1 575 363 1 576 396 1 576 394 1
		 576 387 1 576 390 1 577 398 1 577 390 1 577 353 1 577 397 1 578 360 1 578 399 1 578 400 1
		 578 397 1 579 373 1 579 401 1 579 402 1 579 399 1 580 365 1 580 354 1 580 404 1 580 401 1
		 581 350 1 581 405 1 581 406 1 581 354 1 582 381 1 582 355 1 582 408 1 582 405 1 583 367 1
		 583 369 1 583 410 1 583 355 1 584 412 1 584 369 1 584 375 1 584 377 1 585 413 1 585 377 1
		 585 361 1 585 394 1 586 414 1 586 456 1 586 455 1 586 418 1 587 415 1 587 448 1 587 416 1
		 587 420 1 588 438 1 588 452 1 588 417 1 588 435 1 589 417 1 589 454 1 589 414 1 589 424 1
		 590 425 1 590 439 1 590 442 1 590 419 1 591 424 1 591 418 1 591 436 1 591 435 1 592 426 1
		 592 421 1 592 427 1 592 428 1 593 437 1 593 440 1 593 439 1 593 429 1 594 432 1 594 429 1
		 594 425 1 594 431 1 595 433 1 595 431 1 595 419 1 595 444 1 596 436 1 596 434 1 596 420 1
		 596 422 1 597 416 1 597 450 1 597 438 1 597 422 1 598 440 1 598 430 1;
	setAttr ".ed[1162:1199]" 598 427 1 598 423 1 599 442 1 599 423 1 599 421 1 599 441 1
		 600 443 1 600 444 1 600 441 1 600 426 1 601 455 1 601 457 1 601 415 1 601 434 1 602 446 1
		 602 428 1 602 447 1 602 448 1 603 450 1 603 447 1 603 430 1 603 449 1 604 452 1 604 449 1
		 604 437 1 604 451 1 605 454 1 605 451 1 605 432 1 605 453 1 606 456 1 606 453 1 606 433 1
		 606 445 1 607 457 1 607 445 1 607 443 1 607 446 1;
	setAttr -s 600 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 4 69 50 -602 600
		mu 0 4 365 25 366 215
		f 4 51 -68 -603 601
		mu 0 4 366 3 367 215
		f 4 -67 70 -604 602
		mu 0 4 367 29 368 215
		f 4 71 68 -601 603
		mu 0 4 368 30 365 215
		f 4 89 92 -606 604
		mu 0 4 369 36 370 216
		f 4 93 152 -607 605
		mu 0 4 370 51 371 216
		f 4 153 150 -608 606
		mu 0 4 371 52 372 216
		f 4 151 88 -605 607
		mu 0 4 372 35 369 216
		f 4 63 18 -610 608
		mu 0 4 373 5 374 217
		f 4 19 44 -611 609
		mu 0 4 374 20 375 217
		f 4 45 64 -612 610
		mu 0 4 375 27 376 217
		f 4 65 62 -609 611
		mu 0 4 376 28 373 217
		f 4 185 182 -614 612
		mu 0 4 377 62 378 218
		f 4 183 -124 -615 613
		mu 0 4 378 43 379 218
		f 4 -123 124 -616 614
		mu 0 4 379 44 380 218
		f 4 125 184 -613 615
		mu 0 4 380 61 377 218
		f 4 55 144 -618 616
		mu 0 4 381 48 382 219
		f 4 145 -16 -619 617
		mu 0 4 382 50 383 219
		f 4 -15 -52 -620 618
		mu 0 4 383 3 366 219
		f 4 -51 54 -617 619
		mu 0 4 366 25 381 219
		f 4 163 46 -622 620
		mu 0 4 384 24 385 220
		f 4 47 12 -623 621
		mu 0 4 385 2 386 220
		f 4 13 164 -624 622
		mu 0 4 386 54 387 220
		f 4 165 162 -621 623
		mu 0 4 387 56 384 220
		f 4 83 -30 -626 624
		mu 0 4 388 26 389 221
		f 4 -29 24 -627 625
		mu 0 4 389 14 390 221
		f 4 25 -82 -628 626
		mu 0 4 390 7 391 221
		f 4 -81 82 -625 627
		mu 0 4 391 34 388 221
		f 4 171 8 -630 628
		mu 0 4 392 0 393 222
		f 4 9 -168 -631 629
		mu 0 4 393 18 394 222
		f 4 -167 172 -632 630
		mu 0 4 394 57 395 222
		f 4 173 170 -629 631
		mu 0 4 395 58 392 222
		f 4 77 10 -634 632
		mu 0 4 396 1 397 223
		f 4 11 -74 -635 633
		mu 0 4 397 19 398 223
		f 4 -73 78 -636 634
		mu 0 4 398 31 399 223
		f 4 79 76 -633 635
		mu 0 4 399 32 396 223
		f 4 -187 190 -638 636
		mu 0 4 400 64 401 224
		f 4 191 -40 -639 637
		mu 0 4 401 47 402 224
		f 4 -39 -12 -640 638
		mu 0 4 402 19 397 224
		f 4 -11 -188 -637 639
		mu 0 4 397 1 400 224
		f 4 -45 40 -642 640
		mu 0 4 375 20 403 225
		f 4 41 28 -643 641
		mu 0 4 403 14 389 225
		f 4 29 60 -644 642
		mu 0 4 389 26 404 225
		f 4 61 -46 -641 643
		mu 0 4 404 27 375 225
		f 4 167 30 -646 644
		mu 0 4 394 18 405 226
		f 4 31 -164 -647 645
		mu 0 4 405 24 384 226
		f 4 -163 168 -648 646
		mu 0 4 384 56 406 226
		f 4 169 166 -645 647
		mu 0 4 406 57 394 226
		f 4 73 34 -650 648
		mu 0 4 398 19 407 227
		f 4 35 -70 -651 649
		mu 0 4 407 25 365 227
		f 4 -69 74 -652 650
		mu 0 4 365 30 408 227
		f 4 75 72 -649 651
		mu 0 4 408 31 398 227
		f 4 39 140 -654 652
		mu 0 4 402 47 409 228
		f 4 141 -56 -655 653
		mu 0 4 409 48 381 228
		f 4 -55 -36 -656 654
		mu 0 4 381 25 407 228
		f 4 -35 38 -653 655
		mu 0 4 407 19 402 228
		f 4 -59 -62 -658 656
		mu 0 4 410 27 404 229
		f 4 -61 56 -659 657
		mu 0 4 404 26 411 229
		f 4 57 -44 -660 658
		mu 0 4 411 17 412 229
		f 4 -43 -60 -657 659
		mu 0 4 412 23 410 229
		f 4 5 -66 -662 660
		mu 0 4 413 28 376 230
		f 4 -65 58 -663 661
		mu 0 4 376 27 410 230
		f 4 59 -18 -664 662
		mu 0 4 410 23 414 230
		f 4 -17 4 -661 663
		mu 0 4 414 4 413 230
		f 4 103 -152 -666 664
		mu 0 4 415 35 372 231
		f 4 -151 156 -667 665
		mu 0 4 372 52 416 231
		f 4 157 -110 -668 666
		mu 0 4 416 53 417 231
		f 4 -109 102 -665 667
		mu 0 4 417 39 415 231
		f 4 53 -72 -670 668
		mu 0 4 418 30 368 232
		f 4 -71 -4 -671 669
		mu 0 4 368 29 419 232
		f 4 -3 -48 -672 670
		mu 0 4 419 2 385 232
		f 4 -47 52 -669 671
		mu 0 4 385 24 418 232
		f 4 37 -76 -674 672
		mu 0 4 420 31 408 233
		f 4 -75 -54 -675 673
		mu 0 4 408 30 418 233
		f 4 -53 -32 -676 674
		mu 0 4 418 24 405 233
		f 4 -31 36 -673 675
		mu 0 4 405 18 420 233
		f 4 1 -80 -678 676
		mu 0 4 421 32 399 234
		f 4 -79 -38 -679 677
		mu 0 4 399 31 420 234
		f 4 -37 -10 -680 678
		mu 0 4 420 18 393 234
		f 4 -9 0 -677 679
		mu 0 4 393 0 421 234
		f 4 181 -126 -682 680
		mu 0 4 422 61 380 235
		f 4 -125 -134 -683 681
		mu 0 4 380 44 423 235
		f 4 -133 -176 -684 682
		mu 0 4 423 46 424 235
		f 4 -175 180 -681 683
		mu 0 4 424 60 422 235
		f 4 -57 -84 -686 684
		mu 0 4 411 26 388 236
		f 4 -83 -8 -687 685
		mu 0 4 388 34 425 236
		f 4 -7 -28 -688 686
		mu 0 4 425 6 426 236
		f 4 -27 -58 -685 687
		mu 0 4 426 17 411 236
		f 4 67 86 -690 688
		mu 0 4 367 3 427 237
		f 4 87 -90 -691 689
		mu 0 4 427 36 369 237
		f 4 -89 -86 -692 690
		mu 0 4 369 35 428 237
		f 4 -85 66 -689 691
		mu 0 4 428 29 367 237
		f 4 15 148 -694 692
		mu 0 4 429 49 430 238
		f 4 149 -94 -695 693
		mu 0 4 430 51 370 238
		f 4 -93 -88 -696 694
		mu 0 4 370 36 427 238
		f 4 -87 14 -693 695
		mu 0 4 427 3 429 238
		f 4 -63 94 -698 696
		mu 0 4 373 28 431 239
		f 4 95 96 -699 697
		mu 0 4 431 38 432 239
		f 4 97 -92 -700 698
		mu 0 4 432 37 433 239
		f 4 -91 -64 -697 699
		mu 0 4 433 5 373 239
		f 4 3 84 -702 700
		mu 0 4 419 29 428 240
		f 4 85 -104 -703 701
		mu 0 4 428 35 415 240
		f 4 -103 -102 -704 702
		mu 0 4 415 39 434 240
		f 4 -101 2 -701 703
		mu 0 4 434 2 419 240
		f 4 -5 104 -706 704
		mu 0 4 413 4 435 241
		f 4 105 106 -707 705
		mu 0 4 435 40 436 241
		f 4 107 -96 -708 706
		mu 0 4 436 38 431 241
		f 4 -95 -6 -705 707
		mu 0 4 431 28 413 241
		f 4 -13 100 -710 708
		mu 0 4 437 2 434 242
		f 4 101 108 -711 709
		mu 0 4 434 39 417 242
		f 4 109 160 -712 710
		mu 0 4 417 53 438 242
		f 4 161 -14 -709 711
		mu 0 4 438 55 437 242
		f 4 81 112 -714 712
		mu 0 4 391 7 439 243
		f 4 113 -116 -715 713
		mu 0 4 439 42 440 243
		f 4 -115 -112 -716 714
		mu 0 4 440 41 441 243
		f 4 -111 80 -713 715
		mu 0 4 441 34 391 243
		f 4 187 116 -718 716
		mu 0 4 442 9 443 244
		f 4 117 -184 -719 717
		mu 0 4 443 43 378 244
		f 4 -183 188 -720 718
		mu 0 4 378 62 444 244
		f 4 189 186 -717 719
		mu 0 4 444 63 442 244
		f 4 -77 120 -722 720
		mu 0 4 445 33 446 245
		f 4 121 122 -723 721
		mu 0 4 446 44 379 245
		f 4 123 -118 -724 722
		mu 0 4 379 43 443 245
		f 4 -117 -78 -721 723
		mu 0 4 443 9 445 245
		f 4 7 110 -726 724
		mu 0 4 425 34 441 246
		f 4 111 -130 -727 725
		mu 0 4 441 41 447 246
		f 4 -129 -128 -728 726
		mu 0 4 447 45 448 246
		f 4 -127 6 -725 727
		mu 0 4 448 6 425 246
		f 4 -1 130 -730 728
		mu 0 4 449 8 450 247
		f 4 131 132 -731 729
		mu 0 4 450 46 423 247
		f 4 133 -122 -732 730
		mu 0 4 423 44 446 247
		f 4 -121 -2 -729 731
		mu 0 4 446 33 449 247
		f 4 -171 176 -734 732
		mu 0 4 451 59 452 248
		f 4 177 174 -735 733
		mu 0 4 452 60 424 248
		f 4 175 -132 -736 734
		mu 0 4 424 46 450 248
		f 4 -131 -172 -733 735
		mu 0 4 450 8 451 248
		f 4 137 -42 -738 736
		mu 0 4 453 15 454 249
		f 4 -41 -140 -739 737
		mu 0 4 454 21 455 249
		f 4 -139 -142 -740 738
		mu 0 4 455 48 409 249
		f 4 -141 136 -737 739
		mu 0 4 409 47 453 249
		f 4 -145 138 -742 740
		mu 0 4 382 48 455 250
		f 4 139 -20 -743 741
		mu 0 4 455 21 456 250
		f 4 -19 -144 -744 742
		mu 0 4 456 11 457 250
		f 4 -143 -146 -741 743
		mu 0 4 457 50 382 250
		f 4 -149 142 -746 744
		mu 0 4 430 49 458 251
		f 4 143 90 -747 745
		mu 0 4 458 5 433 251
		f 4 91 -148 -748 746
		mu 0 4 433 37 459 251
		f 4 -147 -150 -745 747
		mu 0 4 459 51 430 251
		f 4 -153 146 -750 748
		mu 0 4 371 51 459 252
		f 4 147 -98 -751 749
		mu 0 4 459 37 432 252
		f 4 -97 98 -752 750
		mu 0 4 432 38 460 252
		f 4 99 -154 -749 751
		mu 0 4 460 52 371 252
		f 4 -157 -100 -754 752
		mu 0 4 416 52 460 253
		f 4 -99 -108 -755 753
		mu 0 4 460 38 436 253
		f 4 -107 -156 -756 754
		mu 0 4 436 40 461 253
		f 4 -155 -158 -753 755
		mu 0 4 461 53 416 253
		f 4 -159 -162 -758 756
		mu 0 4 462 55 438 254
		f 4 -161 154 -759 757
		mu 0 4 438 53 461 254
		f 4 155 -106 -760 758
		mu 0 4 461 40 435 254
		f 4 -105 -160 -757 759
		mu 0 4 435 4 462 254
		f 4 49 -166 -762 760
		mu 0 4 463 56 387 255
		f 4 -165 158 -763 761
		mu 0 4 387 54 464 255
		f 4 159 16 -764 762
		mu 0 4 464 13 465 255
		f 4 17 48 -761 763
		mu 0 4 465 22 463 255
		f 4 33 -170 -766 764
		mu 0 4 466 57 406 256
		f 4 -169 -50 -767 765
		mu 0 4 406 56 463 256
		f 4 -49 42 -768 766
		mu 0 4 463 22 467 256
		f 4 43 32 -765 767
		mu 0 4 467 16 466 256
		f 4 21 -174 -770 768
		mu 0 4 468 58 395 257
		f 4 -173 -34 -771 769
		mu 0 4 395 57 466 257
		f 4 -33 26 -772 770
		mu 0 4 466 16 469 257
		f 4 27 20 -769 771
		mu 0 4 469 12 468 257
		f 4 -177 -22 -774 772
		mu 0 4 452 59 470 258
		f 4 -21 126 -775 773
		mu 0 4 470 6 448 258
		f 4 127 134 -776 774
		mu 0 4 448 45 471 258
		f 4 135 -178 -773 775
		mu 0 4 471 60 452 258
		f 4 129 -180 -778 776
		mu 0 4 447 41 472 259
		f 4 -179 -182 -779 777
		mu 0 4 472 61 422 259
		f 4 -181 -136 -780 778
		mu 0 4 422 60 471 259
		f 4 -135 128 -777 779
		mu 0 4 471 45 447 259
		f 4 115 118 -782 780
		mu 0 4 440 42 473 260
		f 4 119 -186 -783 781
		mu 0 4 473 62 377 260
		f 4 -185 178 -784 782
		mu 0 4 377 61 472 260
		f 4 179 114 -781 783
		mu 0 4 472 41 440 260
		f 4 23 -190 -786 784
		mu 0 4 474 63 444 261
		f 4 -189 -120 -787 785
		mu 0 4 444 62 473 261
		f 4 -119 -114 -788 786
		mu 0 4 473 42 439 261
		f 4 -113 22 -785 787
		mu 0 4 439 7 474 261
		f 4 -191 -24 -790 788
		mu 0 4 401 64 475 262
		f 4 -23 -26 -791 789
		mu 0 4 475 10 476 262
		f 4 -25 -138 -792 790
		mu 0 4 476 15 453 262
		f 4 -137 -192 -789 791
		mu 0 4 453 47 401 262
		f 4 261 242 -794 792
		mu 0 4 477 66 478 263
		f 4 243 -260 -795 793
		mu 0 4 478 67 479 263
		f 4 -259 262 -796 794
		mu 0 4 479 68 480 263
		f 4 263 260 -793 795
		mu 0 4 480 65 477 263
		f 4 281 284 -798 796
		mu 0 4 481 70 482 264
		f 4 285 344 -799 797
		mu 0 4 482 71 483 264
		f 4 345 342 -800 798
		mu 0 4 483 72 484 264
		f 4 343 280 -797 799
		mu 0 4 484 69 481 264
		f 4 255 210 -802 800
		mu 0 4 485 74 486 265
		f 4 211 236 -803 801
		mu 0 4 486 75 487 265
		f 4 237 256 -804 802
		mu 0 4 487 76 488 265
		f 4 257 254 -801 803
		mu 0 4 488 73 485 265
		f 4 377 374 -806 804
		mu 0 4 489 78 490 266
		f 4 375 -316 -807 805
		mu 0 4 490 79 491 266
		f 4 -315 316 -808 806
		mu 0 4 491 80 492 266
		f 4 317 376 -805 807
		mu 0 4 492 77 489 266
		f 4 247 336 -810 808
		mu 0 4 493 81 494 267
		f 4 337 -208 -811 809
		mu 0 4 494 82 495 267
		f 4 -207 -244 -812 810
		mu 0 4 495 67 478 267
		f 4 -243 246 -809 811
		mu 0 4 478 66 493 267
		f 4 355 238 -814 812
		mu 0 4 496 84 497 268
		f 4 239 204 -815 813
		mu 0 4 497 85 498 268
		f 4 205 356 -816 814
		mu 0 4 498 86 499 268
		f 4 357 354 -813 815
		mu 0 4 499 83 496 268
		f 4 275 -222 -818 816
		mu 0 4 500 88 501 269
		f 4 -221 216 -819 817
		mu 0 4 501 89 502 269
		f 4 217 -274 -820 818
		mu 0 4 502 90 503 269
		f 4 -273 274 -817 819
		mu 0 4 503 87 500 269
		f 4 363 200 -822 820
		mu 0 4 504 92 505 270
		f 4 201 -360 -823 821
		mu 0 4 505 93 506 270
		f 4 -359 364 -824 822
		mu 0 4 506 94 507 270
		f 4 365 362 -821 823
		mu 0 4 507 91 504 270
		f 4 269 202 -826 824
		mu 0 4 508 96 509 271
		f 4 203 -266 -827 825
		mu 0 4 509 97 510 271
		f 4 -265 270 -828 826
		mu 0 4 510 98 511 271
		f 4 271 268 -825 827
		mu 0 4 511 95 508 271
		f 4 -379 382 -830 828
		mu 0 4 512 99 513 272
		f 4 383 -232 -831 829
		mu 0 4 513 100 514 272
		f 4 -231 -204 -832 830
		mu 0 4 514 97 509 272
		f 4 -203 -380 -829 831
		mu 0 4 509 96 512 272
		f 4 -237 232 -834 832
		mu 0 4 487 75 515 273
		f 4 233 220 -835 833
		mu 0 4 515 89 501 273
		f 4 221 252 -836 834
		mu 0 4 501 88 516 273
		f 4 253 -238 -833 835
		mu 0 4 516 76 487 273
		f 4 359 222 -838 836
		mu 0 4 506 93 517 274
		f 4 223 -356 -839 837
		mu 0 4 517 84 496 274
		f 4 -355 360 -840 838
		mu 0 4 496 83 518 274
		f 4 361 358 -837 839
		mu 0 4 518 94 506 274
		f 4 265 226 -842 840
		mu 0 4 510 97 519 275
		f 4 227 -262 -843 841
		mu 0 4 519 66 477 275
		f 4 -261 266 -844 842
		mu 0 4 477 65 520 275
		f 4 267 264 -841 843
		mu 0 4 520 98 510 275
		f 4 231 332 -846 844
		mu 0 4 514 100 521 276
		f 4 333 -248 -847 845
		mu 0 4 521 81 493 276
		f 4 -247 -228 -848 846
		mu 0 4 493 66 519 276
		f 4 -227 230 -845 847
		mu 0 4 519 97 514 276
		f 4 -251 -254 -850 848
		mu 0 4 522 76 516 277
		f 4 -253 248 -851 849
		mu 0 4 516 88 523 277
		f 4 249 -236 -852 850
		mu 0 4 523 102 524 277
		f 4 -235 -252 -849 851
		mu 0 4 524 101 522 277
		f 4 197 -258 -854 852
		mu 0 4 525 73 488 278
		f 4 -257 250 -855 853
		mu 0 4 488 76 522 278
		f 4 251 -210 -856 854
		mu 0 4 522 101 526 278
		f 4 -209 196 -853 855
		mu 0 4 526 103 525 278
		f 4 295 -344 -858 856
		mu 0 4 527 69 484 279
		f 4 -343 348 -859 857
		mu 0 4 484 72 528 279
		f 4 349 -302 -860 858
		mu 0 4 528 105 529 279
		f 4 -301 294 -857 859
		mu 0 4 529 104 527 279
		f 4 245 -264 -862 860
		mu 0 4 530 65 480 280
		f 4 -263 -196 -863 861
		mu 0 4 480 68 531 280
		f 4 -195 -240 -864 862
		mu 0 4 531 85 497 280
		f 4 -239 244 -861 863
		mu 0 4 497 84 530 280
		f 4 229 -268 -866 864
		mu 0 4 532 98 520 281
		f 4 -267 -246 -867 865
		mu 0 4 520 65 530 281
		f 4 -245 -224 -868 866
		mu 0 4 530 84 517 281
		f 4 -223 228 -865 867
		mu 0 4 517 93 532 281
		f 4 193 -272 -870 868
		mu 0 4 533 95 511 282
		f 4 -271 -230 -871 869
		mu 0 4 511 98 532 282
		f 4 -229 -202 -872 870
		mu 0 4 532 93 505 282
		f 4 -201 192 -869 871
		mu 0 4 505 92 533 282
		f 4 373 -318 -874 872
		mu 0 4 534 77 492 283
		f 4 -317 -326 -875 873
		mu 0 4 492 80 535 283
		f 4 -325 -368 -876 874
		mu 0 4 535 107 536 283
		f 4 -367 372 -873 875
		mu 0 4 536 106 534 283
		f 4 -249 -276 -878 876
		mu 0 4 523 88 500 284
		f 4 -275 -200 -879 877
		mu 0 4 500 87 537 284
		f 4 -199 -220 -880 878
		mu 0 4 537 108 538 284
		f 4 -219 -250 -877 879
		mu 0 4 538 102 523 284
		f 4 259 278 -882 880
		mu 0 4 479 67 539 285
		f 4 279 -282 -883 881
		mu 0 4 539 70 481 285
		f 4 -281 -278 -884 882
		mu 0 4 481 69 540 285
		f 4 -277 258 -881 883
		mu 0 4 540 68 479 285
		f 4 207 340 -886 884
		mu 0 4 541 109 542 286
		f 4 341 -286 -887 885
		mu 0 4 542 71 482 286
		f 4 -285 -280 -888 886
		mu 0 4 482 70 539 286
		f 4 -279 206 -885 887
		mu 0 4 539 67 541 286
		f 4 -255 286 -890 888
		mu 0 4 485 73 543 287
		f 4 287 288 -891 889
		mu 0 4 543 110 544 287
		f 4 289 -284 -892 890
		mu 0 4 544 111 545 287
		f 4 -283 -256 -889 891
		mu 0 4 545 74 485 287
		f 4 195 276 -894 892
		mu 0 4 531 68 540 288
		f 4 277 -296 -895 893
		mu 0 4 540 69 527 288
		f 4 -295 -294 -896 894
		mu 0 4 527 104 546 288
		f 4 -293 194 -893 895
		mu 0 4 546 85 531 288
		f 4 -197 296 -898 896
		mu 0 4 525 103 547 289
		f 4 297 298 -899 897
		mu 0 4 547 112 548 289
		f 4 299 -288 -900 898
		mu 0 4 548 110 543 289
		f 4 -287 -198 -897 899
		mu 0 4 543 73 525 289
		f 4 -205 292 -902 900
		mu 0 4 549 85 546 290
		f 4 293 300 -903 901
		mu 0 4 546 104 529 290
		f 4 301 352 -904 902
		mu 0 4 529 105 550 290
		f 4 353 -206 -901 903
		mu 0 4 550 113 549 290
		f 4 273 304 -906 904
		mu 0 4 503 90 551 291
		f 4 305 -308 -907 905
		mu 0 4 551 114 552 291
		f 4 -307 -304 -908 906
		mu 0 4 552 115 553 291
		f 4 -303 272 -905 907
		mu 0 4 553 87 503 291
		f 4 379 308 -910 908
		mu 0 4 554 117 555 292
		f 4 309 -376 -911 909
		mu 0 4 555 79 490 292
		f 4 -375 380 -912 910
		mu 0 4 490 78 556 292
		f 4 381 378 -909 911
		mu 0 4 556 116 554 292
		f 4 -269 312 -914 912
		mu 0 4 557 118 558 293
		f 4 313 314 -915 913
		mu 0 4 558 80 491 293
		f 4 315 -310 -916 914
		mu 0 4 491 79 555 293
		f 4 -309 -270 -913 915
		mu 0 4 555 117 557 293
		f 4 199 302 -918 916
		mu 0 4 537 87 553 294
		f 4 303 -322 -919 917
		mu 0 4 553 115 559 294
		f 4 -321 -320 -920 918
		mu 0 4 559 119 560 294
		f 4 -319 198 -917 919
		mu 0 4 560 108 537 294
		f 4 -193 322 -922 920
		mu 0 4 561 120 562 295
		f 4 323 324 -923 921
		mu 0 4 562 107 535 295
		f 4 325 -314 -924 922
		mu 0 4 535 80 558 295
		f 4 -313 -194 -921 923
		mu 0 4 558 118 561 295
		f 4 -363 368 -926 924
		mu 0 4 563 121 564 296
		f 4 369 366 -927 925
		mu 0 4 564 106 536 296
		f 4 367 -324 -928 926
		mu 0 4 536 107 562 296
		f 4 -323 -364 -925 927
		mu 0 4 562 120 563 296
		f 4 329 -234 -930 928
		mu 0 4 565 122 566 297
		f 4 -233 -332 -931 929
		mu 0 4 566 123 567 297
		f 4 -331 -334 -932 930
		mu 0 4 567 81 521 297
		f 4 -333 328 -929 931
		mu 0 4 521 100 565 297
		f 4 -337 330 -934 932
		mu 0 4 494 81 567 298
		f 4 331 -212 -935 933
		mu 0 4 567 123 568 298
		f 4 -211 -336 -936 934
		mu 0 4 568 124 569 298
		f 4 -335 -338 -933 935
		mu 0 4 569 82 494 298
		f 4 -341 334 -938 936
		mu 0 4 542 109 570 299
		f 4 335 282 -939 937
		mu 0 4 570 74 545 299
		f 4 283 -340 -940 938
		mu 0 4 545 111 571 299
		f 4 -339 -342 -937 939
		mu 0 4 571 71 542 299
		f 4 -345 338 -942 940
		mu 0 4 483 71 571 300
		f 4 339 -290 -943 941
		mu 0 4 571 111 544 300
		f 4 -289 290 -944 942
		mu 0 4 544 110 572 300
		f 4 291 -346 -941 943
		mu 0 4 572 72 483 300
		f 4 -349 -292 -946 944
		mu 0 4 528 72 572 301
		f 4 -291 -300 -947 945
		mu 0 4 572 110 548 301
		f 4 -299 -348 -948 946
		mu 0 4 548 112 573 301
		f 4 -347 -350 -945 947
		mu 0 4 573 105 528 301
		f 4 -351 -354 -950 948
		mu 0 4 574 113 550 302
		f 4 -353 346 -951 949
		mu 0 4 550 105 573 302
		f 4 347 -298 -952 950
		mu 0 4 573 112 547 302
		f 4 -297 -352 -949 951
		mu 0 4 547 103 574 302
		f 4 241 -358 -954 952
		mu 0 4 575 83 499 303
		f 4 -357 350 -955 953
		mu 0 4 499 86 576 303
		f 4 351 208 -956 954
		mu 0 4 576 126 577 303
		f 4 209 240 -953 955
		mu 0 4 577 125 575 303
		f 4 225 -362 -958 956
		mu 0 4 578 94 518 304
		f 4 -361 -242 -959 957
		mu 0 4 518 83 575 304
		f 4 -241 234 -960 958
		mu 0 4 575 125 579 304
		f 4 235 224 -957 959
		mu 0 4 579 127 578 304
		f 4 213 -366 -962 960
		mu 0 4 580 91 507 305
		f 4 -365 -226 -963 961
		mu 0 4 507 94 578 305
		f 4 -225 218 -964 962
		mu 0 4 578 127 581 305
		f 4 219 212 -961 963
		mu 0 4 581 128 580 305
		f 4 -369 -214 -966 964
		mu 0 4 564 121 582 306
		f 4 -213 318 -967 965
		mu 0 4 582 108 560 306
		f 4 319 326 -968 966
		mu 0 4 560 119 583 306
		f 4 327 -370 -965 967
		mu 0 4 583 106 564 306
		f 4 321 -372 -970 968
		mu 0 4 559 115 584 307
		f 4 -371 -374 -971 969
		mu 0 4 584 77 534 307
		f 4 -373 -328 -972 970
		mu 0 4 534 106 583 307
		f 4 -327 320 -969 971
		mu 0 4 583 119 559 307
		f 4 307 310 -974 972
		mu 0 4 552 114 585 308
		f 4 311 -378 -975 973
		mu 0 4 585 78 489 308
		f 4 -377 370 -976 974
		mu 0 4 489 77 584 308
		f 4 371 306 -973 975
		mu 0 4 584 115 552 308
		f 4 215 -382 -978 976
		mu 0 4 586 116 556 309
		f 4 -381 -312 -979 977
		mu 0 4 556 78 585 309
		f 4 -311 -306 -980 978
		mu 0 4 585 114 551 309
		f 4 -305 214 -977 979
		mu 0 4 551 90 586 309
		f 4 -383 -216 -982 980
		mu 0 4 513 99 587 310
		f 4 -215 -218 -983 981
		mu 0 4 587 129 588 310
		f 4 -217 -330 -984 982
		mu 0 4 588 122 565 310
		f 4 -329 -384 -981 983
		mu 0 4 565 100 513 310
		f 4 501 498 -986 984
		mu 0 4 589 131 590 311
		f 4 499 -444 -987 985
		mu 0 4 590 132 591 311
		f 4 -443 448 -988 986
		mu 0 4 591 133 592 311
		f 4 449 500 -985 987
		mu 0 4 592 130 589 311
		f 4 443 398 -990 988
		mu 0 4 591 132 593 312
		f 4 399 412 -991 989
		mu 0 4 593 134 594 312
		f 4 413 444 -992 990
		mu 0 4 594 135 595 312
		f 4 445 442 -989 991
		mu 0 4 595 133 591 312
		f 4 463 402 -994 992
		mu 0 4 596 137 597 313
		f 4 403 476 -995 993
		mu 0 4 597 138 598 313
		f 4 477 474 -996 994
		mu 0 4 598 139 599 313
		f 4 475 462 -993 995
		mu 0 4 599 136 596 313
		f 4 451 418 -998 996
		mu 0 4 600 141 601 314
		f 4 419 -448 -999 997
		mu 0 4 601 142 602 314
		f 4 -447 452 -1000 998
		mu 0 4 602 143 603 314
		f 4 453 450 -997 999
		mu 0 4 603 140 600 314
		f 4 505 502 -1002 1000
		mu 0 4 604 144 605 315
		f 4 503 -400 -1003 1001
		mu 0 4 605 145 606 315
		f 4 -399 -500 -1004 1002
		mu 0 4 606 132 590 315
		f 4 -499 504 -1001 1003
		mu 0 4 590 131 604 315
		f 4 493 490 -1006 1004
		mu 0 4 607 147 608 316
		f 4 491 396 -1007 1005
		mu 0 4 608 148 609 316
		f 4 397 416 -1008 1006
		mu 0 4 609 149 610 316
		f 4 417 492 -1005 1007
		mu 0 4 610 146 607 316
		f 4 471 -414 -1010 1008
		mu 0 4 611 135 594 317
		f 4 -413 408 -1011 1009
		mu 0 4 594 134 612 317
		f 4 409 428 -1012 1010
		mu 0 4 612 151 613 317
		f 4 429 470 -1009 1011
		mu 0 4 613 150 611 317
		f 4 489 -418 -1014 1012
		mu 0 4 614 146 610 318
		f 4 -417 410 -1015 1013
		mu 0 4 610 149 615 318
		f 4 411 432 -1016 1014
		mu 0 4 615 153 616 318
		f 4 433 488 -1013 1015
		mu 0 4 616 152 614 318
		f 4 455 434 -1018 1016
		mu 0 4 617 155 618 319
		f 4 435 -452 -1019 1017
		mu 0 4 618 141 600 319
		f 4 -451 456 -1020 1018
		mu 0 4 600 140 619 319
		f 4 457 454 -1017 1019
		mu 0 4 619 154 617 319
		f 4 -503 508 -1022 1020
		mu 0 4 605 144 620 320
		f 4 509 506 -1023 1021
		mu 0 4 620 156 621 320
		f 4 507 -410 -1024 1022
		mu 0 4 621 157 622 320
		f 4 -409 -504 -1021 1023
		mu 0 4 622 145 605 320
		f 4 -429 424 -1026 1024
		mu 0 4 613 151 623 321
		f 4 425 -464 -1027 1025
		mu 0 4 623 137 596 321
		f 4 -463 468 -1028 1026
		mu 0 4 596 136 624 321
		f 4 469 -430 -1025 1027
		mu 0 4 624 150 613 321
		f 4 485 -434 -1030 1028
		mu 0 4 625 152 616 322
		f 4 -433 426 -1031 1029
		mu 0 4 616 153 626 322
		f 4 427 400 -1032 1030
		mu 0 4 626 159 627 322
		f 4 401 484 -1029 1031
		mu 0 4 627 158 625 322
		f 4 459 406 -1034 1032
		mu 0 4 628 161 629 323
		f 4 407 -456 -1035 1033
		mu 0 4 629 155 617 323
		f 4 -455 460 -1036 1034
		mu 0 4 617 154 630 323
		f 4 461 458 -1033 1035
		mu 0 4 630 160 628 323
		f 4 -507 510 -1038 1036
		mu 0 4 621 156 631 324
		f 4 511 -404 -1039 1037
		mu 0 4 631 162 632 324
		f 4 -403 -426 -1040 1038
		mu 0 4 632 163 633 324
		f 4 -425 -508 -1037 1039
		mu 0 4 633 157 621 324
		f 4 387 -446 -1042 1040
		mu 0 4 634 133 595 325
		f 4 -445 440 -1043 1041
		mu 0 4 595 135 635 325
		f 4 441 -398 -1044 1042
		mu 0 4 635 164 636 325
		f 4 -397 386 -1041 1043
		mu 0 4 636 148 634 325
		f 4 497 -450 -1046 1044
		mu 0 4 637 130 592 326
		f 4 -449 -388 -1047 1045
		mu 0 4 592 133 634 326
		f 4 -387 -492 -1048 1046
		mu 0 4 634 148 608 326
		f 4 -491 496 -1045 1047
		mu 0 4 608 147 637 326
		f 4 421 -454 -1050 1048
		mu 0 4 638 140 603 327
		f 4 -453 -386 -1051 1049
		mu 0 4 603 143 639 327
		f 4 -385 -416 -1052 1050
		mu 0 4 639 166 640 327
		f 4 -415 420 -1049 1051
		mu 0 4 640 165 638 327
		f 4 437 -458 -1054 1052
		mu 0 4 641 154 619 328
		f 4 -457 -422 -1055 1053
		mu 0 4 619 140 638 328
		f 4 -421 -432 -1056 1054
		mu 0 4 638 165 642 328
		f 4 -431 436 -1053 1055
		mu 0 4 642 167 641 328
		f 4 391 -462 -1058 1056
		mu 0 4 643 160 630 329
		f 4 -461 -438 -1059 1057
		mu 0 4 630 154 641 329
		f 4 -437 -406 -1060 1058
		mu 0 4 641 167 644 329
		f 4 -405 390 -1057 1059
		mu 0 4 644 168 643 329
		f 4 389 -476 -1062 1060
		mu 0 4 645 136 599 330
		f 4 -475 480 -1063 1061
		mu 0 4 599 139 646 330
		f 4 481 -402 -1064 1062
		mu 0 4 646 170 647 330
		f 4 -401 388 -1061 1063
		mu 0 4 647 169 645 330
		f 4 -467 -470 -1066 1064
		mu 0 4 648 150 624 331
		f 4 -469 -390 -1067 1065
		mu 0 4 624 136 645 331
		f 4 -389 -428 -1068 1066
		mu 0 4 645 169 649 331
		f 4 -427 -468 -1065 1067
		mu 0 4 649 171 648 331
		f 4 -441 -472 -1070 1068
		mu 0 4 635 135 611 332
		f 4 -471 466 -1071 1069
		mu 0 4 611 150 648 332
		f 4 467 -412 -1072 1070
		mu 0 4 648 171 650 332
		f 4 -411 -442 -1069 1071
		mu 0 4 650 164 635 332
		f 4 -477 472 -1074 1072
		mu 0 4 598 138 651 333
		f 4 473 -460 -1075 1073
		mu 0 4 651 161 628 333
		f 4 -459 464 -1076 1074
		mu 0 4 628 160 652 333
		f 4 465 -478 -1073 1075
		mu 0 4 652 139 598 333
		f 4 -481 -466 -1078 1076
		mu 0 4 646 139 652 334
		f 4 -465 -392 -1079 1077
		mu 0 4 652 160 643 334
		f 4 -391 -480 -1080 1078
		mu 0 4 643 168 653 334
		f 4 -479 -482 -1077 1079
		mu 0 4 653 170 646 334
		f 4 405 -484 -1082 1080
		mu 0 4 654 173 655 335
		f 4 -483 -486 -1083 1081
		mu 0 4 655 152 625 335
		f 4 -485 478 -1084 1082
		mu 0 4 625 158 656 335
		f 4 479 404 -1081 1083
		mu 0 4 656 172 654 335
		f 4 431 -488 -1086 1084
		mu 0 4 657 174 658 336
		f 4 -487 -490 -1087 1085
		mu 0 4 658 146 614 336
		f 4 -489 482 -1088 1086
		mu 0 4 614 152 655 336
		f 4 483 430 -1085 1087
		mu 0 4 655 173 657 336
		f 4 415 392 -1090 1088
		mu 0 4 659 175 660 337
		f 4 393 -494 -1091 1089
		mu 0 4 660 147 607 337
		f 4 -493 486 -1092 1090
		mu 0 4 607 146 658 337
		f 4 487 414 -1089 1091
		mu 0 4 658 174 659 337
		f 4 385 -496 -1094 1092
		mu 0 4 661 176 662 338
		f 4 -495 -498 -1095 1093
		mu 0 4 662 130 637 338
		f 4 -497 -394 -1096 1094
		mu 0 4 637 147 660 338
		f 4 -393 384 -1093 1095
		mu 0 4 660 175 661 338
		f 4 447 394 -1098 1096
		mu 0 4 663 177 664 339
		f 4 395 -502 -1099 1097
		mu 0 4 664 131 589 339
		f 4 -501 494 -1100 1098
		mu 0 4 589 130 662 339
		f 4 495 446 -1097 1099
		mu 0 4 662 176 663 339;
	setAttr ".fc[500:599]"
		f 4 -419 422 -1102 1100
		mu 0 4 665 178 666 340
		f 4 423 -506 -1103 1101
		mu 0 4 666 144 604 340
		f 4 -505 -396 -1104 1102
		mu 0 4 604 131 664 340
		f 4 -395 -420 -1101 1103
		mu 0 4 664 177 665 340
		f 4 -509 -424 -1106 1104
		mu 0 4 620 144 666 341
		f 4 -423 -436 -1107 1105
		mu 0 4 666 178 667 341
		f 4 -435 438 -1108 1106
		mu 0 4 667 179 668 341
		f 4 439 -510 -1105 1107
		mu 0 4 668 156 620 341
		f 4 -511 -440 -1110 1108
		mu 0 4 631 156 668 342
		f 4 -439 -408 -1111 1109
		mu 0 4 668 179 669 342
		f 4 -407 -474 -1112 1110
		mu 0 4 669 180 670 342
		f 4 -473 -512 -1109 1111
		mu 0 4 670 162 631 342
		f 4 513 596 -1114 1112
		mu 0 4 671 182 672 343
		f 4 597 594 -1115 1113
		mu 0 4 672 183 673 343
		f 4 595 -522 -1116 1114
		mu 0 4 673 184 674 343
		f 4 -521 512 -1113 1115
		mu 0 4 674 181 671 343
		f 4 515 580 -1118 1116
		mu 0 4 675 186 676 344
		f 4 581 -518 -1119 1117
		mu 0 4 676 187 677 344
		f 4 -517 -526 -1120 1118
		mu 0 4 677 188 678 344
		f 4 -525 514 -1117 1119
		mu 0 4 678 185 675 344
		f 4 561 588 -1122 1120
		mu 0 4 679 190 680 345
		f 4 589 -520 -1123 1121
		mu 0 4 680 191 681 345
		f 4 -519 -556 -1124 1122
		mu 0 4 681 192 682 345
		f 4 -555 560 -1121 1123
		mu 0 4 682 189 679 345
		f 4 519 592 -1126 1124
		mu 0 4 681 191 683 346
		f 4 593 -514 -1127 1125
		mu 0 4 683 193 684 346
		f 4 -513 -534 -1128 1126
		mu 0 4 684 194 685 346
		f 4 -533 518 -1125 1127
		mu 0 4 685 192 681 346
		f 4 -535 -564 -1130 1128
		mu 0 4 686 196 687 347
		f 4 -563 568 -1131 1129
		mu 0 4 687 197 688 347
		f 4 569 -524 -1132 1130
		mu 0 4 688 198 689 347
		f 4 -523 -536 -1129 1131
		mu 0 4 689 195 686 347
		f 4 533 520 -1134 1132
		mu 0 4 690 181 674 348
		f 4 521 556 -1135 1133
		mu 0 4 674 184 691 348
		f 4 557 554 -1136 1134
		mu 0 4 691 200 692 348
		f 4 555 532 -1133 1135
		mu 0 4 692 199 690 348
		f 4 537 526 -1138 1136
		mu 0 4 693 202 694 349
		f 4 527 -540 -1139 1137
		mu 0 4 694 203 695 349
		f 4 -539 -542 -1140 1138
		mu 0 4 695 204 696 349
		f 4 -541 536 -1137 1139
		mu 0 4 696 201 693 349
		f 4 -559 564 -1142 1140
		mu 0 4 697 206 698 350
		f 4 565 562 -1143 1141
		mu 0 4 698 207 699 350
		f 4 563 -544 -1144 1142
		mu 0 4 699 208 700 350
		f 4 -543 -560 -1141 1143
		mu 0 4 700 205 697 350
		f 4 -549 542 -1146 1144
		mu 0 4 701 205 700 351
		f 4 543 534 -1147 1145
		mu 0 4 700 208 702 351
		f 4 535 -548 -1148 1146
		mu 0 4 702 210 703 351
		f 4 -547 -550 -1145 1147
		mu 0 4 703 209 701 351
		f 4 -551 546 -1150 1148
		mu 0 4 704 212 705 352
		f 4 547 522 -1151 1149
		mu 0 4 705 195 689 352
		f 4 523 572 -1152 1150
		mu 0 4 689 198 706 352
		f 4 573 -552 -1149 1151
		mu 0 4 706 211 704 352
		f 4 -557 552 -1154 1152
		mu 0 4 691 184 707 353
		f 4 553 524 -1155 1153
		mu 0 4 707 185 708 353
		f 4 525 528 -1156 1154
		mu 0 4 708 213 709 353
		f 4 529 -558 -1153 1155
		mu 0 4 709 200 691 353
		f 4 517 584 -1158 1156
		mu 0 4 677 187 710 354
		f 4 585 -562 -1159 1157
		mu 0 4 710 190 679 354
		f 4 -561 -530 -1160 1158
		mu 0 4 679 189 711 354
		f 4 -529 516 -1157 1159
		mu 0 4 711 188 677 354
		f 4 -565 -546 -1162 1160
		mu 0 4 698 206 712 355
		f 4 -545 538 -1163 1161
		mu 0 4 712 204 695 355
		f 4 539 530 -1164 1162
		mu 0 4 695 203 713 355
		f 4 531 -566 -1161 1163
		mu 0 4 713 207 698 355
		f 4 -569 -532 -1166 1164
		mu 0 4 688 197 714 356
		f 4 -531 -528 -1167 1165
		mu 0 4 714 214 715 356
		f 4 -527 -568 -1168 1166
		mu 0 4 715 202 716 356
		f 4 -567 -570 -1165 1167
		mu 0 4 716 198 688 356
		f 4 -571 -574 -1170 1168
		mu 0 4 717 211 706 357
		f 4 -573 566 -1171 1169
		mu 0 4 706 198 716 357
		f 4 567 -538 -1172 1170
		mu 0 4 716 202 693 357
		f 4 -537 -572 -1169 1171
		mu 0 4 693 201 717 357
		f 4 -595 598 -1174 1172
		mu 0 4 673 183 718 358
		f 4 599 -516 -1175 1173
		mu 0 4 718 186 675 358
		f 4 -515 -554 -1176 1174
		mu 0 4 675 185 707 358
		f 4 -553 -596 -1173 1175
		mu 0 4 707 184 673 358
		f 4 577 540 -1178 1176
		mu 0 4 719 201 696 359
		f 4 541 -580 -1179 1177
		mu 0 4 696 204 720 359
		f 4 -579 -582 -1180 1178
		mu 0 4 720 187 676 359
		f 4 -581 576 -1177 1179
		mu 0 4 676 186 719 359
		f 4 -585 578 -1182 1180
		mu 0 4 710 187 720 360
		f 4 579 544 -1183 1181
		mu 0 4 720 204 712 360
		f 4 545 -584 -1184 1182
		mu 0 4 712 206 721 360
		f 4 -583 -586 -1181 1183
		mu 0 4 721 190 710 360
		f 4 -589 582 -1186 1184
		mu 0 4 680 190 721 361
		f 4 583 558 -1187 1185
		mu 0 4 721 206 697 361
		f 4 559 -588 -1188 1186
		mu 0 4 697 205 722 361
		f 4 -587 -590 -1185 1187
		mu 0 4 722 191 680 361
		f 4 -593 586 -1190 1188
		mu 0 4 683 191 722 362
		f 4 587 548 -1191 1189
		mu 0 4 722 205 701 362
		f 4 549 -592 -1192 1190
		mu 0 4 701 209 723 362
		f 4 -591 -594 -1189 1191
		mu 0 4 723 193 683 362
		f 4 -597 590 -1194 1192
		mu 0 4 672 182 724 363
		f 4 591 550 -1195 1193
		mu 0 4 724 212 704 363
		f 4 551 574 -1196 1194
		mu 0 4 704 211 725 363
		f 4 575 -598 -1193 1195
		mu 0 4 725 183 672 363
		f 4 -599 -576 -1198 1196
		mu 0 4 718 183 725 364
		f 4 -575 570 -1199 1197
		mu 0 4 725 211 717 364
		f 4 571 -578 -1200 1198
		mu 0 4 717 201 719 364
		f 4 -577 -600 -1197 1199
		mu 0 4 719 186 718 364;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "grp_l_leg" -p "grp_leg";
createNode transform -n "grp_ctrl_l1_leg" -p "grp_l_leg";
createNode transform -n "ctrl_l1_leg" -p "grp_ctrl_l1_leg";
	addAttr -ci true -k true -sn "twist" -ln "twist" -at "double";
	addAttr -ci true -k true -sn "stretch" -ln "stretch" -at "double";
	addAttr -ci true -k true -sn "foot_roll" -ln "foot_roll" -at "double";
	addAttr -ci true -k true -sn "roll_break" -ln "roll_break" -at "double";
	addAttr -ci true -k true -sn "foot_twist" -ln "foot_twist" -at "double";
	addAttr -ci true -k true -sn "foot_bank" -ln "foot_bank" -at "double";
	addAttr -ci true -k true -sn "pivot_posX" -ln "pivot_posX" -at "double";
	addAttr -ci true -k true -sn "pivot_posZ" -ln "pivot_posZ" -at "double";
	addAttr -ci true -k true -sn "toe_flap" -ln "toe_flap" -at "double";
	addAttr -ci true -sn "twist_offset" -ln "twist_offset" -at "double";
	addAttr -ci true -sn "Bend_Vis" -ln "Bend_Vis" -min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -sn "Follow" -ln "Follow" -min 0 -max 1 -en "off:on" -at "enum";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".twist";
	setAttr -k on ".stretch";
	setAttr -k on ".foot_roll";
	setAttr -k on ".roll_break";
	setAttr -k on ".foot_twist";
	setAttr -k on ".foot_bank";
	setAttr -k on ".pivot_posX";
	setAttr -k on ".pivot_posZ";
	setAttr -k on ".toe_flap";
	setAttr ".twist_offset" 1.7075472925031877e-006;
	setAttr -k on ".Bend_Vis";
	setAttr -k on ".Follow";
createNode nurbsCurve -n "cc_l_foot" -p "ctrl_l1_leg";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 50 0 no 3
		51 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
		 33 34 35 36 37 38 39 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69
		51
		-0.22939884756396847 -3.6519363809555161 12.852948423243188
		-0.69045686499719516 -3.6519363809555161 12.792675897048779
		-1.1176772072471923 -3.6519363809555161 12.586793534482705
		-1.5073087241032612 -3.6519363809555161 12.32761423538501
		-1.9182855294822441 -3.6519363809555161 11.958095166191224
		-2.2592685405267181 -3.6519363809555161 11.391013107392908
		-2.4906277752981238 -3.6519363809555161 10.657658471354143
		-2.5537448996305736 -3.6519363809555161 9.7669672932138241
		-2.4796113839790377 -3.6519363809555161 8.6327190603591362
		-2.3710440671283481 -3.6519363809555161 7.7337047916920527
		-2.3141234166093945 -3.6519363809555161 6.4572630584822877
		-2.364024716436778 -3.6519363809555161 5.3770373571191525
		-2.552814904767104 -3.6519363809555161 4.5222984174868959
		-2.7202426393857633 -3.6519363809555161 3.3171457289533217
		-2.6508397244181157 -3.6519363809555161 2.2973487668813104
		-2.5737592715944753 -3.6519363809555161 1.6826260620879232
		-2.3298464525701368 -3.6519363809555161 1.1037139529865139
		-1.941919306233828 -3.6519363809555161 0.54546549660994181
		-1.4960535117514513 -3.6519363809555161 0.17246544502344491
		-0.87105495378591025 -3.6519363809555161 -0.023969478236297054
		-0.32428796028004653 -3.6519363809555161 -0.028715275931549725
		0.23234300916978456 -3.6519363809555161 0.10541048898570696
		0.6594471925135309 -3.6519363809555161 0.32227382812260924
		1.0779827390977179 -3.6519363809555161 0.62663485089596538
		1.3762077809005615 -3.6519363809555161 0.94956427078530814
		1.5397279591448574 -3.6519363809555161 1.2651640130605755
		1.8062304193586778 -3.6519363809555161 2.7495337923451553
		1.8845915355280263 -3.6519363809555161 3.5816891023147357
		2.0586749752694407 -3.6519363809555161 4.7784558171492826
		2.1967969110003431 -3.6519363809555161 5.5414763098108928
		2.3618737311109155 -3.6519363809555161 6.5544817768146109
		2.5553487325797466 -3.6519363809555161 7.8148976761934223
		-2.3644095019575593 -3.6519363809555161 7.7303396814851064
		-2.4796113839790377 -3.6519363809555161 8.6327190603591362
		-2.5537448996305736 -3.6519363809555161 9.7669672932138241
		-2.4906277752981238 -3.6519363809555161 10.657658471354143
		-2.2592685405267181 -3.6519363809555161 11.391013107392908
		-1.9182855294822441 -3.6519363809555161 11.958095166191224
		-1.5073087241032612 -3.6519363809555161 12.32761423538501
		-1.1176772072471923 -3.6519363809555161 12.586793534482705
		-0.69045686499719516 -3.6519363809555161 12.792675897048779
		-0.22939884756396847 -3.6519363809555161 12.852948423243188
		0.24330362651175236 -3.6519363809555161 12.79534218485299
		0.70861261691656163 -3.6519363809555161 12.594033442628742
		1.1624386539072473 -3.6519363809555161 12.313606209587048
		1.5966549741340565 -3.6519363809555161 11.914883401682024
		2.0067512628903277 -3.6519363809555161 11.400322615114522
		2.3538846665807367 -3.6519363809555161 10.733243515702895
		2.6224983058182012 -3.6519363809555161 9.8582238831772759
		2.7202426393857633 -3.6519363809555161 8.7323550833158325
		2.5553487325797466 -3.6519363809555161 7.8148976761934223
		;
createNode transform -n "lctrDis_End_l1_leg" -p "ctrl_l1_leg";
	setAttr ".t" -type "double3" -6.0990168179635564e-015 -3.5527136788005009e-015 
		0 ;
createNode locator -n "lctrDis_End_l1_legShape" -p "lctrDis_End_l1_leg";
	setAttr -k off ".v";
createNode transform -n "grp_footPivot_l1_leg" -p "ctrl_l1_leg";
	setAttr ".t" -type "double3" 1.0996709147522873e-007 -3.3375313553841517 6.2972297040314942 ;
createNode transform -n "grp_heel_l1_leg" -p "grp_footPivot_l1_leg";
	setAttr ".t" -type "double3" 2.3393377488125089e-007 -0.13223628194392489 -8.9756255071668534 ;
createNode transform -n "grp_toe_l1_leg" -p "grp_heel_l1_leg";
	setAttr ".t" -type "double3" -3.820844080307907e-007 0.13223692956226421 14.706104220593872 ;
createNode transform -n "grp_ball_l1_leg" -p "grp_toe_l1_leg";
	setAttr ".t" -type "double3" 1.4815063314953981e-007 -6.4761833931670232e-007 -5.7304787134270185 ;
createNode ikHandle -n "ikh_ball_l1_leg" -p "grp_ball_l1_leg";
	setAttr ".r" -type "double3" -89.999998129204528 37.665404358555556 -89.999998328842267 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999978 ;
	setAttr ".roc" yes;
createNode ikHandle -n "ikHandle_l1_leg" -p "grp_ball_l1_leg";
	setAttr ".t" -type "double3" -1.0996709757424555e-007 3.3375313553841481 -6.2972297040314942 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ikHandle_l1_leg_poleVectorConstraint1" -p "ikHandle_l1_leg";
	addAttr -ci true -k true -sn "w0" -ln "pv_l1_legW0" -dv 1 -min 0 -at "double";
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
	setAttr -k on ".w0";
createNode transform -n "grp_flap_l1_leg" -p "grp_toe_l1_leg";
	setAttr ".t" -type "double3" 1.4815063314953981e-007 -6.4761833931670232e-007 -5.7304787134270185 ;
createNode ikHandle -n "ikh_toe_l1_leg" -p "grp_flap_l1_leg";
	setAttr ".t" -type "double3" -1.4815063314953981e-007 6.4761833930976342e-007 5.7304787134270185 ;
	setAttr ".r" -type "double3" -102.88539139501593 -89.99999335756533 102.88539195698193 ;
	setAttr ".s" -type "double3" 1 1 1.0000000000000002 ;
	setAttr ".roc" yes;
createNode transform -n "lctrTwist_l1_leg" -p "ctrl_l1_leg";
	setAttr ".t" -type "double3" 0 -3.3739698736774724 0 ;
createNode locator -n "lctrTwist_l1_legShape" -p "lctrTwist_l1_leg";
	setAttr -k off ".v";
createNode parentConstraint -n "grp_ctrl_l1_leg_parentConstraint1" -p "grp_ctrl_l1_leg";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_rootW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 4.1322209237484957 -22.380249307989473 -0.43145917255302457 ;
	setAttr ".lr" -type "double3" -24.0066859878267 8.672264586113771 4.0216731715049584e-016 ;
	setAttr ".rst" -type "double3" -6.3937388716794885e-010 3.3723904625183394 -4.0887694199742892 ;
	setAttr -k on ".w0";
createNode transform -n "disDimNode_Stretchl1_leg" -p "grp_l_leg";
createNode distanceDimShape -n "disDimNode_Stretchl1_legShape" -p "disDimNode_Stretchl1_leg";
	setAttr -k off ".v";
createNode joint -n "rig_hip" -p "grp_leg";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999986 -19.776076602639225 -89.999999999999986 ;
	setAttr ".bps" -type "matrix" 3.3306690738754696e-016 -0.941022124259278 0.33834503344153882 0
		 5.5511151231257815e-017 0.33834503344153866 0.941022124259278 0 -1.0000000000000002 -3.3306690738754686e-016 2.2204460492503131e-016 0
		 4.9993955492966161e-015 25.891286247309651 -2.757631809472838 1;
	setAttr ".radi" 1.0954732393799134;
createNode joint -n "rig_knee" -p "rig_hip";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999901722595 4.739395799433465e-023 -47.121103403589309 ;
	setAttr ".bps" -type "matrix" 1.8595749931938513e-016 -0.88825652123574983 -0.45934774679121221 0
		 -1.7152643265924141e-008 0.45934774679121232 -0.88825652123574994 0 1.0000000000000002 7.8790282393191764e-009 -1.5235947209084277e-008 0
		 5.1104771028883045e-015 14.117108568565861 1.4484991512555272 1;
	setAttr ".radi" 1.0729152283449404;
createNode joint -n "rig_ankle" -p "rig_knee";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 106.77387745294337 -89.999998797483883 -44.118905306967498 ;
	setAttr ".bps" -type "matrix" 1.0000000000000004 -1.2215827734660179e-008 -9.1789479205587112e-009 0
		 1.2215827800810352e-008 0.99999999999999967 -2.1841098069872633e-008 0 9.1789480774445307e-009 2.1841097882518649e-008 1 0
		 -6.3937500876759665e-010 3.4072495682836657 -4.0887693968540795 1;
	setAttr ".radi" 1.0729152283449404;
createNode joint -n "rig_ball" -p "rig_ankle";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -111.01886620197914 -89.999994403885111 111.01886731842643 ;
createNode joint -n "rig_toe" -p "rig_ball";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 89.999999998434362 0 ;
createNode parentConstraint -n "rig_toe_parentConstraint1" -p "rig_toe";
	addAttr -ci true -k true -sn "w0" -ln "ikj_toeW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -4.9671261400589372e-016 -3.8233305410528828e-015 
		1.7763568394002505e-015 ;
	setAttr ".tg[0].tor" -type "double3" 6.9880350436313681e-015 -3.775114937667208e-015 
		-5.583660576392072e-008 ;
	setAttr ".rst" -type "double3" 5.7304787134270585 3.3306690738754696e-016 -8.9295658549514594e-016 ;
	setAttr -k on ".w0";
createNode ikEffector -n "effector8" -p "rig_ball";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5.7304787134270567 3.3111138467200437e-016 -8.9295658337549562e-016 ;
	setAttr ".hd" yes;
createNode parentConstraint -n "rig_ball_parentConstraint1" -p "rig_ball";
	addAttr -ci true -k true -sn "w0" -ln "ikj_ballW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -1.3322676295501878e-015 -3.5457747848965937e-015 
		1.852884572118782e-022 ;
	setAttr ".tg[0].tor" -type "double3" -5.5836617853135753e-008 -4.9663429047443267e-015 
		4.1568929652466475e-015 ;
	setAttr ".lr" -type "double3" -2.6961114131605605e-007 6.2096983604163857e-007 2.4250468934990153e-005 ;
	setAttr ".rst" -type "double3" 9.3361690513637999e-008 -3.3723906000567436 6.2972296303747797 ;
	setAttr ".rsrr" -type "double3" 1.0442300945337934e-007 2.0684217631765054e-014 
		7.1668900810455444e-015 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "rig_ankle_parentConstraint1" -p "rig_ankle";
	addAttr -ci true -k true -sn "w0" -ln "ikj_ankleW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -0.027594632544847564 0.021300917108011852 
		-2.4181701240616907e-007 ;
	setAttr ".tg[0].tor" -type "double3" 31.461427464173347 -89.999997647312568 20.873167256758329 ;
	setAttr ".lr" -type "double3" -32.17231848201267 -7.1396711427632535 1.9174581668052451 ;
	setAttr ".rst" -type "double3" 12.056633929469108 -0.0010346901414015619 -6.5713009816660444e-010 ;
	setAttr ".rsrr" -type "double3" 3.7265732745676685e-007 5.2514111006203109e-007 
		-1.0190029004682155e-006 ;
	setAttr -k on ".w0";
createNode ikHandle -n "ikHandle2" -p "rig_ankle";
	setAttr ".t" -type "double3" -0.0013434507683571795 -0.021824992689388978 -0.021820692808262265 ;
	setAttr ".r" -type "double3" -95.300637541933455 40.748532571135122 -93.932832785116503 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999956 0.99999999999999956 ;
	setAttr ".pv" -type "double3" -9.1789476408547305e-009 -2.2570075262086122e-008 
		0.99999999999999956 ;
	setAttr ".roc" yes;
createNode transform -n "cluster6Handle" -p "rig_ankle";
	setAttr ".t" -type "double3" 8.0176675165688494e-007 -1.9093373380268004 -4.9717555422529314 ;
	setAttr ".s" -type "double3" 0.99999999999999922 0.99999999999999956 0.99999999999999922 ;
	setAttr ".rp" -type "double3" -6.3937500876526225e-010 3.4072495682837229 -4.0887693968541852 ;
	setAttr ".rpt" -type "double3" -8.0111054490793649e-007 -1.4970706780024787 9.0565255712597121 ;
	setAttr ".sp" -type "double3" -6.3937500876526276e-010 3.4072495682837243 -4.0887693968541887 ;
	setAttr ".spt" -type "double3" 5.1698788284564193e-025 -1.3322676295501873e-015 
		3.5527136788004982e-015 ;
createNode clusterHandle -n "cluster6HandleShape" -p "cluster6Handle";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.8609563130517535e-010 4.2997354139240436 -3.6273270074853432 ;
createNode aimConstraint -n "cluster6Handle_aimConstraint1" -p "cluster6Handle";
	addAttr -ci true -sn "w0" -ln "cluster5HandleW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".o" -type "double3" 152.65497266873982 -89.999999017225932 -179.99532511970637 ;
	setAttr ".rsrr" -type "double3" 152.65497276238136 -89.999999017225932 -89.999999629147013 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "rig_knee_parentConstraint1" -p "rig_knee";
	addAttr -ci true -k true -sn "w0" -ln "ikj_kneeW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 5.3290705182007514e-015 -4.4408920985006262e-015 
		-1.0587911840678754e-022 ;
	setAttr ".tg[0].tor" -type "double3" -2.0556601086223915e-006 1.1492597718513569e-006 
		0.080805184287402396 ;
	setAttr ".lr" -type "double3" 1.8777537901896128e-007 7.1659194127676541e-007 -46.922614609415824 ;
	setAttr ".rst" -type "double3" 12.502885211198389 -0.025672261740448121 2.6636886305897902e-015 ;
	setAttr ".rsrr" -type "double3" -9.3001588367715476e-015 -1.1492597805228456e-006 
		-5.7249984173070313e-014 ;
	setAttr -k on ".w0";
createNode transform -n "cluster4Handle" -p "rig_knee";
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999978 0.99999999999999967 ;
	setAttr ".rp" -type "double3" 5.1104771028883013e-015 14.117108568565859 1.4484991512555256 ;
	setAttr ".rpt" -type "double3" -13.204978573493172 -8.9190853864850048 -1.4484990620956792 ;
	setAttr ".sp" -type "double3" 5.1104771028883045e-015 14.117108568565863 1.4484991512555263 ;
	setAttr ".spt" -type "double3" -3.1554436208840455e-030 -3.5527136788005001e-015 
		-6.6613381477509373e-016 ;
createNode clusterHandle -n "cluster4HandleShape" -p "cluster4Handle";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -5.3276071880432661e-011 13.224609227739753 0.98706713934523116 ;
createNode aimConstraint -n "cluster4Handle_aimConstraint1" -p "cluster4Handle";
	addAttr -ci true -sn "w0" -ln "cluster5HandleW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".o" -type "double3" 332.8372763141428 89.999999017221242 -179.82285659885716 ;
	setAttr ".rsrr" -type "double3" 152.65497175156679 -89.999999017225932 -89.999998516587979 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "cluster4Handle_pointConstraint1" -p "cluster4Handle";
	addAttr -ci true -k true -sn "w0" -ln "curve3W0" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" -0.17816800874213001 0.19108199960875183 3.2775653119899036e-009 ;
	setAttr ".rst" -type "double3" 13.20497856837992 -5.1980231950704789 -8.9159841889840223e-008 ;
	setAttr -k on ".w0";
createNode transform -n "cluster5Handle" -p "rig_knee";
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999978 0.99999999999999967 ;
	setAttr ".rp" -type "double3" -3.196852359197938e-010 8.7621641310948881 -1.3201140938175699 ;
	setAttr ".rpt" -type "double3" -7.1766579998736173 -3.5646838349126062 1.3201141826484124 ;
	setAttr ".sp" -type "double3" -3.1968523591979401e-010 8.7621641310948899 -1.3201140938175706 ;
	setAttr ".spt" -type "double3" 2.067951531382568e-025 -1.7763568394002501e-015 6.6613381477509373e-016 ;
createNode clusterHandle -n "cluster5HandleShape" -p "cluster5Handle";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" -3.1968523591979401e-010 8.7621641310948899 -1.3201140938175706 ;
createNode parentConstraint -n "cluster5Handle_parentConstraint1" -p "cluster5Handle";
	addAttr -ci true -k true -sn "w0" -ln "curve4W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -7.2895291481235564e-024 6.2172489379008766e-015 
		-2.6645352591003757e-015 ;
	setAttr ".tg[0].tor" -type "double3" -33.290952331788787 -6.2792196965097602e-015 
		-3.0957784463478267e-015 ;
	setAttr ".lr" -type "double3" 34.89308855533934 -90.00000106429313 27.761885106004556 ;
	setAttr ".rst" -type "double3" 13.204978568379911 -5.1980231950704745 -8.9159843064123807e-008 ;
	setAttr ".rsrr" -type "double3" -27.345027248907037 -90.000000982774097 90.000000370853002 ;
	setAttr -k on ".w0";
createNode ikHandle -n "ikHandle1" -p "rig_knee";
	setAttr ".t" -type "double3" -3.5993138234791999 3.4953332611471168 0.14410172132109467 ;
	setAttr ".r" -type "double3" 166.1486518801108 -11.080504821963103 -8.5783855442239787 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999967 0.99999999999999944 ;
	setAttr ".pv" -type "double3" -0.45934774679121243 -0.88825652123574939 -1.5235947218879016e-008 ;
	setAttr ".roc" yes;
createNode parentConstraint -n "rig_hip_parentConstraint1" -p "rig_hip";
	addAttr -ci true -k true -sn "w0" -ln "ikj_hipW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 3.5527136788005009e-015 -1.7763568394002505e-015 
		7.9409338805090657e-023 ;
	setAttr ".tg[0].tor" -type "double3" -1.5713201851007388e-006 3.2264218141304645e-009 
		0.11764565988452409 ;
	setAttr ".lr" -type "double3" 1.094467031486335 0.6952504565433516 119.55920272597663 ;
	setAttr ".rst" -type "double3" 4.9993955492966161e-015 25.891286247309651 -2.757631809472838 ;
	setAttr ".rsrr" -type "double3" 6.3611093629270335e-015 -3.2264150994155392e-009 
		-1.7910201651846975e-025 ;
	setAttr -k on ".w0";
createNode transform -n "cluster1Handle" -p "rig_hip";
	setAttr ".t" -type "double3" 24.255397121368627 -6.1630498745229714 9.3588216395193658e-015 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999967 ;
	setAttr ".rp" -type "double3" 4.9993955492966177e-015 24.910102639800026 -2.4071268653277862 ;
	setAttr ".rpt" -type "double3" -24.255397121368631 -18.747052765277065 2.4071268653277764 ;
	setAttr ".sp" -type "double3" 4.9993955492966184e-015 24.910102639800034 -2.4071268653277871 ;
	setAttr ".spt" -type "double3" -7.8886090522101163e-031 -7.1054273576010003e-015 
		8.8817841970012494e-016 ;
createNode clusterHandle -n "cluster1HandleShape" -p "cluster1Handle";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" 4.9993955492966184e-015 24.910102639800034 -2.4071268653277871 ;
createNode aimConstraint -n "cluster1Handle_aimConstraint1" -p "cluster1Handle";
	addAttr -ci true -sn "w0" -ln "cluster2HandleW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".o" -type "double3" -160.34183963405394 -89.999999999999972 0 ;
	setAttr ".rsrr" -type "double3" -70.223923397360792 89.999999999999972 0 ;
	setAttr -k on ".w0";
createNode transform -n "cluster2Handle" -p "rig_hip";
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999967 ;
	setAttr ".rp" -type "double3" 5.0549869313485233e-015 20.004187474228047 -0.65459413671265876 ;
	setAttr ".rpt" -type "double3" -19.045861666155606 -13.85185755934657 0.65459413671264965 ;
	setAttr ".sp" -type "double3" 5.0549869313485241e-015 20.004187474228051 -0.65459413671265909 ;
	setAttr ".spt" -type "double3" -7.8886090522101163e-031 -3.5527136788005001e-015 
		3.3306690738754686e-016 ;
createNode clusterHandle -n "cluster2HandleShape" -p "cluster2Handle";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" 5.0549869313485241e-015 20.004187474228051 -0.65459413671265909 ;
createNode parentConstraint -n "cluster2Handle_parentConstraint1" -p "cluster2Handle";
	addAttr -ci true -k true -sn "w0" -ln "curve4W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -5.0158142936667594e-026 0 5.3290705182007514e-015 ;
	setAttr ".tg[0].tor" -type "double3" 26.705795747420215 1.1769253239522467e-014 
		1.995758138195477e-015 ;
	setAttr ".lr" -type "double3" -68.539910557648511 89.999999999999986 0 ;
	setAttr ".rst" -type "double3" 25.297304211043887 -6.1651955679153456 9.5479180117763478e-015 ;
	setAttr ".rsrr" -type "double3" -70.223923397360792 89.999999999999972 0 ;
	setAttr -k on ".w0";
createNode transform -n "cluster3Handle" -p "rig_hip";
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999967 ;
	setAttr ".rp" -type "double3" 5.1104771028882997e-015 15.098289399774558 1.0979864355393241 ;
	setAttr ".rpt" -type "double3" -13.836326106406293 -8.9566286399187227 -1.0979864355393323 ;
	setAttr ".sp" -type "double3" 5.1104771028883005e-015 15.098289399774561 1.0979864355393245 ;
	setAttr ".spt" -type "double3" -7.8886090522101163e-031 -3.5527136788005001e-015 
		-4.4408920985006247e-016 ;
createNode clusterHandle -n "cluster3HandleShape" -p "cluster3Handle";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".or" -type "double3" 5.1104771028883005e-015 15.098289399774561 1.0979864355393245 ;
createNode aimConstraint -n "cluster3Handle_aimConstraint1" -p "cluster3Handle";
	addAttr -ci true -sn "w0" -ln "cluster2HandleW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".o" -type "double3" 19.658701637396636 89.999999999999986 0 ;
	setAttr ".rsrr" -type "double3" -70.223923397360792 89.999999999999986 0 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "cluster3Handle_pointConstraint1" -p "cluster3Handle";
	addAttr -ci true -k true -sn "w0" -ln "curve3W0" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" -0.26125826907444605 0.00053841988372482774 -1.4470959834206383e-015 ;
	setAttr ".rst" -type "double3" 26.339211317631069 -6.1673330087397034 8.6936531519199097e-015 ;
	setAttr -k on ".w0";
createNode transform -n "nurbsSphere1";
createNode nurbsSurface -n "nurbsSphereShape1" -p "nurbsSphere1";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 1;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 4 ".lnk";
	setAttr -s 4 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr -s 3 ".dli[1:2]"  1 2;
	setAttr -s 3 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode ikSCsolver -n "ikSCsolver";
createNode lambert -n "shd_lytA";
	setAttr ".c" -type "float3" 0.19377162 0.26529479 0.41176471 ;
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode lambert -n "shd_lytB";
	setAttr ".c" -type "float3" 0.72500002 0.53398669 0.28420001 ;
createNode shadingEngine -n "shd_lytBSG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n"
		+ "                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n"
		+ "            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n"
		+ "            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n"
		+ "                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n"
		+ "                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 0\n                -polymeshes 0\n                -subdivSurfaces 0\n                -planes 0\n                -lights 0\n                -cameras 0\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 0\n                -fluids 0\n                -hairSystems 0\n                -follicles 0\n                -nCloths 0\n                -nParticles 0\n                -nRigids 0\n                -dynamicConstraints 0\n                -locators 1\n                -manipulators 1\n                -dimensions 0\n"
		+ "                -handles 0\n                -pivots 0\n                -textures 0\n                -strokes 0\n                -motionTrails 0\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n"
		+ "            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 0\n            -polymeshes 0\n            -subdivSurfaces 0\n            -planes 0\n            -lights 0\n            -cameras 0\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 0\n            -fluids 0\n            -hairSystems 0\n            -follicles 0\n            -nCloths 0\n            -nParticles 0\n            -nRigids 0\n            -dynamicConstraints 0\n            -locators 1\n            -manipulators 1\n            -dimensions 0\n            -handles 0\n            -pivots 0\n            -textures 0\n            -strokes 0\n            -motionTrails 0\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n"
		+ "                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n"
		+ "            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n"
		+ "                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 0\n                -planes 0\n                -lights 0\n                -cameras 0\n                -controlVertices 1\n                -hulls 1\n                -grid 0\n                -joints 0\n                -ikHandles 0\n                -deformers 0\n                -dynamics 0\n                -fluids 0\n"
		+ "                -hairSystems 0\n                -follicles 0\n                -nCloths 0\n                -nParticles 0\n                -nRigids 0\n                -dynamicConstraints 0\n                -locators 0\n                -manipulators 1\n                -dimensions 0\n                -handles 0\n                -pivots 0\n                -textures 0\n                -strokes 0\n                -motionTrails 0\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n"
		+ "            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 0\n            -planes 0\n            -lights 0\n            -cameras 0\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -joints 0\n            -ikHandles 0\n            -deformers 0\n            -dynamics 0\n            -fluids 0\n            -hairSystems 0\n            -follicles 0\n            -nCloths 0\n            -nParticles 0\n            -nRigids 0\n            -dynamicConstraints 0\n            -locators 0\n            -manipulators 1\n            -dimensions 0\n            -handles 0\n            -pivots 0\n            -textures 0\n            -strokes 0\n            -motionTrails 0\n"
		+ "            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n"
		+ "            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n"
		+ "                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph InputOutput1\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph InputOutput1\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 1\n                -zoom 2.3725\n"
		+ "                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 5\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 9223372036854775800 9223372036854775800 \n                -iconSize \"largeIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph InputOutput1\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 1\n                -zoom 2.3725\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 5\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 9223372036854775800 9223372036854775800 \n                -iconSize \"largeIcons\" \n"
		+ "                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n"
		+ "                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n"
		+ "                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n"
		+ "                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\nstereoCameraView -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n"
		+ "                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n"
		+ "                -motionTrails 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\nstereoCameraView -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph InputOutput2\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph InputOutput2\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 1\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n"
		+ "                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph InputOutput2\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 1\n                -zoom 1\n                -animateTransition 0\n"
		+ "                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n"
		+ "\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 0\\n    -lights 0\\n    -cameras 0\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -joints 0\\n    -ikHandles 0\\n    -deformers 0\\n    -dynamics 0\\n    -fluids 0\\n    -hairSystems 0\\n    -follicles 0\\n    -nCloths 0\\n    -nParticles 0\\n    -nRigids 0\\n    -dynamicConstraints 0\\n    -locators 0\\n    -manipulators 1\\n    -dimensions 0\\n    -handles 0\\n    -pivots 0\\n    -textures 0\\n    -strokes 0\\n    -motionTrails 0\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 0\\n    -lights 0\\n    -cameras 0\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -joints 0\\n    -ikHandles 0\\n    -deformers 0\\n    -dynamics 0\\n    -fluids 0\\n    -hairSystems 0\\n    -follicles 0\\n    -nCloths 0\\n    -nParticles 0\\n    -nRigids 0\\n    -dynamicConstraints 0\\n    -locators 0\\n    -manipulators 1\\n    -dimensions 0\\n    -handles 0\\n    -pivots 0\\n    -textures 0\\n    -strokes 0\\n    -motionTrails 0\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode ikRPsolver -n "ikRPsolver";
createNode clamp -n "clampNode_Stretch";
	setAttr ".mn" -type "float3" 24.590523 0 0 ;
createNode multiplyDivide -n "mdNode_RStretch_l1_leg";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 24.590523 1 1 ;
createNode multiplyDivide -n "mdNode_MStretch_l1_leg";
	setAttr ".i2" -type "float3" 12.502912 1 1 ;
createNode multiplyDivide -n "mdNode_EStretchl1_leg";
	setAttr ".i2" -type "float3" 12.08761 1 1 ;
createNode plusMinusAverage -n "pmaNode_twist_l1_leg";
	setAttr -s 3 ".i1[2]"  1.7075473e-006;
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "mdNode_twist_l1_leg";
	setAttr ".i2" -type "float3" -1 -1 -1 ;
createNode addDoubleLinear -n "adlNode_RStretch_l1_leg";
	setAttr ".i2" 24.590522438616624;
createNode clamp -n "clampNode_Stretch1";
	setAttr ".mn" -type "float3" 24.590523 0 0 ;
createNode multiplyDivide -n "mdNode_RStretch_l1_leg1";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 24.590523 1 1 ;
createNode multiplyDivide -n "mdNode_MStretch_l1_leg1";
	setAttr ".i2" -type "float3" 12.502912 1 1 ;
createNode multiplyDivide -n "mdNode_EStretchl1_leg1";
	setAttr ".i2" -type "float3" 12.08761 1 1 ;
createNode plusMinusAverage -n "pmaNode_twist_l1_leg1";
	setAttr ".op" 2;
	setAttr -s 3 ".i1";
	setAttr -s 3 ".i1";
createNode multiplyDivide -n "mdNode_twist_l1_leg1";
	setAttr ".i2" -type "float3" -1 -1 -1 ;
createNode unitConversion -n "unitConversion1";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion2";
	setAttr ".cf" 0.017453292519943295;
createNode condition -n "conNode_ballRoll_l1_leg";
	setAttr ".op" 3;
createNode condition -n "conNode_negBallRoll_l1_leg";
	setAttr ".op" 3;
createNode condition -n "conNode_toeRoll";
	setAttr ".op" 2;
	setAttr ".cf" -type "float3" 45 0 0 ;
createNode plusMinusAverage -n "pmaNode_ballRoll_l1_leg";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode plusMinusAverage -n "pmaNode_toeRoll_l1_leg";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode condition -n "conNode_heelRoll_l1_leg";
	setAttr ".op" 4;
	setAttr ".cf" -type "float3" 0 0 0 ;
createNode unitConversion -n "unitConversion3";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion4";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion5";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion6";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion7";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion8";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion9";
	setAttr ".cf" 0.017453292519943295;
createNode dagPose -n "bindPose1";
	setAttr -s 3 ".wm";
	setAttr -s 3 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 1.1099335010419812e-016 -5.6311677543163854e-011
		 1.0282896756308446e-009 0 4.9993955492966161e-015 25.891286247309651 -2.757631809472838 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.40671088212588485 -0.57843431637514786 -0.40671088212588474 0.57843431637514808 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 -1.6231839266010939e-016 -2.0058367130871055e-008
		 -9.9920072053472011e-016 0 12.502885211224786 -0.02567224888386388 4.0517906610422085e-015 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.91663815373108204 -0.3997180195143486 -3.4281102415170177e-009 7.8613834982687654e-009 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 5.4757970675425209e-009 9.1654412324827785e-009
		 -1.7784955927299446e-008 0 12.056633929468045 -0.0010347025392398734 -6.5713024480812464e-010 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.36764529608455732 -0.60401733360508592 0.3676452817200887 0.60401733733433294 1
		 1 1 yes;
	setAttr -s 3 ".m";
	setAttr -s 3 ".p";
	setAttr ".bp" yes;
createNode plusMinusAverage -n "plusMinusAverage1";
	setAttr -s 2 ".i3[1]" -type "float3"  0 3.17989993 -6.53620005;
createNode displayLayer -n "layer1";
	setAttr ".dt" 2;
	setAttr ".do" 1;
createNode ikSplineSolver -n "ikSplineSolver";
createNode displayLayer -n "layer2";
	setAttr ".do" 2;
createNode condition -n "condition1";
	setAttr ".op" 2;
	setAttr ".st" 12.246999740600586;
createNode multiplyDivide -n "multiplyDivide1";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 12.247 1 1 ;
createNode cluster -n "cluster1";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode tweak -n "tweak1";
	setAttr -s 2 ".pl[0].cp";
	setAttr ".pl[0].cp[0]" -type "double3" -8.3559073955366694e-016 -0.98118360750962808 
		0.35050494414506117 ;
	setAttr ".pl[0].cp[4]" -type "double3" -1.0107241622221731e-015 0.9811808312086896 
		-0.35051271571619491 ;
createNode objectSet -n "cluster1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "cluster1GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "cluster1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:1]";
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId11";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts11";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode cluster -n "cluster2";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode objectSet -n "cluster2Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "cluster2GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "cluster2GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[2]";
createNode cluster -n "cluster3";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode objectSet -n "cluster3Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "cluster3GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "cluster3GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[3:4]";
createNode cluster -n "cluster4";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode tweak -n "tweak2";
createNode objectSet -n "cluster4Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "cluster4GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "cluster4GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[0:1]";
createNode objectSet -n "tweakSet2";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId13";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts13";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode cluster -n "cluster5";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode objectSet -n "cluster5Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "cluster5GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "cluster5GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[2]";
createNode cluster -n "cluster6";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode objectSet -n "cluster6Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "cluster6GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "cluster6GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[3:4]";
createNode curveInfo -n "curveInfo1";
createNode curveInfo -n "curveInfo2";
createNode condition -n "condition2";
	setAttr ".op" 2;
	setAttr ".st" 12.057000160217285;
createNode multiplyDivide -n "multiplyDivide2";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 12.057 1 1 ;
createNode unitConversion -n "unitConversion10";
	setAttr ".cf" 57.295779513082323;
createNode skinCluster -n "skinCluster1";
	setAttr ".skm" 1;
	setAttr -s 608 ".wl";
	setAttr -s 4 ".wl[0].w[2:5]"  0.25918620292846323 0.41852051398888102 
		0.30385025843206093 0.018443024650594796;
	setAttr -s 4 ".wl[1].w[2:5]"  0.27974772609465337 0.41148418103507545 
		0.28904047179344744 0.019727621076823819;
	setAttr -s 4 ".wl[2].w[0:3]"  0.75851586621688394 0.22888493886405428 
		0.010844643171795103 0.0017545517472666373;
	setAttr -s 4 ".wl[3].w[0:3]"  0.90697626787660435 0.090531152282768645 
		0.0021725202854926615 0.00032005955513442121;
	setAttr -s 4 ".wl[4].w[0:3]"  0.59655835020237169 0.36330675343333552 
		0.034080839180451898 0.006054057183840859;
	setAttr -s 4 ".wl[5].w[0:3]"  0.64637134744207547 0.32914558414918527 
		0.021054829356883575 0.0034282390518557068;
	setAttr -s 4 ".wl[6].w[2:5]"  0.15708698966363754 0.39251523745453815 
		0.37462746614936132 0.075770306732462947;
	setAttr -s 4 ".wl[7].w[2:5]"  0.18560853295275362 0.3917166384462637 
		0.34434950297957906 0.078325325621403555;
	setAttr -s 4 ".wl[8].w[1:4]"  0.38104949887032963 0.48356280807195251 
		0.11104270995669052 0.024344983101027434;
	setAttr -s 4 ".wl[9].w[1:4]"  0.28698289854060965 0.50108648255889154 
		0.17554954045820162 0.036381078442297238;
	setAttr -s 4 ".wl[10].w[1:4]"  0.33913428539543922 0.51545355750570676 
		0.12161332795935917 0.023798829139494743;
	setAttr -s 4 ".wl[11].w[1:4]"  0.42856602017606721 0.48940308545203343 
		0.067876625116601114 0.014154269255298297;
	setAttr -s 4 ".wl[12].w[0:3]"  0.4659814073723092 0.47537923701466572 
		0.053023174340135107 0.0056161812728899585;
	setAttr -s 4 ".wl[13].w[0:3]"  0.44739613963341868 0.45944929824323716 
		0.082967088233868308 0.010187473889475853;
	setAttr -s 4 ".wl[14].w[0:3]"  0.48160784465063838 0.48185426907869339 
		0.033139689609949813 0.0033981966607184145;
	setAttr -s 4 ".wl[15].w[0:3]"  0.49518324611297387 0.4939282506104225 
		0.010017128703939043 0.00087137457266466206;
	setAttr -s 4 ".wl[16].w[1:4]"  0.32952871953755691 0.46398767827700738 
		0.16634840066302961 0.040135201522406169;
	setAttr -s 4 ".wl[17].w[0:3]"  0.44736368408148014 0.46011815925986915 
		0.082467486873092868 0.0100506697855579;
	setAttr -s 4 ".wl[18].w[0:3]"  0.5941753221321564 0.36683807641553862 
		0.033195008664100009 0.0057915927882051009;
	setAttr -s 4 ".wl[19].w[0:3]"  0.86105488592430535 0.13407174206971439 
		0.0042246135796603981 0.00064875842631975677;
	setAttr -s 4 ".wl[20].w[0:3]"  0.49214430374907597 0.49066047812681207 
		0.015730892999317257 0.001464325124794751;
	setAttr -s 4 ".wl[21].w[1:4]"  0.40072528875036889 0.51264749194354631 
		0.072670624434789916 0.013956594871294845;
	setAttr -s 4 ".wl[22].w[2:5]"  0.2813693907744021 0.4071218583119523 
		0.2933396776640893 0.018169073249556369;
	setAttr -s 4 ".wl[23].w[3:6]"  0.34036050067525447 0.49869751121659295 
		0.15261067935360462 0.0083313087545479649;
	setAttr -s 4 ".wl[24].w[0:3]"  0.98460826151835412 0.01484924045032707 
		0.0004651761747271752 7.7321856591671225e-005;
	setAttr -s 4 ".wl[25].w[0:3]"  0.99176059516611681 0.0079851572923644674 
		0.00021884645211396587 3.5401089404752307e-005;
	setAttr -s 4 ".wl[26].w[0:3]"  0.80685894155909099 0.18174594803931049 
		0.0097141114839328999 0.0016809989176657561;
	setAttr -s 4 ".wl[27].w[0:3]"  0.76822448488319017 0.21525276243032632 
		0.013999888346858336 0.0025228643396251632;
	setAttr -s 4 ".wl[28].w[0:3]"  0.91091037287919574 0.084858127049128179 
		0.0036116105607886194 0.00061988951088753289;
	setAttr -s 4 ".wl[29].w[0:3]"  0.74082437222844122 0.23891435780491607 
		0.017126002758582424 0.0031352672080602662;
	setAttr -s 4 ".wl[30].w[3:6]"  0.013282627863861035 0.98506516963933377 
		0.0016242783691148685 2.7924127690426929e-005;
	setAttr -s 4 ".wl[31].w[3:6]"  0.29950450378352977 0.67350553018805404 
		0.026114579931361424 0.00087538609705473558;
	setAttr -s 4 ".wl[32].w[2:5]"  0.061935451214623023 0.46174215881113573 
		0.46174215881113562 0.014580231163105693;
	setAttr -s 4 ".wl[33].w[2:5]"  0.049401285467896204 0.46875026305703771 
		0.46875026305703771 0.013098188418028397;
	setAttr -s 4 ".wl[34].w[3:6]"  0.24539661282341044 0.73908377101281797 
		0.015065934525076617 0.00045368163869494719;
	setAttr -s 4 ".wl[35].w[2:5]"  0.053288178804316542 0.46736499565136208 
		0.46736499565136208 0.011981829892959289;
	setAttr -s 4 ".wl[36].w[1:4]"  0.41053536783718714 0.5156113189543402 
		0.062158720924788503 0.011694592283684082;
	setAttr -s 4 ".wl[37].w[0:3]"  0.49307496570693443 0.49730307799134288 
		0.0089127351827929125 0.00070922111892977749;
	setAttr -s 4 ".wl[38].w[0:3]"  0.87297131628268521 0.12381432720780242 
		0.0028127043860605673 0.0004016521234518353;
	setAttr -s 4 ".wl[39].w[0:3]"  0.97377481746877814 0.025346578010223796 
		0.000755952911936648 0.00012265160906148068;
	setAttr -s 4 ".wl[40].w[0:3]"  0.98348037238651975 0.015965410519654905 
		0.00047621772198446128 7.7999371840850913e-005;
	setAttr -s 4 ".wl[41].w[0:3]"  0.85763170818895396 0.13439582772009775 
		0.0067842419086940019 0.0011882221822543029;
	setAttr -s 4 ".wl[42].w[0:3]"  0.68686731587601013 0.2931625957143833 
		0.017156802649905076 0.0028132857597014871;
	setAttr -s 4 ".wl[43].w[0:3]"  0.47141196142375902 0.47794416770512188 
		0.045890695687316581 0.0047531751838025384;
	setAttr -s 4 ".wl[44].w[1:4]"  0.29377704852678643 0.54726794847157578 
		0.13510260203109381 0.023852400970543999;
	setAttr -s 4 ".wl[45].w[2:5]"  0.18230195722423978 0.47836991252667987 
		0.32130736268637977 0.018020767562700657;
	setAttr -s 4 ".wl[46].w[2:5]"  0.010043776759065854 0.49244991295065299 
		0.49244991295065299 0.0050563973396281535;
	setAttr -s 4 ".wl[47].w[3:6]"  0.49036262546247944 0.50863028365113683 
		0.00096217594346110699 4.4914942922643676e-005;
	setAttr -s 4 ".wl[48].w[2:5]"  0.016639066546958448 0.48737042510381551 
		0.4873704251038154 0.0086200832454107895;
	setAttr -s 4 ".wl[49].w[2:5]"  0.21669443543367845 0.46544126530863933 
		0.29799119771045385 0.019873101547228451;
	setAttr ".wl[50].w[8]"  1;
	setAttr ".wl[51].w[8]"  1;
	setAttr -s 4 ".wl[52].w[2:5]"  0.052673275573301398 0.4590408577309591 
		0.45904085773095898 0.029245008964780567;
	setAttr -s 4 ".wl[53].w[2:5]"  0.049686884236763401 0.45521891452495139 
		0.45521891452495139 0.039875286713333839;
	setAttr -s 4 ".wl[54].w[2:5]"  0.42989306918895343 0.45440171714660965 
		0.10035136028696523 0.01535385337747174;
	setAttr -s 4 ".wl[55].w[2:5]"  0.38788581601476058 0.43387037387831223 
		0.14948096632415978 0.028762843782767451;
	setAttr ".wl[56].w[8]"  1;
	setAttr ".wl[57].w[8]"  1;
	setAttr -s 2 ".wl[58].w";
	setAttr ".wl[58].w[5]" 0.6;
	setAttr ".wl[58].w[7]" 0.4;
	setAttr -s 2 ".wl[59].w";
	setAttr ".wl[59].w[5]" 0.6;
	setAttr ".wl[59].w[7]" 0.4;
	setAttr -s 2 ".wl[60].w";
	setAttr ".wl[60].w[5]" 0.6;
	setAttr ".wl[60].w[7]" 0.4;
	setAttr -s 2 ".wl[61].w";
	setAttr ".wl[61].w[5]" 0.6;
	setAttr ".wl[61].w[7]" 0.4;
	setAttr -s 4 ".wl[62].w[3:6]"  0.21794481662396617 0.4318664901634659 
		0.31817154516896035 0.032017148043607502;
	setAttr -s 4 ".wl[63].w[3:6]"  0.2571721804537751 0.4277050506434163 
		0.28596266492240952 0.029160103980399164;
	setAttr -s 4 ".wl[64].w[3:6]"  0.22910019424590425 0.50727852559354303 
		0.24910765808920526 0.014513622071347598;
	setAttr -s 4 ".wl[65].w[3:6]"  0.18612847763801987 0.50932004867283454 
		0.28890449982610006 0.015646973863045553;
	setAttr -s 2 ".wl[66].w";
	setAttr ".wl[66].w[5]" 0.6;
	setAttr ".wl[66].w[7]" 0.4;
	setAttr -s 4 ".wl[67].w[3:6]"  0.26514550397141462 0.40092141609143195 
		0.29831687640424265 0.03561620353291068;
	setAttr -s 4 ".wl[68].w[1:4]"  0.013760774314746935 0.46131313674773194 
		0.46114990780642934 0.063776181131091791;
	setAttr -s 4 ".wl[69].w[2:5]"  0.036695350313928482 0.46484027744331274 
		0.46484027744331274 0.03362409479944603;
	setAttr -s 4 ".wl[70].w[3:6]"  0.2036966164291194 0.51784700243931392 
		0.2644428780251184 0.014013503106448442;
	setAttr -s 2 ".wl[71].w";
	setAttr ".wl[71].w[5]" 0.6;
	setAttr ".wl[71].w[7]" 0.4;
	setAttr ".wl[72].w[8]"  1;
	setAttr ".wl[73].w[8]"  1;
	setAttr -s 4 ".wl[74].w[2:5]"  0.047647236772298485 0.47055461393874654 
		0.47055461393874654 0.01124353535020845;
	setAttr -s 4 ".wl[75].w[2:5]"  0.066784160194615361 0.45854175023183091 
		0.45854175023183091 0.016132339341722833;
	setAttr -s 4 ".wl[76].w[2:5]"  0.4403646304471428 0.49298008013794725 
		0.061238661066579374 0.0054166283483305664;
	setAttr -s 4 ".wl[77].w[1:4]"  0.00087818999952794493 0.49639731097536188 
		0.49635547205280722 0.0063690269723030322;
	setAttr -s 4 ".wl[78].w[2:5]"  0.070980771915881591 0.46110876399116513 
		0.45572718735877021 0.012183276734182874;
	setAttr -s 4 ".wl[79].w[2:5]"  0.47197039407817915 0.50305341469295484 
		0.023272685475696768 0.001703505753169408;
	setAttr ".wl[80].w[8]"  1;
	setAttr ".wl[81].w[8]"  1;
	setAttr ".wl[82].w[8]"  1;
	setAttr ".wl[83].w[8]"  1;
	setAttr ".wl[84].w[8]"  1;
	setAttr ".wl[85].w[8]"  1;
	setAttr -s 2 ".wl[86].w";
	setAttr ".wl[86].w[5]" 0.6;
	setAttr ".wl[86].w[7]" 0.4;
	setAttr -s 4 ".wl[87].w[3:6]"  0.15583541957118044 0.53716926861442371 
		0.29431509522553007 0.012680216588865863;
	setAttr -s 4 ".wl[88].w[2:5]"  0.12517157160650647 0.45267371825405939 
		0.39241353731291179 0.029741172826522427;
	setAttr -s 4 ".wl[89].w[2:5]"  0.17976713534312536 0.56146254016010533 
		0.25063721623613305 0.0081331082606360718;
	setAttr -s 4 ".wl[90].w[2:5]"  0.029992846345450987 0.94195843265261214 
		0.027797495054508962 0.0002512259474278283;
	setAttr -s 4 ".wl[91].w[2:5]"  0.21109390044145604 0.60132903736719845 
		0.18245085527591082 0.0051262069154348194;
	setAttr -s 4 ".wl[92].w[2:5]"  0.16574056084550401 0.46747582585187153 
		0.34490925128731609 0.021874362015308329;
	setAttr -s 4 ".wl[93].w[3:6]"  0.22539584981598698 0.50948669853111705 
		0.25075752922372385 0.014359922429172063;
	setAttr -s 2 ".wl[94].w";
	setAttr ".wl[94].w[5]" 0.6;
	setAttr ".wl[94].w[7]" 0.4;
	setAttr ".wl[95].w[8]"  1;
	setAttr ".wl[96].w[8]"  1;
	setAttr ".wl[97].w[8]"  1;
	setAttr ".wl[98].w[8]"  1;
	setAttr ".wl[99].w[8]"  1;
	setAttr ".wl[100].w[8]"  1;
	setAttr ".wl[101].w[8]"  1;
	setAttr ".wl[102].w[8]"  1;
	setAttr ".wl[103].w[8]"  1;
	setAttr ".wl[104].w[8]"  1;
	setAttr ".wl[105].w[8]"  1;
	setAttr ".wl[106].w[8]"  1;
	setAttr ".wl[107].w[8]"  1;
	setAttr ".wl[108].w[8]"  1;
	setAttr ".wl[109].w[8]"  1;
	setAttr ".wl[110].w[8]"  1;
	setAttr ".wl[111].w[8]"  1;
	setAttr ".wl[112].w[8]"  1;
	setAttr ".wl[113].w[8]"  1;
	setAttr ".wl[114].w[8]"  1;
	setAttr ".wl[115].w[8]"  1;
	setAttr ".wl[116].w[8]"  1;
	setAttr ".wl[117].w[8]"  1;
	setAttr ".wl[118].w[8]"  1;
	setAttr ".wl[119].w[8]"  1;
	setAttr ".wl[120].w[8]"  1;
	setAttr ".wl[121].w[8]"  1;
	setAttr ".wl[122].w[8]"  1;
	setAttr ".wl[123].w[8]"  1;
	setAttr ".wl[124].w[8]"  1;
	setAttr ".wl[125].w[8]"  1;
	setAttr ".wl[126].w[8]"  1;
	setAttr ".wl[127].w[8]"  1;
	setAttr ".wl[128].w[8]"  1;
	setAttr ".wl[129].w[8]"  1;
	setAttr ".wl[130].w[8]"  1;
	setAttr ".wl[131].w[8]"  1;
	setAttr ".wl[132].w[8]"  1;
	setAttr ".wl[133].w[8]"  1;
	setAttr ".wl[134].w[9]"  1;
	setAttr ".wl[135].w[9]"  1;
	setAttr ".wl[136].w[9]"  1;
	setAttr ".wl[137].w[9]"  1;
	setAttr ".wl[138].w[9]"  1;
	setAttr ".wl[139].w[9]"  1;
	setAttr ".wl[140].w[9]"  1;
	setAttr ".wl[141].w[9]"  1;
	setAttr ".wl[142].w[9]"  1;
	setAttr ".wl[143].w[9]"  1;
	setAttr ".wl[144].w[9]"  1;
	setAttr ".wl[145].w[9]"  1;
	setAttr ".wl[146].w[9]"  1;
	setAttr ".wl[147].w[9]"  1;
	setAttr ".wl[148].w[9]"  1;
	setAttr ".wl[149].w[9]"  1;
	setAttr ".wl[150].w[9]"  1;
	setAttr ".wl[151].w[9]"  1;
	setAttr ".wl[152].w[9]"  1;
	setAttr ".wl[153].w[9]"  1;
	setAttr ".wl[154].w[9]"  1;
	setAttr ".wl[155].w[9]"  1;
	setAttr ".wl[156].w[9]"  1;
	setAttr ".wl[157].w[9]"  1;
	setAttr -s 4 ".wl[158].w[2:5]"  0.27301200470608855 0.41199330295948561 
		0.29733007381325111 0.017664618521174756;
	setAttr -s 4 ".wl[159].w[0:3]"  0.81412584809752708 0.17800006710025665 
		0.0068031154245621677 0.0010709693776541397;
	setAttr -s 4 ".wl[160].w[0:3]"  0.5899649053014564 0.36875821568319406 
		0.035067096345624896 0.0062097826697246261;
	setAttr -s 4 ".wl[161].w[3:6]"  0.37273115563995746 0.49185697528406508 
		0.12829426743726474 0.0071176016387127887;
	setAttr -s 4 ".wl[162].w[1:4]"  0.051920246159692082 0.43143600832876855 
		0.41441462172651666 0.10222912378502277;
	setAttr -s 4 ".wl[163].w[1:4]"  0.077442123047264985 0.45296059790413046 
		0.38600683796871149 0.083590441079893163;
	setAttr -s 4 ".wl[164].w[0:3]"  0.72821445309694255 0.25657110054903298 
		0.013092465676521746 0.0021219806775026112;
	setAttr -s 4 ".wl[165].w[0:3]"  0.93159451358734124 0.066919125760313725 
		0.0013010469477181795 0.00018531370462685355;
	setAttr -s 4 ".wl[166].w[0:3]"  0.51768768245468644 0.43080211358166542 
		0.044422642237925483 0.0070875617257227103;
	setAttr -s 4 ".wl[167].w[0:3]"  0.5466018023304503 0.4220469530502976 
		0.027443249213299659 0.0039079954059523829;
	setAttr -s 4 ".wl[168].w[2:5]"  0.17030427160341369 0.45682335665897861 
		0.33684236198194178 0.036030009755665997;
	setAttr -s 4 ".wl[169].w[2:5]"  0.20150083332019422 0.44710390934759509 
		0.31368074381486571 0.03771451351734504;
	setAttr -s 4 ".wl[170].w[1:4]"  0.055320491764605191 0.43399828912781313 
		0.41143791979838762 0.09924329930919415;
	setAttr -s 4 ".wl[171].w[1:4]"  0.035582241466184765 0.42209721586443993 
		0.42195317005717553 0.12036737261219978;
	setAttr -s 4 ".wl[172].w[1:4]"  0.35587478703589565 0.46836883983347316 
		0.14220533473983432 0.033551038390796963;
	setAttr -s 4 ".wl[173].w[0:3]"  0.13625689826991541 0.55535586544967608 
		0.29154211768531724 0.016845118595091326;
	setAttr -s 4 ".wl[174].w[1:4]"  0.28551710259419727 0.52496109648223754 
		0.15926030181287609 0.030261499110689198;
	setAttr -s 4 ".wl[175].w[0:3]"  0.15631459881525872 0.647052747155343 
		0.18822402756850928 0.0084086264608889665;
	setAttr -s 4 ".wl[176].w[1:4]"  0.36876549358360022 0.52278677952054164 
		0.091254232566730445 0.017193494329127604;
	setAttr -s 4 ".wl[177].w[1:4]"  0.42431886294109628 0.50339876188610377 
		0.06044356268920386 0.011838812483596172;
	setAttr -s 4 ".wl[178].w[0:3]"  0.1612741716403723 0.52554564707808771 
		0.2923314115905673 0.020848769690972713;
	setAttr -s 4 ".wl[179].w[0:3]"  0.13353790623021791 0.4785702627632995 
		0.35573313262089978 0.032158698385582773;
	setAttr -s 4 ".wl[180].w[0:3]"  0.45392927217180512 0.46511851807188986 
		0.072490779088942067 0.008461430667362926;
	setAttr -s 4 ".wl[181].w[0:3]"  0.62620080600697603 0.3558110399943975 
		0.015750199746398068 0.0022379542522284234;
	setAttr -s 4 ".wl[182].w[0:3]"  0.45848886526657479 0.46845441266946769 
		0.065620211500121206 0.0074365105638363191;
	setAttr -s 4 ".wl[183].w[0:3]"  0.75914960989468272 0.23640544335211514 
		0.0039492928917242076 0.00049565386147801336;
	setAttr -s 4 ".wl[184].w[0:3]"  0.48772443800497323 0.48752778447933254 
		0.022556539339348987 0.0021912381763453037;
	setAttr -s 4 ".wl[185].w[0:3]"  0.4966762463019862 0.49673216994875785 
		0.0061032303702128164 0.00048835337904321399;
	setAttr -s 4 ".wl[186].w[1:4]"  0.30393039242835768 0.48395817255966195 
		0.17360433812446557 0.038507096887514906;
	setAttr -s 4 ".wl[187].w[0:3]"  0.44530191126458607 0.45857465277739085 
		0.085559936951214055 0.010563499006809123;
	setAttr -s 4 ".wl[188].w[0:3]"  0.15764237664831121 0.46978128329033608 
		0.33838051873737895 0.034195821323973703;
	setAttr -s 4 ".wl[189].w[0:3]"  0.60845117710804775 0.35742629271457443 
		0.029151772707964325 0.0049707574694134336;
	setAttr -s 4 ".wl[190].w[0:3]"  0.51555270117418039 0.43457504934348751 
		0.043148502698563782 0.0067237467837683732;
	setAttr -s 4 ".wl[191].w[0:3]"  0.88338211898810093 0.11296384767082078 
		0.003174531891222921 0.00047950144985537367;
	setAttr -s 4 ".wl[192].w[0:3]"  0.49393004715153166 0.49172821509956988 
		0.013143842733342615 0.0011978950155558507;
	setAttr -s 4 ".wl[193].w[0:3]"  0.70988348063121531 0.28197450589049705 
		0.007186760555952851 0.00095525292233486156;
	setAttr -s 4 ".wl[194].w[1:4]"  0.42109019573304257 0.49469340186683758 
		0.069922074220378258 0.014294328179741633;
	setAttr -s 4 ".wl[195].w[0:3]"  0.14172911472681043 0.63765950943644722 
		0.2113250452872906 0.0092863305494517902;
	setAttr -s 4 ".wl[196].w[2:5]"  0.28556728102317297 0.40421290901485274 
		0.29064551404921835 0.019574295912755998;
	setAttr -s 4 ".wl[197].w[1:4]"  0.067271048032955111 0.44864826983792405 
		0.39751254817570431 0.08656813395341649;
	setAttr -s 4 ".wl[198].w[3:6]"  0.38848296037953722 0.46307606328826761 
		0.13935885633056549 0.0090821200016298186;
	setAttr -s 4 ".wl[199].w[1:4]"  0.050817144107421185 0.41132129255635641 
		0.40818998084246166 0.12967158249376079;
	setAttr -s 4 ".wl[200].w[0:3]"  0.94185817815524853 0.055924933563520504 
		0.0019042444994951436 0.00031264378173588992;
	setAttr -s 4 ".wl[201].w[0:3]"  0.97015171021595292 0.028909246680310852 
		0.00081011584234120582 0.00012892726139503358;
	setAttr -s 4 ".wl[202].w[0:3]"  0.99155856195413261 0.0081627946364194581 
		0.0002392482648175312 3.9395144630347146e-005;
	setAttr -s 4 ".wl[203].w[0:3]"  0.73881220031463879 0.24385512414839536 
		0.014781851662240169 0.0025508238747255917;
	setAttr -s 4 ".wl[204].w[0:3]"  0.99503135706256518 0.0048193155340434893 
		0.00012856660210574475 2.0760801285713296e-005;
	setAttr -s 4 ".wl[205].w[0:3]"  0.67471538443119317 0.29677321948848001 
		0.024116277261558704 0.0043951188187679822;
	setAttr -s 4 ".wl[206].w[0:3]"  0.7881698296989641 0.19782715671230042 
		0.011890121136532972 0.0021128924522024377;
	setAttr -s 4 ".wl[207].w[0:3]"  0.89073495504699185 0.10390364938046032 
		0.0045773147387272685 0.00078408083382054607;
	setAttr -s 4 ".wl[208].w[0:3]"  0.85332662186658914 0.13893400842703707 
		0.0066066028452314738 0.0011327668611422223;
	setAttr -s 4 ".wl[209].w[0:3]"  0.95508993688682775 0.043043519632235704 
		0.0015955857110775884 0.00027095776985897307;
	setAttr -s 4 ".wl[210].w[0:3]"  0.67549833460929376 0.29497222762962838 
		0.024917196627118152 0.0046122411339597257;
	setAttr -s 4 ".wl[211].w[0:3]"  0.75456804697522595 0.22673833761411261 
		0.015802600577763098 0.0028910148328984728;
	setAttr -s 4 ".wl[212].w[0:3]"  0.89869686157369455 0.096202029452591278 
		0.0043470022332574116 0.00075410674045679629;
	setAttr -s 4 ".wl[213].w[3:6]"  0.10917303868674448 0.82957142400891248 
		0.060104900330562802 0.0011506369737803157;
	setAttr -s 4 ".wl[214].w[3:6]"  0.33177926204154806 0.59934792207515786 
		0.066188298100497631 0.0026845177827964431;
	setAttr -s 4 ".wl[215].w[3:6]"  0.12703100952433999 0.85871194194938938 
		0.013933015412407903 0.00032403311386280427;
	setAttr -s 4 ".wl[216].w[2:5]"  0.11744049380177635 0.43470500831539394 
		0.42755428625662506 0.020300211626204656;
	setAttr -s 4 ".wl[217].w[3:6]"  0.42478823798853566 0.56098755431338621 
		0.013634543382461639 0.00058966431561654868;
	setAttr -s 4 ".wl[218].w[2:5]"  0.12371038413193156 0.43028073983160414 
		0.42623543706493372 0.019773438971530541;
	setAttr -s 4 ".wl[219].w[2:5]"  0.054027146757168985 0.46597354318579731 
		0.46597354318579731 0.014025766871236406;
	setAttr -s 4 ".wl[220].w[2:5]"  0.011760570847880141 0.49158863059507207 
		0.49158863059507207 0.0050621679619756808;
	setAttr -s 4 ".wl[221].w[3:6]"  0.31136140695920683 0.63490247316875925 
		0.0518491358538824 0.0018869840181514352;
	setAttr -s 4 ".wl[222].w[3:6]"  0.045109946067397245 0.95127197398567531 
		0.0035453068256619839 7.277312126545749e-005;
	setAttr -s 4 ".wl[223].w[2:5]"  0.1085306925437155 0.44085107766401405 
		0.43289073301584224 0.017727496776428243;
	setAttr -s 4 ".wl[224].w[2:5]"  0.047209761667397175 0.47047790131745532 
		0.4704779013174552 0.01183443569769238;
	setAttr -s 4 ".wl[225].w[3:6]"  0.40200422419826276 0.58983103110655077 
		0.0078496864361447764 0.0003150582590417027;
	setAttr -s 4 ".wl[226].w[1:4]"  0.3982173210815203 0.50297575492222402 
		0.082331262644552428 0.016475661351703315;
	setAttr -s 4 ".wl[227].w[0:3]"  0.48182866824547882 0.48955275558281475 
		0.026246612466853642 0.0023719637048526658;
	setAttr -s 4 ".wl[228].w[0:3]"  0.11841447977997019 0.67917322537925306 
		0.19525403349277137 0.0071582613480053459;
	setAttr -s 4 ".wl[229].w[0:3]"  0.73746344615845749 0.25115633991706177 
		0.0098850894318336258 0.0014951244926471254;
	setAttr -s 4 ".wl[230].w[0:3]"  0.72397066006312549 0.2716456458773715 
		0.0039160789952961414 0.00046761506420686259;
	setAttr -s 4 ".wl[231].w[0:3]"  0.89108171385975321 0.10387957254206855 
		0.0043127169978843978 0.0007259966002938459;
	setAttr -s 4 ".wl[232].w[0:3]"  0.94045190470497886 0.057659197268582027 
		0.0016334338794702923 0.00025546414696867861;
	setAttr -s 4 ".wl[233].w[0:3]"  0.99853047407818396 0.0014246921457306096 
		3.8535669904886612e-005 6.2981061805593398e-006;
	setAttr -s 4 ".wl[234].w[0:3]"  0.98776103685403538 0.011841658271544648 
		0.0003415852233775299 5.5719651042465049e-005;
	setAttr -s 4 ".wl[235].w[0:3]"  0.79241525413584712 0.19334055427985797 
		0.012066834053997678 0.0021773575302972015;
	setAttr -s 4 ".wl[236].w[0:3]"  0.94063553863778471 0.056848392346593349 
		0.0021521924188081945 0.0003638765968138387;
	setAttr -s 4 ".wl[237].w[0:3]"  0.63193241485769935 0.33771486939204209 
		0.025916902834480133 0.0044358129157784001;
	setAttr -s 4 ".wl[238].w[0:3]"  0.77626078014396716 0.2094949838394087 
		0.012130665653646512 0.0021135703629776227;
	setAttr -s 4 ".wl[239].w[0:3]"  0.4780888409239985 0.48049854780281637 
		0.037581531248312934 0.003831080024872141;
	setAttr -s 4 ".wl[240].w[0:3]"  0.5754882360632303 0.39839603413361346 
		0.022832404047647199 0.0032833257555089715;
	setAttr -s 4 ".wl[241].w[1:4]"  0.31414231265353348 0.53208110848342172 
		0.12972492658434853 0.024051652278696291;
	setAttr -s 4 ".wl[242].w[0:3]"  0.11572072343003248 0.53704370215057473 
		0.32793894064933099 0.019296633770061834;
	setAttr -s 4 ".wl[243].w[2:5]"  0.22531993742077555 0.44705678759128575 
		0.31081032220249022 0.0168129527854485;
	setAttr -s 4 ".wl[244].w[1:4]"  0.028077692015072955 0.44559172796510088 
		0.44040533364929463 0.085925246370531533;
	setAttr -s 4 ".wl[245].w[2:5]"  0.025971226377043407 0.48306262153905677 
		0.48306262153905677 0.007903530544843029;
	setAttr -s 4 ".wl[246].w[2:5]"  0.042334172400051495 0.47378536796686044 
		0.47055194345442947 0.013328516178658661;
	setAttr -s 4 ".wl[247].w[3:6]"  0.017317933945140657 0.98255779770736984 
		0.00012095134876545799 3.3169987240007278e-006;
	setAttr -s 4 ".wl[248].w[3:6]"  0.49765363228439463 0.50119535522287417 
		0.001097756418667698 5.3256074063486023e-005;
	setAttr -s 4 ".wl[249].w[2:5]"  0.033528848493664554 0.47793150726337097 
		0.47793150726337097 0.010608136979593468;
	setAttr -s 4 ".wl[250].w[3:6]"  0.49729384563184659 0.49926447715852718 
		0.0032735972930918911 0.00016807991653447905;
	setAttr -s 4 ".wl[251].w[2:5]"  0.25342726327733806 0.43883075273979683 
		0.28991014795222381 0.01783183603064132;
	setAttr -s 4 ".wl[252].w[2:5]"  0.053140284332411122 0.46597375621195797 
		0.46331231269074485 0.017573646764886194;
	setAttr -s 4 ".wl[253].w[1:4]"  0.046640183428867561 0.47702501204070602 
		0.41114639730341224 0.065188407227014245;
	setAttr ".wl[254].w[8]"  1;
	setAttr -s 4 ".wl[255].w[2:5]"  0.038508789964793205 0.46593377351092052 
		0.46593377351092052 0.029623663013365779;
	setAttr -s 4 ".wl[256].w[2:5]"  0.46348944022205563 0.4637167836755749 
		0.061732253944676102 0.011061522157693298;
	setAttr ".wl[257].w[8]"  1;
	setAttr -s 3 ".wl[258].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr -s 3 ".wl[259].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr -s 4 ".wl[260].w[2:5]"  0.080266501845376356 0.44762035608871348 
		0.44729419744016369 0.024818944625746527;
	setAttr -s 4 ".wl[261].w[2:5]"  0.062056251966587893 0.45322613284886631 
		0.45322613284886631 0.031491482335679548;
	setAttr -s 4 ".wl[262].w[2:5]"  0.33483022189430289 0.41010804530519879 
		0.20247494201481189 0.052586790785686358;
	setAttr -s 4 ".wl[263].w[2:5]"  0.28923254790535768 0.38070038579751397 
		0.24941153886484646 0.080655527432281965;
	setAttr ".wl[264].w[8]"  1;
	setAttr ".wl[265].w[8]"  1;
	setAttr -s 3 ".wl[266].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr -s 3 ".wl[267].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr -s 2 ".wl[268].w";
	setAttr ".wl[268].w[5]" 0.6;
	setAttr ".wl[268].w[7]" 0.4;
	setAttr -s 5 ".wl[269].w[4:8]"  0.3347290575645992 0.48311290785174049 
		0.12453603647609099 0.010592584824698045 0.047029413282871246;
	setAttr -s 2 ".wl[270].w";
	setAttr ".wl[270].w[5]" 0.6;
	setAttr ".wl[270].w[7]" 0.4;
	setAttr -s 4 ".wl[271].w[4:7]"  0.36076378479605059 0.51036748679686861 
		0.11895963995062024 0.009909088456460588;
	setAttr -s 2 ".wl[272].w";
	setAttr ".wl[272].w[5]" 0.6;
	setAttr ".wl[272].w[7]" 0.4;
	setAttr -s 2 ".wl[273].w";
	setAttr ".wl[273].w[5]" 0.6;
	setAttr ".wl[273].w[7]" 0.4;
	setAttr -s 4 ".wl[274].w[4:7]"  0.34950614635290317 0.46025619119201955 
		0.17089854613411146 0.019339116320965823;
	setAttr -s 4 ".wl[275].w[4:7]"  0.34086133546183278 0.45735169531025505 
		0.18090503726385893 0.020881931964053264;
	setAttr -s 4 ".wl[276].w[3:6]"  0.2463349336861084 0.40823204583304534 
		0.30895621126958622 0.036476809211259932;
	setAttr -s 4 ".wl[277].w[3:6]"  0.46642278466930887 0.47072057010992308 
		0.058184317093290264 0.0046723281274778069;
	setAttr -s 4 ".wl[278].w[3:6]"  0.23961501562928639 0.46526827042112218 
		0.27369984207750903 0.021416871872082469;
	setAttr -s 4 ".wl[279].w[3:6]"  0.43816063777209358 0.47561675806995646 
		0.080275302156810488 0.00594730200113959;
	setAttr -s 4 ".wl[280].w[3:6]"  0.21486122198265104 0.51954135240492594 
		0.25214898459166102 0.013448441020762019;
	setAttr -s 4 ".wl[281].w[3:6]"  0.15985289006263426 0.54182479281492746 
		0.28615915672566772 0.012163160396770602;
	setAttr -s 2 ".wl[282].w";
	setAttr ".wl[282].w[5]" 0.6;
	setAttr ".wl[282].w[7]" 0.4;
	setAttr -s 4 ".wl[283].w[3:6]"  0.26791468430379312 0.40901042613488925 
		0.29058353384220625 0.032491355719111291;
	setAttr -s 4 ".wl[284].w[4:7]"  0.34197705413364582 0.43736295273242709 
		0.19462036689647352 0.026039626237453536;
	setAttr -s 4 ".wl[285].w[2:5]"  0.44034904544056475 0.4445308154247522 
		0.094911150329886645 0.020208988804796352;
	setAttr -s 4 ".wl[286].w[2:5]"  0.3840521037148073 0.40839494027047907 
		0.15581069199003092 0.051742264024682752;
	setAttr -s 4 ".wl[287].w[2:5]"  0.042467169077823254 0.45885311439668369 
		0.45885311439668369 0.039826602128809396;
	setAttr -s 4 ".wl[288].w[3:6]"  0.1987559901726986 0.50503497620885973 
		0.28028901922652777 0.01592001439191381;
	setAttr -s 4 ".wl[289].w[3:6]"  0.4550803679070326 0.47257195295577376 
		0.067205363231341866 0.0051423159058518429;
	setAttr -s 2 ".wl[290].w";
	setAttr ".wl[290].w[5]" 0.6;
	setAttr ".wl[290].w[7]" 0.4;
	setAttr -s 4 ".wl[291].w[4:7]"  0.35499914780092379 0.52960785421807677 
		0.10727178968342672 0.0081212082975726536;
	setAttr ".wl[292].w[8]"  1;
	setAttr -s 3 ".wl[293].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr ".wl[294].w[8]"  1;
	setAttr -s 3 ".wl[295].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr -s 4 ".wl[296].w[2:5]"  0.045420532986039014 0.46658655693095225 
		0.46658655693095213 0.021406353152056665;
	setAttr -s 4 ".wl[297].w[2:5]"  0.063217134065363237 0.45580505520727571 
		0.45580505520727571 0.02517275552008533;
	setAttr -s 4 ".wl[298].w[2:5]"  0.05764972365681427 0.46405968922768043 
		0.46405968922768032 0.014230897887825068;
	setAttr -s 4 ".wl[299].w[2:5]"  0.43509032313605484 0.46307876299855322 
		0.090295005737568726 0.01153590812782302;
	setAttr -s 4 ".wl[300].w[2:5]"  0.093764032072263886 0.47594917779039464 
		0.41826283435663086 0.012023955780710603;
	setAttr -s 4 ".wl[301].w[1:4]"  0.0057037863703069888 0.4932531676843786 
		0.47732073900570393 0.023722306939610451;
	setAttr -s 4 ".wl[302].w[2:5]"  0.4818368867089125 0.49107559513759763 
		0.024867786631237458 0.0022197315222524101;
	setAttr -s 4 ".wl[303].w[2:5]"  0.087202373016170051 0.9119475603916436 
		0.00082291827632418517 2.7148315862182155e-005;
	setAttr -s 4 ".wl[304].w[2:5]"  0.068518680718301542 0.45611443975243454 
		0.45611443975243454 0.019252439776829451;
	setAttr -s 4 ".wl[305].w[2:5]"  0.054780006514478286 0.46720523498468047 
		0.46720523498468047 0.010809523516160734;
	setAttr -s 4 ".wl[306].w[2:5]"  0.47013510753538451 0.47831188477061559 
		0.046653576316039752 0.0048994313779601355;
	setAttr -s 4 ".wl[307].w[2:5]"  0.49638990323645271 0.49734021557606828 
		0.0058258866705043037 0.00044399451697476326;
	setAttr -s 4 ".wl[308].w[2:5]"  0.10928431801432564 0.49861187458799017 
		0.38304052885898376 0.0090632785387004065;
	setAttr ".wl[309].w[8]"  1;
	setAttr ".wl[310].w[8]"  1;
	setAttr ".wl[311].w[8]"  1;
	setAttr ".wl[312].w[8]"  1;
	setAttr ".wl[313].w[8]"  1;
	setAttr ".wl[314].w[8]"  1;
	setAttr ".wl[315].w[8]"  1;
	setAttr ".wl[316].w[8]"  1;
	setAttr ".wl[317].w[8]"  1;
	setAttr ".wl[318].w[8]"  1;
	setAttr ".wl[319].w[8]"  1;
	setAttr -s 4 ".wl[320].w[7:10]"  0.15084785943315082 0.84864220792110368 
		0.00047119557681761672 3.8737068927903145e-005;
	setAttr ".wl[321].w[8]"  1;
	setAttr -s 2 ".wl[322].w";
	setAttr ".wl[322].w[5]" 0.6;
	setAttr ".wl[322].w[7]" 0.4;
	setAttr -s 4 ".wl[323].w[3:6]"  0.18622676364469681 0.47785329069050464 
		0.31471229397720979 0.021207651687588779;
	setAttr -s 4 ".wl[324].w[4:7]"  0.34544599881204546 0.53133281989524195 
		0.11459238436864103 0.0086287969240716241;
	setAttr -s 4 ".wl[325].w[2:5]"  0.27096831459072623 0.45087856783209806 
		0.24616724598337814 0.031985871593797607;
	setAttr -s 4 ".wl[326].w[3:6]"  0.43088273213715877 0.49275445461507805 
		0.071718339333559783 0.0046444739142034019;
	setAttr -s 4 ".wl[327].w[2:5]"  0.34966129942007318 0.54120371004761481 
		0.10311525863198809 0.006019731900323972;
	setAttr -s 4 ".wl[328].w[2:5]"  0.16785554218345505 0.49198800241529639 
		0.3238181346634747 0.016338320737773877;
	setAttr -s 4 ".wl[329].w[2:5]"  0.046479397850480088 0.54918437329296732 
		0.4009454859226238 0.0033907429339288713;
	setAttr -s 4 ".wl[330].w[2:5]"  0.12757042404403909 0.72509760226414921 
		0.14490161266341051 0.0024303610284012542;
	setAttr -s 4 ".wl[331].w[2:5]"  0.38539501700917389 0.56092060301313418 
		0.051160654428049228 0.0025237255496427004;
	setAttr -s 4 ".wl[332].w[2:5]"  0.085637904470365192 0.85047016755000071 
		0.063098176695924865 0.00079375128370907477;
	setAttr -s 4 ".wl[333].w[2:5]"  0.32379779855349167 0.4686112260003597 
		0.18794518537425084 0.019645790071897793;
	setAttr -s 4 ".wl[334].w[2:5]"  0.21417583002653673 0.51142063656982584 
		0.26259923934887158 0.011804294054765798;
	setAttr -s 4 ".wl[335].w[3:6]"  0.22512238466983847 0.51843947451193617 
		0.24321418536177017 0.013223955456455145;
	setAttr -s 4 ".wl[336].w[2:5]"  0.10817393540252175 0.42579842785710204 
		0.4157546478500615 0.050272988890314778;
	setAttr -s 2 ".wl[337].w";
	setAttr ".wl[337].w[5]" 0.6;
	setAttr ".wl[337].w[7]" 0.4;
	setAttr -s 4 ".wl[338].w[4:7]"  0.34498520242790581 0.50798176699585729 
		0.13555256359492626 0.011480466981310696;
	setAttr ".wl[339].w[8]"  1;
	setAttr -s 3 ".wl[340].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr ".wl[341].w[8]"  1;
	setAttr ".wl[342].w[8]"  1;
	setAttr ".wl[343].w[8]"  1;
	setAttr ".wl[344].w[8]"  1;
	setAttr ".wl[345].w[8]"  1;
	setAttr ".wl[346].w[8]"  1;
	setAttr ".wl[347].w[8]"  1;
	setAttr ".wl[348].w[8]"  1;
	setAttr -s 3 ".wl[349].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr ".wl[350].w[8]"  1;
	setAttr ".wl[351].w[8]"  1;
	setAttr ".wl[352].w[8]"  1;
	setAttr ".wl[353].w[8]"  1;
	setAttr ".wl[354].w[8]"  1;
	setAttr ".wl[355].w[8]"  1;
	setAttr ".wl[356].w[8]"  1;
	setAttr ".wl[357].w[8]"  1;
	setAttr ".wl[358].w[8]"  1;
	setAttr ".wl[359].w[8]"  1;
	setAttr ".wl[360].w[8]"  1;
	setAttr ".wl[361].w[8]"  1;
	setAttr ".wl[362].w[8]"  1;
	setAttr ".wl[363].w[8]"  1;
	setAttr ".wl[364].w[8]"  1;
	setAttr ".wl[365].w[8]"  1;
	setAttr ".wl[366].w[8]"  1;
	setAttr ".wl[367].w[8]"  1;
	setAttr ".wl[368].w[8]"  1;
	setAttr ".wl[369].w[8]"  1;
	setAttr ".wl[370].w[8]"  1;
	setAttr ".wl[371].w[8]"  1;
	setAttr ".wl[372].w[8]"  1;
	setAttr ".wl[373].w[8]"  1;
	setAttr ".wl[374].w[8]"  1;
	setAttr ".wl[375].w[8]"  1;
	setAttr ".wl[376].w[8]"  1;
	setAttr ".wl[377].w[8]"  1;
	setAttr ".wl[378].w[8]"  1;
	setAttr ".wl[379].w[8]"  1;
	setAttr ".wl[380].w[8]"  1;
	setAttr ".wl[381].w[8]"  1;
	setAttr ".wl[382].w[8]"  1;
	setAttr ".wl[383].w[8]"  1;
	setAttr ".wl[384].w[8]"  1;
	setAttr ".wl[385].w[8]"  1;
	setAttr ".wl[386].w[8]"  1;
	setAttr ".wl[387].w[8]"  1;
	setAttr ".wl[388].w[8]"  1;
	setAttr ".wl[389].w[8]"  1;
	setAttr ".wl[390].w[8]"  1;
	setAttr -s 4 ".wl[391].w[6:9]"  0.0017412912269805631 0.64774731749892789 
		0.35050228238105774 9.1088930338903364e-006;
	setAttr ".wl[392].w[8]"  1;
	setAttr ".wl[393].w[8]"  1;
	setAttr ".wl[394].w[8]"  1;
	setAttr ".wl[395].w[8]"  1;
	setAttr ".wl[396].w[8]"  1;
	setAttr ".wl[397].w[8]"  1;
	setAttr ".wl[398].w[8]"  1;
	setAttr ".wl[399].w[8]"  1;
	setAttr ".wl[400].w[8]"  1;
	setAttr ".wl[401].w[8]"  1;
	setAttr ".wl[402].w[8]"  1;
	setAttr ".wl[403].w[8]"  1;
	setAttr ".wl[404].w[8]"  1;
	setAttr ".wl[405].w[8]"  1;
	setAttr ".wl[406].w[8]"  1;
	setAttr ".wl[407].w[8]"  1;
	setAttr ".wl[408].w[8]"  1;
	setAttr ".wl[409].w[8]"  1;
	setAttr ".wl[410].w[8]"  1;
	setAttr ".wl[411].w[8]"  1;
	setAttr ".wl[412].w[8]"  1;
	setAttr ".wl[413].w[8]"  1;
	setAttr ".wl[414].w[9]"  1;
	setAttr ".wl[415].w[9]"  1;
	setAttr ".wl[416].w[9]"  1;
	setAttr ".wl[417].w[9]"  1;
	setAttr ".wl[418].w[9]"  1;
	setAttr ".wl[419].w[9]"  1;
	setAttr ".wl[420].w[9]"  1;
	setAttr ".wl[421].w[9]"  1;
	setAttr ".wl[422].w[9]"  1;
	setAttr ".wl[423].w[9]"  1;
	setAttr ".wl[424].w[9]"  1;
	setAttr ".wl[425].w[9]"  1;
	setAttr ".wl[426].w[9]"  1;
	setAttr ".wl[427].w[9]"  1;
	setAttr ".wl[428].w[9]"  1;
	setAttr ".wl[429].w[9]"  1;
	setAttr ".wl[430].w[9]"  1;
	setAttr ".wl[431].w[9]"  1;
	setAttr ".wl[432].w[9]"  1;
	setAttr ".wl[433].w[9]"  1;
	setAttr ".wl[434].w[9]"  1;
	setAttr ".wl[435].w[9]"  1;
	setAttr ".wl[436].w[9]"  1;
	setAttr ".wl[437].w[9]"  1;
	setAttr ".wl[438].w[9]"  1;
	setAttr ".wl[439].w[9]"  1;
	setAttr ".wl[440].w[9]"  1;
	setAttr ".wl[441].w[9]"  1;
	setAttr ".wl[442].w[9]"  1;
	setAttr ".wl[443].w[9]"  1;
	setAttr ".wl[444].w[9]"  1;
	setAttr ".wl[445].w[9]"  1;
	setAttr ".wl[446].w[9]"  1;
	setAttr ".wl[447].w[9]"  1;
	setAttr ".wl[448].w[9]"  1;
	setAttr ".wl[449].w[9]"  1;
	setAttr -s 4 ".wl[450].w[7:10]"  0.00024896236344285121 0.042478203611626249 
		0.95661884546279907 0.00065398856213182664;
	setAttr ".wl[451].w[9]"  1;
	setAttr ".wl[452].w[9]"  1;
	setAttr ".wl[453].w[9]"  1;
	setAttr ".wl[454].w[9]"  1;
	setAttr ".wl[455].w[9]"  1;
	setAttr ".wl[456].w[9]"  1;
	setAttr ".wl[457].w[9]"  1;
	setAttr -s 4 ".wl[458].w[0:3]"  0.7315606700336601 0.26205287383995318 
		0.0056516605611164035 0.00073479556527033662;
	setAttr -s 4 ".wl[459].w[0:3]"  0.99966231941042782 0.00032775502850243093 
		8.5371801401362009e-006 1.3883809295667032e-006;
	setAttr -s 4 ".wl[460].w[0:3]"  0.5239737471509901 0.4323043212780957 
		0.037976209827741109 0.0057457217431731026;
	setAttr -s 4 ".wl[461].w[2:5]"  0.01683354316739857 0.48816328885075672 
		0.48816328885075672 0.006839879131087947;
	setAttr -s 4 ".wl[462].w[0:3]"  0.7986006153948435 0.19887622614519276 
		0.0022540050293398672 0.00026915343062396769;
	setAttr -s 4 ".wl[463].w[0:3]"  0.60414593363706126 0.37517075158696117 
		0.018111629987139811 0.0025716847888378729;
	setAttr -s 4 ".wl[464].w[1:4]"  0.05599355389700484 0.41804997371421992 
		0.40835951841688151 0.11759695397189376;
	setAttr -s 4 ".wl[465].w[1:4]"  0.038061687888012216 0.43907761350323066 
		0.42876018579326863 0.09410051281548848;
	setAttr -s 4 ".wl[466].w[1:4]"  0.077759409350252703 0.44789076847964321 
		0.38723198853802165 0.087117833632082503;
	setAttr -s 4 ".wl[467].w[1:4]"  0.060147027472368636 0.47090255726183111 
		0.39768999863855542 0.07126041662724486;
	setAttr -s 4 ".wl[468].w[0:3]"  0.16450105512008442 0.48648458412786144 
		0.32003184883139529 0.028982511920658809;
	setAttr -s 4 ".wl[469].w[0:3]"  0.12340372488572125 0.54789231412712847 
		0.31088077612780657 0.017823184859343772;
	setAttr -s 4 ".wl[470].w[0:3]"  0.15625776461104623 0.6379323213916861 
		0.19680570852482343 0.0090042054724441267;
	setAttr -s 4 ".wl[471].w[0:3]"  0.12869469167785008 0.68837405202683377 
		0.17633668646518863 0.00659456983012747;
	setAttr -s 4 ".wl[472].w[0:3]"  0.14301276530689724 0.47249719286752428 
		0.35061368003174392 0.033876361793834561;
	setAttr -s 4 ".wl[473].w[0:3]"  0.51326806009488524 0.43391794011646434 
		0.045574609601653493 0.0072393901869969631;
	setAttr -s 4 ".wl[474].w[0:3]"  0.97218923395116386 0.026744961674827403 
		0.00091237941203106676 0.00015342496197771069;
	setAttr -s 4 ".wl[475].w[0:3]"  0.66896773985799318 0.31894682579128009 
		0.010626834076045245 0.001458600274681479;
	setAttr -s 4 ".wl[476].w[0:3]"  0.13575149679411383 0.60271630184824898 
		0.24956474605101989 0.011967455306617391;
	setAttr -s 4 ".wl[477].w[1:4]"  0.05788728968753714 0.44166188362896436 
		0.40842447675182897 0.092026349931669568;
	setAttr -s 4 ".wl[478].w[2:5]"  0.011747897863590885 0.49180415825350404 
		0.49180415825350426 0.0046437856294007105;
	setAttr -s 4 ".wl[479].w[1:4]"  0.040765564790131562 0.41727965094559527 
		0.41662301613075581 0.12533176813351737;
	setAttr -s 4 ".wl[480].w[0:3]"  0.95778256552688634 0.040744408003294749 
		0.001267659406442121 0.00020536706337680822;
	setAttr -s 4 ".wl[481].w[0:3]"  0.97804886151303883 0.021335577208308892 
		0.00053263774488083559 8.2923533771334619e-005;
	setAttr -s 4 ".wl[482].w[0:3]"  0.69329248642866459 0.28206925940403338 
		0.020900321188810592 0.0037379329784914036;
	setAttr -s 4 ".wl[483].w[0:3]"  0.90437454972860232 0.091379421896988347 
		0.003636620258216245 0.00060940811619311207;
	setAttr -s 4 ".wl[484].w[0:3]"  0.66838835442132083 0.30122273503096858 
		0.025654485283696203 0.0047344252640144089;
	setAttr -s 4 ".wl[485].w[0:3]"  0.82054272773276815 0.16926685657106486 
		0.0086929368671737513 0.001497478828993181;
	setAttr -s 4 ".wl[486].w[3:6]"  0.19486399929464951 0.72261613628492172 
		0.080363383638696828 0.0021564807817320312;
	setAttr -s 4 ".wl[487].w[2:5]"  0.083223295216826032 0.4529210968014265 
		0.44655109114874492 0.017304516833002572;
	setAttr -s 4 ".wl[488].w[2:5]"  0.12754713436949119 0.42836821480109688 
		0.42314092792638547 0.020943722903026377;
	setAttr -s 4 ".wl[489].w[3:6]"  0.14890446626998538 0.7956839756107128 
		0.054189828278520612 0.0012217298407813191;
	setAttr -s 4 ".wl[490].w[2:5]"  0.11898263913454389 0.43417700204644544 
		0.42838978151424523 0.018450577304765476;
	setAttr -s 4 ".wl[491].w[2:5]"  0.073615917422581598 0.45956536123650243 
		0.45230797820486451 0.014510743136051418;
	setAttr -s 4 ".wl[492].w[0:3]"  0.14205669647575758 0.59566664633127842 
		0.24975307129256877 0.012523585900395224;
	setAttr -s 4 ".wl[493].w[0:3]"  0.60484741473458781 0.38064904143351685 
		0.012846423871342907 0.001657119960552296;
	setAttr -s 4 ".wl[494].w[0:3]"  0.83365186344434616 0.15863160596307097 
		0.0066333108573146896 0.0010832197352682266;
	setAttr -s 4 ".wl[495].w[0:3]"  0.90523013798809282 0.090365883647769735 
		0.0037642627828009421 0.00063971558133646845;
	setAttr -s 4 ".wl[496].w[0:3]"  0.85587208665101544 0.13597740434971906 
		0.0069334869275759162 0.0012170220716896459;
	setAttr -s 4 ".wl[497].w[0:3]"  0.71623010114811225 0.26158501398312217 
		0.018800025732932931 0.0033848591358326633;
	setAttr -s 4 ".wl[498].w[0:3]"  0.54002712252821128 0.4208429877962177 
		0.033966601013590551 0.0051632886619804585;
	setAttr -s 4 ".wl[499].w[0:3]"  0.12378831672265576 0.5022986593344525 
		0.34805533212210904 0.025857691820782749;
	setAttr -s 4 ".wl[500].w[1:4]"  0.030261014443233876 0.43410932802965158 
		0.43312873829963566 0.10250091922747892;
	setAttr -s 4 ".wl[501].w[3:6]"  0.45673681377951597 0.5152823612216475 
		0.026582060566092074 0.0013987644327445761;
	setAttr -s 4 ".wl[502].w[3:6]"  0.098337342157029675 0.90107619451312626 
		0.00056915847895402862 1.7304850890046406e-005;
	setAttr -s 4 ".wl[503].w[3:6]"  0.26546572077331654 0.73045835121498714 
		0.0039455026366435999 0.00013042537505277799;
	setAttr -s 4 ".wl[504].w[3:6]"  0.45751911981741616 0.50657924403978216 
		0.033993366858969594 0.0019082692838320618;
	setAttr -s 4 ".wl[505].w[1:4]"  0.049055419756687479 0.45772064805190937 
		0.41509545067834508 0.078128481513058082;
	setAttr -s 4 ".wl[506].w[3:6]"  0.44457707321865125 0.47048077335395533 
		0.078812932284577433 0.0061292211428160149;
	setAttr -s 4 ".wl[507].w[2:5]"  0.06937910233285631 0.51441796559309494 
		0.40998492055374419 0.0062180115203046248;
	setAttr -s 4 ".wl[508].w[2:5]"  0.35258261878361374 0.39223798209081795 
		0.18915061245867862 0.066028786666889772;
	setAttr ".wl[509].w[8]"  1;
	setAttr -s 4 ".wl[510].w[3:6]"  0.43590290587627023 0.49276128393515134 
		0.06701528187093056 0.0043205283176478175;
	setAttr -s 4 ".wl[511].w[3:6]"  0.47043489717913528 0.47434556033570746 
		0.0512665302648522 0.0039530122203051176;
	setAttr -s 3 ".wl[512].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr -s 3 ".wl[513].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr -s 3 ".wl[514].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr -s 3 ".wl[515].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr -s 4 ".wl[516].w[4:7]"  0.34548604638623953 0.44225932123123429 
		0.18801668211394107 0.024237950268585062;
	setAttr -s 5 ".wl[517].w[4:8]"  0.34171553112908831 0.50166597937557333 
		0.12852072479725188 0.010733059716640283 0.017364704981446266;
	setAttr -s 4 ".wl[518].w[4:7]"  0.36075973841954545 0.51432695489313485 
		0.11549211539150124 0.0094211912958185266;
	setAttr -s 4 ".wl[519].w[4:7]"  0.35167298964472732 0.52979180099771239 
		0.11019119515052374 0.0083440142070364629;
	setAttr -s 4 ".wl[520].w[4:7]"  0.34041700995550034 0.44696329886470099 
		0.18910251017410815 0.023517181005690443;
	setAttr -s 4 ".wl[521].w[2:5]"  0.38206567558166088 0.41489400976927193 
		0.15633236782655244 0.046707946822514584;
	setAttr -s 4 ".wl[522].w[2:5]"  0.064554042223122804 0.55384530697099277 
		0.3774924029193118 0.0041082478865726527;
	setAttr -s 4 ".wl[523].w[3:6]"  0.4634647887183726 0.47266128065129737 
		0.059292301658616146 0.0045816289717140295;
	setAttr -s 4 ".wl[524].w[4:7]"  0.35136890345613153 0.52686784472034454 
		0.11307804254789244 0.0086852092756313851;
	setAttr -s 3 ".wl[525].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr ".wl[526].w[8]"  1;
	setAttr -s 3 ".wl[527].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr -s 4 ".wl[528].w[2:5]"  0.052176032137951654 0.46135380285709859 
		0.46135380285709882 0.025116362147850874;
	setAttr -s 4 ".wl[529].w[2:5]"  0.086899316879840871 0.45135241404947396 
		0.44171693066940731 0.020031338401277812;
	setAttr -s 4 ".wl[530].w[1:4]"  0.009117310042229659 0.47217098223324816 
		0.47198984881249401 0.046721858912028139;
	setAttr -s 4 ".wl[531].w[2:5]"  0.048654806069184285 0.46607922452721773 
		0.46607922452721773 0.019186744876380363;
	setAttr -s 4 ".wl[532].w[1:4]"  0.004512658928220465 0.49174426689247919 
		0.48242394179188208 0.021319132387418262;
	setAttr -s 4 ".wl[533].w[2:5]"  0.10995041572666456 0.45765585436988526 
		0.41635354000007463 0.016040189903375614;
	setAttr ".wl[534].w[8]"  1;
	setAttr ".wl[535].w[8]"  1;
	setAttr ".wl[536].w[8]"  1;
	setAttr ".wl[537].w[8]"  1;
	setAttr ".wl[538].w[8]"  1;
	setAttr ".wl[539].w[8]"  1;
	setAttr -s 4 ".wl[540].w[4:7]"  0.34975959350514718 0.49410817927318451 
		0.14305807638462734 0.013074150837041035;
	setAttr -s 4 ".wl[541].w[2:5]"  0.18034752673268081 0.38592500981268812 
		0.35151817467554219 0.082209288779088951;
	setAttr -s 4 ".wl[542].w[2:5]"  0.32502245498047161 0.48930085982287874 
		0.17109250358134481 0.01458418161530479;
	setAttr -s 4 ".wl[543].w[2:5]"  0.33438627066911863 0.63366346528361495 
		0.030674421412640162 0.0012758426346263054;
	setAttr -s 4 ".wl[544].w[2:5]"  0.21380710902801034 0.78237234451954762 
		0.0036948563635441846 0.00012569008889786937;
	setAttr -s 4 ".wl[545].w[2:5]"  0.37710736556136887 0.50235152408719252 
		0.11241429486670175 0.0081268154847368938;
	setAttr -s 4 ".wl[546].w[2:5]"  0.22930679066958812 0.41736056979268155 
		0.29759974063717415 0.05573289890055623;
	setAttr -s 4 ".wl[547].w[4:7]"  0.3436747804743871 0.47982225714995902 
		0.16051750053918898 0.015985461836464848;
	setAttr -s 3 ".wl[548].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr ".wl[549].w[8]"  1;
	setAttr ".wl[550].w[8]"  1;
	setAttr ".wl[551].w[8]"  1;
	setAttr ".wl[552].w[8]"  1;
	setAttr -s 3 ".wl[553].w[6:8]"  0.30000000000000004 0.35 0.35;
	setAttr ".wl[554].w[8]"  1;
	setAttr ".wl[555].w[8]"  1;
	setAttr ".wl[556].w[8]"  1;
	setAttr ".wl[557].w[8]"  1;
	setAttr ".wl[558].w[8]"  1;
	setAttr ".wl[559].w[8]"  1;
	setAttr ".wl[560].w[8]"  1;
	setAttr ".wl[561].w[8]"  1;
	setAttr ".wl[562].w[8]"  1;
	setAttr ".wl[563].w[8]"  1;
	setAttr ".wl[564].w[8]"  1;
	setAttr ".wl[565].w[8]"  1;
	setAttr ".wl[566].w[8]"  1;
	setAttr ".wl[567].w[8]"  1;
	setAttr ".wl[568].w[8]"  1;
	setAttr ".wl[569].w[8]"  1;
	setAttr ".wl[570].w[8]"  1;
	setAttr ".wl[571].w[8]"  1;
	setAttr ".wl[572].w[8]"  1;
	setAttr ".wl[573].w[8]"  1;
	setAttr ".wl[574].w[8]"  1;
	setAttr -s 4 ".wl[575].w[6:9]"  0.018191193079426408 0.85540913056479018 
		0.1263339489160443 6.5727439739166659e-005;
	setAttr ".wl[576].w[8]"  1;
	setAttr ".wl[577].w[8]"  1;
	setAttr ".wl[578].w[8]"  1;
	setAttr ".wl[579].w[8]"  1;
	setAttr ".wl[580].w[8]"  1;
	setAttr ".wl[581].w[8]"  1;
	setAttr ".wl[582].w[8]"  1;
	setAttr ".wl[583].w[8]"  1;
	setAttr ".wl[584].w[8]"  1;
	setAttr ".wl[585].w[8]"  1;
	setAttr ".wl[586].w[9]"  1;
	setAttr ".wl[587].w[9]"  1;
	setAttr ".wl[588].w[9]"  1;
	setAttr ".wl[589].w[9]"  1;
	setAttr ".wl[590].w[9]"  1;
	setAttr ".wl[591].w[9]"  1;
	setAttr ".wl[592].w[9]"  1;
	setAttr ".wl[593].w[9]"  1;
	setAttr ".wl[594].w[9]"  1;
	setAttr ".wl[595].w[9]"  1;
	setAttr ".wl[596].w[9]"  1;
	setAttr -s 4 ".wl[597].w[7:10]"  0.0063909881660391687 0.43514733070232431 
		0.54475694894790649 0.013704732183730042;
	setAttr -s 4 ".wl[598].w[7:10]"  0.00018857411533625311 0.064181023731558276 
		0.93505626916885376 0.00057413298425171072;
	setAttr ".wl[599].w[9]"  1;
	setAttr ".wl[600].w[9]"  1;
	setAttr ".wl[601].w[9]"  1;
	setAttr ".wl[602].w[9]"  1;
	setAttr ".wl[603].w[9]"  1;
	setAttr ".wl[604].w[9]"  1;
	setAttr ".wl[605].w[9]"  1;
	setAttr ".wl[606].w[9]"  1;
	setAttr ".wl[607].w[9]"  1;
	setAttr -s 11 ".pm";
	setAttr ".pm[0]" -type "matrix" 1.2550147532158336e-016 1.914018656634225e-016 -1 0
		 -0.94428185435575518 0.32913793390379154 -1.914018656634225e-016 0 0.32913793390379159 0.94428185435575518 1.2550147532158336e-016 0
		 25.356313025502491 -5.9178227828717249 1.0301123615608177e-014 1;
	setAttr ".pm[1]" -type "matrix" 1.2564525105812736e-016 1.9130751520489984e-016 -1 0
		 -0.94403428767202457 0.32984733392824855 -1.914018656634225e-016 0 0.32984733392824861 0.94403428767202457 1.2550147532158339e-016 0
		 22.971184946153471 -5.953435446535722 9.4115248226067887e-015 1;
	setAttr ".pm[2]" -type "matrix" 1.2180381065035905e-016 1.937759690941689e-016 -1 0
		 -0.95042661766604386 0.31094894184075245 -1.9140186566342248e-016 0 0.3109489418407525 0.95042661766604386 1.2550147532158334e-016 0
		 19.070840415639047 -5.6014842359528307 8.5713076964847597e-015 1;
	setAttr ".pm[3]" -type "matrix" 1.3219212031104672e-016 1.868436186092599e-016 -1 0
		 -0.93205077373059242 0.36232769034149764 -1.9140186566342248e-016 0 0.3623276903414977 0.93205077373059242 1.2550147532158336e-016 0
		 14.883570534362468 -6.524103744348146 7.7647928970821739e-015 1;
	setAttr ".pm[4]" -type "matrix" -5.8584534234703816e-017 -3.4371826030573286e-016 1 0
		 -0.87574326641507128 0.48277710315285405 2.5052500907119991e-016 0 -0.48277710315285405 -0.87574326641507128 -2.3274909413058979e-016 0
		 13.059620383739928 -5.5492423743740336 -2.9428687807539519e-011 1;
	setAttr ".pm[5]" -type "matrix" -4.0140366585218178e-008 -3.4221182911940656e-016 0.99999999999999911 0
		 -0.86389383553003818 0.50367394307547608 -3.4677014940632045e-008 0 -0.50367394307547575 -0.86389383553003907 -2.0217656913563487e-008 0
		 10.020253732674911 -5.7145056312566656 4.0244508209799886e-007 1;
	setAttr ".pm[6]" -type "matrix" -4.0132945182591562e-008 -7.7184231990814251e-010 0.99999999999999911 0
		 -0.87341904485422639 0.48696937489531056 -3.4677014940632045e-008 0 -0.48696937489531017 -0.87341904485422728 -2.021765691356349e-008 0
		 6.7708792458631875 -5.4156031686340755 4.0296870476401564e-007 1;
	setAttr ".pm[7]" -type "matrix" -4.0037788458984201e-008 -2.8678432504813597e-009 0.99999999999999922 0
		 -0.89767133363781326 0.44066560651463221 -3.4677014940632051e-008 0 -0.44066560651463171 -0.89767133363781404 -2.021765691356349e-008 0
		 3.7319329204228069 -5.1238681338394434 4.0348519081118608e-007 1;
	setAttr ".pm[8]" -type "matrix" 0.99999999999999767 3.4679587496950843e-008 6.074166089997158e-008 0
		 -3.4671859435952485e-008 0.99999999190777467 -0.00012721811818888458 0 -6.0746072209174631e-008 0.00012721811818668791 0.99999999190777356 0
		 3.549847220346132e-007 -3.406245435286094 4.0938882188700889 1;
	setAttr ".pm[9]" -type "matrix" 2.9284098132310786e-008 -1.5695074630596739e-008 -0.99999999999999933 0
		 0.011362904803333891 0.99993544011322555 -1.5361309280275391e-008 0 0.99993544011322522 -0.011362904803333525 2.9460549090844446e-008 0
		 -2.2087138603730785 -0.0097623423191833449 -2.1965258904239602e-007 1;
	setAttr ".pm[10]" -type "matrix" 0.99999999999999933 -1.5361309003931398e-008 2.9460548828245167e-008 0
		 1.5361309284612199e-008 0.99999999999999978 2.0746407679968462e-009 0 -2.9460548757777535e-008 -2.074640402390647e-009 0.99999999999999956 0
		 3.6798675104717933e-007 -0.034859760386710938 -7.9389390509892479 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 11 ".ma";
	setAttr -s 11 ".dpf[0:10]"  4 4 4 4 4 4 4 4 4 4 4;
	setAttr -s 11 ".lw";
	setAttr -s 11 ".lw";
	setAttr ".mi" 4;
	setAttr ".ptw" -type "doubleArray" 608 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.40000000000000002
		 0.40000000000000002 0.40000000000000002 0.40000000000000002 0 0 0 0 0.40000000000000002
		 0 0 0 0 0.40000000000000002 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.40000000000000002 0 0 0
		 0 0 0 0 0.40000000000000002 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0.34999999999999998 0.34999999999999998 0 0 0 0 0 0 0.34999999999999998
		 0.34999999999999998 0.40000000000000002 0.010592584824698045 0.40000000000000002
		 0.009909088456460588 0.40000000000000002 0.40000000000000002 0.019339116320965823
		 0.020881931964053264 0 0 0 0 0 0 0.40000000000000002 0 0.026039626237453536 0 0 0
		 0 0 0.40000000000000002 0.0081212082975726536 0 0.34999999999999998 0 0.34999999999999998
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.15084785943315082 0 0.40000000000000002
		 0 0.0086287969240716241 0 0 0 0 0 0 0 0 0 0 0 0 0.40000000000000002 0.011480466981310696
		 0 0.34999999999999998 0 0 0 0 0 0 0 0 0.34999999999999998 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.64774731749892789 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00024896236344285121 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0.34999999999999998 0.34999999999999998 0.34999999999999998 0.34999999999999998
		 0.024237950268585062 0.010733059716640283 0.0094211912958185266 0.0083440142070364629
		 0.023517181005690443 0 0 0 0.0086852092756313851 0.34999999999999998 0 0.34999999999999998
		 0 0 0 0 0 0 0 0 0 0 0 0 0.013074150837041035 0 0 0 0 0 0 0.015985461836464848 0.34999999999999998
		 0 0 0 0 0.34999999999999998 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.85540913056479018
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0063909881660391687 0.00018857411533625311
		 0 0 0 0 0 0 0 0 0 ;
	setAttr ".ucm" yes;
createNode groupId -n "groupId14";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts14";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:599]";
createNode tweak -n "tweak3";
createNode objectSet -n "skinCluster1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster1GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet3";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId16";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts16";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose2";
	setAttr -s 11 ".wm";
	setAttr -s 11 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 -5.5511151231257839e-017 1.1102230246251565e-016
		 -1.6653345369377348e-016 0 4.9993962629648278e-015 25.891286247309658 -2.7576318094728394 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.40953084929471689 -0.57644122291517963 -0.40953084929471689 0.57644122291517974 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 -0.00014250481146938437 0 2.3806614070648457
		 0.018351418972396338 8.8959879300138966e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.00044693100488367487 0.99999990012633344 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 -0.0005506005808271823 0 4.0158849924780995
		 0.027382513458896973 8.4021712612202743e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 -0.009699820879069029 0.99995295563087061 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0.00056588727376718237 0 3.853565734642002
		 0.10107245394043307 8.0651479940258744e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.027000156393985231 0.99963542932146032 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 -1.01120025406478e-010 5.574583285673743e-011
		 2.0746414586241948e-009 0 2.2504413027580821 -0.06253881667570127 -2.9420243428451296e-011 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.90590111941546658 -0.42348927004329706 -2.5931238951588642e-017 5.5470445311807767e-017 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 2.0357499559952724e-009 4.0140366518394135e-008
		 3.7838977984833179e-009 0 2.9049903570943076 -0.077081146961504921 -2.5785334892833657e-010 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.012011316862139349 0.99992786153163937 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 3.2123711260489966e-009 0 3.3547606503367735
		 -0.16970938509191136 -5.2362266601672955e-010 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 -0.0096147310252991947 0.99995377740539149 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 3.2123711121712084e-009 0 3.3117805638928361
		 -0.10373115550143996 -5.1648604717048946e-010 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 -0.026135284949154472 0.99965841510019138 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 2.0746407623379096e-009 4.0528415397335539e-008
		 3.9906328662321609e-009 0 2.4776213043463926 0.051953644756326689 -1.1741833296134771e-007 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.37398148253260788 -0.60011486460736208 0.37398148253260766 0.60011486460736241 1
		 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 4.9674446832027013e-008 -3.1852024854537905e-008
		 -2.0746393588262003e-009 0 6.4495183945754186e-008 -3.3711053620032732 6.3023441037773118 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.0040624360254334912 -0.70709511143377279 0.0040624360254316039 0.70709511143377246 1
		 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 2.0746403293220306e-009 -3.2027415394514803e-011
		 -3.3222683810704836e-020 0 5.7301087618635052 -0.065114224680311639 1.483341646491324e-007 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.004017457628910385 0.7070953684151805 -0.0040174576289103833 0.70709536841518073 1
		 1 1 yes;
	setAttr -s 11 ".m";
	setAttr -s 11 ".p";
	setAttr ".bp" yes;
createNode animCurveTU -n "ctrl_l1_leg_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 1 5 1 8 1 11 1 13 1 14 1 15 1 16 1 17 1
		 18 1 19 1;
	setAttr -s 11 ".kot[0:10]"  5 5 5 5 5 5 5 5 
		5 5 5;
createNode animCurveTL -n "ctrl_l1_leg_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 3 3.0117238963369206 5 3.0029181473666138
		 8 2.8685897962328459 11 2.7739687627764638 13 0.50625710361510901 14 -0.98584081451432137
		 15 -2.6253443299768739 16 -3.224770508929744 17 -5.074074100430666 18 -6.3705665820820414
		 19 -6.010028317853525;
createNode animCurveTL -n "ctrl_l1_leg_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 3 6.9020932071426104 5 9.670882934255113
		 8 12.946766257371824 11 13.092762003411648 13 4.519334215563414 14 6.3152490197471538
		 15 7.5518074092306664 16 2.9347627735879223 17 11.197860621393039 18 32.15495618756264
		 19 52.289088643146492;
createNode animCurveTL -n "ctrl_l1_leg_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 3 -20.026759866667277 5 -24.761751572119618
		 8 -28.383451916506985 11 -28.514051337285078 13 -6.052790634930485 14 2.025400023078852
		 15 4.1452127589116223 16 25.768412146916546 17 42.754989531329137 18 64.190993339293044
		 19 63.868653267992158;
createNode animCurveTA -n "ctrl_l1_leg_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 0 2 20.821452824992999 3 128.52329809522931
		 5 153.78992139212551 8 167.89987736306881 11 168.28317640243321 12 143.1350173609365
		 13 165.264529159424 14 141.02205561831607 15 94.42326034856417 16 99.319827341495127
		 17 -46.081039863805742 18 -118.96917849371413 19 -174.53527931688114;
createNode animCurveTA -n "ctrl_l1_leg_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 3 -13.286772084529707 5 -13.235593374589188
		 8 -12.454881703750917 11 -11.904947605272573 13 -2.6827493589046281 14 -4.5093921697843493
		 15 -8.3656337028561065 16 -12.878433056427287 17 -10.013369723579309 18 -5.0018944198654731
		 19 0;
createNode animCurveTA -n "ctrl_l1_leg_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 3 7.8384684759562697 5 7.8082758472038982
		 8 7.0751263114626726 11 7.0232676468118367 13 19.229393681758022 14 17.995664293300969
		 15 14.941407571023293 16 6.6180759598145862 17 4.0341404480709544 18 2.432078000357158
		 19 0;
createNode animCurveTU -n "ctrl_l1_leg_twist";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 5 0 8 0 11 0 13 0 14 0 15 0 16 0 17 0
		 18 0 19 0;
createNode animCurveTU -n "ctrl_l1_leg_stretch";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 45 5 45 8 45 11 45 13 45 14 45 15 45 16 45
		 17 45 18 45 19 45;
createNode animCurveTU -n "ctrl_l1_leg_foot_roll";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 5 0 8 0 11 0 13 0 14 16.850009039043304
		 15 33.7 16 0 17 0 18 0 19 0;
createNode animCurveTU -n "ctrl_l1_leg_roll_break";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 45 5 45 8 45 11 45 13 45 14 45 15 45 16 45
		 17 45 18 45 19 45;
createNode animCurveTU -n "ctrl_l1_leg_foot_twist";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 5 0 8 0 11 0 13 0 14 0 15 0 16 0 17 0
		 18 0 19 0;
createNode animCurveTU -n "ctrl_l1_leg_foot_bank";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 5 0 8 0 11 0 13 0 14 0 15 0 16 0 17 0
		 18 0 19 0;
createNode animCurveTU -n "ctrl_l1_leg_pivot_posX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 5 0 8 0 11 0 13 0 14 0 15 0 16 0 17 0
		 18 0 19 0;
createNode animCurveTU -n "ctrl_l1_leg_pivot_posZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 5 0 8 0 11 0 13 0 14 0 15 0 16 0 17 0
		 18 0 19 0;
createNode animCurveTU -n "ctrl_l1_leg_toe_flap";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 3 -35.818521280200379 5 -8.5137138868388824
		 8 65.549649908627785 11 69.5 13 37.800000000000004 14 43.793522359441546 15 56.333718436539478
		 16 67.24476276046201 17 -16.658657481862662 18 -7.9825992365494329 19 0;
createNode animCurveTU -n "ctrl_l1_leg_Bend_Vis";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 1 5 1 8 1 11 1 13 1 14 1 15 1 16 1 17 1
		 18 1 19 1;
	setAttr -s 11 ".kot[0:10]"  5 5 5 5 5 5 5 5 
		5 5 5;
createNode animCurveTU -n "ctrl_l1_leg_Follow";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 1 5 1 8 1 11 1 13 1 14 1 15 1 16 1 17 1
		 18 1 19 1;
	setAttr -s 11 ".kot[0:10]"  5 5 5 5 5 5 5 5 
		5 5 5;
createNode animCurveTU -n "curve4_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 1 5 1 8 1 11 1 13 1 14 1 15 1 16 1 17 1
		 18 1 19 1;
	setAttr -s 11 ".kot[0:10]"  5 5 5 5 5 5 5 5 
		5 5 5;
createNode animCurveTL -n "curve4_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  1 0 3 0.080166749553064437 5 0.48946988832882898
		 8 0.74738156387560539 11 0.7553547299214306 12 0.52996618652500882 13 -1.2310891502538372
		 14 -2.1120403441921312 15 -3.1555258758862919 16 -1.4575888287550343 17 0.24971177603792002
		 18 -1.568183430522915 19 0;
createNode animCurveTL -n "curve4_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  1 0 3 -8.6459271644968325 5 -8.1984248211843624
		 8 -12.322003018365537 11 -12.651889552859602 12 -8.5474846777850608 13 -9.603986795227005
		 14 -9.3544538318453991 15 -10.938223526983357 16 -20.247789218310594 17 -12.852710989205635
		 18 -0.63223865066572649 19 3.7780184815954927;
createNode animCurveTL -n "curve4_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  1 0 3 0.45458224001312347 5 2.6533585203838488
		 8 4.0511199320449487 11 4.0946888794164531 12 2.947901660022239 13 4.8583523280847549
		 14 7.6122079313973234 15 20.70682955784487 16 -1.8481108689366483 17 7.5493619374758341
		 18 -2.3605008100050155 19 -5.7534631610117737;
createNode animCurveTU -n "curve3_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 1 5 1 8 1 11 1 13 1 14 1 15 1 16 1 17 1
		 18 1 19 1;
	setAttr -s 11 ".kot[0:10]"  5 5 5 5 5 5 5 5 
		5 5 5;
createNode animCurveTL -n "curve3_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  1 0 3 -0.16746282108660182 5 0.013308894919747905
		 8 0.50364604263578916 11 0.52979936958909091 12 -0.1207285226421978 13 -1.0586651312895869
		 14 -0.86547660405859983 15 -0.20340784776028131 16 -1.457403631307415 17 -1.05072255404227
		 18 -0.79070405992215231 19 0;
createNode animCurveTL -n "curve3_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  1 0 3 -11.134460512670001 5 -11.827542366160122
		 8 -12.114848671795412 11 -12.119366198881746 12 -10.722214242395498 13 -7.9484283334552277
		 14 -2.2508262750182357 15 1.3273301769948116 16 17.777161911558579 17 13.041283736941509
		 18 -0.20396526450471164 19 -5.2023592544086048;
createNode animCurveTL -n "curve3_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  1 0 3 -4.0940072318262359 5 -7.2930659216860771
		 8 -12.012637773591781 11 -12.237512975144364 12 -10.690300462057229 13 7.8953435952353441
		 14 8.5077477562611854 15 15.186400076973998 16 7.5417870972654608 17 2.1373998465672264
		 18 0.79978474841528002 19 0;
createNode animCurveTU -n "curve4_visibility1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 1 5 1 8 1 11 1 13 1 14 1 15 1 16 1 17 1
		 18 1 19 1;
	setAttr -s 11 ".kot[0:10]"  5 5 5 5 5 5 5 5 
		5 5 5;
createNode animCurveTL -n "curve4_translateX1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  1 0 3 -0.68742191687467913 5 -1.2161496061784525
		 8 -1.8721319670950129 11 -2.0305956226824695 12 -2.4403982957375701 13 0 14 -0.49060165286089907
		 15 -1.5070340832057125 16 2.1071104516202803 17 -0.76237450319243361 18 -4.6634834704436035
		 19 -4.0854369605853469;
createNode animCurveTL -n "curve4_translateY1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  1 0 3 -7.1104474684453001 5 -5.8395737304491782
		 8 -1.2425674733834358 11 -0.98957315630472653 12 -7.9435800638304528 13 -3.3804521179752354
		 14 -6.3800555068875173 15 -11.62935662120762 16 -6.3408892023946377 17 -7.5398773885964978
		 18 0.10033971683938761 19 -2.1300700509070802;
createNode animCurveTL -n "curve4_translateZ1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  1 0 3 6.1573354311365414 5 7.9772158753462845
		 8 9.1027979723030263 11 9.8125652916660897 12 15.223637996144497 13 6.904333703989022
		 14 8.3766050773345277 15 10.953077586304364 16 12.977363510989939 17 4.5590442890807807
		 18 -6.3672275791973965 19 -9.4937825944857916;
createNode animCurveTL -n "ctrl_root_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 5 -1.0558516788560115 8 -1.6095461004512539
		 11 -1.629400661279448 14 -1.629400661279448 15 -1.629400661279448 16 -1.629400661279448
		 17 -1.629400661279448 18 -1.629400661279448 19 -1.629400661279448;
createNode animCurveTL -n "ctrl_root_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 5 0 8 0 11 0 14 0 15 0 16 0 17 0 18 0
		 19 0;
createNode animCurveTL -n "ctrl_root_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 5 -6.9224314262804443 8 -10.552592495285506
		 11 -10.682764037335197 14 -10.682764037335197 15 -10.682764037335197 16 -10.682764037335197
		 17 -10.682764037335197 18 -10.682764037335197 19 -10.682764037335197;
createNode animCurveTL -n "curve1_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "curve1_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "curve1_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "curve2_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "curve2_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "curve2_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "curve1_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 3 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "curve1_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "curve1_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "curve1_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "curve1_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "curve1_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "curve1_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "curve2_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 3 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "curve2_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "curve2_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "curve2_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "curve2_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "curve2_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "curve2_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTA -n "ctrl_root_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 5 25.201973156053946 8 38.418026392351827
		 11 38.891932028287457 14 17.472844965530079 15 7.0397343874992444 16 -15.837483137423778
		 17 -19.735534743441121 18 -21.070419528162393 19 -24.006685987826696;
createNode animCurveTA -n "ctrl_root_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 8.6722645861137728 5 8.6722645861137728
		 8 8.6722645861137728 11 8.6722645861137728 14 8.6722645861137728 15 8.6722645861137728
		 16 8.6722645861137728 17 8.6722645861137728 18 8.6722645861137728 19 8.6722645861137728;
createNode animCurveTA -n "ctrl_root_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 5 0 8 0 11 0 14 0 15 0 16 0 17 0 18 0
		 19 0;
createNode makeNurbSphere -n "makeNurbSphere1";
	setAttr ".ax" -type "double3" 0 1 0 ;
	setAttr ".r" 17.648524532307643;
	setAttr ".s" 25;
	setAttr ".nsp" 27;
createNode animCurveTL -n "nurbsSphere1_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  16 -0.54078635266844266 17 -0.54078635266844266;
createNode animCurveTL -n "nurbsSphere1_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  16 5.2513096972092876 17 35.698955001487036
		 19 58.511277173437655 21 103.90419833494781;
createNode animCurveTL -n "nurbsSphere1_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  16 17.272135753888762 17 53.559866809656718
		 19 105.55962335710413 21 175.41867683114609;
createNode animCurveTU -n "nurbsSphere1_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  16 1 17 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "nurbsSphere1_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  16 0 17 0;
createNode animCurveTA -n "nurbsSphere1_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  16 0 17 0;
createNode animCurveTA -n "nurbsSphere1_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  16 0 17 0;
createNode animCurveTU -n "nurbsSphere1_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  16 0.29003580273772772 17 0.29003580273772772;
createNode animCurveTU -n "nurbsSphere1_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  16 0.29003580273772772 17 0.29003580273772772;
createNode animCurveTU -n "nurbsSphere1_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  16 0.29003580273772772 17 0.29003580273772772;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 24;
	setAttr ".unw" 24;
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
	setAttr -s 2 ".dsm";
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
	setAttr -s 24 ".u";
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
	setAttr -s 3 ".sol";
connectAttr "condition1.ocr" "joint1.sx";
connectAttr "joint1.s" "joint5.is";
connectAttr "condition1.ocr" "joint5.sx";
connectAttr "joint5.s" "joint6.is";
connectAttr "condition1.ocr" "joint6.sx";
connectAttr "joint6.s" "joint7.is";
connectAttr "condition1.ocr" "joint7.sx";
connectAttr "joint7.s" "joint2.is";
connectAttr "joint2.tx" "effector9.tx";
connectAttr "joint2.ty" "effector9.ty";
connectAttr "joint2.tz" "effector9.tz";
connectAttr "curve1_translateX.o" "curve1.tx";
connectAttr "curve1_translateY.o" "curve1.ty";
connectAttr "curve1_translateZ.o" "curve1.tz";
connectAttr "curve1_visibility.o" "curve1.v";
connectAttr "curve1_rotateX.o" "curve1.rx";
connectAttr "curve1_rotateY.o" "curve1.ry";
connectAttr "curve1_rotateZ.o" "curve1.rz";
connectAttr "curve1_scaleX.o" "curve1.sx";
connectAttr "curve1_scaleY.o" "curve1.sy";
connectAttr "curve1_scaleZ.o" "curve1.sz";
connectAttr "cluster3.og[0]" "curveShape1.cr";
connectAttr "tweak1.pl[0].cp[0]" "curveShape1.twl";
connectAttr "cluster1GroupId.id" "curveShape1.iog.og[0].gid";
connectAttr "cluster1Set.mwc" "curveShape1.iog.og[0].gco";
connectAttr "groupId11.id" "curveShape1.iog.og[1].gid";
connectAttr "tweakSet1.mwc" "curveShape1.iog.og[1].gco";
connectAttr "cluster2GroupId.id" "curveShape1.iog.og[2].gid";
connectAttr "cluster2Set.mwc" "curveShape1.iog.og[2].gco";
connectAttr "cluster3GroupId.id" "curveShape1.iog.og[3].gid";
connectAttr "cluster3Set.mwc" "curveShape1.iog.og[3].gco";
connectAttr "condition2.ocr" "joint8.sx";
connectAttr "joint8.s" "joint9.is";
connectAttr "condition2.ocr" "joint9.sx";
connectAttr "joint9.s" "joint10.is";
connectAttr "condition2.ocr" "joint10.sx";
connectAttr "joint10.s" "joint11.is";
connectAttr "condition2.ocr" "joint11.sx";
connectAttr "joint11.s" "joint4.is";
connectAttr "joint4.tx" "effector10.tx";
connectAttr "joint4.ty" "effector10.ty";
connectAttr "joint4.tz" "effector10.tz";
connectAttr "curve2_translateX.o" "curve2.tx";
connectAttr "curve2_translateY.o" "curve2.ty";
connectAttr "curve2_translateZ.o" "curve2.tz";
connectAttr "curve2_visibility.o" "curve2.v";
connectAttr "curve2_rotateX.o" "curve2.rx";
connectAttr "curve2_rotateY.o" "curve2.ry";
connectAttr "curve2_rotateZ.o" "curve2.rz";
connectAttr "curve2_scaleX.o" "curve2.sx";
connectAttr "curve2_scaleY.o" "curve2.sy";
connectAttr "curve2_scaleZ.o" "curve2.sz";
connectAttr "cluster6.og[0]" "curveShape2.cr";
connectAttr "tweak2.pl[0].cp[0]" "curveShape2.twl";
connectAttr "cluster4GroupId.id" "curveShape2.iog.og[0].gid";
connectAttr "cluster4Set.mwc" "curveShape2.iog.og[0].gco";
connectAttr "groupId13.id" "curveShape2.iog.og[1].gid";
connectAttr "tweakSet2.mwc" "curveShape2.iog.og[1].gco";
connectAttr "cluster5GroupId.id" "curveShape2.iog.og[2].gid";
connectAttr "cluster5Set.mwc" "curveShape2.iog.og[2].gco";
connectAttr "cluster6GroupId.id" "curveShape2.iog.og[3].gid";
connectAttr "cluster6Set.mwc" "curveShape2.iog.og[3].gco";
connectAttr "ctrl_l1_leg.Bend_Vis" "grp_ctrl_bend.v";
connectAttr "group2_pointConstraint1.ctx" "group2.tx";
connectAttr "group2_pointConstraint1.cty" "group2.ty";
connectAttr "group2_pointConstraint1.ctz" "group2.tz";
connectAttr "group2_orientConstraint1.crx" "group2.rx";
connectAttr "group2_orientConstraint1.cry" "group2.ry";
connectAttr "group2_orientConstraint1.crz" "group2.rz";
connectAttr "curve4_translateX.o" "|grp_leg|grp_ctrl_bend|group2|curve4.tx";
connectAttr "curve4_translateY.o" "|grp_leg|grp_ctrl_bend|group2|curve4.ty";
connectAttr "curve4_translateZ.o" "|grp_leg|grp_ctrl_bend|group2|curve4.tz";
connectAttr "curve4_visibility.o" "|grp_leg|grp_ctrl_bend|group2|curve4.v";
connectAttr "group2.pim" "group2_pointConstraint1.cpim";
connectAttr "group2.rp" "group2_pointConstraint1.crp";
connectAttr "group2.rpt" "group2_pointConstraint1.crt";
connectAttr "rig_knee.t" "group2_pointConstraint1.tg[0].tt";
connectAttr "rig_knee.rp" "group2_pointConstraint1.tg[0].trp";
connectAttr "rig_knee.rpt" "group2_pointConstraint1.tg[0].trt";
connectAttr "rig_knee.pm" "group2_pointConstraint1.tg[0].tpm";
connectAttr "group2_pointConstraint1.w0" "group2_pointConstraint1.tg[0].tw";
connectAttr "rig_ankle.t" "group2_pointConstraint1.tg[1].tt";
connectAttr "rig_ankle.rp" "group2_pointConstraint1.tg[1].trp";
connectAttr "rig_ankle.rpt" "group2_pointConstraint1.tg[1].trt";
connectAttr "rig_ankle.pm" "group2_pointConstraint1.tg[1].tpm";
connectAttr "group2_pointConstraint1.w1" "group2_pointConstraint1.tg[1].tw";
connectAttr "group2.ro" "group2_orientConstraint1.cro";
connectAttr "group2.pim" "group2_orientConstraint1.cpim";
connectAttr "rig_knee.r" "group2_orientConstraint1.tg[0].tr";
connectAttr "rig_knee.ro" "group2_orientConstraint1.tg[0].tro";
connectAttr "rig_knee.pm" "group2_orientConstraint1.tg[0].tpm";
connectAttr "rig_knee.jo" "group2_orientConstraint1.tg[0].tjo";
connectAttr "group2_orientConstraint1.w0" "group2_orientConstraint1.tg[0].tw";
connectAttr "group3_parentConstraint1.ctx" "group3.tx";
connectAttr "group3_parentConstraint1.cty" "group3.ty";
connectAttr "group3_parentConstraint1.ctz" "group3.tz";
connectAttr "group3_parentConstraint1.crx" "group3.rx";
connectAttr "group3_parentConstraint1.cry" "group3.ry";
connectAttr "group3_parentConstraint1.crz" "group3.rz";
connectAttr "curve4_translateX1.o" "|grp_leg|grp_ctrl_bend|group3|curve4.tx";
connectAttr "curve4_translateY1.o" "|grp_leg|grp_ctrl_bend|group3|curve4.ty";
connectAttr "curve4_translateZ1.o" "|grp_leg|grp_ctrl_bend|group3|curve4.tz";
connectAttr "curve4_visibility1.o" "|grp_leg|grp_ctrl_bend|group3|curve4.v";
connectAttr "group3.ro" "group3_parentConstraint1.cro";
connectAttr "group3.pim" "group3_parentConstraint1.cpim";
connectAttr "group3.rp" "group3_parentConstraint1.crp";
connectAttr "group3.rpt" "group3_parentConstraint1.crt";
connectAttr "rig_hip.t" "group3_parentConstraint1.tg[0].tt";
connectAttr "rig_hip.rp" "group3_parentConstraint1.tg[0].trp";
connectAttr "rig_hip.rpt" "group3_parentConstraint1.tg[0].trt";
connectAttr "rig_hip.r" "group3_parentConstraint1.tg[0].tr";
connectAttr "rig_hip.ro" "group3_parentConstraint1.tg[0].tro";
connectAttr "rig_hip.s" "group3_parentConstraint1.tg[0].ts";
connectAttr "rig_hip.pm" "group3_parentConstraint1.tg[0].tpm";
connectAttr "rig_hip.jo" "group3_parentConstraint1.tg[0].tjo";
connectAttr "group3_parentConstraint1.w0" "group3_parentConstraint1.tg[0].tw";
connectAttr "group1_pointConstraint1.ctx" "group1.tx";
connectAttr "group1_pointConstraint1.cty" "group1.ty";
connectAttr "group1_pointConstraint1.ctz" "group1.tz";
connectAttr "curve3_translateX.o" "curve3.tx";
connectAttr "curve3_translateY.o" "curve3.ty";
connectAttr "curve3_translateZ.o" "curve3.tz";
connectAttr "curve3_visibility.o" "curve3.v";
connectAttr "group1.pim" "group1_pointConstraint1.cpim";
connectAttr "group1.rp" "group1_pointConstraint1.crp";
connectAttr "group1.rpt" "group1_pointConstraint1.crt";
connectAttr "rig_knee.t" "group1_pointConstraint1.tg[0].tt";
connectAttr "rig_knee.rp" "group1_pointConstraint1.tg[0].trp";
connectAttr "rig_knee.rpt" "group1_pointConstraint1.tg[0].trt";
connectAttr "rig_knee.pm" "group1_pointConstraint1.tg[0].tpm";
connectAttr "group1_pointConstraint1.w0" "group1_pointConstraint1.tg[0].tw";
connectAttr "ctrl_root_translateX.o" "ctrl_root.tx";
connectAttr "ctrl_root_translateY.o" "ctrl_root.ty";
connectAttr "ctrl_root_translateZ.o" "ctrl_root.tz";
connectAttr "ctrl_root_rotateX.o" "ctrl_root.rx";
connectAttr "ctrl_root_rotateY.o" "ctrl_root.ry";
connectAttr "ctrl_root_rotateZ.o" "ctrl_root.rz";
connectAttr "mdNode_MStretch_l1_leg1.ox" "ikj_knee.tx";
connectAttr "ikj_hip.s" "ikj_knee.is";
connectAttr "mdNode_EStretchl1_leg1.ox" "ikj_ankle.tx";
connectAttr "ikj_knee.s" "ikj_ankle.is";
connectAttr "ikj_ankle.s" "ikj_heel.is";
connectAttr "ikj_ankle.s" "ikj_ball.is";
connectAttr "ikj_ball.s" "ikj_toe.is";
connectAttr "ikj_toe.tx" "|grp_leg|ctrl_root|ikj_hip|ikj_knee|ikj_ankle|ikj_ball|effector8.tx"
		;
connectAttr "ikj_toe.ty" "|grp_leg|ctrl_root|ikj_hip|ikj_knee|ikj_ankle|ikj_ball|effector8.ty"
		;
connectAttr "ikj_toe.tz" "|grp_leg|ctrl_root|ikj_hip|ikj_knee|ikj_ankle|ikj_ball|effector8.tz"
		;
connectAttr "ikj_ball.tx" "effector7.tx";
connectAttr "ikj_ball.ty" "effector7.ty";
connectAttr "ikj_ball.tz" "effector7.tz";
connectAttr "ikj_ankle.tx" "effector6.tx";
connectAttr "ikj_ankle.ty" "effector6.ty";
connectAttr "ikj_ankle.tz" "effector6.tz";
connectAttr "joint12_parentConstraint1.ctx" "jnt_leg1.tx";
connectAttr "joint12_parentConstraint1.cty" "jnt_leg1.ty";
connectAttr "joint12_parentConstraint1.ctz" "jnt_leg1.tz";
connectAttr "joint12_parentConstraint1.crx" "jnt_leg1.rx";
connectAttr "joint12_parentConstraint1.cry" "jnt_leg1.ry";
connectAttr "joint12_parentConstraint1.crz" "jnt_leg1.rz";
connectAttr "jnt_leg1.s" "jnt_leg2.is";
connectAttr "joint13_parentConstraint1.ctx" "jnt_leg2.tx";
connectAttr "joint13_parentConstraint1.cty" "jnt_leg2.ty";
connectAttr "joint13_parentConstraint1.ctz" "jnt_leg2.tz";
connectAttr "joint13_parentConstraint1.crx" "jnt_leg2.rx";
connectAttr "joint13_parentConstraint1.cry" "jnt_leg2.ry";
connectAttr "joint13_parentConstraint1.crz" "jnt_leg2.rz";
connectAttr "jnt_leg2.s" "jnt_leg3.is";
connectAttr "joint14_parentConstraint1.ctx" "jnt_leg3.tx";
connectAttr "joint14_parentConstraint1.cty" "jnt_leg3.ty";
connectAttr "joint14_parentConstraint1.ctz" "jnt_leg3.tz";
connectAttr "joint14_parentConstraint1.crx" "jnt_leg3.rx";
connectAttr "joint14_parentConstraint1.cry" "jnt_leg3.ry";
connectAttr "joint14_parentConstraint1.crz" "jnt_leg3.rz";
connectAttr "jnt_leg3.s" "jnt_leg4.is";
connectAttr "joint15_parentConstraint1.ctx" "jnt_leg4.tx";
connectAttr "joint15_parentConstraint1.cty" "jnt_leg4.ty";
connectAttr "joint15_parentConstraint1.ctz" "jnt_leg4.tz";
connectAttr "joint15_parentConstraint1.crx" "jnt_leg4.rx";
connectAttr "joint15_parentConstraint1.cry" "jnt_leg4.ry";
connectAttr "joint15_parentConstraint1.crz" "jnt_leg4.rz";
connectAttr "jnt_leg4.s" "jnt_leg5.is";
connectAttr "joint16_parentConstraint1.ctx" "jnt_leg5.tx";
connectAttr "joint16_parentConstraint1.cty" "jnt_leg5.ty";
connectAttr "joint16_parentConstraint1.ctz" "jnt_leg5.tz";
connectAttr "joint16_parentConstraint1.crx" "jnt_leg5.rx";
connectAttr "joint16_parentConstraint1.cry" "jnt_leg5.ry";
connectAttr "joint16_parentConstraint1.crz" "jnt_leg5.rz";
connectAttr "jnt_leg5.s" "jnt_leg6.is";
connectAttr "joint17_parentConstraint1.ctx" "jnt_leg6.tx";
connectAttr "joint17_parentConstraint1.cty" "jnt_leg6.ty";
connectAttr "joint17_parentConstraint1.ctz" "jnt_leg6.tz";
connectAttr "joint17_parentConstraint1.crx" "jnt_leg6.rx";
connectAttr "joint17_parentConstraint1.cry" "jnt_leg6.ry";
connectAttr "joint17_parentConstraint1.crz" "jnt_leg6.rz";
connectAttr "jnt_leg6.s" "jnt_leg7.is";
connectAttr "joint18_parentConstraint1.ctx" "jnt_leg7.tx";
connectAttr "joint18_parentConstraint1.cty" "jnt_leg7.ty";
connectAttr "joint18_parentConstraint1.ctz" "jnt_leg7.tz";
connectAttr "joint18_parentConstraint1.crx" "jnt_leg7.rx";
connectAttr "joint18_parentConstraint1.cry" "jnt_leg7.ry";
connectAttr "joint18_parentConstraint1.crz" "jnt_leg7.rz";
connectAttr "jnt_leg7.s" "jnt_leg8.is";
connectAttr "joint19_parentConstraint1.ctx" "jnt_leg8.tx";
connectAttr "joint19_parentConstraint1.cty" "jnt_leg8.ty";
connectAttr "joint19_parentConstraint1.ctz" "jnt_leg8.tz";
connectAttr "joint19_parentConstraint1.crx" "jnt_leg8.rx";
connectAttr "joint19_parentConstraint1.cry" "jnt_leg8.ry";
connectAttr "joint19_parentConstraint1.crz" "jnt_leg8.rz";
connectAttr "jnt_leg8.s" "jnt_leg9.is";
connectAttr "joint20_parentConstraint1.ctx" "jnt_leg9.tx";
connectAttr "joint20_parentConstraint1.cty" "jnt_leg9.ty";
connectAttr "joint20_parentConstraint1.ctz" "jnt_leg9.tz";
connectAttr "joint20_parentConstraint1.crx" "jnt_leg9.rx";
connectAttr "joint20_parentConstraint1.cry" "jnt_leg9.ry";
connectAttr "joint20_parentConstraint1.crz" "jnt_leg9.rz";
connectAttr "joint22_parentConstraint1.ctx" "jnt_leg10.tx";
connectAttr "joint22_parentConstraint1.cty" "jnt_leg10.ty";
connectAttr "joint22_parentConstraint1.ctz" "jnt_leg10.tz";
connectAttr "joint22_parentConstraint1.crx" "jnt_leg10.rx";
connectAttr "joint22_parentConstraint1.cry" "jnt_leg10.ry";
connectAttr "joint22_parentConstraint1.crz" "jnt_leg10.rz";
connectAttr "jnt_leg10.s" "jnt_leg11.is";
connectAttr "joint23_parentConstraint1.ctx" "jnt_leg11.tx";
connectAttr "joint23_parentConstraint1.cty" "jnt_leg11.ty";
connectAttr "joint23_parentConstraint1.ctz" "jnt_leg11.tz";
connectAttr "joint23_parentConstraint1.crx" "jnt_leg11.rx";
connectAttr "joint23_parentConstraint1.cry" "jnt_leg11.ry";
connectAttr "joint23_parentConstraint1.crz" "jnt_leg11.rz";
connectAttr "jnt_leg11.ro" "joint23_parentConstraint1.cro";
connectAttr "jnt_leg11.pim" "joint23_parentConstraint1.cpim";
connectAttr "jnt_leg11.rp" "joint23_parentConstraint1.crp";
connectAttr "jnt_leg11.rpt" "joint23_parentConstraint1.crt";
connectAttr "jnt_leg11.jo" "joint23_parentConstraint1.cjo";
connectAttr "rig_toe.t" "joint23_parentConstraint1.tg[0].tt";
connectAttr "rig_toe.rp" "joint23_parentConstraint1.tg[0].trp";
connectAttr "rig_toe.rpt" "joint23_parentConstraint1.tg[0].trt";
connectAttr "rig_toe.r" "joint23_parentConstraint1.tg[0].tr";
connectAttr "rig_toe.ro" "joint23_parentConstraint1.tg[0].tro";
connectAttr "rig_toe.s" "joint23_parentConstraint1.tg[0].ts";
connectAttr "rig_toe.pm" "joint23_parentConstraint1.tg[0].tpm";
connectAttr "rig_toe.jo" "joint23_parentConstraint1.tg[0].tjo";
connectAttr "joint23_parentConstraint1.w0" "joint23_parentConstraint1.tg[0].tw";
connectAttr "jnt_leg10.ro" "joint22_parentConstraint1.cro";
connectAttr "jnt_leg10.pim" "joint22_parentConstraint1.cpim";
connectAttr "jnt_leg10.rp" "joint22_parentConstraint1.crp";
connectAttr "jnt_leg10.rpt" "joint22_parentConstraint1.crt";
connectAttr "jnt_leg10.jo" "joint22_parentConstraint1.cjo";
connectAttr "rig_ball.t" "joint22_parentConstraint1.tg[0].tt";
connectAttr "rig_ball.rp" "joint22_parentConstraint1.tg[0].trp";
connectAttr "rig_ball.rpt" "joint22_parentConstraint1.tg[0].trt";
connectAttr "rig_ball.r" "joint22_parentConstraint1.tg[0].tr";
connectAttr "rig_ball.ro" "joint22_parentConstraint1.tg[0].tro";
connectAttr "rig_ball.s" "joint22_parentConstraint1.tg[0].ts";
connectAttr "rig_ball.pm" "joint22_parentConstraint1.tg[0].tpm";
connectAttr "rig_ball.jo" "joint22_parentConstraint1.tg[0].tjo";
connectAttr "joint22_parentConstraint1.w0" "joint22_parentConstraint1.tg[0].tw";
connectAttr "jnt_leg9.ro" "joint20_parentConstraint1.cro";
connectAttr "jnt_leg9.pim" "joint20_parentConstraint1.cpim";
connectAttr "jnt_leg9.rp" "joint20_parentConstraint1.crp";
connectAttr "jnt_leg9.rpt" "joint20_parentConstraint1.crt";
connectAttr "jnt_leg9.jo" "joint20_parentConstraint1.cjo";
connectAttr "rig_ankle.t" "joint20_parentConstraint1.tg[0].tt";
connectAttr "rig_ankle.rp" "joint20_parentConstraint1.tg[0].trp";
connectAttr "rig_ankle.rpt" "joint20_parentConstraint1.tg[0].trt";
connectAttr "rig_ankle.r" "joint20_parentConstraint1.tg[0].tr";
connectAttr "rig_ankle.ro" "joint20_parentConstraint1.tg[0].tro";
connectAttr "rig_ankle.s" "joint20_parentConstraint1.tg[0].ts";
connectAttr "rig_ankle.pm" "joint20_parentConstraint1.tg[0].tpm";
connectAttr "rig_ankle.jo" "joint20_parentConstraint1.tg[0].tjo";
connectAttr "joint20_parentConstraint1.w0" "joint20_parentConstraint1.tg[0].tw";
connectAttr "jnt_leg8.ro" "joint19_parentConstraint1.cro";
connectAttr "jnt_leg8.pim" "joint19_parentConstraint1.cpim";
connectAttr "jnt_leg8.rp" "joint19_parentConstraint1.crp";
connectAttr "jnt_leg8.rpt" "joint19_parentConstraint1.crt";
connectAttr "jnt_leg8.jo" "joint19_parentConstraint1.cjo";
connectAttr "joint11.t" "joint19_parentConstraint1.tg[0].tt";
connectAttr "joint11.rp" "joint19_parentConstraint1.tg[0].trp";
connectAttr "joint11.rpt" "joint19_parentConstraint1.tg[0].trt";
connectAttr "joint11.r" "joint19_parentConstraint1.tg[0].tr";
connectAttr "joint11.ro" "joint19_parentConstraint1.tg[0].tro";
connectAttr "joint11.s" "joint19_parentConstraint1.tg[0].ts";
connectAttr "joint11.pm" "joint19_parentConstraint1.tg[0].tpm";
connectAttr "joint11.jo" "joint19_parentConstraint1.tg[0].tjo";
connectAttr "joint19_parentConstraint1.w0" "joint19_parentConstraint1.tg[0].tw";
connectAttr "jnt_leg7.ro" "joint18_parentConstraint1.cro";
connectAttr "jnt_leg7.pim" "joint18_parentConstraint1.cpim";
connectAttr "jnt_leg7.rp" "joint18_parentConstraint1.crp";
connectAttr "jnt_leg7.rpt" "joint18_parentConstraint1.crt";
connectAttr "jnt_leg7.jo" "joint18_parentConstraint1.cjo";
connectAttr "joint10.t" "joint18_parentConstraint1.tg[0].tt";
connectAttr "joint10.rp" "joint18_parentConstraint1.tg[0].trp";
connectAttr "joint10.rpt" "joint18_parentConstraint1.tg[0].trt";
connectAttr "joint10.r" "joint18_parentConstraint1.tg[0].tr";
connectAttr "joint10.ro" "joint18_parentConstraint1.tg[0].tro";
connectAttr "joint10.s" "joint18_parentConstraint1.tg[0].ts";
connectAttr "joint10.pm" "joint18_parentConstraint1.tg[0].tpm";
connectAttr "joint10.jo" "joint18_parentConstraint1.tg[0].tjo";
connectAttr "joint18_parentConstraint1.w0" "joint18_parentConstraint1.tg[0].tw";
connectAttr "jnt_leg6.ro" "joint17_parentConstraint1.cro";
connectAttr "jnt_leg6.pim" "joint17_parentConstraint1.cpim";
connectAttr "jnt_leg6.rp" "joint17_parentConstraint1.crp";
connectAttr "jnt_leg6.rpt" "joint17_parentConstraint1.crt";
connectAttr "jnt_leg6.jo" "joint17_parentConstraint1.cjo";
connectAttr "joint9.t" "joint17_parentConstraint1.tg[0].tt";
connectAttr "joint9.rp" "joint17_parentConstraint1.tg[0].trp";
connectAttr "joint9.rpt" "joint17_parentConstraint1.tg[0].trt";
connectAttr "joint9.r" "joint17_parentConstraint1.tg[0].tr";
connectAttr "joint9.ro" "joint17_parentConstraint1.tg[0].tro";
connectAttr "joint9.s" "joint17_parentConstraint1.tg[0].ts";
connectAttr "joint9.pm" "joint17_parentConstraint1.tg[0].tpm";
connectAttr "joint9.jo" "joint17_parentConstraint1.tg[0].tjo";
connectAttr "joint17_parentConstraint1.w0" "joint17_parentConstraint1.tg[0].tw";
connectAttr "jnt_leg5.ro" "joint16_parentConstraint1.cro";
connectAttr "jnt_leg5.pim" "joint16_parentConstraint1.cpim";
connectAttr "jnt_leg5.rp" "joint16_parentConstraint1.crp";
connectAttr "jnt_leg5.rpt" "joint16_parentConstraint1.crt";
connectAttr "jnt_leg5.jo" "joint16_parentConstraint1.cjo";
connectAttr "joint8.t" "joint16_parentConstraint1.tg[0].tt";
connectAttr "joint8.rp" "joint16_parentConstraint1.tg[0].trp";
connectAttr "joint8.rpt" "joint16_parentConstraint1.tg[0].trt";
connectAttr "joint8.r" "joint16_parentConstraint1.tg[0].tr";
connectAttr "joint8.ro" "joint16_parentConstraint1.tg[0].tro";
connectAttr "joint8.s" "joint16_parentConstraint1.tg[0].ts";
connectAttr "joint8.pm" "joint16_parentConstraint1.tg[0].tpm";
connectAttr "joint8.jo" "joint16_parentConstraint1.tg[0].tjo";
connectAttr "joint16_parentConstraint1.w0" "joint16_parentConstraint1.tg[0].tw";
connectAttr "jnt_leg4.ro" "joint15_parentConstraint1.cro";
connectAttr "jnt_leg4.pim" "joint15_parentConstraint1.cpim";
connectAttr "jnt_leg4.rp" "joint15_parentConstraint1.crp";
connectAttr "jnt_leg4.rpt" "joint15_parentConstraint1.crt";
connectAttr "jnt_leg4.jo" "joint15_parentConstraint1.cjo";
connectAttr "joint7.t" "joint15_parentConstraint1.tg[0].tt";
connectAttr "joint7.rp" "joint15_parentConstraint1.tg[0].trp";
connectAttr "joint7.rpt" "joint15_parentConstraint1.tg[0].trt";
connectAttr "joint7.r" "joint15_parentConstraint1.tg[0].tr";
connectAttr "joint7.ro" "joint15_parentConstraint1.tg[0].tro";
connectAttr "joint7.s" "joint15_parentConstraint1.tg[0].ts";
connectAttr "joint7.pm" "joint15_parentConstraint1.tg[0].tpm";
connectAttr "joint7.jo" "joint15_parentConstraint1.tg[0].tjo";
connectAttr "joint15_parentConstraint1.w0" "joint15_parentConstraint1.tg[0].tw";
connectAttr "jnt_leg3.ro" "joint14_parentConstraint1.cro";
connectAttr "jnt_leg3.pim" "joint14_parentConstraint1.cpim";
connectAttr "jnt_leg3.rp" "joint14_parentConstraint1.crp";
connectAttr "jnt_leg3.rpt" "joint14_parentConstraint1.crt";
connectAttr "jnt_leg3.jo" "joint14_parentConstraint1.cjo";
connectAttr "joint6.t" "joint14_parentConstraint1.tg[0].tt";
connectAttr "joint6.rp" "joint14_parentConstraint1.tg[0].trp";
connectAttr "joint6.rpt" "joint14_parentConstraint1.tg[0].trt";
connectAttr "joint6.r" "joint14_parentConstraint1.tg[0].tr";
connectAttr "joint6.ro" "joint14_parentConstraint1.tg[0].tro";
connectAttr "joint6.s" "joint14_parentConstraint1.tg[0].ts";
connectAttr "joint6.pm" "joint14_parentConstraint1.tg[0].tpm";
connectAttr "joint6.jo" "joint14_parentConstraint1.tg[0].tjo";
connectAttr "joint14_parentConstraint1.w0" "joint14_parentConstraint1.tg[0].tw";
connectAttr "jnt_leg2.ro" "joint13_parentConstraint1.cro";
connectAttr "jnt_leg2.pim" "joint13_parentConstraint1.cpim";
connectAttr "jnt_leg2.rp" "joint13_parentConstraint1.crp";
connectAttr "jnt_leg2.rpt" "joint13_parentConstraint1.crt";
connectAttr "jnt_leg2.jo" "joint13_parentConstraint1.cjo";
connectAttr "joint5.t" "joint13_parentConstraint1.tg[0].tt";
connectAttr "joint5.rp" "joint13_parentConstraint1.tg[0].trp";
connectAttr "joint5.rpt" "joint13_parentConstraint1.tg[0].trt";
connectAttr "joint5.r" "joint13_parentConstraint1.tg[0].tr";
connectAttr "joint5.ro" "joint13_parentConstraint1.tg[0].tro";
connectAttr "joint5.s" "joint13_parentConstraint1.tg[0].ts";
connectAttr "joint5.pm" "joint13_parentConstraint1.tg[0].tpm";
connectAttr "joint5.jo" "joint13_parentConstraint1.tg[0].tjo";
connectAttr "joint13_parentConstraint1.w0" "joint13_parentConstraint1.tg[0].tw";
connectAttr "jnt_leg1.ro" "joint12_parentConstraint1.cro";
connectAttr "jnt_leg1.pim" "joint12_parentConstraint1.cpim";
connectAttr "jnt_leg1.rp" "joint12_parentConstraint1.crp";
connectAttr "jnt_leg1.rpt" "joint12_parentConstraint1.crt";
connectAttr "jnt_leg1.jo" "joint12_parentConstraint1.cjo";
connectAttr "joint1.t" "joint12_parentConstraint1.tg[0].tt";
connectAttr "joint1.rp" "joint12_parentConstraint1.tg[0].trp";
connectAttr "joint1.rpt" "joint12_parentConstraint1.tg[0].trt";
connectAttr "joint1.r" "joint12_parentConstraint1.tg[0].tr";
connectAttr "joint1.ro" "joint12_parentConstraint1.tg[0].tro";
connectAttr "joint1.s" "joint12_parentConstraint1.tg[0].ts";
connectAttr "joint1.pm" "joint12_parentConstraint1.tg[0].tpm";
connectAttr "joint1.jo" "joint12_parentConstraint1.tg[0].tjo";
connectAttr "joint12_parentConstraint1.w0" "joint12_parentConstraint1.tg[0].tw";
connectAttr "layer1.di" "leg_geo.do";
connectAttr "skinCluster1.og[0]" "leg_geoShape.i";
connectAttr "groupId14.id" "leg_geoShape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "leg_geoShape.iog.og[0].gco";
connectAttr "skinCluster1GroupId.id" "leg_geoShape.iog.og[7].gid";
connectAttr "skinCluster1Set.mwc" "leg_geoShape.iog.og[7].gco";
connectAttr "groupId16.id" "leg_geoShape.iog.og[8].gid";
connectAttr "tweakSet3.mwc" "leg_geoShape.iog.og[8].gco";
connectAttr "tweak3.vl[0].vt[0]" "leg_geoShape.twl";
connectAttr "grp_ctrl_l1_leg_parentConstraint1.ctx" "grp_ctrl_l1_leg.tx";
connectAttr "grp_ctrl_l1_leg_parentConstraint1.cty" "grp_ctrl_l1_leg.ty";
connectAttr "grp_ctrl_l1_leg_parentConstraint1.ctz" "grp_ctrl_l1_leg.tz";
connectAttr "grp_ctrl_l1_leg_parentConstraint1.crx" "grp_ctrl_l1_leg.rx";
connectAttr "grp_ctrl_l1_leg_parentConstraint1.cry" "grp_ctrl_l1_leg.ry";
connectAttr "grp_ctrl_l1_leg_parentConstraint1.crz" "grp_ctrl_l1_leg.rz";
connectAttr "ctrl_l1_leg_Bend_Vis.o" "ctrl_l1_leg.Bend_Vis";
connectAttr "ctrl_l1_leg_Follow.o" "ctrl_l1_leg.Follow";
connectAttr "ctrl_l1_leg_pivot_posX.o" "ctrl_l1_leg.pivot_posX";
connectAttr "ctrl_l1_leg_pivot_posZ.o" "ctrl_l1_leg.pivot_posZ";
connectAttr "ctrl_l1_leg_stretch.o" "ctrl_l1_leg.stretch";
connectAttr "ctrl_l1_leg_twist.o" "ctrl_l1_leg.twist";
connectAttr "ctrl_l1_leg_rotateY.o" "ctrl_l1_leg.ry";
connectAttr "ctrl_l1_leg_rotateX.o" "ctrl_l1_leg.rx";
connectAttr "ctrl_l1_leg_rotateZ.o" "ctrl_l1_leg.rz";
connectAttr "ctrl_l1_leg_foot_roll.o" "ctrl_l1_leg.foot_roll";
connectAttr "ctrl_l1_leg_roll_break.o" "ctrl_l1_leg.roll_break";
connectAttr "ctrl_l1_leg_toe_flap.o" "ctrl_l1_leg.toe_flap";
connectAttr "ctrl_l1_leg_foot_twist.o" "ctrl_l1_leg.foot_twist";
connectAttr "ctrl_l1_leg_foot_bank.o" "ctrl_l1_leg.foot_bank";
connectAttr "ctrl_l1_leg_translateX.o" "ctrl_l1_leg.tx";
connectAttr "ctrl_l1_leg_translateY.o" "ctrl_l1_leg.ty";
connectAttr "ctrl_l1_leg_translateZ.o" "ctrl_l1_leg.tz";
connectAttr "ctrl_l1_leg_visibility.o" "ctrl_l1_leg.v";
connectAttr "unitConversion8.o" "grp_footPivot_l1_leg.ry";
connectAttr "unitConversion9.o" "grp_footPivot_l1_leg.rz";
connectAttr "plusMinusAverage1.o3" "grp_footPivot_l1_leg.rp";
connectAttr "unitConversion4.o" "grp_heel_l1_leg.rx";
connectAttr "unitConversion3.o" "grp_toe_l1_leg.rx";
connectAttr "unitConversion6.o" "grp_ball_l1_leg.rx";
connectAttr "ikj_ankle.msg" "ikh_ball_l1_leg.hsj";
connectAttr "effector7.hp" "ikh_ball_l1_leg.hee";
connectAttr "ikSCsolver.msg" "ikh_ball_l1_leg.hsv";
connectAttr "ikj_hip.msg" "ikHandle_l1_leg.hsj";
connectAttr "effector6.hp" "ikHandle_l1_leg.hee";
connectAttr "ikRPsolver.msg" "ikHandle_l1_leg.hsv";
connectAttr "ikHandle_l1_leg_poleVectorConstraint1.ctx" "ikHandle_l1_leg.pvx";
connectAttr "ikHandle_l1_leg_poleVectorConstraint1.cty" "ikHandle_l1_leg.pvy";
connectAttr "ikHandle_l1_leg_poleVectorConstraint1.ctz" "ikHandle_l1_leg.pvz";
connectAttr "unitConversion2.o" "ikHandle_l1_leg.twi";
connectAttr "ikHandle_l1_leg.pim" "ikHandle_l1_leg_poleVectorConstraint1.cpim";
connectAttr "ikj_hip.pm" "ikHandle_l1_leg_poleVectorConstraint1.ps";
connectAttr "ikj_hip.t" "ikHandle_l1_leg_poleVectorConstraint1.crp";
connectAttr "pv_l1_leg.t" "ikHandle_l1_leg_poleVectorConstraint1.tg[0].tt";
connectAttr "pv_l1_leg.rp" "ikHandle_l1_leg_poleVectorConstraint1.tg[0].trp";
connectAttr "pv_l1_leg.rpt" "ikHandle_l1_leg_poleVectorConstraint1.tg[0].trt";
connectAttr "pv_l1_leg.pm" "ikHandle_l1_leg_poleVectorConstraint1.tg[0].tpm";
connectAttr "ikHandle_l1_leg_poleVectorConstraint1.w0" "ikHandle_l1_leg_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "unitConversion7.o" "grp_flap_l1_leg.rx";
connectAttr "ikj_ball.msg" "ikh_toe_l1_leg.hsj";
connectAttr "|grp_leg|ctrl_root|ikj_hip|ikj_knee|ikj_ankle|ikj_ball|effector8.hp" "ikh_toe_l1_leg.hee"
		;
connectAttr "ikSCsolver.msg" "ikh_toe_l1_leg.hsv";
connectAttr "ctrl_l1_leg.pivot_posX" "lctrTwist_l1_leg.tx";
connectAttr "ctrl_l1_leg.pivot_posZ" "lctrTwist_l1_leg.tz";
connectAttr "grp_ctrl_l1_leg.ro" "grp_ctrl_l1_leg_parentConstraint1.cro";
connectAttr "grp_ctrl_l1_leg.pim" "grp_ctrl_l1_leg_parentConstraint1.cpim";
connectAttr "grp_ctrl_l1_leg.rp" "grp_ctrl_l1_leg_parentConstraint1.crp";
connectAttr "grp_ctrl_l1_leg.rpt" "grp_ctrl_l1_leg_parentConstraint1.crt";
connectAttr "ctrl_root.t" "grp_ctrl_l1_leg_parentConstraint1.tg[0].tt";
connectAttr "ctrl_root.rp" "grp_ctrl_l1_leg_parentConstraint1.tg[0].trp";
connectAttr "ctrl_root.rpt" "grp_ctrl_l1_leg_parentConstraint1.tg[0].trt";
connectAttr "ctrl_root.r" "grp_ctrl_l1_leg_parentConstraint1.tg[0].tr";
connectAttr "ctrl_root.ro" "grp_ctrl_l1_leg_parentConstraint1.tg[0].tro";
connectAttr "ctrl_root.s" "grp_ctrl_l1_leg_parentConstraint1.tg[0].ts";
connectAttr "ctrl_root.pm" "grp_ctrl_l1_leg_parentConstraint1.tg[0].tpm";
connectAttr "grp_ctrl_l1_leg_parentConstraint1.w0" "grp_ctrl_l1_leg_parentConstraint1.tg[0].tw"
		;
connectAttr "ctrl_l1_leg.Follow" "grp_ctrl_l1_leg_parentConstraint1.w0";
connectAttr "lctrDis_Root_l1_legShape.wp" "disDimNode_Stretchl1_legShape.sp";
connectAttr "lctrDis_End_l1_legShape.wp" "disDimNode_Stretchl1_legShape.ep";
connectAttr "rig_hip_parentConstraint1.ctx" "rig_hip.tx";
connectAttr "rig_hip_parentConstraint1.cty" "rig_hip.ty";
connectAttr "rig_hip_parentConstraint1.ctz" "rig_hip.tz";
connectAttr "rig_hip_parentConstraint1.crx" "rig_hip.rx";
connectAttr "rig_hip_parentConstraint1.cry" "rig_hip.ry";
connectAttr "rig_hip_parentConstraint1.crz" "rig_hip.rz";
connectAttr "rig_knee_parentConstraint1.ctx" "rig_knee.tx";
connectAttr "rig_knee_parentConstraint1.cty" "rig_knee.ty";
connectAttr "rig_knee_parentConstraint1.ctz" "rig_knee.tz";
connectAttr "rig_knee_parentConstraint1.crx" "rig_knee.rx";
connectAttr "rig_knee_parentConstraint1.cry" "rig_knee.ry";
connectAttr "rig_knee_parentConstraint1.crz" "rig_knee.rz";
connectAttr "rig_ankle_parentConstraint1.ctx" "rig_ankle.tx";
connectAttr "rig_ankle_parentConstraint1.cty" "rig_ankle.ty";
connectAttr "rig_ankle_parentConstraint1.ctz" "rig_ankle.tz";
connectAttr "rig_ankle_parentConstraint1.crx" "rig_ankle.rx";
connectAttr "rig_ankle_parentConstraint1.cry" "rig_ankle.ry";
connectAttr "rig_ankle_parentConstraint1.crz" "rig_ankle.rz";
connectAttr "rig_ball_parentConstraint1.ctx" "rig_ball.tx";
connectAttr "rig_ball_parentConstraint1.cty" "rig_ball.ty";
connectAttr "rig_ball_parentConstraint1.ctz" "rig_ball.tz";
connectAttr "rig_ball_parentConstraint1.crx" "rig_ball.rx";
connectAttr "rig_ball_parentConstraint1.cry" "rig_ball.ry";
connectAttr "rig_ball_parentConstraint1.crz" "rig_ball.rz";
connectAttr "rig_toe_parentConstraint1.ctx" "rig_toe.tx";
connectAttr "rig_toe_parentConstraint1.cty" "rig_toe.ty";
connectAttr "rig_toe_parentConstraint1.ctz" "rig_toe.tz";
connectAttr "rig_toe_parentConstraint1.crx" "rig_toe.rx";
connectAttr "rig_toe_parentConstraint1.cry" "rig_toe.ry";
connectAttr "rig_toe_parentConstraint1.crz" "rig_toe.rz";
connectAttr "rig_ball.s" "rig_toe.is";
connectAttr "rig_toe.ro" "rig_toe_parentConstraint1.cro";
connectAttr "rig_toe.pim" "rig_toe_parentConstraint1.cpim";
connectAttr "rig_toe.rp" "rig_toe_parentConstraint1.crp";
connectAttr "rig_toe.rpt" "rig_toe_parentConstraint1.crt";
connectAttr "rig_toe.jo" "rig_toe_parentConstraint1.cjo";
connectAttr "ikj_toe.t" "rig_toe_parentConstraint1.tg[0].tt";
connectAttr "ikj_toe.rp" "rig_toe_parentConstraint1.tg[0].trp";
connectAttr "ikj_toe.rpt" "rig_toe_parentConstraint1.tg[0].trt";
connectAttr "ikj_toe.r" "rig_toe_parentConstraint1.tg[0].tr";
connectAttr "ikj_toe.ro" "rig_toe_parentConstraint1.tg[0].tro";
connectAttr "ikj_toe.s" "rig_toe_parentConstraint1.tg[0].ts";
connectAttr "ikj_toe.pm" "rig_toe_parentConstraint1.tg[0].tpm";
connectAttr "ikj_toe.jo" "rig_toe_parentConstraint1.tg[0].tjo";
connectAttr "rig_toe_parentConstraint1.w0" "rig_toe_parentConstraint1.tg[0].tw";
connectAttr "rig_ball.ro" "rig_ball_parentConstraint1.cro";
connectAttr "rig_ball.pim" "rig_ball_parentConstraint1.cpim";
connectAttr "rig_ball.rp" "rig_ball_parentConstraint1.crp";
connectAttr "rig_ball.rpt" "rig_ball_parentConstraint1.crt";
connectAttr "rig_ball.jo" "rig_ball_parentConstraint1.cjo";
connectAttr "ikj_ball.t" "rig_ball_parentConstraint1.tg[0].tt";
connectAttr "ikj_ball.rp" "rig_ball_parentConstraint1.tg[0].trp";
connectAttr "ikj_ball.rpt" "rig_ball_parentConstraint1.tg[0].trt";
connectAttr "ikj_ball.r" "rig_ball_parentConstraint1.tg[0].tr";
connectAttr "ikj_ball.ro" "rig_ball_parentConstraint1.tg[0].tro";
connectAttr "ikj_ball.s" "rig_ball_parentConstraint1.tg[0].ts";
connectAttr "ikj_ball.pm" "rig_ball_parentConstraint1.tg[0].tpm";
connectAttr "ikj_ball.jo" "rig_ball_parentConstraint1.tg[0].tjo";
connectAttr "rig_ball_parentConstraint1.w0" "rig_ball_parentConstraint1.tg[0].tw"
		;
connectAttr "rig_ankle.ro" "rig_ankle_parentConstraint1.cro";
connectAttr "rig_ankle.pim" "rig_ankle_parentConstraint1.cpim";
connectAttr "rig_ankle.rp" "rig_ankle_parentConstraint1.crp";
connectAttr "rig_ankle.rpt" "rig_ankle_parentConstraint1.crt";
connectAttr "rig_ankle.jo" "rig_ankle_parentConstraint1.cjo";
connectAttr "ikj_ankle.t" "rig_ankle_parentConstraint1.tg[0].tt";
connectAttr "ikj_ankle.rp" "rig_ankle_parentConstraint1.tg[0].trp";
connectAttr "ikj_ankle.rpt" "rig_ankle_parentConstraint1.tg[0].trt";
connectAttr "ikj_ankle.r" "rig_ankle_parentConstraint1.tg[0].tr";
connectAttr "ikj_ankle.ro" "rig_ankle_parentConstraint1.tg[0].tro";
connectAttr "ikj_ankle.s" "rig_ankle_parentConstraint1.tg[0].ts";
connectAttr "ikj_ankle.pm" "rig_ankle_parentConstraint1.tg[0].tpm";
connectAttr "ikj_ankle.jo" "rig_ankle_parentConstraint1.tg[0].tjo";
connectAttr "rig_ankle_parentConstraint1.w0" "rig_ankle_parentConstraint1.tg[0].tw"
		;
connectAttr "joint8.msg" "ikHandle2.hsj";
connectAttr "effector10.hp" "ikHandle2.hee";
connectAttr "ikSplineSolver.msg" "ikHandle2.hsv";
connectAttr "curveShape2.ws" "ikHandle2.ic";
connectAttr "cluster6Handle_aimConstraint1.crx" "cluster6Handle.rx";
connectAttr "cluster6Handle_aimConstraint1.cry" "cluster6Handle.ry";
connectAttr "cluster6Handle_aimConstraint1.crz" "cluster6Handle.rz";
connectAttr "cluster6Handle.pim" "cluster6Handle_aimConstraint1.cpim";
connectAttr "cluster6Handle.t" "cluster6Handle_aimConstraint1.ct";
connectAttr "cluster6Handle.rp" "cluster6Handle_aimConstraint1.crp";
connectAttr "cluster6Handle.rpt" "cluster6Handle_aimConstraint1.crt";
connectAttr "cluster6Handle.ro" "cluster6Handle_aimConstraint1.cro";
connectAttr "cluster5Handle.t" "cluster6Handle_aimConstraint1.tg[0].tt";
connectAttr "cluster5Handle.rp" "cluster6Handle_aimConstraint1.tg[0].trp";
connectAttr "cluster5Handle.rpt" "cluster6Handle_aimConstraint1.tg[0].trt";
connectAttr "cluster5Handle.pm" "cluster6Handle_aimConstraint1.tg[0].tpm";
connectAttr "cluster6Handle_aimConstraint1.w0" "cluster6Handle_aimConstraint1.tg[0].tw"
		;
connectAttr "rig_knee.ro" "rig_knee_parentConstraint1.cro";
connectAttr "rig_knee.pim" "rig_knee_parentConstraint1.cpim";
connectAttr "rig_knee.rp" "rig_knee_parentConstraint1.crp";
connectAttr "rig_knee.rpt" "rig_knee_parentConstraint1.crt";
connectAttr "rig_knee.jo" "rig_knee_parentConstraint1.cjo";
connectAttr "ikj_knee.t" "rig_knee_parentConstraint1.tg[0].tt";
connectAttr "ikj_knee.rp" "rig_knee_parentConstraint1.tg[0].trp";
connectAttr "ikj_knee.rpt" "rig_knee_parentConstraint1.tg[0].trt";
connectAttr "ikj_knee.r" "rig_knee_parentConstraint1.tg[0].tr";
connectAttr "ikj_knee.ro" "rig_knee_parentConstraint1.tg[0].tro";
connectAttr "ikj_knee.s" "rig_knee_parentConstraint1.tg[0].ts";
connectAttr "ikj_knee.pm" "rig_knee_parentConstraint1.tg[0].tpm";
connectAttr "ikj_knee.jo" "rig_knee_parentConstraint1.tg[0].tjo";
connectAttr "rig_knee_parentConstraint1.w0" "rig_knee_parentConstraint1.tg[0].tw"
		;
connectAttr "cluster4Handle_aimConstraint1.crx" "cluster4Handle.rx";
connectAttr "cluster4Handle_aimConstraint1.cry" "cluster4Handle.ry";
connectAttr "cluster4Handle_aimConstraint1.crz" "cluster4Handle.rz";
connectAttr "cluster4Handle_pointConstraint1.ctx" "cluster4Handle.tx";
connectAttr "cluster4Handle_pointConstraint1.cty" "cluster4Handle.ty";
connectAttr "cluster4Handle_pointConstraint1.ctz" "cluster4Handle.tz";
connectAttr "cluster4Handle.pim" "cluster4Handle_aimConstraint1.cpim";
connectAttr "cluster4Handle.t" "cluster4Handle_aimConstraint1.ct";
connectAttr "cluster4Handle.rp" "cluster4Handle_aimConstraint1.crp";
connectAttr "cluster4Handle.rpt" "cluster4Handle_aimConstraint1.crt";
connectAttr "cluster4Handle.ro" "cluster4Handle_aimConstraint1.cro";
connectAttr "cluster5Handle.t" "cluster4Handle_aimConstraint1.tg[0].tt";
connectAttr "cluster5Handle.rp" "cluster4Handle_aimConstraint1.tg[0].trp";
connectAttr "cluster5Handle.rpt" "cluster4Handle_aimConstraint1.tg[0].trt";
connectAttr "cluster5Handle.pm" "cluster4Handle_aimConstraint1.tg[0].tpm";
connectAttr "cluster4Handle_aimConstraint1.w0" "cluster4Handle_aimConstraint1.tg[0].tw"
		;
connectAttr "cluster4Handle.pim" "cluster4Handle_pointConstraint1.cpim";
connectAttr "cluster4Handle.rp" "cluster4Handle_pointConstraint1.crp";
connectAttr "cluster4Handle.rpt" "cluster4Handle_pointConstraint1.crt";
connectAttr "curve3.t" "cluster4Handle_pointConstraint1.tg[0].tt";
connectAttr "curve3.rp" "cluster4Handle_pointConstraint1.tg[0].trp";
connectAttr "curve3.rpt" "cluster4Handle_pointConstraint1.tg[0].trt";
connectAttr "curve3.pm" "cluster4Handle_pointConstraint1.tg[0].tpm";
connectAttr "cluster4Handle_pointConstraint1.w0" "cluster4Handle_pointConstraint1.tg[0].tw"
		;
connectAttr "cluster5Handle_parentConstraint1.ctx" "cluster5Handle.tx";
connectAttr "cluster5Handle_parentConstraint1.cty" "cluster5Handle.ty";
connectAttr "cluster5Handle_parentConstraint1.ctz" "cluster5Handle.tz";
connectAttr "cluster5Handle_parentConstraint1.crx" "cluster5Handle.rx";
connectAttr "cluster5Handle_parentConstraint1.cry" "cluster5Handle.ry";
connectAttr "cluster5Handle_parentConstraint1.crz" "cluster5Handle.rz";
connectAttr "cluster5Handle.ro" "cluster5Handle_parentConstraint1.cro";
connectAttr "cluster5Handle.pim" "cluster5Handle_parentConstraint1.cpim";
connectAttr "cluster5Handle.rp" "cluster5Handle_parentConstraint1.crp";
connectAttr "cluster5Handle.rpt" "cluster5Handle_parentConstraint1.crt";
connectAttr "|grp_leg|grp_ctrl_bend|group2|curve4.t" "cluster5Handle_parentConstraint1.tg[0].tt"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group2|curve4.rp" "cluster5Handle_parentConstraint1.tg[0].trp"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group2|curve4.rpt" "cluster5Handle_parentConstraint1.tg[0].trt"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group2|curve4.r" "cluster5Handle_parentConstraint1.tg[0].tr"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group2|curve4.ro" "cluster5Handle_parentConstraint1.tg[0].tro"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group2|curve4.s" "cluster5Handle_parentConstraint1.tg[0].ts"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group2|curve4.pm" "cluster5Handle_parentConstraint1.tg[0].tpm"
		;
connectAttr "cluster5Handle_parentConstraint1.w0" "cluster5Handle_parentConstraint1.tg[0].tw"
		;
connectAttr "joint1.msg" "ikHandle1.hsj";
connectAttr "effector9.hp" "ikHandle1.hee";
connectAttr "ikSplineSolver.msg" "ikHandle1.hsv";
connectAttr "curveShape1.ws" "ikHandle1.ic";
connectAttr "rig_hip.ro" "rig_hip_parentConstraint1.cro";
connectAttr "rig_hip.pim" "rig_hip_parentConstraint1.cpim";
connectAttr "rig_hip.rp" "rig_hip_parentConstraint1.crp";
connectAttr "rig_hip.rpt" "rig_hip_parentConstraint1.crt";
connectAttr "rig_hip.jo" "rig_hip_parentConstraint1.cjo";
connectAttr "ikj_hip.t" "rig_hip_parentConstraint1.tg[0].tt";
connectAttr "ikj_hip.rp" "rig_hip_parentConstraint1.tg[0].trp";
connectAttr "ikj_hip.rpt" "rig_hip_parentConstraint1.tg[0].trt";
connectAttr "ikj_hip.r" "rig_hip_parentConstraint1.tg[0].tr";
connectAttr "ikj_hip.ro" "rig_hip_parentConstraint1.tg[0].tro";
connectAttr "ikj_hip.s" "rig_hip_parentConstraint1.tg[0].ts";
connectAttr "ikj_hip.pm" "rig_hip_parentConstraint1.tg[0].tpm";
connectAttr "ikj_hip.jo" "rig_hip_parentConstraint1.tg[0].tjo";
connectAttr "rig_hip_parentConstraint1.w0" "rig_hip_parentConstraint1.tg[0].tw";
connectAttr "cluster1Handle_aimConstraint1.crx" "cluster1Handle.rx";
connectAttr "cluster1Handle_aimConstraint1.cry" "cluster1Handle.ry";
connectAttr "cluster1Handle_aimConstraint1.crz" "cluster1Handle.rz";
connectAttr "cluster1Handle.pim" "cluster1Handle_aimConstraint1.cpim";
connectAttr "cluster1Handle.t" "cluster1Handle_aimConstraint1.ct";
connectAttr "cluster1Handle.rp" "cluster1Handle_aimConstraint1.crp";
connectAttr "cluster1Handle.rpt" "cluster1Handle_aimConstraint1.crt";
connectAttr "cluster1Handle.ro" "cluster1Handle_aimConstraint1.cro";
connectAttr "cluster2Handle.t" "cluster1Handle_aimConstraint1.tg[0].tt";
connectAttr "cluster2Handle.rp" "cluster1Handle_aimConstraint1.tg[0].trp";
connectAttr "cluster2Handle.rpt" "cluster1Handle_aimConstraint1.tg[0].trt";
connectAttr "cluster2Handle.pm" "cluster1Handle_aimConstraint1.tg[0].tpm";
connectAttr "cluster1Handle_aimConstraint1.w0" "cluster1Handle_aimConstraint1.tg[0].tw"
		;
connectAttr "cluster2Handle_parentConstraint1.ctx" "cluster2Handle.tx";
connectAttr "cluster2Handle_parentConstraint1.cty" "cluster2Handle.ty";
connectAttr "cluster2Handle_parentConstraint1.ctz" "cluster2Handle.tz";
connectAttr "cluster2Handle_parentConstraint1.crx" "cluster2Handle.rx";
connectAttr "cluster2Handle_parentConstraint1.cry" "cluster2Handle.ry";
connectAttr "cluster2Handle_parentConstraint1.crz" "cluster2Handle.rz";
connectAttr "cluster2Handle.ro" "cluster2Handle_parentConstraint1.cro";
connectAttr "cluster2Handle.pim" "cluster2Handle_parentConstraint1.cpim";
connectAttr "cluster2Handle.rp" "cluster2Handle_parentConstraint1.crp";
connectAttr "cluster2Handle.rpt" "cluster2Handle_parentConstraint1.crt";
connectAttr "|grp_leg|grp_ctrl_bend|group3|curve4.t" "cluster2Handle_parentConstraint1.tg[0].tt"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group3|curve4.rp" "cluster2Handle_parentConstraint1.tg[0].trp"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group3|curve4.rpt" "cluster2Handle_parentConstraint1.tg[0].trt"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group3|curve4.r" "cluster2Handle_parentConstraint1.tg[0].tr"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group3|curve4.ro" "cluster2Handle_parentConstraint1.tg[0].tro"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group3|curve4.s" "cluster2Handle_parentConstraint1.tg[0].ts"
		;
connectAttr "|grp_leg|grp_ctrl_bend|group3|curve4.pm" "cluster2Handle_parentConstraint1.tg[0].tpm"
		;
connectAttr "cluster2Handle_parentConstraint1.w0" "cluster2Handle_parentConstraint1.tg[0].tw"
		;
connectAttr "cluster3Handle_aimConstraint1.crx" "cluster3Handle.rx";
connectAttr "cluster3Handle_aimConstraint1.cry" "cluster3Handle.ry";
connectAttr "cluster3Handle_aimConstraint1.crz" "cluster3Handle.rz";
connectAttr "cluster3Handle_pointConstraint1.ctx" "cluster3Handle.tx";
connectAttr "cluster3Handle_pointConstraint1.cty" "cluster3Handle.ty";
connectAttr "cluster3Handle_pointConstraint1.ctz" "cluster3Handle.tz";
connectAttr "cluster3Handle.pim" "cluster3Handle_aimConstraint1.cpim";
connectAttr "cluster3Handle.t" "cluster3Handle_aimConstraint1.ct";
connectAttr "cluster3Handle.rp" "cluster3Handle_aimConstraint1.crp";
connectAttr "cluster3Handle.rpt" "cluster3Handle_aimConstraint1.crt";
connectAttr "cluster3Handle.ro" "cluster3Handle_aimConstraint1.cro";
connectAttr "cluster2Handle.t" "cluster3Handle_aimConstraint1.tg[0].tt";
connectAttr "cluster2Handle.rp" "cluster3Handle_aimConstraint1.tg[0].trp";
connectAttr "cluster2Handle.rpt" "cluster3Handle_aimConstraint1.tg[0].trt";
connectAttr "cluster2Handle.pm" "cluster3Handle_aimConstraint1.tg[0].tpm";
connectAttr "cluster3Handle_aimConstraint1.w0" "cluster3Handle_aimConstraint1.tg[0].tw"
		;
connectAttr "cluster3Handle.pim" "cluster3Handle_pointConstraint1.cpim";
connectAttr "cluster3Handle.rp" "cluster3Handle_pointConstraint1.crp";
connectAttr "cluster3Handle.rpt" "cluster3Handle_pointConstraint1.crt";
connectAttr "curve3.t" "cluster3Handle_pointConstraint1.tg[0].tt";
connectAttr "curve3.rp" "cluster3Handle_pointConstraint1.tg[0].trp";
connectAttr "curve3.rpt" "cluster3Handle_pointConstraint1.tg[0].trt";
connectAttr "curve3.pm" "cluster3Handle_pointConstraint1.tg[0].tpm";
connectAttr "cluster3Handle_pointConstraint1.w0" "cluster3Handle_pointConstraint1.tg[0].tw"
		;
connectAttr "nurbsSphere1_translateX.o" "nurbsSphere1.tx";
connectAttr "nurbsSphere1_translateY.o" "nurbsSphere1.ty";
connectAttr "nurbsSphere1_translateZ.o" "nurbsSphere1.tz";
connectAttr "nurbsSphere1_visibility.o" "nurbsSphere1.v";
connectAttr "nurbsSphere1_rotateX.o" "nurbsSphere1.rx";
connectAttr "nurbsSphere1_rotateY.o" "nurbsSphere1.ry";
connectAttr "nurbsSphere1_rotateZ.o" "nurbsSphere1.rz";
connectAttr "nurbsSphere1_scaleX.o" "nurbsSphere1.sx";
connectAttr "nurbsSphere1_scaleY.o" "nurbsSphere1.sy";
connectAttr "nurbsSphere1_scaleZ.o" "nurbsSphere1.sz";
connectAttr "makeNurbSphere1.os" "nurbsSphereShape1.cr";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shd_lytBSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shd_lytBSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "shd_lytA.oc" "lambert2SG.ss";
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "shd_lytA.msg" "materialInfo1.m";
connectAttr "shd_lytB.oc" "shd_lytBSG.ss";
connectAttr "shd_lytBSG.msg" "materialInfo2.sg";
connectAttr "shd_lytB.msg" "materialInfo2.m";
connectAttr "clampNode_Stretch.opr" "mdNode_RStretch_l1_leg.i1x";
connectAttr "mdNode_RStretch_l1_leg.ox" "mdNode_MStretch_l1_leg.i1x";
connectAttr "mdNode_RStretch_l1_leg.ox" "mdNode_EStretchl1_leg.i1x";
connectAttr "mdNode_twist_l1_leg.i1x" "pmaNode_twist_l1_leg.i1[0]";
connectAttr "mdNode_twist_l1_leg.i1y" "pmaNode_twist_l1_leg.i1[1]";
connectAttr "ctrl_l1_leg.stretch" "adlNode_RStretch_l1_leg.i1";
connectAttr "adlNode_RStretch_l1_leg.o" "clampNode_Stretch1.mxr";
connectAttr "disDimNode_Stretchl1_legShape.dist" "clampNode_Stretch1.ipr";
connectAttr "clampNode_Stretch1.opr" "mdNode_RStretch_l1_leg1.i1x";
connectAttr "mdNode_RStretch_l1_leg1.ox" "mdNode_MStretch_l1_leg1.i1x";
connectAttr "mdNode_RStretch_l1_leg1.ox" "mdNode_EStretchl1_leg1.i1x";
connectAttr "mdNode_twist_l1_leg1.i1x" "pmaNode_twist_l1_leg1.i1[0]";
connectAttr "mdNode_twist_l1_leg1.i1y" "pmaNode_twist_l1_leg1.i1[1]";
connectAttr "ctrl_l1_leg.twist_offset" "pmaNode_twist_l1_leg1.i1[2]";
connectAttr "ctrl_l1_leg.twist" "mdNode_twist_l1_leg1.i1x";
connectAttr "unitConversion1.o" "mdNode_twist_l1_leg1.i1y";
connectAttr "unitConversion10.o" "mdNode_twist_l1_leg1.i1z";
connectAttr "ctrl_l1_leg.ry" "unitConversion1.i";
connectAttr "pmaNode_twist_l1_leg1.o1" "unitConversion2.i";
connectAttr "ctrl_l1_leg.foot_roll" "conNode_ballRoll_l1_leg.ft";
connectAttr "ctrl_l1_leg.foot_roll" "conNode_ballRoll_l1_leg.ctr";
connectAttr "ctrl_l1_leg.roll_break" "conNode_negBallRoll_l1_leg.st";
connectAttr "ctrl_l1_leg.roll_break" "conNode_negBallRoll_l1_leg.ctr";
connectAttr "conNode_ballRoll_l1_leg.ocr" "conNode_negBallRoll_l1_leg.ft";
connectAttr "conNode_ballRoll_l1_leg.ocr" "conNode_negBallRoll_l1_leg.cfr";
connectAttr "ctrl_l1_leg.foot_roll" "conNode_toeRoll.ft";
connectAttr "ctrl_l1_leg.foot_roll" "conNode_toeRoll.ctr";
connectAttr "ctrl_l1_leg.roll_break" "conNode_toeRoll.st";
connectAttr "ctrl_l1_leg.roll_break" "conNode_toeRoll.cfr";
connectAttr "conNode_negBallRoll_l1_leg.ocr" "pmaNode_ballRoll_l1_leg.i1[0]";
connectAttr "unitConversion5.o" "pmaNode_ballRoll_l1_leg.i1[1]";
connectAttr "conNode_toeRoll.ocr" "pmaNode_toeRoll_l1_leg.i1[0]";
connectAttr "ctrl_l1_leg.roll_break" "pmaNode_toeRoll_l1_leg.i1[1]";
connectAttr "ctrl_l1_leg.foot_roll" "conNode_heelRoll_l1_leg.ft";
connectAttr "ctrl_l1_leg.foot_roll" "conNode_heelRoll_l1_leg.ctr";
connectAttr "pmaNode_toeRoll_l1_leg.o1" "unitConversion3.i";
connectAttr "conNode_heelRoll_l1_leg.ocr" "unitConversion4.i";
connectAttr "grp_toe_l1_leg.rx" "unitConversion5.i";
connectAttr "pmaNode_ballRoll_l1_leg.o1" "unitConversion6.i";
connectAttr "ctrl_l1_leg.toe_flap" "unitConversion7.i";
connectAttr "ctrl_l1_leg.foot_twist" "unitConversion8.i";
connectAttr "ctrl_l1_leg.foot_bank" "unitConversion9.i";
connectAttr "rig_hip.msg" "bindPose1.m[0]";
connectAttr "rig_knee.msg" "bindPose1.m[1]";
connectAttr "rig_ankle.msg" "bindPose1.m[2]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "rig_hip.bps" "bindPose1.wm[0]";
connectAttr "rig_knee.bps" "bindPose1.wm[1]";
connectAttr "rig_ankle.bps" "bindPose1.wm[2]";
connectAttr "lctrTwist_l1_leg.t" "plusMinusAverage1.i3[0]";
connectAttr "layerManager.dli[1]" "layer1.id";
connectAttr "layerManager.dli[2]" "layer2.id";
connectAttr "curveInfo1.al" "condition1.ft";
connectAttr "multiplyDivide1.ox" "condition1.ctr";
connectAttr "curveInfo1.al" "multiplyDivide1.i1x";
connectAttr "cluster1GroupParts.og" "cluster1.ip[0].ig";
connectAttr "cluster1GroupId.id" "cluster1.ip[0].gi";
connectAttr "cluster1Handle.wm" "cluster1.ma";
connectAttr "cluster1HandleShape.x" "cluster1.x";
connectAttr "groupParts11.og" "tweak1.ip[0].ig";
connectAttr "groupId11.id" "tweak1.ip[0].gi";
connectAttr "cluster1GroupId.msg" "cluster1Set.gn" -na;
connectAttr "curveShape1.iog.og[0]" "cluster1Set.dsm" -na;
connectAttr "cluster1.msg" "cluster1Set.ub[0]";
connectAttr "tweak1.og[0]" "cluster1GroupParts.ig";
connectAttr "cluster1GroupId.id" "cluster1GroupParts.gi";
connectAttr "groupId11.msg" "tweakSet1.gn" -na;
connectAttr "curveShape1.iog.og[1]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "curveShape1Orig.ws" "groupParts11.ig";
connectAttr "groupId11.id" "groupParts11.gi";
connectAttr "cluster2GroupParts.og" "cluster2.ip[0].ig";
connectAttr "cluster2GroupId.id" "cluster2.ip[0].gi";
connectAttr "cluster2Handle.wm" "cluster2.ma";
connectAttr "cluster2HandleShape.x" "cluster2.x";
connectAttr "cluster2GroupId.msg" "cluster2Set.gn" -na;
connectAttr "curveShape1.iog.og[2]" "cluster2Set.dsm" -na;
connectAttr "cluster2.msg" "cluster2Set.ub[0]";
connectAttr "cluster1.og[0]" "cluster2GroupParts.ig";
connectAttr "cluster2GroupId.id" "cluster2GroupParts.gi";
connectAttr "cluster3GroupParts.og" "cluster3.ip[0].ig";
connectAttr "cluster3GroupId.id" "cluster3.ip[0].gi";
connectAttr "cluster3Handle.wm" "cluster3.ma";
connectAttr "cluster3HandleShape.x" "cluster3.x";
connectAttr "cluster3GroupId.msg" "cluster3Set.gn" -na;
connectAttr "curveShape1.iog.og[3]" "cluster3Set.dsm" -na;
connectAttr "cluster3.msg" "cluster3Set.ub[0]";
connectAttr "cluster2.og[0]" "cluster3GroupParts.ig";
connectAttr "cluster3GroupId.id" "cluster3GroupParts.gi";
connectAttr "cluster4GroupParts.og" "cluster4.ip[0].ig";
connectAttr "cluster4GroupId.id" "cluster4.ip[0].gi";
connectAttr "cluster4Handle.wm" "cluster4.ma";
connectAttr "cluster4HandleShape.x" "cluster4.x";
connectAttr "groupParts13.og" "tweak2.ip[0].ig";
connectAttr "groupId13.id" "tweak2.ip[0].gi";
connectAttr "cluster4GroupId.msg" "cluster4Set.gn" -na;
connectAttr "curveShape2.iog.og[0]" "cluster4Set.dsm" -na;
connectAttr "cluster4.msg" "cluster4Set.ub[0]";
connectAttr "tweak2.og[0]" "cluster4GroupParts.ig";
connectAttr "cluster4GroupId.id" "cluster4GroupParts.gi";
connectAttr "groupId13.msg" "tweakSet2.gn" -na;
connectAttr "curveShape2.iog.og[1]" "tweakSet2.dsm" -na;
connectAttr "tweak2.msg" "tweakSet2.ub[0]";
connectAttr "curveShape2Orig.ws" "groupParts13.ig";
connectAttr "groupId13.id" "groupParts13.gi";
connectAttr "cluster5GroupParts.og" "cluster5.ip[0].ig";
connectAttr "cluster5GroupId.id" "cluster5.ip[0].gi";
connectAttr "cluster5Handle.wm" "cluster5.ma";
connectAttr "cluster5HandleShape.x" "cluster5.x";
connectAttr "cluster5GroupId.msg" "cluster5Set.gn" -na;
connectAttr "curveShape2.iog.og[2]" "cluster5Set.dsm" -na;
connectAttr "cluster5.msg" "cluster5Set.ub[0]";
connectAttr "cluster4.og[0]" "cluster5GroupParts.ig";
connectAttr "cluster5GroupId.id" "cluster5GroupParts.gi";
connectAttr "cluster6GroupParts.og" "cluster6.ip[0].ig";
connectAttr "cluster6GroupId.id" "cluster6.ip[0].gi";
connectAttr "cluster6Handle.wm" "cluster6.ma";
connectAttr "cluster6HandleShape.x" "cluster6.x";
connectAttr "cluster6GroupId.msg" "cluster6Set.gn" -na;
connectAttr "curveShape2.iog.og[3]" "cluster6Set.dsm" -na;
connectAttr "cluster6.msg" "cluster6Set.ub[0]";
connectAttr "cluster5.og[0]" "cluster6GroupParts.ig";
connectAttr "cluster6GroupId.id" "cluster6GroupParts.gi";
connectAttr "curveShape1.ws" "curveInfo1.ic";
connectAttr "curveShape2.ws" "curveInfo2.ic";
connectAttr "curveInfo2.al" "condition2.ft";
connectAttr "multiplyDivide2.ox" "condition2.ctr";
connectAttr "curveInfo2.al" "multiplyDivide2.i1x";
connectAttr "ctrl_root.ry" "unitConversion10.i";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "bindPose2.msg" "skinCluster1.bp";
connectAttr "jnt_leg1.wm" "skinCluster1.ma[0]";
connectAttr "jnt_leg2.wm" "skinCluster1.ma[1]";
connectAttr "jnt_leg3.wm" "skinCluster1.ma[2]";
connectAttr "jnt_leg4.wm" "skinCluster1.ma[3]";
connectAttr "jnt_leg5.wm" "skinCluster1.ma[4]";
connectAttr "jnt_leg6.wm" "skinCluster1.ma[5]";
connectAttr "jnt_leg7.wm" "skinCluster1.ma[6]";
connectAttr "jnt_leg8.wm" "skinCluster1.ma[7]";
connectAttr "jnt_leg9.wm" "skinCluster1.ma[8]";
connectAttr "jnt_leg10.wm" "skinCluster1.ma[9]";
connectAttr "jnt_leg11.wm" "skinCluster1.ma[10]";
connectAttr "jnt_leg1.liw" "skinCluster1.lw[0]";
connectAttr "jnt_leg2.liw" "skinCluster1.lw[1]";
connectAttr "jnt_leg3.liw" "skinCluster1.lw[2]";
connectAttr "jnt_leg4.liw" "skinCluster1.lw[3]";
connectAttr "jnt_leg5.liw" "skinCluster1.lw[4]";
connectAttr "jnt_leg6.liw" "skinCluster1.lw[5]";
connectAttr "jnt_leg7.liw" "skinCluster1.lw[6]";
connectAttr "jnt_leg8.liw" "skinCluster1.lw[7]";
connectAttr "jnt_leg9.liw" "skinCluster1.lw[8]";
connectAttr "jnt_leg10.liw" "skinCluster1.lw[9]";
connectAttr "jnt_leg11.liw" "skinCluster1.lw[10]";
connectAttr "jnt_leg8.msg" "skinCluster1.ptt";
connectAttr "leg_geoShapeOrig.w" "groupParts14.ig";
connectAttr "groupId14.id" "groupParts14.gi";
connectAttr "groupParts16.og" "tweak3.ip[0].ig";
connectAttr "groupId16.id" "tweak3.ip[0].gi";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "leg_geoShape.iog.og[7]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "tweak3.og[0]" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "groupId16.msg" "tweakSet3.gn" -na;
connectAttr "leg_geoShape.iog.og[8]" "tweakSet3.dsm" -na;
connectAttr "tweak3.msg" "tweakSet3.ub[0]";
connectAttr "groupParts14.og" "groupParts16.ig";
connectAttr "groupId16.id" "groupParts16.gi";
connectAttr "jnt_leg1.msg" "bindPose2.m[0]";
connectAttr "jnt_leg2.msg" "bindPose2.m[1]";
connectAttr "jnt_leg3.msg" "bindPose2.m[2]";
connectAttr "jnt_leg4.msg" "bindPose2.m[3]";
connectAttr "jnt_leg5.msg" "bindPose2.m[4]";
connectAttr "jnt_leg6.msg" "bindPose2.m[5]";
connectAttr "jnt_leg7.msg" "bindPose2.m[6]";
connectAttr "jnt_leg8.msg" "bindPose2.m[7]";
connectAttr "jnt_leg9.msg" "bindPose2.m[8]";
connectAttr "jnt_leg10.msg" "bindPose2.m[9]";
connectAttr "jnt_leg11.msg" "bindPose2.m[10]";
connectAttr "bindPose2.w" "bindPose2.p[0]";
connectAttr "bindPose2.m[0]" "bindPose2.p[1]";
connectAttr "bindPose2.m[1]" "bindPose2.p[2]";
connectAttr "bindPose2.m[2]" "bindPose2.p[3]";
connectAttr "bindPose2.m[3]" "bindPose2.p[4]";
connectAttr "bindPose2.m[4]" "bindPose2.p[5]";
connectAttr "bindPose2.m[5]" "bindPose2.p[6]";
connectAttr "bindPose2.m[6]" "bindPose2.p[7]";
connectAttr "bindPose2.m[7]" "bindPose2.p[8]";
connectAttr "bindPose2.m[8]" "bindPose2.p[9]";
connectAttr "bindPose2.m[9]" "bindPose2.p[10]";
connectAttr "jnt_leg1.bps" "bindPose2.wm[0]";
connectAttr "jnt_leg2.bps" "bindPose2.wm[1]";
connectAttr "jnt_leg3.bps" "bindPose2.wm[2]";
connectAttr "jnt_leg4.bps" "bindPose2.wm[3]";
connectAttr "jnt_leg5.bps" "bindPose2.wm[4]";
connectAttr "jnt_leg6.bps" "bindPose2.wm[5]";
connectAttr "jnt_leg7.bps" "bindPose2.wm[6]";
connectAttr "jnt_leg8.bps" "bindPose2.wm[7]";
connectAttr "jnt_leg9.bps" "bindPose2.wm[8]";
connectAttr "jnt_leg10.bps" "bindPose2.wm[9]";
connectAttr "jnt_leg11.bps" "bindPose2.wm[10]";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "shd_lytBSG.pa" ":renderPartition.st" -na;
connectAttr "leg_geoShape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "nurbsSphereShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "groupId14.msg" ":initialShadingGroup.gn" -na;
connectAttr "shd_lytA.msg" ":defaultShaderList1.s" -na;
connectAttr "shd_lytB.msg" ":defaultShaderList1.s" -na;
connectAttr "clampNode_Stretch.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mdNode_RStretch_l1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mdNode_MStretch_l1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mdNode_EStretchl1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pmaNode_twist_l1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mdNode_twist_l1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "adlNode_RStretch_l1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clampNode_Stretch1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mdNode_RStretch_l1_leg1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mdNode_MStretch_l1_leg1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mdNode_EStretchl1_leg1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pmaNode_twist_l1_leg1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mdNode_twist_l1_leg1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "conNode_ballRoll_l1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "conNode_negBallRoll_l1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "conNode_toeRoll.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pmaNode_ballRoll_l1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pmaNode_toeRoll_l1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "conNode_heelRoll_l1_leg.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "condition2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "ikSCsolver.msg" ":ikSystem.sol" -na;
connectAttr "ikRPsolver.msg" ":ikSystem.sol" -na;
connectAttr "ikSplineSolver.msg" ":ikSystem.sol" -na;
// End of LegRig_AutoGen_01.ma
