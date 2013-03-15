. helper.fish

function subject
  fry-rubies
end

it 'contains system'; begin
  function result
    echo -n '*'
    set_color green
    echo -n ' system'
  end

  if contains (result) (subject)
    pass
  else
    fail
  end
end

it 'contains rubies'; begin
  function result
    set_color normal
    echo -n '  dummy-1'
  end

  if contains (result) (subject)
    pass
  else
    fail
  end
end

it 'highlights current'; begin
  function result
    set_color normal
    echo -n '*'
    set_color green
    echo -n ' dummy-1'
  end

  stub fry-current dummy-1

  if contains (result) (subject)
    pass
  else
    fail
  end
end
