{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        jnoortheen.nix-ide
        vscodevim.vim
        ms-toolsai.jupyter
      ];
      keybindings = [
        {
          key = "capslock";
          command = "extension.vim_escape";
          when = "editorTextFocus && vim.active && !inDebugRepl";
        }
        {
          key = "escape";
          command = "-extension.vim_escape";
          when = "editorTextFocus && vim.active && !inDebugRepl";
        }
      ];
    };
  };
}
