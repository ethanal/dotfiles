if test ! $(which cowsay)
then
    echo -e "\e[31m$(python -c "from datetime import date; print str((date(date.today().year, 12, 21) - date.today()).days) + ' until Winter Break'" | cowsay -f moose)"
fi