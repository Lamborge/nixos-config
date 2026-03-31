{ config, pkgs, ... }:
{
  # NETWORKING
  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking = {
    networkmanager.enable = true;
    networkmanager.dns = "none";
    useDHCP = false;
    dhcpcd.enable = true;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
    ];
  };
}
