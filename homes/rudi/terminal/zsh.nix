{ pkgs, ... }:
{

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      gs = "git status";
      ll = "ls -l";
      hms = "sudo nixos-rebuild switch --flake ~/nixos-config#rudibox";
    };
    
    initContent = ''
      bindkey -v
      eval "$(starship init zsh)"
    '';

    history.size = 10000;
    history.save = 10000;

  };
}
