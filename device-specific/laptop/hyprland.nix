{
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "blueman-applet"
      "noctalia-shell"
      "kitty nu -e fastfetch"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    ];
  };
}
