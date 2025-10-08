{
  pkgs,
  lib,
  inputs,
  ...
}: {
  settings = {
    exec-once = [
      "swaync"
      "discordptb"
      "steam"
      "firefox"
      "blueman-applet"
      "waybar"
      "hyprsunset --temperature 4500"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    ];
  }
}
