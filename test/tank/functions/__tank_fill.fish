function __tank_fill
  for func in (functions -n)
    switch $func
      case 'spec_*'
        tank_add_species $func
    end
  end
end
