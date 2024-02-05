final: prev:
{
  linuxPackages_testing = prev.linuxPackages_testing.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      (prev.fetchpatch {
        url = "https://raw.githubusercontent.com/firelzrd/bore-scheduler/main/patches/linux-6.7-bore/0001-linux6.7.y-bore4.1.1.patch";
        hash = "";
      })
    ];
  });
}
