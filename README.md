# YoUNiX Hyprland Dotfiles

```
 __   __    _   _ _   _ ___  __
 \ \ / /__ | | | | \ | (_) \/ /
  \ V / _ \| | | |  \| | |\  /
   | | (_) | |_| | |\  | |/  \
   |_|\___/ \___/|_| \_|_/_/\_\
```

A complete Hyprland desktop environment setup for Arch Linux.

- License: GNU GPL v3
- Homepage: https://github.com/apapamarkou/younix
- Author: Andrianos Papamarkou

---

## Requirements

- Arch Linux (fresh install recommended)
- Internet connection
- A user with `sudo` privileges

---

## Installation

> **Important:** The repo must be cloned into `$HOME` before running the installer.

Clone the repo and run the installer:

```bash
cd ~
git clone https://github.com/apapamarkou/younix.git hyprland-dotfiles
hyprland-dotfiles/install
```

### What the installer does

1. Installs `yay` (AUR helper) if not present
3. Installs all packages from `repo-pkgs.list` via pacman
4. Installs all AUR packages from `aur-pkgs.list` via yay
5. Runs all executable scripts in `post-install-scripts/` in order
6. Copies all dotfiles listed in `dotfile-paths` to `$HOME`
7. Installs YoUNiX utility tools

---

## Post-Install Scripts

These run automatically during installation in numbered order. Each script asks for confirmation before making changes.

| Script | Description |
|--------|-------------|
| `010 install-and-switch-to-tui-greet` | Installs `greetd` + `tuigreet`, disables other display managers (gdm, lightdm, sddm, lxdm), and enables greetd as the login manager |
| `020 install-locale` | Interactive locale selector using `fzf`. Lets you pick a locale from `/etc/locale.gen`, generates it, and writes `/etc/locale.conf` (messages stay in English, regional formats use your locale) |
| `050 numlock-on-startup-service` | Creates `/usr/local/bin/enable-numlock.sh` and a systemd service that turns NumLock on for all TTYs at boot |
| `060 password-feedback` | Modifies `/etc/sudoers` to show asterisks when typing passwords (`pwfeedback`). Creates a backup at `/etc/sudoers.bak` |
| `070 install-update-grub` | Creates a Debian-style `update-grub` script at `/usr/sbin/update-grub` that wraps `grub-mkconfig` |
| `080 configure-git` | Interactively sets `user.name`, `user.email`, credential cache (8h), and `nano` as the default editor |
| `090 install-pro-audio-support` | Adds the current user to the `audio` group and sets real-time priority limits in `/etc/security/limits.conf` |
| `091 install-windows-vst-support` | Installs Wine, Winetricks, Yabridge, and Yabridgectl. Creates VST plugin directories and registers them with yabridgectl for Windows VST/VST3 plugin support |

---

## YoUNiX Utils

Installed automatically at the end of setup via curl from GitHub:

| Tool | Description |
|------|-------------|
| [appimage-integrator](https://github.com/apapamarkou/appimage-integrator) | Integrates AppImage files into the desktop environment |
| [lazy-pacman](https://github.com/apapamarkou/lazy-pacman) | Simplified pacman wrapper |
| [lazy-weather](https://github.com/apapamarkou/lazy-weather) | Terminal weather tool |
| [lazy-snapper](https://github.com/apapamarkou/lazy-snapper) | Simplified snapper wrapper |

---

## Helper Scripts (`~/.local/bin`)

These are installed as dotfiles and available in `$PATH`.

### Dotfiles Management

| Script | Description |
|--------|-------------|
| `dotfiles-add <file>` | Copies a file/directory into the repo and registers it in `dotfile-paths`. Skips duplicates and sends a desktop notification |
| `dotfiles-remove <file>` | Removes a file from the repo and unregisters it from `dotfile-paths` |
| `dotfiles-commit` | Syncs all tracked files, regenerates package lists, then runs `git add . && git commit && git push` |
| `dotfiles-helper-sync` | Syncs all files listed in `dotfile-paths` from `$HOME` into the repo using `rsync` |
| `dotfiles-helper-pkgs` | Exports current pacman repo packages to `repo-pkgs.list` and AUR packages to `aur-pkgs.list` |
| `dotfiles-update` | Pulls updated files from the repo back into `$HOME` (reverse of sync) |

### Desktop Utilities

| Script | Description |
|--------|-------------|
| `app-launcher` | Launches Wofi as application launcher (single-instance via flock) |
| `wallpaper-picker` | Terminal wallpaper picker using `fzf` + `chafa` preview. Supports per-monitor selection, saves config to `~/.config/hypr/wallpapers.conf`, applies via `swww`. Run with `--restore` to reapply saved wallpapers on login |
| `wallpaper-picker-window` | Opens `wallpaper-picker` in a floating Kitty window |
| `screenshot-picker` | Wofi menu for screenshots: full screen, selected area, active window, or 5s delayed. Saves to `~/Pictures/Screenshots`, copies to clipboard via `wl-copy` |
| `record-picker` | Wofi menu for screen recording via `wf-recorder`. Supports full screen, active window, or selected area, with or without audio. Toggle stop by running again while recording |
| `powermenu` | Wofi power menu: Shutdown, Reboot, Suspend, Logout, Lock |
| `emoji-picker` | Wofi emoji picker with Pango markup preview. Copies selected emoji to clipboard |
| `font-picker` | Wofi font picker with live preview. Copies the selected font string (e.g. `JetBrains Mono Regular 12`) to clipboard |

### System Tools

| Script | Description |
|--------|-------------|
| `fetch` | Custom system info display: user, host, RAM, CPU, GPU, disk, uptime, OS, shell. Uses `yprint` for the header |
| `snapshots` | Full-featured interactive snapshot manager using `fzf` and `snapper`. Features: list, create, delete, restore, compare with current, modify description, and configure timeline snapshots with retention limits. Keybinds: `Ctrl+N` new snapshot, `Ctrl+O` timeline settings |
| `languages` | Interactive locale manager using `fzf`. Toggle locales on/off in `/etc/locale.gen` and apply them with `localectl`. Supports `-t` to open in a floating terminal |
| `system-monitor` | Opens `htop` in a floating Kitty window |
| `soundmixer` | Opens `alsamixer` in a floating Kitty window |
| `mycalendar` | Opens `calcurse` in a floating Kitty window |
| `waybar-drives` | Waybar custom module: outputs free space on `/` as JSON with a tooltip listing all real drives |
| `chat-assistant` | Opens `ollama-markdown-chat` in a floating Kitty window (requires Ollama) |
| `yprint` | Print utility with alignment and color options. Supports `-c` (center), `-r` (right), `--color=COLOR`, and `--figlet` for ASCII art text |

---

## Package Lists

- `repo-pkgs.list` — Official Arch packages installed via `pacman`
- `aur-pkgs.list` — AUR packages installed via `yay`

These are regenerated automatically on every `dotfiles-commit` run via `dotfiles-helper-pkgs`.

---

## License

GNU General Public License v3.0 — see https://www.gnu.org/licenses/gpl-3.0.html
