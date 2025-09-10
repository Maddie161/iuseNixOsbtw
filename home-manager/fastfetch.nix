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
      };
      modules = [
        {
          type = "os";
          key = " ";
          keyColor = "pink";
        }
        {
          type = "packages";
          key = " ";
          keyColor = "pink";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "pink";
        }
        {
          type = "terminal";
          key = " ";
          keyColor = "pink";
        }
        {
          type = "wm";
          key = "wm";
          keyColor = "pink";
        }
        "break"
        {
          type = "uptime";
          key = " ";
          keyColor = "pink";
        }
      ];
    };
  };
}
