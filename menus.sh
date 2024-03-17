#!/bin/bash

# Fungsi untuk menampilkan menu pilihan nilai batasan
display_max_watches_menu() {
    echo "$(echo -e '\e[1;35mPilih nilai batasan fs.inotify.max_user_watches:\e[0m')"
    echo "$(echo -e '\e[1;36m1. 524288 (512MB)\e[0m')"
    echo "$(echo -e '\e[1;36m2. 1048576 (1GB)\e[0m')"
    echo "$(echo -e '\e[1;36m3. 2097152 (2GB)\e[0m')"
    echo "$(echo -e '\e[1;36m4. Input nilai sendiri\e[0m')"
}

# Fungsi untuk menampilkan menu pilihan file konfigurasi
display_config_menu() {
    echo "$(echo -e '\e[1;35mPilih file konfigurasi:\e[0m')"
    echo "$(echo -e '\e[1;36m1. .bashrc\e[0m')"
    echo "$(echo -e '\e[1;36m2. .bash_profile\e[0m')"
}

