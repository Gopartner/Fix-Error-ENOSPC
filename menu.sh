#!/bin/bash

# Fungsi untuk menampilkan menu pilihan nilai batasan
display_max_watches_menu() {
    echo "Pilih nilai batasan fs.inotify.max_user_watches:"
    echo "1. 524288 (512MB)"
    echo "2. 1048576 (1GB)"
    echo "3. 2097152 (2GB)"
    echo "4. Input nilai sendiri"
}

# Fungsi untuk menampilkan menu pilihan file konfigurasi
display_config_menu() {
    echo "Pilih file konfigurasi:"
    echo "1. .bashrc"
    echo "2. .bash_profile"
}

