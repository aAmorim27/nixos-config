{pkgs, config, ...}:
let
  noctalia = cmd: [
    "noctalia-shell" "ipc" "call"
  ] ++ (pkgs.lib.splitString " " cmd);
in
{
  home.packages = with pkgs; [
     xwayland-satellite
  ];
  programs.niri = {
    enable = true;
    settings = {
      spawn-at-startup = [
        {
          command = [
            "noctalia-shell"
          ];
        }
      ];
      environment = {
        "NIXOS_OZONE_WL" = "1";
        "DISPLAY" = ":0";
        "GTK_IM_MODULE" = "simple";
      };
      outputs = {
        eDP-1 = {
           scale=1;
        };
        "LG Electronics LG HDR WFHD 0x0000DF37" = {
           mode = {
              width=2560;
              height=1080;
              refresh=74.991;
           };
           transform = {
              rotation = 180;
           };
        };
        "LG Electronics LG HDR 4K 009NTABAU480" = {
           mode = {
              width=3840;
              height=2160;
              refresh=60.0;
           };
           scale=1.0;
        };
      };
      binds = with config.lib.niri.actions; {
        # noctalia-shell keybinds
        "Mod+Shift+ESCAPE".action.show-hotkey-overlay = [ ];

        # Applications
        "Mod+Return".action.spawn = "kitty";
        "Mod+Space".action.spawn = noctalia "launcher toggle";
        "Mod+B".action.spawn = "google-chrome-stable";
        "Mod+Shift+L".action.spawn = noctalia "lockScreen lock";
        "Mod+Shift+Q".action.spawn = noctalia "sessionMenu toggle";

        # Media Controls
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action.spawn = noctalia "volume increase";
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action.spawn = noctalia "volume decrease";
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          action.spawn = noctalia "volume muteOutput";
        };
        "XF86AudioMicMute" = {
          allow-when-locked = true;
          action.spawn = noctalia "volume muteInput";
        };
        "XF86AudioNext" = {
          allow-when-locked = true;
          action.spawn = noctalia "media next";
        };
        "XF86AudioPrev" = {
          allow-when-locked = true;
          action.spawn = noctalia "media previous";
        };
        "XF86AudioPlay" = {
          allow-when-locked = true;
          action.spawn = noctalia "media playPause";
        };
        "XF86AudioPause" = {
          allow-when-locked = true;
          action.spawn = noctalia "media playPause";
        };

        # Brightness Controls
        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          action.spawn = noctalia "brightness increase";
        };
        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          action.spawn = noctalia "brightness decrease";
        };

        # --- Window Movement and Focus ---
        "Mod+Q".action = close-window;
        "Mod+Left".action = focus-column-left;
        "Mod+H".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+L".action = focus-column-right;
        "Mod+Up".action = focus-window-up;
        "Mod+K".action = focus-window-up;
        "Mod+Down".action = focus-window-down;
        "Mod+J".action = focus-window-down;

        "Mod+CTRL+Left".action = move-column-left;
        "Mod+CTRL+H".action = move-column-left;
        "Mod+CTRL+Right".action = move-column-right;
        "Mod+CTRL+L".action = move-column-right;
        "Mod+CTRL+UP".action = move-window-up;
        "Mod+CTRL+K".action = move-window-up;
        "Mod+CTRL+Down".action = move-window-down;
        "Mod+CTRL+J".action = move-window-down;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+CTRL+Home".action = move-column-to-first;
        "Mod+CTRL+End".action = move-column-to-last;

        "Mod+Shift+Left".action = focus-monitor-left;
        "Mod+Shift+Right".action = focus-monitor-right;
        "Mod+Shift+UP".action = focus-monitor-up;
        "Mod+Shift+Down".action = focus-monitor-down;

        "Mod+Shift+CTRL+Left".action = move-column-to-monitor-left;
        "Mod+Shift+CTRL+Right".action = move-column-to-monitor-right;
        "Mod+Shift+CTRL+UP".action = move-column-to-monitor-up;
        "Mod+Shift+CTRL+Down".action = move-column-to-monitor-down;

        # --- Workspace Switching ---
        "Mod+WheelScrollDown" = { cooldown-ms = 150; action = focus-workspace-down; };
        "Mod+WheelScrollUp"   = { cooldown-ms = 150; action = focus-workspace-up; };
        "Mod+CTRL+WheelScrollDown" = { cooldown-ms = 150; action = move-column-to-workspace-down; };
        "Mod+CTRL+WheelScrollUp"   = { cooldown-ms = 150; action = move-column-to-workspace-up; };

        "Mod+WheelScrollRight".action = focus-column-right;
        "Mod+WheelScrollLeft".action = focus-column-left;
        "Mod+CTRL+WheelScrollRight".action = move-column-right;
        "Mod+CTRL+WheelScrollLeft".action = move-column-left;

        # --- Workspace Numbers ---
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        "Mod+CTRL+1".action.move-column-to-workspace = 1;
        "Mod+CTRL+2".action.move-column-to-workspace = 2;
        "Mod+CTRL+3".action.move-column-to-workspace = 3;
        "Mod+CTRL+4".action.move-column-to-workspace = 4;
        "Mod+CTRL+5".action.move-column-to-workspace = 5;
        "Mod+CTRL+6".action.move-column-to-workspace = 6;
        "Mod+CTRL+7".action.move-column-to-workspace = 7;
        "Mod+CTRL+8".action.move-column-to-workspace = 8;
        "Mod+CTRL+9".action.move-column-to-workspace = 9;        

        "Mod+TAB".action = focus-workspace-previous;

        # --- Layout Controls ---
        "Mod+CTRL+F".action = expand-column-to-available-width;
        "Mod+C".action = center-column;
        "Mod+CTRL+C".action = center-visible-columns;
        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";
        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";

        # --- Modes ---
        "Mod+T".action = toggle-window-floating;
        "Mod+F".action = fullscreen-window;
        "Mod+W".action = toggle-column-tabbed-display;

        # --- Screenshots ---
        "CTRL+Shift+1".action.screenshot = [ ];
        "CTRL+Shift+2".action.screenshot-screen = [ ];
        "CTRL+Shift+3".action.screenshot-window = [ ];

        # --- Emergency Escape ---
        "Mod+ESCAPE" = {
          allow-inhibiting = false;
          action = toggle-keyboard-shortcuts-inhibit;
        };

        # --- Exit / Power ---
        "CTRL+ALT+Delete".action = quit;
        "Mod+Shift+P".action = power-off-monitors;
        "Mod+O" = {
          repeat = false;
          action = toggle-overview;
        };
      }; 
    };
  };
}
