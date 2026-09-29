{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;
    profiles.default = {
      userSettings.editor.fontFamily = "Iosevka Nerd Font";
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        llvm-vs-code-extensions.vscode-clangd
        shardulm94.trailing-spaces
      ];
    };
  };
}
