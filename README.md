# Linux-Mint-21.3-XFCE-Conky-v1.19.8-hybrid-w-mouse-click-support
This installs a newer conky with mouse click support from source to the Linux Mint 21.3 XFCE platform

STEP 1) Download the source files customized by Commander Shepard of Conkyporn Reddit: 

https://www.mediafire.com/file/kya05ncoaeit9ex/conky1.19.8cmdr.zip/file

STEP 2) Extract the directory conky-1.19.8 from the .zip file and move to:

/home/username/conky-1.19.8

STEP 3) Install required build tools:

sudo apt update
sudo apt install -y g++ cmake pkg-config gperf \
libx11-dev libxinerama-dev libxft-dev libxml2-dev \
libncurses5-dev libcurl4-openssl-dev liblua5.3-dev \
librsvg2-dev libimlib2-dev libxdamage-dev libxext-dev \
libxfixes-dev libasound2-dev libpulse-dev libiw-dev \
libpam0g-dev libdrm-dev libglib2.0-dev libxnvctrl-dev

STEP 4) Create a build folder:

mkdir build

cd build

STEP 5) Configure with dependencies:

cmake .. \
  -DBUILD_X11=ON \
  -DBUILD_CAIRO=ON \
  -DBUILD_LUA_CAIRO=ON \
  -DBUILD_LUA_IMLIB2=OFF \
  -DBUILD_IMLIB2=ON \
  -DCMAKE_BUILD_TYPE=Release

STEP 6) Build & Install:

make -j$(nproc)

sudo make install

STEP 7) Verify:

conky -v

you should see output like this:

logansfury@M51AD:~$ conky -v

conky 1.19.8_pre compiled for Linux x86_64

Compiled in features:

System config file: /etc/conky/conky.conf
Package library path: /usr/local/lib/conky


 General:
  * math
  * hddtemp
  * portmon
  * IPv6
  * support for IBM/Lenovo notebooks
  * builtin default configuration
  * old configuration syntax
  * Imlib2
  * OSS mixer support
  * apcupsd
  * iostats
  * ncurses
  * Internationalization support

 Lua bindings:
  * Cairo
 X11:
  * Xdamage extension
  * Xinerama extension (virtual display)
  * Xshape extension (click through)
  * XDBE (double buffer extension)
  * Xft
  * Xinput
  * ARGB visual
  * Own window
  * Mouse events

 Music detection:
  * CMUS
  * MPD
  * MOC

 Default values:
  * Netdevice: eno1
  * Local configfile: $HOME/.conkyrc
  * Localedir: /usr/local/share/locale
  * Maximum netdevices: 256
  * Maximum text size: 16384
  * Size text buffer: 256
