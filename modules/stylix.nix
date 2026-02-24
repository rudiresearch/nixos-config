{ pkgs, config, ... }:
{
  stylix = { 
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
    fonts = {
      serif = {
        package = pkgs.ubuntu-classic;
        name = "Ubuntu";
      };
      sansSerif = {
        package = pkgs.ubuntu-classic;
        name = "Ubuntu";
      };
      monospace = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        terminal = 10;
      };
    };
  };
}
