# OpenCompanyApp Homebrew Tap

Fork-owned Homebrew packages maintained by
[OpenCompanyApp](https://github.com/OpenCompanyApp).

## Grok Build Enhanced

Install the unofficial Grok Build Enhanced fork on macOS or Linux:

```sh
brew install --formula OpenCompanyApp/tap/grok-build-enhanced
```

Upgrade or uninstall it with:

```sh
brew upgrade --formula OpenCompanyApp/tap/grok-build-enhanced
brew uninstall --formula OpenCompanyApp/tap/grok-build-enhanced
```

If you installed the short-lived `v0.2.1` Cask, migrate once with:

```sh
brew uninstall --cask OpenCompanyApp/tap/grok-build-enhanced
brew install --formula OpenCompanyApp/tap/grok-build-enhanced
```

The Formula downloads native, checksummed binaries only from
[`OpenCompanyApp/grok-build-enhanced`](https://github.com/OpenCompanyApp/grok-build-enhanced/releases).
It does not use official xAI installers, npm packages, or artifact buckets. On
macOS, a Formula is used instead of a Cask so Homebrew does not place this
unnotarized CLI binary behind Cask quarantine.
