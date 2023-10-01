.PHONY: clean backup fclean

clean:
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
	rm -rf ~/.cache/nvim

backup:
	mv ~/.local/share/nvim{,.bak}
	mv ~/.local/state/nvim{,.bak}
	mv ~/.cache/nvim{,.bak}

fclean: clean
	echo "remove neovim binary"
	echo "remove neovim alias"
	rm -rf $HOME/.config/nvim
	echo "successfully deleted neovim from system"




#clean:
#	# required
#	#mv ~/.config/nvim{,.bak}
#
#	# optional but recommended
#	rm -rf ~/.local/share/nvim
#	rm -rf ~/.local/state/nvim
#	rm -rf ~/.cache/nvim
#backup:
#	# required
#	#mv ~/.config/nvim{,.bak}
#
#	# optional but recommended
#	mv ~/.local/share/nvim{,.bak}
#	mv ~/.local/state/nvim{,.bak}
#	mv ~/.cache/nvim{,.bak}


