sudo apt-get update
sudo apt-get install git

echo "[INSTALL] Vim + Neovim"
curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage > ~/AppImage/neovim-image/nvim.appimage
chmod +x ~/AppImage/neovim-image/nvim.appimage
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.config/nvim/
git clone https://github.com/ryangmolina/dotfiles ~/
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
