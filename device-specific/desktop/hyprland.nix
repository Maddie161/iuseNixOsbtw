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
      "blueman-applet"
      "steam"
      "firefox"
      "discordptb"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      "spotify"
      "noctalia-shell"
      "wl-paste --watch cliphist store"
    ];
  };
}
