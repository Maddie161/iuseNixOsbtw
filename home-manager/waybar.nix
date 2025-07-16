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
        modules-left = [
          "hyprland/workspaces"
          "hyprland/windowcount"
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
