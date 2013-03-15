. helper.fish

it 'returns status from command'; begin
  function fry-dummy
    return 1
  end

  fry dummy >/dev/null

  if test $status -eq 1
    pass
  else
    fail
  end
end

it 'outputs rubies without args'; begin
  stub fry-rubies ::rubies::

  if test (fry) = ::rubies::
    pass
  else
    fail
  end
end

it 'outputs help with unknown command'; begin
  stub fry-help ::help::

  if test (fry unknown) = ::help::
    pass
  else
    fail
  end
end

it 'outputs command with known command'; begin
  stub fry-version ::version::

  if test (fry version) = ::version::
    pass
  else
    fail
  end
end

it 'switches ruby with known ruby'; begin
  stub fry-use ::use::

  if test (fry dummy-1) = ::use::
    pass
  else
    fail
  end
end
