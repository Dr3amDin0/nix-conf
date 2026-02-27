{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      src = ./.;

      snowfall = {
        namespace = "nyxia";
        meta = {
          name = "nyxia";
          title = "nyxia";
        };
      };

      channels-config = {
        allowUnfree = true;
      };

	  nixosModules = [
  		({ 	config, pkgs, ... }: {
    	boot.loader.limine.enable = true;
		boot.loader.limine.secureBoot.enable = true;
    	boot.loader.grub.enable = false; # optional
  			})
  		];
	};
}
