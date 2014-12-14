function suite_fry-current
	function setup
		stub_var fry_rubies (stub_dir)
		mkdir -p $fry_rubies/ruby-2.0/bin
	end

	function test_ruby_in_path
		stub_var PATH $fry_rubies/ruby-2.0/bin $PATH
		assert (fry-current)
		assert_equal 'ruby-2.0' (fry-current)
	end

	function test_ruby_not_in_path
		assert (fry-current)
		assert_equal 'system' (fry-current)
	end

	function test_path_option_with_ruby_in_path
		stub_var PATH $fry_rubies/ruby-2.0/bin $PATH
		assert (fry-current --path)
		assert_equal "$fry_rubies/ruby-2.0/bin" (fry-current --path)
	end

	function test_path_option_with_ruby_not_in_path
		set -l system_ruby (stub_file ruby)
		set -l system_ruby_path (dirname $system_ruby)
		chmod +x $system_ruby

		stub_var PATH $system_ruby_path $PATH
		assert (fry-current --path)
		assert_equal $system_ruby_path (fry-current --path)
	end

	function test_help_options
		for arg in -h --help
			set -l output (fry-current $arg)
			assert_equal 0 $status
			assert_includes 'usage: fry current [options]' $output
		end
	end

	function test_invalid_options
		set -l output (fry-current --invalid)

		assert_equal 1 $status
		assert_includes "error: unknown option `--invalid'" $output
		assert_includes (fry-current --help) $output
	end
end

if not set -q tank_running
	source (dirname (status -f))/helper.fish
	tank_run
end
