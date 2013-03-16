. helper.fish

stub fry-ls 1.9.3 ruby-2.0.0 dummy-1.0.0

it 'matches fuzzily' (begin
  assert_equals 'ruby-2.0.0' (__fry_find_ruby ruby-2.0)
end)

it 'matches rubyless' (begin
  assert_equals '1.9.3' (__fry_find_ruby ruby-1.9)
end)
