{ options, config, lib, pkgs, ... }:

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
    nyxia.packages.pipewire.enable = true;
    services.dbus.enable = true;

    environment.systemPackages = with pkgs;[
      openssh
      steam
      rofi
      alacritty
      fish
      spotify
      vesktop
      protonup-qt
      firefox
      vscode
    ];
  };
}

