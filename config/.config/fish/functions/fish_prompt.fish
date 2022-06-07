function fish_prompt
    set -l __last_command_exit_status $status

    if not set -q -g __fish_arrow_functions_defined
        set -g __fish_arrow_functions_defined
        function _git_branch_name
            set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
            if set -q branch[1]
                echo (string replace -r '^refs/heads/' '' $branch)
            else
                echo (git rev-parse --short HEAD 2>/dev/null)
            end
        end

        function _is_git_dirty
            not command git diff-index --cached --quiet HEAD -- &>/dev/null
            or not command git diff --no-ext-diff --quiet --exit-code &>/dev/null
        end

        function _is_git_repo
            type -q git
            or return 1
            git rev-parse --git-dir >/dev/null 2>&1
        end

        function _hg_branch_name
            echo (hg branch 2>/dev/null)
        end

        function _is_hg_dirty
            set -l stat (hg status -mard 2>/dev/null)
            test -n "$stat"
        end

        function _is_hg_repo
            fish_print_hg_root >/dev/null
        end

        function _repo_branch_name
            _$argv[1]_branch_name
        end

        function _is_repo_dirty
            _is_$argv[1]_dirty
        end

        function _repo_type
            if _is_hg_repo
                echo hg
                return 0
            else if _is_git_repo
                echo git
                return 0
            end
            return 1
        end
    end

    # [c@m] ➜ ~ ( master)
    # set -l cyan (set_color -o cyan)
    # set -l yellow (set_color -o FFD700)
    # set -l red (set_color -o cd5c5c)
    # set -l branch_red (set_color -o CD6090)
    # set -l green (set_color -o A2CD5A)
    # set -l blue (set_color -o 3a5faa)
    # set -l normal (set_color adafb3)

    # [luke@core ~] ( master)
    # Gruvbox theme color [https://github.com/morhetz/gruvbox]
    set -l red (set_color -o fb4934)
    set -l yellow (set_color -o fabd2f)
    set -l green (set_color -o b8bb26)
    set -l blue (set_color -o 83a598)
    set -l purple (set_color -o d3869b)
    set -l branch_red (set_color -o CD6090)

    set -l arrow_color "$green"
    if test $__last_command_exit_status != 0
        set arrow_color "$red"
    end

    set -l arrow "$arrow_color➜ "
    if fish_is_root_user
        set arrow "$arrow_color# "
    end

    # set -l cwd $cyan(basename (prompt_pwd))
    set -l cwd $purple(basename (prompt_pwd))

    set -l repo_info
    if set -l repo_type (_repo_type)
        set -l repo_branch $branch_red(_repo_branch_name $repo_type)
        set repo_info "$blue ($yellow $repo_branch$blue)"

        if _is_repo_dirty $repo_type
            set -l dirty "$yellow ✗"
            set repo_info "$repo_info$dirty"
        end
    end

    # [c@m] ➜ ~ ( master)
    # echo -n -s $blue [$normal c$red @ $normal m$blue] ' ' $arrow $cwd $repo_info $normal ' '

    # [luke@core ~] ( master)
    echo -n -s $red [$yellow luke$green @ $blue core ' '$cwd $red ] $repo_info $normal ' '
end
