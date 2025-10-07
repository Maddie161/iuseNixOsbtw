{
  pkgs,
  lib,
  inputs,
  ...
}: {
  exec-once = [
    "swaync"
    "waybar"
    "hyprsunset --temperature 4500 -g 10"
    "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
  ];
}
