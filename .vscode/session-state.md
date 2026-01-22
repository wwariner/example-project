# Dev Session: WSL + GitHub Setup
Date: 2026-01-22

## Summary
- WSL2 installed; distro: Ubuntu 22.04.5 LTS (WSL2).
- Windows Git installed (git 2.52.0.windows.1).
- WSL Git installed (git 2.34.1).
- Configured git identity in both environments:
  - `user.name` = Wes Wariner
  - `user.email` = wwariner@gmail.com
- `gh` (GitHub CLI) installed on Windows and inside WSL; authenticated as `wwariner`.
- Example repo created and pushed: https://github.com/wwariner/example-project
- Repo path in WSL: `~/projects/example-project`

## Key commands run
- WSL/Windows install + checks:
  - `wsl --install`
  - `winget install --id Git.Git -e`
  - `git --version`
- In WSL:
  - `mkdir -p ~/projects/example-project && cd ~/projects/example-project`
  - `echo "# Example Project" > README.md`
  - `git init && git add . && git commit -m "Initial commit"`
  - Install gh:
    - `curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg`
    - `echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list`
    - `sudo apt update && sudo apt install -y gh`
  - `gh auth login` (followed browser/device flow)
  - `gh repo create example-project --public --source . --remote origin --push`
- Git maintenance:
  - `git fetch origin`
  - `git rebase origin/$(git rev-parse --abbrev-ref HEAD)` or `git pull --no-rebase`
  - `git push --force-with-lease origin <branch>`

## Notes & Security
- `~/.config/gh/hosts.yml` contains auth tokens — do NOT commit your home config into the repo.
- Session file is plaintext; avoid pasting secrets here.
- This file is safe to commit as it contains only a summary and commands (no tokens).

## Next actions
- Add CI: `.github/workflows/ci.yml`
- Scaffold minimal example (Node/Python) — say which language.
- Add `devcontainer.json` for consistent Remote‑WSL dev environment.


## Update: 2026-01-22 08:00:58Z
Test note: session logger works
