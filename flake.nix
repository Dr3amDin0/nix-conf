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

    outputs = inputs:
    inputs.snowfall-lib.mkFlake {
        inherit inputs;

        src = .|.;

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

    };
}