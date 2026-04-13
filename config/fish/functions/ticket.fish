function ticket
    set ticket_name (git rev-parse --abbrev-ref HEAD | string split '/' | string match -r "^.*[0-9]")
    commandline -r 'git commit -m "'$ticket_name': '
end
