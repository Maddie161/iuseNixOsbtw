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
      "$term"
      "hyprsunset -t 4500"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    ];
  };
}
