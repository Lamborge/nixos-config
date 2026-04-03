{ config, pkgs, ... }:
{
  # PIPEWIRE
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    extraConfig.pipewire."10-clock" = {
      "context.properties" = {
        "default.clock.rate" = 4800;
        "default.clock.allowed-rates" = [ 44100 4800 9600 ];
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 8192;
      };
    };

    extraConfig.client."10-resample" = {
      "stream.properties" = {
        "resample.quality" = 10;
      };
    };
  };
}
