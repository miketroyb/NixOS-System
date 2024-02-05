{
  users.users.anon = {
    isNormalUser = true;
    description = "anon";
    home = "/home/anon";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
  };
}

