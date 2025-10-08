{
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "swaync"
        "discordptb"
        "steam"
        "firefox"
        "blueman-applet"
        "waybar"
        "hyprsunset -t 4500"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      ];
    };
  };
}
