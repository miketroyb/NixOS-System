{
  services.xserver.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  qt.platformTheme = "kde";
  programs.gnupg.agent.pinentryFlavor = "qt";
  services.avahi.nssmdns6 = true;
}
