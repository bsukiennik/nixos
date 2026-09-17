{
  description = "Nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };    
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.default
          {
            home-manager = {
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.bassme = ./home/configuration.nix;
            };
          }
        ];
      };
    };
  };
}
