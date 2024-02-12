{
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
  users.users.anon = {
    isNormalUser = true;
    description = "anon";
    home = "/home/anon-kde";
    extraGroups = [ "networkmanager" "jellyfin" "wheel" "adbusers" ];
  };
}
