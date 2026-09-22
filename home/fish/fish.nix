{ ... }:

{
  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = ''
      '';
      parse_git_branch = ''
        set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
        set -l git_diff (git diff)

        if test -n "$git_diff"
          echo (set_color red)$branch(set_color --reset)
        else
          echo (set_color green)$branch(set_color --reset)
        end
      '';
      fish_prompt = ''
        set_color cyan
        echo -n ' ' 

        printf '%s%s%s@%s%s ' (set_color blue) $USER (set_color --reset) (set_color red) $hostname

        set_color magenta
        printf '%s ' (prompt_pwd | string split /)[-1]

        set -l git_dir (git rev-parse --git-dir 2> /dev/null)
        set_color --reset
        if test -n "$git_dir"
          printf '(%s) ' (parse_git_branch)
        end

        set_color --reset
        echo '> '
      '';
    };
  };

  home.shellAliases = {
    z = "zoxide";
    fetch = "microfetch";
  };
}
