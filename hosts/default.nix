{lib, inputs, user, ...}:

aamorim-latitude = lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    inputs.stylix.nixosModules.stylix
    ./home/apps/stylix
    inputs.nixos-hardware.nixosModules.dell-latitude-7420
    ./configuration.nix
    
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {
          inherit inputs.nvf;
        };
      };
      

      home-manager.users.aamorim = import ./latitude/home.nix;

      # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
    }
  ];
};