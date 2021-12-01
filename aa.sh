#!/bin/bash
source ~/bin/projects/acreator/aa.rc

setup_terminal() {
  # Setup the terminal for the TUI.
  # '\e[?1049h': Use alternative screen buffer.
  # '\e[?7l':    Disable line wrapping.
  # '\e[?25l':   Hide the cursor.
  # '\e[2J':     Clear the screen.
  # '\e[1;Nr':   Limit scrolling to scrolling area.
  #              Also sets cursor to (0,0).
  printf '\e[?1049h\e[?7l\e[?25l\e[2J\e[1;%sr' "$max_items"

    # Hide echoing of user input
    # stty -echo
  }

get_term_size() {
  read -r LINES COLUMNS < <(stty size)

  ((max_items=LINES-3))
}

set_alias_file() {
  # Set default alias file
  default_file=~/.bash_aliases
  # Set alias from config file
  my_alias_file=${my_file:-$default_file}
}

add_alias() {
  # Get the name of the alias
  read -p 'What is the alias name: ' new_alias_name
  echo $new_alias_name
  # Get alias command
  read -p "What will $new_alias_name do? " new_alias_command
  echo $new_alias_command
  save_alias
}

save_alias() {

  echo Would you like to save $new_alias_name [yY/nN]
  while true; do
    read -p "$1" 'yn'
    if [ "$yn" = "" ]; then
      yn='Y'
    fi
    case $yn in
      [yY] ) echo "alias $new_alias_name=\"$new_alias_command\"" >> $my_alias_file; break;;
      [nN] ) echo "Aborting..."; exit;;
    esac
  done

}

main() {

  get_term_size
  setup_terminal
  set_alias_file
  add_alias

}

main "$@"
