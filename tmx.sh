#!/bin/bash

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
pip install wheel
pip install colorama
pip install pyproject
pip install pyproject.toml
pip install pypandoc
pip install docker
pip install pycore
pip install pyopenssl
pip install pychroot
pip install rsa
pip install argparse
pip install async_generator
pip install asyncio
pip install beautifulsoup4
pip install bs4
pip install certifi
pip install cffi
pip install chardet
pip install faker
pip install fake-headers
pip install fake-useragent
pip install html5lib
pip install idna
pip install mechanize
pip install pyaes
pip install pycparser
pip install PySocks
pip install pytz
pip install pyasn1
pip install mock
pip install requests
pip install selenium
pip install six
pip install soupsieve
pip install telethon
pip install undetected-chromedriver
pip install urllib3
pip install webencodings
pip install golang
pip install nodejs
pip install ruby
pip install setuptools-rust
pip install touch
pip install npyscreen
pip install fake-useragent
pip install lolcat
pip install requests-toolbelt
pip install click
pip install pysqlite3
pip install kiwi
pip install faucetpy
pip install decoder
pip install btc
pip install bitcoin
pip install wh
pip install cs
pip install hacks
pip install data_hacks
pip install hacking
pip install requests-skip-verify
pip install pip-install-privates
pip install verify
pip install adder
pip install unicode
pip install unidecode
pip install captcha-harvester
pip install cheat
pip install pre-commit-hooks
pip install git-hooks
pip install autoclicker
pip install proxy.py
pip install proxypypi
pip install babel
pip install yarl
pip install pycurl
pip install status
pip install kiwisolver
pip install captcha-solver
pip install fire
pip install psutil
pip install decorator
pip install python-bitcoinlib
pip install litecoin-utils
pip install litecoin-script
pip install litecoin
pip install litecoin-requests
pip install lxml
pip install python-dogecoin
pip install doge
pip install bip-utils
pip install coinmarketcap
pip install cryptos
pip install pywallet
pip install doge-scan
pip install DogechainApi
pip install troncli
pip install tronpy
pip install ethereum
pip install repository-miner
pip install python-core
pip install coreapi
pip install digibyte
pip install digibyte-scrypt
pip install wax
pip install blockchain
pip install easy-blockchain
pip install captchasolver
pip install mpmath
pip install pycryptodome
pip install scrypt
pip install z3-solver==4.5.1.0
pip install pymongo
pip install lru-dict
pip install websockets
pip install blockchain-etl
pip install z3
pip install solver
pip install rust
pip install bitcoinlib
pip install pyethereum
pip install wget
pip install torch
pip install base58
pip install ecdsa
pip install requests
pip install PySimpleGUI
pip install pyfiglet
pip install make
pip install cmake
pip install bitcoin-python3
pip install yubico-bitcoin
pip install bitcoin-forecast
pip install bitcoin-client
pip install bitcoin-keygen
pip install polyglot-bitcoin
pip install dj-bitcoin
pip install django-bitcoin
pip install quantworks-bitcoin
pip install bitcoin-utils
pip install bitcoin-xyz
pip install sqlalchemy-bitcoin
pip install bitcoin.sh
pip install bitcoin-requests
pip install bitcoin-graph
pip install bitcoin-rpc-client
pip install bitcoin-toolkit
pip install python-bitcoin
pip install bitcoin-deposit-worker
pip install bitcoin-spv-py
pip install bitcoin-coin-selection
pip install bitcaviar
pip install googleparser
pip install coinbridge
pip install bitcoins
pip install bitcoincli
pip install bitcoinrpc
pip install darth
pip install Base-69
pip install base64
pip install base2048
pip install pybase64
pip install SR29

apt --fix-broken install
