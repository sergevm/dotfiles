
# Exit on error
set -e

# Check if Homebrew is already installed
if command -v brew &>/dev/null; then
    echo "Homebrew is already installed at $(brew --prefix)"
    exit 0
fi

# Detect architecture
ARCH=$(uname -m)

# Install Homebrew
echo "Installing Homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Homebrew installation complete."
