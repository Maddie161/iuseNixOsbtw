{
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "bottom";
      };
      modules-left = [
        "workspaces"
        "windowcount"
      ];
      modules-center = [

      ];
      modules-right = [
        "tray"
        "network"
        "bluetooth"
        "pulseaudio"
        "cava"
        "clock"
      ];
    };
  };
}
