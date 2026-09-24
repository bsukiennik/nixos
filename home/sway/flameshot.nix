{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grim # for wayland integration
  ];

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        saveAsFileExtension = ".png";
        showDesktopNotification = true;
        showAbortNotification = false;
        showHelp = true;
        showSidePanelButton = true;

        useGrimAdapter = true;
        disabledGrimWarning = true;
      };
    };
  };
}
