{ config, pkgs, ... }:
{

fonts = {
  enableDefaultPackages = true;

  fontconfig =  {
    antialias = true;
    hinting = {
      enable = true;
      style = "slight"; # none, slight, medium, full
    };
    subpixel = {
      rgba = "rgb";
      lcdfilter = "default";
    };
  };

  packages = with pkgs; [
    inter
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    roboto
    open-sans
    source-sans-pro
    dejavu_fonts
    jetbrains-mono
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.jetbrains-mono
  ]; #++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
};

}
