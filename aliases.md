# .docker_aliasesの設定
```
# import this file on your ~/.bash_profile or ~/.bash_rc
# if [ -f ~/.myalias ]; then
#   source ~/.myalias
# fi

# show full command & execute 
alias al='_(){ CMD=$(alias | grep "alias $1=" | cut -d = -f 2- | sed "s:^.\(.*\).$:\1:"); ARG=$(echo $@ | sed "s/^$1//"); CMD="${CMD}${ARG}"; echo "execute : ${CMD}"; echo " "; bash -c "${CMD}"; };_'

# docker
alias al-dock='cat ~/.docker_aliases | grep dock | sed "s/=/      \t\= /"'
alias dock='docker'
alias docki='docker images'
alias dockps='docker ps -a'
alias dockrrm='docker run --rm'
alias dockeit='docker exec -it'
alias dockrm='docker rm -f'
alias dockrmi='docker rmi -f'
alias dockrma='docker rm -f $(docker ps -aq)'
alias dockrmia='docker rmi -f $(docker images -aq)'
alias dockins='docker inspect'
alias dockip='docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'
alias docklogs='dock logs --tail 50 --follow --timestamps'
alias dockc='docker-compose'
alias dockcb='docker-compose build'
alias dockcu='docker-compose up -d'
alias dockcd='docker-compose down'
alias dockccl='grep container_name docker-compose.yml'
alias dockrft='docker run --init --interactive --tty --detach --name'
```