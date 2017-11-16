local xPosPlayer = {
    P1 = (THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX")),
    P2 = (THEME:GetMetric(Var "LoadingScreen","PlayerP2OnePlayerOneSideX"))
}

local xPosPlayerBar = {
    P1 = (THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX")+10),
    P2 = (THEME:GetMetric(Var "LoadingScreen","PlayerP2OnePlayerOneSideX")-10)
}

local t = Def.ActorFrame{}
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("MIX.png")..{
		Name = pn,
		InitCommand=function(self)
			local short = ToEnumShortString(pn)
			self:x(xPosPlayer[short])
		end,
		OnCommand=function(s) s:zoomx(pn=='PlayerNumber_P2' and -1 or 1) end,
	};
end;
for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
  for i = 1,41 do
    t[#t+1] = Def.Sprite{
      BeginCommand=cmd(y,-2;zoomx,pn=='PlayerNumber_P2' and -1 or 1);
      InitCommand=function(self) if pn == PLAYER_1 then self:x(SCREEN_CENTER_X-586+10.9*i) else self:x(SCREEN_CENTER_X+586-10.9*i) end end;
      OnCommand=function(self)
				self:sleep(i / 20)
			end;
      LifeChangedMessageCommand=function(self,params)
				self:Load(THEME:GetPathG("","ScreenGameplay LifeFrame/MIXBAR 41x1.png"))
				self:pause()

				if (params.Player == pn) then
					local life = string.format("%.1f",params.LifeMeter:GetLife() * 10)
					local pills = (string.format("%.1f",life * 17 / 41)) * 10

          self:setstate(-1 + i)
					if pills >= i then self:visible(true) else self:visible(false) end
					if pills >= 41 then self:glowshift():effectperiod(0.1):effectcolor1(1,1,1,0.4):effectcolor2(1,1,1,0) else self:stopeffect() end
        else return end
			end;
    };
  end
end

return t
