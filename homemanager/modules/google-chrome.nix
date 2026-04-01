{ ... }:
{
  xdg.configFile."google-chrome-flags.conf".text = ''
    --disable-features=ExtensionManifestV2Unsupported,ExtensionManifestV2Disabled
  '';

  xdg.desktopEntries.google-chrome = {
    name = "Google Chrome";
    exec = "google-chrome-stable --disable-features=ExtensionManifestV2Unsupported,ExtensionManifestV2Disabled %U";
    icon = "google-chrome";
    terminal = false;
    type = "Application";
    startupNotify = true;
    categories = [ "Network" "WebBrowser" ];
    mimeType = [ "text/html" "x-scheme-handler/http" "x-scheme-handler/https" ];
  };
}
