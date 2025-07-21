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
          calendar = {
            mode = "month";
            weeks-pos = "right";
            on-scroll = "1";
            "format" = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          "actions" = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down"
          };
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
