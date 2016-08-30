alias dockerrmdangling="docker images --filter 'dangling=true' -q | xargs docker rmi"
