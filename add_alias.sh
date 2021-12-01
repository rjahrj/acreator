#!/bin/bash

setup_terminal() {
  printf '\e[?1049h\e[?7l\e[?25l\e[2J\e[1;%sr' "max_items"
  stty -echo
}

get_term_size() {
  read -r LINES COLUMNS < <(stty size)

  ((max_items=LINES-3))
}

setup_terminal
trap 'get_term_size' WINCH

read -p 'Where would you like to save this alias [~/.bash_aliases]: ' MyAliasFile

MyAliasFile=${name:-~/.bash_aliases}

echo $MyAliasFile

echo Hello $USER, what would you like to name your alias?

read -p 'Alias Name: ' aliasname

echo What would you like $aliasname to do?

read -p 'Command: ' aliascommand

echo "alias $aliasname=\"$aliascommand\"" >> $MyAliasFile
