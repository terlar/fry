# Set defaults
set -q fry_rubies       ; or set -gx fry_rubies $HOME/.rubies
set -q fry_auto_switch  ; or set -gx fry_auto_switch 0

# Path
set -l fry_path (dirname (status -f))

if not contains $fry_path/functions $fish_function_path
  set fish_function_path $fry_path/functions $fish_function_path
end

if not contains $fry_path/completions $fish_complete_path
  set fish_complete_path $fry_path/completions $fish_complete_path
end

# Auto-switch
if test $fry_auto_switch = 1
  function __fry_auto_switch --on-variable PWD --description 'Auto-switch ruby version from .ruby-version file'
    status --is-command-substitution; and return

    set -l version_file (__fry_find_version_file)
    test -n "$version_file"; or return

    set -l version_data (cat $version_file)
    test -n "$version_data"; or return

    fry use $version_data
  end

  __fry_auto_switch
end
