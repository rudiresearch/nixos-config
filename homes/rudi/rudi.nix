{ config, pkgs, lib, ... }:

let
  gruvboxRainbow = pkgs.fetchurl {
    url = "https://starship.rs/presets/toml/gruvbox-rainbow.toml";
    sha256 = "0sjw2xzhxqamidfcn6d369skw2rfmyx3a45wz7ww3x7d6d25c1q3"; # Placeholder
  };
in

{
  imports = [
    ./gui
    ./packages
    ./terminal
    ./i3.nix
    ./rofi.nix
  ];

  home.username = "rudi";
  home.homeDirectory = "/home/rudi";
  home.file."Pictures/Screenshots/.keep".text = "";
  home.file.".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml".source = ./assets/xfce4-keyboard-shortcuts.xml;
  home.file.".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml".source = ./assets/xfce4-panel.xml;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    xfce.xfce4-panel

    # shell customization
    starship

    # Networking & Proxy Tools
    tor-browser-bundle-bin
    proxychains-ng
    nmap
    netcat
    curl
    wget
    whois
    dig
    tcpdump

    # OSINT Tools
    ghunt # check for gmail account
    holehe # check emails across various sites
    instaloader
    metasploit
    recon-ng
    sherlock
    subfinder
    theharvester

    # web scraping & automation
    python3
    python3Packages.requests
    python3Packages.beautifulsoup4
    python3Packages.selenium

    # Other tools
    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
  ];

  programs.chromium = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile gruvboxRainbow);
  };

  programs.vim = {
    enable = true;
    extraConfig = ''
      set tabstop=2        " Display tabs as 2 spaces
      set shiftwidth=2     " Indentation level
      set softtabstop=2    " Insert 2 spaces when pressing Tab
      set expandtab        " Convert tabs to spaces
    '';
  };

  services.copyq.enable = true;

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        showStartupLaunchMessage = true;
      };
    };
  };

  stylix.targets.starship.enable = false;
  stylix.targets.alacritty.enable = true;
  stylix.targets.xfce.enable = true;

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "rudi.research";
    userEmail = "rudi.research@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
