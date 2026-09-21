{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      background-opacity = "0.70";
      background-blur = 90;
      font-family = "Iosevka Nerd Font";
      font-size = "15";
    };
  };
}
