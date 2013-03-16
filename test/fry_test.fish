. helper.fish

it 'returns status from command' (begin
  function fry-dummy; return 1; end
  refute_status (fry dummy)
end)

it 'handles dashes' (begin
  stub fry-help ::help::
  assert_equals (fry --) ::help::
end)

it 'outputs rubies without args' (begin
  stub fry-rubies ::rubies::
  assert_equals (fry) ::rubies::
end)

it 'outputs help with unknown command' (begin
  stub fry-help ::help::
  assert_equals (fry unknown) ::help::
end)

it 'outputs command with known command' (begin
  stub fry-version ::version::
  assert_equals (fry version) ::version::
end)

it 'switches ruby with known ruby' (begin
  stub fry-use ::use::
  assert_equals (fry dummy-1) ::use::
end)
