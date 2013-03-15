# Path
set -gx fry_rubies $HOME/.rubies

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
