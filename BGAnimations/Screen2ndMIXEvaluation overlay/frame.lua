local t = Def.ActorFrame {};

--Frame
t[#t+1] = Def.ActorFrame {
	LoadActor( "bgm" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-74;);
	}
};

--Judgement
	t[#t+1] = Def.ActorFrame {
		LoadActor( "judge" )..{
			OnCommand=cmd(x,SCREEN_CENTER_X+1;y,SCREEN_CENTER_Y-102);
		}
	};
--MaxCombo
	t[#t+1] = Def.ActorFrame {
		LoadActor( "maxcombo" )..{
			OnCommand=cmd(x,SCREEN_CENTER_X+1;y,SCREEN_CENTER_Y+52);
		}
	};
--Stage Labels
	t[#t+1] = Def.ActorFrame {
		LoadActor( "scorelbl" )..{
			OnCommand=cmd(x,SCREEN_CENTER_X+1;y,SCREEN_BOTTOM-108);
		}
	};
return t;
