{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/maddie/Pictures/picssssssssssss :3/for-when-you-didnt-ask-for-the-opinion-v0-tn5t402a895f1.webp"
      ];
      wallpaper = [
        "eDP-1, /home/maddie/Pictures/picssssssssssss :3/for-when-you-didnt-ask-for-the-opinion-v0-tn5t402a895f1.webp"
      ];
    };
  };
  programs.kitty.enable = true;
  # Variables for Hostnames
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = [
        "eDP-1, 1920x1080@120.15000, 0x0, 1"
      ];
      "$mod" = "SUPER";
      "$term" = ''
        kitty bash
      '';
      "$runner" = "wofi --show drun";
      "$screenshotter" = "hyprshot --mode region --clipboard-only";

      bind =
        [
          #focus moving
          "$mod, H, movefocus, l"

          "$mod, L, movefocus, r"

          "$mod, K, movefocus, u"

          "$mod, J, movefocus, d"

          #window moving
          "$mod SHIFT, H, movewindow, l"

          "$mod SHIFT, L, movewindow, r"

          "$mod SHIFT, K, movewindow, u"

          "$mod SHIFT, J, movewindow, d"

          "$mod CONTROL_L, L, resizeactive, -40 0"

          "$mod CONTROL_L, H, resizeactive, 40 0"

          "$mod CONTROL_L, K, resizeactive, 0 40"

          "$mod CONTROL_L, J, resizeactive, 0 -40"

          "$mod, T, exec, $term"

          "$mod, F, togglefloating"

          "$mod SHIFT, F, fullscreen"

          "$mod, Y, exec, kitty --class btop --hold -e btop"

          "$mod, B, exec, firefox"

          "$mod, D, exec, $runner"

          "$mod SHIFT, S, exec, $screenshotter"

          "$mod, Q, killactive,"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move app to] workspace {1..9}
          # also binds $mod {1..9} to move user to workspace {1..9}
          builtins.concatLists (
            builtins.genList (
              i:
              let
                ws = i + 1;
              in
              [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
              ]
            ) 9
          )
        );
      input = {
        kb_layout = [
          "de"
        ];
      };

      # mouse bindings
      bindm = [
        # move window
        "$mod, mouse:272, movewindow"
        # resize
        "$mod, mouse:273, resizewindow"
        # alt left click to also resize
        "$mod ALT, mouse:272, resizewindow"
      ];
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
      decoration = {
        inactive_opacity = 0.9;
      };
      general = {
        layout = "dwindle";
        "col.active_border" = "rgb(111,48,158)";
        border_size = 2;
      };
    };
  };
}
