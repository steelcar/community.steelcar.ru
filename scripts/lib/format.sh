#!/usr/bin/env bash
[ -n "${LIB_FORMAT}" ] && return || readonly LIB_FORMAT=1

color_enabled() {
    local -i colors=$(tput colors 2>/dev/null)
    [[ $? -eq 0 ]] && [[ $colors -gt 2 ]]
}

BOLD_FORMAT="${BOLD_FORMAT-$(color_enabled && tput bold)}"
ERROR_FORMAT="${ERROR_FORMAT-$(color_enabled && tput setaf 1)}"         # red
SUCCESS_FORMAT="${SUCCESS_FORMAT-$(color_enabled && tput setaf 2)}"     # green
WARNING_FORMAT="${WARNING_FORMAT-$(color_enabled && tput setaf 3)}"     # yellow
INFO_FORMAT="${INFO_FORMAT-$(color_enabled && tput setaf 4)}"           # blue
TITLE_FORMAT="${TITLE_FORMAT-$(color_enabled && tput setaf 6)}"         # cyan
SUBTITLE_FORMAT="${SUBTITLE_FORMAT-$(color_enabled && tput setaf 5)}"   # magenta
RESET_FORMAT="${RESET_FORMAT-$(color_enabled && tput sgr0)}"
