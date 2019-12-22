#!/data/data/com.termux/files/usr/bin/bash env

########################################
#  NKBH
########################################
#
#  Author: <T.me/iigfa_nkbh> and Josh <T.Me/@iigfa>
#
########################################
#
# Dependencies: bash and curl.
#
########################################

# Update and upgrade
pkg up -y && pkg upgrade -y

# Switch permissive
su -c 'setenforce 0'

# Install dependencies
time apt install rsync aapt neofetch toilet ncurses-utils tsu openssl-tool ruby wget -y

# Remove existing files
tsu -c 'find . -iname '*tca*' -exec rm -rf {} \;'

# Device architecture
[[ "$(uname -m)" =~ 'aarch64' ]] || {
    printf "Your device's architecture isn't officially supported yet."
    exit 1
}

# Fetch the ELF and setup
tsu -c 'wget https://raw.githubusercontent.com/TeamTCA/Illusion-Remastered/master/Builds/arm64/tca_v1.2-cli -O ./tca_v1.2-cli'
tsu -c 'chmod a+x tca_v1.2-cli'
tsu -c ./tca_v1.2-cli
