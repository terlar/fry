. helper.fish

function subject
  fry-help
end

it 'outputs help'; begin
  if test (count (subject)) -gt 0
    pass
  else
    fail
  end
end
