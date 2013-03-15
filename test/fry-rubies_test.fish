. helper.fish

function subject
  fry-rubies | col
end

it 'contains system'; begin
  if contains '*32m system' (subject)
    pass
  else
    fail
  end
end

it 'contains rubies'; begin
  if contains '30mBm  dummy-1' (subject)
    pass
  else
    fail
  end
end

it 'contains current'; begin
  stub fry-current dummy-1

  if contains '30mBm*32m dummy-1' (subject)
    pass
  else
    fail
  end
end
