{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "jfinlays";
  home.homeDirectory = "/home/jfinlays";
  home.packages = with pkgs; [ 
    atool 
    httpie
    zsh-history-substring-search
 ];
  home.stateVersion = "24.05";
  programs.git = {
    enable = true;
    userName = "Joseph Finlayson";
    userEmail = "joseph.finlayson@gmail.com";
  };
  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # environment.pathsToLink = [ "/share/zsh" ];

      # autosuggestions.enable = true;
  # syntaxHighlighting.enable = true;
      #   shellInit = ''
      #   bindkey '^[OA' history-beginning-search-backward
      #   bindkey '^[[A' history-beginning-search-backward
      #   bindkey '^[OB' history-beginning-search-forward
      #   bindkey '^[[B' history-beginning-search-forward
      # '';
    zplug = {
      enable = true;
     plugins = [
      # Your existing plugins
      { name = "zsh-users/zsh-autosuggestions"; }
      { name = "zsh-users/zsh-syntax-highlighting"; }
      # Add the git plugin
      { name = "plugins/git"; tags = [ "from:oh-my-zsh" ]; }
      { name = "spaceship-prompt/spaceship-prompt"; tags = [ "as:theme" "use:spaceship.zsh" ]; }

    ];
    };
  };

  #   pkgs.vscode-utils.extensionsFromVscodeMarketplace = [
  # {
  #   name = "copilot";
  #   publisher = "GitHub";
  #   version = "1.46.6822";
  #   sha256 = "sha256-L71mC0190ZubqNVliu7es4SDsBTGVokePpcNupABI8Q=";
  # }
  # ];
  


services.gammastep = {
    enable = true;
    dawnTime = "5:00-6:00";
    duskTime = "17:35-19:00";
    latitude = 52.5;
    longitude = 13.4;

    temperature = {
      # https://www.eizo.com/library/basics/color_temperature_on_an_LCD_monitor/
      day = 6500;
      night = 2500;
    };

    tray = true;
  };
}
