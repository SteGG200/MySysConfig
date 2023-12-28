function fish_right_prompt
    # The git prompt's default format is ' (%s)'.
    # We don't want the leading space.

    set -l d (set_color brgrey)(date +%H:%M)(set_color normal)

    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    set -q VIRTUAL_ENV
    and set -l venv (string replace -r '.*/' '' -- "$VIRTUAL_ENV")

    set_color normal
    string join " " -- $venv $d
end