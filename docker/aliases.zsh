alias dockerrmdangling="docker images -a --filter 'dangling=true' -q --no-trunc | xargs docker rmi"
