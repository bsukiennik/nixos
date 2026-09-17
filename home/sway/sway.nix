{ ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      input."*".xkb_layout = "fr";

      modifier = "Mod4";

      terminal = "ghostty"; 

      output."*".bg = "${./minimal-landscape.jpg} fill";
    };
  };

  home.file."minimal-landscape.jpg" = {
    source = ./minimal-landscape.jpg;
    target = ".config/sway/wallpapers/minimal-landscape.jpg";
  };
}
