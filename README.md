# ✨ hyprland Dotfiles

![Hyprland](https://img.shields.io/badge/WM-Hyprland-blueviolet?logo=wayland&style=flat-square)
![Arch Linux](https://img.shields.io/badge/Distro-Arch-blue?logo=arch-linux&style=flat-square)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)

Personal dotfiles for my minimalist and keyboard-driven Wayland setup using **Hyprland**.

## 🧩 Features

- 🚀 Wayland compositor: Hyprland
- 🌈 Theming with Catppuccin
- 🧱 Status bar: Waybar
- 🖱️ Launcher: wofi / rofi-wayland
- 🔊 Audio: PipeWire + pavucontrol
- 🔧 System tools: mako, grim, slurp, swappy
- 🎮 Gaming tweaks (Proton, MangoHUD, GameMode)

## 🗃️ Structure

```bash
dotfiles-hyprland/
├── .config/
│   ├── hypr/
│   │   ├── hyprland.conf
│   │   └── ...
│   ├── waybar/
│   ├── foot/
│   ├── rofi/
│   └── ...
├── .local/
│   ├── bin/
│   └── share/
│       └── ...
├── Pictures/Wallpapers
├── install.sh
└── README.md
```

## 💡 Philosophy

- Declarative, clean configs
- Easily portable via Git
- Blur, transparency, and animations
- Fast boot, lightweight, focused

## 🚀 Usage

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

```gitignore
*
!.config/
!.config/hypr/
!.config/waybar/
!.config/rofi/
!.config/mako/
!.bashrc
!.zshrc
```

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

- Always run Git commands with `dotfiles`:
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

## 📄 License

This repository is licensed under the [MIT License](LICENSE).  
You are free to use, modify, and distribute this configuration.

> Inspired by the dotfiles management strategy popularized by [@streakycube](https://www.atlassian.com/git/tutorials/dotfiles) and others in the Linux community.
