{
  pkgs,
  lib,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "/home/maddie/Pictures/backrounds/fastfetch.png";
        type = "kitty";
        logo-position = "bottom"
        };
      modules = [
        {
          type = "os";
          key = " ";
          keyColor = "light_blue";
        }
        {
          type = "packages";
          key = " ";
          keyColor = "light_blue";
        }
        "break"
        {
          type = "shell";
          key = " ";
          keyColor = "#008000";
        }
        {
          type = "terminal";
          key = " ";
          keyColor = "#008000";
        }
        "break"
        {
          type = "wm";
          key = "wm";
          keyColor = "#800080";
        }
        {
          type = "uptime";
          key = " ";
          keyColor = "#800080";
        }
      ];
    };
  };
}
