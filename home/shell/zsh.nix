{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    # Quality-of-life defaults
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    defaultKeymap = "viins";

    # History (shared across terminals)
    history = {
      size = 10000;
      save = 10000;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
    };

    # Aliases
    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      rebuild = "sudo nixos-rebuild switch --flake $HOME/nixos-config#$(hostname)";
      ahmad = ''
      docker run --rm \
      -e MOZ_ENABLE_WAYLAND=1 \
      -e WAYLAND_DISPLAY=wayland-0 \
      -e XDG_RUNTIME_DIR=/run/user/$(id -u) \
      -v /run/user/$(id -u)/wayland-0:/run/user/$(id -u)/wayland-0 \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      firefox-ahmad'';
    };

    # Starship prompt
    initContent = ''
      eval "$(starship init zsh)"
    '';
  };
}
