{ ... }:

let
  artist = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 2 \"artist\"|egrep -v \"artist\"|egrep -v \"array\"|cut -b 27-|cut -d '\"' -f 1";
  album = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 1 \"album\"|egrep -v \"album\"|cut -b 44-|cut -d '\"' -f 1";
  title = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 1 \"title\"|egrep -v \"title\"|cut -b 44-|cut -d '\"' -f 1";
  test = "dbus-send --session --dest=org.mpris.MediaPlayer2.spotify --type=method_call --print-reply /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata >/dev/null 2>&1";
in {
  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        blocks = [
          {
            block = "custom";
            command = ''
              if ${test}; then
                echo "󰓇  $(${artist}) | $(${album}) | $(${title})"
              fi
            '';
            interval = 1;
            click = [
              {
                button = "left";
                sync = true;
                update = true;
                cmd = "dbus-send --session --type=method_call --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause";
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