{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "laptop";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-4676696a-cd50-4fbc-913b-167246c1b9ff".device =
    "/dev/disk/by-uuid/4676696a-cd50-4fbc-913b-167246c1b9ff";

  boot.initrd.kernelModules = [ "atkbd" "i8042" ];
  boot.kernelParams = [
    "i8042.reset"
    "i8042.nomux"
  ];
  boot.kernel.sysctl."vm.nr_hugepages" = 2048;
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "25.11";
}

