{ config, pkgs, ... }:

{
  imports = [    
  ];

  home = {
    username = "bassme";
    homeDirectory = "/home/bassme";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home.packages = with pkgs; [
    tree
    vim
    git
  ];

  programs.fish.enable = true;

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
  };

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "ghostty"; 
      startup = [
        # Launch Firefox on start
        #{command = "firefox";}
      ];
    };
  };

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
