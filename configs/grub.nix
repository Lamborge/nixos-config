{ config, pkgs, ... }:
{
  # Disabling the systemd-boot
  boot.loader.systemd-boot.enable = false;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    efiSupport = true;
    device = "nodev";
    efiInstallAsRemovable = false;
  };
}
