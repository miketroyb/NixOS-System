{ config, pkgs,  ... }:

{ 
  home.username = "anon";
  home.homeDirectory = "/home/anon";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = false;

  home.packages = with pkgs; [ 
  	## Desktop agnostic apps
  	keepassxc ungoogled-chromium 
        firefox megasync libreoffice 
        ranger fd fzf git rofi-wayland
        wl-clipboard flatpak
        libsForQt5.okular thunderbird google-chrome
        openrgb-with-all-plugins blackbox-terminal 
        protonmail-bridge
        gimp-with-plugins htop
	freetube whois
	## Gnome specific apps
        gnome.gnome-tweaks adw-gtk3
        gnome.gnome-software gnome-extension-manager
        gnomeExtensions.paperwm 
        gnomeExtensions.unmess 
        gnomeExtensions.workspaces-indicator-by-open-apps 
        gnomeExtensions.window-state-manager 
        gnomeExtensions.dash-to-panel 
        gnomeExtensions.extension-list 
        gnomeExtensions.night-theme-switcher 
        gnomeExtensions.custom-accent-colors 
        gnomeExtensions.caffeine 
        gnomeExtensions.blur-my-shell 
        gnomeExtensions.bluetooth-quick-connect 
        gnomeExtensions.alphabetical-app-grid 
        gnomeExtensions.gsconnect
        gnomeExtensions.pop-shell
        gnomecast qgnomeplatform
	## kde specific apps
	latte-dock
	libsForQt5.skanlite libsForQt5.accounts-qt
        libsForQt5.skanpage libsForQt5.filelight 
        libsForQt5.kgpg libsForQt5.merkuro
        gnupg libsForQt5.kcalc
        libsForQt5.kaccounts-integration
        libsForQt5.kaccounts-providers
        libsForQt5.kio-gdrive
        libsForQt5.okular
    ];
}

