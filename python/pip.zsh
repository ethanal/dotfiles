if [ "$(uname -s)" == "Darwin" ]
then
    # virtualenv should use Distribute instead of legacy setuptools
    export VIRTUALENV_DISTRIBUTE=false
    # Centralized location for new virtual environments
    export PIP_VIRTUALENV_BASE=$HOME/.virtualenvs
    # pip should only run if there is a virtualenv currently activated
    # export PIP_REQUIRE_VIRTUALENV=true
    # cache pip-installed packages to avoid re-downloading
    export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

    source /usr/local/bin/virtualenvwrapper.sh 
fi