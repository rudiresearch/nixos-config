{ pkgs, ...}: 

{
  programs.alacritty = {
    settings = {
      font.size = 8;
      font.normal = {
        family = "FiraCode Nerd Font";
        style = "Regular";
      };
    };
  };
}

