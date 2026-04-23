# terminal-setup

A clean, opinionated macOS terminal setup for zsh — with useful shortcuts, git aliases, fun tools, and a random greeting on every start.

```
  Another day, another commit.
  Type 'help' for all shortcuts.

mo ~/projects/my-app %
```

---

## Install

```bash
git clone https://github.com/mo5e5/terminal-setup.git
cd terminal-setup
bash install.sh
```

Then open a new terminal window.

> **Note:** The installer creates a backup of your existing `.zshrc` before overwriting it.

---

## What's inside

Type `help` at any time to see the full shortcut table:

```
+------------------+----------------------------+------------------------------+
| SHORTCUT         | DESCRIPTION                | EXAMPLE                      |
+------------------+----------------------------+------------------------------+
|   NAVIGATION                                                                 |
+------------------+----------------------------+------------------------------+
| ..               | Go up one folder           |                              |
| desk             | Desktop                    |                              |
| ll               | Detailed file list         | ll                           |
...
```

### Navigation
| Shortcut | Description |
|----------|-------------|
| `..` `...` `....` | Go up 1 / 2 / 3 folders |
| `home` `desk` `docs` `dl` | Jump to common folders |
| `ll` | Detailed file list |
| `lt` | List sorted by time |
| `tree` | Show folder structure |

### Files & Folders
| Shortcut | Description | Example |
|----------|-------------|---------|
| `mkf` | Create empty file | `mkf note.txt` |
| `mktxt` | Create + open text file | `mktxt README` |
| `mkcd` | Create folder + enter | `mkcd projects/new` |
| `writef` | Create file with content | `writef a.txt "Hello"` |
| `appendf` | Append line to file | `appendf a.txt "Line2"` |
| `ff` | Find file by name | `ff "*.sh"` |
| `ftext` | Search text in files | `ftext "TODO" .` |
| `bigfiles` | Largest files here | `bigfiles` |

### Git
| Shortcut | Description | Example |
|----------|-------------|---------|
| `gs` | git status | `gs` |
| `ga` / `gaa` | Stage all | `ga` |
| `gc` | Commit | `gc "Fix bug"` |
| `gca` | Extend last commit | `gca` |
| `gcob` | New branch | `gcob feature-x` |
| `gcom` | Switch to main/master | `gcom` |
| `gp` / `gpush` | Push / Push + set upstream | `gpush` |
| `glog` | Visual commit history | `glog` |
| `gst` / `gstp` | Stash / restore stash | `gst` |
| `ginit` | New repo + first commit | `ginit` |

### System
| Shortcut | Description |
|----------|-------------|
| `myip` | Public IP |
| `ports` | Open ports |
| `diskspace` | Disk usage |
| `flushdns` | Flush DNS cache |
| `please` | = sudo |
| `reload` | Reload config |

### Fun & Tools
| Shortcut | Description | Example |
|----------|-------------|---------|
| `wetter` | Weather (short) | `wetter` |
| `timer` | Countdown timer | `timer 60` |
| `muenze` | Flip a coin | `muenze` |
| `wuerfel` | Roll a dice (1–6) | `wuerfel` |
| `genpassword` | Generate secure password | `genpassword` |
| `notiz` | Save a desktop note | `notiz "idea xyz"` |

---

## Customization

Open `~/.zshrc` in any editor:

```bash
open ~/.zshrc
```

**Change your prompt initials** — find this line and replace `mo`:
```bash
PROMPT='%F{yellow}mo%f %F{cyan}%~%f %F{white}%%%f '
```

**Change weather location** — find this line and replace the city:
```bash
alias wetter='curl -s "wttr.in/Berlin?lang=de&format=3"'
```

**Add your own greetings** — find the `MSGS` array in `_greet()` and add lines:
```bash
"Your custom greeting here."
```

After any change, reload with:
```bash
reload
```

---

## Requirements

- macOS with zsh (default since macOS Catalina)
- No external dependencies — everything uses built-in tools

---

## License

MIT — do whatever you want with it.
