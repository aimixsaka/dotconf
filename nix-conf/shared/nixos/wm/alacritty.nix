{
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "xterm-256color";
      };

      window = {
        option_as_alt = "Both";
        dynamic_padding = true;
      };

      scrolling = {
        history = 10000;
        multiplier = 10;
      };

      font = {
        normal.family = "monospace";
        size = 21;
      };

      colors = {
        draw_bold_text_with_bright_colors = true;

        primary = {
          background = "0x000000";
          foreground = "0xffffff";
        };
        cursor = {
          text = "0xF81CE5";
          cursor = "0xffffff";
        };
        normal = {
          black = "0x000000";
          red = "0xfe0100";
          green = "0x33ff00";
          yellow = "0xfeff00";
          blue = "0x0066ff";
          magenta = "0xcc00ff";
          cyan = "0x00ffff";
          white = "0xd0d0d0";
        };
        bright = {
          black = "0x808080";
          red = "0xfe0100";
          green = "0x33ff00";
          yellow = "0xfeff00";
          blue = "0x0066ff";
          magenta = "0xcc00ff";
          cyan = "0x00ffff";
          white = "0xFFFFFF";
        };
        transparent_background_colors = true;
      };

      selection = {
        semantic_escape_chars = '',│`|:"' ()[]{}<>	'';
        save_to_clipboard = true;
      };

      live_config_reload = true;
    };
  };
}
