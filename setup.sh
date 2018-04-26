#!/bin/sh

# Check for current dotfiles in $HOME

FILES="zshrc vimrc tmux.conf"
SUFFIX_BK="bkup"
BASEDIR=$(pwd)

for FILE in $FILES
do	
	if [ -f $HOME/.$FILE ]
	then
		# Check if a .bkup file already exists and exit if it does
		if [ -f $HOME/.$FILE.$SUFFIX_BK ]
		then
			echo "Found an existing .bkup file -- exiting"
			exit 1
		fi

		# Rename existing files to .bkup
		mv $HOME/.$FILE $HOME/.$FILE.$SUFFIX_BK
	fi
	# Create symlink for each file in $FILES
	ln -s $BASEDIR/$FILE $HOME/.$FILE
done
