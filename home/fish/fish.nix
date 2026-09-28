{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    plugins = [
      { name = "pure"; src = pkgs.fishPlugins.pure.src; } # Prompt
    ];
    functions = {
      fish_greeting = ''
      '';
    };
  };

  home.shellAliases = {
    z = "zoxide";
    fetch = "microfetch";
  };
}
