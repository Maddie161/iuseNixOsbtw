{
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      # exec-once should be a single string with commands separated by newlines
      exec-once = ''
        swaync
        blueman-applet
        waybar
        hyprsunset -t 4500 -g 10
        ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1
      '';
    };
  };

}
