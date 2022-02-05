.PHONY: install remove

install: 
	ln -s ${PWD} ~/.dotfiles
	ls ~/.dotfiles/stow | xargs -I % stow --dir=${HOME}/.dotfiles/stow --target=${HOME}/ %

remove:
	ls ~/.dotfiles/stow | xargs -I % stow -D --dir=${HOME}/.dotfiles/stow --target=${HOME}/ %
	rm ~/.dotfiles
