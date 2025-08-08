{ pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      bars = [];
      modifier = "Mod4";
      focus.followMouse = false;
      startup = [
        { command = "xfce4-panel"; always = true; notification = false; }
      ];
      terminal = "alacritty";
      workspaceAutoBackAndForth = true;
    };
  };
}

