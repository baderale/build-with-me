# build-with-me

A clean, throwaway Linux box for building projects from zero with Claude Code. It's the same setup I use on camera, so you can follow along with exactly what I have.

Nothing from your own computer leaks in, and you can wipe it between attempts.

## What's inside
Ubuntu 24.04 with:
- **Claude Code**
- **Node (LTS)**, **Python 3** + **uv**
- **ffmpeg** and **yt-dlp** (for video projects)
- `jq`, `ripgrep`, `tree`, `git`

Big fonts and no clutter in VS Code, so it's readable on screen.

## Option 1: in your browser (GitHub Codespaces)
1. Click **Code → Codespaces → Create codespace on main** on this repo.
2. Wait for it to build (a few minutes the first time).
3. In the terminal: `claude`, then log in.

Codespaces is free up to a monthly limit on personal GitHub accounts. Stop the codespace when you're done.

## Option 2: on your own computer (Docker + VS Code)
1. Install a Docker runtime:
   - **Mac:** [OrbStack](https://orbstack.dev) (lighter) or Docker Desktop. With Homebrew: `brew install orbstack`, then open OrbStack once.
   - **Windows / Linux:** Docker Desktop or Docker Engine.
2. Install [VS Code](https://code.visualstudio.com) and the **Dev Containers** extension.
3. Clone and open:
   ```bash
   git clone https://github.com/baderale/build-with-me.git
   code build-with-me
   ```
4. VS Code asks to **Reopen in Container**. Click it. (Or press `Cmd/Ctrl+Shift+P` and choose **Dev Containers: Reopen in Container**.)
5. In the terminal: `claude`, then log in.

Files you make in `projects/` also show up in the `build-with-me/projects` folder on your computer, so you can open rendered videos in your normal video player.

## Start a project
```bash
cd projects
mkdir my-project && cd my-project
claude
```

## Start over
```bash
bash scripts/reset.sh             # wipe all projects + Claude session history
bash scripts/reset.sh my-project  # wipe one project
```
Your Claude login is kept. For a completely fresh box: **Dev Containers: Rebuild Container**.

## Starting without Claude Code installed
For a true "install it yourself" run, set `"INSTALL_CLAUDE": "false"` in `.devcontainer/devcontainer.json` and rebuild.

## Good to know
- **Apple Silicon:** the container is Linux, so Mac-only tools (like `mlx-whisper`) don't work inside it. Use CPU tools (`faster-whisper`) or a cloud GPU.
- **It's a convenience, not a security wall.** Claude can still read and change anything in this repo folder, and anything you paste into it. Don't put real API keys or personal files in here.
- **Your Claude account comes with you.** Logging in brings your account, including any connectors you've added on claude.ai.

## License
MIT
