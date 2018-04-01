# Don't know what this does...
gpip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
    }
# Adding TeX to path...
export PATH=/usr/local/bin:/usr/local/sbin:~/.local/bin/:/Library/TeX/texbin/:$PATH

# My aliases
alias siraf="ssh -Y trinkle@siraf-login.bsd.uchicago.edu"
alias midway1="ssh -Y trinkle@midway1.rcc.uchicago.edu"
alias midway2="ssh -Y trinkle@midway2.rcc.uchicago.edu"
alias cooley="ssh trinkle@cooley.alcf.anl.gov"
alias theta="ssh trinkle@theta.alcf.anl.gov"
alias em="emacs&"
alias matlab="/Applications/MATLAB_R2016b.app/bin/matlab -nodesktop nosplash"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Lobrary/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Lobrary/CoreServices/Finder.app'
alias latexmk="latexmk -pvc -pdf"
alias maildocs="cd ~/Library/Containers/com.apple.mail/Data/Library/Mail\ Downloads"
alias mostrecent='cd  "$(\ls -1dt ./*/ | head -n 1)"'


# Don't know what this does...
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi


# MacPorts Installer addition on 2017-05-12_at_08:54:52: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# added by Anaconda3 4.3.1 installer
export PATH="/Users/scotttrinkle/anaconda/bin:$PATH"

# configuring for ANTs
export ANTSPATH=${HOME}/antsbin/ants/bin/
export PATH=${ANTSPATH}:$PATH

# changes terminal appearance to be nicer
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='TERM=ansi ls -GFh'

# adds color functionality to "grep"
alias grep='grep -i'
export GREP_OPTIONS='--color=always'

# I think this helped the pdf viewer on emacs...
export PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig

# Adding southwest check-in app
export PATH="/Users/scotttrinkle/Applications/Misc_FOSS/Southwest-Checkin:$PATH"

# Paraview
export PATH="/Applications/ParaView-5.4.1-822-g597adef982.app/Contents/bin:$PATH"
export PATH="/Applications/ParaView-5.4.1-822-g597adef982.app/Contents/MacOS:$PATH"

# YCM completions for external cpp libraries?
export PATH="/Users/scotttrinkle/Applications/Misc_FOSS/YCM-Generator:$PATH"
