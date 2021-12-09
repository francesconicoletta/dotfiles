stow_dirs = $(wildcard */)
.PHONY : stow
stow :
	stow --target $(HOME) --verbose $(stow_dirs)

.PHONY : dryrun
dryrun :
	stow --no --target $(HOME) --verbose $(stow_dirs)

.PHONY : restow
restow :
	stow --target $(HOME) --verbose --restow $(stow_dirs)

.PHONY : unstow
delete :
	stow --target $(HOME) --verbose --delete $(stow_dirs)
