{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;
    profiles.default = {
      userSettings.editor.fontFamily = "Iosevka Nerd Font";
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
      ];
    };
  };
}
