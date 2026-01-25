{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../nixos/configuration.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "48b5becd-f98c-4897-98aa-be37eecb6a68";
  environment.systemPackages = with pkgs; [
    kdePackages.kolourpaint
    legendary-gl
    rare
    zls
    cava
    quickshell
    spotify-qt
  ];
}
