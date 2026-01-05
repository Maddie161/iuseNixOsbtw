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
          "cava"
        ];
        modules-right = [
          "tray"
          "clock"
        ];
        clock = {
          interval = 60;
          tooltip = true;
          format = "{:%H.%M}";
          tooltip-format = "{:%a, %d-%m-%Y}";
        };
        "cava" = {
          framerate = 30;
          autosens = 1;
          sensitivity = 100;
          bars = 8;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          hide_on_silence = false;
          method = "pipewire";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = true;
          waves = true;
          noise_reduction = 0.77;
          input_delay = 2;
          format-icons = "▁▂▃▄▅▆▇█";
          on-click-right = "mode";
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
