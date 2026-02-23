{ config, pkgs, ... }:

{
  # X11 + KDE Plasma 6
  services = {
    xserver.enable = true;

    xserver.xkb = {
      layout = "us,de,ara";
      options = "grp:ctrl_alt_toggle,caps:escape"; # Caps Lock → Escape
    };
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

  };

  programs.zsh.enable = true;

  # Shared user on all machines
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" "vboxusers" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
    shell = pkgs.zsh;
  };
}

