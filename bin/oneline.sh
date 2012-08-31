#!/bin/bash

# A word about this shell script:
#
# I'm partially copied and totally inspired by npmjs.org
#
# It must work everywhere, including on systems that lack
# a /bin/bash, map 'sh' to ksh, ksh97, bash, ash, or zsh,
# and potentially have either a posix shell or bourne
# shell living at /bin/sh.
#
# See this helpful document on writing portable shell scripts:
# http://www.gnu.org/s/hello/manual/autoconf/Portable-Shell.html
#
# The only shell it won't ever work on is cmd.exe.

if [ "x$0" = "xsh" ]; then
  # run as curl | sh
  # on some systems, you can just do cat>oven-install.sh
  # which is a bit cuter. But on others, &1 is already closed,
  # so catting to another script file won't do anything.
  curl -s https://raw.github.com/shama/eatcake/master/bin/oneline.sh > oneline-$$.sh
  sh oneline-$$.sh
  ret=$?
  rm oneline-$$.sh
  exit $ret
fi

# Get install folder
if [ -z $1 ]; then
  pwd=`pwd`
else
  pwd=./$1
  # Folder exists?
  if [ ! -d "$pwd" ]; then
    mkdir $pwd 2>&1
  fi
fi

# install folder empty?
if [ "$(ls -A $pwd 2>&1 | grep -v oneline-*)" ]; then
  echo "There appears to be files in [$pwd]." >&2
  echo "Please install into an empty folder." >&2
  echo "" >&2
  exit 1
fi

# Download Composer
curl -s https://getcomposer.org/installer | php

# Create the CakePHP project
php composer.phar create-project shama/eatcake $pwd

# Copy composer.phar into new project dir
cp composer.phar $pwd/

echo "CakePHP successfully installed to $pwd"
echo "" >&2
