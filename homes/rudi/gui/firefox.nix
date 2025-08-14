{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      OverrideFirstRunPage = "";
      SkipTermsOfUse = true;

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
    profiles.default.search.engines = {
      
      nix-packages = {
        name = "Nix Packages";
        urls = [{
          template = "https://search.nixos.org/packages";
          params = [
            { name = "type"; value = "packages"; }
            { name = "query"; value = "{searchTerms}"; }
          ];
        }];

        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@np" ];
      };

      nixos-wiki = {
        name = "NixOS Wiki";
        urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
        iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
        definedAliases = [ "@nw" ];
      };

      noogle = {
        name = "Noogle";
        urls = [{ template = "https://noogle.dev/q?term={searchTerms}"; }];
        iconMapObj."16" = "https://noogle.dev/favicon.png";
        definedAliases = [ "@noo" ];
      };

      nixos-options = {
        name = "NixOS Options";
        urls = [{ template = "https://search.nixos.org/options?channel=unstable&size=1000&sort=relevance&type=packages&query={searchTerms}"; }];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@nio" ];
      };

      home-manager-options = {
        name = "Home Manager Options";
        urls = [{ template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master"; }];
        iconMapObj."16" = "https://home-manager-options.extranix.com/images/favicon.ico";
        definedAliases = [ "@hmo" ];
      };

      bing.metaData.hidden = true;
      google.metaData.alias = "@g"; # builtin engines only support specifying one additional alias
      
    };
  };

}

