. helper.fish

function setup_tank
  function fry-dummy  ; return 1; end
  function fry-help   ; echo __help__; end
  function fry-rubies ; echo __rubies__; end
  function fry-version; echo __version__; end
  function fry-use    ; echo __use__; end
end

function spec_status -d 'returns status from command'
  fry dummy
  test $status -eq 1
end

function spec_dashes -d 'handles dashes'
  test (fry --) = __help__
end

function spec_no_args -d 'outputs rubies without args'
  test (fry) = __rubies__
end

function spec_unknown_cmd -d 'outputs help with unknown command'
  test (fry unknown) = __help__
end

function spec_known_cmd -d 'outputs command with known command'
  test (fry version) = __version__
end

function spec_known_ruby -d 'switches ruby with known ruby'
  test (fry dummy-1) = __use__
end

. tank/tank.fish (status -f)
