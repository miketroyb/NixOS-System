{ pkgs, ... }:
{
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  wineWowPackages.stable
  wine
  variety
  papirus-icon-theme
  jq
  qutebrowser
  stellarium
  jellyfin
  shell_gpt
  jellyfin-web
  jellyfin-ffmpeg
  openai-whisper
  chatgpt-cli
  deluge-gtk
  brave
  webtorrent_desktop
  neovim
  pinentry-qt
  ## Python packages
  python311Full
  python311Packages.pykeepass
  (chromium.override {
    commandLineArgs = "--load-media-router-component-extension=1";
      })
  ];
  programs = {
    kdeconnect = {
      enable = true;
    };

    ssh.askPassword = "${pkgs.x11_ssh_askpass}/libexec/x11-ssh-askpass";

    adb = {
	enable = true;
    };
  };
}
