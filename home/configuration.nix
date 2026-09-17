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

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
