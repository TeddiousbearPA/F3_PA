scopeName "main";
_id = _this select 2;
_leader = (leader player);
_tpaction = (_this select 2);

hintsilent "No one found to teleport to";
if (_leader == player) then {
{
	if (_x != _leader) then {
	if (_x distance player > 50) then {
	_bguy = _x;
	{
		if ((side _x == east || side _x == resistance) && alive _x) then {//check for enemies near player
			if (_x distance _bguy < 25) then {
				hintsilent "Enemies nearby, try again later"; 
				breakTo "main";
			};
		};
	}foreach allUnits;
	if ((vehicle _x) != _x) then { //Checks if the squad leader is in a vehicle
		if ((vehicle _x) emptyPositions "cargo" == 0) then { //Checks if vehicle has empty seats
			hintsilent "No more room in the group's vehicle, try again later"; 
		}
		else {
			player removeAction _tpaction;
			hintsilent "";
			disableUserInput true;
			cutText ["", "BLACK FADED"];
			player moveincargo (vehicle _x);
			sleep 0.5;
			titleCut ["", "BLACK IN", 5];
			hintsilent format ["Teleported to %1",name _x]; 
			disableUserInput false;
			sleep 2;
			breakTo "main";
		};
	}
	else {
		player removeAction _tpaction;
		hintsilent "";
		disableUserInput true;
		cutText ["", "BLACK"];
		sleep 2;
		player setPosASL (getposASL _x);
		titleCut ["", "BLACK IN", 5];
		hintsilent format ["Teleported to %1",name _x]; 
		disableUserInput false;
		sleep 2;
		breakTo "main";
	};
	} else {};
	} else {};
} foreach units group player;

} else {
	if (_leader distance player > 10) then {
	{
		if ((side _x == east || side _x == resistance) && alive _x) then {//check for enemies near player
			if (_x distance _leader < 25) then {
				hintsilent "Enemies nearby, try again later"; 
				breakTo "main";
			};
		};
	}foreach allUnits;
	if ((vehicle _leader) != _leader) then { //Checks if the squad leader is in a vehicle
		if ((vehicle _leader) emptyPositions "cargo" == 0) then { //Checks if vehicle has empty seats
			hintsilent "No more room in the group's vehicle, try again later"; 
		}
		else {
			player removeAction _tpaction;
			hintsilent "";
			disableUserInput true;
			cutText ["", "BLACK FADED"];
			player moveincargo (vehicle _leader);
			sleep 0.5;
			titleCut ["", "BLACK IN", 5];
			hintsilent format ["Teleported to %1",name _leader]; 
			disableUserInput false;
			sleep 2;
			breakTo "main";
		};
	}
	else {
		player removeAction _tpaction;
		hintsilent "";
		disableUserInput true;
		cutText ["", "BLACK"];
		sleep 2;
		player setPosASL (getposASL _leader);
		titleCut ["", "BLACK IN", 5];
		hintsilent format ["Teleported to %1",name _leader]; 
		disableUserInput false;	
		sleep 2;	
		breakTo "main";
	};
	};
};
