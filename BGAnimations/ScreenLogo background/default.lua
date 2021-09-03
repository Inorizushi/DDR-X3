local counter = 0;

return Def.ActorFrame{
  loadfile(THEME:GetPathB("ScreenWithMenuElements","background"))();
  Def.ActorFrame{
    Name="Logo Area",
    InitCommand=function(s) s:xy(_screen.cx,_screen.cy-60) end,
    Def.Sprite{
      Texture="logo back",
    };
    Def.Sprite{
      Texture="X3",
      InitCommand=function(s) s:xy(-224,-10) end,
    };
    Def.Sprite{
      Texture="2ndMIX",
      InitCommand=function(s) s:xy(310,102) end,
    };
    Def.Sprite{
      Texture="VS",
      InitCommand=function(s) s:xy(132,-28) end,
    };
    Def.Sprite{
      Texture="logo glow",
      InitCommand=function(s) s:diffusealpha(0):playcommand("Animate") end,
      AnimateCommand=function(s) s:sleep(0.5):linear(1):blend(Blend.Add):diffusealpha(0.25):linear(1):diffusealpha(0):queuecommand("Animate") end,
    };
  };
  Def.Sprite{
    Texture="copyright",
    InitCommand=function(s) s:xy(_screen.cx+8,SCREEN_BOTTOM-48) end,
  },
}
