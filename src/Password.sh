#!/bin/zsh
# @Author: Navarro Torres, Agustin (agusnavarro11@gmail.com)
# @Github: agusnt
# @WebPage: https://agusnt.github.io

if [ "$#" -ne 1 ]; then openssl rand -base64 8
else openssl rand -base64 $1
fi
