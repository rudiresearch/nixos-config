{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";
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

  environment = {
    systemPackages = with pkgs; [
      btop
      ifuse
      keepassxc
      libguestfs
      libimobiledevice # needed for iOS device connectivity 
      qemu
      spice-vdagent
      usbutils
      veracrypt
      vim
      virglrenderer
      virtualbox
      virt-manager
      virt-viewer
      wget
    ];
    variables = {
      TERMINAL = "alacritty";
    };
  };

  networking.networkmanager.enable = true;

  programs = {
    firefox.enable = true;
    git = {
      enable = true;
      config = {
        init = {
          defaultBranch = "main";
        };
      };
    };
    ssh.startAgent = true;
  };

  security.rtkit.enable = true;

  services = {
  
    printing.enable = true;
    mullvad-vpn.enable = true;
    
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    usbmuxd.enable = true; # needed for iOS device connectivity
  };

  users.extraGroups.vboxusers.members = [ "user" ];
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        runAsRoot = false;
      };
    };
    virtualbox = {
      guest = {
        enable = true;
        dragAndDrop = false;
      };
      host = {
        enable = true;
        enableExtensionPack = true;
      };
    };
  };

}

