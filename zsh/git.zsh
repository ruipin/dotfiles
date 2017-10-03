#########################################
# git.zsh
# Author: Rui Pinheiro
#
# Git-related helpers and methods

function git_aliases {
	local gitaliases
	local aliasnames
	local aliasvals

	# Collect aliases line-by-line
	gitaliases=$( \
		git config --get-regexp "^alias\." | \
		cut -c 7- \
	)

	# Convert alias names to an array
	aliasnames=$( \
		echo "$gitaliases" | \
		cut -f 1 -d " " \
	)
	aliasnames=("${(@f)aliasnames}")

	# Convert alias values to an array
	aliasvals=$( \
		echo "$gitaliases" | \
		cut -f 2- -d " " | \
		sed -e "s/^\\([^!].*\\)$/$fg[green]\\1$reset_color/" \
		    -e "s/^\\!git \\(.*\\)/$fg[blue]\\1$reset_color/" \
		    -e "s/^\\(\\!.*\\)$/$fg[yellow]\\1$reset_color/" \

	)
	aliasvals=("${(@f)aliasvals}")

	# Loop through aliases, printing them
	for i in {1..$#aliasnames}; do
		echo "$fg[red]$aliasnames[$i]$reset_color\t= $aliasvals[$i]"
	done
	unset i
}
