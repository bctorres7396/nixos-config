

  {
    description = "Ben's NixOS config";

    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";

      catppuccin = {
        url = "github:catppuccin/nix";
        inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... }: {
    nixosConfigurations.nixlaptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/nixlaptop/configuration.nix
        home-manager.nixosModules.home-manager
        catppuccin.nixosModules.catppuccin
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ben = import ./home/ben.nix;
        }
      ];
     };
    };
  }
