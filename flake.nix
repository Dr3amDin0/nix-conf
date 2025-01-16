{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };
    
    home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};

    snowfall-lib = {
            url = "github:snowfallorg/lib";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs:
    inputs.snowfall-lib.mkFlake {
        inherit inputs;

        src = .|.;

        snowfall = {
            namespace = "dr3amnyx";
            meta = {
                name = "dr3amnyx";
                title = "dr3amnyx";
            };
        };

        channels-config = {
            allowUnfree = true;
        };

    };
}