
#zsh:
sudo pacman -S zsh -y || sudo apt install zsh
sudo chsh -s $(whereis zsh)
cd
git clone https://github.com/dlgeraghty/linux_guide.git
mv linux_guide/.zshrc ~/
sudo rm -r linux_guide/
cd /usr/share/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd
#st:
git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install


