#!/bin/bash

# Fungsi untuk menetapkan nilai fs.inotify.max_user_watches
set_max_user_watches() {
    local config_file=$1
    local max_watches=$2

    if [ -z "$config_file" ]; then
        echo "File konfigurasi tidak valid. Silakan coba lagi."
        return 1
    fi

    if [ -z "$max_watches" ]; then
        echo "Nilai batasan tidak valid. Silakan coba lagi."
        return 1
    fi

    echo "fs.inotify.max_user_watches=$max_watches" | tee -a "$config_file" >/dev/null
    echo "Nilai fs.inotify.max_user_watches telah diatur ke $max_watches di $config_file."

    # Membuat perubahan berlaku dengan menjalankan source pada file konfigurasi yang dipilih
    if [ "$config_file" = "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
    else
        source "$HOME/.bash_profile"
    fi
}

# Menampilkan informasi tentang skrip
display_info() {
    echo "Script ini digunakan untuk mengatur nilai fs.inotify.max_user_watches."
    echo "Ini akan menambahkan baris fs.inotify.max_user_watches=<nilai> ke file konfigurasi yang dipilih."
    echo "Setelah perubahan, skrip akan memuat kembali file konfigurasi untuk menerapkan perubahan."
    echo "Informasi lebih lanjut tentang fs.inotify.max_user_watches bisa ditemukan di:"
    echo "https://man7.org/linux/man-pages/man5/inotify.7.html"
    echo ""
}

# Menampilkan menu pilihan nilai batasan
display_max_watches_menu() {
    echo "Pilih nilai batasan fs.inotify.max_user_watches:"
    echo "1. 524288 (512MB)"
    echo "2. 1048576 (1GB)"
    echo "3. 2097152 (2GB)"
    echo "4. Input nilai sendiri"
}

# Menampilkan menu pilihan file konfigurasi
display_config_menu() {
    echo "Pilih file konfigurasi:"
    echo "1. .bashrc"
    echo "2. .bash_profile"
}

# Menjalankan program
main() {
    display_info
    display_config_menu

    read -p "Masukkan pilihan (1/2): " config_choice
    case $config_choice in
        1)
            config_file="$HOME/.bashrc"
            ;;
        2)
            config_file="$HOME/.bash_profile"
            ;;
        *)
            echo "Pilihan tidak valid. Keluar."
            exit 1
            ;;
    esac

    display_max_watches_menu

    read -p "Masukkan pilihan nilai batasan (1-4): " max_watches_choice
    case $max_watches_choice in
        1)
            max_watches=524288
            ;;
        2)
            max_watches=1048576
            ;;
        3)
            max_watches=2097152
            ;;
        4)
            read -p "Masukkan nilai batasan sendiri: " max_watches
            ;;
        *)
            echo "Pilihan tidak valid. Keluar."
            exit 1
            ;;
    esac

    set_max_user_watches "$config_file" "$max_watches"
}

main

