{ config, pkgs, ... }:

let
  gruvboxRainbow = pkgs.fetchurl {
    url = "https://starship.rs/presets/toml/gruvbox-rainbow.toml";
    sha256 = "0sjw2xzhxqamidfcn6d369skw2rfmyx3a45wz7ww3x7d6d25c1q3"; # Placeholder
  };
in

{

  imports = [
    ./components
    ./packages
    ./shell
    ./terminal
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "25.11";

  # User packages (better than environment.systemPackages)
  home.packages = with pkgs; [
   libreoffice  
  ];

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };


  programs.git = {
    enable = true;
    settings.user = {
      name = "rudi research";
      email = "rudi.research@proton.me";
    };
  };

  # Let HM manage itself
  programs.home-manager.enable = true;

  stylix.targets.firefox.enable = true;

}

