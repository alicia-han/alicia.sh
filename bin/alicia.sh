#!/bin/bash

APP_PATH="$HOME/Dropbox/bin/"

usage_main() {
  cat "${APP_PATH}alicia_mem/usage_main.txt"
}


usage_mem() {
  bash "${APP_PATH}"alicia_scripts/usage_mem.sh "${APP_PATH}"
}

usage_git() {
  bash "${APP_PATH}"alicia_scripts/usage_git.sh "$APP_PATH"
}


####################################
##         FUNCTION  GIT          ##
####################################

function func_git() {
  while getopts "h" arg
  do
    case $arg in
      # a)
      # $OPTARG
      # ;;
      h)
      usage_git
      exit 0
      ;;
      ?)
      echo -e "\\033[31m Unknow argument \\033[0m"
      exit 1
      ;;
    esac
  done

  shift $((OPTIND-1))

  case $1 in
    status)
    shift 1
    git config --list "$@"
    ;;
    "")
    exit 0
    ;;
    help)
      usage_git
    exit 0
    ;;
    *)
      if [[ -f ${APP_PATH}alicia_git/git_"${1}".yaml ]]; then
        python3 "${APP_PATH}alicia_scripts/apply_git_config.py"  "${APP_PATH}alicia_git/git_${1}.yaml"
      else
        echo -e "\033[31m [Error] No Such Configuration file in ${APP_PATH}alicia_git/  \033[0m"
      fi
    exit 0
    ;;
  esac
}




####################################
##         FUNCTION  MEM          ##
####################################


function func_mem() {
  while getopts "he" arg
  do
    case $arg in
      h)
      usage_mem
      exit 0
      ;;
      e)
      MEM_EDIT=True
      ;;
      ?)
      echo -e "\\033[31m Unknow argument \\033[0m"
      exit 1
      ;;
    esac
  done

  shift $((OPTIND-1))

  case $1 in
    help)
    shift 1
    usage_mem "$@"
    ;;
    "")
    exit 0
    ;;
    *)
      if [[ -f ${APP_PATH}alicia_mem/usage_mem_"${1}".txt ]]; then
        if [[ $MEM_EDIT == "True" ]]; then
          vim "${APP_PATH}alicia_mem/usage_mem_${1}.txt"
        else
          cat "${APP_PATH}alicia_mem/usage_mem_${1}.txt"
        fi
      else
        echo -e "\033[31m [File not found \033[0m : create a new entry:"
        vim "${APP_PATH}alicia_mem/usage_mem_${1}.txt"
      fi
    exit 0
    ;;
  esac
}


####################################
##         MAIN FUNCTION          ##
####################################

while getopts "h" arg
do
  case $arg in
    h)
    usage_main
    exit 0
    ;;
    ?)
    echo -e "\\033[31m Unknow argument \\033[0m"
    exit 1
    ;;
  esac
done

shift $((OPTIND-1))

case $1 in
  mem)
  shift 1
  func_mem "$@"
  ;;
  git)
  shift 1
  func_git "$@"
  ;;
  gcp)
  shift 1
  source ~/Dropbox/bin/alicia_scripts/func_gcp.sh "$@"
  ;;
  switch)
  shift 1
  source ~/Dropbox/bin/alicia_scripts/func_switch.sh "$@"
  ;;
  gke)
  shift 1
  source ~/Dropbox/bin/alicia_scripts/func_gke.sh "$@"
  ;;
  gke-ns)
  shift 1
  source ~/Dropbox/bin/alicia_scripts/func_gke_ns.sh "$@"
  ;;
  help)
  shift 1
  usage_main "$@"
  ;;
  "")
  exit 0
  ;;
  *)
  echo -e "\\033[31m Error \\033[0m No Such Option" 1>&2
  exit 1
  ;;
esac
