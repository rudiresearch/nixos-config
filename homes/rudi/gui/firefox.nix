{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    
    preferences = {
      "privacy.trackingprotection.enabled" = true;
      "privacy.donottrackheader.enabled" = true;
      "privacy.donottrackheader.value" = 1;
      "datareporting.healthreport.uploadEnabled" = false;
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.unified" = false;
      "browser.safebrowsing.enabled" = true;
      "browser.safebrowsing.malware.enabled" = true;
    };

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
      };

      Extensions = {
        Install = [
          # uBlock Origin
          "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
          # User-Agent Switcher
          "https://addons.mozilla.org/firefox/downloads/latest/uaswitcher/latest.xpi"
        ];
      };
    };
  };
}
