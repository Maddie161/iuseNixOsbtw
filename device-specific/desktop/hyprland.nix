{
  pkgs,
  lib,
  inputs,
  ...
}: {
  exec-once = [
    "swaync"
    "discordptb"
    "steam"
    "firefox"
    "blueman-applet"
    "waybar"
    "spotify"
    "hyprsunset --temperature 4500"
    "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
  ];
}
