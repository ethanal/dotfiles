set -U fish_greeting ""

set -gx GIT_COMPLETION_CHECKOUT_NO_GUESS 1
set -gx EDITOR (which nvim)
set -gx PYTHONSTARTUP "$HOME/.pythonrc"
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

set -gx LESS "-R --mouse --wheel-lines=2 -i"
set -gx AWS_PAGER ""

# Homebrew setup (macOS)
if test -f /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)

    # Use GNU coreutils by default
    set -gx PATH (brew --prefix coreutils)/libexec/gnubin $PATH
    set -gx MANPATH (brew --prefix coreutils)/libexec/gnuman $MANPATH

    # Use GNU findutils by default
    set -gx PATH (brew --prefix findutils)/libexec/gnubin $PATH
    set -gx MANPATH (brew --prefix findutils)/libexec/gnuman $MANPATH

    # Use GNU sed by default
    set -gx PATH (brew --prefix gnu-sed)/libexec/gnubin $PATH
    set -gx MANPATH (brew --prefix gnu-sed)/libexec/gnuman $MANPATH

    # Use GNU tar by default
    set -gx PATH (brew --prefix gnu-tar)/libexec/gnubin $PATH
    set -gx MANPATH (brew --prefix gnu-tar)/libexec/gnuman $MANPATH

    set -gx PATH (brew --prefix openjdk)/bin $PATH

    set -gx PATH (brew --prefix libpq)/bin $PATH
end

set -gx PATH $HOME/bin $PATH
set -gx PATH /usr/local/go/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.dotfiles/bin $PATH
set -gx PATH /snap/bin $PATH
set -gx PATH $HOME/.local/bin $PATH

set -gx ITERM2_SQUELCH_MARK 1
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc
set -gx CLASSPATH /usr/local/lib/tla2tools.jar
set -gx JJ_CONFIG $HOME/.dotfiles/jj-config.toml

# source $HOME/.dotfiles/funcs.fish
# source $HOME/.dotfiles/local.fish

alias vim=nvim
