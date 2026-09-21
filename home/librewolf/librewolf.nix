{ pkgs, ... }:

let
  font = "Iosevka Nerd Font";
in {
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    profiles.default = {
      settings = {
        "browser.uiCustomization.state" = builtins.toJSON {
          vertical-tabs = [];
        };
      };
    };
  };
}
