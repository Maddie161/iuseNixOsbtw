{
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swaync"
      "blueman-applet"
      "waybar"
      "steam"
      "firefox"
      "hyprsunset -t 4500"
      "discordptb"
      "blueman-manager"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    ];
  };
}
