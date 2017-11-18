local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("DANCE.ogg")..{
    OnCommand=cmd(sleep,0.8;queuecommand,'Play');
    PlayCommand=cmd(play);
  };
};

local muswheelchange_path = THEME:GetCurrentThemeDirectory().."/Sounds/MusicWheel change.redir"
if FILEMAN:DoesFileExist(muswheelchange_path) then
  local f = RageFileUtil.CreateRageFile()
  local worked = f:Open(muswheelchange_path, 10)
  if worked then
    f:Write("_2ndMusicWheelChange.ogg")
    f:Close()
  elseif SN3Debug then
    SCREENMAN:SystemMessage("Couldn't open MusicWheel change redir")
  end
  f:destroy()
  THEME:ReloadMetrics()
end;

return t;
