
  { config, pkgs, ... }:
{
  home.username = "ben";
  home.homeDirectory = "/home/ben";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    kitty
    wofi
    waybar
    firefox
    git
    hyprpaper
    grim
    slurp
    wl-clipboard
    brightnessctl
    pamixer
    networkmanagerapplet
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    swww
    starship
    spotify
    fastfetch
    thunar
    xdg-utils
    swaylock
    wlogout
    vlc
    discord
    telegram-desktop
    discord
    btop
    obsidian
    swaynotificationcenter
    swayidle
    libnotify
    catppuccin-gtk
    gnome-themes-extra
    glib
  ];

  fonts.fontconfig.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [",1920x1080,auto,1"
                "HDMI-A-1,2560x1440,1920x0,1"
      ];
      exec-once = [
        "swww-daemon"
        "sleep 1 && swww img /home/ben/.config/hyprpaper/wallpaper.jpg --transition-type wipe --transition-duration 2"
        "waybar"
        "swaync"
        "swayidle -w timeout 300 'swaylock' timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'"
        "gsettings set org.gnome.desktop.interface gtk-theme 'Catpupuccin-Mocha-Standard-Blue-Dark'"
        "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"

      ];
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(89b4fa) rgb(cba6f7) 45deg";
        "col.inactive_border" = "rgb(313244)";
      };
      input = {
        kb_layout = "us";
        touchpad.natural_scroll = true;
      };
      bind = [
        "SUPER, Return, exec, kitty"
        "SUPER, Q, killactive"
        "SUPER, M, exit"
        "SUPER, Space, exec, wofi --show drun"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        ",XF86AudioRaiseVolume, exec, pamixer -i 5"
        ",XF86AudioLowerVolume, exec, pamixer -d 5"
        ",XF86AudioMute, exec, pamixer -t"
        ",XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        "SUPER, E, exec, thunar"
        "SUPER, P, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"
        "SUPER, Z, exec, grim ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"
        "SUPER, L, exec, swaylock"
        "SUPER, X, exec, wlogout"
        "SUPER, N, exec, swaync-client -t"
        "SUPER, F, exec, thunar"
      ];
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
  ];
};
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
    mainBar = {
    layer = "top";
    position = "top";
    height = 40;
    margin-top = 6;
    margin-left = 8;
    margin-right = 8;
    modules-left = [ "hyprland/workspaces" ];
    modules-center = [ "clock" ];
    modules-right = [ "cpu" "memory" "pulseaudio" "network" "battery" ];

    clock = {
      format = " {:%H:%M}";
      format-alt = " {:%A, %B %d, %Y}";
      tooltip = true;
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };

    battery = {
      format = "{icon} {capacity}%";
      format-charging = " {capacity}%";
      format-icons = [ "" "uf243" "" "" "" ];
      tooltip = false;
    };

    network = {
      format-wifi = " {essid}";
      format-disconnected = "disconnected";
      tooltip-format = "{ifname}  {bandwidthDownBytes}  {bandwidthUpBytes}";
      tooltip = true;
    };

    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = " muted";
      format-icons = {
        default = [ "" "" "" ];
      };
      tooltip = false;
    };

    cpu = {
      format = " {usage}%";
      tooltip = false;
      interval = 2;
    };

    memory = {
      format = " {percentage}%";
      tooltip = false;
      interval = 2;
    };

    "hyprland/workspaces" = {
      format = "{id}";
      on-click = "activate";
      persistent-workspaces = {
        "*" = 5;
      };
    };
  };
};

    style = ''
    * {
    font-family: "JetBrainsMono Nerd Font";
    font-size: 13px;
    min-height: 0;
    color: #cdd6f4;
    }

  window#waybar {
    background: transparent;
    border: none;
    }

    .modules-left, .modules-center, .modules-right {
    background: #1e1e2e;
    border-radius: 14px;
    margin: 8px 4px;
    padding: 0 8px;
    border: 2px solid #313244;
    }

  #workspaces button {
    padding: 4px 8px;
    color: #6c7086;
    border-radius: 10px;
    margin: 2px;
  }

  #workspaces button.active {
    color: #cdd6f4;
    background: #313244;
    border-radius: 10px;
  }

  #workspaces button:hover {
    background: #313244;
    border-radius: 10px;
    color: #cdd6f4;
  }

  #clock {
    color: #89b4fa;
    padding: 0 12px;
    font-weight: bold;
  }

  #battery {
    color: #a6e3a1;
    padding: 0 12px;
  }

  #battery.charging {
    color: #a6e3a1;
  }

  #battery.warning:not(.charging) {
    color: #f9e2af;
  }

  #battery.critical:not(.charging) {
    color: #f38ba8;
  }

  #network {
    color: #89dceb;
    padding: 0 12px;
  }

  #pulseaudio {
    color: #cba6f7;
    padding: 0 12px;
  }

  #pulseaudio.muted {
    color: #6c7086;
  }

  #cpu {
    color: #fab387;
    padding: 0 12px;
  }

  #memory {
    color: #f38ba8;
    padding: 0 12px;
  }
'';
  };

  programs.kitty = {
    enable = true;
    settings = {
      font_size = "12.0";
      background_opacity = "0.95";
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

  programs.starship = {
    enable = true;
    settings = {
      format = "$username$directory$git_branch$git_status$cmd_duration$line_break$character";
      username = {
        show_always = true;
        format = "[$user]($style) ";
        style_user = "bold purple";
      };
      directory = {
        format = "[$path]($style) ";
        style = "bold blue";
        truncation_length = 3;
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
        style = "bold pink";
      };
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
      cmd_duration = {
        min_time = 500;
        format = "[$duration]($style) ";
        style = "bold yellow";
      };
    };
  };

  programs.zsh = {
    enable = true;
  };

  programs.wofi = {
  enable = true;
  style = ''
    window {
      background-color: #1e1e2e;
      border: 2px solid #313244;
      border-radius: 10px;
    }
    #input {
      background-color: #313244;
      color: #cdd6f4;
      border: none;
      border-radius: 5px;
      padding: 8px;
      margin: 8px;
    }
    #inner-box {
      background-color: #1e1e2e;
    }
    #outer-box {
      padding: 8px;
    }
    #entry {
      padding: 8px;
      border-radius: 5px;
      color: #cdd6f4;
    }
    #entry:selected {
      background-color: #313244;
      color: #89b4fa;
    }
    #text {
      color: #cdd6f4;
    }
    #text:selected {
      color: #89b4fa;
    }
  '';
};  

    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
        package = pkgs.catppuccin-gtk;
    };
    cursorTheme = {
      name = "catppuccin-mocha-dark-cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
   };
   
}
