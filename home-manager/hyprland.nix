{
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Pictures/backrounds/wallpaper.png"
      ];
      wallpaper = [
        "DP-3, ~/Pictures/backrounds/wallpaper.png"
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
        kitty nu -e fastfetch
      '';
      "$runner" = ["noctolia-shell" "ipc" "call" "launcher" "toggle"];
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
              i: let
                ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
              ]
            )
            9
          )
        );
      input = {
        kb_layout = [
          "de"
        ];
      };
      windowrulev2 = [
        "tag +pip, title:(Picture.?in.?[Pp]icture)"
        "float, tag:pip"
        "pin, tag:pip"
        "size 600 338, tag:pip"
        "keepaspectratio, tag:pip"
        "noborder, tag:pip"
        "opacity 1 1, tag:pip"
        "move 100%-w-40 4%, tag:pip"
      ];
      # mouse bindings
      bindm = [
        # move window
        "$mod, mouse:272, movewindow"
        # resize
        "$mod, mouse:273, resizewindow"
        # alt left click to also resize
        "$mod ALT, mouse:272, resizewindow"
      ];
      decoration = {
        inactive_opacity = 0.969;
      };
      general = {
        layout = "dwindle";
        "col.active_border" = "rgb(111,48,158)";
        border_size = 2;
      };
    };
  };
}
