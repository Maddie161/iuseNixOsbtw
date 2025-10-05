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
      monitors = {
        "DP-3" = {
          path = "~/Pictures/backrounds/wallpaper.png";
        style = "fill";
      };
    };
  };
}
