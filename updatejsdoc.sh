#!/bin/bash

set -e

JSDOC_DIR="docs"

pushd .. > /dev/null
pwd

# in each dir
for file in *; do
    if [[ ! -d "$file" ]]; then
        echo "$file IS NOP DIR"
    else
        echo "$file IS DIR"
    fi
    [[ ! -d "$file" ]] && continue

    # switch to dir
    basename=$(basename "$file")
    pushd "$basename" > /dev/null

    # skip if JSDOC does not exist
    [ ! -d "$JSDOC_DIR" ] && popd && continue

    # remove old doc
    rm -rf "$JSDOC_DIR"

    # update
    jsdoc . -c ../common/jsdoc.json -t ~/.npm-packages/lib/node_modules/docdash

    # push changes
    git add "$JSDOC_DIR"
    git commit -m "Update JSDoc"
    git push

    echo "Updated JSDoc in $basename."
    echo
    echo

    popd
done

popd
