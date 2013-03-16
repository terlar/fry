. helper.fish

it 'outputs help' (begin
  assert_greater (count (fry-help)) 0
end)
