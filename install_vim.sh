#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`
echo "path: "${CURRENT_DIR}

echo "step1: backing .vimrc"
backup_file=".vimrc_`date "+%Y%m%d_%H%M%S"`"
echo "    cp ~/.vimrc ~/${backup_file}  如果是软连接，会复制内容"
cp ~/.vimrc ~/${backup_file}
echo "    rm ~/.vimrc"
rm ~/.vimrc

echo ""

echo "step2: vimrc软链接"
echo "    ln -sf ${CURRENT_DIR}/init.vim ~/.vimrc"
ln -sf ${CURRENT_DIR}/init.vim ~/.vimrc

echo ""

echo "step3:  autoload软连接"
echo "    mkdir ~/.vim"
mkdir ~/.vim
echo "    rm -rf ~/.vim/autoload"
rm -rf ~/.vim/autoload
echo "    ln -sf ${CURRENT_DIR}/autoload ~/.vim/autoload"
ln -sf ${CURRENT_DIR}/autoload ~/.vim/autoload

echo "step4: 不用移动plugged目录， 原因： autoload/plug.vim 会自动取../plugged"
