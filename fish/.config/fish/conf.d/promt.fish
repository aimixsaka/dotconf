function fish_prompt
    set_color --bold 00AFFC
    printf '%s' (prompt_pwd)
    set_color --bold 5FD700
    printf '\nλ '
    set_color normal
end

function fish_right_prompt
    set_color --bold B9AD87
    printf '%s@%s ' "$USER" "$hostname"
    set_color --bold 425D5D
    printf '%s' (date '+%H:%M:%S')
    set_color normal
end
