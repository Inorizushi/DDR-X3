local t = Def.ActorFrame{
	GainFocusCommand=function(s) MESSAGEMAN:Broadcast("EASY") end;
	-- Information panel
	LoadActor(THEME:GetPathG("","_shared2ndMIX/GameMode/speaker"))..{
		GainFocusCommand=cmd(linear,0.2;zoom,1;diffuse,color("1,1,1,1"));
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;diffuse,color("0.75,0.75,0.75,1"));
	};
	LoadActor(THEME:GetPathG("","_shared2ndMIX/GameMode/cone"))..{
		InitCommand=cmd(visible,false;zoom,0.9);
		GainFocusCommand=cmd(visible,true;heartbeat;effectperiod,0.2);
		LoseFocusCommand=cmd(stoptweening;stopeffect;visible,false);
	};
	Def.Sprite{
		InitCommand=cmd(y,-14;pause;);
		Texture="label";
		GainFocusCommand=function(self)
			self:setstate(0)
			self:linear(0.2)
			self:zoom(1)
		end;
		LoseFocusCommand=function(self)
			self:setstate(1)
			self:stoptweening():linear(0.2):zoom(0.65);
		end;
	};
	Def.Sprite{
		Texture = "../../_shared2ndMIX/GameMode/stages";
		InitCommand=cmd(y,84;pause);
		GainFocusCommand=cmd(linear,0.2;zoom,1);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.55);
		SetCommand=function(self)
			local stages = PREFSMAN:GetPreference("SongsPerPlay")
			local event = PREFSMAN:GetPreference("EventMode")
			if stages == 1 then
				self:setstate(0)
			elseif stages == 2 then
				self:setstate(1)
			elseif stages == 3 then
				self:setstate(2)
			elseif stages == 4 then
				self:setstate(3)
			elseif stages >= 5 then
				self:setstate(4)
			elseif event == 1 then
				self:visible(false)
			end;
		end;
	};
};

return t;
