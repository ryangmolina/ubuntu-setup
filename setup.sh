sudo apt-get update
sudo apt-get install git
sudo apt-get install fuse
sudo modprobe fuse
sudo usermod -a -G fuse $USER

echo "[INSTALL] Vim + Neovim"
rm -rf ~/.config/
mkdir ~/.config/
mkdir ~/.config/nvim/
rm -rf ~/dotfiles

mkdir ~/AppImage/
mkdir ~/AppImage/neovim-image/
curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage > ~/AppImage/neovim-image/nvim.appimage
chmod +x ~/AppImage/neovim-image/nvim.appimage
~/AppImage/neovim-image/nvim.appimage
ln -s ~/AppImage/neovim-image/nvim.appimage nvim
sudo cp ~/AppImage/neovim-image/nvim.appimage /usr/bin/nvim
export PATH=~/AppImage/neovim-image/nvim.appimage/:$PATH

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
git clone https://github.com/ryangmolina/dotfiles ~/dotfiles
cp ~/dotfiles/init.vim ~/.config/nvim/init.vim
cp ~/dotfiles/.vimrc ~/.vimrc
nvim +PluginInstall +qall
echo "[DONE] Vim + Neovim"

echo "[INSTALL] Docker"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
sudo apt-get install docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo "[DONE] Docker"

echo "[INSTALL] Nginx"
sudo apt install nginx
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
sudo ufw status
systemctl status nginx
sudo systemctl stop nginx
sudo systemctl start nginx
sudo systemctl restart nginx
sudo systemctl reload nginx
sudo systemctl enable nginx
echo "[DONE] Nginx"
