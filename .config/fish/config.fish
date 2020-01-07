set fish_greeting
set fish_key_bindings fish_vi_key_bindings

# VIM as Default Editor
setenv EDITOR vim

# python virtualenvwrapper
eval (python -m virtualfish)

# emacs 
alias emacs="emacs -nw --eval '(setq doom-theme \'doom-tomorrow-night)'"
