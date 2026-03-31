{ config, pkgs, ... }:
{
  # GRAPHIC DRIVERS
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
