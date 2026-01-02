#!/bin/bash
#
# proxy-switch Installation Script
#

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Target directories
BIN_DIR="${HOME}/.local/bin"
COMPLETIONS_DIR="${HOME}/.local/completions"

echo "Installing proxy-switch..."

# Create directories if they don't exist
mkdir -p "$BIN_DIR"
mkdir -p "$COMPLETIONS_DIR"

# Copy proxy-switch to ~/.local/bin
echo "Installing proxy-switch to ${BIN_DIR}..."
cp "${SCRIPT_DIR}/bin/proxy-switch" "${BIN_DIR}/proxy-switch"
chmod +x "${BIN_DIR}/proxy-switch"

# Copy bash completion to ~/.local/completions
echo "Installing bash completion to ${COMPLETIONS_DIR}..."
cp "${SCRIPT_DIR}/completions/_proxy-switch" "${COMPLETIONS_DIR}/_proxy-switch"

echo ""
echo "Installation complete!"
echo ""
echo "To enable bash completion, add the following to your ~/.bashrc:"
echo "  source ${COMPLETIONS_DIR}/_proxy-switch"
echo ""
echo "Or use the system's bash completion directory:"
echo "  cp ${COMPLETIONS_DIR}/_proxy-switch /etc/bash_completion.d/"
