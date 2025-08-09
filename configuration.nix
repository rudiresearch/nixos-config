
{ config, pkgs, lib, callPackage, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./stylix.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Enable networking
  networking.hostName = "rudibox"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the xfce and i3 
  services.xserver = {
    enable = true;   
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    xkb = {
      layout = "us";
      variant = "";
      # https://gist.github.com/jatcwang/ae3b7019f219b8cdc6798329108c9aee
      options = "caps:escape";
    };
    windowManager.i3.enable = true;
  };

  services.displayManager.defaultSession = "xfce+i3";

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User account
  users.users.rudi = {
    isNormalUser = true;
    description = "rudi";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.hack
  ];


  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      interactiveShellInit = ''
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      '';
      
      shellAliases = {
        ll = "ls -l"; 
      };

    };

    chromium = {
      enable = true; 
      extensions = [
        # "nngceckbapebfimnlniiiahkandclblb" # bitwarden
        "edibdbjcniadpccecjdfdjjppcpchdlm" # I still don't care about cookies
        "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
        "jinjaccalgkegednnccohejagnlnfdag" # Violentmonkey
      ];
    };

    firefox.enable = true;

    vim = {
      defaultEditor = true;
      enable = true;
    };
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # include flakes
  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  # load xfce4-panel config
  environment.etc."xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml".source =  ./assets/xfce4-panel.xml;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    vlc # Open source video player built with Qt/QML and libmpv
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?

}
