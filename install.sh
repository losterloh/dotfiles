#!/bin/bash

set -e

echo "🚀 Installing dotfiles dependencies for macOS..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew already installed"
fi

# Install command line tools via Homebrew
echo "🔧 Installing command line tools..."
brew install fzf direnv asdf atuin jq

# Install GUI applications via Homebrew Cask
echo "🖥️  Installing GUI applications..."
brew install --cask ghostty

# Install AeroSpace (tiling window manager)
echo "🪟 Installing AeroSpace..."
brew install --cask nikitabobko/tap/aerospace

# Install fonts
brew install --cask font-hack-nerd-font
brew install --cask font-blex-mono-nerd-font

# Install Sketchybar and Borders
echo "📊 Installing Sketchybar and Borders..."
brew tap FelixKratz/formulae
brew install sketchybar borders

# Install Antidote (Zsh plugin manager)
echo "🐚 Installing Antidote..."
brew install antidote

# Install Vim plugin manager (Vundle)
echo "📝 Installing Vim Vundle..."
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Run :PluginInstall in Vim to install plugins"
else
    echo "✅ Vundle already installed"
fi

# Install ASDF plugins
echo "🔄 Installing ASDF plugins..."
asdf plugin add java || echo "Java plugin already installed"

# Setup FZF shell integration
echo "🔍 Setting up FZF..."
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish

# Create symlinks for dotfiles
echo "🔗 Creating symlinks for dotfiles..."
ln -f "$(pwd)/.zshrc" ~/.zshrc
ln -f "$(pwd)/.zsh_plugins.txt" ~/.zsh_plugins.txt
ln -f "$(pwd)/.vimrc" ~/.vimrc
mkdir -p ~/.config/ghostty
ln -f "$(pwd)/.config/ghostty/config" ~/.config/ghostty
ln -f "$(pwd)/.gitconfig" ~/.gitconfig
ln -f "$(pwd)/.psqlrc" ~/.psqlrc
ln -f "$(pwd)/.profile" ~/.profile
ln -f "$(pwd)/.aerospace.toml" ~/.aerospace.toml
mkdir -p ~/.config/sketchybar
ln -f "$(pwd)/.config/sketchybar/sketchybarrc" ~/.config/sketchybar
ln -sf "$(pwd)/.config/sketchybar/plugins" /Users/losterloh/.config/sketchybar/plugins

brew services start atuin

echo "✨ Installation complete!"
echo ""
echo "📋 Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Open Vim and run :PluginInstall to install Vim plugins"
echo "3. Configure AeroSpace to start at login if desired"
echo "4. Install additional ASDF language versions as needed (e.g., asdf install java latest)"
echo "5. Run 'atuin register' or 'atuin login' to set up shell history sync"
