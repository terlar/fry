. helper.fish

context 'without <ruby>'; begin
  stub fry-rubies ::rubies::

  it 'returns status 1' (begin
    refute_status (fry-use)
  end)

  it 'outputs rubies' (begin
    assert_contains ::rubies:: (fry-use)
  end)
end

context 'with unknown <ruby>'; begin
  stub fry-rubies ::rubies::

  it 'returns status 1' (begin
    refute_status (fry-use unknown)
  end)

  it 'outputs rubies' (begin
    assert_contains ::rubies:: (fry-use unknown)
  end)
end

context 'with known <ruby>'; begin
  set -l clean_path $PATH

  it 'returns status 0' (begin
    assert_status (fry-use dummy-1)
  end)
  set PATH $clean_path

  it 'switches ruby' (begin
    fry-use dummy-1 >/dev/null
    assert_equals $PATH[1] $fry_rubies/dummy-1/bin
  end)
  set PATH $clean_path

  set PATH $fry_rubies/dummy-2/bin $PATH
  it 'resets ruby' (begin
    fry-use dummy-1 >/dev/null
    refute_contains $fry_rubies/dummy-2/bin $PATH
  end)
  set PATH $clean_path

  it 'outputs switch text' (begin
    assert_contains "Switched to ruby 'dummy-1'" (fry-use dummy-1)
  end)
  set PATH $clean_path
end

context 'with known and current <ruby>'; begin
  set -l clean_path $PATH

  set PATH $fry_rubies/dummy-1/bin $PATH
  it 'returns status 0' (begin
    assert_status (fry-use dummy-1)
  end)
  set PATH $clean_path

  set PATH $fry_rubies/dummy-1/bin $PATH
  it 'outputs nothing' (begin
    refute (fry-use dummy-1)
  end)
  set PATH $clean_path
end

context 'with system <ruby>'; begin
  set -l clean_path $PATH

  set PATH $fry_rubies/dummy-1/bin $PATH
  it 'returns status 0' (begin
    assert_status (fry-use system)
  end)
  set PATH $clean_path

  set PATH $fry_rubies/dummy-1/bin $PATH
  it 'resets ruby' (begin
    fry-use system
    refute_contains $fry_rubies/dummy-1/bin $PATH
  end)
  set PATH $clean_path

  set PATH $fry_rubies/dummy-1/bin $PATH
  it 'outputs switch text' (begin
    assert_contains 'Switched to system ruby' (fry-use system)
  end)
  set PATH $clean_path
end

context 'with system and current <ruby>'; begin
  set -l clean_path $PATH

  it 'returns status 0' (begin
    assert_status (fry-use system)
  end)

  it 'outputs nothing' (begin
    refute (fry-use system)
  end)
end
