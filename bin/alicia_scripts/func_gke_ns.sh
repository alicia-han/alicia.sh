#!/bin/bash

function usage() {
  source ~/Dropbox/bin/alicia_scripts/usage_gke_ns.sh
}

function status() {
  kubectl config view --minify | grep namespace:
}

function setup() {
  kubectl config set-context --current --namespace="${1}"
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
  clean)
  shift 1
    setup ""
  ;;
  "")
    echo -e "\033[31m Can not be vide \033[0m"
  exit 0
  ;;
  status)
    status
  exit 0
  ;;
  *)
    echo -e "\033[33m Try to switch to gke namespace :\033[0m $1"
    setup $1
    status
  ;;
esac
