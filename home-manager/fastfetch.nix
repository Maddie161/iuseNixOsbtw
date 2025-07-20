{
  pkgs,
  lib,
  ...
}: {
programs.fastfetch = {
  enable = true
  settings = {
    logo = {
     source = "~/images/fetch_images/fetch.png";
      type = "kitty";
    };
  };
}
