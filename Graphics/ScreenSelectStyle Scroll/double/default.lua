local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,244;y,-134;);
  Def.ActorFrame{
    LoadActor(THEME:GetPathG("","_sharedX3/SelectStyle/infomiddle"))..{
      OnCommand=cmd(zoomy,0;diffusealpha,0);
      OffCommand=cmd(smooth,0.1;zoomy,0;diffusealpha,0);
      GainFocusCommand=cmd(diffusealpha,0;zoomy,0;smooth,0.2;zoomy,1;diffusealpha,0.5);
      LoseFocusCommand=cmd(queuecommand,"Off");
    };
    LoadActor("text")..{
      InitCommand=cmd(y,-24);
      OnCommand=cmd(diffusealpha,0);
      OffCommand=cmd(smooth,0.1;diffusealpha,0);
      GainFocusCommand=cmd(diffusealpha,0;sleep,0.1;smooth,0.2;diffusealpha,1);
      LoseFocusCommand=cmd(queuecommand,"Off");
    };
    LoadActor("infopad")..{
      InitCommand=cmd(xy,160,34);
      OnCommand=cmd(diffusealpha,0);
      OffCommand=cmd(smooth,0.1;diffusealpha,0);
      GainFocusCommand=cmd(diffusealpha,0;sleep,0.1;smooth,0.2;diffusealpha,1);
      LoseFocusCommand=cmd(queuecommand,"Off");
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(y,-94);
    OnCommand=cmd(diffusealpha,0);
    OffCommand=cmd(smooth,0.1;y,0;diffusealpha,0);
    GainFocusCommand=cmd(diffusealpha,0;y,0;smooth,0.2;y,-94;diffusealpha,1);
    LoseFocusCommand=cmd(queuecommand,"Off");
    LoadActor(THEME:GetPathG("","_sharedX3/SelectStyle/infotop"));
    LoadActor("title.png")..{
      InitCommand=cmd(x,-7);
    };
  };
  LoadActor(THEME:GetPathG("","_sharedX3/SelectStyle/infobottom"))..{
    InitCommand=cmd(y,72);
    OnCommand=cmd(diffusealpha,0);
    OffCommand=cmd(smooth,0.1;y,0;diffusealpha,0);
    GainFocusCommand=cmd(diffusealpha,0;y,0;smooth,0.2;y,72;diffusealpha,1);
    LoseFocusCommand=cmd(queuecommand,"Off");
  };
};

t[#t+1] = Def.ActorFrame {
  GainFocusCommand=cmd(stoptweening;smooth,0.3;y,0;zoom,1);
  LoseFocusCommand=cmd(stoptweening;smooth,0.3;y,100;zoom,1);
  Def.ActorFrame{
    InitCommand=cmd(x,-4;y,96);
    OnCommand=cmd(zoom,0;sleep,0.5;linear,0.1;diffusealpha,1.0;zoom,1;smooth,0.1;zoom,0.9;smooth,0.1;zoom,1);
    LoadActor("offPad.png")..{
      OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    };
    LoadActor("Pad.png")..{
      OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
      GainFocusCommand=cmd(smooth,0.3;diffusealpha,1;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0");effectperiod,2);
      LoseFocusCommand=cmd(diffusealpha,0;stopeffect);
    };
  };
  LoadActor("Character") .. {
    InitCommand=cmd(diffusealpha,0;zoomx,1;x,18;y,-10);
    OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    OnCommand=cmd(sleep,0.6;linear,0.1;diffusealpha,1;zoomy,0.8;linear,0.1;zoomy,1;zoomx,1.2;linear,0.1;zoomx,1);
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor("title small")..{
    InitCommand=cmd(diffusealpha,0;x,178;y,-190;zoom,1.75);
    MenuLeftP1MessageCommand=cmd(playcommand,"Change1");
    MenuLeftP2MessageCommand=cmd(playcommand,"Change1");
    MenuRightP1MessageCommand=cmd(playcommand,"Change1");
    MenuRightP2MessageCommand=cmd(playcommand,"Change1");
    MenuUpP1MessageCommand=cmd(playcommand,"Change1");
    MenuUpP2MessageCommand=cmd(playcommand,"Change1");
    MenuDownP1MessageCommand=cmd(playcommand,"Change1");
    MenuDownP2MessageCommand=cmd(playcommand,"Change1");
    OnCommand=function(self)
        self:playcommand("Change1")
    end;
    Change1Command=function(self)
      local env = GAMESTATE:Env()
      if env.DOUBLESELECT then
        self:queuecommand("GainFocus")
      else
        self:finishtweening():linear(0.1):cropright(1):sleep(0.3):queuecommand("Change2")
      end;
    end;
    Change2Command=cmd(zoomy,1.75;cropright,1;diffusealpha,1;linear,0.2;cropright,0;queuecommand,"Animate");
    GainFocusCommand=function(self)
      local env = GAMESTATE:Env()
      env.DOUBLESELECT = true
      self:stoptweening():linear(0.1):zoomy(0)
    end;
    LoseFocusCommand=function(self)
      local env = GAMESTATE:Env()
      env.DOUBLESELECT = false
    end;
    AnimateCommand=cmd(linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,0;sleep,1;queuecommand,"Animate");
    OffCommand=cmd(stoptweening;smooth,0.2;zoom,0;diffusealpha,0;);
  };
};

return t;
