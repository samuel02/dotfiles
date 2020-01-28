export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
export GOPATH=~/go
export PYTHON_USER_BASE_PATH=$(python3 -m site --user-base)

export PATH="$HOME/.bin:/usr/local/sbin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:/usr/local/opt/fzf/bin"
export PATH="/usr/local/opt/python@2/bin:$PATH"
export PATH="/usr/local/opt/python@3/bin:$PATH"
export PATH="$PYTHON_USER_BASE_PATH/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=".git/safe/../../bin:$PATH"
