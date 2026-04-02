{ ... }:
{
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        disabledTrayIcon = true;
	showStartupLaunchMessage = false;
	showDesktopNotification = true;
	showSidePanelButton = true;
      };
    };
  };
}
