{ ... }:
{
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        disabledTrayIcon = true;
	showStartupLaunchMessage = false;
	showDesktopNitification = true;
	showSidePanelButton = true;
      };
    };
  };
}
