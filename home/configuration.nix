{ config, pkgs, ... }:

{
  imports = [
    ./fish/fish.nix
    ./ghostty/ghostty.nix
    ./sway/sway.nix
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
    vscodium
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "bsukiennik";
        email = "bastien.sukiennik@epitech.eu";
      };
    }; 
  };

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
