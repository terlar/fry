# Path
if not set -q fry_rubies
  set -gx fry_rubies $HOME/.rubies
end

if not contains $fry_path/functions $fish_function_path
  set fish_function_path $fry_path/functions $fish_function_path
end

if not contains $fry_path/completions $fish_complete_path
  set fish_complete_path $fry_path/completions $fish_complete_path
end

# Auto-switch
if set -q fry_auto_switch
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
