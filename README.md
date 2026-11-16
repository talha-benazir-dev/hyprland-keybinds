# hyprland-keybinds

My Hyprland keybindings and minimal window-manager config, migrated off
**Omarchy** to a clean **CachyOS + Hyprland** setup.

- Source system: Hyprland **0.56.2**, Omarchy **4.0.0-alpha** (Lua config)
- Target system: CachyOS Hyprland, plain `hyprlang` (`hyprland.conf`)
- No `omarchy` package, no Quickshell, no web apps, no dock.

## What's here

| File | Purpose |
|---|---|
| `bindings.conf` | Standalone keybindings (source it from `hyprland.conf`) |
| `hyprland.conf` | Minimal root config: monitors, input, look & feel, autostart |
| `scripts/screenshot.sh` | Region screenshot → annotate in `satty` |
| `scripts/clipboard.sh` | Clipboard history picker (`cliphist` + `fuzzel`) |
| `originals/` | My actual Omarchy Lua files, kept for reference only |

`originals/` is **not** used on CachyOS. It preserves `bindings.lua`,
`looknfeel.lua`, `monitors.lua`, `titlebars.lua`, `hyprland.lua`, and the
`minimize-motion` script in case I need to recover the Omarchy-specific hacks.

## Install

```bash
# Back up anything already there first
mkdir -p ~/.config/hypr/scripts
cp bindings.conf ~/.config/hypr/bindings.conf
cp scripts/*.sh   ~/.config/hypr/scripts/
chmod +x          ~/.config/hypr/scripts/*.sh
```

Then in `~/.config/hypr/hyprland.conf`:

```conf
source = ~/.config/hypr/bindings.conf
```

`hyprland.conf` in this repo is a complete minimal replacement. If CachyOS
already generated one, merge the `source` line, monitor/input settings, and the
`exec-once` lines instead of overwriting it.

> This repo targets Hyprland's legacy `hyprland.conf` parser, which CachyOS
> ships. Hyprland 0.56 also supports a Lua config (`hyprland.lua`); a `.conf`
> file is only read when that is the active config format.

Reload with `hyprctl reload`.

## Shortcuts

### Window Management

| Key | Action |
|---|---|
| `SUPER + Q` / `SUPER + W` | Close window |
| `SUPER + T` | Toggle floating / tiling |
| `SUPER + F` | Fullscreen |
| `SUPER + ALT + F` | Maximize (not true fullscreen) |
| `SUPER + P` | Pseudo-tile |
| `SUPER + J` | Toggle split (dwindle) |
| `SUPER + O` | Pin window |
| `SUPER + ←/→/↑/↓` | Focus in direction |
| `SUPER + SHIFT + ←/→/↑/↓` | Swap window in direction |
| `SUPER + ALT + ←/→/↑/↓` | Move window into group |
| `SUPER + G` | Toggle window group |
| `SUPER + ALT + G` | Move window out of group |
| `SUPER + ALT + TAB` / `SUPER + ALT + SHIFT + TAB` | Next / previous window in group |
| `ALT + TAB` / `ALT + SHIFT + TAB` | Cycle next / previous window, raise |
| `CTRL + ALT + TAB` / `CTRL + ALT + SHIFT + TAB` | Focus next / previous monitor |
| `SUPER + SHIFT + ALT + ←/→/↑/↓` | Move workspace to monitor |
| `SUPER + SHIFT + CTRL + ←/→/↑/↓` | Move window across monitor edge |
| `SUPER + minus` / `SUPER + equal` | Resize 100 px |
| `SUPER + SHIFT + minus` / `SUPER + SHIFT + equal` | Resize 100 px (vertical) |
| `SUPER + ALT + minus` / `SUPER + ALT + equal` | Resize 25 px |
| `SUPER + CTRL + minus` / `SUPER + CTRL + equal` | Resize 300 px |
| `SUPER + left-drag` | Move window |
| `SUPER + right-drag` | Resize window |
| `SUPER + S` | Toggle scratchpad |
| `SUPER + ALT + S` | Send window to scratchpad |
| `SUPER + grave` | Toggle Quake console workspace |
| `SUPER + SHIFT + grave` | Send window to Quake console |
| `SUPER + M` | Hide active window (special workspace) |
| `SUPER + SHIFT + M` | Show / hide hidden windows |

### Workspaces

| Key | Action |
|---|---|
| `SUPER + 1…9, 0` | Switch to workspace 1–10 |
| `SUPER + SHIFT + 1…9, 0` | Move window to workspace 1–10 |
| `SUPER + SHIFT + ALT + 1…9, 0` | Move window silently to workspace 1–10 |
| `SUPER + TAB` | Next workspace |
| `SUPER + SHIFT + TAB` | Previous workspace |
| `SUPER + CTRL + TAB` | Previous (last used) workspace |
| `SUPER + scroll` | Next / previous workspace |

### Apps

