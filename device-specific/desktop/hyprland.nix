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
      "blueman-manager"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      "spotify"
      "noctalia"
    ];
  };
}
