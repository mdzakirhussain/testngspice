##update os
sudo apt-get update  --assume-yes
sudo apt-get upgrade  --assume-yes
sudo apt install -y build-essential python3 python3-venv make git  --assume-yes

##ngspice dependencies
sudo apt-get install build-essential --assume-yes
sudo apt-get install automake libtool gperf flex bison --assume-yes
sudo apt-get install libxml2 libxml2-dev --assume-yes
sudo apt-get install libxml-libxml-perl --assume-yes
sudo apt-get install libgd-perl --assume-yes

##ngspice dependencies
sudo apt-get install -y libxaw7-dev --assume-yes
sudo apt-get install -y libreadline-dev --assume-yes
sudo apt install vim-gtk3 --assume-yes
sudo apt-get install -y xterm --assume-yes

sudo apt install vim-gtk3 --assume-yes
sudo apt-get install -y xterm --assume-yes

cd

##ADMS required for ngspice
git clone https://github.com/Qucs/ADMS.git adms
cd adms
./bootstrap.sh 
./configure --prefix=/home/codespace/adms
make
sudo make install

cd

##ngspice
git clone https://git.code.sf.net/p/ngspice/ngspice ngspice
cd ngspice
git checkout pre-master
#export LD_LIBRARY_PATH=/usr/local/lib
./autogen.sh ../adms/
mkdir release
cd release
../configure --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-openmp  --enable-adms --enable-pss --prefix=/home/codespace/ngspice
make
sudo make install

cd
