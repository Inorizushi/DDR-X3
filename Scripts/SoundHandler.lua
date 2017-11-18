do
  local sound = {
    MusicWheelchange = {
      ["X3"] = "_X3MusicWheelChange.ogg";
      ["2nd"] = "_2ndMusicWheelChange.ogg"
    };
  };
  function GetSoundPath(type, relative)
    local possibles = sound[type]
      or error("GetSoundPath: unknown sound type "..type, 2)
    function selection()
      if Is2ndMIX() then
        return "2nd"
      else
        return "X3"
      end;
    end;
    local file = possibles[selection]
      or error("GetSoundPath: no sound defined for selection"..selection, 2)
    return relative and file or THEME:GetPathS("", file)
  end;
end;
