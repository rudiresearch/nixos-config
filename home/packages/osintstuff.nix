{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # image utilities
    exiftool
    gimp
    imagemagick

    # privacy
    tor-browser
    mullvad-vpn


    # OSINT Tools
    ghunt # check for gmail account
    holehe # check emails across various sites
    instaloader
    python312Packages.browser-cookie3 # needed for instaloader cookie-extraction
    metasploit
    maigret
    recon-ng
    sherlock
    subfinder
    theharvester

    # utilities
    sqlitebrowser
    yt-dlp
  ];
}
