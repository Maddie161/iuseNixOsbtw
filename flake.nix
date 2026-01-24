{
  description = "nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgsstable24.url = "github:NixOS/nixpkgs/nixos-24.05";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      #inputs.quickshell.follows = "quickshell"; # Use same quickshell version
    };
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgsstable24,
    home-manager,
    hyprland,
    quickshell,
    noctalia,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./device-specific/laptop/configuration.nix
        ];
      };

      "48b5becd-f98c-4897-98aa-be37eecb6a68" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./device-specific/desktop/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "maddie@laptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./device-specific/laptop/home.nix
          ./device-specific/laptop/hyprland.nix
        ];
      };

      "maddie@48b5becd-f98c-4897-98aa-be37eecb6a68" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./device-specific/desktop/home.nix
          ./device-specific/desktop/hyprland.nix
        ];
      };
    };
  };
}
