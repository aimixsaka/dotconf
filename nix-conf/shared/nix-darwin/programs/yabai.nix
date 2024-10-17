{
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    extraConfig = ''
      # for this to work you must configure sudo such that
      # it will be able to run the command without password
      #yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
      #sudo yabai --load-sa

      #
      # for this to work you must configure sudo such that
      # it will be able to run the command without password
      #
      # see this wiki page for information:
      #  - https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#configure-scripting-addition
      #
      # yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
      # sudo yabai --load-sa
      #

      # global settings
      yabai -m config                                 \
          debug_output                 on             \
          external_bar                 off:40:0       \
          menubar_opacity              1.0            \
          mouse_follows_focus          off            \
          focus_follows_mouse          off            \
          display_arrangement_order    default        \
          window_origin_display        default        \
          window_placement             second_child   \
          window_zoom_persist          on             \
          window_shadow                on             \
          window_animation_duration    0.0            \
          window_animation_easing      ease_out_circ  \
          window_opacity_duration      0.0            \
          active_window_opacity        1.0            \
          normal_window_opacity        0.90           \
          window_opacity               off            \
          insert_feedback_color        0xffd75f5f     \
          split_ratio                  0.50           \
          split_type                   auto           \
          auto_balance                 off            \
          top_padding                  12             \
          bottom_padding               12             \
          left_padding                 12             \
          right_padding                12             \
          window_gap                   06             \
          layout                       bsp            \
          mouse_modifier               fn             \
          mouse_action1                move           \
          mouse_action2                resize         \
          mouse_drop_action            swap

      echo "yabai configuration loaded.."
    '';
  };
}
