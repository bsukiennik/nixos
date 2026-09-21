{ ... }:

{
  # TODO configure this
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      font-family = "Iosevska Nerd Font";
      font-size = "14";
      background-opacity = 0.5;
      background-blur = 15;
      theme = "Iceberg Dark";
    };
  };
}
