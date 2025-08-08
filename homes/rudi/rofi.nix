{ pkgs, ... }:
let
  rofiCustom = pkgs.rofi.override {
    plugins = [
      pkgs.rofi-emoji
      pkgs.rofi-calc
    ];
  };
in

{
  programs.rofi = {
    enable = true;
    cycle = true;
    package = rofiCustom;
    extraConfig = {
      combi-modi = "drun,calc,emoji";
      modi = "drun,calc,emoji,combi";
      show-icons = true;
      terminal = "alacritty"; 
      kb-row-up = "Up,Control+k,Shift+Tab";
      kb-row-down = "Down,Control+j";
      kb-accept-entry = "Control+m,Return";
      kb-remove-to-eol = "Control+Shift+e";
    };
  };
}
