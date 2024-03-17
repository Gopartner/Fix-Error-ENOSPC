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

# Fungsi untuk menampilkan informasi tentang skrip
display_info() {
    echo "Script ini digunakan untuk mengatur nilai fs.inotify.max_user_watches."
    echo "Ini akan menambahkan baris fs.inotify.max_user_watches=<nilai> ke file konfigurasi yang dipilih."
    echo "Setelah perubahan, skrip akan memuat kembali file konfigurasi untuk menerapkan perubahan."
    echo "Informasi lebih lanjut tentang fs.inotify.max_user_watches bisa ditemukan di:"
    echo "https://man7.org/linux/man-pages/man5/inotify.7.html"
    echo ""
}

