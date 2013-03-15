. helper.fish

function subject
  fry-version
end

it 'returns version'; begin
  if test -n (subject)
    pass
  else
    fail
  end
end
