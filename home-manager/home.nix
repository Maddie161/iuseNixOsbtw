{
  pkgs,
  lib,
  ...
}: {
  home = {
    username = "maddie";
    homeDirectory = "/home/maddie";
  };
  home.stateVersion = "23.05";
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
