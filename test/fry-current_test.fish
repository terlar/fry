. helper.fish

function subject
  fry-current
end

it 'outputs system ruby when not found'; begin
  if test (subject) = system
    pass
  else
    fail
  end
end

it 'outputs current ruby when found'; begin
  set PATH $fry_rubies/dummy-1/bin $PATH

  if test (subject) = dummy-1
    pass
  else
    fail
  end
end
