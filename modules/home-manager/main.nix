{ config, pkgs, ... }:

{ 
  home.username = "anon";
  home.homeDirectory = "/home/anon";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = false;

  home.packages = [ 
  	## Desktop agnostic apps
  	pkgs.keepassxc pkgs.ungoogled-chromium 
        pkgs.firefox pkgs.megasync pkgs.libreoffice 
        pkgs.ranger pkgs.fd pkgs.fzf pkgs.git 
        pkgs.wl-clipboard pkgs.flatpak
        pkgs.libsForQt5.okular pkgs.thunderbird pkgs.google-chrome
        pkgs.openrgb-with-all-plugins pkgs.blackbox-terminal 
        pkgs.protonmail-bridge pkgs.rofi
        pkgs.gimp-with-plugins pkgs.htop
	pkgs.freetube
	## Gnome specific apps
        pkgs.gnome.gnome-tweaks pkgs.adw-gtk3
        pkgs.gnome.gnome-software pkgs.gnome-extension-manager
        pkgs.gnomeExtensions.paperwm 
        pkgs.gnomeExtensions.unmess 
        pkgs.gnomeExtensions.workspaces-indicator-by-open-apps 
        pkgs.gnomeExtensions.window-state-manager 
        pkgs.gnomeExtensions.dash-to-panel 
        pkgs.gnomeExtensions.extension-list 
        pkgs.gnomeExtensions.night-theme-switcher 
        pkgs.gnomeExtensions.custom-accent-colors 
        pkgs.gnomeExtensions.caffeine 
        pkgs.gnomeExtensions.blur-my-shell 
        pkgs.gnomeExtensions.bluetooth-quick-connect 
        pkgs.gnomeExtensions.alphabetical-app-grid 
        pkgs.gnomeExtensions.gsconnect
        pkgs.gnomeExtensions.pop-shell
        pkgs.gnomecast pkgs.qgnomeplatform
	## kde specific apps
	pkgs.latte-dock
	pkgs.libsForQt5.skanlite pkgs.libsForQt5.accounts-qt
        pkgs.libsForQt5.skanpage pkgs.libsForQt5.filelight 
        pkgs.libsForQt5.kgpg
        pkgs.gnupg pkgs.libsForQt5.kcalc
        pkgs.libsForQt5.kaccounts-integration
        pkgs.libsForQt5.kaccounts-providers
        pkgs.libsForQt5.kio-gdrive
        pkgs.libsForQt5.okular
    ];
}

