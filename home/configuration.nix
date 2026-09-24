{ config, pkgs, ... }:

{
  imports = [
    ./fish/fish.nix
    ./ghostty/ghostty.nix
    ./sway/sway.nix
    ./librewolf/librewolf.nix
    ./i3status-rust/i3status-rust.nix
    ./flameshot/flameshot.nix
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
    vscodium
    microfetch
    nerd-fonts.iosevka
    zoxide # maybe it does not work on fish
    spotify
    grim
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
