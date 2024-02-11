{ pkgs, ... }:

{

fonts.packages = with pkgs; [
  noto-fonts
  inter
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
];

}
