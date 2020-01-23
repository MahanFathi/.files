#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi
# >>> Added by cnchi installer
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano

# CUDA LD LIB PATH FOR TF
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/extras/CUPTI/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/targets/x86_64-linux/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/lib64

alias sepah="echo -e 'yes\nir523701\n649561' | sudo openconnect --reconnect 1 s9150.uiadd.site"

# python-virtualenvwrapper settings
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# MuJoCo PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/mahan/.mujoco/mujoco200/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/.mujoco/mujoco200/bin
export LD_PRELOAD=$LD_PRELOAD:/usr/lib/libGLEW.so

