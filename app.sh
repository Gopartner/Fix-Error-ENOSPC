#!/bin/bash

# Sumber fungsi-fungsi
source functions.sh
source menus.sh

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

# Memanggil fungsi main
main

