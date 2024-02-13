{
  description = "My NixOS workstation configurationuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager-unstable.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { 
  self, 
  nixpkgs, 
  nixpkgs-unstable,
  home-manager, 
  home-manager-unstable, 
  ... 
  }@inputs: {
    nixosConfigurations = {
    system = "x86_64-linux";
      NixOS = nixpkgs.lib.nixosSystem {
        modules = [
          ./hardware/_main.nix
	  ./configuration.nix
	  ./modules/desktops/gnome/gnome.nix
	  ./modules/desktops/gnome/users-gnome.nix
	  ./modules/system/sysver-stable.nix
	  ./modules/system/syspkgs.nix
	  home-manager.nixosModules.home-manager {
	  	home-manager.useGlobalPkgs = true;
            	home-manager.useUserPackages = true;
            	home-manager.users.anon = {
              	home.stateVersion = "23.11";
              	imports = [ ./modules/home-manager/main.nix ];
            };
          }
        ];
      };
      NixOS-KDE = nixpkgs-unstable.lib.nixosSystem {
        modules = [
          ./hardware/_main.nix
	  ./configuration.nix
	  ./modules/desktops/kde/kde5.nix
	  ./modules/system/sysver-unstable.nix
	  ./modules/system/fonts.nix
	  ./modules/system/syspkgs.nix
          home-manager-unstable.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.anon = {
              imports = [ ./modules/home-manager/main.nix ];
              home.stateVersion = "24.05";
            };
          }
        ];
      };
    };
  };
}

