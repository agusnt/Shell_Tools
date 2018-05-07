#!/bin/zsh
# @Author: Navarro Torres, Agustin (agusnavarro11@gmail.com)
# @Github: agusnt
# @WebPage: https://agusnt.github.io

# You will need the following application installed
# tar, bzip2, unrar, gunzip, xz, unzip and uncompress

function help {
    echo "extract.sh compress_file_name"
    echo ""
    echo "You will need: tar, bzip2, unrar, gnuzip, xz, unzip and uncompress"
}

function extract {
    # Extract files
    case $1 in
        *.tar.bz2) tar xjf $1                    ;;
        *.tar.gz)  tar xzf $1                    ;;
        *.tar.xz)  tar zxf $1                   ;;
        *.bz2)     bzip2 -d $1                   ;;
        *.rar)     unrar x $1                    ;;
        *.gz)      gzip -d $1                    ;;
        *.tar)     tar xf $1                     ;;
        *.tbz2)    tar xjf $1                    ;;
        *.tgz)     tar xzf $1                    ;;
        *.xz)      xz -d $1                      ;;
        *.zip)     unzip $1                      ;;
        *.Z)       uncompress $1                 ;;
        *)         echo "Format can't be recognize" ;;
    esac
}

# Main equivalent
if [ "$#" -lt 1 ]; then
    >&2 echo "Wrong number of parameters"
    help
    exit 1
else
    extract $1
fi
