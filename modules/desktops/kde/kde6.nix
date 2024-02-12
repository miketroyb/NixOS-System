{
  services.xserver.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  qt.platformTheme = "kde";
  services.avahi.nssmdns6 = true;
  users.users.anon = {
    isNormalUser = true;
    description = "anon";
    home = "/home/anon-kde-exp";
    extraGroups = [ "networkmanager" "jellyfin" "wheel" "adbusers" ];
  };
}
