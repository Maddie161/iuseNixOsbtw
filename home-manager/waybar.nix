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
          "karlstav/cava"
        ];
        modules-right = [
          "tray"
          "clock"
          "karlstav/cava"
        ];
        clock = {
          interval = 60;
          tooltip = true;
          format = "{:%H.%M}";
          tooltip-format = "{:%a, %d-%m-%Y}";
        };
        "custom/power" = {
          format = " pwr";
          tooltip = false;
          on-click = "wlogout -b 2";
        };
      };
    };
  };
}
