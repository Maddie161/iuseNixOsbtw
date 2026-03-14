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
    spotify-qt
    zoom-us
    bottles-unwrapped
  ];
  programs.nix-ld.libraries = with pkgs; [
    icu.dev
    icu
    fontconfig
    freetype
    libpng
    libjpeg
    libwebp
    libglvnd # For OpenGL/GLX support if needed
    xorg.libSM
    xorg.libICE
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libXt
    xorg.libXdmcp
    xorg.libXau
    # Add skia's other common deps
    expat
    zlib
    libxml2
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];
}
