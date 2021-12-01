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
  printf '\e[?1049h' "$max_items"
  # \e[?7l\e[?25l\e[2J\e[1;%sr' "$max_items"

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

  my_alias_file=${my_file:-$default_file}

  echo $my_alias_file



}

main() {

  get_term_size
  setup_terminal
  set_alias_file

}

main "$@"
