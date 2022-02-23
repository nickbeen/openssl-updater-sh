# OpenSSL Updater

Simple shell script to update a custom OpenSSL installation.

## Why for custom installations?

For instance if you compile your own OpenSSL installation as a module for Nginx because your OS might not run the latest version of OpenSSL, this script makes updating the custom OpenSSL installation much easier and faster. It downloads and installs the latest version while updating an useful symlink pointing to the latest downloaded version.

The symlink removes the necessity to edit config files for every update. While downloaded tar.gz files will be deleted, unpacked installations will not be removed in case you need to downgrade your OpenSSL version.

OpenSSL libraries can be found at [www.openssl.org](https://www.openssl.org/source/).

## What does it do?

- It downloads the specified OpenSSL library as a tar.gz file  
- It unpacks the downloaded tar.gz file in a versioned folder 
- It updates an `openssl-1.1.1` symlink
- It removes the downloaded tar.gz file

## Requirements

- Tar (preinstalled on most Linux distributions)
- Wget (preinstalled on most Linux distributions)

## Installation

Clone this repository in the folder where you want to save your custom OpenSSL installations.

## Usage

For help instruction:

```
$ ./openssl-updater.sh
$ [?] Usage: ./openssl-updater.sh https://www.openssl.org/source/openssl-1.1.1{version}.tar.gz
```

For downloading OpenSSL 1.1.1m:

```
$ ./openssl-updater.sh https://www.openssl.org/source/openssl-1.1.1m.tar.gz
$ [V] Downloaded openssl-1.1.1m.tar.gz
$ [V] Unpacked openssl-1.1.1m.tar.gz
$ [V] Updated openssl-1.1.1 symlink
$ [V] Removed openssl-1.1.1m.tar.gz
```

## License

This library is licensed under the MIT License (MIT). See the [LICENSE](LICENSE.md) for more details.
