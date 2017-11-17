local group;

local t = Def.ActorFrame{
	InitCommand=cmd(zoom,0.7);
	LoadActor("cd_mask")..{
		InitCommand=cmd(blend,Blend.NoEffect;zwrite,1;clearzbuffer,true;);
	};
	Def.Sprite {
		SetMessageCommand=function(self,params)
			self:ztest(1)
			group = params.Text;
			local so = GAMESTATE:GetSortOrder();
			if group then
				if so == "SortOrder_Group" then
					if group_name[group] ~= nil then
						local filePath = THEME:GetPathG("","_jackets/group/"..group_name[group]..".png");
						self:Load(filePath)
						self:diffusealpha(1);
					else
						self:Load( THEME:GetPathG("","_No banner") );
						self:diffusealpha(0);
					end;
				end;
			end;
		end;
	};
	Def.Banner {
	Name="SongBanner";
	InitCommand=cmd(scaletoclipped,256,256;diffusealpha,0;);
	SetMessageCommand=function(self,params)
		self:ztest(1)
		local pt_text = params.Text;
		local group = params.Text;
		if group then
			if params.HasFocus then
				setenv("getgroupname",pt_text);
			end;
			if group_name[group] ~= nil then
				self:Load( THEME:GetPathG("","_No banner") );
				self:diffusealpha(0);
			else
				self:LoadFromSongGroup(group);
				self:diffusealpha(1);
			end;
		else
			-- call fallback
			self:Load( THEME:GetPathG("","_No banner") );
			self:diffusealpha(1);
		end;

	end;
	};
	Def.ActorFrame{
		Name="CdOver";
		InitCommand=cmd();
		LoadActor("overlay");
	};
};

t[#t+1] = Def.Sprite {
	InitCommand=cmd(y,40);
	SetMessageCommand=function(self,params)
		group = params.Text;
		local so = GAMESTATE:GetSortOrder();
		if group then
			if so == "SortOrder_Group" then
				if group_name[group] ~= nil then
					local filePath = THEME:GetPathG("","_jackets/group/"..group_name[group]..".png");
					self:Load(filePath)
					self:diffusealpha(1);
				else
					self:Load( THEME:GetPathG("","_No banner") );
					self:diffusealpha(0);
				end;
			end;
		end;
	end;
};

t[#t+1] = Def.ActorFrame{
	Def.Banner {
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,256,256;diffusealpha,0;y,40);
		SetMessageCommand=function(self,params)
			local pt_text = params.Text;
			local group = params.Text;
			if group then
				if params.HasFocus then
					setenv("getgroupname",pt_text);
				end;
				if group_name[group] ~= nil then
					self:Load( THEME:GetPathG("","_No banner") );
					self:diffusealpha(0);
				else
					self:LoadFromSongGroup(group);
					self:diffusealpha(1);
				end;
		else
			-- call fallback
			self:Load( THEME:GetPathG("","_No banner") );
			self:diffusealpha(1);
		end;
	end;
	};
	LoadFont("_helvetica Bold 24px")..{
		InitCommand=cmd(y,-44;maxwidth,256);
		SetMessageCommand=function(self, params)
			local song = params.Song;
			group = params.Text;
			local so = GAMESTATE:GetSortOrder();
			if group_name[group] ~= nil then
				self:settext("");
			else
				if so == "SortOrder_Group" then
					self:settext(group);
					self:strokecolor(color("#000000"))
					self:diffuse(color("#FFFFFF"));
				else
					self:settext("");
				end;
			end;
		end;
	};
};

return t;
