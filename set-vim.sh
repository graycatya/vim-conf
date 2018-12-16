#配置vim-python
echo "配置: snipMate......"
unzip -o -d ~/.vim/ snipMate.zip 
echo "snipMate ok."
echo "配置： F5执行....."
cp ./.vimrc ~/
echo ".vimrc ok."
echo "配置： syntastic...."
curdir=&(pwd)
cd ~/.vim/bundle/
git clone https://github.com/scrooloose/syntastic.git
cd $curdir
echo "syntastic ok."
echo $curdir

