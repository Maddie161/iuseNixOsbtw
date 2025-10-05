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
        "/home/maddie/Pictures/backrounds/wallpaper.png"
      ];
      wallpaper = [
        "eDP-1, /home/maddie/Pictures/backrounds/wallpaper.png"
      ];
    };
  };
}
