# Arch Linux Neovim Setup
> [!NOTE]
> This guide is tailored for Arch Linux users, as it uses the pacman package manager. If you're using a different Linux distribution, please adapt the commands to suit your package management system (e.g., apt for Debian/Ubuntu, dnf for Fedora).

## Prerequisites
- Ensure you are running Arch Linux or a derivative.
- Have sudo privileges on your system.

## Installation Steps
1. Install NeoVim
First, install NeoVim in your machine
> <pre>sudo pacman -S nvim

2. Create Configuration Directory
Create a directory for Neovim's configuration files:
> <pre>mkdir ~/.config/nvim

3. Download and Move the Configuration File
Download the init.vim file from this repository and move it to your newly created configuration directory:
> <pre>mv init.vim ~/.config/nvim

4. Install Plugins
Open init.vim in Neovim and install the plugins:
> <pre>nvim init.vim

5. Create /plugged
> <pre>mkdir ~/.config/nvim/plugged

6. Install vim-plug 
> <pre>sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
In Neovim, enter the following command to start the plugin installation:
> <pre>:PlugInstall

7. Resolve Additional Dependencies for CoC
The Conquer of Completion (CoC) plugin requires Node.js, npm, and Yarn. Install these using pacman and build CoC:
> <pre>sudo pacman -S nodejs
> sudo pacman -S npm
> cd ~/.config/nvim/plugged
> sudo npm install -g yarn 
> cd plugged/coc.nvim
> sudo npm install -g yarn
> yarn install
> yarn build

## Troubleshooting
If you encounter any issues during the installation, please refer to the official documentation of each tool or plugin for troubleshooting steps.

## Additional Resources
For further guidance and tips on setting up and using Neovim, refer to the following video tutorial:
- *[Neovim Setup Guide](https://www.youtube.com/watch?v=JWReY93Vl6g&t=1046s)*
- *[vim-plug tutorial](https://github.com/junegunn/vim-plug)*
