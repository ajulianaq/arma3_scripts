while {true} do{
_gasmasklayer = "gasmasklayer" cutRsc ["Default", "PLAIN",-1,false];
while {
	goggles zCurator == "G_RegulatorMask_F"
} do {
_gasmasklayer = "gasmasklayer" cutRsc ["RscCBRN_Regulator", "PLAIN", -1, false];
while {(goggles zCurator == "G_RegulatorMask_F") AND (backpack zCurator == "B_CombinationUnitRespirator_01_F")} do {
[zCurator] call BIN_fnc_CBRNHoseInit; 
while {speed zCurator < 14} do {
	playSound "gasmasksound";
	sleep 3;
	if ((goggles zCurator != "G_RegulatorMask_F") OR (backpack zCurator != "B_CombinationUnitRespirator_01_F")) exitWith {};
	};


while {speed zCurator > 14} do {
	playSound "gasmasksound";
	sleep 2;
	if ((goggles zCurator != "G_RegulatorMask_F") OR (backpack zCurator != "B_CombinationUnitRespirator_01_F")) exitWith {};
};
};
};
};
