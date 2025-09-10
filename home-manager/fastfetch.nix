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
                  keyColor = "purple";
                }
                {
                  type = "packages";
                  key = " ";
                  keyColor = "purple";
                }
                {
                  type = "shell";
                  key = " ";
                  keyColor = "purple";
                }
                {
                  type = "terminal";
                  key = " ";
                  keyColor = "purple";
                }
                {
                  type = "wm";
                  key = "wm";
                  keyColor = "purple";
                }
                "break"
                {
                  type = "uptime";
                  key = " ";
                  keyColor = "purple";
                }
      ]
    };
  };
}
