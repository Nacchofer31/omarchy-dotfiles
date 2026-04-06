# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias vim='nvim'

export CHROME_EXECUTABLE=/usr/bin/chromium
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_AVD_HOME=$HOME/.config/.android/avd
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools

