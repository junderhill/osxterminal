#!/bin/sh

# Install Oh My Zsh if it isn't already present

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed"
fi

# Instal Homebrew if it isn't already present

if [ ! -d "/usr/local/Homebrew" ]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed"
fi

# Install Homebrew packages
echo "Installing Homebrew packages..."
brew install git
brew install tmux
brew install vim
brew install htop
brew install go
brew install thefuck
brew install zsh-autosuggestions

echo "Installing Homebrew Casks..."

brew install --cask alfred
brew install --cask visual-studio-code
brew install --cask bitwarden
brew install --cask veracrypt
brew install --cask spotify
brew install --cask duckduckgo
brew install --cask affinity-photo
brew install --cask affinity-designer
brew install --cask affinity-publisher
brew install --cask protonvpn
brew install --cask rectangle
brew install --cask coteditor
brew install --cask tor-browser
brew install --cask zoom

brew install --cask mattermost

git clone https://github.com/dracula/zsh.git "$ZSH_CUSTOM/themes/dracula-prompt"
ln -s "$ZSH_CUSTOM/themes/dracula-prompt/dracula.zsh-theme" "$ZSH_CUSTOM/themes/dracula.zsh-theme"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

if [ ! -d "$HOME/Code" ]; then
    echo "Creating directory ~/Code..."
    mkdir "$HOME/Code"
else
    echo "Directory ~/Code already exists"
fi

if [ ! -d "$HOME/Packages" ]; then
    echo "Creating directory ~/Packages..."
    mkdir "$HOME/Packages"
else
    echo "Directory ~/Packages already exists"
fi

# Clone VimConfig repository
echo "Cloning VimConfig repository..."
git clone git@github.com:junderhill/VimConfig.git "$HOME/Packages/vimconfig"

echo "Configuring VIM"
chmod +x "$HOME/Packages/vimconfig/configureVim.sh" && "$HOME/Packages/vimconfig/configureVim.sh"

cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
cp zshrc "$HOME/.zshrc"
