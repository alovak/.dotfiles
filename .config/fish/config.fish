if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting "🐟"

    # Init rbenv only if it's installed
    if command -v rbenv >/dev/null 2>&1
	    rbenv init - fish | source
    end
end

function vi
	switch (uname)
		case Linux
			command vim $argv
		case Darwin
			mvim -v $argv
	end
end

function vim
	switch (uname)
		case Linux
			command vim $argv
		case Darwin
			mvim -v $argv
	end
end

function gs
    git status $argv[1]
end

function ts --wraps tmux
    tmux new-session -A -s $argv[1]
end


function drestart
    docker-compose up -d --force-recreate --no-deps $argv
end

function gots
    gotestsum -- $argv
end

function gocover
    go test -coverprofile=coverage.out
    go tool cover -html=coverage.out
end

function gocoverall
    go test ./... -coverprofile=coverage.out
    go tool cover -html=coverage.out
end

function config
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end
