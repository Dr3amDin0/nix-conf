{ options, config, lib, pkgs, ...}:

with lib;
with lib.types;

let
	cfg = config.nyxia.packages.core;
in
{
	options.nyxia.packages.core.enable = mkOption {
		type = bool;
		default = false;
	};

	config = mkIf cfg.enable {
		nyxia.packages.neovim.enable = true;
		nyxia.packages.firefox.enable = true;
	
	environment.systemPackages = with pkgs;[
			openssh
        	kitty
			fish
			spotify
			vesktop
        ];

	};

}

