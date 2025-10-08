{
  pkgs,
  lib,
  catppuccin,
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
  programs.git = {
    enable = true;
    userName = "maddie";
    userEmail = "madelinebold@gmail.com";
    extraConfig = {
      pull.rebase = "true";
    };
  };
  catppuccin.flavor = "mocha";
    catppuccin.cursors = {
      enable = true;
      flavor = "latte";
      accent = "mauve";
    };
  catppuccin.zed.enable = false;
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
    exec-once = [
      "swaync"
      "waybar"
      "hyprsunset --temperature 4500 -g 10"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    ];
  };

  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
  };
}
