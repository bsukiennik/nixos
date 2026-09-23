{ ... }:

{
  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        blocks = [
          {
            block = "music";
            player = "spotify";
            format = "󰓇  $combo";
            click = [
              {
                button = "down";
                action = "volume_up";
              }
              {
                button = "up";
                action = "volume_down";
              }
            ];
          }
          {
            block = "custom";
            command = "echo 󰂯";
            interval = "once";
            click = [
              {
                button = "left";
                sync = true;
                update = true;
                cmd = "ghostty -e bluetoothctl";
              }
            ];
          }
          {
            block = "custom";
            command = "echo \"󰁹 $(cat /sys/class/power_supply/BAT0/capacity)%\"";
            interval = 10;
          }
          {
            block = "custom";
            command = "echo \"󰤨 \"";
            interval = "once";
            click = [
              {
                button = "left";
                sync = true;
                update = true;
                cmd = "ghostty -e nmtui";
              }
            ];
          }
          {
            block = "custom";
            command = "date +\"%d-%m-%y %H:%M:%S\"";
            interval = 1;
          }
          {
            block = "custom";
            command = "echo \" \"";
            interval = "once";
            click = [
              {
                button = "left";
                sync = true;
                update = true;
                cmd = "poweroff";
              }
            ]; 
          }
        ];
        settings = {
          theme = {
            overrides = {
              idle_bg = "#1F2331";
              separator = "";
              separator_bg = "#1F2331";
              info_bg = "#1F2331";
            };
          };
        };
      };
    };
  };
}