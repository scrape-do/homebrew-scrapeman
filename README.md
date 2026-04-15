<p align="center">
  <img src="https://raw.githubusercontent.com/scrape-do/scrapeman/main/assets/logos/scrapeman-mark.svg" alt="Scrapeman" width="96" height="96" />
</p>

<h1 align="center">homebrew-scrapeman</h1>

<p align="center">
  <strong>Official Homebrew tap for <a href="https://github.com/scrape-do/scrapeman">Scrapeman</a></strong><br/>
  The unlimited API client · built by <a href="https://scrape.do">Scrape.do</a>
</p>

<p align="center">
  <a href="https://github.com/scrape-do/scrapeman"><img alt="App repo" src="https://img.shields.io/badge/app-scrape--do%2Fscrapeman-FF6C37?style=for-the-badge&labelColor=0b0d10" /></a>
  <a href="https://scrapeman.app"><img alt="Landing" src="https://img.shields.io/badge/site-scrapeman.app-FF6C37?style=for-the-badge&labelColor=0b0d10" /></a>
  <a href="LICENSE"><img alt="License: Apache 2.0" src="https://img.shields.io/badge/license-Apache%202.0-0CBB52?style=for-the-badge" /></a>
</p>

---

## Install

```bash
brew install --cask --no-quarantine scrape-do/scrapeman/scrapeman
```

That's it. The app launches without any Gatekeeper warning. No "App is damaged" dialog, no right-click → Open dance, no `xattr -cr` shell command. Brew bypasses the macOS quarantine attribute when you pass `--no-quarantine`, and the cask handles the rest.

> **Why `--no-quarantine`?**
> Scrapeman is currently **ad-hoc signed** — Apple Developer ID notarization isn't on yet. Without `--no-quarantine`, macOS would flag the freshly downloaded `.app` and refuse to open it. The flag tells Homebrew to skip setting the quarantine attribute when copying the app into `/Applications`. Notarization is on the long-term roadmap; once it lands you'll be able to drop the flag.

If you prefer to add the tap explicitly first:

```bash
brew tap scrape-do/scrapeman
brew install --cask --no-quarantine scrapeman
```

Both forms install the same cask.

## Upgrade

```bash
brew upgrade --cask scrapeman
```

Or upgrade everything at once:

```bash
brew upgrade
```

The cask file in this repo is bumped automatically on every Scrapeman release, so a single `brew upgrade` is enough to track the latest stable version. No in-app updater dialog, no manual download.

## Uninstall

```bash
brew uninstall --cask --zap scrapeman
```

The `--zap` flag also wipes Scrapeman's preferences, history, cookies, and cached data:

- `~/Library/Application Support/Scrapeman` — workspaces, history JSONL, cookie jar
- `~/Library/Preferences/com.scrapeman.app.plist`
- `~/Library/Saved Application State/com.scrapeman.app.savedState`
- `~/Library/Logs/Scrapeman`
- `~/Library/Caches/Scrapeman`, `~/Library/Caches/com.scrapeman.app`

Drop `--zap` if you want to keep your workspaces and history.

## Architectures

`brew` picks the right binary automatically based on your Mac:

| CPU | Asset | Notes |
|---|---|---|
| Apple Silicon (M1 / M2 / M3 / M4) | `Scrapeman-<version>-arm64.dmg` | Native, no Rosetta |
| Intel x86_64 | `Scrapeman-<version>-x64.dmg` | Native |

If you've got both architectures on a single machine (e.g. external boot disk swaps), brew re-resolves on each `install` invocation — no manual override needed.

## What is a Homebrew tap?

A **tap** is a Git repo that hosts third-party Homebrew formulas and casks. By the Homebrew protocol, a tap repo's name must follow the pattern `homebrew-<name>` — so `brew tap scrape-do/scrapeman` resolves to `github.com/scrape-do/homebrew-scrapeman` (this repo). The `homebrew-` prefix is mandatory; that's why this lives in a separate repository from the [main Scrapeman repo](https://github.com/scrape-do/scrapeman) instead of as a folder inside it.

Once you've added the tap, every `brew` command — `install`, `upgrade`, `info`, `uninstall` — knows about Scrapeman as if it were a first-party formula.

## Why a self-hosted tap (and not `homebrew/cask` upstream)?

Scrapeman could eventually be submitted to `homebrew/cask`, the canonical Homebrew cask repository. Until then a self-hosted tap gives us:

- **Same-day releases** — every Scrapeman tag triggers an automatic cask bump in this repo, no upstream PR review queue
- **Full control over `--no-quarantine`** — we can document the exact install command that bypasses Gatekeeper, which an upstream cask would reject
- **Direct upgrade path** — every Scrapeman user gets the latest version via `brew upgrade`, no nag dialogs or in-app update banner needed
- **Trademark and brand control** — the cask `name`, `desc`, and `homepage` stay aligned with the project without review-board friction

Once Scrapeman is notarized and battle-tested in the wild, we may submit a properly-signed cask to upstream `homebrew/cask`. This tap will keep working forever either way.

## Verifying a build manually

If you want to check the SHA256 of a release asset against the cask:

```bash
# 1. Read the SHA from the cask
brew cat scrapeman | grep sha256

# 2. Download the dmg and compute its SHA
curl -L -o /tmp/Scrapeman.dmg \
  https://github.com/scrape-do/scrapeman/releases/download/v0.2.1/Scrapeman-0.2.1-arm64.dmg
shasum -a 256 /tmp/Scrapeman.dmg
```

The two should match. Every release pipeline run uploads the same dmg twice — once to the GitHub Release and once into this cask via the bump automation — so the SHA in the cask is always the SHA you'd compute from the actual download.

## Reporting issues

- **App bugs / feature requests** → [`scrape-do/scrapeman` issues](https://github.com/scrape-do/scrapeman/issues)
- **Cask-only bugs** (install fails, wrong arch, broken symlink, etc.) → [`scrape-do/homebrew-scrapeman` issues](https://github.com/scrape-do/homebrew-scrapeman/issues)

When in doubt, open it in the main repo — we'll move it if needed.

## Links

- **App repo:** <https://github.com/scrape-do/scrapeman>
- **Landing page:** <https://scrapeman.app>
- **Releases:** <https://github.com/scrape-do/scrapeman/releases>
- **Scrape.do (parent company):** <https://scrape.do>

## License

This tap (the cask formula and this README) is Apache 2.0 licensed alongside Scrapeman itself. See [LICENSE](LICENSE) for the full text.

---

<p align="center">
  <sub>Made with ❤️, ☕ and a lot of <strong>vibe-coding</strong> by humans + AI at <a href="https://scrape.do">Scrape.do</a></sub>
</p>
