#!/bin/bash

function usage() {
  source ~/Dropbox/bin/alicia_scripts/usage_gcp.sh
}

while getopts "h" arg
do
  case $arg in
    # a)
    # $OPTARG
    # ;;
    h)
      usage
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
  help)
  shift 1
  usage "$@"
  ;;
  "")
    echo -e "\033[31m Can not be vide \033[0m"
  exit 0
  ;;
  status)
    gcloud config list
  exit 0
  ;;
  *)
    echo -e "\033[33m Try to switch to project :\033[0m $1"
    gcloud config set project $1
  ;;
esac
