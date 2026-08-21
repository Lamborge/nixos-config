{ ... }:
{
  # USERS CONFIGURATION
  users.users.lamborge = {
    isNormalUser = true;
    extraGroups = [ "wheel" "games" "audio" "disk" "kvm" "docker" "video" "gamemode" "wireshark" "libvirt" "networkmanager" ];
  };
}
