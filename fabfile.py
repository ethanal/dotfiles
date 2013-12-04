from fabric.api import cd, lcd, local, run


def _push():
    with lcd("~/.dotfiles"):
        local("git push")

def deploy():
    _push()
    with cd("~/.dotfiles"):
        run("git pull")

def bootstrap():
    deploy()
    with cd("~/.dotfiles"):
        run("./bootstrap")
