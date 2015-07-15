# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we're using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Note: already have the path stuff in .bash_profile
install coreutils
# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
# Install GNU `sed`, overwriting the built-in `sed`
# Note: using --with-default-names instead of the path stuff
install gnu-sed --with-default-names
# Install Bash 4
# Note: Don't forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
# It's defaulted to keg-only, mush be added to /etc/shells if I want to use this version as my login shell
install bash
# NOTE: I believe that this comes with git or something
# But let's try it anyways
install bash-completion

# Install more recent versions of some OS X tools
install macvim --override-system-vim
# Then do `brew linkapps macvim`

# install homebrew/dupes/grep
# install homebrew/dupes/screen

# Install other useful binaries
install ack
install pt # I use this instead of grep or ack, pretty nice
install git
install imagemagick --with-webp
install node # This installs `npm` too using the recommended installation method
install p7zip # 7zip Executable on Linux/Osx
install dos2unix # Great utility to change line endings for files

# Programming utilities
install python
install python3
install lua
# rbenv makes managing versions easier, ruby-build assists by adding "rbenv install"
install rbenv ruby-build

# Things I haven't installed but could
# install nmap # Network Map Hacker Tool - Homepage: http://nmap.org
# install pigz # Parallelized Implementation of gzip - Homepage: http://www.zlib.net/pigz/
# install pv # Pipe View Utility - Homepage: http://www.ivarch.com/programs/pv.shtml
# install rename # Rename Utility - Homepage: http://plasmasturm.org/code/rename/
# install tree # Directory Listing - Homepage: http://mama.indstate.edu/users/ice/tree/
# install webkit2png # Website Screenshotter - Homepage: http://www.paulhammond.org/webkit2png/
# install zopfli # Improved (slow-ass) Compression - Homepage: https://code.google.com/p/zopfli/

# Remove outdated versions from the cellar
cleanup
