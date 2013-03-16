. helper.fish

function subject
  fry-rubies | cat
end

it 'contains system'; begin
  function result
    echo -n '* '
    set_color green
    echo -n system
    set_color normal
  end

  if contains (result) (subject)
    pass
  else
    fail
  end
end

it 'contains rubies'; begin
  function result
    echo -n '  dummy-1'
    set_color normal
  end

  if contains (result) (subject)
    pass
  else
    fail
  end
end

it 'highlights current'; begin
  function result
    echo -n '* '
    set_color green
    echo -n dummy-1
    set_color normal
  end

  stub fry-current dummy-1

  if contains (result) (subject)
    pass
  else
    fail
  end
end
