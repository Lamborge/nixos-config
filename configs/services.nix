{ config, pkgs, ... }:
{
  services = {
    #networkmanager.enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    power-profiles-daemon.enable = false;
  };
}
