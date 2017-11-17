local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(zoom,0.8);
	LoadActor("cd/cd_mask")..{
		InitCommand=cmd(blend,Blend.NoEffect;zwrite,1;clearzbuffer,true;);
	};
	Def.Banner{
		Name="SongCD";
		SetMessageCommand=function(self,params)
			self:ztest(1)
			local song = params.Song;
			if song then
				local songtit = params.Song:GetDisplayMainTitle();
				if CDImage[songtit] ~= nil then
					local diskImage = CDImage[songtit];
					self:Load(THEME:GetPathG("","MusicWheelItem Song NormalPart/cd/"..diskImage));
				else
				--Fallback to Jacket/BG or just load the fallback cd.
					--Verify Jacket
					if song:HasJacket() then
						self:Load(song:GetJacketPath());
						self:setsize(256,256);
						self:diffusealpha(1);
					elseif song:HasBackground() then
						--Verify BG
						self:Load(song:GetBackgroundPath());
				 		self:setsize(256,256);
						self:diffusealpha(1);
					else
						--Fallback CD
						self:Load(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/fallback"));
					end;
				end;
			end;
		end;
	};

	--Overlay
	Def.ActorFrame{
		Name="CdOver";
		InitCommand=cmd();
		LoadActor(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/overlay"))..{
			SetMessageCommand=function(self,params)
				local song = params.Song;
				if song then
					local songtit = params.Song:GetDisplayMainTitle();
					if CDImage[songtit] ~= nil then
						self:visible(false)
					else
						self:visible(true)
					end;
				else
					self:visible(false)
				end;
			end;
		};
	};

};

return t;
