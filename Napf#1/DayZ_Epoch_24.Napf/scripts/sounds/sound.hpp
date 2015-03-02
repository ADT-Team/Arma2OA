class CfgSounds
{	
    sounds[] = {bl_begin,bl_hit1,bl_hit2,bl_hit3,bl_wave1,bl_wave2,bl_wave3,bl_psi,bl_full,bl_detect,apsi_on,apsi_off,ns_fx_misc4,ns_fx_drone1,ns_fx_drone2,lock,brokeclothes,unlock,introsong,pda,epipans,paink_use,alarm1_sound/*,hempsong*/,carLock};

    class bl_begin
	{
		name = "NS blowout_begin";
		sound[] = {"scripts\sounds\blow\blowout_begin.ogg",3.162278,1.0};
		titles[] = {};
	};
	class bl_hit1
	{
		name = "NS blowout_begin";
		sound[] = {"scripts\sounds\blow\blowout_hit_1.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_hit2
	{
		name = "NS blowout_begin";
		sound[] = {"scripts\sounds\blow\blowout_hit_2.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_hit3
	{
		name = "NS blowout_begin";
		sound[] = {"scripts\sounds\blow\blowout_hit_3.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_wave1
	{
		name = "NS blowout_begin";
		sound[] = {"scripts\sounds\blow\blowout_wave_1.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_wave2
	{
		name = "NS blowout_begin";
		sound[] = {"scripts\sounds\blow\blowout_wave_2.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_wave3
	{
		name = "NS blowout_begin";
		sound[] = {"scripts\sounds\blow\blowout_wave_3.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_psi
	{
		name = "NS blowout_psi";
		sound[] = {"scripts\sounds\blow\blowout_psy_voices.ogg",1.778279,1.0};
		titles[] = {};
	};
	class bl_full
	{
		name = "NS blowout_full";
		sound[] = {"scripts\sounds\blow\blowout_full_wave.ogg",1.778279,1.0};
		titles[] = {};
	};
	class bl_detect
	{
		name = "NS blowout_detect";
		sound[] = {"scripts\sounds\blow\blowout_detect.ogg",1.778279,1.0};
		titles[] = {};
	};
	class apsi_on
	{
		name = "NS apsi_on";
		sound[] = {"scripts\sounds\blow\apsi_start.ogg",1.778279,1.0};
		titles[] = {};
	};
	class apsi_off
	{
		name = "NS apsi_off";
		sound[] = {"scripts\sounds\blow\apsi_off.ogg",1.778279,1.0};
		titles[] = {};
	};
	class ns_fx_misc4
	{
		name = "Misc strange wind";
		sound[] = {"scripts\sounds\blow\fx_misc4.ogg",1.0,1.0};
		titles[] = {};
	};
	class ns_fx_drone1
	{
		name = "Drone 1";
		sound[] = {"scripts\sounds\blow\fx_drone1.ogg",1.0,1.0};
		titles[] = {};
	};
	class ns_fx_drone2
	{
		name = "Drone 2";
		sound[] = {"scripts\sounds\blow\fx_drone2.ogg",1.0,1.0};
		titles[] = {};
	};
	
	
	
	
	class lock
	{
	name = "lock";
	sound[] = {\scripts\sounds\lock.ogg,0.8,1};
	titles[] = {};
    };
	
	class unlock
	{
	name = "unlock";
	sound[] = {\scripts\sounds\unlock.ogg,0.8,1};
	titles[] = {};
    };
	
	class brokeclothes
    {
    name="brokeclothes";
    sound[]={\scripts\sounds\brokeclothes.ogg,1,1};
    titles[] = {};
    };
	
	class introSong
    {
    name="introsong";
    sound[]={\scripts\sounds\introsong.ogg,0.9,1};
    titles[] = {};
    };
	
	class pda
    {
    name="pda";
    sound[]={\scripts\sounds\pda.ogg,0.9,1};
    titles[] = {};
    };

	class epipans
    {
    name="epipans";
    sound[]={\scripts\sounds\epipens.ogg,0.9,1};
    titles[] = {};
    };
/*	
	class hempsong
    {
        name = "hempsong";
        sound[] = {\scripts\sounds\hempsong.ogg,0.9,1};
        titles[] = {};
    };
*/	
	class paink_use
    {
    name="paink_use";
    sound[]={\scripts\sounds\painkiller.ogg,0.9,1};
    titles[] = {};
    };
	
	 class carLock
    {
        name="carLock";
        sound[] = {"scripts\sounds\carlock.ogg",0.9,1};
        titles[] = {};
    };
/*	
	class alarm1
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "alarm1_sound";
		// filename, volume, pitch
		sound[] = {\scripts\sounds\alarm.ogg, 0.9, 1};
		titles[] = {};
	};
*/	
	
};