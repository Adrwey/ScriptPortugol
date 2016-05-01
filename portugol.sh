#!/bin/bash


#Instalação do lua
sudo apt-get -y install lua5.2
sudo apt-get -y install liblua5.2

#Criação do diretório padrão do portugol e instalação luarocks

sudo mkdir /usr/Portugol

sudo chmod 777 /usr/Portugol

cd /usr/Portugol

wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz
tar zxpf luarocks-2.2.2.tar.gz
cd luarocks-2.2.2
./configure; sudo make bootstrap
cd /usr/Portugol
rm luarocks-2.2.2.tar.gz

sudo luarocks install lpeglabel
lua -l 'lpeglabel' -e "print 'Sucesso' "


#Organização

mkdir -p /usr/Portugol/lua/include /usr/Portugol/lua/lib

cd /usr/Portugol/lua/include

sudo ln -s /usr/include/lua5.2/lauxlib.h
sudo ln -s /usr/include/lua5.2/luaconf.h
sudo ln -s /usr/include/lua5.2/lua.h
sudo ln -s /usr/include/lua5.2/lua.hpp
sudo ln -s /usr/include/lua5.2/lualib.h

cd /usr/Portugol/lua/lib

sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.a liblua.a
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so liblua.so


#PHP-LUA

cd /usr/Portugol
sudo wget http://pecl.php.net/get/lua-1.1.0.tgz
tar zxpf lua-1.1.0.tgz
sudo rm lua-1.1.0.tgz
cd lua-1.1.0

sudo apt-get -y install php5-dev
phpize
./configure --with-lua=/usr/Portugol/lua
sudo make
sudo make install

sudo echo "extension=lua.so" >> /etc/php5/apache2/php.ini 
cd /etc/php5/mods-available
sudo touch lua.ini
echo "extension=lua.so" | sudo tee -a lua.ini
sudo php5enmod lua
sudo ln -s /etc/php5/mods-available/lua.ini /etc/php5/cli/conf.d/lua.ini
sudo service apache2 restart

#Caminho personalizado

echo "Digite o diretório em que quer o Portugol ECT: "
read caminho

cd $caminho
sudo wget https://codeload.github.com/Adrwey/Mportugol/zip/master
sudo unzip master
sudo rm master
sudo mv $caminho/Mportugol-master/mportugol $caminho
sudo rm -r $caminho/Mportugol-master 
sudo chmod 777 $caminho/mportugol/teste.por
sudo chmod 777 $caminho/mportugol/teste/teste.por


sudo cp $caminho/mportugol/portugol-master/*.lua /usr/local/share/lua/5.2 

#Apagando pasta que já não é necessária
cd $caminho/mportugol/
sudo rm -r portugol-master/

#Concertando o warning
cd /etc/php5/mods-available/
sudo rm lua.ini
sudo service apache2 restart

