function __tank_report
  set -l spec_status $argv[1]
  set -l spec_description (__tank_spec_description $argv[2])
  set -l reporter "__tank_reporter_$tank_reporter"

  if test $spec_status -eq 0
    set __tank_species_passed (math $__tank_species_passed + 1)
  else
    set __tank_species_failed (math $__tank_species_failed + 1)
  end

  if not functions -q $reporter
    set reporter __tank_reporter_dots
  end

  eval "$reporter $spec_status '$spec_description'"
end

function __tank_spec_description
  functions $argv[1] | grep -v '^$' | head -n 1 | sed -E "s|.*'(.*)'.*|\1|"
end
