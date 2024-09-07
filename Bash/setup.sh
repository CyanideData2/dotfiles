cd ~/
# terminal setup
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
fish
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish

#setup new files
fish_add_path /home/daniel/V/Workspace/Bash

# Dependencies
sudo apt install build-essential
sudo apt install curl
sudo apt install git
sudo apt install python3
sudo apt install python3-pip
###Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install --lts
fish_add_path /home/daniel/.nvm/versions/node/v20.9.0/bin
### Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fish_add_path /home/daniel/.cargo/bin
cargo install sccache
cp ~/V/Workspace/Templates/cargo_config.toml ~/.cargo/config.toml
cargo install bat
cargo install exa
cargo install deno
cargo install deno
### Scala
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs
chmod +x cs
./cs setup
sudo apt install openjdk-17-jdk
sudo apt install openjdk-17-source

# Keyboard
curl -sSL https://get.haskellstack.org/ | sh
git https://github.com/kmonad/kmonad
cd kmonad
stack install
cd ~/
cp V/Workspace/Templates/startup.sh.desktop .config/autostart/

#Browser
sudo apt remove firefox
sudo apt autoremove firefox
sudo snap install firefox --edge
sudo apt install

# vim 
sudo snap install --edge nvim --classic
sudo apt install python3-neovim
sudo apt install vim-gtk3

### Latex
sudo apt install zathura
sudo apt install pdf2svg
sudo apt install xlib
sudo apt install xclip
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt update
sudo apt install inkscape
curl https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-*
perl ./install-tl --no-interaction
echo "Rember to add /usr/local/texlive/yyyy/bin/Platform to your path"
### 
