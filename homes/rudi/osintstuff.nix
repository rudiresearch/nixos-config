{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # security
    clamav
    clamtk
    veracrypt

    # image utilities
    exiftool
    gimp
    inkscape-with-extensions
    imagemagick
    pix

    # privacy
    tor-browser
    mullvad-vpn


    # utilities
    bulky
    qbittorrent
    qgis-ltr
    telegram-desktop
  ];
}

