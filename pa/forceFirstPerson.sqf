if (isServer) exitWith {};
if (pa_param_force_view < 1) exitWith {};

[] spawn {
	while {true} do
	{
		waitUntil { ( cameraView == "External" ) };

		if ( (vehicle player) == player ) then // if player isn't inside a vehicle
		{
		player switchCamera "Internal";
		systemChat "Third Person View is not allowed."; // keep message local to player
		};

		uiSleep 0.5; // lag won't mess with the timing
	};
};