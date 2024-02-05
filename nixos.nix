let
  overlay = import ./overlay.nix;
in {
  imports = [
    ./modules/services/x11/desktop-managers/plasma6.nix
  ];

  nixpkgs.overlays = [overlay];
}
