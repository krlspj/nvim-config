.PHONY: clean backup backup-all

clean:
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
	rm -rf ~/.cache/nvim

backup:
	mv ~/.local/share/nvim{,.bak}
	mv ~/.local/state/nvim{,.bak}
	mv ~/.cache/nvim{,.bak}

backup-all:
	mv ~/.config/nvim{,.bak}
	mv ~/.local/share/nvim{,.bak}
	mv ~/.local/state/nvim{,.bak}
	mv ~/.cache/nvim{,.bak}


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


