function suite_fry-env
	function setup
		stub_var fry_rubies (stub_dir)
		mkdir -p $fry_rubies/ruby-1.9/bin
		mkdir -p $fry_rubies/ruby-2.0/bin
		stub_var fish_user_paths $fry_rubies/ruby-1.9/bin
	end

	function test_exit_status
		assert (fry-env)
	end

	function test_returns_posix_compatible_path
		set expected 'export PATH="$(fish -c \'fry current --path\'):$PATH"'
		assert_equal $expected (fry-env)
	end

	function test_returns_posix_compatible_path_for_specific_ruby
		set expected 'export PATH="'$fry_rubies/ruby-2.0/bin':$PATH"'
		assert_equal $expected (fry-env ruby-2.0)
	end
end

source (dirname (status -f))/helper.fish
