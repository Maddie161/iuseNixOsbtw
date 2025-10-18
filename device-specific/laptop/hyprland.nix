{ pkgs, lib, inputs, ... }: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swaync"
      "blueman-applet"
      "waybar"
      "hyprsunset -t 4500 -g 20"
      "kitty nu -e nu ~Documents/wifi.nu"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    ];
  };
}
