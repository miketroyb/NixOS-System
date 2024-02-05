{
  users.users.anon = {
    isNormalUser = true;
    description = "anon";
    home = "/home/anon-kde";
    extraGroups = [ "networkmanager" "jellyfin" "wheel" "adbusers" ];
  };
}
