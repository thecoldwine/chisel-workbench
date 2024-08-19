#!/usr/bin/env bash
set -e

yamllint -c "./config.yaml" $HOME/Development/chisel-releases/slices/

export LC_COLLATE=C
EXIT_CODE=0

err() {
  echo "error:   " "$@" >&2
  EXIT_CODE=1
}
warn() {
  echo "warning: " "$@" >/dev/null
}

for filename in $(find $HOME/Development/chisel-releases/slices/ | grep "\.yaml$" | sort); do
#  echo "processing_file $filename"
  yq '.slices | keys | .[]' "$filename" | sort -C || \
    warn "$filename: slice names are not sorted"
  for slice in $(yq '.slices | keys | .[]' "$filename"); do
    key="$slice" yq \
      '.slices | with_entries(select(.key == env(key))) | .[].essential[]' \
      "$filename" | sort -c || \
      err "$filename: $slice: \"essential\" entries are not sorted"
    key="$slice" yq \
      '.slices | with_entries(select(.key == env(key))) | .[].contents | select(.) | keys | .[]' \
      "$filename" | sort -c || \
      err "$filename: $slice: \"contents\" entries are not sorted"
  done
done

exit $EXIT_CODE
