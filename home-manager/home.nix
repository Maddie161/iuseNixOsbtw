{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./fastfetch.nix
  ];
  home = {
    username = "maddie";
    homeDirectory = "/home/maddie";
  };
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  programs.git.settings = {
    enable = true;
    pull.rebase = "true";
    user.name = "maddie";
    user.email = "madelinebold161@gmail.com";
  };

  programs.kitty = {
    enable = true;
    settings = {
      cursor_trail = 1;
      cursor_shape = "beam";
      confirm_os_window_close = 0;
      background_opacity = 0.75;
      enable_audio_bell = false;
      window_padding_width = 10;
      shell = "nu";
      notify_on_cmd_finish = "unfocused";
    };
  };

  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
  };
}
