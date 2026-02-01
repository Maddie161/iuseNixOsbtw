{
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      #"swaync"
      #"waybar"
      #"hyprsunset -t 4500 -g 50"
      "blueman-applet"
      "noctalia-shell"
      "kitty nu -e fastfetch"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    ];
  };
}
