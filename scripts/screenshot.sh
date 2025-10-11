#!/usr/bin/env bash

temp_screenshot=$(mktemp -t screenshot_XXXXXX.png)

if [ -z "$XDG_PICTURES_DIR" ]; then
    XDG_PICTURES_DIR="$HOME/Pictures"
fi

confDir="${XDG_CONFIG_HOME:-$HOME/.config}"
save_dir="${2:-$XDG_PICTURES_DIR/Screenshots}"
save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
swpy_dir="${confDir}/swappy"

mkdir -p "$save_dir"
mkdir -p "$swpy_dir"
echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" >"${swpy_dir}/config"

take_screenshot() {
    local mode=$1
    shift
    local extra_args=("$@")

    if "$confDir/hypr/scripts/lib/grimblast.sh" "${extra_args[@]}" copysave "$mode" "$temp_screenshot"; then
        if ! swappy -o "${save_dir}/${save_file}" -f "$temp_screenshot"; then
            notify-send -a "Screenshot" "Screenshot Error: $?" "Failed to open annotation tool"
            return 1
        fi
    else
        notify-send -a "Screenshot" "Screenshot Error: $?" "Failed to take screenshot"
        return 1
    fi
}

case $1 in
p) # print all outputs
    take_screenshot screen
    ;;
s) # drag to manually snip an area / click on a window to print it
    take_screenshot area
    ;;
sf) # frozen screen, drag to manually snip an area / click on a window to print it
    take_screenshot area --freeze
    ;;
m) # print focused monitor
    take_screenshot output
    ;;
*) # invalid option
    exit 1
    ;;
esac

[ -f "${temp_screenshot}" ] && rm "${temp_screenshot}"

if [ -f "${save_dir}/${save_file}" ]; then
    notify-send -a "Screenshot" -i "${save_dir}/${save_file}" "saved in ${save_dir}"
fi
