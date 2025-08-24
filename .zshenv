
BREW_HOME=$HOME/.brew
DOCKER_HOME=$HOME/.docker

LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
LSCOLORS=exfxcxdxbxegedabagacad
JQ_COLORS="1;30:0;39:0;39:0;39:1;35:1;39:1;39:1;36"

HOMEBREW_NO_GOOGLE_ANALYTICS=1

LDFLAGS="-L${BREW_HOME}/lib"
CPPFLAGS="-I${BREW_HOME}/include"

ASDF_CONFIG_FILE=$HOME/.asdfrc

JETBRAINS_SCRIPTS="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# GUILE_LOAD_PATH="$BREW_HOME/share/guile/site/3.0"
# GUILE_LOAD_COMPILED_PATH="$BREW_HOME/lib/guile/3.0/site-ccache"
# GUILE_SYSTEM_EXTENSIONS_PATH="$BREW_HOME/lib/guile/3.0/extensions"

GUILE_TLS_CERTIFICATE_DIRECTORY=$BREW_HOME/etc/gnutls/

load_paths=(
    $BREW_HOME/bin
    $BREW_HOME/sbin
    $HOME/.local/bin
    $DOCKER_HOME/bin
    $HOME/.bun/bin
    $JETBRAINS_SCRIPTS
    $HOME/Library/Group Containers/FELUD555VC.group.com.egnyte.DesktopApp/CLI
    # $BREW_HOME/opt/binutils/bin
    $BREW_HOME/opt/berkeley-db/bin
    $BREW_HOME/opt/bzip2/bin
    $BREW_HOME/opt/curl/bin
    $BREW_HOME/opt/file-formula/bin
#    $BREW_HOME/opt/gnu-getopt/bin
    $BREW_HOME/opt/libidn2/bin
    $BREW_HOME/opt/libtasn1/bin
    $BREW_HOME/opt/m4/bin
    $BREW_HOME/opt/openssl/bin
    # $BREW_HOME/opt/openssl1.1/bin
    $BREW_HOME/opt/openldap/bin
    # $BREW_HOME/opt/ruby/bin
    $BREW_HOME/opt/llvm/bin
    $BREW_HOME/opt/sqlite/bin
    $BREW_HOME/opt/unzip/bin
    $BREW_HOME/opt/ed/libexec/gnubin
    $BREW_HOME/opt/findutils/libexec/gnubin
    $BREW_HOME/opt/gawk/libexec/gnubin
    $BREW_HOME/opt/gnu-indent/libexec/gnubin
    $BREW_HOME/opt/gnu-sed/libexec/gnubin
    $BREW_HOME/opt/gnu-tar/libexec/gnubin
    $BREW_HOME/opt/gnu-which/libexec/gnubin
    $BREW_HOME/opt/grep/libexec/gnubin
    $BREW_HOME/opt/libtool/libexec/gnubin
    $BREW_HOME/opt/make/libexec/gnubin
    $BREW_HOME/opt/mysql-client/bin
    $BREW_HOME/opt/libpq/bin
)

load_man_paths=(
    $BREW_HOME/share/man
    $BREW_HOME/opt/ed/libexec/gnuman
    $BREW_HOME/opt/findutils/libexec/gnuman
    $BREW_HOME/opt/gnu-indent/libexec/gnuman
    $BREW_HOME/opt/gnu-sed/libexec/gnuman
    $BREW_HOME/opt/gnu-tar/libexec/gnuman
    $BREW_HOME/opt/gnu-which/libexec/gnuman
    $BREW_HOME/opt/grep/libexec/gnuman
    $BREW_HOME/opt/libtool/libexec/gnuman
    $BREW_HOME/opt/make/libexec/gnuman
)