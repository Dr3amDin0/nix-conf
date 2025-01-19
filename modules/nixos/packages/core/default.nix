{ options, config, lib, pkgs, ...}:

with lib;
with lib.types;
let
	cfg = config.nyxia.packages.utils;
in
{
	options.nyxia.packages.utils.enable = mkOption {
		type = bool;
		default = false;
	};
	
    config = mkIf cfg.enable {
		environment.systemPackages = with "packages.";[
            neovim
        ];
        
    };
}