{ options, config, lib, pkgs, ...}:

with lib;
with lib.types;

let
	cfg = config.nyxia.packages.firefox;
in
{
	options.nyxia.packages.firefox.enable = mkOption {
		type = bool;
		default = false;
	};

    config = mkIf cfg.enable {
        environment.systemPackages = with pkgs;[
            firefox
        ];
    };
}