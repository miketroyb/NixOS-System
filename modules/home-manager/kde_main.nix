{ config, pkgs, lib, ... }:

{ 
  home.username = "anon";
  home.homeDirectory = lib.mkForce "/home/anon-kde" ;
  programs.home-manager.enable = true;

  home.packages = [ pkgs.keepassxc pkgs.ungoogled-chromium 
	pkgs.firefox pkgs.megasync pkgs.libreoffice 
	pkgs.ranger pkgs.fd pkgs.fzf pkgs.git 
	pkgs.wl-clipboard pkgs.adw-gtk3 pkgs.flatpak
	pkgs.libsForQt5.skanlite pkgs.libsForQt5.accounts-qt
	pkgs.libsForQt5.skanpage
	pkgs.libsForQt5.kgpg
	pkgs.gnupg
	pkgs.libsForQt5.kaccounts-integration
      	pkgs.libsForQt5.kaccounts-providers
      	pkgs.libsForQt5.kio-gdrive
	pkgs.libsForQt5.okular pkgs.thunderbird pkgs.google-chrome
	pkgs.openrgb-with-all-plugins pkgs.blackbox-terminal 
	pkgs.protonmail-bridge
	pkgs.gimp-with-plugins pkgs.htop
    ];
}
