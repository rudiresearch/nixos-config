{ pkgs, ... }:
{

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      eval "$(starship init zsh)"
    '';
    
    shellAliases = {
      gs = "git status";
      ll = "ls -l";
      hms = "sudo nixos-rebuild switch --flake ~/nixos-config#rudibox";
    };
    
    history.size = 10000;
    history.save = 10000;

  };
}
