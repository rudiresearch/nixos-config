{ pkgs, config, ... }:
{
  stylix.enable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";

  stylix.fonts = {
    serif = {
      package = pkgs.ubuntu_font_family;
      name = "Ubuntu";
    };
    sansSerif = {
      package = pkgs.ubuntu_font_family;
      name = "Ubuntu";
    };
    monospace = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font Mono";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
    sizes = {
      terminal = 10;
    };
  };

}
