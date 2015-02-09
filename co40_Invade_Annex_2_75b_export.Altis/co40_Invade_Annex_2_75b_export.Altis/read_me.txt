/*
Author:

	Quiksilver

Last modified:

	9/04/2014

Description:

	A bunch of useful stuff about this mission, for those who care to tweak.

---------------------------------------------*/

Devs read me:

Mission: Invade & Annex

Author: Rarek [ahoyworld.co.uk], Jester, Razgriz33, Kamaradski, David.

Contributors: Quiksilver [contact: camball@gmail.com]. chucky.

Editors: Your name here.

Version: 2.75.1

Coded for 40-60 player server. Suggest 4 pilot slots for 40 and under slots, 5 pilot slots for 50-60 players.



It is recommended to read "scripts\misc\briefing.sqf", and edit the file to fit your community.



Recommendation for usage:

Disable .rpt logging to improve performance, otherwise:

Enable logging on your server for a day or two after all A3/mission/mod updates, to catch errors.


--

To do: 

- Zeus?

- move PVEHs from init.sqf to where they belong. [DONE]

- put functions where they belong (separate them and cfgFunctions) [DONE]

- fix Artillery.sqf. the de-spawn issue. [FIXED]

- CAS.sqf find a good way to implement/cleanup JTAC (prelim tests are positive, but grouping issue remains)

- side missions. break down into separate files. spawn function. randomized spawn element (too predictable currently).

- side missions. create more. specifically convoy and kill missions with fail timer.

- initServer.sqf and initPlayerLocal.sqf [DONE]

- Easter eggs script, create  easterEgg.sqf

- plenty of other stuff ive forgotten [???]

- get minefield working again [FIXED]

- Tried to integrate =BTC= Revive v0.98, but its still WIP from =BTC=.

- Sort out the two big messes: sideMissions.sqf [NOT DONE] and functions.sqf [DONE]




Known errors (all benign as of ArmA 1.14):

sling script, sling attach line 12, when vehicle is being slung. I will get around to debugging soon.
silencer when applied to MX SW
EOS_markers.sqf



///////////////////////

note from Quiksilver: 

The below is a copy of our DefaultServer.Arma3Profile (allfps.com.au)

Handy if you want customized difficulty settings

////////////////////////

version=1;
blood=1;
singleVoice=0;
gamma=1;
brightness=1;
maxSamplesPlayed=96;
class Difficulties
{
	class recruit
	{
		class Flags
		{
			Armor=1;
			FriendlyTag=0;
			EnemyTag=0;
			MineTag=1;
			HUD=1;
			HUDPerm=1;
			HUDWp=1;
			HUDWpPerm=1;
			HUDGroupInfo=1;
			AutoSpot=0;		
			Map=0;			
			WeaponCursor=1;
			AutoGuideAT=1;
			ClockIndicator=1;
			3rdPersonView=1;
			UltraAI=0;
			CameraShake=0;
			UnlimitedSaves=1;
			DeathMessages=1;
			NetStats=1;
			VonID=1;
			ExtendetInfoType=1;
		};
		skillFriendly=0.60000002;
		skillEnemy=0.60000002;
		precisionFriendly=0.28;
		precisionEnemy=0.28;
	};
	class regular
	{
		class Flags
		{
			Armor=1;
			FriendlyTag=1;
			EnemyTag=0;
			MineTag=1;
			HUD=1;
			HUDPerm=1;
			HUDWp=1;
			HUDWpPerm=1;
			HUDGroupInfo=1;
			AutoSpot=0;		// stops annoying AI radio chatter
			Map=0;			// so enemy doesnt appear on map
			WeaponCursor=1;
			AutoGuideAT=1;
			ClockIndicator=1;
			3rdPersonView=1;
			UltraAI=0;
			CameraShake=1;
			UnlimitedSaves=1;
			DeathMessages=1;
			NetStats=1;
			VonID=1;
			ExtendetInfoType=0;
		};
		skillFriendly=0.60000002;
		skillEnemy=0.60000002;
		precisionFriendly=0.28;
		precisionEnemy=0.28;
	};
	class veteran
	{
		class Flags
		{
			Armor=0;
			FriendlyTag=0;
			EnemyTag=0;
			MineTag=0;
			HUD=1;
			HUDWp=1;
			HUDWpPerm=1;
			HUDGroupInfo=1;
			AutoSpot=0;
			WeaponCursor=0;
			ClockIndicator=1;
			3rdPersonView=1;
			UltraAI=0;
			CameraShake=0;
			DeathMessages=0;
			NetStats=0;
			VonID=1;
			ExtendetInfoType=0;
		};
		skillFriendly=0.60000002;
		skillEnemy=0.60000002;
		precisionFriendly=0.28;
		precisionEnemy=0.28;
	};
	class mercenary
	{
		class Flags
		{
			HUD=1;
			AutoSpot=0;
			WeaponCursor=0;
			DeathMessages=0;
			NetStats=0;
			VonID=0;
		};
		skillFriendly=0.60000002;
		skillEnemy=0.60000002;
		precisionFriendly=0.28;
		precisionEnemy=0.28;
	};
};
difficulty="regular";
sceneComplexity=1000000;
shadowZDistance=100;
viewDistance=3800;
preferredObjectViewDistance=3200;
terrainGrid=3.125;
volumeCD=10;
volumeFX=10;
volumeSpeech=10;
volumeVoN=10;
vonRecThreshold=0.029999999;

///////////////////////

The above is a copy of our DefaultServer.Arma3Profile

Relevant if you want customized difficulty settings

////////////////////////