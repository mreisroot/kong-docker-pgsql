#!/bin/sh

# Import functions defined on the functions.sh file
. "./functions.sh"

# Run the code indefinetely until the choice variable equals 3
while :;
do
  # Clear screen
  clear

  # Option menu
  printf "KONG-DOCKER STACK MENU\n\n"
  for i in $(seq 1 4);
  do
    case "${i}" in
      1) echo "[ ${i} ] - Deploy Stack";;
      2) echo "[ ${i} ] - Destroy Stack";;
      3) echo "[ ${i} ] - Destroy Stack and Clear Data";;
      4) echo "[ ${i} ] - Exit";;
    esac
  done

  printf "\nYour choice: " >&2
  read -r choice

  case "${choice}" in
    1) deploy;;
    2) destroy;;
    3) destroy_clear_data;;
    4) break;;
  esac
done