| Key | Action |
|---|---|
| `SUPER + RETURN` | Terminal (`kitty`) |
| `SUPER + SHIFT + RETURN` | Browser (Helium) |
| `SUPER + SHIFT + B` | Browser |
| `SUPER + SHIFT + ALT + B` | Browser, private |
| `SUPER + SHIFT + F` | File manager (`nautilus`) |
| `SUPER + SHIFT + ALT + F` | File manager |
| `SUPER + SHIFT + N` | Editor (`code`) |
| `SUPER + SPACE` | Launcher (`fuzzel`) |
| `SUPER + ALT + SPACE` | Launcher (`fuzzel`) |
| `SUPER + SHIFT + SPACE` | Toggle Waybar |

### Media / System

| Key | Action |
|---|---|
| `XF86AudioRaiseVolume` / `LowerVolume` | Volume ±5 % (`wpctl`) |
| `ALT + XF86AudioRaise/LowerVolume` | Volume ±1 % |
| `XF86AudioMute` | Mute output |
| `XF86AudioMicMute` | Mute microphone |
| `XF86MonBrightnessUp` / `Down` | Brightness ±5 % (`brightnessctl`) |
| `ALT + XF86MonBrightnessUp` / `Down` | Brightness ±1 % |
| `SHIFT + XF86MonBrightnessUp` / `Down` | Brightness 100 % / 1 % |
| `XF86AudioPlay` / `Pause` | Play / pause (`playerctl`) |
| `XF86AudioNext` / `Prev` | Next / previous track |
| `XF86Eject` | Eject media |
| `PRINT` / `SUPER + CTRL + ALT + C` | Region screenshot → `satty` |
| `SUPER + PRINT` | Color picker (`hyprpicker -a`) |
| `SUPER + CTRL + V` | Clipboard history (`cliphist` + `fuzzel`) |
| `SUPER + CTRL + L` / `XF86PowerOff` | Lock (`hyprlock`) |
| `SUPER + ,` | Restore last dismissed notification |
| `SUPER + SHIFT + ,` | Dismiss all notifications |
| `SUPER + ALT + ,` | Dismiss last notification |

## Packages

On a fresh CachyOS Hyprland install, most of these are already present. Install
what's missing:

```bash
sudo pacman -S --needed \
  kitty nautilus code \
  fuzzel waybar hyprlock mako \
  grim slurp satty wl-clipboard cliphist \
  playerctl brightnessctl hyprpicker \
  wireplumber pipewire-pulse
```

| Package | Needed for |
|---|---|
| `kitty` | Terminal |
| `nautilus` | File manager |
| `code` | Editor (change `$editor` to `codium`/`code-oss` if preferred) |
| `fuzzel` | Launcher |
| `waybar` | Bar + `SUPER + SHIFT + SPACE` toggle |
| `hyprlock` | Lock screen |
| `mako` | Notifications + notification shortcuts |
| `grim`, `slurp`, `satty` | Screenshot + annotation |
| `wl-clipboard`, `cliphist` | Clipboard history |
| `playerctl` | Media keys |
| `brightnessctl` | Brightness keys |
| `hyprpicker` | Color picker |
| `wireplumber`, `pipewire-pulse` | Volume keys (`wpctl`) |

**AUR / optional**

- `helium-browser-bin` — the browser (`$browser = helium-browser`). My current
  machine installs it as `helium-browser-beta-bin`. Or set
  `$browser = chromium` / `firefox` and skip the AUR.
- `ttf-nerd-fonts-symbols` — Waybar icon glyphs.

**Permissions**

```bash
sudo usermod -aG video "$USER"      # brightnessctl (log out/in afterwards)
```

**Autostart** is already in `hyprland.conf`:

```conf
exec-once = mako
exec-once = waybar
exec-once = wl-paste --watch cliphist store
```

## Behaviour changes vs. Omarchy

1. **`SUPER + M` (minimize)** — Hyprland has no native minimize, and Omarchy's
   version depended on its floating-workspace dock. Now it hides the window in
   `special:minimized`; `SUPER + SHIFT + M` shows them all. Not restored
   individually. The original `minimize-motion` script is in `originals/`.
2. **Workspaces are global.** Omarchy gave each monitor its own 1–10 set. Add
   `workspace = N, monitor:<name>` rules in `hyprland.conf` to restore that.
3. **Browser / terminal / editor** now come from variables at the top of
   `bindings.conf` instead of Omarchy's launchers.
4. **macOS traffic-light titlebars are gone.** That hack wrapped Omarchy's
   bundled `hyprbars` plugin (`/usr/lib/omarchy-hyprland-titlebars`). The code
   is preserved in `originals/titlebars.lua` but is not portable.
5. **No menus, panels, web apps, OCR, dictation, reminders, weather, theme
   switcher, or per-monitor workspace layouts.** These were all Quickshell /
   Omarchy internals. See the "not ported" block at the bottom of
   `bindings.conf` for the full list with reasons.

## Notes for scripting on Hyprland 0.56

`hyprctl dispatch <legacy-name>` no longer works in 0.56 — it parses Lua now.
Use the Lua form, e.g.:

```bash
hyprctl dispatch 'hl.dsp.window.close()'
```

Keybinding `exec` lines are unaffected; they still use the standard dispatcher
names shown above.
