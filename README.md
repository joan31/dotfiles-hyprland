# ✨ Hyprland Dotfiles

![Linux](https://img.shields.io/badge/OS-Linux-black?style=flat-square&logo=linux&logoColor=white)
![Arch Linux](https://img.shields.io/badge/Distro-Arch-blue?style=flat-square&logo=arch-linux)
![Wayland](https://img.shields.io/badge/Display%20Server-Wayland-yellow?style=flat-square&logo=wayland)
![Hyprland](https://img.shields.io/badge/WM-Hyprland-blueviolet?style=flat-square&logo=hyprland)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=flat-square&logo=open-source-initiative)](LICENSE)

Personal dotfiles for my minimalist and keyboard-driven Wayland setup using **Hyprland**.

## 📌 Table of Contents

- [🧩 Features](#-features)
- [🗃️ Structure](#️-structure)
- [💡 Philosophy](#-philosophy)
- [🚀 Setup](#-setup)
- [⚙️ Dotfiles Management](#️-dotfiles-management)
- [📝 To-Do List](#-to-do-list)
- [✅ Done](#-done)
- [📄 License](#-license)

## 🧩 Features

- 🚀 Wayland compositor: Hyprland
- 🌈 Theming with [Sweet-Dark-v40](https://github.com/EliverLara/Sweet) & [Candy icons](https://github.com/EliverLara/candy-icons)
- 🧱 Status bar: Waybar
- 🖱️ Launcher: rofi-wayland
- 🔊 Audio: PipeWire
- 🔧 System tools: mako, grim, slurp, swappy
- 🎮 Gaming tweaks (Proton, MangoHUD, GameMode)

## 🗃️ Structure

<details>
<summary>📁 <code>dotfiles-hyprland/</code> (click to expand)</summary>

```bash
dotfiles-hyprland/
├── .config/
│   ├── MangoHud/
│   │   └── MangoHud.conf
│   ├── foot/
│   │   ├── themes/
│   │   │   └── sweet-dark
│   │   └── foot.ini
│   ├── gtk-2.0/
│   │   └── gtkfilechooser.ini
│   ├── gtk-3.0/
│   │   ├── gtk.css
│   │   └── settings.ini
│   ├── gtk-4.0/
│   │   ├── gtk.css
│   │   └── settings.ini
│   ├── hypr/
│   │   ├── conf.d/
│   │   │   ├── 00-environment.conf
│   │   │   ├── 01-variables.conf
│   │   │   ├── 02-behaviours.conf
│   │   │   ├── 03-aesthetic.conf
│   │   │   ├── 04-input.conf
│   │   │   ├── 05-output.conf
│   │   │   ├── 06-workspaces.conf
│   │   │   ├── 07-keybindings.conf
│   │   │   ├── 08-rules.conf
│   │   │   └── 09-autostart.conf
│   │   ├── scripts/
│   │   │   ├── control_volume.sh
│   │   │   ├── monitor_switch.sh
│   │   │   ├── screenshot_area.sh
│   │   │   └── screenshot_monitor.sh
│   │   ├── hypridle.conf
│   │   ├── hyprland.conf
│   │   ├── hyprlock.conf
│   │   └── hyprlock.png
│   ├── mako/
│   │   ├── themes/
│   │   │   └── sweet-dark.css
│   │   └── config
│   ├── mpv/
│   │   ├── input.conf
│   │   └── mpv.conf
│   ├── nwg-look/
│   │   └── config
│   ├── nvim/
│   │   ├── lua/
│   │   │   ├── colors/
│   │   │   │   └── ...
│   │   │   ├── config/
│   │   │   │   └── ...
│   │   │   ├── core/
│   │   │   │   └── ...
│   │   │   ├── plugins/
│   │   │   │   └── ...
│   │   │   └── utils/
│   │   │       └── ...
│   │   └── init.lua
│   ├── qt5ct/
│   │   ├── colors/
│   │   │   └── sweet-dark.conf
│   │   └── qt5ct.conf
│   ├── qt6ct/
│   │   ├── colors/
│   │   │   └── sweet-dark.conf
│   │   └── qt6ct.conf
│   ├── rofi/
│   │   ├── scripts/
│   │   │   └── cliphist-rofi.sh
│   │   ├── themes/
│   │   │   └── sweet-dark.rasi
│   │   └── config.rasi
│   ├── swappy/
│   │   └── config
│   ├── waybar/
│   │   ├── scripts/
│   │   │   ├── bar_volume.sh
│   │   │   └── mediaplayer.py
│   │   ├── themes/
│   │   │   └── sweet-dark.css
│   │   ├── config
│   │   └── style.css
│   ├── xsettingsd/
│   │   └── xsettingsd.conf
│   ├── electron-flags.conf
│   ├── electron13-flags.conf
│   └── electron19-flags.conf
├── .local/
│   ├── bin/
│   └── share/
│       ├── fonts/
│       │   ├── OTF/
│       │   │   └── ...
│       │   └── TTF/
│       │       └── ...
│       ├── icons/
│       │   └── ...
│       └── themes/
│           └── ...
├── Pictures/
│   ├── Screenshots/
│   └── Wallpapers/
│       └── ...
├── .Xdefaults
├── .Xresources
├── .fonts/
├── .gitignore
├── .gtkrc-2.0
├── .icons/
├── .themes/
├── .zshrc
├── LICENSE
└── README.md
```

</details>

## 💡 Philosophy

- Declarative, clean configs
- Easily portable via Git
- Blur, transparency, and animations
- Fast boot, lightweight, focused

## 🚀 Setup

These dotfiles are managed with Git using the **bare repo** method. See below for setup instructions.

---

## ⚙️ Dotfiles Management

This repository is managed using a **bare Git repository** to track configuration files directly in `$HOME`.

### 🌀 Initialization (First Time Only)

```bash
git clone --bare git@github.com:joan31/dotfiles-hyprland.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

### 🧙 Ignore Everything Else

To avoid tracking all files in your `$HOME`, configure Git to ignore everything by default and **only include what you explicitly allow**:

Create the following in `$HOME/.dotfiles/info/exclude` (or use a `.gitignore` if preferred):

<details>
<summary>📄 <code>.gitignore</code> content (click to expand)</summary>

```gitignore
### Ignore everything by default
*

### But not these files/folders
## GIT
!.gitignore
!LICENSE
!README.md

## CONFIGS
!.config/
!.local/
!.local/share/

# SHELL
!.zshrc

# HYPRLAND
!.config/hypr/
!.config/hypr/*
!.config/hypr/conf.d/*
!.config/hypr/scripts/*

# WAYBAR
!.config/waybar/
!.config/waybar/*
!.config/waybar/scripts/*
!.config/waybar/themes/*

# NEOVIM
!.config/nvim/
!.config/nvim/*
!.config/nvim/lua/*
!.config/nvim/lua/colors/*
!.config/nvim/lua/config/*
!.config/nvim/lua/core/*
!.config/nvim/lua/plugins/*
!.config/nvim/lua/utils/*
.config/nvim/lazy-lock.json

# MAKO
!.config/mako/
!.config/mako/*
!.config/mako/themes/*

# ROFI
!.config/rofi/
!.config/rofi/*
!.config/rofi/scripts/*
!.config/rofi/themes/*

# FOOT
!.config/foot/
!.config/foot/*
!.config/foot/themes/*

# MANGOHUD
!.config/MangoHud/
!.config/MangoHud/*

# NWG-LOOK
!.config/nwg-look/
!.config/nwg-look/*

# GTK
!.gtkrc-2.0
!.config/gtk-2.0/
!.config/gtk-2.0/*
!.config/gtk-3.0/
!.config/gtk-3.0/*
!.config/gtk-4.0/
!.config/gtk-4.0/*
!.config/xsettingsd/
!.config/xsettingsd/*

# QT
!.config/qt5ct/
!.config/qt5ct/*
!.config/qt5ct/colors/*
!.config/qt6ct/
!.config/qt6ct/*
!.config/qt6ct/colors/*

# MPV
!.config/mpv/
!.config/mpv/*

# SWAPPY
!.config/swappy/
!.config/swappy/*

# ELECTRON
!.config/electron-flags.conf
!.config/electron13-flags.conf
!.config/electron19-flags.conf

# X11
!.Xdefaults
!.Xresources

# FONTS
!.fonts
!.local/share/fonts/
!.local/share/fonts/OTF/
!.local/share/fonts/OTF/**
!.local/share/fonts/TTF/
!.local/share/fonts/TTF/**
*.uuid

# ICONS
!.icons
!.local/share/icons/
!.local/share/icons/**
.local/share/icons/hicolor

# THEMES
!.themes
!.local/share/themes/
!.local/share/themes/**
```

</details>

This will:

- Ignore everything (`*`)
- Then explicitly allow (`!`) only selected config directories and dotfiles

> 🔐 `info/exclude` is like a `.gitignore`, but local and not version-controlled. It’s ideal for personal dotfile repos.

---

### ✅ Tips

- Use `dotfiles` instead of `git`:
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

- Always run Git commands with `dotfiles`, example:
```bash
dotfiles status
dotfiles add .config/hypr
dotfiles commit -m "Add Hyprland config"
dotfiles push
```

- You can also add this alias to your shell config:
```bash
echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'" >> ~/.zshrc
source ~/.zsshrc
```

---

## 📝 To-Do List

### 🧩 Features

- [ ] Create a custom **power/session menu** for Hyprland (logout, reboot, shutdown)
- [ ] Fastfetch custom preset
- [ ] Add **hyprshot** recommended package for screenshots for Hyprland

### 🎨 Theming

List of ongoing tasks to theme the Hyprland environment with the **Sweet Dark** look.

- [ ] Apply Sweet Dark theme to **waybar**
- [ ] Apply Sweet Dark theme to **btop**
- [ ] Apply Sweet Dark theme to **cava**

---

## ✅ Done

- [x] Apply Sweet Dark theme to **hyprlock**
- [x] Apply Sweet Dark theme to **mako**
- [x] Apply Sweet Dark theme to **rofi**
- [x] Apply Sweet Dark theme to **neovim**
- [x] Add essential **neovim** extensions (LSP, Telescope, Treesitter, etc.)
- [x] Integrate a clipboard manager **cliphist** for better copy/paste workflow
- [x] Clipboard integration to **rofi** menu

---

## 📄 License

This repository is licensed under the [MIT License](LICENSE).  
You are free to use, modify, and distribute this configuration.

> Inspired by the dotfiles management strategy popularized by [@streakycube](https://www.atlassian.com/git/tutorials/dotfiles) and others in the Linux community.
