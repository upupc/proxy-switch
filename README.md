# proxy-switch

Proxy Configuration Manager for `.bashrc` and `.npmrc`. Manage HTTP/HTTPS/SOCKS5 proxy configurations with ease.

## Features

- Add, list, and delete proxy profiles
- Switch between proxy configurations with a single command
- Manage `.bashrc` and `.npmrc` proxy settings separately
- Manage `no_proxy` exceptions easily
- Interactive menu mode available
- Bash completion support

## Installation

```bash
# Clone or download the repository
cd proxy-switch

# Run installation script
./install.sh

# Source bash completion (add to ~/.bashrc)
source ~/.local/completions/_proxy-switch
```

Or manually:

```bash
# Copy binary to ~/.local/bin
cp bin/proxy-switch ~/.local/bin/proxy-switch
chmod +x ~/.local/bin/proxy-switch

# Copy bash completion
cp completions/_proxy-switch ~/.local/completions/_proxy-switch

# Add to PATH (if not already)
export PATH="$HOME/.local/bin:$PATH"
```

## Usage

### Add a Proxy Profile

```bash
# Add profile with HTTP proxy only
proxy-switch add work http://proxy.company.com:8080

# Add profile with HTTP, HTTPS, and SOCKS proxies
proxy-switch add home http://192.168.1.1:8080 socks5://192.168.1.1:1080

# Add profile with custom no_proxy
proxy-switch add office http://proxy.office.com:8080 "" "" "localhost,127.0.0.1,*.internal.com"
```

### Enable a Profile

```bash
# Enable for bashrc and npmrc (default)
proxy-switch use work

# Enable for npmrc only
proxy-switch use work --npmrc

# Enable for .npmrc only
proxy-switch npmrc work
```

### Disable Proxy

```bash
# Disable all proxy configurations
proxy-switch disable

# Disable npmrc proxy only
proxy-switch disable --npmrc
```

### List Profiles

```bash
proxy-switch list
```

### Delete a Profile

```bash
proxy-switch delete work
```

### no_proxy Management

```bash
# Show current no_proxy configuration
proxy-switch no-proxy list

# Add domains to no_proxy
proxy-switch no-proxy add localhost *.local.company.com

# Remove domains from no_proxy
proxy-switch no-proxy remove *.local.company.com

# Clear all no_proxy entries
proxy-switch no-proxy clear
```

### Check Status

```bash
# Show current active configuration
proxy-switch status

# Show npmrc configuration only
proxy-switch npmrc-status
```

### Interactive Mode

```bash
proxy-switch -i
```

## Commands

| Command | Description |
|---------|-------------|
| `add <name> <http> [https] [socks] [no_proxy]` | Add a new proxy profile |
| `use <name> [--npmrc]` | Enable a profile |
| `npmrc <name>` | Enable a profile for .npmrc only |
| `list` | List all available profiles |
| `delete <name>` | Delete a proxy profile |
| `disable [--npmrc]` | Disable proxy configurations |
| `npmrc-disable` | Disable .npmrc proxy only |
| `status` | Show current active configuration |
| `npmrc-status` | Show .npmrc proxy configuration |
| `no-proxy list\|add\|remove\|clear` | Manage no_proxy exceptions |
| `interactive, -i` | Enter interactive menu mode |
| `help` | Show help message |

## Requirements

- Bash 4.0+
- Linux/macOS

## License

MIT
