# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, libs, options, ... }:

{
  ## Boot settings
  boot.kernelPackages = pkgs.linuxPackages_6_7;
  #boot.kernelPatches = [ {
  #		extraConfig = ''
  #
  #		'';

  #} ];
  boot.plymouth.enable = false;
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "bcachefs" ];
  boot.binfmt.registrations.appimage = {
  wrapInterpreterInShell = false;
  interpreter = "${pkgs.appimage-run}/bin/appimage-run";
  recognitionType = "magic";
  offset = 0;
  mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
  magicOrExtension = ''\x7fELF....AI\x02'';
  };
 
  ## Powermanager options
  hardware.i2c.enable = true;

  ## desktop related settings
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.sddm.enable = false;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Intel Video acceleration
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Enable chrome to use wayland
  nixpkgs.config.chromium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

  users.users.anon = {
    isNormalUser = true;
    description = "anon";
    home = "/home/anon";
    extraGroups = [ "networkmanager" "jellyfin" "wheel" "adbusers" ];
  };

  # Zram
  zramSwap.enable = true;
  
  # udev services
  services.udev.packages = [ 
  			    pkgs.openrgb 
			    pkgs.android-udev-rules
  				];
  # flatpak
  services.flatpak.enable = true;

  # Jellyfin media server
  services.jellyfin = {
  	enable = true;
	openFirewall = true;
	user = "anon";
	};
  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  # Enable services
  services.printing = {
  enable = true;
  drivers = with pkgs; [ 
    gutenprint 
    canon-cups-ufr2 
    cups-filters 
    hplip 
    hplipWithPlugin  
    ];
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Settings to enable nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  # Needed for netowrk discovery
  services.avahi.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # support from chrome-gnome-shell
  services.gnome.gnome-browser-connector.enable = true;

  # List packages installed in system profile. To search, run:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.gnupg.agent.enable = true;

  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 5353 ]; # For device discovery
    allowedUDPPortRanges = [{ from = 32768; to = 61000; }];   # For Streaming
    allowedTCPPorts = [ 8010 ];  # For gnomecast server
  };
 # virtualization
   virtualisation = {
	waydroid.enable = true;
	#anbox.enable = true;
   };

     nix.nixPath = [
    # Add the following to existing entries.
    "nixpkgs-overlays=/etc/nixos/overlays-compat/"
  ];
}
