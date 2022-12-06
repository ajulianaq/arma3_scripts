/* 
Author: Alberto Juliana Quirós
Description: Sets up a post-apocalyptic zone marked in map. 
Detects wether or not Arma 3: Contact DLC CBRN Gear is on. If not, simulates health effects.
*/

/*Climate change when entering*/
exclusionzone = createMarker ["exclusionzone", [6066.015,8106.273]];
"exclusionzone" setMarkerSize [520,480];
"exclusionzone" setMarkerShape "RECTANGLE";
"exclusionzone" setMarkerColor "ColorRed";
"exclusionzone" setMarkerBrush "GRID";
while{true} do {
waitUntil {zCurator inArea "exclusionzone"};
	cutText ["", "BLACK",3];
	0 setOvercast 1;
	0 setRain 1;
	forceWeatherChange;
	cutText ["Exclusion Zone", "BLACK IN",3];
	PP_colorC = ppEffectCreate ["ColorCorrections",1500];
	PP_colorC ppEffectEnable true;
	PP_colorC ppEffectAdjust [1,1,0,[0.4,0,0,0],[3.82,-5,-5,0.98],[1.69,0.33,0.33,0],[0,0,0,0,0,0,4]];
	PP_colorC ppEffectCommit 0;
	PP_film = ppEffectCreate ["FilmGrain",2000];
	PP_film ppEffectEnable true;
	PP_film ppEffectAdjust [0.84,1.31,0.89,0.5,0.5,true];
	PP_film ppEffectCommit 0;
	/* Play heartbeat sound on player when CBRN gear is not equipped*/
	[]spawn{
	waitUntil {(goggles zCurator != "G_RegulatorMask_F") OR (backpack zCurator != "B_CombinationUnitRespirator_01_F")};
	playSound "heart";
	};
/*Restore weather effects when getting out of the zone */
waitUntil{not(zCurator inArea "exclusionzone")};
cutText ["", "BLACK",3];
	0 setOvercast 0;
	0 setRain 0;
	forceWeatherChange;
cutText ["", "BLACK IN",3];
PP_colorC ppEffectEnable false;
ppEffectDestroy PP_film;
};













