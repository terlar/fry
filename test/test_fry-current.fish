function suite_fry-current
	function setup
		stub_var fry_rubies /tmp/rubies
		mkdir -p $fry_rubies/ruby-2.0/bin

		stub_var system_ruby /tmp/system_ruby
		mkdir -p $system_ruby
		touch $system_ruby/ruby
		chmod +x $system_ruby/ruby
	end

	function teardown
		rm -r /tmp/rubies
		rm -rf /tmp/system_ruby
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
		assert_equal '/tmp/rubies/ruby-2.0/bin' (fry-current --path)
	end

	function test_path_option_with_ruby_not_in_path
		stub_var PATH $system_ruby $PATH
		assert (fry-current --path)
		assert_equal $system_ruby (fry-current --path)
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
