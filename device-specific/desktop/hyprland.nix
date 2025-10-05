{
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Pictures/backrounds/wallpaper.png"
      ];
      wallpaper = [
        "DP-3, ~/Pictures/backrounds/wallpaper.png"
      ];
    };
  };
}
