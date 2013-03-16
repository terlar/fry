. helper.fish

it 'contains system' (begin
  stub fry-current dummy

  function expected
    echo -n '  system'
    set_color normal
  end

  assert_contains (expected) (fry-rubies)
end)

it 'contains rubies' (begin
  stub fry-current dummy

  function expected
    echo -n '  dummy-1'
    set_color normal
  end

  assert_contains (expected) (fry-rubies)
end)

it 'highlights current' (begin
  stub fry-current dummy-1

  function expected
    echo -n '* '
    set_color green
    echo -n dummy-1
    set_color normal
  end

  assert_contains (expected) (fry-rubies)
end)
