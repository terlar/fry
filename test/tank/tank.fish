# Fish Tank
set -l tank_path (dirname (status -f))

if not contains $tank_path/functions $fish_function_path
  set fish_function_path $tank_path/functions $fish_function_path
end

# Species
set -gx __tank_species
set -gx __tank_species_total 0
set -gx __tank_species_passed 0
set -gx __tank_species_failed 0

__tank_fill
__tank_observe

test $__tank_species_failed -eq 0
exit $status
