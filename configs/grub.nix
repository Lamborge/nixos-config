{ pkgs, lib, ... }:

let
  argon-grub-theme = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "argon-grub-theme";
    version = "3.5.0";

    src = pkgs.fetchFromGitHub {
      owner = "stuarthayhurst";
      repo = "argon-grub-theme";
      rev = "v${version}";
      hash = "sha256-8pErkfezsWMLkBVKfBCrNqw20urxAf0qQvorvUBZDxo=";
    };

    nativeBuildInputs = [ pkgs.bash pkgs.python3 pkgs.imagemagick pkgs.grub2 ];

    patchPhase = ''
      # 1. Replacing install path with $out
      substituteInPlace install.sh \
        --replace 'installDir="/usr/share/grub/themes/argon"' 'installDir="'"$out"'/share/grub/themes/argon"'

      # 2. checkRoot always returns true
      substituteInPlace install.sh \
        --replace 'checkRoot() {
  if [[ "$UID" != "0" ]]; then return 1; fi
}' 'checkRoot() { return 0; }'

      # 3. turning updateGrub into no-op
      substituteInPlace install.sh \
        --replace 'updateGrub() {
  output "success" "Updating grub..."
  if checkCommand update-grub; then
    update-grub
  elif checkCommand grub-mkconfig; then
    grub-mkconfig -o /boot/grub/grub.cfg
  elif checkCommand zypper; then
    grub2-mkconfig -o /boot/grub2/grub.cfg
  elif checkCommand dnf; then
    grub2-mkconfig -o /boot/grub2/grub.cfg || grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
  fi
}' 'updateGrub() { : ; }'

      # 4. removing copying splash screen (splashScreenPath doesn't exist in sandbox)
      substituteInPlace install.sh \
        --replace 'cp "$installDir/background.png" "$splashScreenPath"' ': # splash skipped'

      # 5. redirecting the grub.d config entry to a temporary directory
      substituteInPlace install.sh \
        --replace 'mkdir -p "/etc/default/grub.d/"' 'mkdir -p "$TMPDIR/grub.d"' \
        --replace '"/etc/default/grub.d/argon.cfg"' '"$TMPDIR/grub.d/argon.cfg"'
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/share/grub/themes/argon"

      bash ./install.sh \
        --install \
        --background Grey \
        --resolution 2k \
        --fontsize 18 \
        --auto
      
      runHook postInstall
    '';

    meta = {
      description = "Argon GRUB theme";
      homepage = "https://github.com/stuarthayhurst/argon-grub-theme";
      license = lib.licenses.gpl3Only;
    };
  };
in
{
  # Disabling the systemd-boot
  boot.loader.systemd-boot.enable = false;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    efiSupport = true;
    device = "nodev";
    efiInstallAsRemovable = false;

    theme = "${argon-grub-theme}/share/grub/themes/argon";
    splashImage = null;

    gfxmodeEfi = "2560x1440";
    gfxpayloadEfi = "keep";

    default = "0";
    extraConfig = ''
      set timeout=5
      set timeout_style=menu
    '';
  };
}
