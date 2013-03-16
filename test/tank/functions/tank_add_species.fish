function tank_add_species
  set __tank_species $__tank_species $argv[1]
  set __tank_species_total (math $__tank_species_total + 1)
end
