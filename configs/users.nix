{ config, pkgs, ... }:
{
  # USERS CONFIGURATION
  users.users.lamborge = {
    isNormalUser = true;
    extraGroups = [ "wheel" "games" "audio" "disk" "kvm" "video" "gamemode" "wireshark" "libvirt" "networkmanager" ];
  };
}
