{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "jfinlays";
  home.homeDirectory = "/home/jfinlays";
  home.packages = with pkgs; [ atool httpie ];
  home.stateVersion = "24.05";
  programs.git = {
    enable = true;
    userName = "Joseph Finlayson";
    userEmail = "joseph.finlayson@gmail.com";
  };
  programs.zoxide.enable = true;


  programs.zsh = {
    enable = true;
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

}
