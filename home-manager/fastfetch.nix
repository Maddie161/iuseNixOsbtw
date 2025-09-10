{
  pkgs,
  lib,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      #logo = {
       # source = "/home/maddie/Pictures/backrounds/fastfetch.png";
        #type = "kitty";
        #};
      modules = [
        {
          type = "os";
          key = " ";
          keyColor = "#800080";
        }
        {
          type = "packages";
          key = " ";
          keyColor = "#800080";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "#800080";
        }
        {
          type = "terminal";
          key = " ";
          keyColor = "#800080";
        }
        {
          type = "wm";
          key = "wm";
          keyColor = "#800080";
        }
        "break"
        {
          type = "uptime";
          key = " ";
          keyColor = "#800080";
        }
      ];
    };
  };
}
