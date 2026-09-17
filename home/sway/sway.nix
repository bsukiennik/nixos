{ ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      input."*".xkb_layout = "fr";

      modifier = "Mod4";

      terminal = "ghostty"; 
    };
  };
}
