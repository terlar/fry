. helper.fish

stub fry-ls 1.9.3 ruby-2.0.0 dummy-1.0.0

it 'matches fuzzily'; begin
  if test (__fry_find_ruby ruby-2.0) = 'ruby-2.0.0'
    pass
  else
    fail
  end
end

it 'matches rubyless'; begin
  if test (__fry_find_ruby ruby-1.9) = '1.9.3'
    pass
  else
    fail
  end
end
