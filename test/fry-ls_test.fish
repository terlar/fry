. helper.fish

function subject
  fry-ls
end

it 'contains system'; begin
  if contains system (subject)
    pass
  else
    fail
  end
end

it 'contains rubies'; begin
  if contains dummy-1 (subject)
    pass
  else
    fail
  end
end
