{ config, pkgs, ... }:
{
  # Set your time zone.
  time.timeZone = "Asia/Tbilisi";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
      "uk_UA.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];

    extraLocaleSettings = {
      LC_TIME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_ADDRESS = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    #useXkbConfig = true; # use xkb.options in tty.
  };

  security.sudo.wheelNeedsPassword = false;
}
