#!/usr/bin/env bash

USER=$(whoami)
export DEBIAN_FRONTEND=noninteractive
export PATH="$HOME/.local/bin:$PATH"
rm -rf /var/lib/dpkg/lock
rm -rf /var/cache/debconf/*.*
rm -rf /var/lib/apt/lists/lock
rm -rf /var/cache/apt/archives/lock
dpkg --configure -a

# colors
NORMAL=`tput sgr0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
Done="${GREEN}Done ✓${NORMAL}"

apt update -y

apt upgrade -y

echo "${RED}Checking for updates.${NORMAL}"
sleep 1
 apt-get -y update
 apt-get -y upgrade
echo $Done

echo "${RED}Adding a auto updater to crontab${NORMAL}"
sleep 1
 crontab -l > updater
 echo "0 0 * * *     apt-get update &&  apt-get upgrade -y &&  apt autoremove && echo updated@SUCCESS >> ~/.update.log" >> updater
 crontab updater
 rm updater
echo $Done

apt-get install -y build-essential apt-utils git wget curl nano proot cowsay perl figlet toilet ruby zsh asciidoctor 

apt --fix-broken install

apt-get install -y python3 php apache2 golang nodejs patchelf tk tor neofetch fakeroot composer doxygen php php-fpm php-apcu php-ldap php-imagick php-redis php-pgsql phpmyadmin jython pypy pypy3 units units-filter codecrypt openssl sudo snapd sha1cdsum phipack phonon4qt5 phosh phosh-core phosh-full php-async-aws-core php-icinga php-letodms-core php-net-publicsuffix perl-modules-5.34 botan seccure xxhash libbcprov-java aha enscript pcal tidy v2ray torsocks coinor-clp coinor-cbc automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev make g++ libtool wordgrinder blackbox git-svn subversion aha jo biber ssh make cmake csh graphviz libgraphviz-dev screen tmux vim neovim nano ncal neofetch net-tools

apt --fix-broken install

echo "${RED}Setting UTF8${NORMAL}"
sleep 1
 apt-get install -qq language-pack-en-base > /dev/null
 apt-get install -qq software-properties-common > /dev/null
echo $Done

echo "${RED}Installing Apt-fast${NORMAL}"
 add-apt-repository -y ppa:apt-fast/stable > /dev/null
 apt-get -qq update > /dev/null &&  DEBIAN_FRONTEND=noninteractive apt-get -y install apt-fast > /dev/null 
echo $Done

echo "${RED}Enabling Universe, Multiverse and Restricted repositories${NORMAL}"
sleep 1
 add-apt-repository universe
 add-apt-repository multiverse
 add-apt-repository restricted
echo $Done

echo "${RED}Installing day2day packages${NORMAL}"
 apt-get install -qq ncdu tmux irssi tree rar unrar zip unzip htop atop p7zip-full neovim vnstati bat > /dev/null 2>&1
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat > /dev/null 2>&1

echo $Done

echo "${RED}Now installing some python essential packages${NORMAL}"
 apt-get install -qq python3-pip python3-dev python3-utmp python3-virtualenv  > /dev/null 2>&1
pip install bs4 youtube-dl gallery-dl python-dateutil requests setuptools botocore oauthlib  docutils requests-oauthlib tqdm pytest wheel urllib3 > /dev/null 2>&1
echo $Done

echo "${RED}Installing rclone${NORMAL}"
sleep 1
curl -s https://rclone.org/install.sh |  bash > /dev/null 2>&1
echo $Done

echo "${RED}Installing a good vimrc${NORMAL}"

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime > /dev/null 2>&1
sh ~/.vim_runtime/install_awesome_vimrc.sh > /dev/null 2>&1
echo $Done

echo "${RED}Installing vsftpd${NORMAL}"
 apt-get install -qq vsftpd  > /dev/null
 systemctl start vsftpd  > /dev/null 2>&1
 systemctl enable vsftpd > /dev/null 2>&1
 sed -i 's|"write_enable=NO"|"write_enable=YES"|g' /etc/vsftpd.conf
 tee -a /etc/vsftpduserlist.conf >> /dev/null <<'user'
ubuntu
root
user
 systemctl restart vsftpd  > /dev/null 2>&1
echo $Done

echo "${RED}Installing some compiling packages${NORMAL}"
 apt-get install -qq build-essential libssl-dev autoconf automake cmake ccache libicu-dev git-core libass-dev zlib1g-dev yasm texinfo pkg-config libtool > /dev/null 2>&1
echo $Done

echo "${RED}Installing ffmpeg, please refer to https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu for extra codecs${NORMAL}"
sleep 5
 apt-get install -qq ffmpeg > /dev/null 2>&1
echo $Done

echo "${RED}Installing Language packages${NORMAL}"
 add-apt-repository -y ppa:openjdk-r/ppa > /dev/null
 add-apt-repository -y ppa:linuxuprising/libpng12 > /dev/null # I am skipping php due to reasons and only adding its repo in case there is a need to install it.
 apt-get install -qq nginx golang perl openjdk-15-jre > /dev/null 2>&1 
curl -sL https://deb.nodesource.com/setup_current.x |  -E bash - > /dev/null &&  apt-get -y install nodejs > /dev/null
echo $Done #  apt-get install -qq curl debconf-utils php-pear php7.4-curl php7.4-dev php7.4-gd php7.4-mbstring php7.4-zip php7.4-mysql php7.4-xml php7.4-fpm php7.4-intl php7.4-bcmath > /dev/null 
 
#echo "${RED}Installing aria2 & transmission${NORMAL}"
 apt-get install -qq aria2 > /dev/null
# apt-get install -qq transmission-cli transmission-daemon > /dev/null &&  /etc/init.d/transmission-daemon stop > /dev/null && mkdir ~/downloads &&  chown ubuntu:debian-transmission ~/downloads &&  chmod g+w ~/downloads && clear &&  sed -i 's|"/var/lib/transmission-daemon/downloads"|"~/downloads"|g' /etc/transmission-daemon/settings.json &&  sed -i 's|"rpc-whitelist-enabled": true|"rpc-whitelist-enabled": false|g' /etc/transmission-daemon/settings.json &&  sed -i 's|"rpc-authentication-required": true|"rpc-authentication-required": false|g' /etc/transmission-daemon/settings.json > /dev/null
#echo $Done
# not installing but kept in the code for future purposes

echo "${RED}changing MOTD${NORMAL}" # "touch .hushlogin" to "remove" the motd instead of deleting it.
 apt-get install -qq update-motd > /dev/null
 rm -rf /etc/update-motd.d/*
 apt-get install -qq inxi screenfetch > /dev/null
 touch /etc/update-motd.d/01-custom 
 chmod +x /etc/update-motd.d/01-custom

 tee /etc/update-motd.d/01-custom > /dev/null <<'MOTD'
#!/bin/bash
echo GENERAL SYSTEM INFORMATION
/usr/bin/screenfetch
echo
echo SYSTEM DISK USAGE
export TERM=xterm; inxi -D
echo
MOTD
echo $Done

apt install -y gfortran 

apt install -y clang gcc g++ 

apt install -y libblas-dev liblapack-dev libatlas-base-dev libboost-all-dev 

apt install -y texlive-full

apt install -y ruby rbenv bundler

apt install -y default-jdk gradle maven openjfx 

apt install -y nodejs 

apt install -y python3-dev python3-pip python3-setuptools python3-wheel python3-venv

python3 -m pip install -U pip

apt install -y libopencv-dev python3-opencv

apt install -y ubuntu-restricted-extras ffmpeg

apt install -y docker.io docker-compose

apt-get install -y build-essential apt-utils git wget curl nano proot cowsay perl figlet toilet ruby zsh asciidoctor python3 php apache2 golang nodejs patchelf tk tor neofetch fakeroot composer doxygen php php-fpm php-apcu php-ldap php-imagick php-redis php-pgsql phpmyadmin jython pypy pypy3 units units-filter codecrypt openssl

gem install paint trollop manpages lolcat lumberjack eye eyes
 
apt --fix-broken install

apt install -y php-psr

apt-get install -y python-cartopy-data python-cycler-doc python-matplotlib-data python-matplotlib-doc python-mpl-sphinx-theme-doc python-mpltoolkits.basemap-data python-mpltoolkits.basemap-doc python-mpmath-doc python-silx-doc python3-aplpy python3-astroml python3-cartopy python3-cmyt python3-colorcet python3-colormap python3-cycler python3-descartes python3-gmplot python3-joypy python3-matplotlib python3-matplotlib-inline python3-matplotlib-venn python3-mpl-animators python3-mpl-scatter-density python3-mpl-sphinx-theme python3-mplcursors python3-mplexporter python3-mpltoolkits.basemap python3-mpmath python3-palettable python3-pweave python3-pytest-mpl python3-qutip python3-sage python3-seaborn python3-silx python3-upsetplot r-cran-viridis r-cran-viridislite sagemath sagemath-doc sagemath-jupyter silx sockperf

apt --fix-broken install

apt-get install -y android-libcrypto-utils android-libcrypto-utils-dev bruteforce-luks cl-ironclad codecrypt cryptol dhtnode diffoscope diffoscope-minimal dislocker distributed-net ecdsautils gifshuffle gir1.2-evd-0.2 gnutls-bin gnutls-doc golang-ed25519-dev golang-github-btcsuite-btcd-btcec-dev golang-github-cloudflare-circl-dev golang-github-dgryski-go-farm-dev golang-github-docker-libtrust-dev golang-github-gtank-cryptopasta-dev golang-github-jacobsa-crypto-dev golang-github-minio-sha256-simd-dev golang-github-nebulouslabs-ed25519-dev golang-github-protonmail-go-crypto-dev golang-golang-x-crypto-dev gost-crypto-dkms guile-gnutls jruby-openssl junior-math kgpg kickpass libauth-yubikey-webclient-perl libauthen-webauthn-perl libavutil-dev libavutil56 libcava-java libcrypt-blowfish-perl libcrypt-des-perl libcrypt-ecb-perl libcrypt-gcrypt-perl libcrypt-hcesha-perl libcrypto++-dev libcrypto++-doc libcrypto++-utils libcryptokit-ocaml libcryptokit-ocaml-dev libcryptx-perl libdancer-session-cookie-perl libdancer2-plugin-passphrase-perl libdkim-dev libdkim1d libengine-gost-openssl1.1 libevd-0.2-0 libevd-0.2-dev libfarmhash-dev libfarmhash0 libghc-crypto-cipher-tests-dev libghc-crypto-cipher-tests-doc libghc-crypto-cipher-tests-prof libghc-crypto-pubkey-dev libghc-crypto-pubkey-doc libghc-crypto-pubkey-prof libghc-crypto-random-api-dev libghc-crypto-random-api-doc libghc-cryptol-dev libghc-cryptol-doc libghc-cryptol-prof libghc-cryptonite-dev libghc-cryptonite-doc libghc-cryptonite-prof libghc-rsa-dev libghc-rsa-doc libghc-rsa-prof libgnutls-dane0 libgnutls-openssl27 libgnutls28-dev libgnutls30 libgnutlsxx28 libjose4j-java libjs-node-forge libk5crypto3 libmail-dkim-perl libmbedcrypto7 libmirage-crypto-ocaml libmirage-crypto-ocaml-dev libopendht-dev libp11-kit-dev libp11-kit0 librust-subtle+default-dev librust-subtle-dev libsecp256k1-0 libsecp256k1-dev libshiro-java libsodium-dev libsodium23 libsqlcipher-dev libsqlcipher0 libuecc0 libwolfssl-dev libwolfssl32 libx509-ocaml libx509-ocaml-dev libxmlsec1 libxmlsec1-gcrypt libxmlsec1-gnutls libxmlsec1-nss libxmlsec1-openssl node-ecc-jsbn node-elliptic node-evp-bytestokey node-node-forge node-shasum node-solid-keychain node-trust-webcrypto openpgp-applet p11-kit p11-kit-doc p11-kit-modules php-crypt-gpg python-cryptography-doc python-nacl-doc python-pycryptodome-doc python3-cryptography python3-cryptography-vectors python3-ecdsa python3-jwcrypto python3-nacl python3-pbkdf2 python3-pycryptodome restic ruby-rbnacl seccure sqlcipher tinysshd trojita uanytun wireguard wireguard-dkms wireguard-tools

apt --fix-broken install

apt-get install -y adns-tools android-androresolvd apbs apbs-data apt-cudf aspcud astap astap-cli astrometry.net boogie boolector calculix-ccx calculix-ccx-doc calculix-ccx-test ceres-solver-doc cervisia chemps2 chemps2-doc clasp coinor-cbc coinor-clp coinor-libcbc-dev coinor-libcbc-doc coinor-libcbc3 coinor-libcgl-dev coinor-libcgl-doc coinor-libcgl1 coinor-libclp-dev coinor-libclp-doc coinor-libclp1 coinor-libcoinmp-dev coinor-libcoinmp1v5 coinor-libdylp-dev coinor-libdylp-doc coinor-libdylp1 coinor-libipopt-dev coinor-libipopt-doc coinor-libipopt1v5 coinor-libipopt1v5-dbg coinor-libosi-dev coinor-libosi-doc coinor-libosi1v5 coinor-libsymphony-dev coinor-libsymphony-doc coinor-libsymphony3 coinor-libvol-dev coinor-libvol-doc coinor-libvol1 coinor-symphony cryptominisat cupt dafny depqbf dnf dnf-data dnf-doc dnsdiag dotnet-hostfxr-6.0 dsdp dsdp-doc flatzinc freecell-solver-bin gerris getdp getdp-sparskit gjh-asl-json glpk-utils gmsh gmsh-doc golang-github-graph-gophers-graphql-go-dev golang-github-miekg-dns-dev gradle-debian-helper gringo hellfire ivy-debian-helper kalzium knot-resolver knot-resolver-doc knot-resolver-module-http ksudoku libadns1 libadns1-dbg libadns1-dev libalglib-dev libalglib3.18 libamplsolver-dev libamplsolver0 libanyevent-cachedns-perl libapbs-dev libapbs3 libapt-pkg6.0 libarpack++2-dev libarpack++2c2a libastrometry-dev libastrometry0 libbind-dev libboogie-cil libbssolv-perl libbullet-dev libc-ares-dev libc-ares2 libceres-dev

apt --fix-broken install

apt-get install -y libceres2 libchemps2-3 libchemps2-dev libclass-container-perl libcppnumericalsolvers-dev libcryptominisat5-5.8 libcryptominisat5-dev libcupt4-2 libcusolver11 libcusolvermg11 libcxsparse3 libdart-external-odelcpsolver-dev libdart-external-odelcpsolver6.12 libdds-dev libdds0 libdnssec8 libdnssecjava-java libdnssecjava-java-doc libdogleg-dev libdogleg-doc libdogleg2 libdsdp-5.8gf libdsdp-dev libdune-istl-dev libdune-istl-doc libeclipse-osgi-compatibility-state-java libeclipse-wst-common-uriresolver-java libelpa-dev libelpa17 libfelix-resolver-java libfreecell-solver-dev libfreecell-solver0 libgecode-dev libgecode-doc libgecode49 libgecodeflatzinc49 libgecodegist49 libgeoip1 libgfs-1.3-2 libgfs-dev libghc-diagrams-solve-dev libghc-diagrams-solve-doc libghc-diagrams-solve-prof libghc-resolv-dev libghc-resolv-doc libghc-resolv-prof libghc-sbv-dev libghc-sbv-doc libghc-sbv-prof libghc-simple-smt-dev libghc-simple-smt-doc libghc-simple-smt-prof libgmsh-dev libgmsh-private-headers-dev libgmsh4.8 libhmat-oss-dev libhmat-oss1 libhmat-oss1-dbg libilmbase25 libisl-dev libisl23 libitsol-dev libitsol1 libknot12 liblbfgs-dev liblbfgs0 liblinear-dev liblinear-tools liblinear4 liblwres161 libmail-rbl-perl libmaven-resolver-java libmaven-resolver-transport-http-java libmccs-ocaml libmccs-ocaml-dev libmeep23 libmps-dev libmps-fortran-dev libmps-fortran0 libmps3 libmumps-5.4 libmumps-64pord-5.4 libmumps-64pord-ptscotch-5.4 libmumps-64pord-scotch-5.4 libmumps-64pord-seq-5.4 libmumps-dev libmumps-headers-dev libmumps-ptscotch-5.4 libmumps-ptscotch-dev libmumps-scotch-5.4 libmumps-scotch-dev libmumps-seq-5.4 libmumps-seq-dev libmumps64-dev libmumps64-ptscotch-dev libmumps64-scotch-dev libmumps64-seq-dev libnet-dns-lite-perl libnet-dns-native-perl libnet-dns-perl libnet-dns-resolver-mock-perl libnet-dns-resolver-programmable-perl libnss-tls libocas-dev libocas-tools libocas0

apt --fix-broken install

apt-get install -y libopm-material-dev libopm-material-doc libopm-simulators libopm-simulators-bin libopm-simulators-dev libopm-simulators-doc liborocos-kdl-dev liborocos-kdl1.5 libowfat-dev libowfat-dietlibc-dev libowfat0 libparmetis4.0 libplb-dev libplb-doc libplb1 libpoe-component-resolver-perl libqqwing-dev libqqwing2v5 libqsopt-ex-dev libqsopt-ex2 libreoffice-nlpsolver librobot-state-publisher-solver1d librsb-dev librsb-doc librsb-tools librsb0 libruli-bin libruli4 libruli4-dev libsbt-template-resolver-java libshibresolver-dev libshibresolver3 libsiconos-numerics-dev libsiconos-numerics6 libsocket-perl libsolv-dev libsolv-doc libsolv-perl libsolv-tools libsolv1 libsolvext-dev libsolvext1 libsparskit-dev libsparskit2.0 libspooles-dev libspooles2.2 libspring-web-java libstellarsolver-dev libstellarsolver1 libsundials-arkode3 libsundials-cvode4 libsundials-cvodes4 libsundials-dev libsundials-ida4 libsundials-idas3 libsundials-kinsol4 libsundials-nvecparallel-hypre4 libsundials-nvecparallel-mpi4 libsundials-nvecparallel-openmp4 libsundials-nvecparallel-petsc4 libsundials-nvecparallel-pthread4 libsundials-nvecserial4 libsundials-sunlinsol2 libsundials-sunmatrix2 libtcl-chiark-1 libtrilinos-amesos-13.2 libtrilinos-amesos-dev libtrilinos-amesos2-13.2 libtrilinos-amesos2-dev libtrilinos-aztecoo-13.2 libtrilinos-aztecoo-dev libtrilinos-belos-13.2 libtrilinos-belos-dev libtrilinos-epetra-13.2 libtrilinos-epetra-dev libtrilinos-globipack-13.2 libtrilinos-globipack-dev libtrilinos-ifpack-13.2

apt --fix-broken install

apt-get install -y libtrilinos-ifpack-dev libtrilinos-ifpack2-13.2 libtrilinos-ifpack2-dev libtrilinos-komplex-13.2 libtrilinos-komplex-dev libtrilinos-ml-13.2 libtrilinos-ml-dev libtrilinos-muelu-13.2 libtrilinos-muelu-dev libtrilinos-phalanx-13.2 libtrilinos-phalanx-dev libtrilinos-pike-13.2 libtrilinos-pike-dev libtrilinos-pliris-13.2 libtrilinos-pliris-dev libtrilinos-shylu-13.2 libtrilinos-shylu-dev libtrilinos-stokhos-13.2 libtrilinos-stokhos-dev libtrilinos-stratimikos-13.2 libtrilinos-stratimikos-dev libtrilinos-teko-13.2 libtrilinos-teko-dev libudns-dev libudns0 libvmmlib-dev libwala-java libwala-java-doc libxml-commons-resolver1.1-java libxml-commons-resolver1.1-java-doc libxml-filter-saxt-perl libzscanner4 lua-nginx-dns make mandelbrot-solver mate-user-share mate-user-share-common mccs meep minisat minisat+ minizinc minizinc-ide mpsolve mumps-test nextgen-yum4 nss-tlsd octave-bim octave-msh octave-phclab openresolv packup parmetis-doc parmetis-test pdns-tools phcpack phcpack-doc php-net-dns2 php-phpdocumentor-type-resolver php-symfony-options-resolver picosat postfix-mta-sts-resolver pybik python-cvxopt-doc python-scipy-doc python-sfepy-doc python3-aiodns python3-apbslib python3-astrometry python3-chemps2 python3-cryptominisat python3-cvxopt python3-dnf python3-dnf-doc python3-dnslib python3-geoip python3-gmsh python3-kiwisolver python3-liblinear

apt --fix-broken install

apt-get install -y python3-logilab-constraint python3-meep python3-mpsolve python3-opm-simulators python3-optlang python3-phcpy python3-pot python3-pycosat python3-resolvelib python3-scipy python3-sfepy python3-solv qqwing qsopt-ex quantlib-python r-bioc-lpsymphony r-cran-bdsmatrix r-cran-ecosolver r-cran-gee r-cran-geepack r-cran-kernlab r-cran-lpsolve r-cran-mixsqp r-cran-optimx r-cran-rcppeigen r-cran-rlinsolve r-cran-rspectra r-cran-rsymphony r-cran-tsp rdnssd redsocks rubiks ruby-molinillo ruby-rubydns ruby-solve sat4j science-logic sdpb sdpb-doc solvespace stubby sudoku sudoku-solver tcllib tenace test-kitchen tlslookup unbound wbox xmpsolve z88 z88-data z88-doc cl-plus-ssl daxctl dbconfig-no-thanks fil-plugins flatpak-xdg-utils golang-github-armon-go-socks5-dev ibverbs-providers ibverbs-utils jdim joe jupp kexec-tools libcgi-application-plugin-captcha-perl libcriticism-perl libdaxctl1 libfile-chmod-perl libibverbs-dev libibverbs1 liblexical-var-perl libmodule-starter-smart-perl libobjenesis-java libobjenesis-java-doc libuniversal-can-perl libvma libvma-dev libvma-utils libvma9 molly-guard netgen-lvs nocache node-stealthy-require nslcd-utils opensysusers pt-websocket python3-fastentrypoints rpm ruby-nori scsitools scsitools-gui selektor snoopy strongswan-libcharon tcptraceroute trojan wapiti west-chamber-common west-chamber-dkms west-chamber-source xsecurelock xzgv

apt --fix-broken install

apt-get install -y argagg-dev argagg-dev-doc autobahn-cpp-dev autobahn-cpp-doc ciso ckon dm-writeboost-dkms fasd golang-github-iafan-cwalk-dev golang-github-tidwall-btree-dev ibus-typing-booster libargh-dev libasio-dev libasio-doc libboost-all-dev libboost-atomic-dev libboost-atomic1.74-dev libboost-atomic1.74.0 libboost-chrono-dev libboost-chrono1.74-dev libboost-chrono1.74.0 libboost-container-dev libboost-container1.74-dev libboost-container1.74.0 libboost-context-dev libboost-context1.74-dev libboost-context1.74.0 libboost-contract-dev libboost-contract1.74-dev libboost-contract1.74.0 libboost-coroutine-dev libboost-coroutine1.74-dev libboost-coroutine1.74.0 libboost-date-time-dev libboost-date-time1.74-dev libboost-date-time1.74.0 libboost-dev libboost-doc libboost-exception-dev libboost-exception1.74-dev libboost-fiber-dev

apt --fix-broken install

apt-get install -y libboost-fiber1.74-dev libboost-fiber1.74.0 libboost-filesystem-dev libboost-filesystem1.74-dev libboost-filesystem1.74.0 libboost-geometry-utils-perl libboost-graph-dev libboost-graph-parallel-dev libboost-graph-parallel1.74-dev libboost-graph-parallel1.74.0 libboost-graph1.74-dev libboost-graph1.74.0 libboost-iostreams-dev libboost-iostreams1.74-dev libboost-iostreams1.74.0 libboost-locale-dev libboost-locale1.74-dev libboost-locale1.74.0 libboost-log-dev libboost-log1.74-dev libboost-log1.74.0 libboost-math-dev libboost-math1.74-dev libboost-math1.74.0 libboost-mpi-dev libboost-mpi-python-dev libboost-mpi-python1.74-dev libboost-mpi-python1.74.0 libboost-mpi1.74-dev libboost-mpi1.74.0 libboost-nowide-dev libboost-nowide1.74-dev libboost-nowide1.74.0 libboost-numpy-dev libboost-numpy1.74-dev libboost-numpy1.74.0 libboost-program-options-dev libboost-program-options1.74-dev libboost-program-options1.74.0 libboost-python-dev libboost-python1.74-dev libboost-python1.74.0 libboost-random-dev libboost-random1.74-dev libboost-random1.74.0 libboost-regex-dev libboost-regex1.74-dev libboost-regex1.74.0 libboost-serialization-dev libboost-serialization1.74-dev libboost-serialization1.74.0 libboost-stacktrace-dev libboost-stacktrace1.74-dev libboost-stacktrace1.74.0 libboost-system-dev libboost-system1.74-dev libboost-system1.74.0 libboost-test-dev libboost-test1.74-dev libboost-test1.74.0 libboost-thread-dev libboost-thread1.74-dev libboost-thread1.74.0 libboost-timer-dev libboost-timer1.74-dev libboost-timer1.74.0 libboost-tools-dev libboost-type-erasure-dev libboost-type-erasure1.74-dev libboost-type-erasure1.74.0 libboost-wave-dev libboost-wave1.74-dev libboost-wave1.74.0 libboost1.74-all-dev libboost1.74-dev libboost1.74-doc libboost1.74-tools-dev libcctbx0 libconcurrentqueue-dev libcookie-baker-xs-perl libeckit-dev libeckit-utils libeckit0d libfmt-dev libfmt-doc libfmt8 libgclib-dev libgclib3 libgeners-dev libgeners1 libghc-mutable-containers-dev libghc-mutable-containers-doc libghc-mutable-containers-prof libmapbox-variant-dev libmath-vector-real-xs-perl libnest2d-dev libobject-realize-later-perl libodb-boost-2.4 libodb-boost-dev librandom-numbers-dev librandom-numbers0d libref-util-xs-perl librestinio-dev libsnp-sites1-dev libtbox-dev libtype-tiny-xs-perl libvma libvma-dev libvma-utils libvma9 libvolk2-bin libvolk2-dev libvolk2-doc libvolk2.5 libwebsocketpp-dev libwebsocketpp-doc libxgboost-dev libxgboost0 node-aws-sign2 persepolis pianobooster pybind11-dev pybind11-doc python3-cppimport python3-falcon python3-minieigen python3-pgmagick python3-pybind11 python3-rosboost-cfg python3-xgboost r-bioc-rbgl r-cran-bh r-cran-catools r-cran-gbm r-cran-pvclust rapidjson-dev redeclipse spamassassin-heatu stella weka weka-doc writeboost xgboost

apt --fix-broken install

apt-get install -y libauthen-captcha-perl libcaptcha-recaptcha-perl libcatalyst-plugin-captcha-perl libcgi-application-plugin-captcha-perl libgd-securityimage-perl libghc-recaptcha-dev libghc-recaptcha-doc libghc-recaptcha-prof liblemonldap-ng-portal-perl php-google-recaptcha php-text-captcha plowshare python-django-captcha-doc python-flaskext.wtf-doc python3-django-captcha python3-flaskext.wtf python3-librecaptcha ruby-invisible-captcha ruby-recaptcha ruby-simple-captcha2 fonts-sora libcava-java monero node-trust-keyto python3-opentimestamps sia silkaj base58 bruteforce-wallet cgminer golang-github-btcsuite-btcd-btcec-dev libbase58-0 libbase58-dev libblkmaker-0.1-6 libblkmaker-0.1-dev libencode-base58-perl libsecp256k1-0 libsecp256k1-dev python3-base58 python3-bip32utils python3-bitcoinlib python3-btchip python3-mnemonic python3-stdnum python3-trezor trezor dhtnode golang-github-twinj-uuid-dev libjs-node-forge monero monero-tests node-base64id node-blueimp-md5 node-browserify-des node-browserify-sign node-cipher-base node-create-ecdh node-cryptiles node-crypto-browserify node-crypto-random-string node-des.js node-ecc-jsbn node-elliptic node-evp-bytestokey node-hash-base node-hash-test-vectors node-hawk node-jose node-jose-browser-runtime node-jsbn node-md5.js node-minimalistic-crypto-utils node-node-forge node-pbkdf2 node-pseudorandombytes node-random-bytes node-randombytes node-rdf-canonize node-ripemd160 node-sha node-sha.js node-shasum node-solid-keychain node-tmp node-trust-keyto node-trust-webcrypto node-tweetnacl node-uid-safe node-unique-string node-uuid python3-xstatic-angular-uuid silkaj texlive-science adminer amide cgminer epiphany fccexam gir1.2-tracker-3.0 gnome-online-miners hamexam libsoqt520-dev logdata-anomaly-miner pachi pachi-data pdfminer-data python3-pdfminer python3-pyxrd r-bioc-chemminer r-cran-discriminer r-cran-factominer r-cran-minerva r-cran-survminer tracker-miner-fs tracker-test-utils expeyes

apt --fix-broken install

apt-get install -y ztex-bmp ypserv ypbind-mt yp-tools yorick xserver-xorg-video-nvidia-525 xrootconsole wifite winbind winff-data wireshark wireshark-common wireshark-dev wireshark-doc wireshark-gtk wireshark-qt websockify vlc-plugin-samba votca-tools vpnc vtable-dumper vtun sympow-data gnome qweborf r-bioc-fmcsr r-bioc-hilbertvis r-bioc-nanostringqcpro r-bioc-tximeta r-cran-bigmemory r-cran-bigmemory.sri r-cran-ff r-cran-filelock r-cran-gert r-cran-ggalluvial r-cran-ggplot2 r-cran-huge r-cran-knn.covertree r-cran-lifecycle r-cran-lobstr r-cran-maptools r-cran-mvnormtest r-cran-openssl r-cran-partykit r-cran-prettyr r-cran-rcppdist r-cran-reprex r-cran-reshape r-cran-reshape2 r-cran-rinside r-cran-rstatix r-cran-shades r-cran-shape r-cran-shapes r-cran-shazam r-cran-spdata r-cran-stanheaders r-cran-textshaping r-cran-tidyr r-cran-tidyverse r-cran-transformr r-cran-v8 r-cran-venndiagram r-mathlib r-other-mott-happy.hbrem racket-common radeontop radioclk gnome seahorse-sharing secsipidx sfftw2 sgb-doc sgml-base sgml-data sha1cdsum shade-inventory shadowsocks-libev shadowsocks-v2ray-plugin schroot python3-scrypt python3-seafile python3-securesystemslib stoken storj subiquitycore subnetcalc subversion sup supercollider syndie syrep systray-mdstat tagua tang-nagios tcllib tcm tcm-doc tcpdump tcpstat testdisk texlive-pictures texlive-science tgt tgt-glusterfs tgt-rbd thin tiger-otheros tigervnc-xorg-extension tightvncpasswd tinydns tnat64 tor tor-geoipdb torrus-common torsocks toulbar2 toulbar2-doc toxic triggerhappy trinity trn4 tuned tuned-gtk tuned-utils tuned-utils-systemtap tuxcmd tuxcmd-modules twin ucspi-tcp udevil unison unison-2.51+4.13.1 unison-2.51+4.13.1-gtk unison-gtk urlextractor uw-mailutils uwsgi-infrastructure-plugins uwsgi-plugin-glusterfs uwsgi-plugin-mongo uwsgi-plugin-rados uwsgi-plugin-tornado-python3 uwsgi-plugins-all vagrant-libvirt vanguards

apt --fix-broken install

apt-get install -y base58 bruteforce-wallet cgminer coinor-cbc coinor-clp coinor-csdp coinor-csdp-doc coinor-libcbc-dev coinor-libcbc-doc coinor-libcbc3 coinor-libcgl-dev coinor-libcgl-doc coinor-libcgl1 coinor-libclp-dev coinor-libclp-doc coinor-libclp1 coinor-libcoinmp-dev coinor-libcoinmp1v5 coinor-libcoinutils-dev coinor-libcoinutils-doc coinor-libcoinutils3v5 coinor-libdylp-dev coinor-libdylp-doc coinor-libdylp1 coinor-libipopt-dev coinor-libipopt-doc coinor-libipopt1v5 coinor-libipopt1v5-dbg coinor-libosi-dev coinor-libosi-doc coinor-libosi1v5 coinor-libsymphony-dev coinor-libsymphony-doc coinor-libsymphony3 coinor-libvol-dev coinor-libvol-doc coinor-libvol1 coinor-symphony coinst coinst-viewer dose-extra golang-github-btcsuite-btcd-btcec-dev libbase58-0 libbase58-dev libblkmaker-0.1-6 libblkmaker-0.1-dev libcoin-dev libcoin-doc libcoin-runtime libcoin80c libencode-base58-perl liblemon-dev liblemon-doc liblemon-utils liblemon1.3.1 libpolyclipping-dev libpolyclipping22 libsdp-dev libsdp0 libsecp256k1-0 libsecp256k1-dev libsisimai-perl libsoqt520 libsoqt520-dev monero monero-tests neverball neverball-data node-d3-quadtree norsp pd-vbap pidgin-plugin-pack python-duniterpy-doc python3-base58 python3-bip32utils python3-bitcoinlib python3-btchip python3-duniterpy python3-mnemonic python3-pivy python3-pulp python3-stdnum python3-trezor r-cran-coin r-cran-libcoin r-cran-medadherence r-cran-rcsdp r-cran-rsymphony r-cran-urca tellico tellico-data tellico-doc tellico-scripts trezor wmcoincoin

apt --fix-broken install

apt-get install -y android-androresolvd cervisia cupt dnf dnf-data dnf-doc dnsdiag dotnet-hostfxr-6.0 golang-github-graph-gophers-graphql-go-dev golang-github-miekg-dns-dev gradle-debian-helper hellfire ivy-debian-helper knot-resolver knot-resolver-doc knot-resolver-module-http libadns1 libadns1-dbg libadns1-dev libanyevent-cachedns-perl libbind-dev libc-ares-dev libc-ares2 libclass-container-perl libcupt4-2 libdnssec8 libdnssecjava-java libdnssecjava-java-doc libeclipse-osgi-compatibility-state-java libeclipse-wst-common-uriresolver-java libfelix-resolver-java libgeoip1 libghc-resolv-dev libghc-resolv-doc libghc-resolv-prof libknot12 liblwres161 libmail-rbl-perl libmaven-resolver-java libmaven-resolver-transport-http-java libnet-dns-lite-perl libnet-dns-native-perl libnet-dns-perl libnet-dns-resolver-mock-perl libnet-dns-resolver-programmable-perl libnss-tls libowfat-dev libowfat-dietlibc-dev libowfat0 libpoe-component-resolver-perl libruli-bin libruli4 libruli4-dev libsbt-template-resolver-java libshibresolver-dev libshibresolver3 libsocket-perl libspring-web-java libtcl-chiark-1 libudns-dev libudns0 libxml-commons-resolver1.1-java libxml-commons-resolver1.1-java-doc libxml-filter-saxt-perl libzscanner4 lua-nginx-dns mate-user-share mate-user-share-common nextgen-yum4 nss-tlsd openresolv pdns-tools php-net-dns2 php-phpdocumentor-type-resolver php-symfony-options-resolver postfix-mta-sts-resolver python3-aiodns python3-dnf python3-dnf-doc python3-dnslib python3-geoip python3-resolvelib rdnssd redsocks ruby-molinillo ruby-rubydns ruby-solve stubby tcllib test-kitchen tlslookup unbound wbox

apt-get install -y python2-dev python2 python-dev-is-python3 python3-m2crypto python-m2crypto-doc libjansson-dev libjansson-doc libjansson4 libideep-dev libonnx-dev libonnx-testdata libonnxifi libtorch-dev libtorch-test libtorch1.8 libxir-dev libxir-utils libxir1 libxnnpack-dev libxnnpack0 python3-eagerpy python3-onnx python3-skorch python3-torch python3-torch-ignite python3-torchaudio

apt-get install -y aragorn cassbeam check-pgactivity chiark-scripts conda-package-handling dascrubber dssp embassy-domainatrix gnome-shell-extension-appindicator haskell-lazy-csv-utils id3ren infernal-doc jack-tools ldap2dns libcpanel-json-xs-perl libghc-lazy-csv-dev libghc-lazy-csv-doc libghc-lazy-csv-prof libjs-jquery-tablesorter libnet-fastcgi-perl libplayeronecamera2 libqrcodegen-dev libqrcodegen1 libqrcodegencpp-dev libqrcodegencpp1 librg-reprof-bundle-perl librna-perl libsingleapplication-dev libssm-bin libssm-dev libssm2 lighter members ncoils norsnet norsp primus primus-libs profbval profphd-utils python-fisx-common python-mdtraj-doc python3-fisx python3-mdtraj python3-mitogen python3-qrcodegen python3-rna quickplot r-bioc-basilisk.utils r-cran-clue r-cran-slider redis-redisearch redis-redisearch-doc reprof resource-agents-extra trnascan-se-common varna vienna-rna zerofree libgenometools0 libgenometools0-dev libghc-agda-doc libghc-focuslist-dev libghc-focuslist-doc libghc-focuslist-prof libghc-ghc-exactprint-dev libghc-ghc-exactprint-doc libghc-ghc-exactprint-prof libghc-hackage-security-dev libghc-hackage-security-doc libghc-hackage-security-prof libghc-hashmap-dev libghc-hashmap-doc libghc-hashmap-prof

apt-get install -y boogie gargoyle-free libboogie-cil libgeotranz3-dev libgeotranz3.7 libhowardhinnant-date-tz3 libnet-z3950-simple2zoom-perl libnet-z3950-simpleserver-perl libnet-z3950-zoom-perl libnormaliz3 libpwiz3 libyaz-dev libyaz5 libyazpp-dev libyazpp-doc libyazpp6 libz3-4 libz3-dev libz3-java libz3-jni libznz3 python3-z3 ruby-zoom tellico tellico-data tellico-doc tellico-scripts yaz yaz-doc yaz-icu yaz-illclient z3 bolt bolt-tests fonts-aenigma golang-github-hashicorp-go-cleanhttp-dev golang-github-jarcoal-httpmock-dev golang-github-jfbus-httprs-dev irssi-scripts libltc-dev libltc-doc libltc11 libtranscript-dev libxsltc-java liece-dcc mysqltcl plplot-tcl-bin postgresql-pltcl-14 puppet-module-michaeltchapman-galera r-bioc-altcdfenvs r-cran-multcomp r-cran-multcompview tcl-yajltcl yt-dlp

apt-get install -y 2ping 4g8 6tunnel abiword activemq apf-firewall apg argus-client argus-server atig atm-tools auto-apt-proxy avarice axfrdns bandwidthd baresip baresip-core baresip-ffmpeg baresip-gstreamer baresip-gtk baresip-x11 bettercap binkd bittwist bpfmon brltty btpd bwctl-client bwctl-server caml-crush-clients certinfo chaosreader cl-hunchentoot cl-usocket claws-mail-clamd-plugin cloudsql-proxy cntlm collectd-core collectl connect-proxy corkscrew coturn courier-base crtmpserver crtmpserver-apps crtmpserver-dev crtmpserver-libs cryptcat ctdb cubemap cutter dbench desproxy devrplay3 dhcpdump dict dictd diffoscope diffoscope-minimal diod dmitry dns2tcp dnscap dnscap-dev dopewars dopewars-data doscan drbd-doc drbd-utils driftnet dsniff ekeyd-egd-linux erlang-cowboy erlang-cowboy-doc erlang-cowboy-examples erlang-ranch erlang-ranch-doc etherape etherape-data etherpuppet fair fakeroot fceux fetchmail firewalk flowgrind forensics-all forensics-extra foxeye freetds-bin freetds-common freetds-dev fstrm-bin ftp-ssl ftpd-ssl gambas3-gb-net ganyremote gawk-doc gcx gensio-bin globus-gfork-progs glusterfs-cli glusterfs-client glusterfs-common glusterfs-server gnunet-fuse go-mmproxy golang-github-aelsabbahy-gonetstat-dev golang-github-alicebob-miniredis-dev golang-github-bsm-redeo-dev golang-github-cockroachdb-cmux-dev golang-github-facebookgo-freeport-dev golang-github-francoispqt-gojay-dev golang-github-go-sql-driver-mysql-dev golang-github-google-gopacket-dev golang-github-googlecloudplatform-cloudsql-proxy-dev golang-github-hashicorp-go-cleanhttp-dev golang-github-hashicorp-yamux-dev golang-github-hydrogen18-stoppablelistener-dev golang-github-inconshreveable-muxado-dev golang-github-influxdata-yamux-dev golang-github-nebulouslabs-go-upnp-dev golang-github-pires-go-proxyproto-dev golang-github-soheilhy-cmux-dev golang-github-thoj-go-ircevent-dev golang-github-valyala-tcplisten-dev golang-github-xtaci-kcp-dev golang-github-xtaci-smux-dev golang-github-xtaci-tcpraw-dev golang-gopkg-mcuadros-go-syslog.v2-dev gpsd gpsd-clients gpsd-tools gr-osmosdr gridsite-clients gsocket gvpe hapolicy happycoders-libsocket happycoders-libsocket-dev haproxy haproxy-doc haskell-hosc-utils hatop horst hping3 hylafax-client hylafax-client-dbg ibverbs-providers ibverbs-utils icinga2 icinga2-bin icinga2-common icinga2-doc icinga2-ido-pgsql indi-beefocus iperf iperf3 ipgrab ippl ipset ipsvd iptraf-ng ipv6toolkit irpas irssi-scripts janus jmeter-tcp kanyremote kcptun kildclient kildclient-doc kio-ldap knockd lft libactivemq-java libanyevent-connection-perl libanyevent-connector-perl libapache2-mod-jk libapache2-mod-qos libauthen-libwrap-perl libccrtp-dev libclamav-client-perl libconduit-lwt-ocaml libconduit-lwt-ocaml-dev libconduit-ocaml libconduit-ocaml-dev libct4 libdashel-dev libdashel1 libdontdie0 libetpan-dev libetpan-doc libetpan20 libfakeroot libfixbuf-dev libfixbuf-doc libfixbuf-tools libfixbuf9 libfstrm-dev libfstrm0 libgensio-dev libgensio0 libgfapi0 libgfchangelog0 libgfrpc0 libgfxdr0 libghc-hedis-dev libghc-hedis-doc libghc-hedis-prof libghc-hosc-dev libghc-hosc-doc libghc-hosc-prof libglusterd0 libglusterfs-dev libglusterfs0 libgnuradio-network3.10.1 libgps-dev libgps28 libhyperic-sigar-java libibverbs-dev libibverbs1 libio-async-ssl-perl libiperf-dev libiperf0 libipset-dev libipset13 libircclient-dev libircclient1 libisns-dev libisns0 libjeromq-java libjgroups-java libjnr-netdb-java libkeepalive0 libkf5ldap-data libkf5ldap-dev libkf5ldap5abi1 liblwip-dev liblwip-doc liblwip0 liblwipv6-2 liblwipv6-dev libmbtserver-dev libmbtserver1 libmckoisqldb-java libmckoisqldb-java-doc libmemcached-dbg libmemcached-dev libmemcached-libmemcached-perl libmemcached11 libmemcachedutil2 libmina-java libmina-java-doc libmina2-java libmina2-java-doc libmonitoring-livestatus-perl libmptcpd3 libmptcpd3-dev libmptcpd3-doc libmptcpwrap0 libmuroar-dev libmuroar0 libncap-dev libncap44 libnet-amqp-perl libnet-easytcp-perl libnet-frame-dump-perl libnet-frame-perl libnet-ident-perl libnet-irr-perl libnet-pcap-perl libnet-rawip-perl libnet-server-perl libnet-sip-perl libnet-smpp-perl libnet-snmp-perl libnet-socks-perl libnet-telnet-perl libnetclasses-dev libnetclasses0 libnetpacket-perl libnetty-java libnginx-mod-stream libngtcp2-0 libngtcp2-crypto-gnutls-dev libngtcp2-crypto-gnutls0 libngtcp2-dev libnids-dev libnids1.21 libnode72 libntirpc-dev libntirpc3.5 libogdi-dev libogdi4.1 libopeniscsiusr libopeniscsiusr-dev libossp-sa-dev libossp-sa12 libpacketdump3-dev libpacketdump3v5 libpoe-component-server-jsonrpc-perl libpq5 libpqxx-6.4 libproxychains-dev libproxychains3 libproxychains4 libqgpsmm-dev libqgpsmm28 libqt5network5 libqt6network6 libre-dev libre0 librelp-dev librelp0 libroar-compat2 libroar-dev libroar2 librplay-perl librplay3 librplay3-dev librte-net22 librtr-dev librtr-doc librtr0 librust-nb-connect-dev libserver-starter-perl libskstream-0.3-7v5 libskstream-0.3-dev libslirp-dev libslirp0 libsocket-linux-perl libsofia-sip-ua0 libsybdb5 libtcplay libtcplay-dev libtest-poe-client-tcp-perl libtest-poe-server-tcp-perl libtest-tcp-perl libtest-unixsock-perl libtimblserver-dev libtimblserver4 libusbmuxd-tools libuv1 libuv1-dev libvanessa-socket-pipe libvanessa-socket2 libvdeplug-slirp libvma libvma-dev libvma-utils libvma9 libwiretap-dev libwiretap12 libwrap0 libwrap0-dev libwvstreams4.6-extras liece-dcc lksctp-tools lmbench lmicdiusb lua-copas lua-socket magic-wormhole-transit-relay maradns maradns-zoneserver mason masscan mbpoll mbtserver mgen mitmproxy monit monitoring-plugins-basic monitoring-plugins-contrib mpd mptcpd mptcpd-plugins mptcpize muroar-bin mytop nageru nagios-images nagios4 nagios4-cgi nagios4-common nagios4-core nast ncaptool ndisc6 neovim net-acct netbase netcat netcat-openbsd netcat-traditional netdiag netmate netmaze netperf netperfmeter netperfmeter-plotting netpipe-lam netpipe-mpich2 netpipe-openmpi netpipe-pvm netpipe-tcp netpipes netsed netsend nfstrace ngrep ngtcp2-client ngtcp2-server nmap nmap-common nncp node-https-proxy-agent node-mqtt-connection node-websocket nodejs nodejs-doc ns2 ns2-dbg ns2-doc ns2-examples nsca nsca-client nstreams nttcp nuttcp octave-instrument-control ogdi-bin open-iscsi open-isns-discoveryd open-isns-server open-isns-utils openbsd-inetd openssh-client openssh-client-ssh1 openssh-server openssh-sftp-server openvpn ostinato owserver p0f packeth packetsender packit pagekite panoramisk patator pathspider pcapfix pd-iemnet pd-mrpeach-net pd-osc pd-slip pdns-tools pen percona-toolkit php-net-socket php-tcpdf phpqrcode pidgin-plugin-pack poppassd postgresql-14-bgw-replstatus postsrsd prads procserv prometheus-blackbox-exporter prometheus-exporter-exporter prometheus-libvirt-exporter proxychains proxychains4 proxytunnel psad ptunnel ptunnel-ng python-asyncssh-doc python-panoramisk-doc python-pymodbus-doc python-pysnmp4-doc python-requests-toolbelt-doc python3-asyncssh python3-bernhard python3-django-dbconn-retry python3-dpkt python3-gensio python3-gps python3-hbmqtt python3-impacket python3-irc python3-magic-wormhole-mailbox-server python3-mido python3-panoramisk python3-port-for python3-portend python3-pydle python3-pymodbus python3-pysnmp4 python3-requests-toolbelt python3-scapy python3-socks python3-socksipychain python3-spoon python3-txws python3-websocket qnetstatview qperf r-cran-pingr r-cran-rserve rail rdate rdma-core redir redsocks remotetea resource-agents-extra rgpio-tools rgpiod rinetd roaraudio roarplaylistd roarplaylistd-codechelper-gst roarplaylistd-dev roarplaylistd-tools rplay-client rplay-contrib rplay-server rtl-sdr ruby-async-io ruby-em-synchrony ruby-eventmachine ruby-net-http-persistent ruby-peek-performance-bar ruby-proxifier ruby-socksify ruby-statsd ruby-websocket-driver rush scanlogd scrcpy scrcpy-server sendip sendmail sendmail-bin ser2net simpleproxy sip-tester slirp slirp4netns slowhttptest smc-tools sngrep sniffit sniproxy socat socklog socklog-run spamassassin squid-deb-proxy-client ssldump stone suricata t50 tcpd tcpdump tcpflow tcpick tcplay tcpreen tcpreplay tcpslice tcpspy tcpstat tcptrace tcptraceroute tcptrack tcputils tcpxtract tdsodbc texlive-publishers timblserver tnat64 tor tsdecrypt tsocks ucspi-tcp udptunnel uftp ulogd2-pcap unhide uniconfd uronode usbredirect usbredirserver varnish-modules vncsnapshot vtun wait-for-it wsdd xapian-tools xdx xfrisk zemberek-server zulucrypt-cli

apt --fix-broken install
apt autoclean

echo "${GREEN}ALL DONE!${NORMAL}"
echo "${GREEN}It is recommended to ${RED}reboot${NORMAL}${GREEN} your server now!${NORMAL}"

bash pip.sh
