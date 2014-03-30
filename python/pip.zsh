if [ $(uname -s) = "Darwin" ] || [[ $(hostname) =~ .*eal.* ]]
then
    # virtualenv should use Distribute instead of legacy setuptools
    export VIRTUALENV_DISTRIBUTE=false
    # Centralized location for new virtual environments
    export PIP_VIRTUALENV_BASE=$HOME/.virtualenvs
    # pip should only run if there is a virtualenv currently activated
    # export PIP_REQUIRE_VIRTUALENV=true
    # cache pip-installed packages to avoid re-downloading
    export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

    source /usr/local/bin/virtualenvwrapper.sh 
fi

if [ "$(hostname)" = "ion" ]
then
    source /usr/local/bin/ion_development_env_setup.sh
fi
