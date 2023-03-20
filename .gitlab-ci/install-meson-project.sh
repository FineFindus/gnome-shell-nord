#!/bin/bash

set -e

usage() {
  cat <<-EOF
	Usage: $(basename $0) [OPTION…] REPO_URL COMMIT SUBDIR PREPARE

	Check out and install a meson project

	Options:
	  -Dkey=val      Option to pass on to meson

	EOF
}

TEMP=$(getopt \
  --name=$(basename $0) \
  --options=D \
  -- "$@")

eval set -- "$TEMP"
unset TEMP

MESON_OPTIONS=()

while true; do
  case "$1" in
    -D)
      MESON_OPTIONS+=( -D$2 )
      shift 2
    ;;

    --)
      shift
      break
    ;;
  esac
done

if [[ $# -lt 4 ]]; then
  usage
  exit 1
fi

REPO_URL="$1"
COMMIT="$2"
SUBDIR="$3"
PREPARE="$4"

CHECKOUT_DIR=$(mktemp --directory)
trap "rm -rf $CHECKOUT_DIR" EXIT

git clone --depth 1 "$REPO_URL" -b "$COMMIT" "$CHECKOUT_DIR"

pushd "$CHECKOUT_DIR/$SUBDIR"
sh -c "$PREPARE"
meson setup --prefix=/usr _build "${MESON_OPTIONS[@]}"
meson install -C _build
popd
