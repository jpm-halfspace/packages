#!/usr/bin/env bash

TMP_DIR=$(mktemp -d)

# Copy the files to the temporary directory
rsync -av . "$TMP_DIR" --exclude ".git" --exclude "release.tar.gz"

# Create the archive
tar -czf release.tar.gz -C $TMP_DIR .

gh release create v1.0.0 release.tar.gz --title "v1.0.0" --notes "Initial release"