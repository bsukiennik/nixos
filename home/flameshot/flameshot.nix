{ ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        # savePath = "/$HOME/Pictures/Screenshot";
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        saveAsFileExtension = ".png";
        showDesktopNotification = true;
        showAbortNotification = false;
        showHelp = true;
        showSidePanelButton = true;

        # For Wayland (Install Grim seperately)
        useGrimAdapter = true;
        disabledGrimWarning = true;
      };
    };
  };
}
