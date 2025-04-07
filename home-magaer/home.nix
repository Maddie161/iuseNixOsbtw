{
  pkgs,
  lib,
  ...
}: {
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "maddie";
    userEmail = "egonbold@gmx.de";
    extraConfig = {
      pull.rebase = "true";
    };
  };
}