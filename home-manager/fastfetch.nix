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
    };
  };
}
