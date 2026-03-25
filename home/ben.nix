
  { config, pkgs, ...}:
  {
    home.username = "ben";
    home.homeDirectory = "/home/ben";
    home.stateVersion = "25.11";
  
    programs.home-manager.enable = true;

      catppuccin.enable = true;
      catppuccin.flavor = "mocha";
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          monitor = ",1920x1080, auto, 1";
          exec-once = [ "waybar" ];
          bind = [
            "SUPER, Return, exec, kitty"
            "SUPER, Q, killactive"
            "SUPER, M, exit"
            "SUPER, Space, exec, wofi --show drun"
          ];
        };
      };

     programs.waybar = {
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 34;
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "network" "battery" ];

      clock = {
        format = " {:%H:%M}";
        tooltip = false;
      };

      battery = {
        format = " {capacity}%";
        tooltip = false;
      };

      network = {
        format-wifi = " {signalStrength}%";
        format-disconnected = "disconnected";
        tooltip = false;
      };

      pulseaudio = {
        format = " {volume}%";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        format = "{id}";
        on-click = "activate";
      };
    };
  };

  style = ''
    * {
      font-family: "JetBrainsMono Nerd Font";
      font-size: 13px;
    }

    window#waybar {
      background-color: #1e1e2e;
      color: #cdd6f4;
      border-bottom: 2px solid #313244;
    }

    #workspaces button {
      padding: 0 8px;
      color: #6c7086;
    }

    #workspaces button.active {
      color: #89b4fa;
      border-bottom: 2px solid #89b4fa;
    }

    #clock {
      color: #a6e3a1;
      padding: 0 12px;
    }

    #battery {
      color: #f9e2af;
      padding: 0 12px;
    }

    #network {
      color: #89dceb;
      padding: 0 12px;
    }

    #pulseaudio {
      color: #f5c2e7;
      padding: 0 12px;
    }
  '';
};

     home.packages = with pkgs; [
       kitty
       wofi
       waybar
       firefox
       git
       hyprland
       hyprpaper
       grim
       slurp
       wl-clipboard
       brightnessctl
       pamixer
       networkmanagerapplet
       nerd-fonts.jetbrains-mono
       nerd-fonts.fira-code
     ];
     
     fonts.fontconfig.enable = true;
  programs.kitty = {
    enable = true;
    settings = {
      font_size = "12.0";
      background_opacity = "0.95";
      background = "#1e1e2e";
      foreground = "#cdd6f4";
      cursor = "#f5e0dc";
      selection_background = "#313244";
      color0 = "#45475a";
      color1 = "#f38ba8";
      color2 = "#a6e3a1";
      color3 = "#f9e2af";
      color4 = "#89b4fa";
      color5 = "#f5c2e7";
      color6 = "#94e2d5";
      color7 = "#bac2de";
      color8 = "#585b70";
      color9 = "#f38ba8";
      color10 = "#a6e3a1";
      color11 = "#f9e2af";
      color12 = "#89b4fa";
      color13 = "#f5c2e7";
      color14 = "#94e2d5";
      color15 = "#a6adc8";
    };
  };
  }
