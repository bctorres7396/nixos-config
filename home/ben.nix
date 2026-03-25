
  { config, pkgs, ...}:
  {
    home.username = "ben";
    home.homeDirectory = "/home/ben";
    home.stateVersion = "25.11";
  
    programs.home-manager.enable = true;


     home.packages = with pkgs; [
       kitty
       wofi
       waybar
       firefox
       git
     ];
  }
