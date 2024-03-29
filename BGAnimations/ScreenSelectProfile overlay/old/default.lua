--[[
This script was taken from KENp's DDR X2 theme
and was recoded by FlameyBoy and Inorizushi
]]--

local ProfileInfoCache = {}
setmetatable(ProfileInfoCache, {__index =
function(table, ind)
    local out = {}
    local prof = PROFILEMAN:GetLocalProfileFromIndex(ind-1)
    out.SongsAndCoursesPercentCompleteAllDifficultiesSingle = prof:GetSongsAndCoursesPercentCompleteAllDifficulties('StepsType_Dance_Single')
    out.SongsAndCoursesPercentCompleteAllDifficultiesDouble = prof:GetSongsAndCoursesPercentCompleteAllDifficulties('StepsType_Dance_Double')
    out.TotalCaloriesBurned = prof:GetTotalCaloriesBurned()
    out.CaloriesBurnedToday = prof:GetCaloriesBurnedToday()
    out.LastPlayedSong = prof:GetLastPlayedSong()
    out.DisplayName = prof:GetDisplayName()
    out.NumTotalSongsPlayed = prof:GetNumTotalSongsPlayed()
    out.UserTable = prof:GetUserTable()
    rawset(table, ind, out)
    return out
end
})

--�d�����e����---------------------------
function LoadCard(cColor,cColor2,Player,IsJoinFrame)
	local t = Def.ActorFrame {
    LoadActor( THEME:GetPathG("ScreenSelectProfile","CardBackground") ) .. {
			InitCommand=cmd(shadowlength,0;zoomy,0;diffusealpha,0.9);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoomy,1;);
			OffCommand=function(self)
				if IsJoinFrame then
					(cmd(sleep,0.5;linear,0.2;zoomy,0.100;diffusealpha,0))(self);
				else
					(cmd(linear,0.2;zoomy,0.100;diffusealpha,0))(self);
				end
			end;
		};
    LoadActor( THEME:GetPathG("ScreenSelectProfile","CardBG02"))..{
      InitCommand=cmd(y,-144;zoomy,0);
      OnCommand=function(self)
        if IsJoinFrame then
          (cmd(linear,0.3;diffusealpha,0))(self);
        else
          self:sleep(0.3):linear(0.3):zoomy(1)
        end
      end;
      OffCommand=cmd(linear,0.02;zoom,0.100;diffusealpha,0);
    };
   LoadActor( THEME:GetPathG("ScreenSelectProfile","LvBackground") ) .. {
     InitCommand=cmd(shadowlength,0;zoom,0;x,-142;y,-94;diffuse,cColor2);
     OnCommand=cmd(sleep,0.3;linear,0.3;zoom,1.3;);
     OffCommand=cmd(linear,0.02;zoom,0.100;diffusealpha,0);
   };
		LoadActor( THEME:GetPathG("ScreenSelectProfile","LvWord") ) .. {
      InitCommand=cmd(shadowlength,0;zoom,0;x,-142;y,-54;diffuse,cColor2);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoom,0.75;);
			OffCommand=cmd(linear,0.02;zoom,0.100;diffusealpha,0);
		};

		LoadActor( THEME:GetPathG("ScreenSelectProfile","DancerNameWord") ) .. {
      InitCommand=cmd(shadowlength,0;zoom,0;x,-104;y,-238;diffuse,cColor2);
      OnCommand=function(self)
        if IsJoinFrame then
          (cmd(linear,0.3;diffusealpha,0))(self);
        else
          self:sleep(0.7):linear(0.3):zoom(1)
        end
      end;
			OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);
		};
    LoadActor( THEME:GetPathG("ScreenSelectProfile","DDR-CodeWord") ) .. {
			InitCommand=cmd(shadowlength,0;zoom,0;y,-160;x,-112;diffuse,cColor2;);
      OnCommand=function(self)
        if IsJoinFrame then
          (cmd(linear,0.3;diffusealpha,0))(self);
        else
          self:sleep(0.7):linear(0.3):zoom(1)
        end
      end;
			OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);
		};
    LoadActor( THEME:GetPathG("ScreenSelectProfile","CardFrameA") )..{
			Name = "Frame";
			InitCommand=cmd(y,0;zoomx,0);
			OnCommand=cmd(linear,0.3;zoomx,1;linear,0.3;y,-272);
			OffCommand=function(self)
				if IsJoinFrame then
					(cmd(sleep,0.5;linear,0.2;y,0.100;linear,0.2;diffusealpha,0))(self);
				else
					(cmd(linear,0.2;y,0.100;linear,0.2;diffusealpha,0))(self);
				end
			end;

		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","CardFrameA") )..{
			Name = "Frame";
			InitCommand=cmd(y,0;zoomx,0);
      OnCommand=function(self)
        if IsJoinFrame then
          (cmd(linear,0.3;zoomx,1;linear,0.3;y,272))(self);
        else
          (cmd(linear,0.3;zoomx,1;linear,0.3;y,272;linear,0.3;zoomy,0))(self);
        end;
      end;
			OffCommand=function(self)
				if IsJoinFrame then
					(cmd(sleep,0.5;linear,0.2;y,0.100;linear,0.2;diffusealpha,0))(self);
				else
					(cmd(zoomy,1;linear,0.2;y,0.100;linear,0.2;diffusealpha,0))(self);
				end
			end;
		};
    LoadActor( THEME:GetPathG("ScreenSelectProfile","CardFrameB") )..{
			Name = "Frame";
			InitCommand=cmd(y,0;zoomx,0);
      OnCommand=function(self)
        if IsJoinFrame then
          (cmd(diffusealpha,0))(self);
        else
          (cmd(zoomy,0;linear,0.3;zoomx,1;linear,0.3;y,260;linear,0.3;zoomy,1))(self);
        end;
      end;
			OffCommand=function(self)
				if IsJoinFrame then
					(cmd(sleep,0.5;linear,0.2;y,0.100;linear,0.2;diffusealpha,0))(self);
				else
					(cmd(zoomy,0;linear,0.2;y,0.100;linear,0.2;diffusealpha,0))(self);
				end
			end;
		};
	};

	return t
