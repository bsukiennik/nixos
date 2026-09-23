{ lib, ... }:

let
  fonts =  {
    names = [ "Iosevka Nerd Font" ];
    size = 8.0;
  };

  wallapaper = "a_flower_on_a_dark_background.png";

  terminal = "ghostty";
  lock = "swaylock -i ${./${wallapaper}} --indicator-x-position 960 --indicator-y-position 900";
  menu = "wmenu-run";
in {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      inherit fonts;

      input = {
        "type:keyboard" = {
          xkb_layout = "fr";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
        };
      };

      output = {
        "*".bg = "${./${wallapaper}} fill";
        "eDP-1" = {
          position = "0 0";
        };
        "HDMI-A-1" = {
          position = "0 -1080";
        };
      };

      modifier = "Mod4";

      window = {
        border = 1;
        titlebar = false;
      };

      colors = {
        focused = {
          background = "#FFFFFF";
          border = "#E56064";
          childBorder = "#E56064";
          text = "#FFFFFF";
          indicator = "#E56064";
        };
        focusedInactive = {
          background = "#FFFFFF";
          border = "#1F2331";
          childBorder = "#1F2331";
          text = "#FFFFFF";
          indicator = "#1F2331";
        };
        placeholder = {
          background = "#FFFFFF";
          border = "#1F2331";
          childBorder = "#1F2331";
          text = "#FFFFFF";
          indicator = "#1F2331";
        };
        unfocused = {
          background = "#FFFFFF";
          border = "#1F2331";
          childBorder = "#1F2331";
          text = "#FFFFFF";
          indicator = "#1F2331";
        };
      };

      keybindings = {
        "${modifier}+q" = "kill";

        "${modifier}+f" = "fullscreen toggle";

        "${modifier}+l" = "exec ${lock}";
        "${modifier}+d" = "exec ${menu}";
        "${modifier}+Return" = "exec ${terminal}";

        "${modifier}+Left" = "focus left";
        "${modifier}+Right" = "focus right";
        "${modifier}+Up" = "focus up";
        "${modifier}+Down" = "focus down";

        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Down" = "move down";

        "${modifier}+Ctrl+Left" = "workspace prev";
        "${modifier}+Ctrl+Right" = "workspace next";

        "${modifier}+Ctrl+Shift+Left" = "move container to workspace prev";
        "${modifier}+Ctrl+Shift+Right" = "move container to workspace next";

        "${modifier}+ampersand" = "workspace number 1";
        "${modifier}+eacute" = "workspace number 2";
        "${modifier}+quotedbl" = "workspace number 3";
        "${modifier}+apostrophe" = "workspace number 4";
        "${modifier}+parenleft" = "workspace number 5";
        "${modifier}+minus" = "workspace number 6";
        "${modifier}+egrave" = "workspace number 7";
        "${modifier}+underscore" = "workspace number 8";
        "${modifier}+ccedilla" = "workspace number 9";
        "${modifier}+agrave" = "workspace number 10";

        "${modifier}+Shift+ampersand" = "move container to workspace number 1";
        "${modifier}+Shift+eacute" = "move container to workspace number 2";
        "${modifier}+Shift+quotedbl" = "move container to workspace number 3";
        "${modifier}+Shift+apostrophe" = "move container to workspace number 4";
        "${modifier}+Shift+parenleft" = "move container to workspace number 5";
        "${modifier}+Shift+minus" = "move container to workspace number 6";
        "${modifier}+Shift+egrave" = "move container to workspace number 7";
        "${modifier}+Shift+underscore" = "move container to workspace number 8";
        "${modifier}+Shift+ccedilla" = "move container to workspace number 9";
        "${modifier}+Shift+agrave" = "move container to workspace number 10";

        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'Do you want to logout?' -b 'Yes' 'swaymsg exit'";

        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
      };

      bars = [
        {
          statusCommand = "i3status-rs ~/.config/i3status-rust/config-bottom.toml";
          fonts = {
            names = [
              "Iosevka Nerd Font"
            ];
            size = 10.0;
          };
          position = "bottom";
          colors = {
            background = "#1F2331";
            separator = "#1F2331";
            statusline = "#E56064";

            activeWorkspace = {
              border = "#333a53";
              background = "#1F2331";
              text = "#93A1A1";
            };
            focusedWorkspace = {
              border = "#E56064";
              background = "#e5606489";
              text = "#93A1A1";
            };
            inactiveWorkspace = {
              border = "#333a53";
              background = "#1F2331";
              text = "#93A1A1";
            };
            urgentWorkspace = {
              border = "#E56064";
              background = "#e5606489";
              text = "#93A1A1";
            };
          };
        }
      ];
    };

    extraConfig = ''
      bindgesture swipe:right workspace prev
      bindgesture swipe:left workspace next
    '';
  };
}
