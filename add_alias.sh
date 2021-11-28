#!/bin/bash

read -p 'Where would you like to save this alias [~/.bash_aliases]: ' MyAliasFile

MyAliasFile=${name:-~/.bash_aliases}

echo $MyAliasFile

echo Hello $USER, what would you like to name your alias?

read -p 'Alias Name: ' aliasname

echo What would you like $aliasname to do?

read -p 'Command: ' aliascommand

echo "alias $aliasname=\"$aliascommand\"" >> $MyAliasFile