end

function SetRank02(Rank02, minValue)

	if minValue >=1.98 then
		Rank02 = "True God";
	elseif minValue >=1.80 then
		Rank02 = "Dazu God";
	elseif minValue >=1.60 then
		Rank02 = "God";
	elseif minValue >=1.40 then
		Rank02 = "Deity";
	elseif minValue >=1.20 then
		Rank02 = "Phoenix";
	elseif minValue >=1.00 then
		Rank02 = "Dragon";
	elseif minValue >=0.85 then
		Rank02 = "Emperor";
	elseif minValue >=0.70 then
		Rank02 = "King";
	elseif minValue >=0.55 then
		Rank02 = "Shogun";
	elseif minValue >=0.40 then
		Rank02 = "Noble";
	elseif minValue >=0.30 then
		Rank02 = "Knight";
	elseif minValue >=0.20 then
		Rank02 = "Samurai";
	elseif minValue >=0.10 then
		Rank02 = "Warrior";
	elseif minValue >0 then
		Rank02 = "Beginner";
	else
		Rank02 = "???";

	end

	return Rank02;
end


function SetRankFromRadarValue(selectRank, SingleTable)
	local Rank01;
	local Rank02 = "123";

	local singleMax = math.max(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5]);
	local singleMin = math.min(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5]);

	local totalMax = math.max(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5]);

	-- local totalMin = math.min(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5],
								-- DoubleTable[1],DoubleTable[2],DoubleTable[3],DoubleTable[4],DoubleTable[5]);

	if totalMax == SingleTable[1] then
		Rank01 = "Stream";
	elseif totalMax == SingleTable[2] then
		Rank01 = "Voltage";
	elseif totalMax == SingleTable[3] then
		Rank01 = "Air";
	elseif totalMax == SingleTable[4] then
		Rank01 = "Freeze";
	else
		Rank01 = "Chaos";
	end

	if (totalMax == SingleTable[1] or
		totalMax == SingleTable[2] or
		totalMax == SingleTable[3] or
		totalMax == SingleTable[4] or
		totalMax == SingleTable[5]) then

		Rank02 = SetRank02(Rank02,singleMin);
	else
		Rank02 = SetRank02(Rank02,doubleMin);
	end

	if Rank02 == "???" then
		Rank01 ="???"
	end

	selectRank:settext(Rank01.." ".. Rank02);
end;

