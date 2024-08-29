{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    plugins = with pkgs; [ ];

    extraConfig = ''
      # set is a alias of set-option

      set-option -g default-terminal "screen-256color"
      set-option -sa terminal-features ',xterm-256color:RGB'

      ## for neovim (based on `:checkhealth`)
      #set-option -g focus-events on

      # change prefix key to C-q
      unbind C-b
      set -g prefix C-q
      bind C-q send-prefix

      # change pane split key
      unbind %
      bind | split-window -h
      unbind '"'
      bind - split-window -v

      # reload config
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config Reloaded"


      # set keybind to resize pane
      bind -r C-j resize-pane -D 5
      bind -r C-k resize-pane -U 5
      bind -r C-h resize-pane -L 5
      bind -r C-l resize-pane -R 5
      # back to orgin layout
      bind -r m resize-pane -Z

      # move around pane
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # show pane name
      set -g pane-border-status top
      # bind command about rename prompt
      bind . command-prompt -p "(rename-pane)" -I "#T" "select-pane -T '%%'"

      # show time
      #set -g status-interval 1
      #set -g status-right "#[fg=red]#(awk '{print $1, $2, $3}' /proc/loadavg) #[fg=black]%Y-%m-%d %H:%M:%S"

      # set pane history number
      set -g history-limit 99999999

      # enable mouse
      set -g mouse on

      # set window vi mode
      set-window-option -g mode-keys vi

      # use v and y to select and copy
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection


      # enable mouse drag to copy instead of going to the directly
      unbind -T copy-mode-vi MouseDragEnd1Pane

      # fix vim <ESC> delay
      set -sg escape-time 0

      # theme
      set -g status-style bg='#0166FF'
      set -g mode-style "fg=#f5c2e7 bg=#585b70 bold"
    '';
  };
}
