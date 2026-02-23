{ pkgs, ... }:
with pkgs;
{
  programs.ranger = {
    enable = true;
    extraConfig = ''
      default_linemode devicons
    '';
    mappings = {
      dT = "shell gio trash %s";
    };
    plugins = [
      {
        name = "ranger_devicons";
        src = builtins.fetchGit {
          url = "https://github.com/alexanderjeurissen/ranger_devicons.git";
          rev = "a8d626485ca83719e1d8d5e32289cd96a097c861";
        };
      }
    ];
    settings = {
      autoupdate_cumulative_size = true;
      bidi_support = true;
      cd_tab_fuzzy = true;
      colorscheme = "jungle";
      draw_borders = "both";
      line_numbers = "relative";
      preview_images_method = "kitty";
      save_tabs_on_exit = true;
      shorten_title = 0;
      tilde_in_titlebar = true;
      update_title = true;
      vcs_aware = true;
      vcs_backend_git = "enabled";
      wrap_scroll = true;
      wrap_plaintext_previews = true;
    };
  };
}
