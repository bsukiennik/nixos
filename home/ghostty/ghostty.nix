{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      command = "fish";
      font-family = "Iosevka Nerd Font";
      font-size = "16";
      background-opacity = 0.5;
      background-blur = 15;
      theme = "Iceberg Dark";
    };
  };
}
