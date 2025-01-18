{ options, config, lib, pkgs, ...}:

with lib;
with lib.types;
let
	cfg = config.nyxia.packages.neovim;
in
{

options.nyxia.packages.neovim.enable = mkOption {
		type = bool;
		default = false;
	};

    config = mkIf cfg.enable {
        programs.nix-ld.enable = true;
		programs.neovim = {
			enable = true;
			defaultEditor = true;
			viAlias = true;
			vimAlias = true;
        };
    };

}