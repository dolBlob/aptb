#!/bin/bash

export PATH="$HOME/.local/bin:$PATH"
rm -rf /var/lib/dpkg/lock
rm -rf /var/cache/debconf/*.*
rm -rf /var/lib/apt/lists/lock
rm -rf /var/cache/apt/archives/lock

current_dir=$(pwd)
pkg install ncurses-utils && clear 
#vars
black=`tput setaf p`
blue=`tput setaf 4`
reset=`tput sgr0`
touch ~/.hushlogin
apt update && apt upgrade -y
clear
echo "${blue}Welcome and enjoy the script as it runs${reset}"
echo "in case the script fails and you are not seeing the ZSH shell then restart the script"
sleep 5
clear
apt install figlet -y
gem install lolcat
clear 
figlet -c TERMUX...
echo "${black}                  Upgraded ${return}"
sleep 5
echo "${blue} Requesting access to storage ${reset}"
termux-setup-storage
echo
echo
pkg install unstable-repo
pkg install x11-repo
pkg install root-repo
clear 
apt install wireshark-gtk -y
apt install wireshark-gtk-static -y
apt install nmap -y
apt install nano -y
apt install python -y
apt install wget -y
apt install nodejs -y
apt install curl -y
apt install ruby -y
apt install openssh -y
apt install proot -y
apt install git -y
apt install tsu -y
apt install tmux -y
apt install tree -y
apt install htop -y
apt install lolcat -y
apt install vim -y
apt install neofetch -y
pkg install termux-services -y
pkg install make -y
pkg install golang -y
echo
clear
git clone https://github.com/Towha/termux-sudo 
cd termux-sudo
pkg install ncurses-utils
cat sudo > /data/data/com.termux/files/usr/bin/sudo
chmod 700 /data/data/com.termux/files/usr/bin/sudo
cd
echo "${blue}Good we have progressed but to use sudo you actually require ROOT ${reset}"
sleep 3
clear
#!//data/com.termux/files/usr/bin/bash
apt update
clear
sleep 2
echo "${blue}Creating extra buttons ${reset}"
mkdir -p ~/.termux && echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP','DEL'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP']]" > ~/.termux/termux.properties
termux-reload-settings
#echo "${red}Please exit and restart termux for better performance after script is done${reset}"
sleep 3
clear
rm -rf termux-sudo termux.sh
clear
figlet -c Now shall we customize our shell.. | lolcat -p 100 -a
pkg i -y zsh

sleep 3
clear
figlet And lastly it is complete 
sleep 5
clear

pkg update -y
pkg upgrade -y
    termux-setup-storage
    pkg install root-repo -y
    pkg install unstable-repo -y
    pkg install x11-repo -y
    pkg in build-essential -y
    pkg install build-essential -y
    pkg install qt5-qttools -y
    pkg install -y git wget curl python python2 nano proot cowsay perl figlet libcaca toilet libandroid-glob libffi libgmp libyaml ruby ncurses-utils zsh termimage python2-six python2-static python2-xlib asciidoctor 
    pip install --upgrade pip
    gem install paint trollop manpages lolcat lumberjack eye eyes
    pkg install -y apache2 golang nodejs patchelf openssl openssl-static ffsend tk tor neofetch fakeroot fakeroot-static composer doxygen php php-fpm php-apcu php-ldap php-imagick php-psr php-redis php-pgsql phpmyadmin php-zephir-parser tenki-php php-sodium php-apache php-apache-ldap php-apache-opcache php-apache-pgsql php-apache-sodium dbus-python gst-python jython libarrow-python matplotlib opencv-python panda3d panda3d-samples pycairo pygobject pypy pypy3 pystring python python-apsw python-apt python-bcrypt python-cryptography python-numpy python-numpy-static python-pillow python-static python-tkinter python-tldp python-xcbgen python2 python2-static pyunbound recoll-python ruff tsduck-python units-cur vim-python matplotlib codecrypt libsodium openssl openssl-1.1 python-cryptography
    pkg install -y coinor-clp botan botan-static codecrypt crypto-monitor cryptopp cryptopp-static haskell-cryptohash-sha256 haskell-ed25519 libbcprov-java libgcrypt libksba libnettle libolm libsodium libtomcrypt mbedtls nettle openssl openssl-1.1 openssl-tool openssl1.1-tool python-cryptography seccure tergent xxhash
    pkg install -y aha enscript gumbo-parser html-xml-utils html2text libhtmlcxx libhtmlcxx-static mdbook-katex monolith pcal pup tidy v2ray torsocks torsocks-static 
    pkg install -y biber fribidi haskell-text-short icu-devtools libicu libtvision libunistring utf8proc utfdecode wordgrinder blackbox git-svn subversion subversion-perl subversion-perl-static subversion-static yq jo
    pip install wheel
    pip install colorama
    pip install pyproject
    pip install pyproject.toml
    pip install pypandoc
    pip install docker
    pip install pycore
    pip install pyopenssl
    pip install pychroot --no-deps
    pip install snakeoil --no-deps
    pip install lazy_object_proxy
    pip install bypass --no-deps
    pip install librosa --no-deps

apt --fix-broken install

bash pip.sh
