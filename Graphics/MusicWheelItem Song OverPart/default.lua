-- Base from DDR 5th by AJ 187

local t = Def.ActorFrame {
	LoadActor("NEW") .. {
		InitCommand=cmd(x,90;y,-118;diffuseshift;effectcolor1,color("#deff00");effectcolor2,color("#ff8a00");effectperiod,0.25;draworder,106;zoom,1.4);
		OnCommand=cmd(diffusealpha,0;sleep,1;diffusealpha,1);
		SetCommand=function(self,param)
			if param.Song then
				if PROFILEMAN:IsSongNew(param.Song) then
					self:visible(true);
				else
					self:visible(false);
				end
			else
				self:visible(false);
			end
		end;
		OffCommand=function(s) s:visible(false) end;
	};
};

return t;
