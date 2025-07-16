{
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
        height = 10;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "mpris"
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
  };
}
