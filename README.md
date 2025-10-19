# config.hypr

A modular, organized Hyprland configuration designed for a smooth, customizable Linux window manager experience.

## Overview

This repository provides a clean, modular Hyprland setup. Configuration files are broken down into focused modules for animations, input, keybindings, monitors, theming, and window rules. Scripts complement the config by providing useful utilities for screenshots, keyboard layouts, etc...

The goal is to maintain clarity and ease of customization while delivering a fully featured Hyprland environment.

## Requirements

* Hyprland
* Some other things for the keybinds, find them as you go

## Installation

1. Clone this repo into your Hyprland config directory (usually `~/.config/hypr/`):

   ```bash
   git clone https://github.com/brianferri/config.hypr.git ~/.config/hypr
   # Optional: remove git history if you want a clean directory
   rm -rf ~/.config/hypr/.git
   ```

2. Start or reload Hyprland to apply your configuration:

   ```bash
   hyprctl reload
   ```

## Structure & Loading Order

* `hyprland.conf` is the main entry point, which includes the modular config files inside the `configs/` folder.
* The `configs/` directory contains split configurations, including:

  * `animations.conf`
  * `input.conf`
  * `keybinds.conf`
  * `monitors.conf`
  * `theme.conf`
  * `windowrules.conf`

* The `scripts/` folder contains shell scripts to extend functionality, such as:

  * `screenshot.sh`: Take screenshots
  * `toggle_show_desktop.sh`: Toggle applications or workspace visibility
  * `switch_keyboard_layout.sh`: Easily switch keyboard layouts
  * [`lib/grimblast.sh`](https://github.com/hyprwm/contrib/blob/main/grimblast/grimblast): Helper script used by screenshot utilities


## Usage Tips

* Keep your `scripts/` folder executable:

  ```bash
  chmod +x ~/.config/hypr/scripts/*.sh
  chmod +x ~/.config/hypr/scripts/lib/*.sh
  ```

If you want to see how I manage other parts of my environment, check out my other configs:

* [config.nvim](https://github.com/brianferri/config.nvim) — Neovim config
* [dotfiles](https://github.com/brianferri/dotfiles) — System-wide dotfiles

