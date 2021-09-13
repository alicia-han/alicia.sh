#!/bin/bash

function usage() {
  source ~/Dropbox/bin/alicia_scripts/usage_switch.sh
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
  fr-prod)
  shift 1
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch GCP Profile\033[0m \n" &&\
    alicia.sh gcp ornikar-fr-prod &&\
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch GKE Profile\033[0m \n " &&\
    alicia.sh gke prod-main &&\
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch Namespace Profile\033[0m \n" &&\
    alicia.sh gke-ns apps
  ;;
  es-prod)
  shift 1
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch GCP Profile\033[0m \n" &&\
    alicia.sh gcp ornikar-es-prod &&\
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch GKE Profile\033[0m \n " &&\
    alicia.sh gke prod-main &&\
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch Namespace Profile\033[0m \n" &&\
    alicia.sh gke-ns apps
  ;;
  es-staging)
  shift 1
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch GCP Profile\033[0m \n" &&\
    alicia.sh gcp ornikar-es-staging &&\
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch GKE Profile\033[0m \n " &&\
    alicia.sh gke staging-main &&\
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch Namespace Profile\033[0m \n" &&\
    alicia.sh gke-ns apps
  ;;
  fr-staging)
  shift 1
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch GCP Profile\033[0m \n" &&\
    alicia.sh gcp ornikar-fr-staging &&\
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch GKE Profile\033[0m \n " &&\
    alicia.sh gke staging-main &&\
    echo -e "\033[33m --------------------- \033[0m \n" &&\
    echo -e "\033[33m Switch Namespace Profile\033[0m \n" &&\
    alicia.sh gke-ns apps
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
