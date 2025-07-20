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
        height = 50;
        modules-left = [
          "custom/power"
          "hyprland/workspaces"
        ];
        modules-center = [
          "mpris"
        ];
        modules-right = [
          "tray"
          "clock"
        ];
        clock = {

        };
        "custom/power" = {
          format = "pwr";
          tooltip = false;
          on-click = "wlogout -b 2";
        };
      };
    };
  };
}
