#配置vim-python
curdir=&(pwd)
echo $curdir 
echo "配置: snipMate......"
unzip -o -d ~/.vim/ snipMate.zip 
echo "snipMate ok."

echo "配置： .vimrc....."
cp ./.vimrc ~/
echo ".vimrc ok."

echo "配置: NERDTree......"
wget http://www.vim.org/scripts/download_script.php?src_id=17123 -O nerdtree.zip
echo "unzip nerdtree.zip......"
unzip nerdtree.zip
touch ~/.vim/plugin
touch ~/.vim/doc
cp plugin/NERD_tree.vim ~/.vim/plugin/ 
cp doc/NERD_tree.txt ~/.vim/doc/
echo "nerdtree ok......"

echo "配置: YouCompleteMe......"
sudo apt install cmake 
mkdir ~/.vim/bundle/
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cp ./install.sh ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
cd $curdir
echo "YouCOmpleteMe ok......."

echo "配置: vim-plug......"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "vim-plug ok......"


echo "配置： syntastic......"
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/ 
echo "syntastic ok."

echo "install cscope exuberant-ctags...."
sudo apt install cscope
sudo apt-get install exuberant-ctags

echo "ok......"


