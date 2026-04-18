if status is-interactive
    if test "$TERM_BG" = light
        fish_config theme choose "ayu Light" 2>/dev/null
    else
        fish_config theme choose "kanagawa" 2>/dev/null
    end
end
