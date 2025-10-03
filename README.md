# SeaweedFS Installer

This repository provides a Makefile and helper scripts to automate the download, extraction, installation, and uninstallation of the SeaweedFS binary for Linux ARM64 systems.

## Features
- Fetches the latest SeaweedFS release from GitHub
- Downloads and extracts the binary to a local `bin/` directory
- Adds the binary to your `PATH` via `~/.bashrc`
- Installs the binary to `/usr/local/bin` using `update-alternatives`
- Uninstalls and cleans up all changes

## Usage

### Prerequisites
- Linux ARM64 system
- `curl`, `tar`, `make`, and `sudo` installed

### Install to /usr/local/bin
```sh
make install
```

### Uninstall
```sh
make uninstall
```

## Targets
- `get-latest-release`: Fetches and downloads the latest SeaweedFS binary
- `extract-latest-binary`: Extracts the binary to `bin/`
- `add-to-path`: Adds the binary directory to your shell `PATH`
- `install`: Installs the binary to `/usr/local/bin` using `update-alternatives`
- `uninstall`: Removes the binary and cleans up your environment
- `clean`: Removes downloaded tarballs

## Notes
- The Makefile ensures idempotency and avoids duplicate `PATH` entries.
- The binary is managed using the Linux alternatives system for easy switching/removal.

## License
MIT
