set fish_greeting
set fish_key_bindings fish_vi_key_bindings

# VIM as Default Editor
setenv EDITOR vim

# python virtualenvwrapper
# eval (python -m virtualfish)

# emacs 
alias emacs="emacs -nw --eval '(setq doom-theme \'doom-tomorrow-night)'"
# doom
alias doom="~/.emacs.d/bin/doom"

# gopath and go executables
setenv GOPATH /home/mahan/go
set -gx PATH /home/mahan/go/bin $PATH

# LD_LIBRARY_PATH for mujoco
set -gx LD_LIBRARY_PATH /home/mahan/.mujoco/mujoco200/bin $LD_LIBRARY_PATH

# LD_PRELOAD (for mujoco-py)
set -gx LD_PRELOAD /usr/lib/libGLEW.so $LD_PRELOAD
