# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# PATHS
export PATH="/home/croniev/MPS 2021.2/bin:$PATH"
export cognicrypt_path="/home/croniev/Documents/Obsidian_Vault/Universität/5_BP/CryptoAnalysis-2.8.0-SNAPSHOT-jar-with-dependencies.jar"
export PATH="/home/croniev/Downloads/lilypond-2.24.0/bin:$PATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export PATH="/home/croniev/.cargo/bin/exa:$PATH"
export PATH="/usr/local/bin/node:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/bin:$PATH"

# Startup commands
rfkill block bluetooth
find -type f -regex "\.\/Pictures\/.*\.\(jpg\|png\|jpeg\|JPG\)" > ~/Documents/Scripts/firefox_website/paths.txt # dump paths of pictures into file that is read by firefox home website.
# indicator-sound-switcher
# syncthing
# blueman-applet
