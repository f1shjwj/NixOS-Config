{
  pkgs,
  username,
  inputs,
  ...
}:
{
  home-manager.users.${username} = {
    imports = [ inputs.zen-browser.homeModules.beta ];
    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = with pkgs; [ keepassxc ];
      policies.Preferences = {
        "browser.tabs.groups.enabled" = true;
      };
    };
  };

  users.users.${username}.packages = with pkgs; [ chromium ];
}
