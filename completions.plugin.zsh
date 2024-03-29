# Copyright (c) 2020 Mikkel Kaysen

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}
0=${${(M)0:#/*}:-$PWD/$0}

# Then ${0:h} to get plugin's directory

if [[ ${zsh_loaded_plugins[-1]} != */completions && -z ${fpath[(r)${0:h}/functions]} ]] {
  fpath+=( "${0:h}/functions" )
}

if [[ ${+commands[brew]} && -z ${fpath[(r)$(brew --prefix)/share/zsh/site-functions]} ]] {
  fpath+=( "$(brew --prefix)/share/zsh/site-functions" )
}
