//by GROM
_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0.85],[-0.2,0,-1.5,2]];
_hndl ppEffectCommit 0;

	while {true} do {
    _ran = ceil random 5;
    playsound format ["wind_%1",_ran];
    setwind [-2*2,6*2,true];
	_delay = 1 + random 5;
    sleep _delay;
	};