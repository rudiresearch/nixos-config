{ config, pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      bars = [];
      modifier = "Mod4";
      focus.followMouse = false;

      keybindings =
        let
          cfg = config.xsession.windowManager.i3;
          modifier = config.xsession.windowManager.i3.config.modifier;
        in
        {
          "Print" = "exec ${pkgs.flameshot}/bin/flameshot gui --clipboard --path ~/";
          "Shift+Print" = "exec ${pkgs.flameshot}/bin/flameshot screen -p ~/Pictures/Screenshots/";
          "${modifier}+Shift+Print" = "exec ${pkgs.flameshot}/bin/flameshot gui --pin";

          "${modifier}+Return" = "exec ${cfg.config.terminal}";
          "${modifier}+q" = "kill";
          "${modifier}+space" = "exec rofi -show combi -display-drun ''";
          "${modifier}+Shift+space" = "exec xfce4-popup-applicationsmenu";

          "${modifier}+Left" = "focus left";
          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";
          "${modifier}+j" = "focus next";
          "${modifier}+k" = "focus prev";

          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";

          # sticky window toggle
          "${modifier}+Shift+s" = "sticky toggle";

          "${modifier}+h" = "split h";
          "${modifier}+v" = "split v";
          "${modifier}+f" = "fullscreen toggle";

          "${modifier}+s" = "layout stacking";
          "${modifier}+w" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";

          "${modifier}+t" = "floating toggle";

          "${modifier}+p" = "focus parent";

          "${modifier}+Shift+minus" = "move scratchpad";
          "${modifier}+minus" = "scratchpad show";

          "${modifier}+1" = "workspace 1";
          "${modifier}+2" = "workspace 2";
          "${modifier}+3" = "workspace 3";
          "${modifier}+4" = "workspace 4";
          "${modifier}+5" = "workspace 5";
          "${modifier}+6" = "workspace 6";
          "${modifier}+7" = "workspace 7";
          "${modifier}+8" = "workspace 8";
          "${modifier}+9" = "workspace 9";
          "${modifier}+0" = "workspace 10";

          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+Shift+2" = "move container to workspace number 2";
          "${modifier}+Shift+3" = "move container to workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4";
          "${modifier}+Shift+5" = "move container to workspace number 5";
          "${modifier}+Shift+6" = "move container to workspace number 6";
          "${modifier}+Shift+7" = "move container to workspace number 7";
          "${modifier}+Shift+8" = "move container to workspace number 8";
          "${modifier}+Shift+9" = "move container to workspace number 9";
          "${modifier}+Shift+0" = "move container to workspace number 10";

          "${modifier}+Escape" = "workspace back_and_forth";

          # rename workspace
          "${modifier}+n" = ''
            exec i3-input -F 'rename workspace to "%s"' -P 'New name for this workspace: '
          '';

          "${modifier}+Shift+c" = "reload";
          "${modifier}+Shift+r" = "restart";
          "${modifier}+Mod1+l" = "exec xflock4";
          "${modifier}+Shift+Escape" = "exec xfce4-taskmanager";
          "${modifier}+Shift+e" =
            "exec xfce4-session-logout";

          "${modifier}+r" = "mode resize";

          # like vimperator
          "${modifier}+a" = "exec ${pkgs.i3-easyfocus}/bin/i3-easyfocus";
        };

#      startup = [
#        { command = "xfce4-panel"; always = true; notification = false; }
#      ];

      terminal = "alacritty";
      workspaceAutoBackAndForth = true;
    };
  };
}

