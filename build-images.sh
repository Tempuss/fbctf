#!/bin/bash

while getopts 'm:c:s:r:hp' OPT; do
  case $OPT in
  m) MYSQL=$OPTARG ;;
  c) CACHE=$OPTARG ;;
  s) HHVM=$OPTARG ;;
  r) REPO=$OPTARG ;;
  h) hlp="yes" ;;
  *) unknown="yes" ;;
  esac
done

# Usage
HELP="
    usage: $0 [ -m value -c value -c value -h ]
        -m  --> MySQL Server Ip
        -c  --> Cache Server Ip
        -s  --> HHVM Server Ip
        -r  --> Repository to push the images

"
SCRIPTPATH="$(
  cd "$(dirname "$0")"
  pwd -P
)"

if [ "$hlp" = "yes" ] || [ -z "$CACHE" ] || [ -z "$MYSQL" ] || [ -z "$HHVM" ] || [ -z "$REPO" ]; then
  echo "$HELP"
  exit 0
fi

SERVICE_NAME=(
  $(
    cd extra ;
    ls -d */ |
    cut -f1 -d'/'
  )
)

for NAME in "${SERVICE_NAME[@]}"; do
  if [[ "$NAME" != "cache|mysql" ]]; then
    docker build -f extra/$NAME/Dockerfile . -t $REPO/fbctf_$NAME
  elif [[ "$NAME" = "nginx" ]]; then
    docker build -f extra/$NAME/Dockerfile . -t $REPO/fbctf_$NAME
  else
    docker build -f extra/$NAME/Dockerfile . -t $REPO/fbctf_$NAME
  fi
  docker push $REPO/fbctf_$NAME:latest
done
