{ config, pkgs, ... }:

{
  imports = [
    ./sway/sway.nix
    ./ghostty/ghostty.nix
    ./fish/fish.nix
    ./librewolf/librewolf.nix
    ./vesktop/vesktop.nix
    ./vscodium/vscodium.nix
  ];

  home = {
    username = "bassme";
    homeDirectory = "/home/bassme";
  };

  gtk = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      size = 10;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home.packages = with pkgs; [
    tree
    vim
    microfetch
    nerd-fonts.iosevka
    zoxide # maybe it does not work on fish
    spotify
    clang
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
