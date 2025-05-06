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

  <<<<<<< HEAD
    config = mkIf cfg.enable {
    nyxia.packages.neovim.enable = true;
    nyxia.packages.firefox.enable = true;
    =======
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
      >>>>>>> a5baeb0b901d955967b5809f3e08cbb641b0a051

        environment.systemPackages = with pkgs;[
        openssh
        alacritty
        fish
        spotify
        vesktop
        steam
        protonup-qt
        firefox
      ];

    };

  }

