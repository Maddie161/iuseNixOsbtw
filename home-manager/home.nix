{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./waybar.nix
  ];
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
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      cursor_trail = 0;
      cursor_shape = "beam";
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
      background_opacity = "0.5";
      background_blur = 5;
      symbol_map = let
      in
        (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";
    };
  };
}
