#!/bin/bash
#
# Simple shell script to update a custom OpenSSL installation

# Set branch version
openssl="openssl-1.1.1"

if [ -z "$1" ]; then
  echo  "[?] Usage: ./openssl-updater.sh https://www.openssl.org/source/${openssl}{version}.tar.gz"
  exit 1
else
  if [[ "$1" != *.tar.gz ]]; then
    echo "[X] ERROR: Link is not an ${openssl}{version}.tar.gz file"
    exit 1
  fi
fi

# Get file name
file="$(basename "$1")"

# Download tar.gz file with Wget
wget --no-clobber --output-document="${file}" --quiet "$1"

if [ $? -eq 0 ]; then
  echo "[V] Downloaded ${file}"
else
   echo "[X] ERROR: Cannot download ${file} file"
   exit 1
fi

# Unpack tar.gz file
tar --extract --file "${file}" --gzip --one-top-level

if [ $? -eq 0 ]; then
  echo "[V] Unpacked ${file}"
else
  echo "[X] ERROR: Cannot unpack ${file} file"
  exit 1
fi

# Get directory name
directory="$(basename "$1" .tar.gz)"

# Create or update symlink
ln --force --no-dereference --symbolic "${directory}" "$openssl"

if [ $? -eq 0 ]; then
  echo "[V] Updated ${openssl} symlink"
else
  echo "[X] ERROR: Cannot overwrite ${openssl} symlink"
  exit 1
fi

# Remove downloaded tar.gz file
unlink "${file}"

if [ $? -eq 0 ]; then
  echo "[V] Removed ${file}"
else
  echo "[X] ERROR: Cannot delete ${file}"
  exit 1
fi
