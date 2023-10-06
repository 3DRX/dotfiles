#!/usr/bin/env bash
selected=`cat ~/.cht-list | fzf`
if [[ -z $selected ]]; then
    exit 0
fi
read -p "Enter Query: " query
query=`echo $query | tr ' ' '+'`
if [[ -z $query ]]; then
    echo "curl cht.sh/$selected"
    curl cht.sh/$selected
    exit 0
else
    echo "curl cht.sh/$selected/$query"
    curl cht.sh/$selected/$query
fi
