{ pkgs, ... }:

{
  home.packages = with pkgs [
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
    mullvad
    mullvad-vpn


    # utilities
    bulky
    gvim
    qbittorrent
    qgis-ltr
    telegram-desktop
  ];
}

