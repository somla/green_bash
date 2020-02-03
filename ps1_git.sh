function ps1_git_branch {
    local branch="`git branch 2>/dev/null | grep '^*' | colrm 1 2`";
    if [ "$branch" != "" ]; then
        local branch=":$branch";
    fi
    echo "$branch"
}

function ps1_git_postfix {
    local project_root="`git rev-parse --show-toplevel 2>/dev/null`"
    if [ "$project_root" != "" ]; then
        local project_root="`dirname -- "$project_root"`";
        local postfix="`pwd | sed --sandbox "s@^$project_root/@@g"`";
        echo "$postfix";
    fi
}

function ps1_git_prefix {
    local project_root="`git rev-parse --show-toplevel 2>/dev/null`";
    local dir=""
    if [ "$project_root" != "" ]; then
        local dir="`dirname -- $project_root`/";
    else
        local dir="`pwd`"
    fi
    echo $dir | sed --sandbox "s@$HOME@~@g"
}

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    #PS1='\[\033[01;34m\]$(ps1_git_prefix)\[\033[01;36m\]$(ps1_git_postfix)\[\033[00m\]\[\033[01;32m\]$(ps1_git_branch)\[\033[00m\]\$ ';
    PS1='\[\033[01;34m\]$(ps1_git_prefix)\[\033[01;32m\]$(ps1_git_postfix)\[\033[00m\]\[\033[01;34m\]$(ps1_git_branch)\[\033[00m\]\$ ';
else
    PS1='\w$(ps1_git_branch)\$ '
fi

if [ "$GREEN_BASH_DEBUG" != yes ]; then
    unset color_prompt
fi