function LoadPlayerStuff(Player)

	local t = {};
	local pn = (Player == PLAYER_1) and 1 or 2;


	t[#t+1] = Def.ActorFrame {
		Name = 'JoinFrame';
		LoadCard(Color('Outline'),color('0,0,0,0'),Player,true);

		LoadActor( THEME:GetPathG("ScreenSelectProfile","Start") ) .. {
			InitCommand=cmd(zoomy,0;diffuseshift;effectcolor1,Color('White');effectcolor2,color("#A5A6A5");playcommand,"Animate");
			OnCommand=cmd(zoomy,0;zoomx,0;sleep,0.5;linear,0.1;zoomx,0.5;zoomy,1);
      AnimateCommand=cmd(smooth,0.1;zoomx,1.05;smooth,0.1;zoomx,1;queuecommand,"Animate");
			OffCommand=cmd(sleep,0.5;linear,0.1;zoomy,0;diffusealpha,0);
		};

	};

	t[#t+1] = Def.ActorFrame {
		Name = 'BigFrame';
		LoadCard(PlayerColor(),color('1,1,1,1'),Player,false);
	};
	t[#t+1] = Def.ActorFrame {
		Name = 'SmallFrame';
		InitCommand=cmd(y,48);
    --Stream
    LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(setsize,50,50;x,64;y,-50);
			OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
    --Voltage
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(setsize,50,50;zoomx,-1;x,-160;y,-14);
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
    --Air
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(setsize,50,50;zoomx,-1;x,-120;y,100);
			OnCommand=cmd(diffusealpha,0;sleep,0.7;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
    --Chaos
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(setsize,50,50;x,170;y,-14);
			OnCommand=cmd(diffusealpha,0;sleep,0.8;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
    --Freeze
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(setsize,50,50;x,140;y,100);
			OnCommand=cmd(diffusealpha,0;sleep,0.9;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};

		Def.Sprite{
			Texture="Radar",
			InitCommand=function(s) s:y(34) end,
			OnCommand=cmd(diffusealpha,0;sleep,0.9;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.01;zoom,0;diffusealpha,0);
		};
	};
	t[#t+1] = Def.ActorScroller{
		Name = 'Scroller';
		NumItemsToDraw=1;

		OnCommand=cmd(draworder,1000;y,5;SetFastCatchup,true;SetMask,0,58;SetSecondsPerItem,0.15);
		TransformFunction=function(self, offset, itemIndex, numItems)
			local focus = scale(math.abs(offset),0,2,1,0);
			self:visible(false);
			self:y(math.floor( offset*40 ));

		end;
    OffCommand=cmd(linear,0.3;zoomy,0;diffusealpha,0);
	};


	t[#t+1] = Def.ActorFrame {
		Name = "EffectFrame";
	};

	--�U���d��-----------------
	t[#t+1] = LoadFont("_sveningsson Bold 60px") .. {
		Name = 'SelectedProfileText';
    InitCommand=cmd(y,-214;x,-10;zoomy,0.4;zoomx,0.5;uppercase,true;diffuse,color("1,1,1,0");maxwidth,400);
    OnCommand=function(self)
      if IsJoinFrame then
        (cmd(linear,0.3;diffusealpha,0))(self);
      else
        self:sleep(0.8):linear(0.5):diffusealpha(1)
      end
    end;
		OffCommand=cmd(stoptweening;linear,0.01;zoomy,0;diffusealpha,0);
	};

	t[#t+1] = LoadFont("_enjoysongnumber") .. {
		Name = 'SelectedProfileLevel';
    InitCommand=cmd(x,-142;y,-94;zoom,0;strokecolor,color("#000000");maxwidth,50);
		OnCommand=cmd(sleep,0.7;linear,0.05;diffusealpha,1;zoom,1);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};

	t[#t+1] = LoadFont("_handelgothic bt 20px") .. {
		Name = 'selectSongsPlayed';
    InitCommand=function(self)
      if Player==PLAYER_2 then
        self:x(28);
      else
        self:x(25)
      end;
      (cmd(y,-56;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,150))(self);
    end;
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.3;zoomx,0.4;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};

	t[#t+1]=LoadFont("_helvetica Bold 24px") .. {
		Name = 'selectRank';
    InitCommand=cmd(x,-60;y,-60;zoom,0;diffuse,color("1,1,1,1");halign,0;skewx,-0.2;strokecolor,Color("Outline");maxwidth,350);
		OnCommand=function(self)
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.75))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};

	t[#t+1] = LoadFont("_sveningsson Bold 60px") .. {
		Name = 'selectPlayerUID';
		InitCommand=cmd(x,60;y,-160;zoomy,0.3;zoomx,0.5;diffuse,color("1,1,1,0");maxwidth,420);
    OnCommand=function(self)
      if IsJoinFrame then
        (cmd(linear,0.3;diffusealpha,0))(self);
      else
        self:linear(0.2):diffusealpha(0):sleep(0.7):
        y(-160):linear(0.3):diffusealpha(1)
      end
    end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	t[#t+1] = Def.Sprite{
		Texture="Player 1x2.png";
		InitCommand=function(self)
		  self:xy(-3,-272):pause():diffusealpha(0):setstate(0)
		end;
			OnCommand=function(self)
				if Player== PLAYER_1 then
					self:setstate(0)
				else
					self:setstate(1)
				end
				(cmd(sleep,0.6;diffusealpha,1))(self);
			end;
		OffCommand=function(self)
		  if IsJoinFrame then
			(cmd(linear,0.1;y,0.100;linear,0.1;diffusealpha,0))(self);
		  else
			self:sleep(0.7):linear(0.1):y(0.100):linear(0.1):diffusealpha(0)
		  end;
		end;
		};
	------MyGrooveRadar
	if (Player == PLAYER_1) then
		t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile", "GrooveRadar" ),1,0.2,0.2,0.2,0.5,PLAYER_1,'single')..{
			Name = "GVRD1S";
      InitCommand=cmd(x,0;y,99;zoom,1;diffusealpha,0;diffuse,PlayerColor(PLAYER_1));
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
			OffCommand=cmd(linear,0.05;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD1Value_S1';
			InitCommand=cmd(horizalign,right;x,82;y,-14;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD1Value_S2';
			InitCommand=cmd(horizalign,right;x,-144;y,22;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD1Value_S3';
			InitCommand=cmd(horizalign,right;x,-100;y,136;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD1Value_S4';
			InitCommand=cmd(horizalign,right;x,186;y,22;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD1Value_S5';
			InitCommand=cmd(horizalign,right;x,156;y,136;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};

    t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile", "GrooveRadar" ),1,0.2,0.2,0.2,0.5,PLAYER_1, 'double')..{
			Name = "GVRD1D";
			InitCommand=cmd(x,0;y,99;zoom,1;diffusealpha,0;diffuse,PlayerColor(PLAYER_2));
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
			OffCommand=cmd(linear,0.05;diffusealpha,0);
		};
    t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD1Value_D1';
			InitCommand=cmd(horizalign,right;x,82;y,8;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD1Value_D2';
			InitCommand=cmd(horizalign,right;x,-144;y,44;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD1Value_D3';
			InitCommand=cmd(horizalign,right;x,-100;y,158;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD1Value_D4';
			InitCommand=cmd(horizalign,right;x,186;y,44;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD1Value_D5';
			InitCommand=cmd(horizalign,right;x,156;y,158;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};



	else
    t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile", "GrooveRadar" ),1,0.2,0.2,0.2,0.5,PLAYER_2,'single')..{
			Name = "GVRD2S";
      InitCommand=cmd(x,0;y,99;zoom,1;diffusealpha,0;diffuse,PlayerColor(PLAYER_1));
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
			OffCommand=cmd(linear,0.05;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD2Value_S1';
			InitCommand=cmd(horizalign,right;x,82;y,-14;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD2Value_S2';
			InitCommand=cmd(horizalign,right;x,-144;y,22;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD2Value_S3';
			InitCommand=cmd(horizalign,right;x,-100;y,136;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD2Value_S4';
			InitCommand=cmd(horizalign,right;x,186;y,22;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD2Value_S5';
			InitCommand=cmd(horizalign,right;x,156;y,136;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};

    t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile", "GrooveRadar" ),1,0.2,0.2,0.2,0.5,PLAYER_2, 'double')..{
			Name = "GVRD2D";
			InitCommand=cmd(x,0;y,99;zoom,1;diffusealpha,0;diffuse,PlayerColor(PLAYER_2));
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
			OffCommand=cmd(linear,0.05;diffusealpha,0);
		};
    t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD2Value_D1';
			InitCommand=cmd(horizalign,right;x,82;y,8;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD2Value_D2';
			InitCommand=cmd(horizalign,right;x,-144;y,44;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD2Value_D3';
			InitCommand=cmd(horizalign,right;x,-100;y,158;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD2Value_D4';
			InitCommand=cmd(horizalign,right;x,186;y,44;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russell square 16px") .. {
			Name = 'GVRD2Value_D5';
			InitCommand=cmd(horizalign,right;x,156;y,158;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.8);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
	end;
	return t;
end;

function UpdateInternal3(self, Player)

	local pn = (Player == PLAYER_1) and 1 or 2;
	local frame = self:GetChild(string.format('P%uFrame', pn));
	local scroller = frame:GetChild('Scroller');
	local seltext = frame:GetChild('SelectedProfileText');
	local joinframe = frame:GetChild('JoinFrame');
	local smallframe = frame:GetChild('SmallFrame');
	local bigframe = frame:GetChild('BigFrame');
	local selLevel = frame:GetChild('SelectedProfileLevel');
	local selectRank = frame:GetChild('selectRank');
	local selectPlayerUID = frame:GetChild('selectPlayerUID');
	local selSongsPlayed = frame:GetChild('selectSongsPlayed');
	local selPlayerUID;
	local selGVRDSingle = (Player == PLAYER_1) and frame:GetChild('GVRD1S') or frame:GetChild('GVRD2S');
	local selGVRDDouble = (Player == PLAYER_1) and frame:GetChild('GVRD1D') or frame:GetChild('GVRD2D');
	local selGVRDValue_S1 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_S1') or frame:GetChild('GVRD2Value_S1');
	local selGVRDValue_S2 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_S2') or frame:GetChild('GVRD2Value_S2');
	local selGVRDValue_S3 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_S3') or frame:GetChild('GVRD2Value_S3');
	local selGVRDValue_S4 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_S4') or frame:GetChild('GVRD2Value_S4');
	local selGVRDValue_S5 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_S5') or frame:GetChild('GVRD2Value_S5');
  local selGVRDValue_D1 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_D1') or frame:GetChild('GVRD2Value_D1');
	local selGVRDValue_D2 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_D2') or frame:GetChild('GVRD2Value_D2');
	local selGVRDValue_D3 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_D3') or frame:GetChild('GVRD2Value_D3');
	local selGVRDValue_D4 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_D4') or frame:GetChild('GVRD2Value_D4');
	local selGVRDValue_D5 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_D5') or frame:GetChild('GVRD2Value_D5');

	local PcntLarger;
	--local selMostCoursePlayed = frame:GetChild('selectedMostCoursePlayed');
	if GAMESTATE:IsHumanPlayer(Player) then
		frame:visible(true);
		if MEMCARDMAN:GetCardState(Player) == 'MemoryCardState_none' then
			--using profile if any
			joinframe:visible(false);
			smallframe:visible(true);
			bigframe:visible(false);
			seltext:visible(true);
      selectPlayerUID:visible(true);
			scroller:visible(true);
			selLevel:visible(true);
			selectRank:visible(true);
			selSongsPlayed:visible(false);
			selGVRDSingle:visible(true);
      selGVRDDouble:visible(true);
			selGVRDValue_S1:visible(true);
			selGVRDValue_S2:visible(true);
			selGVRDValue_S3:visible(true);
			selGVRDValue_S4:visible(true);
			selGVRDValue_S5:visible(true);
			selGVRDValue_D1:visible(true);
			selGVRDValue_D2:visible(true);
			selGVRDValue_D3:visible(true);
			selGVRDValue_D4:visible(true);
			selGVRDValue_D5:visible(true);

			local ind = SCREENMAN:GetTopScreen():GetProfileIndex(Player);


			if ind > 0 then
				local profile = PROFILEMAN:GetLocalProfileFromIndex(ind-1);
				local PcntCompleteSingle = ProfileInfoCache[ind].SongsAndCoursesPercentCompleteAllDifficultiesSingle;
				local PcntCompleteDouble = ProfileInfoCache[ind].SongsAndCoursesPercentCompleteAllDifficultiesDouble;
				--HonorName

				if PcntCompleteSingle>PcntCompleteDouble then
					PcntLarger = PcntCompleteSingle;
				else
					PcntLarger = PcntCompleteDouble;
				end
				PcntLarger = PcntLarger*100;

				local Lv = math.ceil(math.sqrt(ProfileInfoCache[ind].TotalCaloriesBurned));
				local pcnt =(ProfileInfoCache[ind].TotalCaloriesBurned-((Lv-1)*(Lv-1))) /((Lv*Lv)-((Lv-1)*(Lv-1)));
				local totalPcnt = (PcntCompleteSingle + PcntCompleteDouble) / 2;
					--totalPcnt = PcntLarger;
				--local pcnt =((ProfileInfoCache[ind].TotalCaloriesBurned-((Lv-1)*(Lv-1))) /((Lv*Lv)-((Lv-1)*(Lv-1)));
				bigframe:visible(true);
				scroller:SetDestinationItem(ind-1);
				seltext:settext(ProfileInfoCache[ind].DisplayName);
				selLevel:settext(math.ceil(math.sqrt(ProfileInfoCache[ind].TotalCaloriesBurned) ));
				selSongsPlayed:settext(tostring(math.ceil(ProfileInfoCache[ind].NumTotalSongsPlayed)));

				selPlayerUID = PROFILEMAN:GetLocalProfileFromIndex(ind-1):GetGUID();
				selectPlayerUID:settext(string.upper(string.sub(selPlayerUID,1,4).."-"..string.sub(selPlayerUID,5,8)));

				local RadarValueTableSingle = {};
				local RadarValueTableDouble = {};

				local profileID = PROFILEMAN:GetLocalProfileIDFromIndex(ind-1)
				local prefs = ProfilePrefs.Read(profileID)
				if SN3Debug then
					ProfilePrefs.Save(profileID)
				end

				----------Single Radar
				--Stream--
				RadarValueTableSingle[1] = MyGrooveRadar.GetRadarData(profileID, 'single', 'stream')
                selGVRDValue_S1:settext(string.format("%0.0f", RadarValueTableSingle[1]*100));
                --Voltage--
                RadarValueTableSingle[2] = MyGrooveRadar.GetRadarData(profileID, 'single', 'voltage')
                selGVRDValue_S2:settext(string.format("%0.0f", RadarValueTableSingle[2]*100));
                --Air--
                RadarValueTableSingle[3] = MyGrooveRadar.GetRadarData(profileID, 'single', 'air')
                selGVRDValue_S3:settext(string.format("%0.0f", RadarValueTableSingle[3]*100));
				--Freeze--
                RadarValueTableSingle[4] = MyGrooveRadar.GetRadarData(profileID, 'single', 'freeze')
                selGVRDValue_S4:settext(string.format("%0.0f", RadarValueTableSingle[4]*100));
				--Chaos--
                RadarValueTableSingle[5] = MyGrooveRadar.GetRadarData(profileID, 'single', 'chaos')
                selGVRDValue_S5:settext(string.format("%0.0f", RadarValueTableSingle[5]*100));
        ----------Doubles Radar
        --Stream--
                RadarValueTableDouble[1] = MyGrooveRadar.GetRadarData(profileID, 'double', 'stream')
                selGVRDValue_D1:settext(string.format("%0.0f", RadarValueTableDouble[1]*100));
        --Voltage--
                RadarValueTableDouble[2] = MyGrooveRadar.GetRadarData(profileID, 'double', 'voltage')
                selGVRDValue_D2:settext(string.format("%0.0f", RadarValueTableDouble[2]*100));
        --Air--
                RadarValueTableDouble[3] = MyGrooveRadar.GetRadarData(profileID, 'double', 'air')
                selGVRDValue_D3:settext(string.format("%0.0f", RadarValueTableDouble[3]*100));
        --Freeze--
                RadarValueTableDouble[4] = MyGrooveRadar.GetRadarData(profileID, 'double', 'freeze')
                selGVRDValue_D4:settext(string.format("%0.0f", RadarValueTableDouble[4]*100));
        --Chaos--
                RadarValueTableDouble[5] = MyGrooveRadar.GetRadarData(profileID, 'double', 'chaos')
                selGVRDValue_D5:settext(string.format("%0.0f", RadarValueTableDouble[5]*100));

				-- Save the past values, which we will need later
				local pastValues = GetOrCreateChild(GAMESTATE:Env(), 'PastRadarValues')
				pastValues[Player] = DeepCopy(MyGrooveRadar.GetRadarTable(profileID))

				SetRankFromRadarValue(selectRank,RadarValueTableSingle);

			else
				if SCREENMAN:GetTopScreen():SetProfileIndex(Player, 1) then
					bigframe:visible(false);
					scroller:SetDestinationItem(0);
					self:queuecommand('UpdateInternal2');
				else
					joinframe:visible(false);
					smallframe:visible(false);
					bigframe:visible(false);
					scroller:visible(false);
					seltext:settext('No profile');
					selectPlayerUID:settext('------------');
					selLevel:settext('No level info');
					selectRank:settext('???');
					selSongsPlayed:visible(false);

					selGVRDSingle:visible(false);
					selGVRDValue_S1:visible(false);
					selGVRDValue_S2:visible(false);
					selGVRDValue_S3:visible(false);
					selGVRDValue_S4:visible(false);
					selGVRDValue_S5:visible(false);
          selGVRDDouble:visible(false);
					selGVRDValue_D1:visible(false);
					selGVRDValue_D2:visible(false);
					selGVRDValue_D3:visible(false);
					selGVRDValue_D4:visible(false);
					selGVRDValue_D5:visible(false);
				end;
			end;
		else
			--using card
			smallframe:visible(false);
			scroller:visible(false);
			seltext:settext('CARD');
			SCREENMAN:GetTopScreen():SetProfileIndex(Player, 0);
		end;
	else
		joinframe:visible(true);
		scroller:visible(false);
		seltext:visible(false);
		selectPlayerUID:visible(false);
		smallframe:visible(false);
		bigframe:visible(false);
		selLevel:visible(false);
		selectRank:visible(false);
		selSongsPlayed:visible(false);

		selGVRDSingle:visible(false);
		selGVRDValue_S1:visible(false);
		selGVRDValue_S2:visible(false);
		selGVRDValue_S3:visible(false);
		selGVRDValue_S4:visible(false);
		selGVRDValue_S5:visible(false);
    selGVRDDouble:visible(false);
		selGVRDValue_D1:visible(false);
		selGVRDValue_D2:visible(false);
		selGVRDValue_D3:visible(false);
		selGVRDValue_D4:visible(false);
		selGVRDValue_D5:visible(false);
	end;
end;

--�D�{��
local t = Def.ActorFrame {

	StorageDevicesChangedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			MESSAGEMAN:Broadcast("StartButton");
			if not GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -1);
			else
				SCREENMAN:GetTopScreen():Finish();
			end;
		end;
		if params.Name == 'Up' or params.Name == 'Up2' or params.Name == 'DownLeft' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 1 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind - 1 ) then
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Down' or params.Name == 'Down2' or params.Name == 'DownRight' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 0 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind + 1 ) then
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Back' then
			if GAMESTATE:GetNumPlayersEnabled()==0 then
				SCREENMAN:GetTopScreen():Cancel();
			else
				MESSAGEMAN:Broadcast("BackButton");
				SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -2);
			end;
		end;
	end;

	PlayerJoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	PlayerUnjoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	OnCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	UpdateInternal2Command=function(self)
		UpdateInternal3(self, PLAYER_1);
		UpdateInternal3(self, PLAYER_2);
	end;

	children = {
		Def.Sprite{
			Texture="base",
			InitCommand=function(s) s:Center() end,
		};
		Def.ActorFrame {
			Name = 'P1Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y+20;zoom,1);
			OnCommand=cmd(sleep,1);
			OffCommand=cmd();
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd(zoomx,1;zoomy,0.15;linear,0.175;zoomy,1;))(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_1);
		};
		Def.ActorFrame {
			Name = 'P2Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X+240;y,SCREEN_CENTER_Y+20;zoom,1);
			OnCommand=cmd(sleep,1);
			OffCommand=cmd();
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd(zoomx,1;zoomy,0.15;linear,0.175;zoomy,1;))(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_2);
		};
		-- sounds
		LoadActor( THEME:GetPathS("Common","start") )..{
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("","Profile_start") )..{
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Common","cancel") )..{
			BackButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("","Profile_Move") )..{
			DirectionButtonMessageCommand=cmd(play);
		};
	};
};


return t;
