set fish_greeting
set fish_key_bindings fish_vi_key_bindings

# Emacs no gui
alias emacs="emacs -nw --eval '(setq doom-theme \'doom-tomorrow-night)'"

# VIM as Default Editor
setenv EDITOR vim

# python virtualenvwrapper
eval (python -m virtualfish)

# unset for fish
alias unset "set --erase"

# doom
alias doom="~/.emacs.d/bin/doom"
