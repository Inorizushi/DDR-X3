local t = Def.ActorFrame{};

-- Dancer 1P
	t[#t+1]=Def.Sprite{
		InitCommand = cmd(player,PLAYER_1;vertalign,bottom;diffusealpha,0.75;x,SCREEN_CENTER_X-420;y,SCREEN_CENTER_Y+118;blend,Blend.Add);
		OnCommand =function(self)
			self:Load(THEME:GetPathG("","_Dancer/1Pdancer 24x1.png"));
		end;
		-- SetCommand base from DDR 5th MIX by AJ 187
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_1 then
				self:visible(true);
				(cmd(zoom,0;bounceend,0.3;zoom,1))(self);
			end;
		end;
		PlayerUnjoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_1 then
				self:visible(true);
				(cmd(bouncebegin,0.3;zoom,0))(self);
			end;
		end;
		OffCommand=cmd(diffusealpha,0);
	};

t[#t+1] = Def.ActorFrame{
	LoadActor("../Screen2ndMIXSelectGameMode decorations/1P")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X-420,SCREEN_CENTER_Y+114;visible,false);
		OnCommand=function(s) if GAMESTATE:IsPlayerEnabled(PLAYER_1) then s:visible(true) else s:visible(false) end; end;
	};
};

return t;
