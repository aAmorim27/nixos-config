{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-25.05";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nvf, nixos-hardware, ... }: {
    nixosConfigurations = {
      aamorim-latitude = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          inputs.stylix.nixosModules.stylix
          # TODO: TO MOVE ONCE CONFIGS PER HOSTS ARE DONE
          nixos-hardware.nixosModules.dell-latitude-7420
          ./configuration.nix
          # inputs.nvf.homeManagerModules.default
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit nvf;
            };

            home-manager.users.aamorim = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
      };
    };
  };
}
